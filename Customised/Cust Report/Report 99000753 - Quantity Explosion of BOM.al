report 99000753 "Quantity Explosion of BOM"
{
    // version NAVW19.00.00.45778

    DefaultLayout = RDLC;
    RDLCLayout = './Quantity Explosion of BOM.rdlc';
    CaptionML = ENU = 'Quantity Explosion of BOM',
                ENN = 'Quantity Explosion of BOM';

    dataset
    {
        dataitem(Item; Item)
        {
            DataItemTableView = SORTING(No.);
            RequestFilterFields = "No.", "Search Description", "Inventory Posting Group";
            column(AsOfCalcDate; Text000 + FORMAT(CalculateDate))
            {
            }
            column(CompanyName; COMPANYNAME)
            {
            }
            column(TodayFormatted; FORMAT(TODAY, 0, 4))
            {
            }
            column(ItemTableCaptionFilter; TABLECAPTION + ': ' + ItemFilter)
            {
            }
            column(ItemFilter; ItemFilter)
            {
            }
            column(No_Item; "No.")
            {
            }
            column(Desc_Item; Description)
            {
            }
            column(QtyExplosionofBOMCapt; QtyExplosionofBOMCaptLbl)
            {
            }
            column(CurrReportPageNoCapt; CurrReportPageNoCaptLbl)
            {
            }
            column(BOMQtyCaption; BOMQtyCaptionLbl)
            {
            }
            column(BomCompLevelQtyCapt; BomCompLevelQtyCaptLbl)
            {
            }
            column(BomCompLevelDescCapt; BomCompLevelDescCaptLbl)
            {
            }
            column(BomCompLevelNoCapt; BomCompLevelNoCaptLbl)
            {
            }
            column(LevelCapt; LevelCaptLbl)
            {
            }
            column(BomCompLevelUOMCodeCapt; BomCompLevelUOMCodeCaptLbl)
            {
            }
            dataitem(BOMLoop; "Integer")
            {
                DataItemTableView = SORTING(Number);
                dataitem("Integer"; "Integer")
                {
                    DataItemTableView = SORTING(Number);
                    MaxIteration = 1;
                    column(BomCompLevelNo; BomComponent[Level]."No.")
                    {
                    }
                    column(BomCompLevelDesc; BomComponent[Level].Description)
                    {
                    }
                    column(BOMQty; BOMQty)
                    {
                        DecimalPlaces = 0 : 5;
                    }
                    column(FormatLevel; PADSTR('', Level, ' ') + FORMAT(Level))
                    {
                    }
                    column(BomCompLevelQty; BomComponent[Level].Quantity)
                    {
                        DecimalPlaces = 0 : 5;
                    }
                    column(BomCompLevelUOMCode; BomComponent[Level]."Unit of Measure Code")
                    {
                        DecimalPlaces = 0 : 5;
                    }

                    trigger OnAfterGetRecord();
                    begin
                        BOMQty := Quantity[Level] * QtyPerUnitOfMeasure * BomComponent[Level].Quantity;
                    end;

                    trigger OnPostDataItem();
                    begin
                        Level := NextLevel;
                    end;
                }

                trigger OnAfterGetRecord();
                var
                    BomItem: Record Item;
                begin
                    WHILE BomComponent[Level].NEXT = 0 DO BEGIN
                        Level := Level - 1;
                        IF Level < 1 THEN
                            CurrReport.BREAK;
                    END;

                    NextLevel := Level;
                    CLEAR(CompItem);
                    QtyPerUnitOfMeasure := 1;
                    CASE BomComponent[Level].Type OF
                        BomComponent[Level].Type::Item:
                            BEGIN
                                CompItem.GET(BomComponent[Level]."No.");
                                IF CompItem."Production BOM No." <> '' THEN BEGIN
                                    ProdBOM.GET(CompItem."Production BOM No.");
                                    IF ProdBOM.Status = ProdBOM.Status::Closed THEN
                                        CurrReport.SKIP;
                                    NextLevel := Level + 1;
                                    IF Level > 1 THEN
                                        IF (NextLevel > 50) OR (BomComponent[Level]."No." = NoList[Level - 1]) THEN
                                            ERROR(ProdBomErr, 50, Item."No.", NoList[Level], Level);
                                    CLEAR(BomComponent[NextLevel]);
                                    NoListType[NextLevel] := NoListType[NextLevel] ::Item;
                                    NoList[NextLevel] := CompItem."No.";
                                    VersionCode[NextLevel] :=
                                      VersionMgt.GetBOMVersion(CompItem."Production BOM No.", CalculateDate, TRUE);
                                    BomComponent[NextLevel].SETRANGE("Production BOM No.", CompItem."Production BOM No.");
                                    BomComponent[NextLevel].SETRANGE("Version Code", VersionCode[NextLevel]);
                                    BomComponent[NextLevel].SETFILTER("Starting Date", '%1|..%2', 0D, CalculateDate);
                                    BomComponent[NextLevel].SETFILTER("Ending Date", '%1|%2..', 0D, CalculateDate);
                                END;
                                IF Level > 1 THEN
                                    IF BomComponent[Level - 1].Type = BomComponent[Level - 1].Type::Item THEN
                                        IF BomItem.GET(BomComponent[Level - 1]."No.") THEN
                                            QtyPerUnitOfMeasure :=
                                              UOMMgt.GetQtyPerUnitOfMeasure(BomItem, BomComponent[Level - 1]."Unit of Measure Code") /
                                              UOMMgt.GetQtyPerUnitOfMeasure(
                                                BomItem, VersionMgt.GetBOMUnitOfMeasure(BomItem."Production BOM No.", VersionCode[Level]));
                            END;
                        BomComponent[Level].Type::"Production BOM":
                            BEGIN
                                ProdBOM.GET(BomComponent[Level]."No.");
                                IF ProdBOM.Status = ProdBOM.Status::Closed THEN
                                    CurrReport.SKIP;
                                NextLevel := Level + 1;
                                IF Level > 1 THEN
                                    IF (NextLevel > 50) OR (BomComponent[Level]."No." = NoList[Level - 1]) THEN
                                        ERROR(ProdBomErr, 50, Item."No.", NoList[Level], Level);
                                CLEAR(BomComponent[NextLevel]);
                                NoListType[NextLevel] := NoListType[NextLevel] ::"Production BOM";
                                NoList[NextLevel] := ProdBOM."No.";
                                VersionCode[NextLevel] := VersionMgt.GetBOMVersion(ProdBOM."No.", CalculateDate, TRUE);
                                BomComponent[NextLevel].SETRANGE("Production BOM No.", NoList[NextLevel]);
                                BomComponent[NextLevel].SETRANGE("Version Code", VersionCode[NextLevel]);
                                BomComponent[NextLevel].SETFILTER("Starting Date", '%1|..%2', 0D, CalculateDate);
                                BomComponent[NextLevel].SETFILTER("Ending Date", '%1|%2..', 0D, CalculateDate);
                            END;
                    END;

                    IF NextLevel <> Level THEN
                        Quantity[NextLevel] := BomComponent[NextLevel - 1].Quantity * QtyPerUnitOfMeasure * Quantity[Level];
                end;

                trigger OnPreDataItem();
                begin
                    Level := 1;

                    ProdBOM.GET(Item."Production BOM No.");
                    ProdBOM.TESTFIELD(Status, ProdBOM.Status::Certified);//b2b1.0
                    VersionCode[Level] := VersionMgt.GetBOMVersion(Item."Production BOM No.", "Calc.Date", FALSE);
                    CLEAR(BomComponent);
                    BomComponent[Level]."Production BOM No." := Item."Production BOM No.";
                    BomComponent[Level].SETRANGE("Production BOM No.", Item."Production BOM No.");
                    BomComponent[Level].SETRANGE("Version Code", VersionCode[Level]);
                    BomComponent[Level].SETFILTER("Starting Date", '%1|..%2', 0D, CalculateDate);
                    BomComponent[Level].SETFILTER("Ending Date", '%1|%2..', 0D, CalculateDate);
                    NoListType[Level] := NoListType[Level] ::Item;
                    NoList[Level] := Item."No.";
                    Quantity[Level] :=
                      UOMMgt.GetQtyPerUnitOfMeasure(Item, Item."Base Unit of Measure") /
                      UOMMgt.GetQtyPerUnitOfMeasure(
                        Item,
                        VersionMgt.GetBOMUnitOfMeasure(
                          Item."Production BOM No.", VersionCode[Level]));
                end;
            }

            trigger OnPreDataItem();
            begin
                ItemFilter := GETFILTERS;

                SETFILTER("Production BOM No.", '<>%1', '');
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
                    field(CalculateDate; CalculateDate)
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
            CalculateDate := WORKDATE;
        end;
    }

    labels
    {
    }

    var
        Text000: TextConst ENU = 'As of ', ENN = 'As of ';
        ProdBOM: Record "Production BOM Header";
        BomComponent: array[99] of Record "Production BOM Line";
        CompItem: Record Item;
        UOMMgt: Codeunit "Unit of Measure Management";
        VersionMgt: Codeunit VersionManagement;
        ItemFilter: Text;
        CalculateDate: Date;
        NoList: array[99] of Code[20];
        VersionCode: array[99] of Code[20];
        Quantity: array[99] of Decimal;
        QtyPerUnitOfMeasure: Decimal;
        Level: Integer;
        NextLevel: Integer;
        BOMQty: Decimal;
        "--B2B--": Integer;
        ProdBOM2: Record "Production BOM Header";
        "Calc.Date": Date;
        QtyExplosionofBOMCaptLbl: TextConst ENU = 'Quantity Explosion of BOM', ENN = 'Quantity Explosion of BOM';
        CurrReportPageNoCaptLbl: TextConst ENU = 'Page', ENN = 'Page';
        BOMQtyCaptionLbl: TextConst ENU = 'Total Quantity', ENN = 'Total Quantity';
        BomCompLevelQtyCaptLbl: TextConst ENU = 'BOM Quantity', ENN = 'BOM Quantity';
        BomCompLevelDescCaptLbl: TextConst ENU = 'Description', ENN = 'Description';
        BomCompLevelNoCaptLbl: TextConst ENU = 'No.', ENN = 'No.';
        LevelCaptLbl: TextConst ENU = 'Level', ENN = 'Level';
        BomCompLevelUOMCodeCaptLbl: TextConst ENU = 'Unit of Measure Code', ENN = 'Unit of Measure Code';
        NoListType: array[99] of Option " ",Item,"Production BOM";
        ProdBomErr: TextConst ENU = 'The maximum number of BOM levels, %1, was exceeded. The process stopped at item number %2, BOM header number %3, BOM level %4.', ENN = 'The maximum number of BOM levels, %1, was exceeded. The process stopped at item number %2, BOM header number %3, BOM level %4.';
}

