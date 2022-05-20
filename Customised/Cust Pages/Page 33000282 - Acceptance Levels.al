page 33000282 "Acceptance Levels"
{
    // version QC1.0

    PageType = Worksheet;
    SourceTable = "Acceptance Level";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Code";Code)
                {
                }
                field(Description;Description)
                {
                }
                field(Type;Type)
                {
                }
                field("Reason Code";"Reason Code")
                {
                }
                field("Vendor Rating";"Vendor Rating")
                {
                }
            }
        }
    }

    actions
    {
    }
}

