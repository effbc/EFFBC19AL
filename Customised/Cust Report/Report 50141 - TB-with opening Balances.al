report 50141 "TB-with opening Balances"
{
    // version Shiva Teja

    DefaultLayout = RDLC;
    RDLCLayout = './TB-with opening Balances.rdlc';
    Caption = 'Ledger';

    dataset
    {
        dataitem("G/L Account"; "G/L Account")
        {
            DataItemTableView = SORTING(No.) ORDER(Ascending) WHERE(Account Type=FILTER(Posting));
            RequestFilterFields = "No.","Date Filter","Global Dimension 1 Filter","Global Dimension 2 Filter";
            column(Opening_Balance_As_On_______FORMAT_GETRANGEMIN__Date_Filter___;'Opening Balance As On'+ ' '+FORMAT(GETRANGEMIN("Date Filter")))
            {
            }
            column(OpeningDRBal;OpeningDRBal)
            {
            }
            column(OpeningCRBal;OpeningCRBal)
            {
            }
            column(ABS_OpeningDRBal_OpeningCRBal_;ABS(OpeningDRBal-OpeningCRBal))
            {
            }
            column(DrCrTextBalance;DrCrTextBalance)
            {
            }
            column(OpeningCRBal__G_L_Entry___Credit_Amount_;OpeningCRBal+"G/L Entry"."Credit Amount")
            {
            }
            column(OpeningDRBal__G_L_Entry___Debit_Amount_;OpeningDRBal+"G/L Entry"."Debit Amount")
            {
            }
            column(ABS_OpeningDRBal_OpeningCRBal_TransDebits_TransCredits_;ABS(OpeningDRBal-OpeningCRBal+TransDebits-TransCredits))
            {
            }
            column(DrCrTextBalance_Control1500063;DrCrTextBalance)
            {
            }
            column(Name_________Ledger_;Name +'  '+ 'Ledger')
            {
            }
            column(Closing_BalanceCaption;Closing_BalanceCaptionLbl)
            {
            }
            column(G_L_Account_No_;"No.")
            {
            }
            dataitem("G/L Entry";"G/L Entry")
            {
                DataItemLink = G/L Account No.=FIELD(No.),Posting Date=FIELD(Date Filter),Global Dimension 1 Code=FIELD(Global Dimension 1 Filter),Global Dimension 2 Code=FIELD(Global Dimension 2 Filter);
                DataItemTableView = SORTING(G/L Account No.,Posting Date) ORDER(Ascending);

                trigger OnAfterGetRecord();
                begin
                    GLEntry.SETRANGE("Transaction No.","Transaction No.");
                    GLEntry.SETFILTER("Entry No.",'<>%1',"Entry No.");
                    IF GLEntry.FIND('-') THEN;
                    
                    DrCrText := '';
                    ControlAccount := FALSE;
                    OneEntryRecord := TRUE;
                    IF GLEntry.COUNT>1 THEN
                      OneEntryRecord := FALSE;
                    
                    /*
                    GLAcc.GET("G/L Account No.");
                    ControlAccount := FindControlAccount("Source Type","Entry No.","Source No.","G/L Account No.");
                    IF ControlAccount THEN
                      ControlAccountName := Daybook.FindGLAccName("Source Type","Entry No.","Source No.","G/L Account No.");
                    */
                    
                    IF Amount>0 THEN
                     TransDebits := TransDebits + Amount;
                    IF Amount<0 THEN
                     TransCredits := TransCredits - Amount;
                    
                    SourceDesc := '';
                    IF "Source Code" <> '' THEN BEGIN
                      SourceCode.GET("Source Code");
                      SourceDesc := SourceCode.Description;
                    END;

                end;

                trigger OnPreDataItem();
                begin
                    GLEntry.RESET;
                    GLEntry.SETCURRENTKEY("Transaction No.");
                end;
            }

            trigger OnPreDataItem();
            begin
                CurrReport.CREATETOTALS(TransDebits,TransCredits,"G/L Entry"."Debit Amount","G/L Entry"."Credit Amount");
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

    trigger OnPreReport();
    begin
        CompInfo.GET;
    end;

    var
        CompInfo : Record "Company Information";
        GLAcc : Record "G/L Account";
        GLEntry : Record "G/L Entry";
        GLEntry2 : Record "G/L Entry";
        SourceCode : Record "Source Code";
        OpeningDRBal : Decimal;
        OpeningCRBal : Decimal;
        TransDebits : Decimal;
        TransCredits : Decimal;
        OneEntryRecord : Boolean;
        FirstRecord : Boolean;
        PrintDetail : Boolean;
        PrintLineNarration : Boolean;
        PrintVchNarration : Boolean;
        DetailAmt : Decimal;
        AccountName : Text[100];
        ControlAccountName : Text[100];
        ControlAccount : Boolean;
        SourceDesc : Text[50];
        DrCrText : Text[2];
        DrCrTextBalance : Text[2];
        LocationCode : Code[20];
        LocationFilter : Text[100];
        Text16500 : Label 'As per Details';
        AccountChanged : Boolean;
        Closing_BalanceCaptionLbl : Label 'Closing Balance';

    [LineStart(7397)]
    procedure FindControlAccount("Source Type" : Option " ",Customer,Vendor,"Bank Account","Fixed Asset";"Entry No." : Integer;"Source No." : Code[20];"G/L Account No." : Code[20]) : Boolean;
    var
        VendLedgEntry : Record "Vendor Ledger Entry";
        CustLedgEntry : Record "Cust. Ledger Entry";
        BankLedgEntry : Record "Bank Account Ledger Entry";
        FALedgEntry : Record "FA Ledger Entry";
        SubLedgerFound : Boolean;
    begin
        IF "Source Type" = "Source Type"::Vendor THEN BEGIN
          IF VendLedgEntry.GET("Entry No.") THEN
            SubLedgerFound := TRUE;
        END;
        IF "Source Type" = "Source Type"::Customer THEN BEGIN
          IF CustLedgEntry.GET("Entry No.") THEN
            SubLedgerFound := TRUE;
        END;
        IF "Source Type" = "Source Type"::"Bank Account" THEN
          IF BankLedgEntry.GET("Entry No.") THEN BEGIN
            SubLedgerFound := TRUE;
        END;
        IF "Source Type" = "Source Type"::"Fixed Asset" THEN BEGIN
            FALedgEntry.RESET;
            FALedgEntry.SETCURRENTKEY("G/L Entry No.");
            FALedgEntry.SETRANGE("G/L Entry No.","Entry No.");
            IF FALedgEntry.FIND('-') THEN
              SubLedgerFound := TRUE;
        END;
        EXIT(SubLedgerFound);
    end;
}

