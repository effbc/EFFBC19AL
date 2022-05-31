report 50180 "Customer Transactions"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Customer Transactions.rdlc';

    dataset
    {
        dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
        {
            DataItemTableView = WHERE(Document Type=FILTER(Invoice));
            RequestFilterFields = "Customer No.";
            column(recamt;recamt)
            {
            }
            column(invamt;invamt)
            {
                DecimalPlaces = 0:0;
            }
            column(Cust__Ledger_Entry__Cust__Ledger_Entry___External_Document_No__;"Cust. Ledger Entry"."External Document No.")
            {
            }
            column(Cust__Ledger_Entry__Cust__Ledger_Entry___Posting_Date_;"Cust. Ledger Entry"."Posting Date")
            {
            }
            column(customerno;customerno)
            {
            }
            column(saleno;saleno)
            {
            }
            column(recdate;recdate)
            {
            }
            column(invamt_recamt;invamt-recamt)
            {
            }
            column(openbal;openbal)
            {
                DecimalPlaces = 0:0;
            }
            column(cust__Balance__LCY__;cust."Balance (LCY)")
            {
                DecimalPlaces = 0:0;
            }
            column(Invoiced_AmountCaption;Invoiced_AmountCaptionLbl)
            {
            }
            column(Received_AmountCaption;Received_AmountCaptionLbl)
            {
            }
            column(Invoice_No_Caption;Invoice_No_CaptionLbl)
            {
            }
            column(Invoice_DateCaption;Invoice_DateCaptionLbl)
            {
            }
            column(Customer_Order_NoCaption;Customer_Order_NoCaptionLbl)
            {
            }
            column(Efftronics_Sale_Order_No_Caption;Efftronics_Sale_Order_No_CaptionLbl)
            {
            }
            column(Received_DateCaption;Received_DateCaptionLbl)
            {
            }
            column(Customer_Summary_TransactionsCaption;Customer_Summary_TransactionsCaptionLbl)
            {
            }
            column(Difference_AmountCaption;Difference_AmountCaptionLbl)
            {
            }
            column(Opening_Balance________________Caption;Opening_Balance________________CaptionLbl)
            {
            }
            column(Final_Customer_Balance___Caption;Final_Customer_Balance___CaptionLbl)
            {
            }
            column(Cust__Ledger_Entry_Entry_No_;"Entry No.")
            {
            }
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
        CLE : Record "Cust. Ledger Entry";
        recamt : Decimal;
        SIH : Record "Sales Invoice Header";
        customerno : Code[50];
        saleno : Code[50];
        recdate : Date;
        invamt : Decimal;
        cust : Record Customer;
        openbal : Decimal;
        Invoiced_AmountCaptionLbl : Label 'Invoiced Amount';
        Received_AmountCaptionLbl : Label 'Received Amount';
        Invoice_No_CaptionLbl : Label 'Invoice No.';
        Invoice_DateCaptionLbl : Label 'Invoice Date';
        Customer_Order_NoCaptionLbl : Label 'Customer Order No';
        Efftronics_Sale_Order_No_CaptionLbl : Label 'Efftronics Sale Order No.';
        Received_DateCaptionLbl : Label 'Received Date';
        Customer_Summary_TransactionsCaptionLbl : Label 'Customer Summary Transactions';
        Difference_AmountCaptionLbl : Label 'Difference Amount';
        Opening_Balance________________CaptionLbl : Label 'Opening Balance               :';
        Final_Customer_Balance___CaptionLbl : Label 'Final Customer Balance  :';
}

