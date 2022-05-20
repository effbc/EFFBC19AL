page 60100 "FDR List"
{
    // version B2B1.0

    CardPageID = "FDR Card";
    Editable = false;
    PageType = List;
    SourceTable = "FDR Master";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("No.";"No.")
                {
                }
                field("FDR Document No.";"FDR Document No.")
                {
                }
                field(Description;Description)
                {
                }
                field("Expiry Date";"Expiry Date")
                {
                }
                field(Purpose;Purpose)
                {
                }
                field(Remarks;Remarks)
                {
                }
                field("FDR Value";"FDR Value")
                {
                }
                field("FDR Surrended to Bank";"FDR Surrended to Bank")
                {
                }
                field("FDR Surrended Date";"FDR Surrended Date")
                {
                }
                field("Creation Date";"Creation Date")
                {
                }
                field("Last Modified Date";"Last Modified Date")
                {
                }
                field(Extended;Extended)
                {
                }
                field("Mode of Payment";"Mode of Payment")
                {
                }
            }
        }
    }

    actions
    {
    }
}

