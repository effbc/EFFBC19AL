pageextension 70130 PostedTransferShipmentsExt extends "Posted Transfer Shipments"
{

    layout
    {



        /* modify("Control1")
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
            field("External Document No."; Rec."External Document No.")
            {
            }
            field("User ID"; Rec."User ID")
            {
            }
            field("Required Date"; Rec."Required Date")
            {
            }
            field("Due Date"; Rec."Due Date")
            {
            }
            field("Operation No."; Rec."Operation No.")
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

