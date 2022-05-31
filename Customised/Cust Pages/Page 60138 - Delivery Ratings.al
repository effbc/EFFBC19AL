page 60138 "Delivery Ratings"
{
    // version POAU

    PageType = Worksheet;
    SourceTable = "Delivery Ratings";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("Minumum Value"; "Minumum Value")
                {
                }
                field("Maximum Value"; "Maximum Value")
                {
                }
                field(Rating; Rating)
                {
                }
            }
        }
    }

    actions
    {
    }
}

