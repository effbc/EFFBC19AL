page 60112 "MSPT Customer Sales Lines"
{
    // version MSPT1.0

    // B2B Software Technologies
    // ---------------------------------------------------
    // Project : Mile Stone Payment Terms
    // B2B
    // No. sign   Description
    // ---------------------------------------------------
    // 01  B2B    MSPT Customer Sales Lines

    Caption = 'MSPT Customer Sales Lines';
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
                field("Cust.""MSPT Balance Due"""; Cust."MSPT Balance Due")
                {
                    AutoFormatType = 1;
                    Caption = '"Balance Due "';
                    DrillDown = true;

                    trigger OnDrillDown();
                    begin
                        ShowCustEntriesDue;
                    end;
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
        Cust.CALCFIELDS("MSPT Balance Due");
    end;

    trigger OnFindRecord(Which: Text): Boolean;
    begin
        EXIT(PeriodFormMgt.FindDate(Which, Rec, CustPeriodLength));
    end;

    trigger OnNextRecord(Steps: Integer): Integer;
    begin
        EXIT(PeriodFormMgt.NextDate(Steps, Rec, CustPeriodLength));
    end;

    trigger OnOpenPage();
    begin
        RESET;
    end;

    var
        Cust: Record Customer;
        MSPTCustLedgEntry: Record "MSPT Customer Ledger Entry";
        PeriodFormMgt: Codeunit PeriodFormManagement;
        CustPeriodLength: Option Day,Week,Month,Quarter,Year,Period;
        AmountType: Option "Net Change","Balance at Date";

    [LineStart(11042)]
    procedure Set(var NewCust: Record Customer; NewCustPeriodLength: Integer; NewAmountType: Option "Net Change","Balance at Date");
    begin
        Cust.COPY(NewCust);
        CustPeriodLength := NewCustPeriodLength;
        AmountType := NewAmountType;
        CurrPage.UPDATE(FALSE);
    end;

    [LineStart(11048)]
    local procedure ShowCustEntries();
    begin
        /*SetDateFilter;
        MSPTCustLedgEntry.RESET;
        MSPTCustLedgEntry.SETCURRENTKEY("Customer No.","Posting Date");
        MSPTCustLedgEntry.SETRANGE("Customer No.",Cust."No.");
        MSPTCustLedgEntry.SETFILTER("Posting Date",Cust.GETFILTER("Date Filter"));
        MSPTCustLedgEntry.SETFILTER("Global Dimension 1 Code",Cust.GETFILTER("Global Dimension 1 Filter"));
        MSPTCustLedgEntry.SETFILTER("Global Dimension 2 Code",Cust.GETFILTER("Global Dimension 2 Filter"));
        FORM.RUN(0,MSPTCustLedgEntry);
        */

    end;

    [LineStart(11059)]
    local procedure ShowCustEntriesDue();
    begin
        SetDateFilter;
        MSPTCustLedgEntry.RESET;
        //MSPTCustLedgEntry.SETCURRENTKEY("Customer No.",Open,Positive,"MSPT Due Date");
        MSPTCustLedgEntry.SETCURRENTKEY("Customer No.", Open, "MSPT Due Date");
        MSPTCustLedgEntry.SETRANGE("Customer No.", Cust."No.");
        MSPTCustLedgEntry.SETRANGE(Open, TRUE);
        MSPTCustLedgEntry.SETFILTER("MSPT Due Date", Cust.GETFILTER("Date Filter"));
        MSPTCustLedgEntry.SETFILTER("Global Dimension 1 Code", Cust.GETFILTER("Global Dimension 1 Filter"));
        MSPTCustLedgEntry.SETFILTER("Global Dimension 2 Code", Cust.GETFILTER("Global Dimension 2 Filter"));
        PAGE.RUN(0, MSPTCustLedgEntry)
    end;

    [LineStart(11071)]
    local procedure SetDateFilter();
    begin
        IF AmountType = AmountType::"Net Change" THEN
            Cust.SETRANGE("Date Filter", "Period Start", "Period End")
        ELSE
            Cust.SETRANGE("Date Filter", 0D, "Period End");
    end;
}

