report 50163 "Test report- Orders"
{
    ProcessingOnly = true;

    dataset
    {
        dataitem("Order Address"; "Order Address")
        {

            trigger OnAfterGetRecord();
            begin
                "Order Address".State := "Order Address".State2;
                "Order Address"."GST Registration No." := "Order Address"."GST Registration No.2";
                "Order Address".MODIFY;
            end;

            trigger OnPostDataItem();
            begin
                MESSAGE('DOne');
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }
}

