page 33000285 "Sub Assembly List"
{
    // version WIP1.0

    CardPageID = "Sub Assembly Card";
    Editable = false;
    PageType = List;
    SourceTable = "Sub Assembly";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("No."; "No.")
                {
                }
                field(Description; Description)
                {
                }
                field("Search Name"; "Search Name")
                {
                }
                field("Spec Id"; "Spec Id")
                {
                }
                field("QC Enabled"; "QC Enabled")
                {
                }
                field("Unit Of Measure Code"; "Unit Of Measure Code")
                {
                }
                field(Block; Block)
                {
                }
            }
        }
    }

    actions
    {
    }
}

