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
            }
        }
        addafter("Order Address Code")
        {
            field("Vendor Cr. Memo No."; "Vendor Cr. Memo No.")
            {

            }
        }
        addafter("Buy-from Vendor Name")
        {
            field("User ID"; "User ID")
            {

            }
        }
        addafter("Document Date")
        {
            field("Pre-Assigned No."; "Pre-Assigned No.")
            {

            }
        }
        addafter("Applies-to Doc. Type")
        {
            field(Structure; Structure)
            {

            }
            field("Applies-to Doc. No."; "Applies-to Doc. No.")
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