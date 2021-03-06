page 90004 "Sales Authorisation Sub Form"
{
    // version NAVW13.70,NAVIN3.70.00.13,B2B1.0,DWS1.0,SH1.0

    AutoSplitKey = true;
    Caption = 'Sales Order Subform';
    DelayedInsert = true;
    Editable = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Sales Line";
    SourceTableView = WHERE(Document Type=FILTER(Order));

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
                field("No.";"No.")
                {

                    trigger OnValidate();
                    begin
                        ShowShortcutDimCode(ShortcutDimCode);
                          NoOnAfterValidate;
                    end;
                }
                field(Description;Description)
                {
                    Editable = true;
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
                    Visible = false;
                }
                field("Tax Amount";"Tax Amount")
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                group("Item Availability by")
                {
                    Caption = 'Item Availability by';
                    action(Period)
                    {
                        Caption = 'Period';

                        trigger OnAction();
                        begin
                            //This functionality was copied from page #90003. Unsupported part was commented. Please check it.
                            /*CurrPage.SalesLines.Page.*/
                            _ItemAvailability(0);

                        end;
                    }
                    action(Variant)
                    {
                        Caption = 'Variant';

                        trigger OnAction();
                        begin
                            //This functionality was copied from page #90003. Unsupported part was commented. Please check it.
                            /*CurrPage.SalesLines.Page.*/
                            _ItemAvailability(1);

                        end;
                    }
                    action(Location)
                    {
                        Caption = 'Location';

                        trigger OnAction();
                        begin
                            //This functionality was copied from page #90003. Unsupported part was commented. Please check it.
                            /*CurrPage.SalesLines.Page.*/
                            _ItemAvailability(2);

                        end;
                    }
                }
                action("Reservation Entries")
                {
                    Caption = 'Reservation Entries';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #90003. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        _ShowReservationEntries;

                    end;
                }
                action("Item &Tracking Lines")
                {
                    Caption = 'Item &Tracking Lines';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #90003. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        _OpenItemTrackingLines;

                    end;
                }
                action("Select Item Substitution")
                {
                    Caption = 'Select Item Substitution';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #90003. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        _ShowItemSub;

                    end;
                }
                action("Packing Details")
                {
                    Caption = 'Packing Details';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #90003. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        ShowPackingDetails;

                    end;
                }
                action("Delivery &Challan")
                {
                    Caption = 'Delivery &Challan';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #90003. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        ShowDeliveryChallan;

                    end;
                }
                action("&Line Attachments")
                {
                    Caption = '&Line Attachments';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #90003. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        SalesLineAttachments;

                    end;
                }
                action(Dimensions)
                {
                    Caption = 'Dimensions';
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #90003. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        _ShowDimensions;

                    end;
                }
                action("Item Charge &Assignment")
                {
                    Caption = 'Item Charge &Assignment';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #90003. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        ItemChargeAssgnt;

                    end;
                }
                action("Structure Details")
                {
                    Caption = 'Structure Details';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #90003. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        ShowStrDetailsForm;  // NAVIN

                    end;
                }
                action("Design Worksheet")
                {
                    Caption = 'Design Worksheet';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #90003. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        ShowSalesOrderWorkSheet;

                    end;
                }
                action("Sc&hedule")
                {
                    Caption = 'Sc&hedule';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #90003. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        ShowSchedule;

                    end;
                }
                action("Prod. Order Details")
                {
                    Caption = 'Prod. Order Details';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #90003. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        ShowPODetails;

                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("Calculate &Invoice Discount")
                {
                    Caption = 'Calculate &Invoice Discount';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #90003. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        ApproveCalcInvDisc;

                    end;
                }
                action("Get Price")
                {
                    Caption = 'Get Price';
                    Ellipsis = true;

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #90003. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        ShowPrices

                    end;
                }
                action("Get Li&ne Discount")
                {
                    Caption = 'Get Li&ne Discount';
                    Ellipsis = true;

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #90003. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        ShowLineDisc

                    end;
                }
                action("E&xplode BOM")
                {
                    Caption = 'E&xplode BOM';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #90003. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        ExplodeBOM;

                    end;
                }
                action("Insert &Ext. Texts")
                {
                    Caption = 'Insert &Ext. Texts';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #90003. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        _InsertExtendedText(TRUE);

                    end;
                }
                action("&Reserve")
                {
                    Caption = '&Reserve';
                    Ellipsis = true;

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #90003. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        _ShowReservation;

                    end;
                }
                action("Order &Tracking")
                {
                    Caption = 'Order &Tracking';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #90003. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        ShowTracking;

                    end;
                }
                action("&Attachments")
                {
                    Caption = '&Attachments';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #90003. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        CustAttachments;

                    end;
                }
                action("Pre Site Visit")
                {
                    Caption = 'Pre Site Visit';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #90003. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        _Presite;

                    end;
                }
            }
            group("O&rder")
            {
                Caption = 'O&rder';
                group("Dr&op Shipment")
                {
                    Caption = 'Dr&op Shipment';
                    action("Purchase &Order")
                    {
                        Caption = 'Purchase &Order';

                        trigger OnAction();
                        begin
                            //This functionality was copied from page #90003. Unsupported part was commented. Please check it.
                            /*CurrPage.SalesLines.Page.*/
                            OpenPurchOrderForm;

                        end;
                    }
                }
                group("Speci&al Order")
                {
                    Caption = 'Speci&al Order';
                    action(Action1903192904)
                    {
                        Caption = 'Purchase &Order';

                        trigger OnAction();
                        begin
                            //This functionality was copied from page #90003. Unsupported part was commented. Please check it.
                            /*CurrPage.SalesLines.Page.*/
                            OpenSpecialPurchOrderForm;

                        end;
                    }
                }
            }
        }
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

    (22250)]
    procedure ApproveCalcInvDisc();
    begin
        CODEUNIT.RUN(CODEUNIT::"Sales-Disc. (Yes/No)",Rec);
    end;

    (22253)]
    procedure CalcInvDisc();
    begin
        CODEUNIT.RUN(CODEUNIT::"Sales-Calc. Discount",Rec);
    end;

    (22256)]
    procedure ExplodeBOM();
    begin
        CODEUNIT.RUN(CODEUNIT::"Sales-Explode BOM",Rec);
    end;

    (22259)]
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

    (22265)]
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

    (22271)]
    procedure _InsertExtendedText(Unconditionally : Boolean);
    begin
        IF TransferExtendedText.SalesCheckIfAnyExtText(Rec,Unconditionally) THEN BEGIN
          CurrPage.SAVERECORD;
          TransferExtendedText.InsertSalesExtText(Rec);
        END;
        IF TransferExtendedText.MakeUpdate THEN
          UpdateForm(TRUE);
    end;

    (22279)]
    procedure InsertExtendedText(Unconditionally : Boolean);
    begin
        IF TransferExtendedText.SalesCheckIfAnyExtText(Rec,Unconditionally) THEN BEGIN
          CurrPage.SAVERECORD;
          TransferExtendedText.InsertSalesExtText(Rec);
        END;
        IF TransferExtendedText.MakeUpdate THEN
          UpdateForm(TRUE);
    end;

    (22287)]
    procedure _ShowReservation();
    begin
        FIND;
        Rec.ShowReservation;
    end;

    (22291)]
    procedure ShowReservation();
    begin
        FIND;
        Rec.ShowReservation;
    end;

    (22295)]
    procedure _ItemAvailability(AvailabilityType : Option Date,Variant,Location,Bin);
    begin
        //Rec.ItemAvailability(AvailabilityType); //B2b1.0
    end;

    (22298)]
    procedure ItemAvailability(AvailabilityType : Option Date,Variant,Location,Bin);
    begin
        //Rec.ItemAvailability(AvailabilityType);//B2b1.0
    end;

    (22301)]
    procedure _ShowReservationEntries();
    begin
        Rec.ShowReservationEntries(TRUE);
    end;

    (22304)]
    procedure ShowReservationEntries();
    begin
        Rec.ShowReservationEntries(TRUE);
    end;

    (22307)]
    procedure _ShowDimensions();
    begin
        Rec.ShowDimensions;
    end;

    (22310)]
    procedure ShowDimensions();
    begin
        Rec.ShowDimensions;
    end;

    (22313)]
    procedure _ShowItemSub();
    begin
        Rec.ShowItemSub;
    end;

    (22316)]
    procedure ShowItemSub();
    begin
        Rec.ShowItemSub;
    end;

    (22319)]
    procedure ShowNonstockItems();
    begin
        Rec.ShowNonstock;
    end;

    (22322)]
    procedure _OpenItemTrackingLines();
    begin
        Rec.OpenItemTrackingLines;
    end;

    (22325)]
    procedure OpenItemTrackingLines();
    begin
        Rec.OpenItemTrackingLines;
    end;

    (22328)]
    procedure ShowTracking();
    var
        TrackingForm : Page "Order Tracking";
    begin
        TrackingForm.SetSalesLine(Rec);
        TrackingForm.RUNMODAL;
    end;

    (22332)]
    procedure ItemChargeAssgnt();
    begin
        Rec.ShowItemChargeAssgnt;
    end;

    (22335)]
    procedure UpdateForm(SetSaveRecord : Boolean);
    begin
        CurrPage.UPDATE(SetSaveRecord);
    end;

    (22338)]
    procedure ShowPrices();
    begin
        SalesHeader.GET("Document Type","Document No.");
        SalesPriceCalcMgt.GetSalesLinePrice(SalesHeader,Rec);
    end;

    (22342)]
    procedure ShowLineDisc();
    begin
        SalesHeader.GET("Document Type","Document No.");
        SalesPriceCalcMgt.GetSalesLineLineDisc(SalesHeader,Rec);
    end;

    (22346)]
    procedure "---NAVIN---"();
    begin
    end;

    (22349)]
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

    (22359)]
    procedure "---B2B--"();
    begin
    end;

    (22362)]
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

    (22370)]
    procedure _Presite();
    var
        PreSiteCheckList : Record "Inst. PreSite Check List";
    begin
        PreSiteCheckList.RESET;
        PreSiteCheckList.SETRANGE("Sales Order No.","Document No.");
        PreSiteCheckList.SETRANGE("Sales Order Line No.","Line No.");
        PAGE.RUN(PAGE::"Inst. PreSite Check List",PreSiteCheckList);
    end;

    (22376)]
    procedure Presite();
    var
        PreSiteCheckList : Record "Inst. PreSite Check List";
    begin
        PreSiteCheckList.RESET;
        PreSiteCheckList.SETRANGE("Sales Order No.","Document No.");
        PreSiteCheckList.SETRANGE("Sales Order Line No.","Line No.");
        PAGE.RUN(PAGE::"Inst. PreSite Check List",PreSiteCheckList);
    end;

    (22382)]
    procedure ShowPackingDetails();
    var
        PackingDetails : Record "Shortage Management Audit Data";
    begin
        PackingDetails.SETRANGE(Week,PackingDetails.Week :: "0");
        PackingDetails.SETRANGE("Sale Order","Document No.");
        //PackingDetails.SETRANGE(Customer,"Line No.");
        PAGE.RUNMODAL(PAGE :: "Shortage Mng Audit Data",PackingDetails);
    end;

    (22388)]
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

    (22397)]
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

    (22446)]
    procedure ShowDeliveryChallan();
    var
        DeliveryChallan : Record "DC Header";
    begin
        DeliveryChallan.SETRANGE(Status,DeliveryChallan.Status :: Open);
        DeliveryChallan.SETRANGE("Sales Order No.","Document No.");
        //DeliveryChallan.SETRANGE("Document Line No.","Line No.");
        PAGE.RUNMODAL(PAGE :: "DC Header",DeliveryChallan);
    end;

    (22452)]
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

    (22475)]
    procedure ShowPODetails();
    var
        SOPodetails : Record "SO Prod.Order Details";
    begin
        SOPodetails.SETRANGE("Sales Order No.","Document No.");
        SOPodetails.SETRANGE("Sales Order Line No.","Line No.");
        PAGE.RUNMODAL(60126,SOPodetails);
    end;

    (22480)]
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

    (22560)]
    procedure ValidateProdOrder();
    begin
        CALCFIELDS("Prod. Order Quantity");
        IF "Prod. Order Quantity" > Quantity  THEN
          ERROR(Text001);
    end;

    (22565)]
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

    (22649)]
    local procedure NoOnAfterValidate();
    begin
        InsertExtendedText(FALSE);
        IF (Type = Type::"Charge (Item)") AND ("No." <> xRec."No.") AND
           (xRec."No." <> '')
        THEN
          CurrPage.SAVERECORD;
    end;

    (22656)]
    local procedure QuantityOnAfterValidate();
    begin
        IF Reserve = Reserve::Always THEN BEGIN
          CurrPage.SAVERECORD;
          AutoReserve;
          CurrPage.UPDATE(FALSE);
        END;
    end;
}

