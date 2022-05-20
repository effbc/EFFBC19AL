report 50000 "summary sales"
{
    // version Rev01,Eff02

    DefaultLayout = RDLC;
    RDLCLayout = './summary sales.rdlc';

    dataset
    {
        dataitem("Sales Header";"Sales Header")
        {
            DataItemTableView = SORTING(Document Type,No.) ORDER(Ascending) WHERE(Order Status=FILTER(<>Temporary Close));
            column(yeardetails;yeardetails)
            {
            }
            column(Summary_Reports_Of_Sales_Caption;Summary_Reports_Of_Sales_CaptionLbl)
            {
            }
            column(Amounts_in_Lakhs_of_Rupees_Caption;Amounts_in_Lakhs_of_Rupees_CaptionLbl)
            {
            }
            column(AprilCaption;AprilCaptionLbl)
            {
            }
            column(MayCaption;MayCaptionLbl)
            {
            }
            column(JuneCaption;JuneCaptionLbl)
            {
            }
            column(JulyCaption;JulyCaptionLbl)
            {
            }
            column(AugustCaption;AugustCaptionLbl)
            {
            }
            column(SeptemberCaption;SeptemberCaptionLbl)
            {
            }
            column(OctoberCaption;OctoberCaptionLbl)
            {
            }
            column(NovemberCaption;NovemberCaptionLbl)
            {
            }
            column(DecemberCaption;DecemberCaptionLbl)
            {
            }
            column(JanuaryCaption;JanuaryCaptionLbl)
            {
            }
            column(FebruaryCaption;FebruaryCaptionLbl)
            {
            }
            column(MarchCaption;MarchCaptionLbl)
            {
            }
            column(MonthsCaption;MonthsCaptionLbl)
            {
            }
            column(Carry_Forward_OrdersCaption;Carry_Forward_OrdersCaptionLbl)
            {
            }
            column(Orders_Expected_Month_wiseCaption;Orders_Expected_Month_wiseCaptionLbl)
            {
            }
            column(V500_00Caption;V500_00CaptionLbl)
            {
            }
            column(V500_00Caption_Control1102154149;V500_00Caption_Control1102154149Lbl)
            {
            }
            column(V500_00Caption_Control1102154150;V500_00Caption_Control1102154150Lbl)
            {
            }
            column(V500_00Caption_Control1102154151;V500_00Caption_Control1102154151Lbl)
            {
            }
            column(V500_00Caption_Control1102154152;V500_00Caption_Control1102154152Lbl)
            {
            }
            column(V500_00Caption_Control1102154153;V500_00Caption_Control1102154153Lbl)
            {
            }
            column(V500_00Caption_Control1102154154;V500_00Caption_Control1102154154Lbl)
            {
            }
            column(V500_00Caption_Control1102154155;V500_00Caption_Control1102154155Lbl)
            {
            }
            column(V500_00Caption_Control1102154160;V500_00Caption_Control1102154160Lbl)
            {
            }
            column(V500_00Caption_Control1102154161;V500_00Caption_Control1102154161Lbl)
            {
            }
            column(V500_00Caption_Control1102154162;V500_00Caption_Control1102154162Lbl)
            {
            }
            column(V500_00Caption_Control1102154163;V500_00Caption_Control1102154163Lbl)
            {
            }
            column(Orders_Expected_CumlativeCaption;Orders_Expected_CumlativeCaptionLbl)
            {
            }
            column(V500_00Caption_Control1102154061;V500_00Caption_Control1102154061Lbl)
            {
            }
            column(V1000_00Caption;V1000_00CaptionLbl)
            {
            }
            column(V1500_00Caption;V1500_00CaptionLbl)
            {
            }
            column(V2000_00Caption;V2000_00CaptionLbl)
            {
            }
            column(V2500_00Caption;V2500_00CaptionLbl)
            {
            }
            column(V3000_00Caption;V3000_00CaptionLbl)
            {
            }
            column(V3500_00Caption;V3500_00CaptionLbl)
            {
            }
            column(V4000_00Caption;V4000_00CaptionLbl)
            {
            }
            column(V4500_00Caption;V4500_00CaptionLbl)
            {
            }
            column(V4500_00Caption_Control1102154103;V4500_00Caption_Control1102154103Lbl)
            {
            }
            column(V5000_00Caption;V5000_00CaptionLbl)
            {
            }
            column(V5500_00Caption;V5500_00CaptionLbl)
            {
            }
            column(Sales_Header_Document_Type;"Document Type")
            {
            }
            column(Sales_Header_No_;"No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                //pendingamt:=oldpending("Sales Header",fyear1011);  //Every year need to change the Check Mark field that is specified at request
                                                                   // form as new year field
                IF fyear1213=TRUE THEN
                BEGIN
                 Filter:= 'EFF/SAL/02-03/*|EFF/SAL/03-04/*|EFF/SAL/04-05/*|EFF/SAL/05-06/*|EFF/SAL/07-08/*|EFF/SAL/08-09/*|EFF/SAL/06-07/*';
                 Filter+= '|EFF/SAL/09-10/*|EFF/SAL/10-11/*|EFF/SAL/11-12/*';
                 SH.SETFILTER(SH."Order Status",'<>%1',SH."Order Status"::"Temporary Close");
                 SH.SETFILTER(SH."No.", Filter);
                 IF SH.FIND('-') THEN
                 REPEAT
                 SH.CALCFIELDS(SH."Pending(LOA)Value");
                 OLDPENDINGAMOUNT:=OLDPENDINGAMOUNT+(SH."Pending(LOA)Value")/100000;
                 UNTIL SH.NEXT=0;
                END;

                IF fyear1112=TRUE THEN
                BEGIN
                 Filter:= 'EFF/SAL/02-03/*|EFF/SAL/03-04/*|EFF/SAL/04-05/*|EFF/SAL/05-06/*|EFF/SAL/07-08/*|EFF/SAL/08-09/*|EFF/SAL/06-07/*';
                 Filter+= '|EFF/SAL/09-10/*|EFF/SAL/10-11/*';
                 SH.SETFILTER(SH."Order Status",'<>%1',SH."Order Status"::"Temporary Close");
                 SH.SETFILTER(SH."No.", Filter);
                 IF SH.FIND('-') THEN
                 REPEAT
                 SH.CALCFIELDS(SH."Pending(LOA)Value");
                 OLDPENDINGAMOUNT:=OLDPENDINGAMOUNT+(SH."Pending(LOA)Value")/100000;
                 UNTIL SH.NEXT=0;
                END;



                IF fyear1011=TRUE THEN
                BEGIN
                 SH.SETFILTER(SH."Order Status",'<>%1',SH."Order Status"::"Temporary Close");
                 SH.SETFILTER(SH."No.",
                'EFF/SAL/02-03/*|EFF/SAL/03-04/*|EFF/SAL/04-05/*|EFF/SAL/05-06/*|EFF/SAL/07-08/*|EFF/SAL/08-09/*|EFF/SAL/06-07/*|EFF/SAL/09-10/*');
                 IF SH.FIND('-') THEN
                 REPEAT
                 SH.CALCFIELDS(SH."Pending(LOA)Value");
                 OLDPENDINGAMOUNT:=OLDPENDINGAMOUNT+(SH."Pending(LOA)Value")/100000;
                 UNTIL SH.NEXT=0;
                END;
                IF fyear0910=TRUE THEN
                BEGIN
                 SH.SETFILTER(SH."Order Status",'<>%1',SH."Order Status"::"Temporary Close");
                 SH.SETFILTER(SH."No.",
                'EFF/SAL/02-03/*|EFF/SAL/03-04/*|EFF/SAL/04-05/*|EFF/SAL/05-06/*|EFF/SAL/07-08/*|EFF/SAL/08-09/*|EFF/SAL/06-07/*');
                 IF SH.FIND('-') THEN
                 REPEAT
                 SH.CALCFIELDS(SH."Pending(LOA)Value");
                 OLDPENDINGAMOUNT:=OLDPENDINGAMOUNT+(SH."Pending(LOA)Value")/100000;
                 UNTIL SH.NEXT=0;
                END;
                IF fyear0809=TRUE THEN
                BEGIN
                 SH.SETFILTER(SH."Order Status",'<>%1',SH."Order Status"::"Temporary Close");
                 SH.SETFILTER(SH."No.",'EFF/SAL/02-03/*|EFF/SAL/03-04/*|EFF/SAL/04-05/*|EFF/SAL/05-06/*|EFF/SAL/06-07/*|EFF/SAL/07-08/*');
                 IF SH.FIND('-') THEN
                 REPEAT
                 SH.CALCFIELDS(SH."Pending(LOA)Value");
                 OLDPENDINGAMOUNT:=OLDPENDINGAMOUNT+(SH."Pending(LOA)Value")/100000;
                 UNTIL SH.NEXT=0;
                END;
                IF fyear0708=TRUE THEN
                BEGIN
                 SH.SETFILTER(SH."Order Status",'<>%1',SH."Order Status"::"Temporary Close");
                 SH.SETFILTER(SH."No.",'EFF/SAL/02-03/*|EFF/SAL/03-04/*|EFF/SAL/04-05/*|EFF/SAL/05-06/*EFF/SAL/06-07/*');
                 IF SH.FIND('-') THEN
                 REPEAT
                 SH.CALCFIELDS(SH."Pending(LOA)Value");
                 OLDPENDINGAMOUNT:=OLDPENDINGAMOUNT+(SH."Pending(LOA)Value")/100000;
                 UNTIL SH.NEXT=0;
                END;

                pendingamt:=OLDPENDINGAMOUNT;


                //Rev01 code Copied From // Sales Header, Body (3) - OnPreSection()
                 IF fyear0809=TRUE THEN
                    "Sales Header".SETFILTER("Sales Header"."No.",'EFF/SAL/08-09/*');
                 IF fyear0708=TRUE THEN
                    "Sales Header".SETFILTER("Sales Header"."No.",'EFF/SAL/07-08/*');
                 IF fyear0607=TRUE THEN
                    "Sales Header".SETFILTER("Sales Header"."No.",'EFF/SAL/06-07/*');
                 IF fyear0506=TRUE THEN
                    "Sales Header".SETFILTER("Sales Header"."No.",'EFF/SAL/05-06/*');
                 IF fyear0910=TRUE THEN
                    "Sales Header".SETFILTER("Sales Header"."No.",'EFF/SAL/09-10/*');
                 IF fyear1011=TRUE THEN
                    "Sales Header".SETFILTER("Sales Header"."No.",'EFF/SAL/10-11/*');
                 IF fyear1112=TRUE THEN
                    "Sales Header".SETFILTER("Sales Header"."No.",'EFF/SAL/11-12/*');
                 IF fyear1213=TRUE THEN
                    "Sales Header".SETFILTER("Sales Header"."No.",'EFF/SAL/12-13/*');

                 WHILE("Sales Header".NEXT<>0) DO
                 BEGIN
                 "Sales Header".CALCFIELDS("Sales Header"."Total Order(LOA)Value");
                //  amount1:=("Sales Header"."Sale Order Total Amount")/100000;
                  amount1:=("Sales Header"."Total Order(LOA)Value")/100000;
                  IF FORMAT("Sales Header"."Order Date")='' THEN
                   MESSAGE('sales Header Order Date was not There')
                  ELSE
                   mon:=DATE2DMY("Sales Header"."Order Date",2);
                  IF mon=1 THEN
                  amt1:=amt1+amount1;
                  IF mon=2 THEN
                  amt2:=amt2+amount1;
                  IF mon=3 THEN
                  amt3:=amt3+amount1;
                  IF mon=4 THEN
                  amt4:=amt4+amount1;
                  IF mon=5 THEN
                  amt5:=amt5+amount1;
                  IF mon=6 THEN
                  amt6:=amt6+amount1;
                  IF mon=7 THEN
                  amt7:=amt7+amount1;
                  IF mon=8 THEN
                  amt8:=amt8+amount1;
                  IF mon=9 THEN
                  amt9:=amt9+amount1;
                  IF mon=10 THEN
                  amt10:=amt10+amount1;
                  IF mon=11 THEN
                  amt11:=amt11+amount1;
                  IF mon=12 THEN
                  amt12:=amt12+amount1;
                 ordno[i]:="Sales Header"."No.";
                 i:=i+1;
                  END;
                //  testingtotal:=amt1+amt2+amt3+amt4+amt5+amt6+amt7+amt8+amt9+amt10+amt11+amt12;
                 //  message(format(testingtotal));


                //Rev01 code Copied From //Sales Header, Body (3) - OnPreSection()
            end;

            trigger OnPreDataItem();
            begin
                i:=1;
                amt1:=0;
                amt2:=0;
                amt3:=0;
                amt4:=0;
                amt5:=0;
                amt6:=0;
                amt7:=0;
                amt8:=0;
                amt9:=0;
                amt10:=0;
                amt11:=0;
                amt12:=0;
                //Rev01 Code Copied from //Sales Header, Header (1) - OnPreSection()
                IF fyear0809=TRUE THEN
                  yeardetails:='08-09 Year';
                IF fyear0910=TRUE THEN
                  yeardetails:='09-10 Year';
                IF fyear1011=TRUE THEN
                  yeardetails:='10-11 Year';
                IF fyear1112=TRUE THEN
                  yeardetails:='11-12 Year';
                IF fyear1213=TRUE THEN
                  yeardetails:='12-13 Year';
                //Rev01 Code Copied from //Sales Header, Header (1) - OnPreSection()
            end;
        }
        dataitem("Sales Invoice Line";"Sales Invoice Line")
        {
            DataItemTableView = SORTING(Document No.,Line No.) ORDER(Ascending);
            column(salamt4;salamt4)
            {
            }
            column(salamt5;salamt5)
            {
            }
            column(salamt6;salamt6)
            {
            }
            column(salamt7;salamt7)
            {
            }
            column(salamt8;salamt8)
            {
            }
            column(salamt9;salamt9)
            {
            }
            column(salamt10;salamt10)
            {
            }
            column(salamt11;salamt11)
            {
            }
            column(salamt12;salamt12)
            {
            }
            column(salamt1;salamt1)
            {
            }
            column(salamt2;salamt2)
            {
            }
            column(salamt3;salamt3)
            {
            }
            column(salamt4_Control1102154233;salamt4)
            {
            }
            column(salamt4_salamt5;salamt4+salamt5)
            {
            }
            column(salamt4_salamt5_salamt6;salamt4+salamt5+salamt6)
            {
            }
            column(salamt4_salamt5_salamt6_salamt7;salamt4+salamt5+salamt6+salamt7)
            {
            }
            column(salamt4_salamt5_salamt6_salamt7_salamt8;salamt4+salamt5+salamt6+salamt7+salamt8)
            {
            }
            column(salamt4_salamt5_salamt6_salamt7_salamt8_salamt9;salamt4+salamt5+salamt6+salamt7+salamt8+salamt9)
            {
            }
            column(salamt4_salamt5_salamt6_salamt7_salamt8_salamt9_salamt10;salamt4+salamt5+salamt6+salamt7+salamt8+salamt9+salamt10)
            {
            }
            column(salamt4_salamt5_salamt6_salamt7_salamt8_salamt9_salamt10_salamt11;salamt4+salamt5+salamt6+salamt7+salamt8+salamt9+salamt10+salamt11)
            {
            }
            column(salamt4_salamt5_salamt6_salamt7_salamt8_salamt9_salamt10_salamt11_salamt12;salamt4+salamt5+salamt6+salamt7+salamt8+salamt9+salamt10+salamt11+salamt12)
            {
            }
            column(salamt4_salamt5_salamt6_salamt7_salamt8_salamt9_salamt10_salamt11_salamt12_salamt1;salamt4+salamt5+salamt6+salamt7+salamt8+salamt9+salamt10+salamt11+salamt12+salamt1)
            {
            }
            column(salamt4_salamt5_salamt6_salamt7_salamt8_salamt9_salamt10_salamt11_salamt12_salamt1_salamt2;salamt4+salamt5+salamt6+salamt7+salamt8+salamt9+salamt10+salamt11+salamt12+salamt1+salamt2)
            {
            }
            column(salamt4_salamt5_salamt6_salamt7_salamt8_salamt9_salamt10_salamt11_salamt12_salamt1_salamt2_salamt3;salamt4+salamt5+salamt6+salamt7+salamt8+salamt9+salamt10+salamt11+salamt12+salamt1+salamt2+salamt3)
            {
            }
            column(Actual_SalesCaption;Actual_SalesCaptionLbl)
            {
            }
            column(CumlativeCaption;CumlativeCaptionLbl)
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
                //Rev01 code copied From //Sales Invoice Line, Body (1) - OnPreSection()

                IF fyear0809=TRUE THEN
                //  SETRANGE("Sales Invoice Line"."Shipment Date",fromdate,todate);
                  SETRANGE("Sales Invoice Line"."Document Date",(040108D),(033109D));
                IF fyear0708=TRUE THEN
                  SETRANGE("Sales Invoice Line"."Document Date",(040107D),(033108D));
                IF fyear0607=TRUE THEN
                  SETRANGE("Sales Invoice Line"."Document Date",(040106D),(033107D));
                IF fyear0506=TRUE THEN
                  SETRANGE("Sales Invoice Line"."Document Date",(040105D),(033106D));
                IF fyear0910=TRUE THEN
                  SETRANGE("Sales Invoice Line"."Document Date",(040109D),(033110D));
                IF fyear1011=TRUE THEN
                  SETRANGE("Sales Invoice Line"."Document Date",(040110D),(033111D));
                IF fyear1112=TRUE THEN
                  SETRANGE("Sales Invoice Line"."Document Date",(040111D),(033112D));
                IF fyear1213=TRUE THEN
                  SETRANGE("Sales Invoice Line"."Document Date",(040112D),(033113D));



                   WHILE("Sales Invoice Line".NEXT<>0) DO
                 BEGIN
                   //SIH.SETRANGE(SIH."No.","Sales Invoice Line"."Document No.");
                   //IF SIH.FIND('-') THEN
                   //inv[i]:=SIH."External Document No.";
                 "Sales Invoice Line".CALCFIELDS("Sales Invoice Line"."Document Date");
                  mon1:=DATE2DMY("Sales Invoice Line"."Document Date",2);
                  pos:=STRPOS("Sales Invoice Line"."External Document No.",str);
                  pos1:=STRPOS("Sales Invoice Line"."External Document No.",str1);
                  IF (pos1=0) AND(pos=0)AND("Sales Invoice Line"."Sell-to Customer No."<>'CUST00536') THEN
                   BEGIN
                      IF ("Sales Invoice Line"."Amount To Customer">0) AND ("Sales Invoice Line"."Sell-to Customer No."<>'CUST00536') THEN
                   BEGIN
                    Amount:=("Sales Invoice Line"."Amount To Customer")/100000;
                   IF mon1=1 THEN
                   salamt1:=salamt1+Amount;
                   IF mon1=2 THEN
                   salamt2:=salamt2+Amount;
                   IF mon1=3 THEN
                   salamt3:=salamt3+Amount;
                   IF mon1=4 THEN
                   salamt4:=salamt4+Amount;
                   IF mon1=5 THEN
                   salamt5:=salamt5+Amount;
                   IF mon1=6 THEN
                   salamt6:=salamt6+Amount;
                   IF mon1=7 THEN
                   salamt7:=salamt7+Amount;
                   IF mon1=8 THEN
                   salamt8:=salamt8+Amount;
                   IF mon1=9 THEN
                   salamt9:=salamt9+Amount;
                   IF mon1=10 THEN
                   salamt10:=salamt10+Amount;
                   IF mon1=11 THEN
                   salamt11:=salamt11+Amount;
                   IF mon1=12 THEN
                   salamt12:=salamt12+Amount;
                  END;
                   END;
                 END;
                //Rev01 code copied From //Sales Invoice Line, Body (1) - OnPreSection()
            end;

            trigger OnPreDataItem();
            begin
                "08-09Bill_value":=0;
                "09-10Bill_value":=0;
                "10-11Bill_value":=0;
                "11-12Bill_value":=0;
                "12-13Bill_value":=0;
                IF fyear0809=TRUE THEN
                BEGIN
                SIH.SETFILTER(SIH."Order No.",'EFF/SAL/08-09/*');
                SIH.SETRANGE(SIH."Posting Date",(040108D),(033109D));
                //pendingamt:=411.43;
                IF SIH.FIND('-') THEN
                REPEAT
                  SIH.CALCFIELDS(SIH."Total Invoiced Amount");
                      "08-09Bill_value"+=SIH."Total Invoiced Amount";
                UNTIL SIH.NEXT=0;
                     "08-09Bill_value lak":="08-09Bill_value"/100000;
                END;

                IF fyear1011=TRUE THEN
                BEGIN
                SIH.SETFILTER(SIH."Order No.",'EFF/SAL/10-11/*');
                SIH.SETRANGE(SIH."Posting Date",(040110D),(033111D));
                //pendingamt:=0;   //pending amount need to give after year closing
                IF SIH.FIND('-') THEN
                REPEAT
                  SIH.CALCFIELDS(SIH."Total Invoiced Amount");
                      "10-11Bill_value"+=SIH."Total Invoiced Amount";
                UNTIL SIH.NEXT=0;
                "10-11Bill_value lak":="10-11Bill_value"/100000;
                END;

                IF fyear0910=TRUE THEN
                BEGIN
                //pendingamt:=960.29;
                SIH.SETFILTER(SIH."Order No.",'EFF/SAL/09-10/*');
                SIH.SETRANGE(SIH."Posting Date",(040109D),(033110D));

                IF SIH.FIND('-') THEN
                REPEAT
                  IF SIH."Sell-to Customer No."<>'CUST00536' THEN
                  BEGIN
                    SIH.CALCFIELDS(SIH."Total Invoiced Amount");
                    "09-10Bill_value"+=SIH."Total Invoiced Amount";
                  END;
                UNTIL SIH.NEXT=0;
                     "09-10Bill_value lak":="09-10Bill_value"/100000;

                END;


                IF fyear1112=TRUE THEN
                BEGIN
                SIH.SETFILTER(SIH."Order No.",'EFF/SAL/11-12/*');
                SIH.SETRANGE(SIH."Posting Date",(040111D),(033112D));
                //pendingamt:=0;   //pending amount need to give after year closing
                IF SIH.FIND('-') THEN
                REPEAT
                  SIH.CALCFIELDS(SIH."Total Invoiced Amount");
                      "11-12Bill_value"+=SIH."Total Invoiced Amount";
                UNTIL SIH.NEXT=0;
                "11-12Bill_value lak":="11-12Bill_value"/100000;
                END;

                IF fyear1213=TRUE THEN
                BEGIN
                SIH.SETFILTER(SIH."Order No.",'EFF/SAL/12-13/*');
                SIH.SETRANGE(SIH."Posting Date",(040112D),(033113D));
                //pendingamt:=0;   //pending amount need to give after year closing
                IF SIH.FIND('-') THEN
                REPEAT
                  SIH.CALCFIELDS(SIH."Total Invoiced Amount");
                      "12-13Bill_value"+=SIH."Total Invoiced Amount";
                UNTIL SIH.NEXT=0;
                "12-13Bill_value lak":="12-13Bill_value"/100000;
                END;

                 str:='IN';
                 str1:='SI';
            end;
        }
        dataitem("Sales Invoice Header";"Sales Invoice Header")
        {
            DataItemTableView = SORTING(Order No.) ORDER(Ascending);
            column(amt4;amt4)
            {
            }
            column(amt5;amt5)
            {
            }
            column(amt6;amt6)
            {
            }
            column(amt7;amt7)
            {
            }
            column(amt8;amt8)
            {
            }
            column(amt9;amt9)
            {
            }
            column(amt10;amt10)
            {
            }
            column(amt11;amt11)
            {
            }
            column(amt12;amt12)
            {
            }
            column(amt1;amt1)
            {
            }
            column(amt2;amt2)
            {
            }
            column(amt3;amt3)
            {
            }
            column(amt4_pendingamt_oldinvoices;amt4+pendingamt+oldinvoices)
            {
            }
            column(amt4_amt5_pendingamt_oldinvoices;amt4+amt5+pendingamt+oldinvoices)
            {
            }
            column(amt4_amt5_amt6_pendingamt_oldinvoices;amt4+amt5+amt6+pendingamt+oldinvoices)
            {
            }
            column(amt4_amt5_amt6_amt7_pendingamt_oldinvoices;amt4+amt5+amt6+amt7+pendingamt+oldinvoices)
            {
            }
            column(amt4_amt5_amt6_amt7_amt8_pendingamt_oldinvoices;amt4+amt5+amt6+amt7+amt8+pendingamt+oldinvoices)
            {
            }
            column(amt4_amt5_amt6_amt7_amt8_amt9_pendingamt_oldinvoices;amt4+amt5+amt6+amt7+amt8+amt9+pendingamt+oldinvoices)
            {
            }
            column(amt4_amt5_amt6_amt7_amt8_amt9_amt10_pendingamt_oldinvoices;amt4+amt5+amt6+amt7+amt8+amt9+amt10+pendingamt+oldinvoices)
            {
            }
            column(amt4_amt5_amt6_amt7_amt8_amt9_amt10_amt11_pendingamt_oldinvoices;amt4+amt5+amt6+amt7+amt8+amt9+amt10+amt11+pendingamt+oldinvoices)
            {
            }
            column(amt4_amt5_amt6_amt7_amt8_amt9_amt10_amt11_amt12_pendingamt_oldinvoices;amt4+amt5+amt6+amt7+amt8+amt9+amt10+amt11+amt12+pendingamt+oldinvoices)
            {
            }
            column(amt4_amt5_amt6_amt7_amt8_amt9_amt10_amt11_amt12_amt1_pendingamt_oldinvoices;amt4+amt5+amt6+amt7+amt8+amt9+amt10+amt11+amt12+amt1+pendingamt+oldinvoices)
            {
            }
            column(amt4_amt5_amt6_amt7_amt8_amt9_amt10_amt11_amt12_amt1_amt2_pendingamt_oldinvoices;amt4+amt5+amt6+amt7+amt8+amt9+amt10+amt11+amt12+amt1+amt2+pendingamt+oldinvoices)
            {
            }
            column(amt4_amt5_amt6_amt7_amt8_amt9_amt10_amt11_amt12_amt1_amt2_amt3_pendingamt_oldinvoices;amt4+amt5+amt6+amt7+amt8+amt9+amt10+amt11+amt12+amt1+amt2+amt3+pendingamt+oldinvoices)
            {
            }
            column(pendingamt_oldinvoices;pendingamt+oldinvoices)
            {
            }
            column(pendingamt_oldinvoices_Control1102154085;pendingamt+oldinvoices)
            {
            }
            column(pendingamt_oldinvoices_Control1102154158;pendingamt+oldinvoices)
            {
            }
            column(V500_amt4;-500+amt4)
            {
            }
            column(V1000_amt4_amt5;-1000+amt4+amt5)
            {
            }
            column(V1500_amt4_amt5_amt6;-1500+amt4+amt5+amt6)
            {
            }
            column(V2000_amt4_amt5_amt6_amt7;-2000+amt4+amt5+amt6+amt7)
            {
            }
            column(V2500_amt4_amt5_amt6_amt7_amt8;-2500+amt4+amt5+amt6+amt7+amt8)
            {
            }
            column(V3000_amt4_amt5_amt6_amt7_amt8_amt9;-3000+amt4+amt5+amt6+amt7+amt8+amt9)
            {
            }
            column(V3500_amt4_amt5_amt6_amt7_amt8_amt9_amt10;-3500+amt4+amt5+amt6+amt7+amt8+amt9+amt10)
            {
            }
            column(V4000_amt4_amt5_amt6_amt7_amt8_amt9_amt10_amt11;-4000+amt4+amt5+amt6+amt7+amt8+amt9+amt10+amt11)
            {
            }
            column(V4500_amt4_amt5_amt6_amt7_amt8_amt9_amt10_amt11_amt12;-4500+amt4+amt5+amt6+amt7+amt8+amt9+amt10+amt11+amt12)
            {
            }
            column(V5000_amt4_amt5_amt6_amt7_amt8_amt9_amt10_amt11_amt12_amt1;-5000+amt4+amt5+amt6+amt7+amt8+amt9+amt10+amt11+amt12+amt1)
            {
            }
            column(V5500_amt4_amt5_amt6_amt7_amt8_amt9_amt10_amt11_amt12_amt1_amt2;-5500+amt4+amt5+amt6+amt7+amt8+amt9+amt10+amt11+amt12+amt1+amt2)
            {
            }
            column(V6000_amt4_amt5_amt6_amt7_amt8_amt9_amt10_amt11_amt12_amt1_amt2_amt3;-6000+amt4+amt5+amt6+amt7+amt8+amt9+amt10+amt11+amt12+amt1+amt2+amt3)
            {
            }
            column(amt4_amt5_amt6_amt7_amt8_amt9_amt10_amt11_amt12_amt1_amt2_amt3;amt4+amt5+amt6+amt7+amt8+amt9+amt10+amt11+amt12+amt1+amt2+amt3)
            {
            }
            column(salamt4_salamt5_salamt6_salamt7_salamt8_salamt9_salamt10_salamt11_salamt12_salamt1_salamt2_salamt3_Control1102154311;salamt4+salamt5+salamt6+salamt7+salamt8+salamt9+salamt10+salamt11+salamt12+salamt1+salamt2+salamt3)
            {
            }
            column(oldpendings_presentpending;oldpendings+presentpending)
            {
            }
            column(amt4_amt5_amt6_amt7_amt8_amt9_amt10_amt11_amt12_amt1_amt2_amt3_pendingamt_oldinvoices_Control1102154329;amt4+amt5+amt6+amt7+amt8+amt9+amt10+amt11+amt12+amt1+amt2+amt3+pendingamt+oldinvoices)
            {
            }
            column(presentsales;presentsales)
            {
            }
            column(oldinvoices;oldinvoices)
            {
            }
            column(oldpendings;oldpendings)
            {
            }
            column(presentpending;presentpending)
            {
            }
            column(pendingamt_oldinvoices_Control1102154006;pendingamt+oldinvoices)
            {
            }
            column(yeardetails_Control1102154007;yeardetails)
            {
            }
            column(yeardetails_Control1102154008;yeardetails)
            {
            }
            column(yeardetails_Control1102154009;yeardetails)
            {
            }
            column(yeardetails_Control1102154010;yeardetails)
            {
            }
            column(yeardetails_Control1102154011;yeardetails)
            {
            }
            column(Orders_received_Month_wiseCaption;Orders_received_Month_wiseCaptionLbl)
            {
            }
            column(CumlativeCaption_Control1102154039;CumlativeCaption_Control1102154039Lbl)
            {
            }
            column(Deficit_SurplusCaption;Deficit_SurplusCaptionLbl)
            {
            }
            column(Orders_Summary_B_Caption;Orders_Summary_B_CaptionLbl)
            {
            }
            column(OrdersCaption;OrdersCaptionLbl)
            {
            }
            column(Total_SalesCaption;Total_SalesCaptionLbl)
            {
            }
            column(Old_Orders_Sales_inCaption;Old_Orders_Sales_inCaptionLbl)
            {
            }
            column(Carry_Forward_OrdersCaption_Control1102154315;Carry_Forward_OrdersCaption_Control1102154315Lbl)
            {
            }
            column(Total_PendingCaption;Total_PendingCaptionLbl)
            {
            }
            column(SalesCaption;SalesCaptionLbl)
            {
            }
            column(PendingCaption;PendingCaptionLbl)
            {
            }
            column(Pending_Old_Orders_Summary_A_Caption;Pending_Old_Orders_Summary_A_CaptionLbl)
            {
            }
            column(Total_Summary_A_B_Caption;Total_Summary_A_B_CaptionLbl)
            {
            }
            column(Total_OrdersCaption;Total_OrdersCaptionLbl)
            {
            }
            column(Old_Orders_PendingCaption;Old_Orders_PendingCaptionLbl)
            {
            }
            column(Sales_Invoice_Header_No_;"No.")
            {
            }
            column(Sales_Invoice_Header_Order_No_;"Order No.")
            {
            }

            trigger OnAfterGetRecord();
            begin

                 test1:=FALSE;
                 IF fyear0809=TRUE THEN
                 "Sales Invoice Header".SETFILTER("Order No.",'eff/sal/08-09/*');
                 IF fyear0910=TRUE THEN
                  "Sales Invoice Header".SETFILTER("Order No.",'eff/sal/09-10/*');
                 IF fyear1011=TRUE THEN
                  "Sales Invoice Header".SETFILTER("Order No.",'eff/sal/10-11/*');
                 IF fyear1112=TRUE THEN
                  "Sales Invoice Header".SETFILTER("Order No.",'eff/sal/11-12/*');
                 IF fyear1213=TRUE THEN
                  "Sales Invoice Header".SETFILTER("Order No.",'eff/sal/12-13/*');


                  i:=1;
                  WHILE (ordno[i]<>'') DO
                  BEGIN
                  IF "Sales Invoice Header"."Order No."<>ordno[i] THEN
                   test:='yes'
                   ELSE
                    test1:=TRUE;
                  i:=i+1;
                  END;
                   IF test1<>TRUE THEN
                  BEGIN
                   IF ("Sales Invoice Header"."Order No."<>ordn) OR(ordn='') THEN
                    BEGIN
                      IF FORMAT("Sales Invoice Header"."Order Date")='' THEN
                        MESSAGE('At Sales invoice header Table One of the Order Date is null')
                      ELSE
                      mon2:=DATE2DMY("Sales Invoice Header"."Order Date",2);
                     // message(format("Sales Invoice Header"."Order No."));
                     // message(format("Sales Invoice Header"."Sale Order Total Amount"/100000));
                      ordamt:=("Sales Invoice Header"."Sale Order Total Amount")/100000;
                      testingtotal1+=ordamt;
                      IF mon2=1 THEN
                       amt1:=amt1+ordamt;
                      IF mon2=2 THEN
                      amt2:=amt2+ordamt;
                      IF mon2=3 THEN
                      amt3:=amt3+ordamt;
                      IF mon2=4 THEN
                      amt4:=amt4+ordamt;
                      IF mon2=5 THEN
                      amt5:=amt5+ordamt;
                      IF mon2=6 THEN
                      amt6:=amt6+ordamt;
                      IF mon2=7 THEN
                      amt7:=amt7+ordamt;
                      IF mon2=8 THEN
                      amt8:=amt8+ordamt;
                      IF mon2=9 THEN
                      amt9:=amt9+ordamt;
                      IF mon2=10 THEN
                      amt10:=amt10+ordamt;
                      IF mon2=11 THEN
                      amt11:=amt11+ordamt;
                      IF mon2=12 THEN
                      amt12:=amt12+ordamt;
                     ordn:="Sales Invoice Header"."Order No.";
                      END;
                  //i:=i+1;
                  END;
            end;

            trigger OnPostDataItem();
            begin
                 //  message(format(testingtotal1));
                
                //Rev01 Code Copied From //Sales Invoice Header, Footer (2) - OnPreSection()
                
                 //if (amt1=0) or (amt2=0) or (amt3=0) or (amt4=0) or (amt5=0) or (amt6=0) or (amt7=0) or (amt8=0) or (amt9=0) or (amt10=0) or
                 //(amt11=0) or (amt12=0) then
                
                /* IF fyear0809=TRUE THEN
                 CurrReport.SHOWOUTPUT:=TRUE
                 ELSE
                 CurrReport.SHOWOUTPUT:=FALSE;
                 */
                 IF fyear0809=TRUE THEN
                 BEGIN
                  oldinvoices:=salamt4+salamt5+salamt6+salamt7+salamt8+salamt9+salamt10+salamt11+salamt12+salamt1+salamt2;
                  oldinvoices:=oldinvoices+salamt3-"08-09Bill_value lak";
                  oldpendings:=pendingamt-oldinvoices;
                  presentsales:="08-09Bill_value lak";
                  presentpending:=amt4+amt5+amt6+amt7+amt8+amt9+amt10+amt11+amt12+amt1+amt2+amt3-"08-09Bill_value lak";
                  CurrReport.SHOWOUTPUT:=TRUE;
                 END;
                 IF fyear0910=TRUE THEN
                 BEGIN
                  oldinvoices:=salamt4+salamt5+salamt6+salamt7+salamt8+salamt9+salamt10+salamt11+salamt12+salamt1+salamt2;
                  oldinvoices:=oldinvoices+salamt3-"09-10Bill_value lak";
                  oldpendings:=pendingamt-oldinvoices;
                  presentsales:="09-10Bill_value lak";
                  presentpending:=amt4+amt5+amt6+amt7+amt8+amt9+amt10+amt11+amt12+amt1+amt2+amt3-"09-10Bill_value lak";
                  CurrReport.SHOWOUTPUT:=TRUE;
                 END;
                 IF fyear1011=TRUE THEN
                 BEGIN
                  oldinvoices:=salamt4+salamt5+salamt6+salamt7+salamt8+salamt9+salamt10+salamt11+salamt12+salamt1+salamt2;
                  oldinvoices:=oldinvoices+salamt3-"10-11Bill_value lak";
                  oldpendings:=pendingamt-oldinvoices;
                  presentsales:="10-11Bill_value lak";
                  presentpending:=amt4+amt5+amt6+amt7+amt8+amt9+amt10+amt11+amt12+amt1+amt2+amt3-"10-11Bill_value lak";
                  CurrReport.SHOWOUTPUT:=TRUE;
                 END;
                 IF fyear1112=TRUE THEN
                 BEGIN
                  oldinvoices:=salamt4+salamt5+salamt6+salamt7+salamt8+salamt9+salamt10+salamt11+salamt12+salamt1+salamt2;
                  oldinvoices:=oldinvoices+salamt3-"11-12Bill_value lak";
                  oldpendings:=pendingamt-oldinvoices;
                  presentsales:="11-12Bill_value lak";
                  presentpending:=amt4+amt5+amt6+amt7+amt8+amt9+amt10+amt11+amt12+amt1+amt2+amt3-"11-12Bill_value lak";
                  CurrReport.SHOWOUTPUT:=TRUE;
                 END;
                 IF fyear1213=TRUE THEN
                 BEGIN
                  oldinvoices:=salamt4+salamt5+salamt6+salamt7+salamt8+salamt9+salamt10+salamt11+salamt12+salamt1+salamt2;
                  oldinvoices:=oldinvoices+salamt3-"12-13Bill_value lak";
                  oldpendings:=pendingamt-oldinvoices;
                  presentsales:="12-13Bill_value lak";
                  presentpending:=amt4+amt5+amt6+amt7+amt8+amt9+amt10+amt11+amt12+amt1+amt2+amt3-"12-13Bill_value lak";
                  CurrReport.SHOWOUTPUT:=TRUE;
                 END;
                //Rev01 Code Copied From //Sales Invoice Header, Footer (2) - OnPreSection()
                
                //Rev01 Code Copied From //Sales Invoice Header, Footer (3) - OnPreSection()
                /* IF fyear0809=TRUE THEN
                 BEGIN
                 oldinvoices:=salamt4+salamt5+salamt6+salamt7+salamt8+salamt9+salamt10+salamt11+salamt12+salamt1+salamt2;
                 oldinvoices:=oldinvoices+salamt3-"08-09Bill_value lak";
                 oldpendings:=pendingamt-oldinvoices;
                 presentsales:="08-09Bill_value lak";
                 presentpending:=amt4+amt5+amt6+amt7+amt8+amt9+amt10+amt11+amt12+amt1+amt2+amt3-"08-09Bill_value lak";
                 CurrReport.SHOWOUTPUT:=TRUE;
                 END;
                 IF fyear0910=TRUE THEN
                 BEGIN
                 oldinvoices:=salamt4+salamt5+salamt6+salamt7+salamt8+salamt9+salamt10+salamt11+salamt12+salamt1+salamt2;
                 oldinvoices:=oldinvoices+salamt3-"09-10Bill_value lak";
                 oldpendings:=pendingamt-oldinvoices;
                 presentsales:="09-10Bill_value lak";
                 presentpending:=amt4+amt5+amt6+amt7+amt8+amt9+amt10+amt11+amt12+amt1+amt2+amt3-"09-10Bill_value lak";
                 CurrReport.SHOWOUTPUT:=TRUE;
                 END;
                 IF fyear1011=TRUE THEN
                 BEGIN
                 oldinvoices:=salamt4+salamt5+salamt6+salamt7+salamt8+salamt9+salamt10+salamt11+salamt12+salamt1+salamt2;
                 oldinvoices:=oldinvoices+salamt3-"10-11Bill_value lak";
                 oldpendings:=pendingamt-oldinvoices;
                 presentsales:="10-11Bill_value lak";
                 presentpending:=amt4+amt5+amt6+amt7+amt8+amt9+amt10+amt11+amt12+amt1+amt2+amt3-"10-11Bill_value lak";
                 CurrReport.SHOWOUTPUT:=TRUE;
                 END;*/
                oldpendings:=pendingamt;
                //Rev01 Code Copied From //Sales Invoice Header, Footer (3) - OnPreSection()

            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(General)
                {
                    field("For Orders";'')
                    {
                        Caption = 'For Orders';
                        Style = Strong;
                        StyleExpr = TRUE;
                    }
                    field(fyear0506;fyear0506)
                    {
                        Caption = 'financial Year 05-06';
                    }
                    field(fyear0607;fyear0607)
                    {
                        Caption = 'financial Year 06-07';
                    }
                    field(fyear0708;fyear0708)
                    {
                        Caption = 'financial Year 07-08';
                    }
                    field(fyear0809;fyear0809)
                    {
                        Caption = 'financial Year 08-09';
                    }
                    field(fyear0910;fyear0910)
                    {
                        Caption = 'financial Year 09-10';
                    }
                    field(fyear1011;fyear1011)
                    {
                        Caption = 'financial Year 10-11';
                    }
                    field(fyear1112;fyear1112)
                    {
                        Caption = 'financial Year 11-12';
                    }
                    field(fyear1213;fyear1213)
                    {
                        Caption = 'financial Year 12-13';
                    }
                    field("For Sales";'')
                    {
                        Caption = 'For Sales';
                        Style = Strong;
                        StyleExpr = TRUE;
                        Visible = false;
                    }
                    field(fromdate;fromdate)
                    {
                        Caption = 'From Date';
                        Visible = false;
                    }
                    field(todate;todate)
                    {
                        Caption = 'To Date';
                        Visible = false;
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        amt1 : Decimal;
        amt2 : Decimal;
        amt3 : Decimal;
        amt4 : Decimal;
        mon : Integer;
        salamt1 : Decimal;
        salamt2 : Decimal;
        salamt3 : Decimal;
        mon1 : Integer;
        salamt4 : Decimal;
        fromdate : Date;
        todate : Date;
        amt5 : Decimal;
        amt6 : Decimal;
        amt7 : Decimal;
        amt8 : Decimal;
        amt9 : Decimal;
        amt10 : Decimal;
        amt11 : Decimal;
        amt12 : Decimal;
        salamt5 : Decimal;
        salamt6 : Decimal;
        salamt7 : Decimal;
        salamt8 : Decimal;
        salamt9 : Decimal;
        salamt10 : Decimal;
        salamt11 : Decimal;
        salamt12 : Decimal;
        fyear0607 : Boolean;
        fyear0708 : Boolean;
        fyear0506 : Boolean;
        fyear0809 : Boolean;
        fyear0910 : Boolean;
        amount : Decimal;
        amount1 : Decimal;
        ordno : array [500] of Code[20];
        i : Integer;
        ordamt : Decimal;
        mon2 : Integer;
        CLE : Record "Cust. Ledger Entry";
        SIH : Record "Sales Invoice Header";
        inv : array [300] of Code[10];
        test : Text[3];
        test1 : Boolean;
        ordn : Code[20];
        Sil : Record "Sales Invoice Line";
        "08-09Bill_value" : Decimal;
        "08-09Bill_value lak" : Decimal;
        str : Text[5];
        pos : Integer;
        pos1 : Integer;
        str1 : Text[3];
        "09-10Bill_value" : Decimal;
        "10-11Bill_value" : Decimal;
        "09-10Bill_value lak" : Decimal;
        "10-11Bill_value lak" : Decimal;
        pendingamt : Decimal;
        oldinvoices : Decimal;
        oldpendings : Decimal;
        presentsales : Decimal;
        presentpending : Decimal;
        yeardetails : Text[30];
        testingtotal : Decimal;
        testingtotal1 : Decimal;
        SH : Record "Sales Header";
        OLDPENDINGAMOUNT : Decimal;
        fyear1112 : Boolean;
        fyear1011 : Boolean;
        "11-12Bill_value" : Decimal;
        "11-12Bill_value lak" : Decimal;
        "Filter" : Text[300];
        fyear1213 : Boolean;
        "12-13Bill_value" : Decimal;
        "12-13Bill_value lak" : Decimal;
        Summary_Reports_Of_Sales_CaptionLbl : Label '"Summary Reports Of Sales "';
        Amounts_in_Lakhs_of_Rupees_CaptionLbl : Label '(Amounts in Lakhs of Rupees)';
        AprilCaptionLbl : Label 'April';
        MayCaptionLbl : Label 'May';
        JuneCaptionLbl : Label 'June';
        JulyCaptionLbl : Label 'July';
        AugustCaptionLbl : Label 'August';
        SeptemberCaptionLbl : Label 'September';
        OctoberCaptionLbl : Label 'October';
        NovemberCaptionLbl : Label 'November';
        DecemberCaptionLbl : Label 'December';
        JanuaryCaptionLbl : Label 'January';
        FebruaryCaptionLbl : Label 'February';
        MarchCaptionLbl : Label 'March';
        MonthsCaptionLbl : Label 'Months';
        Carry_Forward_OrdersCaptionLbl : Label 'Carry Forward Orders';
        Orders_Expected_Month_wiseCaptionLbl : Label 'Orders Expected Month wise';
        V500_00CaptionLbl : Label '500.00';
        V500_00Caption_Control1102154149Lbl : Label '500.00';
        V500_00Caption_Control1102154150Lbl : Label '500.00';
        V500_00Caption_Control1102154151Lbl : Label '500.00';
        V500_00Caption_Control1102154152Lbl : Label '500.00';
        V500_00Caption_Control1102154153Lbl : Label '500.00';
        V500_00Caption_Control1102154154Lbl : Label '500.00';
        V500_00Caption_Control1102154155Lbl : Label '500.00';
        V500_00Caption_Control1102154160Lbl : Label '500.00';
        V500_00Caption_Control1102154161Lbl : Label '500.00';
        V500_00Caption_Control1102154162Lbl : Label '500.00';
        V500_00Caption_Control1102154163Lbl : Label '500.00';
        Orders_Expected_CumlativeCaptionLbl : Label 'Orders Expected Cumlative';
        V500_00Caption_Control1102154061Lbl : Label '500.00';
        V1000_00CaptionLbl : Label '1000.00';
        V1500_00CaptionLbl : Label '1500.00';
        V2000_00CaptionLbl : Label '2000.00';
        V2500_00CaptionLbl : Label '2500.00';
        V3000_00CaptionLbl : Label '3000.00';
        V3500_00CaptionLbl : Label '3500.00';
        V4000_00CaptionLbl : Label '4000.00';
        V4500_00CaptionLbl : Label '4500.00';
        V4500_00Caption_Control1102154103Lbl : Label '4500.00';
        V5000_00CaptionLbl : Label '5000.00';
        V5500_00CaptionLbl : Label '5500.00';
        Actual_SalesCaptionLbl : Label 'Actual Sales';
        CumlativeCaptionLbl : Label 'Cumlative';
        Orders_received_Month_wiseCaptionLbl : Label 'Orders received Month wise';
        CumlativeCaption_Control1102154039Lbl : Label 'Cumlative';
        Deficit_SurplusCaptionLbl : Label 'Deficit/Surplus';
        Orders_Summary_B_CaptionLbl : Label 'Orders Summary(B)';
        OrdersCaptionLbl : Label 'Orders';
        Total_SalesCaptionLbl : Label 'Total Sales';
        Old_Orders_Sales_inCaptionLbl : Label 'Old Orders Sales in';
        Carry_Forward_OrdersCaption_Control1102154315Lbl : Label 'Carry Forward Orders';
        Total_PendingCaptionLbl : Label 'Total Pending';
        SalesCaptionLbl : Label 'Sales';
        PendingCaptionLbl : Label 'Pending';
        Pending_Old_Orders_Summary_A_CaptionLbl : Label 'Pending Old Orders Summary(A)';
        Total_Summary_A_B_CaptionLbl : Label 'Total Summary(A+B)';
        Total_OrdersCaptionLbl : Label 'Total Orders';
        Old_Orders_PendingCaptionLbl : Label 'Old Orders Pending';

    [LineStart(0)]
    procedure oldpending(SH : Record "Sales Header";str : Boolean) : Decimal;
    var
        OLDPENDINGAMOUNT : Decimal;
    begin
        IF str=fyear1213 THEN
        BEGIN
         Filter:= 'EFF/SAL/02-03/*|EFF/SAL/03-04/*|EFF/SAL/04-05/*|EFF/SAL/05-06/*|EFF/SAL/07-08/*|EFF/SAL/08-09/*|EFF/SAL/06-07/*';
         Filter+= '|EFF/SAL/09-10/*|EFF/SAL/10-11/*|EFF/SAL/11-12/*';

         SH.SETFILTER(SH."No.",Filter);
         IF SH.FIND('-') THEN
         REPEAT
         SH.CALCFIELDS(SH."Pending(LOA)Value");
         OLDPENDINGAMOUNT:=OLDPENDINGAMOUNT+(SH."Pending(LOA)Value")/100000;
         UNTIL SH.NEXT=0;
        END;

        IF str=fyear1112 THEN
        BEGIN
         Filter:= 'EFF/SAL/02-03/*|EFF/SAL/03-04/*|EFF/SAL/04-05/*|EFF/SAL/05-06/*|EFF/SAL/07-08/*|EFF/SAL/08-09/*|EFF/SAL/06-07/*';
         Filter+= '|EFF/SAL/09-10/*|EFF/SAL/10-11/*';

         SH.SETFILTER(SH."No.",Filter);
         IF SH.FIND('-') THEN
         REPEAT
         SH.CALCFIELDS(SH."Pending(LOA)Value");
         OLDPENDINGAMOUNT:=OLDPENDINGAMOUNT+(SH."Pending(LOA)Value")/100000;
         UNTIL SH.NEXT=0;
        END;
        IF str=fyear1011 THEN
        BEGIN
         SH.SETFILTER(SH."No.",
        'EFF/SAL/02-03/*|EFF/SAL/03-04/*|EFF/SAL/04-05/*|EFF/SAL/05-06/*|EFF/SAL/07-08/*|EFF/SAL/08-09/*|EFF/SAL/06-07/*|EFF/SAL/09-10/*');
         IF SH.FIND('-') THEN
         REPEAT
         SH.CALCFIELDS(SH."Pending(LOA)Value");
         OLDPENDINGAMOUNT:=OLDPENDINGAMOUNT+(SH."Pending(LOA)Value")/100000;
         UNTIL SH.NEXT=0;
        END;
        IF str=fyear0910 THEN
        BEGIN
         SH.SETFILTER(SH."No.",
        'EFF/SAL/02-03/*|EFF/SAL/03-04/*|EFF/SAL/04-05/*|EFF/SAL/05-06/*|EFF/SAL/07-08/*|EFF/SAL/08-09/*|EFF/SAL/06-07/*');
         IF SH.FIND('-') THEN
         REPEAT
         SH.CALCFIELDS(SH."Pending(LOA)Value");
         OLDPENDINGAMOUNT:=OLDPENDINGAMOUNT+(SH."Pending(LOA)Value")/100000;
         UNTIL SH.NEXT=0;
        END;
        IF str=fyear0809 THEN
        BEGIN
         SH.SETFILTER(SH."No.",'EFF/SAL/02-03/*|EFF/SAL/03-04/*|EFF/SAL/04-05/*|EFF/SAL/05-06/*|EFF/SAL/06-07/*|EFF/SAL/07-08/*');
         IF SH.FIND('-') THEN
         REPEAT
         SH.CALCFIELDS(SH."Pending(LOA)Value");
         OLDPENDINGAMOUNT:=OLDPENDINGAMOUNT+(SH."Pending(LOA)Value")/100000;
         UNTIL SH.NEXT=0;
        END;
        IF str=fyear0708 THEN
        BEGIN
         SH.SETFILTER(SH."No.",'EFF/SAL/02-03/*|EFF/SAL/03-04/*|EFF/SAL/04-05/*|EFF/SAL/05-06/*EFF/SAL/06-07/*');
         IF SH.FIND('-') THEN
         REPEAT
         SH.CALCFIELDS(SH."Pending(LOA)Value");
         OLDPENDINGAMOUNT:=OLDPENDINGAMOUNT+(SH."Pending(LOA)Value")/100000;
         UNTIL SH.NEXT=0;
        END;

        EXIT(OLDPENDINGAMOUNT);
    end;
}

