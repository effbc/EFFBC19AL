pageextension 70127 PostedTransferReceiptExt extends "Posted Transfer Receipt"
{


    layout
    {



        modify("Transfer-from Post Code")
        {


            CaptionML = ENU = 'Transfer-from Post Code/City';

        }



        modify("Transfer-to Post Code")
        {



            CaptionML = ENU = 'Transfer-to Post Code/City';



        }



        addafter("Control 1280000")
        {
            field("Required Date"; Rec."Required Date")
            {
                Editable = false;
            }
            field("User ID"; Rec."User ID")
            {
            }
        }
        addafter("Control 1500001")
        {
            field("Resource Name"; Rec."Resource Name")
            {
            }
            field("Prod. Order No."; Rec."Prod. Order No.")
            {
                Editable = false;
            }
            field("Prod. Order Line No."; Rec."Prod. Order Line No.")
            {
                Editable = false;
            }
            field("Operation No."; Rec."Operation No.")
            {
                Editable = false;
            }
        }
        addafter("Shipping Agent Code")
        {
            field("Due Date"; Rec."Due Date")
            {
                Editable = false;
            }
        }
        addafter("Receipt Date")
        {
            field("<Shortcut Dimension 1 Code2>"; Rec."Shortcut Dimension 1 Code")
            {
                Editable = false;
            }
            field("<Shortcut Dimension 2 Code2>"; Rec."Shortcut Dimension 2 Code")
            {
                Editable = false;
            }
        }
    }
    actions
    {


        modify("Action 56")
        {



            Promoted = true;



        }

        modify("Action 51")
        {



            Promoted = true;



        }
        modify("Action 52")
        {
            Promoted = true;



        }
    }



}

