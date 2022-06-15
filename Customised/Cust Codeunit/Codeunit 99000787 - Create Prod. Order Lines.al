codeunit 99000787 "Create Prod. Order Lines"
{
    // version NAVW19.00.00.50868

    Permissions = TableData Item = r,
                  TableData "Sales Header" = r,
                  TableData "Sales Line" = r,
                  TableData "Prod. Order Line" = rimd,
                  TableData "Prod. Order Component" = rimd,
                  TableData TableData5408 = r,
                  TableData "Manufacturing Setup" = rim,
                  TableData "Family Line" = r,
                  TableData "Production Order" = r;

    trigger OnRun();
    begin
    end;

    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        FamilyLine: Record "Family Line";
        MfgSetup: Record "Manufacturing Setup";
        ProdOrder: Record "Production Order";
        ProdOrderLine: Record "Prod. Order Line";
        ProdOrderLine2: Record "Prod. Order Line";
        ProdOrderComp: Record "Prod. Order Component";
        ReservEntry: Record "Reservation Entry";
        TrackingSpecification: Record "Tracking Specification";
        TempOldProdOrderComp: Record "Prod. Order Component" temporary;
        ReserveSalesLine: Codeunit "Sales Line-Reserve";
        ReserveProdOrderComp: Codeunit "Prod. Order Comp.-Reserve";
        ReservMgt: Codeunit "Reservation Management";
        CalcProdOrder: Codeunit "Calculate Prod. Order";
        NextProdOrderLineNo: Integer;
        InsertNew: Boolean;
        SalesLineIsSet: Boolean;
        ScheduleLine: Record Schedule2;
        ScheduleLineIsSet: Boolean;
        "--EFFUPG--": Integer;
        Item: Record Item;
        Alternate_PCB_Replace: Boolean;

    (54408)]
    procedure CheckStructure(Status: Option; ProdOrderNo: Code[20]; Direction: Option Forward,Backward; MultiLevel: Boolean; LetDueDateDecrease: Boolean);
    begin
        ProdOrder.GET(Status, ProdOrderNo);
        ProdOrderLine.SETRANGE(Status, Status);
        ProdOrderLine.SETRANGE("Prod. Order No.", ProdOrderNo);
        IF ProdOrderLine.FIND('+') THEN
            NextProdOrderLineNo := ProdOrderLine."Line No." + 10000
        ELSE
            NextProdOrderLineNo := 10000;

        CheckMultiLevelStructure(Direction, MultiLevel, LetDueDateDecrease);
    end;

    (54419)]
    procedure Copy(ProdOrder2: Record "Production Order"; Direction: Option Forward,Backward; VariantCode: Code[10]; LetDueDateDecrease: Boolean; AlternatePCBReplace: Boolean): Boolean;
    var
        ErrorOccured: Boolean;
    begin
        Alternate_PCB_Replace := AlternatePCBReplace;
        MfgSetup.GET;

        ProdOrder2.TESTFIELD("Source No.");
        ProdOrder2.TESTFIELD("Starting Time");
        ProdOrder2.TESTFIELD("Starting Date");
        ProdOrder2.TESTFIELD("Ending Time");
        ProdOrder2.TESTFIELD("Ending Date");
        IF Direction = Direction::Backward THEN
            ProdOrder2.TESTFIELD("Due Date");

        ProdOrder := ProdOrder2;

        ProdOrderLine.LOCKTABLE;
        ProdOrderLine.SETRANGE(Status, ProdOrder.Status);
        ProdOrderLine.SETRANGE("Prod. Order No.", ProdOrder."No.");
        ProdOrderLine.DELETEALL(TRUE);

        NextProdOrderLineNo := 10000;

        InsertNew := FALSE;
        CASE ProdOrder."Source Type" OF
            ProdOrder."Source Type"::Item:
                BEGIN
                    InitProdOrderLine(ProdOrder."Source No.", VariantCode, ProdOrder."Location Code");
                    ProdOrderLine.Description := ProdOrder.Description;
                    ProdOrderLine."Description 2" := ProdOrder."Description 2";
                    ProdOrderLine.VALIDATE(Quantity, ProdOrder.Quantity);
                    ProdOrderLine.UpdateDatetime;
                    IF SalesLineIsSet THEN
                        CopyDimFromSalesLine(SalesLine, ProdOrderLine);
                    ProdOrderLine.INSERT;
                    IF ProdOrderLine.HasErrorOccured THEN
                        ErrorOccured := TRUE;
                END;
            ProdOrder."Source Type"::Family:
                IF NOT CopyFromFamily THEN
                    ErrorOccured := TRUE;
            ProdOrder."Source Type"::"Sales Header":
                BEGIN
                    InsertNew := TRUE;
                    IF ProdOrder.Status <> ProdOrder.Status::Simulated THEN
                        SalesHeader.GET(SalesHeader."Document Type"::Order, ProdOrder."Source No.")
                    ELSE
                        SalesHeader.GET(SalesHeader."Document Type"::Quote, ProdOrder."Source No.");
                    IF NOT CopyFromSalesOrder THEN
                        ErrorOccured := TRUE;
                END;
        END;

        IF NOT ProcessProdOrderLines(Direction, LetDueDateDecrease) THEN
            ErrorOccured := TRUE;
        CheckMultiLevelStructure(Direction, TRUE, LetDueDateDecrease);
        EXIT(NOT ErrorOccured);
    end;

    (54475)]
    local procedure CopyFromFamily(): Boolean;
    var
        Family: Record Family;
        ErrorOccured: Boolean;
    begin
        Family.GET(ProdOrder."Source No.");
        FamilyLine.SETCURRENTKEY("Low-Level Code");
        FamilyLine.SETRANGE("Family No.", ProdOrder."Source No.");

        IF FamilyLine.FINDSET THEN
            REPEAT
                IF FamilyLine."Item No." <> '' THEN BEGIN
                    InitProdOrderLine(FamilyLine."Item No.", '', ProdOrder."Location Code");
                    ProdOrderLine.Description := FamilyLine.Description;
                    ProdOrderLine."Description 2" := FamilyLine."Description 2";
                    ProdOrderLine.VALIDATE("Unit of Measure Code", FamilyLine."Unit of Measure Code");
                    ProdOrderLine.VALIDATE(Quantity, FamilyLine.Quantity * ProdOrder.Quantity);
                    ProdOrderLine."Routing No." := Family."Routing No.";
                    ProdOrderLine."Routing Reference No." := 0;
                    ProdOrderLine.UpdateDatetime;
                    InsertProdOrderLine;
                    IF ProdOrderLine.HasErrorOccured THEN
                        ErrorOccured := TRUE;
                END;
            UNTIL FamilyLine.NEXT = 0;
        EXIT(NOT ErrorOccured);
    end;

    (54498)]
    local procedure CopyFromSalesOrder(): Boolean;
    var
        SalesPlanLine: Record "Sales Planning Line" temporary;
        TrackingSpecification: Record "Tracking Specification";
        Location: Record Location;
        LeadTimeMgt: Codeunit "Lead-Time Management";
        ItemTrackingMgt: Codeunit "Item Tracking Management";
        ReservMgt: Codeunit "Reservation Management";
        ErrorOccured: Boolean;
    begin
        SalesLine.SETRANGE("Document Type", SalesHeader."Document Type");
        SalesLine.SETRANGE("Document No.", SalesHeader."No.");
        IF SalesLine.FINDSET THEN
            REPEAT
                SalesLine.CALCFIELDS("Reserved Quantity");
                IF (SalesLine.Type = SalesLine.Type::Item) AND
                   (SalesLine."No." <> '') AND
                   ((SalesLine."Outstanding Quantity" - SalesLine."Reserved Quantity") <> 0)
                THEN
                    IF IsReplSystemProdOrder(SalesLine."No.", SalesLine."Variant Code", SalesLine."Location Code") THEN BEGIN
                        SalesPlanLine.INIT;
                        SalesPlanLine."Sales Order No." := SalesLine."Document No.";
                        SalesPlanLine."Sales Order Line No." := SalesLine."Line No.";
                        SalesPlanLine.VALIDATE("Item No.", SalesLine."No.");
                        SalesPlanLine.INSERT;
                    END;
            UNTIL SalesLine.NEXT = 0;

        SalesPlanLine.SETCURRENTKEY("Low-Level Code");
        IF SalesPlanLine.FINDSET THEN
            REPEAT
                SalesLine.GET(
                  SalesHeader."Document Type",
                  SalesPlanLine."Sales Order No.",
                  SalesPlanLine."Sales Order Line No.");
                SalesLine.CALCFIELDS("Reserved Quantity");

                InitProdOrderLine(SalesLine."No.", SalesLine."Variant Code", SalesLine."Location Code");
                ProdOrderLine.Description := SalesLine.Description;
                ProdOrderLine."Description 2" := SalesLine."Description 2";
                SalesLine.CALCFIELDS("Reserved Qty. (Base)");
                ProdOrderLine.VALIDATE("Quantity (Base)", SalesLine."Outstanding Qty. (Base)" - SalesLine."Reserved Qty. (Base)");

                IF Location.GET(ProdOrderLine."Location Code") AND NOT Location."Require Pick" AND (SalesLine."Bin Code" <> '') THEN
                    ProdOrderLine."Bin Code" := SalesLine."Bin Code";

                ProdOrderLine."Due Date" := SalesLine."Shipment Date";
                ProdOrderLine."Ending Date" :=
                  LeadTimeMgt.PlannedEndingDate(
                    ProdOrderLine."Item No.",
                    ProdOrderLine."Location Code",
                    '',
                    ProdOrderLine."Due Date",
                    '',
                    2);
                ProdOrderLine.VALIDATE("Ending Date");

                InsertProdOrderLine;
                IF ProdOrderLine.HasErrorOccured THEN
                    ErrorOccured := TRUE;
                ItemTrackingMgt.CopyItemTracking2(SalesLine.RowID1, ProdOrderLine.RowID1, TRUE, TRUE);

                IF SalesLine."Document Type" = SalesLine."Document Type"::Order THEN BEGIN // Not simulated
                    ReserveSalesLine.SetBinding(ReservEntry.Binding::"Order-to-Order");
                    ProdOrderLine.CALCFIELDS("Reserved Quantity", "Reserved Qty. (Base)");
                    ReservMgt.CreateTrackingSpecification(TrackingSpecification,
                      DATABASE::"Prod. Order Line",
                      ProdOrderLine.Status, ProdOrderLine."Prod. Order No.", '', ProdOrderLine."Line No.", 0,
                      ProdOrderLine."Variant Code", ProdOrderLine."Location Code", '', '',
                      ProdOrderLine."Qty. per Unit of Measure");
                    ReserveSalesLine.CreateReservationSetFrom(TrackingSpecification);
                    ReserveSalesLine.CreateReservation(
                      SalesLine, ProdOrderLine.Description, ProdOrderLine."Ending Date",
                      ProdOrderLine."Remaining Quantity" - ProdOrderLine."Reserved Quantity",
                      ProdOrderLine."Remaining Qty. (Base)" - ProdOrderLine."Reserved Qty. (Base)", '', '');
                END;
                CopyDimFromSalesLine(SalesLine, ProdOrderLine);
                ProdOrderLine.MODIFY;
            UNTIL (SalesPlanLine.NEXT = 0);
        EXIT(NOT ErrorOccured);
    end;

    (54570)]
    local procedure InitProdOrderLine(ItemNo: Code[20]; VariantCode: Code[10]; LocationCode: Code[10]);
    var
        Item: Record Item;
        Alt: Record "Alternate Items";
    begin
        /*IF (Alternate_PCB_Replace = TRUE) AND (COPYSTR(ItemNo,1,7)= 'ECPBPCB')  THEN
        BEGIN
          Alt.RESET;
          Alt.SETRANGE("Item No.", ItemNo);
          Alt.SETFILTER("Proudct Type",'%1|%2','ALL PRODUCTS',ProdOrder."Item Sub Group Code");
          //Alt.SETFILTER("Item No.",'%1','ECPBPCB*');
          IF Alt.FINDFIRST THEN
          BEGIN
            IF Alt."Alternative Item No." <> '' THEN
            BEGIN
                ItemNo := Alt."Alternative Item No.";
            END;
          END;
        END;*/
        ProdOrderLine.INIT;
        ProdOrderLine.SetIgnoreErrors;
        ProdOrderLine.Status := ProdOrder.Status;
        ProdOrderLine."Prod. Order No." := ProdOrder."No.";
        ProdOrderLine."Line No." := NextProdOrderLineNo;
        ProdOrderLine."Routing Reference No." := ProdOrderLine."Line No.";
        ProdOrderLine.VALIDATE("Item No.", ItemNo);
        ProdOrderLine."Location Code" := LocationCode;
        ProdOrderLine."Variant Code" := VariantCode;
        IF ProdOrder."Bin Code" <> '' THEN
            ProdOrderLine.VALIDATE("Bin Code", ProdOrder."Bin Code")
        ELSE
            CalcProdOrder.SetProdOrderLineBinCodeFromRoute(ProdOrderLine, ProdOrderLine."Location Code", ProdOrderLine."Routing No.");

        Item.GET(ItemNo);
        ProdOrderLine."Scrap %" := Item."Scrap %";
        ProdOrderLine."Due Date" := ProdOrder."Due Date";
        ProdOrderLine."Starting Date" := ProdOrder."Starting Date";
        ProdOrderLine."Starting Time" := ProdOrder."Starting Time";
        ProdOrderLine."Ending Date" := ProdOrder."Ending Date";
        ProdOrderLine."Ending Time" := ProdOrder."Ending Time";
        ProdOrderLine."Planning Level Code" := 0;
        ProdOrderLine."Inventory Posting Group" := Item."Inventory Posting Group";
        ProdOrderLine.UpdateDatetime;
        ProdOrderLine.VALIDATE("Unit Cost");

        NextProdOrderLineNo := NextProdOrderLineNo + 10000;

    end;

    (54613)]
    local procedure InsertProdOrderLine(): Boolean;
    var
        ProdOrderLine3: Record "Prod. Order Line";
    begin
        ProdOrderLine3 := ProdOrderLine;
        ProdOrderLine3.SETRANGE(Status, ProdOrderLine.Status);
        ProdOrderLine3.SETRANGE("Prod. Order No.", ProdOrderLine."Prod. Order No.");
        ProdOrderLine3.SETRANGE("Item No.", ProdOrderLine."Item No.");
        ProdOrderLine3.SETRANGE("Variant Code", ProdOrderLine."Variant Code");
        ProdOrderLine3.SETRANGE("Location Code", ProdOrderLine."Location Code");
        ProdOrderLine3.SETRANGE("Planning Level Code", ProdOrderLine."Planning Level Code");

        IF (NOT InsertNew) AND ProdOrderLine3.FINDFIRST THEN BEGIN
            CopyProdOrderCompToTemp(ProdOrderLine3);
            ProdOrderLine3.VALIDATE(Quantity, ProdOrderLine3.Quantity + ProdOrderLine.Quantity);
            AdjustDateAndTime(ProdOrderLine3, ProdOrderLine."Due Date", ProdOrderLine."Ending Date", ProdOrderLine."Ending Time");

            IF ProdOrderLine3."Planning Level Code" < ProdOrderLine."Planning Level Code" THEN BEGIN
                ProdOrderLine3."Planning Level Code" := ProdOrderLine."Planning Level Code";
                UpdateCompPlanningLevel(ProdOrderLine3);
            END;

            ProdOrderLine3.MODIFY;
            ProdOrderLine := ProdOrderLine3;
            EXIT(FALSE);
        END;
        ProdOrderLine.INSERT;
        EXIT(TRUE);
    end;

    (54639)]
    local procedure ProcessProdOrderLines(Direction: Option Forward,Backward; LetDueDateDecrease: Boolean): Boolean;
    var
        ErrorOccured: Boolean;
    begin
        ProdOrderLine.SETRANGE(Status, ProdOrder.Status);
        ProdOrderLine.SETRANGE("Prod. Order No.", ProdOrder."No.");

        IF ProdOrderLine.FINDSET(TRUE) THEN
            REPEAT
                //added by Vijaya on 22-08-2018 for PCB Rplace with Alternate
                CalcProdOrder.ALternateBOMReplace(Alternate_PCB_Replace);
                CalcProdOrder.SetParameter(TRUE);
                IF NOT CalcProdOrder.Calculate(ProdOrderLine, Direction, TRUE, TRUE, TRUE, LetDueDateDecrease) THEN
                    ErrorOccured := TRUE;
            UNTIL ProdOrderLine.NEXT = 0;
        ProdOrder.AdjustStartEndingDate;
        ProdOrder.MODIFY;

        EXIT(NOT ErrorOccured);
    end;

    (54656)]
    local procedure CheckMultiLevelStructure(Direction: Option Forward,Backward; MultiLevel: Boolean; LetDueDateDecrease: Boolean);
    var
        Item: Record Item;
        MultiLevelStructureCreated: Boolean;
    begin
        ProdOrderComp.SETCURRENTKEY(Status, "Prod. Order No.", "Prod. Order Line No.", "Item Low-Level Code");
        ProdOrderComp.SETRANGE(Status, ProdOrder.Status);
        ProdOrderComp.SETRANGE("Prod. Order No.", ProdOrder."No.");
        ProdOrderComp.SETFILTER("Item No.", '<>%1', '');
        IF ProdOrderComp.FINDSET(TRUE) THEN
            REPEAT
                IF ProdOrderComp."Planning Level Code" = 0 THEN BEGIN
                    Item.GET(ProdOrderComp."Item No.");
                    IF Item.IsMfgItem AND (Item."Manufacturing Policy" = Item."Manufacturing Policy"::"Make-to-Order") THEN BEGIN
                        ProdOrderComp."Planning Level Code" := 1;
                        ProdOrderComp.MODIFY(TRUE);
                    END;
                END;
                IF ProdOrderComp."Planning Level Code" > 0 THEN
                    MultiLevelStructureCreated :=
                      MultiLevelStructureCreated OR
                      CheckMakeOrderLine(ProdOrderComp, ProdOrderLine, Direction, MultiLevel, LetDueDateDecrease);
            UNTIL ProdOrderComp.NEXT = 0;
        IF MultiLevelStructureCreated THEN
            ReserveMultiLevelStructure(ProdOrderComp);
    end;

    (54678)]
    local procedure CheckMakeOrderLine(var ProdOrderComp: Record "Prod. Order Component"; var ProdOrderLine: Record "Prod. Order Line"; Direction: Option Forward,Backward; MultiLevel: Boolean; LetDueDateDecrease: Boolean): Boolean;
    var
        Item: Record Item;
        ParentItem: Record Item;
        ParentSKU: Record "Stockkeeping Unit";
        SKU: Record "Stockkeeping Unit";
        MakeProdOrder: Boolean;
        Description2: Text[50];
        Inserted: Boolean;
        Alt: Record "Alternate Items";
    begin
        ProdOrderLine2.GET(ProdOrderComp.Status, ProdOrderComp."Prod. Order No.", ProdOrderComp."Prod. Order Line No.");
        IF ParentSKU.GET(ProdOrderLine2."Location Code", ProdOrderLine2."Item No.", ProdOrderLine2."Variant Code") THEN
            MakeProdOrder := ParentSKU."Manufacturing Policy" = ParentSKU."Manufacturing Policy"::"Make-to-Order"
        ELSE BEGIN
            ParentItem.GET(ProdOrderLine2."Item No.");
            MakeProdOrder := ParentItem."Manufacturing Policy" = ParentItem."Manufacturing Policy"::"Make-to-Order";
        END;

        IF NOT MakeProdOrder THEN
            EXIT(FALSE);

        Item.GET(ProdOrderComp."Item No.");
        /*IF (Item."Product Group Code" = 'CPCB' )AND (Alternate_PCB_Replace = TRUE) THEN
        BEGIN
          Alt.RESET;
          Alt.SETRANGE("Item No.", ProdOrderComp."Item No.");
          Alt.SETFILTER("Proudct Type",'%1|%2','ALL PRODUCTS',ProdOrder."Item Sub Group Code");
          IF Alt.FINDFIRST THEN
          BEGIN
            IF Alt."Alternative Item No." <> '' THEN
            BEGIN
                Item.GET(Alt."Alternative Item No.");
            END;
          END;
        END;*/
        IF SKU.GET(ProdOrderComp."Location Code", ProdOrderComp."Item No.", ProdOrderComp."Variant Code") THEN BEGIN
            Description2 := SKU."Description 2";
            MakeProdOrder :=
              (SKU."Replenishment System" = SKU."Replenishment System"::"Prod. Order") AND
              (SKU."Manufacturing Policy" = SKU."Manufacturing Policy"::"Make-to-Order");
        END ELSE BEGIN
            Description2 := Item."Description 2";
            MakeProdOrder :=
              (Item."Replenishment System" = Item."Replenishment System"::"Prod. Order") AND
              (Item."Manufacturing Policy" = Item."Manufacturing Policy"::"Make-to-Order");
        END;

        IF NOT MakeProdOrder THEN
            EXIT(FALSE);

        InitProdOrderLine(ProdOrderComp."Item No.", ProdOrderComp."Variant Code", ProdOrderComp."Location Code");
        ProdOrderLine.VALIDATE("Unit of Measure Code", ProdOrderComp."Unit of Measure Code");
        ProdOrderLine."Qty. per Unit of Measure" := ProdOrderComp."Qty. per Unit of Measure";
        ProdOrderLine."Bin Code" := ProdOrderComp."Bin Code";
        ProdOrderLine.Description := ProdOrderComp.Description;
        ProdOrderLine."Description 2" := Description2;
        ProdOrderComp.CALCFIELDS("Reserved Quantity");
        ProdOrderLine.VALIDATE(Quantity, ProdOrderComp."Expected Quantity" - ProdOrderComp."Reserved Quantity");
        IF ProdOrderLine."Quantity (Base)" = 0 THEN
            EXIT(FALSE);
        ProdOrderLine."Planning Level Code" := ProdOrderComp."Planning Level Code";
        ProdOrderLine."Due Date" := ProdOrderComp."Due Date";
        ProdOrderLine."Ending Date" := ProdOrderComp."Due Date";
        ProdOrderLine."Ending Time" := ProdOrderComp."Due Time";
        ProdOrderLine.UpdateDatetime;
        // this InsertNew is responsible for controlling if same POLine is added up or new POLine is created
        InsertNew := InsertNew AND (ProdOrderComp."Planning Level Code" > 1);

        Inserted := InsertProdOrderLine;
        IF MultiLevel THEN
            IF Inserted THEN
                CalcProdOrder.Calculate(ProdOrderLine, Direction::Backward, TRUE, TRUE, TRUE, LetDueDateDecrease)
            ELSE BEGIN
                CalcProdOrder.Recalculate(ProdOrderLine, Direction::Backward, LetDueDateDecrease);
                IF ProdOrderLine."Line No." < ProdOrderComp."Prod. Order Line No." THEN
                    UpdateProdOrderLine(ProdOrderLine, Direction, LetDueDateDecrease);
            END
        ELSE
            EXIT(FALSE);
        ProdOrderComp."Supplied-by Line No." := ProdOrderLine."Line No.";
        ProdOrderComp.MODIFY;
        EXIT(TRUE);

    end;

    (54752)]
    local procedure ReserveMultiLevelStructure(var ProdOrderComp2: Record "Prod. Order Component");
    var
        ProdOrderComp3: Record "Prod. Order Component";
        ProdOrderLine3: Record "Prod. Order Line";
    begin
        ProdOrderComp3.COPY(ProdOrderComp2);
        ProdOrderComp3.SETCURRENTKEY(Status, "Prod. Order No.", "Prod. Order Line No.", "Due Date");
        ProdOrderComp3.SETFILTER("Supplied-by Line No.", '<>0');
        IF ProdOrderComp3.FIND('+') THEN
            REPEAT
                IF ProdOrderLine3.GET(
                     ProdOrderComp3.Status, ProdOrderComp3."Prod. Order No.", ProdOrderComp3."Supplied-by Line No.")
                THEN BEGIN
                    ReserveProdOrderComp.SetBinding(ReservEntry.Binding::"Order-to-Order");
                    ProdOrderComp3.CALCFIELDS("Reserved Quantity", "Reserved Qty. (Base)");
                    ReservMgt.CreateTrackingSpecification(TrackingSpecification,
                      DATABASE::"Prod. Order Line",
                      ProdOrderLine3.Status, ProdOrderLine3."Prod. Order No.", '', ProdOrderLine3."Line No.", 0,
                      ProdOrderLine3."Variant Code", ProdOrderLine3."Location Code", '', '',
                      ProdOrderLine3."Qty. per Unit of Measure");
                    ReserveProdOrderComp.CreateReservationSetFrom(TrackingSpecification);
                    ReserveProdOrderComp.CreateReservation(
                      ProdOrderComp3, ProdOrderLine3.Description, ProdOrderLine3."Ending Date",
                      ProdOrderComp3."Remaining Quantity" - ProdOrderComp3."Reserved Quantity",
                      ProdOrderComp3."Remaining Qty. (Base)" - ProdOrderComp3."Reserved Qty. (Base)", '', '');
                END;
            UNTIL ProdOrderComp3.NEXT(-1) = 0;
    end;

    (54776)]
    procedure CopyDimFromSalesLine(SalesLine: Record "Sales Line"; var ProdOrderLine: Record "Prod. Order Line");
    begin
        ProdOrderLine."Shortcut Dimension 1 Code" := SalesLine."Shortcut Dimension 1 Code";
        ProdOrderLine."Shortcut Dimension 2 Code" := SalesLine."Shortcut Dimension 2 Code";
        ProdOrderLine."Dimension Set ID" := SalesLine."Dimension Set ID";
    end;

    (54781)]
    procedure SetSalesLine(SalesLine2: Record "Sales Line");
    begin
        SalesLine := SalesLine2;
        SalesLineIsSet := TRUE;
    end;

    (54785)]
    local procedure AdjustDateAndTime(var ProdOrderLine3: Record "Prod. Order Line"; DueDate: Date; EndingDate: Date; EndingTime: Time);
    begin
        IF ProdOrderLine3."Due Date" > DueDate THEN
            ProdOrderLine3."Due Date" := DueDate;

        IF ProdOrderLine3."Ending Date" > EndingDate THEN BEGIN
            ProdOrderLine3."Ending Date" := EndingDate;
            ProdOrderLine3."Ending Time" := EndingTime;
        END ELSE
            IF (ProdOrderLine3."Ending Date" = EndingDate) AND
               (ProdOrderLine3."Ending Time" > EndingTime)
            THEN
                ProdOrderLine3."Ending Time" := EndingTime;
        ProdOrderLine3.UpdateDatetime;
    end;

    (54799)]
    local procedure UpdateCompPlanningLevel(ProdOrderLine3: Record "Prod. Order Line");
    var
        ProdOrderComp3: Record "Prod. Order Component";
    begin
        // update planning level code of component
        ProdOrderComp3.SETRANGE(Status, ProdOrderLine3.Status);
        ProdOrderComp3.SETRANGE("Prod. Order No.", ProdOrderLine3."Prod. Order No.");
        ProdOrderComp3.SETRANGE("Prod. Order Line No.", ProdOrderLine3."Line No.");
        ProdOrderComp3.SETFILTER("Planning Level Code", '>0');
        IF ProdOrderComp3.FINDSET(TRUE) THEN
            REPEAT
                ProdOrderComp3."Planning Level Code" := ProdOrderLine3."Planning Level Code" + 1;
                ProdOrderComp3.MODIFY;
            UNTIL ProdOrderComp3.NEXT = 0;
    end;

    (54811)]
    local procedure UpdateProdOrderLine(var ProdOrderLine: Record "Prod. Order Line"; Direction: Option Forward,Backward; LetDueDateDecrease: Boolean);
    var
        ProdOrderLine3: Record "Prod. Order Line";
        ProdOrderComp3: Record "Prod. Order Component";
    begin
        ProdOrderComp3.SETRANGE(Status, ProdOrderLine.Status);
        ProdOrderComp3.SETRANGE("Prod. Order No.", ProdOrderLine."Prod. Order No.");
        ProdOrderComp3.SETRANGE("Prod. Order Line No.", ProdOrderLine."Line No.");
        IF ProdOrderComp3.FINDSET THEN
            REPEAT
                ProdOrderLine3.COPYFILTERS(ProdOrderLine);
                ProdOrderLine3.SETRANGE("Item No.", ProdOrderComp3."Item No.");
                ProdOrderLine3.SETRANGE("Variant Code", ProdOrderComp3."Variant Code");
                IF ProdOrderLine3.FINDFIRST THEN BEGIN
                    ProdOrderComp3.CALCFIELDS("Reserved Quantity");
                    TempOldProdOrderComp.GET(ProdOrderComp3.Status, ProdOrderComp3."Prod. Order No.",
                      ProdOrderComp3."Prod. Order Line No.", ProdOrderComp3."Line No.");
                    ProdOrderLine3.VALIDATE(Quantity,
                      ProdOrderLine3.Quantity - TempOldProdOrderComp."Expected Quantity" +
                      ProdOrderComp3."Expected Quantity" - ProdOrderComp3."Reserved Quantity");
                    IF ProdOrderLine3."Planning Level Code" < ProdOrderComp3."Planning Level Code" THEN
                        ProdOrderLine3."Planning Level Code" := ProdOrderComp3."Planning Level Code";
                    AdjustDateAndTime(ProdOrderLine3, ProdOrderComp3."Due Date", ProdOrderComp3."Due Date", ProdOrderComp3."Due Time");
                    UpdateCompPlanningLevel(ProdOrderLine3);
                    CalcProdOrder.Recalculate(ProdOrderLine3, Direction::Backward, LetDueDateDecrease);
                    ProdOrderLine3.MODIFY;
                END;
            UNTIL ProdOrderComp3.NEXT = 0;
        TempOldProdOrderComp.DELETEALL;
    end;

    (54837)]
    local procedure CopyProdOrderCompToTemp(ProdOrderLine3: Record "Prod. Order Line");
    var
        ProdOrderComp2: Record "Prod. Order Component";
    begin
        TempOldProdOrderComp.DELETEALL;
        ProdOrderComp2.SETRANGE(Status, ProdOrderLine3.Status);
        ProdOrderComp2.SETRANGE("Prod. Order No.", ProdOrderLine3."Prod. Order No.");
        ProdOrderComp2.SETRANGE("Prod. Order Line No.", ProdOrderLine3."Line No.");
        IF ProdOrderComp2.FINDSET THEN
            REPEAT
                TempOldProdOrderComp := ProdOrderComp2;
                TempOldProdOrderComp.INSERT;
            UNTIL ProdOrderComp2.NEXT = 0;
    end;

    (54848)]
    local procedure IsReplSystemProdOrder(ItemNo: Code[20]; VariantCode: Code[10]; LocationCode: Code[10]): Boolean;
    var
        SKU: Record "Stockkeeping Unit";
        Item: Record Item;
    begin
        IF SKU.GET(LocationCode, ItemNo, VariantCode) THEN
            EXIT(SKU."Replenishment System" = SKU."Replenishment System"::"Prod. Order");

        Item.GET(ItemNo);
        EXIT(Item."Replenishment System" = Item."Replenishment System"::"Prod. Order");
    end;

    (54855)]
    procedure SetScheduleLine(ScheduleLine2: Record Schedule2);
    begin
        ScheduleLine := ScheduleLine2;
        ScheduleLineIsSet := TRUE;
    end;

    (54859)]
    procedure CopySchdl(ProdOrder2: Record "Production Order"; Direction: Option Forward,Backward; VariantCode: Code[10]; LetDueDateDecrease: Boolean): Boolean;
    var
        ErrorOccured: Boolean;
    begin
        MfgSetup.GET;

        ProdOrder2.TESTFIELD("Source No.");
        ProdOrder2.TESTFIELD("Starting Time");
        ProdOrder2.TESTFIELD("Starting Date");
        ProdOrder2.TESTFIELD("Ending Time");
        ProdOrder2.TESTFIELD("Ending Date");
        IF Direction = Direction::Backward THEN
            ProdOrder2.TESTFIELD("Due Date");

        ProdOrder := ProdOrder2;

        ProdOrderLine.LOCKTABLE;
        ProdOrderLine.SETRANGE(Status, ProdOrder.Status);
        ProdOrderLine.SETRANGE("Prod. Order No.", ProdOrder."No.");
        ProdOrderLine.DELETEALL(TRUE);

        NextProdOrderLineNo := 10000;

        InsertNew := FALSE;
        CASE ProdOrder."Source Type" OF
            ProdOrder."Source Type"::Item:
                BEGIN
                    Item.GET(ProdOrder."Source No.");
                    InitProdOrderLine(ProdOrder."Source No.", VariantCode, ProdOrder."Location Code");
                    ProdOrderLine."Variant Code" := VariantCode;
                    ProdOrderLine.Description := ProdOrder.Description;
                    ProdOrderLine."Description 2" := ProdOrder."Description 2";
                    ProdOrderLine.VALIDATE(Quantity, ProdOrder.Quantity);
                    ProdOrderLine.UpdateDatetime;
                    IF ScheduleLineIsSet THEN
                        CopyDimFromScheduleLine(ScheduleLine, ProdOrderLine);
                    ProdOrderLine.INSERT;
                    IF ProdOrderLine.HasErrorOccured THEN
                        ErrorOccured := TRUE;
                END;
            ProdOrder."Source Type"::Family:
                IF NOT CopyFromFamily THEN
                    ErrorOccured := TRUE;
            ProdOrder."Source Type"::"Sales Header":
                BEGIN
                    InsertNew := TRUE;
                    IF ProdOrder.Status <> ProdOrder.Status::Simulated THEN
                        SalesHeader.GET(SalesHeader."Document Type"::Order, ProdOrder."Source No.")
                    ELSE
                        SalesHeader.GET(SalesHeader."Document Type"::Quote, ProdOrder."Source No.");
                    IF NOT CopyFromSchdlOrder THEN
                        ErrorOccured := TRUE;
                END;
        END;

        IF NOT ProcessProdOrderLines(Direction, LetDueDateDecrease) THEN
            ErrorOccured := TRUE;
        CheckMultiLevelStructure(Direction, TRUE, LetDueDateDecrease);
        EXIT(NOT ErrorOccured);
    end;

    (54916)]
    procedure CopyDimFromScheduleLine(ScheduleLine: Record Schedule2; var ProdOrderLine: Record "Prod. Order Line");
    var
        SalesLine: Record "Sales Line";
    begin
        IF SalesLine.GET(SalesLine."Document Type"::Order, ScheduleLine."Document No.", ScheduleLine."Document Line No.") THEN BEGIN
            ProdOrderLine."Shortcut Dimension 1 Code" := SalesLine."Shortcut Dimension 1 Code";
            ProdOrderLine."Shortcut Dimension 2 Code" := SalesLine."Shortcut Dimension 2 Code";
            ProdOrderLine."Dimension Set ID" := SalesLine."Dimension Set ID";
        END;
    end;

    (54924)]
    local procedure CopyFromSchdlOrder(): Boolean;
    var
        SalesPlanLine: Record "Sales Planning Line" temporary;
        LeadTimeMgt: Codeunit "Lead-Time Management";
        ItemTrackingMgt: Codeunit "Item Tracking Management";
        ErrorOccured: Boolean;
    begin
        ScheduleLine.SETRANGE("Document Type", SalesHeader."Document Type");
        ScheduleLine.SETRANGE("Document No.", SalesHeader."No.");
        IF ScheduleLine.FINDSET THEN
            REPEAT
                ScheduleLine.CALCFIELDS("Reserved Quantity");
                IF (ScheduleLine.Type = SalesLine.Type::Item) AND
                   (ScheduleLine."No." <> '') AND (ScheduleLine."Document Line No." <> ScheduleLine."Line No.") AND
                   ((ScheduleLine."Outstanding Qty." - ScheduleLine."Reserved Quantity") <> 0)
                THEN BEGIN
                    Item.GET(ScheduleLine."No.");
                    IF Item."Replenishment System" = Item."Replenishment System"::"Prod. Order" THEN BEGIN
                        SalesPlanLine.INIT;
                        SalesPlanLine."Sales Order No." := ScheduleLine."Document No.";
                        SalesPlanLine."Sales Order Line No." := ScheduleLine."Document Line No.";
                        SalesPlanLine."Schedule Line No." := ScheduleLine."Line No.";
                        SalesPlanLine."Item No." := ScheduleLine."No.";
                        SalesPlanLine."Low-Level Code" := Item."Low-Level Code";
                        SalesPlanLine.INSERT;
                    END;
                END;
            UNTIL ScheduleLine.NEXT = 0;

        SalesPlanLine.SETCURRENTKEY("Low-Level Code");
        IF SalesPlanLine.FINDSET THEN
            REPEAT
                ScheduleLine.GET(SalesHeader."Document Type",
                  SalesPlanLine."Sales Order No.",
                  SalesPlanLine."Sales Order Line No.", SalesPlanLine."Schedule Line No.");
                SalesLine.GET(
                  SalesHeader."Document Type",
                  SalesPlanLine."Sales Order No.",
                  SalesPlanLine."Sales Order Line No.");
                ScheduleLine.CALCFIELDS("Reserved Quantity");
                Item.GET(ScheduleLine."No.");

                InitProdOrderLine(SalesLine."No.", SalesLine."Variant Code", SalesLine."Location Code");
                ProdOrderLine."Variant Code" := ScheduleLine."Variant Code";
                ProdOrderLine.Description := ScheduleLine.Description;
                // ProdOrderLine."Description 2" := SalesLine."Description 2";
                ScheduleLine.CALCFIELDS("Reserved Qty. (Base)");
                ProdOrderLine.VALIDATE("Quantity (Base)", ScheduleLine."Outstanding Qty.(Base)" - ScheduleLine."Reserved Qty. (Base)");
                ProdOrderLine."Location Code" := ScheduleLine."Location Code";
                ProdOrderLine."Bin Code" := ScheduleLine."Bin Code";
                ProdOrderLine."Due Date" := SalesLine."Shipment Date";
                ProdOrderLine."Ending Date" :=
                  LeadTimeMgt.PlannedEndingDate(
                    ProdOrderLine."Item No.",
                    ProdOrderLine."Location Code",
                    '',
                    ProdOrderLine."Due Date",
                    '',
                    2);
                ProdOrderLine.VALIDATE("Ending Date");

                InsertProdOrderLine;
                IF ProdOrderLine.HasErrorOccured THEN
                    ErrorOccured := TRUE;
                ItemTrackingMgt.CopyItemTracking2(ScheduleLine.RowID1, ProdOrderLine.RowID1, TRUE, TRUE);

                IF SalesLine."Document Type" = SalesLine."Document Type"::Order THEN BEGIN // Not simulated
                    ReserveSalesLine.SetBinding(ReservEntry.Binding::"Order-to-Order");
                    ProdOrderLine.CALCFIELDS("Reserved Quantity", "Reserved Qty. (Base)");
                    ReservMgt.CreateTrackingSpecification(TrackingSpecification,
                      DATABASE::"Prod. Order Line",
                      ProdOrderLine.Status, ProdOrderLine."Prod. Order No.", '', ProdOrderLine."Line No.", 0,
                      ProdOrderLine."Variant Code", ProdOrderLine."Location Code", '', '',
                      ProdOrderLine."Qty. per Unit of Measure");
                    ReserveSalesLine.CreateReservationSetFrom(TrackingSpecification);
                    ReserveSalesLine.CreateReservation(
                      SalesLine, ProdOrderLine.Description, ProdOrderLine."Ending Date",
                      ProdOrderLine."Remaining Quantity" - ProdOrderLine."Reserved Quantity",
                      ProdOrderLine."Remaining Qty. (Base)" - ProdOrderLine."Reserved Qty. (Base)", '', '');
                END;
                CopyDimFromScheduleLine(ScheduleLine, ProdOrderLine);
                ProdOrderLine.MODIFY;
            UNTIL (SalesPlanLine.NEXT = 0);
        EXIT(NOT ErrorOccured);
    end;
}

