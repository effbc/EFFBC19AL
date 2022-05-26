tableextension 70101 TroubleshootingSetupExt extends "Troubleshooting Setup"
{
    fields
    {
        field(60000; "Line No."; Integer)
        {
            Description = 'b2b EFF';
        }
        field(60001; Comment; Text[80])
        {
            Description = 'b2b EFF';
        }
        field(60002; Date; Date)
        {
            Description = 'Editable=Yes';
        }
        field(60003; "Service Order No"; Code[20])
        {
            TableRelation = "Service Header"."No." WHERE("Document Type" = CONST(Order));
        }
    }
    keys
    {
        /* key(Key3; Type, "No.", Date, "Troubleshooting No.", Comment)
        {
        } */
    }

}

