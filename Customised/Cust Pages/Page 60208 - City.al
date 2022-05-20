page 60208 City
{
    PageType = Worksheet;
    SourceTable = City;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("City Code";"City Code")
                {
                }
                field("City Name";"City Name")
                {
                }
                field("District Code";"District Code")
                {
                }
            }
        }
    }

    actions
    {
    }
}

