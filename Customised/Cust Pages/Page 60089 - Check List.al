page 60089 "Check List"
{
    // version B2B1.0

    DelayedInsert = true;
    PageType = Worksheet;
    SourceTable = "Check List";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field(Parameter; Parameter)
                {
                }
                field(Description; Description)
                {
                }
                field(Status; Status)
                {
                }
            }
        }
    }

    actions
    {
    }
}

