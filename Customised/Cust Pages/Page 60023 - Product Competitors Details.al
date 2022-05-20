page 60023 "Product Competitors Details"
{
    // version B2B1.0,Rev01

    PageType = Worksheet;
    SourceTable = "Product Competitor's Details";

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
                field("Competitor's Name";"Competitor's Name")
                {
                }
                field("Tender No.";"Tender No.")
                {
                }
                field(Specifications;Specifications)
                {
                }
                field("Position No.";"Position No.")
                {
                }
                field(Price;Price)
                {
                }
                field("Service Details";"Service Details")
                {
                }
                field(Features;Features)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("&Attachments")
                {
                    Caption = '&Attachments';
                    Image = Attachments;

                    trigger OnAction();
                    begin
                        Attachments;
                    end;
                }
                separator(Action1102152022)
                {
                }
                action("&Comments")
                {
                    Caption = '&Comments';
                    Image = Comment;
                    RunObject = Page "Rlshp. Mgt. Comment Sheet";
                    RunPageLink = Table Name=CONST(Product Competitor's Details),No.=FIELD(Code),Line No.=FIELD(Line No.);
                }
            }
        }
    }
}

