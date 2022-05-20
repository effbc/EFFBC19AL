page 60199 "Posted Material Issue Line"
{
    // version MI1.0,Rev01

    Editable = false;
    PageType = List;
    SourceTable = "Posted Material Issues Line";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Document No.";"Document No.")
                {
                }
                field("Item No.";"Item No.")
                {
                }
                field(Description;Description)
                {
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                }
                field("Qty. per Unit of Measure";"Qty. per Unit of Measure")
                {
                }
                field("Quantity (Base)";"Quantity (Base)")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Line")
            {
                Caption = '&Line';
                action("Show Document")
                {
                    Caption = 'Show Document';
                    Image = Documents;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'Shift+F5';

                    trigger OnAction();
                    var
                        PostedMaterialIssueHeader : Record "Posted Material Issues Header";
                    begin
                        PostedMaterialIssueHeader.GET("Document No.");
                        PAGE.RUN(PAGE::"Posted Material Issue",PostedMaterialIssueHeader);
                    end;
                }
                action(Dimensions)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Process;
                }
            }
        }
    }
}

