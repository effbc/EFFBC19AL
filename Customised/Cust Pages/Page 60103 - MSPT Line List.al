page 60103 "MSPT Line List"
{
    // version MSPT1.0,Rev01

    // B2B Software Technologies
    // ---------------------------------------------------
    // Project : Mile Stone Payment Terms
    // B2B
    // No. sign   Description
    // ---------------------------------------------------
    // 01  B2B    MSPT Line List

    Editable = false;
    PageType = List;
    SourceTable = "MSPT Line";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("MSPT Header Code"; "MSPT Header Code")
                {
                }
                field("Code"; Code)
                {
                }
                field("Line No."; "Line No.")
                {
                }
                field(Description; Description)
                {
                }
                field(Percentage; Percentage)
                {
                }
                field("Calculation Period"; "Calculation Period")
                {
                }
                field(Remarks; Remarks)
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Line)
            {
                Caption = '&Line';
                action(Card)
                {
                    Caption = 'Card';
                    Image = Card;
                    RunObject = Page "Mile Stone Payments";
                    RunPageLink = Code = FIELD(MSPT Header Code);
                    ShortCutKey = 'Shift+F7';
                }
            }
        }
    }
}

