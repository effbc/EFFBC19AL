pageextension 70044 DimensionSetEntriesExt extends "Dimension Set Entries"
{
    // version NAVW17.00

    layout
    {

        //Unsupported feature: Change Name on "Control 1900000001". Please convert manually.

        modify("Control 1")
        {

            //Unsupported feature: Change Name on "Control 1". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change Name on "Control 9". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 9". Please convert manually.


        //Unsupported feature: Change Visible on "Control 2". Please convert manually.


        //Unsupported feature: Change Name on "Control 2". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 2". Please convert manually.


        //Unsupported feature: Change ImplicitType on "DimensionValueCode(Control 11)". Please convert manually.


        //Unsupported feature: Change Name on "Control 4". Please convert manually.


        //Unsupported feature: Change Editable on "Control 4". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 4". Please convert manually.

        addafter("Control 4")
        {
            field("Dimension Value ID"; "Dimension Value ID")
            {
                HideValue = false;
            }
            field("Dimension Set ID"; "Dimension Set ID")
            {
            }
        }
    }

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

