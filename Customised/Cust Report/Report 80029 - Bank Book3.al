report 80029 "Bank Book3"
{
    // version NAVIN7.00

    DefaultLayout = RDLC;
    RDLCLayout = './Bank Book3.rdlc';
    CaptionML = ENU='Bank Book',
                ENN='Bank Book';

    dataset
    {
        dataitem("Bank Account Ledger Entry";"Bank Account Ledger Entry")
        {
            DataItemTableView = SORTING(Posting Date) ORDER(Ascending);
            RequestFilterFields = "Bank Account No.","Posting Date","Global Dimension 1 Code","Global Dimension 2 Code";
            column(Header1;Header1)
            {
            }
            column(Bank_Account_Ledger_Entry_Entry_No_;"Entry No.")
            {
            }
            column(Bank_Account_Ledger_Entry_Bank_Account_No_;"Bank Account No.")
            {
            }
            column(Bank_Account_Ledger_Entry_Posting_Date;"Posting Date")
            {
            }
            column(Bank_Account_Ledger_Entry_Global_Dimension_1_Code;"Global Dimension 1 Code")
            {
            }
            column(Bank_Account_Ledger_Entry_Global_Dimension_2_Code;"Global Dimension 2 Code")
            {
            }
            dataitem("G/L Entry";"G/L Entry")
            {
                DataItemLink = Entry No.=FIELD(Entry No.);
                DataItemTableView = SORTING(G/L Account No.,Posting Date) ORDER(Ascending);
                column(G_L_Entry__Posting_Date_;FORMAT("Posting Date"))
                {
                }
                column(G_L_Entry__Document_No__;"Document No.")
                {
                }
                column(AccountName;AccountName)
                {
                }
                column(G_L_Entry__Debit_Amount_;"Debit Amount")
                {
                }
                column(G_L_Entry__Credit_Amount_;"Credit Amount")
                {
                }
                column(ABS_OpeningDRBal_OpeningCRBal_TransDebits_TransCredits__Control1500026;ABS(OpeningDRBal - OpeningCRBal + TransDebits - TransCredits))
                {
                }
                column(SourceDesc;SourceDesc)
                {
                }
                column(DrCrTextBalance_Control1500065;DrCrTextBalance)
                {
                }
                column(G_L_Entry__G_L_Entry___Location_Code_;"G/L Entry"."Location Code")
                {
                }
                column(Bank_Account_Ledger_Entry___Cheque_No__;"Bank Account Ledger Entry"."Cheque No.")
                {
                }
                column(Bank_Account_Ledger_Entry___Cheque_Date_;FORMAT("Bank Account Ledger Entry"."Cheque Date"))
                {
                }
                column(OneEntryRecord;OneEntryRecord)
                {
                }
                column(G_L_Entry_Entry_No_;"Entry No.")
                {
                }
                column(G_L_Entry_Transaction_No_;"Transaction No.")
                {
                }
                column(Description;Description)
                {
                }
                column(Payment_Type;FORMAT("Payment Type"))
                {
                }

                trigger OnAfterGetRecord();
                begin
                    AccountName := '';
                    Desc := '';
                    Desc1 := '';
                    IF "G/L Entry"."Source Type" <> "G/L Entry"."Source Type"::" " THEN
                    BEGIN
                      CASE "G/L Entry"."Source Type" OF
                        "G/L Entry"."Source Type"::Customer :
                        BEGIN
                          Cust.RESET;
                          Cust.SETRANGE(Cust."No.","G/L Entry"."Source No.");
                          IF Cust.FINDFIRST THEN
                            Desc := Cust.Name;
                        END;
                        "G/L Entry"."Source Type"::Vendor :
                        BEGIN
                          Vendor.RESET;
                          Vendor.SETRANGE(Vendor."No.","G/L Entry"."Source No.");
                          IF Vendor.FINDFIRST THEN
                            Desc := Vendor.Name;
                        END;
                        "G/L Entry"."Source Type"::"Bank Account" :
                        BEGIN
                          BankAccount.RESET;
                          BankAccount.SETRANGE(BankAccount."No.","G/L Entry"."Source No.");
                          IF BankAccount.FINDFIRST THEN
                            Desc := BankAccount.Name;
                        END;
                        "G/L Entry"."Source Type"::"Fixed Asset" :
                        BEGIN
                          FixedAsset.RESET;
                          FixedAsset.SETRANGE(FixedAsset."No.","G/L Entry"."Source No.");
                          IF FixedAsset.FINDFIRST THEN
                            Desc := FixedAsset.Description;
                        END;
                      END;
                    END
                    ELSE BEGIN
                      DimSetEnt.RESET;
                      DimSetEnt.SETRANGE(DimSetEnt."Dimension Set ID","G/L Entry"."Dimension Set ID");
                      DimSetEnt.SETFILTER(DimSetEnt."Dimension Code",'<>%1','DEPARTMENTS');
                      IF DimSetEnt.FINDFIRST THEN
                      BEGIN
                        DimVal.RESET;
                        DimVal.SETRANGE(DimVal."Dimension Code",DimSetEnt."Dimension Code");
                        DimVal.SETRANGE(DimVal.Code,DimSetEnt."Dimension Value Code");
                        IF DimVal.FINDFIRST THEN
                          Desc := DimVal.Name;
                      END;
                    END;
                    GLAccnt.RESET;
                    GLAccnt.SETRANGE(GLAccnt."No.","G/L Entry"."G/L Account No.");
                    IF GLAccnt.FINDFIRST THEN
                    BEGIN
                      IF Desc <> '' THEN
                      BEGIN
                        /*
                        IF GLAccnt."Search Name" <> '' THEN
                          AccountName := GLAccnt."Search Name" +' A/C('+"G/L Entry"."G/L Account No."+')'+'-'+Desc
                        ELSE
                        */
                        IF "G/L Entry"."Source Type" IN["G/L Entry"."Source Type"::Customer,"G/L Entry"."Source Type"::Vendor] THEN
                          AccountName := Desc
                        ELSE
                          AccountName := GLAccnt.Name+'('+"G/L Entry"."Global Dimension 1 Code"+')'+'-'+Desc;
                      END
                      ELSE
                        AccountName:=GLAccnt.Name+'('+"G/L Entry"."Global Dimension 1 Code"+')';
                    END;
                    
                    IF Excel THEN
                    BEGIN
                      IF (PrevPostingDate <> "G/L Entry"."Posting Date") AND (PrevPostingDate <> 0D) THEN
                      BEGIN
                        Row+=1;
                        Entercell(Row,8,'Total',TRUE,TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row,9,FORMAT(DateWiseDebitTot),TRUE,TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row,10,FORMAT(DateWiseCreditTot),TRUE,TempExcelbuffer."Cell Type"::Number);
                        DateWiseCreditTot := 0; DateWiseDebitTot := 0;
                      END;
                      Row+=1;
                      SerNo+=1;
                      Entercell(Row,1,FORMAT(SerNo),FALSE,TempExcelbuffer."Cell Type"::Number);
                      Entercell(Row,2,FORMAT("G/L Entry"."Posting Date"),FALSE,TempExcelbuffer."Cell Type"::Date);
                      Entercell(Row,3,FORMAT("G/L Entry"."Document No."),FALSE,TempExcelbuffer."Cell Type"::Text);
                      Entercell(Row,4,FORMAT("G/L Entry"."Payment Type"),FALSE,TempExcelbuffer."Cell Type"::Text);
                      Entercell(Row,5,FORMAT("G/L Entry"."External Document No."),FALSE,TempExcelbuffer."Cell Type"::Text);
                      Entercell(Row,6,FORMAT("G/L Entry"."Cheque No."),FALSE,TempExcelbuffer."Cell Type"::Text);
                      IF FORMAT("G/L Entry"."Payment Type") = 'Receipt' THEN
                        Entercell(Row,7,'To '+FORMAT(AccountName),FALSE,TempExcelbuffer."Cell Type"::Text)
                      ELSE
                        Entercell(Row,7,'By '+FORMAT(AccountName),FALSE,TempExcelbuffer."Cell Type"::Text);
                      Entercell(Row,8,FORMAT(Description),FALSE,TempExcelbuffer."Cell Type"::Text);
                      Entercell(Row,9,FORMAT("G/L Entry"."Debit Amount"),FALSE,TempExcelbuffer."Cell Type"::Number);
                      Entercell(Row,10,FORMAT("G/L Entry"."Credit Amount"),FALSE,TempExcelbuffer."Cell Type"::Number);
                    END;
                    
                    DateWiseDebitTot+="G/L Entry"."Debit Amount";
                    DateWiseCreditTot+="G/L Entry"."Credit Amount";
                    TotalDebitAmount += "G/L Entry"."Debit Amount";
                    TotalCreditAmount += "G/L Entry"."Credit Amount";
                    PrevPostingDate :="G/L Entry"."Posting Date";

                end;

                trigger OnPreDataItem();
                begin
                    IF LocationCode <> '' THEN
                      SETFILTER("Location Code",LocationCode);
                end;
            }

            trigger OnPostDataItem();
            begin
                IF Excel THEN
                BEGIN
                  Row+=1;
                  Entercell(Row,8,'Total',TRUE,TempExcelbuffer."Cell Type"::Text);
                  Entercell(Row,9,FORMAT(DateWiseDebitTot),TRUE,TempExcelbuffer."Cell Type"::Number);
                  Entercell(Row,10,FORMAT(DateWiseCreditTot),TRUE,TempExcelbuffer."Cell Type"::Number);
                  Row+=1;
                  Entercell(Row,8,'Grand Total',TRUE,TempExcelbuffer."Cell Type"::Text);
                  Entercell(Row,9,FORMAT(TotalDebitAmount),TRUE,TempExcelbuffer."Cell Type"::Number);
                  Entercell(Row,10,FORMAT(TotalCreditAmount),TRUE,TempExcelbuffer."Cell Type"::Number);
                END;
            end;

            trigger OnPreDataItem();
            begin
                IF LocationCode <> '' THEN
                  SETFILTER("Location Code",LocationCode);
                IF FORMAT("Bank Account Ledger Entry".GETFILTER("Bank Account Ledger Entry"."Posting Date")) = '' THEN
                  ERROR('Please enter Posting date!');
                IF DATE2DMY(GETRANGEMIN("Bank Account Ledger Entry"."Posting Date"),2) > 3 THEN
                  FYear := FORMAT(DATE2DMY(GETRANGEMIN("Bank Account Ledger Entry"."Posting Date"),3))+'-'+COPYSTR(FORMAT(DATE2DMY(GETRANGEMIN("Bank Account Ledger Entry"."Posting Date"),3)+1),3,2)
                ELSE
                  FYear := FORMAT(DATE2DMY(GETRANGEMIN("Bank Account Ledger Entry"."Posting Date"),3))+'-'+COPYSTR(FORMAT(DATE2DMY(GETRANGEMIN("Bank Account Ledger Entry"."Posting Date"),3)+1),3,2);

                Header1 := 'Bank Book for '+FORMAT(NORMALDATE(GETRANGEMIN("Bank Account Ledger Entry"."Posting Date")),0,'<Day>-<Month Text,3>-<Year4>');
                IF NORMALDATE(GETRANGEMAX("Bank Account Ledger Entry"."Posting Date")) <> NORMALDATE(GETRANGEMIN("Bank Account Ledger Entry"."Posting Date")) THEN
                  Header1+=' .. '+FORMAT(NORMALDATE(GETRANGEMAX("Bank Account Ledger Entry"."Posting Date")),0,'<Day>-<Month Text,3>-<Year4>');

                IF Excel THEN BEGIN
                  TempExcelbuffer.DELETEALL;
                  CLEAR(TempExcelbuffer);
                  Row:=0;

                  Row+=1;
                  EnterHeadings(Row,1,'S NO.',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,2,'DATE',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,3,'Voucher No.',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,4,'Voucher Type.',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,5,'Receipt No.',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,6,'Check No.',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,7,'Particulars',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,8,'Narration',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,9,'Debit Amt',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,10,'Credit Amt',TRUE,TempExcelbuffer."Cell Type"::Text);
                END;
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
                    CaptionML = ENU='Options',
                                ENN='Options';
                    field(LocationCode;LocationCode)
                    {
                        CaptionML = ENU='Location Code',
                                    ENN='Location Code';
                        TableRelation = Location;
                    }
                    field(Excel;Excel)
                    {
                        Caption = 'Excel';
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

    trigger OnInitReport();
    begin
        Excel := TRUE;
    end;

    trigger OnPostReport();
    begin
        IF Excel THEN BEGIN
          TempExcelbuffer.CreateBook('Bank Book');
          TempExcelbuffer.WriteSheet('Bank Book',COMPANYNAME,USERID);
          TempExcelbuffer.CloseBook;
          TempExcelbuffer.OpenExcel;
          TempExcelbuffer.GiveUserControl;
        END;
    end;

    var
        CompInfo : Record "Company Information";
        GLEntry : Record "G/L Entry";
        GLEntry2 : Record "G/L Entry";
        VoucherAccount : Record "Voucher Account";
        SourceCode : Record "Source Code";
        BankAccLedgEntry : Record "Bank Account Ledger Entry";
        Daybook : Report "Day Book";
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
        SourceDesc : Text[50];
        DrCrText : Text[2];
        DrCrTextBalance : Text[2];
        LocationCode : Code[10];
        LocationFilter : Text[100];
        Text16500 : TextConst ENU='As per Details',ENN='As per Details';
        BankAccountNo : Code[20];
        Text16501 : TextConst ENU='Dr',ENN='Dr';
        Text16502 : TextConst ENU='Cr',ENN='Cr';
        CurrReport_PAGENOCaptionLbl : TextConst ENU='Page',ENN='Page';
        Posting_DateCaptionLbl : TextConst ENU='Posting Date',ENN='Posting Date';
        Document_No_CaptionLbl : TextConst ENU='Document No.',ENN='Document No.';
        Debit_AmountCaptionLbl : TextConst ENU='Debit Amount',ENN='Debit Amount';
        Credit_AmountCaptionLbl : TextConst ENU='Credit Amount',ENN='Credit Amount';
        Account_NameCaptionLbl : TextConst ENU='Account Name',ENN='Account Name';
        BalanceCaptionLbl : TextConst ENU='Balance',ENN='Balance';
        Voucher_TypeCaptionLbl : TextConst ENU='Voucher Type',ENN='Voucher Type';
        Location_CodeCaptionLbl : TextConst ENU='Location Code',ENN='Location Code';
        Cheque_NoCaptionLbl : TextConst ENU='Cheque No',ENN='Cheque No';
        Cheque_DateCaptionLbl : TextConst ENU='Cheque Date',ENN='Cheque Date';
        Closing_BalanceCaptionLbl : TextConst ENU='Closing Balance',ENN='Closing Balance';
        Excel : Boolean;
        All : Boolean;
        DateWiseDebitTot : Decimal;
        DateWiseCreditTot : Decimal;
        PrevPostingDate : Date;
        SerNo : Integer;
        GLAccNo : Code[20];
        TotalDebitAmount : Decimal;
        TotalCreditAmount : Decimal;
        GLAccnt : Record "G/L Account";
        Header : Text[30];
        FYear : Text[10];
        Header1 : Text;
        Cust : Record Customer;
        Vendor : Record Vendor;
        BankAccount : Record "Bank Account";
        FixedAsset : Record "Fixed Asset";
        Desc : Text;
        DimSetEnt : Record "Dimension Set Entry";
        Desc1 : Text;
        DimVal : Record "Dimension Value";
        TempExcelbuffer : Record "Excel Buffer" temporary;
        Row : Integer;

    [LineStart(17996)]
    procedure Entercell(RowNo : Integer;ColumnNo : Integer;CellValue : Text[1000];bold : Boolean;CellType : Option);
    begin

        TempExcelbuffer.INIT;
        TempExcelbuffer.VALIDATE("Row No.",RowNo);
        TempExcelbuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelbuffer."Cell Value as Text" := CellValue;
        TempExcelbuffer.Bold:=bold ;
        TempExcelbuffer."Cell Type" := CellType;
        TempExcelbuffer.INSERT;
    end;

    [LineStart(18006)]
    procedure EnterHeadings(RowNo : Integer;ColumnNo : Integer;CellValue : Text[100];Bold : Boolean;CellType : Option);
    begin
        TempExcelbuffer.INIT;
        TempExcelbuffer.VALIDATE("Row No.",RowNo);
        TempExcelbuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelbuffer."Cell Value as Text" := FORMAT(CellValue);
        TempExcelbuffer.Bold:=Bold ;
        TempExcelbuffer."Cell Type" := CellType;
        TempExcelbuffer.Formula := '';
        TempExcelbuffer.INSERT;
    end;
}

