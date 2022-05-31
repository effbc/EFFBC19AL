report 50078 "MSPT Vendor - Summary Aging"
{
    // version MSPT1.0

    // B2B Software Technologies
    // ---------------------------------------------------
    // Project : Mile Stone Payment Terms
    // B2B
    // No. sign   Description
    // ---------------------------------------------------
    // 01  B2B    MSPT Vendor-Summary Aging
    DefaultLayout = RDLC;
    RDLCLayout = './MSPT Vendor - Summary Aging.rdlc';

    Caption = 'MSPT Vendor - Summary Aging';

    dataset
    {
        dataitem(Vendor; Vendor)
        {
            DataItemTableView = SORTING(No.);
            RequestFilterFields = "No.", "Search Name", "Vendor Posting Group", "Currency Filter";
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
            column(Vendor_TABLECAPTION__________VendFilter; Vendor.TABLECAPTION + ': ' + VendFilter)
            {
            }
            column(EmptyString; '')
            {
            }
            column(PeriodStartDate_2_; PeriodStartDate[2])
            {
            }
            column(PeriodStartDate_3_; PeriodStartDate[3])
            {
            }
            column(PeriodStartDate_4_; PeriodStartDate[4])
            {
            }
            column(PeriodStartDate_3____1; PeriodStartDate[3] - 1)
            {
            }
            column(PeriodStartDate_4____1; PeriodStartDate[4] - 1)
            {
            }
            column(PeriodStartDate_5____1; PeriodStartDate[5] - 1)
            {
            }
            column(VendBalanceDueLCY_1_; VendBalanceDueLCY[1])
            {
                AutoFormatType = 1;
            }
            column(VendBalanceDueLCY_2_; VendBalanceDueLCY[2])
            {
                AutoFormatType = 1;
            }
            column(VendBalanceDueLCY_3_; VendBalanceDueLCY[3])
            {
                AutoFormatType = 1;
            }
            column(VendBalanceDueLCY_4_; VendBalanceDueLCY[4])
            {
                AutoFormatType = 1;
            }
            column(VendBalanceDueLCY_5_; VendBalanceDueLCY[5])
            {
                AutoFormatType = 1;
            }
            column(TotalVendAmtDueLCY; TotalVendAmtDueLCY)
            {
                AutoFormatType = 1;
            }
            column(LineTotalVendAmountDue; LineTotalVendAmountDue)
            {
                AutoFormatType = 1;
            }
            column(VendBalanceDue_5_; VendBalanceDue[5])
            {
                AutoFormatType = 1;
            }
            column(VendBalanceDue_4_; VendBalanceDue[4])
            {
                AutoFormatType = 1;
            }
            column(VendBalanceDue_3_; VendBalanceDue[3])
            {
                AutoFormatType = 1;
            }
            column(VendBalanceDue_2_; VendBalanceDue[2])
            {
                AutoFormatType = 1;
            }
            column(VendBalanceDue_1_; VendBalanceDue[1])
            {
                AutoFormatType = 1;
            }
            column(Vendor_Name; Name)
            {
            }
            column(Vendor__No__; "No.")
            {
            }
            column(VendBalanceDueLCY_1__Control39; VendBalanceDueLCY[1])
            {
                AutoFormatType = 1;
            }
            column(VendBalanceDueLCY_2__Control40; VendBalanceDueLCY[2])
            {
                AutoFormatType = 1;
            }
            column(VendBalanceDueLCY_3__Control41; VendBalanceDueLCY[3])
            {
                AutoFormatType = 1;
            }
            column(VendBalanceDueLCY_4__Control42; VendBalanceDueLCY[4])
            {
                AutoFormatType = 1;
            }
            column(VendBalanceDueLCY_5__Control43; VendBalanceDueLCY[5])
            {
                AutoFormatType = 1;
            }
            column(TotalVendAmtDueLCY_Control44; TotalVendAmtDueLCY)
            {
                AutoFormatType = 1;
            }
            column(VendBalanceDueLCY_1__Control46; VendBalanceDueLCY[1])
            {
                AutoFormatType = 1;
            }
            column(VendBalanceDueLCY_2__Control47; VendBalanceDueLCY[2])
            {
                AutoFormatType = 1;
            }
            column(VendBalanceDueLCY_3__Control48; VendBalanceDueLCY[3])
            {
                AutoFormatType = 1;
            }
            column(VendBalanceDueLCY_4__Control49; VendBalanceDueLCY[4])
            {
                AutoFormatType = 1;
            }
            column(VendBalanceDueLCY_5__Control50; VendBalanceDueLCY[5])
            {
                AutoFormatType = 1;
            }
            column(TotalVendAmtDueLCY_Control51; TotalVendAmtDueLCY)
            {
                AutoFormatType = 1;
            }
            column(Vendor___Summary_AgingCaption; Vendor___Summary_AgingCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(All_amounts_are_in_LCYCaption; All_amounts_are_in_LCYCaptionLbl)
            {
            }
            column(Balance_DueCaption; Balance_DueCaptionLbl)
            {
            }
            column(NoCaption; NoCaptionLbl)
            {
            }
            column(NameCaption; NameCaptionLbl)
            {
            }
            column(beforeCaption; beforeCaptionLbl)
            {
            }
            column(after___Caption; after___CaptionLbl)
            {
            }
            column(BalanceCaption; BalanceCaptionLbl)
            {
            }
            column(VendBalanceDueLCY_1_Caption; VendBalanceDueLCY_1_CaptionLbl)
            {
            }
            column(VendBalanceDueLCY_1__Control39Caption; VendBalanceDueLCY_1__Control39CaptionLbl)
            {
            }
            column(Total__LCY_Caption; Total__LCY_CaptionLbl)
            {
            }
            dataitem("Integer"; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));

                trigger OnAfterGetRecord();
                var
                    MSPTDtldVendLedgEntry: Record "MSPT Dtld. Vendor Ledg. Entry";
                begin
                    IF Number = 1 THEN
                        Currency2.FIND('-')
                    ELSE
                        IF Currency2.NEXT = 0 THEN
                            CurrReport.BREAK;
                    Currency2.CALCFIELDS("Vendor Ledg. Entries in Filter");
                    IF NOT Currency2."Vendor Ledg. Entries in Filter" THEN
                        CurrReport.SKIP;

                    PrintLine := FALSE;
                    LineTotalVendAmountDue := 0;
                    FOR i := 1 TO 5 DO BEGIN
                        MSPTDtldVendLedgEntry.SETCURRENTKEY("Vendor No.", "MSPT Due Date");
                        MSPTDtldVendLedgEntry.SETRANGE("Vendor No.", Vendor."No.");
                        MSPTDtldVendLedgEntry.SETRANGE("MSPT Due Date", PeriodStartDate[i], PeriodStartDate[i + 1] - 1);
                        //MSPTDtldVendLedgEntry.SETRANGE("Currency Code",Currency2.Code);
                        MSPTDtldVendLedgEntry.CALCSUMS("MSPT Amount");
                        VendBalanceDue[i] := MSPTDtldVendLedgEntry.Amount;
                        IF VendBalanceDue[i] <> 0 THEN
                            PrintLine := TRUE;
                        LineTotalVendAmountDue := LineTotalVendAmountDue + VendBalanceDue[i];
                    END;
                end;

                trigger OnPreDataItem();
                begin
                    IF PrintAmountsInLCY OR NOT PrintLine THEN
                        CurrReport.BREAK;
                    Currency2.RESET;
                    Currency2.SETRANGE("Vendor Filter", Vendor."No.");
                    Vendor.COPYFILTER("Currency Filter", Currency2.Code);
                    IF (Vendor.GETFILTER("Global Dimension 1 Filter") <> '') OR
                       (Vendor.GETFILTER("Global Dimension 2 Filter") <> '')
                    THEN BEGIN
                        Vendor.COPYFILTER("Global Dimension 1 Filter", Currency2."Global Dimension 1 Filter");
                        Vendor.COPYFILTER("Global Dimension 2 Filter", Currency2."Global Dimension 2 Filter");
                    END;
                end;
            }

            trigger OnAfterGetRecord();
            var
                MSPTDtldVendLedgEntry: Record "MSPT Dtld. Vendor Ledg. Entry";
            begin
                PrintLine := FALSE;
                LineTotalVendAmountDue := 0;
                FOR i := 1 TO 5 DO BEGIN
                    MSPTDtldVendLedgEntry.SETCURRENTKEY("Vendor No.", "MSPT Due Date");
                    MSPTDtldVendLedgEntry.SETRANGE("Vendor No.", "No.");
                    MSPTDtldVendLedgEntry.SETRANGE("MSPT Due Date", PeriodStartDate[i], PeriodStartDate[i + 1] - 1);
                    MSPTDtldVendLedgEntry.CALCSUMS("MSPT Amount");
                    VendBalanceDue[i] := MSPTDtldVendLedgEntry."MSPT Amount";
                    VendBalanceDueLCY[i] := MSPTDtldVendLedgEntry."MSPT Amount";
                    IF VendBalanceDue[i] <> 0 THEN
                        PrintLine := TRUE;
                    LineTotalVendAmountDue := LineTotalVendAmountDue + VendBalanceDueLCY[i];
                    TotalVendAmtDueLCY := TotalVendAmtDueLCY + VendBalanceDueLCY[i];
                END;
            end;

            trigger OnPreDataItem();
            begin
                CurrReport.CREATETOTALS(VendBalanceDueLCY, TotalVendAmtDueLCY);
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
        VendFilter := Vendor.GETFILTERS;
        FOR i := 3 TO 5 DO
            PeriodStartDate[i] := CALCDATE(PeriodLength, PeriodStartDate[i - 1]);
        PeriodStartDate[6] := 12319999D;
    end;

    var
        Currency: Record Currency;
        Currency2: Record Currency temporary;
        PrintAmountsInLCY: Boolean;
        VendFilter: Text[250];
        PeriodStartDate: array[6] of Date;
        LineTotalVendAmountDue: Decimal;
        TotalVendAmtDueLCY: Decimal;
        VendBalanceDue: array[5] of Decimal;
        VendBalanceDueLCY: array[5] of Decimal;
        PeriodLength: DateFormula;
        PrintLine: Boolean;
        i: Integer;
        Vendor___Summary_AgingCaptionLbl: Label 'Vendor - Summary Aging';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        All_amounts_are_in_LCYCaptionLbl: Label 'All amounts are in LCY';
        Balance_DueCaptionLbl: Label 'Balance Due';
        NoCaptionLbl: Label 'No';
        NameCaptionLbl: Label 'Name';
        beforeCaptionLbl: Label '...before';
        after___CaptionLbl: Label 'after...';
        BalanceCaptionLbl: Label 'Balance';
        VendBalanceDueLCY_1_CaptionLbl: Label 'Continued (LCY)';
        VendBalanceDueLCY_1__Control39CaptionLbl: Label 'Continued (LCY)';
        Total__LCY_CaptionLbl: Label 'Total (LCY)';
}

