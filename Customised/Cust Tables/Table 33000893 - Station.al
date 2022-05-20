table 33000893 Station
{
    LookupPageID = Station;
    Permissions = TableData Station=rimd;

    fields
    {
        field(1;"Station Code";Code[20])
        {
        }
        field(2;"Division code";Code[10])
        {
            TableRelation = Division."Division Code";
        }
        field(3;"Station Name";Text[50])
        {
        }
        field(4;"Station Status";Option)
        {
            Editable = true;
            OptionMembers = " ",Up,Down;

            trigger OnValidate();
            begin
                         "Updation date time":=CurrentDateTime
            end;
        }
        field(5;"Updation date time";DateTime)
        {
            Editable = false;
        }
        field(6;Zone;Code[10])
        {
            TableRelation = Zones."Zone Code";
        }
        field(7;"SMS Mapped Status";Boolean)
        {
        }
        field(8;"Cumilative Division1";Text[30])
        {
        }
    }

    keys
    {
        key(Key1;"Station Code",Zone,"Division code","Cumilative Division1")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(KEYFIELDA;"Station Name","Station Code","Division code",Zone)
        {
        }
    }
}

