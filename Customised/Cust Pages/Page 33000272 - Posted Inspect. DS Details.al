page 33000272 "Posted Inspect. DS Details"
{
    // version QC1.0,Rev01

    Editable = false;
    PageType = List;
    SourceTable = "Posted Inspect DatasheetHeader";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("No.";"No.")
                {
                }
                field("Posted By";"Posted By")
                {
                }
                field("Posted Date";"Posted Date")
                {
                }
                field("Posted Time";"Posted Time")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("&Show")
            {
                Caption = '&Show';
                Image = ShowSelected;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Posted Inspection Data Sheet";
                RunPageLink = No.=FIELD(No.);
            }
        }
    }
}

