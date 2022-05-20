page 33000284 "Sub Assembly Card"
{
    // version WIP1.0

    PageType = Card;
    SourceTable = "Sub Assembly";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No.";"No.")
                {

                    trigger OnAssistEdit();
                    begin
                        IF AssistEdit THEN
                          CurrPage.UPDATE;
                    end;
                }
                field(Description;Description)
                {
                }
                field("Spec Id";"Spec Id")
                {
                }
                field("QC Enabled";"QC Enabled")
                {
                }
                field("Unit Of Measure Code";"Unit Of Measure Code")
                {
                }
                field("Search Name";"Search Name")
                {
                }
                field(Block;Block)
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage();
    begin
        SETRANGE("No.");
    end;
}

