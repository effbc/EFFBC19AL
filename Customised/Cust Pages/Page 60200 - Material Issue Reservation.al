page 60200 "Material Issue Reservation"
{
    // version MI1.0

    Editable = false;
    PageType = List;
    SourceTable = "Mat.Issue Track. Specification";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Order No.";"Order No.")
                {
                }
                field("Order Line No.";"Order Line No.")
                {
                }
                field("Item No.";"Item No.")
                {
                }
                field("Location Code";"Location Code")
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
                field("Warranty date";"Warranty date")
                {
                }
                field("Expiration Date";"Expiration Date")
                {
                }
            }
        }
    }

    actions
    {
    }
}

