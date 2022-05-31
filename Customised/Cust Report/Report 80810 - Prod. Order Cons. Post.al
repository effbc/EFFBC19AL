report 80810 "Prod. Order Cons. Post"
{
    // version B2B

    ProcessingOnly = true;

    dataset
    {
        dataitem("Production Order"; "Production Order")
        {
            DataItemTableView = WHERE(Status = CONST(Released));
            RequestFilterFields = "No.", "Due Date";
            dataitem("Prod. Order Line"; "Prod. Order Line")
            {
                DataItemLink = Status = FIELD(Status), Prod. Order No.=FIELD(No.);
                DataItemTableView = SORTING(Status, Prod. Order No., Line No.);

                trigger OnAfterGetRecord();
                begin
                    //ProdOrder.GET("Prod. Order Line".Status,"Prod. Order Line"."Prod. Order No.");
                    ItemLedgEntry2.RESET;
                    ItemLedgEntry2.SETCURRENTKEY("Order No.", "Order Line No.");
                    ItemLedgEntry2.SETRANGE("Order No.", "Prod. Order No.");
                    ItemLedgEntry2.SETRANGE("Order Line No.", "Line No.");
                    ItemLedgEntry2.SETRANGE("Entry Type", ItemLedgEntry2."Entry Type"::Consumption);
                    IF ItemLedgEntry2.FINDFIRST THEN BEGIN
                        PostedMatIssHead.RESET;
                        PostedMatIssHead.SETCURRENTKEY("Prod. Order No.", "Prod. Order Line No.");
                        PostedMatIssHead.SETRANGE("Prod. Order No.", "Prod. Order Line"."Prod. Order No.");
                        PostedMatIssHead.SETRANGE("Prod. Order Line No.", "Prod. Order Line"."Line No.");
                        PostedMatIssHead.SETRANGE("Transfer-to Code", 'PROD');
                        IF PostedMatIssHead.FINDSET THEN
                            REPEAT
                                PostedMatIssLine.RESET;
                                PostedMatIssLine.SETRANGE("Document No.", PostedMatIssHead."No.");
                                //MESSAGE('%1',PostedMatIssLine.COUNT);
                                IF PostedMatIssLine.FINDSET THEN
                                    REPEAT
                                        ItemEntryRelation.RESET;
                                        ItemEntryRelation.SETCURRENTKEY("Source ID", "Source Type", "Source Subtype",
                                        "Source Ref. No.", "Source Prod. Order Line", "Source Batch Name");
                                        ItemEntryRelation.SETRANGE("Source ID", PostedMatIssLine."Document No.");
                                        ItemEntryRelation.SETRANGE("Source Type", DATABASE::"Posted Material Issues Line");
                                        ItemEntryRelation.SETRANGE("Source Batch Name", '');
                                        ItemEntryRelation.SETRANGE("Source Prod. Order Line", 0);
                                        ItemEntryRelation.SETRANGE("Source Ref. No.", PostedMatIssLine."Line No.");
                                        //MESSAGE('%1',ItemEntryRelation.COUNT);
                                        IF ItemEntryRelation.FINDFIRST THEN
                                            REPEAT
                                                IF ItemLedgEntry.GET(ItemEntryRelation."Item Entry No.") AND ItemLedgEntry.Open AND
                                                (ItemLedgEntry."Location Code" = 'PROD') THEN
                                                    UpdateItemJnlLine(ItemLedgEntry, "Prod. Order Line");
                                            UNTIL ItemEntryRelation.NEXT = 0;
                                    UNTIL PostedMatIssLine.NEXT = 0;
                            UNTIL PostedMatIssHead.NEXT = 0;
                    END;
                end;
            }

            trigger OnPostDataItem();
            begin
                Window.CLOSE;
                IF ItemjnlPosted THEN
                    MESSAGE('Consumption posted successfully.');
            end;

            trigger OnPreDataItem();
            begin
                Window.OPEN('Production Order No #1############\No of lines   #2################');
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
        PostedMatIssHead: Record "Posted Material Issues Header";
        PostedMatIssLine: Record "Posted Material Issues Line";
        ItemEntryRelation: Record "Item Entry Relation";
        ItemLedgEntry: Record "Item Ledger Entry";
        ItemJnlLine: Record "Item Journal Line";
        LineNo: Integer;
        ProdOrder: Record "Production Order";
        Item: Record Item;
        EntryNo: Integer;
        ItemJnlPost: Codeunit "Item Jnl.-Post Line";
        ItemLedgEntry2: Record "Item Ledger Entry";
        ItemjnlPosted: Boolean;
        Window: Dialog;
        NoofLines: Integer;

    [LineStart(18016)]
    procedure UpdateItemJnlLine(ItemLedgEntryPar: Record "Item Ledger Entry"; ProdOrderLinePar: Record "Prod. Order Line");
    var
        ItemEntryRelation: Record "Item Entry Relation";
    begin
        NoofLines += 1;
        ProdOrder.GET(ProdOrderLinePar.Status, ProdOrderLinePar."Prod. Order No.");
        Window.UPDATE(1, ProdOrder."No.");
        Window.UPDATE(2, NoofLines);
        ItemJnlLine.RESET;
        ItemJnlLine.SETRANGE("Journal Template Name", 'CONSUMPTIO');
        ItemJnlLine.SETRANGE("Journal Batch Name", 'DEFAULT');
        IF ItemJnlLine.FINDLAST THEN
            LineNo := ItemJnlLine."Line No." + 10000;
        ItemJnlLine.INIT;
        ItemJnlLine."Journal Template Name" := 'CONSUMPTIO';
        ItemJnlLine."Journal Batch Name" := 'DEFAULT';
        ItemJnlLine."Line No." := LineNo;
        ItemJnlLine.VALIDATE("Item No.", ItemLedgEntryPar."Item No.");
        ItemJnlLine.VALIDATE("Unit of Measure Code", ItemLedgEntryPar."Unit of Measure Code");
        ItemJnlLine."Posting Date" := WORKDATE;
        ItemJnlLine."Entry Type" := ItemJnlLine."Entry Type"::Consumption;
        ItemJnlLine.VALIDATE("Source No.", ProdOrder."Source No.");
        ItemJnlLine.VALIDATE("Source Type", ItemJnlLine."Source Type"::Item);
        ItemJnlLine."Document No." := 'Testing';
        ItemJnlLine.VALIDATE("Location Code", ProdOrder."Location Code");
        ItemJnlLine.VALIDATE(Quantity, ItemLedgEntryPar."Remaining Quantity");
        ItemJnlLine.VALIDATE("Order No.", ProdOrderLinePar."Prod. Order No.");
        ItemJnlLine.VALIDATE("Order Line No.", ProdOrderLinePar."Line No.");
        ItemJnlLine."Shortcut Dimension 1 Code" := ProdOrder."Shortcut Dimension 1 Code";
        ItemJnlLine."Shortcut Dimension 2 Code" := ProdOrder."Shortcut Dimension 2 Code";
        IF Item.GET(ItemJnlLine."Item No.") AND
            (Item."Item Tracking Code" <> '') THEN
            UdateReservationeEntry(ItemJnlLine, ItemLedgEntryPar);
        ItemJnlPost.RUN(ItemJnlLine);
        ItemjnlPosted := TRUE;
    end;

    [LineStart(18049)]
    procedure UdateReservationeEntry(ItemJnlPar: Record "Item Journal Line"; ItemLedgEntry2: Record "Item Ledger Entry");
    var
        TempReservEntry: Record "Reservation Entry";
        ReservationEntry: Record "Reservation Entry";
    begin
        IF TempReservEntry.FINDLAST THEN
            EntryNo := TempReservEntry."Entry No." + 1
        ELSE
            EntryNo := 1;
        ReservationEntry.INIT;
        ReservationEntry."Entry No." := EntryNo;
        ReservationEntry.VALIDATE("Item No.", ItemJnlPar."Item No.");
        ReservationEntry.VALIDATE("Location Code", ItemJnlPar."Location Code");
        ReservationEntry."Reservation Status" := ReservationEntry."Reservation Status"::Prospect;
        ReservationEntry."Source Type" := 83;
        ReservationEntry."Source Subtype" := 5;
        ReservationEntry."Source ID" := ItemJnlPar."Journal Template Name";
        ReservationEntry."Source Batch Name" := ItemJnlPar."Journal Batch Name";
        ReservationEntry."Source Ref. No." := ItemJnlPar."Line No.";
        ReservationEntry.VALIDATE("Quantity (Base)", -ItemJnlPar.Quantity);
        ReservationEntry.VALIDATE("Qty. to Handle (Base)", ReservationEntry."Quantity (Base)");
        ReservationEntry.VALIDATE("Qty. to Invoice (Base)", ReservationEntry."Quantity (Base)");
        ReservationEntry.VALIDATE("Lot No.", ItemLedgEntry2."Lot No.");
        ReservationEntry.VALIDATE("Serial No.", ItemLedgEntry2."Serial No.");
        ReservationEntry."Planning Flexibility" := ReservationEntry."Planning Flexibility"::Unlimited;
        ReservationEntry.INSERT;
        //MESSAGE('%1',ReservationEntry);
    end;
}

