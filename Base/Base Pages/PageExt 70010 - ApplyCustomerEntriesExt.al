pageextension 70010 ApplyCustomerEntriesExt extends "Apply Customer Entries"
{
    // version NAVW19.00.00.51883,NAVIN9.00.00.51883

    layout
    {

        //Unsupported feature: Change Name on "Control 1900000001". Please convert manually.


        //Unsupported feature: Change Name on "Control 70". Please convert manually.


        //Unsupported feature: Change Name on "Control 73". Please convert manually.


        //Unsupported feature: Change Name on "Control 75". Please convert manually.


        //Unsupported feature: Change Name on "Control 77". Please convert manually.


        //Unsupported feature: Change Name on "Control 79". Please convert manually.


        //Unsupported feature: Change Name on "Control 81". Please convert manually.


        //Unsupported feature: Change Name on "Control 83". Please convert manually.

        modify("Control 1")
        {

            //Unsupported feature: Change Name on "Control 1". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change ImplicitType on "AppliesToID(Control 22)". Please convert manually.


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


        //Unsupported feature: Change Name on "Control 39". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 39". Please convert manually.


        //Unsupported feature: Change Name on "Control 60". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 60". Please convert manually.


        //Unsupported feature: Change Name on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 12". Please convert manually.


        //Unsupported feature: Change Name on "Control 14". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 14". Please convert manually.


        //Unsupported feature: Change Name on "Control 33". Please convert manually.


        //Unsupported feature: Change Name on "Control 89". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 89". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500001". Please convert manually.


        //Unsupported feature: Change Name on "Control 93". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500000". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500000". Please convert manually.


        //Unsupported feature: Change Name on "Control 16". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 16". Please convert manually.


        //Unsupported feature: Change Name on "Control 18". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 18". Please convert manually.


        //Unsupported feature: Change Name on "Control 65". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 65". Please convert manually.


        //Unsupported feature: Change Name on "Control 20". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 20". Please convert manually.


        //Unsupported feature: Change Name on "Control 63". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 63". Please convert manually.


        //Unsupported feature: Change Name on "Control 51". Please convert manually.


        //Unsupported feature: Change Name on "Control 67". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 67". Please convert manually.


        //Unsupported feature: Change Name on "Control 24". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 24". Please convert manually.


        //Unsupported feature: Change Name on "Control 26". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 26". Please convert manually.


        //Unsupported feature: Change Name on "Control 54". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 54". Please convert manually.


        //Unsupported feature: Change Name on "Control 56". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 56". Please convert manually.

        modify("Control 41")
        {

            //Unsupported feature: Change Name on "Control 41". Please convert manually.

            ShowCaption = false;
        }
        modify("Control 1903222401")
        {

            //Unsupported feature: Change Name on "Control 1903222401". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change Name on "Control 1901742001". Please convert manually.


        //Unsupported feature: Change Name on "Control 48". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 48". Please convert manually.


        //Unsupported feature: Change Name on "Control 1903098801". Please convert manually.


        //Unsupported feature: Change ImplicitType on "AmountToApply(Control 44)". Please convert manually.


        //Unsupported feature: Change Name on "Control 1902760701". Please convert manually.


        //Unsupported feature: Change Name on "Control 1901741901". Please convert manually.


        //Unsupported feature: Change Name on "Control 58". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 58". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900546301". Please convert manually.


        //Unsupported feature: Change Name on "Control 1901991601". Please convert manually.


        //Unsupported feature: Change Name on "Control 46". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 46". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900206001". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900000007". Please convert manually.


        //Unsupported feature: Change PagePartID on "Control 1903096107". Please convert manually.


        //Unsupported feature: Change Name on "Control 1903096107". Please convert manually.

        addfirst("Control 1")
        {
            field("Entry No."; "Entry No.")
            {
            }
        }
        addafter("Control 2")
        {
            field("Sale Order no"; "Sale Order no")
            {
            }
        }
        addafter("Control 4")
        {
            field("Payment Type"; "Payment Type")
            {
            }
            field("Customer ord No"; "Customer ord No")
            {
            }
        }
        addafter("Control 6")
        {
            field("invoice no"; "invoice no")
            {
            }
            field("External Document No."; "External Document No.")
            {
            }
        }
        addafter("Control 56")
        {
            field("Payment Through"; "Payment Through")
            {
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000003". Please convert manually.


        //Unsupported feature: Change Name on "Action 37". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 38". Please convert manually.


        //Unsupported feature: Change Name on "Action 38". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 95". Please convert manually.


        //Unsupported feature: Change RunPageOnRec on "Action 95". Please convert manually.


        //Unsupported feature: Change Name on "Action 95". Please convert manually.


        //Unsupported feature: Change AccessByPermission on "Action 53". Please convert manually.


        //Unsupported feature: Change Name on "Action 53". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 62". Please convert manually.


        //Unsupported feature: Change Name on "Action 62". Please convert manually.


        //Unsupported feature: Change Name on "Action 30". Please convert manually.

        modify("Set Applies-to ID")
        {
            Promoted = true;
            PromotedIsBig = true;
        }
        modify("Post Application")
        {

            //Unsupported feature: Change Ellipsis on ""Post Application"(Action 34)". Please convert manually.

            Promoted = true;
        }

        //Unsupported feature: Change Name on "Action 87". Please convert manually.


        //Unsupported feature: Change Name on "Action 88". Please convert manually.


        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.

        modify("Action 36")
        {
            Promoted = true;

            //Unsupported feature: Change Name on "Action 36". Please convert manually.

        }
    }


    //Unsupported feature: PropertyModification on "SetService(PROCEDURE 8).ServAmountsMgt(Variable 1003)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SetService : 5986;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SetService : "Serv-Amounts Mgt.";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "SetApplyingCustLedgEntry(PROCEDURE 9).Customer(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SetApplyingCustLedgEntry : 18;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SetApplyingCustLedgEntry : Customer;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "SetApplyingCustLedgEntry(PROCEDURE 9)."CustEntry-Edit"(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SetApplyingCustLedgEntry : 103;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SetApplyingCustLedgEntry : "Cust. Entry-Edit";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "SetCustApplId(PROCEDURE 11).CustLedgerEntry(Variable 1500002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SetCustApplId : 21;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SetCustApplId : "Cust. Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CalcApplnAmount(PROCEDURE 4).ExchAccGLJnlLine(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CalcApplnAmount : 366;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CalcApplnAmount : "Exchange Acc. G/L Journal Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "HandlChosenEntries(PROCEDURE 14).AppliedCustLedgEntryTemp(Variable 1004)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //HandlChosenEntries : 21;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //HandlChosenEntries : "Cust. Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "PostDirectApplication(PROCEDURE 15).CustEntryApplyPostedEntries(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //PostDirectApplication : 226;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PostDirectApplication : "CustEntry-Apply Posted Entries";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "PostDirectApplication(PROCEDURE 15).PostApplication(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //PostDirectApplication : 579;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PostDirectApplication : "Post Application";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CheckRefundApplicationGST(PROCEDURE 1500005).DetailedCustLedgEntry(Variable 1500000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CheckRefundApplicationGST : 379;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CheckRefundApplicationGST : "Detailed Cust. Ledg. Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CalcOppositeEntriesAmount(PROCEDURE 17).SavedAppliedCustLedgerEntry(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CalcOppositeEntriesAmount : 21;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CalcOppositeEntriesAmount : "Cust. Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CheckGSTValidationsSales(PROCEDURE 1500000).DetailedGSTLedgerEntry(Variable 1500002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CheckGSTValidationsSales : 16419;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CheckGSTValidationsSales : "Detailed GST Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CheckGSTValidationsSales(PROCEDURE 1500000).GeneralLedgerSetup(Variable 1500003)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CheckGSTValidationsSales : 98;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CheckGSTValidationsSales : "General Ledger Setup";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CheckGSTValidationsSales(PROCEDURE 1500000).SalesLine(Variable 1500005)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CheckGSTValidationsSales : 37;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CheckGSTValidationsSales : "Sales Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CheckGSTValidationsSales(PROCEDURE 1500000).Location(Variable 1512309)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CheckGSTValidationsSales : 14;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CheckGSTValidationsSales : Location;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CheckGSTValidationsService(PROCEDURE 1500006).DetailedGSTLedgerEntry(Variable 1500002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CheckGSTValidationsService : 16419;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CheckGSTValidationsService : "Detailed GST Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CheckGSTValidationsService(PROCEDURE 1500006).GeneralLedgerSetup(Variable 1500003)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CheckGSTValidationsService : 98;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CheckGSTValidationsService : "General Ledger Setup";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CheckGSTValidationsService(PROCEDURE 1500006).ServiceLine(Variable 1500005)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CheckGSTValidationsService : 5902;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CheckGSTValidationsService : "Service Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CheckGSTValidationsSalesJournal(PROCEDURE 1500001).DetailedGSTLedgerEntry(Variable 1500002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CheckGSTValidationsSalesJournal : 16419;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CheckGSTValidationsSalesJournal : "Detailed GST Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CheckGSTValidationsSalesJournal(PROCEDURE 1500001).GeneralLedgerSetup(Variable 1500003)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CheckGSTValidationsSalesJournal : 98;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CheckGSTValidationsSalesJournal : "General Ledger Setup";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CheckGSTValidationsSalesJournal(PROCEDURE 1500001).Location(Variable 1500004)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CheckGSTValidationsSalesJournal : 14;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CheckGSTValidationsSalesJournal : Location;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CheckGSTValidationsSalesJournal(PROCEDURE 1500001).GenJournalLine2(Variable 1500005)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CheckGSTValidationsSalesJournal : 81;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CheckGSTValidationsSalesJournal : "Gen. Journal Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CheckGSTValidationsSalesJournal(PROCEDURE 1500001).GenJournalLine1(Variable 1500001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CheckGSTValidationsSalesJournal : 81;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CheckGSTValidationsSalesJournal : "Gen. Journal Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ValidateAppliedTCSAndGSTGroup(PROCEDURE 1500007).SalesLine(Variable 1500000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ValidateAppliedTCSAndGSTGroup : 37;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ValidateAppliedTCSAndGSTGroup : "Sales Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ApplyingCustLedgEntry(Variable 1035)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ApplyingCustLedgEntry : 21;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ApplyingCustLedgEntry : "Cust. Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "AppliedCustLedgEntry(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //AppliedCustLedgEntry : 21;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AppliedCustLedgEntry : "Cust. Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Currency(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Currency : 4;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Currency : Currency;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CurrExchRate(Variable 1003)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CurrExchRate : 330;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CurrExchRate : "Currency Exchange Rate";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GenJnlLine(Variable 1004)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GenJnlLine : 81;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GenJnlLine : "Gen. Journal Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GenJnlLine2(Variable 1005)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GenJnlLine2 : 81;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GenJnlLine2 : "Gen. Journal Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "SalesHeader(Variable 1006)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SalesHeader : 36;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SalesHeader : "Sales Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ServHeader(Variable 1045)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ServHeader : 5900;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ServHeader : "Service Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Cust(Variable 1007)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Cust : 18;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Cust : Customer;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CustLedgEntry(Variable 1008)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CustLedgEntry : 21;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CustLedgEntry : "Cust. Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GLSetup(Variable 1009)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GLSetup : 98;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GLSetup : "General Ledger Setup";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "TotalSalesLine(Variable 1010)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //TotalSalesLine : 37;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TotalSalesLine : "Sales Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "TotalSalesLineLCY(Variable 1011)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //TotalSalesLineLCY : 37;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TotalSalesLineLCY : "Sales Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "TotalServLine(Variable 1046)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //TotalServLine : 5902;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TotalServLine : "Service Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "TotalServLineLCY(Variable 1047)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //TotalServLineLCY : 5902;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TotalServLineLCY : "Service Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "DetailedGSTLedgerEntry(Variable 1500104)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //DetailedGSTLedgerEntry : 16419;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DetailedGSTLedgerEntry : "Detailed GST Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CustEntrySetApplID(Variable 1013)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CustEntrySetApplID : 101;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CustEntrySetApplID : "Cust. Entry-SetAppl.ID";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GenJnlApply(Variable 1014)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GenJnlApply : 225;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GenJnlApply : "Gen. Jnl.-Apply";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "SalesPost(Variable 1015)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SalesPost : 80;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SalesPost : "Sales-Post";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "PaymentToleranceMgt(Variable 1048)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //PaymentToleranceMgt : 426;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PaymentToleranceMgt : "Payment Tolerance Management";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CustEntryEdit(Variable 1500003)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CustEntryEdit : 103;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CustEntryEdit : "Cust. Entry-Edit";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Navigate(Variable 1012)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Navigate : 344;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Navigate : Navigate;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ApplnType(Variable 1023)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ApplnType :  ,Applies-to Doc. No.,Applies-to ID;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ApplnType : " ","Applies-to Doc. No.","Applies-to ID";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GSTApplicationManagement(Variable 1500000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GSTApplicationManagement : 16403;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GSTApplicationManagement : "GST Application Management";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GSTManagement(Variable 1501005)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GSTManagement : 16401;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GSTManagement : "GST Management";
    //Variable type has not been exported.


    //Unsupported feature: CodeModification on "OnModifyRecord". Please convert manually.

    //trigger OnModifyRecord() : Boolean;
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF NOT GSTGroupWiseApplication(Rec,ApplyingCustLedgEntry) THEN
      CODEUNIT.RUN(CODEUNIT::"Cust. Entry-Edit",Rec);
    IF "Applies-to ID" <> xRec."Applies-to ID" THEN
      CalcApplnAmount;
    EXIT(FALSE);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF NOT GSTGroupWiseApplication(Rec,ApplyingCustLedgEntry) THEN
    CODEUNIT.RUN(CODEUNIT::"Cust. Entry-Edit",Rec);
    #3..5
    */
    //end;


    //Unsupported feature: CodeModification on "OnOpenPage". Please convert manually.

    //trigger OnOpenPage();
    //>>>> ORIGINAL CODE:
    //begin
    /*
    GSTGroupWiseRemainingAmount := 0;
    IF CalcType = CalcType::Direct THEN BEGIN
      Cust.GET("Customer No.");
      ApplnCurrencyCode := Cust."Currency Code";
    #5..11
    IF ApplnType = ApplnType::"Applies-to Doc. No." THEN
      CalcApplnAmount;
    PostingDone := FALSE;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    GSTGroupWiseRemainingAmount := 0;
    SETRANGE("Posting Date",(040108D),(03312035D));
    #2..14
    */
    //end;


    //Unsupported feature: CodeModification on "OnQueryClosePage". Please convert manually.

    //trigger OnQueryClosePage(CloseAction : Action) : Boolean;
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF CloseAction = ACTION::LookupOK THEN
      LookupOKOnPush;
    IF ApplnType = ApplnType::"Applies-to Doc. No." THEN BEGIN
      IF OK AND (ApplyingCustLedgEntry."Posting Date" < "Posting Date") THEN BEGIN
        OK := FALSE;
        ERROR(
          EarlierPostingDateErr,ApplyingCustLedgEntry."Document Type",ApplyingCustLedgEntry."Document No.",
          "Document Type","Document No.");
      END;
      IF OK THEN BEGIN
        IF "Amount to Apply" = 0 THEN
          IF NOT "GST on Advance Payment" THEN
            "Amount to Apply" := "Remaining Amount"
          ELSE
            IF "GST on Advance Payment" AND (CalcType = CalcType::GenJnlLine) AND
               (GenJnlLine."Document Type" = GenJnlLine."Document Type"::Refund)
            THEN
              "Amount to Apply" := "Remaining Amount"
            ELSE
              IF ("Amount to Apply" = 0) AND ("Remaining Amount" <> 0) THEN
                CASE CalcType OF
                  CalcType::SalesHeader:
                    BEGIN
                      CheckGSTValidationsSales(Rec);
                      IF GSTApplicationManagement.FillGSTApplicationBufferSales(SalesHeader,Rec) THEN
                        "Amount to Apply" :=
                          GSTApplicationManagement.GetApplicationRemainingAmount(
                            TransactionType2::Sales,SalesHeader."Document Type",SalesHeader."No.",
                            "Customer No.","GST Group Code","Remaining Amount",
                            "Remaining Amount" + "Total TDS/TCS Incl SHE CESS","Entry No.",TRUE,
                            InvoiceGSTAmount,AppliedGSTAmount,InvoiceBase);
                    END;
                  CalcType::ServHeader:
                    BEGIN
                      CheckGSTValidationsService(Rec);
                      IF GSTApplicationManagement.FillGSTApplicationBufferService(ServHeader,Rec) THEN
                        "Amount to Apply" :=
                          GSTApplicationManagement.GetApplicationRemainingAmount(
                            TransactionType2::Sales,ServHeader."Document Type",ServHeader."No.",
                            "Customer No.","GST Group Code","Remaining Amount",
                            "Remaining Amount","Entry No.",TRUE,InvoiceGSTAmount,AppliedGSTAmount,InvoiceBase);
                    END;
                  CalcType::GenJnlLine:
                    BEGIN
                      CheckGSTValidationsSalesJournal(Rec);
                      IF GSTApplicationManagement.FillGSTApplicationBufferSalesJournal(GenJnlLine,Rec) THEN
                        "Amount to Apply" :=
                          GSTApplicationManagement.GetApplicationRemainingAmount(
                            TransactionType2::Sales,SalesHeader."Document Type"::Invoice,GenJnlLine."Document No.",
                            "Customer No.","GST Group Code","Remaining Amount",
                            "Remaining Amount" + "Total TDS/TCS Incl SHE CESS","Entry No.",TRUE,
                            InvoiceGSTAmount,AppliedGSTAmount,InvoiceBase);
                    END;
                END;
        IF NOT GSTGroupWiseApplication(Rec,ApplyingCustLedgEntry) THEN
          CODEUNIT.RUN(CODEUNIT::"Cust. Entry-Edit",Rec);
      END;
    END;
    IF (CalcType = CalcType::Direct) AND NOT OK AND NOT PostingDone THEN BEGIN
      Rec := ApplyingCustLedgEntry;
      "Applying Entry" := FALSE;
      "Applies-to ID" := '';
      "Amount to Apply" := 0;
      IF NOT GSTGroupWiseApplication(Rec,ApplyingCustLedgEntry) THEN
        CODEUNIT.RUN(CODEUNIT::"Cust. Entry-Edit",Rec);
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..17
             "Amount to Apply" := "Remaining Amount"
            ELSE
              IF ("Amount to Apply" = 0) AND ("Remaining Amount" <> 0) THEN
            CASE CalcType OF
              CalcType::SalesHeader :
                    BEGIN
                      CheckGSTValidationsSales(Rec);
                IF GSTApplicationManagement.FillGSTApplicationBufferSales(SalesHeader,Rec) THEN
                  "Amount to Apply" :=
                    GSTApplicationManagement.GetApplicationRemainingAmount(
                      TransactionType2::Sales,SalesHeader."Document Type",SalesHeader."No.",
                      "Customer No.","GST Group Code","Remaining Amount",
                      "Remaining Amount" + "Total TDS/TCS Incl SHE CESS","Entry No.",TRUE,
                      InvoiceGSTAmount,AppliedGSTAmount,InvoiceBase);
                    END;
              CalcType::ServHeader :
                    BEGIN
                      CheckGSTValidationsService(Rec);
                IF GSTApplicationManagement.FillGSTApplicationBufferService(ServHeader,Rec) THEN
                    "Amount to Apply" :=
                      GSTApplicationManagement.GetApplicationRemainingAmount(
                        TransactionType2::Sales,ServHeader."Document Type",ServHeader."No.",
                        "Customer No.","GST Group Code","Remaining Amount",
                        "Remaining Amount","Entry No.",TRUE,InvoiceGSTAmount,AppliedGSTAmount,InvoiceBase);
            END;
    #43..55
        CODEUNIT.RUN(CODEUNIT::"Cust. Entry-Edit",Rec);
    #57..64
      CODEUNIT.RUN(CODEUNIT::"Cust. Entry-Edit",Rec);
    END;
    */
    //end;


    //Unsupported feature: CodeModification on "SetCustApplId(PROCEDURE 11)". Please convert manually.

    //procedure SetCustApplId();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF (CalcType = CalcType::GenJnlLine) AND (ApplyingCustLedgEntry."Posting Date" < "Posting Date") THEN
      ERROR(
        EarlierPostingDateErr,ApplyingCustLedgEntry."Document Type",ApplyingCustLedgEntry."Document No.",
    #4..18
            CustEntrySetApplID.SetGSTTypeService(ServHeader);
        CalcType::GenJnlLine :
          BEGIN
            IF GenJnlLine."Document Type" = GenJnlLine."Document Type"::Refund THEN
              CustEntrySetApplID.SetRefund;
            IF "GST on Advance Payment" THEN
              CustEntrySetApplID.SetGSTTypeJournal(GenJnlLine);
          END;
      END;
    END;
    CustEntrySetApplID.SetApplId(CustLedgEntry,ApplyingCustLedgEntry,GetAppliesToID);
    ActionPerformed := CustLedgEntry."Applies-to ID" <> '';
    CalcApplnAmount;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..21
          IF GenJnlLine."Document Type" = GenJnlLine."Document Type"::Refund THEN
            CustEntrySetApplID.SetRefund;
    #24..31
    */
    //end;


    //Unsupported feature: CodeModification on "GSTGroupWiseApplication(PROCEDURE 1500002)". Please convert manually.

    //procedure GSTGroupWiseApplication();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    WITH CustLedgerEntry DO BEGIN
      IF "Amount to Apply" = 0 THEN
        EXIT(FALSE);
      IF ("GST on Advance Payment") OR NOT ("GST Customer Type" IN ["GST Customer Type"::" ","GST Customer Type"::Exempted]) THEN BEGIN
        CASE CalcType OF
          CalcType::SalesHeader:
            BEGIN
              IF NOT "GST on Advance Payment" THEN
                EXIT(FALSE);
              CustEntryEdit.SetGSTType(SalesHeader,TRUE);
              COMMIT;
              IF NOT CustEntryEdit.RUN(Rec) THEN BEGIN
                IF GETLASTERRORTEXT <> '' THEN
                  OK := FALSE;
                ERROR(GETLASTERRORTEXT);
              END;
              IF CustEntryEdit.RUN(Rec) THEN
                EXIT(TRUE);
            END;
          CalcType::ServHeader:
            BEGIN
              IF NOT "GST on Advance Payment" THEN
                EXIT(FALSE);
              CustEntryEdit.SetGSTTypeService(ServHeader,TRUE);
              COMMIT;
              IF NOT CustEntryEdit.RUN(Rec) THEN BEGIN
                IF GETLASTERRORTEXT <> '' THEN
                  OK := FALSE;
                ERROR(GETLASTERRORTEXT);
              END;
              IF CustEntryEdit.RUN(Rec) THEN
                EXIT(TRUE);
            END;
          CalcType::GenJnlLine:
            BEGIN
              IF NOT "GST on Advance Payment" THEN
    #37..46
            END;
          CalcType::Direct:
            BEGIN
              CustEntryEdit.SetGSTTypeDirect(ApplyingCustLedgEntry,FALSE);
              COMMIT;
              IF NOT CustEntryEdit.RUN(CustLedgerEntry) THEN BEGIN
                IF GETLASTERRORTEXT <> '' THEN
                  OK := FALSE;
                ERROR(GETLASTERRORTEXT);
              END;
              IF CustEntryEdit.RUN(Rec) THEN
                EXIT(TRUE);
            END;
        END;
      END;
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..7
            IF NOT "GST on Advance Payment" THEN
              EXIT(FALSE);
            CustEntryEdit.SetGSTType(SalesHeader,TRUE);
    #11..17
            EXIT(TRUE);
          END;
          CalcType::ServHeader:
            BEGIN
            IF NOT "GST on Advance Payment" THEN
              EXIT(FALSE);
            CustEntryEdit.SetGSTTypeService(ServHeader,TRUE);
    #25..31
            EXIT(TRUE);
          END;
    #34..49
            CustEntryEdit.SetGSTTypeDirect(ApplyingCustLedgEntry,FALSE);
    #51..57
            EXIT(TRUE);
          END;
    #60..62
    */
    //end;

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

