page 60243 "CS Transaction List"
{
    CardPageID = "CS Transaction Card";
    Editable = false;
    PageType = List;
    SourceTable = "CS Transaction Header";

    layout
    {
        area(content)
        {
            field("xRec.COUNT";xRec.COUNT)
            {
            }
            repeater(Group)
            {
                field("Transaction ID";"Transaction ID")
                {
                }
                field("Transaction Type";"Transaction Type")
                {
                }
                field("Transfer From Location";"Transfer From Location")
                {
                }
                field("Transfer To Location";"Transfer To Location")
                {
                }
                field("Mode of Transport";"Mode of Transport")
                {
                }
                field("Courier Details";"Courier Details")
                {
                }
                field("Transaction Status";"Transaction Status")
                {
                }
                field(Status;Status)
                {
                }
                field("Posting Date";"Posting Date")
                {
                }
                field("User ID";"User ID")
                {
                }
                field("Created Date";"Created Date")
                {
                }
                field(Remarks;Remarks)
                {
                }
                field("Customer No";"Customer No")
                {
                }
                field("Customer Name";"Customer Name")
                {
                }
                field("DC No";"DC No")
                {
                }
            }
        }
    }

    actions
    {
    }
}

