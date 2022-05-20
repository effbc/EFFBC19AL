pageextension 70056 FALedgerEntriesExt extends "FA Ledger Entries"
{
    // version NAVW19.00.00.45778,NAVIN9.00.00.45778

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


        //Unsupported feature: Change Name on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 12". Please convert manually.


        //Unsupported feature: Change Name on "Control 16". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 16". Please convert manually.


        //Unsupported feature: Change Name on "Control 6". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 27". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 27". Please convert manually.


        //Unsupported feature: Change Name on "Control 22". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 22". Please convert manually.


        //Unsupported feature: Change Name on "Control 29". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 29". Please convert manually.


        //Unsupported feature: Change Name on "Control 20". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 20". Please convert manually.


        //Unsupported feature: Change Name on "Control 52". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 52". Please convert manually.


        //Unsupported feature: Change Name on "Control 54". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 54". Please convert manually.


        //Unsupported feature: Change Name on "Control 24". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 24". Please convert manually.


        //Unsupported feature: Change Name on "Control 30". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 30". Please convert manually.


        //Unsupported feature: Change Name on "Control 26". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 26". Please convert manually.


        //Unsupported feature: Change Name on "Control 40". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 40". Please convert manually.


        //Unsupported feature: Change Name on "Control 84". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 84". Please convert manually.


        //Unsupported feature: Change Name on "Control 14". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 14". Please convert manually.


        //Unsupported feature: Change Name on "Control 60". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 60". Please convert manually.


        //Unsupported feature: Change Name on "Control 78". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 78". Please convert manually.


        //Unsupported feature: Change Name on "Control 80". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 80". Please convert manually.


        //Unsupported feature: Change Name on "Control 39". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 39". Please convert manually.


        //Unsupported feature: Change Name on "Control 43". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 43". Please convert manually.


        //Unsupported feature: Change Name on "Control 45". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 45". Please convert manually.


        //Unsupported feature: Change Name on "Control 10". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 10". Please convert manually.


        //Unsupported feature: Change Name on "Control 4". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 4". Please convert manually.


        //Unsupported feature: Change Name on "Control 2". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 2". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900000007". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900383207". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905767507". Please convert manually.

    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000003". Please convert manually.


        //Unsupported feature: Change Name on "Action 35". Please convert manually.


        //Unsupported feature: Change AccessByPermission on "Action 36". Please convert manually.


        //Unsupported feature: Change Name on "Action 36". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 1500000". Please convert manually.


        //Unsupported feature: Change RunPageLink on "Action 1500000". Please convert manually.


        //Unsupported feature: Change Name on "Action 1500000". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 1500001". Please convert manually.


        //Unsupported feature: Change RunPageLink on "Action 1500001". Please convert manually.


        //Unsupported feature: Change Name on "Action 1500001". Please convert manually.


        //Unsupported feature: Change Ellipsis on "Action 1500002". Please convert manually.


        //Unsupported feature: Change Name on "Action 1500002". Please convert manually.


        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.


        //Unsupported feature: Change Name on "Action 19". Please convert manually.


        //Unsupported feature: Change Ellipsis on "CancelEntries(Action 33)". Please convert manually.


        //Unsupported feature: Change Name on "Action 37". Please convert manually.


        //Unsupported feature: Change Ellipsis on "ReverseTransaction(Action 38)". Please convert manually.

        modify("Action 18")
        {
            Promoted = true;

            //Unsupported feature: Change Name on "Action 18". Please convert manually.

        }
    }

    //Unsupported feature: PropertyModification on "Action 1500002.OnAction.GLentry(Variable 1500000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Action 1500002.OnAction.GLentry : 17;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Action 1500002.OnAction.GLentry : "G/L Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ReverseTransaction(Action 38).OnAction.ReversalEntry(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ReverseTransaction : 179;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ReverseTransaction : "Reversal Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ReverseTransaction(Action 38).OnAction.FADeprBook(Variable 1003)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ReverseTransaction : 5612;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ReverseTransaction : "FA Depreciation Book";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "FALedgEntry(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //FALedgEntry : 5601;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //FALedgEntry : "FA Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Navigate(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Navigate : 344;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Navigate : Navigate;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CancelFAEntries(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CancelFAEntries : 5686;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CancelFAEntries : "Cancel FA Entries";
    //Variable type has not been exported.

    //Unsupported feature: PropertyDeletion. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

