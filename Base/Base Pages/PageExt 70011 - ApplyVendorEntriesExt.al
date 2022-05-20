pageextension 70011 ApplyVendorEntriesExt extends "Apply Vendor Entries"
{
    // version NAVW19.00.00.50785,NAVIN9.00.00.50785

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


        //Unsupported feature: Change Name on "Control 38". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 38". Please convert manually.


        //Unsupported feature: Change Name on "Control 8". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 8". Please convert manually.


        //Unsupported feature: Change Name on "Control 10". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 10". Please convert manually.


        //Unsupported feature: Change Name on "Control 39". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 39". Please convert manually.


        //Unsupported feature: Change Name on "Control 61". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 61". Please convert manually.


        //Unsupported feature: Change Name on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 12". Please convert manually.


        //Unsupported feature: Change Name on "Control 14". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 14". Please convert manually.


        //Unsupported feature: Change Name on "Control 33". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500000". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500000". Please convert manually.


        //Unsupported feature: Change Name on "Control 90". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 90". Please convert manually.


        //Unsupported feature: Change Name on "Control 92". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500001". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500001". Please convert manually.


        //Unsupported feature: Change Name on "Control 16". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 16". Please convert manually.


        //Unsupported feature: Change Name on "Control 18". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 18". Please convert manually.


        //Unsupported feature: Change Name on "Control 66". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 66". Please convert manually.


        //Unsupported feature: Change Name on "Control 3". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 3". Please convert manually.


        //Unsupported feature: Change Name on "Control 20". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 20". Please convert manually.


        //Unsupported feature: Change Name on "Control 64". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 64". Please convert manually.


        //Unsupported feature: Change Name on "Control 51". Please convert manually.


        //Unsupported feature: Change Name on "Control 68". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 68". Please convert manually.


        //Unsupported feature: Change Name on "Control 24". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 24". Please convert manually.


        //Unsupported feature: Change Name on "Control 26". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 26". Please convert manually.


        //Unsupported feature: Change Name on "Control 56". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 56". Please convert manually.


        //Unsupported feature: Change Name on "Control 59". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 59". Please convert manually.

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

        //Unsupported feature: Change Name on "Control 1903866701". Please convert manually.


        //Unsupported feature: Change SourceExpr on "Control 49". Please convert manually.


        //Unsupported feature: Change Name on "Control 49". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900545201". Please convert manually.


        //Unsupported feature: Change SourceExpr on "AmountToApply(Control 45)". Please convert manually.


        //Unsupported feature: Change Name on "Control 1903099901". Please convert manually.


        //Unsupported feature: Change SourceExpr on "PmtDiscAmount(Control 94)". Please convert manually.


        //Unsupported feature: Change Name on "Control 1901652301". Please convert manually.


        //Unsupported feature: Change SourceExpr on "Control 53". Please convert manually.


        //Unsupported feature: Change Name on "Control 53". Please convert manually.


        //Unsupported feature: Change Name on "Control 1901992701". Please convert manually.


        //Unsupported feature: Change SourceExpr on "AppliedAmount(Control 98)". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900295601". Please convert manually.


        //Unsupported feature: Change SourceExpr on "Control 47". Please convert manually.


        //Unsupported feature: Change Name on "Control 47". Please convert manually.


        //Unsupported feature: Change Name on "Control 1901652401". Please convert manually.


        //Unsupported feature: Change SourceExpr on "ControlBalance(Control 43)". Please convert manually.

        addafter("Control 10")
        {
            field("Applies-to Doc. No."; "Applies-to Doc. No.")
            {
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000003". Please convert manually.


        //Unsupported feature: Change Name on "Action 37". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 31". Please convert manually.


        //Unsupported feature: Change RunPageOnRec on "Action 31". Please convert manually.


        //Unsupported feature: Change Name on "Action 31". Please convert manually.


        //Unsupported feature: Change AccessByPermission on "Action 57". Please convert manually.


        //Unsupported feature: Change Name on "Action 57". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 63". Please convert manually.


        //Unsupported feature: Change Name on "Action 63". Please convert manually.


        //Unsupported feature: Change Name on "Action 30". Please convert manually.

        modify(ActionSetAppliesToID)
        {
            Promoted = true;
            PromotedIsBig = true;
        }
        modify(ActionPostApplication)
        {

            //Unsupported feature: Change Ellipsis on "ActionPostApplication(Action 34)". Please convert manually.

            Promoted = true;
        }

        //Unsupported feature: Change Name on "Action 99". Please convert manually.


        //Unsupported feature: Change Name on "Action 100". Please convert manually.


        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.

        modify("Action 36")
        {
            Promoted = true;

            //Unsupported feature: Change Name on "Action 36". Please convert manually.

        }
    }


    //Unsupported feature: PropertyModification on "SetApplyingVendLedgEntry(PROCEDURE 9).Vendor(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SetApplyingVendLedgEntry : 23;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SetApplyingVendLedgEntry : Vendor;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "SetApplyingVendLedgEntry(PROCEDURE 9)."VendEntry-Edit"(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SetApplyingVendLedgEntry : 113;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SetApplyingVendLedgEntry : "Vend. Entry-Edit";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "SetVendApplId(PROCEDURE 10).VendorLedgerEntry(Variable 1500004)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SetVendApplId : 25;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SetVendApplId : "Vendor Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CalcApplnAmount(PROCEDURE 7).ExchAccGLJnlLine(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CalcApplnAmount : 366;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CalcApplnAmount : "Exchange Acc. G/L Journal Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "HandlChosenEntries(PROCEDURE 8).AppliedVendLedgEntryTemp(Variable 1004)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //HandlChosenEntries : 25;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //HandlChosenEntries : "Vendor Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "PostDirectApplication(PROCEDURE 15).VendEntryApplyPostedEntries(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //PostDirectApplication : 227;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PostDirectApplication : "VendEntry-Apply Posted Entries";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "PostDirectApplication(PROCEDURE 15).ServiceTaxMgt(Variable 1500000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //PostDirectApplication : 16471;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PostDirectApplication : "Service Tax Management";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "PostDirectApplication(PROCEDURE 15).PostApplication(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //PostDirectApplication : 579;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PostDirectApplication : "Post Application";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CheckRefundApplicationGST(PROCEDURE 1500001).DetailedVendorLedgEntry(Variable 1500000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CheckRefundApplicationGST : 380;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CheckRefundApplicationGST : "Detailed Vendor Ledg. Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CalcOppositeEntriesAmount(PROCEDURE 17).SavedAppliedVendorLedgerEntry(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CalcOppositeEntriesAmount : 25;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CalcOppositeEntriesAmount : "Vendor Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CheckGSTValidationsPurchase(PROCEDURE 1500000).DetailedGSTLedgerEntry(Variable 1500002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CheckGSTValidationsPurchase : 16419;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CheckGSTValidationsPurchase : "Detailed GST Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CheckGSTValidationsPurchase(PROCEDURE 1500000).GeneralLedgerSetup(Variable 1500003)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CheckGSTValidationsPurchase : 98;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CheckGSTValidationsPurchase : "General Ledger Setup";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CheckGSTValidationsPurchase(PROCEDURE 1500000).PurchaseLine(Variable 1500005)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CheckGSTValidationsPurchase : 39;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CheckGSTValidationsPurchase : "Purchase Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CheckGSTValidationsPurchase(PROCEDURE 1500000).Location(Variable 15028976)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CheckGSTValidationsPurchase : 14;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CheckGSTValidationsPurchase : Location;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CheckGSTValidationsPurchaseJournal(PROCEDURE 1500004).DetailedGSTLedgerEntry(Variable 1500002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CheckGSTValidationsPurchaseJournal : 16419;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CheckGSTValidationsPurchaseJournal : "Detailed GST Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CheckGSTValidationsPurchaseJournal(PROCEDURE 1500004).GeneralLedgerSetup(Variable 1500003)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CheckGSTValidationsPurchaseJournal : 98;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CheckGSTValidationsPurchaseJournal : "General Ledger Setup";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CheckGSTValidationsPurchaseJournal(PROCEDURE 1500004).Location(Variable 1501298)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CheckGSTValidationsPurchaseJournal : 14;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CheckGSTValidationsPurchaseJournal : Location;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ValidateAppliedTDSAndGSTGroup(PROCEDURE 1500005).PurchaseLine(Variable 1500000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ValidateAppliedTDSAndGSTGroup : 39;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ValidateAppliedTDSAndGSTGroup : "Purchase Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "IsGSTLiabilityGenerated(PROCEDURE 1500145).DetailedGSTLedgerEntry(Variable 1500000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //IsGSTLiabilityGenerated : 16419;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //IsGSTLiabilityGenerated : "Detailed GST Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "IsGSTLiabilityGenerated(PROCEDURE 1500145).VendorLedgerEntry(Variable 1500003)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //IsGSTLiabilityGenerated : 25;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //IsGSTLiabilityGenerated : "Vendor Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ApplyingVendLedgEntry(Variable 1033)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ApplyingVendLedgEntry : 25;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ApplyingVendLedgEntry : "Vendor Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "AppliedVendLedgEntry(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //AppliedVendLedgEntry : 25;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AppliedVendLedgEntry : "Vendor Ledger Entry";
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


    //Unsupported feature: PropertyModification on "PurchHeader(Variable 1006)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //PurchHeader : 38;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PurchHeader : "Purchase Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Vend(Variable 1007)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Vend : 23;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Vend : Vendor;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "VendLedgEntry(Variable 1008)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //VendLedgEntry : 25;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //VendLedgEntry : "Vendor Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "DetailedGSTLedgerEntry(Variable 1500105)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //DetailedGSTLedgerEntry : 16419;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DetailedGSTLedgerEntry : "Detailed GST Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GLSetup(Variable 1009)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GLSetup : 98;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GLSetup : "General Ledger Setup";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "TotalPurchLine(Variable 1010)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //TotalPurchLine : 39;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TotalPurchLine : "Purchase Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "TotalPurchLineLCY(Variable 1011)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //TotalPurchLineLCY : 39;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TotalPurchLineLCY : "Purchase Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GenJournalLine2(Variable 1500015)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GenJournalLine2 : 81;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GenJournalLine2 : "Gen. Journal Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GenJournalLine1(Variable 1500017)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GenJournalLine1 : 81;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GenJournalLine1 : "Gen. Journal Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "VendEntrySetApplID(Variable 1013)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //VendEntrySetApplID : 111;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //VendEntrySetApplID : "Vend. Entry-SetAppl.ID";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GenJnlApply(Variable 1014)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GenJnlApply : 225;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GenJnlApply : "Gen. Jnl.-Apply";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "PurchPost(Variable 1015)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //PurchPost : 90;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PurchPost : "Purch.-Post";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "PaymentToleranceMgt(Variable 1037)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //PaymentToleranceMgt : 426;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PaymentToleranceMgt : "Payment Tolerance Management";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GSTApplicationManagement(Variable 1500000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GSTApplicationManagement : 16403;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GSTApplicationManagement : "GST Application Management";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "VendEntryEdit(Variable 1500005)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //VendEntryEdit : 113;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //VendEntryEdit : "Vend. Entry-Edit";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GSTManagement(Variable 1500014)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GSTManagement : 16401;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GSTManagement : "GST Management";
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


    //Unsupported feature: CodeModification on "OnModifyRecord". Please convert manually.

    //trigger OnModifyRecord() : Boolean;
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF NOT GSTGroupWiseApplication(Rec,ApplyingVendLedgEntry) THEN
      CODEUNIT.RUN(CODEUNIT::"Vend. Entry-Edit",Rec);
    IF "Applies-to ID" <> xRec."Applies-to ID" THEN
      CalcApplnAmount;
    EXIT(FALSE);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF NOT GSTGroupWiseApplication(Rec,ApplyingVendLedgEntry) THEN
    CODEUNIT.RUN(CODEUNIT::"Vend. Entry-Edit",Rec);
    #3..5
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
      IF OK AND (ApplyingVendLedgEntry."Posting Date" < "Posting Date") THEN BEGIN
        OK := FALSE;
        ERROR(
          EarlierPostingDateErr,ApplyingVendLedgEntry."Document Type",ApplyingVendLedgEntry."Document No.",
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
              IF ("Amount to Apply" = 0) AND ("Remaining Amount" <> 0) AND (CalcType = CalcType::GenJnlLine) THEN BEGIN
                CheckGSTValidationsPurchaseJournal(Rec);
                IF GSTApplicationManagement.FillGSTApplicationBufferPurchaseJournal(GenJnlLine,Rec) THEN
                  "Amount to Apply" :=
                    GSTApplicationManagement.GetApplicationRemainingAmount(
                      TransactionType2::Purchase,PurchHeader."Document Type"::Invoice,GenJnlLine."Document No.",
                      "Vendor No.","GST Group Code","Remaining Amount",
                      "Remaining Amount" ,"Entry No.",FALSE,InvoiceGSTAmount,AppliedGSTAmount,InvoiceBase);
              END ELSE
                IF ("Amount to Apply" = 0) AND ("Remaining Amount" <> 0) AND (CalcType = CalcType::PurchHeader) THEN BEGIN
                  CheckGSTValidationsPurchase(Rec);
                  IF GSTApplicationManagement.FillGSTApplicationBufferPurchase(PurchHeader,Rec) THEN
                    "Amount to Apply" :=
                      GSTApplicationManagement.GetApplicationRemainingAmount(
                        TransactionType2::Purchase,PurchHeader."Document Type",PurchHeader."No.",
                        "Vendor No.","GST Group Code","Remaining Amount",
                        "Remaining Amount" ,"Entry No.",FALSE,InvoiceGSTAmount,AppliedGSTAmount,InvoiceBase);
                END;
        IF NOT GSTGroupWiseApplication(Rec,ApplyingVendLedgEntry) THEN
          CODEUNIT.RUN(CODEUNIT::"Vend. Entry-Edit",Rec);
      END;
    END;

    IF CheckActionPerformed THEN BEGIN
      Rec := ApplyingVendLedgEntry;
      "Applying Entry" := FALSE;
      IF AppliesToID = '' THEN BEGIN
        "Applies-to ID" := '';
        "Amount to Apply" := 0;
      END;
      IF NOT GSTGroupWiseApplication(Rec,ApplyingVendLedgEntry) THEN
        CODEUNIT.RUN(CODEUNIT::"Vend. Entry-Edit",Rec);
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..30
            IF GSTApplicationManagement.FillGSTApplicationBufferPurchase(PurchHeader,Rec) THEN
                "Amount to Apply" :=
                  GSTApplicationManagement.GetApplicationRemainingAmount(
                    TransactionType2::Purchase,PurchHeader."Document Type",PurchHeader."No.",
                    "Vendor No.","GST Group Code","Remaining Amount",
                    "Remaining Amount" ,"Entry No.",FALSE,InvoiceGSTAmount,AppliedGSTAmount,InvoiceBase);
                END;
        IF NOT GSTGroupWiseApplication(Rec,ApplyingVendLedgEntry) THEN
        CODEUNIT.RUN(CODEUNIT::"Vend. Entry-Edit",Rec);
    #40..50
      CODEUNIT.RUN(CODEUNIT::"Vend. Entry-Edit",Rec);
    END;
    */
    //end;


    //Unsupported feature: CodeModification on "SetVendApplId(PROCEDURE 10)". Please convert manually.

    //procedure SetVendApplId();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF (CalcType = CalcType::GenJnlLine) AND (ApplyingVendLedgEntry."Posting Date" < "Posting Date") THEN
      ERROR(
        EarlierPostingDateErr,ApplyingVendLedgEntry."Document Type",ApplyingVendLedgEntry."Document No.",
    #4..16
            VendEntrySetApplID.SetGSTType(PurchHeader);
        CalcType::GenJnlLine :
          BEGIN
            IF GenJnlLine."Document Type" =  GenJnlLine."Document Type"::Refund THEN
              VendEntrySetApplID.SetRefund;
            IF "GST on Advance Payment" THEN
              VendEntrySetApplID.SetGSTTypeJournal(GenJnlLine);
          END;
      END;
    END;

    IF GenJnlLineApply THEN
    #29..31

    ActionPerformed := VendLedgEntry."Applies-to ID" <> '';
    CalcApplnAmount;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..19
          IF GenJnlLine."Document Type" =  GenJnlLine."Document Type"::Refund THEN
            VendEntrySetApplID.SetRefund;
    #22..24
          END;
    #26..34
    */
    //end;


    //Unsupported feature: CodeModification on "PostDirectApplication(PROCEDURE 15)". Please convert manually.

    //procedure PostDirectApplication();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF CalcType = CalcType::Direct THEN BEGIN
      IF ApplyingVendLedgEntry."Entry No." <> 0 THEN BEGIN
        ServiceTaxMgt.CheckApplyServiceTaxAndTDS(ApplyingVendLedgEntry,Rec);
        IF "Document Type" = "Document Type"::Invoice THEN BEGIN
          IF HasGSTEntry("Transaction No.") AND ("TDS Nature of Deduction" = '') THEN BEGIN
            IF (ApplyingVendLedgEntry."GST Group Code" <> '') AND (ApplyingVendLedgEntry."TDS Nature of Deduction" <> '') THEN
              ERROR(GSTWithTDSErr);
            IF AppliedVendLedgEntry."TDS Nature of Deduction" <> '' THEN
              ERROR(GSTWithTDSErr);
          END;
    #11..25
            IF ApplyingVendLedgEntry.HasGSTEntry(AppliedVendLedgEntry."Transaction No.") AND
               (AppliedVendLedgEntry."TDS Nature of Deduction" <> '')
            THEN
              ERROR(GSTWithTDSErr);
        END;
        Rec := ApplyingVendLedgEntry;
        ApplicationDate := VendEntryApplyPostedEntries.GetApplicationDate(Rec);
    #33..36
            ERROR(Text013,FIELDCAPTION("Posting Date"),TABLECAPTION);
        END ELSE
          ERROR(Text019);
        IF PreviewMode THEN
          VendEntryApplyPostedEntries.PreviewApply(Rec,NewDocumentNo,NewApplicationDate)
        ELSE
    #43..49
        ERROR(Text002);
    END ELSE
      ERROR(Text003);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..5
        IF (ApplyingVendLedgEntry."GST Group Code" <> '') AND (ApplyingVendLedgEntry."TDS Nature of Deduction" <> '') THEN
            ERROR(GSTWithTDSErr);
    #8..28
          ERROR(GSTWithTDSErr);
    #30..39

    #40..52
    */
    //end;

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

