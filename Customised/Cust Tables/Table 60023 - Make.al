table 60023 Make
{
    LookupPageID = Make;
    DataClassification = CustomerContent;

    fields
    {
        field(1; Make; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(2; "Created By"; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(3; "Entry Date Time"; DateTime)
        {
            DataClassification = CustomerContent;
        }
        field(4; Blocked; Boolean)
        {
            Description = 'Pranavi';
            DataClassification = CustomerContent;
        }
        field(5; "Vendors Link"; Text[250])
        {
            ExtendedDatatype = URL;
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; Make)
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        "Created By" := UserId;
        "Entry Date Time" := CurrentDateTime;
    end;
}

