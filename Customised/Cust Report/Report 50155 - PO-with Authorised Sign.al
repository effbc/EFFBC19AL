report 50155 "PO-with Authorised Sign"
{
    // version NAVW13.70,NAVIN3.70.00.13,DIM1.0

    // Project : EFFTRONICS
    // *************************************************************************************************************************
    // SIGN Name
    // ************************************************************************************************************************
    // DIM : Resolution of Dimension Issues after Upgarding.
    // ***********************************************************************************************************************
    // Version  sign     Date       USERID    Description
    // *************************************************************************************************************************
    // 1.0      DIM      28-May-13  SAIRAM    New Code has been added for the dimensions updation after upgarding.
    DefaultLayout = RDLC;
    RDLCLayout = './PO-with Authorised Sign.rdlc';

    Caption = 'Purchase Order';

    dataset
    {
        dataitem("Purchase Header";"Purchase Header")
        {
            DataItemTableView = SORTING(Document Type,No.) WHERE(Document Type=CONST(Order));
            RequestFilterFields = "No.","Buy-from Vendor No.","No. Printed";
            ReqFilterHeading = 'Purchase Order';
            column(Purchase_Header_Document_Type;"Document Type")
            {
            }
            column(Purchase_Header_No_;"No.")
            {
            }
            column(Purchase_Header_Buy_from_Vendor_No_;"Buy-from Vendor No.")
            {
            }
            dataitem("<Vendor1>";Vendor)
            {
                DataItemLink = No.=FIELD(Buy-from Vendor No.);
                column(CompanyInfo_Picture;CompanyInfo.Picture)
                {
                }
                column(CompanyAddr_1_;CompanyAddr[1])
                {
                }
                column(CompanyAddr_2_;CompanyAddr[2])
                {
                }
                column(CompanyAddr_3_;CompanyAddr[3])
                {
                }
                column(CompanyInfo__Phone_No__;CompanyInfo."Phone No.")
                {
                }
                column(CompanyInfo__E_Mail_;CompanyInfo."E-Mail")
                {
                }
                column(CompanyInfo__Fax_No__;CompanyInfo."Fax No.")
                {
                }
                column(CompanyInfo__Home_Page_;CompanyInfo."Home Page")
                {
                }
                column(To_provide_insight_for_enhancing_wealthCaption;To_provide_insight_for_enhancing_wealthCaptionLbl)
                {
                }
                column(E__Mail_Caption;E__Mail_CaptionLbl)
                {
                }
                column(Ph_Caption;Ph_CaptionLbl)
                {
                }
                column(FAX_Caption;FAX_CaptionLbl)
                {
                }
                column(URL_Caption;URL_CaptionLbl)
                {
                }
                column(Purchase_OrderCaption;Purchase_OrderCaptionLbl)
                {
                }
                column(Vendor1__No_;"No.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    /* IF( Vendor."E.C.C No."='') AND ("Purchase Header"."Order Date">121609D) THEN
                       ERROR('THERE IS NO "ECC NO." FOR '+Vendor.Name); //anil */

                end;
            }
            dataitem(CopyLoop;"Integer")
            {
                DataItemTableView = SORTING(Number);
                dataitem(PageLoop;"Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number=CONST(1));
                    column(CompanyInfo__T_I_N__No__;CompanyInfo."T.I.N. No.")
                    {
                    }
                    column(BuyFromAddr_6_;BuyFromAddr[6])
                    {
                    }
                    column(BuyFromAddr_5_;BuyFromAddr[5])
                    {
                    }
                    column(BuyFromAddr_4_;BuyFromAddr[4])
                    {
                    }
                    column(BuyFromAddr_3_;BuyFromAddr[3])
                    {
                    }
                    column(ContactCellNo__;"ContactCellNo.")
                    {
                    }
                    column(Vendor1____Phone_No__;"<Vendor1>"."Phone No.")
                    {
                    }
                    column(Vendor1____Fax_No__;"<Vendor1>"."Fax No.")
                    {
                    }
                    column(Purchase_Header___Buy_from_Contact_;"Purchase Header"."Buy-from Contact")
                    {
                    }
                    column(Purchase_Header___No__;"Purchase Header"."No.")
                    {
                    }
                    column(Purchase_Header___Order_Date_;"Purchase Header"."Order Date")
                    {
                    }
                    column(Vendor1____E_Mail_;"<Vendor1>"."E-Mail")
                    {
                    }
                    column(BuyFromAddr_2_;BuyFromAddr[2])
                    {
                    }
                    column(BuyFromAddr_1_;BuyFromAddr[1])
                    {
                    }
                    column(CompanyInfo__C_S_T_No__;CompanyInfo."C.S.T No.")
                    {
                    }
                    column(Qtn;Qtn)
                    {
                    }
                    column(Qtn_Date;Qtn_Date)
                    {
                    }
                    column(PaymentTerms_Description;PaymentTerms.Description)
                    {
                    }
                    column(ShipmentMethod_Description;ShipmentMethod.Description)
                    {
                    }
                    column(PurchaserName;PurchaserName)
                    {
                    }
                    column(PackingDetails;PackingDetails)
                    {
                    }
                    column(Verification_Requirements_;"Verification Requirements")
                    {
                    }
                    column(Purchase_Header___Requested_Receipt_Date_;"Purchase Header"."Requested Receipt Date")
                    {
                    }
                    column(Material_Value_Txt;Material_Value_Txt)
                    {
                    }
                    column(Excei_Txt;Excei_Txt)
                    {
                    }
                    column(Other_Charges_Txt;Other_Charges_Txt)
                    {
                    }
                    column(OTHER_TAX_TXT;OTHER_TAX_TXT)
                    {
                    }
                    column(CST_TXT;CST_TXT)
                    {
                    }
                    column(CST;CST)
                    {
                    }
                    column(EXCISE;EXCISE)
                    {
                    }
                    column(SERVICE_TAX_TXT;SERVICE_TAX_TXT)
                    {
                    }
                    column(SERVICE;SERVICE)
                    {
                    }
                    column(VAT;VAT)
                    {
                    }
                    column(VAT_TXT;VAT_TXT)
                    {
                    }
                    column(CFORM;CFORM)
                    {
                    }
                    column(DISCOUNT;DISCOUNT)
                    {
                    }
                    column(TOTAL_AMOUNT_TXT;TOTAL_AMOUNT_TXT)
                    {
                    }
                    column(Final_Amount_Txt;Final_Amount_Txt)
                    {
                        AutoFormatType = 1;
                    }
                    column(LINETOTAMT_TXT;LINETOTAMT_TXT)
                    {
                    }
                    column(Excise_Amount_Txt;Excise_Amount_Txt)
                    {
                    }
                    column(Charges_Txt;Charges_Txt)
                    {
                    }
                    column(OTHER_TAXES_TXT;OTHER_TAXES_TXT)
                    {
                    }
                    column(Sales_Tax_Txt;Sales_Tax_Txt)
                    {
                    }
                    column(SERVICE_TAX_VALUE_TXT;SERVICE_TAX_VALUE_TXT)
                    {
                    }
                    column(VAT_AMOUNT_TXT;VAT_AMOUNT_TXT)
                    {
                    }
                    column(Purchase_Header___Purchaser_Code_________FORMAT_TODAY_0_4______FORMAT_TIME_;"Purchase Header"."Purchaser Code"+'    '+FORMAT(TODAY,0,4)+' '+FORMAT(TIME))
                    {
                    }
                    column(TIN_No___Caption;TIN_No___CaptionLbl)
                    {
                    }
                    column(Ref__Quotation_No__Caption;Ref__Quotation_No__CaptionLbl)
                    {
                    }
                    column(Qtn__Dated_______Caption;Qtn__Dated_______CaptionLbl)
                    {
                    }
                    column(Cell_No____________Caption;Cell_No____________CaptionLbl)
                    {
                    }
                    column(Fax_No_____________Caption;Fax_No_____________CaptionLbl)
                    {
                    }
                    column(Ph_No______________Caption;Ph_No______________CaptionLbl)
                    {
                    }
                    column(ToCaption;ToCaptionLbl)
                    {
                    }
                    column(Ord__Ref_No__Caption;Ord__Ref_No__CaptionLbl)
                    {
                    }
                    column(Ordered_Date_Caption;Ordered_Date_CaptionLbl)
                    {
                    }
                    column(Contact___________Caption;Contact___________CaptionLbl)
                    {
                    }
                    column(E_mail_____________Caption;E_mail_____________CaptionLbl)
                    {
                    }
                    column(CST_No____________Caption;CST_No____________CaptionLbl)
                    {
                    }
                    column(NOTE_Caption;NOTE_CaptionLbl)
                    {
                    }
                    column(Payment_Terms_Caption;Payment_Terms_CaptionLbl)
                    {
                    }
                    column(PLEASE_INTIMATE_ANY_DELAY_IN_MATERIAL_BEYOND_DELIVERY_DATE_OR_NON_AVAILABILITY_OF_MATERIAL_IMMEDIATELY_Caption;PLEASE_INTIMATE_ANY_DELAY_IN_MATERIAL_BEYOND_DELIVERY_DATE_OR_NON_AVAILABILITY_OF_MATERIAL_IMMEDIATELY_CaptionLbl)
                    {
                    }
                    column(Delivery_Terms_Caption;Delivery_Terms_CaptionLbl)
                    {
                    }
                    column(Delivery_Date_Caption;Delivery_Date_CaptionLbl)
                    {
                    }
                    column(Verification_Requirements_Caption;Verification_Requirements_CaptionLbl)
                    {
                    }
                    column(Packing_Details_Caption;Packing_Details_CaptionLbl)
                    {
                    }
                    column(Manager_Purchases_Caption;Manager_Purchases_CaptionLbl)
                    {
                    }
                    column(PageLoop_Number;Number)
                    {
                    }
                    dataitem(DimensionLoop1;"Integer")
                    {
                        DataItemLinkReference = "Purchase Header";
                        DataItemTableView = SORTING(Number) WHERE(Number=FILTER(1..));
                        column(DimText;DimText)
                        {
                        }
                        column(DimText_Control72;DimText)
                        {
                        }
                        column(Header_DimensionsCaption;Header_DimensionsCaptionLbl)
                        {
                        }
                        column(DimensionLoop1_Number;Number)
                        {
                        }

                        trigger OnAfterGetRecord();
                        begin
                            //DIM1.0 Start
                            //Code Commented
                            /*
                            IF Number = 1 THEN BEGIN
                              IF NOT DocDim1.FIND('-') THEN
                                CurrReport.BREAK;
                            END ELSE
                              IF NOT Continue THEN
                                CurrReport.BREAK;
                            
                            CLEAR(DimText);
                            Continue := FALSE;
                            REPEAT
                              OldDimText := DimText;
                              IF DimText = '' THEN
                                DimText := STRSUBSTNO(
                                  '%1 %2',DocDim1."Dimension Code",DocDim1."Dimension Value Code")
                              ELSE
                                DimText :=
                                  STRSUBSTNO(
                                    '%1, %2 %3',DimText,
                                    DocDim1."Dimension Code",DocDim1."Dimension Value Code");
                              IF STRLEN(DimText) > MAXSTRLEN(OldDimText) THEN BEGIN
                                DimText := OldDimText;
                                Continue := TRUE;
                                EXIT;
                              END;
                            UNTIL (DocDim1.NEXT = 0);
                            */
                            IF Number = 1 THEN BEGIN
                              IF NOT DimSetEntryGRec.FIND('-') THEN
                                CurrReport.BREAK;
                            END ELSE
                              IF NOT Continue THEN
                                CurrReport.BREAK;
                            
                            CLEAR(DimText);
                            Continue := FALSE;
                            REPEAT
                              OldDimText := DimText;
                              IF DimText = '' THEN
                                DimText := STRSUBSTNO(
                                  '%1 %2',DimSetEntryGRec."Dimension Code",DimSetEntryGRec."Dimension Value Code")
                              ELSE
                                DimText :=
                                  STRSUBSTNO(
                                    '%1, %2 %3',DimText,
                                    DimSetEntryGRec."Dimension Code",DimSetEntryGRec."Dimension Value Code");
                              IF STRLEN(DimText) > MAXSTRLEN(OldDimText) THEN BEGIN
                                DimText := OldDimText;
                                Continue := TRUE;
                                EXIT;
                              END;
                            UNTIL (DimSetEntryGRec.NEXT = 0);
                            //DIM1.0 End

                        end;

                        trigger OnPreDataItem();
                        begin
                            IF NOT ShowInternalInfo THEN
                              CurrReport.BREAK;
                        end;
                    }
                    dataitem("Purchase Line";"Purchase Line")
                    {
                        DataItemLink = Document Type=FIELD(Document Type),Document No.=FIELD(No.);
                        DataItemLinkReference = "Purchase Header";
                        DataItemTableView = SORTING(Document Type,Document No.,Line No.) ORDER(Ascending);
                        column(Purchase_Line__Purchase_Line___Direct_Unit_Cost_;"Purchase Line"."Direct Unit Cost")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 2;
                        }
                        column(Purchase_Line__Purchase_Line___Unit_of_Measure_Code_;"Purchase Line"."Unit of Measure Code")
                        {
                        }
                        column(Sl_No__;"Sl.No.")
                        {
                        }
                        column(Pur_Line_Amt;Pur_Line_Amt)
                        {
                        }
                        column(PurchLine__Currency_Code_;PurchLine."Currency Code")
                        {
                        }
                        column(Purchase_Line__Purchase_Line__Description;"Purchase Line".Description)
                        {
                        }
                        column(Purchase_Line__Purchase_Line__Make;"Purchase Line".Make)
                        {
                        }
                        column(Item_Ordered_QTY;Item_Ordered_QTY)
                        {
                        }
                        column(Foriegn_Value;Foriegn_Value)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 2;
                        }
                        column(Expected_Dates_;"Expected Dates")
                        {
                        }
                        column(Purchase_Line__Purchase_Line___Direct_Unit_Cost__Control1102154061;"Purchase Line"."Direct Unit Cost")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 2;
                        }
                        column(Purchase_Line__Purchase_Line___Unit_of_Measure_Code__Control1102154063;"Purchase Line"."Unit of Measure Code")
                        {
                        }
                        column(Sl_No___Control1102154067;"Sl.No.")
                        {
                        }
                        column(Pur_Line_Amt_Control1102154072;Pur_Line_Amt)
                        {
                        }
                        column(PurchLine__Currency_Code__Control1102154073;PurchLine."Currency Code")
                        {
                        }
                        column(Purchase_Line__Purchase_Line__Description_Control1102154075;"Purchase Line".Description)
                        {
                        }
                        column(Purchase_Line__Purchase_Line__Make_Control1102154076;"Purchase Line".Make)
                        {
                        }
                        column(Item_Ordered_QTY_Control1102154077;Item_Ordered_QTY)
                        {
                        }
                        column(ROUND_Foriegn_Value_2_;ROUND(Foriegn_Value,2))
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 2;
                        }
                        column(Expected_Dates__Control1102154080;"Expected Dates")
                        {
                        }
                        column(Purchase_Line__Purchase_Line__Description_Control1102154019;"Purchase Line".Description)
                        {
                        }
                        column(finalamount;finalamount)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(Note;Note)
                        {
                        }
                        column(Tot_For_Currecy;Tot_For_Currecy)
                        {
                        }
                        column(Item_DescriptionCaption;Item_DescriptionCaptionLbl)
                        {
                        }
                        column(Sl_No_Caption;Sl_No_CaptionLbl)
                        {
                        }
                        column(MakeCaption;MakeCaptionLbl)
                        {
                        }
                        column(QuantityCaption;QuantityCaptionLbl)
                        {
                        }
                        column(UnitCaption;UnitCaptionLbl)
                        {
                        }
                        column(RateCaption;RateCaptionLbl)
                        {
                        }
                        column(Amount_in_Rs_LCY_Caption;Amount_in_Rs_LCY_CaptionLbl)
                        {
                        }
                        column(Amt_Foregin_Caption;Amt_Foregin_CaptionLbl)
                        {
                        }
                        column(Expected__Receipt_DateCaption;Expected__Receipt_DateCaptionLbl)
                        {
                        }
                        column(TotalCaption;TotalCaptionLbl)
                        {
                        }
                        column(Taxes_ExtraCaption;Taxes_ExtraCaptionLbl)
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
                        column(Purchase_Line_No_;"No.")
                        {
                        }

                        trigger OnAfterGetRecord();
                        begin
                             PurchLine.NEXT;
                             Item_Cnt+=1;
                             IF "Purchase Line"."No."<>'' THEN
                            /*   IF (FORMAT(EXCISE)='') AND ("Purchase Line"."BED %">0) AND ("Purchase Line"."Excise Amount">0)  THEN
                                 EXCISE:=FORMAT("Purchase Line"."BED %");
                               IF (FORMAT(VAT)='') AND ("Purchase Line"."VAT %age">0) AND ("Purchase Line"."VAT Amount">0)  THEN
                                  VAT:=FORMAT("Purchase Line"."VAT %age");
                               IF (FORMAT(CST)='') AND ("Purchase Line"."Tax %">0) AND ("Purchase Line"."Tax Amount">0) THEN
                                 CST:=FORMAT("Purchase Line"."Tax %");
                               IF (FORMAT(SERVICE)='') AND ("Purchase Line"."Service Tax %">0) AND ("Purchase Line"."Service Tax Amount">0) THEN
                                 SERVICE:=FORMAT("Purchase Line"."Service Tax %");*/
                             BEGIN
                             END;
                             IF ("Purchase Line"."No."<>'') AND ("Purchase Line".Type="Purchase Line".Type:: Item) THEN
                             BEGIN
                                 //  MESSAGE(FORMAT(PurchLine."No.")+'-'+FORMAT("Purchase Line"."No."));
                                 IF (PurchLine."No."="Purchase Line"."No.") AND (Item_Cnt<>Pur_Cnt) THEN
                                 BEGIN
                                   IF Previous THEN
                                   BEGIN
                                     Item_Ordered_QTY+="Purchase Line".Quantity;
                                     "No.Of Lines"+=1;
                                   END ELSE
                                   BEGIN
                                     Item_Ordered_QTY:="Purchase Line".Quantity;
                                     "No.Of Lines":=1;
                                      Order_Breakup:='';
                                   END;
                                   Previous:=TRUE;
                                   // MESSAGE(FORMAT(Item_Ordered_QTY));
                                   CASE "No.Of Lines" OF
                                     1:Schedu_Number:='First   Sch. Req qty ';
                                     2:Schedu_Number:='Second  Sch. Req qty ';
                                     3:Schedu_Number:='Third   Sch. Req qty ';
                                     4:Schedu_Number:='Fourth  Sch. Req qty ';
                                     5:Schedu_Number:='Fifth   Sch. Req qty ';
                                   END;
                                   Order_Breakup+=Schedu_Number+' '+ FORMAT("Purchase Line".Quantity)+' - '
                                                   +FORMAT("Purchase Line"."Expected Receipt Date")+', ';
                                   IF "Purchase Line".COUNT>1 THEN
                                   CurrReport.SKIP;
                                 END ELSE
                                 BEGIN
                                   IF Previous THEN
                                   BEGIN
                                     Item_Ordered_QTY+="Purchase Line".Quantity;
                                     "No.Of Lines"+=1;
                                   END ELSE
                                   BEGIN
                                     Item_Ordered_QTY:="Purchase Line".Quantity;
                                     "No.Of Lines":=1;
                                     Order_Breakup:='';
                                   END;
                                   Previous:=FALSE;
                                   // MESSAGE(FORMAT(Item_Ordered_QTY));
                                   CASE "No.Of Lines" OF
                                     1:Schedu_Number:='First   Sch. Req qty ';
                                     2:Schedu_Number:='Second  Sch. Req qty ';
                                     3:Schedu_Number:='Third   Sch. Req qty ';
                                     4:Schedu_Number:='Fourth  Sch. Req qty ';
                                     5:Schedu_Number:='Fifth   Sch. Req qty ';
                                   END;
                                   Order_Breakup+=Schedu_Number+' '+ FORMAT("Purchase Line".Quantity)+' - '
                                                   +FORMAT("Purchase Line"."Expected Receipt Date")+', ';
                            
                                 END;
                               END ELSE
                               BEGIN
                                   IF Previous THEN
                                   BEGIN
                                     Item_Ordered_QTY+="Purchase Line".Quantity;
                                     "No.Of Lines"+=1;
                                   END ELSE
                                   BEGIN
                                     Item_Ordered_QTY:="Purchase Line".Quantity;
                                     "No.Of Lines":=1;
                                     Order_Breakup:='';
                                   END;
                                   Previous:=FALSE;
                                   // MESSAGE(FORMAT(Item_Ordered_QTY));
                                   CASE "No.Of Lines" OF
                                     1:Schedu_Number:='First   Sch. Req qty ';
                                     2:Schedu_Number:='Second  Sch. Req qty ';
                                     3:Schedu_Number:='Third   Sch. Req qty ';
                                     4:Schedu_Number:='Fourth  Sch. Req qty ';
                                     5:Schedu_Number:='Fifth   Sch. Req qty ';
                                   END;
                                   Order_Breakup+=Schedu_Number+' '+ FORMAT("Purchase Line".Quantity)+' - '
                                                   +FORMAT("Purchase Line"."Expected Receipt Date")+', ';
                            
                            
                             END;

                        end;

                        trigger OnPreDataItem();
                        begin
                                Previous:=TRUE;
                                PurchLine.SETCURRENTKEY(PurchLine."Document Type",PurchLine."Document No.",PurchLine."Line No.");
                                PurchLine.RESET;
                                PurchLine.SETRANGE(PurchLine."Document No.","Purchase Header"."No.");
                                IF PurchLine.FIND('-') THEN
                                Pur_Cnt:=PurchLine.COUNT;
                        end;
                    }
                    dataitem(RoundLoop;"Integer")
                    {
                        DataItemTableView = SORTING(Number);
                        column(Purchase_Line__Quantity____Purchase_Line___Unit_Cost__LCY___;("Purchase Line".Quantity)*("Purchase Line"."Unit Cost (LCY)"))
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(ContinuedCaption;ContinuedCaptionLbl)
                        {
                        }
                        column(RoundLoop_Number;Number)
                        {
                        }
                        dataitem(DimensionLoop2;"Integer")
                        {
                            DataItemTableView = SORTING(Number) WHERE(Number=FILTER(1..));
                            column(DimText_Control74;DimText)
                            {
                            }
                            column(Line_DimensionsCaption;Line_DimensionsCaptionLbl)
                            {
                            }
                            column(DimensionLoop2_Number;Number)
                            {
                            }

                            trigger OnAfterGetRecord();
                            begin
                                //DIM1.0 Start
                                //Code Commented
                                /*
                                IF Number = 1 THEN BEGIN
                                  IF NOT DocDim2.FIND('-') THEN
                                    CurrReport.BREAK;
                                END ELSE
                                  IF NOT Continue THEN
                                    CurrReport.BREAK;
                                
                                CLEAR(DimText);
                                Continue := FALSE;
                                REPEAT
                                  OldDimText := DimText;
                                  IF DimText = '' THEN
                                    DimText := STRSUBSTNO(
                                      '%1 %2',DocDim2."Dimension Code",DocDim2."Dimension Value Code")
                                  ELSE
                                    DimText :=
                                      STRSUBSTNO(
                                        '%1, %2 %3',DimText,
                                        DocDim2."Dimension Code",DocDim2."Dimension Value Code");
                                  IF STRLEN(DimText) > MAXSTRLEN(OldDimText) THEN BEGIN
                                    DimText := OldDimText;
                                    Continue := TRUE;
                                    EXIT;
                                  END;
                                UNTIL (DocDim2.NEXT = 0);
                                */
                                IF Number = 1 THEN BEGIN
                                  IF NOT DimSetEntryGRec2.FIND('-') THEN
                                    CurrReport.BREAK;
                                END ELSE
                                  IF NOT Continue THEN
                                    CurrReport.BREAK;
                                
                                CLEAR(DimText);
                                Continue := FALSE;
                                REPEAT
                                  OldDimText := DimText;
                                  IF DimText = '' THEN
                                    DimText := STRSUBSTNO(
                                      '%1 %2',DimSetEntryGRec2."Dimension Code",DimSetEntryGRec2."Dimension Value Code")
                                  ELSE
                                    DimText :=
                                      STRSUBSTNO(
                                        '%1, %2 %3',DimText,
                                        DimSetEntryGRec2."Dimension Code",DimSetEntryGRec2."Dimension Value Code");
                                  IF STRLEN(DimText) > MAXSTRLEN(OldDimText) THEN BEGIN
                                    DimText := OldDimText;
                                    Continue := TRUE;
                                    EXIT;
                                  END;
                                UNTIL (DimSetEntryGRec2.NEXT = 0);
                                //DIm1.0 End

                            end;

                            trigger OnPreDataItem();
                            begin
                                IF NOT ShowInternalInfo THEN
                                  CurrReport.BREAK;
                                
                                //DIM1.0 Start
                                //Code Commented
                                /*
                                DocDim2.SETRANGE("Table ID",DATABASE::"Purchase Line");
                                DocDim2.SETRANGE("Document Type","Purchase Line"."Document Type");
                                DocDim2.SETRANGE("Document No.","Purchase Line"."Document No.");
                                DocDim2.SETRANGE("Line No.","Purchase Line"."Line No.");
                                */
                                DimSetEntryGRec2.RESET;
                                DimSetEntryGRec2.SETRANGE("Dimension Set ID","Purchase Line"."Dimension Set ID");

                            end;
                        }

                        trigger OnAfterGetRecord();
                        begin
                            IF Number = 1 THEN
                              PurchLine.FIND('-')
                            ELSE
                              PurchLine.NEXT;
                            "Purchase Line" := PurchLine;

                            IF NOT "Purchase Header"."Prices Including VAT" AND
                               (PurchLine."VAT Calculation Type" = PurchLine."VAT Calculation Type"::"Full VAT")
                            THEN
                              PurchLine."Line Amount" := 0;

                            IF (PurchLine.Type = PurchLine.Type::"G/L Account") AND (NOT ShowInternalInfo) THEN
                              "Purchase Line"."No." := '';

                            // NAVIN

                            IF Currency.GET(PurchLine."Currency Code") THEN;
                            LineAmt := ROUND(PurchLine.Quantity * PurchLine."Direct Unit Cost",Currency."Amount Rounding Precision");
                            LineTotAmt := LineTotAmt + LineAmt;

                            StructureLineDetails.SETRANGE(StructureLineDetails.Type,StructureLineDetails.Type::Purchase);
                            StructureLineDetails.SETRANGE(StructureLineDetails."Document Type",PurchLine."Document Type");
                            StructureLineDetails.SETRANGE(StructureLineDetails."Document No.",PurchLine."Document No.");
                            StructureLineDetails.SETRANGE(StructureLineDetails."Item No.",PurchLine."No.");
                            StructureLineDetails.SETRANGE("Line No.",PurchLine."Line No.");
                            IF StructureLineDetails.FIND('-') THEN
                              REPEAT
                                IF StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::Excise THEN
                                  ExciseAmount := ExciseAmount + StructureLineDetails.Amount;
                                IF StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::Charges THEN
                                  Charges := Charges + StructureLineDetails.Amount;
                                IF StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::"Other Taxes" THEN
                                  Othertaxes := Othertaxes + StructureLineDetails.Amount;
                                IF StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::"Sales Tax" THEN
                                  SalesTax := SalesTax + StructureLineDetails.Amount;
                                IF StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::GST THEN
                                  ServiceTax := ServiceTax + StructureLineDetails.Amount;
                                IF StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::"Service Tax" THEN
                                  VATAmount := VATAmount + StructureLineDetails.Amount;
                                LineTotAmt := LineTotAmt + StructureLineDetails.Amount;
                              UNTIL StructureLineDetails.NEXT = 0;
                            // NAVIN

                            //Navision Efftronics
                              IF ("Purchase Line".Type<>"Purchase Line".Type::" ")THEN
                              "Sl.No." := "Sl.No." + 1;

                              IF Prev_Item=PurchLine."No." THEN
                              BEGIN
                                Item_Ordered_QTY+=PurchLine.Quantity;
                                IF PurchLine."Currency Code"<>'' THEN
                                "Total  currency"+=("Purchase Line".Quantity)*PurchLine."Unit Cost";
                                IF "Purchase Line".Quantity>0 THEN
                                Tot_For_Currecy+="Total  currency";

                                totalamount:=(Item_Ordered_QTY)*("Purchase Line"."Unit Cost (LCY)");//anil
                              //  IF("Purchase Line"."No."<>' ') THEN
                              //    finalamount:=finalamount+totalamount;
                                CurrReport.SKIP;
                              END ELSE
                              BEGIN
                                Prev_Item:=PurchLine."No.";
                                Item_Ordered_QTY+=PurchLine.Quantity;
                                IF PurchLine."Currency Code"<>'' THEN
                                "Total  currency":=("Purchase Line".Quantity)*PurchLine."Unit Cost";
                                IF "Purchase Line".Quantity>0 THEN
                                Tot_For_Currecy+="Total  currency";

                                totalamount:=("Purchase Line".Quantity)*("Purchase Line"."Unit Cost (LCY)");//anil
                              //  IF("Purchase Line"."No."<>' ') THEN
                              //    finalamount:=finalamount+totalamount;
                              END;
                        end;

                        trigger OnPostDataItem();
                        begin
                            PurchLine.DELETEALL;
                        end;

                        trigger OnPreDataItem();
                        begin
                            // NAVIN
                            LineTotAmt := 0;
                            LineAmt := 0;
                            ExciseAmount := 0;
                            Charges := 0;
                            Othertaxes := 0;
                            SalesTax := 0;
                            VATAmount := 0;
                            // NAVIN

                            MoreLines := PurchLine.FIND('+');
                            WHILE MoreLines AND (PurchLine.Description = '') AND (PurchLine."Description 2"= '') AND
                                  (PurchLine."No." = '') AND (PurchLine.Quantity = 0) AND
                                  (PurchLine.Amount = 0) DO
                              MoreLines := PurchLine.NEXT(-1) <> 0;
                            IF NOT MoreLines THEN
                              CurrReport.BREAK;
                            PurchLine.SETRANGE("Line No.",0,PurchLine."Line No.");
                            SETRANGE(Number,1,PurchLine.COUNT);

                            // NAVIN
                            //CurrReport.CREATETOTALS(PurchLine."Line Amount",PurchLine."Inv. Discount Amount");
                            CurrReport.CREATETOTALS(PurchLine."Line Amount",PurchLine.Amount,PurchLine."Inv. Discount Amount",
                            PurchLine."Line Discount Amount",PurchLine."Amount Including Excise",
                            PurchLine."Amount Including Tax",PurchLine."Excise Amount",PurchLine."Tax Amount",
                            PurchLine."Tax Base Amount",PurchLine."Excise Base Amount");
                            CurrReport.CREATETOTALS(LineAmt,PurchLine."Bal. TDS Including SHE CESS",PurchLine."Work Tax Amount");
                            // NAVIN
                            //Navision Efftronics
                            "Sl.No.":=0;
                            //SlFlag := FALSE;
                        end;
                    }
                    dataitem(VATCounter;"Integer")
                    {
                        DataItemTableView = SORTING(Number);

                        trigger OnAfterGetRecord();
                        begin
                            VATAmountLine.GetLine(Number);
                        end;

                        trigger OnPreDataItem();
                        begin
                            IF VATAmount = 0 THEN
                              CurrReport.BREAK;
                            SETRANGE(Number,1,VATAmountLine.COUNT);
                            CurrReport.CREATETOTALS(
                              VATAmountLine."Line Amount",VATAmountLine."Inv. Disc. Base Amount",
                              VATAmountLine."Invoice Discount Amount",VATAmountLine."VAT Base",VATAmountLine."VAT Amount");
                        end;
                    }
                    dataitem(Total;"Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number=CONST(1));
                    }
                    dataitem(Total2;"Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number=CONST(1));

                        trigger OnPreDataItem();
                        begin
                            IF "Purchase Header"."Buy-from Vendor No." = "Purchase Header"."Pay-to Vendor No." THEN
                              CurrReport.BREAK;
                        end;
                    }
                    dataitem(Total3;"Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number=CONST(1));

                        trigger OnPreDataItem();
                        begin
                            IF ("Purchase Header"."Sell-to Customer No." = '') AND (ShipToAddr[1] = '') THEN
                              CurrReport.BREAK;
                        end;
                    }
                }

                trigger OnAfterGetRecord();
                begin
                    CLEAR(PurchLine);
                    CLEAR(PurchPost);
                    PurchLine.DELETEALL;
                    VATAmountLine.DELETEALL;
                    PurchPost.GetPurchLines("Purchase Header",PurchLine,0);
                    PurchLine.CalcVATAmountLines(0,"Purchase Header",PurchLine,VATAmountLine);
                    PurchLine.UpdateVATOnLines(0,"Purchase Header",PurchLine,VATAmountLine);
                    VATAmount := VATAmountLine.GetTotalVATAmount;
                    VATBaseAmount := VATAmountLine.GetTotalVATBase;
                    VATDiscountAmount :=
                      VATAmountLine.GetTotalVATDiscount("Purchase Header"."Currency Code","Purchase Header"."Prices Including VAT");
                    TotalAmountInclVAT := VATAmountLine.GetTotalAmountInclVAT;

                    IF Number > 1 THEN
                      CopyText := Text003;
                    CurrReport.PAGENO := 1;
                end;

                trigger OnPostDataItem();
                begin
                    IF NOT CurrReport.PREVIEW THEN
                      PurchCountPrinted.RUN("Purchase Header");
                end;

                trigger OnPreDataItem();
                begin
                    NoOfLoops := ABS(NoOfCopies) + 1;
                    CopyText := '';
                    SETRANGE(Number,1,NoOfLoops);
                end;
            }

            trigger OnAfterGetRecord();
            begin
                PackingDetails:="Purchase Header"."Packing Type";
                IF (PackingDetails='')  AND ("Purchase Header"."Order Date">121609D) THEN
                  ERROR('PLEASE ENTER THE PACKING DETAILS');
                
                IF ("Purchase Header"."Payment Terms Code"='') AND ("Purchase Header"."Order Date">121609D) THEN
                  ERROR('PLEASE ENTER THE PAYMENT TERMS CODE FOR THIS VENDOR');
                IF ("Purchase Header"."Requested Receipt Date"=0D) AND ("Purchase Header"."Order Date">121609D) THEN
                  ERROR('PLEASE ENTER THE REQUESTED RECIEPT DATE ');
                
                CurrReport.LANGUAGE := Language.GetLanguageID("Language Code");
                
                CompanyInfo.GET;
                
                IF RespCenter.GET("Responsibility Center") THEN BEGIN
                  FormatAddr.RespCenter(CompanyAddr,RespCenter);
                  CompanyInfo."Phone No." := RespCenter."Phone No.";
                  CompanyInfo."Fax No." := RespCenter."Fax No.";
                END ELSE
                  FormatAddr.Company(CompanyAddr,CompanyInfo);
                
                //DIM1.0 Start
                //Code Commented
                /*
                DocDim1.SETRANGE("Table ID",DATABASE::"Purchase Header");
                DocDim1.SETRANGE("Document Type","Purchase Header"."Document Type");
                DocDim1.SETRANGE("Document No.","Purchase Header"."No.");
                */
                DimSetEntryGRec.RESET;
                DimSetEntryGRec.SETRANGE("Dimension Set ID","Dimension Set ID");
                //DIM1.0 End
                
                
                IF "Purchase Header"."Form Code"='C'  THEN
                  CFORM:='C FORM'
                ELSE
                  CFORM:='';
                
                IF "Purchaser Code" = '' THEN BEGIN
                  SalesPurchPerson.INIT;
                  PurchaserText := '';
                END ELSE BEGIN
                  SalesPurchPerson.GET("Purchaser Code");
                  PurchaserText := Text000
                END;
                IF "Your Reference" = '' THEN
                  ReferenceText := ''
                ELSE
                  ReferenceText := FIELDCAPTION("Your Reference");
                IF "VAT Registration No." = '' THEN
                  VATNoText := ''
                ELSE
                  VATNoText := FIELDCAPTION("VAT Registration No.");
                IF "Currency Code" = '' THEN BEGIN
                  GLSetup.TESTFIELD("LCY Code");
                  TotalText := STRSUBSTNO(Text001,GLSetup."LCY Code");
                  TotalInclVATText := STRSUBSTNO(Text002,GLSetup."LCY Code");
                  TotalExclVATText := STRSUBSTNO(Text006,GLSetup."LCY Code");
                END ELSE BEGIN
                  TotalText := STRSUBSTNO(Text001,"Currency Code");
                  TotalInclVATText := STRSUBSTNO(Text002,"Currency Code");
                  TotalExclVATText := STRSUBSTNO(Text006,"Currency Code");
                END;
                
                FormatAddr.PurchHeaderBuyFromtemp(BuyFromAddr,"Purchase Header");
                
                IF ("Purchase Header"."Buy-from Vendor No." <> "Purchase Header"."Pay-to Vendor No.") THEN
                  FormatAddr.PurchHeaderPayTo(VendAddr,"Purchase Header");
                IF "Payment Terms Code" = '' THEN
                  PaymentTerms.INIT
                ELSE
                  PaymentTerms.GET("Payment Terms Code");
                IF "Shipment Method Code" = '' THEN
                  ShipmentMethod.INIT
                ELSE
                  ShipmentMethod.GET("Shipment Method Code");
                
                FormatAddr.PurchHeaderShipTo(ShipToAddr,"Purchase Header");
                
                IF NOT CurrReport.PREVIEW THEN BEGIN
                  IF ArchiveDocument THEN
                    ArchiveManagement.StorePurchDocument("Purchase Header",LogInteraction);
                
                  IF LogInteraction THEN BEGIN
                    CALCFIELDS("No. of Archived Versions");
                    SegManagement.LogDocument(
                      13,"No.","Doc. No. Occurrence","No. of Archived Versions",DATABASE::Vendor,"Buy-from Vendor No.",
                      "Purchaser Code",'',"Posting Description",'');
                  END;
                END;
                
                //Navision Efftronics
                PurcaserCode.GET("Purchase Header"."Purchaser Code");
                PurchaserName := PurcaserCode.Name;
                IF Contact.GET("Purchase Header"."Buy-from Contact No.") THEN
                 "ContactFAXNo." := Contact."Fax No.";
                  ContactName    := Contact.Name;
                  "ContactPhNo." := Contact."Phone No.";
                 "ContactCellNo.":= Contact."Mobile Phone No.";
                  "ContactE-mail":= Contact."E-Mail";
                IF CompanyInfo.FIND('-') THEN
                   CompanyInfo.CALCFIELDS(CompanyInfo.Picture);

            end;

            trigger OnPreDataItem();
            begin
                  Start_Date:=040107D;
                  Final_Date:=040199D;
                EXCISE:='';
                VAT:='';
                CST:='';
                SERVICE:='';
                //CFORM:='';
                //DISCOUNT:='';
                //FORIEGN:='';
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

    trigger OnInitReport();
    begin
        GLSetup.GET;
        //SlFlag := FALSE;
    end;

    trigger OnPreReport();
    begin
        //  IF PackingDetails='' THEN
        //    PackingDetails:='Standard Packing';

          IF "Verification Requirements"='' THEN
             "Verification Requirements":='NIL';
    end;

    var
        Text000 : Label 'Purchaser';
        Text001 : Label 'Total %1';
        Text002 : Label 'Total %1 Incl. VAT';
        Text003 : Label 'COPY';
        Text004 : Label 'Order %1';
        Text005 : Label 'Page %1';
        Text006 : Label 'Total %1 Excl. VAT';
        GLSetup : Record "General Ledger Setup";
        CompanyInfo : Record "Company Information";
        ShipmentMethod : Record "Shipment Method";
        PaymentTerms : Record "Payment Terms";
        SalesPurchPerson : Record "Salesperson/Purchaser";
        VATAmountLine : Record "VAT Amount Line" temporary;
        PurchLine : Record "Purchase Line" temporary;
        RespCenter : Record "Responsibility Center";
        Language : Record Language;
        PurchCountPrinted : Codeunit "Purch.Header-Printed";
        FormatAddr : Codeunit "Format Address";
        PurchPost : Codeunit "Purch.-Post";
        ArchiveManagement : Codeunit ArchiveManagement;
        SegManagement : Codeunit SegManagement;
        VendAddr : array [8] of Text[100];
        ShipToAddr : array [8] of Text[100];
        CompanyAddr : array [8] of Text[100];
        BuyFromAddr : array [8] of Text[100];
        PurchaserText : Text[100];
        VATNoText : Text[100];
        ReferenceText : Text[100];
        TotalText : Text[100];
        TotalInclVATText : Text[100];
        TotalExclVATText : Text[100];
        MoreLines : Boolean;
        NoOfCopies : Integer;
        NoOfLoops : Integer;
        CopyText : Text[100];
        DimText : Text[120];
        OldDimText : Text[100];
        ShowInternalInfo : Boolean;
        Continue : Boolean;
        ArchiveDocument : Boolean;
        LogInteraction : Boolean;
        VATAmount : Decimal;
        VATBaseAmount : Decimal;
        VATDiscountAmount : Decimal;
        TotalAmountInclVAT : Decimal;
        "-NAVIN-" : Integer;
        StructureLineDetails : Record "Structure Order Line Details";
        TotalTaxAmount : Decimal;
        LineAmt : Decimal;
        LineTotAmt : Decimal;
        ExciseAmount : Decimal;
        Charges : Decimal;
        Othertaxes : Decimal;
        SalesTax : Decimal;
        Currency : Record Currency;
        ServiceTax : Decimal;
        "---Navision Efftronics-----" : Integer;
        "Sl.No." : Integer;
        Vendor : Record Vendor;
        PurcaserCode : Record "Salesperson/Purchaser";
        PurchaserName : Text[50];
        "PhoneNo." : Code[20];
        Contact : Record Contact;
        "ContactFAXNo." : Code[100];
        ContactName : Text[50];
        "ContactPhNo." : Text[30];
        "ContactCellNo." : Text[30];
        "ContactE-mail" : Text[100];
        PackingDetails : Text[50];
        "Verification Requirements" : Text[50];
        Note : Text[50];
        totalamount : Decimal;
        finalamount : Decimal;
        "Total  currency" : Decimal;
        Tot_For_Currecy : Decimal;
        Prev_Item : Code[30];
        Item_Ordered_QTY : Decimal;
        Order_Breakup : Text[1000];
        "No.Of Lines" : Integer;
        "Expected Dates" : Text[1000];
        Schedu_Number : Text[100];
        "Delivery Date" : Date;
        Line_No : Integer;
        Previous : Boolean;
        Start_Date : Date;
        Final_Date : Date;
        PL : Record "Purchase Line";
        Pur_Cnt : Integer;
        Item_Cnt : Integer;
        Foriegn_Value : Decimal;
        Pur_Line_Amt : Decimal;
        Qtn : Code[30];
        Qtn_Date : Code[15];
        EXCISE : Text[30];
        VAT : Text[30];
        CST : Text[30];
        SERVICE : Text[30];
        CFORM : Text[30];
        DISCOUNT : Text[30];
        FORIEGN : Text[30];
        FORIEGN_AMOUNT : Decimal;
        Material_Value_Txt : Text[30];
        Final_Amount_Txt : Text[30];
        Excei_Txt : Text[30];
        Excise_Amount_Txt : Text[30];
        Other_Charges_Txt : Text[30];
        Sales_Tax_Txt : Text[30];
        CST_TXT : Text[30];
        SERVICE_TAX_TXT : Text[30];
        VAT_TXT : Text[30];
        SERVICE_TAX_VALUE_TXT : Text[30];
        VAT_AMOUNT_TXT : Text[30];
        TOTAL_AMOUNT_TXT : Text[30];
        LINETOTAMT_TXT : Text[30];
        OTHER_TAXES_TXT : Text[30];
        Charges_Txt : Text[30];
        Other_Chrges_Txt : Text[30];
        OTHER_TAX_TXT : Text[30];
        To_provide_insight_for_enhancing_wealthCaptionLbl : Label 'To provide insight for enhancing wealth';
        E__Mail_CaptionLbl : Label 'E- Mail:';
        Ph_CaptionLbl : Label 'Ph:';
        FAX_CaptionLbl : Label 'FAX:';
        URL_CaptionLbl : Label 'URL:';
        Purchase_OrderCaptionLbl : Label 'Purchase Order';
        TIN_No___CaptionLbl : Label 'TIN No. :';
        Ref__Quotation_No__CaptionLbl : Label 'Ref. Quotation No :';
        Qtn__Dated_______CaptionLbl : Label 'Qtn. Dated      :';
        Cell_No____________CaptionLbl : Label 'Cell No.          :';
        Fax_No_____________CaptionLbl : Label 'Fax.No            :';
        Ph_No______________CaptionLbl : Label 'Ph.No             :';
        ToCaptionLbl : Label 'To';
        Ord__Ref_No__CaptionLbl : Label '"Ord. Ref.No: "';
        Ordered_Date_CaptionLbl : Label 'Ordered Date:';
        Contact___________CaptionLbl : Label 'Contact          :';
        E_mail_____________CaptionLbl : Label 'E-mail            :';
        CST_No____________CaptionLbl : Label 'CST.No           :';
        NOTE_CaptionLbl : Label 'NOTE:';
        Payment_Terms_CaptionLbl : Label 'Payment Terms:';
        PLEASE_INTIMATE_ANY_DELAY_IN_MATERIAL_BEYOND_DELIVERY_DATE_OR_NON_AVAILABILITY_OF_MATERIAL_IMMEDIATELY_CaptionLbl : Label 'PLEASE INTIMATE ANY DELAY IN MATERIAL BEYOND DELIVERY DATE OR NON-AVAILABILITY OF MATERIAL IMMEDIATELY.';
        Delivery_Terms_CaptionLbl : Label 'Delivery Terms:';
        Delivery_Date_CaptionLbl : Label 'Delivery Date:';
        Verification_Requirements_CaptionLbl : Label 'Verification Requirements:';
        Packing_Details_CaptionLbl : Label 'Packing Details:';
        Manager_Purchases_CaptionLbl : Label '(Manager-Purchases)';
        Header_DimensionsCaptionLbl : Label 'Header Dimensions';
        Item_DescriptionCaptionLbl : Label 'Item Description';
        Sl_No_CaptionLbl : Label 'Sl.No.';
        MakeCaptionLbl : Label 'Make';
        QuantityCaptionLbl : Label 'Quantity';
        UnitCaptionLbl : Label 'Unit';
        RateCaptionLbl : Label 'Rate';
        Amount_in_Rs_LCY_CaptionLbl : Label 'Amount in Rs(LCY)';
        Amt_Foregin_CaptionLbl : Label '"Amt.Foregin "';
        Expected__Receipt_DateCaptionLbl : Label 'Expected  Receipt Date';
        TotalCaptionLbl : Label 'Total';
        Taxes_ExtraCaptionLbl : Label 'Taxes Extra';
        ContinuedCaptionLbl : Label 'Continued';
        Line_DimensionsCaptionLbl : Label 'Line Dimensions';
        "-DIM1.0-" : Integer;
        DimSetEntryGRec : Record "Dimension Set Entry";
        DimSetEntryGRec2 : Record "Dimension Set Entry";
}

