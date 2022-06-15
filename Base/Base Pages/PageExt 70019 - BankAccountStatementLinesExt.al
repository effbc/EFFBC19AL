pageextension 70019 BankAccountStatementLinesExt extends "Bank Account Statement Lines"
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

        //Unsupported feature: Change Name on "Control 2". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 2". Please convert manually.


        //Unsupported feature: Change Name on "Control 22". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 22". Please convert manually.


        //Unsupported feature: Change Name on "Control 24". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 24". Please convert manually.


        //Unsupported feature: Change Name on "Control 21". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 21". Please convert manually.


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

        modify("Control 16")
        {

            //Unsupported feature: Change Name on "Control 16". Please convert manually.

            ShowCaption = false;
        }
        addafter("Control 14")
        {
            field("Bank Acc LE"; "Bank Acc LE")
            {
            }
        }
    }


    //Unsupported feature: PropertyModification on "CalcBalance(PROCEDURE 3).BankAccStmt(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CalcBalance : 275;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CalcBalance : "Bank Account Statement";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CalcBalance(PROCEDURE 3).TempBankAccStmtLine(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CalcBalance : 276;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CalcBalance : "Bank Account Statement Line";
    //Variable type has not been exported.

    //Unsupported feature: InsertAfter on "Documentation". Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

