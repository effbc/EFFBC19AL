report 33000275 General_Ledger_MIPL
{
    DefaultLayout = RDLC;
    RDLCLayout = './General_Ledger_MIPL.rdlc';

    dataset
    {
        dataitem("G/L Account"; "G/L Account")
        {
            PrintOnlyIfDetail = false;
            RequestFilterFields = "No.";
            column(No_GLAccount; "G/L Account"."No.")
            {
            }
            column(Name_GLAccount; "G/L Account".Name)
            {
            }
            column(OpeningBalance; OpeningBalanceGVar)
            {
            }
            column(PostingDateCaption; PostingDateCaptionLbl)
            {
            }
            column(ParticularsCaption; ParticularsCaptionLbl)
            {
            }
            column(DocTypeCaption; DocTypeCaptionLbl)
            {
            }
            column(ExtDocNoCaption; ExtDocNoCaptionLbl)
            {
            }
            column(DocDateCaption; DocDateCaptionLbl)
            {
            }
            column(DebitCaption; DebitCaptionLbl)
            {
            }
            column(CreditCaption; CreditCaptionLbl)
            {
            }
            column(PageCaption; PageCaptionLbl)
            {
            }
            column(ClosingBalanceCaption; ClosingBalanceCaptionLbl)
            {
            }
            column(InternaldocNumberCaption; InternaldocNumberCaptionLbl)
            {
            }
            column(TelCaption; TelCaptionLbl)
            {
            }
            column(FaxCaption; FaxCaptionLbl)
            {
            }
            column(Name_CompanyInfo; CompanyInfo.Name)
            {
            }
            column(Address1_CompanyInfo; CompanyInfo.Address)
            {
            }
            column(Address2_CompanyInfo; CompanyInfo."Address 2")
            {
            }
            column(City_CompanyInfo; CompanyInfo.City)
            {
            }
            column(Postcode_CompanyInfo; CompanyInfo."Post Code")
            {
            }
            column(Phone_CompanyInfo; CompanyInfo."Phone No.")
            {
            }
            column(Fax__CompanyInfo; CompanyInfo."Fax No.")
            {
            }
            column(CIN__CompanyInfo; CompanyInfo."Registration No.")
            {
            }
            column(DateFilter; DateFilterGVar)
            {
            }
            column(PrintDetails; PrintDetailsGvar)
            {
            }
            column(PositiveOpning; PositiveOpningGVar)
            {
            }
            column(NegativeOpening; NegativeOpeningGVar)
            {
            }
            column(PrintClosingEntries; PrintClosingEntries)
            {
            }
            dataitem("G/L Entry"; "G/L Entry")
            {
                DataItemLink = G/L Account No.=FIELD(No.);
                RequestFilterFields = "Posting Date";
                column(EntryNo_GLEntry; "G/L Entry"."Entry No.")
                {
                }
                column(PostingDate_GLEntry; "G/L Entry"."Posting Date")
                {
                }
                column(Description_GLEntry; "G/L Entry".Description)
                {
                }
                column(DocumentType_GLEntry; "G/L Entry"."Document Type")
                {
                }
                column(ExternalDocumentNo_GLEntry; "G/L Entry"."External Document No.")
                {
                }
                column(DocumentNo_GLEntry; "G/L Entry"."Document No.")
                {
                }
                column(DocumentDate_GLEntry; "G/L Entry"."Document Date")
                {
                }
                column(Debit_GLEntry; DebitGVar)
                {
                }
                column(Credit_GLEntry; CreditGVar)
                {
                }
                column(Debitamount; Debitamountgvar)
                {
                }
                column(Creditamount; Creditamountgvar)
                {
                }
                column(GLDescription; GLDescriptionGvar)
                {
                }
                column(VoucherNarrationVar_GLEntry; VoucherNarrationVar)
                {
                }
                column(LineNarrationGVar_GLEntry; LineNarrationGVar)
                {
                }
                dataitem("G/L Entry Details"; "G/L Entry")
                {
                    DataItemLink = Document Type=FIELD(Document Type),Transaction No.=FIELD(Transaction No.),Document No.=FIELD(Document No.);
                    DataItemTableView = SORTING(Document No.,Posting Date,Amount) ORDER(Descending);
                    column(EntryNo_GLEntryDetails;"Entry No.")
                    {
                    }
                    column(TransactionNo_GLEntryDetails;"Transaction No.")
                    {
                    }
                    column(CreditAmount_GLEntryDetails;"Credit Amount")
                    {
                    }
                    column(DebitAmount_GLEntryDetails;"Debit Amount")
                    {
                    }
                    column(GLAccName;GLAccNameGVar)
                    {
                    }
                    column(CrText;CrText)
                    {
                    }
                    column(DrText;DrText)
                    {
                    }

                    trigger OnAfterGetRecord();
                    begin
                        GLAccNameGVar := FindGLAccName("Source Type","Entry No.","Source No.","G/L Account No.");
                        IF Amount < 0 THEN BEGIN
                          CrText := 'Cr';
                          DrText := '';
                        END ELSE BEGIN
                          CrText := '';
                          DrText := 'Dr';
                        END;
                    end;
                }

                trigger OnAfterGetRecord();
                begin
                    IF "Debit Amount" >0 THEN
                      Debitamountgvar := Debitamountgvar + "Debit Amount"
                    ELSE IF "Debit Amount" <0 THEN
                      Creditamountgvar := Creditamountgvar + ABS("Debit Amount");

                    IF "Credit Amount" >0 THEN
                      Creditamountgvar := Creditamountgvar + "Credit Amount"
                    ELSE IF "Credit Amount" <0 THEN
                      Debitamountgvar := Debitamountgvar + ABS("Credit Amount");

                    CLEAR(DebitGVar);
                    CLEAR(CreditGVar);
                    IF "Debit Amount" >0 THEN
                      DebitGVar := "Debit Amount"
                    ELSE IF "Debit Amount" <0 THEN
                      CreditGVar := ABS("Debit Amount");

                    IF "Credit Amount" >0 THEN
                      CreditGVar := "Credit Amount"
                    ELSE IF "Credit Amount" <0 THEN
                      DebitGVar := ABS("Credit Amount");

                    IF ("Posting Date" = CLOSINGDATE("Posting Date")) AND
                       NOT PrintClosingEntries
                    THEN BEGIN
                      DebitGVar := 0;
                      CreditGVar := 0;
                    END;


                    CLEAR(GLDescriptionGvar);
                    GLDescriptionGvar := GetDescription("Document No.","G/L Account"."No.");

                    //B2B1.0 >>
                    //Line narration and voucher narration
                    IF PrintDetailsGvar THEN BEGIN
                      CLEAR(VoucherNarrationVar);
                      CLEAR(LineNarrationGVar);
                      PostedNarrationGrec.RESET;
                      PostedNarrationGrec.SETFILTER("Entry No.",'=%1',0);
                      PostedNarrationGrec.SETRANGE("Transaction No.","Transaction No.");
                      IF PostedNarrationGrec.FINDSET THEN BEGIN
                        REPEAT
                          VoucherNarrationVar += PostedNarrationGrec.Narration + ' ';
                        UNTIL PostedNarrationGrec.NEXT = 0;
                      END;

                      CLEAR(LineNarrationGVar);
                      PostedNarrationGrec.RESET;
                      PostedNarrationGrec.SETRANGE("Entry No.","Entry No.");
                      PostedNarrationGrec.SETRANGE("Transaction No.","Transaction No.");
                      PostedNarrationGrec.SETRANGE("Document No.","Document No.");
                      IF PostedNarrationGrec.FINDSET THEN BEGIN
                        REPEAT
                          LineNarrationGVar += PostedNarrationGrec.Narration + ' ';
                        UNTIL PostedNarrationGrec.NEXT=0;
                      END;
                      //Invoice narration
                      PurchCmntLineGrec.RESET;
                      PurchCmntLineGrec.SETRANGE("Document Line No.",0);
                      PurchCmntLineGrec.SETRANGE("No.","Document No.");
                    //  PurchCmntLineGrec.SETRANGE("General Condition",PurchCmntLineGrec."General Condition"::"6");
                      IF PurchCmntLineGrec.FINDSET THEN
                        REPEAT
                          VoucherNarrationVar +=' ' +PurchCmntLineGrec.Comment
                        UNTIL PurchCmntLineGrec.NEXT = 0;
                    END;
                    //B2B1.0 <<
                end;
            }

            trigger OnAfterGetRecord();
            begin
                CLEAR(OpeningBalanceGVar);
                CLEAR(Debitamountgvar);
                CLEAR(Creditamountgvar);
                CLEAR(PositiveOpningGVar);
                CLEAR(NegativeOpeningGVar);
                GLEntryGrec.RESET;
                GLEntryGrec.SETRANGE("G/L Account No.","No.");
                IF EndingDateGVar <> 0D THEN BEGIN
                  //GLEntryGrec.SETRANGE("Posting Date",StartingDateGVar,EndingDateGVar);
                  IF PrintClosingEntries THEN
                    GLEntryGrec.SETRANGE("Posting Date",StartingDateGVar,CLOSINGDATE(EndingDateGVar))
                  ELSE
                    GLEntryGrec.SETRANGE("Posting Date",StartingDateGVar,EndingDateGVar);

                  IF GLEntryGrec.FINDSET THEN
                    REPEAT
                      OpeningBalanceGVar := OpeningBalanceGVar + GLEntryGrec.Amount;
                    UNTIL GLEntryGrec.NEXT=0;
                END;

                IF OpeningBalanceGVar > 0 THEN
                  PositiveOpningGVar := OpeningBalanceGVar
                ELSE
                  NegativeOpeningGVar := ABS(OpeningBalanceGVar);

                Debitamountgvar := Debitamountgvar + PositiveOpningGVar;
                Creditamountgvar := Creditamountgvar + NegativeOpeningGVar;

                GLEntry1Grec.RESET;
                GLEntry1Grec.SETRANGE("G/L Account No.","G/L Account"."No.");
                IF NOT GLEntry1Grec.FINDFIRST AND (OpeningBalanceGVar=0) THEN
                  CurrReport.SKIP;
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
                    field("Print Details";PrintDetailsGvar)
                    {
                    }
                    field(InclClosingEntriesWithinPeriod;PrintClosingEntries)
                    {
                        CaptionML = ENU='Include Closing Entries Within the Period',
                                    ENN='Include Closing Entries Within the Period';
                        MultiLine = true;
                    }
                }
            }
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
        CompanyInfo.GET;
        StartingDateGVar := 010147D;

        DateFilterGVar := "G/L Entry".GETFILTER("Posting Date");
        EndingDateGVar :=  "G/L Entry".GETRANGEMIN("Posting Date");
        EndingDateGVar := CALCDATE('-1D',EndingDateGVar);
    end;

    var
        GLEntryGrec : Record "G/L Entry";
        OpeningBalanceGVar : Decimal;
        StartingDateGVar : Date;
        EndingDateGVar : Date;
        DateFilterGVar : Text;
        PositiveOpningGVar : Decimal;
        NegativeOpeningGVar : Decimal;
        Debitamountgvar : Decimal;
        Creditamountgvar : Decimal;
        DebitGVar : Decimal;
        CreditGVar : Decimal;
        GLAccNameGVar : Text;
        CrText : Text;
        DrText : Text;
        CompanyInfo : Record "Company Information";
        PrintDetailsGvar : Boolean;
        GLDescriptionGvar : Text;
        GLEntry1Grec : Record "G/L Entry";
        PurchCmntLineGrec : Record "Purch. Comment Line";
        PostedNarrationGrec : Record "Posted Narration";
        VoucherNarrationVar : Text[1024];
        LineNarrationGVar : Text;
        PrintClosingEntries : Boolean;
        PostingDateCaptionLbl : Label 'Posting Date';
        ParticularsCaptionLbl : Label 'Particulars';
        DocTypeCaptionLbl : Label 'Document Type';
        ExtDocNoCaptionLbl : Label 'External Doc. No.';
        DocDateCaptionLbl : Label '"Document Date "';
        DebitCaptionLbl : Label 'Debit';
        CreditCaptionLbl : Label 'Credit';
        PageCaptionLbl : Label 'Page';
        ClosingBalanceCaptionLbl : Label 'Closing Balance';
        InternaldocNumberCaptionLbl : Label 'Internal Doc. No.';
        TelCaptionLbl : Label 'TEL :';
        FaxCaptionLbl : Label 'FAX :';

    [LineStart(21397)]
    procedure FindGLAccName("Source Type" : Option " ",Customer,Vendor,"Bank Account","Fixed Asset";"Entry No." : Integer;"Source No." : Code[20];"G/L Account No." : Code[20]) : Text[50];
    var
        AccName : Text[50];
        VendLedgerEntry : Record "Vendor Ledger Entry";
        Vend : Record Vendor;
        CustLedgerEntry : Record "Cust. Ledger Entry";
        Cust : Record Customer;
        BankLedgerEntry : Record "Bank Account Ledger Entry";
        Bank : Record "Bank Account";
        FALedgerEntry : Record "FA Ledger Entry";
        FA : Record "Fixed Asset";
        GLAccount : Record "G/L Account";
    begin
        IF "Source Type" = "Source Type"::Vendor THEN
          IF VendLedgerEntry.GET("Entry No.") THEN BEGIN
            Vend.GET("Source No.");
            AccName := Vend.Name;
          END ELSE BEGIN
            GLAccount.GET("G/L Account No.");
            AccName := GLAccount.Name;
          END
        ELSE IF "Source Type" = "Source Type"::Customer THEN
          IF CustLedgerEntry.GET("Entry No.") THEN BEGIN
            Cust.GET("Source No.");
            AccName := Cust.Name;
          END ELSE BEGIN
            GLAccount.GET("G/L Account No.");
            AccName := GLAccount.Name;
          END
        ELSE IF "Source Type" = "Source Type"::"Bank Account" THEN
          IF BankLedgerEntry.GET("Entry No.") THEN BEGIN
            Bank.GET("Source No.");
            AccName := Bank.Name;
          END ELSE BEGIN
            GLAccount.GET("G/L Account No.");
            AccName := GLAccount.Name;
          END
        ELSE BEGIN
          GLAccount.GET("G/L Account No.");
          AccName := GLAccount.Name;
        END;

        IF "Source Type" = "Source Type"::" " THEN BEGIN
          GLAccount.GET("G/L Account No.");
          AccName := GLAccount.Name;
        END;

        EXIT(AccName);
    end;

    [LineStart(21434)]
    procedure GetDescription(DocumentNoPar : Code[20];GlAccNoPar : Code[20]) : Text;
    var
        GLEntryLrec : Record "G/L Entry";
        DebitFlag : Boolean;
        CreditFlag : Boolean;
        GLAccountLrec : Record "G/L Account";
        VendLedgerEntryLrec : Record "Vendor Ledger Entry";
        VendorLrec : Record Vendor;
        BankAccLedEntryLrec : Record "Bank Account Ledger Entry";
        BankAccountLrec : Record "Bank Account";
        CustLedgerEntryLrec : Record "Cust. Ledger Entry";
        CustomerLrec : Record Customer;
        CustPostGroupLrec : Record "Customer Posting Group";
        CustLedDebitFlag : Boolean;
        CustLedCreditFlag : Boolean;
    begin
        DebitFlag := FALSE;
        CreditFlag := FALSE;
        CustLedDebitFlag := FALSE;
        CustLedCreditFlag := FALSE;

        //Serching for Customer ledger entries
        CustLedgerEntryLrec.RESET;
        CustLedgerEntryLrec.SETCURRENTKEY("Document No.");
        CustLedgerEntryLrec.SETRANGE("Document No.",DocumentNoPar);
        IF CustLedgerEntryLrec.FINDFIRST THEN BEGIN
          IF CustomerLrec.GET(CustLedgerEntryLrec."Customer No.") THEN BEGIN
            IF CustPostGroupLrec.GET(CustomerLrec."Customer Posting Group") AND (CustPostGroupLrec."Receivables Account"<>'') THEN BEGIN
              GLEntryLrec.RESET;
              GLEntryLrec.SETRANGE("Document No.",DocumentNoPar);
              GLEntryLrec.SETRANGE("G/L Account No.",CustPostGroupLrec."Receivables Account");
              IF GLEntryLrec.FINDFIRST THEN BEGIN
                IF GLEntryLrec."Debit Amount" >0 THEN
                  CustLedDebitFlag := TRUE
                ELSE IF GLEntryLrec."Credit Amount" >0 THEN
                  CustLedCreditFlag := TRUE;
              END;
            END;
          END;
        END;

        GLEntryLrec.RESET;
        GLEntryLrec.SETRANGE("Document No.",DocumentNoPar);
        GLEntryLrec.SETRANGE("G/L Account No.",GlAccNoPar);
        IF GLEntryLrec.FINDFIRST THEN BEGIN
          IF GLEntryLrec."Debit Amount" >0 THEN
            DebitFlag := TRUE
          ELSE IF GLEntryLrec."Credit Amount" >0 THEN
            CreditFlag := TRUE;
        END;

        IF NOT(CustLedDebitFlag = DebitFlag) OR NOT(CustLedCreditFlag = CreditFlag) THEN BEGIN
          IF CreditFlag THEN BEGIN
            GLEntryLrec.RESET;
            GLEntryLrec.SETRANGE("Document No.",DocumentNoPar);
            GLEntryLrec.SETFILTER("Debit Amount",'>%1',0);
            IF GLEntryLrec.FINDFIRST THEN BEGIN
              GLAccountLrec.RESET;
              GLAccountLrec.SETRANGE("No.",GLEntryLrec."G/L Account No.");
              IF GLAccountLrec.FINDFIRST THEN
                EXIT(GLAccountLrec.Name);
            END;
          END ELSE IF DebitFlag THEN BEGIN
            VendLedgerEntryLrec.RESET;
            VendLedgerEntryLrec.SETCURRENTKEY("Document No.");
            VendLedgerEntryLrec.SETRANGE("Document No.",DocumentNoPar);
            IF VendLedgerEntryLrec.FINDFIRST THEN BEGIN
              VendorLrec.RESET;
              VendorLrec.SETRANGE("No.",VendLedgerEntryLrec."Vendor No.");
              IF VendorLrec.FINDFIRST THEN
                EXIT(VendorLrec.Name);
            END ELSE BEGIN
              CustLedgerEntryLrec.RESET;
              CustLedgerEntryLrec.SETCURRENTKEY("Document No.");
              CustLedgerEntryLrec.SETRANGE("Document No.",DocumentNoPar);
              IF CustLedgerEntryLrec.FINDFIRST THEN BEGIN
                IF CustomerLrec.GET(CustLedgerEntryLrec."Customer No.") THEN
                   EXIT(CustomerLrec.Name);
              END ELSE BEGIN
                BankAccLedEntryLrec.RESET;
                BankAccLedEntryLrec.SETCURRENTKEY("Document No.");
                BankAccLedEntryLrec.SETRANGE("Document No.",DocumentNoPar);
                IF BankAccLedEntryLrec.FINDFIRST THEN BEGIN
                  BankAccountLrec.RESET;
                  BankAccountLrec.SETRANGE("No.",BankAccLedEntryLrec."Bank Account No.");
                  IF BankAccountLrec.FINDFIRST THEN
                    EXIT(BankAccountLrec.Name);
                END ELSE BEGIN
                  GLEntryLrec.RESET;
                  GLEntryLrec.SETRANGE("Document No.",DocumentNoPar);
                  GLEntryLrec.SETFILTER("Credit Amount",'>%1',0);
                  IF GLEntryLrec.FINDFIRST THEN BEGIN
                    GLAccountLrec.RESET;
                    GLAccountLrec.SETRANGE("No.",GLEntryLrec."G/L Account No.");
                    IF GLAccountLrec.FINDFIRST THEN
                      EXIT(GLAccountLrec.Name);
                  END;
                END;
              END;
            END;
          END;
        END;

        IF CustLedDebitFlag = DebitFlag OR CustLedCreditFlag = CreditFlag THEN BEGIN
          GLEntryLrec.RESET;
          GLEntryLrec.SETRANGE("Document No.",DocumentNoPar);
          IF CustLedDebitFlag AND DebitFlag THEN
            GLEntryLrec.SETFILTER("Debit Amount",'>%1',0);
          IF CustLedCreditFlag AND CreditFlag THEN
            GLEntryLrec.SETFILTER("Credit Amount",'>%1',0);
          IF GLEntryLrec.FINDFIRST THEN BEGIN
            GLAccountLrec.RESET;
            GLAccountLrec.SETRANGE("No.",GLEntryLrec."G/L Account No.");
            IF GLAccountLrec.FINDFIRST THEN
              EXIT(GLAccountLrec.Name);
          END;
        END;
    end;
}

