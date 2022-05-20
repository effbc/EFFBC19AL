page 60004 "Assign Certificate No's"
{
    // version B2B1.0

    PageType = List;
    SourceTable = "TDS Certificate Details";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("Document No.";"Document No.")
                {
                }
                field("Document Type";"Document Type")
                {
                }
                field("Customer Acc.No.";"Customer Acc.No.")
                {
                }
                field("TDS / Work Tax Amount";"TDS / Work Tax Amount")
                {
                }
                field("Posting Date";"Posting Date")
                {
                }
                field(Type;Type)
                {
                }
                field(Assign;Assign)
                {
                }
            }
        }
    }

    actions
    {
    }
}

