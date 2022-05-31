page 99000779 "Stop Codes"
{
    // version NAVW17.00

    CaptionML = ENU = 'Stop Codes',
                ENN = 'Stop Codes';
    PageType = List;
    SourceTable = Stop;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Code"; Code)
                {
                }
                field(Description; Description)
                {
                }
                field(Department; Department)
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

