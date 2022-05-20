pageextension 70024 CapacityLedgerEntriesExt extends "Capacity Ledger Entries"
{
    // version NAVW19.00.00.45778

    layout
    {

        //Unsupported feature: Change Name on "Control 1900000001". Please convert manually.

        modify("Control 1")
        {

            //Unsupported feature: Change Name on "Control 1". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change Name on "Control 6". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 3". Please convert manually.


        //Unsupported feature: Change Editable on "Control 3". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 3". Please convert manually.


        //Unsupported feature: Change Name on "Control 2". Please convert manually.


        //Unsupported feature: Change Editable on "Control 2". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 2". Please convert manually.


        //Unsupported feature: Change Name on "Control 19". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 19". Please convert manually.


        //Unsupported feature: Change Name on "Control 60". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 60". Please convert manually.


        //Unsupported feature: Change Name on "Control 58". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 58". Please convert manually.


        //Unsupported feature: Change Name on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 12". Please convert manually.

        modify("Control 14")
        {

            //Unsupported feature: Change Name on "Control 14". Please convert manually.

            Enabled = TRUE;

            //Unsupported feature: Change Editable on "Control 14". Please convert manually.


            //Unsupported feature: Change ImplicitType on "Control 14". Please convert manually.

        }

        //Unsupported feature: Change Name on "Control 10". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 10". Please convert manually.


        //Unsupported feature: Change Name on "Control 4". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 4". Please convert manually.


        //Unsupported feature: Change Name on "Control 24". Please convert manually.


        //Unsupported feature: Change Name on "Control 24". Please convert manually.


        //Unsupported feature: Change Name on "Control 71". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 71". Please convert manually.


        //Unsupported feature: Change Name on "Control 16". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 16". Please convert manually.


        //Unsupported feature: Change Name on "Control 49". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 49". Please convert manually.


        //Unsupported feature: Change Name on "Control 33". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 33". Please convert manually.


        //Unsupported feature: Change Name on "Control 35". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 35". Please convert manually.


        //Unsupported feature: Change Name on "Control 37". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 37". Please convert manually.


        //Unsupported feature: Change Name on "Control 20". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 20". Please convert manually.


        //Unsupported feature: Change Name on "Control 22". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 22". Please convert manually.


        //Unsupported feature: Change Name on "Control 63". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 63". Please convert manually.


        //Unsupported feature: Change Name on "Control 26". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 26". Please convert manually.


        //Unsupported feature: Change Name on "Control 28". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 28". Please convert manually.


        //Unsupported feature: Change Name on "Control 51". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 51". Please convert manually.


        //Unsupported feature: Change Name on "Control 53". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 53". Please convert manually.


        //Unsupported feature: Change Name on "Control 67". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 67". Please convert manually.


        //Unsupported feature: Change Name on "Control 69". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 69". Please convert manually.


        //Unsupported feature: Change Name on "Control 9". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 9". Please convert manually.


        //Unsupported feature: Change Name on "Control 56". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 56". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900000007". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900383207". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905767507". Please convert manually.

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
        addafter("Control 19")
        {
            field("Reworked User Id"; "Reworked User Id")
            {
            }
            field("Direct Cost"; "Direct Cost")
            {
            }
            field("Overhead Cost"; "Overhead Cost")
            {
            }
            field("Direct Cost (ACY)"; "Direct Cost (ACY)")
            {
            }
            field("Overhead Cost (ACY)"; "Overhead Cost (ACY)")
            {
            }
        }
        addafter("Control 14")
        {
            field("Reason Code"; "Reason Code")
            {
            }
        }
        addafter("Control 4")
        {
            field("Operation Description"; "Operation Description")
            {
            }
            field("Order Line No."; "Order Line No.")
            {
                Editable = true;
            }
            field("Planed Setup Time"; "Planed Setup Time")
            {
            }
            field("Planed Run Time"; "Planed Run Time")
            {
            }
            field("Planed Wait Time"; "Planed Wait Time")
            {
            }
            field("Planed Move Time"; "Planed Move Time")
            {
            }
        }
        addafter("Control 49")
        {
            field("Internal Rework"; "Internal Rework")
            {
            }
            field("QC Rework"; "QC Rework")
            {
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000003". Please convert manually.


        //Unsupported feature: Change Name on "Action 41". Please convert manually.


        //Unsupported feature: Change AccessByPermission on "Action 42". Please convert manually.


        //Unsupported feature: Change Name on "Action 42". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 55". Please convert manually.


        //Unsupported feature: Change Name on "Action 55". Please convert manually.


        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.

        modify("Action 8")
        {
            Promoted = true;

            //Unsupported feature: Change Name on "Action 8". Please convert manually.

        }
    }


    //Unsupported feature: PropertyModification on "Action 8.OnAction.Navigate(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Action 8.OnAction.Navigate : 344;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Action 8.OnAction.Navigate : Navigate;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GetCaption(PROCEDURE 3).ObjTransl(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GetCaption : 377;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GetCaption : "Object Translation";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GetCaption(PROCEDURE 3).WorkCenter(Variable 1004)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GetCaption : 99000754;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GetCaption : "Work Center";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GetCaption(PROCEDURE 3).MachineCenter(Variable 1005)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GetCaption : 99000758;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GetCaption : "Machine Center";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GetCaption(PROCEDURE 3).ProdOrder(Variable 1006)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GetCaption : 5405;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GetCaption : "Production Order";
    //Variable type has not been exported.

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

