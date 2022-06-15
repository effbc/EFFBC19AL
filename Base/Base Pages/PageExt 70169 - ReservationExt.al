pageextension 70169 ReservationExt extends Reservation
{
    // version NAVW19.00.00.47444

    layout
    {

        //Unsupported feature: Change Name on "Control 1900000001". Please convert manually.


        //Unsupported feature: Change Name on "Control 13". Please convert manually.


        //Unsupported feature: Change Name on "Control 41". Please convert manually.


        //Unsupported feature: Change Name on "Control 7". Please convert manually.


        //Unsupported feature: Change Name on "Control 25". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 25". Please convert manually.


        //Unsupported feature: Change Name on "Control 27". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 27". Please convert manually.

        modify("Control 1")
        {

            //Unsupported feature: Change Name on "Control 1". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change Name on "Control 22". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 22". Please convert manually.


        //Unsupported feature: Change BlankZero on ""Total Quantity"(Control 14)". Please convert manually.


        //Unsupported feature: Change BlankZero on "TotalReservedQuantity(Control 16)". Please convert manually.


        //Unsupported feature: Change BlankZero on "QtyAllocatedInWarehouse(Control 8)". Please convert manually.


        //Unsupported feature: Change BlankZero on "Control 3". Please convert manually.


        //Unsupported feature: Change Name on "Control 3". Please convert manually.


        //Unsupported feature: Change BlankZero on "TotalAvailableQuantity(Control 18)". Please convert manually.


        //Unsupported feature: Change Name on "Control 4". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 4". Please convert manually.


        //Unsupported feature: Change BlankZero on ""Current Reserved Quantity"(Control 20)". Please convert manually.


        //Unsupported feature: Change MultiLine on "NoteText(Control 38)". Please convert manually.


        //Unsupported feature: Change Name on "Control 1907524401". Please convert manually.


        //Unsupported feature: Change Name on "Control 46". Please convert manually.


        //Unsupported feature: Change Name on "Control 31". Please convert manually.


        //Unsupported feature: Change Name on "Control 50". Please convert manually.


        //Unsupported feature: Change Name on "Control 44". Please convert manually.

    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000003". Please convert manually.


        //Unsupported feature: Change Name on "Action 29". Please convert manually.

        modify(AvailableToReserve)
        {
            Promoted = true;
            PromotedIsBig = true;
        }
        modify("Action 34")
        {

            //Unsupported feature: Change AccessByPermission on "Action 34". Please convert manually.

            Promoted = true;
            PromotedIsBig = true;

            //Unsupported feature: Change Name on "Action 34". Please convert manually.

        }

        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.


        //Unsupported feature: Change Name on "Action 35". Please convert manually.

        modify("Auto Reserve")
        {
            Promoted = true;
            PromotedIsBig = true;
        }
        modify("Reserve from Current Line")
        {
            Promoted = true;
            PromotedIsBig = true;
        }
        modify(CancelReservationCurrentLine)
        {

            //Unsupported feature: Change AccessByPermission on "CancelReservationCurrentLine(Action 43)". Please convert manually.

            Promoted = true;
            PromotedIsBig = true;
        }
    }

    //Unsupported feature: PropertyModification on "CancelReservationCurrentLine(Action 43).OnAction.ReservEntry3(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CancelReservationCurrentLine : 337;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CancelReservationCurrentLine : "Reservation Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "UpdateReservFrom(PROCEDURE 12).EntrySummary(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //UpdateReservFrom : 338;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //UpdateReservFrom : "Entry Summary";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "DrillDownTotalQuantity(PROCEDURE 6).Location(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //DrillDownTotalQuantity : 14;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DrillDownTotalQuantity : Location;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "DrillDownTotalQuantity(PROCEDURE 6).CreatePick(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //DrillDownTotalQuantity : 7312;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DrillDownTotalQuantity : "Create Pick";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "DrillDownReservedThisLine(PROCEDURE 10).ReservEntry3(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //DrillDownReservedThisLine : 337;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DrillDownReservedThisLine : "Reservation Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ReservedThisLine(PROCEDURE 14).ReservEntry3(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ReservedThisLine : 337;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ReservedThisLine : "Reservation Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GetSerialLotNo(PROCEDURE 17).Item(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GetSerialLotNo : 27;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GetSerialLotNo : Item;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GetSerialLotNo(PROCEDURE 17).ReservEntry2(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GetSerialLotNo : 337;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GetSerialLotNo : "Reservation Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GetSerialLotNo(PROCEDURE 17).TempReservEntry(Variable 1003)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GetSerialLotNo : 337;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GetSerialLotNo : "Reservation Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GetSerialLotNo(PROCEDURE 17).TempTrackingSpecification(Variable 1005)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GetSerialLotNo : 336;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GetSerialLotNo : "Tracking Specification";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GetSerialLotNo(PROCEDURE 17).ItemTrackingMgt(Variable 1004)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GetSerialLotNo : 6500;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GetSerialLotNo : "Item Tracking Management";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ReservEntry(Variable 1005)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ReservEntry : 337;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ReservEntry : "Reservation Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ReservEntry2(Variable 1006)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ReservEntry2 : 337;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ReservEntry2 : "Reservation Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "SalesLine(Variable 1007)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SalesLine : 37;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SalesLine : "Sales Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "PurchLine(Variable 1008)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //PurchLine : 39;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PurchLine : "Purchase Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ItemJnlLine(Variable 1009)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ItemJnlLine : 83;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ItemJnlLine : "Item Journal Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ReqLine(Variable 1010)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ReqLine : 246;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ReqLine : "Requisition Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ProdOrderLine(Variable 1011)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ProdOrderLine : 5406;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ProdOrderLine : "Prod. Order Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ProdOrderComp(Variable 1012)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ProdOrderComp : 5407;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ProdOrderComp : "Prod. Order Component";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "AssemblyHeader(Variable 1052)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //AssemblyHeader : 900;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AssemblyHeader : "Assembly Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "AssemblyLine(Variable 1039)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //AssemblyLine : 901;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AssemblyLine : "Assembly Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "PlanningComponent(Variable 1013)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //PlanningComponent : 99000829;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PlanningComponent : "Planning Component";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ServiceLine(Variable 1014)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ServiceLine : 5902;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ServiceLine : "Service Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "TransLine(Variable 1015)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //TransLine : 5741;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TransLine : "Transfer Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "JobPlanningLine(Variable 1016)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //JobPlanningLine : 1003;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //JobPlanningLine : "Job Planning Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ReservMgt(Variable 1027)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ReservMgt : 99000845;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ReservMgt : "Reservation Management";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ReservEngineMgt(Variable 1028)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ReservEngineMgt : 99000831;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ReservEngineMgt : "Reservation Engine Mgt.";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ReserveSalesLine(Variable 1029)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ReserveSalesLine : 99000832;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ReserveSalesLine : "Sales Line-Reserve";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ReserveReqLine(Variable 1030)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ReserveReqLine : 99000833;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ReserveReqLine : "Req. Line-Reserve";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ReservePurchLine(Variable 1031)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ReservePurchLine : 99000834;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ReservePurchLine : "Purch. Line-Reserve";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ReserveItemJnlLine(Variable 1032)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ReserveItemJnlLine : 99000835;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ReserveItemJnlLine : "Item Jnl. Line-Reserve";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ReserveProdOrderLine(Variable 1033)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ReserveProdOrderLine : 99000837;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ReserveProdOrderLine : "Prod. Order Line-Reserve";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ReserveProdOrderComp(Variable 1034)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ReserveProdOrderComp : 99000838;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ReserveProdOrderComp : "Prod. Order Comp.-Reserve";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "AssemblyHeaderReserve(Variable 1060)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //AssemblyHeaderReserve : 925;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AssemblyHeaderReserve : "Assembly Header-Reserve";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "AssemblyLineReserve(Variable 1055)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //AssemblyLineReserve : 926;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AssemblyLineReserve : "Assembly Line-Reserve";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ReservePlanningComponent(Variable 1035)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ReservePlanningComponent : 99000840;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ReservePlanningComponent : "Plng. Component-Reserve";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ReserveServiceLine(Variable 1036)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ReserveServiceLine : 99000842;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ReserveServiceLine : "Service Line-Reserve";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ReserveTransLine(Variable 1037)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ReserveTransLine : 99000836;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ReserveTransLine : "Transfer Line-Reserve";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "JobPlanningLineReserve(Variable 1058)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //JobPlanningLineReserve : 1032;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //JobPlanningLineReserve : "Job Planning Line-Reserve";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CreateReservEntry(Variable 1038)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CreateReservEntry : 99000830;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CreateReservEntry : "Create Reserv. Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "AvailableSalesLines(Variable 1073)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //AvailableSalesLines : 499;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AvailableSalesLines : "Available - Sales Lines";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "AvailablePurchLines(Variable 1072)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //AvailablePurchLines : 501;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AvailablePurchLines : "Available - Purchase Lines";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "AvailableItemLedgEntries(Variable 1071)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //AvailableItemLedgEntries : 504;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AvailableItemLedgEntries : "Available - Item Ledg. Entries";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "AvailableReqLines(Variable 1070)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //AvailableReqLines : 500;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AvailableReqLines : "Available - Requisition Lines";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "AvailableProdOrderLines(Variable 1069)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //AvailableProdOrderLines : 99000897;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AvailableProdOrderLines : "Available - Prod. Order Lines";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "AvailableProdOrderComps(Variable 1068)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //AvailableProdOrderComps : 99000898;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AvailableProdOrderComps : "Available - Prod. Order Comp.";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "AvailablePlanningComponents(Variable 1067)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //AvailablePlanningComponents : 99000900;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AvailablePlanningComponents : "Avail. - Planning Components";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "AvailableServiceLines(Variable 1066)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //AvailableServiceLines : 5999;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AvailableServiceLines : "Available - Service Lines";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "AvailableTransLines(Variable 1065)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //AvailableTransLines : 99000896;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AvailableTransLines : "Available - Transfer Lines";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "AvailableItemTrackingLines(Variable 1064)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //AvailableItemTrackingLines : 6503;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AvailableItemTrackingLines : "Avail. - Item Tracking Lines";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "AvailableJobPlanningLines(Variable 1063)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //AvailableJobPlanningLines : 1032;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AvailableJobPlanningLines : "Available - Job Planning Lines";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "AvailableAssemblyHeaders(Variable 1046)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //AvailableAssemblyHeaders : 925;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AvailableAssemblyHeaders : "Available - Assembly Headers";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "AvailableAssemblyLines(Variable 1019)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //AvailableAssemblyLines : 926;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AvailableAssemblyLines : "Available - Assembly Lines";
    //Variable type has not been exported.


    //Unsupported feature: CodeModification on "SetItemJnlLine(PROCEDURE 4)". Please convert manually.

    //procedure SetItemJnlLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CurrentItemJnlLine.TESTFIELD("Drop Shipment",FALSE);
    CurrentItemJnlLine.TESTFIELD("Posting Date");

    #4..9

    ReservEntry."Item No." := ItemJnlLine."Item No.";
    ReservEntry."Variant Code" := ItemJnlLine."Variant Code";
    ReservEntry."Location Code" := ItemJnlLine."Location Code";
    ReservEntry."Shipment Date" := ItemJnlLine."Posting Date";

    CaptionText := ReserveItemJnlLine.Caption(ItemJnlLine);
    UpdateReservFrom;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..12
    MESSAGE(ItemJnlLine."Location Code");   // pranavi
    #13..17
    */
    //end;

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

