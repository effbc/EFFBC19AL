report 50051 "Update StartDT Prod Line"
{
    ProcessingOnly = true;

    dataset
    {
        dataitem("Prod. Order Routing Line";"Prod. Order Routing Line")
        {
            DataItemTableView = SORTING(Status,Prod. Order No.,Routing Reference No.,Routing No.,Operation No.) ORDER(Ascending);

            trigger OnPreDataItem();
            begin
                ProdOrderRoutingLine.SETRANGE(Status,ProdOrderRoutingLine.Status::Released);
                ProdOrderRoutingLine.SETRANGE("Prod. Order No.",ProdOrderNo);
                ProdOrderRoutingLine.SETRANGE("Operation No.",OperationNo);
                IF ProdOrderRoutingLine.FIND('-') THEN BEGIN
                  REPEAT
                    ProdOrderRoutingLine.VALIDATE("Starting Date",SDDate);
                    ProdOrderRoutingLine.MODIFY;
                  UNTIL ProdOrderRoutingLine.NEXT = 0;
                END;
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
        ProdOrderNo : Code[20];
        OperationNo : Code[20];
        ProdOrderRoutingLine : Record "Prod. Order Routing Line";
        ProdOrderRoutingLine2 : Record "Prod. Order Routing Line";
        SDDate : Date;
}

