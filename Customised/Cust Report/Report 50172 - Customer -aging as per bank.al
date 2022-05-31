report 50172 "Customer -aging as per bank"
{
    // version NAVW13.70.00.08,EFFUPG

    DefaultLayout = RDLC;
    RDLCLayout = './Customer -aging as per bank.rdlc';
    Caption = 'Customer - Summary Aging Simp.';

    dataset
    {
        dataitem(Customer; Customer)
        {
            DataItemTableView = SORTING(Customer Posting Group) ORDER(Ascending);
            RequestFilterFields = "No.", "Customer Posting Group", "Statistics Group", "Payment Terms Code";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(STRSUBSTNO_Text001_FORMAT_StartDate__; STRSUBSTNO(Text001, FORMAT(StartDate)))
            {
            }
            column(CurrReport_PAGENO; CurrReport.PAGENO)
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(USERID; USERID)
            {
            }
            column(Customer_TABLECAPTION__________CustFilter; Customer.TABLECAPTION + ': ' + CustFilter)
            {
            }
            column(CustBalanceDueLCY_2_; CustBalanceDueLCY[2])
            {
                AutoFormatType = 1;
            }
            column(CustBalanceDueLCY_1_; CustBalanceDueLCY[1])
            {
                AutoFormatType = 1;
            }
            column(CustBalanceDueLCY_5_; CustBalanceDueLCY[5])
            {
                AutoFormatType = 1;
            }
            column(CustBalanceDueLCY_4_; CustBalanceDueLCY[4])
            {
                AutoFormatType = 1;
            }
            column(CustBalanceDueLCY_3_; CustBalanceDueLCY[3])
            {
                AutoFormatType = 1;
            }
            column(CustBalanceDueLCY_6_; CustBalanceDueLCY[6])
            {
                AutoFormatType = 1;
            }
            column(Customer__No__; "No.")
            {
            }
            column(Customer_Name; Name)
            {
            }
            column(Customer__Customer_Posting_Group_; "Customer Posting Group")
            {
            }
            column(CustBalanceDueLCY_2__Control1102154011; CustBalanceDueLCY[2])
            {
                AutoFormatType = 1;
            }
            column(CustBalanceDueLCY_1__Control1102154012; CustBalanceDueLCY[1])
            {
                AutoFormatType = 1;
            }
            column(CustBalanceDueLCY_5__Control1102154020; CustBalanceDueLCY[5])
            {
                AutoFormatType = 1;
            }
            column(CustBalanceDueLCY_4__Control1102154021; CustBalanceDueLCY[4])
            {
                AutoFormatType = 1;
            }
            column(CustBalanceDueLCY_3__Control1102154022; CustBalanceDueLCY[3])
            {
                AutoFormatType = 1;
            }
            column(CustBalanceDueLCY_6__Control1102154039; CustBalanceDueLCY[6])
            {
                AutoFormatType = 1;
            }
            column(CustBalanceDueLCY_2__Control1102154013; CustBalanceDueLCY[2])
            {
                AutoFormatType = 1;
            }
            column(CustBalanceDueLCY_1__Control1102154014; CustBalanceDueLCY[1])
            {
                AutoFormatType = 1;
            }
            column(CustBalanceDueLCY_5__Control1102154023; CustBalanceDueLCY[5])
            {
                AutoFormatType = 1;
            }
            column(CustBalanceDueLCY_4__Control1102154025; CustBalanceDueLCY[4])
            {
                AutoFormatType = 1;
            }
            column(CustBalanceDueLCY_3__Control1102154026; CustBalanceDueLCY[3])
            {
                AutoFormatType = 1;
            }
            column(CustBalanceDueLCY_6__Control1102154040; CustBalanceDueLCY[6])
            {
                AutoFormatType = 1;
            }
            column(CustBalanceDueLCY_2__Control1102154015; CustBalanceDueLCY[2])
            {
                AutoFormatType = 1;
            }
            column(CustBalanceDueLCY_1__Control1102154016; CustBalanceDueLCY[1])
            {
                AutoFormatType = 1;
            }
            column(CustBalanceDueLCY_5__Control1102154027; CustBalanceDueLCY[5])
            {
                AutoFormatType = 1;
            }
            column(CustBalanceDueLCY_4__Control1102154028; CustBalanceDueLCY[4])
            {
                AutoFormatType = 1;
            }
            column(CustBalanceDueLCY_3__Control1102154030; CustBalanceDueLCY[3])
            {
                AutoFormatType = 1;
            }
            column(CustBalanceDueLCY_6__Control1102154041; CustBalanceDueLCY[6])
            {
                AutoFormatType = 1;
            }
            column(Customer___Summary_Aging_Simp_Caption; Customer___Summary_Aging_Simp_CaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(All_amounts_are_in_LCYCaption; All_amounts_are_in_LCYCaptionLbl)
            {
            }
            column(Customer__No__Caption; FIELDCAPTION("No."))
            {
            }
            column(Customer_NameCaption; FIELDCAPTION(Name))
            {
            }
            column(no_dueCaption; no_dueCaptionLbl)
            {
            }
            column(V0_6_MonthsCaption; V0_6_MonthsCaptionLbl)
            {
            }
            column(V6_9_MonthsCaption; V6_9_MonthsCaptionLbl)
            {
            }
            column(V9_12_monthsCaption; V9_12_monthsCaptionLbl)
            {
            }
            column(Customer__Customer_Posting_Group_Caption; FIELDCAPTION("Customer Posting Group"))
            {
            }
            column(V1_2_YearsCaption; V1_2_YearsCaptionLbl)
            {
            }
            column(Above_2_yearsCaption; Above_2_yearsCaptionLbl)
            {
            }
            column(Control17Caption; Control17CaptionLbl)
            {
            }
            column(Control30Caption; Control30CaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }

            trigger OnAfterGetRecord();
            begin
                PrintCust := FALSE;
                FOR i := 1 TO 5 DO BEGIN
                    CustBalanceDueLCY[i] := 0;
                    // DtldCustLedgEntry.SETCURRENTKEY("Customer No.","Posting Date");
                    DtldCustLedgEntry.SETRANGE("Customer No.", "No.");
                    //  DtldCustLedgEntry.SETRANGE("Posting Date",(040108D),StartDate);
                    DtldCustLedgEntry.SETRANGE("Posting Date", PeriodStartDate[i], PeriodStartDate[i + 1] - 1);
                    //  DtldCustLedgEntry.CALCSUMS("Amount (LCY)");
                    IF DtldCustLedgEntry.FIND('-') THEN BEGIN
                        REPEAT
                            DtldCustLedgEntry.CALCFIELDS(DtldCustLedgEntry.Amount, DtldCustLedgEntry."Amount (LCY)");
                            IF DtldCustLedgEntry."Amount (LCY)" <> 0 THEN
                                CustBalanceDueLCY[i] += DtldCustLedgEntry."Amount (LCY)";
                        UNTIL DtldCustLedgEntry.NEXT = 0;
                    END;
                    /*  IF CustBalanceDueLCY[i] < 0 THEN
                         CustBalanceDueLCY[i]:=0;
                     */   //Main Code
                    IF CustBalanceDueLCY[i] <> 0 THEN
                        PrintCust := TRUE;
                    /*IF i=1 THEN
                    datefilter1:=FORMAT(PeriodStartDate[i])+FORMAT(PeriodStartDate[i+1]-1);
                    IF i=2 THEN
                    datefilter2:=FORMAT(PeriodStartDate[i])+FORMAT(PeriodStartDate[i+1]-1);
                    IF i=3 THEN
                    datefilter3:=FORMAT(PeriodStartDate[i])+FORMAT(PeriodStartDate[i+1]-1);
                    IF i=4 THEN
                    datefilter4:=FORMAT(PeriodStartDate[i])+FORMAT(PeriodStartDate[i+1]-1);
                    IF i=5 THEN
                    datefilter5:=FORMAT(PeriodStartDate[i])+FORMAT(PeriodStartDate[i+1]-1);
                    */
                END;
                IF NOT PrintCust THEN
                    CurrReport.SKIP;

            end;

            trigger OnPostDataItem();
            begin
                /*MESSAGE('time Intervals'+datefilter1);
                MESSAGE('time Intervals'+datefilter2);
                MESSAGE('time Intervals'+datefilter3);
                MESSAGE('time Intervals'+datefilter4);
                MESSAGE('time Intervals'+datefilter5);
                 */

            end;

            trigger OnPreDataItem();
            begin
                TempExcelBuffer.DELETEALL;
                CLEAR(TempExcelBuffer);
                row := 0;

                CurrReport.CREATETOTALS(CustBalanceDueLCY);
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

    trigger OnPostReport();
    begin
        IF Excel THEN BEGIN
            TempExcelBuffer.CreateBook('', '');//B2B  //EFFUPG
                                               //TempExcelBuffer.CreateSheet('test excel','',COMPANYNAME,'');//B2B
            TempExcelBuffer.GiveUserControl;
        END
    end;

    trigger OnPreReport();
    begin
        CustFilter := Customer.GETFILTERS;
        PeriodStartDate[6] := StartDate;
        PeriodStartDate[7] := 12319999D;
        FOR i := 5 DOWNTO 2 DO BEGIN
            IF i = 5 THEN
                PeriodStartDate[i] := CALCDATE('<-180D>', PeriodStartDate[i + 1]);
            IF i = 4 THEN
                PeriodStartDate[i] := CALCDATE('<-90D>', PeriodStartDate[i + 1]);
            IF i = 3 THEN
                PeriodStartDate[i] := CALCDATE('<-90D>', PeriodStartDate[i + 1]);
            IF i = 2 THEN
                PeriodStartDate[i] := CALCDATE('<-365D>', PeriodStartDate[i + 1]);
            IF i = 1 THEN
                PeriodStartDate[i] := CALCDATE('<-730D>', PeriodStartDate[i + 1]);
        END;
    end;

    var
        Text001: Label 'As of %1';
        DtldCustLedgEntry: Record "Cust. Ledger Entry";
        StartDate: Date;
        CustFilter: Text[250];
        PeriodStartDate: array[12] of Date;
        CustBalanceDueLCY: array[11] of Decimal;
        PrintCust: Boolean;
        i: Integer;
        TempExcelBuffer: Record "Excel Buffer";
        row: Integer;
        Excel: Boolean;
        datefilter1: Text[50];
        datefilter2: Text[50];
        datefilter3: Text[50];
        datefilter4: Text[50];
        datefilter5: Text[50];
        Customer___Summary_Aging_Simp_CaptionLbl: Label 'Customer - Summary Aging Simp.';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        All_amounts_are_in_LCYCaptionLbl: Label 'All amounts are in LCY';
        no_dueCaptionLbl: Label 'no due';
        V0_6_MonthsCaptionLbl: Label '0-6 Months';
        V6_9_MonthsCaptionLbl: Label '6-9 Months';
        V9_12_monthsCaptionLbl: Label '9-12 months';
        V1_2_YearsCaptionLbl: Label '1-2 Years';
        Above_2_yearsCaptionLbl: Label 'Above 2 years';
        Control17CaptionLbl: Label 'Label17';
        Control30CaptionLbl: Label 'Label30';
        TotalCaptionLbl: Label 'Total';

    [LineStart(8401)]
    procedure EnterCell(RowNo: Integer; ColumnNo: Integer; CellValue: Text[250]; Bold: Boolean);
    begin
        TempExcelBuffer.INIT;
        TempExcelBuffer.VALIDATE("Row No.", RowNo);
        TempExcelBuffer.VALIDATE("Column No.", ColumnNo);
        TempExcelBuffer."Cell Value as Text" := CellValue;
        TempExcelBuffer.Bold := Bold;
        TempExcelBuffer.INSERT;
    end;

    [LineStart(8409)]
    procedure EnterHeadings(RowNo: Integer; ColumnNo: Integer; CellValue: Text[250]; Bold: Boolean);
    begin
        TempExcelBuffer.INIT;
        TempExcelBuffer.VALIDATE("Row No.", RowNo);
        TempExcelBuffer.VALIDATE("Column No.", ColumnNo);
        TempExcelBuffer."Cell Value as Text" := FORMAT(CellValue);
        TempExcelBuffer.Bold := Bold;
        TempExcelBuffer.Formula := '';
        TempExcelBuffer.INSERT;
    end;
}

