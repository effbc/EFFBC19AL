page 60207 District
{
    PageType = Worksheet;
    SourceTable = "Item Wise Requirement1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Item No.";"Item No.")
                {
                }
                field("Required Quantity";"Required Quantity")
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

