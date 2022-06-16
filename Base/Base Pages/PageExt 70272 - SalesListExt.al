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
                ApplicationArea = All;
            }
        }
        addafter("Sell-to Customer No.")
        {
            field("Installation Amount"; "Installation Amount")
            {
                ApplicationArea = All;

            }

            field("Bought out Items Amount"; "Bought out Items Amount")
            {
                ApplicationArea = All;

            }
            field("Order Released Date"; "Order Released Date")
            {
                ApplicationArea = All;

            }
            field("Blanket Order No"; "Blanket Order No")
            {
                ApplicationArea = All;

            }
            field("Software Amount"; "Software Amount")
            {
                ApplicationArea = All;

            }
            field("Payment Terms Code"; "Payment Terms Code")
            {
                ApplicationArea = All;

            }
            field("Order Status"; "Order Status")
            {
                ApplicationArea = All;

            }
            field("Expecting Week"; "Expecting Week")
            {
                ApplicationArea = All;

            }
            field("Total Order(LOA)Value"; "Total Order(LOA)Value")
            {
                Visible = FALSE;
                ApplicationArea = All;
            }
            field(Reserve; Reserve)
            {
                ApplicationArea = All;

            }
            field("Pending(LOA)Value"; "Pending(LOA)Value")
            {
                ApplicationArea = All;

            }
            field(Territory; Territory)
            {
                ApplicationArea = All;

            }
            field("Promised Delivery Date"; "Promised Delivery Date")
            {
                ApplicationArea = All;

            }
            field("Shipment Date"; "Shipment Date")
            {
                ApplicationArea = All;

            }
            field("Order Date"; "Order Date")
            {
                ApplicationArea = All;

            }
            field("Assured Date"; "Assured Date")
            {
                ApplicationArea = All;

            }
            field("Security Deposit Status"; "Security Deposit Status")
            {
                ApplicationArea = All;

            }
            field("Sell-to Address 2"; "Sell-to Address 2")
            {
                ApplicationArea = All;

            }
            field("Sale Order Total Amount"; "Sale Order Total Amount")
            {
                ApplicationArea = All;

            }
            field("Tender No."; "Tender No.")
            {
                ApplicationArea = All;

            }
            field("Requested Delivery Date"; "Requested Delivery Date")
            {
                ApplicationArea = All;

            }
            field("Customer OrderNo."; "Customer OrderNo.")
            {
                ApplicationArea = All;

            }
            field("Customer Order Date"; "Customer Order Date")
            {
                ApplicationArea = All;

            }
            field("Customer Posting Group"; "Customer Posting Group")
            {
                ApplicationArea = All;

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
                ApplicationArea = All;

            }
            field("Type of Product"; "Type of Product")
            {
                ApplicationArea = All;

            }
            field("Type of Enquiry"; "Type of Enquiry")
            {
                ApplicationArea = All;

            }
            field("Project Completion Date"; "Project Completion Date")
            {
                ApplicationArea = All;

            }
            field("Extended Date"; "Extended Date")
            {
                ApplicationArea = All;

            }
        }
        addafter("Sell-to Contact")
        {
            field("RDSO Charges Paid By"; "RDSO Charges Paid By")
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
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}