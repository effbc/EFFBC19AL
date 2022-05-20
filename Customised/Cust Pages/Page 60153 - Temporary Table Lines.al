page 60153 "Temporary Table Lines"
{
    PageType = List;
    SourceTable = "Item Op Balance";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No.";"Entry No.")
                {
                }
                field("No.";"No.")
                {
                }
                field(Location;Location)
                {
                }
                field("Lot No.";"Lot No.")
                {
                }
                field("Serial No.";"Serial No.")
                {
                }
                field(Quantity;Quantity)
                {
                }
                field("Unit Cost";"Unit Cost")
                {
                }
                field("Posting Date";"Posting Date")
                {
                }
                field(UOM;UOM)
                {
                }
                field("Document Date";"Document Date")
                {
                }
                field("Document No.";"Document No.")
                {
                }
                field("Line No";"Line No")
                {
                }
                field("Entry Type";"Entry Type")
                {
                }
                field("New Location";"New Location")
                {
                }
                field("New Lot No.";"New Lot No.")
                {
                }
                field("New Serial No.";"New Serial No.")
                {
                }
                field(Inserted;Inserted)
                {
                }
                field("Error Text";"Error Text")
                {
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            Caption = 'General';
            action("Generate Item Reclass. Entries")
            {
                Caption = 'Generate Item Reclass. Entries';
                Image = Journals;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    OMSDumping_ItemReclass.ItemReclass;
                end;
            }
        }
    }

    var
        OMSDumping_ItemReclass : Codeunit OMSDumping;
}

