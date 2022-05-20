page 60101 "MSPT Header List"
{
    // version MSPT1.0

    // B2B Software Technologies
    // ---------------------------------------------------
    // Project : Mile Stone Payment Terms
    // B2B
    // No. sign   Description
    // ---------------------------------------------------
    // 01  B2B    MSPT Header List

    CardPageID = "Mile Stone Payments";
    Editable = false;
    PageType = List;
    SourceTable = "MSPT Header";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("Code";Code)
                {
                }
                field(Description;Description)
                {
                }
                field(Status;Status)
                {
                }
            }
        }
    }

    actions
    {
    }
}

