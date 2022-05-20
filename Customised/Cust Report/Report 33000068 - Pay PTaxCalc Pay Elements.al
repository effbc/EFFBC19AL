report 33000068 "Pay PTaxCalc Pay Elements"
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
        //ImportingTaxElements.TaxSalariesUpdation(AYID, Employee.GETFILTER("No."))
        PayProfessionalTaxCalculation."Professional Tax Cal Pro"(PayYear.ID,AYID,State,Employee.GETFILTER("No."));
        
        /*
        PayYear.RESET;
        PayYear.SETRANGE(PayYear.Type,3);
        IF FORM.RUNMODAL(33000014,PayYear) = ACTION::LookupOK THEN
          BEGIN
            IF PayYear.Closed = TRUE THEN
              ERROR(TEXT003);
            PayProfessionalTaxCalculation."Professional Tax Cal Pro"(PayYear.ID,AYID,State);
          END;
         */

    end;

    trigger OnPreReport();
    begin
        //IF AYID = 0 THEN ERROR(Text000);
    end;

    var
        AYID : Integer;
        AYStartDate : Date;
        AYEndDate : Date;
        PayYear : Record "Pay Year";
        PayProfessionalTaxCalculation : Codeunit "Pay ProfessionalTaxCalculation";
        Text000 : Label 'Required Assessment Year';
        State : Code[20];
}

