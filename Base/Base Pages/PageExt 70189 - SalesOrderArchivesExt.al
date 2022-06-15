pageextension 70189 SalesOrderArchivesExt extends "Sales Order Archives"
{

    layout
    {





        addafter("Time Archived")
        {
            field("Sale Order Total Amount"; "Sale Order Total Amount")
            {
            }
            field("First Released Date Time"; "First Released Date Time")
            {
            }
            field("Order Date"; "Order Date")
            {
            }
            field("Customer Posting Group"; "Customer Posting Group")
            {
            }
        }
        addafter("Shipment Date")
        {
            field("Security Deposit Amount"; "Security Deposit Amount")
            {
            }
            field(Order_After_CF_Integration; Order_After_CF_Integration)
            {
            }
        }
    }
    actions
    {


    }



}

