page 60206 Station
{
    PageType = Worksheet;
    SourceTable = Station;

    layout
    {
        area(content)
        {
            field("xRec.COUNT"; xRec.COUNT)
            {
            }
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Station Name"; "Station Name")
                {
                }
                field("Station Code"; "Station Code")
                {
                }
                field("Division code"; "Division code")
                {
                }
                field(Zone; Zone)
                {
                }
            }
        }
    }

    actions
    {
    }
}

