pageextension 70151 PurchaseOrderArchivesExt extends "Purchase Order Archives"
{

    layout
    {

        addbefore("Posting Date")
        {
            field("Cancel / Short Close"; Rec."Cancel / Short Close"
            )
            {

            }
        }


    }
    actions
    {


    }

    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        Reset();
    end;

}

