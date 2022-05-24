codeunit 50300 TablesCodeUnit
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Table, Database::"Prod. Order Line", 'OnValidateItemNoOnAfterAssignItemValues', '', false, false)]
    local procedure OnValidateItemNoOnAfterAssignItemValues(var ProdOrderLine: Record "Prod. Order Line"; Item: Record Item)
    begin
        //QC 1.0
        "WIP QC Enabled" := Item."WIP QC Enabled";
        "WIP Spec Id" := Item."WIP Spec ID";
        if "WIP Spec Id" <> '' then
            "Spec Version Code" := GetSpecVersion;
        //QC 1.0
    end;

    [EventSubscriber(ObjectType::table, Database::"Prod. Order Component", 'OnBeforeUpdateUnitCost', '', false, false)]
    local procedure OnBeforeUpdateUnitCost(var ProdOrderComponent: Record "Prod. Order Component"; GLSetup: Record "General Ledger Setup"; var IsHandled: Boolean)
    begin
        "AVG Unit cost" := Item."Avg Unit Cost";
    end;
}