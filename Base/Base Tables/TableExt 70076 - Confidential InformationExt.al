tableextension 70076 ConfidentialInformationExt extends "Confidential Information"
{
    fields
    {
        modify("Employee No.")
        {
            Caption = 'Station Code';
        }
        modify("Confidential Code")
        {
            Caption = 'Division Code';
            //TableRelation=Division."Division Code";
        }

    }
    keys
    {

        //Unsupported feature: Deletion on ""Employee No.,Confidential Code,Line No."(Key)". Please convert manually.

        /* key(Key1; "Station Code", "Division  Code")
        {
        } */
    }



}

