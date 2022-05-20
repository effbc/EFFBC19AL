table 33000918 "PCB Box data"
{

    fields
    {
        field(1;Product;Text[50])
        {
        }
        field(2;CPCB;Text[50])
        {
        }
        field(3;"CPCB Description";Text[100])
        {
        }
        field(4;Box;Integer)
        {
        }
        field(5;"Item No.";Text[20])
        {
        }
        field(6;Description;Text[100])
        {
        }
        field(7;Quantity;Decimal)
        {
            DecimalPlaces = 4:4;
        }
        field(8;Color;Text[30])
        {
        }
        field(9;"Color Code";Text[20])
        {
        }
        field(10;"BOX Sort";Integer)
        {
        }
    }

    keys
    {
        key(Key1;Product,CPCB,Box,"Item No.")
        {
        }
        key(Key2;Product,CPCB,"Item No.")
        {
        }
    }

    fieldgroups
    {
    }
}

