page 50003 "CAN Blanket Sales Order"
{
    // version NAVW13.70,NAVIN3.70.00.11,SH1.0,Rev01

    Caption = '" CAN Blanket Sales Order"';
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Sales Header";
    SourceTableView = WHERE(Document Type=FILTER(Blanket Order));

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
                        SelltoCustomerNoOnAfterValidat;
                    end;
                }
                field("Sell-to Contact No.";"Sell-to Contact No.")
                {
                }
                field("Sell-to Customer Name";"Sell-to Customer Name")
                {
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
                field("Sell-to Contact";"Sell-to Contact")
                {
                }
                field("Order Date";"Order Date")
                {
                }
                field("Document Date";"Document Date")
                {
                }
                field("Salesperson Code";"Salesperson Code")
                {
                }
                field("Customer OrderNo.";"Customer OrderNo.")
                {
                }
                field("Responsibility Center";"Responsibility Center")
                {
                }
                field(Status;Status)
                {
                }
                field(Control1280004;Structure)
                {
                }
                field("Sale Order Created";"Sale Order Created")
                {
                    Editable = true;
                }
            }
            part(SalesLines;"CANBlanket Sales Order Subform")
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
                field("Order Assurance";"Order Assurance")
                {
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
                field("Payment Terms Code";"Payment Terms Code")
                {
                }
                field("Due Date";"Due Date")
                {
                }
                field("Order Completion Period";"Order Completion Period")
                {
                }
                field("Expecting Week";"Expecting Week")
                {
                }
                field("Payment Method Code";"Payment Method Code")
                {
                }
                field("Expected Order Month";"Expected Order Month")
                {
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
                field("Order Status";"Order Status")
                {
                }
                field("Location Code";"Location Code")
                {
                }
                field("Shipment Method Code";"Shipment Method Code")
                {
                }
                field("Shipment Date";"Shipment Date")
                {
                }
                field("Tender No.";"Tender No.")
                {
                }
                field("Order Released Date";"Order Released Date")
                {
                }
            }
            group("Foreign Trade")
            {
                Caption = 'Foreign Trade';
                field("Currency Code";"Currency Code")
                {

                    trigger OnAssistEdit();
                    begin
                        ChangeExchangeRate.SetParameter("Currency Code","Currency Factor",WORKDATE);
                        IF ChangeExchangeRate.RUNMODAL = ACTION::OK THEN BEGIN
                          VALIDATE("Currency Factor",ChangeExchangeRate.GetParameter);
                          CurrPage.UPDATE;
                        END;
                        CLEAR(ChangeExchangeRate);
                    end;
                }
                field("EU 3-Party Trade";"EU 3-Party Trade")
                {
                }
                field("Transaction Type";"Transaction Type")
                {
                }
                field("Transaction Specification";"Transaction Specification")
                {
                }
                field("Transport Method";"Transport Method")
                {
                }
                field("Exit Point";"Exit Point")
                {
                }
                field("Area";Area)
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
                    Image = Statistics;
                    ShortCutKey = 'F7';

                    trigger OnAction();
                    begin
                        SalesSetup.GET;
                        IF SalesSetup."Calc. Inv. Discount" THEN BEGIN
                          CurrPage.SalesLines.PAGE.CalcInvDisc;
                          COMMIT;
                        END;
                        PAGE.RUNMODAL(PAGE::"Sales Order Statistics",Rec);
                    end;
                }
                action(Card)
                {
                    Caption = 'Card';
                    Image = Card;
                    RunObject = Page "Customer Card";
                                    RunPageLink = No.=FIELD(Sell-to Customer No.);
                    ShortCutKey = 'Shift+F5';
                }
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Sales Comment Sheet";
                                    RunPageLink = Document Type=CONST(Blanket Order),No.=FIELD(No.);
                }
                action(Structure)
                {
                    Caption = 'Structure';
                    Image = CheckList;
                    RunObject = Page "Structure Order Details";
                                    RunPageLink = Type=CONST(Sale),Document Type=FIELD(Document Type),Document No.=FIELD(No.),Structure Code=FIELD(Structure);
                }
            }
            group("&Line")
            {
                Caption = '&Line';
                group("Unposted Lines")
                {
                    Caption = 'Unposted Lines';
                    Image = PostedTaxInvoice;
                    action(Orders)
                    {
                        Caption = 'Orders';
                        Image = "Order";

                        trigger OnAction();
                        begin
                            CurrPage.SalesLines.PAGE.GETRECORD(CurrentSalesLine);
                            SalesLine.RESET;
                            SalesLine.SETCURRENTKEY("Document Type","Blanket Order No.","Blanket Order Line No.");
                            SalesLine.SETRANGE("Document Type",SalesLine."Document Type"::Order);
                            SalesLine.SETRANGE("Blanket Order No.",CurrentSalesLine."Document No.");
                            SalesLine.SETRANGE("Blanket Order Line No.",CurrentSalesLine."Line No.");
                            PAGE.RUNMODAL(PAGE::"Sales Lines",SalesLine);
                        end;
                    }
                    action(Invoices)
                    {
                        Caption = 'Invoices';
                        Image = Invoice;

                        trigger OnAction();
                        begin
                            CurrPage.SalesLines.PAGE.GETRECORD(CurrentSalesLine);
                            SalesLine.RESET;
                            SalesLine.SETCURRENTKEY("Document Type","Blanket Order No.","Blanket Order Line No.");
                            SalesLine.SETRANGE("Document Type",SalesLine."Document Type"::Invoice);
                            SalesLine.SETRANGE("Blanket Order No.",CurrentSalesLine."Document No.");
                            SalesLine.SETRANGE("Blanket Order Line No.",CurrentSalesLine."Line No.");
                            PAGE.RUNMODAL(PAGE::"Sales Lines",SalesLine);
                        end;
                    }
                    action("Return Orders")
                    {
                        Caption = 'Return Orders';
                        Image = ReturnOrder;

                        trigger OnAction();
                        begin
                            CurrPage.SalesLines.PAGE.GETRECORD(CurrentSalesLine);
                            SalesLine.RESET;
                            SalesLine.SETCURRENTKEY("Document Type","Blanket Order No.","Blanket Order Line No.");
                            SalesLine.SETRANGE("Document Type",SalesLine."Document Type"::"Return Order");
                            SalesLine.SETRANGE("Blanket Order No.",CurrentSalesLine."Document No.");
                            SalesLine.SETRANGE("Blanket Order Line No.",CurrentSalesLine."Line No.");
                            PAGE.RUNMODAL(PAGE::"Sales Lines",SalesLine);
                        end;
                    }
                    action("Credit Memos")
                    {
                        Caption = 'Credit Memos';
                        Image = CreditMemo;

                        trigger OnAction();
                        begin
                            CurrPage.SalesLines.PAGE.GETRECORD(CurrentSalesLine);
                            SalesLine.RESET;
                            SalesLine.SETCURRENTKEY("Document Type","Blanket Order No.","Blanket Order Line No.");
                            SalesLine.SETRANGE("Document Type",SalesLine."Document Type"::"Credit Memo");
                            SalesLine.SETRANGE("Blanket Order No.",CurrentSalesLine."Document No.");
                            SalesLine.SETRANGE("Blanket Order Line No.",CurrentSalesLine."Line No.");
                            PAGE.RUNMODAL(PAGE::"Sales Lines",SalesLine);
                        end;
                    }
                }
                group("Posted Lines")
                {
                    Caption = 'Posted Lines';
                    Image = PostedOrder;
                    action(Shipments)
                    {
                        Caption = 'Shipments';
                        Image = Shipment;

                        trigger OnAction();
                        begin
                            CurrPage.SalesLines.PAGE.GETRECORD(CurrentSalesLine);
                            SaleShptLine.RESET;
                            SaleShptLine.SETCURRENTKEY("Blanket Order No.","Blanket Order Line No.");
                            SaleShptLine.SETRANGE("Blanket Order No.",CurrentSalesLine."Document No.");
                            SaleShptLine.SETRANGE("Blanket Order Line No.",CurrentSalesLine."Line No.");
                            PAGE.RUNMODAL(PAGE::"Posted Sales Shipment Lines",SaleShptLine);
                        end;
                    }
                    action(Action110)
                    {
                        Caption = 'Invoices';
                        Image = Invoice;

                        trigger OnAction();
                        begin
                            CurrPage.SalesLines.PAGE.GETRECORD(CurrentSalesLine);
                            SalesInvLine.RESET;
                            SalesInvLine.SETCURRENTKEY("Blanket Order No.","Blanket Order Line No.");
                            SalesInvLine.SETRANGE("Blanket Order No.",CurrentSalesLine."Document No.");
                            SalesInvLine.SETRANGE("Blanket Order Line No.",CurrentSalesLine."Line No.");
                            PAGE.RUNMODAL(PAGE::"Posted Sales Invoice Lines",SalesInvLine);
                        end;
                    }
                    action("Return Receipts")
                    {
                        Caption = 'Return Receipts';
                        Image = ReturnReceipt;

                        trigger OnAction();
                        begin
                            CurrPage.SalesLines.PAGE.GETRECORD(CurrentSalesLine);
                            ReturnRcptLine.RESET;
                            ReturnRcptLine.SETCURRENTKEY("Blanket Order No.","Blanket Order Line No.");
                            ReturnRcptLine.SETRANGE("Blanket Order No.",CurrentSalesLine."Document No.");
                            ReturnRcptLine.SETRANGE("Blanket Order Line No.",CurrentSalesLine."Line No.");
                            PAGE.RUNMODAL(PAGE::"Posted Return Receipt Lines",ReturnRcptLine);
                        end;
                    }
                    action(Action112)
                    {
                        Caption = 'Credit Memos';
                        Image = CreditMemo;

                        trigger OnAction();
                        begin
                            CurrPage.SalesLines.PAGE.GETRECORD(CurrentSalesLine);
                            SalesCrMemoLine.RESET;
                            SalesCrMemoLine.SETCURRENTKEY("Blanket Order No.","Blanket Order Line No.");
                            SalesCrMemoLine.SETRANGE("Blanket Order No.",CurrentSalesLine."Document No.");
                            SalesCrMemoLine.SETRANGE("Blanket Order Line No.",CurrentSalesLine."Line No.");
                            PAGE.RUNMODAL(PAGE::"Posted Sales Credit Memo Lines",SalesCrMemoLine);
                        end;
                    }
                }
                action("Create Production Order")
                {
                    Caption = 'Create Production Order';
                    Image = Production;

                    trigger OnAction();
                    begin
                        SalesPlanLine.DELETEALL;
                        Quantity := CurrPage.SalesLines.PAGE.MakeLines(SalesLineRec);

                        FOR I := 1 TO Quantity
                          DO BEGIN
                            Qty := 1;
                            CreateOrders(Qty);
                          END;
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
                separator(Action134)
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
                separator(Action131)
                {
                }
                action("Re&lease")
                {
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Codeunit "Release Sales Document";
                    ShortCutKey = 'Ctrl+F9';
                }
                action("Re&open")
                {
                    Caption = 'Re&open';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    var
                        ReleaseSalesDoc : Codeunit "Release Sales Document";
                    begin
                        ReleaseSalesDoc.Reopen(Rec);
                    end;
                }
                separator(Action1280002)
                {
                }
                action("Calculate Structure Values")
                {
                    Caption = 'Calculate Structure Values';
                    Image = CalculateSalesTax;

                    trigger OnAction();
                    begin
                        // NAVIN
                        SalesLine.CalculateStructures(Rec);
                        SalesLine.AdjustStructureAmounts(Rec);
                        SalesLine.UpdateSalesLines(Rec);
                        // NAVIN
                    end;
                }
            }
            action("Make &Order")
            {
                Caption = 'Make &Order';
                Image = MakeOrder;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Codeunit "Blnkt Sales Ord. to Ord. (Y/N)";
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
        }
    }

    trigger OnDeleteRecord() : Boolean;
    begin
        CurrPage.SAVERECORD;
        EXIT(ConfirmDeletion);
    end;

    trigger OnModifyRecord() : Boolean;
    begin
        TESTFIELD(Status,Status::Open);
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        "Responsibility Center" := UserMgt.GetSalesFilter();
    end;

    trigger OnOpenPage();
    begin
        IF UserMgt.GetSalesFilter() <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Responsibility Center",UserMgt.GetSalesFilter());
          FILTERGROUP(0);
        END;
    end;

    var
        CurrentSalesLine : Record "Sales Line";
        SalesLine : Record "Sales Line";
        SaleShptLine : Record "Sales Shipment Line";
        SalesInvLine : Record "Sales Invoice Line";
        ReturnRcptLine : Record "Return Receipt Line";
        SalesCrMemoLine : Record "Sales Cr.Memo Line";
        CopySalesDoc : Report "Copy Sales Document";
                           DocPrint : Codeunit "Document-Print";
                           SalesSetup : Record "Sales & Receivables Setup";
                           UserMgt : Codeunit "User Setup Management";
                           "Mail-Id" : Record User;
                           "from Mail" : Text[100];
                           "to mail" : Text[1000];
                           Mail_Subject : Text[250];
                           Mail_Body : Text[250];
                           mail : Codeunit Mail;
                           SalesPlanLine : Record "Sales Planning Line";
                           Quantity : Decimal;
                           I : Integer;
                           Qty : Integer;
                           SalesLineRec : Record "Sales Line";
                           NewStatus : Option Simulated,Planned,"Firm Planned",Released;
                           NewOrderType : Option ItemOrder,ProjectOrder;
                           charline : Char;
                           SH : Record "Sales Header";
                           Attachment : Text[1000];
                           objEmailConf : Automation "'{CD000000-8B95-11D1-82DB-00C04FB1625D}' 1.0:'{CD000002-8B95-11D1-82DB-00C04FB1625D}':''{CD000000-8B95-11D1-82DB-00C04FB1625D}' 1.0'.Configuration";
                           objEmail : Automation "'{CD000000-8B95-11D1-82DB-00C04FB1625D}' 1.0:'{CD000001-8B95-11D1-82DB-00C04FB1625D}':''{CD000000-8B95-11D1-82DB-00C04FB1625D}' 1.0'.Message";
                           flds : Automation "'{00000205-0000-0010-8000-00AA006D2EA4}' 2.5:'{00000564-0000-0010-8000-00AA006D2EA4}':''{00000205-0000-0010-8000-00AA006D2EA4}' 2.5'.Fields";
                           fld : Automation "'{00000205-0000-0010-8000-00AA006D2EA4}' 2.5:'{00000569-0000-0010-8000-00AA006D2EA4}':''{00000205-0000-0010-8000-00AA006D2EA4}' 2.5'.Field";
                           SMTPSETUP : Record "Product Customer's List";
                           ChangeExchangeRate : Page "Change Exchange Rate";

    [LineStart(17)]
    procedure CreateOrders(Qtyparam: Decimal) OrdersCreated: Boolean;
    var
        Item: Record Item;
        SalesLine: Record "Sales Line";
        ProdOrderFromSale: Codeunit "Create Prod. Order from Sale";
    begin
        IF NOT SalesPlanLine.FINDSET THEN
            EXIT;

        REPEAT
            SalesLine.GET(
              SalesLine."Document Type"::"Blanket Order",
              SalesPlanLine."Sales Order No.",
              SalesPlanLine."Sales Order Line No.");
            //SalesLine.TESTFIELD("Shipment Date");
            SalesLine.CALCFIELDS("Reserved Qty. (Base)");
            //IF SalesLine."Outstanding Qty. (Base)" > SalesLine."Reserved Qty. (Base)" THEN BEGIN
            Item.GET(SalesLine."No.");

            IF Item."Replenishment System" = Item."Replenishment System"::"Prod. Order" THEN BEGIN
                OrdersCreated := TRUE;
                ProdOrderFromSale.CreateProdOrder2(
                  SalesLine, NewStatus::Released, NewOrderType::ItemOrder, 1);
                IF NewOrderType = NewOrderType::ProjectOrder THEN
                    EXIT;
            END;
        //END;
        UNTIL (SalesPlanLine.NEXT = 0);
    end;

    [LineStart(41)]
    local procedure SelltoCustomerNoOnAfterValidat();
    begin
        CurrPage.UPDATE;
    end;

    [LineStart(44)]
    local procedure BilltoCustomerNoOnAfterValidat();
    begin
        CurrPage.UPDATE;
    end;

    [LineStart(47)]
    local procedure ShortcutDimension1CodeOnAfterV();
    begin
        CurrPage.SalesLines.PAGE.UpdateForm(TRUE);
    end;

    [LineStart(50)]
    local procedure ShortcutDimension2CodeOnAfterV();
    begin
        CurrPage.SalesLines.PAGE.UpdateForm(TRUE);
    end;
}

