table 33000917 "Product Model"
{

    fields
    {
        field(1;Product;Code[20])
        {
        }
        field(2;Model;Code[20])
        {
        }
        field(3;"CS IGC";Code[50])
        {
        }
        field(4;Module;Code[50])
        {
        }
        field(5;"Sub-Module";Code[50])
        {
        }
        field(6;Module1;Code[50])
        {
        }
        field(7;"Sub-Module1";Code[50])
        {
        }
        field(8;"Item Number";Code[50])
        {
            Description = 'added by Vishnu for analysis purpose on 01-11-2019';
        }
        field(9;Active;Boolean)
        {
            Description = 'added by Vishnu for analysis purpose on 01-11-2019';
        }
    }

    keys
    {
        key(Key1;Product,Model,"CS IGC",Module,"Sub-Module","Item Number")
        {
        }
    }

    fieldgroups
    {
    }
}

