page 60172 "Item List(Manu)"
{
    // version Rev01

    // <changelog>
    //     <change releaseversion="IN6.00"/>
    // </changelog>

    CaptionML = ENU = 'Item List',
                ENN = 'Item List';
    CardPageID = "Item Card (manu)";
    Editable = true;
    PageType = List;
    ShowFilter = true;
    SourceTable = Item;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("No."; "No.")
                {
                    Editable = false;
                    StyleExpr = "No.Format";
                }
                field(Description; Description)
                {
                    Editable = false;
                    Style = Ambiguous;
                    StyleExpr = DescriptionEmphasize;
                }
                field("Description 2"; "Description 2")
                {
                }
                field(Package; Package)
                {
                }
                field(EFF_MOQ; EFF_MOQ)
                {
                }
                field("Stock at RD Stores"; "Stock at RD Stores")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Qty. on Purch. Order"; "Qty. on Purch. Order")
                {
                }
                field("Packing Type"; "Packing Type")
                {
                }
                field("Packing Dimension"; "Packing Dimension")
                {
                }
                field("Stock at CS Stores"; "Stock at CS Stores")
                {
                    Editable = false;
                }
                field("Stock at PROD Stores"; "Stock at PROD Stores")
                {
                    Editable = false;
                }
                field("Item Final Cost"; "Item Final Cost")
                {
                    Editable = false;
                }
                field("Item Location"; "Item Location")
                {
                    Editable = false;
                }
                field(Make; Make)
                {
                    Editable = false;
                }
                field("Part Number"; "Part Number")
                {
                    Editable = false;
                }
                field("Quantity Rejected"; "Quantity Rejected")
                {
                    Editable = false;
                }
                field("Operating Temperature"; "Operating Temperature")
                {
                    Editable = false;
                }
                field("Storage Temperature"; "Storage Temperature")
                {
                    Editable = false;
                }
                field(Humidity; Humidity)
                {
                    Editable = false;
                }
                field("ESD Sensitive"; "ESD Sensitive")
                {
                    Editable = false;
                }
                field("Standard Packing Quantity"; "Standard Packing Quantity")
                {
                    Editable = false;
                }
                field("Minimum Order Quantity"; "Minimum Order Quantity")
                {
                    Editable = true;
                }
                field("Item Status"; "Item Status")
                {
                    Editable = false;
                }
                field("Order Multiple"; "Order Multiple")
                {
                }
                field("Safety Stock Quantity"; "Safety Stock Quantity")
                {
                    Editable = false;
                }
                field("Safety Stock Qty (CS)"; "Safety Stock Qty (CS)")
                {
                }
                field("Safety Lead Time"; "Safety Lead Time")
                {
                    Editable = true;
                }
                field(ESD; ESD)
                {
                    Editable = false;
                }
                field("Soldering Time (Sec)"; "Soldering Time (Sec)")
                {
                    Editable = false;
                }
                field("Work area Temp &  Humadity"; "Work area Temp &  Humadity")
                {
                    Editable = false;
                }
                field("Soldering Temp."; "Soldering Temp.")
                {
                    Editable = false;
                }
                field("Stockkeeping Unit Exists"; "Stockkeeping Unit Exists")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Assembly BOM"; "Assembly BOM")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Production BOM No."; "Production BOM No.")
                {
                    Editable = false;
                }
                field("Routing No."; "Routing No.")
                {
                    Editable = false;
                }
                field("Base Unit of Measure"; "Base Unit of Measure")
                {
                    Editable = false;
                }
                field("Substitutes Exist"; "Substitutes Exist")
                {
                    Editable = false;
                }
                field("Shelf No."; "Shelf No.")
                {
                    Visible = false;
                }
                field("Costing Method"; "Costing Method")
                {
                    Visible = false;
                }
                field("Cost is Adjusted"; "Cost is Adjusted")
                {
                }
                field("Standard Cost"; "Standard Cost")
                {
                    Visible = false;
                }
                field("Unit Cost"; "Unit Cost")
                {
                    Editable = false;
                }
                field("Last Direct Cost"; "Last Direct Cost")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Price/Profit Calculation"; "Price/Profit Calculation")
                {
                    Visible = false;
                }
                field("Profit %"; "Profit %")
                {
                    Visible = false;
                }
                field("Unit Price"; "Unit Price")
                {
                    Editable = false;
                }
                field("Inventory Posting Group"; "Inventory Posting Group")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Gen. Prod. Posting Group"; "Gen. Prod. Posting Group")
                {
                    Editable = false;
                    Visible = false;
                }
                field("VAT Prod. Posting Group"; "VAT Prod. Posting Group")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Item Disc. Group"; "Item Disc. Group")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Vendor No."; "Vendor No.")
                {
                    Editable = false;
                }
                field("Vendor Item No."; "Vendor Item No.")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Tariff No."; "Tariff No.")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Search Description"; "Search Description")
                {
                    Editable = false;
                }
                field("Overhead Rate"; "Overhead Rate")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Indirect Cost %"; "Indirect Cost %")
                {
                    Visible = false;
                }
                field("Item Category Code"; "Item Category Code")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Product Group Code"; "Product Group Code")
                {
                    Editable = false;
                    Visible = false;
                }
                field("User ID"; "User ID")
                {
                }
                field(Blocked; Blocked)
                {
                    Editable = false;
                    Visible = false;
                }
                field("Last Date Modified"; "Last Date Modified")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Sales Unit of Measure"; "Sales Unit of Measure")
                {
                    Visible = false;
                }
                field("Replenishment System"; "Replenishment System")
                {
                    Visible = false;
                }
                field("Purch. Unit of Measure"; "Purch. Unit of Measure")
                {
                    Visible = false;
                }
                field("Lead Time Calculation"; "Lead Time Calculation")
                {
                    Visible = false;
                }
                field("Manufacturing Policy"; "Manufacturing Policy")
                {
                    Visible = false;
                }
                field("Flushing Method"; "Flushing Method")
                {
                    Visible = false;
                }
                field("Assembly Policy"; "Assembly Policy")
                {
                    Visible = false;
                }
                field("Item Tracking Code"; "Item Tracking Code")
                {
                    Visible = false;
                }
                field("No.of Units"; "No.of Units")
                {
                }
                field(PROD_USED; PROD_USED)
                {
                }
                field("Quantity Under Inspection"; "Quantity Under Inspection")
                {
                    Visible = false;
                }
                field("Created From Nonstock Item"; "Created From Nonstock Item")
                {
                    Visible = false;
                }
                field("Stock At MCH Location"; "Stock At MCH Location")
                {
                    Visible = false;
                }
                field(Item_verified; Item_verified)
                {
                }
                field(PCB; PCB)
                {
                    Editable = true;
                }
                field("Avg Unit Cost"; "Avg Unit Cost")
                {
                }
                field("No.of Fixing Holes"; "No.of Fixing Holes")
                {
                }
                field(Inventory; Inventory)
                {
                    Visible = false;
                }
                field("Inventory at Stores"; "Inventory at Stores")
                {
                    Visible = false;
                }
                field("Tax Group Code"; "Tax Group Code")
                {
                }
                field("Excise Prod. Posting Group"; "Excise Prod. Posting Group")
                {
                }
                field("QC Enabled"; "QC Enabled")
                {
                }
                field("Spec ID"; "Spec ID")
                {
                }
                field("WIP QC Enabled"; "WIP QC Enabled")
                {
                }
                field("WIP Spec ID"; "WIP Spec ID")
                {
                }
                field("Item Sub Group Code"; "Item Sub Group Code")
                {
                }
                field("Item Sub Sub Group Code"; "Item Sub Sub Group Code")
                {
                }
                field("No. of Pins"; "No. of Pins")
                {
                }
                field("No. of Soldering Points"; "No. of Soldering Points")
                {
                }
                field("Type of Solder"; "Type of Solder")
                {
                }
                field("PCB thickness"; "PCB thickness")
                {
                }
                field("Copper Clad Thickness"; "Copper Clad Thickness")
                {
                }
                field("PCB Shape"; "PCB Shape")
                {
                }
                field(Length; Length)
                {
                }
                field(Width; Width)
                {
                }
                field("PCB Area"; "PCB Area")
                {
                }
                field("Surface Finish"; "Surface Finish")
                {
                }
                field("Semi Mounted"; "Semi Mounted")
                {
                }
                field("No. of Opportunities"; "No. of Opportunities")
                {
                }
                field("Capital Item"; "Capital Item")
                {
                }
                field("On C-Side"; "On C-Side")
                {
                    Caption = 'C-side Solder Mask';
                }
                field("On D-Side"; "On D-Side")
                {
                    Caption = 'D-side Solder Mask';
                }
                field("On S-Side"; "On S-Side")
                {
                    Caption = 'S-side Solder Mask';
                }
                field("Qty. on Prod. Order"; "Qty. on Prod. Order")
                {
                }
                field(ROHS; ROHS)
                {
                }
                field("Qty. on Sales Order"; "Qty. on Sales Order")
                {
                }
                field("CS IGC"; "CS IGC")
                {
                }
                field("Item Grp Verified Date"; "Item Grp Verified Date")
                {
                }
                field(Sample; Sample)
                {
                }
                field("BIN Address"; "BIN Address")
                {
                }
                field("Stock Address"; "Stock Address")
                {
                }
                field("Stock at Stores"; "Stock at Stores")
                {
                }
                field(MSL; MSL)
                {
                }
                field("ESD Class"; "ESD Class")
                {
                }
                field("Feeder Packing Width(mm)"; "Feeder Packing Width(mm)")
                {
                }
                field("Feeder Packing Type"; "Feeder Packing Type")
                {
                }
                field("Floor Life at 25 C 40% RH"; "Floor Life at 25 C 40% RH")
                {
                }
                field("Bake Hours"; "Bake Hours")
                {
                }
                field("Component Shelf Life(Years)"; "Component Shelf Life(Years)")
                {
                }
                field("MRP Price"; "MRP Price")
                {
                }
                field("Dispatch Material"; "Dispatch Material")
                {
                }
                field("Thickness of Package"; "Thickness of Package")
                {
                }
                field(Stock_Threshold_Value; Stock_Threshold_Value)
                {
                }
                field("Quote Item"; "Quote Item")
                {
                }
                field("Next Counting Start Date"; "Next Counting Start Date")
                {
                }
            }
            group(Control1102152011)
            {
                ShowCaption = false;
                grid(Control1102152010)
                {
                    ShowCaption = false;
                    group(Control1102152008)
                    {
                        ShowCaption = false;
                        field("Rec.COUNT"; Rec.COUNT)
                        {
                        }
                    }
                    group(Control1102152007)
                    {
                        ShowCaption = false;
                        field(Color_QCflag; Color_QCflag)
                        {
                            Editable = false;
                            Style = Unfavorable;
                            StyleExpr = TRUE;
                        }
                    }
                    group(Control1102152005)
                    {
                        ShowCaption = false;
                        field(Color_Attachment; Color_Attachment)
                        {
                            Editable = false;
                            Style = StrongAccent;
                            StyleExpr = TRUE;
                        }
                    }
                    group(Control1102152002)
                    {
                        ShowCaption = false;
                        field(Color_obsolete; Color_obsolete)
                        {
                            Editable = false;
                            Style = Ambiguous;
                            StyleExpr = TRUE;
                        }
                    }
                    group(Control1102152042)
                    {
                        ShowCaption = false;
                        field(bom_status_running; bom_status_running)
                        {
                            Style = Favorable;
                            StyleExpr = TRUE;
                        }
                    }
                    group(Control1102152045)
                    {
                        ShowCaption = false;
                        field(bom_status_old; bom_status_old)
                        {
                            Style = Subordinate;
                            StyleExpr = TRUE;
                        }
                    }
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Availability)
            {
                CaptionML = ENU = 'Availability',
                            ENN = 'Availability';
                Image = Item;
                action("Items b&y Location")
                {
                    CaptionML = ENU = 'Items b&y Location',
                                ENN = 'Items b&y Location';
                    Image = ItemAvailbyLoc;

                    trigger OnAction();
                    var
                        ItemsByLocation: Page "Items by Location";
                    begin
                        ItemsByLocation.SETRECORD(Rec);
                        ItemsByLocation.RUN;
                    end;
                }
                group("&Item Availability by")
                {
                    CaptionML = ENU = '&Item Availability by',
                                ENN = '&Item Availability by';
                    Image = ItemAvailability;
                    action("<Action5>")
                    {
                        CaptionML = ENU = 'Event',
                                    ENN = 'Event';
                        Image = "Event";

                        trigger OnAction();
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromItem(Rec, ItemAvailFormsMgt.ByEvent);
                        end;
                    }
                    action(Period)
                    {
                        CaptionML = ENU = 'Period',
                                    ENN = 'Period';
                        Image = Period;
                        RunObject = Page "Item Availability by Periods";
                        RunPageLink = No.=FIELD(No.),Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter),Location Filter=FIELD(Location Filter),Drop Shipment Filter=FIELD(Drop Shipment Filter),Variant Filter=FIELD(Variant Filter);
                    }
                    action(Variant)
                    {
                        CaptionML = ENU='Variant',
                                    ENN='Variant';
                        Image = ItemVariant;
                        RunObject = Page "Item Availability by Variant";
                                        RunPageLink = No.=FIELD(No.),Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter),Location Filter=FIELD(Location Filter),Drop Shipment Filter=FIELD(Drop Shipment Filter),Variant Filter=FIELD(Variant Filter);
                    }
                    action(Location)
                    {
                        CaptionML = ENU='Location',
                                    ENN='Location';
                        Image = Warehouse;
                        RunObject = Page "Item Availability by Location";
                                        RunPageLink = No.=FIELD(No.),Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter),Location Filter=FIELD(Location Filter),Drop Shipment Filter=FIELD(Drop Shipment Filter),Variant Filter=FIELD(Variant Filter);
                    }
                    action("BOM Level")
                    {
                        CaptionML = ENU='BOM Level',
                                    ENN='BOM Level';
                        Image = BOMLevel;

                        trigger OnAction();
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromItem(Rec,ItemAvailFormsMgt.ByBOM);
                        end;
                    }
                    action(Timeline)
                    {
                        CaptionML = ENU='Timeline',
                                    ENN='Timeline';
                        Image = Timeline;

                        trigger OnAction();
                        begin
                            ShowTimelineFromItem(Rec);
                        end;
                    }
                }
            }
            group("Master Data")
            {
                CaptionML = ENU='Master Data',
                            ENN='Master Data';
                Image = DataEntry;
                action("&Units of Measure")
                {
                    CaptionML = ENU='&Units of Measure',
                                ENN='&Units of Measure';
                    Image = UnitOfMeasure;
                    RunObject = Page "Item Units of Measure";
                                    RunPageLink = Item No.=FIELD(No.);
                }
                action("Va&riants")
                {
                    CaptionML = ENU='Va&riants',
                                ENN='Va&riants';
                    Image = ItemVariant;
                    RunObject = Page "Item Variants";
                                    RunPageLink = Item No.=FIELD(No.);
                }
                group(Dimensions)
                {
                    CaptionML = ENU='Dimensions',
                                ENN='Dimensions';
                    Image = Dimensions;
                    action("Dimensions-Single")
                    {
                        CaptionML = ENU='Dimensions-Single',
                                    ENN='Dimensions-Single';
                        Image = Dimensions;
                        RunObject = Page "Default Dimensions";
                                        RunPageLink = Table ID=CONST(27),No.=FIELD(No.);
                        ShortCutKey = 'Shift+Ctrl+D';
                    }
                    action("Dimensions-&Multiple")
                    {
                        CaptionML = ENU='Dimensions-&Multiple',
                                    ENN='Dimensions-&Multiple';
                        Image = DimensionSets;

                        trigger OnAction();
                        var
                            Item : Record Item;
                            DefaultDimMultiple : Page "Default Dimensions-Multiple";
                        begin
                            CurrPage.SETSELECTIONFILTER(Item);
                            DefaultDimMultiple.SetMultiItem(Item);
                            DefaultDimMultiple.RUNMODAL;
                        end;
                    }
                }
                action("Substituti&ons")
                {
                    CaptionML = ENU='Substituti&ons',
                                ENN='Substituti&ons';
                    Image = ItemSubstitution;
                    RunObject = Page "Item Substitution Entry";
                                    RunPageLink = Type=CONST(Item),No.=FIELD(No.);
                }
                action("Cross Re&ferences")
                {
                    CaptionML = ENU='Cross Re&ferences',
                                ENN='Cross Re&ferences';
                    Image = Change;
                    RunObject = Page "Item Cross Reference Entries";
                                    RunPageLink = Item No.=FIELD(No.);
                }
                action("E&xtended Texts")
                {
                    CaptionML = ENU='E&xtended Texts',
                                ENN='E&xtended Texts';
                    Image = Text;
                    RunObject = Page "Extended Text List";
                                    RunPageLink = Table Name=CONST(Item),No.=FIELD(No.);
                    RunPageView = SORTING(Table Name    DataClassification = CustomerContent;
,No.,Language Code,All Language Codes,Starting Date,Ending Date);
                }
                action(Translations)
                {
                    CaptionML = ENU='Translations',
                                ENN='Translations';
                    Image = Translations;
                    RunObject = Page "Item Translations";
                                    RunPageLink = Item No.=FIELD(No.),Variant Code=CONST();
                }
                action("&Picture")
                {
                    CaptionML = ENU='&Picture',
                                ENN='&Picture';
                    Image = Picture;
                    RunObject = Page "Item Picture";
                                    RunPageLink = No.=FIELD(No.),Date Filter=FIELD(Date Filter),Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter),Location Filter=FIELD(Location Filter),Drop Shipment Filter=FIELD(Drop Shipment Filter),Variant Filter=FIELD(Variant Filter);
                }
                action(Identifiers)
                {
                    CaptionML = ENU='Identifiers',
                                ENN='Identifiers';
                    Image = BarCode;
                    RunObject = Page "Item Identifiers";
                                    RunPageLink = Item No.=FIELD(No.);
                    RunPageView = SORTING(Item No.,Variant Code,Unit of Measure Code);
                }
                action("ECC No./Item Categories")
                {
                    CaptionML = ENU='ECC No./Item Categories',
                                ENN='ECC No./Item Categories';
                    RunObject = Page "ECC No./Item Categories";
                                    RunPageLink = Item No.=FIELD(No.);
                }
            }
            group("Assembly/Production")
            {
                CaptionML = ENU='Assembly/Production',
                            ENN='Assembly/Production';
                Image = Production;
                action(Structure)
                {
                    CaptionML = ENU='Structure',
                                ENN='Structure';
                    Image = Hierarchy;

                    trigger OnAction();
                    var
                        BOMStructure : Page "BOM Structure";
                    begin
                        BOMStructure.InitItem(Rec);
                        BOMStructure.RUN;
                    end;
                }
                action("Alternate Items")
                {
                    Caption = 'Alternate Items';

                    trigger OnAction();
                    begin
                         Alternate_items.SETRANGE(Alternate_items."Item No.","No.");
                         PAGE.RUN(60070,Alternate_items);
                    end;
                }
                action("Cost Shares")
                {
                    CaptionML = ENU='Cost Shares',
                                ENN='Cost Shares';
                    Image = CostBudget;

                    trigger OnAction();
                    var
                        BOMCostShares : Page "BOM Cost Shares";
                    begin
                        BOMCostShares.InitItem(Rec);
                        BOMCostShares.RUN;
                    end;
                }
                group("Assemb&ly")
                {
                    CaptionML = ENU='Assemb&ly',
                                ENN='Assemb&ly';
                    Image = AssemblyBOM;
                    action("<Action32>")
                    {
                        CaptionML = ENU='Assembly BOM',
                                    ENN='Assembly BOM';
                        Image = BOM;
                        RunObject = Page "Assembly BOM";
                                        RunPageLink = Parent Item No.=FIELD(No.);
                    }
                    action("Where-Used")
                    {
                        CaptionML = ENU='Where-Used',
                                    ENN='Where-Used';
                        Image = Track;
                        RunObject = Page "Where-Used List";
                                        RunPageLink = Type=CONST(Item),No.=FIELD(No.);
                        RunPageView = SORTING(Type,No.);
                    }
                    action("Calc. Stan&dard Cost")
                    {
                        CaptionML = ENU='Calc. Stan&dard Cost',
                                    ENN='Calc. Stan&dard Cost';
                        Image = CalculateCost;

                        trigger OnAction();
                        begin
                            CalculateStdCost.CalcItem("No.",TRUE);
                        end;
                    }
                    action("Calc. Unit Price")
                    {
                        CaptionML = ENU='Calc. Unit Price',
                                    ENN='Calc. Unit Price';
                        Image = SuggestItemPrice;

                        trigger OnAction();
                        begin
                            CalculateStdCost.CalcAssemblyItemPrice("No.");
                        end;
                    }
                }
                group(Production)
                {
                    CaptionML = ENU='Production',
                                ENN='Production';
                    Image = Production;
                    action("Production BOM")
                    {
                        CaptionML = ENU='Production BOM',
                                    ENN='Production BOM';
                        Image = BOM;
                        RunObject = Page "Production BOM";
                                        RunPageLink = No.=FIELD(No.);
                    }
                    action(Action29)
                    {
                        CaptionML = ENU='Where-Used',
                                    ENN='Where-Used';
                        Image = "Where-Used";

                        trigger OnAction();
                        var
                            ProdBOMWhereUsed : Page "Prod. BOM Where-Used";
                        begin
                            ProdBOMWhereUsed.SetItem(Rec,WORKDATE);
                            ProdBOMWhereUsed.RUNMODAL;
                        end;
                    }
                    action(Action24)
                    {
                        CaptionML = ENU='Calc. Stan&dard Cost',
                                    ENN='Calc. Stan&dard Cost';
                        Image = CalculateCost;

                        trigger OnAction();
                        begin
                            CalculateStdCost.CalcItem("No.",FALSE);
                        end;
                    }
                }
            }
            group(History)
            {
                CaptionML = ENU='History',
                            ENN='History';
                Image = History;
                group("E&ntries")
                {
                    CaptionML = ENU='E&ntries',
                                ENN='E&ntries';
                    Image = Entries;
                    action("Ledger E&ntries")
                    {
                        CaptionML = ENU='Ledger E&ntries',
                                    ENN='Ledger E&ntries';
                        Image = ItemLedger;
                        Promoted = false;
                        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedCategory = Process;
                        RunObject = Page "Item Ledger Entries";
                                        RunPageLink = Item No.=FIELD(No.);
                        RunPageView = SORTING(Item No.);
                        ShortCutKey = 'Ctrl+F7';
                    }
                    action("&Reservation Entries")
                    {
                        CaptionML = ENU='&Reservation Entries',
                                    ENN='&Reservation Entries';
                        Image = ReservationLedger;
                        RunObject = Page "Reservation Entries";
                                        RunPageLink = Reservation Status=CONST(Reservation),Item No.=FIELD(No.);
                        RunPageView = SORTING(Item No.,Variant Code,Location Code,Reservation Status);
                    }
                    action("&Phys. Inventory Ledger Entries")
                    {
                        CaptionML = ENU='&Phys. Inventory Ledger Entries',
                                    ENN='&Phys. Inventory Ledger Entries';
                        Image = PhysicalInventoryLedger;
                        RunObject = Page "Phys. Inventory Ledger Entries";
                                        RunPageLink = Item No.=FIELD(No.);
                        RunPageView = SORTING(Item No.);
                    }
                    action("&Value Entries")
                    {
                        CaptionML = ENU='&Value Entries',
                                    ENN='&Value Entries';
                        Image = ValueLedger;
                        RunObject = Page "Value Entries";
                                        RunPageLink = Item No.=FIELD(No.);
                        RunPageView = SORTING(Item No.);
                    }
                    action("Item &Tracking Entries")
                    {
                        CaptionML = ENU='Item &Tracking Entries',
                                    ENN='Item &Tracking Entries';
                        Image = ItemTrackingLedger;

                        trigger OnAction();
                        var
                            ItemTrackingDocMgt : Codeunit "Item Tracking Doc. Management";
                        begin
                            ItemTrackingDocMgt.ShowItemTrackingForMasterData(3,'',"No.",'','','','');
                        end;
                    }
                    action("&Warehouse Entries")
                    {
                        CaptionML = ENU='&Warehouse Entries',
                                    ENN='&Warehouse Entries';
                        Image = BinLedger;
                        RunObject = Page "Warehouse Entries";
                                        RunPageLink = Item No.=FIELD(No.);
                        RunPageView = SORTING(Item No.,Bin Code,Location Code,Variant Code,Unit of Measure Code,Lot No.,Serial No.,Entry Type,Dedicated);
                    }
                }
                group(Statistics)
                {
                    CaptionML = ENU='Statistics',
                                ENN='Statistics';
                    Image = Statistics;
                    action(Action16)
                    {
                        CaptionML = ENU='Statistics',
                                    ENN='Statistics';
                        Image = Statistics;
                        Promoted = true;
                        PromotedCategory = Process;
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
                        CaptionML = ENU='Entry Statistics',
                                    ENN='Entry Statistics';
                        Image = EntryStatistics;
                        RunObject = Page "Item Entry Statistics";
                                        RunPageLink = No.=FIELD(No.),Date Filter=FIELD(Date Filter),Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter),Location Filter=FIELD(Location Filter),Drop Shipment Filter=FIELD(Drop Shipment Filter),Variant Filter=FIELD(Variant Filter);
                    }
                    action("T&urnover")
                    {
                        CaptionML = ENU='T&urnover',
                                    ENN='T&urnover';
                        Image = Turnover;
                        RunObject = Page "Item Turnover";
                                        RunPageLink = No.=FIELD(No.),Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter),Location Filter=FIELD(Location Filter),Drop Shipment Filter=FIELD(Drop Shipment Filter),Variant Filter=FIELD(Variant Filter);
                    }
                }
                action("Co&mments")
                {
                    CaptionML = ENU='Co&mments',
                                ENN='Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                                    RunPageLink = Table Name=CONST(Item),No.=FIELD(No.);
                }
                action("Item Specifications")
                {
                    Caption = 'Item Specifications';
                    RunObject = Page "Item Specification";
                                    RunPageLink = Item No.=FIELD(No.),Product Group Code=FIELD(Product Group Code),Item Category Code=FIELD(Item Category Code),Item Sub Group Code=FIELD(Item Sub Group Code),Item Sub Sub Group Code=FIELD(Item Sub Sub Group Code);
                }
            }
            group("S&ales")
            {
                CaptionML = ENU='S&ales',
                            ENN='S&ales';
                Image = Sales;
                action(Prices)
                {
                    CaptionML = ENU='Prices',
                                ENN='Prices';
                    Image = Price;
                    RunObject = Page "Sales Prices";
                                    RunPageLink = Item No.=FIELD(No.);
                    RunPageView = SORTING(Item No.);
                }
                action("Line Discounts")
                {
                    CaptionML = ENU='Line Discounts',
                                ENN='Line Discounts';
                    Image = LineDiscount;
                    RunObject = Page "Sales Line Discounts";
                                    RunPageLink = Type=CONST(Item),Code=FIELD(No.);
                    RunPageView = SORTING(Type,Code);
                }
                action("Prepa&yment Percentages")
                {
                    CaptionML = ENU='Prepa&yment Percentages',
                                ENN='Prepa&yment Percentages';
                    Image = PrepaymentPercentages;
                    RunObject = Page "Sales Prepayment Percentages";
                                    RunPageLink = Item No.=FIELD(No.);
                }
                action(Orders)
                {
                    CaptionML = ENU='Orders',
                                ENN='Orders';
                    Image = Document;
                    RunObject = Page "Sales Orders";
                                    RunPageLink = Type=CONST(Item),No.=FIELD(No.);
                    RunPageView = SORTING(Document Type,Type,No.);
                }
                action("Returns Orders")
                {
                    CaptionML = ENU='Returns Orders',
                                ENN='Returns Orders';
                    Image = ReturnOrder;
                    RunObject = Page "Sales Return Orders";
                                    RunPageLink = Type=CONST(Item),No.=FIELD(No.);
                    RunPageView = SORTING(Document Type,Type,No.);
                }
            }
            group("&Purchases")
            {
                CaptionML = ENU='&Purchases',
                            ENN='&Purchases';
                Image = Purchasing;
                action("Ven&dors")
                {
                    CaptionML = ENU='Ven&dors',
                                ENN='Ven&dors';
                    Image = Vendor;
                    RunObject = Page "Item Vendor Catalog";
                                    RunPageLink = Item No.=FIELD(No.);
                    RunPageView = SORTING(Item No.);
                }
                action(Action39)
                {
                    CaptionML = ENU='Prices',
                                ENN='Prices';
                    Image = Price;
                    RunObject = Page "Purchase Prices";
                                    RunPageLink = Item No.=FIELD(No.);
                    RunPageView = SORTING(Item No.);
                }
                action(Action42)
                {
                    CaptionML = ENU='Line Discounts',
                                ENN='Line Discounts';
                    Image = LineDiscount;
                    RunObject = Page "Purchase Line Discounts";
                                    RunPageLink = Item No.=FIELD(No.);
                    RunPageView = SORTING(Item No.);
                }
                action(Action125)
                {
                    CaptionML = ENU='Prepa&yment Percentages',
                                ENN='Prepa&yment Percentages';
                    Image = PrepaymentPercentages;
                    RunObject = Page "Purchase Prepmt. Percentages";
                                    RunPageLink = Item No.=FIELD(No.);
                }
                action(Action40)
                {
                    CaptionML = ENU='Orders',
                                ENN='Orders';
                    Image = Document;
                    RunObject = Page "Purchase Orders";
                                    RunPageLink = Type=CONST(Item),No.=FIELD(No.);
                    RunPageView = SORTING(Document Type,Type,No.);
                }
                action("Return Orders")
                {
                    CaptionML = ENU='Return Orders',
                                ENN='Return Orders';
                    Image = ReturnOrder;
                    RunObject = Page "Purchase Return Orders";
                                    RunPageLink = Type=CONST(Item),No.=FIELD(No.);
                    RunPageView = SORTING(Document Type,Type,No.);
                }
                action("Nonstoc&k Items")
                {
                    CaptionML = ENU='Nonstoc&k Items',
                                ENN='Nonstoc&k Items';
                    Image = NonStockItem;
                    RunObject = Page "Nonstock Item List";
                }
            }
            group(Warehouse)
            {
                CaptionML = ENU='Warehouse',
                            ENN='Warehouse';
                Image = Warehouse;
                action("&Bin Contents")
                {
                    CaptionML = ENU='&Bin Contents',
                                ENN='&Bin Contents';
                    Image = BinContent;
                    RunObject = Page "Item Bin Contents";
                                    RunPageLink = Item No.=FIELD(No.);
                    RunPageView = SORTING(Item No.);
                }
                action("Stockkeepin&g Units")
                {
                    CaptionML = ENU='Stockkeepin&g Units',
                                ENN='Stockkeepin&g Units';
                    Image = SKU;
                    RunObject = Page "Stockkeeping Unit List";
                                    RunPageLink = Item No.=FIELD(No.);
                    RunPageView = SORTING(Item No.);
                }
            }
            group(Service)
            {
                CaptionML = ENU='Service',
                            ENN='Service';
                Image = ServiceItem;
                action("Ser&vice Items")
                {
                    CaptionML = ENU='Ser&vice Items',
                                ENN='Ser&vice Items';
                    Image = ServiceItem;
                    RunObject = Page "Service Items";
                                    RunPageLink = Item No.=FIELD(No.);
                    RunPageView = SORTING(Item No.);
                }
                action(Troubleshooting)
                {
                    CaptionML = ENU='Troubleshooting',
                                ENN='Troubleshooting';
                    Image = Troubleshoot;

                    trigger OnAction();
                    var
                        TroubleshootingHeader : Record "Troubleshooting Header";
                    begin
                        TroubleshootingHeader.ShowForItem(Rec);
                    end;
                }
                action("Troubleshooting Setup")
                {
                    CaptionML = ENU='Troubleshooting Setup',
                                ENN='Troubleshooting Setup';
                    Image = Troubleshoot;
                    RunObject = Page "Troubleshooting Setup";
                                    RunPageLink = Type=CONST(Item),No.=FIELD(No.);
                }
            }
            group(Resources)
            {
                CaptionML = ENU='Resources',
                            ENN='Resources';
                Image = Resource;
                group("R&esource")
                {
                    CaptionML = ENU='R&esource',
                                ENN='R&esource';
                    Image = Resource;
                    action("Resource &Skills")
                    {
                        CaptionML = ENU='Resource &Skills',
                                    ENN='Resource &Skills';
                        Image = ResourceSkills;
                        RunObject = Page "Resource Skills";
                                        RunPageLink = Type=CONST(Item),No.=FIELD(No.);
                    }
                    action("Skilled R&esources")
                    {
                        CaptionML = ENU='Skilled R&esources',
                                    ENN='Skilled R&esources';
                        Image = ResourceSkills;

                        trigger OnAction();
                        var
                            ResourceSkill : Record "Resource Skill";
                        begin
                            CLEAR(SkilledResourceList);
                            SkilledResourceList.Initialize(ResourceSkill.Type::Item,"No.",Description);
                            SkilledResourceList.RUNMODAL;
                        end;
                    }
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
                action("&Create Stockkeeping Unit")
                {
                    CaptionML = ENU='&Create Stockkeeping Unit',
                                ENN='&Create Stockkeeping Unit';
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
                    CaptionML = ENU='C&alculate Counting Period',
                                ENN='C&alculate Counting Period';
                    Image = CalculateCalendar;

                    trigger OnAction();
                    var
                        PhysInvtCountMgt : Codeunit "Phys. Invt. Count.-Management";
                    begin
                        PhysInvtCountMgt.UpdateItemPhysInvtCount(Rec);
                    end;
                }
                action("Show MCH Shortage Material")
                {
                    Caption = 'Show MCH Shortage Material';

                    trigger OnAction();
                    begin
                         RESET;
                         SETFILTER("Product Group Code",'<>%1&%2','FPRODUCT','CPCB');
                         CALCFIELDS("Stock At MCH Location");
                         IF FINDSET THEN
                         REPEAT
                           IF "Stock At MCH Location"<"Safety Stock Qty (MCH)" THEN
                             MARK:=TRUE;
                         UNTIL NEXT=0;
                         MARKEDONLY;
                    end;
                }
            }
            action("Sales Prices")
            {
                CaptionML = ENU='Sales Prices',
                            ENN='Sales Prices';
                Image = SalesPrices;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Sales Prices";
                                RunPageLink = Item No.=FIELD(No.);
                RunPageView = SORTING(Item No.);
            }
            action("Purchase Prices")
            {
                CaptionML = ENU='Purchase Prices',
                            ENN='Purchase Prices';
                Image = Price;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Purchase Prices";
                                RunPageLink = Item No.=FIELD(No.);
                RunPageView = SORTING(Item No.);
            }
            action("Sales Line Discounts")
            {
                CaptionML = ENU='Sales Line Discounts',
                            ENN='Sales Line Discounts';
                Image = SalesLineDisc;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Sales Line Discounts";
                                RunPageLink = Type=CONST(Item),Code=FIELD(No.);
                RunPageView = SORTING(Type,Code);
            }
            action("Requisition Worksheet")
            {
                CaptionML = ENU='Requisition Worksheet',
                            ENN='Requisition Worksheet';
                Image = Worksheet;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Req. Worksheet";
            }
            action("Planning Worksheet")
            {
                CaptionML = ENU='Planning Worksheet',
                            ENN='Planning Worksheet';
                Image = PlanningWorksheet;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Planning Worksheet";
            }
            action("Item Journal")
            {
                CaptionML = ENU='Item Journal',
                            ENN='Item Journal';
                Image = Journals;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Item Journal";
            }
            action("Item Reclassification Journal")
            {
                CaptionML = ENU='Item Reclassification Journal',
                            ENN='Item Reclassification Journal';
                Image = Journals;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Item Reclass. Journal";
            }
            action("Item Tracing")
            {
                CaptionML = ENU='Item Tracing',
                            ENN='Item Tracing';
                Image = ItemTracing;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Item Tracing";
            }
            action("Adjust Item Cost/Price")
            {
                CaptionML = ENU='Adjust Item Cost/Price',
                            ENN='Adjust Item Cost/Price';
                Image = AdjustItemCost;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Report "Adjust Item Costs/Prices";
            }
            action("Adjust Cost - Item Entries")
            {
                CaptionML = ENU='Adjust Cost - Item Entries',
                            ENN='Adjust Cost - Item Entries';
                Image = AdjustEntries;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Report "Adjust Cost - Item Entries";
            }
        }
        area(reporting)
        {
            action("Inventory - List")
            {
                CaptionML = ENU='Inventory - List',
                            ENN='Inventory - List';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Inventory - List";
            }
            action("Item Register - Quantity")
            {
                CaptionML = ENU='Item Register - Quantity',
                            ENN='Item Register - Quantity';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Item Register - Quantity";
            }
            action("Inventory - Transaction Detail")
            {
                CaptionML = ENU='Inventory - Transaction Detail',
                            ENN='Inventory - Transaction Detail';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Inventory - Transaction Detail";
            }
            action("Inventory Availability")
            {
                CaptionML = ENU='Inventory Availability',
                            ENN='Inventory Availability';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Inventory Availability";
            }
            action(Status)
            {
                CaptionML = ENU='Status',
                            ENN='Status';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report Status;
            }
            action("Inventory - Availability Plan")
            {
                CaptionML = ENU='Inventory - Availability Plan',
                            ENN='Inventory - Availability Plan';
                Image = ItemAvailability;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Inventory - Availability Plan";
            }
            action("Inventory Order Details")
            {
                CaptionML = ENU='Inventory Order Details',
                            ENN='Inventory Order Details';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Item Wise LAR";
            }
            action("Inventory Purchase Orders")
            {
                CaptionML = ENU='Inventory Purchase Orders',
                            ENN='Inventory Purchase Orders';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Inventory Purchase Orders";
            }
            action("Inventory - Top 10 List")
            {
                CaptionML = ENU='Inventory - Top 10 List',
                            ENN='Inventory - Top 10 List';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Inventory - Top 10 List";
            }
            action("Inventory - Sales Statistics")
            {
                CaptionML = ENU='Inventory - Sales Statistics',
                            ENN='Inventory - Sales Statistics';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Inventory - Sales Statistics";
            }
            action("Assemble to Order - Sales")
            {
                CaptionML = ENU='Assemble to Order - Sales',
                            ENN='Assemble to Order - Sales';
                Image = "Report";
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Assemble to Order - Sales";
            }
            action("Inventory - Customer Sales")
            {
                CaptionML = ENU='Inventory - Customer Sales',
                            ENN='Inventory - Customer Sales';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Inventory - Customer Sales";
            }
            action("Inventory - Vendor Purchases")
            {
                CaptionML = ENU='Inventory - Vendor Purchases',
                            ENN='Inventory - Vendor Purchases';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Inventory - Vendor Purchases";
            }
            action("Price List")
            {
                CaptionML = ENU='Price List',
                            ENN='Price List';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Price List";
            }
            action("Inventory Cost and Price List")
            {
                CaptionML = ENU='Inventory Cost and Price List',
                            ENN='Inventory Cost and Price List';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Inventory Cost and Price List";
            }
            action("Inventory - Reorders")
            {
                CaptionML = ENU='Inventory - Reorders',
                            ENN='Inventory - Reorders';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Inventory - Reorders";
            }
            action("Inventory - Sales Back Orders")
            {
                CaptionML = ENU='Inventory - Sales Back Orders',
                            ENN='Inventory - Sales Back Orders';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Inventory - Sales Back Orders";
            }
            action("Item/Vendor Catalog")
            {
                CaptionML = ENU='Item/Vendor Catalog',
                            ENN='Item/Vendor Catalog';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Item/Vendor Catalog";
            }
            action("Inventory - Cost Variance")
            {
                CaptionML = ENU='Inventory - Cost Variance',
                            ENN='Inventory - Cost Variance';
                Image = ItemCosts;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Inventory - Cost Variance";
            }
            action("Phys. Inventory List")
            {
                CaptionML = ENU='Phys. Inventory List',
                            ENN='Phys. Inventory List';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Phys. Inventory List";
            }
            action("Inventory Valuation")
            {
                CaptionML = ENU='Inventory Valuation',
                            ENN='Inventory Valuation';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Inventory Valuation";
            }
            action("Nonstock Item Sales")
            {
                CaptionML = ENU='Nonstock Item Sales',
                            ENN='Nonstock Item Sales';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Nonstock Item Sales";
            }
            action("Item Substitutions")
            {
                CaptionML = ENU='Item Substitutions',
                            ENN='Item Substitutions';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Item Substitutions";
            }
            action("Invt. Valuation - Cost Spec.")
            {
                CaptionML = ENU='Invt. Valuation - Cost Spec.',
                            ENN='Invt. Valuation - Cost Spec.';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Invt. Valuation - Stk on Date";
            }
            action("Inventory Valuation - WIP")
            {
                CaptionML = ENU='Inventory Valuation - WIP',
                            ENN='Inventory Valuation - WIP';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Inventory Valuation - WIP";
            }
            action("Item Register - Value")
            {
                CaptionML = ENU='Item Register - Value',
                            ENN='Item Register - Value';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Item Register - Value";
            }
            action("Item Charges - Specification")
            {
                CaptionML = ENU='Item Charges - Specification',
                            ENN='Item Charges - Specification';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Item Charges - Specification";
            }
            action("Item Age Composition - Qty.")
            {
                CaptionML = ENU='Item Age Composition - Qty.',
                            ENN='Item Age Composition - Qty.';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Item Age Composition - Qty.";
            }
            action("Item Age Composition - Value")
            {
                CaptionML = ENU='Item Age Composition - Value',
                            ENN='Item Age Composition - Value';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Item Age Composition - Value";
            }
            action("Item Expiration - Quantity")
            {
                CaptionML = ENU='Item Expiration - Quantity',
                            ENN='Item Expiration - Quantity';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Item Expiration - Quantity";
            }
            action("Cost Shares Breakdown")
            {
                CaptionML = ENU='Cost Shares Breakdown',
                            ENN='Cost Shares Breakdown';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Cost Shares Breakdown";
            }
            action("Detailed Calculation")
            {
                CaptionML = ENU='Detailed Calculation',
                            ENN='Detailed Calculation';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Detailed Calculation";
            }
            action("Rolled-up Cost Shares")
            {
                CaptionML = ENU='Rolled-up Cost Shares',
                            ENN='Rolled-up Cost Shares';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Rolled-up Cost Shares";
            }
            action("Single-Level Cost Shares")
            {
                CaptionML = ENU='Single-Level Cost Shares',
                            ENN='Single-Level Cost Shares';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Single-level Cost Shares";
            }
            action("Where Used (Top Level)")
            {
                CaptionML = ENU='Where Used (Top Level)',
                            ENN='Where Used (Top Level)';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Where-Used (Top Level)";
            }
            action("Quantity Explosion of BOM")
            {
                CaptionML = ENU='Quantity Explosion of BOM',
                            ENN='Quantity Explosion of BOM';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Quantity Explosion of BOM";
            }
            action("Compare List")
            {
                CaptionML = ENU='Compare List',
                            ENN='Compare List';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Compare List";
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        NoOnFormat;
        DescriptionOnFormat;
    end;

    trigger OnOpenPage();
    begin
        Color_QCflag :='Has QC Flag';
        Color_Attachment:= 'Has Attachment';
        Color_obsolete:= 'Is Obsolete';
        bom_status_running := 'Running Bom';
        bom_status_old := 'Old Bom';
    end;

    var
        SkilledResourceList : Page "Skilled Resource List";
                                  CalculateStdCost : Codeunit "Calculate Standard Cost";
                                  ItemAvailFormsMgt : Codeunit "Item Availability Forms Mgt";
                                  user : Record User;
                                  Alternate_items : Record "Alternate Items";
                                  IRH : Record "Inspection Receipt Header";
    [InDataSet]

    "No.Emphasize" : Boolean;
        [InDataSet]
        DescriptionEmphasize : Boolean;
        "No.Format" : Text;
        Attachment : Record Attachments;
        Color_QCflag : Text;
        Color_Attachment : Text;
        Color_obsolete : Text;
        bom_status_running : Text;
        bom_status_old : Text;
        PBH : Record "Production BOM Header";

    (13735)]
    procedure GetSelectionFilter() : Text;
    var
        Item : Record Item;
        SelectionFilterManagement : Codeunit SelectionFilterManagement;
    begin
        CurrPage.SETSELECTIONFILTER(Item);
        EXIT(SelectionFilterManagement.GetSelectionFilterForItem(Item));
    end;

    (13739)]
    procedure SetSelection(var Item : Record Item);
    begin
        CurrPage.SETSELECTIONFILTER(Item);
    end;

    (13742)]
    local procedure NoOnFormat();
    begin
           //Rev01 Begin
          IRH.RESET;
          IRH.SETCURRENTKEY("Item No.",Status,Flag);  //Rev01
          IRH.SETFILTER(IRH."Item No.","No.");
          IRH.SETRANGE(IRH.Status,TRUE);
          IRH.SETRANGE(IRH.Flag,TRUE);
          IF IRH.FINDFIRST THEN
            "No.Format" :='Unfavorable'
          ELSE
          BEGIN
            "No.Format" :='None';
            //"No.Emphasize" := NOT (IRH.ISEMPTY)
            //Rev01 End
            Attachment.RESET;
            Attachment.SETRANGE("Table ID",DATABASE::Item);
            Attachment.SETRANGE("Document No.","No.");
            Attachment.SETRANGE(Attachment."Attachment Status",TRUE);
            IF Attachment.FINDFIRST THEN
            BEGIN
              "No.Format":='StrongAccent';
              //"No.Emphasize" :='StrongAccent';
            END
            ELSE
              "No.Format":='None';
          END;
          PBH.RESET;
          PBH.SETFILTER("No.",Rec."No.");
          PBH.SETFILTER("BOM Running Status",'Running');
          IF PBH.FINDSET THEN
            BEGIN
              IF PBH."BOM Running Status" = PBH."BOM Running Status"::Running THEN
                "No.Format":='Favorable'
               ELSE
                "No.Format":='None';
                END;
          PBH.RESET;
          PBH.SETFILTER("No.",Rec."No.");
          PBH.SETFILTER("BOM Running Status",'Old');
          IF PBH.FINDSET THEN
                BEGIN
              IF PBH."BOM Running Status" = PBH."BOM Running Status"::Old THEN
                "No.Format":='Subordinate'
              ELSE
                "No.Format":='None';
            END;

    end;

    (13790)]
    local procedure DescriptionOnFormat();
    begin
         IF FORMAT("Item Status")='Obsolete' THEN
         BEGIN
           DescriptionEmphasize :=TRUE;
         END ELSE
         BEGIN
           DescriptionEmphasize :=FALSE;
          //REV01
         END;
    end;
}

