pageextension 70234 TaxEntriesExt extends "Tax Entries"
{
    // version NAVIN7.00

    layout
    {


        modify("Control 1")
        {


            ShowCaption = false;
        }



        modify("Control 58")
        {
            Visible = false;
        }
        addafter("Control 16")
        {
            field("Account No."; "Account No.")
            {
            }
            field("Tax Group Code"; "Tax Group Code")
            {
            }
        }
    }
    actions
    {



        modify("Action 1280049")
        {
            Promoted = true;



        }
    }




}
