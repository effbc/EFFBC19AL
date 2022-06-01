page 60104 "MSPT Subform"
{
    // version MSPT1.0

    // B2B Software Technologies
    // ---------------------------------------------------
    // Project : Mile Stone Payment Terms
    // B2B
    // No. sign   Description
    // ---------------------------------------------------
    // 01  B2B    MSPT Subform

    AutoSplitKey = true;
    DelayedInsert = true;
    PageType = ListPart;
    SourceTable = "MSPT Line";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("Code"; Code)
                {
                }
                field("Line No."; "Line No.")
                {
                    Visible = false;
                }
                field(Description; Description)
                {
                }
                field(Percentage; Percentage)
                {
                }
                field("Calculation Period"; "Calculation Period")
                {
                    NotBlank = true;
                }
                field(Remarks; Remarks)
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        MSPTHeader: Record "MSPT Header";
        TotalPercentage: Decimal;
        TEXT001: Label 'Total percentage should be equal to 100%';
        MSPTLine: Record "MSPT Line";
}

