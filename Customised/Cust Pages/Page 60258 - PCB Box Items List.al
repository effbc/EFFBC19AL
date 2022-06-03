page 60258 "PCB Box Items List"
{
    Editable = true;
    InsertAllowed = false;
    PageType = List;
    Permissions = TableData "PCB Box data" = rm;
    SourceTable = "PCB Box data";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Product; Product)
                {
                }
                field(CPCB; CPCB)
                {
                }
                field("CPCB Description"; "CPCB Description")
                {
                }
                field("Item No."; "Item No.")
                {
                }
                field(Description; Description)
                {
                }
                field(Quantity; Quantity)
                {
                }
                field(Box; Box)
                {
                }
                field("BOX Sort"; "BOX Sort")
                {
                    Caption = 'Item Seq No';
                }
                field(Color; Color)
                {
                }
                field("Color Code"; "Color Code")
                {

                    trigger OnValidate();
                    begin
                        IF (STRLEN("Color Code") <> 6) AND (STRLEN("Color Code") <> 0) THEN BEGIN
                            ERROR('Please enter correct color code( it must have 6 letters ) ');
                        END;
                    end;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInit();
    begin
        SETCURRENTKEY(Product, CPCB, "Item No.");
    end;
}

