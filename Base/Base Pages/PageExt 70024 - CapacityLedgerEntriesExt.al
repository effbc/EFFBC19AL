pageextension 70024 CapacityLedgerEntriesExt extends 5832
{

    layout
    {
        /* modify("Control1")
        {


            ShowCaption = false;
        }*/
        modify("No.")
        {
            Enabled = TRUE;
        }
        modify(Quantity)
        {
            Visible = false;
        }
        addafter("Routing No.")
        {
            field("Reworked User Id"; Rec."Reworked User Id")
            {
                ApplicationArea = All;
            }
        }
        addafter("No.")
        {
            field("Reason Code"; Rec."Reason Code")
            {
                ApplicationArea = All;
            }
        }
        addafter("Operation No.")
        {
            field("Operation Description"; Rec."Operation Description")
            {
                ApplicationArea = All;
            }
            field("Order Line No."; Rec."Order Line No.")
            {
                Editable = true;
                ApplicationArea = All;
            }
            field("Planed Setup Time"; Rec."Planed Setup Time")
            {
                ApplicationArea = All;
            }
            field("Planed Run Time"; Rec."Planed Run Time")
            {
                ApplicationArea = All;
            }
            field("Planed Wait Time"; Rec."Planed Wait Time")
            {
                ApplicationArea = All;
            }
            field("Planed Move Time"; Rec."Planed Move Time")
            {
                ApplicationArea = All;
            }
        }
        addafter("Work Shift Code")
        {
            field("Internal Rework"; Rec."Internal Rework")
            {
                ApplicationArea = All;
            }
            field("QC Rework"; Rec."QC Rework")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {


        modify("&Navigate")
        {
            Promoted = true;


        }
    }



}