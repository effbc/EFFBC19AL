page 60113 "MSPT Receivables-Payables"
{
    // version MSPT1.0

    // B2B Software Technologies
    // ---------------------------------------------------
    // Project : Mile Stone Payment Terms
    // B2B
    // No. sign   Description
    // ---------------------------------------------------
    // 01  B2B    MSPT Receivables-Payables

    Caption = 'MSPT Receivables-Payables';
    PageType = List;
    SaveValues = true;
    SourceTable = "General Ledger Setup";

    layout
    {
        area(content)
        {
            part(MSPTReceivPayablesLines; "MSPTReceivables-Payables Lines")
            {
            }
            field(PeriodType; PeriodType)
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
            field(AmountType; AmountType)
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
        PeriodType: Option Day,Week,Month,Quarter,Year,Period;
        AmountType: Option "Net Change","Balance at Date";

    [LineStart(11080)]
    procedure UpdateSubForm();
    begin
        CurrPage.MSPTReceivPayablesLines.PAGE.Set(Rec, PeriodType, AmountType);
    end;

    [LineStart(11083)]
    local procedure DayPeriodTypeOnPush();
    begin
        UpdateSubForm;
    end;

    [LineStart(11086)]
    local procedure WeekPeriodTypeOnPush();
    begin
        UpdateSubForm;
    end;

    [LineStart(11089)]
    local procedure MonthPeriodTypeOnPush();
    begin
        UpdateSubForm;
    end;

    [LineStart(11092)]
    local procedure QuarterPeriodTypeOnPush();
    begin
        UpdateSubForm;
    end;

    [LineStart(11095)]
    local procedure YearPeriodTypeOnPush();
    begin
        UpdateSubForm;
    end;

    [LineStart(11098)]
    local procedure PeriodPeriodTypeOnPush();
    begin
        UpdateSubForm;
    end;

    [LineStart(11101)]
    local procedure NetChangeAmountTypeOnPush();
    begin
        UpdateSubForm;
    end;

    [LineStart(11104)]
    local procedure BalanceatDateAmountTypeOnPush();
    begin
        UpdateSubForm;
    end;

    [LineStart(11107)]
    local procedure DayPeriodTypeOnValidate();
    begin
        DayPeriodTypeOnPush;
    end;

    [LineStart(11110)]
    local procedure WeekPeriodTypeOnValidate();
    begin
        WeekPeriodTypeOnPush;
    end;

    [LineStart(11113)]
    local procedure MonthPeriodTypeOnValidate();
    begin
        MonthPeriodTypeOnPush;
    end;

    [LineStart(11116)]
    local procedure QuarterPeriodTypeOnValidate();
    begin
        QuarterPeriodTypeOnPush;
    end;

    [LineStart(11119)]
    local procedure YearPeriodTypeOnValidate();
    begin
        YearPeriodTypeOnPush;
    end;

    [LineStart(11122)]
    local procedure PeriodPeriodTypeOnValidate();
    begin
        PeriodPeriodTypeOnPush;
    end;

    [LineStart(11125)]
    local procedure NetChangeAmountTypeOnValidate();
    begin
        NetChangeAmountTypeOnPush;
    end;

    [LineStart(11128)]
    local procedure BalanceatDateAmountTypeOnValid();
    begin
        BalanceatDateAmountTypeOnPush;
    end;
}

