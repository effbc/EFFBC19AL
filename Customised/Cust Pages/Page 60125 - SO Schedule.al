page 60125 "SO Schedule"
{
    // version Rev01

    // No. sign   Description
    // ---------------------------------------------------
    // 1.3 UPG    BOM Replacement process changes Function UpdateItemNo and
    //            action Update New Item added.

    AutoSplitKey = true;
    DelayedInsert = true;
    PageType = Worksheet;
    SourceTable = Schedule2;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Document No.";"Document No.")
                {
                }
                field("Line No.";"Line No.")
                {
                }
                field("Document Line No.";"Document Line No.")
                {
                }
                field("Design Conclusions1";"Design Conclusions1")
                {
                }
                field("Design Conclusion2";"Design Conclusion2")
                {
                }
                field("M/S Item";"M/S Item")
                {
                }
                field(Type;Type)
                {

                    trigger OnValidate();
                    begin
                        TestDocStatus;
                    end;
                }
                field("No.";"No.")
                {

                    trigger OnValidate();
                    begin
                        TestDocStatus;
                    end;
                }
                field(Description;Description)
                {
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                }
                field(Quantity;Quantity)
                {
                    Editable = true;

                    trigger OnValidate();
                    begin
                        TestDocStatus;
                    end;
                }
                field("Quantity(Base)";"Quantity(Base)")
                {
                    Editable = false;
                }
                field("Prod. Order Quantity";"Prod. Order Quantity")
                {
                    Editable = false;
                }
                field("Prod. Due Date";"Prod. Due Date")
                {
                }
                field("Prod. Qty";"Prod. Qty")
                {
                }
                field("Location Code";"Location Code")
                {

                    trigger OnValidate();
                    begin
                        TestDocStatus;
                    end;
                }
                field("Qty. Per";"Qty. Per")
                {
                    Caption = 'Qty. Per Unit';

                    trigger OnValidate();
                    begin
                        // Pranavi
                        SL.RESET;
                        SL.SETRANGE(SL."Document No.","Document No.");
                        SL.SETRANGE(SL."Line No.","Document Line No.");
                        IF SL.FINDFIRST THEN
                        BEGIN
                          Quantity := ROUND("Qty. Per"* SL.Quantity,1,'>');
                          VALIDATE(Quantity);
                        END;
                        // Pranavi
                    end;
                }
                field("Qty. to Ship";"Qty. to Ship")
                {
                }
                field("Qty. to ship (Base)";"Qty. to ship (Base)")
                {
                    Editable = false;
                }
                field("Qty. Shipped";"Qty. Shipped")
                {
                    Editable = false;
                }
                field("Qty.Shipped (Base)";"Qty.Shipped (Base)")
                {
                    Editable = false;
                }
                field("Outstanding Qty.";"Outstanding Qty.")
                {
                    Editable = false;
                }
                field("Outstanding Qty.(Base)";"Outstanding Qty.(Base)")
                {
                    Editable = false;
                }
                field("Unit Cost";"Unit Cost")
                {
                }
                field(Amount;Amount)
                {
                    Editable = false;
                }
                field("Serial No.";"Serial No.")
                {
                }
                field("Lot No.";"Lot No.")
                {
                }
                field("To be Shipped Qty";"To be Shipped Qty")
                {
                }
                field("Material Required Date";"Material Required Date")
                {

                    trigger OnValidate();
                    begin
                         /*
                         Schedule.RESET;
                         Schedule.SETFILTER(Schedule."Document No.","Document No.");
                         Schedule.SETFILTER(Schedule."No.",'<>%1',' ');
                         //MESSAGE(FORMAT(Schedule.COUNT));
                         IF Schedule.FINDSET THEN BEGIN
                         REPEAT
                         Schedule."Material Required Date":="Material Required Date";
                         Schedule.MODIFY;
                         UNTIL Schedule.NEXT=0;
                         END;
                         *///Commented by Pranavi on 20-Jan-2016

                    end;
                }
                field("Plan Shifting Date";"Plan Shifting Date")
                {
                }
                field("Change To Specified Plan Date";"Change To Specified Plan Date")
                {

                    trigger OnValidate();
                    begin
                        ChangeToSpecifiedPlanDatOnPush;
                    end;
                }
                field("Estimated Total Unit Cost";"Estimated Total Unit Cost")
                {
                }
                field("Estimated Unit Price";"Estimated Unit Price")
                {
                }
                field("Estimated Total Unit Price";"Estimated Total Unit Price")
                {
                }
                field(Percentage;Percentage)
                {
                }
                field("Calcaulated Amont";"Calcaulated Amont")
                {
                }
                field("RDSO Required";"RDSO Required")
                {
                }
                field("Purchase Expected Receipt Date";"Purchase Expected Receipt Date")
                {
                }
                field(Date;Date)
                {
                }
                field(Priority;Priority)
                {
                }
                field(Remarks;Remarks)
                {
                }
                field("Tender Schedule";"Tender Schedule")
                {
                }
                field("Sales Description";"Sales Description")
                {
                }
                field(Dispatched;Dispatched)
                {
                }
                field(SetSelection;SetSelection)
                {
                }
                field("RPO Completion Date";"RPO Completion Date")
                {
                }
                field("Packet No";"Packet No")
                {
                }
                field("Insp. Letter Sent";"Insp. Letter Sent")
                {
                }
                field("Posting Group";"Posting Group")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Line")
            {
                Caption = '&Line';
                Visible = true;
                action("Change the Plan")
                {
                    Caption = 'Change the Plan';
                    Image = Replan;

                    trigger OnAction();
                    begin
                        "G/L".GET;

                        Schedule.RESET;
                        Schedule.SETCURRENTKEY(Schedule."Material Required Date",Schedule."No.");
                        Schedule.SETFILTER(Schedule."Material Required Date",'>%1',"G/L"."Shortage. Calc. Date");
                        Schedule.SETRANGE(Schedule."Change To Specified Plan Date",TRUE);
                        IF Schedule.FINDSET THEN
                        REPEAT
                          Plan_Change."Schedule_Plan Change"(Schedule."Document No.",Schedule."Document Line No.",Schedule."Line No.");
                        UNTIL Schedule.NEXT=0;

                        RESET;
                        SETCURRENTKEY("Material Required Date","No.");
                        SETFILTER("Material Required Date",'>%1',"G/L"."Shortage. Calc. Date");
                        SETFILTER("Plan Shifting Date",'>%1',0D);
                    end;
                }
                action("Item Tracking Line")
                {
                    Image = ItemTrackingLines;

                    trigger OnAction();
                    var
                        ScheduleTracking : Record "Schedule Tracking Specificatio";
                        ItemTracking : Page "Item Tracking Summary";
                    begin
                        TESTFIELD(Type,Type::Item);
                        TESTFIELD("No.");
                        TESTFIELD(Quantity);
                        OpenItemTrackingLines;
                        //InitTrackingSpecification(ScheduleTracking);//B2BSP
                    end;
                }
                action(CreateProdOrder)
                {
                    Caption = 'Create Prod Order';

                    trigger OnAction();
                    var
                        NewStatus2 : Option Simulated,Planned,"Firm Planned",Released;
                        NewOrderType2 : Option ItemOrder,ProjectOrder;
                        SalesLine : Record "Sales Line";
                        ProdMakeQty : Integer;
                        ProductionOrder : Record "Production Order";
                        ItemUnitofMeasure : Record "Item Unit of Measure";
                    begin
                        /*
                        IF NOT (USERID IN ['EFFTRONICS\PRANAVI','EFFTRONICS\ANILKUMAR']) THEN
                          ERROR('You Do Not Have Rights!');
                        */
                        ProductionOrder.RESET;
                        ProductionOrder.SETRANGE(Status,ProductionOrder.Status::Released);
                        ProductionOrder.SETRANGE("Sales Order No.","Document No.");
                        ProductionOrder.SETFILTER("Schedule Line No.",'<>%1',0);
                        IF ProductionOrder.FINDFIRST THEN
                          ERROR('RPO has been created for this order');
                        
                        IF "Document Line No." <> "Line No." THEN
                        BEGIN
                          SalesLine.RESET;
                          SalesLine.SETRANGE(SalesLine."Document No.","Document No.");
                          SalesLine.SETRANGE(SalesLine."Line No.","Document Line No.");
                          IF SalesLine.FINDFIRST THEN
                            IF FORMAT(SalesLine."Pending By") <> ' ' THEN             //Added By Pranavi on 23-09-2015 to restrict create RPO if item is Pending by
                              ERROR('You Can not Create Production order for Item: '+"No."+'\ As it Pending By '+FORMAT(SalesLine."Pending By"));
                        
                        END
                        ELSE ERROR('Can Not Create Prod. Order for Default Line!');
                        SalesPlanLine.DELETEALL;
                        ProdMakeQty := MakeLines(ScheduleLineRec);        //Added by Pranavi on 13-10-215 for quantity correction
                        NewStatus2 := NewStatus2 :: Released;
                        NewOrderType2 := NewOrderType2 :: ItemOrder;
                        IF "Unit of Measure Code" <> 'NOS' THEN BEGIN
                         IF ItemUnitofMeasure.GET("No.","Unit of Measure Code") THEN
                            ProdMakeQty := ProdMakeQty * ItemUnitofMeasure."Qty. per Unit of Measure";
                        END;
                        Saleshdr.RESET;
                        Saleshdr.SETFILTER(Saleshdr."Document Type",'%1',Saleshdr."Document Type"::Order);
                        Saleshdr.SETFILTER(Saleshdr."No.","Document No.");
                        IF Saleshdr.FINDFIRST THEN
                          IF Saleshdr."Order Assurance"=FALSE THEN
                            ERROR('Order Was not Assured By Sales Dept.')
                          ELSE
                          BEGIN
                          FOR I := 1 TO ProdMakeQty
                            DO BEGIN
                              Qty := 1;
                              CreateOrders(Qty);
                            END;
                          END;
                        "Prod. Qty" := 0;
                        
                        
                        //BuildForm;
                        
                        //CurrForm.UPDATE;

                    end;
                }
                action("Update New Item")
                {
                    Caption = 'Update New Item';
                    Description = 'UPG1.3 06Feb2019 Updates Item No. in Current Sales Line and in RPO if exist';
                    Image = Change;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";

                    trigger OnAction();
                    begin
                        //>>UPG1.3 06Feb2019
                        UpdateItemNo;
                        //<<UPG1.3 06Feb2019
                    end;
                }
                action(CreateSingleProdOrder)
                {
                    Caption = 'Create Single  Prod Order';

                    trigger OnAction();
                    var
                        NewStatus2 : Option Simulated,Planned,"Firm Planned",Released;
                        NewOrderType2 : Option ItemOrder,ProjectOrder;
                        SalesLine : Record "Sales Line";
                        ProdMakeQty : Integer;
                        Schedule2 : Record Schedule2;
                        ProductionOrder : Record "Production Order";
                        ItemUnitofMeasure : Record "Item Unit of Measure";
                    begin
                        ProductionOrder.RESET;
                        ProductionOrder.SETRANGE(Status,ProductionOrder.Status::Released);
                        ProductionOrder.SETRANGE("Sales Order No.","Document No.");
                        ProductionOrder.SETFILTER("Schedule Line No.",'<>%1',0);
                        IF ProductionOrder.FINDFIRST THEN
                          ERROR('RPO has been created for this order');
                        
                        
                        Saleshdr.RESET;
                        Saleshdr.SETFILTER(Saleshdr."Document Type",'%1',Saleshdr."Document Type"::Order);
                        Saleshdr.SETFILTER(Saleshdr."No.","Document No.");
                        IF Saleshdr.FINDFIRST THEN
                          IF Saleshdr."Order Assurance"=FALSE THEN
                            ERROR('Order Was not Assured By Sales Dept.');
                        
                        Window.OPEN('Action under Progress');
                        Schedule2.RESET;
                        Schedule2.SETRANGE("Document Type",Schedule2."Document Type"::Order);
                        Schedule2.SETRANGE("Document No.",Rec."Document No.");
                        Schedule2.SETRANGE("Document Line No.",Rec."Document Line No.");
                        Schedule2.SETFILTER("Posting Group",'%1','*MPBI*');
                        IF Schedule2.FINDSET THEN
                          REPEAT
                            IF Schedule2."Line No." <> Schedule2."Document Line No." THEN BEGIN
                              SalesLine.RESET;
                              SalesLine.SETRANGE(SalesLine."Document No.",Schedule2."Document No.");
                              SalesLine.SETRANGE(SalesLine."Line No.",Schedule2."Document Line No.");
                              IF SalesLine.FINDFIRST THEN
                              IF FORMAT(SalesLine."Pending By") <> ' ' THEN             //Added By Pranavi on 23-09-2015 to restrict create RPO if item is Pending by
                                ERROR('You Can not Create Production order for Item: '+"No."+'\ As it Pending By '+FORMAT(SalesLine."Pending By"));
                        
                              SalesPlanLine.DELETEALL;
                              ProdMakeQty := MakeLinesForSchedules(Schedule2);
                              IF Schedule2."Unit of Measure Code" <> 'NOS' THEN BEGIN
                                IF ItemUnitofMeasure.GET(Schedule2."No.",Schedule2."Unit of Measure Code") THEN
                                  ProdMakeQty := ProdMakeQty * ItemUnitofMeasure."Qty. per Unit of Measure";
                              END;
                              FOR I := 1 TO ProdMakeQty
                                DO BEGIN
                                  Qty := 1;
                                  AssignDate(TRUE);
                                  CreateOrders(Qty);
                                END;
                              Schedule2."Prod. Qty" := 0;
                            END;
                          UNTIL Schedule2.NEXT = 0;
                        Window.CLOSE;
                        /*
                        
                        IF "Document Line No." <> "Line No." THEN
                        BEGIN
                          SalesLine.RESET;
                          SalesLine.SETRANGE(SalesLine."Document No.","Document No.");
                          SalesLine.SETRANGE(SalesLine."Line No.","Document Line No.");
                          IF SalesLine.FINDFIRST THEN
                            IF FORMAT(SalesLine."Pending By") <> ' ' THEN             //Added By Pranavi on 23-09-2015 to restrict create RPO if item is Pending by
                              ERROR('You Can not Create Production order for Item: '+"No."+'\ As it Pending By '+FORMAT(SalesLine."Pending By"));
                        
                        END
                        ELSE ERROR('Can Not Create Prod. Order for Default Line!');
                        SalesPlanLine.DELETEALL;
                        ProdMakeQty := MakeLines(ScheduleLineRec);        //Added by Pranavi on 13-10-215 for quantity correction
                        NewStatus2 := NewStatus2 :: Released;
                        NewOrderType2 := NewOrderType2 :: ItemOrder;
                        
                        Saleshdr.RESET;
                        Saleshdr.SETFILTER(Saleshdr."Document Type",'%1',Saleshdr."Document Type"::Order);
                        Saleshdr.SETFILTER(Saleshdr."No.","Document No.");
                        IF Saleshdr.FINDFIRST THEN
                          IF Saleshdr."Order Assurance"=FALSE THEN
                            ERROR('Order Was not Assured By Sales Dept.')
                          ELSE
                          BEGIN
                          FOR I := 1 TO ProdMakeQty
                            DO BEGIN
                              Qty := 1;
                              CreateOrders(Qty);
                            END;
                          END;
                        "Prod. Qty" := 0;
                        */

                    end;
                }
            }
        }
    }

    trigger OnClosePage();
    begin
        Schedule.RESET;
        Schedule.SETRANGE("Document Type",Schedule."Document Type"::Tender);
        Schedule.SETRANGE("Document No.","Document No.");
        Schedule.SETRANGE("Document Line No.","Document Line No.");
        IF Schedule.FINDSET THEN
          REPEAT
            TotAmt+=Schedule."Calcaulated Amont";
          UNTIL Schedule.NEXT=0;
        TenderLine.RESET;
        TenderLine.SETRANGE("Document No.","Document No.");
        TenderLine.SETRANGE("Line No.","Document Line No.");
        IF TenderLine.FINDFIRST THEN BEGIN
          TenderLine."Total Amount":=TotAmt;
          TenderLine.MODIFY;
        END;
    end;

    trigger OnDeleteRecord() : Boolean;
    begin
        rpoQty:=0;
        PrdOrder.RESET;
        PrdOrder.SETFILTER(PrdOrder."Sales Order No.","Document No.");
        PrdOrder.SETFILTER(PrdOrder."Sales Order Line No.",'%1',"Document Line No.");
        PrdOrder.SETFILTER(PrdOrder."Schedule Line No.",'%1',"Line No.");
        IF PrdOrder.FINDSET THEN
        REPEAT
          rpoQty:=rpoQty+PrdOrder.Quantity;
        UNTIL PrdOrder.NEXT=0;

        IF rpoQty>0 THEN
          ERROR('Already '+FORMAT(rpoQty)+' Production Orders was released on this Product. Please contact Production manager for further actions');

        IF "Document Line No." <> "Line No." THEN
          IF SalesHeader.FINDFIRST THEN
            IF SalesHeader."Order Verified" = TRUE THEN
              ERROR('Schedule item cannot be inserted when sale order is verified');
    end;

    trigger OnModifyRecord() : Boolean;
    begin
        /*IF (USERID='EFFTRONICS\PADMAJA') OR (USERID='EFFTRONICS\VSNGEETHA') THEN
        BEGIN
        END ELSE IF (USERID='06PD012') OR (USERID='EFFTRONICS\JYOTHSNA')OR(USERID='EFFTRONICS\PRASANNAT')OR(USERID='07GA002') THEN  //sreenivas
        MESSAGE('You are Modifying the Record')
        ELSE
        ERROR('You Cannot Modify The Record');
        */
        IF NOT(USERID IN ['EFFTRONICS\VSNGEETHA','EFFTRONICS\SARDHAR','EFFTRONICS\PKOTESWARARAO']) THEN
        BEGIN
        TestDocStatus;
        END;
        IF "Document Line No."="Line No." THEN
        BEGIN
          //Added by Pranavi on 12-11-2015
          SL.RESET;
          SL.SETFILTER(SL."Document No.","Document No.");
          SL.SETFILTER(SL."Line No.",'%1',"Document Line No.");
          IF SL.FINDFIRST THEN
          BEGIN
            IF xRec."No." = SL."No." THEN
              ERROR('Not Possible to edit This Schedule Item');
          END;
        END;

    end;

    trigger OnOpenPage();
    begin
        //RESET;
        //SETCURRENTKEY("M/S Item");
        ProdOrder.RESET;
        ProdOrder.SETRANGE(Status,ProdOrder.Status::Released);
        ProdOrder.SETRANGE("Sales Order No.","Document No.");
        IF ProdOrder.FINDLAST THEN;
        Schedule.RESET;
        //Schedule.SETRANGE("Document Type",Schedule."Document Type"::Tender);
        Schedule.SETRANGE("Document No.","Document No.");
        Schedule.SETRANGE("Document Line No.","Document Line No.");
        IF Schedule.FINDFIRST THEN BEGIN
          Schedule."RPO Completion Date":=ProdOrder."Due Date";
          Schedule.MODIFY;
        END;
    end;

    var
        TenderLine : Record "Tender Line";
        TotAmt : Decimal;
        Schedule : Record Schedule2;
        ProdOrder : Record "Production Order";
        "G/L" : Record "General Ledger Setup";
        Plan_Change : Codeunit "Plan Change";
        SL : Record "Sales Line";
        ItemTrackingMgt : Codeunit "Item Tracking Management";
        ScheduleGrec : Record Schedule2;
        "-B2BSP-" : Integer;
        ReserveScheduleComp : Codeunit "Schedule Line Reserve1";
        SalesPlanLine : Record "Sales Planning Line";
        Text001 : TextConst ENU='You cannot use the Explode BOM function because a prepayment of the sales order has been invoiced.',ENN='You cannot use the Explode BOM function because a prepayment of the sales order has been invoiced.';
        ScheduleLineRec : Record Schedule2;
        Saleshdr : Record "Sales Header";
        I : Integer;
        Qty : Integer;
        NewOrderType : Option ItemOrder,ProjectOrder;
        NewStatus : Option Simulated,Planned,"Firm Planned",Released;
        SalesHeader : Record "Sales Header";
        PrdOrder : Record "Production Order";
        rpoQty : Decimal;
        AssignDateGVar : Boolean;
        Window : Dialog;

    [LineStart(11456)]
    local procedure TobeShippedQtyOnAfterInput(var Text : Text[1024]);
    begin
         IF (USERID<>'EFFTRONICS\PADMAJA') AND (USERID<>'07TE024') AND (USERID<>'EFFTRONICS\VSNGEETHA') THEN
           ERROR('You dont have rights to chage');
    end;

    [LineStart(11460)]
    local procedure MaterialRequiredDateOnAfterInp(var Text : Text[1024]);
    begin
         IF (USERID<>'EFFTRONICS\PADMAJA') AND (USERID<>'SUPER') AND (USERID<>'EFFTRONICS\VSNGEETHA') THEN
           ERROR('You dont have rights to chage');
    end;

    [LineStart(11464)]
    local procedure PlanShiftingDateOnAfterInput(var Text : Text[1024]);
    begin
         IF (USERID<>'EFFTRONICS\PADMAJA') AND (USERID<>'07TE024') THEN
           ERROR('You dont have rights to chage');
    end;

    [LineStart(11468)]
    local procedure ChangeToSpecifiedPlanDatOnPush();
    begin
         IF (USERID<>'EFFTRONICS\PADMAJA') AND (USERID<>'07TE024') THEN
           ERROR('You dont have rights to chage');
    end;

    [LineStart(11472)]
    procedure InitTrackingSpecification(var TrackingSpecification : Record "Schedule Tracking Specificatio");
    begin
        TrackingSpecification.INIT;
        TrackingSpecification."Item No." := "No.";
        TrackingSpecification.Description := Description;
        TrackingSpecification."Quantity (Base)" := Quantity;
    end;

    [LineStart(11478)]
    procedure "--B2BSP--"();
    begin
    end;

    [LineStart(11481)]
    procedure OpenItemTrackingLines();
    var
        Item : Record Item;
        TrackingSpecificationsFrm : Page "Item Card";
        Text001 : TextConst ENU='You must specify Item Tracking Code in Item No. =''%1''.',FRA='Code Traçabilité doit avoir une valeur sur la fiche de l''article = %1';
    begin
        TESTFIELD("No.");
        TESTFIELD(Quantity);
        TESTFIELD("Location Code");
        ReserveScheduleComp.CallItemTracking(Rec);
    end;

    [LineStart(11487)]
    procedure TestDocStatus();
    var
        SH : Record "Sales Header";
    begin
        // Pranavi
        SH.RESET;
        SH.SETRANGE(SH."No.","Document No.");
        IF SH.FINDFIRST THEN
          SH.TESTFIELD(SH.Status,SH.Status::Open);
        // Pranavi
    end;

    [LineStart(11495)]
    procedure MakeLines(var ScheduleLineparam : Record Schedule2) : Decimal;
    var
        SalesLine : Record "Sales Line";
        ProdOrderLine : Record "Prod. Order Line";
        PurchLine : Record "Purchase Line";
        ReqLine : Record "Requisition Line";
        ReservEntry2 : Record "Reservation Entry";
        ScheduleLine : Record Schedule2;
    begin
        SalesPlanLine.DELETEALL;
        ValidateProdOrder;
        SalesLine.GET(SalesLine."Document Type"::Order,"Document No.","Document Line No.");
        ScheduleLine.RESET;
        ScheduleLine.SETRANGE(ScheduleLine."Document Type","Document Type"::Order);
        ScheduleLine.SETRANGE(ScheduleLine."Document No.","Document No.");
        ScheduleLine.SETRANGE(ScheduleLine."Document Line No.","Document Line No.");
        ScheduleLine.SETRANGE(ScheduleLine."Line No.","Line No.");
        ScheduleLine.SETRANGE(ScheduleLine.Type,ScheduleLine.Type::Item);
        IF ScheduleLine.FINDFIRST THEN
        BEGIN
          ScheduleLine.TESTFIELD(ScheduleLine."Prod. Qty");
          ScheduleLine.TESTFIELD(ScheduleLine."Prod. Due Date");
          SalesPlanLine.INIT;
          SalesPlanLine."Sales Order No." := ScheduleLine."Document No.";
          SalesPlanLine."Sales Order Line No." := ScheduleLine."Document Line No.";
          SalesPlanLine."Schedule Line No." := ScheduleLine."Line No.";
          SalesPlanLine."Item No." := ScheduleLine."No.";
          SalesPlanLine."Variant Code" := SalesLine."Variant Code";
          SalesPlanLine.Description := ScheduleLine.Description;
          SalesPlanLine."Shipment Date" := SalesLine."Shipment Date";
          SalesPlanLine."Planning Status" := SalesPlanLine."Planning Status"::Released;
          ScheduleLine.CALCFIELDS("Reserved Qty. (Base)");
          SalesPlanLine."Planned Quantity" := ScheduleLine."Reserved Qty. (Base)";
          SalesPlanLine."Needs Replanning" :=
            (SalesPlanLine."Planned Quantity" <> ScheduleLine."Outstanding Qty.(Base)") OR
            (SalesPlanLine."Expected Delivery Date" > SalesPlanLine."Shipment Date");
          SalesPlanLine.INSERT;
          EXIT(ScheduleLine."Prod. Qty");
        END;
    end;

    [LineStart(11527)]
    procedure ValidateProdOrder();
    begin
        CALCFIELDS("Prod. Order Quantity");
        IF "Prod. Order Quantity" > Quantity  THEN
          ERROR(Text001);
    end;

    [LineStart(11532)]
    procedure CreateOrders(Qtyparam : Decimal) OrdersCreated : Boolean;
    var
        Item : Record Item;
        SalesLine : Record "Sales Line";
        ProdOrderFromSale : Codeunit "Create Prod. Order from Sale";
        ScheduleLine : Record Schedule2;
    begin
        IF NOT SalesPlanLine.FINDSET THEN
          EXIT;

        REPEAT
          ScheduleLine.GET(
          ScheduleLine."Document Type"::Order,
          SalesPlanLine."Sales Order No.",
          SalesPlanLine."Sales Order Line No.",SalesPlanLine."Schedule Line No.");
          SalesLine.GET(
            SalesLine."Document Type"::Order,
            SalesPlanLine."Sales Order No.",
            SalesPlanLine."Sales Order Line No.");
          SalesLine.TESTFIELD("Shipment Date");
          ScheduleLine.CALCFIELDS("Reserved Qty. (Base)");
          //IF ScheduleLine."Outstanding Qty.(Base)" > ScheduleLine."Reserved Qty. (Base)" THEN BEGIN
            Item.GET(ScheduleLine."No.");
            IF Item."Replenishment System" = Item."Replenishment System"::"Prod. Order" THEN
            BEGIN
              OrdersCreated := TRUE;
              IF AssignDateGVar THEN
                ProdOrderFromSale.ProdStartDate(TRUE);
              ProdOrderFromSale.CreateProdOrder2ForSchedule(ScheduleLine,NewStatus::Released,NewOrderType::ItemOrder,1);
              IF NewOrderType = NewOrderType::ProjectOrder THEN
                EXIT;
            END;
          //END;
        UNTIL (SalesPlanLine.NEXT = 0);
    end;

    [LineStart(11561)]
    local procedure UpdateItemNo();
    var
        UpdateScheduleItem : Report "Update Sales/ Schedule Item11";
    begin
        //>>UPG1.3 06Feb2019
        TESTFIELD(Type,Type::Item);
        TESTFIELD("No.");
        CLEAR(UpdateScheduleItem);
        UpdateScheduleItem.USEREQUESTPAGE(TRUE);
        UpdateScheduleItem.SetValues("Document No.","Document Line No.","Line No.");
        UpdateScheduleItem.RUN;
        CurrPage.UPDATE(FALSE);
        //<<UPG1.3 06Feb2019
    end;

    [LineStart(11572)]
    procedure MakeLinesForSchedules(var ScheduleLineparam : Record Schedule2) : Decimal;
    var
        SalesLine : Record "Sales Line";
        ProdOrderLine : Record "Prod. Order Line";
        PurchLine : Record "Purchase Line";
        ReqLine : Record "Requisition Line";
        ReservEntry2 : Record "Reservation Entry";
        ScheduleLine : Record Schedule2;
    begin
        SalesPlanLine.DELETEALL;
        ValidateProdOrderForSchedules(ScheduleLineparam);
        SalesLine.GET(SalesLine."Document Type"::Order,ScheduleLineparam."Document No.",ScheduleLineparam."Document Line No.");
        ScheduleLine.RESET;
        ScheduleLine.SETRANGE(ScheduleLine."Document Type","Document Type"::Order);
        ScheduleLine.SETRANGE(ScheduleLine."Document No.",ScheduleLineparam."Document No.");
        ScheduleLine.SETRANGE(ScheduleLine."Document Line No.",ScheduleLineparam."Document Line No.");
        ScheduleLine.SETRANGE(ScheduleLine."Line No.",ScheduleLineparam."Line No.");
        ScheduleLine.SETRANGE(ScheduleLine.Type,ScheduleLine.Type::Item);
        IF ScheduleLine.FINDFIRST THEN
        BEGIN
          //ScheduleLine.TESTFIELD(ScheduleLine."Prod. Qty");
          //ScheduleLine.TESTFIELD(ScheduleLine."Prod. Due Date");
          SalesPlanLine.INIT;
          SalesPlanLine."Sales Order No." := ScheduleLine."Document No.";
          SalesPlanLine."Sales Order Line No." := ScheduleLine."Document Line No.";
          SalesPlanLine."Schedule Line No." := ScheduleLine."Line No.";
          SalesPlanLine."Item No." := ScheduleLine."No.";
          SalesPlanLine."Variant Code" := SalesLine."Variant Code";
          SalesPlanLine.Description := ScheduleLine.Description;
          SalesPlanLine."Shipment Date" := SalesLine."Shipment Date";
          SalesPlanLine."Planning Status" := SalesPlanLine."Planning Status"::Released;
          ScheduleLine.CALCFIELDS("Reserved Qty. (Base)");
          SalesPlanLine."Planned Quantity" := ScheduleLine."Reserved Qty. (Base)";
          SalesPlanLine."Needs Replanning" :=
            (SalesPlanLine."Planned Quantity" <> ScheduleLine."Outstanding Qty.(Base)") OR
            (SalesPlanLine."Expected Delivery Date" > SalesPlanLine."Shipment Date");
          SalesPlanLine.INSERT;
          EXIT(ScheduleLine."Outstanding Qty.");
        END;
    end;

    [LineStart(11604)]
    procedure ValidateProdOrderForSchedules(var ScheduleLineLPar : Record Schedule2);
    begin
        ScheduleLineLPar.CALCFIELDS("Prod. Order Quantity");
        IF ScheduleLineLPar."Prod. Order Quantity" > ScheduleLineLPar.Quantity  THEN
          ERROR(Text001);
    end;

    [LineStart(11609)]
    procedure CreateOrdersForSchedules(Qtyparam : Decimal) OrdersCreated : Boolean;
    var
        Item : Record Item;
        SalesLine : Record "Sales Line";
        ProdOrderFromSale : Codeunit "Create Prod. Order from Sale";
        ScheduleLine : Record Schedule2;
    begin
        IF NOT SalesPlanLine.FINDSET THEN
          EXIT;

        REPEAT
          ScheduleLine.GET(
          ScheduleLine."Document Type"::Order,
          SalesPlanLine."Sales Order No.",
          SalesPlanLine."Sales Order Line No.",SalesPlanLine."Schedule Line No.");
          SalesLine.GET(
            SalesLine."Document Type"::Order,
            SalesPlanLine."Sales Order No.",
            SalesPlanLine."Sales Order Line No.");
          SalesLine.TESTFIELD("Shipment Date");
          ScheduleLine.CALCFIELDS("Reserved Qty. (Base)");
          //IF ScheduleLine."Outstanding Qty.(Base)" > ScheduleLine."Reserved Qty. (Base)" THEN BEGIN
            Item.GET(ScheduleLine."No.");
            IF Item."Replenishment System" = Item."Replenishment System"::"Prod. Order" THEN
            BEGIN
              OrdersCreated := TRUE;
              ProdOrderFromSale.CreateProdOrder2ForSchedule(ScheduleLine,NewStatus::Released,NewOrderType::ItemOrder,Qtyparam);
              IF NewOrderType = NewOrderType::ProjectOrder THEN
                EXIT;
            END;
          //END;
        UNTIL (SalesPlanLine.NEXT = 0);
    end;

    [LineStart(11636)]
    local procedure AssignDate(AssignProdDateLpar : Boolean);
    begin
        AssignDateGVar := AssignProdDateLpar;
    end;

    [LineStart(11639)]
    procedure MakeLinesForAll(var ScheduleLineparam : Record Schedule2) : Decimal;
    var
        SalesLine : Record "Sales Line";
        ProdOrderLine : Record "Prod. Order Line";
        PurchLine : Record "Purchase Line";
        ReqLine : Record "Requisition Line";
        ReservEntry2 : Record "Reservation Entry";
        ScheduleLine : Record Schedule2;
    begin
        SalesPlanLine.DELETEALL;
        ValidateProdOrderForAll(ScheduleLineparam);
        SalesLine.GET(SalesLine."Document Type"::Order,"Document No.","Document Line No.");
        ScheduleLine.RESET;
        ScheduleLine.SETRANGE(ScheduleLine."Document Type","Document Type"::Order);
        ScheduleLine.SETRANGE(ScheduleLine."Document No.","Document No.");
        ScheduleLine.SETRANGE(ScheduleLine."Document Line No.","Document Line No.");
        ScheduleLine.SETRANGE(ScheduleLine."Line No.","Line No.");
        ScheduleLine.SETRANGE(ScheduleLine.Type,ScheduleLine.Type::Item);
        IF ScheduleLine.FINDFIRST THEN
        BEGIN
          SalesPlanLine.INIT;
          SalesPlanLine."Sales Order No." := ScheduleLine."Document No.";
          SalesPlanLine."Sales Order Line No." := ScheduleLine."Document Line No.";
          SalesPlanLine."Schedule Line No." := ScheduleLine."Line No.";
          SalesPlanLine."Item No." := ScheduleLine."No.";
          SalesPlanLine."Variant Code" := SalesLine."Variant Code";
          SalesPlanLine.Description := ScheduleLine.Description;
          SalesPlanLine."Shipment Date" := SalesLine."Shipment Date";
          SalesPlanLine."Planning Status" := SalesPlanLine."Planning Status"::Released;
          ScheduleLine.CALCFIELDS("Reserved Qty. (Base)");
          SalesPlanLine."Planned Quantity" := ScheduleLine."Reserved Qty. (Base)";
          SalesPlanLine."Needs Replanning" :=
            (SalesPlanLine."Planned Quantity" <> ScheduleLine."Outstanding Qty.(Base)") OR
            (SalesPlanLine."Expected Delivery Date" > SalesPlanLine."Shipment Date");
          SalesPlanLine.INSERT;
          EXIT(ScheduleLine."Outstanding Qty.");
        END;
    end;

    [LineStart(11669)]
    procedure ValidateProdOrderForAll(var Schedule2LPar : Record Schedule2);
    begin
        Schedule2LPar.CALCFIELDS("Prod. Order Quantity");
        IF Schedule2LPar."Prod. Order Quantity" > Schedule2LPar.Quantity  THEN
          ERROR(Text001);
    end;
}

