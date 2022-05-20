page 33000279 "Assay Subform"
{
    // version QC1.0

    AutoSplitKey = true;
    DelayedInsert = true;
    PageType = ListPart;
    SourceTable = "Assay Line";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Character Code";"Character Code")
                {
                }
                field(Description;Description)
                {
                }
                field("Normal Value (Num)";"Normal Value (Num)")
                {
                }
                field("Min. Value (Num)";"Min. Value (Num)")
                {
                }
                field("Max. Value (Num)";"Max. Value (Num)")
                {
                }
                field("Normal Value (Char)";"Normal Value (Char)")
                {
                }
                field("Min. Value (Char)";"Min. Value (Char)")
                {
                }
                field("Max. Value (Char)";"Max. Value (Char)")
                {
                }
                field("Unit Of Measure Code";"Unit Of Measure Code")
                {
                }
                field(Qualitative;Qualitative)
                {
                }
            }
        }
    }

    actions
    {
    }
}

