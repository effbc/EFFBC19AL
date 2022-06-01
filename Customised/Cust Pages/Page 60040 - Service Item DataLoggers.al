page 60040 "Service Item DataLoggers"
{
    // version B2B1.0

    PageType = Worksheet;
    SourceTable = "Item Wise Min. Req. Qty at Loc";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field(Location; Location)
                {

                    trigger OnLookup(Text: Text): Boolean;
                    begin
                        ServiceItem.SETFILTER(ServiceItem."No.", '<>%1', "Base Location");
                        IF PAGE.RUNMODAL(0, ServiceItem) = ACTION::LookupOK THEN BEGIN
                            Location := ServiceItem."No.";
                            Item := ServiceItem."Item No.";
                            Descirption := ServiceItem."Serial No.";
                        END;
                    end;
                }
                field(Item; Item)
                {
                }
                field(Descirption; Descirption)
                {
                }
                field("Minimum Stock Quantity"; "Minimum Stock Quantity")
                {
                }
                field("Warranty Qty"; "Warranty Qty")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean;
    begin
        ServiceItemInsert.SETRANGE("No.", "Base Location");
        IF ServiceItemInsert.FINDFIRST THEN;
    end;

    var
        NetworkDataloggers: Record "Item Wise Min. Req. Qty at Loc";
        ServiceItem: Record "Service Item";
        NetworkDataloggersInsert: Record "Item Wise Min. Req. Qty at Loc";
        ServiceItemInsert: Record "Service Item";
}

