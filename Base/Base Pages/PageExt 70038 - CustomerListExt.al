pageextension 70038 CustomerListExt extends 22
{
    layout
    {
        modify("Credit Limit (LCY)")
        {
            Style = None;
        }
        addafter(Name)
        {
            field("Service Zone Code"; "Service Zone Code")
            {
            }
            field("Territory Code"; "Territory Code")
            {
            }
            field(Address; Address)
            {
                Editable = false;
            }
            field("Tally Ref"; "Tally Ref")
            {
            }
            field(SalBalance; SalBalance)
            {
            }
            field(CSBalance; CSBalance)
            {
            }
            field("Address 2"; "Address 2")
            {
                Editable = false;
            }
            field("State Code"; "State Code")
            {
                Editable = false;
            }
            field(City; City)
            {
            }
            field("Primary Contact No."; "Primary Contact No.")
            {
            }
        }
        addafter("Base Calendar Code")
        {
            field("E-Mail"; "E-Mail")
            {
            }
            field("Excise Bus. Posting Group"; "Excise Bus. Posting Group")
            {
                Editable = false;
            }
            field("Tax Area Code"; "Tax Area Code")
            {
                Editable = false;
            }
            field("T.I.N. No."; "T.I.N. No.")
            {
            }
            field("Payment Realization Period"; "Payment Realization Period")
            {
            }
            group(Control1102152012)
            {
                Editable = false;
                ShowCaption = false;
                grid(Control1102152011)
                {
                    ShowCaption = false;
                    group(Control1102152010)
                    {
                        ShowCaption = false;
                        field("TotalCustomers+FORMAT(Rec.COUNT)"; TotalCustomers + FORMAT(Rec.COUNT))
                        {
                            Editable = false;
                        }
                    }
                    group(Control1102152001)
                    {
                        ShowCaption = false;
                        field(Color_GST_Update_C; Color_GST_Update_C)
                        {
                            Editable = false;
                            Style = StrongAccent;
                            StyleExpr = TRUE;
                        }
                    }
                }
            }
        }
    }
    actions
    {
        modify(CustomerLedgerEntries)
        {
            Promoted = true;
        }
        modify(Statistics)
        {
            Promoted = true;
        }
        modify(NewSalesBlanketOrder)
        {
            Promoted = false;
        }
        modify(NewSalesQuote)
        {
            Promoted = true;
        }
        modify(NewSalesInvoice)
        {
            Promoted = true;
        }
        modify(NewSalesOrder)
        {
            Promoted = true;
        }
        modify(NewSalesCrMemo)
        {
            Promoted = false;
        }
        modify(NewSalesReturnOrder)
        {
            Promoted = false;
        }
        modify(NewServiceQuote)
        {
            Promoted = false;
        }
        modify(NewServiceInvoice)
        {
            Promoted = false;
        }
        modify(NewServiceOrder)
        {
            Promoted = false;
        }
        modify(NewServiceCrMemo)
        {
            Promoted = false;
        }
        modify(NewReminder)
        {
            Promoted = true;
        }
        modify(NewFinChargeMemo)
        {
            Promoted = false;
        }
        modify("Cash Receipt Journal")
        {
            Promoted = true;
        }
        modify("Sales Journal")
        {
            Promoted = true;
        }
        modify("Customer List")
        {
            Promoted = false;
        }
        modify("Customer Register")
        {
            Promoted = false;
        }
        modify("Customer - Top 10 List")
        {
            Promoted = true;
        }
        modify("Customer - Order Summary")
        {
            Promoted = true;
        }
        modify("Customer - Order Detail")
        {
            Promoted = false;
        }
        modify("Customer - Sales List")
        {
            Promoted = true;
        }
        modify("Sales Statistics")
        {
            Promoted = false;
        }
        modify("Customer/Item Sales")
        {
            Promoted = false;
        }
        modify(ReportCustomerDetailTrial)
        {
            Promoted = false;
        }
        modify(ReportCustomerSummaryAging)
        {
            Promoted = false;
        }
        modify(ReportCustomerDetailedAging)
        {
            Promoted = false;
        }
        modify(Statement)
        {
            Promoted = true;
        }
        modify(NewReminder)
        {
            Promoted = false;
        }
        modify(ReportAgedAccountsReceivable)
        {
            Promoted = true;
        }
        modify(ReportCustomerBalanceToDate)
        {
            Promoted = true;
        }
        modify(ReportCustomerTrialBalance)
        {
            Promoted = false;
        }
        modify(ReportCustomerPaymentReceipt)
        {
            Promoted = true;
        }
    }



    var
        TotalCustomers: Label '"Total Customers: "';
        Color_GST_Update: Code[30];
        RowCount: Integer;
        SQLConnection: Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000514-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Connection";
        RecordSet: Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000535-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Recordset";
        ConnectionOpen: Integer;
        Color_GST_Update_C: Label 'GST Details Not Updated';
        cus: Record Customer;
        id: Integer;




<<<<<<< HEAD
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


=======
>>>>>>> 24c8df96f43f94e861d8cc264d569e5663568f30
    procedure GSTMails();
    var
        Type: Code[2];
        No: Code[20];
        Subject: Text[1000];
        Mail_To: Text[1000];
        Mail_From: Text[1000];
        SMTP_MAIL: Codeunit "SMTP Mail";
        SQLQuery: Text[1024];
        TempText: Text;
        Body: Text;
        Attachment: Text;
    begin
        IF ISCLEAR(SQLConnection) THEN
            CREATE(SQLConnection, FALSE, TRUE);

        IF ISCLEAR(RecordSet) THEN
            CREATE(RecordSet, FALSE, TRUE);
        ConnectionOpen := 0;
        IF ConnectionOpen <> 1 THEN BEGIN
            SQLConnection.ConnectionString := 'DSN=salinvoiceuser;UID=salinvoiceuser;PASSWORD=salinvoiceuser;SERVER=oracle_80;';
            SQLConnection.Open;
            //SQLConnection.BeginTrans;
            ConnectionOpen := 1;
        END;
        //SQLQuery := 'select * from Vendor_Cust_List where NO in(''CUST00971'',''CUST00972'') and (MAIL_SEND_COUNT <=0 or MAIL_SEND_COUNT is null) order by type,no;';
        SQLQuery := 'select * from Vendor_Cust_List where (GST_REG_NO is null) and NO = ''' + "No." + ''' order by type,no;';
        //MESSAGE(SQLQuery);
        RecordSet := SQLConnection.Execute(SQLQuery, RowCount);
        IF NOT ((RecordSet.BOF) OR (RecordSet.EOF)) THEN
            RecordSet.MoveFirst;
        WHILE NOT RecordSet.EOF DO BEGIN
            Type := FORMAT(RecordSet.Fields.Item('TYPE').Value);
            No := FORMAT(RecordSet.Fields.Item('NO').Value);
            IF Type = 'V' THEN BEGIN
                Mail_From := 'purchase@efftronics.com';
                Mail_To := FORMAT(RecordSet.Fields.Item('EMAIL').Value);
            END
            ELSE BEGIN
                Mail_From := 'sales@efftronics.com';
                Mail_To := "E-Mail";
            END;

            //Mail_To := 'pranavi@efftronics.com';

            Subject := 'Reg : GST Information Requirements from Efftronics System Pvt Ltd.,!';
            Body := '<html><head><style> divone{background-color: white; width: 1210px; padding: 20px; border-style:solid ; border-color:#666699;  margin: 20px;} </style></head>';
            Body := Body + '<body><div style="border-color:#666699; margin: 20px; border-width:15px; border-style:solid; padding: 20px; width: 1110px;"><label><font size="6">GST Information Requirements from Efftronics System Pvt Ltd.,!</font></label>';
            Body := Body + '<hr style=solid; color= #3333CC>';
            Body := Body + '<h>Dear Sir/Madam,</h><br><br>';
            Body := Body + '<P> As you are aware, GST Roll out is likely to be from 01st July 2017. </P>';
            Body := Body + '<P> We need to update our records with the Provisional GSTIN Registration Numbers of all our Vendors/Customers. ';
            Body := Body + '<b>Request you to kindly update PAN & GST registration provisional ID in <u>below link</u> immediately.</b></P><br/>';
            //Body := Body+'<b>URL :</b><a href="http://localhost:51203/GSTRegistrationDetails.aspx?&V_C_Num=';
            Body := Body + '<font size="8"><b>URL :</b><a href="http://app.efftronics.org:8567/GST_Registration/GSTRegistrationDetails.aspx?V_C_Num=';
            Body := Body + No + '" target="_blank">GST Registration Details</a></font><br/><br/>';
            Body := Body + 'Please note that this is required to have smooth business transaction after GST implementation effective July 1, 2017.<br/><br/>';
            Body := Body + 'Our Company GST Registration details are also attached for your information.<br/><br/>';
            Body := Body + 'In case you have any queries please contact undersigned.<br/><br/>';
            Body := Body + 'Best Regards,<br/>';
            IF Type = 'V' THEN BEGIN
                Body := Body + 'Renuka CH<br/>';
                Body := Body + 'Purchase Department<br/>';
                Body := Body + 'Efftronics Systems Pvt. Ltd.,<br/>';
                Body := Body + '40-15-9,Brundavan Colony,<br/>';
                Body := Body + 'Vijayawada - 520010,<br/>';
                Body := Body + 'Andhra Pradesh, India.<br/>';
                Body := Body + 'Ph No : 0866-2466679(Direct)/2466699/75<br/>';
            END ELSE BEGIN
                Body := Body + 'S.Ganesh<br/>';
                Body := Body + 'Finance Department<br/>';
                Body := Body + 'Efftronics Systems Pvt. Ltd.,<br/>';
                Body := Body + '40-15-9,Brundavan Colony,<br/>';
                Body := Body + 'Vijayawada - 520010,<br/>';
                Body := Body + 'Andhra Pradesh, India.<br/>';
                Body := Body + 'Mobile : 9394654999<br/>';
                Body := Body + 'Ph No : 0866-2466675(Direct)/2466699/75<br/>';
            END;
            SMTP_MAIL.CreateMessage('ERP', Mail_From, Mail_To, Subject, Body, TRUE);
            Attachment := '\\erpserver\ErpAttachments\Efftronics_GST_Details.pdf';
            SMTP_MAIL.AddAttachment(Attachment, '');
            SMTP_MAIL.AddCC('erp@efftronics.com');
            SMTP_MAIL.Send;
            SQLQuery := 'update Vendor_Cust_List set MAIL_SEND_COUNT = nvl(MAIL_SEND_COUNT,0)+1 where NO = ''' + No + '''';
            //MESSAGE(SQLQuery);
            SQLConnection.BeginTrans;
            SQLConnection.Execute(SQLQuery);
            SQLConnection.CommitTrans;
            TempText := TempText + No + ',';
            RowCount := RowCount + 1;
            RecordSet.MoveNext;
        END;
        //RecordSet.Close;
        //SQLConnection.CommitTrans;
        SQLConnection.Close;
        ConnectionOpen := 0;
        IF STRLEN(TempText) > 1 THEN
            MESSAGE('Mail Has been send to ' + COPYSTR(TempText, 1, STRLEN(TempText) - 1) + ' - ' + Name + 'at ' + Mail_To);
    end;


    procedure GSTUpdated();
    var
        Type: Code[2];
        No: Code[20];
        Subject: Text[1000];
        Mail_To: Text[1000];
        Mail_From: Text[1000];
        SMTP_MAIL: Codeunit "SMTP Mail";
        SQLQuery: Text[1024];
        TempText: Text;
        Body: Text;
        Attachment: Text;
    begin
        //SQLQuery := 'select * from Vendor_Cust_List where NO in(''CUST00971'',''CUST00972'') and (MAIL_SEND_COUNT <=0 or MAIL_SEND_COUNT is null) order by type,no;';
        SQLQuery := 'select * from Vendor_Cust_List where (GST_REG_NO is null) and NO = ''' + "No." + ''' order by type,no';
        //MESSAGE(SQLQuery);
        RecordSet := SQLConnection.Execute(SQLQuery, RowCount);
        IF NOT ((RecordSet.BOF) OR (RecordSet.EOF)) THEN
            RecordSet.MoveFirst;
        WHILE NOT RecordSet.EOF DO BEGIN
            Color_GST_Update := 'StrongAccent';
            RowCount := RowCount + 1;
            RecordSet.MoveNext;
        END;
        //RecordSet.Close;
        //SQLConnection.CommitTrans;
    end;
}

