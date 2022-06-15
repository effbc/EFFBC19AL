page 60048 "Except Rcpt. Date Tracking"
{
    // version B2B1.0

    PageType = List;
    SourceTable = "Excepted Rcpt.Date Tracking";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("Entry No."; "Entry No.")
                {
                }
                field("Document Type"; "Document Type")
                {
                }
                field("Document No."; "Document No.")
                {
                }
                field("Document Line No."; "Document Line No.")
                {
                }
                field("Item No."; "Item No.")
                {
                }
                field("User Id"; "User Id")
                {
                }
                field("Excepted Receipt Old Date"; "Excepted Receipt Old Date")
                {
                }
                field(Reason; Reason)
                {
                }
                field("Excepted Receipt New Date"; "Excepted Receipt New Date")
                {
                }
                field("Modified Date"; "Modified Date")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnQueryClosePage(CloseAction: Action): Boolean;
    begin
        IF (Reason = '') AND ("Item No." <> '') THEN
            ERROR('Plz Enter the Reason of the Excepted Receipt Date change');
    end;
}

