pageextension 70286 ContactListExt extends 5052
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
        addafter("No.")
        {
            field("Govt./Private"; "Govt./Private")
            {

            }
            field("Domestic/Foreign"; "Domestic/Foreign")
            {

            }
            field("Product Type"; "Product Type")
            {

            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    trigger OnOpenPage()
    begin
        //Cont.SETRANGE(Cont."No.",'>CONT001656');
        SETFILTER("No.", '>CONT001720');
    end;

    var
        myInt: Integer;
}