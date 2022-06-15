pageextension 70162 PurchaseReturnOrderSubformExt extends "Purchase Return Order Subform"
{


    layout
    {



        /*modify("Control1")
        {

           

            ShowCaption = false;
        }*/



        addafter("Non-GST Line")
        {
            field("QC Enabled"; Rec."QC Enabled")
            {
                ApplicationArea = All;
            }
            field("Spec ID"; Rec."Spec ID")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {


    }
}

