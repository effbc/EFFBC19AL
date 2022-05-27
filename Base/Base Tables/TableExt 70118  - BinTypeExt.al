tableextension 70118 BinTypeExt extends "Bin Type"
{
    fields
    {
        modify(Code)
        {
            TableRelation = "Production BOM Header";
        }
        field(60001; "Item No"; Code[30])
        {
            TableRelation = Item."No.";

            trigger OnValidate();
            begin
                if ITEM_REC.Get("Item No") then
                    Description := ITEM_REC.Description;
            end;
        }
        field(60002; QTY; Decimal)
        {
            DecimalPlaces = 2 : 5;
        }
        field(60003; "Material Required Day"; Integer)
        {
        }
    }

    var
        ITEM_REC: Record Item;
}

