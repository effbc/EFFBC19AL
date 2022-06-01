codeunit 99000835 "Item Jnl. Line-Reserve"
{
    // version NAVW17.10,QC1.0

    Permissions = TableData "Reservation Entry" = rimd;

    trigger OnRun();
    begin
    end;

    var
        Text000: TextConst ENU = 'Reserved quantity cannot be greater than %1', ENN = 'Reserved quantity cannot be greater than %1';
        Text002: TextConst ENU = 'must be filled in when a quantity is reserved', ENN = 'must be filled in when a quantity is reserved';
        Text003: TextConst ENU = 'must not be filled in when a quantity is reserved', ENN = 'must not be filled in when a quantity is reserved';
        Text004: TextConst ENU = 'must not be changed when a quantity is reserved', ENN = 'must not be changed when a quantity is reserved';
        Text005: TextConst ENU = 'Codeunit is not initialized correctly.', ENN = 'Codeunit is not initialized correctly.';
        ReservMgt: Codeunit "Reservation Management";
        CreateReservEntry: Codeunit "Create Reserv. Entry";
        ReservEngineMgt: Codeunit "Reservation Engine Mgt.";
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
        Text006: TextConst ENU = 'You cannot define item tracking on %1 %2', ENN = 'You cannot define item tracking on %1 %2';
        DeleteItemTracking: Boolean;

    [LineStart(57617)]
    procedure CreateReservation(var ItemJnlLine: Record "Item Journal Line"; Description: Text[50]; ExpectedReceiptDate: Date; Quantity: Decimal; QuantityBase: Decimal; ForSerialNo: Code[20]; ForLotNo: Code[20]);
    var
        ShipmentDate: Date;
    begin
        IF SetFromType = 0 THEN
            ERROR(Text005);

        ItemJnlLine.TESTFIELD("Item No.");
        ItemJnlLine.TESTFIELD("Posting Date");
        ItemJnlLine.CALCFIELDS("Reserved Qty. (Base)");
        IF ABS(ItemJnlLine."Quantity (Base)") <
           ABS(ItemJnlLine."Reserved Qty. (Base)") + QuantityBase
        THEN
            ERROR(
              Text000,
              ABS(ItemJnlLine."Quantity (Base)") - ABS(ItemJnlLine."Reserved Qty. (Base)"));

        ItemJnlLine.TESTFIELD("Location Code", SetFromLocationCode);
        ItemJnlLine.TESTFIELD("Variant Code", SetFromVariantCode);

        IF QuantityBase > 0 THEN
            ShipmentDate := ItemJnlLine."Posting Date"
        ELSE BEGIN
            ShipmentDate := ExpectedReceiptDate;
            ExpectedReceiptDate := ItemJnlLine."Posting Date";
        END;

        CreateReservEntry.CreateReservEntryFor(
          DATABASE::"Item Journal Line",
          ItemJnlLine."Entry Type", ItemJnlLine."Journal Template Name",
          ItemJnlLine."Journal Batch Name", 0, ItemJnlLine."Line No.", ItemJnlLine."Qty. per Unit of Measure",
          Quantity, QuantityBase, ForSerialNo, ForLotNo);
        CreateReservEntry.CreateReservEntryFrom(
          SetFromType, SetFromSubtype, SetFromID, SetFromBatchName, SetFromProdOrderLine, SetFromRefNo,
          SetFromQtyPerUOM, SetFromSerialNo, SetFromLotNo);
        CreateReservEntry.CreateReservEntry(
          ItemJnlLine."Item No.", ItemJnlLine."Variant Code", ItemJnlLine."Location Code",
          Description, ExpectedReceiptDate, ShipmentDate);

        SetFromType := 0;
    end;

    [LineStart(57655)]
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

    [LineStart(57670)]
    procedure FilterReservFor(var FilterReservEntry: Record "Reservation Entry"; ItemJnlLine: Record "Item Journal Line");
    begin
        FilterReservEntry.SETRANGE("Source Type", DATABASE::"Item Journal Line");
        FilterReservEntry.SETRANGE("Source Subtype", ItemJnlLine."Entry Type");
        FilterReservEntry.SETRANGE("Source ID", ItemJnlLine."Journal Template Name");
        FilterReservEntry.SETRANGE("Source Batch Name", ItemJnlLine."Journal Batch Name");
        FilterReservEntry.SETRANGE("Source Prod. Order Line", 0);
        FilterReservEntry.SETRANGE("Source Ref. No.", ItemJnlLine."Line No.");

        FilterReservEntry.SETRANGE("Serial No.", ItemJnlLine."Serial No.");
        FilterReservEntry.SETRANGE("Lot No.", ItemJnlLine."Lot No.");
    end;

    [LineStart(57681)]
    procedure Caption(ItemJnlLine: Record "Item Journal Line") CaptionText: Text[80];
    begin
        CaptionText :=
          STRSUBSTNO(
            '%1 %2 %3', ItemJnlLine."Journal Template Name", ItemJnlLine."Journal Batch Name",
            ItemJnlLine."Item No.");
    end;

    [LineStart(57687)]
    procedure FindReservEntry(ItemJnlLine: Record "Item Journal Line"; var ReservEntry: Record "Reservation Entry"): Boolean;
    begin
        ReservEngineMgt.InitFilterAndSortingLookupFor(ReservEntry, FALSE);
        FilterReservFor(ReservEntry, ItemJnlLine);

        EXIT(ReservEntry.FINDLAST);
    end;

    [LineStart(57693)]
    procedure ReservEntryExist(ItemJnlLine: Record "Item Journal Line"): Boolean;
    var
        ReservEntry: Record "Reservation Entry";
    begin
        ReservEngineMgt.InitFilterAndSortingLookupFor(ReservEntry, FALSE);
        FilterReservFor(ReservEntry, ItemJnlLine);
        ReservEntry.SETRANGE("Serial No."); // Ignore Serial No
        ReservEntry.SETRANGE("Lot No."); // Ignore Lot No

        EXIT(NOT ReservEntry.ISEMPTY);
    end;

    [LineStart(57701)]
    procedure VerifyChange(var NewItemJnlLine: Record "Item Journal Line"; var OldItemJnlLine: Record "Item Journal Line");
    var
        ItemJnlLine: Record "Item Journal Line";
        TempReservEntry: Record "Reservation Entry";
        ItemTrackManagement: Codeunit "Item Tracking Management";
        ShowError: Boolean;
        HasError: Boolean;
        SNRequired: Boolean;
        LNRequired: Boolean;
        PointerChanged: Boolean;
    begin
        IF Blocked THEN
            EXIT;
        ItemJnlLine.SETCURRENTKEY("Journal Template Name", "Journal Batch Name", "Line No.");
        IF NewItemJnlLine."Line No." = 0 THEN
            IF NOT ItemJnlLine.GET(
                 NewItemJnlLine."Journal Template Name",
                 NewItemJnlLine."Journal Batch Name",
                 NewItemJnlLine."Line No.")
            THEN
                EXIT;

        NewItemJnlLine.CALCFIELDS("Reserved Qty. (Base)");
        ShowError := NewItemJnlLine."Reserved Qty. (Base)" <> 0;

        IF NewItemJnlLine."Posting Date" = 0D THEN
            IF ShowError THEN
                NewItemJnlLine.FIELDERROR("Posting Date", Text002)
            ELSE
                HasError := TRUE;

        IF NewItemJnlLine."Drop Shipment" THEN
            IF ShowError THEN
                NewItemJnlLine.FIELDERROR("Drop Shipment", Text003)
            ELSE
                HasError := TRUE;

        IF NewItemJnlLine."Item No." <> OldItemJnlLine."Item No." THEN
            IF ShowError THEN
                NewItemJnlLine.FIELDERROR("Item No.", Text004)
            ELSE
                HasError := TRUE;

        IF NewItemJnlLine."Entry Type" <> OldItemJnlLine."Entry Type" THEN
            IF ShowError THEN
                NewItemJnlLine.FIELDERROR("Entry Type", Text004)
            ELSE
                HasError := TRUE;

        IF (NewItemJnlLine."Entry Type" = NewItemJnlLine."Entry Type"::Transfer) AND
           (NewItemJnlLine."Quantity (Base)" < 0)
        THEN BEGIN
            IF NewItemJnlLine."New Location Code" <> OldItemJnlLine."Location Code" THEN
                IF ShowError THEN
                    NewItemJnlLine.FIELDERROR("New Location Code", Text004)
                ELSE
                    HasError := TRUE;
            IF NewItemJnlLine."New Bin Code" <> OldItemJnlLine."Bin Code" THEN BEGIN
                ItemTrackManagement.CheckWhseItemTrkgSetup(NewItemJnlLine."Item No.", SNRequired, LNRequired, FALSE);
                IF SNRequired OR LNRequired THEN
                    IF ShowError THEN
                        NewItemJnlLine.FIELDERROR("New Bin Code", Text004)
                    ELSE
                        HasError := TRUE;
            END
        END ELSE BEGIN
            IF NewItemJnlLine."Location Code" <> OldItemJnlLine."Location Code" THEN
                IF ShowError THEN
                    NewItemJnlLine.FIELDERROR("Location Code", Text004)
                ELSE
                    HasError := TRUE;
            IF (NewItemJnlLine."Bin Code" <> OldItemJnlLine."Bin Code") AND
               (NOT ReservMgt.CalcIsAvailTrackedQtyInBin(
                  NewItemJnlLine."Item No.", NewItemJnlLine."Bin Code",
                  NewItemJnlLine."Location Code", NewItemJnlLine."Variant Code",
                  DATABASE::"Item Journal Line", NewItemJnlLine."Entry Type",
                  NewItemJnlLine."Journal Template Name", NewItemJnlLine."Journal Batch Name",
                  0, NewItemJnlLine."Line No."))
            THEN BEGIN
                IF ShowError THEN
                    NewItemJnlLine.FIELDERROR("Bin Code", Text004);
                HasError := TRUE;
            END;
        END;
        IF NewItemJnlLine."Variant Code" <> OldItemJnlLine."Variant Code" THEN
            IF ShowError THEN
                NewItemJnlLine.FIELDERROR("Variant Code", Text004)
            ELSE
                HasError := TRUE;
        IF NewItemJnlLine."Line No." <> OldItemJnlLine."Line No." THEN
            HasError := TRUE;

        IF HasError THEN BEGIN
            FindReservEntry(NewItemJnlLine, TempReservEntry);
            TempReservEntry.SETRANGE("Serial No.");
            TempReservEntry.SETRANGE("Lot No.");

            PointerChanged := (NewItemJnlLine."Item No." <> OldItemJnlLine."Item No.") OR
              (NewItemJnlLine."Entry Type" <> OldItemJnlLine."Entry Type");

            IF PointerChanged OR
               (NOT TempReservEntry.ISEMPTY)
            THEN BEGIN
                IF PointerChanged THEN BEGIN
                    ReservMgt.SetItemJnlLine(OldItemJnlLine);
                    ReservMgt.DeleteReservEntries(TRUE, 0);
                    ReservMgt.SetItemJnlLine(NewItemJnlLine);
                END ELSE BEGIN
                    ReservMgt.SetItemJnlLine(NewItemJnlLine);
                    ReservMgt.DeleteReservEntries(TRUE, 0);
                END;
                ReservMgt.AutoTrack(NewItemJnlLine."Quantity (Base)");
            END;
        END;
    end;

    [LineStart(57806)]
    procedure VerifyQuantity(var NewItemJnlLine: Record "Item Journal Line"; var OldItemJnlLine: Record "Item Journal Line");
    var
        ItemJnlLine: Record "Item Journal Line";
    begin
        IF Blocked THEN
            EXIT;

        WITH NewItemJnlLine DO BEGIN
            IF "Line No." = OldItemJnlLine."Line No." THEN
                IF "Quantity (Base)" = OldItemJnlLine."Quantity (Base)" THEN
                    EXIT;
            IF "Line No." = 0 THEN
                IF NOT ItemJnlLine.GET("Journal Template Name", "Journal Batch Name", "Line No.") THEN
                    EXIT;
            ReservMgt.SetItemJnlLine(NewItemJnlLine);
            IF "Qty. per Unit of Measure" <> OldItemJnlLine."Qty. per Unit of Measure" THEN
                ReservMgt.ModifyUnitOfMeasure;
            IF "Quantity (Base)" * OldItemJnlLine."Quantity (Base)" < 0 THEN
                ReservMgt.DeleteReservEntries(TRUE, 0)
            ELSE
                ReservMgt.DeleteReservEntries(FALSE, "Quantity (Base)");
        END;
    end;

    [LineStart(57826)]
    procedure TransferItemJnlToItemLedgEntry(var ItemJnlLine: Record "Item Journal Line"; var ItemLedgEntry: Record "Item Ledger Entry"; TransferQty: Decimal; SkipInventory: Boolean);
    var
        OldReservEntry: Record "Reservation Entry";
        OldReservEntry2: Record "Reservation Entry";
        Status: Option Reservation,Tracking,Surplus,Prospect;
        SkipThisRecord: Boolean;
    begin
        IF NOT FindReservEntry(ItemJnlLine, OldReservEntry) THEN
            EXIT;

        OldReservEntry.Lock;

        ItemLedgEntry.TESTFIELD("Item No.", ItemJnlLine."Item No.");
        ItemLedgEntry.TESTFIELD("Variant Code", ItemJnlLine."Variant Code");
        IF ItemJnlLine."Entry Type" = ItemJnlLine."Entry Type"::Transfer THEN BEGIN
            ItemLedgEntry.TESTFIELD("Location Code", ItemJnlLine."New Location Code");
        END ELSE
            ItemLedgEntry.TESTFIELD("Location Code", ItemJnlLine."Location Code");

        FOR Status := Status::Reservation TO Status::Prospect DO BEGIN
            IF TransferQty = 0 THEN
                EXIT;
            OldReservEntry.SETRANGE("Reservation Status", Status);

            IF OldReservEntry.FINDSET THEN
                REPEAT
                    OldReservEntry.TESTFIELD("Item No.", ItemJnlLine."Item No.");
                    OldReservEntry.TESTFIELD("Variant Code", ItemJnlLine."Variant Code");

                    IF SkipInventory THEN
                        IF Status < Status::Surplus THEN BEGIN
                            OldReservEntry2.GET(OldReservEntry."Entry No.", NOT OldReservEntry.Positive);
                            SkipThisRecord := OldReservEntry2."Source Type" = DATABASE::"Item Ledger Entry";
                        END ELSE
                            SkipThisRecord := FALSE;

                    IF NOT SkipThisRecord THEN BEGIN
                        IF ItemJnlLine."Entry Type" = ItemJnlLine."Entry Type"::Transfer THEN BEGIN
                            IF ItemLedgEntry.Quantity < 0 THEN
                                OldReservEntry.TESTFIELD("Location Code", ItemJnlLine."Location Code");
                            CreateReservEntry.SetInbound(TRUE);
                        END ELSE
                            OldReservEntry.TESTFIELD("Location Code", ItemJnlLine."Location Code");

                        TransferQty :=
                          CreateReservEntry.TransferReservEntry(
                            DATABASE::"Item Ledger Entry", 0, '', '', 0,
                            ItemLedgEntry."Entry No.", ItemLedgEntry."Qty. per Unit of Measure",
                            OldReservEntry, TransferQty);
                    END ELSE
                        IF Status = Status::Tracking THEN BEGIN
                            OldReservEntry2.DELETE;
                            OldReservEntry.DELETE;
                            ReservMgt.ModifyActionMessage(OldReservEntry."Entry No.", 0, TRUE);
                        END;
                UNTIL (OldReservEntry.NEXT = 0) OR (TransferQty = 0);
        END; // DO
    end;

    [LineStart(57878)]
    procedure RenameLine(var NewItemJnlLine: Record "Item Journal Line"; var OldItemJnlLine: Record "Item Journal Line");
    begin
        ReservEngineMgt.RenamePointer(DATABASE::"Item Journal Line",
          OldItemJnlLine."Entry Type",
          OldItemJnlLine."Journal Template Name",
          OldItemJnlLine."Journal Batch Name",
          0,
          OldItemJnlLine."Line No.",
          NewItemJnlLine."Entry Type",
          NewItemJnlLine."Journal Template Name",
          NewItemJnlLine."Journal Batch Name",
          0,
          NewItemJnlLine."Line No.");
    end;

    [LineStart(57891)]
    procedure DeleteLineConfirm(var ItemJnlLine: Record "Item Journal Line"): Boolean;
    begin
        WITH ItemJnlLine DO BEGIN
            IF NOT ReservEntryExist(ItemJnlLine) THEN
                EXIT(TRUE);

            ReservMgt.SetItemJnlLine(ItemJnlLine);
            IF ReservMgt.DeleteItemTrackingConfirm THEN
                DeleteItemTracking := TRUE;
        END;

        EXIT(DeleteItemTracking);
    end;

    [LineStart(57903)]
    procedure DeleteLine(var ItemJnlLine: Record "Item Journal Line");
    begin
        IF Blocked THEN
            EXIT;

        WITH ItemJnlLine DO BEGIN
            ReservMgt.SetItemJnlLine(ItemJnlLine);
            IF DeleteItemTracking THEN
                ReservMgt.SetItemTrackingHandling(1); // Allow Deletion
            ReservMgt.DeleteReservEntries(TRUE, 0);
            CALCFIELDS("Reserved Qty. (Base)");
        END;
    end;

    [LineStart(57915)]
    procedure AssignForPlanning(var ItemJnlLine: Record "Item Journal Line");
    var
        PlanningAssignment: Record "Planning Assignment";
    begin
        IF ItemJnlLine."Item No." <> '' THEN
            WITH ItemJnlLine DO BEGIN
                PlanningAssignment.ChkAssignOne("Item No.", "Variant Code", "Location Code", "Posting Date");
                IF "Entry Type" = "Entry Type"::Transfer THEN
                    PlanningAssignment.ChkAssignOne("Item No.", "Variant Code", "New Location Code", "Posting Date");
            END;
    end;

    [LineStart(57923)]
    procedure Block(SetBlocked: Boolean);
    begin
        Blocked := SetBlocked;
    end;

    [LineStart(57926)]
    procedure CallItemTracking(var ItemJnlLine: Record "Item Journal Line"; IsReclass: Boolean);
    var
        TrackingSpecification: Record "Tracking Specification";
        ReservEntry: Record "Reservation Entry";
        ItemTrackingForm: Page "Item Tracking Lines";
    begin
        ItemJnlLine.TESTFIELD("Item No.");
        IF NOT ItemJnlLine.ItemPosting THEN BEGIN
            ReservEngineMgt.InitFilterAndSortingLookupFor(ReservEntry, FALSE);
            FilterReservFor(ReservEntry, ItemJnlLine);
            ReservEntry.SETRANGE("Serial No.");
            ReservEntry.SETRANGE("Lot No.");
            IF NOT ReservEntry.FINDFIRST THEN
                ERROR(Text006, ItemJnlLine.FIELDCAPTION("Operation No."), ItemJnlLine."Operation No.");
        END;
        InitTrackingSpecification(ItemJnlLine, TrackingSpecification);
        IF IsReclass THEN
            ItemTrackingForm.SetFormRunMode(1);
        ItemTrackingForm.SetSource(TrackingSpecification, ItemJnlLine."Posting Date");
        ItemTrackingForm.SetInbound(ItemJnlLine.IsInbound);
        //B2B
        //QC
        COMMIT;
        //QC
        //B2B

        ItemTrackingForm.RUNMODAL;
    end;

    [LineStart(57949)]
    procedure InitTrackingSpecification(var ItemJnlLine: Record "Item Journal Line"; var TrackingSpecification: Record "Tracking Specification");
    begin
        TrackingSpecification.INIT;
        TrackingSpecification."Source Type" := DATABASE::"Item Journal Line";
        WITH ItemJnlLine DO BEGIN
            TrackingSpecification."Item No." := "Item No.";
            TrackingSpecification."Location Code" := "Location Code";
            TrackingSpecification.Description := Description;
            TrackingSpecification."Variant Code" := "Variant Code";
            TrackingSpecification."Source Subtype" := "Entry Type";
            TrackingSpecification."Source ID" := "Journal Template Name";
            TrackingSpecification."Source Batch Name" := "Journal Batch Name";
            TrackingSpecification."Source Prod. Order Line" := 0;
            TrackingSpecification."Source Ref. No." := "Line No.";
            TrackingSpecification."Quantity (Base)" := "Quantity (Base)";
            TrackingSpecification."Qty. to Handle" := Quantity;
            TrackingSpecification."Qty. to Handle (Base)" := "Quantity (Base)";
            TrackingSpecification."Qty. to Invoice" := Quantity;
            TrackingSpecification."Qty. to Invoice (Base)" := "Quantity (Base)";
            TrackingSpecification."Quantity Handled (Base)" := 0;
            TrackingSpecification."Quantity Invoiced (Base)" := 0;
            TrackingSpecification."Qty. per Unit of Measure" := "Qty. per Unit of Measure";
            TrackingSpecification."Bin Code" := "Bin Code";
        END;
    end;

    [LineStart(57973)]
    procedure RegisterBinContentItemTracking(var ItemJournalLine: Record "Item Journal Line"; var TempTrackingSpecification: Record "Tracking Specification" temporary);
    var
        SourceTrackingSpecification: Record "Tracking Specification";
        ItemTrackingForm: Page "Item Tracking Lines";
        FormRunMode: Option Reclass,"Combined Ship/Rcpt","Drop Shipment",Transfer;
    begin
        IF NOT TempTrackingSpecification.FINDSET THEN
            EXIT;
        InitTrackingSpecification(ItemJournalLine, SourceTrackingSpecification);

        CLEAR(ItemTrackingForm);
        ItemTrackingForm.SetFormRunMode(FormRunMode::Reclass);
        ItemTrackingForm.RegisterItemTrackingLines(
          SourceTrackingSpecification, ItemJournalLine."Posting Date", TempTrackingSpecification);
    end;
}

