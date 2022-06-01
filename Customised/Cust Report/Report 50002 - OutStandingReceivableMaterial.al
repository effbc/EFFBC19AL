report 50002 "OutStanding/ReceivableMaterial"
{
    // version EFFUPG

    DefaultLayout = RDLC;
    RDLCLayout = './OutStandingReceivableMaterial.rdlc';

    dataset
    {
        dataitem("Purchase Line"; "Purchase Line")
        {
            DataItemTableView = WHERE(Outstanding Quantity=FILTER(>0),Document Type=CONST(Order),No.=FILTER(<>''));
            RequestFilterFields = "Expected Receipt Date";
            ReqFilterHeading = 'Out Standing Report';
            column(Purchase_Line_Report_Choice;Report_Choice)
            {
            }
            column(FORMAT_TODAY_0_4_;FORMAT(TODAY,0,4))
            {
            }
            column(COMPANYNAME;COMPANYNAME)
            {
            }
            column(CurrReport_PAGENO;CurrReport.PAGENO)
            {
            }
            column(USERID;USERID)
            {
            }
            column(Purchase_LineCaption;Purchase_LineCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
            {
            }
            column(OutStanding_Receivable_MaterialCaption;OutStanding_Receivable_MaterialCaptionLbl)
            {
            }
            column(Purchase_Line_Document_Type;"Document Type")
            {
            }
            column(Purchase_Line_Document_No_;"Document No.")
            {
            }
            column(Purchase_Line_Line_No_;"Line No.")
            {
            }
            dataitem("<Purchase Line1>";"Purchase Line")
            {
                DataItemTableView = WHERE(Outstanding Quantity=FILTER(>0),Document Type=CONST(Order),No.=FILTER(<>''),AMC Order=CONST(No));
                RequestFilterFields = "Buy-from Vendor No.",Type,"No.","Location Code";
                column(I;I)
                {
                }
                column(Min_Date;Min_Date)
                {
                }
                column(Max_Date;Max_Date)
                {
                }
                column(ROUND___Purchase_Line1____Outstanding_Quantity____Purchase_Line1____Unit_Cost__LCY___2_;ROUND("<Purchase Line1>"."Outstanding Quantity"*"<Purchase Line1>"."Unit Cost (LCY)",2))
                {
                }
                column(Purchase_Line1___Expected_Receipt_Date_;"Expected Receipt Date")
                {
                }
                column(Purchase_Line1____Purchase_Line1____Qty__to_Receive_;"<Purchase Line1>"."Qty. to Receive")
                {
                }
                column(ROUND__Direct_Unit_Cost__2_;ROUND("Direct Unit Cost",2))
                {
                }
                column(Purchase_Line___Unit_of_Measure_Code_;"Purchase Line"."Unit of Measure Code")
                {
                }
                column(Purchase_Line1__Quantity;Quantity)
                {
                }
                column(Purchase_Line1__Description;Description)
                {
                }
                column(Purchase_Line1___No__;"No.")
                {
                }
                column(Purchase_Line1___Document_No__;"Document No.")
                {
                }
                column(Purchase_Line1___Vendor_Name_;"Vendor Name")
                {
                }
                column(Purchase_Line1__Remarks;Remarks)
                {
                }
                column(Deviated_Date_;"Deviated Date")
                {
                }
                column(Prod__Orders_;"Prod. Orders")
                {
                }
                column(Prod_Start_Date;Prod_Start_Date)
                {
                }
                column(Pending_Days_;"Pending Days")
                {
                }
                column(No__of_Deviations_In_this_Week_;"No. of Deviations In this Week")
                {
                }
                column(Total;Total)
                {
                }
                column(FROM___Caption;FROM___CaptionLbl)
                {
                }
                column(TO__Caption;TO__CaptionLbl)
                {
                }
                column(Order_No_Caption;Order_No_CaptionLbl)
                {
                }
                column(Item_No_Caption;Item_No_CaptionLbl)
                {
                }
                column(QTYCaption;QTYCaptionLbl)
                {
                }
                column(Outstanding_QTYCaption;Outstanding_QTYCaptionLbl)
                {
                }
                column(Expected_Reciept_DateCaption;Expected_Reciept_DateCaptionLbl)
                {
                }
                column(Item_DescriptionCaption;Item_DescriptionCaptionLbl)
                {
                }
                column(Order_ValueCaption;Order_ValueCaptionLbl)
                {
                }
                column(Unit_CostCaption;Unit_CostCaptionLbl)
                {
                }
                column(VendorCaption;VendorCaptionLbl)
                {
                }
                column(UOMCaption;UOMCaptionLbl)
                {
                }
                column(Purchase_Line1__RemarksCaption;FIELDCAPTION(Remarks))
                {
                }
                column(Deviated_DateCaption;Deviated_DateCaptionLbl)
                {
                }
                column(Production_OrdersCaption;Production_OrdersCaptionLbl)
                {
                }
                column(Production_Start_DateCaption;Production_Start_DateCaptionLbl)
                {
                }
                column(Pending_DaysCaption;Pending_DaysCaptionLbl)
                {
                }
                column(No__Of_DevaitionsCaption;No__Of_DevaitionsCaptionLbl)
                {
                }
                column(Purchase_Line1__Document_Type;"Document Type")
                {
                }
                column(Purchase_Line1__Line_No_;"Line No.")
                {
                }

                trigger OnAfterGetRecord();
                begin

                    //Rev01 Start

                    //<Purchase Line1>, Header (2) - OnPostSection()
                    IF Filt THEN BEGIN
                      IF Filter<>'' THEN BEGIN
                        Min_Date:=Max_Date+1;
                        I+=1;
                      END ELSE IF Choice2=Choice2::Past THEN BEGIN
                        Max_Date:=Min_Date-1;
                        I+=1;
                      END ELSE BEGIN
                        Min_Date:=Max_Date+1;
                        I+=1;
                      END;
                    END ELSE IF Choice2=Choice2::Future THEN BEGIN
                      Min_Date:=Max_Date+1;
                      I+=1;
                    END ELSE BEGIN
                      Max_Date:=Min_Date-1;
                      I+=1;
                    END;
                    //<Purchase Line1>, Header (2) - OnPostSection()

                    //<Purchase Line1>, Body (3) - OnPreSection()
                    Vendor.SETRANGE(Vendor."No.","<Purchase Line1>"."Buy-from Vendor No.");
                    IF Vendor.FIND('-') THEN
                      "Vendor Name":=Vendor.Name;

                    Total += "<Purchase Line1>"."Qty. to Receive"*"<Purchase Line1>"."Unit Cost (LCY)";

                    "Prod. Orders" := '';
                    ICN:='';
                    "Indent Line1".SETRANGE("Indent Line1"."Document No.","<Purchase Line1>"."Indent No.");
                    IF  "Indent Line1".FIND('-') THEN
                      ICN:="Indent Line1"."ICN No.";

                    "Indent line 2".SETRANGE("Indent line 2"."ICN No.",ICN);
                    "Indent line 2".SETRANGE("Indent line 2"."No.","<Purchase Line1>"."No.");
                    IF "Indent line 2".FIND('-') THEN
                      REPEAT
                        Po.SETRANGE(Po."No.","Indent line 2"."Production Order");
                        IF Po.FIND('-') THEN
                          "Prod. Orders"+=Po.Description+',';
                        IF Prod_Start_Date=0D THEN
                          Prod_Start_Date:=Po."Prod Start date"
                        ELSE IF Prod_Start_Date >Po."Prod Start date" THEN
                         Prod_Start_Date:=Po."Prod Start date";
                      UNTIL "Indent line 2".NEXT=0;

                    "No. of Deviations In this Week":=0;

                    "Excepted Receipt Date_Tracking".RESET;
                    "Excepted Receipt Date_Tracking".SETRANGE("Excepted Receipt Date_Tracking"."Document No.","<Purchase Line1>"."Document No.");
                    "Excepted Receipt Date_Tracking".SETRANGE("Excepted Receipt Date_Tracking"."Document Line No.","<Purchase Line1>"."Line No.");
                    IF "Excepted Rcpt.Date Tracking".FIND('-') THEN
                      "No. of Deviations In this Week":="Excepted Receipt Date_Tracking".COUNT;

                    "Pending Days":=TODAY-"<Purchase Line1>"."Deviated Receipt Date";
                    IF "<Purchase Line1>"."Expected Receipt Date"="<Purchase Line1>"."Deviated Receipt Date" THEN
                      "Deviated Date":=''
                    ELSE
                      "Deviated Date":=FORMAT("<Purchase Line1>"."Deviated Receipt Date",0,'<Day>-<Month Text,3>-<Year4>');

                    //<Purchase Line1>, Body (3) - OnPreSection()

                    //<Purchase Line1>, Body (3) - OnPostSection()
                    IF Excel THEN BEGIN
                      row:=row+1;
                      EnterCell(row,1,"Vendor Name",FALSE,TempExcelBuffer."Cell Type" :: Text);
                      EnterCell(row,2,FORMAT("<Purchase Line1>"."Document No."),FALSE,TempExcelBuffer."Cell Type" :: Number);
                      EnterCell(row,3,FORMAT("<Purchase Line1>"."No."),FALSE,TempExcelBuffer."Cell Type" :: Number);
                      EnterCell(row,4,FORMAT("<Purchase Line1>".Description),FALSE,TempExcelBuffer."Cell Type" :: Text);
                      EnterCell(row,5,FORMAT("<Purchase Line1>"."Unit of Measure Code"),FALSE,TempExcelBuffer."Cell Type" :: Number);
                      EnterCell(row,6,FORMAT("<Purchase Line1>".Quantity),FALSE,TempExcelBuffer."Cell Type" :: Number);
                      EnterCell(row,7,FORMAT("<Purchase Line1>"."Outstanding Quantity"),FALSE,TempExcelBuffer."Cell Type" :: Number);
                      EnterCell(row,8,FORMAT("<Purchase Line1>"."Expected Receipt Date"),FALSE,TempExcelBuffer."Cell Type" :: Date);
                      EnterCell(row,9,FORMAT("<Purchase Line1>"."Direct Unit Cost"),FALSE,TempExcelBuffer."Cell Type" :: Number);
                      EnterCell(row,10,FORMAT("<Purchase Line1>"."Deviated Receipt Date"),FALSE,TempExcelBuffer."Cell Type" :: Date);
                      EnterCell(row,11,FORMAT("<Purchase Line1>".Remarks),FALSE,TempExcelBuffer."Cell Type" :: Number);
                      EnterCell(row,12,FORMAT("No. of Deviations In this Week"),FALSE,TempExcelBuffer."Cell Type" :: Number);
                    END;
                    //<Purchase Line1>, Body (3) - OnPostSection()

                    //Rev01 End
                end;

                trigger OnPreDataItem();
                begin
                    "<Purchase Line1>".SETRANGE("<Purchase Line1>"."Deviated Receipt Date",Min_Date,Max_Date);
                    IF  "<Purchase Line1>".COUNT=0 THEN BEGIN
                      IF Filt THEN BEGIN
                        IF Filter<>'' THEN BEGIN
                          Min_Date:=Max_Date+1;
                          I+=1;
                        END ELSE IF Choice2=Choice2::Past THEN BEGIN
                          Max_Date:=Min_Date-1;
                          I+=1;
                        END ELSE BEGIN
                          Min_Date:=Max_Date+1;
                          I+=1;
                        END;
                      END ELSE IF Choice2=Choice2::Future THEN BEGIN
                        Max_Date:=Min_Date-1;
                        I+=1;
                      END ELSE BEGIN
                        Min_Date:=Max_Date+1;
                        I+=1;
                      END;
                    END;
                    //<Purchase Line1>, Header (2) - OnPreSection()
                    IF Excel THEN BEGIN
                      row+=1;
                      EnterHeadings(row,1,'VENDOR_NAME',TRUE,TempExcelBuffer."Cell Type" :: Text);
                      EnterHeadings(row,2,'ORDER_NO',TRUE,TempExcelBuffer."Cell Type" :: Text);
                      EnterHeadings(row,3,'ITEM_NO',TRUE,TempExcelBuffer."Cell Type" :: Text);
                      EnterHeadings(row,4,'DESCRIPTION',TRUE,TempExcelBuffer."Cell Type" :: Text);
                      EnterHeadings(row,5,'UNIT_MES_CODE',TRUE,TempExcelBuffer."Cell Type" :: Text);
                      EnterHeadings(row,6,'QUANTITY',TRUE,TempExcelBuffer."Cell Type" :: Text);
                      EnterHeadings(row,7,'OUTSTANDING_QTY',TRUE,TempExcelBuffer."Cell Type" :: Text);
                      EnterHeadings(row,8,'EXPECTED_RCEPIT_DATE',TRUE,TempExcelBuffer."Cell Type" :: Text);
                      EnterHeadings(row,9,'DIRECT_UNIT_COST',TRUE,TempExcelBuffer."Cell Type" :: Text);
                      EnterHeadings(row,10,'DEVIATED RECEIPT DATE',TRUE,TempExcelBuffer."Cell Type" :: Text);
                      EnterHeadings(row,11,'REMARKS',TRUE,TempExcelBuffer."Cell Type" :: Text);
                      EnterHeadings(row,12,'NO. OF DEVIATIONS',TRUE,TempExcelBuffer."Cell Type" :: Text);
                    END;
                    //<Purchase Line1>, Header (2) - OnPreSection()
                end;
            }

            trigger OnAfterGetRecord();
            begin
                Total:=0;
                IF Choice=Choice::Detail THEN BEGIN
                  IF Filt THEN BEGIN
                    IF Filter <> '' THEN BEGIN
                      IF  (Min_Date<=MAXDATE) THEN BEGIN
                        Max_Date:=CALCDATE(Period_Length,Min_Date);
                        Max_Date:=Max_Date-1;
                        IF Max_Date>MAXDATE THEN
                          Max_Date:=MAXDATE;
                      END ELSE
                        CurrReport.BREAK;
                    END ELSE IF Choice2=Choice2::Past THEN BEGIN
                      IF (I<=No_of_Slots) AND (Max_Date>=MINDATE) THEN BEGIN
                        Min_Date:=CALCDATE(Period_Length,Max_Date);
                        Min_Date:=Min_Date+1;
                        IF Min_Date<MINDATE THEN
                          Min_Date:=MINDATE;
                      END ELSE
                        CurrReport.BREAK;
                    END ELSE BEGIN
                      IF (I<=No_of_Slots) AND (Min_Date<=MAXDATE) THEN BEGIN
                        Max_Date:=CALCDATE(Period_Length,Min_Date);
                        Max_Date:=Max_Date-1;
                      END ELSE
                        CurrReport.BREAK;
                    END;
                  END ELSE IF Choice2=Choice2::Past THEN BEGIN
                    IF (I<=No_of_Slots) AND (Max_Date>=MINDATE) THEN BEGIN
                      Min_Date:=CALCDATE(Period_Length,Max_Date);
                      Min_Date:=Min_Date+1;
                      IF Min_Date<MINDATE THEN
                        Min_Date:=MINDATE;
                    END ELSE
                      CurrReport.BREAK;
                  END ELSE BEGIN
                    IF (I<=No_of_Slots) AND (Min_Date<=MAXDATE) THEN BEGIN
                      Max_Date:=CALCDATE(Period_Length,Min_Date);
                      Max_Date:=Max_Date-1;
                    END ELSE
                     CurrReport.BREAK;
                  END;
                END;
            end;

            trigger OnPreDataItem();
            begin
                IF Report_Choice<>Report_Choice::OutStanding THEN
                  CurrReport.BREAK;

                //EXCEL CODE
                IF Excel THEN BEGIN
                  TempExcelBuffer.DELETEALL;
                  CLEAR(TempExcelBuffer);
                END;
                row:=1;

                Start_Date:=WORKDATE;
                I:=1;
                Filter:="Purchase Line".GETFILTER("Purchase Line"."Expected Receipt Date");
                Filt:="Purchase Line".HASFILTER;
                IF Period_Length='' THEN
                  Period_Length:='1W';

                IF Choice=Choice:: Detail THEN BEGIN
                  IF "Purchase Line".HASFILTER THEN BEGIN
                    IF Filter<>'' THEN BEGIN
                      MAXDATE:="Purchase Line".GETRANGEMAX("Purchase Line"."Expected Receipt Date");
                      MINDATE:="Purchase Line".GETRANGEMIN("Purchase Line"."Expected Receipt Date");
                      Max_Date:=MINDATE;
                      Min_Date:=MINDATE;
                    END ELSE BEGIN
                      IF Choice2=Choice2::Past THEN BEGIN
                        Period_Length:='-'+Period_Length;
                        MINDATE:=040107D;
                        MAXDATE:=WORKDATE;
                        Max_Date:=MAXDATE;
                        Min_Date:=MAXDATE;
                        IF No_of_Slots=0 THEN
                          No_of_Slots:=1;
                      END ELSE BEGIN
                        MAXDATE:=12319999D;
                        MINDATE:=WORKDATE;
                        Max_Date:=MINDATE;
                        Min_Date:=MINDATE;
                        IF No_of_Slots=0 THEN
                          No_of_Slots:=1;
                      END;
                    END;
                  END ELSE BEGIN
                    IF Choice2=Choice2::Past THEN BEGIN
                      Period_Length:='-'+Period_Length;
                      MINDATE:=040107D;
                      MAXDATE:=WORKDATE;
                      Max_Date:=MAXDATE;
                      Min_Date:=MAXDATE;
                      IF No_of_Slots=0 THEN
                        No_of_Slots:=1;
                    END ELSE BEGIN
                      MAXDATE:=12319999D;
                      MINDATE:=WORKDATE;
                      Max_Date:=MINDATE;
                      Min_Date:=MINDATE;
                      IF No_of_Slots=0 THEN
                        No_of_Slots:=1;
                    END;
                  END;
                END ELSE
                  CurrReport.BREAK;

                CLEAR(TempExcelBuffer);
                row:=0;
            end;
        }
        dataitem("Excepted Rcpt.Date Tracking";"Excepted Rcpt.Date Tracking")
        {
            DataItemTableView = SORTING(Document No.,Document Line No.,Modified Date,Excepted Receipt Old Date);
            RequestFilterFields = "Modified Date";
            ReqFilterHeading = 'Deviation Report';
            column(Excepted_Rcpt_Date_Tracking_Report_Choice;Report_Choice)
            {
            }
            column(ExceptRcptDateShowOuptputGroupFooter5;ExceptRcptDateShowOuptputGroupFooter5)
            {
            }
            column(FORMAT_TODAY_0_4__Control1102154009;FORMAT(TODAY,0,4))
            {
            }
            column(COMPANYNAME_Control1102154010;COMPANYNAME)
            {
            }
            column(CurrReport_PAGENO_Control1102154011;CurrReport.PAGENO)
            {
            }
            column(USERID_Control1102154013;USERID)
            {
            }
            column(Report_Heading;Report_Heading)
            {
            }
            column(Vendor_Name_;"Vendor Name")
            {
            }
            column(Excepted_Rcpt_Date_Tracking__Document_No__;"Document No.")
            {
            }
            column(Desc;Desc)
            {
            }
            column(Pending_Days__Control1102154039;"Pending Days")
            {
            }
            column(UOM;UOM)
            {
            }
            column(Excepted_Rcpt_Date_Tracking__Item_No__;"Item No.")
            {
            }
            column(Qty;Qty)
            {
            }
            column(Pending_Qty;Pending_Qty)
            {
            }
            column(Expepected_Date_at_Order_Time_;"Expepected Date at Order Time")
            {
            }
            column(Deviated_Date__Control1102154054;"Deviated Date")
            {
            }
            column(ROUND_Unit_Cost_2_;ROUND(Unit_Cost,2))
            {
            }
            column(ROUND_Pending_Qty_Unit_Cost_2_;ROUND(Pending_Qty*Unit_Cost,2))
            {
            }
            column(Total_No__Of_Deviations_;"Total No. Of Deviations")
            {
            }
            column(Remarks;Remarks)
            {
            }
            column(ROUND_Total_2_;ROUND(Total,2))
            {
            }
            column(Deviations_ReportCaption;Deviations_ReportCaptionLbl)
            {
            }
            column(CurrReport_PAGENO_Control1102154011Caption;CurrReport_PAGENO_Control1102154011CaptionLbl)
            {
            }
            column(VendorCaption_Control1102154015;VendorCaption_Control1102154015Lbl)
            {
            }
            column(Order_No_Caption_Control1102154016;Order_No_Caption_Control1102154016Lbl)
            {
            }
            column(Item_No_Caption_Control1102154017;Item_No_Caption_Control1102154017Lbl)
            {
            }
            column(Item_DescriptionCaption_Control1102154018;Item_DescriptionCaption_Control1102154018Lbl)
            {
            }
            column(UOMCaption_Control1102154019;UOMCaption_Control1102154019Lbl)
            {
            }
            column(QTYCaption_Control1102154020;QTYCaption_Control1102154020Lbl)
            {
            }
            column(Outstanding_QTYCaption_Control1102154021;Outstanding_QTYCaption_Control1102154021Lbl)
            {
            }
            column(Unit_CostCaption_Control1102154023;Unit_CostCaption_Control1102154023Lbl)
            {
            }
            column(Order_ValueCaption_Control1102154024;Order_ValueCaption_Control1102154024Lbl)
            {
            }
            column(Deviated_DateCaption_Control1102154025;Deviated_DateCaption_Control1102154025Lbl)
            {
            }
            column(Pending_DaysCaption_Control1102154026;Pending_DaysCaption_Control1102154026Lbl)
            {
            }
            column(ReasonCaption;ReasonCaptionLbl)
            {
            }
            column(Expected_DateCaption;Expected_DateCaptionLbl)
            {
            }
            column(Total_No__of_DeviationsCaption;Total_No__of_DeviationsCaptionLbl)
            {
            }
            column(DaysCaption;DaysCaptionLbl)
            {
            }
            column(Excepted_Rcpt_Date_Tracking_Entry_No_;"Entry No.")
            {
            }
            column(Excepted_Rcpt_Date_Tracking_Document_Line_No_;"Document Line No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                //Rev01 Start
                ExceptRcptDateShowOuptputGroupFooter5 := FALSE;
                CLEAR(NextDocLineNoGVar);

                ExceptRcptDateTrackGRec.RESET;
                ExceptRcptDateTrackGRec.SETCURRENTKEY("Document No.","Document Line No.","Modified Date","Excepted Receipt Old Date");
                ExceptRcptDateTrackGRec.SETRANGE("Entry No.","Excepted Rcpt.Date Tracking"."Entry No.");
                ExceptRcptDateTrackGRec.SETRANGE("Document No.","Excepted Rcpt.Date Tracking"."Document No.");
                ExceptRcptDateTrackGRec.SETRANGE("Document Line No.","Excepted Rcpt.Date Tracking"."Document Line No.");
                IF ExceptRcptDateTrackGRec.FINDFIRST THEN BEGIN
                  ExceptRcptDateTrackGRec.NEXT;
                  NextDocLineNoGVar := ExceptRcptDateTrackGRec."Document Line No.";
                END;


                //Excepted Rcpt.Date Tracking, Header (1) - OnPreSection() >>
                Report_Heading := 'Items Deviated From ' +FORMAT(MINDATE,0,'<Day>-<Month Text,3>-<Year4>')+' To '+
                                  FORMAT(MAXDATE,0,'<Day>-<Month Text,3>-<Year4>');
                //Excepted Rcpt.Date Tracking, Header (1) - OnPreSection() <<

                //Excepted Rcpt.Date Tracking, GroupHeader - OnPreSection() >>
                IF PrevDocLineNoGVar <> "Excepted Rcpt.Date Tracking"."Document Line No." THEN BEGIN
                  "Expepected Date at Order Time":=0D;
                  "No. of Deviations In this Week":=0;
                END;
                //Excepted Rcpt.Date Tracking, GroupHeader - OnPreSection() <<

                //Excepted Rcpt.Date Tracking, Body (4) - OnPreSection() >>
                IF "Expected Date in Present Week"=0D THEN
                  "Expected Date in Present Week":="Excepted Rcpt.Date Tracking"."Excepted Receipt Old Date";
                IF "Excepted Rcpt.Date Tracking"."Excepted Receipt New Date">"Excepted Rcpt.Date Tracking"."Excepted Receipt Old Date" THEN
                  "No. of Deviations In this Week"+=1;
                //Excepted Rcpt.Date Tracking, Body (4) - OnPreSection()  <<

                //Excepted Rcpt.Date Tracking, GroupFooter - OnPreSection() >>
                IF NextDocLineNoGVar <> "Excepted Rcpt.Date Tracking"."Document Line No." THEN BEGIN
                  ExceptRcptDateShowOuptputGroupFooter5 := TRUE;
                  "Vendor Name":='';
                  UOM:='';
                  Desc:='';
                  Qty:=0;
                  Pending_Qty:=0;
                  "Expepected Date at Order Time":=0D;
                  Unit_Cost:=0;

                  "Deviated Date":='';
                  "Pending Days":=0;
                  Remarks:='';

                  "Purchase Line".RESET;
                  "Purchase Line".SETRANGE("Purchase Line"."Document Type","Purchase Line"."Document Type"::Order);
                  "Purchase Line".SETRANGE("Purchase Line"."Document No.","Excepted Rcpt.Date Tracking"."Document No.");
                  "Purchase Line".SETRANGE("Purchase Line"."Line No.","Excepted Rcpt.Date Tracking"."Document Line No.");
                  "Purchase Line".SETRANGE("Purchase Line".Type,"Purchase Line".Type::Item);
                  IF "Purchase Line".FIND('-') THEN BEGIN
                    IF  Str_CHoice=0 THEN
                      s:="Purchase Line"."Location Code"
                    ELSE
                      s:=FORMAT(Str_CHoice) ;
                    //IF (s="Purchase Line"."Location Code") AND ("Purchase Line"."Qty. to Receive">0)  THEN
                    IF (s="Purchase Line"."Location Code") AND (FORMAT("Purchase Line"."Expected Receipt Date")<>'') THEN BEGIN
                      IF Vendor.GET("Purchase Line"."Buy-from Vendor No.") THEN
                        "Vendor Name":=Vendor.Name;

                      UOM:="Purchase Line"."Unit of Measure";
                      Desc:="Purchase Line".Description;
                      Qty:="Purchase Line".Quantity;
                      Pending_Qty:="Purchase Line"."Qty. to Receive";
                      "Expepected Date at Order Time":="Purchase Line"."Expected Receipt Date";
                      Unit_Cost:="Purchase Line"."Unit Cost (LCY)";
                      Total+=(Pending_Qty*"Purchase Line"."Unit Cost (LCY)");
                      "Deviated Date":=FORMAT("Purchase Line"."Deviated Receipt Date",0,'<Day>-<Month Text,3>-<Year4>');

                      Item.SETFILTER(Item."No.","Purchase Line"."No.");
                      IF Item.FINDFIRST THEN
                        Lead_Time:=FORMAT(Item."Safety Lead Time");

                      IF "Purchase Line"."Deviated Receipt Date"> TODAY THEN
                        "Pending Days":=TODAY-"Expepected Date at Order Time"
                      ELSE
                        "Pending Days":="Purchase Line"."Deviated Receipt Date"-"Expepected Date at Order Time" ;

                      Remarks:="Purchase Line".Remarks;
                      IF  "Pending Days">0 THEN BEGIN
                        IF Excel THEN BEGIN
                          row+=1;
                          EnterCell(row,1,FORMAT("Purchase Line"."Document No."),FALSE,TempExcelBuffer."Cell Type" :: Number);
                          EnterCell(row,2,"Vendor Name",FALSE,TempExcelBuffer."Cell Type" :: Text);
                          EnterCell(row,3,"Purchase Line"."No.",FALSE,TempExcelBuffer."Cell Type" :: Number);
                          EnterCell(row,4,Desc,FALSE,TempExcelBuffer."Cell Type" :: Text);
                          EnterCell(row,5,Item."Product Group Code",FALSE,TempExcelBuffer."Cell Type" :: Number);
                          EnterCell(row,6,FORMAT(Qty),FALSE,TempExcelBuffer."Cell Type" :: Number);
                          EnterCell(row,7,Lead_Time,FALSE,TempExcelBuffer."Cell Type" :: Number);
                          EnterCell(row,8,FORMAT("Expepected Date at Order Time"),FALSE,TempExcelBuffer."Cell Type" :: Number);
                          EnterCell(row,9,FORMAT("Deviated Date"),FALSE,TempExcelBuffer."Cell Type" :: Date);
                          EnterCell(row,10,FORMAT("Pending Days"),FALSE,TempExcelBuffer."Cell Type" :: Number);
                          EnterCell(row,11,Remarks,FALSE,TempExcelBuffer."Cell Type" :: Number);
                        END;
                      END;
                    END ELSE
                      //CurrReport.SHOWOUTPUT:=FALSE; //Rev01
                      ExceptRcptDateShowOuptputGroupFooter5 := FALSE;
                  END ELSE
                    //CurrReport.SHOWOUTPUT:=FALSE; //Rev01
                    ExceptRcptDateShowOuptputGroupFooter5 := FALSE;
                END;

                "Excepted Receipt Date_Tracking".RESET;
                "Excepted Receipt Date_Tracking".SETRANGE("Excepted Receipt Date_Tracking"."Document No.","Excepted Rcpt.Date Tracking"."Document No.");
                "Excepted Receipt Date_Tracking".SETRANGE("Excepted Receipt Date_Tracking"."Document Line No.","Excepted Rcpt.Date Tracking"."Document Line No.");
                "Total No. Of Deviations":="Excepted Receipt Date_Tracking".COUNT;
                //Excepted Rcpt.Date Tracking, GroupFooter - OnPreSection() <<

                PrevDocLineNoGVar := "Excepted Rcpt.Date Tracking"."Document Line No.";
                //Rev01 End
            end;

            trigger OnPreDataItem();
            begin

                IF Report_Choice<>Report_Choice::Devaitions THEN
                  CurrReport.BREAK;

                //Rev01 Start
                CLEAR(PrevDocLineNoGVar);
                CLEAR(NextDocLineNoGVar);
                //Rev01 End

                IF "Excepted Rcpt.Date Tracking".GETFILTER("Excepted Rcpt.Date Tracking"."Modified Date")='' THEN BEGIN
                  IF Period_Length='' THEN
                    Period_Length:='1W';

                  Period_Length:='-'+Period_Length;

                  MAXDATE:=TODAY-1;
                  MINDATE:=CALCDATE(Period_Length,MAXDATE);

                  "Excepted Rcpt.Date Tracking".SETRANGE("Excepted Rcpt.Date Tracking"."Modified Date",MINDATE,MAXDATE);
                END ELSE BEGIN
                  MAXDATE:="Excepted Rcpt.Date Tracking".GETRANGEMAX("Excepted Rcpt.Date Tracking"."Modified Date");
                  MINDATE:="Excepted Rcpt.Date Tracking".GETRANGEMIN("Excepted Rcpt.Date Tracking"."Modified Date");
                END;

                "Excepted Rcpt.Date Tracking".SETRANGE("Excepted Rcpt.Date Tracking"."Excepted Receipt Old Date",MINDATE,MAXDATE);

                IF Excel THEN BEGIN
                  row+=1;
                  EnterHeadings(row,1,'ORDER NO.',TRUE,TempExcelBuffer."Cell Type" :: Text);
                  EnterHeadings(row,2,'VENDOR NAME',TRUE,TempExcelBuffer."Cell Type" :: Text);
                  EnterHeadings(row,3,'ITEM NO',TRUE,TempExcelBuffer."Cell Type" :: Text);
                  EnterHeadings(row,4,'ITEM DESCRIPTION',TRUE,TempExcelBuffer."Cell Type" :: Text);
                  EnterHeadings(row,5,'ITEM CATEGORY CODE',TRUE,TempExcelBuffer."Cell Type" :: Text);
                  EnterHeadings(row,6,'QUANTITY',TRUE,TempExcelBuffer."Cell Type" :: Text);
                  EnterHeadings(row,7,'ITEM LEAD TIME',TRUE,TempExcelBuffer."Cell Type" :: Text);
                  EnterHeadings(row,8,'EXPECTED DATE',TRUE,TempExcelBuffer."Cell Type" :: Text);
                  EnterHeadings(row,9,'DEVIATED DATE',TRUE,TempExcelBuffer."Cell Type" :: Text);
                  EnterHeadings(row,10,'PENDING DAYS',TRUE,TempExcelBuffer."Cell Type" :: Text);
                  EnterHeadings(row,11,'REASON',TRUE,TempExcelBuffer."Cell Type" :: Text);
                END;
            end;
        }
        dataitem("<Purchase Line2>";"Purchase Line")
        {
            CalcFields = Document Date;
            DataItemTableView = SORTING(Deviated Receipt Date) ORDER(Ascending) WHERE(Document Type=CONST(Order),Qty. to Receive=FILTER(>0),Location Code=CONST(STR));
            RequestFilterFields = "Deviated Receipt Date";
            ReqFilterHeading = 'Deviation Report (Production)';
            column(Purchase_Line2_Report_Choice;Report_Choice)
            {
            }
            column(PurchLine2ShowOutputBody3;PurchLine2ShowOutputBody3)
            {
            }
            column(FORMAT_TODAY_0_4__Control1102154030;FORMAT(TODAY,0,4))
            {
            }
            column(COMPANYNAME_Control1102154032;COMPANYNAME)
            {
            }
            column(CurrReport_PAGENO_Control1102154033;CurrReport.PAGENO)
            {
            }
            column(USERID_Control1102154035;USERID)
            {
            }
            column(Report_Heading_Control1102154036;Report_Heading)
            {
            }
            column(Purchase_Line2___Document_No__;"Document No.")
            {
            }
            column(Purchase_Line2____Purchase_Line2___Description;"<Purchase Line2>".Description)
            {
            }
            column(Pending_Days__Control1102154108;"Pending Days")
            {
            }
            column(Purchase_Line2____Purchase_Line2___Remarks;"<Purchase Line2>".Remarks)
            {
            }
            column(Purchase_Line2____Purchase_Line2____Unit_of_Measure_Code_;"<Purchase Line2>"."Unit of Measure Code")
            {
            }
            column(Purchase_Line2____Purchase_Line2____No__;"<Purchase Line2>"."No.")
            {
            }
            column(Purchase_Line2____Purchase_Line2___Quantity;"<Purchase Line2>".Quantity)
            {
            }
            column(Purchase_Line2____Purchase_Line2____Qty__to_Receive_;"<Purchase Line2>"."Qty. to Receive")
            {
            }
            column(Purchase_Line2____Purchase_Line2____Expected_Receipt_Date_;"<Purchase Line2>"."Expected Receipt Date")
            {
            }
            column(Purchase_Line2____Purchase_Line2____Deviated_Receipt_Date_;"<Purchase Line2>"."Deviated Receipt Date")
            {
            }
            column(Total_No__Of_Deviations__Control1102154118;"Total No. Of Deviations")
            {
            }
            column(Shifted_To;Shifted_To)
            {
            }
            column(Purchase_Line2____Purchase_Line2____Document_Date_;"<Purchase Line2>"."Document Date")
            {
            }
            column(Lead_Time;Lead_Time)
            {
            }
            column(Deviations_ReportCaption_Control1102154022;Deviations_ReportCaption_Control1102154022Lbl)
            {
            }
            column(CurrReport_PAGENO_Control1102154033Caption;CurrReport_PAGENO_Control1102154033CaptionLbl)
            {
            }
            column(Order_No_Caption_Control1102154091;Order_No_Caption_Control1102154091Lbl)
            {
            }
            column(Item_No_Caption_Control1102154092;Item_No_Caption_Control1102154092Lbl)
            {
            }
            column(Item_DescriptionCaption_Control1102154093;Item_DescriptionCaption_Control1102154093Lbl)
            {
            }
            column(UOMCaption_Control1102154094;UOMCaption_Control1102154094Lbl)
            {
            }
            column(Order_QuantityCaption;Order_QuantityCaptionLbl)
            {
            }
            column(Pending_QtyCaption;Pending_QtyCaptionLbl)
            {
            }
            column(Deviated_DateCaption_Control1102154099;Deviated_DateCaption_Control1102154099Lbl)
            {
            }
            column(Pending_DaysCaption_Control1102154100;Pending_DaysCaption_Control1102154100Lbl)
            {
            }
            column(ReasonCaption_Control1102154101;ReasonCaption_Control1102154101Lbl)
            {
            }
            column(Expected_Date_Caption;Expected_Date_CaptionLbl)
            {
            }
            column(Total_No__of_DeviationsCaption_Control1102154104;Total_No__of_DeviationsCaption_Control1102154104Lbl)
            {
            }
            column(Shifted_ToCaption;Shifted_ToCaptionLbl)
            {
            }
            column(Order_DateCaption;Order_DateCaptionLbl)
            {
            }
            column(Lead_TimeCaption;Lead_TimeCaptionLbl)
            {
            }
            column(DaysCaption_Control1102154119;DaysCaption_Control1102154119Lbl)
            {
            }
            column(Purchase_Line2__Document_Type;"Document Type")
            {
            }
            column(Purchase_Line2__Line_No_;"Line No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                PurchLine2ShowOutputBody3 := TRUE; //Rev01

                "Excepted Receipt Date_Tracking".RESET;
                "Excepted Rcpt.Date Tracking".SETRANGE("Excepted Rcpt.Date Tracking"."Document No.","<Purchase Line2>"."Document No.");
                "Excepted Rcpt.Date Tracking".SETRANGE("Excepted Rcpt.Date Tracking"."Document Line No.","<Purchase Line2>"."Line No.");
                "Excepted Rcpt.Date Tracking".SETRANGE("Excepted Rcpt.Date Tracking"."Document Type","<Purchase Line2>"."Document Type");
                "Excepted Rcpt.Date Tracking".SETRANGE("Excepted Rcpt.Date Tracking"."Item No.","<Purchase Line2>"."No.");
                IF "Excepted Rcpt.Date Tracking".FIND('-') THEN
                  CurrReport.SKIP;


                //Rev01 Start
                //<Purchase Line2>, Header (1) - OnPreSection() >>
                Report_Heading:='Items Deviated From ' +FORMAT(MINDATE,0,'<Day>-<Month Text,3>-<Year4>')+' To '+ FORMAT(MAXDATE,0,'<Day>-<Month Text,3>-<Year4>');
                "Print Heading":=FALSE;
                //<Purchase Line2>, Header (1) - OnPreSection() <<

                //<Purchase Line2>, Body (3) - OnPreSection() >>
                "Pending Days":=TODAY-"<Purchase Line2>"."Expected Receipt Date";

                "Excepted Receipt Date_Tracking".RESET;
                "Excepted Receipt Date_Tracking".SETRANGE("Excepted Receipt Date_Tracking"."Document No.","<Purchase Line2>"."Document No.");
                "Excepted Receipt Date_Tracking".SETRANGE("Excepted Receipt Date_Tracking"."Document Line No.","<Purchase Line2>"."Line No.");
                "Total No. Of Deviations":="Excepted Receipt Date_Tracking".COUNT;

                IF Item.GET("<Purchase Line2>"."No.") THEN
                  Lead_Time:=FORMAT(Item."Safety Lead Time");

                Shortage_Det.RESET;
                Shortage_Det.SETRANGE(Shortage_Det."Item No","<Purchase Line2>"."No.");
                IF Shortage_Det.FIND('-') THEN
                  //CurrReport.SHOWOUTPUT:=TRUE //Rev01
                  PurchLine2ShowOutputBody3 := TRUE
                ELSE
                  //CurrReport.SHOWOUTPUT:=FALSE; //Rev01
                  PurchLine2ShowOutputBody3 := FALSE;
                //<Purchase Line2>, Body (3) - OnPreSection() <<
            end;

            trigger OnPreDataItem();
            begin

                CLEAR(PurchLine2ShowOutputBody3); //Rev01

                IF Report_Choice <> Report_Choice::Prod_Dev THEN
                  CurrReport.BREAK;

                IF "<Purchase Line2>".GETFILTER("<Purchase Line2>"."Deviated Receipt Date")='' THEN
                  ERROR('PLEASE ENTER THE DEVIATED DATE')
                ELSE BEGIN
                  MAXDATE:="<Purchase Line2>".GETRANGEMAX("<Purchase Line2>"."Deviated Receipt Date");
                  MINDATE:="<Purchase Line2>".GETRANGEMIN("<Purchase Line2>"."Deviated Receipt Date");
                END;
            end;
        }
        dataitem("<Excepted Rcpt.Date Tracking1>";"Excepted Rcpt.Date Tracking")
        {
            DataItemTableView = SORTING(Document No.,Document Line No.,Modified Date,Excepted Receipt Old Date) ORDER(Ascending);
            column(Print_Heading;"Print Heading")
            {
            }
            column(ExceptRcptDate1ShowOuptputGroupFooter4;ExceptRcptDate1ShowOuptputGroupFooter4)
            {
            }
            column(Excepted_Rcpt_Date_Tracking_1_Report_Choice;Report_Choice)
            {
            }
            column(FORMAT_TODAY_0_4__Control1102154038;FORMAT(TODAY,0,4))
            {
            }
            column(COMPANYNAME_Control1102154041;COMPANYNAME)
            {
            }
            column(CurrReport_PAGENO_Control1102154045;CurrReport.PAGENO)
            {
            }
            column(USERID_Control1102154051;USERID)
            {
            }
            column(Report_Heading_Control1102154053;Report_Heading)
            {
            }
            column(Excepted_Rcpt_Date_Tracking1___Document_No__;"Document No.")
            {
            }
            column(Desc_Control1102154077;Desc)
            {
            }
            column(Pending_Days__Control1102154078;"Pending Days")
            {
            }
            column(UOM_Control1102154079;UOM)
            {
            }
            column(Excepted_Rcpt_Date_Tracking1___Item_No__;"Item No.")
            {
            }
            column(Qty_Control1102154081;Qty)
            {
            }
            column(Pending_Qty_Control1102154082;Pending_Qty)
            {
            }
            column(Expepected_Date_at_Order_Time__Control1102154083;"Expepected Date at Order Time")
            {
            }
            column(Total_No__Of_Deviations__Control1102154086;"Total No. Of Deviations")
            {
            }
            column(Excepted_Rcpt_Date_Tracking1__Reason;Reason)
            {
            }
            column(Shifted_To_Control1102154089;Shifted_To)
            {
            }
            column(Deviated_Date__Control1102154123;"Deviated Date")
            {
            }
            column(Order_Date;Order_Date)
            {
            }
            column(Lead_Time_Control1102154085;Lead_Time)
            {
            }
            column(Deviations_ReportCaption_Control1102154037;Deviations_ReportCaption_Control1102154037Lbl)
            {
            }
            column(CurrReport_PAGENO_Control1102154045Caption;CurrReport_PAGENO_Control1102154045CaptionLbl)
            {
            }
            column(Order_No_Caption_Control1102154059;Order_No_Caption_Control1102154059Lbl)
            {
            }
            column(Item_No_Caption_Control1102154062;Item_No_Caption_Control1102154062Lbl)
            {
            }
            column(Item_DescriptionCaption_Control1102154063;Item_DescriptionCaption_Control1102154063Lbl)
            {
            }
            column(UOMCaption_Control1102154064;UOMCaption_Control1102154064Lbl)
            {
            }
            column(Order_QuantityCaption_Control1102154065;Order_QuantityCaption_Control1102154065Lbl)
            {
            }
            column(Pending_QTYCaption_Control1102154066;Pending_QTYCaption_Control1102154066Lbl)
            {
            }
            column(Deviated_DateCaption_Control1102154069;Deviated_DateCaption_Control1102154069Lbl)
            {
            }
            column(Pending_DaysCaption_Control1102154070;Pending_DaysCaption_Control1102154070Lbl)
            {
            }
            column(ReasonCaption_Control1102154071;ReasonCaption_Control1102154071Lbl)
            {
            }
            column(Expected_DateCaption_Control1102154073;Expected_DateCaption_Control1102154073Lbl)
            {
            }
            column(Total_No__of_DeviationsCaption_Control1102154074;Total_No__of_DeviationsCaption_Control1102154074Lbl)
            {
            }
            column(Shifted_ToCaption_Control1102154121;Shifted_ToCaption_Control1102154121Lbl)
            {
            }
            column(Order_DateCaption_Control1102154067;Order_DateCaption_Control1102154067Lbl)
            {
            }
            column(Lead_TimeCaption_Control1102154084;Lead_TimeCaption_Control1102154084Lbl)
            {
            }
            column(DaysCaption_Control1102154087;DaysCaption_Control1102154087Lbl)
            {
            }
            column(Excepted_Rcpt_Date_Tracking1__Entry_No_;"Entry No.")
            {
            }
            column(Excepted_Rcpt_Date_Tracking1__Document_Line_No_;"Document Line No.")
            {
            }

            trigger OnAfterGetRecord();
            begin

                //Rev01 Start
                ExceptRcptDate1ShowOuptputGroupFooter4 := FALSE;
                CLEAR(NextDocLineNoGVar);

                ExceptRcptDateTrackGRec.RESET;
                ExceptRcptDateTrackGRec.SETCURRENTKEY("Document No.","Document Line No.","Modified Date","Excepted Receipt Old Date");
                ExceptRcptDateTrackGRec.SETRANGE("Entry No.","<Excepted Rcpt.Date Tracking1>"."Entry No.");
                ExceptRcptDateTrackGRec.SETRANGE("Document No.","<Excepted Rcpt.Date Tracking1>"."Document No.");
                ExceptRcptDateTrackGRec.SETRANGE("Document Line No.","<Excepted Rcpt.Date Tracking1>"."Document Line No.");
                IF ExceptRcptDateTrackGRec.FINDFIRST THEN BEGIN
                  ExceptRcptDateTrackGRec.NEXT;
                  NextDocLineNoGVar := ExceptRcptDateTrackGRec."Document Line No.";
                END;

                //Excepted Rcpt.Date Tracking1>, Header (1) - OnPreSection() >>
                Report_Heading:='Items Deviated From ' +FORMAT(MINDATE,0,'<Day>-<Month Text,3>-<Year4>')+' To '+ FORMAT(MAXDATE,0,'<Day>-<Month Text,3>-<Year4>');
                //CurrReport.SHOWOUTPUT("Print Heading");
                //Excepted Rcpt.Date Tracking1>, Header (1) - OnPreSection() <<

                //Excepted Rcpt.Date Tracking1>, Header (2) - OnPreSection() >>
                //CurrReport.SHOWOUTPUT("Print Heading");
                //Excepted Rcpt.Date Tracking1>, Header (2) - OnPreSection() <<

                //<Excepted Rcpt.Date Tracking1>, GroupFooter(4) - OnPreSection() >>
                IF NextDocLineNoGVar <> "<Excepted Rcpt.Date Tracking1>"."Document Line No." THEN BEGIN
                  ExceptRcptDate1ShowOuptputGroupFooter4 := TRUE;
                  "Vendor Name":='';
                  UOM:='';
                  Desc:='';
                  Qty:=0;
                  Pending_Qty:=0;
                  "Expepected Date at Order Time":=0D;
                  Unit_Cost:=0;
                  Shifted_To:=0D;
                  "Deviated Date":='';
                  "Pending Days":=0;

                  "Purchase Line".RESET;
                  "Purchase Line".SETRANGE("Purchase Line"."Document Type","Purchase Line"."Document Type"::Order);
                  "Purchase Line".SETRANGE("Purchase Line"."Document No.","<Excepted Rcpt.Date Tracking1>"."Document No.");
                  "Purchase Line".SETRANGE("Purchase Line"."Line No.","<Excepted Rcpt.Date Tracking1>"."Document Line No.");
                  IF "Purchase Line".FIND('-') THEN BEGIN
                    "Purchase Line".CALCFIELDS("Purchase Line"."Document Date");
                    IF ("<Purchase Line2>"."Location Code"='STR') AND ("Purchase Line"."Qty. to Receive">0) THEN BEGIN
                      IF Vendor.GET("Purchase Line"."Buy-from Vendor No.") THEN
                         "Vendor Name":=Vendor.Name;
                      UOM:="Purchase Line"."Unit of Measure";
                      Desc:="Purchase Line".Description;
                      Qty:="Purchase Line".Quantity;
                      Pending_Qty:="Purchase Line"."Qty. to Receive";
                      "Expepected Date at Order Time":="Purchase Line"."Expected Receipt Date";
                      Unit_Cost:="Purchase Line"."Unit Cost (LCY)";
                      Total+=(Pending_Qty*"Purchase Line"."Unit Cost (LCY)");
                      "Deviated Date":=FORMAT("<Excepted Rcpt.Date Tracking1>"."Excepted Receipt Old Date",0,'<Day>-<Month Text,3>-<Year4>');
                      "Pending Days":=TODAY-"Expepected Date at Order Time";
                      Shifted_To:="Purchase Line"."Deviated Receipt Date";
                      Order_Date:="Purchase Line"."Document Date";

                      IF Item.GET("Purchase Line"."No.") THEN
                        Lead_Time:=FORMAT(Item."Safety Lead Time");

                      "Total No. Of Deviations":="Excepted Receipt Date_Tracking".COUNT;

                      Shortage_Det.RESET;
                      Shortage_Det.SETRANGE(Shortage_Det."Item No","<Excepted Rcpt.Date Tracking1>"."Item No.");
                      IF Shortage_Det.FIND('-') THEN
                        //CurrReport.SHOWOUTPUT:=TRUE
                        ExceptRcptDate1ShowOuptputGroupFooter4 := TRUE
                      ELSE
                        //CurrReport.SHOWOUTPUT:=FALSE;
                        ExceptRcptDate1ShowOuptputGroupFooter4 := FALSE;
                    END ELSE
                      //CurrReport.SHOWOUTPUT:=FALSE;
                      ExceptRcptDate1ShowOuptputGroupFooter4 := FALSE;
                  END ELSE
                    //CurrReport.SHOWOUTPUT:=FALSE;
                    ExceptRcptDate1ShowOuptputGroupFooter4 := FALSE;
                  "Excepted Receipt Date_Tracking".RESET;
                  "Excepted Receipt Date_Tracking".SETRANGE("Excepted Receipt Date_Tracking"."Document No.","<Excepted Rcpt.Date Tracking1>"."Document No.");
                  "Excepted Receipt Date_Tracking".SETRANGE("Excepted Receipt Date_Tracking"."Document Line No.","<Excepted Rcpt.Date Tracking1>"."Document Line No.");
                END;
                //<Excepted Rcpt.Date Tracking1>, GroupFooter(4) - OnPreSection() <<
            end;

            trigger OnPreDataItem();
            begin

                //Rev01 Start
                CLEAR(NextDocLineNoGVar);
                //Rev01 End

                IF Report_Choice<>Report_Choice::Prod_Dev THEN
                  CurrReport.BREAK;

                "<Excepted Rcpt.Date Tracking1>".SETRANGE("<Excepted Rcpt.Date Tracking1>"."Excepted Receipt Old Date",MINDATE,MAXDATE);
            end;
        }
    }

    requestpage
    {
        Caption = 'Please Enter The Period In Capital Letters (Ex: 1W(Week),2M(Month),1Y(Year))';

        layout
        {
            area(content)
            {
                group(Options)
                {
                    grid(Control1102152008)
                    {
                        GridLayout = Rows;
                        ShowCaption = false;
                        group(Control1102152002)
                        {
                            ShowCaption = false;
                            field("Report Choice1";'')
                            {
                                Caption = 'Report Choice';
                                ShowCaption = false;
                            }
                            field("Report Choice";Report_Choice)
                            {
                                Caption = 'Report Choice';
                                ShowCaption = false;
                            }
                        }
                        group(Control1102152014)
                        {
                            ShowCaption = false;
                            field(Choice1;'')
                            {
                                Caption = 'Choice';
                                ShowCaption = false;
                            }
                            field(Choice;Choice2)
                            {
                                Caption = 'Choice';
                                ShowCaption = false;
                            }
                        }
                        group(Control1102152018)
                        {
                            ShowCaption = false;
                            field("No. Of Slots1";'')
                            {
                                Caption = 'No. Of Slots';
                                ShowCaption = false;
                            }
                            field("No. Of Slots";No_of_Slots)
                            {
                                Caption = 'No. Of Slots';
                                ShowCaption = false;
                            }
                        }
                        group(Control1102152017)
                        {
                            ShowCaption = false;
                            field(Stores1;'')
                            {
                                Caption = 'Stores';
                                ShowCaption = false;
                            }
                            field(Stores;Str_CHoice)
                            {
                                Caption = 'Stores';
                                ShowCaption = false;
                            }
                        }
                        group(Control1102152019)
                        {
                            ShowCaption = false;
                            field(Excel1;'')
                            {
                                Caption = 'Excel';
                                ShowCaption = false;
                            }
                            field(Excel;Excel)
                            {
                                ShowCaption = false;
                            }
                        }
                        group(Control1102152020)
                        {
                            ShowCaption = false;
                            field("Period Length1";'')
                            {
                                Caption = 'Period Length';
                                ShowCaption = false;
                            }
                            field("Period Length";Period_Length)
                            {
                                ShowCaption = false;
                            }
                            field("Please Enter The Period In Capital Letters (Ex: 1W(Week),2M(Month),1Y(Year)) By Default 1 year";'')
                            {
                                Caption = 'Please Enter The Period In Capital Letters (Ex: 1W(Week),2M(Month),1Y(Year)) By Default 1 year';
                                ShowCaption = false;
                            }
                        }
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

    trigger OnInitReport();
    begin
        No_of_Slots:=1;
    end;

    trigger OnPostReport();
    begin
        IF Excel THEN
        BEGIN
          //B2BTempExcelBuffer.CreateBook;
          //B2BTempExcelBuffer.CreateSheet('test excel','',COMPANYNAME,'');
          /*
          TempExcelBuffer.CreateBook('testexcel',''); //EFFUPG
          TempExcelBuffer.WriteSheet('testexcel',COMPANYNAME,USERID);
          TempExcelBuffer.CloseBook;
          TempExcelBuffer.OpenExcel;
          TempExcelBuffer.GiveUserControl;
          */
          TempExcelBuffer.CreateBookAndOpenExcel('','testexcel','testexcel',COMPANYNAME,USERID); //EFFUPG
        END;

    end;

    trigger OnPreReport();
    begin

        IF Excel THEN
        BEGIN
          TempExcelBuffer.DELETEALL;
          CLEAR(TempExcelBuffer);
        END;
    end;

    var
        Choice : Option Detail,Brief,Past,Future;
        Difference : Integer;
        Value : array [10] of Decimal;
        Temp : Date;
        Vendor : Record Vendor;
        "Vendor Name" : Text[50];
        Choice2 : Option Past,Future;
        DF : Text[30];
        Period : array [12,2] of Date;
        Start_Date : Date;
        I : Integer;
        Max_Date : Date;
        Min_Date : Date;
        Period_Length : Text[30];
        MAXDATE : Date;
        MINDATE : Date;
        "Filter" : Text[100];
        No_of_Slots : Integer;
        Filt : Boolean;
        co : Code[10];
        Total : Decimal;
        TempExcelBuffer : Record "Excel Buffer" temporary;
        row : Integer;
        Excel : Boolean;
        "Prod. Orders" : Text;
        "Sale Orders" : Text;
        "Indent Line1" : Record "Indent Line";
        "Indent line 2" : Record "Indent Line";
        ICN : Code[100];
        Prod_Start_Date : Date;
        Po : Record "Production Order";
        "Pending Days" : Integer;
        "Deviated Date" : Text[30];
        Report_Heading : Text[100];
        Report_Choice : Option OutStanding,Devaitions,Prod_Dev;
        "Purchase Header" : Integer;
        UOM : Code[10];
        Desc : Text[100];
        Qty : Decimal;
        Pending_Qty : Decimal;
        "Expepected Date at Order Time" : Date;
        "Expected Date in Present Week" : Date;
        "Total No. Of Deviations" : Integer;
        "No. of Deviations In this Week" : Integer;
        "Excepted Receipt Date_Tracking" : Record "Excepted Rcpt.Date Tracking";
        Unit_Cost : Decimal;
        Str_CHoice : Option " ",STR,"R&D STR","CS STR";
        Purch_Line : Record "Purchase Line" temporary;
        "Print Heading" : Boolean;
        Shifted_To : Date;
        Order_Date : Date;
        Lead_Time : Text[30];
        Item : Record Item;
        "Prod. Order Component" : Record "Prod. Order Component";
        Shortage_Det : Record "Item Lot Numbers";
        Remarks : Text[100];
        s : Text[30];
        "order" : Code[20];
        itemno : Code[20];
        Purchase_LineCaptionLbl : Label 'Purchase Line';
        CurrReport_PAGENOCaptionLbl : Label 'Page';
        OutStanding_Receivable_MaterialCaptionLbl : Label 'OutStanding/Receivable Material';
        FROM___CaptionLbl : Label 'FROM  :';
        TO__CaptionLbl : Label 'TO :';
        Order_No_CaptionLbl : Label 'Order No.';
        Item_No_CaptionLbl : Label 'Item No.';
        QTYCaptionLbl : Label 'QTY';
        Outstanding_QTYCaptionLbl : Label 'Outstanding QTY';
        Expected_Reciept_DateCaptionLbl : Label 'Expected Reciept Date';
        Item_DescriptionCaptionLbl : Label 'Item Description';
        Order_ValueCaptionLbl : Label 'Order Value';
        Unit_CostCaptionLbl : Label '" Unit Cost"';
        VendorCaptionLbl : Label 'Vendor';
        UOMCaptionLbl : Label 'UOM';
        Deviated_DateCaptionLbl : Label 'Deviated Date';
        Production_OrdersCaptionLbl : Label 'Production.Orders';
        Production_Start_DateCaptionLbl : Label 'Production Start Date';
        Pending_DaysCaptionLbl : Label 'Pending Days';
        No__Of_DevaitionsCaptionLbl : Label 'No. Of Devaitions';
        Deviations_ReportCaptionLbl : Label 'Deviations Report';
        CurrReport_PAGENO_Control1102154011CaptionLbl : Label 'Page';
        VendorCaption_Control1102154015Lbl : Label 'Vendor';
        Order_No_Caption_Control1102154016Lbl : Label 'Order No.';
        Item_No_Caption_Control1102154017Lbl : Label 'Item No.';
        Item_DescriptionCaption_Control1102154018Lbl : Label 'Item Description';
        UOMCaption_Control1102154019Lbl : Label 'UOM';
        QTYCaption_Control1102154020Lbl : Label 'QTY';
        Outstanding_QTYCaption_Control1102154021Lbl : Label 'Outstanding QTY';
        Unit_CostCaption_Control1102154023Lbl : Label '" Unit Cost"';
        Order_ValueCaption_Control1102154024Lbl : Label 'Order Value';
        Deviated_DateCaption_Control1102154025Lbl : Label 'Deviated Date';
        Pending_DaysCaption_Control1102154026Lbl : Label 'Pending Days';
        ReasonCaptionLbl : Label 'Reason';
        Expected_DateCaptionLbl : Label 'Expected Date';
        Total_No__of_DeviationsCaptionLbl : Label 'Total No. of Deviations';
        DaysCaptionLbl : Label 'Days';
        Deviations_ReportCaption_Control1102154022Lbl : Label 'Deviations Report';
        CurrReport_PAGENO_Control1102154033CaptionLbl : Label 'Page';
        Order_No_Caption_Control1102154091Lbl : Label 'Order No.';
        Item_No_Caption_Control1102154092Lbl : Label 'Item No.';
        Item_DescriptionCaption_Control1102154093Lbl : Label 'Item Description';
        UOMCaption_Control1102154094Lbl : Label 'UOM';
        Order_QuantityCaptionLbl : Label 'Order Quantity';
        Pending_QtyCaptionLbl : Label 'Pending Qty';
        Deviated_DateCaption_Control1102154099Lbl : Label 'Deviated Date';
        Pending_DaysCaption_Control1102154100Lbl : Label 'Pending Days';
        ReasonCaption_Control1102154101Lbl : Label 'Reason';
        Expected_Date_CaptionLbl : Label '"Expected Date "';
        Total_No__of_DeviationsCaption_Control1102154104Lbl : Label 'Total No. of Deviations';
        Shifted_ToCaptionLbl : Label 'Shifted To';
        Order_DateCaptionLbl : Label 'Order Date';
        Lead_TimeCaptionLbl : Label 'Lead Time';
        DaysCaption_Control1102154119Lbl : Label 'Days';
        Deviations_ReportCaption_Control1102154037Lbl : Label 'Deviations Report';
        CurrReport_PAGENO_Control1102154045CaptionLbl : Label 'Page';
        Order_No_Caption_Control1102154059Lbl : Label 'Order No.';
        Item_No_Caption_Control1102154062Lbl : Label 'Item No.';
        Item_DescriptionCaption_Control1102154063Lbl : Label 'Item Description';
        UOMCaption_Control1102154064Lbl : Label 'UOM';
        Order_QuantityCaption_Control1102154065Lbl : Label 'Order Quantity';
        Pending_QTYCaption_Control1102154066Lbl : Label 'Pending QTY';
        Deviated_DateCaption_Control1102154069Lbl : Label 'Deviated Date';
        Pending_DaysCaption_Control1102154070Lbl : Label 'Pending Days';
        ReasonCaption_Control1102154071Lbl : Label 'Reason';
        Expected_DateCaption_Control1102154073Lbl : Label 'Expected Date';
        Total_No__of_DeviationsCaption_Control1102154074Lbl : Label 'Total No. of Deviations';
        Shifted_ToCaption_Control1102154121Lbl : Label 'Shifted To';
        Order_DateCaption_Control1102154067Lbl : Label 'Order Date';
        Lead_TimeCaption_Control1102154084Lbl : Label 'Lead Time';
        DaysCaption_Control1102154087Lbl : Label 'Days';
        "-Rev01-" : Integer;
        ExceptRcptDateShowOuptputGroupFooter5 : Boolean;
        PurchLine2ShowOutputBody3 : Boolean;
        PrevDocLineNoGVar : Integer;
        ExceptRcptDateTrackGRec : Record "Excepted Rcpt.Date Tracking";
        NextDocLineNoGVar : Integer;
        ExceptRcptDate1ShowOuptputGroupFooter4 : Boolean;

    [LineStart(93)]
    procedure EnterCell(RowNo : Integer;ColumnNo : Integer;CellValue : Text[250];Bold : Boolean;CellType : Option);
    begin
        TempExcelBuffer.INIT;
        TempExcelBuffer.VALIDATE("Row No.",RowNo);
        TempExcelBuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelBuffer."Cell Value as Text" := CellValue;
        TempExcelBuffer."Cell Type" := CellType; //Rev01
        TempExcelBuffer.Bold:=Bold ;
        TempExcelBuffer.INSERT;
    end;

    [LineStart(102)]
    procedure EnterHeadings(RowNo : Integer;ColumnNo : Integer;CellValue : Text[250];Bold : Boolean;CellType : Option);
    begin
        TempExcelBuffer.INIT;
        TempExcelBuffer.VALIDATE("Row No.",RowNo);
        TempExcelBuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelBuffer."Cell Value as Text" := FORMAT(CellValue);
        TempExcelBuffer."Cell Type" := CellType; //Rev01
        TempExcelBuffer.Bold:=Bold ;
        TempExcelBuffer.Formula := '';
        TempExcelBuffer.INSERT;
    end;
}

