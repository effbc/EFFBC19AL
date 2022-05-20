table 60023 Make
{
    LookupPageID = Make;

    fields
    {
        field(1;Make;Code[30])
        {
        }
        field(2;"Created By";Code[50])
        {
        }
        field(3;"Entry Date Time";DateTime)
        {
        }
        field(4;Blocked;Boolean)
        {
            Description = 'Pranavi';
        }
        field(5;"Vendors Link";Text[250])
        {
            ExtendedDatatype = URL;
        }
    }

    keys
    {
        key(Key1;Make)
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        "Created By":=UserId;
        "Entry Date Time":=CurrentDateTime;
    end;
}

