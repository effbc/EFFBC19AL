page 60087 "Tender Comment List"
{
    // version B2B1.0

    PageType = Worksheet;
    SourceTable = "Tender Comment Line";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("No."; "No.")
                {
                }
                field(Date; Date)
                {
                }
                field(Comment; Comment)
                {
                }
            }
        }
    }

    actions
    {
    }
}

