report 50174 "AMC Pending Bills"
{
    DefaultLayout = RDLC;
    RDLCLayout = './AMC Pending Bills.rdlc';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = WHERE(Document Type=FILTER(Amc));
            RequestFilterFields = "No.";
            column(Customer_NameCaption;Customer_NameCaptionLbl)
            {
            }
            column(AMC_OrderCaption;AMC_OrderCaptionLbl)
            {
            }
            column(Customer_Order_NoCaption;Customer_Order_NoCaptionLbl)
            {
            }
            column(Order_ValueCaption;Order_ValueCaptionLbl)
            {
            }
            column(Bill_PeriodCaption;Bill_PeriodCaptionLbl)
            {
            }
            column(Billing_PeriodCaption;Billing_PeriodCaptionLbl)
            {
            }
            column(Bill_AmountCaption;Bill_AmountCaptionLbl)
            {
            }
            column(Pending_PeriodCaption;Pending_PeriodCaptionLbl)
            {
            }
            column(AMC_PENDING_BILLS_DETAILSCaption;AMC_PENDING_BILLS_DETAILSCaptionLbl)
            {
            }
            column(Sales_Header_Document_Type;"Document Type")
            {
            }
            column(Sales_Header_No_;"No.")
            {
            }
            dataitem("Sales Line";"Sales Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                column(billamt;billamt)
                {
                }
                column(qua;qua)
                {
                }
                column(billperiod;billperiod)
                {
                }
                column(orderval;orderval)
                {
                }
                column(custno;custno)
                {
                }
                column(amcno;amcno)
                {
                }
                column(custname;custname)
                {
                }
                column(Sales_Header___Payment_Terms_Code_;"Sales Header"."Payment Terms Code")
                {
                }
                column(Sales_Line_Document_Type;"Document Type")
                {
                }
                column(Sales_Line_Document_No_;"Document No.")
                {
                }
                column(Sales_Line_Line_No_;"Line No.")
                {
                }
            }

            trigger OnPreDataItem();
            begin
                Billenddate:=0D;
                temp:=10000;
                temp1:=90;
                prevorderno:='';
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
        "Total days" : Integer;
        reqoption : Option prd,sal;
        Total : Integer;
        Dev : Decimal;
        ordername : Text[30];
        poq : Integer;
        avg : Integer;
        wa : Decimal;
        Production_Qunatity : Integer;
        avg1 : Integer;
        cnt : Integer;
        Total1 : Integer;
        text : Text[30];
        wa1 : Decimal;
        Dev1 : Integer;
        text1 : Text[30];
        "sales shipment header" : Record "Sales Shipment Header";
        ShipmentDate : Date;
        ILE : Record "Item Ledger Entry";
        ILE2 : Record "Item Ledger Entry";
        "CycleTime (Dispatch)" : Integer;
        "CycleTime (Dispatch) _Avg" : Decimal;
        PO : Record "Production Order";
        Wa_Sale : Decimal;
        "Dispatched Quantity" : Integer;
        "Distpatch Date" : Date;
        QTY : Integer;
        SH : Record "Sales Header";
        "Order Date" : Date;
        Cust_Req_Date : Date;
        SSH : Record "Sales Shipment Header";
        Order_Qty : Integer;
        Billenddate : Date;
        present : Integer;
        SL : Record "Sales Line";
        presentqua : Integer;
        temp : Integer;
        temp1 : Integer;
        noofperiod : Integer;
        billedamt : Decimal;
        custname : Text[30];
        amcno : Code[50];
        custno : Code[50];
        orderval : Decimal;
        billperiod : Text[100];
        qua : Integer;
        billamt : Decimal;
        amcstart : Text[30];
        prevorderno : Code[50];
        Customer_NameCaptionLbl : Label 'Customer Name';
        AMC_OrderCaptionLbl : Label 'AMC Order';
        Customer_Order_NoCaptionLbl : Label 'Customer Order No';
        Order_ValueCaptionLbl : Label 'Order Value';
        Bill_PeriodCaptionLbl : Label 'Bill Period';
        Billing_PeriodCaptionLbl : Label 'Billing Period';
        Bill_AmountCaptionLbl : Label 'Bill Amount';
        Pending_PeriodCaptionLbl : Label 'Pending Period';
        AMC_PENDING_BILLS_DETAILSCaptionLbl : Label 'AMC PENDING BILLS DETAILS';

    [LineStart(8418)]
    procedure MG();
    begin
    end;
}

