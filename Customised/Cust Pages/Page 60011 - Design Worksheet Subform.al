page 60011 "Design Worksheet Subform"
{
    // version B2B1.0

    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "Design Worksheet Line";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field(Type;Type)
                {
                }
                field("No.";"No.")
                {
                }
                field(Description;Description)
                {
                }
                field("Unit of Measure";"Unit of Measure")
                {
                }
                field(Quantity;Quantity)
                {
                }
                field("No.of SMD Points";"No.of SMD Points")
                {
                }
                field("No.of DIP Points";"No.of DIP Points")
                {
                }
                field("Manufacturing Cost";"Manufacturing Cost")
                {
                }
                field("Unit Cost";"Unit Cost")
                {
                }
                field(Amount;Amount)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("Copy &Bom Components")
                {
                    Caption = 'Copy &Bom Components';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #60010. Unsupported part was commented. Please check it.
                        /*CurrPage.DesignWorksheetLines.FORM.*/
                        _CopyBOMComponents;

                    end;
                }
            }
        }
    }

    [LineStart(4270)]
    procedure _CopyBOMComponents();
    begin
        CopyBomComponents;
    end;

    [LineStart(4273)]
    procedure CopyBOMComponents();
    begin
        CopyBomComponents;
    end;
}

