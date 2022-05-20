table 33000899 "Str Rdso report"
{

    fields
    {
        field(1;"Issue No.";Code[20])
        {
        }
        field(2;"Issue Line No.";Integer)
        {
        }
        field(3;"Item No.";Code[20])
        {
        }
        field(4;Description;Text[50])
        {
        }
        field(5;"Production Order";Code[20])
        {
        }
        field(6;"Sales Order No.";Code[20])
        {
        }
        field(7;"Product No.";Code[20])
        {
        }
        field(8;"Issued Qty";Decimal)
        {
        }
        field(9;"Return Qy";Decimal)
        {
        }
        field(10;Lot;Code[20])
        {
        }
    }

    keys
    {
        key(Key1;"Issue No.")
        {
        }
        key(Key2;"Sales Order No.","Product No.",Lot,"Production Order")
        {
            SumIndexFields = "Issued Qty","Return Qy";
        }
    }

    fieldgroups
    {
    }
}

