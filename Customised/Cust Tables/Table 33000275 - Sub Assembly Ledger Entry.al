table 33000275 "Sub Assembly Ledger Entry"
{
    // version WIP1.0


    fields
    {
        field(1;"Entry No.";Integer)
        {
        }
        field(2;"Sub Assembly";Code[20])
        {
        }
        field(3;"Posting Date";Date)
        {
        }
        field(4;"Document No.";Code[20])
        {
        }
        field(5;"Location Code";Code[20])
        {
        }
        field(6;Quantity;Decimal)
        {
        }
        field(7;"Remaining Quantity";Decimal)
        {
        }
        field(8;"Invoiced Quantity";Decimal)
        {
        }
        field(9;"Prod. Order No.";Code[20])
        {
        }
        field(10;"Prod. Order Line No.";Integer)
        {
        }
        field(11;"Unit Of Measure Code";Code[20])
        {
        }
        field(12;"Item No.";Code[20])
        {
        }
        field(13;"Variant Code";Code[20])
        {
        }
        field(14;"Entry Type";Option)
        {
            OptionCaption = '" ,Consumption,Output,Transfer"';
            OptionMembers = " ",Consumption,Output,Transfer;
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
        }
    }

    fieldgroups
    {
    }
}

