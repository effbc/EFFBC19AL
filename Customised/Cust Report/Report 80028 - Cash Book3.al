report 80028 "Cash Book3"
{
    // version NAVIN7.00

    DefaultLayout = RDLC;
    RDLCLayout = './Cash Book3.rdlc';
    CaptionML = ENU='Cash Book',
                ENN='Cash Book';

    dataset
    {
        dataitem("G/L Account";"G/L Account")
        {
            DataItemTableView = SORTING(No.) ORDER(Ascending) WHERE(Account Type=FILTER(Posting));
            RequestFilterFields = "No.","Date Filter","Global Dimension 1 Filter","Global Dimension 2 Filter";
            column(TodayFormatted;FORMAT(TODAY,0,4))
            {
            }
            column(CompanyInfoName;CompInfo.Name)
            {
            }
            column(BookName;Name +'  '+ 'Book')
            {
            }
            column(GetFilters;GETFILTERS)
            {
            }
            column(LocationFilter;LocationFilter)
            {
            }
            column(OneEntryRecord;OneEntryRecord)
            {
            }
            column(FirstRecord;FirstRecord)
            {
            }
            column(PrintDetail;PrintDetail)
            {
            }
            column(No_GLAccount;"G/L Account"."No.")
            {
            }
            column(OpeningBalanceFormatted;'Opening Balance As On'+ ' '+FORMAT(GETRANGEMIN("Date Filter")))
            {
            }
            column(OpeningDRBal;OpeningDRBal)
            {
            }
            column(OpeningCRBal;OpeningCRBal)
            {
            }
            column(OpeningDRCRBal;ABS(OpeningDRBal-OpeningCRBal))
            {
            }
            column(DrCrTextBalance;DrCrTextBalance)
            {
            }
            column(OpeningCRBalGLEntryCreditAmount;OpeningCRBal+"G/L Entry"."Credit Amount")
            {
            }
            column(OpeningDRBalGLEntryDebitAmount;OpeningDRBal+"G/L Entry"."Debit Amount")
            {
            }
            column(OpeningDRCRBalTransDebitsCredits;ABS(OpeningDRBal-OpeningCRBal+TransDebits-TransCredits))
            {
            }
            column(DrCrTextBalance2;DrCrTextBalance2)
            {
            }
            column(DateFilter_GLAccount;"Date Filter")
            {
            }
            column(GlobalDimension1Filter_GLAccount;"Global Dimension 1 Filter")
            {
            }
            column(GlobalDimension2Filter_GLAccount;"Global Dimension 2 Filter")
            {
            }
            column(PageNoCaption;PageCaptionLbl)
            {
            }
            column(PostingDateCaption;PostingDateCaptionLbl)
            {
            }
            column(DocumentNoCaption;DocumentNoCaptionLbl)
            {
            }
            column(DebitAmountCaption;DebitAmountCaptionLbl)
            {
            }
            column(CreditAmountCaption;CreditAmountCaptionLbl)
            {
            }
            column(AccountNameCaption;AccountNameCaptionLbl)
            {
            }
            column(BalanceCaption;BalanceCaptionLbl)
            {
            }
            column(VoucherTypeCaption;VoucherTypeCaptionLbl)
            {
            }
            column(LocationCodeCaption;LocationCodeCaptionLbl)
            {
            }
            column(ClosingBalanceCaption;ClosingBalanceCaptionLbl)
            {
            }
            column(Header;Header)
            {
            }
            column(Header1;Header1)
            {
            }
            dataitem("G/L Entry";"G/L Entry")
            {
                DataItemLink = G/L Account No.=FIELD(No.), Posting Date=FIELD(Date Filter), Global Dimension 1 Code=FIELD(Global Dimension 1 Filter), Global Dimension 2 Code=FIELD(Global Dimension 2 Filter);
                DataItemTableView = SORTING(Posting Date,G/L Account No.,Dimension Set ID) ORDER(Ascending) WHERE(Amount=FILTER(<>0));
                RequestFilterFields = "G/L Account No.","Document Type","Posting Date","Global Dimension 1 Code","Global Dimension 2 Code",Field60064;
                column(PostingDateFormatted_GLEntry;FORMAT("Posting Date",0,'<Day>-<Month Text,3>-<Year4>'))
                {
                }
                column(PostingDate;"Posting Date")
                {
                }
                column(DocumentNo_GLEntry;"Document No.")
                {
                }
                column(DebitAmount_GLEntry;"Debit Amount")
                {
                }
                column(CreditAmount_GLEntry;"Credit Amount")
                {
                }
                column(OpeningDRCRBalTransDebitsCredits1;ABS(OpeningDRBal-OpeningCRBal+TransDebits-TransCredits))
                {
                }
                column(SourceDesc;SourceDesc)
                {
                }
                column(DrCrTextBalance3;DrCrTextBalance)
                {
                }
                column(LocationCode_GLEntry;"G/L Entry"."Location Code")
                {
                }
                column(TotalCreditAmount;TotalCreditAmount)
                {
                }
                column(TotalDebitAmount;TotalDebitAmount)
                {
                }
                column(EntryNo_GLEntry;"Entry No.")
                {
                }
                column(Payment_Type;FORMAT("Payment Type"))
                {
                }
                dataitem("<G/L Entry1>";"G/L Entry")
                {
                    DataItemLink = Posting Date=FIELD(Posting Date), Document No.=FIELD(Document No.);
                    DataItemTableView = SORTING(Posting Date,G/L Account No.,Dimension Set ID) ORDER(Ascending) WHERE(Amount=FILTER(<>0));
                    column(AccountName;AccountName)
                    {
                    }
                    column(Description;Description)
                    {
                    }
                    column(DebitAmount_GLEntry1;"<G/L Entry1>"."Debit Amount")
                    {
                    }
                    column(CreditAmount_GLEntry1;"<G/L Entry1>"."Credit Amount")
                    {
                    }

                    trigger OnAfterGetRecord();
                    begin
                        IF  "<G/L Entry1>"."G/L Account No." = "G/L Entry"."G/L Account No." THEN
                          CurrReport.SKIP;
                        AccountName := '';
                        Desc := '';
                        Desc1 := '';
                        IF "<G/L Entry1>"."Source Type" <> "<G/L Entry1>"."Source Type"::" " THEN
                        BEGIN
                          CASE "<G/L Entry1>"."Source Type" OF
                            "<G/L Entry1>"."Source Type"::Customer :
                            BEGIN
                              Cust.RESET;
                              Cust.SETRANGE(Cust."No.","<G/L Entry1>"."Source No.");
                              IF Cust.FINDFIRST THEN
                                Desc := Cust.Name;
                            END;
                            "<G/L Entry1>"."Source Type"::Vendor :
                            BEGIN
                              Vendor.RESET;
                              Vendor.SETRANGE(Vendor."No.","<G/L Entry1>"."Source No.");
                              IF Vendor.FINDFIRST THEN
                                Desc := Vendor.Name;
                            END;
                            "<G/L Entry1>"."Source Type"::"Bank Account" :
                            BEGIN
                              BankAccount.RESET;
                              BankAccount.SETRANGE(BankAccount."No.","<G/L Entry1>"."Source No.");
                              IF BankAccount.FINDFIRST THEN
                                Desc := BankAccount.Name;
                            END;
                            "<G/L Entry1>"."Source Type"::"Fixed Asset" :
                            BEGIN
                              FixedAsset.RESET;
                              FixedAsset.SETRANGE(FixedAsset."No.","<G/L Entry1>"."Source No.");
                              IF FixedAsset.FINDFIRST THEN
                                Desc := FixedAsset.Description;
                            END;
                          END;
                        END
                        ELSE BEGIN
                          DimSetEnt.RESET;
                          DimSetEnt.SETRANGE(DimSetEnt."Dimension Set ID","<G/L Entry1>"."Dimension Set ID");
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
                        GLAccnt.SETRANGE(GLAccnt."No.","<G/L Entry1>"."G/L Account No.");
                        IF GLAccnt.FINDFIRST THEN
                        BEGIN
                          IF Desc <> '' THEN
                          BEGIN
                            /*
                            IF GLAccnt."Search Name" <> '' THEN
                              AccountName := GLAccnt."Search Name" +' A/C('+"<G/L Entry1>"."G/L Account No."+')'+'-'+Desc
                            ELSE
                            */
                            IF "<G/L Entry1>"."Source Type" IN["<G/L Entry1>"."Source Type"::Customer,"<G/L Entry1>"."Source Type"::Vendor] THEN
                              AccountName := Desc
                            ELSE
                              AccountName := GLAccnt.Name+'('+"<G/L Entry1>"."Global Dimension 1 Code"+')'+'-'+Desc;
                          END
                          ELSE
                            AccountName:=GLAccnt.Name+'('+"<G/L Entry1>"."Global Dimension 1 Code"+')';
                        END;
                        
                        IF Excel THEN
                        BEGIN
                          IF (PrevPostingDate <> "Posting Date") AND (PrevPostingDate <> 0D) THEN
                          BEGIN
                            Row+=1;
                            Entercell(Row,7,'Total',TRUE,TempExcelbuffer."Cell Type"::Text);
                            Entercell(Row,9,FORMAT(DateWiseDebitTot),TRUE,TempExcelbuffer."Cell Type"::Number);
                            Entercell(Row,8,FORMAT(DateWiseCreditTot),TRUE,TempExcelbuffer."Cell Type"::Number);
                            DateWiseCreditTot := 0; DateWiseDebitTot := 0;
                          END;
                          Row+=1;
                          SerNo+=1;
                          Entercell(Row,1,FORMAT(SerNo),FALSE,TempExcelbuffer."Cell Type"::Number);
                          Entercell(Row,2,FORMAT("G/L Entry"."Posting Date"),FALSE,TempExcelbuffer."Cell Type"::Date);
                          Entercell(Row,3,FORMAT("G/L Entry"."Document No."),FALSE,TempExcelbuffer."Cell Type"::Text);
                          Entercell(Row,4,FORMAT("G/L Entry"."Payment Type"),FALSE,TempExcelbuffer."Cell Type"::Text);
                          Entercell(Row,5,FORMAT("<G/L Entry1>"."External Document No."),FALSE,TempExcelbuffer."Cell Type"::Text);
                          IF FORMAT("<G/L Entry1>"."Payment Type") = 'Receipt' THEN
                            Entercell(Row,6,'To '+FORMAT(AccountName),FALSE,TempExcelbuffer."Cell Type"::Text)
                          ELSE
                            Entercell(Row,6,'By '+FORMAT(AccountName),FALSE,TempExcelbuffer."Cell Type"::Text);
                          Entercell(Row,7,FORMAT(Description),FALSE,TempExcelbuffer."Cell Type"::Text);
                          Entercell(Row,9,FORMAT("<G/L Entry1>"."Debit Amount"),FALSE,TempExcelbuffer."Cell Type"::Number);
                          Entercell(Row,8,FORMAT("<G/L Entry1>"."Credit Amount"),FALSE,TempExcelbuffer."Cell Type"::Number);
                        END;
                        
                        
                        DateWiseDebitTot+="<G/L Entry1>"."Debit Amount";
                        DateWiseCreditTot+="<G/L Entry1>"."Credit Amount";
                        TotalDebitAmount += "<G/L Entry1>"."Debit Amount";
                        TotalCreditAmount += "<G/L Entry1>"."Credit Amount";
                        PrevPostingDate :="<G/L Entry1>"."Posting Date";

                    end;

                    trigger OnPreDataItem();
                    begin
                        "<G/L Entry1>".SETFILTER("<G/L Entry1>"."G/L Account No.",'<>%1',"G/L Entry"."G/L Account No.");
                    end;
                }

                trigger OnAfterGetRecord();
                begin
                    IF  "G/L Entry"."G/L Account No." <> "G/L Account"."No." THEN
                      CurrReport.SKIP;
                    AccountName := '';
                    Desc := '';
                    Desc1 := '';
                end;

                trigger OnPostDataItem();
                begin
                    IF Excel THEN
                    BEGIN
                      Row+=1;
                      Entercell(Row,7,'Total',TRUE,TempExcelbuffer."Cell Type"::Text);
                      Entercell(Row,9,FORMAT(DateWiseDebitTot),TRUE,TempExcelbuffer."Cell Type"::Number);
                      Entercell(Row,8,FORMAT(DateWiseCreditTot),TRUE,TempExcelbuffer."Cell Type"::Number);
                      Row+=1;
                      Entercell(Row,7,'Grand Total',TRUE,TempExcelbuffer."Cell Type"::Text);
                      Entercell(Row,9,FORMAT(TotalDebitAmount),TRUE,TempExcelbuffer."Cell Type"::Number);
                      Entercell(Row,8,FORMAT(TotalCreditAmount),TRUE,TempExcelbuffer."Cell Type"::Number);
                    END;
                end;

                trigger OnPreDataItem();
                begin
                    IF FORMAT("G/L Account".GETFILTER("No.")) = '22100' THEN
                      "G/L Entry".SETFILTER("G/L Entry"."Global Dimension 1 Code",'<>%1','CUS*')
                    ELSE IF FORMAT("G/L Account".GETFILTER("No.")) = '22101' THEN
                      "G/L Entry".SETFILTER("G/L Entry"."Global Dimension 1 Code",'%1','CUS*');

                    IF LocationCode <> '' THEN
                      SETFILTER("Location Code",LocationCode);

                    DateWiseDebitTot := 0;
                    DateWiseCreditTot := 0;
                    TotalDebitAmount := 0;
                    TotalCreditAmount := 0;
                    SerNo := 0;
                end;
            }

            trigger OnPreDataItem();
            begin
                TempExcelbuffer.DELETEALL;
                CLEAR(TempExcelbuffer);
                Row:=0;

                IF LocationCode <> '' THEN BEGIN
                  LocationFilter := 'Location Code: ' + LocationCode;
                END;
                IF DATE2DMY(GETRANGEMIN("Date Filter"),2) > 3 THEN
                  FYear := FORMAT(DATE2DMY(GETRANGEMIN("Date Filter"),3))+'-'+COPYSTR(FORMAT(DATE2DMY(GETRANGEMIN("Date Filter"),3)+1),3,2)
                ELSE
                  FYear := FORMAT(DATE2DMY(GETRANGEMIN("Date Filter"),3))+'-'+COPYSTR(FORMAT(DATE2DMY(GETRANGEMIN("Date Filter"),3)+1),3,2);
                IF FORMAT("G/L Account".GETFILTER("No.")) = '' THEN
                  ERROR('Please Select the GL Account No.!');
                IF FORMAT("G/L Account".GETFILTER("Global Dimension 1 Filter")) <> '' THEN
                BEGIN
                  IF COPYSTR("G/L Account".GETFILTER("Global Dimension 1 Filter"),1,2) = 'AD' THEN
                    Header := 'ADMIN DIVISION '+FYear
                  ELSE IF COPYSTR("G/L Account".GETFILTER("Global Dimension 1 Filter"),1,2) = 'PR' THEN
                    Header := 'PROD DIVISION '+FYear
                  ELSE IF COPYSTR("G/L Account".GETFILTER("Global Dimension 1 Filter"),1,2) = 'RD' THEN
                    Header := 'R&D DIVISION '+FYear
                  ELSE IF COPYSTR("G/L Account".GETFILTER("Global Dimension 1 Filter"),1,2) = 'CU' THEN
                    Header := 'CUS DIVISION '+FYear;
                END;

                //ELSE ERROR('Please Select Departments Code!');

                Header1 := 'Cash Book for '+FORMAT(NORMALDATE(GETRANGEMIN("Date Filter")),0,'<Day>-<Month Text,3>-<Year4>');
                IF NORMALDATE(GETRANGEMAX("Date Filter")) <> NORMALDATE(GETRANGEMIN("Date Filter")) THEN
                  Header1+=' .. '+FORMAT(NORMALDATE(GETRANGEMAX("Date Filter")),0,'<Day>-<Month Text,3>-<Year4>');
                IF Excel THEN BEGIN
                  Row+=1;
                  EnterHeadings(Row,1,'S NO.',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,2,'DATE',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,3,'Voucher No.',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,4,'Voucher Type.',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,5,'Receipt No.',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,6,'Particulars',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,7,'Narration',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,8,'Debit Amt',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,9,'Credit Amt',TRUE,TempExcelbuffer."Cell Type"::Text);
                END;
                //IF FORMAT("G/L Account".GETFILTER("No.")) = '22100' THEN
                //  "G/L Entry".SETFILTER("G/L Entry"."Global Dimension 1 Code",'<>%1','CUS*');
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

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

    trigger OnPostReport();
    begin
        IF Excel THEN BEGIN
          TempExcelbuffer.CreateBook('Cash Book');
          TempExcelbuffer.WriteSheet('Cash Book',COMPANYNAME,USERID);
          TempExcelbuffer.CloseBook;
          TempExcelbuffer.OpenExcel;
          TempExcelbuffer.GiveUserControl;
        END;
    end;

    var
        CompInfo : Record "Company Information";
        GLEntry : Record "G/L Entry";
        GLEntry2 : Record "G/L Entry";
        SourceCode : Record "Source Code";
        VoucherAccount : Record "Voucher Account";
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
        AccountChanged : Boolean;
        AccountNo : Code[20];
        DrCrTextBalance2 : Text[2];
        GLAccNo : Code[20];
        TotalDebitAmount : Decimal;
        TotalCreditAmount : Decimal;
        PageCaptionLbl : TextConst ENU='Page',ENN='Page';
        PostingDateCaptionLbl : TextConst ENU='Posting Date',ENN='Posting Date';
        DocumentNoCaptionLbl : TextConst ENU='Document No.',ENN='Document No.';
        DebitAmountCaptionLbl : TextConst ENU='Debit Amount',ENN='Debit Amount';
        CreditAmountCaptionLbl : TextConst ENU='Credit Amount',ENN='Credit Amount';
        AccountNameCaptionLbl : TextConst ENU='Account Name',ENN='Account Name';
        BalanceCaptionLbl : TextConst ENU='Balance',ENN='Balance';
        VoucherTypeCaptionLbl : TextConst ENU='Voucher Type',ENN='Voucher Type';
        LocationCodeCaptionLbl : TextConst ENU='Location Code',ENN='Location Code';
        ClosingBalanceCaptionLbl : TextConst ENU='Closing Balance',ENN='Closing Balance';
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
        Excel : Boolean;
        TempExcelbuffer : Record "Excel Buffer" temporary;
        Row : Integer;
        DateWiseDebitTot : Decimal;
        DateWiseCreditTot : Decimal;
        PrevPostingDate : Date;
        SerNo : Integer;

    [LineStart(17964)]
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

    [LineStart(17974)]
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

