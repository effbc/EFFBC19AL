page 60074 "Defect Master"
{
    // version B2B1.0

    PageType = Worksheet;
    SourceTable = "Defect Master";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("Code"; Code)
                {
                }
                field(Description; Description)
                {
                }
            }
        }
    }

    actions
    {
    }
}

