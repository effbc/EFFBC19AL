pageextension 70289 ProdOrderLineListExt extends "Prod. Order Line List"
{
    layout
    {
        addfirst(Control1)
        {
            field("xRec.COUNT"; xRec.COUNT)
            {
                Style = Strong;
                StyleExpr = TRUE;
            }
        }
        addafter("Prod. Order No.")
        {
            field("Line No.";"Line No.")
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