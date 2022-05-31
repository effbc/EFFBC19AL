page 33000290 "Quality Comment Sheet"
{
    // version QC1.1

    AutoSplitKey = true;
    Caption = 'Quality Comment Sheet';
    DelayedInsert = true;
    MultipleNewLines = true;
    PageType = Worksheet;
    SourceTable = "Quality Comment Line";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field(Date; Date)
                {
                }
                field(Comment; Comment)
                {
                }
                field("Code"; Code)
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean);
    begin
        SetUpNewLine;
    end;

    var
        Text000: Label 'untitled';
        Text001: Label 'Fin. Charge Memo';

    [LineStart(23640)]
    procedure Caption(FinChrgCommentLine: Record "Fin. Charge Comment Line"): Text[110];
    begin
        IF FinChrgCommentLine."No." = '' THEN
            EXIT(Text000);
        EXIT(Text001 + ' ' + FinChrgCommentLine."No." + ' ');
    end;
}

