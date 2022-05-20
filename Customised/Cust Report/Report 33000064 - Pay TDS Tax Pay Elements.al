report 33000064 "Pay TDS Tax Pay Elements"
{
    // version NEOGYNPAY13.70.00.06

    Caption = 'TDS Tax Process Pay Elements';
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
        ImportingTaxElements.TaxSalariesUpdation(AYID, Employee.GETFILTER("No."))
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
        ImportingTaxElements : Codeunit "Importing Tax Elements";
        Text000 : Label 'Required Assessment Year';
}

