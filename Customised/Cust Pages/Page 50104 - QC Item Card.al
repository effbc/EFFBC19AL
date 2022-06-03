page 50104 "QC Item Card"
{
    // version NAVW13.70,NAVIN3.70.01.11,QC1.0,QCB2B1.2,B2B1.0,QC1.2,DWS1.0,Rev01

    Caption = 'Item Card';
    Editable = true;
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = Item;
    SourceTableView = SORTING(No.) ORDER(Ascending) WHERE(Product Group Code=FILTER(<>CPCB&<>FPRODUCT));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No.";"No.")
                {
                    Editable = false;
                }
                field(Description;Description)
                {
                    Editable = false;
                }
                field("Description 2";"Description 2")
                {
                    Editable = false;
                }
                field("Base Unit of Measure";"Base Unit of Measure")
                {
                    Editable = false;
                }
                field("Item Category Code";"Item Category Code")
                {
                    Editable = false;
                }
                field("Product Group Code";"Product Group Code")
                {
                    Editable = false;
                }
                field("Item Sub Group Code";"Item Sub Group Code")
                {
                    Editable = false;
                }
                field("Inspection Bench Mark(In Min)";"Inspection Bench Mark(In Min)")
                {
                }
                field("Sampling Count";"Sampling Count")
                {
                }
                field("Sampling %";"Sampling %")
                {
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
                    Image = InsertBalanceAccount;
                    action("Inspection Data Sheets")
                    {
                        Caption = 'Inspection Data Sheets';
                        Image = OpenWorksheet;

                        trigger OnAction();
                        begin
                            ShowDataSheets;
                        end;
                    }
                    action("Posted Inspection Data Sheets")
                    {
                        Caption = 'Posted Inspection Data Sheets';
                        Image = PostedTaxInvoice;

                        trigger OnAction();
                        begin
                            ShowPostDataSheets;
                        end;
                    }
                    action("Inspection &Receipts")
                    {
                        Caption = 'Inspection &Receipts';
                        Image = NewReceipt;

                        trigger OnAction();
                        begin
                            ShowInspectReceipt;
                        end;
                    }
                    action("Posted I&nspection Receipts")
                    {
                        Caption = 'Posted I&nspection Receipts';
                        Image = PostedReceipts;

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
                    Image = NewToDo;

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
                    Image = BinContent;
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
                    Image = Text;
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
                    Image = ItemVariant;

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
                    Image = Production;
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
                        Image = "Where-Used";
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
                    Image = ServiceMan;
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
                    Image = Troubleshoot;
                    action("Troubleshooting &Setup")
                    {
                        Caption = 'Troubleshooting &Setup';
                        Image = Troubleshoot;
                        RunObject = Page "Troubleshooting Setup";
                                        RunPageLink = Type=CONST(Item),No.=FIELD(No.);
                    }
                    action(Action186)
                    {
                        Caption = 'Troubles&hooting';
                        Image = Troubleshoot;

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
                    Image = BarCode;
                    RunObject = Page "Item Identifiers";
                                    RunPageLink = Item No.=FIELD(No.);
                    RunPageView = SORTING(Item No.,Variant Code,Unit of Measure Code);
                }
                action(Specifications)
                {
                    Caption = 'Specifications';
                    Image = Versions;
                    RunObject = Page "Item Specification";
                                    RunPageLink = Item No.=FIELD(No.),Product Group Code=FIELD(Product Group Code),Item Category Code=FIELD(Item Category Code),Item Sub Group Code=FIELD(Item Sub Group Code),Item Sub Sub Group Code=FIELD(Item Sub Sub Group Code);
                }
                action(Attachments)
                {
                    Caption = 'Attachments';
                    Image = Attachments;
                    RunObject = Page "ESPL Attachments";
                                    RunPageLink = Table ID=CONST(27),Document No.=FIELD(No.);
                }
                action("Design Work Sheet")
                {
                    Caption = 'Design Work Sheet';
                    Image = PlanningWorksheet;
                    RunObject = Page "Item Design WorkSheet Header";
                                    RunPageLink = Item No.=FIELD(No.);
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
                    Image = "Order";
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
                    Image = "Order";
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
            Caption = '<Action1102152000>';
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
                action("Update BOM Cost")
                {
                    Caption = 'Update BOM Cost';
                    Image = UpdateUnitCost;

                    trigger OnAction();
                    begin
                        ItemCostUpdation.UpdateBOMCost;
                    end;
                }
                action("Update Routing Cost")
                {
                    Caption = 'Update Routing Cost';
                    Image = UpdateUnitCost;

                    trigger OnAction();
                    begin
                        ItemCostUpdation.RoutingCostUpdation;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
         "Stock at Stores":=0 ;
        ItemCostMgt.CalculateAverageCost(Rec,AverageCostLCY,AverageCostACY);
        EnablePlanningControls;
        //B2B
        IF ("QC Enabled" = TRUE) AND (Inventory >= 0) THEN
          "Quantity Accepted" := Inventory - ("Quantity Rejected" + "Quantity Under Inspection" + "Quantity Rework" +
            "Quantity Sent for Rework");
        /*
        PurchaseInvLine.RESET;
        PurchaseInvLine.SETCURRENTKEY(Type,"No.","Variant Code");
        PurchaseInvLine.SETRANGE(Type,PurchaseInvLine.Type::Item);
        PurchaseInvLine.SETRANGE("No.","No.");
        IF PurchaseInvLine.FINDSET THEN
          REPEAT
            TotQty+=PurchaseInvLine.Quantity;
            TotVendorAmt+=PurchaseInvLine."Amount To Vendor";
          UNTIL PurchaseInvLine.NEXT=0;
        IF TotVendorAmt<>0 THEN
          "Avg Unit Cost":=TotVendorAmt/TotQty;
        //B2B
         */
        
        //B2B
        "Stock at Stores":=0;
        CALCFIELDS("Inventory at Stores");
        CALCFIELDS("Quantity Rejected");
        CALCFIELDS("Quantity Under Inspection");
        //"Inventory at STR" := "Inventory at Stores" - ("Quantity Under Inspection"+"Quantity Rejected");
        //"Stock at Stores":= "Inventory at Stores"- ("Quantity Under Inspection"+"Quantity Rejected");
         IF "Stock at Stores"<0 THEN
         "Stock at Stores":=0;//a190808
        
        //anil
        
        CALCFIELDS("Quantity Under Inspection","Quantity Rejected","Quantity Rework","Quantity Sent for Rework");
        //IF "QC Enabled" = TRUE THEN BEGIN
         IF ("Quantity Under Inspection"=0)AND ("Quantity Rejected"=0) AND ("Quantity Rework"=0) AND ("Quantity Sent for Rework"=0) THEN
          BEGIN
        
         //  "Stock at Stores":=0 ;
          ItemLedgEntry.RESET;
          ItemLedgEntry.SETCURRENTKEY("Item No.","Variant Code",Open,Positive,"Location Code","Posting Date",
          "Expiration Date","Lot No.","Serial No.");
          ItemLedgEntry.SETRANGE("Item No.","No.");
          ItemLedgEntry.SETRANGE(Open,TRUE);
          ItemLedgEntry.SETRANGE("Location Code",'STR');
          ItemLedgEntry.SETFILTER(ItemLedgEntry."Remaining Quantity",'>%1',0);
          IF ItemLedgEntry.FINDSET THEN
          REPEAT
             ItemLedgEntry.MARK(TRUE);
          UNTIL ItemLedgEntry.NEXT=0;
         // FORM.RUNMODAL(38,ItemLedgEntry);
         END ELSE BEGIN
        
        
          ItemLedgEntry.RESET;
          ItemLedgEntry.SETCURRENTKEY("Item No.","Variant Code",Open,Positive,"Location Code","Posting Date",
          "Expiration Date","Lot No.","Serial No.");
        
          ItemLedgEntry.SETRANGE("Item No.","No.");
          ItemLedgEntry.SETRANGE(Open,TRUE);
          ItemLedgEntry.SETRANGE("Location Code",'STR');
          ItemLedgEntry.SETFILTER(ItemLedgEntry."Remaining Quantity",'>%1',0);
          IF ItemLedgEntry.FINDSET THEN
          REPEAT
           ItemLedgEntry.MARK(TRUE);
           IF (QualityItemLedgEntry.GET(ItemLedgEntry."Entry No.") AND (QualityItemLedgEntry."Inspection Status"=
           QualityItemLedgEntry."Inspection Status"::"Under Inspection")) OR
           (QualityItemLedgEntry.GET(ItemLedgEntry."Entry No.")
           AND (QualityItemLedgEntry."Inspection Status"=QualityItemLedgEntry."Inspection Status"::Rejected)) THEN
            ItemLedgEntry.MARK(FALSE);
          //  "Stock at Stores":="Stock at Stores"+ItemLedgEntry."Remaining Quantity";
          UNTIL ItemLedgEntry.NEXT=0;
          //FORM.RUNMODAL(38,ItemLedgEntry);
          END;
        //END;
        
        
          ItemLedgEntry.MARKEDONLY(TRUE);
          IF ItemLedgEntry.FINDSET THEN
          REPEAT
        
            "Stock at Stores":="Stock at Stores"+ItemLedgEntry."Remaining Quantity";
          UNTIL ItemLedgEntry.NEXT=0;
        
        
             //anil260808
        
        /*
        CALCFIELDS("Quantity Under Inspection","Quantity Rejected","Quantity Rework","Quantity Sent for Rework");
        IF "QC Enabled" = TRUE THEN BEGIN
         IF ("Quantity Under Inspection"=0)AND ("Quantity Rejected"=0) AND ("Quantity Rework"=0) AND ("Quantity Sent for Rework"=0) THEN
          BEGIN
          ItemLedgEntry.RESET;
          ItemLedgEntry.SETCURRENTKEY("Item No.","Variant Code",Open,Positive,"Location Code","Posting Date",
          "Expiration Date","Lot No.","Serial No.");
          ItemLedgEntry.SETRANGE("Item No.","No.");
          ItemLedgEntry.SETRANGE(Open,TRUE);
          ItemLedgEntry.SETRANGE("Location Code",'STR');
          IF ItemLedgEntry.FINDFIRST THEN
          REPEAT
            "Stock at Stores":="Stock at Stores"+ItemLedgEntry."Remaining Quantity";
          UNTIL ItemLedgEntry.NEXT=0;
         // FORM.RUNMODAL(38,ItemLedgEntry);
         END ELSE BEGIN
          ItemLedgEntry.RESET;
          ItemLedgEntry.SETCURRENTKEY("Item No.","Variant Code",Open,Positive,"Location Code","Posting Date",
          "Expiration Date","Lot No.","Serial No.");
        
          ItemLedgEntry.SETRANGE("Item No.","No.");
          ItemLedgEntry.SETRANGE(Open,TRUE);
          ItemLedgEntry.SETRANGE("Location Code",'STR');
          IF ItemLedgEntry.FINDFIRST THEN
          REPEAT
           {IF (QualityItemLedgEntry.GET(ItemLedgEntry."Entry No.") AND (QualityItemLedgEntry."Inspection Status"=
           QualityItemLedgEntry."Inspection Status"::"Under Inspection")) OR
           (QualityItemLedgEntry.GET(ItemLedgEntry."Entry No.")
           AND (QualityItemLedgEntry."Inspection Status"=QualityItemLedgEntry."Inspection Status"::"Reject")) THEN
            ItemLedgEntry.MARK(FALSE);
          UNTIL ItemLedgEntry.NEXT=0; }
        
           ItemLedgEntry.MARK(TRUE);
           IF( (QualityItemLedgEntry.GET(ItemLedgEntry."Entry No.") AND
           (QualityItemLedgEntry."Inspection Status"=QualityItemLedgEntry."Inspection Status"::"Under Inspection"))
            OR (QualityItemLedgEntry.GET(ItemLedgEntry."Entry No.")
           AND (QualityItemLedgEntry."Inspection Status"=QualityItemLedgEntry."Inspection Status"::Rejected))) THEN
            ItemLedgEntry.MARK(FALSE);
            "Stock at Stores":="Stock at Stores"+ItemLedgEntry."Remaining Quantity";
          UNTIL ItemLedgEntry.NEXT=0;
          ItemLedgEntry.MARKEDONLY(TRUE);
        //  FORM.RUNMODAL(38,ItemLedgEntry);
          END;
        END;
        */
        
        //******** Santhosh
        /*
        CALCFIELDS("Quantity Under Inspection","Quantity Rejected","Quantity Rework","Quantity Sent for Rework");
        IF "QC Enabled" = TRUE THEN BEGIN
         IF ("Quantity Under Inspection"=0)AND ("Quantity Rejected"=0) AND ("Quantity Rework"=0) AND ("Quantity Sent for Rework"=0) THEN
          BEGIN
          // "Stock at Stores":=0 ;
          ItemLedgEntry.RESET;
          ItemLedgEntry.SETCURRENTKEY("Item No.","Variant Code",Open,Positive,"Location Code","Posting Date",
          "Expiration Date","Lot No.","Serial No.");
          ItemLedgEntry.SETRANGE("Item No.","No.");
          ItemLedgEntry.SETRANGE(Open,TRUE);
          ItemLedgEntry.SETRANGE("Location Code",'MCH');
         // FORM.RUNMODAL(38,ItemLedgEntry);
         END ELSE BEGIN
          "Stock at Stores":=0 ;
          ItemLedgEntry.RESET;
          ItemLedgEntry.SETCURRENTKEY("Item No.","Variant Code",Open,Positive,"Location Code","Posting Date",
          "Expiration Date","Lot No.","Serial No.");
        
          ItemLedgEntry.SETRANGE("Item No.","No.");
          ItemLedgEntry.SETRANGE(Open,TRUE);
          ItemLedgEntry.SETRANGE("Location Code",'MCH');
          IF ItemLedgEntry.FINDFIRST THEN
          REPEAT
           ItemLedgEntry.MARK(TRUE);
           IF (QualityItemLedgEntry.GET(ItemLedgEntry."Entry No.") AND (QualityItemLedgEntry."Inspection Status"=
           QualityItemLedgEntry."Inspection Status"::"Under Inspection")) OR
           (QualityItemLedgEntry.GET(ItemLedgEntry."Entry No.")
           AND (QualityItemLedgEntry."Inspection Status"=QualityItemLedgEntry."Inspection Status"::Rejected)) THEN
            ItemLedgEntry.MARK(FALSE);
          //  "Stock at Stores":="Stock at Stores"+ItemLedgEntry."Remaining Quantity";
          UNTIL ItemLedgEntry.NEXT=0;
          //FORM.RUNMODAL(38,ItemLedgEntry);
          END;
        END;
          ItemLedgEntry.MARKEDONLY(TRUE);
          IF ItemLedgEntry.FINDFIRST THEN
          REPEAT
            StockAtMCH:=StockAtMCH+ItemLedgEntry."Remaining Quantity";
             UNTIL ItemLedgEntry.NEXT=0;
        //***********santhosh
        */
        /*
        atta:=FALSE;
        attachments.RESET;
        attachments.SETRANGE("Table ID",DATABASE::Item);
        attachments.SETRANGE("Document No.","No.");
        IF attachments.COUNT>0 THEN
        atta:=TRUE;
           */

    end;

    trigger OnOpenPage();
    begin
        CALCFIELDS("Inventory at Stores");
        CALCFIELDS("Quantity Under Inspection");
        CALCFIELDS("Quantity Rejected");
        "Inventory at STR" := "Inventory at Stores" - ("Quantity Under Inspection"+"Quantity Rejected");
        /*
        atta:=FALSE;
        attachments.RESET;
        attachments.SETRANGE("Table ID",DATABASE::Item);
        attachments.SETRANGE("Document No.","No.");
        IF attachments.COUNT>0 THEN
        atta:=TRUE;
        */
        "Stock at Stores":= "Inventory at Stores"- ("Quantity Under Inspection"+"Quantity Rejected");
         IF "Stock at Stores"<0 THEN
         "Stock at Stores":=0;
        
          // MODIFY;

    end;

    var
        TroubleshHeader : Record "Troubleshooting Header";
        ItemCostMgt : Codeunit ItemCostManagement;
        CalculateStdCost : Codeunit "Calculate Standard Cost";
        AverageCostLCY : Decimal;
        AverageCostACY : Decimal;
        "Inventory at STR" : Decimal;
        "--B2B--" : Integer;
        PurchaseInvLine : Record "Purch. Inv. Line";
        TotVendorAmt : Decimal;
        TotQty : Decimal;
        ItemCostUpdation : Codeunit "Item Cost Updation";
        atta : Boolean;
        attachments : Record Attachments;
        ItemLedgEntry : Record "Item Ledger Entry";
        QualityItemLedgEntry : Record "Quality Item Ledger Entry";
        StockAtMCH : Decimal;
        "Alternate Item" : Record "Alternate Items";
        SkilledResourceList : Page "Skilled Resource List";

    [LineStart(3420)]
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
    begin
    end;
}

