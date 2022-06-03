report 60096 "Routing Line Movement1_ORGINAL"
{
    ProcessingOnly = true;

    dataset
    {
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

    trigger OnPreReport();
    begin
        IF Type = Type::" " THEN
            ERROR('You should selece the type');
        IF "No." = '' THEN
            ERROR('You should selece the No');
        IF "PorductionOrderNo." = '' THEN BEGIN
            ProdOrderRoutingLineRun.SETRANGE(Type, ProdOrderRoutingLineRun.Type::"Work Center");
            ProdOrderRoutingLineRun.SETRANGE(Status, ProdOrderRoutingLineRun.Status::Released);
            ProdOrderRoutingLineRun.SETRANGE("Starting Date", Date);
            ProdOrderRoutingLineRun.SETRANGE("Work Center No.", "WorkcenterNo.");
            ProdOrderRoutingLineRun.SETRANGE("Operation No.", "Operation No.");
            IF PAGE.RUNMODAL(60128, ProdOrderRoutingLineRun) = ACTION::LookupOK THEN BEGIN
                ProdOrderRoutingLineRun.RESET;
                ProdOrderRoutingLineRun.SETRANGE(Move, TRUE);
                IF ProdOrderRoutingLineRun.FIND('-') THEN
                    REPEAT
                        ProdOrderRoutingLineRun.Type := Type;
                        ProdOrderRoutingLineRun."No." := "No.";
                        ProdOrderRoutingLineRun.Move := FALSE;
                        ProdOrderRoutingLineRun.MODIFY;
                    UNTIL ProdOrderRoutingLineRun.NEXT = 0;
            END;
        END ELSE BEGIN
            ProdOrderRoutingLineRun.SETRANGE(Type, ProdOrderRoutingLineRun.Type::"Work Center");
            ProdOrderRoutingLineRun.SETRANGE(Status, ProdOrderRoutingLineRun.Status::Released);
            ProdOrderRoutingLineRun.SETRANGE("Starting Date", Date);
            ProdOrderRoutingLineRun.SETRANGE("Work Center No.", "WorkcenterNo.");
            ProdOrderRoutingLineRun.SETRANGE("Operation No.", "Operation No.");
            ProdOrderRoutingLineRun.SETRANGE("Prod. Order No.", "PorductionOrderNo.");
            ProdOrderRoutingLineRun.SETRANGE("Routing Reference No.", "Prod.OrderLineNo.");
            IF PAGE.RUNMODAL(60128, ProdOrderRoutingLineRun) = ACTION::LookupOK THEN BEGIN
                ProdOrderRoutingLineRun.RESET;
                ProdOrderRoutingLineRun.SETRANGE(Move, TRUE);
                IF ProdOrderRoutingLineRun.FIND('-') THEN
                    REPEAT
                        ProdOrderRoutingLineRun.Type := Type;
                        ProdOrderRoutingLineRun."No." := "No.";
                        ProdOrderRoutingLineRun.Move := FALSE;
                        ProdOrderRoutingLineRun.MODIFY;
                    UNTIL ProdOrderRoutingLineRun.NEXT = 0;
            END;
        END;
    end;

    var
        ProdOrderRoutingLine: Record "Prod. Order Routing Line";
        Date: Date;
        "WorkcenterNo.": Code[20];
        "Operation No.": Code[20];
        "PorductionOrderNo.": Code[20];
        "Prod.OrderLineNo.": Integer;
        Type: Option " ","Machine Center","Work Center";
        "No.": Code[20];
        ProdOrderRoutingLineRun: Record "Prod. Order Routing Line";
        MachineCenter: Record "Machine Center";
        WorkCenter: Record "Work Center";
        "Prod.Order": Record "Production Order";
        "Prod.OrderLine": Record "Prod. Order Line";
}

