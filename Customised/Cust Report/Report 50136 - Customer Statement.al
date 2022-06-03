report 50136 "Customer Statement"
{
    // version NAVW13.70,NAVIN3.70.00.04

    DefaultLayout = RDLC;
    RDLCLayout = './Customer Statement.rdlc';
    Caption = 'Statement';

    dataset
    {
        dataitem(Customer; Customer)
        {
            DataItemTableView = SORTING(No.);
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Print Statements", "Date Filter";
            column(Customer_No_; "No.")
            {
            }
            dataitem("Integer"; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                PrintOnlyIfDetail = true;
                column(STRSUBSTNO_Text000_FORMAT_CurrReport_PAGENO__; STRSUBSTNO(Text000, FORMAT(CurrReport.PAGENO)))
                {
                }
                column(CustAddr_1______CustAddr_4_; CustAddr[1] + ',' + CustAddr[4])
                {
                }
                column(CompanyAddr_1_; CompanyAddr[1])
                {
                }
                column(CompanyAddr_2_; CompanyAddr[2])
                {
                }
                column(CompanyAddr_3_; CompanyAddr[3])
                {
                }
                column(CompanyAddr_4_; CompanyAddr[4])
                {
                }
                column(CompanyInfo__Bank_Account_No__; CompanyInfo."Bank Account No.")
                {
                }
                column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
                {
                }
                column(StartDate; StartDate)
                {
                }
                column(EndDate; EndDate)
                {
                }
                column(StatementCaption; StatementCaptionLbl)
                {
                }
                column(CompanyInfo__Bank_Account_No__Caption; CompanyInfo__Bank_Account_No__CaptionLbl)
                {
                }
                column(DateCaption; DateCaptionLbl)
                {
                }
                column(CustLedgEntry2_DescriptionCaption; CustLedgEntry2.FIELDCAPTION(Description))
                {
                }
                column(ROUND_CustBalance_1_Caption; ROUND_CustBalance_1_CaptionLbl)
                {
                }
                column(toCaption; toCaptionLbl)
                {
                }
                column(Voucher_TypeCaption; Voucher_TypeCaptionLbl)
                {
                }
                column(DebitCaption; DebitCaptionLbl)
                {
                }
                column(CreditCaption; CreditCaptionLbl)
                {
                }
                column(Ledger_AccountCaption; Ledger_AccountCaptionLbl)
                {
                }
                column(Integer_Number; Number)
                {
                }
                dataitem(CurrencyLoop; "Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
                    PrintOnlyIfDetail = true;
                    dataitem(CustLedgEntryHdr; "Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                        column(STRSUBSTNO_Text001_Currency2_Code_; STRSUBSTNO(Text001, Currency2.Code))
                        {
                        }
                        column(ROUND_StartBalance_1_; ROUND(StartBalance, 1))
                        {
                            AutoFormatExpression = Currency2.Code;
                            AutoFormatType = 1;
                        }
                        column(Opening_BalanceCaption; Opening_BalanceCaptionLbl)
                        {
                        }
                        column(CustLedgEntryHdr_Number; Number)
                        {
                        }
                        dataitem(DtldCustLedgEntries; "Detailed Cust. Ledg. Entry")
                        {
                            DataItemTableView = SORTING(Customer No., Posting Date, Entry Type, Currency Code);
                            column(ROUND__CustBalance___Amount__1_; ROUND((CustBalance - Amount), 1))
                            {
                                AutoFormatExpression = "Currency Code";
                                AutoFormatType = 1;
                            }
                            column(DtldCustLedgEntries__Posting_Date_; "Posting Date")
                            {
                            }
                            column(Description; Description)
                            {
                            }
                            column(ROUND_CustBalance_1_; ROUND(CustBalance, 1))
                            {
                                AutoFormatExpression = "Currency Code";
                                AutoFormatType = 1;
                            }
                            column(vouchertype; vouchertype)
                            {
                            }
                            column(ROUND__Debit_Amount__1_; ROUND("Debit Amount", 1))
                            {
                            }
                            column(ROUND__Credit_Amount__1_; ROUND("Credit Amount", 1))
                            {
                            }
                            column(cap_____Bankacname; cap + ' ' + Bankacname)
                            {
                            }
                            column(DtldCustLedgEntries__Posting_Date__Control1102154008; "Posting Date")
                            {
                            }
                            column(Description_Control1102154009; Description)
                            {
                            }
                            column(ROUND_CustBalance_1__Control1102154010; ROUND(CustBalance, 1))
                            {
                                AutoFormatExpression = "Currency Code";
                                AutoFormatType = 1;
                            }
                            column(FORMAT__Document_Type__; FORMAT("Document Type"))
                            {
                            }
                            column(ROUND__Debit_Amount__1__Control1102154012; ROUND("Debit Amount", 1))
                            {
                            }
                            column(ROUND__Credit_Amount__1__Control1102154013; ROUND("Credit Amount", 1))
                            {
                            }
                            column(cap_____Bankacname_Control1102154014; cap + ' ' + Bankacname)
                            {
                            }
                            column(FORMAT_ABS_assessable___FORMAT__cr__; FORMAT(ABS(assessable)) + FORMAT('cr'))
                            {
                            }
                            column(FORMAT_ABS_excise___FORMAT__cr__; FORMAT(ABS(excise)) + FORMAT('cr'))
                            {
                            }
                            column(FORMAT_ABS_vat_cst___FORMAT__cr__; FORMAT(ABS(vat_cst)) + FORMAT('cr'))
                            {
                            }
                            column(acname_1_; acname[1])
                            {
                            }
                            column(acname_2_; acname[2])
                            {
                            }
                            column(acname_3_; acname[3])
                            {
                            }
                            column(ROUND__CustBalance___Amount__1__Control75; ROUND((CustBalance - Amount), 1))
                            {
                                AutoFormatExpression = "Currency Code";
                                AutoFormatType = 1;
                            }
                            column(ROUND__CustBalance___Amount__1_Caption; ROUND__CustBalance___Amount__1_CaptionLbl)
                            {
                            }
                            column(ROUND__CustBalance___Amount__1__Control75Caption; ROUND__CustBalance___Amount__1__Control75CaptionLbl)
                            {
                            }
                            column(DtldCustLedgEntries_Entry_No_; "Entry No.")
                            {
                            }

                            trigger OnAfterGetRecord();
                            begin
                                "Remaining Amount" := 0;
                                PrintLine := TRUE;
                                CASE "Entry Type" OF
                                    "Entry Type"::"Initial Entry":
                                        BEGIN
                                            "Cust. Ledger Entry".GET("Cust. Ledger Entry No.");
                                            Description := "Cust. Ledger Entry".Description;
                                            "Due Date" := "Cust. Ledger Entry"."Due Date";
                                            "Cust. Ledger Entry".SETRANGE("Date Filter", 0D, EndDate);
                                            "Cust. Ledger Entry".CALCFIELDS("Remaining Amount");
                                            "Remaining Amount" := "Cust. Ledger Entry"."Remaining Amount";
                                            "Cust. Ledger Entry".SETRANGE("Date Filter");
                                        END;
                                    "Entry Type"::Application:
                                        BEGIN
                                            DtldCustLedgEntries2.SETCURRENTKEY("Customer No.", "Posting Date", "Entry Type");
                                            DtldCustLedgEntries2.SETRANGE("Customer No.", "Customer No.");
                                            DtldCustLedgEntries2.SETRANGE("Posting Date", "Posting Date");
                                            DtldCustLedgEntries2.SETRANGE("Entry Type", "Entry Type"::Application);
                                            DtldCustLedgEntries2.SETRANGE("Transaction No.", "Transaction No.");
                                            DtldCustLedgEntries2.SETFILTER("Currency Code", '<>%1', DtldCustLedgEntries."Currency Code");
                                            IF DtldCustLedgEntries2.FIND('-') THEN BEGIN
                                                Description := Text005;
                                                "Due Date" := 0D;
                                            END ELSE
                                                PrintLine := FALSE;
                                        END;
                                    "Entry Type"::"Payment Discount",
                                    "Entry Type"::"Payment Discount (VAT Excl.)",
                                    "Entry Type"::"Payment Discount (VAT Adjustment)",
                                    "Entry Type"::"Payment Discount Tolerance",
                                    "Entry Type"::"Payment Discount Tolerance (VAT Excl.)",
                                    "Entry Type"::"Payment Discount Tolerance (VAT Adjustment)":
                                        BEGIN
                                            Description := Text006;
                                            "Due Date" := 0D;
                                        END;
                                    "Entry Type"::"Payment Tolerance",
                                    "Entry Type"::"Payment Tolerance (VAT Excl.)",
                                    "Entry Type"::"Payment Tolerance (VAT Adjustment)":
                                        BEGIN
                                            Description := Text014;
                                            "Due Date" := 0D;
                                        END;
                                    "Entry Type"::"Appln. Rounding",
                                    "Entry Type"::"Correction of Remaining Amount":
                                        BEGIN
                                            Description := Text007;
                                            "Due Date" := 0D;
                                        END;
                                END;

                                IF PrintLine THEN
                                    CustBalance := CustBalance + Amount;
                            end;

                            trigger OnPreDataItem();
                            begin
                                SETRANGE("Customer No.", Customer."No.");
                                SETRANGE("Posting Date", StartDate, EndDate);
                                SETRANGE("Currency Code", Currency2.Code);
                                SETFILTER(Amount, '<>0');

                                IF Currency2.Code = '' THEN BEGIN
                                    GLSetup.TESTFIELD("LCY Code");
                                    CurrencyCode3 := GLSetup."LCY Code"
                                END ELSE
                                    CurrencyCode3 := Currency2.Code;
                            end;
                        }
                    }
                    dataitem(CustLedgEntryFooter; "Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                        column(ROUND_CustBalance_1__Control71; ROUND(CustBalance, 1))
                        {
                            AutoFormatExpression = Currency2.Code;
                            AutoFormatType = 1;
                        }
                        column(ROUND_CustBalance_1__Control71Caption; ROUND_CustBalance_1__Control71CaptionLbl)
                        {
                        }
                        column(CustLedgEntryFooter_Number; Number)
                        {
                        }
                    }
                    dataitem(CustLedgEntry2; "Cust. Ledger Entry")
                    {
                        DataItemLink = Customer No.=FIELD(No.);
                        DataItemLinkReference = Customer;
                        DataItemTableView = SORTING(Customer No., Open, Positive, Due Date);
                        column(STRSUBSTNO_Text002_Currency2_Code_; STRSUBSTNO(Text002, Currency2.Code))
                        {
                        }
                        column(CustLedgEntry2__Remaining_Amount_; "Remaining Amount")
                        {
                            AutoFormatExpression = "Currency Code";
                            AutoFormatType = 1;
                        }
                        column(CustLedgEntry2__Posting_Date_; "Posting Date")
                        {
                        }
                        column(CustLedgEntry2_Description; Description)
                        {
                        }
                        column(CustLedgEntry2__Remaining_Amount__Control64; "Remaining Amount")
                        {
                            AutoFormatExpression = "Currency Code";
                            AutoFormatType = 1;
                        }
                        column(CustLedgEntry2__Remaining_Amount__Control66; "Remaining Amount")
                        {
                            AutoFormatExpression = "Currency Code";
                            AutoFormatType = 1;
                        }
                        column(CurrencyCode3; CurrencyCode3)
                        {
                        }
                        column(CustLedgEntry2__Remaining_Amount_Caption; CustLedgEntry2__Remaining_Amount_CaptionLbl)
                        {
                        }
                        column(CustLedgEntry2__Remaining_Amount__Control64Caption; CustLedgEntry2__Remaining_Amount__Control64CaptionLbl)
                        {
                        }
                        column(CustLedgEntry2__Remaining_Amount__Control66Caption; CustLedgEntry2__Remaining_Amount__Control66CaptionLbl)
                        {
                        }
                        column(CustLedgEntry2_Entry_No_; "Entry No.")
                        {
                        }
                        column(CustLedgEntry2_Customer_No_; "Customer No.")
                        {
                        }

                        trigger OnAfterGetRecord();
                        var
                            CustLedgEntry: Record "Cust. Ledger Entry";
                        begin
                            IF IncludeAgingBand THEN
                                IF ("Posting Date" > EndDate) AND ("Due Date" >= EndDate) THEN
                                    CurrReport.SKIP;
                            CustLedgEntry := CustLedgEntry2;
                            CustLedgEntry.SETRANGE("Date Filter", 0D, EndDate);
                            CustLedgEntry.CALCFIELDS("Remaining Amount");
                            "Remaining Amount" := CustLedgEntry."Remaining Amount";
                            IF CustLedgEntry."Remaining Amount" = 0 THEN
                                CurrReport.SKIP;

                            IF IncludeAgingBand AND ("Posting Date" <= EndDate) THEN
                                UpdateBuffer(Currency2.Code, GetDate("Posting Date", "Due Date"), "Remaining Amount");
                            IF ("Due Date" >= EndDate) OR ("Remaining Amount" < 0) THEN
                                CurrReport.SKIP;
                        end;

                        trigger OnPreDataItem();
                        begin
                            CurrReport.CREATETOTALS("Remaining Amount");
                            IF NOT IncludeAgingBand THEN BEGIN
                                SETRANGE("Due Date", 0D, EndDate - 1);
                                SETRANGE(Positive, TRUE);
                            END;
                            SETRANGE("Currency Code", Currency2.Code);
                            IF (NOT PrintEntriesDue) AND (NOT IncludeAgingBand) THEN
                                CurrReport.BREAK;
                        end;
                    }

                    trigger OnAfterGetRecord();
                    begin
                        IF Number = 1 THEN
                            Currency2.FIND('-')
                        ELSE
                            IF Currency2.NEXT = 0 THEN
                                CurrReport.BREAK;

                        Cust2 := Customer;
                        Cust2.SETRANGE("Date Filter", 0D, StartDate - 1);
                        Cust2.SETRANGE("Currency Filter", Currency2.Code);
                        Cust2.CALCFIELDS("Net Change");
                        StartBalance := Cust2."Net Change";
                        CustBalance := Cust2."Net Change";
                        "Cust. Ledger Entry".SETCURRENTKEY("Customer No.", "Posting Date", "Currency Code");
                        "Cust. Ledger Entry".SETRANGE("Customer No.", Customer."No.");
                        "Cust. Ledger Entry".SETRANGE("Posting Date", StartDate, EndDate);
                        "Cust. Ledger Entry".SETRANGE("Currency Code", Currency2.Code);
                        EntriesExists := "Cust. Ledger Entry".FIND('-');
                    end;

                    trigger OnPreDataItem();
                    begin
                        Customer.COPYFILTER("Currency Filter", Currency2.Code);
                    end;
                }
                dataitem(AgingBandLoop; "Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
                    column(AgingDate_1____1; AgingDate[1] + 1)
                    {
                    }
                    column(AgingDate_2_; AgingDate[2])
                    {
                    }
                    column(AgingDate_2_____1; AgingDate[2] + 1)
                    {
                    }
                    column(AgingDate_3_; AgingDate[3])
                    {
                    }
                    column(AgingDate_3____1; AgingDate[3] + 1)
                    {
                    }
                    column(AgingDate_4_; AgingDate[4])
                    {
                    }
                    column(STRSUBSTNO_Text011_AgingBandEndingDate_PeriodLength_SELECTSTR_DateChoice___1_Text013__; STRSUBSTNO(Text011, AgingBandEndingDate, PeriodLength, SELECTSTR(DateChoice + 1, Text013)))
                    {
                    }
                    column(AgingDate_4____1; AgingDate[4] + 1)
                    {
                    }
                    column(AgingDate_5_; AgingDate[5])
                    {
                    }
                    column(AgingBandBuf__Column_1_Amt__; AgingBandBuf."Column 1 Amt.")
                    {
                        AutoFormatExpression = AgingBandBuf."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(AgingBandBuf__Column_2_Amt__; AgingBandBuf."Column 2 Amt.")
                    {
                        AutoFormatExpression = AgingBandBuf."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(AgingBandBuf__Column_3_Amt__; AgingBandBuf."Column 3 Amt.")
                    {
                        AutoFormatExpression = AgingBandBuf."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(AgingBandBuf__Column_4_Amt__; AgingBandBuf."Column 4 Amt.")
                    {
                        AutoFormatExpression = AgingBandBuf."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(AgingBandBuf__Column_5_Amt__; AgingBandBuf."Column 5 Amt.")
                    {
                        AutoFormatExpression = AgingBandBuf."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(AgingBandCurrencyCode; AgingBandCurrencyCode)
                    {
                    }
                    column(beforeCaption; beforeCaptionLbl)
                    {
                    }
                    column(AgingBandLoop_Number; Number)
                    {
                    }

                    trigger OnAfterGetRecord();
                    begin
                        IF Number = 1 THEN BEGIN
                            IF NOT AgingBandBuf.FIND('-') THEN
                                CurrReport.BREAK;
                        END ELSE
                            IF AgingBandBuf.NEXT = 0 THEN
                                CurrReport.BREAK;
                        AgingBandCurrencyCode := AgingBandBuf."Currency Code";
                        IF AgingBandCurrencyCode = '' THEN
                            AgingBandCurrencyCode := GLSetup."LCY Code";
                    end;

                    trigger OnPreDataItem();
                    begin
                        IF NOT IncludeAgingBand THEN
                            CurrReport.BREAK;
                    end;
                }
            }

            trigger OnAfterGetRecord();
            begin
                AgingBandBuf.DELETEALL;
                CurrReport.LANGUAGE := Language.GetLanguageID("Language Code");
                PrintLine := FALSE;
                Cust2 := Customer;
                COPYFILTER("Currency Filter", Currency2.Code);
                IF PrintAllHavingBal THEN BEGIN
                    IF Currency2.FIND('-') THEN
                        REPEAT
                            Cust2.SETRANGE("Date Filter", 0D, EndDate);
                            Cust2.SETRANGE("Currency Filter", Currency2.Code);
                            Cust2.CALCFIELDS("Net Change");
                            PrintLine := Cust2."Net Change" <> 0;
                        UNTIL (Currency2.NEXT = 0) OR PrintLine;
                END;
                IF (NOT PrintLine) AND PrintAllHavingEntry THEN BEGIN
                    "Cust. Ledger Entry".RESET;
                    "Cust. Ledger Entry".SETCURRENTKEY("Customer No.", "Posting Date");
                    "Cust. Ledger Entry".SETRANGE("Customer No.", Customer."No.");
                    "Cust. Ledger Entry".SETRANGE("Posting Date", StartDate, EndDate);
                    Customer.COPYFILTER("Currency Filter", "Cust. Ledger Entry"."Currency Code");
                    PrintLine := "Cust. Ledger Entry".FIND('-');
                END;
                IF NOT PrintLine THEN
                    CurrReport.SKIP;

                FormatAddr.Customer(CustAddr, Customer);
                CurrReport.PAGENO := 1;

                IF NOT CurrReport.PREVIEW THEN BEGIN
                    Customer.LOCKTABLE;
                    Customer.FIND;
                    Customer."Last Statement No." := Customer."Last Statement No." + 1;
                    Customer.MODIFY;
                    COMMIT;
                END ELSE
                    Customer."Last Statement No." := Customer."Last Statement No." + 1;

                IF LogInteraction THEN
                    IF NOT CurrReport.PREVIEW THEN
                        SegManagement.LogDocument(
                          7, FORMAT(Customer."Last Statement No."), 0, 0, DATABASE::Customer, "No.", "Salesperson Code", '',
                          Text003 + FORMAT(Customer."Last Statement No."), '');
            end;

            trigger OnPreDataItem();
            begin
                StartDate := GETRANGEMIN("Date Filter");
                EndDate := GETRANGEMAX("Date Filter");
                AgingBandEndingDate := EndDate;
                CalcAgingBandDates;

                CompanyInfo.GET;
                FormatAddr.Company(CompanyAddr, CompanyInfo);

                Currency2.Code := '';
                Currency2.INSERT;
                COPYFILTER("Currency Filter", Currency.Code);
                IF Currency.FIND('-') THEN
                    REPEAT
                        Currency2 := Currency;
                        Currency2.INSERT;
                    UNTIL Currency.NEXT = 0;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(PrintEntriesDue; PrintEntriesDue)
                    {
                        Caption = 'Show Overdue Entries';
                    }
                    field(PrintAllHavingEntry; PrintAllHavingEntry)
                    {
                        Caption = 'Include All Customers with Ledger Entries';
                        MultiLine = true;

                        trigger OnValidate();
                        begin

                            IF NOT PrintAllHavingEntry THEN
                                PrintAllHavingBal := TRUE;
                        end;
                    }
                    field(PrintAllHavingBal; PrintAllHavingBal)
                    {
                        Caption = 'Include All Customers with a Balance';
                        MultiLine = true;

                        trigger OnValidate();
                        begin

                            IF NOT PrintAllHavingBal THEN
                                PrintAllHavingEntry := TRUE;
                        end;
                    }
                    field(IncludeAgingBand; IncludeAgingBand)
                    {
                        Caption = 'Include Aging Band';
                    }
                    field(PeriodLength; PeriodLength)
                    {
                        Caption = 'Aging Band Period Length';
                    }
                    field(DateChoice; DateChoice)
                    {
                        Caption = 'Aging Band by';
                        OptionCaption = 'Due Date,Posting Date';
                    }
                    field(LogInteraction; LogInteraction)
                    {
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnInit();
        begin
            LogInteractionEnable := TRUE;
        end;

        trigger OnOpenPage();
        begin

            IF (NOT PrintAllHavingEntry) AND (NOT PrintAllHavingBal) THEN
                PrintAllHavingBal := TRUE;

            LogInteraction := SegManagement.FindInteractTmplCode(7) <> '';
            //RequestOptionsForm.LogInteraction.ENABLED(LogInteraction);
            LogInteractionEnable := LogInteraction;

            IF FORMAT(PeriodLength) = '' THEN
                EVALUATE(PeriodLength, '1M+CM');
        end;
    }

    labels
    {
    }

    trigger OnInitReport();
    begin
        GLSetup.GET;
    end;

    var
        Text000: Label 'Page %1';
        Text001: Label 'Entries %1';
        Text002: Label 'Overdue Entries %1';
        Text003: Label '"Statement "';
        GLSetup: Record "General Ledger Setup";
        CompanyInfo: Record "Company Information";
        Cust2: Record Customer;
        Currency: Record Currency;
        Currency2: Record Currency temporary;
        Language: Record Language;
        "Cust. Ledger Entry": Record "Cust. Ledger Entry";
        DtldCustLedgEntries2: Record "Detailed Cust. Ledg. Entry";
        AgingBandBuf: Record "Aging Band Buffer" temporary;
        PrintAllHavingEntry: Boolean;
        PrintAllHavingBal: Boolean;
        PrintEntriesDue: Boolean;
        PrintLine: Boolean;
        LogInteraction: Boolean;
        EntriesExists: Boolean;
        StartDate: Date;
        EndDate: Date;
        "Due Date": Date;
        CustAddr: array[8] of Text[50];
        CompanyAddr: array[8] of Text[50];
        Description: Text[200];
        StartBalance: Decimal;
        CustBalance: Decimal;
        "Remaining Amount": Decimal;
        FormatAddr: Codeunit "Format Address";
        SegManagement: Codeunit SegManagement;
        CurrencyCode3: Code[10];
        Text005: Label 'Multicurrency Application';
        Text006: Label 'Payment Discount';
        Text007: Label 'Rounding';
        PeriodLength: DateFormula;
        PeriodLength2: DateFormula;
        DateChoice: Option "Due Date","Posting Date";
        AgingDate: array[5] of Date;
        Text008: Label 'You must specify the Aging Band Period Length.';
        AgingBandEndingDate: Date;
        Text010: Label 'You must specify Aging Band Ending Date.';
        Text011: Label 'Aged Summary by %1 (%2 by %3)';
        IncludeAgingBand: Boolean;
        Text012: Label 'Period Length is out of range.';
        AgingBandCurrencyCode: Code[10];
        Text013: Label 'Due Date,Posting Date';
        Text014: Label 'Application Writeoffs';
        GL: Record "G/L Entry";
        vouchertype: Text[30];
        Bacno: Text[30];
        bankAc: Record "Bank Account";
        Bankacname: Text[50];
        cap: Text[20];
        assessable: Decimal;
        excise: Decimal;
        vat_cst: Decimal;
        GLAC: Record "G/L Account";
        acname: array[4] of Text[30];
        i: Integer;
        prev: Text[30];
        prev1: Text[30];
        prevoucher: Text[30];
        StatementCaptionLbl: Label 'Statement';
        CompanyInfo__Bank_Account_No__CaptionLbl: Label 'Account No.';
        DateCaptionLbl: Label 'Date';
        ROUND_CustBalance_1_CaptionLbl: Label 'Balance';
        toCaptionLbl: Label 'to';
        Voucher_TypeCaptionLbl: Label 'Voucher Type';
        DebitCaptionLbl: Label 'Debit';
        CreditCaptionLbl: Label 'Credit';
        Ledger_AccountCaptionLbl: Label 'Ledger Account';
        Opening_BalanceCaptionLbl: Label 'Opening Balance';
        ROUND__CustBalance___Amount__1_CaptionLbl: Label 'Continued';
        ROUND__CustBalance___Amount__1__Control75CaptionLbl: Label 'Continued';
        ROUND_CustBalance_1__Control71CaptionLbl: Label 'Total';
        CustLedgEntry2__Remaining_Amount_CaptionLbl: Label 'Continued';
        CustLedgEntry2__Remaining_Amount__Control64CaptionLbl: Label 'Continued';
        CustLedgEntry2__Remaining_Amount__Control66CaptionLbl: Label 'Total';
        beforeCaptionLbl: Label '..before';
        LogInteractionEnable: Boolean;

    [LineStart(7335)]
    local procedure GetDate(PostingDate: Date; DueDate: Date): Date;
    begin
        IF DateChoice = DateChoice::"Posting Date" THEN
            EXIT(PostingDate)
        ELSE
            EXIT(DueDate);
    end;

    [LineStart(7341)]
    local procedure CalcAgingBandDates();
    begin
        IF NOT IncludeAgingBand THEN
            EXIT;
        IF AgingBandEndingDate = 0D THEN
            ERROR(Text010);
        IF FORMAT(PeriodLength) = '' THEN
            ERROR(Text008);
        EVALUATE(PeriodLength2, '-' + FORMAT(PeriodLength));
        AgingDate[5] := AgingBandEndingDate;
        AgingDate[4] := CALCDATE(PeriodLength2, AgingDate[5]);
        AgingDate[3] := CALCDATE(PeriodLength2, AgingDate[4]);
        AgingDate[2] := CALCDATE(PeriodLength2, AgingDate[3]);
        AgingDate[1] := CALCDATE(PeriodLength2, AgingDate[2]);
        IF AgingDate[2] <= AgingDate[1] THEN
            ERROR(Text012);
    end;

    [LineStart(7357)]
    local procedure UpdateBuffer(CurrencyCode: Code[10]; Date: Date; Amount: Decimal);
    var
        I: Integer;
        GoOn: Boolean;
    begin
        AgingBandBuf.INIT;
        AgingBandBuf."Currency Code" := CurrencyCode;
        IF NOT AgingBandBuf.FIND THEN
            AgingBandBuf.INSERT;
        I := 1;
        GoOn := TRUE;
        WHILE (I <= 5) AND GoOn DO BEGIN
            IF Date <= AgingDate[I] THEN
                IF I = 1 THEN BEGIN
                    AgingBandBuf."Column 1 Amt." := AgingBandBuf."Column 1 Amt." + Amount;
                    GoOn := FALSE;
                END;
            IF Date <= AgingDate[I] THEN
                IF I = 2 THEN BEGIN
                    AgingBandBuf."Column 2 Amt." := AgingBandBuf."Column 2 Amt." + Amount;
                    GoOn := FALSE;
                END;
            IF Date <= AgingDate[I] THEN
                IF I = 3 THEN BEGIN
                    AgingBandBuf."Column 3 Amt." := AgingBandBuf."Column 3 Amt." + Amount;
                    GoOn := FALSE;
                END;
            IF Date <= AgingDate[I] THEN
                IF I = 4 THEN BEGIN
                    AgingBandBuf."Column 4 Amt." := AgingBandBuf."Column 4 Amt." + Amount;
                    GoOn := FALSE;
                END;
            IF Date <= AgingDate[I] THEN
                IF I = 5 THEN BEGIN
                    AgingBandBuf."Column 5 Amt." := AgingBandBuf."Column 5 Amt." + Amount;
                    GoOn := FALSE;
                END;
            I := I + 1;
        END;
        AgingBandBuf.MODIFY;
    end;
}

