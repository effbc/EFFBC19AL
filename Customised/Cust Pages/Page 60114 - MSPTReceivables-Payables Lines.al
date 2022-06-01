page 60114 "MSPTReceivables-Payables Lines"
{
    // version MSPT1.0

    // B2B Software Technologies
    // ---------------------------------------------------
    // Project : Mile Stone Payment Terms
    // B2B
    // No. sign   Description
    // ---------------------------------------------------
    // 01  B2B    MSPT Receivables-Payables lines

    Caption = 'MSPTReceivables-Payables Lines';
    PageType = ListPart;
    SourceTable = Date;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                Editable = false;
                ShowCaption = false;
                field("Period Start"; "Period Start")
                {
                }
                field("Period Name"; "Period Name")
                {
                }
                field("GLSetup.""MSPT Cust. Balances Due"""; GLSetup."MSPT Cust. Balances Due")
                {
                    AutoFormatType = 1;
                    Caption = 'Cust. Balances Due';
                    DrillDown = true;

                    trigger OnDrillDown();
                    begin
                        ShowCustEntriesDue;
                    end;
                }
                field("GLSetup.""MSPT Vendor Balances Due"""; GLSetup."MSPT Vendor Balances Due")
                {
                    AutoFormatType = 1;
                    Caption = 'Vendor Balances Due';
                    DrillDown = true;

                    trigger OnDrillDown();
                    begin
                        ShowVendEntriesDue;
                    end;
                }
                field("GLSetup.""MSPT Cust. Balances Due""-GLSetup.""MSPT Vendor Balances Due"""; GLSetup."MSPT Cust. Balances Due" - GLSetup."MSPT Vendor Balances Due")
                {
                    AutoFormatType = 1;
                    Caption = 'Receivables-Payables';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        SetDateFilter;
        GLSetup.CALCFIELDS("MSPT Cust. Balances Due", "MSPT Vendor Balances Due");
    end;

    trigger OnFindRecord(Which: Text): Boolean;
    begin
        EXIT(PeriodFormMgt.FindDate(Which, Rec, EntrdPeriodLength));
    end;

    trigger OnNextRecord(Steps: Integer): Integer;
    begin
        EXIT(PeriodFormMgt.NextDate(Steps, Rec, EntrdPeriodLength));
    end;

    trigger OnOpenPage();
    begin
        RESET;
    end;

    var
        GLSetup: Record "General Ledger Setup";
        MSPTCustLedgEntry: Record "MSPT Customer Ledger Entry";
        MSPTVendLedgEntry: Record "MSPT Vendor Ledger Entry";
        PeriodFormMgt: Codeunit PeriodFormManagement;
        EntrdPeriodLength: Option Day,Week,Month,Quarter,Year,Period;
        AmountType: Option "Net Change","Balance at Date";

    [LineStart(11144)]
    procedure Set(var NewGLSetup: Record "General Ledger Setup"; NewEntrdPeriodLength: Integer; NewAmountType: Option "Net Change","Balance at Date");
    begin
        GLSetup.COPY(NewGLSetup);
        EntrdPeriodLength := NewEntrdPeriodLength;
        AmountType := NewAmountType;
        CurrPage.UPDATE(FALSE);
    end;

    [LineStart(11150)]
    local procedure ShowCustEntriesDue();
    begin
        SetDateFilter;
        MSPTCustLedgEntry.RESET;
        MSPTCustLedgEntry.SETCURRENTKEY(Open, "MSPT Due Date");
        MSPTCustLedgEntry.SETRANGE(Open, TRUE);
        MSPTCustLedgEntry.SETFILTER("MSPT Due Date", GLSetup.GETFILTER("Date Filter"));
        MSPTCustLedgEntry.SETFILTER("Global Dimension 1 Code", GLSetup.GETFILTER("Global Dimension 1 Filter"));
        MSPTCustLedgEntry.SETFILTER("Global Dimension 2 Code", GLSetup.GETFILTER("Global Dimension 2 Filter"));
        PAGE.RUN(0, MSPTCustLedgEntry)
    end;

    [LineStart(11160)]
    local procedure ShowVendEntriesDue();
    begin
        SetDateFilter;
        MSPTVendLedgEntry.RESET;
        MSPTVendLedgEntry.SETCURRENTKEY(Open, "MSPT Due Date");
        MSPTVendLedgEntry.SETRANGE(Open, TRUE);
        MSPTVendLedgEntry.SETFILTER("MSPT Due Date", GLSetup.GETFILTER("Date Filter"));
        MSPTVendLedgEntry.SETFILTER("Global Dimension 1 Code", GLSetup.GETFILTER("Global Dimension 1 Filter"));
        MSPTVendLedgEntry.SETFILTER("Global Dimension 2 Code", GLSetup.GETFILTER("Global Dimension 2 Filter"));
        PAGE.RUN(0, MSPTVendLedgEntry);
    end;

    [LineStart(11170)]
    local procedure SetDateFilter();
    begin
        IF AmountType = AmountType::"Net Change" THEN
            GLSetup.SETRANGE("Date Filter", "Period Start", "Period End")
        ELSE
            GLSetup.SETRANGE("Date Filter", 0D, "Period End");
    end;
}

