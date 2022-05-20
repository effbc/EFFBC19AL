report 33000066 "TDS Tax Calculation"
{
    // version NEOGYNPAY13.70.00.06

    Caption = 'Tax Calculation';
    ProcessingOnly = true;

    dataset
    {
        dataitem(Employee;Employee)
        {
            RequestFilterFields = "No.";
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
        PayTaxCalculation.AskedPayYearID(AYID, Employee.GETFILTER("No."),AYStartDate,AYEndDate);
        PayTaxCalculation.RUN;
    end;

    trigger OnPreReport();
    begin
        IF AYID = 0 THEN ERROR(Text000);
    end;

    var
        AYID : Integer;
        AYStartDate : Date;
        AYEndDate : Date;
        PayYear : Record "Pay Year";
        PayTaxCalculation : Codeunit "Pay Tax Calculation";
        Text000 : Label 'Required Assessment Year';
}

