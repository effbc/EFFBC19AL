page 99000817 "Prod. Order Routing"
{
    // version NAVW17.00,QC1.0,QCB2B1.2,QC1.2

    CaptionML = ENU='Prod. Order Routing',
                ENN='Prod. Order Routing';
    DataCaptionExpression = Caption;
    PageType = List;
    SourceTable = "Prod. Order Routing Line";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Prod. Order No.";"Prod. Order No.")
                {
                    Editable = true;
                    Visible = "Prod. Order No.Visible";
                }
                field("Routing No.";"Routing No.")
                {
                }
                field("Routing Reference No.";"Routing Reference No.")
                {
                    Editable = true;
                }
                field(PlannedStartDate;PlannedStartDate)
                {
                }
                field("Item Description";"Item Description")
                {
                }
                field("Input Quantity";"Input Quantity")
                {
                }
                field("Item No.";"Item No.")
                {
                    Editable = true;
                }
                field("QAS/MPR";"QAS/MPR")
                {
                }
                field("Operation Description";"Operation Description")
                {
                    Editable = true;
                }
                field("Allocated Qty.1";"Allocated Qty.1")
                {
                }
                field("Person.2";"Person.2")
                {
                }
                field("Allocated Qty.2";"Allocated Qty.2")
                {
                }
                field("Person.3";"Person.3")
                {
                }
                field("Allocated Qty.3";"Allocated Qty.3")
                {
                }
                field("Work Center No.";"Work Center No.")
                {
                    Editable = true;
                }
                field("Work Center Group Code";"Work Center Group Code")
                {
                    Editable = true;
                }
                field("Schedule Manually";"Schedule Manually")
                {
                    Visible = false;
                }
                field("QC Enabled";"QC Enabled")
                {
                    Editable = false;

                    trigger OnValidate();
                    var
                        CapacityLedgerEntrY : Record "Capacity Ledger Entry";
                    begin
                        //B2B 1.1
                        CapacityLedgerEntrY.SETRANGE(CapacityLedgerEntrY."Order No.","Prod. Order No.");
                        CapacityLedgerEntrY.SETRANGE("Order Line No.","Routing Reference No.");
                        CapacityLedgerEntrY.SETRANGE("Operation No.","Operation No.");
                        IF CapacityLedgerEntrY.FINDFIRST THEN
                         IF CapacityLedgerEntrY."Last Output Line" THEN
                           ERROR('You can not change this field as already ledger entries are existed with this operation');
                        //B2B1.1
                    end;
                }
                field("Spec Id";"Spec Id")
                {
                    Editable = false;
                }
                field("Quantity Sent To Quality";"Quantity Sent To Quality")
                {
                    Visible = false;
                }
                field("Sub Assembly";"Sub Assembly")
                {
                    Editable = false;
                }
                field("Operation No.";"Operation No.")
                {
                }
                field("Previous Operation No.";"Previous Operation No.")
                {
                    Visible = false;
                }
                field("Next Operation No.";"Next Operation No.")
                {
                    Visible = false;
                }
                field(Type;Type)
                {
                }
                field("No.";"No.")
                {
                    Editable = true;
                }
                field(Description;Description)
                {
                }
                field("Flushing Method";"Flushing Method")
                {
                    Visible = false;
                }
                field("Starting Date-Time";"Starting Date-Time")
                {
                }
                field("Starting Time";"Starting Time")
                {
                    Visible = false;

                    trigger OnValidate();
                    begin
                        StartingTimeOnAfterValidate;
                    end;
                }
                field("Starting Date";"Starting Date")
                {
                    Visible = false;

                    trigger OnValidate();
                    begin
                        StartingDateOnAfterValidate;
                    end;
                }
                field("Quantity Accepted";"Quantity Accepted")
                {
                }
                field("Quantity Rejected";"Quantity Rejected")
                {
                }
                field("Quantity Rework";"Quantity Rework")
                {
                }
                field("Ending Date-Time";"Ending Date-Time")
                {
                }
                field("Ending Time";"Ending Time")
                {
                    Visible = false;

                    trigger OnValidate();
                    begin
                        EndingTimeOnAfterValidate;
                    end;
                }
                field("Ending Date";"Ending Date")
                {
                    Visible = false;

                    trigger OnValidate();
                    begin
                        EndingDateOnAfterValidate;
                    end;
                }
                field("Setup Time";"Setup Time")
                {
                }
                field("Run Time";"Run Time")
                {
                }
                field("Wait Time";"Wait Time")
                {
                }
                field("Move Time";"Move Time")
                {
                }
                field("Fixed Scrap Quantity";"Fixed Scrap Quantity")
                {
                    Visible = false;
                }
                field("Routing Link Code";"Routing Link Code")
                {
                    Visible = false;
                }
                field("Scrap Factor %";"Scrap Factor %")
                {
                    Visible = false;
                }
                field("Send-Ahead Quantity";"Send-Ahead Quantity")
                {
                    Visible = false;
                }
                field("Concurrent Capacities";"Concurrent Capacities")
                {
                    Visible = false;
                }
                field("Unit Cost per";"Unit Cost per")
                {
                    Visible = false;
                }
                field("Expected Operation Cost Amt.";"Expected Operation Cost Amt.")
                {
                    Visible = false;
                }
                field("Expected Capacity Ovhd. Cost";"Expected Capacity Ovhd. Cost")
                {
                    Visible = false;
                }
                field("Expected Capacity Need";"Expected Capacity Need" / ExpCapacityNeed)
                {
                    CaptionML = ENU='Expected Capacity Need',
                                ENN='Expected Capacity Need';
                    DecimalPlaces = 0:5;
                    Visible = false;
                }
                field("Routing Status";"Routing Status")
                {
                    Visible = false;
                }
                field("Location Code";"Location Code")
                {
                    Visible = false;
                }
                field("Open Shop Floor Bin Code";"Open Shop Floor Bin Code")
                {
                    Visible = false;
                }
                field("To-Production Bin Code";"To-Production Bin Code")
                {
                    Visible = false;
                }
                field("From-Production Bin Code";"From-Production Bin Code")
                {
                    Visible = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207;Links)
            {
                Visible = false;
            }
            systempart(Control1905767507;Notes)
            {
                Visible = false;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Line")
            {
                CaptionML = ENU='&Line',
                            ENN='&Line';
                Image = Line;
                action("Co&mments")
                {
                    CaptionML = ENU='Co&mments',
                                ENN='Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Prod. Order Rtng. Cmt. Sh.";
                    RunPageLink = Status=FIELD(Status),Prod. Order No.=FIELD(Prod. Order No.),Routing Reference No.=FIELD(Routing Reference No.),Routing No.=FIELD(Routing No.),Operation No.=FIELD(Operation No.);
                }
                action(Tools)
                {
                    CaptionML = ENU='Tools',
                                ENN='Tools';
                    Image = Tools;
                    RunObject = Page "Prod. Order Routing Tools";
                    RunPageLink = Status=FIELD(Status),Prod. Order No.=FIELD(Prod. Order No.),Routing Reference No.=FIELD(Routing Reference No.),Routing No.=FIELD(Routing No.),Operation No.=FIELD(Operation No.);
                }
                action(Personnel)
                {
                    CaptionML = ENU='Personnel',
                                ENN='Personnel';
                    Image = User;
                    RunObject = Page "Prod. Order Routing Personnel";
                    RunPageLink = Status=FIELD(Status),Prod. Order No.=FIELD(Prod. Order No.),Routing Reference No.=FIELD(Routing Reference No.),Routing No.=FIELD(Routing No.),Operation No.=FIELD(Operation No.);
                }
                action("Quality Measures")
                {
                    CaptionML = ENU='Quality Measures',
                                ENN='Quality Measures';
                    Image = TaskQualityMeasure;
                    RunObject = Page "Prod. Order Rtng Qlty Meas.";
                    RunPageLink = Status=FIELD(Status),Prod. Order No.=FIELD(Prod. Order No.),Routing Reference No.=FIELD(Routing Reference No.),Routing No.=FIELD(Routing No.),Operation No.=FIELD(Operation No.);
                }
                separator(Action56)
                {
                }
                action("Allocated Capacity")
                {
                    CaptionML = ENU='Allocated Capacity',
                                ENN='Allocated Capacity';
                    Image = AllocatedCapacity;

                    trigger OnAction();
                    var
                        ProdOrderCapNeed : Record "Prod. Order Capacity Need";
                    begin
                        IF Status = Status::Finished THEN
                          EXIT;
                        ProdOrderCapNeed.SETCURRENTKEY(Type,"No.","Starting Date-Time");
                        ProdOrderCapNeed.SETRANGE(Type,Type);
                        ProdOrderCapNeed.SETRANGE("No.","No.");
                        ProdOrderCapNeed.SETRANGE(Date,"Starting Date","Ending Date");
                        ProdOrderCapNeed.SETRANGE("Prod. Order No.","Prod. Order No.");
                        ProdOrderCapNeed.SETRANGE(Status,Status);
                        ProdOrderCapNeed.SETRANGE("Routing Reference No.","Routing Reference No.");
                        ProdOrderCapNeed.SETRANGE("Operation No.","Operation No.");

                        PAGE.RUNMODAL(0,ProdOrderCapNeed);
                    end;
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                CaptionML = ENU='F&unctions',
                            ENN='F&unctions';
                Image = "Action";
                action("Order &Tracking")
                {
                    CaptionML = ENU='Order &Tracking',
                                ENN='Order &Tracking';
                    Image = OrderTracking;

                    trigger OnAction();
                    var
                        ProdOrderLine : Record "Prod. Order Line";
                        TrackingPage : Page "Order Tracking";
                    begin
                        ProdOrderLine.SETRANGE(Status,Status);
                        ProdOrderLine.SETRANGE("Prod. Order No.","Prod. Order No.");
                        ProdOrderLine.SETRANGE("Routing No.","Routing No.");
                        IF ProdOrderLine.FINDFIRST THEN BEGIN
                          TrackingPage.SetProdOrderLine(ProdOrderLine);
                          TrackingPage.RUNMODAL;
                        END;
                    end;
                }
                separator(Action1102152000)
                {
                }
                group(Inspection)
                {
                    Caption = 'Inspection';
                    action("Inspection Data Sheets")
                    {
                        Caption = 'Inspection Data Sheets';
                        RunObject = Page "Inspection Data Sheet List";
                        RunPageLink = Source Type=CONST(WIP),Prod. Order No.=FIELD(Prod. Order No.),Routing Reference No.=FIELD(Routing Reference No.),Routing No.=FIELD(Routing No.),Operation No.=FIELD(Operation No.);
                    }
                    action("Posted Inspection Data Sheets")
                    {
                        Caption = 'Posted Inspection Data Sheets';
                        RunObject = Page "Posted Inspect Data Sheet List";
                        RunPageLink = Source Type=CONST(WIP),Prod. Order No.=FIELD(Prod. Order No.),Routing Reference No.=FIELD(Routing Reference No.),Routing No.=FIELD(Routing No.),Operation No.=FIELD(Operation No.);
                    }
                    action("Inspection &Receipts")
                    {
                        Caption = 'Inspection &Receipts';
                        RunObject = Page "Inspection Receipt List";
                        RunPageLink = Source Type=CONST(WIP),Prod. Order No.=FIELD(Prod. Order No.),Routing Reference No.=FIELD(Routing Reference No.),Routing No.=FIELD(Routing No.),Operation No.=FIELD(Operation No.),Status=CONST(No);
                    }
                    action("Posted I&nspection Receipts")
                    {
                        Caption = 'Posted I&nspection Receipts';
                        RunObject = Page "Inspection Receipt List";
                        RunPageLink = Source Type=CONST(WIP),Prod. Order No.=FIELD(Prod. Order No.),Routing Reference No.=FIELD(Routing Reference No.),Routing No.=FIELD(Routing No.),Operation No.=FIELD(Operation No.),Status=CONST(Yes);
                    }
                }
            }
        }
    }

    trigger OnDeleteRecord() : Boolean;
    begin
        "CheckPrevious&Next";
    end;

    trigger OnInit();
    begin
        "Prod. Order No.Visible" := TRUE;
    end;

    trigger OnOpenPage();
    begin
        "Prod. Order No.Visible" := TRUE;
        IF GETFILTER("Prod. Order No.") <> '' THEN
          "Prod. Order No.Visible" := GETRANGEMIN("Prod. Order No.") <> GETRANGEMAX("Prod. Order No.");
    end;

    var
        "Prod.OrderLine" : Record "Prod. Order Line";
        [InDataSet]
        "Prod. Order No.Visible" : Boolean;

    [LineStart(24138)]
    local procedure ExpCapacityNeed() : Decimal;
    var
        WorkCenter : Record "Work Center";
        CalendarMgt : Codeunit CalendarManagement;
    begin
        IF "Work Center No." = '' THEN
          EXIT(1);
        WorkCenter.GET("Work Center No.");
        EXIT(CalendarMgt.TimeFactor(WorkCenter."Unit of Measure Code"));
    end;

    [LineStart(24144)]
    local procedure StartingTimeOnAfterValidate();
    begin
        CurrPage.UPDATE;
    end;

    [LineStart(24147)]
    local procedure StartingDateOnAfterValidate();
    begin
        CurrPage.UPDATE;
    end;

    [LineStart(24150)]
    local procedure EndingTimeOnAfterValidate();
    begin
        CurrPage.UPDATE;
    end;

    [LineStart(24153)]
    local procedure EndingDateOnAfterValidate();
    begin
        CurrPage.UPDATE;
    end;
}

