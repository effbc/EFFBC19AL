pageextension 70272 SalesListExt extends "Sales List"
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
        addafter("Sell-to Customer No.")
        {
            field("Installation Amount"; "Installation Amount")
            {

            }

            field("Bought out Items Amount"; "Bought out Items Amount")
            {

            }
            field("Order Released Date"; "Order Released Date")
            {

            }
            field("Blanket Order No"; "Blanket Order No")
            {

            }
            field("Software Amount"; "Software Amount")
            {

            }
            field("Payment Terms Code"; "Payment Terms Code")
            {

            }
            field("Order Status"; "Order Status")
            {

            }
            field("Expecting Week"; "Expecting Week")
            {

            }
            field("Total Order(LOA)Value"; "Total Order(LOA)Value")
            {
                Visible = FALSE;
            }
            field(Reserve; Reserve)
            {

            }
            field("Pending(LOA)Value"; "Pending(LOA)Value")
            {

            }
            field(Territory; Territory)
            {

            }
            field("Promised Delivery Date"; "Promised Delivery Date")
            {

            }
            field("Shipment Date"; "Shipment Date")
            {

            }
            field("Order Date"; "Order Date")
            {

            }
            field("Assured Date"; "Assured Date")
            {

            }
            field("Security Deposit Status"; "Security Deposit Status")
            {

            }
            field("Sell-to Address 2"; "Sell-to Address 2")
            {

            }
            field("Sale Order Total Amount"; "Sale Order Total Amount")
            {

            }
            field("Tender No."; "Tender No.")
            {

            }
            field("Requested Delivery Date"; "Requested Delivery Date")
            {

            }
            field("Customer OrderNo."; "Customer OrderNo.")
            {

            }
            field("Customer Order Date"; "Customer Order Date")
            {

            }
            field("Customer Posting Group"; "Customer Posting Group")
            {

            }
        }
        modify("Document Date")
        {
            Caption = 'Enquiry Date';
        }
        addafter("Sell-to Customer Name")
        {

            field("Enquiry Status"; "Enquiry Status")
            {

            }
            field("Type of Product"; "Type of Product")
            {

            }
            field("Type of Enquiry"; "Type of Enquiry")
            {

            }
            field("Project Completion Date"; "Project Completion Date")
            {

            }
            field("Extended Date"; "Extended Date")
            {

            }
        }
        addafter("Sell-to Contact")
        {
            field("RDSO Charges Paid By"; "RDSO Charges Paid By")
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
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}