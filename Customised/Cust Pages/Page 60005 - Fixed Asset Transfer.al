page 60005 "Fixed Asset Transfer"
{
    // version B2B1.0

    Editable = false;
    PageType = List;
    SourceTable = "Fixed Asset Transfer";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("Fixed Asset No.";"Fixed Asset No.")
                {
                }
                field("FA Location";"FA Location")
                {
                }
                field("FA New Location";"FA New Location")
                {
                }
                field("Location Trns. Reason";"Location Trns. Reason")
                {
                }
                field("Responsible Employee";"Responsible Employee")
                {
                }
                field("New Responsible Employee";"New Responsible Employee")
                {
                }
                field("Employee Trns. Reason";"Employee Trns. Reason")
                {
                }
                field("User id";"User id")
                {
                }
                field(Date;Date)
                {
                }
            }
        }
    }

    actions
    {
    }
}

