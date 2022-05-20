table 33000271 "Acceptance Level"
{
    // version QC1.0

    LookupPageID = "Acceptance Levels";

    fields
    {
        field(1;"Code";Code[20])
        {
            NotBlank = true;
        }
        field(2;Description;Text[30])
        {
        }
        field(3;"Reason Code";Code[20])
        {
            TableRelation = "Quality Reason Code";
        }
        field(4;"Vendor Rating";Decimal)
        {
        }
        field(5;Type;Option)
        {
            OptionCaption = 'Accepted,Accepted Under Deviation,Rework,Rejected';
            OptionMembers = Accepted,"Accepted Under Deviation",Rework,Rejected;
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

