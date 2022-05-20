page 99000765 "Routing Lines"
{
    // version NAVW19.00.00.45778

    CaptionML = ENU='Lines',
                ENN='Lines';
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
                field("Operation No.";"Operation No.")
                {
                }
                field("Operation Description";"Operation Description")
                {
                }
                field(Recalculate;Recalculate)
                {
                }
                field("Previous Operation No.";"Previous Operation No.")
                {
                    Visible = false;
                }
                field("Next Operation No.";"Next Operation No.")
                {
                }
                field("Sub Assembly";"Sub Assembly")
                {
                }
                field("QAS/MPR";"QAS/MPR")
                {
                }
                field("Qty. Produced";"Qty. Produced")
                {
                    Visible = false;
                }
                field("Lot Size";"Lot Size")
                {
                }
                field("Sub Assembly Unit of Meas.Code";"Sub Assembly Unit of Meas.Code")
                {
                    Visible = false;
                }
                field("Spec Id";"Spec Id")
                {
                }
                field("QC Enabled";"QC Enabled")
                {
                }
                field("Sub Assembly Description";"Sub Assembly Description")
                {
                    Visible = false;
                }
                field(Type;Type)
                {
                }
                field("No.";"No.")
                {
                }
                field("Standard Task Code";"Standard Task Code")
                {
                    Visible = false;
                }
                field("Routing Link Code";"Routing Link Code")
                {
                    Visible = false;
                }
                field(Description;Description)
                {
                }
                field(Start_Day;Start_Day)
                {
                }
                field("Setup Time";"Setup Time")
                {
                }
                field("Setup Time Unit of Meas. Code";"Setup Time Unit of Meas. Code")
                {
                    Visible = false;
                }
                field("Run Time";"Run Time")
                {
                }
                field("Run Time Unit of Meas. Code";"Run Time Unit of Meas. Code")
                {
                    Visible = false;
                }
                field("Wait Time";"Wait Time")
                {
                    Visible = false;
                }
                field("Wait Time Unit of Meas. Code";"Wait Time Unit of Meas. Code")
                {
                    Visible = false;
                }
                field("Move Time";"Move Time")
                {
                    Visible = false;
                }
                field("Move Time Unit of Meas. Code";"Move Time Unit of Meas. Code")
                {
                    Visible = false;
                }
                field("Fixed Scrap Quantity";"Fixed Scrap Quantity")
                {
                    Visible = false;
                }
                field("Scrap Factor %";"Scrap Factor %")
                {
                    Visible = false;
                }
                field("Minimum Process Time";"Minimum Process Time")
                {
                    Visible = false;
                }
                field("Maximum Process Time";"Maximum Process Time")
                {
                    Visible = false;
                }
                field("Concurrent Capacities";"Concurrent Capacities")
                {
                    Visible = false;
                }
                field("Send-Ahead Quantity";"Send-Ahead Quantity")
                {
                    Visible = false;
                }
                field("Unit Cost per";"Unit Cost per")
                {
                }
                field("Work Center Group Code";"Work Center Group Code")
                {
                }
                field("Main Group";"Main Group")
                {
                }
                field("Sub Group";"Sub Group")
                {
                }
                field("Operation Number";"Operation Number")
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
                CaptionML = ENU='&Operation',
                            ENN='&Operation';
                Image = Task;
                action("Co&mments")
                {
                    CaptionML = ENU='Co&mments',
                                ENN='Co&mments';
                    Image = ViewComments;

                    trigger OnAction();
                    begin
                        ShowComment;
                    end;
                }
                action("&Tools")
                {
                    CaptionML = ENU='&Tools',
                                ENN='&Tools';
                    Image = Tools;

                    trigger OnAction();
                    begin
                        ShowTools;
                    end;
                }
                action("&Personnel")
                {
                    CaptionML = ENU='&Personnel',
                                ENN='&Personnel';
                    Image = User;

                    trigger OnAction();
                    begin
                        ShowPersonnel;
                    end;
                }
                action("&Quality Measures")
                {
                    CaptionML = ENU='&Quality Measures',
                                ENN='&Quality Measures';

                    trigger OnAction();
                    begin
                        ShowQualityMeasures;
                    end;
                }
            }
        }
    }

    trigger OnQueryClosePage(CloseAction : Action) : Boolean;
    begin
        IF USERID <> 'EFFTRONICS\VISHNUPRIYA' THEN
        BEGIN
        Rec.SETCURRENTKEY("Routing No.","Version Code","Operation No.");
        Rec.SETFILTER("Operation No.",'<>%1','');
        IF Rec.FINDSET THEN
          REPEAT
            BEGIN
              IF FORMAT(Rec.Start_Day) ='' THEN
                ERROR('Fill the Start day for the Activity');
            END
          UNTIL Rec.NEXT =0;
        END
    end;

    var
        RtngComment : Record "Routing Comment Line";

    [LineStart(23730)]
    local procedure ShowComment();
    begin
        RtngComment.SETRANGE("Routing No.","Routing No.");
        RtngComment.SETRANGE("Operation No.","Operation No.");
        RtngComment.SETRANGE("Version Code","Version Code");

        PAGE.RUN(PAGE::"Routing Comment Sheet",RtngComment);
    end;

    [LineStart(23737)]
    local procedure ShowTools();
    var
        RtngTool : Record "Routing Tool";
    begin
        RtngTool.SETRANGE("Routing No.","Routing No.");
        RtngTool.SETRANGE("Version Code","Version Code");
        RtngTool.SETRANGE("Operation No.","Operation No.");

        PAGE.RUN(PAGE::"Routing Tools",RtngTool);
    end;

    [LineStart(23744)]
    local procedure ShowPersonnel();
    var
        RtngPersonnel : Record "Routing Personnel";
    begin
        RtngPersonnel.SETRANGE("Routing No.","Routing No.");
        RtngPersonnel.SETRANGE("Version Code","Version Code");
        RtngPersonnel.SETRANGE("Operation No.","Operation No.");

        PAGE.RUN(PAGE::"Routing Personnel",RtngPersonnel);
    end;

    [LineStart(23751)]
    local procedure ShowQualityMeasures();
    var
        RtngQltyMeasure : Record "Routing Quality Measure";
    begin
        RtngQltyMeasure.SETRANGE("Routing No.","Routing No.");
        RtngQltyMeasure.SETRANGE("Version Code","Version Code");
        RtngQltyMeasure.SETRANGE("Operation No.","Operation No.");

        PAGE.RUN(PAGE::"Routing Quality Measures",RtngQltyMeasure);
    end;
}

