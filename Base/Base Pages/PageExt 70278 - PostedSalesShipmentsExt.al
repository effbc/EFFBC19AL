pageextension 70278 PostedSalesShipmentsExt extends 142
{
    layout
    {
        addfirst(Control1)
        {
            field("xRec.COUNT"; xRec.COUNT)
            {
                Style = Standard;
                StyleExpr = TRUE;
            }
        }
        addafter("Sell-to Customer Name")
        {
            field(Territory; Territory)
            {

            }
            field("Customer OrderNo."; "Customer OrderNo.")
            {

            }
            field("Posting Description"; "Posting Description")
            {

            }
        }
        addafter("Sell-to Country/Region Code")
        {
            field("RDSO Charges Paid By."; "RDSO Charges Paid By.")
            {

            }
            field("RDSO Inspection Required"; "RDSO Inspection Required")
            {

            }
            field("RDSO Inspection By"; "RDSO Inspection By")
            {

            }
            field("RDSO Charges"; "RDSO Charges")
            {

            }
        }
        addafter("Shipment Date")
        {
            field("Order No."; "Order No.")
            {

            }
            field("Order Date"; "Order Date")
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