page 60034 "Inst. PreSite Check List"
{
    // version B2B1.0,Rev01

    AutoSplitKey = true;
    PageType = List;
    SourceTable = "Inst. PreSite Check List";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("Pre Site Parameter"; "Pre Site Parameter")
                {
                }
                field(Description; Description)
                {
                }
                field(Remarks; Remarks)
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
                action("&Comments")
                {
                    Caption = '&Comments';
                    Image = Comment;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = Table Name=CONST(IC Partner),No.=FIELD(Sales Order No.),Line No.=FIELD(Line No.);
                }
                separator(Action1102152003)
                {
                }
                action("&Attachments")
                {
                    Caption = '&Attachments';
                    Image = Attachments;

                    trigger OnAction();
                    begin
                        Attachments;
                    end;
                }
                separator(Action1102152014)
                {
                }
                action("Copy &Presite")
                {
                    Caption = 'Copy &Presite';
                    Image = CopyItem;

                    trigger OnAction();
                    begin
                        CopyPresite(Rec);
                    end;
                }
            }
        }
    }
}

