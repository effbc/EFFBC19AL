pageextension 70189 SalesOrderArchivesExt extends "Sales Order Archives"
{

    layout
    {





        addafter("Time Archived")
        {
            field("Sale Order Total Amount"; "Sale Order Total Amount")
            {
                ApplicationArea = All;
            }
            field("First Released Date Time"; "First Released Date Time")
            {
                ApplicationArea = All;
            }
            field("Order Date"; "Order Date")
            {
                ApplicationArea = All;
            }
            field("Customer Posting Group"; "Customer Posting Group")
            {
                ApplicationArea = All;
            }
        }
        addafter("Shipment Date")
        {
            field("Security Deposit Amount"; "Security Deposit Amount")
            {
                ApplicationArea = All;
            }
            field(Order_After_CF_Integration; Order_After_CF_Integration)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {


    }



}

