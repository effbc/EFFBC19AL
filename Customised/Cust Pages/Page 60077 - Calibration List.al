page 60077 "Calibration List"
{
    // version B2B1.0

    CardPageID = "Calibration Card";
    Editable = false;
    PageType = List;
    SourceTable = "Calibration Header";

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
                field(Name;Name)
                {
                }
                field("Equipment Type";"Equipment Type")
                {
                }
                field("Calibration Next Due Date";"Calibration Next Due Date")
                {
                }
                field(Frequency;Frequency)
                {
                }
                field("Notice Period";"Notice Period")
                {
                }
                field("Current Status";"Current Status")
                {
                }
                field(Remarks;Remarks)
                {
                }
                field("Inspection Party";"Inspection Party")
                {
                }
                field(Agency;Agency)
                {
                }
                field("Purpose of Instrument";"Purpose of Instrument")
                {
                }
                field("Usage Type";"Usage Type")
                {
                }
                field("Least Count";"Least Count")
                {
                }
                field(UOM;UOM)
                {
                }
            }
        }
    }

    actions
    {
    }
}

