page 90002 "Copy Presite"
{
    PageType = List;
    SourceTable = "Inst. PreSite Check List";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("Sales Order No."; "Sales Order No.")
                {
                    Editable = false;
                }
                field("Pre Site Parameter"; "Pre Site Parameter")
                {
                    Editable = false;
                }
                field(Description; Description)
                {
                    Editable = false;
                }
                field(Remarks; Remarks)
                {
                    Editable = false;
                }
                field("Set Selection"; "Set Selection")
                {
                }
            }
        }
    }

    actions
    {
    }
}

