page 33000256 "Quality Control Setup"
{
    // version QC1.1,Cal1.0

    PageType = Card;
    SourceTable = "Quality Control Setup";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Sampling Rounding"; "Sampling Rounding")
                {
                }
                field("Quality Before Receipt"; "Quality Before Receipt")
                {
                }
                field("Posted IDS. No. Is IDS No."; "Posted IDS. No. Is IDS No.")
                {
                }
            }
            group(Numbering)
            {
                Caption = 'Numbering';
                field("Specification Nos."; "Specification Nos.")
                {
                }
                field("Sub Assembly Nos."; "Sub Assembly Nos.")
                {
                }
                field("Inspection Datasheet Nos."; "Inspection Datasheet Nos.")
                {
                }
                field("Posted Inspect. Datasheet Nos."; "Posted Inspect. Datasheet Nos.")
                {
                }
                field("Inspection Receipt Nos."; "Inspection Receipt Nos.")
                {
                }
                field("Production Batch No."; "Production Batch No.")
                {
                }
                field("Purchase Consignment No."; "Purchase Consignment No.")
                {
                }
                field("Assay Nos."; "Assay Nos.")
                {
                }
                field("Equipment No."; "Equipment No.")
                {
                }
                field("Calibration Procedure No."; "Calibration Procedure No.")
                {
                }
            }
            group("Vendor Rating")
            {
                Caption = 'Vendor Rating';
                field("Rating Per Accepted Qty."; "Rating Per Accepted Qty.")
                {
                }
                field("Rating Per Accepted UD Qty."; "Rating Per Accepted UD Qty.")
                {
                }
                field("Rating Per Rework Qty."; "Rating Per Rework Qty.")
                {
                }
                field("Rating Per Rejected Qty."; "Rating Per Rejected Qty.")
                {
                }
            }
        }
    }

    actions
    {
    }
}

