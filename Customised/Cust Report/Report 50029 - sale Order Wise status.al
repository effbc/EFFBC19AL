report 50029 "sale Order Wise status"
{
    // version ESPL 1.0

    DefaultLayout = RDLC;
    RDLCLayout = './sale Order Wise status.rdlc';

    dataset
    {
        dataitem("Sales Header";"Sales Header")
        {
            DataItemTableView = WHERE(Document Type=CONST(Order),No.=FILTER(EFF/SAL/08-09/*));
            RequestFilterFields = "No.","Order Date";
            column(FORMAT_TODAY_0_4_;FORMAT(TODAY,0,4))
            {
            }
            column(Sales_Header_userid1;userid1)
            {
            }
            column(COMPANYNAME;COMPANYNAME)
            {
            }
            column(COMPANYNAME_Control1000000040;COMPANYNAME)
            {
            }
            column(FORMAT_TODAY_0_4__Control1000000041;FORMAT(TODAY,0,4))
            {
            }
            column(Sales_Header_userid1_Control1000000042;userid1)
            {
            }
            column(TOT_ORDER;TOT_ORDER)
            {
            }
            column(TOT_PEND_ORDER;TOT_PEND_ORDER)
            {
            }
            column(TOT_CMP_ORDER;TOT_CMP_ORDER)
            {
            }
            column(TOT_WIP_ORDER;TOT_WIP_ORDER)
            {
            }
            column(TOT_ORDERS_AMT;TOT_ORDERS_AMT)
            {
            }
            column(TOT_PEND;TOT_PEND)
            {
            }
            column(TOT_COMP;TOT_COMP)
            {
            }
            column(TOT_WIP;TOT_WIP)
            {
            }
            column(ORDER_WISE__STATUS__REPORTCaption;ORDER_WISE__STATUS__REPORTCaptionLbl)
            {
            }
            column(ORDER_WISE_STATUS_SUMMARY_REPORTCaption;ORDER_WISE_STATUS_SUMMARY_REPORTCaptionLbl)
            {
            }
            column(Total_Sale_ordersCaption;Total_Sale_ordersCaptionLbl)
            {
            }
            column(Not_Yet_StartedCaption;Not_Yet_StartedCaptionLbl)
            {
            }
            column(Completed_ordersCaption;Completed_ordersCaptionLbl)
            {
            }
            column(Work_In_Progress___Pending_OrdersCaption;Work_In_Progress___Pending_OrdersCaptionLbl)
            {
            }
            column(ValueCaption;ValueCaptionLbl)
            {
            }
            column(ValueCaption_Control1000000038;ValueCaption_Control1000000038Lbl)
            {
            }
            column(ValueCaption_Control1000000043;ValueCaption_Control1000000043Lbl)
            {
            }
            column(ValueCaption_Control1000000044;ValueCaption_Control1000000044Lbl)
            {
            }
            column(Sales_Header_Document_Type;"Document Type")
            {
            }
            column(Sales_Header_No_;"No.")
            {
            }
            dataitem("Sales Line";"Sales Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = SORTING(Document Type,Document No.,Line No.) ORDER(Ascending) WHERE(Document Type=CONST(Order),Type=CONST(Item),No.=FILTER(<>''));
                column(Sales_Line__Sales_Line___Document_No__;"Sales Line"."Document No.")
                {
                }
                column(Sales_Header___Sell_to_Customer_Name_;"Sales Header"."Sell-to Customer Name")
                {
                }
                column(Sales_Header___Customer_OrderNo__;"Sales Header"."Customer OrderNo.")
                {
                }
                column(Sales_Header___Total_Order_Amount_;"Sales Header"."Total Order Amount")
                {
                }
                column(sale_Order_Count_;"sale Order Count")
                {
                }
                column(Sales_Line_Description;Description)
                {
                }
                column(Sales_Line_Quantity;Quantity)
                {
                }
                column(Dispatched;Dispatched)
                {
                }
                column(WIP_Line__;"WIP(Line)")
                {
                }
                column(PENDING_Line__;"PENDING(Line)")
                {
                }
                column(Sales_Line__No__;"No.")
                {
                }
                column(Order_No_Caption;Order_No_CaptionLbl)
                {
                }
                column(Cust_NameCaption;Cust_NameCaptionLbl)
                {
                }
                column(Item_NoCaption;Item_NoCaptionLbl)
                {
                }
                column(DescriptionCaption;DescriptionCaptionLbl)
                {
                }
                column(QuantityCaption;QuantityCaptionLbl)
                {
                }
                column(WIPCaption;WIPCaptionLbl)
                {
                }
                column(PendingCaption;PendingCaptionLbl)
                {
                }
                column(DispatchCaption;DispatchCaptionLbl)
                {
                }
                column(EmptyStringCaption;EmptyStringCaptionLbl)
                {
                }
                column(EmptyStringCaption_Control1102154018;EmptyStringCaption_Control1102154018Lbl)
                {
                }
                column(Customer_Order_No_Caption;Customer_Order_No_CaptionLbl)
                {
                }
                column(Order_ValueCaption;Order_ValueCaptionLbl)
                {
                }
                column(EmptyStringCaption_Control1102154000;EmptyStringCaption_Control1102154000Lbl)
                {
                }
                column(EmptyStringCaption_Control1102154001;EmptyStringCaption_Control1102154001Lbl)
                {
                }
                column(Sales_Line_Document_Type;"Document Type")
                {
                }
                column(Sales_Line_Line_No_;"Line No.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    "WIP(Line)":=0;
                    "PENDING(Line)":=0;
                end;

                trigger OnPreDataItem();
                begin
                         IF Choice=Choice::PENDING  THEN
                         "Sales Line".SETFILTER("Sales Line"."Qty. to Ship",'>%1',0);
                end;
            }

            trigger OnAfterGetRecord();
            begin
                TOT_ORDER+=1;
                MPBI_QT:=0;
                MPBI_QTINV:=0;
                BOI_QT:=0;
                BOI_QTSHP:=0;
                completed:=FALSE;
                partialshipped:=FALSE;
                pending:=FALSE;
                "Sales Header".CALCFIELDS("Sales Header"."Total Order Amount");
                TOT_ORDERS_AMT+="Sales Header"."Total Order Amount";
                SL.SETRANGE(SL."Document Type",SL."Document Type"::Order);
                SL.SETRANGE(SL.Type,SL.Type::Item);
                SL.SETRANGE(SL."Document No.","Sales Header"."No.");
                IF SL.FIND('-') THEN
                REPEAT
                 IF SL."Tax Group Code"='MPBI' THEN
                 BEGIN
                  MPBI_QT+=SL.Quantity;
                  MPBI_QTINV+=SL."Quantity Invoiced";
                 END ELSE
                 BEGIN
                  BOI_QT+=SL.Quantity;
                  BOI_QTSHP+=SL."Quantity Shipped";
                 END;
                UNTIL SL.NEXT=0;
                IF (MPBI_QT=MPBI_QTINV) AND (BOI_QT=BOI_QTSHP) AND (MPBI_QT>0) THEN BEGIN
                completed:=TRUE;
                TOT_CMP_ORDER+=1;
                TOT_COMP+="Sales Header"."Total Order Amount";
                END ELSE IF (MPBI_QTINV=0) AND (BOI_QTSHP=0 ) THEN BEGIN
                PROD_ORDER.SETRANGE(PROD_ORDER."Sales Order No.","Sales Header"."No.");
                //PROD_ORDER.SETRANGE(PROD_ORDER."Source No.",."No.");
                IF PROD_ORDER.COUNT>0 THEN BEGIN
                partialshipped:=TRUE;
                TOT_WIP_ORDER+=1;
                TOT_WIP+="Sales Header"."Total Order Amount";
                END ELSE BEGIN
                pending:=TRUE;
                TOT_PEND_ORDER+=1;
                TOT_PEND+="Sales Header"."Total Order Amount";
                END;
                END ELSE BEGIN
                partialshipped:=TRUE;
                TOT_WIP_ORDER+=1;
                TOT_WIP+="Sales Header"."Total Order Amount";
                END;
            end;

            trigger OnPreDataItem();
            begin
                 TOT_ORDERS_AMT:=0;
                //"Sales Header".SETFILTER("Sales Header"."No.",EFF/SAL/08-09/*);
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

    trigger OnPreReport();
    begin
        "Sales Header".SETRANGE("Sales Header"."No.",'EFF/SAL/08-09*');
    end;

    var
        noofprodorder : Decimal;
        pending : Boolean;
        TOT_ORDER : Decimal;
        TOT_PEND_ORDER : Decimal;
        TOT_WIP_ORDER : Decimal;
        TOT_CMP_ORDER : Decimal;
        completed : Boolean;
        partialshipped : Boolean;
        Dispatched : Decimal;
        text2 : Text[30];
        ono : Text[30];
        text3 : Text[50];
        cnt1 : Integer;
        date1 : Date;
        date2 : Date;
        Dispatch : Decimal;
        TOT_PEND : Decimal;
        TOT_COMP : Decimal;
        TOT_WIP : Decimal;
        TOT_ORDERS_AMT : Decimal;
        Choice : Option BRIEF,PENDING,COMPLETED;
        PROD_ORDER : Record "Production Order";
        "WIP(Line)" : Integer;
        "PENDING(Line)" : Decimal;
        SL : Record "Sales Line";
        MPBI_QT : Decimal;
        MPBI_QTINV : Decimal;
        BOI_QT : Decimal;
        BOI_QTSHP : Decimal;
        SaleInvHeader : Record "Sales Invoice Header";
        SH : Record "Sales Header";
        CLE : Record "Cust. Ledger Entry";
        "sale Order Count" : Integer;
        ORDER_WISE__STATUS__REPORTCaptionLbl : Label 'ORDER WISE  STATUS  REPORT';
        ORDER_WISE_STATUS_SUMMARY_REPORTCaptionLbl : Label 'ORDER WISE STATUS SUMMARY REPORT';
        Total_Sale_ordersCaptionLbl : Label 'Total Sale orders';
        Not_Yet_StartedCaptionLbl : Label 'Not Yet Started';
        Completed_ordersCaptionLbl : Label '" Completed orders"';
        Work_In_Progress___Pending_OrdersCaptionLbl : Label 'Work In Progress / Pending Orders';
        ValueCaptionLbl : Label 'Value';
        ValueCaption_Control1000000038Lbl : Label 'Value';
        ValueCaption_Control1000000043Lbl : Label 'Value';
        ValueCaption_Control1000000044Lbl : Label 'Value';
        Order_No_CaptionLbl : Label 'Order No.';
        Cust_NameCaptionLbl : Label 'Cust Name';
        Item_NoCaptionLbl : Label 'Item No';
        DescriptionCaptionLbl : Label 'Description';
        QuantityCaptionLbl : Label 'Quantity';
        WIPCaptionLbl : Label 'WIP';
        PendingCaptionLbl : Label 'Pending';
        DispatchCaptionLbl : Label 'Dispatch';
        EmptyStringCaptionLbl : Label ':';
        EmptyStringCaption_Control1102154018Lbl : Label ':';
        Customer_Order_No_CaptionLbl : Label 'Customer Order No.';
        Order_ValueCaptionLbl : Label 'Order Value';
        EmptyStringCaption_Control1102154000Lbl : Label ':';
        EmptyStringCaption_Control1102154001Lbl : Label ':';
}

