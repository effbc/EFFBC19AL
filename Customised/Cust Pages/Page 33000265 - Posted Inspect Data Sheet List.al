page 33000265 "Posted Inspect Data Sheet List"
{
    // version QC1.0

    CardPageID = "Posted Inspection Data Sheet";
    Editable = false;
    PageType = List;
    SourceTable = "Posted Inspect DatasheetHeader";

    layout
    {
        area(content)
        {
            field("xRec.COUNT"; xRec.COUNT)
            {
                Style = Standard;
                StyleExpr = TRUE;
            }
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("No."; "No.")
                {
                }
                field("Serial No."; "Serial No.")
                {
                }
                field(Description; Description)
                {
                }
                field("OutPut Jr Serial No."; "OutPut Jr Serial No.")
                {
                }
                field("Reason for Pending"; "Reason for Pending")
                {
                }
                field("Lot No."; "Lot No.")
                {
                }
                field("Posted By"; "Posted By")
                {
                }
                field("Item Category Code"; "Item Category Code")
                {
                }
                field("Product Group Code"; "Product Group Code")
                {
                }
                field("Item Sub Group Code"; "Item Sub Group Code")
                {
                }
                field("Item Sub Sub Group Code"; "Item Sub Sub Group Code")
                {
                }
                field("Prod. Description"; "Prod. Description")
                {
                }
                field("Operation Description"; "Operation Description")
                {
                }
                field("Prod. Order No."; "Prod. Order No.")
                {
                }
                field("Prod. Order Line"; "Prod. Order Line")
                {
                }
                field("Rework Level"; "Rework Level")
                {
                }
                field("Rework Reference No."; "Rework Reference No.")
                {
                }
                field("Item Ledger Entry No."; "Item Ledger Entry No.")
                {
                }
                field("Receipt No."; "Receipt No.")
                {
                }
                field("Order No."; "Order No.")
                {
                }
                field("Posting Date"; "Posting Date")
                {
                }
                field("Document Date"; "Document Date")
                {
                }
                field("Vendor Name"; "Vendor Name")
                {
                }
                field("Item No."; "Item No.")
                {
                }
                field("Item Description"; "Item Description")
                {
                }
                field(Quantity; Quantity)
                {
                }
                field("Spec ID"; "Spec ID")
                {
                }
                field("Inspection Group Code"; "Inspection Group Code")
                {
                }
                field("Issues For Pending"; "Issues For Pending")
                {
                }
            }
        }
    }

    actions
    {
    }
}

