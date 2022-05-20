page 60119 "ESPL Attachments (Read Only)"
{
    // version B2B1.0,Rev01

    DataCaptionFields = "Document Type","Document No.";
    Editable = false;
    PageType = List;
    SourceTable = Attachments;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field(Description;Description)
                {
                    NotBlank = false;
                }
                field("Attachment Status";"Attachment Status")
                {
                    Editable = false;
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
                action(Open)
                {
                    Caption = 'Open';
                    Image = Open;

                    trigger OnAction();
                    var
                        Attachment : Record Attachments;
                    begin
                        TESTFIELD(Description);
                        IF "No." = 0 THEN
                          EXIT;
                        Attachment.GET("No.","Table ID","Document Type","Document No.","Document Line No.");
                        Attachment.OpenAttachment(Description,FALSE);
                    end;
                }
                action(Create)
                {
                    Caption = 'Create';
                    Ellipsis = true;
                    Image = CreateForm;
                    Visible = false;

                    trigger OnAction();
                    begin
                        TESTFIELD(Description);
                        Rec.CreateAttachment;
                    end;
                }
                action(Import)
                {
                    Caption = 'Import';
                    Ellipsis = true;
                    Image = Import;
                    Visible = false;

                    trigger OnAction();
                    var
                        FileName : Text[260];
                        AttachVoith : Record Attachments;
                    begin
                        TESTFIELD(Description);
                        AttachVoith.ImportAttachment(FileName,FALSE,TRUE);//EFFUPG Deleted Rec
                    end;
                }
                action("E&xport")
                {
                    Caption = 'E&xport';
                    Ellipsis = true;
                    Image = Export;

                    trigger OnAction();
                    var
                        FileName : Text[260];
                    begin
                        TESTFIELD(Description);
                        ExportAttachment(FileName);//EFFUPG Added FileName
                    end;
                }
                action(Remove)
                {
                    Caption = 'Remove';
                    Ellipsis = true;
                    Image = RemoveLine;
                    Visible = false;

                    trigger OnAction();
                    begin
                        RemoveAttachment(TRUE);
                    end;
                }
            }
        }
    }

    var
        CustAttachments : Record Attachments;
        AttachNo : Integer;
}

