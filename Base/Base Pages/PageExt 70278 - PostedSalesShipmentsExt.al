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
                ApplicationArea = All;
            }
        }
        addafter("Sell-to Customer Name")
        {
            field(Territory; Territory)
            {
                ApplicationArea = All;

            }
            field("Customer OrderNo."; "Customer OrderNo.")
            {
                ApplicationArea = All;

            }
            field("Posting Description"; "Posting Description")
            {
                ApplicationArea = All;

            }
        }
        addafter("Sell-to Country/Region Code")
        {
            field("RDSO Charges Paid By."; "RDSO Charges Paid By.")
            {
                ApplicationArea = All;

            }
            field("RDSO Inspection Required"; "RDSO Inspection Required")
            {
                ApplicationArea = All;

            }
            field("RDSO Inspection By"; "RDSO Inspection By")
            {
                ApplicationArea = All;

            }
            field("RDSO Charges"; "RDSO Charges")
            {
                ApplicationArea = All;

            }
        }
        addafter("Shipment Date")
        {
            field("Order No."; "Order No.")
            {
                ApplicationArea = All;

            }
            field("Order Date"; "Order Date")
            {
                ApplicationArea = All;

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