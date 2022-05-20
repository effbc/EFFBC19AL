page 60012 "Design Worksheet List"
{
    // version B2B1.0

    CardPageID = "Design Worksheet";
    PageType = List;
    SourceTable = "Design Worksheet Header";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("Document No.";"Document No.")
                {
                }
                field("Document Type";"Document Type")
                {
                }
                field("Document Line No.";"Document Line No.")
                {
                }
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
                    Visible = false;
                }
                field("Manufacturing Cost";"Manufacturing Cost")
                {
                    Visible = false;
                }
                field("Resource Cost";"Resource Cost")
                {
                    Visible = false;
                }
                field("Development Cost";"Development Cost")
                {
                }
                field("Installation Cost";"Installation Cost")
                {
                }
                field("Total Cost";"Total Cost")
                {
                }
                field("Additional Cost";"Additional Cost")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

