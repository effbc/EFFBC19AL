page 60302 "Posted Vouchers2"
{
    // version NAVIN3.70.00.03

    Editable = false;
    PageType = List;
    SourceTable = "G/L Entry";

    layout
    {
        area(content)
        {
            repeater(Control1280000)
            {
                ShowCaption = false;
                field("Posting Date";"Posting Date")
                {
                }
                field("System Date";"System Date")
                {
                }
                field("Payment Type";"Payment Type")
                {
                }
                field("Document No.";"Document No.")
                {
                    Editable = true;
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
                field("System-Created Entry";"System-Created Entry")
                {
                }
                field("Gen. Bus. Posting Group";"Gen. Bus. Posting Group")
                {
                }
                field("Gen. Prod. Posting Group";"Gen. Prod. Posting Group")
                {
                }
                field("Source No.";"Source No.")
                {
                }
                field("Source Code";"Source Code")
                {
                }
                field("G/L Account No.";"G/L Account No.")
                {
                }
                field("Bal. Account Type";"Bal. Account Type")
                {
                }
                field("Bal. Account No.";"Bal. Account No.")
                {
                }
                field(Description;Description)
                {
                }
                field(Amount;Amount)
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Ent&ry")
            {
                Caption = 'Ent&ry';
                action(Dimensions)
                {
                    Caption = 'Dimensions';
                }
                action("G/L Dimension Overview")
                {
                    Caption = 'G/L Dimension Overview';

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
            }
        }
        area(processing)
        {
            action("&Print")
            {
                Caption = '&Print';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                var
                    "G/LEntry" : Record "G/L Entry";
                begin
                    /*
                    "G/LEntry".SETRANGE("Document No.","Document No.");
                    "G/LEntry".SETRANGE("Posting Date","Posting Date");
                    "G/LEntry".SETRANGE("Document Type","Document Type");
                    IF "G/LEntry".FINDFIRST THEN
                      REPORT.RUNMODAL(13772,TRUE,TRUE,"G/LEntry");
                    */
                    "G/LEntry".SETRANGE("Document No.","Document No.");
                    "G/LEntry".SETRANGE("Posting Date","Posting Date");
                    "G/LEntry".SETRANGE("Document Type","Document Type");
                    "G/LEntry".SETRANGE("Payment Type","Payment Type");
                    IF "G/LEntry".FINDFIRST THEN
                      REPORT.RUNMODAL(60002,TRUE,TRUE,"G/LEntry");

                end;
            }
            action("&Navigate")
            {
                Caption = '&Navigate';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    Navigate.SetDoc("Posting Date","Document No.");
                    Navigate.RUN;
                end;
            }
        }
    }

    trigger OnInit();
    begin
        RESET
    end;

    trigger OnOpenPage();
    begin
        SETRANGE("Posting Date",(040108D),(03312035D));      //srinivas
    end;

    var
        GLAcc : Record "G/L Account";
        TempGLEntry : Record "G/L Entry" temporary;
        AnalysisViewEntry : Record "Analysis View Entry";
        RunOnTempRec : Boolean;
        ReportPrint : Codeunit "Test Report-Print";
        Navigate : Page Navigate;

    [LineStart(21818)]
    procedure SetAnalysisViewEntry(var NewAnalysisViewEntry : Record "Analysis View Entry");
    var
        AnalysisViewEntryToGLEntries : Codeunit AnalysisViewEntryToGLEntries;
    begin
        AnalysisViewEntry := NewAnalysisViewEntry;
        RunOnTempRec := TRUE;
        AnalysisViewEntryToGLEntries.GetGLEntries(AnalysisViewEntry,TempGLEntry);
    end;

    [LineStart(21823)]
    local procedure GetCaption() : Text[250];
    begin
        IF GLAcc."No." <> "G/L Account No." THEN
          IF NOT GLAcc.GET("G/L Account No.") THEN
            IF GETFILTER("G/L Account No.") <> '' THEN
              IF GLAcc.GET(GETRANGEMIN("G/L Account No.")) THEN;
        EXIT(STRSUBSTNO('%1 %2',GLAcc."No.",GLAcc.Name))
    end;
}

