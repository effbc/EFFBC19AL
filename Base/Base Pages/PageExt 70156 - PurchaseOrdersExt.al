pageextension 70156 PurchaseOrdersExt extends 56
{
    layout
    {
        /*  modify(Control1)
         {
             ShowCaption = false;
         } */
        addafter(Description)
        {
            field(Make; Make)
            {
            }
            field("Quantity Invoiced"; "Quantity Invoiced")
            {
            }
        }
        addafter("Expected Receipt Date")
        {
            field("Order Date"; "Order Date")
            {
            }
        }
        addafter("Buy-from Vendor No.")
        {
            field("Vendor Name"; "Vendor Name")
            {
            }
            field("Qty. to Receive"; "Qty. to Receive")
            {
            }
            field("Document Date"; "Document Date")
            {
            }
            field("Deviated Receipt Date"; "Deviated Receipt Date")
            {
            }
            field("Quantity Received"; "Quantity Received")
            {
            }
            field("Location Code"; "Location Code")
            {
            }
        }
    }
    actions
    {
        addafter("Reservation Entries")
        {
            action(Deviations)
            {
                Caption = 'Deviations';

                trigger OnAction();
                begin
                    "Excepted Rcpt.Date Tracking".SETRANGE("Excepted Rcpt.Date Tracking"."Document No.", "Document No.");
                    "Excepted Rcpt.Date Tracking".SETRANGE("Excepted Rcpt.Date Tracking"."Document Line No.", "Line No.");
                    PAGE.RUNMODAL(60048, "Excepted Rcpt.Date Tracking");
                end;
            }
        }
    }

    var
        "Excepted Rcpt.Date Tracking": Record "Excepted Rcpt.Date Tracking";
}

