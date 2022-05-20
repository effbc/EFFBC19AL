page 33000254 "Specification Subform"
{
    // version QC1.0

    AutoSplitKey = true;
    DelayedInsert = true;
    PageType = ListPart;
    SourceTable = "Specification Line";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                IndentationColumn = DescriptionIndent;
                IndentationControls = Description;
                ShowCaption = false;
                field("Character Code";"Character Code")
                {
                }
                field("Character Type";"Character Type")
                {
                }
                field(Description;Description)
                {
                }
                field("Item No.";"Item No.")
                {
                    Lookup = true;
                }
                field("Inspection Group Code";"Inspection Group Code")
                {
                }
                field("Sampling Code";"Sampling Code")
                {
                }
                field("Unit Of Measure Code";"Unit Of Measure Code")
                {
                }
                field("Inspection Time(In Min.)";"Inspection Time(In Min.)")
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
                field(Qualitative;Qualitative)
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
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        DescriptionIndent := 0;
        CharacterCodeOnFormat;
        DescriptionOnFormat;
    end;

    var
        [InDataSet]
        "Character CodeEmphasize" : Boolean;
        [InDataSet]
        DescriptionEmphasize : Boolean;
        [InDataSet]
        DescriptionIndent : Integer;

    [LineStart(22947)]
    local procedure CharacterCodeOnFormat();
    begin
        "Character CodeEmphasize" := "Character Type" <> "Character Type"::Standard;
    end;

    [LineStart(22950)]
    local procedure DescriptionOnFormat();
    begin
        DescriptionEmphasize := "Character Type" <> "Character Type"::Standard;
        DescriptionIndent := Indentation;
    end;
}

