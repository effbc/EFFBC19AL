page 60038 "Network Datalogger Job"
{
    // version B2B1.0

    PageType = List;
    SourceTable = "Item Wise Min. Req. Qty at Loc";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("Unit Cost (LCY)"; "Unit Cost (LCY)")
                {
                }
                field("Type Of Module"; "Type Of Module")
                {
                }
                field("Minimum Stock Quantity"; "Minimum Stock Quantity")
                {
                }
                field("Old Stock"; "Old Stock")
                {
                }
                field("Actual Qty"; "Actual Qty")
                {
                }
                field("Warranty Qty"; "Warranty Qty")
                {
                }
            }
        }
    }

    actions
    {
    }
}

