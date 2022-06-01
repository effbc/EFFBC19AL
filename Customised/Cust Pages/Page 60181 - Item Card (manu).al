page 60181 "Item Card (manu)"
{
    // version NAVW13.70,NAVIN3.70.01.11,QC1.0,QCB2B1.2,B2B1.0,QC1.2,DWS1.0,Rev01

    Caption = 'Item Card';
    Editable = true;
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

                    trigger OnAssistEdit();
                    begin
                        IF AssistEdit THEN
                            CurrPage.UPDATE;
                    end;

                    trigger OnValidate();
                    begin
                        IF USERID IN ['EFFTRONICS\PADMASRI', 'EFFTRONICS\MARY'] THEN BEGIN
                            IF COPYSTR("No.", 1, 7) <> 'OFCMAIN' THEN
                                ERROR('YOU DO NOT HAVE RIGHTS');
                        END;
                    end;
                }
                field(Description; Description)
                {

                    trigger OnValidate();
                    begin
                        IF NOT ((USERID IN ['EFFTRONICS\JHANSI', 'EFFTRONICS\RATNARAVALI', 'EFFTRONICS\RSILPARANI', 'EFFTRONICS\VANIDEVI', 'EFFTRONICS\ANANDA',
                                          'EFFTRONICS\SUPRIYA', 'EFFTRONICS\AVINASH', 'EFFTRONICS\UBEDULLA', 'EFFTRONICS\SUJANI', 'EFFTRONICS\PKOTESWARARAO',
                                           'EFFTRONICS\ANUSHAG', 'SUPER', 'EFFTRONICS\ANILKUMAR', 'EFFTRONICS\MEENA', 'EFFTRONICS\KAMESWARI', 'EFFTRONICS\VISHNUPRIYA'])
                                          OR ((USERID IN ['EFFTRONICS\PADMASRI', 'EFFTRONICS\MARY', 'EFFTRONICS\GRAVI']) AND ("Item Category Code" IN ['OFFICE MAI', '', 'STA'])))
                                           THEN
                            ERROR('You have No Rights!');

                        // Item Description Modification restriction when already a saleorder or purchase order
                        IF CheckinPurchaseOrders_and_SaleOrders(Rec."No.") THEN
                            ERROR('You Can not change the description because it is already in purchase orders or sale orders');
                    end;
                }
                field("Description 2"; "Description 2")
                {
                }
                field("Common Item No."; "Common Item No.")
                {
                    Caption = 'Description3(Physical)';
                }
                field("Part Number"; "Part Number")
                {
                }
                field("Base Unit of Measure"; "Base Unit of Measure")
                {
                }
                field("Assembly BOM"; "Assembly BOM")
                {
                    Editable = false;
                }
                field("Shelf No."; "Shelf No.")
                {
                }
                field("Automatic Ext. Texts"; "Automatic Ext. Texts")
                {
                    Editable = true;
                }
                field("Item Category Code"; "Item Category Code")
                {

                    trigger OnValidate();
                    begin
                        IF "User ID" IN ['EFFTRONICS\PADMASRI', 'EFFTRONICS\MARY'] THEN BEGIN
                            IF NOT ("Item Category Code" IN ['OFFICE MAI', 'STA']) THEN //ADDED BY SUJANI FOR THE STATIONARY ITEMS ADDITION ON 22-12-2017
                                ERROR('YOU DO NOT HAVE RIGHTS');
                        END;
                    end;
                }
                field("Product Group Code"; "Product Group Code")
                {

                    trigger OnValidate();
                    begin
                        IF "Item Category Code" = 'OFFICE MAI' THEN BEGIN
                            IF "Product Group Code" = 'CANTEEN' THEN BEGIN
                                "Tax Group Code" := 'FOOD &BEV';
                                "Spec ID" := 'I-STA-0001';
                            END
                            ELSE
                                IF ("Product Group Code" IN ['ELE', 'HKE', 'MISC', 'STATIONARY']) THEN BEGIN
                                    "Tax Group Code" := 'OFFICE MAI';
                                    "Spec ID" := 'SPEC-05-0002';
                                END;
                        END;
                        MODIFY;
                    end;
                }
                field("Item Sub Group Code"; "Item Sub Group Code")
                {
                }
                field("Item Sub Sub Group Code"; "Item Sub Sub Group Code")
                {
                }
                field("Search Description"; "Search Description")
                {
                }
                field("Avg Unit Cost"; "Avg Unit Cost")
                {
                    Caption = 'Unit Cost';
                    Editable = false;
                }
                field(Item_verified; Item_verified)
                {

                    trigger OnValidate();
                    begin
                        IF NOT (USERID IN ['EFFTRONICS\ANANDA', 'EFFTRONICS\PADMAJA']) THEN BEGIN
                            MODIFY(FALSE);
                            ERROR('Only Super User has Permissions to modify');
                        END;
                        Verified_Date := TODAY;
                    end;
                }
                field(Verified_Date; Verified_Date)
                {

                    trigger OnValidate();
                    begin
                        IF NOT (USERID IN ['EFFTRONICS\ANANDA', 'EFFTRONICS\PADMAJA']) THEN BEGIN
                            MODIFY(FALSE);
                            ERROR('Only Super User has Permissions to modify');
                        END;
                    end;
                }
                field("Item Location"; "Item Location")
                {
                }
                field(ProductType; ProductType)
                {
                }
                field(PROD_USED; PROD_USED)
                {
                    Caption = 'Prod_Used';
                }
                field("Safety Stock Quantity"; "Safety Stock Quantity")
                {
                    Caption = 'Safety Stock Quantity (PROD)';
                    Editable = UnitPriceCustmEdit;
                }
                field("Safety Stock Qty (MCH)"; "Safety Stock Qty (MCH)")
                {
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
                field("Qty. on Sales Order"; "Qty. on Sales Order")
                {
                    Editable = false;
                }
                field("Service Item Group"; "Service Item Group")
                {
                    Editable = true;
                }
                field(Blocked; Blocked)
                {

                    trigger OnValidate();
                    begin

                        IF Blocked THEN BEGIN
                            // Verification in Production BOM Header & Line
                            IF ("Production BOM No." <> '') AND ("Product Group Code" <> 'FPRODUCT') THEN BEGIN
                                ERROR('PRODUCTION BOM WAS LINKED TO THIS ITEM , PLESE VERIFY & CLOSE IT');
                                PROBLEM := TRUE;
                            END;
                            //Added by Pranavi on 21-10-2015 for checking item is defined as alternate
                            "Alternate Item".SETFILTER("Alternate Item"."Alternative Item No.", "No.");
                            IF "Alternate Item".FINDFIRST THEN
                                ERROR('Item is defined as alternate item for one or more items!');
                            //End by Pranavi

                            // added by Vishnu Priya on 21-11-2020 to avoid the restriction to block the item is not running BOM

                            PBML.SETRANGE(PBML."No.", "No.");
                            IF PBML.FINDSET THEN
                                REPEAT
                                BEGIN
                                    PBML.CALCFIELDS(Status);
                                    PBH1.RESET;
                                    PBH1.SETFILTER("No.", PBML."Production BOM No.");
                                    PBH1.SETRANGE("BOM Running Status", PBH1."BOM Running Status"::Running);
                                    IF PBH1.FINDFIRST THEN BEGIN
                                        IF PBML.Status <> PBML.Status::Closed THEN
                                            IF ("Product Group Code" <> 'FPRODUCT') THEN
                                                ERROR('ITEM IS IN PRODUCTION BOMS PLEASE VERIFY "WHERE USED LIST" ONCE');
                                        IF FPO_ITEM.GET(PBML."Production BOM No.") THEN
                                            FPO_ITEM.TESTFIELD(FPO_ITEM.Blocked);
                                        PROBLEM := TRUE;
                                    END;
                                END
                                UNTIL PBML.NEXT = 0;


                            // VERIFUCATION IN MATERIAL ISSUES LINE
                            "Material Issues Line".SETCURRENTKEY("Material Issues Line"."Item No.", "Material Issues Line"."Prod. Order No.");
                            "Material Issues Line".SETRANGE("Material Issues Line"."Item No.", "No.");
                            IF "Material Issues Line".FINDFIRST THEN BEGIN
                                ERROR(' ITEM IS IN MATERIAL REQUESTS ');
                                PROBLEM := TRUE;
                            END;


                            // VERIFICATION IN PURCHASE ORDER
                            "Purchase Line".SETCURRENTKEY("Purchase Line"."No.", "Purchase Line"."Buy-from Vendor No.");
                            "Purchase Line".SETRANGE("Purchase Line"."No.", "No.");
                            "Purchase Line".SETFILTER("Purchase Line"."Qty. to Receive", '>%1', 0);
                            IF "Purchase Line".FINDFIRST THEN BEGIN
                                ERROR('ITEM IS IN PENDING PURCHASE ORDERS');
                                PROBLEM := TRUE;
                            END;


                            // VERIFICATION IN SALE ORDER & SCHEDULE
                            SH.RESET;
                            SH.SETFILTER(SH."Document Type", '<>%1', SH."Document Type"::Quote);
                            SH.SETFILTER(SH."Order Status", '<>%1', SH."Order Status"::"Temporary Close");
                            IF SH.FINDFIRST THEN
                                REPEAT
                                    "Sales Line".SETCURRENTKEY("Sales Line".Type, "Sales Line"."No.",
                                                             "Sales Line"."Variant Code", "Sales Line"."Drop Shipment",
                                                             "Sales Line"."Location Code",
                                                             "Sales Line"."Document Type",
                                                             "Sales Line"."Shipment Date");
                                    "Sales Line".SETRANGE("Sales Line"."No.", "No.");
                                    "Sales Line".SETFILTER("Sales Line"."Document No.", SH."No.");
                                    "Sales Line".SETFILTER("Sales Line"."Qty. to Ship", '>%1', 0);
                                    IF "Sales Line".FINDFIRST THEN BEGIN
                                        IF (("Sales Line"."Document Type" = "Sales Line"."Document Type"::"Blanket Order") AND (SH."Sale Order Created" = FALSE))
                                            OR ("Sales Line"."Document Type" = "Sales Line"."Document Type"::Order) THEN
                                            ERROR(' ITEM IS IN PENDING SALE ORDER');
                                    END;
                                    Schedule.SETCURRENTKEY(Schedule."Material Required Date", Schedule."No.");
                                    Schedule.SETFILTER(Schedule."Material Required Date", '>%1', TODAY);
                                    Schedule.SETFILTER(Schedule."Document No.", SH."No.");
                                    Schedule.SETRANGE(Schedule."No.", "No.");
                                    IF Schedule.FINDFIRST THEN BEGIN
                                        ERROR('ITEM IS IN SCHEDULE (PENDING)');
                                        PROBLEM := TRUE;
                                    END;
                                UNTIL SH.NEXT = 0;


                            // VERIFICATION IN "PROD ORDER COMPONENT"
                            "Prod. Order Component".SETCURRENTKEY("Prod. Order Component"."Item No.");
                            "Prod. Order Component".SETRANGE("Prod. Order Component"."Item No.", "No.");
                            "Prod. Order Component".SETFILTER("Prod. Order Component"."Remaining Quantity", '>%1', 0);
                            "Prod. Order Component".SETRANGE("Prod. Order Component".Status, "Prod. Order Component".Status::Released);
                            IF "Prod. Order Component".FINDFIRST THEN BEGIN
                                ERROR(' ITEM IS IN PRODUCTION ORDERS SO PLEASE REFRESH THOSE PRODUCTION ORDERS');
                                PROBLEM := TRUE;
                            END;
                        END;
                    end;
                }
                field("Last Date Modified"; "Last Date Modified")
                {
                    Editable = false;
                }
                field(Sample; Sample)
                {
                }
                field("Unit Cost"; "Unit Cost")
                {
                    Caption = 'Unit Cost (LCY)';
                }
                field(Picture; Picture)
                {
                }
                field("Safety Stock Qty (CS)"; "Safety Stock Qty (CS)")
                {
                }
                field("Need to be returned"; "Need to be returned")
                {
                }
                field("Dispatch Material"; "Dispatch Material")
                {
                }
                field("Stock at PROD Stores"; "Stock at PROD Stores")
                {
                }
                field("CS IGC"; "CS IGC")
                {

                    trigger OnValidate();
                    begin
                        IF NOT (USERID IN ['EFFTRONICS\VISHNUPRIYA', 'EFFTRONICS\ANILKUMAR', 'EFFTRONICS\SUJANI']) THEN
                            ERROR('You donot have rights to modify.Contact ERP Team');
                    end;
                }
                field(Remarks; Remarks)
                {
                }
                field(Stock_Threshold_Value; Stock_Threshold_Value)
                {
                    Caption = 'Stock_Alert_Threshold_Value';
                    Editable = stock_threshold_value_editable_flag;
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
                field("<Avg Unit Cost2>"; "Avg Unit Cost")
                {
                    Caption = 'Unit cost.';
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
                    Editable = UnitPriceCustmEdit;
                }
                field("Manufacturing Cost"; "Manufacturing Cost")
                {
                    Editable = false;
                }
                field(Control1000000026; PCB)
                {
                }
                field("Capital Item"; "Capital Item")
                {
                    Editable = false;
                }
                field("User ID"; "User ID")
                {
                    Editable = false;
                }
                field("Cs Stock Verified"; "Cs Stock Verified")
                {
                }
                field("Gen. Prod. Posting Group"; "Gen. Prod. Posting Group")
                {
                    CaptionML = ENU = 'Gen. Prod. Posting Group *',
                                ENN = 'Gen. Prod. Posting Group';
                    Editable = true;

                    trigger OnAssistEdit();
                    begin
                        IF ("Item Sub Sub Group Code" = 'X-RAY VIEWER') AND ("Gen. Prod. Posting Group" <> 'X-RAY VIEW') THEN   // Added by Pranavi on 3Aug206
                            ERROR('For ' + "Item Sub Sub Group Code" + 's Excise Prod. Posting Group must be X-RAY VIEW');
                    end;
                }
                field("Excise Prod. Posting Group"; "Excise Prod. Posting Group")
                {
                    CaptionML = ENU = 'Excise Prod. Posting Group *',
                                ENN = 'Excise Prod. Posting Group';
                    Editable = true;

                    trigger OnValidate();
                    begin
                        IF ("Item Sub Sub Group Code" = 'X-RAY VIEWER') AND ("Excise Prod. Posting Group" <> '90221900') THEN   // Added by Pranavi on 3Aug206
                            ERROR('For ' + "Item Sub Sub Group Code" + 's Excise Prod. Posting Group must be 90221900');
                    end;
                }
                field("Inventory Posting Group"; "Inventory Posting Group")
                {
                    CaptionML = ENU = 'Inventory Posting Group *',
                                ENN = 'Inventory Posting Group';
                    Editable = true;
                }
                field("VAT Prod. Posting Group"; "VAT Prod. Posting Group")
                {
                    CaptionML = ENU = 'VAT Prod. Posting Group *',
                                ENN = 'VAT Prod. Posting Group';
                }
                field("GST Group Code"; "GST Group Code")
                {
                    CaptionML = ENU = 'GST Group Code *',
                                ENN = 'GST Group Code';
                }
                field("GST Credit"; "GST Credit")
                {
                    CaptionML = ENU = 'GST Credit',
                                ENN = 'GST Credit';
                }
                field("HSN/SAC Code"; "HSN/SAC Code")
                {
                    CaptionML = ENU = 'HSN/SAC Code *',
                                ENN = 'HSN/SAC Code';
                }
                field(Exempted; Exempted)
                {
                }
                field("Allow Invoice Disc."; "Allow Invoice Disc.")
                {
                    Editable = false;
                }
                field("Item Disc. Group"; "Item Disc. Group")
                {
                    Editable = true;
                }
                field("Sales Unit of Measure"; "Sales Unit of Measure")
                {
                    Editable = true;
                }
                field("Excise Accounting Type"; "Excise Accounting Type")
                {
                    Editable = true;
                }
                field("Assessable Value"; "Assessable Value")
                {
                    Editable = true;
                }
                field("Tax Group Code"; "Tax Group Code")
                {
                    Editable = true;
                }
                field("VAT Bus. Posting Gr. (Price)"; "VAT Bus. Posting Gr. (Price)")
                {
                }
            }
            group(Replenishment)
            {
                Caption = 'Replenishment';
                field("Replenishment System"; "Replenishment System")
                {
                    OptionCaption = 'Purchase,Prod. Order';
                }
                field("Vendor No."; "Vendor No.")
                {
                }
                field("Vendor Item No."; "Vendor Item No.")
                {
                }
                field("Purch. Unit of Measure"; "Purch. Unit of Measure")
                {
                }
                field("Lead Time Calculation"; "Lead Time Calculation")
                {
                }
                group(Production)
                {
                    Caption = 'Production';
                    field("Manufacturing Policy"; "Manufacturing Policy")
                    {
                    }
                    field("Routing No."; "Routing No.")
                    {
                    }
                    field("Production BOM No."; "Production BOM No.")
                    {

                        trigger OnValidate();
                        begin
                            //Added By Pranavi on 09-11-2015
                            IF "Production BOM No." <> '' THEN BEGIN
                                "Replenishment System" := "Replenishment System"::"Prod. Order";
                                "Manufacturing Policy" := "Manufacturing Policy"::"Make-to-Order";
                            END;
                            //End by Pranavi
                        end;
                    }
                    field("Rounding Precision"; "Rounding Precision")
                    {
                    }
                    field("Flushing Method"; "Flushing Method")
                    {
                    }
                    field("Scrap %"; "Scrap %")
                    {
                    }
                    field("Lot Size"; "Lot Size")
                    {
                    }
                }
            }
            group(Planning)
            {
                Caption = 'Planning';
                field("Reordering Policy"; "Reordering Policy")
                {

                    trigger OnValidate();
                    begin
                        EnablePlanningControls
                    end;
                }
                field("Include Inventory"; "Include Inventory")
                {
                    Enabled = "Include InventoryEnable";
                }
                field(Reserve; Reserve)
                {
                }
                field("Order Tracking Policy"; "Order Tracking Policy")
                {
                }
                field("Stockkeeping Unit Exists"; "Stockkeeping Unit Exists")
                {
                }
                field(Critical; Critical)
                {
                }
                field("Type of Solder"; "Type of Solder")
                {
                }
                field(Package; Package)
                {
                }
                field("No. of Soldering Points"; "No. of Soldering Points")
                {
                }
                field("No. of Pins"; "No. of Pins")
                {
                }
                field("No. of Opportunities"; "No. of Opportunities")
                {
                }
                field("No.of Fixing Holes"; "No.of Fixing Holes")
                {
                }
                field("No.of Units"; "No.of Units")
                {

                    trigger OnValidate();
                    begin
                        ProdOrders.RESET;
                        ProdOrders.SETRANGE(Status, ProdOrders.Status::Released);
                        ProdOrders.SETRANGE("Source No.", "No.");
                        IF ProdOrders.FINDSET THEN BEGIN
                            REPEAT
                                ProdOrders.Itm_card_No_of_Units := "No.of Units";
                                ProdOrders.Itm_Card_ttl_units := ProdOrders.Quantity * "No.of Units";
                                ProdOrders.MODIFY;
                            UNTIL ProdOrders.NEXT = 0;
                        END;
                    end;
                }
                field("Time Bucket"; "Time Bucket")
                {
                    Enabled = "Reorder CycleEnable";
                }
                field("Safety Lead Time"; "Safety Lead Time")
                {
                }
                field("Reorder Point"; "Reorder Point")
                {
                    Enabled = "Reorder PointEnable";
                }
                field("Reorder Quantity"; "Reorder Quantity")
                {
                    Enabled = "Reorder QuantityEnable";
                }
                field("Maximum Inventory"; "Maximum Inventory")
                {
                    Enabled = "Maximum InventoryEnable";
                }
                field("Minimum Order Quantity"; "Minimum Order Quantity")
                {
                }
                field("Standard Packing Quantity"; "Standard Packing Quantity")
                {
                }
                field("Maximum Order Quantity"; "Maximum Order Quantity")
                {
                    Enabled = "Maximum Order QuantityEnable";
                }
                field("Order Multiple"; "Order Multiple")
                {
                }
                field("Safety Stock Qty (R&D)"; "Safety Stock Qty (R&D)")
                {
                }
                field("Stock at CS Stores"; "Stock at CS Stores")
                {
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
                }
                field("Serial Nos."; "Serial Nos.")
                {
                }
                field("Lot Nos."; "Lot Nos.")
                {
                }
                field("Expiration Calculation"; "Expiration Calculation")
                {
                }
                field("Used In DL"; "Used In DL")
                {
                }
                field("Used In MFEP"; "Used In MFEP")
                {
                }
                field("Used In RTU"; "Used In RTU")
                {
                }
                field("Used In PMU"; "Used In PMU")
                {
                }
                field("Used In BMU"; "Used In BMU")
                {
                }
                field("Used In IPIS"; "Used In IPIS")
                {
                }
                field("Used In PC"; "Used In PC")
                {
                }
                field("Used In RLY.LMP"; "Used In RLY.LMP")
                {
                }
                field("Used In Bus Displays"; "Used In Bus Displays")
                {
                }
                field("Used in LED Lamps"; "Used in LED Lamps")
                {
                }
                field("Used in LC GATE"; "Used in LC GATE")
                {
                }
                field("USED in MLRI"; "USED in MLRI")
                {
                }
                field("Used in BI"; "Used in BI")
                {
                }
                field("Used in Road lamp WTLC"; "Used in Road lamp WTLC")
                {
                }
                field("<PROD_USED2>"; PROD_USED)
                {
                }
                field("PO Blocked"; "PO Blocked")
                {
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
                field("Identifier Code"; "Identifier Code")
                {
                    Editable = false;
                }
                field("Next Counting Start Date"; "Next Counting Start Date")
                {
                    Editable = true;
                }
                field("Next Counting End Date"; "Next Counting End Date")
                {
                    Editable = true;
                }
                field("Use Cross-Docking"; "Use Cross-Docking")
                {
                    Editable = false;
                }
                field("BIN Address"; "BIN Address")
                {
                }
                field("Stock Address"; "Stock Address")
                {
                }
            }
            group(Quality)
            {
                Caption = 'Quality';
                field("Spec ID"; "Spec ID")
                {
                }
                field("QC Enabled"; "QC Enabled")
                {
                    Editable = qc_flag_editable;
                }
                field("Insp. Time Inbound(In Min.)"; "Insp. Time Inbound(In Min.)")
                {
                }
                field(Make; Make)
                {
                }
                field("Operating Temperature"; "Operating Temperature")
                {
                }
                field("Storage Temperature"; "Storage Temperature")
                {
                }
                field(Humidity; Humidity)
                {
                }
                field("ESD Sensitive"; "ESD Sensitive")
                {
                }
                field("Item Status"; "Item Status")
                {
                    Caption = 'Item Status';
                }
                field("WIP Spec ID"; "WIP Spec ID")
                {
                }
                field("WIP QC Enabled"; "WIP QC Enabled")
                {
                }
                field("Insp. Time WIP(In Min.)"; "Insp. Time WIP(In Min.)")
                {
                }
                field("Soldering Temp."; "Soldering Temp.")
                {
                }
                field("Soldering Time (Sec)"; "Soldering Time (Sec)")
                {
                }
                field("Work area Temp &  Humadity"; "Work area Temp &  Humadity")
                {
                }
                field(ESD; ESD)
                {
                }
            }
            group(Control1900582501)
            {
                Caption = 'Specifications';
                field("<Part Number2>"; "Part Number")
                {
                }
                field("<Make2>"; Make)
                {
                }
                field("<Operating Temperature2>"; "Operating Temperature")
                {
                }
                field("<Storage Temperature2>"; "Storage Temperature")
                {
                }
                field("<Humidity2>"; Humidity)
                {
                }
                field("<ESD Sensitive2>"; "ESD Sensitive")
                {
                }
                field("<Item Status2>"; "Item Status")
                {
                }
                field("Item End of Date in Market"; "Item End of Date in Market")
                {
                }
                field("Effe Status"; "Effe Status")
                {
                }
                field("Effe Cost"; "Effe Cost")
                {
                }
                field("<Soldering Temp2.>"; "Soldering Temp.")
                {
                }
                field("<Soldering Time (Sec)2>"; "Soldering Time (Sec)")
                {
                }
                field("On C-Side"; "On C-Side")
                {
                    Caption = 'C-Side Solder Mask';
                }
                field("On D-Side"; "On D-Side")
                {
                    Caption = 'D-Side Solder Mask';
                }
                field("On S-Side"; "On S-Side")
                {
                    Caption = 'S-Side Solder Mask';
                }
                field("Packing Type"; "Packing Type")
                {
                }
                field("Packing Dimension"; "Packing Dimension")
                {

                    trigger OnValidate();
                    begin
                        // added by vishnu Priya on 13-03-2020 for the data validation ourpose
                        // Must enter the 3 dimensions like length/radius, width and radius for the components
                        xcnt := 0;
                        Body := "Packing Dimension";
                        //singlequotesremoval(item1.Description);
                        FOR i := 1 TO STRLEN(Body) DO BEGIN
                            IF COPYSTR(Body, i, 1) = 'X' THEN
                                xcnt += 1;
                        END;
                        IF xcnt = 2 THEN BEGIN
                            Subject := Body;
                            XPOS1 := STRPOS(Subject, 'X');
                            t1 := COPYSTR(Subject, 1, XPOS1 - 1);
                            MESSAGE('FIRST NUMBER PART:' + FORMAT(t1));
                            FOR i := 1 TO STRLEN(t1) DO BEGIN
                                IF NOT (FORMAT(t1[i]) IN ['0' .. '9']) THEN ERROR('USE NUMBERS AND X FOR THE SEPARATOR LIKE 10X200X25.AVOID SPACES IN PART1' + t1)
                            END;
                            Subject := COPYSTR(Subject, XPOS1 + 1, STRLEN(Subject));
                            XPOS2 := STRPOS(Subject, 'X');
                            t2 := COPYSTR(Body, XPOS1 + 1, XPOS2 - 1);
                            FOR i := 1 TO STRLEN(t2) DO BEGIN
                                IF NOT (FORMAT(t2[i]) IN ['0' .. '9']) THEN ERROR('USE NUMBERS AND X FOR THE SEPARATOR LIKE 10X200X25.AVOID SPACES IN PART2' + t2)
                            END;
                            MESSAGE('2ND NUMBER PART: ' + FORMAT(t2));
                            t3 := COPYSTR(Body, XPOS2 + XPOS1 + 1, STRLEN(Body));
                            MESSAGE(FORMAT('3RD PART: ' + t3));
                            FOR i := 1 TO STRLEN(t3) DO BEGIN
                                IF NOT (FORMAT(t3[i]) IN ['0' .. '9']) THEN ERROR('USE NUMBERS AND X FOR THE SEPARATOR LIKE 10X200X25.AVOID SPACES IN PART3' + t3)
                            END;

                        END
                        ELSE
                            IF STRLEN(Body) > 0 THEN
                                ERROR('PLEASE ENTER THE DIMENSION IN 10X20X30  FORMAT');
                    end;
                }
                field("Surface Finish"; "Surface Finish")
                {
                }
                field("<Work area Temp &  Humadity2>"; "Work area Temp &  Humadity")
                {
                }
                field("<ESD2>"; ESD)
                {
                }
                field("<Type of Solder2>"; "Type of Solder")
                {
                }
                field("<Package2>"; Package)
                {
                }
                field("<No. of Soldering Points2>"; "No. of Soldering Points")
                {
                }
                field("<No. of Pins2>"; "No. of Pins")
                {
                }
                field("PCB thickness"; "PCB thickness")
                {

                    trigger OnValidate();
                    begin
                        IF NOT (USERID IN ['EFFTRONICS\RAMALAKSHMI', 'EFFTRONICS\PARVATHI', 'EFFTRONICS\RATNARAVALI', 'EFFTRONICS\RSILPARANI', 'EFFTRONICS\SWATHI', 'EFFTRONICS\SUJANI']) THEN
                            ERROR('You Have No Rights');
                    end;
                }
                field("Copper Clad Thickness"; "Copper Clad Thickness")
                {
                    Caption = 'Base Copper Clad Thickness(In Microns)';

                    trigger OnValidate();
                    begin
                        IF NOT (USERID IN ['EFFTRONICS\RAMALAKSHMI', 'EFFTRONICS\RATNARAVALI', 'EFFTRONICS\RSILPARANI', 'EFFTRONICS\SWATHI', 'EFFTRONICS\SUJANI']) THEN
                            ERROR('You Have No Rights');
                    end;
                }
                field("PCB Shape"; "PCB Shape")
                {

                    trigger OnValidate();
                    begin
                        IF NOT (USERID IN ['EFFTRONICS\RAMALAKSHMI', 'EFFTRONICS\RATNARAVALI', 'EFFTRONICS\RSILPARANI', 'EFFTRONICS\SUJANI']) THEN
                            ERROR('You Have No Rights');
                    end;
                }
                field(Length; Length)
                {

                    trigger OnValidate();
                    begin
                        IF NOT (USERID IN ['EFFTRONICS\RATNARAVALI', 'EFFTRONICS\RSILPARANI', 'EFFTRONICS\SWATHI', 'EFFTRONICS\SUJANI']) THEN
                            ERROR('You Have No Rights');
                    end;
                }
                field(Width; Width)
                {

                    trigger OnValidate();
                    begin
                        IF NOT (USERID IN ['EFFTRONICS\RATNARAVALI', 'EFFTRONICS\RSILPARANI', 'EFFTRONICS\SWATHI', 'EFFTRONICS\SUJANI']) THEN
                            ERROR('You Have No Rights');
                    end;
                }
                field("PCB Area"; "PCB Area")
                {
                    DecimalPlaces = 1 : 5;

                    trigger OnValidate();
                    begin
                        IF (USERID <> 'SUPER') THEN
                            ERROR('You Have No Rights');
                    end;
                }
                field("Semi Mounted"; "Semi Mounted")
                {
                }
                field("Panel Length"; "Panel Length")
                {
                    Caption = 'Panel Length(In mm)';
                }
                field("Panel Width"; "Panel Width")
                {
                    Caption = 'Panel Width(In mm)';
                }
                field(ROHS; ROHS)
                {
                }
                field(REACH; REACH)
                {
                }
                field(MSL; MSL)
                {
                }
                field("ESD Class"; "ESD Class")
                {
                }
                field("Floor Life at 25 C 40% RH"; "Floor Life at 25 C 40% RH")
                {

                    trigger OnValidate();
                    begin
                        //added by Vishnu Priya on 30-07-2019 to restrict the othertahn Values
                        IF "Floor Life at 25 C 40% RH" <> '' THEN
                            IF "Floor Life at 25 C 40% RH" <> 'INFINITE' THEN
                                IF EVALUATE(FLOORLIFEINT, "Floor Life at 25 C 40% RH") THEN
                                    EXIT
                                ELSE
                                    ERROR('You Entered other than balnk,INFINITE and Some Temperature');
                    end;
                }
                field("Bake Hours"; "Bake Hours")
                {
                }
                field("Component Shelf Life(Years)"; "Component Shelf Life(Years)")
                {
                }
                field("Invert Solder type"; "Invert Solder type")
                {
                }
                field("Net Weight"; "Net Weight")
                {
                }
                field("Gross Weight"; "Gross Weight")
                {
                }
                field("Thickness of Package"; "Thickness of Package")
                {
                }
                field("Feeder Packing Type"; "Feeder Packing Type")
                {
                }
                field("Feeder Packing Width(mm)"; "Feeder Packing Width(mm)")
                {
                    Caption = 'Feeder Packing Width(mm)';
                    ToolTip = 'If it  was Above 32 mm, Manual Arrangement will be done at Re-flow stage';
                }
            }
            group("Tax Information")
            {
                Caption = 'Tax Information';
                field("MRP Value"; "MRP Value")
                {
                }
                field("MRP Price"; "MRP Price")
                {
                }
                field("Abatement %"; "Abatement %")
                {
                }
                field("Price Inclusive of Tax"; "Price Inclusive of Tax")
                {
                }
                field("PIT Structure"; "PIT Structure")
                {
                }
                group("Sub Contracting")
                {
                    Caption = 'Sub Contracting';
                    field(Subcontracting; Subcontracting)
                    {
                    }
                    field("Sub. Comp. Location"; "Sub. Comp. Location")
                    {
                    }
                }
                group(Excise)
                {
                    Caption = 'Excise';
                    field("Scrap Item"; "Scrap Item")
                    {
                    }
                }
                group(VAT)
                {
                    Caption = 'VAT';
                    field("Fixed Asset"; "Fixed Asset")
                    {
                    }
                }
            }
            group(Machine)
            {
                field("No of Panels"; "No of Panels")
                {
                    Editable = mch_tag_editable;
                }
                field(SMD_But_mchine_cant_do; SMD_But_mchine_cant_do)
                {
                    Caption = 'Machine Can''t Do';
                    Editable = mch_tag_editable;
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
                        Image = WorkSheet;

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
                Image = Item;
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
                        Image = TaskQualityMeasure;
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
                action(PCB)
                {
                    Caption = 'PCB';
                    Image = Card;
                    Visible = visible1;

                    trigger OnAction();
                    begin
                        pcb1.RESET;
                        pcb1.SETRANGE(pcb1."PCB No.","No.");
                        IF pcb1.FINDFIRST THEN
                          PAGE.RUN(60240,pcb1)
                        ELSE BEGIN
                          pcb1.INIT;
                          pcb1."PCB No.":="No.";
                          pcb1.Description:=Description;
                          pcb1."PCB Thickness":="PCB thickness";
                          pcb1."Copper Clad Thinkness":="Copper Clad Thickness";
                          pcb1."PCB Area":="PCB Area";
                          pcb1.Length:=Length;
                          pcb1.Width:=Width;
                          pcb1."PCB Shape":="PCB Shape";
                          pcb1."On C-side":="On C-Side";
                          pcb1."On D-side":="On D-Side";
                          pcb1."On S-side":="On S-Side";
                          pcb1.Multiples_Per_Stencil:=1;
                          pcb1.INSERT;
                          pcb1.RESET;
                          pcb1.SETRANGE(pcb1."PCB No.","No.");
                          IF pcb1.FINDFIRST THEN
                            PAGE.RUN(60240,pcb1);
                        END;
                    end;
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
                action("Alternative Items")
                {
                    Caption = 'Alternative Items';
                    Image = ItemSubstitution;

                    trigger OnAction();
                    begin
                        "Alternate Item".SETRANGE("Alternate Item"."Item No.","No.");
                        PAGE.RUN(60070,"Alternate Item");
                    end;
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
                        Image = BOM;
                        RunObject = Page "Assembly BOM";
                                        RunPageLink = Parent Item No.=FIELD(No.);
                    }
                    action("Where-Used List")
                    {
                        Caption = 'Where-Used List';
                        Image = Track;
                        RunObject = Page "Where-Used List";
                                        RunPageLink = Type=CONST(Item),No.=FIELD(No.);
                        RunPageView = SORTING(Type,No.);
                    }
                    action("Calc. Stan&dard Cost")
                    {
                        Caption = 'Calc. Stan&dard Cost';
                        Image = CalculateCost;

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
                        Image = Track;

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
                        Image = DebugNext;
                        RunObject = Page "Troubleshooting Setup";
                                        RunPageLink = Type=CONST(Item),No.=FIELD(No.);
                    }
                    action(Action186)
                    {
                        Caption = 'Troubles&hooting';
                        Image = Debug;

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
                        Image = ResourceSkills;

                        trigger OnAction();
                        begin
                            CLEAR(SkilledResourceList);
                            //SkilledResourceList.InitializeForItem(Rec);
                            //SkilledResourceList.RUNMODAL;
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
                }
                action(Attachments)
                {
                    Caption = 'Attachments';
                    Image = Attachments;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "ESPL Attachments";
                                    RunPageLink = Table ID=CONST(27),Document No.=FIELD(No.);
                }
                separator(Action1000000016)
                {
                }
                action("Design Work Sheet")
                {
                    Caption = 'Design Work Sheet';
                    Image = Worksheet;
                    RunObject = Page "Item Design WorkSheet Header";
                                    RunPageLink = Item No.=FIELD(No.);
                }
                action("Change log")
                {
                    Caption = 'Change log';

                    trigger OnAction();
                    begin
                         Changelog.RESET;
                         Changelog.SETFILTER(Changelog."Table No.",'%1',27);
                         Changelog.SETFILTER(Changelog."Primary Key Field 1 Value","No.");
                         PAGE.RUN(595,Changelog);
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
            group(Purchase)
            {
                Caption = 'Purchase';
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
            Caption = '<Action1900000004>';
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
                    Image = BOMLevel;

                    trigger OnAction();
                    begin
                           ItemCostUpdation.UpdateBOM;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        
        //swathi for visiblity condition of pcb card
        visible1:=FALSE;
        item.RESET;
        item.SETRANGE(item."No.","No.");
        IF item.FINDFIRST THEN BEGIN
         IF item."Product Group Code" IN ['PCB' ,'MPCB','CPCB' ] THEN BEGIN
          visible1:=TRUE;
         END;
        END;    //swathi
        
        ItemCostMgt.CalculateAverageCost(Rec,AverageCostLCY,AverageCostACY);
        EnablePlanningControls;
        //B2B
        IF ("QC Enabled" = TRUE) AND (Inventory >= 0) THEN
          "Quantity Accepted" := Inventory - ("Quantity Rejected" + "Quantity Under Inspection" + "Quantity Rework" +
                                              "Quantity Sent for Rework");
        //B2B
        /*atta:=FALSE;
        attachments.RESET;
        attachments.SETRANGE("Table ID",DATABASE::Item);
        attachments.SETRANGE("Document No.","No.");
        IF attachments.COUNT>0 THEN
        atta:=TRUE;
           */
        NoOnFormat;
        DescriptionOnFormat;

    end;

    trigger OnInit();
    begin
        "Include InventoryEnable" := TRUE;
        "Maximum Order QuantityEnable" := TRUE;
        "Maximum InventoryEnable" := TRUE;
        "Reorder QuantityEnable" := TRUE;
        "Reorder PointEnable" := TRUE;
        "Reorder CycleEnable" := TRUE;
        qc_flag_editable := FALSE;
        stock_threshold_value_editable_flag := FALSE;
        mch_tag_editable := FALSE;
    end;

    trigger OnOpenPage();
    begin
        // anil  OnActivateForm;
        //Added By pranavi on 28-09-2015
        IF USERID IN ['EFFTRONICS\ANILKUMAR','EFFTRONICS\RATNARAVALI','EFFTRONICS\RSILPARANI','EFFTRONICS\VANIDEVI','EFFTRONICS\MEENA',
                    'EFFTRONICS\SUPRIYA','EFFTRONICS\SUJANI','EFFTRONICS\TMADHAVI',
                    'EFFTRONICS\BALA','EFFTRONICS\JHANSI','EFFTRONICS\UBEDULLA','EFFTRONICS\ANANDA',
                    'EFFTRONICS\PKOTESWARARAO','EFFTRONICS\VISHNUPRIYA','EFFTRONICS\GRAVI','EFFTRONICS\KAMESWARI','EFFTRONICS\AVINASH'] THEN
          CurrPage.EDITABLE := TRUE
        ELSE
          CurrPage.EDITABLE := FALSE;
        //End by Pranvai
        //'EFFTRONICS\GRAVI','EFFTRONICS\ANVKUMARI','EFFTRONICS\NAGAGAYATRI',
        //added by Pranavi on 23-06-2015 for Unit Price editing rights to ERP team
        IF /*("Product Group Code" = 'FPRODUCT') AND*/ (USERID IN ['EFFTRONICS\ANILKUMAR','EFFTRONICS\GRAVI','EFFTRONICS\VIJAYA','EFFTRONICS\SUJANI']) THEN
          UnitPriceCustmEdit := TRUE
        ELSE UnitPriceCustmEdit := FALSE;
        //End by Pranavi
        
        IF (USERID IN ['EFFTRONICS\PADMASRI','EFFTRONICS\MARY']) AND ("Item Category Code" IN ['OFFICE MAI','','STA']) THEN
        BEGIN
            CurrPage.EDITABLE := TRUE;
        END;
        
        IF NOT (SMTP_MAIL.Permission_Checking(USERID,'QC FLAG'))
            THEN qc_flag_editable:= FALSE
            ELSE
              qc_flag_editable:= TRUE;
        
        
        IF NOT (SMTP_MAIL.Permission_Checking(USERID,'STOCK_THERSHOLD_FLAG'))
            THEN stock_threshold_value_editable_flag:= FALSE
            ELSE
              stock_threshold_value_editable_flag:= TRUE;
        IF (USERID IN ['EFFTRONICS\RATNARAVALI','EFFTRONICS\RSILPARANI','EFFTRONICS\UBEDULLA','EFFTRONICS\SUJANI']) THEN
          mch_tag_editable := TRUE
        ELSE
          mch_tag_editable := FALSE;

    end;

    trigger OnQueryClosePage(CloseAction : Action) : Boolean;
    begin
        //Added By Pranavi on 07-09-2015
        /*
        IF "Item Tracking Code" = '' THEN
          ERROR('Please Select Item Tracking Code!');
        */
        //End By Pranavi
        
        //added by Vishnu Priya on 03-02-2020
        IF ("Item Status" = Rec."Item Status"::EOL) AND (Rec."Item End of Date in Market" = 0D) THEN
        ERROR('Please Fill the End of Life For the Item'+Rec."No.");
        //added by Vishnu Priya on 03-02-2020

    end;

    var
        TroubleshHeader : Record "Troubleshooting Header";
        ItemCostMgt : Codeunit ItemCostManagement;
        CalculateStdCost : Codeunit "Calculate Standard Cost";
        AverageCostLCY : Decimal;
        AverageCostACY : Decimal;
        attachments : Record Attachments;
        atta : Boolean;
        "Alternate Item" : Record "Alternate Items";
        PBML : Record "Production BOM Line";
        "Material Issues Line" : Record "Material Issues Line";
        "Purchase Line" : Record "Purchase Line";
        "Sales Line" : Record "Sales Line";
        Schedule : Record Schedule2;
        "Prod. Order Component" : Record "Prod. Order Component";
        PROBLEM : Boolean;
        FPO_ITEM : Record Item;
        ItemCostUpdation : Codeunit "Item Cost Updation";
        User : Record User;
        SH : Record "Sales Header";
        [InDataSet]
        "No.Emphasize" : Boolean;
        [InDataSet]
        DescriptionEmphasize : Boolean;
        [InDataSet]
        "Reorder CycleEnable" : Boolean;
        [InDataSet]
        "Reorder PointEnable" : Boolean;
        [InDataSet]
        "Reorder QuantityEnable" : Boolean;
        [InDataSet]
        "Maximum InventoryEnable" : Boolean;
        [InDataSet]
        "Maximum Order QuantityEnable" : Boolean;
        [InDataSet]
        "Include InventoryEnable" : Boolean;
        Text19026065 : Label 'Attachments';
        SkilledResourceList : Page "Skilled Resource List";
                                  pcb1 : Record PCB;
                                  visible1 : Boolean;
                                  item : Record Item;
                                  Changelog : Record "Change Log Entry";
                                  UnitPriceCustmEdit : Boolean;
                                  SMTP_MAIL : Codeunit "SMTP Mail";
                                  qc_flag_editable : Boolean;
                                  stock_threshold_value_editable_flag : Boolean;
                                  mch_tag_editable : Boolean;
                                  ProdOrders : Record "Production Order";
                                  FLOORLIFEINT : Integer;
                                  xcnt : Integer;
                                  XPOS1 : Integer;
                                  XPOS2 : Integer;
                                  i : Integer;
                                  Body : Text;
                                  Subject : Text;
                                  t1 : Text;
                                  t2 : Text;
                                  t3 : Text;
                                  PBH1 : Record "Production BOM Header";

    [LineStart(14409)]
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

        //CurrForm."Safety Stock Quantity".ENABLED := SafetyStockQtyEnabled;
        "Reorder PointEnable" := ReorderPointEnabled;
        "Reorder QuantityEnable" := ReorderQuantityEnabled;
        "Maximum InventoryEnable" := MaximumInventoryEnabled;

        "Maximum Order QuantityEnable" := MaximumOrderQtyEnabled;

        "Include InventoryEnable" := IncludeInventoryEnabled;


        //CurrForm."Safety Lead Time".ENABLED := SafetyLeadTimeEnabled;
        //CurrForm."Order Multiple".ENABLED := OrderMultipleEnabled;
        //CurrForm."Minimum Order Quantity".ENABLED := MinimumOrderQtyEnabled;
        // code commented by santhosh due to enabling of Required fields

    end;

    [LineStart(14441)]
    local procedure DispatchMaterialOnActivate();
    begin
        IF NOT (UPPERCASE(USERID) IN ['SUPER', 'EFFTRONICS\JHANSI', 'EFFTRONICS\PRANAVI', 'EFFTRONICS\SUJANI']) THEN
            ERROR('You dont have Permissions');
    end;

    [LineStart(14445)]
    local procedure AverageCostLCYOnActivate();
    begin
        ItemCostMgt.CalculateAverageCost(Rec, AverageCostLCY, AverageCostACY);
    end;

    [LineStart(14448)]
    local procedure OnActivateForm();
    begin
        //Rev01 As directed by anil
        IF NOT (USERID IN ['SUPER', 'EFFTRONICS\JHANSI', 'EFFTRONICS\PARVATHI', 'EFFTRONICS\VANIDEVI', 'EFFTRONICS\ANANDA', 'EFFTRONICS\MEENA', 'EFFTRONICS\GRAVI',
                           'EFFTRONICS\RAMALAKSHMI', 'EFFTRONICS\UBEDULLA', 'EFFTRONICS\PADMAJA', 'EFFTRONICS\PKOTESWARARAO', 'EFFTRONICS\RATNARAVALI', 'EFFTRONICS\RSILPARANI',
                           'EFFTRONICS\ANUSHAG', 'EFFTRONICS\ANILKUMAR', 'EFFTRONICS\VIJAYA', 'EFFTRONICS\SUJANI']) THEN
            CurrPage.EDITABLE := FALSE
        ELSE
            CurrPage.EDITABLE := TRUE;

        //Rev01 As directed by anil
    end;

    [LineStart(14460)]
    local procedure ProductGroupCodeOnBeforeInput();
    begin
        IF NOT (USERID IN ['SUPER', 'EFFTRONICS\JHANSI', 'EFFTRONICS\PARVATHI', 'EFFTRONICS\VANIDEVI', 'EFFTRONICS\ANANDA', 'EFFTRONICS\RATNARAVALI', 'EFFTRONICS\RSILPARANI', 'EFFTRONICS\RAMALAKSHMI',
                           'EFFTRONICS\UBEDULLA', 'EFFTRONICS\PADMAJA', 'EFFTRONICS\PKOTESWARARAO', 'EFFTRONICS\MEENA', 'EFFTRONICS\GRAVI',
                           'EFFTRONICS\ANUSHAG', 'EFFTRONICS\ANILKUMAR', 'EFFTRONICS\VIJAYA', 'EFFTRONICS\SUJANI']) THEN
            ERROR('You have No Rights to Change the Item Groups');
    end;

    [LineStart(14466)]
    local procedure ItemCategoryCodeOnBeforeInput();
    begin
        IF NOT (USERID IN ['SUPER', 'EFFTRONICS\JHANSI', 'EFFTRONICS\PARVATHI', 'EFFTRONICS\VANIDEVI', 'EFFTRONICS\ANANDA', 'EFFTRONICS\RATNARAVALI', 'EFFTRONICS\RSILPARANI', 'EFFTRONICS\RAMALAKSHMI',
                             'EFFTRONICS\UBEDULLA', 'EFFTRONICS\PADMAJA', 'EFFTRONICS\PKOTESWARARAO', 'EFFTRONICS\MEENA', 'EFFTRONICS\GRAVI',
                           'EFFTRONICS\ANUSHAG', 'EFFTRONICS\ANILKUMAR', 'EFFTRONICS\VIJAYA', 'EFFTRONICS\SUJANI']) THEN
            ERROR('You have No Rights to Change the Item Groups');
    end;

    [LineStart(14472)]
    local procedure ItemSubGroupCodeOnBeforeInput();
    begin
        IF NOT (USERID IN ['SUPER', 'EFFTRONICS\JHANSI', 'EFFTRONICS\PARVATHI', 'EFFTRONICS\VANIDEVI', 'EFFTRONICS\ANANDA', 'EFFTRONICS\RATNARAVALI', 'EFFTRONICS\RSILPARANI',
                           'EFFTRONICS\RAMALAKSHMI', 'EFFTRONICS\UBEDULLA', 'EFFTRONICS\PADMAJA', 'EFFTRONICS\PKOTESWARARAO', 'EFFTRONICS\MEENA', 'EFFTRONICS\GRAVI',
                           'EFFTRONICS\ANUSHAG', 'EFFTRONICS\ANILKUMAR', 'EFFTRONICS\VIJAYA', 'EFFTRONICS\SUJANI']) THEN
            ERROR('You have No Rights to Change the Item Groups');
    end;

    [LineStart(14478)]
    local procedure ItemSubSubGroupCodeOnBeforeInp();
    begin
        IF NOT (USERID IN ['SUPER', 'EFFTRONICS\JHANSI', 'EFFTRONICS\PARVATHI', 'EFFTRONICS\VANIDEVI', 'EFFTRONICS\ANANDA', 'EFFTRONICS\RATNARAVALI', 'EFFTRONICS\RSILPARANI',
                           'EFFTRONICS\RAMALAKSHMI', 'EFFTRONICS\UBEDULLA', 'EFFTRONICS\PADMAJA', 'EFFTRONICS\PKOTESWARARAO', 'EFFTRONICS\MEENA', 'EFFTRONICS\GRAVI',
                           'EFFTRONICS\ANUSHAG', 'EFFTRONICS\ANILKUMAR', 'EFFTRONICS\VIJAYA', 'EFFTRONICS\SUJANI']) THEN
            ERROR('You have No Rights to Change the Item Groups');
    end;

    [LineStart(14484)]
    local procedure NoOnFormat();
    begin
        IF "Product Group Code" = 'FPRODUCT' THEN BEGIN
            "No.Emphasize" := TRUE;
        END ELSE
            IF "Product Group Code" = 'CPCB' THEN BEGIN
                "No.Emphasize" := TRUE;
            END ELSE
                IF FORMAT("Item Status") = 'Obsolute' THEN BEGIN
                    "No.Emphasize" := TRUE;
                END ELSE BEGIN
                    "No.Emphasize" := FALSE;
                END;
    end;

    [LineStart(14499)]
    local procedure DescriptionOnFormat();
    begin
        IF "Product Group Code" = 'FPRODUCT' THEN BEGIN
            DescriptionEmphasize := TRUE;
        END ELSE
            IF "Product Group Code" = 'CPCB' THEN BEGIN
                DescriptionEmphasize := TRUE;
            END ELSE
                IF FORMAT("Item Status") = 'Obsolute' THEN BEGIN
                    DescriptionEmphasize := TRUE;

                END ELSE BEGIN
                    DescriptionEmphasize := FALSE;
                END;
    end;

    [LineStart(14515)]
    local procedure CheckinPurchaseOrders_and_SaleOrders(ItemNumber: Code[20]) Existedornot: Boolean;
    var
        SL: Record "Sales Line";
        PL: Record "Purchase Line";
        SIL: Record "Sales Invoice Line";
    begin
        PL.RESET;
        PL.SETCURRENTKEY(PL."No.", PL."Unit Cost (LCY)");
        PL.SETRANGE(PL."Document Type", PL."Document Type"::Order);
        PL.SETFILTER(PL.Type, '<>%1', PL.Type::"G/L Account");
        PL.SETFILTER(PL."No.", ItemNumber);
        IF PL.FINDFIRST THEN
            Existedornot := TRUE
        ELSE BEGIN
            SL.RESET;
            SL.SETCURRENTKEY(SL.Type, SL."No.", SL."Variant Code", SL."Drop Shipment", SL."Location Code", SL."Document Type", SL."Shipment Date");
            SL.SETRANGE(SL.Type, SL.Type::Item);
            SL.SETFILTER(SL."No.", ItemNumber);
            // SL.SETFILTER("Product Group Code",'<>%1','<>%2','FPRODUCT','CPCB');
            IF SL.FINDFIRST THEN
                IF NOT (SL."Product Group Code" IN ['FPRODUCT', 'CPCB']) THEN
                    Existedornot := TRUE
                ELSE BEGIN
                    SIL.RESET;
                    SIL.SETCURRENTKEY(SIL."Document No.", SIL."No.");
                    SIL.SETRANGE(SIL.Type, SIL.Type::Item);
                    SIL.SETFILTER(SIL."No.", ItemNumber);
                    //SIL.SETFILTER("Product Group Code",'<>%1','<>%2','FPRODUCT','CPCB');
                    IF SIL.FINDFIRST THEN
                        IF NOT (SIL."Product Group Code" IN ['FPRODUCT', 'CPCB']) THEN
                            Existedornot := TRUE
                        ELSE
                            Existedornot := FALSE;
                END
        END;
    end;
}

