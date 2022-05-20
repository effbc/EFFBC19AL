pageextension 70041 DetailedCustLedgEntriesExt extends "Detailed Cust. Ledg. Entries"
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

        //Unsupported feature: Change Name on "Control 8". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 8". Please convert manually.


        //Unsupported feature: Change Name on "Control 6". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 10". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 10". Please convert manually.


        //Unsupported feature: Change Name on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 12". Please convert manually.


        //Unsupported feature: Change Name on "Control 18". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 18". Please convert manually.


        //Unsupported feature: Change Name on "Control 42". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 42". Please convert manually.


        //Unsupported feature: Change Name on "Control 44". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 44". Please convert manually.


        //Unsupported feature: Change Name on "Control 20". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 20". Please convert manually.


        //Unsupported feature: Change Name on "Control 14". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 14". Please convert manually.


        //Unsupported feature: Change Name on "Control 16". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 16". Please convert manually.


        //Unsupported feature: Change Name on "Control 40". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 40". Please convert manually.


        //Unsupported feature: Change Name on "Control 22". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 22". Please convert manually.


        //Unsupported feature: Change Name on "Control 24". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 24". Please convert manually.


        //Unsupported feature: Change Name on "Control 30". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 30". Please convert manually.


        //Unsupported feature: Change Name on "Control 29". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 29". Please convert manually.


        //Unsupported feature: Change Name on "Control 33". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 33". Please convert manually.


        //Unsupported feature: Change Name on "Control 4". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 4". Please convert manually.


        //Unsupported feature: Change Name on "Control 2". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 2". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900000007". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900383207". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905767507". Please convert manually.

        addafter("Control 18")
        {
            field("Payment Type"; "Payment Type")
            {
            }
        }
        addafter("Control 4")
        {
            field("Credit Amount"; "Credit Amount")
            {
            }
            field("Debit Amount"; "Debit Amount")
            {
            }
            field("Debit Amount (LCY)"; "Debit Amount (LCY)")
            {
            }
            field("Credit Amount (LCY)"; "Credit Amount (LCY)")
            {
            }
        }
        addafter("Control 2")
        {
            field("Applied Cust. Ledger Entry No."; "Applied Cust. Ledger Entry No.")
            {
            }
            field("Application No."; "Application No.")
            {
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.


        //Unsupported feature: Change Name on "Action 27". Please convert manually.


        //Unsupported feature: Change Ellipsis on "Action 28". Please convert manually.


        //Unsupported feature: Change Name on "Action 28". Please convert manually.

        modify("Action 26")
        {
            Promoted = true;

            //Unsupported feature: Change Name on "Action 26". Please convert manually.

        }
    }


    //Unsupported feature: PropertyModification on "Action 28.OnAction.CustEntryApplyPostedEntries(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Action 28.OnAction.CustEntryApplyPostedEntries : 226;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Action 28.OnAction.CustEntryApplyPostedEntries : "CustEntry-Apply Posted Entries";
    //Variable type has not been exported.


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

