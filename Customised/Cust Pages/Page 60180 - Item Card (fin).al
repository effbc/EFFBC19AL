page 60180 "Item Card (fin)"
{
    // version NAVW13.70,NAVIN3.70.01.11,QC1.0,QCB2B1.2,B2B1.0,QC1.2,Rev01

    Caption = 'Item Card';
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = Item;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; "No.")
                {
                    Editable = false;

                    trigger OnAssistEdit();
                    begin
                        IF AssistEdit THEN
                            CurrPage.UPDATE;
                    end;
                }
                field(Description; Description)
                {
                    Editable = false;
                }
                field("Description 2"; "Description 2")
                {
                    Editable = false;
                }
                field("Base Unit of Measure"; "Base Unit of Measure")
                {
                    Editable = false;
                }
                field("Assembly BOM"; "Assembly BOM")
                {
                    Editable = false;
                }
                field("Shelf No."; "Shelf No.")
                {
                    Editable = false;
                }
                field("Automatic Ext. Texts"; "Automatic Ext. Texts")
                {
                    Editable = false;
                }
                field("Item Category Code"; "Item Category Code")
                {
                    Editable = false;
                }
                field("Product Group Code"; "Product Group Code")
                {
                    Editable = false;
                }
                field("Item Sub Group Code"; "Item Sub Group Code")
                {
                    Editable = false;
                }
                field("Item Sub Sub Group Code"; "Item Sub Sub Group Code")
                {
                    Editable = false;
                }
                field(Inventory; Inventory)
                {
                    Editable = false;
                }
                field("Quantity Under Inspection"; "Quantity Under Inspection")
                {
                    Editable = false;
                }
                field("Quantity Sent for Rework"; "Quantity Sent for Rework")
                {
                    Editable = false;
                }
                field("Quantity Rejected"; "Quantity Rejected")
                {
                    Editable = false;
                }
                field("Quantity Accepted"; "Quantity Accepted")
                {
                    DrillDown = true;
                    Editable = false;

                    trigger OnDrillDown();
                    var
                        ItemLedgEntry: Record "Item Ledger Entry";
                        QualityItemLedgEntry: Record "Quality Item Ledger Entry";
                    begin
                        //B2BQC 1.1

                        CALCFIELDS("Quantity Under Inspection", "Quantity Rejected", "Quantity Rework", "Quantity Sent for Rework");
                        IF "QC Enabled" = TRUE THEN BEGIN
                            IF ("Quantity Under Inspection" = 0) AND ("Quantity Rejected" = 0) AND ("Quantity Rework" = 0) AND ("Quantity Sent for Rework" = 0) THEN BEGIN
                                ItemLedgEntry.SETRANGE("Item No.", "No.");
                                ItemLedgEntry.SETRANGE(Open, TRUE);
                                PAGE.RUNMODAL(38, ItemLedgEntry);
                            END ELSE BEGIN
                                ItemLedgEntry.RESET;
                                ItemLedgEntry.SETRANGE("Item No.", "No.");
                                ItemLedgEntry.SETRANGE(Open, TRUE);
                                IF ItemLedgEntry.FINDSET THEN
                                    REPEAT
                                        ItemLedgEntry.MARK(TRUE);
                                        IF QualityItemLedgEntry.GET(ItemLedgEntry."Entry No.") THEN
                                            ItemLedgEntry.MARK(FALSE);
                                    UNTIL ItemLedgEntry.NEXT = 0;
                                ItemLedgEntry.MARKEDONLY(TRUE);
                                PAGE.RUNMODAL(38, ItemLedgEntry);
                            END;
                        END;
                    end;
                }
                field("Quantity Rework"; "Quantity Rework")
                {
                    Editable = false;
                }
                field("Qty. on Purch. Order"; "Qty. on Purch. Order")
                {
                    Editable = false;
                }
                field("Qty. on Prod. Order"; "Qty. on Prod. Order")
                {
                    Editable = false;
                }
                field("Qty. on Component Lines"; "Qty. on Component Lines")
                {
                    Editable = false;
                }
                field("Qty. on Sales Order"; "Qty. on Sales Order")
                {
                    Editable = false;
                }
                field("Qty. on Service Order"; "Qty. on Service Order")
                {
                    Editable = false;
                }
                field("Service Item Group"; "Service Item Group")
                {
                    Editable = false;
                }
                field(Blocked; Blocked)
                {
                    Editable = false;
                }
                field("Last Date Modified"; "Last Date Modified")
                {
                    Editable = false;
                }
                field(Sample; Sample)
                {
                    Editable = false;
                }
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';
                field("Costing Method"; "Costing Method")
                {
                    Editable = false;
                }
                field(AverageCostLCY; AverageCostLCY)
                {
                    AutoFormatType = 2;
                    Caption = 'Average Cost (LCY)';
                    Editable = false;

                    trigger OnDrillDown();
                    begin
                        CODEUNIT.RUN(CODEUNIT::"Show Avg. Calc. - Item", Rec);
                    end;
                }
                field("Standard Cost"; "Standard Cost")
                {
                    Editable = false;
                }
                field("Unit Cost"; "Unit Cost")
                {
                    Editable = false;
                }
                field("Overhead Rate"; "Overhead Rate")
                {
                    Editable = false;
                }
                field("Indirect Cost %"; "Indirect Cost %")
                {
                    Editable = false;
                }
                field("Last Direct Cost"; "Last Direct Cost")
                {
                    Editable = false;
                }
                field("Price/Profit Calculation"; "Price/Profit Calculation")
                {
                    Editable = false;
                }
                field("Profit %"; "Profit %")
                {
                    Editable = false;
                }
                field("Unit Price"; "Unit Price")
                {
                    Editable = false;
                }
                field("Capital Item"; "Capital Item")
                {
                    Editable = false;
                }
                field("Gen. Prod. Posting Group"; "Gen. Prod. Posting Group")
                {
                }
                field("Excise Prod. Posting Group"; "Excise Prod. Posting Group")
                {
                }
                field("Inventory Posting Group"; "Inventory Posting Group")
                {
                }
                field("VAT Prod. Posting Group"; "VAT Prod. Posting Group")
                {
                }
                field("Net Invoiced Qty."; "Net Invoiced Qty.")
                {
                }
                field("Allow Invoice Disc."; "Allow Invoice Disc.")
                {
                }
                field("Item Disc. Group"; "Item Disc. Group")
                {
                }
                field("Sales Unit of Measure"; "Sales Unit of Measure")
                {
                }
                field("Excise Accounting Type"; "Excise Accounting Type")
                {
                }
                field("Assessable Value"; "Assessable Value")
                {
                }
                field("Tax Group Code"; "Tax Group Code")
                {
                }
                group(GST)
                {
                    Caption = 'GST';
                    field("GST Group Code"; "GST Group Code")
                    {
                    }
                    field("GST Credit"; "GST Credit")
                    {
                    }
                    field("HSN/SAC Code"; "HSN/SAC Code")
                    {
                    }
                    field(Exempted; Exempted)
                    {
                    }
                }
            }
            group(Replenishment)
            {
                Caption = 'Replenishment';
                field("Replenishment System"; "Replenishment System")
                {
                    Editable = false;
                    OptionCaption = 'Purchase,Prod. Order';
                }
                field("Vendor No."; "Vendor No.")
                {
                    Editable = false;
                }
                field("Vendor Item No."; "Vendor Item No.")
                {
                    Editable = false;
                }
                field("Purch. Unit of Measure"; "Purch. Unit of Measure")
                {
                    Editable = false;
                }
                field("Lead Time Calculation"; "Lead Time Calculation")
                {
                    Editable = false;
                }
                group(Production)
                {
                    Caption = 'Production';
                    field("Manufacturing Policy"; "Manufacturing Policy")
                    {
                        Editable = false;
                    }
                    field("Routing No."; "Routing No.")
                    {
                        Editable = false;
                    }
                    field("Production BOM No."; "Production BOM No.")
                    {
                        Editable = false;
                    }
                    field("Rounding Precision"; "Rounding Precision")
                    {
                        Editable = false;
                    }
                    field("Flushing Method"; "Flushing Method")
                    {
                        Editable = false;
                    }
                    field("Scrap %"; "Scrap %")
                    {
                        Editable = false;
                    }
                    field("Lot Size"; "Lot Size")
                    {
                        Editable = false;
                    }
                }
            }
            group(Planning)
            {
                Caption = 'Planning';
                field("Reordering Policy"; "Reordering Policy")
                {
                    Editable = false;

                    trigger OnValidate();
                    begin
                        EnablePlanningControls
                    end;
                }
                field("Include Inventory"; "Include Inventory")
                {
                    Editable = false;
                    Enabled = "Include InventoryEnable";
                }
                field(Reserve; Reserve)
                {
                    Editable = false;
                }
                field("Order Tracking Policy"; "Order Tracking Policy")
                {
                    Editable = false;
                }
                field("Stockkeeping Unit Exists"; "Stockkeeping Unit Exists")
                {
                    Editable = false;
                }
                field(Critical; Critical)
                {
                    Editable = false;
                }
                field("Type of Solder"; "Type of Solder")
                {
                    Editable = false;
                }
                field("No. of Soldering Points"; "No. of Soldering Points")
                {
                    Editable = false;
                }
                field("No. of Pins"; "No. of Pins")
                {
                    Editable = false;
                }
                field("No. of Opportunities"; "No. of Opportunities")
                {
                    Editable = false;
                }
                field("No.of Fixing Holes"; "No.of Fixing Holes")
                {
                    Editable = false;
                }
                field("Time Bucket"; "Time Bucket")
                {
                    Editable = false;
                    Enabled = "Reorder CycleEnable";
                }
                field("Safety Lead Time"; "Safety Lead Time")
                {
                    Editable = false;
                    Enabled = "Safety Lead TimeEnable";
                }
                field("Lead Time Modified Date"; "Lead Time Modified Date")
                {
                }
                field("Safety Stock Quantity"; "Safety Stock Quantity")
                {
                    Editable = false;
                    Enabled = "Safety Stock QuantityEnable";
                }
                field("Reorder Point"; "Reorder Point")
                {
                    Editable = false;
                    Enabled = "Reorder PointEnable";
                }
                field("Reorder Quantity"; "Reorder Quantity")
                {
                    Editable = false;
                    Enabled = "Reorder QuantityEnable";
                }
                field("Maximum Inventory"; "Maximum Inventory")
                {
                    Editable = false;
                    Enabled = "Maximum InventoryEnable";
                }
                field("Minimum Order Quantity"; "Minimum Order Quantity")
                {
                    Editable = false;
                    Enabled = "Minimum Order QuantityEnable";
                }
                field("Maximum Order Quantity"; "Maximum Order Quantity")
                {
                    Editable = false;
                    Enabled = "Maximum Order QuantityEnable";
                }
                field("Order Multiple"; "Order Multiple")
                {
                    Editable = false;
                    Enabled = "Order MultipleEnable";
                }
            }
            group("Foreign Trade")
            {
                Caption = 'Foreign Trade';
                field("Tariff No."; "Tariff No.")
                {
                    Editable = false;
                }
                field("Country/Region of Origin Code"; "Country/Region of Origin Code")
                {
                    Editable = false;
                }
            }
            group("Item Tracking")
            {
                Caption = 'Item Tracking';
                field("Item Tracking Code"; "Item Tracking Code")
                {
                    Editable = false;
                }
                field("Serial Nos."; "Serial Nos.")
                {
                    Editable = false;
                }
                field("Lot Nos."; "Lot Nos.")
                {
                    Editable = false;
                }
                field("Expiration Calculation"; "Expiration Calculation")
                {
                    Editable = false;
                }
            }
            group("Commerce Portal")
            {
                Caption = 'Commerce Portal';
                field(ProdOrderExist; ProdOrderExist)
                {
                    Editable = false;
                }
            }
            group(Warehouse)
            {
                Caption = 'Warehouse';
                field("Special Equipment Code"; "Special Equipment Code")
                {
                    Editable = false;
                }
                field("Put-away Template Code"; "Put-away Template Code")
                {
                    Editable = false;
                }
                field("Put-away Unit of Measure Code"; "Put-away Unit of Measure Code")
                {
                    Editable = false;
                }
                field("Phys Invt Counting Period Code"; "Phys Invt Counting Period Code")
                {
                    Editable = false;
                }
                field("Last Phys. Invt. Date"; "Last Phys. Invt. Date")
                {
                    Editable = false;
                }
                field("Last Counting Period Update"; "Last Counting Period Update")
                {
                    Editable = false;
                }
                field("Identifier Code"; "Identifier Code")
                {
                    Editable = false;
                }
                field("Use Cross-Docking"; "Use Cross-Docking")
                {
                    Editable = false;
                }
            }
            group(Quality)
            {
                Caption = 'Quality';
                field("Spec ID"; "Spec ID")
                {
                    Editable = false;
                }
                field("QC Enabled"; "QC Enabled")
                {
                    Editable = false;
                }
                field("Insp. Time Inbound(In Min.)"; "Insp. Time Inbound(In Min.)")
                {
                    Editable = false;
                }
                field("WIP Spec ID"; "WIP Spec ID")
                {
                    Editable = false;
                }
                field("WIP QC Enabled"; "WIP QC Enabled")
                {
                    Editable = false;
                }
                field("Insp. Time WIP(In Min.)"; "Insp. Time WIP(In Min.)")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Quality")
            {
                Caption = '&Quality';
                group(Inspection)
                {
                    Caption = 'Inspection';
                    Image = QualificationOverview;
                    action("Inspection Data Sheets")
                    {
                        Caption = 'Inspection Data Sheets';
                        Image = Worksheet;
                        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedCategory = Process;

                        trigger OnAction();
                        begin
                            ShowDataSheets;
                        end;
                    }
                    action("Posted Inspection Data Sheets")
                    {
                        Caption = 'Posted Inspection Data Sheets';
                        Image = PostedShipment;

                        trigger OnAction();
                        begin
                            ShowPostDataSheets;
                        end;
                    }
                    action("Inspection &Receipts")
                    {
                        Caption = 'Inspection &Receipts';
                        Image = Receipt;

                        trigger OnAction();
                        begin
                            ShowInspectReceipt;
                        end;
                    }
                    action("Posted I&nspection Receipts")
                    {
                        Caption = 'Posted I&nspection Receipts';
                        Image = PostedReceipt;

                        trigger OnAction();
                        begin
                            ShowPostInspectReceipt;
                        end;
                    }
                }
                separator(Action1102152054)
                {
                }
                action("Create Inspection Data &Sheets")
                {
                    Caption = 'Create Inspection Data &Sheets';
                    Image = CreateDocument;

                    trigger OnAction();
                    begin
                        TESTFIELD("Quantity Accepted");
                        CreateInspectionDataSheets;
                    end;
                }
            }
            group("&Item")
            {
                Caption = '&Item';
                action("Stockkeepin&g Units")
                {
                    Caption = 'Stockkeepin&g Units';
                    Image = SKU;
                    RunObject = Page "Stockkeeping Unit List";
                    RunPageLink = Item No.=FIELD(No.);
                    RunPageView = SORTING(Item No.);
                }
                group("E&ntries")
                {
                    Caption = 'E&ntries';
                    Image = Entries;
                    action("Ledger E&ntries")
                    {
                        Caption = 'Ledger E&ntries';
                        Image = ItemLedger;
                        RunObject = Page "Item Ledger Entries";
                                        RunPageLink = Item No.=FIELD(No.);
                        RunPageView = SORTING(Item No.);
                        ShortCutKey = 'Ctrl+F7';
                    }
                    action("&Reservation Entries")
                    {
                        Caption = '&Reservation Entries';
                        Image = ReservationLedger;
                        RunObject = Page "Reservation Entries";
                                        RunPageLink = Reservation Status=CONST(Reservation),Item No.=FIELD(No.);
                        RunPageView = SORTING(Reservation Status,Item No.,Variant Code,Location Code);
                    }
                    action("&Phys. Inventory Ledger Entries")
                    {
                        Caption = '&Phys. Inventory Ledger Entries';
                        Image = PhysicalInventoryLedger;
                        RunObject = Page "Phys. Inventory Ledger Entries";
                                        RunPageLink = Item No.=FIELD(No.);
                        RunPageView = SORTING(Item No.);
                    }
                    action("&Value Entries")
                    {
                        Caption = '&Value Entries';
                        Image = ValueLedger;
                        RunObject = Page "Value Entries";
                                        RunPageLink = Item No.=FIELD(No.);
                        RunPageView = SORTING(Item No.);
                    }
                    action("&Quality Ledger Entries")
                    {
                        Caption = '&Quality Ledger Entries';
                        RunObject = Page "Quality Ledger Entries";
                                        RunPageLink = Item No.=FIELD(No.);
                    }
                    action("Item &Tracking Entries")
                    {
                        Caption = 'Item &Tracking Entries';
                        Image = ItemTrackingLedger;

                        trigger OnAction();
                        var
                            ItemTrackingDocMgt : Codeunit "Item Tracking Doc. Management";
                        begin
                            ItemTrackingDocMgt.ShowItemTrackingForMasterData(3,'',"No.",'','','','');
                        end;
                    }
                }
                group(Statistics)
                {
                    Caption = 'Statistics';
                    Image = Statistics;
                    action(Action107)
                    {
                        Caption = 'Statistics';
                        Image = Statistics;
                        ShortCutKey = 'F7';

                        trigger OnAction();
                        var
                            ItemStatistics : Page "Item Statistics";
                        begin
                            ItemStatistics.SetItem(Rec);
                            ItemStatistics.RUNMODAL;
                        end;
                    }
                    action("Entry Statistics")
                    {
                        Caption = 'Entry Statistics';
                        Image = EntryStatistics;
                        RunObject = Page "Item Entry Statistics";
                                        RunPageLink = No.=FIELD(No.),Date Filter=FIELD(Date Filter),Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter),Location Filter=FIELD(Location Filter),Drop Shipment Filter=FIELD(Drop Shipment Filter),Variant Filter=FIELD(Variant Filter);
                    }
                    action("T&urnover")
                    {
                        Caption = 'T&urnover';
                        Image = Turnover;
                        RunObject = Page "Item Turnover";
                                        RunPageLink = No.=FIELD(No.),Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter),Location Filter=FIELD(Location Filter),Drop Shipment Filter=FIELD(Drop Shipment Filter),Variant Filter=FIELD(Variant Filter);
                    }
                }
                action("Items b&y Location")
                {
                    Caption = 'Items b&y Location';
                    Image = ItemAvailbyLoc;

                    trigger OnAction();
                    var
                        ItemsByLocation : Page "Items by Location";
                    begin
                        ItemsByLocation.SETRECORD(Rec);
                        ItemsByLocation.RUN;
                    end;
                }
                group("&Item Availability by")
                {
                    Caption = '&Item Availability by';
                    Image = ItemAvailability;
                    action(Period)
                    {
                        Caption = 'Period';
                        Image = Period;
                        RunObject = Page "Item Availability by Periods";
                                        RunPageLink = No.=FIELD(No.),Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter),Location Filter=FIELD(Location Filter),Drop Shipment Filter=FIELD(Drop Shipment Filter),Variant Filter=FIELD(Variant Filter);
                    }
                    action(Variant)
                    {
                        Caption = 'Variant';
                        Image = ItemVariant;
                        RunObject = Page "Item Availability by Variant";
                                        RunPageLink = No.=FIELD(No.),Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter),Location Filter=FIELD(Location Filter),Drop Shipment Filter=FIELD(Drop Shipment Filter),Variant Filter=FIELD(Variant Filter);
                    }
                    action(Location)
                    {
                        Caption = 'Location';
                        Image = Warehouse;
                        RunObject = Page "Item Availability by Location";
                                        RunPageLink = No.=FIELD(No.),Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter),Location Filter=FIELD(Location Filter),Drop Shipment Filter=FIELD(Drop Shipment Filter),Variant Filter=FIELD(Variant Filter);
                    }
                }
                action("&Bin Contents")
                {
                    Caption = '&Bin Contents';
                    Image = BOMLevel;
                    RunObject = Page "Item Bin Contents";
                                    RunPageLink = Item No.=FIELD(No.),Unit of Measure Code=FIELD(Base Unit of Measure);
                    RunPageView = SORTING(Item No.);
                }
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Image = Comment;
                    RunObject = Page "Comment Sheet";
                                    RunPageLink = Table Name=CONST(Item),No.=FIELD(No.);
                }
                action(Dimensions)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                                    RunPageLink = Table ID=CONST(27),No.=FIELD(No.);
                    ShortCutKey = 'Shift+Ctrl+D';
                }
                action("&Picture")
                {
                    Caption = '&Picture';
                    Image = Picture;
                    RunObject = Page "Item Picture";
                                    RunPageLink = No.=FIELD(No.),Date Filter=FIELD(Date Filter),Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter),Location Filter=FIELD(Location Filter),Drop Shipment Filter=FIELD(Drop Shipment Filter),Variant Filter=FIELD(Variant Filter);
                }
                separator(Action113)
                {
                }
                action("&Units of Measure")
                {
                    Caption = '&Units of Measure';
                    Image = UnitOfMeasure;
                    RunObject = Page "Item Units of Measure";
                                    RunPageLink = Item No.=FIELD(No.);
                }
                action("Va&riants")
                {
                    Caption = 'Va&riants';
                    Image = ItemVariant;
                    RunObject = Page "Item Variants";
                                    RunPageLink = Item No.=FIELD(No.);
                }
                action("Cross Re&ferences")
                {
                    Caption = 'Cross Re&ferences';
                    Image = Change;
                    RunObject = Page "Item Cross Reference Entries";
                                    RunPageLink = Item No.=FIELD(No.);
                }
                action("Substituti&ons")
                {
                    Caption = 'Substituti&ons';
                    Image = ItemSubstitution;
                    RunObject = Page "Item Substitution Entry";
                                    RunPageLink = Type=CONST(Item),No.=FIELD(No.);
                }
                action("Nonstoc&k Items")
                {
                    Caption = 'Nonstoc&k Items';
                    Image = NonStockItem;
                    RunObject = Page "Nonstock Item List";
                }
                separator(Action115)
                {
                }
                action(Translations)
                {
                    Caption = 'Translations';
                    Image = Translations;
                    RunObject = Page "Item Translations";
                                    RunPageLink = Item No.=FIELD(No.);
                }
                action("E&xtended Texts")
                {
                    Caption = 'E&xtended Texts';
                    Image = Text;
                    RunObject = Page "Extended Text";
                                    RunPageLink = Table Name=CONST(Item),No.=FIELD(No.);
                    RunPageView = SORTING(Table Name    DataClassification = CustomerContent;
,No.,Language Code,All Language Codes,Starting Date,Ending Date);
                }
                separator(Action120)
                {
                }
                group("Assembly List")
                {
                    Caption = 'Assembly List';
                    Image = AssemblyBOM;
                    action("Bill of Materials")
                    {
                        Caption = 'Bill of Materials';
                        RunObject = Page "Assembly BOM";
                                        RunPageLink = Parent Item No.=FIELD(No.);
                    }
                    action("Where-Used List")
                    {
                        Caption = 'Where-Used List';
                        RunObject = Page "Where-Used List";
                                        RunPageLink = Type=CONST(Item),No.=FIELD(No.);
                        RunPageView = SORTING(Type,No.);
                    }
                    action("Calc. Stan&dard Cost")
                    {
                        Caption = 'Calc. Stan&dard Cost';

                        trigger OnAction();
                        begin
                            CalculateStdCost.CalcItem("No.",TRUE);
                        end;
                    }
                }
                group("Manufa&cturing")
                {
                    Caption = 'Manufa&cturing';
                    Image = Production;
                    action("Where-Used")
                    {
                        Caption = 'Where-Used';
                        Image = "Where-Used";

                        trigger OnAction();
                        var
                            ProdBOMWhereUsed : Page "Prod. BOM Where-Used";
                        begin
                            ProdBOMWhereUsed.SetItem(Rec,WORKDATE);
                            ProdBOMWhereUsed.RUNMODAL;
                        end;
                    }
                    action(Action123)
                    {
                        Caption = 'Calc. Stan&dard Cost';
                        Image = CalculateCost;

                        trigger OnAction();
                        begin
                            CalculateStdCost.CalcItem("No.",FALSE);
                        end;
                    }
                }
                separator(Action182)
                {
                    Caption = '""';
                }
                action("Ser&vice Items")
                {
                    Caption = 'Ser&vice Items';
                    Image = ServiceItem;
                    RunObject = Page "Service Items";
                                    RunPageLink = Item No.=FIELD(No.);
                    RunPageView = SORTING(Item No.);
                }
                group("Troubles&hooting")
                {
                    Caption = 'Troubles&hooting';
                    Image = Debug;
                    action("Troubleshooting &Setup")
                    {
                        Caption = 'Troubleshooting &Setup';
                        RunObject = Page "Troubleshooting Setup";
                                        RunPageLink = Type=CONST(Item),No.=FIELD(No.);
                    }
                    action(Action186)
                    {
                        Caption = 'Troubles&hooting';

                        trigger OnAction();
                        begin
                            TroubleshHeader.ShowForItem(Rec);
                        end;
                    }
                }
                group("R&esource")
                {
                    Caption = 'R&esource';
                    Image = Resource;
                    action("Resource Skills")
                    {
                        Caption = 'Resource Skills';
                        Image = ResourceSkills;
                        RunObject = Page "Resource Skills";
                                        RunPageLink = Type=CONST(Item),No.=FIELD(No.);
                    }
                    action("Skilled Resources")
                    {
                        Caption = 'Skilled Resources';
                        Image = ResourceGroup;

                        trigger OnAction();
                        begin
                            CLEAR(SkilledResourceList);
                            //SkilledResourceList.InitializeForItem(Rec);//B@B
                            SkilledResourceList.RUNMODAL;
                        end;
                    }
                }
                separator(Action217)
                {
                }
                action(Identifiers)
                {
                    Caption = 'Identifiers';
                    Image = SerialNo;
                    RunObject = Page "Item Identifiers";
                                    RunPageLink = Item No.=FIELD(No.);
                    RunPageView = SORTING(Item No.,Variant Code,Unit of Measure Code);
                }
                action(Specifications)
                {
                    Caption = 'Specifications';
                    Image = ItemVariant;
                    RunObject = Page "Item Specification";
                                    RunPageLink = Item No.=FIELD(No.),Product Group Code=FIELD(Product Group Code),Item Category Code=FIELD(Item Category Code),Item Sub Group Code=FIELD(Item Sub Group Code),Item Sub Sub Group Code=FIELD(Item Sub Sub Group Code);

                    trigger OnAction();
                    var
                        ItemSpecification : Record "Item Specification";
                        DuplicateItems : Record "Alternate Items";
                    begin
                        /*DuplicateItems.DELETEALL;
                        DuplicateItems.INIT;
                        REPEAT
                          DuplicateItems."Proudct Type" := ItemSpecification."Item No.";
                         // DuplicateItems."Specification Code" := ItemSpecification."Specification Code";
                          DuplicateItems."Item No." := ItemSpecification.Value;
                          DuplicateItems."Item Description" := ItemSpecification."Product Group Code";
                          DuplicateItems."Alternative Item No." := ItemSpecification."Item Category Code";
                          DuplicateItems."Alternative Item Description" := ItemSpecification."Item Sub Group Code";
                          DuplicateItems.Make := ItemSpecification."Item Sub Sub Group Code";
                          DuplicateItems.INSERT;
                        UNTIL ItemSpecification.NEXT = 0;*/

                    end;
                }
            }
            group("S&ales")
            {
                Caption = 'S&ales';
                Image = Sales;
                action(Prices)
                {
                    Caption = 'Prices';
                    Image = Price;
                    RunObject = Page "Sales Prices";
                                    RunPageLink = Item No.=FIELD(No.);
                    RunPageView = SORTING(Item No.);
                }
                action("Line Discounts")
                {
                    Caption = 'Line Discounts';
                    Image = LineDiscount;
                    RunObject = Page "Sales Line Discounts";
                                    RunPageLink = Type=CONST(Item),Code=FIELD(No.);
                    RunPageView = SORTING(Type,Code);
                }
                separator(Action46)
                {
                }
                action(Orders)
                {
                    Caption = 'Orders';
                    Image = Document;
                    RunObject = Page "Sales Orders";
                                    RunPageLink = Type=CONST(Item),No.=FIELD(No.);
                    RunPageView = SORTING(Document Type,Type,No.);
                }
                action("Return Orders")
                {
                    Caption = 'Return Orders';
                    Image = ReturnOrder;
                    RunObject = Page "Sales Return Orders";
                                    RunPageLink = Type=CONST(Item),No.=FIELD(No.);
                    RunPageView = SORTING(Document Type,Type,No.);
                }
            }
            group("&Purchases")
            {
                Caption = '&Purchases';
                Image = Purchasing;
                action("Ven&dors")
                {
                    Caption = 'Ven&dors';
                    Image = Vendor;
                    RunObject = Page "Item Vendor Catalog";
                                    RunPageLink = Item No.=FIELD(No.);
                    RunPageView = SORTING(Item No.);
                }
                action(Action85)
                {
                    Caption = 'Prices';
                    Image = Price;
                    RunObject = Page "Purchase Prices";
                                    RunPageLink = Item No.=FIELD(No.);
                    RunPageView = SORTING(Item No.);
                }
                action(Action86)
                {
                    Caption = 'Line Discounts';
                    Image = LineDiscount;
                    RunObject = Page "Purchase Line Discounts";
                                    RunPageLink = Item No.=FIELD(No.);
                }
                separator(Action47)
                {
                }
                action(Action87)
                {
                    Caption = 'Orders';
                    Image = Document;
                    RunObject = Page "Purchase Orders";
                                    RunPageLink = Type=CONST(Item),No.=FIELD(No.);
                    RunPageView = SORTING(Document Type,Type,No.);
                }
                action(Action191)
                {
                    Caption = 'Return Orders';
                    Image = ReturnOrder;
                    RunObject = Page "Purchase Return Orders";
                                    RunPageLink = Type=CONST(Item),No.=FIELD(No.);
                    RunPageView = SORTING(Document Type,Type,No.);
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("&Create Stockkeeping Unit")
                {
                    Caption = '&Create Stockkeeping Unit';
                    Image = CreateSKU;

                    trigger OnAction();
                    var
                        Item : Record Item;
                    begin
                        Item.SETRANGE("No.","No.");
                        REPORT.RUNMODAL(REPORT::"Create Stockkeeping Unit",TRUE,FALSE,Item);
                    end;
                }
                action("C&alculate Counting Period")
                {
                    Caption = 'C&alculate Counting Period';
                    Image = CalculateCalendar;

                    trigger OnAction();
                    var
                        PhysInvtCountMgt : Codeunit "Phys. Invt. Count.-Management";
                    begin
                        PhysInvtCountMgt.UpdateItemPhysInvtCount(Rec);
                    end;
                }
                action("Update BOM")
                {
                    Caption = 'Update BOM';
                    Image = UpdateUnitCost;

                    trigger OnAction();
                    begin
                           ItemCostUpdation.UpdateBOM;
                    end;
                }
            }
            action("Item Lead time not modified")
            {

                trigger OnAction();
                begin
                    IF USERID IN ['EFFTRONICS\RENUKACH','EFFTRONICS\PARDHU','EFFTRONICS\BRAHMAIAH','EFFTRONICS\RAKESHT','EFFTRONICS\MNRAJU'] THEN
                    BEGIN
                      "Lead Time Modified Date" := TODAY;
                      MESSAGE('Modified');
                    END
                    ELSE
                      MESSAGE('You donot have rights to modify');
                end;
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        ItemCostMgt.CalculateAverageCost(Rec,AverageCostLCY,AverageCostACY);
        EnablePlanningControls;
        //B2B
        IF ("QC Enabled" = TRUE) AND (Inventory >= 0) THEN
          "Quantity Accepted" := Inventory - ("Quantity Rejected" + "Quantity Under Inspection" + "Quantity Rework" +
                                              "Quantity Sent for Rework");
        //B2B
    end;

    trigger OnInit();
    begin
        "Include InventoryEnable" := TRUE;
        "Order MultipleEnable" := TRUE;
        "Maximum Order QuantityEnable" := TRUE;
        "Minimum Order QuantityEnable" := TRUE;
        "Maximum InventoryEnable" := TRUE;
        "Reorder QuantityEnable" := TRUE;
        "Reorder PointEnable" := TRUE;
        "Safety Stock QuantityEnable" := TRUE;
        "Safety Lead TimeEnable" := TRUE;
        "Reorder CycleEnable" := TRUE;
    end;

    var
        TroubleshHeader : Record "Troubleshooting Header";
        ItemCostMgt : Codeunit ItemCostManagement;
        CalculateStdCost : Codeunit "Calculate Standard Cost";
        AverageCostLCY : Decimal;
        AverageCostACY : Decimal;
        ItemCostUpdation : Codeunit "Item Cost Updation";
        [InDataSet]
        "Reorder CycleEnable" : Boolean;
        [InDataSet]
        "Safety Lead TimeEnable" : Boolean;
        [InDataSet]
        "Safety Stock QuantityEnable" : Boolean;
        [InDataSet]
        "Reorder PointEnable" : Boolean;
        [InDataSet]
        "Reorder QuantityEnable" : Boolean;
        [InDataSet]
        "Maximum InventoryEnable" : Boolean;
        [InDataSet]
        "Minimum Order QuantityEnable" : Boolean;
        [InDataSet]
        "Maximum Order QuantityEnable" : Boolean;
        [InDataSet]
        "Order MultipleEnable" : Boolean;
        [InDataSet]
        "Include InventoryEnable" : Boolean;
        SkilledResourceList : Page "Skilled Resource List";

    (14290)]
    procedure EnablePlanningControls();
    var
        PlanningGetParam: Codeunit "Planning-Get Parameters";
        ReorderCycleEnabled: Boolean;
        SafetyLeadTimeEnabled: Boolean;
        SafetyStockQtyEnabled: Boolean;
        ReorderPointEnabled: Boolean;
        ReorderQuantityEnabled: Boolean;
        MaximumInventoryEnabled: Boolean;
        MinimumOrderQtyEnabled: Boolean;
        MaximumOrderQtyEnabled: Boolean;
        OrderMultipleEnabled: Boolean;
        IncludeInventoryEnabled: Boolean;
        ReschedulingPeriodEnabled: Boolean;
        LotAccumulationPeriodEnabled: Boolean;
        DampenerPeriodEnabled: Boolean;
        DampenerQuantityEnabled: Boolean;
        OverflowLevelEnabled: Boolean;
    begin
        //B2b1.0>>
        /*PlanningGetParam.SetUpPlanningControls("Reordering Policy","Include Inventory",
          ReorderCycleEnabled,SafetyLeadTimeEnabled,SafetyStockQtyEnabled,
          ReorderPointEnabled,ReorderQuantityEnabled,MaximumInventoryEnabled,
          MinimumOrderQtyEnabled,MaximumOrderQtyEnabled,OrderMultipleEnabled,IncludeInventoryEnabled);*/

        PlanningGetParam.SetUpPlanningControls("Reordering Policy", "Include Inventory",
          ReorderCycleEnabled, SafetyLeadTimeEnabled, SafetyStockQtyEnabled,
          ReorderPointEnabled, ReorderQuantityEnabled, MaximumInventoryEnabled,
          MinimumOrderQtyEnabled, MaximumOrderQtyEnabled, OrderMultipleEnabled, IncludeInventoryEnabled, ReschedulingPeriodEnabled,
          LotAccumulationPeriodEnabled, DampenerPeriodEnabled, DampenerQuantityEnabled, OverflowLevelEnabled);
        //B2b1.0<<

        "Reorder CycleEnable" := ReorderCycleEnabled;
        "Safety Lead TimeEnable" := SafetyLeadTimeEnabled;
        "Safety Stock QuantityEnable" := SafetyStockQtyEnabled;
        "Reorder PointEnable" := ReorderPointEnabled;
        "Reorder QuantityEnable" := ReorderQuantityEnabled;
        "Maximum InventoryEnable" := MaximumInventoryEnabled;
        "Minimum Order QuantityEnable" := MinimumOrderQtyEnabled;
        "Maximum Order QuantityEnable" := MaximumOrderQtyEnabled;
        "Order MultipleEnable" := OrderMultipleEnabled;
        "Include InventoryEnable" := IncludeInventoryEnabled;

    end;

    (14315)]
    local procedure AverageCostLCYOnActivate();
    begin
        ItemCostMgt.CalculateAverageCost(Rec, AverageCostLCY, AverageCostACY);
    end;
}

