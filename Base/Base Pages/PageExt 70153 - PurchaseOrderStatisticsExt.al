pageextension 70153 PurchaseOrderStatisticsExt extends "Purchase Order Statistics"
{
    // version NAVW19.00.00.51014,NAVIN9.00.00.51014

    layout
    {

        //Unsupported feature: Change Name on "Control 1900000001". Please convert manually.


        //Unsupported feature: Change Name on "Control 1". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500011". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500010". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500000". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500014". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500009". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500012". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500013". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500018". Please convert manually.


        //Unsupported feature: Change Name on "Control 30". Please convert manually.


        //Unsupported feature: Change Name on "Control 28". Please convert manually.


        //Unsupported feature: Change Name on "Control 23". Please convert manually.


        //Unsupported feature: Change Name on "Control 18". Please convert manually.


        //Unsupported feature: Change DrillDown on ""NoOfVATLines_General"(Control 40)". Please convert manually.


        //Unsupported feature: Change Name on "Control 16". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905885101". Please convert manually.


        //Unsupported feature: Change Name on "Control 59". Please convert manually.


        //Unsupported feature: Change Name on "Control 57". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500001". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500030". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500027". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500028". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500029". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500036". Please convert manually.


        //Unsupported feature: Change Name on "Control 55". Please convert manually.


        //Unsupported feature: Change Name on "Control 53". Please convert manually.


        //Unsupported feature: Change Name on "Control 48". Please convert manually.


        //Unsupported feature: Change Name on "Control 43". Please convert manually.


        //Unsupported feature: Change DrillDown on ""NoOfVATLines_Invoicing"(Control 64)". Please convert manually.


        //Unsupported feature: Change Name on "Control 41". Please convert manually.


        //Unsupported feature: Change Name on "Control 1906801201". Please convert manually.


        //Unsupported feature: Change Name on "Control 83". Please convert manually.


        //Unsupported feature: Change Name on "Control 81". Please convert manually.


        //Unsupported feature: Change Name on "Control 75". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500046". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500045". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500002". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500049". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500044". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500047". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500048". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500054". Please convert manually.


        //Unsupported feature: Change Name on "Control 79". Please convert manually.


        //Unsupported feature: Change Name on "Control 77". Please convert manually.


        //Unsupported feature: Change Name on "Control 72". Please convert manually.


        //Unsupported feature: Change Name on "Control 67". Please convert manually.


        //Unsupported feature: Change DrillDown on "Control 88". Please convert manually.


        //Unsupported feature: Change Name on "Control 88". Please convert manually.


        //Unsupported feature: Change Name on "Control 65". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900201301". Please convert manually.


        //Unsupported feature: Change ImplicitType on "PrepmtTotalAmount(Control 15)". Please convert manually.


        //Unsupported feature: Change Name on "Control 13". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 13". Please convert manually.


        //Unsupported feature: Change ImplicitType on "PrepmtTotalAmount2(Control 8)". Please convert manually.


        //Unsupported feature: Change Name on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 7". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 7". Please convert manually.


        //Unsupported feature: Change Name on "Control 5". Please convert manually.


        //Unsupported feature: Change Name on "Control 3". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 3". Please convert manually.


        //Unsupported feature: Change Name on "Control 4". Please convert manually.


        //Unsupported feature: Change DrillDown on "Control 90". Please convert manually.


        //Unsupported feature: Change Name on "Control 90". Please convert manually.


        //Unsupported feature: Change Name on "Control 1901061301". Please convert manually.


        //Unsupported feature: Change Name on "Control 131". Please convert manually.


        //Unsupported feature: CodeModification on ""NoOfVATLines_Invoicing"(Control 64).OnDrillDown". Please convert manually.

        //trigger OnDrillDown();
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ActiveTab := ActiveTab::Invoicing;
        VATLinesDrillDown(TempVATAmountLine2,TRUE);
        UpdateHeaderInfo(2,TempVATAmountLine2);

        IF TempVATAmountLine2.GetAnyLineModified THEN BEGIN
          UpdateVATOnPurchLines;
          RefreshOnAfterGetRecord;
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..4


        #5..8
        */
        //end;
    }


    //Unsupported feature: PropertyModification on "OnAfterGetRecord.StructureOrderDetails(Variable 1500003)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //OnAfterGetRecord.StructureOrderDetails : 13794;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //OnAfterGetRecord.StructureOrderDetails : "Structure Order Details";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "OnAfterGetRecord.GLSetup(Variable 1500004)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //OnAfterGetRecord.GLSetup : 98;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //OnAfterGetRecord.GLSetup : "General Ledger Setup";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "OnAfterGetRecord.GSTManagement(Variable 1500000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //OnAfterGetRecord.GSTManagement : 16401;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //OnAfterGetRecord.GSTManagement : "GST Management";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "OnAfterGetRecord.Currency(Variable 1500006)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //OnAfterGetRecord.Currency : 4;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //OnAfterGetRecord.Currency : Currency;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "RefreshOnAfterGetRecord(PROCEDURE 11).PurchLine(Variable 1003)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //RefreshOnAfterGetRecord : 39;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //RefreshOnAfterGetRecord : "Purchase Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "RefreshOnAfterGetRecord(PROCEDURE 11).TempPurchLine(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //RefreshOnAfterGetRecord : 39;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //RefreshOnAfterGetRecord : "Purchase Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "RefreshOnAfterGetRecord(PROCEDURE 11).PurchPostPrepayments(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //RefreshOnAfterGetRecord : 444;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //RefreshOnAfterGetRecord : "Purchase-Post Prepayments";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "UpdateHeaderInfo(PROCEDURE 5).CurrExchRate(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //UpdateHeaderInfo : 330;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //UpdateHeaderInfo : "Currency Exchange Rate";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "UpdatePrepmtAmount(PROCEDURE 9).TempPurchLine(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //UpdatePrepmtAmount : 39;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //UpdatePrepmtAmount : "Purchase Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "UpdatePrepmtAmount(PROCEDURE 9).PurchPostPrepmt(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //UpdatePrepmtAmount : 444;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //UpdatePrepmtAmount : "Purchase-Post Prepayments";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "UpdateVATOnPurchLines(PROCEDURE 1).PurchLine(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //UpdateVATOnPurchLines : 39;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //UpdateVATOnPurchLines : "Purchase Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "VendInvDiscRecExists(PROCEDURE 4).VendInvDisc(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //VendInvDiscRecExists : 24;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //VendInvDiscRecExists : "Vendor Invoice Disc.";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CheckAllowInvDisc(PROCEDURE 8).VendInvDisc(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CheckAllowInvDisc : 24;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CheckAllowInvDisc : "Vendor Invoice Disc.";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GSTApplicationAmount(PROCEDURE 1500002).VendorLedgerEntry(Variable 1500000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GSTApplicationAmount : 25;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GSTApplicationAmount : "Vendor Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GSTApplicationAmount(PROCEDURE 1500002).DetailedGSTLedgerEntry(Variable 1500001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GSTApplicationAmount : 16419;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GSTApplicationAmount : "Detailed GST Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GSTApplicationAmount(PROCEDURE 1500002).GSTApplicationBuffer(Variable 1500004)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GSTApplicationAmount : 16423;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GSTApplicationAmount : "GST Application Buffer";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "TotalPurchLine(Variable 1006)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //TotalPurchLine : 39;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TotalPurchLine : "Purchase Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "TotalPurchLineLCY(Variable 1007)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //TotalPurchLineLCY : 39;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TotalPurchLineLCY : "Purchase Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "PurchaseLine(Variable 1500000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //PurchaseLine : 39;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PurchaseLine : "Purchase Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Vend(Variable 1008)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Vend : 23;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Vend : Vendor;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "TempVATAmountLine1(Variable 1009)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //TempVATAmountLine1 : 290;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TempVATAmountLine1 : "VAT Amount Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "TempVATAmountLine2(Variable 1010)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //TempVATAmountLine2 : 290;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TempVATAmountLine2 : "VAT Amount Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "TempVATAmountLine3(Variable 1011)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //TempVATAmountLine3 : 290;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TempVATAmountLine3 : "VAT Amount Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "TempVATAmountLine4(Variable 1030)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //TempVATAmountLine4 : 290;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TempVATAmountLine4 : "VAT Amount Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "PurchSetup(Variable 1012)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //PurchSetup : 312;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PurchSetup : "Purchases & Payables Setup";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "PurchPost(Variable 1013)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //PurchPost : 90;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PurchPost : "Purch.-Post";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "VATLinesForm(Variable 1037)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //VATLinesForm : 9401;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //VATLinesForm : "VAT Amount Lines";
    //Variable type has not been exported.


    //Unsupported feature: CodeModification on "OnAfterGetRecord". Please convert manually.

    //trigger OnAfterGetRecord();
    //>>>> ORIGINAL CODE:
    //begin
    /*
    RefreshOnAfterGetRecord;
    ClearGSTStatisticsAmount;
    GLSetup.GET;
    #4..16
            TotalGSTInvoiced +=
              GSTManagement.RoundTotalGSTAmountforGSTAssessable(
                Transactiontype::Purchase,PurchaseLine."Document Type",
                PurchaseLine."Document No.",PurchaseLine."Line No.","Currency Code")
          ELSE
            TotalGSTInvoiced +=
              GSTManagement.RoundTotalGSTAmountQtyFactor(
    #24..31
            TotalGSTShipped +=
              GSTManagement.RoundTotalGSTAmountforGSTAssessable(
                Transactiontype::Purchase,PurchaseLine."Document Type",
                PurchaseLine."Document No.",PurchaseLine."Line No.","Currency Code")
          ELSE
            TotalGSTShipped +=
              GSTManagement.RoundTotalGSTAmountQtyFactor(
    #39..98
        TotalAdvGSTShipped := GetApplicableAmount(TotalAmountApplied,TotalGSTShipped);
      END;
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..19
              PurchaseLine."Document No.",PurchaseLine."Line No.","Currency Code")
    #21..34
              PurchaseLine."Document No.",PurchaseLine."Line No.","Currency Code")
    #36..101
    */
    //end;


    //Unsupported feature: CodeModification on "GetVATSpecification(PROCEDURE 21)". Please convert manually.

    //procedure GetVATSpecification();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CASE QtyType OF
      QtyType::General:
        BEGIN
          VATLinesForm.GetTempVATAmountLine(TempVATAmountLine1);
          IF TempVATAmountLine1.GetAnyLineModified THEN
            UpdateHeaderInfo(1,TempVATAmountLine1);
        END;
      QtyType::Invoicing:
        BEGIN
          VATLinesForm.GetTempVATAmountLine(TempVATAmountLine2);
          IF TempVATAmountLine2.GetAnyLineModified THEN
            UpdateHeaderInfo(2,TempVATAmountLine2);
        END;
      QtyType::Shipping:
        VATLinesForm.GetTempVATAmountLine(TempVATAmountLine3);
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..5
            BEGIN
            UpdateHeaderInfo(1,TempVATAmountLine1);


            END;

    #7..11
            BEGIN
            UpdateHeaderInfo(2,TempVATAmountLine2);


            END;
    #13..16
    */
    //end;


    //Unsupported feature: CodeModification on "UpdateInvDiscAmount(PROCEDURE 3)". Please convert manually.

    //procedure UpdateInvDiscAmount();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CheckAllowInvDisc;
    IF NOT (ModifiedIndexNo IN [1,2]) THEN
      EXIT;
    #4..69
    UpdateHeaderInfo(1,TempVATAmountLine1);
    UpdateHeaderInfo(2,TempVATAmountLine2);

    IF ModifiedIndexNo = 1 THEN
      VATLinesForm.SetTempVATAmountLine(TempVATAmountLine1)
    ELSE
    #76..78
    "Invoice Discount Value" := TotalPurchLine[1]."Inv. Discount Amount";
    MODIFY;
    UpdateVATOnPurchLines;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..72


    #73..81
    */
    //end;


    //Unsupported feature: CodeModification on "GSTApplicationAmount(PROCEDURE 1500002)". Please convert manually.

    //procedure GSTApplicationAmount();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    VendorLedgerEntry.SETCURRENTKEY("Document No.","Document Type","Buy-from Vendor No.");
    IF "Applies-to Doc. No." <> '' THEN BEGIN
      VendorLedgerEntry.SETRANGE("Document Type","Applies-to Doc. Type");
    #4..11
    VendorLedgerEntry.SETFILTER("Amount to Apply",'<>%1',0);
    IF VendorLedgerEntry.FINDSET THEN
      REPEAT
        GSTApplicationBuffer.SETRANGE("Transaction Type",GSTApplicationBuffer."Transaction Type"::Purchase);
        GSTApplicationBuffer.SETRANGE("Original Document Type",GSTApplicationBuffer."Original Document Type"::Payment);
        GSTApplicationBuffer.SETRANGE("Original Document No.",VendorLedgerEntry."Document No.");
        GSTApplicationBuffer.SETRANGE("GST Group Code",VendorLedgerEntry."GST Group Code");
        GSTApplicationBuffer.SETRANGE("CLE/VLE Entry No.",VendorLedgerEntry."Entry No.");
        IF GSTApplicationBuffer.FINDSET THEN
          REPEAT
            TotalAdvAmount += ABS(GSTApplicationBuffer."Applied Amount") ;
        UNTIL GSTApplicationBuffer.NEXT = 0;
      UNTIL VendorLedgerEntry.NEXT = 0;
    EXIT(TotalAdvAmount);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..14
      GSTApplicationBuffer.SETRANGE("Transaction Type",GSTApplicationBuffer."Transaction Type"::Purchase);
      GSTApplicationBuffer.SETRANGE("Original Document Type",GSTApplicationBuffer."Original Document Type"::Payment);
      GSTApplicationBuffer.SETRANGE("Original Document No.",VendorLedgerEntry."Document No.");
      GSTApplicationBuffer.SETRANGE("GST Group Code",VendorLedgerEntry."GST Group Code");
      GSTApplicationBuffer.SETRANGE("CLE/VLE Entry No.",VendorLedgerEntry."Entry No.");
    #20..22
      UNTIL GSTApplicationBuffer.NEXT = 0;
    UNTIL VendorLedgerEntry.NEXT = 0;
    EXIT(TotalAdvAmount);
    */
    //end;

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

