report 50212 "Store Stock Valuation1"
{
    // version EFFUPG

    // Item.SETFILTER(Item."No.",''''+item1+'''');
    DefaultLayout = RDLC;
    RDLCLayout = './Store Stock Valuation1.rdlc';


    dataset
    {
        dataitem(Item; Item)
        {
            CalcFields = Qty. on Purch. Order, Quantity Under Inspection, Stock At MCH Location;
            DataItemTableView = SORTING(Item Stock Value, No.) ORDER(Descending) WHERE(Product Group Code=FILTER(<>FPRODUCT&<>CPCB));
            RequestFilterFields = "No.";
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
            column(TOTAL1;TOTAL1)
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
            column(Uint_CostCaption;Uint_CostCaptionLbl)
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

            trigger OnAfterGetRecord();
            begin
                  TOTAL1:=0;
                  Stock_At_Stores:=0;
                  temp:=0;
                    ItemLedgEntry.RESET;
                    Item.CALCFIELDS("Quantity Under Inspection","Quantity Rejected","Quantity Rework","Quantity Sent for Rework");
                    IF Item."QC Enabled" = TRUE THEN
                    BEGIN
                      IF (Item."Quantity Under Inspection"=0) AND (Item."Quantity Rejected"=0)
                         AND(Item."Quantity Rework"=0) AND (Item."Quantity Sent for Rework"=0) THEN
                      BEGIN
                        ItemLedgEntry.SETCURRENTKEY("Item No.","Variant Code",Open,Positive,"Location Code","Posting Date",
                        "Expiration Date","Lot No.","Serial No.");
                        ItemLedgEntry.SETRANGE("Item No.","No.");
                        ItemLedgEntry.SETRANGE(Open,TRUE);
                        ItemLedgEntry.SETFILTER("Location Code",filter);
                        ItemLedgEntry.SETFILTER(ItemLedgEntry."Remaining Quantity",'>%1',0);
                        IF ItemLedgEntry.FIND('-') THEN
                        REPEAT
                          ItemLedgEntry.MARK(TRUE);
                        UNTIL ItemLedgEntry.NEXT=0;
                      END ELSE
                      BEGIN
                        ItemLedgEntry.RESET;
                        ItemLedgEntry.SETCURRENTKEY("Item No.","Variant Code",Open,Positive,"Location Code","Posting Date",
                        "Expiration Date","Lot No.","Serial No.");
                        ItemLedgEntry.SETRANGE("Item No.",Item."No.");
                        ItemLedgEntry.SETRANGE(Open,TRUE);
                        ItemLedgEntry.SETFILTER("Location Code",filter);
                        ItemLedgEntry.SETFILTER(ItemLedgEntry."Remaining Quantity",'>%1',0);
                        IF ItemLedgEntry.FINDSET THEN
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
                    IF ItemLedgEntry.FINDSET THEN
                    REPEAT
                      temp:=0;
                      "LOTNO." := COPYSTR(ItemLedgEntry."Lot No.",1,10);
                      ILE.RESET;
                      ILE.SETRANGE(ILE."Item No.",ItemLedgEntry."Item No.");
                      ILE.SETRANGE(ILE."Serial No.",ItemLedgEntry."Serial No.");
                      ILE.SETRANGE(ILE."Lot No.","LOTNO.");
                      ILE.SETFILTER(ILE."Document Type",'Purchase Receipt');
                      IF ILE.FIND('-') THEN
                      BEGIN
                        PIL.RESET;
                        PIL.SETCURRENTKEY(PIL."Receipt Document No.",PIL."No.");
                        PIL.SETFILTER(PIL."Receipt No.",ILE."Document No.");
                        PIL.SETFILTER(PIL."No.",ILE."Item No.");
                        IF PIL.FIND('-') THEN
                        BEGIN
                          PIH.RESET;
                          PIH.SETFILTER(PIH."No.",PIL."Document No.");
                          IF PIH.FINDFIRST THEN
                          BEGIN
                            IF PIH."Currency Code"='' THEN
                            BEGIN
                              TOTAL1 += ItemLedgEntry."Remaining Quantity"*(PIL."Amount To Vendor"/PIL.Quantity);
                              Stock_At_Stores+=ItemLedgEntry."Remaining Quantity";
                              temp:=1;
                            END ELSE
                            BEGIN
                              SOD.RESET;
                              SOD.SETFILTER(SOD.Type,'Purchase');
                              SOD.SETFILTER(SOD."Document Type",'Invoice');
                              SOD.SETFILTER(SOD."Document No.",PIL."Document No.");
                              SOD.SETFILTER(SOD."Line No.",'%1',PIL."Line No.");
                              IF SOD.FINDFIRST THEN
                              REPEAT
                                IF SOD."Tax/Charge Type"=SOD."Tax/Charge Type"::GST THEN
                                  Structure_Amount+=SOD."Calculation Value"
                                ELSE
                                  Structure_Amount+=SOD."Amount (LCY)";
                              UNTIL SOD.NEXT=0;
                              TOTAL1 += ItemLedgEntry."Remaining Quantity"*((PIL."Unit Cost (LCY)")+(Structure_Amount/PIL.Quantity));
                              Stock_At_Stores+=ItemLedgEntry."Remaining Quantity";
                              temp:=1;
                            END;
                          END;
                        END
                        ELSE
                        BEGIN
                          PRH.RESET;
                          PRH.SETFILTER(PRH."No.",ILE."Document No.");
                          IF PRH.FIND('-') THEN
                          BEGIN
                            "Purchase line".RESET;
                            "Purchase line".SETFILTER("Purchase line"."Document No.",PRH."Order No.");
                            "Purchase line".SETFILTER("Purchase line"."No.",ILE."Item No.");
                            IF "Purchase line".FIND('-') THEN
                            BEGIN
                              TOTAL1 += ItemLedgEntry."Remaining Quantity"*("Purchase line"."Unit Cost (LCY)");
                              Stock_At_Stores+=ItemLedgEntry."Remaining Quantity";
                              temp:=1;
                            END;
                          END;
                        END;
                      END;
                      IF temp=0 THEN
                      BEGIN
                        TOTAL1 += ItemLedgEntry."Remaining Quantity"*Item."Avg Unit Cost";
                        Stock_At_Stores+=ItemLedgEntry."Remaining Quantity";
                      END;
                    UNTIL ItemLedgEntry.NEXT=0;
                
                
                    IF DT2DATE(ToDate)<DT2DATE(CURRENTDATETIME) THEN
                    BEGIN
                      ItemLedgEntry.RESET;
                      ItemLedgEntry.SETCURRENTKEY(ItemLedgEntry."Item No.",
                                                  ItemLedgEntry."Entry Type",
                                                  ItemLedgEntry."Variant Code",
                                                  ItemLedgEntry."Drop Shipment",
                                                  ItemLedgEntry."Location Code",
                                                  ItemLedgEntry."Posting Date");
                      ItemLedgEntry.SETRANGE(ItemLedgEntry."Entry Type",ItemLedgEntry."Entry Type"::Transfer);
                      ItemLedgEntry.SETRANGE(ItemLedgEntry."Item No.",Item."No.");
                      ItemLedgEntry.SETFILTER(ItemLedgEntry."Location Code",filter);
                      ItemLedgEntry.SETRANGE(ItemLedgEntry."Posting Date",DT2DATE(ToDate),TODAY);
                      IF ItemLedgEntry.FIND('-') THEN
                      REPEAT
                        temp:=0;
                        "LOTNO." := COPYSTR(ItemLedgEntry."Lot No.",1,10);
                        ILE.RESET;
                        ILE.SETRANGE(ILE."Item No.",ItemLedgEntry."Item No.");
                        ILE.SETRANGE(ILE."Serial No.",ItemLedgEntry."Serial No.");
                        ILE.SETRANGE(ILE."Lot No.","LOTNO.");
                        ILE.SETFILTER(ILE."Document Type",'Purchase Receipt');
                        IF ILE.FIND('-') THEN
                        BEGIN
                          PIL.RESET;
                          PIL.SETCURRENTKEY(PIL."Receipt Document No.",PIL."No.");
                          PIL.SETFILTER(PIL."Receipt No.",ILE."Document No.");
                          PIL.SETFILTER(PIL."No.",ILE."Item No.");
                          IF PIL.FIND('-') THEN
                          BEGIN
                            PIH.RESET;
                            PIH.SETFILTER(PIH."No.",PIL."Document No.");
                            IF PIH.FINDFIRST THEN
                            BEGIN
                              IF PIH."Currency Code"='' THEN
                              BEGIN
                                TOTAL1 -= ItemLedgEntry.Quantity*(PIL."Amount To Vendor"/PIL.Quantity);
                                Stock_At_Stores-=ItemLedgEntry.Quantity;
                                temp:=1;
                              END ELSE
                              BEGIN
                                SOD.RESET;
                                SOD.SETFILTER(SOD.Type,'Purchase');
                                SOD.SETFILTER(SOD."Document Type",'Invoice');
                                SOD.SETFILTER(SOD."Document No.",PIL."Document No.");
                                SOD.SETFILTER(SOD."Line No.",'%1',PIL."Line No.");
                                IF SOD.FINDFIRST THEN
                                REPEAT
                                  IF SOD."Tax/Charge Type"=SOD."Tax/Charge Type"::GST THEN
                                     Structure_Amount+=SOD."Calculation Value"
                                  ELSE
                                    Structure_Amount+=SOD."Amount (LCY)";
                                UNTIL SOD.NEXT=0;
                                TOTAL1 -= ItemLedgEntry.Quantity*((PIL."Unit Cost (LCY)")+(Structure_Amount/PIL.Quantity));
                                Stock_At_Stores-=ItemLedgEntry.Quantity;
                                temp:=1;
                              END;
                            END;
                          END
                          ELSE
                          BEGIN
                            PRH.RESET;
                            PRH.SETFILTER(PRH."No.",ILE."Document No.");
                            IF PRH.FIND('-') THEN
                            BEGIN
                              "Purchase line".RESET;
                              "Purchase line".SETFILTER("Purchase line"."Document No.",PRH."Order No.");
                              "Purchase line".SETFILTER("Purchase line"."No.",ILE."Item No.");
                              IF "Purchase line".FIND('-') THEN
                              BEGIN
                                TOTAL1 -= ItemLedgEntry.Quantity*("Purchase line"."Amount To Vendor"/"Purchase line".Quantity);
                                Stock_At_Stores-=ItemLedgEntry.Quantity;
                                temp:=1;
                              END;
                            END;
                          END;
                        END;
                        IF temp=0 THEN
                        BEGIN
                          TOTAL1 -=ItemLedgEntry.Quantity*Item."Avg Unit Cost";
                          Stock_At_Stores-=ItemLedgEntry.Quantity;
                        END;
                      UNTIL ItemLedgEntry.NEXT=0;
                
                
                      ItemLedgEntry.RESET;
                      ItemLedgEntry.SETCURRENTKEY(ItemLedgEntry."Document No.",
                                                  ItemLedgEntry."Item No.",
                                                  ItemLedgEntry."Posting Date");
                      ItemLedgEntry.SETFILTER(ItemLedgEntry."Document Type",'Purchase Receipt');
                      ItemLedgEntry.SETRANGE(ItemLedgEntry."Posting Date",DT2DATE(ToDate),TODAY);
                      ItemLedgEntry.SETRANGE(ItemLedgEntry."Item No.",Item."No.");
                      IF ItemLedgEntry.FIND('-') THEN
                      REPEAT
                        temp:=0;
                        IF NOT(QualityItemLedgEntry.GET(ItemLedgEntry."Entry No.")) THEN
                        BEGIN
                          PIL.RESET;
                          PIL.SETCURRENTKEY(PIL."Receipt Document No.",PIL."No.");
                          PIL.SETFILTER(PIL."Receipt No.",ItemLedgEntry."Document No.");
                          PIL.SETFILTER(PIL."No.",ItemLedgEntry."Item No.");
                          IF PIL.FIND('-') THEN
                          BEGIN
                            PIH.RESET;
                            PIH.SETFILTER(PIH."No.",PIL."Document No.");
                            IF PIH.FINDFIRST THEN
                            BEGIN
                              IF PIH."Currency Code"='' THEN
                              BEGIN
                                TOTAL1 -= ItemLedgEntry.Quantity*(PIL."Amount To Vendor"/PIL.Quantity);
                                Stock_At_Stores-=ItemLedgEntry.Quantity;
                                temp:=1;
                              END ELSE
                              BEGIN
                                SOD.RESET;
                                SOD.SETFILTER(SOD.Type,'Purchase');
                                SOD.SETFILTER(SOD."Document Type",'Invoice');
                                SOD.SETFILTER(SOD."Document No.",PIL."Document No.");
                                SOD.SETFILTER(SOD."Line No.",'%1',PIL."Line No.");
                                IF SOD.FINDFIRST THEN
                                REPEAT
                                  IF SOD."Tax/Charge Type"=SOD."Tax/Charge Type"::GST THEN
                                    Structure_Amount+=SOD."Calculation Value"
                                  ELSE
                                    Structure_Amount+=SOD."Amount (LCY)";
                                UNTIL SOD.NEXT=0;
                                TOTAL1 -= ItemLedgEntry.Quantity*((PIL."Unit Cost (LCY)")+(Structure_Amount/PIL.Quantity));
                                Stock_At_Stores-=ItemLedgEntry.Quantity;
                                temp:=1;
                              END;
                            END;
                          END
                          ELSE
                          BEGIN
                            PRH.RESET;
                            PRH.SETFILTER(PRH."No.",ItemLedgEntry."Document No.");
                            IF PRH.FIND('-') THEN
                            BEGIN
                              "Purchase line".RESET;
                              "Purchase line".SETFILTER("Purchase line"."Document No.",PRH."Order No.");
                              "Purchase line".SETFILTER("Purchase line"."No.",ILE."Item No.");
                              IF "Purchase line".FIND('-') THEN
                              BEGIN
                                TOTAL1 -= ItemLedgEntry.Quantity*("Purchase line"."Unit Cost (LCY)");
                                Stock_At_Stores-=ItemLedgEntry.Quantity;
                                temp:=1;
                              END;
                            END;
                          END;
                          IF temp=0 THEN
                          BEGIN
                            TOTAL1 -=ItemLedgEntry.Quantity*Item."Avg Unit Cost";
                            Stock_At_Stores-=ItemLedgEntry.Quantity;
                          END;
                        END;
                      UNTIL ItemLedgEntry.NEXT =0;
                
                      ItemLedgEntry.RESET;
                      ItemLedgEntry.SETCURRENTKEY(ItemLedgEntry."Item No.",
                                                  ItemLedgEntry."Entry Type",
                                                  ItemLedgEntry."Variant Code",
                                                  ItemLedgEntry."Drop Shipment",
                                                  ItemLedgEntry."Location Code",
                                                  ItemLedgEntry."Posting Date");
                      ItemLedgEntry.SETRANGE(ItemLedgEntry."Entry Type",ItemLedgEntry."Entry Type"::"Positive Adjmt.");
                      ItemLedgEntry.SETRANGE(ItemLedgEntry."Item No.",Item."No.");
                      ItemLedgEntry.SETFILTER(ItemLedgEntry."Location Code",filter);
                      ItemLedgEntry.SETRANGE(ItemLedgEntry."Posting Date",DT2DATE(ToDate),TODAY);
                      /*ItemLedgEntry.CALCSUMS(ItemLedgEntry.Quantity);
                      Stock_At_Stores-=ABS(ItemLedgEntry.Quantity);
                      TOTAL1-=ABS(ItemLedgEntry.Quantity)*Item."Avg Unit Cost";*/
                      IF ItemLedgEntry.FIND('-') THEN
                      REPEAT
                        temp:=0;
                        "LOTNO." := COPYSTR(ItemLedgEntry."Lot No.",1,10);
                        ILE.RESET;
                        ILE.SETRANGE(ILE."Item No.",ItemLedgEntry."Item No.");
                        ILE.SETRANGE(ILE."Serial No.",ItemLedgEntry."Serial No.");
                        ILE.SETRANGE(ILE."Lot No.","LOTNO.");
                        ILE.SETFILTER(ILE."Document Type",'Purchase Receipt');
                        IF ILE.FIND('-') THEN
                        BEGIN
                          PIL.RESET;
                          PIL.SETCURRENTKEY(PIL."Receipt Document No.",PIL."No.");
                          PIL.SETFILTER(PIL."Receipt No.",ILE."Document No.");
                          PIL.SETFILTER(PIL."No.",ILE."Item No.");
                          IF PIL.FIND('-') THEN
                          BEGIN
                            PIH.RESET;
                            PIH.SETFILTER(PIH."No.",PIL."Document No.");
                            IF PIH.FINDFIRST THEN
                            BEGIN
                              IF PIH."Currency Code"='' THEN
                              BEGIN
                                TOTAL1 -= ItemLedgEntry.Quantity*(PIL."Amount To Vendor"/PIL.Quantity);
                                Stock_At_Stores-=ItemLedgEntry.Quantity;
                                temp:=1;
                              END ELSE
                              BEGIN
                                SOD.RESET;
                                SOD.SETFILTER(SOD.Type,'Purchase');
                                SOD.SETFILTER(SOD."Document Type",'Invoice');
                                SOD.SETFILTER(SOD."Document No.",PIL."Document No.");
                                SOD.SETFILTER(SOD."Line No.",'%1',PIL."Line No.");
                                IF SOD.FINDFIRST THEN
                                REPEAT
                                  IF SOD."Tax/Charge Type"=SOD."Tax/Charge Type"::GST THEN
                                     Structure_Amount+=SOD."Calculation Value"
                                  ELSE
                                    Structure_Amount+=SOD."Amount (LCY)";
                                UNTIL SOD.NEXT=0;
                                TOTAL1 -= ItemLedgEntry.Quantity*((PIL."Unit Cost (LCY)")+(Structure_Amount/PIL.Quantity));
                                Stock_At_Stores-=ItemLedgEntry.Quantity;
                                temp:=1;
                              END;
                            END;
                          END
                          ELSE
                          BEGIN
                            PRH.RESET;
                            PRH.SETFILTER(PRH."No.",ILE."Document No.");
                            IF PRH.FIND('-') THEN
                            BEGIN
                              "Purchase line".RESET;
                              "Purchase line".SETFILTER("Purchase line"."Document No.",PRH."Order No.");
                              "Purchase line".SETFILTER("Purchase line"."No.",ILE."Item No.");
                              IF "Purchase line".FIND('-') THEN
                              BEGIN
                                TOTAL1 -= ItemLedgEntry.Quantity*("Purchase line"."Amount To Vendor"/"Purchase line".Quantity);
                                Stock_At_Stores-=ItemLedgEntry.Quantity;
                                temp:=1;
                              END;
                            END;
                          END;
                        END;
                        IF temp=0 THEN
                        BEGIN
                          TOTAL1 -=ItemLedgEntry.Quantity*Item."Avg Unit Cost";
                          Stock_At_Stores-=ItemLedgEntry.Quantity;
                        END;
                      UNTIL ItemLedgEntry.NEXT=0;
                
                
                      ItemLedgEntry.RESET;
                      ItemLedgEntry.SETCURRENTKEY(ItemLedgEntry."Item No.",
                                                  ItemLedgEntry."Entry Type",
                                                  ItemLedgEntry."Variant Code",
                                                  ItemLedgEntry."Drop Shipment",
                                                  ItemLedgEntry."Location Code",
                                                  ItemLedgEntry."Posting Date");
                      ItemLedgEntry.SETRANGE(ItemLedgEntry."Entry Type",ItemLedgEntry."Entry Type"::"Negative Adjmt.");
                      ItemLedgEntry.SETRANGE(ItemLedgEntry."Item No.",Item."No.");
                      ItemLedgEntry.SETFILTER(ItemLedgEntry."Location Code",filter);
                      ItemLedgEntry.SETRANGE(ItemLedgEntry."Posting Date",DT2DATE(ToDate),TODAY);
                      /*ItemLedgEntry.CALCSUMS(ItemLedgEntry.Quantity);
                      Stock_At_Stores+=ABS(ItemLedgEntry.Quantity);
                      TOTAL1+=ABS(ItemLedgEntry.Quantity)*Item."Avg Unit Cost";*/
                      IF ItemLedgEntry.FIND('-') THEN
                      REPEAT
                        temp:=0;
                        "LOTNO." := COPYSTR(ItemLedgEntry."Lot No.",1,10);
                        ILE.RESET;
                        ILE.SETRANGE(ILE."Item No.",ItemLedgEntry."Item No.");
                        ILE.SETRANGE(ILE."Serial No.",ItemLedgEntry."Serial No.");
                        ILE.SETRANGE(ILE."Lot No.","LOTNO.");
                        ILE.SETFILTER(ILE."Document Type",'Purchase Receipt');
                        IF ILE.FIND('-') THEN
                        BEGIN
                          PIL.RESET;
                          PIL.SETCURRENTKEY(PIL."Receipt Document No.",PIL."No.");
                          PIL.SETFILTER(PIL."Receipt No.",ILE."Document No.");
                          PIL.SETFILTER(PIL."No.",ILE."Item No.");
                          IF PIL.FIND('-') THEN
                          BEGIN
                            PIH.RESET;
                            PIH.SETFILTER(PIH."No.",PIL."Document No.");
                            IF PIH.FINDFIRST THEN
                            BEGIN
                              IF PIH."Currency Code"='' THEN
                              BEGIN
                                TOTAL1 += ItemLedgEntry.Quantity*(PIL."Amount To Vendor"/PIL.Quantity);
                                Stock_At_Stores+=ItemLedgEntry.Quantity;
                                temp:=1;
                              END ELSE
                              BEGIN
                                SOD.RESET;
                                SOD.SETFILTER(SOD.Type,'Purchase');
                                SOD.SETFILTER(SOD."Document Type",'Invoice');
                                SOD.SETFILTER(SOD."Document No.",PIL."Document No.");
                                SOD.SETFILTER(SOD."Line No.",'%1',PIL."Line No.");
                                IF SOD.FINDFIRST THEN
                                REPEAT
                                  IF SOD."Tax/Charge Type"=SOD."Tax/Charge Type"::GST THEN
                                     Structure_Amount+=SOD."Calculation Value"
                                  ELSE
                                    Structure_Amount+=SOD."Amount (LCY)";
                                UNTIL SOD.NEXT=0;
                                TOTAL1 += ItemLedgEntry.Quantity*((PIL."Unit Cost (LCY)")+(Structure_Amount/PIL.Quantity));
                                Stock_At_Stores+=ItemLedgEntry.Quantity;
                                temp:=1;
                              END;
                            END;
                          END
                          ELSE
                          BEGIN
                            PRH.RESET;
                            PRH.SETFILTER(PRH."No.",ILE."Document No.");
                            IF PRH.FIND('-') THEN
                            BEGIN
                              "Purchase line".RESET;
                              "Purchase line".SETFILTER("Purchase line"."Document No.",PRH."Order No.");
                              "Purchase line".SETFILTER("Purchase line"."No.",ILE."Item No.");
                              IF "Purchase line".FIND('-') THEN
                              BEGIN
                                TOTAL1 += ItemLedgEntry.Quantity*("Purchase line"."Amount To Vendor"/"Purchase line".Quantity);
                                Stock_At_Stores+=ItemLedgEntry.Quantity;
                                temp:=1;
                              END;
                            END;
                          END;
                        END;
                        IF temp=0 THEN
                        BEGIN
                          TOTAL1 +=ItemLedgEntry.Quantity*Item."Avg Unit Cost";
                          Stock_At_Stores+=ItemLedgEntry.Quantity;
                        END;
                      UNTIL ItemLedgEntry.NEXT=0;
                
                
                    END;
                
                
                
                /*  IF QC AND (DT2DATE(ToDate)=TODAY) THEN
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
                    QualityItemLedgEntry.SETRANGE(QualityItemLedgEntry."Location Code",filter);
                    IF QualityItemLedgEntry.FIND('-') THEN
                    REPEAT
                      ItemLedgEntry.RESET;
                      ItemLedgEntry.SETCURRENTKEY(ItemLedgEntry."Document No.",
                                                  ItemLedgEntry."Item No.",
                                                  ItemLedgEntry."Posting Date");
                      ItemLedgEntry.SETRANGE(ItemLedgEntry."Entry No.",QualityItemLedgEntry."Entry No.");
                      ItemLedgEntry.SETRANGE(ItemLedgEntry."Item No.",QualityItemLedgEntry."Item No.");
                      IF ItemLedgEntry.FINDSET THEN
                      REPEAT
                        "LOTNO." := COPYSTR(ItemLedgEntry."Lot No.",1,10);
                        ILE.RESET;
                        ILE.SETRANGE(ILE."Item No.",ItemLedgEntry."Item No.");
                        ILE.SETRANGE(ILE."Serial No.",ItemLedgEntry."Serial No.");
                        ILE.SETRANGE(ILE."Lot No.","LOTNO.");
                        ILE.SETFILTER(ILE."Document Type",'Purchase Receipt');
                        IF ILE.FIND('-') THEN
                        BEGIN
                          PIL.RESET;
                          PIL.SETCURRENTKEY(PIL."Receipt Document No.",PIL."No.");
                          PIL.SETFILTER(PIL."Receipt No.",ILE."Document No.");
                          PIL.SETFILTER(PIL."No.",ILE."Item No.");
                          IF PIL.FIND('-') THEN
                          BEGIN
                            STR_TOTAL += ItemLedgEntry."Remaining Quantity"*(PIL."Amount To Vendor"/PIL.Quantity);
                            Stock_At_ProdStr+=ItemLedgEntry."Remaining Quantity";
                          END
                          ELSE
                          BEGIN
                            PRH.RESET;
                            PRH.SETFILTER(PRH."No.",ILE."Document No.");
                            IF PRH.FIND('-') THEN
                            BEGIN
                              "Purchase line".RESET;
                              "Purchase line".SETFILTER("Purchase line"."Document No.",PRH."Order No.");
                              "Purchase line".SETFILTER("Purchase line"."No.",ILE."Item No.");
                              IF "Purchase line".FIND('-') THEN
                              BEGIN
                                STR_TOTAL += ItemLedgEntry."Remaining Quantity"*("Purchase line"."Amount To Vendor"/"Purchase line".Quantity);
                                Stock_At_ProdStr+=ItemLedgEntry."Remaining Quantity";
                              END;
                            END;
                          END;
                        END;
                      UNTIL ItemLedgEntry.NEXT=0;
                    UNTIL QualityItemLedgEntry.NEXT=0;
                  END ELSE
                  IF QC AND (FA_To_Date<>TODAY) THEN
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
                    QualityItemLedgEntry.SETRANGE(QualityItemLedgEntry."Location Code",filter);
                    QualityItemLedgEntry.SETFILTER(QualityItemLedgEntry."Posting Date",'<=%1',FA_To_Date);
                    IF QualityItemLedgEntry.FIND('-') THEN
                    REPEAT
                      ItemLedgEntry.RESET;
                      ItemLedgEntry.SETCURRENTKEY(ItemLedgEntry."Document No.",
                                                  ItemLedgEntry."Item No.",
                                                  ItemLedgEntry."Posting Date");
                      ItemLedgEntry.SETRANGE(ItemLedgEntry."Entry No.",QualityItemLedgEntry."Entry No.");
                      ItemLedgEntry.SETRANGE(ItemLedgEntry."Item No.",QualityItemLedgEntry."Item No.");
                      IF ItemLedgEntry.FINDSET THEN
                      REPEAT
                        "LOTNO." := COPYSTR(ItemLedgEntry."Lot No.",1,10);
                        ILE.RESET;
                        ILE.SETRANGE(ILE."Item No.",ItemLedgEntry."Item No.");
                        ILE.SETRANGE(ILE."Serial No.",ItemLedgEntry."Serial No.");
                        ILE.SETRANGE(ILE."Lot No.","LOTNO.");
                        ILE.SETFILTER(ILE."Document Type",'Purchase Receipt');
                        IF ILE.FIND('-') THEN
                        BEGIN
                          PIL.RESET;
                          PIL.SETCURRENTKEY(PIL."Receipt Document No.",PIL."No.");
                          PIL.SETFILTER(PIL."Receipt No.",ILE."Document No.");
                          PIL.SETFILTER(PIL."No.",ILE."Item No.");
                          IF PIL.FIND('-') THEN
                          BEGIN
                            STR_TOTAL += ItemLedgEntry."Remaining Quantity"*(PIL."Amount To Vendor"/PIL.Quantity);
                            Stock_At_ProdStr+=ItemLedgEntry."Remaining Quantity";
                          END
                          ELSE
                          BEGIN
                            PRH.RESET;
                            PRH.SETFILTER(PRH."No.",ILE."Document No.");
                            IF PRH.FIND('-') THEN
                            BEGIN
                              "Purchase line".RESET;
                              "Purchase line".SETFILTER("Purchase line"."Document No.",PRH."Order No.");
                              "Purchase line".SETFILTER("Purchase line"."No.",ILE."Item No.");
                              IF "Purchase line".FIND('-') THEN
                              BEGIN
                                STR_TOTAL += ItemLedgEntry."Remaining Quantity"*("Purchase line"."Amount To Vendor"/"Purchase line".Quantity);
                                Stock_At_ProdStr+=ItemLedgEntry."Remaining Quantity";
                              END;
                            END;
                          END;
                        END;
                      UNTIL ItemLedgEntry.NEXT=0;
                    UNTIL QualityItemLedgEntry.NEXT=0;
                  END;
                  */

            end;

            trigger OnPreDataItem();
            begin
                  filter:=''''+'R&D STR'+''''+'|STR|PRODSTR|CS STR|MCH';
                  MESSAGE(filter);
                  IF excel THEN
                  BEGIN
                    EnterHeadings(1,1,'Item No.',TRUE);
                    EnterHeadings(1,2,'Description',TRUE);
                    EnterHeadings(1,3,'Stock At Stores',TRUE);
                    EnterHeadings(1,4,'Total Cost',TRUE);
                  END;
                  //Item.SETFILTER(Item."No.",'MEBOXCR00128');
                  Row:=1;
            end;
        }
    }

    requestpage
    {

        layout
        {
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
          FA_From_Date:=010407D;
          FA_To_Date:=TODAY;
    end;

    trigger OnPostReport();
    begin
        IF excel THEN
        BEGIN
          TempExcelbuffer.CreateBook('','');//B2B //EFFUPG
          //TempExcelbuffer.CreateSheet('Stock','',COMPANYNAME,'');//B2B
          TempExcelbuffer.GiveUserControl;
        END;
    end;

    trigger OnPreReport();
    begin
           IF excel THEN
           BEGIN
             CLEAR(TempExcelbuffer);
             TempExcelbuffer.DELETEALL;
           END;
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
        TempExcelbuffer : Record "Excel Buffer";
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
        TOTAL1 : Decimal;
        ILE : Record "Item Ledger Entry";
        PIL : Record "Purch. Inv. Line";
        PRH : Record "Purch. Rcpt. Header";
        "LOTNO." : Text[30];
        STR_TOTAL : Decimal;
        PRD_TOTAL : Decimal;
        RD_TOTAL : Decimal;
        CSSTR_TOTAL : Decimal;
        MCH_TOTAL : Decimal;
        Stock_At_MainStr : Decimal;
        Stock_At_ProdStr : Decimal;
        Stock_At_RDStr : Decimal;
        Stock_At_CSStr : Decimal;
        Stock_At_MCH : Decimal;
        PRD_STR : Boolean;
        temp : Integer;
        PIH : Record "Purch. Inv. Header";
        SOD : Record "Structure Order Line Details";
        Structure_Amount : Decimal;
        "filter" : Text[100];
        StockCaptionLbl : Label 'Stock';
        Stock_Valution_OnCaptionLbl : Label 'Stock Valution On';
        Stock_At_StoresCaptionLbl : Label 'Stock At Stores';
        ValueCaptionLbl : Label 'Value';
        Uint_CostCaptionLbl : Label 'Uint Cost';
        UOMCaptionLbl : Label 'UOM';
        Item_VerifiedCaptionLbl : Label 'Item Verified';
        Stock_ValueCaptionLbl : Label 'Stock Value';
        No__Of_ItemsCaptionLbl : Label 'No. Of Items';

    [LineStart(8753)]
    procedure Entercell(RowNo : Integer;ColumnNo : Integer;CellValue : Text[1000];bold : Boolean);
    begin
        TempExcelbuffer.INIT;
        TempExcelbuffer.VALIDATE("Row No.",RowNo);
        TempExcelbuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelbuffer."Cell Value as Text" := CellValue;
        TempExcelbuffer.Bold:=bold ;

        TempExcelbuffer.INSERT;
    end;

    [LineStart(8762)]
    procedure EnterHeadings(RowNo : Integer;ColumnNo : Integer;CellValue : Text[100];Bold : Boolean);
    begin
        TempExcelbuffer.INIT;
        TempExcelbuffer.VALIDATE("Row No.",RowNo);
        TempExcelbuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelbuffer."Cell Value as Text" := FORMAT(CellValue);
        TempExcelbuffer.Bold:=Bold ;

        TempExcelbuffer.Formula := '';
        TempExcelbuffer.INSERT;
    end;

    [LineStart(8772)]
    procedure "Entercell New"();
    begin
    end;

    [LineStart(8775)]
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

