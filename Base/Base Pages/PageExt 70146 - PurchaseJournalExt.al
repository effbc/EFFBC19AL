pageextension 70146 PurchaseJournalExt extends "Purchase Journal"
{


    layout
    {


        /*   modify("Control28")
           {



               ShowCaption = false;
           }
           modify("Control1902205001")
           {



               ShowCaption = false;
           }*/


        /*modify("Control 1000")
        {
            Visible = false;
        }
        modify("Control 1001")
        {
            Visible = false;
        }*/
        addafter("Document No.")
        {
            field("Excise Charge"; Rec."Excise Charge")
            {
            }
            field("Form Code"; Rec."Form Code")
            {
            }
            field("Form No."; Rec."Form No.")
            {
            }
            field("Tax %"; Rec."Tax %")
            {
            }
        }

        addafter("Total Balance")
        {
            group("Work Date")
            {
                Caption = 'Work Date';
                field(WorkDate; WORKDATE)
                {
                    Editable = false;
                }
            }
        }
    }
    actions
    {



        modify(Dimensions)
        {


            Promoted = true;


        }


        modify("Ledger E&ntries")
        {


            Promoted = false;


        }


        modify("Apply Entries")
        {


            Promoted = true;


        }


        /* modify("Action 1500040")
         {
             Promoted = true;
             PromotedIsBig = true;


         }*/
        /* modify("Update Reference Invoice No")
         {
             Promoted = true;
         }*/



        modify(Post)
        {
            Promoted = true;
            PromotedIsBig = true;
        }
        modify("Post and &Print")
        {
            Promoted = true;
            PromotedIsBig = true;


        }


        /*modify(Approve)
        {
            Promoted = true;
            PromotedIsBig = true;
        }
        modify(Reject)
        {
            Promoted = true;
            PromotedIsBig = true;
        }
        modify(Delegate)
        {
            Promoted = true;
        }
        modify(Comment)
        {


            Promoted = true;
        }*/
    }




}

