page 60204 "Zones-cs"
{
    PageType = Worksheet;
    SourceTable = Zones;

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
                field("Zone Code"; "Zone Code")
                {
                }
                field("Zone Name"; "Zone Name")
                {
                }
            }
        }
    }

    actions
    {
    }
}

