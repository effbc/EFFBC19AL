report 50143 "Total Orders View"
{
    // //Deleted Var(SQLConnectionAutomation'Microsoft ActiveX Data Objects 2.8 Library'.Connection),(RecordSetAutomation'Microsoft ActiveX Data Objects 2.8 Library'.Recordset)
    DefaultLayout = RDLC;
    RDLCLayout = './Total Orders View.rdlc';


    dataset
    {
        dataitem("Sales Header Archive"; "Sales Header Archive")
        {
            RequestFilterFields = "No.";
            column(Sell_to_Customer_Name________________Customer_OrderNo_______No; "Sell-to Customer Name" + '          ' + "Customer OrderNo." + ' ' + No)
            {
            }
            column(Sell_to_Customer_Name________________Customer_OrderNo_________No; "Sell-to Customer Name" + '          ' + "Customer OrderNo." + '   ' + No)
            {
            }
            column(Item_No_Caption; Item_No_CaptionLbl)
            {
            }
            column(DescriptionCaption; DescriptionCaptionLbl)
            {
            }
            column(QuantityCaption; QuantityCaptionLbl)
            {
            }
            column(Unit_PriceCaption; Unit_PriceCaptionLbl)
            {
            }
            column(Line_AmountCaption; Line_AmountCaptionLbl)
            {
            }
            column(Invoiced_QtyCaption; Invoiced_QtyCaptionLbl)
            {
            }
            column(Invoiced_DatesCaption; Invoiced_DatesCaptionLbl)
            {
            }
            column(Invoiced_NosCaption; Invoiced_NosCaptionLbl)
            {
            }
            column(Total_Invoiced_AmountCaption; Total_Invoiced_AmountCaptionLbl)
            {
            }
            column(As_Per_LOACaption; As_Per_LOACaptionLbl)
            {
            }
            column(As_Per_OUR_BILLINGCaption; As_Per_OUR_BILLINGCaptionLbl)
            {
            }
            column(Item_No_Caption_Control1102154113; Item_No_Caption_Control1102154113Lbl)
            {
            }
            column(DescriptionCaption_Control1102154114; DescriptionCaption_Control1102154114Lbl)
            {
            }
            column(QuantityCaption_Control1102154116; QuantityCaption_Control1102154116Lbl)
            {
            }
            column(Unit_PriceCaption_Control1102154118; Unit_PriceCaption_Control1102154118Lbl)
            {
            }
            column(Line_AmountCaption_Control1102154120; Line_AmountCaption_Control1102154120Lbl)
            {
            }
            column(Invoiced_QtyCaption_Control1102154121; Invoiced_QtyCaption_Control1102154121Lbl)
            {
            }
            column(Invoiced_DatesCaption_Control1102154122; Invoiced_DatesCaption_Control1102154122Lbl)
            {
            }
            column(Invoiced_NosCaption_Control1102154123; Invoiced_NosCaption_Control1102154123Lbl)
            {
            }
            column(Total_Invoiced_AmountCaption_Control1102154124; Total_Invoiced_AmountCaption_Control1102154124Lbl)
            {
            }
            column(As_Per_LOACaption_Control1102154125; As_Per_LOACaption_Control1102154125Lbl)
            {
            }
            column(As_Per_OUR_BILLINGCaption_Control1102154126; As_Per_OUR_BILLINGCaption_Control1102154126Lbl)
            {
            }
            column(Sales_Header_Archive_Document_Type; "Document Type")
            {
            }
            column(Sales_Header_Archive_No_; "No.")
            {
            }
            column(Sales_Header_Archive_Doc__No__Occurrence; "Doc. No. Occurrence")
            {
            }
            column(Sales_Header_Archive_Version_No_; "Version No.")
            {
            }
            dataitem("Sales Line Archive"; "Sales Line Archive")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = SORTING(Document Type, Document No., Doc. No. Occurrence, Version No., Line No.) ORDER(Ascending) WHERE(Unit Price=FILTER(>0),Version No.=FILTER(1));
                column(Sales_Line_Archive__No__;"No.")
                {
                }
                column(Sales_Line_Archive_Description;Description)
                {
                }
                column(Sales_Line_Archive_Quantity;Quantity)
                {
                }
                column(Sales_Line_Archive__Unit_Price_;"Unit Price")
                {
                }
                column(ROUND__Line_Amount__1_;ROUND("Line Amount",1))
                {
                }
                column(InvoicedQty;InvoicedQty)
                {
                }
                column(ROUND_InvoicedAmt_1_;ROUND(InvoicedAmt,1))
                {
                }
                column(invoicedate;invoicedate)
                {
                }
                column(InvoicedNos;InvoicedNos)
                {
                }
                column(ROUND_TOTVALUE_1_;ROUND(TOTVALUE,1))
                {
                }
                column(ROUND_TOTINVAMT_1_;ROUND(TOTINVAMT,1))
                {
                }
                column(ROUND_ABS_RECEVIEDAMT_1___1_;ROUND(ABS(RECEVIEDAMT[1]),1))
                {
                }
                column(ROUND_ABS_RECEVIEDAMT_2___1_;ROUND(ABS(RECEVIEDAMT[2]),1))
                {
                }
                column(ROUND_ABS_RECEVIEDAMT_3___1_;ROUND(ABS(RECEVIEDAMT[3]),1))
                {
                }
                column(ROUND_ABS_RECEVIEDAMT_4___1_;ROUND(ABS(RECEVIEDAMT[4]),1))
                {
                }
                column(ROUND_pendingamt_1_;ROUND(pendingamt,1))
                {
                }
                column(TOTALSCaption;TOTALSCaptionLbl)
                {
                }
                column(PAID_BY_FIRST_BILLCaption;PAID_BY_FIRST_BILLCaptionLbl)
                {
                }
                column(PAID_BY_SECOND_BILLCaption;PAID_BY_SECOND_BILLCaptionLbl)
                {
                }
                column(PAID_BY_THIRD_BILLCaption;PAID_BY_THIRD_BILLCaptionLbl)
                {
                }
                column(PAID_BY_FINAL_BILLCaption;PAID_BY_FINAL_BILLCaptionLbl)
                {
                }
                column(TO_BE_BILLEDCaption;TO_BE_BILLEDCaptionLbl)
                {
                }
                column(Sales_Line_Archive_Document_Type;"Document Type")
                {
                }
                column(Sales_Line_Archive_Document_No_;"Document No.")
                {
                }
                column(Sales_Line_Archive_Doc__No__Occurrence;"Doc. No. Occurrence")
                {
                }
                column(Sales_Line_Archive_Version_No_;"Version No.")
                {
                }
                column(Sales_Line_Archive_Line_No_;"Line No.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    invoicedate:='';
                    InvoicedNos:='';
                    InvoicedAmt:=0;
                    InvoicedQty:=0;
                    SIL.SETRANGE(SIL."Order No.","Sales Line Archive"."Document No.");
                    SIL.SETRANGE(SIL."Sell-to Customer No.","Sales Line Archive"."Sell-to Customer No.");
                    SIL.SETRANGE(SIL."No.","Sales Line Archive"."No.");
                    SIL.SETRANGE(SIL."Line No.","Sales Line Archive"."Line No.");
                    IF SIL.FIND('-') THEN
                    REPEAT
                    IF SIL."Amount To Customer">0 THEN
                    BEGIN
                    /*IF SIL."No."='47300' THEN
                    D_INS_AMU+=SIL."Amount To Customer";
                    IF SIL."No."='46400' THEN
                    D_SOFT_AMU+=SIL."Amount To Customer";
                    IF SIL."Gen. Prod. Posting Group"='BOI' THEN
                    D_BOI_AMU+=SIL."Amount To Customer";  */
                    InvoicedQty:=InvoicedQty+SIL.Quantity;
                    InvoicedAmt:=InvoicedAmt+SIL."Amount To Customer";
                    SIL.CALCFIELDS(SIL."Document Date");
                    invoicedate:=invoicedate+' '+FORMAT(SIL."Document Date");
                    InvoicedNos:=InvoicedNos+' '+FORMAT(SIL."External Document No.");
                    END;
                    UNTIL SIL.NEXT=0;
                    TOTINVAMT:=TOTINVAMT+InvoicedAmt;
                    TOTVALUE:=TOTVALUE+"Sales Line Archive"."Line Amount";
                    TOTQTY:=TOTQTY+"Sales Line Archive".Quantity;
                    //D_MANU_AMU:=TOTINVAMT-(D_INS_AMU+D_BOI_AMU+D_SOFT_AMU);
                    SIL.CALCFIELDS(SIL."Document Date");

                end;

                trigger OnPostDataItem();
                begin
                      P_BOI_AMT:=0;
                      P_SOFT_AMT:=0;
                      P_INS_AMT:=0;
                      P_MANU_AMT:=0;
                      D_INS_AMU:=0;
                      D_SOFT_AMU:=0;
                      D_BOI_AMU:=0;
                      D_MANU_AMU:=0;
                      TOT_Invoiced:=0;
                      IF datadump THEN
                      BEGIN
                      SH.RESET;
                      SH.SETRANGE(SH."No.","Sales Header Archive"."No.");
                      SH.SETFILTER(SH."Document Type",'Order');
                      IF SH.FIND('-') THEN
                      BEGIN
                      SL.SETRANGE(SL."Document No.",SH."No.");
                      IF SL.FIND('-') THEN
                      REPEAT
                      IF SL."No."='47300' THEN
                      D_INS_AMU+=SL."Quantity Invoiced"*SL."Unitcost(LOA)";
                      IF SL."No."='46400' THEN
                      D_SOFT_AMU+=SL."Quantity Invoiced"*SL."Unitcost(LOA)";
                      IF SL."Gen. Prod. Posting Group"='BOI' THEN
                      D_BOI_AMU+=SL."Quantity Invoiced"*SL."Unitcost(LOA)";
                      IF SL."Gen. Prod. Posting Group"='BOI' THEN
                      P_BOI_AMT+=SL."Outstanding Quantity"*SL."Unitcost(LOA)";
                      IF SL."No."='47300' THEN
                      P_INS_AMT+=SL."Outstanding Quantity"*SL."Unitcost(LOA)";
                      IF SL."No."='46400' THEN
                      P_SOFT_AMT+=SL."Outstanding Quantity"*SL."Unitcost(LOA)";
                      IF SL."Qty. Shipped Not Invoiced">0 THEN
                      BEGIN
                      IF SL."Gen. Prod. Posting Group"='BOI' THEN
                      P_BOI_AMT+=SL."Qty. Shipped Not Invoiced"*SL."Unitcost(LOA)";
                      IF SL."No."='47300' THEN
                      P_INS_AMT+=SL."Qty. Shipped Not Invoiced"*SL."Unitcost(LOA)";
                      IF SL."No."='46400' THEN
                      P_SOFT_AMT+=SL."Qty. Shipped Not Invoiced"*SL."Unitcost(LOA)";
                      END;
                      TOT_Invoiced+=SL."Quantity Invoiced"*SL."Unitcost(LOA)";
                            SQLQuery1 := 'insert into ERP_SALES_LINE_AMOUNTS(NO, DESCRIPTION, DOCUMENT_NO, UNITCOST_LOA, LINE_AMOUNT_LOA,'+
                            'OUTSTANDING_LOA, QUANTITY, OUTSTANDING_QUANTITY '+
                            ' ) values('''+FORMAT(SL."No.")+''','''+CONVERTSTR(SL.Description,'''',' ')+''''+
                            ','''+FORMAT(SL."Document No.")+''','+
                            'NVL(to_number(replace('''+FORMAT(ROUND(SL."Unitcost(LOA)",1))+''','''+','+''','''+''+''')),0),'+
                            'NVL(to_number(replace('''+FORMAT(ROUND(SL."Line Amount(LOA)",1))+''','''+','+''','''+''+''')),0),'+
                            'NVL(to_number(replace('''+FORMAT(ROUND(SL."OutStanding(LOA)",1))+''','''+','+''','''+''+''')),0),'+
                            'NVL(to_number(replace('''+FORMAT(ROUND(SL.Quantity,1))+''','''+','+''','''+''+''')),0),'+
                            'NVL(to_number(replace('''+FORMAT(ROUND(SL."Outstanding Quantity",1))+''','''+','+''','''+''+''')),0))';
                    //       MESSAGE(SQLQuery);
                          //SQLConnection.Execute(SQLQuery1);//B2B
                      UNTIL SL.NEXT=0;
                    D_MANU_AMU:=TOT_Invoiced-(D_INS_AMU+D_BOI_AMU+D_SOFT_AMU);
                        SH.CALCFIELDS(SH."Installation Amount",SH."Bought out Items Amount",SH."Software Amount",SH."Pending(LOA)Value");
                        SH.CALCFIELDS(SH."Total Order(LOA)Value");
                        P_MANU_AMT:=SH."Pending(LOA)Value"-(P_BOI_AMT+P_SOFT_AMT+P_INS_AMT);
                        Man_amount:=SH."Total Order(LOA)Value"-(SH."Software Amount"+SH."Bought out Items Amount"+SH."Installation Amount");
                            SQLQuery := 'insert into ERP_SALES_HEADER_AMTS( NO, SELL_TO_CUSTOMER_NAME, CUSTOMER_ORDERNO, SALE_ORDER_TOTAL_AMOUNT,'+
                            'SALESPERSON_CODE, EXPIRATION_DATE, TOTAL_ORDER_LOA_VALUE, PENDING_LOA_VALUE, MANUFACTURING_ITEM_AMOUNT,'+
                            'TOTAL_INST_AMOUNT,SOFT_AMOUNT,PENDING_BOI_AMOUNT,PENDING_INS_AMOUNT,PENDING_MANU_AMOUNT,'+
                            'PENDING_SOFT_AMOUNT,DISP_MANU_AMU,DISP_SOFT_AMU,DISP_INS_AMU,DISP_BOI_AMU,'+
                            'TOT_DISP_AMT,CUST_TYPE,BOUGHT_OUT_ITEMS_AMOUNT)values('''+FORMAT(SH."No.")+''','+
                            ''''+FORMAT(SH."Sell-to Customer Name")+''','''+FORMAT(SH."Customer OrderNo.")+''','+
                            ' '+commaeli(FORMAT(ROUND(SH."Sale Order Total Amount",1)))+','+
                            ''''+FORMAT(SH."Salesperson Code")+''','+
                            ''''+FORMAT(SH."Order Released Date",0,'<Day>-<Month Text,3>-<Year4>')+''','+
                            ' '+commaeli(FORMAT(ROUND(SH."Total Order(LOA)Value",1)))+','+
                            ' '+commaeli(FORMAT(ROUND(SH."Pending(LOA)Value",1)))+','+
                            ' '+commaeli(FORMAT(ROUND(Man_amount,1)))+','+
                            ' '+commaeli(FORMAT(ROUND(SH."Installation Amount",1)))+','+
                            ' '+commaeli(FORMAT(ROUND(SH."Software Amount",1)))+','+
                            ' '+commaeli(FORMAT(ROUND(P_BOI_AMT,1)))+','+
                            ' '+commaeli(FORMAT(ROUND(P_INS_AMT,1)))+','+
                            ' '+commaeli(FORMAT(ROUND(P_MANU_AMT,1)))+','+
                            ' '+commaeli(FORMAT(ROUND(P_SOFT_AMT,1)))+','+
                            ' '+commaeli(FORMAT(ROUND(D_MANU_AMU,1)))+','+
                            ' '+commaeli(FORMAT(ROUND(D_SOFT_AMU,1)))+','+
                            ' '+commaeli(FORMAT(ROUND(D_INS_AMU,1)))+','+
                            ' '+commaeli(FORMAT(ROUND(D_BOI_AMU,1)))+','+
                            ' '+commaeli(FORMAT(ROUND(TOT_Invoiced,1)))+','+
                            ''''+FORMAT(SH."Customer Posting Group")+''','+
                            ' '+commaeli(FORMAT(ROUND(SH."Bought out Items Amount",1)))+')';
                      //      MESSAGE(SQLQuery);
                           /*
                           SQLConnection.Execute(SQLQuery);
                           SQLConnection.CommitTrans;
                           SQLConnection.BeginTrans;
                           *///B2B
                      END ELSE
                      BEGIN
                      I:=I+1;
                      END;
                      END;
                       //    MESSAGE('Data Posted');

                end;

                trigger OnPreDataItem();
                begin
                    TOTINVAMT:=0;
                    TOTVALUE:=0;
                    D_INS_AMU:=0;
                    D_BOI_AMU:=0;
                    D_SOFT_AMU:=0;
                    D_MANU_AMU:=0;
                end;
            }

            trigger OnAfterGetRecord();
            begin
                RECEVIEDAMT[1]:=0;
                RECEVIEDAMT[2]:=0;
                RECEVIEDAMT[3]:=0;
                RECEVIEDAMT[4]:=0;
                RECEVIEDAMT[5]:=0;
                I:=1;
                No:=COPYSTR("Sales Header Archive"."No.",9,10);
                CLE.SETRANGE(CLE."Customer No.","Sales Header Archive"."Sell-to Customer No.");
                CLE.SETRANGE(CLE."Sale Order no","Sales Header Archive"."No.");
                IF CLE.FIND('-') THEN
                REPEAT
                CLE.CALCFIELDS(CLE.Amount);
                RECEVIEDAMT[I]:=RECEVIEDAMT[I]+CLE.Amount;
                UNTIL CLE.NEXT=0;
                I:=I+1;
            end;

            trigger OnPreDataItem();
            begin
                IF datadump THEN
                BEGIN
                sqlconnection1;
                deletequery:='DELETE FROM  ERP_SALES_HEADER_AMTS' ;
                //SQLConnection.Execute(deletequery);//B2B
                deletequery:='DELETE FROM ERP_SALES_LINE_AMOUNTS' ;
                //SQLConnection.Execute(deletequery);//B2B
                END;
                //"Sales Header Archive".SETFILTER("Sales Header Archive"."No.",'EFF/SAL/08-09/*|EFF/SAL/09-10/*');
                "Sales Header Archive".SETFILTER("Sales Header Archive"."Version No.",'1');
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
        SIH : Record "Sales Invoice Header";
        SIL : Record "Sales Invoice Line";
        InvoicedQty : Decimal;
        InvoicedAmt : Decimal;
        CLE : Record "Cust. Ledger Entry";
        RECEVIEDAMT : array [10] of Decimal;
        I : Integer;
        TOTINVAMT : Decimal;
        TOTVALUE : Decimal;
        TOTQTY : Decimal;
        PENDINGQTY : Decimal;
        pendingamt : Decimal;
        invoicedate : Text[1000];
        InvoicedNos : Text[1000];
        No : Text[10];
        SQLQuery : Text[1000];
        connectionopen : Integer;
        deletequery : Text[1000];
        SH : Record "Sales Header";
        datadump : Boolean;
        SL : Record "Sales Line";
        P_BOI_AMT : Decimal;
        P_SOFT_AMT : Decimal;
        P_INS_AMT : Decimal;
        P_MANU_AMT : Decimal;
        D_INS_AMU : Decimal;
        D_BOI_AMU : Decimal;
        D_SOFT_AMU : Decimal;
        D_MANU_AMU : Decimal;
        Man_amount : Decimal;
        SQLQuery1 : Text[1000];
        TOT_Invoiced : Decimal;
        Item_No_CaptionLbl : Label 'Item No.';
        DescriptionCaptionLbl : Label 'Description';
        QuantityCaptionLbl : Label 'Quantity';
        Unit_PriceCaptionLbl : Label 'Unit Price';
        Line_AmountCaptionLbl : Label 'Line Amount';
        Invoiced_QtyCaptionLbl : Label 'Invoiced Qty';
        Invoiced_DatesCaptionLbl : Label 'Invoiced Dates';
        Invoiced_NosCaptionLbl : Label 'Invoiced Nos';
        Total_Invoiced_AmountCaptionLbl : Label 'Total Invoiced Amount';
        As_Per_LOACaptionLbl : Label 'As Per LOA';
        As_Per_OUR_BILLINGCaptionLbl : Label 'As Per OUR BILLING';
        Item_No_Caption_Control1102154113Lbl : Label 'Item No.';
        DescriptionCaption_Control1102154114Lbl : Label 'Description';
        QuantityCaption_Control1102154116Lbl : Label 'Quantity';
        Unit_PriceCaption_Control1102154118Lbl : Label 'Unit Price';
        Line_AmountCaption_Control1102154120Lbl : Label 'Line Amount';
        Invoiced_QtyCaption_Control1102154121Lbl : Label 'Invoiced Qty';
        Invoiced_DatesCaption_Control1102154122Lbl : Label 'Invoiced Dates';
        Invoiced_NosCaption_Control1102154123Lbl : Label 'Invoiced Nos';
        Total_Invoiced_AmountCaption_Control1102154124Lbl : Label 'Total Invoiced Amount';
        As_Per_LOACaption_Control1102154125Lbl : Label 'As Per LOA';
        As_Per_OUR_BILLINGCaption_Control1102154126Lbl : Label 'As Per OUR BILLING';
        TOTALSCaptionLbl : Label 'TOTALS';
        PAID_BY_FIRST_BILLCaptionLbl : Label 'PAID BY FIRST BILL';
        PAID_BY_SECOND_BILLCaptionLbl : Label 'PAID BY SECOND BILL';
        PAID_BY_THIRD_BILLCaptionLbl : Label 'PAID BY THIRD BILL';
        PAID_BY_FINAL_BILLCaptionLbl : Label 'PAID BY FINAL BILL';
        TO_BE_BILLEDCaptionLbl : Label 'TO BE BILLED';

    [LineStart(7419)]
    procedure sqlconnection1();
    begin
        /*
        IF ISCLEAR(SQLConnection) THEN
          CREATE(SQLConnection);
        
        IF ISCLEAR(RecordSet) THEN
          CREATE(RecordSet);
        
        IF connectionopen<>1 THEN
        BEGIN
          SQLConnection.ConnectionString :='DSN=oms;UID=omsuser;PASSWORD=management;SERVER=oracle_80;';
          SQLConnection.Open;
          SQLConnection.BeginTrans;
          connectionopen:=1;
        //  MESSAGE('OMS Connected');
        END;
        *///B2B

    end;

    [LineStart(7437)]
    procedure commaeli(Base : Text[30]) converted : Text[30];
    var
        i : Integer;
    begin
         FOR i:=1 TO STRLEN(Base) DO
         BEGIN
           IF COPYSTR(Base,i,1)<>',' THEN
             converted+=COPYSTR(Base,i,1);
         END;
         EXIT(converted);
    end;
}

