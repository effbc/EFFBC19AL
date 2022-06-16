pageextension 70211 ServiceListExt extends "Service List"
{


    layout
    {


        /* modify("Control1")
         {



             ShowCaption = false;
         }*/


        addafter(Name)
        {
            field("Posting Date"; "Posting Date")
            {
                ApplicationArea = All;
            }
        }
        addafter("Control1")
        {
            field("xRec.COUNT"; xRec.COUNT)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {



    }




}

