codeunit 99000770 "Where-Used Management"
{
    // version NAVW19.00.00.47838

    Permissions = TableData "Production BOM Header" = r,
                  TableData "Production BOM Version" = r,
                  TableData "Where-Used Line" = imd;

    trigger OnRun();
    begin
    end;

    var
        WhereUsedList: Record "Where-Used Line" temporary;
        UOMMgt: Codeunit "Unit of Measure Management";
        VersionMgt: Codeunit VersionManagement;
        CostCalcMgt: Codeunit "Cost Calculation Management";
        MultiLevel: Boolean;
        NextWhereUsedEntryNo: Integer;

    [LineStart(52004)]
    procedure FindRecord(Which: Text[30]; var WhereUsedList2: Record "Where-Used Line"): Boolean;
    begin
        WhereUsedList.COPY(WhereUsedList2);
        IF NOT WhereUsedList.FIND(Which) THEN
            EXIT(FALSE);
        WhereUsedList2 := WhereUsedList;

        EXIT(TRUE);
    end;

    [LineStart(52012)]
    procedure NextRecord(Steps: Integer; var WhereUsedList2: Record "Where-Used Line"): Integer;
    var
        CurrentSteps: Integer;
    begin
        WhereUsedList.COPY(WhereUsedList2);
        CurrentSteps := WhereUsedList.NEXT(Steps);
        IF CurrentSteps <> 0 THEN
            WhereUsedList2 := WhereUsedList;

        EXIT(CurrentSteps);
    end;

    [LineStart(52020)]
    procedure WhereUsedFromItem(Item: Record Item; "Calc.Date": Date; NewMultiLevel: Boolean);
    begin
        WhereUsedList.DELETEALL;
        NextWhereUsedEntryNo := 1;
        MultiLevel := NewMultiLevel;

        BuildWhereUsedList(1, Item."No.", "Calc.Date", 1, 1);
    end;

    [LineStart(52027)]
    procedure WhereUsedFromProdBOM(ProdBOM: Record "Production BOM Header"; "Calc.Date": Date; NewMultiLevel: Boolean);
    begin
        WhereUsedList.DELETEALL;
        NextWhereUsedEntryNo := 1;
        MultiLevel := NewMultiLevel;

        BuildWhereUsedList(2, ProdBOM."No.", "Calc.Date", 1, 1);
    end;

    [LineStart(52034)]
    local procedure BuildWhereUsedList(Type: Option " ",Item,"Production BOM"; No: Code[20]; "Calc.Date": Date; Level: Integer; Quantity: Decimal);
    var
        ItemAssembly: Record Item;
        ProdBOMComponent: Record "Production BOM Line";
    begin
        IF Level > 30 THEN
            EXIT;

        IF Type = Type::"Production BOM" THEN BEGIN
            ItemAssembly.SETCURRENTKEY("Production BOM No.");
            ItemAssembly.SETRANGE("Production BOM No.", No);
            IF ItemAssembly.FINDSET THEN
                REPEAT
                    WhereUsedList."Entry No." := NextWhereUsedEntryNo;
                    WhereUsedList."Item No." := ItemAssembly."No.";
                    WhereUsedList.Description := ItemAssembly.Description;
                    WhereUsedList."Level Code" := Level;
                    WhereUsedList."Quantity Needed" :=
                      Quantity *
                      (1 + ItemAssembly."Scrap %" / 100) *
                      UOMMgt.GetQtyPerUnitOfMeasure(
                        ItemAssembly,
                        ItemAssembly."Base Unit of Measure") /
                      UOMMgt.GetQtyPerUnitOfMeasure(
                        ItemAssembly,
                        VersionMgt.GetBOMUnitOfMeasure(
                          ItemAssembly."Production BOM No.",
                          VersionMgt.GetBOMVersion(
                            ItemAssembly."Production BOM No.",
                            "Calc.Date", FALSE)));
                    WhereUsedList."Version Code" := VersionMgt.GetBOMVersion(No, "Calc.Date", FALSE);// changed to false by swathi on 25-sep-13
                    WhereUsedList.INSERT;
                    NextWhereUsedEntryNo := NextWhereUsedEntryNo + 1;
                    IF MultiLevel THEN
                        BuildWhereUsedList(
                          1,
                          ItemAssembly."No.",
                          "Calc.Date",
                          Level + 1,
                          WhereUsedList."Quantity Needed");
                UNTIL ItemAssembly.NEXT = 0;
        END;

        ProdBOMComponent.SETCURRENTKEY(Type, "No.");
        ProdBOMComponent.SETRANGE(Type, Type);
        ProdBOMComponent.SETRANGE("No.", No);
        IF "Calc.Date" <> 0D THEN BEGIN
            ProdBOMComponent.SETFILTER("Starting Date", '%1|..%2', 0D, "Calc.Date");
            ProdBOMComponent.SETFILTER("Ending Date", '%1|%2..', 0D, "Calc.Date");
        END;

        IF ProdBOMComponent.FINDSET THEN
            REPEAT
                IF VersionMgt.GetBOMVersion(
                     ProdBOMComponent."Production BOM No.", "Calc.Date", TRUE) =
                   ProdBOMComponent."Version Code"
                THEN BEGIN
                    IF IsActiveProductionBOM(ProdBOMComponent) THEN
                        BuildWhereUsedList(
                          2,
                          ProdBOMComponent."Production BOM No.",
                          "Calc.Date",
                          Level,
                          CostCalcMgt.CalcCompItemQtyBase(ProdBOMComponent, "Calc.Date", Quantity, '', FALSE));
                END;
            UNTIL ProdBOMComponent.NEXT = 0;
    end;

    [LineStart(52097)]
    local procedure IsActiveProductionBOM(ProductionBOMLine: Record "Production BOM Line"): Boolean;
    begin
        IF ProductionBOMLine."Version Code" = '' THEN
            EXIT(NOT IsProductionBOMClosed(ProductionBOMLine));

        EXIT(NOT IsProdBOMVersionClosed(ProductionBOMLine));
    end;

    [LineStart(52103)]
    local procedure IsProductionBOMClosed(ProductionBOMLine: Record "Production BOM Line"): Boolean;
    var
        ProdBOMHeader: Record "Production BOM Header";
    begin
        ProdBOMHeader.GET(ProductionBOMLine."Production BOM No.");
        EXIT(ProdBOMHeader.Status = ProdBOMHeader.Status::Closed);
    end;

    [LineStart(52107)]
    local procedure IsProdBOMVersionClosed(ProductionBOMLine: Record "Production BOM Line"): Boolean;
    var
        ProductionBOMVersion: Record "Production BOM Version";
    begin
        ProductionBOMVersion.GET(ProductionBOMLine."Production BOM No.", ProductionBOMLine."Version Code");
        EXIT(ProductionBOMVersion.Status = ProductionBOMVersion.Status::Closed);
    end;
}

