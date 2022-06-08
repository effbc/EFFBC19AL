report 50079 "MSPT  Aged Accounts Receivable"
{
    // version MSPT1.0

    // B2B Software Technologies
    // ---------------------------------------------------
    // Project : Mile Stone Payment Terms
    // B2B
    // No. sign   Description
    // ---------------------------------------------------
    // 01  B2B    MSPT Aged Accounts Receivable
    DefaultLayout = RDLC;
    RDLCLayout = './MSPT  Aged Accounts Receivable.rdlc';

    Caption = 'MSPT Aged Accounts Receivable';

    dataset
    {
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "No.";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PAGENO)
            {
            }
            column(USERID; USERID)
            {
            }
            column(STRSUBSTNO_Text006_FORMAT_EndingDate_0_4__; STRSUBSTNO(Text006, FORMAT(EndingDate, 0, 4)))
            {
            }
            column(STRSUBSTNO_Text007_SELECTSTR_AgingBy___1_Text009__; STRSUBSTNO(Text007, SELECTSTR(AgingBy + 1, Text009)))
            {
            }
            column(TABLECAPTION__________CustFilter; TABLECAPTION + ': ' + CustFilter)
            {
            }
            column(EmptyString; '')
            {
            }
            column(EmptyString_Control56; '')
            {
            }
            column(STRSUBSTNO_Text004_SELECTSTR_AgingBy___1_Text009__; STRSUBSTNO(Text004, SELECTSTR(AgingBy + 1, Text009)))
            {
            }
            column(HeaderText_5_; HeaderText[5])
            {
            }
            column(HeaderText_4_; HeaderText[4])
            {
            }
            column(HeaderText_3_; HeaderText[3])
            {
            }
            column(HeaderText_2_; HeaderText[2])
            {
            }
            column(HeaderText_1_; HeaderText[1])
            {
            }
            column(HeaderText_5__Control8; HeaderText[5])
            {
            }
            column(HeaderText_4__Control11; HeaderText[4])
            {
            }
            column(HeaderText_3__Control12; HeaderText[3])
            {
            }
            column(HeaderText_2__Control13; HeaderText[2])
            {
            }
            column(HeaderText_1__Control14; HeaderText[1])
            {
            }
            column(HeaderText_1__Control36; HeaderText[1])
            {
            }
            column(HeaderText_2__Control37; HeaderText[2])
            {
            }
            column(HeaderText_3__Control38; HeaderText[3])
            {
            }
            column(HeaderText_4__Control39; HeaderText[4])
            {
            }
            column(HeaderText_5__Control40; HeaderText[5])
            {
            }
            column(Original_Amount; GrandTotalCustLedgEntry[5]."MSPT Remaining Amount")
            {
                AutoFormatType = 1;
            }
            column(Original_Amount_Control43; GrandTotalCustLedgEntry[4]."MSPT Remaining Amount")
            {
                AutoFormatType = 1;
            }
            column(Original_Amount_Control44; GrandTotalCustLedgEntry[3]."MSPT Remaining Amount")
            {
                AutoFormatType = 1;
            }
            column(Original_Amount_Control45; GrandTotalCustLedgEntry[2]."MSPT Remaining Amount")
            {
                AutoFormatType = 1;
            }
            column(Original_Amount_Control46; GrandTotalCustLedgEntry[1]."MSPT Remaining Amount")
            {
                AutoFormatType = 1;
            }
            column(Original_Amount_Control47; GrandTotalCustLedgEntry[1]."MSPT Amount")
            {
                AutoFormatType = 1;
            }
            column(Pct_GrandTotalCustLedgEntry_1___MSPT_Remaining_Amount__GrandTotalCustLedgEntry_1___MSPT_Amount__; Pct(GrandTotalCustLedgEntry[1]."MSPT Remaining Amount", GrandTotalCustLedgEntry[1]."MSPT Amount"))
            {
            }
            column(Pct_GrandTotalCustLedgEntry_2___MSPT_Remaining_Amount__GrandTotalCustLedgEntry_1___MSPT_Amount__; Pct(GrandTotalCustLedgEntry[2]."MSPT Remaining Amount", GrandTotalCustLedgEntry[1]."MSPT Amount"))
            {
            }
            column(Pct_GrandTotalCustLedgEntry_3___MSPT_Remaining_Amount__GrandTotalCustLedgEntry_1___MSPT_Amount__; Pct(GrandTotalCustLedgEntry[3]."MSPT Remaining Amount", GrandTotalCustLedgEntry[1]."MSPT Amount"))
            {
            }
            column(Pct_GrandTotalCustLedgEntry_4___MSPT_Remaining_Amount__GrandTotalCustLedgEntry_1___MSPT_Amount__; Pct(GrandTotalCustLedgEntry[4]."MSPT Remaining Amount", GrandTotalCustLedgEntry[1]."MSPT Amount"))
            {
            }
            column(Pct_GrandTotalCustLedgEntry_5___MSPT_Remaining_Amount__GrandTotalCustLedgEntry_1___MSPT_Amount__; Pct(GrandTotalCustLedgEntry[5]."MSPT Remaining Amount", GrandTotalCustLedgEntry[1]."MSPT Amount"))
            {
            }
            column(Aged_Accounts_ReceivableCaption; Aged_Accounts_ReceivableCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(All_Amounts_in_LCYCaption; All_Amounts_in_LCYCaptionLbl)
            {
            }
            column(Aged_Overdue_AmountsCaption; Aged_Overdue_AmountsCaptionLbl)
            {
            }
            column(Original_Amount_Control58Caption; Original_Amount_Control58CaptionLbl)
            {
            }
            column(CustLedgEntryEndingDate__MSPT_Amount_Caption; CustLedgEntryEndingDate__MSPT_Amount_CaptionLbl)
            {
            }
            column(CustLedgEntryEndingDate__MSPT_Due_Date_Caption; CustLedgEntryEndingDate__MSPT_Due_Date_CaptionLbl)
            {
            }
            column(CustLedgEntryEndingDate__Document_No__Caption; CustLedgEntryEndingDate__Document_No__CaptionLbl)
            {
            }
            column(CustLedgEntryEndingDate__Posting_Date_Caption; CustLedgEntryEndingDate__Posting_Date_CaptionLbl)
            {
            }
            column(FORMAT_CustLedgEntryEndingDate__Document_Type__Caption; FORMAT_CustLedgEntryEndingDate__Document_Type__CaptionLbl)
            {
            }
            column(Original_Amount_Control17Caption; Original_Amount_Control17CaptionLbl)
            {
            }
            column(Original_Amount_Control24Caption; Original_Amount_Control24CaptionLbl)
            {
            }
            column(Total__LCY_Caption; Total__LCY_CaptionLbl)
            {
            }
            column(Customer_No_; "No.")
            {
            }
            dataitem("MSPT Customer Ledger Entry"; "MSPT Customer Ledger Entry")
            {
                DataItemLink = Customer No.=FIELD(No.);
                DataItemTableView = SORTING(Customer No., Posting Date);

                trigger OnAfterGetRecord();
                var
                    CustLedgEntry: Record "MSPT Customer Ledger Entry";
                begin
                    CustLedgEntry.SETCURRENTKEY("Closed by Entry No.");
                    CustLedgEntry.SETRANGE("Closed by Entry No.", "Entry No.");
                    CustLedgEntry.SETRANGE("MSPT Due Date", 0D, EndingDate);
                    IF CustLedgEntry.FIND('-') THEN
                        REPEAT
                            InsertTemp(CustLedgEntry);
                        UNTIL CustLedgEntry.NEXT = 0;

                    CustLedgEntry.RESET;
                    CustLedgEntry.SETRANGE("Entry No.", "Closed by Entry No.");
                    CustLedgEntry.SETRANGE("MSPT Due Date", 0D, EndingDate);
                    IF CustLedgEntry.FIND('-') THEN
                        REPEAT
                            InsertTemp(CustLedgEntry);
                        UNTIL CustLedgEntry.NEXT = 0;
                end;

                trigger OnPreDataItem();
                begin
                    SETRANGE("MSPT Due Date", EndingDate + 1, 12319999D);
                end;
            }
            dataitem(OpenCustLedgEntry; "MSPT Customer Ledger Entry")
            {
                DataItemLink = Customer No.=FIELD(No.);
                DataItemTableView = SORTING(Customer No., Open, Positive, Due Date) WHERE(Open = CONST(Yes));

                trigger OnAfterGetRecord();
                begin
                    InsertTemp(OpenCustLedgEntry);
                end;

                trigger OnPreDataItem();
                begin
                    //SETRANGE("MSPT Due Date",0D,EndingDate);
                    SETRANGE("Posting Date", 0D, EndingDate);
                end;
            }
            dataitem(CurrencyLoop; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
                PrintOnlyIfDetail = true;
                dataitem(TempCustLedgEntryLoop; "Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
                    column(Customer_Name; Customer.Name)
                    {
                    }
                    column(Customer__No__; Customer."No.")
                    {
                    }
                    column(Original_Amount_Control58; CustLedgEntryEndingDate."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control59; AgedCustLedgEntry[1]."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control60; AgedCustLedgEntry[2]."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control61; AgedCustLedgEntry[3]."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control62; AgedCustLedgEntry[4]."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control63; AgedCustLedgEntry[5]."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(CustLedgEntryEndingDate__MSPT_Amount_; CustLedgEntryEndingDate."MSPT Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(CustLedgEntryEndingDate__MSPT_Due_Date_; CustLedgEntryEndingDate."MSPT Due Date")
                    {
                    }
                    column(CustLedgEntryEndingDate__Document_No__; CustLedgEntryEndingDate."Document No.")
                    {
                    }
                    column(FORMAT_CustLedgEntryEndingDate__Document_Type__; FORMAT(CustLedgEntryEndingDate."Document Type"))
                    {
                    }
                    column(CustLedgEntryEndingDate__Posting_Date_; CustLedgEntryEndingDate."Posting Date")
                    {
                    }
                    column(Original_Amount_Control89; AgedCustLedgEntry[5]."MSPT Remaining Amount")
                    {
                        AutoFormatExpression = CurrencyCode;
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control90; AgedCustLedgEntry[4]."MSPT Remaining Amount")
                    {
                        AutoFormatExpression = CurrencyCode;
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control91; AgedCustLedgEntry[3]."MSPT Remaining Amount")
                    {
                        AutoFormatExpression = CurrencyCode;
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control92; AgedCustLedgEntry[2]."MSPT Remaining Amount")
                    {
                        AutoFormatExpression = CurrencyCode;
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control93; AgedCustLedgEntry[1]."MSPT Remaining Amount")
                    {
                        AutoFormatExpression = CurrencyCode;
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control94; CustLedgEntryEndingDate."MSPT Remaining Amount")
                    {
                        AutoFormatExpression = CurrencyCode;
                        AutoFormatType = 1;
                    }
                    column(CustLedgEntryEndingDate__MSPT_Amount__Control95; CustLedgEntryEndingDate."MSPT Amount")
                    {
                        AutoFormatExpression = CurrencyCode;
                        AutoFormatType = 1;
                    }
                    column(CustLedgEntryEndingDate__MSPT_Due_Date__Control96; CustLedgEntryEndingDate."MSPT Due Date")
                    {
                    }
                    column(CustLedgEntryEndingDate__Document_No___Control97; CustLedgEntryEndingDate."Document No.")
                    {
                    }
                    column(FORMAT_CustLedgEntryEndingDate__Document_Type___Control98; FORMAT(CustLedgEntryEndingDate."Document Type"))
                    {
                    }
                    column(CustLedgEntryEndingDate__Posting_Date__Control99; CustLedgEntryEndingDate."Posting Date")
                    {
                    }
                    column(STRSUBSTNO_Text005_Customer_Name_; STRSUBSTNO(Text005, Customer.Name))
                    {
                    }
                    column(Original_Amount_Control83; TotalCustLedgEntry[1]."MSPT Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control84; TotalCustLedgEntry[1]."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control85; TotalCustLedgEntry[2]."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control86; TotalCustLedgEntry[3]."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control87; TotalCustLedgEntry[4]."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control88; TotalCustLedgEntry[5]."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(STRSUBSTNO_Text005_Customer_Name__Control101; STRSUBSTNO(Text005, Customer.Name))
                    {
                    }
                    column(Original_Amount_Control102; TotalCustLedgEntry[5]."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control103; TotalCustLedgEntry[4]."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control104; TotalCustLedgEntry[3]."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control105; TotalCustLedgEntry[2]."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control106; TotalCustLedgEntry[1]."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control107; TotalCustLedgEntry[1]."MSPT Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Customer__No___Control9; Customer."No.")
                    {
                    }
                    column(Customer_Name_Control15; Customer.Name)
                    {
                    }
                    column(Original_Amount_Control17; TotalCustLedgEntry[1]."Amount (LCY)")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control18; TotalCustLedgEntry[1]."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control19; TotalCustLedgEntry[2]."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control20; TotalCustLedgEntry[3]."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control22; TotalCustLedgEntry[4]."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control23; TotalCustLedgEntry[5]."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control24; TotalCustLedgEntry[1]."MSPT Amount")
                    {
                        AutoFormatExpression = CurrencyCode;
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control25; TotalCustLedgEntry[1]."MSPT Remaining Amount")
                    {
                        AutoFormatExpression = CurrencyCode;
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control26; TotalCustLedgEntry[2]."MSPT Remaining Amount")
                    {
                        AutoFormatExpression = CurrencyCode;
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control27; TotalCustLedgEntry[3]."MSPT Remaining Amount")
                    {
                        AutoFormatExpression = CurrencyCode;
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control28; TotalCustLedgEntry[4]."MSPT Remaining Amount")
                    {
                        AutoFormatExpression = CurrencyCode;
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control29; TotalCustLedgEntry[5]."MSPT Remaining Amount")
                    {
                        AutoFormatExpression = CurrencyCode;
                        AutoFormatType = 1;
                    }
                    column(Customer_Name_Control30; Customer.Name)
                    {
                    }
                    column(Customer__No___Control31; Customer."No.")
                    {
                    }
                    column(TempCustLedgEntryLoop_Number; Number)
                    {
                    }

                    trigger OnAfterGetRecord();
                    var
                        CustLedgEntry: Record "MSPT Customer Ledger Entry";
                        PeriodIndex: Integer;
                    begin
                        IF Number = 1 THEN BEGIN
                            IF NOT TempCustLedgEntry.FIND('-') THEN
                                CurrReport.BREAK;
                        END ELSE
                            IF TempCustLedgEntry.NEXT = 0 THEN
                                CurrReport.BREAK;

                        /*//TempCustLedgEntry.SETRANGE("Date Filter",0D,EndingDate);
                        TempCustLedgEntry.CALCFIELDS("MSPT Amount","MSPT Remaining Amount");
                        IF TempCustLedgEntry."MSPT Amount" = 0 THEN
                          CurrReport.SKIP;
                        
                        CustLedgEntryEndingDate := TempCustLedgEntry;
                        CustLedgEntryEndingDate."MSPT Remaining Amount" := TempCustLedgEntry."MSPT Remaining Amount";
                        //CustLedgEntryEndingDate."Remaining Amt. (LCY)" := TempCustLedgEntry."Amount (LCY)";
                        
                        CustLedgEntry.SETCURRENTKEY("Closed by Entry No.");
                        CustLedgEntry.SETRANGE("Closed by Entry No.",TempCustLedgEntry."Entry No.");
                        CustLedgEntry.SETRANGE("MSPT Due Date",0D,EndingDate);
                        IF CustLedgEntry.FIND('-') THEN
                          REPEAT
                            CustLedgEntry.CALCFIELDS("MSPT Amount");
                            IF CustLedgEntry."MSPT Amount" <> 0 THEN BEGIN
                              CustLedgEntryEndingDate."Remaining Amount" += CustLedgEntry."Closed by Currency Amount";
                              CustLedgEntryEndingDate."MSPT Remaining Amount" += CustLedgEntry."Closed by Amount (LCY)";
                            END;
                          UNTIL CustLedgEntry.NEXT = 0;
                        CustLedgEntry.RESET;
                        CustLedgEntry.SETRANGE("Entry No.",TempCustLedgEntry."Closed by Entry No.");
                        CustLedgEntry.SETRANGE("MSPT Due Date",0D,EndingDate);
                        IF CustLedgEntry.FIND('-') THEN
                          REPEAT
                            CustLedgEntry.CALCFIELDS("MSPT Amount");
                            IF CustLedgEntry.Amount <> 0 THEN BEGIN
                              CustLedgEntryEndingDate."MSPT Remaining Amount" -= CustLedgEntry."Closed by Amount";
                              //CustLedgEntryEndingDate."Remaining Amt. (LCY)" -= CustLedgEntry."Closed by Amount (LCY)";
                            END;
                          UNTIL CustLedgEntry.NEXT = 0;
                        */

                        CustLedgEntryEndingDate := TempCustLedgEntry;
                        //CustLedgEntryEndingDate.SETRANGE("Date Filter",0D,EndingDate);
                        CustLedgEntryEndingDate.CALCFIELDS("MSPT Amount", "MSPT Remaining Amount");
                        IF CustLedgEntryEndingDate."MSPT Remaining Amount" = 0 THEN
                            CurrReport.SKIP;

                        CASE AgingBy OF
                            AgingBy::"Due Date":
                                PeriodIndex := GetPeriodIndex(CustLedgEntryEndingDate."MSPT Due Date");
                            AgingBy::"Posting Date":
                                PeriodIndex := GetPeriodIndex(CustLedgEntryEndingDate."Posting Date");
                            AgingBy::"Document Date":
                                PeriodIndex := GetPeriodIndex(CustLedgEntryEndingDate."Document Date");
                        END;
                        CLEAR(AgedCustLedgEntry);
                        AgedCustLedgEntry[PeriodIndex]."MSPT Remaining Amount" := CustLedgEntryEndingDate."MSPT Remaining Amount";
                        //AgedCustLedgEntry[PeriodIndex]."Remaining Amt. (LCY)" := CustLedgEntryEndingDate."Remaining Amt. (LCY)";
                        TotalCustLedgEntry[PeriodIndex]."MSPT Remaining Amount" += CustLedgEntryEndingDate."MSPT Remaining Amount";
                        //TotalCustLedgEntry[PeriodIndex]."Remaining Amt. (LCY)" += CustLedgEntryEndingDate."Remaining Amt. (LCY)";
                        GrandTotalCustLedgEntry[PeriodIndex]."MSPT Remaining Amount" += CustLedgEntryEndingDate."MSPT Remaining Amount";
                        TotalCustLedgEntry[1]."MSPT Amount" += CustLedgEntryEndingDate."MSPT Remaining Amount";
                        //TotalCustLedgEntry[1]."Amount (LCY)" += CustLedgEntryEndingDate."Remaining Amt. (LCY)";
                        GrandTotalCustLedgEntry[1]."MSPT Amount" += CustLedgEntryEndingDate."MSPT Remaining Amount";

                    end;

                    trigger OnPostDataItem();
                    begin
                        //IF NOT PrintAmountInLCY THEN
                        // UpdateCurrencyTotals;
                    end;

                    trigger OnPreDataItem();
                    begin
                        //IF NOT PrintAmountInLCY THEN
                        // TempCustLedgEntry.SETRANGE("Currency Code",TempCurrency.Code);
                    end;
                }

                trigger OnAfterGetRecord();
                begin
                    CLEAR(TotalCustLedgEntry);

                    IF Number = 1 THEN BEGIN
                        IF NOT TempCurrency.FIND('-') THEN
                            CurrReport.BREAK;
                    END ELSE
                        IF TempCurrency.NEXT = 0 THEN
                            CurrReport.BREAK;

                    IF TempCurrency.Code <> '' THEN
                        CurrencyCode := TempCurrency.Code
                    ELSE
                        CurrencyCode := GLSetup."LCY Code";

                    NumberOfCurrencies := NumberOfCurrencies + 1;
                end;

                trigger OnPostDataItem();
                begin
                    IF NewPagePercustomer AND (NumberOfCurrencies > 0) THEN
                        CurrReport.NEWPAGE;
                end;

                trigger OnPreDataItem();
                begin
                    NumberOfCurrencies := 0;
                end;
            }

            trigger OnAfterGetRecord();
            begin
                TempCurrency.RESET;
                TempCurrency.DELETEALL;
                TempCustLedgEntry.RESET;
                TempCustLedgEntry.DELETEALL;
            end;
        }
        dataitem(CurrencyTotals; "Integer")
        {
            DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
            column(Original_Amount_Control109; AgedCustLedgEntry[1]."MSPT Remaining Amount")
            {
                AutoFormatExpression = CurrencyCode;
                AutoFormatType = 1;
            }
            column(Original_Amount_Control112; AgedCustLedgEntry[5]."MSPT Remaining Amount")
            {
                AutoFormatExpression = CurrencyCode;
                AutoFormatType = 1;
            }
            column(Original_Amount_Control113; AgedCustLedgEntry[4]."MSPT Remaining Amount")
            {
                AutoFormatExpression = CurrencyCode;
                AutoFormatType = 1;
            }
            column(Original_Amount_Control114; AgedCustLedgEntry[3]."MSPT Remaining Amount")
            {
                AutoFormatExpression = CurrencyCode;
                AutoFormatType = 1;
            }
            column(Original_Amount_Control115; AgedCustLedgEntry[2]."MSPT Remaining Amount")
            {
                AutoFormatExpression = CurrencyCode;
                AutoFormatType = 1;
            }
            column(Original_Amount_Control116; AgedCustLedgEntry[6]."MSPT Remaining Amount")
            {
                AutoFormatExpression = CurrencyCode;
                AutoFormatType = 1;
            }
            column(CurrencyTotals_Number; Number)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF Number = 1 THEN BEGIN
                    IF NOT TempCurrency2.FIND('-') THEN
                        CurrReport.BREAK;
                END ELSE
                    IF TempCurrency2.NEXT = 0 THEN
                        CurrReport.BREAK;

                CLEAR(AgedCustLedgEntry);
                TempCurrencyAmount.SETRANGE("Currency Code", TempCurrency2.Code);
                IF TempCurrencyAmount.FIND('-') THEN
                    REPEAT
                        IF TempCurrencyAmount.Date <> 12319999D THEN
                            AgedCustLedgEntry[GetPeriodIndex(TempCurrencyAmount.Date)]."Remaining Amount" :=
                              TempCurrencyAmount.Amount
                        ELSE
                            AgedCustLedgEntry[6]."Remaining Amount" := TempCurrencyAmount.Amount;
                    UNTIL TempCurrencyAmount.NEXT = 0;
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

        GLSetup.GET;

        CalcDates;
        CreateHeadings;
    end;

    var
        GLSetup: Record "General Ledger Setup";
        TempCustLedgEntry: Record "MSPT Customer Ledger Entry" temporary;
        CustLedgEntryEndingDate: Record "MSPT Customer Ledger Entry";
        TotalCustLedgEntry: array[5] of Record "MSPT Customer Ledger Entry";
        GrandTotalCustLedgEntry: array[5] of Record "MSPT Customer Ledger Entry";
        AgedCustLedgEntry: array[6] of Record "MSPT Customer Ledger Entry";
        TempCurrency: Record Currency temporary;
        TempCurrency2: Record Currency temporary;
        TempCurrencyAmount: Record "Currency Amount" temporary;
        CustFilter: Text[250];
        EndingDate: Date;
        AgingBy: Option "Due Date","Posting Date","Document Date";
        PeriodLength: DateFormula;
        PrintDetails: Boolean;
        HeadingType: Option "Date Interval","Number of Days";
        NewPagePercustomer: Boolean;
        PeriodStartDate: array[5] of Date;
        PeriodEndDate: array[5] of Date;
        HeaderText: array[5] of Text[30];
        Text000: Label 'Not Due';
        Text001: Label 'Before';
        CurrencyCode: Code[10];
        Text002: Label 'days';
        Text003: Label 'More than';
        Text004: Label 'Aged by %1';
        Text005: Label 'Total for %1';
        Text006: Label 'Aged as of %1';
        Text007: Label 'Aged by %1';
        Text008: Label 'All Amounts in LCY';
        NumberOfCurrencies: Integer;
        Text009: Label 'Due Date,Posting Date,Document Date';
        Text010: Label 'The Date Formula %1 cannot be used. Try to restate it. E.g. 1M+CM instead of CM+1M.';
        Aged_Accounts_ReceivableCaptionLbl: Label 'Aged Accounts Receivable';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        All_Amounts_in_LCYCaptionLbl: Label 'All Amounts in LCY';
        Aged_Overdue_AmountsCaptionLbl: Label 'Aged Overdue Amounts';
        Original_Amount_Control58CaptionLbl: Label 'Balance';
        CustLedgEntryEndingDate__MSPT_Amount_CaptionLbl: Label '"Original Amount "';
        CustLedgEntryEndingDate__MSPT_Due_Date_CaptionLbl: Label 'Due Date';
        CustLedgEntryEndingDate__Document_No__CaptionLbl: Label 'Document No.';
        CustLedgEntryEndingDate__Posting_Date_CaptionLbl: Label 'Posting Date';
        FORMAT_CustLedgEntryEndingDate__Document_Type__CaptionLbl: Label 'Document Type';
        Original_Amount_Control17CaptionLbl: Label 'Balance';
        Original_Amount_Control24CaptionLbl: Label 'Balance';
        Total__LCY_CaptionLbl: Label 'Total (LCY)';

    (4945)]
    local procedure CalcDates();
    var
        i: Integer;
        PeriodLength2: DateFormula;
    begin
        EVALUATE(PeriodLength2, '-' + FORMAT(PeriodLength));
        IF AgingBy = AgingBy::"Due Date" THEN BEGIN
            PeriodEndDate[1] := 12319999D;
            PeriodStartDate[1] := EndingDate + 1;
        END ELSE BEGIN
            PeriodEndDate[1] := EndingDate;
            PeriodStartDate[1] := CALCDATE(PeriodLength2, EndingDate) + 1;
        END;
        FOR i := 2 TO ARRAYLEN(PeriodEndDate) DO BEGIN
            PeriodEndDate[i] := PeriodStartDate[i - 1] - 1;
            PeriodStartDate[i] := CALCDATE(PeriodLength2, PeriodEndDate[i]) + 1;
        END;
        PeriodStartDate[i] := 0D;

        FOR i := 1 TO ARRAYLEN(PeriodEndDate) DO
            IF PeriodEndDate[i] < PeriodStartDate[i] THEN
                ERROR(Text010, PeriodLength);
    end;

    (4964)]
    local procedure CreateHeadings();
    var
        i: Integer;
    begin
        IF AgingBy = AgingBy::"Due Date" THEN BEGIN
            HeaderText[1] := Text000;
            i := 2;
        END ELSE
            i := 1;
        WHILE i < ARRAYLEN(PeriodEndDate) DO BEGIN
            IF HeadingType = HeadingType::"Date Interval" THEN
                HeaderText[i] := STRSUBSTNO('%1\..%2', PeriodStartDate[i], PeriodEndDate[i])
            ELSE
                HeaderText[i] :=
                  STRSUBSTNO('%1 - %2 %3', EndingDate - PeriodEndDate[i] + 1, EndingDate - PeriodStartDate[i] + 1, Text002);
            i := i + 1;
        END;
        IF HeadingType = HeadingType::"Date Interval" THEN
            HeaderText[i] := STRSUBSTNO('%1 %2', Text001, PeriodStartDate[i - 1])
        ELSE
            HeaderText[i] := STRSUBSTNO('%1 \%2 %3', Text003, EndingDate - PeriodStartDate[i - 1] + 1, Text002);
    end;

    (4983)]
    local procedure InsertTemp(var CustLedgEntry: Record "MSPT Customer Ledger Entry");
    var
        Currency: Record Currency;
    begin
        WITH TempCustLedgEntry DO BEGIN
            IF GET(CustLedgEntry."Entry No.") THEN
                EXIT;
            TempCustLedgEntry := CustLedgEntry;
            INSERT;
            //IF PrintAmountInLCY THEN BEGIN
            CLEAR(TempCurrency);
            TempCurrency."Amount Rounding Precision" := GLSetup."Amount Rounding Precision";
            IF TempCurrency.INSERT THEN;
            EXIT;
            //END;
            IF TempCurrency.GET("Currency Code") THEN
                EXIT;
            IF "Currency Code" <> '' THEN
                Currency.GET("Currency Code")
            ELSE BEGIN
                CLEAR(Currency);
                Currency."Amount Rounding Precision" := GLSetup."Amount Rounding Precision";
            END;
            TempCurrency := Currency;
            TempCurrency.INSERT;
        END;
    end;

    (5007)]
    local procedure GetPeriodIndex(Date: Date): Integer;
    var
        i: Integer;
    begin
        FOR i := 1 TO ARRAYLEN(PeriodEndDate) DO
            IF Date IN [PeriodStartDate[i] .. PeriodEndDate[i]] THEN
                EXIT(i);
    end;

    (5012)]
    local procedure Pct(a: Decimal; b: Decimal): Text[30];
    begin
        IF b <> 0 THEN
            EXIT(FORMAT(ROUND(100 * a / b, 0.1), 0, '<Sign><Integer><Decimals,2>') + '%');
    end;

    (5016)]
    local procedure UpdateCurrencyTotals();
    var
        i: Integer;
    begin
        TempCurrency2.Code := CurrencyCode;
        IF TempCurrency2.INSERT THEN;
        WITH TempCurrencyAmount DO BEGIN
            FOR i := 1 TO ARRAYLEN(TotalCustLedgEntry) DO BEGIN
                "Currency Code" := CurrencyCode;
                Date := PeriodStartDate[i];
                IF FIND THEN BEGIN
                    Amount := Amount + TotalCustLedgEntry[i]."MSPT Remaining Amount";
                    MODIFY;
                END ELSE BEGIN
                    "Currency Code" := CurrencyCode;
                    Date := PeriodStartDate[i];
                    Amount := TotalCustLedgEntry[i]."MSPT Remaining Amount";
                    INSERT;
                END;
            END;
            "Currency Code" := CurrencyCode;
            Date := 12319999D;
            IF FIND THEN BEGIN
                Amount := Amount + TotalCustLedgEntry[1]."MSPT Amount";
                MODIFY;
            END ELSE BEGIN
                "Currency Code" := CurrencyCode;
                Date := 12319999D;
                Amount := TotalCustLedgEntry[1]."MSPT Amount";
                INSERT;
            END;
        END;
    end;
}

