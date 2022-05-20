page 60076 "Calibration Card"
{
    // version B2B1.0,Rev01

    PageType = Card;
    SourceTable = "Calibration Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No.";"No.")
                {
                }
                field(Name;Name)
                {
                }
                field("Equipment Type";"Equipment Type")
                {
                }
                field(UOM;UOM)
                {
                }
                field("Calibration Next Due Date";"Calibration Next Due Date")
                {
                }
                field(Frequency;Frequency)
                {
                }
                field("Notice Period";"Notice Period")
                {
                }
                field("Usage Type";"Usage Type")
                {
                }
                field("Least Count";"Least Count")
                {
                }
                field("Current Status";"Current Status")
                {
                }
                field(Remarks;Remarks)
                {
                }
                field("Inspection Party";"Inspection Party")
                {
                }
                field(Agency;Agency)
                {
                }
                field("Purpose of Instrument";"Purpose of Instrument")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Calibration")
            {
                Caption = '&Calibration';
                action("&List")
                {
                    Caption = '&List';
                    Image = List;
                    RunObject = Page "Calibration List";
                    ShortCutKey = 'F5';
                }
                separator(Action1102152032)
                {
                }
                action("&Comments")
                {
                    Caption = '&Comments';
                    RunObject = Page "Quality Comment Sheet";
                    RunPageLink = Type=CONST(Calibration),No.=FIELD(No.);
                    Visible = false;
                }
                separator(Action1102152034)
                {
                }
                action("&Attachments")
                {
                    Caption = '&Attachments';
                    Image = Attachments;

                    trigger OnAction();
                    begin
                        TenderAttachments;
                    end;
                }
            }
        }
        area(processing)
        {
            action(Comment)
            {
                Caption = 'Comment';
                Image = Comment;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Quality Comment Sheet";
                RunPageLink = Type=CONST(Calibration),No.=FIELD(No.);
                ToolTip = 'Comment';
            }
        }
    }
}

