table 102150 "Compare Tool Setup"
{
    // version W11.20,Rev01

    DrillDownPageID = 102152;
    LookupPageID = 102152;

    fields
    {
        field(1;"User ID";Code[50])
        {
            Description = 'Rev01';
            TableRelation = User;
        }
        field(2;"Open File Command";Text[50])
        {
        }
        field(3;"OS Command";Text[50])
        {
        }
        field(4;"Combined File Name";Text[50])
        {
            InitValue = '%1\1.TXT';
        }
        field(5;"List File Name";Text[50])
        {
            InitValue = '%1\2.TXT';
        }
        field(6;"Log File Name";Text[50])
        {
            InitValue = 'LOG.TXT';
        }
        field(7;"Source Folder";Text[50])
        {
            InitValue = '%1\SOURCE';
        }
        field(8;"Target Folder";Text[50])
        {
            InitValue = '%1\TARGET';
        }
        field(10;"Show Only Differences";Boolean)
        {
        }
        field(11;"Delete Unmodified Files";Boolean)
        {
        }
        field(12;"Reversed Compare";Boolean)
        {
        }
        field(13;"No. of Matching Lines";Integer)
        {
            InitValue = 2;
            MinValue = 0;
        }
    }

    keys
    {
        key(Key1;"User ID")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        if "User ID" <> '' then
          if FileSetup.Get then begin
            FileSetup."User ID" := "User ID";
            Rec := FileSetup;
          end;
    end;

    var
        FileSetup : Record "Compare Tool Setup";

    [LineStart(5845)]
    procedure MakeRecord();
    begin
        if not Get(UserId) then
          if not Get then begin
            Init;
            Insert;
            Commit;
          end;
    end;
}

