page 60205 Division
{
    Editable = false;
    PageType = List;
    SourceTable = Division;

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
                field("Zone code"; "Zone code")
                {
                }
                field("Division Code"; "Division Code")
                {
                }
                field("Division Name"; "Division Name")
                {
                }
            }
        }
    }

    actions
    {
    }
}

