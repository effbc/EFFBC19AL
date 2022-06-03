page 60054 "Item Sub Group"
{
    // version B2B1.0

    PageType = Worksheet;
    SourceTable = "Item Sub Group";

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
                field("Product Group Code"; "Product Group Code")
                {
                }
            }
        }
    }

    actions
    {
    }
}

