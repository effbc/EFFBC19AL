page 60052 "Specification Parameters"
{
    // version B2B1.0

    PageType = Worksheet;
    SourceTable = "Specification Parameters";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("Code"; Code)
                {
                }
                field(Description; Description)
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean;
    begin
        "User Id" := USERID;
    end;
}

