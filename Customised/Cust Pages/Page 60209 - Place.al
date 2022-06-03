page 60209 Place
{
    PageType = Worksheet;
    SourceTable = Place;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Place Code"; "Place Code")
                {
                    Caption = '"Activity "';
                }
                field("Place Name"; "Place Name")
                {
                    Caption = 'Activity Name';
                }
            }
        }
    }

    actions
    {
    }
}

