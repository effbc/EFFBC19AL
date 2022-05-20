page 60118 "ESPL Attachments Archive"
{
    // version B2B1.0,Rev01

    DataCaptionFields = "Document Type","Document No.";
    Editable = false;
    PageType = List;
    SourceTable = "Attachments Archive";

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
                        AttachmentArchive : Record "Attachments Archive";
                    begin
                        TESTFIELD(Description);
                        IF "No." = 0 THEN
                          EXIT;
                        AttachmentArchive.GET("No.","Table ID","Document Type","Document No.","Document Line No.","Document Version No.");
                        AttachmentArchive.OpenAttachment(Description,FALSE);
                    end;
                }
                action("E&xport")
                {
                    Caption = 'E&xport';
                    Ellipsis = true;
                    Image = Export;

                    trigger OnAction();
                    begin
                        TESTFIELD(Description);
                        ExportAttachment('');
                    end;
                }
            }
        }
    }

    var
        CustAttachments : Record Attachments;
        AttachNo : Integer;
}

