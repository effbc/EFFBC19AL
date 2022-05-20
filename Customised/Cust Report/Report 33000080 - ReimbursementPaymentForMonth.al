report 33000080 ReimbursementPaymentForMonth
{
    // version NEOGYNPAY13.70.00.06

    Permissions = TableData "Pay Employee Elements"=m;
    ProcessingOnly = true;

    dataset
    {
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
        Modification;
    end;

    var
        PayEmployeeElements : Record "Pay Employee Elements";
        PaymentForTheMonth : Decimal;

    [LineStart(21009)]
    procedure InitializationRecord(var Rec : Record "Pay Employee Elements");
    begin
        PayEmployeeElements.COPY(Rec);
        PaymentForTheMonth := PayEmployeeElements."Payment for Month";
    end;

    [LineStart(21013)]
    procedure Modification();
    begin
        //Modification
        PayEmployeeElements.VALIDATE("Payment for Month",PaymentForTheMonth);
        PayEmployeeElements.MODIFY;
    end;
}

