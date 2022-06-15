pageextension 70010 ApplyCustomerEntriesExt extends "Apply Customer Entries"
{
    layout
    {
        /* modify(Control1)
        {
            ShowCaption = false;
        }
        modify(Control41)
        {
            ShowCaption = false;
        }
        modify(Control1903222401)
        {
            ShowCaption = false;
        } */
        addfirst(Control1)
        {
            field("Entry No."; "Entry No.")
            {
            }
        }
        addafter("Posting Date")
        {
            field("Sale Order no"; "Sale Order no")
            {
            }
        }
        addafter("Document Type")
        {
            field("Payment Type"; "Payment Type")
            {
            }
            field("Customer ord No"; "Customer ord No")
            {
            }
        }
        addafter("Document No.")
        {
            field("invoice no"; "invoice no")
            {
            }
            field("External Document No."; "External Document No.")
            {
            }
        }
        addafter("Global Dimension 2 Code")
        {
            field("Payment Through"; "Payment Through")
            {
            }
        }
    }
    actions
    {
        modify("Set Applies-to ID")
        {
            Promoted = true;
            PromotedIsBig = true;
        }
        modify("Post Application")
        {
            Promoted = true;
        }
        modify("&Navigate")
        {
            Promoted = true;
        }
    }

    trigger OnOpenPage()
    begin
        SETRANGE("Posting Date", (DMY2Date(04, 01, 08)), (DMY2Date(31, 03, 2035)));
    end;
}

