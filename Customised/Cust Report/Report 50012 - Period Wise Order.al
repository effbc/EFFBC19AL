report 50012 "Period Wise Order"
{
    // version Eff02,Rev01,EFFUPG

    DefaultLayout = RDLC;
    RDLCLayout = './Period Wise Order.rdlc';

    dataset
    {
        dataitem("Company Information"; "Company Information")
        {
            DataItemTableView = SORTING(Primary Key);
        }
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = SORTING(Document Type, No.) ORDER(Ascending) WHERE(Document Type=CONST(Order),Status=CONST(Released));
            RequestFilterFields = "Order Date", "Location Code";
            ReqFilterHeading = 'Orders';
            column(Purchase_Header_ChoiceOrder; ChoiceOrder)
            {
            }
            column(Purchase_Header_Choice3Detail; Choice3Detail)
            {
            }
            column(Purchase_Header_Choice3Breif; Choice3Breif)
            {
            }
            column(Order_Filter_; "Order Filter")
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(Toal_Purchases_; "Toal Purchases")
            {
            }
            column(Orders_1_; Orders[1])
            {
            }
            column(Order_Value_1_; Order_Value[1])
            {
            }
            column(Orders_2_; Orders[2])
            {
            }
            column(Order_Value_2_; Order_Value[2])
            {
            }
            column(Orders_3_; Orders[3])
            {
            }
            column(Order_Value_3_; Order_Value[3])
            {
            }
            column(Orders_4_; Orders[4])
            {
            }
            column(Order_Value_4_; Order_Value[4])
            {
            }
            column(Orders_5_; Orders[5])
            {
            }
            column(Order_Value_5_; Order_Value[5])
            {
            }
            column(Orders_6_; Orders[6])
            {
            }
            column(Order_Value_6_; Order_Value[6])
            {
            }
            column(Orders_7_; Orders[7])
            {
            }
            column(Order_Value_7_; Order_Value[7])
            {
            }
            column(Order_Value_8_; Order_Value[8])
            {
            }
            column(Orders_8_; Orders[8])
            {
            }
            column(RECEIVED_vALUE_; "RECEIVED vALUE")
            {
            }
            column(PENDING_VALUE_; "PENDING VALUE")
            {
            }
            column(Order_Value_1__Control1000000114; Order_Value[1])
            {
            }
            column(Period_Wise_OrdersCaption; Period_Wise_OrdersCaptionLbl)
            {
            }
            column(Order_ValueCaption; Order_ValueCaptionLbl)
            {
            }
            column(Order_NoCaption; Order_NoCaptionLbl)
            {
            }
            column(Vendor_No_Caption; Vendor_No_CaptionLbl)
            {
            }
            column(Vendor_NameCaption; Vendor_NameCaptionLbl)
            {
            }
            column(Inward_ValueCaption; Inward_ValueCaptionLbl)
            {
            }
            column(Expected_Reciept_DateCaption; Expected_Reciept_DateCaptionLbl)
            {
            }
            column(Total__OrdersCaption; Total__OrdersCaptionLbl)
            {
            }
            column(Completly_InwardedCaption; Completly_InwardedCaptionLbl)
            {
            }
            column(Partially_Inwarded_Caption; Partially_Inwarded_CaptionLbl)
            {
            }
            column(V1__7_DaysCaption; V1__7_DaysCaptionLbl)
            {
            }
            column(V8__15_DaysCaption; V8__15_DaysCaptionLbl)
            {
            }
            column(V16__25_DaysCaption; V16__25_DaysCaptionLbl)
            {
            }
            column(V25__DaysCaption; V25__DaysCaptionLbl)
            {
            }
            column(PendingCaption; PendingCaptionLbl)
            {
            }
            column(ReceivedCaption; ReceivedCaptionLbl)
            {
            }
            column(PendingCaption_Control1000000111; PendingCaption_Control1000000111Lbl)
            {
            }
            column(TOTAL_Caption; TOTAL_CaptionLbl)
            {
            }
            column(OrdersCaption; OrdersCaptionLbl)
            {
            }
            column(ValueCaption; ValueCaptionLbl)
            {
            }
            column(Received_ValueCaption; Received_ValueCaptionLbl)
            {
            }
            column(Pending_ValueCaption; Pending_ValueCaptionLbl)
            {
            }
            column(Total_Ordered_ValueCaption; Total_Ordered_ValueCaptionLbl)
            {
            }
            column(Purchase_Header_Document_Type; "Document Type")
            {
            }
            column(Purchase_Header_No_; "No.")
            {
            }
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = SORTING(Document Type, Document No., Line No.) WHERE(Document Type=CONST(Order),Quantity=FILTER(>0));
                column(Purch_Line_ChoiceOrder;ChoiceOrder)
                {
                }
                column(Purch_Line_Choice3Detail;Choice3Detail)
                {
                }
                column(Purchase_Line__Document_No__;"Document No.")
                {
                }
                column(Line_Purchase_;"Line Purchase")
                {
                }
                column(Purchase_Header___Buy_from_Vendor_No__;"Purchase Header"."Buy-from Vendor No.")
                {
                }
                column(Name;Name)
                {
                }
                column(Order_Inward;Order_Inward)
                {
                }
                column(Expected_Date;Expected_Date)
                {
                }
                column(Purchase_Line_Document_Type;"Document Type")
                {
                }
                column(Purchase_Line_Line_No_;"Line No.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    ExciseAmount:=0;
                    Charges:=0;
                    Othertaxes:=0;
                    SalesTax:=0;
                    ServiceTax:=0;
                    VATAmount:=0;

                    //Rev01 Start

                    //Purchase Line, Body (1) - OnPreSection()
                    IUC:=0;
                    LineTotAmt:=0;
                    IF "Purchase Line"."Currency Code"='' THEN BEGIN
                      LineTotAmt:="Purchase Line"."Direct Unit Cost"*"Purchase Line".Quantity;
                      StrOrdLineDetails.SETRANGE(StrOrdLineDetails.Type,StrOrdLineDetails.Type::Purchase);
                      StrOrdLineDetails.SETRANGE(StrOrdLineDetails."Document Type","Purchase Line"."Document Type");
                      StrOrdLineDetails.SETRANGE(StrOrdLineDetails."Document No.","Purchase Line"."Document No.");
                      StrOrdLineDetails.SETRANGE(StrOrdLineDetails."Item No.","Purchase Line"."No.");
                      StrOrdLineDetails.SETRANGE("Line No.","Purchase Line"."Line No.");
                      IF StrOrdLineDetails.FIND('-') THEN
                      REPEAT
                        IF StrOrdLineDetails."Tax/Charge Type" = StrOrdLineDetails."Tax/Charge Type"::Excise THEN
                          ExciseAmount := ExciseAmount + StrOrdLineDetails.Amount;
                        IF StrOrdLineDetails."Tax/Charge Type" = StrOrdLineDetails."Tax/Charge Type"::Charges THEN
                          Charges := Charges + StrOrdLineDetails.Amount;
                        IF StrOrdLineDetails."Tax/Charge Type" = StrOrdLineDetails."Tax/Charge Type"::"Other Taxes" THEN
                          Othertaxes := Othertaxes + StrOrdLineDetails.Amount;
                        IF StrOrdLineDetails."Tax/Charge Type" = StrOrdLineDetails."Tax/Charge Type"::"Sales Tax" THEN
                          SalesTax := SalesTax + StrOrdLineDetails.Amount;
                        IF StrOrdLineDetails."Tax/Charge Type" = StrOrdLineDetails."Tax/Charge Type"::GST THEN
                          ServiceTax := ServiceTax + StrOrdLineDetails.Amount;
                        IF StrOrdLineDetails."Tax/Charge Type" = StrOrdLineDetails."Tax/Charge Type"::"Service Tax" THEN
                          VATAmount := VATAmount + StrOrdLineDetails.Amount;
                        LineTotAmt := LineTotAmt + StrOrdLineDetails.Amount;
                      UNTIL StrOrdLineDetails.NEXT = 0;
                        IF "Purchase Line".Quantity >0 THEN  //swathi
                      IUC:=LineTotAmt/"Purchase Line".Quantity;
                    END ELSE BEGIN
                      Structure_Amount:=0;
                      StrOrdLineDetails.SETRANGE(StrOrdLineDetails.Type,StrOrdLineDetails.Type::Purchase);
                      StrOrdLineDetails.SETRANGE(StrOrdLineDetails."Document Type",StrOrdLineDetails."Document Type"::Order);
                      StrOrdLineDetails.SETRANGE(StrOrdLineDetails."Document No.","Purchase Line"."Document No.");
                      StrOrdLineDetails.SETRANGE(StrOrdLineDetails."Line No.","Purchase Line"."Line No.");
                      IF StrOrdLineDetails.FIND('-') THEN
                      REPEAT
                        IF StrOrdLineDetails."Tax/Charge Type"<>StrOrdLineDetails."Tax/Charge Type"::Dummy THEN
                           Structure_Amount+=StrOrdLineDetails."Amount (LCY)"
                        ELSE
                           Structure_Amount+=StrOrdLineDetails."Calculation Value";
                      UNTIL StrOrdLineDetails.NEXT=0;
                        IF "Purchase Line".Quantity >0 THEN    //swathi
                      IUC:="Purchase Line"."Unit Cost (LCY)"+(Structure_Amount/"Purchase Line".Quantity);
                    END;

                    Order_Inward+="Purchase Line"."Quantity Received"*IUC;

                    IF "Purchase Line"."Outstanding Quantity">0 THEN
                      Expected_Date:="Purchase Line"."Expected Receipt Date";
                    Orders[1]+=1;
                    Order_Value[1]+="Purchase Line".Quantity*IUC;

                    "Line Purchase"+="Purchase Line".Quantity*IUC;
                    "Toal Purchases"+="Purchase Line".Quantity*IUC;
                    //IF Choice3=Choice3::Brief THEN BEGIN //Rev01
                    IF Choice3Breif THEN BEGIN
                      IF  ("Purchase Line"."Outstanding Quantity">0) AND ("Purchase Line"."Quantity Received">0) THEN BEGIN
                        Orders[8]+=1;
                        Order_Value[8]+="Purchase Line"."Quantity Received"*IUC;
                      END;
                      IF "Purchase Line"."Outstanding Quantity">0 THEN BEGIN
                        Tmp_date:="Purchase Line"."Expected Receipt Date";
                        IF "Purchase Line"."Expected Receipt Date">TODAY THEN BEGIN
                          Delay:="Purchase Line"."Expected Receipt Date"-TODAY;
                          CASE Delay OF

                            1..7:    BEGIN
                                       Orders[3]+=1;
                                       Order_Value[3]+="Purchase Line"."Outstanding Quantity"*IUC;
                                     END;
                            8..15:   BEGIN
                                       Orders[4]+=1;
                                       Order_Value[4]+="Purchase Line"."Outstanding Quantity"*IUC;
                                     END;
                            16..25:  BEGIN
                                       Orders[5]+=1;
                                       Order_Value[5]+="Purchase Line"."Outstanding Quantity"*IUC;
                                     END;
                            25..100: BEGIN
                                       Orders[6]+=1;
                                       Order_Value[6]+="Purchase Line"."Outstanding Quantity"*IUC;
                                     END;
                          END;
                        END ELSE BEGIN
                          Orders[7]+=1;
                          Order_Value[7]+="Purchase Line"."Outstanding Quantity"*IUC;
                        END;
                      END ELSE IF "Purchase Line"."Outstanding Quantity"=0 THEN BEGIN
                        Orders[2]+=1;
                        Order_Value[2]+="Purchase Line"."Quantity Received"*IUC;
                      END;
                    END;

                    //Purchase Line, Body (1) - OnPreSection()

                    //Purchase Line, GroupFooter (2) - OnPreSection()
                    vendor.SETRANGE(vendor."No.","Purchase Header"."Buy-from Vendor No.");
                    IF Prev_VendorFoot<>"Purch. Rcpt. Header"."Pay-to Vendor No." THEN
                    BEGIN
                    IF vendor.FIND('-') THEN
                      Name:=vendor.Name;
                      Prev_VendorFoot:="Purch. Rcpt. Header"."Pay-to Vendor No."
                    END;
                      IF Excel THEN BEGIN   //added by swathi
                    ROW+=1;
                    Entercell(ROW,1,"Purchase Header"."Buy-from Vendor No.",FALSE,Tempexcelbuffer."Cell Type" :: Number);
                    Entercell(ROW,2,Name,FALSE,Tempexcelbuffer."Cell Type" :: Text);
                    Entercell(ROW,3,"Purchase Line"."Document No.",FALSE,Tempexcelbuffer."Cell Type" :: Number);
                    Entercell(ROW,4,FORMAT(ROUND("Line Purchase",0.01)),FALSE,Tempexcelbuffer."Cell Type" :: Number);
                    Entercell(ROW,5,FORMAT(ROUND(Order_Inward,0.01)),FALSE,Tempexcelbuffer."Cell Type" :: Number);
                    Entercell(ROW,6,FORMAT(Expected_Date),FALSE,Tempexcelbuffer."Cell Type" :: Date);
                    END;
                    "Total Procurement"+=Order_Inward;

                    //CurrReport.SHOWOUTPUT( (Choice=Choice::Order) AND (Choice3=Choice3::Detail)); //Rev01
                    //CurrReport.SHOWOUTPUT( (ChoiceOrder) AND (Choice3Detail));

                    //Purchase Line, GroupFooter (2) - OnPreSection()

                    //Rev01 End
                end;

                trigger OnPostDataItem();
                begin
                    /*vendor.SETRANGE(vendor."No.","Purchase Header"."Buy-from Vendor No.");
                    IF vendor.FIND('-') THEN
                      Name:=vendor.Name;
                      IF Excel THEN BEGIN   //added by swathi
                    ROW+=1;
                    Entercell(ROW,1,"Purchase Header"."Buy-from Vendor No.",FALSE,Tempexcelbuffer."Cell Type" :: Number);
                    Entercell(ROW,2,Name,FALSE,Tempexcelbuffer."Cell Type" :: Text);
                    Entercell(ROW,3,"Purchase Line"."Document No.",FALSE,Tempexcelbuffer."Cell Type" :: Number);
                    Entercell(ROW,4,FORMAT(ROUND("Line Purchase",0.01)),FALSE,Tempexcelbuffer."Cell Type" :: Number);
                    Entercell(ROW,5,FORMAT(ROUND(Order_Inward,0.01)),FALSE,Tempexcelbuffer."Cell Type" :: Number);
                    Entercell(ROW,6,FORMAT(Expected_Date),FALSE,Tempexcelbuffer."Cell Type" :: Date);
                    END;
                    "Total Procurement"+=Order_Inward;
                    */

                end;
            }

            trigger OnAfterGetRecord();
            begin
                "Line Purchase":=0;
                IF CalculateStructures THEN BEGIN
                   "Purchase Line".CalculateStructures("Purchase Header");
                   "Purchase Line".AdjustStructureAmounts("Purchase Header");
                   "Purchase Line".UpdatePurchLines("Purchase Header");
                 END;
                
                //Rev01 Start
                
                //Purchase Header, Header (2) - OnPreSection()
                //IF (Choice=Choice::Order) AND (Choice3=Choice3::Detail) THEN BEGIN
                IF (ChoiceOrder) AND (Choice3Detail) THEN BEGIN
                  IF Excel THEN BEGIN   //added by swathi
                    ROW+=1;
                    EnterHeadings(ROW,1,'Vendor No.',TRUE,Tempexcelbuffer."Cell Type" :: Text);
                    EnterHeadings(ROW,2,'Vendor Name',TRUE,Tempexcelbuffer."Cell Type" :: Text);
                    EnterHeadings(ROW,3,'Order No.',TRUE,Tempexcelbuffer."Cell Type" :: Text);
                    EnterHeadings(ROW,4,'Order Value',TRUE,Tempexcelbuffer."Cell Type" :: Text);
                    EnterHeadings(ROW,5,'Inward Value',TRUE,Tempexcelbuffer."Cell Type" :: Text);
                    EnterHeadings(ROW,6,'Expected Reciept Date',TRUE,Tempexcelbuffer."Cell Type" :: Text);
                   END;
                END;
                /*
                CurrReport.SHOWOUTPUT:=TRUE
                END ELSE
                 CurrReport.SHOWOUTPUT:=FALSE;
                */
                //Purchase Header, Header (2) - OnPreSection()
                
                //Purchase Header, Header (3) - OnPreSection()
                //CurrReport.SHOWOUTPUT((Choice=Choice::Order) AND(Choice3=Choice3::Brief)); //Rev01
                //CurrReport.SHOWOUTPUT((ChoiceOrder) AND (Choice3Breif));
                //Purchase Header, Header (3) - OnPreSection()
                
                //Purchase Header, Body (4) - OnPreSection()
                Order_Inward:=0;
                Expected_Date:=0D;
                //Purchase Header, Body (4) - OnPreSection()
                
                //Purchase Header, Footer (6) - OnPreSection()
                  //CurrReport.SHOWOUTPUT((Choice=Choice::Order) AND(Choice3=Choice3::Brief)); //Rev01
                /*  CurrReport.SHOWOUTPUT((ChoiceOrder) AND (Choice3Breif));
                FOR I:=2 TO 8 DO
                "Total_Order Value"+=Order_Value[I];
                "RECEIVED vALUE":=Order_Value[2]+Order_Value[8];
                "PENDING VALUE":=Order_Value[3]+Order_Value[4]+Order_Value[5]+Order_Value[6]+Order_Value[7];
                //Purchase Header, Footer (6) - OnPreSection()
                 */          //commented by swathi
                //Rev01 End

            end;

            trigger OnPostDataItem();
            begin
                //Rev01 Start
                
                //Purchase Header, Footer (5) - OnPreSection()
                //IF (Choice=Choice::Order) AND (Choice3=Choice3::Detail)  THEN BEGIN //Rev01
                //swathi
                IF ChoiceInward THEN
                 CurrReport.BREAK;
                
                
                IF (ChoiceOrder) AND (Choice3Detail) THEN BEGIN
                  //CurrReport.SHOWOUTPUT:=TRUE;
                  IF Excel THEN BEGIN   //added by swathi
                  ROW+=1;
                  Entercell(ROW,4,FORMAT(ROUND("Toal Purchases",0.01)),FALSE,Tempexcelbuffer."Cell Type" :: Number);
                  Entercell(ROW,5,FORMAT(ROUND("Total Procurement",0.01)),FALSE,Tempexcelbuffer."Cell Type" :: Number);
                  END;
                END;
                /* ELSE
                  CurrReport.SHOWOUTPUT:=FALSE;
                 */
                //Purchase Header, Footer (5) - OnPreSection()
                //Purchase Header, Footer (6) - OnPreSection()
                  //CurrReport.SHOWOUTPUT((Choice=Choice::Order) AND(Choice3=Choice3::Brief)); //Rev01
                  //CurrReport.SHOWOUTPUT((ChoiceOrder) AND (Choice3Breif));
                FOR I:=2 TO 8 DO
                "Total_Order Value"+=Order_Value[I];
                "RECEIVED vALUE":=Order_Value[2]+Order_Value[8];
                "PENDING VALUE":=Order_Value[3]+Order_Value[4]+Order_Value[5]+Order_Value[6]+Order_Value[7];
                //Purchase Header, Footer (6) - OnPreSection()//swathi on 27-sep-13
                //Rev01 End

            end;

            trigger OnPreDataItem();
            begin
                CLEAR(Tempexcelbuffer);
                Tempexcelbuffer.DELETEALL;
                //swathi
                IF ChoiceInward THEN
                 CurrReport.BREAK;


                "Purchase Header".SETFILTER("Purchase Header"."Shortcut Dimension 1 Code",'<>%1','R&D-001..R&D-999');
                //IF Choice<>Choice::Order THEN //Rev01
                IF NOT ChoiceOrder THEN
                  CurrReport.BREAK;
            end;
        }
        dataitem("Purch. Rcpt. Header";"Purch. Rcpt. Header")
        {
            DataItemTableView = SORTING(Pay-to Vendor No.,Posting Date,Order No.,Vendor Shipment No.) ORDER(Ascending);
            RequestFilterFields = "Posting Date","Pay-to Vendor No.","Location Code","Bill Transfered Date";
            ReqFilterHeading = 'Inwards';
            column(Purch_Rcpt_Head_ChoiceReceive;ChoiceReceive)
            {
            }
            column(Purch_Rcpt_Head_Choice2Detail;Choice2Detail)
            {
            }
            column(Purch_Rcpt_Head_ChoiceOrder;ChoiceOrder)
            {
            }
            column(Purch_Rcpt_Head_Choice2Breif;Choice2Breif)
            {
            }
            column(Purch_Rcpt_Head_Choice2Pending;Choice2Pending)
            {
            }
            column(Purch_Rcpt_Head_StorePending;"Store Pending")
            {
            }
            column(Purch_Rcpt_Head_PurchasePending;"Purchase Pending")
            {
            }
            column(Purch_Rcpt_Head_Choice2Week;Choice2Week)
            {
            }
            column(USERID;USERID)
            {
            }
            column(TODAY;TODAY)
            {
            }
            column(Bill_Fiter_;"Bill Fiter")
            {
            }
            column(COMPANYNAME_Control1000000025;COMPANYNAME)
            {
            }
            column(USERID_Control1102154002;USERID)
            {
            }
            column(TODAY_Control1102154003;TODAY)
            {
            }
            column(Bill_Fiter__Control1102154005;"Bill Fiter")
            {
            }
            column(COMPANYNAME_Control1102154007;COMPANYNAME)
            {
            }
            column(USERID_Control1102154008;USERID)
            {
            }
            column(TODAY_Control1102154009;TODAY)
            {
            }
            column(Bill_Fiter__Control1102154011;"Bill Fiter")
            {
            }
            column(COMPANYNAME_Control1102154013;COMPANYNAME)
            {
            }
            column(USERID_Control1102154129;USERID)
            {
            }
            column(TODAY_Control1102154130;TODAY)
            {
            }
            column(Bill_Fiter__Control1102154132;"Bill Fiter")
            {
            }
            column(COMPANYNAME_Control1102154134;COMPANYNAME)
            {
            }
            column(USERID_Control1102154135;USERID)
            {
            }
            column(TODAY_Control1102154136;TODAY)
            {
            }
            column(Bill_Fiter__Control1102154138;"Bill Fiter")
            {
            }
            column(COMPANYNAME_Control1102154140;COMPANYNAME)
            {
            }
            column(USERID_Control1102154042;USERID)
            {
            }
            column(TODAY_Control1102154043;TODAY)
            {
            }
            column(Bill_Fiter__Control1102154045;"Bill Fiter")
            {
            }
            column(COMPANYNAME_Control1102154047;COMPANYNAME)
            {
            }
            column(Purch__Rcpt__Header__Order_No__;"Order No.")
            {
            }
            column(Name_Control1000000050;Name)
            {
            }
            column(InwardDateTime;InwardDateTime)
            {
            }
            column(vendor_leadtime_Vendor_inwards__1__100;((vendor_leadtime/Vendor_inwards)-1)*100)
            {
            }
            column(Vendor_inwards;Vendor_inwards)
            {
            }
            column(TOT_PEND_INV;TOT_PEND_INV)
            {
            }
            column(No__Of_Bills_;"No. Of Bills")
            {
            }
            column(Tot;Tot)
            {
            }
            column(Total_Bills_;"Total Bills")
            {
            }
            column(Period_Wise_ProcurementsCaption;Period_Wise_ProcurementsCaptionLbl)
            {
            }
            column(Period_Wise_ProcurementsCaption_Control1102154004;Period_Wise_ProcurementsCaption_Control1102154004Lbl)
            {
            }
            column(Pending_InvoicesCaption;Pending_InvoicesCaptionLbl)
            {
            }
            column(Purchase_Pending_InvoicesCaption;Purchase_Pending_InvoicesCaptionLbl)
            {
            }
            column(Store_Pending_InvoicesCaption;Store_Pending_InvoicesCaptionLbl)
            {
            }
            column(Week_Wise_Bill_ForwardsCaption;Week_Wise_Bill_ForwardsCaptionLbl)
            {
            }
            column(AmountCaption;AmountCaptionLbl)
            {
            }
            column(Vendor_NameCaption_Control1000000038;Vendor_NameCaption_Control1000000038Lbl)
            {
            }
            column(Order_NoCaption_Control1000000039;Order_NoCaption_Control1000000039Lbl)
            {
            }
            column(Actual_Lead_TimeCaption;Actual_Lead_TimeCaptionLbl)
            {
            }
            column(Given_Lead_TimeCaption;Given_Lead_TimeCaptionLbl)
            {
            }
            column(Unit_CostCaption;Unit_CostCaptionLbl)
            {
            }
            column(UOMCaption;UOMCaptionLbl)
            {
            }
            column(QTYCaption;QTYCaptionLbl)
            {
            }
            column(DescriptionCaption;DescriptionCaptionLbl)
            {
            }
            column(Item_No_Caption;Item_No_CaptionLbl)
            {
            }
            column(TotalCaption;TotalCaptionLbl)
            {
            }
            column(Invoice_CostCaption;Invoice_CostCaptionLbl)
            {
            }
            column(Given_Lead_TimeCaption_Control1102154029;Given_Lead_TimeCaption_Control1102154029Lbl)
            {
            }
            column(Actual_Lead_TimeCaption_Control1102154030;Actual_Lead_TimeCaption_Control1102154030Lbl)
            {
            }
            column(Unit_CostCaption_Control1000000067;Unit_CostCaption_Control1000000067Lbl)
            {
            }
            column(UOMCaption_Control1000000068;UOMCaption_Control1000000068Lbl)
            {
            }
            column(QuantityCaption;QuantityCaptionLbl)
            {
            }
            column(DescriptionCaption_Control1000000070;DescriptionCaption_Control1000000070Lbl)
            {
            }
            column(Item_No_Caption_Control1000000072;Item_No_Caption_Control1000000072Lbl)
            {
            }
            column(Order_NoCaption_Control1000000075;Order_NoCaption_Control1000000075Lbl)
            {
            }
            column(VendorCaption;VendorCaptionLbl)
            {
            }
            column(Shpmt_No_Caption;Shpmt_No_CaptionLbl)
            {
            }
            column(Total_ValueCaption;Total_ValueCaptionLbl)
            {
            }
            column(Inward_DateCaption;Inward_DateCaptionLbl)
            {
            }
            column(Store_DeviationCaption;Store_DeviationCaptionLbl)
            {
            }
            column(ReasonCaption;ReasonCaptionLbl)
            {
            }
            column(Bill_Transfered_DateCaption;Bill_Transfered_DateCaptionLbl)
            {
            }
            column(Purchase_DeviationCaption;Purchase_DeviationCaptionLbl)
            {
            }
            column(DepartmentCaption;DepartmentCaptionLbl)
            {
            }
            column(Unit_CostCaption_Control1102154142;Unit_CostCaption_Control1102154142Lbl)
            {
            }
            column(UOMCaption_Control1102154143;UOMCaption_Control1102154143Lbl)
            {
            }
            column(QuantityCaption_Control1102154144;QuantityCaption_Control1102154144Lbl)
            {
            }
            column(DescriptionCaption_Control1102154145;DescriptionCaption_Control1102154145Lbl)
            {
            }
            column(Item_No_Caption_Control1102154146;Item_No_Caption_Control1102154146Lbl)
            {
            }
            column(Order_NoCaption_Control1102154147;Order_NoCaption_Control1102154147Lbl)
            {
            }
            column(VendorCaption_Control1102154148;VendorCaption_Control1102154148Lbl)
            {
            }
            column(Shpmt_No_Caption_Control1102154149;Shpmt_No_Caption_Control1102154149Lbl)
            {
            }
            column(Total_ValueCaption_Control1102154150;Total_ValueCaption_Control1102154150Lbl)
            {
            }
            column(Inward_DateCaption_Control1102154152;Inward_DateCaption_Control1102154152Lbl)
            {
            }
            column(Store_DeviationCaption_Control1102154153;Store_DeviationCaption_Control1102154153Lbl)
            {
            }
            column(ReasonCaption_Control1102154155;ReasonCaption_Control1102154155Lbl)
            {
            }
            column(Bill_Transfered_DateCaption_Control1102154156;Bill_Transfered_DateCaption_Control1102154156Lbl)
            {
            }
            column(Purchase_DeviationCaption_Control1102154157;Purchase_DeviationCaption_Control1102154157Lbl)
            {
            }
            column(Unit_CostCaption_Control1102154124;Unit_CostCaption_Control1102154124Lbl)
            {
            }
            column(UOMCaption_Control1102154154;UOMCaption_Control1102154154Lbl)
            {
            }
            column(QuantityCaption_Control1102154168;QuantityCaption_Control1102154168Lbl)
            {
            }
            column(DescriptionCaption_Control1102154173;DescriptionCaption_Control1102154173Lbl)
            {
            }
            column(Item_No_Caption_Control1102154174;Item_No_Caption_Control1102154174Lbl)
            {
            }
            column(Order_NoCaption_Control1102154175;Order_NoCaption_Control1102154175Lbl)
            {
            }
            column(VendorCaption_Control1102154176;VendorCaption_Control1102154176Lbl)
            {
            }
            column(Shpmt_No_Caption_Control1102154177;Shpmt_No_Caption_Control1102154177Lbl)
            {
            }
            column(Total_ValueCaption_Control1102154178;Total_ValueCaption_Control1102154178Lbl)
            {
            }
            column(Inward_DateCaption_Control1102154179;Inward_DateCaption_Control1102154179Lbl)
            {
            }
            column(Store_DeviationCaption_Control1102154180;Store_DeviationCaption_Control1102154180Lbl)
            {
            }
            column(ReasonCaption_Control1102154181;ReasonCaption_Control1102154181Lbl)
            {
            }
            column(No__Of_BillsCaption;No__Of_BillsCaptionLbl)
            {
            }
            column(PeriodCaption;PeriodCaptionLbl)
            {
            }
            column(ValueCaption_Control1102154053;ValueCaption_Control1102154053Lbl)
            {
            }
            column(Purch__Rcpt__Header__Order_No__Caption;FIELDCAPTION("Order No."))
            {
            }
            column(VendorCaption_Control1000000049;VendorCaption_Control1000000049Lbl)
            {
            }
            column(Inward_Date_Time__Caption;Inward_Date_Time__CaptionLbl)
            {
            }
            column(No__Of_InwardsCaption;No__Of_InwardsCaptionLbl)
            {
            }
            column(DeviationCaption;DeviationCaptionLbl)
            {
            }
            column(EmptyStringCaption;EmptyStringCaptionLbl)
            {
            }
            column(Total_Pending_Invoice_ValueCaption;Total_Pending_Invoice_ValueCaptionLbl)
            {
            }
            column(No__Of__Pending_BillsCaption;No__Of__Pending_BillsCaptionLbl)
            {
            }
            column(Purch__Rcpt__Header_No_;"No.")
            {
            }
            column(Purch__Rcpt__Header_Pay_to_Vendor_No_;"Pay-to Vendor No.")
            {
            }
            dataitem("Purch. Rcpt. Line";"Purch. Rcpt. Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = SORTING(Document No.,Line No.) ORDER(Ascending) WHERE(Quantity=FILTER(>0),No.=FILTER(<>''),Correction=FILTER(No));
                column(Purch_Rcpt_Line_Choice2Week;Choice2Week)
                {
                }
                column(PurchRcptLineBody1;PurchRcptLineBody1)
                {
                }
                column(Purch_Rcpt_Line_ChoiceReceive;ChoiceReceive)
                {
                }
                column(Purch_Rcpt_Line_Choice2Pending;Choice2Pending)
                {
                }
                column(Purch_Rcpt_Line_PurchasePending;"Purchase Pending")
                {
                }
                column(Purch_Rcpt_Line_StorePending;"Store Pending")
                {
                }
                column(Purch_Rcpt_Line_ChoiceOrder;ChoiceOrder)
                {
                }
                column(Purch_Rcpt_Line_Choice2Breif;Choice2Breif)
                {
                }
                column(Purch_Rcpt_Line_Choice2Detail;Choice2Detail)
                {
                }
                column(Purch__Rcpt__Line__No__;"No.")
                {
                }
                column(Purch__Rcpt__Line_Description;Description)
                {
                }
                column(Purch__Rcpt__Line_Quantity;Quantity)
                {
                }
                column(Purch__Rcpt__Line__Unit_of_Measure_Code_;"Unit of Measure Code")
                {
                }
                column(UC;UC)
                {
                }
                column(Line_TOT;Line_TOT)
                {
                }
                column(IUC;IUC)
                {
                }
                column(Given_Lead_Time_;"Given Lead Time")
                {
                }
                column(Lead_Time_;"Lead Time")
                {
                }
                column(UC_Control1000000059;UC)
                {
                }
                column(Purch__Rcpt__Line__Unit_of_Measure_Code__Control1000000060;"Unit of Measure Code")
                {
                }
                column(Purch__Rcpt__Line_Description_Control1000000062;Description)
                {
                }
                column(Purch__Rcpt__Line__No___Control1000000063;"No.")
                {
                }
                column(Purch__Rcpt__Line__Order_No__;"Order No.")
                {
                }
                column(Name_Control1000000073;Name)
                {
                }
                column(Purch__Rcpt__Header___Vendor_Shipment_No__;"Purch. Rcpt. Header"."Vendor Shipment No.")
                {
                }
                column(Purch__Rcpt__Line_Quantity_Control1000000061;Quantity)
                {
                }
                column(Tot_Control1000000058;Tot)
                {
                }
                column(Purch__Rcpt__Line__Purch__Rcpt__Line___Document_date_;"Purch. Rcpt. Line"."Document date")
                {
                }
                column(Deviation;Deviation)
                {
                }
                column(Purch__Rcpt__Header___Bill_Transfered_Date_;"Purch. Rcpt. Header"."Bill Transfered Date")
                {
                }
                column(Purchase_Deviation_;"Purchase Deviation")
                {
                }
                column(Purch__Rcpt__Line__Store_Remarks_;"Store Remarks")
                {
                }
                column(Department;Department)
                {
                }
                column(UC_Control1102154071;UC)
                {
                }
                column(Purch__Rcpt__Line__Unit_of_Measure_Code__Control1102154072;"Unit of Measure Code")
                {
                }
                column(Purch__Rcpt__Line_Description_Control1102154073;Description)
                {
                }
                column(Purch__Rcpt__Line__No___Control1102154074;"No.")
                {
                }
                column(Purch__Rcpt__Line__Order_No___Control1102154080;"Order No.")
                {
                }
                column(Name_Control1102154081;Name)
                {
                }
                column(Purch__Rcpt__Header___Vendor_Shipment_No___Control1102154083;"Purch. Rcpt. Header"."Vendor Shipment No.")
                {
                }
                column(Purch__Rcpt__Line_Quantity_Control1102154084;Quantity)
                {
                }
                column(Tot_Control1102154085;Tot)
                {
                }
                column(Purch__Rcpt__Line__Purch__Rcpt__Line___Document_date__Control1102154087;"Purch. Rcpt. Line"."Document date")
                {
                }
                column(Deviation_Control1102154099;Deviation)
                {
                }
                column(Purch__Rcpt__Header___Bill_Transfered_Date__Control1102154125;"Purch. Rcpt. Header"."Bill Transfered Date")
                {
                }
                column(Purchase_Deviation__Control1102154126;"Purchase Deviation")
                {
                }
                column(Purch__Rcpt__Line__Store_Remarks__Control1102154128;"Store Remarks")
                {
                }
                column(UC_Control1102154086;UC)
                {
                }
                column(Purch__Rcpt__Line__Unit_of_Measure_Code__Control1102154151;"Unit of Measure Code")
                {
                }
                column(Purch__Rcpt__Line_Description_Control1102154158;Description)
                {
                }
                column(Purch__Rcpt__Line__No___Control1102154159;"No.")
                {
                }
                column(Purch__Rcpt__Line__Order_No___Control1102154160;"Order No.")
                {
                }
                column(Name_Control1102154161;Name)
                {
                }
                column(Purch__Rcpt__Header___Vendor_Shipment_No___Control1102154162;"Purch. Rcpt. Header"."Vendor Shipment No.")
                {
                }
                column(Purch__Rcpt__Line_Quantity_Control1102154163;Quantity)
                {
                }
                column(Tot_Control1102154164;Tot)
                {
                }
                column(Purch__Rcpt__Line__Purch__Rcpt__Line___Document_date__Control1102154165;"Purch. Rcpt. Line"."Document date")
                {
                }
                column(Deviation_Control1102154166;Deviation)
                {
                }
                column(Purch__Rcpt__Line__Store_Remarks__Control1102154172;"Store Remarks")
                {
                }
                column(Name_Control1000000020;Name)
                {
                }
                column(Purch__Rcpt__Line__Order_No___Control1000000021;"Order No.")
                {
                }
                column(Lead_Time__Control1000000023;"Lead Time")
                {
                }
                column(Line_Procurement_;"Line Procurement")
                {
                }
                column(Given_Lead_Time__Control1000000118;"Given Lead Time")
                {
                }
                column(Order_TOT;Order_TOT)
                {
                }
                column(DaysCaption;DaysCaptionLbl)
                {
                }
                column(DaysCaption_Control1102154061;DaysCaption_Control1102154061Lbl)
                {
                }
                column(DaysCaption_Control1102154123;DaysCaption_Control1102154123Lbl)
                {
                }
                column(DaysCaption_Control1102154127;DaysCaption_Control1102154127Lbl)
                {
                }
                column(DaysCaption_Control1102154167;DaysCaption_Control1102154167Lbl)
                {
                }
                column(TotalCaption_Control1000000012;TotalCaption_Control1000000012Lbl)
                {
                }
                column(Purch__Rcpt__Line_Document_No_;"Document No.")
                {
                }
                column(Purch__Rcpt__Line_Line_No_;"Line No.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    IUC:=0;
                    //Tot:=0;
                    
                    //Rev01 Start
                    
                    //Purch. Rcpt. Line, Body (1) - OnPreSection()
                    //IF (Choice =Choice::Receive)    THEN BEGIN //Rev01
                    IF (ChoiceReceive) THEN BEGIN //Rev01
                      PurchRcptLineBody1 := TRUE;
                      Line_TOT:=0;
                    
                      "Purchase Line".SETRANGE("Purchase Line"."Document Type","Purchase Line"."Document Type"::Order);
                      "Purchase Line".SETRANGE("Purchase Line"."Document No.","Purch. Rcpt. Header"."Order No.");
                      "Purchase Line".SETRANGE("Purchase Line"."Line No.","Purch. Rcpt. Line"."Order Line No.");
                      IF "Purchase Line".FIND('-') THEN BEGIN
                        IF "Purchase Line"."Currency Code"='' THEN BEGIN
                          IF "Purchase Line"."Amount To Vendor">0 THEN
                            UC:=("Purchase Line"."Amount To Vendor"/"Purchase Line".Quantity)   //may
                          ELSE
                            UC:="Purchase Line"."Direct Unit Cost";
                        END ELSE BEGIN
                          Structure_Amount:=0;
                          StrOrdLineDetails.SETRANGE(StrOrdLineDetails.Type,StrOrdLineDetails.Type::Purchase);
                          StrOrdLineDetails.SETRANGE(StrOrdLineDetails."Document Type",StrOrdLineDetails."Document Type"::Order);
                          StrOrdLineDetails.SETRANGE(StrOrdLineDetails."Document No.","Purchase Line"."Document No.");
                          StrOrdLineDetails.SETRANGE(StrOrdLineDetails."Line No.","Purchase Line"."Line No.");
                          IF StrOrdLineDetails.FIND('-') THEN
                          REPEAT
                            IF StrOrdLineDetails."Tax/Charge Type"<>StrOrdLineDetails."Tax/Charge Type"::Dummy THEN
                               Structure_Amount+=StrOrdLineDetails."Amount (LCY)"
                            ELSE
                               Structure_Amount+=StrOrdLineDetails."Calculation Value";
                          UNTIL StrOrdLineDetails.NEXT=0;
                          UC:="Purchase Line"."Unit Cost (LCY)"+(Structure_Amount/"Purchase Line".Quantity);  //may
                        END;
                      END;
                      "Line Procurement":="Line Procurement"+"Purch. Rcpt. Line".Quantity*"Purchase Line"."Direct Unit Cost";
                    
                      PIV.SETCURRENTKEY(PIV.Type,PIV."No.",PIV."Variant Code");
                      PIV.SETRANGE(PIV."No.","Purch. Rcpt. Line"."No.");
                      PIV.SETRANGE(PIV."Buy-from Vendor No.","Purch. Rcpt. Line"."Buy-from Vendor No.");
                      PIV.SETRANGE(PIV."Receipt No.","Purch. Rcpt. Line"."Document No.");
                      PIV.SETRANGE(PIV.Quantity,"Purch. Rcpt. Line".Quantity);
                      PIV.SETRANGE(PIV."Receipt No.","Purch. Rcpt. Line"."Document No.");
                      IF PIV.FIND('-') THEN BEGIN
                        PIH.RESET;
                        PIH.SETRANGE(PIH."No.",PIV."Document No.");
                        IF PIH.FIND('-') THEN BEGIN
                          IF PIH."Currency Code"='' THEN
                             IUC:=PIV."Amount To Vendor"/PIV.Quantity
                          ELSE BEGIN
                            Structure_Amount:=0;
                            "Posted Str Order Line Details".SETRANGE("Posted Str Order Line Details".Type,
                                                                     "Posted Str Order Line Details".Type::Purchase);
                            "Posted Str Order Line Details".SETRANGE("Posted Str Order Line Details"."Document Type",
                                                                     "Posted Str Order Line Details"."Document Type"::Invoice);
                            "Posted Str Order Line Details".SETRANGE("Posted Str Order Line Details"."Invoice No.",PIH."No.");
                            "Posted Str Order Line Details".SETRANGE("Posted Str Order Line Details"."Line No.",PIV."Line No.");
                            IF "Posted Str Order Line Details".FIND('-') THEN
                              REPEAT
                                IF "Posted Str Order Line Details"."Tax/Charge Type"<>"Posted Str Order Line Details"."Tax/Charge Type"::Dummy THEN
                                   Structure_Amount+="Posted Str Order Line Details"."Amount (LCY)"
                                ELSE
                                   Structure_Amount+="Posted Str Order Line Details"."Calculation Value";
                              UNTIL "Posted Str Order Line Details".NEXT=0;
                            IUC:=PIV."Unit Cost (LCY)"+(Structure_Amount/PIV.Quantity);
                          END;
                        END;
                      END;
                      ROW+=1;
                      IF IUC>0 THEN
                         Line_TOT:="Purch. Rcpt. Line".Quantity*IUC
                      ELSE
                         Line_TOT:="Purch. Rcpt. Line".Quantity*UC;
                      Order_TOT+=Line_TOT;
                      "Total Procurement"+=Line_TOT;
                      "Purchase Header".SETRANGE("Purchase Header"."No.","Purch. Rcpt. Header"."Order No.");
                      IF "Purchase Header".FIND('-') THEN
                         "Lead Time":="Purch. Rcpt. Header"."Posting Date"-"Purchase Header"."Order Date";
                    
                      IF ("Purch. Rcpt. Line"."Expected Receipt Date">0D) AND ("Purchase Header"."Order Date">0D) THEN
                         "Given Lead Time":="Purch. Rcpt. Line"."Expected Receipt Date"-"Purchase Header"."Order Date";
                    
                      "Item Inwards"+=1;
                      IF "Given Lead Time"=0 THEN
                         Given_Lead_Temp:=1
                      ELSE
                        Given_Lead_Temp:="Given Lead Time";
                      IF "Lead Time"=0 THEN
                        Lead_Temp:=1
                      ELSE
                        Lead_Temp:="Lead Time";
                      STD_Lead_Time:=0;
                    
                      IF Item.GET("Purch. Rcpt. Line"."No.") THEN BEGIN
                        LeadTemp:=FORMAT(Item."Safety Lead Time");
                        IF LeadTemp<>'' THEN BEGIN
                          IF STRLEN(FORMAT(LeadTemp))>=3  THEN
                           EVALUATE(STD_Lead_Time,COPYSTR(FORMAT(LeadTemp),1,STRLEN(FORMAT(LeadTemp))-1))
                          ELSE
                            EVALUATE(STD_Lead_Time,COPYSTR(FORMAT(LeadTemp),1,1));
                          Diff_Lead_Time:="Lead Time"-STD_Lead_Time;
                          CASE STD_Lead_Time OF
                          2:
                            BEGIN
                              Lead_Time_Inwards[1]:=Lead_Time_Inwards[1]+1;
                              CASE Diff_Lead_Time OF
                                -1000..-1 : Leads_Inwards[1][1]:=Leads_Inwards[1][1]+1;
                                0         : Leads_Inwards[1][2]:=Leads_Inwards[1][2]+1;
                                1..5      : Leads_Inwards[1][3]:=Leads_Inwards[1][3]+1;
                                6..10     : Leads_Inwards[1][4]:=Leads_Inwards[1][4]+1;
                                11..20     : Leads_Inwards[1][5]:=Leads_Inwards[1][5]+1;
                                21..30    : Leads_Inwards[1][6]:=Leads_Inwards[1][6]+1;
                                31..40    : Leads_Inwards[1][7]:=Leads_Inwards[1][7]+1;
                                41..50    : Leads_Inwards[1][8]:=Leads_Inwards[1][8]+1;
                                51..1000  : Leads_Inwards[1][9]:=Leads_Inwards[1][9]+1;
                              END;
                            END;
                          4:
                            BEGIN
                              Lead_Time_Inwards[2]:=Lead_Time_Inwards[2]+1;
                              CASE Diff_Lead_Time OF
                                -1000..-1 : Leads_Inwards[2][1]:=Leads_Inwards[2][1]+1;
                                0         : Leads_Inwards[2][2]:=Leads_Inwards[2][2]+1;
                                1..5      : Leads_Inwards[2][3]:=Leads_Inwards[2][3]+1;
                                6..10     : Leads_Inwards[2][4]:=Leads_Inwards[2][4]+1;
                                11..20    : Leads_Inwards[2][5]:=Leads_Inwards[2][5]+1;
                                21..30    : Leads_Inwards[2][6]:=Leads_Inwards[2][6]+1;
                                31..40    : Leads_Inwards[2][7]:=Leads_Inwards[2][7]+1;
                                41..50    : Leads_Inwards[2][8]:=Leads_Inwards[2][8]+1;
                                51..1000  : Leads_Inwards[2][9]:=Leads_Inwards[2][9]+1;
                              END;
                            END;
                    
                          7:
                            BEGIN
                              Lead_Time_Inwards[3]:=Lead_Time_Inwards[3]+1;
                              CASE Diff_Lead_Time OF
                                -1000..-1 : Leads_Inwards[3][1]:=Leads_Inwards[3][1]+1;
                                0         : Leads_Inwards[3][2]:=Leads_Inwards[3][2]+1;
                                1 .. 5    : Leads_Inwards[3][3]:=Leads_Inwards[3][3]+1;
                                6 .. 10   : Leads_Inwards[3][4]:=Leads_Inwards[3][4]+1;
                                11..20    : Leads_Inwards[3][5]:=Leads_Inwards[3][5]+1;
                                21..30    : Leads_Inwards[3][6]:=Leads_Inwards[3][6]+1;
                                31..40    : Leads_Inwards[3][7]:=Leads_Inwards[3][7]+1;
                                41..50    : Leads_Inwards[3][8]:=Leads_Inwards[3][8]+1;
                                51..1000  : Leads_Inwards[3][9]:=Leads_Inwards[3][9]+1;
                              END;
                            END;
                    
                          15:
                            BEGIN
                              Lead_Time_Inwards[4]:=Lead_Time_Inwards[4]+1;
                              CASE Diff_Lead_Time OF
                                -1000..-1 : Leads_Inwards[4][1]:=Leads_Inwards[4][1]+1;
                                0         : Leads_Inwards[4][2]:=Leads_Inwards[4][2]+1;
                                1..5      : Leads_Inwards[4][3]:=Leads_Inwards[4][3]+1;
                                6..10     : Leads_Inwards[4][4]:=Leads_Inwards[4][4]+1;
                                11..20     : Leads_Inwards[4][5]:=Leads_Inwards[4][5]+1;
                                21..30    : Leads_Inwards[4][6]:=Leads_Inwards[4][6]+1;
                                31..40    : Leads_Inwards[4][7]:=Leads_Inwards[4][7]+1;
                                41..50    : Leads_Inwards[4][8]:=Leads_Inwards[4][8]+1;
                                51..1000  : Leads_Inwards[4][9]:=Leads_Inwards[4][9]+1;
                              END;
                            END;
                    
                          21:
                            BEGIN
                            Lead_Time_Inwards[5]:=Lead_Time_Inwards[5]+1;
                              CASE Diff_Lead_Time OF
                                -1000..-1 : Leads_Inwards[5][1]:=Leads_Inwards[5][1]+1;
                                0         : Leads_Inwards[5][2]:=Leads_Inwards[5][2]+1;
                                1..5      : Leads_Inwards[5][3]:=Leads_Inwards[5][3]+1;
                                6..10     : Leads_Inwards[5][4]:=Leads_Inwards[5][4]+1;
                                11..20     : Leads_Inwards[5][5]:=Leads_Inwards[5][5]+1;
                                21..30    : Leads_Inwards[5][6]:=Leads_Inwards[5][6]+1;
                                31..40    : Leads_Inwards[5][7]:=Leads_Inwards[5][7]+1;
                                41..50    : Leads_Inwards[5][8]:=Leads_Inwards[5][8]+1;
                                51..1000   : Leads_Inwards[5][9]:=Leads_Inwards[5][9]+1;
                              END;
                            END;
                    
                          25:
                            BEGIN
                              Lead_Time_Inwards[6]:=Lead_Time_Inwards[6]+1;
                              CASE Diff_Lead_Time OF
                                -1000..-1 : Leads_Inwards[6][1]:=Leads_Inwards[6][1]+1;
                                0         : Leads_Inwards[6][2]:=Leads_Inwards[6][2]+1;
                                1..5      : Leads_Inwards[6][3]:=Leads_Inwards[6][3]+1;
                                6..10     : Leads_Inwards[6][4]:=Leads_Inwards[6][4]+1;
                                11..20     : Leads_Inwards[6][5]:=Leads_Inwards[6][5]+1;
                                21..30    : Leads_Inwards[6][6]:=Leads_Inwards[6][6]+1;
                                31..40    : Leads_Inwards[6][7]:=Leads_Inwards[6][7]+1;
                                41..50    : Leads_Inwards[6][8]:=Leads_Inwards[6][8]+1;
                                51..1000  : Leads_Inwards[6][9]:=Leads_Inwards[6][9]+1;
                              END;
                            END;
                    
                          30:
                            BEGIN
                              Lead_Time_Inwards[7]:=Lead_Time_Inwards[7]+1;
                              CASE Diff_Lead_Time OF
                                -1000..-1 : Leads_Inwards[7][1]:=Leads_Inwards[7][1]+1;
                                0         : Leads_Inwards[7][2]:=Leads_Inwards[7][2]+1;
                                1..5      : Leads_Inwards[7][3]:=Leads_Inwards[7][3]+1;
                                6..10     : Leads_Inwards[7][4]:=Leads_Inwards[7][4]+1;
                                11..20     : Leads_Inwards[7][5]:=Leads_Inwards[7][5]+1;
                                21..30    : Leads_Inwards[7][6]:=Leads_Inwards[7][6]+1;
                                31..40    : Leads_Inwards[7][7]:=Leads_Inwards[7][7]+1;
                                41..50    : Leads_Inwards[7][8]:=Leads_Inwards[7][8]+1;
                                51..1000  : Leads_Inwards[7][9]:=Leads_Inwards[7][9]+1;
                              END;
                            END;
                    
                          45:
                    
                            BEGIN
                             Lead_Time_Inwards[8]:=Lead_Time_Inwards[8]+1;
                              CASE Diff_Lead_Time OF
                                -1000..-1 : Leads_Inwards[8][1]:=Leads_Inwards[8][1]+1;
                                0         : Leads_Inwards[8][2]:=Leads_Inwards[8][2]+1;
                                1..5      : Leads_Inwards[8][3]:=Leads_Inwards[8][3]+1;
                                6..10     : Leads_Inwards[8][4]:=Leads_Inwards[8][4]+1;
                                11..20     : Leads_Inwards[8][5]:=Leads_Inwards[8][5]+1;
                                21..30    : Leads_Inwards[8][6]:=Leads_Inwards[8][6]+1;
                                31..40    : Leads_Inwards[8][7]:=Leads_Inwards[8][7]+1;
                                41..50    : Leads_Inwards[8][8]:=Leads_Inwards[8][8]+1;
                                51..1000  : Leads_Inwards[8][9]:=Leads_Inwards[8][9]+1;
                              END;
                            END;
                    
                          45..1000:
                            BEGIN
                              Lead_Time_Inwards[9]:=Lead_Time_Inwards[9]+1;
                              CASE Diff_Lead_Time OF
                               -1000..-1 : Leads_Inwards[9][1]:=Leads_Inwards[9][1]+1;
                                0        : Leads_Inwards[9][2]:=Leads_Inwards[9][2]+1;
                                1..5     : Leads_Inwards[9][3]:=Leads_Inwards[9][3]+1;
                                6..10    : Leads_Inwards[9][4]:=Leads_Inwards[9][4]+1;
                                11..20    : Leads_Inwards[9][5]:=Leads_Inwards[9][5]+1;
                                21..30   : Leads_Inwards[9][6]:=Leads_Inwards[9][6]+1;
                                31..40   : Leads_Inwards[9][7]:=Leads_Inwards[9][7]+1;
                                41..50   : Leads_Inwards[9][8]:=Leads_Inwards[9][8]+1;
                                51..1000 : Leads_Inwards[9][9]:=Leads_Inwards[9][9]+1;
                              END;
                            END;
                          END ;
                         END;
                        END;
                      IF Lead_Temp>Given_Lead_Temp THEN BEGIN
                        IF (Lead_Temp/Given_Lead_Temp)<1.5 THEN
                         "Lead Inwards"[2]+=1
                        ELSE IF (Lead_Temp/Given_Lead_Temp)<2 THEN
                         "Lead Inwards"[3]+=1
                        ELSE IF (Lead_Temp/Given_Lead_Temp)<3 THEN
                         "Lead Inwards"[4]+=1
                        ELSE IF  (Lead_Temp/Given_Lead_Temp)>3 THEN
                          "Lead Inwards"[5]+=1
                        ELSE
                           "Lead Inwards"[6]+=1;
                      END ELSE
                         "Lead Inwards"[1]+=1;
                      vendor_leadtime+=Lead_Temp/Given_Lead_Temp;
                    
                      IF (Excel)  THEN BEGIN
                        Entercell(ROW,1,"Purch. Rcpt. Line"."Order No.",FALSE,Tempexcelbuffer."Cell Type" :: Number);
                        Entercell(ROW,2,Name,FALSE,Tempexcelbuffer."Cell Type" :: Text);
                        Entercell(ROW,3,"Purch. Rcpt. Line".Description,FALSE,Tempexcelbuffer."Cell Type" :: Text);
                        Entercell(ROW,4,FORMAT("Purch. Rcpt. Line".Quantity),FALSE,Tempexcelbuffer."Cell Type" :: Number);
                        Entercell(ROW,5,"Purch. Rcpt. Line"."Unit of Measure Code",FALSE,Tempexcelbuffer."Cell Type" :: Number);
                        Entercell(ROW,6,FORMAT("Given Lead Time"),FALSE,Tempexcelbuffer."Cell Type" :: Number);
                        Entercell(ROW,7,FORMAT("Lead Time"),FALSE,Tempexcelbuffer."Cell Type" :: Number);
                        Entercell(ROW,8,FORMAT(UC),FALSE,Tempexcelbuffer."Cell Type" :: Number);
                        Entercell(ROW,9,FORMAT(IUC),FALSE,Tempexcelbuffer."Cell Type" :: Number);
                        Entercell(ROW,10,FORMAT(Line_TOT),FALSE,Tempexcelbuffer."Cell Type" :: Number);
                        Entercell(ROW,11,FORMAT(InwardDateTime),FALSE,Tempexcelbuffer."Cell Type" :: Number);
                        Entercell(ROW,12,FORMAT(Item."Safety Lead Time"),FALSE,Tempexcelbuffer."Cell Type" :: Number);
                      END;
                      //IF "Choice 2"="Choice 2"::Detail  THEN //Rev01
                      IF Choice2Detail  THEN
                        PurchRcptLineBody1 := TRUE   //CurrReport.SHOWOUTPUT:=TRUE
                      ELSE
                        PurchRcptLineBody1 := FALSE; //CurrReport.SHOWOUTPUT:=FALSE;
                      END ELSE
                      //CurrReport.SHOWOUTPUT:=FALSE;
                      PurchRcptLineBody1 := FALSE;
                    
                    //Purch. Rcpt. Line, Body (1) - OnPreSection()
                    
                    //Purch. Rcpt. Line, Body (2) - OnPreSection()
                    //IF (Choice =Choice::Receive) AND ("Purchase Pending" AND "Store Pending")  THEN BEGIN //Rev01
                      IF (ChoiceReceive) AND ("Purchase Pending" AND "Store Pending")  THEN BEGIN
                        IF Choice2Pending THEN BEGIN
                          Deviation:=0;
                          vendor.SETRANGE(vendor."No.","Purch. Rcpt. Header"."Buy-from Vendor No.");
                          IF vendor.FIND('-') THEN
                            Name:=vendor.Name;
                    
                          "Purchase Line".SETRANGE("Purchase Line"."Document No.","Purch. Rcpt. Header"."Order No.");
                          "Purchase Line".SETRANGE("Purchase Line"."No.","Purch. Rcpt. Line"."No.");
                          IF "Purchase Line".FIND('-') THEN BEGIN
                            "Line Procurement":="Line Procurement"+"Purch. Rcpt. Line".Quantity*"Purchase Line"."Unit Cost (LCY)";
                            UC:="Purchase Line"."Unit Cost (LCY)";
                            Line_TOT:="Purch. Rcpt. Line".Quantity*"Purchase Line"."Unit Cost (LCY)";
                          END;
                    /*
                          PIV.SETRANGE(PIV."Buy-from Vendor No.","Purch. Rcpt. Line"."Buy-from Vendor No.");
                          PIV.SETRANGE(PIV."No.","Purch. Rcpt. Line"."No.");
                          PIV.SETRANGE(PIV.Quantity,"Purch. Rcpt. Line".Quantity);
                          IF PIV.FIND('-') THEN
                           IUC:=PIV."Amount To Vendor"/PIV.Quantity;    //may
                    */
                          Tot:=UC*"Purch. Rcpt. Line".Quantity;
                          IF "Purch. Rcpt. Header"."Bill Transfered" THEN
                             Department:='purchase'
                          ELSE
                             Department:='Store';
                             "No. Of Bills"+=1;
                          IF IUC=0 THEN BEGIN
                           // CurrReport.SHOWOUTPUT:=TRUE;
                            "S. No."+=1;
                            Deviation:=0;
                            "Purchase Deviation":=0;
                            IF NOT ("Store Pending" AND "Purchase Pending") THEN BEGIN
                              IF "Store Pending" THEN BEGIN
                                IF NOT("Purch. Rcpt. Header"."Bill Transfered") THEN BEGIN //CurrReport.SHOWOUTPUT(NOT("Purch. Rcpt. Header"."Bill Transfered"));
                                  "Purch. Rcpt. Line".CALCFIELDS("Purch. Rcpt. Line"."Document date");
                                  IF  "Purch. Rcpt. Line"."Document date">0D THEN
                                    Deviation:=TODAY-"Purch. Rcpt. Line"."Document date";
                                  TOT_PEND_INV+=Tot;
                                END;
                              END ELSE BEGIN
                                IF ("Purch. Rcpt. Header"."Bill Transfered") THEN BEGIN // CurrReport.SHOWOUTPUT("Purch. Rcpt. Header"."Bill Transfered") ;
                                  "Purch. Rcpt. Line".CALCFIELDS("Purch. Rcpt. Line"."Document date");
                                  IF ( "Purch. Rcpt. Line"."Document date">0D) AND ("Purch. Rcpt. Header"."Bill Transfered Date">0D) THEN
                                    Deviation:="Purch. Rcpt. Header"."Bill Transfered Date"-"Purch. Rcpt. Line"."Document date";
                                  IF "Purch. Rcpt. Header"."Bill Transfered Date">0D THEN
                                    "Purchase Deviation":=TODAY-"Purch. Rcpt. Header"."Bill Transfered Date";
                                  TOT_PEND_INV+=Tot;
                                END;
                              END;
                            END ELSE BEGIN
                           IF "Purch. Rcpt. Header"."Bill Transfered" THEN BEGIN
                             Department:='Purchase';
                             "Purch. Rcpt. Line".CALCFIELDS("Purch. Rcpt. Line"."Document date");
                             IF ( "Purch. Rcpt. Line"."Document date">0D) AND ("Purch. Rcpt. Header"."Bill Transfered Date">0D) THEN
                               Deviation:="Purch. Rcpt. Header"."Bill Transfered Date"-"Purch. Rcpt. Line"."Document date";
                             IF "Purch. Rcpt. Header"."Bill Transfered Date">0D THEN
                               "Purchase Deviation":=TODAY-"Purch. Rcpt. Header"."Bill Transfered Date";
                             TOT_PEND_INV+=Tot;
                           END ELSE BEGIN
                             "Purch. Rcpt. Line".CALCFIELDS("Purch. Rcpt. Line"."Document date");
                             Department:='Stores';
                             IF ( "Purch. Rcpt. Line"."Document date">0D) AND ("Purch. Rcpt. Header"."Bill Transfered Date">0D) THEN
                               Deviation:=TODAY-"Purch. Rcpt. Line"."Document date";
                             TOT_PEND_INV+=Tot;
                           END;
                         END;
                         END;
                      END;
                    END; //swathi on 17-oct-13
                    /*   END ELSE
                         CurrReport.SHOWOUTPUT:=FALSE;
                      END ELSE
                        CurrReport.SHOWOUTPUT:=FALSE;
                    END ELSE
                      CurrReport.SHOWOUTPUT:=FALSE;
                    */
                    //Purch. Rcpt. Line, Body (2) - OnPreSection()
                    
                    //Purch. Rcpt. Line, Body (3) - OnPreSection()
                    //IF (Choice =Choice::Receive) AND (NOT "Store Pending" AND  "Purchase Pending")   THEN BEGIN //Rev01
                    IF (ChoiceReceive) AND (NOT "Store Pending" AND  "Purchase Pending")   THEN BEGIN
                     IF Choice2Pending THEN BEGIN
                       Deviation:=0;
                       vendor.SETRANGE(vendor."No.","Purch. Rcpt. Header"."Buy-from Vendor No.");
                       IF vendor.FIND('-') THEN
                         Name:=vendor.Name;
                       "Purchase Line".SETRANGE("Purchase Line"."Document No.","Purch. Rcpt. Header"."Order No.");
                       "Purchase Line".SETRANGE("Purchase Line"."No.","Purch. Rcpt. Line"."No.");
                       IF "Purchase Line".FIND('-') THEN BEGIN
                         "Line Procurement":="Line Procurement"+"Purch. Rcpt. Line".Quantity*"Purchase Line"."Unit Cost (LCY)";
                         UC:="Purchase Line"."Unit Cost (LCY)";
                         Line_TOT:="Purch. Rcpt. Line".Quantity*"Purchase Line"."Unit Cost (LCY)";
                       END;
                       Tot:=UC*"Purch. Rcpt. Line".Quantity;
                    
                       "No. Of Bills"+=1;
                       IF IUC=0 THEN BEGIN
                         //CurrReport.SHOWOUTPUT:=TRUE;
                         "S. No."+=1;
                         Deviation:=0;
                         "Purchase Deviation":=0;
                         IF NOT ("Store Pending" AND "Purchase Pending") THEN BEGIN
                           IF "Store Pending" THEN BEGIN
                           IF NOT("Purch. Rcpt. Header"."Bill Transfered") THEN BEGIN // CurrReport.SHOWOUTPUT(NOT("Purch. Rcpt. Header"."Bill Transfered"));
                             "Purch. Rcpt. Line".CALCFIELDS("Purch. Rcpt. Line"."Document date");
                             IF  "Purch. Rcpt. Line"."Document date">0D THEN
                               Deviation:=TODAY-"Purch. Rcpt. Line"."Document date";
                               TOT_PEND_INV+=Tot;
                            END;
                           END ELSE BEGIN
                             IF ("Purch. Rcpt. Header"."Bill Transfered") THEN BEGIN//CurrReport.SHOWOUTPUT("Purch. Rcpt. Header"."Bill Transfered") ;
                             "Purch. Rcpt. Line".CALCFIELDS("Purch. Rcpt. Line"."Document date");
                             IF ( "Purch. Rcpt. Line"."Document date">0D) AND ("Purch. Rcpt. Header"."Bill Transfered Date">0D) THEN
                               Deviation:="Purch. Rcpt. Header"."Bill Transfered Date"-"Purch. Rcpt. Line"."Document date";
                             IF "Purch. Rcpt. Header"."Bill Transfered Date">0D THEN
                               "Purchase Deviation":=TODAY-"Purch. Rcpt. Header"."Bill Transfered Date";
                             TOT_PEND_INV+=Tot;
                             END;
                           END;
                         END ELSE BEGIN
                           IF "Purch. Rcpt. Header"."Bill Transfered" THEN BEGIN
                             Department:='Purchase';
                             "Purch. Rcpt. Line".CALCFIELDS("Purch. Rcpt. Line"."Document date");
                             IF ( "Purch. Rcpt. Line"."Document date">0D) AND ("Purch. Rcpt. Header"."Bill Transfered Date">0D) THEN
                               Deviation:="Purch. Rcpt. Header"."Bill Transfered Date"-"Purch. Rcpt. Line"."Document date";
                             IF "Purch. Rcpt. Header"."Bill Transfered Date">0D THEN
                               "Purchase Deviation":=TODAY-"Purch. Rcpt. Header"."Bill Transfered Date";
                             TOT_PEND_INV+=Tot;
                           END ELSE BEGIN
                             "Purch. Rcpt. Line".CALCFIELDS("Purch. Rcpt. Line"."Document date");
                             Department:='Stores';
                             IF ( "Purch. Rcpt. Line"."Document date">0D) AND ("Purch. Rcpt. Header"."Bill Transfered Date">0D) THEN
                               Deviation:=TODAY-"Purch. Rcpt. Line"."Document date";
                             TOT_PEND_INV+=Tot;
                           END;
                         END;
                         END;
                      END;
                    END; //swathi on 17-oct-13
                    /*
                       END ELSE
                         CurrReport.SHOWOUTPUT:=FALSE;
                      END ELSE
                        CurrReport.SHOWOUTPUT:=FALSE;
                    END ELSE
                    CurrReport.SHOWOUTPUT:=FALSE;
                    */
                    //Purch. Rcpt. Line, Body (3) - OnPreSection()
                    
                    //Purch. Rcpt. Line, Body (4) - OnPreSection()
                    IF (ChoiceReceive) AND ( "Store Pending" AND NOT "Purchase Pending")   THEN BEGIN
                     IF Choice2Pending THEN BEGIN
                       Deviation:=0;
                       vendor.SETRANGE(vendor."No.","Purch. Rcpt. Header"."Buy-from Vendor No.");
                       IF vendor.FIND('-') THEN
                         Name:=vendor.Name;
                       "Purchase Line".SETRANGE("Purchase Line"."Document No.","Purch. Rcpt. Header"."Order No.");
                       "Purchase Line".SETRANGE("Purchase Line"."No.","Purch. Rcpt. Line"."No.");
                       IF "Purchase Line".FIND('-') THEN BEGIN
                         "Line Procurement":="Line Procurement"+"Purch. Rcpt. Line".Quantity*"Purchase Line"."Unit Cost (LCY)";
                         UC:="Purchase Line"."Unit Cost (LCY)";
                         Line_TOT:="Purch. Rcpt. Line".Quantity*"Purchase Line"."Unit Cost (LCY)";
                       END;
                     /*
                       PIV.SETRANGE(PIV."Buy-from Vendor No.","Purch. Rcpt. Line"."Buy-from Vendor No.");
                       PIV.SETRANGE(PIV."No.","Purch. Rcpt. Line"."No.");
                       PIV.SETRANGE(PIV.Quantity,"Purch. Rcpt. Line".Quantity);
                       IF PIV.FIND('-') THEN
                        IUC:=PIV."Amount To Vendor"/PIV.Quantity;
                     */
                       Tot:=UC*"Purch. Rcpt. Line".Quantity;
                       "No. Of Bills"+=1;
                       IF "Purch. Rcpt. Header"."Bill Transfered" THEN
                          Department:='purchase'
                       ELSE
                          Department:='Store';
                       IF IUC=0 THEN BEGIN
                         //CurrReport.SHOWOUTPUT:=TRUE;
                         "S. No."+=1;
                         Deviation:=0;
                         "Purchase Deviation":=0;
                         IF NOT ("Store Pending" AND "Purchase Pending") THEN BEGIN
                           IF "Store Pending" THEN BEGIN
                           IF NOT("Purch. Rcpt. Header"."Bill Transfered") THEN BEGIN // CurrReport.SHOWOUTPUT(NOT("Purch. Rcpt. Header"."Bill Transfered"));
                             "Purch. Rcpt. Line".CALCFIELDS("Purch. Rcpt. Line"."Document date");
                             IF  "Purch. Rcpt. Line"."Document date">0D THEN
                               Deviation:=TODAY-"Purch. Rcpt. Line"."Document date";
                               TOT_PEND_INV+=Tot;
                               END;
                           END ELSE BEGIN
                             IF ("Purch. Rcpt. Header"."Bill Transfered") THEN BEGIN //CurrReport.SHOWOUTPUT("Purch. Rcpt. Header"."Bill Transfered") ;
                             "Purch. Rcpt. Line".CALCFIELDS("Purch. Rcpt. Line"."Document date");
                             IF ( "Purch. Rcpt. Line"."Document date">0D) AND ("Purch. Rcpt. Header"."Bill Transfered Date">0D) THEN
                               Deviation:="Purch. Rcpt. Header"."Bill Transfered Date"-"Purch. Rcpt. Line"."Document date";
                             IF "Purch. Rcpt. Header"."Bill Transfered Date">0D THEN
                               "Purchase Deviation":=TODAY-"Purch. Rcpt. Header"."Bill Transfered Date";
                             TOT_PEND_INV+=Tot;
                             END;
                           END;
                         END ELSE BEGIN
                           IF "Purch. Rcpt. Header"."Bill Transfered" THEN BEGIN
                             Department:='Purchase';
                             "Purch. Rcpt. Line".CALCFIELDS("Purch. Rcpt. Line"."Document date");
                             IF ( "Purch. Rcpt. Line"."Document date">0D) AND ("Purch. Rcpt. Header"."Bill Transfered Date">0D) THEN
                               Deviation:="Purch. Rcpt. Header"."Bill Transfered Date"-"Purch. Rcpt. Line"."Document date";
                             IF "Purch. Rcpt. Header"."Bill Transfered Date">0D THEN
                               "Purchase Deviation":=TODAY-"Purch. Rcpt. Header"."Bill Transfered Date";
                             TOT_PEND_INV+=Tot;
                           END ELSE BEGIN
                             "Purch. Rcpt. Line".CALCFIELDS("Purch. Rcpt. Line"."Document date");
                             Department:='Stores';
                             IF ( "Purch. Rcpt. Line"."Document date">0D) AND ("Purch. Rcpt. Header"."Bill Transfered Date">0D) THEN
                               Deviation:=TODAY-"Purch. Rcpt. Line"."Document date";
                             TOT_PEND_INV+=Tot;
                           END;
                         END;
                         END;
                      END;
                    END; //swathi on 17-oct-13
                    
                    /*   END ELSE
                         CurrReport.SHOWOUTPUT:=FALSE;
                      END ELSE
                        CurrReport.SHOWOUTPUT:=FALSE;
                    END ELSE
                     CurrReport.SHOWOUTPUT:=FALSE;
                    */
                    //Purch. Rcpt. Line, Body (4) - OnPreSection()
                    
                    
                    //Purch. Rcpt. Line, GroupFooter (5) - OnPreSection()
                    //IF Choice=Choice::Order THEN BEGIN //Rev01
                      IF Prev_DocNo <> "Purch. Rcpt. Line"."Document No." THEN BEGIN
                    IF ChoiceOrder THEN BEGIN
                     CurrReport.SHOWOUTPUT:=FALSE;
                    END ELSE BEGIN
                     IF Choice2Breif THEN BEGIN
                      CurrReport.SHOWOUTPUT:=TRUE;
                      vendor.SETRANGE(vendor."No.","Purch. Rcpt. Header"."Buy-from Vendor No.");
                    
                      IF vendor.FIND('-') THEN
                      Name:=vendor.Name;
                      "Total Procurement":="Total Procurement"+"Line Procurement";
                      "Purchase Header".SETRANGE("Purchase Header"."No.","Purch. Rcpt. Header"."Order No.");
                      IF "Purchase Header".FIND('-') THEN
                        "Lead Time":="Purch. Rcpt. Header"."Posting Date"-"Purchase Header"."Order Date";
                      IF ("Purch. Rcpt. Line"."Expected Receipt Date">0D) AND ("Purchase Header"."Order Date">0D) THEN
                        "Given Lead Time":="Purch. Rcpt. Line"."Expected Receipt Date"-"Purchase Header"."Order Date";
                    /* IF "Given Lead Time"=0 THEN
                        Given_Lead_Temp:=1
                      ELSE
                        Given_Lead_Temp:="Given Lead Time";
                      IF "Lead Time"=0 THEN
                        Lead_Temp:=1
                      ELSE
                        Lead_Temp:="Lead Time";
                      IF Lead_Temp>Given_Lead_Temp THEN BEGIN
                        IF (Lead_Temp/Given_Lead_Temp)<1.5 THEN
                           "Lead Inwards"[2]+=1
                        ELSE IF (Lead_Temp/Given_Lead_Temp)<2 THEN
                          "Lead Inwards"[3]+=1
                        ELSE IF (Lead_Temp/Given_Lead_Temp)<3 THEN
                          "Lead Inwards"[4]+=1
                        ELSE IF  (Lead_Temp/Given_Lead_Temp)>3 THEN
                          "Lead Inwards"[4]+=1;
                      END ELSE
                        "Lead Inwards"[1]+=1;
                    */
                    END;
                    /*
                    END ELSE
                     CurrReport.SHOWOUTPUT:=FALSE;
                    END;
                    */
                      Prev_DocNo := "Purch. Rcpt. Line"."Document No."
                    END;
                    //Purch. Rcpt. Line, GroupFooter (5) - OnPreSection()
                    
                    //Purch. Rcpt. Line, Footer (6) - OnPreSection()
                    /*
                    IF (ChoiceReceive) AND (Choice2Detail) THEN BEGIN
                         "Total Procurement"+=Order_TOT;
                      END;
                    */
                     END;
                    /*
                      ELSE
                      CurrReport.SHOWOUTPUT:=FALSE;
                    */
                    //Purch. Rcpt. Line, Footer (6) - OnPreSection()
                    
                    //Rev01 end
                    /*IF (ChoiceReceive) AND (Choice2Detail) THEN BEGIN
                         "Total Procurement"+=Order_TOT;
                      END;
                     */

                end;

                trigger OnPreDataItem();
                begin
                    //IF "Choice 2"="Choice 2"::Week THEN //Rev01
                    IF Choice2Week THEN
                      CurrReport.BREAK;
                    //IF "Choice 2"="Choice 2"::PENDING THEN //Rev01
                    IF Choice2Pending THEN
                      "Purch. Rcpt. Line".SETRANGE("Purch. Rcpt. Line"."Quantity Invoiced",0);
                end;
            }
            dataitem("<Purch. Rcpt. Header1>";"Purch. Rcpt. Header")
            {
                DataItemTableView = SORTING(Pay-to Vendor No.,Posting Date,Order No.,Vendor Shipment No.) ORDER(Ascending) WHERE(Bill Transfered=CONST(Yes));
                column(Purch_Rcpt_Head1_Choice2Week;Choice2Week)
                {
                }
                column(Max_Date;Max_Date)
                {
                }
                column(Min_Date;Min_Date)
                {
                }
                column(No__Of_Bills__Control1102154058;"No. Of Bills")
                {
                }
                column(Week_value;Week_value)
                {
                }
                column(ToCaption;ToCaptionLbl)
                {
                }
                column(Purch__Rcpt__Header1__No_;"No.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    //"No. Of Bills"+=1;
                    Inward_Value:=0;
                    PRl.SETRANGE(PRl."Document No.","<Purch. Rcpt. Header1>"."No.");
                    IF PRl.FIND('-') THEN
                      REPEAT
                        Inward_Value+=PRl.Quantity*PRl."Unit Cost (LCY)";
                      UNTIL PRl.NEXT=0;
                    Week_value+=Inward_Value;

                    //Rev01 Start
                    //<Purch. Rcpt. Header1>, Footer (2) - OnPreSection()
                    Tot+=Week_value;
                    "Total Bills"+= "No. Of Bills";
                    //Rev01 End
                end;

                trigger OnPostDataItem();
                begin
                    //IF  ("Choice 2"="Choice 2"::Week ) THEN //Rev01
                    IF Choice2Week THEN
                     Min_Date:=Max_Date+1;
                end;

                trigger OnPreDataItem();
                begin
                    //IF  ("Choice 2"<>"Choice 2"::Week ) THEN //Rev01
                    IF NOT Choice2Week THEN
                     CurrReport.BREAK;
                     "<Purch. Rcpt. Header1>".SETRANGE("<Purch. Rcpt. Header1>"."Posting Date",Min_Date,Max_Date);
                    //  Min_Date:=Max_Date+1;
                     IF  "<Purch. Rcpt. Header1>".COUNT=0 THEN
                       CurrReport.BREAK;

                    "No. Of Bills":=0;
                    Week_value:=0;
                end;
            }

            trigger OnAfterGetRecord();
            begin
                "Line Procurement":=0;
                Order_TOT:=0;
                
                //IF "Choice 2"="Choice 2"::Week THEN BEGIN //Rev01
                IF Choice2Week THEN BEGIN
                 Max_Date:= CALCDATE(Period_Length,Min_Date);
                 IF   Max_Date>To_Date THEN
                  CurrReport.BREAK;
                END;
                
                //Rev01 Start
                /*
                        //sundar code error for NAV2013 conversion
                //Purch. Rcpt. Header, Header (1) - OnPreSection()
                //CurrReport.SHOWOUTPUT((Choice=Choice::Receive) AND ("Choice 2"="Choice 2"::Detail)); //Rev01
                CurrReport.SHOWOUTPUT((ChoiceReceive) AND (Choice2Detail));
                //Purch. Rcpt. Header, Header (1) - OnPreSection()
                
                //Purch. Rcpt. Header, Header (2) - OnPreSection()
                //CurrReport.SHOWOUTPUT((Choice=Choice::Receive) AND ("Choice 2"="Choice 2"::Brief)); //Rev01
                CurrReport.SHOWOUTPUT((ChoiceReceive) AND (Choice2Breif));
                //Purch. Rcpt. Header, Header (2) - OnPreSection()
                
                //Purch. Rcpt. Header, Header (3) - OnPreSection()
                //CurrReport.SHOWOUTPUT((Choice=Choice::Receive) AND ("Choice 2"="Choice 2"::PENDING) AND ("Store Pending" AND "Purchase Pending")); //Rev01
                CurrReport.SHOWOUTPUT((ChoiceReceive)  AND (Choice2Pending) AND ("Store Pending" AND "Purchase Pending"));
                //Purch. Rcpt. Header, Header (3) - OnPreSection()
                
                //Purch. Rcpt. Header, Header (4) - OnPreSection()
                //CurrReport.SHOWOUTPUT((Choice=Choice::Receive) AND ("Choice 2"="Choice 2"::PENDING) AND (
                  //(NOT "Store Pending") AND "Purchase Pending")); //Rev01
                CurrReport.SHOWOUTPUT((ChoiceReceive) AND (Choice2Pending) AND
                     ((NOT "Store Pending") AND "Purchase Pending")); //Rev01
                //Purch. Rcpt. Header, Header (4) - OnPreSection()
                
                //Purch. Rcpt. Header, Header (5) - OnPreSection()
                  //CurrReport.SHOWOUTPUT((Choice=Choice::Receive) AND ("Choice 2"="Choice 2"::PENDING) AND (
                  //"Store Pending" AND  (NOT "Purchase Pending"))); //Rev01
                CurrReport.SHOWOUTPUT((ChoiceReceive) AND (Choice2Pending) AND
                     ("Store Pending" AND  (NOT "Purchase Pending"))); //Rev01
                //Purch. Rcpt. Header, Header (5) - OnPreSection()
                
                //Purch. Rcpt. Header, Header (6) - OnPreSection()
                //CurrReport.SHOWOUTPUT((Choice=Choice::Receive) AND ("Choice 2"="Choice 2"::Week)); //Rev01
                CurrReport.SHOWOUTPUT((ChoiceReceive) AND (Choice2Week));
                //Purch. Rcpt. Header, Header (6) - OnPreSection()
                
                //Purch. Rcpt. Header, Header (7) - OnPreSection()
                //IF Choice=Choice::Order THEN //Rev01
                IF ChoiceOrder THEN
                  CurrReport.SHOWOUTPUT:=FALSE
                ELSE IF Choice2Breif THEN BEGIN
                    CurrReport.SHOWOUTPUT:=TRUE
                  END ELSE
                    CurrReport.SHOWOUTPUT:=FALSE;
                
                //Purch. Rcpt. Header, Header (7) - OnPreSection()
                 */   //sundar code error for NAV2013 conversion
                
                //Purch. Rcpt. Header, Header (8) - OnPreSection()
                
                
                IF Excel THEN BEGIN
                 ROW+=1;
                  EnterHeadings(ROW,1,'Purchase Order No.',TRUE,Tempexcelbuffer."Cell Type" :: Text);
                  EnterHeadings(ROW,2,'Order Line No',TRUE,Tempexcelbuffer."Cell Type" :: Text);
                  EnterHeadings(ROW,3,'Item',TRUE,Tempexcelbuffer."Cell Type" :: Text);
                  EnterHeadings(ROW,4,'Quantity',TRUE,Tempexcelbuffer."Cell Type" :: Text);
                  EnterHeadings(ROW,5,'Unit Of Measure',TRUE,Tempexcelbuffer."Cell Type" :: Text);
                  EnterHeadings(ROW,6,'Give Lead Time',TRUE,Tempexcelbuffer."Cell Type" :: Text);
                  EnterHeadings(ROW,7,'Actual Lead Time',TRUE,Tempexcelbuffer."Cell Type" :: Text);
                  EnterHeadings(ROW,8,'Unit Cost(With Out Taxes)',TRUE,Tempexcelbuffer."Cell Type" :: Text);
                  EnterHeadings(ROW,9,'Unit Cost(With Taxes)',TRUE,Tempexcelbuffer."Cell Type" :: Text);
                  EnterHeadings(ROW,10,'Total Cost',TRUE,Tempexcelbuffer."Cell Type" :: Text);
                  EnterHeadings(ROW,11,'Inward Date Time',TRUE,Tempexcelbuffer."Cell Type" :: Text);
                  EnterHeadings(ROW,12,'STANDARD LEAD TIME',TRUE,Tempexcelbuffer."Cell Type" :: Text);
                END;
                  //CurrReport.SHOWOUTPUT((Choice=Choice::Receive) AND ("Choice 2"="Choice 2"::Detail)); //Rev01
                 /* CurrReport.SHOWOUTPUT((ChoiceReceive) AND (Choice2Detail));
                //Purch. Rcpt. Header, Header (8) - OnPreSection()
                
                //Purch. Rcpt. Header, Header (9) - OnPreSection()
                //CurrReport.SHOWOUTPUT((Choice=Choice::Receive) AND ("Choice 2"="Choice 2"::PENDING) AND  ("Store Pending" AND "Purchase Pending") );//Rev01
                CurrReport.SHOWOUTPUT((ChoiceReceive) AND (Choice2Pending) AND  ("Store Pending" AND "Purchase Pending") );
                //Purch. Rcpt. Header, Header (9) - OnPreSection()
                
                //Purch. Rcpt. Header, Header (10) - OnPreSection()
                //CurrReport.SHOWOUTPUT((Choice=Choice::Receive) AND ("Choice 2"="Choice 2"::PENDING) AND (NOT "Store Pending" AND ( "Purchase Pending")) ); //Rev01
                CurrReport.SHOWOUTPUT((ChoiceReceive) AND (Choice2Pending) AND (NOT "Store Pending" AND ( "Purchase Pending")) );
                //Purch. Rcpt. Header, Header (10) - OnPreSection()
                
                //Purch. Rcpt. Header, Header (11) - OnPreSection()
                CurrReport.SHOWOUTPUT((ChoiceReceive) AND (Choice2Pending) AND ( "Store Pending" AND (NOT "Purchase Pending")) );
                //Purch. Rcpt. Header, Header (11) - OnPreSection()
                
                //Purch. Rcpt. Header, Header (12) - OnPreSection()
                //CurrReport.SHOWOUTPUT((Choice=Choice::Receive) AND ("Choice 2"="Choice 2"::Week)); //Rev01
                CurrReport.SHOWOUTPUT((ChoiceReceive) AND (Choice2Week));
                //Purch. Rcpt. Header, Header (12) - OnPreSection()
                 */
                //Purch. Rcpt. Header, GroupHeader (13) - OnPreSection()
                IF Prev_Vendor<>"Purch. Rcpt. Header"."Pay-to Vendor No." THEN
                BEGIN
                  vendor_leadtime:=0;
                  Vendor_inwards:=0;
                  Prev_Vendor:="Purch. Rcpt. Header"."Pay-to Vendor No.";
                END;
                //Purch. Rcpt. Header, GroupHeader (13) - OnPreSection()
                
                //Purch. Rcpt. Header, Body (14) - OnPreSection()
                //IF Choice =Choice::Receive THEN BEGIN //Rev01
                IF ChoiceReceive THEN BEGIN
                 Vendor_inwards+=1;
                 //IF ("Choice 2"="Choice 2"::Detail) THEN BEGIN //Rev01
                 IF (Choice2Detail) THEN BEGIN
                  Inwards+=1;
                 // CurrReport.SHOWOUTPUT:=TRUE;    swathi
                  IF FORMAT("Purch. Rcpt. Header"."Created Date Time")='' THEN
                     InwardDateTime:=FORMAT("Purch. Rcpt. Header"."Posting Date")
                  ELSE
                     InwardDateTime:=FORMAT("Purch. Rcpt. Header"."Created Date Time");
                  vendor.SETRANGE(vendor."No.","Purch. Rcpt. Header"."Buy-from Vendor No.");
                  IF vendor.FIND('-') THEN
                    Name:=vendor.Name;
                
                   /*
                     IF (Excel)  THEN BEGIN
                       ROW+=1;
                       Entercell(ROW,1,'Purchase Order No.',TRUE);
                       Entercell(ROW,2,FORMAT("Purch. Rcpt. Header"."Order No."),FALSE);
                       Entercell(ROW,3,'Vendor',TRUE);
                       Entercell(ROW,4,FORMAT(Name),FALSE);
                       Entercell(ROW,5,'Inward Date Time',TRUE);
                       Entercell(ROW,6,FORMAT(InwardDateTime),FALSE);
                     END;   */
                
                  END;
                END;
                /* END ELSE
                  CurrReport.SHOWOUTPUT:=FALSE;
                  END ELSE
                 CurrReport.SHOWOUTPUT:=FALSE;
                //Purch. Rcpt. Header, Body (14) - OnPreSection()
                
                //Purch. Rcpt. Header, GroupFooter (15) - OnPreSection()
                //CurrReport.SHOWOUTPUT((Choice =Choice::Receive) AND ("Choice 2"="Choice 2"::Brief)); //Rev01
                
                CurrReport.SHOWOUTPUT((ChoiceReceive) AND (Choice2Breif));
                *///sundar code error for NAV2013 conversion
                
                //Purch. Rcpt. Header, GroupFooter (15) - OnPreSection()
                
                //Rev01 End

            end;

            trigger OnPostDataItem();
            begin
                //Rev01 Start
                /*
                //Purch. Rcpt. Header, Footer (16) - OnPreSection()
                //CurrReport.SHOWOUTPUT((Choice=Choice::Receive) AND ("Choice 2"="Choice 2"::PENDING)); //Rev01
                CurrReport.SHOWOUTPUT((ChoiceReceive) AND (Choice2Pending));
                //Purch. Rcpt. Header, Footer (16) - OnPreSection()
                
                //Purch. Rcpt. Header, Footer (17) - OnPreSection()
                //CurrReport.SHOWOUTPUT((Choice=Choice::Receive) AND ("Choice 2"="Choice 2"::Week)); //Rev01
                CurrReport.SHOWOUTPUT((ChoiceReceive) AND (Choice2Week));
                //Purch. Rcpt. Header, Footer (17) - OnPreSection()
                //Rev01 End
                 */        //sundar code error for NAV2013 conversion

            end;

            trigger OnPreDataItem();
            begin
                //IF Choice<>Choice::Receive THEN //Rev01

                IF NOT ChoiceReceive OR ChoiceInward THEN
                 CurrReport.BREAK;

                //IF "Choice 2"="Choice 2"::Week THEN BEGIN //Rev01
                IF Choice2Week THEN BEGIN
                  IF "Purch. Rcpt. Header".GETFILTER("Purch. Rcpt. Header"."Bill Transfered Date")<>'' THEN BEGIN
                    From_Date:="Purch. Rcpt. Header".GETRANGEMIN("Purch. Rcpt. Header"."Bill Transfered Date");
                    To_Date:="Purch. Rcpt. Header".GETRANGEMAX("Purch. Rcpt. Header"."Bill Transfered Date");
                  END ELSE BEGIN
                    From_Date:=040107D;
                    To_Date:=TODAY;
                  END;
                  IF Period_Length='' THEN
                    Period_Length:='1W';
                  Max_Date:=From_Date;
                  Min_Date:=From_Date;

                END;

                //IF "Choice 2"="Choice 2"::PENDING THEN BEGIN //Rev01
                IF Choice2Pending THEN BEGIN
                  IF "Store Pending" AND (NOT "Purchase Pending")  THEN
                    "Purch. Rcpt. Header".SETRANGE("Purch. Rcpt. Header"."Bill Transfered",FALSE)
                  ELSE IF "Purchase Pending" AND (NOT "Store Pending") THEN
                    "Purch. Rcpt. Header".SETRANGE("Purch. Rcpt. Header"."Bill Transfered",TRUE);
                END;
            end;
        }
        dataitem(Currency;Currency)
        {
            DataItemTableView = SORTING(Code);
            ReqFilterHeading = '<no>';
            column(Currency_ChoiceReceive;ChoiceReceive)
            {
            }
            column(Currency_Choice2Detail;Choice2Detail)
            {
            }
            column(Currency_Choice2Breif;Choice2Breif)
            {
            }
            column(Total_Procurement_;"Total Procurement")
            {
            }
            column(Purch__Rcpt__Header__COUNT;"Purch. Rcpt. Header".COUNT)
            {
            }
            column(Item_Inwards_;"Item Inwards")
            {
            }
            column(Problematic_Inwards_;"Problematic Inwards")
            {
            }
            column(Lead_Inwards__6_;"Lead Inwards"[6])
            {
            }
            column(Lead_Inwards__6___Item_Inwards_;"Lead Inwards"[6]/"Item Inwards")
            {
            }
            column(Lead_Inwards__1_;"Lead Inwards"[1])
            {
            }
            column(Lead_Inwards__1___Item_Inwards_;"Lead Inwards"[1]/"Item Inwards")
            {
            }
            column(Lead_Inwards__2_;"Lead Inwards"[2])
            {
            }
            column(Lead_Inwards__2___Item_Inwards_;"Lead Inwards"[2]/"Item Inwards")
            {
            }
            column(Lead_Inwards__3_;"Lead Inwards"[3])
            {
            }
            column(Lead_Inwards__3___Item_Inwards_;"Lead Inwards"[3]/"Item Inwards")
            {
            }
            column(Lead_Inwards__4_;"Lead Inwards"[4])
            {
            }
            column(Lead_Inwards__4___Item_Inwards_;"Lead Inwards"[4]/"Item Inwards")
            {
            }
            column(Lead_Inwards__5_;"Lead Inwards"[5])
            {
            }
            column(Lead_Inwards__5___Item_Inwards_;"Lead Inwards"[5]/"Item Inwards")
            {
            }
            column(Leads_Inwards_1__1_;Leads_Inwards[1][1])
            {
            }
            column(Leads_Inwards_2__1_;Leads_Inwards[2][1])
            {
            }
            column(Leads_Inwards_3__1_;Leads_Inwards[3][1])
            {
            }
            column(Leads_Inwards_4__1_;Leads_Inwards[4][1])
            {
            }
            column(Leads_Inwards_1__2_;Leads_Inwards[1][2])
            {
            }
            column(Leads_Inwards_2__2_;Leads_Inwards[2][2])
            {
            }
            column(Leads_Inwards_3__2_;Leads_Inwards[3][2])
            {
            }
            column(Leads_Inwards_4__2_;Leads_Inwards[4][2])
            {
            }
            column(Leads_Inwards_5__1_;Leads_Inwards[5][1])
            {
            }
            column(Leads_Inwards_5__2_;Leads_Inwards[5][2])
            {
            }
            column(Leads_Inwards_6__1_;Leads_Inwards[6][1])
            {
            }
            column(Leads_Inwards_6__2_;Leads_Inwards[6][2])
            {
            }
            column(Leads_Inwards_1__3_;Leads_Inwards[1][3])
            {
            }
            column(Leads_Inwards_2__3_;Leads_Inwards[2][3])
            {
            }
            column(Leads_Inwards_3__3_;Leads_Inwards[3][3])
            {
            }
            column(Leads_Inwards_4__3_;Leads_Inwards[4][3])
            {
            }
            column(Leads_Inwards_5__3_;Leads_Inwards[5][3])
            {
            }
            column(Leads_Inwards_6__3_;Leads_Inwards[6][3])
            {
            }
            column(Leads_Inwards_7__1_;Leads_Inwards[7][1])
            {
            }
            column(Leads_Inwards_7__2_;Leads_Inwards[7][2])
            {
            }
            column(Leads_Inwards_7__3_;Leads_Inwards[7][3])
            {
            }
            column(Leads_Inwards_1__4_;Leads_Inwards[1][4])
            {
            }
            column(Leads_Inwards_2__4_;Leads_Inwards[2][4])
            {
            }
            column(Leads_Inwards_3__4_;Leads_Inwards[3][4])
            {
            }
            column(Leads_Inwards_4__4_;Leads_Inwards[4][4])
            {
            }
            column(Leads_Inwards_5__4_;Leads_Inwards[5][4])
            {
            }
            column(Leads_Inwards_6__4_;Leads_Inwards[6][4])
            {
            }
            column(Leads_Inwards_7__4_;Leads_Inwards[7][4])
            {
            }
            column(Leads_Inwards_8__1_;Leads_Inwards[8][1])
            {
            }
            column(Leads_Inwards_8__2_;Leads_Inwards[8][2])
            {
            }
            column(Leads_Inwards_8__3_;Leads_Inwards[8][3])
            {
            }
            column(Leads_Inwards_8__4_;Leads_Inwards[8][4])
            {
            }
            column(Leads_Inwards_1__5_;Leads_Inwards[1][5])
            {
            }
            column(Leads_Inwards_2__5_;Leads_Inwards[2][5])
            {
            }
            column(Leads_Inwards_3__5_;Leads_Inwards[3][5])
            {
            }
            column(Leads_Inwards_4__5_;Leads_Inwards[4][5])
            {
            }
            column(Leads_Inwards_5__5_;Leads_Inwards[5][5])
            {
            }
            column(Leads_Inwards_6__5_;Leads_Inwards[6][5])
            {
            }
            column(Leads_Inwards_7__5_;Leads_Inwards[7][5])
            {
            }
            column(Leads_Inwards_8__5_;Leads_Inwards[8][5])
            {
            }
            column(Leads_Inwards_9__1_;Leads_Inwards[9][1])
            {
            }
            column(Leads_Inwards_9__2_;Leads_Inwards[9][2])
            {
            }
            column(Leads_Inwards_9__3_;Leads_Inwards[9][3])
            {
            }
            column(Leads_Inwards_9__4_;Leads_Inwards[9][4])
            {
            }
            column(Leads_Inwards_9__5_;Leads_Inwards[9][5])
            {
            }
            column(Leads_Inwards_9__6_;Leads_Inwards[9][6])
            {
            }
            column(Leads_Inwards_1__6_;Leads_Inwards[1][6])
            {
            }
            column(Leads_Inwards_2__6_;Leads_Inwards[2][6])
            {
            }
            column(Leads_Inwards_3__6_;Leads_Inwards[3][6])
            {
            }
            column(Leads_Inwards_4__6_;Leads_Inwards[4][6])
            {
            }
            column(Leads_Inwards_5__6_;Leads_Inwards[5][6])
            {
            }
            column(Leads_Inwards_6__6_;Leads_Inwards[6][6])
            {
            }
            column(Leads_Inwards_7__6_;Leads_Inwards[7][6])
            {
            }
            column(Leads_Inwards_8__6_;Leads_Inwards[8][6])
            {
            }
            column(Leads_Inwards_9__7_;Leads_Inwards[9][7])
            {
            }
            column(Leads_Inwards_1__7_;Leads_Inwards[1][7])
            {
            }
            column(Leads_Inwards_2__7_;Leads_Inwards[2][7])
            {
            }
            column(Leads_Inwards_3__7_;Leads_Inwards[3][7])
            {
            }
            column(Leads_Inwards_4__7_;Leads_Inwards[4][7])
            {
            }
            column(Leads_Inwards_5__7_;Leads_Inwards[5][7])
            {
            }
            column(Leads_Inwards_6__7_;Leads_Inwards[6][7])
            {
            }
            column(Leads_Inwards_7__7_;Leads_Inwards[7][7])
            {
            }
            column(Leads_Inwards_8__7_;Leads_Inwards[8][7])
            {
            }
            column(Leads_Inwards_9__8_;Leads_Inwards[9][8])
            {
            }
            column(Leads_Inwards_1__8_;Leads_Inwards[1][8])
            {
            }
            column(Leads_Inwards_2__8_;Leads_Inwards[2][8])
            {
            }
            column(Leads_Inwards_3__8_;Leads_Inwards[3][8])
            {
            }
            column(Leads_Inwards_4__8_;Leads_Inwards[4][8])
            {
            }
            column(Leads_Inwards_5__8_;Leads_Inwards[5][8])
            {
            }
            column(Leads_Inwards_6__8_;Leads_Inwards[6][8])
            {
            }
            column(Leads_Inwards_7__8_;Leads_Inwards[7][8])
            {
            }
            column(Leads_Inwards_8__8_;Leads_Inwards[8][8])
            {
            }
            column(Leads_Inwards_9__9_;Leads_Inwards[9][9])
            {
            }
            column(Leads_Inwards_1__9_;Leads_Inwards[1][9])
            {
            }
            column(Leads_Inwards_2__9_;Leads_Inwards[2][9])
            {
            }
            column(Leads_Inwards_3__9_;Leads_Inwards[3][9])
            {
            }
            column(Leads_Inwards_4__9_;Leads_Inwards[4][9])
            {
            }
            column(Leads_Inwards_5__9_;Leads_Inwards[5][9])
            {
            }
            column(Leads_Inwards_6__9_;Leads_Inwards[6][9])
            {
            }
            column(Leads_Inwards_7__9_;Leads_Inwards[7][9])
            {
            }
            column(Leads_Inwards_8__9_;Leads_Inwards[8][9])
            {
            }
            column(Lead_Time_Inwards_1_;Lead_Time_Inwards[1])
            {
            }
            column(Lead_Time_Inwards_2_;Lead_Time_Inwards[2])
            {
            }
            column(Lead_Time_Inwards_3_;Lead_Time_Inwards[3])
            {
            }
            column(Lead_Time_Inwards_4_;Lead_Time_Inwards[4])
            {
            }
            column(Lead_Time_Inwards_5_;Lead_Time_Inwards[5])
            {
            }
            column(Lead_Time_Inwards_6_;Lead_Time_Inwards[6])
            {
            }
            column(Lead_Time_Inwards_7_;Lead_Time_Inwards[7])
            {
            }
            column(Lead_Time_Inwards_8_;Lead_Time_Inwards[8])
            {
            }
            column(Lead_Time_Inwards_9_;Lead_Time_Inwards[9])
            {
            }
            column(Total_Procurement__Control1000000003;"Total Procurement")
            {
            }
            column(Purch__Rcpt__Header__COUNT_Control1102154025;"Purch. Rcpt. Header".COUNT)
            {
            }
            column(Item_Inwards__Control1102154026;"Item Inwards")
            {
            }
            column(Problematic_Inwards__Control1102154027;"Problematic Inwards")
            {
            }
            column(Lead_Inwards__1__Control1102154078;"Lead Inwards"[1])
            {
            }
            column(Lead_Inwards__1___Item_Inwards__Control1102154079;"Lead Inwards"[1]/"Item Inwards")
            {
            }
            column(Lead_Inwards__2__Control1102154088;"Lead Inwards"[2])
            {
            }
            column(Lead_Inwards__2___Item_Inwards__Control1102154089;"Lead Inwards"[2]/"Item Inwards")
            {
            }
            column(Lead_Inwards__3__Control1102154091;"Lead Inwards"[3])
            {
            }
            column(Lead_Inwards__3___Item_Inwards__Control1102154092;"Lead Inwards"[3]/"Item Inwards")
            {
            }
            column(Lead_Inwards__4__Control1102154094;"Lead Inwards"[4])
            {
            }
            column(Lead_Inwards__4___Item_Inwards__Control1102154095;"Lead Inwards"[4]/"Item Inwards")
            {
            }
            column(Lead_Inwards__5__Control1102154097;"Lead Inwards"[5])
            {
            }
            column(Lead_Inwards__5___Item_Inwards__Control1102154098;"Lead Inwards"[5]/"Item Inwards")
            {
            }
            column(Lead_Inwards__6__Control1102154100;"Lead Inwards"[6])
            {
            }
            column(Lead_Inwards__6___Item_Inwards__Control1102154101;"Lead Inwards"[6]/"Item Inwards")
            {
            }
            column(Leads_Inwards_1__1__Control1102154210;Leads_Inwards[1][1])
            {
            }
            column(Leads_Inwards_2__1__Control1102154211;Leads_Inwards[2][1])
            {
            }
            column(Leads_Inwards_3__1__Control1102154212;Leads_Inwards[3][1])
            {
            }
            column(Leads_Inwards_4__1__Control1102154219;Leads_Inwards[4][1])
            {
            }
            column(Leads_Inwards_5__1__Control1102154220;Leads_Inwards[5][1])
            {
            }
            column(Leads_Inwards_6__1__Control1102154221;Leads_Inwards[6][1])
            {
            }
            column(Leads_Inwards_7__1__Control1102154222;Leads_Inwards[7][1])
            {
            }
            column(Leads_Inwards_8__1__Control1102154223;Leads_Inwards[8][1])
            {
            }
            column(Leads_Inwards_9__1__Control1102154224;Leads_Inwards[9][1])
            {
            }
            column(Leads_Inwards_1__2__Control1102154234;Leads_Inwards[1][2])
            {
            }
            column(Leads_Inwards_2__2__Control1102154235;Leads_Inwards[2][2])
            {
            }
            column(Leads_Inwards_3__2__Control1102154236;Leads_Inwards[3][2])
            {
            }
            column(Leads_Inwards_4__2__Control1102154237;Leads_Inwards[4][2])
            {
            }
            column(Leads_Inwards_5__2__Control1102154238;Leads_Inwards[5][2])
            {
            }
            column(Leads_Inwards_6__2__Control1102154239;Leads_Inwards[6][2])
            {
            }
            column(Leads_Inwards_7__2__Control1102154240;Leads_Inwards[7][2])
            {
            }
            column(Leads_Inwards_8__2__Control1102154241;Leads_Inwards[8][2])
            {
            }
            column(Leads_Inwards_9__2__Control1102154242;Leads_Inwards[9][2])
            {
            }
            column(Leads_Inwards_9__3__Control1102154243;Leads_Inwards[9][3])
            {
            }
            column(Leads_Inwards_1__3__Control1102154244;Leads_Inwards[1][3])
            {
            }
            column(Leads_Inwards_2__3__Control1102154245;Leads_Inwards[2][3])
            {
            }
            column(Leads_Inwards_3__3__Control1102154246;Leads_Inwards[3][3])
            {
            }
            column(Leads_Inwards_4__3__Control1102154247;Leads_Inwards[4][3])
            {
            }
            column(Leads_Inwards_5__3__Control1102154248;Leads_Inwards[5][3])
            {
            }
            column(Leads_Inwards_6__3__Control1102154249;Leads_Inwards[6][3])
            {
            }
            column(Leads_Inwards_7__3__Control1102154250;Leads_Inwards[7][3])
            {
            }
            column(Leads_Inwards_8__3__Control1102154251;Leads_Inwards[8][3])
            {
            }
            column(Leads_Inwards_9__4__Control1102154252;Leads_Inwards[9][4])
            {
            }
            column(Leads_Inwards_1__4__Control1102154253;Leads_Inwards[1][4])
            {
            }
            column(Leads_Inwards_2__4__Control1102154254;Leads_Inwards[2][4])
            {
            }
            column(Leads_Inwards_3__4__Control1102154255;Leads_Inwards[3][4])
            {
            }
            column(Leads_Inwards_4__4__Control1102154256;Leads_Inwards[4][4])
            {
            }
            column(Leads_Inwards_5__4__Control1102154257;Leads_Inwards[5][4])
            {
            }
            column(Leads_Inwards_6__4__Control1102154258;Leads_Inwards[6][4])
            {
            }
            column(Leads_Inwards_7__4__Control1102154259;Leads_Inwards[7][4])
            {
            }
            column(Leads_Inwards_8__4__Control1102154260;Leads_Inwards[8][4])
            {
            }
            column(Leads_Inwards_9__5__Control1102154261;Leads_Inwards[9][5])
            {
            }
            column(Leads_Inwards_1__5__Control1102154262;Leads_Inwards[1][5])
            {
            }
            column(Leads_Inwards_2__5__Control1102154263;Leads_Inwards[2][5])
            {
            }
            column(Leads_Inwards_3__5__Control1102154264;Leads_Inwards[3][5])
            {
            }
            column(Leads_Inwards_4__5__Control1102154265;Leads_Inwards[4][5])
            {
            }
            column(Leads_Inwards_5__5__Control1102154266;Leads_Inwards[5][5])
            {
            }
            column(Leads_Inwards_6__5__Control1102154267;Leads_Inwards[6][5])
            {
            }
            column(Leads_Inwards_7__5__Control1102154268;Leads_Inwards[7][5])
            {
            }
            column(Leads_Inwards_8__5__Control1102154269;Leads_Inwards[8][5])
            {
            }
            column(Leads_Inwards_9__6__Control1102154270;Leads_Inwards[9][6])
            {
            }
            column(Leads_Inwards_1__6__Control1102154271;Leads_Inwards[1][6])
            {
            }
            column(Leads_Inwards_2__6__Control1102154272;Leads_Inwards[2][6])
            {
            }
            column(Leads_Inwards_3__6__Control1102154273;Leads_Inwards[3][6])
            {
            }
            column(Leads_Inwards_4__6__Control1102154274;Leads_Inwards[4][6])
            {
            }
            column(Leads_Inwards_5__6__Control1102154275;Leads_Inwards[5][6])
            {
            }
            column(Leads_Inwards_6__6__Control1102154276;Leads_Inwards[6][6])
            {
            }
            column(Leads_Inwards_7__6__Control1102154277;Leads_Inwards[7][6])
            {
            }
            column(Leads_Inwards_8__6__Control1102154278;Leads_Inwards[8][6])
            {
            }
            column(Leads_Inwards_9__7__Control1102154279;Leads_Inwards[9][7])
            {
            }
            column(Leads_Inwards_1__7__Control1102154280;Leads_Inwards[1][7])
            {
            }
            column(Leads_Inwards_2__7__Control1102154281;Leads_Inwards[2][7])
            {
            }
            column(Leads_Inwards_3__7__Control1102154282;Leads_Inwards[3][7])
            {
            }
            column(Leads_Inwards_4__7__Control1102154283;Leads_Inwards[4][7])
            {
            }
            column(Leads_Inwards_5__7__Control1102154284;Leads_Inwards[5][7])
            {
            }
            column(Leads_Inwards_6__7__Control1102154285;Leads_Inwards[6][7])
            {
            }
            column(Leads_Inwards_7__7__Control1102154286;Leads_Inwards[7][7])
            {
            }
            column(Leads_Inwards_8__7__Control1102154287;Leads_Inwards[8][7])
            {
            }
            column(Leads_Inwards_9__8__Control1102154288;Leads_Inwards[9][8])
            {
            }
            column(Leads_Inwards_1__8__Control1102154289;Leads_Inwards[1][8])
            {
            }
            column(Leads_Inwards_2__8__Control1102154290;Leads_Inwards[2][8])
            {
            }
            column(Leads_Inwards_3__8__Control1102154291;Leads_Inwards[3][8])
            {
            }
            column(Leads_Inwards_4__8__Control1102154292;Leads_Inwards[4][8])
            {
            }
            column(Leads_Inwards_5__8__Control1102154293;Leads_Inwards[5][8])
            {
            }
            column(Leads_Inwards_6__8__Control1102154294;Leads_Inwards[6][8])
            {
            }
            column(Leads_Inwards_7__8__Control1102154295;Leads_Inwards[7][8])
            {
            }
            column(Leads_Inwards_8__8__Control1102154296;Leads_Inwards[8][8])
            {
            }
            column(Leads_Inwards_9__9__Control1102154297;Leads_Inwards[9][9])
            {
            }
            column(Leads_Inwards_1__9__Control1102154298;Leads_Inwards[1][9])
            {
            }
            column(Leads_Inwards_2__9__Control1102154299;Leads_Inwards[2][9])
            {
            }
            column(Leads_Inwards_3__9__Control1102154300;Leads_Inwards[3][9])
            {
            }
            column(Leads_Inwards_4__9__Control1102154301;Leads_Inwards[4][9])
            {
            }
            column(Leads_Inwards_5__9__Control1102154302;Leads_Inwards[5][9])
            {
            }
            column(Leads_Inwards_6__9__Control1102154303;Leads_Inwards[6][9])
            {
            }
            column(Leads_Inwards_7__9__Control1102154304;Leads_Inwards[7][9])
            {
            }
            column(Leads_Inwards_8__9__Control1102154305;Leads_Inwards[8][9])
            {
            }
            column(Lead_Time_Inwards_2__Control1102154393;Lead_Time_Inwards[1])
            {
            }
            column(Lead_Time_Inwards_2__Control1102154394;Lead_Time_Inwards[2])
            {
            }
            column(Lead_Time_Inwards_3__Control1102154395;Lead_Time_Inwards[3])
            {
            }
            column(Lead_Time_Inwards_4__Control1102154396;Lead_Time_Inwards[4])
            {
            }
            column(Lead_Time_Inwards_5__Control1102154397;Lead_Time_Inwards[5])
            {
            }
            column(Lead_Time_Inwards_6__Control1102154398;Lead_Time_Inwards[6])
            {
            }
            column(Lead_Time_Inwards_7__Control1102154399;Lead_Time_Inwards[7])
            {
            }
            column(Lead_Time_Inwards_8__Control1102154400;Lead_Time_Inwards[8])
            {
            }
            column(Lead_Time_Inwards_9__Control1102154401;Lead_Time_Inwards[9])
            {
            }
            column(TOTAL_Caption_Control1000000045;TOTAL_Caption_Control1000000045Lbl)
            {
            }
            column(No__of_InwardsCaption_Control1102154014;No__of_InwardsCaption_Control1102154014Lbl)
            {
            }
            column(No__Of_Item_InwardsCaption;No__Of_Item_InwardsCaptionLbl)
            {
            }
            column(No__Of__Problematice_InwardsCaption;No__Of__Problematice_InwardsCaptionLbl)
            {
            }
            column(No__Of_InwardsCaption_Control1102154103;No__Of_InwardsCaption_Control1102154103Lbl)
            {
            }
            column(Of_Inwards_DeviationCaption;Of_Inwards_DeviationCaptionLbl)
            {
            }
            column(Before_Given_TimeCaption;Before_Given_TimeCaptionLbl)
            {
            }
            column(In_TimeCaption;In_TimeCaptionLbl)
            {
            }
            column(V50__DeviationCaption;V50__DeviationCaptionLbl)
            {
            }
            column(V100__DeviationCaption;V100__DeviationCaptionLbl)
            {
            }
            column(V200__DeviationCaption;V200__DeviationCaptionLbl)
            {
            }
            column(V200___DeviationCaption;V200___DeviationCaptionLbl)
            {
            }
            column(V2_DaysCaption;V2_DaysCaptionLbl)
            {
            }
            column(V4_DaysCaption;V4_DaysCaptionLbl)
            {
            }
            column(Before_Given_TimeCaption_Control1102154198;Before_Given_TimeCaption_Control1102154198Lbl)
            {
            }
            column(V7_DaysCaption;V7_DaysCaptionLbl)
            {
            }
            column(V15_DaysCaption;V15_DaysCaptionLbl)
            {
            }
            column(In_TimeCaption_Control1102154218;In_TimeCaption_Control1102154218Lbl)
            {
            }
            column(V21_DaysCaption;V21_DaysCaptionLbl)
            {
            }
            column(V25_DaysCaption;V25_DaysCaptionLbl)
            {
            }
            column(V1__5_DaysCaption;V1__5_DaysCaptionLbl)
            {
            }
            column(V30_DaysCaption;V30_DaysCaptionLbl)
            {
            }
            column(V6__10_DaysCaption;V6__10_DaysCaptionLbl)
            {
            }
            column(V45_DaysCaption;V45_DaysCaptionLbl)
            {
            }
            column(V11__20_DaysCaption;V11__20_DaysCaptionLbl)
            {
            }
            column(V45_DaysCaption_Control1102154336;V45_DaysCaption_Control1102154336Lbl)
            {
            }
            column(V21__30_DaysCaption;V21__30_DaysCaptionLbl)
            {
            }
            column(V31__40_DaysCaption;V31__40_DaysCaptionLbl)
            {
            }
            column(V41__50_DaysCaption;V41__50_DaysCaptionLbl)
            {
            }
            column(V50_DaysCaption;V50_DaysCaptionLbl)
            {
            }
            column(TotalCaption_Control1102154382;TotalCaption_Control1102154382Lbl)
            {
            }
            column(TOTAL_Caption_Control1000000004;TOTAL_Caption_Control1000000004Lbl)
            {
            }
            column(No__of_InwardsCaption_Control1102154022;No__of_InwardsCaption_Control1102154022Lbl)
            {
            }
            column(No__Of_Item_InwardsCaption_Control1102154023;No__Of_Item_InwardsCaption_Control1102154023Lbl)
            {
            }
            column(No__Of__Problematice_InwardsCaption_Control1102154024;No__Of__Problematice_InwardsCaption_Control1102154024Lbl)
            {
            }
            column(No__Of_InwardsCaption_Control1102154075;No__Of_InwardsCaption_Control1102154075Lbl)
            {
            }
            column(Of_Inwards_DeviationCaption_Control1102154076;Of_Inwards_DeviationCaption_Control1102154076Lbl)
            {
            }
            column(In_TimeCaption_Control1102154077;In_TimeCaption_Control1102154077Lbl)
            {
            }
            column(V50__DeviationCaption_Control1102154082;V50__DeviationCaption_Control1102154082Lbl)
            {
            }
            column(V100__DeviationCaption_Control1102154090;V100__DeviationCaption_Control1102154090Lbl)
            {
            }
            column(V200__DeviationCaption_Control1102154093;V200__DeviationCaption_Control1102154093Lbl)
            {
            }
            column(V200___DeviationCaption_Control1102154096;V200___DeviationCaption_Control1102154096Lbl)
            {
            }
            column(Before_Given_TimeCaption_Control1102154102;Before_Given_TimeCaption_Control1102154102Lbl)
            {
            }
            column(V2_DaysCaption_Control1102154183;V2_DaysCaption_Control1102154183Lbl)
            {
            }
            column(V4_DaysCaption_Control1102154185;V4_DaysCaption_Control1102154185Lbl)
            {
            }
            column(V7_DaysCaption_Control1102154186;V7_DaysCaption_Control1102154186Lbl)
            {
            }
            column(V15_DaysCaption_Control1102154187;V15_DaysCaption_Control1102154187Lbl)
            {
            }
            column(V21_DaysCaption_Control1102154188;V21_DaysCaption_Control1102154188Lbl)
            {
            }
            column(V25_DaysCaption_Control1102154189;V25_DaysCaption_Control1102154189Lbl)
            {
            }
            column(V30_DaysCaption_Control1102154190;V30_DaysCaption_Control1102154190Lbl)
            {
            }
            column(V45_DaysCaption_Control1102154191;V45_DaysCaption_Control1102154191Lbl)
            {
            }
            column(V45_DaysCaption_Control1102154192;V45_DaysCaption_Control1102154192Lbl)
            {
            }
            column(Before_Given_TimeCaption_Control1102154193;Before_Given_TimeCaption_Control1102154193Lbl)
            {
            }
            column(In_TimeCaption_Control1102154194;In_TimeCaption_Control1102154194Lbl)
            {
            }
            column(V1__5_DaysCaption_Control1102154195;V1__5_DaysCaption_Control1102154195Lbl)
            {
            }
            column(V6__10_DaysCaption_Control1102154202;V6__10_DaysCaption_Control1102154202Lbl)
            {
            }
            column(V11__20_DaysCaption_Control1102154203;V11__20_DaysCaption_Control1102154203Lbl)
            {
            }
            column(V21__30_DaysCaption_Control1102154204;V21__30_DaysCaption_Control1102154204Lbl)
            {
            }
            column(V31__40_DaysCaption_Control1102154205;V31__40_DaysCaption_Control1102154205Lbl)
            {
            }
            column(V41__50_DaysCaption_Control1102154206;V41__50_DaysCaption_Control1102154206Lbl)
            {
            }
            column(V50_DaysCaption_Control1102154207;V50_DaysCaption_Control1102154207Lbl)
            {
            }
            column(TotalCaption_Control1102154392;TotalCaption_Control1102154392Lbl)
            {
            }
            column(Currency_Code;Code)
            {
            }

            trigger OnAfterGetRecord();
            begin
                //Rev01 Start

                //Currency, Footer (2) - OnPreSection()
                //CurrReport.SHOWOUTPUT((Choice=Choice::Receive) AND ("Choice 2"="Choice 2"::Detail)); //Rev01
                //CurrReport.SHOWOUTPUT((ChoiceReceive) AND (Choice2Detail));
                "Posting date":="Purch. Rcpt. Header".GETFILTER("Purch. Rcpt. Header"."Posting Date");
                IF "Posting date"<>'' THEN
                  PRl.SETFILTER(PRl."Document date","Posting date");

                vendor1:="Purch. Rcpt. Header".GETFILTER("Purch. Rcpt. Header"."Pay-to Vendor No.");
                IF vendor1  <>'' THEN
                  PRl.SETRANGE(PRl."Buy-from Vendor No.",vendor1);

                vendor1:="Purch. Rcpt. Header".GETFILTER("Purch. Rcpt. Header"."Pay-to Vendor No.");
                IF vendor1  <>'' THEN
                  PRl.SETRANGE(PRl."Buy-from Vendor No.",vendor1);

                //Currency, Footer (2) - OnPreSection()

                //Currency, Footer (4) - OnPreSection()
                //CurrReport.SHOWOUTPUT((Choice=Choice::Receive) AND ("Choice 2"="Choice 2"::Brief));//Rev01
                //CurrReport.SHOWOUTPUT((ChoiceReceive) AND (Choice2Breif));
                //Currency, Footer (4) - OnPreSection()

                //Rev01 End
            end;

            trigger OnPreDataItem();
            begin
                IF NOT ChoiceReceive OR ChoiceInward THEN
                 CurrReport.BREAK;
            end;
        }
        dataitem("Purch. Rcpt. Header2";"Purch. Rcpt. Header")
        {
            DataItemTableView = SORTING(No.) ORDER(Ascending);
            RequestFilterFields = "Posting Date","No.","Pay-to Vendor No.","Order No.","Vendor Order No.","Vendor Shipment No.","Location Code";
            column(ChoiceInward;ChoiceInward)
            {
            }
            column(compinfo_Name;compinfo.Name)
            {
            }
            column(FIlt;FIlt)
            {
            }
            column(Totalamt;Totalamt)
            {
            }
            column(Amtwithtaxes;Amtwithtaxes)
            {
            }
            column("sum";sum)
            {
            }
            column(INWARD_DETAILSCaption;INWARD_DETAILSCaptionLbl)
            {
            }
            column(Vendor_Caption;Vendor_CaptionLbl)
            {
            }
            column(ORDER_NOCaption2;ORDER_NOCaptionLbl2)
            {
            }
            column(DESCRIPTIONCaption2;DESCRIPTIONCaptionLbl2)
            {
            }
            column(DC_No_Caption;DC_No_CaptionLbl)
            {
            }
            column(QuantityCaption2;QuantityCaptionLbl2)
            {
            }
            column(Lot_No_Caption;Lot_No_CaptionLbl)
            {
            }
            column(Serial_No_Caption;Serial_No_CaptionLbl)
            {
            }
            column(Unit_Cost__With_Taxes_Caption;Unit_Cost__With_Taxes_CaptionLbl)
            {
            }
            column(Unit_Cost__With_Out_Taxes_Caption;Unit_Cost__With_Out_Taxes_CaptionLbl)
            {
            }
            column(UOMCaption2;UOMCaptionLbl2)
            {
            }
            column(Purch__Rcpt__Header_No_2;"No.")
            {
            }
            dataitem("Purch. Rcpt. Line2";"Purch. Rcpt. Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemLinkReference = "Purch. Rcpt. Header2";
                DataItemTableView = SORTING(Document No.,Line No.) ORDER(Ascending) WHERE(Quantity=FILTER(>0));
                RequestFilterFields = Type,"No.","Document No.";
                column(PIL__Direct_Unit_Cost;PIL2."Direct Unit Cost")
                {
                }
                column(compinfo_Name_Control1000000017;compinfo.Name)
                {
                }
                column(CurrReport_PAGENO2;CurrReport.PAGENO)
                {
                }
                column(Purch__Rcpt__Header___Posting_Date_;"Purch. Rcpt. Header2"."Posting Date")
                {
                }
                column(Purch__Rcpt__Header___No__;"Purch. Rcpt. Header2"."No.")
                {
                }
                column(Purch__Rcpt__Header___Buy_from_Vendor_Name_;"Purch. Rcpt. Header2"."Buy-from Vendor Name")
                {
                }
                column(Purch__Rcpt__Header___Order_No__2;"Purch. Rcpt. Header2"."Order No.")
                {
                }
                column(Purch__Rcpt__Line__Purch__Rcpt__Line__Description;"Purch. Rcpt. Line2".Description)
                {
                }
                column(Purch__Rcpt__Header___Vendor_Shipment_No__2;"Purch. Rcpt. Header2"."Vendor Shipment No.")
                {
                }
                column(Purch__Rcpt__Line_Quantity2;Quantity)
                {
                }
                column(Purch__Rcpt__Line__Unit_Cost__LCY__;"Unit Cost (LCY)")
                {
                }
                column(UC2;UC2)
                {
                }
                column(DESCRIPTIONCaption_Control1000000015;DESCRIPTIONCaption_Control1000000015Lbl)
                {
                }
                column(Page_No_Caption;Page_No_CaptionLbl)
                {
                }
                column(EmptyStringCaption2;EmptyStringCaptionLbl2)
                {
                }
                column(Lot_No_Caption_Control1000000012;Lot_No_Caption_Control1000000012Lbl)
                {
                }
                column(Serial_No_Caption_Control1000000013;Serial_No_Caption_Control1000000013Lbl)
                {
                }
                column(ORDER_NOCaption_Control1000000024;ORDER_NOCaption_Control1000000024Lbl)
                {
                }
                column(DC_No_Caption_Control1000000038;DC_No_Caption_Control1000000038Lbl)
                {
                }
                column(VendorCaption2;VendorCaptionLbl2)
                {
                }
                column(Unit_Cost__With_Taxes_Caption_Control1102154003;Unit_Cost__With_Taxes_Caption_Control1102154003Lbl)
                {
                }
                column(Unit_Cost__With_Out_Taxes_Caption_Control1102154004;Unit_Cost__With_Out_Taxes_Caption_Control1102154004Lbl)
                {
                }
                column(QuantityCaption_Control1102154010;QuantityCaption_Control1102154010Lbl)
                {
                }
                column(UOMCaption_Control1102154019;UOMCaption_Control1102154019Lbl)
                {
                }
                column(Purch__Rcpt__Line_Document_No_2;"Document No.")
                {
                }
                column(Purch__Rcpt__Line_Line_No_2;"Line No.")
                {
                }
                column(Purch__Rcpt__Line_No_;"No.")
                {
                }
                column(Type;"Purch. Rcpt. Line2".Type)
                {
                }
                column(test;Test)
                {
                }
                dataitem("Item Ledger Entry";"Item Ledger Entry")
                {
                    DataItemLink = Document No.=FIELD(Document No.),Item No.=FIELD(No.);
                    DataItemLinkReference = "Purch. Rcpt. Line2";
                    DataItemTableView = SORTING(Document No.,Item No.,Posting Date) ORDER(Ascending) WHERE(Quantity=FILTER(>0));
                    RequestFilterFields = "Lot No.";
                    column(Purch__Rcpt__Header___No___Control1102154000;"Purch. Rcpt. Header2"."No.")
                    {
                    }
                    column(Purch__Rcpt__Header___Posting_Date__Control1102154002;"Purch. Rcpt. Header2"."Posting Date")
                    {
                    }
                    column(UC_Control1000000027;UC)
                    {
                    }
                    column(Item_Ledger_Entry__Item_Ledger_Entry___Serial_No__;"Item Ledger Entry"."Serial No.")
                    {
                    }
                    column(Item_Ledger_Entry__Item_Ledger_Entry___Lot_No__;"Item Ledger Entry"."Lot No.")
                    {
                    }
                    column(Item_Ledger_Entry__Item_Ledger_Entry__Quantity;"Item Ledger Entry".Quantity)
                    {
                    }
                    column(Purch__Rcpt__Header___Vendor_Shipment_No___Control1000000041;"Purch. Rcpt. Header2"."Vendor Shipment No.")
                    {
                    }
                    column(Purch__Rcpt__Line__Description;"Purch. Rcpt. Line2".Description)
                    {
                    }
                    column(Purch__Rcpt__Header___Order_No___Control1000000051;"Purch. Rcpt. Header2"."Order No.")
                    {
                    }
                    column(Purch__Rcpt__Header___Buy_from_Vendor_Name__Control1000000052;"Purch. Rcpt. Header2"."Buy-from Vendor Name")
                    {
                    }
                    column(Purch__Rcpt__Line___Unit_Cost__LCY__;"Purch. Rcpt. Line2"."Unit Cost (LCY)")
                    {
                    }
                    column(Item_Ledger_Entry__Unit_of_Measure_Code_;"Unit of Measure Code")
                    {
                    }
                    column(Item_Ledger_Entry_Entry_No_;"Entry No.")
                    {
                    }
                    column(Item_Ledger_Entry_Document_No_;"Document No.")
                    {
                    }
                    column(Item_Ledger_Entry_Item_No_;"Item No.")
                    {
                    }
                    column(NewOrder;"New Order")
                    {
                    }

                    trigger OnAfterGetRecord();
                    begin
                        //Hack
                        /*ItemEntryRelation.SETCURRENTKEY("Source ID","Source Type");
                        ItemEntryRelation.SETRANGE("Source Type",DATABASE::"Purch. Rcpt. Line2");
                        ItemEntryRelation.SETRANGE("Source Subtype",0);
                        ItemEntryRelation.SETRANGE("Source ID","Purch. Rcpt. Line2"."Document No.");
                        ItemEntryRelation.SETRANGE("Source Batch Name",'');
                        ItemEntryRelation.SETRANGE("Source Prod. Order Line",0);
                        ItemEntryRelation.SETRANGE("Source Ref. No.","Purch. Rcpt. Line2"."Line No.");
                        IF ItemEntryRelation.FINDSET THEN BEGIN
                           IF ("Item Ledger Entry"."Entry No." <> ItemEntryRelation."Item Entry No.") THEN
                            CurrReport.SKIP;
                        END;*/
                        
                        //Hack
                        
                        
                        //Item Ledger Entry, Body (3) - OnPreSection()
                        "Invoiced Date":=0D;
                        AMT:=0;
                        UC2:=0;
                        AMT:=PIL2."Amount To Vendor";
                        
                        PIH2.SETRANGE(PIH2."Buy-from Vendor No.","Purch. Rcpt. Header2"."Pay-to Vendor No.");     // Find the Purchase Invoice header
                        PIH2.SETRANGE(PIH2."Vendor Invoice No.","Purch. Rcpt. Header2"."Vendor Order No.");
                        IF PIH2.FIND('-') THEN
                            "Invoiced Date":=PIH2."Posting Date";
                        PIL2.SETCURRENTKEY(PIL2.Type,PIL2."No.",PIL2."Variant Code");
                        PIL2.SETRANGE(PIL2."No.","Purch. Rcpt. Line2"."No.");
                        PIL2.SETRANGE(PIL2."Buy-from Vendor No.","Purch. Rcpt. Header2"."Buy-from Vendor No.");
                        PIL2.SETRANGE(PIL2.Quantity,"Purch. Rcpt. Line2".Quantity);
                        PIL2.SETRANGE(PIL2."Receipt No.","Purch. Rcpt. Header2"."No.");
                        IF PIL2.FIND('-') THEN BEGIN
                          IF PIL2."Gen. Bus. Posting Group"<>'FOREIGN'THEN
                             UC2:=PIL2."Amount To Vendor"/PIL2.Quantity
                          ELSE BEGIN
                            Structure_Amount2:=0;
                            StrOrdLineDetails2.SETRANGE(StrOrdLineDetails2.Type,StrOrdLineDetails2.Type::Purchase);
                            StrOrdLineDetails2.SETRANGE(StrOrdLineDetails2."Document Type",StrOrdLineDetails2."Document Type"::Invoice);
                            StrOrdLineDetails2.SETRANGE(StrOrdLineDetails2."Invoice No.",PIL2."Document No.");
                            StrOrdLineDetails2.SETRANGE(StrOrdLineDetails2."Line No.",PIL2."Line No.");
                            IF StrOrdLineDetails2.FIND('-') THEN
                            REPEAT
                              IF StrOrdLineDetails2."Tax/Charge Type"<>StrOrdLineDetails2."Tax/Charge Type"::Dummy THEN
                                 Structure_Amount2+=StrOrdLineDetails2."Amount (LCY)"
                              ELSE
                                 Structure_Amount2+=StrOrdLineDetails2."Calculation Value";
                            UNTIL StrOrdLineDetails2.NEXT=0;
                            UC2:=((PIL2."Unit Cost (LCY)"*PIL2.Quantity)+Structure_Amount2)/
                                                    PIL2.Quantity;
                          END;
                        END;
                        
                          IF "Item Ledger Entry"."Serial No." <>'' THEN
                              AMT:=UC2;
                          Line_Total:="Purch. Rcpt. Line2".Quantity*UC2;
                          "TOT AMT"+=Line_Total;
                         "New Order":=FALSE;
                         sum := sum+"Item Ledger Entry".Quantity;
                        //Item Ledger Entry, Body (3) - OnPreSection()

                    end;

                    trigger OnPreDataItem();
                    begin
                        //Rev01

                        //Item Ledger Entry, Body (2) - OnPreSection()
                        //CurrReport.SHOWOUTPUT("New Order");
                        //Item Ledger Entry, Body (2) - OnPreSection()
                    end;
                }

                trigger OnAfterGetRecord();
                begin
                     Line_Total:=0;
                    //Rev01
                    
                    /*
                    //Purch. Rcpt. Line, Header (1) - OnPreSection()
                    IF  "Item Ledger Entry".COUNT = 0  THEN
                      CurrReport.SHOWOUTPUT :=FALSE
                    ELSE BEGIN
                      CurrReport.SHOWOUTPUT:=TRUE;
                    END;
                    //Purch. Rcpt. Line, Header (1) - OnPreSection()
                    */
                    
                    Test:=0;
                    //Purch. Rcpt. Line, GroupHeader (3) - OnPreSection()
                     //CurrReport.SHOWOUTPUT("Purch. Rcpt. Line".Type<>"Purch. Rcpt. Line".Type::Item);
                    //Purch. Rcpt. Line, GroupHeader (3) - OnPreSection()
                    
                    //Purch. Rcpt. Line, Body (4) - OnPreSection()
                    IF "Purch. Rcpt. Line2".Type<>"Purch. Rcpt. Line2".Type::Item THEN
                    BEGIN
                      Test:=10;
                      PIL2.SETCURRENTKEY(PIL2.Type,PIL2."No.",PIL2."Variant Code");
                      PIL2.SETRANGE(PIL2."No.","Purch. Rcpt. Line2"."No.");
                      PIL2.SETRANGE(PIL2."Buy-from Vendor No.","Purch. Rcpt. Header2"."Buy-from Vendor No.");
                      PIL2.SETRANGE(PIL2.Quantity,"Purch. Rcpt. Line2".Quantity);
                      PIL2.SETRANGE(PIL2."Receipt No.","Purch. Rcpt. Header2"."No.");
                      IF PIL2.FIND('-') THEN BEGIN
                        IF PIL2."Gen. Bus. Posting Group"<>'FOREIGN' THEN
                           UC2:=PIL2."Amount To Vendor"/PIL2.Quantity
                        ELSE BEGIN
                          Structure_Amount2:=0;
                          StrOrdLineDetails2.SETRANGE(StrOrdLineDetails2.Type,StrOrdLineDetails2.Type::Purchase);
                          StrOrdLineDetails2.SETRANGE(StrOrdLineDetails2."Document Type",StrOrdLineDetails2."Document Type"::Invoice);
                          StrOrdLineDetails2.SETRANGE(StrOrdLineDetails2."Invoice No.",PIL2."Document No.");
                          StrOrdLineDetails2.SETRANGE(StrOrdLineDetails2."Line No.",PIL2."Line No.");
                          IF StrOrdLineDetails2.FIND('-') THEN
                          REPEAT
                            IF StrOrdLineDetails2."Tax/Charge Type"<>StrOrdLineDetails2."Tax/Charge Type"::Dummy THEN
                               Structure_Amount2+=StrOrdLineDetails2."Amount (LCY)"
                            ELSE
                               Structure_Amount2+=StrOrdLineDetails2."Calculation Value";
                          UNTIL StrOrdLineDetails2.NEXT=0;
                          UC2:=((PIL2."Unit Cost (LCY)"*PIL2.Quantity)+Structure_Amount2)/
                                                  PIL2.Quantity;
                        END;
                    
                       Totalamt := Totalamt+PIL2."Direct Unit Cost";
                       Amtwithtaxes := Amtwithtaxes+UC2;
                      END;
                    END;
                    //Purch. Rcpt. Line, Body (4) - OnPreSection()

                end;

                trigger OnPreDataItem();
                begin
                    
                    //Purch. Rcpt. Line, Header (1) - OnPreSection()
                    /*IF  "Item Ledger Entry".COUNT = 0  THEN
                      CurrReport.SHOWOUTPUT :=FALSE
                    ELSE BEGIN
                      CurrReport.SHOWOUTPUT:=TRUE;
                    END;
                    */
                    //Purch. Rcpt. Line, Header (1) - OnPreSection()
                    
                     //aded by swathi on 26-sep-13

                end;
            }

            trigger OnAfterGetRecord();
            begin
                "TOT AMT":=0;
                "New Order":=TRUE;
            end;

            trigger OnPreDataItem();
            begin
                IF NOT ChoiceInward THEN
                 CurrReport.BREAK;

                sum:=0;
                FIlt:="Purch. Rcpt. Header2".GETFILTERS;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    group("Inward Details")
                    {
                        Caption = 'Inward Details';
                        group(Control1000000000)
                        {
                            ShowCaption = false;
                            field(InwardDetails;ChoiceInward)
                            {
                                Caption = 'Inward Details';

                                trigger OnValidate();
                                begin
                                    IF ChoiceInward =TRUE THEN BEGIN
                                     PWOReport :=FALSE;
                                    END;
                                end;
                            }
                        }
                    }
                    group("Period Wise Order")
                    {
                        Caption = 'Period Wise Order';
                        group(Control1102152012)
                        {
                            ShowCaption = false;
                            field("Order";ChoiceOrder)
                            {

                                trigger OnValidate();
                                begin
                                    IF ChoiceOrder = TRUE THEN BEGIN
                                      ChoiceReceive := FALSE
                                    END;
                                end;
                            }
                            field(Brief;Choice3Breif)
                            {

                                trigger OnValidate();
                                begin
                                    IF Choice3Breif = TRUE THEN BEGIN
                                      ChoiceOrder := TRUE;
                                      Choice3Detail := FALSE;
                                      ChoiceReceive := FALSE;
                                    END ELSE
                                      ChoiceOrder := FALSE;
                                end;
                            }
                            field(Detail;Choice3Detail)
                            {

                                trigger OnValidate();
                                begin
                                    IF Choice3Detail = TRUE THEN BEGIN
                                      ChoiceOrder := TRUE;
                                      Choice3Breif := FALSE;
                                      ChoiceReceive := FALSE;
                                    END ELSE
                                      ChoiceOrder := FALSE
                                end;
                            }
                        }
                        grid(Control1102152023)
                        {
                            GridLayout = Rows;
                            ShowCaption = false;
                            group(Control1102152011)
                            {
                                ShowCaption = false;
                                field(Receive1;'')
                                {
                                    Caption = 'InWards';
                                    ShowCaption = false;
                                }
                                field(ReceiveReport;ChoiceReceive)
                                {
                                    Caption = 'InWards';
                                    ShowCaption = false;

                                    trigger OnValidate();
                                    begin
                                        IF ChoiceReceive = TRUE THEN
                                          ChoiceOrder := FALSE
                                    end;
                                }
                            }
                            group(Control1102152022)
                            {
                                ShowCaption = false;
                                field(Detail2a;'')
                                {
                                    Caption = 'Detail';
                                    ShowCaption = false;
                                }
                                field(Detail2;Choice2Detail)
                                {
                                    Caption = 'Detail';
                                    ShowCaption = false;

                                    trigger OnValidate();
                                    begin
                                        IF Choice2Detail = TRUE THEN BEGIN
                                          ChoiceReceive := TRUE;
                                          ChoiceOrder := FALSE;
                                          Choice2Breif := FALSE;
                                          Choice2Pending := FALSE;
                                          Choice2Week := FALSE;
                                        END ELSE
                                          ChoiceReceive := FALSE;
                                    end;
                                }
                            }
                            group(Control1102152033)
                            {
                                ShowCaption = false;
                                field(Brief2A;'')
                                {
                                    Caption = 'Brief';
                                    ShowCaption = false;
                                }
                                field(Brief2;Choice2Breif)
                                {
                                    Caption = 'Brief';
                                    ShowCaption = false;

                                    trigger OnValidate();
                                    begin
                                        IF Choice2Breif = TRUE THEN BEGIN
                                          ChoiceReceive := TRUE;
                                          ChoiceOrder := FALSE;
                                          Choice2Detail := FALSE;
                                          Choice2Pending := FALSE;
                                          Choice2Week := FALSE;
                                        END ELSE
                                          ChoiceReceive := FALSE;
                                    end;
                                }
                                field("Calculate Tax Structures1";'')
                                {
                                    Caption = 'Calculate Tax Structures';
                                    ShowCaption = false;
                                }
                                field("Calculate Tax Structures";CalculateStructures)
                                {
                                    ShowCaption = false;
                                }
                            }
                            group(Control1102152025)
                            {
                                ShowCaption = false;
                                field("Pending Invoices1";'')
                                {
                                    Caption = 'Pending Invoices';
                                    ShowCaption = false;
                                }
                                field("Pending Invoices";Choice2Pending)
                                {
                                    ShowCaption = false;

                                    trigger OnValidate();
                                    begin
                                        IF Choice2Pending = TRUE THEN BEGIN
                                          ChoiceReceive := TRUE;
                                          Choice2Detail := FALSE;
                                          Choice2Breif := FALSE;
                                          ChoiceOrder := FALSE;
                                          Choice2Week := FALSE;
                                        END ELSE
                                          ChoiceReceive := FALSE;
                                    end;
                                }
                                field("Store Pending1";'')
                                {
                                    Caption = 'Store Pending';
                                    ShowCaption = false;
                                }
                                field("Store Pending";"Store Pending")
                                {
                                    ShowCaption = false;
                                }
                            }
                            group(Control1102152029)
                            {
                                ShowCaption = false;
                                field(Control1102152031;'')
                                {
                                    ShowCaption = false;
                                }
                                field(Control1102152030;'')
                                {
                                    ShowCaption = false;
                                }
                                field("Purchase Pending1";'')
                                {
                                    Caption = 'Purchase Pending';
                                    ShowCaption = false;
                                }
                                field("Purchase Pending";"Purchase Pending")
                                {
                                    ShowCaption = false;
                                }
                            }
                            group(Control1102152018)
                            {
                                ShowCaption = false;
                                field("Week Wise Bill Forward1";'')
                                {
                                    Caption = 'Week Wise Bill Forward';
                                    ShowCaption = false;
                                }
                                field("Week Wise Bill Forward";Choice2Week)
                                {
                                    ShowCaption = false;

                                    trigger OnValidate();
                                    begin
                                        IF Choice2Week = TRUE THEN BEGIN
                                          ChoiceReceive := TRUE;
                                          ChoiceOrder := FALSE;
                                          Choice2Pending := FALSE;
                                          Choice2Breif := FALSE;
                                          Choice2Detail := FALSE;
                                        END ELSE
                                          ChoiceReceive := FALSE;
                                    end;
                                }
                                field(Period1;'')
                                {
                                    Caption = 'Period';
                                    ShowCaption = false;
                                }
                                field(Period;Period_Length)
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
                        group(Control1102152021)
                        {
                            ShowCaption = false;
                            field(Excel;Excel)
                            {
                                Caption = 'Excel (Only For Received (Detail) Report)';
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
        "Store Pending":=TRUE;
        "Purchase Pending":=TRUE;
         PWOReport:=FALSE;
        //Order.Visible:=FALSE;
    end;

    trigger OnPostReport();
    begin
        IF (Excel)  THEN
        BEGIN
          /*
          //Tempexcelbuffer.CreateSheet('"Production BOM Header"."No."','',COMPANYNAME,''); //Rev01
          Tempexcelbuffer.CreateBook('"Production BOM Header"."No."',''); //EFFUPG
          Tempexcelbuffer.WriteSheet('"Production BOM Header"."No."',COMPANYNAME,USERID);
          Tempexcelbuffer.OpenExcel;
          Tempexcelbuffer.CloseBook;
          Tempexcelbuffer.GiveUserControl;
          */
          Tempexcelbuffer.CreateBookAndOpenExcel('','"Production BOM Header"."No."','"Production BOM Header"."No."',COMPANYNAME,USERID); //EFFUPG
        END;

    end;

    trigger OnPreReport();
    begin
        //IF Choice=Choice::Order THEN //Rev01
        IF NOT ChoiceInward THEN BEGIN
         IF ChoiceOrder THEN
          "Order Filter":="Purchase Header".GETFILTERS
         ELSE
          "Bill Fiter":="Purch. Rcpt. Header".GETFILTERS;
        END;
    end;

    var
        "Toal Purchases" : Decimal;
        vendor : Record Vendor;
        Name : Text[200];
        "Total Procurement" : Decimal;
        Choice : Option "Order",Receive;
        "Line Procurement" : Decimal;
        "Line Purchase" : Decimal;
        "Lead Time" : Integer;
        "Order Filter" : Text[200];
        "Bill Fiter" : Text[200];
        PL : Record "Purchase Line";
        "Choice 2" : Option Detail,Brief,PENDING,Week;
        Line_TOT : Decimal;
        Order_TOT : Decimal;
        UC : Decimal;
        IUC : Decimal;
        PIV : Record "Purch. Inv. Line";
        Tot : Decimal;
        TOT_PEND_INV : Decimal;
        Order_Inward : Decimal;
        Expected_Date : Date;
        Orders : array [8] of Integer;
        Choice3 : Option Brief,Detail;
        Order_Value : array [8] of Decimal;
        Delay : Integer;
        Tmp_date : Date;
        "Total_Order Value" : Decimal;
        I : Integer;
        "RECEIVED vALUE" : Decimal;
        "PENDING VALUE" : Decimal;
        "Given Lead Time" : Integer;
        Tempexcelbuffer : Record "Excel Buffer" temporary;
        Excel : Boolean;
        ROW : Integer;
        Inwards : Integer;
        "Item Inwards" : Integer;
        "Problematic Inwards" : Integer;
        PRl : Record "Purch. Rcpt. Line";
        "S. No." : Integer;
        "Posting date" : Text[1000];
        vendor1 : Text[1000];
        "Location Code" : Text[1000];
        Deviation : Integer;
        Department : Text[30];
        Pending : Integer;
        "Store Pending" : Boolean;
        "Purchase Pending" : Boolean;
        From_Date : Date;
        To_Date : Date;
        Period_Length : Text[30];
        Max_Date : Date;
        Min_Date : Date;
        "No. Of Bills" : Integer;
        Week_value : Decimal;
        Inward_Value : Decimal;
        "Purchase Deviation" : Integer;
        "Lead Inwards" : array [6] of Integer;
        Given_Lead_Temp : Integer;
        Lead_Temp : Integer;
        Vendor_inwards : Integer;
        vendor_leadtime : Decimal;
        "Total Bills" : Integer;
        InwardDateTime : Text[30];
        Item : Record Item;
        Leads_Inwards : array [10,10] of Integer;
        STD_Lead_Time : Integer;
        Diff_Lead_Time : Integer;
        LeadTemp : Text[30];
        CNT : Integer;
        Lead_Time_Inwards : array [10] of Integer;
        StrOrdLineDetails : Record "Structure Order Line Details";
        Structure_Amount : Decimal;
        PIH : Record "Purch. Inv. Header";
        "Posted Str Order Line Details" : Record "Posted Str Order Line Details";
        CalculateStructures : Boolean;
        ExciseAmount : Decimal;
        Charges : Decimal;
        Othertaxes : Decimal;
        SalesTax : Decimal;
        ServiceTax : Decimal;
        LineTotAmt : Decimal;
        VATAmount : Decimal;
        Period_Wise_OrdersCaptionLbl : Label 'Period Wise Orders';
        Order_ValueCaptionLbl : Label 'Order Value';
        Order_NoCaptionLbl : Label 'Order No';
        Vendor_No_CaptionLbl : Label 'Vendor No.';
        Vendor_NameCaptionLbl : Label 'Vendor Name';
        Inward_ValueCaptionLbl : Label 'Inward Value';
        Expected_Reciept_DateCaptionLbl : Label 'Expected Reciept Date';
        Total__OrdersCaptionLbl : Label 'Total  Orders';
        Completly_InwardedCaptionLbl : Label 'Completly Inwarded';
        Partially_Inwarded_CaptionLbl : Label '"Partially Inwarded "';
        V1__7_DaysCaptionLbl : Label '1..7 Days';
        V8__15_DaysCaptionLbl : Label '8..15 Days';
        V16__25_DaysCaptionLbl : Label '16..25 Days';
        V25__DaysCaptionLbl : Label '25< Days';
        PendingCaptionLbl : Label 'Pending';
        ReceivedCaptionLbl : Label 'Received';
        PendingCaption_Control1000000111Lbl : Label 'Pending';
        TOTAL_CaptionLbl : Label '"TOTAL "';
        OrdersCaptionLbl : Label 'Orders';
        ValueCaptionLbl : Label 'Value';
        Received_ValueCaptionLbl : Label 'Received Value';
        Pending_ValueCaptionLbl : Label 'Pending Value';
        Total_Ordered_ValueCaptionLbl : Label 'Total Ordered Value';
        Period_Wise_ProcurementsCaptionLbl : Label 'Period Wise Procurements';
        Period_Wise_ProcurementsCaption_Control1102154004Lbl : Label 'Period Wise Procurements';
        Pending_InvoicesCaptionLbl : Label 'Pending Invoices';
        Purchase_Pending_InvoicesCaptionLbl : Label 'Purchase Pending Invoices';
        Store_Pending_InvoicesCaptionLbl : Label 'Store Pending Invoices';
        Week_Wise_Bill_ForwardsCaptionLbl : Label 'Week Wise Bill Forwards';
        AmountCaptionLbl : Label 'Amount';
        Vendor_NameCaption_Control1000000038Lbl : Label 'Vendor Name';
        Order_NoCaption_Control1000000039Lbl : Label 'Order No';
        Actual_Lead_TimeCaptionLbl : Label 'Actual Lead Time';
        Given_Lead_TimeCaptionLbl : Label 'Given Lead Time';
        Unit_CostCaptionLbl : Label 'Unit Cost';
        UOMCaptionLbl : Label 'UOM';
        QTYCaptionLbl : Label 'QTY';
        DescriptionCaptionLbl : Label 'Description';
        Item_No_CaptionLbl : Label 'Item No.';
        TotalCaptionLbl : Label 'Total';
        Invoice_CostCaptionLbl : Label 'Invoice Cost';
        Given_Lead_TimeCaption_Control1102154029Lbl : Label 'Given Lead Time';
        Actual_Lead_TimeCaption_Control1102154030Lbl : Label 'Actual Lead Time';
        Unit_CostCaption_Control1000000067Lbl : Label 'Unit Cost';
        UOMCaption_Control1000000068Lbl : Label 'UOM';
        QuantityCaptionLbl : Label 'Quantity';
        DescriptionCaption_Control1000000070Lbl : Label 'Description';
        Item_No_Caption_Control1000000072Lbl : Label 'Item No.';
        Order_NoCaption_Control1000000075Lbl : Label '" Order No"';
        VendorCaptionLbl : Label 'Vendor';
        Shpmt_No_CaptionLbl : Label '" Shpmt No."';
        Total_ValueCaptionLbl : Label 'Total Value';
        Inward_DateCaptionLbl : Label 'Inward Date';
        Store_DeviationCaptionLbl : Label 'Store Deviation';
        ReasonCaptionLbl : Label 'Reason';
        Bill_Transfered_DateCaptionLbl : Label 'Bill Transfered Date';
        Purchase_DeviationCaptionLbl : Label 'Purchase Deviation';
        DepartmentCaptionLbl : Label 'Department';
        Unit_CostCaption_Control1102154142Lbl : Label 'Unit Cost';
        UOMCaption_Control1102154143Lbl : Label 'UOM';
        QuantityCaption_Control1102154144Lbl : Label 'Quantity';
        DescriptionCaption_Control1102154145Lbl : Label 'Description';
        Item_No_Caption_Control1102154146Lbl : Label 'Item No.';
        Order_NoCaption_Control1102154147Lbl : Label '" Order No"';
        VendorCaption_Control1102154148Lbl : Label 'Vendor';
        Shpmt_No_Caption_Control1102154149Lbl : Label '" Shpmt No."';
        Total_ValueCaption_Control1102154150Lbl : Label 'Total Value';
        Inward_DateCaption_Control1102154152Lbl : Label 'Inward Date';
        Store_DeviationCaption_Control1102154153Lbl : Label 'Store Deviation';
        ReasonCaption_Control1102154155Lbl : Label 'Reason';
        Bill_Transfered_DateCaption_Control1102154156Lbl : Label 'Bill Transfered Date';
        Purchase_DeviationCaption_Control1102154157Lbl : Label 'Purchase Deviation';
        Unit_CostCaption_Control1102154124Lbl : Label 'Unit Cost';
        UOMCaption_Control1102154154Lbl : Label 'UOM';
        QuantityCaption_Control1102154168Lbl : Label 'Quantity';
        DescriptionCaption_Control1102154173Lbl : Label 'Description';
        Item_No_Caption_Control1102154174Lbl : Label 'Item No.';
        Order_NoCaption_Control1102154175Lbl : Label '" Order No"';
        VendorCaption_Control1102154176Lbl : Label 'Vendor';
        Shpmt_No_Caption_Control1102154177Lbl : Label '" Shpmt No."';
        Total_ValueCaption_Control1102154178Lbl : Label 'Total Value';
        Inward_DateCaption_Control1102154179Lbl : Label 'Inward Date';
        Store_DeviationCaption_Control1102154180Lbl : Label 'Store Deviation';
        ReasonCaption_Control1102154181Lbl : Label 'Reason';
        No__Of_BillsCaptionLbl : Label 'No. Of Bills';
        PeriodCaptionLbl : Label 'Period';
        ValueCaption_Control1102154053Lbl : Label 'Value';
        VendorCaption_Control1000000049Lbl : Label 'Vendor';
        Inward_Date_Time__CaptionLbl : Label 'Inward Date Time :';
        No__Of_InwardsCaptionLbl : Label 'No. Of Inwards';
        DeviationCaptionLbl : Label 'Deviation';
        EmptyStringCaptionLbl : Label '%';
        Total_Pending_Invoice_ValueCaptionLbl : Label 'Total Pending Invoice Value';
        No__Of__Pending_BillsCaptionLbl : Label 'No. Of  Pending Bills';
        DaysCaptionLbl : Label 'Days';
        DaysCaption_Control1102154061Lbl : Label 'Days';
        DaysCaption_Control1102154123Lbl : Label 'Days';
        DaysCaption_Control1102154127Lbl : Label 'Days';
        DaysCaption_Control1102154167Lbl : Label 'Days';
        TotalCaption_Control1000000012Lbl : Label 'Total';
        ToCaptionLbl : Label 'To';
        TOTAL_Caption_Control1000000045Lbl : Label '"TOTAL "';
        No__of_InwardsCaption_Control1102154014Lbl : Label 'No. of Inwards';
        No__Of_Item_InwardsCaptionLbl : Label 'No. Of Item Inwards';
        No__Of__Problematice_InwardsCaptionLbl : Label 'No. Of  Problematice Inwards';
        No__Of_InwardsCaption_Control1102154103Lbl : Label 'No. Of Inwards';
        Of_Inwards_DeviationCaptionLbl : Label '% Of Inwards Deviation';
        Before_Given_TimeCaptionLbl : Label 'Before Given Time';
        In_TimeCaptionLbl : Label 'In Time';
        V50__DeviationCaptionLbl : Label '<50% Deviation';
        V100__DeviationCaptionLbl : Label '<100% Deviation';
        V200__DeviationCaptionLbl : Label '<200% Deviation';
        V200___DeviationCaptionLbl : Label '>200 % Deviation';
        V2_DaysCaptionLbl : Label '2 Days';
        V4_DaysCaptionLbl : Label '4 Days';
        Before_Given_TimeCaption_Control1102154198Lbl : Label 'Before Given Time';
        V7_DaysCaptionLbl : Label '7 Days';
        V15_DaysCaptionLbl : Label '15 Days';
        In_TimeCaption_Control1102154218Lbl : Label 'In Time';
        V21_DaysCaptionLbl : Label '21 Days';
        V25_DaysCaptionLbl : Label '25 Days';
        V1__5_DaysCaptionLbl : Label '1..5 Days';
        V30_DaysCaptionLbl : Label '30 Days';
        V6__10_DaysCaptionLbl : Label '6..10 Days';
        V45_DaysCaptionLbl : Label '45 Days';
        V11__20_DaysCaptionLbl : Label '11..20 Days';
        V45_DaysCaption_Control1102154336Lbl : Label '>45 Days';
        V21__30_DaysCaptionLbl : Label '21..30 Days';
        V31__40_DaysCaptionLbl : Label '31..40 Days';
        V41__50_DaysCaptionLbl : Label '41..50 Days';
        V50_DaysCaptionLbl : Label '>50 Days';
        TotalCaption_Control1102154382Lbl : Label 'Total';
        TOTAL_Caption_Control1000000004Lbl : Label '"TOTAL "';
        No__of_InwardsCaption_Control1102154022Lbl : Label 'No. of Inwards';
        No__Of_Item_InwardsCaption_Control1102154023Lbl : Label 'No. Of Item Inwards';
        No__Of__Problematice_InwardsCaption_Control1102154024Lbl : Label 'No. Of  Problematice Inwards';
        No__Of_InwardsCaption_Control1102154075Lbl : Label 'No. Of Inwards';
        Of_Inwards_DeviationCaption_Control1102154076Lbl : Label '% Of Inwards Deviation';
        In_TimeCaption_Control1102154077Lbl : Label 'In Time';
        V50__DeviationCaption_Control1102154082Lbl : Label '<50% Deviation';
        V100__DeviationCaption_Control1102154090Lbl : Label '<100% Deviation';
        V200__DeviationCaption_Control1102154093Lbl : Label '<200% Deviation';
        V200___DeviationCaption_Control1102154096Lbl : Label '>200 % Deviation';
        Before_Given_TimeCaption_Control1102154102Lbl : Label 'Before Given Time';
        V2_DaysCaption_Control1102154183Lbl : Label '2 Days';
        V4_DaysCaption_Control1102154185Lbl : Label '4 Days';
        V7_DaysCaption_Control1102154186Lbl : Label '7 Days';
        V15_DaysCaption_Control1102154187Lbl : Label '15 Days';
        V21_DaysCaption_Control1102154188Lbl : Label '21 Days';
        V25_DaysCaption_Control1102154189Lbl : Label '25 Days';
        V30_DaysCaption_Control1102154190Lbl : Label '30 Days';
        V45_DaysCaption_Control1102154191Lbl : Label '45 Days';
        V45_DaysCaption_Control1102154192Lbl : Label '>45 Days';
        Before_Given_TimeCaption_Control1102154193Lbl : Label 'Before Given Time';
        In_TimeCaption_Control1102154194Lbl : Label 'In Time';
        V1__5_DaysCaption_Control1102154195Lbl : Label '1..5 Days';
        V6__10_DaysCaption_Control1102154202Lbl : Label '6..10 Days';
        V11__20_DaysCaption_Control1102154203Lbl : Label '11..20 Days';
        V21__30_DaysCaption_Control1102154204Lbl : Label '21..30 Days';
        V31__40_DaysCaption_Control1102154205Lbl : Label '31..40 Days';
        V41__50_DaysCaption_Control1102154206Lbl : Label '41..50 Days';
        V50_DaysCaption_Control1102154207Lbl : Label '>50 Days';
        TotalCaption_Control1102154392Lbl : Label 'Total';
        "-Rev01-" : Integer;
        ChoiceOrder : Boolean;
        ChoiceReceive : Boolean;
        Choice2Detail : Boolean;
        Choice2Breif : Boolean;
        Choice2Pending : Boolean;
        Choice2Week : Boolean;
        Choice3Breif : Boolean;
        Choice3Detail : Boolean;
        ChoiceInward : Boolean;
        PurchRcptLineBody1 : Boolean;
        Prev_Vendor : Code[20];
        Prev_VendorFoot : Code[20];
        counter : Integer;
        compinfo : Record "Company Information";
        PIL2 : Record "Purch. Inv. Line";
        PIH2 : Record "Purch. Inv. Header";
        UC2 : Decimal;
        AMT : Decimal;
        "Invoiced Date" : Date;
        "Inward date" : Date;
        "TOT AMT" : Decimal;
        Line_Total : Decimal;
        "New Order" : Boolean;
        FIlt : Text[250];
        Totalamt : Decimal;
        Amtwithtaxes : Decimal;
        StrOrdLineDetails2 : Record "Posted Str Order Line Details";
        Structure_Amount2 : Decimal;
        "sum" : Decimal;
        ItemEntryRelation : Record "Item Entry Relation";
        Test : Decimal;
        INWARD_DETAILSCaptionLbl : Label 'INWARD DETAILS';
        Vendor_CaptionLbl : Label '"Vendor "';
        ORDER_NOCaptionLbl2 : Label 'ORDER NO';
        DESCRIPTIONCaptionLbl2 : Label 'DESCRIPTION';
        DC_No_CaptionLbl : Label '" DC No."';
        QuantityCaptionLbl2 : Label 'Quantity';
        Lot_No_CaptionLbl : Label 'Lot No.';
        Serial_No_CaptionLbl : Label 'Serial No.';
        Unit_Cost__With_Taxes_CaptionLbl : Label 'Unit Cost (With Taxes)';
        Unit_Cost__With_Out_Taxes_CaptionLbl : Label 'Unit Cost (With Out Taxes)';
        UOMCaptionLbl2 : Label 'UOM';
        DESCRIPTIONCaption_Control1000000015Lbl : Label 'DESCRIPTION';
        Page_No_CaptionLbl : Label 'Page No.';
        EmptyStringCaptionLbl2 : Label ':';
        Lot_No_Caption_Control1000000012Lbl : Label 'Lot No.';
        Serial_No_Caption_Control1000000013Lbl : Label 'Serial No.';
        ORDER_NOCaption_Control1000000024Lbl : Label 'ORDER NO';
        DC_No_Caption_Control1000000038Lbl : Label '" DC No."';
        VendorCaptionLbl2 : Label 'Vendor';
        Unit_Cost__With_Taxes_Caption_Control1102154003Lbl : Label 'Unit Cost (With Taxes)';
        Unit_Cost__With_Out_Taxes_Caption_Control1102154004Lbl : Label 'Unit Cost (With Out Taxes)';
        QuantityCaption_Control1102154010Lbl : Label 'Quantity';
        UOMCaption_Control1102154019Lbl : Label 'UOM';
        PWOReport : Boolean;
        FieldVisible : Boolean;
        Prev_OrderNo : Code[20];
        Prev_DocNo : Code[20];

    (276)]
    procedure Entercell(RowNo : Integer;ColumnNo : Integer;CellValue : Text[1000];bold : Boolean;CellType : Option);
    begin
        Tempexcelbuffer.INIT;
        Tempexcelbuffer.VALIDATE("Row No.",RowNo);
        Tempexcelbuffer.VALIDATE("Column No.",ColumnNo);
        Tempexcelbuffer."Cell Value as Text" := CellValue;
        Tempexcelbuffer.Bold:=bold ;
        Tempexcelbuffer."Cell Type" := CellType; //Rev01
        Tempexcelbuffer.INSERT;
    end;

    (285)]
    procedure EnterHeadings(RowNo : Integer;ColumnNo : Integer;CellValue : Text[100];Bold : Boolean;CellType : Option);
    begin
        Tempexcelbuffer.INIT;
        Tempexcelbuffer.VALIDATE("Row No.",RowNo);
        Tempexcelbuffer.VALIDATE("Column No.",ColumnNo);
        Tempexcelbuffer."Cell Value as Text" := FORMAT(CellValue);
        Tempexcelbuffer.Bold:=Bold ;
        Tempexcelbuffer."Cell Type" := CellType; //Rev01

        Tempexcelbuffer.Formula := '';
        Tempexcelbuffer.INSERT;
    end;

    (296)]
    procedure "Entercell New"();
    begin
    end;
}

