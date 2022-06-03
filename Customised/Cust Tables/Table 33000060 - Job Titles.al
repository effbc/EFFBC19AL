table 33000060 "Job Titles"
{
    // version NEOGYNPAY13.70.00.06

    LookupPageID = 33000140;
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Job Code"; Code[40])
        {
            NotBlank = true;
            DataClassification = CustomerContent;
        }
        field(2; Description; Text[40])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Job Code")
        {
        }
    }

    fieldgroups
    {
    }
}

