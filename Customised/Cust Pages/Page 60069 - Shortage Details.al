page 60069 "Shortage Details"
{
    // version B2B1.0

    Editable = false;
    PageType = List;
    SourceTable = "Item Lot Numbers";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("Item No"; "Item No")
                {
                }
                field(Description; Description)
                {
                }
                field(Shortage; Shortage)
                {
                }
                field(Authorisation; Authorisation)
                {
                }
                field("Lead Time"; "Lead Time")
                {
                }
                field("Possible Procured Date"; "Possible Procured Date")
                {
                }
                field("Indent No."; "Indent No.")
                {
                }
                field("Within Buffer"; "Within Buffer")
                {
                }
                field("Possible Production Plan Date"; "Possible Production Plan Date")
                {
                }
                field("Production Order No."; "Production Order No.")
                {
                }
                field(Product; Product)
                {
                }
                field("Product Type"; "Product Type")
                {
                }
                field("Sales Order No."; "Sales Order No.")
                {
                }
                field("Customer Name"; "Customer Name")
                {
                }
                field("Planned Purchase Date"; "Planned Purchase Date")
                {
                }
                field("Material Required Date"; "Material Required Date")
                {
                }
                field("Planned Date"; "Planned Date")
                {
                }
                field("Material Required Day"; "Material Required Day")
                {
                }
                field("Alternated Item"; "Alternated Item")
                {
                }
            }
            field("COUNT"; COUNT)
            {
            }
        }
    }

    actions
    {
    }
}

