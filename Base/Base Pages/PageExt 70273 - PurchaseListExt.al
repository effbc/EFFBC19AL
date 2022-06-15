pageextension 70273 PurchaseListExt extends "Purchase List"
{
    layout
    {
        addfirst(content)
        {
            field("xRec.COUNT"; xRec.COUNT)
            {
                Style = Strong;
                StyleExpr = TRUE;
            }
        }
        addafter("No.")
        {
            field("Packing Type"; "Packing Type")
            {

            }
        }
        addafter("Buy-from Vendor No.")
        {
            field("Sale Order No"; "Sale Order No")
            {

            }
            field("Order Date"; "Order Date")
            {

            }
            field(Structure; Structure)
            {

            }
            field("Vendor Cr. Memo No."; "Vendor Cr. Memo No.")
            {

            }
            field("Vendor Invoice No."; "Vendor Invoice No.")
            {

            }
        }
        addafter("Buy-from Vendor Name")
        {
            field("Receiving No. Series"; "Receiving No. Series")
            {

            }
            field("RFQ No."; "RFQ No.")
            {

            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}