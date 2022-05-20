page 60139 "Sales Amc Subform1"
{
    // version NAVW13.70,NAVIN3.70.00.13,B2B1.0,DWS1.0,SH1.0

    AutoSplitKey = true;
    Caption = 'Sales Order Subform';
    DelayedInsert = true;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Sales Line";
    SourceTableView = WHERE(Document Type=FILTER(Amc));

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field(Type;Type)
                {
                }
                field("Shipment Date";"Shipment Date")
                {
                }
                field("Tax Liable";"Tax Liable")
                {
                }
                field("No.";"No.")
                {

                    trigger OnValidate();
                    begin
                        ShowShortcutDimCode(ShortcutDimCode);
                          NoOnAfterValidate;
                    end;
                }
                field("Gen. Prod. Posting Group";"Gen. Prod. Posting Group")
                {
                }
                field("Line Discount %";"Line Discount %")
                {
                }
                field("Location Code";"Location Code")
                {
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                }
                field("Retention Portion";"Retention Portion")
                {
                }
                field("Supply Portion";"Supply Portion")
                {
                }
                field("Material Reuired Date";"Material Reuired Date")
                {
                }
                field("Type of Item";"Type of Item")
                {
                }
                field("Dummy Unit Cost";"Dummy Unit Cost")
                {
                }
                field("RDSO Charges";"RDSO Charges")
                {
                }
                field("To Be Shipped Qty";"To Be Shipped Qty")
                {
                }
                field("Packet No";"Packet No")
                {
                }
                field("RDSO Inspection Required";"RDSO Inspection Required")
                {
                }
                field(Description;Description)
                {
                    Editable = true;
                }
                field("Description 2";"Description 2")
                {
                }
                field("Service Tax Amount";"Service Tax Amount")
                {
                }
                field("Unit Cost (LCY)";"Unit Cost (LCY)")
                {
                }
                field(Quantity;Quantity)
                {
                    BlankZero = true;

                    trigger OnValidate();
                    begin
                        QuantityOnAfterValidate;
                    end;
                }
                field("Unit Price";"Unit Price")
                {
                    BlankZero = true;

                    trigger OnValidate();
                    begin
                        /*item.SETRANGE(item."No.","No.");
                        IF item.FINDFIRST THEN
                        BEGIN
                        IF "Qty. to Ship">0 THEN
                        BEGIN
                        IF ("Unit Price"<item."Avg Unit Cost")THEN
                        ERROR('Unit Price must be greater than item unit Cost');
                        END;
                        END;*/
                        
                        
                         IF ("Unit Price">0) THEN
                         "Dummy Unit Cost":="Unit Price";

                    end;
                }
                field("Qty. to Ship";"Qty. to Ship")
                {
                    BlankZero = true;
                }
                field("Qty. to Invoice";"Qty. to Invoice")
                {
                    BlankZero = true;
                }
                field("Quantity Shipped";"Quantity Shipped")
                {
                    BlankZero = true;
                    Editable = false;
                }
                field("Quantity Invoiced";"Quantity Invoiced")
                {
                    BlankZero = true;
                    Editable = false;
                }
                field("Line Amount";"Line Amount")
                {
                    BlankZero = true;
                }
                field("Excise Amount";"Excise Amount")
                {
                    Visible = false;
                }
                field("Tax %";"Tax %")
                {
                    Visible = true;
                }
                field("Tax Amount";"Tax Amount")
                {
                    Visible = false;
                }
                field("Outstanding Amount";"Outstanding Amount")
                {
                }
                field("Tax Group Code";"Tax Group Code")
                {
                }
                field("VAT Bus. Posting Group";"VAT Bus. Posting Group")
                {
                }
                field("Excise Bus. Posting Group";"Excise Bus. Posting Group")
                {
                }
                field("Excise Prod. Posting Group";"Excise Prod. Posting Group")
                {
                }
                field("Unit of Measure";"Unit of Measure")
                {
                    Visible = false;
                }
                field("eCess Amount";"eCess Amount")
                {
                    Editable = true;
                }
                field("Prod. Order Quantity";"Prod. Order Quantity")
                {
                }
                field("Prod. Due Date";"Prod. Due Date")
                {
                }
                field("Prod. Qty";"Prod. Qty")
                {
                }
                field("Production BOM No.";"Production BOM No.")
                {
                }
                field("Qty. Shipped (Base)";"Qty. Shipped (Base)")
                {
                }
                field("Qty. Invoiced (Base)";"Qty. Invoiced (Base)")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        ShowShortcutDimCode(ShortcutDimCode);
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        Type := xRec.Type;
        CLEAR(ShortcutDimCode);
    end;

    var
        SalesHeader : Record "Sales Header";
        SalesPriceCalcMgt : Codeunit "Sales Price Calc. Mgt.";
        TransferExtendedText : Codeunit "Transfer Extended Text";
        ShortcutDimCode : array [8] of Code[20];
        "-NAVIN-" : Integer;
        Check : Boolean;
        SalesPlanLine : Record "Sales Planning Line";
        Text001 : Label 'Prod. Order is already created against the Sales Order.';
        item : Record Item;

    [LineStart(12088)]
    procedure ApproveCalcInvDisc();
    begin
        CODEUNIT.RUN(CODEUNIT::"Sales-Disc. (Yes/No)",Rec);
    end;

    [LineStart(12091)]
    procedure CalcInvDisc();
    begin
        CODEUNIT.RUN(CODEUNIT::"Sales-Calc. Discount",Rec);
    end;

    [LineStart(12094)]
    procedure ExplodeBOM();
    begin
        CODEUNIT.RUN(CODEUNIT::"Sales-Explode BOM",Rec);
    end;

    [LineStart(12097)]
    procedure OpenPurchOrderForm();
    var
        PurchHeader : Record "Purchase Header";
        PurchOrder : Page "Purchase Order";
    begin
        PurchHeader.SETRANGE("No.","Purchase Order No.");
        PurchOrder.SETTABLEVIEW(PurchHeader);
        PurchOrder.EDITABLE := FALSE;
        PurchOrder.RUN;
    end;

    [LineStart(12103)]
    procedure OpenSpecialPurchOrderForm();
    var
        PurchHeader : Record "Purchase Header";
        PurchOrder : Page "Purchase Order";
    begin
        PurchHeader.SETRANGE("No.","Special Order Purchase No.");
        PurchOrder.SETTABLEVIEW(PurchHeader);
        PurchOrder.EDITABLE := FALSE;
        PurchOrder.RUN;
    end;

    [LineStart(12109)]
    procedure InsertExtendedText(Unconditionally : Boolean);
    begin
        IF TransferExtendedText.SalesCheckIfAnyExtText(Rec,Unconditionally) THEN BEGIN
          CurrPage.SAVERECORD;
          TransferExtendedText.InsertSalesExtText(Rec);
        END;
        IF TransferExtendedText.MakeUpdate THEN
          UpdateForm(TRUE);
    end;

    [LineStart(12117)]
    procedure ShowReservation();
    begin
        FIND;
        Rec.ShowReservation;
    end;

    [LineStart(12121)]
    procedure ItemAvailability(AvailabilityType : Option Date,Variant,Location,Bin);
    begin
        //Rec.ItemAvailability(AvailabilityType);//B2b1.0
    end;

    [LineStart(12124)]
    procedure ShowReservationEntries();
    begin
        Rec.ShowReservationEntries(TRUE);
    end;

    [LineStart(12127)]
    procedure ShowDimensions();
    begin
        Rec.ShowDimensions;
    end;

    [LineStart(12130)]
    procedure ShowItemSub();
    begin
        Rec.ShowItemSub;
    end;

    [LineStart(12133)]
    procedure ShowNonstockItems();
    begin
        Rec.ShowNonstock;
    end;

    [LineStart(12136)]
    procedure OpenItemTrackingLines();
    begin
        Rec.OpenItemTrackingLines;
    end;

    [LineStart(12139)]
    procedure ShowTracking();
    var
        TrackingForm : Page "Order Tracking";
    begin
        TrackingForm.SetSalesLine(Rec);
        TrackingForm.RUNMODAL;
    end;

    [LineStart(12143)]
    procedure ItemChargeAssgnt();
    begin
        Rec.ShowItemChargeAssgnt;
    end;

    [LineStart(12146)]
    procedure UpdateForm(SetSaveRecord : Boolean);
    begin
        CurrPage.UPDATE(SetSaveRecord);
    end;

    [LineStart(12149)]
    procedure ShowPrices();
    begin
        SalesHeader.GET("Document Type","Document No.");
        SalesPriceCalcMgt.GetSalesLinePrice(SalesHeader,Rec);
    end;

    [LineStart(12153)]
    procedure ShowLineDisc();
    begin
        SalesHeader.GET("Document Type","Document No.");
        SalesPriceCalcMgt.GetSalesLineLineDisc(SalesHeader,Rec);
    end;

    [LineStart(12157)]
    procedure "---NAVIN---"();
    begin
    end;

    [LineStart(12160)]
    procedure ShowStrDetailsForm();
    var
        StrOrderLineDetails : Record "Structure Order Line Details";
        StrOrderLineDetailsForm : Page "Structure Order Line Details";
    begin
        StrOrderLineDetails.RESET;
        StrOrderLineDetails.SETRANGE(Type,StrOrderLineDetails.Type::Sale);
        StrOrderLineDetails.SETRANGE("Document Type","Document Type");
        StrOrderLineDetails.SETRANGE("Document No.","Document No.");
        StrOrderLineDetails.SETRANGE("Item No.","No.");
        StrOrderLineDetails.SETRANGE("Line No.","Line No.");
        StrOrderLineDetailsForm.SETTABLEVIEW(StrOrderLineDetails);
        StrOrderLineDetailsForm.RUNMODAL;
    end;

    [LineStart(12170)]
    procedure "---B2B--"();
    begin
    end;

    [LineStart(12173)]
    procedure CustAttachments();
    var
        CustAttach : Record Attachments;
    begin
        CustAttach.RESET;
        CustAttach.SETRANGE("Table ID",DATABASE::"Sales Header");
        CustAttach.SETRANGE("Document No.",Rec."Document No.");
        CustAttach.SETRANGE("Document Type","Document Type");

        PAGE.RUN(PAGE::"ESPL Attachments",CustAttach);
    end;

    [LineStart(12181)]
    procedure Presite();
    var
        PreSiteCheckList : Record "Inst. PreSite Check List";
    begin
        PreSiteCheckList.RESET;
        PreSiteCheckList.SETRANGE("Sales Order No.","Document No.");
        PreSiteCheckList.SETRANGE("Sales Order Line No.","Line No.");
        PAGE.RUN(PAGE::"Inst. PreSite Check List",PreSiteCheckList);
    end;

    [LineStart(12187)]
    procedure ShowPackingDetails();
    var
        PackingDetails : Record "Shortage Management Audit Data";
    begin
        PackingDetails.SETRANGE(Week,PackingDetails.Week :: "0");
        PackingDetails.SETRANGE("Sale Order","Document No.");
        //PackingDetails.SETRANGE(Customer,"Line No.");
        PAGE.RUNMODAL(PAGE :: "Shortage Mng Audit Data",PackingDetails);
    end;

    [LineStart(12193)]
    procedure SalesLineAttachments();
    var
        CustAttach : Record Attachments;
    begin
        CustAttach.RESET;
        CustAttach.SETRANGE("Table ID",DATABASE::"Sales Header");
        CustAttach.SETRANGE("Document No.",Rec."Document No.");
        CustAttach.SETRANGE("Document Type","Document Type"::Order);
        CustAttach.SETRANGE("Document Line No.","Line No.");

        PAGE.RUN(PAGE::"ESPL Attachments",CustAttach);
    end;

    [LineStart(12202)]
    procedure ShowSalesOrderWorkSheet();
    var
        DesignWorksheetHeader : Record "Design Worksheet Header";
        DesignWorksheetLine : Record "Design Worksheet Line";
        Item : Record Item;
        ItemDesignWorksheetHeader : Record "Item Design Worksheet Header";
        ItemDesignWorksheetLine : Record "Item Design Worksheet Line";
    begin
        /*
        TESTFIELD("Document Type");
        TESTFIELD("Document No.");
        TESTFIELD("Line No.");
        
        CLEAR(DesignWorksheetHeader);
        DesignWorksheetHeader.SETRANGE("Document Type",DesignWorksheetHeader."Document Type"::Order);
        DesignWorksheetHeader.SETRANGE("Document No.","Document No.");
        DesignWorksheetHeader.SETRANGE("Document Line No.","Line No.");
        DesignWorksheetHeader.FILTERGROUP(2);
        IF DesignWorksheetHeader.FINDFIRST THEN
          Page.RUNMODAL(60122,DesignWorksheetHeader);
        DesignWorksheetHeader.FILTERGROUP(0);
        */
        TESTFIELD("Document Type");
        TESTFIELD("Document No.");
        TESTFIELD("Line No.");
        ItemDesignWorksheetHeader.RESET;
        IF ItemDesignWorksheetHeader.GET("No.") THEN BEGIN
          DesignWorksheetHeader.INIT;
          DesignWorksheetHeader.TRANSFERFIELDS(ItemDesignWorksheetHeader);
          DesignWorksheetHeader."Document No.":="Document No.";
          DesignWorksheetHeader."Document Line No.":="Line No.";
          DesignWorksheetHeader."Document Type":=DesignWorksheetHeader."Document Type"::Order;
          IF DesignWorksheetHeader.INSERT THEN;
          ItemDesignWorksheetLine.RESET;
          ItemDesignWorksheetLine.SETRANGE(ItemDesignWorksheetLine."Item No",ItemDesignWorksheetHeader."Item No.");
          IF ItemDesignWorksheetLine.FINDSET THEN
            REPEAT
              DesignWorksheetLine.INIT;
              DesignWorksheetLine.TRANSFERFIELDS(ItemDesignWorksheetLine);
              DesignWorksheetLine."Document No.":="Document No.";
              DesignWorksheetLine."Document Line No.":="Line No.";
              DesignWorksheetLine."Document Type":=DesignWorksheetLine."Document Type"::Order;
              IF DesignWorksheetLine.INSERT THEN;
            UNTIL ItemDesignWorksheetLine.NEXT=0;
        END;
        COMMIT;
        
        CLEAR(DesignWorksheetHeader);
        DesignWorksheetHeader.SETRANGE("Document Type",DesignWorksheetHeader."Document Type"::Order);
        DesignWorksheetHeader.SETRANGE("Document No.","Document No.");
        DesignWorksheetHeader.SETRANGE("Document Line No.","Line No.");
        DesignWorksheetHeader.FILTERGROUP(2);
        IF DesignWorksheetHeader.FINDFIRST THEN
          PAGE.RUNMODAL(60122,DesignWorksheetHeader);
        DesignWorksheetHeader.FILTERGROUP(0);

    end;

    [LineStart(12251)]
    procedure ShowDeliveryChallan();
    var
        DeliveryChallan : Record "DC Header";
    begin
        DeliveryChallan.SETRANGE(Status,DeliveryChallan.Status :: Open);
        DeliveryChallan.SETRANGE("Sales Order No.","Document No.");
        //DeliveryChallan.SETRANGE("Document Line No.","Line No.");
        PAGE.RUNMODAL(PAGE :: "DC Header",DeliveryChallan);
    end;

    [LineStart(12257)]
    procedure ShowSchedule2();
    var
        Schedule : Record Schedule2;
    begin
        IF ("Tender No." = '')  AND ("Tender Line No." =0) THEN BEGIN
          Schedule.RESET;
          Schedule.SETRANGE("Document Type",Schedule."Document Type" :: Order);
          Schedule.SETRANGE("Document No.","Document No.");
          Schedule.SETRANGE("Document Line No.","Line No.");
          //Schedule.SETRANGE("Item No.","No.");
          //Schedule.SETRANGE(Quantity,Quantity);
          Schedule.FILTERGROUP(2);
          PAGE.RUN(60125,Schedule);
          Schedule.FILTERGROUP(0);
        END ELSE BEGIN
          Schedule.RESET;
          Schedule.SETRANGE("Document Type",Schedule."Document Type" :: Tender);
          Schedule.SETRANGE("Document No.","Tender No.");
          Schedule.SETRANGE("Document Line No.","Tender Line No.");
          //Schedule.SETRANGE("Item No.","No.");
          //Schedule.SETRANGE(Quantity,Quantity);
          Schedule.FILTERGROUP(2);
          PAGE.RUN(60127,Schedule);
          Schedule.FILTERGROUP(0);
        END;
    end;

    [LineStart(12280)]
    procedure ShowPODetails();
    var
        SOPodetails : Record "SO Prod.Order Details";
    begin
        SOPodetails.SETRANGE("Sales Order No.","Document No.");
        SOPodetails.SETRANGE("Sales Order Line No.","Line No.");
        PAGE.RUNMODAL(60126,SOPodetails);
    end;

    [LineStart(12285)]
    procedure MakeLines(var SalesLineparam : Record "Sales Line") : Decimal;
    var
        SalesLine : Record "Sales Line";
        ProdOrderLine : Record "Prod. Order Line";
        PurchLine : Record "Purchase Line";
        ReqLine : Record "Requisition Line";
        ReservEntry2 : Record "Reservation Entry";
    begin
        SalesPlanLine.DELETEALL;
        ValidateProdOrder;
        SalesLine.SETRANGE("Document Type",SalesLine."Document Type"::Order);
        SalesLine.SETRANGE("Document No.","Document No.");
        //NSS 301207
        SalesLine.SETRANGE("Line No.","Line No.");
        //NSS
        SalesLine.SETRANGE(Type,SalesLine.Type::Item);
        
        IF SalesLine.FINDFIRST THEN BEGIN
          //REPEAT
            SalesLine.TESTFIELD("Prod. Qty");
            SalesLine.TESTFIELD("Prod. Due Date");
            SalesPlanLine.INIT;
            SalesPlanLine."Sales Order No." := SalesLine."Document No.";
            SalesPlanLine."Sales Order Line No." := SalesLine."Line No.";
            SalesPlanLine."Item No." := SalesLine."No.";
        
            SalesPlanLine."Variant Code" := SalesLine."Variant Code";
            SalesPlanLine.Description := SalesLine.Description;
            SalesPlanLine."Shipment Date" := SalesLine."Shipment Date";
            SalesPlanLine."Planning Status" := SalesPlanLine."Planning Status"::Released;
            SalesLine.CALCFIELDS("Reserved Qty. (Base)");
            SalesPlanLine."Planned Quantity" := SalesLine."Reserved Qty. (Base)";
            /*ReservEngineMgt.InitFilterAndSortingLookupFor(ReservEntry,FALSE);
            ReserveSalesline.FilterReservFor(ReservEntry,SalesLine);
            ReservEntry.SETRANGE("Reservation Status",ReservEntry."Reservation Status"::Reservation);
            IF ReservEntry.FINDSET THEN
              REPEAT
                IF ReservEntry2.GET(ReservEntry."Entry No.",NOT ReservEntry.Positive) THEN
                  CASE ReservEntry2."Source Type" OF
                    DATABASE::"Item Ledger Entry":
                      BEGIN
                        SalesPlanLine."Planning Status" := SalesPlanLine."Planning Status"::Inventory;
                      END;
                    DATABASE::"Requisition Line":
                      BEGIN
                        ReqLine.GET(
                          ReservEntry2."Source ID",
                          ReservEntry2."Source Batch Name",
                          ReservEntry2."Source Ref. No.");
                        SalesPlanLine."Planning Status" := SalesPlanLine."Planning Status"::Planned;
                        SalesPlanLine."Expected Delivery Date" := ReqLine."Due Date";
                      END;
                    DATABASE::"Purchase Line":
                      BEGIN
                        PurchLine.GET(
                          ReservEntry2."Source Subtype",
                          ReservEntry2."Source ID",
                          ReservEntry2."Source Ref. No.");
                        SalesPlanLine."Planning Status" := SalesPlanLine."Planning Status"::"Firm Planned";
                        SalesPlanLine."Expected Delivery Date" := PurchLine."Expected Receipt Date";
                      END;
                    DATABASE::"Prod. Order Line":
                      BEGIN
                        ProdOrderLine.GET(
                          ReservEntry2."Source Subtype",
                          ReservEntry2."Source ID",
                          ReservEntry2."Source Prod. Order Line");
                        IF ProdOrderLine."Ending Date" > SalesPlanLine."Expected Delivery Date" THEN
                          SalesPlanLine."Expected Delivery Date" := ProdOrderLine."Ending Date";
                        IF ((ProdOrderLine.Status + 1) < SalesPlanLine."Planning Status") OR
                           (SalesPlanLine."Planning Status" = SalesPlanLine."Planning Status"::None)
                        THEN
                          SalesPlanLine."Planning Status" := ProdOrderLine.Status + 1;
                      END;
                  END;
              UNTIL ReservEntry.NEXT = 0;*/
            SalesPlanLine."Needs Replanning" :=
              (SalesPlanLine."Planned Quantity" <> SalesLine."Outstanding Qty. (Base)") OR
              (SalesPlanLine."Expected Delivery Date" > SalesPlanLine."Shipment Date");
            /*CalculateDisposalPlan(
              SalesLine."Variant Code",
              SalesLine."Location Code",SalesLine."Bin Code");*/
            SalesPlanLine.INSERT;
            EXIT(SalesLine."Prod. Qty");
          //UNTIL SalesLine.NEXT = 0;
        END;

    end;

    [LineStart(12365)]
    procedure ValidateProdOrder();
    begin
        CALCFIELDS("Prod. Order Quantity");
        IF "Prod. Order Quantity" > Quantity  THEN
          ERROR(Text001);
    end;

    [LineStart(12370)]
    procedure ShowSchedule();
    var
        Schedule : Record Schedule2;
        SalesLine : Record "Sales Line";
    begin
        IF Type=Type::Item THEN BEGIN
        IF (("Tender No." <> '')  AND ("Tender Line No." <>0)) THEN BEGIN
          Schedule.RESET;
          Schedule.SETRANGE("Document Type",Schedule."Document Type" :: Order);
          Schedule.SETRANGE("Document No.","Document No.");
          Schedule.SETRANGE("Document Line No.","Line No.");
          //Schedule.SETRANGE("Item No.","No.");
          //Schedule.SETRANGE(Quantity,Quantity);
          Schedule.FILTERGROUP(2);
          IF Schedule.FINDFIRST THEN BEGIN
           PAGE.RUN(60125,Schedule);
           Schedule.FILTERGROUP(0);
          END ELSE BEGIN
            SalesLine.RESET;
            SalesLine.SETRANGE("Document No.","Document No.");
            SalesLine.SETRANGE("Line No.","Line No.");
            IF SalesLine.FINDSET THEN
              REPEAT
                Schedule.INIT;
                Schedule."Document Type":=Schedule."Document Type"::Order;
                Schedule."Document No.":=SalesLine."Document No.";
                Schedule."Document Line No.":=SalesLine."Line No.";
                Schedule."Line No.":=SalesLine."Line No.";
                Schedule.Type:=Schedule.Type::Item;
                Schedule.VALIDATE("No.",SalesLine."No.");
                Schedule.Quantity := SalesLine.Quantity;
                //salesLine.CALCFIELDS("Estimated Unit Cost");
                IF Schedule.INSERT THEN;
              UNTIL SalesLine.NEXT=0;
          COMMIT;
          Schedule.RESET;
          Schedule.SETRANGE("Document Type",Schedule."Document Type" :: Order);
          Schedule.SETRANGE("Document No.","Document No.");
          Schedule.SETRANGE("Document Line No.","Line No.");
          Schedule.FILTERGROUP(2);
          PAGE.RUN(60125,Schedule);
          Schedule.FILTERGROUP(0);
          END
        END ELSE IF  (("Blanket Order No."<>'') AND ("Blanket Order Line No."<>0)) THEN BEGIN
          Schedule.RESET;
          Schedule.SETRANGE("Document Type",Schedule."Document Type" :: Order);
          Schedule.SETRANGE("Document No.","Document No.");
          Schedule.SETRANGE("Document Line No.","Line No.");
          Schedule.FILTERGROUP(2);
          PAGE.RUN(60125,Schedule);
          Schedule.FILTERGROUP(0);
        END ELSE BEGIN
          SalesLine.RESET;
          SalesLine.SETRANGE("Document No.","Document No.");
          SalesLine.SETRANGE("Line No.","Line No.");
          IF SalesLine.FINDSET THEN
            REPEAT
              Schedule.INIT;
              Schedule."Document Type":=Schedule."Document Type"::Order;
              Schedule."Document No.":=SalesLine."Document No.";
              Schedule."Document Line No.":=SalesLine."Line No.";
              Schedule."Line No.":=SalesLine."Line No.";
              Schedule.Type:=Schedule.Type::Item;
              Schedule.VALIDATE("No.",SalesLine."No.");
              Schedule.Quantity := SalesLine.Quantity;
              Schedule."Estimated Total Unit Price":=Schedule."Estimated Unit Price"*Quantity;
              //salesLine.CALCFIELDS("Estimated Unit Cost");
              IF Schedule.INSERT THEN;
            UNTIL SalesLine.NEXT=0;
          COMMIT;
          Schedule.RESET;
          Schedule.SETRANGE("Document Type",Schedule."Document Type" :: Order);
          Schedule.SETRANGE("Document No.","Document No.");
          Schedule.SETRANGE("Document Line No.","Line No.");
          Schedule.FILTERGROUP(2);
          PAGE.RUN(60125,Schedule);
          Schedule.FILTERGROUP(0);
        END
        END ELSE IF Type=Type::"G/L Account" THEN BEGIN
          Schedule.RESET;
          Schedule.SETRANGE("Document Type",Schedule."Document Type" :: Order);
          Schedule.SETRANGE("Document No.","Document No.");
          Schedule.SETRANGE("Document Line No.","Line No.");
          Schedule.FILTERGROUP(2);
          PAGE.RUN(60125,Schedule);
          Schedule.FILTERGROUP(0);
        END;
    end;

    [LineStart(12454)]
    local procedure NoOnAfterValidate();
    begin
        InsertExtendedText(FALSE);
        IF (Type = Type::"Charge (Item)") AND ("No." <> xRec."No.") AND
           (xRec."No." <> '')
        THEN
          CurrPage.SAVERECORD;
    end;

    [LineStart(12461)]
    local procedure QuantityOnAfterValidate();
    begin
        IF Reserve = Reserve::Always THEN BEGIN
          CurrPage.SAVERECORD;
          AutoReserve;
          CurrPage.UPDATE(FALSE);
        END;
    end;
}

