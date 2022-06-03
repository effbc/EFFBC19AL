page 33000278 Assay
{
    // version QC1.1

    PageType = Document;
    SourceTable = "Assay Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; "No.")
                {
                    AssistEdit = true;

                    trigger OnAssistEdit();
                    begin
                        IF AssistEdit(xRec) THEN
                            CurrPage.UPDATE;
                    end;
                }
                field(Description; Description)
                {
                }
                field("Sampling Plan Code"; "Sampling Plan Code")
                {
                }
                field("Inspection Group Code"; "Inspection Group Code")
                {
                }
                field(Status; Status)
                {
                }
            }
            part(Control1000000010; "Assay Subform")
            {
                SubPageLink = Assay No.=FIELD(No.);
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        OnAfterGetCurrRecord;
    end;

    trigger OnNewRecord(BelowxRec: Boolean);
    begin
        OnAfterGetCurrRecord;
    end;

    [LineStart(23618)]
    local procedure OnAfterGetCurrRecord();
    begin
        xRec := Rec;
        SETRANGE("No.");
    end;
}

