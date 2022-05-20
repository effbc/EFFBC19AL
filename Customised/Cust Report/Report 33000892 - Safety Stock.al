report 33000892 "Safety Stock"
{
    // version NAVW13.00,Rev01,Eff02

    DefaultLayout = RDLC;
    RDLCLayout = './Safety Stock.rdlc';
    Caption = 'Resource Journal - Test';

    dataset
    {
        dataitem(Item;Item)
        {
            CalcFields = Stock at CS Stores;
            DataItemTableView = SORTING(No.) ORDER(Ascending) WHERE(Safety Stock Quantity=FILTER(>0));
            RequestFilterFields = "No.";
            column(Item_Description;Description)
            {
            }
            column(ROUND__Item__Safety_Stock_Quantity___Item__Stock_at_Stores__Item__Stock_at_PROD_Stores____1_;ROUND((Item."Safety Stock Quantity"-(Item."Stock at Stores"+Item."Stock at PROD Stores")),1))
            {
            }
            column(Ordered_Qty;Ordered_Qty)
            {
            }
            column(Indented_Qty;Indented_Qty)
            {
            }
            column(No_Of_Indents_;"No_Of Indents")
            {
            }
            column(Indents;Indents)
            {
            }
            column(Orders;Orders)
            {
            }
            column(No_Of_Orders;No_Of_Orders)
            {
            }
            column(ExpectedDates;ExpectedDates)
            {
            }
            column(Item__Avg_Unit_Cost_;"Avg Unit Cost")
            {
            }
            column(Avg_Unit_Cost___Item__Safety_Stock_Quantity___Item__Stock_at_Stores__Item__Stock_at_PROD_Stores___;"Avg Unit Cost"*(Item."Safety Stock Quantity"-(Item."Stock at Stores"+Item."Stock at PROD Stores")))
            {
            }
            column(Item__Base_Unit_of_Measure_;"Base Unit of Measure")
            {
            }
            column(Sl__No_;"Sl. No")
            {
            }
            column(Item__Safety_Stock_Quantity_;"Safety Stock Quantity")
            {
            }
            column(Stock_at_Stores__Item__Stock_at_PROD_Stores_;"Stock at Stores"+Item."Stock at PROD Stores")
            {
            }
            column(Needed_Funds;Needed_Funds)
            {
            }
            column(Shortage_at_Main_StoresCaption;Shortage_at_Main_StoresCaptionLbl)
            {
            }
            column(Item_DescriptionCaption;FIELDCAPTION(Description))
            {
            }
            column(Shortage_QTYCaption;Shortage_QTYCaptionLbl)
            {
            }
            column(Indented_QtyCaption;Indented_QtyCaptionLbl)
            {
            }
            column(Ordered_QTYCaption;Ordered_QTYCaptionLbl)
            {
            }
            column(No__Of_IndentsCaption;No__Of_IndentsCaptionLbl)
            {
            }
            column(IndentsCaption;IndentsCaptionLbl)
            {
            }
            column(OrdersCaption;OrdersCaptionLbl)
            {
            }
            column(No__Of_OrdersCaption;No__Of_OrdersCaptionLbl)
            {
            }
            column(Expected_DatesCaption;Expected_DatesCaptionLbl)
            {
            }
            column(Unit_CostCaption;Unit_CostCaptionLbl)
            {
            }
            column(Total_CostCaption;Total_CostCaptionLbl)
            {
            }
            column(UOMCaption;UOMCaptionLbl)
            {
            }
            column(Sl_No_Caption;Sl_No_CaptionLbl)
            {
            }
            column(Minimum_StockCaption;Minimum_StockCaptionLbl)
            {
            }
            column(STR_STOCKCaption;STR_STOCKCaptionLbl)
            {
            }
            column(Item_No_;"No.")
            {
            }
            column(Stock_at_PROD_Stores;"Stock at PROD Stores")
            {
            }

            trigger OnAfterGetRecord();
            begin
                 Item.CALCFIELDS(Item."Stock at PROD Stores");
                 IF (Item."Stock at Stores"+Item."Stock at PROD Stores")>=Item."Safety Stock Quantity"  THEN
                    CurrReport.SKIP;
                Indented_Qty:=0;
                Ordered_Qty:=0;
                Indents:='';
                Orders:='';
                "No_Of Indents":=0;
                No_Of_Orders:=0;
                ExpectedDates:='';


                //Rev01 Copied from //Item, Body (3) - OnPreSection()
                 BEGIN
                 "Indent line".SETCURRENTKEY("Indent line"."No.");
                 "Indent line".SETRANGE("Indent line"."No.",Item."No.");
                 "Indent line".SETFILTER("Indent line"."Indent Status",'INDENT');
                 "Indent line".SETFILTER("Indent line"."Delivery Location",'STR');
                 IF "Indent line".FIND('-') THEN
                 REPEAT
                   Indents+="Indent line"."Document No."+',';
                   "No_Of Indents"+=1;
                   Indented_Qty+="Indent line".Quantity;

                 UNTIL "Indent line".NEXT=0;
                   Purcahse_Line.SETCURRENTKEY(Purcahse_Line."No.",Purcahse_Line."Unit Cost (LCY)");
                   Purcahse_Line.SETRANGE(Purcahse_Line."No.",Item."No.");
                   Purcahse_Line.SETRANGE(Purcahse_Line."Location Code",'STR');
                   Purcahse_Line.SETFILTER(Purcahse_Line."Qty. to Receive",'>%1',0);
                   IF Purcahse_Line.FIND('-') THEN
                   REPEAT
                     Ordered_Qty+=Purcahse_Line.Quantity;
                     Orders+=Purcahse_Line."Document No."+',';
                     No_Of_Orders+=1;
                     IF Purcahse_Line."Deviated Receipt Date">0D THEN
                       ExpectedDates+=FORMAT(Purcahse_Line."Deviated Receipt Date")+','
                     ELSE
                       ExpectedDates+=FORMAT(Purcahse_Line."Expected Receipt Date")+',';
                   UNTIL Purcahse_Line.NEXT=0;
                   Needed_Funds+=(Item."Avg Unit Cost"*(Item."Safety Stock Quantity"-(Item."Stock at Stores"+Item."Stock at PROD Stores")));
                   "Sl. No"+=1;
                 END;
                //Rev01 Copied from //Item, Body (3) - OnPreSection()
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

    var
        Indented_Qty : Decimal;
        Ordered_Qty : Decimal;
        "Indent line" : Record "Indent Line";
        Purcahse_Line : Record "Purchase Line";
        Indents : Text[1024];
        Orders : Text[1024];
        "No_Of Indents" : Integer;
        No_Of_Orders : Integer;
        ExpectedDates : Text[500];
        Needed_Funds : Decimal;
        "Sl. No" : Integer;
        Shortage_at_Main_StoresCaptionLbl : Label 'Shortage at Main Stores';
        Shortage_QTYCaptionLbl : Label 'Shortage QTY';
        Indented_QtyCaptionLbl : Label 'Indented Qty';
        Ordered_QTYCaptionLbl : Label 'Ordered QTY';
        No__Of_IndentsCaptionLbl : Label 'No. Of Indents';
        IndentsCaptionLbl : Label 'Indents';
        OrdersCaptionLbl : Label 'Orders';
        No__Of_OrdersCaptionLbl : Label 'No. Of Orders';
        Expected_DatesCaptionLbl : Label 'Expected Dates';
        Unit_CostCaptionLbl : Label 'Unit Cost';
        Total_CostCaptionLbl : Label 'Total Cost';
        UOMCaptionLbl : Label 'UOM';
        Sl_No_CaptionLbl : Label 'Sl No.';
        Minimum_StockCaptionLbl : Label 'Minimum Stock';
        STR_STOCKCaptionLbl : Label 'STR STOCK';
}

