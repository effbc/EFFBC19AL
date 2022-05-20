codeunit 33000012 "Payroll Jnl.-Post Line"
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

    Permissions = TableData "G/L Entry"=imd,
                  TableData "G/L Register"=imd,
                  TableData "Bank Account Ledger Entry"=imd,
                  TableData "Check Ledger Entry"=imd,
                  TableData "FA Register"=imd,
                  TableData "Employee Ledger Entry"=imd,
                  TableData "Detailed Employee Ledg. Entry"=imd;
    TableNo = "Payroll Journal Line";

    trigger OnRun();
    begin
        GLSetup.GET;
        //DIM1.0 Start
        //Code Commented
        /*
        TempJnlLineDim2.RESET;
        TempJnlLineDim2.DELETEALL;
        IF "Global Dimension 1 Code" <> '' THEN BEGIN
          TempJnlLineDim2."Table ID" := DATABASE::"Payroll Journal Line";
          TempJnlLineDim2."Journal Template Name" := "Pay Journal Template";
          TempJnlLineDim2."Journal Batch Name" := "Pay Journal Batch";
          TempJnlLineDim2."Journal Line No." := "Line No.";
          TempJnlLineDim2."Dimension Code" := GLSetup."Global Dimension 1 Code";
          TempJnlLineDim2."Dimension Value Code" := "Global Dimension 1 Code";
          TempJnlLineDim2.INSERT;
        END;
        IF "Global Dimension 2 Code" <> '' THEN BEGIN
          TempJnlLineDim2."Table ID" := DATABASE::"Payroll Journal Line";
          TempJnlLineDim2."Journal Template Name" := "Pay Journal Template";
          TempJnlLineDim2."Journal Batch Name" := "Pay Journal Batch";
          TempJnlLineDim2."Journal Line No." := "Line No.";
          TempJnlLineDim2."Dimension Code" := GLSetup."Global Dimension 2 Code";
          TempJnlLineDim2."Dimension Value Code" := "Global Dimension 2 Code";
          TempJnlLineDim2.INSERT;
        END;
        RunWithCheck(Rec,TempJnlLineDim2);
        */
        RunWithCheck(Rec);
        //DIM1.0 End

    end;

    var
        GLSetup : Record "General Ledger Setup";
        AccountingPeriod : Record "Accounting Period";
        GLAcc : Record "G/L Account";
        GLEntry : Record "G/L Entry";
        GLEntryTmp : Record "G/L Entry" temporary;
        OrigGLEntry : Record "G/L Entry";
        Employee : Record Employee;
        PayrollJournalLine : Record "Payroll Journal Line";
        EmpLedgerEntry : Record "Employee Ledger Entry";
        GLReg : Record "G/L Register";
        EmpPostingGroup : Record "Employee Posting Group";
        Currency : Record Currency;
        AddCurrency : Record Currency;
        ApplnCurrency : Record Currency;
        CurrExchRate : Record "Currency Exchange Rate";
        BankAcc : Record "Bank Account";
        BankAccLedgEntry : Record "Bank Account Ledger Entry";
        CheckLedgEntry : Record "Check Ledger Entry";
        CheckLedgEntry2 : Record "Check Ledger Entry";
        BankAccPostingGr : Record "Bank Account Posting Group";
        PayJournalTemplate : Record "Pay Journal Template";
        FAGLPostBuf : Record "FA G/L Posting Buffer" temporary;
        PayrollJnlCheckLine : Codeunit "Payroll Jnl.-Check Line";
        ExchAccPayJournalLine : Codeunit "Exchange Acc. Pay Journal Line";
        PayrollJnlApply : Codeunit "Payroll Jnl.-Apply";
        DimMgt : Codeunit DimensionManagement;
        FiscalYearStartDate : Date;
        NextEntryNo : Integer;
        BalanceCheckAmount : Decimal;
        BalanceCheckAmount2 : Decimal;
        BalanceCheckAddCurrAmount : Decimal;
        BalanceCheckAddCurrAmount2 : Decimal;
        CurrentBalance : Decimal;
        SalesTaxBaseAmount : Decimal;
        TotalAddCurrAmount : Decimal;
        TotalAmount : Decimal;
        NextTransactionNo : Integer;
        NextConnectionNo : Integer;
        LastDocNo : Code[20];
        LastLineNo : Integer;
        LastDate : Date;
        LastDocType : Option " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder;
        NextCheckEntryNo : Integer;
        CurrencyDate : Date;
        CurrencyFactor : Decimal;
        UseCurrFactorOnly : Boolean;
        NonAddCurrCodeOccured : Boolean;
        FADimAlreadyChecked : Boolean;
        InitEntryNoInStore : Record "Multiple Subcon. Order Details";
        Text000 : Label '%1 needs to be rounded';
        Text001 : Label 'Sales %1 %2 already exists.';
        Text002 : Label 'Purchase %1 %2 already exists.';
        Text003 : Label 'Purchase %1 %2 already exists for this vendor.';
        Text004 : Label 'must not be filled when %1 is different in %2 and %3.';
        Text005 : Label '" must be entered when %1 is %2"';
        Text006 : Label 'Check %1 already exists for this Bank Account.';
        Text007 : Label 'Sales %1 %2 already exists for this Customer.';
        Text010 : Label 'Residual caused by rounding of %1';
        Text013 : Label 'A dimension used in %1 %2, %3, %4 has caused an error. %5';
        GLEntry2 : Record "G/L Entry";
        OriginalAmount : Decimal;
        OriginalAddCurrAmount : Decimal;
        DimMgrAccountType : Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset",Employee," ";
        DimMgrBalAccountType : Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset",Employee," ";

    [LineStart(43164)]
    procedure GetGLReg(var NewGLReg : Record "G/L Register");
    begin
        NewGLReg := GLReg;
    end;

    [LineStart(43167)]
    procedure RunWithCheck(var PayrollJournalLine2 : Record "Payroll Journal Line");
    begin
        PayrollJournalLine.COPY(PayrollJournalLine2);
        //DIM1.0 Start Since function doesn't exist in Nav 2013
        //Code Commented
        /*
        TempJnlLineDim.RESET;
        TempJnlLineDim.DELETEALL;
        DimMgt.CopyJnlLineDimToJnlLineDim(TempJnlLineDim2,TempJnlLineDim);
        */
        //DIM1.0 End
        Code(TRUE);
        PayrollJournalLine2 := PayrollJournalLine;

    end;

    [LineStart(43180)]
    procedure RunWithoutCheck(var PayrollJournalLine2 : Record "Payroll Journal Line");
    begin
        PayrollJournalLine.COPY(PayrollJournalLine2);
        //DIM1.0 Start Since function doesn't exist in Nav 2013
        //Code Commneted
        /*
        TempJnlLineDim.RESET;
        TempJnlLineDim.DELETEALL;
        DimMgt.CopyJnlLineDimToJnlLineDim(TempJnlLineDim2,TempJnlLineDim);
        */
        //DIM1.0 End
        Code(FALSE);
        PayrollJournalLine2 := PayrollJournalLine;

    end;

    [LineStart(43193)]
    local procedure "Code"(CheckLine : Boolean);
    begin
        WITH PayrollJournalLine DO
        BEGIN
          IF EmptyLine THEN
            BEGIN
              LastDocType := "Document Type";
              LastDocNo := "Document No.";
              LastLineNo := "Line No.";
              LastDate := "Posting Date";
              EXIT;
            END;
          //DIM1.0 Start
          //Code Commented
          /*
          IF CheckLine THEN
            PayrollJnlCheckLine.RunCheck(PayrollJournalLine,TempJnlLineDim);
          */
          IF CheckLine THEN
            PayrollJnlCheckLine.RunCheck(PayrollJournalLine);
          //DIM1.0 End
        
          /*
          IF "Currency Code" = '' THEN
            BEGIN
              Currency.InitRoundingPrecision;
              "Amount (LCY)" := Amount;
            END
          ELSE
            BEGIN
              Currency.GET("Currency Code");
              Currency.TESTFIELD("Amount Rounding Precision");
              IF NOT "System-Created Entry" THEN
                BEGIN
                  "Source Currency Code" := "Currency Code";
                  "Source Currency Amount" := Amount;
                END;
            END;
          IF "Additional-Currency Posting" = "Additional-Currency Posting"::None THEN
            BEGIN
              IF Amount <> ROUND(Amount,Currency."Amount Rounding Precision") THEN
                FIELDERROR(Amount,STRSUBSTNO(Text000,Amount));
              IF "Amount (LCY)" <> ROUND("Amount (LCY)") THEN
                FIELDERROR("Amount (LCY)",
                            STRSUBSTNO(Text000,"Amount (LCY)"));
            END;
          */
        
          IF "Document Date" = 0D THEN
            "Document Date" := "Posting Date";
          IF "Due Date" = 0D THEN
            "Due Date" := "Posting Date";
        
          InitCodeUnit;
        
          IF ("Account No." <> '') AND ("Bal. Account No." <> '') AND (NOT "System-Created Entry") AND
             ("Account Type" IN  ["Account Type"::Employee])
          THEN
            ExchAccPayJournalLine.RUN(PayrollJournalLine);
        
          IF "Account No." <> '' THEN
            CASE "Account Type" OF
              "Account Type"::"G/L Account":
                  PostGLAcc;
              "Account Type"::Employee:
                  PostEmployee;
              "Account Type"::"Bank Account":
                  PostBankAcc;
            END;
        
          IF "Bal. Account No." <> '' THEN
            BEGIN
              ExchAccPayJournalLine.RUN(PayrollJournalLine);
              IF "Account No." <> '' THEN
                CASE "Account Type" OF
                  "Account Type"::"G/L Account":
                      PostGLAcc;
                  "Account Type"::Employee:
                      PostEmployee;
                  "Account Type"::"Bank Account":
                      PostBankAcc;
                END;
            END;
        
          FinishCodeunit;
        END;

    end;

    [LineStart(43279)]
    local procedure PostGLAcc();
    begin
        WITH PayrollJournalLine DO
        BEGIN
          //InitGLEntry("Account No.","Amount (LCY)","Source Currency Amount",TRUE,"System-Created Entry");
          InitGLEntry("Account No.","Amount (LCY)",0,TRUE,"System-Created Entry");
          IF NOT "System-Created Entry" THEN
            IF "Posting Date" = NORMALDATE("Posting Date") THEN
              GLAcc.TESTFIELD("Direct Posting",TRUE);
        
          GLEntry."Gen. Posting Type" := GLEntry."Gen. Posting Type"::"4";
          GLEntry."Bal. Account Type" := "Bal. Account Type";
          GLEntry."Bal. Account No." := "Bal. Account No.";
          //GLEntry."No. Series" := "Posting No. Series";
          /*
          IF "Additional-Currency Posting" = "Additional-Currency Posting"::"Additional-Currency Amount Only" THEN
            BEGIN
              GLEntry."Additional-Currency Amount" := Amount;
              GLEntry.Amount := 0;
            END;
          */
        
          InsertGLEntry(TRUE);
          GLSetup.GET;
        END;

    end;

    [LineStart(43304)]
    local procedure PostEmployee();
    var
        EmpLedgerEntryLocal : Record "Employee Ledger Entry";
        OldEmpLedgerEntryLocal : Record "Employee Ledger Entry";
        DtldEmpLedgEntryLocal : Record "Detailed Employee Ledg. Entry";
        EmpLedgerEntryBufferLocal : Record "Emp Ledger Entry Buffer";
        DtldEmpLedgEntryBufferLocal : Record "Dtld Emp Ledg. Entry Buffer";
        EmpLedgerEntryLocal2 : Record "Employee Ledger Entry";
    begin
        WITH PayrollJournalLine DO
          BEGIN
            IF Employee."No." <> "Account No." THEN
              Employee.GET("Account No.");
            //Employee.CheckBlockedEmpOnJnls(Employee,"Document Type",TRUE);
        
            IF "Posting Group" = '' THEN
              BEGIN
                Employee.TESTFIELD("Employee Posting Group");
                "Posting Group" := Employee."Employee Posting Group";
              END;
        
            EmpPostingGroup.GET("Posting Group");
            EmpPostingGroup.TESTFIELD("Salary Payable Acct");
            EmpPostingGroup.TESTFIELD("Part Of Salary Payable Acct");
            EmpPostingGroup.TESTFIELD("Reimbursement Salary Acct");
        
            DtldEmpLedgEntryLocal.LOCKTABLE;
            EmpLedgerEntryLocal.LOCKTABLE;
        
            EmpLedgerEntryLocal.INIT;
        
            EmpLedgerEntryLocal."Pay Journal Template" :="Pay Journal Template";
            EmpLedgerEntryLocal."Pay Journal Batch" := "Pay Journal Batch";
        
            EmpLedgerEntryLocal."Employee No.":= "Account No.";
            EmpLedgerEntryLocal."Document Date" := "Document Date";
            EmpLedgerEntryLocal."Document Type" := "Document Type";
            EmpLedgerEntryLocal."Document No." := "Document No.";
        
            EmpLedgerEntryLocal."Posting Date" := "Posting Date";
            EmpLedgerEntryLocal."Posting Month" := "Posting Month" ;
            EmpLedgerEntryLocal."Posting Year"  := "Posting Year" ;
        
            EmpLedgerEntryLocal.Description := Description;
            EmpLedgerEntryLocal."Currency Code" := "Currency Code";
        
            EmpLedgerEntryLocal."Employee Posting Group" := "Posting Group";
            EmpLedgerEntryLocal."Global Dimension 1 Code" := "Global Dimension 1 Code";
            EmpLedgerEntryLocal."Global Dimension 2 Code" := "Global Dimension 2 Code";
            EmpLedgerEntryLocal."Source Code" := "Source Code";
            EmpLedgerEntryLocal."Reason Code" := "Reason Code";
        
            EmpLedgerEntryLocal."On Hold" := "On Hold";
            EmpLedgerEntryLocal."Applies-to Doc. Type" := "Applies-to Doc. Type";
            EmpLedgerEntryLocal."Applies-to Doc. No." := "Applies-to Doc. No.";
            EmpLedgerEntryLocal."Due Date" := "Due Date";
            EmpLedgerEntryLocal."Applies-to ID" := "Applies-to ID";
            EmpLedgerEntryLocal."Payment Indicator" :="Payment Indicator";
        
            EmpLedgerEntryLocal."Entry No." := NextEntryNo;
        
            EmpLedgerEntryLocal."Transaction No." := NextTransactionNo;
            EmpLedgerEntryLocal."User ID" := USERID;
            EmpLedgerEntryLocal."Bal. Account Type" := "Bal. Account Type";
            EmpLedgerEntryLocal."Bal. Account No." := "Bal. Account No.";
        
            DtldEmpLedgEntryBufferLocal.DELETEALL;
            DtldEmpLedgEntryBufferLocal.INIT;
        
            DtldEmpLedgEntryBufferLocal."Employee Ledger Entry No." := EmpLedgerEntryLocal."Entry No.";
            DtldEmpLedgEntryBufferLocal."Entry Type" := DtldEmpLedgEntryBufferLocal."Entry Type"::"Initial Entry";
            DtldEmpLedgEntryBufferLocal."Employee No." := "Account No.";
            DtldEmpLedgEntryBufferLocal."Document Type" := "Document Type";
            DtldEmpLedgEntryBufferLocal."Document No." := "Document No.";
        
            DtldEmpLedgEntryBufferLocal."Pay Journal Template" :="Pay Journal Template";
            DtldEmpLedgEntryBufferLocal."Pay Journal Batch":="Pay Journal Batch";
        
            DtldEmpLedgEntryBufferLocal."Posting Date" := "Posting Date";
            DtldEmpLedgEntryBufferLocal."Posting Month":="Posting Month";
            DtldEmpLedgEntryBufferLocal."Posting Year" :="Posting Year";
            DtldEmpLedgEntryBufferLocal."Include In PaySlip" :="Included In Pay Slip";
            DtldEmpLedgEntryBufferLocal."Payment Indicator" :="Payment Indicator";
        
            DtldEmpLedgEntryBufferLocal."Currency Code" := "Currency Code";
            DtldEmpLedgEntryBufferLocal.Amount := Amount;
            DtldEmpLedgEntryBufferLocal."Amount (LCY)" := "Amount (LCY)";
            //DtldEmpLedgEntryBufferLocal."Additional-Currency Amount" := Amount;
        
            DtldEmpLedgEntryBufferLocal."User ID" := USERID;
        
            DtldEmpLedgEntryBufferLocal."Employee Posting Group":="Posting Group";
            DtldEmpLedgEntryBufferLocal."Initial Entry Due Date" := "Due Date";
            DtldEmpLedgEntryBufferLocal."Initial Entry Global Dim. 1" :="Global Dimension 1 Code";
            DtldEmpLedgEntryBufferLocal."Initial Entry Global Dim. 2" :="Global Dimension 2 Code";
            DtldEmpLedgEntryBufferLocal."Initial Document Type" := "Document Type";
        
            //////////Transfer From Employee Ledger To Buf or Visversa////////////////////////
            TransferEmpLedgEntry(EmpLedgerEntryBufferLocal,EmpLedgerEntryLocal,TRUE);
            InsertDtldCELedgEntry(DtldEmpLedgEntryBufferLocal,EmpLedgerEntryBufferLocal);
            EmpLedgerEntryBufferLocal.Open := EmpLedgerEntryBufferLocal."Remaining Amount"<> 0;
            EmpLedgerEntryBufferLocal.Positive := EmpLedgerEntryBufferLocal."Remaining Amount" > 0;
        
            /*
            IF "Amount (LCY)" <> 0 THEN
              BEGIN
                IF GLSetup."Pmt. Disc. Excl. VAT" THEN
                  EmpLedgerEntryBufferLocal."Original Pmt. Disc. Possible" := "Sales/Purch. (LCY)" * Amount / "Amount (LCY)"
                ELSE
                  EmpLedgerEntryBufferLocal."Original Pmt. Disc. Possible" := Amount;
        
                EmpLedgerEntryBufferLocal."Original Pmt. Disc. Possible" := ROUND(
                                                  EmpLedgerEntryBufferLocal."Original Pmt. Disc. Possible" * "Payment Discount %" / 100,
                                                  Currency."Amount Rounding Precision");
                EmpLedgerEntryBufferLocal."Remaining Pmt. Disc. Possible" := EmpLedgerEntryBufferLocal."Original Pmt. Disc. Possible";
              END;
             */
        
            IF "Currency Code" <> '' THEN
              BEGIN
                TESTFIELD("Currency Factor");
                EmpLedgerEntryBufferLocal."Adjusted Currency Factor" := "Currency Factor"
              END
            ELSE
              EmpLedgerEntryBufferLocal."Adjusted Currency Factor" := 1;
        
            EmpLedgerEntryBufferLocal."Original Currency Factor" := EmpLedgerEntryBufferLocal."Adjusted Currency Factor";
            ApplyEmpLedgEntry(EmpLedgerEntryBufferLocal,DtldEmpLedgEntryBufferLocal,PayrollJournalLine,NextTransactionNo,
                              GLSetup."Appln. Rounding Precision");
        
            ///////////// Post Employee entry/////////////
            TransferEmpLedgEntry(EmpLedgerEntryBufferLocal,EmpLedgerEntryLocal,FALSE);
            EmpLedgerEntryLocal.INSERT;
            //B2b1.0 Startr Since Function doesn't exist in Nav 2013
            //Code Commented
            /*
            DimMgt.MoveJnlLineDimToLedgEntryDim(TempJnlLineDim,DATABASE::"Employee Ledger Entry",EmpLedgerEntryLocal."Entry No.");
            */
            //B2b1.0 End
            PostDtldEmpLedgEntries(PayrollJournalLine,DtldEmpLedgEntryBufferLocal,EmpPostingGroup,NextTransactionNo,TRUE);
          END;

    end;

    [LineStart(43438)]
    local procedure PostBankAcc();
    begin
        WITH PayrollJournalLine DO
          BEGIN
            BankAccLedgEntry.LOCKTABLE;
            IF BankAcc."No." <> "Account No." THEN
              BankAcc.GET("Account No.");
            BankAcc.TESTFIELD(Blocked,FALSE);
            IF "Currency Code" = '' THEN
              BankAcc.TESTFIELD("Currency Code",'')
            ELSE
              IF BankAcc."Currency Code" <> '' THEN
                TESTFIELD("Currency Code",BankAcc."Currency Code");
        
            BankAcc.TESTFIELD("Bank Acc. Posting Group");
            BankAccPostingGr.GET(BankAcc."Bank Acc. Posting Group");
        
            BankAccLedgEntry.INIT;
            BankAccLedgEntry."Bank Account No." := "Account No.";
            BankAccLedgEntry."Posting Date" := "Posting Date";
            BankAccLedgEntry."Document Date" := "Document Date";
            BankAccLedgEntry."Document Type" := "Document Type";
            BankAccLedgEntry."Document No." := "Document No.";
        
            BankAccLedgEntry.Description := Description;
            BankAccLedgEntry."Bank Acc. Posting Group" := BankAcc."Bank Acc. Posting Group";
            BankAccLedgEntry."Global Dimension 1 Code" := "Global Dimension 1 Code";
            BankAccLedgEntry."Global Dimension 2 Code" := "Global Dimension 2 Code";
        
            BankAccLedgEntry."Source Code" := "Source Code";
            BankAccLedgEntry."Journal Batch Name" := "Pay Journal Batch";
        
            BankAccLedgEntry."Reason Code" := "Reason Code";
            BankAccLedgEntry."Transaction No." := NextTransactionNo;
            BankAccLedgEntry."Entry No." := NextEntryNo;
        
            BankAccLedgEntry."Currency Code" := BankAcc."Currency Code";
        
            //BankAccLedgEntry."Cheque No." := "Cheque No.";
            //BankAccLedgEntry."Cheque Date" := "Cheque Date";
            //BankAccLedgEntry."Issuing Bank" := "Issuing Bank";
        
            IF BankAcc."Currency Code" <> '' THEN
              BankAccLedgEntry.Amount := Amount
            ELSE
              BankAccLedgEntry.Amount := "Amount (LCY)";
            BankAccLedgEntry."Amount (LCY)" := "Amount (LCY)";
        
            BankAccLedgEntry."User ID" := USERID;
            IF BankAccLedgEntry.Amount <> 0 THEN
              BEGIN
                BankAccLedgEntry.Open := TRUE;
                BankAccLedgEntry."Remaining Amount" := BankAccLedgEntry.Amount;
              END;
        
            BankAccLedgEntry.Positive := BankAccLedgEntry.Amount > 0;
            BankAccLedgEntry."Bal. Account Type" := "Bal. Account Type";
            BankAccLedgEntry."Bal. Account No." := "Bal. Account No.";
        
            IF (Amount > 0) AND (NOT Correction) OR ("Amount (LCY)" > 0) AND (NOT Correction) OR
               (Amount < 0) AND Correction OR  ("Amount (LCY)" < 0) AND Correction
            THEN
              BEGIN
                BankAccLedgEntry."Debit Amount" := BankAccLedgEntry.Amount;
                BankAccLedgEntry."Credit Amount" := 0;
                BankAccLedgEntry."Debit Amount (LCY)" := BankAccLedgEntry."Amount (LCY)";
                BankAccLedgEntry."Credit Amount (LCY)" := 0;
              END
            ELSE
              BEGIN
                BankAccLedgEntry."Debit Amount" := 0;
                BankAccLedgEntry."Credit Amount" := -BankAccLedgEntry.Amount;
                BankAccLedgEntry."Debit Amount (LCY)" := 0;
                BankAccLedgEntry."Credit Amount (LCY)" := -BankAccLedgEntry."Amount (LCY)";
              END;
        
            BankAccLedgEntry."Dimension Set ID" := PayrollJournalLine."Dimension Set ID"; //Dim1.0
        
            BankAccLedgEntry.INSERT;
            //B2b1.0 Start Since Function doesn't exist in Nav 2013
            //DimMgt.MoveJnlLineDimToLedgEntryDim(TempJnlLineDim,DATABASE::"Bank Account Ledger Entry",BankAccLedgEntry."Entry No.");
            //B2b1.0 End
            /*
            IF ((Amount <= 0) AND ("Bank Payment Type" = "Bank Payment Type"::"Computer Check") AND "Check Printed") OR
               ((Amount  < 0) AND ("Bank Payment Type" = "Bank Payment Type"::"Manual Check"))
            THEN
              BEGIN
                IF BankAcc."Currency Code" <> "Currency Code" THEN
                  FIELDERROR("Bank Payment Type", STRSUBSTNO(Text004,FIELDCAPTION("Currency Code"),TABLECAPTION,BankAcc.TABLECAPTION));
        
                CASE "Bank Payment Type" OF
                  "Bank Payment Type"::"Computer Check":
                    BEGIN
                      TESTFIELD("Check Printed",TRUE);
                      CheckLedgEntry.LOCKTABLE;
                      CheckLedgEntry.RESET;
                      CheckLedgEntry.SETCURRENTKEY("Bank Account No.","Entry Status","Check No.");
                      CheckLedgEntry.SETRANGE("Bank Account No.","Account No.");
                      CheckLedgEntry.SETRANGE("Entry Status",CheckLedgEntry."Entry Status"::Printed);
                      CheckLedgEntry.SETRANGE("Check No.","Cheque No.");
        
                      IF CheckLedgEntry.FIND('-') THEN
                        REPEAT
                          CheckLedgEntry2 := CheckLedgEntry;
                          CheckLedgEntry2."Entry Status" := CheckLedgEntry2."Entry Status"::Posted;
                          CheckLedgEntry2."Bank Account Ledger Entry No." := BankAccLedgEntry."Entry No.";
                          CheckLedgEntry2.MODIFY;
                        UNTIL CheckLedgEntry.NEXT = 0;
                    END;
        
                  "Bank Payment Type"::"Manual Check":
                    BEGIN
                      IF "Document No." = '' THEN
                        FIELDERROR( "Document No.",STRSUBSTNO(Text005,FIELDCAPTION("Bank Payment Type"),"Bank Payment Type"));
                      CheckLedgEntry.RESET;
        
                      IF NextCheckEntryNo = 0 THEN
                        BEGIN
                          CheckLedgEntry.LOCKTABLE;
                          IF CheckLedgEntry.FIND('+') THEN
                            NextCheckEntryNo := CheckLedgEntry."Entry No." + 1
                          ELSE
                            NextCheckEntryNo := InitEntryNoInStore.GetCurrLocInitEntryNo(DATABASE::"Check Ledger Entry");
                        END;
        
                      CheckLedgEntry.SETCURRENTKEY("Bank Account No.","Entry Status","Check No.");
                      CheckLedgEntry.SETRANGE("Bank Account No.","Account No.");
                      CheckLedgEntry.SETFILTER("Entry Status",'%1|%2|%3',CheckLedgEntry."Entry Status"::Printed,
                                               CheckLedgEntry."Entry Status"::Posted,
                                               CheckLedgEntry."Entry Status"::"Financially Voided");
                      CheckLedgEntry.SETRANGE("Check No.","Cheque No.");
        
                      IF CheckLedgEntry.FIND('-') THEN
                        ERROR(Text006,"Document No.");
        
                      CheckLedgEntry.INIT;
                      CheckLedgEntry."Entry No." := NextCheckEntryNo;
                      CheckLedgEntry."Bank Account No." := BankAccLedgEntry."Bank Account No.";
                      CheckLedgEntry."Bank Account Ledger Entry No." := BankAccLedgEntry."Entry No.";
                      CheckLedgEntry."Posting Date" := BankAccLedgEntry."Posting Date";
                      CheckLedgEntry."Document Type" := BankAccLedgEntry."Document Type";
                      CheckLedgEntry."Document No." := BankAccLedgEntry."Document No.";
                      CheckLedgEntry."External Document No." := BankAccLedgEntry."External Document No.";
                      CheckLedgEntry.Description := BankAccLedgEntry.Description;
                      CheckLedgEntry."Bank Payment Type" := "Bank Payment Type";
                      CheckLedgEntry."Bal. Account Type" := BankAccLedgEntry."Bal. Account Type";
                      CheckLedgEntry."Bal. Account No." := BankAccLedgEntry."Bal. Account No.";
                      CheckLedgEntry."Entry Status" := CheckLedgEntry."Entry Status"::Posted;
                      CheckLedgEntry.Open := TRUE;
                      CheckLedgEntry."User ID" := USERID;
        
                      CheckLedgEntry."Check Date" := "Cheque Date";
                      CheckLedgEntry."Check No." := "Cheque No.";
                      CheckLedgEntry."Issuing Bank" := "Issuing Bank";
        
                      IF BankAcc."Currency Code" <> '' THEN
                        CheckLedgEntry.Amount := --BankAccLedgEntry.Amount  // NAVIN
                      ELSE
                        CheckLedgEntry.Amount := -BankAccLedgEntry."Amount (LCY)";
        
                      CheckLedgEntry.INSERT;
                      NextCheckEntryNo := NextCheckEntryNo + 1;
                    END;
                END;
              END;
              */
            BankAccPostingGr.TESTFIELD("G/L Bank Account No.");
            GLEntry."Bal. Account Type" := "Bal. Account Type";
            GLEntry."Bal. Account No." := "Bal. Account No.";
        
            InsertGLEntry(TRUE);
          END;

    end;

    [LineStart(43610)]
    local procedure InitCodeUnit();
    begin
        WITH PayrollJournalLine DO
        BEGIN
          IF NextEntryNo = 0 THEN
            BEGIN
              GLEntry.LOCKTABLE;
              IF GLEntry.FIND('+') THEN
                BEGIN
                  NextEntryNo := GLEntry."Entry No." + 1;
                  NextTransactionNo := GLEntry."Transaction No." + 1;
                END
              ELSE
                BEGIN
                  //NextEntryNo := InitEntryNoInStore.GetCurrLocInitEntryNo(DATABASE::"G/L Entry"); // NAVIN //B2b1.0
                  NextTransactionNo := NextEntryNo;
                END;
        
              LastDocType := "Document Type";
              LastDocNo := "Document No.";
              LastLineNo := "Line No.";
              LastDate := "Posting Date";
              CurrentBalance := 0;
        
              AccountingPeriod.RESET;
              AccountingPeriod.SETCURRENTKEY(Closed);
              AccountingPeriod.SETRANGE(Closed,FALSE);
              AccountingPeriod.FIND('-');
              FiscalYearStartDate := AccountingPeriod."Starting Date";
        
              GLSetup.GET;
        
              IF NOT PayJournalTemplate.GET("Pay Journal Template") THEN
                PayJournalTemplate.INIT;
        
              NextConnectionNo := 1;
        
              GLReg.LOCKTABLE;
              IF GLReg.FIND('+') THEN
                GLReg."No." := GLReg."No." + 1;
              /*ELSE
                GLReg."No." := InitEntryNoInStore.GetCurrLocInitEntryNo(DATABASE::"G/L Register"); // NAVIN *///B2b1.0
        
              GLReg.INIT;
              GLReg."From Entry No." := NextEntryNo;
        
              GLReg."Creation Date" := TODAY;
              GLReg."Source Code" := "Source Code";
              GLReg."Journal Batch Name" :="Pay Journal Batch";
              GLReg."User ID" := USERID;
            END
          ELSE
            IF (LastDocType <> "Document Type") OR (LastDocNo <> "Document No.") OR
               (LastDate <> "Posting Date") OR (CurrentBalance = 0) AND NOT "System-Created Entry" OR
               (LastLineNo <> "Line No.")
            THEN
              BEGIN
                NextTransactionNo := NextTransactionNo + 1;
                LastDocType := "Document Type";
                LastDocNo := "Document No.";
                LastLineNo := "Line No.";
                LastDate := "Posting Date";
              END;
        
          //GetCurrencyExchRate;
          GLEntryTmp.DELETEALL;
          IF ("Account No." <> '') AND ("Bal. Account No." = '') THEN
            CurrentBalance := CurrentBalance + "Amount (LCY)";
        
          IF ("Account No." = '') AND ("Bal. Account No." <> '') THEN
            CurrentBalance := CurrentBalance - "Amount (LCY)";
        END;

    end;

    [LineStart(43682)]
    local procedure FinishCodeunit();
    begin
        WITH PayrollJournalLine DO
        BEGIN
          IF GLEntryTmp.FIND('-') THEN
            BEGIN
              REPEAT
                GLEntry := GLEntryTmp;
                IF GLSetup."Additional Reporting Currency" = '' THEN
                  GLEntry."Additional-Currency Amount" := 0;
        
                GLEntry."Dimension Set ID" := PayrollJournalLine."Dimension Set ID"; //DIM1.0
                GLEntry.INSERT;
        
                //IF NOT InsertFAAllocDim(GLEntry."Entry No.") THEN
                //DIM1.0 Start Since Function doesn't exist in Nav 2013
                /*
                DimMgt.MoveJnlLineDimToLedgEntryDim(TempJnlLineDim,DATABASE::"G/L Entry",GLEntry."Entry No.");
                */
                //DIM1.0<<
        
              UNTIL GLEntryTmp.NEXT = 0;
        
              IF GLReg."To Entry No." = 0 THEN
                BEGIN
                  GLReg."To Entry No." := GLEntry."Entry No.";
                  GLReg.INSERT;
                END
              ELSE
                BEGIN
                  GLReg."To Entry No." := GLEntry."Entry No.";
                  GLReg.MODIFY;
                END;
            END;
          GLEntry.CONSISTENT((BalanceCheckAmount = 0) AND (BalanceCheckAmount2 = 0) AND
                             (BalanceCheckAddCurrAmount = 0) AND (BalanceCheckAddCurrAmount2 = 0));
        END;

    end;

    [LineStart(43719)]
    local procedure InitGLEntry(GLAccNo : Code[20];Amount : Decimal;AmountAddCurr : Decimal;UseAmountAddCurr : Boolean;SystemCreatedEntry : Boolean);
    var
        TableID : array [10] of Integer;
        AccNo : array [10] of Code[20];
    begin
        
        OriginalAmount := Amount;
        OriginalAddCurrAmount := Amount;
        
        IF GLAccNo <> '' THEN
        BEGIN
          GLAcc.GET(GLAccNo);
          GLAcc.TESTFIELD(Blocked,FALSE);
          GLAcc.TESTFIELD("Account Type",GLAcc."Account Type"::Posting);
        
          //////////// Check the Value Posting field on the G/L Account if it is not checked already in Codeunit 33000013
          IF (NOT
              ((GLAccNo = PayrollJournalLine."Account No.") AND
               (PayrollJournalLine."Account Type" = PayrollJournalLine."Account Type"::"G/L Account")) OR
              ((GLAccNo = PayrollJournalLine."Bal. Account No.") AND
               (PayrollJournalLine."Bal. Account Type" = PayrollJournalLine."Bal. Account Type"::"G/L Account")))
          THEN
            BEGIN
              TableID[1] := DimMgt.TypeToTableID1(DimMgrAccountType::"G/L Account");
              AccNo[1] := GLAccNo;
              //DIM1.0 Start
              //Code Commented
              /*
              IF NOT DimMgt.CheckJnlLineDimValuePosting(TempJnlLineDim,TableID,AccNo) THEN
                IF PayrollJournalLine."Line No." <> 0 THEN
                  ERROR(Text013,PayrollJournalLine.TABLECAPTION,
                        PayrollJournalLine."Pay Journal Template",
                        PayrollJournalLine."Pay Journal Batch",PayrollJournalLine."Line No.",
                        DimMgt.GetDimValuePostingErr)
                ELSE
                  ERROR(DimMgt.GetDimValuePostingErr);
              */
              IF NOT DimMgt.CheckDimValuePosting(TableID,AccNo,PayrollJournalLine."Dimension Set ID") THEN
                IF PayrollJournalLine."Line No." <> 0 THEN
                  ERROR(Text013,PayrollJournalLine.TABLECAPTION,
                        PayrollJournalLine."Pay Journal Template",
                        PayrollJournalLine."Pay Journal Batch",PayrollJournalLine."Line No.",
                        DimMgt.GetDimValuePostingErr)
                ELSE
                  ERROR(DimMgt.GetDimValuePostingErr);
              //DIM1.0 End
            END;
        
        END;
        
        GLEntry.INIT;
        
        GLEntry."Journal Batch Name" := PayrollJournalLine."Pay Journal Batch";
        GLEntry."G/L Account No." := GLAccNo;
        GLEntry.Amount := Amount;
        
        GLEntry."Posting Date" := PayrollJournalLine."Posting Date";
        //GLEntry.Month := PayrollJournalLine."Posting Month";//B2b1.0
        //GLEntry.Year := PayrollJournalLine."Posting Year";//B2b1.0
        
        GLEntry."Document Date" := PayrollJournalLine."Document Date";
        
        CASE PayrollJournalLine."Document Type" OF
          PayrollJournalLine."Document Type"::Posting:
            GLEntry."Document Type":=GLEntry."Document Type"::"Balance Entry";
          PayrollJournalLine."Document Type"::FullFinal:
            GLEntry."Document Type":=GLEntry."Document Type"::"8";
          PayrollJournalLine."Document Type"::Reimbursement:
            GLEntry."Document Type":=GLEntry."Document Type"::"9";
          PayrollJournalLine."Document Type"::Payment:
            GLEntry."Document Type":=GLEntry."Document Type"::Payment;
        END;
        
        GLEntry."Document No." := PayrollJournalLine."Document No.";
        GLEntry."Gen. Posting Type":=GLEntry."Gen. Posting Type"::"4";
        GLEntry."Gen. Bus. Posting Group" := PayrollJournalLine."Pay Bus. Posting Group";
        GLEntry."Gen. Prod. Posting Group" := PayrollJournalLine."Pay Prod. Posting Group";
        
        ///New Added
        IF PayrollJournalLine."Bal. Account No."<>'' THEN
          BEGIN
            CASE PayrollJournalLine."Bal. Account Type" OF
              PayrollJournalLine."Bal. Account Type"::Employee:
                    GLEntry."Bal. Account Type":=    GLEntry."Bal. Account Type"::"IC Partner";
              PayrollJournalLine."Bal. Account Type"::"G/L Account":
                    GLEntry."Bal. Account Type":=    GLEntry."Bal. Account Type"::"G/L Account";
            END;
            GLEntry."Bal. Account No.":=PayrollJournalLine."Bal. Account No.";
          END;
        
        GLEntry.Description := PayrollJournalLine.Description;
        GLEntry."Source Code" := PayrollJournalLine."Source Code";
        GLEntry."Reason Code" := PayrollJournalLine."Reason Code";
        
        CASE PayrollJournalLine."Source Type" OF
          PayrollJournalLine."Source Type"::Employee:
            GLEntry."Source Type" := GLEntry."Source Type"::"5";
          PayrollJournalLine."Source Type"::"Bank Account":
            GLEntry."Source Type" := GLEntry."Source Type"::"Bank Account";
        END;
        
        GLEntry."Source No." := PayrollJournalLine."Source No.";
        
        GLEntry."Entry No." := NextEntryNo;
        //GLEntry."Value Entry No." := PayrollJournalLine."Value Entry No.";//B2b1.0
        GLEntry."Transaction No." := NextTransactionNo;
        GLEntry."User ID" := USERID;
        GLEntry."System-Created Entry" := SystemCreatedEntry;
        GLEntry."Prior-Year Entry" := GLEntry."Posting Date" < FiscalYearStartDate;
        
        //GLCalcAddCurrency(AmountAddCurr,UseAmountAddCurr);
        //GLEntry."Cheque No." := PayrollJournalLine."Cheque No.";
        //GLEntry."Cheque Date" := PayrollJournalLine."Cheque Date";
        //GLEntry."Issuing Bank" := PayrollJournalLine."Issuing Bank";

    end;

    [LineStart(43830)]
    local procedure InsertGLEntry(CalcAddCurrResiduals : Boolean);
    begin
        /*
        IF GLEntry.Amount <> ROUND(GLEntry.Amount) THEN
          GLEntry.FIELDERROR(Amount,STRSUBSTNO(Text000,GLEntry.Amount));
        */
        
        
        //////////Original Code
        /*
        IF GLEntry."Posting Date" = NORMALDATE(GLEntry."Posting Date") THEN
          BEGIN
            BalanceCheckAmount := BalanceCheckAmount + GLEntry.Amount * ((GLEntry."Posting Date" - 01010000D) MOD 99 + 1);
            BalanceCheckAmount2 := BalanceCheckAmount2 + GLEntry.Amount * ((GLEntry."Posting Date" - 01010000D) MOD 98 + 1);
          END
        ELSE
          BEGIN
            BalanceCheckAmount :=BalanceCheckAmount +
                                 GLEntry.Amount * ((NORMALDATE(GLEntry."Posting Date") - 01010000D + 50) MOD 99 + 1);
            BalanceCheckAmount2 :=BalanceCheckAmount2 +
                                  GLEntry.Amount * ((NORMALDATE(GLEntry."Posting Date") - 01010000D + 50) MOD 98 + 1);
          END;
        
        IF GLSetup."Additional Reporting Currency" <> '' THEN
          BEGIN
            IF GLEntry."Posting Date" = NORMALDATE(GLEntry."Posting Date") THEN
              BEGIN
                BalanceCheckAddCurrAmount :=BalanceCheckAddCurrAmount +
                                            GLEntry."Additional-Currency Amount" * ((GLEntry."Posting Date" - 01010000D) MOD 99 + 1);
                BalanceCheckAddCurrAmount2 := BalanceCheckAddCurrAmount2 +
                                              GLEntry."Additional-Currency Amount" * ((GLEntry."Posting Date" - 01010000D) MOD 98 + 1);
              END
            ELSE
              BEGIN
                BalanceCheckAddCurrAmount :=BalanceCheckAddCurrAmount + GLEntry."Additional-Currency Amount" *
                                                                        ((NORMALDATE(GLEntry."Posting Date") - 01010000D + 50) MOD 99 + 1);
                BalanceCheckAddCurrAmount2 :=BalanceCheckAddCurrAmount2 + GLEntry."Additional-Currency Amount" *
                                                                        ((NORMALDATE(GLEntry."Posting Date") - 01010000D + 50) MOD 98 + 1);
              END;
          END
        ELSE
          BEGIN
            BalanceCheckAddCurrAmount := 0;
            BalanceCheckAddCurrAmount2 := 0;
          END;
        */
        
        IF GLEntry."Posting Date" = NORMALDATE(GLEntry."Posting Date") THEN
          BEGIN
            BalanceCheckAmount := BalanceCheckAmount + OriginalAmount * ((GLEntry."Posting Date" - 01010000D) MOD 99 + 1);
            BalanceCheckAmount2 := BalanceCheckAmount2 + OriginalAmount * ((GLEntry."Posting Date" - 01010000D) MOD 98 + 1);
          END
        ELSE
          BEGIN
            BalanceCheckAmount :=BalanceCheckAmount +
                                 OriginalAmount * ((NORMALDATE(GLEntry."Posting Date") - 01010000D + 50) MOD 99 + 1);
            BalanceCheckAmount2 :=BalanceCheckAmount2 +
                                  OriginalAmount * ((NORMALDATE(GLEntry."Posting Date") - 01010000D + 50) MOD 98 + 1);
          END;
        
        IF GLSetup."Additional Reporting Currency" <> '' THEN
          BEGIN
            IF GLEntry."Posting Date" = NORMALDATE(GLEntry."Posting Date") THEN
              BEGIN
                BalanceCheckAddCurrAmount :=BalanceCheckAddCurrAmount +
                                            OriginalAddCurrAmount * ((GLEntry."Posting Date" - 01010000D) MOD 99 + 1);
                BalanceCheckAddCurrAmount2 := BalanceCheckAddCurrAmount2 +
                                              OriginalAddCurrAmount * ((GLEntry."Posting Date" - 01010000D) MOD 98 + 1);
              END
            ELSE
              BEGIN
                BalanceCheckAddCurrAmount :=BalanceCheckAddCurrAmount + OriginalAddCurrAmount *
                                                                        ((NORMALDATE(GLEntry."Posting Date") - 01010000D + 50) MOD 99 + 1);
                BalanceCheckAddCurrAmount2 :=BalanceCheckAddCurrAmount2 + OriginalAddCurrAmount *
                                                                        ((NORMALDATE(GLEntry."Posting Date") - 01010000D + 50) MOD 98 + 1);
              END;
          END
        ELSE
          BEGIN
            BalanceCheckAddCurrAmount := 0;
            BalanceCheckAddCurrAmount2 := 0;
          END;
        
        IF ((GLEntry.Amount > 0) AND (NOT PayrollJournalLine.Correction)) OR
           ((GLEntry.Amount < 0) AND PayrollJournalLine.Correction)
        THEN
          BEGIN
            GLEntry."Debit Amount" := GLEntry.Amount;
            GLEntry."Credit Amount" := 0
          END
        ELSE
          BEGIN
            GLEntry."Debit Amount" := 0;
            GLEntry."Credit Amount" := -GLEntry.Amount;
          END;
        
        IF ((GLEntry."Additional-Currency Amount" > 0) AND (NOT PayrollJournalLine.Correction)) OR
           ((GLEntry."Additional-Currency Amount" < 0) AND PayrollJournalLine.Correction)
        THEN
          BEGIN
            GLEntry."Add.-Currency Debit Amount" := GLEntry."Additional-Currency Amount";
            GLEntry."Add.-Currency Credit Amount" := 0
          END
        ELSE
          BEGIN
            GLEntry."Add.-Currency Debit Amount" := 0;
            GLEntry."Add.-Currency Credit Amount" := -GLEntry."Additional-Currency Amount";
          END;
        
        
        GLEntryTmp := GLEntry;
        GLEntryTmp.INSERT;
        NextEntryNo := NextEntryNo + 1;
        
        IF CalcAddCurrResiduals THEN
          HandleAddCurrResidualGLEntry;

    end;

    [LineStart(43946)]
    local procedure CalcCurrencyApplnRounding(var RecNewEmpLdgrEntryBuf : Record "Emp Ledger Entry Buffer";var RecOldEmpLdgrEntryBuf : Record "Emp Ledger Entry Buffer";var RecDtldEmpLedgEntryBuf : Record "Dtld Emp Ledg. Entry Buffer";RecPayrollJournalLine : Record "Payroll Journal Line";TransactionNo : Integer;ApplnRoundingPrecision : Decimal);
    var
        ApplnRounding : Decimal;
        ApplnRoundingLCY : Decimal;
    begin
        IF (RecNewEmpLdgrEntryBuf."Document Type" <> RecNewEmpLdgrEntryBuf."Document Type"::Payment)  OR
           (RecNewEmpLdgrEntryBuf."Currency Code" = RecOldEmpLdgrEntryBuf."Currency Code")
        THEN
            EXIT;

        ApplnRounding := -(RecNewEmpLdgrEntryBuf."Remaining Amount" + RecOldEmpLdgrEntryBuf."Remaining Amount");
        ApplnRoundingLCY := ROUND(ApplnRounding / RecNewEmpLdgrEntryBuf."Adjusted Currency Factor");

        IF (ApplnRounding = 0) OR (ABS(ApplnRounding) > ApplnRoundingPrecision) THEN
          EXIT;

        InitNewCELedgEntry(RecDtldEmpLedgEntryBuf,RecPayrollJournalLine);
        InitOldCELedgEntry(RecDtldEmpLedgEntryBuf,RecNewEmpLdgrEntryBuf);

        RecDtldEmpLedgEntryBuf."Entry Type" := RecDtldEmpLedgEntryBuf."Entry Type"::"Appln. Rounding";
        RecDtldEmpLedgEntryBuf.Amount := ApplnRounding;
        RecDtldEmpLedgEntryBuf."Amount (LCY)" := ApplnRoundingLCY;
        //RecDtldEmpLedgEntryBuf."Additional-Currency Amount" := ApplnRounding;
        InsertDtldCELedgEntry(RecDtldEmpLedgEntryBuf,RecNewEmpLdgrEntryBuf);
    end;

    [LineStart(43967)]
    procedure FindAmtForAppln(var RecNewEmpLdgrEntryBuf : Record "Emp Ledger Entry Buffer";var RecOldEmpLdgrEntryBuf : Record "Emp Ledger Entry Buffer";RecOldEmpLdgrEntryBuf2 : Record "Emp Ledger Entry Buffer";var AppliedAmount : Decimal;var AppliedAmountLCY : Decimal;var OldAppliedAmount : Decimal);
    begin
        IF RecOldEmpLdgrEntryBuf2.GETFILTER(Positive) <> '' THEN
          AppliedAmount := -RecOldEmpLdgrEntryBuf2."Remaining Amount"
        ELSE
          IF ABS(RecNewEmpLdgrEntryBuf."Remaining Amount") < ABS(RecOldEmpLdgrEntryBuf2."Remaining Amount") THEN
            AppliedAmount := RecNewEmpLdgrEntryBuf."Remaining Amount"
          ELSE
            AppliedAmount := -RecOldEmpLdgrEntryBuf2."Remaining Amount";

        ///New Added By tanmoy
        IF AppliedAmount=0 THEN
          EXIT;

        IF RecNewEmpLdgrEntryBuf."Currency Code" = RecOldEmpLdgrEntryBuf2."Currency Code" THEN
          BEGIN
            AppliedAmountLCY := ROUND(AppliedAmount / RecOldEmpLdgrEntryBuf."Original Currency Factor");
            OldAppliedAmount := AppliedAmount;
          END
        ELSE
          BEGIN
            ////////////// Management of posting in multiple currencies//////////
            IF AppliedAmount = -RecOldEmpLdgrEntryBuf2."Remaining Amount" THEN
              OldAppliedAmount := -RecOldEmpLdgrEntryBuf."Remaining Amount"
            ELSE
              OldAppliedAmount :=ExchAmount(AppliedAmount,RecNewEmpLdgrEntryBuf."Currency Code",
                                            RecOldEmpLdgrEntryBuf2."Currency Code",RecNewEmpLdgrEntryBuf."Posting Date");

            IF RecNewEmpLdgrEntryBuf."Currency Code" <> '' THEN
              ////////// Post the realized gain or loss on the RecNewEmpLdgrEntryBuf///////////
              AppliedAmountLCY := ROUND(OldAppliedAmount / RecOldEmpLdgrEntryBuf."Original Currency Factor")
            ELSE
              ////////// Post the realized gain or loss on the OldCVLedgEntryBuf////////////
              AppliedAmountLCY := ROUND(AppliedAmount / RecNewEmpLdgrEntryBuf."Original Currency Factor");
          END;
    end;

    [LineStart(44002)]
    local procedure CalcCurrencyUnrealizedGainLoss(var RecEmpLdgrEntryBuf : Record "Emp Ledger Entry Buffer";var RecDtldEmpLedgEntryBuf : Record "Dtld Emp Ledg. Entry Buffer";RecPayrollJournalLine : Record "Payroll Journal Line";AppliedAmount : Decimal;AppliedAmountLCY : Decimal;RemainingAmountBeforeAppln : Decimal);
    var
        UnRealizedGainLossLCY : Decimal;
        DtldEmpLedgEntryLocal : Record "Detailed Employee Ledg. Entry";
    begin
        /*C
        IF RecEmpLdgrEntryBuf."Currency Code" = '' THEN
          EXIT;
        
        /////////// Calculate Unrealized GainLoss/////////////
        IF (RecPayrollJournalLine."Account Type" = RecPayrollJournalLine."Account Type"::Employee) THEN
          BEGIN
            DtldEmpLedgEntryLocal.SETCURRENTKEY("Employee Ledger Entry No.","Entry Type");
            DtldEmpLedgEntryLocal.SETRANGE("Employee Ledger Entry No.",RecEmpLdgrEntryBuf."Entry No.");
            DtldEmpLedgEntryLocal.SETRANGE("Entry Type",
                                            DtldEmpLedgEntryLocal."Entry Type"::"Unrealized Loss",
                                            DtldEmpLedgEntryLocal."Entry Type"::"Unrealized Gain");
            DtldEmpLedgEntryLocal.CALCSUMS("Amount (LCY)");
            UnRealizedGainLossLCY := ROUND(DtldEmpLedgEntryLocal."Amount (LCY)" * ABS(AppliedAmount / RemainingAmountBeforeAppln));
          END;
        
        IF UnRealizedGainLossLCY <> 0 THEN
          BEGIN
            InitNewCELedgEntry(RecDtldEmpLedgEntryBuf,RecPayrollJournalLine);
            InitOldCELedgEntry(RecDtldEmpLedgEntryBuf,RecEmpLdgrEntryBuf);
            IF UnRealizedGainLossLCY < 0 THEN
              BEGIN
                RecDtldEmpLedgEntryBuf."Entry Type" := RecDtldEmpLedgEntryBuf."Entry Type"::"Unrealized Loss";
                RecDtldEmpLedgEntryBuf."Amount (LCY)" := -UnRealizedGainLossLCY;
                InsertDtldCELedgEntry(RecDtldEmpLedgEntryBuf,RecEmpLdgrEntryBuf);
              END
            ELSE
              BEGIN
                RecDtldEmpLedgEntryBuf."Entry Type" := RecDtldEmpLedgEntryBuf."Entry Type"::"Unrealized Gain";
                RecDtldEmpLedgEntryBuf."Amount (LCY)" := -UnRealizedGainLossLCY;
                InsertDtldCELedgEntry(RecDtldEmpLedgEntryBuf,RecEmpLdgrEntryBuf);
              END;
          END;
        */

    end;

    [LineStart(44038)]
    procedure CalcCurrencyRealizedGainLoss(var RecEmpLedgEntryBuf : Record "Emp Ledger Entry Buffer";var RecNewEmpLdgrEntryBuf : Record "Emp Ledger Entry Buffer";var RecDtldEmpLedgEntryBuf : Record "Dtld Emp Ledg. Entry Buffer";RecPayrollJournalLine : Record "Payroll Journal Line";AppliedAmount : Decimal;AppliedAmountLCY : Decimal);
    var
        RealizedGainLossLCY : Decimal;
    begin
        /*C
        IF RecEmpLedgEntryBuf."Currency Code" = '' THEN
          EXIT;
        
        //////////// Calculate Realized GainLoss//////////
        RealizedGainLossLCY := AppliedAmountLCY - ROUND(AppliedAmount / RecEmpLedgEntryBuf."Original Currency Factor");
        IF RealizedGainLossLCY <> 0 THEN
          BEGIN
            InitNewCELedgEntry(RecDtldEmpLedgEntryBuf,RecPayrollJournalLine);
            InitOldCELedgEntry(RecDtldEmpLedgEntryBuf,RecEmpLedgEntryBuf);
            IF RealizedGainLossLCY < 0 THEN
              BEGIN
                RecDtldEmpLedgEntryBuf."Entry Type" := RecDtldEmpLedgEntryBuf."Entry Type"::"Realized Loss";
                RecDtldEmpLedgEntryBuf."Amount (LCY)" := RealizedGainLossLCY;
                InsertDtldCELedgEntry(RecDtldEmpLedgEntryBuf,RecEmpLedgEntryBuf);
              END
            ELSE
              BEGIN
                RecDtldEmpLedgEntryBuf."Entry Type" := RecDtldEmpLedgEntryBuf."Entry Type"::"Realized Gain";
                RecDtldEmpLedgEntryBuf."Amount (LCY)" := RealizedGainLossLCY;
                InsertDtldCELedgEntry(RecDtldEmpLedgEntryBuf,RecEmpLedgEntryBuf);
              END;
          END;
        */

    end;

    [LineStart(44064)]
    local procedure CalcApplication(var RecNewEmpLdgrEntryBuf : Record "Emp Ledger Entry Buffer";var RecOldEmpLdgrEntryBuf : Record "Emp Ledger Entry Buffer";var RecDtldEmpLedgEntryBuf : Record "Dtld Emp Ledg. Entry Buffer";RecPayrollJournalLine : Record "Payroll Journal Line";AppliedAmount : Decimal;AppliedAmountLCY : Decimal;OldAppliedAmount : Decimal);
    begin
        IF AppliedAmount = 0 THEN
          EXIT;

        InitNewCELedgEntry(RecDtldEmpLedgEntryBuf,RecPayrollJournalLine);
        InitOldCELedgEntry(RecDtldEmpLedgEntryBuf,RecOldEmpLdgrEntryBuf);
        RecDtldEmpLedgEntryBuf."Entry Type" := RecDtldEmpLedgEntryBuf."Entry Type"::Application;
        RecDtldEmpLedgEntryBuf.Amount := OldAppliedAmount;
        RecDtldEmpLedgEntryBuf."Amount (LCY)" := AppliedAmountLCY;
        InsertDtldCELedgEntry(RecDtldEmpLedgEntryBuf,RecOldEmpLdgrEntryBuf);

        /////////New Added By tanmoy//////////
        //RecOldEmpLdgrEntryBuf.Open := RecOldEmpLdgrEntryBuf."Remaining Amount" <> 0;
        RecOldEmpLdgrEntryBuf.Open := ROUND(RecOldEmpLdgrEntryBuf."Remaining Amount",0.01,'=') <> 0;
        ///////////
        IF NOT RecOldEmpLdgrEntryBuf.Open THEN
          BEGIN
            RecOldEmpLdgrEntryBuf."Closed by Entry No." := RecNewEmpLdgrEntryBuf."Entry No.";
            RecOldEmpLdgrEntryBuf."Closed at Date" := RecPayrollJournalLine."Posting Date";
            RecOldEmpLdgrEntryBuf."Closed by Amount" := -OldAppliedAmount;
            RecOldEmpLdgrEntryBuf."Closed by Amount (LCY)" := -AppliedAmountLCY;
            RecOldEmpLdgrEntryBuf."Closed by Currency Code" := RecNewEmpLdgrEntryBuf."Currency Code";
            RecOldEmpLdgrEntryBuf."Closed by Currency Amount" := -AppliedAmount;
          END;

        InitNewCELedgEntry(RecDtldEmpLedgEntryBuf,RecPayrollJournalLine);
        InitOldCELedgEntry(RecDtldEmpLedgEntryBuf,RecNewEmpLdgrEntryBuf);
        RecDtldEmpLedgEntryBuf."Entry Type" := RecDtldEmpLedgEntryBuf."Entry Type"::Application;
        RecDtldEmpLedgEntryBuf.Amount := -AppliedAmount;
        RecDtldEmpLedgEntryBuf."Amount (LCY)" := -AppliedAmountLCY;
        InsertDtldCELedgEntry(RecDtldEmpLedgEntryBuf,RecNewEmpLdgrEntryBuf);

        RecNewEmpLdgrEntryBuf.Open := RecNewEmpLdgrEntryBuf."Remaining Amount" <> 0;
        IF NOT RecNewEmpLdgrEntryBuf.Open AND RecOldEmpLdgrEntryBuf.Open THEN
          BEGIN
            RecNewEmpLdgrEntryBuf."Closed by Entry No." := RecOldEmpLdgrEntryBuf."Entry No.";
            RecNewEmpLdgrEntryBuf."Closed at Date" := RecPayrollJournalLine."Posting Date";
            RecNewEmpLdgrEntryBuf."Closed by Amount" := AppliedAmount;
            RecNewEmpLdgrEntryBuf."Closed by Amount (LCY)" := AppliedAmountLCY;
            RecNewEmpLdgrEntryBuf."Closed by Currency Code" := RecOldEmpLdgrEntryBuf."Currency Code";
            RecNewEmpLdgrEntryBuf."Closed by Currency Amount" := OldAppliedAmount;
          END;
    end;

    [LineStart(44107)]
    local procedure CalcAmtLCYAdjustment(var RecEmpLedgerEntryBuf : Record "Emp Ledger Entry Buffer";var RecNewEmpLdgrEntryBuf : Record "Emp Ledger Entry Buffer";var RecDtldEmpLedgEntryBuf : Record "Dtld Emp Ledg. Entry Buffer";RecPayrollJournalLine : Record "Payroll Journal Line";TransactionNo : Decimal);
    var
        AdjustedAmountLCY : Decimal;
    begin
        IF RecEmpLedgerEntryBuf."Currency Code" = '' THEN
          EXIT;

        AdjustedAmountLCY :=ROUND(RecEmpLedgerEntryBuf."Remaining Amount" / RecEmpLedgerEntryBuf."Adjusted Currency Factor");

        IF AdjustedAmountLCY <> RecEmpLedgerEntryBuf."Remaining Amt. (LCY)" THEN
          BEGIN
            InitNewCELedgEntry(RecDtldEmpLedgEntryBuf,RecPayrollJournalLine);
            InitOldCELedgEntry(RecDtldEmpLedgEntryBuf,RecEmpLedgerEntryBuf);
            RecDtldEmpLedgEntryBuf."Entry Type" :=RecDtldEmpLedgEntryBuf."Entry Type"::"Correction of Remaining Amount";
            RecDtldEmpLedgEntryBuf."Amount (LCY)" := AdjustedAmountLCY - RecEmpLedgerEntryBuf."Remaining Amt. (LCY)";
            InsertDtldCELedgEntry(RecDtldEmpLedgEntryBuf,RecEmpLedgerEntryBuf);
          END;
    end;

    [LineStart(44122)]
    procedure InitNewCELedgEntry(var RecInitDtldEmpLedgEntryBuf : Record "Dtld Emp Ledg. Entry Buffer";RecPayrollJournalLine : Record "Payroll Journal Line");
    begin
        RecInitDtldEmpLedgEntryBuf.INIT;
        RecInitDtldEmpLedgEntryBuf."Posting Date" := RecPayrollJournalLine."Posting Date";
        RecInitDtldEmpLedgEntryBuf."Document Type" := RecPayrollJournalLine."Document Type";
        RecInitDtldEmpLedgEntryBuf."Document No." := RecPayrollJournalLine."Document No.";
        RecInitDtldEmpLedgEntryBuf."User ID" := USERID;
    end;

    [LineStart(44129)]
    procedure InitOldCELedgEntry(var RecInitDtldEmpLedgEntryBuf : Record "Dtld Emp Ledg. Entry Buffer";RecOldEmpLedgerEntryBuf : Record "Emp Ledger Entry Buffer");
    begin
        RecInitDtldEmpLedgEntryBuf."Employee Ledger Entry No." :=RecOldEmpLedgerEntryBuf."Entry No.";
        RecInitDtldEmpLedgEntryBuf."Employee No.":= RecOldEmpLedgerEntryBuf."Employee No.";
        RecInitDtldEmpLedgEntryBuf."Currency Code" := RecOldEmpLedgerEntryBuf."Currency Code";
        RecInitDtldEmpLedgEntryBuf."Initial Entry Due Date" := RecOldEmpLedgerEntryBuf."Due Date";
        RecInitDtldEmpLedgEntryBuf."Initial Entry Global Dim. 1" :=RecOldEmpLedgerEntryBuf."Global Dimension 1 Code";
        RecInitDtldEmpLedgEntryBuf."Initial Entry Global Dim. 2" :=RecOldEmpLedgerEntryBuf."Global Dimension 2 Code";
        RecInitDtldEmpLedgEntryBuf."Initial Document Type" := RecOldEmpLedgerEntryBuf."Document Type";
    end;

    [LineStart(44138)]
    local procedure InsertDtldCELedgEntry(var RecDtldEmpLedgEntryBuf : Record "Dtld Emp Ledg. Entry Buffer";var RecEmpLedgerEntryBuf : Record "Emp Ledger Entry Buffer");
    var
        NextDtldBufferEntryNo : Integer;
        NewDtldEmpLedgEntryBufLocal : Record "Dtld Emp Ledg. Entry Buffer";
    begin
        ////modification Of DtlBuffer Table(Amount, Remaining Amount)

        IF (RecDtldEmpLedgEntryBuf.Amount = 0) AND
           (RecDtldEmpLedgEntryBuf."Amount (LCY)" = 0) // AND (RecDtldEmpLedgEntryBuf."Additional-Currency Amount" = 0)
        THEN
          EXIT;

        RecDtldEmpLedgEntryBuf.TESTFIELD("Entry Type" );

        NewDtldEmpLedgEntryBufLocal.INIT;
        NewDtldEmpLedgEntryBufLocal := RecDtldEmpLedgEntryBuf;

        IF NextDtldBufferEntryNo = 0 THEN
          BEGIN
            RecDtldEmpLedgEntryBuf.RESET;
            IF RecDtldEmpLedgEntryBuf.FIND('+') THEN
              NextDtldBufferEntryNo := RecDtldEmpLedgEntryBuf."Entry No." + 1
            ELSE
              NextDtldBufferEntryNo := 1;
          END;

        RecDtldEmpLedgEntryBuf.RESET;
        RecDtldEmpLedgEntryBuf.SETRANGE("Employee Ledger Entry No.",RecEmpLedgerEntryBuf."Entry No.");
        RecDtldEmpLedgEntryBuf.SETRANGE("Entry Type",NewDtldEmpLedgEntryBufLocal."Entry Type");
        RecDtldEmpLedgEntryBuf.SETRANGE("Posting Date",NewDtldEmpLedgEntryBufLocal."Posting Date");
        RecDtldEmpLedgEntryBuf.SETRANGE("Document Type",NewDtldEmpLedgEntryBufLocal."Document Type");
        RecDtldEmpLedgEntryBuf.SETRANGE("Document No.",NewDtldEmpLedgEntryBufLocal."Document No.");
        RecDtldEmpLedgEntryBuf.SETRANGE("Employee No.",NewDtldEmpLedgEntryBufLocal."Employee No.");
        RecDtldEmpLedgEntryBuf.SETRANGE("Pay Posting Type",NewDtldEmpLedgEntryBufLocal."Pay Posting Type");
        RecDtldEmpLedgEntryBuf.SETRANGE("Pay Bus. Posting Group",NewDtldEmpLedgEntryBufLocal."Pay Bus. Posting Group");
        RecDtldEmpLedgEntryBuf.SETRANGE("Pay Prod. Posting Group",NewDtldEmpLedgEntryBufLocal."Pay Prod. Posting Group");

        IF RecDtldEmpLedgEntryBuf.FIND('-') THEN
          BEGIN
            RecDtldEmpLedgEntryBuf.Amount := RecDtldEmpLedgEntryBuf.Amount + NewDtldEmpLedgEntryBufLocal.Amount;
            RecDtldEmpLedgEntryBuf."Amount (LCY)" :=RecDtldEmpLedgEntryBuf."Amount (LCY)" + NewDtldEmpLedgEntryBufLocal."Amount (LCY)";
            //RecDtldEmpLedgEntryBuf."Additional-Currency Amount" :=RecDtldEmpLedgEntryBuf."Additional-Currency Amount" +
            //                                                     NewDtldEmpLedgEntryBufLocal."Additional-Currency Amount";
            RecDtldEmpLedgEntryBuf.MODIFY;
          END
        ELSE
          BEGIN
            NewDtldEmpLedgEntryBufLocal."Entry No." := NextDtldBufferEntryNo;
            NextDtldBufferEntryNo := NextDtldBufferEntryNo + 1;
            RecDtldEmpLedgEntryBuf := NewDtldEmpLedgEntryBufLocal;
            RecDtldEmpLedgEntryBuf.INSERT;
          END;

        RecEmpLedgerEntryBuf."Remaining Amount" := NewDtldEmpLedgEntryBufLocal.Amount + RecEmpLedgerEntryBuf."Remaining Amount";
        RecEmpLedgerEntryBuf."Remaining Amt. (LCY)" :=NewDtldEmpLedgEntryBufLocal."Amount (LCY)" +
                                                      RecEmpLedgerEntryBuf."Remaining Amt. (LCY)";
        IF RecDtldEmpLedgEntryBuf."Entry Type" = RecDtldEmpLedgEntryBuf."Entry Type"::"Initial Entry" THEN
          BEGIN
            RecEmpLedgerEntryBuf.CALCFIELDS("Original Amount","Original Amt. (LCY)");
            RecEmpLedgerEntryBuf."Original Amount" := NewDtldEmpLedgEntryBufLocal.Amount;
            RecEmpLedgerEntryBuf."Original Amt. (LCY)" := NewDtldEmpLedgEntryBufLocal."Amount (LCY)";
          END;
        RecDtldEmpLedgEntryBuf.RESET;
    end;

    [LineStart(44198)]
    local procedure ApplyEmpLedgEntry(var RecNewEmpLedgrEntryBuf : Record "Emp Ledger Entry Buffer";var RecDtldEmpLedgEntryBuf : Record "Dtld Emp Ledg. Entry Buffer";RecPayrollJournalLine : Record "Payroll Journal Line";TransactionNo : Integer;ApplnRoundingPrecision : Decimal);
    var
        OldEmpLedgerEntryBufLocal : Record "Emp Ledger Entry Buffer";
        OldEmpLedgerEntryBufLocal2 : Record "Emp Ledger Entry Buffer";
        Completed : Boolean;
        AppliedAmount : Decimal;
        AppliedAmountLCY : Decimal;
        OldAppliedAmount : Decimal;
        TempAmount : Decimal;
        NewRemainingAmtBeforeAppln : Decimal;
        OldRemainingAmtBeforeAppln : Decimal;
        RemainingAmtToBeApplied : Decimal;
        ApplyingDate : Date;
        OldEmpLedgerEntryLocal : Record "Employee Ledger Entry";
        NewEmpLedgerEntryLocal : Record "Employee Ledger Entry";
    begin
        IF RecNewEmpLedgrEntryBuf."Remaining Amount" = 0 THEN
          EXIT;
        
        /*
        IF (RecPayrollJournalLine."Applies-to Doc. No." = '') AND (RecPayrollJournalLine."Applies-to ID" = '') AND
           NOT ((Employee."Application Method" = Employee."Application Method"::"Apply to Oldest") AND
                 RecPayrollJournalLine."Allow Application")
        THEN
          EXIT;
        */
        //////////New Added by Tanmoy//////////////////
        IF (RecPayrollJournalLine."Applies-to Doc. No." = '') AND (RecPayrollJournalLine."Applies-to ID" = '') THEN
          EXIT;
        
        NewRemainingAmtBeforeAppln := RecNewEmpLedgrEntryBuf."Remaining Amount";
        
        IF RecNewEmpLedgrEntryBuf."Currency Code" <> '' THEN
          BEGIN
            //////////// Management of application of already posted entries//////
            IF RecNewEmpLedgrEntryBuf."Currency Code" <> ApplnCurrency.Code THEN
              ApplnCurrency.GET(RecNewEmpLedgrEntryBuf."Currency Code");
            ApplnRoundingPrecision := ApplnCurrency."Appln. Rounding Precision";
          END
        ELSE
          ApplnRoundingPrecision := GLSetup."Appln. Rounding Precision";
        ApplyingDate := RecPayrollJournalLine."Posting Date";
        
        IF RecPayrollJournalLine."Applies-to Doc. No." <> '' THEN
          BEGIN
            ///////////////// Find the entry to be applied to///////////
            OldEmpLedgerEntryLocal.RESET;
            OldEmpLedgerEntryLocal.SETCURRENTKEY("Document No.","Document Type","Employee No.",Open);
            OldEmpLedgerEntryLocal.SETRANGE("Document Type",RecPayrollJournalLine."Applies-to Doc. Type");
            OldEmpLedgerEntryLocal.SETRANGE("Document No.",RecPayrollJournalLine."Applies-to Doc. No.");
            OldEmpLedgerEntryLocal.SETRANGE("Employee No.",RecNewEmpLedgrEntryBuf."Employee No.");
            OldEmpLedgerEntryLocal.SETRANGE(Open,TRUE);
        
            ///New Added By Tanmoy
            OldEmpLedgerEntryLocal.SETRANGE("Payment Indicator",RecPayrollJournalLine."Payment Indicator");
        
            IF OldEmpLedgerEntryLocal.FIND('-') THEN
              BEGIN
                OldEmpLedgerEntryLocal.TESTFIELD(Positive,NOT RecNewEmpLedgrEntryBuf.Positive);
        
                IF OldEmpLedgerEntryLocal."Posting Date" > ApplyingDate THEN
                  ApplyingDate := OldEmpLedgerEntryLocal."Posting Date";
        
                PayrollJnlApply.CheckAgainstApplnCurrency(RecNewEmpLedgrEntryBuf."Currency Code",
                                                          OldEmpLedgerEntryLocal."Currency Code",
                                                          RecPayrollJournalLine."Account Type"::Employee,
                                                          TRUE);
              END
          END
        ELSE
          BEGIN
            //////////// Find the first old entry (Invoice) which the new entry (Payment) should apply to
            OldEmpLedgerEntryLocal.RESET;
            OldEmpLedgerEntryLocal.SETCURRENTKEY("Employee No.","Applies-to ID",Open,Positive,"Due Date");
            OldEmpLedgerEntryLocal.SETRANGE("Employee No.",RecNewEmpLedgrEntryBuf."Employee No.");
            OldEmpLedgerEntryLocal.SETRANGE("Applies-to ID",RecPayrollJournalLine."Applies-to ID");
            OldEmpLedgerEntryLocal.SETRANGE(Open,TRUE);
            OldEmpLedgerEntryLocal.SETFILTER("Entry No.",'<>%1',RecNewEmpLedgrEntryBuf."Entry No.");
        
            ///New Added By Tanmoy
            //OldEmpLedgerEntryLocal.SETRANGE("Payment Indicator",RecPayrollJournalLine."Payment Indicator");
        
            /*
            //////////// Management of posting in multiple currencies///////////
            IF PurchSetup."Appln. between Currencies" = PurchSetup."Appln. between Currencies"::None THEN
              BEGIN
                OldEmpLedgerEntryLocal.SETRANGE("Currency Code",RecNewEmpLedgrEntryBuf."Currency Code");
                IF OldEmpLedgerEntryLocal.FIND('-') AND (OldEmpLedgerEntryLocal."Applies-to ID" <> '') THEN
                  REPEAT
                    IF OldEmpLedgerEntryLocal."Posting Date" > ApplyingDate THEN
                      ApplyingDate := OldEmpLedgerEntryLocal."Posting Date";
                  UNTIL OldEmpLedgerEntryLocal.NEXT=0;
              END
            ELSE
              BEGIN
                IF OldEmpLedgerEntryLocal.FIND('-') THEN
                  BEGIN
                    OldEmpLedgerEntryLocal.CLEARMARKS;
                    REPEAT
                      IF PayrollJnlApply.CheckAgainstApplnCurrency(RecNewEmpLedgrEntryBuf."Currency Code",
                                                               OldEmpLedgerEntryLocal."Currency Code",
                                                               RecPayrollJournalLine."Account Type"::Employee,
                                                               FALSE)
                      THEN
                        BEGIN
                          OldEmpLedgerEntryLocal.MARK(TRUE);
                          IF (OldEmpLedgerEntryLocal."Posting Date" > ApplyingDate) AND (OldEmpLedgerEntryLocal."Applies-to ID" <> '') THEN
                            ApplyingDate := OldEmpLedgerEntryLocal."Posting Date";
                        END;
                    UNTIL OldEmpLedgerEntryLocal.NEXT=0;
                    OldEmpLedgerEntryLocal.MARKEDONLY(TRUE);
                  END;
              END;
            */
        
            OldEmpLedgerEntryLocal.SETRANGE(Positive,RecNewEmpLedgrEntryBuf."Remaining Amount" > 0);
        
            IF OldEmpLedgerEntryLocal.FIND('-') THEN
              BEGIN
                TempAmount := RecNewEmpLedgrEntryBuf."Remaining Amount";
                OldEmpLedgerEntryLocal.SETRANGE(Positive);
                OldEmpLedgerEntryLocal.FIND('-');
                REPEAT
                  OldEmpLedgerEntryLocal.CALCFIELDS("Remaining Amount");
                  IF RecNewEmpLedgrEntryBuf."Currency Code" <> OldEmpLedgerEntryLocal."Currency Code" THEN
                    BEGIN
                      OldEmpLedgerEntryLocal."Remaining Amount" :=ExchAmount(OldEmpLedgerEntryLocal."Remaining Amount",
                                                                             OldEmpLedgerEntryLocal."Currency Code",
                                                                             RecNewEmpLedgrEntryBuf."Currency Code",
                                                                             RecNewEmpLedgrEntryBuf."Posting Date");
                      /*
                      OldEmpLedgerEntryLocal."Remaining Pmt. Disc. Possible" :=ExchAmount(
                                                                                     OldEmpLedgerEntryLocal."Remaining Pmt. Disc. Possible",
                                                                                     OldEmpLedgerEntryLocal."Currency Code",
                                                                                     RecNewEmpLedgrEntryBuf."Currency Code",
                                                                                     RecNewEmpLedgrEntryBuf."Posting Date");
        
                      OldEmpLedgerEntryLocal."Accepted Payment Tolerance" :=ExchAmount(OldEmpLedgerEntryLocal."Accepted Payment Tolerance",
                                                                                       OldEmpLedgerEntryLocal."Currency Code",
                                                                                       RecNewEmpLedgrEntryBuf."Currency Code",
                                                                                       RecNewEmpLedgrEntryBuf."Posting Date");
                    */
                    END;
                  IF CheckCalcPmtDiscCEEmp(RecNewEmpLedgrEntryBuf,OldEmpLedgerEntryLocal,0,FALSE,FALSE) THEN
                    //OldEmpLedgerEntryLocal."Remaining Amount" :=(OldEmpLedgerEntryLocal."Remaining Amount" -
                    //                                             OldEmpLedgerEntryLocal."Remaining Pmt. Disc. Possible");
                  TempAmount := TempAmount + OldEmpLedgerEntryLocal."Remaining Amount";
                UNTIL OldEmpLedgerEntryLocal.NEXT = 0;
                OldEmpLedgerEntryLocal.SETRANGE(Positive,TempAmount < 0);
              END
            ELSE
              OldEmpLedgerEntryLocal.SETRANGE(Positive);
        
            IF NOT OldEmpLedgerEntryLocal.FIND('-') THEN
              EXIT;
          END;
        
        RecPayrollJournalLine."Posting Date" := ApplyingDate;
        /////////// Apply the new entry (Payment) to the old entries (Invoices) one at a time
        REPEAT
          OldEmpLedgerEntryLocal.CALCFIELDS(Amount,"Amount (LCY)","Remaining Amount","Remaining Amt. (LCY)",
                                            "Original Amount","Original Amt. (LCY)");
        
          TransferEmpLedgEntry(OldEmpLedgerEntryBufLocal,OldEmpLedgerEntryLocal,TRUE);
          OldEmpLedgerEntryLocal.COPYFILTER(Positive,OldEmpLedgerEntryBufLocal.Positive);
          OldRemainingAmtBeforeAppln := OldEmpLedgerEntryBufLocal."Remaining Amount";
        
          //////////// Management of posting in multiple currencies
          OldEmpLedgerEntryBufLocal2 := OldEmpLedgerEntryBufLocal;
          OldEmpLedgerEntryBufLocal.COPYFILTER(Positive,OldEmpLedgerEntryBufLocal2.Positive);
        
          IF RecNewEmpLedgrEntryBuf."Currency Code" <> OldEmpLedgerEntryBufLocal2."Currency Code" THEN
            BEGIN
              OldEmpLedgerEntryBufLocal2."Remaining Amount" :=ExchAmount(OldEmpLedgerEntryBufLocal2."Remaining Amount",
                                                                 OldEmpLedgerEntryBufLocal2."Currency Code",
                                                                 RecNewEmpLedgrEntryBuf."Currency Code",
                                                                 RecNewEmpLedgrEntryBuf."Posting Date");
              /*
              OldEmpLedgerEntryBufLocal2."Remaining Pmt. Disc. Possible" :=ExchAmount(
                                                                              OldEmpLedgerEntryBufLocal2."Remaining Pmt. Disc. Possible",
                                                                              OldEmpLedgerEntryBufLocal2."Currency Code",
                                                                              RecNewEmpLedgrEntryBuf."Currency Code",
                                                                              RecNewEmpLedgrEntryBuf."Posting Date");
              OldEmpLedgerEntryBufLocal2."Accepted Payment Tolerance" :=ExchAmount(OldEmpLedgerEntryBufLocal2."Accepted Payment Tolerance",
                                                                           OldEmpLedgerEntryBufLocal2."Currency Code",
                                                                           RecNewEmpLedgrEntryBuf."Currency Code",
                                                                           RecNewEmpLedgrEntryBuf."Posting Date");
              */
            END;
        
          CalcCurrencyApplnRounding(RecNewEmpLedgrEntryBuf,OldEmpLedgerEntryBufLocal2,RecDtldEmpLedgEntryBuf,
                                    RecPayrollJournalLine,TransactionNo,ApplnRoundingPrecision);
        
          FindAmtForAppln(RecNewEmpLedgrEntryBuf,OldEmpLedgerEntryBufLocal,OldEmpLedgerEntryBufLocal2,
                          AppliedAmount,AppliedAmountLCY,OldAppliedAmount);
        
          CalcCurrencyUnrealizedGainLoss(OldEmpLedgerEntryBufLocal,RecDtldEmpLedgEntryBuf,RecPayrollJournalLine,
                                         (-OldAppliedAmount),(-AppliedAmountLCY),OldRemainingAmtBeforeAppln);
        
          CalcCurrencyRealizedGainLoss(RecNewEmpLedgrEntryBuf,RecNewEmpLedgrEntryBuf,RecDtldEmpLedgEntryBuf,
                                       RecPayrollJournalLine,AppliedAmount,AppliedAmountLCY);
        
          CalcCurrencyRealizedGainLoss(OldEmpLedgerEntryBufLocal,OldEmpLedgerEntryBufLocal,RecDtldEmpLedgEntryBuf,
                                       RecPayrollJournalLine,(-OldAppliedAmount),(-AppliedAmountLCY));
        
          CalcApplication(RecNewEmpLedgrEntryBuf,OldEmpLedgerEntryBufLocal,RecDtldEmpLedgEntryBuf,
                          RecPayrollJournalLine,AppliedAmount,AppliedAmountLCY,OldAppliedAmount);
        
          //CalcRemainingPmtDisc(RecNewEmpLedgrEntryBuf,OldEmpLedgerEntryBufLocal,OldEmpLedgerEntryBufLocal2,ApplnRoundingPrecision);
          CalcAmtLCYAdjustment(OldEmpLedgerEntryBufLocal,RecNewEmpLedgrEntryBuf,RecDtldEmpLedgEntryBuf,
                               RecPayrollJournalLine,NextTransactionNo);
        
          /////////////////// Update the Old Entry
          TransferEmpLedgEntry(OldEmpLedgerEntryBufLocal,OldEmpLedgerEntryLocal,FALSE);
          OldEmpLedgerEntryLocal."Applies-to ID" := '';
          OldEmpLedgerEntryLocal.MODIFY;
        
          ///////////// Find the next old entry to apply to the new entry
          IF RecPayrollJournalLine."Applies-to Doc. No." <> '' THEN
            Completed := TRUE
          ELSE
            IF OldEmpLedgerEntryLocal.GETFILTER(OldEmpLedgerEntryLocal.Positive) <> '' THEN
              BEGIN
                IF OldEmpLedgerEntryLocal.NEXT = 1 THEN
                  Completed := FALSE
                ELSE
                  BEGIN
                    OldEmpLedgerEntryLocal.SETRANGE(Positive);
                    OldEmpLedgerEntryLocal.FIND('-');
                    OldEmpLedgerEntryLocal.CALCFIELDS("Remaining Amount");
                    Completed := OldEmpLedgerEntryLocal."Remaining Amount" * RecNewEmpLedgrEntryBuf."Remaining Amount" >= 0;
                  END
              END
            ELSE
              BEGIN
                IF RecNewEmpLedgrEntryBuf.Open THEN
                  Completed := OldEmpLedgerEntryLocal.NEXT = 0
                ELSE
                  Completed := TRUE;
              END;
        UNTIL Completed;
        
        RecDtldEmpLedgEntryBuf.SETCURRENTKEY("Employee Ledger Entry No.","Entry Type");
        RecDtldEmpLedgEntryBuf.SETRANGE("Employee Ledger Entry No.",RecNewEmpLedgrEntryBuf."Entry No.");
        RecDtldEmpLedgEntryBuf.SETRANGE("Entry Type",RecDtldEmpLedgEntryBuf."Entry Type"::Application);
        RecDtldEmpLedgEntryBuf.CALCSUMS("Amount (LCY)", Amount);
        
        CalcCurrencyUnrealizedGainLoss(RecNewEmpLedgrEntryBuf,RecDtldEmpLedgEntryBuf,
                                       RecPayrollJournalLine,RecDtldEmpLedgEntryBuf.Amount,RecDtldEmpLedgEntryBuf."Amount (LCY)",
                                       NewRemainingAmtBeforeAppln);
        CalcAmtLCYAdjustment(RecNewEmpLedgrEntryBuf,RecNewEmpLedgrEntryBuf,RecDtldEmpLedgEntryBuf,RecPayrollJournalLine,
                             NextTransactionNo);
        RecNewEmpLedgrEntryBuf."Applies-to ID" := '';

    end;

    [LineStart(44437)]
    procedure EmpPostApplyEmpLedgEntry(var RecPayrollJournalLineApply : Record "Payroll Journal Line";var RecEmpLedgerEntryApply : Record "Employee Ledger Entry");
    var
        DtldEmpLedgEntryBufLocal : Record "Dtld Emp Ledg. Entry Buffer";
        EmpLdgrEntryBufLocal : Record "Emp Ledger Entry Buffer";
        DtldEmpLedgEntryLocal : Record "Detailed Employee Ledg. Entry";
    begin
        //PayrollJournalLine := RecPayrollJournalLineApply; //B2b1.0
        //PayrollJournalLine."Source Currency Code" := RecEmpLedgerEntryApply."Currency Code";
        PayrollJournalLine."Applies-to ID" := RecEmpLedgerEntryApply."Applies-to ID";
        EmpLedgerEntry.TRANSFERFIELDS(RecEmpLedgerEntryApply);
        
        WITH PayrollJournalLine DO
          BEGIN
            //DIM1.0 Start
            //Code Commented
            /*
            LedgEntryDim.SETRANGE("Table ID",DATABASE::"Employee Ledger Entry");
            LedgEntryDim.SETRANGE("Entry No.",EmpLedgerEntry."Entry No.");
            TempJnlLineDim.RESET;
            TempJnlLineDim.DELETEALL;
            DimMgt.CopyLedgEntryDimToJnlLineDim(LedgEntryDim,TempJnlLineDim);
            */
            //PayrollJnlCheckLine.RunCheck(PayrollJournalLine,TempJnlLineDim);
            PayrollJnlCheckLine.RunCheck(PayrollJournalLine);
            //DIM1.0 End
        
        
            InitCodeUnit;
        
            IF Employee."No." <> EmpLedgerEntry."Employee No." THEN
              Employee.GET(EmpLedgerEntry."Employee No.");
            //Employee.CheckBlockedVendOnJnls(Employee,"Document Type",TRUE);
        
            IF "Posting Group" = '' THEN
              BEGIN
                Employee.TESTFIELD("Employee Posting Group");
                "Posting Group" := Employee."Employee Posting Group";
              END;
        
            EmpPostingGroup.GET("Posting Group");
            EmpPostingGroup.TESTFIELD("Salary Payable Acct");
            EmpPostingGroup.TESTFIELD("Part Of Salary Payable Acct");
            EmpPostingGroup.TESTFIELD("Reimbursement Salary Acct");
        
            DtldEmpLedgEntryLocal.LOCKTABLE;
            EmpLedgerEntry.LOCKTABLE;
        
            /////////////// Post Employee entry//////////////
            EmpLedgerEntry.CALCFIELDS(Amount,"Amount (LCY)","Remaining Amount","Remaining Amt. (LCY)",
                                             "Original Amount","Original Amt. (LCY)");
            TransferEmpLedgEntry(EmpLdgrEntryBufLocal,EmpLedgerEntry,TRUE);
        
            ApplyEmpLedgEntry(EmpLdgrEntryBufLocal,DtldEmpLedgEntryBufLocal,PayrollJournalLine,
                              NextTransactionNo,GLSetup."Appln. Rounding Precision");
        
            TransferEmpLedgEntry(EmpLdgrEntryBufLocal,EmpLedgerEntry,FALSE);
            EmpLedgerEntry.MODIFY;
        
            PostDtldEmpLedgEntries(PayrollJournalLine,DtldEmpLedgEntryBufLocal,EmpPostingGroup,NextTransactionNo,FALSE);
            FinishCodeunit;
          END;

    end;

    [LineStart(44494)]
    procedure TransferEmpLedgEntry(var RecEmpLdgrEntryBuf : Record "Emp Ledger Entry Buffer";var RecEmpLedgerEntry : Record "Employee Ledger Entry";EmpToCV : Boolean);
    begin
        IF EmpToCV THEN
          BEGIN
            RecEmpLdgrEntryBuf."Pay Journal Template":=RecEmpLedgerEntry."Pay Journal Template";
            RecEmpLdgrEntryBuf."Pay Journal Batch":= RecEmpLedgerEntry."Pay Journal Batch";

            RecEmpLdgrEntryBuf."Entry No." := RecEmpLedgerEntry."Entry No.";
            RecEmpLdgrEntryBuf."Employee No." := RecEmpLedgerEntry."Employee No.";

            RecEmpLdgrEntryBuf."Document Type" := RecEmpLedgerEntry."Document Type";
            RecEmpLdgrEntryBuf."Document No." := RecEmpLedgerEntry."Document No.";
            RecEmpLdgrEntryBuf."Document Date" := RecEmpLedgerEntry."Document Date";

            RecEmpLdgrEntryBuf."Posting Date" := RecEmpLedgerEntry."Posting Date";
            RecEmpLdgrEntryBuf."Posting Month":=RecEmpLedgerEntry."Posting Month";
            RecEmpLdgrEntryBuf."Posting Year":=RecEmpLedgerEntry."Posting Year";

            RecEmpLdgrEntryBuf."Employee Posting Group" := RecEmpLedgerEntry."Employee Posting Group";

            RecEmpLdgrEntryBuf.Description := RecEmpLedgerEntry.Description;
            RecEmpLdgrEntryBuf."Currency Code" := RecEmpLedgerEntry."Currency Code";
            RecEmpLdgrEntryBuf."Adjusted Currency Factor" := RecEmpLedgerEntry."Adjusted Currency Factor";
            RecEmpLdgrEntryBuf."Original Currency Factor" := RecEmpLedgerEntry."Original Currency Factor";

            RecEmpLdgrEntryBuf.Amount := RecEmpLedgerEntry.Amount;
            RecEmpLdgrEntryBuf."Amount (LCY)" := RecEmpLedgerEntry."Amount (LCY)";
            RecEmpLdgrEntryBuf."Remaining Amount" := RecEmpLedgerEntry."Remaining Amount";
            RecEmpLdgrEntryBuf."Remaining Amt. (LCY)" := RecEmpLedgerEntry."Remaining Amt. (LCY)";
            RecEmpLdgrEntryBuf."Original Amount" := RecEmpLedgerEntry."Original Amount";
            RecEmpLdgrEntryBuf."Original Amt. (LCY)" := RecEmpLedgerEntry."Original Amt. (LCY)";

            RecEmpLdgrEntryBuf."Debit Amount" := RecEmpLedgerEntry."Debit Amount";
            RecEmpLdgrEntryBuf."Credit Amount" := RecEmpLedgerEntry."Credit Amount";
            RecEmpLdgrEntryBuf."Debit Amount (LCY)" := RecEmpLedgerEntry."Debit Amount (LCY)";
            RecEmpLdgrEntryBuf."Credit Amount (LCY)" := RecEmpLedgerEntry."Credit Amount (LCY)";

            RecEmpLdgrEntryBuf."Bal. Account Type" := RecEmpLedgerEntry."Bal. Account Type";
            RecEmpLdgrEntryBuf."Bal. Account No." := RecEmpLedgerEntry."Bal. Account No.";

            RecEmpLdgrEntryBuf."Global Dimension 1 Code" := RecEmpLedgerEntry."Global Dimension 1 Code";
            RecEmpLdgrEntryBuf."Global Dimension 2 Code" := RecEmpLedgerEntry."Global Dimension 2 Code";
            RecEmpLdgrEntryBuf."User ID" := RecEmpLedgerEntry."User ID";
            RecEmpLdgrEntryBuf."Transaction No." := RecEmpLedgerEntry."Transaction No.";
            RecEmpLdgrEntryBuf."Source Code" := RecEmpLedgerEntry."Source Code";
            RecEmpLdgrEntryBuf."Reason Code" := RecEmpLedgerEntry."Reason Code";

            RecEmpLdgrEntryBuf."On Hold" := RecEmpLedgerEntry."On Hold";
            RecEmpLdgrEntryBuf."Applies-to Doc. Type" := RecEmpLedgerEntry."Applies-to Doc. Type";
            RecEmpLdgrEntryBuf."Applies-to Doc. No." := RecEmpLedgerEntry."Applies-to Doc. No.";
            RecEmpLdgrEntryBuf."Applies-to ID" := RecEmpLedgerEntry."Applies-to ID";

            RecEmpLdgrEntryBuf.Open := RecEmpLedgerEntry.Open;
            RecEmpLdgrEntryBuf."Due Date" := RecEmpLedgerEntry."Due Date" ;
            RecEmpLdgrEntryBuf.Positive := RecEmpLedgerEntry.Positive;
            RecEmpLdgrEntryBuf."Payment Indicator":=RecEmpLedgerEntry."Payment Indicator";

            RecEmpLdgrEntryBuf."Closed by Entry No." := RecEmpLedgerEntry."Closed by Entry No.";
            RecEmpLdgrEntryBuf."Closed at Date" := RecEmpLedgerEntry."Closed at Date";
            RecEmpLdgrEntryBuf."Closed by Amount" := RecEmpLedgerEntry."Closed by Amount";
            RecEmpLdgrEntryBuf."Closed by Amount (LCY)" := RecEmpLedgerEntry."Closed by Amount (LCY)";
            RecEmpLdgrEntryBuf."Closed by Currency Code" := RecEmpLedgerEntry."Closed by Currency Code";
            RecEmpLdgrEntryBuf."Closed by Currency Amount" := RecEmpLedgerEntry."Closed by Currency Amount";

          END
        ELSE
          BEGIN
            RecEmpLedgerEntry."Pay Journal Template":=RecEmpLdgrEntryBuf."Pay Journal Template";
            RecEmpLedgerEntry."Pay Journal Batch":=RecEmpLdgrEntryBuf."Pay Journal Batch";

            RecEmpLedgerEntry."Entry No." := RecEmpLdgrEntryBuf."Entry No.";
            RecEmpLedgerEntry."Employee No." := RecEmpLdgrEntryBuf."Employee No.";
            RecEmpLedgerEntry."Document Type" := RecEmpLdgrEntryBuf."Document Type";
            RecEmpLedgerEntry."Document No." := RecEmpLdgrEntryBuf."Document No.";
            RecEmpLedgerEntry."Document Date" := RecEmpLdgrEntryBuf."Document Date";

            RecEmpLedgerEntry."Posting Date" := RecEmpLdgrEntryBuf."Posting Date";
            RecEmpLedgerEntry."Posting Month":=RecEmpLdgrEntryBuf."Posting Month";
            RecEmpLedgerEntry."Posting Year":=RecEmpLdgrEntryBuf."Posting Year";
            RecEmpLedgerEntry."Employee Posting Group" := RecEmpLdgrEntryBuf."Employee Posting Group";

            RecEmpLedgerEntry.Description := RecEmpLdgrEntryBuf.Description;
            RecEmpLedgerEntry."Currency Code" := RecEmpLdgrEntryBuf."Currency Code";
            RecEmpLedgerEntry."Adjusted Currency Factor" := RecEmpLdgrEntryBuf."Adjusted Currency Factor";
            RecEmpLedgerEntry."Original Currency Factor" := RecEmpLdgrEntryBuf."Original Currency Factor";

            RecEmpLedgerEntry.Amount := RecEmpLdgrEntryBuf.Amount;
            RecEmpLedgerEntry."Amount (LCY)" := RecEmpLdgrEntryBuf."Amount (LCY)";
            RecEmpLedgerEntry."Remaining Amount" := RecEmpLdgrEntryBuf."Remaining Amount";
            RecEmpLedgerEntry."Remaining Amt. (LCY)" := RecEmpLdgrEntryBuf."Remaining Amt. (LCY)";
            RecEmpLedgerEntry."Original Amount" := RecEmpLdgrEntryBuf."Original Amount";
            RecEmpLedgerEntry."Original Amt. (LCY)" := RecEmpLdgrEntryBuf."Original Amt. (LCY)";
            RecEmpLedgerEntry."Debit Amount" := RecEmpLdgrEntryBuf."Debit Amount";
            RecEmpLedgerEntry."Credit Amount" := RecEmpLdgrEntryBuf."Credit Amount";
            RecEmpLedgerEntry."Debit Amount (LCY)" := RecEmpLdgrEntryBuf."Debit Amount (LCY)";
            RecEmpLedgerEntry."Credit Amount (LCY)" := RecEmpLdgrEntryBuf."Credit Amount (LCY)";

            RecEmpLedgerEntry."Bal. Account Type" := RecEmpLdgrEntryBuf."Bal. Account Type";
            RecEmpLedgerEntry."Bal. Account No." := RecEmpLdgrEntryBuf."Bal. Account No.";

            RecEmpLedgerEntry."Global Dimension 1 Code" := RecEmpLdgrEntryBuf."Global Dimension 1 Code";
            RecEmpLedgerEntry."Global Dimension 2 Code" := RecEmpLdgrEntryBuf."Global Dimension 2 Code";
            RecEmpLedgerEntry."User ID" := RecEmpLdgrEntryBuf."User ID";
            RecEmpLedgerEntry."Transaction No." := RecEmpLdgrEntryBuf."Transaction No.";
            RecEmpLedgerEntry."Source Code" := RecEmpLdgrEntryBuf."Source Code";
            RecEmpLedgerEntry."Reason Code" := RecEmpLdgrEntryBuf."Reason Code";

            RecEmpLedgerEntry."On Hold" := RecEmpLdgrEntryBuf."On Hold";
            RecEmpLedgerEntry."Applies-to Doc. Type" := RecEmpLdgrEntryBuf."Applies-to Doc. Type";
            RecEmpLedgerEntry."Applies-to Doc. No." := RecEmpLdgrEntryBuf."Applies-to Doc. No.";
            RecEmpLedgerEntry."Applies-to ID" := RecEmpLdgrEntryBuf."Applies-to ID";

            RecEmpLedgerEntry.Open := RecEmpLdgrEntryBuf.Open;
            RecEmpLedgerEntry."Due Date" := RecEmpLdgrEntryBuf."Due Date" ;
            RecEmpLedgerEntry.Positive := RecEmpLdgrEntryBuf.Positive;
            RecEmpLedgerEntry."Payment Indicator" :=RecEmpLdgrEntryBuf."Payment Indicator";

            RecEmpLedgerEntry."Closed by Entry No." := RecEmpLdgrEntryBuf."Closed by Entry No.";
            RecEmpLedgerEntry."Closed at Date" := RecEmpLdgrEntryBuf."Closed at Date";
            RecEmpLedgerEntry."Closed by Amount" := RecEmpLdgrEntryBuf."Closed by Amount";
            RecEmpLedgerEntry."Closed by Amount (LCY)" := RecEmpLdgrEntryBuf."Closed by Amount (LCY)";
            RecEmpLedgerEntry."Closed by Currency Code" := RecEmpLdgrEntryBuf."Closed by Currency Code";
            RecEmpLedgerEntry."Closed by Currency Amount" := RecEmpLdgrEntryBuf."Closed by Currency Amount";

          END;
    end;

    [LineStart(44619)]
    procedure PostDtldEmpLedgEntries(RecPayrollJournalLine : Record "Payroll Journal Line";var RecDtldEmpLedgEntryBuf : Record "Dtld Emp Ledg. Entry Buffer";RecEmployeePostingGroup : Record "Employee Posting Group";NextTransactionNo : Integer;EmpLedgEntryInserted : Boolean);
    var
        DtldEmpLedgEntryLocal : Record "Detailed Employee Ledg. Entry";
        Currencylocal : Record Currency;
        GenPostingSetupLocal : Record "General Posting Setup";
        TotalAmountLCY : Decimal;
        TotalAmountAddCurr : Decimal;
        PaymentDiscAcc : Code[20];
        DtldEmpLedgEntryNoOffset : Integer;
        PaymentTolAcc : Code[20];
    begin
        TotalAmountLCY := 0;
        TotalAmountAddCurr := 0;
        
        IF RecPayrollJournalLine."Account Type" = RecPayrollJournalLine."Account Type"::Employee THEN
          BEGIN
            IF DtldEmpLedgEntryLocal.FIND('+') THEN
              DtldEmpLedgEntryNoOffset := DtldEmpLedgEntryLocal."Entry No.";
            /*ELSE
              DtldEmpLedgEntryNoOffset := InitEntryNoInStore.GetCurrLocInitEntryNo(DATABASE::"Detailed Employee Ledg. Entry") - 1;*///B2b1.0
        
            RecDtldEmpLedgEntryBuf.RESET;
            IF RecDtldEmpLedgEntryBuf.FIND('-') THEN
              BEGIN
                REPEAT
                  CLEAR(DtldEmpLedgEntryLocal);
                  DtldEmpLedgEntryLocal.TRANSFERFIELDS(RecDtldEmpLedgEntryBuf);
                  DtldEmpLedgEntryLocal."Entry No." := DtldEmpLedgEntryNoOffset + RecDtldEmpLedgEntryBuf."Entry No.";
                  DtldEmpLedgEntryLocal."Pay Journal Template":= RecPayrollJournalLine."Pay Journal Template";
                  DtldEmpLedgEntryLocal."Pay Journal Batch":= RecPayrollJournalLine."Pay Journal Batch";
                  DtldEmpLedgEntryLocal."Reason Code" := RecPayrollJournalLine."Reason Code";
                  DtldEmpLedgEntryLocal."Source Code" := RecPayrollJournalLine."Source Code";
                  DtldEmpLedgEntryLocal."Transaction No." := NextTransactionNo;
                  EmpUpdateDebitCredit(RecPayrollJournalLine.Correction,DtldEmpLedgEntryLocal);
                  DtldEmpLedgEntryLocal.INSERT;
        
                  TotalAmountLCY := TotalAmountLCY + RecDtldEmpLedgEntryBuf."Amount (LCY)";
                  //TotalAmountAddCurr :=TotalAmountAddCurr + RecDtldEmpLedgEntryBuf."Additional-Currency Amount";
        
                  ////////////// Post automatic entries./////////////
                  /*
                  IF (RecDtldEmpLedgEntryBuf."Amount (LCY)" <> 0) OR
                     ((GLSetup."Additional Reporting Currency" <> '') AND
                      (RecDtldEmpLedgEntryBuf."Additional-Currency Amount" <> 0))
                  */
                  IF (RecDtldEmpLedgEntryBuf."Amount (LCY)" <> 0) OR (GLSetup."Additional Reporting Currency" <> '') THEN
                    CASE RecDtldEmpLedgEntryBuf."Entry Type" OF
                      RecDtldEmpLedgEntryBuf."Entry Type"::"Initial Entry":;
                      RecDtldEmpLedgEntryBuf."Entry Type"::Application:;
                      /*
                      RecDtldEmpLedgEntryBuf."Entry Type"::"Unrealized Loss":
                        BEGIN
                          IF Currency.Code <> RecDtldEmpLedgEntryBuf."Currency Code" THEN
                            BEGIN
                              IF RecDtldEmpLedgEntryBuf."Currency Code" = '' THEN
                                CLEAR(Currency)
                              ELSE
                                Currency.GET(RecDtldEmpLedgEntryBuf."Currency Code");
                            END;
        
                          CheckNonAddCurrCodeOccurred(Currency.Code);
                          Currency.TESTFIELD("Unrealized Losses Acc.");
        
                          InitGLEntry(Currency."Unrealized Losses Acc.",(-RecDtldEmpLedgEntryBuf."Amount (LCY)"),
                                      0,RecDtldEmpLedgEntryBuf."Currency Code" = GLSetup."Additional Reporting Currency",
                                      TRUE);
                          InsertGLEntry(TRUE);
                        END;
                      RecDtldEmpLedgEntryBuf."Entry Type"::"Unrealized Gain":
                        BEGIN
                          IF Currency.Code <> RecDtldEmpLedgEntryBuf."Currency Code" THEN
                            BEGIN
                              IF RecDtldEmpLedgEntryBuf."Currency Code" = '' THEN
                                CLEAR(Currency)
                              ELSE
                                Currency.GET(RecDtldEmpLedgEntryBuf."Currency Code");
                            END;
        
                          CheckNonAddCurrCodeOccurred(Currency.Code);
                          Currency.TESTFIELD("Unrealized Gains Acc.");
                          InitGLEntry(Currency."Unrealized Gains Acc.",(-RecDtldEmpLedgEntryBuf."Amount (LCY)"),
                                      0,RecDtldEmpLedgEntryBuf."Currency Code" = GLSetup."Additional Reporting Currency",
                                      TRUE);
                          InsertGLEntry(TRUE);
                        END;
                      RecDtldEmpLedgEntryBuf."Entry Type"::"Realized Loss":
                        BEGIN
                          IF Currency.Code <> RecDtldEmpLedgEntryBuf."Currency Code" THEN
                            BEGIN
                              IF RecDtldEmpLedgEntryBuf."Currency Code" = '' THEN
                                CLEAR(Currency)
                              ELSE
                                Currency.GET(RecDtldEmpLedgEntryBuf."Currency Code");
                            END;
                          CheckNonAddCurrCodeOccurred(Currency.Code);
                          Currency.TESTFIELD("Realized Losses Acc.");
                          InitGLEntry(Currency."Realized Losses Acc.",(-RecDtldEmpLedgEntryBuf."Amount (LCY)"),
                                      0,RecDtldEmpLedgEntryBuf."Currency Code" = GLSetup."Additional Reporting Currency",
                                      TRUE);
                          InsertGLEntry(TRUE);
                        END;
                      RecDtldEmpLedgEntryBuf."Entry Type"::"Realized Gain":
                        BEGIN
                          IF Currency.Code <> RecDtldEmpLedgEntryBuf."Currency Code" THEN
                            BEGIN
                              IF RecDtldEmpLedgEntryBuf."Currency Code" = '' THEN
                                CLEAR(Currency)
                              ELSE
                                Currency.GET(RecDtldEmpLedgEntryBuf."Currency Code");
                            END;
        
                          CheckNonAddCurrCodeOccurred(Currency.Code);
                          Currency.TESTFIELD("Realized Gains Acc.");
                          InitGLEntry(Currency."Realized Gains Acc.",(-RecDtldEmpLedgEntryBuf."Amount (LCY)"),
                                      0,RecDtldEmpLedgEntryBuf."Currency Code" = GLSetup."Additional Reporting Currency",
                                      TRUE);
                          InsertGLEntry(TRUE);
                        END;
                    RecDtldEmpLedgEntryBuf."Entry Type"::"Appln. Rounding":
                      BEGIN
                        IF (-RecDtldEmpLedgEntryBuf."Amount (LCY)") > 0 THEN
                          BEGIN
                            EmpPostingGroup.TESTFIELD("Debit Curr. Appln. Rndg. Acc.");
                            InitGLEntry(EmpPostingGroup."Debit Curr. Appln. Rndg. Acc.",
                                        (-RecDtldEmpLedgEntryBuf."Amount (LCY)"),
                                        (-RecDtldEmpLedgEntryBuf."Additional-Currency Amount"),
                                        TRUE,TRUE);
                            InsertGLEntry(TRUE);
                          END;
                        IF (-RecDtldEmpLedgEntryBuf."Amount (LCY)") < 0 THEN
                          BEGIN
                            EmpPostingGroup.TESTFIELD("Credit Curr. Appln. Rndg. Acc.");
                            InitGLEntry(EmpPostingGroup."Credit Curr. Appln. Rndg. Acc.",
                                        (-RecDtldEmpLedgEntryBuf."Amount (LCY)"),
                                        (-RecDtldEmpLedgEntryBuf."Additional-Currency Amount"),
                                        TRUE,TRUE);
                            InsertGLEntry(TRUE);
                          END;
                      END;
                    RecDtldEmpLedgEntryBuf."Entry Type"::"Correction of Remaining Amount":
                      BEGIN
                        IF (-RecDtldEmpLedgEntryBuf."Amount (LCY)") > 0 THEN
                          BEGIN
                            EmpPostingGroup.TESTFIELD("Debit Rounding Account");
                            InitGLEntry(EmpPostingGroup."Debit Rounding Account",(-RecDtldEmpLedgEntryBuf."Amount (LCY)"),
                                        0,FALSE,TRUE);
                            GLEntry."Additional-Currency Amount" := 0;
                            InsertGLEntry(TRUE);
                          END;
                        IF (-RecDtldEmpLedgEntryBuf."Amount (LCY)") < 0 THEN
                          BEGIN
                            EmpPostingGroup.TESTFIELD("Credit Rounding Account");
                            InitGLEntry(EmpPostingGroup."Credit Rounding Account",
                                        (-RecDtldEmpLedgEntryBuf."Amount (LCY)"),0,FALSE,TRUE);
                            GLEntry."Additional-Currency Amount" := 0;
                            InsertGLEntry(TRUE);
                          END;
                        END;
                    */
                    ELSE
                      RecDtldEmpLedgEntryBuf.FIELDERROR("Entry Type");
                  END;
        
                UNTIL RecDtldEmpLedgEntryBuf.NEXT = 0;
              END;
        
            IF EmpLedgEntryInserted OR (TotalAmountLCY <> 0) OR
               (TotalAmountAddCurr <> 0) AND (GLSetup."Additional Reporting Currency" <> '')
            THEN
              IF (TotalAmountLCY <> 0)  THEN
                BEGIN
                    BEGIN
                      //////////New Added
                      IF (RecPayrollJournalLine."Payment Indicator"=RecPayrollJournalLine."Payment Indicator"::Reimbursement) THEN
                        BEGIN
                          InitGLEntry(EmpPostingGroup."Reimbursement Salary Acct",(TotalAmountLCY),(TotalAmountAddCurr),TRUE,TRUE);
                          InsertGLEntry(TRUE);
                        END
                      ELSE IF (RecPayrollJournalLine."Payment Indicator"=RecPayrollJournalLine."Payment Indicator"::Include) THEN
                        BEGIN
                          InitGLEntry(EmpPostingGroup."Salary Payable Acct",(TotalAmountLCY),(TotalAmountAddCurr),TRUE,TRUE);
                          InsertGLEntry(TRUE);
                        END
                      //ELSE IF (RecPayrollJournalLine."Payment Indicator"=RecPayrollJournalLine."Payment Indicator"::Exclude) THEN
                      ELSE
                        BEGIN
                          InitGLEntry(EmpPostingGroup."Part Of Salary Payable Acct",(TotalAmountLCY),(TotalAmountAddCurr),TRUE,TRUE);
                          InsertGLEntry(TRUE);
                        END;
                    END;
                END;
        
              //////New Added By Tanmoy
              IF NOT GLEntryTmp.FIND('-') AND RecDtldEmpLedgEntryBuf.FIND('-') THEN
                BEGIN
                  //////////New Added
                  IF (RecPayrollJournalLine."Payment Indicator"=RecPayrollJournalLine."Payment Indicator"::Reimbursement) THEN
                    BEGIN
                      InitGLEntry(EmpPostingGroup."Reimbursement Salary Acct",0,0,FALSE,TRUE);
                      InsertGLEntry(FALSE);
                    END
                  ELSE IF (RecPayrollJournalLine."Payment Indicator"=RecPayrollJournalLine."Payment Indicator"::Include) THEN
                    BEGIN
                      InitGLEntry(EmpPostingGroup."Salary Payable Acct",0,0,FALSE,TRUE);
                      InsertGLEntry(FALSE);
                    END
                  //ELSE IF (RecPayrollJournalLine."Payment Indicator"=RecPayrollJournalLine."Payment Indicator"::Exclude) THEN
                  ELSE
                    BEGIN
                      InitGLEntry(EmpPostingGroup."Part Of Salary Payable Acct",0,0,FALSE,TRUE);
                      InsertGLEntry(FALSE);
                    END;
                END;
        
              RecDtldEmpLedgEntryBuf.DELETEALL;
          END;

    end;

    [LineStart(44826)]
    local procedure EmpUpdateDebitCredit(Correction : Boolean;var RecDtldEmpLedgEntry : Record "Detailed Employee Ledg. Entry");
    begin
        WITH RecDtldEmpLedgEntry DO
          BEGIN
            IF ((Amount > 0) OR ("Amount (LCY)" > 0)) AND NOT Correction OR
               ((Amount < 0) OR ("Amount (LCY)" < 0)) AND Correction
            THEN
              BEGIN
                "Debit Amount" := Amount;

                "Credit Amount" := 0;
                "Debit Amount (LCY)" := "Amount (LCY)";
                "Credit Amount (LCY)" := 0;
              END
            ELSE
              BEGIN
                "Debit Amount" := 0;
                "Credit Amount" := -Amount;
                "Debit Amount (LCY)" := 0;
                "Credit Amount (LCY)" := -"Amount (LCY)";
              END;
          END;
    end;

    [LineStart(44848)]
    local procedure UpdateCalcInterest(var RecEmpLdgrEntryBuf : Record "Emp Ledger Entry Buffer");
    var
        EmpLdgrEntryBufLocal2 : Record "Emp Ledger Entry Buffer";
        EmpLedgerEntryLocal : Record "Employee Ledger Entry";
    begin
        WITH RecEmpLdgrEntryBuf DO
          BEGIN
            IF EmpLedgerEntryLocal.GET("Closed by Entry No.") THEN
              BEGIN
                EmpLdgrEntryBufLocal2.TRANSFERFIELDS(EmpLedgerEntryLocal);
                UpdateCalcInterest2(RecEmpLdgrEntryBuf,EmpLdgrEntryBufLocal2);
              END;

            EmpLedgerEntryLocal.SETCURRENTKEY("Closed by Entry No.");
            EmpLedgerEntryLocal.SETRANGE("Closed by Entry No.","Entry No.");
            IF EmpLedgerEntryLocal.FIND('-') THEN
              REPEAT
                EmpLdgrEntryBufLocal2.TRANSFERFIELDS(EmpLedgerEntryLocal);
                UpdateCalcInterest2(RecEmpLdgrEntryBuf,EmpLdgrEntryBufLocal2);
              UNTIL EmpLedgerEntryLocal.NEXT = 0;
          END;
    end;

    [LineStart(44866)]
    local procedure UpdateCalcInterest2(var RecEmpLdgrEntryBuf : Record "Emp Ledger Entry Buffer";var RecEmpLdgrEntryBuf2 : Record "Emp Ledger Entry Buffer");
    begin
        /*C
        WITH RecEmpLdgrEntryBuf DO
          IF "Due Date" < RecEmpLdgrEntryBuf2."Document Date" THEN
            "Calculate Interest" := TRUE;
        */

    end;

    [LineStart(44873)]
    procedure GLCalcAddCurrency(AddCurrAmount : Decimal;UseAddCurrAmount : Boolean);
    begin
        /*C
        IF (GLSetup."Additional Reporting Currency" <> '') AND
           (PayrollJournalLine."Additional-Currency Posting" = PayrollJournalLine."Additional-Currency Posting"::None)
        THEN
          BEGIN
            IF (PayrollJournalLine."Source Currency Code" = GLSetup."Additional Reporting Currency") AND UseAddCurrAmount THEN
              GLEntry."Additional-Currency Amount" := AddCurrAmount
            ELSE
              GLEntry."Additional-Currency Amount" := ExchangeAmtLCYToFCY2(GLEntry.Amount);
          END;
        */

    end;

    [LineStart(44886)]
    procedure HandleAddCurrResidualGLEntry();
    var
        TableID : array [10] of Integer;
        AccNo : array [10] of Code[20];
    begin
        /*C
        IF GLSetup."Additional Reporting Currency" = '' THEN
          EXIT;
        
        TotalAddCurrAmount := TotalAddCurrAmount + GLEntry."Additional-Currency Amount";
        TotalAmount := TotalAmount + GLEntry.Amount;
        
        IF (PayrollJournalLine."Additional-Currency Posting" = PayrollJournalLine."Additional-Currency Posting"::None) AND
           (TotalAmount = 0) AND  (TotalAddCurrAmount <> 0) AND
           CheckNonAddCurrCodeOccurred(PayrollJournalLine."Source Currency Code")
        THEN
          BEGIN
            OrigGLEntry := GLEntry;
            GLEntry.INIT;
            GLEntry."Posting Date" := PayrollJournalLine."Posting Date";
            GLEntry.Month := PayrollJournalLine."Posting Month";
            GLEntry.Year := PayrollJournalLine."Posting Year";
        
            GLEntry."Document Date" := PayrollJournalLine."Document Date";
            GLEntry."Document Type" := PayrollJournalLine."Document Type";
            GLEntry."Document No." := PayrollJournalLine."Document No.";
            GLEntry.Description :=COPYSTR(STRSUBSTNO(Text010,
                                                     GLEntry.FIELDCAPTION("Additional-Currency Amount")),
                                                     1,MAXSTRLEN(GLEntry.Description));
        
            GLEntry."Global Dimension 1 Code" := PayrollJournalLine."Global Dimension 1 Code";
            GLEntry."Global Dimension 2 Code" := PayrollJournalLine."Global Dimension 2 Code";
            GLEntry."Source Code" := PayrollJournalLine."Source Code";
            GLEntry."Source Type" := 0;
            GLEntry."Source No." := '';
        
            GLEntry."Journal Batch Name" := PayrollJournalLine."Pay Journal Batch";
            GLEntry."Reason Code" :=  PayrollJournalLine."Reason Code";
            GLEntry."Entry No." := NextEntryNo;
            GLEntry."Transaction No." := NextTransactionNo;
        
            GLEntry.Amount := 0;
            GLEntry."User ID" := USERID;
        
            GLEntry."System-Created Entry" := TRUE;
            GLEntry."Prior-Year Entry" := GLEntry."Posting Date" < FiscalYearStartDate;
            GLAcc.GET(GLEntry."G/L Account No.");
            GLAcc.TESTFIELD(Blocked,FALSE);
            GLAcc.TESTFIELD("Account Type",GLAcc."Account Type"::Posting);
            InsertGLEntry(FALSE);
        
            GLAcc.GET(GLEntry."G/L Account No.");
            GLAcc.TESTFIELD(Blocked,FALSE);
            GLAcc.TESTFIELD("Account Type",GLAcc."Account Type"::Posting);
        
            ///New Added By tanmoy
            TableID[1] := DimMgt.TypeToTableID1(DimMgrAccountType::"G/L Account");
            //TableID[1] := DimMgt.TypeToTableID1(PayrollJournalLine."Account Type"::"G/L Account");
            AccNo[1] := GLEntry."G/L Account No.";
        
            IF NOT DimMgt.CheckJnlLineDimValuePosting(TempJnlLineDim,TableID,AccNo) THEN
              IF PayrollJournalLine."Line No." <> 0 THEN
                ERROR(Text013,
                      PayrollJournalLine.TABLECAPTION,
                      PayrollJournalLine."Pay Journal Template",
                      PayrollJournalLine."Pay Journal Batch",PayrollJournalLine."Line No.",
                      DimMgt.GetDimValuePostingErr)
              ELSE
                ERROR(DimMgt.GetDimValuePostingErr);
        
            GLEntry := OrigGLEntry;
            TotalAddCurrAmount := 0;
          END;
        */

    end;

    [LineStart(44957)]
    local procedure CalcLCYToAddCurr(AmountLCY : Decimal) : Decimal;
    begin
        IF GLSetup."Additional Reporting Currency" = '' THEN
          EXIT;

        EXIT(ExchangeAmtLCYToFCY2(AmountLCY));
    end;

    [LineStart(44963)]
    procedure CalcAddCurrFactor(Numerator : Decimal;Denominator : Decimal) : Decimal;
    begin
        IF Denominator = 0 THEN
          EXIT(0);

        IF Numerator <> 0 THEN
          EXIT(Numerator / Denominator)
        ELSE
          IF GLSetup."Additional Reporting Currency" <> '' THEN
            CalcLCYToAddCurr(1)
          ELSE
            EXIT(0);
    end;

    [LineStart(44975)]
    procedure GetCurrencyExchRate();
    var
        NewCurrencyDate : Date;
    begin
        IF GLSetup."Additional Reporting Currency" <> '' THEN
          BEGIN
            IF GLSetup."Additional Reporting Currency" <> AddCurrency.Code THEN
              BEGIN
                AddCurrency.GET(GLSetup."Additional Reporting Currency");
                AddCurrency.TESTFIELD("Amount Rounding Precision");
                AddCurrency.TESTFIELD("Residual Gains Account");
                AddCurrency.TESTFIELD("Residual Losses Account");
              END;

            NewCurrencyDate := PayrollJournalLine."Posting Date";
            //IF PayrollJournalLine."Reversing Entry" THEN
              //NewCurrencyDate := NewCurrencyDate - 1;

            IF (NewCurrencyDate <> CurrencyDate) OR UseCurrFactorOnly THEN
              BEGIN
                UseCurrFactorOnly := FALSE;
                CurrencyDate := NewCurrencyDate;
                CurrencyFactor := CurrExchRate.ExchangeRate(
                                    CurrencyDate,GLSetup."Additional Reporting Currency");
              END;
          END;
    end;

    [LineStart(44999)]
    procedure ExchAmount(Amount : Decimal;FromCurrencyCode : Code[10];ToCurrencyCode : Code[10];UsePostingDate : Date) : Decimal;
    var
        ToCurrency : Record Currency;
    begin
        IF (FromCurrencyCode = ToCurrencyCode) OR (Amount = 0) THEN
          EXIT(Amount);

        Amount :=CurrExchRate.ExchangeAmtFCYToFCY(UsePostingDate,FromCurrencyCode,ToCurrencyCode,Amount);

        IF ToCurrencyCode <> '' THEN
          BEGIN
            ToCurrency.GET(ToCurrencyCode);
            Amount := ROUND(Amount,ToCurrency."Amount Rounding Precision");
          END
        ELSE
          Amount := ROUND(Amount);

        EXIT(Amount);
    end;

    [LineStart(45015)]
    local procedure ExchangeAmtLCYToFCY2(Amount : Decimal) : Decimal;
    begin
        IF UseCurrFactorOnly THEN
          EXIT(ROUND(CurrExchRate.ExchangeAmtLCYToFCYOnlyFactor(Amount,CurrencyFactor),
               AddCurrency."Amount Rounding Precision"));

        EXIT(ROUND(CurrExchRate.ExchangeAmtLCYToFCY(CurrencyDate,GLSetup."Additional Reporting Currency",Amount,CurrencyFactor),
                   AddCurrency."Amount Rounding Precision"));
    end;

    [LineStart(45023)]
    local procedure InsertFAAllocDim(EntryNo : Integer) : Boolean;
    begin
        IF FAGLPostBuf.GET(EntryNo) THEN
          BEGIN
            //DIM1.0 Start
            //Code Commented
            /*
            TempFAJnlLineDim.DELETEALL;
            FAAllocDim.SETRANGE(Code,FAGLPostBuf."FA Posting Group");
            FAAllocDim.SETRANGE("Allocation Type",FAGLPostBuf."FA Allocation Type");
            FAAllocDim.SETRANGE("Line No.",FAGLPostBuf."FA Allocation Line No.");
            IF FAAllocDim.FIND('-') THEN
              REPEAT
                TempFAJnlLineDim."Dimension Code" := FAAllocDim."Dimension Code";
                TempFAJnlLineDim."Dimension Value Code" := FAAllocDim."Dimension Value Code";
                TempFAJnlLineDim.INSERT;
              UNTIL FAAllocDim.NEXT = 0;
            */
            /*
            DimMgt.MoveJnlLineDimToLedgEntryDim(TempFAJnlLineDim,DATABASE::"G/L Entry",EntryNo);
            FAGLPostBuf.DELETE;
            */
            //DIM1.0 End
            EXIT(TRUE);
          END
        ELSE
          EXIT(FALSE);

    end;

    [LineStart(45050)]
    local procedure CheckNonAddCurrCodeOccurred(CurrencyCode : Code[10]) : Boolean;
    begin
        NonAddCurrCodeOccured :=NonAddCurrCodeOccured OR (GLSetup."Additional Reporting Currency" <>  CurrencyCode);
        EXIT(NonAddCurrCodeOccured);
    end;

    [LineStart(45054)]
    procedure CheckCalcPmtDiscCEEmp(var RecNewEmpLdgrEntryBuf : Record "Emp Ledger Entry Buffer";var RecOldEmpLedgerEntry2 : Record "Employee Ledger Entry";ApplnRoundingPrecision : Decimal;CheckFilter : Boolean;CheckAmount : Boolean) : Boolean;
    var
        OldEmpLedgerEntryBufLocal2 : Record "Emp Ledger Entry Buffer";
    begin
        RecOldEmpLedgerEntry2.COPYFILTER(Positive,OldEmpLedgerEntryBufLocal2.Positive);
        TransferEmpLedgEntry(OldEmpLedgerEntryBufLocal2,RecOldEmpLedgerEntry2,TRUE);
        //EXIT(CheckCalcPmtDisc(RecNewEmpLdgrEntryBuf,OldEmpLedgerEntryBufLocal2,
        //                        ApplnRoundingPrecision,CheckFilter,CheckAmount));
    end;

    [LineStart(45060)]
    procedure CheckCalcPmtDiscEmp(var RecNewEmpLedgerEntry : Record "Employee Ledger Entry";var RecOldEmpLedgerEntry2 : Record "Employee Ledger Entry";ApplnRoundingPrecision : Decimal;CheckFilter : Boolean;CheckAmount : Boolean) : Boolean;
    var
        NewEmpLdgrEntryBufLocal : Record "Emp Ledger Entry Buffer";
        OldEmpLdgrEntryBufLocal2 : Record "Emp Ledger Entry Buffer";
    begin
        TransferEmpLedgEntry(NewEmpLdgrEntryBufLocal,RecNewEmpLedgerEntry,TRUE);
        RecOldEmpLedgerEntry2.COPYFILTER(Positive,OldEmpLdgrEntryBufLocal2.Positive);
        TransferEmpLedgEntry(OldEmpLdgrEntryBufLocal2,RecOldEmpLedgerEntry2,TRUE);
        EXIT(CheckCalcPmtDisc(NewEmpLdgrEntryBufLocal,OldEmpLdgrEntryBufLocal2,ApplnRoundingPrecision,CheckFilter,CheckAmount));
    end;

    [LineStart(45066)]
    procedure CheckCalcPmtDiscGenJnlEmp(RecPayrollJournalLine : Record "Payroll Journal Line";RecOldEmpLedgerEntry2 : Record "Employee Ledger Entry";ApplnRoundingPrecision : Decimal;CheckAmount : Boolean) : Boolean;
    var
        NewEmpLdgrEntryBufLocal : Record "Emp Ledger Entry Buffer";
        OldEmpLdgrEntryBufLocal2 : Record "Emp Ledger Entry Buffer";
    begin
        NewEmpLdgrEntryBufLocal."Document Type" := RecPayrollJournalLine."Document Type";
        NewEmpLdgrEntryBufLocal."Posting Date" := RecPayrollJournalLine."Posting Date";
        NewEmpLdgrEntryBufLocal."Remaining Amount" := RecPayrollJournalLine.Amount;
        TransferEmpLedgEntry(OldEmpLdgrEntryBufLocal2,RecOldEmpLedgerEntry2,TRUE);
        EXIT(CheckCalcPmtDisc(NewEmpLdgrEntryBufLocal,OldEmpLdgrEntryBufLocal2,ApplnRoundingPrecision,FALSE,CheckAmount));
    end;

    [LineStart(45073)]
    procedure CheckCalcPmtDisc(var RecNewEmpLdgrEntryBuf : Record "Emp Ledger Entry Buffer";var RecOldEmpLdgrEntryBuf2 : Record "Emp Ledger Entry Buffer";ApplnRoundingPrecision : Decimal;CheckFilter : Boolean;CheckAmount : Boolean) : Boolean;
    begin
        /*C
        IF (((RecNewEmpLdgrEntryBuf."Document Type" = RecNewEmpLdgrEntryBuf."Document Type"::Refund) OR
             (RecNewEmpLdgrEntryBuf."Document Type" = RecNewEmpLdgrEntryBuf."Document Type"::Payment)) AND
            (((RecOldEmpLdgrEntryBuf2."Document Type" = RecOldEmpLdgrEntryBuf2."Document Type"::"Credit Memo") AND
              (RecOldEmpLdgrEntryBuf2."Remaining Pmt. Disc. Possible" <> 0) AND
              (RecNewEmpLdgrEntryBuf."Posting Date" <= RecOldEmpLdgrEntryBuf2."Pmt. Discount Date")) OR
              ((RecOldEmpLdgrEntryBuf2."Document Type" = RecOldEmpLdgrEntryBuf2."Document Type"::Invoice) AND
               (RecNewEmpLdgrEntryBuf."Posting Date" <= RecOldEmpLdgrEntryBuf2."Pmt. Discount Date"))))
        THEN
          BEGIN
            IF CheckFilter THEN
              BEGIN
                IF CheckAmount THEN
                  BEGIN
                    IF (RecOldEmpLdgrEntryBuf2.GETFILTER(Positive) <> '') OR
                       (ABS(RecNewEmpLdgrEntryBuf."Remaining Amount") + ApplnRoundingPrecision >=
                        ABS(RecOldEmpLdgrEntryBuf2."Remaining Amount" - RecOldEmpLdgrEntryBuf2."Remaining Pmt. Disc. Possible"))
                    THEN
                      EXIT(TRUE)
                    ELSE
                      EXIT(FALSE);
                  END
                ELSE
                  BEGIN
                    IF (RecOldEmpLdgrEntryBuf2.GETFILTER(Positive) <> '') THEN
                      EXIT(TRUE)
                    ELSE
                      EXIT(FALSE);
                  END;
              END
            ELSE
              BEGIN
                IF CheckAmount THEN
                  BEGIN
                    IF (ABS(RecNewEmpLdgrEntryBuf."Remaining Amount") + ApplnRoundingPrecision >=
                        ABS(RecOldEmpLdgrEntryBuf2."Remaining Amount" - RecOldEmpLdgrEntryBuf2."Remaining Pmt. Disc. Possible"))
                    THEN
                      EXIT(TRUE)
                    ELSE
                      EXIT(FALSE);
                  END
                ELSE
                  EXIT(TRUE);
              END;
            EXIT(TRUE);
          END
        ELSE
          EXIT(FALSE);
        */

    end;
}

