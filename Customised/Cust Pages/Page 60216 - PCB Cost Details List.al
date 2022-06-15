page 60216 "PCB Cost Details List"
{
    CardPageID = "PCB Cost Details Card";
    PageType = List;
    SourceTable = "PCB Cost Details";

    layout
    {
        area(content)
        {
            repeater(Control1102156000)
            {
                ShowCaption = false;
                field("Vendor No."; "Vendor No.")
                {
                }
                field(Name; Name)
                {
                }
                field("PCB Thickness"; "PCB Thickness")
                {
                }
                field("Copper Clad Thickness"; "Copper Clad Thickness")
                {
                }
                field("Min.Quantity"; "Min.Quantity")
                {
                }
                field("Max.Quantity"; "Max.Quantity")
                {
                }
                field("Min.Area"; "Min.Area")
                {
                }
                field("Max.Area"; "Max.Area")
                {
                }
                field(Cost; Cost)
                {
                }
                field("Area"; Area)
                {
                }
                field(Date; Date)
                {
                }
                field("PCB TYPE"; "PCB TYPE")
                {
                }
            }
        }
    }

    actions
    {
    }
}

