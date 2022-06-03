report 50018 "Consolidated Dailytransactions"
{
    // version Rev01,Eff02

    DefaultLayout = RDLC;
    RDLCLayout = './Consolidated Dailytransactions.rdlc';

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = SORTING(No.) ORDER(Ascending);
            RequestFilterFields = "Posting Date";
            column(Sales_Invoice_Header__External_Document_No__; "External Document No.")
            {
            }
            column(formatadress_ChangeCurrency__Total_Invoiced_Amount__; formatadress.ChangeCurrency("Total Invoiced Amount"))
            {
            }
            column(Sales_Invoice_Header__Sell_to_Customer_Name_; "Sell-to Customer Name")
            {
            }
            column(Sales_Invoice_Header__Order_No__; "Order No.")
            {
            }
            column(formatadress_ChangeCurrency_totalsales_; formatadress.ChangeCurrency(totalsales))
            {
            }
            column(Sales_TransactionsCaption; Sales_TransactionsCaptionLbl)
            {
            }
            column(Customer_NameCaption; Customer_NameCaptionLbl)
            {
            }
            column(Invoice_NumberCaption; Invoice_NumberCaptionLbl)
            {
            }
            column(Invoiced_AmountCaption; Invoiced_AmountCaptionLbl)
            {
            }
            column(Sales_Invoice_Header__Order_No__Caption; FIELDCAPTION("Order No."))
            {
            }
            column(Total_salesCaption; Total_salesCaptionLbl)
            {
            }
            column(Sales_Invoice_Header_No_; "No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                "Sales Invoice Header".CALCFIELDS("Sales Invoice Header"."Total Invoiced Amount");
                totalsales := totalsales + "Sales Invoice Header"."Total Invoiced Amount";
            end;

            trigger OnPreDataItem();
            begin
                totalsales := 0;
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
        fromdate: Date;
        totalsales: Decimal;
        totalreceivedamounts: Decimal;
        totalpaymentsmade: Decimal;
        salfilters: Integer;
        formatadress: Codeunit "Format Address";
        Sales_TransactionsCaptionLbl: Label 'Sales Transactions';
        Customer_NameCaptionLbl: Label 'Customer Name';
        Invoice_NumberCaptionLbl: Label 'Invoice Number';
        Invoiced_AmountCaptionLbl: Label 'Invoiced Amount';
        Total_salesCaptionLbl: Label 'Total sales';
}

