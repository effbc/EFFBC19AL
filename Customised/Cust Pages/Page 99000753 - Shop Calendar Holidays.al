page 99000753 "Shop Calendar Holidays"
{
    // version NAVW17.00

    CaptionML = ENU = 'Shop Calendar Holidays',
                ENN = 'Shop Calendar Holidays';
    DataCaptionFields = "Shop Calendar Code";
    DelayedInsert = true;
    PageType = List;
    SourceTable = "Shop Calendar Holiday";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field(Date; Date)
                {
                    Visible = true;
                }
                field("Starting Date-Time"; "Starting Date-Time")
                {
                    Visible = false;
                }
                field("Starting Time"; "Starting Time")
                {
                    Visible = true;
                }
                field("Ending Date-Time"; "Ending Date-Time")
                {
                    Visible = false;
                }
                field("Ending Time"; "Ending Time")
                {
                }
                field(Description; Description)
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = false;
            }
        }
    }

    actions
    {
    }
}

