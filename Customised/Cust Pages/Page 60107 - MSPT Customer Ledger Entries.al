page 60107 "MSPT Customer Ledger Entries"
{
    // version MSPT1.0,Rev01

    // B2B Software Technologies
    // ---------------------------------------------------
    // Project : Mile Stone Payment Terms
    // B2B
    // No. sign   Description
    // ---------------------------------------------------
    // 01  B2B    MSPT Customer Ledger Entry

    DataCaptionFields = "Customer No.";
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "MSPT Customer Ledger Entry";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
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
                    Editable = true;
                }
                field("MSPT Percentage";"MSPT Percentage")
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
                field("MSPT Due Date";"MSPT Due Date")
                {
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
                action("MSPT &Dtld Cust Ledg Entry")
                {
                    Caption = 'MSPT &Dtld Cust Ledg Entry';
                    Image = LedgerEntries;
                    RunObject = Page "MSPT Dtld. Cust. Ledg. Entries";
                    RunPageLink = MSPT Cust. Led. Entry No.=FIELD(MSPT Entry No.);
                }
            }
        }
    }
}

