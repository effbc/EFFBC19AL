page 60123 "Design Worksheet Subform-Sale"
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
                field(Type; Type)
                {
                }
                field("No."; "No.")
                {
                }
                field(Description; Description)
                {
                }
                field("Unit of Measure"; "Unit of Measure")
                {
                }
                field(Quantity; Quantity)
                {
                }
                field("No.of SMD Points"; "No.of SMD Points")
                {
                }
                field("No.of DIP Points"; "No.of DIP Points")
                {
                }
                field("Manufacturing Cost"; "Manufacturing Cost")
                {
                }
                field("Unit Cost"; "Unit Cost")
                {
                }
                field(Amount; Amount)
                {
                }
            }
        }
    }

    actions
    {
    }
}

