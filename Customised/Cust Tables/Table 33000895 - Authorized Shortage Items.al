table 33000895 "Authorized Shortage Items"
{

    fields
    {
        field(1;"Item No.";Code[30])
        {
        }
        field(2;Description;Text[50])
        {
        }
        field(3;"Production Date";Date)
        {
        }
        field(4;"Location Code";Code[10])
        {
            TableRelation = Location;
        }
        field(5;Shortage;Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"Item No.","Production Date","Location Code")
        {
        }
    }

    fieldgroups
    {
    }
}

