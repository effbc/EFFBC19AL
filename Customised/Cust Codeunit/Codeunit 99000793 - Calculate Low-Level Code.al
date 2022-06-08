codeunit 99000793 "Calculate Low-Level Code"
{
    // version NAVW17.10

    Permissions = TableData Item = rm,
                  TableData "Manufacturing Setup" = r;
    TableNo = Item;

    trigger OnRun();
    var
        ProdBOM: Record "Production BOM Header";
        Item2: Record Item;
    begin
        Item2.COPY(Rec);
        Item := Item2; // to store the last item- used in RecalcLowerLevels
        Item2."Low-Level Code" := CalcLevels(1, Item2."No.", 0, 0);
        IF ProdBOM.GET(Item."Production BOM No.") THEN
            SetRecursiveLevelsOnBOM(ProdBOM, Item2."Low-Level Code" + 1, FALSE);
        Item2.MODIFY;
        COPY(Item2);
    end;

    var
        ProdBomErr: TextConst ENU = 'The maximum number of BOM levels, %1, was exceeded. The process stopped at item number %2, BOM header number %3, BOM level %4.', ENN = 'The maximum number of BOM levels, %1, was exceeded. The process stopped at item number %2, BOM header number %3, BOM level %4.';
        Item: Record Item;
        ActualProdBOM: Record "Production BOM Header";

    (55566)]
    procedure CalcLevels(Type: Option " ",Item,"Production BOM",Assembly; No: Code[20]; Level: Integer; LevelDepth: Integer): Integer;
    var
        Item2: Record Item;
        ProdBOMHeader: Record "Production BOM Header";
        ProdBOMLine: Record "Production BOM Line";
        AsmBOMComp: Record "BOM Component";
        ProductionBOMVersion: Record "Production BOM Version";
        ActLevel: Integer;
        TotalLevels: Integer;
        CalculateDeeperLevel: Boolean;
    begin
        IF LevelDepth > 50 THEN
            ERROR(ProdBomErr, 50, Item."No.", No, Level);

        TotalLevels := Level;

        CASE Type OF
            Type::"Production BOM":
                BEGIN
                    Item2.SETCURRENTKEY("Production BOM No.");
                    Item2.SETRANGE("Production BOM No.", No);
                    IF Item2.FINDSET THEN
                        REPEAT
                            ActLevel := CalcLevels(Type::Item, Item2."No.", Level + 1, LevelDepth + 1);
                            IF ActLevel > TotalLevels THEN
                                TotalLevels := ActLevel;
                        UNTIL Item2.NEXT = 0;
                END;
            Type::Assembly:
                BEGIN
                    Item2.GET(No);
                    ActLevel := CalcLevels(Type::Item, Item2."No.", Level + 1, LevelDepth + 1);
                    IF ActLevel > TotalLevels THEN
                        TotalLevels := ActLevel;
                END;
            ELSE
                Item2.GET(No);
        END;

        AsmBOMComp.SETCURRENTKEY(Type, "No.");
        AsmBOMComp.SETRANGE(Type, Type);
        AsmBOMComp.SETRANGE("No.", No);
        IF AsmBOMComp.FINDSET THEN
            REPEAT
                ActLevel := CalcLevels(Type::Assembly, AsmBOMComp."Parent Item No.", Level, LevelDepth + 1);
                IF ActLevel > TotalLevels THEN
                    TotalLevels := ActLevel;
            UNTIL AsmBOMComp.NEXT = 0;

        ProdBOMLine.SETCURRENTKEY(Type, "No.");
        ProdBOMLine.SETRANGE(Type, Type);
        ProdBOMLine.SETRANGE("No.", No);
        IF ProdBOMLine.FINDSET THEN
            REPEAT
                IF ProdBOMHeader.GET(ProdBOMLine."Production BOM No.") THEN BEGIN
                    IF ProdBOMHeader."No." = ActualProdBOM."No." THEN
                        ERROR(ProdBomErr, 50, Item."No.", No, Level);

                    IF ProdBOMLine."Version Code" <> '' THEN BEGIN
                        ProductionBOMVersion.GET(ProdBOMLine."Production BOM No.", ProdBOMLine."Version Code");
                        CalculateDeeperLevel := ProductionBOMVersion.Status = ProductionBOMVersion.Status::Certified;
                    END ELSE
                        CalculateDeeperLevel := ProdBOMHeader.Status = ProdBOMHeader.Status::Certified;

                    IF CalculateDeeperLevel THEN BEGIN
                        ActLevel := CalcLevels(Type::"Production BOM", ProdBOMLine."Production BOM No.", Level, LevelDepth + 1);
                        IF ActLevel > TotalLevels THEN
                            TotalLevels := ActLevel;
                    END;
                END;
            UNTIL ProdBOMLine.NEXT = 0;

        EXIT(TotalLevels);
    end;

    (55630)]
    procedure RecalcLowerLevels(ProdBOMNo: Code[20]; LowLevelCode: Integer; IgnoreMissingItemsOrBOMs: Boolean);
    var
        CompItem: Record Item;
        CompBOM: Record "Production BOM Header";
        ProdBOMLine: Record "Production BOM Line";
        ProductionBOMVersion: Record "Production BOM Version";
        EntityPresent: Boolean;
        CalculateDeeperLevel: Boolean;
    begin
        /*
        IF LowLevelCode = 50 THEN
          MESSAGE('%1',ProdBOMNo);
        */
        IF LowLevelCode > 50 THEN
            ERROR(ProdBomErr, 50, Item."No.", ProdBOMNo, LowLevelCode);

        ProdBOMLine.SETRANGE("Production BOM No.", ProdBOMNo);
        ProdBOMLine.SETFILTER("No.", '<>%1', '');

        IF ProdBOMLine.FINDSET THEN
            REPEAT
                IF ProdBOMLine."Version Code" <> '' THEN BEGIN
                    ProductionBOMVersion.GET(ProdBOMLine."Production BOM No.", ProdBOMLine."Version Code");
                    CalculateDeeperLevel := ProductionBOMVersion.Status <> ProductionBOMVersion.Status::Closed;
                END ELSE BEGIN
                    CompBOM.GET(ProdBOMLine."Production BOM No.");
                    CalculateDeeperLevel := CompBOM.Status <> CompBOM.Status::Closed;
                END;

                // closed BOMs are skipped
                IF CalculateDeeperLevel THEN
                    CASE ProdBOMLine.Type OF
                        ProdBOMLine.Type::Item:
                            BEGIN
                                EntityPresent := CompItem.GET(ProdBOMLine."No.");
                                //MESSAGE('Component Item%1',CompItem);
                                IF EntityPresent OR (NOT IgnoreMissingItemsOrBOMs) THEN
                                    SetRecursiveLevelsOnItem(CompItem, LowLevelCode, IgnoreMissingItemsOrBOMs);
                            END;
                        ProdBOMLine.Type::"Production BOM":
                            BEGIN
                                EntityPresent := CompBOM.GET(ProdBOMLine."No.");
                                IF EntityPresent OR (NOT IgnoreMissingItemsOrBOMs) THEN
                                    SetRecursiveLevelsOnBOM(CompBOM, LowLevelCode, IgnoreMissingItemsOrBOMs);
                            END
                    END;
            UNTIL ProdBOMLine.NEXT = 0;

    end;

    (55670)]
    procedure RecalcAsmLowerLevels(ParentItemNo: Code[20]; LowLevelCode: Integer; IgnoreMissingItemsOrBOMs: Boolean);
    var
        CompItem: Record Item;
        BOMComp: Record "BOM Component";
        EntityPresent: Boolean;
    begin
        IF LowLevelCode > 50 THEN
            ERROR(ProdBomErr, 50, Item."No.", Item."No.", LowLevelCode);

        BOMComp.SETRANGE("Parent Item No.", ParentItemNo);
        BOMComp.SETRANGE(Type, BOMComp.Type::Item);
        BOMComp.SETFILTER("No.", '<>%1', '');
        IF BOMComp.FINDSET THEN
            REPEAT
                EntityPresent := CompItem.GET(BOMComp."No.");
                IF EntityPresent OR NOT IgnoreMissingItemsOrBOMs THEN
                    SetRecursiveLevelsOnItem(CompItem, LowLevelCode, IgnoreMissingItemsOrBOMs);
            UNTIL BOMComp.NEXT = 0;
    end;

    (55684)]
    procedure SetRecursiveLevelsOnItem(var CompItem: Record Item; LowLevelCode: Integer; IgnoreMissingItemsOrBOMs: Boolean);
    var
        CompBOM: Record "Production BOM Header";
        xLowLevelCode: Integer;
        EntityPresent: Boolean;
    begin
        Item := CompItem; // to store the last item- used in RecalcLowerLevels
        xLowLevelCode := CompItem."Low-Level Code";
        CompItem."Low-Level Code" := GetMax(Item."Low-Level Code", LowLevelCode);
        IF xLowLevelCode <> CompItem."Low-Level Code" THEN BEGIN
            CompItem.CALCFIELDS("Assembly BOM");
            IF CompItem."Assembly BOM" THEN
                RecalcAsmLowerLevels(CompItem."No.", CompItem."Low-Level Code" + 1, IgnoreMissingItemsOrBOMs);
            IF CompItem."Production BOM No." <> '' THEN BEGIN
                // calc low level code for BOM set in the item
                EntityPresent := CompBOM.GET(CompItem."Production BOM No.");
                IF EntityPresent OR (NOT IgnoreMissingItemsOrBOMs) THEN
                    SetRecursiveLevelsOnBOM(CompBOM, CompItem."Low-Level Code" + 1, IgnoreMissingItemsOrBOMs);
            END;
            CompItem.MODIFY;
        END;
    end;

    (55701)]
    local procedure SetRecursiveLevelsOnBOM(var CompBOM: Record "Production BOM Header"; LowLevelCode: Integer; IgnoreMissingItemsOrBOMs: Boolean);
    var
        xLowLevelCode: Integer;
    begin
        xLowLevelCode := CompBOM."Low-Level Code";
        IF CompBOM.Status = CompBOM.Status::Certified THEN BEGIN
            // set low level on this BOM
            CompBOM."Low-Level Code" := GetMax(CompBOM."Low-Level Code", LowLevelCode);
            IF xLowLevelCode <> CompBOM."Low-Level Code" THEN BEGIN
                RecalcLowerLevels(CompBOM."No.", LowLevelCode, IgnoreMissingItemsOrBOMs);
                CompBOM.MODIFY;
            END;
        END;
    end;

    (55712)]
    local procedure GetMax(Level1: Integer; Level2: Integer) Result: Integer;
    begin
        IF Level1 > Level2 THEN
            Result := Level1
        ELSE
            Result := Level2;
    end;

    (55718)]
    procedure SetActualProdBOM(ActualProdBOM2: Record "Production BOM Header");
    begin
        ActualProdBOM := ActualProdBOM2;
    end;
}

