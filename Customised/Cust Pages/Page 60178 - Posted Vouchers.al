page 60178 "Posted Vouchers"
{
    // version Rev01

    Editable = false;
    PageType = List;
    Permissions = TableData "G/L Entry"=rimd;
    SourceTable = "G/L Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Posting Date";"Posting Date")
                {
                }
                field("Document No.";"Document No.")
                {
                }
                field("Payment Through";"Payment Through")
                {
                }
                field("Payment Type";"Payment Type")
                {
                }
                field(Amount;Amount)
                {
                }
                field("Document Type";"Document Type")
                {
                }
                field("Entry No.";"Entry No.")
                {
                }
                field("External Document No.";"External Document No.")
                {
                }
                field("Global Dimension 2 Code";"Global Dimension 2 Code")
                {
                }
                field("customer Ord No";"customer Ord No")
                {
                }
                field("Source Type";"Source Type")
                {
                }
                field("Cheque Date";"Cheque Date")
                {
                }
                field("Document Date";"Document Date")
                {
                }
                field("Cheque No.";"Cheque No.")
                {
                }
                field("Global Dimension 1 Code";"Global Dimension 1 Code")
                {
                }
                field("User ID";"User ID")
                {
                }
                field("Gen. Posting Type";"Gen. Posting Type")
                {
                }
                field("Gen. Bus. Posting Group";"Gen. Bus. Posting Group")
                {
                }
                field("System-Created Entry";"System-Created Entry")
                {
                }
                field("Gen. Prod. Posting Group";"Gen. Prod. Posting Group")
                {
                }
                field("Source No.";"Source No.")
                {
                }
                field(Description;Description)
                {
                }
                field("G/L Account No.";"G/L Account No.")
                {
                }
                field("Sale Order No.";"Sale Order No.")
                {
                }
                field("Tender No";"Tender No")
                {
                }
            }
            group(Control1102152035)
            {
                ShowCaption = false;
                field("Rec.COUNT";Rec.COUNT)
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Entry)
            {
                Caption = 'Entry';
                action(Dimensions)
                {
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'Shift+Ctrl+D';
                    Visible = false;
                }
                action("G/L Dimension Overview")
                {
                    Image = DimensionSets;

                    trigger OnAction();
                    var
                        GLEntriesDimOverview : Page "G/L Entries Dimension Overview";
                    begin
                        IF RunOnTempRec THEN BEGIN
                          GLEntriesDimOverview.SetTempGLEntry(TempGLEntry);
                          GLEntriesDimOverview.RUN;
                        END ELSE
                          PAGE.RUN(PAGE::"G/L Entries Dimension Overview",Rec);
                    end;
                }
                action(Navigate)
                {
                    Image = Navigate;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'F6';

                    trigger OnAction();
                    begin

                        Navigate.SetDoc("Posting Date","Document No.");
                        Navigate.RUN;
                    end;
                }
            }
        }
        area(reporting)
        {
            group(Action1102152027)
            {
                action(Print)
                {
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    var
                        "G/LEntry" : Record "G/L Entry";
                        DGLE : Record "Detailed GST Ledger Entry";
                    begin
                        DGLE.RESET;
                        DGLE.SETRANGE("Transaction Type",DGLE."Transaction Type"::Purchase,DGLE."Transaction Type"::Sales);
                        DGLE.SETRANGE("Document Type",DGLE."Document Type"::Payment);
                        DGLE.SETRANGE("Document No.","Document No.");
                        DGLE.SETRANGE("Posting Date","Posting Date");
                        DGLE.SETFILTER("GST Amount",'<>%1',0);
                        IF DGLE.FINDFIRST THEN
                          REPORT.RUNMODAL(33000907,TRUE,TRUE,DGLE)
                        ELSE BEGIN
                        "G/LEntry".SETRANGE("Document No.","Document No.");
                        "G/LEntry".SETRANGE("Posting Date","Posting Date");
                        "G/LEntry".SETRANGE("Document Type","Document Type");
                        "G/LEntry".SETRANGE("Payment Type","Payment Type");
                        IF "G/LEntry".FINDFIRST THEN
                          REPORT.RUNMODAL(33000907,TRUE,TRUE,"G/LEntry");
                        END;
                    end;
                }
            }
        }
    }

    trigger OnOpenPage();
    begin
        SETRANGE("Posting Date",(040108D),(03312035D));
    end;

    var
        Navigate : Page Navigate;
        GLAcc : Record "G/L Account";
        TempGLEntry : Record "G/L Entry" temporary;
        AnalysisViewEntry : Record "Analysis View Entry";
        RunOnTempRec : Boolean;
        ReportPrint : Codeunit "Test Report-Print";

    [LineStart(14081)]
    procedure SetAnalysisViewEntry(var NewAnalysisViewEntry : Record "Analysis View Entry");
    var
        AnalysisViewEntryToGLEntries : Codeunit AnalysisViewEntryToGLEntries;
    begin
        AnalysisViewEntry := NewAnalysisViewEntry;
        RunOnTempRec := TRUE;
        AnalysisViewEntryToGLEntries.GetGLEntries(AnalysisViewEntry,TempGLEntry);
    end;

    [LineStart(14086)]
    local procedure GetCaption() : Text[250];
    begin
        IF GLAcc."No." <> "G/L Account No." THEN
          IF NOT GLAcc.GET("G/L Account No.") THEN
            IF GETFILTER("G/L Account No.") <> '' THEN
              IF GLAcc.GET(GETRANGEMIN("G/L Account No.")) THEN;
        EXIT(STRSUBSTNO('%1 %2',GLAcc."No.",GLAcc.Name))
    end;
}

