page 33000288 "Prod. Order Inspect Components"
{
    // version WIP1.0

    AutoSplitKey = true;
    Caption = 'Prod. Order Components';
    DataCaptionExpression = Caption;
    DelayedInsert = true;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Prod. Order Inspect Component";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Item No."; "Item No.")
                {
                }
                field(Description; Description)
                {
                }
                field("Calculation Formula"; "Calculation Formula")
                {
                    Visible = false;
                }
                field(Length; Length)
                {
                    Visible = false;
                }
                field(Width; Width)
                {
                    Visible = false;
                }
                field(Weight; Weight)
                {
                    Visible = false;
                }
                field(Depth; Depth)
                {
                    Visible = false;
                }
                field("Unit of Measure Code"; "Unit of Measure Code")
                {
                }
                field("Expected Quantity"; "Expected Quantity")
                {
                }
                field("Remaining Quantity"; "Remaining Quantity")
                {
                }
                field("Location Code"; "Location Code")
                {
                    Visible = false;
                }
                field("Quantity Consumed"; "Quantity Consumed")
                {
                    Editable = false;
                }
                field("Unit Cost"; "Unit Cost")
                {
                    Visible = false;
                }
                field("Cost Amount"; "Cost Amount")
                {
                    Visible = false;
                }
                field(Position; Position)
                {
                    Visible = false;
                }
                field("Position 2"; "Position 2")
                {
                    Visible = false;
                }
                field("Position 3"; "Position 3")
                {
                    Visible = false;
                }
                field("Production Lead Time"; "Production Lead Time")
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }

    var
        Text000: Label 'You cannot reserve components with status %1.';
        ShortcutDimCode: array[8] of Code[20];
}

