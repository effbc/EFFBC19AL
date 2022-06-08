page 60057 "RGP Out"
{
    // version B2B1.0,Cal1.0,Rev01

    Editable = true;
    PageType = Document;
    SourceTable = "RGP Out Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("RGP Out No."; "RGP Out No.")
                {

                    trigger OnAssistEdit();
                    begin
                        IF AssistEdit(xRec) THEN
                            CurrPage.UPDATE;
                    end;
                }
                field(Consignee; Consignee)
                {
                }
                field("Consignee No."; "Consignee No.")
                {

                    trigger OnValidate();
                    begin
                        ConsigneeNoOnAfterValidate;
                    end;
                }
                field("Consignee Name"; "Consignee Name")
                {
                }
                field(Address; Address)
                {
                }
                field("Consignee City"; "Consignee City")
                {
                }
                field("Consignee Contact"; "Consignee Contact")
                {
                }
                field("RGP Date"; "RGP Date")
                {
                }
                field("Release Status"; "Release Status")
                {
                    Editable = false;
                }
                field("Phone No."; "Phone No.")
                {
                }
                field("Telex No."; "Telex No.")
                {
                }
                field("Purchase Order No."; "Purchase Order No.")
                {
                }
                field("External Document No."; "External Document No.")
                {
                }
                field(Zone; Zone)
                {
                }
                field(Division; Division)
                {
                }
                field(Station; Station)
                {
                }
                field("Sending To"; "Sending To")
                {
                }
                field("Created By"; "Created By")
                {
                }
                field("Released By"; "Released By")
                {
                    Editable = false;
                }
            }
            part(Control1000000022; "RGP Out Lines")
            {
                SubPageLink = Document No.=FIELD(RGP Out No.);
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
                action("Copy Indent")
                {
                    Caption = 'Copy Indent';
                    Image = Indent;

                    trigger OnAction();
                    begin
                        CopyIndent;
                    end;
                }
                action("Re&lease")
                {
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction();
                    begin
                        RGPRelease.RGPOutRelease(Rec);
                    end;
                }
                action("Re&open")
                {
                    Caption = 'Re&open';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        RGPRelease.RGPOutReopen(Rec);
                    end;
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                action("P&ost")
                {
                    Caption = 'P&ost';
                    Ellipsis = true;
                    Image = Post;
                    ShortCutKey = 'F9';

                    trigger OnAction();
                    var
                        Text050: Label 'There is nothing to post';
                        Text051: Label 'Do you want to post %1?';
                    begin
                        TESTFIELD("Release Status", "Release Status"::Release);
                        TESTFIELD("Consignee No.");
                        RGPOutLine.SETRANGE("Document No.", "RGP Out No.");
                        IF NOT RGPOutLine.FINDFIRST THEN
                            ERROR(Text050);
                        IF CONFIRM(Text051, FALSE, "RGP Out No.") THEN BEGIN
                            PostRGP;
                            CurrPage.UPDATE;
                        END;
                    end;
                }
            }
            action("&Print")
            {
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    RGPOutHead.SETRANGE(RGPOutHead."RGP Out No.", "RGP Out No.");
                    REPORT.RUN(50053, TRUE, FALSE, RGPOutHead);
                    RGPOutHead.SETRANGE("RGP Out No.");
                end;
            }
        }
    }

    var
        RGPOutLine: Record "RGP Out Line";
        RGPOutHead: Record "RGP Out Header";
        RGPRelease: Codeunit "RGP Release";

    (5754)]
    local procedure ConsigneeNoOnAfterValidate();
    begin
        CurrPage.UPDATE;
    end;
}

