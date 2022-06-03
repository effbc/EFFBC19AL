codeunit 50300 TablesCodeUnit
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Table, Database::"Prod. Order Line", 'OnValidateItemNoOnAfterAssignItemValues', '', false, false)]
    local procedure OnValidateItemNoOnAfterAssignItemValues(var ProdOrderLine: Record "Prod. Order Line"; Item: Record Item)
    begin
        //QC 1.0
        ProdOrderLine."WIP QC Enabled" := Item."WIP QC Enabled";
        ProdOrderLine."WIP Spec Id" := Item."WIP Spec ID";
        if ProdOrderLine."WIP Spec Id" <> '' then
            ProdOrderLine."Spec Version Code" := ProdOrderLine.GetSpecVersion;
        //QC 1.0
    end;

    [EventSubscriber(ObjectType::table, Database::"Prod. Order Component", 'OnBeforeUpdateUnitCost', '', false, false)]
    local procedure OnBeforeUpdateUnitCost(var ProdOrderComponent: Record "Prod. Order Component"; GLSetup: Record "General Ledger Setup"; var IsHandled: Boolean)
    var
        Item: Record Item;
    begin
        ProdOrderComponent."AVG Unit cost" := Item."Avg Unit Cost";
    end;

    [EventSubscriber(ObjectType::table, Database::"Prod. Order Component", 'OnValidateExpectedQuantityOnAfterCalcActConsumptionQty', '', false, false)]
    local procedure OnValidateExpectedQuantityOnAfterCalcActConsumptionQty(var ProdOrderComp: Record "Prod. Order Component"; xProdOrderComp: Record "Prod. Order Component")
    begin
        if (ProdOrderComp."Act. Consumption (Qty)" <> 0) or (ProdOrderComp."Qty. per Unit of Measure" <> 0) then
            ProdOrderComp."Remaining Quantity" := ProdOrderComp."Expected Quantity" - ProdOrderComp."Act. Consumption (Qty)" / ProdOrderComp."Qty. per Unit of Measure"
        else
            ProdOrderComp."Remaining Quantity" := ProdOrderComp."Expected Quantity";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Transfer Line", 'OnAfterAssignItemValues', '', false, false)]
    local procedure OnAfterAssignItemValues(var TransferLine: Record "Transfer Line"; Item: Record Item)
    var
        TransferHeader: Record "Transfer Header";
        Location: Record Location;
    begin
        //B2B-ESPL
        TransferHeader.SetRange("No.", TransferLine."Document No.");
        if TransferHeader.Find('-') then begin
            Location.Get(TransferHeader."Transfer-to Code");
            if Location."QC Enabled Location" then begin
                Validate(TransferLine."Spec ID", Item."Spec ID");
                Validate(TransferLine."QC Enabled", Item."QC Enabled");
            end;
        end;
        //B2B
    end;

    [EventSubscriber(ObjectType::Table, Database::"Service Item Line", 'OnValidateServiceItemNoOnBeforeValidateServicePeriod', '', false, false)]
    local procedure OnValidateServiceItemNoOnBeforeValidateServicePeriod(var ServiceItemLine: Record "Service Item Line"; xServiceItemLine: Record "Service Item Line"; CurrentFieldNo: Integer; var IsHandled: Boolean)
    var
        Item: Record Item;
    begin
        Item.SetFilter(Item."No.", ServiceItemLine."Item No.");
        if Item.Find('-') then begin
            ServiceItemLine."Unit cost" := Item."Avg Unit Cost";
            ServiceItemLine.Description := Item.Description;
        end;
        //b2b-eff
    end;

    [EventSubscriber(ObjectType::Table, Database::"Service Line", 'OnValidateServiceItemLineNoOnBeforeValidateContractNo', '', false, false)]
    local procedure OnValidateServiceItemLineNoOnBeforeValidateContractNo(var ServiceLine: Record "Service Line"; ServItemLine: Record "Service Item Line")
    begin
        ServiceLine."Fault Area Description" := ServItemLine."Fault Area Description";
        ServiceLine."Sub Module Code" := ServItemLine."Sub Module Code";
        ServiceLine."Sub Module Descrption" := ServItemLine."Sub Module Descrption";
    end;


    //Table - 7317 Warehouse Receipt Line

    [EventSubscriber(ObjectType::Table, Database::"Warehouse Receipt Line", 'OnBeforeInitOutstandingQtys', '', false, false)]
    local procedure OnBeforeInitOutstandingQtys(var WarehouseReceiptLine: Record "Warehouse Receipt Line"; CurrentFieldNo: Integer; var IsHandled: Boolean)
    begin
        //QC
        WarehouseReceiptLine."Qty. Sending To Quality" := WarehouseReceiptLine.Quantity;
        //QC
    end;


    //Table - 99000764 Routing Line

    [EventSubscriber(ObjectType::Table, Database::"Routing Line", 'OnAfterMachineCtrTransferFields', '', false, false)]
    local procedure OnAfterMachineCtrTransferFields(var RoutingLine: Record "Routing Line"; WorkCenter: Record "Work Center"; MachineCenter: Record "Machine Center")
    begin
        //Cost1.0
        RoutingLine."Man Cost" := RoutingLine."Run Time" * MachineCenter."Unit Cost";
        //Cost1.0
    end;

    [EventSubscriber(ObjectType::Table, Database::"Routing Line", 'OnAfterWorkCenterTransferFields', '', false, false)]
    local procedure OnAfterWorkCenterTransferFields(var RoutingLine: Record "Routing Line"; WorkCenter: Record "Work Center")
    begin
        //Cost1.0
        RoutingLine."Man Cost" := RoutingLine."Run Time" * WorkCenter."Unit Cost";
        //Cost1.0
    end;

    //Table - 99000772 Production BOM Line

    [EventSubscriber(ObjectType::Table, Database::"Production BOM Line", 'OnBeforeTestStatus', '', false, false)]
    local procedure OnBeforeTestStatus(var ProductionBOMLine: Record "Production BOM Line"; var IsHandled: Boolean)
    begin
        if not ((UserId = 'SUPER') or (UserId = '10RD010')) then
            IsHandled := false;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Production BOM Line", 'OnAfterTestStatus', '', false, false)]
    local procedure OnAfterTestStatus(ProductionBOMLine: Record "Production BOM Line"; ProductionBOMHeader: Record "Production BOM Header"; ProductionBOMVersion: Record "Production BOM Version")
    var
        Item: Record Item;
    begin
        //>> Added by vishnu on 05-12-2018 to prevent the BOM Picking for PCB abd Fproducts
        if ProductionBOMLine.Type = ProductionBOMLine.Type::"Production BOM" then begin
            if Item.Get(Item."No.") then
                Error('Type Should be Item for %1', Item."No.");
        end;
        //>> Ended by vishnu on 05-12-2018
    end;

    [EventSubscriber(ObjectType::Table, Database::"Production BOM Line", 'OnValidateNoOnAfterAssignItemFields', '', false, false)]
    local procedure OnValidateNoOnAfterAssignItemFields(var ProductionBOMLine: Record "Production BOM Line"; Item: Record Item; var xProductionBOMLine: Record "Production BOM Line"; CallingFieldNo: Integer)
    var
        ProdBOMHeader: Record "Production BOM Header";
    begin
        ProductionBOMLine."Description 2" := Item."Description 2";
        //NSS 030907
        ProductionBOMLine.PCB := Item.PCB;
        //NSS 030907
        Item.TestField("Base Unit of Measure");
        Item.TestField("Item Tracking Code");     //added by pranavi on 08-09-2015
        ProductionBOMLine."Unit of Measure Code" := Item."Base Unit of Measure";
        ProductionBOMLine."Type of Solder" := Item."Type of Solder";
        //"Shelf No." := Item."Shelf No.";
        ProductionBOMLine."No. of Pins" := Item."No. of Pins" * ProductionBOMLine."Quantity per";
        ProductionBOMLine."No. of Soldering Points" := Item."No. of Soldering Points" * (ProductionBOMLine."Quantity per" - ProductionBOMLine."Scrap Quantity");
        ProductionBOMLine."No. of Opportunities" := Item."No. of Opportunities" * ProductionBOMLine."Quantity per";
        ProductionBOMLine.Make := Item.Make;
        ProductionBOMLine."Part number" := Item."Part Number";
        ProductionBOMLine."Storage Temperature" := Item."Storage Temperature";
        ProductionBOMLine.Package := Item.Package;


        //cost1.0
        if Item."Production BOM No." = '' then begin
            ProductionBOMLine."Avg Cost" := Item."Avg Unit Cost";
            ProductionBOMLine."Tot Avg Cost" := ProductionBOMLine."Avg Cost" * ProductionBOMLine."Quantity per";
        end else begin
            ProdBOMHeader.Get(ProdBOMHeader."No.");
            ProdBOMHeader.TestField("Unit of Measure Code");
            ProdBOMHeader.CalcFields(ProdBOMHeader."BOM Cost", ProdBOMHeader."BOM Manufacturing Cost");
            ProductionBOMLine."No. of Soldering Points" := ProdBOMHeader."Total Soldering Points" * ProductionBOMLine."Quantity per";
            ProductionBOMLine."No. of SMD Points" := ProdBOMHeader."Total Soldering Points SMD" * ProductionBOMLine."Quantity per";
            ProductionBOMLine."No. of DIP Point" := ProdBOMHeader."Total Soldering Points DIP" * ProductionBOMLine."Quantity per";

            ProductionBOMLine."Avg Cost" := ProdBOMHeader."BOM Cost";
            ProductionBOMLine."Tot Avg Cost" := ProductionBOMLine."Avg Cost" * ProductionBOMLine."Quantity per";
            if ProductionBOMLine.Type = ProductionBOMLine.Type::"Production BOM" then begin
                ProductionBOMLine."Manufacturing Cost" := ProdBOMHeader."BOM Manufacturing Cost";
                ProductionBOMLine."Tot Avg Cost" := ProductionBOMLine."Avg Cost" * ProductionBOMLine."Quantity per";
            end;
        end;
        if Item."Routing No." <> '' then
            ProductionBOMLine."Manufacturing Cost" := Item."Manufacturing Cost";
        //Cost1.0
    end;

    [EventSubscriber(ObjectType::Table, Database::"Production BOM Line", 'OnValidateNoOnAfterAssignProdBOMFields', '', false, false)]
    local procedure OnValidateNoOnAfterAssignProdBOMFields(var ProductionBOMLine: Record "Production BOM Line"; ProductionBOMHeader: Record "Production BOM Header"; var xProductionBOMLine: Record "Production BOM Line"; CallingFieldNo: Integer)
    var
        ProdBOMHeader: Record "Production BOM Header";
    begin
        //Cost1.0
        ProdBOMHeader.CalcFields(ProdBOMHeader."BOM Cost");
        ProductionBOMLine."Avg Cost" := ProdBOMHeader."BOM Cost";
        ProductionBOMLine."Tot Avg Cost" := ProductionBOMLine."Avg Cost" * ProductionBOMLine."Quantity per";
        ProductionBOMLine."Manufacturing Cost" := ProdBOMHeader."BOM Manufacturing Cost";
        //Cost1.0
    end;


}