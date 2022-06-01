report 59000 Cashflow
{
    DefaultLayout = RDLC;
    RDLCLayout = './Cashflow.rdlc';

    dataset
    {
        dataitem("G/L Entry"; "G/L Entry")
        {
            RequestFilterFields = "Document No.", "System Date";
            dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
            {
                DataItemLink = Document No.=FIELD(Document No.);
                DataItemTableView = SORTING(Document No., Line No.) ORDER(Ascending) WHERE(Quantity = FILTER(> 0));

                trigger OnAfterGetRecord();
                begin
                    /*RowCount:=0;
                    "G\L".GET;
                    IF "G\L"."Active ERP-CF Connection" THEN
                    BEGIN
                      IF ISCLEAR(SQLConnection) THEN
                        CREATE(SQLConnection);
                    
                      IF ISCLEAR(RecordSet) THEN
                        CREATE(RecordSet);
                    
                      IF ConnectionOpen <> 1 THEN
                      BEGIN
                        SQLConnection.ConnectionString:="G\L"."Sql Connection String";
                        SQLConnection.Open;
                        ConnectionOpen:=1;
                        SQLConnection.BeginTrans;
                      END;
                    
                    
                      SQLQuery:='Select * from Invoice_line where invoice_number='''+ "Purch. Inv. Line"."Document No."+'''and invoice_line_no='+
                                ''''+FORMAT("Purch. Inv. Line"."Line No.")+'''';
                      RecordSet:=SQLConnection.Execute(SQLQuery,RowCount);
                      IF NOT( (RecordSet.BOF) OR (RecordSet.EOF) ) THEN
                         RecordSet.MoveFirst;
                      WHILE NOT RecordSet.EOF DO
                      BEGIN
                        RowCount:=RowCount+1;
                        RecordSet.MoveNext;
                      END;
                    
                      IF RowCount=-1 THEN
                      BEGIN
                        PIH.RESET;
                        PIH.SETFILTER(PIH."No.","Purch. Inv. Line"."Document No.");
                        IF PIH.FINDFIRST THEN
                        BEGIN
                    
                        END;
                        Structure_Amount:=0;
                        Packing_Value:=0;
                        Frieght_Value:=0;
                        Insurance_Value:=0;
                        Additional_Duty:=0;
                        VAT_AMOUNT:=0;
                        CST_AMOUNT:=0;
                        Packing_Value:=0;
                        Frieght_Value:=0;
                        Insurance_Value:=0;
                        Additional_Duty:=0;
                        Service_Amount:=0;
                    
                        PurchRcptLine.RESET;
                        PurchRcptLine.SETRANGE(PurchRcptLine."Document No.","Purch. Inv. Line"."Receipt Document No.");
                        PurchRcptLine.SETRANGE(PurchRcptLine."Line No.","Purch. Inv. Line"."Receipt Document Line No.");
                        IF PurchRcptLine.FINDFIRST THEN
                        BEGIN
                          Order_No:=PurchRcptLine."Order No.";
                          OrderLineNo:=PurchRcptLine."Order Line No.";
                        END;
                    
                        StrOrdLineDetails.RESET;
                        StrOrdLineDetails.SETRANGE(StrOrdLineDetails.Type,StrOrdLineDetails.Type::Purchase);
                        StrOrdLineDetails.SETRANGE(StrOrdLineDetails."Document Type",StrOrdLineDetails."Document Type"::Invoice);
                        StrOrdLineDetails.SETRANGE(StrOrdLineDetails."Document No.","Purch. Inv. Line"."Document No.");
                        StrOrdLineDetails.SETRANGE(StrOrdLineDetails."Line No.","Purch. Inv. Line"."Line No.");
                        IF StrOrdLineDetails.FINDSET THEN
                        REPEAT
                    
                          IF StrOrdLineDetails."Tax/Charge Type"=StrOrdLineDetails."Tax/Charge Type"::Dummy THEN
                             Structure_Amount+=StrOrdLineDetails."Calculation Value"
                          ELSE
                          BEGIN
                            IF (StrOrdLineDetails."Tax/Charge Group"='PACKING')  OR
                               (StrOrdLineDetails."Tax/Charge Group"='FORWARDING') THEN
                            BEGIN
                    
                              IF NOT StrOrdLineDetails."Payable to Third Party" THEN
                                Packing_Value+=StrOrdLineDetails."Amount (LCY)"
                              ELSE
                              BEGIN
                                SQLQuery :='Insert into INVOICE_LINE (INVOICE_ID,ORDERNO,ITEMNO,VENDORID,INVOICE_LINE_NO,'+
                                           ' RECEIPT_NUMBER,PACKING_VALUE, '+
                                           ' INVOICE_NUMBER,RECEIPT_LINE_NO,INVOICED_DATE,ORDER_LINE_NO,BILLNO) '+
                                           ' VALUES (seq_Invoice_ID.NEXTVAL,'''+Order_No+''','''+"Purch. Inv. Line"."No."+''','''
                                           +StrOrdLineDetails."Third Party Code"+''','''
                                           +FORMAT("Purch. Inv. Line"."Line No.")+''','''
                                           +"Purch. Inv. Line"."Receipt Document No."+''','''+
                                           CommaRemoval(FORMAT(ROUND(StrOrdLineDetails."Amount (LCY)",0.01)))+''','''+
                                           "Purch. Inv. Line"."Document No."+''','''+
                                           FORMAT("Purch. Inv. Line"."Receipt Document Line No.")+''','''+
                                           FORMAT(PIH."Vendor Invoice Date",0,'<Day>-<Month Text,3>-<Year4>')+''','''+
                                           FORMAT(PurchRcptLine."Order Line No.")+''','''+
                                           FORMAT(PIH."Vendor Invoice No.")+''')';
                    
                                SQLConnection.Execute(SQLQuery);
                              END;
                            END
                            ELSE IF StrOrdLineDetails."Tax/Charge Group"='FREIGHT' THEN
                            BEGIN
                              IF NOT StrOrdLineDetails."Payable to Third Party" THEN
                                 Frieght_Value+=StrOrdLineDetails."Amount (LCY)"
                              ELSE BEGIN
                                SQLQuery :='Insert into INVOICE_LINE (INVOICE_ID,ORDERNO,ITEMNO,VENDORID,INVOICE_LINE_NO,'+
                                           ' RECEIPT_NUMBER,FREIGHT_CHARGES, '+
                                           ' INVOICE_NUMBER,RECEIPT_LINE_NO,INVOICED_DATE,ORDER_LINE_NO,BILLNO) '+
                                           ' VALUES (seq_Invoice_ID.NEXTVAL,'''+Order_No+''','''+"Purch. Inv. Line"."No."+''','''
                                           +StrOrdLineDetails."Third Party Code"+''','''
                                           +FORMAT("Purch. Inv. Line"."Line No.")+''','''
                                           +"Purch. Inv. Line"."Receipt Document No."+''','''+
                                           CommaRemoval(FORMAT(ROUND(StrOrdLineDetails."Amount (LCY)",0.01)))+''','''+
                                           "Purch. Inv. Line"."Document No."+''','''+
                                           FORMAT("Purch. Inv. Line"."Receipt Document Line No.")+''','''+
                                           FORMAT(PIH."Vendor Invoice Date",0,'<Day>-<Month Text,3>-<Year4>')+''','''+
                                           FORMAT(PurchRcptLine."Order Line No.")+''','''+
                                           FORMAT(PIH."Vendor Invoice No.")+''')';
                    
                                SQLConnection.Execute(SQLQuery);
                              END;
                            END
                            ELSE IF StrOrdLineDetails."Tax/Charge Group"='INSURANCE' THEN
                            BEGIN
                              IF NOT StrOrdLineDetails."Payable to Third Party" THEN
                                Insurance_Value+=StrOrdLineDetails."Amount (LCY)";
                            END ELSE
                            IF StrOrdLineDetails."Tax/Charge Group"='ADD.DUTY' THEN
                               Additional_Duty+=StrOrdLineDetails."Amount (LCY)"
                            ELSE IF (StrOrdLineDetails."Tax/Charge Group"='SERVICE') OR
                                    (StrOrdLineDetails."Tax/Charge Code"='SERVICETAX') OR
                                    (FORMAT(StrOrderDetails."Tax/Charge Type")='Service Tax') THEN
                            BEGIN
                              IF  NOT StrOrdLineDetails."Payable to Third Party" THEN
                                Service_Amount+=StrOrdLineDetails."Amount (LCY)"
                              ELSE
                              BEGIN
                                SQLQuery :='Insert into INVOICE_LINE (INVOICE_ID,ORDERNO,ITEMNO,VENDORID,INVOICE_LINE_NO,'+
                                           ' RECEIPT_NUMBER,SERVICE_AMOUNT, '+
                                           ' INVOICE_NUMBER,RECEIPT_LINE_NO,INVOICED_DATE,ORDER_LINE_NO,BILLNO) '+
                                           ' VALUES (seq_Invoice_ID.NEXTVAL,'''+Order_No+''','''+"Purch. Inv. Line"."No."+''','''
                                           +StrOrdLineDetails."Third Party Code"+''','''
                                           +FORMAT("Purch. Inv. Line"."Line No.")+''','''
                                           +"Purch. Inv. Line"."Receipt Document No."+''','''+
                                           CommaRemoval(FORMAT(ROUND(StrOrdLineDetails."Amount (LCY)",0.01)))+''','''+
                                           "Purch. Inv. Line"."Document No."+''','''+
                                           FORMAT("Purch. Inv. Line"."Receipt Document Line No.")+''','''+
                                           FORMAT(PIH."Vendor Invoice Date",0,'<Day>-<Month Text,3>-<Year4>')+''','''+
                                           FORMAT(PurchRcptLine."Order Line No.")+''','''+
                                           FORMAT(PIH."Vendor Invoice No.")+''')';
                    
                                SQLConnection.Execute(SQLQuery);
                    
                              END;
                            END ELSE IF FORMAT(StrOrderDetails."Tax/Charge Type")='E.CESS'  THEN
                            BEGIN
                              IF  StrOrdLineDetails."Payable to Third Party" THEN
                              BEGIN
                                SQLQuery :='Insert into INVOICE_LINE (INVOICE_ID,ORDERNO,ITEMNO,VENDORID,INVOICE_LINE_NO,'+
                                           ' RECEIPT_NUMBER,EXCISE, '+
                                           ' INVOICE_NUMBER,RECEIPT_LINE_NO,INVOICED_DATE,ORDER_LINE_NO,BILLNO) '+
                                           ' VALUES (seq_Invoice_ID.NEXTVAL,'''+Order_No+''','''+"Purch. Inv. Line"."No."+''','''
                                           +StrOrdLineDetails."Third Party Code"+''','''
                                           +FORMAT("Purch. Inv. Line"."Line No.")+''','''
                                           +"Purch. Inv. Line"."Receipt Document No."+''','''+
                                           CommaRemoval(FORMAT(ROUND(StrOrdLineDetails."Amount (LCY)",0.01)))+''','''+
                                           "Purch. Inv. Line"."Document No."+''','''+
                                           FORMAT("Purch. Inv. Line"."Receipt Document Line No.")+''','''+
                                           FORMAT(PIH."Vendor Invoice Date",0,'<Day>-<Month Text,3>-<Year4>')+''','''+
                                           FORMAT(PurchRcptLine."Order Line No.")+''','''+
                                           FORMAT(PIH."Vendor Invoice No.")+''')';
                    
                                SQLConnection.Execute(SQLQuery);
                    
                              END;
                            END ELSE
                            IF  (FORMAT(StrOrderDetails."Tax/Charge Code")='EXCISE' ) AND
                                 (StrOrdLineDetails."Payable to Third Party")  THEN
                            BEGIN
                              SQLQuery :='Insert into INVOICE_LINE (INVOICE_ID,ORDERNO,ITEMNO,VENDORID,INVOICE_LINE_NO,'+
                                         ' RECEIPT_NUMBER,EXCISE, '+
                                         ' INVOICE_NUMBER,RECEIPT_LINE_NO,INVOICED_DATE,ORDER_LINE_NO,BILLNO) '+
                                         ' VALUES (seq_Invoice_ID.NEXTVAL,'''+Order_No+''','''+"Purch. Inv. Line"."No."+''','''
                                          +StrOrdLineDetails."Third Party Code"+''','''
                                           +FORMAT("Purch. Inv. Line"."Line No.")+''','''
                                           +"Purch. Inv. Line"."Receipt Document No."+''','''+
                                           CommaRemoval(FORMAT(ROUND(StrOrdLineDetails."Amount (LCY)",0.01)))+''','''+
                                           "Purch. Inv. Line"."Document No."+''','''+
                                           FORMAT("Purch. Inv. Line"."Receipt Document Line No.")+''','''+
                                           FORMAT(PIH."Vendor Invoice Date",0,'<Day>-<Month Text,3>-<Year4>')+''','''+
                                           FORMAT(PurchRcptLine."Order Line No.")+''','''+
                                           FORMAT(PIH."Vendor Invoice No.")+''')';
                                SQLConnection.Execute(SQLQuery);
                            END;
                            Structure_Amount+=StrOrdLineDetails."Amount (LCY)";
                          END;
                    
                        UNTIL StrOrdLineDetails.NEXT=0;
                    
                        IF "Purch. Inv. Line"."No."<>'' THEN
                        BEGIN
                          IF "Purch. Inv. Line"."Tax Area Code"='PURCH VAT' THEN
                             VAT_AMOUNT:="Purch. Inv. Line"."Tax Amount"
                          ELSE
                             CST_AMOUNT:="Purch. Inv. Line"."Tax Amount";
                    
                          IF "Purch. Inv. Line"."Location Code"='CS STR' THEN
                             Dept:='CS'
                          ELSE
                             Dept:='NORMAL';
                    
                        {IF PIH.Structure<>'FORIEGN'  THEN
                        BEGIN
                          IF ABS(ROUND("Purch. Inv. Line"."Amount To Vendor",0.01)-(("Purch. Inv. Line".Quantity* "Purch. Inv. Line"."Unit Cost (LCY)")
                                                                                   +ROUND(VAT_AMOUNT,0.01)
                                                                                   +ROUND("Purch. Inv. Line"."Excise Amount",0.01)
                                                                                   +ROUND(CST_AMOUNT,0.01)
                                                                                   +ROUND(Packing_Value,0.01)
                                                                                   +ROUND(Frieght_Value,0.01)
                                                                                   +ROUND(Insurance_Value,0.01)
                                                                                   +ROUND(Additional_Duty,0.01)
                                                                                   +ROUND(Service_Amount,0.01))) >5 THEN
                            ERROR('PLEASE CONTACT ERP TEAM');
                        END;}
                    
                    
                              SQLQuery :='Insert into INVOICE_LINE (INVOICE_ID,ORDERNO,ITEMNO,VENDORID,INVOICE_LINE_NO,MATERIAL_VALUE,'+
                                      'RECEIPT_NUMBER,INVOICED_AMOUNT,VAT,EXCISE,CST,PACKING_VALUE,INSURANCE,FREIGHT_CHARGES,ADD_DUTY,BILLED_UNITS, '+
                                     ' SERVICE_AMOUNT,INVOICE_NUMBER,RECEIPT_LINE_NO,INVOICED_DATE,ORDER_LINE_NO,BILLNO,DEPT_WISE) '+
                                     ' VALUES (seq_Invoice_ID.NEXTVAL,'''+Order_No+''','''+"Purch. Inv. Line"."No."+''','''
                                      +"Purch. Inv. Line"."Buy-from Vendor No."+''','''
                                      +FORMAT("Purch. Inv. Line"."Line No.")+''','''
                                      +CommaRemoval(FORMAT("Purch. Inv. Line".Quantity* "Purch. Inv. Line"."Unit Cost (LCY)"))+''','''
                                      +"Purch. Inv. Line"."Receipt No."+''','''+
                                      CommaRemoval(FORMAT(ROUND("Purch. Inv. Line"."Amount To Vendor",0.01)))+''','''+
                                      CommaRemoval(FORMAT(ROUND(VAT_AMOUNT,0.01)))+''','''+//b2bcommented for merging purpose
                                      CommaRemoval(FORMAT(ROUND("Purch. Inv. Line"."Excise Amount",0.01)))+''','''+
                                      CommaRemoval(FORMAT(ROUND(CST_AMOUNT,0.01)))+''','''+
                                      CommaRemoval(FORMAT(ROUND(Packing_Value,0.01)))+''','''+
                                      CommaRemoval(FORMAT(ROUND(Frieght_Value,0.01)))+''','''+
                                      CommaRemoval(FORMAT(ROUND(Insurance_Value,0.01)))+''','''+
                                      CommaRemoval(FORMAT(ROUND(Additional_Duty,0.01)))+''','''+
                                      CommaRemoval(FORMAT(ROUND("Purch. Inv. Line".Quantity,0.01)))+''','''+
                                      CommaRemoval(FORMAT(ROUND(Service_Amount,0.01)))+''','''+
                                      "Purch. Inv. Line"."Document No."+''','''+FORMAT("Purch. Inv. Line"."Receipt Document Line No.")+''','''+
                                      FORMAT(PIH."Vendor Invoice Date",0,'<Day>-<Month Text,3>-<Year4>')+''','''+
                                      FORMAT(PurchRcptLine."Order Line No.")+''','''+
                                      FORMAT(PIH."Vendor Invoice No.")+''','''+
                                      Dept+''')';
                    
                            RecordSet := SQLConnection.Execute(SQLQuery);
                        END;
                      END;
                    END;
                    */

                end;
            }
        }
        dataitem("Purch. Rcpt. Line"; "Purch. Rcpt. Line")
        {
            DataItemTableView = SORTING(Document No., Line No.) ORDER(Ascending) WHERE(Quantity = FILTER(> 0), Correction = FILTER(No));
            RequestFilterFields = "Document No.", "Buy-from Vendor No.";

            trigger OnAfterGetRecord();
            begin
                /*RowCount:=0;
                "G\L".GET;
                IF "G\L"."Active ERP-CF Connection" THEN
                BEGIN
                  IF ISCLEAR(SQLConnection) THEN
                    CREATE(SQLConnection);
                
                  IF ISCLEAR(RecordSet) THEN
                    CREATE(RecordSet);
                
                  IF ConnectionOpen <> 1 THEN
                  BEGIN
                    SQLConnection.ConnectionString:="G\L"."Sql Connection String";
                    SQLConnection.Open;
                    ConnectionOpen:=1;
                    SQLConnection.BeginTrans;
                  END;
                
                  SQLQuery:='Select * from Receipt_line where Receipt_No='''+ "Purch. Rcpt. Line"."Document No."+'''and receipt_line_no='+
                            ''''+FORMAT("Purch. Rcpt. Line"."Line No.")+'''';
                  RecordSet:=SQLConnection.Execute(SQLQuery,RowCount);
                  IF NOT( (RecordSet.BOF) OR (RecordSet.EOF) ) THEN
                     RecordSet.MoveFirst;
                  WHILE NOT RecordSet.EOF DO
                  BEGIN
                    RowCount:=RowCount+1;
                    RecordSet.MoveNext;
                  END;
                
                  IF RowCount=-1 THEN
                  BEGIN
                    IF "Purch. Rcpt. Line"."Location Code"='CS STR' THEN
                       Dept:='CS'
                    ELSE
                       Dept:='NORMAL';
                
                    PRH.RESET;
                    PRH.SETFILTER(PRH."No.","Purch. Rcpt. Line"."Document No.");
                    IF PRH.FINDFIRST THEN
                    BEGIN
                      Vend.RESET;
                      IF Vend.GET("Purch. Rcpt. Line"."Buy-from Vendor No.") THEN
                      BEGIN
                        IF Vend."Consider Vendor Invoice Date"THEN
                        BEGIN
                          SQLQuery :='Insert into RECEIPT_LINE (RECEIPT_ID,ORDERNO,ITEMNO,VENDORID,INWARD_DATE,INWARDED_UNITS,'+
                                     'BILLNO,RECEIPT_NO, '+
                                     ' RECEIPT_LINE_NO,INVOICED_DATE,ORDER_LINE_NO,DEPT_WISE)'+
                                     ' VALUES (seq_Receipt_ID.NEXTVAL,'''+"Purch. Rcpt. Line"."Order No."+''','''+"Purch. Rcpt. Line"."No."+''','''
                                     +"Purch. Rcpt. Line"."Buy-from Vendor No."+''','''+
                                     FORMAT(PRH."Posting Date",0,'<Day>-<Month Text,3>-<Year4>')
                                     +''','''+CommaRemoval(FORMAT(ROUND("Purch. Rcpt. Line".Quantity,0.01)))+''','''
                                     +FORMAT(PRH."Vendor Order No.")+''','''+"Purch. Rcpt. Line"."Document No."+''','''+
                                     FORMAT("Purch. Rcpt. Line"."Line No.")+''','''+
                                     FORMAT(PRH."Vendor Invoice Date",0,'<Day>-<Month Text,3>-<Year4>')+''','''+
                                     FORMAT("Purch. Rcpt. Line"."Order Line No.")+''','''+Dept+''')';
                        END ELSE
                        BEGIN
                          SQLQuery :='Insert into RECEIPT_LINE (RECEIPT_ID,ORDERNO,ITEMNO,VENDORID,INWARD_DATE,INWARDED_UNITS,'
                                     +' BILLNO,RECEIPT_NO, '+
                                     ' RECEIPT_LINE_NO,ORDER_LINE_NO,DEPT_WISE)'+
                                     ' VALUES (seq_Receipt_ID.NEXTVAL,'''+"Purch. Rcpt. Line"."Order No."+''','''+"Purch. Rcpt. Line"."No."+''','''
                                     +"Purch. Rcpt. Line"."Buy-from Vendor No."+''','''+
                                     FORMAT(PRH."Posting Date",0,'<Day>-<Month Text,3>-<Year4>')
                                     +''','''+CommaRemoval(FORMAT(ROUND("Purch. Rcpt. Line".Quantity,0.01)))+''','''
                                     +FORMAT(PRH."Vendor Order No.")+''','''+"Purch. Rcpt. Line"."Document No."+''','''+
                                     FORMAT("Purch. Rcpt. Line"."Line No.")+''','''+FORMAT("Purch. Rcpt. Line"."Order Line No.")+''','''+Dept+''')';
                        END;
                      END;
                      SQLConnection.Execute(SQLQuery);
                    END;
                  END;
                END;
                */

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

    trigger OnPostReport();
    begin
        IF ConnectionOpen = 1 THEN BEGIN
            SQLConnection.CommitTrans;
        END;
    end;

    trigger OnPreReport();
    begin
        EXIT;
    end;

    var
        "G\L": Record "General Ledger Setup";
        RecordSet: Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000535-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Recordset";
        SQLConnection: Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000514-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Connection";
        SQLQuery: Text[1000];
        "Count": Integer;
        ConnectionOpen: Integer;
        RowCount: Integer;
        Structure_Amount: Decimal;
        Packing_Value: Decimal;
        Additional_Duty: Decimal;
        VAT_AMOUNT: Decimal;
        CST_AMOUNT: Decimal;
        Frieght_Value: Decimal;
        Insurance_Value: Decimal;
        Service_Amount: Decimal;
        PurchRcptLine: Record "Purch. Rcpt. Line";
        Order_No: Code[30];
        OrderLineNo: Integer;
        StrOrdLineDetails: Record "Structure Order Line Details";
        PIH: Record "Purch. Inv. Header";
        StrOrderDetails: Record "Structure Order Details";
        Dept: Text[25];
        Vend: Record Vendor;
        PRH: Record "Purch. Rcpt. Header";

    [LineStart(11390)]
    procedure CommaRemoval(Base: Text[30]) Converted: Text[30];
    var
        i: Integer;
    begin
        FOR i := 1 TO STRLEN(Base) DO BEGIN
            IF COPYSTR(Base, i, 1) <> ',' THEN
                Converted += COPYSTR(Base, i, 1);
        END;
        EXIT(Converted);
    end;

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

    //event SQLConnection(var Source : Text[1024];CursorType : Integer;LockType : Integer;var Options : Integer;adStatus : Integer;pCommand : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{B08400BD-F9D1-4D02-B856-71D5DBA123E9}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Command";pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset";pConnection : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000550-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Connection");
    //begin
    /*
    */
    //end;

    //event SQLConnection(RecordsAffected : Integer;pError : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000500-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Error";adStatus : Integer;pCommand : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{B08400BD-F9D1-4D02-B856-71D5DBA123E9}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Command";pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset";pConnection : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000550-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Connection");
    //begin
    /*
    */
    //end;

    //event SQLConnection(var ConnectionString : Text[1024];var UserID : Text[1024];var Password : Text[1024];var Options : Integer;adStatus : Integer;pConnection : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000550-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Connection");
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
}

