table 14125601 "Quote LookUp Type"
{
    // version B2BQTO

    DrillDownPageID = "Quote LookUp Types";
    LookupPageID = "Quote LookUp Types";

    fields
    {
        field(1;ID;Integer)
        {
            Caption = 'ID';
        }
        field(2;Name;Code[50])
        {
            Caption = 'Name';
        }
        field(4;Description;Text[250])
        {
            Caption = 'Description';
        }
        field(5;"System Defined";Boolean)
        {
            Caption = 'System Defined';
        }
    }

    keys
    {
        key(Key1;ID)
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        if "System Defined" then
          Error(Text000);
    end;

    trigger OnModify();
    begin
        if "System Defined" then
          Error(Text000);
    end;

    trigger OnRename();
    begin
        if "System Defined" then
          Error(Text000);
    end;

    var
        Text000 : Label 'You cannot modify or delete the system defined records.';
}

