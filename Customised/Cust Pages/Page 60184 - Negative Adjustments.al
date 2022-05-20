page 60184 "Negative Adjustments"
{
    // version NAVW13.70,NAVIN3.70.00.04,Rev01

    AutoSplitKey = true;
    Caption = 'Negative Adjustments';
    DataCaptionFields = "Journal Batch Name";
    DelayedInsert = true;
    Editable = true;
    PageType = Worksheet;
    SaveValues = true;
    SourceTable = "Item Journal Line";

    layout
    {
        area(content)
        {
            field(CurrentJnlBatchName;CurrentJnlBatchName)
            {
                Caption = 'Batch Name';
                Lookup = true;

                trigger OnLookup(Text : Text) : Boolean;
                begin
                    CurrPage.SAVERECORD;
                    ItemJnlMgt.LookupName(CurrentJnlBatchName,Rec);
                    CurrPage.UPDATE(FALSE);
                end;

                trigger OnValidate();
                begin
                    ItemJnlMgt.CheckName(CurrentJnlBatchName,Rec);
                      CurrentJnlBatchNameOnAfterVali;
                end;
            }
            repeater(Control1)
            {
                ShowCaption = false;
                field("Posting Date";"Posting Date")
                {
                }
                field("Document Date";"Document Date")
                {
                    Visible = false;
                }
                field("Document No.";"Document No.")
                {
                }
                field("Item No.";"Item No.")
                {

                    trigger OnValidate();
                    begin
                        ItemJnlMgt.GetItem("Item No.",ItemDescription);
                        ShowShortcutDimCode(ShortcutDimCode);
                    end;
                }
                field(Description;Description)
                {
                }
                field(Remarks;Remarks)
                {
                }
                field("Reason Code";"Reason Code")
                {
                }
                field("Location Code";"Location Code")
                {
                    Visible = true;
                }
                field(Quantity;Quantity)
                {
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                }
                field("Unit Amount";"Unit Amount")
                {
                }
                field(Amount;Amount)
                {
                }
                field("Unit Cost";"Unit Cost")
                {
                }
                field("Applies-to Entry";"Applies-to Entry")
                {
                }
            }
            group(Control22)
            {
                ShowCaption = false;
                field(ItemDescription;ItemDescription)
                {
                    Caption = 'Item Description';
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
                }
                action("Item &Tracking Lines")
                {
                    Caption = 'Item &Tracking Lines';
                    Image = ItemTrackingLines;

                    trigger OnAction();
                    begin
                        OpenItemTrackingLines(FALSE);
                    end;
                }
                action("Bin Contents")
                {
                    Caption = 'Bin Contents';
                    Image = BinContent;
                    RunObject = Page "Bin Contents List";
                    RunPageLink = Location Code=FIELD(Location Code),Item No.=FIELD(Item No.),Variant Code=FIELD(Variant Code);
                    RunPageView = SORTING(Location Code,Item No.,Variant Code);
                }
            }
            group("&Item")
            {
                Caption = '&Item';
                action(Card)
                {
                    Caption = 'Card';
                    Image = Card;
                    RunObject = Page "Item Card";
                    RunPageLink = No.=FIELD(Item No.);
                    ShortCutKey = 'Shift+F5';
                }
                action("Ledger E&ntries")
                {
                    Caption = 'Ledger E&ntries';
                    Image = LedgerEntries;
                    RunObject = Page "Item Ledger Entries";
                    RunPageLink = Item No.=FIELD(Item No.);
                    RunPageView = SORTING(Item No.);
                    ShortCutKey = 'Ctrl+F5';
                }
            }
        }
        area(processing)
        {
            Caption = '<Action1900000004>';
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("E&xplode BOM")
                {
                    Caption = 'E&xplode BOM';
                    Image = ExplodeBOM;
                    RunObject = Codeunit "Item Jnl.-Explode BOM";
                    Visible = false;
                }
                action("&Calculate Whse. Adjustment")
                {
                    Caption = '&Calculate Whse. Adjustment';
                    Ellipsis = true;
                    Image = CalculateWarehouseAdjustment;

                    trigger OnAction();
                    begin
                        CalcWhseAdjmt.SetItemJnlLine(Rec);
                        CalcWhseAdjmt.RUNMODAL;
                        CLEAR(CalcWhseAdjmt);
                    end;
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
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";

                    trigger OnAction();
                    begin
                        ReportPrint.PrintItemJnlLine(Rec);
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
                        /*
                        //B2BKPK
                        NegAdjItemJnlLine.SETRANGE("Journal Template Name","Journal Template Name");
                        NegAdjItemJnlLine.SETRANGE("Journal Batch Name","Journal Batch Name");
                        IF NegAdjItemJnlLine.FINDSET THEN
                          REPEAT
                            IF NegAdjItemJnlLine."Shortcut Dimension 2 Code" = '' THEN
                              ERROR('No inventory in this location');
                              EXIT;
                          UNTIL NegAdjItemJnlLine.NEXT = 0;
                        //B2BKPK
                         */
                        IF (USERID='08CM002') OR (USERID='EFFTRONICS\PHANI') OR (USERID='EFFTRONICS\NAYOMI') THEN
                        CODEUNIT.RUN(CODEUNIT::"Item Jnl.-Post",Rec);
                        CurrentJnlBatchName := GETRANGEMAX("Journal Batch Name");
                        CurrPage.UPDATE(FALSE);

                    end;
                }
                action("Post and &Print")
                {
                    Caption = 'Post and &Print';
                    Image = PostPrint;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'Shift+F9';

                    trigger OnAction();
                    begin
                        CODEUNIT.RUN(CODEUNIT::"Item Jnl.-Post+Print",Rec);
                        CurrentJnlBatchName := GETRANGEMAX("Journal Batch Name");
                        CurrPage.UPDATE(FALSE);
                    end;
                }
            }
            action("&Print")
            {
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                var
                    ItemJnlLine : Record "Item Journal Line";
                begin
                    ItemJnlLine.COPY(Rec);
                    ItemJnlLine.SETRANGE("Journal Template Name","Journal Template Name");
                    ItemJnlLine.SETRANGE("Journal Batch Name","Journal Batch Name");
                    REPORT.RUNMODAL(REPORT::"Inventory Movement",TRUE,TRUE,ItemJnlLine);
                end;
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        ShowShortcutDimCode(ShortcutDimCode);
        OnAfterGetCurrRecord;
    end;

    trigger OnInsertRecord(BelowxRec : Boolean) : Boolean;
    begin
        IF "Entry Type" > "Entry Type"::"Negative Adjmt." THEN
          ERROR(Text000,"Entry Type");
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        SetUpNewLine(xRec);
        VALIDATE("Entry Type","Entry Type"::"Negative Adjmt.");
        CLEAR(ShortcutDimCode);
        OnAfterGetCurrRecord;
    end;

    trigger OnOpenPage();
    begin
        ItemJnlMgt.OpenJnl(CurrentJnlBatchName,Rec);
    end;

    var
        Text000 : Label 'You cannot use entry type %1 in this journal.';
        ItemJnlMgt : Codeunit ItemJnlManagement;
        ReportPrint : Codeunit "Test Report-Print";
        CalcWhseAdjmt : Report "Calculate Whse. Adjustment";
        CurrentJnlBatchName : Code[10];
        ItemDescription : Text[50];
        ShortcutDimCode : array [8] of Code[20];
        "---B2B------" : Integer;
        NegAdjItemJnlLine : Record "Item Journal Line";
        item : Record Item;

    [LineStart(14939)]
    local procedure CurrentJnlBatchNameOnAfterVali();
    begin
        CurrPage.SAVERECORD;
        ItemJnlMgt.SetName(CurrentJnlBatchName,Rec);
        CurrPage.UPDATE(FALSE);
    end;

    [LineStart(14944)]
    local procedure OnAfterGetCurrRecord();
    begin
        xRec := Rec;
        ItemJnlMgt.GetItem("Item No.",ItemDescription);
    end;
}

