codeunit 99000834 "Purch. Line-Reserve"
{
    // version NAVW19.00.00.50868

    Permissions = TableData "Reservation Entry"=rimd;

    trigger OnRun();
    begin
    end;

    var
        Text000 : TextConst ENU='Reserved quantity cannot be greater than %1',ENN='Reserved quantity cannot be greater than %1';
        Text001 : TextConst ENU='must be filled in when a quantity is reserved',ENN='must be filled in when a quantity is reserved';
        Text002 : TextConst ENU='must not be filled in when a quantity is reserved',ENN='must not be filled in when a quantity is reserved';
        Text003 : TextConst ENU='must not be changed when a quantity is reserved',ENN='must not be changed when a quantity is reserved';
        Text004 : TextConst ENU='Codeunit is not initialized correctly.',ENN='Codeunit is not initialized correctly.';
        CreateReservEntry : Codeunit "Create Reserv. Entry";
        ReservEngineMgt : Codeunit "Reservation Engine Mgt.";
        ReservMgt : Codeunit "Reservation Management";
        ItemTrackingMgt : Codeunit "Item Tracking Management";
        Blocked : Boolean;
        SetFromType : Option " ",Sales,"Requisition Line",Purchase,"Item Journal","BOM Journal","Item Ledger Entry",Service,Job;
        SetFromSubtype : Integer;
        SetFromID : Code[20];
        SetFromBatchName : Code[10];
        SetFromProdOrderLine : Integer;
        SetFromRefNo : Integer;
        SetFromVariantCode : Code[10];
        SetFromLocationCode : Code[10];
        SetFromSerialNo : Code[20];
        SetFromLotNo : Code[20];
        SetFromQtyPerUOM : Decimal;
        ApplySpecificItemTracking : Boolean;
        OverruleItemTracking : Boolean;
        DeleteItemTracking : Boolean;

    [LineStart(57110)]
    procedure CreateReservation(var PurchLine : Record "Purchase Line";Description : Text[50];ExpectedReceiptDate : Date;Quantity : Decimal;QuantityBase : Decimal;ForSerialNo : Code[20];ForLotNo : Code[20]);
    var
        ShipmentDate : Date;
        SignFactor : Integer;
    begin
        IF SetFromType = 0 THEN
          ERROR(Text004);

        PurchLine.TESTFIELD(Type,PurchLine.Type::Item);
        PurchLine.TESTFIELD("No.");
        PurchLine.TESTFIELD("Expected Receipt Date");
        PurchLine.CALCFIELDS("Reserved Qty. (Base)");
        IF ABS(PurchLine."Outstanding Qty. (Base)") < ABS(PurchLine."Reserved Qty. (Base)") + QuantityBase THEN
          ERROR(
            Text000,
            ABS(PurchLine."Outstanding Qty. (Base)") - ABS(PurchLine."Reserved Qty. (Base)"));

        PurchLine.TESTFIELD("Variant Code",SetFromVariantCode);
        PurchLine.TESTFIELD("Location Code",SetFromLocationCode);

        IF PurchLine."Document Type" = PurchLine."Document Type"::"Return Order" THEN
          SignFactor := -1
        ELSE
          SignFactor := 1;

        IF QuantityBase * SignFactor < 0 THEN
          ShipmentDate := PurchLine."Expected Receipt Date"
        ELSE BEGIN
          ShipmentDate := ExpectedReceiptDate;
          ExpectedReceiptDate := PurchLine."Expected Receipt Date";
        END;

        IF PurchLine."Planning Flexibility" <> PurchLine."Planning Flexibility"::Unlimited THEN
          CreateReservEntry.SetPlanningFlexibility(PurchLine."Planning Flexibility");

        CreateReservEntry.CreateReservEntryFor(
          DATABASE::"Purchase Line",PurchLine."Document Type",
          PurchLine."Document No.",'',0,PurchLine."Line No.",PurchLine."Qty. per Unit of Measure",
          Quantity,QuantityBase,ForSerialNo,ForLotNo);
        CreateReservEntry.CreateReservEntryFrom(
          SetFromType,SetFromSubtype,SetFromID,SetFromBatchName,SetFromProdOrderLine,SetFromRefNo,
          SetFromQtyPerUOM,SetFromSerialNo,SetFromLotNo);
        CreateReservEntry.CreateReservEntry(
          PurchLine."No.",PurchLine."Variant Code",PurchLine."Location Code",
          Description,ExpectedReceiptDate,ShipmentDate);

        SetFromType := 0;
    end;

    [LineStart(57154)]
    procedure CreateReservationSetFrom(TrackingSpecificationFrom : Record "Tracking Specification");
    begin
        WITH TrackingSpecificationFrom DO BEGIN
          SetFromType := "Source Type";
          SetFromSubtype := "Source Subtype";
          SetFromID := "Source ID";
          SetFromBatchName := "Source Batch Name";
          SetFromProdOrderLine := "Source Prod. Order Line";
          SetFromRefNo := "Source Ref. No.";
          SetFromVariantCode := "Variant Code";
          SetFromLocationCode := "Location Code";
          SetFromSerialNo := "Serial No.";
          SetFromLotNo := "Lot No.";
          SetFromQtyPerUOM := "Qty. per Unit of Measure";
        END;
    end;

    [LineStart(57169)]
    procedure FilterReservFor(var FilterReservEntry : Record "Reservation Entry";PurchLine : Record "Purchase Line");
    begin
        FilterReservEntry.SETRANGE("Source Type",DATABASE::"Purchase Line");
        FilterReservEntry.SETRANGE("Source Subtype",PurchLine."Document Type");
        FilterReservEntry.SETRANGE("Source ID",PurchLine."Document No.");
        FilterReservEntry.SETRANGE("Source Batch Name",'');
        FilterReservEntry.SETRANGE("Source Prod. Order Line",0);
        FilterReservEntry.SETRANGE("Source Ref. No.",PurchLine."Line No.");
    end;

    [LineStart(57177)]
    procedure ReservQuantity(PurchLine : Record "Purchase Line") QtyToReserve : Decimal;
    begin
        CASE PurchLine."Document Type" OF
          PurchLine."Document Type"::Quote,
          PurchLine."Document Type"::Order,
          PurchLine."Document Type"::Invoice,
          PurchLine."Document Type"::"Blanket Order":
            QtyToReserve := -PurchLine."Outstanding Qty. (Base)";
          PurchLine."Document Type"::"Return Order",
          PurchLine."Document Type"::"Credit Memo":
            QtyToReserve := PurchLine."Outstanding Qty. (Base)";
        END;
    end;

    [LineStart(57189)]
    procedure Caption(PurchLine : Record "Purchase Line") CaptionText : Text[80];
    begin
        CaptionText :=
          STRSUBSTNO('%1 %2 %3',PurchLine."Document Type",PurchLine."Document No.",PurchLine."No.");
    end;

    [LineStart(57193)]
    procedure FindReservEntry(PurchLine : Record "Purchase Line";var ReservEntry : Record "Reservation Entry") : Boolean;
    begin
        ReservEngineMgt.InitFilterAndSortingLookupFor(ReservEntry,FALSE);
        FilterReservFor(ReservEntry,PurchLine);
        EXIT(ReservEntry.FINDLAST);
    end;

    [LineStart(57198)]
    procedure ReservEntryExist(PurchLine : Record "Purchase Line") : Boolean;
    var
        ReservEntry : Record "Reservation Entry";
    begin
        ReservEngineMgt.InitFilterAndSortingLookupFor(ReservEntry,FALSE);
        FilterReservFor(ReservEntry,PurchLine);
        EXIT(NOT ReservEntry.ISEMPTY);
    end;

    [LineStart(57203)]
    procedure VerifyChange(var NewPurchLine : Record "Purchase Line";var OldPurchLine : Record "Purchase Line");
    var
        PurchLine : Record "Purchase Line";
        TempReservEntry : Record "Reservation Entry";
        ShowError : Boolean;
        HasError : Boolean;
    begin
        IF (NewPurchLine.Type <> NewPurchLine.Type::Item) AND (OldPurchLine.Type <> OldPurchLine.Type::Item) THEN
          EXIT;
        IF Blocked THEN
          EXIT;
        IF NewPurchLine."Line No." = 0 THEN
          IF NOT PurchLine.GET(
               NewPurchLine."Document Type",
               NewPurchLine."Document No.",
               NewPurchLine."Line No.")
          THEN
            EXIT;

        NewPurchLine.CALCFIELDS("Reserved Qty. (Base)");
        ShowError := NewPurchLine."Reserved Qty. (Base)" <> 0;

        IF (NewPurchLine."Expected Receipt Date" = 0D) AND (OldPurchLine."Expected Receipt Date" <> 0D) THEN
          IF ShowError THEN
            NewPurchLine.FIELDERROR("Expected Receipt Date",Text001)
          ELSE
            HasError := TRUE;

        IF NewPurchLine."Sales Order No." <> '' THEN
          IF ShowError THEN
            NewPurchLine.FIELDERROR("Sales Order No.",Text002)
          ELSE
            HasError := NewPurchLine."Sales Order No." <> OldPurchLine."Sales Order No.";

        IF NewPurchLine."Sales Order Line No." <> 0 THEN
          IF ShowError THEN
            NewPurchLine.FIELDERROR(
              "Sales Order Line No.",Text002)
          ELSE
            HasError := NewPurchLine."Sales Order Line No." <> OldPurchLine."Sales Order Line No.";

        IF NewPurchLine."Drop Shipment" <> OldPurchLine."Drop Shipment" THEN
          IF ShowError AND NewPurchLine."Drop Shipment" THEN
            NewPurchLine.FIELDERROR("Drop Shipment",Text002)
          ELSE
            HasError := TRUE;

        IF NewPurchLine."No." <> OldPurchLine."No." THEN
          IF ShowError THEN
            NewPurchLine.FIELDERROR("No.",Text003)
          ELSE
            HasError := TRUE;
        IF NewPurchLine."Variant Code" <> OldPurchLine."Variant Code" THEN
          IF ShowError THEN
            NewPurchLine.FIELDERROR("Variant Code",Text003)
          ELSE
            HasError := TRUE;
        IF NewPurchLine."Location Code" <> OldPurchLine."Location Code" THEN
          IF ShowError THEN
            NewPurchLine.FIELDERROR("Location Code",Text003)
          ELSE
            HasError := TRUE;
        VerifyPurchLine(NewPurchLine,OldPurchLine,HasError);

        IF HasError THEN
          IF (NewPurchLine."No." <> OldPurchLine."No.") OR
             FindReservEntry(NewPurchLine,TempReservEntry)
          THEN BEGIN
            IF (NewPurchLine."No." <> OldPurchLine."No.") OR (NewPurchLine.Type <> OldPurchLine.Type) THEN BEGIN
              ReservMgt.SetPurchLine(OldPurchLine);
              ReservMgt.DeleteReservEntries(TRUE,0);
              ReservMgt.SetPurchLine(NewPurchLine);
            END ELSE BEGIN
              ReservMgt.SetPurchLine(NewPurchLine);
              ReservMgt.DeleteReservEntries(TRUE,0);
            END;
            ReservMgt.AutoTrack(NewPurchLine."Outstanding Qty. (Base)");
          END;

        IF HasError OR (NewPurchLine."Expected Receipt Date" <> OldPurchLine."Expected Receipt Date")
        THEN BEGIN
          AssignForPlanning(NewPurchLine);
          IF (NewPurchLine."No." <> OldPurchLine."No.") OR
             (NewPurchLine."Variant Code" <> OldPurchLine."Variant Code") OR
             (NewPurchLine."Location Code" <> OldPurchLine."Location Code")
          THEN
            AssignForPlanning(OldPurchLine);
        END;
    end;

    [LineStart(57286)]
    procedure VerifyQuantity(var NewPurchLine : Record "Purchase Line";var OldPurchLine : Record "Purchase Line");
    var
        PurchLine : Record "Purchase Line";
    begin
        IF Blocked THEN
          EXIT;

        WITH NewPurchLine DO BEGIN
          IF ("Document Type" = "Document Type"::Invoice) AND ("Receipt No." = '') THEN
            EXIT;

          IF Type <> Type::Item THEN
            EXIT;
          IF "Document Type" = OldPurchLine."Document Type" THEN
            IF "Line No." = OldPurchLine."Line No." THEN
              IF "Quantity (Base)" = OldPurchLine."Quantity (Base)" THEN
                EXIT;
          IF "Line No." = 0 THEN
            IF NOT PurchLine.GET("Document Type","Document No.","Line No.") THEN
              EXIT;
          ReservMgt.SetPurchLine(NewPurchLine);
          IF "Qty. per Unit of Measure" <> OldPurchLine."Qty. per Unit of Measure" THEN
            ReservMgt.ModifyUnitOfMeasure;
          IF "Outstanding Qty. (Base)" * OldPurchLine."Outstanding Qty. (Base)" < 0 THEN
            ReservMgt.DeleteReservEntries(TRUE,0)
          ELSE
            ReservMgt.DeleteReservEntries(FALSE,"Outstanding Qty. (Base)");
          ReservMgt.ClearSurplus;
          ReservMgt.AutoTrack("Outstanding Qty. (Base)");
          AssignForPlanning(NewPurchLine);
        END;
    end;

    [LineStart(57315)]
    procedure UpdatePlanningFlexibility(var PurchLine : Record "Purchase Line");
    var
        ReservEntry : Record "Reservation Entry";
    begin
        IF FindReservEntry(PurchLine,ReservEntry) THEN
          ReservEntry.MODIFYALL("Planning Flexibility",PurchLine."Planning Flexibility");
    end;

    [LineStart(57319)]
    procedure TransferPurchLineToItemJnlLine(var PurchLine : Record "Purchase Line";var ItemJnlLine : Record "Item Journal Line";TransferQty : Decimal;var CheckApplToItemEntry : Boolean) : Decimal;
    var
        OldReservEntry : Record "Reservation Entry";
        OppositeReservEntry : Record "Reservation Entry";
        NotFullyReserved : Boolean;
    begin
        IF NOT FindReservEntry(PurchLine,OldReservEntry) THEN
          EXIT(TransferQty);

        OldReservEntry.Lock;
        // Handle Item Tracking on drop shipment:
        CLEAR(CreateReservEntry);
        IF ApplySpecificItemTracking AND (ItemJnlLine."Applies-to Entry" <> 0) THEN
          CreateReservEntry.SetItemLedgEntryNo(ItemJnlLine."Applies-to Entry");

        IF OverruleItemTracking THEN
          IF ItemJnlLine.TrackingExists THEN BEGIN
            CreateReservEntry.SetNewSerialLotNo(ItemJnlLine."Serial No.",ItemJnlLine."Lot No.");
            CreateReservEntry.SetOverruleItemTracking(TRUE);
            // Try to match against Item Tracking on the purchase order line:
            OldReservEntry.SETRANGE("Serial No.",ItemJnlLine."Serial No.");
            OldReservEntry.SETRANGE("Lot No.",ItemJnlLine."Lot No.");
            IF OldReservEntry.ISEMPTY THEN
              EXIT(TransferQty);
          END;

        ItemJnlLine.TESTFIELD("Item No.",PurchLine."No.");
        ItemJnlLine.TESTFIELD("Variant Code",PurchLine."Variant Code");
        ItemJnlLine.TESTFIELD("Location Code",PurchLine."Location Code");

        IF TransferQty = 0 THEN
          EXIT;

        IF ItemJnlLine."Invoiced Quantity" <> 0 THEN
          CreateReservEntry.SetUseQtyToInvoice(TRUE);

        IF ReservEngineMgt.InitRecordSet(OldReservEntry) THEN BEGIN
          REPEAT
            OldReservEntry.TESTFIELD("Item No.",PurchLine."No.");
            OldReservEntry.TESTFIELD("Variant Code",PurchLine."Variant Code");
            OldReservEntry.TESTFIELD("Location Code",PurchLine."Location Code");

            IF CheckApplToItemEntry THEN BEGIN
              IF OldReservEntry."Reservation Status" = OldReservEntry."Reservation Status"::Reservation THEN BEGIN
                OppositeReservEntry.GET(OldReservEntry."Entry No.",NOT OldReservEntry.Positive);
                IF OppositeReservEntry."Source Type" <> DATABASE::"Item Ledger Entry" THEN
                  NotFullyReserved := TRUE;
              END ELSE
                NotFullyReserved := TRUE;

              IF OldReservEntry."Item Tracking" <> OldReservEntry."Item Tracking"::None THEN BEGIN
              OldReservEntry.TESTFIELD("Appl.-to Item Entry");
              CreateReservEntry.SetApplyToEntryNo(OldReservEntry."Appl.-to Item Entry");
                CheckApplToItemEntry := FALSE;
              END;
            END;

            TransferQty := CreateReservEntry.TransferReservEntry(DATABASE::"Item Journal Line",
                ItemJnlLine."Entry Type",ItemJnlLine."Journal Template Name",
                ItemJnlLine."Journal Batch Name",0,ItemJnlLine."Line No.",
                ItemJnlLine."Qty. per Unit of Measure",OldReservEntry,TransferQty);

          UNTIL (ReservEngineMgt.NEXTRecord(OldReservEntry) = 0) OR (TransferQty = 0);
          CheckApplToItemEntry := CheckApplToItemEntry AND NotFullyReserved;
        END;
        EXIT(TransferQty);
    end;

    [LineStart(57381)]
    procedure TransferPurchLineToPurchLine(var OldPurchLine : Record "Purchase Line";var NewPurchLine : Record "Purchase Line";TransferQty : Decimal);
    var
        OldReservEntry : Record "Reservation Entry";
        Status : Option Reservation,Tracking,Surplus,Prospect;
    begin
        IF NOT FindReservEntry(OldPurchLine,OldReservEntry) THEN
          EXIT;

        OldReservEntry.Lock;

        NewPurchLine.TESTFIELD("No.",OldPurchLine."No.");
        NewPurchLine.TESTFIELD("Variant Code",OldPurchLine."Variant Code");
        NewPurchLine.TESTFIELD("Location Code",OldPurchLine."Location Code");

        FOR Status := Status::Reservation TO Status::Prospect DO BEGIN
          IF TransferQty = 0 THEN
            EXIT;
          OldReservEntry.SETRANGE("Reservation Status",Status);

          IF OldReservEntry.FINDSET THEN
            REPEAT
              OldReservEntry.TESTFIELD("Item No.",OldPurchLine."No.");
              OldReservEntry.TESTFIELD("Variant Code",OldPurchLine."Variant Code");
              OldReservEntry.TESTFIELD("Location Code",OldPurchLine."Location Code");

              TransferQty := CreateReservEntry.TransferReservEntry(DATABASE::"Purchase Line",
                  NewPurchLine."Document Type",NewPurchLine."Document No.",'',0,NewPurchLine."Line No.",
                  NewPurchLine."Qty. per Unit of Measure",OldReservEntry,TransferQty);

            UNTIL (OldReservEntry.NEXT = 0) OR (TransferQty = 0);
        END; // DO
    end;

    [LineStart(57409)]
    local procedure RenameLine(var NewPurchLine : Record "Purchase Line";var OldPurchLine : Record "Purchase Line");
    begin
        ReservEngineMgt.RenamePointer(DATABASE::"Purchase Line",
          OldPurchLine."Document Type",
          OldPurchLine."Document No.",
          '',
          0,
          OldPurchLine."Line No.",
          NewPurchLine."Document Type",
          NewPurchLine."Document No.",
          '',
          0,
          NewPurchLine."Line No.");
    end;

    [LineStart(57422)]
    procedure DeleteLineConfirm(var PurchLine : Record "Purchase Line") : Boolean;
    begin
        WITH PurchLine DO BEGIN
          IF NOT ReservEntryExist(PurchLine) THEN
            EXIT(TRUE);

          ReservMgt.SetPurchLine(PurchLine);
          IF ReservMgt.DeleteItemTrackingConfirm THEN
            DeleteItemTracking := TRUE;
        END;

        EXIT(DeleteItemTracking);
    end;

    [LineStart(57434)]
    procedure DeleteLine(var PurchLine : Record "Purchase Line");
    begin
        IF Blocked THEN
          EXIT;

        WITH PurchLine DO BEGIN
          ReservMgt.SetPurchLine(PurchLine);
          IF DeleteItemTracking THEN
            ReservMgt.SetItemTrackingHandling(1); // Allow Deletion
          ReservMgt.DeleteReservEntries(TRUE,0);
          DeleteInvoiceSpecFromLine(PurchLine);
          ReservMgt.ClearActionMessageReferences;
          CALCFIELDS("Reserved Qty. (Base)");
          AssignForPlanning(PurchLine);
        END;
    end;

    [LineStart(57449)]
    local procedure AssignForPlanning(var PurchLine : Record "Purchase Line");
    var
        PlanningAssignment : Record "Planning Assignment";
    begin
        WITH PurchLine DO BEGIN
          IF "Document Type" <> "Document Type"::Order THEN
            EXIT;
          IF Type <> Type::Item THEN
            EXIT;
          IF "No." <> '' THEN
            PlanningAssignment.ChkAssignOne("No.","Variant Code","Location Code",WORKDATE);
        END;
    end;

    [LineStart(57459)]
    procedure Block(SetBlocked : Boolean);
    begin
        Blocked := SetBlocked;
    end;

    [LineStart(57462)]
    procedure CallItemTracking(var PurchLine : Record "Purchase Line");
    var
        TrackingSpecification : Record "Tracking Specification";
        ItemTrackingForm : Page "Item Tracking Lines";
    begin
        InitTrackingSpecification(PurchLine,TrackingSpecification);
        IF ((PurchLine."Document Type" = PurchLine."Document Type"::Invoice) AND
            (PurchLine."Receipt No." <> '')) OR
           ((PurchLine."Document Type" = PurchLine."Document Type"::"Credit Memo") AND
            (PurchLine."Return Shipment No." <> ''))
        THEN
          ItemTrackingForm.SetFormRunMode(2); // Combined shipment/receipt
        IF PurchLine."Drop Shipment" THEN BEGIN
          ItemTrackingForm.SetFormRunMode(3); // Drop Shipment
          IF PurchLine."Sales Order No." <> '' THEN
            ItemTrackingForm.SetSecondSourceRowID(ItemTrackingMgt.ComposeRowID(DATABASE::"Sales Line",
                1,PurchLine."Sales Order No.",'',0,PurchLine."Sales Order Line No."));
        END;
        ItemTrackingForm.SetSource(TrackingSpecification,PurchLine."Expected Receipt Date");
        ItemTrackingForm.SetInbound(PurchLine.IsInbound);
        ItemTrackingForm.RUNMODAL;
    end;

    [LineStart(57480)]
    procedure CallItemTracking2(var PurchLine : Record "Purchase Line";SecondSourceQuantityArray : array [3] of Decimal);
    var
        TrackingSpecification : Record "Tracking Specification";
        ItemTrackingForm : Page "Item Tracking Lines";
    begin
        InitTrackingSpecification(PurchLine,TrackingSpecification);
        ItemTrackingForm.SetSource(TrackingSpecification,PurchLine."Expected Receipt Date");
        ItemTrackingForm.SetSecondSourceQuantity(SecondSourceQuantityArray);
        ItemTrackingForm.RUNMODAL;
    end;

    [LineStart(57486)]
    procedure InitTrackingSpecification(var PurchLine : Record "Purchase Line";var TrackingSpecification : Record "Tracking Specification");
    begin
        TrackingSpecification.INIT;
        TrackingSpecification."Source Type" := DATABASE::"Purchase Line";
        WITH PurchLine DO BEGIN
          TrackingSpecification."Item No." := "No.";
          TrackingSpecification."Location Code" := "Location Code";
          TrackingSpecification.Description := Description;
          TrackingSpecification."Variant Code" := "Variant Code";
          TrackingSpecification."Source Subtype" := "Document Type";
          TrackingSpecification."Source ID" := "Document No.";
          TrackingSpecification."Source Batch Name" := '';
          TrackingSpecification."Source Prod. Order Line" := 0;
          TrackingSpecification."Source Ref. No." := "Line No.";
          TrackingSpecification."Quantity (Base)" := "Quantity (Base)";
          TrackingSpecification."Qty. to Invoice (Base)" := "Qty. to Invoice (Base)";
          TrackingSpecification."Qty. to Invoice" := "Qty. to Invoice";
          TrackingSpecification."Quantity Invoiced (Base)" := "Qty. Invoiced (Base)";
          TrackingSpecification."Qty. per Unit of Measure" := "Qty. per Unit of Measure";
          TrackingSpecification."Bin Code" := "Bin Code";

          IF "Document Type" IN ["Document Type"::"Return Order","Document Type"::"Credit Memo"] THEN BEGIN
            TrackingSpecification."Qty. to Handle (Base)" := "Return Qty. to Ship (Base)";
            TrackingSpecification."Quantity Handled (Base)" := "Return Qty. Shipped (Base)";
            TrackingSpecification."Qty. to Handle" := "Return Qty. to Ship";
          END ELSE BEGIN
            TrackingSpecification."Qty. to Handle (Base)" := "Qty. to Receive (Base)";
            TrackingSpecification."Quantity Handled (Base)" := "Qty. Received (Base)";
            TrackingSpecification."Qty. to Handle" := "Qty. to Receive";
          END;
        END;
    end;

    [LineStart(57517)]
    procedure RetrieveInvoiceSpecification(var PurchLine : Record "Purchase Line";var TempInvoicingSpecification : Record "Tracking Specification" temporary) OK : Boolean;
    var
        SourceSpecification : Record "Tracking Specification";
    begin
        CLEAR(TempInvoicingSpecification);
        IF PurchLine.Type <> PurchLine.Type::Item THEN
          EXIT;
        IF ((PurchLine."Document Type" = PurchLine."Document Type"::Invoice) AND
            (PurchLine."Receipt No." <> '')) OR
           ((PurchLine."Document Type" = PurchLine."Document Type"::"Credit Memo") AND
            (PurchLine."Return Shipment No." <> ''))
        THEN
          OK := RetrieveInvoiceSpecification2(PurchLine,TempInvoicingSpecification)
        ELSE BEGIN
          InitTrackingSpecification(PurchLine,SourceSpecification);
          OK := ItemTrackingMgt.RetrieveInvoiceSpecification(SourceSpecification,
              TempInvoicingSpecification);
        END;
    end;

    [LineStart(57533)]
    local procedure RetrieveInvoiceSpecification2(var PurchLine : Record "Purchase Line";var TempInvoicingSpecification : Record "Tracking Specification" temporary) OK : Boolean;
    var
        TrackingSpecification : Record "Tracking Specification";
        ReservEntry : Record "Reservation Entry";
    begin
        // Used for combined receipt/return:
        IF PurchLine.Type <> PurchLine.Type::Item THEN
          EXIT;
        IF NOT FindReservEntry(PurchLine,ReservEntry) THEN
          EXIT;
        ReservEntry.FINDSET;
        REPEAT
          ReservEntry.TESTFIELD("Reservation Status",ReservEntry."Reservation Status"::Prospect);
          ReservEntry.TESTFIELD("Item Ledger Entry No.");
          TrackingSpecification.GET(ReservEntry."Item Ledger Entry No.");
          TempInvoicingSpecification := TrackingSpecification;
          TempInvoicingSpecification."Qty. to Invoice (Base)" :=
            ReservEntry."Qty. to Invoice (Base)";
          TempInvoicingSpecification."Qty. to Invoice" :=
            ROUND(ReservEntry."Qty. to Invoice (Base)" / ReservEntry."Qty. per Unit of Measure",0.00001);
          TempInvoicingSpecification."Buffer Status" := TempInvoicingSpecification."Buffer Status"::MODIFY;
          TempInvoicingSpecification.INSERT;
          ReservEntry.DELETE;
        UNTIL ReservEntry.NEXT = 0;

        OK := TempInvoicingSpecification.FINDFIRST;
    end;

    [LineStart(57556)]
    procedure DeleteInvoiceSpecFromHeader(var PurchHeader : Record "Purchase Header");
    var
        TrackingSpecification : Record "Tracking Specification";
    begin
        TrackingSpecification.SETCURRENTKEY("Source ID","Source Type",
          "Source Subtype","Source Batch Name","Source Prod. Order Line","Source Ref. No.");
        TrackingSpecification.SETRANGE("Source Type",DATABASE::"Purchase Line");
        TrackingSpecification.SETRANGE("Source Subtype",PurchHeader."Document Type");
        TrackingSpecification.SETRANGE("Source ID",PurchHeader."No.");
        TrackingSpecification.SETRANGE("Source Batch Name",'');
        TrackingSpecification.SETRANGE("Source Prod. Order Line",0);
        IF TrackingSpecification.FINDSET THEN
          REPEAT
            TrackingSpecification.DELETE;
          UNTIL TrackingSpecification.NEXT = 0;
    end;

    [LineStart(57569)]
    local procedure DeleteInvoiceSpecFromLine(PurchLine : Record "Purchase Line");
    var
        TrackingSpecification : Record "Tracking Specification";
    begin
        TrackingSpecification.SETCURRENTKEY("Source ID","Source Type",
          "Source Subtype","Source Batch Name","Source Prod. Order Line","Source Ref. No.");
        TrackingSpecification.SETRANGE("Source ID",PurchLine."Document No.");
        TrackingSpecification.SETRANGE("Source Type",DATABASE::"Purchase Line");
        TrackingSpecification.SETRANGE("Source Subtype",PurchLine."Document Type");
        TrackingSpecification.SETRANGE("Source Batch Name",'');
        TrackingSpecification.SETRANGE("Source Prod. Order Line",0);
        TrackingSpecification.SETRANGE("Source Ref. No.",PurchLine."Line No.");
        IF TrackingSpecification.FINDSET THEN
          REPEAT
            TrackingSpecification.DELETE;
          UNTIL TrackingSpecification.NEXT = 0;
    end;

    [LineStart(57583)]
    procedure UpdateItemTrackingAfterPosting(PurchHeader : Record "Purchase Header");
    var
        ReservEntry : Record "Reservation Entry";
        CreateReservEntry : Codeunit "Create Reserv. Entry";
    begin
        // Used for updating Quantity to Handle and Quantity to Invoice after posting
        ReservEngineMgt.InitFilterAndSortingLookupFor(ReservEntry,FALSE);
        ReservEntry.SETRANGE("Source Type",DATABASE::"Purchase Line");
        ReservEntry.SETRANGE("Source Subtype",PurchHeader."Document Type");
        ReservEntry.SETRANGE("Source ID",PurchHeader."No.");
        ReservEntry.SETRANGE("Source Batch Name",'');
        ReservEntry.SETRANGE("Source Prod. Order Line",0);
        CreateReservEntry.UpdateItemTrackingAfterPosting(ReservEntry);
    end;

    [LineStart(57593)]
    procedure SetApplySpecificItemTracking(ApplySpecific : Boolean);
    begin
        ApplySpecificItemTracking := ApplySpecific;
    end;

    [LineStart(57596)]
    procedure SetOverruleItemTracking(Overrule : Boolean);
    begin
        OverruleItemTracking := Overrule;
    end;

    [LineStart(57599)]
    local procedure VerifyPurchLine(var NewPurchLine : Record "Purchase Line";var OldPurchLine : Record "Purchase Line";var HasError : Boolean);
    begin
        IF (NewPurchLine.Type = NewPurchLine.Type::Item) AND (OldPurchLine.Type = OldPurchLine.Type::Item) THEN
          IF (NewPurchLine."Bin Code" <> OldPurchLine."Bin Code") AND
             (NOT ReservMgt.CalcIsAvailTrackedQtyInBin(
                NewPurchLine."No.",NewPurchLine."Bin Code",
                NewPurchLine."Location Code",NewPurchLine."Variant Code",
                DATABASE::"Purchase Line",NewPurchLine."Document Type",
                NewPurchLine."Document No.",'',0,NewPurchLine."Line No."))
          THEN
            HasError := TRUE;
        IF NewPurchLine."Line No." <> OldPurchLine."Line No." THEN
          HasError := TRUE;

        IF NewPurchLine.Type <> OldPurchLine.Type THEN
          HasError := TRUE;
    end;
}

