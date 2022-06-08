codeunit 99000769 "Production BOM-Check"
{
    // version NAVW19.00.00.45778

    Permissions = TableData Item = r,
                  TableData "Routing Line" = r,
                  TableData "Manufacturing Setup" = r;
    TableNo = "Production BOM Header";

    trigger OnRun();
    begin
        Code(Rec, '');
    end;

    var
        Text000: TextConst ENU = 'Checking Item           #1########## @2@@@@@@@@@@@@@', ENN = 'Checking Item           #1########## @2@@@@@@@@@@@@@';
        Text001: TextConst ENU = 'The maximum number of BOM levels, %1, was exceeded. The process stopped at item number %2, BOM header number %3, BOM level %4.', ENN = 'The maximum number of BOM levels, %1, was exceeded. The process stopped at item number %2, BOM header number %3, BOM level %4.';
        Text003: TextConst ENU = '%1 with %2 %3 cannot be found. Check %4 %5 %6 %7.', ENN = '%1 with %2 %3 cannot be found. Check %4 %5 %6 %7.';
        Item: Record Item;
        ItemUnitOfMeasure: Record "Item Unit of Measure";
        RtngLine: Record "Routing Line";
        MfgSetup: Record "Manufacturing Setup";
        VersionMgt: Codeunit VersionManagement;
        CalcLowLevel: Codeunit "Calculate Low-Level Code";
        Window: Dialog;
        NoOfItems: Integer;
        ItemCounter: Integer;

    (51922)]
    procedure "Code"(var ProdBOMHeader: Record "Production BOM Header"; VersionCode: Code[20]);
    begin
        ProdBOMHeader.TESTFIELD("Unit of Measure Code");
        MfgSetup.GET;
        IF MfgSetup."Dynamic Low-Level Code" THEN BEGIN
            CalcLowLevel.SetActualProdBOM(ProdBOMHeader);
            ProdBOMHeader."Low-Level Code" := CalcLowLevel.CalcLevels(2, ProdBOMHeader."No.", ProdBOMHeader."Low-Level Code", 1);
            //MESSAGE('%1',ProdBOMHeader."Low-Level Code");
            CalcLowLevel.RecalcLowerLevels(ProdBOMHeader."No.", ProdBOMHeader."Low-Level Code", FALSE);
            ProdBOMHeader.MODIFY;
        END;

        Item.SETCURRENTKEY("Production BOM No.");
        Item.SETRANGE("Production BOM No.", ProdBOMHeader."No.");

        IF Item.FINDFIRST THEN BEGIN
            IF GUIALLOWED THEN
                Window.OPEN(Text000);
            NoOfItems := Item.COUNT;
            ItemCounter := 0;
            REPEAT
                ItemCounter := ItemCounter + 1;

                IF GUIALLOWED THEN BEGIN
                    Window.UPDATE(1, Item."No.");
                    Window.UPDATE(2, ROUND(ItemCounter / NoOfItems * 10000, 1));
                END;
                IF MfgSetup."Dynamic Low-Level Code" THEN
                    CalcLowLevel.RUN(Item);
                IF Item."Routing No." <> '' THEN
                    CheckBOMStructure(ProdBOMHeader."No.", VersionCode, 1);
                ItemUnitOfMeasure.GET(Item."No.", ProdBOMHeader."Unit of Measure Code");
            UNTIL Item.NEXT = 0;
        END;
    end;

    (51956)]
    local procedure CheckBOMStructure(BOMHeaderNo: Code[20]; VersionCode: Code[20]; Level: Integer);
    var
        ProdBOMHeader: Record "Production BOM Header";
        ProdBOMComponent: Record "Production BOM Line";
    begin
        IF Level > 99 THEN
            ERROR(
              Text001,
              99, BOMHeaderNo, Item."Production BOM No.", Level);

        ProdBOMHeader.GET(BOMHeaderNo);

        ProdBOMComponent.SETRANGE("Production BOM No.", BOMHeaderNo);
        ProdBOMComponent.SETRANGE("Version Code", VersionCode);
        ProdBOMComponent.SETFILTER("No.", '<>%1', '');

        IF ProdBOMComponent.FINDFIRST THEN
            REPEAT
                CASE ProdBOMComponent.Type OF
                    ProdBOMComponent.Type::Item:
                        IF ProdBOMComponent."Routing Link Code" <> '' THEN BEGIN
                            Item.TESTFIELD("Routing No.");
                            RtngLine.SETRANGE("Routing No.", Item."Routing No.");
                            RtngLine.SETRANGE("Routing Link Code", ProdBOMComponent."Routing Link Code");
                            IF NOT RtngLine.FINDFIRST THEN
                                ERROR(
                                  Text003,
                                  RtngLine.TABLECAPTION,
                                  RtngLine.FIELDCAPTION("Routing Link Code"),
                                  ProdBOMComponent."Routing Link Code",
                                  ProdBOMComponent.FIELDCAPTION("Production BOM No."),
                                  ProdBOMComponent."Production BOM No.",
                                  ProdBOMComponent.FIELDCAPTION("Line No."),
                                  ProdBOMComponent."Line No.");
                        END;
                    ProdBOMComponent.Type::"Production BOM":
                        CheckBOMStructure(
                          ProdBOMComponent."No.",
                          VersionMgt.GetBOMVersion(ProdBOMComponent."No.", WORKDATE, TRUE), Level + 1);
                END;
            UNTIL ProdBOMComponent.NEXT = 0;
    end;

    (51994)]
    procedure ProdBOMLineCheck(ProdBOMNo: Code[20]; VersionCode: Code[20]);
    var
        ProdBOMLine: Record "Production BOM Line";
    begin
        ProdBOMLine.SETRANGE("Production BOM No.", ProdBOMNo);
        ProdBOMLine.SETRANGE("Version Code", VersionCode);
        ProdBOMLine.SETFILTER(Type, '<>%1', ProdBOMLine.Type::" ");
        ProdBOMLine.SETRANGE("No.", '');
        IF ProdBOMLine.FINDFIRST THEN
            ProdBOMLine.FIELDERROR("No.");
    end;
}

