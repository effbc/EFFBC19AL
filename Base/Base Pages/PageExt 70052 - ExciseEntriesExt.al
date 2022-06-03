pageextension 70052 ExciseEntriesExt extends "Excise Entries"
{


    layout
    {


        modify("Control 1")
        {



            ShowCaption = false;
        }


        addfirst("Control 1")
        {
            field("Item No."; "Item No.")
            {
                Editable = true;
            }
        }
    }
    actions
    {


        modify("&Navigate")
        {
            Promoted = true;


        }
    }



}

