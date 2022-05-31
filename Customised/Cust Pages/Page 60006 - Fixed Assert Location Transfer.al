page 60006 "Fixed Assert Location Transfer"
{
    // version B2B1.0

    PageType = Worksheet;
    SourceTable = "Fixed Asset Transfer";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field(Date; Date)
                {
                }
                field("Fixed Asset No."; "Fixed Asset No.")
                {
                }
                field("FA Location"; "FA Location")
                {
                }
                field("FA New Location"; "FA New Location")
                {
                }
                field("Location Trns. Reason"; "Location Trns. Reason")
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
        IF ("Location Trns. Reason" = '') AND ("Fixed Asset No." <> '') THEN
            ERROR('Plz Enter the Transfer reason');
    end;
}

