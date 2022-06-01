page 60150 "Item Design Worksheet"
{
    // version DWS1.0

    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "Item Design Worksheet Line";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
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
                field("Description 2"; "Description 2")
                {
                }
                field("No.of SMD Points"; "No.of SMD Points")
                {
                }
                field("No.of DIP Points"; "No.of DIP Points")
                {
                }
                field("Unit of Measure"; "Unit of Measure")
                {
                }
                field(Quantity; Quantity)
                {
                }
                field("Unit Cost"; "Unit Cost")
                {
                }
                field(Amount; Amount)
                {
                }
                field("Total time in Hours"; "Total time in Hours")
                {
                }
                field("Manufacturing Cost"; "Manufacturing Cost")
                {
                }
            }
        }
    }

    actions
    {
    }

    [LineStart(13200)]
    procedure CopyBOmComponents();
    begin
        CopyBomComponents2;
    end;
}

