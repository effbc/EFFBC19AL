codeunit 33000021 "Payroll Jnl.-Post Batch"
{
    // version NEOGYNPAY13.70.00.07,DIM1.0

    // Project : EFFTRONICS
    // *************************************************************************************************************************
    // SIGN Name
    // ************************************************************************************************************************
    // DIM : Resolution of Dimension Issues after Upgarding.
    // ***********************************************************************************************************************
    // Version  sign     Date       USERID    Description
    // *************************************************************************************************************************
    // 1.0      DIM      28-May-13  SAIRAM    New Code has been added for the dimensions updation after upgarding.

    Permissions = TableData "Pay Gen. Journal Batch" = imd;
    TableNo = "Payroll Journal Line";

    trigger OnRun();
    begin
        PayrollJnlLine.COPY(Rec);
        Code;
        Rec := PayrollJnlLine;
    end;

    var
        PayJnlTemplate: Record "Pay Journal Template";
        PayGenJnlBatch: Record "Pay Gen. Journal Batch";
        PayrollJnlLine: Record "Payroll Journal Line";
        PayrollJnlLine2: Record "Payroll Journal Line";
        PayrollJnlLine3: Record "Payroll Journal Line";
        TempPayrollJnlLine4: Record "Payroll Journal Line" temporary;
        PayrollJnlLine5: Record "Payroll Journal Line";
        GLEntry: Record "G/L Entry";
        GLReg: Record "G/L Register";
        GLAcc: Record "G/L Account";
        GenJnlAlloc: Record "Gen. Jnl. Allocation";
        AccountingPeriod: Record "Accounting Period";
        NoSeries: Record "No. Series" temporary;
        GLSetup: Record "General Ledger Setup";
        PayJnlCheckLine: Codeunit "Payroll Jnl.-Check Line";
        PayJnlPostLine: Codeunit "Payroll Jnl.-Post Line";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        NoSeriesMgt2: array[10] of Codeunit NoSeriesManagement;
        DimMgt: Codeunit DimensionManagement;
        Window: Dialog;
        GLRegNo: Integer;
        StartLineNo: Integer;
        StartLineNoReverse: Integer;
        LastDate: Date;
        LastDocType: Integer;
        LastDocNo: Code[20];
        LastPostedDocNo: Code[20];
        CurrentBalance: Decimal;
        CurrentBalanceReverse: Decimal;
        Day: Integer;
        Week: Integer;
        Month: Integer;
        MonthText: Text[30];
        NoOfRecords: Integer;
        NoOfReversingRecords: Integer;
        LineCount: Integer;
        NoOfPostingNoSeries: Integer;
        PostingNoSeriesNo: Integer;
        DocCorrection: Boolean;
        CurrentEmployee: Integer;
        LastCurrencyCode: Code[10];
        CurrencyBalance: Decimal;
        "0DF": DateFormula;
        EmpLedgerEntry: Record "Employee Ledger Entry";
        Text000: Label 'cannot exceed %1 characters';
        Text001: Label 'Journal Batch Name    #1##########\\';
        Text002: Label 'Checking lines        #2######\';
        Text003: Label 'Checking balance      #3###### @4@@@@@@@@@@@@@\';
        Text004: Label 'Posting lines         #5###### @6@@@@@@@@@@@@@\';
        Text005: Label 'Posting revers. lines #7###### @8@@@@@@@@@@@@@\';
        Text006: Label 'Updating lines        #9###### @10@@@@@@@@@@@@';
        Text007: Label 'Posting lines         #5###### @6@@@@@@@@@@@@@';
        Text008: Label 'must be the same on all lines for the same document.';
        Text009: Label '"%1 %2 posted on %3 includes more than one customer or vendor. "';
        Text010: Label 'In order for the program to calculate VAT, the entries must be separated by another document number or by an empty line.';
        Text012: Label '"%4 %2 is out of balance by %1. "';
        Text013: Label 'Please check that %3, %4 and %5 are correct for each line.';
        Text014: Label '"The lines in %1 are out of balance by %2. "';
        Text015: Label 'Check that %3 and %4 are correct for each line.';
        Text016: Label '"Your reversing entries in %4 %2 are out of balance by %1. "';
        Text017: Label 'Please check whether %3 is correct for each line for this %4.';
        Text018: Label '"Your reversing entries for %1 are out of balance by %2. "';
        Text019: Label '"%3 %1 is out of balance due to the additional reporting currency. "';
        Text020: Label 'Please check that %2 is correct for each line.';
        Text021: Label 'cannot be specified when using recurring journals.';
        Text022: Label 'The Balance and Reversing Balance recurring methods can be used only for G/L accounts.';
        Text023: Label 'Allocations can only be used with recurring journals.';
        Text024: Label '<Month Text>';
        Text025: Label 'A maximum of %1 posting number series can be used in each journal.';
        Text026: Label '"%4 %2 is out of balance by %1 %6. "';
        Text027: Label '"The lines in %1 are out of balance by %2 %5. "';
        Text028: Label 'The Balance and Reversing Balance recurring methods can be used only with Allocations.';
        Text13700: Label 'Purchase %1 %2 already exists for this vendor.';
        Text13701: Label 'Sales %1 %2 already exists for this Customer.';
        Text13702: Label 'Purchase %1 %2 already exists.';
        Text13703: Label 'Sales %1 %2 already exists.';

    [LineStart(45376)]
    local procedure "Code"();
    var
        UpdateAnalysisView: Codeunit "Update Analysis View";
        OldEmpLdgrEntry: Record "Employee Ledger Entry";
        EmployeeLocal: Record Employee;
        EmpPostingGroupLocal: Record "Employee Posting Group";
    begin
        WITH PayrollJnlLine DO BEGIN
            SETRANGE("Pay Journal Template", "Pay Journal Template");
            SETRANGE("Pay Journal Batch", "Pay Journal Batch");
            IF RECORDLEVELLOCKING THEN BEGIN
                LOCKTABLE;
                GenJnlAlloc.LOCKTABLE;
            END;

            PayJnlTemplate.GET("Pay Journal Template");
            PayGenJnlBatch.GET("Pay Journal Template", "Pay Journal Batch");
            IF STRLEN(INCSTR(PayGenJnlBatch.Name)) > MAXSTRLEN(PayGenJnlBatch.Name) THEN
                PayGenJnlBatch.FIELDERROR(Name, STRSUBSTNO(Text000, MAXSTRLEN(PayGenJnlBatch.Name)));

            IF PayJnlTemplate.Recurring THEN BEGIN
                SETRANGE("Posting Date", 0D, WORKDATE);
                //SETFILTER("Expiration Date",'%1 | %2..',0D,WORKDATE);
                GLSetup.GET;
            END;

            IF NOT FIND('=><') THEN BEGIN
                "Line No." := 0;
                COMMIT;
                EXIT;
            END;

            IF PayJnlTemplate.Recurring THEN
                Window.OPEN(Text001 + Text002 + Text003 + Text004 + Text005 + Text006)
            ELSE
                Window.OPEN(Text001 + Text002 + Text003 + Text007);
            Window.UPDATE(1, "Pay Journal Batch");

            ////////// Check lines//////////////
            LineCount := 0;
            StartLineNo := "Line No.";
            REPEAT
                LineCount := LineCount + 1;
                Window.UPDATE(2, LineCount);
                CheckRecurringLine(PayrollJnlLine);

                /*
                IF NOT Adjustment THEN
                  BEGIN
                    IF "Account Type" = "Account Type"::Vendor THEN
                      BEGIN
                        Vend.GET("Account No.");
                        Vend.CheckBlockedVendOnJnls(Vend,"Document Type",TRUE);
                        IF "Posting Group" = '' THEN
                          BEGIN
                            Vend.TESTFIELD("Vendor Posting Group");
                            "Posting Group" := Vend."Vendor Posting Group";
                          END;

                        VendPostingGr.GET("Posting Group");
                        VendPostingGr.TESTFIELD("Payables Account");
                      END;
                  END;
                */
                UpdateRecurringAmt(PayrollJnlLine);
                CheckAllocations(PayrollJnlLine);
                PayrollJnlLine5.COPY(PayrollJnlLine);
                PreparePayrollJnlLineAddCurr(PayrollJnlLine5);

                //DIm1.0 Start
                //Code Commented
                /*
                JnlLineDim.SETRANGE("Table ID",DATABASE::"Payroll Journal Line");
                JnlLineDim.SETRANGE("Journal Template Name",PayrollJnlLine5."Pay Journal Template");
                JnlLineDim.SETRANGE("Journal Batch Name",PayrollJnlLine5."Pay Journal Batch");
                JnlLineDim.SETRANGE("Journal Line No.",PayrollJnlLine5."Line No.");
                JnlLineDim.SETRANGE("Allocation Line No.",0);
                TempJnlLineDim.DELETEALL;
                */
                /*
                DimMgt.CopyJnlLineDimToJnlLineDim(JnlLineDim,TempJnlLineDim);
                PayJnlCheckLine.RunCheck(PayrollJnlLine5,TempJnlLineDim);
                */
                PayJnlCheckLine.RunCheck(PayrollJnlLine5);
                //DIm1.0 End


                IF NEXT = 0 THEN
                    FIND('-');
            UNTIL "Line No." = StartLineNo;

            NoOfRecords := LineCount;

            ////////// Check balance////////////
            LineCount := 0;
            LastDate := 0D;
            LastDocType := 0;
            LastDocNo := '';
            //LastFAAddCurrExchRate := 0;
            CurrentEmployee := 0;
            CurrentBalance := 0;
            CurrentBalanceReverse := 0;
            CurrencyBalance := 0;

            FIND('-');
            LastCurrencyCode := "Currency Code";
            REPEAT
                LineCount := LineCount + 1;
                Window.UPDATE(3, LineCount);
                Window.UPDATE(4, ROUND(LineCount / NoOfRecords * 10000, 1));

                IF NOT EmptyLine THEN BEGIN
                    /*
                    IF (PayGenJnlBatch."No. Series" <> '') AND  ("Document No." <> LastDocNo) THEN
                      BEGIN
                        IF NOT PayrollJnlLine.JV THEN
                          TESTFIELD("Document No.",NoSeriesMgt.GetNextNo(PayGenJnlBatch."No. Series","Posting Date",FALSE))
                      END;
                    */
                    IF ("Posting Date" <> LastDate) OR ("Document Type" <> LastDocType) OR ("Document No." <> LastDocNo) THEN BEGIN
                        IF Correction THEN
                            //PayJnlTemplate.TESTFIELD("Force Doc. Balance",TRUE);
                            DocCorrection := Correction;
                    END
                    ELSE
                        IF Correction <> DocCorrection THEN
                            FIELDERROR(Correction, Text008);
                END;

                //IF ("Posting Date" <> LastDate) OR PayJnlTemplate."Force Doc. Balance" AND
                //   (("Document Type" <> LastDocType) OR ("Document No." <> LastDocNo)) THEN
                IF ("Posting Date" <> LastDate) AND
                   (("Document Type" <> LastDocType) OR ("Document No." <> LastDocNo)) THEN BEGIN
                    CheckBalance;
                    CurrencyBalance := 0;
                    LastCurrencyCode := "Currency Code";
                    CurrentEmployee := 0;
                END;

                IF Amount <> 0 THEN BEGIN
                    /*
                    IF LastFAAddCurrExchRate <> "FA Add.-Currency Factor" THEN
                      CheckAddExchRateBalance;
                    */
                    IF CurrentBalance = 0 THEN BEGIN
                        StartLineNo := "Line No.";
                        CurrentEmployee := 0;
                    END;

                    IF CurrentBalanceReverse = 0 THEN
                        StartLineNoReverse := "Line No.";
                    UpdateLineBalance;
                    CurrentBalance := CurrentBalance + "Balance (LCY)";
                    /*
                    IF "Recurring Method" >= "Recurring Method"::"RF Reversing Fixed" THEN
                      CurrentBalanceReverse := CurrentBalanceReverse + "Balance (LCY)";
                    IF ("Recurring Method" <> "Recurring Method"::" ") THEN
                      CALCFIELDS("Allocated Amt. (LCY)");

                    IF ("Recurring Method" = "Recurring Method"::" ") OR ("Amount (LCY)" <> -"Allocated Amt. (LCY)") THEN
                      IF ("Currency Code" <> LastCurrencyCode) THEN
                        LastCurrencyCode := ''
                      ELSE
                        IF ("Currency Code" <> '') AND (("Account No." = '') XOR ("Bal. Account No." = '')) THEN
                          IF ("Account No." <> '') THEN
                            CurrencyBalance := CurrencyBalance + Amount
                          ELSE
                            CurrencyBalance := CurrencyBalance - Amount;
                    */
                END;

                LastDate := "Posting Date";
                LastDocType := "Document Type";
                LastDocNo := "Document No.";
            //LastFAAddCurrExchRate := "FA Add.-Currency Factor";
            /*
            IF PayJnlTemplate."Force Doc. Balance" THEN
              BEGIN
                IF (("Account Type" IN ["Account Type"::Customer,"Account Type"::Vendor]) AND
                   ("Account No." <> '')) OR
                   (("Bal. Account Type" IN ["Bal. Account Type"::Customer,"Bal. Account Type"::Vendor]) AND
                   ("Bal. Account No." <> ''))
                THEN
                  CurrentEmployee := CurrentEmployee + 1;

                IF (CurrentEmployee > 1) AND VATEntryCreated THEN
                  ERROR(Text009 + Text010, "Document Type","Document No.","Posting Date")
              END;
            */
            UNTIL NEXT = 0;

            CopyFields;
            IF NOT RECORDLEVELLOCKING THEN
                COMMIT;

            ////////// Find next register no.////////////
            //LedgEntryDim.LOCKTABLE; //DIm1.0
            GLEntry.LOCKTABLE;
            IF RECORDLEVELLOCKING THEN
                IF GLEntry.FIND('+') THEN;

            GLReg.LOCKTABLE;
            IF GLReg.FIND('+') THEN
                GLRegNo := GLReg."No." + 1
            ELSE
                GLRegNo := 1;

            /////////// Post lines////////////////
            LineCount := 0;
            LastDocNo := '';
            LastPostedDocNo := '';
            TempPayrollJnlLine4.DELETEALL;
            //TempJnlLineDim4.DELETEALL; //DIM1.0
            NoOfReversingRecords := 0;
            FIND('-');
            REPEAT
                PayrollJnlLine3 := PayrollJnlLine;
                WITH PayrollJnlLine3 DO BEGIN
                    LineCount := LineCount + 1;
                    Window.UPDATE(5, LineCount);
                    Window.UPDATE(6, ROUND(LineCount / NoOfRecords * 10000, 1));
                    MakeRecurringTexts(PayrollJnlLine3);
                    CheckDocumentNo(PayrollJnlLine3);
                    PayrollJnlLine5.COPY(PayrollJnlLine3);
                    PreparePayrollJnlLineAddCurr(PayrollJnlLine5);

                    //DIM1.0 Start
                    //Code Commented
                    /*
                    JnlLineDim.SETRANGE("Table ID",DATABASE::"Payroll Journal Line");
                    JnlLineDim.SETRANGE("Journal Template Name",PayrollJnlLine5."Pay Journal Template");
                    JnlLineDim.SETRANGE("Journal Batch Name",PayrollJnlLine5."Pay Journal Batch");
                    JnlLineDim.SETRANGE("Journal Line No.",PayrollJnlLine5."Line No.");
                    JnlLineDim.SETRANGE("Allocation Line No.",0);
                    TempJnlLineDim.DELETEALL;
                    DimMgt.CopyJnlLineDimToJnlLineDim(JnlLineDim,TempJnlLineDim);
                    PayJnlPostLine.RunWithoutCheck(PayrollJnlLine5,TempJnlLineDim);
                    */
                    PayJnlPostLine.RunWithoutCheck(PayrollJnlLine5);
                    //DIM1.0 End
                    /*
                    IF ("Recurring Method" >= "Recurring Method"::"RF Reversing Fixed") AND ("Posting Date" <> 0D) THEN
                      BEGIN
                        "Posting Date" := "Posting Date" + 1;
                        MultiplyAmounts(PayrollJnlLine3,-1);
                        TempPayrollJnlLine4 := PayrollJnlLine3;
                        TempPayrollJnlLine4."Reversing Entry" := TRUE;
                        TempPayrollJnlLine4.INSERT;
                        DimMgt.CopyJnlLineDimToJnlLineDim(TempJnlLineDim,TempJnlLineDim4);
                        NoOfReversingRecords := NoOfReversingRecords + 1;
                        "Posting Date" := "Posting Date" - 1;
                      END;
                    */
                    PostAllocations(PayrollJnlLine3, FALSE);
                END;
            UNTIL NEXT = 0;

            //////////// Post reversing lines//////////
            LineCount := 0;
            LastDocNo := '';
            LastPostedDocNo := '';
            IF TempPayrollJnlLine4.FIND('-') THEN
                REPEAT
                    PayrollJnlLine3 := TempPayrollJnlLine4;
                    //DIM1.0 Start
                    //Code Commented
                    /*
                    TempJnlLineDim4.SETRANGE("Table ID",DATABASE::"Payroll Journal Line");
                    TempJnlLineDim4.SETRANGE("Journal Template Name",TempPayrollJnlLine4."Pay Journal Template");
                    TempJnlLineDim4.SETRANGE("Journal Batch Name",TempPayrollJnlLine4."Pay Journal Batch");
                    TempJnlLineDim4.SETRANGE("Journal Line No.",TempPayrollJnlLine4."Line No.");
                    TempJnlLineDim4.SETRANGE("Allocation Line No.",0);
                    TempJnlLineDim.DELETEALL;
                    DimMgt.CopyJnlLineDimToJnlLineDim(TempJnlLineDim4,TempJnlLineDim);
                    */
                    //DIm1.0 End

                    WITH PayrollJnlLine3 DO BEGIN
                        LineCount := LineCount + 1;
                        Window.UPDATE(7, LineCount);
                        Window.UPDATE(8, ROUND(LineCount / NoOfReversingRecords * 10000, 1));
                        CheckDocumentNo(PayrollJnlLine3);
                        PayrollJnlLine5.COPY(PayrollJnlLine3);
                        PreparePayrollJnlLineAddCurr(PayrollJnlLine5);

                        //DIM1.0 Start
                        //Code Commented
                        /*
                        JnlLineDim.SETRANGE("Table ID",DATABASE::"Payroll Journal Line");
                        JnlLineDim.SETRANGE("Journal Template Name",PayrollJnlLine5."Pay Journal Template");
                        JnlLineDim.SETRANGE("Journal Batch Name",PayrollJnlLine5."Pay Journal Batch");
                        JnlLineDim.SETRANGE("Journal Line No.",PayrollJnlLine5."Line No.");
                        JnlLineDim.SETRANGE("Allocation Line No.",0);
                        TempJnlLineDim.DELETEALL;
                        DimMgt.CopyJnlLineDimToJnlLineDim(JnlLineDim,TempJnlLineDim);
                        PayJnlPostLine.RunWithoutCheck(PayrollJnlLine5,TempJnlLineDim);
                        */
                        PayJnlPostLine.RunWithoutCheck(PayrollJnlLine5);
                        //DIM1.0 End


                        PostAllocations(PayrollJnlLine3, TRUE);
                    END;
                UNTIL TempPayrollJnlLine4.NEXT = 0;

            //////// Copy register no. and current Pay Journal Batch to general journal/////////
            IF NOT GLReg.FIND('+') OR (GLReg."No." <> GLRegNo) THEN
                GLRegNo := 0;

            INIT;
            "Line No." := GLRegNo;

            /////////// Update/delete lines/////////
            IF GLRegNo <> 0 THEN BEGIN
                IF NOT RECORDLEVELLOCKING THEN BEGIN
                    //JnlLineDim.LOCKTABLE(TRUE,TRUE); //DIM1.0
                    LOCKTABLE(TRUE, TRUE);
                END;

                IF PayJnlTemplate.Recurring THEN BEGIN
                    ///////// Recurring journal/////////
                    LineCount := 0;
                    PayrollJnlLine2.COPYFILTERS(PayrollJnlLine);
                    PayrollJnlLine2.FIND('-');
                    REPEAT
                        LineCount := LineCount + 1;
                        Window.UPDATE(9, LineCount);
                        Window.UPDATE(10, ROUND(LineCount / NoOfRecords * 10000, 1));
                        IF PayrollJnlLine2."Posting Date" <> 0D THEN
                            //PayrollJnlLine2.VALIDATE("Posting Date",
                            //                          CALCDATE(PayrollJnlLine2."Recurring Frequency",PayrollJnlLine2."Posting Date"));
                            PayrollJnlLine2.VALIDATE("Posting Date", PayrollJnlLine2."Posting Date");
                        /*
                        IF NOT (PayrollJnlLine2."Recurring Method" IN [PayrollJnlLine2."Recurring Method"::"F  Fixed",
                                                                       PayrollJnlLine2."Recurring Method"::"RF Reversing Fixed"])
                        THEN
                          MultiplyAmounts(PayrollJnlLine2,0);
                        */
                        PayrollJnlLine2.MODIFY;
                    UNTIL PayrollJnlLine2.NEXT = 0;
                END
                ELSE BEGIN
                    //////////// Not a recurring journal/////////////
                    PayrollJnlLine2.COPYFILTERS(PayrollJnlLine);
                    PayrollJnlLine2.SETFILTER("Account No.", '<>%1', '');
                    //DIM1.0 Start
                    //Code Commented
                    /*
                    IF PayrollJnlLine2.FIND('+') THEN; // Remember the last line
                      JnlLineDim.SETRANGE("Table ID",DATABASE::"Payroll Journal Line");
                    JnlLineDim.COPYFILTER("Journal Template Name",PayrollJnlLine."Pay Journal Template");
                    JnlLineDim.COPYFILTER("Journal Batch Name",PayrollJnlLine."Pay Journal Batch");
                    JnlLineDim.SETRANGE("Allocation Line No.",0);
                    */
                    //DIM1.0 End
                    PayrollJnlLine3.COPY(PayrollJnlLine);
                    IF PayrollJnlLine3.FIND('-') THEN
                        REPEAT
                            //DIM1.0 Start
                            //Code Commented
                            /*
                            JnlLineDim.SETRANGE("Journal Line No.",PayrollJnlLine3."Line No.");
                            JnlLineDim.DELETEALL;
                            */
                            //DIm1.0 End
                            PayrollJnlLine3.DELETE;
                        UNTIL PayrollJnlLine3.NEXT = 0;

                    PayrollJnlLine3.RESET;
                    PayrollJnlLine3.SETRANGE("Pay Journal Template", "Pay Journal Template");
                    PayrollJnlLine3.SETRANGE("Pay Journal Batch", "Pay Journal Batch");
                    IF NOT PayrollJnlLine3.FIND('+') THEN
                        IF INCSTR("Pay Journal Batch") <> '' THEN BEGIN
                            PayGenJnlBatch.DELETE;
                            PayGenJnlBatch.Name := INCSTR("Pay Journal Batch");
                            IF PayGenJnlBatch.INSERT THEN;
                            "Pay Journal Batch" := PayGenJnlBatch.Name;
                        END;

                    PayrollJnlLine3.SETRANGE("Pay Journal Batch", "Pay Journal Batch");
                    IF (PayGenJnlBatch."No. Series" = '') AND NOT PayrollJnlLine3.FIND('+') THEN BEGIN
                        PayrollJnlLine3.INIT;
                        PayrollJnlLine3."Pay Journal Template" := "Pay Journal Template";
                        PayrollJnlLine3."Pay Journal Batch" := "Pay Journal Batch";
                        PayrollJnlLine3."Line No." := 10000;
                        PayrollJnlLine3.INSERT;
                        PayrollJnlLine3.SetUpNewLine(PayrollJnlLine2, 0, TRUE);
                        PayrollJnlLine3.MODIFY;
                    END;
                END;
            END;

            IF PayGenJnlBatch."No. Series" <> '' THEN
                NoSeriesMgt.SaveNoSeries;

            IF NoSeries.FIND('-') THEN
                REPEAT
                    EVALUATE(PostingNoSeriesNo, NoSeries.Description);
                    NoSeriesMgt2[PostingNoSeriesNo].SaveNoSeries;
                UNTIL NoSeries.NEXT = 0;

            COMMIT;
            CLEAR(PayJnlCheckLine);
            CLEAR(PayJnlPostLine);
        END;

        //UpdateAnalysisView.UpdateAll(0,TRUE);
        COMMIT;

    end;

    [LineStart(45796)]
    local procedure CheckBalance();
    begin
        WITH PayrollJnlLine DO BEGIN
            IF CurrentBalance <> 0 THEN BEGIN
                GET("Pay Journal Template", "Pay Journal Batch", StartLineNo);
                /*
                IF PayJnlTemplate."Force Doc. Balance" THEN
                  ERROR(Text012 + Text013,CurrentBalance,LastDocNo,
                        FIELDCAPTION("Posting Date"),FIELDCAPTION("Document No."),FIELDCAPTION(Amount));
                */
                ERROR(Text014 + Text015, LastDate, CurrentBalance, FIELDCAPTION("Posting Date"), FIELDCAPTION(Amount));
            END;

            IF CurrentBalanceReverse <> 0 THEN BEGIN
                GET("Pay Journal Template", "Pay Journal Batch", StartLineNoReverse);
                /*
                IF PayJnlTemplate."Force Doc. Balance" THEN
                  ERROR(Text016 + Text017,CurrentBalanceReverse,LastDocNo,
                        FIELDCAPTION("Recurring Method"),FIELDCAPTION("Document No."));
                ERROR(Text018 +Text017,LastDate,CurrentBalanceReverse,FIELDCAPTION("Recurring Method"),FIELDCAPTION("Posting Date"));
                */
            END;

            IF (LastCurrencyCode <> '') AND (CurrencyBalance <> 0) THEN BEGIN
                GET("Pay Journal Template", "Pay Journal Batch", StartLineNo);
                /*
                IF PayJnlTemplate."Force Doc. Balance" THEN
                  ERROR(Text026 + Text013,CurrencyBalance,LastDocNo,
                        FIELDCAPTION("Posting Date"),FIELDCAPTION("Document No."),FIELDCAPTION(Amount),LastCurrencyCode);
                */
                ERROR(Text027 + Text015, LastDate, CurrencyBalance, FIELDCAPTION("Posting Date"), FIELDCAPTION(Amount), LastCurrencyCode);
            END;
        END;

    end;

    [LineStart(45833)]
    procedure CheckAddExchRateBalance();
    begin
        /*
        WITH PayrollJnlLine DO
          IF CurrentBalance <> 0 THEN
            ERROR(Text019 +Text020,LastDocNo,FIELDCAPTION("FA Add.-Currency Factor"),FIELDCAPTION("Document No."));
        */

    end;

    [LineStart(45840)]
    local procedure CheckRecurringLine(var RecPayJournalLine2: Record "Payroll Journal Line");
    begin
        WITH RecPayJournalLine2 DO BEGIN
            IF "Account No." <> '' THEN
                IF PayJnlTemplate.Recurring THEN BEGIN
                    //TESTFIELD("Recurring Method");
                    //TESTFIELD("Recurring Frequency");
                    IF "Bal. Account No." <> '' THEN
                        FIELDERROR("Bal. Account No.", Text021);
                    /*
                    CASE "Recurring Method" OF
                      "Recurring Method"::"V  Variable","Recurring Method"::"RV Reversing Variable",
                      "Recurring Method"::"F  Fixed","Recurring Method"::"RF Reversing Fixed":
                        TESTFIELD(Amount);
                      "Recurring Method"::"B  Balance","Recurring Method"::"RB Reversing Balance":
                        TESTFIELD(Amount,0);
                    END;
                    */
                END
                ELSE BEGIN
                    //TESTFIELD("Recurring Method",0);
                    //TESTFIELD("Recurring Frequency","0DF");
                END;
        END;

    end;

    [LineStart(45867)]
    local procedure UpdateRecurringAmt(var RecPayJournalLine2: Record "Payroll Journal Line");
    begin
        WITH RecPayJournalLine2 DO BEGIN
            /*
            IF ("Account No." <> '') AND
              ("Recurring Method" IN ["Recurring Method"::"B  Balance","Recurring Method"::"RB Reversing Balance"])
            THEN
              BEGIN
                GLEntry.LOCKTABLE;
                IF NOT RECORDLEVELLOCKING THEN
                  BEGIN
                    GenJnlAlloc.LOCKTABLE(TRUE,TRUE);
                    LOCKTABLE(TRUE,TRUE);
                  END;
        
                IF "Account Type" = "Account Type"::"G/L Account" THEN
                  BEGIN
                    GLAcc."No." := "Account No.";
                    GLAcc.SETRANGE("Date Filter",0D,"Posting Date");
        
                    IF GLSetup."Additional Reporting Currency" <> '' THEN
                      BEGIN
                        "Source Currency Code" := GLSetup."Additional Reporting Currency";
                        GLAcc.CALCFIELDS(GLAcc."Additional-Currency Net Change");
                        "Source Currency Amount" := -GLAcc."Additional-Currency Net Change";
                        GenJnlAlloc.UpdateAllocationsAddCurr(PayrollJnlLine2,"Source Currency Amount");
                      END;
        
                    GLAcc.CALCFIELDS("Net Change");
                    VALIDATE(Amount,-GLAcc."Net Change");
                  END
                ELSE
                  ERROR(Text022);
              END;
            */
        END;

    end;

    [LineStart(45904)]
    local procedure CheckAllocations(var RecPayJournalLine2: Record "Payroll Journal Line");
    begin
        /*C
        WITH RecPayJournalLine2 DO
          BEGIN
            IF "Account No." <> '' THEN
              BEGIN
                IF "Recurring Method" IN  ["Recurring Method"::"B  Balance", "Recurring Method"::"RB Reversing Balance"] THEN
                  BEGIN
                    GenJnlAlloc.RESET;
                    GenJnlAlloc.SETRANGE("Journal Template Name","Pay Journal Template");
                    GenJnlAlloc.SETRANGE("Journal Batch Name","Pay Journal Batch");
                    GenJnlAlloc.SETRANGE("Journal Line No.","Line No.");
                    IF NOT GenJnlAlloc.FIND('-') THEN
                      ERROR(Text028);
                  END;
                GenJnlAlloc.RESET;
                GenJnlAlloc.SETRANGE("Journal Template Name","Pay Journal Template");
                GenJnlAlloc.SETRANGE("Journal Batch Name","Pay Journal Batch");
                GenJnlAlloc.SETRANGE("Journal Line No.","Line No.");
                GenJnlAlloc.SETFILTER(Amount,'<>0');
                IF GenJnlAlloc.FIND('-') THEN
                  BEGIN
                    IF NOT PayJnlTemplate.Recurring THEN
                      ERROR(Text023);
                    GenJnlAlloc.SETRANGE("Account No.",'');
                    IF GenJnlAlloc.FIND('-') THEN
                      GenJnlAlloc.TESTFIELD("Account No.");
                  END;
              END;
          END;
        */

    end;

    [LineStart(45936)]
    local procedure MakeRecurringTexts(var RecPayJournalLine2: Record "Payroll Journal Line");
    begin
        /*C
        WITH RecPayJournalLine2 DO
          BEGIN
            IF ("Account No." <> '') AND ("Recurring Method" <> 0) THEN
              BEGIN
                Day := DATE2DMY("Posting Date",1);
                Week := DATE2DWY("Posting Date",2);
                Month := DATE2DMY("Posting Date",2);
                MonthText := FORMAT("Posting Date",0,Text024);
                AccountingPeriod.SETRANGE("Starting Date",0D,"Posting Date");
                IF NOT AccountingPeriod.FIND('+') THEN
                  AccountingPeriod.Name := '';
        
                "Document No." :=DELCHR(PADSTR(STRSUBSTNO("Document No.",Day,Week,Month,MonthText,AccountingPeriod.Name),
                                               MAXSTRLEN("Document No.")), '>');
                Description :=DELCHR(PADSTR(STRSUBSTNO(Description,Day,Week,Month,MonthText,AccountingPeriod.Name),
                                            MAXSTRLEN(Description)),'>');
              END;
          END;
        */

    end;

    [LineStart(45958)]
    local procedure PostAllocations(var AllocatePayJournalLine: Record "Payroll Journal Line"; Reversing: Boolean);
    begin
        WITH AllocatePayJournalLine DO BEGIN
            IF "Account No." <> '' THEN BEGIN
                GenJnlAlloc.RESET;
                GenJnlAlloc.SETRANGE("Journal Template Name", "Pay Journal Template");
                GenJnlAlloc.SETRANGE("Journal Batch Name", "Pay Journal Batch");
                GenJnlAlloc.SETRANGE("Journal Line No.", "Line No.");
                GenJnlAlloc.SETFILTER("Account No.", '<>%1', '');

                IF GenJnlAlloc.FIND('-') THEN BEGIN
                    PayrollJnlLine2.INIT;
                    PayrollJnlLine2."Pay Journal Template" := "Pay Journal Template";
                    PayrollJnlLine2."Pay Journal Batch" := "Pay Journal Batch";

                    PayrollJnlLine2."Account Type" := PayrollJnlLine2."Account Type"::"G/L Account";

                    PayrollJnlLine2."Document Type" := "Document Type";
                    PayrollJnlLine2."Document No." := "Document No.";
                    PayrollJnlLine2."Posting Date" := "Posting Date";
                    PayrollJnlLine2."Posting Month" := DATE2DMY("Posting Date", 2);
                    PayrollJnlLine2."Posting Year" := DATE2DMY("Posting Date", 3);

                    PayrollJnlLine2.Description := Description;
                    PayrollJnlLine2."Source Code" := "Source Code";

                    PayrollJnlLine2."Line No." := "Line No.";
                    PayrollJnlLine2."Reason Code" := "Reason Code";
                    //PayrollJnlLine2."Recurring Method" := AllocateGenJnlLine."Recurring Method";

                    REPEAT
                        PayrollJnlLine2."Account No." := GenJnlAlloc."Account No.";
                        PayrollJnlLine2.Amount := GenJnlAlloc.Amount;
                        PayrollJnlLine2."Amount (LCY)" := GenJnlAlloc.Amount;

                        PayrollJnlLine2."Global Dimension 1 Code" := GenJnlAlloc."Shortcut Dimension 1 Code";
                        PayrollJnlLine2."Global Dimension 2 Code" := GenJnlAlloc."Shortcut Dimension 2 Code";
                        PayrollJnlLine2."Pay Posting Type" := GenJnlAlloc."Gen. Posting Type";
                        PayrollJnlLine2."Pay Bus. Posting Group" := GenJnlAlloc."Gen. Bus. Posting Group";
                        PayrollJnlLine2."Pay Prod. Posting Group" := GenJnlAlloc."Gen. Prod. Posting Group";
                        //PayrollJnlLine2."Source Currency Amount" := GenJnlAlloc."Additional-Currency Amount";
                        PayrollJnlLine2."Allow Zero-Amount Posting" := TRUE;

                        PreparePayrollJnlLineAddCurr(PayrollJnlLine2);



                        //DIM1.0 Start
                        //Code Commented
                        /*
                        JnlLineDim.SETRANGE("Table ID",DATABASE::"Gen. Jnl. Allocation");
                        JnlLineDim.SETRANGE("Journal Template Name",GenJnlAlloc."Journal Template Name");
                        JnlLineDim.SETRANGE("Journal Batch Name",GenJnlAlloc."Journal Batch Name");
                        JnlLineDim.SETRANGE("Journal Line No.",GenJnlAlloc."Journal Line No.");
                        JnlLineDim.SETRANGE("Allocation Line No.",GenJnlAlloc."Line No.");
                        TempJnlLineDim.DELETEALL;
                        DimMgt.CopyJnlLineDimToJnlLineDim(JnlLineDim,TempJnlLineDim);
                        */
                        PayrollJnlLine2."Dimension Set ID" := GenJnlAlloc."Dimension Set ID";
                        //DIM1.0 End

                        IF NOT Reversing THEN BEGIN
                            //DIm1.0 Start
                            //Code Commented
                            //PayJnlPostLine.RunWithCheck(PayrollJnlLine2,TempJnlLineDim);
                            PayJnlPostLine.RunWithCheck(PayrollJnlLine2);
                            //DIm1.0 End

                            /*
                            IF "Recurring Method" IN ["Recurring Method"::"V  Variable","Recurring Method"::"B  Balance"] THEN
                              BEGIN
                                GenJnlAlloc.Amount := 0;
                                GenJnlAlloc."Additional-Currency Amount" := 0;
                                GenJnlAlloc.MODIFY;
                              END;
                            */
                        END
                        ELSE BEGIN
                            MultiplyAmounts(PayrollJnlLine2, -1);
                            //PayrollJnlLine2."Reversing Entry" := TRUE;
                            //DIM1.0 Start
                            //Code Commented
                            //PayJnlPostLine.RunWithCheck(PayrollJnlLine2,TempJnlLineDim);
                            PayJnlPostLine.RunWithCheck(PayrollJnlLine2);
                            //DIM1.0 End

                            /*
                            IF "Recurring Method" IN ["Recurring Method"::"RV Reversing Variable",
                                                      "Recurring Method"::"RB Reversing Balance"]
                            THEN
                              BEGIN
                                GenJnlAlloc.Amount := 0;
                                GenJnlAlloc."Additional-Currency Amount" := 0;
                                GenJnlAlloc.MODIFY;
                              END;
                            */
                        END;
                    UNTIL GenJnlAlloc.NEXT = 0;
                END;
            END;
        END;

    end;

    [LineStart(46064)]
    local procedure MultiplyAmounts(var RecPayJournalLine2: Record "Payroll Journal Line"; Factor: Decimal);
    begin
        WITH RecPayJournalLine2 DO BEGIN
            IF "Account No." <> '' THEN BEGIN
                Amount := Amount * Factor;
                "Debit Amount" := "Debit Amount" * Factor;
                "Credit Amount" := "Credit Amount" * Factor;
                "Amount (LCY)" := "Amount (LCY)" * Factor;
                "Balance (LCY)" := "Balance (LCY)" * Factor;
                //"Source Currency Amount" := "Source Currency Amount" * Factor;
            END;
        END;
    end;

    [LineStart(46078)]
    procedure CheckDocumentNo(var RecPayJournalLine2: Record "Payroll Journal Line");
    begin
        WITH RecPayJournalLine2 DO BEGIN
            //IF "Posting No. Series" = '' THEN
            //  "Posting No. Series" := PayGenJnlBatch."No. Series"
            //ELSE
            IF NOT EmptyLine THEN
                IF "Document No." = LastDocNo THEN
                    "Document No." := LastPostedDocNo
                ELSE BEGIN
                    ///IF NOT NoSeries.GET("Posting No. Series") THEN
                    IF NOT NoSeries.GET(PayGenJnlBatch."No. Series") THEN BEGIN
                        NoOfPostingNoSeries := NoOfPostingNoSeries + 1;
                        IF NoOfPostingNoSeries > ARRAYLEN(NoSeriesMgt2) THEN
                            ERROR(Text025, ARRAYLEN(NoSeriesMgt2));

                        ///NoSeries.Code := "Posting No. Series";
                        NoSeries.Code := PayGenJnlBatch."No. Series";
                        NoSeries.Description := FORMAT(NoOfPostingNoSeries);
                        NoSeries.INSERT;
                    END;
                    LastDocNo := "Document No.";
                    EVALUATE(PostingNoSeriesNo, NoSeries.Description);
                    ///"Document No." := NoSeriesMgt2[PostingNoSeriesNo].GetNextNo("Posting No. Series","Posting Date",TRUE);
                    "Document No." := NoSeriesMgt2[PostingNoSeriesNo].GetNextNo(PayGenJnlBatch."No. Series", "Posting Date", TRUE);
                    LastPostedDocNo := "Document No.";
                END;
        END;
    end;

    [LineStart(46109)]
    procedure PreparePayrollJnlLineAddCurr(var PayrollJnlLine: Record "Payroll Journal Line");
    begin
        /*C
        IF (GLSetup."Additional Reporting Currency" <> '') AND
           (PayrollJnlLine."Recurring Method" IN [PayrollJnlLine."Recurring Method"::"B  Balance",
                                                  PayrollJnlLine."Recurring Method"::"RB Reversing Balance"])
        THEN
          BEGIN
            PayrollJnlLine."Source Currency Code" := GLSetup."Additional Reporting Currency";
            IF (PayrollJnlLine.Amount = 0) AND (PayrollJnlLine."Source Currency Amount" <> 0) THEN
              BEGIN
                PayrollJnlLine."Additional-Currency Posting" :=
                  PayrollJnlLine."Additional-Currency Posting"::"Additional-Currency Amount Only";
                PayrollJnlLine.Amount := PayrollJnlLine."Source Currency Amount";
                PayrollJnlLine."Source Currency Amount" := 0;
              END;
          END;
        */

    end;

    [LineStart(46127)]
    procedure CopyFields();
    var
        PayrollJnlLine4: Record "Payroll Journal Line";
        PayrollJnlLine6: Record "Payroll Journal Line";
        CheckAmount: Decimal;
    begin
        PayrollJnlLine6.SETCURRENTKEY("Pay Journal Template", "Pay Journal Batch", "Posting Date", "Document No.");
        PayrollJnlLine6.SETRANGE("Pay Journal Template", PayrollJnlLine."Pay Journal Template");
        PayrollJnlLine6.SETRANGE("Pay Journal Batch", PayrollJnlLine."Pay Journal Batch");
        PayrollJnlLine4.SETRANGE("Pay Journal Template", PayrollJnlLine."Pay Journal Template");
        PayrollJnlLine4.SETRANGE("Pay Journal Batch", PayrollJnlLine."Pay Journal Batch");

        PayrollJnlLine4.SETFILTER("Account Type", '%1', PayrollJnlLine4."Account Type"::Employee);
        PayrollJnlLine4.SETRANGE("Bal. Account No.", '');
        IF PayrollJnlLine4.FIND('-') THEN
            REPEAT
                PayrollJnlLine6.SETRANGE("Posting Date", PayrollJnlLine4."Posting Date");
                PayrollJnlLine6.SETRANGE("Document No.", PayrollJnlLine4."Document No.");
                CheckAmount := 0;
                IF PayrollJnlLine6.FIND('-') THEN
                    REPEAT
                        IF (PayrollJnlLine6."Account No." = '') <> (PayrollJnlLine6."Bal. Account No." = '') THEN BEGIN
                            /*
                            IF (PayrollJnlLine4."Account Type" = PayrollJnlLine4."Account Type"::Employee) AND
                               (PayrollJnlLine6."Pay Posting Type" = PayrollJnlLine6."Pay Posting Type"::Sale)
                            THEN
                              PayrollJnlLine6.FIELDERROR("Pay Posting Type");

                            IF (PayrollJnlLine4."Account Type" = PayrollJnlLine4."Account Type"::Employee) AND
                               (PayrollJnlLine6."Bal. Pay Posting Type" = PayrollJnlLine6."Bal. Pay Posting Type"::Sale)
                            THEN
                              PayrollJnlLine6.FIELDERROR("Bal. Pay Posting Type");
                            */
                        END;
                        PayrollJnlLine6.MODIFY;
                        CheckAmount := CheckAmount + PayrollJnlLine6.Amount;
                    UNTIL (PayrollJnlLine6.NEXT = 0) OR (-PayrollJnlLine4.Amount = CheckAmount);
            UNTIL PayrollJnlLine4.NEXT = 0;

        PayrollJnlLine4.SETRANGE("Account Type");
        PayrollJnlLine4.SETRANGE("Bal. Account No.");
        PayrollJnlLine4.SETFILTER("Bal. Account Type", '%1', PayrollJnlLine4."Bal. Account Type"::Employee);
        PayrollJnlLine4.SETRANGE("Account No.", '');
        IF PayrollJnlLine4.FIND('-') THEN
            REPEAT
                PayrollJnlLine6.SETRANGE("Posting Date", PayrollJnlLine4."Posting Date");
                PayrollJnlLine6.SETRANGE("Document No.", PayrollJnlLine4."Document No.");
                CheckAmount := 0;
                IF PayrollJnlLine6.FIND('-') THEN
                    REPEAT
                        IF (PayrollJnlLine6."Account No." = '') <> (PayrollJnlLine6."Bal. Account No." = '') THEN BEGIN
                            /*
                            IF (PayrollJnlLine4."Bal. Account Type" = PayrollJnlLine4."Bal. Account Type"::Employee) AND
                               (PayrollJnlLine6."Bal. Pay Posting Type" = PayrollJnlLine6."Bal. Pay Posting Type"::Sale)
                            THEN
                              PayrollJnlLine6.FIELDERROR("Bal. Pay Posting Type");

                            IF (PayrollJnlLine4."Bal. Account Type" = PayrollJnlLine4."Bal. Account Type"::Employee) AND
                               (PayrollJnlLine6."Pay Posting Type" = PayrollJnlLine6."Pay Posting Type"::Sale)
                            THEN
                              PayrollJnlLine6.FIELDERROR("Pay Posting Type");
                            */
                        END;
                        PayrollJnlLine6.MODIFY;
                        CheckAmount := CheckAmount + PayrollJnlLine6.Amount;
                    UNTIL (PayrollJnlLine6.NEXT = 0) OR (-PayrollJnlLine4.Amount = CheckAmount);
            UNTIL PayrollJnlLine4.NEXT = 0;

    end;
}

