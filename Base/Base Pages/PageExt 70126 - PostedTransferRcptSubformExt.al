pageextension 70126 PostedTransferRcptSubformExt extends "Posted Transfer Rcpt. Subform"
{
    // version NAVW19.00.00.48822,NAVIN9.00.00.48822,B2B1.0

    layout
    {

        /* modify("Control1")
         {



             ShowCaption = false;
         }*/

        addafter("Variant Code")
        {
            field("Line No."; Rec."Line No.")
            {
                ApplicationArea = All;
            }
        }
        addafter(Description)
        {
            field("Reason Code"; Rec."Reason Code")
            {
                ApplicationArea = All;
            }
            field("Position Reference No."; Rec."Position Reference No.")
            {
                ApplicationArea = All;
            }
        }
        addafter("Control 1500020")
        {
            field("Allow Excess Qty."; Rec."Allow Excess Qty.")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {


    }




    var
        StrOrderLineDetailsPage: Page "Posted Str Order Line Details";

    /* procedure StrOrderLineDetailsPage();
     begin
     end;*/




}

