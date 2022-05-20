page 33000251 Characteristics
{
    // version QC1.0,Rev01

    PageType = Worksheet;
    SourceTable = Characteristic;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Code";Code)
                {
                }
                field(Description;Description)
                {
                }
                field(Qualitative;Qualitative)
                {
                }
                field("Unit Of Measure Code";"Unit Of Measure Code")
                {
                }
                field("Attachment60098.HASVALUE";Attachment60098.HASVALUE)
                {
                    AssistEdit = true;
                    Caption = 'Attachment';

                    trigger OnAssistEdit();
                    begin
                        IF Attachment60098.HASVALUE THEN
                        OpenAttachment;
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
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        OpenAttachment;
                    end;
                }
                action(Import)
                {
                    Caption = 'Import';
                    Ellipsis = true;
                    Image = Import;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        ImportAttchment;
                    end;
                }
                action("E&xport")
                {
                    Caption = 'E&xport';
                    Ellipsis = true;
                    Image = Export;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        ExportAttachment('');
                    end;
                }
                action(Remove)
                {
                    Caption = 'Remove';
                    Image = Delete;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        RemoveAttachment(TRUE);
                        CurrPage.SAVERECORD;
                        //Instead of above statement we can use modify. Both are working in the same wauy;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        IF Code <> '' THEN
          CALCFIELDS(Attachment60098);
    end;
}

