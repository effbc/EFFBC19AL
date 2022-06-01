page 60239 "Stencil List"
{
    CardPageID = "Stencil Card";
    PageType = List;
    SourceTable = Stencil;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; "No.")
                {
                    Editable = true;
                }
                field(Description; Description)
                {
                    Editable = true;
                }
                field(Status; Status)
                {
                    Editable = false;
                }
                field("Fixed Asset no"; "Fixed Asset no")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

