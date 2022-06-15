page 33000261 "Sampling Line Subform"
{
    // version QC1.0

    AutoSplitKey = true;
    DelayedInsert = true;
    PageType = ListPart;
    SourceTable = "Sampling Plan Line";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Lot Size - Min"; "Lot Size - Min")
                {
                    Editable = false;
                }
                field("Lot Size - Max"; "Lot Size - Max")
                {
                }
                field("Sampling Size"; "Sampling Size")
                {
                }
                field("Allowable Defects - Max"; "Allowable Defects - Max")
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        SamplePlanline: Record "Sampling Plan Line";
}

