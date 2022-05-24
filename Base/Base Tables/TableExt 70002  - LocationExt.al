tableextension 70002 LocationExt extends Location
{
    fields
    {

        field(50500; "User Name"; Text[250])
        {
            Caption = 'User Name';
            Description = 'E-INV';
        }
        field(50501; Password; Text[250])
        {
            Caption = 'Password';
            Description = 'E-INV';
        }
        field(60001; "QC Enabled Location"; Boolean)
        {
            Description = 'B2B';
        }
        field(60002; Stores; Option)
        {
            OptionMembers = STR,"CS STR","RD STR","PRD STR",SCRAP;
        }
        field(60010; "E-Way Bill User Name"; Text[250])
        {
            Caption = 'User Name';
            DataClassification = ToBeClassified;
        }
        field(60011; "E-Way Bill Password"; Text[250])
        {
            Caption = 'Password';
            DataClassification = ToBeClassified;
        }
    }





}

