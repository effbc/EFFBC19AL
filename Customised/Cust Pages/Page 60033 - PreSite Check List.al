page 60033 "PreSite Check List"
{
    // version B2B1.0

    PageType = List;
    SourceTable = "Pre Site Check List Parameters";

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

