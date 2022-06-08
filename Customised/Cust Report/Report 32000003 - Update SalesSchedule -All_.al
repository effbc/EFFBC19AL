report 32000003 "Update Sales/Schedule -All_"
{
    // version UPG1.3

    // No. sign   Description
    // ---------------------------------------------------
    // 1.3 UPG    BOM Replacement process created this object.
    // 1.3.1 UPG  Added code for "onPostReport" Trigger for displaying "Sale/ Schedule Item Change Log" data,OnPreReport trigger for
    //              Finding last Entry.

    ProcessingOnly = true;
    TransactionType = Update;

    dataset
    {
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    field("Old BOM No."; OldItemNo)
                    {
                        ShowMandatory = true;
                        TableRelation = Item WHERE(Blocked = CONST(No));

                        trigger OnValidate();
                        begin
                            IF (OldItemNo <> '') AND (OldItemNo = NewItemNo) THEN
                                ERROR(SameItemErr);
                        end;
                    }
                    field("New BOM No."; NewItemNo)
                    {
                        ShowMandatory = true;
                        TableRelation = Item WHERE(Blocked = CONST(No));

                        trigger OnValidate();
                        begin
                            IF (NewItemNo <> '') AND (OldItemNo = NewItemNo) THEN
                                ERROR(SameItemErr);
                        end;
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

    trigger OnInitReport();
    begin
        CLEAR(EntryNo);
    end;

    trigger OnPostReport();
    begin
        //UPG1.3.1>>
        SaleScheduleItemChangeLog.RESET;
        SaleScheduleItemChangeLog.SETFILTER("Entry No.", '%1..', EntryNo);
        REPORT.RUNMODAL(32000001, FALSE, FALSE, SaleScheduleItemChangeLog);
        //UPG1.3.1<<
    end;

    trigger OnPreReport();
    var
        ReleaseSalesDocument: Codeunit "Release Sales Document";
    begin
        //UPG1.3.1>>
        SaleScheduleItemChangeLog.RESET;
        IF SaleScheduleItemChangeLog.FINDLAST THEN
            EntryNo := SaleScheduleItemChangeLog."Entry No." + 1;
        //UPG1.3.1<<
        IF (NewItemNo = '') OR (OldItemNo = '') THEN
            ERROR(SelectErr);

        SalesOrdersTemp.DELETEALL;

        SalesLine.RESET;
        SalesLine.SETRANGE("Document Type", SalesLine."Document Type"::Order);
        SalesLine.SETRANGE(Type, SalesLine.Type::Item);
        SalesLine.SETRANGE("No.", OldItemNo);
        IF SalesLine.FINDSET THEN
            REPEAT
                IF SalesHdr.GET(SalesLine."Document Type", SalesLine."Document No.") THEN
                    IF NOT (CheckIfMaterialIssueExist(SalesLine."Document No.", SalesLine."Line No.", 0) AND CheckIfPostedMaterialIssueExist(SalesLine."Document No.", SalesLine."Line No.", 0)) THEN BEGIN
                        SalesOrdersTemp.INIT;
                        SalesOrdersTemp."Sales Order No." := SalesHdr."No.";
                        IF SalesOrdersTemp.INSERT THEN;
                    END;
            UNTIL SalesLine.NEXT = 0;

        Schedule2.RESET;
        Schedule2.SETRANGE("Document Type", Schedule2."Document Type"::Order);
        Schedule2.SETRANGE(Type, Schedule2.Type::Item);
        Schedule2.SETRANGE("No.", OldItemNo);
        IF Schedule2.FINDSET THEN
            REPEAT
                IF SalesHdr.GET(SalesHdr."Document Type"::Order, Schedule2."Document No.") THEN
                    IF NOT CheckIfMaterialIssueExist(
                      Schedule2."Document No.",
                      Schedule2."Document Line No.",
                      Schedule2."Line No.")
                    THEN BEGIN
                        SalesOrdersTemp.INIT;
                        SalesOrdersTemp."Sales Order No." := SalesHdr."No.";
                        IF SalesOrdersTemp.INSERT THEN;
                    END;
            UNTIL Schedule2.NEXT = 0;

        SalesOrdersTemp.RESET;
        IF NOT SalesOrdersTemp.FINDSET THEN
            ERROR(OrdersNotFoundErr, OldItemNo);

        COMMIT;
        CLEAR(SalesOrderTempPage);
        SalesOrderTempPage.LOOKUPMODE(TRUE);
        SalesOrderTempPage.SETTABLEVIEW(SalesOrdersTemp);
        IF SalesOrderTempPage.RUNMODAL <> ACTION::LookupOK THEN
            CurrReport.QUIT;

        SalesOrderTempPage.SetSelection(SalesOrdersTemp);

        IF SalesOrdersTemp.FINDSET THEN
            REPEAT
                SalesHdr.GET(SalesHdr."Document Type"::Order, SalesOrdersTemp."Sales Order No.");
                SalesHdr.MARK(TRUE);
            UNTIL SalesOrdersTemp.NEXT = 0;

        SalesHdr.MARKEDONLY(TRUE);
        IF SalesHdr.FINDSET THEN BEGIN
            Window.OPEN('Order No. ###1##############');
            REPEAT
                IF SalesHdr.Status = SalesHdr.Status::Released THEN BEGIN
                    CLEAR(ReleaseSalesDocument);
                    ReleaseSalesDocument.Reopen(SalesHdr);
                END;
                Window.UPDATE(1, SalesHdr."No.");
                SalesLine.RESET;
                SalesLine.SETCURRENTKEY("Document Type", "Document No.", "Line No.");
                SalesLine.SETRANGE("Document Type", SalesHdr."Document Type");
                SalesLine.SETRANGE("Document No.", SalesHdr."No.");
                SalesLine.SETRANGE(Type, SalesLine.Type::Item);
                SalesLine.SETRANGE("No.", OldItemNo);
                IF SalesLine.FINDSET THEN
                    REPEAT
                        SalesLine.SetSkipOrderVerification;
                        SalesLine.VALIDATE("No.", NewItemNo);  //commented by Vishnu Priya on 11-06-2019
                        SalesLine.MODIFY;

                        UpdateProdOrder(SalesLine."Document No.", SalesLine."Line No.", 0, SalesLine."No.");
                    UNTIL SalesLine.NEXT = 0;

                Schedule2.RESET;
                Schedule2.SETCURRENTKEY("Document Type", "Document No.", "Document Line No.", "Line No.");
                Schedule2.SETRANGE("Document Type", Schedule2."Document Type"::Order);
                Schedule2.SETRANGE("Document No.", SalesHdr."No.");
                Schedule2.SETRANGE(Type, Schedule2.Type::Item);
                Schedule2.SETRANGE("No.", OldItemNo);
                IF Schedule2.FINDSET THEN
                    REPEAT
                        Schedule2.SetSkipOrderVerification;
                        Schedule2.VALIDATE("No.", NewItemNo);  //commented by Vishnu Priya on 11-06-2019
                        Schedule2.MODIFY;

                        UpdateProdOrder(Schedule2."Document No.", Schedule2."Document Line No.", Schedule2."Line No.", Schedule2."No.");
                    UNTIL Schedule2.NEXT = 0;
            UNTIL SalesHdr.NEXT = 0;
            Window.CLOSE;
        END;
    end;

    var
        NewItemNo: Code[20];
        SelectErr: Label 'Select both BOMs to update';
        OldItemNo: Code[20];
        SameItemErr: Label 'Old & New BOMs should not be same.';
        SalesOrdersTemp: Record "Sales Orders Temp";
        SalesOrderTempPage: Page "Sales Order Temp";
        OrdersNotFoundErr: Label 'No Sales Orders found with BOM No.';
        SalesHdr: Record "Sales Header";
        SalesLine: Record "Sales Line";
        Schedule2: Record Schedule2;
        Window: Dialog;
        ProductionOrderRef: Record "Production Order";
        EntryNo: Integer;
        SaleScheduleItemChangeLog: Record "Sale/ Schedule Item Change Log";

    (20017)]
    local procedure CheckIfMaterialIssueExist(OrderNoP: Code[20]; OrderLineNoP: Integer; ScheduleLineNoP: Integer): Boolean;
    var
        ProductionOrder: Record "Production Order";
        MaterialIssuesHeader: Record "Material Issues Header";
        ProdOrderLine: Record "Prod. Order Line";
    begin
        ProductionOrder.SETRANGE(Status, ProductionOrder.Status::Released);
        ProductionOrder.SETRANGE("Sales Order No.", OrderNoP);
        ProductionOrder.SETRANGE("Sales Order Line No.", OrderLineNoP);
        ProductionOrder.SETRANGE("Schedule Line No.", ScheduleLineNoP);
        IF ProductionOrder.FINDSET THEN
            REPEAT
                MaterialIssuesHeader.RESET;
                MaterialIssuesHeader.SETRANGE("Prod. Order No.", ProductionOrder."No.");
                IF MaterialIssuesHeader.FINDFIRST THEN
                    EXIT(TRUE);

                ProdOrderLine.RESET;
                ProdOrderLine.SETRANGE(Status, ProductionOrder.Status);
                ProdOrderLine.SETRANGE("Prod. Order No.", ProductionOrder."No.");
                ProdOrderLine.SETFILTER("Finished Quantity", '<>%1', 0);
                IF ProdOrderLine.FINDFIRST THEN
                    EXIT(TRUE);
            UNTIL ProductionOrder.NEXT = 0;

        EXIT(FALSE);
    end;

    (20039)]
    local procedure UpdateProdOrder(OrderNoP: Code[20]; OrderLineNoP: Integer; ScheduleLineNoP: Integer; NewItemNoP: Code[20]);
    var
        ProductionOrder: Record "Production Order";
        RefreshProdOrder: Report "Refresh Production Order";
    begin
        ProductionOrder.SETRANGE(Status, ProductionOrder.Status::Released);
        ProductionOrder.SETRANGE("Sales Order No.", OrderNoP);
        ProductionOrder.SETRANGE("Sales Order Line No.", OrderLineNoP);
        ProductionOrder.SETRANGE("Schedule Line No.", ScheduleLineNoP);
        IF ProductionOrder.FINDSET THEN
            REPEAT
                ProductionOrder.VALIDATE("Source No.", NewItemNoP);
                ProductionOrder.MODIFY;

                //Refresh

                CLEAR(RefreshProdOrder);
                /*
                RefreshProdOrder.USEREQUESTPAGE(FALSE);
                RefreshProdOrder.SETTABLEVIEW(ProductionOrder);
                RefreshProdOrder.RUN;
                */
                ProductionOrderRef.RESET;
                ProductionOrderRef.SETRANGE(Status, ProductionOrderRef.Status::Released);
                ProductionOrderRef.SETRANGE("No.", ProductionOrder."No.");
                IF ProductionOrderRef.FINDFIRST THEN BEGIN
                    RefreshProdOrder.USEREQUESTPAGE(FALSE);
                    RefreshProdOrder.SETTABLEVIEW(ProductionOrderRef);
                    RefreshProdOrder.RUN;

                    UpdateChangeLog(
                      ProductionOrder."Sales Order No.",
                      ProductionOrder."Sales Order Line No.",
                      ProductionOrder."Schedule Line No.",
                      ProductionOrder."No.",
                      OldItemNo,
                      NewItemNo);
                END;
            UNTIL ProductionOrder.NEXT = 0
        ELSE
            UpdateChangeLog(
              OrderNoP,
              OrderLineNoP,
              ScheduleLineNoP,
              '',
              OldItemNo,
              NewItemNo);

    end;

    (20083)]
    local procedure UpdateChangeLog(OrderNoP: Code[20]; OrderLineNoP: Integer; ScheduleLineNoP: Integer; ProdOrderNo: Code[20]; OldItemNoP: Code[20]; NewItemNoP: Code[20]);
    var
        SaleScheduleItemChangeLog: Record "Sale/ Schedule Item Change Log";
    begin
        WITH SaleScheduleItemChangeLog DO BEGIN
            INIT;
            "Sales Order No." := OrderNoP;
            "Sales Order Line No." := OrderLineNoP;
            "Schedule Line No." := ScheduleLineNoP;
            "RPO No." := ProdOrderNo;
            "Old Item No." := OldItemNoP;
            "New Item No." := NewItemNoP;
            INSERT(TRUE);
        END;
    end;

    (20095)]
    local procedure CheckIfPostedMaterialIssueExist(OrderNoP: Code[20]; OrderLineNoP: Integer; ScheduleLineNoP: Integer): Boolean;
    var
        ProductionOrder: Record "Production Order";
        MaterialIssuesHeader: Record "Material Issues Header";
        ProdOrderLine: Record "Prod. Order Line";
        Posted_MaterialIssues: Record "Posted Material Issues Header";
    begin
        ProductionOrder.SETRANGE(Status, ProductionOrder.Status::Released);
        ProductionOrder.SETRANGE("Sales Order No.", OrderNoP);
        ProductionOrder.SETRANGE("Sales Order Line No.", OrderLineNoP);
        ProductionOrder.SETRANGE("Schedule Line No.", ScheduleLineNoP);
        IF ProductionOrder.FINDSET THEN
            REPEAT
                Posted_MaterialIssues.RESET;
                Posted_MaterialIssues.SETRANGE("Prod. Order No.", ProductionOrder."No.");
                IF Posted_MaterialIssues.FINDFIRST THEN
                    EXIT(TRUE);
                ProdOrderLine.RESET;
                ProdOrderLine.SETRANGE(Status, ProductionOrder.Status);
                ProdOrderLine.SETRANGE("Prod. Order No.", ProductionOrder."No.");
                ProdOrderLine.SETFILTER("Finished Quantity", '<>%1', 0);
                IF ProdOrderLine.FINDFIRST THEN
                    EXIT(TRUE);
            UNTIL ProductionOrder.NEXT = 0;

        EXIT(FALSE);
    end;
}

