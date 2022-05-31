report 50144 "total Orders View1"
{
    // version Rev01,SQL,Eff02

    // //Deleted Var
    // SQLConnectionAutomation'Microsoft ActiveX Data Objects 2.8 Library'.Connection
    // RecordSetAutomation'Microsoft ActiveX Data Objects 2.8 Library'.Recordset
    DefaultLayout = RDLC;
    RDLCLayout = './total Orders View1.rdlc';


    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = SORTING(Document Type, No.) ORDER(Ascending) WHERE(Document Type=FILTER(Order),Order Status=FILTER(<>Temporary Close),Sell-to Customer No.=FILTER(<>CUST00536));
            column(Sales_Header_Document_Type;"Document Type")
            {
            }
            column(Sales_Header_No_;"No.")
            {
            }
            dataitem("Sales Line";"Sales Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = SORTING(Document Type,Document No.,Line No.) ORDER(Ascending);
                column(SH__No__;SH."No.")
                {
                }
                column(P_BOI_AMT;P_BOI_AMT)
                {
                }
                column(Sales_Line_Document_Type;"Document Type")
                {
                }
                column(Sales_Line_Document_No_;"Document No.")
                {
                }
                column(Sales_Line_Line_No_;"Line No.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    invoicedate:='';
                    InvoicedNos:='';
                    InvoicedAmt:=0;
                    InvoicedQty:=0;
                    SIL.SETRANGE(SIL."Order No.","Sales Line"."Document No.");
                    SIL.SETRANGE(SIL."Sell-to Customer No.","Sales Line"."Sell-to Customer No.");
                    SIL.SETRANGE(SIL."No.","Sales Line"."No.");
                    SIL.SETRANGE(SIL."Line No.","Sales Line"."Line No.");
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
                    TOTVALUE:=TOTVALUE+"Sales Line"."Line Amount";
                    TOTQTY:=TOTQTY+"Sales Line".Quantity;
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
                      SH.SETRANGE(SH."No.","Sales Header"."No.");
                      IF SH.FIND('-') THEN
                       BEGIN
                       SL.SETRANGE(SL."Document No.",SH."No.");
                       IF SL.FIND('-') THEN
                       REPEAT
                        IF SL."No."='47300' THEN
                         D_INS_AMU+=SL."Quantity Invoiced"*SL."Unitcost(LOA)";
                        IF (SL."No."='46400') OR (SL."No."='47505')OR(SL."No."='18100') THEN
                         D_SOFT_AMU+=SL."Quantity Invoiced"*SL."Unitcost(LOA)";
                        IF SL."Gen. Prod. Posting Group"='BOI' THEN
                         D_BOI_AMU+=SL."Quantity Invoiced"*SL."Unitcost(LOA)";
                        IF ((SL."Gen. Prod. Posting Group"='BOI') OR (SL."Gen. Prod. Posting Group"='RAW-MAT')) THEN
                         P_BOI_AMT+=SL."Outstanding Quantity"*SL."Unitcost(LOA)";
                        IF SL."No."='47300' THEN
                         P_INS_AMT+=SL."Outstanding Quantity"*SL."Unitcost(LOA)";
                        IF (SL."No."='46400') OR (SL."No."='47505')OR (SL."No."='18100') THEN
                         P_SOFT_AMT+=SL."Outstanding Quantity"*SL."Unitcost(LOA)";
                        IF SL."Qty. Shipped Not Invoiced">0 THEN
                        BEGIN
                         IF ((SL."Gen. Prod. Posting Group"='BOI') OR (SL."Gen. Prod. Posting Group"='RAW-MAT'))THEN
                          P_BOI_AMT+=SL."Qty. Shipped Not Invoiced"*SL."Unitcost(LOA)";
                         IF SL."No."='47300' THEN
                          P_INS_AMT+=SL."Qty. Shipped Not Invoiced"*SL."Unitcost(LOA)";
                         IF (SL."No."='46400') OR(SL."No."='47505')OR(SL."No."='18100')  THEN
                          P_SOFT_AMT+=SL."Qty. Shipped Not Invoiced"*SL."Unitcost(LOA)";
                        END;
                       IF SL."Gen. Prod. Posting Group"='RAW-MAT' THEN
                       itemtype:='BOI'
                       ELSE
                       itemtype:=SL."Gen. Prod. Posting Group";
                      TOT_Invoiced+=SL."Quantity Invoiced"*SL."Unitcost(LOA)";
                            SQLQuery1 := 'insert into ERP_SALES_LINE_AMOUNTS(NO,DESCRIPTION, DOCUMENT_NO,Item_type,UNITCOST_LOA, LINE_AMOUNT_LOA,'+
                            'OUTSTANDING_LOA, QUANTITY, Invoice_Amount,OUTSTANDING_QUANTITY,Line_No,schedule_type,schedule_no'+
                            ' ) values('''+FORMAT(SL."No.")+''','''+CONVERTSTR(SL.Description,'''',' ')+''''+
                            ','''+FORMAT(SL."Document No.")+''','+
                    //        ''''+FORMAT(SL."Gen. Prod. Posting Group")+''','+
                            ''''+itemtype+''','+
                            'NVL(to_number(replace('''+FORMAT(ROUND(SL."Unitcost(LOA)",1))+''','''+','+''','''+''+''')),0),'+
                            'NVL(to_number(replace('''+FORMAT(ROUND(SL."Line Amount(LOA)",1))+''','''+','+''','''+''+''')),0),'+
                            'NVL(to_number(replace('''+FORMAT(ROUND(SL."OutStanding(LOA)",1))+''','''+','+''','''+''+''')),0),'+
                            'NVL(to_number(replace('''+FORMAT(ROUND(SL.Quantity,1))+''','''+','+''','''+''+''')),0),'+
                            'NVL(to_number(replace('''+FORMAT(ROUND(SL."Quantity Invoiced"*SL."Unitcost(LOA)",1))+''','''+','+''','''+''+''')),0),'+
                            'NVL(to_number(replace('''+FORMAT(ROUND(SL."Outstanding Quantity",1))+''','''+','+''','''+''+''')),0),'+
                            'NVL(to_number(replace('''+FORMAT(ROUND(SL."Line No.",1))+''','''+','+''','''+''+''')),0),'+
                            ''''+FORMAT(SL."Schedule Type")+''','+
                            'NVL(to_number(replace('''+FORMAT(ROUND(SL."Schedule No",1))+''','''+','+''','''+''+''')),0))';

                    //        MESSAGE(SQLQuery1);
                          SQLConnection.Execute(SQLQuery1);
                      UNTIL SL.NEXT=0;
                    D_MANU_AMU:=TOT_Invoiced-(D_INS_AMU+D_BOI_AMU+D_SOFT_AMU);
                        SH.CALCFIELDS(SH."Installation Amount",SH."Bought out Items Amount",SH."Software Amount",SH."Pending(LOA)Value");
                        SH.CALCFIELDS(SH."Total Order(LOA)Value");
                        P_MANU_AMT:=SH."Pending(LOA)Value"-(P_BOI_AMT+P_SOFT_AMT+P_INS_AMT);
                        Man_amount:=SH."Total Order(LOA)Value"-(SH."Software Amount"+SH."Bought out Items Amount"+SH."Installation Amount");

                       IF SH."Order Released Date"=0D THEN
                      // ordreldate:=SH."Order Date"     commented by sundar
                         ordreldate:=TODAY
                       ELSE
                       ordreldate:=SH."Order Released Date";
                            SQLQuery := 'insert into ERP_SALES_HEADER_AMTS( NO, SELL_TO_CUSTOMER_NAME, CUSTOMER_ORDERNO, SALE_ORDER_TOTAL_AMOUNT,'+
                            'SALESPERSON_CODE, EXPIRATION_DATE,CUSTOMER_EXPECTING_DATE, TOTAL_ORDER_LOA_VALUE, PENDING_LOA_VALUE,'+
                            'MANUFACTURING_ITEM_AMOUNT,TOTAL_INST_AMOUNT,SOFT_AMOUNT,PENDING_BOI_AMOUNT,PENDING_INS_AMOUNT,PENDING_MANU_AMOUNT,'+
                            'PENDING_SOFT_AMOUNT,DISP_MANU_AMU,DISP_SOFT_AMU,DISP_INS_AMU,DISP_BOI_AMU, Work_Description,'+
                            'TOT_DISP_AMT,CUST_TYPE,PRODUCT,BOUGHT_OUT_ITEMS_AMOUNT)values('''+FORMAT(SH."No.")+''','+
                            ''''+FORMAT(SH."Sell-to Customer Name")+''','''+FORMAT(SH."Customer OrderNo.")+''','+
                            ' '+commaeli(FORMAT(ROUND(SH."Sale Order Total Amount",1)))+','+
                            ''''+FORMAT(SH."Salesperson Code")+''','+
                         //   ''''+FORMAT(ordreldate,0,'<Day>-<Month Text,3>-<Year4>')+''','+
                            ''''+FORMAT(SH."Order Date",0,'<Day>-<Month Text,3>-<Year4>')+''','+
                            ''''+FORMAT(SH."Promised Delivery Date",0,'<Day>-<Month Text,3>-<Year4>')+''','+
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
                            ''''+FORMAT(SH."Work Order Number")+''','+
                            ' '+commaeli(FORMAT(ROUND(TOT_Invoiced,1)))+','+
                            ''''+FORMAT(SH."Customer Posting Group")+''','+
                            ''''+FORMAT(SH.Product)+''','+
                            ' '+commaeli(FORMAT(ROUND(SH."Bought out Items Amount",1)))+')';
                    //       IF SH."No."='EFF/SAL/07-08/076' THEN
                    //       MESSAGE(FORMAT(P_BOI_AMT));

                           SQLConnection.Execute(SQLQuery);
                           SQLConnection.CommitTrans;
                           SQLConnection.BeginTrans;
                      END ELSE
                      BEGIN
                      I:=I+1;
                      END;
                      END;
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
                /* // sqlconnection2;
                    PT.SETRANGE(PT.Code,"Sales Header"."Payment Terms Code");
                  IF PT.FIND('-') THEN
                  PTcode:=FORMAT(PT."Due Date Calculation");
                  SQLQuery:='Insert into mrp_erp_payment_terms(Sale_order_no,payment_term,order_value)'+
                        ' values('''+FORMAT("Sales Header"."No.")+''','''+FORMAT(PTcode)+''' '+
                        ','''+commaeli(FORMAT(ROUND("Sales Header"."Sale Order Total Amount",1)))+''')';
                //    MESSAGE(SQLQuery);
                  SQLConnection.Execute(SQLQuery);
                 SQLQuery:='';                      */

            end;

            trigger OnPreDataItem();
            begin
                
                IF datadump THEN
                BEGIN
                sqlconnection1;
                deletequery:='DELETE FROM  ERP_SALES_HEADER_AMTS' ;
                SQLConnection.Execute(deletequery);
                deletequery:='DELETE FROM ERP_SALES_LINE_AMOUNTS' ;
                SQLConnection.Execute(deletequery);
                /*sqlconnection2;
                deletequery:='DELETE FROM  mrp_erp_payment_terms' ;
                SQLConnection.Execute(deletequery);*/
                END;

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
                    field(datadump;datadump)
                    {
                        Caption = 'Data Dump';
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
        ordreldate : Date;
        PT : Record "Payment Terms";
        PTcode : Text[30];
        itemtype : Text[50];
        "--rev01" : Integer;
        SQLConnection : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000514-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Connection";
        RecordSet : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000535-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Recordset";

    [LineStart(7445)]
    procedure sqlconnection1();
    begin

        IF ISCLEAR(SQLConnection) THEN
          CREATE(SQLConnection,FALSE,TRUE);//Rev01

        IF ISCLEAR(RecordSet) THEN
          CREATE(RecordSet,FALSE,TRUE);//Rev01


        IF connectionopen<>1 THEN
        BEGIN
          SQLConnection.ConnectionString :='DSN=omserp;UID=omsuser;PASSWORD=management;SERVER=oracle_80;';//Rev01
          SQLConnection.Open;
          SQLConnection.BeginTrans;
          connectionopen:=1;
        //  MESSAGE('OMS Connected');
        END;
    end;

    [LineStart(7463)]
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

    [LineStart(7471)]
    procedure sqlconnection2();
    begin
        /*
        IF ISCLEAR(SQLConnection) THEN
          CREATE(SQLConnection);
        
        IF ISCLEAR(RecordSet) THEN
          CREATE(RecordSet);
        
        IF connectionopen<>1 THEN
        BEGIN
          SQLConnection.ConnectionString :='DSN=cashflowuser;UID=cashflowuser;PASSWORD=firewall123;SERVER=oracle_80;';//Rev01
          SQLConnection.Open;
          SQLConnection.BeginTrans;
          connectionopen:=1;
        //  MESSAGE('OMS Connected');
        END;
        */

    end;

    //event RecordSet(cFields : Integer;"Fields" : Variant;adStatus : Integer;pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset");
    //begin
        /*
        */
    //end;

    //event RecordSet(cFields : Integer;"Fields" : Variant;pError : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000500-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Error";adStatus : Integer;pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset");
    //begin
        /*
        */
    //end;

    //event RecordSet(adReason : Integer;cRecords : Integer;adStatus : Integer;pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset");
    //begin
        /*
        */
    //end;

    //event RecordSet(adReason : Integer;cRecords : Integer;pError : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000500-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Error";adStatus : Integer;pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset");
    //begin
        /*
        */
    //end;

    //event RecordSet(adReason : Integer;adStatus : Integer;pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset");
    //begin
        /*
        */
    //end;

    //event RecordSet(adReason : Integer;pError : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000500-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Error";adStatus : Integer;pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset");
    //begin
        /*
        */
    //end;

    //event RecordSet(adReason : Integer;adStatus : Integer;pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset");
    //begin
        /*
        */
    //end;

    //event RecordSet(adReason : Integer;pError : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000500-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Error";adStatus : Integer;pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset");
    //begin
        /*
        */
    //end;

    //event RecordSet(var fMoreData : Boolean;adStatus : Integer;pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset");
    //begin
        /*
        */
    //end;

    //event RecordSet(Progress : Integer;MaxProgress : Integer;adStatus : Integer;pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset");
    //begin
        /*
        */
    //end;

    //event RecordSet(pError : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000500-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Error";adStatus : Integer;pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset");
    //begin
        /*
        */
    //end;

    //event SQLConnection(pError : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000500-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Error";adStatus : Integer;pConnection : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000550-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Connection");
    //begin
        /*
        */
    //end;

    //event SQLConnection(TransactionLevel : Integer;pError : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000500-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Error";adStatus : Integer;pConnection : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000550-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Connection");
    //begin
        /*
        */
    //end;

    //event SQLConnection(pError : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000500-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Error";adStatus : Integer;pConnection : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000550-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Connection");
    //begin
        /*
        */
    //end;

    //event SQLConnection(pError : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000500-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Error";adStatus : Integer;pConnection : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000550-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Connection");
    //begin
        /*
        */
    //end;

    //event SQLConnection(var Source : Text;CursorType : Integer;LockType : Integer;var Options : Integer;adStatus : Integer;pCommand : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{B08400BD-F9D1-4D02-B856-71D5DBA123E9}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Command";pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset";pConnection : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000550-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Connection");
    //begin
        /*
        */
    //end;

    //event SQLConnection(RecordsAffected : Integer;pError : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000500-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Error";adStatus : Integer;pCommand : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{B08400BD-F9D1-4D02-B856-71D5DBA123E9}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Command";pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset";pConnection : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000550-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Connection");
    //begin
        /*
        */
    //end;

    //event SQLConnection(var ConnectionString : Text;var UserID : Text;var Password : Text;var Options : Integer;adStatus : Integer;pConnection : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000550-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Connection");
    //begin
        /*
        */
    //end;

    //event SQLConnection(pError : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000500-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Error";adStatus : Integer;pConnection : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000550-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Connection");
    //begin
        /*
        */
    //end;

    //event SQLConnection(adStatus : Integer;pConnection : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000550-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Connection");
    //begin
        /*
        */
    //end;
}

