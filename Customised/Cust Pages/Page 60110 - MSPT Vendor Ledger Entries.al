page 60110 "MSPT Vendor Ledger Entries"
{
    // version MSPT1.0,Rev01

    // B2B Software Technologies
    // ---------------------------------------------------
    // Project : Mile Stone Payment Terms
    // B2B
    // No. sign   Description
    // ---------------------------------------------------
    // 01  B2B    MSPT Vendor Ledger Entry

    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "MSPT Vendor Ledger Entry";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("Posting Date";"Posting Date")
                {
                    Editable = false;
                }
                field("Document Type";"Document Type")
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
                field(Open;Open)
                {
                    Editable = false;
                }
                field("MSPT Header Code";"MSPT Header Code")
                {
                    Editable = false;
                }
                field("MSPT Line Code";"MSPT Line Code")
                {
                    Editable = false;
                }
                field("MSPT Amount";"MSPT Amount")
                {
                    Editable = false;
                }
                field("MSPT Remaining Amount";"MSPT Remaining Amount")
                {
                    Editable = false;
                }
                field("MSPT Due Date";"MSPT Due Date")
                {
                }
                field("Entry No.";"Entry No.")
                {
                    Editable = false;
                }
                field("MSPT Entry No.";"MSPT Entry No.")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Ent&ry")
            {
                Caption = 'Ent&ry';
                action("MSPT &Dtld Vend Ledg Entries")
                {
                    Caption = 'MSPT &Dtld Vend Ledg Entries';
                    Image = LedgerEntries;
                    RunObject = Page "MSPT Dtld.Vendor Ledg. Entries";
                    RunPageLink = MSPT Vend. Led. Entry No.=FIELD(MSPT Entry No.);
                }
            }
        }
    }
}

