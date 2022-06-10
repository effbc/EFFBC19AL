pageextension 70128 PostedTransferReceiptsExt extends "Posted Transfer Receipts"
{

    layout
    {



        /*modify("Control1")
        {

            
            ShowCaption = false;
        }*/


        addafter("Transfer-to Code")
        {
            field("Prod. Order No."; Rec."Prod. Order No.")
            {
            }
            field("Prod. Order Line No."; Rec."Prod. Order Line No.")
            {
            }
            field("Machine Center No."; Rec."Machine Center No.")
            {
                Caption = 'Resource';
            }
            field("User ID"; Rec."User ID")
            {
            }
            field("Due Date"; Rec."Due Date")
            {
            }
            field("Required Date"; Rec."Required Date")
            {
            }
        }
    }
    actions
    {


        modify(Statistics)
        {


            Promoted = true;

        }


        modify("&Print")
        {


            Promoted = true;


        }
        modify("&Navigate")
        {
            Promoted = true;



        }
    }



}

