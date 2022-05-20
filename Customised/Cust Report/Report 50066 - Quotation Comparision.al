report 50066 "Quotation Comparision"
{
    // version POAU

    ProcessingOnly = true;
    TransactionType = Update;
    UseRequestPage = false;

    dataset
    {
        dataitem("Quotation Comparision";"Quotation Comparision")
        {

            trigger OnAfterGetRecord();
            begin
                /*
                PurchaseHeaderOrder.SETRANGE("Quotation No.","Quotation Comparision"."Parent Quote No.");
                IF PurchaseHeaderOrder.FIND('-') THEN BEGIN
                  PurchaseLineOrder.INIT;
                  PurchaseLineOrder."Document Type" := PurchaseLineOrder."Document Type" :: Order;
                  PurchaseLineOrder."Document No." := PurchaseHeaderOrder."No.";
                  PurchaseLineOrder."Buy-from Vendor No." := PurchaseHeaderOrder."Buy-from Vendor No.";
                  PurchaseHeaderOrder.VALIDATE("Buy-from Vendor No.");
                  PurchaseLineOrder."Line No." := PurchaseLineOrder."Line No." + 10000;
                  //PurchaseLineOrder."Quote No." := "Quotation Comparision"."Parent Quote No.";
                  PurchaseLineOrder.Type := PurchaseLineOrder.Type :: Item;
                  PurchaseLineOrder."No." := "Quotation Comparision"."Item No.";
                  PurchaseLineOrder.Quantity := "Quotation Comparision".Quantity;
                  PurchaseLineOrder."Direct Unit Cost" := "Quotation Comparision".Rate;
                  PurchaseLineOrder.VALIDATE("No.");
                  PurchaseLineOrder.VALIDATE(Quantity);
                  PurchaseLineOrder.VALIDATE("Direct Unit Cost");
                  PurchaseLineOrder."Indent No." := "Quotation Comparision"."Indent No.";
                  PurchaseLineOrder."Indent Line No." := "Quotation Comparision"."Indent Line No.";
                  PurchaseLineOrder.VALIDATE("Location Code","Quotation Comparision"."Location Code");//Reach SSR
                  PurchaseLineOrder.INSERT;
                  //Reach-SSR
                  IndentLine.RESET;
                  IF IndentLine.GET("Quotation Comparision"."Indent No.","Quotation Comparision"."Indent Line No.") THEN BEGIN
                     IndentLine."Indent Status" := IndentLine."Indent Status"::Order;
                     IndentLine.MODIFY;
                  END;
                  //Reach SSR end
                END ELSE*/
                 BEGIN
                  PurchaseHeader.SETRANGE("Document Type",PurchaseHeader."Document Type" :: Quote);
                  PurchaseHeader.SETRANGE("No.","Parent Quote No.");
                  IF PurchaseHeader.FIND('-') THEN BEGIN
                    PurchaseHeaderOrder."Document Type" := PurchaseHeaderOrder."Document Type" :: Order;
                    PPSetup.GET;
                    PurchaseHeaderOrder."No." := NoSeriesMgt.GetNextNo(PPSetup."Order Nos.",WORKDATE,TRUE);
                    PurchaseHeaderOrder."Posting Date" := WORKDATE;
                    PurchaseHeaderOrder."Document Date" := WORKDATE;
                    PurchaseHeaderOrder."Buy-from Vendor No." := PurchaseHeader."Buy-from Vendor No.";
                    PurchaseHeaderOrder.VALIDATE("Buy-from Vendor No.");
                    PurchaseHeaderOrder."Quotation No." := "Parent Quote No.";
                    PurchaseHeaderOrder.Structure := Structure;
                    PurchaseHeaderOrder.VALIDATE(Structure);
                    PurchaseHeaderOrder.VALIDATE("Location Code",PurchaseHeader."Location Code");//Reach SSR
                    PurchaseHeaderOrder.INSERT;
                    PurchaseLine.SETRANGE("Document Type",PurchaseLine."Document Type" :: Quote);
                    PurchaseLine.SETRANGE("Document No.","Parent Quote No.");
                    PurchaseLine.SETRANGE(Type,PurchaseLine.Type :: Item);
                    PurchaseLine.SETRANGE("No.","Item No.");
                    IF PurchaseLine.FIND('-') THEN BEGIN
                      PurchaseLineOrder.INIT;
                      PurchaseLineOrder.RESET;
                      PurchaseLineOrder."Document Type" := PurchaseHeaderOrder."Document Type";
                      PurchaseLineOrder."Document No." := PurchaseHeaderOrder."No.";
                      PurchaseLineOrder."Buy-from Vendor No." := PurchaseLine."Buy-from Vendor No.";
                      PurchaseLineOrder."Line No." := PurchaseLine."Line No." + 10000;//sankar modified line no
                      PurchaseLineOrder.Type := PurchaseLineOrder.Type :: Item;
                      PurchaseLineOrder."No." := "Item No.";
                      PurchaseLineOrder.Quantity := Quantity;
                      PurchaseLineOrder.VALIDATE("Buy-from Vendor No.");
                      PurchaseLineOrder.VALIDATE("No.");
                      PurchaseLineOrder.VALIDATE(Quantity);
                      PurchaseLineOrder."Direct Unit Cost" := Rate;
                      PurchaseLineOrder.VALIDATE("Direct Unit Cost");
                      PurchaseLineOrder."Location Code" :="Quotation Comparision"."Location Code";
                      PurchaseLineOrder."Indent No." := "Quotation Comparision"."Indent No.";
                      PurchaseLineOrder."Indent Line No." := "Quotation Comparision"."Indent Line No.";
                      PurchaseLineOrder.INSERT(TRUE);
                     //Reach-SSR
                     IndentLine.RESET;
                     IndentLine.SETRANGE("Delivery Location","Quotation Comparision"."Location Code");
                     IndentLine.SETRANGE("No.","Quotation Comparision"."Item No.");
                     IndentLine.SETRANGE("ICN No.","Quotation Comparision"."ICN No.");
                     IF IndentLine.FIND('-') THEN
                       REPEAT
                         IndentLine."Indent Status" := IndentLine."Indent Status"::Order;
                         IndentLine.MODIFY;
                       UNTIL IndentLine.NEXT = 0;
                    /* IF IndentLine.GET("Quotation Comparision"."Indent No.","Quotation Comparision"."Indent Line No.") THEN BEGIN
                       IndentLine."Indent Status" := IndentLine."Indent Status"::Order;
                       IndentLine.MODIFY;
                     END;
                     */
                     //Reach SSR end
                
                
                    END;
                  END;
                END;
                
                
                
                
                
                /*
                PurchaseHeaderOrder.SETRANGE("Quotation No.","Parent Quote No.");
                IF PurchaseHeaderOrder.FIND('-') THEN BEGIN
                  PurchaseLineOrder.RESET;
                  PurchaseLineOrder.SETRANGE("Document No.",PurchaseHeaderOrder."No.");
                  IF PurchaseLineOrder.FIND('+') THEN
                    TempLineNo := PurchaseLineOrder."Line No."
                  ELSE
                    TempLineNo := 0;
                  PurchaseLineOrder.INIT;
                  PurchaseLineOrder."Document Type" := PurchaseLineOrder."Document Type" :: Order;
                  PurchaseLineOrder."Document No." := PurchaseHeaderOrder."No.";
                  PurchaseLineOrder."Buy-from Vendor No." := PurchaseHeaderOrder."Buy-from Vendor No.";
                  PurchaseHeaderOrder.VALIDATE("Buy-from Vendor No.");
                //  PurchaseLineOrder."Line No." := PurchaseLineOrder."Line No." + 10000;
                  PurchaseLineOrder."Line No." := TempLineNo + 10000;
                //  PurchaseLineOrder."Quote No." := "Quotation Comparision"."Parent Quote No.";
                  PurchaseLineOrder.Type := PurchaseLineOrder.Type :: Item;
                  PurchaseLineOrder."No." := "Quotation Comparision"."Item No.";
                  PurchaseLineOrder.Quantity := "Quotation Comparision".Quantity;
                  PurchaseLineOrder.VALIDATE("No.");
                  PurchaseLineOrder.VALIDATE(Quantity);
                  PurchaseLineOrder."Indent No." := "Quotation Comparision"."Indent No.";
                  PurchaseLineOrder."Indent Line No." := "Quotation Comparision"."Indent Line No.";
                  PurchaseLineOrder.VALIDATE("Direct Unit Cost");
                  PurchaseLineOrder."Direct Unit Cost" := "Quotation Comparision".Rate;
                  PurchaseLineOrder.VALIDATE("Direct Unit Cost");
                  PurchaseLineOrder."Location Code":="Quotation Comparision"."Location Code";
                  PurchaseLineOrder.INSERT;
                     IndentLine.RESET;
                  IF IndentLine.GET("Quotation Comparision"."Indent No.","Quotation Comparision"."Indent Line No.") THEN BEGIN
                     IndentLine."Indent Status" := IndentLine."Indent Status"::Order;
                     IndentLine.MODIFY;
                  END;
                END ELSE
                BEGIN
                  PurchaseHeader.SETRANGE("Document Type",PurchaseHeader."Document Type" :: Quote);
                  PurchaseHeader.SETRANGE("No.","Parent Quote No.");
                  IF PurchaseHeader.FIND('-') THEN BEGIN
                    PurchaseHeaderOrder."Document Type" := PurchaseHeaderOrder."Document Type" :: Order;
                    PPSetup.GET;
                    PurchaseHeaderOrder."No." := NoSeriesMgt.GetNextNo(PPSetup."Order Nos.",WORKDATE,TRUE);
                    PurchaseLineOrder2.RESET;
                    IF PurchaseLineOrder2.GET(PurchaseHeaderOrder."Document Type" :: Order,PurchaseHeaderOrder."No.") THEN
                      ERROR('Record already Existed.');
                    PurchaseHeaderOrder."Posting Date" := WORKDATE;
                    PurchaseHeaderOrder."Document Date" := WORKDATE;
                    PurchaseHeaderOrder."Buy-from Vendor No." := PurchaseHeader."Buy-from Vendor No.";
                    PurchaseHeaderOrder.VALIDATE("Buy-from Vendor No.");
                    PurchaseHeaderOrder."Quotation No." := "Parent Quote No.";
                    PurchaseHeaderOrder.Structure := Structure;
                    PurchaseHeaderOrder.VALIDATE(Structure);
                    PurchaseHeaderOrder."Expected Receipt Date":="Quotation Comparision"."Due Date";
                    PurchaseHeaderOrder.INSERT;
                    PurchaseLine.SETRANGE("Document Type",PurchaseLine."Document Type" :: Quote);
                    PurchaseLine.SETRANGE("Document No.","Parent Quote No.");
                    PurchaseLine.SETRANGE(Type,PurchaseLine.Type :: Item);
                    PurchaseLine.SETRANGE("No.","Item No.");
                    IF PurchaseLine.FIND('-') THEN BEGIN
                      PurchaseLineOrder.INIT;
                      PurchaseLineOrder.RESET;
                      PurchaseLineOrder."Document Type" := PurchaseHeaderOrder."Document Type";
                      PurchaseLineOrder."Document No." := PurchaseHeaderOrder."No.";
                      PurchaseLineOrder."Buy-from Vendor No." := PurchaseLine."Buy-from Vendor No.";
                      PurchaseLineOrder.Type := PurchaseLineOrder.Type :: Item;
                      PurchaseLineOrder."No." := "Item No.";
                      PurchaseLineOrder.Quantity := Quantity;
                      PurchaseLineOrder.VALIDATE("Buy-from Vendor No.");
                      PurchaseLineOrder.VALIDATE("No.");
                      PurchaseLineOrder.VALIDATE(Quantity);
                      PurchaseLineOrder.VALIDATE("Direct Unit Cost");
                      PurchaseLineOrder."Direct Unit Cost" := "Quotation Comparision".Rate;
                      PurchaseLineOrder.VALIDATE("Direct Unit Cost");
                      PurchaseLineOrder."Indent No." := "Quotation Comparision"."Indent No.";
                      PurchaseLineOrder."Indent Line No." := "Quotation Comparision"."Indent Line No.";
                      PurchaseLineOrder."Location Code":="Quotation Comparision"."Location Code";
                      PurchaseLineOrder.INSERT;
                     IndentLine.RESET;
                     IndentLine.SETRANGE("Delivery Location","Quotation Comparision"."Location Code");
                     IndentLine.SETRANGE("No.","Quotation Comparision"."Item No.");
                     IndentLine.SETRANGE("ICN No.","Quotation Comparision"."ICN No.");
                     IF IndentLine.FIND('-') THEN
                       REPEAT
                         IndentLine."Indent Status" := IndentLine."Indent Status"::Order;
                         IndentLine.MODIFY;
                       UNTIL IndentLine.NEXT = 0;
                     END;
                  END;
                END;
                */

            end;

            trigger OnPostDataItem();
            begin
                MESSAGE('Orders Created');
                RFQNumbers.SETRANGE("Production Order No.","RFQ No.");
                IF RFQNumbers.FIND('-') THEN BEGIN
                  //RFQNumbers.Quantity := TRUE;//B2b
                  RFQNumbers.MODIFY;
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
        PurchaseHeaderOrder : Record "Purchase Header";
        PurchaseLineOrder : Record "Purchase Line";
        NoSeriesMgt : Codeunit NoSeriesManagement;
        PPSetup : Record "Purchases & Payables Setup";
        PurchaseHeader : Record "Purchase Header";
        PurchaseLine : Record "Purchase Line";
        RFQNumbers : Record "Mech & Wirning Items";
        IndentLine : Record "Indent Line";
        PurchaseLineOrder2 : Record "Purchase Header";
        TempLineNo : Integer;
        PurchaseOrder : Record "Purchase Header";
}

