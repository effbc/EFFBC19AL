page 33000255 "Specification List"
{
    // version QC1.0

    CardPageID = Specifications;
    Editable = false;
    PageType = List;
    SourceTable = "Specification Header";

    layout
    {
        area(content)
        {
            field("xRec.COUNT";xRec.COUNT)
            {
                Style = Standard;
                StyleExpr = TRUE;
            }
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Spec ID";"Spec ID")
                {
                }
                field(Description;Description)
                {
                }
                field(Status;Status)
                {
                }
            }
        }
    }

    actions
    {
    }
}

