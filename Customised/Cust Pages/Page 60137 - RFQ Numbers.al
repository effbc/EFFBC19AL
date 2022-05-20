page 60137 "RFQ Numbers"
{
    // version POAU

    PageType = Worksheet;
    SourceTable = "Mech & Wirning Items";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("Production Order No.";"Production Order No.")
                {
                }
                field("BOM Type";"BOM Type")
                {
                }
                field(Quantity;Quantity)
                {
                }
                field("Production Order Line No.";"Production Order Line No.")
                {
                }
            }
        }
    }

    actions
    {
    }
}

