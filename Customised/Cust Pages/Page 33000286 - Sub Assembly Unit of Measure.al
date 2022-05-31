page 33000286 "Sub Assembly Unit of Measure"
{
    // version WIP1.0

    PageType = Worksheet;
    SourceTable = "Sub Assembly Unit of Measure";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Sub Assembly No."; "Sub Assembly No.")
                {
                    Caption = 'Sub Assembly No.';
                }
                field("Code"; Code)
                {
                }
                field("Qty. per Unit of Measure"; "Qty. per Unit of Measure")
                {
                }
                field(Length; Length)
                {
                }
                field(Width; Width)
                {
                }
                field(Height; Height)
                {
                }
                field(Cubage; Cubage)
                {
                }
                field(Weight; Weight)
                {
                }
            }
        }
    }

    actions
    {
    }
}

