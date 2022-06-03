report 33000065 "Pay TDS Tax Processed Salary"
{
    // version NEOGYNPAY13.70.00.06

    Caption = 'TDS Tax Processed Salary';
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
        ImportingTaxElements.TaxSalariesUpdationPEPD(AYID, Employee.GETFILTER("No."));
    end;

    trigger OnPreReport();
    begin
        IF AYID = 0 THEN ERROR(Text000);
    end;

    var
        AYID: Integer;
        AYStartDate: Date;
        AYEndDate: Date;
        PayYear: Record "Pay Year";
        ImportingTaxElements: Codeunit "Importing Tax Elements";
        Text000: Label 'Required Assessment Year';
}

