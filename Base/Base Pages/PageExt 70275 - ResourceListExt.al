pageextension 70275 ResourceListExt extends "Resource List"
{
    layout
    {
        addbefore("No.")
        {
            field("xRec.COUNT"; xRec.COUNT)
            {
                Style = Strong;
                StyleExpr = TRUE;
            }
        }
        addafter("Base Unit of Measure")
        {
            field(Department; Department)
            {

            }
        }
    }

    actions
    {
        
    }

    var
        myInt: Integer;
}