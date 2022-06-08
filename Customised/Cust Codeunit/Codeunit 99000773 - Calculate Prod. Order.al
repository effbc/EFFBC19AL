codeunit 99000773 "Calculate Prod. Order"
{
    // version NAVW19.00.00.51476

    Permissions = TableData Item = r,
                  TableData "Prod. Order Line" = rimd,
                  TableData "Prod. Order Component" = rimd,
                  TableData "Manufacturing Setup" = r,
                  TableData "Production BOM Line" = rimd,
                  TableData "Production BOM Comment Line" = rimd,
                  TableData "Production Order" = rimd,
                  TableData "Prod. Order Comp. Cmt Line" = rimd;

    trigger OnRun();
    begin
    end;

    var
        Text000: TextConst ENU = 'BOM phantom structure for %1 is higher than 50 levels.', ENN = 'BOM phantom structure for %1 is higher than 50 levels.';
        Text001: TextConst ENU = '%1 %2 %3 can not be calculated, if at least one %4 has been posted.', ENN = '%1 %2 %3 can not be calculated, if at least one %4 has been posted.';
        Text002: TextConst ENU = 'Operation No. %1 cannot follow another operation in the routing of this Prod. Order Line', ENN = 'Operation No. %1 cannot follow another operation in the routing of this Prod. Order Line';
        Text003: TextConst ENU = 'Operation No. %1 cannot precede another operation in the routing of this Prod. Order Line', ENN = 'Operation No. %1 cannot precede another operation in the routing of this Prod. Order Line';
        Item: Record Item;
        Location: Record Location;
        SKU: Record "Stockkeeping Unit";
        ProdOrder: Record "Production Order";
        ProdOrderLine: Record "Prod. Order Line";
        ProdOrderComp: Record "Prod. Order Component";
        ProdOrderRtngLine2: Record "Prod. Order Routing Line";
        ProdOrderBOMCompComment: Record "Prod. Order Comp. Cmt Line";
        BomComponent: array[99] of Record "Production BOM Line";
        ProdBOMCompComment: Record "Production BOM Comment Line";
        UOMMgt: Codeunit "Unit of Measure Management";
        CostCalcMgt: Codeunit "Cost Calculation Management";
        VersionMgt: Codeunit VersionManagement;
        ProdOrderRouteMgt: Codeunit "Prod. Order Route Management";
        GetPlanningParameters: Codeunit "Planning-Get Parameters";
        LeadTimeMgt: Codeunit "Lead-Time Management";
        CalendarMgt: Codeunit CalendarManagement;
        WMSManagement: Codeunit "WMS Management";
        NextProdOrderCompLineNo: Integer;
        Blocked: Boolean;
        ProdOrderModify: Boolean;
        ProdOrderStDate: Record "Production Order";
        AlternatePCB_BOM: Boolean;
        Planned_day: Date;
        RPO: Record "Production Order";

    (52113)]
    local procedure TransferRouting();
    var
        RtngHeader: Record "Routing Header";
        RtngLine: Record "Routing Line";
        ProdOrderRtngLine: Record "Prod. Order Routing Line";
        WorkCenter: Record "Work Center";
        MachineCenter: Record "Machine Center";
    begin
        IF ProdOrderLine."Routing No." = '' THEN
            EXIT;

        RtngHeader.GET(ProdOrderLine."Routing No.");
        //RtngHeader.GET(ProdOrder."Routing No."); //added by sujani 24 Oct 19 for Activities tracking

        ProdOrderRtngLine.SETRANGE(Status, ProdOrderLine.Status);
        ProdOrderRtngLine.SETRANGE("Prod. Order No.", ProdOrderLine."Prod. Order No.");
        ProdOrderRtngLine.SETRANGE("Routing Reference No.", ProdOrderLine."Routing Reference No.");
        ProdOrderRtngLine.SETRANGE("Routing No.", ProdOrderLine."Routing No.");
        IF ProdOrderRtngLine.FINDFIRST THEN
            EXIT;

        RPO.RESET;
        RPO.SETRANGE("No.", ProdOrderLine."Prod. Order No.");
        RPO.SETFILTER("Prod Start date", '<>%1', 0D);
        IF RPO.FINDSET THEN
            Planned_day := RPO."Prod Start date";


        RtngLine.SETRANGE("Routing No.", ProdOrderLine."Routing No.");
        RtngLine.SETRANGE("Version Code", ProdOrderLine."Routing Version Code");
        IF RtngLine.FINDFIRST THEN
            REPEAT

                RtngLine.TESTFIELD(Recalculate, FALSE);
                ProdOrderRtngLine.INIT;
                ProdOrderRtngLine.Status := ProdOrderLine.Status;
                ProdOrderRtngLine."Prod. Order No." := ProdOrderLine."Prod. Order No.";
                ProdOrderRtngLine."Routing Reference No." := ProdOrderLine."Routing Reference No.";
                ProdOrderRtngLine."Routing No." := ProdOrderLine."Routing No.";
                ProdOrderRtngLine."Operation No." := RtngLine."Operation No.";
                //B2B
                ProdOrderRtngLine."Operation Description" := RtngLine."Operation Description";
                ProdOrderRtngLine."Item No." := ProdOrderLine."Item No.";
                ProdOrderRtngLine."Item Description" := ProdOrderLine.Description;
                ProdOrderRtngLine."QAS/MPR" := RtngLine."QAS/MPR";
                //B2B
                ProdOrderRtngLine."Next Operation No." := RtngLine."Next Operation No.";
                ProdOrderRtngLine."Previous Operation No." := RtngLine."Previous Operation No.";
                ProdOrderRtngLine.Type := RtngLine.Type;
                ProdOrderRtngLine."No." := RtngLine."No.";
                ProdOrderRtngLine.FillDefaultLocationAndBins;
                ProdOrderRtngLine."Work Center No." := RtngLine."Work Center No.";
                ProdOrderRtngLine."Work Center Group Code" := RtngLine."Work Center Group Code";
                ProdOrderRtngLine.Description := RtngLine.Description;
                ProdOrderRtngLine."Setup Time" := RtngLine."Setup Time";
                ProdOrderRtngLine."Run Time" := RtngLine."Run Time";
                ProdOrderRtngLine."Wait Time" := RtngLine."Wait Time";
                ProdOrderRtngLine."Move Time" := RtngLine."Move Time";
                ProdOrderRtngLine."Fixed Scrap Quantity" := RtngLine."Fixed Scrap Quantity";
                ProdOrderRtngLine."Lot Size" := RtngLine."Lot Size";
                ProdOrderRtngLine."Scrap Factor %" := RtngLine."Scrap Factor %";
                ProdOrderRtngLine."Minimum Process Time" := RtngLine."Minimum Process Time";
                ProdOrderRtngLine."Maximum Process Time" := RtngLine."Maximum Process Time";
                ProdOrderRtngLine."Concurrent Capacities" := RtngLine."Concurrent Capacities";
                IF ProdOrderRtngLine."Concurrent Capacities" = 0 THEN
                    ProdOrderRtngLine."Concurrent Capacities" := 1;
                ProdOrderRtngLine."Send-Ahead Quantity" := RtngLine."Send-Ahead Quantity";
                ProdOrderRtngLine."Setup Time Unit of Meas. Code" := RtngLine."Setup Time Unit of Meas. Code";
                ProdOrderRtngLine."Run Time Unit of Meas. Code" := RtngLine."Run Time Unit of Meas. Code";
                ProdOrderRtngLine."Wait Time Unit of Meas. Code" := RtngLine."Wait Time Unit of Meas. Code";
                ProdOrderRtngLine."Move Time Unit of Meas. Code" := RtngLine."Move Time Unit of Meas. Code";
                ProdOrderRtngLine."Routing Link Code" := RtngLine."Routing Link Code";
                ProdOrderRtngLine."Standard Task Code" := RtngLine."Standard Task Code";
                ProdOrderRtngLine."Sequence No. (Forward)" := RtngLine."Sequence No. (Forward)";
                ProdOrderRtngLine."Sequence No. (Backward)" := RtngLine."Sequence No. (Backward)";
                ProdOrderRtngLine."Fixed Scrap Qty. (Accum.)" := RtngLine."Fixed Scrap Qty. (Accum.)";
                ProdOrderRtngLine."Scrap Factor % (Accumulated)" := RtngLine."Scrap Factor % (Accumulated)";
                ProdOrderRtngLine."Unit Cost per" := RtngLine."Unit Cost per";
                //B2B
                //QC
                ProdOrderRtngLine."Sub Assembly" := RtngLine."Sub Assembly";
                ProdOrderRtngLine."Sub Assembly Description" := RtngLine."Sub Assembly Description";
                ProdOrderRtngLine."QC Enabled" := RtngLine."QC Enabled";
                ProdOrderRtngLine."Spec Id" := RtngLine."Spec Id";
                ProdOrderRtngLine.Quantity := RtngLine."Qty. Produced" * ProdOrderLine.Quantity;
                ProdOrderRtngLine."Qty.To Produce" := RtngLine."Qty. Produced" * ProdOrderLine.Quantity;
                ProdOrderRtngLine."Sub Assembly Unit Of Meas.Code" := RtngLine."Sub Assembly Unit of Meas.Code";
                //QC
                //B2B

                CostCalcMgt.RoutingCostPerUnit(
                  ProdOrderRtngLine.Type,
                  ProdOrderRtngLine."No.",
                  ProdOrderRtngLine."Direct Unit Cost",
                  ProdOrderRtngLine."Indirect Cost %",
                  ProdOrderRtngLine."Overhead Rate",
                  ProdOrderRtngLine."Unit Cost per",
                  ProdOrderRtngLine."Unit Cost Calculation");
                CASE ProdOrderRtngLine.Type OF
                    ProdOrderRtngLine.Type::"Work Center":
                        BEGIN
                            WorkCenter.GET(RtngLine."Work Center No.");
                            ProdOrderRtngLine."Flushing Method" := WorkCenter."Flushing Method";
                        END;
                    ProdOrderRtngLine.Type::"Machine Center":
                        BEGIN
                            MachineCenter.GET(ProdOrderRtngLine."No.");
                            ProdOrderRtngLine."Flushing Method" := MachineCenter."Flushing Method";
                        END;
                END;
                ProdOrderRtngLine.VALIDATE("Direct Unit Cost");
                ProdOrderRtngLine."Starting Time" := ProdOrderLine."Starting Time";
                ProdOrderRtngLine."Starting Date" := ProdOrderLine."Starting Date";
                ProdOrderRtngLine."Ending Time" := ProdOrderLine."Ending Time";
                ProdOrderRtngLine."Ending Date" := ProdOrderLine."Ending Date";
                IF ((FORMAT(RtngLine.Start_Day) <> '0D') AND (Planned_day <> 0D)) THEN
                    ProdOrderRtngLine.PlannedStartDate := CALCDATE(RtngLine.Start_Day, Planned_day);
                //  ELSE
                // ProdOrderRtngLine.PlannedStartDate := Planned_day;
                ProdOrderRtngLine.UpdateDatetime;
                ProdOrderRtngLine.INSERT;
                TransferTaskInfo(ProdOrderRtngLine, ProdOrderLine."Routing Version Code");
            UNTIL RtngLine.NEXT = 0;
    end;

    (52230)]
    procedure TransferTaskInfo(var FromProdOrderRtngLine: Record "Prod. Order Routing Line"; VersionCode: Code[20]);
    var
        RtngLineTool: Record "Routing Tool";
        RtngLinePersonnel: Record "Routing Personnel";
        RtngLineQltyMeas: Record "Routing Quality Measure";
        RtngComment: Record "Routing Comment Line";
        ProdOrderRoutTool: Record "Prod. Order Routing Tool";
        ProdOrderRtngPersonnel: Record "Prod. Order Routing Personnel";
        ProdOrderRtngQltyMeas: Record "Prod. Order Rtng Qlty Meas.";
        ProdOrderRtngComment: Record "Prod. Order Rtng Comment Line";
    begin
        RtngLineTool.SETRANGE("Routing No.", FromProdOrderRtngLine."Routing No.");
        RtngLineTool.SETRANGE("Operation No.", FromProdOrderRtngLine."Operation No.");
        RtngLineTool.SETRANGE("Version Code", VersionCode);
        IF RtngLineTool.FINDFIRST THEN
            REPEAT
                ProdOrderRoutTool.TRANSFERFIELDS(RtngLineTool);
                ProdOrderRoutTool.Status := FromProdOrderRtngLine.Status;
                ProdOrderRoutTool."Prod. Order No." := FromProdOrderRtngLine."Prod. Order No.";
                ProdOrderRoutTool."Routing Reference No." := FromProdOrderRtngLine."Routing Reference No.";
                ProdOrderRoutTool.INSERT;
            UNTIL RtngLineTool.NEXT = 0;

        RtngLinePersonnel.SETRANGE("Routing No.", FromProdOrderRtngLine."Routing No.");
        RtngLinePersonnel.SETRANGE("Operation No.", FromProdOrderRtngLine."Operation No.");
        RtngLinePersonnel.SETRANGE("Version Code", VersionCode);
        IF RtngLinePersonnel.FINDFIRST THEN
            REPEAT
                ProdOrderRtngPersonnel.TRANSFERFIELDS(RtngLinePersonnel);
                ProdOrderRtngPersonnel.Status := FromProdOrderRtngLine.Status;
                ProdOrderRtngPersonnel."Prod. Order No." := FromProdOrderRtngLine."Prod. Order No.";
                ProdOrderRtngPersonnel."Routing Reference No." := FromProdOrderRtngLine."Routing Reference No.";
                ProdOrderRtngPersonnel.INSERT;
            UNTIL RtngLinePersonnel.NEXT = 0;

        RtngLineQltyMeas.SETRANGE("Routing No.", FromProdOrderRtngLine."Routing No.");
        RtngLineQltyMeas.SETRANGE("Operation No.", FromProdOrderRtngLine."Operation No.");
        RtngLineQltyMeas.SETRANGE("Version Code", VersionCode);
        IF RtngLineQltyMeas.FINDFIRST THEN
            REPEAT
                ProdOrderRtngQltyMeas.TRANSFERFIELDS(RtngLineQltyMeas);
                ProdOrderRtngQltyMeas.Status := FromProdOrderRtngLine.Status;
                ProdOrderRtngQltyMeas."Prod. Order No." := FromProdOrderRtngLine."Prod. Order No.";
                ProdOrderRtngQltyMeas."Routing Reference No." := FromProdOrderRtngLine."Routing Reference No.";
                ProdOrderRtngQltyMeas.INSERT;
            UNTIL RtngLineQltyMeas.NEXT = 0;

        RtngComment.SETRANGE("Routing No.", FromProdOrderRtngLine."Routing No.");
        RtngComment.SETRANGE("Operation No.", FromProdOrderRtngLine."Operation No.");
        RtngComment.SETRANGE("Version Code", VersionCode);
        IF RtngComment.FINDFIRST THEN
            REPEAT
                ProdOrderRtngComment.TRANSFERFIELDS(RtngComment);
                ProdOrderRtngComment.Status := FromProdOrderRtngLine.Status;
                ProdOrderRtngComment."Prod. Order No." := FromProdOrderRtngLine."Prod. Order No.";
                ProdOrderRtngComment."Routing Reference No." := FromProdOrderRtngLine."Routing Reference No.";
                ProdOrderRtngComment.INSERT;
            UNTIL RtngComment.NEXT = 0;
    end;

    (52279)]
    local procedure TransferBOM(ProdBOMNo: Code[20]; Level: Integer; LineQtyPerUOM: Decimal; ItemQtyPerUOM: Decimal): Boolean;
    var
        BOMHeader: Record "Production BOM Header";
        ProductionBOMVersion: Record "Production BOM Version";
        ReqQty: Decimal;
        ErrorOccured: Boolean;
        VersionCode: Code[20];
        Item: Record Item;
        Alt: Record "Alternate Items";
    begin
        IF ProdBOMNo = '' THEN
            EXIT;

        ProdOrderComp.LOCKTABLE;

        IF Level > 50 THEN
            ERROR(
              Text000,
              ProdBOMNo);

        BOMHeader.GET(ProdBOMNo);

        IF Level > 1 THEN
            VersionCode := VersionMgt.GetBOMVersion(ProdBOMNo, ProdOrderLine."Starting Date", TRUE)
        ELSE
            VersionCode := ProdOrderLine."Production BOM Version Code";

        IF VersionCode <> '' THEN BEGIN
            ProductionBOMVersion.GET(ProdBOMNo, VersionCode);
            ProductionBOMVersion.TESTFIELD(Status, ProductionBOMVersion.Status::Certified);
        END ELSE
            BOMHeader.TESTFIELD(Status, BOMHeader.Status::Certified);

        BomComponent[Level].SETRANGE("Production BOM No.", ProdBOMNo);
        BomComponent[Level].SETRANGE("Version Code", VersionCode);
        BomComponent[Level].SETFILTER("Starting Date", '%1|..%2', 0D, ProdOrderLine."Starting Date");
        BomComponent[Level].SETFILTER("Ending Date", '%1|%2..', 0D, ProdOrderLine."Starting Date");
        IF BomComponent[Level].FINDFIRST THEN
            REPEAT
                IF BomComponent[Level]."Routing Link Code" <> '' THEN BEGIN
                    ProdOrderRtngLine2.SETRANGE(Status, ProdOrderLine.Status);
                    ProdOrderRtngLine2.SETRANGE("Prod. Order No.", ProdOrderLine."Prod. Order No.");
                    ProdOrderRtngLine2.SETRANGE("Routing Link Code", BomComponent[Level]."Routing Link Code");
                    ProdOrderRtngLine2.FINDFIRST;
                    ReqQty :=
                      BomComponent[Level].Quantity *
                      (1 + BomComponent[Level]."Scrap %" / 100) *
                      (1 + ProdOrderRtngLine2."Scrap Factor % (Accumulated)") *
                      (1 + ProdOrderLine."Scrap %" / 100) *
                      LineQtyPerUOM /
                      ItemQtyPerUOM +
                      ProdOrderRtngLine2."Fixed Scrap Qty. (Accum.)";
                END ELSE
                    ReqQty :=
                      BomComponent[Level].Quantity *
                      (1 + BomComponent[Level]."Scrap %" / 100) *
                      (1 + ProdOrderLine."Scrap %" / 100) *
                      LineQtyPerUOM /
                      ItemQtyPerUOM;

                CASE BomComponent[Level].Type OF
                    BomComponent[Level].Type::Item:
                        TransferBOMProcessItem(Level, LineQtyPerUOM, ItemQtyPerUOM, ErrorOccured);
                    BomComponent[Level].Type::"Production BOM":
                        BEGIN
                            TransferBOM(
                              BomComponent[Level]."No.",
                              Level + 1,
                              ReqQty,
                              1);
                            BomComponent[Level].SETRANGE("Production BOM No.", ProdBOMNo);
                            IF Level > 1 THEN
                                BomComponent[Level].SETRANGE("Version Code", VersionMgt.GetBOMVersion(ProdBOMNo, ProdOrderLine."Starting Date", TRUE))
                            ELSE
                                BomComponent[Level].SETRANGE("Version Code", ProdOrderLine."Production BOM Version Code");
                            BomComponent[Level].SETFILTER("Starting Date", '%1|..%2', 0D, ProdOrderLine."Starting Date");
                            BomComponent[Level].SETFILTER("Ending Date", '%1|%2..', 0D, ProdOrderLine."Starting Date");
                        END;
                END;
            UNTIL BomComponent[Level].NEXT = 0;
        EXIT(NOT ErrorOccured);
    end;

    (52352)]
    procedure CalculateComponents();
    var
        ProdOrderComp: Record "Prod. Order Component";
    begin
        ProdOrderComp.SETRANGE(Status, ProdOrderLine.Status);
        ProdOrderComp.SETRANGE("Prod. Order No.", ProdOrderLine."Prod. Order No.");
        ProdOrderComp.SETRANGE("Prod. Order Line No.", ProdOrderLine."Line No.");
        IF ProdOrderComp.FINDFIRST THEN
            REPEAT
                ProdOrderComp.BlockDynamicTracking(Blocked);
                ProdOrderComp.VALIDATE("Routing Link Code");
                ProdOrderComp.MODIFY;
                ProdOrderComp.AutoReserve;
            UNTIL ProdOrderComp.NEXT = 0;
    end;

    (52364)]
    procedure CalculateRoutingFromActual(ProdOrderRtngLine: Record "Prod. Order Routing Line"; Direction: Option Forward,Backward; CalcStartEndDate: Boolean);
    var
        CalcProdOrderRtngLine: Codeunit "Calculate Routing Line";
    begin
        IF ProdOrderRouteMgt.NeedsCalculation(
             ProdOrderRtngLine.Status,
             ProdOrderRtngLine."Prod. Order No.",
             ProdOrderRtngLine."Routing Reference No.",
             ProdOrderRtngLine."Routing No.")
        THEN BEGIN
            ProdOrderLine.SETRANGE(Status, ProdOrderRtngLine.Status);
            ProdOrderLine.SETRANGE("Prod. Order No.", ProdOrderRtngLine."Prod. Order No.");
            ProdOrderLine.SETRANGE("Routing Reference No.", ProdOrderRtngLine."Routing Reference No.");
            ProdOrderLine.SETRANGE("Routing No.", ProdOrderRtngLine."Routing No.");
            ProdOrderLine.FINDFIRST;
            ProdOrderRouteMgt.Calculate(ProdOrderLine);
            ProdOrderRtngLine.GET(
              ProdOrderRtngLine.Status,
              ProdOrderRtngLine."Prod. Order No.",
              ProdOrderRtngLine."Routing Reference No.",
              ProdOrderRtngLine."Routing No.",
              ProdOrderRtngLine."Operation No.");
        END;
        IF Direction = Direction::Forward THEN
            ProdOrderRtngLine.SETCURRENTKEY(Status, "Prod. Order No.", "Routing Reference No.",
              "Routing No.", "Sequence No. (Forward)")
        ELSE
            ProdOrderRtngLine.SETCURRENTKEY(Status, "Prod. Order No.", "Routing Reference No.",
              "Routing No.", "Sequence No. (Backward)");

        ProdOrderRtngLine.SETRANGE(Status, ProdOrderRtngLine.Status);
        ProdOrderRtngLine.SETRANGE("Prod. Order No.", ProdOrderRtngLine."Prod. Order No.");
        ProdOrderRtngLine.SETRANGE("Routing Reference No.", ProdOrderRtngLine."Routing Reference No.");
        ProdOrderRtngLine.SETRANGE("Routing No.", ProdOrderRtngLine."Routing No.");
        ProdOrderRtngLine.SETFILTER("Routing Status", '<>%1', ProdOrderRtngLine."Routing Status"::Finished);
        REPEAT
            IF CalcStartEndDate AND NOT ProdOrderRtngLine."Schedule Manually" THEN BEGIN
                IF ((Direction = Direction::Forward) AND (ProdOrderRtngLine."Previous Operation No." <> '')) OR
                   ((Direction = Direction::Backward) AND (ProdOrderRtngLine."Next Operation No." <> ''))
                THEN BEGIN
                    ProdOrderRtngLine."Starting Time" := 0T;
                    ProdOrderRtngLine."Starting Date" := 0D;
                    ProdOrderRtngLine."Ending Time" := 235959T;
                    ProdOrderRtngLine."Ending Date" := CalendarMgt.GetMaxDate;
                END;
            END;
            CalcProdOrderRtngLine.CalculateRoutingLine(
              ProdOrderRtngLine,
              Direction, CalcStartEndDate);
            CalcStartEndDate := TRUE;
        UNTIL ProdOrderRtngLine.NEXT = 0;
    end;

    (52413)]
    local procedure CalculateRouting(Direction: Option Forward,Backward; LetDueDateDecrease: Boolean);
    var
        ProdOrderRtngLine: Record "Prod. Order Routing Line";
        LeadTime: Code[20];
    begin
        IF ProdOrderRouteMgt.NeedsCalculation(
             ProdOrderLine.Status,
             ProdOrderLine."Prod. Order No.",
             ProdOrderLine."Routing Reference No.",
             ProdOrderLine."Routing No.")
        THEN
            ProdOrderRouteMgt.Calculate(ProdOrderLine);

        IF Direction = Direction::Forward THEN
            ProdOrderRtngLine.SETCURRENTKEY(Status, "Prod. Order No.", "Routing Reference No.", "Routing No.",
              "Sequence No. (Forward)")
        ELSE
            ProdOrderRtngLine.SETCURRENTKEY(Status, "Prod. Order No.", "Routing Reference No.", "Routing No.",
              "Sequence No. (Backward)");

        ProdOrderRtngLine.SETRANGE(Status, ProdOrderLine.Status);
        ProdOrderRtngLine.SETRANGE("Prod. Order No.", ProdOrderLine."Prod. Order No.");
        ProdOrderRtngLine.SETRANGE("Routing Reference No.", ProdOrderLine."Routing Reference No.");
        ProdOrderRtngLine.SETRANGE("Routing No.", ProdOrderLine."Routing No.");
        ProdOrderRtngLine.SETFILTER("Routing Status", '<>%1', ProdOrderRtngLine."Routing Status"::Finished);
        IF NOT ProdOrderRtngLine.FINDFIRST THEN BEGIN
            LeadTime :=
              LeadTimeMgt.ManufacturingLeadTime(
                ProdOrderLine."Item No.",
                ProdOrderLine."Location Code",
                ProdOrderLine."Variant Code");
            IF Direction = Direction::Forward THEN
                // Ending Date calculated forward from Starting Date
                ProdOrderLine."Ending Date" :=
              LeadTimeMgt.PlannedEndingDate2(
                ProdOrderLine."Item No.",
                ProdOrderLine."Location Code",
                ProdOrderLine."Variant Code",
                '',
                LeadTime,
                2,
                ProdOrderLine."Starting Date")
            ELSE
                // Starting Date calculated backward from Ending Date
                ProdOrderLine."Starting Date" :=
              LeadTimeMgt.PlannedStartingDate(
                ProdOrderLine."Item No.",
                ProdOrderLine."Location Code",
                ProdOrderLine."Variant Code",
                '',
                LeadTime,
                2,
                ProdOrderLine."Ending Date");

            CalculateProdOrderDates(ProdOrderLine, LetDueDateDecrease);
            EXIT;
        END;

        IF Direction = Direction::Forward THEN BEGIN
            ProdOrderRtngLine."Starting Date" := ProdOrderLine."Starting Date";
            ProdOrderRtngLine."Starting Time" := ProdOrderLine."Starting Time";
        END ELSE BEGIN
            ProdOrderRtngLine."Ending Date" := ProdOrderLine."Ending Date";
            ProdOrderRtngLine."Ending Time" := ProdOrderLine."Ending Time";
        END;
        ProdOrderRtngLine.UpdateDatetime;
        CalculateRoutingFromActual(ProdOrderRtngLine, Direction, FALSE);

        CalculateProdOrderDates(ProdOrderLine, LetDueDateDecrease);
    end;

    (52479)]
    procedure CalculateProdOrderDates(var ProdOrderLine: Record "Prod. Order Line"; LetDueDateDecrease: Boolean);
    var
        ProdOrderRtngLine: Record "Prod. Order Routing Line";
        NewDueDate: Date;
    begin
        ProdOrder.GET(ProdOrderLine.Status, ProdOrderLine."Prod. Order No.");

        ProdOrderRtngLine.SETRANGE(Status, ProdOrderLine.Status);
        ProdOrderRtngLine.SETRANGE("Prod. Order No.", ProdOrderLine."Prod. Order No.");
        ProdOrderRtngLine.SETRANGE("Routing No.", ProdOrderLine."Routing No.");
        IF ProdOrder."Source Type" <> ProdOrder."Source Type"::Family THEN
            ProdOrderRtngLine.SETRANGE("Routing Reference No.", ProdOrderLine."Line No.")
        ELSE
            ProdOrderRtngLine.SETRANGE("Routing Reference No.", 0);
        ProdOrderRtngLine.SETFILTER("Routing Status", '<>%1', ProdOrderRtngLine."Routing Status"::Finished);
        ProdOrderRtngLine.SETFILTER("Next Operation No.", '%1', '');

        IF ProdOrderRtngLine.FINDFIRST THEN BEGIN
            ProdOrderLine."Ending Date" := ProdOrderRtngLine."Ending Date";
            ProdOrderLine."Ending Time" := ProdOrderRtngLine."Ending Time";
        END;

        ProdOrderRtngLine.SETRANGE("Next Operation No.");
        ProdOrderRtngLine.SETFILTER("Previous Operation No.", '%1', '');

        IF ProdOrderRtngLine.FINDFIRST THEN BEGIN
            ProdOrderLine."Starting Date" := ProdOrderRtngLine."Starting Date";
            ProdOrderLine."Starting Time" := ProdOrderRtngLine."Starting Time";
        END;

        IF ProdOrderLine."Planning Level Code" = 0 THEN
            NewDueDate :=
              LeadTimeMgt.PlannedDueDate(
                ProdOrderLine."Item No.",
                ProdOrderLine."Location Code",
                ProdOrderLine."Variant Code",
                ProdOrderLine."Ending Date",
                '',
                2)
        ELSE
            NewDueDate := ProdOrderLine."Ending Date";

        IF LetDueDateDecrease OR (NewDueDate > ProdOrderLine."Due Date") THEN
            ProdOrderLine."Due Date" := NewDueDate;

        ProdOrderLine.UpdateDatetime;

        ProdOrderLine.MODIFY;

        IF NOT ProdOrderModify THEN BEGIN
            ProdOrder.AdjustStartEndingDate;
            ProdOrder.MODIFY;
        END;
    end;

    (52529)]
    procedure Calculate(ProdOrderLine2: Record "Prod. Order Line"; Direction: Option Forward,Backward; CalcRouting: Boolean; CalcComponents: Boolean; DeleteRelations: Boolean; LetDueDateDecrease: Boolean): Boolean;
    var
        CapLedgEntry: Record "Capacity Ledger Entry";
        ItemLedgEntry: Record "Item Ledger Entry";
        ProdOrderRtngLine3: Record "Prod. Order Routing Line";
        ProdOrderRtngLine4: Record "Prod. Order Routing Line";
        Routing: Record "Routing Header";
        ProdOrderRtngLine: Record "Prod. Order Routing Line";
        ErrorOccured: Boolean;
    begin
        ProdOrderLine := ProdOrderLine2;

        IF ProdOrderLine.Status = ProdOrderLine.Status::Released THEN BEGIN
            ItemLedgEntry.SETCURRENTKEY("Order Type", "Order No.");
            ItemLedgEntry.SETRANGE("Order Type", ItemLedgEntry."Order Type"::Production);
            ItemLedgEntry.SETRANGE("Order No.", ProdOrderLine."Prod. Order No.");
            IF ItemLedgEntry.FINDFIRST THEN
                ERROR(
                  Text001,
                  ProdOrderLine.Status, ProdOrderLine.TABLECAPTION, ProdOrderLine."Prod. Order No.",
                  ItemLedgEntry.TABLECAPTION);

            CapLedgEntry.SETCURRENTKEY("Order Type", "Order No.");
            CapLedgEntry.SETRANGE("Order Type", CapLedgEntry."Order Type"::Production);
            CapLedgEntry.SETRANGE("Order No.", ProdOrderLine."Prod. Order No.");
            IF CapLedgEntry.FINDFIRST THEN
                ERROR(
                  Text001,
                  ProdOrderLine.Status, ProdOrderLine.TABLECAPTION, ProdOrderLine."Prod. Order No.",
                  CapLedgEntry.TABLECAPTION);
        END;

        ProdOrderLine.TESTFIELD(Quantity);
        IF Direction = Direction::Backward THEN
            ProdOrderLine.TESTFIELD("Ending Date")
        ELSE
            ProdOrderLine.TESTFIELD("Starting Date");

        IF DeleteRelations THEN
            ProdOrderLine.DeleteRelations;

        IF CalcRouting THEN BEGIN
            TransferRouting;
            IF NOT CalcComponents THEN BEGIN // components will not be calculated later- update bin code
                ProdOrderRtngLine.SETRANGE(Status, ProdOrderLine.Status);
                ProdOrderRtngLine.SETRANGE("Prod. Order No.", ProdOrderLine."Prod. Order No.");
                ProdOrderRtngLine.SETRANGE("Routing Reference No.", ProdOrderLine."Routing Reference No.");
                ProdOrderRtngLine.SETRANGE("Routing No.", ProdOrderLine."Routing No.");
                IF NOT ProdOrderRouteMgt.UpdateComponentsBin(ProdOrderRtngLine, TRUE) THEN
                    ErrorOccured := TRUE;
            END;
        END ELSE BEGIN
            IF Routing.GET(ProdOrderLine2."Routing No.") OR (ProdOrderLine2."Routing No." = '') THEN
                IF Routing.Type <> Routing.Type::Parallel THEN BEGIN
                    ProdOrderRtngLine3.SETRANGE(Status, ProdOrderLine2.Status);
                    ProdOrderRtngLine3.SETRANGE("Prod. Order No.", ProdOrderLine2."Prod. Order No.");
                    ProdOrderRtngLine3.SETRANGE("Routing Reference No.", ProdOrderLine2."Routing Reference No.");
                    ProdOrderRtngLine3.SETRANGE("Routing No.", ProdOrderLine2."Routing No.");
                    ProdOrderRtngLine3.SETFILTER("Routing Status", '<>%1', ProdOrderRtngLine3."Routing Status"::Finished);
                    ProdOrderRtngLine4.COPYFILTERS(ProdOrderRtngLine3);
                    IF ProdOrderRtngLine3.FINDFIRST THEN
                        REPEAT
                            ProdOrderRtngLine4.SETRANGE("Operation No.", ProdOrderRtngLine3."Next Operation No.");
                            IF NOT ProdOrderRtngLine4.FINDFIRST AND (ProdOrderRtngLine3."Next Operation No." <> '') THEN
                                ERROR(
                                  Text002,
                                  ProdOrderRtngLine3."Next Operation No.");
                            ProdOrderRtngLine4.SETRANGE("Operation No.", ProdOrderRtngLine3."Previous Operation No.");
                            IF NOT ProdOrderRtngLine4.FINDFIRST AND (ProdOrderRtngLine3."Previous Operation No." <> '') THEN
                                ERROR(
                                  Text003,
                                  ProdOrderRtngLine3."Previous Operation No.");
                        UNTIL ProdOrderRtngLine3.NEXT = 0;
                END;
        END;

        IF CalcComponents THEN BEGIN
            IF ProdOrderLine."Production BOM No." <> '' THEN BEGIN
                Item.GET(ProdOrderLine."Item No.");
                GetPlanningParameters.AtSKU(
                  SKU,
                  ProdOrderLine."Item No.",
                  ProdOrderLine."Variant Code",
                  ProdOrderLine."Location Code");

                IF NOT TransferBOM(
                     ProdOrderLine."Production BOM No.",
                     1,
                     ProdOrderLine."Qty. per Unit of Measure",
                     UOMMgt.GetQtyPerUnitOfMeasure(
                       Item,
                       VersionMgt.GetBOMUnitOfMeasure(
                         ProdOrderLine."Production BOM No.",
                         ProdOrderLine."Production BOM Version Code")))
                THEN
                    ErrorOccured := TRUE;
            END;
        END;
        Recalculate(ProdOrderLine, Direction, LetDueDateDecrease);
        EXIT(NOT ErrorOccured);
    end;

    (52621)]
    procedure Recalculate(var ProdOrderLine2: Record "Prod. Order Line"; Direction: Option Forward,Backward; LetDueDateDecrease: Boolean);
    begin
        ProdOrderLine := ProdOrderLine2;
        ProdOrderLine.BlockDynamicTracking(Blocked);

        CalculateRouting(Direction, LetDueDateDecrease);
        CalculateComponents;
        ProdOrderLine2 := ProdOrderLine;
    end;

    (52629)]
    procedure BlockDynamicTracking(SetBlock: Boolean);
    begin
        Blocked := SetBlock;
    end;

    (52632)]
    procedure SetParameter(NewProdOrderModify: Boolean);
    begin
        ProdOrderModify := NewProdOrderModify;
    end;

    (52635)]
    local procedure GetDefaultBin() BinCode: Code[20];
    var
        WMSMgt: Codeunit "WMS Management";
    begin
        WITH ProdOrderComp DO
            IF "Location Code" <> '' THEN BEGIN
                IF Location.Code <> "Location Code" THEN
                    Location.GET("Location Code");
                IF Location."Bin Mandatory" AND (NOT Location."Directed Put-away and Pick") THEN
                    WMSMgt.GetDefaultBin("Item No.", "Variant Code", "Location Code", BinCode);
            END;
    end;

    (52644)]
    procedure SetProdOrderLineBinCodeFromRoute(var ProdOrderLine: Record "Prod. Order Line"; ParentLocationCode: Code[10]; RoutingNo: Code[20]);
    var
        RouteBinCode: Code[20];
    begin
        RouteBinCode :=
          WMSManagement.GetLastOperationFromBinCode(
            RoutingNo,
            ProdOrderLine."Routing Version Code",
            ProdOrderLine."Location Code",
            FALSE,
            0);
        SetProdOrderLineBinCode(ProdOrderLine, RouteBinCode, ParentLocationCode);
    end;

    (52654)]
    procedure SetProdOrderLineBinCodeFromProdRtngLines(var ProdOrderLine: Record "Prod. Order Line");
    var
        ProdOrderRtngLinesBinCode: Code[20];
    begin
        IF ProdOrderLine."Planning Level Code" > 0 THEN
            EXIT;

        ProdOrderRtngLinesBinCode :=
          WMSManagement.GetProdRtngLastOperationFromBinCode(
            ProdOrderLine.Status,
            ProdOrderLine."Prod. Order No.",
            ProdOrderLine."Line No.",
            ProdOrderLine."Routing No.",
            ProdOrderLine."Location Code");
        SetProdOrderLineBinCode(ProdOrderLine, ProdOrderRtngLinesBinCode, ProdOrderLine."Location Code");
    end;

    (52667)]
    procedure SetProdOrderLineBinCodeFromPlanningRtngLines(var ProdOrderLine: Record "Prod. Order Line"; ReqLine: Record "Requisition Line");
    var
        PlanningLinesBinCode: Code[20];
    begin
        IF ProdOrderLine."Planning Level Code" > 0 THEN
            EXIT;

        PlanningLinesBinCode :=
          WMSManagement.GetPlanningRtngLastOperationFromBinCode(
            ReqLine."Worksheet Template Name",
            ReqLine."Journal Batch Name",
            ReqLine."Line No.",
            ReqLine."Location Code");
        SetProdOrderLineBinCode(ProdOrderLine, PlanningLinesBinCode, ReqLine."Location Code");
    end;

    (52679)]
    local procedure SetProdOrderLineBinCode(var ProdOrderLine: Record "Prod. Order Line"; ParentBinCode: Code[20]; ParentLocationCode: Code[10]);
    var
        Location: Record Location;
        FromProdBinCode: Code[20];
    begin
        IF ParentBinCode <> '' THEN
            ProdOrderLine.VALIDATE("Bin Code", ParentBinCode)
        ELSE BEGIN
            FromProdBinCode := '';
            IF Location.GET(ParentLocationCode) THEN
                FromProdBinCode := Location."From-Production Bin Code";
            IF FromProdBinCode <> '' THEN
                ProdOrderLine.VALIDATE("Bin Code", FromProdBinCode)
            ELSE
                ProdOrderLine.VALIDATE("Location Code");
        END;
    end;

    (52692)]
    procedure FindAndSetProdOrderLineBinCodeFromProdRtngLines(ProdOrderStatus: Option; ProdOrderNo: Code[20]; ProdOrderLineNo: Integer);
    begin
        IF ProdOrderLine.GET(ProdOrderStatus, ProdOrderNo, ProdOrderLineNo) THEN BEGIN
            SetProdOrderLineBinCodeFromProdRtngLines(ProdOrderLine);
            ProdOrderLine.MODIFY;
        END;
    end;

    (52698)]
    procedure AssignProdOrderLineBinCodeFromProdRtngLineMachineCenter(var ProdOrderRtngLine: Record "Prod. Order Routing Line");
    var
        MachineCenter: Record "Machine Center";
    begin
        MachineCenter.SETRANGE("Work Center No.", ProdOrderRtngLine."Work Center No.");
        IF PAGE.RUNMODAL(PAGE::"Machine Center List", MachineCenter) = ACTION::LookupOK THEN
            IF (ProdOrderRtngLine."No." <> MachineCenter."No.") OR
               (ProdOrderRtngLine.Type = ProdOrderRtngLine.Type::"Work Center")
            THEN BEGIN
                ProdOrderRtngLine.Type := ProdOrderRtngLine.Type::"Machine Center";
                ProdOrderRtngLine.VALIDATE("No.", MachineCenter."No.");
                FindAndSetProdOrderLineBinCodeFromProdRtngLines(
                  ProdOrderRtngLine.Status, ProdOrderRtngLine."Prod. Order No.", ProdOrderRtngLine."Routing Reference No.");
            END;
    end;

    (52710)]
    local procedure TransferBOMProcessItem(Level: Integer; LineQtyPerUOM: Decimal; ItemQtyPerUOM: Decimal; var ErrorOccured: Boolean);
    var
        Item: Record Item;
        ComponentSKU: Record "Stockkeeping Unit";
        Alt: Record "Alternate Items";
        Item2: Record Item;
    begin
        ProdOrderComp.SETCURRENTKEY(Status, "Prod. Order No.", "Prod. Order Line No.", "Item No.");
        ProdOrderComp.SETRANGE(Status, ProdOrderLine.Status);
        ProdOrderComp.SETRANGE("Prod. Order No.", ProdOrderLine."Prod. Order No.");
        ProdOrderComp.SETRANGE("Prod. Order Line No.", ProdOrderLine."Line No.");
        ProdOrderComp.SETRANGE("Item No.", BomComponent[Level]."No.");
        ProdOrderComp.SETRANGE("Variant Code", BomComponent[Level]."Variant Code");
        ProdOrderComp.SETRANGE("Routing Link Code", BomComponent[Level]."Routing Link Code");
        ProdOrderComp.SETRANGE(Position, BomComponent[Level].Position);
        ProdOrderComp.SETRANGE("Position 2", BomComponent[Level]."Position 2");
        ProdOrderComp.SETRANGE("Position 3", BomComponent[Level]."Position 3");
        ProdOrderComp.SETRANGE(Length, BomComponent[Level].Length);
        ProdOrderComp.SETRANGE(Width, BomComponent[Level].Width);
        ProdOrderComp.SETRANGE(Weight, BomComponent[Level].Weight);
        ProdOrderComp.SETRANGE(Depth, BomComponent[Level].Depth);
        ProdOrderComp.SETRANGE("Unit of Measure Code", BomComponent[Level]."Unit of Measure Code");
        IF NOT ProdOrderComp.FINDFIRST THEN BEGIN
            ProdOrderComp.RESET;
            ProdOrderComp.SETRANGE(Status, ProdOrderLine.Status);
            ProdOrderComp.SETRANGE("Prod. Order No.", ProdOrderLine."Prod. Order No.");
            ProdOrderComp.SETRANGE("Prod. Order Line No.", ProdOrderLine."Line No.");
            IF ProdOrderComp.FINDLAST THEN
                NextProdOrderCompLineNo := ProdOrderComp."Line No." + 10000
            ELSE
                NextProdOrderCompLineNo := 10000;
            ProdOrderComp.INIT;
            ProdOrderComp.SetIgnoreErrors;
            ProdOrderComp.BlockDynamicTracking(Blocked);
            ProdOrderComp.Status := ProdOrderLine.Status;
            ProdOrderComp."Prod. Order No." := ProdOrderLine."Prod. Order No.";
            ProdOrderComp."Prod. Order Line No." := ProdOrderLine."Line No.";
            ProdOrderComp."Line No." := NextProdOrderCompLineNo;
            Item.GET(BomComponent[Level]."No.");
            //code added by vijaya on 22*-08-2018
            IF (Item."Product Group Code" = 'CPCB') AND (AlternatePCB_BOM = TRUE) THEN BEGIN
                Alt.RESET;
                Alt.SETRANGE("Item No.", Item."No.");
                Alt.SETFILTER("Proudct Type", '%1|%2', 'ALL PRODUCTS', ProdOrder."Item Sub Group Code");
                IF Alt.FINDFIRST THEN BEGIN
                    IF Alt."Alternative Item No." <> '' THEN BEGIN
                        Item.GET(Alt."Alternative Item No.");
                        ProdOrderComp.VALIDATE("Item No.", Item."No.");
                        ProdOrderComp.Description := Item.Description;
                    END ELSE BEGIN
                        ProdOrderComp.VALIDATE("Item No.", BomComponent[Level]."No.");
                        ProdOrderComp.Description := BomComponent[Level].Description;
                    END;
                END ELSE BEGIN
                    ProdOrderComp.VALIDATE("Item No.", BomComponent[Level]."No.");
                    ProdOrderComp.Description := BomComponent[Level].Description;
                END;
            END ELSE
                ProdOrderComp.VALIDATE("Item No.", BomComponent[Level]."No.");
            ProdOrderComp."Variant Code" := BomComponent[Level]."Variant Code";
            ProdOrderComp."Location Code" := SKU."Components at Location";
            ProdOrderComp."Bin Code" := GetDefaultBin;
            ProdOrderComp.Description := BomComponent[Level].Description;
            ProdOrderComp.VALIDATE("Unit of Measure Code", BomComponent[Level]."Unit of Measure Code");
            ProdOrderComp."Quantity per" :=
              BomComponent[Level]."Quantity per" * LineQtyPerUOM / ItemQtyPerUOM;
            ProdOrderComp."Material Required Day" := BomComponent[Level]."Material Reqired Day";
            // ADDED BY SANTHOSH FOR PROD START DATE UPDATION
            ProdOrderStDate.RESET;
            IF ProdOrderStDate.GET(ProdOrderStDate.Status::Released, ProdOrderLine."Prod. Order No.") THEN
                ProdOrderComp."Production Plan Date" := ProdOrderStDate."Prod Start date";
            ProdOrderComp.Length := BomComponent[Level].Length;
            ProdOrderComp.Width := BomComponent[Level].Width;
            ProdOrderComp.Weight := BomComponent[Level].Weight;
            ProdOrderComp.Depth := BomComponent[Level].Depth;
            ProdOrderComp.Position := BomComponent[Level].Position;
            ProdOrderComp."Position 2" := BomComponent[Level]."Position 2";
            ProdOrderComp."Position 3" := BomComponent[Level]."Position 3";
            //B2B
            ProdOrderComp."Position 4" := BomComponent[Level]."Position 4";
            ProdOrderComp."BOM Type" := BomComponent[Level]."BOM Type";
            ProdOrderComp."Type of Solder" := BomComponent[Level]."Type of Solder";
            IF Item2.GET(ProdOrderComp."Item No.") THEN BEGIN
                IF Item2."Invert Solder type" = TRUE THEN BEGIN
                    IF Item2."Type of Solder" = Item2."Type of Solder"::DIP THEN
                        ProdOrderComp."Type of Solder2" := 'SMD'
                    ELSE
                        IF (Item2."Type of Solder" = Item2."Type of Solder"::SMD) THEN
                            ProdOrderComp."Type of Solder2" := 'DIP';
                END
                ELSE
                    ProdOrderComp."Type of Solder2" := FORMAT(Item2."Type of Solder");
            END;
            //B2B
            ProdOrderComp."Lead-Time Offset" := BomComponent[Level]."Lead-Time Offset";
            ProdOrderComp.VALIDATE("Routing Link Code", BomComponent[Level]."Routing Link Code");
            ProdOrderComp.VALIDATE("Scrap %", BomComponent[Level]."Scrap %");
            ProdOrderComp.VALIDATE("Calculation Formula", BomComponent[Level]."Calculation Formula");

            GetPlanningParameters.AtSKU(
              ComponentSKU, ProdOrderComp."Item No.",
              ProdOrderComp."Variant Code",
              ProdOrderComp."Location Code");

            ProdOrderComp."Flushing Method" := ComponentSKU."Flushing Method";
            IF (SKU."Manufacturing Policy" = SKU."Manufacturing Policy"::"Make-to-Order") AND
               (ComponentSKU."Manufacturing Policy" = ComponentSKU."Manufacturing Policy"::"Make-to-Order") AND
               (ComponentSKU."Replenishment System" = ComponentSKU."Replenishment System"::"Prod. Order")
            THEN BEGIN
                IF ProdOrderComp."Quantity per" = 0 THEN
                    EXIT;
                ProdOrderComp."Planning Level Code" := ProdOrderLine."Planning Level Code" + 1;
                Item.GET(ProdOrderComp."Item No.");
                ProdOrderComp."Item Low-Level Code" := Item."Low-Level Code";
            END;
            ProdOrderComp.GetDefaultBin;
            ProdOrderComp.INSERT(TRUE);
        END ELSE BEGIN
            ProdOrderComp.SetIgnoreErrors;
            ProdOrderComp.SETCURRENTKEY(Status, "Prod. Order No."); // Reset key
            ProdOrderComp.BlockDynamicTracking(Blocked);
            ProdOrderComp.VALIDATE(
              "Quantity per",
              ProdOrderComp."Quantity per" + BomComponent[Level]."Quantity per" * LineQtyPerUOM / ItemQtyPerUOM);
            ProdOrderComp.VALIDATE("Routing Link Code", BomComponent[Level]."Routing Link Code");
            ProdOrderComp.MODIFY;
        END;
        IF ProdOrderComp.HasErrorOccured THEN
            ErrorOccured := TRUE;
        ProdOrderComp.AutoReserve;

        ProdBOMCompComment.SETRANGE("Production BOM No.", BomComponent[Level]."Production BOM No.");
        ProdBOMCompComment.SETRANGE("BOM Line No.", BomComponent[Level]."Line No.");
        ProdBOMCompComment.SETRANGE("Version Code", BomComponent[Level]."Version Code");
        IF ProdBOMCompComment.FIND('-') THEN
            REPEAT
                ProdOrderBOMCompComment.CopyFromProdBOMComponent(ProdBOMCompComment, ProdOrderComp);
                IF NOT ProdOrderBOMCompComment.INSERT THEN
                    ProdOrderBOMCompComment.MODIFY;
            UNTIL ProdBOMCompComment.NEXT = 0;
    end;

    (52851)]
    procedure ALternateBOMReplace(Alternate_BOM: Boolean);
    begin
        AlternatePCB_BOM := Alternate_BOM;
    end;
}

