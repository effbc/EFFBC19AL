page 33000273 "Vendor Item Quality Approval"
{
    // version QC1.0,Rev01

    DelayedInsert = true;
    PageType = Worksheet;
    SourceTable = "Vendor Item Quality Approval";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Item No.";"Item No.")
                {
                }
                field("Starting Date";"Starting Date")
                {
                }
                field("Spec Id";"Spec Id")
                {
                }
                field("Ending Date";"Ending Date")
                {
                }
                field("Certified Agency";"Certified Agency")
                {
                }
                field("Attachment.HASVALUE";Attachment.HASVALUE)
                {
                    AssistEdit = true;
                    Caption = 'Attachment';

                    trigger OnAssistEdit();
                    begin
                        IF Attachment.HASVALUE THEN BEGIN
                          QualityAttachmentMgt.SetVendorItemApproval(Rec);
                          QualityAttachmentMgt.OpenAttachment;
                        END;
                    end;
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
                Image = Attach;
                action(Open)
                {
                    Caption = 'Open';
                    Image = Open;

                    trigger OnAction();
                    begin
                        QualityAttachmentMgt.SetVendorItemApproval(Rec);
                        QualityAttachmentMgt.OpenAttachment;
                    end;
                }
                action(Import)
                {
                    Caption = 'Import';
                    Ellipsis = true;
                    Image = Import;

                    trigger OnAction();
                    begin
                        QualityAttachmentMgt.SetVendorItemApproval(Rec);
                        QualityAttachmentMgt.ImportAttchment;
                    end;
                }
                action("E&xport")
                {
                    Caption = 'E&xport';
                    Ellipsis = true;
                    Image = Export;

                    trigger OnAction();
                    begin
                        QualityAttachmentMgt.SetVendorItemApproval(Rec);
                        QualityAttachmentMgt.ExportAttachment('');
                    end;
                }
                action(Remove)
                {
                    Caption = 'Remove';
                    Image = Delete;

                    trigger OnAction();
                    begin
                        QualityAttachmentMgt.SetVendorItemApproval(Rec);
                        QualityAttachmentMgt.RemoveAttachment(TRUE);
                        CurrPage.SAVERECORD;
                        //Instead of above statement we can use modify. Both are working in the same wauy;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        IF "Item No." <> '' THEN
          CALCFIELDS(Attachment);
    end;

    var
        QualityAttachmentMgt : Codeunit QualityAttachmentManagement;
}

