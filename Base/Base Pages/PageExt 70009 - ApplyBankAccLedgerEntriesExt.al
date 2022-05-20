pageextension 70009 ApplyBankAccLedgerEntriesExt extends "Apply Bank Acc. Ledger Entries"
{
    // version NAVW19.00.00.45778

    layout
    {

        //Unsupported feature: Change Name on "Control 1900000001". Please convert manually.

        modify("Control 1")
        {

            //Unsupported feature: Change Name on "Control 1". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change ImplicitType on "LineApplied(Control 3)". Please convert manually.


        //Unsupported feature: Change Name on "Control 2". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 2". Please convert manually.


        //Unsupported feature: Change Name on "Control 4". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 4". Please convert manually.


        //Unsupported feature: Change Name on "Control 6". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 8". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 8". Please convert manually.


        //Unsupported feature: Change Name on "Control 10". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 10". Please convert manually.


        //Unsupported feature: Change Name on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 12". Please convert manually.


        //Unsupported feature: Change Name on "Control 14". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 14". Please convert manually.


        //Unsupported feature: Change Name on "Control 16". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 16". Please convert manually.


        //Unsupported feature: Change Name on "Control 17". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 17". Please convert manually.


        //Unsupported feature: Change Name on "Control 19". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 19". Please convert manually.


        //Unsupported feature: Change Name on "Control 18". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 18". Please convert manually.


        //Unsupported feature: Change Name on "Control 23". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 23". Please convert manually.


        //Unsupported feature: Change Name on "Control 27". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 27". Please convert manually.


        //Unsupported feature: Change Name on "Control 5". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 5". Please convert manually.


        //Unsupported feature: Change Name on "Control 36". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 36". Please convert manually.


        //Unsupported feature: Change Name on "Control 38". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 38". Please convert manually.

        modify("Control 7")
        {

            //Unsupported feature: Change Name on "Control 7". Please convert manually.

            ShowCaption = false;
        }
        modify("Control 15")
        {

            //Unsupported feature: Change Name on "Control 15". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change ImplicitType on "Balance(Control 9)". Please convert manually.


        //Unsupported feature: Change ImplicitType on "CheckBalance(Control 11)". Please convert manually.


        //Unsupported feature: Change ImplicitType on "BalanceToReconcile(Control 13)". Please convert manually.

        addafter("Control 38")
        {
            field("Entry No."; "Entry No.")
            {
            }
            field("External Document No."; "External Document No.")
            {
            }
        }
    }


    //Unsupported feature: PropertyModification on "GetSelectedRecords(PROCEDURE 2).BankAccLedgerEntry(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GetSelectedRecords : 271;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GetSelectedRecords : "Bank Account Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CalcBalanceToReconcile(PROCEDURE 1).BankAccountLedgerEntry(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CalcBalanceToReconcile : 271;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CalcBalanceToReconcile : "Bank Account Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "BankAccount(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //BankAccount : 270;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //BankAccount : "Bank Account";
    //Variable type has not been exported.

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

