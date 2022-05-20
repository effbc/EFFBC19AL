table 14125606 "Customer/Contact Data Archive"
{
    // version B2BQTO

    Caption = 'Customer/Contact Data Archive';

    fields
    {
        field(1;"No.";Integer)
        {
        }
        field(2;"Sales Quote No.";Code[20])
        {
        }
        field(3;"Customer\Contact";Code[20])
        {
        }
        field(4;"Phone No.";Integer)
        {
        }
        field(5;"Mail Send";Boolean)
        {
        }
        field(6;Name;Text[50])
        {
        }
        field(7;Degisnation;Text[50])
        {
        }
        field(8;Place;Text[50])
        {
        }
        field(9;Zone;Text[50])
        {
        }
        field(11;"Email Id";Text[250])
        {
        }
        field(12;Type;Option)
        {
            OptionCaption = 'Customer,Contact';
            OptionMembers = Customer,Contact;
        }
        field(13;"Version No.";Integer)
        {
        }
    }

    keys
    {
        key(Key1;"No.","Sales Quote No.","Customer\Contact","Version No.")
        {
        }
    }

    fieldgroups
    {
    }
}

