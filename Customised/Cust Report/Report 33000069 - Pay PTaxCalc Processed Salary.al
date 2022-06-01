report 33000069 "Pay PTaxCalc Processed Salary"
{
    // version NEOGYNPAY13.70.00.06

    Caption = 'PTaxCalc Processed Salary';
    ProcessingOnly = true;

    dataset
    {
        dataitem(Employee; Employee)
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
        //ImportingTaxElements.TaxSalariesUpdation(AYID, Employee.GETFILTER("No."))
        PayProfessionalTaxCalculation."Professional Tax Cal Sal"(PayYear.ID, AYID, Employee.GETFILTER("No."));
    end;

    trigger OnPreReport();
    begin
        //IF AYID = 0 THEN ERROR(Text000);
    end;

    var
        AYID: Integer;
        AYStartDate: Date;
        AYEndDate: Date;
        PayYear: Record "Pay Year";
        Text000: Label 'Required Assessment Year';
        PayProfessionalTaxCalculation: Codeunit "Pay ProfessionalTaxCalculation";
}

