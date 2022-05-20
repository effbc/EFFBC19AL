table 33000276 "Sub Assembly BOM"
{
    // version WIP1.0


    fields
    {
        field(1;"Parent Item No.";Code[20])
        {
            TableRelation = "Sub Assembly";
        }
        field(2;"Line No.";Integer)
        {
        }
        field(3;"Sub Assembly No.";Code[20])
        {
            TableRelation = "Sub Assembly";
        }
        field(4;"Bill of Material";Boolean)
        {
        }
        field(5;Description;Text[30])
        {
        }
        field(6;"Unit of Measure Code";Code[10])
        {
            TableRelation = "Unit of Measure";
        }
        field(7;"Quantity per";Decimal)
        {
        }
        field(8;Position;Code[10])
        {
        }
        field(9;"Position 2";Code[10])
        {
        }
        field(10;"Position 3";Code[10])
        {
        }
        field(11;"Machine No.";Code[10])
        {
        }
        field(12;"Production Lead Time";Integer)
        {
        }
        field(13;"BOM Description";Text[30])
        {
        }
        field(14;"Installed in Line No.";Integer)
        {
        }
        field(15;"Installed in SA No.";Code[10])
        {
        }
    }

    keys
    {
        key(Key1;"Parent Item No.")
        {
        }
    }

    fieldgroups
    {
    }
}

