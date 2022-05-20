table 33000268 "Quality Reason Code"
{
    // version QC1.0

    LookupPageID = "Quality Reason Codes";

    fields
    {
        field(1;"Code";Code[20])
        {
            NotBlank = true;
        }
        field(2;Description;Text[30])
        {
        }
    }

    keys
    {
        key(Key1;"Code")
        {
        }
    }

    fieldgroups
    {
    }
}

