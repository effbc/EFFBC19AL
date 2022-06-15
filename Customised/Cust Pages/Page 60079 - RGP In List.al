page 60079 "RGP In List"
{
    // version B2B1.0,Cal1.0

    CardPageID = "RGP In";
    PageType = List;
    SourceTable = "RGP In Header";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("RGP In No."; "RGP In No.")
                {
                }
                field("RGP In Date"; "RGP In Date")
                {
                }
                field("RGP In Posting Date"; "RGP In Posting Date")
                {
                }
                field("RGP Out No."; "RGP Out No.")
                {
                }
                field("RGP Out Date"; "RGP Out Date")
                {
                }
                field("RGP Out Posting Date"; "RGP Out Posting Date")
                {
                }
                field(Consignee; Consignee)
                {
                }
            }
        }
    }

    actions
    {
    }
}

