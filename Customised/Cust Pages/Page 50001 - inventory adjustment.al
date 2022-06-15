page 50001 "inventory adjustment"
{
    Permissions = TableData "Inventory Adjmt. Entry (Order)" = rimd;
    SourceTable = "Inventory Adjmt. Entry (Order)";
    SourceTableView = SORTING("Order Type", "Order No.", "Order Line No.") ORDER(Descending) WHERE("Order No." = FILTER('TTB13MOD*'));

    layout
    {
        area(content)
        {
            repeater(Control1102152002)
            {
                ShowCaption = false;
                field("Order No."; "Order No.")
                {
                }
                field("Order Line No."; "Order Line No.")
                {
                }
            }
        }
        area(factboxes)
        {
        }
    }

    actions
    {
    }
}

