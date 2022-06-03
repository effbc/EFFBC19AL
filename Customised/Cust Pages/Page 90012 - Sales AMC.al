page 90012 "Sales AMC"
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
    SourceTableView = WHERE(Document Type=CONST(Amc));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; "No.")
                {

                    trigger OnAssistEdit();
                    begin
                        IF AssistEdit(xRec) THEN
                            CurrPage.UPDATE;
                    end;
                }
                field("Sell-to Customer No."; "Sell-to Customer No.")
                {

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
                }
                field("Sell-to Address 2"; "Sell-to Address 2")
                {
                }
                field("Sell-to Post Code"; "Sell-to Post Code")
                {
                    Caption = 'Sell-to Post Code/City';
                }
                field("Sell-to City"; "Sell-to City")
                {
                }
                field(State; State)
                {
                    Editable = true;
                }
                field(Control1280009; Structure)
                {
                }
                field(Status; Status)
                {
                }
                field("Installation Amount"; "Installation Amount")
                {
                }
                field("Bought out Items Amount"; "Bought out Items Amount")
                {
                }
                field(Product; Product)
                {
                }
                field("Posting Date"; "Posting Date")
                {
                }
                field("Order Date"; "Order Date")
                {
                }
                field("Shipment Date"; "Shipment Date")
                {
                }
                field("Requested Delivery Date"; "Requested Delivery Date")
                {
                    Caption = 'Amc Period  Start Date';

                    trigger OnValidate();
                    begin
                        IF "Order Date" > "Requested Delivery Date" THEN
                            ERROR('Requested Delivery Date Must be Greater than Order Date');
                    end;
                }
                field("Promised Delivery Date"; "Promised Delivery Date")
                {
                    Caption = 'Amc Period  End  Date';
                }
                field("External Document No."; "External Document No.")
                {
                    Caption = 'Invoice Number';
                }
                field("Salesperson Code"; "Salesperson Code")
                {
                }
                field("Project Completion Date"; "Project Completion Date")
                {
                }
                field("Extended Date"; "Extended Date")
                {
                }
                field("Order Assurance"; "Order Assurance")
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

                        IF "Order Assurance" = TRUE AND (Status = Status::Open) THEN BEGIN
                            "Order AssuranceEditable" := FALSE;
                            "Assured Date" := TODAY;
                        END ELSE
                            "Order AssuranceEditable" := TRUE;

                    end;
                }
                field("Security Deposit Status"; "Security Deposit Status")
                {
                    Caption = 'Status';
                }
                field("Sale Order Total Amount"; "Sale Order Total Amount")
                {
                    Editable = true;
                }
                field("Customer OrderNo."; "Customer OrderNo.")
                {
                }
                field("Customer Order Date"; "Customer Order Date")
                {
                }
            }
            part(SalesLines; 90013)
            {
                SubPageLink = Field3 = FIELD(No.);
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';
                field("Bill-to Customer No."; "Bill-to Customer No.")
                {

                    trigger OnValidate();
                    begin
                        BilltoCustomerNoOnAfterValidat;
                    end;
                }
                field("Bill-to Contact No."; "Bill-to Contact No.")
                {
                }
                field("Bill-to Name"; "Bill-to Name")
                {
                }
                field("Bill-to Address"; "Bill-to Address")
                {
                }
                field("Bill-to Address 2"; "Bill-to Address 2")
                {
                }
                field("Bill-to Post Code"; "Bill-to Post Code")
                {
                    Caption = 'Bill-to Post Code/City';
                }
                field("Bill-to City"; "Bill-to City")
                {
                }
                field("Bill-to Contact"; "Bill-to Contact")
                {
                }
                field("Tax Area Code"; "Tax Area Code")
                {
                    Editable = false;
                }
                field("Form Code"; "Form Code")
                {
                }
                field("Form No."; "Form No.")
                {
                }
                field("No. Series"; "No. Series")
                {
                    Editable = true;
                }
                field("Payment Discount %"; "Payment Discount %")
                {
                    Caption = 'Expected Payment %';
                }
                field("Station Names"; "Station Names")
                {
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {

                    trigger OnValidate();
                    begin
                        ShortcutDimension1CodeOnAfterV;
                    end;
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {

                    trigger OnValidate();
                    begin
                        ShortcutDimension2CodeOnAfterV;
                    end;
                }
                field("Currency Code"; "Currency Code")
                {
                }
                field("Payment Terms Code"; "Payment Terms Code")
                {
                }
                field("Due Date"; "Due Date")
                {
                }
                field("Payment Method Code"; "Payment Method Code")
                {
                }
                field("LC No."; "LC No.")
                {
                }
                field("No. of Archived Versions"; "No. of Archived Versions")
                {

                    trigger OnDrillDown();
                    var
                        SalesHeaderArchive: Record "Sales Header Archive";
                    begin
                        CurrPage.SAVERECORD;
                        COMMIT;
                        SalesHeaderArchive.SETRANGE("Document Type", "Document Type"::Order);
                        SalesHeaderArchive.SETRANGE("No.", "No.");
                        SalesHeaderArchive.SETRANGE("Doc. No. Occurrence", "Doc. No. Occurrence");
                        IF SalesHeaderArchive.GET("Document Type"::Order, "No.", "Doc. No. Occurrence", "No. of Archived Versions") THEN;
                        PAGE.RUNMODAL(PAGE::"Sales List Archive", SalesHeaderArchive);
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                field("VAT Bus. Posting Group"; "VAT Bus. Posting Group")
                {
                }
                field("Language Code"; "Language Code")
                {
                }
                field("Transport Method"; "Transport Method")
                {
                }
                field("Tender No."; "Tender No.")
                {
                    Editable = false;
                }
            }
            group(Shipping)
            {
                Caption = 'Shipping';
                field("Ship-to Code"; "Ship-to Code")
                {
                }
                field("Ship-to Name"; "Ship-to Name")
                {
                }
                field("Ship-to Address"; "Ship-to Address")
                {
                }
                field("Ship-to Address 2"; "Ship-to Address 2")
                {
                }
                field("Ship-to Post Code"; "Ship-to Post Code")
                {
                    Caption = 'Ship-to Post Code/City';
                }
                field("Ship-to City"; "Ship-to City")
                {
                }
                field("Ship-to Contact"; "Ship-to Contact")
                {
                }
                field("Transit Document"; "Transit Document")
                {
                }
                field("Posting No. Series"; "Posting No. Series")
                {
                }
                field("Shipping No. Series"; "Shipping No. Series")
                {
                }
                field("MSPT Date"; "MSPT Date")
                {
                }
                field("MSPT Code"; "MSPT Code")
                {
                }
                field("<Transport Method2>"; "Transport Method")
                {
                }
                field("Location Code"; "Location Code")
                {
                }
                field("Shipment Method Code"; "Shipment Method Code")
                {
                }
                field("Shipping Agent Code"; "Shipping Agent Code")
                {
                }
                field("Shipping Agent Service Code"; "Shipping Agent Service Code")
                {
                }
                field("Shipping Time"; "Shipping Time")
                {
                    Editable = true;
                }
                field("Late Order Shipping"; "Late Order Shipping")
                {
                }
                field("Package Tracking No."; "Package Tracking No.")
                {
                }
                field("<Shipment Date2>"; "Shipment Date")
                {

                    trigger OnValidate();
                    begin
                        SalesLine."Shipment Date" := "Posting Date";
                    end;
                }
                field("Shipping Advice"; "Shipping Advice")
                {
                }
                field(WayBillNo; WayBillNo)
                {
                }
            }
            group("Installtion Status")
            {
                Caption = 'Installtion Status';
                field(Installation; Installation)
                {
                }
                field("Inst.Status"; "Inst.Status")
                {
                }
                field("Inst.Start Date"; "Inst.Start Date")
                {
                    Caption = 'Base Plan Start date';
                }
                field("Assured Date"; "Assured Date")
                {
                }
                field("Revised Target Date"; "Revised Target Date")
                {

                    trigger OnValidate();
                    begin
                        "Sales Date" := CALCDATE('15D', "Revised Target Date");
                    end;
                }
                field("Base PLan Comp. Date"; "Base PLan Comp. Date")
                {
                    Caption = 'Base PLan Comp. Date';

                    trigger OnValidate();
                    begin
                        "Deviated Days" := FORMAT("Base PLan Comp. Date" - "Inst.Start Date");
                    end;
                }
                field("Revised Comp.Date"; "Revised Comp.Date")
                {
                }
                field("Deviated Days"; "Deviated Days")
                {
                    Editable = true;
                }
                field("Sales Date"; "Sales Date")
                {
                    Caption = 'Payment Exp.Date';
                    Editable = true;
                }
                field(Remarks; Remarks)
                {
                    Caption = 'Inst.Issues';
                }
            }
            group("Sales Status")
            {
                Caption = 'Sales Status';
                field("Order Status"; "Order Status")
                {
                }
                field(Inspection; Inspection)
                {
                }
                field(CallLetterExpireDate; CallLetterExpireDate)
                {
                }
                field(CallLetterRecivedDate; CallLetterRecivedDate)
                {
                }
                field("Payment Date"; "Payment Date")
                {
                }
                field("Reason For Pending"; "Reason For Pending")
                {
                    Caption = 'Supply Issues';
                }
                field("Call letters Status"; "Call letters Status")
                {
                }
                field("Call Letter Exp.Date"; "Call Letter Exp.Date")
                {
                }
                field("BG Status"; "BG Status")
                {
                }
                field("<Payment Terms Code2>"; "Payment Terms Code")
                {
                }
                field("Exp.Payment"; "Exp.Payment")
                {
                    Caption = 'BG Value';
                }
                field("CA Date"; "CA Date")
                {
                }
                field("Posting No."; "Posting No.")
                {
                    Visible = false;
                }
            }
            group(" Others")
            {
                Caption = '" Others"';
                field("RDSO Charges Paid By"; "RDSO Charges Paid By")
                {
                }
                field("RDSO Inspection Req"; "RDSO Inspection Req")
                {
                }
                field("RDSO Inspection By"; "RDSO Inspection By")
                {
                }
                field("RDSO Charges"; "RDSO Charges")
                {
                }
                field("RDSO Call Letter"; "RDSO Call Letter")
                {
                }
                field("<Tender No2.>"; "Tender No.")
                {
                }
                field("CA Number"; "CA Number")
                {
                }
                field("LD Amount"; "LD Amount")
                {
                }
                field("Document Position"; "Document Position")
                {
                }
                field("Reason Code"; "Reason Code")
                {
                }
                field("Security Deposit"; "Security Deposit")
                {
                }
            }
            group(Control1904868001)
            {
                Caption = 'Security Deposit';
                field("Security Deposit Amount"; "Security Deposit Amount")
                {
                }
                field("Deposit Payment Due Date"; "Deposit Payment Due Date")
                {
                }
                field("Deposit Payment Date"; "Deposit Payment Date")
                {
                }
                field("<Security Deposit Status2>"; "Security Deposit Status")
                {
                }
                field("SD Requested Date"; "SD Requested Date")
                {
                }
                field("SD Required Date"; "SD Required Date")
                {
                }
                field("SecurityDeposit Exp. Rcpt Date"; "SecurityDeposit Exp. Rcpt Date")
                {
                }
                field("Final Bill Date"; "Final Bill Date")
                {
                }
                field("Warranty Period"; "Warranty Period")
                {
                }
                field("<Due Date2>"; "Due Date")
                {
                }
                field("SD Status"; "SD Status")
                {
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
        [InDataSet]
        "Order AssuranceEditable" : Boolean;
        Text19007218 : Label 'Commerce Portal';

    [LineStart(22713)]
    procedure UpdateAllowed() : Boolean;
    begin
        IF CurrPage.EDITABLE = FALSE THEN
          ERROR(Text000);
        EXIT(TRUE);
    end;

    [LineStart(22718)]
    procedure "---NAVIN---"();
    begin
    end;

    [LineStart(22721)]
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
            //DIM1.0
            SalesExportOrderLine."Dimension Set ID" := SalesOrderLine."Dimension Set ID";
            //DIM1.0
            SalesExportOrderLine.INSERT;
            //DIM1.0 Start
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
        
        //DIM Start
        //Code Commented
        /*
        FromDocDim.SETRANGE("Line No.");
        FromDocDim.DELETEALL;
        *///DIM End
        
        MESSAGE(
          Text002,
          "No.",SalesExportOrderHeader."No.");

    end;

    [LineStart(22872)]
    procedure "---B2B---"();
    begin
    end;

    [LineStart(22875)]
    procedure DocumentPosition();
    begin
        /*
        IF "Document Position" = "Document Position" :: Design THEN
          CurrPage.EDITABLE := FALSE
        ELSE
          CurrPage.EDITABLE := TRUE;
        */

    end;

    [LineStart(22883)]
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

    [LineStart(22908)]
    procedure calcamt();
    begin
        "Sale Order Total Amount":=0;
        SalesLine.SETRANGE(SalesLine."Document No.","No.");
        IF SalesLine.FINDSET THEN
         REPEAT
          "Sale Order Total Amount"+=SalesLine."Line Amount"+SalesLine."Excise Amount"+SalesLine."Tax Amount";
         UNTIL SalesLine.NEXT=0;
         MODIFY;
    end;

    [LineStart(22917)]
    local procedure SelltoCustomerNoOnAfterValidat();
    begin
        CurrPage.UPDATE;
    end;

    [LineStart(22920)]
    local procedure BilltoCustomerNoOnAfterValidat();
    begin
        CurrPage.UPDATE;
    end;

    [LineStart(22923)]
    local procedure ShortcutDimension1CodeOnAfterV();
    begin
        CurrPage.SalesLines.PAGE.UpdateForm(TRUE);
    end;

    [LineStart(22926)]
    local procedure ShortcutDimension2CodeOnAfterV();
    begin
        CurrPage.SalesLines.PAGE.UpdateForm(TRUE);
    end;

    [LineStart(22929)]
    local procedure OnAfterGetCurrRecord();
    begin
        xRec := Rec;
        DocumentPosition;
    end;
}

