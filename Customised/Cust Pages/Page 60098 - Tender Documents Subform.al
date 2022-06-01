page 60098 "Tender Documents Subform"
{
    // version B2B1.0

    AutoSplitKey = true;
    Editable = false;
    PageType = List;
    SourceTable = "Tender Documents";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field(Type; Type)
                {
                }
                field(Purpose; Purpose)
                {
                }
                field("No."; "No.")
                {
                }
                field("Transaction Type"; "Transaction Type")
                {
                }
                field("Payment/Receipt/Adjusted Date"; "Payment/Receipt/Adjusted Date")
                {
                }
                field(Amount; Amount)
                {
                }
                field("Received / Adjusted"; "Received / Adjusted")
                {
                }
            }
        }
    }

    actions
    {
    }
}

