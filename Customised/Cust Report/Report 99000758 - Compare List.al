report 99000758 "Compare List"
{
    // version NAVW19.00.00.45778

    DefaultLayout = RDLC;
    RDLCLayout = './Compare List.rdlc';
    CaptionML = ENU = 'Compare List',
                ENN = 'Compare List';

    dataset
    {
        dataitem(ItemLoop; "Integer")
        {
            DataItemTableView = SORTING(Number);
            MaxIteration = 1;

            trigger OnPreDataItem();
            begin
                CLEAR(TempExcelBuffer);
                TempExcelBuffer.DELETEALL();

                FOR i := 1 TO 2 DO BEGIN
                    Item[i].GET(Item[i]."No.");
                    Item[i].TESTFIELD("Production BOM No.");
                END;
                BOMMatrixMgt.CompareTwoItems(
                  Item[1],
                  Item[2],
                  "Calc.Date",
                  TRUE,
                  VersionCode1,
                  VersionCode2,
                  UnitOfMeasure1, UnitOfMeasure2);
                ROW := 0;
            end;
        }
        dataitem(BOMLoop; "Integer")
        {
            DataItemTableView = SORTING(Number);
            column(CompanyName; COMPANYNAME)
            {
            }
            column(AsOfCalcDate; Text000 + FORMAT("Calc.Date"))
            {
            }
            column(TodayFormatted; FORMAT(TODAY, 0, 4))
            {
            }
            column(Item1No; Item[1]."No.")
            {
            }
            column(Item2No; Item[2]."No.")
            {
            }
            column(BOMMatrixListItemNo; BOMMatrixList."Item No.")
            {
            }
            column(BOMMatrixListDesc; BOMMatrixList.Description)
            {
            }
            column(CompItemUnitCost; CompItem."Unit Cost")
            {
                AutoFormatType = 2;
            }
            column(Qty1; Qty1)
            {
                DecimalPlaces = 0 : 5;
            }
            column(Cost1; Cost1)
            {
                AutoFormatType = 1;
            }
            column(Qty2; Qty2)
            {
                DecimalPlaces = 0 : 5;
            }
            column(Cost2; Cost2)
            {
                AutoFormatType = 1;
            }
            column(CostDiff; CostDiff)
            {
                AutoFormatType = 1;
            }
            column(CurrReportPageNoCaption; CurrReportPageNoCaptionLbl)
            {
            }
            column(CompareListCaption; CompareListCaptionLbl)
            {
            }
            column(BOMMatrixListItemNoCapt; BOMMatrixListItemNoCaptLbl)
            {
            }
            column(BOMMatrixListDescCapt; BOMMatrixListDescCaptLbl)
            {
            }
            column(CompItemUnitCostCapt; CompItemUnitCostCaptLbl)
            {
            }
            column(CostDiffCaption; CostDiffCaptionLbl)
            {
            }
            column(Item1NoCaption; Item1NoCaptionLbl)
            {
            }
            column(Item2NoCaption; Item2NoCaptionLbl)
            {
            }
            column(TotalCostDifferenceCapt; TotalCostDifferenceCaptLbl)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF First THEN BEGIN
                    IF NOT BOMMatrixMgt.FindRecord('-', BOMMatrixList) THEN
                        CurrReport.BREAK;
                    First := FALSE;
                END ELSE
                    IF BOMMatrixMgt.NextRecord(1, BOMMatrixList) = 0 THEN
                        CurrReport.BREAK;

                Qty1 := BOMMatrixMgt.GetComponentNeed(BOMMatrixList."Item No.", BOMMatrixList."Variant Code", Item[1]."No.");
                Qty2 := BOMMatrixMgt.GetComponentNeed(BOMMatrixList."Item No.", BOMMatrixList."Variant Code", Item[2]."No.");

                CompItem.GET(BOMMatrixList."Item No.");

                Cost1 := CompItem."Unit Cost" * Qty1;
                Cost2 := CompItem."Unit Cost" * Qty2;
                CostDiff := Cost1 - Cost2;
            end;

            trigger OnPreDataItem();
            begin
                CurrReport.CREATETOTALS(CostDiff);

                First := TRUE;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    CaptionML = ENU = 'Options',
                                ENN = 'Options';
                    field(ItemNo1; Item[1]."No.")
                    {
                        CaptionML = ENU = 'Item No. 1',
                                    ENN = 'Item No. 1';
                        DrillDownPageID = "Item List";
                        LookupPageID = "Item List";
                        NotBlank = true;
                        TableRelation = Item;

                        trigger OnLookup(Text: Text): Boolean;
                        begin
                            Item[1].SETCURRENTKEY("Production BOM No.");
                            Item[1].SETFILTER("Production BOM No.", '<>%1', '');
                            IF PAGE.RUNMODAL(PAGE::"Item List", Item[1]) = ACTION::LookupOK THEN BEGIN
                                Text := Item[1]."No.";
                                EXIT(TRUE);
                            END;
                            EXIT(FALSE);
                        end;

                        trigger OnValidate();
                        begin
                            Item[1].GET(Item[1]."No.");
                            Item[1].TESTFIELD("Production BOM No.");

                            IF Item[1]."No." = Item[2]."No." THEN
                                Item[1].FIELDERROR("No.");
                        end;
                    }
                    field(ItemNo2; Item[2]."No.")
                    {
                        CaptionML = ENU = 'Item No. 2',
                                    ENN = 'Item No. 2';
                        LookupPageID = "Item List";
                        NotBlank = true;
                        TableRelation = Item;

                        trigger OnLookup(Text: Text): Boolean;
                        begin
                            Item[2].SETCURRENTKEY("Production BOM No.");
                            Item[2].SETFILTER("Production BOM No.", '<>%1', '');
                            IF PAGE.RUNMODAL(PAGE::"Item List", Item[2]) = ACTION::LookupOK THEN BEGIN
                                Text := Item[2]."No.";
                                EXIT(TRUE);
                            END;
                            EXIT(FALSE);
                        end;

                        trigger OnValidate();
                        begin
                            Item[2].GET(Item[2]."No.");
                            Item[2].TESTFIELD("Production BOM No.");

                            IF Item[1]."No." = Item[2]."No." THEN
                                Item[2].FIELDERROR("No.");
                        end;
                    }
                    field(CalculationDt; "Calc.Date")
                    {
                        CaptionML = ENU = 'Calculation Date',
                                    ENN = 'Calculation Date';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnInit();
        begin
            "Calc.Date" := WORKDATE;
        end;
    }

    labels
    {
        label(Qty1Caption; ENU = 'Exploded Quantity',
                          ENN = 'Exploded Quantity')
        label(Cost1Caption; ENU = 'Cost Share',
                           ENN = 'Cost Share')
    }

    trigger OnPostReport();
    begin
        IF Excel THEN BEGIN
            TempExcelBuffer.CreateBook('', ''); //EFFUPG
                                                //TempExcelBuffer.CreateSheet('"Production BOM Header"."No."','',COMPANYNAME,'');//B2B
            TempExcelBuffer.GiveUserControl;
        END;
    end;

    var
        Text000: TextConst ENU = 'As of ', ENN = 'As of ';
        Item: array[2] of Record Item;
        CompItem: Record Item;
        BOMMatrixList: Record "Production Matrix BOM Line";
        BOMMatrixMgt: Codeunit "BOM Matrix Management";
        "Calc.Date": Date;
        i: Integer;
        First: Boolean;
        VersionCode1: Code[10];
        VersionCode2: Code[10];
        UnitOfMeasure1: Code[10];
        UnitOfMeasure2: Code[10];
        Qty1: Decimal;
        Qty2: Decimal;
        Cost1: Decimal;
        Cost2: Decimal;
        CostDiff: Decimal;
        CurrReportPageNoCaptionLbl: TextConst ENU = 'Page', ENN = 'Page';
        CompareListCaptionLbl: TextConst ENU = 'Compare List', ENN = 'Compare List';
        BOMMatrixListItemNoCaptLbl: TextConst ENU = 'No.', ENN = 'No.';
        BOMMatrixListDescCaptLbl: TextConst ENU = 'Description', ENN = 'Description';
        CompItemUnitCostCaptLbl: TextConst ENU = 'Unit Cost', ENN = 'Unit Cost';
        CostDiffCaptionLbl: TextConst ENU = 'Difference Cost', ENN = 'Difference Cost';
        Item1NoCaptionLbl: TextConst ENU = 'Item No. 1', ENN = 'Item No. 1';
        Item2NoCaptionLbl: TextConst ENU = 'Item No. 2', ENN = 'Item No. 2';
        TotalCostDifferenceCaptLbl: TextConst ENU = 'Total Cost Difference', ENN = 'Total Cost Difference';
        Desc1: Text[30];
        Desc2: Text[30];
        PBH: Record "Production BOM Header";
        QtyDiff: Decimal;
        TempExcelBuffer: Record "Excel Buffer";
        ROW: Integer;
        Excel: Boolean;
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Compare_ListCaptionLbl: Label 'Compare List';
        BOMMatrixList__Item_No__CaptionLbl: Label 'No.';
        BOMMatrixList_DescriptionCaptionLbl: Label 'Description';
        CompItem__Unit_Cost_CaptionLbl: Label 'Unit Cost';
        Qty1CaptionLbl: Label 'Exploded Quantity';
        Cost1CaptionLbl: Label 'Cost Share';
        Qty2CaptionLbl: Label 'Exploded Quantity';
        Cost2CaptionLbl: Label 'Cost Share';
        Item_1___No__CaptionLbl: Label 'Item No. 1';
        EmptyStringCaptionLbl: Label '.';
        EmptyStringCaption_Control28Lbl: Label '.';
        Qty_DifferenceCaptionLbl: Label 'Qty Difference';
        Total_Cost_DifferenceCaptionLbl: Label 'Total Cost Difference';

    (22909)]
    procedure Entercell(RowNo: Integer; ColumnNo: Integer; CellValue: Text[1000]; bold: Boolean);
    begin
        TempExcelBuffer.INIT;
        TempExcelBuffer.VALIDATE("Row No.", RowNo);
        TempExcelBuffer.VALIDATE("Column No.", ColumnNo);
        TempExcelBuffer."Cell Value as Text" := CellValue;
        TempExcelBuffer.Bold := bold;

        TempExcelBuffer.INSERT;
    end;

    (22918)]
    procedure EnterHeadings(RowNo: Integer; ColumnNo: Integer; CellValue: Text[100]; Bold: Boolean);
    begin
        TempExcelBuffer.INIT;
        TempExcelBuffer.VALIDATE("Row No.", RowNo);
        TempExcelBuffer.VALIDATE("Column No.", ColumnNo);
        TempExcelBuffer."Cell Value as Text" := FORMAT(CellValue);
        TempExcelBuffer.Bold := Bold;

        TempExcelBuffer.Formula := '';
        TempExcelBuffer.INSERT;
    end;

    (22928)]
    procedure "Entercell New"();
    begin
    end;

    (22931)]
    procedure InitializeRequest(NewItem1: Code[20]; NewItem2: Code[20]; NewCalculateDate: Date);
    begin
        Item[1]."No." := NewItem1;
        Item[2]."No." := NewItem2;
        "Calc.Date" := NewCalculateDate;
    end;
}

