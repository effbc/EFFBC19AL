pageextension 70147 PurchaseLinesExt extends "Purchase Lines"
{
    layout
    {

        addafter("Document No.")
        {
            field("Vendor Name"; Rec."Vendor Name")
            {

            }

        }
        addafter("Buy-from Vendor No.")
        {

            field("Qty. Invoiced (Base)"; Rec."Qty. Invoiced (Base)")
            {

            }
        }
        addafter(Type)
        {
            field(Make; Rec.Make)
            {

            }
            field("Qty. Received (Base)"; Rec."Qty. Received (Base)")
            {

            }
            field("Order Date"; Rec."Order Date")
            {

            }
        }
        addafter("No.")
        {
            field(gst_group_code_reverse_charge; Rec.gst_group_code_reverse_charge)
            {

            }

        }
        addafter("Outstanding Amount (LCY)")
        {
            field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
            {

            }
        }
        addafter("Amt. Rcd. Not Invoiced (LCY)")
        {
            field("Sales Order No."; Rec."Sales Order No.")
            {

            }
            field("Sales Order Line No."; Rec."Sales Order Line No.")
            {

            }
        }



    }

}

