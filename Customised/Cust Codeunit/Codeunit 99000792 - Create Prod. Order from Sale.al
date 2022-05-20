codeunit 99000792 "Create Prod. Order from Sale"
{
    // version NAVW19.00.00.45778,EFFUPG


    trigger OnRun();
    begin
    end;

    var
        Text000 : TextConst ENU='%1 Prod. Order %2 has been created.',ENN='%1 Prod. Order %2 has been created.';
        HideValidationDialog : Boolean;
        RoutingLine : Record "Routing Line";
        RoutingHeader : Record "Routing Header";
        "Prod.OrdLine" : Record "Prod. Order Line";
        Item : Record Item;
        DisProductionStartDate : Boolean;
        Items : Record Item;

    [LineStart(55005)]
    procedure CreateProdOrder(SalesLine : Record "Sales Line";ProdOrderStatus : Option Simulated,Planned,"Firm Planned",Released,Finished;OrderType : Option ItemOrder,ProjectOrder);
    var
        ReservEntry : Record "Reservation Entry";
        ProdOrder : Record "Production Order";
        ProdOrderLine : Record "Prod. Order Line";
        TrackingSpecification : Record "Tracking Specification";
        ReserveSalesLine : Codeunit "Sales Line-Reserve";
        CreateProdOrderLines : Codeunit "Create Prod. Order Lines";
        ProdOrderStatusMgt : Codeunit "Prod. Order Status Management";
        LeadTimeMgt : Codeunit "Lead-Time Management";
        ItemTrackingMgt : Codeunit "Item Tracking Management";
        ReservMgt : Codeunit "Reservation Management";
        ReservQty : Decimal;
        ReservQtyBase : Decimal;
        ProdOrderRowID : Text[250];
        prmRefresh : Codeunit SQLIntegration;
    begin
        ProdOrder.INIT;
        ProdOrder.Status := ProdOrderStatus;
        ProdOrder."No." := '';
        ProdOrder.INSERT(TRUE);

        ProdOrder."Starting Date" := WORKDATE;
        ProdOrder."Creation Date" := WORKDATE;
        //B2B
        ProdOrder."Due Date" := SalesLine."Shipment Date";
        ProdOrder."Ending Date" := SalesLine."Shipment Date"-1;
        ProdOrder."Low-Level Code" := 1;
        //B2B
        ProdOrder."Gen. Bus. Posting Group" := SalesLine."Gen. Bus. Posting Group";
        IF OrderType = OrderType::ProjectOrder THEN BEGIN
          ProdOrder."Source Type" := ProdOrder."Source Type"::"Sales Header";
          ProdOrder.VALIDATE("Source No.",SalesLine."Document No.");
          ProdOrder."Due Date" := SalesLine."Shipment Date";
          ProdOrder."Ending Date" :=
            LeadTimeMgt.PlannedEndingDate(
              SalesLine."No.",
              SalesLine."Location Code",
              '',
              ProdOrder."Due Date",
              '',
              2);
              //Added by Vishnu Priya on 23-05-2020
          IF (ProdOrder."Source No." <> '') AND (ProdOrder.Quantity <> 0) THEN BEGIN
            IF Items.GET(ProdOrder."Source No.") THEN BEGIN
            ProdOrder.Itm_card_No_of_Units := Items."No.of Units";
            ProdOrder.Itm_Card_ttl_units := ProdOrder.Quantity * Items."No.of Units";
            END;
          END;
          //Added by Vishnu Priya on 23-05-2020
        END ELSE BEGIN
          ProdOrder."Due Date" := SalesLine."Shipment Date";
          ProdOrder."Source Type" := ProdOrder."Source Type"::Item;
          ProdOrder."Location Code" := SalesLine."Location Code";
          ProdOrder."Bin Code" := SalesLine."Bin Code";
          ProdOrder.VALIDATE("Source No.",SalesLine."No.");
          ProdOrder.VALIDATE(Description,SalesLine.Description);
          SalesLine.CALCFIELDS("Reserved Qty. (Base)");
          ProdOrder.Quantity := SalesLine."Outstanding Qty. (Base)" - SalesLine."Reserved Qty. (Base)";
        //Added by Vishnu Priya on 23-05-2020
          IF (ProdOrder."Source No." <> '') AND (ProdOrder.Quantity <> 0) THEN BEGIN
            IF Items.GET(ProdOrder."Source No.") THEN BEGIN
            ProdOrder.Itm_card_No_of_Units := Items."No.of Units";
            ProdOrder.Itm_Card_ttl_units := ProdOrder.Quantity * Items."No.of Units";
            END;
          END;
          //Added by Vishnu Priya on 23-05-2020
        END;
        ProdOrder.MODIFY;

        ProdOrder.SETRANGE("No.",ProdOrder."No.");
        CreateProdOrderLines.SetSalesLine(SalesLine);
        CreateProdOrderLines.Copy(ProdOrder,1,SalesLine."Variant Code",TRUE,FALSE);
        //added by vijaya 21-08-2018 for Alternate PCB Replacement

        IF ProdOrder."Source Type" = ProdOrder."Source Type"::Item THEN BEGIN
          ProdOrderLine.SETRANGE(Status,ProdOrder.Status);
          ProdOrderLine.SETRANGE("Prod. Order No.",ProdOrder."No.");

          IF ProdOrderLine.FINDFIRST THEN BEGIN
            ProdOrderRowID :=
              ItemTrackingMgt.ComposeRowID(
                DATABASE::"Prod. Order Line",ProdOrderLine.Status,
                ProdOrderLine."Prod. Order No.",'',ProdOrderLine."Line No.",0);
            ItemTrackingMgt.CopyItemTracking2(SalesLine.RowID1,ProdOrderRowID,TRUE,TRUE); // *** SE 13910

            SalesLine.CALCFIELDS("Reserved Quantity","Reserved Qty. (Base)");
            IF ProdOrderLine."Remaining Qty. (Base)" > (SalesLine."Outstanding Qty. (Base)" - SalesLine."Reserved Qty. (Base)")
            THEN BEGIN
              ReservQty := (SalesLine."Outstanding Quantity" - SalesLine."Reserved Quantity");
              ReservQtyBase := (SalesLine."Outstanding Qty. (Base)" - SalesLine."Reserved Qty. (Base)");
            END ELSE BEGIN
              ReservQty := ROUND(ProdOrderLine."Remaining Qty. (Base)" / SalesLine."Qty. per Unit of Measure",0.00001);
              ReservQtyBase := ProdOrderLine."Remaining Qty. (Base)";
            END;
            ReserveSalesLine.SetBinding(ReservEntry.Binding::"Order-to-Order");
            ReservMgt.CreateTrackingSpecification(TrackingSpecification,
              DATABASE::"Prod. Order Line",
              ProdOrderLine.Status,ProdOrderLine."Prod. Order No.",'',ProdOrderLine."Line No.",0,
              ProdOrderLine."Variant Code",ProdOrderLine."Location Code",'','',
              ProdOrderLine."Qty. per Unit of Measure");
            ReserveSalesLine.CreateReservationSetFrom(TrackingSpecification);
            ReserveSalesLine.CreateReservation(
              SalesLine,ProdOrderLine.Description,ProdOrderLine."Ending Date",ReservQty,ReservQtyBase,'','');
            IF SalesLine.Reserve = SalesLine.Reserve::Never THEN
              SalesLine.Reserve := SalesLine.Reserve::Optional;
            SalesLine.MODIFY;
            ProdOrderLine.MODIFY;
            IF OrderType = OrderType::ItemOrder THEN
              CreateProdOrderLines.CopyDimFromSalesLine(SalesLine,ProdOrderLine);
          END;
        END;
        IF ProdOrder.Status = ProdOrder.Status::Released THEN
          ProdOrderStatusMgt.FlushProdOrder(ProdOrder,ProdOrder.Status,WORKDATE);

        IF NOT HideValidationDialog THEN
          MESSAGE(
            Text000,
            ProdOrder.Status,ProdOrder."No.");

        IF (ProdOrder.Status=ProdOrder.Status::Released)AND(ProdOrder."Location Code"='PROD') THEN
        BEGIN
          prmRefresh.ProdOrdRefresh(ProdOrder."No.");
        END;
    end;

    [LineStart(55114)]
    procedure SetHideValidationDialog(NewHideValidationDialog : Boolean);
    begin
        HideValidationDialog := NewHideValidationDialog;
    end;

    [LineStart(55117)]
    procedure CreateProdOrder2(SalesLine : Record "Sales Line";ProdOrderStatus : Option Quote,Planned,"Firm Planned",Released;OrderType : Option ItemOrder,ProjectOrder;QtyParam : Decimal);
    var
        ReservEntry : Record "Reservation Entry";
        ProdOrder : Record "Production Order";
        ProdOrderLine : Record "Prod. Order Line";
        ReservMgt : Codeunit "Reservation Management";
        ReserveSalesLine : Codeunit "Sales Line-Reserve";
        CreateProdOrderLines : Codeunit "Create Prod. Order Lines";
        ProdOrderStatusMgt : Codeunit "Prod. Order Status Management";
        ReservQty : Decimal;
        ManufSetup : Record "Manufacturing Setup";
        SOProdOrderDetails : Record "SO Prod.Order Details";
        prmRefresh : Codeunit SQLIntegration;
    begin
        ProdOrder.INIT;
        ProdOrder.Status := ProdOrderStatus;
        ProdOrder."No." := '';
        ProdOrder.INSERT(TRUE);
        
        ProdOrder."Starting Date" := WORKDATE;
        ProdOrder."Creation Date" := WORKDATE;
        ProdOrder."Due Date" := SalesLine."Prod. Due Date";
        //ProdOrder."Ending Date" := SalesLine."Shipment Date"-1;
        ProdOrder."Ending Date" := SalesLine."Prod. Due Date";
        ProdOrder."Low-Level Code" := 1;
        ProdOrder."Gen. Bus. Posting Group" := SalesLine."Gen. Bus. Posting Group";
        IF OrderType = OrderType::ProjectOrder THEN BEGIN
          ProdOrder."Source Type" := ProdOrder."Source Type"::"Sales Header";
          ProdOrder.VALIDATE("Source No.",SalesLine."Document No.");
          ProdOrder.VALIDATE("Source No.");
        END ELSE BEGIN
          ProdOrder."Source Type" := ProdOrder."Source Type"::Item;
          ProdOrder.VALIDATE("Source No.",SalesLine."No.");
          ProdOrder.VALIDATE("Source No."); // addeded by Vishnu Priya on 08-05-2020 for the No.of Units calculation
          Item.RESET;
          Item.SETFILTER(Item."No.",SalesLine."No.");
          IF Item.FINDFIRST THEN          //pranavi on 13-10-2015
            ProdOrder.VALIDATE(Description,Item.Description)
          ELSE
            ProdOrder.VALIDATE(Description,SalesLine.Description);
          ManufSetup.GET;
          ProdOrder."Location Code" := ManufSetup."Production Location";
          ProdOrder."Bin Code" := SalesLine."Bin Code";
          ProdOrder."Sales Order No." := SalesLine."Document No.";
          ProdOrder."Sales Order Line No." := SalesLine."Line No.";
          SalesLine.CALCFIELDS("Reserved Qty. (Base)");
          //ProdOrder.Quantity :=  SalesLine."Outstanding Qty. (Base)" - SalesLine."Reserved Qty. (Base)";
            ProdOrder.Quantity := QtyParam;
        END;
        IF DisProductionStartDate THEN BEGIN
          ProdOrder."Prod Start date" := TODAY;
          ProdOrder."Planned Dispatch Date" := CALCDATE('1M',TODAY);
        END;
        ProdOrder.MODIFY;
        
        ProdOrder.SETRANGE("No.",ProdOrder."No.");
        CreateProdOrderLines.SetSalesLine(SalesLine);
        CreateProdOrderLines.Copy(ProdOrder,1,SalesLine."Variant Code",TRUE,FALSE);//EFFUPG Added "TRUE"
        //added by vijaya 21-08-2018 for Alternate PCB Replacement
        
        SOProdOrderDetails.INIT;
        SOProdOrderDetails.Type := SOProdOrderDetails.Type :: "Prod. Order";
        SOProdOrderDetails."Sales Order No." := SalesLine."Document No.";
        SOProdOrderDetails."Sales Order Line No." := SalesLine."Line No.";
        SOProdOrderDetails."No." := ProdOrder."No.";
        SOProdOrderDetails.Quantity := 1;
        SOProdOrderDetails.Status := SOProdOrderDetails.Status ::Released;
        SOProdOrderDetails.INSERT;
        
        IF ProdOrder."Source Type" = ProdOrder."Source Type"::Item THEN BEGIN
          ProdOrderLine.SETRANGE(Status,ProdOrder.Status);
          ProdOrderLine.SETRANGE("Prod. Order No.",ProdOrder."No.");
        
          IF ProdOrderLine.FINDFIRST THEN BEGIN
            CLEAR(ReservMgt);
            SalesLine.CALCFIELDS("Reserved Qty. (Base)");
            IF ProdOrderLine."Remaining Qty. (Base)" > (SalesLine."Outstanding Qty. (Base)" - SalesLine."Reserved Qty. (Base)") THEN
              ReservQty := (SalesLine."Outstanding Qty. (Base)" - SalesLine."Reserved Qty. (Base)")
            ELSE
              ReservQty := ProdOrderLine."Remaining Qty. (Base)";
            /*ReservMgt.SetProdOrderLine(ProdOrderLine);
            ReservEntry."Source Type" :=
              DATABASE::"Sales Line";
            ReserveSalesLine.SetBinding(ReservEntry.Binding::"Order-to-Order");
            ReserveSalesLine.CreateReservationSetFrom(
              DATABASE::"Prod. Order Line",
              ProdOrderLine.Status,
              ProdOrderLine."Prod. Order No.",
              '',
              ProdOrderLine."Line No.",0,
              ProdOrderLine."Variant Code",
              ProdOrderLine."Location Code",'','',
              ProdOrderLine."Qty. per Unit of Measure");
            ReserveSalesLine.CreateReservation(
              SalesLine,
              ProdOrderLine.Description,
              ProdOrderLine."Ending Date",
              ReservQty,
              '','');
            IF SalesLine.Reserve = SalesLine.Reserve::Never THEN
              SalesLine.Reserve := SalesLine.Reserve::Optional;
            SalesLine.MODIFY;*/
            ProdOrderLine.MODIFY;
            IF OrderType = OrderType::ItemOrder THEN
              CreateProdOrderLines.CopyDimFromSalesLine(SalesLine,ProdOrderLine);
          END;
        END;
        
        IF ProdOrder.Status = ProdOrder.Status::Released THEN
          ProdOrderStatusMgt.FlushProdOrder(ProdOrder,ProdOrder.Status,WORKDATE);
        /*//B2BJM Requested by renuka madam
        IF NOT HideValidationDialog THEN
          MESSAGE(
            Text000,
            ProdOrder.Status,ProdOrder."No.");
        *///B2BJM
        
        //refresh code by pranavi on 27-02-15
        /*
        ProdOrder.TESTFIELD("Location Code");
        ProdOrder.SETRANGE(Status,ProdOrder.Status);
        ProdOrder.SETRANGE("No.",ProdOrder."No.");
        REPORT.RUNMODAL(REPORT::"Refresh Production Order",FALSE,FALSE,ProdOrder);
        
        //B2B-KNR  BEGIN
        ProdOrderLine.SETRANGE(ProdOrderLine.Status,ProdOrder.Status);
        ProdOrderLine.SETRANGE("Prod. Order No.",ProdOrder."No.");
        IF "Prod.OrdLine".FINDSET THEN
          REPEAT
           RoutingHeader.SETRANGE("No.","Prod.OrdLine"."Routing No.");
           IF RoutingHeader.FINDFIRST THEN BEGIN
             RoutingHeader.Status := RoutingHeader.Status :: "Under Development";
             RoutingHeader.MODIFY;
           END;
            RoutingLine.SETRANGE("Routing No.","Prod.OrdLine"."Routing No.");
            IF RoutingLine.FINDSET THEN
              REPEAT
        
                        RoutingLine."Lot Size" := 0;
                RoutingLine.MODIFY;
              UNTIL RoutingLine.NEXT = 0;
           RoutingHeader.RESET;
           RoutingHeader.SETRANGE("No.","Prod.OrdLine"."Routing No.");
           IF RoutingHeader.FINDFIRST THEN BEGIN
             RoutingHeader.Status := RoutingHeader.Status :: Certified;
             RoutingHeader.MODIFY;
           END;
          UNTIL "Prod.OrdLine".NEXT = 0;
        //  CODEUNIT.RUN(60024);
        //B2B-KNR  END
        //refreshtime.refresh("No.");
        
        // PRM integration
         {IF "Location Code"='PROD' THEN
            PRMintegrate.ProdOrdRefresh("No.");}
        
        // PRM integration
        
        //refresh end
        */
        IF (ProdOrder.Status=ProdOrder.Status::Released)AND(ProdOrder."Location Code"='PROD') THEN
        BEGIN
          prmRefresh.ProdOrdRefresh(ProdOrder."No.");
        END;

    end;

    [LineStart(55269)]
    procedure CreateProdOrderForSchedule(ScheduleLine : Record Schedule2;ProdOrderStatus : Option Quote,Planned,"Firm Planned",Released;OrderType : Option ItemOrder,ProjectOrder);
    var
        ReservEntry : Record "Reservation Entry";
        ProdOrder : Record "Production Order";
        ProdOrderLine : Record "Prod. Order Line";
        TrackingSpecification : Record "Tracking Specification";
        ReservMgt : Codeunit "Reservation Management";
        ReserveSalesLine : Codeunit "Sales Line-Reserve";
        CreateProdOrderLines : Codeunit "Create Prod. Order Lines";
        ProdOrderStatusMgt : Codeunit "Prod. Order Status Management";
        LeadTimeMgt : Codeunit "Lead-Time Management";
        ItemTrackingMgt : Codeunit "Item Tracking Management";
        ReservQty : Decimal;
        ReservQtyBase : Decimal;
        ProdOrderRowID : Text[250];
        prmRefresh : Codeunit SQLIntegration;
        SalesLine : Record "Sales Line";
    begin
        // Pranavi
        SalesLine.GET(SalesLine."Document Type"::Order,ScheduleLine."Document No.",ScheduleLine."Document Line No.");
        ProdOrder.INIT;
        ProdOrder.Status := ProdOrderStatus;
        ProdOrder."No." := '';
        ProdOrder.INSERT(TRUE);
        
        ProdOrder."Starting Date" := WORKDATE;
        ProdOrder."Creation Date" := WORKDATE;
        //B2B
        ProdOrder."Due Date" := SalesLine."Shipment Date";
        ProdOrder."Ending Date" := SalesLine."Shipment Date"-1;
        ProdOrder."Low-Level Code" := 1;
        //B2B
        ProdOrder."Gen. Bus. Posting Group" := SalesLine."Gen. Bus. Posting Group";
        IF OrderType = OrderType::ProjectOrder THEN BEGIN
          ProdOrder."Source Type" := ProdOrder."Source Type"::"Sales Header";
          ProdOrder.VALIDATE("Source No.",ScheduleLine."Document No.");
          ProdOrder."Due Date" := SalesLine."Shipment Date";
          ProdOrder."Ending Date" :=
            LeadTimeMgt.PlannedEndingDate(
              ScheduleLine."No.",
              ScheduleLine."Location Code",
              '',
              ProdOrder."Due Date",
              '',
              2);
        END ELSE BEGIN
          ProdOrder."Due Date" := SalesLine."Shipment Date";
          ProdOrder."Source Type" := ProdOrder."Source Type"::Item;
          ProdOrder."Location Code" := ScheduleLine."Location Code";
          ProdOrder."Bin Code" := ScheduleLine."Bin Code";
          ProdOrder.VALIDATE("Source No.",ScheduleLine."No.");
          ProdOrder.VALIDATE("Source No.");
          ProdOrder.VALIDATE(Description,ScheduleLine.Description);
          ScheduleLine.CALCFIELDS(ScheduleLine."Reserved Qty. (Base)");
          ProdOrder.Quantity := ScheduleLine."Outstanding Qty.(Base)" - ScheduleLine."Reserved Qty. (Base)";
        END;
        ProdOrder.MODIFY;
        
        ProdOrder.SETRANGE("No.",ProdOrder."No.");
        CreateProdOrderLines.SetScheduleLine(ScheduleLine);
        CreateProdOrderLines.CopySchdl(ProdOrder,1,ScheduleLine."Variant Code",FALSE);
        
        IF ProdOrder."Source Type" = ProdOrder."Source Type"::Item THEN BEGIN
          ProdOrderLine.SETRANGE(Status,ProdOrder.Status);
          ProdOrderLine.SETRANGE("Prod. Order No.",ProdOrder."No.");
        
          IF ProdOrderLine.FINDFIRST THEN BEGIN
            ProdOrderRowID :=
              ItemTrackingMgt.ComposeRowID(
                DATABASE::"Prod. Order Line",ProdOrderLine.Status,
                ProdOrderLine."Prod. Order No.",'',ProdOrderLine."Line No.",0);
            ItemTrackingMgt.CopyItemTracking2(ScheduleLine.RowID1,ProdOrderRowID,TRUE,TRUE); // *** SE 13910
        
            ScheduleLine.CALCFIELDS("Reserved Quantity","Reserved Qty. (Base)");
            IF ProdOrderLine."Remaining Qty. (Base)" > (ScheduleLine."Outstanding Qty.(Base)" - ScheduleLine."Reserved Qty. (Base)")
            THEN BEGIN
              ReservQty := (ScheduleLine."Outstanding Qty." - ScheduleLine."Reserved Quantity");
              ReservQtyBase := (ScheduleLine."Outstanding Qty.(Base)" - ScheduleLine."Reserved Qty. (Base)");
            END ELSE BEGIN
              ReservQty := ProdOrderLine."Remaining Quantity";
              ReservQtyBase := ProdOrderLine."Remaining Qty. (Base)";
            END;
            ReserveSalesLine.SetBinding(ReservEntry.Binding::"Order-to-Order");
            /*
            ReserveSalesLine.CreateReservationSetFrom(
              DATABASE::"Prod. Order Line",
              ProdOrderLine.Status,
              ProdOrderLine."Prod. Order No.",
              '',
              ProdOrderLine."Line No.",0,
              ProdOrderLine."Variant Code",
              ProdOrderLine."Location Code",'','',
              ProdOrderLine."Qty. per Unit of Measure");
            ReserveSalesLine.CreateReservation(
              SalesLine,
              ProdOrderLine.Description,
              ProdOrderLine."Ending Date",
              ReservQty,ReservQtyBase,
              '','');
              *///EFFUPG
            ReservMgt.CreateTrackingSpecification(TrackingSpecification,
              DATABASE::"Prod. Order Line",
              ProdOrderLine.Status,ProdOrderLine."Prod. Order No.",'',ProdOrderLine."Line No.",0,
              ProdOrderLine."Variant Code",ProdOrderLine."Location Code",'','',
              ProdOrderLine."Qty. per Unit of Measure");
            ReserveSalesLine.CreateReservationSetFrom(TrackingSpecification);
            ReserveSalesLine.CreateReservation(
              SalesLine,ProdOrderLine.Description,ProdOrderLine."Ending Date",ReservQty,ReservQtyBase,'','');
            /*
            IF SalesLine.Reserve = SalesLine.Reserve::Never THEN
              SalesLine.Reserve := SalesLine.Reserve::Optional;
            */
            SalesLine.MODIFY;
            ProdOrderLine.MODIFY;
            IF OrderType = OrderType::ItemOrder THEN
              CreateProdOrderLines.CopyDimFromScheduleLine(ScheduleLine,ProdOrderLine);
          END;
        END;
        IF ProdOrder.Status = ProdOrder.Status::Released THEN
          ProdOrderStatusMgt.FlushProdOrder(ProdOrder,ProdOrder.Status,WORKDATE);
        
        IF NOT HideValidationDialog THEN
          MESSAGE(
            Text000,
            ProdOrder.Status,ProdOrder."No.");
        
        IF (ProdOrder.Status=ProdOrder.Status::Released)AND(ProdOrder."Location Code"='PROD') THEN
        BEGIN
          prmRefresh.ProdOrdRefresh(ProdOrder."No.");
        END;

    end;

    [LineStart(55383)]
    procedure CreateProdOrder2ForSchedule(ScheduleLine : Record Schedule2;ProdOrderStatus : Option Quote,Planned,"Firm Planned",Released;OrderType : Option ItemOrder,ProjectOrder;QtyParam : Decimal);
    var
        ReservEntry : Record "Reservation Entry";
        ProdOrder : Record "Production Order";
        ProdOrderLine : Record "Prod. Order Line";
        ReservMgt : Codeunit "Reservation Management";
        ReserveSalesLine : Codeunit "Sales Line-Reserve";
        CreateProdOrderLines : Codeunit "Create Prod. Order Lines";
        ProdOrderStatusMgt : Codeunit "Prod. Order Status Management";
        ReservQty : Decimal;
        ManufSetup : Record "Manufacturing Setup";
        SOProdOrderDetails : Record "SO Prod.Order Details";
        prmRefresh : Codeunit SQLIntegration;
        SalesLine : Record "Sales Line";
    begin
        SalesLine.GET(SalesLine."Document Type"::Order,ScheduleLine."Document No.",ScheduleLine."Document Line No.");
        ProdOrder.INIT;
        ProdOrder.Status := ProdOrderStatus;
        ProdOrder."No." := '';
        ProdOrder.INSERT(TRUE);
        
        ProdOrder."Starting Date" := WORKDATE;
        ProdOrder."Creation Date" := WORKDATE;
        ProdOrder."Due Date" := ScheduleLine."Prod. Due Date";
        //ProdOrder."Ending Date" := SalesLine."Shipment Date"-1;
        ProdOrder."Ending Date" := ScheduleLine."Prod. Due Date";
        ProdOrder."Low-Level Code" := 1;
        ProdOrder."Gen. Bus. Posting Group" := SalesLine."Gen. Bus. Posting Group";
        IF OrderType = OrderType::ProjectOrder THEN BEGIN
          ProdOrder."Source Type" := ProdOrder."Source Type"::"Sales Header";
          ProdOrder.VALIDATE("Source No.",ScheduleLine."Document No.");
          //Added by Vishnu Priya on 23-05-2020
          IF (ProdOrder."Source No." <> '') AND (ProdOrder.Quantity <> 0) THEN BEGIN
            IF Items.GET(ProdOrder."Source No.") THEN BEGIN
            ProdOrder.Itm_card_No_of_Units := Items."No.of Units";
            ProdOrder.Itm_Card_ttl_units := ProdOrder.Quantity * Items."No.of Units";
            END;
          END;
          //Added by Vishnu Priya on 23-05-2020
        END ELSE BEGIN
          ProdOrder."Source Type" := ProdOrder."Source Type"::Item;
          ProdOrder.VALIDATE("Source No.",ScheduleLine."No.");
          Item.RESET;
          Item.SETFILTER(Item."No.",ScheduleLine."No.");
          IF Item.FINDFIRST THEN          //pranavi on 13-10-2015
            ProdOrder.VALIDATE(Description,Item.Description)
          ELSE
            ProdOrder.VALIDATE(Description,ScheduleLine.Description);
          ManufSetup.GET;
          ProdOrder."Location Code" := ManufSetup."Production Location";
          ProdOrder."Bin Code" := ScheduleLine."Bin Code";
          ProdOrder."Sales Order No." := ScheduleLine."Document No.";
          ProdOrder."Sales Order Line No." := ScheduleLine."Document Line No.";
          ProdOrder."Schedule Line No." := ScheduleLine."Line No.";
          ScheduleLine.CALCFIELDS(ScheduleLine."Reserved Qty. (Base)");
          //ProdOrder.Quantity :=  SalesLine."Outstanding Qty. (Base)" - SalesLine."Reserved Qty. (Base)";
            ProdOrder.Quantity := QtyParam;
            //Added by Vishnu Priya on 23-05-2020
          IF (ProdOrder."Source No." <> '') AND (ProdOrder.Quantity <> 0) THEN BEGIN
            IF Items.GET(ProdOrder."Source No.") THEN BEGIN
            ProdOrder.Itm_card_No_of_Units := Items."No.of Units";
            ProdOrder.Itm_Card_ttl_units := ProdOrder.Quantity * Items."No.of Units";
            END;
          END;
          //Added by Vishnu Priya on 23-05-2020
            IF DisProductionStartDate THEN BEGIN
              ProdOrder."Prod Start date" := TODAY;
              ProdOrder."Planned Dispatch Date" := CALCDATE('1M',TODAY);
            END;
        END;
        ProdOrder.Refreshdate := 0D;
        ProdOrder.MODIFY;
        
        ProdOrder.SETRANGE("No.",ProdOrder."No.");
        CreateProdOrderLines.SetScheduleLine(ScheduleLine);
        CreateProdOrderLines.CopySchdl(ProdOrder,1,ScheduleLine."Variant Code",FALSE);
        
        SOProdOrderDetails.INIT;
        SOProdOrderDetails.Type := SOProdOrderDetails.Type :: "Prod. Order";
        SOProdOrderDetails."Sales Order No." := ScheduleLine."Document No.";
        SOProdOrderDetails."Sales Order Line No." := ScheduleLine."Document Line No.";
        SOProdOrderDetails."Schedule Line No." := ScheduleLine."Line No.";
        SOProdOrderDetails."No." := ProdOrder."No.";
        SOProdOrderDetails.Quantity := 1;
        SOProdOrderDetails.Status := SOProdOrderDetails.Status ::Released;
        SOProdOrderDetails.INSERT;
        
        IF ProdOrder."Source Type" = ProdOrder."Source Type"::Item THEN BEGIN
          ProdOrderLine.SETRANGE(Status,ProdOrder.Status);
          ProdOrderLine.SETRANGE("Prod. Order No.",ProdOrder."No.");
        
          IF ProdOrderLine.FINDFIRST THEN BEGIN
            CLEAR(ReservMgt);
            ScheduleLine.CALCFIELDS("Reserved Qty. (Base)");
            IF ProdOrderLine."Remaining Qty. (Base)" > (ScheduleLine."Outstanding Qty.(Base)" - ScheduleLine."Reserved Qty. (Base)") THEN
              ReservQty := (ScheduleLine."Outstanding Qty.(Base)" - ScheduleLine."Reserved Qty. (Base)")
            ELSE
              ReservQty := ProdOrderLine."Remaining Qty. (Base)";
            /*
            ReservMgt.SetProdOrderLine(ProdOrderLine);
            ReservEntry."Source Type" :=
              DATABASE::"Sales Line";
            ReserveSalesLine.SetBinding(ReservEntry.Binding::"Order-to-Order");
            ReserveSalesLine.CreateReservationSetFrom(
              DATABASE::"Prod. Order Line",
              ProdOrderLine.Status,
              ProdOrderLine."Prod. Order No.",
              '',
              ProdOrderLine."Line No.",0,
              ProdOrderLine."Variant Code",
              ProdOrderLine."Location Code",'','',
              ProdOrderLine."Qty. per Unit of Measure");
            ReserveSalesLine.CreateReservation(
              SalesLine,
              ProdOrderLine.Description,
              ProdOrderLine."Ending Date",
              ReservQty,
              '','');
            IF SalesLine.Reserve = SalesLine.Reserve::Never THEN
              SalesLine.Reserve := SalesLine.Reserve::Optional;
            SalesLine.MODIFY;
            */
            ProdOrderLine.MODIFY;
            IF OrderType = OrderType::ItemOrder THEN
              CreateProdOrderLines.CopyDimFromScheduleLine(ScheduleLine,ProdOrderLine);
          END;
        END;
        
        IF ProdOrder.Status = ProdOrder.Status::Released THEN
          ProdOrderStatusMgt.FlushProdOrder(ProdOrder,ProdOrder.Status,WORKDATE);
        /*//B2BJM  requested by renuka madam
        IF NOT HideValidationDialog THEN
          MESSAGE(
            Text000,
            ProdOrder.Status,ProdOrder."No.");
        *///B2BJM
        
        //refresh code by pranavi on 27-02-15
        /*
        ProdOrder.TESTFIELD("Location Code");
        ProdOrder.SETRANGE(Status,ProdOrder.Status);
        ProdOrder.SETRANGE("No.",ProdOrder."No.");
        REPORT.RUNMODAL(REPORT::"Refresh Production Order",FALSE,FALSE,ProdOrder);
        
        //B2B-KNR  BEGIN
        ProdOrderLine.SETRANGE(ProdOrderLine.Status,ProdOrder.Status);
        ProdOrderLine.SETRANGE("Prod. Order No.",ProdOrder."No.");
        IF "Prod.OrdLine".FINDSET THEN
          REPEAT
           RoutingHeader.SETRANGE("No.","Prod.OrdLine"."Routing No.");
           IF RoutingHeader.FINDFIRST THEN BEGIN
             RoutingHeader.Status := RoutingHeader.Status :: "Under Development";
             RoutingHeader.MODIFY;
           END;
            RoutingLine.SETRANGE("Routing No.","Prod.OrdLine"."Routing No.");
            IF RoutingLine.FINDSET THEN
              REPEAT
        
                        RoutingLine."Lot Size" := 0;
                RoutingLine.MODIFY;
              UNTIL RoutingLine.NEXT = 0;
           RoutingHeader.RESET;
           RoutingHeader.SETRANGE("No.","Prod.OrdLine"."Routing No.");
           IF RoutingHeader.FINDFIRST THEN BEGIN
             RoutingHeader.Status := RoutingHeader.Status :: Certified;
             RoutingHeader.MODIFY;
           END;
          UNTIL "Prod.OrdLine".NEXT = 0;
        //  CODEUNIT.RUN(60024);
        //B2B-KNR  END
        //refreshtime.refresh("No.");
        
        // PRM integration
         {IF "Location Code"='PROD' THEN
            PRMintegrate.ProdOrdRefresh("No.");}
        
        // PRM integration
        
        //refresh end
        */
        IF (ProdOrder.Status=ProdOrder.Status::Released)AND(ProdOrder."Location Code"='PROD') THEN
        BEGIN
          prmRefresh.ProdOrdRefresh(ProdOrder."No.");
        END;

    end;

    [LineStart(55554)]
    procedure ProdStartDate(DisplayDate : Boolean);
    begin
        DisProductionStartDate := DisplayDate;
    end;
}

