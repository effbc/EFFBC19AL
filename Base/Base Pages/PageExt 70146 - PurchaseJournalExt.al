pageextension 70146 PurchaseJournalExt extends "Purchase Journal"
{
    

    layout
    {

       
        modify("Control 28")
        {

          

            ShowCaption = false;
        }
        modify("Control 1902205001")
        {

           

            ShowCaption = false;
        }

      
        modify("Control 1000")
        {
            Visible = false;
        }
        modify("Control 1001")
        {
            Visible = false;
        }
        addafter("Control 6")
        {
            field("Excise Charge"; "Excise Charge")
            {
            }
            field("Form Code"; "Form Code")
            {
            }
            field("Form No."; "Form No.")
            {
            }
            field("Tax %"; "Tax %")
            {
            }
        }
        {
            field("Debit Amount"; "Debit Amount")
            {
            }
            field("Credit Amount"; "Credit Amount")
            {
            }
        }
        addafter("Control 1902759701")
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

      

        modify("Action 68")
        {


            Promoted = true;

          
        }

      
        modify("Action 43")
        {

            
            Promoted = false;

           
        }

        
        modify("Action 97")
        {

           
            Promoted = true;

            
        }

       
        modify("Action 1500040")
        {
            Promoted = true;
            PromotedIsBig = true;

           
        }
        modify("Update Reference Invoice No")
        {
            Promoted = true;
        }

     

        modify(Post)
        {
            Promoted = true;
            PromotedIsBig = true;
        }
        modify("Action 49")
        {
            Promoted = true;
            PromotedIsBig = true;

           
        }

      
        modify(Approve)
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
        }
    }


  

}

