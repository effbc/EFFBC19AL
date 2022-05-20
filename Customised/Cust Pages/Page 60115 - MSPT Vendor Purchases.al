page 60115 "MSPT Vendor Purchases"
{
    // version MSPT1.0

    // B2B Software Technologies
    // ---------------------------------------------------
    // Project : Mile Stone Payment Terms
    // B2B
    // No. sign   Description
    // ---------------------------------------------------
    // 01  B2B    MSPT Vendor Purchases

    Caption = 'MSPT Vendor Purchases';
    PageType = List;
    SaveValues = true;
    SourceTable = Vendor;

    layout
    {
        area(content)
        {
            part(MSPTVendPurchLines;"MSPT Vendor Purchase Lines")
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

    [LineStart(11179)]
    procedure UpdateSubForm();
    begin
        CurrPage.MSPTVendPurchLines.PAGE.Set(Rec,PeriodType,AmountType);
    end;

    [LineStart(11182)]
    local procedure DayPeriodTypeOnPush();
    begin
        UpdateSubForm;
    end;

    [LineStart(11185)]
    local procedure WeekPeriodTypeOnPush();
    begin
        UpdateSubForm;
    end;

    [LineStart(11188)]
    local procedure MonthPeriodTypeOnPush();
    begin
        UpdateSubForm;
    end;

    [LineStart(11191)]
    local procedure QuarterPeriodTypeOnPush();
    begin
        UpdateSubForm;
    end;

    [LineStart(11194)]
    local procedure YearPeriodTypeOnPush();
    begin
        UpdateSubForm;
    end;

    [LineStart(11197)]
    local procedure PeriodPeriodTypeOnPush();
    begin
        UpdateSubForm;
    end;

    [LineStart(11200)]
    local procedure NetChangeAmountTypeOnPush();
    begin
        UpdateSubForm;
    end;

    [LineStart(11203)]
    local procedure BalanceatDateAmountTypeOnPush();
    begin
        UpdateSubForm;
    end;

    [LineStart(11206)]
    local procedure DayPeriodTypeOnValidate();
    begin
        DayPeriodTypeOnPush;
    end;

    [LineStart(11209)]
    local procedure WeekPeriodTypeOnValidate();
    begin
        WeekPeriodTypeOnPush;
    end;

    [LineStart(11212)]
    local procedure MonthPeriodTypeOnValidate();
    begin
        MonthPeriodTypeOnPush;
    end;

    [LineStart(11215)]
    local procedure QuarterPeriodTypeOnValidate();
    begin
        QuarterPeriodTypeOnPush;
    end;

    [LineStart(11218)]
    local procedure YearPeriodTypeOnValidate();
    begin
        YearPeriodTypeOnPush;
    end;

    [LineStart(11221)]
    local procedure PeriodPeriodTypeOnValidate();
    begin
        PeriodPeriodTypeOnPush;
    end;

    [LineStart(11224)]
    local procedure NetChangeAmountTypeOnValidate();
    begin
        NetChangeAmountTypeOnPush;
    end;

    [LineStart(11227)]
    local procedure BalanceatDateAmountTypeOnValid();
    begin
        BalanceatDateAmountTypeOnPush;
    end;
}

