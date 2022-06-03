page 99000766 Routing
{
    // version NAVW17.00,QC 1.0,QCB2B1.2

    CaptionML = ENU = 'Routing',
                ENN = 'Routing';
    PageType = ListPlus;
    SourceTable = "Routing Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                CaptionML = ENU = 'General',
                            ENN = 'General';
                field("No."; "No.")
                {

                    trigger OnAssistEdit();
                    begin
                        IF AssistEdit(xRec) THEN
                            CurrPage.UPDATE;
                    end;
                }
                field(Description; Description)
                {
                }
                field("Description 2"; "Description 2")
                {
                }
                field(Type; Type)
                {
                }
                field(Status; Status)
                {

                    trigger OnValidate();
                    begin
                        //B2B 1.1
                        IF Status = Status::Certified THEN BEGIN
                            RoutingLine.SETRANGE("Routing No.", "No.");
                            IF RoutingLine.FINDLAST THEN BEGIN
                                RoutingLine."QC Enabled" := FALSE;
                                RoutingLine.MODIFY;
                            END;
                        END;
                        //B2B 1.1
                    end;
                }
                field("Created User Id"; "User Id")
                {
                    Caption = 'Created User Id';
                }
                field("Modifef User ID"; "Modifef User ID")
                {
                }
                field("Search Description"; "Search Description")
                {
                }
                field("Version Nos."; "Version Nos.")
                {
                }
                field(ActiveVersionCode; ActiveVersionCode)
                {
                    CaptionML = ENU = 'Active Version',
                                ENN = 'Active Version';
                    Editable = false;

                    trigger OnLookup(Text: Text): Boolean;
                    var
                        RtngVersion: Record "Routing Version";
                    begin
                        RtngVersion.SETRANGE("Routing No.", "No.");
                        RtngVersion.SETRANGE("Version Code", ActiveVersionCode);
                        PAGE.RUNMODAL(PAGE::"Routing Version", RtngVersion);
                        ActiveVersionCode := VersionMgt.GetRtngVersion("No.", WORKDATE, TRUE);
                    end;
                }
                field("Last Date Modified"; "Last Date Modified")
                {

                    trigger OnValidate();
                    begin
                        LastDateModifiedOnAfterValidat;
                    end;
                }
                field("Man Cost"; "Man Cost")
                {
                }
                field("Tot Man Cost/Hour"; "Tot Man Cost/Hour")
                {
                }
                field("Bench Mark Time(In Hours)"; "Bench Mark Time(In Hours)")
                {
                }
            }
            part(RoutingLine; "Routing Lines")
            {
                SubPageLink = Routing No.=FIELD(No.),Version Code=CONST();
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207;Links)
            {
                Visible = false;
            }
            systempart(Control1905767507;Notes)
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
                CaptionML = ENU='&Routing',
                            ENN='&Routing';
                Image = Route;
                action("Co&mments")
                {
                    CaptionML = ENU='Co&mments',
                                ENN='Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Manufacturing Comment Sheet";
                                    RunPageLink = Table Name=CONST(Routing Header),No.=FIELD(No.);
                }
                action("&Versions")
                {
                    CaptionML = ENU='&Versions',
                                ENN='&Versions';
                    Image = RoutingVersions;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Routing Version List";
                                    RunPageLink = Routing No.=FIELD(No.);
                }
                action("Where-used")
                {
                    CaptionML = ENU='Where-used',
                                ENN='Where-used';
                    Image = "Where-Used";
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Where-Used Item List";
                                    RunPageLink = Routing No.=FIELD(No.);
                    RunPageView = SORTING(Routing No.);
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                CaptionML = ENU='F&unctions',
                            ENN='F&unctions';
                Image = "Action";
                action("Copy &Routing")
                {
                    CaptionML = ENU='Copy &Routing',
                                ENN='Copy &Routing';
                    Ellipsis = true;
                    Image = CopyDocument;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    var
                        FromRtngHeader : Record "Routing Header";
                    begin
                        TESTFIELD("No.");
                        IF PAGE.RUNMODAL(0,FromRtngHeader) = ACTION::LookupOK THEN
                          CopyRouting.CopyRouting(FromRtngHeader."No.",'',Rec,'');
                    end;
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
        ActiveVersionCode :=
          VersionMgt.GetRtngVersion("No.",WORKDATE,TRUE);
    end;

    trigger OnInsertRecord(BelowxRec : Boolean) : Boolean;
    begin
        "User Id" := USERID;
    end;

    var
        VersionMgt : Codeunit VersionManagement;
        CopyRouting : Codeunit "Routing Line-Copy Lines";
        ActiveVersionCode : Code[20];
        RoutingLine : Record "Routing Line";

    [LineStart(23765)]
    local procedure LastDateModifiedOnAfterValidat();
    begin
        CurrPage.UPDATE;
    end;
}

