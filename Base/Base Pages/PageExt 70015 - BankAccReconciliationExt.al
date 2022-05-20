pageextension 70015 BankAccReconciliationExt extends "Bank Acc. Reconciliation"
{
    // version NAVW19.00.00.45778

    layout
    {

        //Unsupported feature: Change Name on "Control 1900000001". Please convert manually.


        //Unsupported feature: Change Name on "Control 2". Please convert manually.


        //Unsupported feature: Change ImplicitType on "BankAccountNo(Control 5)". Please convert manually.


        //Unsupported feature: Change ImplicitType on "StatementNo(Control 20)". Please convert manually.


        //Unsupported feature: Change ImplicitType on "StatementDate(Control 22)". Please convert manually.


        //Unsupported feature: Change ImplicitType on "BalanceLastStatement(Control 28)". Please convert manually.


        //Unsupported feature: Change ImplicitType on "StatementEndingBalance(Control 30)". Please convert manually.

        modify("Control 8")
        {

            //Unsupported feature: Change Name on "Control 8". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change SubPageLink on "StmtLine(Control 11)". Please convert manually.


        //Unsupported feature: Change PagePartID on "StmtLine(Control 11)". Please convert manually.


        //Unsupported feature: Change SubPageLink on "ApplyBankLedgerEntries(Control 6)". Please convert manually.


        //Unsupported feature: Change PagePartID on "ApplyBankLedgerEntries(Control 6)". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900000007". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900383207". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905767507". Please convert manually.

    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000003". Please convert manually.


        //Unsupported feature: Change Name on "Action 23". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 26". Please convert manually.


        //Unsupported feature: Change Name on "Action 26". Please convert manually.


        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.


        //Unsupported feature: Change Name on "Action 14". Please convert manually.

        modify(SuggestLines)
        {

            //Unsupported feature: Change Ellipsis on "SuggestLines(Action 16)". Please convert manually.

            Promoted = true;
            PromotedIsBig = true;
        }
        modify("Action 24")
        {

            //Unsupported feature: Change Ellipsis on "Action 24". Please convert manually.

            Promoted = true;
            PromotedIsBig = true;

            //Unsupported feature: Change Name on "Action 24". Please convert manually.

        }

        //Unsupported feature: Change Name on "Action 19". Please convert manually.

        modify(ImportBankStatement)
        {
            Promoted = true;
            PromotedIsBig = true;
        }

        //Unsupported feature: Change Name on "Action 12". Please convert manually.

        modify(MatchAutomatically)
        {
            Promoted = true;
            PromotedIsBig = true;
        }
        modify(MatchManually)
        {
            Promoted = true;
            PromotedIsBig = true;
        }
        modify(RemoveMatch)
        {
            Promoted = true;
            PromotedIsBig = true;
        }

        //Unsupported feature: Change Name on "Action 1". Please convert manually.


        //Unsupported feature: Change Ellipsis on "Action 15". Please convert manually.


        //Unsupported feature: Change Name on "Action 15". Please convert manually.

        modify(Post)
        {

            //Unsupported feature: Change RunObject on "Post(Action 17)". Please convert manually.

            Promoted = true;
            PromotedIsBig = true;
        }
        modify(PostAndPrint)
        {

            //Unsupported feature: Change RunObject on "PostAndPrint(Action 9)". Please convert manually.

            Promoted = true;
            PromotedIsBig = true;
        }

        //Unsupported feature: CodeModification on "MatchManually(Action 18).OnAction". Please convert manually.

        //trigger OnAction();
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CurrPage.StmtLine.PAGE.GetSelectedRecords(TempBankAccReconciliationLine);
        CurrPage.ApplyBankLedgerEntries.PAGE.GetSelectedRecords(TempBankAccountLedgerEntry);
        MatchBankRecLines.MatchManually(TempBankAccReconciliationLine,TempBankAccountLedgerEntry);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //BRS1.0>>
        IF NOT IsStandardMatchAllowed THEN
          ERROR(StandardMatchErr);
        //BRS1.0<<
        #1..3
        */
        //end;


        //Unsupported feature: CodeModification on "RemoveMatch(Action 13).OnAction". Please convert manually.

        //trigger OnAction();
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CurrPage.StmtLine.PAGE.GetSelectedRecords(TempBankAccReconciliationLine);
        CurrPage.ApplyBankLedgerEntries.PAGE.GetSelectedRecords(TempBankAccountLedgerEntry);
        MatchBankRecLines.RemoveMatch(TempBankAccReconciliationLine,TempBankAccountLedgerEntry);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //BRS1.0>>
        IF NOT IsStandardMatchAllowed THEN
          ERROR(StandardMatchErr);
        //BRS1.0<<
        #1..3
        */
        //end;
        addafter(NotMatched)
        {
            action(MatchManuallyRev)
            {
                Caption = 'MatchManuallyRev';

                trigger OnAction();
                var
                    TempBankAccReconciliationLine: Record "Bank Acc. Reconciliation Line" temporary;
                    TempBankAccountLedgerEntry: Record "Bank Account Ledger Entry" temporary;
                    MatchBankRecLines: Codeunit "Match Bank Rec. Lines";
                begin
                    IF NOT IsMatchReverseAllowed THEN
                        ERROR(StandardMatchErr);
                    CurrPage.StmtLine.PAGE.GetSelectedRecords(TempBankAccReconciliationLine);
                    CurrPage.ApplyBankLedgerEntries.PAGE.GetSelectedRecords(TempBankAccountLedgerEntry);
                    MatchBankRecLines.MatchManuallyREverse(TempBankAccReconciliationLine, TempBankAccountLedgerEntry);
                end;
            }
            action(RemoveMatchRev)
            {

                trigger OnAction();
                var
                    TempBankAccReconciliationLine: Record "Bank Acc. Reconciliation Line" temporary;
                    TempBankAccountLedgerEntry: Record "Bank Account Ledger Entry" temporary;
                    MatchBankRecLines: Codeunit "Match Bank Rec. Lines";
                begin
                    IF NOT IsMatchReverseAllowed THEN
                        ERROR(StandardMatchErr);
                    CurrPage.StmtLine.PAGE.GetSelectedRecords(TempBankAccReconciliationLine);
                    CurrPage.ApplyBankLedgerEntries.PAGE.GetSelectedRecords(TempBankAccountLedgerEntry);
                    MatchBankRecLines.RemoveMatchReverse(TempBankAccReconciliationLine, TempBankAccountLedgerEntry);
                end;
            }
            action(RemoveMatchRevSingle)
            {

                trigger OnAction();
                var
                    TempBankAccReconciliationLine: Record "Bank Acc. Reconciliation Line" temporary;
                    TempBankAccountLedgerEntry: Record "Bank Account Ledger Entry" temporary;
                    MatchBankRecLines: Codeunit "Match Bank Rec. Lines";
                begin
                    IF NOT IsMatchReverseAllowed THEN
                        ERROR(StandardMatchErr);
                    CurrPage.StmtLine.PAGE.GetSelectedRecords(TempBankAccReconciliationLine);
                    CurrPage.ApplyBankLedgerEntries.PAGE.GetSelectedRecords(TempBankAccountLedgerEntry);
                    MatchBankRecLines.RemoveMatchReverseSingle(TempBankAccReconciliationLine, TempBankAccountLedgerEntry);
                end;
            }
        }
    }


    //Unsupported feature: PropertyModification on "MatchManually(Action 18).OnAction.TempBankAccReconciliationLine(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //MatchManually : 274;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //MatchManually : "Bank Acc. Reconciliation Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "MatchManually(Action 18).OnAction.TempBankAccountLedgerEntry(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //MatchManually : 271;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //MatchManually : "Bank Account Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "MatchManually(Action 18).OnAction.MatchBankRecLines(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //MatchManually : 1252;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //MatchManually : "Match Bank Rec. Lines";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "RemoveMatch(Action 13).OnAction.TempBankAccReconciliationLine(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //RemoveMatch : 274;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //RemoveMatch : "Bank Acc. Reconciliation Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "RemoveMatch(Action 13).OnAction.TempBankAccountLedgerEntry(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //RemoveMatch : 271;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //RemoveMatch : "Bank Account Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "RemoveMatch(Action 13).OnAction.MatchBankRecLines(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //RemoveMatch : 1252;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //RemoveMatch : "Match Bank Rec. Lines";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "SuggestBankAccStatement(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SuggestBankAccStatement : 1496;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SuggestBankAccStatement : "Suggest Bank Acc. Recon. Lines";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "TransferToGLJnl(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //TransferToGLJnl : 1497;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TransferToGLJnl : "Trans. Bank Rec. to Gen. Jnl.";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ReportPrint(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ReportPrint : 228;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ReportPrint : "Test Report-Print";
    //Variable type has not been exported.

    var
        StandardMatchErr: Label 'Reverse Match was used already, you cann''t use Match Manually here.';
        ReverseMatchErr: Label 'Match Manually was used already, you cann''t use Reverse Match here.';

    [LineStart(19396)]
    local procedure IsStandardMatchAllowed(): Boolean;
    var
        BankAccReconLine: Record "Bank Acc. Reconciliation Line";
    begin
        BankAccReconLine.RESET;
        BankAccReconLine.SETRANGE("Bank Account No.", "Bank Account No.");
        BankAccReconLine.SETRANGE("Statement No.", "Statement No.");
        BankAccReconLine.SETRANGE("Statement Type", BankAccReconLine."Statement Type"::"Bank Reconciliation");
        BankAccReconLine.SETFILTER("Bank Acc LE", '<>%1', 0);
        EXIT(BankAccReconLine.ISEMPTY);
    end;

    [LineStart(19404)]
    local procedure IsMatchReverseAllowed(): Boolean;
    var
        BankAccLedgEntry: Record "Bank Account Ledger Entry";
    begin
        BankAccLedgEntry.RESET;
        BankAccLedgEntry.SETRANGE("Bank Account No.", "Bank Account No.");
        BankAccLedgEntry.SETRANGE("Statement No.", "Statement No.");
        BankAccLedgEntry.SETRANGE(Open, TRUE);
        BankAccLedgEntry.SETRANGE("Statement Status", BankAccLedgEntry."Statement Status"::"Bank Acc. Entry Applied");
        BankAccLedgEntry.SETFILTER("Statement Line No.", '<>%1', 0);
        EXIT(BankAccLedgEntry.ISEMPTY);
    end;

    //Unsupported feature: InsertAfter on "Documentation". Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

