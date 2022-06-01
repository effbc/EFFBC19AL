page 50000 "Location of service item"
{
    Caption = 'Location of service item';
    PageType = Worksheet;
    SourceTable = "Location of service item";
    SourceTableView = ORDER(Ascending);

    layout
    {
        area(content)
        {
            repeater(Control1000000009)
            {
                ShowCaption = false;
                field("Station No"; "Station No")
                {
                }
                field("Station name"; "Station name")
                {
                }
            }
        }
    }

    actions
    {
    }
}

