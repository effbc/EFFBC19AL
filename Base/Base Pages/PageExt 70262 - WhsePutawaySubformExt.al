pageextension 70262 WhsePutawaySubformExt extends "Whse. Put-away Subform"
{
   

    layout
    {



        /* modify("Control1")
         {


             ShowCaption = false;
         }*/


        addafter("Control 30")
        {
            field("Quantity Accepted"; Rec."Quantity Accepted")
            {
            }
            field("Quantity Rework"; Rec."Quantity Rework")
            {
            }
            field("Quantity Rejected"; Rec."Quantity Rejected")
            {
            }
        }
    }
    actions
    {


    }



}

