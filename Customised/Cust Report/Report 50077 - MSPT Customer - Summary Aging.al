report 50077 "MSPT Customer - Summary Aging"
{
    // version MSPT1.0

    // B2B Software Technologies
    // ---------------------------------------------------
    // Project : Mile Stone Payment Terms
    // B2B
    // No. sign   Description
    // ---------------------------------------------------
    // 01  B2B    MSPT Customer-Summary Aging
    DefaultLayout = RDLC;
    RDLCLayout = './MSPT Customer - Summary Aging.rdlc';

    Caption = 'MSPT Customer - Summary Aging';

    dataset
    {
        dataitem(Customer;Customer)
        {
            DataItemTableView = SORTING(No.);
            RequestFilterFields = "No.","Search Name","Customer Posting Group","Currency Filter";
            column(FORMAT_TODAY_0_4_;FORMAT(TODAY,0,4))
            {
            }
            column(COMPANYNAME;COMPANYNAME)
            {
            }
            column(CurrReport_PAGENO;CurrReport.PAGENO)
            {
            }
            column(USERID;USERID)
            {
            }
            column(Customer_TABLECAPTION__________CustFilter;Customer.TABLECAPTION + ': ' + CustFilter)
            {
            }
            column(EmptyString;'')
            {
            }
            column(PeriodStartDate_2_;PeriodStartDate[2])
            {
            }
            column(PeriodStartDate_3_;PeriodStartDate[3])
            {
            }
            column(PeriodStartDate_4_;PeriodStartDate[4])
            {
            }
            column(PeriodStartDate_3____1;PeriodStartDate[3] - 1)
            {
            }
            column(PeriodStartDate_4____1;PeriodStartDate[4] - 1)
            {
            }
            column(PeriodStartDate_5____1;PeriodStartDate[5] - 1)
            {
            }
            column(CustBalanceDueLCY_1_;CustBalanceDueLCY[1])
            {
                AutoFormatType = 1;
            }
            column(CustBalanceDueLCY_2_;CustBalanceDueLCY[2])
            {
                AutoFormatType = 1;
            }
            column(CustBalanceDueLCY_3_;CustBalanceDueLCY[3])
            {
                AutoFormatType = 1;
            }
            column(CustBalanceDueLCY_4_;CustBalanceDueLCY[4])
            {
                AutoFormatType = 1;
            }
            column(CustBalanceDueLCY_5_;CustBalanceDueLCY[5])
            {
                AutoFormatType = 1;
            }
            column(TotalCustBalanceLCY;TotalCustBalanceLCY)
            {
                AutoFormatType = 1;
            }
            column(LineTotalCustBalance;LineTotalCustBalance)
            {
                AutoFormatType = 1;
            }
            column(CustBalanceDue_5_;CustBalanceDue[5])
            {
                AutoFormatType = 1;
            }
            column(CustBalanceDue_4_;CustBalanceDue[4])
            {
                AutoFormatType = 1;
            }
            column(CustBalanceDue_3_;CustBalanceDue[3])
            {
                AutoFormatType = 1;
            }
            column(CustBalanceDue_2_;CustBalanceDue[2])
            {
                AutoFormatType = 1;
            }
            column(CustBalanceDue_1_;CustBalanceDue[1])
            {
                AutoFormatType = 1;
            }
            column(Customer_Name;Name)
            {
            }
            column(Customer__No__;"No.")
            {
            }
            column(CustBalanceDueLCY_1__Control39;CustBalanceDueLCY[1])
            {
                AutoFormatType = 1;
            }
            column(CustBalanceDueLCY_2__Control40;CustBalanceDueLCY[2])
            {
                AutoFormatType = 1;
            }
            column(CustBalanceDueLCY_3__Control41;CustBalanceDueLCY[3])
            {
                AutoFormatType = 1;
            }
            column(CustBalanceDueLCY_4__Control42;CustBalanceDueLCY[4])
            {
                AutoFormatType = 1;
            }
            column(CustBalanceDueLCY_5__Control43;CustBalanceDueLCY[5])
            {
                AutoFormatType = 1;
            }
            column(TotalCustBalanceLCY_Control44;TotalCustBalanceLCY)
            {
                AutoFormatType = 1;
            }
            column(CustBalanceDueLCY_1__Control46;CustBalanceDueLCY[1])
            {
                AutoFormatType = 1;
            }
            column(CustBalanceDueLCY_2__Control47;CustBalanceDueLCY[2])
            {
                AutoFormatType = 1;
            }
            column(CustBalanceDueLCY_3__Control48;CustBalanceDueLCY[3])
            {
                AutoFormatType = 1;
            }
            column(CustBalanceDueLCY_4__Control49;CustBalanceDueLCY[4])
            {
                AutoFormatType = 1;
            }
            column(CustBalanceDueLCY_5__Control50;CustBalanceDueLCY[5])
            {
                AutoFormatType = 1;
            }
            column(TotalCustBalanceLCY_Control51;TotalCustBalanceLCY)
            {
                AutoFormatType = 1;
            }
            column(Customer___Summary_AgingCaption;Customer___Summary_AgingCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
            {
            }
            column(All_amounts_are_in_LCYCaption;All_amounts_are_in_LCYCaptionLbl)
            {
            }
            column(Balance_DueCaption;Balance_DueCaptionLbl)
            {
            }
            column(Customer__No__Caption;FIELDCAPTION("No."))
            {
            }
            column(Customer_NameCaption;FIELDCAPTION(Name))
            {
            }
            column(CustBalanceDue_1_Caption;CustBalanceDue_1_CaptionLbl)
            {
            }
            column(CustBalanceDue_5_Caption;CustBalanceDue_5_CaptionLbl)
            {
            }
            column(LineTotalCustBalanceCaption;LineTotalCustBalanceCaptionLbl)
            {
            }
            column(CustBalanceDueLCY_1_Caption;CustBalanceDueLCY_1_CaptionLbl)
            {
            }
            column(CustBalanceDueLCY_1__Control39Caption;CustBalanceDueLCY_1__Control39CaptionLbl)
            {
            }
            column(Total__LCY_Caption;Total__LCY_CaptionLbl)
            {
            }
            dataitem("Integer";"Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number=FILTER(1..));

                trigger OnAfterGetRecord();
                var
                    DtldCustLedgEntry : Record "Detailed Cust. Ledg. Entry";
                    MSPTDtldCustLedgEntry : Record "MSPT Dtld. Cust. Ledg. Entry";
                begin
                    IF Number = 1 THEN
                      Currency2.FIND('-')
                    ELSE
                      IF Currency2.NEXT = 0 THEN
                        CurrReport.BREAK;
                    Currency2.CALCFIELDS("Cust. Ledg. Entries in Filter");
                    IF NOT Currency2."Cust. Ledg. Entries in Filter" THEN
                      CurrReport.SKIP;

                    PrintLine := FALSE;
                    LineTotalCustBalance := 0;
                    FOR i := 1 TO 5 DO BEGIN
                      MSPTDtldCustLedgEntry.SETCURRENTKEY("Customer No.","MSPT Due Date");
                      MSPTDtldCustLedgEntry.SETRANGE("Customer No.",Customer."No.");
                      MSPTDtldCustLedgEntry.SETRANGE("MSPT Due Date",PeriodStartDate[i],PeriodStartDate[i + 1] - 1);
                      //MSPTDtldCustLedgEntry.SETRANGE("Currency Code",Currency2.Code);
                      MSPTDtldCustLedgEntry.CALCSUMS("MSPT Amount");
                      CustBalanceDue[i] := MSPTDtldCustLedgEntry."MSPT Amount";
                      IF CustBalanceDue[i] <> 0 THEN
                        PrintLine := TRUE;
                      LineTotalCustBalance := LineTotalCustBalance + CustBalanceDue[i];
                    END;
                end;

                trigger OnPreDataItem();
                begin
                    IF PrintAmountsInLCY OR NOT PrintLine THEN
                      CurrReport.BREAK;
                    Currency2.RESET;
                    Currency2.SETRANGE("Customer Filter",Customer."No.");
                    Customer.COPYFILTER("Currency Filter",Currency2.Code);
                    IF (Customer.GETFILTER("Global Dimension 1 Filter") <> '') OR
                       (Customer.GETFILTER("Global Dimension 2 Filter") <> '')
                    THEN BEGIN
                      Customer.COPYFILTER("Global Dimension 1 Filter",Currency2."Global Dimension 1 Filter");
                      Customer.COPYFILTER("Global Dimension 2 Filter",Currency2."Global Dimension 2 Filter");
                    END;
                end;
            }

            trigger OnAfterGetRecord();
            var
                DtldCustLedgEntry : Record "Detailed Cust. Ledg. Entry";
                MSPTDtldCustLedgEntry : Record "MSPT Dtld. Cust. Ledg. Entry";
            begin
                PrintLine := FALSE;
                LineTotalCustBalance := 0;
                FOR i := 1 TO 5 DO BEGIN
                  MSPTDtldCustLedgEntry.SETCURRENTKEY("Customer No.","MSPT Due Date");
                  MSPTDtldCustLedgEntry.SETRANGE("Customer No.","No.");
                  MSPTDtldCustLedgEntry.SETRANGE("MSPT Due Date",PeriodStartDate[i],PeriodStartDate[i + 1] - 1);
                  MSPTDtldCustLedgEntry.CALCSUMS("MSPT Amount");
                  CustBalanceDue[i] := MSPTDtldCustLedgEntry."MSPT Amount";
                  CustBalanceDueLCY[i] := MSPTDtldCustLedgEntry."MSPT Amount";
                  IF CustBalanceDue[i] <> 0 THEN
                    PrintLine := TRUE;
                  LineTotalCustBalance := LineTotalCustBalance + CustBalanceDueLCY[i];
                  TotalCustBalanceLCY := TotalCustBalanceLCY + CustBalanceDueLCY[i];
                END;
            end;

            trigger OnPreDataItem();
            begin
                CurrReport.CREATETOTALS(CustBalanceDue,CustBalanceDueLCY,TotalCustBalanceLCY);
                Currency2.Code := '';
                Currency2.INSERT;
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
        CustFilter := Customer.GETFILTERS;
        FOR i := 3 TO 5 DO
          PeriodStartDate[i] := CALCDATE(PeriodLength,PeriodStartDate[i - 1]);
        PeriodStartDate[6] := 12319999D;
    end;

    var
        Currency : Record Currency;
        Currency2 : Record Currency temporary;
        CustFilter : Text[250];
        PrintAmountsInLCY : Boolean;
        PeriodLength : DateFormula;
        PeriodStartDate : array [6] of Date;
        CustBalanceDue : array [5] of Decimal;
        CustBalanceDueLCY : array [5] of Decimal;
        LineTotalCustBalance : Decimal;
        TotalCustBalanceLCY : Decimal;
        PrintLine : Boolean;
        i : Integer;
        Customer___Summary_AgingCaptionLbl : Label 'Customer - Summary Aging';
        CurrReport_PAGENOCaptionLbl : Label 'Page';
        All_amounts_are_in_LCYCaptionLbl : Label 'All amounts are in LCY';
        Balance_DueCaptionLbl : Label 'Balance Due';
        CustBalanceDue_1_CaptionLbl : Label '...before';
        CustBalanceDue_5_CaptionLbl : Label 'after...';
        LineTotalCustBalanceCaptionLbl : Label 'Balance';
        CustBalanceDueLCY_1_CaptionLbl : Label 'Continued (LCY)';
        CustBalanceDueLCY_1__Control39CaptionLbl : Label 'Continued (LCY)';
        Total__LCY_CaptionLbl : Label 'Total (LCY)';
}

