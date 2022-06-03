report 50118 "Invoice Wise Receivables"
{
    // version Rev01

    //   TempExcelBuffer.DELETEALL;
    //   CLEAR(TempExcelBuffer);
    // 
    // Report - OnPostReport()
    //  TempExcelBuffer.CreateBook;
    //  TempExcelBuffer.CreateSheet('Transfer Orders','',COMPANYNAME,'');
    //  TempExcelBuffer.GiveUserControl;
    DefaultLayout = RDLC;
    RDLCLayout = './Invoice Wise Receivables.rdlc';


    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = SORTING(Order No.) ORDER(Ascending);
            RequestFilterFields = "Order No.", "Customer Posting Group", "Salesperson Code", "Shipment Date", "Sell-to Customer No.";
            column(Sales_Invoice_Header__GETFILTERS; "Sales Invoice Header".GETFILTERS)
            {
            }
            column(Sales_Person_; "Sales Person")
            {
            }
            column(Sales_Invoice_Header__Sell_to_Customer_Name_; "Sell-to Customer Name")
            {
            }
            column(Sales_Invoice_Header__Customer_OrderNo__; "Customer OrderNo.")
            {
            }
            column(Sales_Invoice_Header__Sale_Order_Total_Amount_; "Sale Order Total Amount")
            {
            }
            column(Sales_Invoice_Header__Order_Date_; "Order Date")
            {
            }
            column(Sales_Invoice_Header__Order_No__; "Order No.")
            {
            }
            column(Sales_Invoice_Header__External_Document_No__; "External Document No.")
            {
            }
            column(amt; amt)
            {
            }
            column(remain; remain)
            {
            }
            column(amt_remain; amt - remain)
            {
            }
            column(FORMAT__Shipment_Date__0_7_; FORMAT("Shipment Date", 0, 7))
            {
            }
            column(Pending_Days_; "Pending Days")
            {
            }
            column(AC1; AC1)
            {
            }
            column(AC2; AC2)
            {
            }
            column(AC3; AC3)
            {
            }
            column(sd; sd)
            {
            }
            column(desc; desc)
            {
            }
            column(CV; CV)
            {
            }
            column(Total_Amt; Total_Amt)
            {
            }
            column(Total_Payment_; "Total Payment")
            {
            }
            column(Total_Remin_; "Total Remin")
            {
            }
            column(Total_Remin__Control1102154105; "Total Remin")
            {
            }
            column(dedu; dedu)
            {
            }
            column(ROUND_Sal_Pending_Amt_1_; ROUND(Sal_Pending_Amt, 1))
            {
            }
            column(Pvt_Total_Rcvd_Amt_Rly_Total_Rcvd_Amt_Rly_Total_Deduction_Amt; Pvt_Total_Rcvd_Amt + Rly_Total_Rcvd_Amt - Rly_Total_Deduction_Amt)
            {
            }
            column(Pvt_Total_Rem_Amt_Rly_Total_Rem_Amt; Pvt_Total_Rem_Amt + Rly_Total_Rem_Amt)
            {
            }
            column(Pvt_Total_Inv_Amt_Rly_Total_Inv_Amt; Pvt_Total_Inv_Amt + Rly_Total_Inv_Amt)
            {
            }
            column(Pvt_Total_Rcvd_Amt; Pvt_Total_Rcvd_Amt)
            {
            }
            column(Pvt_Total_Rem_Amt; Pvt_Total_Rem_Amt)
            {
            }
            column(Pvt_Total_Inv_Amt; Pvt_Total_Inv_Amt)
            {
            }
            column(Rly_Total_Rcvd_Amt_Rly_Total_Deduction_Amt; Rly_Total_Rcvd_Amt - Rly_Total_Deduction_Amt)
            {
            }
            column(Rly_Total_Rem_Amt; Rly_Total_Rem_Amt)
            {
            }
            column(Rly_Total_Inv_Amt; Rly_Total_Inv_Amt)
            {
            }
            column(Rly_Total_Deduction_Amt; Rly_Total_Deduction_Amt)
            {
            }
            column(Order_Invoice_Wise_Payment_DetailsCaption; Order_Invoice_Wise_Payment_DetailsCaptionLbl)
            {
            }
            column(Customer_NameCaption; Customer_NameCaptionLbl)
            {
            }
            column(CustomerOrder_NOCaption; CustomerOrder_NOCaptionLbl)
            {
            }
            column(EmptyStringCaption; EmptyStringCaptionLbl)
            {
            }
            column(EmptyStringCaption_Control1102154018; EmptyStringCaption_Control1102154018Lbl)
            {
            }
            column(Total_Order_AmountCaption; Total_Order_AmountCaptionLbl)
            {
            }
            column(EmptyStringCaption_Control1102154022; EmptyStringCaption_Control1102154022Lbl)
            {
            }
            column(DeductionsCaption; DeductionsCaptionLbl)
            {
            }
            column(Sales_Invoice_Header__Order_Date_Caption; FIELDCAPTION("Order Date"))
            {
            }
            column(SAL_Order_NoCaption; SAL_Order_NoCaptionLbl)
            {
            }
            column(Invoice_NoCaption; Invoice_NoCaptionLbl)
            {
            }
            column(Invoiced_AmountCaption; Invoiced_AmountCaptionLbl)
            {
            }
            column(Balance_With_out_Deductions_Caption; Balance_With_out_Deductions_CaptionLbl)
            {
            }
            column(Receipt_with_DeductionsCaption; Receipt_with_DeductionsCaptionLbl)
            {
            }
            column(Invoice_DateCaption; Invoice_DateCaptionLbl)
            {
            }
            column(Pending_DaysCaption; Pending_DaysCaptionLbl)
            {
            }
            column(ITCaption; ITCaptionLbl)
            {
            }
            column(Works_Tax_VatCaption; Works_Tax_VatCaptionLbl)
            {
            }
            column(Postages___TelCaption; Postages___TelCaptionLbl)
            {
            }
            column(Security_DepositCaption; Security_DepositCaptionLbl)
            {
            }
            column(Actual_BalanceCaption; Actual_BalanceCaptionLbl)
            {
            }
            column(DescriptionCaption; DescriptionCaptionLbl)
            {
            }
            column(Credit_NoteCaption; Credit_NoteCaptionLbl)
            {
            }
            column(Total_DeductionsCaption; Total_DeductionsCaptionLbl)
            {
            }
            column(Pending_Caption; Pending_CaptionLbl)
            {
            }
            column(EmptyStringCaption_Control1102154115; EmptyStringCaption_Control1102154115Lbl)
            {
            }
            column(Total_ReceivedCaption; Total_ReceivedCaptionLbl)
            {
            }
            column(Order_Invoices_Vs_Received_AmountsCaption; Order_Invoices_Vs_Received_AmountsCaptionLbl)
            {
            }
            column(Pending_BalanceCaption; Pending_BalanceCaptionLbl)
            {
            }
            column(Total_InvoicedCaption; Total_InvoicedCaptionLbl)
            {
            }
            column(Order_Invoices_Vs_Received_AmountsCaption_Control1102154125; Order_Invoices_Vs_Received_AmountsCaption_Control1102154125Lbl)
            {
            }
            column(Total_InvoicedCaption_Control1102154126; Total_InvoicedCaption_Control1102154126Lbl)
            {
            }
            column(Total_ReceivedCaption_Control1102154127; Total_ReceivedCaption_Control1102154127Lbl)
            {
            }
            column(Pending_BalanceCaption_Control1102154129; Pending_BalanceCaption_Control1102154129Lbl)
            {
            }
            column(Order_Invoices_Vs_Received_AmountsCaption_Control1102154136; Order_Invoices_Vs_Received_AmountsCaption_Control1102154136Lbl)
            {
            }
            column(Total_InvoicedCaption_Control1102154137; Total_InvoicedCaption_Control1102154137Lbl)
            {
            }
            column(Total_ReceivedCaption_Control1102154138; Total_ReceivedCaption_Control1102154138Lbl)
            {
            }
            column(Pending_BalanceCaption_Control1102154140; Pending_BalanceCaption_Control1102154140Lbl)
            {
            }
            column(Private_Orders_08_09Caption; Private_Orders_08_09CaptionLbl)
            {
            }
            column(Total_Orders_08_09Caption; Total_Orders_08_09CaptionLbl)
            {
            }
            column(Railway_Orders_08_09Caption; Railway_Orders_08_09CaptionLbl)
            {
            }
            column(Total_DeductionsCaption_Control1102154150; Total_DeductionsCaption_Control1102154150Lbl)
            {
            }
            column(Sales_Invoice_Header_No_; "No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF "Sales Invoice Header".GETFILTER("Sales Invoice Header"."Salesperson Code") <> '' THEN BEGIN

                    "Sal/Pur".SETRANGE("Sal/Pur".Code, "Sales Invoice Header"."Salesperson Code");
                    IF "Sal/Pur".FIND('-') THEN BEGIN
                        "Sales Person" := "Sal/Pur".Name;
                    END;
                END;

                //"Total Remin":=0;
                AC1 := 0;
                AC2 := 0;
                AC3 := 0;
                sd := 0;
                CV := 0;
                TCV := 0;
                desc := '';
                CLE.SETRANGE(CLE."Customer No.", "Sales Invoice Header"."Sell-to Customer No.");
                CLE.SETRANGE(CLE."Document No.", "Sales Invoice Header"."No.");
                CLE.SETRANGE(CLE."External Document No.", "Sales Invoice Header"."External Document No.");
                IF CLE.FIND('-') THEN
                    REPEAT
                        CLE.CALCFIELDS(CLE.Amount, CLE."Remaining Amount");
                        amt := CLE.Amount;
                        remain := CLE."Remaining Amount";

                    UNTIL CLE.NEXT = 0;

                /*IF  "Shipment Date"<(040108D) THEN
                CurrReport.SKIP;*/
                IF datadump THEN BEGIN
                    SIL.SETRANGE(SIL."Document No.", "Sales Invoice Header"."No.");
                    IF SIL.FIND('-') THEN
                        REPEAT
                            IF SIL.Quantity > 0 THEN BEGIN
                                SIL.CALCFIELDS(SIL."Document Date");
                                SQLQuery1 := 'insert into ERP_SALES_INVOICE_LINE(DOCNO,ITEM_DESC,ITEMNO,UNITPRICE,QTY,LINEAMT,' +
                                'INVOICEDLINEAMT,EXCISEAMT,VATAMT,CSTAMT,INVOICEDDATE,SERVICETAX,INVOICENO' +
                                ' ) values(''' + FORMAT(SIL."Document No.") + ''',''' + CONVERTSTR(SIL.Description, '''', ' ') + '''' +
                                ',''' + FORMAT(SIL."No.") + ''',' +
                                'NVL(to_number(replace(''' + FORMAT(ROUND(SIL."Unit Price", 1)) + ''',''' + ',' + ''',''' + '' + ''')),0),' +
                                'NVL(to_number(replace(''' + FORMAT(ROUND(SIL.Quantity, 1)) + ''',''' + ',' + ''',''' + '' + ''')),0),' +
                                'NVL(to_number(replace(''' + FORMAT(ROUND(SIL."Line Amount", 1)) + ''',''' + ',' + ''',''' + '' + ''')),0),' +
                                'NVL(to_number(replace(''' + FORMAT(ROUND(SIL."Amount To Customer", 1)) + ''',''' + ',' + ''',''' + '' + ''')),0),' +
                                'NVL(to_number(replace(''' + FORMAT(ROUND(SIL."Excise Amount", 1)) + ''',''' + ',' + ''',''' + '' + ''')),0),' +
                                //        'NVL(to_number(replace('''+FORMAT(ROUND(SIL."VAT Amount",1))+''','''+','+''','''+''+''')),0),'+
                                'NVL(to_number(replace(''' + FORMAT(ROUND(SIL."Tax Amount", 1)) + ''',''' + ',' + ''',''' + '' + ''')),0),' +
                                '''' + FORMAT(SIL."Document Date", 0, '<Day>-<Month Text,3>-<Year4>') + ''',' +
                                'NVL(to_number(replace(''' + FORMAT(ROUND(SIL."Service Tax Amount", 1)) + ''',''' + ',' + ''',''' + '' + ''')),0),' +
                                '''' + FORMAT(SIL."External Document No.") + ''')';
                                //       MESSAGE(SQLQuery1);
                                //SQLConnection.Execute(SQLQuery1);//B2B
                            END;
                        UNTIL SIL.NEXT = 0;
                END;

            end;

            trigger OnPreDataItem();
            begin
                IF datadump THEN BEGIN
                    sqlconnection1;
                    deletequery := 'DELETE FROM  ERP_SALES_PENDING_INVOICE';
                    //SQLConnection.Execute(deletequery);//B2B
                    deletequery := 'DELETE FROM ERP_SALES_INVOICE_LINE';
                    //SQLConnection.Execute(deletequery);//B2B
                END;

                "Total Remin" := 0;
                IF "fyear08-09" = TRUE THEN
                    "Sales Invoice Header".SETFILTER("Sales Invoice Header"."Order No.",
                    'eff/sal/08-09*|eff/sal/07-08*|eff/sal/06-07*|eff/sal/05-06*|eff/sal/04-05*|eff/sal/03-04*|eff/sal/09-10*|eff/sal/10-11*');

                "Report Filters" := "Sales Invoice Header".GETFILTERS;
                // Calculation of Financial Year
                IF ex = TRUE THEN BEGIN
                    row += 1;
                    entercell(1, 1, 'Customer_Name         ', TRUE);
                    entercell(1, 3, 'Sale_Order_Number', TRUE);
                    entercell(1, 2, 'Customer_Order_Number', TRUE);
                    entercell(1, 4, 'Order_Amount', TRUE);
                    entercell(1, 5, 'Invoiced_Amount', TRUE);
                    entercell(1, 6, 'Receipts         ', TRUE);
                    entercell(1, 7, 'Balance_Without_Deductions', TRUE);
                    entercell(1, 8, 'Deductions       ', TRUE);
                    entercell(1, 9, 'Actual Balance    ', TRUE);
                    entercell(1, 10, 'Order Date', TRUE);
                    entercell(1, 11, 'Invoice Date', TRUE);
                    entercell(1, 12, 'Receipt Date', TRUE);
                    entercell(1, 13, 'Sales person Name', TRUE);
                    entercell(1, 14, 'Customer Posting Group', TRUE);
                END;
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
        IF DATE2DMY(TODAY, 2) > 4 THEN
            Financial_Year += 'Finacial Year' + FORMAT(DATE2DMY(TODAY, 3)) + '-' + FORMAT(DATE2DMY(TODAY, 3) + 1)
        ELSE
            Financial_Year += 'Finacial Year' + FORMAT(DATE2DMY(TODAY, 3) - 1) + '-' + FORMAT(DATE2DMY(TODAY, 3));
    end;

    trigger OnPostReport();
    begin
        //MESSAGE(FORMAT(ordamt));
        IF ex = TRUE THEN BEGIN
            TempExcelBuffer.CreateBook('');//B2B
                                           //TempExcelBuffer.CreateSheet('Sale Orders InviceDeatails','',COMPANYNAME,'');//B2B
            TempExcelBuffer.GiveUserControl;

        END;
    end;

    trigger OnPreReport();
    begin
        IF ex = TRUE THEN BEGIN
            TempExcelBuffer.DELETEALL;
            CLEAR(TempExcelBuffer);
        END;
    end;

    var
        SIL: Record "Sales Invoice Line";
        amt: Decimal;
        CLE: Record "Cust. Ledger Entry";
        CLE1: Record "Cust. Ledger Entry";
        remain: Decimal;
        Total_Amt: Decimal;
        "Total Payment": Decimal;
        "Total Remin": Decimal;
        Choice: Option Pending,All,Rcvd;
        Sih: Record "Sales Invoice Header";
        Show: Boolean;
        totalremain: Decimal;
        totalreceived: Decimal;
        totalinvoiced: Decimal;
        "fyear08-09": Boolean;
        ordamt: Decimal;
        pendrly: Decimal;
        pendpri: Decimal;
        "aging(0-10)": Decimal;
        "aging(11-25)": Decimal;
        CLE2: Record "Cust. Ledger Entry";
        dedu: Decimal;
        docno: Code[20];
        GE: Record "G/L Entry";
        AC1: Decimal;
        AC2: Decimal;
        AC3: Decimal;
        t1: Decimal;
        totded: Decimal;
        sub: Decimal;
        sd: Decimal;
        desc: Text[1000];
        charline: Char;
        "Pending Days": Integer;
        Sal_Pending_Amt: Decimal;
        CV: Decimal;
        TCV: Decimal;
        Financial_Year: Text[100];
        Pvt_Total_Inv_Amt: Decimal;
        Rly_Total_Inv_Amt: Decimal;
        Pvt_Total_Rem_Amt: Decimal;
        Rly_Total_Rem_Amt: Decimal;
        Pvt_Total_Rcvd_Amt: Decimal;
        Rly_Total_Rcvd_Amt: Decimal;
        Rly_Total_Deduction_Amt: Decimal;
        Pvt_Tag: Text[100];
        Rly_Tag: Text[100];
        "Sal/Pur": Record "Salesperson/Purchaser";
        "Sales Person": Text[50];
        "Report Filters": Text[200];
        excel1: Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00024500-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Application";
        TempExcelBuffer: Record "Excel Buffer" temporary;
        row: Integer;
        coloumn: Integer;
        ex: Boolean;
        monthswise: Boolean;
        receiveddate: Date;
        MI: Decimal;
        SQLQuery: Text[1000];
        connectionopen: Integer;
        deletequery: Text[1000];
        datadump: Boolean;
        SQLQuery1: Text[1000];
        CUS: Record Customer;
        CUsbalance: Decimal;
        Order_Invoice_Wise_Payment_DetailsCaptionLbl: Label 'Order-Invoice Wise Payment Details';
        Customer_NameCaptionLbl: Label 'Customer Name';
        CustomerOrder_NOCaptionLbl: Label 'CustomerOrder NO';
        EmptyStringCaptionLbl: Label ':';
        EmptyStringCaption_Control1102154018Lbl: Label ':';
        Total_Order_AmountCaptionLbl: Label 'Total Order Amount';
        EmptyStringCaption_Control1102154022Lbl: Label ':';
        DeductionsCaptionLbl: Label 'Deductions';
        SAL_Order_NoCaptionLbl: Label 'SAL Order No';
        Invoice_NoCaptionLbl: Label 'Invoice No';
        Invoiced_AmountCaptionLbl: Label 'Invoiced Amount';
        Balance_With_out_Deductions_CaptionLbl: Label 'Balance(With out Deductions)';
        Receipt_with_DeductionsCaptionLbl: Label 'Receipt with Deductions';
        Invoice_DateCaptionLbl: Label 'Invoice Date';
        Pending_DaysCaptionLbl: Label 'Pending Days';
        ITCaptionLbl: Label 'IT';
        Works_Tax_VatCaptionLbl: Label 'Works Tax/Vat';
        Postages___TelCaptionLbl: Label 'Postages & Tel';
        Security_DepositCaptionLbl: Label 'Security Deposit';
        Actual_BalanceCaptionLbl: Label 'Actual Balance';
        DescriptionCaptionLbl: Label 'Description';
        Credit_NoteCaptionLbl: Label 'Credit Note';
        Total_DeductionsCaptionLbl: Label 'Total Deductions';
        Pending_CaptionLbl: Label '"Pending "';
        EmptyStringCaption_Control1102154115Lbl: Label '%';
        Total_ReceivedCaptionLbl: Label 'Total Received';
        Order_Invoices_Vs_Received_AmountsCaptionLbl: Label 'Order-Invoices Vs Received Amounts';
        Pending_BalanceCaptionLbl: Label 'Pending Balance';
        Total_InvoicedCaptionLbl: Label 'Total Invoiced';
        Order_Invoices_Vs_Received_AmountsCaption_Control1102154125Lbl: Label 'Order-Invoices Vs Received Amounts';
        Total_InvoicedCaption_Control1102154126Lbl: Label 'Total Invoiced';
        Total_ReceivedCaption_Control1102154127Lbl: Label 'Total Received';
        Pending_BalanceCaption_Control1102154129Lbl: Label 'Pending Balance';
        Order_Invoices_Vs_Received_AmountsCaption_Control1102154136Lbl: Label 'Order-Invoices Vs Received Amounts';
        Total_InvoicedCaption_Control1102154137Lbl: Label 'Total Invoiced';
        Total_ReceivedCaption_Control1102154138Lbl: Label 'Total Received';
        Pending_BalanceCaption_Control1102154140Lbl: Label 'Pending Balance';
        Private_Orders_08_09CaptionLbl: Label 'Private Orders-08-09';
        Total_Orders_08_09CaptionLbl: Label 'Total Orders-08-09';
        Railway_Orders_08_09CaptionLbl: Label 'Railway Orders-08-09';
        Total_DeductionsCaption_Control1102154150Lbl: Label 'Total Deductions';

    [LineStart(7048)]
    procedure entercell(rowno: Integer; columnno: Integer; cellvalue: Text[250]; bold: Boolean);
    begin
        TempExcelBuffer.INIT;
        TempExcelBuffer.VALIDATE("Row No.", rowno);
        TempExcelBuffer.VALIDATE("Column No.", columnno);
        TempExcelBuffer."Cell Value as Text" := cellvalue;
        TempExcelBuffer.Bold := bold;
        TempExcelBuffer.INSERT;
    end;

    [LineStart(7056)]
    procedure enterheadings(rowno: Integer; columnno: Integer; cellvalue: Code[50]; bold: Boolean);
    begin
        TempExcelBuffer.INIT;
        TempExcelBuffer.VALIDATE("Row No.", rowno);
        TempExcelBuffer.VALIDATE("Column No.", columnno);
        TempExcelBuffer."Cell Value as Text" := FORMAT(cellvalue);
        TempExcelBuffer.Bold := bold;
        TempExcelBuffer.Formula := '';
        TempExcelBuffer.INSERT;
    end;

    [LineStart(7065)]
    procedure sqlconnection1();
    begin
        /*IF ISCLEAR(SQLConnection) THEN
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

    [LineStart(7082)]
    procedure commaeli(Base: Text[30]) converted: Text[30];
    var
        i: Integer;
    begin
        FOR i := 1 TO STRLEN(Base) DO BEGIN
            IF COPYSTR(Base, i, 1) <> ',' THEN
                converted += COPYSTR(Base, i, 1);
        END;
        EXIT(converted);
    end;

    //event excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook");
    //begin
    /*
    */
    //end;

    //event excel1(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
    /*
    */
    //end;

    //event excel1(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
    /*
    */
    //end;

    //event excel1(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
    /*
    */
    //end;

    //event excel1(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH");
    //begin
    /*
    */
    //end;

    //event excel1(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH");
    //begin
    /*
    */
    //end;

    //event excel1(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH");
    //begin
    /*
    */
    //end;

    //event excel1(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
    /*
    */
    //end;

    //event excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook");
    //begin
    /*
    */
    //end;

    //event excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook");
    //begin
    /*
    */
    //end;

    //event excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook");
    //begin
    /*
    */
    //end;

    //event excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";var Cancel : Boolean);
    //begin
    /*
    */
    //end;

    //event excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";SaveAsUI : Boolean;var Cancel : Boolean);
    //begin
    /*
    */
    //end;

    //event excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";var Cancel : Boolean);
    //begin
    /*
    */
    //end;

    //event excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH");
    //begin
    /*
    */
    //end;

    //event excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook");
    //begin
    /*
    */
    //end;

    //event excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook");
    //begin
    /*
    */
    //end;

    //event excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Wn : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020893-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Window");
    //begin
    /*
    */
    //end;

    //event excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Wn : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020893-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Window");
    //begin
    /*
    */
    //end;

    //event excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Wn : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020893-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Window");
    //begin
    /*
    */
    //end;

    //event excel1(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
    /*
    */
    //end;

    //event excel1(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
    /*
    */
    //end;

    //event excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
    /*
    */
    //end;

    //event excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
    /*
    */
    //end;

    //event excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";SyncEventType : Integer);
    //begin
    /*
    */
    //end;

    //event excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Map : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{0002447B-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.XmlMap";Url : Text[1024];IsRefresh : Boolean;var Cancel : Boolean);
    //begin
    /*
    */
    //end;

    //event excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Map : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{0002447B-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.XmlMap";IsRefresh : Boolean;Result : Integer);
    //begin
    /*
    */
    //end;

    //event excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Map : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{0002447B-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.XmlMap";Url : Text[1024];var Cancel : Boolean);
    //begin
    /*
    */
    //end;

    //event excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Map : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{0002447B-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.XmlMap";Url : Text[1024];Result : Integer);
    //begin
    /*
    */
    //end;

    //event excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Description : Text[1024];Sheet : Text[1024];Success : Boolean);
    //begin
    /*
    */
    //end;

    //event excel1();
    //begin
    /*
    */
    //end;
}

