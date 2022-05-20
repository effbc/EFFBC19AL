page 33000274 "Quality Item Ledger Entries"
{
    // version QC1.0

    Editable = true;
    PageType = List;
    Permissions = TableData "Quality Item Ledger Entry"=rm;
    SourceTable = "Quality Item Ledger Entry";

    layout
    {
        area(content)
        {
            field("COUNT";COUNT)
            {
            }
            repeater(Control1000000000)
            {
                Editable = true;
                ShowCaption = false;
                field("Entry No.";"Entry No.")
                {
                    Editable = true;
                }
                field("Item No.";"Item No.")
                {
                    Editable = false;
                }
                field("Posting Date";"Posting Date")
                {
                    Editable = false;
                }
                field("Entry Type";"Entry Type")
                {
                    Editable = false;
                }
                field("Source No.";"Source No.")
                {
                    Editable = false;
                }
                field("Document No.";"Document No.")
                {
                    Editable = false;
                }
                field(Description;Description)
                {
                    Editable = false;
                }
                field("Child Ids";"Child Ids")
                {
                    Editable = false;
                }
                field("Location Code";"Location Code")
                {
                    Editable = false;
                }
                field(Quantity;Quantity)
                {
                    Editable = false;
                }
                field("Remaining Quantity";"Remaining Quantity")
                {
                    Editable = false;
                }
                field("Invoiced Quantity";"Invoiced Quantity")
                {
                    Editable = false;
                }
                field("Applies-to Entry";"Applies-to Entry")
                {
                    Editable = false;
                }
                field(Open;Open)
                {
                    Editable = false;
                }
                field("Source Type";"Source Type")
                {
                    Editable = false;
                }
                field("Document Date";"Document Date")
                {
                    Editable = false;
                }
                field("External Document No.";"External Document No.")
                {
                    Editable = false;
                }
                field("Prod. Order No.";"Prod. Order No.")
                {
                    Editable = false;
                }
                field("Variant Code";"Variant Code")
                {
                    Editable = false;
                }
                field("Qty. per Unit of Measure";"Qty. per Unit of Measure")
                {
                    Editable = false;
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                    Editable = false;
                }
                field("Originally Ordered No.";"Originally Ordered No.")
                {
                    Editable = false;
                }
                field("Originally Ordered Var. Code";"Originally Ordered Var. Code")
                {
                    Editable = false;
                }
                field("Item Category Code";"Item Category Code")
                {
                    Editable = false;
                }
                field("Product Group Code";"Product Group Code")
                {
                    Editable = false;
                }
                field("Prod. Order Line No.";"Prod. Order Line No.")
                {
                    Editable = false;
                }
                field("Serial No.";"Serial No.")
                {
                    Editable = true;
                }
                field("Lot No.";"Lot No.")
                {
                    Editable = false;
                }
                field("Warranty Date";"Warranty Date")
                {
                    Editable = false;
                }
                field("Expiration Date";"Expiration Date")
                {
                    Editable = false;
                }
                field("Return Reason Code";"Return Reason Code")
                {
                    Editable = false;
                }
                field("Declared Goods";"Declared Goods")
                {
                    Editable = false;
                }
                field("Inspection Status";"Inspection Status")
                {
                    Editable = false;
                }
                field("Quality Ledger Entry No.";"Quality Ledger Entry No.")
                {
                    Editable = true;
                }
                field(Accept;Accept)
                {
                    Editable = false;
                }
                field(Rework;Rework)
                {
                    Editable = false;
                }
                field(Reject;Reject)
                {
                    Editable = false;
                }
                field("Accept Under Deviation";"Accept Under Deviation")
                {
                    Editable = false;
                }
                field(Select;Select)
                {
                }
                field("Purch.Rcpt Line";"Purch.Rcpt Line")
                {
                }
            }
        }
    }

    actions
    {
    }
}

