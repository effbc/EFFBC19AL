page 60075 "Defect Tracking"
{
    // version B2B1.0

    AutoSplitKey = true;
    PageType = Worksheet;
    SourceTable = "Defect Tracking Details";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("Serial No.";"Serial No.")
                {
                }
                field("Component No.";"Component No.")
                {
                }
                field("Item Description";"Item Description")
                {
                }
                field(Position;Position)
                {
                }
                field("Position 2";"Position 2")
                {
                }
                field("Position 3";"Position 3")
                {
                }
                field("Defect Code";"Defect Code")
                {
                }
                field(Qty;Qty)
                {
                    Caption = 'Defect Quantity';
                }
                field(Description;Description)
                {
                }
                field(Remarks;Remarks)
                {
                }
                field("Disposition Actions";"Disposition Actions")
                {
                }
            }
        }
    }

    actions
    {
    }
}

