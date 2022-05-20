page 60272 "Customer/Contact List"
{
    // version B2BQTO

    PageType = List;
    SourceTable = "Customer/Contact Data";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                }
                field("Sales Quote No.";"Sales Quote No.")
                {
                }
                field(Type;Type)
                {
                }
                field("Customer\Contact";"Customer\Contact")
                {
                }
                field(Name;Name)
                {
                }
                field("Email Id";"Email Id")
                {
                }
                field("Mail Send";"Mail Send")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage();
    begin
        
         /*Customer.RESET;
          Customer.SETRANGE("No.",);
          IF Customer.FINDSET THEN
            REPEAT
              CustomerContactData.INIT;
              CustomerContactData."No." := NoLVar;
              CustomerContactData."Sales Quote No." := QuoteNoGVar;
              CustomerContactData."Customer\Contact" := Customer."No.";
              CustomerContactData."Email Id" := Customer."E-Mail";
              CustomerContactData.Name := Customer.Name;
              CustomerContactData.Place := Customer.City;
              CustomerContactData.Type := CustomerContactData.Type::Customer;
              CustomerContactData.INSERT;
              NoLVar +=1;
              Customer."Make A Quote" := FALSE;
              Customer.MODIFY;
            UNTIL Customer.NEXT = 0;
        END;
        */

    end;

    var
        SH : Record "Sales Header";
        cus : Record Customer;
        id : Integer;
        QuoteNoGVar : Code[20];
        PageVar : Page "Sales Quote";

    [LineStart(21550)]
    procedure SendQuoteNo(QuoLpar : Code[20]);
    begin
        QuoteNoGVar := QuoLpar;
    end;
}

