page 60143 "Production Order Shortage Item"
{
    PageType = List;
    SourceTable = "Production Order Shortage Item";

    layout
    {
        area(content)
        {
            repeater(Control1102154000)
            {
                ShowCaption = false;
                field("Production Order"; "Production Order")
                {
                }
                field(Item; Item)
                {
                    Editable = false;
                }
                field(Description; Description)
                {
                    Editable = false;
                }
                field("Shortage At"; "Shortage At")
                {
                }
                field(Shortage; Shortage)
                {
                    Editable = false;
                }
                field("Total Shortage"; "Total Shortage")
                {
                    Editable = false;
                }
                field("Qty. in Purchase Orders"; "Qty. in Purchase Orders")
                {
                    Editable = false;

                    trigger OnLookup(Text: Text): Boolean;
                    begin
                        "Purchase Line".RESET;
                        "Purchase Line".SETFILTER("Purchase Line"."Document Type", 'Order');
                        "Purchase Line".SETCURRENTKEY("Purchase Line"."No.", "Purchase Line"."Buy-from Vendor No.");
                        "Purchase Line".SETRANGE("Purchase Line"."No.", Item);
                        "Purchase Line".SETFILTER("Purchase Line"."Location Code", 'STR'); //Need to add Location Code (VISHNU)
                        "Purchase Line".SETFILTER("Purchase Line"."Qty. to Receive", '>%1', 0);
                        PAGE.RUNMODAL(56, "Purchase Line");
                    end;
                }
                field("Earliest Material Arrival Date"; "Earliest Material Arrival Date")
                {
                }
                field("Qty. Under Inspection"; "Qty. Under Inspection")
                {
                    Editable = false;

                    trigger OnLookup(Text: Text): Boolean;
                    begin
                        QILE.RESET;
                        QILE.SETCURRENTKEY(QILE."Posting Date", QILE."Item No.");
                        QILE.SETRANGE(QILE."Item No.", Item);
                        QILE.SETRANGE(QILE."Inspection Status", QILE."Inspection Status"::"Under Inspection");
                        QILE.SETRANGE(QILE."Sent for Rework", FALSE);
                        QILE.SETFILTER(QILE."Remaining Quantity", '>%1', 0);
                        QILE.SETRANGE(QILE."Location Code", 'STR'); //Need to add Location Code (VISHNU)
                        QILE.SETRANGE(QILE.Accept, TRUE);
                    end;
                }
                field(Remarks; Remarks)
                {

                    trigger OnValidate();
                    begin
                        IF xRec.Remarks = '' THEN BEGIN
                            ProdOrdShortage.RESET;
                            ProdOrdShortage.SETRANGE(ProdOrdShortage.Item, Item);
                            IF ProdOrdShortage.FINDSET THEN BEGIN
                                ProdOrdShortage.MODIFYALL(ProdOrdShortage.Remarks, Remarks);
                            END;
                        END;
                    end;
                }
                field("Stock at Stores"; "Stock at Stores")
                {
                    Caption = 'Stock at Stores';
                    Editable = false;
                }
                field(CreateReq_STR; CreateReq_STR)
                {
                    Caption = 'Request';

                    trigger OnValidate();
                    begin
                        IF "Stock at Stores" = 0 THEN
                            ERROR('Quantity is Zero and request cannot be placed');
                        IF "Shortage At" = 'STR' THEN
                            ERROR('Request from shortage location cannot be placed');

                        Req_stock := "Stock at Stores";
                        Req_count := 0;
                        IF Req_stock > "Total Shortage" THEN
                            Req_count := 1;

                        IF CreateReq_CS THEN BEGIN
                            IF "Stock at CS Stores" > "Total Shortage" THEN
                                Req_count := Req_count + 1;

                            Req_stock := Req_stock + "Stock at CS Stores";
                            IF Req_stock > "Total Shortage" THEN
                                Req_count := Req_count + 1;
                        END;

                        IF CreateReq_RD THEN BEGIN
                            IF "Stock at RD Stores" > "Total Shortage" THEN
                                Req_count := Req_count + 1;

                            Req_stock := Req_stock + "Stock at RD Stores";
                            IF Req_stock > "Total Shortage" THEN
                                Req_count := Req_count + 1;
                        END;

                        IF CreateReq_MCH THEN BEGIN
                            IF "Stock at MCH" > "Total Shortage" THEN
                                Req_count := Req_count + 1;

                            Req_stock := Req_stock + "Stock at MCH";
                            IF Req_stock > "Total Shortage" THEN
                                Req_count := Req_count + 1;
                        END;
                        //Need to add Location Code (VISHNU) Other Locations

                        IF Req_count > 1 THEN
                            ERROR('More stock is selected, kindly select the required quantity');


                        MaterialIssueHeader.RESET;
                        MaterialIssueHeader.SETRANGE(MaterialIssueHeader.Remarks, 'Item Transfer');

                        IF MaterialIssueHeader.FINDSET THEN
                            REPEAT
                                IF (MaterialIssueHeader."Transfer-from Code" = 'STR') THEN  //Need to add Location Code (VISHNU)
                                BEGIN
                                    MaterialIssueLine.RESET;
                                    MaterialIssueLine.SETRANGE(MaterialIssueLine."Document No.", MaterialIssueHeader."No.");
                                    IF MaterialIssueLine.FINDSET THEN
                                        REPEAT
                                            IF (MaterialIssueLine."Item No." = Item) THEN BEGIN
                                                ProdOrdShortage.CreateReq_STR := FALSE;
                                                ERROR('Material Request already created for this Item ' + MaterialIssueHeader."No.");
                                            END
                                        UNTIL MaterialIssueLine.NEXT = 0;
                                END;
                            UNTIL MaterialIssueHeader.NEXT = 0;
                    end;
                }
                field("Stock at CS Stores"; "Stock at CS Stores")
                {
                    Caption = 'Stock at CS Stores';
                    Editable = false;
                }
                field(CreateReq_CS; CreateReq_CS)
                {
                    Caption = 'Request';

                    trigger OnValidate();
                    begin
                        IF "Stock at CS Stores" = 0 THEN
                            ERROR('Quantity is Zero and request cannot be placed');
                        IF "Shortage At" = 'CS STR' THEN
                            ERROR('Request from shortage location cannot be placed');

                        Req_stock := "Stock at CS Stores";
                        Req_count := 0;
                        IF Req_stock > "Total Shortage" THEN
                            Req_count := 1;

                        IF CreateReq_STR THEN BEGIN
                            IF "Stock at Stores" > "Total Shortage" THEN
                                Req_count := Req_count + 1;

                            Req_stock := Req_stock + "Stock at Stores";
                            IF Req_stock > "Total Shortage" THEN
                                Req_count := Req_count + 1;
                        END;

                        IF CreateReq_RD THEN BEGIN
                            IF "Stock at RD Stores" > "Total Shortage" THEN
                                Req_count := Req_count + 1;

                            Req_stock := Req_stock + "Stock at RD Stores";
                            IF Req_stock > "Total Shortage" THEN
                                Req_count := Req_count + 1;
                        END;

                        IF CreateReq_MCH THEN BEGIN
                            IF "Stock at MCH" > "Total Shortage" THEN
                                Req_count := Req_count + 1;

                            Req_stock := Req_stock + "Stock at MCH";
                            IF Req_stock > "Total Shortage" THEN
                                Req_count := Req_count + 1;
                        END;
                        //Need to add Location Code (VISHNU) other locations

                        IF Req_count > 1 THEN
                            ERROR('More stock is selected, kindly select the required quantity');

                        MaterialIssueHeader.RESET;
                        MaterialIssueHeader.SETRANGE(MaterialIssueHeader.Remarks, 'Item Transfer');

                        IF MaterialIssueHeader.FINDSET THEN
                            REPEAT
                                IF (MaterialIssueHeader."Transfer-from Code" = 'CS STR') THEN BEGIN
                                    MaterialIssueLine.RESET;
                                    MaterialIssueLine.SETRANGE(MaterialIssueLine."Document No.", MaterialIssueHeader."No.");
                                    IF MaterialIssueLine.FINDSET THEN
                                        REPEAT
                                            IF (MaterialIssueLine."Item No." = Item) THEN BEGIN
                                                ProdOrdShortage.CreateReq_CS := FALSE;
                                                ERROR('Material Request already created for this Item ' + MaterialIssueHeader."No.");
                                            END
                                        UNTIL MaterialIssueLine.NEXT = 0;
                                END;
                            UNTIL MaterialIssueHeader.NEXT = 0;
                    end;
                }
                field("Stock at RD Stores"; "Stock at RD Stores")
                {
                    Caption = 'Stock at RD Stores';
                    Editable = false;
                }
                field(CreateReq_RD; CreateReq_RD)
                {
                    Caption = 'Request';

                    trigger OnValidate();
                    begin
                        IF "Stock at RD Stores" = 0 THEN
                            ERROR('Quantity is Zero and request cannot be placed');
                        IF "Shortage At" = 'R&D STR' THEN
                            ERROR('Request from shortage location cannot be placed');

                        Req_stock := "Stock at RD Stores";
                        Req_count := 0;
                        IF Req_stock > "Total Shortage" THEN
                            Req_count := 1;

                        IF CreateReq_STR THEN BEGIN
                            IF "Stock at Stores" > "Total Shortage" THEN
                                Req_count := Req_count + 1;
                            Req_stock := Req_stock + "Stock at Stores";
                            IF Req_stock > "Total Shortage" THEN
                                Req_count := Req_count + 1;
                        END;

                        IF CreateReq_CS THEN BEGIN
                            IF "Stock at CS Stores" > "Total Shortage" THEN
                                Req_count := Req_count + 1;
                            Req_stock := Req_stock + "Stock at CS Stores";
                            IF Req_stock > "Total Shortage" THEN
                                Req_count := Req_count + 1;
                        END;

                        IF CreateReq_MCH THEN BEGIN
                            IF "Stock at MCH" > "Total Shortage" THEN
                                Req_count := Req_count + 1;

                            Req_stock := Req_stock + "Stock at MCH";
                            IF Req_stock > "Total Shortage" THEN
                                Req_count := Req_count + 1;
                        END;
                        //Need to add Location Code (VISHNU) Other Locations

                        IF Req_count > 1 THEN
                            ERROR('More stock is selected, kindly select the required quantity');

                        MaterialIssueHeader.RESET;
                        MaterialIssueHeader.SETRANGE(MaterialIssueHeader.Remarks, 'Item Transfer');

                        IF MaterialIssueHeader.FINDSET THEN
                            REPEAT
                                IF (MaterialIssueHeader."Transfer-from Code" = 'R&D STR') THEN BEGIN
                                    MaterialIssueLine.RESET;
                                    MaterialIssueLine.SETRANGE(MaterialIssueLine."Document No.", MaterialIssueHeader."No.");
                                    IF MaterialIssueLine.FINDSET THEN
                                        REPEAT
                                            IF (MaterialIssueLine."Item No." = Item) THEN BEGIN
                                                ProdOrdShortage.CreateReq_RD := FALSE;
                                                ERROR('Material Request already created for this Item ' + MaterialIssueHeader."No.");
                                            END
                                        UNTIL MaterialIssueLine.NEXT = 0;
                                END;
                            UNTIL MaterialIssueHeader.NEXT = 0;
                    end;
                }
                field("Stock at MCH"; "Stock at MCH")
                {
                    Caption = 'Stock at MCH';
                    Editable = false;
                }
                field(CreateReq_MCH; CreateReq_MCH)
                {
                    Caption = 'Request';

                    trigger OnValidate();
                    begin
                        IF "Stock at MCH" = 0 THEN
                            ERROR('Quantity is Zero and request cannot be placed');
                        IF "Shortage At" = 'MCH' THEN
                            ERROR('Request from shortage location cannot be placed');

                        Req_stock := "Stock at MCH";
                        Req_count := 0;
                        IF Req_stock > "Total Shortage" THEN
                            Req_count := 1;

                        IF CreateReq_STR THEN BEGIN
                            IF "Stock at Stores" > "Total Shortage" THEN
                                Req_count := Req_count + 1;

                            Req_stock := Req_stock + "Stock at Stores";
                            IF Req_stock > "Total Shortage" THEN
                                Req_count := Req_count + 1;
                        END;

                        IF CreateReq_CS THEN BEGIN
                            IF "Stock at CS Stores" > "Total Shortage" THEN
                                Req_count := Req_count + 1;

                            Req_stock := Req_stock + "Stock at CS Stores";
                            IF Req_stock > "Total Shortage" THEN
                                Req_count := Req_count + 1;
                        END;

                        IF CreateReq_RD THEN BEGIN
                            IF "Stock at RD Stores" > "Total Shortage" THEN
                                Req_count := Req_count + 1;

                            Req_stock := Req_stock + "Stock at RD Stores";
                            IF Req_stock > "Total Shortage" THEN
                                Req_count := Req_count + 1;
                        END;
                        //Need to add Location Code (VISHNU) Other Locations

                        IF Req_count > 1 THEN
                            ERROR('More stock is selected, kindly select the required quantity');


                        MaterialIssueHeader.RESET;
                        MaterialIssueHeader.SETRANGE(MaterialIssueHeader.Remarks, 'Item Transfer');

                        IF MaterialIssueHeader.FINDSET THEN
                            REPEAT
                                IF (MaterialIssueHeader."Transfer-from Code" = 'MCH') THEN BEGIN
                                    MaterialIssueLine.RESET;
                                    MaterialIssueLine.SETRANGE(MaterialIssueLine."Document No.", MaterialIssueHeader."No.");
                                    IF MaterialIssueLine.FINDSET THEN
                                        REPEAT
                                            IF (MaterialIssueLine."Item No." = Item) THEN BEGIN
                                                ProdOrdShortage.CreateReq_MCH := FALSE;
                                                ERROR('Material Request already created for this Item ' + MaterialIssueHeader."No.");
                                            END
                                        UNTIL MaterialIssueLine.NEXT = 0;
                                END;
                            UNTIL MaterialIssueHeader.NEXT = 0;
                    end;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Create Material Request")
            {
                Caption = 'Create Material Request';

                trigger OnAction();
                begin
                    // Added by Rakesh to create Material request for Shortage Items on 16-Sep-14
                    // Request for STR items
                    //VerifyRequest;
                    ProdOrdShortage.RESET;
                    ProdOrdShortage.SETFILTER(ProdOrdShortage."Production Order", "Production Order");

                    ProdOrdShortage.SETRANGE(ProdOrdShortage.CreateReq_STR, TRUE);
                    IF ProdOrdShortage.FINDFIRST THEN BEGIN
                        MaterialIssueHeader.RESET;
                        MaterialIssueHeader.INIT;
                        MaterialIssueHeader."No." := GetNextNo;
                        MaterialIssueHeader."Receipt Date" := TODAY;
                        MaterialIssueHeader."Transfer-from Code" := 'STR';
                        MaterialIssueHeader."Transfer-to Code" := ProdOrdShortage."Shortage At";
                        MaterialIssueHeader.VALIDATE("Prod. Order No.", 'EFF10STR01');
                        MaterialIssueHeader.VALIDATE("Prod. Order Line No.", 10000);
                        MaterialIssueHeader."Request for Authorization" := 'EFFTRONICS\VSNGEETHA';
                        MaterialIssueHeader."User ID" := USERID;
                        USER.GET(USERSECURITYID);
                        MaterialIssueHeader."Resource Name" := USER."Full Name";
                        MaterialIssueHeader."Creation DateTime" := CURRENTDATETIME;
                        MaterialIssueHeader.Remarks := 'Item Transfer';
                        MaterialIssueHeader.INSERT;
                        LineNo := 0;
                        IF ProdOrdShortage.FINDSET THEN
                            REPEAT
                                GetStock(ProdOrdShortage.Item);
                                IF (CreateReq_STR) OR NOT (Req_created) THEN BEGIN
                                    LineNo := LineNo + 10000;
                                    IF ITEM1.GET(ProdOrdShortage.Item) THEN BEGIN
                                        MaterialIssueLine.INIT;
                                        MaterialIssueLine."Document No." := MaterialIssueHeader."No.";
                                        MaterialIssueLine.VALIDATE("Item No.", ITEM1."No.");
                                        MaterialIssueLine."Line No." := LineNo;
                                        MaterialIssueLine."Unit of Measure Code" := ITEM1."Base Unit of Measure";
                                        MaterialIssueLine.VALIDATE("Unit of Measure Code");
                                        MaterialIssueLine.VALIDATE("Unit of Measure");
                                        IF "Total Shortage" <= "Stock at Stores" THEN
                                            MaterialIssueLine.VALIDATE(MaterialIssueLine.Quantity, ProdOrdShortage."Total Shortage")
                                        ELSE
                                            MaterialIssueLine.VALIDATE(MaterialIssueLine.Quantity, "Stock at Stores");
                                        MaterialIssueLine."Prod. Order No." := 'EFF10STR01';
                                        MaterialIssueLine."Prod. Order Line No." := 10000;
                                        MaterialIssueLine.INSERT;
                                        ProdOrdShortage.CreateReq_STR := FALSE;
                                        ProdOrdShortage.MODIFY;
                                    END;
                                END;
                            UNTIL ProdOrdShortage.NEXT = 0;
                        ProdOrdShortage.MODIFYALL(ProdOrdShortage.Req_created, FALSE);
                        IF LineNo < 10000 THEN
                            MaterialIssueHeader.DELETE
                        ELSE
                            AuthMail;
                    END;

                    // Request for CS STR items for MCH
                    ProdOrdShortage.RESET;
                    ProdOrdShortage.SETFILTER(ProdOrdShortage."Production Order", "Production Order");
                    ProdOrdShortage.SETRANGE(ProdOrdShortage."Shortage At", 'MCH');

                    ProdOrdShortage.SETRANGE(ProdOrdShortage.CreateReq_CS, TRUE);
                    IF ProdOrdShortage.FINDFIRST THEN BEGIN
                        MaterialIssueHeader.RESET;
                        MaterialIssueHeader.INIT;
                        MaterialIssueHeader."No." := GetNextNo;
                        MaterialIssueHeader."Receipt Date" := TODAY;
                        MaterialIssueHeader."Transfer-from Code" := 'CS STR';
                        MaterialIssueHeader."Transfer-to Code" := 'MCH';
                        MaterialIssueHeader.VALIDATE("Prod. Order No.", 'EFF10STR01');
                        MaterialIssueHeader.VALIDATE("Prod. Order Line No.", 10000);
                        MaterialIssueHeader."Request for Authorization" := 'EFFTRONICS\VSNGEETHA';
                        MaterialIssueHeader."User ID" := USERID;
                        USER.GET(USERSECURITYID);
                        MaterialIssueHeader."Resource Name" := USER."Full Name";
                        MaterialIssueHeader."Creation DateTime" := CURRENTDATETIME;
                        MaterialIssueHeader.Remarks := 'Item Transfer';
                        MaterialIssueHeader.INSERT;
                        LineNo := 0;
                        IF ProdOrdShortage.FINDSET THEN
                            REPEAT
                                GetStock(ProdOrdShortage.Item);
                                IF NOT (Req_created) THEN BEGIN
                                    LineNo := LineNo + 10000;
                                    IF ITEM1.GET(ProdOrdShortage.Item) THEN BEGIN
                                        MaterialIssueLine.INIT;
                                        MaterialIssueLine."Document No." := MaterialIssueHeader."No.";
                                        MaterialIssueLine.VALIDATE("Item No.", ITEM1."No.");
                                        MaterialIssueLine."Line No." := LineNo;
                                        MaterialIssueLine."Unit of Measure Code" := ITEM1."Base Unit of Measure";
                                        MaterialIssueLine.VALIDATE("Unit of Measure Code");
                                        MaterialIssueLine.VALIDATE("Unit of Measure");
                                        IF CreateReq_STR THEN BEGIN
                                            IF (ProdOrdShortage."Total Shortage" - "Stock at Stores") <= "Stock at CS Stores" THEN
                                                MaterialIssueLine.VALIDATE(MaterialIssueLine.Quantity, (ProdOrdShortage."Total Shortage" - "Stock at Stores"))
                                            ELSE
                                                MaterialIssueLine.VALIDATE(MaterialIssueLine.Quantity, "Stock at CS Stores");
                                        END ELSE BEGIN
                                            IF ProdOrdShortage."Total Shortage" <= "Stock at CS Stores" THEN
                                                MaterialIssueLine.VALIDATE(MaterialIssueLine.Quantity, ProdOrdShortage."Total Shortage")
                                            ELSE
                                                MaterialIssueLine.VALIDATE(MaterialIssueLine.Quantity, "Stock at CS Stores");
                                        END;

                                        MaterialIssueLine."Prod. Order No." := 'EFF10STR01';
                                        MaterialIssueLine."Prod. Order Line No." := 10000;
                                        MaterialIssueLine.INSERT;
                                        ProdOrdShortage.CreateReq_CS := FALSE;
                                        ProdOrdShortage.MODIFY;
                                    END;
                                END;
                            UNTIL ProdOrdShortage.NEXT = 0;
                        ProdOrdShortage.MODIFYALL(ProdOrdShortage.Req_created, FALSE);
                        IF LineNo < 10000 THEN
                            MaterialIssueHeader.DELETE
                        ELSE
                            AuthMail;
                    END;

                    // Request for CS STR items for STR
                    ProdOrdShortage.RESET;
                    ProdOrdShortage.SETFILTER(ProdOrdShortage."Production Order", "Production Order");
                    ProdOrdShortage.SETRANGE(ProdOrdShortage."Shortage At", 'STR');

                    ProdOrdShortage.SETRANGE(ProdOrdShortage.CreateReq_CS, TRUE);
                    IF ProdOrdShortage.FINDFIRST THEN BEGIN
                        MaterialIssueHeader.RESET;
                        MaterialIssueHeader.INIT;
                        MaterialIssueHeader."No." := GetNextNo;
                        MaterialIssueHeader."Receipt Date" := TODAY;
                        MaterialIssueHeader."Transfer-from Code" := 'CS STR';
                        MaterialIssueHeader."Transfer-to Code" := 'STR';
                        MaterialIssueHeader.VALIDATE("Prod. Order No.", 'EFF10STR01');
                        MaterialIssueHeader.VALIDATE("Prod. Order Line No.", 10000);
                        MaterialIssueHeader."Request for Authorization" := 'EFFTRONICS\VSNGEETHA';
                        MaterialIssueHeader."User ID" := USERID;
                        USER.GET(USERSECURITYID);
                        MaterialIssueHeader."Resource Name" := USER."Full Name";
                        MaterialIssueHeader."Creation DateTime" := CURRENTDATETIME;
                        MaterialIssueHeader.Remarks := 'Item Transfer';
                        MaterialIssueHeader.INSERT;
                        LineNo := 0;
                        IF ProdOrdShortage.FINDSET THEN
                            REPEAT
                                GetStock(ProdOrdShortage.Item);
                                IF NOT (Req_created) THEN BEGIN
                                    LineNo := LineNo + 10000;
                                    IF ITEM1.GET(ProdOrdShortage.Item) THEN BEGIN
                                        MaterialIssueLine.INIT;
                                        MaterialIssueLine."Document No." := MaterialIssueHeader."No.";
                                        MaterialIssueLine.VALIDATE("Item No.", ITEM1."No.");
                                        MaterialIssueLine."Line No." := LineNo;
                                        MaterialIssueLine."Unit of Measure Code" := ITEM1."Base Unit of Measure";
                                        MaterialIssueLine.VALIDATE("Unit of Measure Code");
                                        MaterialIssueLine.VALIDATE("Unit of Measure");
                                        IF CreateReq_STR THEN BEGIN
                                            IF (ProdOrdShortage."Total Shortage" - "Stock at Stores") <= "Stock at CS Stores" THEN
                                                MaterialIssueLine.VALIDATE(MaterialIssueLine.Quantity, (ProdOrdShortage."Total Shortage" - "Stock at Stores"))
                                            ELSE
                                                MaterialIssueLine.VALIDATE(MaterialIssueLine.Quantity, "Stock at CS Stores");
                                        END ELSE BEGIN
                                            IF ProdOrdShortage."Total Shortage" <= "Stock at CS Stores" THEN
                                                MaterialIssueLine.VALIDATE(MaterialIssueLine.Quantity, ProdOrdShortage."Total Shortage")
                                            ELSE
                                                MaterialIssueLine.VALIDATE(MaterialIssueLine.Quantity, "Stock at CS Stores");
                                        END;

                                        MaterialIssueLine."Prod. Order No." := 'EFF10STR01';
                                        MaterialIssueLine."Prod. Order Line No." := 10000;
                                        MaterialIssueLine.INSERT;
                                        ProdOrdShortage.CreateReq_CS := FALSE;
                                        ProdOrdShortage.MODIFY;
                                    END;
                                END;
                            UNTIL ProdOrdShortage.NEXT = 0;
                        ProdOrdShortage.MODIFYALL(ProdOrdShortage.Req_created, FALSE);
                        IF LineNo < 10000 THEN
                            MaterialIssueHeader.DELETE
                        ELSE
                            AuthMail;
                    END;


                    // Request for RD STR items for MCH
                    ProdOrdShortage.RESET;
                    ProdOrdShortage.SETFILTER(ProdOrdShortage."Production Order", "Production Order");
                    ProdOrdShortage.SETRANGE(ProdOrdShortage."Shortage At", 'MCH');

                    ProdOrdShortage.SETRANGE(ProdOrdShortage.CreateReq_RD, TRUE);
                    IF ProdOrdShortage.FINDFIRST THEN BEGIN
                        MaterialIssueHeader.RESET;
                        MaterialIssueHeader.INIT;
                        MaterialIssueHeader."No." := GetNextNo;
                        MaterialIssueHeader."Receipt Date" := TODAY;
                        MaterialIssueHeader."Transfer-from Code" := 'R&D STR';
                        MaterialIssueHeader."Transfer-to Code" := 'MCH';
                        MaterialIssueHeader.VALIDATE("Prod. Order No.", 'EFF10STR01');
                        MaterialIssueHeader.VALIDATE("Prod. Order Line No.", 10000);
                        MaterialIssueHeader."Request for Authorization" := 'EFFTRONICS\VSNGEETHA';
                        MaterialIssueHeader."User ID" := USERID;
                        USER.GET(USERSECURITYID);
                        MaterialIssueHeader."Resource Name" := USER."Full Name";
                        MaterialIssueHeader."Creation DateTime" := CURRENTDATETIME;
                        MaterialIssueHeader.Remarks := 'Item Transfer';
                        MaterialIssueHeader.INSERT;
                        LineNo := 0;
                        IF ProdOrdShortage.FINDSET THEN
                            REPEAT
                                GetStock(ProdOrdShortage.Item);
                                IF NOT (Req_created) THEN BEGIN
                                    LineNo := LineNo + 10000;
                                    IF ITEM1.GET(ProdOrdShortage.Item) THEN BEGIN
                                        MaterialIssueLine.INIT;
                                        MaterialIssueLine."Document No." := MaterialIssueHeader."No.";
                                        MaterialIssueLine.VALIDATE("Item No.", ITEM1."No.");
                                        MaterialIssueLine."Line No." := LineNo;
                                        MaterialIssueLine."Unit of Measure Code" := ITEM1."Base Unit of Measure";
                                        MaterialIssueLine.VALIDATE("Unit of Measure Code");
                                        MaterialIssueLine.VALIDATE("Unit of Measure");

                                        IF CreateReq_STR AND CreateReq_CS THEN BEGIN
                                            IF (ProdOrdShortage."Total Shortage" - ("Stock at Stores" + "Stock at CS Stores")) <= "Stock at RD Stores" THEN
                                                MaterialIssueLine.VALIDATE(MaterialIssueLine.Quantity, (ProdOrdShortage."Total Shortage" - ("Stock at Stores" + "Stock at CS Stores")))
                                            ELSE
                                                MaterialIssueLine.VALIDATE(MaterialIssueLine.Quantity, "Stock at RD Stores");
                                        END ELSE
                                            IF CreateReq_STR THEN BEGIN
                                                IF (ProdOrdShortage."Total Shortage" - "Stock at Stores") <= "Stock at RD Stores" THEN
                                                    MaterialIssueLine.VALIDATE(MaterialIssueLine.Quantity, (ProdOrdShortage."Total Shortage" - "Stock at Stores"))
                                                ELSE
                                                    MaterialIssueLine.VALIDATE(MaterialIssueLine.Quantity, "Stock at RD Stores");
                                            END ELSE
                                                IF CreateReq_CS THEN BEGIN
                                                    IF (ProdOrdShortage."Total Shortage" - "Stock at CS Stores") <= "Stock at RD Stores" THEN
                                                        MaterialIssueLine.VALIDATE(MaterialIssueLine.Quantity, (ProdOrdShortage."Total Shortage" - "Stock at CS Stores"))
                                                    ELSE
                                                        MaterialIssueLine.VALIDATE(MaterialIssueLine.Quantity, "Stock at RD Stores");
                                                END ELSE BEGIN
                                                    IF ProdOrdShortage."Total Shortage" <= "Stock at RD Stores" THEN
                                                        MaterialIssueLine.VALIDATE(MaterialIssueLine.Quantity, ProdOrdShortage."Total Shortage")
                                                    ELSE
                                                        MaterialIssueLine.VALIDATE(MaterialIssueLine.Quantity, "Stock at RD Stores");
                                                END;

                                        MaterialIssueLine."Prod. Order No." := 'EFF10STR01';
                                        MaterialIssueLine."Prod. Order Line No." := 10000;
                                        MaterialIssueLine.INSERT;
                                        ProdOrdShortage.CreateReq_RD := FALSE;
                                        ProdOrdShortage.MODIFY;
                                    END;
                                END;
                            UNTIL ProdOrdShortage.NEXT = 0;
                        ProdOrdShortage.MODIFYALL(ProdOrdShortage.Req_created, FALSE);
                        IF LineNo < 10000 THEN
                            MaterialIssueHeader.DELETE
                        ELSE
                            AuthMail;
                    END;

                    // Request for RD STR items for STR
                    ProdOrdShortage.RESET;
                    ProdOrdShortage.SETFILTER(ProdOrdShortage."Production Order", "Production Order");
                    ProdOrdShortage.SETRANGE(ProdOrdShortage."Shortage At", 'STR');

                    ProdOrdShortage.SETRANGE(ProdOrdShortage.CreateReq_RD, TRUE);
                    IF ProdOrdShortage.FINDFIRST THEN BEGIN
                        MaterialIssueHeader.RESET;
                        MaterialIssueHeader.INIT;
                        MaterialIssueHeader."No." := GetNextNo;
                        MaterialIssueHeader."Receipt Date" := TODAY;
                        MaterialIssueHeader."Transfer-from Code" := 'R&D STR';
                        MaterialIssueHeader."Transfer-to Code" := 'STR';
                        MaterialIssueHeader.VALIDATE("Prod. Order No.", 'EFF10STR01');
                        MaterialIssueHeader.VALIDATE("Prod. Order Line No.", 10000);
                        MaterialIssueHeader."Request for Authorization" := 'EFFTRONICS\VSNGEETHA';
                        MaterialIssueHeader."User ID" := USERID;
                        USER.GET(USERSECURITYID);
                        MaterialIssueHeader."Resource Name" := USER."Full Name";
                        MaterialIssueHeader."Creation DateTime" := CURRENTDATETIME;
                        MaterialIssueHeader.Remarks := 'Item Transfer';
                        MaterialIssueHeader.INSERT;
                        LineNo := 0;
                        IF ProdOrdShortage.FINDSET THEN
                            REPEAT
                                GetStock(ProdOrdShortage.Item);
                                IF NOT (Req_created) THEN BEGIN
                                    LineNo := LineNo + 10000;
                                    IF ITEM1.GET(ProdOrdShortage.Item) THEN BEGIN
                                        MaterialIssueLine.INIT;
                                        MaterialIssueLine."Document No." := MaterialIssueHeader."No.";
                                        MaterialIssueLine.VALIDATE("Item No.", ITEM1."No.");
                                        MaterialIssueLine."Line No." := LineNo;
                                        MaterialIssueLine."Unit of Measure Code" := ITEM1."Base Unit of Measure";
                                        MaterialIssueLine.VALIDATE("Unit of Measure Code");
                                        MaterialIssueLine.VALIDATE("Unit of Measure");

                                        IF CreateReq_STR AND CreateReq_CS THEN BEGIN
                                            IF (ProdOrdShortage."Total Shortage" - ("Stock at Stores" + "Stock at CS Stores")) <= "Stock at RD Stores" THEN
                                                MaterialIssueLine.VALIDATE(MaterialIssueLine.Quantity, (ProdOrdShortage."Total Shortage" - ("Stock at Stores" + "Stock at CS Stores")))
                                            ELSE
                                                MaterialIssueLine.VALIDATE(MaterialIssueLine.Quantity, "Stock at RD Stores");
                                        END ELSE
                                            IF CreateReq_STR THEN BEGIN
                                                IF (ProdOrdShortage."Total Shortage" - "Stock at Stores") <= "Stock at RD Stores" THEN
                                                    MaterialIssueLine.VALIDATE(MaterialIssueLine.Quantity, (ProdOrdShortage."Total Shortage" - "Stock at Stores"))
                                                ELSE
                                                    MaterialIssueLine.VALIDATE(MaterialIssueLine.Quantity, "Stock at RD Stores");
                                            END ELSE
                                                IF CreateReq_CS THEN BEGIN
                                                    IF (ProdOrdShortage."Total Shortage" - "Stock at CS Stores") <= "Stock at RD Stores" THEN
                                                        MaterialIssueLine.VALIDATE(MaterialIssueLine.Quantity, (ProdOrdShortage."Total Shortage" - "Stock at CS Stores"))
                                                    ELSE
                                                        MaterialIssueLine.VALIDATE(MaterialIssueLine.Quantity, "Stock at RD Stores");
                                                END ELSE BEGIN
                                                    IF ProdOrdShortage."Total Shortage" <= "Stock at RD Stores" THEN
                                                        MaterialIssueLine.VALIDATE(MaterialIssueLine.Quantity, ProdOrdShortage."Total Shortage")
                                                    ELSE
                                                        MaterialIssueLine.VALIDATE(MaterialIssueLine.Quantity, "Stock at RD Stores");
                                                END;

                                        MaterialIssueLine."Prod. Order No." := 'EFF10STR01';
                                        MaterialIssueLine."Prod. Order Line No." := 10000;
                                        MaterialIssueLine.INSERT;
                                        ProdOrdShortage.CreateReq_RD := FALSE;
                                        ProdOrdShortage.MODIFY;
                                    END;
                                END;
                            UNTIL ProdOrdShortage.NEXT = 0;
                        ProdOrdShortage.MODIFYALL(ProdOrdShortage.Req_created, FALSE);
                        IF LineNo < 10000 THEN
                            MaterialIssueHeader.DELETE
                        ELSE
                            AuthMail;
                    END;


                    // Request for MCH items
                    ProdOrdShortage.RESET;
                    ProdOrdShortage.SETFILTER(ProdOrdShortage."Production Order", "Production Order");

                    ProdOrdShortage.SETRANGE(ProdOrdShortage.CreateReq_MCH, TRUE);
                    IF ProdOrdShortage.FINDFIRST THEN BEGIN
                        MaterialIssueHeader.RESET;
                        MaterialIssueHeader.INIT;
                        MaterialIssueHeader."No." := GetNextNo;
                        MaterialIssueHeader."Receipt Date" := TODAY;
                        MaterialIssueHeader."Transfer-from Code" := 'MCH';
                        MaterialIssueHeader."Transfer-to Code" := ProdOrdShortage."Shortage At";
                        MaterialIssueHeader.VALIDATE("Prod. Order No.", 'EFF10STR01');
                        MaterialIssueHeader.VALIDATE("Prod. Order Line No.", 10000);
                        MaterialIssueHeader."Request for Authorization" := 'EFFTRONICS\VSNGEETHA';
                        MaterialIssueHeader."User ID" := USERID;
                        USER.GET(USERSECURITYID);
                        MaterialIssueHeader."Resource Name" := USER."Full Name";
                        MaterialIssueHeader."Creation DateTime" := CURRENTDATETIME;
                        MaterialIssueHeader.Remarks := 'Item Transfer';
                        MaterialIssueHeader.INSERT;
                        LineNo := 0;
                        IF ProdOrdShortage.FINDSET THEN
                            REPEAT
                                GetStock(ProdOrdShortage.Item);
                                IF NOT (Req_created) THEN BEGIN
                                    LineNo := LineNo + 10000;
                                    IF ITEM1.GET(ProdOrdShortage.Item) THEN BEGIN
                                        MaterialIssueLine.INIT;
                                        MaterialIssueLine."Document No." := MaterialIssueHeader."No.";
                                        MaterialIssueLine.VALIDATE("Item No.", ITEM1."No.");
                                        MaterialIssueLine."Line No." := LineNo;
                                        MaterialIssueLine."Unit of Measure Code" := ITEM1."Base Unit of Measure";
                                        MaterialIssueLine.VALIDATE("Unit of Measure Code");
                                        MaterialIssueLine.VALIDATE("Unit of Measure");
                                        MaterialIssueLine.VALIDATE(MaterialIssueLine.Quantity, ProdOrdShortage.Shortage);
                                        MaterialIssueLine."Prod. Order No." := 'EFF10STR01';
                                        MaterialIssueLine."Prod. Order Line No." := 10000;
                                        MaterialIssueLine.INSERT;
                                        ProdOrdShortage.CreateReq_MCH := FALSE;
                                        ProdOrdShortage.MODIFY;
                                    END;
                                END;
                            UNTIL ProdOrdShortage.NEXT = 0;
                        ProdOrdShortage.MODIFYALL(ProdOrdShortage.Req_created, FALSE);
                        IF LineNo < 10000 THEN
                            MaterialIssueHeader.DELETE
                        ELSE
                            AuthMail;
                    END;
                end;
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        "Qty. in Purchase Orders" := 0;
        "Purchase Line".RESET;
        "Purchase Line".SETFILTER("Purchase Line"."Document Type", 'Order');
        "Purchase Line".SETCURRENTKEY("Purchase Line"."No.", "Purchase Line"."Buy-from Vendor No.");
        "Purchase Line".SETRANGE("Purchase Line"."No.", Item);
        "Purchase Line".SETFILTER("Purchase Line"."Location Code", 'STR'); //Need to add Location Code (VISHNU)
        "Purchase Line".SETFILTER("Purchase Line"."Qty. to Receive", '>%1', 0);
        IF "Purchase Line".FIND('-') THEN
            REPEAT
                "Qty. in Purchase Orders" += "Purchase Line"."Qty. to Receive";
            UNTIL "Purchase Line".NEXT = 0;

        "Qty. Under Inspection" := 0;
        QILE.RESET;
        QILE.SETCURRENTKEY(QILE."Posting Date", QILE."Item No.");
        QILE.SETRANGE(QILE."Item No.", Item);
        QILE.SETRANGE(QILE."Inspection Status", QILE."Inspection Status"::"Under Inspection");
        QILE.SETRANGE(QILE."Sent for Rework", FALSE);
        QILE.SETFILTER(QILE."Remaining Quantity", '>%1', 0); //Need to add Location Code (VISHNU)
        QILE.SETRANGE(QILE."Location Code", 'STR');
        QILE.SETRANGE(QILE.Accept, TRUE);
        IF QILE.FIND('-') THEN
            REPEAT
                "Qty. Under Inspection" += QILE."Remaining Quantity";
            UNTIL QILE.NEXT = 0;

        // Added by Rakesh to get Overall shortage on 18-Sep-14
        Total_shortage := 0;
        ProdOrdShortage.RESET;
        ProdOrdShortage.SETRANGE(ProdOrdShortage.Item, Item);
        IF ProdOrdShortage.FINDSET THEN
            REPEAT
                Total_shortage := Total_shortage + ProdOrdShortage.Shortage;
            UNTIL ProdOrdShortage.NEXT = 0;
        ProdOrdShortage."Total Shortage" := Total_shortage;
        "Total Shortage" := Total_shortage;
        // end by Rakesh

        getStockValues; // Added by Rakesh
        VerifyRequest;
    end;

    var
        "Purchase Line": Record "Purchase Line";
        QILE: Record "Quality Item Ledger Entry";
        ITEM1: Record Item;
        ItemLedgEntry: Record "Item Ledger Entry";
        QualityItemLedgEntry: Record "Quality Item Ledger Entry";
        ProdOrdShortage: Record "Production Order Shortage Item";
        "Stock at Stores": Decimal;
        "Stock at CS Stores": Decimal;
        "Stock at RD Stores": Decimal;
        "Stock at MCH": Decimal;
        MaterialIssueHeader: Record "Material Issues Header";
        MaterialIssueLine: Record "Material Issues Line";
        USER: Record User;
        LineNo: Integer;
        Body: Text[1000];
        "Mail-Id": Record User;
        "from Mail": Text[1000];
        Mail_To: Text[250];
        Subject: Text[250];
        UserSetup: Record "User Setup";
        CurrentUserID: Text[50];
        AuthorizedID: Text[50];
        MR: Record "Material Issues Header";
        SMTP_MAIL: Codeunit "SMTP Mail";
        Attachment: Text[1000];
        Total_shortage: Decimal;
        Req_stock: Decimal;
        Req_count: Decimal;

    (12525)]
    procedure getStockValues();
    begin
        // Added by Rakesh to get the stock in stores, RD, CS and MCH on 15-Sep-14
        IF ITEM1.GET(Item) THEN BEGIN
            ITEM1.CALCFIELDS(ITEM1."Inventory at Stores");
            ITEM1.CALCFIELDS(ITEM1."Quantity Under Inspection");
            ITEM1.CALCFIELDS(ITEM1."Quantity Rejected");
            ITEM1.CALCFIELDS(ITEM1."Stock At MCH Location");
            ITEM1.CALCFIELDS(ITEM1."Stock at CS Stores");
            ITEM1.CALCFIELDS(ITEM1."Stock at RD Stores");
            //Need to add Location Code (VISHNU) other Locations
            "Stock at MCH" := ITEM1."Stock At MCH Location";
            "Stock at CS Stores" := ITEM1."Stock at CS Stores";
            "Stock at RD Stores" := ITEM1."Stock at RD Stores";



            "Stock at Stores" := ITEM1."Inventory at Stores" - (ITEM1."Quantity Under Inspection" + ITEM1."Quantity Rejected");
            IF "Stock at Stores" < 0 THEN
                "Stock at Stores" := 0;

            "Stock at Stores" := 0;

            ITEM1.CALCFIELDS(ITEM1."Quantity Under Inspection", ITEM1."Quantity Rejected", ITEM1."Quantity Rework", ITEM1."Quantity Sent for Rework", ITEM1."Stock At MCH Location", ITEM1."Stock at CS Stores",
                ITEM1."Stock at RD Stores", ITEM1."Stock at PROD Stores");
            //Need to add Location Code (VISHNU) Other STR LOCATION CONDITION ALSO NEED TO INCLUDE
            IF (ITEM1."Quantity Under Inspection" = 0) AND (ITEM1."Quantity Rejected" = 0) AND (ITEM1."Quantity Rework" = 0) AND (ITEM1."Quantity Sent for Rework" = 0) THEN BEGIN
                ItemLedgEntry.RESET;
                ItemLedgEntry.SETCURRENTKEY("Item No.", "Variant Code", Open, Positive, "Location Code", "Posting Date",
                "Expiration Date", "Lot No.", "Serial No.");
                ItemLedgEntry.SETRANGE("Item No.", Item);
                ItemLedgEntry.SETRANGE(Open, TRUE);
                ItemLedgEntry.SETRANGE("Location Code", 'STR');
                ItemLedgEntry.SETFILTER(ItemLedgEntry."Remaining Quantity", '<>%1', 0);
                IF ItemLedgEntry.FINDSET THEN
                    REPEAT
                        ItemLedgEntry.MARK(TRUE);
                    UNTIL ItemLedgEntry.NEXT = 0;
            END ELSE BEGIN

                ItemLedgEntry.RESET;
                ItemLedgEntry.SETCURRENTKEY("Item No.", "Variant Code", Open, Positive, "Location Code", "Posting Date",
                "Expiration Date", "Lot No.", "Serial No.");

                ItemLedgEntry.SETRANGE("Item No.", Item);
                ItemLedgEntry.SETRANGE(Open, TRUE);
                ItemLedgEntry.SETRANGE("Location Code", 'STR');
                ItemLedgEntry.SETFILTER(ItemLedgEntry."Remaining Quantity", '>%1', 0);
                IF ItemLedgEntry.FINDSET THEN
                    REPEAT
                        ItemLedgEntry.MARK(TRUE);
                        IF (QualityItemLedgEntry.GET(ItemLedgEntry."Entry No.") AND (QualityItemLedgEntry."Inspection Status" =
                        QualityItemLedgEntry."Inspection Status"::"Under Inspection")) OR
                        (QualityItemLedgEntry.GET(ItemLedgEntry."Entry No.")
                        AND (QualityItemLedgEntry."Inspection Status" = QualityItemLedgEntry."Inspection Status"::Rejected)) THEN
                            ItemLedgEntry.MARK(FALSE);

                    UNTIL ItemLedgEntry.NEXT = 0;

            END;


            ItemLedgEntry.MARKEDONLY(TRUE);
            IF ItemLedgEntry.FINDSET THEN
                REPEAT

                    "Stock at Stores" := "Stock at Stores" + ItemLedgEntry."Remaining Quantity";
                UNTIL ItemLedgEntry.NEXT = 0;

        END
        // end by Rakesh
    end;

    (12598)]
    procedure GetStock(Item: Code[30]);
    begin
        IF ITEM1.GET(Item) THEN BEGIN
            ITEM1.CALCFIELDS(ITEM1."Inventory at Stores");
            ITEM1.CALCFIELDS(ITEM1."Quantity Under Inspection");
            ITEM1.CALCFIELDS(ITEM1."Quantity Rejected");
            ITEM1.CALCFIELDS(ITEM1."Stock At MCH Location");
            ITEM1.CALCFIELDS(ITEM1."Stock at CS Stores");
            ITEM1.CALCFIELDS(ITEM1."Stock at RD Stores");

            "Stock at MCH" := ITEM1."Stock At MCH Location";
            "Stock at CS Stores" := ITEM1."Stock at CS Stores";
            "Stock at RD Stores" := ITEM1."Stock at RD Stores";

            //Need to add Location Code (VISHNU) Other Locations 2

            "Stock at Stores" := ITEM1."Inventory at Stores" - (ITEM1."Quantity Under Inspection" + ITEM1."Quantity Rejected");
            IF "Stock at Stores" < 0 THEN
                "Stock at Stores" := 0;

            "Stock at Stores" := 0;
            //Need to add Location Code (VISHNU) Other STR CONDITION NEED TO INCLUDE
            ITEM1.CALCFIELDS(ITEM1."Quantity Under Inspection", ITEM1."Quantity Rejected", ITEM1."Quantity Rework", ITEM1."Quantity Sent for Rework", ITEM1."Stock At MCH Location", ITEM1."Stock at CS Stores",
                ITEM1."Stock at RD Stores", ITEM1."Stock at PROD Stores");

            IF (ITEM1."Quantity Under Inspection" = 0) AND (ITEM1."Quantity Rejected" = 0) AND (ITEM1."Quantity Rework" = 0) AND (ITEM1."Quantity Sent for Rework" = 0) THEN BEGIN
                ItemLedgEntry.RESET;
                ItemLedgEntry.SETCURRENTKEY("Item No.", "Variant Code", Open, Positive, "Location Code", "Posting Date",
                "Expiration Date", "Lot No.", "Serial No.");
                ItemLedgEntry.SETRANGE("Item No.", Item);
                ItemLedgEntry.SETRANGE(Open, TRUE);
                ItemLedgEntry.SETRANGE("Location Code", 'STR');
                ItemLedgEntry.SETFILTER(ItemLedgEntry."Remaining Quantity", '<>%1', 0);
                IF ItemLedgEntry.FINDSET THEN
                    REPEAT
                        ItemLedgEntry.MARK(TRUE);
                    UNTIL ItemLedgEntry.NEXT = 0;
            END ELSE BEGIN

                ItemLedgEntry.RESET;
                ItemLedgEntry.SETCURRENTKEY("Item No.", "Variant Code", Open, Positive, "Location Code", "Posting Date",
                "Expiration Date", "Lot No.", "Serial No.");

                ItemLedgEntry.SETRANGE("Item No.", Item);
                ItemLedgEntry.SETRANGE(Open, TRUE);
                ItemLedgEntry.SETRANGE("Location Code", 'STR');
                ItemLedgEntry.SETFILTER(ItemLedgEntry."Remaining Quantity", '>%1', 0);
                IF ItemLedgEntry.FINDSET THEN
                    REPEAT
                        ItemLedgEntry.MARK(TRUE);
                        IF (QualityItemLedgEntry.GET(ItemLedgEntry."Entry No.") AND (QualityItemLedgEntry."Inspection Status" =
                        QualityItemLedgEntry."Inspection Status"::"Under Inspection")) OR
                        (QualityItemLedgEntry.GET(ItemLedgEntry."Entry No.")
                        AND (QualityItemLedgEntry."Inspection Status" = QualityItemLedgEntry."Inspection Status"::Rejected)) THEN
                            ItemLedgEntry.MARK(FALSE);

                    UNTIL ItemLedgEntry.NEXT = 0;

            END;


            ItemLedgEntry.MARKEDONLY(TRUE);
            IF ItemLedgEntry.FINDSET THEN
                REPEAT

                    "Stock at Stores" := "Stock at Stores" + ItemLedgEntry."Remaining Quantity";
                UNTIL ItemLedgEntry.NEXT = 0;

        END
        // end by Rakesh
    end;

    (12670)]
    procedure GetNextNo() NumberValue: Code[20];
    var
        DateValue: Text[30];
        MonthValue: Text[30];
        YearValue: Text[30];
        MaterialIssuesHeaderLocal: Record "Material Issues Header";
        PostedMatIssHeaderLocal: Record "Posted Material Issues Header";
        LastNumber: Code[20];
    begin
        IF DATE2DMY(WORKDATE, 1) < 10 THEN
            DateValue := '0' + FORMAT(DATE2DMY(WORKDATE, 1))
        ELSE
            DateValue := FORMAT(DATE2DMY(WORKDATE, 1));

        IF DATE2DMY(WORKDATE, 2) < 10 THEN
            MonthValue := '0' + FORMAT(DATE2DMY(WORKDATE, 2))
        ELSE
            MonthValue := FORMAT(DATE2DMY(WORKDATE, 2));

        IF DATE2DMY(WORKDATE, 2) <= 12 THEN
            YearValue := COPYSTR(FORMAT(DATE2DMY(WORKDATE, 3)), 3, 2);
        //IF ((TODAY=010810D) OR (TODAY=010910D) OR (TODAY=011010D))THEN
        //  NumberValue := 'V'+YearValue+MonthValue+DateValue
        //ELSE
        NumberValue := 'R' + YearValue + MonthValue + DateValue;

        LastNumber := NumberValue + '0000';
        MaterialIssuesHeaderLocal.RESET;
        MaterialIssuesHeaderLocal.SETFILTER("No.", NumberValue + '*');
        IF MaterialIssuesHeaderLocal.FINDLAST THEN
            LastNumber := MaterialIssuesHeaderLocal."No.";

        PostedMatIssHeaderLocal.RESET;
        PostedMatIssHeaderLocal.SETCURRENTKEY("Material Issue No.");
        PostedMatIssHeaderLocal.SETFILTER("Material Issue No.", NumberValue + '*');
        IF PostedMatIssHeaderLocal.FINDLAST THEN
            IF LastNumber < PostedMatIssHeaderLocal."Material Issue No." THEN
                LastNumber := PostedMatIssHeaderLocal."Material Issue No.";

        NumberValue := INCSTR(LastNumber);
    end;

    (12701)]
    procedure VerifyRequest();
    begin
        // Added by Rakesh to verify request already created for Item on 17-Sep-14
        //Req_created := FALSE;
        MaterialIssueHeader.RESET;
        MaterialIssueHeader.SETRANGE(MaterialIssueHeader.Remarks, 'Item Transfer');

        IF MaterialIssueHeader.FINDSET THEN
            REPEAT
                IF (MaterialIssueHeader."Transfer-from Code" = 'STR') THEN   //Need to add Location Code (VISHNU) Other STR CONDITION NEED TO INCLUDE
                BEGIN
                    MaterialIssueLine.RESET;
                    MaterialIssueLine.SETRANGE(MaterialIssueLine."Document No.", MaterialIssueHeader."No.");
                    IF MaterialIssueLine.FINDSET THEN
                        REPEAT
                            IF (MaterialIssueLine."Item No." = Item) THEN BEGIN
                                CreateReq_STR := FALSE;
                                Req_created := TRUE;
                            END
                        UNTIL MaterialIssueLine.NEXT = 0;
                END;

                IF (MaterialIssueHeader."Transfer-from Code" = 'CS STR') THEN BEGIN
                    MaterialIssueLine.RESET;
                    MaterialIssueLine.SETRANGE(MaterialIssueLine."Document No.", MaterialIssueHeader."No.");
                    IF MaterialIssueLine.FINDSET THEN
                        REPEAT
                            IF (MaterialIssueLine."Item No." = Item) THEN BEGIN
                                CreateReq_CS := FALSE;
                                Req_created := TRUE;
                            END
                        UNTIL MaterialIssueLine.NEXT = 0;
                END;

                IF (MaterialIssueHeader."Transfer-from Code" = 'R&D STR') THEN BEGIN
                    MaterialIssueLine.RESET;
                    MaterialIssueLine.SETRANGE(MaterialIssueLine."Document No.", MaterialIssueHeader."No.");
                    IF MaterialIssueLine.FINDSET THEN
                        REPEAT
                            IF (MaterialIssueLine."Item No." = Item) THEN BEGIN
                                CreateReq_RD := FALSE;
                                Req_created := TRUE;
                            END
                        UNTIL MaterialIssueLine.NEXT = 0;
                END;
                //Need to add Location Code (VISHNU) Other STR an  MCH CONDITION NEED TO INCLUDE

                IF (MaterialIssueHeader."Transfer-from Code" = 'MCH') THEN BEGIN
                    MaterialIssueLine.RESET;
                    MaterialIssueLine.SETRANGE(MaterialIssueLine."Document No.", MaterialIssueHeader."No.");
                    IF MaterialIssueLine.FINDSET THEN
                        REPEAT
                            IF (MaterialIssueLine."Item No." = Item) THEN BEGIN
                                CreateReq_MCH := FALSE;
                                Req_created := TRUE;
                            END
                        UNTIL MaterialIssueLine.NEXT = 0;
                END;
            UNTIL MaterialIssueHeader.NEXT = 0;
        // End by Rakesh
    end;

    (12768)]
    procedure AuthMail();
    begin
        //MESSAGE(MaterialIssueHeader."No.");

        Body := '';
        IF MaterialIssueHeader."Prod. Order No." = '' THEN
            ERROR('You must specify Production order no in Material Requests Header');

        IF MaterialIssueHeader."Prod. Order Line No." = 0 THEN
            ERROR('You must specify Production order line no in Material Requests Header');

        IF MaterialIssueHeader."Request for Authorization" = '' THEN
            ERROR('You must specify Authorised Person at Material Issues Header');

        MaterialIssueLine.SETRANGE(MaterialIssueLine."Document No.", MaterialIssueHeader."No.");

        IF MaterialIssueLine.FINDSET THEN
            REPEAT
                IF MaterialIssueLine.Quantity = 0 THEN
                    ERROR('You must specify the Quantity at Material Issues Line part');
            UNTIL MaterialIssueLine.NEXT = 0;

        "Mail-Id".SETRANGE("Mail-Id"."User Name", USERID);

        IF "Mail-Id".FINDFIRST THEN
            "from Mail" := "Mail-Id".MailID
        ELSE
            ERROR('You do not Have Mail id in ERP & Please inform the ERP Administrator to Create your Mail id');

        "Mail-Id".RESET;
        "Mail-Id".SETRANGE("Mail-Id"."User Name", MaterialIssueHeader."Request for Authorization");
        IF "Mail-Id".FINDFIRST THEN BEGIN
            IF "Mail-Id".levels = TRUE THEN
                Mail_To := "Mail-Id".MailID
            ELSE
                ERROR('You are Specified UnAuthorized person & If any Modification Please Contact ERP Administrtor');
        END;

        Subject := 'ERP- Material Request for Authorisation' + FORMAT(MaterialIssueHeader."No.");

        Body += '<body><strong><form><table style="WIDTH:400px; HEIGHT: 20px; FONT-WEIGHT: bold"';
        Body += 'border="1" align="center">';
        Body += '<tr><td>Requested No</td><td>' + MaterialIssueHeader."No." + '</td></tr><br>';
        Body += '<tr><td>Requested User</td><td>' + MaterialIssueHeader."User ID" + ':  ' + MaterialIssueHeader."Resource Name" + '</td></tr><br>';
        Body += '<tr><td>Project Name</td><td>' + MaterialIssueHeader."Proj Description" + '</td></tr>';
        Body += '<tr><td bgcolor="green">';

        UserSetup.RESET;
        UserSetup.SETRANGE("User ID", USERID);
        IF UserSetup.FINDFIRST THEN BEGIN
            CurrentUserID := UserSetup."Current UserId";
        END;



        Body += '<a Href="http://192.168.0.155:5556/erp_reports/ERP_MatAuth.aspx?val1=' + FORMAT(MaterialIssueHeader."No.") + '&val2=' + FORMAT(CurrentUserID);

        UserSetup.RESET;
        UserSetup.SETRANGE("User ID", MaterialIssueHeader."Request for Authorization");
        IF UserSetup.FINDFIRST THEN BEGIN
            AuthorizedID := UserSetup."Current UserId";
        END;


        Body += '&val3=' + FORMAT(AuthorizedID);
        Body += '&val4=1';
        Body += '&val5=' + Mail_To;
        Body += '&val6=' + "from Mail";
        Body += '&val7=Accepted"target="_blank">';
        Body += '<font face="arial" color="#ffffff">ACCEPT</font></a>';
        Body += '</td><td bgcolor="red">';
        Body += '<a Href="http://192.168.0.155:5556/erp_reports/ERP_MatAuth.aspx?val1=' + FORMAT(MaterialIssueHeader."No.");
        Body += '&val2=' + FORMAT(CurrentUserID);
        Body += '&val3=' + FORMAT(AuthorizedID);
        Body += '&val4=0';
        Body += '&val5=' + Mail_To;
        Body += '&val6=' + "from Mail";
        Body += '&val7=Rejected';
        Body += '"target="_blank">';
        Body += '<font face="arial" color="#ffffff">REJECT</font></a></td></tr>';
        Body += '</table></form></font></strong></body>';
        MR.SETRANGE(MR."No.", MaterialIssueHeader."No.");
        IF MR.FINDFIRST THEN
            REPORT.RUN(33000890, FALSE, FALSE, MR);
        REPORT.SAVEASPDF(33000890, '\\erpserver\ErpAttachments\ErpAttachments1\' + MaterialIssueHeader."No." + '.pdf', MR);
        Attachment := '\\erpserver\ErpAttachments\ErpAttachments1\' + MaterialIssueHeader."No." + '.pdf';

        SMTP_MAIL.CreateMessage("Mail-Id"."User Name", 'erp@efftronics.com', Mail_To, Subject, Body, TRUE);
        SMTP_MAIL.AddAttachment(Attachment, '');//EFFUPG Added('')
        SMTP_MAIL.Send;
        MaterialIssueHeader.Status := MaterialIssueHeader.Status::"Sent for Authorization";
        MODIFY;

        MESSAGE('Material Request ' + MaterialIssueHeader."No." + ' is created. Mail is Sent to Store Manager');
        //end by rakesh
    end;
}

