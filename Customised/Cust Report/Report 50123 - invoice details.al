report 50123 "invoice details"
{
    DefaultLayout = RDLC;
    RDLCLayout = './invoice details.rdlc';

    dataset
    {
        dataitem("Sales Invoice Header";"Sales Invoice Header")
        {
            DataItemTableView = SORTING(Order No.,No.) ORDER(Ascending);
            RequestFilterFields = "Order No.","Shipment Date";
            column(amt;amt)
            {
            }
            column(Sales_Invoice_Header__External_Document_No__;"External Document No.")
            {
            }
            column(Sales_Invoice_Header__Order_No__;"Order No.")
            {
            }
            column(Sales_Invoice_Header__Sales_Invoice_Header___Posting_Date_;"Sales Invoice Header"."Posting Date")
            {
            }
            column(totamt;totamt)
            {
            }
            column(Total_Amount_Caption;Total_Amount_CaptionLbl)
            {
            }
            column(Sales_Invoice_Header_No_;"No.")
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
        sil : Record "Sales Invoice Line";
        amt : Decimal;
        totamt : Decimal;
        Total_Amount_CaptionLbl : Label '"Total Amount "';
}

