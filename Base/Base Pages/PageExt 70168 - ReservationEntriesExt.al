pageextension 70168 ReservationEntriesExt extends "Reservation Entries"
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

        //Unsupported feature: Change Editable on "Control 30". Please convert manually.


        //Unsupported feature: Change Name on "Control 30". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 30". Please convert manually.


        //Unsupported feature: Change Name on "Control 4". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 4". Please convert manually.


        //Unsupported feature: Change Name on "Control 47". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 47". Please convert manually.


        //Unsupported feature: Change Name on "Control 41". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 41". Please convert manually.


        //Unsupported feature: Change Name on "Control 58". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 58". Please convert manually.


        //Unsupported feature: Change Name on "Control 43". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 43". Please convert manually.


        //Unsupported feature: Change Name on "Control 44". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 44". Please convert manually.


        //Unsupported feature: Change Name on "Control 49". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 49". Please convert manually.


        //Unsupported feature: Change Name on "Control 26". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 26". Please convert manually.


        //Unsupported feature: Change Name on "Control 53". Please convert manually.


        //Unsupported feature: Change Name on "Control 34". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 34". Please convert manually.


        //Unsupported feature: Change Name on "Control 6". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 8". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 8". Please convert manually.


        //Unsupported feature: Change Name on "Control 10". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 10". Please convert manually.


        //Unsupported feature: Change Name on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 12". Please convert manually.


        //Unsupported feature: Change Name on "Control 14". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 14". Please convert manually.


        //Unsupported feature: Change Name on "Control 2". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 2". Please convert manually.


        //Unsupported feature: Change Name on "Control 32". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 32". Please convert manually.


        //Unsupported feature: Change Name on "Control 36". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 36". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900000007". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900383207". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905767507". Please convert manually.

        addafter("Control 49")
        {
            field(Quantity; Quantity)
            {
            }
        }
        addafter("Control 26")
        {
            field("Qty. per Unit of Measure"; "Qty. per Unit of Measure")
            {
            }
        }
        addafter("Control 36")
        {
            field("Item Ledger Entry No."; "Item Ledger Entry No.")
            {
                Editable = true;
            }
            field("Item Tracking"; "Item Tracking")
            {
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.


        //Unsupported feature: Change Name on "Action 61". Please convert manually.


        //Unsupported feature: Change AccessByPermission on "CancelReservation(Action 64)". Please convert manually.

    }


    //Unsupported feature: PropertyModification on "CancelReservation(Action 64).OnAction.ReservEntry(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CancelReservation : 337;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CancelReservation : "Reservation Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "LookupReservedFor(PROCEDURE 2).ReservEntry(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //LookupReservedFor : 337;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //LookupReservedFor : "Reservation Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "LookupReservedFrom(PROCEDURE 3).ReservEntry(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //LookupReservedFrom : 337;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //LookupReservedFrom : "Reservation Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "LookupReserved(PROCEDURE 1).SalesLine(Variable 1003)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //LookupReserved : 37;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //LookupReserved : "Sales Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "LookupReserved(PROCEDURE 1).ReqLine(Variable 1004)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //LookupReserved : 246;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //LookupReserved : "Requisition Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "LookupReserved(PROCEDURE 1).PurchLine(Variable 1005)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //LookupReserved : 39;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //LookupReserved : "Purchase Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "LookupReserved(PROCEDURE 1).ItemJnlLine(Variable 1006)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //LookupReserved : 83;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //LookupReserved : "Item Journal Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "LookupReserved(PROCEDURE 1).ItemLedgEntry(Variable 1008)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //LookupReserved : 32;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //LookupReserved : "Item Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "LookupReserved(PROCEDURE 1).ProdOrderLine(Variable 1009)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //LookupReserved : 5406;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //LookupReserved : "Prod. Order Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "LookupReserved(PROCEDURE 1).ProdOrderComp(Variable 1010)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //LookupReserved : 5407;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //LookupReserved : "Prod. Order Component";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "LookupReserved(PROCEDURE 1).PlanningComponent(Variable 1011)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //LookupReserved : 99000829;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //LookupReserved : "Planning Component";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "LookupReserved(PROCEDURE 1).ServLine(Variable 1012)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //LookupReserved : 5902;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //LookupReserved : "Service Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "LookupReserved(PROCEDURE 1).JobPlanningLine(Variable 1016)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //LookupReserved : 1003;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //LookupReserved : "Job Planning Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "LookupReserved(PROCEDURE 1).TransLine(Variable 1013)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //LookupReserved : 5741;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //LookupReserved : "Transfer Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "LookupReserved(PROCEDURE 1).AssemblyHeader(Variable 1017)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //LookupReserved : 900;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //LookupReserved : "Assembly Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "LookupReserved(PROCEDURE 1).AssemblyLine(Variable 1018)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //LookupReserved : 901;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //LookupReserved : "Assembly Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ReservEngineMgt(Variable 1015)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ReservEngineMgt : 99000831;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ReservEngineMgt : "Reservation Engine Mgt.";
    //Variable type has not been exported.

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

