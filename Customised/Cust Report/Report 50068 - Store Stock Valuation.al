report 50068 "Store Stock Valuation"
{
    // version Rev01,Eff02,EFFUPG

    DefaultLayout = RDLC;
    RDLCLayout = './Store Stock Valuation.rdlc';

    dataset
    {
        dataitem(Item; Item)
        {
            CalcFields = Qty. on Purch. Order, Quantity Under Inspection, Stock At MCH Location;
            DataItemTableView = SORTING(Item Stock Value, No.) ORDER(Descending) WHERE(Product Group Code=FILTER(<>FPRODUCT&<>CPCB));
            ReqFilterHeading = 'Stock';
            column(ToDate;ToDate)
            {
            }
            column(T_1_;T[1])
            {
            }
            column(T_2_;T[2])
            {
            }
            column(T_3_;T[3])
            {
            }
            column(T_4_;T[4])
            {
            }
            column(Item__No__;"No.")
            {
            }
            column(Item_Description;Description)
            {
            }
            column(Stock_At_Stores;Stock_At_Stores)
            {
            }
            column(Item__Avg_Unit_Cost__Stock_At_Stores;Item."Avg Unit Cost"*Stock_At_Stores)
            {
            }
            column(Item_Item__Avg_Unit_Cost_;Item."Avg Unit Cost")
            {
            }
            column(Item__Base_Unit_of_Measure_;"Base Unit of Measure")
            {
            }
            column(Item_Item_verified;Item_verified)
            {
            }
            column(TOTAL;TOTAL)
            {
            }
            column(CNT;CNT)
            {
            }
            column(Product_Wise_Stock_Values_1_;Product_Wise_Stock_Values[1])
            {
            }
            column(Product_Wise_Stock_Values_2_;Product_Wise_Stock_Values[2])
            {
            }
            column(Product_Wise_Stock_Values_3_;Product_Wise_Stock_Values[3])
            {
            }
            column(Product_Wise_Stock_Values_4_;Product_Wise_Stock_Values[4])
            {
            }
            column(Product_Wise_Stock_Values_5_;Product_Wise_Stock_Values[5])
            {
            }
            column(Product_Wise_Stock_Values_6_;Product_Wise_Stock_Values[6])
            {
            }
            column(Product_Wise_Stock_Values_7_;Product_Wise_Stock_Values[7])
            {
            }
            column(Product_Wise_Stock_Values_8_;Product_Wise_Stock_Values[8])
            {
            }
            column(YestedDay__Inward_Value_;"YestedDay_ Inward_Value")
            {
            }
            column(YesterDay_Issues_Value;YesterDay_Issues_Value)
            {
            }
            column(YesterDay_Adjustments_Value;YesterDay_Adjustments_Value)
            {
            }
            column(StockCaption;StockCaptionLbl)
            {
            }
            column(Stock_Valution_OnCaption;Stock_Valution_OnCaptionLbl)
            {
            }
            column(Item__No__Caption;FIELDCAPTION("No."))
            {
            }
            column(Item_DescriptionCaption;FIELDCAPTION(Description))
            {
            }
            column(Stock_At_StoresCaption;Stock_At_StoresCaptionLbl)
            {
            }
            column(ValueCaption;ValueCaptionLbl)
            {
            }
            column(Unit_CostCaption;Unit_CostCaptionLbl)
            {
            }
            column(UOMCaption;UOMCaptionLbl)
            {
            }
            column(Item_VerifiedCaption;Item_VerifiedCaptionLbl)
            {
            }
            column(Stock_ValueCaption;Stock_ValueCaptionLbl)
            {
            }
            column(No__Of_ItemsCaption;No__Of_ItemsCaptionLbl)
            {
            }
            column(Product_Wise_Stock_ValueCaption;Product_Wise_Stock_ValueCaptionLbl)
            {
            }
            column(Data_LoggerCaption;Data_LoggerCaptionLbl)
            {
            }
            column(Rly___LampCaption;Rly___LampCaptionLbl)
            {
            }
            column(Road_LampCaption;Road_LampCaptionLbl)
            {
            }
            column(DisplaysCaption;DisplaysCaptionLbl)
            {
            }
            column(SystemCaption;SystemCaptionLbl)
            {
            }
            column(OthersCaption;OthersCaptionLbl)
            {
            }
            column(Yesterday_Inward_ValueCaption;Yesterday_Inward_ValueCaptionLbl)
            {
            }
            column(Yesteday_Issues_ValueCaption;Yesteday_Issues_ValueCaptionLbl)
            {
            }
            column(Yesterday_Adjustment_ValueCaption;Yesterday_Adjustment_ValueCaptionLbl)
            {
            }
            column(BlanksCaption;BlanksCaptionLbl)
            {
            }
            column(Dead_StockCaption;Dead_StockCaptionLbl)
            {
            }
            column(ItemBodyVisi;ItemBodyVisi)
            {
            }

            trigger OnAfterGetRecord();
            begin
                ItemBodyVisi := FALSE;
                      Stock_At_Stores:=0;
                  IF Dead AND (NOT STR) THEN
                     Stock_At_Stores:=Item."Stock at Stores";
                
                  IF (STR)  THEN
                  BEGIN
                    Stock_At_Stores:=Item."Stock at Stores";
                    IF DT2DATE(ToDate)<DT2DATE(CURRENTDATETIME) THEN
                    BEGIN
                      "Posted Material Issues line".RESET;
                      "Posted Material Issues line".SETCURRENTKEY("Posted Material Issues line"."Item No.",
                      "Posted Material Issues line"."Transfer-from Code","Posted Material Issues line"."Issued DateTime");
                
                      "Posted Material Issues line".SETRANGE("Posted Material Issues line"."Item No.",Item."No.");
                      "Posted Material Issues line".SETFILTER("Posted Material Issues line"."Transfer-from Code",'STR');
                      "Posted Material Issues line".SETRANGE("Posted Material Issues line"."Issued DateTime",ToDate,CURRENTDATETIME);
                      "Posted Material Issues line".CALCSUMS("Posted Material Issues line".Quantity);
                          Stock_At_Stores+="Posted Material Issues line".Quantity;
                
                      "Posted Material Issues line".RESET;
                      "Posted Material Issues line".SETCURRENTKEY("Posted Material Issues line"."Item No.",
                      "Posted Material Issues line"."Transfer-from Code","Posted Material Issues line"."Issued DateTime");
                      "Posted Material Issues line".SETRANGE("Posted Material Issues line"."Item No.",Item."No.");
                      "Posted Material Issues line".SETFILTER("Posted Material Issues line"."Transfer-to Code",'STR');
                      "Posted Material Issues line".SETRANGE("Posted Material Issues line"."Issued DateTime",ToDate,CURRENTDATETIME);
                      IF "Posted Material Issues line".FIND('-') THEN
                      REPEAT
                        Stock_At_Stores-="Posted Material Issues line".Quantity;
                      UNTIL "Posted Material Issues line".NEXT=0;
                       // Item No.,Entry Type,Variant Code,Drop Shipment,Location Code,Posting Date
                        ItemLedgEntry.RESET;
                        ItemLedgEntry.SETCURRENTKEY(ItemLedgEntry."Item No.",
                                                    ItemLedgEntry."Entry Type",
                                                    ItemLedgEntry."Variant Code",
                                                    ItemLedgEntry."Drop Shipment",
                                                    ItemLedgEntry."Location Code",
                                                    ItemLedgEntry."Posting Date");
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Entry Type",ItemLedgEntry."Entry Type"::"Positive Adjmt.");
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Item No.",Item."No.");
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Location Code",'STR');
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Posting Date",DT2DATE(ToDate),TODAY);
                        ItemLedgEntry.CALCSUMS(ItemLedgEntry.Quantity);
                        Stock_At_Stores-=ABS(ItemLedgEntry.Quantity);
                
                        ItemLedgEntry.RESET;
                        ItemLedgEntry.SETCURRENTKEY(ItemLedgEntry."Item No.",
                                                    ItemLedgEntry."Entry Type",
                                                    ItemLedgEntry."Variant Code",
                                                    ItemLedgEntry."Drop Shipment",
                                                    ItemLedgEntry."Location Code",
                                                    ItemLedgEntry."Posting Date");
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Entry Type",ItemLedgEntry."Entry Type"::"Negative Adjmt.");
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Item No.",Item."No.");
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Location Code",'STR');
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Posting Date",DT2DATE(ToDate),TODAY);
                        ItemLedgEntry.CALCSUMS(ItemLedgEntry.Quantity);
                        Stock_At_Stores+=ABS(ItemLedgEntry.Quantity);
                
                      PRL.SETCURRENTKEY(PRL."No.");
                      PRL.SETRANGE(PRL."No.",Item."No.");
                      PRL.SETFILTER(PRL."Location Code",'STR');
                      PRL.SETRANGE(PRL."Document date",DT2DATE(ToDate),TODAY);
                      IF PRL.FIND('-') THEN
                      REPEAT
                        ItemLedgEntry.RESET;
                        ItemLedgEntry.SETCURRENTKEY(ItemLedgEntry."Document No.",
                                                    ItemLedgEntry."Item No.",
                                                    ItemLedgEntry."Posting Date");
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Document No.",PRL."Document No.");
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Item No.",PRL."No.");
                        IF ItemLedgEntry.FIND('-') THEN
                        BEGIN
                          IF NOT(QualityItemLedgEntry.GET(ItemLedgEntry."Entry No.")) THEN
                             Stock_At_Stores-=ABS(PRL.Quantity);
                        END;
                      UNTIL PRL.NEXT=0;
                    END;
                  END;
                
                  IF QC  AND (DT2DATE(ToDate)=TODAY) THEN
                  BEGIN
                    QualityItemLedgEntry.RESET;
                    QualityItemLedgEntry.SETCURRENTKEY(QualityItemLedgEntry."Item No.",
                                                       QualityItemLedgEntry."Location Code",
                                                       QualityItemLedgEntry.Open,
                                                       QualityItemLedgEntry."Variant Code",
                                                       QualityItemLedgEntry."Unit of Measure Code",
                                                       QualityItemLedgEntry."Lot No.",
                                                       QualityItemLedgEntry."Serial No.");
                    QualityItemLedgEntry.SETRANGE(QualityItemLedgEntry."Item No.",Item."No.");
                    QualityItemLedgEntry.SETRANGE(QualityItemLedgEntry."Inspection Status",0);  //anil
                    QualityItemLedgEntry.SETRANGE(QualityItemLedgEntry.Accept,TRUE);
                    QualityItemLedgEntry.SETRANGE(QualityItemLedgEntry."Location Code",'STR');
                    IF QualityItemLedgEntry.FIND('-') THEN
                    REPEAT
                      Stock_At_Stores+=QualityItemLedgEntry."Remaining Quantity";
                    UNTIL QualityItemLedgEntry.NEXT=0;
                  END ELSE
                  IF QC AND (DT2DATE(ToDate)<>TODAY) THEN
                  BEGIN
                    QualityItemLedgEntry.RESET;
                    QualityItemLedgEntry.SETCURRENTKEY(QualityItemLedgEntry."Item No.",
                                                       QualityItemLedgEntry."Location Code",
                                                       QualityItemLedgEntry.Open,
                                                       QualityItemLedgEntry."Variant Code",
                                                       QualityItemLedgEntry."Unit of Measure Code",
                                                       QualityItemLedgEntry."Lot No.",
                                                       QualityItemLedgEntry."Serial No.");
                
                    QualityItemLedgEntry.SETRANGE(QualityItemLedgEntry."Item No.",Item."No.");
                    QualityItemLedgEntry.SETRANGE(QualityItemLedgEntry."Inspection Status",0);  //anil
                    QualityItemLedgEntry.SETRANGE(QualityItemLedgEntry.Accept,TRUE);
                    QualityItemLedgEntry.SETRANGE(QualityItemLedgEntry."Location Code",'STR');
                    QualityItemLedgEntry.SETFILTER(QualityItemLedgEntry."Posting Date",'<=%1',DT2DATE(ToDate));
                    IF QualityItemLedgEntry.FIND('-') THEN
                    REPEAT
                      Stock_At_Stores+=QualityItemLedgEntry."Remaining Quantity";
                    UNTIL QualityItemLedgEntry.NEXT=0;
                  END;
                  IF RD_STR THEN
                  BEGIN
                    Item.CALCFIELDS(Item."Stock at RD Stores");
                    Stock_At_Stores+=Item."Stock at RD Stores";
                
                    IF DT2DATE(ToDate)<DT2DATE(CURRENTDATETIME) THEN
                    BEGIN
                      "Posted Material Issues line".RESET;
                      "Posted Material Issues line".SETCURRENTKEY("Posted Material Issues line"."Item No.",
                      "Posted Material Issues line"."Transfer-from Code","Posted Material Issues line"."Issued DateTime");
                
                      "Posted Material Issues line".SETRANGE("Posted Material Issues line"."Item No.",Item."No.");
                      "Posted Material Issues line".SETFILTER("Posted Material Issues line"."Transfer-from Code",'''R&D STR''');
                      "Posted Material Issues line".SETRANGE("Posted Material Issues line"."Issued DateTime",ToDate,CURRENTDATETIME);
                      "Posted Material Issues line".CALCSUMS("Posted Material Issues line".Quantity);
                      Stock_At_Stores+="Posted Material Issues line".Quantity;
                
                      "Posted Material Issues line".RESET;
                      "Posted Material Issues line".SETCURRENTKEY("Posted Material Issues line"."Item No.",
                      "Posted Material Issues line"."Transfer-from Code","Posted Material Issues line"."Issued DateTime");
                      "Posted Material Issues line".SETRANGE("Posted Material Issues line"."Item No.",Item."No.");
                      "Posted Material Issues line".SETFILTER("Posted Material Issues line"."Transfer-to Code",'''R&D STR''');
                      "Posted Material Issues line".SETRANGE("Posted Material Issues line"."Issued DateTime",ToDate,CURRENTDATETIME);
                      IF "Posted Material Issues line".FIND('-') THEN
                      REPEAT
                        Stock_At_Stores-=ABS("Posted Material Issues line".Quantity);
                      UNTIL "Posted Material Issues line".NEXT=0;
                
                        ItemLedgEntry.RESET;
                        ItemLedgEntry.SETCURRENTKEY(ItemLedgEntry."Item No.",
                                                    ItemLedgEntry."Entry Type",
                                                    ItemLedgEntry."Variant Code",
                                                    ItemLedgEntry."Drop Shipment",
                                                    ItemLedgEntry."Location Code",
                                                    ItemLedgEntry."Posting Date");
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Entry Type",ItemLedgEntry."Entry Type"::"Positive Adjmt.");
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Item No.",Item."No.");
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Location Code",'''R&D STR''');
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Posting Date",DT2DATE(ToDate),TODAY);
                        ItemLedgEntry.CALCSUMS(ItemLedgEntry.Quantity);
                        Stock_At_Stores-=ABS(ItemLedgEntry.Quantity);
                
                        ItemLedgEntry.RESET;
                        ItemLedgEntry.SETCURRENTKEY(ItemLedgEntry."Item No.",
                                                    ItemLedgEntry."Entry Type",
                                                    ItemLedgEntry."Variant Code",
                                                    ItemLedgEntry."Drop Shipment",
                                                    ItemLedgEntry."Location Code",
                                                    ItemLedgEntry."Posting Date");
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Entry Type",ItemLedgEntry."Entry Type"::"Negative Adjmt.");
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Item No.",Item."No.");
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Location Code",'''R&D STR''');
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Posting Date",DT2DATE(ToDate),TODAY);
                        ItemLedgEntry.CALCSUMS(ItemLedgEntry.Quantity);
                        Stock_At_Stores+=ABS(ItemLedgEntry.Quantity);
                
                      PRL.SETCURRENTKEY(PRL."No.");
                      PRL.SETRANGE(PRL."No.",Item."No.");
                      PRL.SETFILTER(PRL."Location Code",'''R&D STR''');
                      PRL.SETRANGE(PRL."Document date",DT2DATE(ToDate),TODAY);
                      IF PRL.FIND('-') THEN
                      REPEAT
                        Stock_At_Stores-=PRL.Quantity;
                      UNTIL PRL.NEXT=0;
                    END;
                  END;
                
                
                  IF CS_STR THEN
                  BEGIN
                      Item.CALCFIELDS(Item."Stock at CS Stores");
                      Stock_At_Stores+=Item."Stock at CS Stores";
                      IF DT2DATE(ToDate)<TODAY THEN
                      BEGIN
                        "Posted Material Issues line".RESET;
                        "Posted Material Issues line".SETCURRENTKEY("Posted Material Issues line"."Item No.",
                        "Posted Material Issues line"."Transfer-from Code","Posted Material Issues line"."Issued DateTime");
                        "Posted Material Issues line".SETRANGE("Posted Material Issues line"."Item No.",Item."No.");
                        "Posted Material Issues line".SETFILTER("Posted Material Issues line"."Transfer-from Code",'CS STR');
                        "Posted Material Issues line".SETRANGE("Posted Material Issues line"."Issued DateTime",ToDate,CURRENTDATETIME);
                        "Posted Material Issues line".CALCSUMS("Posted Material Issues line".Quantity);
                        Stock_At_Stores+="Posted Material Issues line".Quantity;
                
                        "Posted Material Issues line".RESET;
                        "Posted Material Issues line".SETCURRENTKEY("Posted Material Issues line"."Item No.",
                        "Posted Material Issues line"."Transfer-from Code","Posted Material Issues line"."Issued DateTime");
                        "Posted Material Issues line".SETCURRENTKEY("Posted Material Issues line"."Item No.");
                        "Posted Material Issues line".SETRANGE("Posted Material Issues line"."Item No.",Item."No.");
                        "Posted Material Issues line".SETFILTER("Posted Material Issues line"."Transfer-to Code",'CS STR');
                        "Posted Material Issues line".SETRANGE("Posted Material Issues line"."Issued DateTime",ToDate,CURRENTDATETIME);
                        IF "Posted Material Issues line".FIND('-') THEN
                        REPEAT
                          Stock_At_Stores-="Posted Material Issues line".Quantity;
                        UNTIL "Posted Material Issues line".NEXT=0;
                        ItemLedgEntry.RESET;
                        ItemLedgEntry.SETCURRENTKEY(ItemLedgEntry."Item No.",
                                                    ItemLedgEntry."Entry Type",
                                                    ItemLedgEntry."Variant Code",
                                                    ItemLedgEntry."Drop Shipment",
                                                    ItemLedgEntry."Location Code",
                                                    ItemLedgEntry."Posting Date");
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Entry Type",ItemLedgEntry."Entry Type"::"Positive Adjmt.");
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Item No.",Item."No.");
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Location Code",'CS STR');
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Posting Date",DT2DATE(ToDate),TODAY);
                        ItemLedgEntry.CALCSUMS(ItemLedgEntry.Quantity);
                        Stock_At_Stores-=ABS(ItemLedgEntry.Quantity);
                
                        ItemLedgEntry.RESET;
                        ItemLedgEntry.SETCURRENTKEY(ItemLedgEntry."Item No.",
                                                    ItemLedgEntry."Entry Type",
                                                    ItemLedgEntry."Variant Code",
                                                    ItemLedgEntry."Drop Shipment",
                                                    ItemLedgEntry."Location Code",
                                                    ItemLedgEntry."Posting Date");
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Entry Type",ItemLedgEntry."Entry Type"::"Negative Adjmt.");
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Item No.",Item."No.");
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Location Code",'CS STR');
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Posting Date",DT2DATE(ToDate),TODAY);
                        ItemLedgEntry.CALCSUMS(ItemLedgEntry.Quantity);
                        Stock_At_Stores+=ABS(ItemLedgEntry.Quantity);
                
                        PRL.SETCURRENTKEY(PRL."No.");
                        PRL.SETRANGE(PRL."No.",Item."No.");
                        PRL.SETFILTER(PRL."Location Code",'CS STR');
                        PRL.SETRANGE(PRL."Document date",DT2DATE(ToDate),TODAY);
                        IF PRL.FIND('-') THEN
                        REPEAT
                          Stock_At_Stores-=PRL.Quantity;
                
                        UNTIL PRL.NEXT=0;
                      END;
                
                  END;
                
                //sundar
                  IF PRD_STR THEN
                  BEGIN
                    Item.CALCFIELDS(Item."Stock at PROD Stores");
                    Stock_At_Stores+=Item."Stock at PROD Stores";
                
                    IF DT2DATE(ToDate)<DT2DATE(CURRENTDATETIME) THEN
                    BEGIN
                      "Posted Material Issues line".RESET;
                      "Posted Material Issues line".SETCURRENTKEY("Posted Material Issues line"."Item No.",
                      "Posted Material Issues line"."Transfer-from Code","Posted Material Issues line"."Issued DateTime");
                
                      "Posted Material Issues line".SETRANGE("Posted Material Issues line"."Item No.",Item."No.");
                      "Posted Material Issues line".SETFILTER("Posted Material Issues line"."Transfer-from Code",'PRODSTR');
                      "Posted Material Issues line".SETRANGE("Posted Material Issues line"."Issued DateTime",ToDate,CURRENTDATETIME);
                      "Posted Material Issues line".CALCSUMS("Posted Material Issues line".Quantity);
                      Stock_At_Stores+="Posted Material Issues line".Quantity;
                      "Posted Material Issues line".RESET;
                      "Posted Material Issues line".SETCURRENTKEY("Posted Material Issues line"."Item No.",
                      "Posted Material Issues line"."Transfer-from Code","Posted Material Issues line"."Issued DateTime");
                      "Posted Material Issues line".SETRANGE("Posted Material Issues line"."Item No.",Item."No.");
                      "Posted Material Issues line".SETFILTER("Posted Material Issues line"."Transfer-to Code",'PRODSTR');
                      "Posted Material Issues line".SETRANGE("Posted Material Issues line"."Issued DateTime",ToDate,CURRENTDATETIME);
                      IF "Posted Material Issues line".FIND('-') THEN
                      REPEAT
                        Stock_At_Stores-=ABS("Posted Material Issues line".Quantity);
                      UNTIL "Posted Material Issues line".NEXT=0;
                
                        ItemLedgEntry.RESET;
                        ItemLedgEntry.SETCURRENTKEY(ItemLedgEntry."Item No.",
                                                    ItemLedgEntry."Entry Type",
                                                    ItemLedgEntry."Variant Code",
                                                    ItemLedgEntry."Drop Shipment",
                                                    ItemLedgEntry."Location Code",
                                                    ItemLedgEntry."Posting Date");
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Entry Type",ItemLedgEntry."Entry Type"::"Positive Adjmt.");
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Item No.",Item."No.");
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Location Code",'PRODSTR');
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Posting Date",DT2DATE(ToDate),TODAY);
                        ItemLedgEntry.CALCSUMS(ItemLedgEntry.Quantity);
                        Stock_At_Stores-=ABS(ItemLedgEntry.Quantity);
                
                        ItemLedgEntry.RESET;
                        ItemLedgEntry.SETCURRENTKEY(ItemLedgEntry."Item No.",
                                                    ItemLedgEntry."Entry Type",
                                                    ItemLedgEntry."Variant Code",
                                                    ItemLedgEntry."Drop Shipment",
                                                    ItemLedgEntry."Location Code",
                                                    ItemLedgEntry."Posting Date");
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Entry Type",ItemLedgEntry."Entry Type"::"Negative Adjmt.");
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Item No.",Item."No.");
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Location Code",'PRODSTR');
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Posting Date",DT2DATE(ToDate),TODAY);
                        ItemLedgEntry.CALCSUMS(ItemLedgEntry.Quantity);
                        Stock_At_Stores+=ABS(ItemLedgEntry.Quantity);
                
                    END;
                  END;
                
                
                //sundar
                
                
                    IF MCH THEN
                    BEGIN
                      Stock_At_Stores+=Item."Stock At MCH Location";
                      IF DT2DATE(ToDate)<TODAY THEN
                      BEGIN
                        "Posted Material Issues line".RESET;
                        "Posted Material Issues line".SETCURRENTKEY("Posted Material Issues line"."Item No.",
                        "Posted Material Issues line"."Transfer-from Code","Posted Material Issues line"."Issued DateTime");
                
                        "Posted Material Issues line".SETRANGE("Posted Material Issues line"."Item No.",Item."No.");
                        "Posted Material Issues line".SETFILTER("Posted Material Issues line"."Transfer-from Code",'MCH');
                        "Posted Material Issues line".SETRANGE("Posted Material Issues line"."Issued DateTime",ToDate,CURRENTDATETIME);
                        "Posted Material Issues line".CALCSUMS("Posted Material Issues line".Quantity);
                          Stock_At_Stores+="Posted Material Issues line".Quantity;
                        "Posted Material Issues line".RESET;
                        "Posted Material Issues line".SETCURRENTKEY("Posted Material Issues line"."Item No.",
                        "Posted Material Issues line"."Transfer-from Code","Posted Material Issues line"."Issued DateTime");
                        "Posted Material Issues line".SETCURRENTKEY("Posted Material Issues line"."Item No.");
                        "Posted Material Issues line".SETRANGE("Posted Material Issues line"."Item No.",Item."No.");
                        "Posted Material Issues line".SETFILTER("Posted Material Issues line"."Transfer-to Code",'MCH');
                        "Posted Material Issues line".SETRANGE("Posted Material Issues line"."Issued DateTime",ToDate,CURRENTDATETIME);
                        IF "Posted Material Issues line".FIND('-') THEN
                        REPEAT
                          Stock_At_Stores-="Posted Material Issues line".Quantity;
                        UNTIL "Posted Material Issues line".NEXT=0;
                
                        ItemLedgEntry.RESET;
                        ItemLedgEntry.SETCURRENTKEY(ItemLedgEntry."Item No.",
                                                    ItemLedgEntry."Entry Type",
                
                                                    ItemLedgEntry."Variant Code",
                                                    ItemLedgEntry."Drop Shipment",
                                                    ItemLedgEntry."Location Code",
                                                    ItemLedgEntry."Posting Date");
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Entry Type",ItemLedgEntry."Entry Type"::"Positive Adjmt.");
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Item No.",Item."No.");
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Location Code",'MCH');
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Posting Date",DT2DATE(ToDate),TODAY);
                        ItemLedgEntry.CALCSUMS(ItemLedgEntry.Quantity);
                        Stock_At_Stores-=ABS(ItemLedgEntry.Quantity);
                
                        ItemLedgEntry.RESET;
                        ItemLedgEntry.SETCURRENTKEY(ItemLedgEntry."Item No.",
                                                    ItemLedgEntry."Entry Type",
                                                    ItemLedgEntry."Variant Code",
                                                    ItemLedgEntry."Drop Shipment",
                                                    ItemLedgEntry."Location Code",
                                                    ItemLedgEntry."Posting Date");
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Entry Type",ItemLedgEntry."Entry Type"::"Negative Adjmt.");
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Item No.",Item."No.");
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Location Code",'MCH');
                        ItemLedgEntry.SETRANGE(ItemLedgEntry."Posting Date",DT2DATE(ToDate),TODAY);
                        ItemLedgEntry.CALCSUMS(ItemLedgEntry.Quantity);
                        Stock_At_Stores+=ABS(ItemLedgEntry.Quantity);
                
                     END;
                
                    END;
                
                
                    /*
                    IF Item."No."='ECPCBDS01039' THEN
                    BEGIN
                      Item."Avg Unit Cost":=8.18;
                      Item.MODIFY;
                    END;
                
                    IF Item."No."='ECPCBSS00510' THEN
                    BEGIN
                      Item."Avg Unit Cost":=16.67;
                      Item.MODIFY;
                    END;
                    */
                
                    IF Item.PROD_USED THEN
                       Product_Wise_Stock_Values[8]+=Stock_At_Stores*Item."Avg Unit Cost"
                    ELSE IF Item.ProductType=Item.ProductType::DL THEN
                      Product_Wise_Stock_Values[1]+=Stock_At_Stores*Item."Avg Unit Cost"
                    ELSE IF Item.ProductType=Item.ProductType::RlyLamp THEN
                      Product_Wise_Stock_Values[2]+=Stock_At_Stores*Item."Avg Unit Cost"
                    ELSE IF Item.ProductType=Item.ProductType::RoadLamp THEN
                      Product_Wise_Stock_Values[3]+=Stock_At_Stores*Item."Avg Unit Cost"
                    ELSE IF Item.ProductType=Item.ProductType::DIS THEN
                      Product_Wise_Stock_Values[4]+=Stock_At_Stores*Item."Avg Unit Cost"
                    ELSE IF Item.ProductType=Item.ProductType::SYS THEN
                      Product_Wise_Stock_Values[5]+=Stock_At_Stores*Item."Avg Unit Cost"
                    ELSE IF Item.ProductType=Item.ProductType::Others THEN
                      Product_Wise_Stock_Values[6]+=Stock_At_Stores*Item."Avg Unit Cost"
                    ELSE
                      Product_Wise_Stock_Values[7]+=Stock_At_Stores*Item."Avg Unit Cost";
                
                
                // Copy code from // Item, Body (3) - OnPreSection() >>
                  IF NOT("Consider_0_ Stock") THEN
                  BEGIN
                   IF Stock_At_Stores>0 THEN
                   BEGIN
                      Row+=1;
                      IF excel THEN
                      BEGIN
                        IF MD THEN
                        BEGIN
                          Entercell(Row,1,Item."No.",FALSE,TempExcelbuffer."Cell Type"::Text);
                          Entercell(Row,2,Item.Description,FALSE,TempExcelbuffer."Cell Type"::Text);
                          Entercell(Row,3,Item."Base Unit of Measure",FALSE,TempExcelbuffer."Cell Type"::Text);
                          Entercell(Row,4,Item."Product Group Code",FALSE,TempExcelbuffer."Cell Type"::Text);
                          Entercell(Row,5,Item."Item Sub Group Code",FALSE,TempExcelbuffer."Cell Type"::Text);
                          Entercell(Row,6,FORMAT(Item."Avg Unit Cost"),FALSE,TempExcelbuffer."Cell Type"::Number);
                          Entercell(Row,7,FORMAT(Item."Safety Lead Time"),FALSE,TempExcelbuffer."Cell Type"::Date);
                          Entercell(Row,8,Item."Item Location",FALSE,TempExcelbuffer."Cell Type"::Text);
                          Entercell(Row,9,FORMAT(Item.PROD_USED),FALSE,TempExcelbuffer."Cell Type"::Text);
                          Entercell(Row,10,FORMAT(Item.Item_verified),FALSE,TempExcelbuffer."Cell Type"::Text);
                          Entercell(Row,11,FORMAT(Stock_At_Stores),FALSE,TempExcelbuffer."Cell Type"::Number);
                          Entercell(Row,12,FORMAT(Stock_At_Stores*Item."Avg Unit Cost"),FALSE,TempExcelbuffer."Cell Type"::Number);
                          Entercell(Row,13,FORMAT(Item."Stock at Stores"),FALSE,TempExcelbuffer."Cell Type"::Number);
                          Entercell(Row,14,FORMAT(Item."Stock at Stores"*Item."Avg Unit Cost"),FALSE,TempExcelbuffer."Cell Type"::Number);
                          Entercell(Row,15,FORMAT(Item."Stock At MCH Location"),FALSE,TempExcelbuffer."Cell Type"::Text);
                          Entercell(Row,16,FORMAT(Item."Stock At MCH Location"*Item."Avg Unit Cost"),FALSE,TempExcelbuffer."Cell Type"::Number);
                          Entercell(Row,17,FORMAT(Item."Stock at CS Stores"),FALSE,TempExcelbuffer."Cell Type"::Number);
                          Entercell(Row,18,FORMAT(Item."Stock at CS Stores"*Item."Avg Unit Cost"),FALSE,TempExcelbuffer."Cell Type"::Number);
                          Entercell(Row,19,FORMAT(Item."Stock at RD Stores"),FALSE,TempExcelbuffer."Cell Type"::Number);
                          Entercell(Row,20,FORMAT(Item."Stock at RD Stores"*Item."Avg Unit Cost"),FALSE,TempExcelbuffer."Cell Type"::Number);
                
                          "Last _Inward_Date":=0D;
                          Last_Issued_Date:=0D;
                          Last_Inward_Qty:=0;
                          "Posted Material Issues line".SETCURRENTKEY("Posted Material Issues line"."Item No.",
                          "Posted Material Issues line"."Transfer-from Code","Posted Material Issues line"."Receipt Date");
                           "Posted Material Issues line".SETRANGE("Posted Material Issues line"."Item No.",Item."No.");
                          IF "Posted Material Issues line".FIND('+') THEN
                          BEGIN
                            PMH.SETRANGE(PMH."No.","Posted Material Issues line"."Document No.");
                            IF PMH.FIND('-') THEN
                              Last_Issued_Date:=PMH."Posting Date";
                          END;
                          PRL.SETCURRENTKEY(PRL."No.");
                          PRL.SETRANGE(PRL."No.",Item."No.");
                          PRL.SETFILTER(PRL.Quantity,'>%1',0);
                          IF PRL.FIND('+') THEN
                          BEGIN
                            PRL.CALCFIELDS(PRL."Document date");
                            "Last _Inward_Date":=PRL."Document date";
                            Last_Inward_Qty:=PRL.Quantity;
                          END;
                          Entercell(Row,21,FORMAT(Last_Issued_Date),FALSE,TempExcelbuffer."Cell Type"::Date);
                          Entercell(Row,22,FORMAT( "Last _Inward_Date"),FALSE,TempExcelbuffer."Cell Type"::Date);
                          Entercell(Row,23,FORMAT(Last_Inward_Qty),FALSE,TempExcelbuffer."Cell Type"::Number);
                          Entercell(Row,24,FORMAT(Item."Used In DL"),FALSE,TempExcelbuffer."Cell Type"::Text);
                          Entercell(Row,25,FORMAT(Item.DL_Consumption),FALSE,TempExcelbuffer."Cell Type"::Text);
                          IF Item.DL_Consumption>0 THEN
                          Entercell(Row,26,FORMAT(Stock_At_Stores/Item.DL_Consumption),FALSE,TempExcelbuffer."Cell Type"::Text);
                          Entercell(Row,27,FORMAT(Item."Used In MFEP"),FALSE,TempExcelbuffer."Cell Type"::Text);
                          Entercell(Row,28,FORMAT(Item.MFEP_Consumption),FALSE,TempExcelbuffer."Cell Type"::Text);
                          IF Item.MFEP_Consumption>0 THEN
                          Entercell(Row,29,FORMAT(Stock_At_Stores/Item.MFEP_Consumption),FALSE,TempExcelbuffer."Cell Type"::Text);
                          Entercell(Row,30,FORMAT(Item."Used In RTU"),FALSE,TempExcelbuffer."Cell Type"::Text);
                          Entercell(Row,31,FORMAT(Item.RTU_Consumption),FALSE,TempExcelbuffer."Cell Type"::Text);
                          IF Item.RTU_Consumption>0 THEN
                          Entercell(Row,32,FORMAT(Stock_At_Stores/Item.RTU_Consumption),FALSE,TempExcelbuffer."Cell Type"::Text);
                          Entercell(Row,33,FORMAT(Item."Used In PMU"),FALSE,TempExcelbuffer."Cell Type"::Text);
                          Entercell(Row,34,FORMAT(Item.PMU_Consumption),FALSE,TempExcelbuffer."Cell Type"::Text);
                          IF Item.PMU_Consumption>0 THEN
                          Entercell(Row,35,FORMAT(Stock_At_Stores/Item.PMU_Consumption),FALSE,TempExcelbuffer."Cell Type"::Text);
                          Entercell(Row,36,FORMAT(Item.ProductType),FALSE,TempExcelbuffer."Cell Type"::Text);
                
                
                
                
                        END ELSE
                        BEGIN
                          Entercell(Row,1,Item."No.",FALSE,TempExcelbuffer."Cell Type"::Text);
                          Entercell(Row,2,Item.Description,FALSE,TempExcelbuffer."Cell Type"::Text);
                          Entercell(Row,3,FORMAT(Stock_At_Stores),FALSE,TempExcelbuffer."Cell Type"::Number);
                          Entercell(Row,4,Item."Base Unit of Measure",FALSE,TempExcelbuffer."Cell Type"::Text);
                          Entercell(Row,5,FORMAT(Item.Item_verified),FALSE,TempExcelbuffer."Cell Type"::Text);
                          Entercell(Row,6,FORMAT(Item."Avg Unit Cost"),FALSE,TempExcelbuffer."Cell Type"::Number);
                          Entercell(Row,7,FORMAT(Stock_At_Stores*Item."Avg Unit Cost"),FALSE,TempExcelbuffer."Cell Type"::Number);
                          Entercell(Row,8,FORMAT(Item."Item Sub Group Code"),FALSE,TempExcelbuffer."Cell Type"::Text);
                          Entercell(Row,9,FORMAT(Item."Product Group Code"),FALSE,TempExcelbuffer."Cell Type"::Text);
                          Entercell(Row,10,FORMAT(Item."BIN Address"),FALSE,TempExcelbuffer."Cell Type"::Text);
                          Entercell(Row,11,FORMAT(Item."Stock Address"),FALSE,TempExcelbuffer."Cell Type"::Text);
                
                        END;
                      END;
                      CNT+=1;
                
                    END;
                    IF Stock_At_Stores=0 THEN
                    BEGIN
                     ItemBodyVisi:=TRUE;
                
                    END;
                
                  END ELSE
                  BEGIN
                    Row+=1;
                    IF excel THEN
                    BEGIN
                       Entercell(Row,1,Item."No.",FALSE,TempExcelbuffer."Cell Type"::Text);
                      Entercell(Row,2,Item.Description,FALSE,TempExcelbuffer."Cell Type"::Text);
                      Entercell(Row,3,FORMAT(Stock_At_Stores),FALSE,TempExcelbuffer."Cell Type"::Number);
                      Entercell(Row,4,Item."Base Unit of Measure",FALSE,TempExcelbuffer."Cell Type"::Text);
                      Entercell(Row,5,FORMAT(Item.Item_verified),FALSE,TempExcelbuffer."Cell Type"::Text);
                      Entercell(Row,6,FORMAT(Item."Avg Unit Cost"),FALSE,TempExcelbuffer."Cell Type"::Number);
                      Entercell(Row,7,FORMAT(Stock_At_Stores*Item."Avg Unit Cost"),FALSE,TempExcelbuffer."Cell Type"::Number);
                      Entercell(Row,8,FORMAT(Item."Item Sub Group Code"),FALSE,TempExcelbuffer."Cell Type"::Text);
                      Entercell(Row,9,FORMAT(Item."Product Group Code"),FALSE,TempExcelbuffer."Cell Type"::Text);
                      Entercell(Row,10,FORMAT(TOTAL),FALSE,TempExcelbuffer."Cell Type"::Number);
                    END;
                                        Col:=15;
                        "Purchase line".SETCURRENTKEY("Purchase line"."No.","Purchase line"."Buy-from Vendor No.");
                        "Purchase line".SETRANGE("Purchase line"."No.",Item."No.");
                        "Purchase line".SETFILTER("Purchase line"."Qty. to Receive",'>%1',0);
                        IF "Purchase line".FIND('-') THEN
                        REPEAT
                          Entercell(Row,Col,FORMAT("Purchase line"."Qty. to Receive"),FALSE,TempExcelbuffer."Cell Type"::Number);
                          IF "Purchase line"."Deviated Receipt Date">0D THEN
                             Entercell(Row,Col+1,FORMAT("Purchase line"."Deviated Receipt Date"),FALSE,TempExcelbuffer."Cell Type"::Date)
                          ELSE
                             Entercell(Row,Col+1,FORMAT("Purchase line"."Expected Receipt Date"),FALSE,TempExcelbuffer."Cell Type"::Date);
                          Col+=2;
                
                          UNTIL "Purchase line".NEXT=0;
                
                
                    END;
                    CNT+=1;
                  //END;
                  TOTAL+=Item."Avg Unit Cost"*Stock_At_Stores;
                  IF (STR) AND (NOT RD_STR)  AND (NOT CS_STR) AND (NOT MCH) AND (NOT QC) AND (NOT PRD_STR) THEN
                  BEGIN
                
                    IF Item."Used In DL" THEN
                       DL_STOCK+=Item."Avg Unit Cost"*Stock_At_Stores
                    ELSE IF Item."Used In RTU" THEN
                       RTU_STOCK+=Item."Avg Unit Cost"*Stock_At_Stores
                    ELSE IF Item."Used In MFEP" THEN
                       FEP_STOCK+=Item."Avg Unit Cost"*Stock_At_Stores
                    ELSE IF Item."Used In Bus Displays" THEN
                       SSI_STOCK+=Item."Avg Unit Cost"*Stock_At_Stores
                    ELSE IF Item."Used In PC" THEN
                       PC_STOCK+=Item."Avg Unit Cost"*Stock_At_Stores
                    ELSE IF Item."Used In PMU" THEN
                       PMU_STOCK+=Item."Avg Unit Cost"*Stock_At_Stores
                    ELSE IF Item."Used In RLY.LMP" THEN
                       SIG_STOCK+=Item."Avg Unit Cost"*Stock_At_Stores
                    ELSE IF Item."Used In IPIS" THEN
                       IPIS_STOCK+=Item."Avg Unit Cost"*Stock_At_Stores
                    ELSE IF Item."Used In BMU" THEN
                       BMU_STOCK+=Item."Avg Unit Cost"*Stock_At_Stores
                    ELSE IF Item."Used in LED Lamps" THEN
                      LED_STOCK+=Item."Avg Unit Cost"*Stock_At_Stores
                    ELSE IF Item."Used in LC GATE" THEN
                      LCGATE_STOCK+=Item."Avg Unit Cost"*Stock_At_Stores
                    ELSE IF Item."USED in MLRI" THEN
                      MLRI_STOCK+=Item."Avg Unit Cost"*Stock_At_Stores
                    ELSE IF Item."Used in BI" THEN
                      BI_STOCK+=Item."Avg Unit Cost"*Stock_At_Stores
                    ELSE IF Item."Used in Road lamp WTLC" THEN
                      WTLC_STOCK+=Item."Avg Unit Cost"*Stock_At_Stores
                    ELSE
                    BEGIN
                      ItemLedgEntry.SETCURRENTKEY(ItemLedgEntry."Posting Date",ItemLedgEntry."Item No.");
                      ItemLedgEntry.SETRANGE(ItemLedgEntry."Item No.",Item."No.");
                      IF ItemLedgEntry.FIND('+') THEN
                      BEGIN
                        IF CALCDATE('-3M',TODAY)>ItemLedgEntry."Posting Date" THEN
                           DEAD_STOCK+=Item."Avg Unit Cost"*Stock_At_Stores
                        ELSE
                          REMAINING_STOCK+=Item."Avg Unit Cost"*Stock_At_Stores;
                      END;
                    END;
                
                
                  END;
                
                  IF (NOT STR) AND (NOT RD_STR)  AND (NOT CS_STR) AND (PRD_STR) AND (NOT MCH) AND (NOT QC) THEN
                  BEGIN
                
                    IF Item."Used In DL" THEN
                       DL_STOCK+=Item."Avg Unit Cost"*Stock_At_Stores
                    ELSE IF Item."Used In RTU" THEN
                       RTU_STOCK+=Item."Avg Unit Cost"*Stock_At_Stores
                    ELSE IF Item."Used In MFEP" THEN
                       FEP_STOCK+=Item."Avg Unit Cost"*Stock_At_Stores
                    ELSE IF Item."Used In Bus Displays" THEN
                       SSI_STOCK+=Item."Avg Unit Cost"*Stock_At_Stores
                    ELSE IF Item."Used In PC" THEN
                       PC_STOCK+=Item."Avg Unit Cost"*Stock_At_Stores
                    ELSE IF Item."Used In PMU" THEN
                       PMU_STOCK+=Item."Avg Unit Cost"*Stock_At_Stores
                    ELSE IF Item."Used In RLY.LMP" THEN
                       SIG_STOCK+=Item."Avg Unit Cost"*Stock_At_Stores
                    ELSE IF Item."Used In IPIS" THEN
                       IPIS_STOCK+=Item."Avg Unit Cost"*Stock_At_Stores
                    ELSE IF Item."Used In BMU" THEN
                       BMU_STOCK+=Item."Avg Unit Cost"*Stock_At_Stores
                    ELSE IF Item."Used in LED Lamps" THEN
                      LED_STOCK+=Item."Avg Unit Cost"*Stock_At_Stores
                    ELSE IF Item."Used in LC GATE" THEN
                      LCGATE_STOCK+=Item."Avg Unit Cost"*Stock_At_Stores
                    ELSE IF Item."USED in MLRI" THEN
                      MLRI_STOCK+=Item."Avg Unit Cost"*Stock_At_Stores
                    ELSE IF Item."Used in BI" THEN
                      BI_STOCK+=Item."Avg Unit Cost"*Stock_At_Stores
                    ELSE IF Item."Used in Road lamp WTLC" THEN
                      WTLC_STOCK+=Item."Avg Unit Cost"*Stock_At_Stores
                    ELSE
                    BEGIN
                      ItemLedgEntry.SETCURRENTKEY(ItemLedgEntry."Posting Date",ItemLedgEntry."Item No.");
                      ItemLedgEntry.SETRANGE(ItemLedgEntry."Item No.",Item."No.");
                      IF ItemLedgEntry.FIND('+') THEN
                      BEGIN
                        IF CALCDATE('-3M',TODAY)>ItemLedgEntry."Posting Date" THEN
                           DEAD_STOCK+=Item."Avg Unit Cost"*Stock_At_Stores
                        ELSE
                          REMAINING_STOCK+=Item."Avg Unit Cost"*Stock_At_Stores;
                      END;
                    END;
                
                
                  END;
                
                
                IF ("Dump to Statement") AND (Stock_At_Stores>0) THEN
                BEGIN
                  "Stock Statement".INIT;
                  "Stock Statement".Month:=DATE2DMY(DT2DATE(ToDate),2);
                
                  "Stock Statement".Year:=DATE2DMY(DT2DATE(ToDate),3);
                  "Stock Statement"."Month Name":=MONTH(DATE2DMY(DT2DATE(ToDate),2));
                  "Stock Statement".Item:=Item."No.";
                  "Stock Statement"."Stock Qty":=Stock_At_Stores;
                 "Stock Statement"."Unit Cost":=Item."Avg Unit Cost";
                  "Stock Statement"."Total Cost":=Item."Avg Unit Cost"*Stock_At_Stores;
                  "Stock Statement".INSERT;
                END;
                // copy code from // Item, Body (3) - OnPreSection() <<

            end;

            trigger OnPostDataItem();
            begin
                // copy code from // Item, Footer (4) - OnPreSection() >>
                     IF (STR) AND (NOT RD_STR)  AND (NOT CS_STR) AND (NOT PRD_STR) AND (NOT MCH) AND (NOT QC) THEN
                     BEGIN
                       PMH.SETCURRENTKEY(PMH."Material Issue No.",
                                         PMH."Posting Date",
                                         PMH."Resource Name",
                                         PMH."Reason Code",
                                         PMH."Prod. Order No.",
                                         PMH."Transfer-to Code",
                                         PMH."Transfer-from Code");
                       PMH.SETRANGE(PMH."Transfer-to Code",'DAMAGE');
                       IF DATE2DWY(DT2DATE(ToDate),1)>1 THEN
                         PMH.SETRANGE(PMH."Posting Date",DT2DATE(ToDate)-2)
                       ELSE
                         PMH.SETRANGE(PMH."Posting Date",DT2DATE(ToDate)-1);
                       IF PMH.FIND('-') THEN
                       REPEAT
                         LOCATION.SETRANGE(LOCATION.Code,PMH."Transfer-from Code");
                         IF LOCATION.FIND('-') THEN
                         BEGIN
                           IF FORMAT(LOCATION.Stores)='STR' THEN
                           BEGIN
                             "Posted Material Issues line".RESET;
                             "Posted Material Issues line".SETRANGE("Posted Material Issues line"."Document No.",PMH."No.");
                             IF "Posted Material Issues line".FIND('-') THEN
                             REPEAT
                               IF Item_Dum.GET("Posted Material Issues line"."Item No.") THEN
                                  DAMAGE_VALUE+="Posted Material Issues line".Quantity*Item."Avg Unit Cost";
                             UNTIL "Posted Material Issues line".NEXT=0;
                           END;
                         END;
                       UNTIL PMH.NEXT=0;

                       DAY_WISE_DETAILS.SETRANGE(DAY_WISE_DETAILS."POSTING DATE",DT2DATE(ToDate));
                       IF NOT DAY_WISE_DETAILS.FIND('-') THEN
                       BEGIN
                         DAY_WISE_DETAILS.INIT;
                         DAY_WISE_DETAILS."POSTING DATE":=DT2DATE(ToDate);
                         DAY_WISE_DETAILS."STR STOCK VALUE":=TOTAL;
                         DAY_WISE_DETAILS."STR_DAMAGE VALUE":=DAMAGE_VALUE;
                         DAY_WISE_DETAILS."BMU STOCK":=BMU_STOCK;
                         DAY_WISE_DETAILS."DL STOCK":=DL_STOCK;
                         DAY_WISE_DETAILS."EP STOCK":=FEP_STOCK;
                         DAY_WISE_DETAILS."IPIS STOCK":=IPIS_STOCK;
                         DAY_WISE_DETAILS."PMU STOCK":=PMU_STOCK;
                         DAY_WISE_DETAILS."PROTOCAL CONVERTER STOCK":=PC_STOCK;
                         DAY_WISE_DETAILS."RTU STOCK":=RTU_STOCK;
                         DAY_WISE_DETAILS."SIGNAL LAMP STOCK":=SIG_STOCK;
                         DAY_WISE_DETAILS."SSIDL STOCK":=SSI_STOCK;
                         DAY_WISE_DETAILS."LED LAMPS STOCK":=LED_STOCK;
                         DAY_WISE_DETAILS."LC GATE STOCK":=LCGATE_STOCK;
                         DAY_WISE_DETAILS."MLRI STOCK":=MLRI_STOCK;
                         DAY_WISE_DETAILS."BI STOCK":=BI_STOCK;
                         DAY_WISE_DETAILS."WTLC STOCK":=WTLC_STOCK;
                         DAY_WISE_DETAILS."REMAINING STOCK":=REMAINING_STOCK;
                         DAY_WISE_DETAILS."DEAD STOCK":=DEAD_STOCK;
                         DAY_WISE_DETAILS.INSERT;
                       END ELSE
                       BEGIN
                         DAY_WISE_DETAILS."STR STOCK VALUE":=TOTAL;
                         DAY_WISE_DETAILS."STR_DAMAGE VALUE":=DAMAGE_VALUE;
                         DAY_WISE_DETAILS."BMU STOCK":=BMU_STOCK;
                         DAY_WISE_DETAILS."DL STOCK":=DL_STOCK;
                         DAY_WISE_DETAILS."EP STOCK":=FEP_STOCK;
                         DAY_WISE_DETAILS."IPIS STOCK":=IPIS_STOCK;
                         DAY_WISE_DETAILS."PMU STOCK":=PMU_STOCK;
                         DAY_WISE_DETAILS."PROTOCAL CONVERTER STOCK":=PC_STOCK;
                         DAY_WISE_DETAILS."RTU STOCK":=RTU_STOCK;
                         DAY_WISE_DETAILS."SIGNAL LAMP STOCK":=SIG_STOCK;
                         DAY_WISE_DETAILS."SSIDL STOCK":=SSI_STOCK;
                         DAY_WISE_DETAILS."LED LAMPS STOCK":=LED_STOCK;
                         DAY_WISE_DETAILS."LC GATE STOCK":=LCGATE_STOCK;
                         DAY_WISE_DETAILS."MLRI STOCK":=MLRI_STOCK;
                         DAY_WISE_DETAILS."BI STOCK":=BI_STOCK;
                         DAY_WISE_DETAILS."WTLC STOCK":=WTLC_STOCK;
                         DAY_WISE_DETAILS."REMAINING STOCK":=REMAINING_STOCK;
                         DAY_WISE_DETAILS."DEAD STOCK":=DEAD_STOCK;
                         DAY_WISE_DETAILS.MODIFY;
                       END;
                     END ELSE
                     IF (NOT STR) AND (RD_STR)  AND (NOT CS_STR) AND (NOT PRD_STR) AND (NOT MCH) AND (NOT QC) THEN
                     BEGIN
                       PMH.SETCURRENTKEY(PMH."Material Issue No.",
                                         PMH."Posting Date",
                                         PMH."Resource Name",
                                         PMH."Reason Code",
                                         PMH."Prod. Order No.",
                                         PMH."Transfer-to Code",
                                         PMH."Transfer-from Code");
                       PMH.SETRANGE(PMH."Transfer-to Code",'DAMAGE');
                       IF DATE2DWY(DT2DATE(ToDate),1)>1 THEN
                         PMH.SETRANGE(PMH."Posting Date",DT2DATE(ToDate))
                       ELSE
                         PMH.SETRANGE(PMH."Posting Date",DT2DATE(ToDate));
                       IF PMH.FIND('-') THEN
                       REPEAT
                         LOCATION.SETRANGE(LOCATION.Code,PMH."Transfer-from Code");
                         IF LOCATION.FIND('-') THEN
                         BEGIN
                           IF FORMAT(LOCATION.Stores)='RD STR' THEN
                           BEGIN
                             "Posted Material Issues line".RESET;
                             "Posted Material Issues line".SETRANGE("Posted Material Issues line"."Document No.",PMH."No.");
                             IF "Posted Material Issues line".FIND('-') THEN
                             REPEAT
                               IF Item_Dum.GET("Posted Material Issues line"."Item No.") THEN
                                  DAMAGE_VALUE+="Posted Material Issues line".Quantity*Item."Avg Unit Cost";
                             UNTIL "Posted Material Issues line".NEXT=0;
                           END;
                         END;
                       UNTIL PMH.NEXT=0;

                       DAY_WISE_DETAILS.SETRANGE(DAY_WISE_DETAILS."POSTING DATE",DT2DATE(ToDate));
                       IF NOT DAY_WISE_DETAILS.FIND('-') THEN
                       BEGIN
                         DAY_WISE_DETAILS.INIT;
                         DAY_WISE_DETAILS."POSTING DATE":=DT2DATE(ToDate);
                         DAY_WISE_DETAILS."R&D STR STOCK VALUE":=TOTAL;
                         DAY_WISE_DETAILS."R&D DAMAGE VALUE":=DAMAGE_VALUE;
                         DAY_WISE_DETAILS.INSERT;
                       END ELSE
                       BEGIN
                         DAY_WISE_DETAILS."R&D STR STOCK VALUE":=TOTAL;
                         DAY_WISE_DETAILS."R&D DAMAGE VALUE":=DAMAGE_VALUE;
                         DAY_WISE_DETAILS.MODIFY;
                       END;

                     END ELSE
                     IF (NOT STR) AND (NOT RD_STR)  AND ( CS_STR) AND (NOT PRD_STR) AND (NOT MCH) AND (NOT QC) THEN
                     BEGIN
                       PMH.SETCURRENTKEY(PMH."Material Issue No.",
                                         PMH."Posting Date",
                                         PMH."Resource Name",
                                         PMH."Reason Code",
                                         PMH."Prod. Order No.",
                                         PMH."Transfer-to Code",
                                         PMH."Transfer-from Code");
                       PMH.SETRANGE(PMH."Transfer-to Code",'DAMAGE');
                       IF DATE2DWY(DT2DATE(ToDate),1)>1 THEN
                         PMH.SETRANGE(PMH."Posting Date",DT2DATE(ToDate)-2)
                       ELSE
                         PMH.SETRANGE(PMH."Posting Date",DT2DATE(ToDate)-1);
                       IF PMH.FIND('-') THEN
                       REPEAT
                         LOCATION.SETRANGE(LOCATION.Code,PMH."Transfer-from Code");
                         IF LOCATION.FIND('-') THEN
                         BEGIN
                           IF FORMAT(LOCATION.Stores)='CS STR' THEN
                           BEGIN
                             "Posted Material Issues line".RESET;
                             "Posted Material Issues line".SETRANGE("Posted Material Issues line"."Document No.",PMH."No.");
                             IF "Posted Material Issues line".FIND('-') THEN
                             REPEAT
                               IF Item_Dum.GET("Posted Material Issues line"."Item No.") THEN
                                  DAMAGE_VALUE+="Posted Material Issues line".Quantity*Item."Avg Unit Cost";
                             UNTIL "Posted Material Issues line".NEXT=0;
                           END;
                         END;
                       UNTIL PMH.NEXT=0;

                       DAY_WISE_DETAILS.SETRANGE(DAY_WISE_DETAILS."POSTING DATE",DT2DATE(ToDate));
                       IF NOT DAY_WISE_DETAILS.FIND('-') THEN
                       BEGIN
                         DAY_WISE_DETAILS.INIT;
                         DAY_WISE_DETAILS."POSTING DATE":=DT2DATE(ToDate);
                         DAY_WISE_DETAILS."CS STR STOCK VALUE":=TOTAL;
                         DAY_WISE_DETAILS."CS DAMAGE VALUE":=DAMAGE_VALUE;
                         DAY_WISE_DETAILS.INSERT;
                       END ELSE
                       BEGIN
                         DAY_WISE_DETAILS."CS STR STOCK VALUE":=TOTAL;
                         DAY_WISE_DETAILS."CS DAMAGE VALUE":=DAMAGE_VALUE;
                         DAY_WISE_DETAILS.MODIFY;
                       END;
                     END ELSE
                     IF (NOT STR) AND (NOT RD_STR)  AND (NOT CS_STR) AND (PRD_STR) AND (NOT MCH) AND (NOT QC) THEN
                     BEGIN
                       PMH.SETCURRENTKEY(PMH."Material Issue No.",
                                         PMH."Posting Date",
                                         PMH."Resource Name",
                                         PMH."Reason Code",
                                         PMH."Prod. Order No.",
                                         PMH."Transfer-to Code",
                                         PMH."Transfer-from Code");
                       PMH.SETRANGE(PMH."Transfer-to Code",'DAMAGE');
                       IF DATE2DWY(DT2DATE(ToDate),1)>1 THEN
                         PMH.SETRANGE(PMH."Posting Date",DT2DATE(ToDate)-2)
                       ELSE
                         PMH.SETRANGE(PMH."Posting Date",DT2DATE(ToDate)-1);
                       IF PMH.FIND('-') THEN
                       REPEAT
                         LOCATION.SETRANGE(LOCATION.Code,PMH."Transfer-from Code");
                         IF LOCATION.FIND('-') THEN
                         BEGIN
                           IF FORMAT(LOCATION.Stores)='PRD STR' THEN
                           BEGIN
                             "Posted Material Issues line".RESET;
                             "Posted Material Issues line".SETRANGE("Posted Material Issues line"."Document No.",PMH."No.");
                             IF "Posted Material Issues line".FIND('-') THEN
                             REPEAT
                               IF Item_Dum.GET("Posted Material Issues line"."Item No.") THEN
                                  DAMAGE_VALUE+="Posted Material Issues line".Quantity*Item."Avg Unit Cost";
                             UNTIL "Posted Material Issues line".NEXT=0;
                           END;
                         END;
                       UNTIL PMH.NEXT=0;

                       DAY_WISE_DETAILS.SETRANGE(DAY_WISE_DETAILS."POSTING DATE",DT2DATE(ToDate));
                       IF NOT DAY_WISE_DETAILS.FIND('-') THEN
                       BEGIN
                         DAY_WISE_DETAILS.INIT;
                         DAY_WISE_DETAILS."POSTING DATE":=DT2DATE(ToDate);
                         DAY_WISE_DETAILS."PRD STR STOCK VALUE":=TOTAL;
                         DAY_WISE_DETAILS."PRD DAMAGE VALUE":=DAMAGE_VALUE;
                         DAY_WISE_DETAILS."BMU STOCK":=BMU_STOCK;
                         DAY_WISE_DETAILS."DL STOCK":=DL_STOCK;
                         DAY_WISE_DETAILS."EP STOCK":=FEP_STOCK;
                         DAY_WISE_DETAILS."IPIS STOCK":=IPIS_STOCK;
                         DAY_WISE_DETAILS."PMU STOCK":=PMU_STOCK;
                         DAY_WISE_DETAILS."PROTOCAL CONVERTER STOCK":=PC_STOCK;
                         DAY_WISE_DETAILS."RTU STOCK":=RTU_STOCK;
                         DAY_WISE_DETAILS."SIGNAL LAMP STOCK":=SIG_STOCK;
                         DAY_WISE_DETAILS."SSIDL STOCK":=SSI_STOCK;
                         DAY_WISE_DETAILS."LED LAMPS STOCK":=LED_STOCK;
                         DAY_WISE_DETAILS."LC GATE STOCK":=LCGATE_STOCK;
                         DAY_WISE_DETAILS."MLRI STOCK":=MLRI_STOCK;
                         DAY_WISE_DETAILS."BI STOCK":=BI_STOCK;
                         DAY_WISE_DETAILS."WTLC STOCK":=WTLC_STOCK;
                         DAY_WISE_DETAILS."REMAINING STOCK":=REMAINING_STOCK;
                         DAY_WISE_DETAILS."DEAD STOCK":=DEAD_STOCK;
                         DAY_WISE_DETAILS.INSERT;
                       END ELSE
                       BEGIN
                         DAY_WISE_DETAILS."PRD STR STOCK VALUE":=TOTAL;
                         DAY_WISE_DETAILS."PRD DAMAGE VALUE":=DAMAGE_VALUE;
                         DAY_WISE_DETAILS."BMU STOCK"+=BMU_STOCK;
                         DAY_WISE_DETAILS."DL STOCK"+=DL_STOCK;
                         DAY_WISE_DETAILS."EP STOCK"+=FEP_STOCK;
                         DAY_WISE_DETAILS."IPIS STOCK"+=IPIS_STOCK;
                         DAY_WISE_DETAILS."PMU STOCK"+=PMU_STOCK;
                         DAY_WISE_DETAILS."PROTOCAL CONVERTER STOCK"+=PC_STOCK;
                         DAY_WISE_DETAILS."RTU STOCK"+=RTU_STOCK;
                         DAY_WISE_DETAILS."SIGNAL LAMP STOCK"+=SIG_STOCK;
                         DAY_WISE_DETAILS."SSIDL STOCK"+=SSI_STOCK;
                         DAY_WISE_DETAILS."LED LAMPS STOCK"+=LED_STOCK;
                         DAY_WISE_DETAILS."LC GATE STOCK"+=LCGATE_STOCK;
                         DAY_WISE_DETAILS."MLRI STOCK"+=MLRI_STOCK;
                         DAY_WISE_DETAILS."BI STOCK"+=BI_STOCK;
                         DAY_WISE_DETAILS."WTLC STOCK"+=WTLC_STOCK;
                         DAY_WISE_DETAILS."REMAINING STOCK"+=REMAINING_STOCK;
                         DAY_WISE_DETAILS."DEAD STOCK"+=DEAD_STOCK;
                         DAY_WISE_DETAILS.MODIFY;
                       END;

                     END;


                     IF DT2DATE(ToDate)=TODAY THEN
                     BEGIN
                       "Posted Material Issues Header".SETCURRENTKEY("Posted Material Issues Header"."Material Issue No.",
                                                                     "Posted Material Issues Header"."Posting Date",
                                                                     "Posted Material Issues Header"."Resource Name",
                                                                     "Posted Material Issues Header"."Reason Code",
                                                                     "Posted Material Issues Header"."Prod. Order No.",
                                                                     "Posted Material Issues Header"."Transfer-to Code",
                                                                     "Posted Material Issues Header"."Transfer-from Code");
                       "Posted Material Issues Header".SETRANGE("Posted Material Issues Header"."Posting Date",CALCDATE('-1D',TODAY));
                       IF "Posted Material Issues Header".FIND('-') THEN
                       REPEAT
                         "Posted Material Issues line".SETRANGE("Posted Material Issues line"."Document No.","Posted Material Issues Header"."No.");
                         IF "Posted Material Issues line".FIND('-') THEN
                         REPEAT
                           IF Item_Dum.GET("Posted Material Issues line"."Item No.") THEN
                             YesterDay_Issues_Value+="Posted Material Issues line".Quantity*Item_Dum."Avg Unit Cost";

                         UNTIL "Posted Material Issues line".NEXT=0;
                       UNTIL "Posted Material Issues Header".NEXT=0;

                      // "Purch. Rcpt. Header".SETRANGE("Purch. Rcpt. Header"."Location Code",Stores);
                       "Purch. Rcpt. Header".SETRANGE("Purch. Rcpt. Header"."Posting Date",CALCDATE('-1D',TODAY));
                       IF "Purch. Rcpt. Header".FIND('-') THEN
                       REPEAT
                         PRL.SETRANGE(PRL."Document No.","Purch. Rcpt. Header"."No.");
                         IF PRL.FIND('-') THEN
                         REPEAT
                           //  "YestedDay_ Inward_Value"+=PRL.Quantity*Item_Dum."Avg Unit Cost";
                             IF Item_Dum.GET(PRL."No.") THEN
                               "YestedDay_ Inward_Value"+=PRL.Quantity*PRL."Unit Cost (LCY)";
                         UNTIL PRL.NEXT=0;
                       UNTIL "Purch. Rcpt. Header".NEXT=0;

                    //   ItemLedgEntry.SETRANGE(ItemLedgEntry."Location Code",Stores);
                       ItemLedgEntry.SETCURRENTKEY(ItemLedgEntry."Posting Date",ItemLedgEntry."Item No.");
                       ItemLedgEntry.SETRANGE(ItemLedgEntry."Posting Date",CALCDATE('-1D',TODAY));
                       ItemLedgEntry.SETRANGE(ItemLedgEntry."Entry Type",2,3);
                       IF ItemLedgEntry.FIND('-') THEN
                       REPEAT
                         IF Item_Dum.GET(ItemLedgEntry."Item No.") THEN
                           YesterDay_Adjustments_Value+=ItemLedgEntry.Quantity*Item_Dum."Avg Unit Cost";

                       UNTIL ItemLedgEntry.NEXT=0;
                    END;
                    IF STR  THEN
                    BEGIN
                      DAY_WISE_DETAILS.SETRANGE(DAY_WISE_DETAILS."POSTING DATE",DT2DATE(ToDate));
                      IF DAY_WISE_DETAILS.FIND('-') THEN
                      BEGIN
                        DAY_WISE_DETAILS."DAY WISE ISSUES VALUE":=YesterDay_Issues_Value;
                        DAY_WISE_DETAILS."DAY WISE INWARD VALUE":="YestedDay_ Inward_Value";
                        DAY_WISE_DETAILS."DAY WISE ADJUSTMENT VALUE":=YesterDay_Adjustments_Value;
                        DAY_WISE_DETAILS.MODIFY;
                      END;
                    END;
                     IF excel THEN
                    BEGIN
                      Row+=1;
                      IF NOT MD THEN
                      BEGIN
                        Entercell(Row,3,'Total Production Store Stock Value',TRUE,TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row,7,FORMAT(TOTAL),FALSE,TempExcelbuffer."Cell Type"::Number);
                         Row+=3;
                         Entercell(Row,1,'Product Wise Stock Values',TRUE,TempExcelbuffer."Cell Type"::Text);
                         Row+=1;
                          Entercell(Row,1,'Data Logger',TRUE,TempExcelbuffer."Cell Type"::Text);
                          Entercell(Row,2,FORMAT(Product_Wise_Stock_Values[1]),FALSE,TempExcelbuffer."Cell Type"::Number);
                         Row+=1;
                          Entercell(Row,1,'Rl. Lamps',TRUE,TempExcelbuffer."Cell Type"::Text);
                          Entercell(Row,2,FORMAT(Product_Wise_Stock_Values[2]),FALSE,TempExcelbuffer."Cell Type"::Number);
                          Entercell(Row,5,'Last Day Inward Value',TRUE,TempExcelbuffer."Cell Type"::Text);
                          Entercell(Row,6,FORMAT("YestedDay_ Inward_Value"),FALSE,TempExcelbuffer."Cell Type"::Number);

                         Row+=1;
                          Entercell(Row,1,'Road Lamps',TRUE,TempExcelbuffer."Cell Type"::Text);
                          Entercell(Row,2,FORMAT(Product_Wise_Stock_Values[3]),FALSE,TempExcelbuffer."Cell Type"::Number);
                          Entercell(Row,5,'Last Day Issues Value',TRUE,TempExcelbuffer."Cell Type"::Text);
                          Entercell(Row,6,FORMAT(YesterDay_Issues_Value),FALSE,TempExcelbuffer."Cell Type"::Number);

                         Row+=1;
                          Entercell(Row,1,'Displays',TRUE,TempExcelbuffer."Cell Type"::Text);
                          Entercell(Row,2,FORMAT(Product_Wise_Stock_Values[4]),FALSE,TempExcelbuffer."Cell Type"::Number);
                          Entercell(Row,5,'Last Day Adjustments Value',TRUE,TempExcelbuffer."Cell Type"::Text);
                          Entercell(Row,6,FORMAT(YesterDay_Adjustments_Value),FALSE,TempExcelbuffer."Cell Type"::Number);

                         Row+=1;
                          Entercell(Row,1,'Systems',TRUE,TempExcelbuffer."Cell Type"::Text);
                          Entercell(Row,2,FORMAT(Product_Wise_Stock_Values[5]),FALSE,TempExcelbuffer."Cell Type"::Number);
                         Row+=1;
                          Entercell(Row,1,'Others',TRUE,TempExcelbuffer."Cell Type"::Text);
                          Entercell(Row,2,FORMAT(Product_Wise_Stock_Values[6]),FALSE,TempExcelbuffer."Cell Type"::Number);
                         Row+=1;
                          Entercell(Row,1,'Blanks',TRUE,TempExcelbuffer."Cell Type"::Text);
                          Entercell(Row,2,FORMAT(Product_Wise_Stock_Values[7]),FALSE,TempExcelbuffer."Cell Type"::Number);


                     END;

                    END;
                // copy code from // Item, Footer (4) - OnPreSection() <<
            end;

            trigger OnPreDataItem();
            begin
                      IF NOT( (Choice=Choice::Stock) AND (NOT Brief)) THEN
                   CurrReport.BREAK;
                   I:=1;
                   IF "Consider_0_ Stock" THEN
                   BEGIN
                    T[I]:='Considering the 0 Stock Items Also';
                    I+=1;
                   END;

                   IF "Production Items" THEN
                   BEGIN
                     Item.SETFILTER(Item."Item Location",'PROD');
                     T[I]:='Only Production Items';
                     I+=1;
                   END;
                   IF Verified THEN
                   BEGIN
                     Item.SETRANGE(Item.Item_verified,TRUE);
                     MESSAGE(FORMAT(Item.COUNT));
                     T[I]:='Verified Items Only';
                     I+=1;
                   END;
                   IF (NOT STR) AND (RD_STR)  AND (NOT CS_STR) AND (NOT PRD_STR) THEN    //sundar
                   Item.SETFILTER(Item."Stock at RD Stores",'>%1',0);

                   IF (NOT STR) AND (NOT RD_STR)  AND (CS_STR) AND (NOT PRD_STR) THEN       //sundar
                   Item.SETFILTER(Item."Stock at CS Stores",'>%1',0);

                   IF (NOT STR) AND (NOT RD_STR)  AND (NOT CS_STR) AND (PRD_STR) THEN   //sundar
                   Item.SETFILTER(Item."Stock at PROD Stores",'>%1',0);


                    IF ( Dead ) AND (NOT STR) AND (NOT RD_STR)  AND (NOT CS_STR)  THEN
                      Item.SETRANGE(Item.PROD_USED,TRUE);

                // Copy code from // Item, Header (2) - OnPreSection() >>
                Row+=1;
                IF excel THEN
                BEGIN
                  IF MD THEN
                  BEGIN
                    EnterHeadings(Row,11,'Total Stock',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,13,'Prod Stores',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,15,'MCH',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,17,'CS Stores',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,19,'R&D Stores',TRUE,TempExcelbuffer."Cell Type"::Text);
                    Row+=2;
                    EnterHeadings(Row,1,'Item No.',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,2,'Description',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,3,'UOM',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,4,'CATEGORY',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,5,'SUB CATEGORY',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,6,'UNIT COST',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,7,'LEAD TIME',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,8,'USED LOCATION',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,9,'DEAD STOCK',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,10,'VERIFIED',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,11,'STOCK',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,12,'VALUE',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,13,'STOCK',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,14,'VALUE',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,15,'STOCK',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,16,'VALUE',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,17,'STOCK',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,18,'VALUE',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,19,'STOCK',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,20,'VALUE',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,21,'LAST ISSUED DATE',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,22,'LAST INWARD DATE',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,23,'LAST INWARD QUANTITY',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,24,'DL',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,25,'USED QTY',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,26,'COMPLETABLE QTY',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,27,'MFEP',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,28,'USED QTY',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,29,'COMPLETABLE QTY',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,30,'RTU',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,31,'USED QTY',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,32,'COMPLETABLE QTY',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,33,'PMU',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,34,'USED QTY',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,35,'COMPLETABLE QTY',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,36,'Where Used',TRUE,TempExcelbuffer."Cell Type"::Text);

                  END ELSE
                  BEGIN
                    IF Row=1 THEN
                    BEGIN
                      EnterHeadings(Row,1,'Item No.',TRUE,TempExcelbuffer."Cell Type"::Text);
                      EnterHeadings(Row,2,'Description',TRUE,TempExcelbuffer."Cell Type"::Text);
                      EnterHeadings(Row,3,'Stock At Stores',TRUE,TempExcelbuffer."Cell Type"::Text);
                      EnterHeadings(Row,4,'Unit Of Measurement',TRUE,TempExcelbuffer."Cell Type"::Text);
                      EnterHeadings(Row,5,'Item Verified',TRUE,TempExcelbuffer."Cell Type"::Text);
                      EnterHeadings(Row,6,'Unit Cost',TRUE,TempExcelbuffer."Cell Type"::Text);
                      EnterHeadings(Row,7,'Total Cost',TRUE,TempExcelbuffer."Cell Type"::Text);
                      EnterHeadings(Row,8,'Item Sub Group Code',TRUE,TempExcelbuffer."Cell Type"::Text);
                      EnterHeadings(Row,9,'Product Group Code',TRUE,TempExcelbuffer."Cell Type"::Text);
                      EnterHeadings(Row,10,'Bin Address',TRUE,TempExcelbuffer."Cell Type"::Text);
                      EnterHeadings(Row,11,'Stock Address',TRUE,TempExcelbuffer."Cell Type"::Text);

                    END;
                  END

                END;
                // copy code from // Item, Header (2) - OnPreSection() <<
            end;
        }
        dataitem("Purch. Rcpt. Line";"Purch. Rcpt. Line")
        {
            DataItemTableView = SORTING(No.) ORDER(Ascending) WHERE(Type=CONST(Fixed Asset));
            column(ToDate_Control1102154081;ToDate)
            {
            }
            column(Purch__Rcpt__Line__No__;"No.")
            {
            }
            column(Purch__Rcpt__Line_Description;Description)
            {
            }
            column(Purch__Rcpt__Line__Unit_of_Measure_Code_;"Unit of Measure Code")
            {
            }
            column(Purch__Rcpt__Line_Quantity;Quantity)
            {
            }
            column(Purch__Rcpt__Line__Unit_Cost__LCY__;"Unit Cost (LCY)")
            {
            }
            column(Unit_Cost__LCY___Quantity;"Unit Cost (LCY)"*Quantity)
            {
            }
            column(TOTAL_Control1102154008;TOTAL)
            {
            }
            column(CNT_Control1102154020;CNT)
            {
            }
            column(Fixed_Assets_StockCaption;Fixed_Assets_StockCaptionLbl)
            {
            }
            column(Stock_Valution_OnCaption_Control1102154082;Stock_Valution_OnCaption_Control1102154082Lbl)
            {
            }
            column(ValueCaption_Control1102154053;ValueCaption_Control1102154053Lbl)
            {
            }
            column(Uint_CostCaption;Uint_CostCaptionLbl)
            {
            }
            column(Stock_At_StoresCaption_Control1102154056;Stock_At_StoresCaption_Control1102154056Lbl)
            {
            }
            column(UOMCaption_Control1102154057;UOMCaption_Control1102154057Lbl)
            {
            }
            column(DescriptionCaption;DescriptionCaptionLbl)
            {
            }
            column(No_Caption;No_CaptionLbl)
            {
            }
            column(Stock_ValueCaption_Control1102154019;Stock_ValueCaption_Control1102154019Lbl)
            {
            }
            column(No__Of_ItemsCaption_Control1102154021;No__Of_ItemsCaption_Control1102154021Lbl)
            {
            }
            column(Purch__Rcpt__Line_Document_No_;"Document No.")
            {
            }
            column(Purch__Rcpt__Line_Line_No_;"Line No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                // COPY CODE FROM // Purch. Rcpt. Line, GroupFooter (4) - OnPreSection() >>
                TOTAL+="Unit Cost (LCY)"*Quantity;
                IF excel THEN BEGIN
                  Row+=1;
                  Entercell(Row,1,"Purch. Rcpt. Line"."No.",FALSE,TempExcelbuffer."Cell Type"::Text);
                  Entercell(Row,2,"Purch. Rcpt. Line".Description,FALSE,TempExcelbuffer."Cell Type"::Text);
                  Entercell(Row,3,FORMAT("Purch. Rcpt. Line".Quantity),FALSE,TempExcelbuffer."Cell Type"::Number);
                  Entercell(Row,4,FORMAT("Unit Cost (LCY)"*Quantity),FALSE,TempExcelbuffer."Cell Type"::Number);
                END;
                CNT+=1;
                // COPY CODE FROM // Purch. Rcpt. Line, GroupFooter (4) - OnPreSection() <<
            end;

            trigger OnPreDataItem();
            begin
                IF NOT ((Choice=Choice::Fixed) OR ((Choice=Choice::Stock) AND "FIxed Asset") ) THEN
                   CurrReport.BREAK;

                 "Purch. Rcpt. Line".CALCFIELDS("Purch. Rcpt. Line"."Document date");
                "Purch. Rcpt. Line".SETRANGE("Purch. Rcpt. Line"."Document date",FA_From_Date,FA_To_Date);

                // copy code from // Purch. Rcpt. Line, Header (2) - OnPreSection()>>
                 IF excel THEN
                 BEGIN
                    Row+=1;
                    EnterHeadings(Row,1,'Item No.',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,2,'Description',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,3,'STOCK AT STORES',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,4,'UOM',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,5,'UNIT COST',TRUE,TempExcelbuffer."Cell Type"::Text);
                      EnterHeadings(Row,6,'TOTAL VALUE',TRUE,TempExcelbuffer."Cell Type"::Text);
                 END;
                // copy code from // Purch. Rcpt. Line, Header (2) - OnPreSection()<<
            end;
        }
        dataitem("<Item1>";Item)
        {
            DataItemTableView = SORTING(Item Stock Value,No.) ORDER(Ascending) WHERE(Product Group Code=FILTER(<>FPRODUCT&<>CPCB));
            column(ToDate_Control1102154093;ToDate)
            {
            }
            column(T_1__Control1102154096;T[1])
            {
            }
            column(T_2__Control1102154097;T[2])
            {
            }
            column(T_3__Control1102154098;T[3])
            {
            }
            column(T_4__Control1102154099;T[4])
            {
            }
            column(RAW_Value;RAW_Value)
            {
            }
            column(BOUT_Value;BOUT_Value)
            {
            }
            column(Others_Value;Others_Value)
            {
            }
            column(FIXED_Value;FIXED_Value)
            {
            }
            column(Stock_Brief_ReportCaption;Stock_Brief_ReportCaptionLbl)
            {
            }
            column(Stock_Valution_OnCaption_Control1102154094;Stock_Valution_OnCaption_Control1102154094Lbl)
            {
            }
            column(RAW_MaterialCaption;RAW_MaterialCaptionLbl)
            {
            }
            column(Bought_OutCaption;Bought_OutCaptionLbl)
            {
            }
            column(OthersCaption_Control1102154078;OthersCaption_Control1102154078Lbl)
            {
            }
            column(Fixed_AssetsCaption;Fixed_AssetsCaptionLbl)
            {
            }
            column(Item1__No_;"No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                          Stock_At_Stores:=0;

                          IF "<Item1>"."QC Enabled" = TRUE THEN
                          BEGIN
                            IF ("<Item1>"."Quantity Under Inspection"=0)AND ("<Item1>"."Quantity Rejected"=0) AND
                                 ("<Item1>"."Quantity Rework"=0) AND ("<Item1>"."Quantity Sent for Rework"=0) THEN
                            BEGIN
                              ItemLedgEntry.RESET;
                              ItemLedgEntry.SETCURRENTKEY("Item No.","Variant Code",Open,Positive,"Location Code","Posting Date",
                              "Expiration Date","Lot No.","Serial No.");
                              ItemLedgEntry.SETRANGE("Item No.","<Item1>"."No.");
                              ItemLedgEntry.SETRANGE(Open,TRUE);
                              ItemLedgEntry.SETRANGE(ItemLedgEntry."Posting Date",FromDate,DT2DATE(ToDate));
                              ItemLedgEntry.SETRANGE("Location Code",'STR');
                              IF ItemLedgEntry.FIND('-') THEN
                              REPEAT
                                Stock_At_Stores+=ItemLedgEntry."Remaining Quantity";
                              UNTIL ItemLedgEntry.NEXT=0;
                            END ELSE
                            BEGIN

                              ItemLedgEntry.RESET;
                              ItemLedgEntry.SETCURRENTKEY("Item No.","Variant Code",Open,Positive,"Location Code","Posting Date",
                              "Expiration Date","Lot No.","Serial No.");
                              ItemLedgEntry.SETRANGE("Item No.","<Item1>"."No.");
                              ItemLedgEntry.SETRANGE(ItemLedgEntry."Posting Date",FromDate,DT2DATE(ToDate));
                              ItemLedgEntry.SETRANGE(Open,TRUE);
                              ItemLedgEntry.SETRANGE("Location Code",'STR');
                              IF ItemLedgEntry.FIND('-')THEN
                              REPEAT
                                ItemLedgEntry.MARK(TRUE);
                                IF (QualityItemLedgEntry.GET(ItemLedgEntry."Entry No.") AND (QualityItemLedgEntry."Inspection Status"=
                                       QualityItemLedgEntry."Inspection Status"::"Under Inspection")) OR
                                       (QualityItemLedgEntry.GET(ItemLedgEntry."Entry No.")
                                       AND (QualityItemLedgEntry."Inspection Status"=QualityItemLedgEntry."Inspection Status"::Rejected)) THEN
                                ItemLedgEntry.MARK(FALSE);

                              UNTIL ItemLedgEntry.NEXT=0;
                            END;
                          END;
                          ItemLedgEntry.MARKEDONLY(TRUE);
                          IF ItemLedgEntry.FIND('-')THEN
                          REPEAT
                            Stock_At_Stores:=Stock_At_Stores+ItemLedgEntry."Remaining Quantity";
                          UNTIL ItemLedgEntry.NEXT=0;
                         IF DT2DATE(ToDate)<TODAY THEN
                        BEGIN
                          "Posted Material Issues line".SETCURRENTKEY("Posted Material Issues line"."Item No.");
                          "Posted Material Issues line".SETRANGE("Posted Material Issues line"."Item No.","<Item1>"."No.");
                          "Posted Material Issues line".SETFILTER("Posted Material Issues line"."Transfer-from Code",'STR');
                          "Posted Material Issues line".SETRANGE("Posted Material Issues line"."Receipt Date",DT2DATE(ToDate),TODAY);
                          IF"Posted Material Issues line".FIND('-') THEN
                          BEGIN
                            "Posted Material Issues line".CALCSUMS("Posted Material Issues line".Quantity);
                            Stock_At_Stores+="Posted Material Issues line".Quantity;
                          END;

                         END;

                 IF "<Item1>"."Item Category Code"='RAW' THEN
                   RAW_Value+=Stock_At_Stores*"<Item1>"."Avg Unit Cost"
                 ELSE   IF ("<Item1>"."Item Category Code"='ELE') AND ("<Item1>"."Product Group Code"='B OUT') THEN
                   BOUT_Value+=Stock_At_Stores*"<Item1>"."Avg Unit Cost"
                 ELSE
                    Others_Value+=Stock_At_Stores*"<Item1>"."Avg Unit Cost"
            end;

            trigger OnPostDataItem();
            begin
                // COPYT CODE FROM //  <Item1>, Footer (4) - OnPreSection() >>
                 PRL.SETFILTER(PRL.Type,'Fixed Asset');
                 IF PRL.FIND('-') THEN
                 REPEAT
                   FIXED_Value+=PRL.Quantity*PRL."Unit Cost (LCY)";
                 UNTIL PRL.NEXT=0;
                // COPYT CODE FROM //  <Item1>, Footer (4) - OnPreSection() <<
            end;

            trigger OnPreDataItem();
            begin
                   IF NOT( (Choice=Choice::Stock) AND ( Brief)) THEN
                   CurrReport.BREAK;

                // Rev01 >>
                SETRANGE("No.",Item."No.");
                // Rev01 <<
            end;
        }
        dataitem("<Item Ledger Entry1>";"Item Ledger Entry")
        {
            DataItemTableView = SORTING(Item No.,Variant Code,Open,Positive,Location Code,Posting Date,Expiration Date,Lot No.,Serial No.) ORDER(Ascending) WHERE(Remaining Quantity=FILTER(>0));
            RequestFilterFields = "Item No.","Location Code";
            column(TODAY;TODAY)
            {
            }
            column(Item_Ledger_Entry1___Item_No__;"Item No.")
            {
            }
            column(Item_Description_Control1102154031;Item.Description)
            {
            }
            column(Item_Ledger_Entry1___Lot_No__;"Lot No.")
            {
            }
            column(Item_Ledger_Entry1___Serial_No__;"Serial No.")
            {
            }
            column(Item_Ledger_Entry1____Item_Ledger_Entry1____Remaining_Quantity_;"<Item Ledger Entry1>"."Remaining Quantity")
            {
            }
            column(Item_Ledger_Entry1___Unit_of_Measure_Code_;"Unit of Measure Code")
            {
            }
            column(Item_Ledger_Entry1____Item_Ledger_Entry1____Remaining_Quantity__Control1102154045;"<Item Ledger Entry1>"."Remaining Quantity")
            {
            }
            column(Inventory_Stock_ValutionCaption;Inventory_Stock_ValutionCaptionLbl)
            {
            }
            column(Stock_Valution_OnCaption_Control1102154043;Stock_Valution_OnCaption_Control1102154043Lbl)
            {
            }
            column(Item_Ledger_Entry1___Item_No__Caption;FIELDCAPTION("Item No."))
            {
            }
            column(DescriptionCaption_Control1102154033;DescriptionCaption_Control1102154033Lbl)
            {
            }
            column(Item_Ledger_Entry1___Lot_No__Caption;FIELDCAPTION("Lot No."))
            {
            }
            column(Item_Ledger_Entry1___Serial_No__Caption;FIELDCAPTION("Serial No."))
            {
            }
            column(QuantityCaption;QuantityCaptionLbl)
            {
            }
            column(UOMCaption_Control1102154048;UOMCaption_Control1102154048Lbl)
            {
            }
            column(Item_Ledger_Entry1__Entry_No_;"Entry No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF Item.GET("<Item Ledger Entry1>"."Item No.") THEN;
            end;

            trigger OnPreDataItem();
            begin
                  IF Choice<>Choice::Valution THEN
                   CurrReport.BREAK;

                // Rev01 >>
                SETRANGE("Item No.",Item."No.");
                // Rev01 <<
            end;
        }
        dataitem("<Item2>";Item)
        {
            DataItemTableView = SORTING(Product Group Code,Item Stock Value,No.) ORDER(Descending) WHERE(Inventory at Stores=FILTER(>0),No.=FILTER(BOIMODE00014));
            column(TODAY_Control1102154068;TODAY)
            {
            }
            column(Item2___Product_Group_Code_;"Product Group Code")
            {
            }
            column(Item2___No__;"No.")
            {
            }
            column(Item2__Description;Description)
            {
            }
            column(Stock_At_Stores_Control1102154064;Stock_At_Stores)
            {
            }
            column(Item2____Item2____Avg_Unit_Cost_;"<Item2>"."Avg Unit Cost")
            {
            }
            column(Item2____Item2____Item_Stock_Value_;"<Item2>"."Item Stock Value")
            {
            }
            column(Item2___Sales_Unit_of_Measure_;"Sales Unit of Measure")
            {
            }
            column(TOTAL_Control1102154075;TOTAL)
            {
            }
            column(Item2___COUNT;"<Item2>".COUNT)
            {
            }
            column(Dead_Stock_ReportCaption;Dead_Stock_ReportCaptionLbl)
            {
            }
            column(Stock_Valution_OnCaption_Control1102154069;Stock_Valution_OnCaption_Control1102154069Lbl)
            {
            }
            column(Item2___No__Caption;FIELDCAPTION("No."))
            {
            }
            column(Item2__DescriptionCaption;FIELDCAPTION(Description))
            {
            }
            column(Stock_At_StoresCaption_Control1102154065;Stock_At_StoresCaption_Control1102154065Lbl)
            {
            }
            column(Unit_CostCaption_Control1102154072;Unit_CostCaption_Control1102154072Lbl)
            {
            }
            column(TotalCaption;TotalCaptionLbl)
            {
            }
            column(UOMCaption_Control1102154105;UOMCaption_Control1102154105Lbl)
            {
            }
            column(Dead_Stock_ValueCaption;Dead_Stock_ValueCaptionLbl)
            {
            }
            column(No__Of_ItemsCaption_Control1102154102;No__Of_ItemsCaption_Control1102154102Lbl)
            {
            }

            trigger OnAfterGetRecord();
            begin
                PRL.SETRANGE(PRL."Document date","STart Date",TODAY);
                PRL.SETCURRENTKEY(PRL."No.");
                PRL.SETRANGE(PRL."No.","<Item2>"."No.");
                IF PRL.FIND('-') THEN
                 CurrReport.SKIP;


                "Posted Material Issues line".SETRANGE("Posted Material Issues line"."Receipt Date",
                "STart Date",TODAY);
                "Posted Material Issues line".SETCURRENTKEY("Posted Material Issues line"."Item No.");

                 "Posted Material Issues line".SETRANGE("Posted Material Issues line"."Item No.","<Item2>"."No.");
                IF "Posted Material Issues line".FIND('-') THEN
                  CurrReport.SKIP;

                "Posted Material Issues line".RESET;
                  Stock_At_Stores:="<Item2>"."Stock at Stores"+
                                   "<Item2>"."Stock At MCH Location"+
                                   "<Item2>"."Stock at CS Stores"+
                                   "<Item2>"."Stock at RD Stores";

                // copy code from // <Item2>, Body (4) - OnPreSection() >>

                 TOTAL+="<Item2>"."Avg Unit Cost"*Stock_At_Stores;
                   IF excel THEN
                   BEGIN
                     Row+=1;
                     Entercell(Row,1,"<Item2>"."No.",FALSE,TempExcelbuffer."Cell Type"::Text);
                     Entercell(Row,2,"<Item2>".Description,FALSE,TempExcelbuffer."Cell Type"::Text);
                     Entercell(Row,3,FORMAT("<Item2>"."Product Group Code"),FALSE,TempExcelbuffer."Cell Type"::Text);
                     Entercell(Row,4,FORMAT(Stock_At_Stores),FALSE,TempExcelbuffer."Cell Type"::Number);
                     Entercell(Row,5,"<Item2>"."Base Unit of Measure",FALSE,TempExcelbuffer."Cell Type"::Text);
                     Entercell(Row,6,FORMAT("<Item2>"."Avg Unit Cost"),FALSE,TempExcelbuffer."Cell Type"::Number);
                     Entercell(Row,7,FORMAT("<Item2>"."Avg Unit Cost"*Stock_At_Stores),FALSE,TempExcelbuffer."Cell Type"::Number);
                   END;
                // copy code from // <Item2>, Body (4) - OnPreSection() <<
            end;

            trigger OnPreDataItem();
            begin
                // Rev01 >>
                SETRANGE("No.",Item."No.");
                // Rev01 <<

                IF (Choice<>Choice::Dead) THEN
                CurrReport.BREAK;
                IF Period='' THEN
                  Period:='-12M'
                ELSE
                  Period:='-'+Period;
                "STart Date":= CALCDATE(Period,TODAY);
                "Posted Material Issues line".SETRANGE("Posted Material Issues line"."Receipt Date",
                "STart Date",TODAY);
                "Posted Material Issues line".SETCURRENTKEY("Posted Material Issues line"."Item No.");

                // copy code from // <Item2>, Header (2) - OnPreSection() >>
                  IF excel THEN
                  BEGIN
                    Row+=1;
                    EnterHeadings(Row,1,'Item No.',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,2,'Description',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,3,'PRODUCT GROUP CODE',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,4,'Stock At Stores',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,5,'UOM',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,6,'UNIT COST',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,7,'TOTAL COST',TRUE,TempExcelbuffer."Cell Type"::Text);



                  END;
                // copy code from // <Item2>, Header (2) - OnPreSection() <<
            end;
        }
        dataitem("Stock Statement";"Stock Statement")
        {
            DataItemTableView = SORTING(Month,Year,Total Cost) ORDER(Descending) WHERE(Total Cost=FILTER(>0));
            column(ToDate_Control1102154133;ToDate)
            {
            }
            column(T_1__Control1102154136;T[1])
            {
            }
            column(T_2__Control1102154137;T[2])
            {
            }
            column(T_3__Control1102154138;T[3])
            {
            }
            column(T_4__Control1102154139;T[4])
            {
            }
            column(CNT_Control1102154147;CNT)
            {
            }
            column(Item1___Description;"<Item1>".Description)
            {
            }
            column(Stock_Statement__Stock_Statement___Stock_Qty_;"Stock Qty")
            {
            }
            column(Stock_Statement__Stock_Statement___Total_Cost_;"Total Cost")
            {
            }
            column(Stock_Statement__Stock_Statement___Unit_Cost_;"Unit Cost")
            {
            }
            column(Item1____Base_Unit_of_Measure_;"<Item1>"."Base Unit of Measure")
            {
            }
            column(BLW_TOT_COST_;"BLW-TOT-COST")
            {
            }
            column(CNT_Control1102154163;CNT)
            {
            }
            column(CNT_Control1102154156;CNT)
            {
            }
            column(TOTAL_Control1102154158;TOTAL)
            {
            }
            column(StockCaption_Control1102154129;StockCaption_Control1102154129Lbl)
            {
            }
            column(Stock_Valution_OnCaption_Control1102154134;Stock_Valution_OnCaption_Control1102154134Lbl)
            {
            }
            column(SNOCaption;SNOCaptionLbl)
            {
            }
            column(DescriptionCaption_Control1102154141;DescriptionCaption_Control1102154141Lbl)
            {
            }
            column(Stock_at_StoresCaption_Control1102154142;Stock_at_StoresCaption_Control1102154142Lbl)
            {
            }
            column(Unit_CostCaption_Control1102154143;Unit_CostCaption_Control1102154143Lbl)
            {
            }
            column(Total_CostCaption;Total_CostCaptionLbl)
            {
            }
            column(UOMCaption_Control1102154146;UOMCaption_Control1102154146Lbl)
            {
            }
            column(Items_Below_having_Total_Cost__2000Caption;Items_Below_having_Total_Cost__2000CaptionLbl)
            {
            }
            column(No__Of_ItemsCaption_Control1102154155;No__Of_ItemsCaption_Control1102154155Lbl)
            {
            }
            column(Stock_ValueCaption_Control1102154157;Stock_ValueCaption_Control1102154157Lbl)
            {
            }
            column(Stock_Statement_Month;Month)
            {
            }
            column(Stock_Statement_Year;Year)
            {
            }
            column(Stock_Statement_Item;Item)
            {
            }
            column(StockBodyVisi;StockBodyVisi)
            {
            }

            trigger OnAfterGetRecord();
            begin
                // copy code from // Stock Statement, Body (3) - OnPreSection() >>
                StockBodyVisi := FALSE;

                IF "<Item1>".GET("Stock Statement".Item) THEN
                  TOTAL+="Stock Statement"."Total Cost";
                      IF ("Stock Statement"."Total Cost"<2000) THEN
                      BEGIN
                        "BLW-TOT-COST"+= "Stock Statement"."Total Cost";
                        StockBodyVisi:=TRUE;
                      END ELSE
                        CNT+=1;


                       IF excel AND ("Stock Statement"."Total Cost">=2000) THEN
                       BEGIN
                         Row+=1;

                         Entercell(Row,1,FORMAT(CNT),FALSE,TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row,2,"<Item1>".Description,FALSE,TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row,3,FORMAT("Stock Statement"."Stock Qty"),FALSE,TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row,4,FORMAT("Stock Statement"."Unit Cost"),FALSE,TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row,5,FORMAT("Stock Statement"."Total Cost"),FALSE,TempExcelbuffer."Cell Type"::Number);
                      END;
                // copy code from // Stock Statement, Body (3) - OnPreSection() <<
            end;

            trigger OnPostDataItem();
            begin
                // copy code from // Stock Statement, Footer (4) - OnPreSection() >>

                  CNT+=1;
                  IF excel  THEN
                  BEGIN
                    Row+=1;
                    Entercell(Row,1,FORMAT(CNT),FALSE,TempExcelbuffer."Cell Type"::Number);
                    Entercell(Row,2,'Items Below having Total Cost <2000',FALSE,TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row,5,FORMAT("BLW-TOT-COST"),FALSE,TempExcelbuffer."Cell Type"::Number);
                  END;
                // copy code from // Stock Statement, Footer (4) - OnPreSection() <<

                // copy code from // Stock Statement, Footer (5) - OnPreSection() >>

                        IF excel THEN
                        BEGIN
                          Row+=1;
                          Entercell(Row,3,'Total Production Store Stock Value',TRUE,TempExcelbuffer."Cell Type"::Text);
                          Entercell(Row,7,FORMAT(TOTAL),FALSE,TempExcelbuffer."Cell Type"::Number);
                        END;
                // copy code from // Stock Statement, Footer (5) - OnPreSection() <<
            end;

            trigger OnPreDataItem();
            begin
                // Rev01 >>
                //setrange("Item",Item."No.");
                // Rev01 <<

                  IF  (Choice<>Choice::OLD)  THEN
                     CurrReport.BREAK;
                   "Stock Statement".SETRANGE("Stock Statement".Month,DATE2DMY(DT2DATE(ToDate),2));
                   "Stock Statement".SETRANGE("Stock Statement".Year,DATE2DMY(DT2DATE(ToDate),3));

                // copy code from // Stock Statement, Header (2) - OnPreSection() >>
                  IF excel THEN
                  BEGIN

                    IF Row=1 THEN
                    BEGIN
                      EnterHeadings(Row,1,'S No.',TRUE,TempExcelbuffer."Cell Type"::Text);
                      EnterHeadings(Row,2,'Description',TRUE,TempExcelbuffer."Cell Type"::Text);
                      EnterHeadings(Row,3,'Stock At Stores',TRUE,TempExcelbuffer."Cell Type"::Text);
                      EnterHeadings(Row,4,'Unit Cost',TRUE,TempExcelbuffer."Cell Type"::Text);
                      EnterHeadings(Row,5,'Total Cost',TRUE,TempExcelbuffer."Cell Type"::Text);
                    END;
                  END
                // copy code from // Stock Statement, Header (2) - OnPreSection() <<
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(General)
                {
                    field(Choice;'')
                    {
                        Caption = 'Choice';
                        Style = Strong;
                        StyleExpr = TRUE;
                    }
                    field(Control1102152003;Choice)
                    {
                        Caption = 'Choice';
                        Style = Strong;
                        StyleExpr = TRUE;
                    }
                    field(Period;Period)
                    {
                        Caption = 'Enter Period';
                    }
                    field("Please Enter The Period In Capital Letters (Ex: 1W(Week),2M(Month),1Y(Year)) By Default 1 year";'')
                    {
                        Caption = 'Please Enter The Period In Capital Letters (Ex: 1W(Week),2M(Month),1Y(Year)) By Default 1 year';
                        Style = Strong;
                        StyleExpr = TRUE;
                    }
                    field("Consider_0_ Stock";"Consider_0_ Stock")
                    {
                        Caption = 'Show 0 Stock Items Also';

                        trigger OnValidate();
                        begin
                            Choice:=Choice::Stock;
                        end;
                    }
                    field("Production Items";"Production Items")
                    {
                        Caption = 'Only Production Items';

                        trigger OnValidate();
                        begin
                            Choice:=Choice::Stock;
                        end;
                    }
                    field(Verified;Verified)
                    {
                        Caption = 'Verified Items Only';

                        trigger OnValidate();
                        begin
                            Choice:=Choice::Stock;
                        end;
                    }
                    field("FIxed Asset";"FIxed Asset")
                    {
                        Caption = 'FIxed Assets Also';

                        trigger OnValidate();
                        begin
                            Choice:=Choice::Stock;
                        end;
                    }
                    field(MD;MD)
                    {
                        Caption = 'For MD Sir';
                    }
                    field(STR;STR)
                    {
                        Caption = 'STR';
                    }
                    field(RD_STR;RD_STR)
                    {
                        Caption = 'RD_STR';
                    }
                    field(CS_STR;CS_STR)
                    {
                        Caption = 'CS_STR';
                    }
                    field(PRD_STR;PRD_STR)
                    {
                        Caption = 'PRD_STR';
                    }
                    field(MCH;MCH)
                    {
                        Caption = 'MCH';
                    }
                    field(QC;QC)
                    {
                        Caption = 'QC';
                    }
                    field(ToDate;ToDate)
                    {
                        Caption = 'Stock Valution On';
                    }
                    field(Brief;Brief)
                    {
                        Caption = 'Brief Report';

                        trigger OnValidate();
                        begin
                            Choice:=Choice::Stock;
                        end;
                    }
                    field("Dump to Statement";"Dump to Statement")
                    {
                        Caption = 'Dump to Statement';

                        trigger OnValidate();
                        begin
                            IF Choice<>Choice::Stock THEN
                            BEGIN
                              ERROR('Please Select the Option "Stock Report" ');
                              "Dump to Statement":=FALSE;
                            END;
                            /*IF DATE2DWY(DT2DATE(ToDate),1)<>5 THEN
                            BEGIN
                                ERROR('TODAY MUST BE FRIDAY');
                              "Dump to Statement":=FALSE;
                            END;
                            */
                            "Stock Statement".SETRANGE("Stock Statement".Month,DATE2DMY(DT2DATE(ToDate),2));
                            "Stock Statement".SETRANGE("Stock Statement".Year,DATE2DMY(DT2DATE(ToDate),3));
                            IF "Stock Statement".FIND('-') THEN
                            BEGIN
                              Selection := STRMENU(Text001,1);
                              IF Selection=2 THEN
                                "Stock Statement".DELETEALL
                              ELSE
                                "Dump to Statement":=FALSE;
                            END;

                        end;
                    }
                    field(FA_From_Date;FA_From_Date)
                    {
                        Caption = 'From Date';
                    }
                    field(FA_To_Date;FA_To_Date)
                    {
                        Caption = 'To Date';
                    }
                    field(excel;excel)
                    {
                        Caption = 'Excel';
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport();
    begin
          FromDate:=010407D;
          ToDate:=CURRENTDATETIME;
          STR:=TRUE;
          RD_STR:=TRUE;
          CS_STR:=TRUE;
          MCH:=TRUE;
          PRD_STR:=TRUE; //sundar
          FA_From_Date:=010407D;
          FA_To_Date:=TODAY;
    end;

    trigger OnPostReport();
    begin
        IF excel THEN BEGIN
          /*
          TempExcelbuffer.CreateBook('Stock','');//B2B //EFFUPG
          TempExcelbuffer.WriteSheet('Stock',COMPANYNAME,USERID);//Rev01
          TempExcelbuffer.CloseBook; //Rev01
          TempExcelbuffer.OpenExcel; //Rev01
          TempExcelbuffer.GiveUserControl;
          */
          TempExcelbuffer.CreateBookAndOpenExcel('','Stock','Stock',COMPANYNAME,USERID); //EFFUPG
        END;

    end;

    trigger OnPreReport();
    begin
           IF excel THEN
           BEGIN
             CLEAR(TempExcelbuffer);
             TempExcelbuffer.DELETEALL;
           END;
         IF (STR OR MCH) AND ( (Choice=Choice::Stock) AND (NOT Brief))  THEN
           CODEUNIT.RUN(60020);
    end;

    var
        TOTAL : Decimal;
        desc : Record Item;
        des : Text[30];
        Stock_At_Stores : Decimal;
        Choice : Option Valution,Stock,Dead,"Fixed",OLD;
        ItemLedgEntry : Record "Item Ledger Entry";
        QualityItemLedgEntry : Record "Quality Item Ledger Entry";
        "Consider_0_ Stock" : Boolean;
        TempExcelbuffer : Record "Excel Buffer" temporary;
        Row : Integer;
        "Production Items" : Boolean;
        FromDate : Date;
        ToDate : DateTime;
        excel : Boolean;
        Verified : Boolean;
        STR : Boolean;
        RD_STR : Boolean;
        CS_STR : Boolean;
        CNT : Integer;
        Brief : Boolean;
        "Posted Material Issues line" : Record "Posted Material Issues Line";
        "STart Date" : Date;
        Period : Text[30];
        UC : Decimal;
        PRL : Record "Purch. Rcpt. Line";
        "FIxed Asset" : Boolean;
        RAW_Value : Decimal;
        BOUT_Value : Decimal;
        Others_Value : Decimal;
        FIXED_Value : Decimal;
        T : array [5] of Text[250];
        I : Integer;
        Item_Dum : Record Item;
        "Stock At Prod Value" : Decimal;
        "Stock At R&D Value" : Decimal;
        "Stock At Cs Value" : Decimal;
        "Purchase line" : Record "Purchase Line";
        "Expected Date" : Date;
        Col : Integer;
        MCH : Boolean;
        Dead : Boolean;
        MD : Boolean;
        PMH : Record "Posted Material Issues Header";
        Last_Issued_Date : Date;
        "Last _Inward_Date" : Date;
        Last_Inward_Qty : Decimal;
        FA_From_Date : Date;
        FA_To_Date : Date;
        Product_Wise_Stock_Values : array [10] of Decimal;
        "YestedDay_ Inward_Value" : Decimal;
        YesterDay_Issues_Value : Decimal;
        YesterDay_Adjustments_Value : Decimal;
        "Posted Material Issues Header" : Record "Posted Material Issues Header";
        "Purch. Rcpt. Header" : Record "Purch. Rcpt. Header";
        Stores : Text[1000];
        "Dump to Statement" : Boolean;
        Text001 : Label 'Exit from the Report, Remove the Data';
        Selection : Integer;
        QC : Boolean;
        PMIL : Record "Posted Material Issues Line";
        "BLW-TOT-COST" : Decimal;
        DAY_WISE_DETAILS : Record "DAY WISE DETAILS";
        DAMAGE_VALUE : Decimal;
        LOCATION : Record Location;
        DL_STOCK : Decimal;
        BMU_STOCK : Decimal;
        FEP_STOCK : Decimal;
        RTU_STOCK : Decimal;
        PMU_STOCK : Decimal;
        SIG_STOCK : Decimal;
        IPIS_STOCK : Decimal;
        PC_STOCK : Decimal;
        SSI_STOCK : Decimal;
        REMAINING_STOCK : Decimal;
        DEAD_STOCK : Decimal;
        PRD_STR : Boolean;
        LED_STOCK : Decimal;
        LCGATE_STOCK : Decimal;
        MLRI_STOCK : Decimal;
        BI_STOCK : Decimal;
        WTLC_STOCK : Decimal;
        StockCaptionLbl : Label 'Stock';
        Stock_Valution_OnCaptionLbl : Label 'Stock Valution On';
        Stock_At_StoresCaptionLbl : Label 'Stock At Stores';
        ValueCaptionLbl : Label 'Value';
        Unit_CostCaptionLbl : Label 'Unit Cost';
        UOMCaptionLbl : Label 'UOM';
        Item_VerifiedCaptionLbl : Label 'Item Verified';
        Stock_ValueCaptionLbl : Label 'Stock Value';
        No__Of_ItemsCaptionLbl : Label 'No. Of Items';
        Product_Wise_Stock_ValueCaptionLbl : Label 'Product Wise Stock Value';
        Data_LoggerCaptionLbl : Label 'Data Logger';
        Rly___LampCaptionLbl : Label 'Rly.  Lamp';
        Road_LampCaptionLbl : Label 'Road Lamp';
        DisplaysCaptionLbl : Label 'Displays';
        SystemCaptionLbl : Label 'System';
        OthersCaptionLbl : Label 'Others';
        Yesterday_Inward_ValueCaptionLbl : Label 'Yesterday Inward Value';
        Yesteday_Issues_ValueCaptionLbl : Label 'Yesteday Issues Value';
        Yesterday_Adjustment_ValueCaptionLbl : Label 'Yesterday Adjustment Value';
        BlanksCaptionLbl : Label 'Blanks';
        Dead_StockCaptionLbl : Label 'Dead Stock';
        Fixed_Assets_StockCaptionLbl : Label '" Fixed Assets Stock"';
        Stock_Valution_OnCaption_Control1102154082Lbl : Label 'Stock Valution On';
        ValueCaption_Control1102154053Lbl : Label 'Value';
        Uint_CostCaptionLbl : Label 'Uint Cost';
        Stock_At_StoresCaption_Control1102154056Lbl : Label 'Stock At Stores';
        UOMCaption_Control1102154057Lbl : Label 'UOM';
        DescriptionCaptionLbl : Label 'Description';
        No_CaptionLbl : Label 'No.';
        Stock_ValueCaption_Control1102154019Lbl : Label 'Stock Value';
        No__Of_ItemsCaption_Control1102154021Lbl : Label 'No. Of Items';
        Stock_Brief_ReportCaptionLbl : Label 'Stock Brief Report';
        Stock_Valution_OnCaption_Control1102154094Lbl : Label 'Stock Valution On';
        RAW_MaterialCaptionLbl : Label 'RAW Material';
        Bought_OutCaptionLbl : Label 'Bought Out';
        OthersCaption_Control1102154078Lbl : Label 'Others';
        Fixed_AssetsCaptionLbl : Label 'Fixed Assets';
        Inventory_Stock_ValutionCaptionLbl : Label 'Inventory Stock Valution';
        Stock_Valution_OnCaption_Control1102154043Lbl : Label 'Stock Valution On';
        DescriptionCaption_Control1102154033Lbl : Label 'Description';
        QuantityCaptionLbl : Label 'Quantity';
        UOMCaption_Control1102154048Lbl : Label 'UOM';
        Dead_Stock_ReportCaptionLbl : Label 'Dead Stock Report';
        Stock_Valution_OnCaption_Control1102154069Lbl : Label 'Stock Valution On';
        Stock_At_StoresCaption_Control1102154065Lbl : Label 'Stock At Stores';
        Unit_CostCaption_Control1102154072Lbl : Label 'Unit Cost';
        TotalCaptionLbl : Label 'Total';
        UOMCaption_Control1102154105Lbl : Label 'UOM';
        Dead_Stock_ValueCaptionLbl : Label 'Dead Stock Value';
        No__Of_ItemsCaption_Control1102154102Lbl : Label 'No. Of Items';
        StockCaption_Control1102154129Lbl : Label 'Stock';
        Stock_Valution_OnCaption_Control1102154134Lbl : Label 'Stock Valution On';
        SNOCaptionLbl : Label 'SNO';
        DescriptionCaption_Control1102154141Lbl : Label 'Description';
        Stock_at_StoresCaption_Control1102154142Lbl : Label 'Stock at Stores';
        Unit_CostCaption_Control1102154143Lbl : Label 'Unit Cost';
        Total_CostCaptionLbl : Label 'Total Cost';
        UOMCaption_Control1102154146Lbl : Label 'UOM';
        Items_Below_having_Total_Cost__2000CaptionLbl : Label 'Items Below having Total Cost <2000';
        No__Of_ItemsCaption_Control1102154155Lbl : Label 'No. Of Items';
        Stock_ValueCaption_Control1102154157Lbl : Label 'Stock Value';
        ItemBodyVisi : Boolean;
        StockBodyVisi : Boolean;

    [LineStart(4774)]
    procedure Entercell(RowNo : Integer;ColumnNo : Integer;CellValue : Text[1000];bold : Boolean;CellType : Option);
    begin
        TempExcelbuffer.INIT;
        TempExcelbuffer.VALIDATE("Row No.",RowNo);
        TempExcelbuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelbuffer."Cell Value as Text" := CellValue;
        TempExcelbuffer.Bold:=bold ;
        TempExcelbuffer."Cell Type" := CellType;
        TempExcelbuffer.INSERT;
    end;

    [LineStart(4783)]
    procedure EnterHeadings(RowNo : Integer;ColumnNo : Integer;CellValue : Text[100];Bold : Boolean;CellType : Option);
    begin
        TempExcelbuffer.INIT;
        TempExcelbuffer.VALIDATE("Row No.",RowNo);
        TempExcelbuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelbuffer."Cell Value as Text" := FORMAT(CellValue);
        TempExcelbuffer.Bold:=Bold ;
        TempExcelbuffer."Cell Type" := CellType;
        TempExcelbuffer.Formula := '';
        TempExcelbuffer.INSERT;
    end;

    [LineStart(4793)]
    procedure "Entercell New"();
    begin
    end;

    [LineStart(4796)]
    procedure MONTH(MNT : Integer) MONTH : Text[30];
    var
        Days_Of_Month : Integer;
    begin
          CASE  MNT OF
          1:BEGIN
              MONTH:='JAN';
              Days_Of_Month:=31;
            END;
        2:BEGIN
            MONTH:='FEB';
            Days_Of_Month:=29;
          END;
        3:BEGIN
            MONTH:='MAR';
            Days_Of_Month:=31;
          END;
        4:BEGIN
            MONTH:='APR';
            Days_Of_Month:=30;
          END;
        5:BEGIN
            MONTH:='MAY';
            Days_Of_Month:=31;
          END;
        6:BEGIN
            MONTH:='JUN';
            Days_Of_Month:=30;
          END;
        7:BEGIN
            MONTH:='JUL';
            Days_Of_Month:=31;
          END;
        8:BEGIN
            MONTH:='AUG';
            Days_Of_Month:=31;
          END;
        9:BEGIN
            MONTH:='SEP';
            Days_Of_Month:=30;
          END;
        10:BEGIN
            MONTH:='OCT';
            Days_Of_Month:=31;
          END;
        11:BEGIN
            MONTH:='NOV';
            Days_Of_Month:=30;
          END;
        12:BEGIN
            MONTH:='DEC';
            Days_Of_Month:=31;
           END;
        END;
        EXIT(MONTH);
    end;
}

