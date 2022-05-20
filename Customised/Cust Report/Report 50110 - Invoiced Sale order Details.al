report 50110 "Invoiced Sale order Details"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Invoiced Sale order Details.rdlc';

    dataset
    {
        dataitem("Sales Header";"Sales Header")
        {
            DataItemTableView = SORTING(Document Type,No.);
            RequestFilterFields = "Sell-to Customer No.";
            column(Sales_Header_Document_Type;"Document Type")
            {
            }
            column(Sales_Header_No_;"No.")
            {
            }
            column(Sales_Header_Sell_to_Customer_No_;"Sell-to Customer No.")
            {
            }
            dataitem("Sales Invoice Header";"Sales Invoice Header")
            {
                DataItemLink = Order No.=FIELD(No.);
                DataItemTableView = SORTING(Order No.) ORDER(Ascending);
                column(Sales_Invoice_Header__Customer_OrderNo__;"Customer OrderNo.")
                {
                }
                column(Sales_Invoice_Header__Sell_to_Customer_Name_;"Sell-to Customer Name")
                {
                }
                column(Sales_Header___Sale_Order_Total_Amount_;"Sales Header"."Sale Order Total Amount")
                {
                }
                column(Sales_Header___No__;"Sales Header"."No.")
                {
                }
                column(Customer_Order_NoCaption;Customer_Order_NoCaptionLbl)
                {
                }
                column(Invoice_NoCaption;Invoice_NoCaptionLbl)
                {
                }
                column(Invoiced_AmountCaption;Invoiced_AmountCaptionLbl)
                {
                }
                column(Customer_NameCaption;Customer_NameCaptionLbl)
                {
                }
                column(ReceiptCaption;ReceiptCaptionLbl)
                {
                }
                column(BalanceCaption;BalanceCaptionLbl)
                {
                }
                column(SAL_ORDER_NOCaption;SAL_ORDER_NOCaptionLbl)
                {
                }
                column(Total_Order_AmountCaption;Total_Order_AmountCaptionLbl)
                {
                }
                column(Sent_ItemCaption;Sent_ItemCaptionLbl)
                {
                }
                column(Sales_Invoice_Header_No_;"No.")
                {
                }
                column(Sales_Invoice_Header_Order_No_;"Order No.")
                {
                }
                dataitem("Cust. Ledger Entry";"Cust. Ledger Entry")
                {
                    DataItemLink = Document No.=FIELD(No.);
                    DataItemTableView = SORTING(Entry No.) ORDER(Ascending);
                    column(Cust__Ledger_Entry__External_Document_No__;"External Document No.")
                    {
                    }
                    column(Cust__Ledger_Entry_Amount;Amount)
                    {
                    }
                    column(desc;desc)
                    {
                    }
                    column(receivedamt;receivedamt)
                    {
                    }
                    column(Cust__Ledger_Entry_Entry_No_;"Entry No.")
                    {
                    }
                    column(Cust__Ledger_Entry_Document_No_;"Document No.")
                    {
                    }

                    trigger OnPreDataItem();
                    begin

                        invoicedamt:=0;
                    end;
                }

                trigger OnPreDataItem();
                begin
                    amt:=0;
                     s:=0;
                end;
            }
            dataitem("Cust. Ledger Entry1";"Cust. Ledger Entry")
            {
                DataItemLink = Customer ord No=FIELD(No.);
                DataItemTableView = SORTING(Entry No.) ORDER(Ascending);
                column(totalamt;totalamt)
                {
                }
                column(Cust__Ledger_Entry1__Amount_totalamt__Cust__Ledger_Entry1__Amount_s;-"Cust. Ledger Entry1".Amount+totalamt+"Cust. Ledger Entry1".Amount+s)
                {
                }
                column(s;s)
                {
                }
                column(Cust__Ledger_Entry1_Amount;Amount)
                {
                }
                column(TotalsCaption;TotalsCaptionLbl)
                {
                }
                column(Cust__Ledger_Entry1_Entry_No_;"Entry No.")
                {
                }
                column(Cust__Ledger_Entry1_Customer_ord_No;"Customer ord No")
                {
                }
            }

            trigger OnPreDataItem();
            begin
                i:=1;
                IF "fyear08-09"=TRUE THEN
                 "Sales Header".SETFILTER("Sales Header"."No.",'EFF/SAL/08-09*');
                /*while("Sales Header".NEXT<>0) do
                 begin
                  ord[i]:="Sales Header"."No.";
                 i:=i+1;
                 end;
                */IF "fyear07-08"=TRUE THEN
                "Sales Header".SETFILTER("Sales Header"."No.",'EFF/SAL/07-08*');

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
        invoicedamt : Decimal;
        amt : Decimal;
        totalamt : Decimal;
        pendingamt : Decimal;
        due : Decimal;
        BLE : Record "Bank Account Ledger Entry";
        SI : Record "Sales Invoice Line";
        "fyear08-09" : Boolean;
        s : Decimal;
        desc : Text[60];
        CLE : Record "Cust. Ledger Entry";
        receivedamt : Decimal;
        "fyear07-08" : Boolean;
        ord : array [300] of Code[11];
        i : Integer;
        Customer_Order_NoCaptionLbl : Label 'Customer Order No';
        Invoice_NoCaptionLbl : Label 'Invoice No';
        Invoiced_AmountCaptionLbl : Label 'Invoiced Amount';
        Customer_NameCaptionLbl : Label 'Customer Name';
        ReceiptCaptionLbl : Label 'Receipt';
        BalanceCaptionLbl : Label 'Balance';
        SAL_ORDER_NOCaptionLbl : Label 'SAL ORDER NO';
        Total_Order_AmountCaptionLbl : Label 'Total Order Amount';
        Sent_ItemCaptionLbl : Label 'Sent Item';
        TotalsCaptionLbl : Label 'Totals';
}

