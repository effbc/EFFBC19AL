pageextension 70283 PostedPurchaseCreditMemosExt extends 147
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
        addafter("Order Address Code")
        {
            field("Vendor Cr. Memo No."; "Vendor Cr. Memo No.")
            {
                ApplicationArea = All;

            }
        }
        addafter("Buy-from Vendor Name")
        {
            field("User ID"; "User ID")
            {
                ApplicationArea = All;

            }
        }
        addafter("Document Date")
        {
            field("Pre-Assigned No."; "Pre-Assigned No.")
            {
                ApplicationArea = All;

            }
        }
        addafter("Applies-to Doc. Type")
        {
            field(Structure; Structure)
            {
                ApplicationArea = All;

            }
            field("Applies-to Doc. No."; "Applies-to Doc. No.")
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