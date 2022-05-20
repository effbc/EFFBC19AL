page 99000773 "Capacity Journal"
{
    // version NAVW19.00.00.45778,Rev01

    AutoSplitKey = true;
    CaptionML = ENU='Capacity Journal',
                ENN='Capacity Journal';
    DataCaptionFields = "Journal Batch Name";
    DelayedInsert = true;
    PageType = Worksheet;
    SaveValues = true;
    SourceTable = "Item Journal Line";

    layout
    {
        area(content)
        {
            field(CurrentJnlBatchName;CurrentJnlBatchName)
            {
                CaptionML = ENU='Batch Name',
                            ENN='Batch Name';
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
                field("Order No.";"Order No.")
                {
                    Visible = false;
                }
                field("Document No.";"Document No.")
                {
                }
                field(Remarks;Remarks)
                {
                }
                field("Item No.";"Item No.")
                {
                    Visible = false;

                    trigger OnLookup(Text : Text) : Boolean;
                    begin
                        LookupItemNo;
                        ShowShortcutDimCode(ShortcutDimCode);
                    end;

                    trigger OnValidate();
                    begin
                        ShowShortcutDimCode(ShortcutDimCode);
                    end;
                }
                field("Operation No.";"Operation No.")
                {
                    Visible = false;
                }
                field(Type;Type)
                {
                    OptionCaptionML = ENU='Work Center,Machine Center',
                                      ENN='Work Center,Machine Center';

                    trigger OnValidate();
                    begin
                        ItemJnlMgt.GetCapacity(Type,"No.",CapDescription);
                    end;
                }
                field(Quantity;Quantity)
                {
                }
                field("Location Code";"Location Code")
                {
                }
                field("No.";"No.")
                {

                    trigger OnValidate();
                    begin
                        ItemJnlMgt.GetCapacity(Type,"No.",CapDescription);
                    end;
                }
                field(Description;Description)
                {
                }
                field("Work Shift Code";"Work Shift Code")
                {
                    Visible = false;
                }
                field("Starting Time";"Starting Time")
                {
                    Visible = false;
                }
                field("Ending Time";"Ending Time")
                {
                    Visible = false;
                }
                field("Concurrent Capacity";"Concurrent Capacity")
                {
                    Visible = false;
                }
                field("Stop Time";"Stop Time")
                {
                }
                field("Cap. Unit of Measure Code";"Cap. Unit of Measure Code")
                {
                }
                field("Stop Code";"Stop Code")
                {
                }
                field("Scrap Code";"Scrap Code")
                {
                    Visible = false;
                }
                field("Output Quantity";"Output Quantity")
                {
                    Visible = false;
                }
                field("Scrap Quantity";"Scrap Quantity")
                {
                    Visible = false;
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                    Visible = false;
                }
                field("ShortcutDimCode[3]";ShortcutDimCode[3])
                {
                    CaptionClass = '1,2,3';
                    TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(3),Dimension Value Type=CONST(Standard),Blocked=CONST(No));
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(3,ShortcutDimCode[3]);
                    end;
                }
                field("ShortcutDimCode[4]";ShortcutDimCode[4])
                {
                    CaptionClass = '1,2,4';
                    TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(4),Dimension Value Type=CONST(Standard),Blocked=CONST(No));
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(4,ShortcutDimCode[4]);
                    end;
                }
                field("ShortcutDimCode[5]";ShortcutDimCode[5])
                {
                    CaptionClass = '1,2,5';
                    TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(5),Dimension Value Type=CONST(Standard),Blocked=CONST(No));
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(5,ShortcutDimCode[5]);
                    end;
                }
                field("ShortcutDimCode[6]";ShortcutDimCode[6])
                {
                    CaptionClass = '1,2,6';
                    TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(6),Dimension Value Type=CONST(Standard),Blocked=CONST(No));
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(6,ShortcutDimCode[6]);
                    end;
                }
                field("ShortcutDimCode[7]";ShortcutDimCode[7])
                {
                    CaptionClass = '1,2,7';
                    TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(7),Dimension Value Type=CONST(Standard),Blocked=CONST(No));
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(7,ShortcutDimCode[7]);
                    end;
                }
                field("ShortcutDimCode[8]";ShortcutDimCode[8])
                {
                    CaptionClass = '1,2,8';
                    TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(8),Dimension Value Type=CONST(Standard),Blocked=CONST(No));
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(8,ShortcutDimCode[8]);
                    end;
                }
                field("Document Date";"Document Date")
                {
                    Visible = false;
                }
                field("Reason Code";"Reason Code")
                {
                    Visible = false;
                }
                field("External Document No.";"External Document No.")
                {
                    Visible = false;
                }
            }
            group(Control73)
            {
                ShowCaption = false;
                fixed(Control1902114901)
                {
                    ShowCaption = false;
                    group("Capacity Name")
                    {
                        CaptionML = ENU='Capacity Name',
                                    ENN='Capacity Name';
                        field(CapDescription;CapDescription)
                        {
                            Editable = false;
                        }
                    }
                    group("Work Date")
                    {
                        Caption = 'Work Date';
                        field(WorkDate;WORKDATE)
                        {
                            Editable = false;
                        }
                    }
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207;Links)
            {
                Visible = false;
            }
            systempart(Control1905767507;Notes)
            {
                Visible = false;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Line")
            {
                CaptionML = ENU='&Line',
                            ENN='&Line';
                Image = Line;
                action(Dimensions)
                {
                    AccessByPermission = TableData Dimension=R;
                    CaptionML = ENU='Dimensions',
                                ENN='Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction();
                    begin
                        ShowDimensions;
                        CurrPage.SAVERECORD;
                    end;
                }
                action("Item &Tracking Lines")
                {
                    CaptionML = ENU='Item &Tracking Lines',
                                ENN='Item &Tracking Lines';
                    Image = ItemTrackingLines;
                    ShortCutKey = 'Shift+Ctrl+I';

                    trigger OnAction();
                    begin
                        OpenItemTrackingLines(FALSE);
                    end;
                }
            }
            group("&Capacity")
            {
                CaptionML = ENU='&Capacity',
                            ENN='&Capacity';
                Image = Capacity;
                action(Card)
                {
                    CaptionML = ENU='Card',
                                ENN='Card';
                    Image = EditLines;
                    ShortCutKey = 'Shift+F7';

                    trigger OnAction();
                    var
                        WorkCenter : Record "Work Center";
                        MachCenter : Record "Machine Center";
                    begin
                        CASE Type OF
                          Type::"Work Center":
                            BEGIN
                              WorkCenter.SETRANGE("No.","No.");
                              PAGE.RUN(PAGE::"Work Center Card",WorkCenter);
                            END;
                          Type::"Machine Center":
                            BEGIN
                              MachCenter.SETRANGE("No.","No.");
                              PAGE.RUN(PAGE::"Machine Center Card",MachCenter);
                            END;
                        END;
                    end;
                }
                action("Ledger E&ntries")
                {
                    CaptionML = ENU='Ledger E&ntries',
                                ENN='Ledger E&ntries';
                    Image = CustomerLedger;
                    RunObject = Page "Capacity Ledger Entries";
                    RunPageLink = Order Type=CONST(Production),Order No.=FIELD(Order No.);
                    ShortCutKey = 'Ctrl+F7';
                }
            }
        }
        area(processing)
        {
            group("P&osting")
            {
                CaptionML = ENU='P&osting',
                            ENN='P&osting';
                Image = Post;
                action("Test Report")
                {
                    CaptionML = ENU='Test Report',
                                ENN='Test Report';
                    Ellipsis = true;
                    Image = TestReport;

                    trigger OnAction();
                    begin
                        ReportPrint.PrintItemJnlLine(Rec);
                    end;
                }
                action("P&ost")
                {
                    CaptionML = ENU='P&ost',
                                ENN='P&ost';
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';

                    trigger OnAction();
                    begin
                        CODEUNIT.RUN(CODEUNIT::"Item Jnl.-Post",Rec);
                        CurrentJnlBatchName := GETRANGEMAX("Journal Batch Name");
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                action("Post and &Print")
                {
                    CaptionML = ENU='Post and &Print',
                                ENN='Post and &Print';
                    Image = PostPrint;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+F9';

                    trigger OnAction();
                    begin
                        CODEUNIT.RUN(CODEUNIT::"Item Jnl.-Post+Print",Rec);
                        CurrentJnlBatchName := GETRANGEMAX("Journal Batch Name");
                        CurrPage.UPDATE(FALSE);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        ItemJnlMgt.GetCapacity(Type,"No.",CapDescription);
    end;

    trigger OnAfterGetRecord();
    begin
        ShowShortcutDimCode(ShortcutDimCode);
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        SetUpNewLine(xRec);
        VALIDATE("Entry Type","Entry Type"::Output);
        CLEAR(ShortcutDimCode);
        "Gen. Prod. Posting Group":='MISC';
              Type:=Type::"Machine Center";
    end;

    trigger OnOpenPage();
    var
        JnlSelected : Boolean;
    begin
        IF IsOpenedFromBatch THEN BEGIN
          CurrentJnlBatchName := "Journal Batch Name";
          ItemJnlMgt.OpenJnl(CurrentJnlBatchName,Rec);
          EXIT;
        END;
        ItemJnlMgt.TemplateSelection(PAGE::"Capacity Journal",6,FALSE,Rec,JnlSelected);
        IF NOT JnlSelected THEN
          ERROR('');
        ItemJnlMgt.OpenJnl(CurrentJnlBatchName,Rec);
    end;

    var
        ItemJnlMgt : Codeunit ItemJnlManagement;
        ReportPrint : Codeunit "Test Report-Print";
        CapDescription : Text[30];
        CurrentJnlBatchName : Code[10];
        ShortcutDimCode : array [8] of Code[20];

    [LineStart(23830)]
    local procedure CurrentJnlBatchNameOnAfterVali();
    begin
        CurrPage.SAVERECORD;
        ItemJnlMgt.SetName(CurrentJnlBatchName,Rec);
        CurrPage.UPDATE(FALSE);
    end;
}

