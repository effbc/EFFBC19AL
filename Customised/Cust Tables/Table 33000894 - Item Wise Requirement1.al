table 33000894 "Item Wise Requirement1"
{

    fields
    {
        field(1;"Item No.";Code[30])
        {
            TableRelation = Item;
        }
        field(2;Description;Text[50])
        {
        }
        field(3;"Required Quantity";Decimal)
        {
            DecimalPlaces = 0:5;
        }
        field(4;"Qty. In Material Issues";Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"Item No.")
        {
        }
    }

    fieldgroups
    {
    }
}

