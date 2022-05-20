page 60024 "Product List"
{
    // version B2B1.0

    CardPageID = "Product Card";
    Editable = false;
    PageType = List;
    SourceTable = Products;

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("Code";Code)
                {
                }
                field("Product Type";"Product Type")
                {
                }
                field(Description;Description)
                {
                }
                field(Technology;Technology)
                {
                }
                field("Key Features";"Key Features")
                {
                }
                field("Launched Year";"Launched Year")
                {
                }
                field(Segment;Segment)
                {
                }
                field(Price;Price)
                {
                }
            }
        }
    }

    actions
    {
    }
}

