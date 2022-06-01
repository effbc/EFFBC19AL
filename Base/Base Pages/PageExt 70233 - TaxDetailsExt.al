pageextension 70233 TaxDetailsExt extends "Tax Details"
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


        //Unsupported feature: Change Name on "Control 8". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 8". Please convert manually.


        //Unsupported feature: Change Name on "Control 1280000". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1280000". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500010". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500010". Please convert manually.


        //Unsupported feature: Change Name on "Control 10". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 10". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500000". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500000". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500002". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500002". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500012". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500012". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500004". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500004". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500006". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500006". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500008". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500008". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900000007". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900383207". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905767507". Please convert manually.

        addafter("Control 8")
        {
            field("Forms Not Applicable"; "Forms Not Applicable")
            {
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000003". Please convert manually.


        //Unsupported feature: Change Name on "Action 19". Please convert manually.

        modify("Action 20")
        {
            Promoted = false;

            //Unsupported feature: Change Name on "Action 20". Please convert manually.

        }
    }


    //Unsupported feature: PropertyModification on "Action 20.OnAction.VATEntry(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Action 20.OnAction.VATEntry : 254;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Action 20.OnAction.VATEntry : "VAT Entry";
    //Variable type has not been exported.

    //Unsupported feature: PropertyChange. Please convert manually.

}

