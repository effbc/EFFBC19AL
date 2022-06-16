pageextension 70000 AccountScheduleExt extends "Account Schedule"
{
    layout
    {
        /* modify(Control1)
          {
             ShowCaption = false;
            
          } */
        addafter("Totaling Type")
        {
            field("Dimension 1 Filter"; "Dimension 1 Filter")
            {
                ApplicationArea = All;
            }
            field("Dimension 2 Filter"; "Dimension 2 Filter")
            {
                ApplicationArea = All;
            }
            field("Dimension 3 Filter"; "Dimension 3 Filter")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        modify(Overview)
        {
            Promoted = true;
            PromotedIsBig = true;
        }
        modify(Print)
        {
            Promoted = true;
        }
    }
}

