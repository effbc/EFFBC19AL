page 60149 "Item DesignWorkSheet HeadeList"
{
    // version DWS1.0

    Caption = 'Item DesignWorkSheet Header List';
    PageType = List;
    SourceTable = "Item Design Worksheet Header";

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
                field(Description;Description)
                {
                }
                field(Quantity;Quantity)
                {
                }
                field("Unit of Measure";"Unit of Measure")
                {
                }
                field("Components Cost";"Components Cost")
                {
                }
                field("Manufacturing Cost";"Manufacturing Cost")
                {
                }
                field("Total Cost (From Line)";"Total Cost (From Line)")
                {
                }
            }
        }
    }

    actions
    {
    }
}

