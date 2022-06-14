pageextension 70046 DimensionValuesExt extends "Dimension Values"
{
    layout
    {
        addafter(Control1)
        {
            field("Dimension Code"; Rec."Dimension Code")
            {

            }
        }
        addafter(Name)
        {
            field(Address1; Rec.Address1)
            {

            }
            field(Address2; Rec.Address2)
            {

            }
        }

        addafter(Totaling)
        {
            field("Global Dimension No."; Rec."Global Dimension No.")
            {

            }
        }
    }
}

