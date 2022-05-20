pageextension 70231 TaxAreaLineExt extends "Tax Area Line"
{
    // version NAVW17.00,NAVIN7.00

    layout
    {

        //Unsupported feature: Change Name on "Control 1900000001". Please convert manually.

        modify("Control 1")
        {

            //Unsupported feature: Change Name on "Control 1". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change Name on "Control 2". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 2". Please convert manually.


        //Unsupported feature: Change Name on "Control 4". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 4". Please convert manually.


        //Unsupported feature: Change Name on "Control 6". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 1280000". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1280000". Please convert manually.


        //Unsupported feature: Change Name on "Control 1280002". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1280002". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500000". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500000". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500004". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500004". Please convert manually.

        modify("Control 1500002")
        {
            Visible = false;
        }
        addafter("Control 2")
        {
            field("Incl. TaxBase-VPT Calc."; "Incl. TaxBase-VPT Calc.")
            {
            }
        }
    }

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

