page 60008 "CA Number"
{
    // version B2B1.0

    PageType = Worksheet;
    SourceTable = "CA Number";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("Code";Code)
                {
                }
                field(Description;Description)
                {
                }
            }
        }
    }

    actions
    {
    }
}

