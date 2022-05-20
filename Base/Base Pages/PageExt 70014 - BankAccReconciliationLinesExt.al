pageextension 70014 BankAccReconciliationLinesExt extends "Bank Acc. Reconciliation Lines"
{
    // version NAVW19.00.00.45778,Rev01,B2BN1.0

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


        //Unsupported feature: Change Name on "Control 3". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 3". Please convert manually.


        //Unsupported feature: Change Name on "Control 5". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 5". Please convert manually.

        modify("Control 16")
        {

            //Unsupported feature: Change Name on "Control 16". Please convert manually.

            ShowCaption = false;
        }
        modify("Control 13")
        {

            //Unsupported feature: Change Name on "Control 13". Please convert manually.

            ShowCaption = false;
        }
        addafter("Control 12")
        {
            field("Cheque No."; "Cheque No.")
            {
            }
            field("Cheque Date"; "Cheque Date")
            {
            }
        }
        addafter("Control 5")
        {
            field("Bank Acc LE"; "Bank Acc LE")
            {
            }
            field("Transfer to Gen. Jnl"; "Transfer to Gen. Jnl")
            {
                Description = 'B2BN1.0 11Dec2018';
                Enabled = TransferToGenJnlEnable;
            }
            field("Statement No."; "Statement No.")
            {
            }
            field("Statement Line No."; "Statement Line No.")
            {
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 7". Please convert manually.


        //Unsupported feature: Change RunObject on "ShowStatementLineDetails(Action 9)". Please convert manually.


        //Unsupported feature: Change RunPageLink on "ShowStatementLineDetails(Action 9)". Please convert manually.

        addafter(ApplyEntries)
        {
            action(SelectAll)
            {
                Caption = 'Select All';
                Description = 'B2BN1.0 11Dec2018';

                trigger OnAction();
                begin
                    SelectOrUnselectAll(TRUE);
                end;
            }
            action(UnselectAll)
            {
                Caption = 'Unselect All';
                Description = 'B2BN1.0 11Dec2018';

                trigger OnAction();
                begin
                    SelectOrUnselectAll(FALSE);
                end;
            }
        }
    }


    //Unsupported feature: PropertyModification on "CalcBalance(PROCEDURE 3).TempBankAccReconLine(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CalcBalance : 274;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CalcBalance : "Bank Acc. Reconciliation Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ApplyEntries(PROCEDURE 5).BankAccReconApplyEntries(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ApplyEntries : 374;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ApplyEntries : "Bank Acc. Recon. Apply Entries";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GetSelectedRecords(PROCEDURE 4).BankAccReconciliationLine(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GetSelectedRecords : 274;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GetSelectedRecords : "Bank Acc. Reconciliation Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "BankAccRecon(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //BankAccRecon : 273;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //BankAccRecon : "Bank Acc. Reconciliation";
    //Variable type has not been exported.

    var
        TransferToGenJnlEnable: Boolean;


    //Unsupported feature: CodeInsertion on "OnQueryClosePage". Please convert manually.

    //trigger OnQueryClosePage(CloseAction : Action) : Boolean;
    //begin
    /*
    SelectOrUnselectAll(FALSE);//B2BN1.0 11Dec2018
    */
    //end;


    //Unsupported feature: CodeModification on "SetUserInteractions(PROCEDURE 2)". Please convert manually.

    //procedure SetUserInteractions();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    StyleTxt := GetStyle;
    ApplyEntriesAllowed := Type = Type::"Check Ledger Entry";
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    StyleTxt := GetStyle;
    ApplyEntriesAllowed := Type = Type::"Check Ledger Entry";
    TransferToGenJnlEnable := ("Applied Entries" = 0);//B2BN1.0 11Dec2018
    */
    //end;

    //Unsupported feature: InsertAfter on "Documentation". Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

