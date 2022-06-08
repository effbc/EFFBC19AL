codeunit 99000832 "Sales Line-Reserve"
{
    // version NAVW19.00.00.50868

    Permissions = TableData "Reservation Entry" = rimd,
                  TableData "Planning Assignment" = rimd;

    trigger OnRun();
    begin
    end;

    var
        ReservedQtyTooLargeErr: TextConst Comment = '%1: not reserved quantity on Sales Line', ENU = 'Reserved quantity cannot be greater than %1.', ENN = 'Reserved quantity cannot be greater than %1.';
        ValueIsEmptyErr: TextConst ENU = 'must be filled in when a quantity is reserved', ENN = 'must be filled in when a quantity is reserved';
        ValueNotEmptyErr: TextConst ENU = 'must not be filled in when a quantity is reserved', ENN = 'must not be filled in when a quantity is reserved';
        ValueChangedErr: TextConst ENU = 'must not be changed when a quantity is reserved', ENN = 'must not be changed when a quantity is reserved';
        CodeunitInitErr: TextConst ENU = 'Codeunit is not initialized correctly.', ENN = 'Codeunit is not initialized correctly.';
        CreateReservEntry: Codeunit "Create Reserv. Entry";
        ReservEngineMgt: Codeunit "Reservation Engine Mgt.";
        ReservMgt: Codeunit "Reservation Management";
        ItemTrackingMgt: Codeunit "Item Tracking Management";
        Blocked: Boolean;
        SetFromType: Option " ",Sales,"Requisition Line",Purchase,"Item Journal","BOM Journal","Item Ledger Entry",Service,Job;
        SetFromSubtype: Integer;
        SetFromID: Code[20];
        SetFromBatchName: Code[10];
        SetFromProdOrderLine: Integer;
        SetFromRefNo: Integer;
        SetFromVariantCode: Code[10];
        SetFromLocationCode: Code[10];
        SetFromSerialNo: Code[20];
        SetFromLotNo: Code[20];
        SetFromQtyPerUOM: Decimal;
        ApplySpecificItemTracking: Boolean;
        OverruleItemTracking: Boolean;
        DeleteItemTracking: Boolean;
        ItemTrkgAlreadyOverruled: Boolean;

    (56502)]
    procedure CreateReservation(var SalesLine: Record "Sales Line"; Description: Text[50]; ExpectedReceiptDate: Date; Quantity: Decimal; QuantityBase: Decimal; ForSerialNo: Code[20]; ForLotNo: Code[20]);
    var
        ShipmentDate: Date;
        SignFactor: Integer;
    begin
        IF SetFromType = 0 THEN
            ERROR(CodeunitInitErr);

        SalesLine.TESTFIELD(Type, SalesLine.Type::Item);
        SalesLine.TESTFIELD("No.");
        SalesLine.TESTFIELD("Shipment Date");
        SalesLine.CALCFIELDS("Reserved Qty. (Base)");
        IF ABS(SalesLine."Outstanding Qty. (Base)") < ABS(SalesLine."Reserved Qty. (Base)") + QuantityBase THEN
            ERROR(
              ReservedQtyTooLargeErr,
              ABS(SalesLine."Outstanding Qty. (Base)") - ABS(SalesLine."Reserved Qty. (Base)"));

        SalesLine.TESTFIELD("Variant Code", SetFromVariantCode);
        SalesLine.TESTFIELD("Location Code", SetFromLocationCode);

        IF SalesLine."Document Type" = SalesLine."Document Type"::"Return Order" THEN
            SignFactor := 1
        ELSE
            SignFactor := -1;

        IF QuantityBase * SignFactor < 0 THEN
            ShipmentDate := SalesLine."Shipment Date"
        ELSE BEGIN
            ShipmentDate := ExpectedReceiptDate;
            ExpectedReceiptDate := SalesLine."Shipment Date";
        END;

        CreateReservEntry.CreateReservEntryFor(
          DATABASE::"Sales Line", SalesLine."Document Type",
          SalesLine."Document No.", '', 0, SalesLine."Line No.", SalesLine."Qty. per Unit of Measure",
          Quantity, QuantityBase, ForSerialNo, ForLotNo);
        CreateReservEntry.CreateReservEntryFrom(
          SetFromType, SetFromSubtype, SetFromID, SetFromBatchName, SetFromProdOrderLine, SetFromRefNo,
          SetFromQtyPerUOM, SetFromSerialNo, SetFromLotNo);
        CreateReservEntry.CreateReservEntry(
          SalesLine."No.", SalesLine."Variant Code", SalesLine."Location Code",
          Description, ExpectedReceiptDate, ShipmentDate);

        SetFromType := 0;
    end;

    (56543)]
    procedure CreateReservationSetFrom(TrackingSpecificationFrom: Record "Tracking Specification");
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

    (56558)]
    procedure SetBinding(Binding: Option " ","Order-to-Order");
    begin
        CreateReservEntry.SetBinding(Binding);
    end;

    (56561)]
    procedure SetDisallowCancellation(DisallowCancellation: Boolean);
    begin
        CreateReservEntry.SetDisallowCancellation(DisallowCancellation);
    end;

    (56564)]
    procedure FilterReservFor(var FilterReservEntry: Record "Reservation Entry"; SalesLine: Record "Sales Line");
    begin
        FilterReservEntry.SETRANGE("Source Type", DATABASE::"Sales Line");
        FilterReservEntry.SETRANGE("Source Subtype", SalesLine."Document Type");
        FilterReservEntry.SETRANGE("Source ID", SalesLine."Document No.");
        FilterReservEntry.SETRANGE("Source Batch Name", '');
        FilterReservEntry.SETRANGE("Source Prod. Order Line", 0);
        FilterReservEntry.SETRANGE("Source Ref. No.", SalesLine."Line No.");
    end;

    (56572)]
    procedure ReservQuantity(SalesLine: Record "Sales Line"; var QtyToReserve: Decimal; var QtyToReserveBase: Decimal);
    begin
        CASE SalesLine."Document Type" OF
            SalesLine."Document Type"::Quote,
            SalesLine."Document Type"::Order,
            SalesLine."Document Type"::Invoice,
            SalesLine."Document Type"::"Blanket Order":
                BEGIN
                    QtyToReserve := SalesLine."Outstanding Quantity";
                    QtyToReserveBase := SalesLine."Outstanding Qty. (Base)";
                END;
            SalesLine."Document Type"::"Return Order",
            SalesLine."Document Type"::"Credit Memo":
                BEGIN
                    QtyToReserve := -SalesLine."Outstanding Quantity";
                    QtyToReserveBase := -SalesLine."Outstanding Qty. (Base)"
                END;
        END;
    end;

    (56590)]
    procedure Caption(SalesLine: Record "Sales Line") CaptionText: Text[80];
    begin
        CaptionText :=
          STRSUBSTNO('%1 %2 %3', SalesLine."Document Type", SalesLine."Document No.", SalesLine."No.");
    end;

    (56594)]
    procedure FindReservEntry(SalesLine: Record "Sales Line"; var ReservEntry: Record "Reservation Entry"): Boolean;
    begin
        ReservEngineMgt.InitFilterAndSortingLookupFor(ReservEntry, FALSE);
        FilterReservFor(ReservEntry, SalesLine);
        EXIT(ReservEntry.FINDLAST);
    end;

    (56599)]
    procedure ReservEntryExist(SalesLine: Record "Sales Line"): Boolean;
    var
        ReservEntry: Record "Reservation Entry";
    begin
        ReservEngineMgt.InitFilterAndSortingLookupFor(ReservEntry, FALSE);
        FilterReservFor(ReservEntry, SalesLine);
        EXIT(NOT ReservEntry.ISEMPTY);
    end;

    (56604)]
    procedure VerifyChange(var NewSalesLine: Record "Sales Line"; var OldSalesLine: Record "Sales Line");
    var
        SalesLine: Record "Sales Line";
        ShowError: Boolean;
        HasError: Boolean;
    begin
        IF (NewSalesLine.Type <> NewSalesLine.Type::Item) AND (OldSalesLine.Type <> OldSalesLine.Type::Item) THEN
            EXIT;
        IF Blocked THEN
            EXIT;
        IF NewSalesLine."Line No." = 0 THEN
            IF NOT SalesLine.GET(
                 NewSalesLine."Document Type", NewSalesLine."Document No.", NewSalesLine."Line No.")
            THEN
                EXIT;

        NewSalesLine.CALCFIELDS("Reserved Qty. (Base)");
        ShowError := NewSalesLine."Reserved Qty. (Base)" <> 0;

        HasError := TestSalesLineModification(OldSalesLine, NewSalesLine, ShowError);

        IF HasError THEN
            ClearReservation(OldSalesLine, NewSalesLine);

        IF HasError OR (NewSalesLine."Shipment Date" <> OldSalesLine."Shipment Date")
        THEN BEGIN
            AssignForPlanning(NewSalesLine);
            IF (NewSalesLine."No." <> OldSalesLine."No.") OR
               (NewSalesLine."Variant Code" <> OldSalesLine."Variant Code") OR
               (NewSalesLine."Location Code" <> OldSalesLine."Location Code")
            THEN
                AssignForPlanning(OldSalesLine);
        END;
    end;

    (56633)]
    procedure VerifyQuantity(var NewSalesLine: Record "Sales Line"; var OldSalesLine: Record "Sales Line");
    var
        SalesLine: Record "Sales Line";
    begin
        IF Blocked THEN
            EXIT;

        WITH NewSalesLine DO BEGIN
            IF ("Document Type" = "Document Type"::Invoice) AND ("Shipment No." = '') THEN
                EXIT;

            IF Type <> Type::Item THEN
                EXIT;
            IF "Document Type" = OldSalesLine."Document Type" THEN
                IF "Line No." = OldSalesLine."Line No." THEN
                    IF "Quantity (Base)" = OldSalesLine."Quantity (Base)" THEN
                        EXIT;
            IF "Line No." = 0 THEN
                IF NOT SalesLine.GET("Document Type", "Document No.", "Line No.") THEN
                    EXIT;
            ReservMgt.SetSalesLine(NewSalesLine);
            IF "Qty. per Unit of Measure" <> OldSalesLine."Qty. per Unit of Measure" THEN
                ReservMgt.ModifyUnitOfMeasure;
            IF "Outstanding Qty. (Base)" * OldSalesLine."Outstanding Qty. (Base)" < 0 THEN
                ReservMgt.DeleteReservEntries(TRUE, 0)
            ELSE
                ReservMgt.DeleteReservEntries(FALSE, "Outstanding Qty. (Base)");
            ReservMgt.ClearSurplus;
            ReservMgt.AutoTrack("Outstanding Qty. (Base)");
            AssignForPlanning(NewSalesLine);
        END;
    end;

    (56662)]
    procedure TransferSalesLineToItemJnlLine(var SalesLine: Record "Sales Line"; var ItemJnlLine: Record "Item Journal Line"; TransferQty: Decimal; var CheckApplFromItemEntry: Boolean; OnlyILEReservations: Boolean): Decimal;
    var
        OldReservEntry: Record "Reservation Entry";
        OppositeReservEntry: Record "Reservation Entry";
        NotFullyReserved: Boolean;
    begin
        IF NOT FindReservEntry(SalesLine, OldReservEntry) THEN
            EXIT(TransferQty);
        OldReservEntry.Lock;
        // Handle Item Tracking on drop shipment:
        CLEAR(CreateReservEntry);

        IF OverruleItemTracking THEN
            IF ItemJnlLine.TrackingExists THEN BEGIN
                CreateReservEntry.SetNewSerialLotNo(ItemJnlLine."Serial No.", ItemJnlLine."Lot No.");
                CreateReservEntry.SetOverruleItemTracking(NOT ItemTrkgAlreadyOverruled);
                // Try to match against Item Tracking on the sales order line:
                OldReservEntry.SETRANGE("Serial No.", ItemJnlLine."Serial No.");
                OldReservEntry.SETRANGE("Lot No.", ItemJnlLine."Lot No.");
                IF OldReservEntry.ISEMPTY THEN
                    EXIT(TransferQty);
            END;

        ItemJnlLine.TESTFIELD("Item No.", SalesLine."No.");
        ItemJnlLine.TESTFIELD("Variant Code", SalesLine."Variant Code");
        ItemJnlLine.TESTFIELD("Location Code", SalesLine."Location Code");

        IF TransferQty = 0 THEN
            EXIT;

        IF ItemJnlLine."Invoiced Quantity" <> 0 THEN
            CreateReservEntry.SetUseQtyToInvoice(TRUE);

        IF ReservEngineMgt.InitRecordSet(OldReservEntry) THEN BEGIN
            REPEAT
                OldReservEntry.TESTFIELD("Item No.", SalesLine."No.");
                OldReservEntry.TESTFIELD("Variant Code", SalesLine."Variant Code");
                OldReservEntry.TESTFIELD("Location Code", SalesLine."Location Code");

                IF ApplySpecificItemTracking AND (ItemJnlLine."Applies-to Entry" <> 0) THEN BEGIN
                    CreateReservEntry.SetItemLedgEntryNo(ItemJnlLine."Applies-to Entry");
                    CheckApplFromItemEntry := FALSE;
                END;

                IF ItemJnlLine."Assemble to Order" THEN
                    OldReservEntry."Appl.-to Item Entry" :=
                      SalesLine.FindOpenATOEntry(OldReservEntry."Lot No.", OldReservEntry."Serial No.");

                IF CheckApplFromItemEntry THEN BEGIN
                    IF OldReservEntry."Reservation Status" = OldReservEntry."Reservation Status"::Reservation THEN BEGIN
                        OppositeReservEntry.GET(OldReservEntry."Entry No.", NOT OldReservEntry.Positive);
                        IF OppositeReservEntry."Source Type" <> DATABASE::"Item Ledger Entry" THEN
                            NotFullyReserved := TRUE;
                    END ELSE
                        NotFullyReserved := TRUE;

                    IF OldReservEntry."Item Tracking" <> OldReservEntry."Item Tracking"::None THEN BEGIN
                        OldReservEntry.TESTFIELD("Appl.-from Item Entry");
                        CreateReservEntry.SetApplyFromEntryNo(OldReservEntry."Appl.-from Item Entry");
                        CheckApplFromItemEntry := FALSE;
                    END;
                END;

                IF NOT (ItemJnlLine."Assemble to Order" XOR OldReservEntry."Disallow Cancellation") THEN
                    IF NOT VerifyPickedQtyReservToInventory(OldReservEntry, SalesLine, TransferQty) THEN
                        IF OnlyILEReservations AND OppositeReservEntry.GET(OldReservEntry."Entry No.", NOT OldReservEntry.Positive) THEN BEGIN
                            IF OppositeReservEntry."Source Type" = DATABASE::"Item Ledger Entry" THEN
                                TransferQty := CreateReservEntry.TransferReservEntry(
                                    DATABASE::"Item Journal Line", ItemJnlLine."Entry Type", ItemJnlLine."Journal Template Name",
                                    ItemJnlLine."Journal Batch Name", 0, ItemJnlLine."Line No.",
                                    ItemJnlLine."Qty. per Unit of Measure", OldReservEntry, TransferQty);
                        END ELSE
                            TransferQty := CreateReservEntry.TransferReservEntry(
                                DATABASE::"Item Journal Line", ItemJnlLine."Entry Type", ItemJnlLine."Journal Template Name",
                                ItemJnlLine."Journal Batch Name", 0, ItemJnlLine."Line No.",
                                ItemJnlLine."Qty. per Unit of Measure", OldReservEntry, TransferQty);
            UNTIL (ReservEngineMgt.NEXTRecord(OldReservEntry) = 0) OR (TransferQty = 0);
            CheckApplFromItemEntry := CheckApplFromItemEntry AND NotFullyReserved;
        END;
        EXIT(TransferQty);
    end;

    (56738)]
    procedure TransferSaleLineToSalesLine(var OldSalesLine: Record "Sales Line"; var NewSalesLine: Record "Sales Line"; TransferQty: Decimal);
    var
        OldReservEntry: Record "Reservation Entry";
        Status: Option Reservation,Tracking,Surplus,Prospect;
    begin
        // Used for sales quote and blanket order when transferred to order
        IF NOT FindReservEntry(OldSalesLine, OldReservEntry) THEN
            EXIT;

        OldReservEntry.Lock;

        NewSalesLine.TESTFIELD("No.", OldSalesLine."No.");
        NewSalesLine.TESTFIELD("Variant Code", OldSalesLine."Variant Code");
        NewSalesLine.TESTFIELD("Location Code", OldSalesLine."Location Code");

        FOR Status := Status::Reservation TO Status::Prospect DO BEGIN
            IF TransferQty = 0 THEN
                EXIT;
            OldReservEntry.SETRANGE("Reservation Status", Status);
            IF OldReservEntry.FINDSET THEN
                REPEAT
                    OldReservEntry.TESTFIELD("Item No.", OldSalesLine."No.");
                    OldReservEntry.TESTFIELD("Variant Code", OldSalesLine."Variant Code");
                    OldReservEntry.TESTFIELD("Location Code", OldSalesLine."Location Code");
                    IF (OldReservEntry."Reservation Status" = OldReservEntry."Reservation Status"::Prospect) AND
                       (OldSalesLine."Document Type" IN [OldSalesLine."Document Type"::Quote,
                                                         OldSalesLine."Document Type"::"Blanket Order"])
                    THEN
                        OldReservEntry."Reservation Status" := OldReservEntry."Reservation Status"::Surplus;

                    TransferQty := CreateReservEntry.TransferReservEntry(DATABASE::"Sales Line",
                        NewSalesLine."Document Type", NewSalesLine."Document No.", '', 0,
                        NewSalesLine."Line No.", NewSalesLine."Qty. per Unit of Measure", OldReservEntry, TransferQty);

                UNTIL (OldReservEntry.NEXT = 0) OR (TransferQty = 0);
        END;
    end;

    (56771)]
    local procedure RenameLine(var NewSalesLine: Record "Sales Line"; var OldSalesLine: Record "Sales Line");
    begin
        ReservEngineMgt.RenamePointer(DATABASE::"Sales Line",
          OldSalesLine."Document Type",
          OldSalesLine."Document No.",
          '',
          0,
          OldSalesLine."Line No.",
          NewSalesLine."Document Type",
          NewSalesLine."Document No.",
          '',
          0,
          NewSalesLine."Line No.");
    end;

    (56784)]
    procedure DeleteLineConfirm(var SalesLine: Record "Sales Line"): Boolean;
    begin
        WITH SalesLine DO BEGIN
            IF NOT ReservEntryExist(SalesLine) THEN
                EXIT(TRUE);

            ReservMgt.SetSalesLine(SalesLine);
            IF ReservMgt.DeleteItemTrackingConfirm THEN
                DeleteItemTracking := TRUE;
        END;

        EXIT(DeleteItemTracking);
    end;

    (56796)]
    procedure DeleteLine(var SalesLine: Record "Sales Line");
    begin
        WITH SalesLine DO BEGIN
            ReservMgt.SetSalesLine(SalesLine);
            IF DeleteItemTracking THEN
                ReservMgt.SetItemTrackingHandling(1); // Allow Deletion
            ReservMgt.DeleteReservEntries(TRUE, 0);
            DeleteInvoiceSpecFromLine(SalesLine);
            CALCFIELDS("Reserved Qty. (Base)");
            AssignForPlanning(SalesLine);
        END;
    end;

    (56807)]
    procedure AssignForPlanning(var SalesLine: Record "Sales Line");
    var
        PlanningAssignment: Record "Planning Assignment";
    begin
        WITH SalesLine DO BEGIN
            IF "Document Type" <> "Document Type"::Order THEN
                EXIT;
            IF Type <> Type::Item THEN
                EXIT;
            IF "No." <> '' THEN
                PlanningAssignment.ChkAssignOne("No.", "Variant Code", "Location Code", "Shipment Date");
        END;
    end;

    (56817)]
    procedure CallItemTracking(var SalesLine: Record "Sales Line");
    var
        TrackingSpecification: Record "Tracking Specification";
        ItemTrackingForm: Page "Item Tracking Lines";
    begin
        InitTrackingSpecification(SalesLine, TrackingSpecification);
        IF ((SalesLine."Document Type" = SalesLine."Document Type"::Invoice) AND
            (SalesLine."Shipment No." <> '')) OR
           ((SalesLine."Document Type" = SalesLine."Document Type"::"Credit Memo") AND
            (SalesLine."Return Receipt No." <> ''))
        THEN
            ItemTrackingForm.SetFormRunMode(2); // Combined shipment/receipt
        IF SalesLine."Drop Shipment" THEN BEGIN
            ItemTrackingForm.SetFormRunMode(3); // Drop Shipment
            IF SalesLine."Purchase Order No." <> '' THEN
                ItemTrackingForm.SetSecondSourceRowID(ItemTrackingMgt.ComposeRowID(DATABASE::"Purchase Line",
                    1, SalesLine."Purchase Order No.", '', 0, SalesLine."Purch. Order Line No."));
        END;
        ItemTrackingForm.SetSource(TrackingSpecification, SalesLine."Shipment Date");
        ItemTrackingForm.SetInbound(SalesLine.IsInbound);
        ItemTrackingForm.RUNMODAL;
    end;

    (56835)]
    procedure CallItemTracking2(var SalesLine: Record "Sales Line"; SecondSourceQuantityArray: array[3] of Decimal);
    begin
        CallItemTrackingSecondSource(SalesLine, SecondSourceQuantityArray, FALSE);
    end;

    (56838)]
    procedure CallItemTrackingSecondSource(var SalesLine: Record "Sales Line"; SecondSourceQuantityArray: array[3] of Decimal; AsmToOrder: Boolean);
    var
        TrackingSpecification: Record "Tracking Specification";
        ItemTrackingLines: Page "Item Tracking Lines";
    begin
        IF SecondSourceQuantityArray[1] = DATABASE::"Warehouse Shipment Line" THEN
            ItemTrackingLines.SetSecondSourceID(DATABASE::"Warehouse Shipment Line", AsmToOrder);

        InitTrackingSpecification(SalesLine, TrackingSpecification);
        ItemTrackingLines.SetSource(TrackingSpecification, SalesLine."Shipment Date");
        ItemTrackingLines.SetSecondSourceQuantity(SecondSourceQuantityArray);
        ItemTrackingLines.RUNMODAL;
    end;

    (56847)]
    procedure InitTrackingSpecification(var SalesLine: Record "Sales Line"; var TrackingSpecification: Record "Tracking Specification");
    begin
        TrackingSpecification.INIT;
        TrackingSpecification."Source Type" := DATABASE::"Sales Line";
        WITH SalesLine DO BEGIN
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

            IF "Document Type" IN ["Document Type"::"Return Order", "Document Type"::"Credit Memo"] THEN BEGIN
                TrackingSpecification."Qty. to Handle (Base)" := "Return Qty. to Receive (Base)";
                TrackingSpecification."Quantity Handled (Base)" := "Return Qty. Received (Base)";
                TrackingSpecification."Qty. to Handle" := "Return Qty. to Receive";
            END ELSE BEGIN
                TrackingSpecification."Qty. to Handle (Base)" := "Qty. to Ship (Base)";
                TrackingSpecification."Quantity Handled (Base)" := "Qty. Shipped (Base)";
                TrackingSpecification."Qty. to Handle" := "Qty. to Ship";
            END;
        END;
    end;

    (56878)]
    procedure RetrieveInvoiceSpecification(var SalesLine: Record "Sales Line"; var TempInvoicingSpecification: Record "Tracking Specification" temporary) OK: Boolean;
    var
        SourceSpecification: Record "Tracking Specification";
    begin
        CLEAR(TempInvoicingSpecification);
        IF SalesLine.Type <> SalesLine.Type::Item THEN
            EXIT;
        IF ((SalesLine."Document Type" = SalesLine."Document Type"::Invoice) AND
            (SalesLine."Shipment No." <> '')) OR
           ((SalesLine."Document Type" = SalesLine."Document Type"::"Credit Memo") AND
            (SalesLine."Return Receipt No." <> ''))
        THEN
            OK := RetrieveInvoiceSpecification2(SalesLine, TempInvoicingSpecification)
        ELSE BEGIN
            InitTrackingSpecification(SalesLine, SourceSpecification);
            OK := ItemTrackingMgt.RetrieveInvoiceSpecification(SourceSpecification,
                TempInvoicingSpecification);
        END;
    end;

    (56894)]
    local procedure RetrieveInvoiceSpecification2(var SalesLine: Record "Sales Line"; var TempInvoicingSpecification: Record "Tracking Specification" temporary) OK: Boolean;
    var
        TrackingSpecification: Record "Tracking Specification";
        ReservEntry: Record "Reservation Entry";
    begin
        // Used for combined shipment/return:
        IF SalesLine.Type <> SalesLine.Type::Item THEN
            EXIT;
        IF NOT FindReservEntry(SalesLine, ReservEntry) THEN
            EXIT;
        ReservEntry.FINDSET;
        REPEAT
            ReservEntry.TESTFIELD("Reservation Status", ReservEntry."Reservation Status"::Prospect);
            ReservEntry.TESTFIELD("Item Ledger Entry No.");
            TrackingSpecification.GET(ReservEntry."Item Ledger Entry No.");
            TempInvoicingSpecification := TrackingSpecification;
            TempInvoicingSpecification."Qty. to Invoice (Base)" :=
              ReservEntry."Qty. to Invoice (Base)";
            TempInvoicingSpecification."Qty. to Invoice" :=
              ROUND(ReservEntry."Qty. to Invoice (Base)" / ReservEntry."Qty. per Unit of Measure", 0.00001);
            TempInvoicingSpecification."Buffer Status" := TempInvoicingSpecification."Buffer Status"::MODIFY;
            TempInvoicingSpecification.INSERT;
            ReservEntry.DELETE;
        UNTIL ReservEntry.NEXT = 0;

        OK := TempInvoicingSpecification.FINDFIRST;
    end;

    (56917)]
    procedure DeleteInvoiceSpecFromHeader(var SalesHeader: Record "Sales Header");
    var
        TrackingSpecification: Record "Tracking Specification";
    begin
        TrackingSpecification.SETCURRENTKEY("Source ID", "Source Type",
          "Source Subtype", "Source Batch Name", "Source Prod. Order Line", "Source Ref. No.");
        TrackingSpecification.SETRANGE("Source Type", DATABASE::"Sales Line");
        TrackingSpecification.SETRANGE("Source Subtype", SalesHeader."Document Type");
        TrackingSpecification.SETRANGE("Source ID", SalesHeader."No.");
        TrackingSpecification.SETRANGE("Source Batch Name", '');
        TrackingSpecification.SETRANGE("Source Prod. Order Line", 0);
        IF TrackingSpecification.FINDSET THEN
            REPEAT
                TrackingSpecification.DELETE;
            UNTIL TrackingSpecification.NEXT = 0;
    end;

    (56930)]
    local procedure DeleteInvoiceSpecFromLine(SalesLine: Record "Sales Line");
    var
        TrackingSpecification: Record "Tracking Specification";
    begin
        TrackingSpecification.SETCURRENTKEY("Source ID", "Source Type",
          "Source Subtype", "Source Batch Name", "Source Prod. Order Line", "Source Ref. No.");
        TrackingSpecification.SETRANGE("Source ID", SalesLine."Document No.");
        TrackingSpecification.SETRANGE("Source Type", DATABASE::"Sales Line");
        TrackingSpecification.SETRANGE("Source Subtype", SalesLine."Document Type");
        TrackingSpecification.SETRANGE("Source Batch Name", '');
        TrackingSpecification.SETRANGE("Source Prod. Order Line", 0);
        TrackingSpecification.SETRANGE("Source Ref. No.", SalesLine."Line No.");
        IF TrackingSpecification.FINDSET THEN
            REPEAT
                TrackingSpecification.DELETE;
            UNTIL TrackingSpecification.NEXT = 0;
    end;

    (56944)]
    procedure UpdateItemTrackingAfterPosting(SalesHeader: Record "Sales Header");
    var
        ReservEntry: Record "Reservation Entry";
        CreateReservEntry: Codeunit "Create Reserv. Entry";
    begin
        // Used for updating Quantity to Handle and Quantity to Invoice after posting
        ReservEngineMgt.InitFilterAndSortingLookupFor(ReservEntry, FALSE);
        ReservEntry.SETRANGE("Source Type", DATABASE::"Sales Line");
        ReservEntry.SETRANGE("Source Subtype", SalesHeader."Document Type");
        ReservEntry.SETRANGE("Source ID", SalesHeader."No.");
        ReservEntry.SETRANGE("Source Batch Name", '');
        ReservEntry.SETRANGE("Source Prod. Order Line", 0);
        CreateReservEntry.UpdateItemTrackingAfterPosting(ReservEntry);
    end;

    (56954)]
    procedure SetApplySpecificItemTracking(ApplySpecific: Boolean);
    begin
        ApplySpecificItemTracking := ApplySpecific;
    end;

    (56957)]
    procedure SetOverruleItemTracking(Overrule: Boolean);
    begin
        OverruleItemTracking := Overrule;
    end;

    (56960)]
    procedure Block(SetBlocked: Boolean);
    begin
        Blocked := SetBlocked;
    end;

    (56963)]
    procedure SetItemTrkgAlreadyOverruled(HasBeenOverruled: Boolean);
    begin
        ItemTrkgAlreadyOverruled := HasBeenOverruled;
    end;

    (56966)]
    local procedure VerifyPickedQtyReservToInventory(OldReservEntry: Record "Reservation Entry"; SalesLine: Record "Sales Line"; TransferQty: Decimal): Boolean;
    var
        WhseShptLine: Record "Warehouse Shipment Line";
        NewReservEntry: Record "Reservation Entry";
    begin
        WITH WhseShptLine DO BEGIN
            SETRANGE(Status, Status::"Partially Picked");
            SETRANGE("Source Type", DATABASE::"Sales Line");
            SETRANGE("Source Subtype", SalesLine."Document Type");
            SETRANGE("Source No.", SalesLine."Document No.");
            SETRANGE("Source Line No.", SalesLine."Line No.");

            EXIT(FINDFIRST AND NewReservEntry.GET(OldReservEntry."Entry No.", NOT OldReservEntry.Positive) AND
              (OldReservEntry."Reservation Status" = OldReservEntry."Reservation Status"::Reservation) AND
              (NewReservEntry."Source Type" <> DATABASE::"Item Ledger Entry") AND ("Qty. Picked (Base)" >= TransferQty));
        END;
    end;

    (56979)]
    local procedure ClearReservation(OldSalesLine: Record "Sales Line"; NewSalesLine: Record "Sales Line");
    var
        DummyReservEntry: Record "Reservation Entry";
    begin
        IF (NewSalesLine."No." <> OldSalesLine."No.") OR FindReservEntry(NewSalesLine, DummyReservEntry) THEN BEGIN
            IF (NewSalesLine."No." <> OldSalesLine."No.") OR (NewSalesLine.Type <> OldSalesLine.Type) THEN BEGIN
                ReservMgt.SetSalesLine(OldSalesLine);
                ReservMgt.DeleteReservEntries(TRUE, 0);
                ReservMgt.SetSalesLine(NewSalesLine);
            END ELSE BEGIN
                ReservMgt.SetSalesLine(NewSalesLine);
                ReservMgt.DeleteReservEntries(TRUE, 0);
            END;
            ReservMgt.AutoTrack(NewSalesLine."Outstanding Qty. (Base)");
        END;
    end;

    (56992)]
    local procedure TestSalesLineModification(OldSalesLine: Record "Sales Line"; NewSalesLine: Record "Sales Line"; ThrowError: Boolean) HasError: Boolean;
    begin
        IF (NewSalesLine."Shipment Date" = 0D) AND (OldSalesLine."Shipment Date" <> 0D) THEN BEGIN
            IF ThrowError THEN
                NewSalesLine.FIELDERROR("Shipment Date", ValueIsEmptyErr);
            HasError := TRUE;
        END;

        IF NewSalesLine."Job No." <> '' THEN BEGIN
            IF ThrowError THEN
                NewSalesLine.FIELDERROR("Job No.", ValueNotEmptyErr);
            HasError := TRUE;
        END;

        IF NewSalesLine."Purchase Order No." <> '' THEN BEGIN
            IF ThrowError THEN
                NewSalesLine.FIELDERROR("Purchase Order No.", ValueNotEmptyErr);
            HasError := NewSalesLine."Purchase Order No." <> OldSalesLine."Purchase Order No.";
        END;

        IF NewSalesLine."Purch. Order Line No." <> 0 THEN BEGIN
            IF ThrowError THEN
                NewSalesLine.FIELDERROR("Purch. Order Line No.", ValueNotEmptyErr);
            HasError := NewSalesLine."Purch. Order Line No." <> OldSalesLine."Purch. Order Line No.";
        END;

        IF NewSalesLine."Drop Shipment" AND NOT OldSalesLine."Drop Shipment" THEN BEGIN
            IF ThrowError THEN
                NewSalesLine.FIELDERROR("Drop Shipment", ValueNotEmptyErr);
            HasError := TRUE;
        END;

        IF NewSalesLine."Special Order" AND NOT OldSalesLine."Special Order" THEN BEGIN
            IF ThrowError THEN
                NewSalesLine.FIELDERROR("Special Order", ValueNotEmptyErr);
            HasError := TRUE;
        END;

        IF NewSalesLine."No." <> OldSalesLine."No." THEN BEGIN
            IF ThrowError THEN
                NewSalesLine.FIELDERROR("No.", ValueChangedErr);
            HasError := TRUE;
        END;

        IF NewSalesLine."Variant Code" <> OldSalesLine."Variant Code" THEN BEGIN
            IF ThrowError THEN
                NewSalesLine.FIELDERROR("Variant Code", ValueChangedErr);
            HasError := TRUE;
        END;

        IF NewSalesLine."Location Code" <> OldSalesLine."Location Code" THEN BEGIN
            IF ThrowError THEN
                NewSalesLine.FIELDERROR("Location Code", ValueChangedErr);
            HasError := TRUE;
        END;

        IF (OldSalesLine.Type = OldSalesLine.Type::Item) AND (NewSalesLine.Type = NewSalesLine.Type::Item) THEN
            IF (NewSalesLine."Bin Code" <> OldSalesLine."Bin Code") AND
               (NOT ReservMgt.CalcIsAvailTrackedQtyInBin(
                  NewSalesLine."No.", NewSalesLine."Bin Code",
                  NewSalesLine."Location Code", NewSalesLine."Variant Code",
                  DATABASE::"Sales Line", NewSalesLine."Document Type",
                  NewSalesLine."Document No.", '', 0, NewSalesLine."Line No."))
            THEN BEGIN
                IF ThrowError THEN
                    NewSalesLine.FIELDERROR("Bin Code", ValueChangedErr);
                HasError := TRUE;
            END;

        IF NewSalesLine."Line No." <> OldSalesLine."Line No." THEN
            HasError := TRUE;

        IF NewSalesLine.Type <> OldSalesLine.Type THEN
            HasError := TRUE;
    end;

    (57066)]
    procedure CreateReservationSchedule(var ScheduleLine: Record Schedule2; Description: Text[50]; ExpectedReceiptDate: Date; Quantity: Decimal; QuantityBase: Decimal; ForSerialNo: Code[20]; ForLotNo: Code[20]);
    var
        ShipmentDate: Date;
        SignFactor: Integer;
        SalesLine: Record "Sales Line";
    begin
        IF SetFromType = 0 THEN
            ERROR(CodeunitInitErr);
        SalesLine.GET(FORMAT(ScheduleLine."Document Type"), ScheduleLine."Document No.", ScheduleLine."Document Line No.");
        ScheduleLine.TESTFIELD(Type, ScheduleLine.Type::Item);
        ScheduleLine.TESTFIELD("No.");
        //ScheduleLine.TESTFIELD("Shipment Date");
        ScheduleLine.CALCFIELDS("Reserved Qty. (Base)");
        IF ABS(ScheduleLine."Outstanding Qty.(Base)") < ABS(ScheduleLine."Reserved Qty. (Base)") + QuantityBase THEN
            ERROR(
              ReservedQtyTooLargeErr,
              ABS(ScheduleLine."Outstanding Qty.(Base)") - ABS(ScheduleLine."Reserved Qty. (Base)"));

        ScheduleLine.TESTFIELD("Variant Code", SetFromVariantCode);
        ScheduleLine.TESTFIELD("Location Code", SetFromLocationCode);
        /*
        IF SalesLine."Document Type" = SalesLine."Document Type"::"Return Order" THEN
          SignFactor := 1
        ELSE
        */
        SignFactor := -1;

        IF QuantityBase * SignFactor < 0 THEN
            ShipmentDate := SalesLine."Shipment Date"
        ELSE BEGIN
            ShipmentDate := ExpectedReceiptDate;
            ExpectedReceiptDate := SalesLine."Shipment Date";
        END;

        CreateReservEntry.CreateReservEntryFor(
          DATABASE::Schedule2, SalesLine."Document Type",
          ScheduleLine."Document No.", '', ScheduleLine."Line No.", ScheduleLine."Document Line No.", ScheduleLine."Qty. per Unit of Measure",
          Quantity, QuantityBase, ForSerialNo, ForLotNo);
        CreateReservEntry.CreateReservEntryFrom(
          SetFromType, SetFromSubtype, SetFromID, SetFromBatchName, SetFromProdOrderLine, SetFromRefNo,
          SetFromQtyPerUOM, SetFromSerialNo, SetFromLotNo);
        CreateReservEntry.CreateReservEntry(
          ScheduleLine."No.", ScheduleLine."Variant Code", ScheduleLine."Location Code",
          Description, ExpectedReceiptDate, ShipmentDate);//EFFUPG -Deleted Parameter(0)

        SetFromType := 0;

    end;
}

