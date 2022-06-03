report 50052 "Production Bom Line Item Valid"
{
    ProcessingOnly = true;

    dataset
    {
        dataitem("Production BOM Header"; "Production BOM Header")
        {
            DataItemTableView = SORTING(No.);
            RequestFilterFields = "No.";
            dataitem("Production BOM Line"; "Production BOM Line")
            {
                DataItemLink = Production BOM No.=FIELD(No.);
                DataItemTableView = SORTING(Production BOM No., Version Code, Line No.);

                trigger OnAfterGetRecord();
                begin
                    IF Item.GET("Production BOM Line"."No.") THEN
                        VALIDATE("Quantity per");
                    "Production BOM Line".MODIFY;
                    //validate("Production BOM Header".Status,PreviousStauts);
                    "Production BOM Header".Status := PreviousStauts;
                    "Production BOM Header".VALIDATE(Status, PreviousStauts);
                    "Production BOM Header".MODIFY;
                end;
            }

            trigger OnAfterGetRecord();
            begin
                PreviousStauts := "Production BOM Header".Status;
                //MESSAGE('PreviousStauts is %1',PreviousStauts);
                "Production BOM Header".VALIDATE(Status, "Production BOM Header".Status::"Under Development");
                "Production BOM Header".MODIFY;
            end;

            trigger OnPreDataItem();
            begin
                PreviousStauts := 0;
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

    var
        Item: Record Item;
        PreviousStauts: Integer;
}

