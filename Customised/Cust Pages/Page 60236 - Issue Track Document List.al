page 60236 "Issue Track Document List"
{
    // version TRACK

    CardPageID = "Issue Track Document";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    RefreshOnActivate = true;
    SourceTable = "Issue Track Header";

    layout
    {
        area(content)
        {
            repeater(Control1102152001)
            {
                ShowCaption = false;
                field("Issue Id"; "Issue Id")
                {
                }
                field("Issue Logged By"; "Issue Logged By")
                {
                }
                field("Issued Logged Date"; "Issued Logged Date")
                {
                }
                field(Description; Description)
                {
                }
                field("Handled By"; "Handled By")
                {
                    Editable = MakeHandleEditable;
                }
                field(Status; Status)
                {
                }
                field("Handled Date Time"; "Handled Date Time")
                {
                    Editable = MakeHandleEditable;
                }
                field("EFF. Attachment"; "EFF. Attachment")
                {
                }
                field("Reason for Reopen"; "Reason for Reopen")
                {
                }
                field(Remarks; Remarks)
                {
                }
                field(Project; Project)
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Details)
            {
                Caption = 'Details';
                action("More Details")
                {
                    Image = AllLines;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;
                    RunObject = Page Page96001;
                    RunPageLink = Field1 = FIELD(Issue Id);
                    RunPageView = SORTING(Field1, Field2) ORDER(Ascending);
                }
            }
            action(Attachments)
            {
                Caption = 'Attachments';
                Image = Attachments;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    attachments.RESET;
                    attachments.SETRANGE("Table ID", DATABASE::Table96000);
                    attachments.SETRANGE("Document No.", FORMAT("Issue Id"));
                    PAGE.RUN(PAGE::"ESPL Attachments", attachments);
                end;
            }
        }
        area(processing)
        {
            group("Actions")
            {
                Caption = 'Actions';
                action(Release)
                {
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction();
                    begin
                        ReleaseIssue;
                    end;
                }
                action(Completed)
                {
                    Image = Completed;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = SetCompletedVisible;

                    trigger OnAction();
                    begin
                        CompleteIssue;
                    end;
                }
                action(Close)
                {
                    Image = Close;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        CloseIssue;
                    end;
                }
                action("Re Open")
                {
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        ReOpenIssue;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin

        IF IsAdministrator THEN BEGIN
            SetCompletedVisible := TRUE;
            MakeHandleEditable := TRUE;
        END ELSE BEGIN
            SetCompletedVisible := FALSE;
            MakeHandleEditable := FALSE;
        END;
    end;

    trigger OnNewRecord(BelowxRec: Boolean);
    begin
        IF IsAdministrator THEN BEGIN
            SetCompletedVisible := TRUE;
            MakeHandleEditable := TRUE;
        END ELSE BEGIN
            SetCompletedVisible := FALSE;
            MakeHandleEditable := FALSE;
        END;

        IssueTrackHeader.RESET;
        IF IssueTrackHeader.FINDLAST THEN BEGIN
            "Issue Id" := INCSTR(IssueTrackHeader."Issue Id");
        END ELSE
            "Issue Id" := '000001';
    end;

    trigger OnOpenPage();
    begin
        IF IsAdministrator THEN BEGIN
            SetCompletedVisible := TRUE;
            MakeHandleEditable := TRUE;
        END ELSE BEGIN
            SetCompletedVisible := FALSE;
            MakeHandleEditable := FALSE;
            FILTERGROUP(2);
            SETFILTER("Issue Logged By", USERID);
            FILTERGROUP(0);
        END;
    end;

    var
        [InDataSet]
        SetCompletedVisible: Boolean;
        [InDataSet]
        MakeHandleEditable: Boolean;
        attachments: Record Attachments;
        IssueTrackHeader: Record "Issue Track Header";
        IssueTrackerLine: Record "Issue Tracker Line";
}

