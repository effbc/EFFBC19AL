page 60003 "Assign Form No's"
{
    // version B2B1.0

    PageType = List;
    SourceTable = "Form Tracking";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field(State; State)
                {
                }
                field("Document Type"; "Document Type")
                {
                }
                field("Document No."; "Document No.")
                {
                }
                field("Vendor / Customer No."; "Vendor / Customer No.")
                {
                }
                field("Invoice Base Amount"; "Invoice Base Amount")
                {
                }
                field("Sales Tax Base Amount"; "Sales Tax Base Amount")
                {
                }
                field("Sales Tax Amount"; "Sales Tax Amount")
                {
                }
                field("Assign Form No."; "Assign Form No.")
                {
                }
            }
        }
    }

    actions
    {
    }
}

