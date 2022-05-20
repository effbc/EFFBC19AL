page 33000280 "Assay List"
{
    // version QC1.0

    CardPageID = Assay;
    Editable = false;
    PageType = List;
    SourceTable = "Assay Header";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("No.";"No.")
                {
                }
                field(Description;Description)
                {
                }
                field("Sampling Plan Code";"Sampling Plan Code")
                {
                }
                field(Status;Status)
                {
                }
                field("Inspection Group Code";"Inspection Group Code")
                {
                }
            }
        }
    }

    actions
    {
    }
}

