page 60007 "Fixed Asset Emp.Trans Reason"
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
                field("Responsible Employee"; "Responsible Employee")
                {
                }
                field("New Responsible Employee"; "New Responsible Employee")
                {
                }
                field("Employee Trns. Reason"; "Employee Trns. Reason")
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
        IF ("Fixed Asset No." <> '') AND ("Employee Trns. Reason" = '') THEN
            ERROR('Plz Enter the Transfer reason');
    end;
}

