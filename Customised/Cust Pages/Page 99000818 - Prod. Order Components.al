page 99000818 "Prod. Order Components"
{
    // version NAVW19.00.00.45778

    AutoSplitKey = true;
    CaptionML = ENU = 'Prod. Order Components',
                ENN = 'Prod. Order Components';
    DataCaptionExpression = Caption;
    DelayedInsert = true;
    Editable = true;
    MultipleNewLines = true;
    PageType = List;
    SourceTable = "Prod. Order Component";

    layout
    {
        area(content)
        {
            field("COUNT"; COUNT)
            {
            }
            repeater(Control1)
            {
                ShowCaption = false;
                field("Prod. Order No."; "Prod. Order No.")
                {
                    Editable = false;
                }
                field(Status; Status)
                {
                }
                field("Product Group Code"; "Product Group Code")
                {
                }
                field("Type of Solder"; "Type of Solder")
                {
                }
                field("Don't Consider"; "Don't Consider")
                {
                }
                field("Line No."; "Line No.")
                {
                }
                field("Prod. Order Line No."; "Prod. Order Line No.")
                {
                    Editable = false;
                }
                field("Material Required Day"; "Material Required Day")
                {
                }
                field("Production Plan Date"; "Production Plan Date")
                {
                }
                field("Material Requisition Date"; "Material Requisition Date")
                {
                }
                field(PCB; PCB)
                {
                }
                field("Source No."; "Source No.")
                {
                }
                field("Act. Consumption (Qty)"; "Act. Consumption (Qty)")
                {
                }
                field("BOM Type"; "BOM Type")
                {
                    Editable = true;
                    Enabled = true;
                    OptionCaption = '" ,Mechanical,Wiring,Testing,Packing"';
                }
                field("Item No."; "Item No.")
                {

                    trigger OnValidate();
                    begin
                        ItemNoOnAfterValidate;
                    end;
                }
                field("Variant Code"; "Variant Code")
                {
                    Visible = false;
                }
                field("Due Date-Time"; "Due Date-Time")
                {
                    Visible = false;
                }
                field("Due Date"; "Due Date")
                {
                }
                field(Description; Description)
                {
                    Editable = false;
                }
                field("Routing Link Code"; "Routing Link Code")
                {
                }
                field("Scrap %"; "Scrap %")
                {
                    Visible = false;

                    trigger OnValidate();
                    begin
                        Scrap37OnAfterValidate;
                    end;
                }
                field("Calculation Formula"; "Calculation Formula")
                {
                    Visible = false;

                    trigger OnValidate();
                    begin
                        CalculationFormulaOnAfterValid;
                    end;
                }
                field(Length; Length)
                {
                    Visible = false;

                    trigger OnValidate();
                    begin
                        LengthOnAfterValidate;
                    end;
                }
                field(Width; Width)
                {
                    Visible = false;

                    trigger OnValidate();
                    begin
                        WidthOnAfterValidate;
                    end;
                }
                field(Weight; Weight)
                {
                    Visible = false;

                    trigger OnValidate();
                    begin
                        WeightOnAfterValidate;
                    end;
                }
                field(Depth; Depth)
                {
                    Visible = false;

                    trigger OnValidate();
                    begin
                        DepthOnAfterValidate;
                    end;
                }
                field("Quantity per"; "Quantity per")
                {
                    Editable = true;
                    Enabled = true;

                    trigger OnValidate();
                    begin
                        QuantityperOnAfterValidate;
                    end;
                }
                field("Reserved Quantity"; "Reserved Quantity")
                {
                    Visible = false;

                    trigger OnDrillDown();
                    begin
                        ShowReservationEntries(TRUE);
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                field("Unit of Measure Code"; "Unit of Measure Code")
                {

                    trigger OnValidate();
                    begin
                        UnitofMeasureCodeOnAfterValida;
                    end;
                }
                field("Flushing Method"; "Flushing Method")
                {
                    Visible = false;
                }
                field("Expected Quantity"; "Expected Quantity")
                {
                }
                field("Qty. in Material Issues"; "Qty. in Material Issues")
                {
                }
                field("Qty. in Posted Material Issues"; "Qty. in Posted Material Issues")
                {
                }
                field("Remaining Quantity"; "Remaining Quantity")
                {
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    Visible = false;
                }
                field("ShortcutDimCode[3]"; ShortcutDimCode[3])
                {
                    CaptionClass = '1,2,3';
                    TableRelation = "Dimension Value".Code WHERE(Global Dimension No.=CONST(3),Dimension Value Type=CONST(Standard),Blocked=CONST(No));
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(3, ShortcutDimCode[3]);
                    end;
                }
                field("ShortcutDimCode[4]"; ShortcutDimCode[4])
                {
                    CaptionClass = '1,2,4';
                    TableRelation = "Dimension Value".Code WHERE(Global Dimension No.=CONST(4),Dimension Value Type=CONST(Standard),Blocked=CONST(No));
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(4, ShortcutDimCode[4]);
                    end;
                }
                field("ShortcutDimCode[5]"; ShortcutDimCode[5])
                {
                    CaptionClass = '1,2,5';
                    TableRelation = "Dimension Value".Code WHERE(Global Dimension No.=CONST(5),Dimension Value Type=CONST(Standard),Blocked=CONST(No));
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(5, ShortcutDimCode[5]);
                    end;
                }
                field("ShortcutDimCode[6]"; ShortcutDimCode[6])
                {
                    CaptionClass = '1,2,6';
                    TableRelation = "Dimension Value".Code WHERE(Global Dimension No.=CONST(6),Dimension Value Type=CONST(Standard),Blocked=CONST(No));
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(6, ShortcutDimCode[6]);
                    end;
                }
                field("ShortcutDimCode[7]"; ShortcutDimCode[7])
                {
                    CaptionClass = '1,2,7';
                    TableRelation = "Dimension Value".Code WHERE(Global Dimension No.=CONST(7),Dimension Value Type=CONST(Standard),Blocked=CONST(No));
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(7, ShortcutDimCode[7]);
                    end;
                }
                field("ShortcutDimCode[8]"; ShortcutDimCode[8])
                {
                    CaptionClass = '1,2,8';
                    TableRelation = "Dimension Value".Code WHERE(Global Dimension No.=CONST(8),Dimension Value Type=CONST(Standard),Blocked=CONST(No));
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(8, ShortcutDimCode[8]);
                    end;
                }
                field("Location Code"; "Location Code")
                {
                    Visible = false;

                    trigger OnValidate();
                    begin
                        LocationCodeOnAfterValidate;
                    end;
                }
                field("Bin Code"; "Bin Code")
                {
                    Visible = false;
                }
                field("Unit Cost"; "Unit Cost")
                {
                    Visible = false;
                }
                field("Cost Amount"; "Cost Amount")
                {
                    Visible = false;
                }
                field(Position; Position)
                {
                    Visible = false;
                }
                field("Position 2"; "Position 2")
                {
                    Visible = false;
                }
                field("Position 3"; "Position 3")
                {
                    Visible = false;
                }
                field("Lead-Time Offset"; "Lead-Time Offset")
                {
                    Visible = false;
                }
                field("Qty. Picked"; "Qty. Picked")
                {
                    Visible = false;
                }
                field("Qty. Picked (Base)"; "Qty. Picked (Base)")
                {
                    Visible = false;
                }
                field("Substitution Available"; "Substitution Available")
                {
                }
                field("Operation No."; "Operation No.")
                {
                }
                field(Dept; Dept)
                {
                }
                field("Type of Solder2"; "Type of Solder2")
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
            group("&Line")
            {
                CaptionML = ENU = '&Line',
                            ENN = '&Line';
                Image = Line;
                group("Item Availability by")
                {
                    CaptionML = ENU = 'Item Availability by',
                                ENN = 'Item Availability by';
                    Image = ItemAvailability;
                    action("Event")
                    {
                        CaptionML = ENU = 'Event',
                                    ENN = 'Event';
                        Image = "Event";

                        trigger OnAction();
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromProdOrderComp(Rec, ItemAvailFormsMgt.ByEvent);
                        end;
                    }
                    action(Period)
                    {
                        CaptionML = ENU = 'Period',
                                    ENN = 'Period';
                        Image = Period;

                        trigger OnAction();
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromProdOrderComp(Rec, ItemAvailFormsMgt.ByPeriod);
                        end;
                    }
                    action(Variant)
                    {
                        CaptionML = ENU = 'Variant',
                                    ENN = 'Variant';
                        Image = ItemVariant;

                        trigger OnAction();
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromProdOrderComp(Rec, ItemAvailFormsMgt.ByVariant);
                        end;
                    }
                    action(Location)
                    {
                        AccessByPermission = TableData Location = R;
                        CaptionML = ENU = 'Location',
                                    ENN = 'Location';
                        Image = Warehouse;

                        trigger OnAction();
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromProdOrderComp(Rec, ItemAvailFormsMgt.ByLocation);
                        end;
                    }
                    action("BOM Level")
                    {
                        CaptionML = ENU = 'BOM Level',
                                    ENN = 'BOM Level';
                        Image = BOMLevel;

                        trigger OnAction();
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromProdOrderComp(Rec, ItemAvailFormsMgt.ByBOM);
                        end;
                    }
                }
                action("Co&mments")
                {
                    CaptionML = ENU = 'Co&mments',
                                ENN = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Prod. Order Comp. Cmt. Sheet";
                    RunPageLink = Status = FIELD(Status), Prod. Order No.=FIELD(Prod. Order No.),Prod. Order Line No.=FIELD(Prod. Order Line No.),Prod. Order BOM Line No.=FIELD(Line No.);
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
                        ShowDimensions;
                        CurrPage.SAVERECORD;
                    end;
                }
                action(ItemTrackingLines)
                {
                    CaptionML = ENU='Item &Tracking Lines',
                                ENN='Item &Tracking Lines';
                    Image = ItemTrackingLines;
                    ShortCutKey = 'Shift+Ctrl+I';

                    trigger OnAction();
                    begin
                        OpenItemTrackingLines;
                    end;
                }
                action("Bin Contents")
                {
                    CaptionML = ENU='Bin Contents',
                                ENN='Bin Contents';
                    Image = BinContent;
                    RunObject = Page "Bin Contents List";
                                    RunPageLink = Location Code=FIELD(Location Code),Item No.=FIELD(Item No.),Variant Code=FIELD(Variant Code);
                    RunPageView = SORTING(Location Code,Bin Code,Item No.,Variant Code);
                }
                action("&Select Item Substitution")
                {
                    AccessByPermission = TableData "Item Substitution"=R;
                    CaptionML = ENU='&Select Item Substitution',
                                ENN='&Select Item Substitution';
                    Image = SelectItemSubstitution;

                    trigger OnAction();
                    begin
                        CurrPage.SAVERECORD;

                        ShowItemSub;

                        CurrPage.UPDATE(TRUE);

                        AutoReserve;
                    end;
                }
                action("Put-away/Pick Lines/Movement Lines")
                {
                    CaptionML = ENU='Put-away/Pick Lines/Movement Lines',
                                ENN='Put-away/Pick Lines/Movement Lines';
                    Image = PutawayLines;
                    RunObject = Page "Warehouse Activity Lines";
                                    RunPageLink = Source Type=CONST(5407),Source Subtype=CONST(3),Source No.=FIELD(Prod. Order No.),Source Line No.=FIELD(Prod. Order Line No.),Source Subline No.=FIELD(Line No.);
                    RunPageView = SORTING(Source Type,Source Subtype,Source No.,Source Line No.,Source Subline No.,Unit of Measure Code,Action Type,Breakbulk No.,Original Breakbulk);
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
                action(Reserve)
                {
                    CaptionML = ENU='&Reserve',
                                ENN='&Reserve';
                    Image = Reserve;

                    trigger OnAction();
                    begin
                        IF Status IN [Status::Simulated,Status::Planned] THEN
                          ERROR(Text000,Status);

                        CurrPage.SAVERECORD;
                        ShowReservation;
                    end;
                }
                action(OrderTracking)
                {
                    CaptionML = ENU='Order &Tracking',
                                ENN='Order &Tracking';
                    Image = OrderTracking;

                    trigger OnAction();
                    var
                        TrackingPage : Page "Order Tracking";
                    begin
                        TrackingPage.SetProdOrderComponent(Rec);
                        TrackingPage.RUNMODAL;
                    end;
                }
            }
            action("&Print")
            {
                CaptionML = ENU='&Print',
                            ENN='&Print';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                var
                    ProdOrderComp : Record "Prod. Order Component";
                begin
                    ProdOrderComp.COPY(Rec);
                    REPORT.RUNMODAL(REPORT::"Prod. Order - Picking List",TRUE,TRUE,ProdOrderComp);
                end;
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        ShowShortcutDimCode(ShortcutDimCode);

        "Prod.OrderLine".SETRANGE(Status,Status);
        "Prod.OrderLine".SETRANGE("Prod. Order No.","Prod. Order No.");
        "Prod.OrderLine".SETRANGE("Line No.","Prod. Order Line No.");
        IF "Prod.OrderLine".FINDFIRST THEN
          "Source No." := "Prod.OrderLine"."Item No.";
    end;

    trigger OnDeleteRecord() : Boolean;
    var
        ReserveProdOrderComp : Codeunit "Prod. Order Comp.-Reserve";
    begin
        ERROR('You Cannot Delete Prod. Order Components!'); //Added By Pranavi on 23-09-2015
        COMMIT;
        IF NOT ReserveProdOrderComp.DeleteLineConfirm(Rec) THEN
          EXIT(FALSE);
        ReserveProdOrderComp.DeleteLine(Rec);
    end;

    trigger OnInsertRecord(BelowxRec : Boolean) : Boolean;
    begin
        ERROR('You Cannot insert Prod. Order Components!'); //Added By Pranavi on 23-09-2015
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        CLEAR(ShortcutDimCode);
    end;

    var
        Text000 : TextConst ENU='You cannot reserve components with status %1.',ENN='You cannot reserve components with status %1.';
        ItemAvailFormsMgt : Codeunit "Item Availability Forms Mgt";
        ShortcutDimCode : array [8] of Code[20];
        "Prod.OrderLine" : Record "Prod. Order Line";

    (24178)]
    local procedure ReserveComp();
    var
        Item : Record Item;
    begin
        IF (xRec."Remaining Qty. (Base)" <> "Remaining Qty. (Base)") OR
           (xRec."Item No." <> "Item No.") OR
           (xRec."Location Code" <> "Location Code")
        THEN
          IF Item.GET("Item No.") THEN
            IF Item.Reserve = Item.Reserve::Always THEN BEGIN
              CurrPage.SAVERECORD;
              AutoReserve;
              CurrPage.UPDATE(FALSE);
            END;
    end;

    (24190)]
    local procedure ItemNoOnAfterValidate();
    begin
        ReserveComp;
    end;

    (24193)]
    local procedure Scrap37OnAfterValidate();
    begin
        ReserveComp;
    end;

    (24196)]
    local procedure CalculationFormulaOnAfterValid();
    begin
        ReserveComp;
    end;

    (24199)]
    local procedure LengthOnAfterValidate();
    begin
        ReserveComp;
    end;

    (24202)]
    local procedure WidthOnAfterValidate();
    begin
        ReserveComp;
    end;

    (24205)]
    local procedure WeightOnAfterValidate();
    begin
        ReserveComp;
    end;

    (24208)]
    local procedure DepthOnAfterValidate();
    begin
        ReserveComp;
    end;

    (24211)]
    local procedure QuantityperOnAfterValidate();
    begin
        ReserveComp;
    end;

    (24214)]
    local procedure UnitofMeasureCodeOnAfterValida();
    begin
        ReserveComp;
    end;

    (24217)]
    local procedure LocationCodeOnAfterValidate();
    begin
        ReserveComp;
    end;
}

