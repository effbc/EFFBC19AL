page 60105 "MSPT Order Details"
{
    // version MSPT1.0

    // B2B Software Technologies
    // ---------------------------------------------------
    // Project : Mile Stone Payment Terms
    // B2B
    // No. sign   Description
    // ---------------------------------------------------
    // 01  B2B    MSPT Order Details

    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "MSPT Order Details";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("MSPT Code";"MSPT Code")
                {
                    Editable = false;
                }
                field(Percentage;Percentage)
                {
                }
                field(Description;Description)
                {
                }
                field("Calculation Period";"Calculation Period")
                {
                }
                field("Due Date";"Due Date")
                {
                    Editable = false;
                }
                field(Remarks;Remarks)
                {
                }
            }
        }
    }

    actions
    {
    }
}

