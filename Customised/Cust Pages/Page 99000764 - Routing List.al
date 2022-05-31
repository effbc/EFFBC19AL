page 99000764 "Routing List"
{
    // version NAVW17.00

    CaptionML = ENU = 'Routing List',
                ENN = 'Routing List';
    CardPageID = Routing;
    DataCaptionFields = "No.", Description;
    Editable = false;
    PageType = List;
    SourceTable = "Routing Header";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("No."; "No.")
                {
                    Style = Favorable;
                    StyleExpr = Running_bom_flag;
                }
                field(Description; Description)
                {
                    Style = Unfavorable;
                    StyleExpr = old_bom_flag;
                }
                field(Type; Type)
                {
                    Visible = false;
                }
                field(Status; Status)
                {
                    Visible = false;
                }
                field("Version Nos."; "Version Nos.")
                {
                    Visible = false;
                }
                field("Last Date Modified"; "Last Date Modified")
                {
                    Visible = false;
                }
            }
            field("xRec.COUNTAPPROX"; xRec.COUNTAPPROX)
            {
            }
            group(Control1102152000)
            {
                ShowCaption = false;
                grid(Control1102152001)
                {
                    ShowCaption = false;
                    group(Control1102152003)
                    {
                        ShowCaption = false;
                        field("Bom Status Running"; "Bom Status Running")
                        {
                            Style = Favorable;
                            StyleExpr = TRUE;
                        }
                        field("Bom Status old"; "Bom Status old")
                        {
                            Style = Unfavorable;
                            StyleExpr = TRUE;
                        }
                    }
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
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Routing")
            {
                CaptionML = ENU = '&Routing',
                            ENN = '&Routing';
                Image = Route;
                action("Co&mments")
                {
                    CaptionML = ENU = 'Co&mments',
                                ENN = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Manufacturing Comment Sheet";
                    RunPageLink = Table Name=CONST(Routing Header),No.=FIELD(No.);
                }
                action("&Versions")
                {
                    CaptionML = ENU='&Versions',
                                ENN='&Versions';
                    Image = RoutingVersions;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Routing Version List";
                                    RunPageLink = Routing No.=FIELD(No.);
                }
                action("Where-used")
                {
                    CaptionML = ENU='Where-used',
                                ENN='Where-used';
                    Image = "Where-Used";
                    RunObject = Page "Where-Used Item List";
                                    RunPageLink = Routing No.=FIELD(No.);
                    RunPageView = SORTING(Routing No.);
                }
            }
        }
        area(reporting)
        {
            action("Routing Sheet")
            {
                CaptionML = ENU='Routing Sheet',
                            ENN='Routing Sheet';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Routing Sheet";
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        Running_bom_flag:= FALSE;
        old_bom_flag:= FALSE;
        pbh.RESET;
        pbh.SETFILTER("No.",Rec."No.");
        IF pbh.FINDSET THEN
          REPEAT
            BEGIN
              IF pbh."BOM Running Status" = pbh."BOM Running Status"::Running THEN
                  Running_bom_flag:= TRUE
              ELSE IF pbh."BOM Running Status" = pbh."BOM Running Status"::Old THEN
                  old_bom_flag := TRUE
                  ELSE
                  BEGIN
                   Running_bom_flag := FALSE;
                    old_bom_flag:= FALSE
                  END
            END;
            UNTIL pbh.NEXT =0;
    end;

    var
        "Bom Status Running" : Label 'Running Bom';
        "Bom Status old" : Label 'Old Bom';
        Running_bom_flag : Boolean;
        old_bom_flag : Boolean;
        BOM_No_Clr : Boolean;
        pbh : Record "Production BOM Header";
}

