page 60257 "Sales Due SD List"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Worksheet;
    Permissions = TableData "Sales Invoice Header" = rm;
    SourceTable = "Sales Invoice Header";
    SourceTableTemporary = true;
    SourceTableView = SORTING(Order No., Posting Date) ORDER(Ascending);

    layout
    {
        area(content)
        {
            field("TotCaption+FORMAT(Rec.COUNT)"; TotCaption + FORMAT(Rec.COUNT))
            {
            }
            field(Color_Desc; Color_Desc)
            {
                ShowCaption = false;
                Style = Favorable;
                StyleExpr = TRUE;
            }
            field(Color_Desc1; Color_Desc1)
            {
                ShowCaption = false;
                Style = Ambiguous;
                StyleExpr = TRUE;
            }
            repeater(Group)
            {
                field("SD Fin Verification"; "SD Fin Verification")
                {

                    trigger OnValidate();
                    begin
                        IF NOT (USERID IN ['EFFTRONICS\RAJANI', 'EFFTRONICS\VISHNUPRIYA', 'EFFTRONICS\SUSMITHAL']) THEN BEGIN
                            ERROR('You Do Not Have a rights');
                        END;
                        IF "Consignee Name" = 'New Running Order' THEN BEGIN
                            SH.RESET;
                            SH.SETRANGE(SH."No.", "Order No.");
                            IF SH.FINDFIRST THEN BEGIN
                                SH."SD Fin Verification" := "SD Fin Verification";
                                SH."BG Fin Status" := "BG Fin Status";
                                SH.MODIFY;
                            END
                        END
                        ELSE BEGIN
                            SIH.RESET;
                            SIH.SETRANGE(SIH."Order No.", "Order No.");
                            IF SIH.FINDSET THEN
                                REPEAT
                                    SIH."SD Fin Verification" := "SD Fin Verification";
                                    SIH."BG Fin Status" := "BG Fin Status";
                                    SIH.MODIFY;
                                UNTIL SIH.NEXT = 0;
                        END;

                        //'New Running Order'
                    end;
                }
                field("BG Fin Status"; "BG Fin Status")
                {
                }
                field("Order No."; "Order No.")
                {
                    Editable = false;
                    StyleExpr = Color;
                }
                field("Sell-to Customer No."; "Sell-to Customer No.")
                {
                    Editable = false;
                    StyleExpr = ColorFinlRlyBillDt;
                }
                field("Sell-to Customer Name"; "Sell-to Customer Name")
                {
                    Editable = false;
                }
                field("Salesperson Code"; "Salesperson Code")
                {
                    Editable = false;
                }
                field("Sales Person Name"; "Posting Description")
                {
                    CaptionML = ENU = 'Sales Person Name',
                                ENN = 'Posting Description';
                    Editable = false;
                }
                field("Customer Posting Group"; "Customer Posting Group")
                {
                    Editable = false;
                }
                field("Warranty Period"; "Warranty Period")
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
                field("Sale Order Total Amount"; "Sale Order Total Amount")
                {
                    Editable = false;
                }
                field("Consignee Name"; "Consignee Name")
                {
                    Editable = false;
                }
                field("Security Deposit Amount"; "Security Deposit Amount")
                {
                    Editable = false;
                }
                field("EMD Amount"; "EMD Amount")
                {
                    Editable = false;
                }
                field("SD Paid Amount"; "SD Paid Amount")
                {
                }
                field("SD Received Amount"; "SD Received Amount")
                {
                }
                field("Security Deposit"; "Security Deposit")
                {
                    Caption = 'SD Mode';
                    Editable = false;
                }
                field(SecDepStatus; SecDepStatus)
                {
                    Editable = false;
                }
                field("SD Status"; "SD Status")
                {
                    Editable = false;
                }
                field("Final Railway Bill Date"; "Final Railway Bill Date")
                {
                    Editable = false;
                }
                field(Remarks; Remarks)
                {
                    CaptionML = ENU = 'Remarks',
                                ENN = 'Reason Code';

                    trigger OnValidate();
                    begin
                        SIH.RESET;
                        SIH.SETCURRENTKEY("Order No.", "Posting Date");
                        SIH.SETRANGE(SIH."Order No.", "Order No.");
                        IF SIH.FINDSET THEN
                            REPEAT
                                SIH.Remarks := Remarks;
                                SIH.MODIFY;
                            UNTIL SIH.NEXT = 0;
                        CurrPage.UPDATE;
                    end;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1102152025; Links)
            {
                Visible = false;
            }
            systempart(Control1102152002; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        IF Remarks <> '' THEN
            Color := 'Favorable'
        ELSE
            Color := '';
        IF "Final Railway Bill Date" = 0D THEN
            ColorFinlRlyBillDt := 'Ambiguous'
        ELSE
            ColorFinlRlyBillDt := '';
    end;

    trigger OnOpenPage();
    begin
        CurrPage.EDITABLE := TRUE;
        //DELETEALL;
        RESET;
        SETCURRENTKEY("Order No.");
        OrdersCount := 0;
        NextOrdersCnt := 0;
        LastOrder := '';
        SalesInvHdr.RESET;
        SalesInvHdr.SETCURRENTKEY("Order No.", "Posting Date");
        //SalesInvHdr.SETRANGE(SalesInvHdr.SecDepStatus,SalesInvHdr.SecDepStatus::Due);  Comment by vijaya on 03-Feb-2017
        //SalesInvHdr.SETFILTER(SalesInvHdr."SD Status",'Not Received');
        SalesInvHdr.SETFILTER(SalesInvHdr."Order No.", '<>%1', '');
        SalesInvHdr.SETFILTER(SalesInvHdr.SecDepStatus, '<>%1', SalesInvHdr.SecDepStatus::Received);
        SalesInvHdr.SETFILTER(SalesInvHdr."SD Status", '<>%1', SalesInvHdr."SD Status"::NA);
        IF SalesInvHdr.FINDSET THEN BEGIN
            REPEAT
                LastOrder := '';
                OrdersCount := 0;
                NextOrdersCnt := 0;

                SIH.RESET;
                SIH.SETCURRENTKEY("Order No.", "Posting Date");
                SIH.SETRANGE(SIH."Order No.", SalesInvHdr."Order No.");
                IF SIH.FINDLAST THEN
                    LastOrder := SIH."No.";

                IF SalesInvHdr."No." = LastOrder THEN BEGIN
                    Rec := SalesInvHdr;
                    INSERT;
                    IF COPYSTR("Order No.", 5, 3) = 'AMC' THEN BEGIN
                        Customer.RESET;
                        IF Customer.GET("Sell-to Customer No.") THEN BEGIN
                            ServiceZone.RESET;
                            ServiceZone.SETRANGE(ServiceZone.Code, Customer."Service Zone Code");
                            IF ServiceZone.FINDFIRST THEN BEGIN
                                "Salesperson Code" := ServiceZone."Project Manager";
                                MODIFY;
                            END;
                        END;
                    END;
                    IF SP.GET("Salesperson Code") THEN BEGIN
                        "Posting Description" := SP.Name;
                        MODIFY;
                    END;
                    Tot := Tot + 1;
                END;
            UNTIL SalesInvHdr.NEXT = 0;
        END;
        // added by vijaya on 04-May-2017

        RESET;
        SH.RESET;
        SH.SETRANGE(SH.Status, SH.Status::Released);
        SH.SETFILTER(SH."SD Status", '<>%1', SH."SD Status"::NA);
        SH.SETFILTER(SH."Document Type", '%1|%2', SH."Document Type"::Amc, SH."Document Type"::Order);
        IF SH.FINDSET THEN
            REPEAT
                SIH.RESET;
                SIH.SETRANGE(SIH."Order No.", SH."No.");
                IF NOT (SIH.FINDFIRST) THEN BEGIN
                    "SD Fin Verification" := SH."SD Fin Verification";
                    "BG Fin Status" := SH."BG Fin Status";
                    "No." := SH."No.";
                    "Order No." := SH."No.";
                    "Sell-to Customer No." := SH."Sell-to Customer No.";
                    "Sell-to Customer Name" := SH."Sell-to Customer Name";
                    "Customer Posting Group" := SH."Customer Posting Group";
                    //"Warranty Period" := "0Y";
                    "Customer OrderNo." := SH."Customer OrderNo.";
                    "Sale Order Total Amount" := SH."Sale Order Total Amount";
                    "Consignee Name" := 'New Running Order';
                    "Security Deposit Amount" := SH."Security Deposit Amount";
                    "EMD Amount" := "EMD Amount";
                    "Security Deposit" := SH."Security Deposit";
                    SecDepStatus := SH.SecDepStatus;
                    "SD Status" := SH."SD Status";
                    "Final Railway Bill Date" := 0D;
                    Remarks := '';
                    INSERT;
                    IF COPYSTR("Order No.", 5, 3) = 'AMC' THEN BEGIN
                        Customer.RESET;
                        IF Customer.GET("Sell-to Customer No.") THEN BEGIN
                            ServiceZone.RESET;
                            ServiceZone.SETRANGE(ServiceZone.Code, Customer."Service Zone Code");
                            IF ServiceZone.FINDFIRST THEN BEGIN
                                "Salesperson Code" := ServiceZone."Project Manager";
                                MODIFY;
                            END;
                        END;
                    END;
                    IF SP.GET("Salesperson Code") THEN BEGIN
                        "Posting Description" := SP.Name;
                        MODIFY;
                    END;
                    Tot := Tot + 1;
                END;
            UNTIL SH.NEXT = 0;

        // end by vijaya on 04-May-2017
    end;

    var
        Tot: Integer;
        LastOrder: Code[20];
        SIH: Record "Sales Invoice Header";
        OrdersCount: Integer;
        NextOrdersCnt: Integer;
        SalesInvHdr: Record "Sales Invoice Header";
        Color: Text[20];
        TotCaption: Label '"Total Orders : "';
        ColorFinlRlyBillDt: Text[20];
        Color_Desc: Label 'Remarks Updated!';
        Color_Desc1: Label 'Final Railway Bill Date Not Updated!';
        Customer: Record Customer;
        ServiceZone: Record "Service Zone";
        SP: Record "Salesperson/Purchaser";
        SH: Record "Sales Header";
}

