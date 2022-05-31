report 33000072 "Payroll Statutory Post - ESI"
{
    // version NEOGYNPAY13.70.00.06

    // //NEOGYNPAY13.10.01
    // //TEMPLATE/16

    Caption = 'Statutory Post - ESI';
    ProcessingOnly = true;

    dataset
    {
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPostReport();
    begin
        IF ESIPaid = 0 THEN ERROR(Text009);
        IF DocumentNo = '' THEN ERROR(Text003);
        IF Year = 0 THEN ERROR(Text004);
        IF BankCode = '' THEN ERROR(Text005);
        IF NOT PayCompanyPolicy.GET THEN ERROR(Text006);

        IF AlreadyPosted(Month, Year) = TRUE THEN ERROR(Text008);

        IF ESIPaid <> 0 THEN BEGIN
            GLDesc := 'Salary Entry ,' + FORMAT(MonthNo) + FORMAT(Year);
            IF PayElements.GET('ESI') THEN PayElements.TESTFIELD("GL Code");
            PayPayrollFunctions.GenLdgEntry(PayElements."GL Code", PostingDate,
                                            DocumentNo, GLDesc, -(ESIPaid), '', GLEntryType::Debit, PostingDate);
        END;

        BankAccount.RESET;
        BankPostingGroup.RESET;
        IF BankAccount.GET(BankCode) THEN
            IF BankPostingGroup.GET(BankAccount."Bank Acc. Posting Group") THEN BEGIN
                BankPostingGroup.TESTFIELD("G/L Bank Account No.");
                BankGlAccount := BankPostingGroup."G/L Bank Account No.";
            END;

        GLDesc := 'Salary Entry ,' + FORMAT(MonthNo) + FORMAT(Year);
        PayPayrollFunctions.GenLdgEntry(BankGlAccount, PostingDate, DocumentNo,
                                        GLDesc, ESIPaid, GlobalBatch, GLEntryType, PostingDate);

        GLEntry1.RESET;
        GLEntry1.LOCKTABLE;
        GLEntry1.SETFILTER("G/L Account No.", BankGlAccount);
        GLEntry1.SETFILTER(GLEntry1."Document No.", DocumentNo);
        IF GLEntry1.FIND('+') THEN EntryNo := GLEntry1."Entry No.";

        GLEntry.RESET;
        GLEntry.SETCURRENTKEY("Transaction No.");
        IF GLEntry.FIND('+') THEN
            TransactionNo := GLEntry."Transaction No." + 1;

        PayPayrollFunctions.InsertintoBankledgerEntry(ESIPaid, PostingDate, DocumentNo, BatchName,
                                                      EntryNo, TransactionNo, BankAccount);

        PayPayrollFunctions.GenRegisterEntry(DocumentNo);

        //NEOGYNPAY13.10.01
        //TEMPLATE/16

        IF PayJournal."No. Series" <> '' THEN BEGIN

            GLEntry.TESTFIELD(GLEntry."Document No.",
                 PayPayrollFunctions.GetNextDocNo(PayJournal."No. Series", GLEntry."Document Date"));
            PayPayrollFunctions.DocNoSave;

        END;

        ///
        PostedTrue(Month, Year);

        MESSAGE(Text007);
    end;

    var
        BatchName: Code[20];
        DocumentNo: Code[20];
        PostingDate: Date;
        Month: Option January,February,March,April,May,June,July,August,September,October,November,December;
        Year: Integer;
        BankCode: Code[10];
        PayJournal: Record "Pay Gen. Journal Batch";
        GlobalTemplate: Code[20];
        GlobalBatch: Code[20];
        NoSeries: Record "No. Series Line";
        PayBatch: Record "Pay Gen. Journal Batch";
        "No. Series": Record "No. Series Line";
        SelectProcess: Codeunit "Payroll Template";
        PayEmployeePayDetails: Record "Pay Employee Pay Details";
        MonthNo: Integer;
        PFPaid: Decimal;
        PFAdminInsPaid: Decimal;
        ESIPaid: Decimal;
        PayCompanyPolicy2: Record "Pay Company Policy 2";
        PayCompanyPolicy: Record "Pay Company Policy";
        GLEntry: Record "G/L Entry";
        EntryNo: Integer;
        GLDesc: Text[50];
        PayPayrollFunctions: Codeunit "Pay Payroll Functions";
        GLEntryType: Option Credit,Debit;
        PayElements: Record "Pay Elements";
        GLEntry1: Record "G/L Entry";
        BankAccount: Record "Bank Account";
        BankPostingGroup: Record "Bank Account Posting Group";
        BankGlAccount: Code[10];
        TransactionNo: Integer;
        Text000: Label 'No.Series Not Given For Batch';
        Text003: Label '"Required Document No. "';
        Text004: Label 'Required Year';
        Text005: Label 'Required Bank';
        Text006: Label 'Company Policies Not Defined.';
        Text007: Label 'Posted.';
        Text008: Label 'Already Posted.';
        Text009: Label 'Nothing to Post.';
        Text001: Label 'No. Series Has Crossed the End Limit';
        Text012: Label 'Do you want to Re - Suggest payment lines ?';
        Text013: Label 'Posted';

    [LineStart(20870)]
    procedure SetTemplateValues(Template: Code[10]; Batch: Code[10]);
    begin
        GlobalTemplate := Template;
        GlobalBatch := Batch;
    end;

    [LineStart(20874)]
    procedure Calculate();
    begin
        //Calculate

        CASE Month OF
            0:
                MonthNo := 1;
            1:
                MonthNo := 2;
            2:
                MonthNo := 3;
            3:
                MonthNo := 4;
            4:
                MonthNo := 5;
            5:
                MonthNo := 6;
            6:
                MonthNo := 7;
            7:
                MonthNo := 8;
            8:
                MonthNo := 9;
            9:
                MonthNo := 10;
            10:
                MonthNo := 11;
            11:
                MonthNo := 12;
        END;

        PayElements.RESET;
        PayElements.SETFILTER(Code, 'ESI');
        PayElements.SETRANGE("Date Filter", CALCDATE('1M-1D', DMY2DATE(1, MonthNo, Year)));
        PayElements.SETFILTER("Document Filter", '<>%1', '');
        IF PayElements.FIND('-') THEN BEGIN
            PayElements.CALCFIELDS(PayElements.SumOfPayableAmount);
            PayElements.CALCFIELDS(PayElements.TotalEmployerCont);
            ESIPaid := PayElements.SumOfPayableAmount;
            IF ESIPaid <> 0 THEN
                ESIPaid := PayElements.SumOfPayableAmount - PayElements.TotalEmployerCont;
        END;
    end;

    [LineStart(20905)]
    procedure PostedTrue(Month1: Option January,February,March,April,May,June,July,August,September,October,November,December; Year1: Integer);
    begin

        CASE Month1 OF
            0:
                MonthNo := 1;
            1:
                MonthNo := 2;
            2:
                MonthNo := 3;
            3:
                MonthNo := 4;
            4:
                MonthNo := 5;
            5:
                MonthNo := 6;
            6:
                MonthNo := 7;
            7:
                MonthNo := 8;
            8:
                MonthNo := 9;
            9:
                MonthNo := 10;
            10:
                MonthNo := 11;
            11:
                MonthNo := 12;
        END;

        PayEmployeePayDetails.RESET;
        PayEmployeePayDetails.SETCURRENTKEY(Year, Month, "Employee No", "Pay Element Code", "Branch Code");
        PayEmployeePayDetails.SETRANGE(Year, Year1);
        PayEmployeePayDetails.SETRANGE(Month, MonthNo);
        PayEmployeePayDetails.SETFILTER("Pay Element Code", 'ESI');
        IF PayEmployeePayDetails.FIND('-') THEN
            PayEmployeePayDetails.MODIFYALL(PayEmployeePayDetails.PostedToGL, TRUE);
    end;

    [LineStart(20930)]
    procedure AlreadyPosted(Month1: Option January,February,March,April,May,June,July,August,September,October,November,December; Year1: Integer) AlreadyPostedTrue: Boolean;
    begin

        CASE Month OF
            0:
                MonthNo := 1;
            1:
                MonthNo := 2;
            2:
                MonthNo := 3;
            3:
                MonthNo := 4;
            4:
                MonthNo := 5;
            5:
                MonthNo := 6;
            6:
                MonthNo := 7;
            7:
                MonthNo := 8;
            8:
                MonthNo := 9;
            9:
                MonthNo := 10;
            10:
                MonthNo := 11;
            11:
                MonthNo := 12;
        END;


        PayEmployeePayDetails.RESET;
        PayEmployeePayDetails.SETCURRENTKEY(Year, Month, "Employee No", "Pay Element Code", "Branch Code");
        PayEmployeePayDetails.SETRANGE(Year, Year);
        PayEmployeePayDetails.SETRANGE(Month, MonthNo);
        PayEmployeePayDetails.SETFILTER("Pay Element Code", 'ESI');
        IF PayEmployeePayDetails.FIND('-') THEN
            IF PayEmployeePayDetails.PostedToGL = TRUE THEN AlreadyPostedTrue := TRUE ELSE AlreadyPostedTrue := FALSE;
    end;
}

