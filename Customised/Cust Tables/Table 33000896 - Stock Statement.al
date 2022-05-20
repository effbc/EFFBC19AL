table 33000896 "Stock Statement"
{

    fields
    {
        field(1;Month;Integer)
        {
        }
        field(2;Item;Code[20])
        {
        }
        field(3;"Stock Qty";Decimal)
        {
        }
        field(4;"Unit Cost";Decimal)
        {
        }
        field(5;"Total Cost";Decimal)
        {
        }
        field(6;"Month Name";Text[30])
        {
        }
        field(7;Year;Integer)
        {
        }
    }

    keys
    {
        key(Key1;Month,Year,Item)
        {
        }
        key(Key2;Month,Year,"Total Cost")
        {
        }
    }

    fieldgroups
    {
    }
}

