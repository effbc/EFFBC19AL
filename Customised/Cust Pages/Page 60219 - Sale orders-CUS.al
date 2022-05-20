page 60219 "Sale orders-CUS"
{
    Editable = true;
    PageType = List;
    SourceTable = "Sales Invoice-Dummy";

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
                field("Sell-to Customer No.";"Sell-to Customer No.")
                {
                }
                field("Bill-to Name";"Bill-to Name")
                {
                }
                field("Customer OrderNo.";"Customer OrderNo.")
                {
                }
                field("Customer Posting Group";"Customer Posting Group")
                {
                }
            }
        }
    }

    actions
    {
    }
}

