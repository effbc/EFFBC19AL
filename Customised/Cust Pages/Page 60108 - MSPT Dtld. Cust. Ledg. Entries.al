page 60108 "MSPT Dtld. Cust. Ledg. Entries"
{
    // version MSPT1.0

    // B2B Software Technologies
    // ---------------------------------------------------
    // Project : Mile Stone Payment Terms
    // B2B
    // No. sign   Description
    // ---------------------------------------------------
    // 01  B2B    MSPT Detailed Cusotmer Ledger Entry

    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "MSPT Dtld. Cust. Ledg. Entry";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Entry No.";"Entry No.")
                {
                }
                field("Cust. Ledger Entry No.";"Cust. Ledger Entry No.")
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
                field("Customer No.";"Customer No.")
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
                field("MSPT Cust. Led. Entry No.";"MSPT Cust. Led. Entry No.")
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

