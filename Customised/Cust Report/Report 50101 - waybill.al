report 50101 waybill
{
    // version sreenivas

    DefaultLayout = RDLC;
    RDLCLayout = './waybill.rdlc';

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            RequestFilterFields = "No.";
            column(Sales_Invoice_Header__Sales_Invoice_Header___Posting_Date_; "Sales Invoice Header"."Posting Date")
            {
            }
            column(Sales_Invoice_Header__Sales_Invoice_Header___Posting_Date__Control1000000001; "Sales Invoice Header"."Posting Date")
            {
            }
            column(Sales_Invoice_Header__Sales_Invoice_Header___Posting_Date__Control1000000002; "Sales Invoice Header"."Posting Date")
            {
            }
            column(Sales_Invoice_Header__Ship_to_Address_; "Ship-to Address")
            {
            }
            column(Sales_Invoice_Header__Ship_to_Address_2_; "Ship-to Address 2")
            {
            }
            column(Sales_Invoice_Header__Sell_to_Customer_Name_; "Sell-to Customer Name")
            {
            }
            column(Sales_Invoice_Header__Sell_to_City_; "Sell-to City")
            {
            }
            column(Sales_Invoice_Header__Sales_Invoice_Header___Ship_to_Name_; "Sales Invoice Header"."Ship-to Name")
            {
            }
            column(Sales_Invoice_Header__Ship_to_Address_2__Control1000000016; "Ship-to Address 2")
            {
            }
            column(Sales_Invoice_Header__Sell_to_Customer_Name__Control1000000017; "Sell-to Customer Name")
            {
            }
            column(Sales_Invoice_Header__Sell_to_City__Control1000000019; "Sell-to City")
            {
            }
            column(V28350166764Caption; V28350166764CaptionLbl)
            {
            }
            column(ANDHRA_PRADESHCaption; ANDHRA_PRADESHCaptionLbl)
            {
            }
            column(Sales_Invoice_Header_No_; "No.")
            {
            }
            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                column(Sales_Invoice_Line__Sales_Invoice_Line__Description; "Sales Invoice Line".Description)
                {
                }
                column(FORMAT__Sales_Invoice_Header___External_Document_No_________; FORMAT("Sales Invoice Header"."External Document No.") + '  /')
                {
                }
                column(Sales_Invoice_Header___Posting_Date_; "Sales Invoice Header"."Posting Date")
                {
                }
                column(Sales_Invoice_Line__Sales_Invoice_Line__Quantity; "Sales Invoice Line".Quantity)
                {
                }
                column(ROUND_sum_1_; ROUND(sum, 1))
                {
                }
                column(FORMAT_sum1_; FORMAT(sum1))
                {
                }
                column(Sales_Invoice_Line__Sales_Invoice_Line___Transport_Method_; "Sales Invoice Line"."Transport Method")
                {
                }
                column(Sales_Invoice_Line__Sales_Invoice_Line___Transport_Method__Control1000000012; "Sales Invoice Line"."Transport Method")
                {
                }
                column(No_of_PacketsCaption; No_of_PacketsCaptionLbl)
                {
                }
                column(Sales_Invoice_Line_Document_No_; "Document No.")
                {
                }
                column(Sales_Invoice_Line_Line_No_; "Line No.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    i := 1;
                    IF "Sales Invoice Line"."Unit Price" = 0 THEN
                        CurrReport.SKIP;
                end;
            }

            trigger OnPreDataItem();
            begin
                sum1 := 0;
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
        "sum": Decimal;
        sum1: Decimal;
        desc: array[2, 2] of Text[30];
        i: Integer;
        V28350166764CaptionLbl: Label '28350166764';
        ANDHRA_PRADESHCaptionLbl: Label 'ANDHRA PRADESH';
        No_of_PacketsCaptionLbl: Label 'No.of.Packets';
}

