report 33000266 "Vendor Rating"
{
    // version QC1.0,Rev01,Eff02,EFFUPG

    DefaultLayout = RDLC;
    RDLCLayout = './Vendor Rating.rdlc';

    dataset
    {
        dataitem("<Vendor1>"; Vendor)
        {
            RequestFilterFields = "No.", "Vendor Type";
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(USERID; USERID)
            {
            }
            column(TODAY; TODAY)
            {
            }
            column(VENDOR_DECLARATIONCaption; QTY)
            {
            }
            column(CHOICE; Choice)
            {
            }
            column(Vendor_RatingCaption; Vendor_RatingCaptionLbl)
            {
            }
            column(PriceCaption; PriceCaptionLbl)
            {
            }
            column(TimeCaption; TimeCaptionLbl)
            {
            }
            column(QualityCaption; QualityCaptionLbl)
            {
            }
            column(Unit_CostCaption; Unit_CostCaptionLbl)
            {
            }
            column(DeviationCaption; DeviationCaptionLbl)
            {
            }
            column(Lead_TimeCaption; Lead_TimeCaptionLbl)
            {
            }
            column(Given_Lead_TimeCaption; Given_Lead_TimeCaptionLbl)
            {
            }
            column(Qty__RejectedCaption; Qty__RejectedCaptionLbl)
            {
            }
            column(QuantityCaption; QuantityCaptionLbl)
            {
            }
            column(Vendor1__No_; "No.")
            {
            }
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = Buy-from Vendor No.=FIELD(No.);
                DataItemTableView = SORTING(No., Buy-from Vendor No.) ORDER(Ascending) WHERE(Qty. to Invoice=CONST(0),Expected Receipt Date=FILTER(<>''));
                RequestFilterFields = Type,"No.","Buy-from Vendor No.";
                column(Vendor1___Name;"<Vendor1>".Name)
                {
                }
                column(Vr_Avg_i;Vr_Avg_i)
                {
                }
                column(Purchase_Line__No__;"No.")
                {
                }
                column(Purchase_Line_Description;Description)
                {
                }
                column(Vr_Avg;Vr_Avg)
                {
                }
                column(Name;Name)
                {
                }
                column(Purchase_Line_Quantity;Quantity)
                {
                }
                column(Purchase_Line__Quantity_Rejected_;"Quantity Rejected")
                {
                }
                column(Lead_Time_;"Lead Time")
                {
                }
                column(UC;UC)
                {
                }
                column(GLD;GLD)
                {
                }
                column(Lead_Time__GLD;"Lead Time"-GLD)
                {
                }
                column(Quality;Quality)
                {
                }
                column(TIM;TIM)
                {
                }
                column(PRC;PRC)
                {
                }
                column(VR;VR)
                {
                }
                column(Vr_Avg_Control1000000033;Vr_Avg)
                {
                }
                column(VendorCaption;VendorCaptionLbl)
                {
                }
                column(Purchase_Line__No__Caption;FIELDCAPTION("No."))
                {
                }
                column(DescriptionCaption;DescriptionCaptionLbl)
                {
                }
                column(VendorCaption_Control1000000001;VendorCaption_Control1000000001Lbl)
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
                column(Purchase_Line_Buy_from_Vendor_No_;"Buy-from Vendor No.")
                {
                }
                column(Vendor_Ang;"Vendor Ang")
                {
                }
                column(Vr_Avg_i_Showoutput;Vr_Avg_i_Showoutput)
                {
                }
                column(ItemDetailsShowOutput;ItemDetailsShowOutput)
                {
                }
                column(VendorDetailsShowOutPut;VendorDetailsShowOutPut)
                {
                }

                trigger OnAfterGetRecord();
                begin
                     UC:=0;
                     Quality:=0;
                     Deviation:=0;
                     PRC:=0;
                     TIM:=0;
                    // copy code from //Purchase Line, Body (4) - OnPostSection() >>
                    CLEAR(Vr_Avg_i_Showoutput);
                    IF ("Vendor Ang") AND ("Item Desc"<>'') THEN BEGIN
                     IF "Purchase Line".Description="Item Desc" THEN BEGIN
                      Vr_Avg_i_Showoutput :=FALSE;
                      K+=1;
                     END ELSE BEGIN
                      Vr_Avg_i_Showoutput :=TRUE;
                      FOR j:=1 TO K DO BEGIN
                       TOT_VR_I+=IVR[j];
                      END;
                      Vr_Avg_i:=TOT_VR_I/K;
                      K:=1;
                      TOT_VR_I:=0;
                     END ;
                    END ELSE
                     Vr_Avg_i_Showoutput :=FALSE;
                    // copy code from //Purchase Line, Body (4) - OnPostSection() <<
                    
                    // copy code from //Purchase Line, Body (5) - OnPostSection() >>
                    CLEAR(ItemDetailsShowOutput);
                    IF "Purchase Line".Description="Item Desc" THEN
                       ItemDetailsShowOutput:=FALSE
                    ELSE BEGIN
                       ItemDetailsShowOutput:=TRUE;
                       "Item Desc":="Purchase Line".Description;
                    END;
                    // copy code from //Purchase Line, Body (5) - OnPostSection() <<
                    
                    // copy code from //Purchase Line, Body (7) - OnPostSection() >>
                    CLEAR(VendorDetailsShowOutPut);
                    IF (NOT "Vendor Ang") THEN BEGIN
                      Vendor.RESET;//rev01
                      Vendor.SETRANGE(Vendor."No.","Purchase Line"."Buy-from Vendor No.");
                      IF Vendor.FIND('-') THEN
                        Name:=Vendor.Name;
                      IF Name=Pre_Name THEN BEGIN
                       VendorDetailsShowOutPut :=FALSE;
                      END ELSE BEGIN
                        VendorDetailsShowOutPut :=TRUE;
                        Pre_Name:=Name;
                        i:=1;
                      END;
                    END ELSE BEGIN
                     Vendor.RESET;//rev01
                     Vendor.SETRANGE(Vendor."No.","Purchase Line"."Buy-from Vendor No.");
                     IF Vendor.FIND('-') THEN
                      Name:=Vendor.Name;
                     IF Name=Pre_Name THEN BEGIN
                      VendorDetailsShowOutPut :=FALSE;
                     END ELSE BEGIN
                      VendorDetailsShowOutPut :=TRUE;
                      Pre_Name:=Name;
                      i:=1;
                     END;
                     VendorDetailsShowOutPut :=FALSE;
                    END;
                    // copy code from //Purchase Line, Body (7) - OnPostSection() <<
                    
                    // copy code from //Purchase Line, Body (8) - OnPostSection() >>
                     PRL.SETCURRENTKEY(PRL."Buy-from Vendor No.",PRL."No.",PRL.Type);
                     PRL.SETRANGE(PRL."Buy-from Vendor No.","Purchase Line"."Buy-from Vendor No.");
                     PRL.SETRANGE(PRL."No.","Purchase Line"."No.");
                     PRL.SETRANGE(PRL."Order No.","Purchase Line"."Document No.");
                     PRL.SETFILTER(PRL.Quantity,'>%1',0);
                     IF PRL.FIND('-') THEN
                     BEGIN
                      PRH.SETRANGE(PRH."No.",PRL."Document No.");
                      IF PRH.FIND('-') THEN
                      BEGIN
                       PH.SETRANGE(PH."No.","Purchase Line"."Document No.");
                       IF PH.FIND('-') THEN
                       BEGIN
                         "Lead Time":=PRH."Posting Date"-PH."Order Date";
                         GLD:="Purchase Line"."Expected Receipt Date"-PH."Order Date";
                       END;
                      END;
                     END;
                      PIL.SETRANGE(PIL."Buy-from Vendor No.","Purchase Line"."Buy-from Vendor No.");
                      PIL.SETRANGE(PIL."No.","Purchase Line"."No.");
                      PIL.SETRANGE(PIL.Quantity,"Purchase Line".Quantity);
                      IF PIL.FIND('-') THEN
                      UC:=PIL."Amount To Vendor"/PIL.Quantity;
                      Deviation:="Lead Time"-GLD;
                     /*  Quality:=0.6*("Purchase Line".Quantity/("Purchase Line".Quantity+"Purchase Line"."Quantity Rejected"));
                      CASE Deviation OF
                        0:TIM:=1*0.3;
                     -3,-2,-1,1,2,3:TIM:=0.9*0.3;
                     -7,-6,-5,-4,4,5,6,7:TIM:=0.6*0.3;
                     -10,-9,-8,8,9,10:TIM:=0.3*0.3;
                     -100..100:TIM:=0;
                      END; */
                    
                      IF  Vendor."Vendor Type"=Vendor."Vendor Type"::Manufacturer THEN
                      BEGIN
                      Quality:=0.6*("Purchase Line".Quantity/("Purchase Line".Quantity+"Purchase Line"."Quantity Rejected"));
                      CASE Deviation OF
                        0:TIM:=1*0.3;
                     -3,-2,-1,1,2,3:TIM:=0.9*0.3;
                     -7,-6,-5,-4,4,5,6,7:TIM:=0.6*0.3;
                      -10,-9,-8,8,9,10:TIM:=0.3*0.3;
                    -100..100:TIM:=0;
                    
                      END;
                      END ELSE  IF Vendor."Vendor Type"=Vendor."Vendor Type"::Trader THEN
                      BEGIN
                      Quality:=0.4*("Purchase Line".Quantity/("Purchase Line".Quantity+"Purchase Line"."Quantity Rejected"));
                      CASE Deviation OF
                        0:TIM:=1*0.5;
                     -3,-2,-1,1,2,3:TIM:=0.9*0.5;
                     -7,-6,-5,-4,4,5,6,7:TIM:=0.6*0.5;
                      -10,-9,-8,8,9,10:TIM:=0.3*0.5;
                     -100..100:TIM:=0;
                     END;
                     END;
                    
                     PL.SETCURRENTKEY(PL."No.",PL."Unit Cost (LCY)");
                     PL.SETRANGE(PL."No.","Purchase Line"."No.");
                     IF PL.FIND('-') THEN
                     IF   PL."Unit Cost (LCY)">0 THEN
                     PRC:=0.1*(1-(("Purchase Line"."Unit Cost (LCY)"-PL."Unit Cost (LCY)")/PL."Unit Cost (LCY)"));
                    
                     VR:=Quality+TIM+PRC;
                     VR1[i]:=VR;
                     IVR[K]:=VR;
                    // copy code from //Purchase Line, Body (8) - OnPostSection() <<

                end;

                trigger OnPostDataItem();
                begin
                    // copy code from //Purchase Line, Footer (10) - OnPreSection()>>
                     FOR j:=1 TO i DO
                     BEGIN
                       TOT_VR+=VR1[j];

                     END;
                     Vr_Avg:=TOT_VR/i;
                    // copy code from //Purchase Line, Footer (10) - OnPreSection()<<
                end;

                trigger OnPreDataItem();
                begin
                    IF Choice_Qty=Choice_Qty::Above THEN
                    "Purchase Line".SETFILTER("Purchase Line".Quantity,'>%1',QTY)
                    ELSE
                    "Purchase Line".SETFILTER("Purchase Line".Quantity,'<%1',QTY);
                     //i:=0;

                    // Copy code from //Purchase Line, Header (3) - OnPreSection() >>
                    //CurrReport.SHOWOUTPUT("Vendor Ang");
                    // Copy code from //Purchase Line, Header (3) - OnPreSection() <<
                end;
            }

            trigger OnPreDataItem();
            begin
                /*message(VendorFilter);
                message(PurFilter);*/
                
                IF Choice<>Choice::Vendor_Rating THEN
                  CurrReport.BREAK;
                
                IF (VendorFilter<>'') AND (PurFilter='')  THEN
                "Vendor Ang":=TRUE
                ELSE IF (VendorFilter='') AND (PurFilter<>'')  THEN
                "Vendor Ang":=FALSE
                ELSE
                IF  (VendorFilter='') AND (PurFilter='')  THEN
                "Vendor Ang":=TRUE;
                 K:=1;
                 i:=1;

            end;
        }
        dataitem("Purch. Rcpt. Line";"Purch. Rcpt. Line")
        {
            DataItemTableView = SORTING(Buy-from Vendor No.,No.,Type) ORDER(Ascending) WHERE(Quantity=FILTER(>0));
            column(Choice_Vendor_Deviation;Choice)
            {
            }
            column(To_Date;To_Date)
            {
            }
            column(From_Date;From_Date)
            {
            }
            column(Name_Control1102154001;Name)
            {
            }
            column(Purch__Rcpt__Line__Expected_Receipt_Date_;"Expected Receipt Date")
            {
            }
            column(Purch__Rcpt__Line__Document_date_;"Document date")
            {
            }
            column(Lead_Time__Control1102154011;"Lead Time")
            {
            }
            column(GLD_Control1102154012;GLD)
            {
            }
            column(Purch__Rcpt__Line_Description;Description)
            {
            }
            column(Purch__Rcpt__Line__Order_No__;"Order No.")
            {
            }
            column(Order_Date;Order_Date)
            {
            }
            column(Lead_Time__GLD_Control1102154076;"Lead Time"-GLD)
            {
            }
            column(Lead_Time__GLD__100;("Lead Time"/GLD)*100)
            {
            }
            column(Purch__Rcpt__Line_Quantity;Quantity)
            {
            }
            column(Purch__Rcpt__Line__Unit_of_Measure_;"Unit of Measure")
            {
            }
            column(Name_Control1102154000;Name)
            {
            }
            column(No__Of_Inwards_;"No. Of Inwards")
            {
            }
            column(Deviation_Percentage_;"Deviation Percentage")
            {
            }
            column(Vendor_DeviationCaption;Vendor_DeviationCaptionLbl)
            {
            }
            column(Valution_FromCaption;Valution_FromCaptionLbl)
            {
            }
            column(ToCaption;ToCaptionLbl)
            {
            }
            column(No__Of_InwardsCaption;No__Of_InwardsCaptionLbl)
            {
            }
            column(Deviation__Caption;Deviation__CaptionLbl)
            {
            }
            column(VendorCaption_Control1102154035;VendorCaption_Control1102154035Lbl)
            {
            }
            column(Deviation__Caption_Control1102154071;Deviation__Caption_Control1102154071Lbl)
            {
            }
            column(No__Of_InwardsCaption_Control1102154072;No__Of_InwardsCaption_Control1102154072Lbl)
            {
            }
            column(VendorCaption_Control1102154073;VendorCaption_Control1102154073Lbl)
            {
            }
            column(ItemCaption;ItemCaptionLbl)
            {
            }
            column(Expected_DateCaption;Expected_DateCaptionLbl)
            {
            }
            column(Received_DateCaption;Received_DateCaptionLbl)
            {
            }
            column(Given_Lead_TimeCaption_Control1102154013;Given_Lead_TimeCaption_Control1102154013Lbl)
            {
            }
            column(Actulal_Lead_TimeCaption;Actulal_Lead_TimeCaptionLbl)
            {
            }
            column(Purch__Rcpt__Line__Order_No__Caption;FIELDCAPTION("Order No."))
            {
            }
            column(Order_DateCaption;Order_DateCaptionLbl)
            {
            }
            column(DeviationCaption_Control1102154075;DeviationCaption_Control1102154075Lbl)
            {
            }
            column(Deviation__Caption_Control1102154074;Deviation__Caption_Control1102154074Lbl)
            {
            }
            column(Purch__Rcpt__Line_QuantityCaption;FIELDCAPTION(Quantity))
            {
            }
            column(Purch__Rcpt__Line_Document_No_;"Document No.")
            {
            }
            column(Purch__Rcpt__Line_Line_No_;"Line No.")
            {
            }
            column(Purch__Rcpt__Line_Buy_from_Vendor_No_;"Buy-from Vendor No.")
            {
            }
            column(Vendor_Choice;Vendor_Choice)
            {
            }

            trigger OnAfterGetRecord();
            begin
                // Copy Code from //Purch. Rcpt. Line, TransHeader (3) - OnPreSection() >>
                //CurrReport.SHOWOUTPUT(Vendor_Choice=Vendor_Choice::Vendor);
                // Copy Code from //Purch. Rcpt. Line, TransHeader (3) - OnPreSection() <<
                IF Previous_Vendor<> "Purch. Rcpt. Line"."Buy-from Vendor No." THEN
                BEGIN
                  IF Previous_Vendor<>'' THEN BEGIN
                    // copy code from // Purch. Rcpt. Line, GroupFooter (7) - OnPostSection() >>
                    IF Excel THEN BEGIN
                      Row+=1;
                      "Deviation Percentage":=(Deviation/"No. Of Inwards"*100)-100;
                      Entercell(Row,1,Name,FALSE,Tempexcelbuffer."Cell Type"::Text);
                      Entercell(Row,2,FORMAT("No. Of Inwards"),FALSE,Tempexcelbuffer."Cell Type"::Text);
                      Entercell(Row,3,FORMAT("Deviation Percentage"),FALSE,Tempexcelbuffer."Cell Type"::Text);
                    END;
                    // copy code from // Purch. Rcpt. Line, GroupFooter (7) - OnPostSection() >>
                  END;
                
                
                  // Copu code from // Purch. Rcpt. Line, GroupHeader (4) - OnPreSection() >>
                  IF Vendor.GET("Purch. Rcpt. Line"."Buy-from Vendor No.") THEN
                    Name:=Vendor.Name;
                  //CurrReport.SHOWOUTPUT(Vendor_Choice=Vendor_Choice::Inward);
                  // Copu code from // Purch. Rcpt. Line, GroupHeader (4) - OnPreSection() <<
                
                  // Copu code from // Purch. Rcpt. Line, GroupHeader (5) - OnPreSection() >>
                  "Deviation Percentage":=0;
                  "No. Of Inwards":=0;
                  Deviation:=0;
                  IF Excel THEN
                  BEGIN
                    Row+=1;
                    EnterHeadings(Row,1,'Order',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,2,'Item',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,3,'Quantity',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,4,'UOM',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,5,'Order Date',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,6,'Expected Date',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,7,'Received Date',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,8,'Given Lead Time',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,9,'Actual Lead Time',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,10,'Deviation',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,11,'Deviation %',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,12,'Category',FALSE,Tempexcelbuffer."Cell Type"::Text);
                  END;
                
                  //CurrReport.SHOWOUTPUT(Vendor_Choice=Vendor_Choice::Inward);
                
                END;
                // Copu code from // Purch. Rcpt. Line, GroupHeader (5) - OnPreSection() <<
                
                // Copu code from // Purch. Rcpt. Line, Body (6) - OnPreSection() >>
                "No. Of Inwards"+=1;
                GLD:=0;
                "Lead Time":=0;
                
                PH.SETRANGE(PH."No.","Purch. Rcpt. Line"."Order No.");
                IF PH.FIND('-') THEN
                  Order_Date:=PH."Order Date";
                IF ("Purch. Rcpt. Line"."Expected Receipt Date">0D) AND (Order_Date>0D) THEN
                  GLD:="Purch. Rcpt. Line"."Expected Receipt Date"-Order_Date;
                IF (Order_Date>0D) AND ("Purch. Rcpt. Line"."Document date">0D) THEN
                  "Lead Time"  :="Purch. Rcpt. Line"."Document date"-Order_Date;
                
                IF  GLD=0 THEN
                  GLD:=1;
                IF  "Lead Time"=0 THEN
                  "Lead Time":=1;
                IF Excel THEN
                BEGIN
                  Row+=1;
                  IF NOT("Prev Order"="Purch. Rcpt. Line"."Order No.") THEN
                  BEGIN
                    EnterHeadings(Row,1,"Purch. Rcpt. Line"."Order No.",FALSE,Tempexcelbuffer."Cell Type"::Text);
                    "Prev Order":="Purch. Rcpt. Line"."Order No.";
                   END;
                  EnterHeadings(Row,2,"Purch. Rcpt. Line".Description,FALSE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,3,FORMAT("Purch. Rcpt. Line".Quantity),FALSE,Tempexcelbuffer."Cell Type"::Number);
                  EnterHeadings(Row,4,FORMAT("Purch. Rcpt. Line"."Unit of Measure Code"),FALSE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,5,FORMAT(Order_Date),FALSE,Tempexcelbuffer."Cell Type"::Date);
                  EnterHeadings(Row,6,FORMAT("Purch. Rcpt. Line"."Expected Receipt Date"),FALSE,Tempexcelbuffer."Cell Type"::Date);
                  EnterHeadings(Row,7,FORMAT("Purch. Rcpt. Line"."Document date"),FALSE,Tempexcelbuffer."Cell Type"::Date);
                  EnterHeadings(Row,8,FORMAT(GLD),FALSE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,9,FORMAT("Lead Time"),FALSE,Tempexcelbuffer."Cell Type"::Number);
                  EnterHeadings(Row,10,FORMAT("Lead Time"-GLD),FALSE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,11,FORMAT(("Lead Time"/GLD)*100),FALSE,Tempexcelbuffer."Cell Type"::Number);
                  EnterHeadings(Row,12,"Purch. Rcpt. Line"."Product Group Code",FALSE,Tempexcelbuffer."Cell Type"::Text);
                END;
                
                Deviation+=("Lead Time"/GLD);
                   //CurrReport.SHOWOUTPUT(Vendor_Choice=Vendor_Choice::Inward);
                // Copu code from // Purch. Rcpt. Line, Body (6) - OnPreSection() <<
                /*
                // copy code from // Purch. Rcpt. Line, GroupFooter (7) - OnPostSection() >>
                   IF Vendor.GET("Purch. Rcpt. Line"."Buy-from Vendor No.") THEN
                   Name:=Vendor.Name;
                   ROw+=1;
                IF Excel THEN
                BEGIN
                  Entercell(ROw,1,Name,FALSE,Tempexcelbuffer."Cell Type"::Text);
                  Entercell(ROw,2,FORMAT("No. Of Inwards"),FALSE,Tempexcelbuffer."Cell Type"::Text);
                  Entercell(ROw,3,FORMAT("Deviation Percentage"),FALSE,Tempexcelbuffer."Cell Type"::Text);
                END;
                "Deviation Percentage":=(Deviation/"No. Of Inwards"*100)-100;
                //CurrReport.SHOWOUTPUT(Vendor_Choice=Vendor_Choice::Vendor);
                // copy code from // Purch. Rcpt. Line, GroupFooter (7) - OnPostSection() <<
                */

            end;

            trigger OnPreDataItem();
            begin


                IF Choice<>Choice::Vendor_Deviation THEN
                  CurrReport.BREAK;
                 "Purch. Rcpt. Line".SETRANGE("Purch. Rcpt. Line"."Document date",From_Date,To_Date);
                  IF Vend_Name<>'' THEN
                   "Purch. Rcpt. Line".SETRANGE("Purch. Rcpt. Line"."Buy-from Vendor No.",Vend_Name);
                 IF Excel THEN
                 BEGIN
                   CLEAR(Tempexcelbuffer);
                   Tempexcelbuffer.DELETEALL;
                 END;
                Row:=0;

                // copy code from //Purch. Rcpt. Line, Header (2) - OnPostSection()>>
                IF Excel AND (Vendor_Choice=Vendor_Choice::Vendor) THEN
                BEGIN
                  Row+=1;
                  EnterHeadings(Row,1,'Vendor',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,2,'No. Of Inwards',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,3,'Deviation %',TRUE,Tempexcelbuffer."Cell Type"::Text);
                END;
                //CurrReport.SHOWOUTPUT(Vendor_Choice=Vendor_Choice::Vendor);
                // copy code from //Purch. Rcpt. Line, Header (2) - OnPostSection()<<
            end;
        }
        dataitem("<Purch. Rcpt. Line1>";"Purch. Rcpt. Line")
        {
            DataItemTableView = SORTING(No.) ORDER(Ascending) WHERE(Quantity=FILTER(>0),Type=CONST(Item));
            column(Choice_Item_Deviation;Choice)
            {
            }
            column(From_Date_Control1102154023;From_Date)
            {
            }
            column(To_Date_Control1102154024;To_Date)
            {
            }
            column(Purch__Rcpt__Line1__Description;Description)
            {
            }
            column(Lead_Time__Control1102154051;"Lead Time")
            {
            }
            column(GLD_Control1102154052;GLD)
            {
            }
            column(Purch__Rcpt__Line1___Document_No__;"Document No.")
            {
            }
            column(Purch__Rcpt__Line1___Order_No__;"Order No.")
            {
            }
            column(Purch__Rcpt__Line1___Expected_Receipt_Date_;"Expected Receipt Date")
            {
            }
            column(Purch__Rcpt__Line1___Document_date_;"Document date")
            {
            }
            column(Name_Control1102154066;Name)
            {
            }
            column(Avg_Lead_Time;Avg_Lead_Time)
            {
            }
            column(Purch__Rcpt__Line1__Description_Control1102154037;Description)
            {
            }
            column(Purch__Rcpt__Line1___No__;"No.")
            {
            }
            column(Purch__Rcpt__Line1__Type;Type)
            {
            }
            column(No__Of_Inwards__Control1102154042;"No. Of Inwards")
            {
            }
            column(Deviation_Percentage__Control1102154043;"Deviation Percentage")
            {
            }
            column(Item_DeviationCaption;Item_DeviationCaptionLbl)
            {
            }
            column(Valution_FromCaption_Control1102154025;Valution_FromCaption_Control1102154025Lbl)
            {
            }
            column(ToCaption_Control1102154026;ToCaption_Control1102154026Lbl)
            {
            }
            column(Deviation__Caption_Control1102154045;Deviation__Caption_Control1102154045Lbl)
            {
            }
            column(No__Of_InwardsCaption_Control1102154046;No__Of_InwardsCaption_Control1102154046Lbl)
            {
            }
            column(DesriptionCaption;DesriptionCaptionLbl)
            {
            }
            column(No_Caption;No_CaptionLbl)
            {
            }
            column(TypeCaption;TypeCaptionLbl)
            {
            }
            column(Purch__Rcpt__Line1___No__Caption;FIELDCAPTION("No."))
            {
            }
            column(Purch__Rcpt__Line1__TypeCaption;FIELDCAPTION(Type))
            {
            }
            column(Purch__Rcpt__Line1__Description_Control1102154037Caption;FIELDCAPTION(Description))
            {
            }
            column(No__Of_InwardsCaption_Control1102154040;No__Of_InwardsCaption_Control1102154040Lbl)
            {
            }
            column(Deviation__Caption_Control1102154041;Deviation__Caption_Control1102154041Lbl)
            {
            }
            column(Inward_No_Caption;Inward_No_CaptionLbl)
            {
            }
            column(Purch__Rcpt__Line1___Order_No__Caption;FIELDCAPTION("Order No."))
            {
            }
            column(Expected_DateCaption_Control1102154058;Expected_DateCaption_Control1102154058Lbl)
            {
            }
            column(Received_DateCaption_Control1102154059;Received_DateCaption_Control1102154059Lbl)
            {
            }
            column(Given_Lead_TimeCaption_Control1102154060;Given_Lead_TimeCaption_Control1102154060Lbl)
            {
            }
            column(Actulal_Lead_TimeCaption_Control1102154061;Actulal_Lead_TimeCaption_Control1102154061Lbl)
            {
            }
            column(VendorCaption_Control1102154065;VendorCaption_Control1102154065Lbl)
            {
            }
            column(Purch__Rcpt__Line1__Line_No_;"Line No.")
            {
            }
            column(Item_Choice;Item_Choice)
            {
            }

            trigger OnAfterGetRecord();
            begin
                // Rev01 copy code from // <Purch. Rcpt. Line1>, GroupHeader (4) - OnPostSection() <<
                //CurrReport.SHOWOUTPUT(Item_Choice=Item_Choice::Inward);
                // Rev01 copy code from // <Purch. Rcpt. Line1>, GroupHeader (4) - OnPostSection() <<
                
                // Rev01 copy code from // <Purch. Rcpt. Line1>, GroupHeader (5) - OnPostSection() <<
                IF Previous_item<>"<Purch. Rcpt. Line1>"."No." THEN
                BEGIN
                  IF Previous_item<>'' THEN
                  BEGIN
                    // Rev01 copy code from //<Purch. Rcpt. Line1>, GroupFooter (7) - OnPostSection() >>
                    Avg_Lead_Time:=Avg_Lead_Time/"No. Of Inwards";
                    // Rev01 copy code from //<Purch. Rcpt. Line1>, GroupFooter (7) - OnPostSection() <<
                
                    // Rev01 copy code from //<Purch. Rcpt. Line1>, GroupFooter (8) - OnPostSection() >>
                
                    "Deviation Percentage":=((Deviation/"No. Of Inwards")*100)-100;
                    IF Excel AND  (Item_Choice=Item_Choice::Item) THEN
                    BEGIN
                      Row+=1;
                      Entercell(Row,1,FORMAT("<Purch. Rcpt. Line1>".Type),FALSE,Tempexcelbuffer."Cell Type"::Text);
                      Entercell(Row,2,Previous_item,FALSE,Tempexcelbuffer."Cell Type"::Text);
                      Entercell(Row,3,"<Purch. Rcpt. Line1>".Description,FALSE,Tempexcelbuffer."Cell Type"::Text);
                      Entercell(Row,4,FORMAT("No. Of Inwards"),FALSE,Tempexcelbuffer."Cell Type"::Text);
                      Entercell(Row,5,FORMAT("Deviation Percentage"),FALSE,Tempexcelbuffer."Cell Type"::Text);
                    END;
                    //CurrReport.SHOWOUTPUT(Item_Choice=Item_Choice::Item);
                    // Rev01 copy code from //<Purch. Rcpt. Line1>, GroupFooter (8) - OnPostSection() <<
                  END;
                  Previous_item:="<Purch. Rcpt. Line1>"."No.";
                  "Deviation Percentage":=0;
                  "No. Of Inwards":=0;
                  Deviation:=0;
                  Avg_Lead_Time:=0;
                  IF Excel AND  (Item_Choice=Item_Choice::Inward) THEN
                  BEGIN
                    Row+=1;
                    EnterHeadings(Row,1,'Item',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,2,'Lead Time (Item Card) ',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,3,'Item Product Group Code',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,4,'Item Sub Group Code',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,5,'Inward No.',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,6,'Order No.',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,7,'Vendor',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,8,'Order Date',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,9,'Expected Receipt Date',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,10,'Received Date',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,11,'Given Lead Time',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,12,'Actual Lead Time',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,13,'First Invoiced Date',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  END;
                END;
                
                  //CurrReport.SHOWOUTPUT(Item_Choice=Item_Choice::Inward);
                // Rev01 copy code from // <Purch. Rcpt. Line1>, GroupHeader (5) - OnPostSection() <<
                
                // Rev01 copy code from // <Purch. Rcpt. Line1>, Body (6) - OnPostSection() >>
                 "No. Of Inwards"+=1;
                 GLD:=0;
                 "Lead Time":=0;
                   IF Vendor.GET("<Purch. Rcpt. Line1>"."Buy-from Vendor No.") THEN
                   Name:=Vendor.Name;
                
                   PH.SETRANGE(PH."No.","<Purch. Rcpt. Line1>"."Order No.");
                   IF PH.FIND('-') THEN
                     Order_Date:=PH."Order Date";
                   IF ("<Purch. Rcpt. Line1>"."Expected Receipt Date">0D) AND (Order_Date>0D) THEN
                  GLD:="<Purch. Rcpt. Line1>"."Expected Receipt Date"-Order_Date;
                  "<Purch. Rcpt. Line1>".CALCFIELDS("<Purch. Rcpt. Line1>"."Document date");
                   IF (Order_Date>0D) AND ("<Purch. Rcpt. Line1>"."Document date">0D) THEN
                   "Lead Time"  :="<Purch. Rcpt. Line1>"."Document date"-Order_Date;
                    Avg_Lead_Time+="Lead Time";
                   IF  GLD=0 THEN
                   GLD:=1;
                   IF  "Lead Time"=0 THEN
                   "Lead Time":=1;
                   "First Invoice Date":=0D;
                  PRL.SETCURRENTKEY(PRL."Order No.",PRL."Order Line No.");
                  PRL.SETRANGE(PRL."Order No.","<Purch. Rcpt. Line1>"."Order No.");
                  PRL.SETFILTER(PRL.Quantity,'>%1',0);
                  PRL.SETRANGE(PRL."No.","<Purch. Rcpt. Line1>"."No.");
                  IF PRL.FIND('-') THEN
                  BEGIN
                    PIL.SETCURRENTKEY(PIL.Type,PIL."No.",PIL."Variant Code");
                    PIL.SETFILTER(PIL.Type,'Item');
                    PIL.SETRANGE(PIL."No.",PRL."No.");
                    PIL.SETRANGE(PIL."Receipt No.",PRL."Document No.");
                    IF PIL.FIND('-') THEN
                    BEGIN
                
                      PIH.SETRANGE(PIH."No.",PIL."Document No.");
                      IF PIH.FIND('-') THEN
                      BEGIN
                
                        "First Invoice Date":=PIH."Posting Date";
                      END;
                    END;
                  END;
                IF Excel AND (Item_Choice=Item_Choice::Inward) THEN
                BEGIN
                  Row+=1;
                  Entercell(Row,1,FORMAT("<Purch. Rcpt. Line1>".Description),FALSE,Tempexcelbuffer."Cell Type"::Text);
                  IF item.GET("<Purch. Rcpt. Line1>"."No.") THEN
                  BEGIN
                     Entercell(Row,2,FORMAT(item."Safety Lead Time"),FALSE,Tempexcelbuffer."Cell Type"::Text);
                     Entercell(Row,3,FORMAT(item."Product Group Code"),FALSE,Tempexcelbuffer."Cell Type"::Text);
                     Entercell(Row,4,FORMAT(item."Item Sub Group Code"),FALSE,Tempexcelbuffer."Cell Type"::Text);
                  END;
                
                  Entercell(Row,5,FORMAT("<Purch. Rcpt. Line1>"."Document No."),FALSE,Tempexcelbuffer."Cell Type"::Text);
                  Entercell(Row,6,"<Purch. Rcpt. Line1>"."Order No.",FALSE,Tempexcelbuffer."Cell Type"::Text);
                  Entercell(Row,7,Name,FALSE,Tempexcelbuffer."Cell Type"::Text);
                  Entercell(Row,8,FORMAT(Order_Date),FALSE,Tempexcelbuffer."Cell Type"::Date);
                  Entercell(Row,9,FORMAT("<Purch. Rcpt. Line1>"."Expected Receipt Date"),FALSE,Tempexcelbuffer."Cell Type"::Date);
                  Entercell(Row,10,FORMAT("<Purch. Rcpt. Line1>"."Document date"),FALSE,Tempexcelbuffer."Cell Type"::Date);
                  Entercell(Row,11,FORMAT(GLD),FALSE,Tempexcelbuffer."Cell Type"::Text);
                  Entercell(Row,12,FORMAT("Lead Time"),FALSE,Tempexcelbuffer."Cell Type"::Number);
                  Entercell(Row,13,FORMAT("First Invoice Date"),FALSE,Tempexcelbuffer."Cell Type"::Date);
                
                END;
                
                   Deviation+=("Lead Time"/GLD);
                
                   // CurrReport.SHOWOUTPUT(Item_Choice=Item_Choice::Inward);
                // Rev01 copy code from // <Purch. Rcpt. Line1>, Body (6) - OnPostSection() <<
                /*
                // Rev01 copy code from //<Purch. Rcpt. Line1>, GroupFooter (7) - OnPostSection() >>
                Avg_Lead_Time:=Avg_Lead_Time/"No. Of Inwards";
                // Rev01 copy code from //<Purch. Rcpt. Line1>, GroupFooter (7) - OnPostSection() <<
                
                // Rev01 copy code from //<Purch. Rcpt. Line1>, GroupFooter (8) - OnPostSection() >>
                
                "Deviation Percentage":=((Deviation/"No. Of Inwards")*100)-100;
                IF Excel AND  (Item_Choice=Item_Choice::Item) THEN
                BEGIN
                  ROw+=1;
                  Entercell(ROw,1,FORMAT("<Purch. Rcpt. Line1>".Type),FALSE,Tempexcelbuffer."Cell Type"::Text);
                  Entercell(ROw,2,"<Purch. Rcpt. Line1>"."No.",FALSE,Tempexcelbuffer."Cell Type"::Text);
                  Entercell(ROw,3,"<Purch. Rcpt. Line1>".Description,FALSE,Tempexcelbuffer."Cell Type"::Text);
                  Entercell(ROw,4,FORMAT("No. Of Inwards"),FALSE,Tempexcelbuffer."Cell Type"::Text);
                  Entercell(ROw,5,FORMAT("Deviation Percentage"),FALSE,Tempexcelbuffer."Cell Type"::Text);
                END;
                //CurrReport.SHOWOUTPUT(Item_Choice=Item_Choice::Item);
                // Rev01 copy code from //<Purch. Rcpt. Line1>, GroupFooter (8) - OnPostSection() <<
                */

            end;

            trigger OnPreDataItem();
            begin


                IF Choice<>Choice::Item_Deviation THEN
                  CurrReport.BREAK;
                "<Purch. Rcpt. Line1>".SETRANGE("<Purch. Rcpt. Line1>"."Document date",From_Date,To_Date);
                  IF Item_Name<>'' THEN
                   "<Purch. Rcpt. Line1>".SETRANGE("<Purch. Rcpt. Line1>"."No.",Item_Name);

                 Row:=0;
                 IF Excel THEN
                 BEGIN
                   CLEAR(Tempexcelbuffer);
                   Tempexcelbuffer.DELETEALL;
                 END;

                // Rev01 copy code from // <Purch. Rcpt. Line1>, Header (2) - OnPostSection() >>
                IF Excel AND (Item_Choice=Item_Choice::Item) THEN
                BEGIN
                  Row+=1;
                  EnterHeadings(Row,1,'Type',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,2,'Item',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,3,'Description',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,4,'No. Of Inwards',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,5,'Deviation %',TRUE,Tempexcelbuffer."Cell Type"::Text);
                END;
                //CurrReport.SHOWOUTPUT(Item_Choice=Item_Choice::Item);
                // Rev01 copy code from // <Purch. Rcpt. Line1>, Header (2) - OnPostSection() <<
                Previous_item:='';
            end;
        }
        dataitem("<Purch. Rcpt. Line2>";"Purch. Rcpt. Line")
        {
            CalcFields = Document date;
            DataItemTableView = SORTING(Document No.,Line No.) WHERE(Quantity=FILTER(>0));
            ReqFilterHeading = 'Vendor Evalution (Overall)';
            column(TODAY_Control1102154108;TODAY)
            {
            }
            column(USERID_Control1102154109;USERID)
            {
            }
            column(Choice_VEO;Choice)
            {
            }
            column(COMPANYNAME_Control1102154111;COMPANYNAME)
            {
            }
            column(Purch__Rcpt__Line2__Description;Description)
            {
            }
            column(Vend_Name;Vend_Name)
            {
            }
            column(Purch__Rcpt__Line2___Order_No__;"Order No.")
            {
            }
            column(Purch__Rcpt__Line2___Expected_Receipt_Date_;"Expected Receipt Date")
            {
            }
            column(Purch__Rcpt__Line2___Document_date_;"Document date")
            {
            }
            column(Vendor_Type;Vendor_Type)
            {
            }
            column(Order_Date_Control1102154126;Order_Date)
            {
            }
            column(Purch__Rcpt__Line2__Quantity;Quantity)
            {
            }
            column(Purch__Rcpt__Line2___Unit_of_Measure_;"Unit of Measure")
            {
            }
            column(Purch__Rcpt__Line2___Quantity_Rejected_;"Quantity Rejected")
            {
            }
            column(GLD_Control1102154143;GLD)
            {
            }
            column(Document_date__Order_Date;"Document date"-Order_Date)
            {
            }
            column(Deviation;Deviation)
            {
            }
            column(SNO;SNO)
            {
            }
            column(ROUND__VR_100__1_;ROUND((VR*100),1))
            {
            }
            column(ROUND__PRC_100__1_;ROUND((PRC*100),1))
            {
            }
            column(ROUND__TIM_100__1_;ROUND((TIM*100),1))
            {
            }
            column(ROUND__Quality_100__1_;ROUND((Quality*100),1))
            {
            }
            column(UC_Control1102154085;UC)
            {
            }
            column(ROUND_Vendor_PPM_1_;ROUND(Vendor_PPM,1))
            {
            }
            column(ROUND__Vr_Avg_100__0_01_;ROUND((Vr_Avg*100),0.01))
            {
            }
            column(ROUND__Vr_P_100__0_01_;ROUND((Vr_P*100),0.01))
            {
            }
            column(ROUND__Vr_T_100__0_01_;ROUND((Vr_T*100),0.01))
            {
            }
            column(ROUND__Vr_P_100__0_01__Control1102154187;ROUND((Vr_P*100),0.01))
            {
            }
            column(ROUND_Total_Vendor_PPM_0_01_;ROUND(Total_Vendor_PPM,0.01))
            {
            }
            column(VENDOR_EVALUTIONCaption;VENDOR_EVALUTIONCaptionLbl)
            {
            }
            column(S_No_Caption;S_No_CaptionLbl)
            {
            }
            column(ItemCaption_Control1102154114;ItemCaption_Control1102154114Lbl)
            {
            }
            column(Purch__Rcpt__Line2___Order_No__Caption;FIELDCAPTION("Order No."))
            {
            }
            column(VendorCaption_Control1102154118;VendorCaption_Control1102154118Lbl)
            {
            }
            column(Purch__Rcpt__Line2___Expected_Receipt_Date_Caption;FIELDCAPTION("Expected Receipt Date"))
            {
            }
            column(Inward_DateCaption;Inward_DateCaptionLbl)
            {
            }
            column(Vendor_TypeCaption;Vendor_TypeCaptionLbl)
            {
            }
            column(Order_DateCaption_Control1102154125;Order_DateCaption_Control1102154125Lbl)
            {
            }
            column(Purch__Rcpt__Line2__QuantityCaption;FIELDCAPTION(Quantity))
            {
            }
            column(UOMCaption;UOMCaptionLbl)
            {
            }
            column(Vendor_RatingCaption_Control1102154131;Vendor_RatingCaption_Control1102154131Lbl)
            {
            }
            column(PriceCaption_Control1102154132;PriceCaption_Control1102154132Lbl)
            {
            }
            column(TimeCaption_Control1102154133;TimeCaption_Control1102154133Lbl)
            {
            }
            column(QualityCaption_Control1102154134;QualityCaption_Control1102154134Lbl)
            {
            }
            column(Unit_Cost___With__Taxes_Caption;Unit_Cost___With__Taxes_CaptionLbl)
            {
            }
            column(DeviationCaption_Control1102154136;DeviationCaption_Control1102154136Lbl)
            {
            }
            column(Lead_TimeCaption_Control1102154137;Lead_TimeCaption_Control1102154137Lbl)
            {
            }
            column(Given_Lead_TimeCaption_Control1102154138;Given_Lead_TimeCaption_Control1102154138Lbl)
            {
            }
            column(Qty__RejectedCaption_Control1102154139;Qty__RejectedCaption_Control1102154139Lbl)
            {
            }
            column(Vendor_PPMCaption;Vendor_PPMCaptionLbl)
            {
            }
            column(Purch__Rcpt__Line2__Document_No_;"Document No.")
            {
            }
            column(Purch__Rcpt__Line2__Line_No_;"Line No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF "<Purch. Rcpt. Line2>".Quantity<>("<Purch. Rcpt. Line2>"."Quantity Accepted"+"<Purch. Rcpt. Line2>"."Quantity Rejected") THEN
                CurrReport.SKIP;
                
                // Rev01 copy code from // <Purch. Rcpt. Line2>, Body (3) - OnPostSection()>>
                SNO+=1;
                
                Quality:=0;
                TIM:=0;
                PRC:=0;
                VR:=0;
                
                PH.SETRANGE(PH."No.","<Purch. Rcpt. Line2>"."Order No.");
                IF PH.FIND('-') THEN
                BEGIN
                  Order_Date:=PH."Order Date";
                END;
                
                IF Vendor.GET("<Purch. Rcpt. Line2>"."Buy-from Vendor No.") THEN
                BEGIN
                  Vend_Name:=Vendor.Name;
                  Vendor_Type:=FORMAT(Vendor."Vendor Type");
                  IF ("Document date">0D) AND (Order_Date>0D) AND ("Expected Receipt Date">0D) THEN
                  Deviation:=("Document date"-Order_Date)-("Expected Receipt Date"-Order_Date);
                  IF  Vendor."Vendor Type"=Vendor."Vendor Type"::Manufacturer THEN
                  BEGIN
                    //Quality:=0.6*("<Purch. Rcpt. Line2>".Quantity/("<Purch. Rcpt. Line2>".Quantity+"<Purch. Rcpt. Line2>"."Quantity Rejected"));
                    Quality:=0.6*(("<Purch. Rcpt. Line2>"."Quantity Accepted")/("<Purch. Rcpt. Line2>".Quantity));
                    CASE Deviation OF
                      0:                     TIM:=1*0.3;
                     -3,-2,-1,1,2,3:         TIM:=0.9*0.3;
                     -7,-6,-5,-4,4,5,6,7:    TIM:=0.6*0.3;
                     -10,-9,-8,8,9,10:       TIM:=0.3*0.3;
                     -100..100:TIM:=0;
                
                    END;
                  END ELSE
                  BEGIN
                    //Quality:=0.4*("<Purch. Rcpt. Line2>".Quantity/("<Purch. Rcpt. Line2>".Quantity+"<Purch. Rcpt. Line2>"."Quantity Rejected"));
                    Quality:=0.4*(("<Purch. Rcpt. Line2>"."Quantity Accepted")/("<Purch. Rcpt. Line2>".Quantity));
                
                    CASE Deviation OF
                    0:                       TIM:=1*0.5;
                    -3,-2,-1,1,2,3:          TIM:=0.9*0.5;
                    -7,-6,-5,-4,4,5,6,7:     TIM:=0.6*0.5;
                    -10,-9,-8,8,9,10:        TIM:=0.3*0.5;
                    -100..100:TIM:=0;
                    END;
                  END;
                
                END;
                  PIL.SETCURRENTKEY(PIL.Type,PIL."No.",PIL."Variant Code");
                  PIL.SETRANGE(PIL."No.","<Purch. Rcpt. Line2>"."No.");
                  PIL.SETRANGE(PIL."Buy-from Vendor No.","<Purch. Rcpt. Line2>"."Buy-from Vendor No.");
                
                  PIL.SETRANGE(PIL.Quantity,"<Purch. Rcpt. Line2>".Quantity);
                  PIL.SETRANGE(PIL."Receipt No.","<Purch. Rcpt. Line2>"."Document No.");
                  IF PIL.FIND('-') THEN
                  BEGIN
                    IF PIL."Gen. Bus. Posting Group"='FOREIGN' THEN
                      UC:=PIL."Unit Cost (LCY)"
                    ELSE
                      UC:=PIL."Amount To Vendor"/PIL.Quantity;
                  END;
                
                 /* PL.SETCURRENTKEY(PL."No.",PL."Unit Cost (LCY)");
                  PL.SETRANGE(PL."No.","<Purch. Rcpt. Line2>"."No.");
                  IF PL.FIND('-') THEN
                  IF   PL."Unit Cost (LCY)">0 THEN
                  BEGIN
                    PRC:=0.1*(1-(("<Purch. Rcpt. Line2>"."Unit Cost (LCY)"-PL."Unit Cost (LCY)")/PL."Unit Cost (LCY)"));
                  END;
                  IF PRC<0 THEN
                  PRC:=0;*/
                
                  AUC:=0;
                  Cnt:=0;
                  LUC:=0;
                  PL.SETCURRENTKEY(PL."No.",PL."Unit Cost (LCY)");
                  PL.SETRANGE(PL."No.","<Purch. Rcpt. Line2>"."No.");
                  PL.SETRANGE(PL.Sample,FALSE);
                  PL.SETRANGE(PL."Buy-from Vendor No.","<Purch. Rcpt. Line2>"."Buy-from Vendor No.");
                  PL.SETFILTER(PL."Unit Cost (LCY)",'>%1',0);
                  PL.SETRANGE(PL."Order Date",VE_From_Date,VE_To_Date);
                  IF PL.FINDFIRST THEN
                  BEGIN
                    LUC:=PL."Unit Cost (LCY)";
                    REPEAT
                      AUC+=PL."Unit Cost (LCY)";
                      Cnt+=1;
                    UNTIL PL.NEXT=0;
                    AUC:=AUC/Cnt;
                  END;
                
                  IF  (AUC>0) AND (LUC>0) THEN
                  BEGIN
                    PRC:=0.1*(1-((AUC-LUC)/LUC));
                  END;
                  IF PRC<0 THEN
                  PRC:=0;
                
                
                //Vr_T+=Quality;
                //Vr_Q+=TIM;
                Vr_Q+=Quality;
                Vr_T+=TIM;
                Vr_P+=PRC;
                Total_Qty+="<Purch. Rcpt. Line2>".Quantity;
                Total_Rejected+="<Purch. Rcpt. Line2>"."Quantity Rejected";
                Vendor_PPM:=("<Purch. Rcpt. Line2>"."Quantity Rejected"/"<Purch. Rcpt. Line2>".Quantity)*1000000;
                VR:=Quality+TIM+PRC;
                IF ("Expected Receipt Date">0D) AND  (Order_Date>0D) THEN
                 GLD:="Expected Receipt Date"-Order_Date;
                Vr_Avg+=VR;
                IF Excel THEN
                BEGIN
                  Row+=1;
                  EnterHeadings(Row,1,FORMAT(SNO),FALSE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,2,"<Purch. Rcpt. Line2>".Description,FALSE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,3,Vend_Name,FALSE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,4,Vendor_Type,FALSE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,5,"<Purch. Rcpt. Line2>"."Order No.",FALSE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,6,FORMAT(Order_Date),FALSE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,7,FORMAT("<Purch. Rcpt. Line2>"."Expected Receipt Date"),FALSE,Tempexcelbuffer."Cell Type"::Date);
                  EnterHeadings(Row,8,FORMAT("<Purch. Rcpt. Line2>"."Document date"),FALSE,Tempexcelbuffer."Cell Type"::Date);
                  EnterHeadings(Row,9,FORMAT("<Purch. Rcpt. Line2>".Quantity),FALSE,Tempexcelbuffer."Cell Type"::Number);
                  EnterHeadings(Row,10,FORMAT("<Purch. Rcpt. Line2>"."Quantity Rejected"),FALSE,Tempexcelbuffer."Cell Type"::Number);
                  EnterHeadings(Row,11,"<Purch. Rcpt. Line2>"."Unit of Measure",FALSE,Tempexcelbuffer."Cell Type"::Text);
                  IF (Order_Date>0D) AND ("<Purch. Rcpt. Line2>"."Expected Receipt Date">0D) THEN
                  EnterHeadings(Row,12,FORMAT("<Purch. Rcpt. Line2>"."Expected Receipt Date"-Order_Date),FALSE,Tempexcelbuffer."Cell Type"::Number);
                   IF ("Document date">0D) AND (Order_Date>0D)  THEN
                  EnterHeadings(Row,13,FORMAT("<Purch. Rcpt. Line2>"."Document date"-Order_Date),FALSE,Tempexcelbuffer."Cell Type"::Number);
                  EnterHeadings(Row,14,FORMAT(Deviation),FALSE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,15,FORMAT(UC),FALSE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,16,FORMAT(Quality*100),FALSE,Tempexcelbuffer."Cell Type"::Number);
                  EnterHeadings(Row,17,FORMAT(TIM*100),FALSE,Tempexcelbuffer."Cell Type"::Number);
                  EnterHeadings(Row,18,FORMAT(PRC*100),FALSE,Tempexcelbuffer."Cell Type"::Number);
                  EnterHeadings(Row,19,FORMAT(VR*100),FALSE,Tempexcelbuffer."Cell Type"::Number);
                   EnterHeadings(Row,20,FORMAT(Vendor_PPM),FALSE,Tempexcelbuffer."Cell Type"::Text);
                
                
                END;
                // Rev01 copy code from // <Purch. Rcpt. Line2>, Body (3) - OnPostSection()<<

            end;

            trigger OnPostDataItem();
            begin
                // Rev01 copy code from // <Purch. Rcpt. Line2>, Footer (4) - OnPostSection()>>
                IF SNO>0 THEN
                BEGIN
                  Vr_Avg:=Vr_Avg/SNO;
                  Vr_T:=  Vr_T/SNO;
                  Vr_P:=  Vr_P/SNO;
                  Vr_Q:=  Vr_Q/SNO;
                  Total_Vendor_PPM:=(Total_Rejected/Total_Qty)*1000000;
                END;
                IF Excel THEN
                BEGIN
                  Row+=1;
                  EnterHeadings(Row,16,FORMAT(ROUND(Vr_Q*100,2)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                  EnterHeadings(Row,17,FORMAT(ROUND(Vr_T*100,2)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                  EnterHeadings(Row,18,FORMAT(ROUND(Vr_P*100,2)),TRUE,Tempexcelbuffer."Cell Type"::Number);


                  EnterHeadings(Row,19,FORMAT(Vr_Avg*100),TRUE,Tempexcelbuffer."Cell Type"::Number);
                     EnterHeadings(Row,20,FORMAT(ROUND(Total_Vendor_PPM,2)),TRUE,Tempexcelbuffer."Cell Type"::Number);


                END;
                // Rev01 copy code from // <Purch. Rcpt. Line2>, Footer (4) - OnPostSection()<<
            end;

            trigger OnPreDataItem();
            begin
                IF Choice<>Choice::VEO THEN
                CurrReport.BREAK;
                 IF FORMAT(lOC_CODE)<>'ALL' THEN
                   "<Purch. Rcpt. Line2>".SETFILTER("<Purch. Rcpt. Line2>"."Location Code",FORMAT(lOC_CODE));

                "<Purch. Rcpt. Line2>".SETRANGE("<Purch. Rcpt. Line2>"."Document date",VE_From_Date,VE_To_Date);
                 IF Excel THEN
                 BEGIN
                   CLEAR(Tempexcelbuffer);
                   Tempexcelbuffer.DELETEALL;
                 END;
                Row:=0;
                // rev01 copy code from // <Purch. Rcpt. Line2>, Header (2) - OnPostSection()>>
                IF Excel AND (Row=0)  THEN
                BEGIN
                  Row+=1;
                  EnterHeadings(Row,1,'S.No',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,2,'Item',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,3,'Vendor',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,4,'Vendor Type',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,5,'Order No.',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,6,'Order Date',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,7,'Expected Receipt Date',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,8,'Inward Date',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,9,'Quantity',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,10,'Quantity Rejected',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,11,'UOM',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,12,'Given Lead Time',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,13,'Lead Time',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,14,'Deviation',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,15,'Unit Cost (With taxes)',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,16,'Quantity (Rating)',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,17,'Delivery (Rating)',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,18,'Price (Rating)',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,19,'Vendor Rating',TRUE,Tempexcelbuffer."Cell Type"::Text);
                END;
                // rev01 copy code from // <Purch. Rcpt. Line2>, Header (2) - OnPostSection()>>
            end;
        }
        dataitem("<Purch. Rcpt. Line3>";"Purch. Rcpt. Line")
        {
            CalcFields = Document date;
            DataItemTableView = SORTING(No.) ORDER(Ascending) WHERE(Quantity=FILTER(>0));
            column(Choice_VEI;Choice)
            {
            }
            column(COMPANYNAME_Control1102154089;COMPANYNAME)
            {
            }
            column(TODAY_Control1102154101;TODAY)
            {
            }
            column(USERID_Control1102154102;USERID)
            {
            }
            column(Purch__Rcpt__Line3__Description;Description)
            {
            }
            column(Vend_Name_Control1102154162;Vend_Name)
            {
            }
            column(Purch__Rcpt__Line3___Order_No__;"Order No.")
            {
            }
            column(Purch__Rcpt__Line3___Expected_Receipt_Date_;"Expected Receipt Date")
            {
            }
            column(Purch__Rcpt__Line3___Document_date_;"Document date")
            {
            }
            column(Vendor_Type_Control1102154166;Vendor_Type)
            {
            }
            column(Order_Date_Control1102154167;Order_Date)
            {
            }
            column(Purch__Rcpt__Line3__Quantity;Quantity)
            {
            }
            column(Purch__Rcpt__Line3___Unit_of_Measure_;"Unit of Measure")
            {
            }
            column(Purch__Rcpt__Line3___Quantity_Rejected_;"Quantity Rejected")
            {
            }
            column(GLD_Control1102154171;GLD)
            {
            }
            column(Document_date__Order_Date_Control1102154172;"Document date"-Order_Date)
            {
            }
            column(Deviation_Control1102154173;Deviation)
            {
            }
            column(SNO_Control1102154174;SNO)
            {
            }
            column(ROUND__VR_100__1__Control1102154175;ROUND((VR*100),1))
            {
            }
            column(ROUND__PRC_100__1__Control1102154176;ROUND((PRC*100),1))
            {
            }
            column(ROUND__TIM_100__1__Control1102154177;ROUND((TIM*100),1))
            {
            }
            column(ROUND__Quality_100__1__Control1102154178;ROUND((Quality*100),1))
            {
            }
            column(UC_Control1102154179;UC)
            {
            }
            column(ROUND_Vendor_PPM_1__Control1102154258;ROUND(Vendor_PPM,1))
            {
            }
            column(ROUND__Vr_Avg_100__0_01__Control1102154180;ROUND((Vr_Avg*100),0.01))
            {
            }
            column(Purch__Rcpt__Line3___Quantity_Rejected__Control1102154183;"Quantity Rejected")
            {
            }
            column(Purch__Rcpt__Line3__Quantity_Control1102154182;Quantity)
            {
            }
            column(Avg_Lead_Time_Control1102154185;Avg_Lead_Time)
            {
            }
            column(Avg_Unit_Cost;Avg_Unit_Cost)
            {
            }
            column(ROUND__Vr_P_100__0_01__Control1102154188;ROUND((Vr_P*100),0.01))
            {
            }
            column(ROUND__Vr_P_100__0_01__Control1102154189;ROUND((Vr_P*100),0.01))
            {
            }
            column(ROUND__Vr_T_100__0_01__Control1102154190;ROUND((Vr_T*100),0.01))
            {
            }
            column(ROUND_Total_Vendor_PPM_1_;ROUND(Total_Vendor_PPM,1))
            {
            }
            column(VENDOR_EVALUTIONCaption_Control1102154086;VENDOR_EVALUTIONCaption_Control1102154086Lbl)
            {
            }
            column(S_No_Caption_Control1102154088;S_No_Caption_Control1102154088Lbl)
            {
            }
            column(Order_No_Caption;Order_No_CaptionLbl)
            {
            }
            column(VendorCaption_Control1102154103;VendorCaption_Control1102154103Lbl)
            {
            }
            column(Expected_Receipt_DateCaption;Expected_Receipt_DateCaptionLbl)
            {
            }
            column(Inward_DateCaption_Control1102154141;Inward_DateCaption_Control1102154141Lbl)
            {
            }
            column(Vendor_TypeCaption_Control1102154146;Vendor_TypeCaption_Control1102154146Lbl)
            {
            }
            column(Order_DateCaption_Control1102154148;Order_DateCaption_Control1102154148Lbl)
            {
            }
            column(QuantityCaption_Control1102154149;QuantityCaption_Control1102154149Lbl)
            {
            }
            column(UOMCaption_Control1102154150;UOMCaption_Control1102154150Lbl)
            {
            }
            column(Vendor_RatingCaption_Control1102154151;Vendor_RatingCaption_Control1102154151Lbl)
            {
            }
            column(PriceCaption_Control1102154152;PriceCaption_Control1102154152Lbl)
            {
            }
            column(TimeCaption_Control1102154153;TimeCaption_Control1102154153Lbl)
            {
            }
            column(QualityCaption_Control1102154154;QualityCaption_Control1102154154Lbl)
            {
            }
            column(Unit_Cost___With__Taxes_Caption_Control1102154155;Unit_Cost___With__Taxes_Caption_Control1102154155Lbl)
            {
            }
            column(DeviationCaption_Control1102154156;DeviationCaption_Control1102154156Lbl)
            {
            }
            column(Lead_TimeCaption_Control1102154157;Lead_TimeCaption_Control1102154157Lbl)
            {
            }
            column(Given_Lead_TimeCaption_Control1102154158;Given_Lead_TimeCaption_Control1102154158Lbl)
            {
            }
            column(Qty__RejectedCaption_Control1102154159;Qty__RejectedCaption_Control1102154159Lbl)
            {
            }
            column(Vendor_PPMCaption_Control1102154257;Vendor_PPMCaption_Control1102154257Lbl)
            {
            }
            column(Purch__Rcpt__Line3__Document_No_;"Document No.")
            {
            }
            column(Purch__Rcpt__Line3__Line_No_;"Line No.")
            {
            }
            column(Purch__Rcpt__Line3__No_;"No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF "<Purch. Rcpt. Line3>".Quantity<>("<Purch. Rcpt. Line3>"."Quantity Accepted"+"<Purch. Rcpt. Line3>"."Quantity Rejected") THEN
                CurrReport.SKIP;

                // Copy code from //<Purch. Rcpt. Line3>, GroupHeader (3) - OnPostSection() <<
                IF Previous_item <>"<Purch. Rcpt. Line3>"."No." THEN
                BEGIN
                  IF Previous_item <>'' THEN
                  BEGIN
                    IF SNO>0 THEN
                    BEGIN
                      Vr_Avg:=  Vr_Avg/SNO;
                      Vr_T  :=  Vr_T/SNO;
                      Vr_P  :=  Vr_P/SNO;
                      Vr_Q  :=  Vr_Q/SNO;
                      Vr_M  :=  Vr_M/SNO;
                      Vr_PT :=  Vr_PT/SNO;

                      Total_Vendor_PPM:=(Total_Rejected/Total_Qty)*1000000;
                      Avg_Lead_Time:=Tot_Lead_Time/SNO;
                      Avg_Unit_Cost:=Avg_Unit_Cost/"<Purch. Rcpt. Line3>".Quantity;
                    END;
                    IF Excel THEN
                    BEGIN
                      IF Vendor_Records THEN
                      BEGIN
                        Row+=1;
                        EnterHeadings(Row,15,FORMAT(ROUND(Vr_Q*100,0.01)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                        EnterHeadings(Row,16,FORMAT(ROUND(Vr_T*100,0.01)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                        EnterHeadings(Row,17,FORMAT(ROUND(Vr_P*100,0.01)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                        EnterHeadings(Row,18,FORMAT(ROUND(Vr_M*100,0.01)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                        EnterHeadings(Row,19,FORMAT(ROUND(Vr_PT*100,0.01)),TRUE,Tempexcelbuffer."Cell Type"::Number);

                        EnterHeadings(Row,20,FORMAT(ROUND(Vr_Avg*100,0.01)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                        EnterHeadings(Row,21,FORMAT(ROUND(Total_Vendor_PPM,1)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                      END;
                    END;
                  END;
                  Vr_Avg:=0;
                  Vr_T  :=0;
                  Vr_P  :=0;
                  Vr_Q  :=0;
                  Vr_M  :=0;
                  Vr_PT :=0;
                  SNO:=0;
                  Tot_Lead_Time:=0;
                  Avg_Unit_Cost:=0;
                  Total_Qty:=0;
                  Total_Rejected:=0;
                  IF Excel THEN
                  BEGIN
                    Row+=1;
                    EnterHeadings(Row,1,FORMAT("<Purch. Rcpt. Line3>".Description),TRUE,Tempexcelbuffer."Cell Type"::Text);
                  END;
                  Previous_item:="<Purch. Rcpt. Line3>"."No.";
                END;
                // Copy code from //<Purch. Rcpt. Line3>, GroupHeader (3) - OnPostSection() <<

                // Copy code from // <Purch. Rcpt. Line3>, Body (4) - OnPostSection() >>
                SNO+=1;

                Quality:=0;
                TIM:=0;
                PRC:=0;
                PTR:=0;
                MOQ:=0;
                VR:=0;

                PH.SETRANGE(PH."No.","<Purch. Rcpt. Line3>"."Order No.");
                IF PH.FIND('-') THEN
                BEGIN
                  Order_Date:=PH."Order Date";
                  payment_terms.RESET;
                  payment_terms.SETFILTER(payment_terms.Code,PH."Payment Terms Code");
                  IF payment_terms.FINDFIRST THEN
                  BEGIN
                    IF (payment_terms."Percentage 1">0) AND (payment_terms."Percentage 2">0) THEN
                       PTR:=0.05
                    ELSE IF (payment_terms."Percentage 1"=100) AND (NOT(FORMAT(payment_terms."Due Date Calculation") IN ['0D',''])) THEN
                      PTR:=0.03
                    ELSE IF (payment_terms."Percentage 1"=100) AND (FORMAT(payment_terms."Due Date Calculation") IN ['0D',''])THEN
                      PTR:=0.01;
                  END;
                END;

                IF Vendor.GET("<Purch. Rcpt. Line3>"."Buy-from Vendor No.") THEN
                BEGIN
                  Vend_Name:=Vendor.Name;
                  Vendor_Type:=FORMAT(Vendor."Vendor Type");
                  IF ("Document date">0D) AND (Order_Date>0D) AND ("Expected Receipt Date">0D) THEN
                    Deviation:=("Document date"-Order_Date)-("Expected Receipt Date"-Order_Date);
                    Quality:=0.5*(("<Purch. Rcpt. Line3>"."Quantity Accepted")/("<Purch. Rcpt. Line3>".Quantity*"<Purch. Rcpt. Line3>"."Qty. per Unit of Measure"));
                    IF (Deviation >= -1) AND (Deviation <= 1)THEN
                      TIM:=1*0.25;
                END;


                IF ("Expected Receipt Date">0D) AND  (Order_Date>0D) THEN
                  GLD:="Expected Receipt Date"-Order_Date;
                  PIL.SETCURRENTKEY(PIL.Type,PIL."No.",PIL."Variant Code");
                  PIL.SETRANGE(PIL."No.","<Purch. Rcpt. Line3>"."No.");
                  PIL.SETRANGE(PIL."Buy-from Vendor No.","<Purch. Rcpt. Line3>"."Buy-from Vendor No.");
                  PIL.SETRANGE(PIL.Quantity,"<Purch. Rcpt. Line3>".Quantity);
                  PIL.SETRANGE(PIL."Receipt No.","<Purch. Rcpt. Line3>"."Document No.");
                  IF PIL.FIND('-') THEN
                  BEGIN
                    IF PIL."Gen. Bus. Posting Group"='FOREIGN' THEN
                      UC:=PIL."Unit Cost (LCY)"
                    ELSE
                      UC:=PIL."Amount To Vendor"/PIL.Quantity;
                  END;


                  AUC:=0;
                  Cnt:=0;
                  LUC:=0;
                  PL.SETCURRENTKEY(PL."No.",PL."Unit Cost (LCY)");
                  PL.SETRANGE(PL."No.","<Purch. Rcpt. Line3>"."No.");
                  PL.SETRANGE(PL.Sample,FALSE);
                  PL.SETRANGE(PL."Buy-from Vendor No.","<Purch. Rcpt. Line3>"."Buy-from Vendor No.");
                  PL.SETFILTER(PL."Unit Cost (LCY)",'>%1',0);
                  PL.SETRANGE(PL."Order Date",VE_From_Date,VE_To_Date);
                  IF PL.FINDFIRST THEN
                  BEGIN
                    LUC:=PL."Unit Cost (LCY)";
                    REPEAT
                      AUC+=PL."Unit Cost (LCY)";
                      Cnt+=1;
                    UNTIL PL.NEXT=0;
                    AUC:=AUC/Cnt;
                  END;

                  IF  (AUC>0) AND (LUC>0) THEN
                  BEGIN
                    PRC:=0.1*(1-((AUC-LUC)/LUC));
                  END;
                  IF PRC<0 THEN
                  PRC:=0;

                Vr_T+=Quality;
                Vr_Q+=TIM;
                Vr_P+=PRC;
                Vr_M+=MOQ;
                Vr_PT+=PTR;
                VR:=Quality+TIM+PRC+MOQ+PTR;
                Total_Qty+="<Purch. Rcpt. Line3>".Quantity;
                Total_Rejected+="<Purch. Rcpt. Line3>"."Quantity Rejected";
                Vendor_PPM:=("<Purch. Rcpt. Line3>"."Quantity Rejected"/"<Purch. Rcpt. Line3>".Quantity)*1000000;
                Tot_Lead_Time+="<Purch. Rcpt. Line3>"."Document date"-Order_Date;
                Avg_Unit_Cost+="<Purch. Rcpt. Line3>".Quantity*UC;

                Vr_Avg+=VR;
                IF Excel AND (NOT Vendor_Records) THEN
                BEGIN
                  Row+=1;
                  EnterHeadings(Row,1,FORMAT(SNO),FALSE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,2,Vend_Name,FALSE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,3,Vendor_Type,FALSE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,4,"<Purch. Rcpt. Line3>"."Order No.",FALSE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,5,FORMAT(Order_Date),FALSE,Tempexcelbuffer."Cell Type"::Date);
                  EnterHeadings(Row,6,FORMAT("<Purch. Rcpt. Line3>"."Expected Receipt Date"),FALSE,Tempexcelbuffer."Cell Type"::Date);
                  EnterHeadings(Row,7,FORMAT("<Purch. Rcpt. Line3>"."Document date"),FALSE,Tempexcelbuffer."Cell Type"::Date);
                  EnterHeadings(Row,8,FORMAT("<Purch. Rcpt. Line3>".Quantity),FALSE,Tempexcelbuffer."Cell Type"::Number);
                  EnterHeadings(Row,9,FORMAT("<Purch. Rcpt. Line3>"."Quantity Rejected"),FALSE,Tempexcelbuffer."Cell Type"::Number);
                  EnterHeadings(Row,10,"<Purch. Rcpt. Line3>"."Unit of Measure",FALSE,Tempexcelbuffer."Cell Type"::Text);
                   IF  (Order_Date>0D) AND ("Expected Receipt Date">0D) THEN
                  EnterHeadings(Row,11,FORMAT("<Purch. Rcpt. Line3>"."Expected Receipt Date"-Order_Date),FALSE,Tempexcelbuffer."Cell Type"::Number);
                   IF ("Document date">0D) AND (Order_Date>0D)  THEN
                  EnterHeadings(Row,12,FORMAT("<Purch. Rcpt. Line3>"."Document date"-Order_Date),FALSE,Tempexcelbuffer."Cell Type"::Number);
                  EnterHeadings(Row,13,FORMAT(Deviation),FALSE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,14,FORMAT(UC),FALSE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,15,FORMAT(Quality*100),FALSE,Tempexcelbuffer."Cell Type"::Number);
                  EnterHeadings(Row,16,FORMAT(TIM*100),FALSE,Tempexcelbuffer."Cell Type"::Number);
                  EnterHeadings(Row,17,FORMAT(PRC*100),FALSE,Tempexcelbuffer."Cell Type"::Number);
                  EnterHeadings(Row,18,FORMAT(MOQ*100),FALSE,Tempexcelbuffer."Cell Type"::Number);
                  EnterHeadings(Row,19,FORMAT(PTR*100),FALSE,Tempexcelbuffer."Cell Type"::Number);
                  EnterHeadings(Row,20,FORMAT(VR*100),FALSE,Tempexcelbuffer."Cell Type"::Number);
                     EnterHeadings(Row,21,FORMAT(Vendor_PPM),FALSE,Tempexcelbuffer."Cell Type"::Text);
                END;
                // Copy code from // <Purch. Rcpt. Line3>, Body (4) - OnPostSection() <<
            end;

            trigger OnPostDataItem();
            begin
                IF SNO>0 THEN
                BEGIN
                  Vr_Avg:=Vr_Avg/SNO;
                  Vr_T  :=  Vr_T/SNO;
                  Vr_P  :=  Vr_P/SNO;
                  Vr_Q  :=  Vr_Q/SNO;
                  Vr_M  :=  Vr_M/SNO;
                  Vr_PT :=  Vr_PT/SNO;

                   Total_Vendor_PPM:=(Total_Rejected/Total_Qty)*1000000;
                  Avg_Lead_Time:=Tot_Lead_Time/SNO;
                  Avg_Unit_Cost:=Avg_Unit_Cost/"<Purch. Rcpt. Line3>".Quantity;
                END;
                IF Excel THEN
                BEGIN
                  IF Vendor_Records THEN
                  BEGIN
                    Row+=1;
                    EnterHeadings(Row,15,FORMAT(ROUND(Vr_Q*100,0.01)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row,16,FORMAT(ROUND(Vr_T*100,0.01)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row,17,FORMAT(ROUND(Vr_P*100,0.01)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row,18,FORMAT(ROUND(Vr_M*100,0.01)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row,19,FORMAT(ROUND(Vr_PT*100,0.01)),TRUE,Tempexcelbuffer."Cell Type"::Number);

                    EnterHeadings(Row,20,FORMAT(ROUND(Vr_Avg*100,0.01)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row,21,FORMAT(ROUND(Total_Vendor_PPM,1)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                  END;
                END;
            end;

            trigger OnPreDataItem();
            begin
                SNO:=0;
                IF Choice<>Choice::VEI THEN
                CurrReport.BREAK;
                "<Purch. Rcpt. Line3>".SETRANGE("<Purch. Rcpt. Line3>"."Document date",VE_From_Date,VE_To_Date);
                 IF FORMAT(lOC_CODE)<>'ALL' THEN
                   "<Purch. Rcpt. Line3>".SETFILTER("<Purch. Rcpt. Line3>"."Location Code",FORMAT(lOC_CODE));

                 IF Excel THEN
                 BEGIN
                   CLEAR(Tempexcelbuffer);
                   Tempexcelbuffer.DELETEALL;
                 END;

                // Rev01 Copy code from // <Purch. Rcpt. Line3>, Header (2) - OnPostSection()<<
                IF Excel AND (Row=0) THEN
                BEGIN
                  IF NOT Vendor_Records THEN
                  BEGIN
                    Row+=1;
                    EnterHeadings(Row,1,'S.No',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,2,'Vendor',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,3,'Vendor Type',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,4,'Order No.',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,5,'Order Date',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,6,'Expected Receipt Date',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,7,'Inward Date',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,8,'Quantity',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,9,'Quantity Rejected',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,10,'UOM',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,11,'Given Lead Time',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,12,'Lead Time',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,13,'Deviation',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,14,'Unit Cost (With taxes)',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,15,'Quantity (Rating)',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,16,'Delivery (Rating)',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,17,'Price (Rating)',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,18,'MOQ (Rating)',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,19,'Payment terms (Rating)',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,20,'Vendor Rating',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  END ELSE
                  BEGIN
                    EnterHeadings(Row,1,'MONTH',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,2,'Vendor',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,3,'Vendor Type',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,4,'Quality Rating',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,5,'Delivery Rating',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,6,'Price rating',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,7,'MOQ (Rating)',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,8,'Payment terms (Rating)',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,9,'Vendor Rating',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,10,'Vendor PPM',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,11,'Grade',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  END;
                END;
                // Rev01 Copy code from // <Purch. Rcpt. Line3>, Header (2) - OnPostSection()<<
            end;
        }
        dataitem("<Purch. Rcpt. Line4>";"Purch. Rcpt. Line")
        {
            CalcFields = Document date;
            DataItemTableView = SORTING(Buy-from Vendor No.,No.,Type) ORDER(Ascending) WHERE(Quantity=FILTER(>0));
            column(USERID_Control1102154092;USERID)
            {
            }
            column(TODAY_Control1102154093;TODAY)
            {
            }
            column(COMPANYNAME_Control1102154094;COMPANYNAME)
            {
            }
            column(Choice_VEV;Choice)
            {
            }
            column(Vend_Name_Control1102154097;Vend_Name)
            {
            }
            column(Vendor_Type_Control1102154234;Vendor_Type)
            {
            }
            column(ROUND__VR_100__1__Control1102154219;ROUND((VR*100),1))
            {
            }
            column(ROUND__PRC_100__1__Control1102154220;ROUND((PRC*100),1))
            {
            }
            column(ROUND__TIM_100__1__Control1102154221;ROUND((TIM*100),1))
            {
            }
            column(ROUND__Quality_100__1__Control1102154222;ROUND((Quality*100),1))
            {
            }
            column(UC_Control1102154223;UC)
            {
            }
            column(Deviation_Control1102154224;Deviation)
            {
            }
            column(Document_date__Order_Date_Control1102154225;"Document date"-Order_Date)
            {
            }
            column(GLD_Control1102154226;GLD)
            {
            }
            column(Purch__Rcpt__Line4___Unit_of_Measure_;"Unit of Measure")
            {
            }
            column(Purch__Rcpt__Line4___Quantity_Rejected_;"Quantity Rejected")
            {
            }
            column(Purch__Rcpt__Line4__Quantity;Quantity)
            {
            }
            column(Purch__Rcpt__Line4___Document_date_;"Document date")
            {
            }
            column(Purch__Rcpt__Line4___Expected_Receipt_Date_;"Expected Receipt Date")
            {
            }
            column(Order_Date_Control1102154232;Order_Date)
            {
            }
            column(Purch__Rcpt__Line4___Order_No__;"Order No.")
            {
            }
            column(SNO_Control1102154236;SNO)
            {
            }
            column(Purch__Rcpt__Line4__Description;Description)
            {
            }
            column(ROUND_Vendor_PPM_1__Control1102154262;ROUND(Vendor_PPM,1))
            {
            }
            column(ROUND__Vr_Avg_100__0_01__Control1102154239;ROUND((Vr_Avg*100),0.01))
            {
            }
            column(ROUND__Vr_Q_100__0_01_;ROUND((Vr_Q*100),0.01))
            {
            }
            column(ROUND__Vr_T_100__0_01__Control1102154192;ROUND((Vr_T*100),0.01))
            {
            }
            column(ROUND__Vr_P_100__0_01__Control1102154193;ROUND((Vr_P*100),0.01))
            {
            }
            column(ROUND_Total_Vendor_PPM_1__Control1102154264;ROUND(Total_Vendor_PPM,1))
            {
            }
            column(VENDOR_EVALUTIONCaption_Control1102154091;VENDOR_EVALUTIONCaption_Control1102154091Lbl)
            {
            }
            column(Vendor_RatingCaption_Control1102154200;Vendor_RatingCaption_Control1102154200Lbl)
            {
            }
            column(PriceCaption_Control1102154202;PriceCaption_Control1102154202Lbl)
            {
            }
            column(TimeCaption_Control1102154203;TimeCaption_Control1102154203Lbl)
            {
            }
            column(QualityCaption_Control1102154204;QualityCaption_Control1102154204Lbl)
            {
            }
            column(Unit_Cost___With__Taxes_Caption_Control1102154205;Unit_Cost___With__Taxes_Caption_Control1102154205Lbl)
            {
            }
            column(DeviationCaption_Control1102154206;DeviationCaption_Control1102154206Lbl)
            {
            }
            column(Lead_TimeCaption_Control1102154207;Lead_TimeCaption_Control1102154207Lbl)
            {
            }
            column(Given_Lead_TimeCaption_Control1102154208;Given_Lead_TimeCaption_Control1102154208Lbl)
            {
            }
            column(UOMCaption_Control1102154209;UOMCaption_Control1102154209Lbl)
            {
            }
            column(Qty__RejectedCaption_Control1102154210;Qty__RejectedCaption_Control1102154210Lbl)
            {
            }
            column(QuantityCaption_Control1102154211;QuantityCaption_Control1102154211Lbl)
            {
            }
            column(Inward_DateCaption_Control1102154212;Inward_DateCaption_Control1102154212Lbl)
            {
            }
            column(Expected_Receipt_DateCaption_Control1102154213;Expected_Receipt_DateCaption_Control1102154213Lbl)
            {
            }
            column(Order_DateCaption_Control1102154214;Order_DateCaption_Control1102154214Lbl)
            {
            }
            column(Order_No_Caption_Control1102154215;Order_No_Caption_Control1102154215Lbl)
            {
            }
            column(S_No_Caption_Control1102154218;S_No_Caption_Control1102154218Lbl)
            {
            }
            column(ItemCaption_Control1102154238;ItemCaption_Control1102154238Lbl)
            {
            }
            column(Vendor_PPMCaption_Control1102154260;Vendor_PPMCaption_Control1102154260Lbl)
            {
            }
            column(EmptyStringCaption;EmptyStringCaptionLbl)
            {
            }
            column(EmptyStringCaption_Control1102154256;EmptyStringCaption_Control1102154256Lbl)
            {
            }
            column(Purch__Rcpt__Line4__Document_No_;"Document No.")
            {
            }
            column(Purch__Rcpt__Line4__Line_No_;"Line No.")
            {
            }
            column(Purch__Rcpt__Line4__Buy_from_Vendor_No_;"Buy-from Vendor No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                  IF Previous_Vendor <>"<Purch. Rcpt. Line4>"."Buy-from Vendor No." THEN
                  BEGIN
                    IF Previous_Vendor <>'' THEN
                    BEGIN
                      IF SNO>0 THEN
                      BEGIN
                        Vr_Avg:=Vr_Avg/SNO;
                        Vr_T:=  Vr_T/SNO;
                        Vr_P:=  Vr_P/SNO;
                        Vr_Q:=  Vr_Q/SNO;
                        Vr_M:=  Vr_M/SNO;
                        Vr_PT:=  Vr_PT/SNO;
                        Total_Vendor_PPM:=(Total_Rejected/Total_Qty)*1000000;
                      END;
                      IF Excel THEN
                      BEGIN
                        IF NOT Vendor_Records THEN
                        BEGIN
                          Row+=1;
                          EnterHeadings(Row,14,FORMAT(ROUND(Vr_Q*100,1)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                          EnterHeadings(Row,15,FORMAT(ROUND(Vr_T*100,1)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                          EnterHeadings(Row,16,FORMAT(ROUND(Vr_P*100,1)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                          EnterHeadings(Row,17,FORMAT(ROUND(Vr_M*100,1)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                          EnterHeadings(Row,18,FORMAT(ROUND(Vr_PT*100,1)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                          EnterHeadings(Row,19,FORMAT(ROUND(Vr_Avg*100,1)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                        END ELSE
                        BEGIN
                          Row+=1;
                          EnterHeadings(Row,2,FORMAT(Vend_Name),TRUE,Tempexcelbuffer."Cell Type"::Text);
                          EnterHeadings(Row,3,FORMAT(Vendor_Type),TRUE,Tempexcelbuffer."Cell Type"::Text);
                          EnterHeadings(Row,4,FORMAT(ROUND(Vr_Q*100,0.01)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                          EnterHeadings(Row,5,FORMAT(ROUND(Vr_T*100,0.01)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                          EnterHeadings(Row,6,FORMAT(ROUND(Vr_P*100,0.01)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                          EnterHeadings(Row,7,FORMAT(ROUND(Vr_M*100,0.01)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                          EnterHeadings(Row,8,FORMAT(ROUND(Vr_PT*100,0.01)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                          EnterHeadings(Row,9,FORMAT(ROUND(Vr_Avg*100,0.01)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                          EnterHeadings(Row,10,FORMAT(ROUND(Total_Vendor_PPM,0.01)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                          IF ROUND(Vr_Avg*100,0.01)>=90 THEN
                             EnterHeadings(Row,11,'A',TRUE,Tempexcelbuffer."Cell Type"::Text)
                          ELSE IF (ROUND(Vr_Avg*100,0.01)>=80) AND (ROUND(Vr_Avg*100,0.01)<90) THEN
                             EnterHeadings(Row,11,'B',TRUE,Tempexcelbuffer."Cell Type"::Text)
                          ELSE IF (ROUND(Vr_Avg*100,0.01)>=70) AND (ROUND(Vr_Avg*100,0.01)<80) THEN
                             EnterHeadings(Row,11,'C',TRUE,Tempexcelbuffer."Cell Type"::Text)
                          ELSE
                             EnterHeadings(Row,11,'D',TRUE,Tempexcelbuffer."Cell Type"::Text);
                        END;
                      END;
                    END;
                    IF Vendor.GET("<Purch. Rcpt. Line4>"."Buy-from Vendor No.") THEN
                    BEGIN
                      Vend_Name:=Vendor.Name;
                      Vendor_Type:=FORMAT(Vendor."Vendor Type");
                    END;

                    Vr_Avg:=0;
                    Vr_T:=0;
                    Vr_P:=0;
                    Vr_Q:=0;
                    Vr_M:=0;
                    Vr_PT:=0;

                    Total_Qty:=0;
                    Total_Rejected:=0;
                    SNO:=0;

                    IF Excel AND (NOT Vendor_Records) THEN
                    BEGIN
                      Row+=1;
                      EnterHeadings(Row,1,FORMAT(Vend_Name),TRUE,Tempexcelbuffer."Cell Type"::Text);
                      EnterHeadings(Row,3,FORMAT(Vendor_Type),TRUE,Tempexcelbuffer."Cell Type"::Text);
                    END;
                    Previous_Vendor:="<Purch. Rcpt. Line4>"."Buy-from Vendor No.";
                  END;

                  SNO+=1;

                  Quality:=0;
                  TIM:=0;
                  PRC:=0;
                  PTR:=0;
                  MOQ:=0;
                  VR:=0;

                  PH.SETRANGE(PH."No.","<Purch. Rcpt. Line4>"."Order No.");
                  IF PH.FIND('-') THEN
                  BEGIN
                    Order_Date:=PH."Order Date";
                    payment_terms.RESET;
                    payment_terms.SETFILTER(payment_terms.Code,PH."Payment Terms Code");
                    IF payment_terms.FINDFIRST THEN
                    BEGIN
                      IF (payment_terms."Percentage 1">0) AND (payment_terms."Percentage 2">0) THEN
                         PTR:=0.05
                      ELSE IF (payment_terms."Percentage 1"=100) AND (NOT(FORMAT(payment_terms."Due Date Calculation") IN ['0D',''])) THEN
                        PTR:=0.03
                      ELSE IF (payment_terms."Percentage 1"=100) AND (FORMAT(payment_terms."Due Date Calculation") IN ['0D',''])THEN
                        PTR:=0.01;
                    END;
                  END;

                  IF Vendor.GET("<Purch. Rcpt. Line4>"."Buy-from Vendor No.") THEN
                  BEGIN
                    Vend_Name:=Vendor.Name;
                    Vendor_Type:=FORMAT(Vendor."Vendor Type");
                    IF ("Document date">0D) AND (Order_Date>0D) AND ("Expected Receipt Date">0D) THEN
                      Deviation:=("Document date"-Order_Date)-("Expected Receipt Date"-Order_Date);
                      Quality:=0.5*(("<Purch. Rcpt. Line4>"."Quantity Accepted")/("<Purch. Rcpt. Line4>".Quantity*"<Purch. Rcpt. Line4>"."Qty. per Unit of Measure"));
                      IF (Deviation >= -1) AND (Deviation <= 1)THEN
                        TIM:=1*0.25;
                  END;

                  IF ("Expected Receipt Date">0D) AND  (Order_Date>0D) THEN
                    GLD:="Expected Receipt Date"-Order_Date;
                  PIL.SETCURRENTKEY(PIL.Type,PIL."No.",PIL."Variant Code");
                  PIL.SETRANGE(PIL."No.","<Purch. Rcpt. Line4>"."No.");
                  PIL.SETRANGE(PIL."Buy-from Vendor No.","<Purch. Rcpt. Line4>"."Buy-from Vendor No.");
                  PIL.SETRANGE(PIL.Quantity,"<Purch. Rcpt. Line4>".Quantity);
                  PIL.SETRANGE(PIL."Receipt No.","<Purch. Rcpt. Line4>"."Document No.");
                  IF PIL.FIND('-') THEN
                  BEGIN
                    IF PIL."Gen. Bus. Posting Group"='FOREIGN' THEN
                      UC:=PIL."Unit Cost (LCY)"
                    ELSE
                      UC:=PIL."Amount To Vendor"/PIL.Quantity;
                  END;


                  AUC:=0;
                  Cnt:=0;
                  LUC:=0;
                  PL.SETCURRENTKEY(PL."No.",PL."Unit Cost (LCY)");
                  PL.SETRANGE(PL."No.","<Purch. Rcpt. Line4>"."No.");
                  PL.SETRANGE(PL.Sample,FALSE);
                  PL.SETRANGE(PL."Buy-from Vendor No.","<Purch. Rcpt. Line4>"."Buy-from Vendor No.");
                  PL.SETFILTER(PL."Unit Cost (LCY)",'>%1',0);
                  PL.SETRANGE(PL."Order Date",VE_From_Date,VE_To_Date);
                  IF PL.FINDFIRST THEN
                  BEGIN
                    LUC:=PL."Unit Cost (LCY)";
                    REPEAT
                      AUC+=PL."Unit Cost (LCY)";
                      Cnt+=1;
                    UNTIL PL.NEXT=0;
                    AUC:=AUC/Cnt;
                  END;

                  IF  (AUC>0) AND (LUC>0) THEN
                  BEGIN
                    PRC:=0.1*(1-((AUC-LUC)/LUC));
                  END;
                  IF PRC<0 THEN
                    PRC:=0;

                  PL.RESET;
                  PL.SETFILTER(PL."Document No.","<Purch. Rcpt. Line4>"."Order No.");
                  PL.SETFILTER(PL."No.","<Purch. Rcpt. Line4>"."No.");
                  IF PL.FINDFIRST THEN
                  BEGIN
                    item.RESET;
                    IF item.GET("<Purch. Rcpt. Line4>"."No.")  THEN
                    BEGIN
                      IF PL.Quantity>item."Minimum Order Quantity" THEN
                         MOQ:=0.05
                      ELSE
                        MOQ:=0.05*(PL.Quantity/item."Minimum Order Quantity");
                    END
                    ELSE
                      MOQ:=0.05;
                  END;

                  VR:=Quality+TIM+PRC+MOQ+PTR;
                  Vr_T+=TIM;
                  Vr_Q+=Quality;
                  Vr_P+=PRC;
                  Vr_M+=MOQ;
                  Vr_PT+=PTR;
                  Total_Qty+="<Purch. Rcpt. Line4>".Quantity;
                  Total_Rejected+="<Purch. Rcpt. Line4>"."Quantity Rejected";
                  Vendor_PPM:=("<Purch. Rcpt. Line4>"."Quantity Rejected"/"<Purch. Rcpt. Line4>".Quantity)*1000000;
                  Vr_Avg+=VR;

                  IF Excel AND (NOT Vendor_Records)THEN
                  BEGIN
                    Row+=1;
                    EnterHeadings(Row,1,FORMAT(SNO),FALSE,Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row,2,"<Purch. Rcpt. Line4>".Description,FALSE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,3,"<Purch. Rcpt. Line4>"."Order No.",FALSE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,4,FORMAT(Order_Date),FALSE,Tempexcelbuffer."Cell Type"::Date);
                    EnterHeadings(Row,5,FORMAT("<Purch. Rcpt. Line4>"."Expected Receipt Date"),FALSE,Tempexcelbuffer."Cell Type"::Date);
                    EnterHeadings(Row,6,FORMAT("<Purch. Rcpt. Line4>"."Document date"),FALSE,Tempexcelbuffer."Cell Type"::Date);
                    EnterHeadings(Row,7,FORMAT("<Purch. Rcpt. Line4>".Quantity),FALSE,Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row,8,FORMAT("<Purch. Rcpt. Line4>"."Quantity Rejected"),FALSE,Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row,9,"<Purch. Rcpt. Line4>"."Unit of Measure",FALSE,Tempexcelbuffer."Cell Type"::Text);
                    IF  (Order_Date>0D) AND ("Expected Receipt Date">0D) THEN
                      EnterHeadings(Row,10,FORMAT("<Purch. Rcpt. Line4>"."Expected Receipt Date"-Order_Date),FALSE,Tempexcelbuffer."Cell Type"::Number);
                    IF ("Document date">0D) AND (Order_Date>0D) THEN
                      EnterHeadings(Row,11,FORMAT("<Purch. Rcpt. Line4>"."Document date"-Order_Date),FALSE,Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row,12,FORMAT(Deviation),FALSE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,13,FORMAT(ROUND(UC,0.01)),FALSE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,14,FORMAT(ROUND(Quality*100,0.01)),FALSE,Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row,15,FORMAT(ROUND(TIM*100,0.01)),FALSE,Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row,16,FORMAT(ROUND(PRC*100,0.01)),FALSE,Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row,17,FORMAT(ROUND(MOQ*100,0.01)),FALSE,Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row,18,FORMAT(ROUND(PTR*100,0.01)),FALSE,Tempexcelbuffer."Cell Type"::Number);

                    EnterHeadings(Row,19,FORMAT(ROUND(VR*100,0.01)),FALSE,Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row,20,FORMAT(ROUND(Vendor_PPM,0.01)),FALSE,Tempexcelbuffer."Cell Type"::Text);
                  END;
            end;

            trigger OnPostDataItem();
            begin
                  IF SNO>0 THEN
                  BEGIN
                    Vr_Avg:=Vr_Avg/SNO;
                    Vr_T:=  Vr_T/SNO;
                    Vr_P:=  Vr_P/SNO;
                    Vr_Q:=  Vr_Q/SNO;
                    Vr_M:=  Vr_M/SNO;
                    Vr_PT:=  Vr_PT/SNO;
                    Total_Vendor_PPM:=(Total_Rejected/Total_Qty)*1000000;
                  END;
                  IF Excel THEN
                  BEGIN
                    IF NOT Vendor_Records THEN
                    BEGIN
                      Row+=1;
                      EnterHeadings(Row,14,FORMAT(ROUND(Vr_Q*100,1)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                      EnterHeadings(Row,15,FORMAT(ROUND(Vr_T*100,1)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                      EnterHeadings(Row,16,FORMAT(ROUND(Vr_P*100,1)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                      EnterHeadings(Row,17,FORMAT(ROUND(Vr_M*100,1)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                      EnterHeadings(Row,18,FORMAT(ROUND(Vr_PT*100,1)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                      EnterHeadings(Row,19,FORMAT(ROUND(Vr_Avg*100,1)),TRUE,Tempexcelbuffer."Cell Type"::Number);

                    END ELSE
                    BEGIN
                      Row+=1;
                      EnterHeadings(Row,2,FORMAT(Vend_Name),TRUE,Tempexcelbuffer."Cell Type"::Text);
                      EnterHeadings(Row,3,FORMAT(Vendor_Type),TRUE,Tempexcelbuffer."Cell Type"::Text);
                      EnterHeadings(Row,4,FORMAT(ROUND(Vr_Q*100,0.01)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                      EnterHeadings(Row,5,FORMAT(ROUND(Vr_T*100,0.01)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                      EnterHeadings(Row,6,FORMAT(ROUND(Vr_P*100,0.01)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                      EnterHeadings(Row,7,FORMAT(ROUND(Vr_M*100,0.01)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                      EnterHeadings(Row,8,FORMAT(ROUND(Vr_PT*100,0.01)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                      EnterHeadings(Row,9,FORMAT(ROUND(Vr_Avg*100,0.01)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                      EnterHeadings(Row,10,FORMAT(ROUND(Total_Vendor_PPM,0.01)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                      IF ROUND(Vr_Avg*100,0.01)>=90 THEN
                         EnterHeadings(Row,11,'A',TRUE,Tempexcelbuffer."Cell Type"::Text)
                      ELSE IF (ROUND(Vr_Avg*100,0.01)>=80) AND (ROUND(Vr_Avg*100,0.01)<90) THEN
                         EnterHeadings(Row,11,'B',TRUE,Tempexcelbuffer."Cell Type"::Text)
                      ELSE IF (ROUND(Vr_Avg*100,0.01)>=70) AND (ROUND(Vr_Avg*100,0.01)<80) THEN
                         EnterHeadings(Row,11,'C',TRUE,Tempexcelbuffer."Cell Type"::Text)
                      ELSE
                         EnterHeadings(Row,11,'D',TRUE,Tempexcelbuffer."Cell Type"::Text);

                    END;

                  END;
            end;

            trigger OnPreDataItem();
            begin
                IF Choice<>Choice::VEV THEN
                CurrReport.BREAK;

                IF FORMAT(lOC_CODE)<>'ALL' THEN
                  "<Purch. Rcpt. Line4>".SETFILTER("<Purch. Rcpt. Line4>"."Location Code",FORMAT(lOC_CODE));

                "<Purch. Rcpt. Line4>".SETRANGE("<Purch. Rcpt. Line4>"."Document date",VE_From_Date,VE_To_Date);
                IF Excel THEN
                BEGIN
                  CLEAR(Tempexcelbuffer);
                  Tempexcelbuffer.DELETEALL;
                END;

                // Copy Code from // <Purch. Rcpt. Line4>, Header (2) - OnPostSection()<<

                IF Excel THEN
                BEGIN
                  IF NOT Vendor_Records THEN
                  BEGIN

                    Row+=1;
                    EnterHeadings(Row,1,'S.No',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,2,'Item',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,3,'Order No.',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,4,'Order Date',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,5,'Expected Receipt Date',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,6,'Inward Date',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,7,'Quantity',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,8,'Quantity Rejected',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,9,'UOM',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,10,'Given Lead Time',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,11,'Lead Time',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,12,'Deviation',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,13,'Unit Cost (With taxes)',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,14,'Quantity (Rating)',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,15,'Delivery (Rating)',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,16,'MOQ (Rating)',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,17,'Payments Term (Rating)',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,18,'Price (Rating)',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,19,'Vendor Rating',TRUE,Tempexcelbuffer."Cell Type"::Text);

                  END ELSE
                  BEGIN
                    Row+=1;
                    //   EnterHeadings(ROw,1,'MONTH',TRUE);
                    EnterHeadings(Row,2,'Vendor',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,3,'Vendor Type',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,4,'Quality Rating',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,5,'Delivery Rating',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,6,'Price Rating',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,7,'MOQ Rating',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,8,'Payment Terms Rating',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,9,'Vendor Rating',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,10,'Vendor PPM',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,11,'Grade',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  END;
                END;
                // Copy Code from // <Purch. Rcpt. Line4>, Header (2) - OnPostSection()<<
            end;
        }
        dataitem("<Purch. Rcpt. Line5>";"Purch. Rcpt. Line")
        {
            CalcFields = Document date;
            DataItemTableView = SORTING(No.,Buy-from Vendor No.) ORDER(Ascending) WHERE(Quantity=FILTER(>0));
            column(COMPANYNAME_Control1102154099;COMPANYNAME)
            {
            }
            column(TODAY_Control1102154105;TODAY)
            {
            }
            column(USERID_Control1102154106;USERID)
            {
            }
            column(Choice_VEVI;Choice)
            {
            }
            column(Purch__Rcpt__Line5____Purch__Rcpt__Line5___Description;"<Purch. Rcpt. Line5>".Description)
            {
            }
            column(Vend_Name_Control1102154197;Vend_Name)
            {
            }
            column(ROUND__VR_100__1__Control1102154217;ROUND((VR*100),1))
            {
            }
            column(ROUND__PRC_100__1__Control1102154235;ROUND((PRC*100),1))
            {
            }
            column(ROUND__TIM_100__1__Control1102154240;ROUND((TIM*100),1))
            {
            }
            column(ROUND__Quality_100__1__Control1102154241;ROUND((Quality*100),1))
            {
            }
            column(UC_Control1102154242;UC)
            {
            }
            column(Deviation_Control1102154243;Deviation)
            {
            }
            column(Document_date__Order_Date_Control1102154244;"Document date"-Order_Date)
            {
            }
            column(GLD_Control1102154245;GLD)
            {
            }
            column(Purch__Rcpt__Line5___Unit_of_Measure_;"Unit of Measure")
            {
            }
            column(Purch__Rcpt__Line5___Quantity_Rejected_;"Quantity Rejected")
            {
            }
            column(Purch__Rcpt__Line5__Quantity;Quantity)
            {
            }
            column(Purch__Rcpt__Line5___Document_date_;"Document date")
            {
            }
            column(Purch__Rcpt__Line5___Expected_Receipt_Date_;"Expected Receipt Date")
            {
            }
            column(Order_Date_Control1102154251;Order_Date)
            {
            }
            column(Purch__Rcpt__Line5___Order_No__;"Order No.")
            {
            }
            column(SNO_Control1102154255;SNO)
            {
            }
            column(ROUND_Vendor_PPM_2_;ROUND(Vendor_PPM,2))
            {
            }
            column(ROUND__Vr_Avg_100__0_01__Control1102154321;ROUND((Vr_Avg*100),0.01))
            {
            }
            column(ROUND__Vr_P_100__0_01__Control1102154194;ROUND((Vr_P*100),0.01))
            {
            }
            column(ROUND__Vr_T_100__0_01__Control1102154195;ROUND((Vr_T*100),0.01))
            {
            }
            column(ROUND__Vr_P_100__0_01__Control1102154198;ROUND((Vr_P*100),0.01))
            {
            }
            column(ROUND_Total_Vendor_PPM_1__Control1102154265;ROUND(Total_Vendor_PPM,1))
            {
            }
            column(VENDOR_EVALUTIONCaption_Control1102154096;VENDOR_EVALUTIONCaption_Control1102154096Lbl)
            {
            }
            column(Vendor_RatingCaption_Control1102154304;Vendor_RatingCaption_Control1102154304Lbl)
            {
            }
            column(PriceCaption_Control1102154305;PriceCaption_Control1102154305Lbl)
            {
            }
            column(TimeCaption_Control1102154306;TimeCaption_Control1102154306Lbl)
            {
            }
            column(QualityCaption_Control1102154307;QualityCaption_Control1102154307Lbl)
            {
            }
            column(Unit_Cost___With__Taxes_Caption_Control1102154308;Unit_Cost___With__Taxes_Caption_Control1102154308Lbl)
            {
            }
            column(DeviationCaption_Control1102154309;DeviationCaption_Control1102154309Lbl)
            {
            }
            column(Lead_TimeCaption_Control1102154310;Lead_TimeCaption_Control1102154310Lbl)
            {
            }
            column(Given_Lead_TimeCaption_Control1102154311;Given_Lead_TimeCaption_Control1102154311Lbl)
            {
            }
            column(UOMCaption_Control1102154312;UOMCaption_Control1102154312Lbl)
            {
            }
            column(Qty__RejectedCaption_Control1102154313;Qty__RejectedCaption_Control1102154313Lbl)
            {
            }
            column(QuantityCaption_Control1102154314;QuantityCaption_Control1102154314Lbl)
            {
            }
            column(Inward_DateCaption_Control1102154315;Inward_DateCaption_Control1102154315Lbl)
            {
            }
            column(Expected_Receipt_DateCaption_Control1102154316;Expected_Receipt_DateCaption_Control1102154316Lbl)
            {
            }
            column(Order_DateCaption_Control1102154317;Order_DateCaption_Control1102154317Lbl)
            {
            }
            column(Order_No_Caption_Control1102154318;Order_No_Caption_Control1102154318Lbl)
            {
            }
            column(S_No_Caption_Control1102154320;S_No_Caption_Control1102154320Lbl)
            {
            }
            column(Vendor_PPMCaption_Control1102154261;Vendor_PPMCaption_Control1102154261Lbl)
            {
            }
            column(Purch__Rcpt__Line5__Document_No_;"Document No.")
            {
            }
            column(Purch__Rcpt__Line5__Line_No_;"Line No.")
            {
            }
            column(Purch__Rcpt__Line5__Buy_from_Vendor_No_;"Buy-from Vendor No.")
            {
            }
            column(PurchRecipt5ShowOutput;PurchRecipt5ShowOutput)
            {
            }

            trigger OnAfterGetRecord();
            begin
                // copy code from // <Purch. Rcpt. Line5>, GroupHeader (3) - OnPostSection()<<
                CLEAR(PurchRecipt5ShowOutput);
                IF ("<Purch. Rcpt. Line5>".Description<>Prev_item)  THEN
                BEGIN
                  Prev_item:="<Purch. Rcpt. Line5>".Description;
                  IF Excel THEN
                  BEGIN
                    Row+=1;
                    EnterHeadings(Row,1,Prev_item,TRUE,Tempexcelbuffer."Cell Type"::Text);
                  END;
                  PurchRecipt5ShowOutput:=TRUE;
                END ELSE
                  PurchRecipt5ShowOutput:=FALSE;
                // copy code from // <Purch. Rcpt. Line5>, GroupHeader (3) - OnPostSection()<<
                
                // copy code from // <Purch. Rcpt. Line5>, GroupHeader (4) - OnPostSection()>>
                IF Vendor.GET("<Purch. Rcpt. Line5>"."Buy-from Vendor No.") THEN
                BEGIN
                  Vend_Name:=Vendor.Name;
                  Vendor_Type:=FORMAT(Vendor."Vendor Type");
                END;
                
                Vr_Avg:=0;
                   Vr_T:=0;
                   Vr_P:=0;
                   Vr_Q:=0;
                   Total_Qty:=0;
                   Total_Rejected:=0;
                
                SNO:=0;
                IF Excel THEN
                BEGIN
                  Row+=1;
                  EnterHeadings(Row,1,Vend_Name,TRUE,Tempexcelbuffer."Cell Type"::Text);
                
                  Row+=1;
                  EnterHeadings(Row,1,'S.No',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,2,'Order No.',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,3,'Order Date',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,4,'Expected Receipt Date',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,5,'Inward Date',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,6,'Quantity',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,7,'Quantity Rejected',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,8,'UOM',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,9,'Given Lead Time',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,10,'Lead Time',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,11,'Deviation',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,12,'Unit Cost (With taxes)',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,13,'Quantity (Rating)',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,14,'Delivery (Rating)',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,15,'Price (Rating)',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,16,'Vendor Rating',TRUE,Tempexcelbuffer."Cell Type"::Text);
                END;
                // copy code from // <Purch. Rcpt. Line5>, GroupHeader (4) - OnPostSection()<<
                
                // copy code from // <Purch. Rcpt. Line5>, Body (5) - OnPostSection()>>
                SNO+=1;
                
                Quality:=0;
                TIM:=0;
                PRC:=0;
                VR:=0;
                
                PH.SETRANGE(PH."No.","<Purch. Rcpt. Line5>"."Order No.");
                IF PH.FIND('-') THEN
                BEGIN
                  Order_Date:=PH."Order Date";
                END;
                
                IF Vendor.GET("<Purch. Rcpt. Line5>"."Buy-from Vendor No.") THEN
                BEGIN
                  Vend_Name:=Vendor.Name;
                  Vendor_Type:=FORMAT(Vendor."Vendor Type");
                  IF ("Document date">0D) AND (Order_Date>0D) AND ("Expected Receipt Date">0D) THEN
                  Deviation:=("Document date"-Order_Date)-("Expected Receipt Date"-Order_Date);
                  IF  Vendor."Vendor Type"=Vendor."Vendor Type"::Manufacturer THEN
                  BEGIN
                    //Quality:=0.6*("<Purch. Rcpt. Line5>".Quantity/("<Purch. Rcpt. Line5>".Quantity+"<Purch. Rcpt. Line5>"."Quantity Rejected"));
                    Quality:=0.6*(("<Purch. Rcpt. Line5>"."Quantity Accepted")/("<Purch. Rcpt. Line5>".Quantity));
                    CASE Deviation OF
                      0:                     TIM:=1*0.3;
                     -3,-2,-1,1,2,3:         TIM:=0.9*0.3;
                     -7,-6,-5,-4,4,5,6,7:    TIM:=0.6*0.3;
                     -10,-9,-8,8,9,10:       TIM:=0.3*0.3;
                     -100..100:TIM:=0;
                
                    END;
                  END ELSE
                  BEGIN
                    //Quality:=0.4*("<Purch. Rcpt. Line5>".Quantity/("<Purch. Rcpt. Line5>".Quantity+"<Purch. Rcpt. Line5>"."Quantity Rejected"));
                    Quality:=0.4*(("<Purch. Rcpt. Line5>"."Quantity Accepted")/("<Purch. Rcpt. Line5>".Quantity));
                    CASE Deviation OF
                    0:                       TIM:=1*0.5;
                    -3,-2,-1,1,2,3:          TIM:=0.9*0.5;
                    -7,-6,-5,-4,4,5,6,7:     TIM:=0.6*0.5;
                    -10,-9,-8,8,9,10:        TIM:=0.3*0.5;
                    -100..100:TIM:=0;
                    END;
                  END;
                
                END;
                IF ("Expected Receipt Date">0D) AND  (Order_Date>0D) THEN
                  GLD:="Expected Receipt Date"-Order_Date;
                  PIL.SETCURRENTKEY(PIL.Type,PIL."No.",PIL."Variant Code");
                  PIL.SETRANGE(PIL."No.","<Purch. Rcpt. Line5>"."No.");
                  PIL.SETRANGE(PIL."Buy-from Vendor No.","<Purch. Rcpt. Line5>"."Buy-from Vendor No.");
                  PIL.SETRANGE(PIL.Quantity,"<Purch. Rcpt. Line5>".Quantity);
                  PIL.SETRANGE(PIL."Receipt No.","<Purch. Rcpt. Line5>"."Document No.");
                  IF PIL.FIND('-') THEN
                  BEGIN
                    IF PIL."Gen. Bus. Posting Group"='FOREIGN' THEN
                      UC:=PIL."Unit Cost (LCY)"
                    ELSE
                      UC:=PIL."Amount To Vendor"/PIL.Quantity;
                  END;
                
                  /*PL.SETCURRENTKEY(PL."No.",PL."Unit Cost (LCY)");
                  PL.SETRANGE(PL."No.","<Purch. Rcpt. Line5>"."No.");
                  IF PL.FIND('-') THEN
                  IF   PL."Unit Cost (LCY)">0 THEN
                  BEGIN
                    PRC:=0.1*(1-(("<Purch. Rcpt. Line5>"."Unit Cost (LCY)"-PL."Unit Cost (LCY)")/PL."Unit Cost (LCY)"));
                  END;
                  IF PRC<0 THEN
                  PRC:=0;*/
                
                  AUC:=0;
                  Cnt:=0;
                  LUC:=0;
                  PL.SETCURRENTKEY(PL."No.",PL."Unit Cost (LCY)");
                  PL.SETRANGE(PL."No.","<Purch. Rcpt. Line5>"."No.");
                  PL.SETRANGE(PL.Sample,FALSE);
                  PL.SETRANGE(PL."Buy-from Vendor No.","<Purch. Rcpt. Line5>"."Buy-from Vendor No.");
                  PL.SETFILTER(PL."Unit Cost (LCY)",'>%1',0);
                  PL.SETRANGE(PL."Order Date",VE_From_Date,VE_To_Date);
                  IF PL.FINDFIRST THEN
                  BEGIN
                    LUC:=PL."Unit Cost (LCY)";
                    REPEAT
                      AUC+=PL."Unit Cost (LCY)";
                      Cnt+=1;
                    UNTIL PL.NEXT=0;
                    AUC:=AUC/Cnt;
                  END;
                
                  IF  (AUC>0) AND (LUC>0) THEN
                  BEGIN
                    PRC:=0.1*(1-((AUC-LUC)/LUC));
                  END;
                  IF PRC<0 THEN
                  PRC:=0;
                
                VR:=Quality+TIM+PRC;
                Vr_T+=TIM;
                Vr_Q+=Quality;
                Vr_P+=PRC;
                Total_Qty+="<Purch. Rcpt. Line5>".Quantity;
                Total_Rejected+="<Purch. Rcpt. Line5>"."Quantity Rejected";
                Vendor_PPM:=("<Purch. Rcpt. Line5>"."Quantity Rejected"/"<Purch. Rcpt. Line5>".Quantity)*1000000;
                
                Vr_Avg+=VR;
                IF Excel THEN
                BEGIN
                  Row+=1;
                  EnterHeadings(Row,1,FORMAT(SNO),FALSE,Tempexcelbuffer."Cell Type"::Number);
                  EnterHeadings(Row,2,"<Purch. Rcpt. Line5>"."Order No.",FALSE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,3,FORMAT(Order_Date),FALSE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,4,FORMAT("<Purch. Rcpt. Line5>"."Expected Receipt Date"),FALSE,Tempexcelbuffer."Cell Type"::Date);
                  EnterHeadings(Row,5,FORMAT("<Purch. Rcpt. Line5>"."Document date"),FALSE,Tempexcelbuffer."Cell Type"::Date);
                  EnterHeadings(Row,6,FORMAT("<Purch. Rcpt. Line5>".Quantity),FALSE,Tempexcelbuffer."Cell Type"::Number);
                  EnterHeadings(Row,7,FORMAT("<Purch. Rcpt. Line5>"."Quantity Rejected"),FALSE,Tempexcelbuffer."Cell Type"::Number);
                  EnterHeadings(Row,8,"<Purch. Rcpt. Line5>"."Unit of Measure",FALSE,Tempexcelbuffer."Cell Type"::Text);
                  IF (Order_Date>0D) AND ("Expected Receipt Date">0D) THEN
                    EnterHeadings(Row,9,FORMAT("<Purch. Rcpt. Line5>"."Expected Receipt Date"-Order_Date),FALSE,Tempexcelbuffer."Cell Type"::Number);
                  IF (Order_Date>0D) AND ("<Purch. Rcpt. Line5>"."Document date">0D) THEN
                    EnterHeadings(Row,10,FORMAT("<Purch. Rcpt. Line5>"."Document date"-Order_Date),FALSE,Tempexcelbuffer."Cell Type"::Number);
                  EnterHeadings(Row,11,FORMAT(Deviation),FALSE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,12,FORMAT(UC),FALSE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,13,FORMAT(Quality*100),FALSE,Tempexcelbuffer."Cell Type"::Number);
                  EnterHeadings(Row,14,FORMAT(TIM*100),FALSE,Tempexcelbuffer."Cell Type"::Number);
                  EnterHeadings(Row,15,FORMAT(PRC*100),FALSE,Tempexcelbuffer."Cell Type"::Number);
                  EnterHeadings(Row,16,FORMAT(VR*100),FALSE,Tempexcelbuffer."Cell Type"::Number);
                  EnterHeadings(Row,17,FORMAT(Vendor_PPM),FALSE,Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row,18,FORMAT(Vendor_PPM),FALSE,Tempexcelbuffer."Cell Type"::Number);
                END;
                // copy code from // <Purch. Rcpt. Line5>, Body (5) - OnPostSection()<<
                
                
                // copy code from //<Purch. Rcpt. Line5>, GroupFooter (6) - OnPostSection() >>
                IF SNO>0 THEN
                BEGIN
                Vr_Avg:=Vr_Avg/SNO;
                  Vr_T:=  Vr_T/SNO;
                  Vr_P:=  Vr_P/SNO;
                  Vr_Q:=  Vr_Q/SNO;
                  Total_Vendor_PPM:=(Total_Rejected/Total_Qty)*1000000;
                END;
                IF Excel THEN
                BEGIN
                  Row+=1;
                  EnterHeadings(Row,13,FORMAT(ROUND(Vr_Q*100,0.01)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                  EnterHeadings(Row,14,FORMAT(ROUND(Vr_T*100,0.01)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                  EnterHeadings(Row,15,FORMAT(ROUND(Vr_P*100,0.01)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                  EnterHeadings(Row,16,FORMAT(ROUND(Vr_Avg*100,0.01)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                     EnterHeadings(Row,17,FORMAT(ROUND(Total_Vendor_PPM,1)),TRUE,Tempexcelbuffer."Cell Type"::Number);
                
                END;
                // copy code from //<Purch. Rcpt. Line5>, GroupFooter (6) - OnPostSection() <<

            end;

            trigger OnPreDataItem();
            begin
                 IF Choice<>Choice::VEVI THEN
                  CurrReport.BREAK;
                 IF FORMAT(lOC_CODE)<>'ALL' THEN
                  "<Purch. Rcpt. Line5>".SETFILTER("<Purch. Rcpt. Line5>"."Location Code",FORMAT(lOC_CODE));

                  "<Purch. Rcpt. Line5>".SETRANGE("<Purch. Rcpt. Line5>"."Document date",VE_From_Date,VE_To_Date);
                  "<Purch. Rcpt. Line5>".SETFILTER("<Purch. Rcpt. Line5>"."Order No.",'<>%1','');
                 IF Excel THEN
                 BEGIN
                   CLEAR(Tempexcelbuffer);
                   Tempexcelbuffer.DELETEALL;
                 END;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Control1102152001)
                {
                    ShowCaption = false;
                    field(Choice;Choice)
                    {
                        Caption = 'Vendor Rating';
                    }
                    field(QTY;QTY)
                    {
                        Caption = 'Quantity';
                    }
                    field(Choice_Qty;Choice_Qty)
                    {
                        Caption = 'Choice Qty';
                    }
                    group(Control1102152005)
                    {
                        ShowCaption = false;
                        field("Vendor Evalution";'')
                        {
                            Caption = 'Vendor Evalution';
                            Style = Strong;
                            StyleExpr = TRUE;
                        }
                        field(VE_From_Date;VE_From_Date)
                        {
                            Caption = 'From Date';
                        }
                        field(VE_To_Date;VE_To_Date)
                        {
                            Caption = 'To Date';
                        }
                        field(Vendor_Records;Vendor_Records)
                        {
                            Caption = 'Vendor Records Only';

                            trigger OnValidate();
                            begin
                                IF NOT (Choice=Choice::VEV) THEN
                                  ERROR(' PLEASE SELECT THE "VENDOR EVALUTION " OPTION');
                            end;
                        }
                        field(lOC_CODE;lOC_CODE)
                        {
                            Caption = 'LOCATION CODE';
                        }
                    }
                    group(Control1102152019)
                    {
                        ShowCaption = false;
                        field("Deviation Report";'')
                        {
                            Caption = 'Deviation Report';
                            Style = Strong;
                            StyleExpr = TRUE;
                        }
                        grid(Control1102152020)
                        {
                            GridLayout = Rows;
                            ShowCaption = false;
                            group(Control1102152021)
                            {
                                //The GridLayout property is only supported on controls of type Grid
                                //GridLayout = Columns;
                                ShowCaption = false;
                                field(From_Date;From_Date)
                                {
                                    Caption = 'From Date';
                                }
                                field(To_Date;To_Date)
                                {
                                    Caption = 'To Date';
                                }
                            }
                        }
                        grid(Control1102152027)
                        {
                            GridLayout = Rows;
                            ShowCaption = false;
                            group(Control1102152026)
                            {
                                //The GridLayout property is only supported on controls of type Grid
                                //GridLayout = Columns;
                                ShowCaption = false;
                                field("Vendor Deviation";Choice)
                                {
                                    Caption = 'Vendor Deviation';
                                    OptionCaption = '",Vendor_Deviation,,,,,, "';
                                }
                                field("Item Deviation";Choice)
                                {
                                    Caption = 'Item Deviation';
                                    OptionCaption = '",,Item_Deviation,,,,, "';
                                }
                            }
                        }
                        grid(Control1102152023)
                        {
                            GridLayout = Rows;
                            ShowCaption = false;
                            group(Control1102152022)
                            {
                                //The GridLayout property is only supported on controls of type Grid
                                //GridLayout = Columns;
                                ShowCaption = false;
                                field(Vendor_Choice;Vendor_Choice)
                                {
                                    Caption = 'Vendor Choice';

                                    trigger OnValidate();
                                    begin
                                        Choice:=Choice::Vendor_Deviation;
                                    end;
                                }
                                field(Item_Choice;Item_Choice)
                                {
                                    Caption = 'Item Choice';

                                    trigger OnValidate();
                                    begin
                                        Choice:=Choice::Item_Deviation;
                                    end;
                                }
                            }
                        }
                        grid(Control1102152025)
                        {
                            GridLayout = Rows;
                            ShowCaption = false;
                            group(Control1102152024)
                            {
                                //The GridLayout property is only supported on controls of type Grid
                                //GridLayout = Columns;
                                ShowCaption = false;
                                field(Vend_Name;Vend_Name)
                                {
                                    Caption = 'Vendor Name';
                                }
                                field(Item_Name;Item_Name)
                                {
                                    Caption = 'Item Name';
                                }
                            }
                        }
                        field(Excel;Excel)
                        {
                            Caption = 'Excel';
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
        To_Date:=TODAY;
        VE_From_Date:=040107D;
        VE_To_Date:=TODAY;
    end;

    trigger OnPostReport();
    begin
        IF Excel THEN
        BEGIN
         /*
         Tempexcelbuffer.CreateBook('Production BOM Header','');//B2B //EFFUPG
         Tempexcelbuffer.WriteSheet('Production BOM Header',COMPANYNAME,USERID);//B2B
         Tempexcelbuffer.CloseBook; //Rev01
         Tempexcelbuffer.OpenExcel; //Rev01
         Tempexcelbuffer.GiveUserControl;
         */
         Tempexcelbuffer.CreateBookAndOpenExcel('','Production BOM Header','Production BOM Header',COMPANYNAME,USERID); //EFFUPG
        END;

    end;

    trigger OnPreReport();
    begin
        VendorFilter:="<Vendor1>".GETFILTERS;
        PurFilter:="Purchase Line".GETFILTERS;
    end;

    var
        QTY : Decimal;
        Choice_Qty : Option Above,Below;
        PRL : Record "Purch. Rcpt. Line";
        PRH : Record "Purch. Rcpt. Header";
        "Lead Time" : Integer;
        PH : Record "Purchase Header";
        PIL : Record "Purch. Inv. Line";
        UC : Decimal;
        GLD : Integer;
        Vendor : Record Vendor;
        Name : Text[100];
        Pre_Name : Text[140];
        "Item Desc" : Text[100];
        Quality : Decimal;
        TIM : Decimal;
        Deviation : Decimal;
        PL : Record "Purchase Line";
        PRC : Decimal;
        VR : Decimal;
        VR1 : array [1000] of Decimal;
        i : Integer;
        TOT_VR : Decimal;
        Vr_Avg : Decimal;
        j : Integer;
        "Vendor Ang" : Boolean;
        VendorFilter : Text[100];
        PurFilter : Text[100];
        IVR : array [1000] of Decimal;
        TOT_VR_I : Decimal;
        Vr_Avg_i : Decimal;
        K : Integer;
        Choice : Option Vendor_Rating,Vendor_Deviation,Item_Deviation,VEO,VEI,VEV,VEVI;
        Excel : Boolean;
        From_Date : Date;
        To_Date : Date;
        "No. Of Inwards" : Integer;
        "Deviation Percentage" : Decimal;
        Order_Date : Date;
        Tempexcelbuffer : Record "Excel Buffer" temporary;
        Vendor_Choice : Option Inward,Vendor;
        Row : Integer;
        Item_Choice : Option Item,Inward;
        Vend_Name : Text[100];
        Item_Name : Text[100];
        Avg_Lead_Time : Decimal;
        "ORDER Date" : Date;
        "Prev Order" : Code[20];
        item : Record Item;
        PIH : Record "Purch. Inv. Header";
        "First Invoice Date" : Date;
        VE_From_Date : Date;
        VE_To_Date : Date;
        SNO : Integer;
        Vendor_Type : Text[30];
        Unit_Cost : Decimal;
        Prev_item : Code[50];
        Tot_Lead_Time : Integer;
        Avg_Unit_Cost : Decimal;
        Vr_T : Decimal;
        Vr_P : Decimal;
        Vr_Q : Decimal;
        Vr_M : Decimal;
        Vr_PT : Decimal;
        Vendor_PPM : Decimal;
        Total_Vendor_PPM : Decimal;
        Total_Qty : Decimal;
        Total_Rejected : Decimal;
        Vendor_Records : Boolean;
        lOC_CODE : Option ALL,STR,"CS STR","'R&D STR'";
        AUC : Decimal;
        LUC : Decimal;
        Cnt : Integer;
        VENDOR_DECLARATIONCaptionLbl : Label 'VENDOR DECLARATION';
        Vendor_RatingCaptionLbl : Label 'Vendor Rating';
        PriceCaptionLbl : Label 'Price';
        TimeCaptionLbl : Label 'Time';
        QualityCaptionLbl : Label 'Quality';
        Unit_CostCaptionLbl : Label 'Unit Cost';
        DeviationCaptionLbl : Label 'Deviation';
        Lead_TimeCaptionLbl : Label 'Lead Time';
        Given_Lead_TimeCaptionLbl : Label 'Given Lead Time';
        Qty__RejectedCaptionLbl : Label 'Qty. Rejected';
        QuantityCaptionLbl : Label 'Quantity';
        VendorCaptionLbl : Label 'Vendor';
        DescriptionCaptionLbl : Label 'Description';
        VendorCaption_Control1000000001Lbl : Label 'Vendor';
        Vendor_DeviationCaptionLbl : Label 'Vendor Deviation';
        Valution_FromCaptionLbl : Label 'Valution From';
        ToCaptionLbl : Label 'To';
        No__Of_InwardsCaptionLbl : Label 'No. Of Inwards';
        Deviation__CaptionLbl : Label 'Deviation %';
        VendorCaption_Control1102154035Lbl : Label 'Vendor';
        Deviation__Caption_Control1102154071Lbl : Label 'Deviation %';
        No__Of_InwardsCaption_Control1102154072Lbl : Label 'No. Of Inwards';
        VendorCaption_Control1102154073Lbl : Label 'Vendor';
        ItemCaptionLbl : Label 'Item';
        Expected_DateCaptionLbl : Label 'Expected Date';
        Received_DateCaptionLbl : Label 'Received Date';
        Given_Lead_TimeCaption_Control1102154013Lbl : Label 'Given Lead Time';
        Actulal_Lead_TimeCaptionLbl : Label 'Actulal Lead Time';
        Order_DateCaptionLbl : Label 'Order Date';
        DeviationCaption_Control1102154075Lbl : Label 'Deviation';
        Deviation__Caption_Control1102154074Lbl : Label 'Deviation %';
        Item_DeviationCaptionLbl : Label 'Item Deviation';
        Valution_FromCaption_Control1102154025Lbl : Label 'Valution From';
        ToCaption_Control1102154026Lbl : Label 'To';
        Deviation__Caption_Control1102154045Lbl : Label 'Deviation %';
        No__Of_InwardsCaption_Control1102154046Lbl : Label 'No. Of Inwards';
        DesriptionCaptionLbl : Label 'Desription';
        No_CaptionLbl : Label 'No.';
        TypeCaptionLbl : Label 'Type';
        No__Of_InwardsCaption_Control1102154040Lbl : Label 'No. Of Inwards';
        Deviation__Caption_Control1102154041Lbl : Label 'Deviation %';
        Inward_No_CaptionLbl : Label 'Inward No.';
        Expected_DateCaption_Control1102154058Lbl : Label 'Expected Date';
        Received_DateCaption_Control1102154059Lbl : Label 'Received Date';
        Given_Lead_TimeCaption_Control1102154060Lbl : Label 'Given Lead Time';
        Actulal_Lead_TimeCaption_Control1102154061Lbl : Label 'Actulal Lead Time';
        VendorCaption_Control1102154065Lbl : Label 'Vendor';
        VENDOR_EVALUTIONCaptionLbl : Label 'VENDOR EVALUTION';
        S_No_CaptionLbl : Label 'S No.';
        ItemCaption_Control1102154114Lbl : Label 'Item';
        VendorCaption_Control1102154118Lbl : Label 'Vendor';
        Inward_DateCaptionLbl : Label 'Inward Date';
        Vendor_TypeCaptionLbl : Label 'Vendor Type';
        Order_DateCaption_Control1102154125Lbl : Label 'Order Date';
        UOMCaptionLbl : Label 'UOM';
        Vendor_RatingCaption_Control1102154131Lbl : Label 'Vendor Rating';
        PriceCaption_Control1102154132Lbl : Label 'Price';
        TimeCaption_Control1102154133Lbl : Label 'Time';
        QualityCaption_Control1102154134Lbl : Label 'Quality';
        Unit_Cost___With__Taxes_CaptionLbl : Label 'Unit Cost  (With  Taxes)';
        DeviationCaption_Control1102154136Lbl : Label 'Deviation';
        Lead_TimeCaption_Control1102154137Lbl : Label 'Lead Time';
        Given_Lead_TimeCaption_Control1102154138Lbl : Label 'Given Lead Time';
        Qty__RejectedCaption_Control1102154139Lbl : Label 'Qty. Rejected';
        Vendor_PPMCaptionLbl : Label 'Vendor PPM';
        VENDOR_EVALUTIONCaption_Control1102154086Lbl : Label 'VENDOR EVALUTION';
        S_No_Caption_Control1102154088Lbl : Label 'S No.';
        Order_No_CaptionLbl : Label 'Order No.';
        VendorCaption_Control1102154103Lbl : Label 'Vendor';
        Expected_Receipt_DateCaptionLbl : Label 'Expected Receipt Date';
        Inward_DateCaption_Control1102154141Lbl : Label 'Inward Date';
        Vendor_TypeCaption_Control1102154146Lbl : Label 'Vendor Type';
        Order_DateCaption_Control1102154148Lbl : Label 'Order Date';
        QuantityCaption_Control1102154149Lbl : Label 'Quantity';
        UOMCaption_Control1102154150Lbl : Label 'UOM';
        Vendor_RatingCaption_Control1102154151Lbl : Label 'Vendor Rating';
        PriceCaption_Control1102154152Lbl : Label 'Price';
        TimeCaption_Control1102154153Lbl : Label 'Time';
        QualityCaption_Control1102154154Lbl : Label 'Quality';
        Unit_Cost___With__Taxes_Caption_Control1102154155Lbl : Label 'Unit Cost  (With  Taxes)';
        DeviationCaption_Control1102154156Lbl : Label 'Deviation';
        Lead_TimeCaption_Control1102154157Lbl : Label 'Lead Time';
        Given_Lead_TimeCaption_Control1102154158Lbl : Label 'Given Lead Time';
        Qty__RejectedCaption_Control1102154159Lbl : Label 'Qty. Rejected';
        Vendor_PPMCaption_Control1102154257Lbl : Label 'Vendor PPM';
        VENDOR_EVALUTIONCaption_Control1102154091Lbl : Label 'VENDOR EVALUTION';
        Vendor_RatingCaption_Control1102154200Lbl : Label 'Vendor Rating';
        PriceCaption_Control1102154202Lbl : Label 'Price';
        TimeCaption_Control1102154203Lbl : Label 'Time';
        QualityCaption_Control1102154204Lbl : Label 'Quality';
        Unit_Cost___With__Taxes_Caption_Control1102154205Lbl : Label 'Unit Cost  (With  Taxes)';
        DeviationCaption_Control1102154206Lbl : Label 'Deviation';
        Lead_TimeCaption_Control1102154207Lbl : Label 'Lead Time';
        Given_Lead_TimeCaption_Control1102154208Lbl : Label 'Given Lead Time';
        UOMCaption_Control1102154209Lbl : Label 'UOM';
        Qty__RejectedCaption_Control1102154210Lbl : Label 'Qty. Rejected';
        QuantityCaption_Control1102154211Lbl : Label 'Quantity';
        Inward_DateCaption_Control1102154212Lbl : Label 'Inward Date';
        Expected_Receipt_DateCaption_Control1102154213Lbl : Label 'Expected Receipt Date';
        Order_DateCaption_Control1102154214Lbl : Label 'Order Date';
        Order_No_Caption_Control1102154215Lbl : Label 'Order No.';
        S_No_Caption_Control1102154218Lbl : Label 'S No.';
        ItemCaption_Control1102154238Lbl : Label 'Item';
        Vendor_PPMCaption_Control1102154260Lbl : Label 'Vendor PPM';
        EmptyStringCaptionLbl : Label '(';
        EmptyStringCaption_Control1102154256Lbl : Label ')';
        VENDOR_EVALUTIONCaption_Control1102154096Lbl : Label 'VENDOR EVALUTION';
        Vendor_RatingCaption_Control1102154304Lbl : Label 'Vendor Rating';
        PriceCaption_Control1102154305Lbl : Label 'Price';
        TimeCaption_Control1102154306Lbl : Label 'Time';
        QualityCaption_Control1102154307Lbl : Label 'Quality';
        Unit_Cost___With__Taxes_Caption_Control1102154308Lbl : Label 'Unit Cost  (With  Taxes)';
        DeviationCaption_Control1102154309Lbl : Label 'Deviation';
        Lead_TimeCaption_Control1102154310Lbl : Label 'Lead Time';
        Given_Lead_TimeCaption_Control1102154311Lbl : Label 'Given Lead Time';
        UOMCaption_Control1102154312Lbl : Label 'UOM';
        Qty__RejectedCaption_Control1102154313Lbl : Label 'Qty. Rejected';
        QuantityCaption_Control1102154314Lbl : Label 'Quantity';
        Inward_DateCaption_Control1102154315Lbl : Label 'Inward Date';
        Expected_Receipt_DateCaption_Control1102154316Lbl : Label 'Expected Receipt Date';
        Order_DateCaption_Control1102154317Lbl : Label 'Order Date';
        Order_No_Caption_Control1102154318Lbl : Label 'Order No.';
        S_No_Caption_Control1102154320Lbl : Label 'S No.';
        Vendor_PPMCaption_Control1102154261Lbl : Label 'Vendor PPM';
        ItemDetailsShowOutput : Boolean;
        VendorDetailsShowOutPut : Boolean;
        Vr_Avg_i_Showoutput : Boolean;
        PurchRecipt5ShowOutput : Boolean;
        Previous_Vendor : Code[20];
        Previous_item : Code[20];
        PTR : Decimal;
        MOQ : Decimal;
        payment_terms : Record "Payment Terms";

    (21124)]
    procedure Entercell(RowNo : Integer;ColumnNo : Integer;CellValue : Text[1000];bold : Boolean;CellType : Option);
    begin
        Tempexcelbuffer.INIT;
        Tempexcelbuffer.VALIDATE("Row No.",RowNo);
        Tempexcelbuffer.VALIDATE("Column No.",ColumnNo);
        Tempexcelbuffer."Cell Value as Text" := CellValue;
        Tempexcelbuffer.Bold:=bold ;
        Tempexcelbuffer."Cell Type" := CellType;
        Tempexcelbuffer.INSERT;
    end;

    (21133)]
    procedure EnterHeadings(RowNo : Integer;ColumnNo : Integer;CellValue : Text[100];Bold : Boolean;CellType : Option);
    begin
        Tempexcelbuffer.INIT;
        Tempexcelbuffer.VALIDATE("Row No.",RowNo);
        Tempexcelbuffer.VALIDATE("Column No.",ColumnNo);
        Tempexcelbuffer."Cell Value as Text" := FORMAT(CellValue);
        Tempexcelbuffer.Bold:=Bold ;
        Tempexcelbuffer."Cell Type" := CellType;
        Tempexcelbuffer.Formula := '';
        Tempexcelbuffer.INSERT;
    end;

    (21143)]
    procedure "Entercell New"();
    begin
    end;
}

