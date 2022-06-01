page 60210 "CS Others"
{
    // version Rev01

    PageType = Worksheet;
    SourceTable = "Res. Journal Line";

    layout
    {
        area(content)
        {
            field(CurrentJnlBatchName; CurrentJnlBatchName)
            {
                Caption = 'Batch Name';
                Lookup = true;

                trigger OnLookup(Text: Text): Boolean;
                begin
                    CurrPage.SAVERECORD;
                    ResJnlManagement.LookupName(CurrentJnlBatchName, Rec);
                    CurrPage.UPDATE(FALSE);

                    IF CurrentJnlBatchName = 'INST-OTH' THEN BEGIN
                        ZonesVisible := FALSE;
                        DivisionVisible := FALSE;
                        StationVisible := FALSE;
                        StateVisible := TRUE;
                        DistrictVisible := TRUE;
                        CityVisible := TRUE;
                        "Product typeVisible" := TRUE;
                        "Sale order noVisible" := TRUE;
                        "Serial noVisible" := TRUE;
                        "Work DescriptionVisible" := FALSE;
                        "Training/DemoVisible" := FALSE;
                        DesignationVisible := FALSE;
                        LocationVisible := FALSE;
                        "Action takenVisible" := FALSE;
                        ReasonVisible := FALSE;
                        RemarksVisible := FALSE;
                        "Work Type CodeVisible" := FALSE;
                    END ELSE
                        IF CurrentJnlBatchName = 'MAIN' THEN BEGIN
                            "Document No.Visible" := TRUE;
                            "Document No.Enable" := FALSE;
                            ZonesVisible := FALSE;
                            DivisionVisible := FALSE;
                            StationVisible := FALSE;
                            StateVisible := TRUE;
                            DistrictVisible := TRUE;
                            CityVisible := TRUE;
                            "Product typeVisible" := TRUE;
                            "Sale order noVisible" := FALSE;
                            "Serial noVisible" := FALSE;
                            "Work DescriptionVisible" := TRUE;
                            "Training/DemoVisible" := FALSE;
                            DesignationVisible := FALSE;
                            LocationVisible := FALSE;
                            "Action takenVisible" := FALSE;
                            ReasonVisible := FALSE;
                            RemarksVisible := FALSE;
                            "Work Type CodeVisible" := FALSE;
                        END ELSE
                            IF CurrentJnlBatchName = 'GENERAL' THEN BEGIN
                                ZonesVisible := FALSE;
                                DivisionVisible := FALSE;
                                StationVisible := FALSE;
                                StateVisible := TRUE;
                                DistrictVisible := TRUE;
                                CityVisible := TRUE;
                                PlaceVisible := TRUE;
                                "Work DescriptionVisible" := TRUE;
                                "Product typeVisible" := TRUE;
                                "Sale order noVisible" := FALSE;
                                "Serial noVisible" := FALSE;
                                "Action takenVisible" := TRUE;
                                "Work Type CodeVisible" := FALSE;
                                "Training/DemoVisible" := FALSE;
                                DesignationVisible := FALSE;
                                LocationVisible := FALSE;
                                "Work DescriptionVisible" := TRUE;
                                RemarksVisible := TRUE;
                            END ELSE
                                IF CurrentJnlBatchName = 'DEMO' THEN BEGIN
                                    ShortcutDimension1CodeVisible := TRUE;
                                    ZonesVisible := FALSE;
                                    DivisionVisible := FALSE;
                                    StationVisible := FALSE;
                                    StateVisible := TRUE;
                                    DistrictVisible := TRUE;
                                    CityVisible := TRUE;
                                    PlaceVisible := TRUE;
                                    "Work DescriptionVisible" := FALSE;
                                    "Product typeVisible" := TRUE;
                                    "Sale order noVisible" := FALSE;
                                    "Serial noVisible" := FALSE;
                                    "Action takenVisible" := FALSE;
                                    ReasonVisible := FALSE;
                                    RemarksVisible := FALSE;
                                    "Work Type CodeVisible" := FALSE;
                                    "Service itemVisible" := FALSE;
                                END ELSE
                                    IF CurrentJnlBatchName = 'LEAVE' THEN BEGIN
                                        ZonesVisible := FALSE;
                                        DivisionVisible := FALSE;
                                        StationVisible := FALSE;
                                        StateVisible := FALSE;
                                        DistrictVisible := FALSE;
                                        CityVisible := FALSE;
                                        PlaceVisible := FALSE;
                                        "Work DescriptionVisible" := TRUE;
                                        "Product typeVisible" := FALSE;
                                        "Sale order noVisible" := FALSE;
                                        "Serial noVisible" := FALSE;
                                        "Action takenVisible" := FALSE;
                                        ReasonVisible := FALSE;
                                        RemarksVisible := FALSE;
                                        "Work Type CodeVisible" := FALSE;
                                        "Training/DemoVisible" := FALSE;
                                        DesignationVisible := FALSE;
                                        LocationVisible := FALSE;
                                        "Service itemVisible" := FALSE;

                                    END ELSE
                                        IF CurrentJnlBatchName = 'TRAINING' THEN BEGIN
                                            ShortcutDimension1CodeVisible := TRUE;
                                            ShortcutDimension2CodeVisible := TRUE;
                                            ZonesVisible := FALSE;
                                            DivisionVisible := FALSE;
                                            StationVisible := FALSE;
                                            StateVisible := TRUE;
                                            DistrictVisible := TRUE;
                                            CityVisible := TRUE;
                                            PlaceVisible := TRUE;
                                            "Work DescriptionVisible" := FALSE;
                                            "Product typeVisible" := FALSE;
                                            "Sale order noVisible" := FALSE;
                                            "Serial noVisible" := FALSE;
                                            "Action takenVisible" := FALSE;
                                            ReasonVisible := FALSE;
                                            RemarksVisible := FALSE;
                                            "Work Type CodeVisible" := FALSE;
                                            "Service itemVisible" := FALSE;

                                        END ELSE
                                            IF CurrentJnlBatchName = 'IN-DEPT' THEN BEGIN
                                                ZonesVisible := FALSE;
                                                DivisionVisible := FALSE;
                                                StationVisible := FALSE;
                                                StateVisible := TRUE;
                                                DistrictVisible := TRUE;
                                                CityVisible := TRUE;
                                                PlaceVisible := TRUE;
                                                "Work DescriptionVisible" := TRUE;
                                                "Product typeVisible" := FALSE;
                                                "Sale order noVisible" := FALSE;
                                                "Serial noVisible" := FALSE;
                                                "Action takenVisible" := FALSE;
                                                ReasonVisible := FALSE;
                                                RemarksVisible := FALSE;
                                                ShortcutDimension2CodeVisible := FALSE;
                                                "Work Type CodeVisible" := FALSE;
                                                "Training/DemoVisible" := FALSE;
                                                DesignationVisible := FALSE;
                                                LocationVisible := FALSE;
                                                "Service itemVisible" := FALSE;

                                            END ELSE BEGIN
                                                ZonesVisible := TRUE;
                                                DivisionVisible := TRUE;
                                                StationVisible := TRUE;
                                                StateVisible := TRUE;
                                                DistrictVisible := TRUE;
                                                CityVisible := TRUE;
                                                //CurrPage.Place.VISIBLE:=TRUE;
                                                "Product typeVisible" := TRUE;
                                                "Sale order noVisible" := TRUE;
                                                "Serial noVisible" := TRUE;
                                                "Work DescriptionVisible" := TRUE;
                                            END;
                end;

                trigger OnValidate();
                begin
                    ResJnlManagement.CheckName(CurrentJnlBatchName, Rec);
                    CurrentJnlBatchNameOnAfterVali;
                end;
            }
            repeater(Control1000000016)
            {
                ShowCaption = false;
                field("Document No."; "Document No.")
                {
                    Enabled = "Document No.Enable";
                    Visible = "Document No.Visible";
                }
                field("Line No."; "Line No.")
                {
                }
                field("Document Date"; "Document Date")
                {
                    Visible = false;
                }
                field("Posting Date"; "Posting Date")
                {
                }
                field("Product type"; "Product type")
                {
                    Visible = "Product typeVisible";
                }
                field(Zones; Zones)
                {
                    Visible = ZonesVisible;
                }
                field(Division; Division)
                {
                    Visible = DivisionVisible;
                }
                field(Station; Station)
                {
                    Visible = StationVisible;
                }
                field("Training/Demo"; "Training/Demo")
                {
                    Visible = "Training/DemoVisible";
                }
                field("Service item"; "Service item")
                {
                    Visible = "Service itemVisible";
                }
                field(Location; Location)
                {
                    Visible = LocationVisible;
                }
                field(Designation; Designation)
                {
                    Visible = DesignationVisible;
                }
                field(State; State)
                {
                    Visible = StateVisible;
                }
                field("Action taken"; "Action taken")
                {
                    Visible = "Action takenVisible";
                }
                field(Reason; Reason)
                {
                    Visible = ReasonVisible;
                }
                field(District; District)
                {
                    Visible = DistrictVisible;
                }
                field(City; City)
                {
                    Visible = CityVisible;
                }
                field(Place; Place)
                {
                    Visible = PlaceVisible;
                }
                field("Sale order no"; "Sale order no")
                {
                    Visible = "Sale order noVisible";
                }
                field(Remarks; Remarks)
                {
                    Visible = RemarksVisible;
                }
                field("Serial no"; "Serial no")
                {
                    Visible = "Serial noVisible";
                }
                field("External Document No."; "External Document No.")
                {
                    Visible = false;
                }
                field("Work Description"; "Work Description")
                {
                    Visible = "Work DescriptionVisible";
                }
                field("Resource No."; "Resource No.")
                {

                    trigger OnValidate();
                    begin
                        ResJnlManagement.GetRes("Resource No.", ResName);
                        ShowShortcutDimCode(ShortcutDimCode);
                    end;
                }
                field("Resource Group No."; "Resource Group No.")
                {
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ShowShortcutDimCode(ShortcutDimCode);
                    end;
                }
                field(Description; Description)
                {
                    Caption = 'Name';
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                    Visible = ShortcutDimension1CodeVisible;
                }
                field("Planned Hr's"; "Planned Hr's")
                {
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    Visible = ShortcutDimension2CodeVisible;
                }
                field("ShortcutDimCode[3]"; ShortcutDimCode[3])
                {
                    CaptionClass = '1,2,3';
                    Visible = false;

                    trigger OnLookup(Text: Text): Boolean;
                    begin
                        LookupShortcutDimCode(3, ShortcutDimCode[3]);
                    end;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(3, ShortcutDimCode[3]);
                    end;
                }
                field("ShortcutDimCode[4]"; ShortcutDimCode[4])
                {
                    CaptionClass = '1,2,4';
                    Visible = false;

                    trigger OnLookup(Text: Text): Boolean;
                    begin
                        LookupShortcutDimCode(4, ShortcutDimCode[4]);
                    end;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(4, ShortcutDimCode[4]);
                    end;
                }
                field("ShortcutDimCode[5]"; ShortcutDimCode[5])
                {
                    CaptionClass = '1,2,5';
                    Visible = false;

                    trigger OnLookup(Text: Text): Boolean;
                    begin
                        LookupShortcutDimCode(5, ShortcutDimCode[5]);
                    end;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(5, ShortcutDimCode[5]);
                    end;
                }
                field("ShortcutDimCode[6]"; ShortcutDimCode[6])
                {
                    CaptionClass = '1,2,6';
                    Visible = false;

                    trigger OnLookup(Text: Text): Boolean;
                    begin
                        LookupShortcutDimCode(6, ShortcutDimCode[6]);
                    end;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(6, ShortcutDimCode[6]);
                    end;
                }
                field("ShortcutDimCode[7]"; ShortcutDimCode[7])
                {
                    CaptionClass = '1,2,7';
                    Visible = false;

                    trigger OnLookup(Text: Text): Boolean;
                    begin
                        LookupShortcutDimCode(7, ShortcutDimCode[7]);
                    end;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(7, ShortcutDimCode[7]);
                    end;
                }
                field("ShortcutDimCode[8]"; ShortcutDimCode[8])
                {
                    CaptionClass = '1,2,8';
                    Visible = false;

                    trigger OnLookup(Text: Text): Boolean;
                    begin
                        LookupShortcutDimCode(8, ShortcutDimCode[8]);
                    end;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(8, ShortcutDimCode[8]);
                    end;
                }
                field("Work Type Code"; "Work Type Code")
                {
                    Caption = 'Activity Code';
                    Visible = "Work Type CodeVisible";
                }
                field(Status; Status)
                {
                }
                field(Quantity; Quantity)
                {
                    Caption = 'Spent Hr''s';
                }
                field("Unit of Measure Code"; "Unit of Measure Code")
                {
                }
                field("Direct Unit Cost"; "Direct Unit Cost")
                {
                }
                field("Unit Cost"; "Unit Cost")
                {
                }
            }
            group(Control1000000002)
            {
                ShowCaption = false;
                field(ResName; ResName)
                {
                    Caption = 'Resource Name';
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Line")
            {
                Caption = '&Line';
                action(Dimensions)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Process;
                }
            }
            group("&Resource")
            {
                Caption = '&Resource';
                action(Card)
                {
                    Caption = 'Card';
                    Image = Card;
                    RunObject = Page "Resource Card";
                    RunPageLink = No.=FIELD(Resource No.);
                    ShortCutKey = 'Shift+F5';
                }
                action("Ledger E&ntries")
                {
                    Caption = 'Ledger E&ntries';
                    Image = LedgerEntries;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Resource Ledger Entries";
                                    RunPageLink = Resource No.=FIELD(Resource No.);
                    RunPageView = SORTING(Resource No.);
                    ShortCutKey = 'Ctrl+F5';
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                action("Test Report")
                {
                    Caption = 'Test Report';
                    Ellipsis = true;
                    Image = TestReport;
                    Promoted = true;
                    PromotedCategory = "Report";

                    trigger OnAction();
                    begin
                        ReportPrint.PrintResJnlLine(Rec);
                    end;
                }
                action("P&ost")
                {
                    Caption = 'P&ost';
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'F9';

                    trigger OnAction();
                    begin
                        CODEUNIT.RUN(CODEUNIT::"Res. Jnl.-Post",Rec);
                        CurrentJnlBatchName := GETRANGEMAX("Journal Batch Name");
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                action("Post and &Print")
                {
                    Caption = 'Post and &Print';
                    Image = PostPrint;
                    Promoted = true;
                    PromotedCategory = "Report";
                    ShortCutKey = 'Shift+F9';

                    trigger OnAction();
                    begin
                        CODEUNIT.RUN(CODEUNIT::"Res. Jnl.-Post+Print",Rec);
                        CurrentJnlBatchName := GETRANGEMAX("Journal Batch Name");
                        CurrPage.UPDATE(FALSE);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        ShowShortcutDimCode(ShortcutDimCode);
        OnAfterGetCurrRecord;
    end;

    trigger OnInit();
    begin
        "Document No.Enable" := TRUE;
        "Service itemVisible" := TRUE;
        PlaceVisible := TRUE;
        "Document No.Visible" := TRUE;
        "Work Type CodeVisible" := TRUE;
        RemarksVisible := TRUE;
        ReasonVisible := TRUE;
        "Action takenVisible" := TRUE;
        LocationVisible := TRUE;
        DesignationVisible := TRUE;
        "Training/DemoVisible" := TRUE;
        "Work DescriptionVisible" := TRUE;
        "Serial noVisible" := TRUE;
        "Sale order noVisible" := TRUE;
        "Product typeVisible" := TRUE;
        CityVisible := TRUE;
        DistrictVisible := TRUE;
        StateVisible := TRUE;
        StationVisible := TRUE;
        DivisionVisible := TRUE;
        ZonesVisible := TRUE;
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        SetUpNewLine(xRec);
        CLEAR(ShortcutDimCode);
        OnAfterGetCurrRecord;
    end;

    trigger OnOpenPage();
    begin
        ResJnlManagement.OpenJnl(CurrentJnlBatchName,Rec);
    end;

    var
        ResJnlManagement : Codeunit ResJnlManagement;
        ReportPrint : Codeunit "Test Report-Print";
        CurrentJnlBatchName : Code[10];
        ResName : Text[30];
        ShortcutDimCode : array [8] of Code[20];
        "Service item" : Record "Service Item";
        "Service Item(DUM)" : Record "Service Item" temporary;
        ResLedgEntry : Record "Res. Ledger Entry";
        "Res. Journal Line" : Record "Res. Journal Line";
        Line : Integer;
        [InDataSet]
        ZonesVisible : Boolean;
        [InDataSet]
        DivisionVisible : Boolean;
        [InDataSet]
        StationVisible : Boolean;
        [InDataSet]
        StateVisible : Boolean;
        [InDataSet]
        DistrictVisible : Boolean;
        [InDataSet]
        CityVisible : Boolean;
        [InDataSet]
        "Product typeVisible" : Boolean;
        [InDataSet]
        "Sale order noVisible" : Boolean;
        [InDataSet]
        "Serial noVisible" : Boolean;
        [InDataSet]
        "Work DescriptionVisible" : Boolean;
        [InDataSet]
        "Training/DemoVisible" : Boolean;
        [InDataSet]
        DesignationVisible : Boolean;
        [InDataSet]
        LocationVisible : Boolean;
        [InDataSet]
        "Action takenVisible" : Boolean;
        [InDataSet]
        ReasonVisible : Boolean;
        [InDataSet]
        RemarksVisible : Boolean;
        [InDataSet]
        "Work Type CodeVisible" : Boolean;
        [InDataSet]
        "Document No.Visible" : Boolean;
        [InDataSet]
        PlaceVisible : Boolean;
        [InDataSet]
        ShortcutDimension1CodeVisible : Boolean;
        [InDataSet]
        "Service itemVisible" : Boolean;
        [InDataSet]
        ShortcutDimension2CodeVisible : Boolean;
        [InDataSet]
        "Document No.Enable" : Boolean;

    [LineStart(16076)]
    local procedure CurrentJnlBatchNameOnAfterVali();
    begin


        CurrPage.SAVERECORD;
        ResJnlManagement.SetName(CurrentJnlBatchName,Rec);
        CurrPage.UPDATE(FALSE);
    end;

    [LineStart(16083)]
    local procedure OnAfterGetCurrRecord();
    begin
        xRec := Rec;
        ResJnlManagement.GetRes("Resource No.",ResName);
    end;
}

