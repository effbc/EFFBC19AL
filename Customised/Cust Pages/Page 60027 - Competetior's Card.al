page 60027 "Competetior's Card"
{
    // version B2B1.0,Rev01

    PageType = Card;
    SourceTable = "Competitor's Master";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Code"; Code)
                {

                    trigger OnAssistEdit();
                    begin
                        IF AssistEdit(xRec) THEN
                            CurrPage.UPDATE;
                    end;
                }
                field("Competitor's Name"; "Competitor's Name")
                {
                }
                field("Competitor's Name 2"; "Competitor's Name 2")
                {
                }
                field("Competitor's Address"; "Competitor's Address")
                {
                }
                field("Competitor's Address 2"; "Competitor's Address 2")
                {
                }
                field("Post Code"; "Post Code")
                {
                }
                field(City; City)
                {
                    Caption = 'City / Post Code';
                }
                field("Country Code"; "Country Code")
                {
                }
                field(County; County)
                {
                    Caption = 'County Code / Country';
                }
                field(State; State)
                {
                }
                field("Competitor's Contact"; "Competitor's Contact")
                {
                }
                field("Phone No."; "Phone No.")
                {
                }
                field("Telex No."; "Telex No.")
                {
                }
                field("Fax No."; "Fax No.")
                {
                }
                field("E-Mail"; "E-Mail")
                {
                }
                field("Home Page"; "Home Page")
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
                        OpenAttachments;
                    end;
                }
                action("&Comments")
                {
                    Caption = '&Comments';
                    Image = Comment;
                    RunObject = Page "Rlshp. Mgt. Comment Sheet";
                    RunPageLink = Table Name=CONST(Competitor's Master),No.=FIELD(Code);
                    Visible = false;
                }
            }
            action(Comment)
            {
                Caption = 'Comment';
                Image = Comment;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Rlshp. Mgt. Comment Sheet";
                RunPageLink = Table Name=CONST(Products),No.=FIELD(Code);
                ToolTip = 'Comment';
            }
        }
    }
}

