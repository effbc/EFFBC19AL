report 80005 "Customer - Trial Balance3"
{
    // version NAVW17.00

    DefaultLayout = RDLC;
    RDLCLayout = './Customer - Trial Balance3.rdlc';
    CaptionML = ENU='Customer - Trial Balance',
                ENN='Customer - Trial Balance';

    dataset
    {
        dataitem(Customer;Customer)
        {
            DataItemTableView = SORTING(Customer Posting Group);
            RequestFilterFields = "No.","Date Filter","Customer Posting Group";
            column(CompanyName;COMPANYNAME)
            {
            }
            column(PeriodFilter;STRSUBSTNO(Text003,PeriodFilter))
            {
            }
            column(FORMAT_TODAY_0_4_;FORMAT(TODAY,0,4))
            {
            }
            column(USERID;USERID)
            {
            }
            column(CurrReport_PAGENO;CurrReport.PAGENO)
            {
            }
            column(CustFieldCaptPostingGroup;STRSUBSTNO(Text005,FIELDCAPTION("Customer Posting Group")))
            {
            }
            column(CustTableCaptioncustFilter;TABLECAPTION + ': ' + CustFilter)
            {
            }
            column(CustFilter;CustFilter)
            {
            }
            column(EmptyString;'')
            {
            }
            column(PeriodStartDate;FORMAT(PeriodStartDate))
            {
            }
            column(PeriodFilter1;PeriodFilter)
            {
            }
            column(FiscalYearStartDate;FORMAT(FiscalYearStartDate))
            {
            }
            column(FiscalYearFilter;FiscalYearFilter)
            {
            }
            column(PeriodEndDate;FORMAT(PeriodEndDate))
            {
            }
            column(PostingGroup_Customer;"Customer Posting Group")
            {
            }
            column(YTDTotal;YTDTotal)
            {
                AutoFormatType = 1;
            }
            column(YTDCreditAmt;YTDCreditAmt)
            {
                AutoFormatType = 1;
            }
            column(YTDDebitAmt;YTDDebitAmt)
            {
                AutoFormatType = 1;
            }
            column(YTDBeginBalance;YTDBeginBalance)
            {
            }
            column(PeriodCreditAmt;PeriodCreditAmt)
            {
            }
            column(PeriodDebitAmt;PeriodDebitAmt)
            {
            }
            column(PeriodBeginBalance;PeriodBeginBalance)
            {
            }
            column(Name_Customer;Name)
            {
                IncludeCaption = true;
            }
            column(No_Customer;"No.")
            {
                IncludeCaption = true;
            }
            column(PeriodDebitAmt_PeriodCreditAmt;PeriodDebitAmt-PeriodCreditAmt)
            {
            }
            column(TotalPostGroup_Customer;Text004 + FORMAT(' ') + "Customer Posting Group")
            {
            }
            column(CustTrialBalanceCaption;CustTrialBalanceCaptionLbl)
            {
            }
            column(CurrReportPageNoCaption;CurrReportPageNoCaptionLbl)
            {
            }
            column(AmtsinLCYCaption;AmtsinLCYCaptionLbl)
            {
            }
            column(inclcustentriesinperiodCaption;inclcustentriesinperiodCaptionLbl)
            {
            }
            column(YTDTotalCaption;YTDTotalCaptionLbl)
            {
            }
            column(PeriodCaption;PeriodCaptionLbl)
            {
            }
            column(FiscalYearToDateCaption;FiscalYearToDateCaptionLbl)
            {
            }
            column(NetChangeCaption;NetChangeCaptionLbl)
            {
            }
            column(TotalinLCYCaption;TotalinLCYCaptionLbl)
            {
            }

            trigger OnAfterGetRecord();
            begin
                CalcAmounts(
                  PeriodStartDate,PeriodEndDate,
                  PeriodBeginBalance,PeriodDebitAmt,PeriodCreditAmt,YTDTotal);

                CalcAmounts(
                  FiscalYearStartDate,PeriodEndDate,
                  YTDBeginBalance,YTDDebitAmt,YTDCreditAmt,YTDTotal);
            end;

            trigger OnPreDataItem();
            begin
                LastFieldNo := FIELDNO("Customer Posting Group");
                CurrReport.CREATETOTALS(
                  PeriodBeginBalance,PeriodDebitAmt,PeriodCreditAmt,YTDBeginBalance,
                  YTDDebitAmt,YTDCreditAmt,YTDTotal);
                TempExcelBuffer.DELETEALL;
                CLEAR(TempExcelBuffer);
                row:=0;
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
        label(PeriodBeginBalanceCaption;ENU='Beginning Balance',
                                        ENN='Beginning Balance')
        label(PeriodDebitAmtCaption;ENU='Debit',
                                    ENN='Debit')
        label(PeriodCreditAmtCaption;ENU='Credit',
                                     ENN='Credit')
    }

    trigger OnInitReport();
    begin
        HideZeroAmounts := TRUE;
    end;

    trigger OnPreReport();
    begin
        IF Excel THEN
        BEGIN
        TempExcelBuffer.CreateBook('');//B2B
        //TempExcelBuffer.CreateSheet('test excel','',COMPANYNAME,'');//B2B
        TempExcelBuffer.GiveUserControl;
        END;

        WITH Customer DO BEGIN
          PeriodFilter := GETFILTER("Date Filter");
          PeriodStartDate := GETRANGEMIN("Date Filter");
          PeriodEndDate := GETRANGEMAX("Date Filter");
          SETRANGE("Date Filter");
          CustFilter := GETFILTERS;
          SETRANGE("Date Filter",PeriodStartDate,PeriodEndDate);
          AccountingPeriod.SETRANGE("Starting Date",040108D,PeriodEndDate);
          AccountingPeriod.SETRANGE("New Fiscal Year",TRUE);
          IF AccountingPeriod.FINDLAST THEN
            FiscalYearStartDate := AccountingPeriod."Starting Date"
          ELSE
            ERROR(Text000,AccountingPeriod.FIELDCAPTION("Starting Date"),AccountingPeriod.TABLECAPTION);
          FiscalYearFilter := FORMAT(FiscalYearStartDate) + '..' + FORMAT(PeriodEndDate);
        END;
    end;

    var
        Text000 : TextConst ENU='It was not possible to find a %1 in %2.',ENN='It was not possible to find a %1 in %2.';
        AccountingPeriod : Record "Accounting Period";
        PeriodBeginBalance : Decimal;
        PeriodDebitAmt : Decimal;
        PeriodCreditAmt : Decimal;
        YTDBeginBalance : Decimal;
        YTDDebitAmt : Decimal;
        YTDCreditAmt : Decimal;
        YTDTotal : Decimal;
        LastFieldNo : Integer;
        HideZeroAmounts : Boolean;
        PeriodFilter : Text[250];
        FiscalYearFilter : Text[250];
        CustFilter : Text[1024];
        PeriodStartDate : Date;
        PeriodEndDate : Date;
        FiscalYearStartDate : Date;
        Text001 : Label 'Net change for period';
        Text002 : Label 'Year To Date';
        Text003 : TextConst ENU='Period: %1',ENN='Period: %1';
        Text004 : TextConst ENU='Total for',ENN='Total for';
        Text005 : TextConst ENU='Group Totals: %1',ENN='Group Totals: %1';
        CustTrialBalanceCaptionLbl : TextConst ENU='Customer - Trial Balance',ENN='Customer - Trial Balance';
        CurrReportPageNoCaptionLbl : TextConst ENU='Page',ENN='Page';
        AmtsinLCYCaptionLbl : TextConst ENU='Amounts in LCY',ENN='Amounts in LCY';
        inclcustentriesinperiodCaptionLbl : TextConst ENU='Only includes customers with entries in the period',ENN='Only includes customers with entries in the period';
        YTDTotalCaptionLbl : TextConst ENU='Ending Balance',ENN='Ending Balance';
        PeriodCaptionLbl : TextConst ENU='Period',ENN='Period';
        FiscalYearToDateCaptionLbl : TextConst ENU='Fiscal Year-To-Date',ENN='Fiscal Year-To-Date';
        NetChangeCaptionLbl : TextConst ENU='Net Change',ENN='Net Change';
        TotalinLCYCaptionLbl : TextConst ENU='Total in LCY',ENN='Total in LCY';
        begining : Boolean;
        without : Boolean;
        TempExcelBuffer : Record "Excel Buffer" temporary;
        row : Integer;
        Excel : Boolean;
        cs : Boolean;
        prd : Boolean;
        Customer___Trial_BalanceCaptionLbl : Label 'Customer - Trial Balance';
        CurrReport_PAGENOCaptionLbl : Label 'Page';
        Amounts_in_LCYCaptionLbl : Label 'Amounts in LCY';
        Only_includes_customers_with_entries_in_the_periodCaptionLbl : Label 'Only includes customers with entries in the period';
        PeriodBeginBalanceCaptionLbl : Label 'Beginning Balance';
        PeriodDebitAmtCaptionLbl : Label 'Debit';
        PeriodCreditAmtCaptionLbl : Label 'Credit';
        YTDBeginBalanceCaptionLbl : Label 'Beginning Balance';
        YTDDebitAmtCaptionLbl : Label 'Debit';
        YTDCreditAmtCaptionLbl : Label 'Credit';
        Fiscal_Year_To_DateCaptionLbl : Label 'Fiscal Year-To-Date';
        Net_ChangeCaptionLbl : Label 'Net Change';
        Net_ChangeCaption_Control54Lbl : Label 'Net Change';
        Total_in_LCYCaptionLbl : Label 'Total in LCY';

    [LineStart(12185)]
    local procedure CalcAmounts(DateFrom : Date;DateTo : Date;var BeginBalance : Decimal;var DebitAmt : Decimal;var CreditAmt : Decimal;var TotalBalance : Decimal);
    var
        DtlCustLedgEntry : Record "Detailed Cust. Ledg. Entry";
    begin

        Customer.SETRANGE("Date Filter",040108D,DateFrom - 1);
        Customer.CALCFIELDS("Net Change (LCY)");
        BeginBalance := Customer."Net Change (LCY)";

        WITH DtlCustLedgEntry DO BEGIN
          SETCURRENTKEY("Customer No.","Posting Date","Entry Type","Currency Code","Initial Entry Global Dim. 1");

          SETRANGE("Customer No.",Customer."No.");
          SETRANGE("Posting Date",DateFrom,DateTo);
          IF prd=TRUE THEN
         SETFILTER("Initial Entry Global Dim. 1",'PRD-0010..PRD-027');
         IF cs=TRUE THEN
         SETFILTER("Initial Entry Global Dim. 1",'CUS-002..CUS-005');
          SETFILTER("Entry Type",'<> %1',"Entry Type"::Application);
          CALCSUMS("Debit Amount (LCY)","Credit Amount (LCY)");
          DebitAmt := "Debit Amount (LCY)";
          CreditAmt := "Credit Amount (LCY)";
          IF begining=TRUE THEN
          TotalBalance :=BeginBalance+DebitAmt - CreditAmt;
          IF without=TRUE THEN
          TotalBalance :=DebitAmt - CreditAmt;
        END;
    end;

    [LineStart(12210)]
    procedure EnterCell(RowNo : Integer;ColumnNo : Integer;CellValue : Text[250];Bold : Boolean);
    begin
        TempExcelBuffer.INIT;
        TempExcelBuffer.VALIDATE("Row No.",RowNo);
        TempExcelBuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelBuffer."Cell Value as Text" := CellValue;
        TempExcelBuffer.Bold:=Bold ;
        TempExcelBuffer.INSERT;
    end;

    [LineStart(12218)]
    procedure EnterHeadings(RowNo : Integer;ColumnNo : Integer;CellValue : Text[250];Bold : Boolean);
    begin
        TempExcelBuffer.INIT;
        TempExcelBuffer.VALIDATE("Row No.",RowNo);
        TempExcelBuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelBuffer."Cell Value as Text" := FORMAT(CellValue);
        TempExcelBuffer.Bold:=Bold ;
        TempExcelBuffer.Formula := '';
        TempExcelBuffer.INSERT;
    end;
}

