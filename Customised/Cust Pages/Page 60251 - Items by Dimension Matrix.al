page 60251 "Items by Dimension Matrix"
{
    // version NAVW16.00,Rev01

    Caption = 'Items by Location Matrix';
    Editable = false;
    LinksAllowed = false;
    PageType = List;
    SourceTable = Item;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("No."; "No.")
                {
                }
                field(Description; Description)
                {
                }
                field(Field1; MATRIX_CellData[1])
                {
                    BlankNumbers = BlankZero;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[1];
                    DecimalPlaces = 0 : 5;
                    Visible = Field1Visible;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(1);
                    end;
                }
                field(Field2; MATRIX_CellData[2])
                {
                    BlankNumbers = BlankZero;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[2];
                    DecimalPlaces = 0 : 5;
                    Visible = Field2Visible;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(2);
                    end;
                }
                field(Field3; MATRIX_CellData[3])
                {
                    BlankNumbers = BlankZero;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[3];
                    DecimalPlaces = 0 : 5;
                    Visible = Field3Visible;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(3);
                    end;
                }
                field(Field4; MATRIX_CellData[4])
                {
                    BlankNumbers = BlankZero;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[4];
                    DecimalPlaces = 0 : 5;
                    Visible = Field4Visible;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(4);
                    end;
                }
                field(Field5; MATRIX_CellData[5])
                {
                    BlankNumbers = BlankZero;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[5];
                    DecimalPlaces = 0 : 5;
                    Visible = Field5Visible;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(5);
                    end;
                }
                field(Field6; MATRIX_CellData[6])
                {
                    BlankNumbers = BlankZero;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[6];
                    DecimalPlaces = 0 : 5;
                    Visible = Field6Visible;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(6);
                    end;
                }
                field(Field7; MATRIX_CellData[7])
                {
                    BlankNumbers = BlankZero;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[7];
                    DecimalPlaces = 0 : 5;
                    Visible = Field7Visible;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(7);
                    end;
                }
                field(Field8; MATRIX_CellData[8])
                {
                    BlankNumbers = BlankZero;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[8];
                    DecimalPlaces = 0 : 5;
                    Visible = Field8Visible;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(8);
                    end;
                }
                field(Field9; MATRIX_CellData[9])
                {
                    BlankNumbers = BlankZero;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[9];
                    DecimalPlaces = 0 : 5;
                    Visible = Field9Visible;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(9);
                    end;
                }
                field(Field10; MATRIX_CellData[10])
                {
                    BlankNumbers = BlankZero;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[10];
                    DecimalPlaces = 0 : 5;
                    Visible = Field10Visible;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(10);
                    end;
                }
                field(Field11; MATRIX_CellData[11])
                {
                    BlankNumbers = BlankZero;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[11];
                    DecimalPlaces = 0 : 5;
                    Visible = Field11Visible;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(11);
                    end;
                }
                field(Field12; MATRIX_CellData[12])
                {
                    BlankNumbers = BlankZero;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[12];
                    DecimalPlaces = 0 : 5;
                    Visible = Field12Visible;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(12);
                    end;
                }
                field(Field13; MATRIX_CellData[13])
                {
                    BlankNumbers = BlankZero;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[13];
                    DecimalPlaces = 0 : 5;
                    Visible = Field13Visible;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(13);
                    end;
                }
                field(Field14; MATRIX_CellData[14])
                {
                    BlankNumbers = BlankZero;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[14];
                    DecimalPlaces = 0 : 5;
                    Visible = Field14Visible;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(14);
                    end;
                }
                field(Field15; MATRIX_CellData[15])
                {
                    BlankNumbers = BlankZero;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[15];
                    DecimalPlaces = 0 : 5;
                    Visible = Field15Visible;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(15);
                    end;
                }
                field(Field16; MATRIX_CellData[16])
                {
                    BlankNumbers = BlankZero;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[16];
                    DecimalPlaces = 0 : 5;
                    Visible = Field16Visible;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(16);
                    end;
                }
                field(Field17; MATRIX_CellData[17])
                {
                    BlankNumbers = BlankZero;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[17];
                    DecimalPlaces = 0 : 5;
                    Visible = Field17Visible;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(17);
                    end;
                }
                field(Field18; MATRIX_CellData[18])
                {
                    BlankNumbers = BlankZero;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[18];
                    DecimalPlaces = 0 : 5;
                    Visible = Field18Visible;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(18);
                    end;
                }
                field(Field19; MATRIX_CellData[19])
                {
                    BlankNumbers = BlankZero;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[19];
                    DecimalPlaces = 0 : 5;
                    Visible = Field19Visible;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(19);
                    end;
                }
                field(Field20; MATRIX_CellData[20])
                {
                    BlankNumbers = BlankZero;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[20];
                    DecimalPlaces = 0 : 5;
                    Visible = Field20Visible;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(20);
                    end;
                }
                field(Field21; MATRIX_CellData[21])
                {
                    BlankNumbers = BlankZero;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[21];
                    DecimalPlaces = 0 : 5;
                    Visible = Field21Visible;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(21);
                    end;
                }
                field(Field22; MATRIX_CellData[22])
                {
                    BlankNumbers = BlankZero;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[22];
                    DecimalPlaces = 0 : 5;
                    Visible = Field22Visible;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(22);
                    end;
                }
                field(Field23; MATRIX_CellData[23])
                {
                    BlankNumbers = BlankZero;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[23];
                    DecimalPlaces = 0 : 5;
                    Visible = Field23Visible;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(23);
                    end;
                }
                field(Field24; MATRIX_CellData[24])
                {
                    BlankNumbers = BlankZero;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[24];
                    DecimalPlaces = 0 : 5;
                    Visible = Field24Visible;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(24);
                    end;
                }
                field(Field25; MATRIX_CellData[25])
                {
                    BlankNumbers = BlankZero;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[25];
                    DecimalPlaces = 0 : 5;
                    Visible = Field25Visible;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(25);
                    end;
                }
                field(Field26; MATRIX_CellData[26])
                {
                    BlankNumbers = BlankZero;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[26];
                    DecimalPlaces = 0 : 5;
                    Visible = Field26Visible;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(26);
                    end;
                }
                field(Field27; MATRIX_CellData[27])
                {
                    BlankNumbers = BlankZero;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[27];
                    DecimalPlaces = 0 : 5;
                    Visible = Field27Visible;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(27);
                    end;
                }
                field(Field28; MATRIX_CellData[28])
                {
                    BlankNumbers = BlankZero;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[28];
                    DecimalPlaces = 0 : 5;
                    Visible = Field28Visible;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(28);
                    end;
                }
                field(Field29; MATRIX_CellData[29])
                {
                    BlankNumbers = BlankZero;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[29];
                    DecimalPlaces = 0 : 5;
                    Visible = Field29Visible;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(29);
                    end;
                }
                field(Field30; MATRIX_CellData[30])
                {
                    BlankNumbers = BlankZero;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[30];
                    DecimalPlaces = 0 : 5;
                    Visible = Field30Visible;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(10);
                    end;
                }
                field(Field31; MATRIX_CellData[31])
                {
                    BlankNumbers = BlankZero;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[31];
                    DecimalPlaces = 0 : 5;
                    Visible = Field31Visible;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(31);
                    end;
                }
                field(Field32; MATRIX_CellData[32])
                {
                    BlankNumbers = BlankZero;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[32];
                    DecimalPlaces = 0 : 5;
                    Visible = Field32Visible;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(32);
                    end;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Item")
            {
                Caption = '&Item';
                group("Item Availability by")
                {
                    Caption = '&Item Availability by';
                    Image = ItemAvailability;
                    action(Period)
                    {
                        Caption = 'Period';
                        Image = ItemAvailabilitybyPeriod;
                        RunObject = Page "Item Availability by Periods";
                        RunPageLink = No.=FIELD(No.),Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter),Location Filter=FIELD(Location Filter),Drop Shipment Filter=FIELD(Drop Shipment Filter),Variant Filter=FIELD(Variant Filter);
                    }
                    action(Variant)
                    {
                        Caption = 'Variant';
                        Image = AvailableToPromise;
                        RunObject = Page "Item Availability by Variant";
                                        RunPageLink = No.=FIELD(No.),Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter),Location Filter=FIELD(Location Filter),Drop Shipment Filter=FIELD(Drop Shipment Filter),Variant Filter=FIELD(Variant Filter);
                    }
                    action(Location)
                    {
                        Caption = 'Location';
                        Image = ItemAvailbyLoc;
                        RunObject = Page "Item Availability by Location";
                                        RunPageLink = No.=FIELD(No.),Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter),Location Filter=FIELD(Location Filter),Drop Shipment Filter=FIELD(Drop Shipment Filter),Variant Filter=FIELD(Variant Filter);
                    }
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    var
        MATRIX_CurrentColumnOrdinal : Integer;
    begin
        MATRIX_CurrentColumnOrdinal := 0;
        IF MatrixRecord.FIND('-') THEN
          REPEAT
            MATRIX_CurrentColumnOrdinal := MATRIX_CurrentColumnOrdinal + 1;
            MATRIX_OnAfterGetRecord(MATRIX_CurrentColumnOrdinal);
          UNTIL (MatrixRecord.NEXT(1) = 0) OR (MATRIX_CurrentColumnOrdinal = MATRIX_NoOfMatrixColumns);
    end;

    trigger OnInit();
    begin
        Field32Visible := TRUE;
        Field31Visible := TRUE;
        Field30Visible := TRUE;
        Field29Visible := TRUE;
        Field28Visible := TRUE;
        Field27Visible := TRUE;
        Field26Visible := TRUE;
        Field25Visible := TRUE;
        Field24Visible := TRUE;
        Field23Visible := TRUE;
        Field22Visible := TRUE;
        Field21Visible := TRUE;
        Field20Visible := TRUE;
        Field19Visible := TRUE;
        Field18Visible := TRUE;
        Field17Visible := TRUE;
        Field16Visible := TRUE;
        Field15Visible := TRUE;
        Field14Visible := TRUE;
        Field13Visible := TRUE;
        Field12Visible := TRUE;
        Field11Visible := TRUE;
        Field10Visible := TRUE;
        Field9Visible := TRUE;
        Field8Visible := TRUE;
        Field7Visible := TRUE;
        Field6Visible := TRUE;
        Field5Visible := TRUE;
        Field4Visible := TRUE;
        Field3Visible := TRUE;
        Field2Visible := TRUE;
        Field1Visible := TRUE;
    end;

    trigger OnOpenPage();
    begin
        MATRIX_NoOfMatrixColumns := ARRAYLEN(MATRIX_CellData);
    end;

    var
        ItemLedgerEntry : Record "Item Ledger Entry";
        MatrixRecords : array [32] of Record "Dimension Value";
        MatrixHeader : Text[250];
        ShowColumnName : Boolean;
        ShowInTransit : Boolean;
        MatrixRecord : Record "Dimension Value";
        MATRIX_NoOfMatrixColumns : Integer;
        MATRIX_ColumnOrdinal : Integer;
        MATRIX_CellData : array [32] of Decimal;
        MATRIX_ColumnCaption : array [32] of Text[1024];
        [InDataSet]
        Field1Visible : Boolean;
        [InDataSet]
        Field2Visible : Boolean;
        [InDataSet]
        Field3Visible : Boolean;
        [InDataSet]
        Field4Visible : Boolean;
        [InDataSet]
        Field5Visible : Boolean;
        [InDataSet]
        Field6Visible : Boolean;
        [InDataSet]
        Field7Visible : Boolean;
        [InDataSet]
        Field8Visible : Boolean;
        [InDataSet]
        Field9Visible : Boolean;
        [InDataSet]
        Field10Visible : Boolean;
        [InDataSet]
        Field11Visible : Boolean;
        [InDataSet]
        Field12Visible : Boolean;
        [InDataSet]
        Field13Visible : Boolean;
        [InDataSet]
        Field14Visible : Boolean;
        [InDataSet]
        Field15Visible : Boolean;
        [InDataSet]
        Field16Visible : Boolean;
        [InDataSet]
        Field17Visible : Boolean;
        [InDataSet]
        Field18Visible : Boolean;
        [InDataSet]
        Field19Visible : Boolean;
        [InDataSet]
        Field20Visible : Boolean;
        [InDataSet]
        Field21Visible : Boolean;
        [InDataSet]
        Field22Visible : Boolean;
        [InDataSet]
        Field23Visible : Boolean;
        [InDataSet]
        Field24Visible : Boolean;
        [InDataSet]
        Field25Visible : Boolean;
        [InDataSet]
        Field26Visible : Boolean;
        [InDataSet]
        Field27Visible : Boolean;
        [InDataSet]
        Field28Visible : Boolean;
        [InDataSet]
        Field29Visible : Boolean;
        [InDataSet]
        Field30Visible : Boolean;
        [InDataSet]
        Field31Visible : Boolean;
        [InDataSet]
        Field32Visible : Boolean;

    [LineStart(20504)]
    local procedure InventoryDrillDown();
    begin
    end;

    [LineStart(20507)]
    local procedure MATRIX_OnAfterGetRecord(ColumnID : Integer);
    var
        Item : Record Item;
    begin
        Item.COPY(Rec);
        Item.SETRANGE("Global Dimension 2 Filter",MatrixRecords[ColumnID].Code);
        Item.CALCFIELDS(InventoryDim);
        MATRIX_CellData[ColumnID] := Item.InventoryDim;
        SetVisible;
    end;

    [LineStart(20514)]
    procedure Load(MatrixColumns1 : array [32] of Text[1024];var MatrixRecords1 : array [32] of Record "Dimension Value";var MatrixRecord1 : Record "Dimension Value");
    begin
        COPYARRAY(MATRIX_ColumnCaption,MatrixColumns1,1);
        COPYARRAY(MatrixRecords,MatrixRecords1,1);
        MatrixRecord.COPY(MatrixRecord1);
    end;

    [LineStart(20519)]
    procedure MatrixOnDrillDown(ColumnID : Integer);
    begin
        ItemLedgerEntry.SETCURRENTKEY(
          "Item No.","Entry Type","Variant Code","Drop Shipment","Location Code","Posting Date");
        ItemLedgerEntry.SETRANGE("Item No.","No.");
        ItemLedgerEntry.SETRANGE("Global Dimension 2 Code",MatrixRecords[ColumnID].Code);
        ItemLedgerEntry.SETRANGE(Open,TRUE);
        PAGE.RUN(0,ItemLedgerEntry);
    end;

    [LineStart(20527)]
    procedure SetVisible();
    begin
        Field1Visible := MATRIX_ColumnCaption[1] <> '';
        Field2Visible := MATRIX_ColumnCaption[2] <> '';
        Field3Visible := MATRIX_ColumnCaption[3] <> '';
        Field4Visible := MATRIX_ColumnCaption[4] <> '';
        Field5Visible := MATRIX_ColumnCaption[5] <> '';
        Field6Visible := MATRIX_ColumnCaption[6] <> '';
        Field7Visible := MATRIX_ColumnCaption[7] <> '';
        Field8Visible := MATRIX_ColumnCaption[8] <> '';
        Field9Visible := MATRIX_ColumnCaption[9] <> '';
        Field10Visible := MATRIX_ColumnCaption[10] <> '';
        Field11Visible := MATRIX_ColumnCaption[11] <> '';
        Field12Visible := MATRIX_ColumnCaption[12] <> '';
        Field13Visible := MATRIX_ColumnCaption[13] <> '';
        Field14Visible := MATRIX_ColumnCaption[14] <> '';
        Field15Visible := MATRIX_ColumnCaption[15] <> '';
        Field16Visible := MATRIX_ColumnCaption[16] <> '';
        Field17Visible := MATRIX_ColumnCaption[17] <> '';
        Field18Visible := MATRIX_ColumnCaption[18] <> '';
        Field19Visible := MATRIX_ColumnCaption[19] <> '';
        Field20Visible := MATRIX_ColumnCaption[20] <> '';
        Field21Visible := MATRIX_ColumnCaption[21] <> '';
        Field22Visible := MATRIX_ColumnCaption[22] <> '';
        Field23Visible := MATRIX_ColumnCaption[23] <> '';
        Field24Visible := MATRIX_ColumnCaption[24] <> '';
        Field25Visible := MATRIX_ColumnCaption[25] <> '';
        Field26Visible := MATRIX_ColumnCaption[26] <> '';
        Field27Visible := MATRIX_ColumnCaption[27] <> '';
        Field28Visible := MATRIX_ColumnCaption[28] <> '';
        Field29Visible := MATRIX_ColumnCaption[29] <> '';
        Field30Visible := MATRIX_ColumnCaption[30] <> '';
        Field31Visible := MATRIX_ColumnCaption[31] <> '';
        Field32Visible := MATRIX_ColumnCaption[32] <> '';
    end;
}

