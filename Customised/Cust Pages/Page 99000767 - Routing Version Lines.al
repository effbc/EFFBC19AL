page 99000767 "Routing Version Lines"
{
    // version NAVW19.00.00.45778

    CaptionML = ENU = 'Lines',
                ENN = 'Lines';
    DelayedInsert = true;
    LinksAllowed = false;
    PageType = ListPart;
    SourceTable = "Routing Line";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Operation No."; "Operation No.")
                {
                }
                field("Operation Description"; "Operation Description")
                {
                }
                field("Next Operation No."; "Next Operation No.")
                {
                    Visible = false;
                }
                field(Type; Type)
                {
                }
                field("No."; "No.")
                {
                }
                field("Standard Task Code"; "Standard Task Code")
                {
                    Visible = false;
                }
                field("Routing Link Code"; "Routing Link Code")
                {
                    Visible = false;
                }
                field(Description; Description)
                {
                }
                field("Setup Time"; "Setup Time")
                {
                }
                field("Setup Time Unit of Meas. Code"; "Setup Time Unit of Meas. Code")
                {
                    Visible = false;
                }
                field("Run Time"; "Run Time")
                {
                }
                field("Run Time Unit of Meas. Code"; "Run Time Unit of Meas. Code")
                {
                    Visible = false;
                }
                field("Wait Time"; "Wait Time")
                {
                }
                field("Wait Time Unit of Meas. Code"; "Wait Time Unit of Meas. Code")
                {
                    Visible = false;
                }
                field("Move Time"; "Move Time")
                {
                }
                field("Move Time Unit of Meas. Code"; "Move Time Unit of Meas. Code")
                {
                    Visible = false;
                }
                field("Fixed Scrap Quantity"; "Fixed Scrap Quantity")
                {
                }
                field("Scrap Factor %"; "Scrap Factor %")
                {
                }
                field("Minimum Process Time"; "Minimum Process Time")
                {
                    Visible = false;
                }
                field("Maximum Process Time"; "Maximum Process Time")
                {
                    Visible = false;
                }
                field("Concurrent Capacities"; "Concurrent Capacities")
                {
                }
                field("Send-Ahead Quantity"; "Send-Ahead Quantity")
                {
                }
                field("Unit Cost per"; "Unit Cost per")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Operation")
            {
                CaptionML = ENU = '&Operation',
                            ENN = '&Operation';
                Image = Task;
                action("Co&mments")
                {
                    CaptionML = ENU = 'Co&mments',
                                ENN = 'Co&mments';
                    Image = ViewComments;

                    trigger OnAction();
                    begin
                        ShowComment;
                    end;
                }
                action(Tools)
                {
                    CaptionML = ENU = 'Tools',
                                ENN = 'Tools';
                    Image = Tools;

                    trigger OnAction();
                    begin
                        ShowTools;
                    end;
                }
                action(Personnel)
                {
                    CaptionML = ENU = 'Personnel',
                                ENN = 'Personnel';
                    Image = User;

                    trigger OnAction();
                    begin
                        ShowPersonnel;
                    end;
                }
                action("Quality Measures")
                {
                    CaptionML = ENU = 'Quality Measures',
                                ENN = 'Quality Measures';

                    trigger OnAction();
                    begin
                        ShowQualityMeasures;
                    end;
                }
            }
        }
    }

    var
        RtngComment: Record "Routing Comment Line";
        Text001: TextConst ENU = 'Operation No. must be filled in. Enter a value.', ENN = 'Operation No. must be filled in. Enter a value.';

    [LineStart(23768)]
    local procedure ShowComment();
    begin
        IF "Operation No." = '' THEN
            ERROR(Text001);

        RtngComment.SETRANGE("Routing No.", "Routing No.");
        RtngComment.SETRANGE("Operation No.", "Operation No.");
        RtngComment.SETRANGE("Version Code", "Version Code");

        PAGE.RUN(PAGE::"Routing Comment Sheet", RtngComment);
    end;

    [LineStart(23778)]
    local procedure ShowTools();
    var
        RtngTool: Record "Routing Tool";
    begin
        RtngTool.SETRANGE("Routing No.", "Routing No.");
        RtngTool.SETRANGE("Version Code", "Version Code");
        RtngTool.SETRANGE("Operation No.", "Operation No.");

        PAGE.RUN(PAGE::"Routing Tools", RtngTool);
    end;

    [LineStart(23785)]
    local procedure ShowPersonnel();
    var
        RtngPersonnel: Record "Routing Personnel";
    begin
        RtngPersonnel.SETRANGE("Routing No.", "Routing No.");
        RtngPersonnel.SETRANGE("Version Code", "Version Code");
        RtngPersonnel.SETRANGE("Operation No.", "Operation No.");

        PAGE.RUN(PAGE::"Routing Personnel", RtngPersonnel);
    end;

    [LineStart(23792)]
    local procedure ShowQualityMeasures();
    var
        RtngQltyMeasure: Record "Routing Quality Measure";
    begin
        RtngQltyMeasure.SETRANGE("Routing No.", "Routing No.");
        RtngQltyMeasure.SETRANGE("Version Code", "Version Code");
        RtngQltyMeasure.SETRANGE("Operation No.", "Operation No.");

        PAGE.RUN(PAGE::"Routing Quality Measures", RtngQltyMeasure);
    end;
}

