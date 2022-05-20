page 60263 "Itm Sub Group Codes"
{
    Editable = false;
    PageType = List;
    SourceTable = "Item Sub Group";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Product Group Code";"Product Group Code")
                {
                    Editable = false;
                }
                field("Code";Code)
                {
                    Editable = false;
                }
                field(Description;Description)
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

