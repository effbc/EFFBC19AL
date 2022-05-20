report 80018 "Resource Journal - Test3"
{
    // version NAVW17.00

    DefaultLayout = RDLC;
    RDLCLayout = './Resource Journal - Test3.rdlc';
    Caption = 'Resource Journal - Test';

    dataset
    {
        dataitem(Item;Item)
        {
            CalcFields = Stock at CS Stores;
            DataItemTableView = SORTING(No.) ORDER(Ascending) WHERE(Safety Stock Qty (CS)=FILTER(>0));
            column(Item_Description;Description)
            {
            }
            column(ROUND__Item__Safety_Stock_Qty__CS___Item__Stock_at_CS_Stores___1_;ROUND((Item."Safety Stock Qty (CS)"-Item."Stock at CS Stores"),1))
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
            column(Item__Safety_Stock_Qty__CS__;"Safety Stock Qty (CS)")
            {
            }
            column(Item__Avg_Unit_Cost_;"Avg Unit Cost")
            {
            }
            column(Avg_Unit_Cost___Item__Safety_Stock_Qty__CS___Item__Stock_at_CS_Stores__;"Avg Unit Cost"*(Item."Safety Stock Qty (CS)"-Item."Stock at CS Stores"))
            {
            }
            column(Item__Base_Unit_of_Measure_;"Base Unit of Measure")
            {
            }
            column(Item__Stock_at_CS_Stores_;"Stock at CS Stores")
            {
            }
            column(Sl__No_;"Sl. No")
            {
            }
            column(Needed_Funds;Needed_Funds)
            {
            }
            column(Shortage_at_CS_StoresCaption;Shortage_at_CS_StoresCaptionLbl)
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
            column(Minimum_QtyCaption;Minimum_QtyCaptionLbl)
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
            column(Stock_QtyCaption;Stock_QtyCaptionLbl)
            {
            }
            column(Sl_No_Caption;Sl_No_CaptionLbl)
            {
            }
            column(Item_No_;"No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                 IF Item."Stock at CS Stores">=Item."Safety Stock Qty (CS)"  THEN
                    CurrReport.SKIP;
                  Indented_Qty:=0;
                  Ordered_Qty:=0;
                Indents:='';
                Orders:='';
                "No_Of Indents":=0;
                No_Of_Orders:=0;
                ExpectedDates:='';

                // code copied from body Section
                 "Indent line".SETCURRENTKEY("Indent line"."No.");
                 "Indent line".SETRANGE("Indent line"."No.",Item."No.");
                 "Indent line".SETFILTER("Indent line"."Indent Status",'INDENT');
                 "Indent line".SETFILTER("Indent line"."Delivery Location",'CS STR');
                 IF "Indent line".FIND('-') THEN
                 REPEAT
                   Indents+="Indent line"."Document No."+',';
                   "No_Of Indents"+=1;
                   Indented_Qty+="Indent line".Quantity;

                 UNTIL "Indent line".NEXT=0;
                   Purcahse_Line.SETCURRENTKEY(Purcahse_Line."No.",Purcahse_Line."Unit Cost (LCY)");
                   Purcahse_Line.SETRANGE(Purcahse_Line."No.",Item."No.");
                   Purcahse_Line.SETRANGE(Purcahse_Line."Location Code",'CS STR');
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


                   Needed_Funds+=(Item."Avg Unit Cost"*(Item."Safety Stock Qty (CS)"-Item."Stock at CS Stores"));
                   "Sl. No"+=1;
                  //code copied from body section
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
        Indents : Text[1000];
        Orders : Text[1000];
        "No_Of Indents" : Integer;
        No_Of_Orders : Integer;
        ExpectedDates : Text[500];
        Needed_Funds : Decimal;
        "Sl. No" : Integer;
        Shortage_at_CS_StoresCaptionLbl : Label 'Shortage at CS Stores';
        Shortage_QTYCaptionLbl : Label 'Shortage QTY';
        Indented_QtyCaptionLbl : Label 'Indented Qty';
        Ordered_QTYCaptionLbl : Label 'Ordered QTY';
        No__Of_IndentsCaptionLbl : Label 'No. Of Indents';
        IndentsCaptionLbl : Label 'Indents';
        OrdersCaptionLbl : Label 'Orders';
        No__Of_OrdersCaptionLbl : Label 'No. Of Orders';
        Expected_DatesCaptionLbl : Label 'Expected Dates';
        Minimum_QtyCaptionLbl : Label 'Minimum Qty';
        Unit_CostCaptionLbl : Label 'Unit Cost';
        Total_CostCaptionLbl : Label 'Total Cost';
        UOMCaptionLbl : Label 'UOM';
        Stock_QtyCaptionLbl : Label 'Stock Qty';
        Sl_No_CaptionLbl : Label 'Sl No.';
}

