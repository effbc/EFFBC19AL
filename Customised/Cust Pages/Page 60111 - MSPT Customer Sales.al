page 60111 "MSPT Customer Sales"
{
    // version MSPT1.0

    // B2B Software Technologies
    // ---------------------------------------------------
    // Project : Mile Stone Payment Terms
    // B2B
    // No. sign   Description
    // ---------------------------------------------------
    // 01  B2B    MSPT Customer Sales

    Caption = 'MSPT Customer Sales';
    PageType = List;
    SaveValues = true;
    SourceTable = Customer;

    layout
    {
        area(content)
        {
            part(MSPTCustSalesLines;"MSPT Customer Sales Lines")
            {
            }
            field(PeriodType;PeriodType)
            {
                OptionCaption = 'Day,Week,Month,Quarter,Year,Period';
                ToolTip = 'Day';

                trigger OnValidate();
                begin
                    IF PeriodType = PeriodType::Period THEN
                      PeriodPeriodTypeOnValidate;
                    IF PeriodType = PeriodType::Year THEN
                      YearPeriodTypeOnValidate;
                    IF PeriodType = PeriodType::Quarter THEN
                      QuarterPeriodTypeOnValidate;
                    IF PeriodType = PeriodType::Month THEN
                      MonthPeriodTypeOnValidate;
                    IF PeriodType = PeriodType::Week THEN
                      WeekPeriodTypeOnValidate;
                    IF PeriodType = PeriodType::Day THEN
                      DayPeriodTypeOnValidate;
                end;
            }
            field(AmountType;AmountType)
            {
                OptionCaption = 'Net Change,Balance at Date';
                ToolTip = 'Net Change';

                trigger OnValidate();
                begin
                    IF AmountType = AmountType::"Balance at Date" THEN
                      BalanceatDateAmountTypeOnValid;
                    IF AmountType = AmountType::"Net Change" THEN
                      NetChangeAmountTypeOnValidate;
                end;
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        UpdateSubForm;
    end;

    var
        PeriodType : Option Day,Week,Month,Quarter,Year,Period;
        AmountType : Option "Net Change","Balance at Date";

    [LineStart(10978)]
    procedure UpdateSubForm();
    begin
        CurrPage.MSPTCustSalesLines.PAGE.Set(Rec,PeriodType,AmountType);
    end;

    [LineStart(10981)]
    local procedure DayPeriodTypeOnPush();
    begin
        UpdateSubForm;
    end;

    [LineStart(10984)]
    local procedure WeekPeriodTypeOnPush();
    begin
        UpdateSubForm;
    end;

    [LineStart(10987)]
    local procedure MonthPeriodTypeOnPush();
    begin
        UpdateSubForm;
    end;

    [LineStart(10990)]
    local procedure QuarterPeriodTypeOnPush();
    begin
        UpdateSubForm;
    end;

    [LineStart(10993)]
    local procedure YearPeriodTypeOnPush();
    begin
        UpdateSubForm;
    end;

    [LineStart(10996)]
    local procedure PeriodPeriodTypeOnPush();
    begin
        UpdateSubForm;
    end;

    [LineStart(10999)]
    local procedure BalanceatDateAmountTypeOnPush();
    begin
        UpdateSubForm;
    end;

    [LineStart(11002)]
    local procedure NetChangeAmountTypeOnPush();
    begin
        UpdateSubForm;
    end;

    [LineStart(11005)]
    local procedure DayPeriodTypeOnValidate();
    begin
        DayPeriodTypeOnPush;
    end;

    [LineStart(11008)]
    local procedure WeekPeriodTypeOnValidate();
    begin
        WeekPeriodTypeOnPush;
    end;

    [LineStart(11011)]
    local procedure MonthPeriodTypeOnValidate();
    begin
        MonthPeriodTypeOnPush;
    end;

    [LineStart(11014)]
    local procedure QuarterPeriodTypeOnValidate();
    begin
        QuarterPeriodTypeOnPush;
    end;

    [LineStart(11017)]
    local procedure YearPeriodTypeOnValidate();
    begin
        YearPeriodTypeOnPush;
    end;

    [LineStart(11020)]
    local procedure PeriodPeriodTypeOnValidate();
    begin
        PeriodPeriodTypeOnPush;
    end;

    [LineStart(11023)]
    local procedure NetChangeAmountTypeOnValidate();
    begin
        NetChangeAmountTypeOnPush;
    end;

    [LineStart(11026)]
    local procedure BalanceatDateAmountTypeOnValid();
    begin
        BalanceatDateAmountTypeOnPush;
    end;
}

