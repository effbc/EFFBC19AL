report 90013 Voucher
{
    // version B2B 1.0

    DefaultLayout = RDLC;
    RDLCLayout = './Voucher.rdlc';

    dataset
    {
        dataitem("G/L Entry"; "G/L Entry")
        {
            RequestFilterFields = "Entry No.";
            column(G_L_Entry__G_L_Entry___Document_Date_; "G/L Entry"."Document Date")
            {
            }
            column(G_L_Entry__Document_No__; "Document No.")
            {
            }
            column(G_L_Entry__Posting_Date_; "Posting Date")
            {
            }
            column(G_L_Entry__G_L_Entry__Amount; "G/L Entry".Amount)
            {
            }
            column(G_L_Entry__G_L_Entry___External_Document_No__; "G/L Entry"."External Document No.")
            {
            }
            column(CompanyInformation_Name; CompanyInformation.Name)
            {
            }
            column(NumText_1_; NumText[1])
            {
            }
            column(G_L_Entry__G_L_Entry___Journal_Batch_Name_; "G/L Entry"."Journal Batch Name")
            {
            }
            column(BankName; BankName)
            {
            }
            column(G_L_Entry__G_L_Entry___Cheque_No__; "G/L Entry"."Cheque No.")
            {
            }
            column(G_L_Entry__G_L_Entry___Cheque_Date_; "G/L Entry"."Cheque Date")
            {
            }
            column(CurrReport_PAGENO; CurrReport.PAGENO)
            {
            }
            column(FROMTO; FROMTO)
            {
            }
            column(CompanyInformation_Picture; CompanyInformation.Picture)
            {
            }
            column(G_L_Entry__G_L_Account_No__; "G/L Account No.")
            {
            }
            column(G_L_Entry__Debit_Amount_; "Debit Amount")
            {
            }
            column(AccountName; AccountName)
            {
            }
            column(G_L_Entry__Credit_Amount_; "Credit Amount")
            {
            }
            column(G_L_Entry__G_L_Entry___Source_Type_; "G/L Entry"."Source Type")
            {
            }
            column(G_L_Entry__G_L_Entry___Source_No__; "G/L Entry"."Source No.")
            {
            }
            column(dynamic; dynamic)
            {
            }
            column(docno; docno)
            {
            }
            column(docdate; docdate)
            {
            }
            column(G_L_Entry__Debit_Amount__Control1280014; "Debit Amount")
            {
            }
            column(G_L_Entry__Credit_Amount__Control1280017; "Credit Amount")
            {
            }
            column(NumberText_1_; NumberText[1])
            {
            }
            column(G_L_Entry__User_ID_; "User ID")
            {
            }
            column(G_L_Entry__Posting_Date_Caption; FIELDCAPTION("Posting Date"))
            {
            }
            column(A_c_CodeCaption; A_c_CodeCaptionLbl)
            {
            }
            column(DebitCaption; DebitCaptionLbl)
            {
            }
            column(CreditCaption; CreditCaptionLbl)
            {
            }
            column(Voucher_No_Caption; Voucher_No_CaptionLbl)
            {
            }
            column(Voucher_DateCaption; Voucher_DateCaptionLbl)
            {
            }
            column(External_Doc_NoCaption; External_Doc_NoCaptionLbl)
            {
            }
            column(Amount__Rs_Caption; Amount__Rs_CaptionLbl)
            {
            }
            column(From__ToCaption; From__ToCaptionLbl)
            {
            }
            column(In_Words_Caption; In_Words_CaptionLbl)
            {
            }
            column(Amount_Caption; Amount_CaptionLbl)
            {
            }
            column(Account_NameCaption; Account_NameCaptionLbl)
            {
            }
            column(Bank_NameCaption; Bank_NameCaptionLbl)
            {
            }
            column(Cheque_NoCaption; Cheque_NoCaptionLbl)
            {
            }
            column(Cheque_DateCaption; Cheque_DateCaptionLbl)
            {
            }
            column(Page__Caption; Page__CaptionLbl)
            {
            }
            column(Account_TypeCaption; Account_TypeCaptionLbl)
            {
            }
            column(Apply_to_Doc_NoCaption; Apply_to_Doc_NoCaptionLbl)
            {
            }
            column(Doc_DateCaption; Doc_DateCaptionLbl)
            {
            }
            column(Authorised_By_Caption; Authorised_By_CaptionLbl)
            {
            }
            column(Remarks_Caption; Remarks_CaptionLbl)
            {
            }
            column(Prepared_and_Posted_By_Caption; Prepared_and_Posted_By_CaptionLbl)
            {
            }
            column(G_L_Entry_Entry_No_; "Entry No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                Slno := Slno + 1;
                "G/L Account".RESET;
                "G/L Account".SETRANGE("No.", "G/L Account No.");
                IF "G/L Account".FIND('-') THEN
                    AccountName := "G/L Account".Name;
                "G/L Account".RESET;
                "G/L Account".SETRANGE("No.", "Bal. Account No.");
                IF "G/L Account".FIND('-') THEN
                    BalAccountName := "G/L Account".Name;

                IF ("G/L Entry"."Source Type" = "G/L Entry"."Source Type"::Customer) THEN BEGIN
                    Customer.RESET;
                    Customer.SETRANGE(Customer."No.", "G/L Entry"."Source No.");
                    IF Customer.FIND('-') THEN
                        dynamic := Customer.Name;
                    cle.RESET;
                    cle.SETRANGE(cle."Customer No.", "G/L Entry"."Source No.");
                    cle.SETRANGE(cle."Document No.", "G/L Entry"."Document No.");
                    IF cle.FIND('-') THEN BEGIN
                        docno := cle."Applies-to Doc. No.";
                        docdate := cle."Posting Date";
                    END;
                END;

                IF ("G/L Entry"."Source Type" = "G/L Entry"."Source Type"::Vendor) THEN BEGIN
                    Vendor.RESET;
                    Vendor.SETRANGE(Vendor."No.", "G/L Entry"."Source No.");
                    IF Vendor.FIND('-') THEN
                        dynamic := Vendor.Name;
                    vle.RESET;
                    vle.SETRANGE(vle."Vendor No.", "G/L Entry"."Source No.");
                    vle.SETRANGE(vle."Document No.", "G/L Entry"."Document No.");
                    IF vle.FIND('-') THEN BEGIN
                        docno := vle."Applies-to Doc. No.";
                        docdate := vle."Posting Date";
                    END;
                END;

                IF ("G/L Entry"."Source Type" = "G/L Entry"."Source Type"::"Bank Account") THEN BEGIN
                    BankAc.SETRANGE(BankAc."No.", "G/L Entry"."Source No.");
                    IF BankAc.FIND('-') THEN
                        dynamic := BankAc.Name;
                    bale.SETRANGE(bale."Bank Account No.", "G/L Entry"."Source No.");
                    IF bale.FIND('-') THEN BEGIN
                        //docno:=bale."Document No.";
                        //docdate:=bale."Posting Date";
                    END;
                END;

                IF ("G/L Entry"."Source Type" = "G/L Entry"."Source Type"::"Fixed Asset") THEN BEGIN
                    FixedAssert.SETRANGE(FixedAssert."No.", "G/L Entry"."Source No.");
                    IF FixedAssert.FIND('-') THEN
                        dynamic := FixedAssert.Description;
                    fale.SETRANGE(fale."FA No.", "G/L Entry"."Source No.");
                    IF fale.FIND('-') THEN BEGIN
                        //docno:=fale."Document No.";
                        //docdate:=fale."Posting Date";
                    END;
                END;
                IF (("G/L Account"."Cash Account" = FALSE) AND ("G/L Entry"."Source Type" <> "G/L Entry"."Source Type"::"Bank Account")) THEN
                    Amount := "G/L Entry"."Debit Amount";
                IF (("G/L Account"."Cash Account" = TRUE) AND ("G/L Entry"."Source Type" <> "G/L Entry"."Source Type"::"Bank Account")) THEN
                    Amount := "G/L Entry".Amount;
                IF (("G/L Account"."Cash Account" = TRUE) AND ("G/L Entry"."Source Type" = "G/L Entry"."Source Type"::"Bank Account")) THEN
                    Amount := "G/L Entry".Amount;
                IF (("G/L Account"."Cash Account" = FALSE) AND ("G/L Entry"."Source Type" <> "G/L Entry"."Source Type"::"Bank Account")) THEN
                    Amount := "G/L Entry"."Debit Amount";
            end;

            trigger OnPreDataItem();
            begin
                CompanyInformation.FIND('-');
                CompanyInformation.CALCFIELDS(Picture);
                Slno := 0;
                dynamic := '';
            end;
        }
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

    var
        "G/L Account": Record "G/L Account";
        CompanyInformation: Record "Company Information";
        AccountName: Text[30];
        BalAccountName: Text[30];
        Check: Report Check;
        NumberText: array[2] of Text[80];
        Description: Text[30];
        Slno: Integer;
        DimensionValue: Record "Dimension Value";
        DimDesc: Text[50];
        NumText: array[2] of Text[80];
        FROMTO: Text[50];
        BankName: Text[50];
        accounttype: Option;
        dynamic: Text[50];
        SourceType: Option "G/l ",Customer,Vendor,"Bank Account","Fixed Asset";
        Customer: Record Customer;
        Vendor: Record Vendor;
        BankAc: Record "Bank Account";
        FixedAssert: Record "Fixed Asset";
        docno: Code[20];
        docdate: Date;
        cle: Record "Cust. Ledger Entry";
        vle: Record "Vendor Ledger Entry";
        bale: Record "Bank Account Ledger Entry";
        fale: Record "FA Ledger Entry";
        Amount: Decimal;
        A_c_CodeCaptionLbl: Label 'A/c Code';
        DebitCaptionLbl: Label 'Debit';
        CreditCaptionLbl: Label 'Credit';
        Voucher_No_CaptionLbl: Label 'Voucher No.';
        Voucher_DateCaptionLbl: Label 'Voucher Date';
        External_Doc_NoCaptionLbl: Label 'External Doc No';
        Amount__Rs_CaptionLbl: Label 'Amount (Rs)';
        From__ToCaptionLbl: Label 'From/ To';
        In_Words_CaptionLbl: Label 'In Words:';
        Amount_CaptionLbl: Label 'Amount:';
        Account_NameCaptionLbl: Label 'Account Name';
        Bank_NameCaptionLbl: Label 'Bank Name';
        Cheque_NoCaptionLbl: Label 'Cheque No';
        Cheque_DateCaptionLbl: Label 'Cheque Date';
        Page__CaptionLbl: Label 'Page.:';
        Account_TypeCaptionLbl: Label 'Account Type';
        Apply_to_Doc_NoCaptionLbl: Label 'Apply to Doc.No';
        Doc_DateCaptionLbl: Label 'Doc.Date';
        Authorised_By_CaptionLbl: Label 'Authorised By:';
        Remarks_CaptionLbl: Label 'Remarks:';
        Prepared_and_Posted_By_CaptionLbl: Label 'Prepared and Posted By:';
}

