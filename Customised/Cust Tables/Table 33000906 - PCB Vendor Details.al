table 33000906 "PCB Vendor Details"
{

    fields
    {
        field(1;"Vedor No.";Code[10])
        {
            TableRelation = Vendor."No.";
        }
        field(2;"Delivery Mode";Option)
        {
            OptionMembers = Normal,Fast,"Super Fast";
        }
        field(3;"Lead Time";Integer)
        {
        }
        field(4;"Price Percentage";Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"Vedor No.","Delivery Mode")
        {
        }
    }

    fieldgroups
    {
    }
}

