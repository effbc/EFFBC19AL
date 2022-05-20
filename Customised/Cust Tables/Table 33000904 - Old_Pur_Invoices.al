table 33000904 Old_Pur_Invoices
{

    fields
    {
        field(1;"Item No.";Code[20])
        {
        }
        field(2;Descrption;Text[30])
        {
        }
        field(3;"Lot No.";Code[20])
        {
        }
        field(4;"Unit Cost";Decimal)
        {
        }
        field(5;"Vendor Code";Code[20])
        {
            TableRelation = Vendor;
        }
        field(6;"Receipt/Invoice";Option)
        {
            OptionMembers = Old,Receipt,Invoice;
        }
    }

    keys
    {
        key(Key1;"Item No.","Lot No.")
        {
        }
    }

    fieldgroups
    {
    }
}

