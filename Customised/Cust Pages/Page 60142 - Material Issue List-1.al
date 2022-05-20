page 60142 "Material Issue List-1"
{
    // version MI1.0,Rev01

    Editable = false;
    PageType = List;
    SourceTable = "Material Issues Header";

    layout
    {
        area(content)
        {
            field("xRec.COUNT";xRec.COUNT)
            {
                Style = Standard;
                StyleExpr = TRUE;
            }
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("No.";"No.")
                {
                }
                field("Transfer-from Code";"Transfer-from Code")
                {
                }
                field("Transfer-to Code";"Transfer-to Code")
                {
                }
                field(Status;Status)
                {
                }
                field("Receipt Date";"Receipt Date")
                {
                }
                field("Posting Date";"Posting Date")
                {
                }
                field("Prod. Order No.";"Prod. Order No.")
                {
                }
                field("Prod. Order Line No.";"Prod. Order Line No.")
                {
                }
                field("User ID";"User ID")
                {
                }
                field("Resource Name";"Resource Name")
                {
                }
                field("Required Date";"Required Date")
                {
                }
                field("Released Date";"Released Date")
                {
                }
                field("Released By";"Released By")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Receipt")
            {
                Caption = '&Receipt';
                action(Card)
                {
                    Caption = 'Card';
                    Image = Card;
                    RunObject = Page Page80003;
                    RunPageLink = Field1=FIELD(No.);
                    ShortCutKey = 'Shift+F7';
                }
            }
        }
    }
}

