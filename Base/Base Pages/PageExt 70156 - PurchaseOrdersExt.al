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
                ApplicationArea = All;
            }
            field("Quantity Invoiced"; "Quantity Invoiced")
            {
                ApplicationArea = All;
            }
        }
        addafter("Expected Receipt Date")
        {
            field("Order Date"; "Order Date")
            {
                ApplicationArea = All;
            }
        }
        addafter("Buy-from Vendor No.")
        {
            field("Vendor Name"; "Vendor Name")
            {
                ApplicationArea = All;
            }
            field("Qty. to Receive"; "Qty. to Receive")
            {
                ApplicationArea = All;
            }
            field("Document Date"; "Document Date")
            {
                ApplicationArea = All;
            }
            field("Deviated Receipt Date"; "Deviated Receipt Date")
            {
                ApplicationArea = All;
            }
            field("Quantity Received"; "Quantity Received")
            {
                ApplicationArea = All;
            }
            field("Location Code"; "Location Code")
            {
                ApplicationArea = All;
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
                ApplicationArea = All;

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

