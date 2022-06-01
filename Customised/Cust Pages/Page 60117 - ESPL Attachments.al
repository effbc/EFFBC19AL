page 60117 "ESPL Attachments"
{
    // version B2B1.0,Rev01

    DataCaptionFields = "Document Type", "Document No.";
    PageType = Worksheet;
    SourceTable = Attachments;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Table ID"; "Table ID")
                {
                }
                field(Description; Description)
                {
                    NotBlank = false;

                    trigger OnValidate();
                    begin
                        Description := UPPERCASE(Description);
                    end;
                }
                field("Attachment Status"; "Attachment Status")
                {
                    Editable = false;
                }
                field("Version No."; "Version No.")
                {
                }
                field("Last Date Modified"; "Last Date Modified")
                {
                }
                field("Document No."; "Document No.")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Attachment")
            {
                Caption = '&Attachment';
                Image = Attachments;
                action(Open)
                {
                    Caption = 'Open';
                    Ellipsis = true;
                    Image = Open;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        Attachment: Record Attachments;
                    begin
                        TESTFIELD(Description);

                        IF "No." = 0 THEN
                            EXIT;
                        Attachment.GET("No.", "Table ID", "Document Type", "Document No.");
                        Attachment.OpenAttachment(Description, FALSE);
                    end;
                }
                action(Create)
                {
                    Caption = 'Create';
                    Ellipsis = true;
                    Image = CreateForm;
                    Visible = false;

                    trigger OnAction();
                    var
                        WordManagement: Codeunit WordManagementESPL;
                        NewAttachmentNo: Integer;
                    begin
                        ModifiyDocument;
                        NewAttachmentNo := WordManagement.CreateWordAttachment("Document No." + ' ' + FORMAT("Document Type"));
                        IF NewAttachmentNo = 0 THEN BEGIN
                            ERROR(Text000);
                        END;
                        //Rev1 chaitanyha commented old Code
                        /*
                        TESTFIELD(Description);
                        CreateAttachment;
                        *///Rev1 chaitanyha commented old Code

                    end;
                }
                action(Import)
                {
                    Caption = 'Import';
                    Ellipsis = true;
                    Image = Import;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        FileName: Text[260];
                        AttachVoith: Record Attachments;
                    begin
                        ModifiyDocument;
                        IF ((Rec."Table ID" = 33000929) AND ("Attachment Status" = TRUE) AND ("Document No." <> '')) THEN
                            ERROR('You can not upload the file in posted data')
                        //added by vishnu Priya on 27-09-2019
                        ELSE
                            IF Rec."Table ID" = 36 THEN BEGIN
                                SH.RESET;
                                SH.SETFILTER("No.", Rec."Document No.");
                                IF SH.FINDFIRST THEN BEGIN
                                    IF SH."Order Verified" = TRUE THEN
                                        ERROR('You can''t change the attachment as the order was verified')
                                    ELSE BEGIN
                                        TESTFIELD(Description);
                                        ImportAttachment(FileName, FALSE, FALSE); //Rev01
                                    END;
                                END
                            END
                            //end by Vishnu Priya on 27-09-2019
                            ELSE BEGIN
                                TESTFIELD(Description);
                                ImportAttachment(FileName, FALSE, FALSE); //Rev01
                            END;

                        /*
                        //added by vishnu Priya on 27-09-2019
                        IF Rec."Table ID"=36 THEN
                          BEGIN
                            SH.RESET;
                            SH.SETFILTER("No.",Rec."Document No.");
                            IF SH.FINDFIRST THEN
                              BEGIN
                                IF SH."Verification Status" = 1 THEN
                                    ERROR('You can''t change the attachment as the order was verified');
                              END
                          END;
                        
                        //end by Vishnu Priya on 27-09-2019
                        */

                    end;
                }
                action(Export)
                {
                    Caption = 'E&xport';
                    Ellipsis = true;
                    Image = Export;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        FileName: Text[1024];
                    begin
                        TESTFIELD(Description);
                        ModifiyDocument;
                        ExportAttachment(FileName);//Rev01
                    end;
                }
                action(Remove)
                {
                    Caption = 'Remove';
                    Ellipsis = true;
                    Image = RemoveLine;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        ModifiyDocument;
                        IF ((Rec."Table ID" = 33000929) AND ("Attachment Status" = TRUE) AND ("Document No." <> '')) THEN
                            ERROR('You can not remove the file in posted data')
                        ELSE BEGIN
                            RemoveAttachment(TRUE);
                        END;
                    end;
                }
            }
        }
    }

    var
        CustAttachments: Record Attachments;
        AttachNo: Integer;
        Text000: TextConst ENU = 'You have canceled the create process.', ENN = 'You have canceled the create process.';
        Text001: TextConst ENU = 'Replace existing attachment?', ENN = 'Replace existing attachment?';
        SH: Record "Sales Header";
}

