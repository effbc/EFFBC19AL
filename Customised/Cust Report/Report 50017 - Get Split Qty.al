report 50017 "Get Split Qty"
{
    // version Rev01

    ProcessingOnly = true;

    dataset
    {
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Control1102152001)
                {
                    ShowCaption = false;
                    field("Enter the Qty. to Split"; '')
                    {
                        Caption = 'Enter the Qty. to Split';
                    }
                    field(InputQty; InputQty)
                    {
                        ShowCaption = false;
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        InputQty: Decimal;

    (602)]
    procedure SetQTY(var ReqQty: Decimal);
    begin
        ReqQty := InputQty;
    end;
}

