page 33000253 Specifications
{
    // version QC1.1,Rev01

    // Copy specification is modified with the codeunit function
    // TESTFIELD("Spec ID");
    // 
    // IF Page.RUNMODAL(0,SpecHeader) = ACTION::LookupOK THEN BEGIN
    //   IF "Spec ID"<>SpecHeader."Spec ID" THEN BEGIN
    //     SpecLine.SETRANGE("Spec ID","Spec ID");
    //     SpecLine.DELETEALL;
    //     SpecLine.SETRANGE("Spec ID",SpecHeader."Spec ID");
    //     IF SpecLine.FINDSET THEN BEGIN
    //       REPEAT
    //         SpecLine1 := SpecLine;
    //        SpecLine1."Spec ID" := "Spec ID";
    //         SpecLine1.INSERT;
    //       UNTIL SpecLine.NEXT = 0;
    //     END;
    //   END;
    //   IF "Spec ID"=SpecHeader."Spec ID" THEN
    //    ERROR(TEXT000)
    // END;

    AutoSplitKey = false;
    PageType = Document;
    SourceTable = "Specification Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Spec ID"; "Spec ID")
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
                field(Status; Status)
                {

                    trigger OnValidate();
                    begin
                        StatusOnAfterValidate;
                    end;
                }
                field("Version Nos."; "Version Nos.")
                {
                }
                field(ActiveVersionCode; ActiveVersionCode)
                {
                    Caption = 'Active Version';
                    Editable = false;

                    trigger OnLookup(Text: Text): Boolean;
                    var
                        SpecVersion: Record "Specification Version";
                    begin
                        SpecVersion.SETRANGE("Specification No.", "Spec ID");
                        SpecVersion.SETRANGE("Version Code", ActiveVersionCode);
                        PAGE.RUNMODAL(PAGE::"Specificatinn Version", SpecVersion);
                        ActiveVersionCode := GetSpecVersion("Spec ID", WORKDATE, TRUE);
                    end;
                }
                field("Inspection Time(In Hours)"; "Inspection Time(In Hours)")
                {
                }
            }
            part(Control1000000006; "Specification Subform")
            {
                SubPageLink = Spec ID=FIELD(Spec ID),Version Code=CONST();
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Specifications")
            {
                Caption = '&Specifications';
                Image = AnalysisView;
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                                    RunPageLink = Table Name=CONST(14),No.=FIELD(Spec ID);
                }
                action("&Versions")
                {
                    Caption = '&Versions';
                    Image = Versions;
                    RunObject = Page "Specificatinn Version";
                                    RunPageLink = Specification No.=FIELD(Spec ID);
                }
                group("&Attachments")
                {
                    Caption = '&Attachments';
                    Image = Attachments;
                    action(Open)
                    {
                        Caption = 'Open';
                        Image = OpenWorksheet;

                        trigger OnAction();
                        begin
                            OpenAttachment;
                        end;
                    }
                    action(Import)
                    {
                        Caption = 'Import';
                        Image = Import;

                        trigger OnAction();
                        begin
                            ImportAttchment;
                        end;
                    }
                    action("E&xport")
                    {
                        Caption = 'E&xport';
                        Image = ExportAttachment;

                        trigger OnAction();
                        begin
                            ExportAttachment('');
                        end;
                    }
                    action(Remove)
                    {
                        Caption = 'Remove';
                        Image = RemoveLine;

                        trigger OnAction();
                        begin
                            RemoveAttachment(TRUE);
                            CurrPage.SAVERECORD;
                        end;
                    }
                }
            }
        }
        area(processing)
        {
            Caption = '<Action1900000004>';
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Actions";
                action("Copy Specification")
                {
                    Caption = 'Copy Specification';
                    Image = Copy;

                    trigger OnAction();
                    begin
                        TESTFIELD("Spec ID");
                        IF PAGE.RUNMODAL(0,SpecHeader) = ACTION::LookupOK THEN
                          SpecCopy.CopySpec(SpecHeader."Spec ID",'',Rec,'');
                    end;
                }
                action("Copy Assay")
                {
                    Caption = 'Copy Assay';
                    Image = CopyCostBudget;

                    trigger OnAction();
                    begin
                        CopyAssay;
                    end;
                }
                action(Indent)
                {
                    Caption = 'Indent';
                    Image = Indent;
                    RunObject = Codeunit "Spec Line-Indent";
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
                    SpecHeader.SETRANGE("Spec ID",Rec."Spec ID");
                    REPORT.RUN(33000253,TRUE,FALSE,SpecHeader);
                    SpecHeader.SETRANGE("Spec ID");
                end;
            }
        }
    }

    trigger OnAfterGetRecord();
    begin

        ActiveVersionCode := GetSpecVersion("Spec ID",WORKDATE,TRUE);
    end;

    var
        SpecHeader : Record "Specification Header";
        SpecLine : Record "Specification Line";
        SpecLine1 : Record "Specification Line";
        ActiveVersionCode : Code[20];
        SpecCopy : Codeunit "Specification-Copy";

    (22939)]
    local procedure StatusOnAfterValidate();
    begin
        CurrPage.UPDATE;
    end;
}

