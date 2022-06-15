pageextension 70280 PostedSalesCreditMemosExt extends 144
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
        addafter("Sell-to Customer Name")
        {
            field("External Document No."; "External Document No.")
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