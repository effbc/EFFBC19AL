pageextension 70238 TDSAdjustmentJournalExt extends "TDS Adjustment Journal"
{


    layout
    {



        modify("Control 30")
        {


            ShowCaption = false;
        }




        addafter("Control 30")
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


        modify(Post)
        {
            Promoted = true;
            PromotedIsBig = true;
        }
    }




}

