page 99000815 "Production Order List"
{
    // version NAVW19.00.00.45778,REV01

    CaptionML = ENU = 'Production Order List',
                ENN = 'Production Order List';
    CardPageID = "Released Production Order";
    DataCaptionFields = Status;
    Editable = false;
    PageType = List;
    SaveValues = true;
    SourceTable = "Production Order";

    layout
    {
        area(content)
        {
            field("xRec.COUNT"; xRec.COUNT)
            {
                Style = Strong;
                StyleExpr = TRUE;
            }
            repeater(Control1)
            {
                ShowCaption = false;
                field("No."; "No.")
                {
                    Editable = true;
                    Lookup = false;
                    Style = StrongAccent;
                    StyleExpr = "No.Emphasize";
                }
                field(Description; Description)
                {
                }
                field("Creation Date"; "Creation Date")
                {
                }
                field("Prod Start date"; "Prod Start date")
                {

                    trigger OnValidate();
                    begin
                        IF item.GET("Source No.") THEN
                            item.TESTFIELD(item."No.of Units");

                        IF "Prod Start date" > 0D THEN BEGIN
                            /* IF (Planned_Units("Prod Start date")>10) AND (Planned_Units("Prod Start date")<12) THEN
                               MESSAGE('YOU ARE EXCEEDING THE 10 UNITS PLAN ON '+FORMAT("Prod Start date"))
                             ELSE IF (Planned_Units("Prod Start date")>16) THEN
                               ERROR('YOU ARE EXCEEDING THE 16 UNITS PLAN ON '+FORMAT("Prod Start date"));*/

                            "Prod. Order Component".SETRANGE("Prod. Order Component"."Prod. Order No.", "No.");
                            IF "Prod. Order Component".FINDSET THEN BEGIN
                                "Prod. Order Component".MODIFYALL("Prod. Order Component"."Production Plan Date", "Prod Start date")
                            END ELSE
                                ERROR('PLEASE REFRESH THE PRODUCTION ORDER PROPERLY');
                        END ELSE BEGIN
                            "Prod. Order Component".SETRANGE("Prod. Order Component"."Prod. Order No.", "No.");
                            IF "Prod. Order Component".FINDSET THEN BEGIN
                                "Prod. Order Component".MODIFYALL("Prod. Order Component"."Production Plan Date", "Prod Start date")
                            END;
                        END;





                        /*IF item.GET("Source No.") THEN
                          item.TESTFIELD(item."No.of Units");
                        
                        IF "Prod Start date">0D THEN
                        BEGIN
                        
                          IF (Planned_Units("Prod Start date")>10) AND (Planned_Units("Prod Start date")<12) THEN
                            MESSAGE('YOU ARE EXCEEDING THE 10 UNITS PLAN ON '+FORMAT("Prod Start date"))
                          ELSE IF (Planned_Units("Prod Start date")>14) THEN
                            ERROR('YOU ARE EXCEEDING THE 14 UNITS PLAN ON '+FORMAT("Prod Start date"));
                        
                        "Prod. Order Component".SETRANGE("Prod. Order Component"."Prod. Order No.","No.");
                        IF "Prod. Order Component".FINDSET THEN
                        BEGIN
                        REPEAT
                         { IF "Prod Start date">0D THEN
                          BEGIN
                            IF "Prod. Order Component"."Material Required Day"<>99 THEN
                            BEGIN}
                              "Prod. Order Component"."Production Plan Date":="Prod Start date";
                              "Prod. Order Component".MODIFY;
                           { END;
                          END ELSE
                          BEGIN
                            "Prod. Order Component"."Production Plan Date":=0D;
                            "Prod. Order Component".MODIFY;
                          END; }
                        UNTIL "Prod. Order Component".NEXT=0;
                        END ELSE
                        ERROR('PLEASE REFRESH THE PRODUCTION ORDER PROPERLY');
                        END;
                        */

                    end;
                }
                field("Planned Dispatch Date"; "Planned Dispatch Date")
                {
                }
                field(Status; Status)
                {
                }
                field("Search Description"; "Search Description")
                {
                }
                field("Description 2"; "Description 2")
                {
                }
                field("Last Date Modified"; "Last Date Modified")
                {
                }
                field("Source Type"; "Source Type")
                {
                }
                field("Source No."; "Source No.")
                {
                }
                field("Routing No."; "Routing No.")
                {
                }
                field("Inventory Posting Group"; "Inventory Posting Group")
                {
                }
                field("Gen. Prod. Posting Group"; "Gen. Prod. Posting Group")
                {
                }
                field("Gen. Bus. Posting Group"; "Gen. Bus. Posting Group")
                {
                }
                field(Comment; Comment)
                {
                }
                field("Starting Time"; "Starting Time")
                {
                }
                field("Starting Date"; "Starting Date")
                {
                }
                field("Ending Time"; "Ending Time")
                {
                }
                field("Ending Date"; "Ending Date")
                {
                }
                field("Due Date"; "Due Date")
                {
                }
                field("Finished Date"; "Finished Date")
                {
                }
                field(Blocked; Blocked)
                {
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                }
                field("Location Code"; "Location Code")
                {
                }
                field("Bin Code"; "Bin Code")
                {
                }
                field("Replan Ref. No."; "Replan Ref. No.")
                {
                }
                field("Replan Ref. Status"; "Replan Ref. Status")
                {
                }
                field("Low-Level Code"; "Low-Level Code")
                {
                }
                field(Quantity; Quantity)
                {
                }
                field("Unit Cost"; "Unit Cost")
                {
                }
                field("Cost Amount"; "Cost Amount")
                {
                }
                field("Work Center Filter"; "Work Center Filter")
                {
                }
                field("Capacity Type Filter"; "Capacity Type Filter")
                {
                }
                field("Capacity No. Filter"; "Capacity No. Filter")
                {
                }
                field("Date Filter"; "Date Filter")
                {
                }
                field("Expected Operation Cost Amt."; "Expected Operation Cost Amt.")
                {
                }
                field("Expected Component Cost Amt."; "Expected Component Cost Amt.")
                {
                }
                field("Actual Time Used"; "Actual Time Used")
                {
                }
                field("Allocated Capacity Need"; "Allocated Capacity Need")
                {
                }
                field("Expected Capacity Need"; "Expected Capacity Need")
                {
                }
                field("No. Series"; "No. Series")
                {
                }
                field("Planned Order No."; "Planned Order No.")
                {
                }
                field("Firm Planned Order No."; "Firm Planned Order No.")
                {
                }
                field("Simulated Order No."; "Simulated Order No.")
                {
                }
                field("Expected Material Ovhd. Cost"; "Expected Material Ovhd. Cost")
                {
                }
                field("Expected Capacity Ovhd. Cost"; "Expected Capacity Ovhd. Cost")
                {
                }
                field("Starting Date-Time"; "Starting Date-Time")
                {
                }
                field("Ending Date-Time"; "Ending Date-Time")
                {
                }
                field("Completely Picked"; "Completely Picked")
                {
                }
                field("Assigned User ID"; "Assigned User ID")
                {
                }
                field("Sales Order No."; "Sales Order No.")
                {
                }
                field("Sales Order Line No."; "Sales Order Line No.")
                {
                }
                field("Item Sub Group Code"; "Item Sub Group Code")
                {
                }
                field("Product Group Code"; "Product Group Code")
                {
                }
                field(Week; Week)
                {
                }
                field(Customer; Customer)
                {
                }
                field("Shortage Verified"; "Shortage Verified")
                {
                }
                field("Shortage Items"; "Shortage Items")
                {
                }
                field("Schedule Line No."; "Schedule Line No.")
                {
                }
                field("Service Order No."; "Service Order No.")
                {
                }
                field("Change Status"; "Change Status")
                {
                }
                field(RefreshProdTime; RefreshProdTime)
                {
                }
                field(Refreshdate; Refreshdate)
                {
                }
                field(StatusTemp; StatusTemp)
                {
                }
                field("Production Order Status"; "Production Order Status")
                {
                }
                field("Work.MesurInUnits(ASM)"; "Work.MesurInUnits(ASM)")
                {
                }
                field("Work.MesurInUnits(TST)"; "Work.MesurInUnits(TST)")
                {
                }
                field("Work.MesurInUnits(SHF)"; "Work.MesurInUnits(SHF)")
                {
                }
                field("Total Unts"; "Total Unts")
                {
                }
                field("User Id"; "User Id")
                {
                }
                field("Plan Shifting Date"; "Plan Shifting Date")
                {
                }
                field("Change To Specified Plan Date"; "Change To Specified Plan Date")
                {
                }
                field("No. Of Shortage Items"; "No. Of Shortage Items")
                {
                }
                field("Virtual Production Start Date"; "Virtual Production Start Date")
                {
                }
                field("Suppose to Plan"; "Suppose to Plan")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = false;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Pro&d. Order")
            {
                CaptionML = ENU = 'Pro&d. Order',
                            ENN = 'Pro&d. Order';
                Image = "Order";
                action(Card)
                {
                    CaptionML = ENU = 'Card',
                                ENN = 'Card';
                    Image = EditLines;
                    ShortCutKey = 'Shift+F7';

                    trigger OnAction();
                    begin
                        CASE Status OF
                            Status::Simulated:
                                PAGE.RUN(PAGE::"Simulated Production Order", Rec);
                            Status::Planned:
                                PAGE.RUN(PAGE::"Planned Production Order", Rec);
                            Status::"Firm Planned":
                                PAGE.RUN(PAGE::"Firm Planned Prod. Order", Rec);
                            Status::Released:
                                PAGE.RUN(PAGE::"Released Production Order", Rec);
                            Status::Finished:
                                PAGE.RUN(PAGE::"Finished Production Order", Rec);
                        END;
                    end;
                }
                group("E&ntries")
                {
                    CaptionML = ENU = 'E&ntries',
                                ENN = 'E&ntries';
                    Image = Entries;
                    action("Item Ledger E&ntries")
                    {
                        CaptionML = ENU = 'Item Ledger E&ntries',
                                    ENN = 'Item Ledger E&ntries';
                        Image = ItemLedger;
                        RunObject = Page "Item Ledger Entries";
                        RunPageLink = Order Type=CONST(Production),Order No.=FIELD(No.);
                        RunPageView = SORTING(Order Type,Order No.);
                        ShortCutKey = 'Ctrl+F7';
                    }
                    action("Capacity Ledger Entries")
                    {
                        CaptionML = ENU='Capacity Ledger Entries',
                                    ENN='Capacity Ledger Entries';
                        Image = CapacityLedger;
                        RunObject = Page "Capacity Ledger Entries";
                                        RunPageLink = Order Type=CONST(Production),Order No.=FIELD(No.);
                        RunPageView = SORTING(Order Type,Order No.);
                    }
                    action("Value Entries")
                    {
                        CaptionML = ENU='Value Entries',
                                    ENN='Value Entries';
                        Image = ValueLedger;
                        RunObject = Page "Value Entries";
                                        RunPageLink = Order Type=CONST(Production),Order No.=FIELD(No.);
                        RunPageView = SORTING(Order Type,Order No.);
                    }
                    action("&Warehouse Entries")
                    {
                        CaptionML = ENU='&Warehouse Entries',
                                    ENN='&Warehouse Entries';
                        Image = BinLedger;
                        RunObject = Page "Warehouse Entries";
                                        RunPageLink = Source Type=FILTER(83|5407),Source Subtype=FILTER(3|4|5),Source No.=FIELD(No.);
                        RunPageView = SORTING(Source Type,Source Subtype,Source No.);
                    }
                }
                action("Co&mments")
                {
                    CaptionML = ENU='Co&mments',
                                ENN='Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Prod. Order Comment Sheet";
                                    RunPageLink = Status=FIELD(Status),Prod. Order No.=FIELD(No.);
                }
                action(Dimensions)
                {
                    AccessByPermission = TableData Dimension=R;
                    CaptionML = ENU='Dimensions',
                                ENN='Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction();
                    begin
                        ShowDocDim;
                        CurrPage.SAVERECORD;
                    end;
                }
                separator(Action31)
                {
                }
                action(Statistics)
                {
                    CaptionML = ENU='Statistics',
                                ENN='Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Production Order Statistics";
                                    RunPageLink = Status=FIELD(Status),No.=FIELD(No.),Date Filter=FIELD(Date Filter);
                    ShortCutKey = 'F7';
                }
                action("Change the Plan")
                {
                    Caption = 'Change the Plan';

                    trigger OnAction();
                    begin
                        RESET;
                        SETRANGE("Change To Specified Plan Date",TRUE);
                        IF FINDSET THEN
                        REPEAT
                          "Planned Dispatch Date":="Plan Shifting Date"+("Planned Dispatch Date"-"Prod Start date");
                          "Prod Start date":="Plan Shifting Date";
                          "Prod. Order Component".RESET;
                          "Prod. Order Component".SETRANGE("Prod. Order Component"."Prod. Order No.","No.");
                          IF "Prod. Order Component".FINDSET THEN
                          REPEAT
                            IF "Prod. Order Component"."Material Required Day"<>99 THEN
                            BEGIN
                              "Prod. Order Component"."Production Plan Date":="Plan Shifting Date";
                              "Prod. Order Component".MODIFY;
                            END ELSE
                            BEGIN
                              "Prod. Order Component"."Production Plan Date":="Planned Dispatch Date";
                              "Prod. Order Component".MODIFY;
                            END;
                          UNTIL "Prod. Order Component".NEXT=0;
                          "Change To Specified Plan Date":=FALSE;
                          MODIFY;
                        UNTIL  NEXT=0;
                        MESSAGE('Production Plan Changes are Changed');
                        "G/L".GET;
                        RESET;
                        SETCURRENTKEY("Prod Start date");
                        SETFILTER("Prod Start date",'>%1',"G/L"."Shortage. Calc. Date");
                        SETFILTER("Plan Shifting Date",'>%1',0D);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        NoC2OnFormat;
    end;

    trigger OnOpenPage();
    begin
        /*CLEAR(Rec);*/
        // SETFILTER("Production Order Status",'%1..%2|%3',1,6,8);
        //  SETFILTER("Production Order Status",'<>%1',"Production Order Status"::Completed);
        //SETFILTER(Status,'Released');
        //Rec.SETFILTER("Location Code",'PROD');
        IF UPPERCASE(USERID) IN ['EFFTRONICS\PADMAJA','SUPER','EFFTRONICS\VSNGEETHA','10RD01']  THEN//(UPPERCASE(USERID)='06PD012')
        BEGIN
          CurrPage.EDITABLE:=TRUE;
          Rec.SETFILTER("Location Code",'PROD');
         //SETFILTER("Production Order Status",'%1..%2|%3',2,7,9);
         IF UPPERCASE(USERID) IN ['EFFTRONICS\PADMAJA','10RD01','EFFTRONICS\SUJANI'] THEN
         SETFILTER("Creation Date",'>=%1',DMY2DATE(4,4,2013));
        // SETFILTER("Production Order Status",'<>%1',"Production Order Status"::Dispatched);
        END ELSE
          CurrPage.EDITABLE:=FALSE

    end;

    var
        "Prod. Order Component" : Record "Prod. Order Component";
        Shortage_Details : Record "Item Lot Numbers";
        "G/L" : Record "General Ledger Setup";
        item : Record Item;
        Prod_Order : Record "Production Order";
        PMIH : Record "Posted Material Issues Header";
        [InDataSet]
        "No.Emphasize" : Boolean;

    (24106)]
    procedure Planned_Units(Prod_Date : Date) "Units Planned" : Decimal;
    begin
        Prod_Order.SETCURRENTKEY(Prod_Order."Prod Start date");
        Prod_Order.SETRANGE(Prod_Order."Prod Start date",Prod_Date);
        IF Prod_Order.FINDSET THEN
        REPEAT
          item.RESET;
          IF item.GET(Prod_Order."Source No.") THEN
             "Units Planned"+=Prod_Order.Quantity*item."No.of Units";

        UNTIL Prod_Order.NEXT=0;
        EXIT("Units Planned");
    end;

    (24118)]
    local procedure NoC2OnFormat();
    begin
        PMIH.RESET;
        PMIH.SETFILTER(PMIH."Prod. Order No.","No.");
        IF NOT PMIH.FINDFIRST THEN
        BEGIN
           "No.Emphasize" :=TRUE;
        END ELSE
           "No.Emphasize" := FALSE;
    end;
}

