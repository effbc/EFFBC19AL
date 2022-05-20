page 60019 "Sales Order Subform-Design"
{
    // version NAVW13.70,NAVIN3.70.00.13,B2B1.0,DWS1.0,SH1.0

    AutoSplitKey = true;
    Caption = 'Sales Order Subform';
    DelayedInsert = true;
    Editable = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Sales Line";
    SourceTableView = WHERE(Document Type=FILTER(Order|Blanket Order));

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
                }
                field("Schedule Type";"Schedule Type")
                {
                }
                field("Schedule No";"Schedule No")
                {
                }
                field("Location Code";"Location Code")
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
                field("Unit of Measure Code";"Unit of Measure Code")
                {

                    trigger OnValidate();
                    begin
                        UnitofMeasureCodeOnAfterValida;
                    end;
                }
                field("Unit of Measure";"Unit of Measure")
                {
                    Visible = false;
                }
                field("RDSO Unit Charges";"RDSO Unit Charges")
                {
                }
                field("RDSO Charges Paid By";"RDSO Charges Paid By")
                {
                }
                field("RDSO Inspection Required";"RDSO Inspection Required")
                {
                }
                field("RDSO Inspection By";"RDSO Inspection By")
                {
                }
                field("RDSO Charges";"RDSO Charges")
                {
                }
                field("Quantity Shipped";"Quantity Shipped")
                {
                    BlankZero = true;
                }
                field("Qty. to Invoice";"Qty. to Invoice")
                {
                    BlankZero = true;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("&Attachments")
                {
                    Caption = '&Attachments';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #60018. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        CustAttachments;

                    end;
                }
            }
            group("&Line")
            {
                Caption = '&Line';
                action("Design Worksheet")
                {
                    Caption = 'Design Worksheet';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #60018. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        ShowSalesOrderWorkSheet;

                    end;
                }
                action(Schedule)
                {
                    Caption = 'Schedule';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #60018. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        ShowSchedule;

                    end;
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

    [LineStart(4969)]
    procedure ApproveCalcInvDisc();
    begin
        CODEUNIT.RUN(CODEUNIT::"Sales-Disc. (Yes/No)",Rec);
    end;

    [LineStart(4972)]
    procedure CalcInvDisc();
    begin
        CODEUNIT.RUN(CODEUNIT::"Sales-Calc. Discount",Rec);
    end;

    [LineStart(4975)]
    procedure ExplodeBOM();
    begin
        CODEUNIT.RUN(CODEUNIT::"Sales-Explode BOM",Rec);
    end;

    [LineStart(4978)]
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

    [LineStart(4984)]
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

    [LineStart(4990)]
    procedure InsertExtendedText(Unconditionally : Boolean);
    begin
        IF TransferExtendedText.SalesCheckIfAnyExtText(Rec,Unconditionally) THEN BEGIN
          CurrPage.SAVERECORD;
          TransferExtendedText.InsertSalesExtText(Rec);
        END;
        IF TransferExtendedText.MakeUpdate THEN
          UpdateForm(TRUE);
    end;

    [LineStart(4998)]
    procedure ShowReservation();
    begin
        FIND;
        Rec.ShowReservation;
    end;

    [LineStart(5002)]
    procedure ItemAvailability(AvailabilityType : Option Date,Variant,Location,Bin);
    begin
        //Rec.ItemAvailability(AvailabilityType); //B2b1.0
    end;

    [LineStart(5005)]
    procedure ShowReservationEntries();
    begin
        Rec.ShowReservationEntries(TRUE);
    end;

    [LineStart(5008)]
    procedure ShowDimensions();
    begin
        Rec.ShowDimensions;
    end;

    [LineStart(5011)]
    procedure ShowItemSub();
    begin
        Rec.ShowItemSub;
    end;

    [LineStart(5014)]
    procedure ShowNonstockItems();
    begin
        Rec.ShowNonstock;
    end;

    [LineStart(5017)]
    procedure OpenItemTrackingLines();
    begin
        Rec.OpenItemTrackingLines;
    end;

    [LineStart(5020)]
    procedure ShowTracking();
    var
        TrackingForm : Page "Order Tracking";
    begin
        TrackingForm.SetSalesLine(Rec);
        TrackingForm.RUNMODAL;
    end;

    [LineStart(5024)]
    procedure ItemChargeAssgnt();
    begin
        Rec.ShowItemChargeAssgnt;
    end;

    [LineStart(5027)]
    procedure UpdateForm(SetSaveRecord : Boolean);
    begin
        CurrPage.UPDATE(SetSaveRecord);
    end;

    [LineStart(5030)]
    procedure ShowPrices();
    begin
        SalesHeader.GET("Document Type","Document No.");
        SalesPriceCalcMgt.GetSalesLinePrice(SalesHeader,Rec);
    end;

    [LineStart(5034)]
    procedure ShowLineDisc();
    begin
        SalesHeader.GET("Document Type","Document No.");
        SalesPriceCalcMgt.GetSalesLineLineDisc(SalesHeader,Rec);
    end;

    [LineStart(5038)]
    procedure "---NAVIN---"();
    begin
    end;

    [LineStart(5041)]
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

    [LineStart(5051)]
    procedure "---B2B--"();
    begin
    end;

    [LineStart(5054)]
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

    [LineStart(5062)]
    procedure Presite();
    var
        PreSiteCheckList : Record "Inst. PreSite Check List";
    begin
        PreSiteCheckList.RESET;
        PreSiteCheckList.SETRANGE("Sales Order No.","Document No.");
        PreSiteCheckList.SETRANGE("Sales Order Line No.","Line No.");
        PAGE.RUN(PAGE::"Inst. PreSite Check List",PreSiteCheckList);
    end;

    [LineStart(5068)]
    procedure ShowPackingDetails();
    var
        PackingDetails : Record "Shortage Management Audit Data";
    begin
        PackingDetails.SETRANGE(Week,PackingDetails.Week :: "0");
        PackingDetails.SETRANGE("Sale Order","Document No.");
        //PackingDetails.SETRANGE(Customer,"Line No.");
        PAGE.RUNMODAL(PAGE :: "Shortage Mng Audit Data",PackingDetails);
    end;

    [LineStart(5074)]
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

    [LineStart(5083)]
    procedure ShowSalesOrderWorkSheet();
    var
        DesignWorksheetHeader : Record "Design Worksheet Header";
        DesignWorksheetLine : Record "Design Worksheet Line";
        Item : Record Item;
        ItemDesignWorksheetHeader : Record "Item Design Worksheet Header";
        ItemDesignWorksheetLine : Record "Item Design Worksheet Line";
    begin
        /*TESTFIELD("Document Type");
        TESTFIELD("Document No.");
        TESTFIELD("Line No.");
        
        CLEAR(DesignWorksheetHeader);
        DesignWorksheetHeader.SETRANGE("Document Type",DesignWorksheetHeader."Document Type"::Order);
        DesignWorksheetHeader.SETRANGE("Document No.","Document No.");
        DesignWorksheetHeader.FILTERGROUP(2);
        DesignWorksheetHeader.SETRANGE("Document Line No.","Line No.");
        Page.RUNMODAL(Page::"Design Worksheet",DesignWorksheetHeader);
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
        DesignWorksheetHeader.FILTERGROUP(2);
        DesignWorksheetHeader.SETRANGE("Document Line No.","Line No.");
        PAGE.RUNMODAL(PAGE::"Design Worksheet",DesignWorksheetHeader);
        DesignWorksheetHeader.FILTERGROUP(0);

    end;

    [LineStart(5129)]
    procedure ShowDeliveryChallan();
    var
        DeliveryChallan : Record "DC Header";
    begin
        DeliveryChallan.SETRANGE(Status,DeliveryChallan.Status :: Open);
        DeliveryChallan.SETRANGE("Sales Order No.","Document No.");
        //DeliveryChallan.SETRANGE("Document Line No.","Line No.");
        PAGE.RUNMODAL(PAGE :: "DC Header",DeliveryChallan);
    end;

    [LineStart(5135)]
    procedure ShowSchedule2();
    var
        Schedule : Record Schedule2;
    begin
        Schedule.SETRANGE("Document Type",Schedule."Document Type" :: Order);
        Schedule.SETRANGE("Document No.","Document No.");
        Schedule.SETRANGE("Document Line No.","Line No.");
        PAGE.RUNMODAL(60125,Schedule);
    end;

    [LineStart(5141)]
    procedure ShowPODetails();
    var
        SOPodetails : Record "SO Prod.Order Details";
    begin
        SOPodetails.SETRANGE("Sales Order No.","Document No.");
        SOPodetails.SETRANGE("Sales Order Line No.","Line No.");
        PAGE.RUNMODAL(60126,SOPodetails);
    end;

    [LineStart(5146)]
    procedure ShowSchedule();
    var
        Schedule : Record Schedule2;
    begin
        //Schedule.SETRANGE("Document Type",Schedule."Document Type" :: Order);
        Schedule.SETRANGE("Document No.","Document No.");
        Schedule.SETRANGE("Document Line No.","Line No.");
        PAGE.RUNMODAL(60129,Schedule);
    end;

    [LineStart(5152)]
    local procedure NoOnAfterValidate();
    begin
        InsertExtendedText(FALSE);
        IF (Type = Type::"Charge (Item)") AND ("No." <> xRec."No.") AND
           (xRec."No." <> '')
        THEN
          CurrPage.SAVERECORD;
    end;

    [LineStart(5159)]
    local procedure QuantityOnAfterValidate();
    begin
        IF Reserve = Reserve::Always THEN BEGIN
          CurrPage.SAVERECORD;
          AutoReserve;
          CurrPage.UPDATE(FALSE);
        END;
    end;

    [LineStart(5166)]
    local procedure UnitofMeasureCodeOnAfterValida();
    begin
        IF Reserve = Reserve::Always THEN BEGIN
          CurrPage.SAVERECORD;
          AutoReserve;
          CurrPage.UPDATE(FALSE);
        END;
    end;
}

