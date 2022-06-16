pageextension 70273 PurchaseListExt extends "Purchase List"
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
        addafter("No.")
        {
            field("Packing Type"; "Packing Type")
            {
                ApplicationArea = All;

            }
        }
        addafter("Buy-from Vendor No.")
        {
            field("Sale Order No"; "Sale Order No")
            {
                ApplicationArea = All;

            }
            field("Order Date"; "Order Date")
            {
                ApplicationArea = All;

            }
            field(Structure; Structure)
            {
                ApplicationArea = All;

            }
            field("Vendor Cr. Memo No."; "Vendor Cr. Memo No.")
            {
                ApplicationArea = All;

            }
            field("Vendor Invoice No."; "Vendor Invoice No.")
            {
                ApplicationArea = All;

            }
        }
        addafter("Buy-from Vendor Name")
        {
            field("Receiving No. Series"; "Receiving No. Series")
            {
                ApplicationArea = All;

            }
            field("RFQ No."; "RFQ No.")
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