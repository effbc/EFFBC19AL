page 33000260 "Sampling Plan Header"
{
    // version QC1.0

    PageType = Document;
    SourceTable = "Sampling Plan Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Code";Code)
                {
                }
                field(Description;Description)
                {
                }
                field(Status;Status)
                {
                }
                field("Standard Reference";"Standard Reference")
                {
                }
                field("AQL Percentage";"AQL Percentage")
                {
                }
                field("Sampling Type";"Sampling Type")
                {
                }
                field("Fixed Quantity";"Fixed Quantity")
                {
                }
                field("Lot Percentage";"Lot Percentage")
                {
                }
            }
            part(Control1000000006;"Sampling Line Subform")
            {
                SubPageLink = Sampling Code=FIELD(Code);
            }
        }
    }

    actions
    {
    }
}

