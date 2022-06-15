pageextension 70024 CapacityLedgerEntriesExt extends 5832
{
   

    layout
    {

       

        modify("Control1")
        {

           
            ShowCaption = false;
        }

        
        modify("No.")
        {

            

            Enabled = TRUE;

            
        }

       
        modify("Control 65")
        {
            Visible = false;
        }
        modify("Control 39")
        {
            Visible = false;
        }
        modify("Control 43")
        {
            Visible = false;
        }
        modify("Control 45")
        {
            Visible = false;
        }
        modify("Control 47")
        {
            Visible = false;
        }
        addafter("Routing No.")
        {
            field("Reworked User Id"; Rec."Reworked User Id")
            {
            }
            field("Direct Cost"; Rec."Direct Cost")
            {
            }
            field("Overhead Cost"; Rec."Overhead Cost")
            {
            }
            field("Direct Cost (ACY)"; Rec."Direct Cost (ACY)")
            {
            }
            field("Overhead Cost (ACY)"; Rec."Overhead Cost (ACY)")
            {
            }
        }
        addafter("No.")
        {
            field("Reason Code"; Rec."Reason Code")
            {
            }
        }
        addafter("Operation No.")
        {
            field("Operation Description"; Rec."Operation Description")
            {
            }
            field("Order Line No."; Rec."Order Line No.")
            {
                Editable = true;
            }
            field("Planed Setup Time"; Rec."Planed Setup Time")
            {
            }
            field("Planed Run Time"; Rec."Planed Run Time")
            {
            }
            field("Planed Wait Time"; Rec."Planed Wait Time")
            {
            }
            field("Planed Move Time"; Rec."Planed Move Time")
            {
            }
        }
        addafter("Work Shift Code")
        {
            field("Internal Rework"; Rec."Internal Rework")
            {
            }
            field("QC Rework"; Rec."QC Rework")
            {
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

