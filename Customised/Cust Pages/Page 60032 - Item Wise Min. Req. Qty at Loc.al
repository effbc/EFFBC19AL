page 60032 "Item Wise Min. Req. Qty at Loc"
{
    PageType = Card;
    SourceTable = "Item Wise Min. Req. Qty at Loc";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(Location; Location)
                {
                }
                field(Item; Item)
                {
                    Editable = true;
                }
                field("Type Of Module"; "Type Of Module")
                {
                    Editable = true;
                }
                field("AMC Qty"; "AMC Qty")
                {
                }
                field("Warranty Qty"; "Warranty Qty")
                {
                }
                field("Responsible Person"; "Responsible Person")
                {
                }
                field("User Id"; "User Id")
                {
                    Editable = false;
                }
                field("Last Date Modified"; "Last Date Modified")
                {
                    Editable = false;
                }
                field("Base Location"; "Base Location")
                {
                }
                field("Location Name"; "Location Name")
                {
                    Editable = false;
                }
                field(Descirption; Descirption)
                {
                    Editable = false;
                }
                field("Unit Cost (LCY)"; "Unit Cost (LCY)")
                {
                    Editable = false;
                }
                field("Actual Qty"; "Actual Qty")
                {
                    Editable = false;
                }
                field("Minimum Stock Quantity"; "Minimum Stock Quantity")
                {
                }
                field(Name; Name)
                {
                    Editable = false;
                }
                field("Old Stock"; "Old Stock")
                {
                    Editable = false;
                }
                field("Creation Date"; "Creation Date")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }

    (5450)]
    local procedure MinimumStockQuantityOnBeforeIn();
    begin
        IF (USERID <> 'EFFTRONICS\RAMADEVI') AND (USERID <> '07CS019') THEN
            ERROR('You have No Rights to Change Minimum Stock');
    end;

    (5454)]
    local procedure MinimumStockQuantityOnInputCha(var Text: Text[1024]);
    begin
        "Old Stock" := "Minimum Stock Quantity";
    end;
}

