table 33000924 "Item Op Balance"
{
    Permissions = TableData TableData80004=rimd;

    fields
    {
        field(1;"Entry No.";Integer)
        {
        }
        field(2;"No.";Code[20])
        {
        }
        field(3;Location;Code[20])
        {
        }
        field(4;"Lot No.";Code[20])
        {
        }
        field(5;"Serial No.";Code[20])
        {
        }
        field(8;Quantity;Decimal)
        {
            DecimalPlaces = 0:5;
        }
        field(9;"Unit Cost";Decimal)
        {
        }
        field(10;"Posting Date";Date)
        {
        }
        field(11;UOM;Code[10])
        {
        }
        field(12;"Document Date";Date)
        {
        }
        field(13;"Document No.";Code[20])
        {
        }
        field(14;"Line No";Integer)
        {
        }
        field(15;"Entry Type";Option)
        {
            OptionCaption = 'Purchase,Sale,Positive Adjmt.,Negative Adjmt.,Transfer,Consumption,Output';
            OptionMembers = Purchase,Sale,"Positive Adjmt.","Negative Adjmt.",Transfer,Consumption,Output;
        }
        field(16;"New Location";Code[20])
        {
        }
        field(17;"New Lot No.";Code[20])
        {
        }
        field(18;"New Serial No.";Code[20])
        {
        }
        field(19;Inserted;Boolean)
        {
        }
        field(20;"Error Text";Text[250])
        {
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
        }
        key(Key2;"No.")
        {
        }
    }

    fieldgroups
    {
    }
}

