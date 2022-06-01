page 60093 "Archived Tender list"
{
    // version B2B1.0

    CardPageID = "Archived Tender";
    Editable = false;
    PageType = List;
    SourceTable = "Tender Header Archive";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("Tender No."; "Tender No.")
                {
                }
                field("Tender Description"; "Tender Description")
                {
                }
                field("Customer No."; "Customer No.")
                {
                }
                field("Salesperson Code"; "Salesperson Code")
                {
                }
                field("Minimum Bid Amount"; "Minimum Bid Amount")
                {
                }
                field("Customer Tender No."; "Customer Tender No.")
                {
                }
                field("Tender Dated"; "Tender Dated")
                {
                }
                field("Tender doc Issue From"; "Tender doc Issue From")
                {
                }
                field("Tender doc Issue To"; "Tender doc Issue To")
                {
                }
                field("Submission Due Date"; "Submission Due Date")
                {
                }
                field("Submission Due Time"; "Submission Due Time")
                {
                }
                field("Tech. Bid Opening Date"; "Tech. Bid Opening Date")
                {
                }
            }
        }
    }

    actions
    {
    }
}

