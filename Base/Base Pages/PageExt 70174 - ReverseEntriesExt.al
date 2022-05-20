pageextension 70174 ReverseEntriesExt extends "Reverse Entries"
{
    // version NAVW17.10

    layout
    {

        //Unsupported feature: Change Name on "Control 1900000001". Please convert manually.

        modify("Control 1")
        {

            //Unsupported feature: Change Name on "Control 1". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change Name on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 12". Please convert manually.


        //Unsupported feature: Change Name on "Control 2". Please convert manually.


        //Unsupported feature: Change Name on "Control 64". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 64". Please convert manually.


        //Unsupported feature: Change Name on "Control 66". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 66". Please convert manually.


        //Unsupported feature: Change DrillDown on "Control 4". Please convert manually.


        //Unsupported feature: Change Name on "Control 4". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 4". Please convert manually.


        //Unsupported feature: Change Name on "Control 47". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 47". Please convert manually.


        //Unsupported feature: Change Name on "Control 20". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 20". Please convert manually.


        //Unsupported feature: Change Name on "Control 37". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 37". Please convert manually.


        //Unsupported feature: Change Name on "Control 39". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 39". Please convert manually.


        //Unsupported feature: Change Name on "Control 28". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 28". Please convert manually.


        //Unsupported feature: Change Name on "Control 56". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 56". Please convert manually.


        //Unsupported feature: Change Name on "Control 30". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 30". Please convert manually.


        //Unsupported feature: Change Name on "Control 32". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 32". Please convert manually.


        //Unsupported feature: Change Name on "Control 6". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 8". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 8". Please convert manually.


        //Unsupported feature: Change Name on "Control 10". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 10". Please convert manually.


        //Unsupported feature: Change Name on "Control 14". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 14". Please convert manually.


        //Unsupported feature: Change Name on "Control 16". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 16". Please convert manually.


        //Unsupported feature: Change Name on "Control 18". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 18". Please convert manually.


        //Unsupported feature: Change Name on "Control 41". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 41". Please convert manually.


        //Unsupported feature: Change Name on "Control 43". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 43". Please convert manually.


        //Unsupported feature: Change Name on "Control 22". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 22". Please convert manually.


        //Unsupported feature: Change Name on "Control 24". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 24". Please convert manually.


        //Unsupported feature: Change Name on "Control 26". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 26". Please convert manually.


        //Unsupported feature: Change Name on "Control 59". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 59". Please convert manually.


        //Unsupported feature: Change Name on "Control 61". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 61". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900000007". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900383207". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905767507". Please convert manually.

    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000003". Please convert manually.


        //Unsupported feature: Change Name on "Action 48". Please convert manually.


        //Unsupported feature: Change Name on "Action 49". Please convert manually.


        //Unsupported feature: Change Name on "Action 50". Please convert manually.


        //Unsupported feature: Change Name on "Action 51". Please convert manually.


        //Unsupported feature: Change Name on "Action 52". Please convert manually.


        //Unsupported feature: Change Name on "Action 53". Please convert manually.


        //Unsupported feature: Change Name on "Action 54". Please convert manually.


        //Unsupported feature: Change Name on "Action 55". Please convert manually.


        //Unsupported feature: Change Name on "Action 3". Please convert manually.


        //Unsupported feature: Change Name on "Action 45". Please convert manually.

        modify(Reverse)
        {
            Promoted = true;
            PromotedIsBig = true;
        }
        modify("Action 58")
        {
            Promoted = true;
            PromotedIsBig = true;

            //Unsupported feature: Change Name on "Action 58". Please convert manually.

        }
    }

    //Unsupported feature: PropertyModification on "Post(PROCEDURE 2).ReversalPost(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Post : 179;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Post : "Reversal-Post";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GetEntryTypeText(PROCEDURE 3).GLEntry(Variable 1008)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GetEntryTypeText : 17;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GetEntryTypeText : "G/L Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GetEntryTypeText(PROCEDURE 3).CustLedgEntry(Variable 1007)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GetEntryTypeText : 21;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GetEntryTypeText : "Cust. Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GetEntryTypeText(PROCEDURE 3).VendLedgEntry(Variable 1006)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GetEntryTypeText : 25;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GetEntryTypeText : "Vendor Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GetEntryTypeText(PROCEDURE 3).BankAccLedgEntry(Variable 1005)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GetEntryTypeText : 271;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GetEntryTypeText : "Bank Account Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GetEntryTypeText(PROCEDURE 3).FALedgEntry(Variable 1004)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GetEntryTypeText : 5601;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GetEntryTypeText : "FA Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GetEntryTypeText(PROCEDURE 3).MaintenanceLedgEntry(Variable 1003)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GetEntryTypeText : 5625;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GetEntryTypeText : "Maintenance Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GetEntryTypeText(PROCEDURE 3).VATEntry(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GetEntryTypeText : 254;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GetEntryTypeText : "VAT Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ReversalEntry(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ReversalEntry : 179;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ReversalEntry : "Reversal Entry";
    //Variable type has not been exported.

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

