page 60170 "Items by Dimension"
{
    // version B2B1.0

    Caption = 'Items by Location';
    PageType = Card;
    SaveValues = true;
    SourceTable = Item;

    layout
    {
    }

    actions
    {
    }

    var
        ItemLedgerEntry: Record "Item Ledger Entry";
        MatrixHeader: Text[250];
        ShowColumnName: Boolean;
        ShowInTransit: Boolean;
        DimValue: Record "Dimension Value";
        ItemNo: Code[20];

    (13677)]
    local procedure InventoryDrillDown();
    begin
    end;

    (13680)]
    local procedure UpdateMatrix();
    begin
    end;
}

