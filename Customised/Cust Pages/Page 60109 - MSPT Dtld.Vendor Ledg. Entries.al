page 60109 "MSPT Dtld.Vendor Ledg. Entries"
{
    // version MSPT1.0

    // B2B Software Technologies
    // ---------------------------------------------------
    // Project : Mile Stone Payment Terms
    // B2B
    // No. sign   Description
    // ---------------------------------------------------
    // 01  B2B    MSPT Detailed Vendor Ledger Entry

    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "MSPT Dtld. Vendor Ledg. Entry";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("Entry No.";"Entry No.")
                {
                }
                field("Vendor Ledger Entry No.";"Vendor Ledger Entry No.")
                {
                }
                field("Entry Type";"Entry Type")
                {
                }
                field("Posting Date";"Posting Date")
                {
                }
                field("Document Type";"Document Type")
                {
                }
                field("Document No.";"Document No.")
                {
                }
                field("Vendor No.";"Vendor No.")
                {
                }
                field("MSPT Header Code";"MSPT Header Code")
                {
                }
                field("MSPT Line Code";"MSPT Line Code")
                {
                    Editable = false;
                }
                field("MSPT Amount";"MSPT Amount")
                {
                }
                field("MSPT Due Date";"MSPT Due Date")
                {
                }
                field("MSPT Vend. Led. Entry No.";"MSPT Vend. Led. Entry No.")
                {
                }
                field("MSPT Dtld. Entry No.";"MSPT Dtld. Entry No.")
                {
                }
            }
        }
    }

    actions
    {
    }
}

