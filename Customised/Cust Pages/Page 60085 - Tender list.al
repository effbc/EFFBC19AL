page 60085 "Tender list"
{
    // version B2B1.0

    CardPageID = Tender;
    Editable = false;
    PageType = List;
    SourceTable = "Tender Header";
    SourceTableView = WHERE(Old Tender=CONST(No));

    layout
    {
        area(content)
        {
            field("xRec.COUNT";xRec.COUNT)
            {
            }
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("Tender No.";"Tender No.")
                {
                }
                field(TenderType;TenderType)
                {
                }
                field("Tender Description";"Tender Description")
                {
                }
                field(Product;Product)
                {
                }
                field("Customer Name";"Customer Name")
                {
                }
                field(Status;Status)
                {
                }
                field("Tender Status";"Tender Status")
                {
                }
                field("EMD Status";"EMD Status")
                {
                }
                field("EMD Amount";"EMD Amount")
                {
                }
                field("Customer No.";"Customer No.")
                {
                }
                field("Customer Tender No.";"Customer Tender No.")
                {
                }
                field("Minimum Bid Amount";"Minimum Bid Amount")
                {
                }
                field("Tender Dated";"Tender Dated")
                {
                }
                field("Salesperson Code";"Salesperson Code")
                {
                }
                field("Tender doc Issue From";"Tender doc Issue From")
                {
                }
                field("Tender doc Issue To";"Tender doc Issue To")
                {
                }
                field("Submission Due Date";"Submission Due Date")
                {
                }
                field("Submission Due Time";"Submission Due Time")
                {
                }
                field("Tech. Bid Opening Date";"Tech. Bid Opening Date")
                {
                }
                field("Sent For Auth";"Sent For Auth")
                {
                }
            }
        }
    }

    actions
    {
    }
}

