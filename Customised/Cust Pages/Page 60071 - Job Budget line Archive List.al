page 60071 "Job Budget line Archive List"
{
    // version B2B1.0

    PageType = ListPart;
    SourceTable = "Item wise Requirement";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("Item No.";"Item No.")
                {
                }
                field(Description;Description)
                {
                }
                field("Required Quantity";"Required Quantity")
                {
                }
                field("Qty. In Material Issues";"Qty. In Material Issues")
                {
                }
            }
        }
    }

    actions
    {
    }
}

