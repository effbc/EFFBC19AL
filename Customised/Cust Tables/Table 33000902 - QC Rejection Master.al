table 33000902 "QC Rejection Master"
{

    fields
    {
        field(1;"S.No";Integer)
        {
        }
        field(2;"Rejection Category";Option)
        {
            OptionMembers = ,Functional,"Item Wrong","Manufacturer Defect","Physical Damage","Non-Preferable Item","Quality Problem";
        }
        field(3;"Rejection Reason";Text[100])
        {
        }
    }

    keys
    {
        key(Key1;"S.No")
        {
        }
    }

    fieldgroups
    {
    }
}

