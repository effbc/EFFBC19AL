report 50080 "MSPT  Aged Accounts Payable"
{
    // version MSPT1.0

    // B2B Software Technologies
    // ---------------------------------------------------
    // Project : Mile Stone Payment Terms
    // B2B
    // No. sign   Description
    // ---------------------------------------------------
    // 01  B2B    MSPT Aged Accounts Payable
    DefaultLayout = RDLC;
    RDLCLayout = './MSPT  Aged Accounts Payable.rdlc';

    Caption = 'MSPT Aged Accounts Payable';

    dataset
    {
        dataitem(Vendor; Vendor)
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
            column(TABLECAPTION__________VendorFilter; TABLECAPTION + ': ' + VendorFilter)
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
            column(Original_Amount; GrandTotalVendorLedgEntry[5]."MSPT Remaining Amount")
            {
                AutoFormatType = 1;
            }
            column(Original_Amount_Control43; GrandTotalVendorLedgEntry[4]."MSPT Remaining Amount")
            {
                AutoFormatType = 1;
            }
            column(Original_Amount_Control44; GrandTotalVendorLedgEntry[3]."MSPT Remaining Amount")
            {
                AutoFormatType = 1;
            }
            column(Original_Amount_Control45; GrandTotalVendorLedgEntry[2]."MSPT Remaining Amount")
            {
                AutoFormatType = 1;
            }
            column(Original_Amount_Control46; GrandTotalVendorLedgEntry[1]."MSPT Remaining Amount")
            {
                AutoFormatType = 1;
            }
            column(Original_Amount_Control47; GrandTotalVendorLedgEntry[1]."MSPT Amount")
            {
                AutoFormatType = 1;
            }
            column(Pct_GrandTotalVendorLedgEntry_1___MSPT_Remaining_Amount__GrandTotalVendorLedgEntry_1___MSPT_Amount__; Pct(GrandTotalVendorLedgEntry[1]."MSPT Remaining Amount", GrandTotalVendorLedgEntry[1]."MSPT Amount"))
            {
            }
            column(Pct_GrandTotalVendorLedgEntry_2___MSPT_Remaining_Amount__GrandTotalVendorLedgEntry_1___MSPT_Amount__; Pct(GrandTotalVendorLedgEntry[2]."MSPT Remaining Amount", GrandTotalVendorLedgEntry[1]."MSPT Amount"))
            {
            }
            column(Pct_GrandTotalVendorLedgEntry_3___MSPT_Remaining_Amount__GrandTotalVendorLedgEntry_1___MSPT_Amount__; Pct(GrandTotalVendorLedgEntry[3]."MSPT Remaining Amount", GrandTotalVendorLedgEntry[1]."MSPT Amount"))
            {
            }
            column(Pct_GrandTotalVendorLedgEntry_4___MSPT_Remaining_Amount__GrandTotalVendorLedgEntry_1___MSPT_Amount__; Pct(GrandTotalVendorLedgEntry[4]."MSPT Remaining Amount", GrandTotalVendorLedgEntry[1]."MSPT Amount"))
            {
            }
            column(Pct_GrandTotalVendorLedgEntry_5___MSPT_Remaining_Amount__GrandTotalVendorLedgEntry_1___MSPT_Amount__; Pct(GrandTotalVendorLedgEntry[5]."MSPT Remaining Amount", GrandTotalVendorLedgEntry[1]."MSPT Amount"))
            {
            }
            column(Aged_Accounts_PayableCaption; Aged_Accounts_PayableCaptionLbl)
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
            column(VendorLedgEntryEndingDate__MSPT_Amount_Caption; VendorLedgEntryEndingDate__MSPT_Amount_CaptionLbl)
            {
            }
            column(VendorLedgEntryEndingDate__MSPT_Due_Date_Caption; VendorLedgEntryEndingDate__MSPT_Due_Date_CaptionLbl)
            {
            }
            column(VendorLedgEntryEndingDate__Document_No__Caption; VendorLedgEntryEndingDate__Document_No__CaptionLbl)
            {
            }
            column(VendorLedgEntryEndingDate__Posting_Date_Caption; VendorLedgEntryEndingDate__Posting_Date_CaptionLbl)
            {
            }
            column(FORMAT_VendorLedgEntryEndingDate__Document_Type__Caption; FORMAT_VendorLedgEntryEndingDate__Document_Type__CaptionLbl)
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
            column(Vendor_No_; "No.")
            {
            }
            dataitem("MSPT Vendor Ledger Entry"; "MSPT Vendor Ledger Entry")
            {
                DataItemLink = Vendor No.=FIELD(No.);
                DataItemTableView = SORTING(Vendor No., Posting Date);

                trigger OnAfterGetRecord();
                var
                    MSPTVendorLedgEntry: Record "MSPT Vendor Ledger Entry";
                begin
                    MSPTVendorLedgEntry.SETCURRENTKEY("Closed by Entry No.");
                    MSPTVendorLedgEntry.SETRANGE("Closed by Entry No.", "Entry No.");
                    MSPTVendorLedgEntry.SETRANGE("MSPT Due Date", 0D, EndingDate);
                    IF MSPTVendorLedgEntry.FIND('-') THEN
                        REPEAT
                            InsertTemp(MSPTVendorLedgEntry);
                        UNTIL MSPTVendorLedgEntry.NEXT = 0;

                    MSPTVendorLedgEntry.RESET;
                    MSPTVendorLedgEntry.SETRANGE("Entry No.", "Closed by Entry No.");
                    MSPTVendorLedgEntry.SETRANGE("MSPT Due Date", 0D, EndingDate);
                    IF MSPTVendorLedgEntry.FIND('-') THEN
                        REPEAT
                            InsertTemp(MSPTVendorLedgEntry);
                        UNTIL MSPTVendorLedgEntry.NEXT = 0;
                end;

                trigger OnPreDataItem();
                begin
                    SETRANGE("MSPT Due Date", EndingDate + 1, 12319999D);
                end;
            }
            dataitem(OpenVendorLedgEntry; "MSPT Vendor Ledger Entry")
            {
                DataItemLink = Vendor No.=FIELD(No.);
                DataItemTableView = SORTING(Vendor No., Open, Positive, Due Date) WHERE(Open = CONST(Yes));

                trigger OnAfterGetRecord();
                begin
                    InsertTemp(OpenVendorLedgEntry);
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
                dataitem(TempVendortLedgEntryLoop; "Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
                    column(Vendor_Name; Vendor.Name)
                    {
                    }
                    column(Vendor__No__; Vendor."No.")
                    {
                    }
                    column(Original_Amount_Control58; VendorLedgEntryEndingDate."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control59; AgedVendorLedgEntry[1]."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control60; AgedVendorLedgEntry[2]."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control61; AgedVendorLedgEntry[3]."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control62; AgedVendorLedgEntry[4]."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control63; AgedVendorLedgEntry[5]."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(VendorLedgEntryEndingDate__MSPT_Amount_; VendorLedgEntryEndingDate."MSPT Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(VendorLedgEntryEndingDate__MSPT_Due_Date_; VendorLedgEntryEndingDate."MSPT Due Date")
                    {
                    }
                    column(VendorLedgEntryEndingDate__Document_No__; VendorLedgEntryEndingDate."Document No.")
                    {
                    }
                    column(FORMAT_VendorLedgEntryEndingDate__Document_Type__; FORMAT(VendorLedgEntryEndingDate."Document Type"))
                    {
                    }
                    column(VendorLedgEntryEndingDate__Posting_Date_; VendorLedgEntryEndingDate."Posting Date")
                    {
                    }
                    column(Original_Amount_Control89; AgedVendorLedgEntry[5]."MSPT Remaining Amount")
                    {
                        AutoFormatExpression = CurrencyCode;
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control90; AgedVendorLedgEntry[4]."MSPT Remaining Amount")
                    {
                        AutoFormatExpression = CurrencyCode;
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control91; AgedVendorLedgEntry[3]."MSPT Remaining Amount")
                    {
                        AutoFormatExpression = CurrencyCode;
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control92; AgedVendorLedgEntry[2]."MSPT Remaining Amount")
                    {
                        AutoFormatExpression = CurrencyCode;
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control93; AgedVendorLedgEntry[1]."MSPT Remaining Amount")
                    {
                        AutoFormatExpression = CurrencyCode;
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control94; VendorLedgEntryEndingDate."MSPT Remaining Amount")
                    {
                        AutoFormatExpression = CurrencyCode;
                        AutoFormatType = 1;
                    }
                    column(VendorLedgEntryEndingDate__MSPT_Amount__Control95; VendorLedgEntryEndingDate."MSPT Amount")
                    {
                        AutoFormatExpression = CurrencyCode;
                        AutoFormatType = 1;
                    }
                    column(VendorLedgEntryEndingDate__MSPT_Due_Date__Control96; VendorLedgEntryEndingDate."MSPT Due Date")
                    {
                    }
                    column(VendorLedgEntryEndingDate__Document_No___Control97; VendorLedgEntryEndingDate."Document No.")
                    {
                    }
                    column(FORMAT_VendorLedgEntryEndingDate__Document_Type___Control98; FORMAT(VendorLedgEntryEndingDate."Document Type"))
                    {
                    }
                    column(VendorLedgEntryEndingDate__Posting_Date__Control99; VendorLedgEntryEndingDate."Posting Date")
                    {
                    }
                    column(STRSUBSTNO_Text005_Vendor_Name_; STRSUBSTNO(Text005, Vendor.Name))
                    {
                    }
                    column(Original_Amount_Control83; TotalVendorLedgEntry[1]."MSPT Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control84; TotalVendorLedgEntry[1]."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control85; TotalVendorLedgEntry[2]."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control86; TotalVendorLedgEntry[3]."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control87; TotalVendorLedgEntry[4]."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control88; TotalVendorLedgEntry[5]."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(STRSUBSTNO_Text005_Vendor_Name__Control101; STRSUBSTNO(Text005, Vendor.Name))
                    {
                    }
                    column(Original_Amount_Control102; TotalVendorLedgEntry[5]."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control103; TotalVendorLedgEntry[4]."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control104; TotalVendorLedgEntry[3]."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control105; TotalVendorLedgEntry[2]."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control106; TotalVendorLedgEntry[1]."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control107; TotalVendorLedgEntry[1]."MSPT Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Vendor__No___Control9; Vendor."No.")
                    {
                    }
                    column(Vendor_Name_Control15; Vendor.Name)
                    {
                    }
                    column(Original_Amount_Control17; TotalVendorLedgEntry[1]."MSPT Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control18; TotalVendorLedgEntry[1]."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control19; TotalVendorLedgEntry[2]."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control20; TotalVendorLedgEntry[3]."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control22; TotalVendorLedgEntry[4]."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control23; TotalVendorLedgEntry[5]."MSPT Remaining Amount")
                    {
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control24; TotalVendorLedgEntry[1]."MSPT Amount")
                    {
                        AutoFormatExpression = CurrencyCode;
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control25; TotalVendorLedgEntry[1]."MSPT Remaining Amount")
                    {
                        AutoFormatExpression = CurrencyCode;
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control26; TotalVendorLedgEntry[2]."MSPT Remaining Amount")
                    {
                        AutoFormatExpression = CurrencyCode;
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control27; TotalVendorLedgEntry[3]."MSPT Remaining Amount")
                    {
                        AutoFormatExpression = CurrencyCode;
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control28; TotalVendorLedgEntry[4]."MSPT Remaining Amount")
                    {
                        AutoFormatExpression = CurrencyCode;
                        AutoFormatType = 1;
                    }
                    column(Original_Amount_Control29; TotalVendorLedgEntry[5]."MSPT Remaining Amount")
                    {
                        AutoFormatExpression = CurrencyCode;
                        AutoFormatType = 1;
                    }
                    column(Vendor_Name_Control30; Vendor.Name)
                    {
                    }
                    column(Vendor__No___Control31; Vendor."No.")
                    {
                    }
                    column(TempVendortLedgEntryLoop_Number; Number)
                    {
                    }

                    trigger OnAfterGetRecord();
                    var
                        MSPTVendorLedgEntry: Record "MSPT Vendor Ledger Entry";
                        PeriodIndex: Integer;
                    begin
                        IF Number = 1 THEN BEGIN
                            IF NOT TempVendorLedgEntry.FIND('-') THEN
                                CurrReport.BREAK;
                        END ELSE
                            IF TempVendorLedgEntry.NEXT = 0 THEN
                                CurrReport.BREAK;

                        /*//TempVendorLedgEntry.SETRANGE("Date Filter",0D,EndingDate);
                        TempVendorLedgEntry.CALCFIELDS("MSPT Amount", "MSPT Remaining Amount");
                        IF TempVendorLedgEntry."MSPT Amount" = 0 THEN
                          CurrReport.SKIP;
                        
                        VendorLedgEntryEndingDate := TempVendorLedgEntry;
                        VendorLedgEntryEndingDate."MSPT Remaining Amount" := TempVendorLedgEntry."MSPT Remaining Amount";
                        //VendorLedgEntryEndingDate."MSPT Remaining Amount" := TempVendorLedgEntry."MSPT Amount";
                        
                        MSPTVendorLedgEntry.SETCURRENTKEY("Closed by Entry No.");
                        MSPTVendorLedgEntry.SETRANGE("Closed by Entry No.",TempVendorLedgEntry."Entry No.");
                        MSPTVendorLedgEntry.SETRANGE("MSPT Due Date",0D,EndingDate);
                        IF MSPTVendorLedgEntry.FIND('-') THEN
                          REPEAT
                            MSPTVendorLedgEntry.CALCFIELDS("MSPT Amount");
                            IF MSPTVendorLedgEntry."MSPT Amount" <> 0 THEN BEGIN
                              VendorLedgEntryEndingDate."MSPT Remaining Amount" += MSPTVendorLedgEntry."Closed by Currency Amount";
                              //VendorLedgEntryEndingDate."MSPT Remaining Amount" += MSPTVendorLedgEntry."Closed by Amount (LCY)";
                            END;
                          UNTIL MSPTVendorLedgEntry.NEXT = 0;
                        MSPTVendorLedgEntry.RESET;
                        MSPTVendorLedgEntry.SETRANGE("Entry No.",TempVendorLedgEntry."Closed by Entry No.");
                        MSPTVendorLedgEntry.SETRANGE("MSPT Due Date",0D,EndingDate);
                        IF MSPTVendorLedgEntry.FIND('-') THEN
                          REPEAT
                            MSPTVendorLedgEntry.CALCFIELDS("MSPT Amount");
                            IF MSPTVendorLedgEntry."MSPT Amount" <> 0 THEN BEGIN
                              VendorLedgEntryEndingDate."MSPT Remaining Amount" -= MSPTVendorLedgEntry."Closed by Amount";
                              //VendorLedgEntryEndingDate."MSPT Remaining Amount" -= MSPTVendorLedgEntry."Closed by Amount (LCY)";
                            END;
                          UNTIL MSPTVendorLedgEntry.NEXT = 0;
                         */

                        VendorLedgEntryEndingDate := TempVendorLedgEntry;
                        //VendorLedgEntryEndingDate.SETRANGE("Date Filter",0D,EndingDate);
                        VendorLedgEntryEndingDate.CALCFIELDS("MSPT Amount", "MSPT Remaining Amount");
                        IF VendorLedgEntryEndingDate."MSPT Remaining Amount" = 0 THEN
                            CurrReport.SKIP;

                        CASE AgingBy OF
                            AgingBy::"Due Date":
                                PeriodIndex := GetPeriodIndex(VendorLedgEntryEndingDate."MSPT Due Date");
                            AgingBy::"Posting Date":
                                PeriodIndex := GetPeriodIndex(VendorLedgEntryEndingDate."Posting Date");
                            AgingBy::"Document Date":
                                PeriodIndex := GetPeriodIndex(VendorLedgEntryEndingDate."Document Date");
                        END;
                        CLEAR(AgedVendorLedgEntry);
                        AgedVendorLedgEntry[PeriodIndex]."MSPT Remaining Amount" := VendorLedgEntryEndingDate."MSPT Remaining Amount";
                        //AgedVendorLedgEntry[PeriodIndex]."MSPT Remaining Amount" := VendorLedgEntryEndingDate."MSPT Remaining Amount";
                        TotalVendorLedgEntry[PeriodIndex]."MSPT Remaining Amount" += VendorLedgEntryEndingDate."MSPT Remaining Amount";
                        //TotalVendorLedgEntry[PeriodIndex]."MSPT Remaining Amount" += VendorLedgEntryEndingDate."MSPT Remaining Amount";
                        GrandTotalVendorLedgEntry[PeriodIndex]."MSPT Remaining Amount" += VendorLedgEntryEndingDate."MSPT Remaining Amount";
                        TotalVendorLedgEntry[1]."MSPT Amount" += VendorLedgEntryEndingDate."MSPT Remaining Amount";
                        //TotalVendorLedgEntry[1]."MSPT Amount " += VendorLedgEntryEndingDate."MSPT Remaining Amount";
                        GrandTotalVendorLedgEntry[1]."MSPT Amount" += VendorLedgEntryEndingDate."MSPT Remaining Amount";

                    end;

                    trigger OnPostDataItem();
                    begin
                        //IF NOT PrintAmountInLCY THEN
                        // UpdateCurrencyTotals;
                    end;

                    trigger OnPreDataItem();
                    begin
                        //IF NOT PrintAmountInLCY THEN
                        // TempVendorLedgEntry.SETRANGE("Currency Code",TempCurrency.Code);
                    end;
                }

                trigger OnAfterGetRecord();
                begin
                    CLEAR(TotalVendorLedgEntry);

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
                    IF NewPagePerVendor AND (NumberOfCurrencies > 0) THEN
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
                TempVendorLedgEntry.RESET;
                TempVendorLedgEntry.DELETEALL;
            end;
        }
        dataitem(CurrencyTotals; "Integer")
        {
            DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
            column(Original_Amount_Control109; AgedVendorLedgEntry[1]."MSPT Remaining Amount")
            {
                AutoFormatExpression = CurrencyCode;
                AutoFormatType = 1;
            }
            column(Original_Amount_Control112; AgedVendorLedgEntry[5]."MSPT Remaining Amount")
            {
                AutoFormatExpression = CurrencyCode;
                AutoFormatType = 1;
            }
            column(Original_Amount_Control113; AgedVendorLedgEntry[4]."MSPT Remaining Amount")
            {
                AutoFormatExpression = CurrencyCode;
                AutoFormatType = 1;
            }
            column(Original_Amount_Control114; AgedVendorLedgEntry[3]."MSPT Remaining Amount")
            {
                AutoFormatExpression = CurrencyCode;
                AutoFormatType = 1;
            }
            column(Original_Amount_Control115; AgedVendorLedgEntry[2]."MSPT Remaining Amount")
            {
                AutoFormatExpression = CurrencyCode;
                AutoFormatType = 1;
            }
            column(Original_Amount_Control116; AgedVendorLedgEntry[6]."MSPT Remaining Amount")
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

                CLEAR(AgedVendorLedgEntry);
                TempCurrencyAmount.SETRANGE("Currency Code", TempCurrency2.Code);
                IF TempCurrencyAmount.FIND('-') THEN
                    REPEAT
                        IF TempCurrencyAmount.Date <> 12319999D THEN
                            AgedVendorLedgEntry[GetPeriodIndex(TempCurrencyAmount.Date)]."Remaining Amount" :=
                              TempCurrencyAmount.Amount
                        ELSE
                            AgedVendorLedgEntry[6]."Remaining Amount" := TempCurrencyAmount.Amount;
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
        VendorFilter := Vendor.GETFILTERS;

        GLSetup.GET;

        CalcDates;
        CreateHeadings;
    end;

    var
        GLSetup: Record "General Ledger Setup";
        TempVendorLedgEntry: Record "MSPT Vendor Ledger Entry" temporary;
        VendorLedgEntryEndingDate: Record "MSPT Vendor Ledger Entry";
        TotalVendorLedgEntry: array[5] of Record "MSPT Vendor Ledger Entry";
        GrandTotalVendorLedgEntry: array[5] of Record "MSPT Vendor Ledger Entry";
        AgedVendorLedgEntry: array[6] of Record "MSPT Vendor Ledger Entry";
        TempCurrency: Record Currency temporary;
        TempCurrency2: Record Currency temporary;
        TempCurrencyAmount: Record "Currency Amount" temporary;
        VendorFilter: Text[250];
        EndingDate: Date;
        AgingBy: Option "Due Date","Posting Date","Document Date";
        PeriodLength: DateFormula;
        PrintDetails: Boolean;
        HeadingType: Option "Date Interval","Number of Days";
        NewPagePerVendor: Boolean;
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
        Aged_Accounts_PayableCaptionLbl: Label 'Aged Accounts Payable';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        All_Amounts_in_LCYCaptionLbl: Label 'All Amounts in LCY';
        Aged_Overdue_AmountsCaptionLbl: Label 'Aged Overdue Amounts';
        Original_Amount_Control58CaptionLbl: Label 'Balance';
        VendorLedgEntryEndingDate__MSPT_Amount_CaptionLbl: Label '"Original Amount "';
        VendorLedgEntryEndingDate__MSPT_Due_Date_CaptionLbl: Label 'Due Date';
        VendorLedgEntryEndingDate__Document_No__CaptionLbl: Label 'Document No.';
        VendorLedgEntryEndingDate__Posting_Date_CaptionLbl: Label 'Posting Date';
        FORMAT_VendorLedgEntryEndingDate__Document_Type__CaptionLbl: Label 'Document Type';
        Original_Amount_Control17CaptionLbl: Label 'Balance';
        Original_Amount_Control24CaptionLbl: Label 'Balance';
        Total__LCY_CaptionLbl: Label 'Total (LCY)';

    [LineStart(5054)]
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

    [LineStart(5073)]
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

    [LineStart(5092)]
    local procedure InsertTemp(var MSPTVendorLedgEntry: Record "MSPT Vendor Ledger Entry");
    var
        Currency: Record Currency;
    begin
        WITH TempVendorLedgEntry DO BEGIN
            IF GET(MSPTVendorLedgEntry."Entry No.") THEN
                EXIT;
            TempVendorLedgEntry := MSPTVendorLedgEntry;
            INSERT;
            // IF PrintAmountInLCY THEN BEGIN
            CLEAR(TempCurrency);
            TempCurrency."Amount Rounding Precision" := GLSetup."Amount Rounding Precision";
            IF TempCurrency.INSERT THEN;
            EXIT;
            // END;
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

    [LineStart(5116)]
    local procedure GetPeriodIndex(Date: Date): Integer;
    var
        i: Integer;
    begin
        FOR i := 1 TO ARRAYLEN(PeriodEndDate) DO
            IF Date IN [PeriodStartDate[i] .. PeriodEndDate[i]] THEN
                EXIT(i);
    end;

    [LineStart(5121)]
    local procedure Pct(a: Decimal; b: Decimal): Text[30];
    begin
        IF b <> 0 THEN
            EXIT(FORMAT(ROUND(100 * a / b, 0.1), 0, '<Sign><Integer><Decimals,2>') + '%');
    end;

    [LineStart(5125)]
    local procedure UpdateCurrencyTotals();
    var
        i: Integer;
    begin
        TempCurrency2.Code := CurrencyCode;
        IF TempCurrency2.INSERT THEN;
        WITH TempCurrencyAmount DO BEGIN
            FOR i := 1 TO ARRAYLEN(TotalVendorLedgEntry) DO BEGIN
                "Currency Code" := CurrencyCode;
                Date := PeriodStartDate[i];
                IF FIND THEN BEGIN
                    Amount := Amount + TotalVendorLedgEntry[i]."MSPT Remaining Amount";
                    MODIFY;
                END ELSE BEGIN
                    "Currency Code" := CurrencyCode;
                    Date := PeriodStartDate[i];
                    Amount := TotalVendorLedgEntry[i]."MSPT Remaining Amount";
                    INSERT;
                END;
            END;
            "Currency Code" := CurrencyCode;
            Date := 12319999D;
            IF FIND THEN BEGIN
                Amount := Amount + TotalVendorLedgEntry[1]."MSPT Amount";
                MODIFY;
            END ELSE BEGIN
                "Currency Code" := CurrencyCode;
                Date := 12319999D;
                Amount := TotalVendorLedgEntry[1]."MSPT Amount";
                INSERT;
            END;
        END;
    end;
}

