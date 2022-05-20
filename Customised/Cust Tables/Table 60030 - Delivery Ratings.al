table 60030 "Delivery Ratings"
{
    // version POAU

    LookupPageID = "CS Stock Adjustment Card";

    fields
    {
        field(1;"Minumum Value";Integer)
        {
        }
        field(2;"Maximum Value";Integer)
        {
        }
        field(3;Rating;Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0:2;
        }
    }

    keys
    {
        key(Key1;"Minumum Value","Maximum Value",Rating)
        {
        }
    }

    fieldgroups
    {
    }
}

