page 60026 "Product Customer's list"
{
    // version B2B1.0

    PageType = Worksheet;
    SourceTable = "SMTP SETUP";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("SMTP Port No"; "SMTP Port No")
                {
                }
                field("E-Mail From"; "E-Mail From")
                {
                }
            }
        }
    }

    actions
    {
    }
}

