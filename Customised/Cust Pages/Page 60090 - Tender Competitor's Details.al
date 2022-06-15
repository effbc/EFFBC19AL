page 60090 "Tender Competitor's Details"
{
    // version B2B1.0

    AutoSplitKey = true;
    PageType = Worksheet;
    SourceTable = "Tender Competitor's Details";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("Competitor's Code"; "Competitor's Code")
                {
                }
                field("Competitor's Name"; "Competitor's Name")
                {
                }
                field("Item No."; "Item No.")
                {
                }
                field("Item Description"; "Item Description")
                {
                }
                field("Technical Details"; "Technical Details")
                {
                }
                field(Percentage; Percentage)
                {
                }
                field("Schedule A Percentage"; "Schedule A Percentage")
                {
                }
                field("Schedule B Percentage"; "Schedule B Percentage")
                {
                }
                field("Schedule C Percentage"; "Schedule C Percentage")
                {
                }
                field(structure; structure)
                {
                }
                field("Other Details"; "Other Details")
                {
                }
                field(Price; Price)
                {
                }
                field("BID Status"; "BID Status")
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        TC: Record "Tender Competitor's Details";
}

