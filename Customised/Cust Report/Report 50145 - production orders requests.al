report 50145 "production orders requests"
{
    DefaultLayout = RDLC;
    RDLCLayout = './production orders requests.rdlc';

    dataset
    {
        dataitem("Production Order"; "Production Order")
        {
            RequestFilterFields = Status, "No.";
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
        Text000: Label 'Inbound Whse. Requests are created.';
        Text001: Label 'No Inbound Whse. Request is created.';
        Text16360: Label 'Open Lines in Subcontracting Order No %1 must be Closed';
        Text0002: Label 'Do you want to create a Material Issue ?';
        Text0003: Label 'Material Issue already existed against this Prod. Order %1';
        Text0004: Label 'Material Issues created.';
        CopyProdOrderDoc: Report "Copy Production Order Document";
        ManuPrintReport: Codeunit "Manu. Print Report";
        "--SubCon--": Integer;
        ProdOrderLine: Record "Prod. Order Line";
        PurchaseLine: Record "Purchase Line";
        PurchaseList: Record "Purchase Line";
        "--B2B-KNR--": Integer;
        "Prod.OrdLine": Record "Prod. Order Line";
        RoutingLine: Record "Routing Line";
        RoutingHeader: Record "Routing Header";
        ProdOrderLine2: Record "Prod. Order Line";
        ProdOrderLine3: Record "Prod. Order Line";
        ProdOrderRoutingLine: Record "Prod. Order Routing Line";
        "Component Date": Date;
        "Component Time": Time;
        "Component DateTime": Decimal;
        TempDateTime: Decimal;
        RunTime: Decimal;
        item: Record Item;
        i: Integer;
        MaterialIssueHeader: Record "Material Issues Header";
        MaterialIssueLine: Record "Material Issues Line";
        PostedMaterialIssueHeader: Record "Posted Material Issues Header";
        InventorySetup: Record "Inventory Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        ManufacturingSetup: Record "Manufacturing Setup";
        user: Record User;
        refreshtime: Codeunit refreshdatetime;
        "Production Bom Line": Record "Production BOM Line";
        "Sales Header": Record "Sales Header";
        "Prod. Order Component": Record "Prod. Order Component";
        Day_Plan: Decimal;
        Prod_Order: Record "Production Order";
        ProdBOMHeader: Record "Production BOM Header";
        Choice: Option Create,Release;
        MATERIAL_ISSUES_HEAER: Record "Material Issues Header";
        "Release MaterialIssue Document": Codeunit "Release MaterialIssue Document";

    (7529)]
    procedure CreateALLMaterialIssues();
    var
        LineNo: Integer;
        ProdOrderComp: Record "Prod. Order Component";
    begin
        /*IF NOT CONFIRM(Text0002,FALSE) THEN
        EXIT;*/
        //"Production Order"."No."
        //"Production Order".Status
        //"Production Order"."Location Code"

        MaterialIssueHeader.SETRANGE("Prod. Order No.", "Production Order"."No.");
        IF MaterialIssueHeader.FIND('-') THEN
            ERROR(Text0003, "Production Order"."No.");

        PostedMaterialIssueHeader.SETRANGE("Prod. Order No.", "Production Order"."No.");
        IF PostedMaterialIssueHeader.FIND('-') THEN
            ERROR(Text0003, "Production Order"."No.");

        ProdOrderLine.RESET;
        ProdOrderLine.SETRANGE(Status, "Production Order".Status);
        ProdOrderLine.SETRANGE("Prod. Order No.", "Production Order"."No.");
        //ProdOrderLine.SETFILTER(ProdOrderLine."Line No.",'<>%1',20000);
        IF ProdOrderLine.FIND('-') THEN
            REPEAT
            BEGIN
                /*IF ProdOrderLine."Line No."<>10000 THEN
                BEGIN
                  ProdOrderComp.RESET;
                  ProdOrderComp.SETRANGE(Status,ProdOrderComp.Status :: Released);
                  ProdOrderComp.SETRANGE("Prod. Order No.","Production Order"."No.");
                  ProdOrderComp.SETRANGE("Prod. Order Line No.",ProdOrderLine."Line No.");
                  //ProdOrderComp.SETRANGE("Source No.","Item No.");
                  ProdOrderComp.SETFILTER("Remaining Quantity",'<>0');
                  IF ProdOrderComp.FIND('-') THEN BEGIN
                    LineNo := 10000;
                    InventorySetup.GET;
                    ManufacturingSetup.GET();
                    ManufacturingSetup.TESTFIELD("MI Transfer From Code");
                    MaterialIssueHeader.RESET;
                    MaterialIssueHeader.INIT;
                    MaterialIssueHeader."No." :=GetNextNo;// NoSeriesMgt.GetNextNo(InventorySetup."Material Issue Nos.",WORKDATE,TRUE);
                    MaterialIssueHeader."Receipt Date":=TODAY;
                    MaterialIssueHeader."Transfer-from Code" := ManufacturingSetup."MI Transfer From Code";
                    MaterialIssueHeader."Transfer-to Code":="Location Code";
                    MaterialIssueHeader.VALIDATE("Prod. Order No.","Production Order"."No.");
                    MaterialIssueHeader.VALIDATE("Prod. Order Line No.",ProdOrderLine."Line No.");
                    MaterialIssueHeader."User ID" := USERID;
                    user.GET(USERID);
                    MaterialIssueHeader."Resource Name":=user."User Name";
                    MaterialIssueHeader."Creation DateTime":=CURRENTDATETIME;
                    MaterialIssueHeader."Sales Order No.":="Sales Order No.";
                    MaterialIssueHeader.INSERT;
                  END;
                  REPEAT
                      item.GET(ProdOrderComp."Item No.");
                      MaterialIssueLine.INIT;
                      MaterialIssueLine."Document No." :=MaterialIssueHeader."No." ;
                      MaterialIssueLine.VALIDATE("Item No.",ProdOrderComp."Item No.");
                      MaterialIssueLine."Line No." := LineNo;
                      MaterialIssueLine."Unit of Measure Code" := ProdOrderComp."Unit of Measure Code";
                      MaterialIssueLine.VALIDATE("Unit of Measure Code");
                      MaterialIssueLine.VALIDATE("Unit of Measure");
                      MaterialIssueLine.VALIDATE(Quantity,ProdOrderComp."Expected Quantity");
                      MaterialIssueLine.VALIDATE("Qty. to Receive", ProdOrderComp."Expected Quantity");
                      MaterialIssueLine.VALIDATE("Outstanding Quantity",ProdOrderComp."Expected Quantity");
                      MaterialIssueLine."Prod. Order No." := ProdOrderComp."Prod. Order No.";
                      MaterialIssueLine."Prod. Order Line No." := ProdOrderComp."Prod. Order Line No.";
                      MaterialIssueLine."Prod. Order Comp. Line No." := ProdOrderComp."Line No.";
                      LineNo := LineNo + 10000;
                      MaterialIssueLine.INSERT;
                  UNTIL ProdOrderComp.NEXT = 0;
                  END;*/

                IF ProdOrderLine."Line No." <> 10000 THEN                //line no >10000  ECPBPCB00906
                BEGIN

                    IF ((ProdOrderLine."Item No." = 'ECPBPCB00553') OR (ProdOrderLine."Item No." = 'ECPBPCB00554') OR
                    (ProdOrderLine."Item No." = 'ECPBPCB00566') OR (ProdOrderLine."Item No." = 'ECPBPCB00864') OR
                    (ProdOrderLine."Item No." = 'ECPBPCB00434') OR (ProdOrderLine."Item No." = 'ECPBPCB00549') OR
                    (ProdOrderLine."Item No." = 'ECPBPCB00431') OR (ProdOrderLine."Item No." = 'ECPBPCB00882') OR
                     (ProdOrderLine."Item No." = 'ECPBPCB00936') OR (ProdOrderLine."Item No." = 'ECPBPCB00934') OR
                     (ProdOrderLine."Item No." = 'ECPBPCB01049') OR (ProdOrderLine."Item No." = 'ECPBPCB01038') OR
                     (ProdOrderLine."Item No." = 'ECPBPCB00534') OR (ProdOrderLine."Item No." = 'ECPBPCB01058') OR
                     (ProdOrderLine."Item No." = 'ECPBPCB01063') OR (ProdOrderLine."Item No." = 'ECPBPCB00908') OR
                      (ProdOrderLine."Item No." = 'ECPBPCB01070') OR (ProdOrderLine."Item No." = 'ECPBPCB01072') OR
                      (ProdOrderLine."Item No." = 'ECPBPCB01111') OR (ProdOrderLine."Item No." = 'ECPBPCB00856') OR
                       (ProdOrderLine."Item No." = 'ECPBPCB01231') OR (ProdOrderLine."Item No." = 'ECPBPCB00906')
                       OR (ProdOrderLine."Item No." = 'ECPBPCB01145') OR (ProdOrderLine."Item No." = 'ECPBPCB01146')
                       OR (ProdOrderLine."Item No." = 'ECPBPCB00933') OR (ProdOrderLine."Item No." = 'ECPBPCB00935')
                       OR (ProdOrderLine."Item No." = 'ECPBPCB00937') OR (ProdOrderLine."Item No." = 'ECPBPCB01073')
                        OR (ProdOrderLine."Item No." = 'ECPCBDS00878') OR (ProdOrderLine."Item No." = 'ECPCBDS01137')
                        OR (ProdOrderLine."Item No." = 'ECPBPCB01000') OR (ProdOrderLine."Item No." = 'ECPBPCB01270')
                        OR (ProdOrderLine."Item No." = 'ECPBPCB00582') OR (ProdOrderLine."Item No." = 'ECPBPCB00889')
                          OR (ProdOrderLine."Item No." = 'ECPBPCB01306')) THEN BEGIN
                        FOR i := 1 TO ProdOrderLine.Quantity DO BEGIN
                            ProdOrderComp.RESET;
                            ProdOrderComp.SETRANGE(Status, ProdOrderComp.Status::Released);
                            ProdOrderComp.SETRANGE("Prod. Order No.", "Production Order"."No.");
                            ProdOrderComp.SETRANGE("Prod. Order Line No.", ProdOrderLine."Line No.");
                            //ProdOrderComp.SETRANGE("Source No.","Item No.");
                            ProdOrderComp.SETFILTER(ProdOrderComp."Type of Solder", 'smd');
                            ProdOrderComp.SETFILTER("Remaining Quantity", '<>0');
                            IF ProdOrderComp.FIND('-') THEN BEGIN
                                LineNo := 10000;
                                InventorySetup.GET;
                                ManufacturingSetup.GET();
                                ManufacturingSetup.TESTFIELD("MI Transfer From Code");
                                MaterialIssueHeader.RESET;
                                MaterialIssueHeader.INIT;
                                MaterialIssueHeader."No." := GetNextNo;// NoSeriesMgt.GetNextNo(InventorySetup."Material Issue Nos.",WORKDATE,TRUE);
                                MaterialIssueHeader."Receipt Date" := TODAY;
                                MaterialIssueHeader."Transfer-from Code" := 'MCH';
                                MaterialIssueHeader."Transfer-to Code" := "Production Order"."Location Code";
                                MaterialIssueHeader.VALIDATE("Prod. Order No.", "Production Order"."No.");
                                MaterialIssueHeader.VALIDATE("Prod. Order Line No.", ProdOrderLine."Line No.");
                                MaterialIssueHeader."User ID" := USERID;
                                user.GET(USERID);
                                MaterialIssueHeader."Resource Name" := user."User Name";
                                MaterialIssueHeader."Creation DateTime" := CURRENTDATETIME;
                                MaterialIssueHeader."Sales Order No." := "Production Order"."Sales Order No.";
                                MaterialIssueHeader.INSERT;
                            END;
                            REPEAT
                                item.GET(ProdOrderComp."Item No.");
                                MaterialIssueLine.INIT;
                                MaterialIssueLine."Document No." := MaterialIssueHeader."No.";
                                MaterialIssueLine.VALIDATE("Item No.", ProdOrderComp."Item No.");
                                MaterialIssueLine."Line No." := LineNo;
                                MaterialIssueLine."Unit of Measure Code" := ProdOrderComp."Unit of Measure Code";
                                MaterialIssueLine.VALIDATE("Unit of Measure Code");
                                MaterialIssueLine.VALIDATE("Unit of Measure");
                                MaterialIssueLine.VALIDATE(Quantity, (ProdOrderComp."Expected Quantity" / ProdOrderLine.Quantity));
                                /*MaterialIssueLine.VALIDATE("Qty. to Receive",(ProdOrderComp."Expected Quantity"/ProdOrderLine.Quantity));
                                MaterialIssueLine.VALIDATE("Outstanding Quantity",(ProdOrderComp."Expected Quantity"/ProdOrderLine.Quantity));
                                MaterialIssueLine.Quantity:=(ProdOrderComp."Expected Quantity"/ProdOrderLine.Quantity);
                                MaterialIssueLine."Qty. to Receive":=(ProdOrderComp."Expected Quantity"/ProdOrderLine.Quantity);
                                MaterialIssueLine."Outstanding Quantity":=(ProdOrderComp."Expected Quantity"/ProdOrderLine.Quantity);*///anil
                                MaterialIssueLine."Prod. Order No." := ProdOrderComp."Prod. Order No.";
                                MaterialIssueLine."Prod. Order Line No." := ProdOrderComp."Prod. Order Line No.";
                                MaterialIssueLine."Prod. Order Comp. Line No." := ProdOrderComp."Line No.";
                                LineNo := LineNo + 10000;
                                MaterialIssueLine.INSERT;
                            UNTIL ProdOrderComp.NEXT = 0;
                        END;
                    END;
                END;//anil1
                IF ProdOrderLine."Line No." <> 10000 THEN                //line no >10000
                BEGIN
                    IF ((ProdOrderLine."Item No." = 'ECPBPCB00553') OR (ProdOrderLine."Item No." = 'ECPBPCB00554') OR
                    (ProdOrderLine."Item No." = 'ECPBPCB00566') OR (ProdOrderLine."Item No." = 'ECPBPCB00864') OR
                    (ProdOrderLine."Item No." = 'ECPBPCB00434') OR (ProdOrderLine."Item No." = 'ECPBPCB00549') OR
                    (ProdOrderLine."Item No." = 'ECPBPCB00431') OR (ProdOrderLine."Item No." = 'ECPBPCB00882') OR
                    (ProdOrderLine."Item No." = 'ECPBPCB00936') OR (ProdOrderLine."Item No." = 'ECPBPCB00934') OR
                     (ProdOrderLine."Item No." = 'ECPBPCB01049') OR (ProdOrderLine."Item No." = 'ECPBPCB01038') OR
                     (ProdOrderLine."Item No." = 'ECPBPCB00534') OR (ProdOrderLine."Item No." = 'ECPBPCB01058') OR
                     (ProdOrderLine."Item No." = 'ECPBPCB01063') OR (ProdOrderLine."Item No." = 'ECPBPCB00908') OR
                      (ProdOrderLine."Item No." = 'ECPBPCB01070') OR (ProdOrderLine."Item No." = 'ECPBPCB01072') OR
                      (ProdOrderLine."Item No." = 'ECPBPCB01111') OR (ProdOrderLine."Item No." = 'ECPBPCB00856') OR
                      (ProdOrderLine."Item No." = 'ECPBPCB01231') OR (ProdOrderLine."Item No." = 'ECPBPCB00906')
                      OR (ProdOrderLine."Item No." = 'ECPBPCB01145') OR (ProdOrderLine."Item No." = 'ECPBPCB01146')
                       OR (ProdOrderLine."Item No." = 'ECPBPCB00933') OR (ProdOrderLine."Item No." = 'ECPBPCB00935')
                       OR (ProdOrderLine."Item No." = 'ECPBPCB00937') OR (ProdOrderLine."Item No." = 'ECPBPCB01073')
                        OR (ProdOrderLine."Item No." = 'ECPCBDS00878') OR (ProdOrderLine."Item No." = 'ECPCBDS01137')
                        OR (ProdOrderLine."Item No." = 'ECPBPCB01000') OR (ProdOrderLine."Item No." = 'ECPBPCB01270')
                        OR (ProdOrderLine."Item No." = 'ECPBPCB00582') OR (ProdOrderLine."Item No." = 'ECPBPCB00889')
                          OR (ProdOrderLine."Item No." = 'ECPBPCB01306')) THEN BEGIN
                        FOR i := 1 TO ProdOrderLine.Quantity DO BEGIN
                            ProdOrderComp.RESET;
                            ProdOrderComp.SETRANGE(Status, ProdOrderComp.Status::Released);
                            ProdOrderComp.SETRANGE("Prod. Order No.", "Production Order"."No.");
                            ProdOrderComp.SETRANGE("Prod. Order Line No.", ProdOrderLine."Line No.");
                            // ProdOrderComp.SETRANGE("Source No.","Item No.");
                            ProdOrderComp.SETFILTER(ProdOrderComp."Type of Solder", '<>%1', ProdOrderComp."Type of Solder"::SMD);
                            ProdOrderComp.SETFILTER("Remaining Quantity", '<>0');
                            IF ProdOrderComp.FIND('-') THEN BEGIN
                                LineNo := 10000;
                                InventorySetup.GET;
                                ManufacturingSetup.GET();
                                ManufacturingSetup.TESTFIELD("MI Transfer From Code");
                                MaterialIssueHeader.RESET;
                                MaterialIssueHeader.INIT;

                                MaterialIssueHeader."No." := GetNextNo;// NoSeriesMgt.GetNextNo(InventorySetup."Material Issue Nos.",WORKDATE,TRUE);

                                MaterialIssueHeader."Receipt Date" := TODAY;
                                MaterialIssueHeader."Transfer-from Code" := ManufacturingSetup."MI Transfer From Code";
                                MaterialIssueHeader."Transfer-to Code" := "Production Order"."Location Code";
                                MaterialIssueHeader.VALIDATE("Prod. Order No.", "Production Order"."No.");
                                MaterialIssueHeader.VALIDATE("Prod. Order Line No.", ProdOrderLine."Line No.");
                                MaterialIssueHeader."User ID" := USERID;
                                user.GET(USERID);
                                MaterialIssueHeader."Resource Name" := user."User Name";
                                MaterialIssueHeader."Creation DateTime" := CURRENTDATETIME;
                                MaterialIssueHeader."Sales Order No." := "Production Order"."Sales Order No.";
                                MaterialIssueHeader.INSERT;

                            END;
                            REPEAT
                                item.GET(ProdOrderComp."Item No.");
                                MaterialIssueLine.INIT;
                                MaterialIssueLine."Document No." := MaterialIssueHeader."No.";
                                MaterialIssueLine.VALIDATE("Item No.", ProdOrderComp."Item No.");
                                MaterialIssueLine."Line No." := LineNo;
                                MaterialIssueLine."Unit of Measure Code" := ProdOrderComp."Unit of Measure Code";
                                MaterialIssueLine.VALIDATE("Unit of Measure Code");
                                MaterialIssueLine.VALIDATE("Unit of Measure");
                                MaterialIssueLine.VALIDATE(Quantity, (ProdOrderComp."Expected Quantity" / ProdOrderLine.Quantity));
                                /*MaterialIssueLine.VALIDATE("Qty. to Receive",(ProdOrderComp."Expected Quantity"/ProdOrderLine.Quantity));
                                MaterialIssueLine.VALIDATE("Outstanding Quantity",(ProdOrderComp."Expected Quantity"/ProdOrderLine.Quantity));
                                MaterialIssueLine.Quantity:=(ProdOrderComp."Expected Quantity"/ProdOrderLine.Quantity);
                                MaterialIssueLine."Qty. to Receive":=(ProdOrderComp."Expected Quantity"/ProdOrderLine.Quantity);
                                MaterialIssueLine."Outstanding Quantity":=(ProdOrderComp."Expected Quantity"/ProdOrderLine.Quantity);*/
                                MaterialIssueLine."Prod. Order No." := ProdOrderComp."Prod. Order No.";
                                MaterialIssueLine."Prod. Order Line No." := ProdOrderComp."Prod. Order Line No.";
                                MaterialIssueLine."Prod. Order Comp. Line No." := ProdOrderComp."Line No.";
                                LineNo := LineNo + 10000;
                                MaterialIssueLine.INSERT;
                            UNTIL ProdOrderComp.NEXT = 0;
                        END;
                    END
                    ELSE BEGIN   //anil2
                                 /*IF ProdOrderLine."Line No."<>10000 THEN                //line no >10000
                                 BEGIN
                                 IF ((ProdOrderLine."Item No."<>'ECPBPCB00553')OR(ProdOrderLine."Item No."<>'ECPBPCB00554')OR
                                 (ProdOrderLine."Item No."<>'ECPBPCB00566')OR (ProdOrderLine."Item No."<>'ECPBPCB00864')OR
                                 (ProdOrderLine."Item No."<>'ECPBPCB00434')OR (ProdOrderLine."Item No."<>'ECPBPCB00549')OR
                                 (ProdOrderLine."Item No."<>'ECPBPCB00431')or(ProdOrderLine."Item No."='ECPBPCB00882')) THEN
                                 BEGIN*/
                        FOR i := 1 TO ProdOrderLine.Quantity DO BEGIN
                            ProdOrderComp.RESET;
                            ProdOrderComp.SETRANGE(Status, ProdOrderComp.Status::Released);
                            ProdOrderComp.SETRANGE("Prod. Order No.", "Production Order"."No.");
                            ProdOrderComp.SETRANGE("Prod. Order Line No.", ProdOrderLine."Line No.");
                            //ProdOrderComp.SETRANGE("Source No.","Item No.");
                            //  ProdOrderComp.SETFILTER(ProdOrderComp."Type of Solder",'<>%1',ProdOrderComp."Type of Solder"::SMD);
                            ProdOrderComp.SETFILTER("Remaining Quantity", '<>0');
                            IF ProdOrderComp.FIND('-') THEN BEGIN
                                LineNo := 10000;
                                InventorySetup.GET;
                                ManufacturingSetup.GET();
                                ManufacturingSetup.TESTFIELD("MI Transfer From Code");
                                MaterialIssueHeader.RESET;
                                MaterialIssueHeader.INIT;
                                MaterialIssueHeader."No." := GetNextNo;// NoSeriesMgt.GetNextNo(InventorySetup."Material Issue Nos.",WORKDATE,TRUE);
                                MaterialIssueHeader."Receipt Date" := TODAY;
                                MaterialIssueHeader."Transfer-from Code" := ManufacturingSetup."MI Transfer From Code";
                                MaterialIssueHeader."Transfer-to Code" := "Production Order"."Location Code";
                                MaterialIssueHeader.VALIDATE("Prod. Order No.", "Production Order"."No.");
                                MaterialIssueHeader.VALIDATE("Prod. Order Line No.", ProdOrderLine."Line No.");
                                MaterialIssueHeader."User ID" := USERID;
                                user.GET(USERID);
                                MaterialIssueHeader."Resource Name" := user."User Name";
                                MaterialIssueHeader."Sales Order No." := "Production Order"."Sales Order No.";
                                MaterialIssueHeader."Creation DateTime" := CURRENTDATETIME;
                                MaterialIssueHeader.INSERT;
                            END;
                            REPEAT
                                item.GET(ProdOrderComp."Item No.");
                                MaterialIssueLine.INIT;
                                MaterialIssueLine."Document No." := MaterialIssueHeader."No.";
                                MaterialIssueLine.VALIDATE("Item No.", ProdOrderComp."Item No.");
                                MaterialIssueLine."Line No." := LineNo;
                                MaterialIssueLine."Unit of Measure Code" := ProdOrderComp."Unit of Measure Code";
                                MaterialIssueLine.VALIDATE("Unit of Measure Code");
                                MaterialIssueLine.VALIDATE("Unit of Measure");
                                MaterialIssueLine.VALIDATE(Quantity, (ProdOrderComp."Expected Quantity" / ProdOrderLine.Quantity));
                                /*MaterialIssueLine.Quantity:=(ProdOrderComp."Expected Quantity"/ProdOrderLine.Quantity);
                                MaterialIssueLine."Qty. to Receive":=(ProdOrderComp."Expected Quantity"/ProdOrderLine.Quantity);
                                MaterialIssueLine."Outstanding Quantity":=(ProdOrderComp."Expected Quantity"/ProdOrderLine.Quantity);*/
                                MaterialIssueLine."Prod. Order No." := ProdOrderComp."Prod. Order No.";
                                MaterialIssueLine."Prod. Order Line No." := ProdOrderComp."Prod. Order Line No.";
                                MaterialIssueLine."Prod. Order Comp. Line No." := ProdOrderComp."Line No.";
                                LineNo := LineNo + 10000;
                                MaterialIssueLine.INSERT;
                            UNTIL ProdOrderComp.NEXT = 0;



                        END;
                    END;
                END;
                //ANIL
                IF ProdOrderLine."Line No." = 10000 THEN BEGIN
                    ProdOrderComp.RESET;
                    ProdOrderComp.SETRANGE(Status, ProdOrderComp.Status::Released);
                    ProdOrderComp.SETRANGE("Prod. Order No.", "Production Order"."No.");
                    ProdOrderComp.SETRANGE("Prod. Order Line No.", ProdOrderLine."Line No.");
                    ProdOrderComp.SETFILTER(ProdOrderComp."BOM Type", 'Mechanical');
                    //ProdOrderComp.SETRANGE("Source No.","Item No.");
                    ProdOrderComp.SETFILTER("Remaining Quantity", '<>0');
                    IF ProdOrderComp.FIND('-') THEN BEGIN
                        LineNo := 10000;
                        InventorySetup.GET;
                        ManufacturingSetup.GET();
                        ManufacturingSetup.TESTFIELD("MI Transfer From Code");
                        MaterialIssueHeader.RESET;
                        MaterialIssueHeader.INIT;
                        MaterialIssueHeader."No." := GetNextNo;// NoSeriesMgt.GetNextNo(InventorySetup."Material Issue Nos.",WORKDATE,TRUE);
                        MaterialIssueHeader."Receipt Date" := TODAY;
                        MaterialIssueHeader."Transfer-from Code" := ManufacturingSetup."MI Transfer From Code";
                        MaterialIssueHeader."Transfer-to Code" := "Production Order"."Location Code";
                        MaterialIssueHeader.VALIDATE("Prod. Order No.", "Production Order"."No.");
                        MaterialIssueHeader.VALIDATE("Prod. Order Line No.", ProdOrderLine."Line No.");
                        MaterialIssueHeader."User ID" := USERID;
                        //MaterialIssueHeader."BOM Type":='Mechanical';
                        user.GET(USERID);
                        MaterialIssueHeader."Resource Name" := user."User Name";
                        MaterialIssueHeader."Creation DateTime" := CURRENTDATETIME;
                        MaterialIssueHeader."Sales Order No." := "Production Order"."Sales Order No.";
                        MaterialIssueHeader.INSERT;
                    END;
                    REPEAT
                        item.GET(ProdOrderComp."Item No.");
                        MaterialIssueLine.INIT;
                        MaterialIssueLine."Document No." := MaterialIssueHeader."No.";
                        MaterialIssueLine.VALIDATE("Item No.", ProdOrderComp."Item No.");
                        MaterialIssueLine."Line No." := LineNo;
                        MaterialIssueLine."Unit of Measure Code" := ProdOrderComp."Unit of Measure Code";
                        MaterialIssueLine.VALIDATE("Unit of Measure Code");
                        MaterialIssueLine.VALIDATE("Unit of Measure");
                        MaterialIssueLine.VALIDATE(Quantity, ProdOrderComp."Expected Quantity");
                        MaterialIssueLine.VALIDATE("Qty. to Receive", ProdOrderComp."Expected Quantity");
                        MaterialIssueLine.VALIDATE("Outstanding Quantity", ProdOrderComp."Expected Quantity");
                        MaterialIssueLine."Prod. Order No." := ProdOrderComp."Prod. Order No.";
                        MaterialIssueLine."Prod. Order Line No." := ProdOrderComp."Prod. Order Line No.";
                        MaterialIssueLine."Prod. Order Comp. Line No." := ProdOrderComp."Line No.";
                        LineNo := LineNo + 10000;
                        MaterialIssueLine.INSERT;
                    UNTIL ProdOrderComp.NEXT = 0;
                END;  //ANIL
                IF (ProdOrderLine."Line No." = 10000) AND
                   (("Production Order"."Source No." = 'RLYMNGL001') OR
                    ("Production Order"."Source No." = 'RLYMNRL001') OR
                    ("Production Order"."Source No." = 'RLYMNYL001')) THEN BEGIN
                    ProdOrderComp.RESET;
                    ProdOrderComp.SETRANGE(Status, ProdOrderComp.Status::Released);
                    ProdOrderComp.SETRANGE("Prod. Order No.", "Production Order"."No.");
                    ProdOrderComp.SETRANGE("Prod. Order Line No.", ProdOrderLine."Line No.");
                    //ProdOrderComp.SETRANGE("Source No.","Item No.");
                    ProdOrderComp.SETFILTER("Remaining Quantity", '<>0');
                    IF ProdOrderComp.FIND('-') THEN BEGIN
                        LineNo := 10000;
                        InventorySetup.GET;
                        ManufacturingSetup.GET();
                        ManufacturingSetup.TESTFIELD("MI Transfer From Code");
                        MaterialIssueHeader.RESET;
                        MaterialIssueHeader.INIT;
                        MaterialIssueHeader."No." := GetNextNo;// NoSeriesMgt.GetNextNo(InventorySetup."Material Issue Nos.",WORKDATE,TRUE);
                        MaterialIssueHeader."Receipt Date" := TODAY;
                        MaterialIssueHeader."Transfer-from Code" := ManufacturingSetup."MI Transfer From Code";
                        MaterialIssueHeader."Transfer-to Code" := "Production Order"."Location Code";
                        MaterialIssueHeader.VALIDATE("Prod. Order No.", "Production Order"."No.");
                        MaterialIssueHeader.VALIDATE("Prod. Order Line No.", ProdOrderLine."Line No.");
                        MaterialIssueHeader."User ID" := USERID;
                        //MaterialIssueHeader."BOM Type":='Mechanical';
                        user.GET(USERID);
                        MaterialIssueHeader."Resource Name" := user."User Name";
                        MaterialIssueHeader."Creation DateTime" := CURRENTDATETIME;
                        MaterialIssueHeader."Sales Order No." := "Production Order"."Sales Order No.";
                        MaterialIssueHeader.INSERT;
                    END;
                    REPEAT
                        item.GET(ProdOrderComp."Item No.");
                        IF item."Product Group Code" = 'PCB' THEN BEGIN
                            MaterialIssueLine.INIT;
                            MaterialIssueLine."Document No." := MaterialIssueHeader."No.";
                            MaterialIssueLine.VALIDATE("Item No.", ProdOrderComp."Item No.");
                            MaterialIssueLine."Line No." := LineNo;
                            MaterialIssueLine."Unit of Measure Code" := ProdOrderComp."Unit of Measure Code";
                            MaterialIssueLine.VALIDATE("Unit of Measure Code");
                            MaterialIssueLine.VALIDATE("Unit of Measure");
                            MaterialIssueLine.VALIDATE(Quantity, ProdOrderComp."Expected Quantity");
                            MaterialIssueLine.VALIDATE("Qty. to Receive", ProdOrderComp."Expected Quantity");
                            MaterialIssueLine.VALIDATE("Outstanding Quantity", ProdOrderComp."Expected Quantity");
                            MaterialIssueLine."Prod. Order No." := ProdOrderComp."Prod. Order No.";
                            MaterialIssueLine."Prod. Order Line No." := ProdOrderComp."Prod. Order Line No.";
                            MaterialIssueLine."Prod. Order Comp. Line No." := ProdOrderComp."Line No.";
                            LineNo := LineNo + 10000;
                            MaterialIssueLine.INSERT;
                        END;
                    UNTIL ProdOrderComp.NEXT = 0;
                END;  //ANIL

                IF ProdOrderLine."Line No." = 10000 THEN BEGIN
                    ProdOrderComp.RESET;
                    ProdOrderComp.SETRANGE(Status, ProdOrderComp.Status::Released);
                    ProdOrderComp.SETRANGE("Prod. Order No.", "Production Order"."No.");
                    ProdOrderComp.SETRANGE("Prod. Order Line No.", ProdOrderLine."Line No.");
                    // ProdOrderComp.SETFILTER(ProdOrderComp."BOM Type",'<>%1','Mechanical');
                    ProdOrderComp.SETFILTER(ProdOrderComp."BOM Type", 'wiring');
                    //ProdOrderComp.SETRANGE("Source No.","Item No.");
                    ProdOrderComp.SETFILTER("Remaining Quantity", '<>0');
                    IF ProdOrderComp.FIND('-') THEN BEGIN
                        LineNo := 10000;
                        InventorySetup.GET;
                        ManufacturingSetup.GET();
                        ManufacturingSetup.TESTFIELD("MI Transfer From Code");
                        MaterialIssueHeader.RESET;
                        MaterialIssueHeader.INIT;
                        MaterialIssueHeader."No." := GetNextNo;// NoSeriesMgt.GetNextNo(InventorySetup."Material Issue Nos.",WORKDATE,TRUE);
                        MaterialIssueHeader."Receipt Date" := TODAY;
                        MaterialIssueHeader."Transfer-from Code" := ManufacturingSetup."MI Transfer From Code";
                        MaterialIssueHeader."Transfer-to Code" := "Production Order"."Location Code";
                        MaterialIssueHeader.VALIDATE("Prod. Order No.", "Production Order"."No.");
                        MaterialIssueHeader.VALIDATE("Prod. Order Line No.", ProdOrderLine."Line No.");
                        MaterialIssueHeader."User ID" := USERID;
                        user.GET(USERID);
                        MaterialIssueHeader."Resource Name" := user."User Name";
                        MaterialIssueHeader."Creation DateTime" := CURRENTDATETIME;
                        MaterialIssueHeader."BOM Type" := MaterialIssueHeader."BOM Type"::Wiring;
                        MaterialIssueHeader."Sales Order No." := "Production Order"."Sales Order No.";
                        MaterialIssueHeader.INSERT;
                    END;
                    REPEAT
                        item.GET(ProdOrderComp."Item No.");
                        MaterialIssueLine.INIT;
                        MaterialIssueLine."Document No." := MaterialIssueHeader."No.";
                        MaterialIssueLine.VALIDATE("Item No.", ProdOrderComp."Item No.");
                        MaterialIssueLine."Line No." := LineNo;
                        MaterialIssueLine."Unit of Measure Code" := ProdOrderComp."Unit of Measure Code";
                        MaterialIssueLine.VALIDATE("Unit of Measure Code");
                        MaterialIssueLine.VALIDATE("Unit of Measure");
                        MaterialIssueLine.VALIDATE(Quantity, ProdOrderComp."Expected Quantity");
                        MaterialIssueLine.VALIDATE("Qty. to Receive", ProdOrderComp."Expected Quantity");
                        MaterialIssueLine.VALIDATE("Outstanding Quantity", ProdOrderComp."Expected Quantity");
                        MaterialIssueLine."Prod. Order No." := ProdOrderComp."Prod. Order No.";
                        MaterialIssueLine."Prod. Order Line No." := ProdOrderComp."Prod. Order Line No.";
                        MaterialIssueLine."Prod. Order Comp. Line No." := ProdOrderComp."Line No.";
                        LineNo := LineNo + 10000;
                        MaterialIssueLine.INSERT;
                    UNTIL ProdOrderComp.NEXT = 0;
                END;
            END;  //ANIL
            UNTIL ProdOrderLine.NEXT = 0;
        //  MESSAGE(Text0004);

    end;

    (7973)]
    procedure GetNextNo() NumberValue: Code[20];
    var
        DateValue: Text[30];
        MonthValue: Text[30];
        YearValue: Text[30];
        MaterialIssuesHeaderLocal: Record "Material Issues Header";
        PostedMatIssHeaderLocal: Record "Posted Material Issues Header";
        LastNumber: Code[20];
    begin
        /*IF DATE2DMY(WORKDATE,1) < 10 THEN
          DateValue := '0'+FORMAT(DATE2DMY(WORKDATE,1))
        ELSE DateValue := FORMAT(DATE2DMY(WORKDATE,1));
        
        IF DATE2DMY(WORKDATE,2) < 10 THEN
          MonthValue := '0'+FORMAT(DATE2DMY(WORKDATE,2))
        ELSE MonthValue := FORMAT(DATE2DMY(WORKDATE,2));
        
        IF DATE2DMY(WORKDATE,2) < 10 THEN
          YearValue := COPYSTR(FORMAT(DATE2DMY(WORKDATE,3)),3,2);
        //IF ((TODAY=010810D) OR (TODAY=010910D) OR (TODAY=011010D))THEN
        //  NumberValue := 'V'+YearValue+MonthValue+DateValue
        //ELSE
          NumberValue := 'R'+YearValue+MonthValue+DateValue;
        
        LastNumber := NumberValue+'0000';
        MaterialIssuesHeaderLocal.RESET;
        MaterialIssuesHeaderLocal.SETFILTER("No.",NumberValue+'*');
        IF MaterialIssuesHeaderLocal.FIND('+') THEN
          LastNumber := MaterialIssuesHeaderLocal."No.";
        
        PostedMatIssHeaderLocal.RESET;
        PostedMatIssHeaderLocal.SETCURRENTKEY("Material Issue No.");
        PostedMatIssHeaderLocal.SETFILTER("Material Issue No.",NumberValue+'*');
        IF PostedMatIssHeaderLocal.FIND('+') THEN
          IF LastNumber < PostedMatIssHeaderLocal."Material Issue No." THEN
            LastNumber := PostedMatIssHeaderLocal."Material Issue No.";
        
        NumberValue := INCSTR(LastNumber);
        // commented by anil */
        IF DATE2DMY(WORKDATE, 1) < 10 THEN
            DateValue := '0' + FORMAT(DATE2DMY(WORKDATE, 1))
        ELSE
            DateValue := FORMAT(DATE2DMY(WORKDATE, 1));

        IF DATE2DMY(WORKDATE, 2) < 10 THEN
            MonthValue := '0' + FORMAT(DATE2DMY(WORKDATE, 2))
        ELSE
            MonthValue := FORMAT(DATE2DMY(WORKDATE, 2));

        IF DATE2DMY(WORKDATE, 2) < 12 THEN
            YearValue := COPYSTR(FORMAT(DATE2DMY(WORKDATE, 3)), 3, 2);
        //MESSAGE(FORMAT(WORKDATE));
        //IF TODAY=010910D THEN
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
}

