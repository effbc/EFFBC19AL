page 60106 "MSPT Posted Order Details"
{
    // version MSPT1.0

    // B2B Software Technologies
    // ---------------------------------------------------
    // Project : Mile Stone Payment Terms
    // B2B
    // No. sign   Description
    // ---------------------------------------------------
    // 01  B2B    MSPT Posted Order Details

    Editable = false;
    PageType = List;
    SourceTable = "Posted MSPT Order Details";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("Document No."; "Document No.")
                {
                }
                field("Party No."; "Party No.")
                {
                }
                field("MSPT Header Code"; "MSPT Header Code")
                {
                }
                field("MSPT Code"; "MSPT Code")
                {
                }
                field(Percentage; Percentage)
                {
                }
                field(Description; Description)
                {
                }
                field("Calulation Period"; "Calulation Period")
                {
                }
                field("Due Date"; "Due Date")
                {
                }
                field(Remarks; Remarks)
                {
                }
            }
        }
    }

    actions
    {
    }
}

