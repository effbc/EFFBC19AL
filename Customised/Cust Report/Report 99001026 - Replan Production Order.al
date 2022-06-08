report 99001026 "Replan Production Order"
{
    // version NAVW19.00.00.47444

    CaptionML = ENU = 'Replan Production Order',
                ENN = 'Replan Production Order';
    ProcessingOnly = true;

    dataset
    {
        dataitem("Production Order"; "Production Order")
        {
            DataItemTableView = SORTING(Status, No.) WHERE(Status = FILTER(.. Released));
            dataitem("Prod. Order Line"; "Prod. Order Line")
            {
                DataItemLink = Status = FIELD(Status), Prod. Order No.=FIELD(No.);
                DataItemTableView = SORTING(Status, Prod. Order No., Planning Level Code);
                dataitem("Prod. Order Routing Line"; "Prod. Order Routing Line")
                {
                    DataItemLink = Status = FIELD(Status), Prod. Order No.=FIELD(Prod. Order No.),Routing No.=FIELD(Routing No.);
                    DataItemTableView = SORTING(Status,Prod. Order No.,Routing Reference No.,Routing No.,Operation No.);

                    trigger OnAfterGetRecord();
                    var
                        ProdOrderLine : Record "Prod. Order Line";
                        CalcProdOrderRtngLine : Codeunit "Calculate Routing Line";
                        PlanLevel : Integer;
                    begin
                        IF "Routing Status" = "Routing Status"::Finished THEN
                          CurrReport.SKIP;

                        PlanLevel := "Prod. Order Line"."Planning Level Code";

                        ProdOrderLine.SETCURRENTKEY(Status,"Prod. Order No.","Routing No.");
                        ProdOrderLine.SETRANGE(Status,Status);
                        ProdOrderLine.SETRANGE("Prod. Order No.","Prod. Order No.");
                        ProdOrderLine.SETRANGE("Routing No.","Routing No.");
                        IF ProdOrderLine.FIND('-') THEN
                          REPEAT
                            IF PlanLevel < ProdOrderLine."Planning Level Code" THEN
                              PlanLevel := ProdOrderLine."Planning Level Code";
                          UNTIL (ProdOrderLine.NEXT = 0) OR (PlanLevel > "Prod. Order Line"."Planning Level Code");

                        ProdOrderLine.RESET;

                        IF PlanLevel = "Prod. Order Line"."Planning Level Code" THEN BEGIN
                          IF Direction = Direction::Forward THEN BEGIN
                            "Starting Date" := "Prod. Order Line"."Starting Date";
                            "Starting Time" := "Prod. Order Line"."Starting Time";
                            MODIFY;
                          END ELSE BEGIN
                            "Ending Date" := "Prod. Order Line"."Ending Date";
                            "Ending Time" := "Prod. Order Line"."Ending Time";
                            MODIFY;
                          END;
                          CalcProdOrderRtngLine.CalculateRoutingLine("Prod. Order Routing Line",Direction,TRUE);
                        END;
                        MODIFY;
                    end;

                    trigger OnPostDataItem();
                    begin
                        CalcProdOrder.CalculateProdOrderDates("Prod. Order Line",TRUE);
                    end;

                    trigger OnPreDataItem();
                    begin
                        IF Direction = Direction::Forward THEN
                          SETCURRENTKEY(Status,"Prod. Order No.","Routing Reference No.","Routing No.","Sequence No. (Forward)")
                        ELSE
                          SETCURRENTKEY(Status,"Prod. Order No.","Routing Reference No.","Routing No.","Sequence No. (Backward)");
                    end;
                }
                dataitem("Prod. Order Component";"Prod. Order Component")
                {
                    DataItemLink = Status=FIELD(Status),Prod. Order No.=FIELD(Prod. Order No.),Prod. Order Line No.=FIELD(Line No.);
                    DataItemTableView = SORTING(Status,Prod. Order No.,Prod. Order Line No.,Line No.);

                    trigger OnAfterGetRecord();
                    var
                        SKU : Record "Stockkeeping Unit" temporary;
                        StockkeepingUnit : Record "Stockkeeping Unit";
                        CompItem : Record Item;
                        MainProdOrder : Record "Production Order";
                        ProdOrder : Record "Production Order";
                        ProdOrderLine : Record "Prod. Order Line";
                        AvailabilityMgt : Codeunit "Available Management";
                        CreateProdOrderLines : Codeunit "Create Prod. Order Lines";
                        GetPlanningParameters : Codeunit "Planning-Get Parameters";
                        InvtProfileOffsetting : Codeunit "Inventory Profile Offsetting";
                        ReqQty : Decimal;
                        WithInventory : Boolean;
                    begin
                        BlockDynamicTracking(TRUE);
                        VALIDATE("Routing Link Code");
                        MODIFY;

                        CALCFIELDS("Reserved Qty. (Base)");
                        IF "Reserved Qty. (Base)" = "Remaining Qty. (Base)" THEN
                          EXIT;

                        CompItem.GET("Item No.");

                        IF CalcMethod = CalcMethod::"No Levels" THEN
                          CurrReport.BREAK;

                        CompItem.SETRANGE("Variant Filter","Variant Code");
                        CompItem.SETRANGE("Location Filter","Location Code");
                        CompItem.SETRANGE("Date Filter",0D,"Due Date");

                        IF StockkeepingUnit.GET("Location Code","Item No.","Variant Code") THEN
                          WithInventory := StockkeepingUnit."Include Inventory"
                        ELSE
                          WithInventory := CompItem."Include Inventory";

                        IF WithInventory THEN
                          CompItem.CALCFIELDS(Inventory);

                        AvailabilityMgt.ExpectedQtyOnHand(CompItem,TRUE,0,ReqQty,"Due Date");

                        IF ReqQty >= 0 THEN
                          CurrReport.SKIP;

                        ReqQty := ABS(ReqQty);
                        IF ReqQty > "Remaining Qty. (Base)" THEN
                          ReqQty := "Remaining Qty. (Base)";

                        GetPlanningParameters.AtSKU(SKU,"Item No.","Variant Code","Location Code");
                        ReqQty += InvtProfileOffsetting.AdjustReorderQty(ReqQty,SKU,0,0);

                        IF ReqQty = 0 THEN
                          CurrReport.SKIP;

                        MainProdOrder.GET("Production Order".Status,"Prod. Order No.");

                        IF CompItem."Replenishment System" = CompItem."Replenishment System"::"Prod. Order" THEN BEGIN
                          ProdOrder.Status := MainProdOrder.Status;
                          ProdOrder."Replan Ref. No." := MainProdOrder."Replan Ref. No.";
                          ProdOrder."Replan Ref. Status" := MainProdOrder."Replan Ref. Status";
                          ProdOrder.INSERT(TRUE);

                          ProdOrder."Starting Date" := WORKDATE;
                          ProdOrder."Creation Date" := WORKDATE;
                          ProdOrder."Starting Time" := MfgSetup."Normal Starting Time";
                          ProdOrder."Ending Time" := MfgSetup."Normal Ending Time";
                          ProdOrder."Due Date" := "Due Date";
                          ProdOrder."Ending Date" := "Due Date";
                          ProdOrder."Low-Level Code" := MainProdOrder."Low-Level Code" + 1;
                          ProdOrder."Source Type" := ProdOrder."Source Type"::Item;
                          ProdOrder.VALIDATE("Source No.","Item No.");
                          ProdOrder.VALIDATE(Quantity,ReqQty);
                          ProdOrder."Location Code" := "Location Code";
                          ProdOrder.MODIFY;
                          CreateProdOrderLines.Copy(ProdOrder,1,"Variant Code",TRUE,FALSE);
                          //added by vijaya 21-08-2018 for Alternate PCB Replacement
                          ProdOrderLine.SETRANGE(Status,ProdOrder.Status);
                          ProdOrderLine.SETRANGE("Prod. Order No.",ProdOrder."No.");
                          ProdOrderLine.FIND('-');

                          MODIFY;
                          ProdOrderLine.MODIFY;

                          ProdOrderLine.SETRANGE(Status,Status);
                          ProdOrderLine.SETRANGE("Prod. Order No.",ProdOrder."No.");

                          IF ProdOrderLine.FIND('-') THEN
                            REPEAT
                              CalcProdOrder.BlockDynamicTracking(TRUE);
                              CalcProdOrder.Recalculate(ProdOrderLine,1,TRUE);
                            UNTIL ProdOrderLine.NEXT = 0;

                          MODIFY;
                        END;
                        ReservMgt.SetProdOrderComponent("Prod. Order Component");
                        ReservMgt.AutoTrack("Remaining Qty. (Base)");
                    end;

                    trigger OnPreDataItem();
                    begin
                        SETFILTER("Item No.",'<>%1','');
                    end;
                }

                trigger OnAfterGetRecord();
                var
                    ProdOrderRouteMgt : Codeunit "Prod. Order Route Management";
                begin
                    BlockDynamicTracking(TRUE);
                    IF "Routing No." = '' THEN BEGIN
                      CalcProdOrder.BlockDynamicTracking(TRUE);
                      CalcProdOrder.Recalculate("Prod. Order Line",Direction,TRUE);

                      MODIFY;
                    END ELSE
                      ProdOrderRouteMgt.Calculate("Prod. Order Line");
                end;
            }

            trigger OnAfterGetRecord();
            begin
                IF (CalcMethod = CalcMethod::"One level") AND NOT First THEN
                  CurrReport.BREAK;

                Window.UPDATE(1,Status);
                Window.UPDATE(2,"No.");

                IF "Replan Ref. No." = '' THEN BEGIN
                  "Replan Ref. No." := "No.";
                  "Replan Ref. Status" := Status;
                  MODIFY;
                END;
                IF First THEN BEGIN
                  RESET;
                  SETRANGE("Replan Ref. No.","Replan Ref. No.");
                  SETRANGE("Replan Ref. Status","Replan Ref. Status");
                  First := FALSE;
                  IF CalcMethod <> CalcMethod::"No Levels" THEN
                    DeleteProdOrders("Production Order","Low-Level Code",CalcMethod = CalcMethod::"All levels");
                END;

                DeleteUnreservedLowLevelProdOrderLines("Production Order");

                CreateProdOrderLines.CheckStructure(
                  Status,"No.",Direction,TRUE,TRUE);
            end;

            trigger OnPreDataItem();
            begin
                First := TRUE;
                MfgSetup.GET;

                Window.OPEN(
                  Text000 +
                  Text001 +
                  Text002);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    CaptionML = ENU='Options',
                                ENN='Options';
                    field(Direction;Direction)
                    {
                        CaptionML = ENU='Scheduling Direction',
                                    ENN='Scheduling Direction';
                        OptionCaptionML = ENU='Forward,Back',
                                          ENN='Forward,Back';
                    }
                    field(CalcMethod;CalcMethod)
                    {
                        CaptionML = ENU='Plan',
                                    ENN='Plan';
                        OptionCaptionML = ENU='No Levels,One Level,All Levels',
                                          ENN='No Levels,One Level,All Levels';
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport();
    begin
        Direction := Direction::Backward;
    end;

    trigger OnPreReport();
    begin
        MfgSetup.GET;
    end;

    var
        Text000 : TextConst ENU='Replanning Production Orders...\\',ENN='Replanning Production Orders...\\';
        Text001 : TextConst ENU='Status         #1##########\',ENN='Status         #1##########\';
        Text002 : TextConst ENU='No.            #2##########',ENN='No.            #2##########';
        MfgSetup : Record "Manufacturing Setup";
        CalcProdOrder : Codeunit "Calculate Prod. Order";
        CreateProdOrderLines : Codeunit "Create Prod. Order Lines";
        ReservMgt : Codeunit "Reservation Management";
        Window : Dialog;
        Direction : Option Forward,Backward;
        CalcMethod : Option "No Levels","One level","All levels";
        First : Boolean;

    (23066)]
    procedure InitializeRequest(NewDirection : Option;NewCalcMethod : Option);
    begin
        Direction := NewDirection;
        CalcMethod := NewCalcMethod;
    end;

    (23070)]
    local procedure DeleteProdOrders(ProdOrder : Record "Production Order";LowLevelCode : Integer;AllLevels : Boolean);
    var
        ProdOrderComponent : Record "Prod. Order Component";
    begin
        IF LowLevelCode > 99 THEN
          EXIT;

        ProdOrder.SETCURRENTKEY("Low-Level Code");
        ProdOrder.SETRANGE("Replan Ref. No.",ProdOrder."Replan Ref. No.");
        ProdOrder.SETRANGE("Replan Ref. Status",ProdOrder."Replan Ref. Status");
        ProdOrder.SETRANGE("Low-Level Code",LowLevelCode + 1);

        ProdOrderComponent.SETRANGE(Status,ProdOrder.Status);
        ProdOrderComponent.SETRANGE("Prod. Order No.",ProdOrder."No.");
        IF ProdOrderComponent.FINDSET THEN
          REPEAT
            ProdOrder.SETRANGE("Source No.",ProdOrderComponent."Item No.");
            IF ProdOrder.FINDFIRST THEN BEGIN
              IF AllLevels THEN
                DeleteProdOrders(ProdOrder,LowLevelCode + 1,AllLevels);
              ProdOrder.DELETE(TRUE);
            END;
          UNTIL ProdOrderComponent.NEXT = 0;
    end;

    (23091)]
    local procedure DeleteUnreservedLowLevelProdOrderLines(ProdOrder : Record "Production Order");
    var
        ProdOrderLine : Record "Prod. Order Line";
        ExtReservedQtyBase : Decimal;
    begin
        WITH ProdOrderLine DO BEGIN
          LOCKTABLE;
          SETRANGE(Status,ProdOrder.Status);
          SETRANGE("Prod. Order No.",ProdOrder."No.");
          IF FIND('-') THEN
            REPEAT
              IF "Planning Level Code" > 0 THEN BEGIN
                CALCFIELDS("Reserved Qty. (Base)");
                IF "Reserved Qty. (Base)" = 0 THEN
                  DELETE(TRUE)
                ELSE BEGIN
                  ExtReservedQtyBase := CalcQtyReservedFromExternalDemand(ProdOrderLine,DATABASE::"Prod. Order Component");
                  VALIDATE("Quantity (Base)",ExtReservedQtyBase);
                  IF "Quantity (Base)" > 0 THEN
                    MODIFY(TRUE)
                  ELSE
                    DELETE(TRUE);
                END;
              END;
            UNTIL NEXT = 0;
        END;
    end;

    (23114)]
    local procedure CalcQtyReservedFromExternalDemand(ProdOrderLine : Record "Prod. Order Line";SourceType : Integer) ReservedQtyBase : Decimal;
    var
        ReservEntry : Record "Reservation Entry";
        ReservEntryFrom : Record "Reservation Entry";
        ProdOrderLineReserve : Codeunit "Prod. Order Line-Reserve";
    begin
        ReservedQtyBase := 0;

        WITH ReservEntry DO BEGIN
          SETCURRENTKEY("Source ID","Source Ref. No.","Source Type","Source Subtype","Source Batch Name");
          SETRANGE("Reservation Status","Reservation Status"::Reservation);
          ProdOrderLineReserve.FilterReservFor(ReservEntry,ProdOrderLine);

          IF FINDSET THEN
            REPEAT
              ReservEntryFrom.GET("Entry No.",NOT Positive);
              IF (ReservEntryFrom."Source Type" <> SourceType) OR (ReservEntryFrom."Source ID" <> ProdOrderLine."Prod. Order No.") OR
                 (ReservEntryFrom."Source Subtype" <> ProdOrderLine.Status)
              THEN
                ReservedQtyBase += "Quantity (Base)";
            UNTIL NEXT = 0;
        END;
    end;
}

