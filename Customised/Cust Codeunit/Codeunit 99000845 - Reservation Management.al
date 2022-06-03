codeunit 99000845 "Reservation Management"
{
    // version NAVW19.00.00.48822,NAVIN9.00.00.48822,B2B10

    Permissions = TableData "Item Ledger Entry" = rm,
                  TableData "Reservation Entry" = rimd,
                  TableData "Action Message Entry" = rimd;

    trigger OnRun();
    begin
    end;

    var
        Text000: TextConst ENU = 'Firm Planned %1', ENN = 'Firm Planned %1';
        Text001: TextConst ENU = 'Released %1', ENN = 'Released %1';
        Text003: TextConst ENU = 'CU99000845: CalculateRemainingQty - Source type missing', ENN = 'CU99000845: CalculateRemainingQty - Source type missing';
        Text004: TextConst ENU = 'Codeunit 99000845: Illegal FieldFilter parameter', ENN = 'Codeunit 99000845: Illegal FieldFilter parameter';
        Text006: TextConst ENU = 'Outbound,Inbound', ENN = 'Outbound,Inbound';
        Text007: TextConst ENU = 'CU99000845 DeleteReservEntries2: Surplus order tracking double record detected.', ENN = 'CU99000845 DeleteReservEntries2: Surplus order tracking double record detected.';
        CalcReservEntry: Record "Reservation Entry";
        CalcReservEntry2: Record "Reservation Entry";
        ForItemLedgEntry: Record "Item Ledger Entry";
        CalcItemLedgEntry: Record "Item Ledger Entry";
        ForSalesLine: Record "Sales Line";
        CalcSalesLine: Record "Sales Line";
        ForPurchLine: Record "Purchase Line";
        CalcPurchLine: Record "Purchase Line";
        ForItemJnlLine: Record "Item Journal Line";
        ForReqLine: Record "Requisition Line";
        CalcReqLine: Record "Requisition Line";
        ForProdOrderLine: Record "Prod. Order Line";
        CalcProdOrderLine: Record "Prod. Order Line";
        ForProdOrderComp: Record "Prod. Order Component";
        CalcProdOrderComp: Record "Prod. Order Component";
        ForPlanningComponent: Record "Planning Component";
        CalcPlanningComponent: Record "Planning Component";
        ForAssemblyHeader: Record "Assembly Header";
        CalcAssemblyHeader: Record "Assembly Header";
        ForAssemblyLine: Record "Assembly Line";
        CalcAssemblyLine: Record "Assembly Line";
        ForTransLine: Record "Transfer Line";
        CalcTransLine: Record "Transfer Line";
        ForServiceLine: Record "Service Line";
        CalcServiceLine: Record "Service Line";
        ForJobPlanningLine: Record "Job Planning Line";
        CalcJobPlanningLine: Record "Job Planning Line";
        ActionMessageEntry: Record "Action Message Entry";
        Item: Record Item;
        Location: Record Location;
        MfgSetup: Record "Manufacturing Setup";
        SKU: Record "Stockkeeping Unit";
        ItemTrackingCode: Record "Item Tracking Code";
        TempTrackingSpecification: Record "Tracking Specification" temporary;
        CallTrackingSpecification: Record "Tracking Specification";
        ForJobJnlLine: Record "Job Journal Line";
        CreateReservEntry: Codeunit "Create Reserv. Entry";
        ReservEngineMgt: Codeunit "Reservation Engine Mgt.";
        ReserveSalesLine: Codeunit "Sales Line-Reserve";
        ReserveReqLine: Codeunit "Req. Line-Reserve";
        ReservePurchLine: Codeunit "Purch. Line-Reserve";
        ReserveItemJnlLine: Codeunit "Item Jnl. Line-Reserve";
        ReserveProdOrderLine: Codeunit "Prod. Order Line-Reserve";
        ReserveProdOrderComp: Codeunit "Prod. Order Comp.-Reserve";
        AssemblyHeaderReserve: Codeunit "Assembly Header-Reserve";
        AssemblyLineReserve: Codeunit "Assembly Line-Reserve";
        ReservePlanningComponent: Codeunit "Plng. Component-Reserve";
        ReserveServiceInvLine: Codeunit "Service Line-Reserve";
        ReserveTransLine: Codeunit "Transfer Line-Reserve";
        JobPlanningLineReserve: Codeunit "Job Planning Line-Reserve";
        GetPlanningParameters: Codeunit "Planning-Get Parameters";
        CreatePick: Codeunit "Create Pick";
        Positive: Boolean;
        CurrentBindingIsSet: Boolean;
        HandleItemTracking: Boolean;
        InvSearch: Text[1];
        FieldFilter: Text[80];
        InvNextStep: Integer;
        ValueArray: array[18] of Integer;
        CurrentBinding: Option "Order-to-Order";
        ItemTrackingHandling: Option "None","Allow deletion",Match;
        Text008: TextConst ENU = 'Item tracking defined for item %1 in the %2 accounts for more than the quantity you have entered.\You must adjust the existing item tracking and then reenter the new quantity.', ENN = 'Item tracking defined for item %1 in the %2 accounts for more than the quantity you have entered.\You must adjust the existing item tracking and then reenter the new quantity.';
        Text009: TextConst ENU = 'Item Tracking cannot be fully matched.\Serial No.: %1, Lot No.: %2, outstanding quantity: %3.', ENN = 'Item Tracking cannot be fully matched.\Serial No.: %1, Lot No.: %2, outstanding quantity: %3.';
        Text010: TextConst ENU = 'Item tracking is defined for item %1 in the %2.\You must delete the existing item tracking before modifying or deleting the %2.', ENN = 'Item tracking is defined for item %1 in the %2.\You must delete the existing item tracking before modifying or deleting the %2.';
        TotalAvailQty: Decimal;
        QtyAllocInWhse: Decimal;
        QtyOnOutBound: Decimal;
        Text011: TextConst ENU = 'Item tracking is defined for item %1 in the %2.\Do you want to delete the %2 and the item tracking lines?', ENN = 'Item tracking is defined for item %1 in the %2.\Do you want to delete the %2 and the item tracking lines?';
        QtyReservedOnPickShip: Decimal;
        Text012: TextConst ENU = 'Assembly', ENN = 'Assembly';
        ForAppDelChEntry: Record "Applied Delivery Challan Entry";
        ForDelChallanLine: Record Schedule2;

    [LineStart(57985)]
    procedure IsPositive(): Boolean;
    begin
        EXIT(Positive);
    end;

    [LineStart(57988)]
    procedure FormatQty(Quantity: Decimal): Decimal;
    begin
        IF Positive THEN
            EXIT(Quantity);

        EXIT(-Quantity);
    end;

    [LineStart(57994)]
    procedure SetCalcReservEntry(TrackingSpecification: Record "Tracking Specification"; var ReservEntry: Record "Reservation Entry");
    begin
        // Late Binding
        CalcReservEntry.TRANSFERFIELDS(TrackingSpecification);
        SourceQuantity(CalcReservEntry, TRUE);
        CalcReservEntry."Serial No." := TrackingSpecification."Serial No.";
        CalcReservEntry."Lot No." := TrackingSpecification."Lot No.";
        ReservEntry := CalcReservEntry;
        HandleItemTracking := TRUE;
    end;

    [LineStart(58003)]
    procedure SetSalesLine(NewSalesLine: Record "Sales Line");
    begin
        CLEARALL;
        TempTrackingSpecification.DELETEALL;

        ForSalesLine := NewSalesLine;

        CalcReservEntry."Source Type" := DATABASE::"Sales Line";
        CalcReservEntry."Source Subtype" := ForSalesLine."Document Type";
        CalcReservEntry."Source ID" := NewSalesLine."Document No.";
        CalcReservEntry."Source Ref. No." := NewSalesLine."Line No.";

        IF NewSalesLine.Type = NewSalesLine.Type::Item THEN
            CalcReservEntry."Item No." := NewSalesLine."No.";
        CalcReservEntry."Variant Code" := NewSalesLine."Variant Code";
        CalcReservEntry."Location Code" := NewSalesLine."Location Code";
        CalcReservEntry."Serial No." := '';
        CalcReservEntry."Lot No." := '';
        CalcReservEntry."Qty. per Unit of Measure" := NewSalesLine."Qty. per Unit of Measure";
        CalcReservEntry."Expected Receipt Date" := NewSalesLine."Shipment Date";
        CalcReservEntry."Shipment Date" := NewSalesLine."Shipment Date";
        CalcReservEntry.Description := NewSalesLine.Description;
        CalcReservEntry2 := CalcReservEntry;

        GetItemSetup(CalcReservEntry);

        Positive :=
          ((CreateReservEntry.SignFactor(CalcReservEntry) * ForSalesLine."Outstanding Qty. (Base)") <= 0);

        SetPointerFilter(CalcReservEntry2);

        CallCalcReservedQtyOnPick;
    end;

    [LineStart(58035)]
    procedure SetReqLine(NewReqLine: Record "Requisition Line");
    begin
        CLEARALL;
        TempTrackingSpecification.DELETEALL;

        ForReqLine := NewReqLine;

        CalcReservEntry."Source Type" := DATABASE::"Requisition Line";
        CalcReservEntry."Source ID" := NewReqLine."Worksheet Template Name";
        CalcReservEntry."Source Batch Name" := NewReqLine."Journal Batch Name";
        CalcReservEntry."Source Ref. No." := NewReqLine."Line No.";

        IF NewReqLine.Type = NewReqLine.Type::Item THEN
            CalcReservEntry."Item No." := NewReqLine."No.";
        CalcReservEntry."Variant Code" := NewReqLine."Variant Code";
        CalcReservEntry."Location Code" := NewReqLine."Location Code";
        CalcReservEntry."Serial No." := '';
        CalcReservEntry."Lot No." := '';
        CalcReservEntry."Qty. per Unit of Measure" := NewReqLine."Qty. per Unit of Measure";
        CalcReservEntry."Expected Receipt Date" := NewReqLine."Due Date";
        CalcReservEntry."Shipment Date" := NewReqLine."Due Date";
        CalcReservEntry."Planning Flexibility" := NewReqLine."Planning Flexibility";
        CalcReservEntry.Description := NewReqLine.Description;

        CalcReservEntry2 := CalcReservEntry;

        Positive := ForReqLine."Net Quantity (Base)" < 0;

        GetItemSetup(CalcReservEntry);

        SetPointerFilter(CalcReservEntry2);

        CallCalcReservedQtyOnPick;
    end;

    [LineStart(58068)]
    procedure SetPurchLine(NewPurchLine: Record "Purchase Line");
    begin
        CLEARALL;
        TempTrackingSpecification.DELETEALL;

        ForPurchLine := NewPurchLine;

        CalcReservEntry."Source Type" := DATABASE::"Purchase Line";
        CalcReservEntry."Source Subtype" := ForPurchLine."Document Type";
        CalcReservEntry."Source ID" := NewPurchLine."Document No.";
        CalcReservEntry."Source Ref. No." := NewPurchLine."Line No.";

        IF NewPurchLine.Type = NewPurchLine.Type::Item THEN
            CalcReservEntry."Item No." := NewPurchLine."No.";
        CalcReservEntry."Variant Code" := NewPurchLine."Variant Code";
        CalcReservEntry."Location Code" := NewPurchLine."Location Code";
        CalcReservEntry."Serial No." := '';
        CalcReservEntry."Lot No." := '';
        CalcReservEntry."Qty. per Unit of Measure" := NewPurchLine."Qty. per Unit of Measure";
        CalcReservEntry."Expected Receipt Date" := NewPurchLine."Expected Receipt Date";
        CalcReservEntry."Shipment Date" := NewPurchLine."Expected Receipt Date";
        CalcReservEntry."Planning Flexibility" := NewPurchLine."Planning Flexibility";
        CalcReservEntry.Description := NewPurchLine.Description;

        CalcReservEntry2 := CalcReservEntry;

        GetItemSetup(CalcReservEntry);

        Positive :=
          ((CreateReservEntry.SignFactor(CalcReservEntry) * ForPurchLine."Outstanding Qty. (Base)") < 0);

        SetPointerFilter(CalcReservEntry2);

        CallCalcReservedQtyOnPick;
    end;

    [LineStart(58102)]
    procedure SetItemJnlLine(NewItemJnlLine: Record "Item Journal Line");
    begin
        CLEARALL;
        TempTrackingSpecification.DELETEALL;

        ForItemJnlLine := NewItemJnlLine;

        CalcReservEntry."Source Type" := DATABASE::"Item Journal Line";
        CalcReservEntry."Source Subtype" := ForItemJnlLine."Entry Type";
        CalcReservEntry."Source ID" := NewItemJnlLine."Journal Template Name";
        CalcReservEntry."Source Batch Name" := NewItemJnlLine."Journal Batch Name";
        CalcReservEntry."Source Ref. No." := NewItemJnlLine."Line No.";

        CalcReservEntry."Item No." := NewItemJnlLine."Item No.";
        CalcReservEntry."Variant Code" := NewItemJnlLine."Variant Code";
        CalcReservEntry."Location Code" := NewItemJnlLine."Location Code";
        CalcReservEntry."Serial No." := '';
        CalcReservEntry."Lot No." := '';
        CalcReservEntry."Qty. per Unit of Measure" := NewItemJnlLine."Qty. per Unit of Measure";
        CalcReservEntry."Expected Receipt Date" := NewItemJnlLine."Posting Date";
        CalcReservEntry."Shipment Date" := NewItemJnlLine."Posting Date";
        CalcReservEntry.Description := NewItemJnlLine.Description;

        CalcReservEntry2 := CalcReservEntry;

        GetItemSetup(CalcReservEntry);

        Positive :=
          ((CreateReservEntry.SignFactor(CalcReservEntry) * ForItemJnlLine."Quantity (Base)") < 0);

        SetPointerFilter(CalcReservEntry2);

        CallCalcReservedQtyOnPick;
    end;

    [LineStart(58135)]
    procedure SetProdOrderLine(NewProdOrderLine: Record "Prod. Order Line");
    begin
        CLEARALL;
        TempTrackingSpecification.DELETEALL;

        ForProdOrderLine := NewProdOrderLine;

        CalcReservEntry."Source Type" := DATABASE::"Prod. Order Line";
        CalcReservEntry."Source Subtype" := ForProdOrderLine.Status;
        CalcReservEntry."Source ID" := ForProdOrderLine."Prod. Order No.";
        CalcReservEntry."Source Prod. Order Line" := NewProdOrderLine."Line No.";

        CalcReservEntry."Item No." := NewProdOrderLine."Item No.";
        CalcReservEntry."Variant Code" := NewProdOrderLine."Variant Code";
        CalcReservEntry."Location Code" := NewProdOrderLine."Location Code";
        CalcReservEntry."Serial No." := '';
        CalcReservEntry."Lot No." := '';
        CalcReservEntry."Qty. per Unit of Measure" := NewProdOrderLine."Qty. per Unit of Measure";
        CalcReservEntry."Expected Receipt Date" := NewProdOrderLine."Due Date";
        CalcReservEntry."Shipment Date" := NewProdOrderLine."Due Date";
        CalcReservEntry."Planning Flexibility" := NewProdOrderLine."Planning Flexibility";
        CalcReservEntry.Description := NewProdOrderLine.Description;

        CalcReservEntry2 := CalcReservEntry;

        GetItemSetup(CalcReservEntry);

        Positive := ForProdOrderLine."Remaining Qty. (Base)" < 0;

        SetPointerFilter(CalcReservEntry2);

        CallCalcReservedQtyOnPick;
    end;

    [LineStart(58167)]
    procedure SetProdOrderComponent(NewProdOrderComp: Record "Prod. Order Component");
    begin
        CLEARALL;
        TempTrackingSpecification.DELETEALL;

        ForProdOrderComp := NewProdOrderComp;

        CalcReservEntry."Source Type" := DATABASE::"Prod. Order Component";
        CalcReservEntry."Source Subtype" := NewProdOrderComp.Status;
        CalcReservEntry."Source ID" := NewProdOrderComp."Prod. Order No.";
        CalcReservEntry."Source Prod. Order Line" := NewProdOrderComp."Prod. Order Line No.";
        CalcReservEntry."Source Ref. No." := NewProdOrderComp."Line No.";

        CalcReservEntry."Item No." := NewProdOrderComp."Item No.";
        CalcReservEntry."Variant Code" := NewProdOrderComp."Variant Code";
        CalcReservEntry."Location Code" := NewProdOrderComp."Location Code";
        CalcReservEntry."Serial No." := '';
        CalcReservEntry."Lot No." := '';
        CalcReservEntry."Qty. per Unit of Measure" := NewProdOrderComp."Qty. per Unit of Measure";
        CalcReservEntry."Expected Receipt Date" := NewProdOrderComp."Due Date";
        CalcReservEntry."Shipment Date" := NewProdOrderComp."Due Date";
        CalcReservEntry.Description := NewProdOrderComp.Description;

        CalcReservEntry2 := CalcReservEntry;

        GetItemSetup(CalcReservEntry);

        Positive := ForProdOrderComp."Remaining Qty. (Base)" > 0;

        SetPointerFilter(CalcReservEntry2);

        CallCalcReservedQtyOnPick;
    end;

    [LineStart(58199)]
    procedure SetAssemblyHeader(NewAssemblyHeader: Record "Assembly Header");
    begin
        CLEARALL;
        TempTrackingSpecification.DELETEALL;

        ForAssemblyHeader := NewAssemblyHeader;

        CalcReservEntry."Source Type" := DATABASE::"Assembly Header";
        CalcReservEntry."Source Subtype" := ForAssemblyHeader."Document Type";
        CalcReservEntry."Source ID" := NewAssemblyHeader."No.";

        CalcReservEntry."Item No." := NewAssemblyHeader."Item No.";
        CalcReservEntry."Variant Code" := NewAssemblyHeader."Variant Code";
        CalcReservEntry."Location Code" := NewAssemblyHeader."Location Code";
        CalcReservEntry."Serial No." := '';
        CalcReservEntry."Lot No." := '';
        CalcReservEntry."Qty. per Unit of Measure" := NewAssemblyHeader."Qty. per Unit of Measure";
        CalcReservEntry."Expected Receipt Date" := NewAssemblyHeader."Due Date";
        CalcReservEntry."Shipment Date" := NewAssemblyHeader."Due Date";
        CalcReservEntry.Description := NewAssemblyHeader.Description;

        CalcReservEntry2 := CalcReservEntry;

        GetItemSetup(CalcReservEntry);

        Positive :=
          ((CreateReservEntry.SignFactor(CalcReservEntry) * ForAssemblyHeader."Remaining Quantity (Base)") < 0);

        SetPointerFilter(CalcReservEntry2);

        CallCalcReservedQtyOnPick;
    end;

    [LineStart(58230)]
    procedure SetAssemblyLine(NewAssemblyLine: Record "Assembly Line");
    begin
        CLEARALL;
        TempTrackingSpecification.DELETEALL;

        ForAssemblyLine := NewAssemblyLine;

        CalcReservEntry."Source Type" := DATABASE::"Assembly Line";
        CalcReservEntry."Source Subtype" := ForAssemblyLine."Document Type";
        CalcReservEntry."Source ID" := NewAssemblyLine."Document No.";
        CalcReservEntry."Source Ref. No." := NewAssemblyLine."Line No.";

        IF NewAssemblyLine.Type = NewAssemblyLine.Type::Item THEN
            CalcReservEntry."Item No." := NewAssemblyLine."No.";
        CalcReservEntry."Variant Code" := NewAssemblyLine."Variant Code";
        CalcReservEntry."Location Code" := NewAssemblyLine."Location Code";
        CalcReservEntry."Serial No." := '';
        CalcReservEntry."Lot No." := '';
        CalcReservEntry."Qty. per Unit of Measure" := NewAssemblyLine."Qty. per Unit of Measure";
        CalcReservEntry."Expected Receipt Date" := NewAssemblyLine."Due Date";
        CalcReservEntry."Shipment Date" := NewAssemblyLine."Due Date";
        CalcReservEntry.Description := NewAssemblyLine.Description;

        CalcReservEntry2 := CalcReservEntry;

        GetItemSetup(CalcReservEntry);

        Positive :=
          ((CreateReservEntry.SignFactor(CalcReservEntry) * ForAssemblyLine."Remaining Quantity (Base)") < 0);

        SetPointerFilter(CalcReservEntry2);

        CallCalcReservedQtyOnPick;
    end;

    [LineStart(58263)]
    procedure SetPlanningComponent(NewPlanningComponent: Record "Planning Component");
    begin
        CLEARALL;
        TempTrackingSpecification.DELETEALL;

        ForPlanningComponent := NewPlanningComponent;

        CalcReservEntry."Source Type" := DATABASE::"Planning Component";
        CalcReservEntry."Source ID" := NewPlanningComponent."Worksheet Template Name";
        CalcReservEntry."Source Batch Name" := NewPlanningComponent."Worksheet Batch Name";
        CalcReservEntry."Source Prod. Order Line" := NewPlanningComponent."Worksheet Line No.";
        CalcReservEntry."Source Ref. No." := NewPlanningComponent."Line No.";

        CalcReservEntry."Item No." := NewPlanningComponent."Item No.";
        CalcReservEntry."Variant Code" := NewPlanningComponent."Variant Code";
        CalcReservEntry."Location Code" := NewPlanningComponent."Location Code";
        CalcReservEntry."Serial No." := '';
        CalcReservEntry."Lot No." := '';
        CalcReservEntry."Qty. per Unit of Measure" := NewPlanningComponent."Qty. per Unit of Measure";
        CalcReservEntry."Expected Receipt Date" := NewPlanningComponent."Due Date";
        CalcReservEntry."Shipment Date" := NewPlanningComponent."Due Date";
        CalcReservEntry.Description := NewPlanningComponent.Description;

        CalcReservEntry2 := CalcReservEntry;

        GetItemSetup(CalcReservEntry);

        Positive := ForPlanningComponent."Net Quantity (Base)" > 0;

        SetPointerFilter(CalcReservEntry2);

        CallCalcReservedQtyOnPick;
    end;

    [LineStart(58295)]
    procedure SetItemLedgEntry(NewItemLedgEntry: Record "Item Ledger Entry");
    begin
        CLEARALL;
        TempTrackingSpecification.DELETEALL;

        ForItemLedgEntry := NewItemLedgEntry;

        CalcReservEntry."Source Type" := DATABASE::"Item Ledger Entry";
        CalcReservEntry."Source Ref. No." := NewItemLedgEntry."Entry No.";

        CalcReservEntry."Item No." := NewItemLedgEntry."Item No.";
        CalcReservEntry."Variant Code" := NewItemLedgEntry."Variant Code";
        CalcReservEntry."Location Code" := NewItemLedgEntry."Location Code";
        CalcReservEntry."Serial No." := NewItemLedgEntry."Serial No.";
        CalcReservEntry."Lot No." := NewItemLedgEntry."Lot No.";
        CalcReservEntry."Qty. per Unit of Measure" := NewItemLedgEntry."Qty. per Unit of Measure";
        CalcReservEntry.Description := NewItemLedgEntry.Description;
        Positive := ForItemLedgEntry."Remaining Quantity" <= 0;

        IF Positive THEN BEGIN
            CalcReservEntry."Expected Receipt Date" := 12319999D;
            CalcReservEntry."Shipment Date" := 12319999D;
        END ELSE BEGIN
            CalcReservEntry."Expected Receipt Date" := 0D;
            CalcReservEntry."Shipment Date" := 0D;
        END;

        CalcReservEntry2 := CalcReservEntry;

        GetItemSetup(CalcReservEntry);

        SetPointerFilter(CalcReservEntry2);

        CallCalcReservedQtyOnPick;
    end;

    [LineStart(58329)]
    procedure SetTransferLine(NewTransLine: Record "Transfer Line"; Direction: Option Outbound,Inbound);
    begin
        CLEARALL;
        TempTrackingSpecification.DELETEALL;

        ForTransLine := NewTransLine;

        CalcReservEntry."Source Type" := DATABASE::"Transfer Line";
        CalcReservEntry."Source Subtype" := Direction;
        CalcReservEntry."Source ID" := NewTransLine."Document No.";
        CalcReservEntry."Source Prod. Order Line" := NewTransLine."Derived From Line No.";
        CalcReservEntry."Source Ref. No." := NewTransLine."Line No.";

        CalcReservEntry."Item No." := NewTransLine."Item No.";
        CalcReservEntry."Variant Code" := NewTransLine."Variant Code";
        CASE Direction OF
            Direction::Outbound:
                BEGIN
                    CalcReservEntry."Location Code" := NewTransLine."Transfer-from Code";
                    CalcReservEntry."Shipment Date" := NewTransLine."Shipment Date";
                END;
            Direction::Inbound:
                BEGIN
                    CalcReservEntry."Location Code" := NewTransLine."Transfer-to Code";
                    CalcReservEntry."Expected Receipt Date" := NewTransLine."Receipt Date";
                END;
        END;

        CalcReservEntry."Serial No." := '';
        CalcReservEntry."Lot No." := '';
        CalcReservEntry."Qty. per Unit of Measure" := NewTransLine."Qty. per Unit of Measure";
        CalcReservEntry.Description := NewTransLine.Description;
        CalcReservEntry2 := CalcReservEntry;

        GetItemSetup(CalcReservEntry);

        Positive :=
          ((CreateReservEntry.SignFactor(CalcReservEntry) * ForTransLine."Outstanding Qty. (Base)") <= 0);
        GetItemSetup(CalcReservEntry);

        SetPointerFilter(CalcReservEntry2);

        CallCalcReservedQtyOnPick;
    end;

    [LineStart(58372)]
    procedure SetServLine(NewServiceLine: Record "Service Line");
    begin
        CLEARALL;
        TempTrackingSpecification.DELETEALL;

        ForServiceLine := NewServiceLine;

        CalcReservEntry."Source Type" := DATABASE::"Service Line";
        CalcReservEntry."Source Subtype" := ForServiceLine."Document Type";
        CalcReservEntry."Source ID" := ForServiceLine."Document No.";
        CalcReservEntry."Source Ref. No." := NewServiceLine."Line No.";

        IF NewServiceLine.Type = NewServiceLine.Type::Item THEN
            CalcReservEntry."Item No." := NewServiceLine."No.";
        CalcReservEntry."Variant Code" := NewServiceLine."Variant Code";
        CalcReservEntry."Location Code" := NewServiceLine."Location Code";
        CalcReservEntry."Serial No." := '';
        CalcReservEntry."Lot No." := '';
        CalcReservEntry."Qty. per Unit of Measure" := NewServiceLine."Qty. per Unit of Measure";
        CalcReservEntry."Expected Receipt Date" := NewServiceLine."Needed by Date";
        CalcReservEntry."Shipment Date" := NewServiceLine."Needed by Date";
        CalcReservEntry.Description := NewServiceLine.Description;
        CalcReservEntry2 := CalcReservEntry;

        GetItemSetup(CalcReservEntry);

        Positive :=
          ((CreateReservEntry.SignFactor(CalcReservEntry) * ForServiceLine."Outstanding Qty. (Base)") <= 0);
        GetItemSetup(CalcReservEntry);

        SetPointerFilter(CalcReservEntry2);

        CallCalcReservedQtyOnPick;
    end;

    [LineStart(58405)]
    procedure SetJobJnlLine(NewJobJnlLine: Record "Job Journal Line");
    begin
        CLEARALL;
        ForJobJnlLine := NewJobJnlLine;

        CalcReservEntry."Source Type" := DATABASE::"Job Journal Line";
        CalcReservEntry."Source Subtype" := ForJobJnlLine."Entry Type";
        CalcReservEntry."Source ID" := NewJobJnlLine."Journal Template Name";
        CalcReservEntry."Source Batch Name" := NewJobJnlLine."Journal Batch Name";
        CalcReservEntry."Source Ref. No." := NewJobJnlLine."Line No.";

        CalcReservEntry."Item No." := NewJobJnlLine."No.";
        CalcReservEntry."Variant Code" := NewJobJnlLine."Variant Code";
        CalcReservEntry."Location Code" := NewJobJnlLine."Location Code";
        CalcReservEntry."Serial No." := '';
        CalcReservEntry."Lot No." := '';
        CalcReservEntry."Qty. per Unit of Measure" := NewJobJnlLine."Qty. per Unit of Measure";
        CalcReservEntry."Expected Receipt Date" := NewJobJnlLine."Posting Date";
        CalcReservEntry."Shipment Date" := NewJobJnlLine."Posting Date";
        CalcReservEntry.Description := NewJobJnlLine.Description;

        CalcReservEntry2 := CalcReservEntry;

        GetItemSetup(CalcReservEntry);

        Positive :=
          ((CreateReservEntry.SignFactor(CalcReservEntry) * ForJobJnlLine."Quantity (Base)") < 0);

        SetPointerFilter(CalcReservEntry2);

        CallCalcReservedQtyOnPick;
    end;

    [LineStart(58436)]
    procedure SetJobPlanningLine(NewJobPlanningLine: Record "Job Planning Line");
    begin
        CLEARALL;
        TempTrackingSpecification.DELETEALL;

        ForJobPlanningLine := NewJobPlanningLine;

        CalcReservEntry."Source Type" := DATABASE::"Job Planning Line";
        CalcReservEntry."Source Subtype" := ForJobPlanningLine.Status;
        CalcReservEntry."Source ID" := NewJobPlanningLine."Job No.";
        CalcReservEntry."Source Ref. No." := NewJobPlanningLine."Job Contract Entry No.";

        IF NewJobPlanningLine.Type = NewJobPlanningLine.Type::Item THEN
            CalcReservEntry."Item No." := NewJobPlanningLine."No.";
        CalcReservEntry."Variant Code" := NewJobPlanningLine."Variant Code";
        CalcReservEntry."Location Code" := NewJobPlanningLine."Location Code";
        CalcReservEntry."Serial No." := '';
        CalcReservEntry."Lot No." := '';
        CalcReservEntry."Qty. per Unit of Measure" := NewJobPlanningLine."Qty. per Unit of Measure";
        CalcReservEntry."Expected Receipt Date" := NewJobPlanningLine."Planning Date";
        CalcReservEntry."Shipment Date" := NewJobPlanningLine."Planning Date";
        CalcReservEntry.Description := NewJobPlanningLine.Description;
        CalcReservEntry2 := CalcReservEntry;

        GetItemSetup(CalcReservEntry);

        Positive :=
          ((CreateReservEntry.SignFactor(CalcReservEntry) * ForJobPlanningLine."Remaining Qty. (Base)") <= 0);

        SetPointerFilter(CalcReservEntry2);

        CallCalcReservedQtyOnPick;
    end;

    [LineStart(58468)]
    procedure SalesLineUpdateValues(var CurrentSalesLine: Record "Sales Line"; var QtyToReserve: Decimal; var QtyToReserveBase: Decimal; var QtyReservedThisLine: Decimal; var QtyReservedThisLineBase: Decimal);
    begin
        WITH CurrentSalesLine DO BEGIN
            CALCFIELDS("Reserved Quantity", "Reserved Qty. (Base)");
            IF "Document Type" = "Document Type"::"Return Order" THEN BEGIN
                "Reserved Quantity" := -"Reserved Quantity";
                "Reserved Qty. (Base)" := -"Reserved Qty. (Base)";
            END;
            QtyReservedThisLine := "Reserved Quantity";
            QtyReservedThisLineBase := "Reserved Qty. (Base)";
            QtyToReserve := "Outstanding Quantity" - "Reserved Quantity";
            QtyToReserveBase := "Outstanding Qty. (Base)" - "Reserved Qty. (Base)";
        END;
    end;

    [LineStart(58481)]
    procedure ReqLineUpdateValues(var CurrentReqLine: Record "Requisition Line"; var QtyToReserve: Decimal; var QtyToReserveBase: Decimal; var QtyReservedThisLine: Decimal; var QtyReservedThisLineBase: Decimal);
    begin
        WITH CurrentReqLine DO BEGIN
            CALCFIELDS("Reserved Quantity", "Reserved Qty. (Base)");
            QtyReservedThisLine := "Reserved Quantity";
            QtyReservedThisLineBase := "Reserved Qty. (Base)";
            QtyToReserve := Quantity - "Reserved Quantity";
            QtyToReserveBase := "Quantity (Base)" - "Reserved Qty. (Base)";
        END;
    end;

    [LineStart(58490)]
    procedure PurchLineUpdateValues(var CurrentPurchLine: Record "Purchase Line"; var QtyToReserve: Decimal; var QtyToReserveBase: Decimal; var QtyReservedThisLine: Decimal; var QtyReservedThisLineBase: Decimal);
    begin
        WITH CurrentPurchLine DO BEGIN
            CALCFIELDS("Reserved Quantity", "Reserved Qty. (Base)");
            IF "Document Type" = "Document Type"::"Return Order" THEN BEGIN
                "Reserved Quantity" := -"Reserved Quantity";
                "Reserved Qty. (Base)" := -"Reserved Qty. (Base)";
            END;
            QtyReservedThisLine := "Reserved Quantity";
            QtyReservedThisLineBase := "Reserved Qty. (Base)";
            QtyToReserve := "Outstanding Quantity" - "Reserved Quantity";
            QtyToReserveBase := "Outstanding Qty. (Base)" - "Reserved Qty. (Base)";
        END;
    end;

    [LineStart(58503)]
    procedure ProdOrderLineUpdateValues(var CurrentProdOrderLine: Record "Prod. Order Line"; var QtyToReserve: Decimal; var QtyToReserveBase: Decimal; var QtyReservedThisLine: Decimal; var QtyReservedThisLineBase: Decimal);
    begin
        WITH CurrentProdOrderLine DO BEGIN
            CALCFIELDS("Reserved Quantity", "Reserved Qty. (Base)");
            QtyReservedThisLine := "Reserved Quantity";
            QtyReservedThisLineBase := "Reserved Qty. (Base)";
            QtyToReserve := "Remaining Quantity" - "Reserved Quantity";
            QtyToReserveBase := "Remaining Qty. (Base)" - "Reserved Qty. (Base)";
        END;
    end;

    [LineStart(58512)]
    procedure ProdOrderCompUpdateValues(var CurrentProdOrderComp: Record "Prod. Order Component"; var QtyToReserve: Decimal; var QtyToReserveBase: Decimal; var QtyReservedThisLine: Decimal; var QtyReservedThisLineBase: Decimal);
    begin
        WITH CurrentProdOrderComp DO BEGIN
            CALCFIELDS("Reserved Quantity", "Reserved Qty. (Base)");
            QtyReservedThisLine := "Reserved Qty. (Base)";
            QtyReservedThisLineBase := "Reserved Qty. (Base)";
            QtyToReserve := "Remaining Quantity" - "Reserved Quantity";
            QtyToReserveBase := "Remaining Qty. (Base)" - "Reserved Qty. (Base)";
        END;
    end;

    [LineStart(58521)]
    procedure AssemblyHeaderUpdateValues(var CurrentAssemblyHeader: Record "Assembly Header"; var QtyToReserve: Decimal; var QtyToReserveBase: Decimal; var QtyReservedThisLine: Decimal; var QtyReservedThisLineBase: Decimal);
    begin
        WITH CurrentAssemblyHeader DO BEGIN
            CALCFIELDS("Reserved Quantity", "Reserved Qty. (Base)");
            QtyReservedThisLine := "Reserved Quantity";
            QtyReservedThisLineBase := "Reserved Qty. (Base)";
            QtyToReserve := "Remaining Quantity" - "Reserved Quantity";
            QtyToReserveBase := "Remaining Quantity (Base)" - "Reserved Qty. (Base)";
        END;
    end;

    [LineStart(58530)]
    procedure AssemblyLineUpdateValues(var CurrentAssemblyLine: Record "Assembly Line"; var QtyToReserve: Decimal; var QtyToReserveBase: Decimal; var QtyReservedThisLine: Decimal; var QtyReservedThisLineBase: Decimal);
    begin
        WITH CurrentAssemblyLine DO BEGIN
            CALCFIELDS("Reserved Quantity", "Reserved Qty. (Base)");
            QtyReservedThisLine := "Reserved Quantity";
            QtyReservedThisLineBase := "Reserved Qty. (Base)";
            QtyToReserve := "Remaining Quantity" - "Reserved Quantity";
            QtyToReserveBase := "Remaining Quantity (Base)" - "Reserved Qty. (Base)";
        END;
    end;

    [LineStart(58539)]
    procedure PlanningComponentUpdateValues(var CurrentPlanningComponent: Record "Planning Component"; var QtyToReserve: Decimal; var QtyToReserveBase: Decimal; var QtyReservedThisLine: Decimal; var QtyReservedThisLineBase: Decimal);
    begin
        WITH CurrentPlanningComponent DO BEGIN
            CALCFIELDS("Reserved Quantity", "Reserved Qty. (Base)");
            QtyReservedThisLine := "Reserved Quantity";
            QtyReservedThisLineBase := "Reserved Qty. (Base)";
            QtyToReserve := 0;
            QtyToReserveBase := "Net Quantity (Base)" - "Reserved Qty. (Base)";
        END;
    end;

    [LineStart(58548)]
    procedure ItemLedgEntryUpdateValues(var CurrentItemLedgEntry: Record "Item Ledger Entry"; var QtyToReserve: Decimal; var QtyReservedThisLine: Decimal);
    begin
        WITH CurrentItemLedgEntry DO BEGIN
            CALCFIELDS("Reserved Quantity");
            QtyReservedThisLine := "Reserved Quantity";
            QtyToReserve := "Remaining Quantity" - "Reserved Quantity";
        END;
    end;

    [LineStart(58555)]
    procedure ServiceInvLineUpdateValues(var CurrentServiceInvLine: Record "Service Line"; var QtyToReserve: Decimal; var QtyToReserveBase: Decimal; var QtyReservedThisLine: Decimal; var QtyReservedThisLineBase: Decimal);
    begin
        WITH CurrentServiceInvLine DO BEGIN
            CALCFIELDS("Reserved Quantity", "Reserved Qty. (Base)");
            QtyReservedThisLine := "Reserved Quantity";
            QtyReservedThisLineBase := "Reserved Qty. (Base)";
            QtyToReserve := "Outstanding Quantity" - "Reserved Quantity";
            QtyToReserveBase := "Outstanding Qty. (Base)" - "Reserved Qty. (Base)";
        END;
    end;

    [LineStart(58564)]
    procedure TransferLineUpdateValues(var CurrentTransLine: Record "Transfer Line"; var QtyToReserve: Decimal; var QtyToReserveBase: Decimal; var QtyReservedThisLine: Decimal; var QtyReservedThisLineBase: Decimal; Direction: Option Outbound,Inbound);
    begin
        WITH CurrentTransLine DO
            CASE Direction OF
                Direction::Outbound:
                    BEGIN
                        CALCFIELDS("Reserved Quantity Outbnd.", "Reserved Qty. Outbnd. (Base)");
                        QtyReservedThisLine := "Reserved Quantity Outbnd.";
                        QtyReservedThisLineBase := "Reserved Qty. Outbnd. (Base)";
                        QtyToReserve := -"Outstanding Quantity" + "Reserved Quantity Outbnd.";
                        QtyToReserveBase := -"Outstanding Qty. (Base)" + "Reserved Qty. Outbnd. (Base)";
                    END;
                Direction::Inbound:
                    BEGIN
                        CALCFIELDS("Reserved Quantity Inbnd.", "Reserved Qty. Inbnd. (Base)");
                        QtyReservedThisLine := "Reserved Quantity Inbnd.";
                        QtyReservedThisLineBase := "Reserved Qty. Inbnd. (Base)";
                        QtyToReserve := "Outstanding Quantity" - "Reserved Quantity Inbnd.";
                        QtyToReserveBase := "Outstanding Qty. (Base)" - "Reserved Qty. Inbnd. (Base)";
                    END;
            END;
    end;

    [LineStart(58585)]
    procedure JobPlanningLineUpdateValues(var CurrentJobPlanningLine: Record "Job Planning Line"; var QtyToReserve: Decimal; var QtyToReserveBase: Decimal; var QtyReservedThisLine: Decimal; var QtyReservedThisLineBase: Decimal);
    begin
        WITH CurrentJobPlanningLine DO BEGIN
            CALCFIELDS("Reserved Quantity", "Reserved Qty. (Base)");
            QtyReservedThisLine := "Reserved Quantity";
            QtyReservedThisLineBase := "Reserved Qty. (Base)";
            QtyToReserve := "Remaining Qty." - "Reserved Quantity";
            QtyToReserveBase := "Remaining Qty. (Base)" - "Reserved Qty. (Base)";
        END;
    end;

    [LineStart(58594)]
    procedure UpdateStatistics(var ReservSummEntry: Record "Entry Summary"; AvailabilityDate: Date; HandleItemTracking2: Boolean);
    var
        i: Integer;
        CurrentEntryNo: Integer;
        ValueArrayNo: Integer;
        CalcSumValue: Decimal;
    begin
        CurrentEntryNo := ReservSummEntry."Entry No.";
        CalcReservEntry.TESTFIELD("Source Type");
        ReservSummEntry.DELETEALL;
        HandleItemTracking := HandleItemTracking2;
        IF HandleItemTracking2 THEN
            ValueArrayNo := 3;
        FOR i := 1 TO SetValueArray(ValueArrayNo) DO BEGIN
            CalcSumValue := 0;
            ReservSummEntry.INIT;
            ReservSummEntry."Entry No." := ValueArray[i];

            CASE ValueArray[i] OF
                1: // Item Ledger Entry
                    UpdateItemLedgEntryStats(ReservSummEntry, AvailabilityDate, i, CalcSumValue, HandleItemTracking2);
                12, 16: // Purchase Order, Purchase Return Order
                    UpdatePurchLineStats(ReservSummEntry, AvailabilityDate, i, CalcSumValue);
                32, 36: // Sales Order, Sales Return Order
                    UpdateSalesLineStats(ReservSummEntry, AvailabilityDate, i, CalcSumValue);
                63: // Firm Planned Prod. Order Line
                    UpdateProdOrderLineStats(ReservSummEntry, AvailabilityDate, i, CalcSumValue);
                64: // Released Prod. Order Line
                    UpdateProdOrderLineStats(ReservSummEntry, AvailabilityDate, i, CalcSumValue);
                73: // Firm Planned Component Line
                    UpdateProdOrderCompStats(ReservSummEntry, AvailabilityDate, i, CalcSumValue);
                74: // Released Component Line
                    UpdateProdOrderCompStats(ReservSummEntry, AvailabilityDate, i, CalcSumValue);
                101, 102: // Transfer Line
                    UpdateTransLineStats(ReservSummEntry, AvailabilityDate, i, CalcSumValue);
                110: // Service Line Order
                    UpdateServLineStats(ReservSummEntry, AvailabilityDate, i, CalcSumValue);
                133: // Job Planning Line Order
                    UpdateJobPlanningLineStats(ReservSummEntry, AvailabilityDate, i, CalcSumValue);
                141, 142: // Assembly Header
                    UpdateAssemblyHeaderStats(ReservSummEntry, AvailabilityDate, i, CalcSumValue);
                151, 152: // AssemblyLine
                    UpdateAssemblyLineStats(ReservSummEntry, AvailabilityDate, i, CalcSumValue);
                6500: // Item Tracking
                    UpdateItemTrackingLineStats(ReservSummEntry, AvailabilityDate);
            END;
        END;
        IF NOT ReservSummEntry.GET(CurrentEntryNo) THEN;
    end;

    [LineStart(58637)]
    local procedure UpdateItemLedgEntryStats(var ReservEntrySummary: Record "Entry Summary"; AvailabilityDate: Date; i: Integer; var CalcSumValue: Decimal; HandleItemTracking2: Boolean);
    var
        ReservForm: Page Reservation;
        LateBindingMgt: Codeunit "Late Binding Management";
        CurrReservedQtyBase: Decimal;
    begin
        IF CalcItemLedgEntry.READPERMISSION THEN BEGIN
            InitFilter(ValueArray[i], AvailabilityDate);
            IF CalcItemLedgEntry.FINDSET THEN
                REPEAT
                    CalcItemLedgEntry.CALCFIELDS("Reserved Quantity");
                    ReservEntrySummary."Total Reserved Quantity" += CalcItemLedgEntry."Reserved Quantity";
                    CalcSumValue += CalcItemLedgEntry."Remaining Quantity";
                UNTIL CalcItemLedgEntry.NEXT = 0;
            IF HandleItemTracking2 THEN
                IF ReservEntrySummary."Total Reserved Quantity" > 0 THEN
                    ReservEntrySummary."Non-specific Reserved Qty." := LateBindingMgt.NonspecificReservedQty(CalcItemLedgEntry);

            IF CalcSumValue <> 0 THEN
                IF (CalcSumValue > 0) = Positive THEN BEGIN
                    IF Location.GET(CalcItemLedgEntry."Location Code") AND
                       (Location."Bin Mandatory" OR Location."Require Pick")
                    THEN BEGIN
                        CalcReservedQtyOnPick(TotalAvailQty, QtyAllocInWhse);
                        QtyOnOutBound :=
                          CreatePick.CheckOutBound(
                            CalcReservEntry."Source Type", CalcReservEntry."Source Subtype",
                            CalcReservEntry."Source ID", CalcReservEntry."Source Ref. No.",
                            CalcReservEntry."Source Prod. Order Line");
                    END ELSE BEGIN
                        QtyAllocInWhse := 0;
                        QtyOnOutBound := 0;
                    END;
                    IF QtyAllocInWhse < 0 THEN
                        QtyAllocInWhse := 0;
                    ReservEntrySummary."Table ID" := DATABASE::"Item Ledger Entry";
                    ReservEntrySummary."Summary Type" :=
                      COPYSTR(CalcItemLedgEntry.TABLECAPTION, 1, MAXSTRLEN(ReservEntrySummary."Summary Type"));
                    ReservEntrySummary."Total Quantity" := CalcSumValue;
                    ReservEntrySummary."Total Available Quantity" :=
                      ReservEntrySummary."Total Quantity" - ReservEntrySummary."Total Reserved Quantity";

                    CLEAR(ReservForm);
                    ReservForm.SetReservEntry(CalcReservEntry);
                    CurrReservedQtyBase := ReservForm.ReservedThisLine(ReservEntrySummary);
                    IF (CurrReservedQtyBase <> 0) AND (QtyOnOutBound <> 0) THEN
                        IF QtyOnOutBound > CurrReservedQtyBase THEN
                            QtyOnOutBound := QtyOnOutBound - CurrReservedQtyBase
                        ELSE
                            QtyOnOutBound := 0;

                    IF Location."Bin Mandatory" OR Location."Require Pick" THEN BEGIN
                        IF TotalAvailQty + QtyOnOutBound < ReservEntrySummary."Total Available Quantity" THEN
                            ReservEntrySummary."Total Available Quantity" := TotalAvailQty + QtyOnOutBound;
                        ReservEntrySummary."Qty. Alloc. in Warehouse" := QtyAllocInWhse;
                        ReservEntrySummary."Res. Qty. on Picks & Shipmts." := QtyReservedOnPickShip
                    END ELSE BEGIN
                        ReservEntrySummary."Qty. Alloc. in Warehouse" := 0;
                        ReservEntrySummary."Res. Qty. on Picks & Shipmts." := 0
                    END;
                    IF NOT ReservEntrySummary.INSERT THEN
                        ReservEntrySummary.MODIFY;
                END;
        END;
    end;

    [LineStart(58697)]
    local procedure UpdatePurchLineStats(var ReservEntrySummary: Record "Entry Summary"; AvailabilityDate: Date; i: Integer; var CalcSumValue: Decimal);
    begin
        IF CalcPurchLine.READPERMISSION THEN BEGIN
            InitFilter(ValueArray[i], AvailabilityDate);
            IF CalcPurchLine.FINDSET THEN
                REPEAT
                    CalcPurchLine.CALCFIELDS("Reserved Qty. (Base)");
                    IF NOT CalcPurchLine."Special Order" THEN BEGIN
                        ReservEntrySummary."Total Reserved Quantity" += CalcPurchLine."Reserved Qty. (Base)";
                        CalcSumValue += CalcPurchLine."Outstanding Qty. (Base)";
                    END;
                UNTIL CalcPurchLine.NEXT = 0;

            IF CalcSumValue <> 0 THEN
                WITH ReservEntrySummary DO
                    IF (Positive = (CalcSumValue > 0)) AND (ValueArray[i] <> 16) OR
                       (Positive = (CalcSumValue < 0)) AND (ValueArray[i] = 16)
                    THEN BEGIN
                        "Table ID" := DATABASE::"Purchase Line";
                        "Summary Type" :=
                          COPYSTR(
                            STRSUBSTNO('%1, %2', CalcPurchLine.TABLECAPTION, CalcPurchLine."Document Type"),
                            1, MAXSTRLEN("Summary Type"));
                        IF ValueArray[i] = 16 THEN
                            "Total Quantity" := -CalcSumValue
                        ELSE
                            "Total Quantity" := CalcSumValue;
                        "Total Available Quantity" := "Total Quantity" - "Total Reserved Quantity";
                        IF NOT INSERT THEN
                            MODIFY;
                    END;
        END;
    end;

    [LineStart(58729)]
    local procedure UpdateSalesLineStats(var ReservEntrySummary: Record "Entry Summary"; AvailabilityDate: Date; i: Integer; var CalcSumValue: Decimal);
    begin
        IF CalcSalesLine.READPERMISSION THEN BEGIN
            InitFilter(ValueArray[i], AvailabilityDate);
            IF CalcSalesLine.FINDSET THEN
                REPEAT
                    CalcSalesLine.CALCFIELDS("Reserved Qty. (Base)");
                    ReservEntrySummary."Total Reserved Quantity" -= CalcSalesLine."Reserved Qty. (Base)";
                    CalcSumValue += CalcSalesLine."Outstanding Qty. (Base)";
                UNTIL CalcSalesLine.NEXT = 0;

            IF CalcSumValue <> 0 THEN
                WITH ReservEntrySummary DO
                    IF (Positive = (CalcSumValue < 0)) AND (ValueArray[i] <> 36) OR
                       (Positive = (CalcSumValue > 0)) AND (ValueArray[i] = 36)
                    THEN BEGIN
                        "Table ID" := DATABASE::"Sales Line";
                        "Summary Type" :=
                          COPYSTR(
                            STRSUBSTNO('%1, %2', CalcSalesLine.TABLECAPTION, CalcSalesLine."Document Type"),
                            1, MAXSTRLEN("Summary Type"));
                        IF ValueArray[i] = 36 THEN
                            "Total Quantity" := CalcSumValue
                        ELSE
                            "Total Quantity" := -CalcSumValue;
                        "Total Available Quantity" := "Total Quantity" - "Total Reserved Quantity";
                        IF NOT INSERT THEN
                            MODIFY;
                    END;
        END;
    end;

    [LineStart(58759)]
    local procedure UpdateProdOrderLineStats(var ReservEntrySummary: Record "Entry Summary"; AvailabilityDate: Date; i: Integer; var CalcSumValue: Decimal);
    begin
        IF CalcProdOrderLine.READPERMISSION THEN BEGIN
            InitFilter(ValueArray[i], AvailabilityDate);
            IF CalcProdOrderLine.FINDSET THEN
                REPEAT
                    CalcProdOrderLine.CALCFIELDS("Reserved Qty. (Base)");
                    ReservEntrySummary."Total Reserved Quantity" += CalcProdOrderLine."Reserved Qty. (Base)";
                    CalcSumValue += CalcProdOrderLine."Remaining Qty. (Base)";
                UNTIL CalcProdOrderLine.NEXT = 0;

            IF CalcSumValue <> 0 THEN
                WITH ReservEntrySummary DO
                    IF (CalcSumValue > 0) = Positive THEN BEGIN
                        "Table ID" := DATABASE::"Prod. Order Line";
                        IF "Entry No." = 63 THEN
                            "Summary Type" := COPYSTR(STRSUBSTNO(Text000, CalcProdOrderLine.TABLECAPTION), 1, MAXSTRLEN("Summary Type"))
                        ELSE
                            "Summary Type" := COPYSTR(STRSUBSTNO(Text001, CalcProdOrderLine.TABLECAPTION), 1, MAXSTRLEN("Summary Type"));
                        "Total Quantity" := CalcSumValue;
                        "Total Available Quantity" := "Total Quantity" - "Total Reserved Quantity";
                        IF NOT INSERT THEN
                            MODIFY;
                    END;
        END;
    end;

    [LineStart(58784)]
    local procedure UpdateAssemblyHeaderStats(var ReservEntrySummary: Record "Entry Summary"; AvailabilityDate: Date; i: Integer; var CalcSumValue: Decimal);
    begin
        IF CalcAssemblyHeader.READPERMISSION THEN BEGIN
            InitFilter(ValueArray[i], AvailabilityDate);
            IF CalcAssemblyHeader.FINDSET THEN
                REPEAT
                    CalcAssemblyHeader.CALCFIELDS("Reserved Qty. (Base)");
                    ReservEntrySummary."Total Reserved Quantity" += CalcAssemblyHeader."Reserved Qty. (Base)";
                    CalcSumValue += CalcAssemblyHeader."Remaining Quantity (Base)";
                UNTIL CalcAssemblyHeader.NEXT = 0;

            IF CalcSumValue <> 0 THEN
                WITH ReservEntrySummary DO
                    IF (CalcSumValue > 0) = Positive THEN BEGIN
                        "Table ID" := DATABASE::"Assembly Header";
                        "Summary Type" :=
                          COPYSTR(
                            STRSUBSTNO('%1 %2', Text012, CalcAssemblyHeader."Document Type"),
                            1, MAXSTRLEN("Summary Type"));
                        "Total Quantity" := CalcSumValue;
                        "Total Available Quantity" := "Total Quantity" - "Total Reserved Quantity";
                        IF NOT INSERT THEN
                            MODIFY;
                    END;
        END;
    end;

    [LineStart(58809)]
    local procedure UpdateAssemblyLineStats(var ReservEntrySummary: Record "Entry Summary"; AvailabilityDate: Date; i: Integer; var CalcSumValue: Decimal);
    begin
        IF CalcAssemblyLine.READPERMISSION THEN BEGIN
            InitFilter(ValueArray[i], AvailabilityDate);
            IF CalcAssemblyLine.FINDSET THEN
                REPEAT
                    CalcAssemblyLine.CALCFIELDS("Reserved Qty. (Base)");
                    ReservEntrySummary."Total Reserved Quantity" -= CalcAssemblyLine."Reserved Qty. (Base)";
                    CalcSumValue += CalcAssemblyLine."Remaining Quantity (Base)";
                UNTIL CalcAssemblyLine.NEXT = 0;

            IF CalcSumValue <> 0 THEN
                WITH ReservEntrySummary DO
                    IF CalcSumValue < 0 = Positive THEN BEGIN
                        "Table ID" := DATABASE::"Assembly Line";
                        "Summary Type" :=
                          COPYSTR(
                            STRSUBSTNO('%1, %2', CalcAssemblyLine.TABLECAPTION, CalcAssemblyLine."Document Type"),
                            1, MAXSTRLEN("Summary Type"));
                        "Total Quantity" := -CalcSumValue;
                        "Total Available Quantity" := "Total Quantity" - "Total Reserved Quantity";
                        IF NOT INSERT THEN
                            MODIFY;
                    END;
        END;
    end;

    [LineStart(58834)]
    local procedure UpdateProdOrderCompStats(var ReservEntrySummary: Record "Entry Summary"; AvailabilityDate: Date; i: Integer; var CalcSumValue: Decimal);
    begin
        IF CalcProdOrderComp.READPERMISSION THEN BEGIN
            InitFilter(ValueArray[i], AvailabilityDate);
            IF CalcProdOrderComp.FINDSET THEN
                REPEAT
                    CalcProdOrderComp.CALCFIELDS("Reserved Qty. (Base)");
                    ReservEntrySummary."Total Reserved Quantity" -= CalcProdOrderComp."Reserved Qty. (Base)";
                    CalcSumValue += CalcProdOrderComp."Remaining Qty. (Base)";
                UNTIL CalcProdOrderComp.NEXT = 0;

            IF CalcSumValue <> 0 THEN
                WITH ReservEntrySummary DO
                    IF (CalcSumValue < 0) = Positive THEN BEGIN
                        "Table ID" := DATABASE::"Prod. Order Component";
                        IF "Entry No." = 73 THEN
                            "Summary Type" :=
                              COPYSTR(STRSUBSTNO(Text000, CalcProdOrderComp.TABLECAPTION), 1, MAXSTRLEN("Summary Type"))
                        ELSE
                            "Summary Type" :=
                              COPYSTR(STRSUBSTNO(Text001, CalcProdOrderComp.TABLECAPTION), 1, MAXSTRLEN("Summary Type"));
                        "Total Quantity" := -CalcSumValue;
                        "Total Available Quantity" := "Total Quantity" - "Total Reserved Quantity";
                        IF NOT INSERT THEN
                            MODIFY;
                    END;
        END;
    end;

    [LineStart(58861)]
    local procedure UpdateTransLineStats(var ReservEntrySummary: Record "Entry Summary"; AvailabilityDate: Date; i: Integer; var CalcSumValue: Decimal);
    begin
        IF CalcTransLine.READPERMISSION THEN BEGIN
            InitFilter(ValueArray[i], AvailabilityDate);
            IF CalcTransLine.FINDSET THEN
                REPEAT
                    CASE ValueArray[i] OF
                        101:
                            BEGIN
                                CalcTransLine.CALCFIELDS("Reserved Qty. Outbnd. (Base)");
                                ReservEntrySummary."Total Reserved Quantity" -= CalcTransLine."Reserved Qty. Outbnd. (Base)";
                                CalcSumValue -= CalcTransLine."Outstanding Qty. (Base)";
                            END;
                        102:
                            BEGIN
                                CalcTransLine.CALCFIELDS("Reserved Qty. Inbnd. (Base)");
                                ReservEntrySummary."Total Reserved Quantity" += CalcTransLine."Reserved Qty. Inbnd. (Base)";
                                CalcSumValue += CalcTransLine."Outstanding Qty. (Base)";
                            END;
                    END;
                UNTIL CalcTransLine.NEXT = 0;

            IF CalcSumValue <> 0 THEN
                WITH ReservEntrySummary DO
                    IF (CalcSumValue > 0) = Positive THEN BEGIN
                        "Table ID" := DATABASE::"Transfer Line";
                        "Summary Type" :=
                          COPYSTR(
                            STRSUBSTNO('%1, %2', CalcTransLine.TABLECAPTION, SELECTSTR(ValueArray[i] - 100, Text006)),
                            1, MAXSTRLEN("Summary Type"));
                        "Total Quantity" := CalcSumValue;
                        "Total Available Quantity" := "Total Quantity" - "Total Reserved Quantity";
                        IF NOT INSERT THEN
                            MODIFY;
                    END;
        END;
    end;

    [LineStart(58897)]
    local procedure UpdateServLineStats(var ReservEntrySummary: Record "Entry Summary"; AvailabilityDate: Date; i: Integer; var CalcSumValue: Decimal);
    begin
        IF CalcServiceLine.READPERMISSION THEN BEGIN
            InitFilter(ValueArray[i], AvailabilityDate);
            IF CalcServiceLine.FINDSET THEN
                REPEAT
                    CalcServiceLine.CALCFIELDS("Reserved Qty. (Base)");
                    ReservEntrySummary."Total Reserved Quantity" -= CalcServiceLine."Reserved Qty. (Base)";
                    CalcSumValue += CalcServiceLine."Outstanding Qty. (Base)";
                UNTIL CalcServiceLine.NEXT = 0;

            IF CalcSumValue <> 0 THEN
                WITH ReservEntrySummary DO
                    IF (CalcSumValue < 0) = Positive THEN BEGIN
                        "Table ID" := DATABASE::"Service Line";
                        "Summary Type" :=
                          COPYSTR(STRSUBSTNO('%1', CalcServiceLine.TABLECAPTION), 1, MAXSTRLEN("Summary Type"));
                        "Total Quantity" := -CalcSumValue;
                        "Total Available Quantity" := "Total Quantity" - "Total Reserved Quantity";
                        IF NOT INSERT THEN
                            MODIFY;
                    END;
        END;
    end;

    [LineStart(58920)]
    local procedure UpdateJobPlanningLineStats(var ReservEntrySummary: Record "Entry Summary"; AvailabilityDate: Date; i: Integer; var CalcSumValue: Decimal);
    begin
        IF CalcJobPlanningLine.READPERMISSION THEN BEGIN
            InitFilter(ValueArray[i], AvailabilityDate);
            IF CalcJobPlanningLine.FINDSET THEN
                REPEAT
                    CalcJobPlanningLine.CALCFIELDS("Reserved Qty. (Base)");
                    ReservEntrySummary."Total Reserved Quantity" -= CalcJobPlanningLine."Reserved Qty. (Base)";
                    CalcSumValue += CalcJobPlanningLine."Remaining Qty. (Base)";
                UNTIL CalcJobPlanningLine.NEXT = 0;

            IF CalcSumValue <> 0 THEN
                WITH ReservEntrySummary DO
                    IF (CalcSumValue < 0) = Positive THEN BEGIN
                        "Table ID" := DATABASE::"Job Planning Line";
                        "Summary Type" :=
                          COPYSTR(
                            STRSUBSTNO('%1, %2', CalcJobPlanningLine.TABLECAPTION, CalcJobPlanningLine.Status),
                            1, MAXSTRLEN("Summary Type"));
                        "Total Quantity" := -CalcSumValue;
                        "Total Available Quantity" := "Total Quantity" - "Total Reserved Quantity";
                        IF NOT INSERT THEN
                            MODIFY;
                    END;
        END;
    end;

    [LineStart(58945)]
    local procedure UpdateItemTrackingLineStats(var ReservEntrySummary: Record "Entry Summary"; AvailabilityDate: Date);
    var
        ReservEntry: Record "Reservation Entry";
    begin
        ReservEntry.RESET;
        ReservEntry.SETCURRENTKEY(
          "Item No.", "Source Type", "Source Subtype", "Reservation Status", "Location Code",
          "Variant Code", "Shipment Date", "Expected Receipt Date", "Serial No.", "Lot No.");
        ReservEntry.SETRANGE("Item No.", CalcReservEntry."Item No.");
        ReservEntry.SETFILTER("Source Type", '<> %1', DATABASE::"Item Ledger Entry");
        ReservEntry.SETRANGE("Reservation Status",
          ReservEntry."Reservation Status"::Reservation, ReservEntry."Reservation Status"::Surplus);
        ReservEntry.SETRANGE("Location Code", CalcReservEntry."Location Code");
        ReservEntry.SETRANGE("Variant Code", CalcReservEntry."Variant Code");
        IF Positive THEN
            ReservEntry.SETFILTER("Expected Receipt Date", '..%1', AvailabilityDate)
        ELSE
            ReservEntry.SETFILTER("Shipment Date", '>=%1', AvailabilityDate);
        ReservEntry.SETRANGE("Serial No.", CalcReservEntry."Serial No.");
        ReservEntry.SETRANGE("Lot No.", CalcReservEntry."Lot No.");
        ReservEntry.SETRANGE(Positive, Positive);
        IF ReservEntry.FINDSET THEN
            REPEAT
                ReservEntry.SETRANGE("Source Type", ReservEntry."Source Type");
                ReservEntry.SETRANGE("Source Subtype", ReservEntry."Source Subtype");
                ReservEntrySummary.INIT;
                ReservEntrySummary."Entry No." := ReservEntry.SummEntryNo;
                ReservEntrySummary."Table ID" := ReservEntry."Source Type";
                ReservEntrySummary."Summary Type" :=
                  COPYSTR(ReservEntry.TextCaption, 1, MAXSTRLEN(ReservEntrySummary."Summary Type"));
                ReservEntrySummary."Source Subtype" := ReservEntry."Source Subtype";
                ReservEntrySummary."Serial No." := ReservEntry."Serial No.";
                ReservEntrySummary."Lot No." := ReservEntry."Lot No.";
                IF ReservEntry.FINDSET THEN
                    REPEAT
                        ReservEntrySummary."Total Quantity" += ReservEntry."Quantity (Base)";
                        IF ReservEntry."Reservation Status" = ReservEntry."Reservation Status"::Reservation THEN
                            ReservEntrySummary."Total Reserved Quantity" += ReservEntry."Quantity (Base)";
                        IF CreateReservEntry.HasSamePointer(ReservEntry, CalcReservEntry) THEN
                            ReservEntrySummary."Current Reserved Quantity" += ReservEntry."Quantity (Base)";
                    UNTIL ReservEntry.NEXT = 0;

                ReservEntrySummary."Total Available Quantity" :=
                  ReservEntrySummary."Total Quantity" - ReservEntrySummary."Total Reserved Quantity";
                ReservEntrySummary.INSERT;
                ReservEntry.SETRANGE("Source Type");
                ReservEntry.SETRANGE("Source Subtype");
            UNTIL ReservEntry.NEXT = 0;
    end;

    [LineStart(58991)]
    procedure AutoReserve(var FullAutoReservation: Boolean; Description: Text[50]; AvailabilityDate: Date; MaxQtyToReserve: Decimal; MaxQtyToReserveBase: Decimal);
    var
        RemainingQtyToReserve: Decimal;
        RemainingQtyToReserveBase: Decimal;
        i: Integer;
        StopReservation: Boolean;
    begin
        CalcReservEntry.TESTFIELD("Source Type");

        IF CalcReservEntry."Source Type" IN [DATABASE::"Sales Line", DATABASE::"Purchase Line", DATABASE::"Service Line"] THEN
            StopReservation := NOT (CalcReservEntry."Source Subtype" IN [1, 5]); // Only order and return order

        IF CalcReservEntry."Source Type" IN [DATABASE::"Assembly Line", DATABASE::"Assembly Header"] THEN
            StopReservation := NOT (CalcReservEntry."Source Subtype" = 1); // Only Assembly Order

        IF CalcReservEntry."Source Type" IN [DATABASE::"Prod. Order Line", DATABASE::"Prod. Order Component"]
        THEN
            StopReservation := CalcReservEntry."Source Subtype" < 2; // Not simulated or planned

        IF CalcReservEntry."Source Type" = DATABASE::"Sales Line" THEN
            IF (CalcReservEntry."Source Subtype" = 1) AND (ForSalesLine.Quantity < 0) THEN
                StopReservation := TRUE;

        IF CalcReservEntry."Source Type" = DATABASE::"Sales Line" THEN
            IF (CalcReservEntry."Source Subtype" = 5) AND (ForSalesLine.Quantity >= 0) THEN
                StopReservation := TRUE;

        IF StopReservation THEN BEGIN
            FullAutoReservation := TRUE;
            EXIT;
        END;

        CalculateRemainingQty(RemainingQtyToReserve, RemainingQtyToReserveBase);
        IF (MaxQtyToReserveBase <> 0) AND (ABS(MaxQtyToReserveBase) < ABS(RemainingQtyToReserveBase)) THEN BEGIN
            RemainingQtyToReserve := MaxQtyToReserve;
            RemainingQtyToReserveBase := MaxQtyToReserveBase;
        END;

        IF (RemainingQtyToReserveBase <> 0) AND
           HandleItemTracking AND
           ItemTrackingCode."SN Specific Tracking"
        THEN
            RemainingQtyToReserveBase := 1;
        FullAutoReservation := FALSE;

        IF RemainingQtyToReserveBase = 0 THEN BEGIN
            FullAutoReservation := TRUE;
            EXIT;
        END;

        FOR i := 1 TO SetValueArray(0) DO
            AutoReserveOneLine(ValueArray[i], RemainingQtyToReserve, RemainingQtyToReserveBase, Description, AvailabilityDate);

        FullAutoReservation := (RemainingQtyToReserveBase = 0);
    end;

    [LineStart(59040)]
    procedure AutoReserveOneLine(ReservSummEntryNo: Integer; var RemainingQtyToReserve: Decimal; var RemainingQtyToReserveBase: Decimal; Description: Text[50]; AvailabilityDate: Date);
    var
        Item: Record Item;
        Search: Text[1];
        NextStep: Integer;
    begin
        CalcReservEntry.TESTFIELD("Source Type");

        IF RemainingQtyToReserveBase = 0 THEN
            EXIT;

        IF NOT Item.GET(CalcReservEntry."Item No.") THEN
            CLEAR(Item);

        CalcReservEntry.Lock;

        IF Positive THEN BEGIN
            Search := '+';
            NextStep := -1;
            IF Item."Costing Method" = Item."Costing Method"::LIFO THEN BEGIN
                InvSearch := '+';
                InvNextStep := -1;
            END ELSE BEGIN
                InvSearch := '-';
                InvNextStep := 1;
            END;
        END ELSE BEGIN
            Search := '-';
            NextStep := 1;
            InvSearch := '-';
            InvNextStep := 1;
        END;

        CASE ReservSummEntryNo OF
            1: // Item Ledger Entry
                AutoReserveItemLedgEntry(ReservSummEntryNo, RemainingQtyToReserve, RemainingQtyToReserveBase, Description, AvailabilityDate);
            12,
          16: // Purchase Line, Purchase Return Line
                AutoReservePurchLine(ReservSummEntryNo, RemainingQtyToReserve, RemainingQtyToReserveBase, Description, AvailabilityDate,
                  Search, NextStep);
            21: // Requisition Line
                AutoReserveReqLine(ReservSummEntryNo, AvailabilityDate);
            31,
          32,
          36: // Sales Line, Sales Return Line
                AutoReserveSalesLine(ReservSummEntryNo, RemainingQtyToReserve, RemainingQtyToReserveBase, Description, AvailabilityDate,
                  Search, NextStep);
            61,
          62,
          63,
          64: // Prod. Order
                AutoReserveProdOrderLine(ReservSummEntryNo, RemainingQtyToReserve, RemainingQtyToReserveBase, Description, AvailabilityDate,
                  Search, NextStep);
            71,
          72,
          73,
          74: // Prod. Order Component
                AutoReserveProdOrderComp(ReservSummEntryNo, RemainingQtyToReserve, RemainingQtyToReserveBase, Description, AvailabilityDate,
                  Search, NextStep);
            91: // Planning Component
                AutoReservePlanningComp(ReservSummEntryNo, AvailabilityDate);
            101,
          102: // Transfer
                AutoReserveTransLine(ReservSummEntryNo, RemainingQtyToReserve, RemainingQtyToReserveBase, Description, AvailabilityDate,
                  Search, NextStep);
            110: // Service Line Order
                AutoReserveServLine(ReservSummEntryNo, RemainingQtyToReserve, RemainingQtyToReserveBase, Description, AvailabilityDate,
                  Search, NextStep);
            133: // Job Planning Line Order
                AutoReserveJobPlanningLine(ReservSummEntryNo, RemainingQtyToReserve, RemainingQtyToReserveBase, Description, AvailabilityDate,
                  Search, NextStep);
            142: // Assembly Header
                AutoReserveAssemblyHeader(ReservSummEntryNo, RemainingQtyToReserve, RemainingQtyToReserveBase, Description, AvailabilityDate,
                  Search, NextStep);
            152: // Assembly Line
                AutoReserveAssemblyLine(ReservSummEntryNo, RemainingQtyToReserve, RemainingQtyToReserveBase, Description, AvailabilityDate,
                  Search, NextStep);
        END;
    end;

    [LineStart(59114)]
    local procedure AutoReserveItemLedgEntry(ReservSummEntryNo: Integer; var RemainingQtyToReserve: Decimal; var RemainingQtyToReserveBase: Decimal; Description: Text[50]; AvailabilityDate: Date);
    var
        Location: Record Location;
        LateBindingMgt: Codeunit "Late Binding Management";
        AllocationsChanged: Boolean;
        QtyThisLine: Decimal;
        QtyThisLineBase: Decimal;
    begin
        IF NOT Location.GET(CalcReservEntry."Location Code") THEN
            CLEAR(Location);

        InitFilter(ReservSummEntryNo, AvailabilityDate);
        // Late Binding
        IF HandleItemTracking THEN
            AllocationsChanged :=
              LateBindingMgt.ReleaseForReservation3(CalcItemLedgEntry, CalcReservEntry, RemainingQtyToReserveBase);

        IF CalcItemLedgEntry.FIND(InvSearch) THEN BEGIN
            IF Location."Bin Mandatory" OR Location."Require Pick" THEN BEGIN
                QtyOnOutBound :=
                  CreatePick.CheckOutBound(
                    CalcReservEntry."Source Type", CalcReservEntry."Source Subtype",
                    CalcReservEntry."Source ID", CalcReservEntry."Source Ref. No.",
                    CalcReservEntry."Source Prod. Order Line") -
                  CalcCurrLineReservQtyOnPicksShips(
                    CalcReservEntry."Source Type", CalcReservEntry."Source Subtype",
                    CalcReservEntry."Source ID", CalcReservEntry."Source Ref. No.",
                    CalcReservEntry."Source Prod. Order Line");
                IF AllocationsChanged THEN
                    CalcReservedQtyOnPick(TotalAvailQty, QtyAllocInWhse); // If allocations have changed we must recalculate
            END;
            REPEAT
                CalcItemLedgEntry.CALCFIELDS("Reserved Quantity");
                IF (CalcItemLedgEntry."Remaining Quantity" -
                    CalcItemLedgEntry."Reserved Quantity") <> 0
                THEN BEGIN
                    IF ABS(CalcItemLedgEntry."Remaining Quantity" -
                         CalcItemLedgEntry."Reserved Quantity") > ABS(RemainingQtyToReserveBase)
                    THEN BEGIN
                        QtyThisLine := ABS(RemainingQtyToReserve);
                        QtyThisLineBase := ABS(RemainingQtyToReserveBase);
                    END ELSE BEGIN
                        QtyThisLineBase :=
                          CalcItemLedgEntry."Remaining Quantity" - CalcItemLedgEntry."Reserved Quantity";
                        QtyThisLine := 0;
                    END;
                    IF IsSpecialOrder(CalcItemLedgEntry."Purchasing Code") OR (Positive = (QtyThisLineBase < 0)) THEN BEGIN
                        QtyThisLineBase := 0;
                        QtyThisLine := 0;
                    END;

                    IF (Location."Bin Mandatory" OR Location."Require Pick") AND
                       (TotalAvailQty + QtyOnOutBound < QtyThisLineBase)
                    THEN
                        IF (TotalAvailQty + QtyOnOutBound) < 0 THEN BEGIN
                            QtyThisLineBase := 0;
                            QtyThisLine := 0
                        END ELSE BEGIN
                            QtyThisLineBase := TotalAvailQty + QtyOnOutBound;
                            QtyThisLine := ROUND(QtyThisLineBase, 0.00001);
                        END;

                    CreateTrackingSpecification(CallTrackingSpecification,
                      DATABASE::"Item Ledger Entry", 0, '', '', 0, CalcItemLedgEntry."Entry No.",
                      CalcItemLedgEntry."Variant Code", CalcItemLedgEntry."Location Code",
                      CalcItemLedgEntry."Serial No.", CalcItemLedgEntry."Lot No.",
                      CalcItemLedgEntry."Qty. per Unit of Measure");

                    IF CallCreateReservation(RemainingQtyToReserve, RemainingQtyToReserveBase, 0,
                         Description, 0D, QtyThisLine, QtyThisLineBase, CallTrackingSpecification)
                    THEN
                        IF Location."Bin Mandatory" OR Location."Require Pick" THEN
                            TotalAvailQty := TotalAvailQty - QtyThisLineBase;
                END;
            UNTIL (CalcItemLedgEntry.NEXT(InvNextStep) = 0) OR (RemainingQtyToReserveBase = 0);
        END;
    end;

    [LineStart(59184)]
    local procedure AutoReservePurchLine(ReservSummEntryNo: Integer; var RemainingQtyToReserve: Decimal; var RemainingQtyToReserveBase: Decimal; Description: Text[50]; AvailabilityDate: Date; Search: Text[1]; NextStep: Integer);
    var
        QtyThisLine: Decimal;
        QtyThisLineBase: Decimal;
        ReservQty: Decimal;
    begin
        InitFilter(ReservSummEntryNo, AvailabilityDate);
        IF CalcPurchLine.FIND(Search) THEN
            REPEAT
                CalcPurchLine.CALCFIELDS("Reserved Qty. (Base)");
                IF NOT CalcPurchLine."Special Order" THEN BEGIN
                    QtyThisLine := CalcPurchLine."Outstanding Quantity";
                    QtyThisLineBase := CalcPurchLine."Outstanding Qty. (Base)";
                END;
                IF ReservSummEntryNo = 16 THEN // Return Order
                    ReservQty := -CalcPurchLine."Reserved Qty. (Base)"
                ELSE
                    ReservQty := CalcPurchLine."Reserved Qty. (Base)";
                IF (Positive = (QtyThisLineBase < 0)) AND (ReservSummEntryNo <> 16) OR
                   (Positive = (QtyThisLineBase > 0)) AND (ReservSummEntryNo = 16)
                THEN BEGIN
                    QtyThisLine := 0;
                    QtyThisLineBase := 0;
                END;

                CreateTrackingSpecification(CallTrackingSpecification,
                  DATABASE::"Purchase Line", CalcPurchLine."Document Type", CalcPurchLine."Document No.", '',
                  0, CalcPurchLine."Line No.",
                  CalcPurchLine."Variant Code", CalcPurchLine."Location Code",
                  CalcReservEntry."Serial No.", CalcReservEntry."Lot No.",
                  CalcPurchLine."Qty. per Unit of Measure");

                CallCreateReservation(RemainingQtyToReserve, RemainingQtyToReserveBase, ReservQty,
                  Description, CalcPurchLine."Expected Receipt Date", QtyThisLine, QtyThisLineBase, CallTrackingSpecification);
            UNTIL (CalcPurchLine.NEXT(NextStep) = 0) OR (RemainingQtyToReserveBase = 0);
    end;

    [LineStart(59215)]
    local procedure AutoReserveReqLine(ReservSummEntryNo: Integer; AvailabilityDate: Date);
    begin
        InitFilter(ReservSummEntryNo, AvailabilityDate);
    end;

    [LineStart(59218)]
    local procedure AutoReserveSalesLine(ReservSummEntryNo: Integer; var RemainingQtyToReserve: Decimal; var RemainingQtyToReserveBase: Decimal; Description: Text[50]; AvailabilityDate: Date; Search: Text[1]; NextStep: Integer);
    var
        QtyThisLine: Decimal;
        QtyThisLineBase: Decimal;
        ReservQty: Decimal;
    begin
        InitFilter(ReservSummEntryNo, AvailabilityDate);
        IF CalcSalesLine.FIND(Search) THEN
            REPEAT
                CalcSalesLine.CALCFIELDS("Reserved Qty. (Base)");
                QtyThisLine := CalcSalesLine."Outstanding Quantity";
                QtyThisLineBase := CalcSalesLine."Outstanding Qty. (Base)";
                IF ReservSummEntryNo = 36 THEN // Return Order
                    ReservQty := -CalcSalesLine."Reserved Qty. (Base)"
                ELSE
                    ReservQty := CalcSalesLine."Reserved Qty. (Base)";
                IF (Positive = (QtyThisLineBase > 0)) AND (ReservSummEntryNo <> 36) OR
                   (Positive = (QtyThisLineBase < 0)) AND (ReservSummEntryNo = 36)
                THEN BEGIN
                    QtyThisLine := 0;
                    QtyThisLineBase := 0;
                END;

                CreateTrackingSpecification(CallTrackingSpecification,
                  DATABASE::"Sales Line", CalcSalesLine."Document Type", CalcSalesLine."Document No.", '',
                  0, CalcSalesLine."Line No.", CalcSalesLine."Variant Code", CalcSalesLine."Location Code",
                  CalcReservEntry."Serial No.", CalcReservEntry."Lot No.",
                  CalcSalesLine."Qty. per Unit of Measure");

                CallCreateReservation(RemainingQtyToReserve, RemainingQtyToReserveBase, ReservQty,
                  Description, CalcSalesLine."Shipment Date", QtyThisLine, QtyThisLineBase, CallTrackingSpecification);
            UNTIL (CalcSalesLine.NEXT(NextStep) = 0) OR (RemainingQtyToReserveBase = 0);
    end;

    [LineStart(59246)]
    local procedure AutoReserveProdOrderLine(ReservSummEntryNo: Integer; var RemainingQtyToReserve: Decimal; var RemainingQtyToReserveBase: Decimal; Description: Text[50]; AvailabilityDate: Date; Search: Text[1]; NextStep: Integer);
    var
        QtyThisLine: Decimal;
        QtyThisLineBase: Decimal;
        ReservQty: Decimal;
    begin
        InitFilter(ReservSummEntryNo, AvailabilityDate);
        IF CalcProdOrderLine.FIND(Search) THEN
            REPEAT
                CalcProdOrderLine.CALCFIELDS("Reserved Qty. (Base)");
                QtyThisLine := CalcProdOrderLine."Remaining Quantity";
                QtyThisLineBase := CalcProdOrderLine."Remaining Qty. (Base)";
                ReservQty := CalcProdOrderLine."Reserved Qty. (Base)";
                IF Positive = (QtyThisLineBase < 0) THEN BEGIN
                    QtyThisLine := 0;
                    QtyThisLineBase := 0;
                END;

                CreateTrackingSpecification(CallTrackingSpecification,
                  DATABASE::"Prod. Order Line", CalcProdOrderLine.Status, CalcProdOrderLine."Prod. Order No.", '',
                  CalcProdOrderLine."Line No.", 0, CalcProdOrderLine."Variant Code", CalcProdOrderLine."Location Code",
                  CalcReservEntry."Serial No.", CalcReservEntry."Lot No.",
                  CalcProdOrderLine."Qty. per Unit of Measure");

                CallCreateReservation(RemainingQtyToReserve, RemainingQtyToReserveBase, ReservQty,
                  Description, CalcProdOrderLine."Due Date", QtyThisLine, QtyThisLineBase, CallTrackingSpecification);
            UNTIL (CalcProdOrderLine.NEXT(NextStep) = 0) OR (RemainingQtyToReserveBase = 0);
    end;

    [LineStart(59269)]
    local procedure AutoReserveProdOrderComp(ReservSummEntryNo: Integer; var RemainingQtyToReserve: Decimal; var RemainingQtyToReserveBase: Decimal; Description: Text[50]; AvailabilityDate: Date; Search: Text[1]; NextStep: Integer);
    var
        QtyThisLine: Decimal;
        QtyThisLineBase: Decimal;
        ReservQty: Decimal;
    begin
        InitFilter(ReservSummEntryNo, AvailabilityDate);
        IF CalcProdOrderComp.FIND(Search) THEN
            REPEAT
                CalcProdOrderComp.CALCFIELDS("Reserved Qty. (Base)");
                QtyThisLine := CalcProdOrderComp."Remaining Quantity";
                QtyThisLineBase := CalcProdOrderComp."Remaining Qty. (Base)";
                ReservQty := CalcProdOrderComp."Reserved Qty. (Base)";
                IF Positive = (QtyThisLineBase > 0) THEN BEGIN
                    QtyThisLine := 0;
                    QtyThisLineBase := 0;
                END;

                CreateTrackingSpecification(CallTrackingSpecification,
                  DATABASE::"Prod. Order Component", CalcProdOrderComp.Status, CalcProdOrderComp."Prod. Order No.", '',
                  CalcProdOrderComp."Prod. Order Line No.", CalcProdOrderComp."Line No.",
                  CalcProdOrderComp."Variant Code", CalcProdOrderComp."Location Code",
                  CalcReservEntry."Serial No.", CalcReservEntry."Lot No.",
                  CalcProdOrderComp."Qty. per Unit of Measure");

                CallCreateReservation(RemainingQtyToReserve, RemainingQtyToReserveBase, ReservQty,
                  Description, CalcProdOrderComp."Due Date", QtyThisLine, QtyThisLineBase, CallTrackingSpecification);
            UNTIL (CalcProdOrderComp.NEXT(NextStep) = 0) OR (RemainingQtyToReserveBase = 0);
    end;

    [LineStart(59293)]
    local procedure AutoReserveAssemblyHeader(ReservSummEntryNo: Integer; var RemainingQtyToReserve: Decimal; var RemainingQtyToReserveBase: Decimal; Description: Text[50]; AvailabilityDate: Date; Search: Text[1]; NextStep: Integer);
    var
        QtyThisLine: Decimal;
        QtyThisLineBase: Decimal;
        ReservQty: Decimal;
    begin
        InitFilter(ReservSummEntryNo, AvailabilityDate);
        IF CalcAssemblyHeader.FIND(Search) THEN
            REPEAT
                CalcAssemblyHeader.CALCFIELDS("Reserved Qty. (Base)");
                QtyThisLine := CalcAssemblyHeader."Remaining Quantity";
                QtyThisLineBase := CalcAssemblyHeader."Remaining Quantity (Base)";
                ReservQty := CalcAssemblyHeader."Reserved Qty. (Base)";
                IF Positive = (QtyThisLineBase < 0) THEN BEGIN
                    QtyThisLine := 0;
                    QtyThisLineBase := 0;
                END;

                CreateTrackingSpecification(CallTrackingSpecification,
                  DATABASE::"Assembly Header", CalcAssemblyHeader."Document Type", CalcAssemblyHeader."No.", '',
                  0, 0, CalcAssemblyHeader."Variant Code", CalcAssemblyHeader."Location Code",
                  CalcReservEntry."Serial No.", CalcReservEntry."Lot No.",
                  CalcAssemblyHeader."Qty. per Unit of Measure");

                CallCreateReservation(RemainingQtyToReserve, RemainingQtyToReserveBase, ReservQty,
                  Description, CalcAssemblyHeader."Due Date", QtyThisLine, QtyThisLineBase, CallTrackingSpecification);
            UNTIL (CalcAssemblyHeader.NEXT(NextStep) = 0) OR (RemainingQtyToReserveBase = 0);
    end;

    [LineStart(59316)]
    local procedure AutoReserveAssemblyLine(ReservSummEntryNo: Integer; var RemainingQtyToReserve: Decimal; var RemainingQtyToReserveBase: Decimal; Description: Text[50]; AvailabilityDate: Date; Search: Text[1]; NextStep: Integer);
    var
        QtyThisLine: Decimal;
        QtyThisLineBase: Decimal;
        ReservQty: Decimal;
    begin
        InitFilter(ReservSummEntryNo, AvailabilityDate);
        IF CalcAssemblyLine.FIND(Search) THEN
            REPEAT
                CalcAssemblyLine.CALCFIELDS("Reserved Qty. (Base)");
                QtyThisLine := CalcAssemblyLine."Remaining Quantity";
                QtyThisLineBase := CalcAssemblyLine."Remaining Quantity (Base)";
                ReservQty := CalcAssemblyLine."Reserved Qty. (Base)";
                IF Positive = (QtyThisLineBase > 0) THEN BEGIN
                    QtyThisLine := 0;
                    QtyThisLineBase := 0;
                END;

                CreateTrackingSpecification(CallTrackingSpecification,
                  DATABASE::"Assembly Line", CalcAssemblyLine."Document Type", CalcAssemblyLine."Document No.", '',
                  0, CalcAssemblyLine."Line No.", CalcAssemblyLine."Variant Code", CalcAssemblyLine."Location Code",
                  CalcReservEntry."Serial No.", CalcReservEntry."Lot No.",
                  CalcAssemblyLine."Qty. per Unit of Measure");

                CallCreateReservation(RemainingQtyToReserve, RemainingQtyToReserveBase, ReservQty,
                  Description, CalcAssemblyHeader."Due Date", QtyThisLine, QtyThisLineBase, CallTrackingSpecification);
            UNTIL (CalcAssemblyLine.NEXT(NextStep) = 0) OR (RemainingQtyToReserveBase = 0);
    end;

    [LineStart(59339)]
    local procedure AutoReservePlanningComp(ReservSummEntryNo: Integer; AvailabilityDate: Date);
    begin
        InitFilter(ReservSummEntryNo, AvailabilityDate);
    end;

    [LineStart(59342)]
    local procedure AutoReserveTransLine(ReservSummEntryNo: Integer; var RemainingQtyToReserve: Decimal; var RemainingQtyToReserveBase: Decimal; Description: Text[50]; AvailabilityDate: Date; Search: Text[1]; NextStep: Integer);
    var
        QtyThisLine: Decimal;
        QtyThisLineBase: Decimal;
        ReservQty: Decimal;
        LocationCode: Code[10];
        EntryDate: Date;
    begin
        InitFilter(ReservSummEntryNo, AvailabilityDate);
        IF CalcTransLine.FIND(Search) THEN
            REPEAT
                CASE ReservSummEntryNo OF
                    101: // Outbound
                        BEGIN
                            CalcTransLine.CALCFIELDS("Reserved Qty. Outbnd. (Base)");
                            QtyThisLine := -CalcTransLine."Outstanding Quantity";
                            QtyThisLineBase := -CalcTransLine."Outstanding Qty. (Base)";
                            ReservQty := -CalcTransLine."Reserved Qty. Outbnd. (Base)";
                            EntryDate := CalcTransLine."Shipment Date";
                            LocationCode := CalcTransLine."Transfer-from Code";
                            IF Positive = (QtyThisLineBase < 0) THEN BEGIN
                                QtyThisLine := 0;
                                QtyThisLineBase := 0;
                            END;
                        END;
                    102: // Inbound
                        BEGIN
                            CalcTransLine.CALCFIELDS("Reserved Qty. Inbnd. (Base)");
                            QtyThisLine := CalcTransLine."Outstanding Quantity";
                            QtyThisLineBase := CalcTransLine."Outstanding Qty. (Base)";
                            ReservQty := CalcTransLine."Reserved Qty. Inbnd. (Base)";
                            EntryDate := CalcTransLine."Receipt Date";
                            LocationCode := CalcTransLine."Transfer-to Code";
                            IF Positive = (QtyThisLineBase < 0) THEN BEGIN
                                QtyThisLine := 0;
                                QtyThisLineBase := 0;
                            END;
                        END;
                END;

                CreateTrackingSpecification(CallTrackingSpecification,
                  DATABASE::"Transfer Line", ReservSummEntryNo - 101, CalcTransLine."Document No.", '',
                  CalcTransLine."Derived From Line No.", CalcTransLine."Line No.",
                  CalcTransLine."Variant Code", LocationCode,
                  CalcReservEntry."Serial No.", CalcReservEntry."Lot No.",
                  CalcTransLine."Qty. per Unit of Measure");

                CallCreateReservation(RemainingQtyToReserve, RemainingQtyToReserveBase, ReservQty,
                  Description, EntryDate, QtyThisLine, QtyThisLineBase, CallTrackingSpecification);
            UNTIL (CalcTransLine.NEXT(NextStep) = 0) OR (RemainingQtyToReserveBase = 0);
    end;

    [LineStart(59386)]
    local procedure AutoReserveServLine(ReservSummEntryNo: Integer; var RemainingQtyToReserve: Decimal; var RemainingQtyToReserveBase: Decimal; Description: Text[50]; AvailabilityDate: Date; Search: Text[1]; NextStep: Integer);
    var
        QtyThisLine: Decimal;
        QtyThisLineBase: Decimal;
        ReservQty: Decimal;
    begin
        InitFilter(ReservSummEntryNo, AvailabilityDate);
        IF CalcServiceLine.FIND(Search) THEN
            REPEAT
                CalcServiceLine.CALCFIELDS("Reserved Qty. (Base)");
                QtyThisLine := CalcServiceLine."Outstanding Quantity";
                QtyThisLineBase := CalcServiceLine."Outstanding Qty. (Base)";
                ReservQty := CalcServiceLine."Reserved Qty. (Base)";
                IF Positive = (QtyThisLineBase > 0) THEN BEGIN
                    QtyThisLine := 0;
                    QtyThisLineBase := 0;
                END;

                CreateTrackingSpecification(CallTrackingSpecification,
                  DATABASE::"Service Line", CalcServiceLine."Document Type", CalcServiceLine."Document No.", '',
                  0, CalcServiceLine."Line No.", CalcServiceLine."Variant Code", CalcServiceLine."Location Code",
                  CalcReservEntry."Serial No.", CalcReservEntry."Lot No.",
                  CalcServiceLine."Qty. per Unit of Measure");

                CallCreateReservation(RemainingQtyToReserve, RemainingQtyToReserveBase, ReservQty,
                  Description, CalcServiceLine."Needed by Date", QtyThisLine, QtyThisLineBase, CallTrackingSpecification);
            UNTIL (CalcServiceLine.NEXT(NextStep) = 0) OR (RemainingQtyToReserveBase = 0);
    end;

    [LineStart(59409)]
    local procedure AutoReserveJobPlanningLine(ReservSummEntryNo: Integer; var RemainingQtyToReserve: Decimal; var RemainingQtyToReserveBase: Decimal; Description: Text[50]; AvailabilityDate: Date; Search: Text[1]; NextStep: Integer);
    var
        QtyThisLine: Decimal;
        QtyThisLineBase: Decimal;
        ReservQty: Decimal;
    begin
        InitFilter(ReservSummEntryNo, AvailabilityDate);
        IF CalcJobPlanningLine.FIND(Search) THEN
            REPEAT
                CalcJobPlanningLine.CALCFIELDS("Reserved Qty. (Base)");
                QtyThisLine := CalcJobPlanningLine."Remaining Qty.";
                QtyThisLineBase := CalcJobPlanningLine."Remaining Qty. (Base)";
                ReservQty := CalcJobPlanningLine."Reserved Qty. (Base)";
                IF Positive = (QtyThisLineBase > 0) THEN BEGIN
                    QtyThisLine := 0;
                    QtyThisLineBase := 0;
                END;

                CreateTrackingSpecification(CallTrackingSpecification,
                  DATABASE::"Job Planning Line", CalcJobPlanningLine.Status, CalcJobPlanningLine."Job No.", '',
                  0, CalcJobPlanningLine."Job Contract Entry No.",
                  CalcJobPlanningLine."Variant Code", CalcJobPlanningLine."Location Code",
                  CalcReservEntry."Serial No.", CalcReservEntry."Lot No.",
                  CalcJobPlanningLine."Qty. per Unit of Measure");

                CallCreateReservation(RemainingQtyToReserve, RemainingQtyToReserveBase, ReservQty,
                  Description, CalcJobPlanningLine."Planning Date", QtyThisLine, QtyThisLineBase, CallTrackingSpecification);
            UNTIL (CalcJobPlanningLine.NEXT(NextStep) = 0) OR (RemainingQtyToReserveBase = 0);
    end;

    [LineStart(59433)]
    local procedure CallCreateReservation(var RemainingQtyToReserve: Decimal; var RemainingQtyToReserveBase: Decimal; ReservQty: Decimal; Description: Text[50]; ExpectedDate: Date; QtyThisLine: Decimal; QtyThisLineBase: Decimal; TrackingSpecification: Record "Tracking Specification") ReservationCreated: Boolean;
    begin
        IF QtyThisLineBase = 0 THEN
            EXIT;
        IF ABS(QtyThisLineBase - ReservQty) > 0 THEN BEGIN
            IF ABS(QtyThisLineBase - ReservQty) > ABS(RemainingQtyToReserveBase) THEN BEGIN
                QtyThisLine := RemainingQtyToReserve;
                QtyThisLineBase := RemainingQtyToReserveBase;
            END ELSE BEGIN
                QtyThisLineBase := QtyThisLineBase - ReservQty;
                QtyThisLine := ROUND(RemainingQtyToReserve / RemainingQtyToReserveBase * QtyThisLineBase, 0.00001);
            END;
            CopySign(RemainingQtyToReserveBase, QtyThisLineBase);
            CopySign(RemainingQtyToReserve, QtyThisLine);
            CreateReservation(Description, ExpectedDate, QtyThisLine, QtyThisLineBase, TrackingSpecification);
            RemainingQtyToReserve := RemainingQtyToReserve - QtyThisLine;
            RemainingQtyToReserveBase := RemainingQtyToReserveBase - QtyThisLineBase;
            ReservationCreated := TRUE;
        END;
    end;

    [LineStart(59452)]
    procedure CreateReservation(Description: Text[50]; ExpectedDate: Date; Quantity: Decimal; QuantityBase: Decimal; TrackingSpecification: Record "Tracking Specification");
    begin
        CalcReservEntry.TESTFIELD("Source Type");

        CASE CalcReservEntry."Source Type" OF
            DATABASE::"Sales Line":
                BEGIN
                    ReserveSalesLine.CreateReservationSetFrom(TrackingSpecification);
                    ReserveSalesLine.CreateReservation(
                      ForSalesLine, Description, ExpectedDate, Quantity, QuantityBase,
                      CalcReservEntry."Serial No.", CalcReservEntry."Lot No.");
                    ForSalesLine.CALCFIELDS("Reserved Qty. (Base)");
                END;
            DATABASE::"Requisition Line":
                BEGIN
                    ReserveReqLine.CreateReservationSetFrom(TrackingSpecification);
                    ReserveReqLine.CreateReservation(
                      ForReqLine, Description, ExpectedDate, Quantity, QuantityBase,
                      CalcReservEntry."Serial No.", CalcReservEntry."Lot No.");
                    ForReqLine.CALCFIELDS("Reserved Qty. (Base)");
                END;
            DATABASE::"Purchase Line":
                BEGIN
                    ReservePurchLine.CreateReservationSetFrom(TrackingSpecification);
                    ReservePurchLine.CreateReservation(
                      ForPurchLine, Description, ExpectedDate, Quantity, QuantityBase,
                      CalcReservEntry."Serial No.", CalcReservEntry."Lot No.");
                    ForPurchLine.CALCFIELDS("Reserved Qty. (Base)");
                END;
            DATABASE::"Item Journal Line":
                BEGIN
                    ReserveItemJnlLine.CreateReservationSetFrom(TrackingSpecification);
                    ReserveItemJnlLine.CreateReservation(
                      ForItemJnlLine, Description, ExpectedDate, Quantity, QuantityBase,
                      CalcReservEntry."Serial No.", CalcReservEntry."Lot No.");
                    ForItemJnlLine.CALCFIELDS("Reserved Qty. (Base)");
                END;
            DATABASE::"Prod. Order Line":
                BEGIN
                    ReserveProdOrderLine.CreateReservationSetFrom(TrackingSpecification);
                    ReserveProdOrderLine.CreateReservation(
                      ForProdOrderLine, Description, ExpectedDate, Quantity, QuantityBase,
                      CalcReservEntry."Serial No.", CalcReservEntry."Lot No.");
                    ForProdOrderLine.CALCFIELDS("Reserved Qty. (Base)");
                END;
            DATABASE::"Prod. Order Component":
                BEGIN
                    ReserveProdOrderComp.CreateReservationSetFrom(TrackingSpecification);
                    ReserveProdOrderComp.CreateReservation(
                      ForProdOrderComp, Description, ExpectedDate, Quantity, QuantityBase,
                      CalcReservEntry."Serial No.", CalcReservEntry."Lot No.");
                    ForProdOrderComp.CALCFIELDS("Reserved Qty. (Base)");
                END;
            DATABASE::"Assembly Header":
                BEGIN
                    AssemblyHeaderReserve.CreateReservationSetFrom(TrackingSpecification);
                    AssemblyHeaderReserve.CreateReservation(
                      ForAssemblyHeader, Description, ExpectedDate, Quantity, QuantityBase,
                      CalcReservEntry."Serial No.", CalcReservEntry."Lot No.");
                    ForAssemblyHeader.CALCFIELDS("Reserved Qty. (Base)");
                END;
            DATABASE::"Assembly Line":
                BEGIN
                    AssemblyLineReserve.CreateReservationSetFrom(TrackingSpecification);
                    AssemblyLineReserve.CreateReservation(
                      ForAssemblyLine, Description, ExpectedDate, Quantity, QuantityBase,
                      CalcReservEntry."Serial No.", CalcReservEntry."Lot No.");
                    ForAssemblyLine.CALCFIELDS("Reserved Qty. (Base)");
                END;
            DATABASE::"Planning Component":
                BEGIN
                    ReservePlanningComponent.CreateReservationSetFrom(TrackingSpecification);
                    ReservePlanningComponent.CreateReservation(
                      ForPlanningComponent, Description, ExpectedDate, Quantity, QuantityBase,
                      CalcReservEntry."Serial No.", CalcReservEntry."Lot No.");
                    ForPlanningComponent.CALCFIELDS("Reserved Qty. (Base)");
                END;
            DATABASE::"Transfer Line":
                BEGIN
                    ReserveTransLine.CreateReservationSetFrom(TrackingSpecification);
                    ReserveTransLine.CreateReservation(
                      ForTransLine, Description, ExpectedDate, Quantity, QuantityBase,
                      CalcReservEntry."Serial No.", CalcReservEntry."Lot No.",
                      CalcReservEntry."Source Subtype");
                    ForTransLine.CALCFIELDS("Reserved Qty. Outbnd. (Base)");
                    ForTransLine.CALCFIELDS("Reserved Qty. Inbnd. (Base)");
                END;
            DATABASE::"Service Line":
                BEGIN
                    ReserveServiceInvLine.CreateReservationSetFrom(TrackingSpecification);
                    ReserveServiceInvLine.CreateReservation(
                      ForServiceLine, Description, ExpectedDate, Quantity, QuantityBase,
                      CalcReservEntry."Serial No.", CalcReservEntry."Lot No.");
                    ForServiceLine.CALCFIELDS("Reserved Qty. (Base)");
                END;
            DATABASE::"Job Planning Line":
                BEGIN
                    JobPlanningLineReserve.CreateReservationSetFrom(TrackingSpecification);
                    JobPlanningLineReserve.CreateReservation(
                      ForJobPlanningLine, Description, ExpectedDate, Quantity, QuantityBase,
                      CalcReservEntry."Serial No.", CalcReservEntry."Lot No.");
                    ForJobPlanningLine.CALCFIELDS("Reserved Qty. (Base)");
                END;
        END;
    end;

    [LineStart(59556)]
    procedure DeleteReservEntries(DeleteAll: Boolean; DownToQuantity: Decimal);
    var
        TrackingMgt: Codeunit OrderTrackingManagement;
        ReservMgt: Codeunit "Reservation Management";
        CalcReservEntry4: Record "Reservation Entry";
        QtyToReTrack: Decimal;
        QtyTracked: Decimal;
    begin
        DeleteReservEntries2(DeleteAll, DownToQuantity, CalcReservEntry2);

        // Handle both sides of a req. line related to a transfer line:
        IF ((CalcReservEntry."Source Type" = DATABASE::"Requisition Line") AND
            (ForReqLine."Ref. Order Type" = ForReqLine."Ref. Order Type"::Transfer))
        THEN BEGIN
            CalcReservEntry4 := CalcReservEntry;
            CalcReservEntry4."Source Subtype" := 1;
            SetPointerFilter(CalcReservEntry4);
            DeleteReservEntries2(DeleteAll, DownToQuantity, CalcReservEntry4);
        END;

        IF DeleteAll THEN
            IF ((CalcReservEntry."Source Type" = DATABASE::"Requisition Line") AND
                (ForReqLine."Planning Line Origin" <> ForReqLine."Planning Line Origin"::" ")) OR
               (CalcReservEntry."Source Type" = DATABASE::"Planning Component")
            THEN BEGIN
                CalcReservEntry4.RESET;
                IF TrackingMgt.DerivePlanningFilter(CalcReservEntry2, CalcReservEntry4) THEN
                    IF CalcReservEntry4.FINDFIRST THEN BEGIN
                        QtyToReTrack := ReservMgt.SourceQuantity(CalcReservEntry4, TRUE);
                        CalcReservEntry4.SETRANGE("Reservation Status", CalcReservEntry4."Reservation Status"::Reservation);
                        IF NOT CalcReservEntry4.ISEMPTY THEN BEGIN
                            CalcReservEntry4.CALCSUMS("Quantity (Base)");
                            QtyTracked += CalcReservEntry4."Quantity (Base)";
                        END;
                        CalcReservEntry4.SETFILTER("Reservation Status", '<>%1', CalcReservEntry4."Reservation Status"::Reservation);
                        CalcReservEntry4.SETFILTER("Item Tracking", '<>%1', CalcReservEntry4."Item Tracking"::None);
                        IF NOT CalcReservEntry4.ISEMPTY THEN BEGIN
                            CalcReservEntry4.CALCSUMS("Quantity (Base)");
                            QtyTracked += CalcReservEntry4."Quantity (Base)";
                        END;
                        IF CalcReservEntry."Source Type" = DATABASE::"Planning Component" THEN
                            QtyTracked := -QtyTracked;
                        ReservMgt.DeleteReservEntries(QtyTracked = 0, QtyTracked);
                        ReservMgt.AutoTrack(QtyToReTrack);
                    END;
            END;
    end;

    [LineStart(59596)]
    procedure DeleteReservEntries2(DeleteAll: Boolean; DownToQuantity: Decimal; var ReservEntry: Record "Reservation Entry");
    var
        CalcReservEntry4: Record "Reservation Entry";
        SurplusEntry: Record "Reservation Entry";
        DummyEntry: Record "Reservation Entry";
        ReqLine: Record "Requisition Line";
        Status: Option Reservation,Tracking,Surplus,Prospect;
        QtyToRelease: Decimal;
        QtyTracked: Decimal;
        QtyToReleaseForLotSN: Decimal;
        CurrentQty: Decimal;
        CurrentSerialNo: Code[20];
        CurrentLotNo: Code[20];
        AvailabilityDate: Date;
        Release: Option "Non-Inventory",Inventory;
        RunThroughActionMsg: Boolean;
        HandleItemTracking2: Boolean;
        SignFactor: Integer;
        QuantityIsValidated: Boolean;
    begin
        ReservEntry.SETRANGE("Reservation Status");
        IF ReservEntry.ISEMPTY THEN
            EXIT;
        CurrentSerialNo := ReservEntry."Serial No.";
        CurrentLotNo := ReservEntry."Lot No.";
        CurrentQty := ReservEntry."Quantity (Base)";

        GetItemSetup(ReservEntry);
        ReservEntry.TESTFIELD("Source Type");
        ReservEntry.Lock;
        SignFactor := CreateReservEntry.SignFactor(ReservEntry);
        QtyTracked := QuantityTracked(ReservEntry);
        CurrentBinding := ReservEntry.Binding;
        CurrentBindingIsSet := TRUE;

        IF (ReservEntry."Source Type" = DATABASE::"Requisition Line") AND (DownToQuantity <> 0) THEN
            IF ReqLine.GET(ReservEntry."Source ID", ReservEntry."Source Batch Name", ReservEntry."Source Ref. No.") THEN
                DownToQuantity := DownToQuantity - ReqLine."Original Quantity";

        // Item Tracking:
        //start b2b allow to delete lines in case of having item tracking
        IF NOT (DeleteAll OR (DownToQuantity < ABS(QtyTracked))) THEN BEGIN
            //IF NOT DeleteAll THEN BEGIN
            //stop b2b
            IF ItemTrackingCode."SN Specific Tracking" OR ItemTrackingCode."Lot Specific Tracking" THEN BEGIN
                HandleItemTracking2 := TRUE;
                CASE ItemTrackingHandling OF
                    ItemTrackingHandling::None:
                        BEGIN
                            ReservEntry.SETRANGE("Serial No.", '');
                            ReservEntry.SETRANGE("Lot No.", '');
                        END;
                    ItemTrackingHandling::Match:
                        BEGIN
                            IF NOT ((CurrentSerialNo = '') AND (CurrentLotNo = '')) THEN BEGIN
                                QtyToReleaseForLotSN := QuantityTracked2(ReservEntry);
                                IF ABS(QtyToReleaseForLotSN) > ABS(CurrentQty) THEN
                                    QtyToReleaseForLotSN := CurrentQty;
                                DownToQuantity := (QtyTracked - QtyToReleaseForLotSN) * SignFactor;
                                ReservEntry.SETRANGE("Serial No.", CurrentSerialNo);
                                ReservEntry.SETRANGE("Lot No.", CurrentLotNo);
                            END ELSE
                                DownToQuantity += CalcDownToQtySyncingToAssembly(ReservEntry);
                        END;
                END;
            END;
            //start b2b
        END;
        //stop b2b
        //b2b
        IF SignFactor * QtyTracked * DownToQuantity < 0 THEN
            DeleteAll := TRUE
        ELSE
            IF ABS(QtyTracked) < ABS(DownToQuantity) THEN
                EXIT;

        QtyToRelease := QtyTracked - (DownToQuantity * SignFactor);

        FOR Status := Status::Prospect DOWNTO Status::Reservation DO BEGIN
            ReservEntry.SETRANGE("Reservation Status", Status);
            IF ReservEntry.FINDSET AND (QtyToRelease <> 0) THEN
                CASE Status OF
                    Status::Prospect:
                    REPEAT
                        IF (ABS(ReservEntry."Quantity (Base)") <= ABS(QtyToRelease)) OR DeleteAll THEN BEGIN
                            ReservEntry.DELETE;
                            SaveTrackingSpecification(ReservEntry, ReservEntry."Quantity (Base)");
                            QtyToRelease := QtyToRelease - ReservEntry."Quantity (Base)";
                        END ELSE BEGIN
                            ReservEntry.VALIDATE("Quantity (Base)", ReservEntry."Quantity (Base)" - QtyToRelease);
                            ReservEntry.MODIFY;
                            SaveTrackingSpecification(ReservEntry, QtyToRelease);
                            QtyToRelease := 0;
                        END;
                    UNTIL (ReservEntry.NEXT = 0) OR ((NOT DeleteAll) AND (QtyToRelease = 0));
                    Status::Surplus:
                    REPEAT
                        IF CalcReservEntry4.GET(ReservEntry."Entry No.", NOT ReservEntry.Positive) THEN // Find related entry
                            ERROR(Text007);
                        IF (ABS(ReservEntry."Quantity (Base)") <= ABS(QtyToRelease)) OR DeleteAll THEN BEGIN
                            ReservEngineMgt.CloseReservEntry(ReservEntry, FALSE, DeleteAll);
                            SaveTrackingSpecification(ReservEntry, ReservEntry."Quantity (Base)");
                            QtyToRelease := QtyToRelease - ReservEntry."Quantity (Base)";
                            IF NOT DeleteAll AND CalcReservEntry4.TrackingExists THEN BEGIN
                                CalcReservEntry4."Reservation Status" := CalcReservEntry4."Reservation Status"::Surplus;
                                CalcReservEntry4.INSERT;
                            END;
                            ModifyActionMessage(ReservEntry."Entry No.", 0, TRUE); // Delete action messages
                        END ELSE BEGIN
                            ReservEntry.VALIDATE("Quantity (Base)", ReservEntry."Quantity (Base)" - QtyToRelease);
                            ReservEntry.MODIFY;
                            SaveTrackingSpecification(ReservEntry, QtyToRelease);
                            ModifyActionMessage(ReservEntry."Entry No.", QtyToRelease, FALSE); // Modify action messages
                            QtyToRelease := 0;
                        END;
                    UNTIL (ReservEntry.NEXT = 0) OR ((NOT DeleteAll) AND (QtyToRelease = 0));
                    Status::Tracking, Status::Reservation:
                        FOR Release := Release::"Non-Inventory" TO Release::Inventory DO BEGIN
                            // Release non-inventory reservations in first cycle
                            REPEAT
                                CalcReservEntry4.GET(ReservEntry."Entry No.", NOT ReservEntry.Positive); // Find related entry
                                IF (Release = Release::Inventory) = (CalcReservEntry4."Source Type" = DATABASE::"Item Ledger Entry") THEN BEGIN
                                    IF (ABS(ReservEntry."Quantity (Base)") <= ABS(QtyToRelease)) OR DeleteAll THEN BEGIN
                                        ReservEngineMgt.CloseReservEntry(ReservEntry, FALSE, DeleteAll);
                                        SaveTrackingSpecification(ReservEntry, ReservEntry."Quantity (Base)");
                                        QtyToRelease := QtyToRelease - ReservEntry."Quantity (Base)";
                                    END ELSE BEGIN
                                        ReservEntry.VALIDATE("Quantity (Base)", ReservEntry."Quantity (Base)" - QtyToRelease);
                                        ReservEntry.MODIFY;
                                        SaveTrackingSpecification(ReservEntry, QtyToRelease);

                                        IF Item."Order Tracking Policy" <> Item."Order Tracking Policy"::None THEN BEGIN
                                            IF CalcReservEntry4."Quantity (Base)" > 0 THEN
                                                AvailabilityDate := CalcReservEntry4."Shipment Date"
                                            ELSE
                                                AvailabilityDate := CalcReservEntry4."Expected Receipt Date";

                                            QtyToRelease := -MatchSurplus(CalcReservEntry4, SurplusEntry, -QtyToRelease,
                                                CalcReservEntry4."Quantity (Base)" < 0, AvailabilityDate, Item."Order Tracking Policy");

                                            // Make residual surplus record:
                                            IF QtyToRelease <> 0 THEN BEGIN
                                                MakeConnection(CalcReservEntry4, CalcReservEntry4, -QtyToRelease, 2,
                                                  AvailabilityDate, CalcReservEntry4.Binding);
                                                IF Item."Order Tracking Policy" = Item."Order Tracking Policy"::"Tracking & Action Msg." THEN BEGIN
                                                    CreateReservEntry.GetLastEntry(SurplusEntry); // Get the surplus-entry just inserted
                                                    IssueActionMessage(SurplusEntry, FALSE, DummyEntry);
                                                END;
                                            END;
                                        END ELSE
                                            IF ItemTrackingHandling = ItemTrackingHandling::None THEN
                                                QuantityIsValidated := SaveItemTrackingAsSurplus(CalcReservEntry4,
                                                    -ReservEntry.Quantity, -ReservEntry."Quantity (Base)");

                                        IF NOT QuantityIsValidated THEN
                                            CalcReservEntry4.VALIDATE("Quantity (Base)", -ReservEntry."Quantity (Base)");

                                        CalcReservEntry4.MODIFY;
                                        QtyToRelease := 0;
                                        QuantityIsValidated := FALSE;
                                    END;
                                END;
                            UNTIL (ReservEntry.NEXT = 0) OR ((NOT DeleteAll) AND (QtyToRelease = 0));
                            IF NOT ReservEntry.FINDFIRST THEN // Rewind for second cycle
                                Release := Release::Inventory;
                        END;
                END;
        END;

        IF HandleItemTracking2 THEN
            CheckQuantityIsCompletelyReleased(QtyToRelease, DeleteAll, CurrentSerialNo, CurrentLotNo, ReservEntry);

        IF RunThroughActionMsg THEN
            REPEAT
                IF ActionMessageEntry.DELETE THEN;
                IF SurplusEntry.GET(ActionMessageEntry."Reservation Entry", FALSE) THEN
                    IssueActionMessage(SurplusEntry, FALSE, DummyEntry);
            UNTIL ActionMessageEntry.NEXT = 0;
    end;

    [LineStart(59756)]
    procedure CalculateRemainingQty(var RemainingQty: Decimal; var RemainingQtyBase: Decimal);
    begin
        CalcReservEntry.TESTFIELD("Source Type");

        CASE CalcReservEntry."Source Type" OF
            DATABASE::"Sales Line":
                BEGIN
                    ForSalesLine.CALCFIELDS("Reserved Quantity", "Reserved Qty. (Base)");
                    RemainingQty := ForSalesLine."Outstanding Quantity" - ABS(ForSalesLine."Reserved Quantity");
                    RemainingQtyBase := ForSalesLine."Outstanding Qty. (Base)" - ABS(ForSalesLine."Reserved Qty. (Base)");
                END;
            DATABASE::"Requisition Line":
                BEGIN
                    ForReqLine.CALCFIELDS("Reserved Quantity", "Reserved Qty. (Base)");
                    RemainingQty := 0;
                    RemainingQtyBase := ForReqLine."Net Quantity (Base)" - ABS(ForReqLine."Reserved Qty. (Base)");
                END;
            DATABASE::"Purchase Line":
                BEGIN
                    ForPurchLine.CALCFIELDS("Reserved Quantity", "Reserved Qty. (Base)");
                    RemainingQty := ForPurchLine."Outstanding Quantity" - ABS(ForPurchLine."Reserved Quantity");
                    RemainingQtyBase := ForPurchLine."Outstanding Qty. (Base)" - ABS(ForPurchLine."Reserved Qty. (Base)");
                END;
            DATABASE::"Prod. Order Line":
                BEGIN
                    ForProdOrderLine.CALCFIELDS("Reserved Quantity", "Reserved Qty. (Base)");
                    RemainingQty := ForProdOrderLine."Remaining Quantity" - ABS(ForProdOrderLine."Reserved Quantity");
                    RemainingQtyBase := ForProdOrderLine."Remaining Qty. (Base)" - ABS(ForProdOrderLine."Reserved Qty. (Base)");
                END;
            DATABASE::"Prod. Order Component":
                BEGIN
                    ForProdOrderComp.CALCFIELDS("Reserved Quantity", "Reserved Qty. (Base)");
                    RemainingQty := ForProdOrderComp."Remaining Quantity" - ABS(ForProdOrderComp."Reserved Quantity");
                    RemainingQtyBase := ForProdOrderComp."Remaining Qty. (Base)" - ABS(ForProdOrderComp."Reserved Qty. (Base)");
                END;
            DATABASE::"Assembly Header":
                BEGIN
                    ForAssemblyHeader.CALCFIELDS("Reserved Quantity", "Reserved Qty. (Base)");
                    RemainingQty := ForAssemblyHeader."Remaining Quantity" - ABS(ForAssemblyHeader."Reserved Quantity");
                    RemainingQtyBase := ForAssemblyHeader."Remaining Quantity (Base)" - ABS(ForAssemblyHeader."Reserved Qty. (Base)");
                END;
            DATABASE::"Assembly Line":
                BEGIN
                    ForAssemblyLine.CALCFIELDS("Reserved Quantity", "Reserved Qty. (Base)");
                    RemainingQty := ForAssemblyLine."Remaining Quantity" - ABS(ForAssemblyLine."Reserved Quantity");
                    RemainingQtyBase := ForAssemblyLine."Remaining Quantity (Base)" - ABS(ForAssemblyLine."Reserved Qty. (Base)");
                END;
            DATABASE::"Planning Component":
                BEGIN
                    ForPlanningComponent.CALCFIELDS("Reserved Quantity", "Reserved Qty. (Base)");
                    RemainingQty := 0;
                    RemainingQtyBase := ForPlanningComponent."Net Quantity (Base)" - ABS(ForPlanningComponent."Reserved Qty. (Base)");
                END;
            DATABASE::"Transfer Line":
                CASE CalcReservEntry."Source Subtype" OF
                    0: // Outbound
                        BEGIN
                            ForTransLine.CALCFIELDS("Reserved Quantity Outbnd.", "Reserved Qty. Outbnd. (Base)");
                            RemainingQty := ForTransLine."Outstanding Quantity" - ABS(ForTransLine."Reserved Quantity Outbnd.");
                            RemainingQtyBase := ForTransLine."Outstanding Qty. (Base)" - ABS(ForTransLine."Reserved Qty. Outbnd. (Base)");
                        END;
                    1: // Inbound
                        BEGIN
                            ForTransLine.CALCFIELDS("Reserved Quantity Inbnd.", "Reserved Qty. Inbnd. (Base)");
                            RemainingQty := ForTransLine."Outstanding Quantity" - ABS(ForTransLine."Reserved Quantity Inbnd.");
                            RemainingQtyBase := ForTransLine."Outstanding Qty. (Base)" - ABS(ForTransLine."Reserved Qty. Inbnd. (Base)");
                        END;
                END;
            DATABASE::"Service Line":
                BEGIN
                    ForServiceLine.CALCFIELDS("Reserved Quantity", "Reserved Qty. (Base)");
                    RemainingQty := ForServiceLine."Outstanding Quantity" - ABS(ForServiceLine."Reserved Quantity");
                    RemainingQtyBase := ForServiceLine."Outstanding Qty. (Base)" - ABS(ForServiceLine."Reserved Qty. (Base)");
                END;
            DATABASE::"Job Planning Line":
                BEGIN
                    ForJobPlanningLine.CALCFIELDS("Reserved Quantity", "Reserved Qty. (Base)");
                    RemainingQty := ForJobPlanningLine."Remaining Qty." - ABS(ForJobPlanningLine."Reserved Quantity");
                    RemainingQtyBase := ForJobPlanningLine."Remaining Qty. (Base)" - ABS(ForJobPlanningLine."Reserved Qty. (Base)");
                END;
            ELSE
                ERROR(Text003);
        END;
    end;

    [LineStart(59839)]
    local procedure FieldFilterNeeded(var ReservEntry: Record "Reservation Entry"; "Field": Option "Lot No.","Serial No."): Boolean;
    begin
        EXIT(FieldFilterNeeded2(ReservEntry, Positive, Field));
    end;

    [LineStart(59842)]
    procedure FieldFilterNeeded2(var ReservEntry: Record "Reservation Entry"; SearchForSupply: Boolean; "Field": Option "Lot No.","Serial No."): Boolean;
    var
        ReservEntry2: Record "Reservation Entry";
        FieldValue: Code[20];
    begin
        FieldFilter := '';

        FieldValue := '';
        GetItemSetup(ReservEntry);
        CASE Field OF
            0:
                BEGIN
                    IF NOT ItemTrackingCode."Lot Specific Tracking" THEN
                        EXIT(FALSE);
                    FieldValue := ReservEntry."Lot No.";
                END;
            1:
                BEGIN
                    IF NOT ItemTrackingCode."SN Specific Tracking" THEN
                        EXIT(FALSE);
                    FieldValue := ReservEntry."Serial No.";
                END;
            ELSE
                ERROR(Text004);
        END;

        // The field "Lot No." is used a foundation for building up the filter:

        IF FieldValue <> '' THEN BEGIN
            IF SearchForSupply THEN // Demand
                ReservEntry2.SETRANGE("Lot No.", FieldValue)
            ELSE // Supply
                ReservEntry2.SETFILTER("Lot No.", '%1|%2', FieldValue, '');
            FieldFilter := ReservEntry2.GETFILTER("Lot No.");
        END ELSE // FieldValue = ''
            IF SearchForSupply THEN // Demand
                EXIT(FALSE)
            ELSE
                FieldFilter := STRSUBSTNO('''%1''', '');

        EXIT(TRUE);
    end;

    [LineStart(59880)]
    local procedure FilterPlanningComponent(AvailabilityDate: Date);
    begin
        WITH CalcPlanningComponent DO BEGIN
            RESET;
            SETCURRENTKEY("Item No.", "Variant Code", "Location Code", "Due Date");
            SETRANGE("Item No.", CalcReservEntry."Item No.");
            SETRANGE("Variant Code", CalcReservEntry."Variant Code");
            SETRANGE("Location Code", CalcReservEntry."Location Code");
            SETFILTER("Due Date", GetAvailabilityFilter(AvailabilityDate));
            IF Positive THEN
                SETFILTER("Net Quantity (Base)", '<0')
            ELSE
                SETFILTER("Net Quantity (Base)", '>0');
        END;
    end;

    [LineStart(59894)]
    procedure GetFieldFilter(): Text[80];
    begin
        EXIT(FieldFilter);
    end;

    [LineStart(59897)]
    procedure GetAvailabilityFilter(AvailabilityDate: Date): Text[80];
    begin
        EXIT(GetAvailabilityFilter2(AvailabilityDate, Positive));
    end;

    [LineStart(59900)]
    local procedure GetAvailabilityFilter2(AvailabilityDate: Date; SearchForSupply: Boolean): Text[80];
    var
        ReservEntry2: Record "Reservation Entry";
    begin
        IF SearchForSupply THEN
            ReservEntry2.SETFILTER("Expected Receipt Date", '..%1', AvailabilityDate)
        ELSE
            ReservEntry2.SETFILTER("Expected Receipt Date", '>=%1', AvailabilityDate);

        EXIT(ReservEntry2.GETFILTER("Expected Receipt Date"));
    end;

    [LineStart(59908)]
    procedure CopySign(FromValue: Decimal; var ToValue: Decimal);
    begin
        IF FromValue * ToValue < 0 THEN
            ToValue := -ToValue;
    end;

    [LineStart(59912)]
    local procedure InitFilter(EntryID: Integer; AvailabilityDate: Date);
    begin
        CASE EntryID OF
            1:
                BEGIN // Item Ledger Entry
                    CalcItemLedgEntry.RESET;
                    CalcItemLedgEntry.SETCURRENTKEY("Item No.", Open, "Variant Code", Positive, "Location Code");
                    CalcItemLedgEntry.SETRANGE("Item No.", CalcReservEntry."Item No.");
                    CalcItemLedgEntry.SETRANGE(Open, TRUE);
                    CalcItemLedgEntry.SETRANGE("Variant Code", CalcReservEntry."Variant Code");
                    CalcItemLedgEntry.SETRANGE(Positive, Positive);
                    CalcItemLedgEntry.SETRANGE("Location Code", CalcReservEntry."Location Code");
                    CalcItemLedgEntry.SETRANGE("Drop Shipment", FALSE);
                    IF FieldFilterNeeded2(CalcReservEntry, Positive, 0) THEN
                        CalcItemLedgEntry.SETFILTER("Lot No.", GetFieldFilter);
                    IF FieldFilterNeeded2(CalcReservEntry, Positive, 1) THEN
                        CalcItemLedgEntry.SETFILTER("Serial No.", GetFieldFilter);
                END;
            12, 16:
                BEGIN // Purchase Line
                    CalcPurchLine.RESET;
                    CalcPurchLine.SETCURRENTKEY(
                      "Document Type", Type, "No.", "Variant Code", "Drop Shipment", "Location Code", "Expected Receipt Date");
                    CalcPurchLine.SETRANGE("Document Type", EntryID - 11);
                    CalcPurchLine.SETRANGE(Type, CalcPurchLine.Type::Item);
                    CalcPurchLine.SETRANGE("No.", CalcReservEntry."Item No.");
                    CalcPurchLine.SETRANGE("Variant Code", CalcReservEntry."Variant Code");
                    CalcPurchLine.SETRANGE("Drop Shipment", FALSE);
                    CalcPurchLine.SETRANGE("Location Code", CalcReservEntry."Location Code");
                    CalcPurchLine.SETFILTER("Expected Receipt Date", GetAvailabilityFilter(AvailabilityDate));
                    IF Positive AND (EntryID <> 16) THEN
                        CalcPurchLine.SETFILTER("Quantity (Base)", '>0')
                    ELSE
                        CalcPurchLine.SETFILTER("Quantity (Base)", '<0');
                    CalcPurchLine.SETRANGE("Job No.", ' ');
                END;
            21:
                BEGIN // Requisition Line
                    CalcReqLine.RESET;
                    CalcReqLine.SETCURRENTKEY(
                      Type, "No.", "Variant Code", "Location Code", "Sales Order No.", "Planning Line Origin", "Due Date");
                    CalcReqLine.SETRANGE(Type, CalcReqLine.Type::Item);
                    CalcReqLine.SETRANGE("No.", CalcReservEntry."Item No.");
                    CalcReqLine.SETRANGE("Variant Code", CalcReservEntry."Variant Code");
                    CalcReqLine.SETRANGE("Location Code", CalcReservEntry."Location Code");
                    CalcReqLine.SETRANGE("Sales Order No.", '');
                    CalcReqLine.SETFILTER("Due Date", GetAvailabilityFilter(AvailabilityDate));
                    IF Positive THEN
                        CalcReqLine.SETFILTER("Quantity (Base)", '>0')
                    ELSE
                        CalcReqLine.SETFILTER("Quantity (Base)", '<0');
                END;
            31, 32, 36:
                BEGIN // Sales Line
                    CalcSalesLine.RESET;
                    CalcSalesLine.SETCURRENTKEY(
                      "Document Type", Type, "No.", "Variant Code", "Drop Shipment", "Location Code", "Shipment Date");
                    CalcSalesLine.SETRANGE("Document Type", EntryID - 31);
                    CalcSalesLine.SETRANGE(Type, CalcSalesLine.Type::Item);
                    CalcSalesLine.SETRANGE("No.", CalcReservEntry."Item No.");
                    CalcSalesLine.SETRANGE("Variant Code", CalcReservEntry."Variant Code");
                    CalcSalesLine.SETRANGE("Drop Shipment", FALSE);
                    CalcSalesLine.SETRANGE("Location Code", CalcReservEntry."Location Code");
                    CalcSalesLine.SETFILTER("Shipment Date", GetAvailabilityFilter(AvailabilityDate));
                    IF EntryID = 36 THEN
                        IF Positive THEN
                            CalcSalesLine.SETFILTER("Quantity (Base)", '>0')
                        ELSE
                            CalcSalesLine.SETFILTER("Quantity (Base)", '<0')
                    ELSE
                        IF Positive THEN
                            CalcSalesLine.SETFILTER("Quantity (Base)", '<0')
                        ELSE
                            CalcSalesLine.SETFILTER("Quantity (Base)", '>0');
                    CalcSalesLine.SETRANGE("Job No.", ' ');
                END;
            61, 62, 63, 64:
                BEGIN // Prod. Order
                    CalcProdOrderLine.RESET;
                    CalcProdOrderLine.SETCURRENTKEY(Status, "Item No.", "Variant Code", "Location Code", "Due Date");
                    CalcProdOrderLine.SETRANGE(Status, EntryID - 61);
                    CalcProdOrderLine.SETRANGE("Item No.", CalcReservEntry."Item No.");
                    CalcProdOrderLine.SETRANGE("Variant Code", CalcReservEntry."Variant Code");
                    CalcProdOrderLine.SETRANGE("Location Code", CalcReservEntry."Location Code");
                    CalcProdOrderLine.SETFILTER("Due Date", GetAvailabilityFilter(AvailabilityDate));
                    IF Positive THEN
                        CalcProdOrderLine.SETFILTER("Remaining Qty. (Base)", '>0')
                    ELSE
                        CalcProdOrderLine.SETFILTER("Remaining Qty. (Base)", '<0');
                END;
            71, 72, 73, 74:
                BEGIN // Prod. Order Component
                    CalcProdOrderComp.RESET;
                    CalcProdOrderComp.SETCURRENTKEY(Status, "Item No.", "Variant Code", "Location Code", "Due Date");
                    CalcProdOrderComp.SETRANGE(Status, EntryID - 71);
                    CalcProdOrderComp.SETRANGE("Item No.", CalcReservEntry."Item No.");
                    CalcProdOrderComp.SETRANGE("Variant Code", CalcReservEntry."Variant Code");
                    CalcProdOrderComp.SETRANGE("Location Code", CalcReservEntry."Location Code");
                    CalcProdOrderComp.SETFILTER("Due Date", GetAvailabilityFilter(AvailabilityDate));
                    IF Positive THEN
                        CalcProdOrderComp.SETFILTER("Remaining Qty. (Base)", '<0')
                    ELSE
                        CalcProdOrderComp.SETFILTER("Remaining Qty. (Base)", '>0');
                END;
            91:
                FilterPlanningComponent(AvailabilityDate);
            101:
                BEGIN // Transfer, Outbound
                    CalcTransLine.RESET;
                    CalcTransLine.SETCURRENTKEY("Transfer-from Code");
                    CalcTransLine.SETRANGE("Item No.", CalcReservEntry."Item No.");
                    CalcTransLine.SETRANGE("Variant Code", CalcReservEntry."Variant Code");
                    CalcTransLine.SETRANGE("Transfer-from Code", CalcReservEntry."Location Code");
                    CalcTransLine.SETFILTER("Shipment Date", GetAvailabilityFilter(AvailabilityDate));
                    IF Positive THEN
                        CalcTransLine.SETFILTER("Outstanding Qty. (Base)", '<0')
                    ELSE
                        CalcTransLine.SETFILTER("Outstanding Qty. (Base)", '>0');
                END;
            102:
                BEGIN // Transfer, Inbound
                    CalcTransLine.RESET;
                    CalcTransLine.SETCURRENTKEY("Transfer-to Code");
                    CalcTransLine.SETRANGE("Item No.", CalcReservEntry."Item No.");
                    CalcTransLine.SETRANGE("Variant Code", CalcReservEntry."Variant Code");
                    CalcTransLine.SETRANGE("Transfer-to Code", CalcReservEntry."Location Code");
                    CalcTransLine.SETFILTER("Receipt Date", GetAvailabilityFilter(AvailabilityDate));
                    IF Positive THEN
                        CalcTransLine.SETFILTER("Outstanding Qty. (Base)", '>0')
                    ELSE
                        CalcTransLine.SETFILTER("Outstanding Qty. (Base)", '<0');
                END;
            110:
                BEGIN // Service Line
                    CalcServiceLine.RESET;
                    CalcServiceLine.SETCURRENTKEY(Type, "No.", "Variant Code", "Location Code", "Needed by Date", "Document Type");
                    CalcServiceLine.SETRANGE(Type, CalcServiceLine.Type::Item);
                    CalcServiceLine.SETRANGE("No.", CalcReservEntry."Item No.");
                    CalcServiceLine.SETRANGE("Variant Code", CalcReservEntry."Variant Code");
                    CalcServiceLine.SETRANGE("Location Code", CalcReservEntry."Location Code");
                    CalcServiceLine.SETFILTER("Needed by Date", GetAvailabilityFilter(AvailabilityDate));
                    IF Positive THEN
                        CalcServiceLine.SETFILTER("Quantity (Base)", '<0')
                    ELSE
                        CalcServiceLine.SETFILTER("Quantity (Base)", '>0');
                    CalcServiceLine.SETRANGE("Job No.", ' ');
                END;
            133:
                BEGIN // Job Planning Line
                    CalcJobPlanningLine.RESET;
                    CalcJobPlanningLine.SETCURRENTKEY(Status, Type, "No.", "Variant Code", "Location Code", "Planning Date");
                    CalcJobPlanningLine.SETRANGE(Status, EntryID - 131);
                    CalcJobPlanningLine.SETRANGE(Type, CalcJobPlanningLine.Type::Item);
                    CalcJobPlanningLine.SETRANGE("No.", CalcReservEntry."Item No.");
                    CalcJobPlanningLine.SETRANGE("Variant Code", CalcReservEntry."Variant Code");
                    CalcJobPlanningLine.SETRANGE("Location Code", CalcReservEntry."Location Code");
                    CalcJobPlanningLine.SETFILTER("Planning Date", GetAvailabilityFilter(AvailabilityDate));
                    IF Positive THEN
                        CalcJobPlanningLine.SETFILTER("Quantity (Base)", '<0')
                    ELSE
                        CalcJobPlanningLine.SETFILTER("Quantity (Base)", '>0');
                END;
            141, 142:
                BEGIN // Assembly Header
                    CalcAssemblyHeader.RESET;
                    CalcAssemblyHeader.SETCURRENTKEY(
                      "Document Type", "Item No.", "Variant Code", "Location Code", "Due Date");
                    CalcAssemblyHeader.SETRANGE("Document Type", EntryID - 141);
                    CalcAssemblyHeader.SETRANGE("Item No.", CalcReservEntry."Item No.");
                    CalcAssemblyHeader.SETRANGE("Variant Code", CalcReservEntry."Variant Code");
                    CalcAssemblyHeader.SETRANGE("Location Code", CalcReservEntry."Location Code");
                    CalcAssemblyHeader.SETFILTER("Due Date", GetAvailabilityFilter(AvailabilityDate));
                    IF Positive THEN
                        CalcAssemblyHeader.SETFILTER("Remaining Quantity (Base)", '>0')
                    ELSE
                        CalcAssemblyHeader.SETFILTER("Remaining Quantity (Base)", '<0');
                END;
            151, 152:
                BEGIN // Assembly Line
                    CalcAssemblyLine.RESET;
                    CalcAssemblyLine.SETCURRENTKEY(
                      "Document Type", Type, "No.", "Variant Code", "Location Code", "Due Date");
                    CalcAssemblyLine.SETRANGE("Document Type", EntryID - 151);
                    CalcAssemblyLine.SETRANGE(Type, CalcAssemblyLine.Type::Item);
                    CalcAssemblyLine.SETRANGE("No.", CalcReservEntry."Item No.");
                    CalcAssemblyLine.SETRANGE("Variant Code", CalcReservEntry."Variant Code");
                    CalcAssemblyLine.SETRANGE("Location Code", CalcReservEntry."Location Code");
                    CalcAssemblyLine.SETFILTER("Due Date", GetAvailabilityFilter(AvailabilityDate));
                    IF Positive THEN
                        CalcAssemblyLine.SETFILTER("Remaining Quantity (Base)", '<0')
                    ELSE
                        CalcAssemblyLine.SETFILTER("Remaining Quantity (Base)", '>0');
                END;
        END;
    end;

    [LineStart(60106)]
    local procedure SetValueArray(EntryStatus: Option Reservation,Tracking,Simulation): Integer;
    begin
        CLEAR(ValueArray);
        CASE EntryStatus OF
            0:
                BEGIN // Reservation
                    ValueArray[1] := 1;
                    ValueArray[2] := 12;
                    ValueArray[3] := 16;
                    ValueArray[4] := 32;
                    ValueArray[5] := 36;
                    ValueArray[6] := 63;
                    ValueArray[7] := 64;
                    ValueArray[8] := 73;
                    ValueArray[9] := 74;
                    ValueArray[10] := 101;
                    ValueArray[11] := 102;
                    ValueArray[12] := 110;
                    ValueArray[13] := 133;
                    ValueArray[14] := 142;
                    ValueArray[15] := 152;
                    EXIT(15);
                END;
            1:
                BEGIN // Order Tracking
                    ValueArray[1] := 1;
                    ValueArray[2] := 12;
                    ValueArray[3] := 16;
                    ValueArray[4] := 21;
                    ValueArray[5] := 32;
                    ValueArray[6] := 36;
                    ValueArray[7] := 62;
                    ValueArray[8] := 63;
                    ValueArray[9] := 64;
                    ValueArray[10] := 72;
                    ValueArray[11] := 73;
                    ValueArray[12] := 74;
                    ValueArray[13] := 101;
                    ValueArray[14] := 102;
                    ValueArray[15] := 110;
                    ValueArray[16] := 133;
                    ValueArray[17] := 142;
                    ValueArray[18] := 152;
                    EXIT(18);
                END;
            2:
                BEGIN // Simulation order tracking
                    ValueArray[1] := 31;
                    ValueArray[2] := 61;
                    ValueArray[3] := 71;
                    EXIT(3);
                END;
            3:
                BEGIN // Item Tracking
                    ValueArray[1] := 1;
                    ValueArray[2] := 6500;
                    EXIT(2);
                END;
        END;
    end;

    [LineStart(60165)]
    procedure SetPointerFilter(var ReservEntry: Record "Reservation Entry");
    begin
        ReservEntry.SETCURRENTKEY(
          "Source ID", "Source Ref. No.", "Source Type", "Source Subtype",
          "Source Batch Name", "Source Prod. Order Line", "Reservation Status",
          "Shipment Date", "Expected Receipt Date");
        ReservEntry.SETRANGE("Source ID", ReservEntry."Source ID");
        ReservEntry.SETRANGE("Source Ref. No.", ReservEntry."Source Ref. No.");
        ReservEntry.SETRANGE("Source Type", ReservEntry."Source Type");
        ReservEntry.SETRANGE("Source Subtype", ReservEntry."Source Subtype");
        ReservEntry.SETRANGE("Source Batch Name", ReservEntry."Source Batch Name");
        ReservEntry.SETRANGE("Source Prod. Order Line", ReservEntry."Source Prod. Order Line");
    end;

    [LineStart(60177)]
    procedure ClearSurplus();
    var
        ReservEntry2: Record "Reservation Entry";
    begin
        CalcReservEntry.TESTFIELD("Source Type");
        ReservEntry2 := CalcReservEntry;
        SetPointerFilter(ReservEntry2);
        ReservEntry2.SETRANGE("Reservation Status", ReservEntry2."Reservation Status"::Surplus);
        // Item Tracking
        IF ItemTrackingHandling = ItemTrackingHandling::None THEN BEGIN
            ReservEntry2.SETRANGE("Serial No.", '');
            ReservEntry2.SETRANGE("Lot No.", '');
        END;

        IF Item."Order Tracking Policy" = Item."Order Tracking Policy"::"Tracking & Action Msg." THEN BEGIN
            ReservEntry2.Lock;
            IF NOT ReservEntry2.FINDSET THEN
                EXIT;
            ActionMessageEntry.RESET;
            ActionMessageEntry.SETCURRENTKEY("Reservation Entry");
            REPEAT
                ActionMessageEntry.SETRANGE("Reservation Entry", ReservEntry2."Entry No.");
                ActionMessageEntry.DELETEALL;
            UNTIL ReservEntry2.NEXT = 0;
        END;

        IF ReservEntry2.FINDSET THEN
            REPEAT
                ReservEntry2.DELETE;
            UNTIL ReservEntry2.NEXT = 0;

        ReservEntry2.SETRANGE("Reservation Status", ReservEntry2."Reservation Status"::Prospect);
        IF ReservEntry2.FINDSET THEN
            REPEAT
                ReservEntry2.DELETE;
            UNTIL ReservEntry2.NEXT = 0;
    end;

    [LineStart(60211)]
    local procedure QuantityTracked(var ReservEntry: Record "Reservation Entry"): Decimal;
    var
        ReservEntry2: Record "Reservation Entry";
        QtyTracked: Decimal;
    begin
        ReservEntry2 := ReservEntry;
        SetPointerFilter(ReservEntry2);
        ReservEntry.COPYFILTER("Serial No.", ReservEntry2."Serial No.");
        ReservEntry.COPYFILTER("Lot No.", ReservEntry2."Lot No.");
        IF ReservEntry2.FINDFIRST THEN BEGIN
            ReservEntry.Binding := ReservEntry2.Binding;
            ReservEntry2.CALCSUMS("Quantity (Base)");
            QtyTracked := ReservEntry2."Quantity (Base)";
        END;
        EXIT(QtyTracked);
    end;

    [LineStart(60223)]
    local procedure QuantityTracked2(var ReservEntry: Record "Reservation Entry"): Decimal;
    var
        ReservEntry2: Record "Reservation Entry";
        QtyTracked: Decimal;
    begin
        ReservEntry2 := ReservEntry;
        SetPointerFilter(ReservEntry2);
        ReservEntry2.SETRANGE("Serial No.", ReservEntry."Serial No.");
        ReservEntry2.SETRANGE("Lot No.", ReservEntry."Lot No.");
        ReservEntry2.SETRANGE("Reservation Status",
          ReservEntry2."Reservation Status"::Tracking, ReservEntry2."Reservation Status"::Prospect);
        IF NOT ReservEntry2.ISEMPTY THEN BEGIN
            ReservEntry2.CALCSUMS("Quantity (Base)");
            QtyTracked := ReservEntry2."Quantity (Base)";
        END;
        EXIT(QtyTracked);
    end;

    [LineStart(60236)]
    procedure AutoTrack(TotalQty: Decimal);
    var
        SurplusEntry: Record "Reservation Entry";
        DummyEntry: Record "Reservation Entry";
        AvailabilityDate: Date;
        QtyToTrack: Decimal;
    begin
        CalcReservEntry.TESTFIELD("Source Type");
        IF CalcReservEntry."Item No." = '' THEN
            EXIT;

        GetItemSetup(CalcReservEntry);
        IF Item."Order Tracking Policy" = Item."Order Tracking Policy"::None THEN
            EXIT;

        IF CalcReservEntry."Source Type" IN [DATABASE::"Sales Line", DATABASE::"Purchase Line", DATABASE::"Service Line"] THEN
            IF NOT (CalcReservEntry."Source Subtype" IN [1, 5]) THEN
                EXIT; // Only order, return order

        IF CalcReservEntry."Source Type" IN [DATABASE::"Prod. Order Line", DATABASE::"Prod. Order Component"]
        THEN
            IF CalcReservEntry."Source Subtype" = 0 THEN
                EXIT; // Not simulation

        CalcReservEntry.Lock;

        QtyToTrack := CreateReservEntry.SignFactor(CalcReservEntry) * TotalQty - QuantityTracked(CalcReservEntry);

        IF QtyToTrack = 0 THEN BEGIN
            UpdateDating;
            EXIT;
        END;

        QtyToTrack := MatchSurplus(CalcReservEntry, SurplusEntry, QtyToTrack, Positive, AvailabilityDate, Item."Order Tracking Policy");

        // Make residual surplus record:
        IF QtyToTrack <> 0 THEN BEGIN
            IF CurrentBindingIsSet THEN
                MakeConnection(CalcReservEntry, SurplusEntry, QtyToTrack, 2, AvailabilityDate, CurrentBinding)
            ELSE
                MakeConnection(CalcReservEntry, SurplusEntry, QtyToTrack, 2, AvailabilityDate, CalcReservEntry.Binding);
            IF Item."Order Tracking Policy" = Item."Order Tracking Policy"::"Tracking & Action Msg." THEN BEGIN // Issue Action Message
                CreateReservEntry.GetLastEntry(SurplusEntry); // Get the surplus-entry just inserted
                IssueActionMessage(SurplusEntry, TRUE, DummyEntry);
            END;
        END ELSE
            UpdateDating;
    end;

    [LineStart(60278)]
    procedure MatchSurplus(var ReservEntry: Record "Reservation Entry"; var SurplusEntry: Record "Reservation Entry"; QtyToTrack: Decimal; SearchForSupply: Boolean; var AvailabilityDate: Date; TrackingPolicy: Option "None","Tracking Only","Tracking & Action Msg."): Decimal;
    var
        Search: Text[1];
        NextStep: Integer;
        ReservationStatus: Option Reservation,Tracking;
        ReservEntry2: Record "Reservation Entry";
    begin
        IF QtyToTrack = 0 THEN
            EXIT;

        ReservEntry.Lock;
        SurplusEntry.SETCURRENTKEY(
          "Item No.", "Variant Code", "Location Code", "Reservation Status",
          "Shipment Date", "Expected Receipt Date", "Serial No.", "Lot No.");
        SurplusEntry.SETRANGE("Item No.", ReservEntry."Item No.");
        SurplusEntry.SETRANGE("Variant Code", ReservEntry."Variant Code");
        SurplusEntry.SETRANGE("Location Code", ReservEntry."Location Code");
        SurplusEntry.SETRANGE("Reservation Status", SurplusEntry."Reservation Status"::Surplus);
        IF SearchForSupply THEN BEGIN
            AvailabilityDate := ReservEntry."Shipment Date";
            Search := '+';
            NextStep := -1;
            SurplusEntry.SETFILTER("Expected Receipt Date", GetAvailabilityFilter2(AvailabilityDate, SearchForSupply));
            SurplusEntry.SETFILTER("Quantity (Base)", '>0');
        END ELSE BEGIN
            AvailabilityDate := ReservEntry."Expected Receipt Date";
            Search := '-';
            NextStep := 1;
            SurplusEntry.SETFILTER("Shipment Date", GetAvailabilityFilter2(AvailabilityDate, SearchForSupply));
            SurplusEntry.SETFILTER("Quantity (Base)", '<0')
        END;
        IF FieldFilterNeeded2(ReservEntry, SearchForSupply, 0) THEN
            SurplusEntry.SETFILTER("Lot No.", GetFieldFilter);
        IF FieldFilterNeeded2(ReservEntry, SearchForSupply, 1) THEN
            SurplusEntry.SETFILTER("Serial No.", GetFieldFilter);
        IF SurplusEntry.FIND(Search) THEN
            REPEAT
                ReservationStatus := ReservationStatus::Tracking;
                IF ABS(SurplusEntry."Quantity (Base)") <= ABS(QtyToTrack) THEN BEGIN
                    ReservEntry2 := SurplusEntry;
                    MakeConnection(ReservEntry, SurplusEntry, -SurplusEntry."Quantity (Base)", ReservationStatus,
                      AvailabilityDate, SurplusEntry.Binding);
                    QtyToTrack := QtyToTrack + SurplusEntry."Quantity (Base)";
                    SurplusEntry := ReservEntry2;
                    SurplusEntry.DELETE;
                    IF TrackingPolicy = TrackingPolicy::"Tracking & Action Msg." THEN
                        ModifyActionMessage(SurplusEntry."Entry No.", 0, TRUE); // Delete related Action Message
                END ELSE BEGIN
                    SurplusEntry.VALIDATE("Quantity (Base)", SurplusEntry."Quantity (Base)" + QtyToTrack);
                    SurplusEntry.MODIFY;
                    MakeConnection(ReservEntry, SurplusEntry, QtyToTrack, ReservationStatus, AvailabilityDate, SurplusEntry.Binding);
                    IF TrackingPolicy = TrackingPolicy::"Tracking & Action Msg." THEN
                        ModifyActionMessage(SurplusEntry."Entry No.", QtyToTrack, FALSE); // Modify related Action Message
                    QtyToTrack := 0;
                END;
            UNTIL (SurplusEntry.NEXT(NextStep) = 0) OR (QtyToTrack = 0);

        EXIT(QtyToTrack);
    end;

    [LineStart(60331)]
    local procedure MakeConnection(var FromReservEntry: Record "Reservation Entry"; var ToReservEntry: Record "Reservation Entry"; Quantity: Decimal; ReservationStatus: Option Reservation,Tracking,Surplus; AvailabilityDate: Date; Binding: Option "Order-to-Order");
    var
        sign: Integer;
    begin
        IF Quantity < 0 THEN
            ToReservEntry."Shipment Date" := AvailabilityDate
        ELSE
            ToReservEntry."Expected Receipt Date" := AvailabilityDate;

        CreateReservEntry.SetBinding(Binding);

        IF FromReservEntry."Planning Flexibility" <> FromReservEntry."Planning Flexibility"::Unlimited THEN
            CreateReservEntry.SetPlanningFlexibility(FromReservEntry."Planning Flexibility");

        sign := CreateReservEntry.SignFactor(FromReservEntry);
        CreateReservEntry.CreateReservEntryFor(
          FromReservEntry."Source Type", FromReservEntry."Source Subtype", FromReservEntry."Source ID",
          FromReservEntry."Source Batch Name", FromReservEntry."Source Prod. Order Line", FromReservEntry."Source Ref. No.",
          FromReservEntry."Qty. per Unit of Measure",
          0, sign * Quantity,
          FromReservEntry."Serial No.", FromReservEntry."Lot No.");
        CreateReservEntry.CreateReservEntryFrom(
          ToReservEntry."Source Type", ToReservEntry."Source Subtype", ToReservEntry."Source ID", ToReservEntry."Source Batch Name",
          ToReservEntry."Source Prod. Order Line", ToReservEntry."Source Ref. No.", ToReservEntry."Qty. per Unit of Measure",
          ToReservEntry."Serial No.", ToReservEntry."Lot No.");
        CreateReservEntry.SetApplyFromEntryNo(FromReservEntry."Appl.-from Item Entry");
        CreateReservEntry.SetApplyToEntryNo(FromReservEntry."Appl.-to Item Entry");
        CreateReservEntry.CreateEntry(
          FromReservEntry."Item No.", FromReservEntry."Variant Code", FromReservEntry."Location Code",
          FromReservEntry.Description, ToReservEntry."Expected Receipt Date", ToReservEntry."Shipment Date", 0, ReservationStatus);
    end;

    [LineStart(60359)]
    procedure ModifyUnitOfMeasure();
    begin
        ReservEngineMgt.ModifyUnitOfMeasure(CalcReservEntry, CalcReservEntry."Qty. per Unit of Measure");
    end;

    [LineStart(60362)]
    procedure MakeRoomForReservation(var ReservEntry: Record "Reservation Entry"): Decimal;
    var
        ReservEntry2: Record "Reservation Entry";
        TotalQuantity: Decimal;
    begin
        TotalQuantity := SourceQuantity(ReservEntry, FALSE);
        ReservEntry2 := ReservEntry;
        SetPointerFilter(ReservEntry2);
        ItemTrackingHandling := ItemTrackingHandling::Match;
        DeleteReservEntries2(FALSE, TotalQuantity - (ReservEntry."Quantity (Base)" * CreateReservEntry.SignFactor(ReservEntry)),
          ReservEntry2);
    end;

    [LineStart(60370)]
    local procedure SaveTrackingSpecification(var ReservEntry: Record "Reservation Entry"; QtyReleased: Decimal);
    begin
        // Used when creating reservations.
        IF ItemTrackingHandling = ItemTrackingHandling::None THEN
            EXIT;
        IF NOT ReservEntry.TrackingExists THEN
            EXIT;
        TempTrackingSpecification.SETRANGE("Serial No.", ReservEntry."Serial No.");
        TempTrackingSpecification.SETRANGE("Lot No.", ReservEntry."Lot No.");
        IF TempTrackingSpecification.FINDSET THEN BEGIN
            TempTrackingSpecification.VALIDATE("Quantity (Base)",
              TempTrackingSpecification."Quantity (Base)" + QtyReleased);
            TempTrackingSpecification.MODIFY;
        END ELSE BEGIN
            TempTrackingSpecification.TRANSFERFIELDS(ReservEntry);
            TempTrackingSpecification.VALIDATE("Quantity (Base)", QtyReleased);
            TempTrackingSpecification.INSERT;
        END;
        TempTrackingSpecification.RESET;
    end;

    [LineStart(60389)]
    procedure CollectTrackingSpecification(var TargetTrackingSpecification: Record "Tracking Specification" temporary): Boolean;
    begin
        // Used when creating reservations.
        TempTrackingSpecification.RESET;
        TargetTrackingSpecification.RESET;

        IF NOT TempTrackingSpecification.FINDSET THEN
            EXIT(FALSE);

        REPEAT
            TargetTrackingSpecification := TempTrackingSpecification;
            TargetTrackingSpecification.INSERT;
        UNTIL TempTrackingSpecification.NEXT = 0;

        TempTrackingSpecification.DELETEALL;

        EXIT(TRUE);
    end;

    [LineStart(60406)]
    procedure SourceQuantity(var ReservEntry: Record "Reservation Entry"; SetAsCurrent: Boolean): Decimal;
    begin
        EXIT(GetSourceRecordValue(ReservEntry, SetAsCurrent, 0));
    end;

    [LineStart(60409)]
    procedure GetSourceRecordValue(var ReservEntry: Record "Reservation Entry"; SetAsCurrent: Boolean; ReturnOption: Option "Net Qty. (Base)","Gross Qty. (Base)"): Decimal;
    begin
        WITH ReservEntry DO
            CASE "Source Type" OF
                DATABASE::"Item Ledger Entry":
                    EXIT(GetSourceItemLedgEntryValue(ReservEntry, SetAsCurrent, ReturnOption));
                DATABASE::"Sales Line":
                    EXIT(GetSourceSalesLineValue(ReservEntry, SetAsCurrent, ReturnOption));
                DATABASE::"Requisition Line":
                    EXIT(GetSourceReqLineValue(ReservEntry, SetAsCurrent, ReturnOption));
                DATABASE::"Purchase Line":
                    EXIT(GetSourcePurchLineValue(ReservEntry, SetAsCurrent, ReturnOption));
                DATABASE::"Item Journal Line":
                    EXIT(GetSourceItemJnlLineValue(ReservEntry, SetAsCurrent, ReturnOption));
                DATABASE::"Job Journal Line":
                    EXIT(GetSourceJobJnlLineValue(ReservEntry, SetAsCurrent, ReturnOption));
                DATABASE::"Prod. Order Line":
                    EXIT(GetSourceProdOrderLineValue(ReservEntry, SetAsCurrent, ReturnOption));
                DATABASE::"Prod. Order Component":
                    EXIT(GetSourceProdOrderCompValue(ReservEntry, SetAsCurrent, ReturnOption));
                DATABASE::"Assembly Header":
                    EXIT(GetSourceAsmHeaderValue(ReservEntry, SetAsCurrent, ReturnOption));
                DATABASE::"Assembly Line":
                    EXIT(GetSourceAsmLineValue(ReservEntry, SetAsCurrent, ReturnOption));
                DATABASE::"Planning Component":
                    EXIT(GetSourcePlanningCompValue(ReservEntry, SetAsCurrent, ReturnOption));
                DATABASE::"Transfer Line":
                    EXIT(GetSourceTransLineValue(ReservEntry, SetAsCurrent, ReturnOption));
                DATABASE::"Service Line":
                    EXIT(GetSourceServLineValue(ReservEntry, SetAsCurrent, ReturnOption));
                DATABASE::"Job Planning Line":
                    EXIT(GetSourceJobPlanningLineValue(ReservEntry, SetAsCurrent, ReturnOption));
            END;
    end;

    [LineStart(60442)]
    local procedure GetSourceItemLedgEntryValue(var ReservEntry: Record "Reservation Entry"; SetAsCurrent: Boolean; ReturnOption: Option "Net Qty. (Base)","Gross Qty. (Base)"): Decimal;
    var
        ItemLedgEntry: Record "Item Ledger Entry";
    begin
        ItemLedgEntry.GET(ReservEntry."Source Ref. No.");
        IF SetAsCurrent THEN
            SetItemLedgEntry(ItemLedgEntry);
        CASE ReturnOption OF
            ReturnOption::"Net Qty. (Base)":
                EXIT(ItemLedgEntry."Remaining Quantity");
            ReturnOption::"Gross Qty. (Base)":
                EXIT(ItemLedgEntry.Quantity);
        END;
    end;

    [LineStart(60453)]
    local procedure GetSourceSalesLineValue(var ReservEntry: Record "Reservation Entry"; SetAsCurrent: Boolean; ReturnOption: Option "Net Qty. (Base)","Gross Qty. (Base)"): Decimal;
    var
        SalesLine: Record "Sales Line";
    begin
        SalesLine.GET(ReservEntry."Source Subtype", ReservEntry."Source ID", ReservEntry."Source Ref. No.");
        IF SetAsCurrent THEN
            SetSalesLine(SalesLine);
        CASE ReturnOption OF
            ReturnOption::"Net Qty. (Base)":
                EXIT(SalesLine."Outstanding Qty. (Base)");
            ReturnOption::"Gross Qty. (Base)":
                EXIT(SalesLine."Quantity (Base)");
        END;
    end;

    [LineStart(60464)]
    local procedure GetSourceReqLineValue(var ReservEntry: Record "Reservation Entry"; SetAsCurrent: Boolean; ReturnOption: Option "Net Qty. (Base)","Gross Qty. (Base)"): Decimal;
    var
        ReqLine: Record "Requisition Line";
    begin
        ReqLine.GET(ReservEntry."Source ID", ReservEntry."Source Batch Name", ReservEntry."Source Ref. No.");
        IF SetAsCurrent THEN
            SetReqLine(ReqLine);
        CASE ReturnOption OF
            ReturnOption::"Net Qty. (Base)":
                EXIT(ReqLine."Net Quantity (Base)");
            ReturnOption::"Gross Qty. (Base)":
                EXIT(ReqLine."Quantity (Base)");
        END;
    end;

    [LineStart(60475)]
    local procedure GetSourcePurchLineValue(var ReservEntry: Record "Reservation Entry"; SetAsCurrent: Boolean; ReturnOption: Option "Net Qty. (Base)","Gross Qty. (Base)"): Decimal;
    var
        PurchLine: Record "Purchase Line";
    begin
        PurchLine.GET(ReservEntry."Source Subtype", ReservEntry."Source ID", ReservEntry."Source Ref. No.");
        IF SetAsCurrent THEN
            SetPurchLine(PurchLine);
        CASE ReturnOption OF
            ReturnOption::"Net Qty. (Base)":
                EXIT(PurchLine."Outstanding Qty. (Base)");
            ReturnOption::"Gross Qty. (Base)":
                EXIT(PurchLine."Quantity (Base)");
        END;
    end;

    [LineStart(60486)]
    local procedure GetSourceItemJnlLineValue(var ReservEntry: Record "Reservation Entry"; SetAsCurrent: Boolean; ReturnOption: Option "Net Qty. (Base)","Gross Qty. (Base)"): Decimal;
    var
        ItemJnlLine: Record "Item Journal Line";
    begin
        ItemJnlLine.GET(ReservEntry."Source ID", ReservEntry."Source Batch Name", ReservEntry."Source Ref. No.");
        IF SetAsCurrent THEN
            SetItemJnlLine(ItemJnlLine);
        CASE ReturnOption OF
            ReturnOption::"Net Qty. (Base)":
                EXIT(ItemJnlLine."Quantity (Base)");
            ReturnOption::"Gross Qty. (Base)":
                EXIT(ItemJnlLine."Quantity (Base)");
        END;
    end;

    [LineStart(60497)]
    local procedure GetSourceJobJnlLineValue(var ReservEntry: Record "Reservation Entry"; SetAsCurrent: Boolean; ReturnOption: Option "Net Qty. (Base)","Gross Qty. (Base)"): Decimal;
    var
        JobJnlLine: Record "Job Journal Line";
    begin
        JobJnlLine.GET(ReservEntry."Source ID", ReservEntry."Source Batch Name", ReservEntry."Source Ref. No.");
        IF SetAsCurrent THEN
            SetJobJnlLine(JobJnlLine);
        CASE ReturnOption OF
            ReturnOption::"Net Qty. (Base)":
                EXIT(JobJnlLine."Quantity (Base)");
            ReturnOption::"Gross Qty. (Base)":
                EXIT(JobJnlLine."Quantity (Base)");
        END;
    end;

    [LineStart(60508)]
    local procedure GetSourceProdOrderLineValue(var ReservEntry: Record "Reservation Entry"; SetAsCurrent: Boolean; ReturnOption: Option "Net Qty. (Base)","Gross Qty. (Base)"): Decimal;
    var
        ProdOrderLine: Record "Prod. Order Line";
    begin
        ProdOrderLine.GET(ReservEntry."Source Subtype", ReservEntry."Source ID", ReservEntry."Source Prod. Order Line");
        IF SetAsCurrent THEN
            SetProdOrderLine(ProdOrderLine);
        CASE ReturnOption OF
            ReturnOption::"Net Qty. (Base)":
                EXIT(ProdOrderLine."Remaining Qty. (Base)");
            ReturnOption::"Gross Qty. (Base)":
                EXIT(ProdOrderLine."Quantity (Base)");
        END;
    end;

    [LineStart(60519)]
    local procedure GetSourceProdOrderCompValue(var ReservEntry: Record "Reservation Entry"; SetAsCurrent: Boolean; ReturnOption: Option "Net Qty. (Base)","Gross Qty. (Base)"): Decimal;
    var
        ProdOrderComp: Record "Prod. Order Component";
    begin
        ProdOrderComp.GET(
          ReservEntry."Source Subtype",
          ReservEntry."Source ID",
          ReservEntry."Source Prod. Order Line",
          ReservEntry."Source Ref. No.");
        IF SetAsCurrent THEN
            SetProdOrderComponent(ProdOrderComp);
        CASE ReturnOption OF
            ReturnOption::"Net Qty. (Base)":
                EXIT(ProdOrderComp."Remaining Qty. (Base)");
            ReturnOption::"Gross Qty. (Base)":
                EXIT(ProdOrderComp."Expected Qty. (Base)");
        END;
    end;

    [LineStart(60534)]
    local procedure GetSourceAsmHeaderValue(var ReservEntry: Record "Reservation Entry"; SetAsCurrent: Boolean; ReturnOption: Option "Net Qty. (Base)","Gross Qty. (Base)"): Decimal;
    var
        AssemblyHeader: Record "Assembly Header";
    begin
        AssemblyHeader.GET(ReservEntry."Source Subtype", ReservEntry."Source ID");
        IF SetAsCurrent THEN
            SetAssemblyHeader(AssemblyHeader);
        CASE ReturnOption OF
            ReturnOption::"Net Qty. (Base)":
                EXIT(AssemblyHeader."Remaining Quantity (Base)");
            ReturnOption::"Gross Qty. (Base)":
                EXIT(AssemblyHeader."Quantity (Base)");
        END;
    end;

    [LineStart(60545)]
    local procedure GetSourceAsmLineValue(var ReservEntry: Record "Reservation Entry"; SetAsCurrent: Boolean; ReturnOption: Option "Net Qty. (Base)","Gross Qty. (Base)"): Decimal;
    var
        AssemblyLine: Record "Assembly Line";
    begin
        AssemblyLine.GET(ReservEntry."Source Subtype", ReservEntry."Source ID", ReservEntry."Source Ref. No.");
        IF SetAsCurrent THEN
            SetAssemblyLine(AssemblyLine);
        CASE ReturnOption OF
            ReturnOption::"Net Qty. (Base)":
                EXIT(AssemblyLine."Remaining Quantity (Base)");
            ReturnOption::"Gross Qty. (Base)":
                EXIT(AssemblyLine."Quantity (Base)");
        END;
    end;

    [LineStart(60556)]
    local procedure GetSourcePlanningCompValue(var ReservEntry: Record "Reservation Entry"; SetAsCurrent: Boolean; ReturnOption: Option "Net Qty. (Base)","Gross Qty. (Base)"): Decimal;
    var
        PlanningComponent: Record "Planning Component";
    begin
        PlanningComponent.GET(
          ReservEntry."Source ID", ReservEntry."Source Batch Name",
          ReservEntry."Source Prod. Order Line", ReservEntry."Source Ref. No.");
        IF SetAsCurrent THEN
            SetPlanningComponent(PlanningComponent);
        CASE ReturnOption OF
            ReturnOption::"Net Qty. (Base)":
                EXIT(PlanningComponent."Net Quantity (Base)");
            ReturnOption::"Gross Qty. (Base)":
                EXIT(PlanningComponent."Expected Quantity (Base)");
        END;
    end;

    [LineStart(60569)]
    local procedure GetSourceTransLineValue(var ReservEntry: Record "Reservation Entry"; SetAsCurrent: Boolean; ReturnOption: Option "Net Qty. (Base)","Gross Qty. (Base)"): Decimal;
    var
        TransLine: Record "Transfer Line";
    begin
        TransLine.GET(ReservEntry."Source ID", ReservEntry."Source Ref. No.");
        IF SetAsCurrent THEN
            SetTransferLine(TransLine, ReservEntry."Source Subtype");
        CASE ReturnOption OF
            ReturnOption::"Net Qty. (Base)":
                EXIT(TransLine."Outstanding Qty. (Base)");
            ReturnOption::"Gross Qty. (Base)":
                EXIT(TransLine."Quantity (Base)");
        END;
    end;

    [LineStart(60580)]
    local procedure GetSourceServLineValue(var ReservEntry: Record "Reservation Entry"; SetAsCurrent: Boolean; ReturnOption: Option "Net Qty. (Base)","Gross Qty. (Base)"): Decimal;
    var
        ServLine: Record "Service Line";
    begin
        ServLine.GET(ReservEntry."Source Subtype", ReservEntry."Source ID", ReservEntry."Source Ref. No.");
        IF SetAsCurrent THEN
            SetServLine(ServLine);
        CASE ReturnOption OF
            ReturnOption::"Net Qty. (Base)":
                EXIT(ServLine."Outstanding Qty. (Base)");
            ReturnOption::"Gross Qty. (Base)":
                EXIT(ServLine."Quantity (Base)");
        END;
    end;

    [LineStart(60591)]
    local procedure GetSourceJobPlanningLineValue(var ReservEntry: Record "Reservation Entry"; SetAsCurrent: Boolean; ReturnOption: Option "Net Qty. (Base)","Gross Qty. (Base)"): Decimal;
    var
        JobPlanningLine: Record "Job Planning Line";
    begin
        JobPlanningLine.SETCURRENTKEY("Job Contract Entry No.");
        JobPlanningLine.SETRANGE("Job Contract Entry No.", ReservEntry."Source Ref. No.");
        JobPlanningLine.FINDFIRST;
        IF SetAsCurrent THEN
            SetJobPlanningLine(JobPlanningLine);
        CASE ReturnOption OF
            ReturnOption::"Net Qty. (Base)":
                EXIT(JobPlanningLine."Remaining Qty. (Base)");
            ReturnOption::"Gross Qty. (Base)":
                EXIT(JobPlanningLine."Quantity (Base)");
        END;
    end;

    [LineStart(60604)]
    local procedure GetItemSetup(var ReservEntry: Record "Reservation Entry");
    begin
        IF ReservEntry."Item No." <> Item."No." THEN BEGIN
            Item.GET(ReservEntry."Item No.");
            IF Item."Item Tracking Code" <> '' THEN
                ItemTrackingCode.GET(Item."Item Tracking Code")
            ELSE
                ItemTrackingCode.INIT;
            GetPlanningParameters.AtSKU(SKU, ReservEntry."Item No.",
              ReservEntry."Variant Code", ReservEntry."Location Code");
            MfgSetup.GET;
        END;
    end;

    [LineStart(60616)]
    procedure MarkReservConnection(var ReservEntry: Record "Reservation Entry"; TargetReservEntry: Record "Reservation Entry") ReservedQuantity: Decimal;
    var
        ReservEntry2: Record "Reservation Entry";
        SignFactor: Integer;
    begin
        IF NOT ReservEntry.FINDSET THEN
            EXIT;
        SignFactor := CreateReservEntry.SignFactor(ReservEntry);

        REPEAT
            IF ReservEntry2.GET(ReservEntry."Entry No.", NOT ReservEntry.Positive) THEN
                IF ((ReservEntry2."Source Type" = TargetReservEntry."Source Type") AND
                    (ReservEntry2."Source Subtype" = TargetReservEntry."Source Subtype") AND
                    (ReservEntry2."Source ID" = TargetReservEntry."Source ID") AND
                    (ReservEntry2."Source Batch Name" = TargetReservEntry."Source Batch Name") AND
                    (ReservEntry2."Source Prod. Order Line" = TargetReservEntry."Source Prod. Order Line") AND
                    (ReservEntry2."Source Ref. No." = TargetReservEntry."Source Ref. No."))
                THEN BEGIN
                    ReservEntry.MARK(TRUE);
                    ReservedQuantity += ReservEntry."Quantity (Base)" * SignFactor;
                END;
        UNTIL ReservEntry.NEXT = 0;
        ReservEntry.MARKEDONLY(TRUE);
    end;

    [LineStart(60636)]
    local procedure IsSpecialOrder(PurchasingCode: Code[10]): Boolean;
    var
        Purchasing: Record Purchasing;
    begin
        IF PurchasingCode <> '' THEN
            IF Purchasing.GET(PurchasingCode) THEN
                EXIT(Purchasing."Special Order");

        EXIT(FALSE);
    end;

    [LineStart(60643)]
    procedure IssueActionMessage(var SurplusEntry: Record "Reservation Entry"; UseGlobalSettings: Boolean; AllDeletedEntry: Record "Reservation Entry");
    var
        ReservEntry: Record "Reservation Entry";
        ReservEntry2: Record "Reservation Entry";
        ReservEntry3: Record "Reservation Entry";
        ActionMessageEntry2: Record "Action Message Entry";
        NextEntryNo: Integer;
        FirstDate: Date;
        Found: Boolean;
        FreeBinding: Boolean;
        NoMoreData: Boolean;
        DateFormula: DateFormula;
    begin
        SurplusEntry.TESTFIELD("Quantity (Base)");
        IF SurplusEntry."Reservation Status" < SurplusEntry."Reservation Status"::Surplus THEN
            SurplusEntry.FIELDERROR("Reservation Status");
        SurplusEntry.CALCFIELDS("Action Message Adjustment");
        IF SurplusEntry."Quantity (Base)" + SurplusEntry."Action Message Adjustment" = 0 THEN
            EXIT;

        ActionMessageEntry.RESET;

        IF ActionMessageEntry.FINDLAST THEN
            NextEntryNo := ActionMessageEntry."Entry No." + 1
        ELSE
            NextEntryNo := 1;

        ActionMessageEntry.INIT;
        ActionMessageEntry."Entry No." := NextEntryNo;

        IF SurplusEntry."Quantity (Base)" > 0 THEN BEGIN // Supply: Issue AM directly
            IF SurplusEntry."Planning Flexibility" = SurplusEntry."Planning Flexibility"::None THEN
                EXIT;
            IF NOT (SurplusEntry."Source Type" IN [DATABASE::"Prod. Order Line", DATABASE::"Purchase Line"])
            THEN
                EXIT;

            ActionMessageEntry.TransferFromReservEntry(SurplusEntry);
            ActionMessageEntry.Quantity := -(SurplusEntry."Quantity (Base)" + SurplusEntry."Action Message Adjustment");
            ActionMessageEntry.Type := ActionMessageEntry.Type::New;
            ReservEntry2 := SurplusEntry;
        END ELSE BEGIN // Demand: Find supply and issue AM
            CASE SurplusEntry.Binding OF
                SurplusEntry.Binding::" ":
                    BEGIN
                        IF UseGlobalSettings THEN BEGIN
                            ReservEntry.COPY(SurplusEntry); // Copy filter and sorting
                            ReservEntry.SETRANGE("Reservation Status"); // Remove filter on Reservation Status
                        END ELSE BEGIN
                            GetItemSetup(SurplusEntry);
                            Positive := TRUE;
                            ReservEntry.SETCURRENTKEY(
                              "Item No.", "Variant Code", "Location Code", "Reservation Status",
                              "Shipment Date", "Expected Receipt Date", "Serial No.", "Lot No.");
                            ReservEntry.SETRANGE("Item No.", SurplusEntry."Item No.");
                            ReservEntry.SETRANGE("Variant Code", SurplusEntry."Variant Code");
                            ReservEntry.SETRANGE("Location Code", SurplusEntry."Location Code");
                            ReservEntry.SETFILTER("Expected Receipt Date", GetAvailabilityFilter(SurplusEntry."Shipment Date"));
                            IF FieldFilterNeeded(SurplusEntry, 0) THEN
                                ReservEntry.SETFILTER("Lot No.", GetFieldFilter);
                            IF FieldFilterNeeded(SurplusEntry, 1) THEN
                                ReservEntry.SETFILTER("Serial No.", GetFieldFilter);
                            ReservEntry.SETRANGE(Positive, TRUE);
                        END;
                        ReservEntry.SETRANGE(Binding, ReservEntry.Binding::" ");
                        ReservEntry.SETRANGE("Planning Flexibility", ReservEntry."Planning Flexibility"::Unlimited);
                        ReservEntry.SETFILTER("Source Type", '=%1|=%2', DATABASE::"Purchase Line", DATABASE::"Prod. Order Line");
                    END;
                SurplusEntry.Binding::"Order-to-Order":
                    BEGIN
                        ReservEntry3 := SurplusEntry;
                        SetPointerFilter(ReservEntry3);
                        ReservEntry3.SETRANGE(
                          "Reservation Status", ReservEntry3."Reservation Status"::Reservation, ReservEntry3."Reservation Status"::Tracking);
                        ReservEntry3.SETRANGE(Binding, ReservEntry3.Binding::"Order-to-Order");
                        IF ReservEntry3.FINDFIRST THEN BEGIN
                            ReservEntry3.GET(ReservEntry3."Entry No.", NOT ReservEntry3.Positive);
                            ReservEntry := ReservEntry3;
                            ReservEntry.SETRECFILTER;
                            Found := TRUE;
                        END ELSE BEGIN
                            Found := FALSE;
                            FreeBinding := TRUE;
                        END;
                    END;
            END;

            ActionMessageEntry.Quantity := -(SurplusEntry."Quantity (Base)" + SurplusEntry."Action Message Adjustment");

            IF NOT FreeBinding THEN
                IF ReservEntry.FINDLAST THEN BEGIN
                    IF AllDeletedEntry."Entry No." > 0 THEN // The supply record has been deleted and cannot be reused.
                        REPEAT
                            Found := NOT (
                                          (AllDeletedEntry."Source Type" = ReservEntry."Source Type") AND
                                          (AllDeletedEntry."Source Subtype" = ReservEntry."Source Subtype") AND
                                          (AllDeletedEntry."Source ID" = ReservEntry."Source ID") AND
                                          (AllDeletedEntry."Source Batch Name" = ReservEntry."Source Batch Name") AND
                                          (AllDeletedEntry."Source Prod. Order Line" = ReservEntry."Source Prod. Order Line") AND
                                          (AllDeletedEntry."Source Ref. No." = ReservEntry."Source Ref. No."));
                            IF NOT Found THEN
                                NoMoreData := ReservEntry.NEXT(-1) = 0;
                        UNTIL Found OR NoMoreData
                    ELSE
                        Found := TRUE;
                END;

            IF Found THEN BEGIN
                ActionMessageEntry.TransferFromReservEntry(ReservEntry);
                ActionMessageEntry.Type := ActionMessageEntry.Type::"Change Qty.";
                ReservEntry2 := ReservEntry;
            END ELSE BEGIN
                ActionMessageEntry."Location Code" := SurplusEntry."Location Code";
                ActionMessageEntry."Variant Code" := SurplusEntry."Variant Code";
                ActionMessageEntry."Item No." := SurplusEntry."Item No.";

                CASE SKU."Replenishment System" OF
                    SKU."Replenishment System"::Purchase:
                        ActionMessageEntry."Source Type" := DATABASE::"Purchase Line";
                    SKU."Replenishment System"::"Prod. Order":
                        ActionMessageEntry."Source Type" := DATABASE::"Prod. Order Line";
                    SKU."Replenishment System"::Transfer:
                        ActionMessageEntry."Source Type" := DATABASE::"Transfer Line";
                    SKU."Replenishment System"::Assembly:
                        ActionMessageEntry."Source Type" := DATABASE::"Assembly Header";
                END;

                ActionMessageEntry.Type := ActionMessageEntry.Type::New;
            END;
            ActionMessageEntry."Reservation Entry" := SurplusEntry."Entry No.";
        END;

        SetPointerFilter(ReservEntry2);
        ReservEntry2.SETRANGE(
          "Reservation Status", ReservEntry2."Reservation Status"::Reservation, ReservEntry2."Reservation Status"::Tracking);

        IF ReservEntry2."Source Type" <> DATABASE::"Item Ledger Entry" THEN
            IF ReservEntry2.FINDFIRST THEN BEGIN
                FirstDate := FindDate(ReservEntry2, 0, TRUE);
                IF FirstDate <> 0D THEN BEGIN
                    IF (FORMAT(MfgSetup."Default Dampener Period") = '') OR
                       ((ReservEntry2.Binding = ReservEntry2.Binding::"Order-to-Order") AND
                        (ReservEntry2."Reservation Status" = ReservEntry2."Reservation Status"::Reservation))
                    THEN
                        EVALUATE(MfgSetup."Default Dampener Period", '<0D>');

                    EVALUATE(DateFormula, STRSUBSTNO('%1%2', '-', FORMAT(MfgSetup."Default Dampener Period")));
                    IF CALCDATE(DateFormula, FirstDate) > ReservEntry2."Expected Receipt Date" THEN BEGIN
                        ActionMessageEntry2.SETCURRENTKEY(
                          "Source Type", "Source Subtype", "Source ID", "Source Batch Name", "Source Prod. Order Line", "Source Ref. No.");
                        ActionMessageEntry2.SETRANGE("Source Type", ActionMessageEntry."Source Type");
                        ActionMessageEntry2.SETRANGE("Source Subtype", ActionMessageEntry."Source Subtype");
                        ActionMessageEntry2.SETRANGE("Source ID", ActionMessageEntry."Source ID");
                        ActionMessageEntry2.SETRANGE("Source Batch Name", ActionMessageEntry."Source Batch Name");
                        ActionMessageEntry2.SETRANGE("Source Prod. Order Line", ActionMessageEntry."Source Prod. Order Line");
                        ActionMessageEntry2.SETRANGE("Source Ref. No.", ActionMessageEntry."Source Ref. No.");
                        ActionMessageEntry2.SETRANGE(Quantity, 0);
                        ActionMessageEntry2.DELETEALL;
                        ActionMessageEntry2.RESET;
                        ActionMessageEntry2 := ActionMessageEntry;
                        ActionMessageEntry2.Quantity := 0;
                        ActionMessageEntry2."New Date" := FirstDate;
                        ActionMessageEntry2.Type := ActionMessageEntry.Type::Reschedule;
                        ActionMessageEntry2."Reservation Entry" := ReservEntry2."Entry No.";
                        WHILE NOT ActionMessageEntry2.INSERT DO
                            ActionMessageEntry2."Entry No." += 1;
                        ActionMessageEntry."Entry No." := ActionMessageEntry2."Entry No." + 1;
                    END;
                END;
            END;

        WHILE NOT ActionMessageEntry.INSERT DO
            ActionMessageEntry."Entry No." += 1;
    end;

    [LineStart(60805)]
    procedure ModifyActionMessage(RelatedToEntryNo: Integer; Quantity: Decimal; Delete: Boolean);
    begin
        ActionMessageEntry.RESET;
        ActionMessageEntry.SETCURRENTKEY("Reservation Entry");
        ActionMessageEntry.SETRANGE("Reservation Entry", RelatedToEntryNo);

        IF Delete THEN BEGIN
            ActionMessageEntry.DELETEALL;
            EXIT;
        END;
        ActionMessageEntry.SETRANGE("New Date", 0D);

        IF ActionMessageEntry.FINDFIRST THEN BEGIN
            ActionMessageEntry.Quantity -= Quantity;
            IF ActionMessageEntry.Quantity = 0 THEN
                ActionMessageEntry.DELETE
            ELSE
                ActionMessageEntry.MODIFY;
        END;
    end;

    [LineStart(60824)]
    procedure FindDate(var ReservEntry: Record "Reservation Entry"; Which: Option "Earliest Shipment","Latest Receipt"; ReturnRecord: Boolean): Date;
    var
        ReservEntry2: Record "Reservation Entry";
        LastDate: Date;
    begin
        ReservEntry2.COPY(ReservEntry); // Copy filter and sorting

        IF NOT ReservEntry2.FINDSET THEN
            EXIT;

        CASE Which OF
            0:
                BEGIN
                    LastDate := 12319999D;
                    REPEAT
                        IF ReservEntry2."Shipment Date" < LastDate THEN BEGIN
                            LastDate := ReservEntry2."Shipment Date";
                            IF ReturnRecord THEN
                                ReservEntry := ReservEntry2;
                        END;
                    UNTIL ReservEntry2.NEXT = 0;
                END;
            1:
                BEGIN
                    LastDate := 0D;
                    REPEAT
                        IF ReservEntry2."Expected Receipt Date" > LastDate THEN BEGIN
                            LastDate := ReservEntry2."Expected Receipt Date";
                            IF ReturnRecord THEN
                                ReservEntry := ReservEntry2;
                        END;
                    UNTIL ReservEntry2.NEXT = 0;
                END;
        END;
        EXIT(LastDate);
    end;

    [LineStart(60856)]
    local procedure UpdateDating();
    var
        FilterReservEntry: Record "Reservation Entry";
        ReservEntry2: Record "Reservation Entry";
    begin
        IF CalcReservEntry2."Source Type" = DATABASE::"Planning Component" THEN
            EXIT;

        IF Item."Order Tracking Policy" <> Item."Order Tracking Policy"::"Tracking & Action Msg." THEN
            EXIT;

        IF CalcReservEntry2."Source Type" = DATABASE::"Requisition Line" THEN
            IF ForReqLine."Planning Line Origin" <> ForReqLine."Planning Line Origin"::" " THEN
                EXIT;

        FilterReservEntry := CalcReservEntry2;
        SetPointerFilter(FilterReservEntry);

        IF NOT FilterReservEntry.FINDFIRST THEN
            EXIT;

        IF CalcReservEntry2."Source Type" IN [DATABASE::"Prod. Order Line", DATABASE::"Purchase Line"]
        THEN
            ReservEngineMgt.ModifyActionMessageDating(FilterReservEntry)
        ELSE BEGIN
            IF FilterReservEntry.Positive THEN
                EXIT;
            FilterReservEntry.SETRANGE("Reservation Status", FilterReservEntry."Reservation Status"::Reservation,
              FilterReservEntry."Reservation Status"::Tracking);
            IF NOT FilterReservEntry.FINDSET THEN
                EXIT;
            REPEAT
                IF ReservEntry2.GET(FilterReservEntry."Entry No.", NOT FilterReservEntry.Positive) THEN
                    ReservEngineMgt.ModifyActionMessageDating(ReservEntry2);
            UNTIL FilterReservEntry.NEXT = 0;
        END;
    end;

    [LineStart(60889)]
    procedure ClearActionMessageReferences();
    var
        ActionMessageEntry2: Record "Action Message Entry";
    begin
        ActionMessageEntry.RESET;
        ActionMessageEntry.FilterFromReservEntry(CalcReservEntry);
        IF ActionMessageEntry.FINDSET THEN
            REPEAT
                ActionMessageEntry2 := ActionMessageEntry;
                IF ActionMessageEntry2.Quantity = 0 THEN
                    ActionMessageEntry2.DELETE
                ELSE BEGIN
                    ActionMessageEntry2."Source Subtype" := 0;
                    ActionMessageEntry2."Source ID" := '';
                    ActionMessageEntry2."Source Batch Name" := '';
                    ActionMessageEntry2."Source Prod. Order Line" := 0;
                    ActionMessageEntry2."Source Ref. No." := 0;
                    ActionMessageEntry2."New Date" := 0D;
                    ActionMessageEntry2.MODIFY;
                END;
            UNTIL ActionMessageEntry.NEXT = 0;
    end;

    [LineStart(60908)]
    procedure SetItemTrackingHandling(Mode: Option "None","Allow deletion",Match);
    begin
        ItemTrackingHandling := Mode;
    end;

    [LineStart(60911)]
    procedure DeleteItemTrackingConfirm(): Boolean;
    begin
        IF NOT ItemTrackingExist(CalcReservEntry2) THEN
            EXIT(TRUE);

        IF CONFIRM(Text011, FALSE, CalcReservEntry2."Item No.", CalcReservEntry2.TextCaption) THEN
            EXIT(TRUE);

        EXIT(FALSE);
    end;

    [LineStart(60920)]
    local procedure ItemTrackingExist(var ReservEntry: Record "Reservation Entry"): Boolean;
    var
        ReservEntry2: Record "Reservation Entry";
    begin
        ReservEntry2.COPY(ReservEntry);
        ReservEntry2.SETFILTER("Item Tracking", '> %1', ReservEntry2."Item Tracking"::None);
        EXIT(NOT ReservEntry2.ISEMPTY);
    end;

    [LineStart(60925)]
    procedure SetSerialLotNo(SerialNo: Code[20]; LotNo: Code[20]);
    begin
        CalcReservEntry."Serial No." := SerialNo;
        CalcReservEntry."Lot No." := LotNo;
    end;

    [LineStart(60929)]
    procedure SetMatchFilter(var ReservEntry: Record "Reservation Entry"; var FilterReservEntry: Record "Reservation Entry"; SearchForSupply: Boolean; AvailabilityDate: Date);
    begin
        FilterReservEntry.RESET;
        FilterReservEntry.SETCURRENTKEY(
          "Item No.", "Variant Code", "Location Code", "Reservation Status",
          "Shipment Date", "Expected Receipt Date", "Serial No.", "Lot No.");
        FilterReservEntry.SETRANGE("Item No.", ReservEntry."Item No.");
        FilterReservEntry.SETRANGE("Variant Code", ReservEntry."Variant Code");
        FilterReservEntry.SETRANGE("Location Code", ReservEntry."Location Code");
        FilterReservEntry.SETRANGE("Reservation Status",
          FilterReservEntry."Reservation Status"::Reservation, FilterReservEntry."Reservation Status"::Surplus);
        IF SearchForSupply THEN
            FilterReservEntry.SETFILTER("Expected Receipt Date", '..%1', AvailabilityDate)
        ELSE
            FilterReservEntry.SETFILTER("Shipment Date", '>=%1', AvailabilityDate);
        IF FieldFilterNeeded2(ReservEntry, SearchForSupply, 0) THEN
            FilterReservEntry.SETFILTER("Lot No.", GetFieldFilter);
        IF FieldFilterNeeded2(ReservEntry, SearchForSupply, 1) THEN
            FilterReservEntry.SETFILTER("Serial No.", GetFieldFilter);
        FilterReservEntry.SETRANGE(Positive, SearchForSupply);
    end;

    [LineStart(60949)]
    procedure LookupLine(SourceType: Integer; SourceSubtype: Integer; SourceID: Code[20]; SourceBatchName: Code[10]; SourceProdOrderLine: Integer; SourceRefNo: Integer);
    var
        ItemLedgEntry: Record "Item Ledger Entry";
        SalesLine: Record "Sales Line";
        PurchLine: Record "Purchase Line";
        ItemJnlLine: Record "Item Journal Line";
        ReqLine: Record "Requisition Line";
        ProdOrderLine: Record "Prod. Order Line";
        ProdOrderComp: Record "Prod. Order Component";
        PlanningComponent: Record "Planning Component";
        ServLine: Record "Service Line";
        JobPlanningLine: Record "Job Planning Line";
        AsmHeader: Record "Assembly Header";
        AsmLine: Record "Assembly Line";
    begin
        CASE SourceType OF
            DATABASE::"Sales Line":
                BEGIN
                    SalesLine.RESET;
                    SalesLine.SETRANGE("Document Type", SourceSubtype);
                    SalesLine.SETRANGE("Document No.", SourceID);
                    SalesLine.SETRANGE("Line No.", SourceRefNo);
                    PAGE.RUN(PAGE::"Sales Lines", SalesLine);
                END;
            DATABASE::"Requisition Line":
                BEGIN
                    ReqLine.RESET;
                    ReqLine.SETRANGE("Worksheet Template Name", SourceID);
                    ReqLine.SETRANGE("Journal Batch Name", SourceBatchName);
                    ReqLine.SETRANGE("Line No.", SourceRefNo);
                    PAGE.RUN(PAGE::"Requisition Lines", ReqLine);
                END;
            DATABASE::"Purchase Line":
                BEGIN
                    PurchLine.RESET;
                    PurchLine.SETRANGE("Document Type", SourceSubtype);
                    PurchLine.SETRANGE("Document No.", SourceID);
                    PurchLine.SETRANGE("Line No.", SourceRefNo);
                    PAGE.RUN(PAGE::"Purchase Lines", PurchLine);
                END;
            DATABASE::"Item Journal Line":
                BEGIN
                    ItemJnlLine.RESET;
                    ItemJnlLine.SETRANGE("Journal Template Name", SourceID);
                    ItemJnlLine.SETRANGE("Journal Batch Name", SourceBatchName);
                    ItemJnlLine.SETRANGE("Line No.", SourceRefNo);
                    ItemJnlLine.SETRANGE("Entry Type", SourceSubtype);
                    PAGE.RUN(PAGE::"Item Journal Lines", ItemJnlLine);
                END;
            DATABASE::"Item Ledger Entry":
                BEGIN
                    ItemLedgEntry.RESET;
                    ItemLedgEntry.SETRANGE("Entry No.", SourceRefNo);
                    PAGE.RUN(0, ItemLedgEntry);
                END;
            DATABASE::"Prod. Order Line":
                BEGIN
                    ProdOrderLine.RESET;
                    ProdOrderLine.SETRANGE(Status, SourceSubtype);
                    ProdOrderLine.SETRANGE("Prod. Order No.", SourceID);
                    ProdOrderLine.SETRANGE("Line No.", SourceProdOrderLine);
                    PAGE.RUN(0, ProdOrderLine);
                END;
            DATABASE::"Prod. Order Component":
                BEGIN
                    ProdOrderComp.RESET;
                    ProdOrderComp.SETRANGE(Status, SourceSubtype);
                    ProdOrderComp.SETRANGE("Prod. Order No.", SourceID);
                    ProdOrderComp.SETRANGE("Prod. Order Line No.", SourceProdOrderLine);
                    ProdOrderComp.SETRANGE("Line No.", SourceRefNo);
                    PAGE.RUN(0, ProdOrderComp);
                END;
            DATABASE::"Planning Component":
                BEGIN
                    PlanningComponent.RESET;
                    PlanningComponent.SETRANGE("Worksheet Template Name", SourceID);
                    PlanningComponent.SETRANGE("Worksheet Batch Name", SourceBatchName);
                    PlanningComponent.SETRANGE("Worksheet Line No.", SourceProdOrderLine);
                    PlanningComponent.SETRANGE("Line No.", SourceRefNo);
                    PAGE.RUN(0, PlanningComponent);
                END;
            DATABASE::"Service Line":
                BEGIN
                    ServLine.RESET;
                    ServLine.SETRANGE("Document Type", SourceSubtype);
                    ServLine.SETRANGE("Document No.", SourceID);
                    ServLine.SETRANGE("Line No.", SourceRefNo);
                    PAGE.RUN(0, ServLine);
                END;
            DATABASE::"Job Planning Line":
                BEGIN
                    JobPlanningLine.RESET;
                    JobPlanningLine.SETCURRENTKEY("Job Contract Entry No.");
                    JobPlanningLine.SETRANGE("Job Contract Entry No.", SourceRefNo);
                    PAGE.RUN(0, JobPlanningLine);
                END;
            DATABASE::"Assembly Header":
                BEGIN
                    AsmHeader.RESET;
                    AsmHeader.SETRANGE("Document Type", SourceSubtype);
                    AsmHeader.SETRANGE("No.", SourceID);
                    PAGE.RUN(PAGE::"Assembly Orders", AsmHeader);
                END;
            DATABASE::"Assembly Line":
                BEGIN
                    AsmLine.RESET;
                    AsmLine.SETRANGE("Document Type", SourceSubtype);
                    AsmLine.SETRANGE("Document No.", SourceID);
                    AsmLine.SETRANGE("Line No.", SourceRefNo);
                    PAGE.RUN(PAGE::"Assembly Lines", AsmLine);
                END;
        END;
    end;

    [LineStart(61048)]
    procedure LookupDocument(SourceType: Integer; SourceSubtype: Integer; SourceID: Code[20]; SourceBatchName: Code[10]; SourceProdOrderLine: Integer; SourceRefNo: Integer);
    var
        SalesHeader: Record "Sales Header";
        PurchHeader: Record "Purchase Header";
        ReqLine: Record "Requisition Line";
        ItemJnlLine: Record "Item Journal Line";
        ItemLedgEntry: Record "Item Ledger Entry";
        ProdOrder: Record "Production Order";
        TransHeader: Record "Transfer Header";
        ServiceHeader: Record "Service Header";
        Job: Record Job;
        AsmHeader: Record "Assembly Header";
    begin
        CASE SourceType OF
            DATABASE::"Sales Line":
                BEGIN
                    SalesHeader.RESET;
                    SalesHeader.SETRANGE("Document Type", SourceSubtype);
                    SalesHeader.SETRANGE("No.", SourceID);
                    CASE SourceSubtype OF
                        0:
                            PAGE.RUNMODAL(PAGE::"Sales Quote", SalesHeader);
                        1:
                            PAGE.RUNMODAL(PAGE::"Sales Order", SalesHeader);
                        2:
                            PAGE.RUNMODAL(PAGE::"Sales Invoice", SalesHeader);
                        3:
                            PAGE.RUNMODAL(PAGE::"Sales Credit Memo", SalesHeader);
                        5:
                            PAGE.RUNMODAL(PAGE::"Sales Return Order", SalesHeader);
                    END;
                END;
            DATABASE::"Requisition Line":
                BEGIN
                    ReqLine.RESET;
                    ReqLine.SETRANGE("Worksheet Template Name", SourceID);
                    ReqLine.SETRANGE("Journal Batch Name", SourceBatchName);
                    ReqLine.SETRANGE("Line No.", SourceRefNo);
                    PAGE.RUNMODAL(PAGE::"Requisition Lines", ReqLine);
                END;
            DATABASE::"Planning Component":
                BEGIN
                    ReqLine.RESET;
                    ReqLine.SETRANGE("Worksheet Template Name", SourceID);
                    ReqLine.SETRANGE("Journal Batch Name", SourceBatchName);
                    ReqLine.SETRANGE("Line No.", SourceProdOrderLine);
                    PAGE.RUNMODAL(PAGE::"Requisition Lines", ReqLine);
                END;
            DATABASE::"Purchase Line":
                BEGIN
                    PurchHeader.RESET;
                    PurchHeader.SETRANGE("Document Type", SourceSubtype);
                    PurchHeader.SETRANGE("No.", SourceID);
                    CASE SourceSubtype OF
                        0:
                            PAGE.RUNMODAL(PAGE::"Purchase Quote", PurchHeader);
                        1:
                            PAGE.RUNMODAL(PAGE::"Purchase Order", PurchHeader);
                        2:
                            PAGE.RUNMODAL(PAGE::"Purchase Invoice", PurchHeader);
                        3:
                            PAGE.RUNMODAL(PAGE::"Purchase Credit Memo", PurchHeader);
                        5:
                            PAGE.RUNMODAL(PAGE::"Purchase Return Order", PurchHeader);
                    END;
                END;
            DATABASE::"Item Journal Line":
                BEGIN
                    ItemJnlLine.RESET;
                    ItemJnlLine.SETRANGE("Journal Template Name", SourceID);
                    ItemJnlLine.SETRANGE("Journal Batch Name", SourceBatchName);
                    ItemJnlLine.SETRANGE("Line No.", SourceRefNo);
                    ItemJnlLine.SETRANGE("Entry Type", SourceSubtype);
                    PAGE.RUNMODAL(PAGE::"Item Journal Lines", ItemJnlLine);
                END;
            DATABASE::"Item Ledger Entry":
                BEGIN
                    ItemLedgEntry.RESET;
                    ItemLedgEntry.SETRANGE("Entry No.", SourceRefNo);
                    PAGE.RUNMODAL(0, ItemLedgEntry);
                END;
            DATABASE::"Prod. Order Line",
            DATABASE::"Prod. Order Component":
                BEGIN
                    ProdOrder.RESET;
                    ProdOrder.SETRANGE(Status, SourceSubtype);
                    ProdOrder.SETRANGE("No.", SourceID);
                    CASE SourceSubtype OF
                        0:
                            PAGE.RUNMODAL(PAGE::"Simulated Production Order", ProdOrder);
                        1:
                            PAGE.RUNMODAL(PAGE::"Planned Production Order", ProdOrder);
                        2:
                            PAGE.RUNMODAL(PAGE::"Firm Planned Prod. Order", ProdOrder);
                        3:
                            PAGE.RUNMODAL(PAGE::"Released Production Order", ProdOrder);
                    END;
                END;
            DATABASE::"Transfer Line":
                BEGIN
                    TransHeader.RESET;
                    TransHeader.SETRANGE("No.", SourceID);
                    PAGE.RUNMODAL(PAGE::"Transfer Order", TransHeader);
                END;
            DATABASE::"Service Line":
                BEGIN
                    ServiceHeader.RESET;
                    ServiceHeader.SETRANGE("Document Type", SourceSubtype);
                    ServiceHeader.SETRANGE("No.", SourceID);
                    IF SourceSubtype = 0 THEN
                        PAGE.RUNMODAL(PAGE::"Service Quote", ServiceHeader)
                    ELSE
                        PAGE.RUNMODAL(PAGE::"Service Order", ServiceHeader);
                END;
            DATABASE::"Job Planning Line":
                BEGIN
                    Job.RESET;
                    Job.SETRANGE("No.", SourceID);
                    PAGE.RUNMODAL(PAGE::"Job Card", Job)
                END;
            DATABASE::"Assembly Header",
            DATABASE::"Assembly Line":
                BEGIN
                    AsmHeader.RESET;
                    AsmHeader.SETRANGE("Document Type", SourceSubtype);
                    AsmHeader.SETRANGE("No.", SourceID);
                    CASE SourceSubtype OF
                        0:
                            ;
                        1:
                            PAGE.RUNMODAL(PAGE::"Assembly Order", AsmHeader);
                        5:
                            ;
                    END;
                END;
        END;
    end;

    [LineStart(61173)]
    local procedure CallCalcReservedQtyOnPick();
    begin
        IF Positive AND
           (CalcReservEntry."Location Code" <> '') AND
           Location.GET(CalcReservEntry."Location Code") AND
           (Location."Bin Mandatory" OR Location."Require Pick")
        THEN
            CalcReservedQtyOnPick(TotalAvailQty, QtyAllocInWhse);
    end;

    [LineStart(61181)]
    local procedure CalcReservedQtyOnPick(var AvailQty: Decimal; var AllocQty: Decimal);
    var
        WhseActivLine: Record "Warehouse Activity Line";
        TempWhseActivLine2: Record "Warehouse Activity Line" temporary;
        WhseAvailMgt: Codeunit "Warehouse Availability Mgt.";
        PickQty: Decimal;
        QtyOnOutboundBins: Decimal;
        QtyOnInvtMovement: Decimal;
        QtyOnAssemblyBin: Decimal;
    begin
        WITH CalcReservEntry DO BEGIN
            GetItemSetup(CalcReservEntry);
            Item.SETRANGE("Location Filter", "Location Code");
            Item.SETRANGE("Variant Filter", "Variant Code");
            IF "Lot No." <> '' THEN
                Item.SETRANGE("Lot No. Filter", "Lot No.");
            IF "Serial No." <> '' THEN
                Item.SETRANGE("Serial No. Filter", "Serial No.");
            Item.CALCFIELDS(
              Inventory, "Reserved Qty. on Inventory");

            WhseActivLine.SETCURRENTKEY(
              "Item No.", "Bin Code", "Location Code", "Action Type", "Variant Code",
              "Unit of Measure Code", "Breakbulk No.", "Activity Type", "Lot No.", "Serial No.");

            WhseActivLine.SETRANGE("Item No.", "Item No.");
            IF Location."Bin Mandatory" THEN
                WhseActivLine.SETFILTER("Bin Code", '<>%1', '');
            WhseActivLine.SETRANGE("Location Code", "Location Code");
            WhseActivLine.SETFILTER(
              "Action Type", '%1|%2', WhseActivLine."Action Type"::" ", WhseActivLine."Action Type"::Take);
            WhseActivLine.SETRANGE("Variant Code", "Variant Code");
            WhseActivLine.SETRANGE("Breakbulk No.", 0);
            WhseActivLine.SETFILTER(
              "Activity Type", '%1|%2', WhseActivLine."Activity Type"::Pick, WhseActivLine."Activity Type"::"Invt. Pick");
            IF "Lot No." <> '' THEN
                WhseActivLine.SETRANGE("Lot No.", "Lot No.");
            IF "Serial No." <> '' THEN
                WhseActivLine.SETRANGE("Serial No.", "Serial No.");
            WhseActivLine.CALCSUMS("Qty. Outstanding (Base)");

            IF Location."Require Pick" THEN BEGIN
                QtyOnOutboundBins :=
                  CreatePick.CalcQtyOnOutboundBins(
                    "Location Code", "Item No.", "Variant Code", "Lot No.", "Serial No.", TRUE);

                QtyReservedOnPickShip :=
                  WhseAvailMgt.CalcReservQtyOnPicksShips(
                    "Location Code", "Item No.", "Variant Code", TempWhseActivLine2);

                QtyOnInvtMovement := CalcQtyOnInvtMovement(WhseActivLine);

                QtyOnAssemblyBin :=
                  WhseAvailMgt.CalcQtyOnAssemblyBin("Location Code", "Item No.", "Variant Code", "Lot No.", "Serial No.");
            END;

            AllocQty :=
              WhseActivLine."Qty. Outstanding (Base)" + QtyOnInvtMovement + QtyOnOutboundBins + QtyOnAssemblyBin;
            PickQty := WhseActivLine."Qty. Outstanding (Base)" + QtyOnInvtMovement;

            AvailQty :=
              Item.Inventory - PickQty - QtyOnOutboundBins - QtyOnAssemblyBin -
              Item."Reserved Qty. on Inventory" + QtyReservedOnPickShip;
        END;
    end;

    [LineStart(61237)]
    local procedure JobJnlLineUpdateValues(var CurrentJobJnlLine: Record "Job Journal Line"; var QtyToReserve: Decimal; var QtyReservedThisLine: Decimal);
    begin
        WITH CurrentJobJnlLine DO BEGIN
            CALCFIELDS("Reserved Qty. (Base)");
            QtyReservedThisLine := "Reserved Qty. (Base)";
            QtyToReserve := "Quantity (Base)" - "Reserved Qty. (Base)";
        END;
    end;

    [LineStart(61244)]
    local procedure SaveItemTrackingAsSurplus(var ReservEntry: Record "Reservation Entry"; NewQty: Decimal; NewQtyBase: Decimal) QuantityIsValidated: Boolean;
    var
        SurplusEntry: Record "Reservation Entry";
        CreateReservEntry2: Codeunit "Create Reserv. Entry";
        QtyToSave: Decimal;
        QtyToSaveBase: Decimal;
        QtyToHandleThisLine: Decimal;
        QtyToInvoiceThisLine: Decimal;
        SignFactor: Integer;
    begin
        QtyToSave := ReservEntry.Quantity - NewQty;
        QtyToSaveBase := ReservEntry."Quantity (Base)" - NewQtyBase;

        IF QtyToSaveBase = 0 THEN
            EXIT;

        IF ReservEntry."Item Tracking" = ReservEntry."Item Tracking"::None THEN
            EXIT;

        IF ReservEntry."Source Type" = DATABASE::"Item Ledger Entry" THEN
            EXIT;

        IF QtyToSaveBase * ReservEntry."Quantity (Base)" < 0 THEN
            ReservEntry.FIELDERROR("Quantity (Base)");

        SignFactor := ReservEntry."Quantity (Base)" / ABS(ReservEntry."Quantity (Base)");

        IF SignFactor * QtyToSaveBase > SignFactor * ReservEntry."Quantity (Base)" THEN
            ReservEntry.FIELDERROR("Quantity (Base)");

        QtyToHandleThisLine := ReservEntry."Qty. to Handle (Base)" - NewQtyBase;
        QtyToInvoiceThisLine := ReservEntry."Qty. to Invoice (Base)" - NewQtyBase;

        ReservEntry.VALIDATE("Quantity (Base)", NewQtyBase);

        IF SignFactor * QtyToHandleThisLine < 0 THEN BEGIN
            ReservEntry.VALIDATE("Qty. to Handle (Base)", ReservEntry."Qty. to Handle (Base)" + QtyToHandleThisLine);
            QtyToHandleThisLine := 0;
        END;

        IF SignFactor * QtyToInvoiceThisLine < 0 THEN BEGIN
            ReservEntry.VALIDATE("Qty. to Invoice (Base)", ReservEntry."Qty. to Invoice (Base)" + QtyToInvoiceThisLine);
            QtyToInvoiceThisLine := 0;
        END;

        QuantityIsValidated := TRUE;

        SurplusEntry := ReservEntry;
        SurplusEntry."Reservation Status" := SurplusEntry."Reservation Status"::Surplus;
        IF SurplusEntry.Positive THEN
            SurplusEntry."Shipment Date" := 0D
        ELSE
            SurplusEntry."Expected Receipt Date" := 0D;
        CreateReservEntry2.SetQtyToHandleAndInvoice(QtyToHandleThisLine, QtyToInvoiceThisLine);
        CreateReservEntry2.CreateRemainingReservEntry(SurplusEntry, QtyToSave, QtyToSaveBase);
    end;

    [LineStart(61291)]
    procedure CalcIsAvailTrackedQtyInBin(ItemNo: Code[20]; BinCode: Code[20]; LocationCode: Code[10]; VariantCode: Code[10]; SourceType: Integer; SourceSubtype: Integer; SourceID: Code[20]; SourceBatchName: Code[10]; SourceProdOrderLine: Integer; SourceRefNo: Integer): Boolean;
    var
        ReservationEntry: Record "Reservation Entry";
        WhseEntry: Record "Warehouse Entry";
        ItemTrackingMgt: Codeunit "Item Tracking Management";
        WhseSNRequired: Boolean;
        WhseLNRequired: Boolean;
    begin
        ItemTrackingMgt.CheckWhseItemTrkgSetup(ItemNo, WhseSNRequired, WhseLNRequired, FALSE);
        IF NOT (WhseSNRequired OR WhseLNRequired) OR (BinCode = '') THEN
            EXIT(TRUE);
        ReservationEntry.SETRANGE("Source Type", SourceType);
        ReservationEntry.SETRANGE("Source Subtype", SourceSubtype);
        ReservationEntry.SETRANGE("Source ID", SourceID);
        ReservationEntry.SETRANGE("Source Batch Name", SourceBatchName);
        ReservationEntry.SETRANGE("Source Prod. Order Line", SourceProdOrderLine);
        ReservationEntry.SETRANGE("Source Ref. No.", SourceRefNo);
        ReservationEntry.SETRANGE(Positive, FALSE);

        IF ReservationEntry.FINDSET THEN
            REPEAT
                IF ReservEntryPositiveTypeIsItemLedgerEntry(ReservationEntry."Entry No.") THEN BEGIN
                    WhseEntry.SETCURRENTKEY("Item No.", "Location Code", "Variant Code", "Bin Type Code");
                    WhseEntry.SETRANGE("Item No.", ItemNo);
                    WhseEntry.SETRANGE("Location Code", LocationCode);
                    WhseEntry.SETRANGE("Bin Code", BinCode);
                    WhseEntry.SETRANGE("Variant Code", VariantCode);
                    IF ReservationEntry."Lot No." <> '' THEN
                        WhseEntry.SETRANGE("Lot No.", ReservationEntry."Lot No.");
                    IF ReservationEntry."Serial No." <> '' THEN
                        WhseEntry.SETRANGE("Serial No.", ReservationEntry."Serial No.");
                    WhseEntry.CALCSUMS("Qty. (Base)");
                    IF WhseEntry."Qty. (Base)" < ABS(ReservationEntry."Quantity (Base)") THEN
                        EXIT(FALSE);
                END;
            UNTIL ReservationEntry.NEXT = 0;

        EXIT(TRUE);
    end;

    [LineStart(61323)]
    local procedure CalcQtyOnInvtMovement(var WarehouseActivityLine: Record "Warehouse Activity Line"): Decimal;
    var
        xWarehouseActivityLine: Record "Warehouse Activity Line";
        OutstandingQty: Decimal;
    begin
        xWarehouseActivityLine.COPY(WarehouseActivityLine);

        WarehouseActivityLine.SETRANGE("Activity Type", WarehouseActivityLine."Activity Type"::"Invt. Movement");
        IF WarehouseActivityLine.FIND('-') THEN
            REPEAT
                IF WarehouseActivityLine."Source Type" <> 0 THEN
                    OutstandingQty += WarehouseActivityLine."Qty. Outstanding (Base)"
            UNTIL WarehouseActivityLine.NEXT = 0;

        WarehouseActivityLine.COPY(xWarehouseActivityLine);
        EXIT(OutstandingQty);
    end;

    [LineStart(61336)]
    procedure SetAppliedDeliveryChallanEntry(NewAppDelChEntry: Record "Applied Delivery Challan Entry");
    var
        DeliveryChallanLn: Record "Delivery Challan Line";
        Item2: Record Item;
    begin
        CLEARALL;
        TempTrackingSpecification.DELETEALL;

        ForAppDelChEntry := NewAppDelChEntry;
        DeliveryChallanLn.GET(NewAppDelChEntry."Applied Delivery Challan No.", NewAppDelChEntry."App. Delivery Challan Line No.");
        Item2.GET(NewAppDelChEntry."Item No.");
        CalcReservEntry."Source Type" := DATABASE::"Applied Delivery Challan Entry";
        CalcReservEntry."Source ID" := '';
        CalcReservEntry."Source Prod. Order Line" := 0;
        CalcReservEntry."Source Ref. No." := NewAppDelChEntry."Entry No.";

        CalcReservEntry."Item No." := NewAppDelChEntry."Item No.";
        CalcReservEntry."Variant Code" := DeliveryChallanLn."Variant Code";
        CalcReservEntry."Location Code" := DeliveryChallanLn."Vendor Location";
        CalcReservEntry."Serial No." := '';
        CalcReservEntry."Lot No." := '';
        CalcReservEntry."Qty. per Unit of Measure" := DeliveryChallanLn."Quantity per";
        CalcReservEntry.Description := Item2.Description;

        CalcReservEntry2 := CalcReservEntry;

        GetItemSetup(CalcReservEntry);

        Positive := ForAppDelChEntry.Quantity > 0;

        SetPointerFilter(CalcReservEntry2);
    end;

    [LineStart(61364)]
    local procedure ProdJnlLineEntry(ReservationEntry: Record "Reservation Entry"): Boolean;
    begin
        WITH ReservationEntry DO
            EXIT(("Source Type" = DATABASE::"Item Journal Line") AND ("Source Subtype" = 6));
    end;

    [LineStart(61368)]
    local procedure CalcDownToQtySyncingToAssembly(ReservEntry: Record "Reservation Entry"): Decimal;
    var
        SynchronizingSalesLine: Record "Sales Line";
    begin
        IF ReservEntry."Source Type" = DATABASE::"Sales Line" THEN BEGIN
            SynchronizingSalesLine.GET(ReservEntry."Source Subtype", ReservEntry."Source ID", ReservEntry."Source Ref. No.");
            IF (Item."Order Tracking Policy" <> Item."Order Tracking Policy"::None) AND
               (Item."Assembly Policy" = Item."Assembly Policy"::"Assemble-to-Order") AND
               (Item."Replenishment System" = Item."Replenishment System"::Assembly) AND
               (SynchronizingSalesLine."Quantity (Base)" = 0)
            THEN
                EXIT(ReservEntry."Quantity (Base)" * CreateReservEntry.SignFactor(ReservEntry));
        END;
    end;

    [LineStart(61379)]
    procedure CreateTrackingSpecification(var TrackingSpecification: Record "Tracking Specification"; FromType: Option " ",Sales,"Requisition Line",Purchase,"Item Journal","BOM Journal"; FromSubtype: Integer; FromID: Code[20]; FromBatchName: Code[10]; FromProdOrderLine: Integer; FromRefNo: Integer; FromVariantCode: Code[10]; FromLocationCode: Code[10]; FromSerialNo: Code[20]; FromLotNo: Code[20]; FromQtyPerUOM: Decimal);
    begin
        WITH TrackingSpecification DO BEGIN
            "Source Type" := FromType;
            "Source Subtype" := FromSubtype;
            "Source ID" := FromID;
            "Source Batch Name" := FromBatchName;
            "Source Prod. Order Line" := FromProdOrderLine;
            "Source Ref. No." := FromRefNo;
            "Variant Code" := FromVariantCode;
            "Location Code" := FromLocationCode;
            "Serial No." := FromSerialNo;
            "Lot No." := FromLotNo;
            "Qty. per Unit of Measure" := FromQtyPerUOM;
        END;
    end;

    [LineStart(61394)]
    local procedure CalcCurrLineReservQtyOnPicksShips(SourceType: Integer; SourceSubtype: Option; SourceID: Code[20]; SourceRefNo: Integer; SourceProdOrderLine: Integer): Decimal;
    var
        ReservEntry: Record "Reservation Entry";
        WhseActivLine: Record "Warehouse Activity Line";
        WhseAvailMgt: Codeunit "Warehouse Availability Mgt.";
    begin
        WITH ReservEntry DO BEGIN
            SETRANGE("Source Type", SourceType);
            SETRANGE("Source Subtype", SourceSubtype);
            SETRANGE("Source ID", SourceID);
            SETRANGE("Source Ref. No.", SourceRefNo);
            SETRANGE("Source Prod. Order Line", SourceProdOrderLine);
            SETRANGE("Reservation Status", "Reservation Status"::Reservation);
            CALCSUMS("Quantity (Base)");
            EXIT(
              WhseAvailMgt.CalcLineReservQtyOnPicksShips(
                SourceType, SourceSubtype,
                SourceID, SourceRefNo,
                SourceProdOrderLine, "Quantity (Base)",
                WhseActivLine));
        END;
    end;

    [LineStart(61411)]
    local procedure CheckQuantityIsCompletelyReleased(QtyToRelease: Decimal; DeleteAll: Boolean; CurrentSerialNo: Code[20]; CurrentLotNo: Code[20]; ReservEntry: Record "Reservation Entry");
    begin
        IF QtyToRelease = 0 THEN
            EXIT;

        IF ItemTrackingHandling = ItemTrackingHandling::None THEN BEGIN
            IF DeleteAll THEN
                ERROR(Text010, ReservEntry."Item No.", ReservEntry.TextCaption);
            IF NOT ProdJnlLineEntry(ReservEntry) THEN
                ERROR(Text008, ReservEntry."Item No.", ReservEntry.TextCaption);
        END;

        IF ItemTrackingHandling = ItemTrackingHandling::Match THEN
            ERROR(Text009, CurrentSerialNo, CurrentLotNo, ABS(QtyToRelease));
    end;

    [LineStart(61425)]
    local procedure ReservEntryPositiveTypeIsItemLedgerEntry(ReservationEntryNo: Integer): Boolean;
    var
        ReservationEntryPositive: Record "Reservation Entry";
    begin
        IF ReservationEntryPositive.GET(ReservationEntryNo, TRUE) THEN
            EXIT(ReservationEntryPositive."Source Type" = DATABASE::"Item Ledger Entry");

        EXIT(TRUE);
    end;

    [LineStart(61431)]
    procedure "--B2BSP--"();
    begin
    end;

    [LineStart(61434)]
    procedure SetDelChallanLine(NewScheduleComp: Record Schedule2);
    var
        DelChallanHeadLRec: Record "Sales Header";
    begin
        DelChallanHeadLRec.GET(NewScheduleComp."Document No.");

        CLEARALL;
        TempTrackingSpecification.DELETEALL;

        ForDelChallanLine := NewScheduleComp;

        CalcReservEntry."Source Type" := DATABASE::Schedule2;
        CalcReservEntry."Source Subtype" := 0;
        CalcReservEntry."Source ID" := NewScheduleComp."Document No.";
        CalcReservEntry."Source Ref. No." := NewScheduleComp."Line No.";
        CalcReservEntry."Source Prod. Order Line" := NewScheduleComp."Document Line No.";
        CalcReservEntry."Item No." := NewScheduleComp."No.";

        CalcReservEntry."Location Code" := DelChallanHeadLRec."Location Code";
        CalcReservEntry."Serial No." := '';
        CalcReservEntry."Lot No." := '';
        CalcReservEntry."Qty. per Unit of Measure" := NewScheduleComp."Qty. per Unit of Measure";
        CalcReservEntry.Description := NewScheduleComp.Description;
        CalcReservEntry2 := CalcReservEntry;
        GetItemSetup(CalcReservEntry);

        Positive :=
          ((CreateReservEntry.SignFactor(CalcReservEntry) * ForDelChallanLine."Outstanding Qty.(Base)") <= 0);

        SetPointerFilter(CalcReservEntry2);
    end;
}

