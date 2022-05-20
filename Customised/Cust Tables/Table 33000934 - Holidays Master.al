table 33000934 "Holidays Master"
{
    DrillDownPageID = Holidays;
    LookupPageID = Holidays;

    fields
    {
        field(1;"Date Of Holiday";Date)
        {
        }
        field(2;Reason;Text[50])
        {
        }
        field(3;"Holiday Type";Option)
        {
            OptionCaption = '" ,DECLARED,OPTIONAL,SELECTED,Sunday"';
            OptionMembers = " ",DECLARED,OPTIONAL,SELECTED,Sunday;
        }
        field(4;"Working Sunday";Boolean)
        {

            trigger OnValidate();
            begin
                TestField("Holiday Type","Holiday Type"::Sunday);

                if Date2DWY("Date Of Holiday",1) <> 7 then
                  Error('The date you selected is not sunday.');
            end;
        }
    }

    keys
    {
        key(Key1;"Date Of Holiday")
        {
        }
    }

    fieldgroups
    {
    }
}

