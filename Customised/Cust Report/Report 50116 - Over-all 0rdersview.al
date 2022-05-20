report 50116 "Over-all 0rdersview"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Over-all 0rdersview.rdlc';

    dataset
    {
        dataitem("Tender Header";"Tender Header")
        {
            DataItemTableView = SORTING(Tender No.) ORDER(Ascending);
            dataitem("Tender Line";"Tender Line")
            {
                DataItemLink = Document No.=FIELD(Tender No.);
                DataItemTableView = SORTING(Document No.,Line No.) ORDER(Ascending);

                trigger OnPreDataItem();
                begin
                     CurrReport.CREATETOTALS("Tender Line"."Total Amount");
                     dlc:=0;
                     fepc:=0;
                end;
            }
            dataitem(Customer;Customer)
            {
                DataItemLink = No.=FIELD(Customer No.);
                DataItemTableView = SORTING(No.) ORDER(Ascending);
            }

            trigger OnPreDataItem();
            begin
                i:=1;
                j:=1;
                IF ("YEAR06-07"=TRUE) AND ("YEAR07-08"=FALSE) AND ("YEAR08-09"=FALSE) THEN
                "Tender Header".SETFILTER("Tender Header"."Tender No.",'TN-06-07*');
                IF ("YEAR07-08"=TRUE)AND ("YEAR06-07"=FALSE) AND ("YEAR08-09"=FALSE)  THEN
                "Tender Header".SETFILTER("Tender Header"."Tender No.",'TN-07-08*');
                IF ("YEAR08-09"=TRUE) AND ("YEAR07-08"=FALSE) AND ("YEAR06-07"=FALSE) THEN
                  "Tender Header".SETFILTER("Tender Header"."Tender No.",'TN-08-09*');
                IF ("YEAR08-09"=TRUE) AND ("YEAR07-08"=TRUE) THEN
                  "Tender Header".SETFILTER("Tender Header"."Tender No.",'TN-07-08*|TN-08-09*');

                IF ("YEAR08-09"=TRUE) AND ("YEAR07-08"=TRUE) AND ("YEAR06-07"=TRUE) THEN
                 SETFILTER("Tender Header"."Tender No.",'TN-06-07*|TN-07-08*|TN-08-09*');
                IF (fyear0809=TRUE) THEN
                 SETFILTER("Tender Header"."Tender No.",'TN-08-09*');
                IF (fyear0910=TRUE) THEN
                 SETFILTER("Tender Header"."Tender No.",'TN-09-10*');

                CurrReport.CREATETOTALS("Tender Header"."Minimum Bid Amount");
            end;
        }
        dataitem("Sales Header";"Sales Header")
        {
            DataItemTableView = SORTING(Document Type,No.) ORDER(Ascending);
            column(Summary_Reports_Of_Sales_Caption;Summary_Reports_Of_Sales_CaptionLbl)
            {
            }
            column(Amounts_in_Lakhs_Caption;Amounts_in_Lakhs_CaptionLbl)
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
            column(Orders_ExpectedCaption;Orders_ExpectedCaptionLbl)
            {
            }
            column(V500_00Caption;V500_00CaptionLbl)
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
            column(V5000_00Caption;V5000_00CaptionLbl)
            {
            }
            column(V5500_00Caption;V5500_00CaptionLbl)
            {
            }
            column(V4500_00Caption;V4500_00CaptionLbl)
            {
            }
            column(V6000_00Caption;V6000_00CaptionLbl)
            {
            }
            column(Sales_Header_Document_Type;"Document Type")
            {
            }
            column(Sales_Header_No_;"No.")
            {
            }
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
            column(salamt4_Control1102154083;salamt4)
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
            column(CummlativeCaption;CummlativeCaptionLbl)
            {
            }
            column(Sales_Invoice_Line_Document_No_;"Document No.")
            {
            }
            column(Sales_Invoice_Line_Line_No_;"Line No.")
            {
            }

            trigger OnPreDataItem();
            begin
                SIH.SETFILTER(SIH."Order No.",'EFF/SAL/04-05/*|EFF/SAL/05-06/*|EFF/SAL/06-07/*|EFF/SAL/07-08/*');
                //SIH.SETRANGE(SIH."Shipment Date",(040108D),(033109D));
                IF SIH.FIND('-') THEN
                REPEAT
                //Sil.SETRANGE(Sil."Shipment Date",(040108D),(033109D));
                Sil.SETRANGE(Sil."Document No.",SIH."No.");
                  IF Sil.FIND('-') THEN
                  REPEAT
                    "08-09Bill_value"+=Sil."Amount To Customer";
                  UNTIL Sil.NEXT=0;
                UNTIL SIH.NEXT=0;
                //  MESSAGE(FORMAT("08-09Bill_value"));
            end;
        }
        dataitem("Sales Invoice Header";"Sales Invoice Header")
        {
            DataItemTableView = SORTING(No.) ORDER(Ascending);
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
            column(amt4_411_43;amt4+411.43)
            {
            }
            column(amt4_amt5_411_43;amt4+amt5+411.43)
            {
            }
            column(amt4_amt5_amt6_411_43;amt4+amt5+amt6+411.43)
            {
            }
            column(amt4_amt5_amt6_amt7_411_43;amt4+amt5+amt6+amt7+411.43)
            {
            }
            column(amt4_amt5_amt6_amt7_amt8_411_43;amt4+amt5+amt6+amt7+amt8+411.43)
            {
            }
            column(amt4_amt5_amt6_amt7_amt8_amt9_411_43;amt4+amt5+amt6+amt7+amt8+amt9+411.43)
            {
            }
            column(amt4_amt5_amt6_amt7_amt8_amt9_amt10_411_43;amt4+amt5+amt6+amt7+amt8+amt9+amt10+411.43)
            {
            }
            column(amt4_amt5_amt6_amt7_amt8_amt9_amt10_amt11_411_43;amt4+amt5+amt6+amt7+amt8+amt9+amt10+amt11+411.43)
            {
            }
            column(amt4_amt5_amt6_amt7_amt8_amt9_amt10_amt11_amt12_411_43;amt4+amt5+amt6+amt7+amt8+amt9+amt10+amt11+amt12+411.43)
            {
            }
            column(amt4_amt5_amt6_amt7_amt8_amt9_amt10_amt11_amt12_amt1_411_43;amt4+amt5+amt6+amt7+amt8+amt9+amt10+amt11+amt12+amt1+411.43)
            {
            }
            column(amt4_amt5_amt6_amt7_amt8_amt9_amt10_amt11_amt12_amt1_amt2_411_43;amt4+amt5+amt6+amt7+amt8+amt9+amt10+amt11+amt12+amt1+amt2+411.43)
            {
            }
            column(amt4_amt5_amt6_amt7_amt8_amt9_amt10_amt11_amt12_amt1_amt2_amt3_411_43;amt4+amt5+amt6+amt7+amt8+amt9+amt10+amt11+amt12+amt1+amt2+amt3+411.43)
            {
            }
            column(V411_43;411.43)
            {
            }
            column(V411_43_Control1102154141;411.43)
            {
            }
            column(V411_43_Control1102154158;411.43)
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
            column(DataItem1102154069;salamt4+salamt5+salamt6+salamt7+salamt8+salamt9+salamt10+salamt11+salamt12+salamt1+salamt2+salamt3-("08-09Bill_value"/100000))
            {
            }
            column(DataItem1102154070;amt4+amt5+amt6+amt7+amt8+amt9+amt10+amt11+amt12+amt1+amt2+amt3-((salamt4+salamt5+salamt6+salamt7+salamt8+salamt9+salamt10+salamt11+salamt12+salamt1+salamt2+salamt3)-("08-09Bill_value"/100000)))
            {
            }
            column(salamt4_salamt5_salamt6_salamt7_salamt8_salamt9_salamt10_salamt11_salamt12_salamt1_salamt2_salamt3_Control1102154079;salamt4+salamt5+salamt6+salamt7+salamt8+salamt9+salamt10+salamt11+salamt12+salamt1+salamt2+salamt3)
            {
            }
            column(DataItem1102154080;(411.43+amt4+amt5+amt6+amt7+amt8+amt9+amt10+amt11+amt12+amt1+amt2+amt3)-(salamt4+salamt5+salamt6+salamt7+salamt8+salamt9+salamt10+salamt11+salamt12+salamt1+salamt2+salamt3))
            {
            }
            column(amt4_amt5_amt6_amt7_amt8_amt9_amt10_amt11_amt12_amt1_amt2_amt3_411_43_Control1102154081;amt4+amt5+amt6+amt7+amt8+amt9+amt10+amt11+amt12+amt1+amt2+amt3+411.43)
            {
            }
            column(expvalue;expvalue)
            {
            }
            column(TAPR;TAPR)
            {
            }
            column(TMAY;TMAY)
            {
            }
            column(TJUN;TJUN)
            {
            }
            column(TAMT1;TAMT1)
            {
            }
            column(TAMT2;TAMT2)
            {
            }
            column(TAMT3;TAMT3)
            {
            }
            column(TJUL;TJUL)
            {
            }
            column(TSEP;TSEP)
            {
            }
            column(TNOV;TNOV)
            {
            }
            column(TOCT;TOCT)
            {
            }
            column(TFEB;TFEB)
            {
            }
            column(TJAN;TJAN)
            {
            }
            column(TDEC;TDEC)
            {
            }
            column(TAUG;TAUG)
            {
            }
            column(TMAR;TMAR)
            {
            }
            column(TAMT10;TAMT10)
            {
            }
            column(TAMT4;TAMT4)
            {
            }
            column(TAMT5;TAMT5)
            {
            }
            column(TAMT7;TAMT7)
            {
            }
            column(TAMT12;TAMT12)
            {
            }
            column(TAMT6;TAMT6)
            {
            }
            column(TAMT8;TAMT8)
            {
            }
            column(TAMT11;TAMT11)
            {
            }
            column(TAMT9;TAMT9)
            {
            }
            column(Orders_released_Month_wiseCaption;Orders_released_Month_wiseCaptionLbl)
            {
            }
            column(CummlativeCaption_Control1102154125;CummlativeCaption_Control1102154125Lbl)
            {
            }
            column(Deficit_SurplusCaption;Deficit_SurplusCaptionLbl)
            {
            }
            column(V08_09_Orders_SummaryCaption;V08_09_Orders_SummaryCaptionLbl)
            {
            }
            column(V08_09_OrdersCaption;V08_09_OrdersCaptionLbl)
            {
            }
            column(V08_09_SalesCaption;V08_09_SalesCaptionLbl)
            {
            }
            column(V08_09_PendingCaption;V08_09_PendingCaptionLbl)
            {
            }
            column(Total_OrdersCaption;Total_OrdersCaptionLbl)
            {
            }
            column(Total_SalesCaption;Total_SalesCaptionLbl)
            {
            }
            column(Total_SummaryCaption;Total_SummaryCaptionLbl)
            {
            }
            column(Total_PendingCaption;Total_PendingCaptionLbl)
            {
            }
            column(Expected_OrdersCaption;Expected_OrdersCaptionLbl)
            {
            }
            column(Expected_Orders_SummaryCaption;Expected_Orders_SummaryCaptionLbl)
            {
            }
            column(Orders_ValueCaption;Orders_ValueCaptionLbl)
            {
            }
            column(AprilCaption_Control1102154291;AprilCaption_Control1102154291Lbl)
            {
            }
            column(MayCaption_Control1102154292;MayCaption_Control1102154292Lbl)
            {
            }
            column(JuneCaption_Control1102154293;JuneCaption_Control1102154293Lbl)
            {
            }
            column(JulyCaption_Control1102154294;JulyCaption_Control1102154294Lbl)
            {
            }
            column(AugustCaption_Control1102154295;AugustCaption_Control1102154295Lbl)
            {
            }
            column(SeptemberCaption_Control1102154296;SeptemberCaption_Control1102154296Lbl)
            {
            }
            column(OctoberCaption_Control1102154297;OctoberCaption_Control1102154297Lbl)
            {
            }
            column(NovemberCaption_Control1102154298;NovemberCaption_Control1102154298Lbl)
            {
            }
            column(DecemberCaption_Control1102154299;DecemberCaption_Control1102154299Lbl)
            {
            }
            column(JanuaryCaption_Control1102154300;JanuaryCaption_Control1102154300Lbl)
            {
            }
            column(FebruaryCaption_Control1102154301;FebruaryCaption_Control1102154301Lbl)
            {
            }
            column(MarchCaption_Control1102154302;MarchCaption_Control1102154302Lbl)
            {
            }
            column(MonthsCaption_Control1102154303;MonthsCaption_Control1102154303Lbl)
            {
            }
            column(Orders_ExpectedCaption_Control1102154320;Orders_ExpectedCaption_Control1102154320Lbl)
            {
            }
            column(Amounts_in_Lakhs_Caption_Control1102154173;Amounts_in_Lakhs_Caption_Control1102154173Lbl)
            {
            }
            column(Sales_Invoice_Header_No_;"No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                  test1:=FALSE;

                  "Sales Invoice Header".SETFILTER("Order No.",'eff/sal/08-09/*');
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
                      mon2:=DATE2DMY("Sales Invoice Header"."Order Date",2);
                      ordamt:=("Sales Invoice Header"."Sale Order Total Amount")/100000;
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
        ordno : array [1000] of Code[20];
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
        "YEAR06-07" : Boolean;
        "YEAR07-08" : Boolean;
        "YEAR08-09" : Boolean;
        "YEAR09-10" : Boolean;
        "SUM" : Decimal;
        consolidated : Boolean;
        item : Record Item;
        desc : Text[30];
        dlc : Integer;
        fepc : Integer;
        d1 : array [50,7] of Text[60];
        j : Integer;
        d2 : array [50,7] of Text[60];
        expvalue : Decimal;
        yettovalue : Decimal;
        d3 : Text[60];
        "sales line" : Record "Sales Line";
        totalamt : Decimal;
        cancelvalue : Decimal;
        receivedamt : Decimal;
        Unsucess : Decimal;
        notparticipate : Decimal;
        TAPR : Integer;
        TMAY : Integer;
        TJUN : Integer;
        TJUL : Integer;
        TAUG : Integer;
        TSEP : Integer;
        TOCT : Integer;
        TNOV : Integer;
        TDEC : Integer;
        TJAN : Integer;
        TFEB : Integer;
        TMAR : Integer;
        TAMT1 : Decimal;
        TAMT2 : Decimal;
        TAMT3 : Decimal;
        TAMT4 : Decimal;
        TAMT5 : Decimal;
        TAMT6 : Decimal;
        TAMT7 : Decimal;
        TAMT8 : Decimal;
        TAMT9 : Decimal;
        TAMT10 : Decimal;
        TAMT11 : Decimal;
        TAMT12 : Decimal;
        str : Text[5];
        pos : Integer;
        Summary_Reports_Of_Sales_CaptionLbl : Label '"Summary Reports Of Sales "';
        Amounts_in_Lakhs_CaptionLbl : Label '(Amounts in Lakhs)';
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
        Orders_ExpectedCaptionLbl : Label 'Orders Expected';
        V500_00CaptionLbl : Label '500.00';
        V1000_00CaptionLbl : Label '1000.00';
        V1500_00CaptionLbl : Label '1500.00';
        V2000_00CaptionLbl : Label '2000.00';
        V2500_00CaptionLbl : Label '2500.00';
        V3000_00CaptionLbl : Label '3000.00';
        V3500_00CaptionLbl : Label '3500.00';
        V4000_00CaptionLbl : Label '4000.00';
        V5000_00CaptionLbl : Label '5000.00';
        V5500_00CaptionLbl : Label '5500.00';
        V4500_00CaptionLbl : Label '4500.00';
        V6000_00CaptionLbl : Label '6000.00';
        Actual_SalesCaptionLbl : Label 'Actual Sales';
        CummlativeCaptionLbl : Label 'Cummlative';
        Orders_released_Month_wiseCaptionLbl : Label 'Orders released Month wise';
        CummlativeCaption_Control1102154125Lbl : Label 'Cummlative';
        Deficit_SurplusCaptionLbl : Label 'Deficit/Surplus';
        V08_09_Orders_SummaryCaptionLbl : Label '08-09 Orders Summary';
        V08_09_OrdersCaptionLbl : Label '08-09 Orders';
        V08_09_SalesCaptionLbl : Label '08-09 Sales';
        V08_09_PendingCaptionLbl : Label '08-09 Pending';
        Total_OrdersCaptionLbl : Label 'Total Orders';
        Total_SalesCaptionLbl : Label 'Total Sales';
        Total_SummaryCaptionLbl : Label 'Total Summary';
        Total_PendingCaptionLbl : Label 'Total Pending';
        Expected_OrdersCaptionLbl : Label 'Expected Orders';
        Expected_Orders_SummaryCaptionLbl : Label 'Expected Orders Summary';
        Orders_ValueCaptionLbl : Label 'Orders Value';
        AprilCaption_Control1102154291Lbl : Label 'April';
        MayCaption_Control1102154292Lbl : Label 'May';
        JuneCaption_Control1102154293Lbl : Label 'June';
        JulyCaption_Control1102154294Lbl : Label 'July';
        AugustCaption_Control1102154295Lbl : Label 'August';
        SeptemberCaption_Control1102154296Lbl : Label 'September';
        OctoberCaption_Control1102154297Lbl : Label 'October';
        NovemberCaption_Control1102154298Lbl : Label 'November';
        DecemberCaption_Control1102154299Lbl : Label 'December';
        JanuaryCaption_Control1102154300Lbl : Label 'January';
        FebruaryCaption_Control1102154301Lbl : Label 'February';
        MarchCaption_Control1102154302Lbl : Label 'March';
        MonthsCaption_Control1102154303Lbl : Label 'Months';
        Orders_ExpectedCaption_Control1102154320Lbl : Label 'Orders Expected';
        Amounts_in_Lakhs_Caption_Control1102154173Lbl : Label '(Amounts in Lakhs)';
}

