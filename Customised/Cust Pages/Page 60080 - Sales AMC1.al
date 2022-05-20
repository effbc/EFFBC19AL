page 60080 "Sales AMC1"
{
    // version NAVW13.70,NAVIN3.70.00.13,B2B1.0,DIM1.0,Rev01

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
    SourceTableView = SORTING(Document Type,No.) ORDER(Ascending) WHERE(Document Type=CONST(Amc));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No.";"No.")
                {

                    trigger OnAssistEdit();
                    begin
                        IF AssistEdit(xRec) THEN
                          CurrPage.UPDATE;
                    end;
                }
                field("Sell-to Customer No.";"Sell-to Customer No.")
                {

                    trigger OnValidate();
                    begin
                        CUS.SETRANGE(CUS."No.","Sell-to Customer No.");
                        IF CUS.FINDFIRST THEN
                        Territory:=CUS."Territory Code";
                          SelltoCustomerNoOnAfterValidat;
                    end;
                }
                field("Customer Posting Group";"Customer Posting Group")
                {
                    Editable = false;
                }
                field("Sell-to Customer Name";"Sell-to Customer Name")
                {
                    Editable = false;
                }
                field("Sell-to Address";"Sell-to Address")
                {
                }
                field("Sell-to Address 2";"Sell-to Address 2")
                {
                }
                field("Sell-to Post Code";"Sell-to Post Code")
                {
                    Caption = 'Sell-to Post Code/City';
                }
                field("Sell-to City";"Sell-to City")
                {
                }
                field(State;State)
                {
                    Editable = true;
                }
                field(Control1280009;Structure)
                {
                }
                field(Status;Status)
                {
                }
                field("Installation Amount";"Installation Amount")
                {
                }
                field("Bought out Items Amount";"Bought out Items Amount")
                {
                }
                field(Product;Product)
                {
                }
                field("Pending(LOA)Value";"Pending(LOA)Value")
                {
                }
                field("Posting Date";"Posting Date")
                {
                }
                field("Order Date";"Order Date")
                {
                }
                field("Shipment Date";"Shipment Date")
                {
                }
                field("Requested Delivery Date";"Requested Delivery Date")
                {
                    Caption = 'Amc Period  Start Date';

                    trigger OnValidate();
                    begin
                          IF "Order Date">"Requested Delivery Date" THEN
                             ERROR('Requested Delivery Date Must be Greater than Order Date');
                    end;
                }
                field("Promised Delivery Date";"Promised Delivery Date")
                {
                    Caption = 'Amc Period  End  Date';

                    trigger OnValidate();
                    begin
                        IF "Requested Delivery Date" > "Promised Delivery Date" THEN
                          ERROR('AMC Start Date must be less than AMC END Date!');
                    end;
                }
                field(InvoiceNos;InvoiceNos)
                {
                    Caption = 'INVOICE NO SERIES';

                    trigger OnValidate();
                    begin
                        IF "Posting Date" =0D THEN
                          ERROR('Enter posting date');
                        ExtenalDocNo(InvoiceNos,"Posting Date");

                        //ChooseInvoice;
                    end;
                }
                field("External Document No.";"External Document No.")
                {
                    Caption = 'Invoice Number';
                }
                field("Salesperson Code";"Salesperson Code")
                {
                    CaptionML = ENU='Salesperson/CS Manager Code',
                                ENN='Salesperson Code';
                }
                field("Project Completion Date";"Project Completion Date")
                {
                }
                field("Extended Date";"Extended Date")
                {
                }
                field("Order Assurance";"Order Assurance")
                {
                    Editable = "Order AssuranceEditable";

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
                        
                        IF "Order Assurance"=TRUE AND (Status=Status::Open) THEN
                        BEGIN
                        "Order AssuranceEditable" := FALSE;
                        "Assured Date":=TODAY;
                        END ELSE
                        "Order AssuranceEditable" := TRUE;

                    end;
                }
                field("Security Deposit Status";"Security Deposit Status")
                {
                    Caption = 'Status';
                }
                field("Sale Order Total Amount";"Sale Order Total Amount")
                {
                    Editable = true;

                    trigger OnValidate();
                    begin
                        /*
                        ShippedCount := 0;
                        SalesLine.RESET;
                        SalesLine.SETCURRENTKEY("Document Type","Document No.","Line No.");
                        SalesLine.SETFILTER(SalesLine."Document Type",'%1',SalesLine."Document Type"::Amc);
                        SalesLine.SETFILTER(SalesLine."Document No.","No.");
                        IF SalesLine.FINDSET THEN
                        REPEAT
                          IF SalesLine."Quantity Shipped" = 1 THEN
                            ShippedCount := ShippedCount+1;
                        UNTIL SalesLine.NEXT=0;
                        IF ShippedCount > 0 THEN
                          ERROR('Shipement is completed for some lines.\ You can not change Order Amount!');
                        */

                    end;
                }
                field("Customer OrderNo.";"Customer OrderNo.")
                {
                }
                field("Customer Order Date";"Customer Order Date")
                {
                }
                field(Vertical;Vertical)
                {
                }
            }
            part(SalesLines;"Sales Amc Subform")
            {
                SubPageLink = Document No.=FIELD(No.);
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';
                field("Bill-to Customer No.";"Bill-to Customer No.")
                {

                    trigger OnValidate();
                    begin
                        BilltoCustomerNoOnAfterValidat;
                    end;
                }
                field("Bill-to Contact No.";"Bill-to Contact No.")
                {
                }
                field("Bill-to Name";"Bill-to Name")
                {
                }
                field("Bill-to Address";"Bill-to Address")
                {
                }
                field("Bill-to Address 2";"Bill-to Address 2")
                {
                }
                field("Bill-to Post Code";"Bill-to Post Code")
                {
                    Caption = 'Bill-to Post Code/City';
                }
                field("Bill-to City";"Bill-to City")
                {
                }
                field("Bill-to Contact";"Bill-to Contact")
                {
                }
                field("Tax Area Code";"Tax Area Code")
                {
                    Editable = false;
                }
                field("Form Code";"Form Code")
                {
                }
                field("Form No.";"Form No.")
                {
                }
                field("No. Series";"No. Series")
                {
                    Editable = true;
                }
                field("Payment Discount %";"Payment Discount %")
                {
                    Caption = 'Expected Payment %';
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {

                    trigger OnValidate();
                    begin
                        ShortcutDimension1CodeOnAfterV;
                    end;
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {

                    trigger OnValidate();
                    begin
                        ShortcutDimension2CodeOnAfterV;
                    end;
                }
                field("Currency Code";"Currency Code")
                {
                }
                field("Payment Terms Code";"Payment Terms Code")
                {

                    trigger OnValidate();
                    begin
                        IF "Payment Terms Code" = 'QUART' THEN     //pranavi
                          VALIDATE("Payment Terms Code",'QUARTER');
                    end;
                }
                field("Due Date";"Due Date")
                {
                }
                field("Payment Method Code";"Payment Method Code")
                {
                }
                field("LC No.";"LC No.")
                {
                }
                field("No. of Archived Versions";"No. of Archived Versions")
                {

                    trigger OnDrillDown();
                    var
                        SalesHeaderArchive : Record "Sales Header Archive";
                    begin
                        CurrPage.SAVERECORD;
                        COMMIT;
                        SalesHeaderArchive.SETRANGE("Document Type","Document Type"::Order);
                        SalesHeaderArchive.SETRANGE("No.","No.");
                        SalesHeaderArchive.SETRANGE("Doc. No. Occurrence","Doc. No. Occurrence");
                        IF SalesHeaderArchive.GET("Document Type"::Order,"No.","Doc. No. Occurrence","No. of Archived Versions") THEN ;
                        PAGE.RUNMODAL(PAGE::"Sales List Archive",SalesHeaderArchive);
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                field("Language Code";"Language Code")
                {
                }
                field("Transport Method";"Transport Method")
                {
                }
                field("Tender No.";"Tender No.")
                {
                    Editable = false;
                }
                field("Posting from Whse. Ref.";"Posting from Whse. Ref.")
                {
                    Caption = 'Amc Visit Period (in Days)';
                    Editable = PostingfromWhseRefEditable;

                    trigger OnValidate();
                    begin
                          IF "Posting from Whse. Ref." >0 THEN
                            PostingfromWhseRefEditable :=FALSE
                          ELSE
                            PostingfromWhseRefEditable :=TRUE;
                    end;
                }
            }
            group(Shipping)
            {
                Caption = 'Shipping';
                field("Ship-to Code";"Ship-to Code")
                {
                }
                field("Ship-to Name";"Ship-to Name")
                {
                }
                field("Ship-to Address";"Ship-to Address")
                {
                }
                field("Ship-to Address 2";"Ship-to Address 2")
                {
                }
                field("Ship-to Post Code";"Ship-to Post Code")
                {
                    Caption = 'Ship-to Post Code/City';
                }
                field("Ship-to City";"Ship-to City")
                {
                }
                field("Ship-to Contact";"Ship-to Contact")
                {
                }
                field("Transit Document";"Transit Document")
                {
                }
                field("Posting No. Series";"Posting No. Series")
                {
                }
                field("Shipping No. Series";"Shipping No. Series")
                {
                }
                field("MSPT Date";"MSPT Date")
                {
                }
                field("MSPT Code";"MSPT Code")
                {
                }
                field("<Transport Method2>";"Transport Method")
                {
                }
                field("Location Code";"Location Code")
                {
                }
                field("Shipment Method Code";"Shipment Method Code")
                {
                }
                field("Shipping Agent Code";"Shipping Agent Code")
                {
                }
                field("Shipping Agent Service Code";"Shipping Agent Service Code")
                {
                }
                field("Shipping Time";"Shipping Time")
                {
                    Editable = true;
                }
                field("Late Order Shipping";"Late Order Shipping")
                {
                }
                field("Package Tracking No.";"Package Tracking No.")
                {
                }
                field("<Shipment Date2>";"Shipment Date")
                {

                    trigger OnValidate();
                    begin
                         SalesLine."Shipment Date":="Posting Date";
                    end;
                }
                field("Shipping Advice";"Shipping Advice")
                {
                }
                field(WayBillNo;WayBillNo)
                {
                }
                field(Territory;Territory)
                {
                }
            }
            group("Installtion Status")
            {
                Caption = 'Installtion Status';
                field(Installation;Installation)
                {
                }
                field("Inst.Status";"Inst.Status")
                {
                }
                field("Inst.Start Date";"Inst.Start Date")
                {
                    Caption = 'Base Plan Start date';
                }
                field("Assured Date";"Assured Date")
                {
                }
                field("EU 3-Party Trade";"EU 3-Party Trade")
                {
                    Visible = false;
                }
                field("Transaction Type";"Transaction Type")
                {
                    Visible = false;
                }
                field("Transaction Specification";"Transaction Specification")
                {
                    Visible = false;
                }
                field("<Transport Method3>";"Transport Method")
                {
                    Visible = false;
                }
                field("Exit Point";"Exit Point")
                {
                    Visible = false;
                }
                field("Area";Area)
                {
                    Visible = false;
                }
            }
            group("Sales Status")
            {
                Caption = 'Sales Status';
                field("Order Status";"Order Status")
                {
                }
                field(Inspection;Inspection)
                {
                }
                field(CallLetterExpireDate;CallLetterExpireDate)
                {
                }
                field(CallLetterRecivedDate;CallLetterRecivedDate)
                {
                }
                field("Call letters Status";"Call letters Status")
                {
                }
                field("Call Letter Exp.Date";"Call Letter Exp.Date")
                {
                }
                field("BG Status";"BG Status")
                {

                    trigger OnValidate();
                    begin
                        IF "BG Status" = "BG Status"::Submitted THEN
                        BEGIN
                        "from Mail":='erp@efftronics.com';
                        "to mail":='sganesh@efftronics.com,rajani@efftronics.com,yesu@efftronics.com';
                        Subject:='BG Submitted for Order No: '+FORMAT("No.");
                        Body:='************* Auto Mail Generated from ERP *******************';
                        SMTP_Mail.CreateMessage('ERP',"from Mail","to mail",Subject,Body,TRUE);
                        SMTP_Mail.Send;
                        //NewCDOMessage("from Mail","to mail",Subject,Body,'');
                        // CODE WAS COMMETED FOR NAVISION UPGRADATION
                        END;
                    end;
                }
                field("<Payment Terms Code2>";"Payment Terms Code")
                {
                }
                field("Exp.Payment";"Exp.Payment")
                {
                    Caption = 'BG Value';
                }
                field("CA Date";"CA Date")
                {
                }
                field("Posting No.";"Posting No.")
                {
                    Visible = false;
                }
            }
            group(" Others")
            {
                Caption = '" Others"';
                field("RDSO Charges Paid By";"RDSO Charges Paid By")
                {
                }
                field("RDSO Inspection Req";"RDSO Inspection Req")
                {
                }
                field("RDSO Inspection By";"RDSO Inspection By")
                {
                }
                field("RDSO Charges";"RDSO Charges")
                {
                }
                field("RDSO Call Letter";"RDSO Call Letter")
                {
                }
                field("<Tender No2.>";"Tender No.")
                {
                }
                field("LD Amount";"LD Amount")
                {
                }
                field("Document Position";"Document Position")
                {
                }
                field("Reason Code";"Reason Code")
                {
                }
                field(Remarks;Remarks)
                {
                }
            }
            group("Security Deposit")
            {
                Caption = 'Security Deposit';
                field("Security Deposit Amount";"Security Deposit Amount")
                {
                }
                field("EMD Amount";"EMD Amount")
                {
                }
                field("Deposit Payment Due Date";"Deposit Payment Due Date")
                {
                }
                field("Deposit Payment Date";"Deposit Payment Date")
                {
                }
                field("<Security Deposit Status2>";"Security Deposit Status")
                {
                }
                field("SD Requested Date";"SD Requested Date")
                {
                }
                field("SD Required Date";"SD Required Date")
                {
                }
                field("SecurityDeposit Exp. Rcpt Date";"SecurityDeposit Exp. Rcpt Date")
                {
                }
                field("Final Bill Date";"Final Bill Date")
                {
                }
                field("Warranty Period";"Warranty Period")
                {
                }
                field("<Due Date2>";"Due Date")
                {
                }
                field("SD Status";"SD Status")
                {
                }
                field("SD Mode";"Security Deposit")
                {
                    Caption = 'SD Mode';
                }
            }
            group("Tax Information")
            {
                CaptionML = ENU='Tax Information',
                            ENN='Tax Information';
                field("Free Supply";"Free Supply")
                {
                }
                field("TDS Certificate Receivable";"TDS Certificate Receivable")
                {
                }
                field("Calc. Inv. Discount (%)";"Calc. Inv. Discount (%)")
                {
                }
                field("Export or Deemed Export";"Export or Deemed Export")
                {
                }
                field("VAT Exempted";"VAT Exempted")
                {
                }
                field("Nature of Services";"Nature of Services")
                {
                }
                field(Trading;Trading)
                {
                }
                field("ST Pure Agent";"ST Pure Agent")
                {
                }
                field(PoT;PoT)
                {
                }
                field("Posting Date2";"Posting Date")
                {
                    CaptionML = ENU='Date of Removal',
                                ENN='Date of Removal';
                }
                field("Time of Removal";"Time of Removal")
                {
                    CaptionML = ENU='Time of Removal',
                                ENN='Time of Removal';
                }
                field("Mode of Transport";"Mode of Transport")
                {
                    CaptionML = ENU='Mode of Transport',
                                ENN='Mode of Transport';
                }
                field("Vehicle No.";"Vehicle No.")
                {
                    CaptionML = ENU='Vehicle No.',
                                ENN='Vehicle No.';
                }
                field("LR/RR No.";"LR/RR No.")
                {
                    CaptionML = ENU='LR/RR No.',
                                ENN='LR/RR No.';
                }
                field("LR/RR Date";"LR/RR Date")
                {
                    CaptionML = ENU='LR/RR Date',
                                ENN='LR/RR Date';
                }
                field("Service Tax Rounding Precision";"Service Tax Rounding Precision")
                {
                }
                field("Service Tax Rounding Type";"Service Tax Rounding Type")
                {
                }
                group(GST)
                {
                    CaptionML = ENU='GST',
                                ENN='GST';
                    field("GST Bill-to State Code";"GST Bill-to State Code")
                    {
                        Editable = true;
                    }
                    field("GST Ship-to State Code";"GST Ship-to State Code")
                    {
                        Editable = true;
                    }
                    field("Location State Code";"Location State Code")
                    {
                        Editable = true;
                    }
                    field("Nature of Supply";"Nature of Supply")
                    {
                    }
                    field("GST Customer Type";"GST Customer Type")
                    {
                        Editable = true;
                    }
                    field("GST Without Payment of Duty";"GST Without Payment of Duty")
                    {
                    }
                    field("Invoice Type";"Invoice Type")
                    {
                    }
                    field("Ship-to GST Reg. No.";"Ship-to GST Reg. No.")
                    {
                    }
                    field("Customer GST Reg. No.";"Customer GST Reg. No.")
                    {
                        Editable = true;
                    }
                    field("GST Inv. Rounding Precision";"GST Inv. Rounding Precision")
                    {
                    }
                    field("GST Inv. Rounding Type";"GST Inv. Rounding Type")
                    {
                    }
                    field("Bill Of Export No.";"Bill Of Export No.")
                    {
                    }
                    field("Bill Of Export Date";"Bill Of Export Date")
                    {
                    }
                    field("e-Commerce Customer";"e-Commerce Customer")
                    {

                        trigger OnValidate();
                        var
                            Customer : Record Customer;
                        begin
                        end;
                    }
                    field("e-Commerce Merchant Id";"e-Commerce Merchant Id")
                    {
                    }
                }
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
                Image = "Order";
                action(Statistics)
                {
                    Caption = 'Statistics';
                    Image = Statistics;
                    ShortCutKey = 'F7';

                    trigger OnAction();
                    begin
                        SalesSetup.GET;
                        IF SalesSetup."Calc. Inv. Discount" THEN BEGIN
                          CurrPage.SalesLines.PAGE.CalcInvDisc;
                          COMMIT
                        END;
                        PAGE.RUNMODAL(PAGE::"Sales Order Statistics",Rec);
                    end;
                }
                action(Card)
                {
                    Caption = 'Card';
                    Image = Customer;
                    RunObject = Page "Customer Card";
                    RunPageLink = No.=FIELD(Sell-to Customer No.);
                    ShortCutKey = 'Shift+F5';
                }
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Image = Comment;
                    RunObject = Page "Sales Comment Sheet";
                    RunPageLink = Document Type=FIELD(Document Type),No.=FIELD(No.);
                }
                action("S&hipments")
                {
                    Caption = 'S&hipments';
                    Image = Shipment;
                    RunObject = Page "Posted Sales Shipments";
                    RunPageLink = Order No.=FIELD(No.);
                    RunPageView = SORTING(Order No.);
                }
                action(Invoices)
                {
                    Caption = 'Invoices';
                    Image = Invoice;
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
                    Image = Documents;
                    RunObject = Page "Transit Document Order Details";
                    RunPageLink = Type=CONST(Sale),PO / SO No.=FIELD(No.),Vendor / Customer Ref.=FIELD(Sell-to Customer No.);
                }
                action(Structure)
                {
                    Caption = 'Structure';
                    Image = TaxDetail;
                    RunObject = Page "Structure Order Details";
                    RunPageLink = Type=CONST(Sale),Document Type=FIELD(Document Type),Document No.=FIELD(No.),Structure Code=FIELD(Structure);
                }
                action("Authorization Information")
                {
                    Caption = 'Authorization Information';
                    Image = AuthorizeCreditCard;
                    RunObject = Page "VAT Opening Detail";
                    RunPageLink = Transaction Type=CONST(Sale),Document Type=FIELD(Document Type),Document No.=FIELD(No.);
                }
                separator(Action173)
                {
                }
                action("Whse. Shipment Lines")
                {
                    Caption = 'Whse. Shipment Lines';
                    Image = WarehouseRegisters;
                    RunObject = Page "Whse. Shipment Lines";
                    RunPageLink = Source Type=CONST(37),Source Subtype=FIELD(Document Type),Source No.=FIELD(No.);
                    RunPageView = SORTING(Source Type,Source Subtype,Source No.,Source Line No.);
                    Visible = false;
                }
                action("In&vt. Put-away/Pick Lines")
                {
                    Caption = 'In&vt. Put-away/Pick Lines';
                    Image = PutawayLines;
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
                    Image = Planning;

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
                    Image = OrderPromising;

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
                    Image = CheckList;
                    RunObject = Page "Check List";
                    RunPageLink = Document Type=CONST(Sales),Document No.=FIELD(No.);
                }
                action("&MSPT Order Details")
                {
                    Caption = '&MSPT Order Details';
                    Image = "Order";
                    RunObject = Page "MSPT Order Details";
                    RunPageLink = Type=CONST(Sale),Document Type=FIELD(Document Type),Document No.=FIELD(No.),MSPT Header Code=FIELD(MSPT Code),Party No.=FIELD(Sell-to Customer No.);
                }
                action(Schedule)
                {
                    Caption = 'Schedule';
                    Image = Timesheet;
                    RunObject = Page Schedule;
                    RunPageLink = Document No.=FIELD(Tender No.),Document Type=CONST(Order);
                }
                action("Get Lines")
                {
                    Image = GetLines;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        //Added by Pranavi on 30-09-2015
                        //IF USERID IN ['EFFTRONICS\PRANAVI,EFFTRONICS\ANILKUMAR,EFFTRONICS\YESU'] THEN
                        //BEGIN
                        IF Status <> Status::Open THEN
                          ERROR('Status Must be in Open!');
                        IF "Requested Delivery Date" = 0D THEN
                          ERROR('Please select AMC Period Start Date!');
                        IF "Promised Delivery Date" = 0D THEN
                          ERROR('Please select AMC Period End Date!');
                        IF "Requested Delivery Date" > "Promised Delivery Date" THEN
                          ERROR('AMC Start Date must be less than AMC END Date!');
                        IF ("Payment Terms Code" = '') OR ("Payment Terms Code" = ' ') THEN
                          ERROR('Please select Payment Terms Code!');
                        IF "Sale Order Total Amount" = 0 THEN
                          ERROR('Please enter Sale Order Total Amount!');
                        IF NOT ("Payment Terms Code" IN ['QUARTER','HALFYEARLY','YEAR']) THEN
                          ERROR('Payment terms must be in (QUARTER, HALFYEARLY, YEAR)');
                        date1 := "Requested Delivery Date";
                        NoOfLines := 0;
                        NoOfLines1 := 0;
                        LineNo:=10000;
                        ShippedCount := 0;
                        SalesLine.RESET;
                        SalesLine.SETCURRENTKEY("Document Type","Document No.","Line No.");
                        SalesLine.SETFILTER(SalesLine."Document Type",'%1',SalesLine."Document Type"::Amc);
                        SalesLine.SETFILTER(SalesLine."Document No.","No.");
                        IF SalesLine.FINDSET THEN
                        REPEAT
                          IF SalesLine."Quantity Shipped" = 1 THEN
                            ShippedCount := ShippedCount+1;
                        UNTIL SalesLine.NEXT=0;
                        IF ShippedCount > 0 THEN
                          ERROR('Shipement is completed for some lines.\ You can not update Lines!');
                        SalesLine.RESET;
                        SalesLine.SETCURRENTKEY("Document Type","Document No.","Line No.");
                        SalesLine.SETFILTER(SalesLine."Document Type",'%1',SalesLine."Document Type"::Amc);
                        SalesLine.SETFILTER(SalesLine."Document No.","No.");
                        IF SalesLine.FINDFIRST THEN
                          IF NOT (CONFIRM('Already Lines present!\ Are sure you want to update the Lines ?',FALSE)) THEN
                            EXIT
                          ELSE
                          BEGIN
                            SalesLineRec.RESET;
                            SalesLineRec.SETCURRENTKEY("Document Type","Document No.","Line No.");
                            SalesLineRec.SETFILTER(SalesLineRec."Document Type",'%1',SalesLineRec."Document Type"::Amc);
                            SalesLineRec.SETFILTER(SalesLineRec."Document No.","No.");
                            IF SalesLineRec.FIND('-') THEN
                              SalesLineRec.DELETEALL;
                          END;
                        CASE "Payment Terms Code" OF
                          'QUARTER':
                          BEGIN

                            WHILE date1 <= "Promised Delivery Date" DO
                            BEGIN
                              date1 := CALCDATE('3M',date1);
                              //date1 := CALCDATE('-1D',date1);
                              NoOfLines1 := NoOfLines1+1;
                            END;
                          END;
                          'HALFYEARLY':
                          BEGIN
                            WHILE date1 <= "Promised Delivery Date" DO
                            BEGIN
                              date1 := CALCDATE('6M',date1);
                              //date1 := CALCDATE('-1D',date1);
                              NoOfLines1 := NoOfLines1+1;
                            END;
                          END;
                          'YEAR':
                          BEGIN
                            WHILE date1 <= "Promised Delivery Date" DO
                            BEGIN
                              date1 := CALCDATE('1Y',date1);
                              //date1 := CALCDATE('-1D',date1);
                              NoOfLines1 := NoOfLines1+1;
                            END;
                          END;
                        END;
                        NoOfLines := 1;
                        date1 := "Requested Delivery Date";
                        date2 := "Requested Delivery Date";
                        LineAmt:= "Sale Order Total Amount"/NoOfLines1;
                        LineAmt := ROUND((LineAmt)*(100/115),2);
                        ServiceTax := ROUND((("Sale Order Total Amount"/NoOfLines1)*(100/115))*0.15,2);
                        CASE "Payment Terms Code" OF
                          'QUARTER':
                          BEGIN
                            WHILE (date2 <= "Promised Delivery Date") AND (NoOfLines <= NoOfLines1) DO
                            BEGIN
                              date1 := CALCDATE('3M',date1);
                              date2 := CALCDATE('3M',date2);
                              date1 := CALCDATE('-1D',date2);
                              NoOfLines := NoOfLines+1;
                              SalesLine.RESET;
                              SalesLine."Document Type":=SalesLine."Document Type"::Amc;
                              SalesLine."Document No.":="No.";
                              SalesLine."Line No.":=LineNo;
                              SalesLine.Type := SalesLine.Type::"G/L Account";
                              SalesLine.VALIDATE("No.",'47503');
                              SalesLine."Location Code":='PROD';
                              SalesLine."Shipment Date":=date1;
                              SalesLine."Unit of Measure Code":='Nos';
                              SalesLine.Quantity:=1;
                              SalesLine."Outstanding Quantity":=1;
                              SalesLine."Qty. to Invoice":=1;
                              SalesLine."Qty. to Ship":=1;
                              SalesLine."Quantity (Base)":=1;
                              SalesLine."Outstanding Qty. (Base)":=1;
                              SalesLine."Qty. to Invoice (Base)":=1;
                              SalesLine."Qty. to Ship (Base)":=1;
                              SalesLine."Unit of Measure" := 'NOS';
                              SalesLine."Shortcut Dimension 1 Code":='CUS-005';
                              SalesLine."Bill-to Customer No.":="Sell-to Customer No.";
                              SalesLine."Sell-to Customer No.":="Sell-to Customer No.";
                              SalesLine."Qty. per Unit of Measure":=1;
                              SalesLine."Service Tax Group":='R & M FOR DL';
                              SalesLine."Service Tax Registration No.":='AAACE4879QST001';
                              SalesLine."Gen. Prod. Posting Group" := 'MISC';
                              SalesLine."Dummy Unit Cost":=LineAmt;
                              SalesLine."Unit Price":=LineAmt;
                              SalesLine."Line Amount":=LineAmt;
                              SalesLine."Service Tax Amount" := ServiceTax;
                              SalesLine.INSERT;
                              LineNo := LineNo+10000;
                            END;
                          END;
                          'HALFYEARLY':
                          BEGIN
                            WHILE (date1 <= "Promised Delivery Date") AND (NoOfLines <= NoOfLines1) DO
                            BEGIN
                              date1 := CALCDATE('6M',date1);
                              date2 := CALCDATE('6M',date2);
                              date1 := CALCDATE('-1D',date2);
                              NoOfLines := NoOfLines+1;
                              SalesLine.RESET;
                              SalesLine."Document Type":=SalesLine."Document Type"::Amc;
                              SalesLine."Document No.":="No.";
                              SalesLine."Line No.":=LineNo;
                              SalesLine.Type := SalesLine.Type::"G/L Account";
                              SalesLine.VALIDATE("No.",'47503');
                              SalesLine."Location Code":='PROD';
                              SalesLine."Shipment Date":=date1;
                              SalesLine."Unit of Measure Code":='Nos';
                              SalesLine.Quantity:=1;
                              SalesLine."Outstanding Quantity":=1;
                              SalesLine."Qty. to Invoice":=1;
                              SalesLine."Qty. to Ship":=1;
                              SalesLine."Quantity (Base)":=1;
                              SalesLine."Outstanding Qty. (Base)":=1;
                              SalesLine."Qty. to Invoice (Base)":=1;
                              SalesLine."Qty. to Ship (Base)":=1;
                              SalesLine."Unit of Measure" := 'NOS';
                              SalesLine."Shortcut Dimension 1 Code":='CUS-005';
                              SalesLine."Bill-to Customer No.":="Sell-to Customer No.";
                              SalesLine."Sell-to Customer No.":="Sell-to Customer No.";
                              SalesLine."Qty. per Unit of Measure":=1;
                              SalesLine."Service Tax Group":='R & M FOR DL';
                              SalesLine."Service Tax Registration No.":='AAACE4879QST001';
                              SalesLine."Gen. Prod. Posting Group" := 'MISC';
                              SalesLine."Dummy Unit Cost":=LineAmt;
                              SalesLine."Unit Price":=LineAmt;
                              SalesLine."Line Amount":=LineAmt;
                              SalesLine."Service Tax Amount" := ServiceTax;
                              SalesLine.INSERT;
                              LineNo := LineNo+10000;
                            END;
                          END;
                          'YEAR':
                          BEGIN
                            WHILE (date2 <= "Promised Delivery Date") AND (NoOfLines <= NoOfLines1)  DO
                            BEGIN
                              date1 := CALCDATE('1Y',date1);
                              date2 := CALCDATE('1Y',date2);
                              date1 := CALCDATE('-1D',date2);
                              NoOfLines := NoOfLines+1;
                              SalesLine.RESET;
                              SalesLine."Document Type":=SalesLine."Document Type"::Amc;
                              SalesLine."Document No.":="No.";
                              SalesLine."Line No.":=LineNo;
                              SalesLine.Type := SalesLine.Type::"G/L Account";
                              SalesLine.VALIDATE("No.",'47503');
                              SalesLine."Location Code":='PROD';
                              SalesLine."Shipment Date":=date1;
                              SalesLine."Unit of Measure Code":='Nos';
                              SalesLine.Quantity:=1;
                              SalesLine."Outstanding Quantity":=1;
                              SalesLine."Qty. to Invoice":=1;
                              SalesLine."Qty. to Ship":=1;
                              SalesLine."Quantity (Base)":=1;
                              SalesLine."Outstanding Qty. (Base)":=1;
                              SalesLine."Qty. to Invoice (Base)":=1;
                              SalesLine."Qty. to Ship (Base)":=1;
                              SalesLine."Unit of Measure" := 'NOS';
                              SalesLine."Shortcut Dimension 1 Code":='CUS-005';
                              SalesLine."Bill-to Customer No.":="Sell-to Customer No.";
                              SalesLine."Sell-to Customer No.":="Sell-to Customer No.";
                              SalesLine."Qty. per Unit of Measure":=1;
                              SalesLine."Service Tax Group":='R & M FOR DL';
                              SalesLine."Service Tax Registration No.":='AAACE4879QST001';
                              SalesLine."Gen. Prod. Posting Group" := 'MISC';
                              SalesLine."Dummy Unit Cost":=LineAmt;
                              SalesLine."Unit Price":=LineAmt;
                              SalesLine."Line Amount":=LineAmt;
                              SalesLine."Service Tax Amount" := ServiceTax;
                              SalesLine.INSERT;
                              LineNo := LineNo+10000;
                            END;
                          END;
                        END;
                        //END
                        //ELSE MESSAGE('Under Developement!');
                        //End by pranavi
                    end;
                }
                action("Foward To CashFlow")
                {
                    Image = Export;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = true;

                    trigger OnAction();
                    begin
                        //Added by Pranavi on 12-10-2015
                        //IF USERID IN ['EFFTRONICS\PRANAVI'] THEN
                          "CashFlow AMC On Hand Integraton"
                        //ELSE MESSAGE('Under Implementation!');
                        //End by Pranavi
                    end;
                }
                action(ABC)
                {
                    Visible = false;

                    trigger OnAction();
                    begin

                        "CashFlow AMC On Hand Integraton_On_Post";
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
                Image = "Action";
                separator(Action172)
                {
                }
                action("Get St&d. Cust. Sales Codes")
                {
                    Caption = 'Get St&d. Cust. Sales Codes';
                    Ellipsis = true;
                    Image = CodesList;

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
                    Image = NonStockItem;
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
                    Image = CopyDocument;

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
                    Image = Archive;

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
                    Image = MoveNegativeLines;

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
                    Image = CancelLine;

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
                    Image = Closed;

                    trigger OnAction();
                    var
                        OrderStatusValue : Text[50];
                        Text050 : Label 'Do you want to Short Close the Order No. %1';
                    begin
                        IF  NOT (USERID IN ['EFFTRONICS\PRANAVI','EFFTRONICS\ANILKUMAR']) THEN
                          ERROR('You Do not have Right to Short Close!');
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
                    Image = UpdateShipment;
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
                    Image = PutawayLines;
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
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction();
                    begin
                        // Added by Vishnu on 02-03-2019 for vertical filling
                        IF Vertical = Vertical::" " THEN
                        BEGIN
                          ERROR('Please choose Vertical');
                        END;

                        //Changed by Pranavi  10-102-105
                        IF ISCLEAR(SQLConnection1) THEN
                          CREATE(SQLConnection1,FALSE,TRUE);

                        IF ISCLEAR(RecordSet1) THEN
                          CREATE(RecordSet1,FALSE,TRUE);

                        IF ConnectionOpen1 <> 1 THEN
                        BEGIN
                          SQLConnection1.ConnectionString:='DSN=CASHFLOW;UID=cashflowuser;PASSWORD=firewall123;SERVER=oracle_80;';
                          SQLConnection1.Open;
                          ConnectionOpen1:=1;
                        END;
                        SQLConnection1.Close;
                        ConnectionOpen1:=0;
                        Custmr.RESET;
                        Custmr.SETFILTER(Custmr."No.","Sell-to Customer No.");
                        IF Custmr.FINDFIRST THEN
                        BEGIN
                          IF Custmr.Name='' THEN
                            ERROR('Please fill Customer Name in Customer Card!');
                          IF Custmr.Address='' THEN
                            ERROR('Please fill Customer Address in Customer Card!');
                          IF Custmr.City='' THEN
                            ERROR('Please fill Customer City in Customer Card!');
                          IF Custmr."State Code"='' THEN
                            ERROR('Please fill Customer State Code in Customer Card!');
                          IF Custmr."Customer Posting Group"='' THEN
                            ERROR('Please Fill Customer Customer Posting Group  in Customer Card in Invoicing Tab!');
                          IF Custmr."Service Zone Code" = '' THEN     // Condition added by Pranavi on 30-may-2016 as it is forwarded to cashflow in amc order
                            ERROR('Please fill Service Zone Code in Customer Card!');
                        END;
                        // Added by Pranavi on 30-Jun-2016 for SD amount checking
                          IF ("SD Status" <> "SD Status"::NA) AND ("Security Deposit Amount" <= 5) THEN
                            ERROR('Please enter Security Deposit Amount!\If SD amount not applicable update SD Status as NA!');
                        // End by pranavi

                        CODEUNIT.RUN(CODEUNIT::"Release Sales Document",Rec);
                        "CashFlow AMC On Hand Integraton";    //pranavi
                        IF Status = Status::Released THEN
                        BEGIN
                          SHA.RESET;
                          SHA.SETFILTER(SHA."No.","No.");
                          IF NOT SHA.FINDFIRST THEN
                          BEGIN
                            "First Released Date Time" := CURRENTDATETIME;
                            MODIFY;
                          END;
                        END;
                        //End by Pranavi
                    end;
                }
                action("Re&open")
                {
                    Caption = 'Re&open';
                    Image = ReOpen;

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
                        //MAPIHandler.ToName := 'anulatha@efftronics.net';
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
                    Image = Calculate;

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
                    Image = SendEmailPDFNoAttach;

                    trigger OnAction();
                    begin
                        //B2b1.0>> Since BizTalkManagement CU doesn't exist in Nav 2013
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
                    Image = ReleaseShipment;

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
                        //MAPIHandler.ToName := 'anulatha@efftronics.net';
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
                    Image = UpdateUnitCost;

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
                    Image = SendAsPDF;

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
                action("Get invoice number")
                {
                    Caption = 'Get invoice number';
                    Image = SuggestNumber;

                    trigger OnAction();
                    begin
                          salhed.SETFILTER(salhed."Document Type",'AMC|ORDER');
                          salhed.SETFILTER(salhed."External Document No.",'<>%1','');
                          IF salhed.COUNT>0 THEN
                          IF salhed.FINDSET THEN
                          REPEAT
                          ERROR(salhed."No."+'  Sale Have the Invoice Number');
                          UNTIL salhed.NEXT=0;

                          //ERROR('Invoice Number Already Assign to Another Sale Order');
                          POSTEDINVOICE.SETCURRENTKEY(POSTEDINVOICE."External Document No.");  //sreenivas modified this line
                          POSTEDINVOICE.ASCENDING;      //this line too
                          POSTEDINVOICE.SETRANGE(POSTEDINVOICE."Posting Date",(040112D),(033113D));
                          POSTEDINVOICE.SETFILTER(POSTEDINVOICE."External Document No.",'SI*');
                          //MESSAGE(FORMAT(POSTEDINVOICE.COUNT));
                          IF POSTEDINVOICE.FINDLAST THEN
                          BEGIN
                          y:='0';
                          y:=POSTEDINVOICE."External Document No.";
                          temp:=1;
                          END;
                          IF temp=0 THEN
                            "External Document No.":='SI-001'
                          ELSE
                          "External Document No.":=INCSTR(y);

                          MODIFY;
                    end;
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
                action("ProformaInvoice Report")
                {
                    Caption = 'ProformaInvoice Report';
                    Ellipsis = true;
                    Image = TestReport;

                    trigger OnAction();
                    begin
                        ReportPrint.PrintSalesHeader(Rec);
                    end;
                }
                action("P&ost")
                {
                    Caption = 'P&ost';
                    Ellipsis = true;
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'F9';

                    trigger OnAction();
                    begin
                        servicetaxamt:=0;
                        IF Structure='SERVICE' THEN
                        BEGIN
                          SL.RESET;
                          SL.SETRANGE(SL."Document No.","No.");
                          IF SL.FINDSET THEN
                          REPEAT
                            servicetaxamt:=servicetaxamt+SL."Service Tax Amount";
                          UNTIL SL.NEXT=0;
                          IF servicetaxamt=0 THEN
                            ERROR('You are not calculated the Service Tax Amount, first calculate the Structure Values then post the invoice');
                        END;
                        //Added by Pranavi on 13-10-2015 for not allowing if order not released atleast once
                        IF Status <> Status::Released THEN
                        BEGIN
                          SHA.RESET;
                          SHA.SETFILTER(SHA."Document Type",'%1',SHA."Document Type"::Amc);
                          SHA.SETFILTER(SHA."No.","No.");
                          IF NOT SHA.FINDFIRST THEN
                            ERROR('Must Release the Sale Order Atleast Once!');
                        END;

                        // temprarily commented by vishnu priya on 01-04-2020
                          IF "Posting Date" < TODAY THEN
                            BEGIN
                              ERROR('Can not be posted with previous date');
                              END;
                        // temprarily commented by vishnu priya on 01-04-2020

                        IF ISCLEAR(SQLConnection1) THEN
                          CREATE(SQLConnection1,FALSE,TRUE);

                        IF ISCLEAR(RecordSet1) THEN
                          CREATE(RecordSet1,FALSE,TRUE);

                        IF ConnectionOpen1 <> 1 THEN
                        BEGIN
                          SQLConnection1.ConnectionString:='DSN=CASHFLOW;UID=cashflowuser;PASSWORD=firewall123;SERVER=oracle_80;';
                          SQLConnection1.Open;
                          ConnectionOpen1:=1;
                        END;
                        SQLConnection1.Close;
                        ConnectionOpen1:=0;
                        //End by Pranavi
                        ERPAMCOrderNo:="No.";
                        CODEUNIT.RUN(81,Rec);
                        "CashFlow AMC On Hand Integraton_On_Post";  //pranavi

                        // NAVIN
                    end;
                }
                action("Post and &Print")
                {
                    Caption = 'Post and &Print';
                    Ellipsis = true;
                    Image = PostPrint;
                    ShortCutKey = 'Shift+F9';

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
                    Image = PostBatch;

                    trigger OnAction();
                    begin
                        REPORT.RUNMODAL(REPORT::"Batch Post Sales Orders",TRUE,TRUE,Rec);
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                action("Invoice Preview")
                {
                    Caption = 'Invoice Preview';
                    Image = PreviewChecks;

                    trigger OnAction();
                    begin
                        "sales header".SETRANGE("sales header"."No.","No.");
                        REPORT.RUN(50114,TRUE,FALSE,"sales header");
                    end;
                }
                action("Dispatch Note")
                {
                    Caption = 'Dispatch Note';
                    Image = Note;

                    trigger OnAction();
                    begin
                        "sales header".SETRANGE("sales header"."No.","No.");
                        //REPORT.RUN(90000,TRUE,FALSE,SalesHeader);
                        REPORT.RUN(50107,TRUE,FALSE,"sales header");
                    end;
                }
                action(PreviewPosting)
                {
                    CaptionML = ENU='Preview Posting',
                                ENN='Preview Posting';
                    Image = ViewPostedOrder;

                    trigger OnAction();
                    begin
                        ShowPreview;
                    end;
                }
            }
            action("&Print")
            {
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    DocPrint.PrintSalesHeader(Rec);
                end;
            }
            action(InsertAmcLines)
            {
                Caption = 'Insert Amc Lines';
                Image = Insert;

                trigger OnAction();
                begin
                    TESTFIELD(Status,Status::Open);
                    TESTFIELD("Payment Terms Code");
                    TESTFIELD("Requested Delivery Date");
                    TESTFIELD("Promised Delivery Date");
                    CurrPage.SalesLines.PAGE.CopyAmcLines;
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
        END;
        "sales header".SETRANGE("sales header"."No.","No.");
        IF "sales header".FINDFIRST THEN;
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
        PostingfromWhseRefEditable := TRUE;
        "Order AssuranceEditable" := TRUE;
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
        END;

        "sales header".SETRANGE("sales header"."No.","No.");
        IF "sales header".FINDFIRST THEN;


        SETRANGE("Date Filter",0D,WORKDATE - 1);
    end;

    trigger OnQueryClosePage(CloseAction : Action) : Boolean;
    begin
        IF NOT (USERID IN ['EFFTRONICS\PRANAVI']) THEN
          "CashFlow AMC On Hand Integraton_On_Close";   //pranavi
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
        Body : Text[1000];
        Subject : Text[1000];
        SMTPSETUP : Record "SMTP SETUP";
        AttachFileName : Text[1000];
        objEmailConf : Automation "'{CD000000-8B95-11D1-82DB-00C04FB1625D}' 1.0:'{CD000002-8B95-11D1-82DB-00C04FB1625D}':''{CD000000-8B95-11D1-82DB-00C04FB1625D}' 1.0'.Configuration";
        objEmail : Automation "'{CD000000-8B95-11D1-82DB-00C04FB1625D}' 1.0:'{CD000001-8B95-11D1-82DB-00C04FB1625D}':''{CD000000-8B95-11D1-82DB-00C04FB1625D}' 1.0'.Message";
        flds : Automation "'{00000205-0000-0010-8000-00AA006D2EA4}' 2.5:'{00000564-0000-0010-8000-00AA006D2EA4}':''{00000205-0000-0010-8000-00AA006D2EA4}' 2.5'.Fields";
        fld : Automation "'{00000205-0000-0010-8000-00AA006D2EA4}' 2.5:'{00000569-0000-0010-8000-00AA006D2EA4}':''{00000205-0000-0010-8000-00AA006D2EA4}' 2.5'.Field";
        servicetaxamt : Decimal;
        SL : Record "Sales Line";
        SMTP_Mail : Codeunit "SMTP Mail";
        salhed : Record "Sales Header";
        POSTEDINVOICE : Record "Sales Invoice Header";
        y : Code[10];
        temp : Integer;
        [InDataSet]
        "Order AssuranceEditable" : Boolean;
        [InDataSet]
        PostingfromWhseRefEditable : Boolean;
        InvoiceNos : Option " ",ExciseInv,ServiceInv,TradingInv,InstInv;
        date1 : Date;
        NoOfLines : Integer;
        SalesLines : Record "Sales Line";
        Custmr : Record Customer;
        LineNo : Integer;
        NoOfLines1 : Integer;
        LineAmt : Decimal;
        ShippedCount : Integer;
        date2 : Date;
        SQLConnection1 : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000514-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Connection";
        RecordSet1 : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000535-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Recordset";
        ConnectionOpen1 : Integer;
        ServiceTax : Decimal;
        ERPAMCOrderNo : Code[25];
        SalesHeader : Record "Sales Header";
        CashFlowSDIntegration : Codeunit SQLIntegration;

    [LineStart(8366)]
    procedure UpdateAllowed() : Boolean;
    begin
        IF CurrPage.EDITABLE = FALSE THEN
          ERROR(Text000);
        EXIT(TRUE);
    end;

    [LineStart(8371)]
    procedure "---NAVIN---"();
    begin
    end;

    [LineStart(8374)]
    procedure ConvertOrdertoExportOrder(var Rec : Record "Sales Header");
    var
        OldSalesCommentLine : Record "Sales Comment Line";
        FromDocDim : Record "Dimension Set Entry";
        ToDocDim : Record "Dimension Set Entry";
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
        // CODE WAS COMMENTED FOR NAVISION UPGRADATION
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
        //SalesExportOrderHeader."Date Received" := 0D; //B2b1.0
        //SalesExportOrderHeader."Time Received" := 0T; //B2b1.0
        //SalesExportOrderHeader."Date Sent" := 0D; //B2b1.0
        //SalesExportOrderHeader."Time Sent" := 0T; //B2b1.0
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
        //DIM1.0 ENd
        
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
            //DIM1.0
            SalesExportOrderLine."Dimension Set ID" := SalesOrderLine."Dimension Set ID";
            //DIM1.0
            SalesExportOrderLine.INSERT;
            //DIM 1.0 Start
            //Code Commented
            /*
            FromDocDim.SETRANGE("Line No.",SalesOrderLine."Line No.");
        
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
        /*
        FromDocDim.SETRANGE("Line No.");
        FromDocDim.DELETEALL;
        */
        //DIM1.0 End
        
        MESSAGE(
          Text002,
          "No.",SalesExportOrderHeader."No.");

    end;

    [LineStart(8528)]
    procedure "---B2B---"();
    begin
    end;

    [LineStart(8531)]
    procedure DocumentPosition();
    begin
        /*
        IF "Document Position" = "Document Position" :: Design THEN
          CurrPage.EDITABLE := FALSE
        ELSE
          CurrPage.EDITABLE := TRUE;
        */

    end;

    [LineStart(8539)]
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

    [LineStart(8564)]
    procedure calcamt();
    begin
        "Sale Order Total Amount":=0;
        SalesLine.SETRANGE(SalesLine."Document No.","No.");
        IF SalesLine.FINDSET THEN
         REPEAT
          //"Sale Order Total Amount"+=SalesLine."Line Amount"+SalesLine."Excise Amount"+SalesLine."VAT Amount"+SalesLine."Tax Amount";
          // CODE WAS COMMENTED FOR NAVISION UPGRADATION
         UNTIL SalesLine.NEXT=0;
         MODIFY;
    end;

    [LineStart(8574)]
    local procedure SelltoCustomerNoOnAfterValidat();
    begin
        CurrPage.UPDATE;
    end;

    [LineStart(8577)]
    local procedure BilltoCustomerNoOnAfterValidat();
    begin
        CurrPage.UPDATE;
    end;

    [LineStart(8580)]
    local procedure ShortcutDimension1CodeOnAfterV();
    begin
        CurrPage.SalesLines.PAGE.UpdateForm(TRUE);
    end;

    [LineStart(8583)]
    local procedure ShortcutDimension2CodeOnAfterV();
    begin
        CurrPage.SalesLines.PAGE.UpdateForm(TRUE);
    end;

    [LineStart(8586)]
    local procedure OnAfterGetCurrRecord();
    begin
        xRec := Rec;
        DocumentPosition;
    end;

    [LineStart(8590)]
    local procedure PostingfromWhseRefOnActivate();
    begin
          IF "Posting from Whse. Ref." >0 THEN
            PostingfromWhseRefEditable :=FALSE
          ELSE
            PostingfromWhseRefEditable :=TRUE;
    end;

    [LineStart(8596)]
    local procedure ShowPreview();
    var
        SalesPostYesNo : Codeunit "Sales-Post (Yes/No)";
    begin
        SalesPostYesNo.Preview(Rec);
    end;

    [LineStart(8599)]
    procedure ChooseInvoice();
    var
        temp : Integer;
    begin
        temp:=0;
        "sales header".RESET;
        "sales header".SETFILTER("sales header"."External Document No.",'<>%1',' ');
        IF "sales header".FINDSET THEN
        REPEAT
        "sales header"."External Document No.":='';
        "sales header".MODIFY;
        UNTIL "sales header".NEXT=0;
        
        CASE InvoiceNos OF
        1:
        BEGIN
        
          salhed.SETFILTER(salhed."Document Type",'Order');
          salhed.SETFILTER(salhed."External Document No.",'<>%1','');
          IF salhed.COUNT>0 THEN
          IF salhed.FINDSET THEN
          REPEAT
          ERROR(salhed."No."+'  Sale Have the Invoice Number');
          UNTIL salhed.NEXT=0;
        
        //ERROR('Invoice Number Already Assign to Another Sale Order');
          //POSTEDINVOICE.RESET;
          POSTEDINVOICE.SETCURRENTKEY(POSTEDINVOICE."External Document No.");  //sreenivas modified this line
          POSTEDINVOICE.ASCENDING;      //this line too
          POSTEDINVOICE.SETRANGE(POSTEDINVOICE."Posting Date",(040113D),(033114D));
          POSTEDINVOICE.SETFILTER(POSTEDINVOICE."External Document No.",'0..999');
        //MESSAGE(FORMAT(POSTEDINVOICE.COUNT));
          IF POSTEDINVOICE.FINDLAST THEN
          BEGIN
          y:='0';
          y:=POSTEDINVOICE."External Document No.";
          temp:=1;
          END;
          IF temp=0 THEN
            "External Document No.":='001'
          ELSE
          "External Document No.":=INCSTR(y);
        //  UNTIL POSTEDINVOICE.NEXT = 0;
        //  "External Document No.":=INCSTR(y);
        //MESSAGE(FORMAT("External Document No."));
          MODIFY;
        END;
        
        2:
        BEGIN
          salhed.SETFILTER(salhed."Document Type",'Order');
          salhed.SETFILTER(salhed."External Document No.",'<>%1','');
          IF salhed.COUNT>0 THEN
          IF salhed.FINDSET THEN
          REPEAT
          ERROR(salhed."No."+'  Sale Have the Invoice Number');
          UNTIL salhed.NEXT=0;
        
          //ERROR('Invoice Number Already Assign to Another Sale Order');
          POSTEDINVOICE.SETCURRENTKEY(POSTEDINVOICE."External Document No.");  //sreenivas modified this line
          POSTEDINVOICE.ASCENDING;      //this line too
          POSTEDINVOICE.SETRANGE(POSTEDINVOICE."Posting Date",(040113D),(033114D));
          POSTEDINVOICE.SETFILTER(POSTEDINVOICE."External Document No.",'SI*');
          //MESSAGE(FORMAT(POSTEDINVOICE.COUNT));
          IF POSTEDINVOICE.FINDLAST THEN
          BEGIN
          y:='0';
          y:=POSTEDINVOICE."External Document No.";
          temp:=1;
          END;
          IF temp=0 THEN
            "External Document No.":='SI-001'
          ELSE
          "External Document No.":=INCSTR(y);
        
         /* IF POSTEDINVOICE.FINDLAST THEN
          REPEAT
          y:=POSTEDINVOICE."External Document No.";
          UNTIL POSTEDINVOICE.NEXT = 0;
          "External Document No.":=INCSTR(y);*/
          //MESSAGE(FORMAT("External Document No."));
          MODIFY;
        
        END;
        3:
        BEGIN
          salhed.SETFILTER(salhed."Document Type",'Order');
          salhed.SETFILTER(salhed."External Document No.",'<>%1','');
          IF salhed.COUNT>0 THEN
          IF salhed.FINDSET THEN
          REPEAT
          ERROR(salhed."No."+'  Sale Have the Invoice Number');
          UNTIL salhed.NEXT=0;
        
          //ERROR('Invoice Number Already Assign to Another Sale Order');
          POSTEDINVOICE.SETCURRENTKEY(POSTEDINVOICE."External Document No.");  //sreenivas modified this line
          POSTEDINVOICE.ASCENDING;      //this line too
          POSTEDINVOICE.SETRANGE(POSTEDINVOICE."Posting Date",(040113D),(033114D));
          POSTEDINVOICE.SETFILTER(POSTEDINVOICE."External Document No.",'CI*');
          //MESSAGE(FORMAT(POSTEDINVOICE.COUNT));
          IF POSTEDINVOICE.FINDLAST THEN
          BEGIN
          y:='0';
          y:=POSTEDINVOICE."External Document No.";
          temp:=1;
          END;
          IF temp=0 THEN
            "External Document No.":='CI-001'
          ELSE
          "External Document No.":=INCSTR(y);
        
          /*IF POSTEDINVOICE.FINDLAST THEN
          REPEAT
          y:=POSTEDINVOICE."External Document No.";
          UNTIL POSTEDINVOICE.NEXT = 0;
          "External Document No.":=INCSTR(y);*/
          //MESSAGE(FORMAT("External Document No."));
          MODIFY;
        
        END;
        4:
        BEGIN
          salhed.SETFILTER(salhed."Document Type",'Order');
          salhed.SETFILTER(salhed."External Document No.",'<>%1','');
          IF salhed.COUNT>0 THEN
          IF salhed.FINDSET THEN
          REPEAT
          ERROR(salhed."No."+'  Sale Have the Invoice Number');
          UNTIL salhed.NEXT=0;
        
          //ERROR('Invoice Number Already Assign to Another Sale Order');
          POSTEDINVOICE.SETCURRENTKEY(POSTEDINVOICE."External Document No.");  //sreenivas modified this line
          POSTEDINVOICE.ASCENDING;      //this line too
          POSTEDINVOICE.SETRANGE(POSTEDINVOICE."Posting Date",(040113D),(033114D));
          POSTEDINVOICE.SETFILTER(POSTEDINVOICE."External Document No.",'IN*');
          //MESSAGE(FORMAT(POSTEDINVOICE.COUNT));
          IF POSTEDINVOICE.FINDLAST THEN
          BEGIN
          y:='0';
          y:=POSTEDINVOICE."External Document No.";
          temp:=1;
          END;
          IF temp=0 THEN
            "External Document No.":='IN-001'
          ELSE
          "External Document No.":=INCSTR(y);
        
          /*IF POSTEDINVOICE.FINDLAST THEN
          REPEAT
          y:=POSTEDINVOICE."External Document No.";
          UNTIL POSTEDINVOICE.NEXT = 0;
          "External Document No.":=INCSTR(y);*/
          //MESSAGE(FORMAT("External Document No."));
          MODIFY;
        
        END;
        
        END;

    end;

    [LineStart(8755)]
    procedure "CashFlow AMC On Hand Integraton"();
    var
        SQLConnection : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000514-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Connection";
        RecordSet : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000535-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Recordset";
        SQLQuery : Text;
        RowCount : Integer;
        ConnectionOpen : Integer;
        NoOfRowsAffected : Integer;
        DeleteQuery : Text;
        SQLQuery1 : Text;
        SQLQuery2 : Text;
        SQLQuery3 : Text;
        AMCOrderID : Integer;
        CashflowOrderID : Integer;
        CF_Cust_Id : Integer;
        SalesPerson : Record "Salesperson/Purchaser";
        SalesPersonName : Text;
        SalesLines : Record "Sales Line";
        OrderDate : Text[30];
        AMCStartDate : Text[30];
        AMCEndDate : Text[30];
        ShipmentDate : Text[30];
        OrderValue : BigInteger;
        Quote : Label '''';
        LineAmt : BigInteger;
        Status1 : Char;
        cDay : Integer;
        cMonth : Integer;
        cYear : Integer;
        cDay1 : Integer;
        cDay2 : Integer;
        cDay3 : Integer;
        cDay4 : Integer;
        cDay5 : Integer;
        PeriodNo : Integer;
        PeriodNum : Integer;
        AccountYear : Integer;
        AccountYearMonth : Integer;
        NewAMCOrderId : Integer;
        ExistHeader : Boolean;
        LASTREC : Integer;
        Country : Record "Country/Region";
        cntry : Text;
        state : Record State;
        statename : Text;
        addrs2 : Text;
        addrs1 : Text;
        user : Record User;
        username : Text;
        CusPstgGrp : Text;
        CustGRec : Record Customer;
        DivisionCode : Code[10];
        SMS_Division_Id : Code[10];
        New_Shipement : Date;
    begin
        //Added by Pranavi on 10-10-2015 for AMC orders hand Cashflow integration
        SalesHeader.RESET;
        SalesHeader.SETRANGE(SalesHeader."Document Type",SalesHeader."Document Type"::Amc);
        SalesHeader.SETRANGE(SalesHeader."No.","No.");
        IF SalesHeader.FINDFIRST THEN
        BEGIN
          IF "Requested Delivery Date" = 0D THEN
            ERROR('AMC Period Start Date should not be empty!');
          IF "Promised Delivery Date" = 0D THEN
            ERROR('AMC Period End Date should not be empty!');
          IF "Requested Delivery Date" > "Promised Delivery Date" THEN
            ERROR('AMC Start Date must be less than AMC END Date!');
          IF ("Payment Terms Code" = '') OR ("Payment Terms Code" = ' ') THEN
            ERROR('Please select Payment Terms Code!');
          IF "Sale Order Total Amount" = 0 THEN
            ERROR('Please enter Sale Order Total Amount!');
          IF NOT ("Payment Terms Code" IN ['QUARTER','QUART','HALFYEARLY','YEAR']) THEN
            ERROR('Payment terms must be in (QUARTER, HALFYEARLY, YEAR)');
        END;
        CustGRec.SETRANGE(CustGRec."No.","Sell-to Customer No.");
        IF CustGRec.FIND('-') THEN
        BEGIN
          DivisionCode := CustGRec."Service Zone Code";
          IF FORMAT(CustGRec."Payment Realization Period") IN ['',' '] THEN
            ERROR('Please update Payment Realization Period in Customer Card in Payments Tab!');
        END;
        
        IF ISCLEAR(SQLConnection) THEN
          CREATE(SQLConnection,FALSE,TRUE);
        
        IF ISCLEAR(RecordSet) THEN
          CREATE(RecordSet,FALSE,TRUE);
        
        RowCount:=0;
        ExistHeader := FALSE;
        IF ConnectionOpen <> 1 THEN
        BEGIN
          //SQLConnection.ConnectionString:='DSN=CASHFLOW_TEST;UID=cashflow;PASSWORD=cashflow;SERVER=oracle_test;';
          SQLConnection.ConnectionString:='DSN=CASHFLOW;UID=cashflowuser;PASSWORD=firewall123;SERVER=oracle_80;';
          SQLConnection.Open;
          SQLConnection.BeginTrans;
          ConnectionOpen:=1;
        END;
        SQLQuery := 'select * from MRP_AMC_ORDER1 where internal_amc_no = '''+"No."+'''';
        RecordSet:= SQLConnection.Execute(SQLQuery,RowCount);
        RowCount := 0;
        IF NOT( (RecordSet.BOF) OR (RecordSet.EOF)) THEN
           RecordSet.MoveFirst;
        WHILE NOT RecordSet.EOF DO
        BEGIN
          AMCOrderID := RecordSet.Fields.Item('AMC_ORDER_ID').Value;
          RowCount:=RowCount+1;
          RecordSet.MoveNext;
        END;
        SalesPerson.RESET;
        SalesPerson.SETFILTER(SalesPerson.Code,"Salesperson Code");
        IF SalesPerson.FINDFIRST THEN
          SalesPersonName := SalesPerson.Name;
        IF RowCount > 0 THEN
        BEGIN
          SQLQuery := 'delete from MRP_AMC_ORDER1 where internal_amc_no = '''+"No."+'''';
          SQLConnection.Execute(SQLQuery);
          ExistHeader := TRUE;
        END;
        SQLQuery := 'select * from MRP_AR_CUSTOMER where ERP_CUSID= '''+"Sell-to Customer No."+'''';
        RecordSet := SQLConnection.Execute(SQLQuery,RowCount);
        RowCount := 0;
        IF NOT( (RecordSet.BOF) OR (RecordSet.EOF)) THEN
           RecordSet.MoveFirst;
        WHILE NOT RecordSet.EOF DO
        BEGIN
          CF_Cust_Id := RecordSet.Fields.Item('AR_CUSTOMER_ID').Value;
          RowCount:=RowCount+1;
          RecordSet.MoveNext;
        END;
        IF CF_Cust_Id = 0 THEN
        BEGIN
          SQLQuery:='SELECT MAX(AR_CUSTOMER_ID)+1 AS LASTNUM FROM MRP_AR_CUSTOMER';
          RecordSet:= SQLConnection.Execute(SQLQuery);
          IF NOT (RecordSet.EOF OR RecordSet.BOF) THEN
            LASTREC := RecordSet.Fields.Item('LASTNUM').Value;
          CustGRec.RESET;
          CustGRec.SETFILTER(CustGRec."No.","Sell-to Customer No.");
          IF CustGRec.FINDFIRST THEN
          BEGIN
            Country.RESET;
            Country.SETFILTER(Country.Code,CustGRec."Country/Region Code");
            IF Country.FINDFIRST THEN
              cntry:=Country.Name;
            state.RESET;
            state.SETFILTER(state.Code,CustGRec."State Code");
            IF state.FINDFIRST THEN
              statename:=state.Description;
            addrs2:=CustGRec."Address 2";
            IF addrs2='' THEN
              addrs2:='-';
            user.SETFILTER(user."User Name",USERID);
            IF user.FINDFIRST THEN
              username:=user.EmployeeID;
            CusPstgGrp:=UPPERCASE(COPYSTR(CustGRec."Customer Posting Group",1,1))+LOWERCASE(COPYSTR(CustGRec."Customer Posting Group",2,STRLEN(CustGRec."Customer Posting Group")-1));
            IF CusPstgGrp IN ['Others','OTHERS','EXPORT','Export'] THEN         //added by Pranavi on 06-07-2015 to send Others as Private
              CusPstgGrp:='Private'
            ELSE IF CusPstgGrp = 'Railways' THEN
              CusPstgGrp := COPYSTR(CusPstgGrp,1,STRLEN(CusPstgGrp)-1);
        
            SQLQuery := 'INSERT INTO MRP_AR_CUSTOMER(AR_CUSTOMER_ID, AR_CUSTOMER_TYPE, NAME, ADDRESSLINE1, ADDRESSLINE2, CITY, STATE, ERP_CUSID, '+
            'PHONE_NO, MOBILE_NO, EMAIL_ID, ZIP, COUNTRY, USERID) VALUES'+
                '('+FORMAT(LASTREC)+', '''+CusPstgGrp+''', '''+CustGRec.Name+''', '''+CustGRec.Address+''', '''+addrs2+''', '''+CustGRec.City+''', '''+statename+
               ''','''+CustGRec."No."+''', '''+CustGRec."Telex No."+''', '''+CustGRec."Phone No."+''', '''+CustGRec."E-Mail"+''', '''+CustGRec."Post Code"+''', '''+cntry+''', '''+username+''')';
            SQLConnection.Execute(SQLQuery);
            SQLConnection.CommitTrans;
            SQLConnection.BeginTrans;
            CF_Cust_Id := LASTREC;
          END;
        END;
        Status1 := 'N';
        OrderDate:=FORMAT("Order Date",0,'<Day>-<Month Text,3>-<Year4>');
        AMCStartDate:=FORMAT("Requested Delivery Date",0,'<Day>-<Month Text,3>-<Year4>');
        AMCEndDate:=FORMAT("Promised Delivery Date",0,'<Day>-<Month Text,3>-<Year4>');
        OrderValue:= ROUND("Sale Order Total Amount",1);
        IF (ExistHeader = TRUE) THEN
        BEGIN
          SQLQuery := 'insert into MRP_AMC_ORDER1(AMC_ORDER_ID,AR_CUSTOMER_ID,AMC_ORDERNO,AMC_ORDER_DATE,FROMDATE,TODATE,AMC_ITEM,'+
                  'AMC_AMOUNT,REMARKS,STATUS,USERID,CREATION_DATE,CSMANAGER,INTERNAL_AMC_NO,ERP_DIVION_CODE)'+
                  'values('+FORMAT(AMCOrderID)+','+FORMAT(CF_Cust_Id)+','''+"Customer OrderNo."+
                  ''','''+OrderDate+''','''+AMCStartDate+''','''+AMCEndDate+''',''AMC'','+FORMAT(OrderValue)+
                  ',''AMC'','''+FORMAT(Status1)+''',''AUTO'',sysdate,'''+SalesPersonName+''','''+"No."+''','''+DivisionCode+''')';
        END
        ELSE
        BEGIN
          SQLQuery := 'insert into MRP_AMC_ORDER1(AMC_ORDER_ID,AR_CUSTOMER_ID,AMC_ORDERNO,AMC_ORDER_DATE,FROMDATE,TODATE,AMC_ITEM,'+
                  'AMC_AMOUNT,REMARKS,STATUS,USERID,CREATION_DATE,CSMANAGER,INTERNAL_AMC_NO,ERP_DIVION_CODE)'+
                  'values(AMC_ORDER_SEQ1.NEXTVAL,'+FORMAT(CF_Cust_Id)+','''+"Customer OrderNo."+
                  ''','''+OrderDate+''','''+AMCStartDate+''','''+AMCEndDate+''',''AMC'','+FORMAT(OrderValue)+
                  ',''AMC'','''+FORMAT(Status1)+''',''AUTO'',sysdate,'''+SalesPersonName+''','''+"No."+''','''+DivisionCode+''')';
        END;
        SQLConnection.Execute(SQLQuery);
        SQLConnection.CommitTrans;
        SQLConnection.BeginTrans;
        SQLQuery := 'select * from MRP_AMC_ORDER1_LINES where AMC_ORDER_ID = '''+FORMAT(AMCOrderID)+'''';
        RecordSet := SQLConnection.Execute(SQLQuery,RowCount);
        RowCount := 0;
        IF NOT( (RecordSet.BOF) OR (RecordSet.EOF)) THEN
           RecordSet.MoveFirst;
        WHILE NOT RecordSet.EOF DO
        BEGIN
          RowCount:=RowCount+1;
          RecordSet.MoveNext;
        END;
        IF RowCount > 0 THEN
        BEGIN
          SQLQuery := 'delete from MRP_AMC_ORDER1_LINES where AMC_ORDER_ID = '''+FORMAT(AMCOrderID)+'''';
          SQLConnection.Execute(SQLQuery);
        END;
        cDay1 := 1;
        cDay2 := 8;
        cDay3 := 16;
        cDay4 := 23;
        cDay5 := 24;
        SQLQuery := 'select AMC_ORDER_ID from MRP_AMC_ORDER1 where internal_amc_no ='''+"No."+''' Order by AMC_ORDER_ID';
        RecordSet := SQLConnection.Execute(SQLQuery,RowCount);
        RowCount := 0;
        IF NOT( (RecordSet.BOF) OR (RecordSet.EOF)) THEN
           RecordSet.MoveFirst;
        WHILE NOT RecordSet.EOF DO
        BEGIN
          NewAMCOrderId := RecordSet.Fields.Item('AMC_ORDER_ID').Value;
          RowCount:=RowCount+1;
          RecordSet.MoveNext;
        END;
        
        SalesLines.RESET;
        SalesLines.SETFILTER(SalesLines."Document Type",'%1',SalesLines."Document Type"::Amc);
        SalesLines.SETFILTER(SalesLines."Document No.",'%1',"No.");
        SalesLines.SETFILTER(SalesLines."No.",'<>%1','');
        SalesLines.SETFILTER(SalesLines."Shipment Date",'<>%1',0D);
        IF SalesLines.FINDSET THEN
        REPEAT
          ShipmentDate := '';
          New_Shipement:=0D;
          CustGRec.RESET;
          CustGRec.SETFILTER(CustGRec."No.",SalesLines."Sell-to Customer No.");
          IF CustGRec.FINDFIRST THEN
            IF FORMAT(CustGRec."Payment Realization Period") <> '' THEN
            BEGIN
              New_Shipement := CALCDATE(CustGRec."Payment Realization Period",SalesLines."Shipment Date");
              ShipmentDate := FORMAT(CALCDATE(CustGRec."Payment Realization Period",SalesLines."Shipment Date"),0,'<Day>-<Month Text,3>-<Year4>');
              cDay := DATE2DMY(CALCDATE(CustGRec."Payment Realization Period",SalesLines."Shipment Date"),1);
              cMonth := DATE2DMY(CALCDATE(CustGRec."Payment Realization Period",SalesLines."Shipment Date"),2);
              cYear := DATE2DMY(CALCDATE(CustGRec."Payment Realization Period",SalesLines."Shipment Date"),3);
            END
            ELSE
            BEGIN
              New_Shipement := SalesLines."Shipment Date";
              ShipmentDate := FORMAT(SalesLines."Shipment Date",0,'<Day>-<Month Text,3>-<Year4>');
              cDay := DATE2DMY(SalesLines."Shipment Date",1);
              cMonth := DATE2DMY(SalesLines."Shipment Date",2);
              cYear := DATE2DMY(SalesLines."Shipment Date",3);
            END;
          LineAmt := ROUND(SalesLines."Unit Price",1);
         /* cDay := DATE2DMY(SalesLines."Shipment Date",1);
          cMonth := DATE2DMY(SalesLines."Shipment Date",2);
          cYear := DATE2DMY(SalesLines."Shipment Date",3);   */
          IF cMonth < 4 THEN
          BEGIN
            AccountYear := cYear -1;
            AccountYearMonth := cMonth+9;
          END
          ELSE
          BEGIN
            AccountYear := cYear;
            AccountYearMonth := cMonth-3;
          END;
          IF cDay < cDay2 THEN
            PeriodNo := 1
          ELSE IF (cDay >= cDay2) AND (cDay < cDay3) THEN
            PeriodNo := 2
          ELSE
          BEGIN
            //MESSAGE(FORMAT(DATE2DMY(CALCDATE('CM',DMY2DATE(1,cMonth,cYear)),1)));
            IF DATE2DMY(CALCDATE('CM',DMY2DATE(1,cMonth,cYear)),1) = 31 THEN
            BEGIN
              IF (cDay >= cDay3) AND (cDay < cDay5) THEN
                PeriodNo := 3
              ELSE
                PeriodNo := 4
            END
            ELSE
            BEGIN
              IF (cDay >= cDay3) AND (cDay < cDay4) THEN
                PeriodNo := 3
              ELSE
                PeriodNo := 4
            END;
          END;
          IF New_Shipement = TODAY() THEN
            PeriodNum := 0
          ELSE
            PeriodNum := (AccountYearMonth * 4)-4+PeriodNo;
          IF SalesLines."Quantity Shipped" = 0 THEN
          BEGIN
            SQLQuery := 'insert into MRP_AMC_ORDER1_LINES values('+FORMAT(NewAMCOrderId)+','+
            FORMAT(SalesLines."Line No.")+','+SalesLines."No."+','''+SalesLines.Description+''','''+ShipmentDate+''','+
            FORMAT(LineAmt)+',sysdate,''AUTO'','+FORMAT(PeriodNum)+','+FORMAT(AccountYear)+',0,sysdate)';
          END
          ELSE
          BEGIN
            SQLQuery := 'insert into MRP_AMC_ORDER1_LINES values('+FORMAT(NewAMCOrderId)+','+
            FORMAT(SalesLines."Line No.")+','+SalesLines."No."+','''+SalesLines.Description+''','''+ShipmentDate+''','+
            FORMAT(LineAmt)+',sysdate,''AUTO'','+FORMAT(PeriodNum)+','+FORMAT(AccountYear)+',1,sysdate)';
          END;
          SQLConnection.Execute(SQLQuery);
        UNTIL SalesLines.NEXT=0;
        SQLConnection.CommitTrans;
        RecordSet.Close;
        SQLConnection.Close;
        ConnectionOpen:=0;
        IF "Customer Posting Group" = 'RAILWAYS' THEN
          CashFlowSDIntegration.SecDepostitCreationInCashFLow(NewAMCOrderId,Rec,CF_Cust_Id);
        //End by Pranavi

    end;

    [LineStart(9017)]
    procedure "CashFlow AMC On Hand Integraton_On_Close"();
    var
        SQLConnection : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000514-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Connection";
        RecordSet : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000535-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Recordset";
        SQLQuery : Text;
        RowCount : Integer;
        ConnectionOpen : Integer;
        NoOfRowsAffected : Integer;
        DeleteQuery : Text;
        SQLQuery1 : Text;
        SQLQuery2 : Text;
        SQLQuery3 : Text;
        AMCOrderID : Integer;
        CashflowOrderID : Integer;
        CF_Cust_Id : Integer;
        SalesPerson : Record "Salesperson/Purchaser";
        SalesPersonName : Text;
        SalesLines : Record "Sales Line";
        OrderDate : Text[30];
        AMCStartDate : Text[30];
        AMCEndDate : Text[30];
        ShipmentDate : Text[30];
        OrderValue : BigInteger;
        Quote : Label '''';
        LineAmt : BigInteger;
        Status1 : Char;
        cDay : Integer;
        cMonth : Integer;
        cYear : Integer;
        cDay1 : Integer;
        cDay2 : Integer;
        cDay3 : Integer;
        cDay4 : Integer;
        cDay5 : Integer;
        PeriodNo : Integer;
        PeriodNum : Integer;
        AccountYear : Integer;
        AccountYearMonth : Integer;
        NewAMCOrderId : Integer;
        ExistHeader : Boolean;
        LASTREC : Integer;
        Country : Record "Country/Region";
        cntry : Text;
        state : Record State;
        statename : Text;
        addrs2 : Text;
        addrs1 : Text;
        user : Record User;
        username : Text;
        CusPstgGrp : Text;
        CustGRec : Record Customer;
        Division_Code : Code[10];
    begin
        //Added by Pranavi on 10-10-2015 for AMC orders hand Cashflow integration
        SalesHeader.RESET;
        SalesHeader.SETRANGE(SalesHeader."Document Type",SalesHeader."Document Type"::Amc);
        SalesHeader.SETRANGE(SalesHeader."No.","No.");
        IF SalesHeader.FINDFIRST THEN
        BEGIN
          IF "Requested Delivery Date" = 0D THEN
            ERROR('AMC Period Start Date should not be empty!');
          IF "Promised Delivery Date" = 0D THEN
            ERROR('AMC Period End Date should not be empty!');
          IF "Requested Delivery Date" > "Promised Delivery Date" THEN
            ERROR('AMC Start Date must be less than AMC END Date!');
          IF ("Payment Terms Code" = '') OR ("Payment Terms Code" = ' ') THEN
            ERROR('Please select Payment Terms Code!');
          IF "Sale Order Total Amount" = 0 THEN
            ERROR('Please enter Sale Order Total Amount!');
          IF NOT ("Payment Terms Code" IN ['QUARTER','HALFYEARLY','YEAR']) THEN
            ERROR('Payment terms must be in (QUARTER, HALFYEARLY, YEAR)');
        END;
        
        SalesPerson.RESET;
        SalesPerson.SETFILTER(SalesPerson.Code,"Salesperson Code");
        IF SalesPerson.FINDFIRST THEN
          SalesPersonName := SalesPerson.Name;
        CustGRec.RESET;
        CustGRec.SETRANGE(CustGRec."No.","Sell-to Customer No.");
        IF CustGRec.FINDFIRST THEN
        BEGIN
          Division_Code := CustGRec."Service Zone Code";
          IF FORMAT(CustGRec."Payment Realization Period") IN ['',' '] THEN
            ERROR('Please update Payment Realization Period in Customer Card in Payments Tab\If not applicable update it as 0D!');
        END;
        
        
        IF ISCLEAR(SQLConnection) THEN
          CREATE(SQLConnection,FALSE,TRUE);
        
        IF ISCLEAR(RecordSet) THEN
          CREATE(RecordSet,FALSE,TRUE);
        
        RowCount:=0;
        ExistHeader := FALSE;
        IF ConnectionOpen <> 1 THEN
        BEGIN
          //SQLConnection.ConnectionString:='DSN=CASHFLOW_TEST;UID=cashflow;PASSWORD=cashflow;SERVER=oracle_test;';
          SQLConnection.ConnectionString:='DSN=CASHFLOW;UID=cashflowuser;PASSWORD=firewall123;SERVER=oracle_80;';
          SQLConnection.Open;
          SQLConnection.BeginTrans;
          ConnectionOpen:=1;
        END;
        SQLQuery := 'select * from MRP_AMC_ORDER1 where internal_amc_no = '''+"No."+'''';
        RecordSet:= SQLConnection.Execute(SQLQuery,RowCount);
        RowCount := 0;
        IF NOT( (RecordSet.BOF) OR (RecordSet.EOF)) THEN
           RecordSet.MoveFirst;
        WHILE NOT RecordSet.EOF DO
        BEGIN
          AMCOrderID := RecordSet.Fields.Item('AMC_ORDER_ID').Value;
          RowCount:=RowCount+1;
          RecordSet.MoveNext;
          ExistHeader := TRUE;
        END;
        //MESSAGE(FORMAT(RowCount));
        IF RowCount > 0 THEN
        BEGIN
          SQLQuery := 'delete from MRP_AMC_ORDER1 where internal_amc_no = '''+"No."+'''';
          SQLConnection.Execute(SQLQuery);
          SQLQuery := 'select * from MRP_AR_CUSTOMER where ERP_CUSID= '''+"Sell-to Customer No."+'''';
          RecordSet := SQLConnection.Execute(SQLQuery,RowCount);
          RowCount := 0;
          IF NOT( (RecordSet.BOF) OR (RecordSet.EOF)) THEN
             RecordSet.MoveFirst;
          WHILE NOT RecordSet.EOF DO
          BEGIN
            CF_Cust_Id := RecordSet.Fields.Item('AR_CUSTOMER_ID').Value;
            RowCount:=RowCount+1;
            RecordSet.MoveNext;
          END;
          IF CF_Cust_Id = 0 THEN
          BEGIN
            SQLQuery:='SELECT MAX(AR_CUSTOMER_ID)+1 AS LASTNUM FROM MRP_AR_CUSTOMER';
            RecordSet:= SQLConnection.Execute(SQLQuery);
            IF NOT (RecordSet.EOF OR RecordSet.BOF) THEN
              LASTREC := RecordSet.Fields.Item('LASTNUM').Value;
            CustGRec.RESET;
            CustGRec.SETFILTER(CustGRec."No.","Sell-to Customer No.");
            IF CustGRec.FINDFIRST THEN
            BEGIN
              Division_Code := CustGRec."Service Zone Code";
              Country.RESET;
              Country.SETFILTER(Country.Code,CustGRec."Country/Region Code");
              IF Country.FINDFIRST THEN
                cntry:=Country.Name;
              state.RESET;
              state.SETFILTER(state.Code,CustGRec."State Code");
              IF state.FINDFIRST THEN
                statename:=state.Description;
              addrs2:=CustGRec."Address 2";
              IF addrs2='' THEN
                addrs2:='-';
              user.SETFILTER(user."User Name",USERID);
              IF user.FINDFIRST THEN
                username:=user.EmployeeID;
              CusPstgGrp:=UPPERCASE(COPYSTR(CustGRec."Customer Posting Group",1,1))+LOWERCASE(COPYSTR(CustGRec."Customer Posting Group",2,STRLEN(CustGRec."Customer Posting Group")-1));
              IF CusPstgGrp IN ['Others','OTHERS','EXPORT','Export'] THEN         //added by Pranavi on 06-07-2015 to send Others as Private
                CusPstgGrp:='Private'
              ELSE IF CusPstgGrp = 'Railways' THEN
                CusPstgGrp := COPYSTR(CusPstgGrp,1,STRLEN(CusPstgGrp)-1);
        
              SQLQuery := 'INSERT INTO MRP_AR_CUSTOMER(AR_CUSTOMER_ID, AR_CUSTOMER_TYPE, NAME, ADDRESSLINE1, ADDRESSLINE2, CITY, STATE, ERP_CUSID, '+
              'PHONE_NO, MOBILE_NO, EMAIL_ID, ZIP, COUNTRY, USERID) VALUES'+
                  '('+FORMAT(LASTREC)+', '''+CusPstgGrp+''', '''+CustGRec.Name+''', '''+CustGRec.Address+''', '''+addrs2+''', '''+CustGRec.City+''', '''+statename+
                 ''','''+CustGRec."No."+''', '''+CustGRec."Telex No."+''', '''+CustGRec."Phone No."+''', '''+CustGRec."E-Mail"+''', '''+CustGRec."Post Code"+''', '''+cntry+''', '''+username+''')';
              SQLConnection.Execute(SQLQuery);
              SQLConnection.CommitTrans;
              SQLConnection.BeginTrans;
              CF_Cust_Id := LASTREC;
            END;
          END;
          Status1 := 'N';
          OrderDate:=FORMAT("Order Date",0,'<Day>-<Month Text,3>-<Year4>');
          AMCStartDate:=FORMAT("Requested Delivery Date",0,'<Day>-<Month Text,3>-<Year4>');
          AMCEndDate:=FORMAT("Promised Delivery Date",0,'<Day>-<Month Text,3>-<Year4>');
          OrderValue:= ROUND("Sale Order Total Amount",1);
          SQLQuery := 'insert into MRP_AMC_ORDER1(AMC_ORDER_ID,AR_CUSTOMER_ID,AMC_ORDERNO,AMC_ORDER_DATE,FROMDATE,TODATE,AMC_ITEM,'+
                    'AMC_AMOUNT,REMARKS,STATUS,USERID,CREATION_DATE,CSMANAGER,INTERNAL_AMC_NO,ERP_DIVION_CODE)'+
                    'values('+FORMAT(AMCOrderID)+','+FORMAT(CF_Cust_Id)+','''+"Customer OrderNo."+
                    ''','''+OrderDate+''','''+AMCStartDate+''','''+AMCEndDate+''',''AMC'','+FORMAT(OrderValue)+
                    ',''AMC'','''+FORMAT(Status1)+''',''AUTO'',sysdate,'''+SalesPersonName+''','''+"No."+''','''+Division_Code+''')';
          SQLConnection.Execute(SQLQuery);
          SQLConnection.CommitTrans;
          SQLConnection.BeginTrans;
        END;
        SQLQuery := 'select AMC_ORDER_ID from MRP_AMC_ORDER1 where internal_amc_no ='''+"No."+''' Order by AMC_ORDER_ID';
        RecordSet := SQLConnection.Execute(SQLQuery,RowCount);
        RowCount := 0;
        IF NOT( (RecordSet.BOF) OR (RecordSet.EOF)) THEN
           RecordSet.MoveFirst;
        WHILE NOT RecordSet.EOF DO
        BEGIN
          NewAMCOrderId := RecordSet.Fields.Item('AMC_ORDER_ID').Value;
          RowCount:=RowCount+1;
          RecordSet.MoveNext;
        END;
        SQLQuery := 'select * from MRP_AMC_ORDER1_LINES where AMC_ORDER_ID = '''+FORMAT(AMCOrderID)+'''';
        RecordSet := SQLConnection.Execute(SQLQuery,RowCount);
        RowCount := 0;
        IF NOT( (RecordSet.BOF) OR (RecordSet.EOF)) THEN
           RecordSet.MoveFirst;
        WHILE NOT RecordSet.EOF DO
        BEGIN
          RowCount:=RowCount+1;
          RecordSet.MoveNext;
        END;
        IF RowCount > 0 THEN
        BEGIN
          SQLQuery := 'delete from MRP_AMC_ORDER1_LINES where AMC_ORDER_ID = '''+FORMAT(AMCOrderID)+'''';
          SQLConnection.Execute(SQLQuery);
        END;
        IF (RowCount > 0) OR (ExistHeader = TRUE) THEN
        BEGIN
          cDay1 := 1;
          cDay2 := 8;
          cDay3 := 16;
          cDay4 := 23;
          cDay5 := 24;
          SalesLines.RESET;
          SalesLines.SETFILTER(SalesLines."Document Type",'%1',SalesLines."Document Type"::Amc);
          SalesLines.SETFILTER(SalesLines."Document No.",'%1',"No.");
          SalesLines.SETFILTER(SalesLines."No.",'<>%1','');
          SalesLines.SETFILTER(SalesLines."Shipment Date",'<>%1',0D);
          IF SalesLines.FINDSET THEN
          REPEAT
            ShipmentDate := '';
            CustGRec.RESET;
            CustGRec.SETFILTER(CustGRec."No.",SalesLines."Sell-to Customer No.");
            IF CustGRec.FINDFIRST THEN
              IF FORMAT(CustGRec."Payment Realization Period") <> '' THEN
              BEGIN
                ShipmentDate := FORMAT(CALCDATE(CustGRec."Payment Realization Period",SalesLines."Shipment Date"),0,'<Day>-<Month Text,3>-<Year4>');
                cDay := DATE2DMY(CALCDATE(CustGRec."Payment Realization Period",SalesLines."Shipment Date"),1);
                cMonth := DATE2DMY(CALCDATE(CustGRec."Payment Realization Period",SalesLines."Shipment Date"),2);
                cYear := DATE2DMY(CALCDATE(CustGRec."Payment Realization Period",SalesLines."Shipment Date"),3);
              END
              ELSE
              BEGIN
                ShipmentDate := FORMAT(SalesLines."Shipment Date",0,'<Day>-<Month Text,3>-<Year4>');
                cDay := DATE2DMY(SalesLines."Shipment Date",1);
                cMonth := DATE2DMY(SalesLines."Shipment Date",2);
                cYear := DATE2DMY(SalesLines."Shipment Date",3);
              END;
            //ShipmentDate:=FORMAT(SalesLines."Shipment Date",0,'<Day>-<Month Text,3>-<Year4>');
            LineAmt := ROUND(SalesLines."Unit Price",1);
         /*   cDay := DATE2DMY(SalesLines."Shipment Date",1);
            cMonth := DATE2DMY(SalesLines."Shipment Date",2);
            cYear := DATE2DMY(SalesLines."Shipment Date",3);     */
            IF cMonth < 4 THEN
            BEGIN
              AccountYear := cYear -1;
              AccountYearMonth := cMonth+9;
            END
            ELSE
            BEGIN
              AccountYear := cYear;
              AccountYearMonth := cMonth-3;
            END;
            IF cDay < cDay2 THEN
              PeriodNo := 1
            ELSE IF (cDay >= cDay2) AND (cDay < cDay3) THEN
              PeriodNo := 2
            ELSE
            BEGIN
              //MESSAGE(FORMAT(DATE2DMY(CALCDATE('CM',DMY2DATE(1,cMonth,cYear)),1)));
              IF DATE2DMY(CALCDATE('CM',DMY2DATE(1,cMonth,cYear)),1) = 31 THEN
              BEGIN
                IF (cDay >= cDay3) AND (cDay < cDay5) THEN
                  PeriodNo := 3
                ELSE
                  PeriodNo := 4
              END
              ELSE
              BEGIN
                IF (cDay >= cDay3) AND (cDay < cDay4) THEN
                  PeriodNo := 3
                ELSE
                  PeriodNo := 4
              END;
            END;
            IF SalesLines."Shipment Date" = TODAY() THEN
              PeriodNum := 0
            ELSE
              PeriodNum := (AccountYearMonth * 4)-4+PeriodNo;
            IF SalesLines."Quantity Shipped" = 0 THEN
            BEGIN
              SQLQuery := 'insert into MRP_AMC_ORDER1_LINES values('+FORMAT(NewAMCOrderId)+','+
              FORMAT(SalesLines."Line No.")+','+SalesLines."No."+','''+SalesLines.Description+''','''+ShipmentDate+''','+
              FORMAT(LineAmt)+',sysdate,''AUTO'','+FORMAT(PeriodNum)+','+FORMAT(AccountYear)+',0,sysdate)';
            END
            ELSE
            BEGIN
              SQLQuery := 'insert into MRP_AMC_ORDER1_LINES values('+FORMAT(NewAMCOrderId)+','+
              FORMAT(SalesLines."Line No.")+','+SalesLines."No."+','''+SalesLines.Description+''','''+ShipmentDate+''','+
              FORMAT(LineAmt)+',sysdate,''AUTO'','+FORMAT(PeriodNum)+','+FORMAT(AccountYear)+',1,sysdate)'
            END;
            SQLConnection.Execute(SQLQuery);
          UNTIL SalesLines.NEXT=0;
          SQLConnection.CommitTrans;
        END;
        //RecordSet.Close;
        //SQLConnection.Close;
        //ConnectionOpen:=0;
        //End by Pranavi

    end;

    [LineStart(9271)]
    procedure "CashFlow AMC On Hand Integraton_On_Post"();
    var
        SQLConnection : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000514-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Connection";
        RecordSet : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000535-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Recordset";
        SQLQuery : Text;
        RowCount : Integer;
        ConnectionOpen : Integer;
        NoOfRowsAffected : Integer;
        DeleteQuery : Text;
        SQLQuery1 : Text;
        SQLQuery2 : Text;
        SQLQuery3 : Text;
        AMCOrderID : Integer;
        CashflowOrderID : Integer;
        CF_Cust_Id : Integer;
        SalesPerson : Record "Salesperson/Purchaser";
        SalesPersonName : Text;
        SalesLines : Record "Sales Line";
        OrderDate : Text[30];
        AMCStartDate : Text[30];
        AMCEndDate : Text[30];
        ShipmentDate : Text[30];
        OrderValue : BigInteger;
        Quote : Label '''';
        LineAmt : BigInteger;
        Status1 : Char;
        cDay : Integer;
        cMonth : Integer;
        cYear : Integer;
        cDay1 : Integer;
        cDay2 : Integer;
        cDay3 : Integer;
        cDay4 : Integer;
        cDay5 : Integer;
        PeriodNo : Integer;
        PeriodNum : Integer;
        AccountYear : Integer;
        AccountYearMonth : Integer;
        NewAMCOrderId : Integer;
        ExistHeader : Boolean;
    begin
        //Added by Pranavi on 10-10-2015 for AMC orders hand Cashflow integration
        SalesHeader.RESET;
        SalesHeader.SETRANGE(SalesHeader."Document Type",SalesHeader."Document Type"::Amc);
        SalesHeader.SETRANGE(SalesHeader."No.","No.");
        IF SalesHeader.FINDFIRST THEN
        BEGIN
          IF "Requested Delivery Date" = 0D THEN
            ERROR('AMC Period Start Date should not be empty!');
          IF "Promised Delivery Date" = 0D THEN
            ERROR('AMC Period End Date should not be empty!');
          IF "Requested Delivery Date" > "Promised Delivery Date" THEN
            ERROR('AMC Start Date must be less than AMC END Date!');
          IF ("Payment Terms Code" = '') OR ("Payment Terms Code" = ' ') THEN
            ERROR('Please select Payment Terms Code!');
          IF "Sale Order Total Amount" = 0 THEN
            ERROR('Please enter Sale Order Total Amount!');
        END;

        IF ISCLEAR(SQLConnection) THEN
          CREATE(SQLConnection,FALSE,TRUE);

        IF ISCLEAR(RecordSet) THEN
          CREATE(RecordSet,FALSE,TRUE);

        RowCount:=0;
        IF ConnectionOpen <> 1 THEN
        BEGIN
          //SQLConnection.ConnectionString:='DSN=CASHFLOW_TEST;UID=cashflow;PASSWORD=cashflow;SERVER=oracle_test;';
          SQLConnection.ConnectionString:='DSN=CASHFLOW;UID=cashflowuser;PASSWORD=firewall123;SERVER=oracle_80;';
          SQLConnection.Open;
          SQLConnection.BeginTrans;
          ConnectionOpen:=1;
        END;
        IF "No." <> '' THEN
          SQLQuery := 'select * from MRP_AMC_ORDER1 where internal_amc_no = '''+"No."+''''
        ELSE
          SQLQuery := 'select * from MRP_AMC_ORDER1 where internal_amc_no = '''+ERPAMCOrderNo+'''';

        RecordSet:= SQLConnection.Execute(SQLQuery,RowCount);
        RowCount := 0;
        IF NOT( (RecordSet.BOF) OR (RecordSet.EOF)) THEN
           RecordSet.MoveFirst;
        WHILE NOT RecordSet.EOF DO
        BEGIN
          AMCOrderID := RecordSet.Fields.Item('AMC_ORDER_ID').Value;
          RowCount:=RowCount+1;
          RecordSet.MoveNext;
        END;
        //MESSAGE(FORMAT(RowCount));
        SQLQuery := 'select * from MRP_AMC_ORDER1_LINES where AMC_ORDER_ID = '''+FORMAT(AMCOrderID)+'''';
        RecordSet := SQLConnection.Execute(SQLQuery,RowCount);
        RowCount := 0;
        IF NOT( (RecordSet.BOF) OR (RecordSet.EOF)) THEN
           RecordSet.MoveFirst;
        WHILE NOT RecordSet.EOF DO
        BEGIN
          RowCount:=RowCount+1;
          RecordSet.MoveNext;
        END;
        IF RowCount > 0 THEN
        BEGIN
          SalesLines.RESET;
          SalesLines.SETFILTER(SalesLines."Document Type",'%1',SalesLines."Document Type"::Amc);
          SalesLines.SETFILTER(SalesLines."Document No.",'%1',"No.");
          SalesLines.SETFILTER(SalesLines."No.",'<>%1','');
          SalesLines.SETFILTER(SalesLines."Shipment Date",'<>%1',0D);
          IF SalesLines.FINDSET THEN
          BEGIN
            REPEAT
              IF SalesLines."Quantity Shipped" = 0 THEN
              BEGIN
                SQLQuery := 'update MRP_AMC_ORDER1_LINES set INVOICED_STATUS = 0,LAST_MODIFIED_DATE = sysdate where AMC_ORDER_ID = '''+FORMAT(AMCOrderID)+''' and LINE_NUMBER = '+FORMAT(SalesLines."Line No.");
              END
              ELSE
              BEGIN
                SQLQuery := 'update MRP_AMC_ORDER1_LINES set INVOICED_STATUS = 1,LAST_MODIFIED_DATE = sysdate where AMC_ORDER_ID = '''+FORMAT(AMCOrderID)+''' and LINE_NUMBER = '+FORMAT(SalesLines."Line No.");
              END;
              SQLConnection.Execute(SQLQuery);
            UNTIL SalesLines.NEXT=0;
          END
          ELSE //added by pranavi on 26-nov-2015
          BEGIN
            SQLQuery := 'update MRP_AMC_ORDER1_LINES set INVOICED_STATUS = 1,LAST_MODIFIED_DATE = sysdate where AMC_ORDER_ID = '''+FORMAT(AMCOrderID)+'''';
            SQLConnection.Execute(SQLQuery);
          END;
        END;
        SQLConnection.CommitTrans;
        RecordSet.Close;
        SQLConnection.Close;
        ConnectionOpen:=0;
        //End by Pranavi
    end;

    //event RecordSet1(cFields : Integer;"Fields" : Variant;adStatus : Integer;pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset");
    //begin
        /*
        */
    //end;

    //event RecordSet1(cFields : Integer;"Fields" : Variant;pError : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000500-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Error";adStatus : Integer;pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset");
    //begin
        /*
        */
    //end;

    //event RecordSet1(adReason : Integer;cRecords : Integer;adStatus : Integer;pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset");
    //begin
        /*
        */
    //end;

    //event RecordSet1(adReason : Integer;cRecords : Integer;pError : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000500-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Error";adStatus : Integer;pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset");
    //begin
        /*
        */
    //end;

    //event RecordSet1(adReason : Integer;adStatus : Integer;pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset");
    //begin
        /*
        */
    //end;

    //event RecordSet1(adReason : Integer;pError : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000500-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Error";adStatus : Integer;pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset");
    //begin
        /*
        */
    //end;

    //event RecordSet1(adReason : Integer;adStatus : Integer;pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset");
    //begin
        /*
        */
    //end;

    //event RecordSet1(adReason : Integer;pError : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000500-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Error";adStatus : Integer;pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset");
    //begin
        /*
        */
    //end;

    //event RecordSet1(var fMoreData : Boolean;adStatus : Integer;pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset");
    //begin
        /*
        */
    //end;

    //event RecordSet1(Progress : Integer;MaxProgress : Integer;adStatus : Integer;pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset");
    //begin
        /*
        */
    //end;

    //event RecordSet1(pError : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000500-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Error";adStatus : Integer;pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset");
    //begin
        /*
        */
    //end;

    //event SQLConnection1(pError : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000500-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Error";adStatus : Integer;pConnection : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000550-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Connection");
    //begin
        /*
        */
    //end;

    //event SQLConnection1(TransactionLevel : Integer;pError : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000500-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Error";adStatus : Integer;pConnection : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000550-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Connection");
    //begin
        /*
        */
    //end;

    //event SQLConnection1(pError : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000500-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Error";adStatus : Integer;pConnection : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000550-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Connection");
    //begin
        /*
        */
    //end;

    //event SQLConnection1(pError : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000500-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Error";adStatus : Integer;pConnection : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000550-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Connection");
    //begin
        /*
        */
    //end;

    //event SQLConnection1(var Source : Text;CursorType : Integer;LockType : Integer;var Options : Integer;adStatus : Integer;pCommand : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{B08400BD-F9D1-4D02-B856-71D5DBA123E9}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Command";pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset";pConnection : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000550-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Connection");
    //begin
        /*
        */
    //end;

    //event SQLConnection1(RecordsAffected : Integer;pError : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000500-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Error";adStatus : Integer;pCommand : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{B08400BD-F9D1-4D02-B856-71D5DBA123E9}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Command";pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset";pConnection : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000550-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Connection");
    //begin
        /*
        */
    //end;

    //event SQLConnection1(var ConnectionString : Text;var UserID : Text;var Password : Text;var Options : Integer;adStatus : Integer;pConnection : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000550-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Connection");
    //begin
        /*
        */
    //end;

    //event SQLConnection1(pError : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000500-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Error";adStatus : Integer;pConnection : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000550-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Connection");
    //begin
        /*
        */
    //end;

    //event SQLConnection1(adStatus : Integer;pConnection : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000550-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Connection");
    //begin
        /*
        */
    //end;
}

