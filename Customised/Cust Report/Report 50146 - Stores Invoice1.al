report 50146 "Stores Invoice1"
{
    // version sreenivas

    DefaultLayout = RDLC;
    RDLCLayout = './Stores Invoice1.rdlc';

    dataset
    {
        dataitem("Sales Invoice Header";"Sales Invoice Header")
        {
            RequestFilterFields = "No.";
            column(Sales_Invoice_Header__Sales_Invoice_Header___Posting_Date_;"Sales Invoice Header"."Posting Date")
            {
            }
            column(Sales_Invoice_Header__Sales_Invoice_Header___Customer_OrderNo__;"Sales Invoice Header"."Customer OrderNo.")
            {
            }
            column(Sales_Invoice_Header__Sales_Invoice_Header___Posting_Date__Control1000000002;"Sales Invoice Header"."Posting Date")
            {
            }
            column(compinfo_Name;compinfo.Name)
            {
            }
            column(compinfo_Address;compinfo.Address)
            {
            }
            column(compinfo__Address_2_;compinfo."Address 2")
            {
            }
            column(Sales_Invoice_Header__Sales_Invoice_Header___External_Document_No__;"Sales Invoice Header"."External Document No.")
            {
            }
            column(Sales_Invoice_Header_No_;"No.")
            {
            }
            dataitem("Sales Invoice Line";"Sales Invoice Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = SORTING(Document No.,Line No.) ORDER(Ascending);
                column(desc_1__1_;desc[1][1])
                {
                }
                column(desc_1__2_;desc[1][2])
                {
                }
                column(desc_1__3_;desc[1][3])
                {
                }
                column(desc_1__4_;desc[1][4])
                {
                }
                column(desc_1__5_;desc[1][5])
                {
                }
                column(desc_1__6_;desc[1][6])
                {
                }
                column(desc_2__1_;desc[2][1])
                {
                }
                column(desc_2__2_;desc[2][2])
                {
                }
                column(desc_2__3_;desc[2][3])
                {
                }
                column(desc_2__4_;desc[2][4])
                {
                }
                column(desc_2__5_;desc[2][5])
                {
                }
                column(desc_2__6_;desc[2][6])
                {
                }
                column(desc_3__1_;desc[3][1])
                {
                }
                column(desc_3__2_;desc[3][2])
                {
                }
                column(desc_3__3_;desc[3][3])
                {
                }
                column(desc_3__4_;desc[3][4])
                {
                }
                column(desc_3__5_;desc[3][5])
                {
                }
                column(desc_3__6_;desc[3][6])
                {
                }
                column(FORMAT_ROUND_sum1_1__;FORMAT(ROUND(sum1,1)))
                {
                }
                column(compinfo__C_S_T_No__;compinfo."C.S.T No.")
                {
                }
                column(FORMAT_ROUND_sum1_1___Control1102154013;FORMAT(ROUND(sum1,1)))
                {
                }
                column(Sales_Invoice_Header___Posting_Date_;"Sales Invoice Header"."Posting Date")
                {
                }
                column(Sales_Invoice_Header___External_Document_No__;"Sales Invoice Header"."External Document No.")
                {
                }
                column(compinfo_Name_Control1102154016;compinfo.Name)
                {
                }
                column(compinfo_Address_Control1102154017;compinfo.Address)
                {
                }
                column(compinfo__Address_2__Control1102154018;compinfo."Address 2")
                {
                }
                column(Sales_Invoice_Header___Customer_OrderNo__;"Sales Invoice Header"."Customer OrderNo.")
                {
                }
                column(Sales_Invoice_Header___Customer_Order_Date_;"Sales Invoice Header"."Customer Order Date")
                {
                }
                column(Sales_Invoice_Header___Posting_Date__Control1102154023;"Sales Invoice Header"."Posting Date")
                {
                }
                column(Sales_Invoice_Header___Posting_Date__Control1102154024;"Sales Invoice Header"."Posting Date")
                {
                }
                column(Sales_Invoice_Header___Ship_to_Name_;"Sales Invoice Header"."Ship-to Name")
                {
                }
                column(qty;qty)
                {
                }
                column(Sales_Invoice_Line_Document_No_;"Document No.")
                {
                }
                column(Sales_Invoice_Line_Line_No_;"Line No.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                         IF "Sales Invoice Line"."Amount To Customer">0 THEN
                         BEGIN
                          sum:=sum+ROUND("Sales Invoice Line"."Line Amount",1);
                          sum1:=sum1+"Sales Invoice Line"."Amount To Customer";
                          desc[i][1]:="Sales Invoice Line".Description;
                          desc[i][2]:=FORMAT("Sales Invoice Line".Quantity);
                          desc[i][3]:=FORMAT(ROUND("Sales Invoice Line"."Unit Price",1));
                          desc[i][4]:=FORMAT(ROUND("Sales Invoice Line"."Line Amount",1));
                          check.InitTextVariable;
                          check.FormatNoText(num,"Sales Invoice Line"."Unit Price",'');
                          check.InitTextVariable;
                          check.FormatNoText(num1,"Sales Invoice Line"."Line Amount",'');
                          desc[i][5]:=num[1]+num[2];
                          desc[i][6]:=num1[1]+num[2];
                          qty:=qty+"Sales Invoice Line".Quantity;
                          i:=i+1;
                         END ELSE
                        CurrReport.SKIP;
                end;
            }
            dataitem("Sales Invoice Line1";"Sales Invoice Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = SORTING(Document No.,Line No.) ORDER(Ascending);
                column(num_1__num_2_;num[1]+num[2])
                {
                }
                column(FORMAT_ROUND_sum1_1_______;FORMAT(ROUND(sum1,1))+'/-')
                {
                }
                column(Sales_Invoice_Line1_Document_No_;"Document No.")
                {
                }
                column(Sales_Invoice_Line1_Line_No_;"Line No.")
                {
                }
            }

            trigger OnPreDataItem();
            begin
                sum1:=0;
                compinfo.GET;
                i:=1;
                qty:=0;
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
        "sum" : Decimal;
        sum1 : Decimal;
        desc : array [10,7] of Text[500];
        i : Integer;
        compinfo : Record "Company Information";
        check : Report Check;
        num : array [4] of Text[60];
        num1 : array [4] of Text[60];
        first : Boolean;
        qty : Integer;
}

