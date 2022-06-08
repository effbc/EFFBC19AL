page 60131 "New RGP In"
{
    // version B2B1.0,Cal1.0,Rev01

    PageType = Document;
    SourceTable = "RGP In Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("RGP In No."; "RGP In No.")
                {

                    trigger OnAssistEdit();
                    begin
                        IF AssistEdit(xRec) THEN
                            CurrPage.UPDATE;
                    end;
                }
                field(Consignee; Consignee)
                {

                    trigger OnValidate();
                    var
                        Text050: Label 'By changing consignee,all line will be be deleted,do you wish to proceed?';
                    begin
                        IF (xRec.Consignee <> Consignee) THEN BEGIN
                            RGPInLine.SETRANGE("Document No.", "RGP In No.");
                            IF RGPInLine.FINDFIRST THEN BEGIN
                                IF CONFIRM(Text050, FALSE) THEN BEGIN
                                    "Consignee No." := '';
                                    "Consignee Name" := '';
                                    Address := '';
                                    "Consignee City" := '';
                                    "Consignee Contact" := '';
                                    "Phone No." := '';
                                    "Telex No." := '';
                                    RGPInLine.DELETEALL;
                                END ELSE BEGIN
                                    Consignee := xRec.Consignee;
                                END;
                            END ELSE BEGIN
                                "Consignee No." := '';
                                "Consignee Name" := '';
                                Address := '';
                                "Consignee City" := '';
                                "Consignee Contact" := '';
                                "Phone No." := '';
                                "Telex No." := '';
                            END;
                        END;
                        ConsigneeOnAfterValidate;
                    end;
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
                field("Created By"; "Created By")
                {
                }
                field("Released By"; "Released By")
                {
                }
                field("RGP In Date"; "RGP In Date")
                {
                }
                field("Phone No."; "Phone No.")
                {
                }
                field("Telex No."; "Telex No.")
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
                field("Received From"; "Received From")
                {
                }
                field(Results; Results)
                {
                }
                field(Recommendations; Recommendations)
                {
                    Caption = 'Recommendations';
                }
                field("Release Status"; "Release Status")
                {
                }
            }
            part(RGPLines; "RGP In Lines")
            {
                SubPageLink = Document No.=FIELD(RGP In No.);
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&RGP In")
            {
                Caption = '&RGP In';
                action("&List")
                {
                    Caption = '&List';
                    Ellipsis = true;
                    Image = List;
                    ShortCutKey = 'F5';

                    trigger OnAction();
                    var
                        Text050: Label 'There is nothing to post';
                    begin
                        RGPInHead.SETRANGE("RGP I/O", TRUE);
                        PAGE.RUN(0, RGPInHead);
                    end;
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("Get RGP Out")
                {
                    Caption = 'Get RGP Out';
                    Ellipsis = true;
                    Image = GetLines;
                    Visible = false;

                    trigger OnAction();
                    var
                        Text050: Label 'There is nothing to post';
                    begin
                        TESTFIELD("RGP In No.");
                        TESTFIELD("Consignee No.");

                        RGPOut.RESET;
                        RGPOutLine.RESET;
                        RGPInLine.RESET;
                        RGPLedgerEntry.RESET;

                        RGPInLine1.SETRANGE("Document No.", "RGP In No.");
                        RGPInLine1.SETRANGE(RGPInLine1."RGP Out Document No.", '');
                        IF RGPInLine1.FINDFIRST THEN BEGIN
                            RGPInLine1.DELETEALL;
                        END;

                        TempLedgerEntry.SETRANGE("RGP In No.", "RGP In No.");
                        TempLedgerEntry.DELETEALL;

                        RGPApplied.SETRANGE("Document No.", "RGP In No.");
                        IF RGPApplied.FINDFIRST THEN BEGIN
                            RGPApplied.DELETEALL;
                        END;

                        COMMIT;

                        RGPInLine.SETRANGE("Document No.", "RGP In No.");
                        IF RGPInLine.FINDLAST THEN BEGIN
                            RGPInLineNo := RGPInLine."Line No.";
                        END ELSE BEGIN
                            RGPInLineNo := 0;
                        END;

                        RGPOut.SETRANGE(Consignee, Consignee);
                        RGPOut.SETRANGE("Consignee No.", "Consignee No.");
                        RGPOut.SETRANGE(Status, RGPOut.Status::Posted);
                        RGPOut.SETRANGE(Open, TRUE);
                        IF PAGE.RUNMODAL(0, RGPOut) = ACTION::LookupOK THEN BEGIN
                            RGPOutLine.SETRANGE("Document No.", RGPOut."RGP Out No.");
                            IF RGPOutLine.FINDSET THEN BEGIN
                                REPEAT
                                    RGPLedgerEntry.SETRANGE("Entry No.", RGPOutLine."Entry No.");
                                    IF RGPLedgerEntry.FINDFIRST THEN BEGIN
                                        IF RGPLedgerEntry.Open THEN BEGIN
                                            RGPInLine.SETRANGE("RGP Out Document No.", RGPOutLine."Document No.");
                                            RGPInLine.SETRANGE("RGP Out Line No.", RGPOutLine."Line No.");
                                            IF NOT RGPInLine.FINDFIRST THEN BEGIN
                                                RGPInLineNo := RGPInLineNo + 10000;
                                                RGPInLine."Document No." := "RGP In No.";
                                                RGPInLine."Line No." := RGPInLineNo;
                                                RGPInLine."RGP Out Document No." := RGPOutLine."Document No.";
                                                RGPInLine."RGP Out Line No." := RGPOutLine."Line No.";
                                                RGPInLine.Type := RGPOutLine.Type;
                                                RGPInLine."No." := RGPOutLine."No.";
                                                RGPInLine.Description := RGPOutLine.Description;
                                                RGPInLine.UOM := RGPOutLine.UOM;
                                                RGPInLine."Production Order Line No." := RGPOutLine."Production Order Line No.";
                                                RGPInLine."Production Order" := RGPOutLine."Production Order";
                                                RGPInLine."Drawing No." := RGPOutLine."Drawing No.";
                                                RGPInLine."Operation No." := RGPOutLine."Operation No.";
                                                RGPInLine."Routing No." := RGPOutLine."Routing No.";
                                                RGPInLine."Expected Return Date" := RGPOutLine."Expected Return Date";
                                                RGPLedgerEntry.SETRANGE("Entry No.", RGPOutLine."Entry No.");
                                                IF RGPLedgerEntry.FINDFIRST THEN BEGIN
                                                    RGPInLine.Quantity := RGPLedgerEntry."Remaining Quantity";
                                                    RGPInLine."Quantity to Recieve" := RGPLedgerEntry."Remaining Quantity";
                                                END;
                                                RGPInLine.INSERT;
                                            END;
                                        END;
                                    END;
                                UNTIL RGPOutLine.NEXT = 0;
                            END;
                        END;
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
                        RGPRelease.RGPInRelease(Rec);
                    end;
                }
                action("Reo&pen")
                {
                    Caption = 'Reo&pen';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        RGPRelease.RGPInReopen(Rec);
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
                        RGPInLine.SETRANGE("Document No.", "RGP In No.");
                        IF NOT RGPInLine.FINDFIRST THEN
                            ERROR(Text050);
                        IF CONFIRM(Text051, FALSE, "RGP In No.") THEN BEGIN
                            PostNewRGP;
                            CurrPage.UPDATE;
                        END;
                    end;
                }
                action("&Print")
                {
                    Caption = '&Print';
                    Image = Print;

                    trigger OnAction();
                    begin
                        RGPInHead.SETRANGE(RGPInHead."RGP In No.", "RGP In No.");
                        REPORT.RUN(50054, TRUE, FALSE, RGPInHead);
                        RGPInHead.SETRANGE("RGP In No.");
                    end;
                }
            }
        }
    }

    trigger OnClosePage();
    begin
        RGPApplied.SETRANGE("Consignee No.", "Consignee No.");
        IF RGPApplied.FINDSET THEN BEGIN
            REPEAT
                EntryNo := RGPApplied."Applied To Entry";
                RGPLedgerEntry.SETRANGE("Entry No.", EntryNo);
                IF RGPLedgerEntry.FINDFIRST THEN BEGIN
                    RGPLedgerEntry."Applies To" := '';
                    RGPLedgerEntry.MODIFY;
                END;
            UNTIL RGPApplied.NEXT = 0;
        END;

        RGPApplied.RESET;
        RGPApplied.SETRANGE("Consignee No.", "Consignee No.");
        RGPApplied.DELETEALL;

        TempLedgerEntry.DELETEALL;
    end;

    trigger OnNewRecord(BelowxRec: Boolean);
    begin
        "RGP I/O" := TRUE;
    end;

    var
        RGPOut: Record "RGP Out Header";
        RGPOutLine: Record "RGP Out Line";
        RGPInLine: Record "RGP In Line";
        RGPInLineNo: Integer;
        RGPLedgerEntry: Record "RGP Ledger Entries";
        TempLedgerEntry: Record "Temp. RGP Ledger Entry";
        RGPApplied: Record "Temp. Applied RGPs";
        NextEntryNo: Integer;
        Text001: Label 'There are no applied entries for %1 No. %2';
        RGPLedgerEntry1: Record "RGP Ledger Entries";
        RemainingQty: Decimal;
        Text002: Label 'Do you want to post the Document No. %1?';
        RGPOutEntryNo: Integer;
        RGPInLine1: Record "RGP In Line";
        EntryNo: Integer;
        Text003: Label 'RGP In Quantity %1 cannot be more than RGP Out Pending Quantity %2 in Line No. %3';
        chkStatus: Boolean;
        DocumentNo: Code[20];
        RGPInHead: Record "RGP In Header";
        RGPInLinecal: Record "RGP In Line";
        Calibration: Record Calibration;
        RGPRelease: Codeunit "RGP Release";

    (11738)]
    local procedure ConsigneeOnAfterValidate();
    begin
        CurrPage.UPDATE;
    end;

    (11741)]
    local procedure ConsigneeNoOnAfterValidate();
    begin
        CurrPage.UPDATE;
    end;
}

