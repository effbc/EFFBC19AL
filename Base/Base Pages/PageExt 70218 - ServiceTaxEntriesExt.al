pageextension 70218 ServiceTaxEntriesExt extends "Service Tax Entries"
{
    // version NAVIN9.00.00.46621

    layout
    {

        //Unsupported feature: Change Name on "Control 1900000001". Please convert manually.

        modify("Control 1280000")
        {

            //Unsupported feature: Change Name on "Control 1280000". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change Name on "Control 1280001". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1280001". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500006". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500006". Please convert manually.


        //Unsupported feature: Change Name on "Control 1280003". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1280003". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500008". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500008". Please convert manually.


        //Unsupported feature: Change Name on "Control 1280005". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1280005". Please convert manually.


        //Unsupported feature: Change Name on "Control 1280007". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1280007". Please convert manually.


        //Unsupported feature: Change Name on "Control 1280009". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1280009". Please convert manually.


        //Unsupported feature: Change Name on "Control 1280011". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1280011". Please convert manually.


        //Unsupported feature: Change Name on "Control 1280013". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1280013". Please convert manually.


        //Unsupported feature: Change Name on "Control 1280015". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1280015". Please convert manually.


        //Unsupported feature: Change Name on "Control 1280017". Please convert manually.


        //Unsupported feature: Change Editable on "Control 1280017". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1280017". Please convert manually.


        //Unsupported feature: Change Name on "Control 1280027". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1280027". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500000". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500000". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500010". Please convert manually.


        //Unsupported feature: Change Editable on "Control 1500010". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500010". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500001". Please convert manually.


        //Unsupported feature: Change Editable on "Control 1500001". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500001". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500003". Please convert manually.


        //Unsupported feature: Change Editable on "Control 1500003". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500003". Please convert manually.


        //Unsupported feature: Change Name on "Control 1280019". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1280019". Please convert manually.


        //Unsupported feature: Change Name on "Control 1280025". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1280025". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500002". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500002". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500004". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500004". Please convert manually.

        modify("Control 1500012")
        {
            Visible = false;
        }
        addafter("Control 1500010")
        {
            field("Service Tax SBC Amount"; "Service Tax SBC Amount")
            {
                Editable = true;
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.

        modify("Action 1280033")
        {
            Promoted = true;

            //Unsupported feature: Change Name on "Action 1280033". Please convert manually.

        }
        modify("Action 1280024")
        {

            //Unsupported feature: Change RunObject on "Action 1280024". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 1280024". Please convert manually.

        }
    }


    //Unsupported feature: PropertyModification on "Navigate(Variable 1280000)". Please convert manually.

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

}

