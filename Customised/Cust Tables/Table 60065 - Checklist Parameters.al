table 60065 "Checklist Parameters"
{
    // version B2B1.0

    LookupPageID = "To Be Released Indents";

    fields
    {
        field(1;"Document Type";Option)
        {
            OptionMembers = Purchase,Sales,Tender,Service;
        }
        field(2;Parameter;Code[20])
        {
        }
        field(3;Description;Text[100])
        {
        }
    }

    keys
    {
        key(Key1;"Document Type",Parameter)
        {
        }
    }

    fieldgroups
    {
    }
}

