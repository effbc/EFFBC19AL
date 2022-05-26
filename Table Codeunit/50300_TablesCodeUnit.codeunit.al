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



}