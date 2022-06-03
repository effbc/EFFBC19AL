page 60235 "Issue Track Detailed Desc."
{
    // version TRACK

    AutoSplitKey = true;
    DelayedInsert = true;
    PageType = Worksheet;
    ShowFilter = false;
    SourceTable = "Issue Tracker Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Detailed Descrption"; "Detailed Descrption")
                {
                }
                field("Logged DateTime"; "Logged DateTime")
                {
                }
                field("Logged By"; "Logged By")
                {
                }
            }
        }
    }

    actions
    {
    }
}

