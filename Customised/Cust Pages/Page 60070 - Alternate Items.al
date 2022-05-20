page 60070 "Alternate Items"
{
    DataCaptionFields = "Proudct Type","Item No.";
    PageType = Worksheet;
    SourceTable = "Alternate Items";

    layout
    {
        area(content)
        {
            repeater(Control1102154000)
            {
                ShowCaption = false;
                field("Proudct Type";"Proudct Type")
                {
                }
                field("Item No.";"Item No.")
                {
                }
                field("Item Description";"Item Description")
                {
                }
                field("Alternative Item No.";"Alternative Item No.")
                {
                }
                field("Alternative Item Description";"Alternative Item Description")
                {
                }
                field(Make;Make)
                {
                }
                field("Priority Order";"Priority Order")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Process)
            {
                Caption = 'Process';
                action("<Page ESPL Attachments>")
                {
                    Caption = 'Attachments';
                    Image = Attachments;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "ESPL Attachments";
                    RunPageLink = Table ID=CONST(60045),Document No.=FIELD(Item No.);
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        Item.GET("Item No.");
        IF NOT SMTPMail.Permission_Checking(USERID, 'BOM_Creation') THEN
        BEGIN
            IF Item."Product Group Code" = 'CPCB' THEN
            BEGIN
              MESSAGE('You Do not have rights to Check Compound PCB Details');
              CurrPage.CLOSE;
            END;
        END;
    end;

    var
        Item : Record Item;
        SMTPMail : Codeunit "SMTP Mail";
}

