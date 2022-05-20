codeunit 33000013 "Payroll Jnl.-Check Line"
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

    Permissions = TableData "General Posting Setup"=rimd;
    TableNo = "Payroll Journal Line";

    trigger OnRun();
    begin
        GLSetup.GET;
        //DIM1.0 Start
        //Code Commented
        /*
        IF "Global Dimension 1 Code" <> '' THEN BEGIN
          TempJnlLineDimLocal."Table ID" := DATABASE::"Payroll Journal Line";
          TempJnlLineDimLocal."Journal Template Name" := "Pay Journal Template";
          TempJnlLineDimLocal."Journal Batch Name" :="Pay Journal Batch";
          TempJnlLineDimLocal."Journal Line No." := "Line No.";
          TempJnlLineDimLocal."Dimension Code" := GLSetup."Global Dimension 1 Code";
          TempJnlLineDimLocal."Dimension Value Code" := "Global Dimension 1 Code";
          TempJnlLineDimLocal.INSERT;
        END;
        IF "Global Dimension 2 Code" <> '' THEN BEGIN
          TempJnlLineDimLocal."Table ID" := DATABASE::"Payroll Journal Line";
          TempJnlLineDimLocal."Journal Template Name" :="Pay Journal Template";
          TempJnlLineDimLocal."Journal Batch Name" :="Pay Journal Batch";
          TempJnlLineDimLocal."Journal Line No." := "Line No.";
          TempJnlLineDimLocal."Dimension Code" := GLSetup."Global Dimension 2 Code";
          TempJnlLineDimLocal."Dimension Value Code" := "Global Dimension 2 Code";
          TempJnlLineDimLocal.INSERT;
        END;
        RunCheck(Rec,TempJnlLineDimLocal);
        */
        RunCheck(Rec);
        //DIM1.0 End

    end;

    var
        AccountingPeriod : Record "Accounting Period";
        GLSetup : Record "General Ledger Setup";
        UserSetup : Record "User Setup";
        DimMgt : Codeunit DimensionManagement;
        AllowPostingFrom : Date;
        AllowPostingTo : Date;
        Text000 : Label 'can only be a closing date for G/L entries';
        Text001 : Label 'is not within your range of allowed posting dates';
        Text002 : Label '%1 or %2 must be G/L Account or Bank Account.';
        Text003 : Label 'must have the same sign as %1';
        Text004 : Label 'You must not specify %1 when %2 is %3.';
        Text005 : Label '%1 + %2 must be %3.';
        Text006 : Label '%1 + %2 must be -%3.';
        Text007 : Label 'must be positive';
        Text008 : Label 'must be negative';
        Text009 : Label 'must have a different sign than %1';
        Text010 : Label '%1 %2 and %3 %4 is not allowed.';
        Text011 : Label 'The combination of dimensions used in %1 %2, %3, %4 is blocked. %5';
        Text012 : Label 'A dimension used in %1 %2, %3, %4 has caused an error. %5';
        DimMgrAccountType : Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset",Employee," ";
        DimMgrBalAccountType : Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset",Employee," ";

    [LineStart(45152)]
    procedure RunCheck(var RecPayrollJournalLine : Record "Payroll Journal Line");
    var
        PaymentTerms : Record "Payment Terms";
        TableID : array [10] of Integer;
        No : array [10] of Code[20];
        EmployeeLocal : Record Employee;
        "-NAVIN-" : ;
        Text13700 : Label 'Excise Record must be specified for Line No. %1';
    begin
        WITH RecPayrollJournalLine DO
          BEGIN
            IF EmptyLine THEN
              EXIT;
        
            TESTFIELD("Posting Date");
            IF "Posting Date" <> NORMALDATE("Posting Date") THEN
              BEGIN
                IF ("Account Type" <> "Account Type"::"G/L Account") OR
                   ("Bal. Account Type" <> "Bal. Account Type"::"G/L Account") THEN
                  FIELDERROR("Posting Date",Text000);
        
                AccountingPeriod.GET(NORMALDATE("Posting Date") + 1);
                AccountingPeriod.TESTFIELD("New Fiscal Year",TRUE);
                AccountingPeriod.TESTFIELD("Date Locked",TRUE);
              END;
        
            IF DateNotAllowed("Posting Date") THEN
              FIELDERROR("Posting Date",Text001);
        
            IF ("Document Date" <> 0D) THEN
              IF ("Document Date" <> NORMALDATE("Document Date")) AND
                 (("Account Type" <> "Account Type"::"G/L Account") OR
                  ("Bal. Account Type" <> "Bal. Account Type"::"G/L Account"))
              THEN
                FIELDERROR("Document Date",Text000);
        
            TESTFIELD("Document No.");
        
        
            IF ("Account Type" IN ["Account Type"::Employee]) AND
               ("Bal. Account Type" IN ["Bal. Account Type"::Employee])
            THEN
              ERROR(Text002, FIELDCAPTION("Account Type"),FIELDCAPTION("Bal. Account Type"));
        
            IF "Bal. Account No." = '' THEN
              TESTFIELD("Account No.");
        
            /*
            IF ("Account No." <> '') AND
               NOT "System-Created Entry" AND
               ("Pay Posting Type"= RecPayrollJournalLine."Pay Posting Type"::" ") AND
               NOT "Allow Zero-Amount Posting"
            THEN
              TESTFIELD(Amount);
            */
        
            IF Amount * "Amount (LCY)" < 0 THEN
              FIELDERROR("Amount (LCY)",STRSUBSTNO(Text003,FIELDCAPTION(Amount)));
        
            IF ("Account Type" = "Account Type"::"G/L Account") AND
               ("Bal. Account Type" = "Bal. Account Type"::"G/L Account") THEN
              TESTFIELD("Applies-to Doc. No.",'');
        
            IF "Account No." <> '' THEN
              CASE "Account Type" OF
                "Account Type"::Employee:
                  BEGIN
                    TESTFIELD("Pay Posting Type",0);
                    TESTFIELD("Pay Bus. Posting Group",'');
                    TESTFIELD("Pay Prod. Posting Group",'');
        
                    IF "Account Type" = "Account Type"::Employee THEN
                      IF EmployeeLocal.GET("Account No.") THEN;
                        //EmployeeLocal.CheckBlockedVendOnJnls(EmployeeLocal,"Document Type",TRUE);
                  END;
        
                "Account Type"::"Bank Account":
                  BEGIN
                    TESTFIELD("Pay Posting Type",0);
                    TESTFIELD("Pay Bus. Posting Group",'');
                    TESTFIELD("Pay Prod. Posting Group",'');
                    /*
                    IF (Amount < 0) AND ("Bank Payment Type" = "Bank Payment Type"::"Computer Check") THEN
                      TESTFIELD("Check Printed",TRUE);
                    */
                  END;
        
              END;
        
            IF "Bal. Account No." <> '' THEN
              CASE "Bal. Account Type" OF
                "Bal. Account Type"::Employee:
                  BEGIN
                    TESTFIELD("Bal. Pay Posting Type",0);
                    TESTFIELD("Bal. Pay Bus. Posting Group",'');
                    TESTFIELD("Bal. Pay Prod. Posting Group",'');
        
                    IF "Bal. Account Type" = "Bal. Account Type"::Employee THEN
                      IF EmployeeLocal.GET("Bal. Account No.") THEN;
                        //EmployeeLocal.CheckBlockedVendOnJnls(EmployeeLocal,"Document Type",TRUE);
                  END;
                "Bal. Account Type"::"Bank Account":
                  BEGIN
                    TESTFIELD("Bal. Pay Posting Type",0);
                    TESTFIELD("Bal. Pay Bus. Posting Group",'');
                    TESTFIELD("Bal. Pay Prod. Posting Group",'');
                    /*
                    IF (Amount > 0) AND ("Bank Payment Type" = "Bank Payment Type"::"Computer Check") THEN
                      TESTFIELD("Check Printed",TRUE);
                    */
                  END;
              END;
            /*
            IF NOT PaymentTerms.GET(RecPayrollJournalLine."Payment Terms Code") THEN
              CLEAR(PaymentTerms);
            IF (("Account Type" = "Account Type"::"G/L Account") AND
                ("Bal. Account Type" = "Bal. Account Type"::"G/L Account"))
            THEN
              BEGIN
                TESTFIELD("Pmt. Discount Date",0D);
                TESTFIELD("Payment Discount %",0);
              END;
            */
        
            IF (("Account Type" = "Account Type"::"G/L Account") AND
                ("Bal. Account Type" = "Bal. Account Type"::"G/L Account")) OR
                ("Applies-to Doc. No." <> '')
            THEN
              TESTFIELD("Applies-to ID",'');
            /*
            IF ("Account Type" <> "Account Type"::"Bank Account") AND
               ("Bal. Account Type" <> "Bal. Account Type"::"Bank Account")
            THEN
              TESTFIELD("Bank Payment Type","Bank Payment Type"::" ");
            */
        
            //DIM1.0 Start
            //Code Commeneted
            /*
            IF NOT DimMgt.CheckJnlLineDimComb(RecJnlLineDim) THEN
              ERROR(Text011,TABLECAPTION,"Pay Journal Template","Pay Journal Batch","Line No.",DimMgt.GetDimCombErr);
            */
            IF NOT DimMgt.CheckDimIDComb("Dimension Set ID") THEN
              ERROR(Text011,TABLECAPTION,"Pay Journal Template","Pay Journal Batch","Line No.",DimMgt.GetDimCombErr);
            //DIM1.0 End
        
        
            DimMgrTableTypeLocal(RecPayrollJournalLine);
            TableID[1] := DimMgt.TypeToTableID1(DimMgrAccountType);
            No[1] := "Account No.";
            TableID[2] := DimMgt.TypeToTableID1(DimMgrBalAccountType);
            No[2] := "Bal. Account No.";
        
            //DIM1.0 Start
            //Code Commented
            /*
            IF NOT DimMgt.CheckJnlLineDimValuePosting(RecJnlLineDim,TableID,No) THEN
              IF "Line No." <> 0 THEN
                ERROR(Text012,TABLECAPTION,"Pay Journal Template","Pay Journal Batch","Line No.",DimMgt.GetDimValuePostingErr)
              ELSE
                ERROR(DimMgt.GetDimValuePostingErr);
            */
            IF NOT DimMgt.CheckDimValuePosting(TableID,No,"Dimension Set ID") THEN
              IF "Line No." <> 0 THEN
                ERROR(Text012,TABLECAPTION,"Pay Journal Template","Pay Journal Batch","Line No.",DimMgt.GetDimValuePostingErr)
              ELSE
                ERROR(DimMgt.GetDimValuePostingErr);
            //DIM1.0 End
        
        
          END;

    end;

    [LineStart(45316)]
    procedure DateNotAllowed(PostingDate : Date) : Boolean;
    begin
        IF (AllowPostingFrom = 0D) AND (AllowPostingTo = 0D) THEN
          BEGIN
            IF USERID <> '' THEN
              IF UserSetup.GET(USERID) THEN
                BEGIN
                  AllowPostingFrom := UserSetup."Allow Posting From";
                  AllowPostingTo := UserSetup."Allow Posting To";
                END;

              IF (AllowPostingFrom = 0D) AND (AllowPostingTo = 0D) THEN
                BEGIN
                  GLSetup.GET;
                  AllowPostingFrom := GLSetup."Allow Posting From";
                  AllowPostingTo := GLSetup."Allow Posting To";
                END;

            IF AllowPostingTo = 0D THEN
            AllowPostingTo := 12319999D;
          END;

        EXIT((PostingDate < AllowPostingFrom) OR (PostingDate > AllowPostingTo));
    end;

    [LineStart(45339)]
    procedure ErrorIfPositiveAmt(RecPayrollJournalLine : Record "Payroll Journal Line");
    begin
        IF RecPayrollJournalLine.Amount > 0 THEN
          RecPayrollJournalLine.FIELDERROR(Amount,Text008);
    end;

    [LineStart(45343)]
    procedure ErrorIfNegativeAmt(RecPayrollJournalLine : Record "Payroll Journal Line");
    begin
        IF RecPayrollJournalLine.Amount < 0 THEN
          RecPayrollJournalLine.FIELDERROR(Amount,Text007);
    end;

    [LineStart(45347)]
    procedure DimMgrTableTypeLocal(RecPayrollJournalLine : Record "Payroll Journal Line");
    begin
        WITH RecPayrollJournalLine DO
          BEGIN
            DimMgrAccountType:=DimMgrAccountType::" ";
            DimMgrBalAccountType:=DimMgrBalAccountType::" ";

            CASE "Account Type" OF
              "Account Type"::"G/L Account":
                DimMgrAccountType:=DimMgrAccountType::"G/L Account";
              "Account Type"::Employee:
                DimMgrAccountType:=DimMgrAccountType::Employee;
              "Account Type"::"Bank Account":
                DimMgrAccountType:=DimMgrAccountType::"Bank Account";
            END;
            CASE "Bal. Account Type" OF
              "Bal. Account Type"::"G/L Account":
                DimMgrBalAccountType:=DimMgrBalAccountType::"G/L Account";
              "Bal. Account Type"::Employee:
                DimMgrBalAccountType:=DimMgrBalAccountType::Employee;
              "Bal. Account Type"::"Bank Account":
                DimMgrBalAccountType:=DimMgrBalAccountType::"Bank Account";
            END;
          END;
    end;
}

