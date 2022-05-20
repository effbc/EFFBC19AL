page 60035 "Status Parameters"
{
    // version B2B1.0

    PageType = Worksheet;
    SourceTable = "Status Parameters";

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
                field("Status Sequence";"Status Sequence")
                {
                }
            }
        }
    }

    actions
    {
    }
}

