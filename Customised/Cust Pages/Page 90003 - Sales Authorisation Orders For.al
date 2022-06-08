page 90003 "Sales Authorisation Orders For"
{
    // version NAVW13.70,NAVIN3.70.00.13,B2B1.0,DIM1.0

    // PROJECT : Efftronics
    // ********************************************************************************************************************************************
    // SIGN
    // ********************************************************************************************************************************************
    // B2B     : B2B Software Technologies
    // ********************************************************************************************************************************************
    // VER      SIGN   USERID                 DATE                          DESCRIPTION
    // ********************************************************************************************************************************************
    // 1.0       DIM   Sivaramakrishna.A      24-May-13            -> Code has been commented in ConvertOrdertoExportOrder() For Document Dimensions
    //                                                                Tables are does not exist in the NAV 2013 and added new Code to Modify the
    //                                                                Dimension Set ID in SalesExportOrderHeader and insert the Dimension Set ID in SalesExportorderLine

    Caption = 'Sales AMC';
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Sales Header";
    SourceTableView = WHERE(Document Type=CONST(Order));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; "No.")
                {
                    Editable = false;

                    trigger OnAssistEdit();
                    begin
                        IF AssistEdit(xRec) THEN
                            CurrPage.UPDATE;
                    end;
                }
                field("Sell-to Customer No."; "Sell-to Customer No.")
                {
                    Editable = false;

                    trigger OnValidate();
                    begin
                        CUS.SETRANGE(CUS."No.", "Sell-to Customer No.");
                        IF CUS.FINDFIRST THEN
                            Territory := CUS."Territory Code";
                        SelltoCustomerNoOnAfterValidat;
                    end;
                }
                field("Customer Posting Group"; "Customer Posting Group")
                {
                    Editable = false;
                }
                field("Sell-to Customer Name"; "Sell-to Customer Name")
                {
                    Editable = false;
                }
                field("Sell-to Address"; "Sell-to Address")
                {
                    Editable = false;
                }
                field("Sell-to Address 2"; "Sell-to Address 2")
                {
                    Editable = false;
                }
                field("Sell-to Post Code"; "Sell-to Post Code")
                {
                    Caption = 'Sell-to Post Code/City';
                    Editable = false;
                }
                field(State; State)
                {
                    Editable = false;
                }
                field("Sell-to City"; "Sell-to City")
                {
                    Editable = false;
                }
                field(Control1280009; Structure)
                {
                    Editable = false;
                }
                field(Status; Status)
                {
                    Editable = false;
                }
                field(Product; Product)
                {
                    Editable = false;
                }
                field("Posting Date"; "Posting Date")
                {
                    Editable = false;
                }
                field("Order Date"; "Order Date")
                {
                    Editable = false;
                }
                field("Shipment Date"; "Shipment Date")
                {
                    Editable = false;
                }
                field("Requested Delivery Date"; "Requested Delivery Date")
                {
                    Editable = false;

                    trigger OnValidate();
                    begin
                        IF "Order Date" > "Requested Delivery Date" THEN
                            ERROR('Requested Delivery Date Must be Greater than Order Date');
                    end;
                }
                field("Promised Delivery Date"; "Promised Delivery Date")
                {
                    Editable = false;
                }
                field("External Document No."; "External Document No.")
                {
                    Caption = 'Invoice Number';
                    Editable = false;
                }
                field("Salesperson Code"; "Salesperson Code")
                {
                    Editable = false;
                }
                field("Project Completion Date"; "Project Completion Date")
                {
                    Editable = false;
                }
                field("Sale Order Total Amount"; "Sale Order Total Amount")
                {
                    Editable = false;
                }
                field("Customer OrderNo."; "Customer OrderNo.")
                {
                    Editable = false;
                }
                field("Customer Order Date"; "Customer Order Date")
                {
                    Editable = false;
                }
                field("Order Assurance"; "Order Assurance")
                {
                    Editable = "Order AssuranceEditable";
                    Visible = false;

                    trigger OnValidate();
                    begin

                        /*IF (USERID='SUPER') OR (USERID='EFFTRONICS\ANULATHA') THEN BEGIN
                        Mail_Subject:='Order Assurance';
                        newline:=10;
                        SHA.SETRANGE(SHA."No.","No.");
                        IF SHA.FINDFIRST THEN
                        BEGIN
                        Mail_Body:='Sale Order No.                   : '+FORMAT("No.");
                        Mail_Body+=FORMAT(newline);
                        Mail_Body+='Customer Name                    : '+FORMAT("Sell-to Customer Name");
                        Mail_Body+=FORMAT(newline);
                        Mail_Body+='Customer Order No.               : '+FORMAT("Customer OrderNo.");
                        Mail_Body+=FORMAT(newline);
                        Mail_Body+='Customer Requested Date          : '+FORMAT(("Requested Delivery Date"),0,4);
                        Mail_Body+=FORMAT(newline);
                        Mail_Body+='Assured Date                     : '+FORMAT((TODAY),0,4);
                        Mail_Body+=FORMAT(newline);
                        Mail_Body+='Days Between Release & Assurance : '+FORMAT(TODAY-"Expiration Date");
                        Mail_Body+=FORMAT(newline);
                        "Mail-Id".SETRANGE("Mail-Id"."User ID","Salesperson Code");
                        IF "Mail-Id".FINDFIRST THEN
                        Mail_Body+='Sales Executive                  : '+"Mail-Id".Name;
                        Mail_Body+=FORMAT(newline);
                        Mail_Body+=FORMAT(newline);
                        Mail_Body+='***** Auto Mail Generated From ERP *****';
                        "Mail-Id".SETRANGE("Mail-Id"."User ID",USERID);
                        IF "Mail-Id".FINDFIRST THEN
                        "from Mail":="Mail-Id".MailID;
                        "to mail":='swarupa@efftronics.net';
                        IF ("from Mail"<>'')AND("to mail"<>'') THEN
                        mail.NewCDOMessage("from Mail","to mail",Mail_Subject,Mail_Body,''); */
                        MODIFY(TRUE);
                        //END;
                        //END
                        //ELSE
                        //ERROR('You Do not Have Permission to Assure');

                        IF "Order Assurance" = TRUE AND (Status = Status::Open) THEN BEGIN
                            "Order AssuranceEditable" := FALSE;
                            "Assured Date" := TODAY;
                        END ELSE
                            "Order AssuranceEditable" := TRUE;

                    end;
                }
                field("Payment Terms Code"; "Payment Terms Code")
                {
                    Editable = false;
                }
                field(paymenttermdesc; paymenttermdesc)
                {
                    Editable = false;
                }
                field(Receivedamt; Receivedamt)
                {
                    Caption = 'Received Amount For This Order';
                    Editable = false;
                }
                field("Reason For Pending"; "Reason For Pending")
                {
                    Caption = 'Sales Comments';
                    Editable = false;
                    MultiLine = true;
                }
                field(reject; reject)
                {
                    Caption = 'Reject';

                    trigger OnValidate();
                    begin
                        IF Remarks = '' THEN
                            ERROR('Please Enter Comment')
                        ELSE
                            RemarksEditable := FALSE;

                        IF ("No." <> '') AND ((USERID = 'EFFTRONICS\CEO@EFFTRONICS.COM#MD') OR (USERID = 'SUPER')) THEN BEGIN
                            Mail_From := 'sreenu@efftronics.com';
                            Mail_To := 'sreenu@efftronics.com,anilkumar@efftronics.com';
                            Subject := 'Authorisation Not Approved to do the invoice For the Order No:' + FORMAT("No.");
                            Body := 'Since this is the comment Given' + FORMAT(Remarks);
                            Attachment := '';
                            NewCDOMessage(Mail_From, Mail_To, Subject, Body, Attachment);
                        END ELSE
                            ERROR('you Have No rights to Authorize');
                    end;
                }
                field(Remarks; Remarks)
                {
                    Editable = RemarksEditable;
                }
            }
            part(SalesLines; "Sales Authorisation Sub Form")
            {
                SubPageLink = Document No.=FIELD(No.);
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("O&rder")
            {
                Caption = 'O&rder';
                action(Statistics)
                {
                    Caption = 'Statistics';
                    ShortCutKey = 'F9';

                    trigger OnAction();
                    begin
                        SalesSetup.GET;
                        IF SalesSetup."Calc. Inv. Discount" THEN BEGIN
                            CurrPage.SalesLines.PAGE.CalcInvDisc;
                            COMMIT
                        END;
                        PAGE.RUNMODAL(PAGE::"Sales Order Statistics", Rec);
                    end;
                }
                action(Card)
                {
                    Caption = 'Card';
                    RunObject = Page "Customer Card";
                    RunPageLink = No.=FIELD(Sell-to Customer No.);
                    ShortCutKey = 'Shift+F5';
                }
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    RunObject = Page "Sales Comment Sheet";
                                    RunPageLink = Document Type=FIELD(Document Type),No.=FIELD(No.);
                }
                action("S&hipments")
                {
                    Caption = 'S&hipments';
                    RunObject = Page "Posted Sales Shipments";
                                    RunPageLink = Order No.=FIELD(No.);
                    RunPageView = SORTING(Order No.);
                }
                action(Invoices)
                {
                    Caption = 'Invoices';
                    RunObject = Page "Posted Sales Invoices";
                                    RunPageLink = Order No.=FIELD(No.);
                    RunPageView = SORTING(Order No.);
                }
                separator(Action1280029)
                {
                }
                action("Transit Documents")
                {
                    Caption = 'Transit Documents';
                    RunObject = Page "Transit Document Order Details";
                                    RunPageLink = Type=CONST(Sale),PO / SO No.=FIELD(No.),Vendor / Customer Ref.=FIELD(Sell-to Customer No.);
                }
                action(Structure)
                {
                    Caption = 'Structure';
                    RunObject = Page "Structure Order Details";
                                    RunPageLink = Type=CONST(Sale),Document Type=FIELD(Document Type),Document No.=FIELD(No.),Structure Code=FIELD(Structure);
                }
                action("Authorization Information")
                {
                    Caption = 'Authorization Information';
                    RunObject = Page "VAT Opening Detail";
                                    RunPageLink = Transcation Type=CONST(Sale),Document Type=FIELD(Document Type),Document No.=FIELD(No.);
                }
                separator(Action173)
                {
                }
                action("Whse. Shipment Lines")
                {
                    Caption = 'Whse. Shipment Lines';
                    RunObject = Page "Whse. Shipment Lines";
                                    RunPageLink = Source Type=CONST(37),Source Subtype=FIELD(Document Type),Source No.=FIELD(No.);
                    RunPageView = SORTING(Source Type,Source Subtype,Source No.,Source Line No.);
                    Visible = false;
                }
                action("In&vt. Put-away/Pick Lines")
                {
                    Caption = 'In&vt. Put-away/Pick Lines';
                    RunObject = Page "Warehouse Activity List";
                                    RunPageLink = Source Document=CONST(Sales Order),Source No.=FIELD(No.);
                    RunPageView = SORTING(Source Document,Source No.,Location Code);
                    Visible = false;
                }
                separator(Action120)
                {
                }
                action("Pla&nning")
                {
                    Caption = 'Pla&nning';

                    trigger OnAction();
                    var
                        SalesPlanForm : Page "Sales Order Planning";
                    begin
                        SalesPlanForm.SetSalesOrder("No.");
                        SalesPlanForm.RUNMODAL;
                    end;
                }
                action("Order &Promising")
                {
                    Caption = 'Order &Promising';

                    trigger OnAction();
                    var
                        OrderPromisingLine : Record "Order Promising Line" temporary;
                    begin
                        OrderPromisingLine.SETRANGE("Source Type","Document Type");
                        OrderPromisingLine.SETRANGE("Source ID","No.");
                        PAGE.RUNMODAL(PAGE::"Order Promising Lines",OrderPromisingLine);
                    end;
                }
                separator(Action1102152025)
                {
                }
                action("Check List")
                {
                    Caption = 'Check List';
                    RunObject = Page "Check List";
                                    RunPageLink = Document Type=CONST(Sales),Document No.=FIELD(No.);
                }
                action("&MSPT Order Details")
                {
                    Caption = '&MSPT Order Details';
                    RunObject = Page "MSPT Order Details";
                                    RunPageLink = Type=CONST(Sale),Document Type=FIELD(Document Type),Document No.=FIELD(No.),MSPT Header Code=FIELD(MSPT Code),Party No.=FIELD(Sell-to Customer No.);
                }
                action(Schedule)
                {
                    Caption = 'Schedule';
                    RunObject = Page Schedule;
                                    RunPageLink = Document No.=FIELD(Tender No.),Document Type=CONST(Order);
                }
            }
            group("&Line")
            {
                Caption = '&Line';
                separator(Action71)
                {
                }
                action("Create Prod. Order")
                {
                    Caption = 'Create Prod. Order';

                    trigger OnAction();
                    var
                        NewStatus2 : Option Simulated,Planned,"Firm Planned",Released;
                        NewOrderType2 : Option ItemOrder,ProjectOrder;
                    begin
                        /*SalesPlanPage.SetSalesOrder("No.");
                        SalesPlanPage.RUNMODAL;
                        */
                        
                        //IF CreateOrderPage.RUNMODAL <> ACTION::Yes THEN
                          //EXIT;
                        
                        SalesPlanLine.DELETEALL;
                        Quantity := CurrPage.SalesLines.PAGE.MakeLines(SalesLineRec);
                        
                        NewStatus2 := NewStatus2 :: Released;
                        NewOrderType2 := NewOrderType2 :: ItemOrder;
                        //CreateOrderPage.ReturnPostingInfo(NewStatus2,NewOrderType2);
                        IF "Order Assurance"=FALSE THEN
                        ERROR('Order Was not Assured By Sales Dept.')
                        ELSE
                        BEGIN
                        FOR I := 1 TO Quantity
                          DO BEGIN
                            Qty := 1;
                            CreateOrders(Qty);
                          END;
                        END;
                        
                        //IF NOT CreateOrders THEN
                          //MESSAGE(Text001);
                        
                        //SalesPlanLine.SETRANGE("Planning Status");
                        
                        //BuildForm;
                        
                        //CurrPage.UPDATE;

                    end;
                }
            }
        }
        area(processing)
        {
            Caption = '<Action1900000004>';
            group("F&unctions")
            {
                Caption = 'F&unctions';
                separator(Action172)
                {
                }
                action("Get St&d. Cust. Sales Codes")
                {
                    Caption = 'Get St&d. Cust. Sales Codes';
                    Ellipsis = true;

                    trigger OnAction();
                    var
                        StdCustSalesCode : Record "Standard Customer Sales Code";
                    begin
                        StdCustSalesCode.InsertSalesLines(Rec);
                    end;
                }
                separator(Action171)
                {
                }
                action("Nonstoc&k Items")
                {
                    Caption = 'Nonstoc&k Items';
                    Visible = false;

                    trigger OnAction();
                    begin
                        IF NOT UpdateAllowed THEN
                          EXIT;

                        CurrPage.SalesLines.PAGE.ShowNonstockItems;
                    end;
                }
                separator(Action192)
                {
                }
                action("Copy Document")
                {
                    Caption = 'Copy Document';
                    Ellipsis = true;

                    trigger OnAction();
                    begin
                        CopySalesDoc.SetSalesHeader(Rec);
                        CopySalesDoc.RUNMODAL;
                        CLEAR(CopySalesDoc);
                    end;
                }
                action("Archi&ve Document")
                {
                    Caption = 'Archi&ve Document';

                    trigger OnAction();
                    begin
                        ArchiveManagement.ArchiveSalesDocument(Rec);
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                action("Move Negative Lines")
                {
                    Caption = 'Move Negative Lines';
                    Ellipsis = true;

                    trigger OnAction();
                    begin
                        CLEAR(MoveNegSalesLines);
                        MoveNegSalesLines.SetSalesHeader(Rec);
                        MoveNegSalesLines.RUNMODAL;
                        MoveNegSalesLines.ShowDocument;
                    end;
                }
                separator(Action195)
                {
                }
                action("Cancel Order")
                {
                    Caption = 'Cancel Order';
                    Enabled = false;

                    trigger OnAction();
                    var
                        OrderStatusValue : Text[50];
                        Text051 : Label 'Do you want to Cancel the Order No. %1';
                    begin
                        IF CONFIRM(Text051,FALSE,"No.") THEN BEGIN
                          OrderStatusValue:='Cancel';
                          CancelCloseOrder(OrderStatusValue,Rec);
                          CurrPage.UPDATE(FALSE);
                        END;
                    end;
                }
                action("Short Close Order")
                {
                    Caption = 'Short Close Order';

                    trigger OnAction();
                    var
                        OrderStatusValue : Text[50];
                        Text050 : Label 'Do you want to Short Close the Order No. %1';
                    begin
                        IF CONFIRM(Text050,FALSE,"No.") THEN BEGIN
                          OrderStatusValue:='Close';
                          CancelCloseOrder(OrderStatusValue,Rec);
                          CurrPage.UPDATE(FALSE);
                        END;
                    end;
                }
                separator(Action1102152012)
                {
                }
                action("Create &Whse. Shipment")
                {
                    Caption = 'Create &Whse. Shipment';
                    Visible = false;

                    trigger OnAction();
                    var
                        GetSourceDocOutbound : Codeunit "Get Source Doc. Outbound";
                    begin
                        GetSourceDocOutbound.CreateFromSalesOrder(Rec);
                    end;
                }
                action("Create Inventor&y Put-away / Pick")
                {
                    Caption = 'Create Inventor&y Put-away / Pick';
                    Ellipsis = true;
                    Visible = false;

                    trigger OnAction();
                    begin
                        CreateInvtPutAwayPick;
                    end;
                }
                separator(Action174)
                {
                }
                action("Re&lease")
                {
                    Caption = 'Re&lease';
                    RunObject = Codeunit "Release Sales Document";
                    ShortCutKey = 'Ctrl+F11';
                }
                action("Re&open")
                {
                    Caption = 'Re&open';

                    trigger OnAction();
                    var
                        ReleaseSalesDoc : Codeunit "Release Sales Document";
                    begin
                        ReleaseSalesDoc.Reopen(Rec);
                        /*IF ISCLEAR(MAPIHandler) THEN
                          CREATE(MAPIHandler);
                        IF user.GET(user."User ID") THEN
                        eroorno:=0;
                        MAPIHandler.ToName := 'bharat@efftronics.net';
                        MAPIHandler.ToName := 'chowdary@efftronics.net';
                        MAPIHandler.ToName := 'jhansi@efftronics.net';
                        MAPIHandler.ToName := 'anulatha@efftronics.net';
                        MAPIHandler.ToName := 'sganesh@efftronics.net';
                        MAPIHandler.ToName := 'dir@efftronics.net';
                        MAPIHandler.ToName := 'prasanthi@efftronics.net';
                        MAPIHandler.CCName := 'padmaja@efftronics.net';
                        MAPIHandler.Subject :=xRec."No."+'ORDER Reopen';
                        //OpenNewMessage('anilkumar@efftronics.net');
                        //NewMessage('anilkumar@efftronics','swarupa@efftronics.net','hai','body','attachment',TRUE);
                        MAPIHandler.AddBodyText('ORDER number in ERP'+xRec."No."+',');
                        MAPIHandler.AddBodyText(xRec."Sell-to Customer Name"+' is Reopen');
                        MAPIHandler.Send;
                        eroorno:=MAPIHandler.ErrorStatus;
                        */

                    end;
                }
                separator(Action1280032)
                {
                }
                action("Calculate Structure Values")
                {
                    Caption = 'Calculate Structure Values';

                    trigger OnAction();
                    begin
                        // NAVIN
                        SalesLine.CalculateStructures(Rec);
                        SalesLine.AdjustStructureAmounts(Rec);
                        SalesLine.UpdateSalesLines(Rec);
                        //calcamt;
                        // NAVIN
                    end;
                }
                separator(Action1280031)
                {
                }
                action("&Send BizTalk Sales Order Cnfmn.")
                {
                    Caption = '&Send BizTalk Sales Order Cnfmn.';

                    trigger OnAction();
                    begin
                        //B2b1.0>> Since BizTalkManagement CU doesn't exist
                        //BizTalkManagement.SendSalesOrderConf(Rec);
                        //B2b1.0<<
                    end;
                }
                separator(Action1102152007)
                {
                }
                action("Release To Design")
                {
                    Caption = 'Release To Design';

                    trigger OnAction();
                    var
                        Text01 : Label 'Do You want to Send the Document to Design?';
                    begin
                        IF NOT CONFIRM(Text01,FALSE) THEN
                          EXIT;
                        TESTFIELD("Document Position","Document Position"::Sales);
                        "Document Position" := "Document Position"::Design;
                        MODIFY;
                            Mail_Subject:='Order Released to Design' ;
                            Mail_Body:='Order No        : '+"No.";
                            Mail_Body+=FORMAT(newline);
                            Mail_Body+='Customer Name   : '+"Sell-to Customer Name";
                            Mail_Body+=FORMAT(newline);
                            Mail_Body+=FORMAT(newline);
                            Mail_Body+='***** Auto Mail Generated From ERP *****';
                            "Mail-Id".SETRANGE("Mail-Id"."User Security ID",USERID);
                          IF "Mail-Id".FINDFIRST THEN
                           "from Mail":="Mail-Id".MailID;
                           "to mail":='jhansi@efftronics.net,sal@efftronics.net,erp@efftronics.net,cvmohan@efftronics.net';
                             MODIFY;
                           //   IF ( "from Mail"<>'') AND ("to mail"<>'') THEN
                           // mail.NewCDOMessage("from Mail","to mail",Mail_Subject,Mail_Body,'');
                        
                        /*IF ISCLEAR(MAPIHandler) THEN
                          CREATE(MAPIHandler);
                        IF user.GET(user."User ID") THEN
                        eroorno:=0;
                        //MAPIHandler.ToName := 'anilkumar@efftronics.net';
                        MAPIHandler.ToName := 'chowdary@efftronics.net';
                        MAPIHandler.ToName := 'jhansi@efftronics.net';
                        MAPIHandler.ToName := 'anulatha@efftronics.net';
                        MAPIHandler.ToName := 'sganesh@efftronics.net';
                        MAPIHandler.ToName := 'dir@efftronics.net';
                        MAPIHandler.ToName := 'prasanthi@efftronics.net';
                        MAPIHandler.CCName := 'anilkumar@efftronics.net';
                        MAPIHandler.Subject :=xRec."No."+'ORDER Relesed to design';
                        //OpenNewMessage('anilkumar@efftronics.net');
                        //NewMessage('anilkumar@efftronics','swarupa@efftronics.net','hai','body','attachment',TRUE);
                        MAPIHandler.AddBodyText('ORDER number in ERP'+xRec."No."+',');
                        MAPIHandler.AddBodyText(xRec."Sell-to Customer Name"+' is Relesed to Design');
                        MAPIHandler.Send;
                        eroorno:=MAPIHandler.ErrorStatus;*/

                    end;
                }
                action("Update RDSO Details")
                {
                    Caption = 'Update RDSO Details';

                    trigger OnAction();
                    var
                        SalesLine : Record "Sales Line";
                    begin
                        SalesLine.SETRANGE(SalesLine."Document Type","Document Type");
                        SalesLine.SETRANGE(SalesLine."Document No.","No.");
                        IF SalesLine.FINDSET THEN
                          REPEAT
                            SalesLine."RDSO Charges Paid By" := "RDSO Charges Paid By";
                            SalesLine."RDSO Inspection Required" := "RDSO Inspection Required";
                            SalesLine."RDSO Inspection By" := "RDSO Inspection By";
                            SalesLine."RDSO Charges" := "RDSO Charges";
                            SalesLine.MODIFY;
                          UNTIL SalesLine.NEXT = 0;
                    end;
                }
                separator(Action1000000024)
                {
                }
                action("Release To Finance")
                {
                    Caption = 'Release To Finance';

                    trigger OnAction();
                    var
                        Text01 : Label 'Do You want to Send the Document to Finance?';
                    begin
                        IF NOT CONFIRM(Text01,FALSE) THEN
                          EXIT;
                        TESTFIELD("Document Position","Document Position"::Sales);
                        "Document Position" := "Document Position"::"3";
                        MODIFY;
                    end;
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                action("Test Report")
                {
                    Caption = 'Test Report';
                    Ellipsis = true;

                    trigger OnAction();
                    begin
                        ReportPrint.PrintSalesHeader(Rec);
                    end;
                }
                action("P&ost")
                {
                    Caption = 'P&ost';
                    Ellipsis = true;
                    ShortCutKey = 'F11';

                    trigger OnAction();
                    begin
                        /* vatamt:=0;
                         taxamt:=0;
                         amt:=0;
                        // NAVIN
                        IF Structure <> '' THEN BEGIN
                          SalesLine.CalculateStructures(Rec);
                          SalesLine.AdjustStructureAmounts(Rec);
                          SalesLine.UpdateSalesLines(Rec);
                          COMMIT;
                        END;
                            SalesLine.SETRANGE(SalesLine."Document No.","No.");
                            SalesLine.SETFILTER(SalesLine."Qty. to Invoice",'%1..%2',1,1000000000);
                            IF SalesLine.FINDSET THEN
                            REPEAT
                            vatamt:=(SalesLine."VAT Amount"/SalesLine.Quantity)*SalesLine."Qty. to Invoice";
                            taxamt:=(SalesLine."Tax Amount"/SalesLine.Quantity)*SalesLine."Qty. to Invoice";
                            exciseamt:=(SalesLine."Excise Amount"/SalesLine.Quantity)*SalesLine."Qty. to Invoice";
                             ecessamt:=exciseamt*2/100;
                             shecessamt:=exciseamt*1/100;
                                     amt:=amt+(SalesLine."Qty. to Invoice"*SalesLine."Unit Price")+
                                    exciseamt+vatamt+taxamt;
                                   UNTIL SalesLine.NEXT=0;
                        
                            Mail_Subject:='Sale Order : '+"No." +'for Customer :' + "Bill-to Name" + ' is Invoiced';
                            Mail_Body:='Customer Name : '+"Bill-to Name" + ',';
                            Mail_Body:=' Customer Order No : '+"Customer OrderNo." + ',' ;
                            Mail_Body+=' Invoice No :' +"External Document No."+',' ;
                            Mail_Body+=' Invoiced Amount:'+FORMAT(amt);
                           // END;
                            "Mail-Id".SETRANGE("Mail-Id"."User ID",USERID);
                             IF "Mail-Id".FINDFIRST THEN
                            "from Mail":="Mail-Id".MailID;
                           "to mail":='anilkumar@efftronics.net,ceo@efftronics.net,dir@efftronics.net,';
                           "to mail"+='anulatha@efftronics.net,ravi@efftronics.net';
                             IF ( "from Mail"<>'') AND ("to mail"<>'') THEN
                             mail.NewCDOMessage("from Mail","to mail",Mail_Subject,Mail_Body,'');
                        */
                               CODEUNIT.RUN(81,Rec);
                        
                        // NAVIN

                    end;
                }
                action("Post and &Print")
                {
                    Caption = 'Post and &Print';
                    Ellipsis = true;
                    ShortCutKey = 'Shift+F11';

                    trigger OnAction();
                    begin
                        // NAVIN
                        IF Structure <> '' THEN BEGIN
                          SalesLine.CalculateStructures(Rec);
                          SalesLine.AdjustStructureAmounts(Rec);
                          SalesLine.UpdateSalesLines(Rec);
                          COMMIT;
                        END;

                        CODEUNIT.RUN(82,Rec);

                        // NAVIN
                    end;
                }
                action("Post &Batch")
                {
                    Caption = 'Post &Batch';
                    Ellipsis = true;

                    trigger OnAction();
                    begin
                        REPORT.RUNMODAL(REPORT::"Batch Post Sales Orders",TRUE,TRUE,Rec);
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                action("Invoice Preview")
                {
                    Caption = 'Invoice Preview';

                    trigger OnAction();
                    begin
                        "sales header".SETRANGE("sales header"."No.","No.");
                        REPORT.RUN(50114,TRUE,FALSE,"sales header");
                    end;
                }
                action("Dispatch Note")
                {
                    Caption = 'Dispatch Note';

                    trigger OnAction();
                    begin
                        "sales header".SETRANGE("sales header"."No.","No.");
                        //REPORT.RUN(90000,TRUE,FALSE,SalesHeader);
                        REPORT.RUN(50107,TRUE,FALSE,"sales header");
                    end;
                }
            }
            action("&Print")
            {
                Caption = '&Print';
                Ellipsis = true;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    DocPrint.PrintSalesHeader(Rec);
                end;
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        "sales header".SETRANGE("sales header"."No.","No.");
        IF "sales header".FINDFIRST THEN
        BEGIN
        IF "sales header"."Order Assurance"=FALSE THEN
        "Order AssuranceEditable" :=TRUE
        ELSE
        "Order AssuranceEditable" :=FALSE;
        
        PT.RESET;
        PT.SETRANGE(PT.Code,"sales header"."Payment Terms Code");
        IF PT.FINDFIRST THEN
        paymenttermdesc:=PT.Description;
        
        /*IF "sales header".Authorized=FALSE THEN
        CurrPage.Authorized.EDITABLE:=TRUE
        ELSE
        CurrPage.Authorized.EDITABLE:=FALSE;
        */
        END;
        
        
        "sales header".SETRANGE("sales header"."No.","No.");
        IF "sales header".FINDFIRST THEN;
        
        //sreenivas
        
        Receivedamt:=0;
        
        CLE.SETRANGE(CLE."Customer No.","Sell-to Customer No.");
        CLE.SETRANGE(CLE."Sale Order no","No.");
        IF CLE.FINDSET THEN
        REPEAT
        CLE.CALCFIELDS(CLE.Amount);
        Receivedamt:=Receivedamt+ABS(CLE.Amount);
        UNTIL CLE.NEXT=0;
        OnAfterGetCurrRecord;

    end;

    trigger OnDeleteRecord() : Boolean;
    begin
        CurrPage.UPDATE;
        MODIFY;
        EXIT(ConfirmDeletion);
    end;

    trigger OnInit();
    begin
        RemarksEditable := TRUE;
    end;

    trigger OnInsertRecord(BelowxRec : Boolean) : Boolean;
    begin
        CheckCreditMaxBeforeInsert;
    end;

    trigger OnModifyRecord() : Boolean;
    begin
         TESTFIELD(Status,Status::Open);
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        "Responsibility Center" := UserMgt.GetSalesFilter();
        OnAfterGetCurrRecord;
    end;

    trigger OnOpenPage();
    begin
        IF UserMgt.GetSalesFilter() <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Responsibility Center",UserMgt.GetSalesFilter());
          FILTERGROUP(0);
        END;
        "sales header".SETRANGE("sales header"."No.","No.");
        IF "sales header".FINDFIRST THEN
        BEGIN
        IF "sales header"."Order Assurance"=FALSE THEN
        "Order AssuranceEditable" :=TRUE
        ELSE
        "Order AssuranceEditable" :=FALSE;
        
        PT.SETRANGE(PT.Code,"sales header"."Payment Terms Code");
        IF PT.FINDFIRST THEN
        paymenttermdesc:=PT.Description;
        /*IF "sales header".Authorized=FALSE THEN
        CurrPage.Authorized.EDITABLE:=TRUE
        ELSE
        CurrPage.Authorized.EDITABLE:=FALSE;
        */
        END ELSE
        ERROR('There Are No Orders to Authorise');
        
        "sales header".SETRANGE("sales header"."No.","No.");
        IF "sales header".FINDFIRST THEN;
        
        //sreenivas
        
        Receivedamt:=0;
        
        CLE.SETRANGE(CLE."Customer No.","Sell-to Customer No.");
        CLE.SETRANGE(CLE."Sale Order no","No.");
        IF CLE.FINDSET THEN
        REPEAT
        CLE.CALCFIELDS(CLE.Amount);
        Receivedamt:=Receivedamt+ABS(CLE.Amount);
        UNTIL CLE.NEXT=0;
        
        
        SETRANGE("Date Filter",0D,WORKDATE - 1);

    end;

    var
        Text000 : Label 'Unable to execute this function while in view only mode.';
        CopySalesDoc : Report "Copy Sales Document";
                           MoveNegSalesLines : Report "Move Negative Sales Lines";
                           ReportPrint : Codeunit "Test Report-Print";
                           DocPrint : Codeunit "Document-Print";
                           ArchiveManagement : Codeunit ArchiveManagement;
                           SalesSetup : Record "Sales & Receivables Setup";
                           UserMgt : Codeunit "User Setup Management";
                           "-NAVIN-" : Integer;
                           SalesLine : Record "Sales Line";
                           Text001 : Label 'Do you want to convert the Order to an Export order?';
        Text002 : Label 'Order number %1 has been converted to Export order number %2.';
        Text13000 : Label 'No Setup exists for this Amount.';
        Text13001 : Label 'Do you want to send the order for Authorization?';
        Text13002 : Label 'The Order Is Authorized, You Cannot Resend For Authorization';
        Text13003 : Label 'You Cannot Resend For Authorization';
        Text13004 : Label 'This Order Has been Rejected. Please Create A New Order.';
        MLTransactionType : Option Purchase,Sale;
        SalesPlanLine : Record "Sales Planning Line";
        Quantity : Decimal;
        SalesLineRec : Record "Sales Line";
        I : Integer;
        Qty : Decimal;
        NewStatus : Option Simulated,Planned,"Firm Planned",Released;
        NewOrderType : Option ItemOrder,ProjectOrder;
        MAPIHandler : Automation "'{3C2554FE-2B41-4543-B3E8-E64296773DA5}' 2.0:'{732DA1E7-C816-4530-80C4-2499346332A9}':''{3C2554FE-2B41-4543-B3E8-E64296773DA5}' 2.0'.Unknown Class";
        eroorno : Integer;
        user : Record User;
        "Mail-Id" : Record User;
        "from Mail" : Text[1000];
        "to mail" : Text[1000];
        Mail_Subject : Text[1000];
        Mail_Body : Text[1000];
        mail : Codeunit Mail;
        amt : Decimal;
        vatamt : Decimal;
        taxamt : Decimal;
        exciseamt : Decimal;
        pendingamt : Decimal;
        ecessamt : Decimal;
        shecessamt : Decimal;
        "sales header" : Record "Sales Header";
        newline : Char;
        GenJnlManagement : Codeunit GenJnlManagement;
        CurrentJnlBatchName : Code[10];
        SHA : Record "Sales Header Archive";
        CUS : Record Customer;
        Receivedamt : Decimal;
        CLE : Record "Cust. Ledger Entry";
        reject : Boolean;
        rejremrks : Text[100];
        SMTPSETUP : Record "SMTP SETUP";
        AttachFileName : Text[1000];
        objEmailConf : Automation "'{CD000000-8B95-11D1-82DB-00C04FB1625D}' 1.0:'{CD000002-8B95-11D1-82DB-00C04FB1625D}':''{CD000000-8B95-11D1-82DB-00C04FB1625D}' 1.0'.Configuration";
        objEmail : Automation "'{CD000000-8B95-11D1-82DB-00C04FB1625D}' 1.0:'{CD000001-8B95-11D1-82DB-00C04FB1625D}':''{CD000000-8B95-11D1-82DB-00C04FB1625D}' 1.0'.Message";
        flds : Automation "'{00000205-0000-0010-8000-00AA006D2EA4}' 2.5:'{00000564-0000-0010-8000-00AA006D2EA4}':''{00000205-0000-0010-8000-00AA006D2EA4}' 2.5'.Fields";
        fld : Automation "'{00000205-0000-0010-8000-00AA006D2EA4}' 2.5:'{00000569-0000-0010-8000-00AA006D2EA4}':''{00000205-0000-0010-8000-00AA006D2EA4}' 2.5'.Field";
        bodies : Integer;
        body1 : Text[1000];
        Body : Text[1000];
        Subject : Text[1000];
        Mail_To : Text[1000];
        Mail_From : Text[1000];
        Attachment : Text[1000];
        paymenttermdesc : Text[100];
        PT : Record "Payment Terms";
        [InDataSet]
        "Order AssuranceEditable" : Boolean;
        [InDataSet]
        RemarksEditable : Boolean;

    (21985)]
    procedure UpdateAllowed() : Boolean;
    begin
        IF CurrPage.EDITABLE = FALSE THEN
          ERROR(Text000);
        EXIT(TRUE);
    end;

    (21990)]
    procedure "---NAVIN---"();
    begin
    end;

    (21993)]
    procedure ConvertOrdertoExportOrder(var Rec : Record "Sales Header");
    var
        OldSalesCommentLine : Record "Sales Comment Line";
        SalesExportOrderHeader : Record "Sales Header";
        SalesExportOrderLine : Record "Sales Line";
        SalesCommentLine : Record "Sales Comment Line";
        ItemChargeAssgntSales : Record "Item Charge Assignment (Sales)";
        ReserveSalesLine : Codeunit "Sales Line-Reserve";
        SalesOrderLine : Record "Sales Line";
    begin
        IF NOT CONFIRM(Text001,FALSE) THEN
          EXIT;
        SalesExportOrderHeader := Rec;
        SalesExportOrderHeader."Document Type" := SalesExportOrderHeader."Document Type"::Order;
        //SalesExportOrderHeader."Export Document" := TRUE;
        SalesExportOrderHeader."No. Printed" := 0;
        SalesExportOrderHeader.Status := SalesExportOrderHeader.Status::Open;
        SalesExportOrderHeader."No." := '';
        
        SalesExportOrderLine.LOCKTABLE;
        SalesExportOrderHeader.INSERT(TRUE);
        
        //DIM1.0 Start
        //Code Commented
        /*
        FromDocDim.SETRANGE("Table ID",DATABASE::"Purchase Header");
        FromDocDim.SETRANGE("Document Type","Document Type");
        FromDocDim.SETRANGE("Document No.","No.");
        
        ToDocDim.SETRANGE("Table ID",DATABASE::"Purchase Header");
        ToDocDim.SETRANGE("Document Type",SalesExportOrderHeader."Document Type");
        ToDocDim.SETRANGE("Document No.",SalesExportOrderHeader."No.");
        ToDocDim.DELETEALL;
        
        IF FromDocDim.FINDSET THEN BEGIN
          REPEAT
            ToDocDim.INIT;
            ToDocDim."Table ID" := DATABASE::"Purchase Header";
            ToDocDim."Document Type" := SalesExportOrderHeader."Document Type";
            ToDocDim."Document No." := SalesExportOrderHeader."No.";
            ToDocDim."Line No." := 0;
            ToDocDim."Dimension Code" := FromDocDim."Dimension Code";
            ToDocDim."Dimension Value Code" := FromDocDim."Dimension Value Code";
            ToDocDim.INSERT;
          UNTIL FromDocDim.NEXT = 0;
        END;
        */
        //DIM1.0 End
        
        SalesExportOrderHeader."Order Date" := "Order Date";
        SalesExportOrderHeader."Posting Date" := "Posting Date";
        SalesExportOrderHeader."Document Date" := "Document Date";
        SalesExportOrderHeader."Shipment Date" := "Shipment Date";
        SalesExportOrderHeader."Shortcut Dimension 1 Code" := "Shortcut Dimension 1 Code";
        SalesExportOrderHeader."Shortcut Dimension 2 Code" := "Shortcut Dimension 2 Code";
        
        //DIM1.0
        SalesExportOrderHeader."Dimension Set ID" := "Dimension Set ID";
        //DIM1.0
        
        /*SalesExportOrderHeader."Date Received" := 0D;
        SalesExportOrderHeader."Time Received" := 0T;
        SalesExportOrderHeader."Date Sent" := 0D;
        SalesExportOrderHeader."Time Sent" := 0T;*///B2b1.0 Since Fields doesn't exist in Nav 2013
        SalesExportOrderHeader."posting time":=TIME;
        SalesExportOrderHeader.MODIFY;
        
        SalesOrderLine.SETRANGE("Document Type","Document Type");
        SalesOrderLine.SETRANGE("Document No.","No.");
        
        //DIM1.0 Start
        //Code Commented
        /*
        FromDocDim.SETRANGE("Table ID",DATABASE::"Purchase Line");
        ToDocDim.SETRANGE("Table ID",DATABASE::"Purchase Line");
        */
        //DIM1.0 End
        
        IF SalesOrderLine.FINDSET THEN
          REPEAT
            SalesExportOrderLine := SalesOrderLine;
            SalesExportOrderLine."Document Type" := SalesExportOrderHeader."Document Type";
            SalesExportOrderLine."Document No." := SalesExportOrderHeader."No.";
            SalesExportOrderLine."Shipment Date" := SalesExportOrderHeader."Shipment Date";
            ReserveSalesLine.TransferSaleLineToSalesLine(
              SalesOrderLine,SalesExportOrderLine,SalesOrderLine."Reserved Qty. (Base)");
            SalesExportOrderLine."Shortcut Dimension 1 Code" := SalesOrderLine."Shortcut Dimension 1 Code";
            SalesExportOrderLine."Shortcut Dimension 2 Code" := SalesOrderLine."Shortcut Dimension 2 Code";
            //DIM1.0 Start
            SalesExportOrderLine."Dimension Set ID" := SalesOrderLine."Dimension Set ID";
            //DIM1.0 End
            SalesExportOrderLine.INSERT;
        
            //DIM1.0 Start
            //Code Commented
            /*
            FromDocDim.SETRANGE("Line No.",SalesOrderLine."Line No."); //B2b1.0
        
            ToDocDim.SETRANGE("Line No.",SalesExportOrderLine."Line No.");
            ToDocDim.DELETEALL;
        
             IF FromDocDim.FINDSET THEN BEGIN
              REPEAT
                ToDocDim.INIT;
                ToDocDim."Table ID" := DATABASE::"Purchase Line";
                ToDocDim."Document Type" := SalesExportOrderHeader."Document Type";
                ToDocDim."Document No." := SalesExportOrderHeader."No.";
                ToDocDim."Line No." := SalesExportOrderLine."Line No.";
                ToDocDim."Dimension Code" := FromDocDim."Dimension Code";
                ToDocDim."Dimension Value Code" := FromDocDim."Dimension Value Code";
                ToDocDim.INSERT;
              UNTIL FromDocDim.NEXT = 0;
            END;
            */
            //DIM1.0 End
        
        
          UNTIL SalesOrderLine.NEXT = 0;
        
        SalesCommentLine.SETRANGE("Document Type","Document Type");
        SalesCommentLine.SETRANGE("No.","No.");
        IF NOT SalesCommentLine.ISEMPTY THEN BEGIN
          SalesCommentLine.LOCKTABLE;
          IF SalesCommentLine.FINDSET THEN
            REPEAT
              OldSalesCommentLine := SalesCommentLine;
              SalesCommentLine.DELETE;
              SalesCommentLine."Document Type" := SalesExportOrderHeader."Document Type";
              SalesCommentLine."No." := SalesExportOrderHeader."No.";
              SalesCommentLine.INSERT;
              SalesCommentLine := OldSalesCommentLine;
            UNTIL SalesCommentLine.NEXT = 0;
        END;
        
        ItemChargeAssgntSales.RESET;
        ItemChargeAssgntSales.SETRANGE("Document Type","Document Type");
        ItemChargeAssgntSales.SETRANGE("Document No.","No.");
        
        WHILE ItemChargeAssgntSales.FINDFIRST DO BEGIN
          ItemChargeAssgntSales.DELETE;
          ItemChargeAssgntSales."Document Type" := SalesExportOrderHeader."Document Type";
          ItemChargeAssgntSales."Document No." := SalesExportOrderHeader."No.";
          IF NOT (ItemChargeAssgntSales."Applies-to Doc. Type" IN
            [ItemChargeAssgntSales."Applies-to Doc. Type"::Shipment,
             ItemChargeAssgntSales."Applies-to Doc. Type"::"Return Receipt"])
          THEN BEGIN
            ItemChargeAssgntSales."Applies-to Doc. Type" := SalesExportOrderHeader."Document Type";
            ItemChargeAssgntSales."Applies-to Doc. No." := SalesExportOrderHeader."No.";
          END;
          ItemChargeAssgntSales.INSERT;
        END;
        
        DELETE;
        SalesOrderLine.DELETEALL;
        //DIM1.0 Start
        //Code Commented
        /*
        FromDocDim.SETRANGE("Line No.");
        FromDocDim.DELETEALL;
        */
        //DIM1.0 End
        
        MESSAGE(
          Text002,
          "No.",SalesExportOrderHeader."No.");

    end;

    (22150)]
    procedure "---B2B---"();
    begin
    end;

    (22153)]
    procedure DocumentPosition();
    begin
        /*
        IF "Document Position" = "Document Position" :: Design THEN
          CurrPage.EDITABLE := FALSE
        ELSE
          CurrPage.EDITABLE := TRUE;
        */

    end;

    (22161)]
    procedure CreateOrders(Qtyparam : Decimal) OrdersCreated : Boolean;
    var
        Item : Record Item;
        SalesLine : Record "Sales Line";
        ProdOrderFromSale : Codeunit "Create Prod. Order from Sale";
    begin
        IF NOT SalesPlanLine.FINDSET THEN
          EXIT;

        REPEAT
          SalesLine.GET(
            SalesLine."Document Type"::Order,
            SalesPlanLine."Sales Order No.",
            SalesPlanLine."Sales Order Line No.");
            //SalesLine.TESTFIELD("Shipment Date");
            MESSAGE('anil');//anil
          SalesLine.CALCFIELDS("Reserved Qty. (Base)");
          //IF SalesLine."Outstanding Qty. (Base)" > SalesLine."Reserved Qty. (Base)" THEN BEGIN
            Item.GET(SalesLine."No.");

            IF Item."Replenishment System" = Item."Replenishment System"::"Prod. Order" THEN BEGIN
              OrdersCreated := TRUE;
              ProdOrderFromSale.CreateProdOrder2(
                SalesLine,NewStatus::Released,NewOrderType::ItemOrder,1);
              IF NewOrderType = NewOrderType::ProjectOrder THEN
                EXIT;
            END;
          //END;
        UNTIL (SalesPlanLine.NEXT = 0);
    end;

    (22186)]
    procedure calcamt();
    begin
        "Sale Order Total Amount":=0;
        SalesLine.SETRANGE(SalesLine."Document No.","No.");
        IF SalesLine.FINDSET THEN
         REPEAT
          "Sale Order Total Amount"+=SalesLine."Line Amount"+SalesLine."Excise Amount"+SalesLine."Tax Amount"+SalesLine."Tax Amount";
         UNTIL SalesLine.NEXT=0;
         MODIFY;
    end;

    (22195)]
    procedure NewCDOMessage("From Name" : Text[100];"To Name" : Text[1000];Subject : Text[1000];Body : Text[1000];AttachFileName : Text[250]);
    begin
        /*
        SMTPSETUP.SETFILTER(SMTPSETUP."SMTP Server name",'mail.efftronics.com');
        IF SMTPSETUP.FINDFIRST  THEN
        BEGIN
        SMTPSETUP.TESTFIELD(SMTPSETUP."SMTP Server name");
        SMTPSETUP.TESTFIELD(SMTPSETUP."SMTP Port No");
        SMTPSETUP.TESTFIELD(SMTPSETUP."E-Mail From");
        END;
        IF ISCLEAR(objEmailConf) THEN
          CREATE(objEmailConf);
        flds := objEmailConf.Fields;
        
        fld := flds.Item('http://schemas.microsoft.com/cdo/configuration/smtpserver');
        fld.Value(SMTPSETUP."SMTP Server name");
        
        fld := flds.Item('http://schemas.microsoft.com/cdo/configuration/smtpserverport');
        fld.Value(SMTPSETUP."SMTP Port No");
        
        fld := flds.Item('http://schemas.microsoft.com/cdo/configuration/sendusing');
        fld.Value(2);
        
        flds.Update();
        
        IF ISCLEAR(objEmail) THEN CREATE(objEmail);
        //objEmail.Configuration := objEmailConf;
        objEmail.From :="From Name";
        objEmail."To" :="To Name";
        
        IF AttachFileName <> '' THEN
        BEGIN
          objEmail.AddAttachment(AttachFileName);
          IF Body='' THEN
            objEmail.TextBody :=' ';
        END;
        
        objEmail.Subject := Subject;
        objEmail.TextBody:=Body;
        //objEmail.HTMLBody:=Body;
        objEmail.Send;
        CLEAR(objEmail);
         */

    end;

    (22238)]
    local procedure SelltoCustomerNoOnAfterValidat();
    begin
        CurrPage.UPDATE;
    end;

    (22241)]
    local procedure OnAfterGetCurrRecord();
    begin
        xRec := Rec;
        DocumentPosition;
    end;
}

