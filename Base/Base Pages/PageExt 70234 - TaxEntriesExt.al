pageextension 70234 TaxEntriesExt extends "Tax Entries"
{
    // version NAVIN7.00

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


        //Unsupported feature: Change Name on "Control 8". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 8". Please convert manually.


        //Unsupported feature: Change Name on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 12". Please convert manually.


        //Unsupported feature: Change Name on "Control 10". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 10". Please convert manually.


        //Unsupported feature: Change Name on "Control 14". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 14". Please convert manually.


        //Unsupported feature: Change Name on "Control 4". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 4". Please convert manually.


        //Unsupported feature: Change Name on "Control 6". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 16". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 16". Please convert manually.


        //Unsupported feature: Change Name on "Control 18". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 18". Please convert manually.


        //Unsupported feature: Change Name on "Control 22". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 22". Please convert manually.


        //Unsupported feature: Change Name on "Control 26". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 26". Please convert manually.


        //Unsupported feature: Change Name on "Control 28". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 28". Please convert manually.


        //Unsupported feature: Change Name on "Control 30". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 30". Please convert manually.


        //Unsupported feature: Change Name on "Control 50". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 50". Please convert manually.


        //Unsupported feature: Change Name on "Control 54". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 54". Please convert manually.


        //Unsupported feature: Change Name on "Control 56". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 56". Please convert manually.


        //Unsupported feature: Change Name on "Control 62". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 62". Please convert manually.


        //Unsupported feature: Change Name on "Control 64". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 64". Please convert manually.


        //Unsupported feature: Change Name on "Control 1280000". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1280000". Please convert manually.


        //Unsupported feature: Change Name on "Control 1280012". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1280012". Please convert manually.

        modify("Control 58")
        {
            Visible = false;
        }
        addafter("Control 16")
        {
            field("Account No."; "Account No.")
            {
            }
            field("Tax Group Code"; "Tax Group Code")
            {
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.

        modify("Action 1280049")
        {
            Promoted = true;

            //Unsupported feature: Change Name on "Action 1280049". Please convert manually.

        }
    }


    //Unsupported feature: PropertyModification on "Navigate(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Navigate : 344;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Navigate : Navigate;
    //Variable type has not been exported.

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

