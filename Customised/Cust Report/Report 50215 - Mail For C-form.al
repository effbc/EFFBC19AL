report 50215 "Mail For C-form"
{
    // version Rev01,Eff02

    DefaultLayout = RDLC;
    RDLCLayout = './Mail For C-form.rdlc';

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = SORTING(Posting Date) ORDER(Ascending) WHERE(C-form Status=FILTER(<>Received),Customer Posting Group=CONST(PRIVATE),Form Code=CONST(C),Posting Date=FILTER(>03/31/09));
            RequestFilterFields = "Sell-to Customer No.";
            column(NAME______TO_BE_SUBMITTED_C_FORMS_;NAME+' -  TO BE SUBMITTED C-FORMS')
            {
            }
            column(Customer_Order_No_;"Customer OrderNo.")
            {
            }
            column(POSTING_DATE;FORMAT("Posting Date",0,'<Day>-<Month Text,3>-<Year4>'))
            {
            }
            column(PENDINGDAYS;PENDINGDAYS)
            {
            }
            column(Sales_Invoice_Header__External_Document_No__;"External Document No.")
            {
            }
            column(ChangeCurrencyFormat_Amount_;ChangeCurrencyFormat(Amount))
            {
                AutoFormatType = 0;
                DecimalPlaces = 0:0;
            }
            column(Sales_Invoice_Header__Order_No__;"Order No.")
            {
            }
            column(Customer_Order_No_Caption;Customer_Order_No_CaptionLbl)
            {
            }
            column(BILL_DATECaption;BILL_DATECaptionLbl)
            {
            }
            column(AMOUNTCaption;AMOUNTCaptionLbl)
            {
            }
            column(PENDING_DAYSCaption;PENDING_DAYSCaptionLbl)
            {
            }
            column(Invoice_No_Caption;Invoice_No_CaptionLbl)
            {
            }
            column(EFFTRONICS_Order_No_Caption;EFFTRONICS_Order_No_CaptionLbl)
            {
            }
            column(Sales_Invoice_Header_No_;"No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                 Amount :=0;
                 CUSTOMER.SETFILTER(CUSTOMER."No.","Sales Invoice Header"."Sell-to Customer No.");
                 IF CUSTOMER.FINDFIRST THEN
                 NAME :=CUSTOMER.Name;
                 PENDINGDAYS:=TODAY-"Sales Invoice Header"."Posting Date";
                 SIL.SETFILTER(SIL."Document No.","No.");
                 IF SIL.FIND('-') THEN
                 REPEAT
                    Amount := Amount + SIL."Amount Including Tax";
                 UNTIL SIL.NEXT =0;
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
        Amount : Decimal;
        SIL : Record "Sales Invoice Line";
        CUSTOMER : Record Customer;
        NAME : Text[50];
        PENDINGDAYS : Integer;
        Customer_Order_No_CaptionLbl : Label 'Customer Order No.';
        BILL_DATECaptionLbl : Label 'BILL DATE';
        AMOUNTCaptionLbl : Label 'AMOUNT';
        PENDING_DAYSCaptionLbl : Label 'PENDING DAYS';
        Invoice_No_CaptionLbl : Label 'Invoice No.';
        EFFTRONICS_Order_No_CaptionLbl : Label 'EFFTRONICS Order No.';

    [LineStart(9584)]
    procedure ChangeCurrencyFormat(Amt : Decimal) AmountText : Text[30];
    var
        I : Integer;
        s : Text[30];
    begin
        AmountText:=FORMAT(Amt,0,'<Precision,0:0><Standard Format,2>');
        FOR I:=1 TO 10 DO
        BEGIN
        IF STRLEN(AmountText)>(3*I) THEN
        BEGIN
        s:=INSSTR(AmountText,',',STRLEN(AmountText)-(3*I-1));
        AmountText :=s;
        END
        ELSE
        I:=10;
        END;
    end;
}

