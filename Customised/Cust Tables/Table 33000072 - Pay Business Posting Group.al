table 33000072 "Pay Business Posting Group"
{
    // version NEOGYNPAY13.70.00.07

    DrillDownPageID = 33000165;
    LookupPageID = 33000165;

    fields
    {
        field(1;"Code";Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2;Description;Text[50])
        {
            Caption = 'Description';
        }
        field(3;"Auto Insert Default";Boolean)
        {
            Caption = 'Auto Insert Default';
            InitValue = true;
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

    trigger OnDelete();
    begin
        /*
        IF WebSite.FIND('-') THEN
          SynchMgt.DeleteGenBusPostGroup(Rec);
        */

    end;

    trigger OnInsert();
    begin
        /*
        IF WebSite.FIND('-') THEN
          SynchMgt.InsertGenBusPostGroup(Rec);
        */

    end;

    trigger OnModify();
    begin
        /*
        IF WebSite.FIND('-') THEN
          SynchMgt.ModifyGenBusPostGroup(Rec,xRec);
        */

    end;

    trigger OnRename();
    begin
        /*
        IF WebSite.FIND('-') THEN
          SynchMgt.RenameGenBusPostGroup(Rec,xRec);
        */

    end;
}

