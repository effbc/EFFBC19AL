report 50047 "G/L Account Statement-eff"
{
    // version Shiva Teja

    DefaultLayout = RDLC;
    RDLCLayout = './GL Account Statement-eff.rdlc';
    Caption = 'Ledger';

    dataset
    {
        dataitem("G/L Account";"G/L Account")
        {
            DataItemTableView = SORTING(No.) ORDER(Ascending) WHERE(Account Type=FILTER(Posting));
            RequestFilterFields = "No.","Date Filter","Global Dimension 1 Filter","Global Dimension 2 Filter";
            column(Name_________Ledger_;Name +'  '+ 'Ledger')
            {
            }
            column(FORMAT_TODAY_0_4_;FORMAT(TODAY,0,4))
            {
            }
            column(CompInfo_Name;CompInfo.Name)
            {
            }
            column(CurrReport_PAGENO;CurrReport.PAGENO)
            {
            }
            column(USERID;USERID)
            {
            }
            column(GETFILTERS;GETFILTERS)
            {
            }
            column(LocationFilter;LocationFilter)
            {
            }
            column(Name_________Ledger__Control1500003;Name +'  '+ 'Ledger')
            {
            }
            column(FORMAT_TODAY_0_4__Control1500017;FORMAT(TODAY,0,4))
            {
            }
            column(CompInfo_Name_Control1500019;CompInfo.Name)
            {
            }
            column(CurrReport_PAGENO_Control1500020;CurrReport.PAGENO)
            {
            }
            column(USERID_Control1500026;USERID)
            {
            }
            column(GETFILTERS_Control1500065;GETFILTERS)
            {
            }
            column(LocationFilter_Control1500066;LocationFilter)
            {
            }
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
            column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Posting_DateCaption;Posting_DateCaptionLbl)
            {
            }
            column(BalanceCaption;BalanceCaptionLbl)
            {
            }
            column(Credit_AmountCaption;Credit_AmountCaptionLbl)
            {
            }
            column(Debit_AmountCaption;Debit_AmountCaptionLbl)
            {
            }
            column(DecsriptionCaption;DecsriptionCaptionLbl)
            {
            }
            column(Document_No_Caption;Document_No_CaptionLbl)
            {
            }
            column(Debit_AmountCaption_Control1000000019;Debit_AmountCaption_Control1000000019Lbl)
            {
            }
            column(G_L_Entry__Bal__Account_No__Caption;"G/L Entry".FIELDCAPTION("Bal. Account No."))
            {
            }
            column(CurrReport_PAGENO_Control1500020Caption;CurrReport_PAGENO_Control1500020CaptionLbl)
            {
            }
            column(Posting_DateCaption_Control1500067;Posting_DateCaption_Control1500067Lbl)
            {
            }
            column(Document_No_Caption_Control1500068;Document_No_Caption_Control1500068Lbl)
            {
            }
            column(Debit_AmountCaption_Control1500069;Debit_AmountCaption_Control1500069Lbl)
            {
            }
            column(Credit_AmountCaption_Control1500070;Credit_AmountCaption_Control1500070Lbl)
            {
            }
            column(Voucher_TypeCaption;Voucher_TypeCaptionLbl)
            {
            }
            column(BalanceCaption_Control1500095;BalanceCaption_Control1500095Lbl)
            {
            }
            column(G_L_Entry_DescriptionCaption;"G/L Entry".FIELDCAPTION(Description))
            {
            }
            column(Closing_BalanceCaption;Closing_BalanceCaptionLbl)
            {
            }
            column(G_L_Account_No_;"No.")
            {
            }
            column(G_L_Account_Date_Filter;"Date Filter")
            {
            }
            column(G_L_Account_Global_Dimension_1_Filter;"Global Dimension 1 Filter")
            {
            }
            column(G_L_Account_Global_Dimension_2_Filter;"Global Dimension 2 Filter")
            {
            }
            dataitem("G/L Entry";"G/L Entry")
            {
                DataItemLink = G/L Account No.=FIELD(No.),Posting Date=FIELD(Date Filter),Global Dimension 1 Code=FIELD(Global Dimension 1 Filter),Global Dimension 2 Code=FIELD(Global Dimension 2 Filter);
                DataItemTableView = SORTING(G/L Account No.,Posting Date) ORDER(Ascending);
                column(G_L_Entry__Posting_Date_;"Posting Date")
                {
                }
                column(G_L_Entry__Document_No__;"Document No.")
                {
                }
                column(G_L_Entry__Debit_Amount_;"Debit Amount")
                {
                }
                column(G_L_Entry__Credit_Amount_;"Credit Amount")
                {
                }
                column(ABS_OpeningDRBal_OpeningCRBal_TransDebits_TransCredits__Control1500029;ABS(OpeningDRBal-OpeningCRBal+TransDebits-TransCredits))
                {
                }
                column(DrCrTextBalance_Control1500030;DrCrTextBalance)
                {
                }
                column(G_L_Entry_Description;Description)
                {
                }
                column(G_L_Entry__Bal__Account_No__;"Bal. Account No.")
                {
                }
                column(G_L_Entry_Entry_No_;"Entry No.")
                {
                }
                column(G_L_Entry_G_L_Account_No_;"G/L Account No.")
                {
                }
                column(G_L_Entry_Global_Dimension_1_Code;"Global Dimension 1 Code")
                {
                }
                column(G_L_Entry_Global_Dimension_2_Code;"Global Dimension 2 Code")
                {
                }

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
        CurrReport_PAGENOCaptionLbl : Label 'Page';
        Posting_DateCaptionLbl : Label 'Posting Date';
        BalanceCaptionLbl : Label 'Balance';
        Credit_AmountCaptionLbl : Label 'Credit Amount';
        Debit_AmountCaptionLbl : Label 'Debit Amount';
        DecsriptionCaptionLbl : Label 'Decsription';
        Document_No_CaptionLbl : Label 'Document No.';
        Debit_AmountCaption_Control1000000019Lbl : Label 'Debit Amount';
        CurrReport_PAGENO_Control1500020CaptionLbl : Label 'Page';
        Posting_DateCaption_Control1500067Lbl : Label 'Posting Date';
        Document_No_Caption_Control1500068Lbl : Label 'Document No.';
        Debit_AmountCaption_Control1500069Lbl : Label 'Debit Amount';
        Credit_AmountCaption_Control1500070Lbl : Label 'Credit Amount';
        Voucher_TypeCaptionLbl : Label 'Voucher Type';
        BalanceCaption_Control1500095Lbl : Label 'Balance';
        Closing_BalanceCaptionLbl : Label 'Closing Balance';

    [LineStart(3417)]
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

