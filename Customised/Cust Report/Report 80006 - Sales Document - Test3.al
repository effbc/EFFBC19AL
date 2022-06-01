report 80006 "Sales Document - Test3"
{
    // version NAVW17.00,NAVIN7.00,KKC

    // <changelog>
    //   <change id="IN0090" dev="AUGMENTUM" date="2008-05-28" area="Sales"
    //    baseversion="IN6.00" releaseversion="IN6.00" feature="NAVCORS20355">
    //     Report transformation.  </change>
    //   <add id="PS36451" dev="Vineet" date="2008-08-07" area="VAT" releaseversion="IN6.00" feature="36451"
    //    > Code are added to show warning for Tax Type</add>
    // <add id="PS39773" dev="Anup" date="2008-11-15" area="STAPPL" releaseversion="IN6.00.01" feature="39773"
    // >Functions FilterAppliedEntries,FindAmtForAppln,CheckCalcPmtDisc,RoundServiceTaxPrecision,CheckAppliedInvHasServTax,
    // CheckRefundApplicationOnline,CheckRoundingParameters,CheckAppliedCustPayment,CheckApplofSTpureAgntOnline added</add>
    //  <change id="PS42498" dev="suneethg" date="2009-10-15" area="Sales Tax" releaseversion="IN7.00" feature="NAVCORS42498">
    //  Incorrect Tax Amount in Sales Document Report Corrected</change>
    // </changelog>
    DefaultLayout = RDLC;
    RDLCLayout = './Sales Document - Test3.rdlc';

    CaptionML = ENU = 'Sales Document - Test',
                ENN = 'Sales Document - Test';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = WHERE(Document Type=FILTER(<>Quote));
            RequestFilterFields = "Document Type","No.";
            ReqFilterHeading = 'Sales Document';
            column(Round_Loop_S_No;S_NoCaptionLbl)
            {
            }
            column(Round_Loop_Description_of_Goods;Description_of_GoodsCaptionLbl)
            {
            }
            column(Round_Loop_QtyCaption;QtyCaptionLbl)
            {
            }
            column(Round_Loop_Unit_PriceCaption;Unit_PriceCaptionLbl)
            {
            }
            column(Round_Loop_AmountCaption;AmountCaptionLbl)
            {
            }
            column(Sales_Header_Document_Type;"Document Type")
            {
            }
            column(Sales_Header_No_;"No.")
            {
            }
            dataitem(PageCounter;"Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number=CONST(1));
                column(SalesHeader_Ship_to_Name_;SalesHeader."Ship-to Name")
                {
                }
                column(SalesHeader_Ship_to_Address;SalesHeader."Ship-to Address")
                {
                }
                column(SalesHeader__Ship_to_Address_2_;SalesHeader."Ship-to Address 2")
                {
                }
                column(Sold_toCaption;Sold_toCaptionLbl)
                {
                }
                column(Dear_Sir_Caption;Dear_Sir_CaptionLbl)
                {
                }
                column(ConsigneeCaption;ConsigneeCaptionLbl)
                {
                }
                column(DataItem1102152047;With_Reference_to_the_above_purchase_order__we_here_by_inform_that_RDSO_inspection_is_completed__will_be_completed_in______daLbl)
                {
                }
                column(SalesHeader_Sell_to_Customer_Name;SalesHeader."Sell-to Customer Name")
                {
                }
                column(TOCaptionLbl;TOCaptionLbl)
                {
                }
                column(SalesHeader_Sell_to_City;SalesHeader."Sell-to City")
                {
                }
                column(Page_Counter_SalesHeader_CustomerOrderDate_0_4;FORMAT("Sales Header"."Customer Order Date",0,4))
                {
                }
                column(Page_Counter_Sales_Header_No;SalesHeader."Customer OrderNo.")
                {
                }
                column(Dt_Caption;Dt_CaptionLbl)
                {
                }
                column(Order_No_Caption;Order_No_CaptionLbl)
                {
                }
                column(TIN_NO__28350166764Caption;TIN_NO__28350166764CaptionLbl)
                {
                }
                column(CST_NO__28350166764Caption;CST_NO__28350166764CaptionLbl)
                {
                }
                column(DT_Caption_Control1000000014;DT_Caption_Control1000000014Lbl)
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
                column(STRSUBSTNO_Text014_SalesHeaderFilter_;STRSUBSTNO(Text014,SalesHeaderFilter))
                {
                }
                column(SalesHeaderFilter;SalesHeaderFilter)
                {
                }
                column(ShipInvText;ShipInvText)
                {
                }
                column(ReceiveInvText;ReceiveInvText)
                {
                }
                column(Sales_Header___Sell_to_Customer_No__;"Sales Header"."Sell-to Customer No.")
                {
                }
                column(ShipToAddr_8_;ShipToAddr[8])
                {
                }
                column(ShipToAddr_7_;ShipToAddr[7])
                {
                }
                column(ShipToAddr_6_;ShipToAddr[6])
                {
                }
                column(ShipToAddr_5_;ShipToAddr[5])
                {
                }
                column(ShipToAddr_4_;ShipToAddr[4])
                {
                }
                column(ShipToAddr_3_;ShipToAddr[3])
                {
                }
                column(ShipToAddr_2_;ShipToAddr[2])
                {
                }
                column(ShipToAddr_1_;ShipToAddr[1])
                {
                }
                column(SellToAddr_8_;SellToAddr[8])
                {
                }
                column(SellToAddr_7_;SellToAddr[7])
                {
                }
                column(SellToAddr_6_;SellToAddr[6])
                {
                }
                column(SellToAddr_5_;SellToAddr[5])
                {
                }
                column(SellToAddr_4_;SellToAddr[4])
                {
                }
                column(SellToAddr_3_;SellToAddr[3])
                {
                }
                column(SellToAddr_2_;SellToAddr[2])
                {
                }
                column(SellToAddr_1_;SellToAddr[1])
                {
                }
                column(Sales_Header___Ship_to_Code_;"Sales Header"."Ship-to Code")
                {
                }
                column(FORMAT__Sales_Header___Document_Type____________Sales_Header___No__;FORMAT("Sales Header"."Document Type") + ' ' + "Sales Header"."No.")
                {
                }
                column(ShipReceiveOnNextPostReq;ShipReceiveOnNextPostReq)
                {
                }
                column(ShowCostAssignment;ShowCostAssignment)
                {
                }
                column(InvOnNextPostReq;InvOnNextPostReq)
                {
                }
                column(Sales_Header___VAT_Base_Discount___;"Sales Header"."VAT Base Discount %")
                {
                }
                column(SalesDocumentType;FORMAT("Sales Header"."Document Type",0,2))
                {
                }
                column(BillToAddr_8_;BillToAddr[8])
                {
                }
                column(BillToAddr_7_;BillToAddr[7])
                {
                }
                column(BillToAddr_6_;BillToAddr[6])
                {
                }
                column(BillToAddr_5_;BillToAddr[5])
                {
                }
                column(BillToAddr_4_;BillToAddr[4])
                {
                }
                column(BillToAddr_3_;BillToAddr[3])
                {
                }
                column(BillToAddr_2_;BillToAddr[2])
                {
                }
                column(BillToAddr_1_;BillToAddr[1])
                {
                }
                column(Sales_Header___Bill_to_Customer_No__;"Sales Header"."Bill-to Customer No.")
                {
                }
                column(Sales_Header___Salesperson_Code_;"Sales Header"."Salesperson Code")
                {
                }
                column(Sales_Header___Your_Reference_;"Sales Header"."Your Reference")
                {
                }
                column(Sales_Header___Customer_Posting_Group_;"Sales Header"."Customer Posting Group")
                {
                }
                column(Sales_Header___Posting_Date_;FORMAT("Sales Header"."Posting Date",0,4))
                {
                }
                column(Sales_Header___Document_Date_;FORMAT("Sales Header"."Document Date"))
                {
                }
                column(Sales_Header___Prices_Including_VAT_;"Sales Header"."Prices Including VAT")
                {
                }
                column(SalesHdrPricesIncludingVATFmt;FORMAT("Sales Header"."Prices Including VAT"))
                {
                }
                column(Sales_Header___Payment_Terms_Code_;"Sales Header"."Payment Terms Code")
                {
                }
                column(Sales_Header___Payment_Discount___;"Sales Header"."Payment Discount %")
                {
                }
                column(Sales_Header___Due_Date_;FORMAT("Sales Header"."Due Date"))
                {
                }
                column(Sales_Header___Customer_Disc__Group_;"Sales Header"."Customer Disc. Group")
                {
                }
                column(Sales_Header___Pmt__Discount_Date_;FORMAT("Sales Header"."Pmt. Discount Date"))
                {
                }
                column(Sales_Header___Invoice_Disc__Code_;"Sales Header"."Invoice Disc. Code")
                {
                }
                column(Sales_Header___Shipment_Method_Code_;"Sales Header"."Shipment Method Code")
                {
                }
                column(Sales_Header___Payment_Method_Code_;"Sales Header"."Payment Method Code")
                {
                }
                column(Sales_Header___Customer_Posting_Group__Control104;"Sales Header"."Customer Posting Group")
                {
                }
                column(Sales_Header___Posting_Date__Control105;FORMAT("Sales Header"."Posting Date"))
                {
                }
                column(Sales_Header___Document_Date__Control106;FORMAT("Sales Header"."Document Date"))
                {
                }
                column(Sales_Header___Order_Date_;FORMAT("Sales Header"."Order Date"))
                {
                }
                column(Sales_Header___Shipment_Date_;FORMAT("Sales Header"."Shipment Date"))
                {
                }
                column(Sales_Header___Prices_Including_VAT__Control194;"Sales Header"."Prices Including VAT")
                {
                }
                column(Sales_Header___Payment_Terms_Code__Control18;"Sales Header"."Payment Terms Code")
                {
                }
                column(Sales_Header___Due_Date__Control19;FORMAT("Sales Header"."Due Date"))
                {
                }
                column(Sales_Header___Pmt__Discount_Date__Control22;FORMAT("Sales Header"."Pmt. Discount Date"))
                {
                }
                column(Sales_Header___Payment_Discount____Control23;"Sales Header"."Payment Discount %")
                {
                }
                column(Sales_Header___Payment_Method_Code__Control26;"Sales Header"."Payment Method Code")
                {
                }
                column(Sales_Header___Shipment_Method_Code__Control37;"Sales Header"."Shipment Method Code")
                {
                }
                column(Sales_Header___Customer_Disc__Group__Control100;"Sales Header"."Customer Disc. Group")
                {
                }
                column(Sales_Header___Invoice_Disc__Code__Control102;"Sales Header"."Invoice Disc. Code")
                {
                }
                column(Sales_Header___Customer_Posting_Group__Control130;"Sales Header"."Customer Posting Group")
                {
                }
                column(Sales_Header___Posting_Date__Control131;FORMAT("Sales Header"."Posting Date"))
                {
                }
                column(Sales_Header___Document_Date__Control132;FORMAT("Sales Header"."Document Date"))
                {
                }
                column(Sales_Header___Prices_Including_VAT__Control196;"Sales Header"."Prices Including VAT")
                {
                }
                column(Sales_Header___Applies_to_Doc__Type_;"Sales Header"."Applies-to Doc. Type")
                {
                }
                column(Sales_Header___Applies_to_Doc__No__;"Sales Header"."Applies-to Doc. No.")
                {
                }
                column(Sales_Header___Customer_Posting_Group__Control136;"Sales Header"."Customer Posting Group")
                {
                }
                column(Sales_Header___Posting_Date__Control137;FORMAT("Sales Header"."Posting Date"))
                {
                }
                column(Sales_Header___Document_Date__Control138;FORMAT("Sales Header"."Document Date"))
                {
                }
                column(Sales_Header___Prices_Including_VAT__Control198;"Sales Header"."Prices Including VAT")
                {
                }
                column(PageCounter_Number;Number)
                {
                }
                column(Sales_Document___TestCaption;Sales_Document___TestCaptionLbl)
                {
                }
                column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
                {
                }
                column(Sales_Header___Sell_to_Customer_No__Caption;"Sales Header".FIELDCAPTION("Sell-to Customer No."))
                {
                }
                column(Ship_toCaption;Ship_toCaptionLbl)
                {
                }
                column(Sell_toCaption;Sell_toCaptionLbl)
                {
                }
                column(Sales_Header___Ship_to_Code_Caption;"Sales Header".FIELDCAPTION("Ship-to Code"))
                {
                }
                column(Bill_toCaption;Bill_toCaptionLbl)
                {
                }
                column(Sales_Header___Bill_to_Customer_No__Caption;"Sales Header".FIELDCAPTION("Bill-to Customer No."))
                {
                }
                column(Sales_Header___Salesperson_Code_Caption;"Sales Header".FIELDCAPTION("Salesperson Code"))
                {
                }
                column(Sales_Header___Your_Reference_Caption;"Sales Header".FIELDCAPTION("Your Reference"))
                {
                }
                column(Sales_Header___Customer_Posting_Group_Caption;"Sales Header".FIELDCAPTION("Customer Posting Group"))
                {
                }
                column(Sales_Header___Posting_Date_Caption;Sales_Header___Posting_Date_CaptionLbl)
                {
                }
                column(Sales_Header___Document_Date_Caption;Sales_Header___Document_Date_CaptionLbl)
                {
                }
                column(Sales_Header___Prices_Including_VAT_Caption;"Sales Header".FIELDCAPTION("Prices Including VAT"))
                {
                }
                column(Sales_Header___Payment_Terms_Code_Caption;"Sales Header".FIELDCAPTION("Payment Terms Code"))
                {
                }
                column(Sales_Header___Payment_Discount___Caption;"Sales Header".FIELDCAPTION("Payment Discount %"))
                {
                }
                column(Sales_Header___Due_Date_Caption;Sales_Header___Due_Date_CaptionLbl)
                {
                }
                column(Sales_Header___Customer_Disc__Group_Caption;"Sales Header".FIELDCAPTION("Customer Disc. Group"))
                {
                }
                column(Sales_Header___Pmt__Discount_Date_Caption;Sales_Header___Pmt__Discount_Date_CaptionLbl)
                {
                }
                column(Sales_Header___Invoice_Disc__Code_Caption;"Sales Header".FIELDCAPTION("Invoice Disc. Code"))
                {
                }
                column(Sales_Header___Shipment_Method_Code_Caption;"Sales Header".FIELDCAPTION("Shipment Method Code"))
                {
                }
                column(Sales_Header___Payment_Method_Code_Caption;"Sales Header".FIELDCAPTION("Payment Method Code"))
                {
                }
                column(Sales_Header___Customer_Posting_Group__Control104Caption;"Sales Header".FIELDCAPTION("Customer Posting Group"))
                {
                }
                column(Sales_Header___Posting_Date__Control105Caption;Sales_Header___Posting_Date__Control105CaptionLbl)
                {
                }
                column(Sales_Header___Document_Date__Control106Caption;Sales_Header___Document_Date__Control106CaptionLbl)
                {
                }
                column(Sales_Header___Order_Date_Caption;Sales_Header___Order_Date_CaptionLbl)
                {
                }
                column(Sales_Header___Shipment_Date_Caption;Sales_Header___Shipment_Date_CaptionLbl)
                {
                }
                column(Sales_Header___Prices_Including_VAT__Control194Caption;"Sales Header".FIELDCAPTION("Prices Including VAT"))
                {
                }
                column(Sales_Header___Payment_Terms_Code__Control18Caption;"Sales Header".FIELDCAPTION("Payment Terms Code"))
                {
                }
                column(Sales_Header___Payment_Discount____Control23Caption;"Sales Header".FIELDCAPTION("Payment Discount %"))
                {
                }
                column(Sales_Header___Due_Date__Control19Caption;Sales_Header___Due_Date__Control19CaptionLbl)
                {
                }
                column(Sales_Header___Pmt__Discount_Date__Control22Caption;Sales_Header___Pmt__Discount_Date__Control22CaptionLbl)
                {
                }
                column(Sales_Header___Shipment_Method_Code__Control37Caption;"Sales Header".FIELDCAPTION("Shipment Method Code"))
                {
                }
                column(Sales_Header___Payment_Method_Code__Control26Caption;"Sales Header".FIELDCAPTION("Payment Method Code"))
                {
                }
                column(Sales_Header___Customer_Disc__Group__Control100Caption;"Sales Header".FIELDCAPTION("Customer Disc. Group"))
                {
                }
                column(Sales_Header___Invoice_Disc__Code__Control102Caption;"Sales Header".FIELDCAPTION("Invoice Disc. Code"))
                {
                }
                column(Sales_Header___Customer_Posting_Group__Control130Caption;"Sales Header".FIELDCAPTION("Customer Posting Group"))
                {
                }
                column(Sales_Header___Posting_Date__Control131Caption;Sales_Header___Posting_Date__Control131CaptionLbl)
                {
                }
                column(Sales_Header___Document_Date__Control132Caption;Sales_Header___Document_Date__Control132CaptionLbl)
                {
                }
                column(Sales_Header___Prices_Including_VAT__Control196Caption;"Sales Header".FIELDCAPTION("Prices Including VAT"))
                {
                }
                column(Sales_Header___Applies_to_Doc__Type_Caption;"Sales Header".FIELDCAPTION("Applies-to Doc. Type"))
                {
                }
                column(Sales_Header___Applies_to_Doc__No__Caption;"Sales Header".FIELDCAPTION("Applies-to Doc. No."))
                {
                }
                column(Sales_Header___Customer_Posting_Group__Control136Caption;"Sales Header".FIELDCAPTION("Customer Posting Group"))
                {
                }
                column(Sales_Header___Posting_Date__Control137Caption;Sales_Header___Posting_Date__Control137CaptionLbl)
                {
                }
                column(Sales_Header___Document_Date__Control138Caption;Sales_Header___Document_Date__Control138CaptionLbl)
                {
                }
                column(Sales_Header___Prices_Including_VAT__Control198Caption;"Sales Header".FIELDCAPTION("Prices Including VAT"))
                {
                }
                dataitem(DimensionLoop1;"Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number=FILTER(1..));
                    column(DimText;DimText)
                    {
                    }
                    column(DimensionLoop1_Number;DimensionLoop1.Number)
                    {
                    }
                    column(DimText_Control162;DimText)
                    {
                    }
                    column(Header_DimensionsCaption;Header_DimensionsCaptionLbl)
                    {
                    }

                    trigger OnAfterGetRecord();
                    begin
                        IF Number = 1 THEN BEGIN
                          IF NOT DimSetEntry1.FINDSET THEN
                            CurrReport.BREAK;
                        END ELSE
                          IF NOT Continue THEN
                            CurrReport.BREAK;

                        DimText := '';
                        Continue := FALSE;
                        REPEAT
                          OldDimText := DimText;
                          IF DimText = '' THEN
                            DimText := STRSUBSTNO('%1 - %2',DimSetEntry1."Dimension Code",DimSetEntry1."Dimension Value Code")
                          ELSE
                            DimText :=
                              STRSUBSTNO(
                                '%1; %2 - %3',DimText,DimSetEntry1."Dimension Code",DimSetEntry1."Dimension Value Code");
                          IF STRLEN(DimText) > MAXSTRLEN(OldDimText) THEN BEGIN
                            DimText := OldDimText;
                            Continue := TRUE;
                            EXIT;
                          END;
                        UNTIL DimSetEntry1.NEXT = 0;
                    end;

                    trigger OnPreDataItem();
                    begin
                        IF NOT ShowDim THEN
                          CurrReport.BREAK;
                    end;
                }
                dataitem(HeaderErrorCounter;"Integer")
                {
                    DataItemTableView = SORTING(Number);
                    column(ErrorText_Number_;ErrorText[Number])
                    {
                    }
                    column(HeaderErrorCounter_Number;Number)
                    {
                    }
                    column(ErrorText_Number_Caption;ErrorText_Number_CaptionLbl)
                    {
                    }

                    trigger OnPostDataItem();
                    begin
                        ErrorCounter := 0;
                    end;

                    trigger OnPreDataItem();
                    begin
                        SETRANGE(Number,1,ErrorCounter);
                    end;
                }
                dataitem(CopyLoop;"Integer")
                {
                    DataItemTableView = SORTING(Number);
                    MaxIteration = 1;
                    column(Copy_Loop_Number;Number)
                    {
                    }
                    dataitem("Sales Line";"Sales Line")
                    {
                        DataItemLink = Document Type=FIELD(Document Type),Document No.=FIELD(No.);
                        DataItemLinkReference = "Sales Header";
                        DataItemTableView = SORTING(Document Type,Document No.,Line No.);
                        column(Sales_Line_Document_Type;"Document Type")
                        {
                        }
                        column(Sales_Line_Document_No_;"Document No.")
                        {
                        }
                        column(Sales_Line_Line_No_;"Line No.")
                        {
                        }

                        trigger OnAfterGetRecord();
                        begin
                            IF "Qty. to Ship">0 THEN BEGIN
                              //Dutycap:='Excise(8.24%)';
                              Dutycap:='Excise'+FORMAT(SalesLine."Excise Effective Rate");
                              //dutyper:=FORMAT("Sales Line"."BED %"); bed need to gather from excise posting group
                            END;
                        end;

                        trigger OnPreDataItem();
                        begin
                            s:=0;
                            IF FIND('+') THEN
                              OrigMaxLineNo := "Line No.";
                            CurrReport.BREAK;
                        end;
                    }
                    dataitem(RoundLoop;"Integer")
                    {
                        DataItemTableView = SORTING(Number);
                        column(SalesLineTaxAmt;SalesLineTaxAmt)
                        {
                        }
                        column(ExciseVar;ExciseVar)
                        {
                        }
                        column(SumSalesLineExciseAmount;SumSalesLineExciseAmount)
                        {
                        }
                        column(LineAmountVar;ROUND(LineAmountVar,1))
                        {
                        }
                        column(Round_Loop_Sales_Line___Line_Amount_;ROUND("Sales Line"."Line Amount",1))
                        {
                            AutoFormatExpression = "Sales Line"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(C_form;C_form_Lbl)
                        {
                        }
                        column(NOTE;NOTE_Lbl)
                        {
                        }
                        column(Note1;Note1_Lbl)
                        {
                        }
                        column(Note2;Note2_Lbl)
                        {
                        }
                        column(Round_Loop_Round_Loop_Number;Number)
                        {
                        }
                        column(ROUND_TempSalesLine__Line_Amount__1_;TempSalesLine."Line Amount")
                        {
                        }
                        column(Round_Loop_n;n)
                        {
                        }
                        column(QtyToHandleCaption;QtyToHandleCaption)
                        {
                        }
                        column(Sales_Line__Type;"Sales Line".Type)
                        {
                        }
                        column(Sales_Line___No__;"Sales Line"."No.")
                        {
                        }
                        column(Round_Loop_Sales_Line__Description;"Sales Line".Description)
                        {
                        }
                        column(Sales_Line__Quantity;"Sales Line".Quantity)
                        {
                        }
                        column(QtyToHandle;QtyToHandle)
                        {
                            DecimalPlaces = 0:5;
                        }
                        column(Sales_Line___Qty__to_Invoice_;"Sales Line"."Qty. to Invoice")
                        {
                        }
                        column(Round_Loop_Sales_Line___Unit_Price_;"Sales Line"."Unit Price")
                        {
                            AutoFormatExpression = "Sales Line"."Currency Code";
                            AutoFormatType = 2;
                        }
                        column(Round_Loop_TempSalesLine_Qty_to_Ship;TempSalesLine."Qty. to Ship")
                        {
                        }
                        column(Round_Loop_SubtotalCaption;SubtotalCaptionLbl)
                        {
                        }
                        column(Round_Loop_Dutycap;Dutycap)
                        {
                        }
                        column(Round_Loop_taxcap;taxcap)
                        {
                        }
                        column(Round_Loop_desc;desc)
                        {
                        }
                        column(Round_Loop_vatcap;vatcap)
                        {
                        }
                        column(Round_Loop_RDSO_ChargesCaption;RDSO_ChargesCaptionLbl)
                        {
                        }
                        column(Round_Loop_AdvanceCaption;AdvanceCaptionLbl)
                        {
                        }
                        column(Round_Loop_dutyper;dutyper)
                        {
                        }
                        column(Round_Loop_s1;s1)
                        {
                        }
                        column(Round_Loop_s2;s2)
                        {
                        }
                        column(Round_Loop_TempSalesLine_ExciseAmount_TempSalesLine_ServiceTaxAmount;ROUND(TempSalesLine."Excise Amount",1)+ROUND(TempSalesLine."Service Tax Amount",1))
                        {
                        }
                        column(Round_Loop_TempSalesLine_ServiceTaxeCessAmountTempSalesLine_TaxAmount_TempSalesLine_ServiceTaxeCessAmount;ROUND(TempSalesLine."Service Tax eCess Amount",1)+ROUND(TempSalesLine."Tax Amount",1)+ROUND(TempSalesLine."Service Tax eCess Amount"/2,1))
                        {
                        }
                        column(Sales_Line___Line_Discount___;"Sales Line"."Line Discount %")
                        {
                        }
                        column(Round_Loop_TempSalesLine_RDSOCharges;ROUND(TempSalesLine."RDSO Charges",1))
                        {
                        }
                        column(Round_Loop_advance;advance)
                        {
                        }
                        column(Round_Loop_s_advance;ROUND(s-advance,1))
                        {
                        }
                        column(Round_Loop_Grand_TotalCaption;Grand_TotalCaptionLbl)
                        {
                        }
                        column(Round_Loop_In_words_Caption;In_words_CaptionLbl)
                        {
                        }
                        column(Round_Loop_DescriptionLine_1;DescriptionLine[1])
                        {
                        }
                        column(Round_Loop_for_EFFTRONICS_SYSTEMS_PVT__LTD__Caption;for_EFFTRONICS_SYSTEMS_PVT__LTD__CaptionLbl)
                        {
                        }
                        column(Round_Loop_AUTHORISED_SIGNATORYCaption;AUTHORISED_SIGNATORYCaptionLbl)
                        {
                        }
                        column(Round_Loop_NOTE;NOTE_Lbl)
                        {
                        }
                        column(Sales_Line___Allow_Invoice_Disc__;"Sales Line"."Allow Invoice Disc.")
                        {
                        }
                        column(Sales_Line___Line_Discount_Amount_;"Sales Line"."Line Discount Amount")
                        {
                        }
                        column(SalesLineAllowInvoiceDiscFmt;FORMAT("Sales Line"."Allow Invoice Disc."))
                        {
                        }
                        column(RoundLoop_RoundLoop_Number;RoundLoop.Number)
                        {
                        }
                        column(Sales_Line___Inv__Discount_Amount_;"Sales Line"."Inv. Discount Amount")
                        {
                        }
                        column(TempSalesLine__Inv__Discount_Amount_;-TempSalesLine."Inv. Discount Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TempSalesLine__Line_Amount_;TempSalesLine."Line Amount")
                        {
                            AutoFormatExpression = "Sales Line"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(SumLineAmount;SumLineAmount)
                        {
                        }
                        column(SumInvDiscountAmount;SumInvDiscountAmount)
                        {
                        }
                        column(TotalText;TotalText)
                        {
                        }
                        column(TempSalesLine__Line_Amount_____Sales_Line___Inv__Discount_Amount_;TempSalesLine."Line Amount" - TempSalesLine."Inv. Discount Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmount;VATAmount)
                        {
                        }
                        column(TempSalesLine__Excise_Amount_;TempSalesLine."Excise Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TempSalesLine__Tax_Amount_;TempSalesLine."Tax Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(ServiceTaxAmt;ServiceTaxAmt)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(ChargesAmount;ChargesAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(OtherTaxesAmount;OtherTaxesAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(ServiceTaxECessAmt;ServiceTaxECessAmt)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(SalesLine__Total_TDS_TCS_Incl__SHE_CESS_;TempSalesLine."Total TDS/TCS Incl. SHE CESS")
                        {
                        }
                        column(TCSAmountApplied;TCSAmountApplied)
                        {
                        }
                        column(AppliedServiceTaxAmt;AppliedServiceTaxAmt)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(AppliedServiceTaxECessAmt;AppliedServiceTaxECessAmt)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(ServiceTaxSHECessAmt;ServiceTaxSHECessAmt)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(AppliedServiceTaxSHECessAmt;AppliedServiceTaxSHECessAmt)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalInclVATText_Control1500007;TotalInclVATText)
                        {
                        }
                        column(TotalAmount;TotalAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(SumSalesLineTaxAmount;SumSalesLineTaxAmount)
                        {
                        }
                        column(SumLineServiceTaxAmount;SumLineServiceTaxAmount)
                        {
                        }
                        column(SumLineServiceTaxECessAmount;SumLineServiceTaxECessAmount)
                        {
                        }
                        column(SumLineServiceTaxSHECessAmount;SumLineServiceTaxSHECessAmount)
                        {
                        }
                        column(SumSalesLineAmountToCusTomer;SumSalesLineAmountToCusTomer)
                        {
                        }
                        column(SumTotalTDSTCSInclSHECESS;SumTotalTDSTCSInclSHECESS)
                        {
                        }
                        column(VATDiscountAmount;-VATDiscountAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalInclVATText_Control191;TotalInclVATText)
                        {
                        }
                        column(VATAmountLine_VATAmountText_Control189;VATAmountLine.VATAmountText)
                        {
                        }
                        column(VATBaseAmount___VATAmount;VATBaseAmount + VATAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmount_Control188;VATAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalExclVATText_Control186;TotalExclVATText)
                        {
                        }
                        column(VATBaseAmount;VATBaseAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(Sales_Line___No__Caption;"Sales Line".FIELDCAPTION("No."))
                        {
                        }
                        column(Sales_Line__DescriptionCaption;"Sales Line".FIELDCAPTION(Description))
                        {
                        }
                        column(Sales_Line___Qty__to_Invoice_Caption;"Sales Line".FIELDCAPTION("Qty. to Invoice"))
                        {
                        }
                        column(Unit_PriceCaption;Unit_PriceCaptionLbl)
                        {
                        }
                        column(Sales_Line___Line_Discount___Caption;Sales_Line___Line_Discount___CaptionLbl)
                        {
                        }
                        column(Sales_Line___Allow_Invoice_Disc__Caption;"Sales Line".FIELDCAPTION("Allow Invoice Disc."))
                        {
                        }
                        column(Sales_Line___Line_Discount_Amount_Caption;Sales_Line___Line_Discount_Amount_CaptionLbl)
                        {
                        }
                        column(AmountCaption;AmountCaptionLbl)
                        {
                        }
                        column(Sales_Line__TypeCaption;"Sales Line".FIELDCAPTION(Type))
                        {
                        }
                        column(Sales_Line__QuantityCaption;"Sales Line".FIELDCAPTION(Quantity))
                        {
                        }
                        column(TempSalesLine__Inv__Discount_Amount_Caption;TempSalesLine__Inv__Discount_Amount_CaptionLbl)
                        {
                        }
                        column(SubtotalCaption;SubtotalCaptionLbl)
                        {
                        }
                        column(TempSalesLine__Excise_Amount_Caption;TempSalesLine__Excise_Amount_CaptionLbl)
                        {
                        }
                        column(TempSalesLine__Tax_Amount_Caption;TempSalesLine__Tax_Amount_CaptionLbl)
                        {
                        }
                        column(ServiceTaxAmtCaption;ServiceTaxAmtCaptionLbl)
                        {
                        }
                        column(Charges_AmountCaption;Charges_AmountCaptionLbl)
                        {
                        }
                        column(Other_Taxes_AmountCaption;Other_Taxes_AmountCaptionLbl)
                        {
                        }
                        column(ServiceTaxECessAmtCaption;ServiceTaxECessAmtCaptionLbl)
                        {
                        }
                        column(TCS_AmountCaption;TCS_AmountCaptionLbl)
                        {
                        }
                        column(TCS_Amount__Applied_Caption;TCS_Amount__Applied_CaptionLbl)
                        {
                        }
                        column(Svc_Tax_Amt__Applied_Caption;Svc_Tax_Amt__Applied_CaptionLbl)
                        {
                        }
                        column(Svc_Tax_eCess_Amt__Applied_Caption;Svc_Tax_eCess_Amt__Applied_CaptionLbl)
                        {
                        }
                        column(ServiceTaxSHECessAmtCaption;ServiceTaxSHECessAmtCaptionLbl)
                        {
                        }
                        column(Svc_Tax_SHECess_Amt_Applied_Caption;Svc_Tax_SHECess_Amt_Applied_CaptionLbl)
                        {
                        }
                        column(VATDiscountAmountCaption;VATDiscountAmountCaptionLbl)
                        {
                        }
                        column(ServiceTaxSBCAmt;ServiceTaxSBCAmt)
                        {
                        }
                        column(AppliedServiceTaxSBCAmt;AppliedServiceTaxSBCAmt)
                        {
                        }
                        column(SumSvcTaxSBCAmount;SumSvcTaxSBCAmount)
                        {
                        }
                        column(ServiceTaxSBCAmtCaption;ServiceTaxSBCAmtCaptionLbl)
                        {
                        }
                        column(Svc_Tax_SBC_Amt__Applied_Caption;Svc_Tax_SBC_Amt__Applied_CaptionLbl)
                        {
                        }
                        column(KKCessAmt;KKCessAmt)
                        {
                        }
                        column(AppliedKKCessAmt;AppliedKKCessAmt)
                        {
                        }
                        column(SumKKCessAmount;SumKKCessAmount)
                        {
                        }
                        column(KKCessAmtCaption;KKCessAmtCaptionLbl)
                        {
                        }
                        column(KK_Cess_Amt__Applied_Caption;KK_Cess_Amt__Applied_CaptionLbl)
                        {
                        }
                        dataitem(DimensionLoop2;"Integer")
                        {
                            DataItemTableView = SORTING(Number) WHERE(Number=FILTER(1..));
                            column(DimText_Control159;DimText)
                            {
                            }
                            column(DimensionLoop2_Number;DimensionLoop2.Number)
                            {
                            }
                            column(DimText_Control161;DimText)
                            {
                            }
                            column(Line_DimensionsCaption;Line_DimensionsCaptionLbl)
                            {
                            }

                            trigger OnAfterGetRecord();
                            begin
                                IF Number = 1 THEN BEGIN
                                  IF NOT DimSetEntry2.FINDSET THEN
                                    CurrReport.BREAK;
                                END ELSE
                                  IF NOT Continue THEN
                                    CurrReport.BREAK;

                                DimText := '';
                                Continue := FALSE;
                                REPEAT
                                  OldDimText := DimText;
                                  IF DimText = '' THEN
                                    DimText := STRSUBSTNO('%1 - %2',DimSetEntry2."Dimension Code",DimSetEntry2."Dimension Value Code")
                                  ELSE
                                    DimText :=
                                      STRSUBSTNO(
                                        '%1; %2 - %3',DimText,DimSetEntry2."Dimension Code",DimSetEntry2."Dimension Value Code");
                                  IF STRLEN(DimText) > MAXSTRLEN(OldDimText) THEN BEGIN
                                    DimText := OldDimText;
                                    Continue := TRUE;
                                    EXIT;
                                  END;
                                UNTIL DimSetEntry2.NEXT = 0;
                            end;

                            trigger OnPostDataItem();
                            begin
                                SumLineAmount := SumLineAmount + TempSalesLine."Line Amount";
                                SumInvDiscountAmount := SumInvDiscountAmount + TempSalesLine."Inv. Discount Amount";

                                //IN0090.BEGIN
                                SumSalesLineExciseAmount:=SumSalesLineExciseAmount + TempSalesLine."Excise Amount";
                                SumSalesLineTaxAmount:=SumSalesLineTaxAmount + TempSalesLine."Tax Amount";
                                SumLineServiceTaxAmount:=SumLineServiceTaxAmount + TempSalesLine."Service Tax Amount";
                                SumLineServiceTaxECessAmount:=SumLineServiceTaxECessAmount + TempSalesLine."Service Tax eCess Amount";
                                SumLineServiceTaxSHECessAmount:=SumLineServiceTaxSHECessAmount + TempSalesLine."Service Tax SHE Cess Amount";
                                SumTotalTDSTCSInclSHECESS:=SumTotalTDSTCSInclSHECESS + TempSalesLine."Total TDS/TCS Incl. SHE CESS";
                                SumSvcTaxSBCAmount:=SumSvcTaxSBCAmount + TempSalesLine."Service Tax SBC Amount";
                                SumKKCessAmount:=SumKKCessAmount + TempSalesLine."KK Cess Amount";
                                SumSalesLineAmountToCusTomer:=SumSalesLineAmountToCusTomer + TempSalesLine."Amount To Customer";
                                TotalAmount :=  SumLineAmount - SumInvDiscountAmount +SumSalesLineExciseAmount
                                  + SumSalesLineTaxAmount+ ServiceTaxAmt + ServiceTaxECessAmt + ServiceTaxSHECessAmt + OtherTaxesAmount
                                  + ChargesAmount + SumTotalTDSTCSInclSHECESS + AppliedServiceTaxAmt + AppliedServiceTaxECessAmt
                                  + AppliedServiceTaxSHECessAmt
                                  + ServiceTaxSBCAmt + AppliedServiceTaxSBCAmt
                                                                  + KKCessAmt + AppliedKKCessAmt;
                                //IN0090.END
                            end;

                            trigger OnPreDataItem();
                            begin
                                IF NOT ShowDim THEN
                                  CurrReport.BREAK;
                            end;
                        }
                        dataitem(LineErrorCounter;"Integer")
                        {
                            DataItemTableView = SORTING(Number);
                            column(ErrorText_Number__Control97;ErrorText[Number])
                            {
                            }
                            column(LineErrorCounter_Number;Number)
                            {
                            }
                            column(ErrorText_Number__Control97Caption;ErrorText_Number__Control97CaptionLbl)
                            {
                            }

                            trigger OnPostDataItem();
                            begin
                                ErrorCounter := 0;
                            end;

                            trigger OnPreDataItem();
                            begin
                                SETRANGE(Number,1,ErrorCounter);
                            end;
                        }

                        trigger OnAfterGetRecord();
                        var
                            TableID : array [10] of Integer;
                            No : array [10] of Code[20];
                        begin
                            
                            IF Number = 1 THEN
                              TempSalesLine.FIND('-')
                            ELSE
                              TempSalesLine.NEXT;
                            "Sales Line" := TempSalesLine;
                            
                            
                            WITH "Sales Line" DO BEGIN
                              IF NOT "Sales Header"."Prices Including VAT" AND
                                 ("VAT Calculation Type" = "VAT Calculation Type"::"Full VAT")
                              THEN
                                TempSalesLine."Line Amount" := 0;
                            
                              DimSetEntry2.SETRANGE("Dimension Set ID","Dimension Set ID");
                              // PS39773.begin
                              FilterAppliedEntries;
                              //IF "Sales Header"."Transaction No. Serv. Tax" <> 0 THEN BEGIN
                              //  ServiceTaxEntry.RESET;
                              //  ServiceTaxEntry.SETCURRENTKEY("Transaction No.");
                              //  ServiceTaxEntry.SETRANGE("Transaction No.","Sales Header"."Transaction No. Serv. Tax");
                              //  IF ServiceTaxEntry.FINDFIRST THEN BEGIN
                              //    IF (ServiceTaxEntry."Service Tax Group Code" <> "Service Tax Group") THEN
                              //      AddError(Text16503);
                              //    IF (ServiceTaxEntry."Service Tax Registration No." <> "Service Tax Registration No.") THEN
                              //      AddError(Text16502);
                              //
                              //    IF "Sales Header"."Currency Code" <> '' THEN BEGIN
                              //     ServiceTaxEntry."Remaining Serv. Tax Amt" :=
                              //       ROUND(CurrExchRate.ExchangeAmtLCYToFCY(
                              //         "Sales Header"."Posting Date","Sales Header"."Currency Code",
                              //         ServiceTaxEntry."Remaining Serv. Tax Amt","Sales Header"."Currency Factor"));
                              //     ServiceTaxEntry."Remaining Serv. Tax eCess Amt" :=
                              //       ROUND(CurrExchRate.ExchangeAmtLCYToFCY(
                              //         "Sales Header"."Posting Date","Sales Header"."Currency Code",
                              //         ServiceTaxEntry."Remaining Serv. Tax eCess Amt","Sales Header"."Currency Factor"));
                              //     ServiceTaxEntry."Remaining Serv Tax SHECess Amt" :=
                              //       ROUND(CurrExchRate.ExchangeAmtLCYToFCY(
                              //         "Sales Header"."Posting Date","Sales Header"."Currency Code",
                              //         ServiceTaxEntry."Remaining Serv Tax SHECess Amt","Sales Header"."Currency Factor"));
                              //    END;
                              //    //IF ABS(ServiceTaxEntry."Remaining Serv. Tax Amt") <= TempSalesLine."Service Tax Amount" THEN BEGIN
                              //    //  ServiceTaxAmt := ABS(TempSalesLine."Service Tax Amount" - ABS(ServiceTaxEntry."Remaining Serv. Tax Amt"));
                              //    //  ServiceTaxECessAmt := ABS(TempSalesLine."Service Tax eCess Amount" -
                              //    //    ABS(ServiceTaxEntry."Remaining Serv. Tax eCess Amt"));
                              //    //  ServiceTaxSHECessAmt := ABS(TempSalesLine."Service Tax SHE Cess Amount" -
                              //    //    ABS(ServiceTaxEntry."Remaining Serv Tax SHECess Amt"));
                              //    //  AppliedServiceTaxAmt := ABS(ServiceTaxEntry."Remaining Serv. Tax Amt");
                              //    //  AppliedServiceTaxECessAmt := ABS(ServiceTaxEntry."Remaining Serv. Tax eCess Amt");
                              //    //  AppliedServiceTaxSHECessAmt := ABS(ServiceTaxEntry."Remaining Serv Tax SHECess Amt");
                              //    //END ELSE BEGIN
                              //    //  AppliedServiceTaxAmt := TempSalesLine."Service Tax Amount";
                              //    //  AppliedServiceTaxECessAmt := TempSalesLine."Service Tax eCess Amount";
                              //    //  AppliedServiceTaxSHECessAmt := TempSalesLine."Service Tax SHE Cess Amount";
                              //    //END;
                              //    NetTotal := TempSalesLine."Amount To Customer" - TempSalesLine."Service Tax Amount" -
                              //      TempSalesLine."Service Tax eCess Amount" - TempSalesLine."Service Tax SHE Cess Amount" +
                              //      ServiceTaxAmt + ServiceTaxECessAmt + ServiceTaxSHECessAmt + AppliedServiceTaxAmt +
                              //      AppliedServiceTaxECessAmt + AppliedServiceTaxSHECessAmt;
                              //  END;
                                  //END;
                              //END ELSE BEGIN
                              //  ServiceTaxAmt := TempSalesLine."Service Tax Amount";
                              //  ServiceTaxECessAmt := TempSalesLine."Service Tax eCess Amount";
                              //  ServiceTaxSHECessAmt := TempSalesLine."Service Tax SHE Cess Amount";
                              //  NetTotal := TempSalesLine."Amount To Customer";
                              //END;
                              // PS39773.end
                            
                              IF (NOT "Sales Header".Trading) AND ("CIF Amount" + "BCD Amount" = 0) AND CVD THEN
                                AddError(Text16504);
                            
                              IF "Document Type" IN ["Document Type"::"Return Order","Document Type"::"Credit Memo"]
                              THEN BEGIN
                                IF "Document Type" = "Document Type"::"Credit Memo" THEN BEGIN
                                  IF ("Return Qty. to Receive" <> Quantity) AND ("Return Receipt No." = '') THEN
                                    AddError(STRSUBSTNO(Text015,FIELDCAPTION("Return Qty. to Receive"),Quantity));
                                  IF "Qty. to Invoice" <> Quantity THEN
                                    AddError(STRSUBSTNO(Text015,FIELDCAPTION("Qty. to Invoice"),Quantity));
                                END;
                                IF "Qty. to Ship" <> 0 THEN
                                  AddError(STRSUBSTNO(Text043,FIELDCAPTION("Qty. to Ship")));
                              END ELSE BEGIN
                                IF "Document Type" = "Document Type"::Invoice THEN BEGIN
                                  IF ("Qty. to Ship" <> Quantity) AND ("Shipment No." = '') THEN
                                    AddError(STRSUBSTNO(Text015,FIELDCAPTION("Qty. to Ship"),Quantity));
                                  IF "Qty. to Invoice" <> Quantity THEN
                                    AddError(STRSUBSTNO(Text015,FIELDCAPTION("Qty. to Invoice"),Quantity));
                                END;
                                IF "Return Qty. to Receive" <> 0 THEN
                                  AddError(STRSUBSTNO(Text043,FIELDCAPTION("Return Qty. to Receive")));
                              END;
                            
                              IF NOT "Sales Header".Ship THEN
                                "Qty. to Ship" := 0;
                              IF NOT "Sales Header".Receive THEN
                                "Return Qty. to Receive" := 0;
                            
                              IF ("Document Type" = "Document Type"::Invoice) AND ("Shipment No." <> '') THEN BEGIN
                                "Quantity Shipped" := Quantity;
                                "Qty. to Ship" := 0;
                              END;
                            
                              IF ("Document Type" = "Document Type"::"Credit Memo") AND ("Return Receipt No." <> '') THEN BEGIN
                                "Return Qty. Received" := Quantity;
                                "Return Qty. to Receive" := 0;
                              END;
                            
                              IF "Sales Header".Invoice THEN BEGIN
                                IF "Document Type" IN ["Document Type"::"Return Order","Document Type"::"Credit Memo"] THEN
                                  MaxQtyToBeInvoiced := "Return Qty. to Receive" + "Return Qty. Received" - "Quantity Invoiced"
                                ELSE
                                  MaxQtyToBeInvoiced := "Qty. to Ship" + "Quantity Shipped" - "Quantity Invoiced";
                                IF ABS("Qty. to Invoice") > ABS(MaxQtyToBeInvoiced) THEN
                                  "Qty. to Invoice" := MaxQtyToBeInvoiced;
                              END ELSE
                                "Qty. to Invoice" := 0;
                            
                              IF "Gen. Prod. Posting Group" <> '' THEN BEGIN
                                IF ("Sales Header"."Document Type" IN
                                     ["Sales Header"."Document Type"::"Return Order",
                                      "Sales Header"."Document Type"::"Credit Memo"]) AND
                                   ("Sales Header"."Applies-to Doc. Type" = "Sales Header"."Applies-to Doc. Type"::Invoice) AND
                                   ("Sales Header"."Applies-to Doc. No." <> '')
                                THEN BEGIN
                                  CustLedgEntry.SETCURRENTKEY("Document No.","Document Type","Customer No.");
                                  CustLedgEntry.SETRANGE("Customer No.","Sales Header"."Bill-to Customer No.");
                                  CustLedgEntry.SETRANGE("Document Type",CustLedgEntry."Document Type"::Invoice);
                                  CustLedgEntry.SETRANGE("Document No.","Sales Header"."Applies-to Doc. No.");
                                  IF (NOT CustLedgEntry.FIND('+')) AND (NOT ApplNoError) THEN BEGIN
                                    ApplNoError := TRUE;
                                    AddError(
                                      STRSUBSTNO(
                                        Text016,
                                        "Sales Header".FIELDCAPTION("Applies-to Doc. No."),"Sales Header"."Applies-to Doc. No."));
                                  END;
                                  VATDate := CustLedgEntry."Posting Date";
                                END ELSE
                                  VATDate := "Sales Header"."Posting Date";
                            
                            /*
                                IF NOT VATPostingSetup.GET("VAT Bus. Posting Group","VAT Prod. Posting Group") THEN
                                  AddError(
                                    STRSUBSTNO(
                                      Text017,
                                      VATPostingSetup.TABLECAPTION,"VAT Bus. Posting Group","VAT Prod. Posting Group"));
                                IF VATPostingSetup."VAT Calculation Type" = VATPostingSetup."VAT Calculation Type"::"Reverse Charge VAT" THEN
                                  IF ("Sales Header"."VAT Registration No." = '') AND (NOT VATNoError) THEN BEGIN
                                    VATNoError := TRUE;
                                    AddError(
                                      STRSUBSTNO(
                                        Text035,"Sales Header".FIELDCAPTION("VAT Registration No.")));
                                  END;
                            */
                              END;
                            
                              IF Quantity <> 0 THEN BEGIN
                                IF "No." = '' THEN
                                  AddError(STRSUBSTNO(Text019,Type,FIELDCAPTION("No.")));
                                IF Type = 0 THEN
                                  AddError(STRSUBSTNO(Text006,FIELDCAPTION(Type)));
                              END ELSE
                                IF Amount <> 0 THEN
                                  AddError(
                                    STRSUBSTNO(Text020,FIELDCAPTION(Amount),FIELDCAPTION(Quantity)));
                            
                              IF "Drop Shipment" THEN BEGIN
                                IF Type <> Type::Item THEN
                                  AddError(Text021);
                                IF ("Qty. to Ship" <> 0) AND ("Purch. Order Line No." = 0) THEN BEGIN
                                  AddError(STRSUBSTNO(Text022,"Line No."));
                                  AddError(Text023);
                                END;
                              END;
                            
                              SalesLine := "Sales Line";
                              IF NOT ("Document Type" IN
                                       ["Document Type"::"Return Order","Document Type"::"Credit Memo"]) THEN BEGIN
                                SalesLine."Qty. to Ship" := -SalesLine."Qty. to Ship";
                                SalesLine."Qty. to Invoice" := -SalesLine."Qty. to Invoice";
                              END;
                            
                              RemQtyToBeInvoiced := SalesLine."Qty. to Invoice";
                            
                              CASE "Document Type" OF
                                "Document Type"::"Return Order","Document Type"::"Credit Memo":
                                  CheckRcptLines("Sales Line");
                                "Document Type"::Order,"Document Type"::Invoice:
                                  CheckShptLines("Sales Line");
                              END;
                            
                              IF (Type >= Type::"G/L Account") AND ("Qty. to Invoice" <> 0) THEN BEGIN
                                IF NOT GenPostingSetup.GET("Gen. Bus. Posting Group","Gen. Prod. Posting Group") THEN
                                  AddError(
                                    STRSUBSTNO(
                                      Text017,
                                      GenPostingSetup.TABLECAPTION,"Gen. Bus. Posting Group","Gen. Prod. Posting Group"));
                            /*    IF NOT VATPostingSetup.GET("VAT Bus. Posting Group","VAT Prod. Posting Group") THEN
                                  AddError(
                                    STRSUBSTNO(
                                      Text017,
                                      VATPostingSetup.TABLECAPTION,"VAT Bus. Posting Group","VAT Prod. Posting Group"));
                            */
                              END;
                              CASE Type OF
                                Type::"G/L Account":
                                  BEGIN
                                    IF ("No." = '') AND (Amount = 0) THEN
                                      EXIT;
                            
                                    IF "No." <> '' THEN
                                      IF GLAcc.GET("No.") THEN BEGIN
                                        IF GLAcc.Blocked THEN
                                          AddError(
                                            STRSUBSTNO(
                                              Text007,
                                              GLAcc.FIELDCAPTION(Blocked),FALSE,GLAcc.TABLECAPTION,"No."));
                                        IF NOT GLAcc."Direct Posting" AND ("Line No." <= OrigMaxLineNo) THEN
                                          AddError(
                                            STRSUBSTNO(
                                              Text007,
                                              GLAcc.FIELDCAPTION("Direct Posting"),TRUE,GLAcc.TABLECAPTION,"No."));
                                      END ELSE
                                        AddError(
                                          STRSUBSTNO(
                                            Text008,
                                            GLAcc.TABLECAPTION,"No."));
                                  END;
                                Type::Item:
                                  BEGIN
                                    IF ("No." = '') AND (Quantity = 0) THEN
                                      EXIT;
                            
                                    IF "No." <> '' THEN
                                      IF Item.GET("No.") THEN BEGIN
                                        IF Item.Blocked THEN
                                          AddError(
                                            STRSUBSTNO(
                                              Text007,
                                              Item.FIELDCAPTION(Blocked),FALSE,Item.TABLECAPTION,"No."));
                                        IF Item.Reserve = Item.Reserve::Always THEN BEGIN
                                          CALCFIELDS("Reserved Quantity");
                                          IF "Document Type" IN ["Document Type"::"Return Order","Document Type"::"Credit Memo"] THEN BEGIN
                                            IF (SignedXX(Quantity) < 0) AND (ABS("Reserved Quantity") < ABS("Return Qty. to Receive")) THEN
                                              AddError(
                                                STRSUBSTNO(
                                                  Text015,
                                                  FIELDCAPTION("Reserved Quantity"),SignedXX("Return Qty. to Receive")));
                                          END ELSE
                                            IF (SignedXX(Quantity) < 0) AND (ABS("Reserved Quantity") < ABS("Qty. to Ship")) THEN
                                              AddError(
                                                STRSUBSTNO(
                                                  Text015,
                                                  FIELDCAPTION("Reserved Quantity"),SignedXX("Qty. to Ship")));
                                        END
                                      END ELSE
                                        AddError(
                                          STRSUBSTNO(
                                            Text008,
                                            Item.TABLECAPTION,"No."));
                                  END;
                                Type::Resource:
                                  BEGIN
                                    IF ("No." = '') AND (Quantity = 0) THEN
                                      EXIT;
                            
                                    IF "No." <> '' THEN
                                      IF Res.GET("No.") THEN BEGIN
                                        IF Res.Blocked THEN
                                          AddError(
                                            STRSUBSTNO(
                                              Text007,
                                              Res.FIELDCAPTION(Blocked),FALSE,Res.TABLECAPTION,"No."));
                                      END ELSE
                                        AddError(
                                          STRSUBSTNO(
                                            Text008,
                                            Res.TABLECAPTION,"No."));
                                  END;
                                Type::"Fixed Asset":
                                  BEGIN
                                    IF ("No." = '') AND (Quantity = 0) THEN
                                      EXIT;
                                    IF "No." <> '' THEN
                                      IF FA.GET("No.") THEN BEGIN
                                        IF FA.Blocked THEN
                                          AddError(
                                            STRSUBSTNO(
                                              Text007,
                                              FA.FIELDCAPTION(Blocked),FALSE,FA.TABLECAPTION,"No."));
                                        IF FA.Inactive THEN
                                          AddError(
                                            STRSUBSTNO(
                                              Text007,
                                              FA.FIELDCAPTION(Inactive),FALSE,FA.TABLECAPTION,"No."));
                                        IF "Depreciation Book Code" = '' THEN
                                          AddError(STRSUBSTNO(Text006,FIELDCAPTION("Depreciation Book Code")))
                                        ELSE
                                          IF NOT FADeprBook.GET("No.","Depreciation Book Code") THEN
                                            AddError(
                                              STRSUBSTNO(
                                              Text017,
                                              FADeprBook.TABLECAPTION,"No.","Depreciation Book Code"));
                                      END ELSE
                                        AddError(
                                          STRSUBSTNO(
                                            Text008,
                                            FA.TABLECAPTION,"No."));
                                  END;
                              END;
                              IF NOT DimMgt.CheckDimIDComb("Dimension Set ID") THEN
                                  AddError(DimMgt.GetDimCombErr);
                                IF NOT DimMgt.CheckDimValuePosting(TableID,No,"Dimension Set ID") THEN
                                  AddError(DimMgt.GetDimValuePostingErr)
                                ELSE BEGIN
                                IF NOT DimMgt.CheckDimIDComb("Dimension Set ID") THEN
                                  AddError(DimMgt.GetDimCombErr);
                            
                                TableID[1] := DimMgt.TypeToTableID3(Type);
                                No[1] := "No.";
                                TableID[2] := DATABASE::Job;
                                No[2] := "Job No.";
                                IF NOT DimMgt.CheckDimValuePosting(TableID,No,"Dimension Set ID") THEN
                                  AddError(DimMgt.GetDimValuePostingErr);
                                IF "Line No." > OrigMaxLineNo THEN BEGIN
                                  "No." := '';
                                  Type := Type::" ";
                                END;
                              END;
                            END;
                            
                            // NAVIN
                            StructureLineDetails.SETRANGE(Type,StructureLineDetails.Type::Sale);
                            StructureLineDetails.SETRANGE("Document Type","Sales Line"."Document Type");
                            StructureLineDetails.SETRANGE("Document No.","Sales Line"."Document No.");
                            StructureLineDetails.SETRANGE("Item No.","Sales Line"."No.");
                            StructureLineDetails.SETRANGE("Line No.","Sales Line"."Line No.");
                            IF StructureLineDetails.FIND('-') THEN
                              REPEAT
                                IF NOT StructureLineDetails."Payable to Third Party" THEN BEGIN
                                  IF StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::Charges THEN
                                    ChargesAmount := ChargesAmount + StructureLineDetails.Amount;
                                  IF StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::"Other Taxes" THEN
                                    OtherTaxesAmount := OtherTaxesAmount + StructureLineDetails.Amount;
                                END;
                              UNTIL StructureLineDetails.NEXT = 0;
                            // NAVIN
                            
                            //Rev01 Start
                            
                            //RoundLoop, Footer (4) - OnPreSection()
                            //CurrReport.SHOWOUTPUT("Sales Line"."Inv. Discount Amount" <> 0);
                            tax:=0;
                            
                            IF "Sales Header".Structure<>'SERVICE' THEN
                            BEGIN
                              /*
                               IF SalesLine."Qty. to Ship">0 THEN BEGIN
                                IF SalesLine."BED %"<>0 THEN
                                  dutyper:='12.3%'
                                ELSE
                                  dutyper:='';
                               END;
                              */
                            
                              Dutycap:='Central Excise';
                              dutyper:='12.5%';
                              //dutyper:='12.3%';
                              //taxcap:='CST';
                              vatcap:='';
                              IF (SalesLine."Tax Group Code"='MPBIVAT') OR (SalesLine."Tax Group Code"='MPBI') THEN
                                  dutyper:='12.5%';
                            
                             SL.RESET;
                             SL.SETRANGE(SL."Document No.","Sales Header"."No.");
                             SL.SETFILTER(SL."No.",'<>%1','');
                             IF SL.FINDFIRST THEN
                             BEGIN
                               IF SL."Tax Area Code" = 'SALES VAT' THEN
                                 taxcap := 'VAT'
                               ELSE IF SL."Tax Area Code" = 'SALES CST' THEN
                                 taxcap := 'CST';
                               s1 := FORMAT(SL."Tax %")+'%';
                             END;
                             IF "Sales Header"."Form Code"='C' THEN
                               s1:='2%';
                             /*
                             ELSE
                              s1:='5%';
                             */
                            END ELSE BEGIN
                              Dutycap:='ServiceTax';
                              /*
                              dutyper:='12%';
                              s1:='3%';
                              taxcap:='ECESS';
                              */
                              SL.RESET;
                              SL.SETRANGE(SL."Document No.","Sales Header"."No.");
                              SL.SETFILTER(SL."No.",'<>%1','');
                              SL.SETFILTER(SL."Service Tax Group",'<>%1','');
                              IF SL.FINDFIRST THEN
                              BEGIN
                                vatcap:='';
                                STS.RESET;
                                STS.SETRANGE(STS.Code,SL."Service Tax Group");
                                IF "Sales Header"."Posting Date"<>0D THEN
                                 STS.SETRANGE(STS."From Date",0D,"Sales Header"."Posting Date")
                                ELSE
                                 STS.SETRANGE(STS."From Date",0D,WORKDATE);
                                IF STS.FINDLAST THEN
                                BEGIN
                                  dutyper:=FORMAT(STS."Service Tax %")+' %';
                                  IF  STS."SB Cess%" <> 0 THEN
                                  BEGIN
                                    taxcap := 'SBCess';
                                    s1 := FORMAT(STS."SB Cess%")+' %';
                                  END
                                  ELSE BEGIN
                                    taxcap := 'ECess';
                                    s1 := FORMAT(STS."eCess %")+' %';
                                  END;
                                  IF  STS."KK Cess%" <> 0 THEN
                                  BEGIN
                                    vatcap :='KKCess';
                                    s2:=FORMAT(STS."KK Cess%")+' %';
                                  END
                                  ELSE BEGIN
                                    taxcap +=' & S.H.E Cess';
                                    s1:=FORMAT(STS."eCess %"+STS."SHE Cess %")+' %';
                                  END;
                                END;
                              END;
                            
                            END;
                            
                            //RoundLoop, Footer (4) - OnPreSection()
                            
                            //ADSK
                            LineAmountVar += TempSalesLine."Line Amount";
                            
                            ExciseVar += ROUND(TempSalesLine."Excise Amount",1)+ROUND(TempSalesLine."Service Tax Amount",1);
                            IF TempSalesLine."Service Tax SBC Amount" > 0 THEN
                              SalesLineTaxAmt += ROUND(TempSalesLine."Service Tax SBC Amount",1)
                            ELSE
                              SalesLineTaxAmt += ROUND(TempSalesLine."Service Tax eCess Amount",1)+ROUND(TempSalesLine."Tax Amount",1)+ROUND(TempSalesLine."Service Tax eCess Amount"/2,1);
                            IF TempSalesLine."KK Cess Amount" > 0 THEN
                              KKCessAmt+=ROUND(TempSalesLine."KK Cess Amount",1);
                            //Rev01 End

                        end;

                        trigger OnPreDataItem();
                        begin
                            VATNoError := FALSE;
                            ApplNoError := FALSE;
                            CurrReport.CREATETOTALS(TempSalesLine."KK Cess Amount");
                            MoreLines := TempSalesLine.FIND('+');
                            WHILE MoreLines AND (TempSalesLine.Description = '') AND (TempSalesLine."Description 2"= '') AND
                                  (TempSalesLine."No." = '') AND (TempSalesLine.Quantity = 0) AND
                                  (TempSalesLine.Amount = 0)
                            DO
                              MoreLines := TempSalesLine.NEXT(-1) <> 0;
                            IF NOT MoreLines THEN
                              CurrReport.BREAK;
                            TempSalesLine.SETRANGE("Line No.",0,TempSalesLine."Line No.");
                            SETRANGE(Number,1,TempSalesLine.COUNT);

                            // NAVIN
                            CurrReport.CREATETOTALS(TempSalesLine."Service Tax Amount",TempSalesLine."Service Tax eCess Amount");
                            CurrReport.CREATETOTALS( TempSalesLine."Line Amount",TempSalesLine."Excise Base Amount",TempSalesLine."Excise Amount",
                                                     TempSalesLine."Amount Including Excise",TempSalesLine."Tax Base Amount",TempSalesLine."Amount Including Tax",
                                                     TempSalesLine.Amount,TempSalesLine."Tax Amount",TempSalesLine."RDSO Charges");

                            // NAVIN
                        end;
                    }
                    dataitem(VATCounter;"Integer")
                    {
                        DataItemTableView = SORTING(Number);
                        column(VATAmountLine__VAT_Amount_;VATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__VAT_Base_;VATAmountLine."VAT Base")
                        {
                            AutoFormatExpression = "Sales Line"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Invoice_Discount_Amount_;VATAmountLine."Invoice Discount Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Inv__Disc__Base_Amount_;VATAmountLine."Inv. Disc. Base Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Line_Amount_;VATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__VAT_Amount__Control150;VATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__VAT_Base__Control151;VATAmountLine."VAT Base")
                        {
                            AutoFormatExpression = "Sales Line"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__VAT___;VATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0:5;
                        }
                        column(VATAmountLine__VAT_Identifier_;VATAmountLine."VAT Identifier")
                        {
                        }
                        column(VATAmountLine__Invoice_Discount_Amount__Control173;VATAmountLine."Invoice Discount Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Inv__Disc__Base_Amount__Control171;VATAmountLine."Inv. Disc. Base Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Line_Amount__Control169;VATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__VAT_Amount__Control175;VATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__VAT_Base__Control176;VATAmountLine."VAT Base")
                        {
                            AutoFormatExpression = "Sales Line"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Invoice_Discount_Amount__Control177;VATAmountLine."Invoice Discount Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Inv__Disc__Base_Amount__Control178;VATAmountLine."Inv. Disc. Base Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Line_Amount__Control179;VATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__VAT_Amount__Control181;VATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__VAT_Base__Control182;VATAmountLine."VAT Base")
                        {
                            AutoFormatExpression = "Sales Line"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Invoice_Discount_Amount__Control183;VATAmountLine."Invoice Discount Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Inv__Disc__Base_Amount__Control184;VATAmountLine."Inv. Disc. Base Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Line_Amount__Control185;VATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATCounter_Number;Number)
                        {
                        }
                        column(VATAmountLine__VAT_Amount__Control150Caption;VATAmountLine__VAT_Amount__Control150CaptionLbl)
                        {
                        }
                        column(VATAmountLine__VAT_Base__Control151Caption;VATAmountLine__VAT_Base__Control151CaptionLbl)
                        {
                        }
                        column(VATAmountLine__VAT___Caption;VATAmountLine__VAT___CaptionLbl)
                        {
                        }
                        column(VAT_Amount_SpecificationCaption;VAT_Amount_SpecificationCaptionLbl)
                        {
                        }
                        column(VATAmountLine__VAT_Identifier_Caption;VATAmountLine__VAT_Identifier_CaptionLbl)
                        {
                        }
                        column(VATAmountLine__Invoice_Discount_Amount__Control173Caption;VATAmountLine__Invoice_Discount_Amount__Control173CaptionLbl)
                        {
                        }
                        column(VATAmountLine__Inv__Disc__Base_Amount__Control171Caption;VATAmountLine__Inv__Disc__Base_Amount__Control171CaptionLbl)
                        {
                        }
                        column(VATAmountLine__Line_Amount__Control169Caption;VATAmountLine__Line_Amount__Control169CaptionLbl)
                        {
                        }
                        column(ContinuedCaption;ContinuedCaptionLbl)
                        {
                        }
                        column(ContinuedCaption_Control155;ContinuedCaption_Control155Lbl)
                        {
                        }
                        column(TotalCaption;TotalCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord();
                        begin
                            VATAmountLine.GetLine(Number);
                        end;

                        trigger OnPreDataItem();
                        begin
                            SETRANGE(Number,1,VATAmountLine.COUNT);
                            CurrReport.CREATETOTALS(
                              VATAmountLine."VAT Base",VATAmountLine."VAT Amount",VATAmountLine."Amount Including VAT",
                              VATAmountLine."Line Amount",VATAmountLine."Inv. Disc. Base Amount",
                              VATAmountLine."Invoice Discount Amount");
                        end;
                    }
                    dataitem(VATCounterLCY;"Integer")
                    {
                        DataItemTableView = SORTING(Number);
                        column(VALExchRate;VALExchRate)
                        {
                        }
                        column(VALSpecLCYHeader;VALSpecLCYHeader)
                        {
                        }
                        column(VALVATAmountLCY;VALVATAmountLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VALVATBaseLCY;VALVATBaseLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VALVATAmountLCY_Control88;VALVATAmountLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VALVATBaseLCY_Control165;VALVATBaseLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__VAT____Control167;VATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0:5;
                        }
                        column(VATAmountLine__VAT_Identifier__Control241;VATAmountLine."VAT Identifier")
                        {
                        }
                        column(VALVATAmountLCY_Control242;VALVATAmountLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VALVATBaseLCY_Control243;VALVATBaseLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VALVATAmountLCY_Control245;VALVATAmountLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VALVATBaseLCY_Control246;VALVATBaseLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VATCounterLCY_Number;Number)
                        {
                        }
                        column(VALVATAmountLCY_Control88Caption;VALVATAmountLCY_Control88CaptionLbl)
                        {
                        }
                        column(VALVATBaseLCY_Control165Caption;VALVATBaseLCY_Control165CaptionLbl)
                        {
                        }
                        column(VATAmountLine__VAT____Control167Caption;VATAmountLine__VAT____Control167CaptionLbl)
                        {
                        }
                        column(VATAmountLine__VAT_Identifier__Control241Caption;VATAmountLine__VAT_Identifier__Control241CaptionLbl)
                        {
                        }
                        column(ContinuedCaption_Control87;ContinuedCaption_Control87Lbl)
                        {
                        }
                        column(ContinuedCaption_Control244;ContinuedCaption_Control244Lbl)
                        {
                        }
                        column(TotalCaption_Control247;TotalCaption_Control247Lbl)
                        {
                        }

                        trigger OnAfterGetRecord();
                        begin
                            VATAmountLine.GetLine(Number);

                            VALVATBaseLCY := ROUND(CurrExchRate.ExchangeAmtFCYToLCY(
                                               "Sales Header"."Posting Date","Sales Header"."Currency Code",
                                               VATAmountLine."VAT Base","Sales Header"."Currency Factor"));
                            VALVATAmountLCY := ROUND(CurrExchRate.ExchangeAmtFCYToLCY(
                                                 "Sales Header"."Posting Date","Sales Header"."Currency Code",
                                                 VATAmountLine."VAT Amount","Sales Header"."Currency Factor"));
                        end;

                        trigger OnPreDataItem();
                        begin
                            IF (NOT GLSetup."Print VAT specification in LCY") OR
                               ("Sales Header"."Currency Code" = '')
                            THEN
                              CurrReport.BREAK;

                            SETRANGE(Number,1,VATAmountLine.COUNT);
                            CurrReport.CREATETOTALS(VALVATBaseLCY,VALVATAmountLCY);

                            IF GLSetup."LCY Code" = '' THEN
                              VALSpecLCYHeader := Text050 + Text051
                            ELSE
                              VALSpecLCYHeader := Text050 + FORMAT(GLSetup."LCY Code");

                            CurrExchRate.FindCurrency("Sales Header"."Posting Date","Sales Header"."Currency Code",1);
                            VALExchRate := STRSUBSTNO(Text052,CurrExchRate."Relational Exch. Rate Amount",CurrExchRate."Exchange Rate Amount");
                        end;
                    }
                    dataitem("Item Charge Assignment (Sales)";"Item Charge Assignment (Sales)")
                    {
                        DataItemLink = Document Type=FIELD(Document Type),Document No.=FIELD(Document No.);
                        DataItemLinkReference = "Sales Line";
                        DataItemTableView = SORTING(Document Type,Document No.,Document Line No.,Line No.);
                        column(Item_Charge_Assignment__Sales___Qty__to_Assign_;"Qty. to Assign")
                        {
                        }
                        column(Item_Charge_Assignment__Sales___Amount_to_Assign_;"Amount to Assign")
                        {
                        }
                        column(Item_Charge_Assignment__Sales___Item_Charge_No__;"Item Charge No.")
                        {
                        }
                        column(SalesLine2_Description;SalesLine2.Description)
                        {
                        }
                        column(SalesLine2_Quantity;SalesLine2.Quantity)
                        {
                            DecimalPlaces = 0:5;
                        }
                        column(Item_Charge_Assignment__Sales___Item_No__;"Item No.")
                        {
                        }
                        column(Item_Charge_Assignment__Sales___Qty__to_Assign__Control209;"Qty. to Assign")
                        {
                        }
                        column(Item_Charge_Assignment__Sales___Unit_Cost_;"Unit Cost")
                        {
                        }
                        column(Item_Charge_Assignment__Sales___Amount_to_Assign__Control216;"Amount to Assign")
                        {
                        }
                        column(Item_Charge_Assignment__Sales___Qty__to_Assign__Control221;"Qty. to Assign")
                        {
                        }
                        column(Item_Charge_Assignment__Sales___Amount_to_Assign__Control222;"Amount to Assign")
                        {
                        }
                        column(Item_Charge_Assignment__Sales___Qty__to_Assign__Control224;"Qty. to Assign")
                        {
                        }
                        column(Item_Charge_Assignment__Sales___Amount_to_Assign__Control225;"Amount to Assign")
                        {
                        }
                        column(Item_Charge_Assignment__Sales__Document_Type;"Document Type")
                        {
                        }
                        column(Item_Charge_Assignment__Sales__Document_No_;"Document No.")
                        {
                        }
                        column(Item_Charge_Assignment__Sales__Document_Line_No_;"Document Line No.")
                        {
                        }
                        column(Item_Charge_Assignment__Sales__Line_No_;"Line No.")
                        {
                        }
                        column(Item_Charge_SpecificationCaption;Item_Charge_SpecificationCaptionLbl)
                        {
                        }
                        column(Item_Charge_Assignment__Sales___Item_Charge_No__Caption;FIELDCAPTION("Item Charge No."))
                        {
                        }
                        column(SalesLine2_DescriptionCaption;SalesLine2_DescriptionCaptionLbl)
                        {
                        }
                        column(SalesLine2_QuantityCaption;SalesLine2_QuantityCaptionLbl)
                        {
                        }
                        column(Item_Charge_Assignment__Sales___Item_No__Caption;FIELDCAPTION("Item No."))
                        {
                        }
                        column(Item_Charge_Assignment__Sales___Qty__to_Assign__Control209Caption;FIELDCAPTION("Qty. to Assign"))
                        {
                        }
                        column(Item_Charge_Assignment__Sales___Unit_Cost_Caption;FIELDCAPTION("Unit Cost"))
                        {
                        }
                        column(Item_Charge_Assignment__Sales___Amount_to_Assign__Control216Caption;FIELDCAPTION("Amount to Assign"))
                        {
                        }
                        column(ContinuedCaption_Control210;ContinuedCaption_Control210Lbl)
                        {
                        }
                        column(TotalCaption_Control220;TotalCaption_Control220Lbl)
                        {
                        }
                        column(ContinuedCaption_Control223;ContinuedCaption_Control223Lbl)
                        {
                        }

                        trigger OnAfterGetRecord();
                        begin
                            IF SalesLine2.GET("Document Type","Document No.","Document Line No.") THEN;
                        end;

                        trigger OnPreDataItem();
                        begin
                            IF NOT ShowCostAssignment THEN
                              CurrReport.BREAK;
                            CurrReport.CREATETOTALS("Amount to Assign","Qty. to Assign");
                        end;
                    }

                    trigger OnAfterGetRecord();
                    begin
                        CLEAR(TempSalesLine);
                        CLEAR(SalesPost);
                        VATAmountLine.DELETEALL;
                        TempSalesLine.DELETEALL;
                        SalesPost.GetSalesLines("Sales Header",TempSalesLine,1);
                        TempSalesLine.CalcVATAmountLines(0,"Sales Header",TempSalesLine,VATAmountLine);
                        TempSalesLine.UpdateVATOnLines(0,"Sales Header",TempSalesLine,VATAmountLine);
                        VATAmount := VATAmountLine.GetTotalVATAmount;
                        VATBaseAmount := VATAmountLine.GetTotalVATBase;
                        VATDiscountAmount :=
                          VATAmountLine.GetTotalVATDiscount("Sales Header"."Currency Code","Sales Header"."Prices Including VAT");
                        TotalAmountInclVAT := VATAmountLine.GetTotalAmountInclVAT;
                        AppliedServiceTaxSBCAmt := 0;
                        AppliedKKCessAmt := 0;
                    end;
                }
            }

            trigger OnAfterGetRecord();
            var
                TableID : array [10] of Integer;
                No : array [10] of Code[20];
                ShipQtyExist : Boolean;
            begin
                DimSetEntry1.SETRANGE("Dimension Set ID","Dimension Set ID");

                FormatAddr.SalesHeaderSellTo(SellToAddr,"Sales Header");
                FormatAddr.SalesHeaderBillTo(BillToAddr,"Sales Header");
                FormatAddr.SalesHeaderShipTo(ShipToAddr,"Sales Header");
                IF "Currency Code" = '' THEN BEGIN
                  GLSetup.TESTFIELD("LCY Code");
                  TotalText := STRSUBSTNO(Text004,GLSetup."LCY Code");
                  TotalExclVATText := STRSUBSTNO(Text033,GLSetup."LCY Code");
                  TotalInclVATText := STRSUBSTNO(Text005,GLSetup."LCY Code");
                END ELSE BEGIN
                  TotalText := STRSUBSTNO(Text004,"Currency Code");
                  TotalExclVATText := STRSUBSTNO(Text033,"Currency Code");
                  TotalInclVATText := STRSUBSTNO(Text005,"Currency Code");
                END;

                Invoice := InvOnNextPostReq;
                Ship := ShipReceiveOnNextPostReq;
                Receive := ShipReceiveOnNextPostReq;

                IF "Sell-to Customer No." = '' THEN
                  AddError(STRSUBSTNO(Text006,FIELDCAPTION("Sell-to Customer No.")))
                ELSE BEGIN
                  IF Cust.GET("Sell-to Customer No.") THEN BEGIN
                    IF (Cust.Blocked = Cust.Blocked::Ship) AND Ship  THEN BEGIN
                      SalesLine2.SETRANGE("Document Type",SalesHeader."Document Type");
                      SalesLine2.SETRANGE("Document No.", SalesHeader."No.");
                      SalesLine2.SETFILTER("Qty. to Ship", '>0');
                      IF SalesLine2.FIND('-') THEN
                        ShipQtyExist := TRUE;
                    END;
                    IF (Cust.Blocked = Cust.Blocked::All) OR
                       ((Cust.Blocked = Cust.Blocked::Invoice) AND
                        (NOT ("Document Type" IN
                              ["Document Type"::"Credit Memo","Document Type"::"Return Order"]))) OR
                        (ShipQtyExist)
                    THEN
                      AddError(
                        STRSUBSTNO(
                          Text045,
                          Cust.FIELDCAPTION(Blocked),Cust.Blocked,Cust.TABLECAPTION,"Sell-to Customer No."));
                  END ELSE
                    AddError(
                      STRSUBSTNO(
                        Text008,
                        Cust.TABLECAPTION,"Sell-to Customer No."));
                END;

                IF "Bill-to Customer No." = '' THEN
                  AddError(STRSUBSTNO(Text006,FIELDCAPTION("Bill-to Customer No.")))
                ELSE BEGIN

                  IF "Bill-to Customer No." <> "Sell-to Customer No." THEN
                    IF Cust.GET("Bill-to Customer No.") THEN BEGIN
                      IF (Cust.Blocked = Cust.Blocked::All) OR
                          ((Cust.Blocked = Cust.Blocked::Invoice) AND
                          ("Document Type" IN
                           ["Document Type"::"Credit Memo","Document Type"::"Return Order"]))
                      THEN
                        AddError(
                          STRSUBSTNO(
                            Text045,
                            Cust.FIELDCAPTION(Blocked),FALSE,Cust.TABLECAPTION,"Bill-to Customer No."));
                    END ELSE
                      AddError(
                        STRSUBSTNO(
                          Text008,
                          Cust.TABLECAPTION,"Bill-to Customer No."));
                END;

                SalesSetup.GET;

                IF "Posting Date" = 0D THEN
                  AddError(STRSUBSTNO(Text006,FIELDCAPTION("Posting Date")))
                ELSE
                  IF "Posting Date" <> NORMALDATE("Posting Date") THEN
                    AddError(STRSUBSTNO(Text009,FIELDCAPTION("Posting Date")))
                  ELSE BEGIN
                    IF (AllowPostingFrom = 0D) AND (AllowPostingTo = 0D) THEN BEGIN
                      IF userid1 <> '' THEN
                        IF UserSetup.GET(userid1) THEN BEGIN
                          AllowPostingFrom := UserSetup."Allow Posting From";
                          AllowPostingTo := UserSetup."Allow Posting To";
                        END;
                      IF (AllowPostingFrom = 0D) AND (AllowPostingTo = 0D) THEN BEGIN
                        AllowPostingFrom := GLSetup."Allow Posting From";
                        AllowPostingTo := GLSetup."Allow Posting To";
                      END;
                      IF AllowPostingTo = 0D THEN
                        AllowPostingTo := 12319999D;
                    END;
                    IF ("Posting Date" < AllowPostingFrom) OR ("Posting Date" > AllowPostingTo) THEN
                      AddError(
                        STRSUBSTNO(
                          Text010,FIELDCAPTION("Posting Date")));
                  END;

                IF ("Document Date" <> 0D) THEN
                  IF ("Document Date" <> NORMALDATE("Document Date")) THEN
                    AddError(STRSUBSTNO(Text009,FIELDCAPTION("Document Date")));

                CASE "Document Type" OF
                  "Document Type"::Order:
                    Receive := FALSE;
                  "Document Type"::Invoice:
                    BEGIN
                      Ship := TRUE;
                      Invoice := TRUE;
                      Receive := FALSE;
                    END;
                  "Document Type"::"Return Order":
                    Ship := FALSE;
                  "Document Type"::"Credit Memo":
                    BEGIN
                      Ship := FALSE;
                      Invoice := TRUE;
                      Receive := TRUE;
                    END;
                END;

                IF NOT (Ship OR Invoice OR Receive) THEN
                  AddError(
                    STRSUBSTNO(
                      Text034,
                      FIELDCAPTION(Ship),FIELDCAPTION(Invoice),FIELDCAPTION(Receive)));

                IF Invoice THEN BEGIN
                  SalesLine.RESET;
                  SalesLine.SETRANGE("Document Type","Document Type");
                  SalesLine.SETRANGE("Document No.","No.");
                  SalesLine.SETFILTER(Quantity,'<>0');
                  IF "Document Type" IN ["Document Type"::Order,"Document Type"::"Return Order"] THEN
                    SalesLine.SETFILTER("Qty. to Invoice",'<>0');
                  Invoice := SalesLine.FIND('-');
                  IF Invoice AND (NOT Ship) AND ("Document Type" = "Document Type"::Order) THEN BEGIN
                    Invoice := FALSE;
                    REPEAT
                      Invoice := (SalesLine."Quantity Shipped" - SalesLine."Quantity Invoiced") <> 0;
                    UNTIL Invoice OR (SalesLine.NEXT = 0);
                  END ELSE
                    IF Invoice AND (NOT Receive) AND ("Document Type" = "Document Type"::"Return Order") THEN BEGIN
                      Invoice := FALSE;
                      REPEAT
                        Invoice := (SalesLine."Return Qty. Received" - SalesLine."Quantity Invoiced") <> 0;
                      UNTIL Invoice OR (SalesLine.NEXT = 0);
                    END;
                END;

                IF Ship THEN BEGIN
                  SalesLine.RESET;
                  SalesLine.SETRANGE("Document Type","Document Type");
                  SalesLine.SETRANGE("Document No.","No.");
                  SalesLine.SETFILTER(Quantity,'<>0');
                  IF "Document Type" = "Document Type"::Order THEN
                    SalesLine.SETFILTER("Qty. to Ship",'<>0');
                  SalesLine.SETRANGE("Shipment No.",'');
                  Ship := SalesLine.FIND('-');
                END;
                IF Receive THEN BEGIN
                  SalesLine.RESET;
                  SalesLine.SETRANGE("Document Type","Document Type");
                  SalesLine.SETRANGE("Document No.","No.");
                  SalesLine.SETFILTER(Quantity,'<>0');
                  IF "Document Type" = "Document Type"::"Return Order" THEN
                    SalesLine.SETFILTER("Return Qty. to Receive",'<>0');
                  SalesLine.SETRANGE("Return Receipt No.",'');
                  Receive := SalesLine.FIND('-');
                END;

                IF NOT (Ship OR Invoice OR Receive) THEN
                  AddError(Text012);

                IF Invoice THEN
                  IF NOT ("Document Type" IN ["Document Type"::"Return Order","Document Type"::"Credit Memo"]) THEN
                    IF "Due Date" = 0D THEN
                      AddError(STRSUBSTNO(Text006,FIELDCAPTION("Due Date")));

                IF Ship AND ("Shipping No." = '') THEN // Order,Invoice
                  IF ("Document Type" = "Document Type"::Order) OR
                     (("Document Type" = "Document Type"::Invoice) AND SalesSetup."Shipment on Invoice")
                  THEN
                    IF "Shipping No. Series" = '' THEN
                      AddError(
                        STRSUBSTNO(
                          Text006,
                          FIELDCAPTION("Shipping No. Series")));

                IF Receive AND ("Return Receipt No." = '') THEN // Return Order,Credit Memo
                  IF ("Document Type" = "Document Type"::"Return Order") OR
                     (("Document Type" = "Document Type"::"Credit Memo") AND SalesSetup."Return Receipt on Credit Memo")
                  THEN
                    IF "Return Receipt No. Series" = '' THEN
                      AddError(
                        STRSUBSTNO(
                          Text006,
                          FIELDCAPTION("Return Receipt No. Series")));

                IF Invoice AND ("Posting No." = '') THEN
                  IF "Document Type" IN ["Document Type"::Order,"Document Type"::"Return Order"] THEN
                    IF "Posting No. Series" = '' THEN
                      AddError(
                        STRSUBSTNO(
                          Text006,
                          FIELDCAPTION("Posting No. Series")));

                SalesLine.RESET;
                SalesLine.SETRANGE("Document Type","Document Type");
                SalesLine.SETRANGE("Document No.","No.");
                SalesLine.SETFILTER("Purch. Order Line No.",'<>0');
                IF SalesLine.FIND('-') THEN BEGIN
                  DropShipOrder := TRUE;
                  IF Ship THEN
                    REPEAT
                      IF PurchOrderHeader."No." <> SalesLine."Purchase Order No." THEN BEGIN
                        PurchOrderHeader.GET(PurchOrderHeader."Document Type"::Order,SalesLine."Purchase Order No.");
                        IF PurchOrderHeader."Pay-to Vendor No." = '' THEN
                          AddError(
                            STRSUBSTNO(
                              Text013,
                              PurchOrderHeader.FIELDCAPTION("Pay-to Vendor No.")));
                        IF PurchOrderHeader."Receiving No." = '' THEN
                          IF PurchOrderHeader."Receiving No. Series" = '' THEN
                            AddError(
                              STRSUBSTNO(
                                Text013,
                                PurchOrderHeader.FIELDCAPTION("Receiving No. Series")));
                      END;
                    UNTIL SalesLine.NEXT = 0;
                END;

                IF "Document Type" IN ["Document Type"::Order,"Document Type"::Invoice] THEN
                  IF SalesSetup."Ext. Doc. No. Mandatory" AND ("External Document No." = '') THEN
                    AddError(STRSUBSTNO(Text006,FIELDCAPTION("External Document No.")));

                IF NOT DimMgt.CheckDimIDComb("Dimension Set ID") THEN
                  AddError(DimMgt.GetDimCombErr);

                TableID[1] := DATABASE::Customer;
                No[1] := "Bill-to Customer No.";
                //TableID[2] := DATABASE::Job;
                //No[2] := "Job No.";
                TableID[3] := DATABASE::"Salesperson/Purchaser";
                No[3] := "Salesperson Code";
                TableID[4] := DATABASE::Campaign;
                No[4] := "Campaign No.";
                TableID[5] := DATABASE::"Responsibility Center";
                No[5] := "Responsibility Center";
                IF NOT DimMgt.CheckDimValuePosting(TableID,No,"Dimension Set ID") THEN
                  AddError(DimMgt.GetDimValuePostingErr);

                // PS39773.begin
                //ServiceTaxAmt := RoundServiceTaxPrecision(ServiceTaxAmt);
                //ServiceTaxECessAmt := RoundServiceTaxPrecision(ServiceTaxECessAmt);
                //ServiceTaxSHECessAmt := RoundServiceTaxPrecision(ServiceTaxSHECessAmt);
                // PS39773.end
            end;

            trigger OnPreDataItem();
            begin
                tax:=0;
                SalesHeader.COPY("Sales Header");
                SalesHeader.FILTERGROUP := 2;
                SalesHeader.SETRANGE("Document Type",SalesHeader."Document Type"::Order);
                IF SalesHeader.FIND('-') THEN BEGIN
                  CASE TRUE OF
                    ShipReceiveOnNextPostReq AND InvOnNextPostReq:
                      ShipInvText := Text000;
                    ShipReceiveOnNextPostReq:
                      ShipInvText := Text001;
                    InvOnNextPostReq:
                      ShipInvText := Text002;
                  END;
                  ShipInvText := STRSUBSTNO(Text003,ShipInvText);
                END;
                SalesHeader.SETRANGE("Document Type",SalesHeader."Document Type"::"Return Order");
                IF SalesHeader.FIND('-') THEN BEGIN
                  CASE TRUE OF
                    ShipReceiveOnNextPostReq AND InvOnNextPostReq:
                      ReceiveInvText := Text018;
                    ShipReceiveOnNextPostReq:
                      ReceiveInvText := Text031;
                    InvOnNextPostReq:
                      ReceiveInvText := Text002;
                  END;
                  ReceiveInvText := STRSUBSTNO(Text032,ReceiveInvText);
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
                group(Options)
                {
                    group("Order/Return Order Posting")
                    {
                        Caption = 'Order/Return Order Posting';
                    }
                    field("Ship/Receive";ShipReceiveOnNextPostReq)
                    {
                        Caption = 'Ship/Receive';

                        trigger OnValidate();
                        begin
                            //Rev01 Start
                            IF NOT ShipReceiveOnNextPostReq THEN
                              InvOnNextPostReq := TRUE;
                            //Rev01 End
                        end;
                    }
                    field(Invoice;InvOnNextPostReq)
                    {

                        trigger OnValidate();
                        begin
                            //Rev01 Start
                            IF NOT InvOnNextPostReq THEN
                              ShipReceiveOnNextPostReq := TRUE;
                            //Rev01 End
                        end;
                    }
                    field("Show Dimensions";ShowDim)
                    {
                    }
                    field("Show Item Charge Assgnt.";ShowCostAssignment)
                    {
                    }
                    field("Description Enable or Not";descrienable)
                    {
                    }
                    field(Advance;advance)
                    {
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
        GLSetup.GET;
    end;

    trigger OnPreReport();
    begin
        SalesHeaderFilter := "Sales Header".GETFILTERS;
    end;

    var
        Text000 : TextConst ENU='Ship and Invoice',ENN='Ship and Invoice';
        Text001 : TextConst ENU='Ship',ENN='Ship';
        Text002 : TextConst ENU='Invoice',ENN='Invoice';
        Text003 : TextConst ENU='Order Posting: %1',ENN='Order Posting: %1';
        Text004 : TextConst ENU='Total %1',ENN='Total %1';
        Text005 : TextConst ENU='Total %1 Incl. VAT',ENN='Total %1 Incl. VAT';
        Text006 : TextConst ENU='%1 must be specified.',ENN='%1 must be specified.';
        Text007 : TextConst ENU='%1 must be %2 for %3 %4.',ENN='%1 must be %2 for %3 %4.';
        Text008 : TextConst ENU='%1 %2 does not exist.',ENN='%1 %2 does not exist.';
        Text009 : TextConst ENU='%1 must not be a closing date.',ENN='%1 must not be a closing date.';
        Text010 : TextConst ENU='%1 is not within your allowed range of posting dates.',ENN='%1 is not within your allowed range of posting dates.';
        Text012 : TextConst ENU='There is nothing to post.',ENN='There is nothing to post.';
        Text013 : TextConst ENU='%1 must be entered on the purchase order header.',ENN='%1 must be entered on the purchase order header.';
        Text014 : TextConst ENU='Sales Document: %1',ENN='Sales Document: %1';
        Text015 : TextConst ENU='%1 must be %2.',ENN='%1 must be %2.';
        Text016 : TextConst ENU='%1 %2 does not exist on customer entries.',ENN='%1 %2 does not exist on customer entries.';
        Text017 : TextConst ENU='%1 %2 %3 does not exist.',ENN='%1 %2 %3 does not exist.';
        Text018 : TextConst ENU='Receive and Credit Memo',ENN='Receive and Credit Memo';
        Text019 : TextConst ENU='%1 %2 must be specified.',ENN='%1 %2 must be specified.';
        Text020 : TextConst ENU='%1 must be 0 when %2 is 0.',ENN='%1 must be 0 when %2 is 0.';
        Text021 : TextConst ENU='Drop shipments are only possible for items.',ENN='Drop shipments are only possible for items.';
        Text022 : TextConst ENU='You cannot ship sales order line %1 because the line is marked',ENN='You cannot ship sales order line %1 because the line is marked';
        Text023 : TextConst ENU='as a drop shipment and is not yet associated with a purchase order.',ENN='as a drop shipment and is not yet associated with a purchase order.';
        Text024 : TextConst ENU='The %1 on the shipment is not the same as the %1 on the sales header.',ENN='The %1 on the shipment is not the same as the %1 on the sales header.';
        Text025 : TextConst ENU='Line %1 of the return receipt %2, which you are attempting to invoice, has already been invoiced.',ENN='Line %1 of the return receipt %2, which you are attempting to invoice, has already been invoiced.';
        Text026 : TextConst ENU='Line %1 of the shipment %2, which you are attempting to invoice, has already been invoiced.',ENN='Line %1 of the shipment %2, which you are attempting to invoice, has already been invoiced.';
        Text027 : TextConst ENU='%1 must have the same sign as the shipments.',ENN='%1 must have the same sign as the shipments.';
        Text031 : TextConst ENU='Receive',ENN='Receive';
        Text032 : TextConst ENU='Return Order Posting: %1',ENN='Return Order Posting: %1';
        Text033 : TextConst ENU='Total %1 Excl. VAT',ENN='Total %1 Excl. VAT';
        Text034 : TextConst ENU='Enter "Yes" in %1 and/or %2 and/or %3.',ENN='Enter "Yes" in %1 and/or %2 and/or %3.';
        Text035 : TextConst ENU='You must enter the customer''s %1.',ENN='You must enter the customer''s %1.';
        Text036 : TextConst ENU='The quantity you are attempting to invoice is greater than the quantity in shipment %1.',ENN='The quantity you are attempting to invoice is greater than the quantity in shipment %1.';
        Text037 : TextConst ENU='The quantity you are attempting to invoice is greater than the quantity in return receipt %1.',ENN='The quantity you are attempting to invoice is greater than the quantity in return receipt %1.';
        Text038 : TextConst ENU='The %1 on the return receipt is not the same as the %1 on the sales header.',ENN='The %1 on the return receipt is not the same as the %1 on the sales header.';
        Text039 : TextConst ENU='%1 must have the same sign as the return receipt.',ENN='%1 must have the same sign as the return receipt.';
        SalesSetup : Record "Sales & Receivables Setup";
        GLSetup : Record "General Ledger Setup";
        UserSetup : Record "User Setup";
        Cust : Record Customer;
        SalesHeader : Record "Sales Header";
        SalesLine : Record "Sales Line";
        SalesLine2 : Record "Sales Line";
        TempSalesLine : Record "Sales Line" temporary;
        GLAcc : Record "G/L Account";
        Item : Record Item;
        Res : Record Resource;
        SaleShptLine : Record "Sales Shipment Line";
        ReturnRcptLine : Record "Return Receipt Line";
        PurchOrderHeader : Record "Purchase Header";
        GenPostingSetup : Record "General Posting Setup";
        VATPostingSetup : Record "VAT Posting Setup";
        CustLedgEntry : Record "Cust. Ledger Entry";
        VATAmountLine : Record "VAT Amount Line" temporary;
        DimSetEntry1 : Record "Dimension Set Entry";
        DimSetEntry2 : Record "Dimension Set Entry";
        TempDimSetEntry : Record "Dimension Set Entry" temporary;
        FA : Record "Fixed Asset";
        FADeprBook : Record "FA Depreciation Book";
        CurrExchRate : Record "Currency Exchange Rate";
        InvtPeriod : Record "Inventory Period";
        FormatAddr : Codeunit "Format Address";
        DimMgt : Codeunit DimensionManagement;
        SalesPost : Codeunit "Sales-Post";
        SalesHeaderFilter : Text[250];
        SellToAddr : array [8] of Text[50];
        BillToAddr : array [8] of Text[50];
        ShipToAddr : array [8] of Text[50];
        TotalText : Text[50];
        TotalExclVATText : Text[50];
        TotalInclVATText : Text[50];
        ShipInvText : Text[50];
        ReceiveInvText : Text[50];
        DimText : Text[120];
        OldDimText : Text[75];
        ErrorText : array [99] of Text[250];
        QtyToHandleCaption : Text[30];
        AllowPostingFrom : Date;
        AllowPostingTo : Date;
        VATDate : Date;
        MaxQtyToBeInvoiced : Decimal;
        RemQtyToBeInvoiced : Decimal;
        QtyToBeInvoiced : Decimal;
        VATAmount : Decimal;
        VATBaseAmount : Decimal;
        VATDiscountAmount : Decimal;
        TotalAmountInclVAT : Decimal;
        QtyToHandle : Decimal;
        ErrorCounter : Integer;
        OrigMaxLineNo : Integer;
        DropShipOrder : Boolean;
        InvOnNextPostReq : Boolean;
        ShipReceiveOnNextPostReq : Boolean;
        VATNoError : Boolean;
        ApplNoError : Boolean;
        ShowDim : Boolean;
        Continue : Boolean;
        ShowCostAssignment : Boolean;
        Text043 : TextConst ENU='%1 must be zero.',ENN='%1 must be zero.';
        Text045 : TextConst ENU='%1 must not be %2 for %3 %4.',ENN='%1 must not be %2 for %3 %4.';
        MoreLines : Boolean;
        VALVATBaseLCY : Decimal;
        VALVATAmountLCY : Decimal;
        VALSpecLCYHeader : Text[80];
        VALExchRate : Text[50];
        Text046 : TextConst ENU='%1 must be completely preinvoiced before you can ship or invoice the line.',ENN='%1 must be completely preinvoiced before you can ship or invoice the line.';
        Text050 : TextConst ENU='VAT Amount Specification in ',ENN='VAT Amount Specification in ';
        Text051 : TextConst ENU='Local Currency',ENN='Local Currency';
        Text052 : TextConst ENU='Exchange rate: %1/%2',ENN='Exchange rate: %1/%2';
        Text053 : TextConst ENU='%1 can at most be %2.',ENN='%1 can at most be %2.';
        Text054 : TextConst ENU='%1 must be at least %2.',ENN='%1 must be at least %2.';
        SumLineAmount : Decimal;
        SumInvDiscountAmount : Decimal;
        ChargesAmount : Decimal;
        OtherTaxesAmount : Decimal;
        ThirdPartyAmount : Decimal;
        Text13700 : TextConst ENU='Total %1 Incl. Taxes',ENN='Total %1 Incl. Taxes';
        Text13701 : TextConst ENU='Total %1 Excl. Taxes',ENN='Total %1 Excl. Taxes';
        GenJnlLine : Record "Gen. Journal Line";
        Text16500 : TextConst ENU='Excise Cenvat Claim Form not filled.',ENN='Excise Cenvat Claim Form not filled.';
        Text16501 : TextConst ENU='Please Check The Total of PLA , RG 23 A and RG 23 C with Excise Amount.',ENN='Please Check The Total of PLA , RG 23 A and RG 23 C with Excise Amount.';
        TCSAmountApplied : Decimal;
        TCSEntry : Record "TCS Entry";
        TotalAmount : Decimal;
        Text16502 : TextConst ENU='The Service Tax Registration No. of the document should be same as that of the document applied.',ENN='The Service Tax Registration No. of the document should be same as that of the document applied.';
        Text16503 : TextConst ENU='The Service Tax Group Code of the document should be same as that of the document applied.',ENN='The Service Tax Group Code of the document should be same as that of the document applied.';
        ServiceTaxEntry : Record "Service Tax Entry";
        Text16504 : TextConst ENU='Sum of CIF Amount and BCD Amount should not be 0 for CVD Calculation.',ENN='Sum of CIF Amount and BCD Amount should not be 0 for CVD Calculation.';
        ServiceTaxAmt : Decimal;
        ServiceTaxECessAmt : Decimal;
        AppliedServiceTaxAmt : Decimal;
        AppliedServiceTaxECessAmt : Decimal;
        NetTotal : Decimal;
        ServiceTaxSHECessAmt : Decimal;
        AppliedServiceTaxSHECessAmt : Decimal;
        Text16505 : TextConst ENU='Line Amount should not be %1 in Document Type = %2 Document No. = %3 Line No. = %4.',ENN='Line Amount should not be %1 in Document Type = %2 Document No. = %3 Line No. = %4.';
        Text16506 : TextConst ENU='CVD must be No in Structure Details Code = %1 Calculation Order = %2 Type = %3 Tax/Charge Group = %4 Tax/Charge Code = %5.',ENN='CVD must be No in Structure Details Code = %1 Calculation Order = %2 Type = %3 Tax/Charge Group = %4 Tax/Charge Code = %5.';
        Text16507 : TextConst ENU='One of the Structure detail should have Include PIT Calculation = Yes for Document Type = %1,  Document No. = %2,  Line No. = %3 for Price Inclusive of Tax = Yes.',ENN='One of the Structure detail should have Include PIT Calculation = Yes for Document Type = %1,  Document No. = %2,  Line No. = %3 for Price Inclusive of Tax = Yes.';
        Text16508 : TextConst ENU='Fixed asset or capital item must not be used in trading transaction in Document Type=%1,Document No.=%2,Line No.=%3.',ENN='Fixed asset or capital item must not be used in trading transaction in Document Type=%1,Document No.=%2,Line No.=%3.';
        SumSalesLineExciseAmount : Decimal;
        SumSalesLineTaxAmount : Decimal;
        SumLineServiceTaxAmount : Decimal;
        SumLineServiceTaxECessAmount : Decimal;
        SumLineServiceTaxSHECessAmount : Decimal;
        SumSalesLineAmountToCusTomer : Decimal;
        SumTotalTDSTCSInclSHECESS : Decimal;
        TaxAreaLine : Record "Tax Area Line";
        TaxJurisdiction : Record "Tax Jurisdiction";
        TaxType : Text[30];
        Text16509 : TextConst ENU='Tax Type must be %1 for Tax Jurisdiction in Tax Area Line %2',ENN='Tax Type must be %1 for Tax Jurisdiction in Tax Area Line %2';
        TempSvcTaxAppllBuffer : Record "Service Tax Application Buffer" temporary;
        ServiceTaxExists : Boolean;
        Text16523 : TextConst ENU='The Applied Payment Document %1 should not have amount to apply greater than %2.',ENN='The Applied Payment Document %1 should not have amount to apply greater than %2.';
        Text16524 : TextConst ENU='Service Tax Advance Payment Document/s cannot be applied with non Service Tax Invoice/s.',ENN='Service Tax Advance Payment Document/s cannot be applied with non Service Tax Invoice/s.';
        Text16526 : TextConst ENU='Document Type %1 should not be applied against a Refund document %2 having service tax on advance payment.',ENN='Document Type %1 should not be applied against a Refund document %2 having service tax on advance payment.';
        Text16527 : TextConst ENU='Invoice/s and Payment/s documents cannot be applied as both have different Service Tax Rounding Precision/Type.',ENN='Invoice/s and Payment/s documents cannot be applied as both have different Service Tax Rounding Precision/Type.';
        Text16528 : TextConst ENU='Invoice/s and Payment/s documents cannot be applied as both have different Service Tax Group Codes.',ENN='Invoice/s and Payment/s documents cannot be applied as both have different Service Tax Group Codes.';
        Text16529 : TextConst ENU='Invoice/s and Payment/s documents cannot be applied as both have different Service Tax Registration Nos.',ENN='Invoice/s and Payment/s documents cannot be applied as both have different Service Tax Registration Nos.';
        Text16530 : TextConst ENU='Payment Document with ST Pure Agent and Service Tax on Advance Payment should be applied with invoice having check mark on ST Pure Agent.',ENN='Payment Document with ST Pure Agent and Service Tax on Advance Payment should be applied with invoice having check mark on ST Pure Agent.';
        Sales_Document___TestCaptionLbl : TextConst ENU='PROFORMA INVOICE',ENN='Sales Document - Test';
        CurrReport_PAGENOCaptionLbl : TextConst ENU='Page',ENN='Page';
        Ship_toCaptionLbl : TextConst ENU='Ship-to',ENN='Ship-to';
        Sell_toCaptionLbl : TextConst ENU='Sell-to',ENN='Sell-to';
        Bill_toCaptionLbl : TextConst ENU='Bill-to',ENN='Bill-to';
        Sales_Header___Posting_Date_CaptionLbl : TextConst ENU='Posting Date',ENN='Posting Date';
        Sales_Header___Document_Date_CaptionLbl : TextConst ENU='Document Date',ENN='Document Date';
        Sales_Header___Due_Date_CaptionLbl : TextConst ENU='Due Date',ENN='Due Date';
        Sales_Header___Pmt__Discount_Date_CaptionLbl : TextConst ENU='Pmt. Discount Date',ENN='Pmt. Discount Date';
        Sales_Header___Posting_Date__Control105CaptionLbl : TextConst ENU='Posting Date',ENN='Posting Date';
        Sales_Header___Document_Date__Control106CaptionLbl : TextConst ENU='Document Date',ENN='Document Date';
        Sales_Header___Order_Date_CaptionLbl : TextConst ENU='Order Date',ENN='Order Date';
        Sales_Header___Shipment_Date_CaptionLbl : TextConst ENU='Shipment Date',ENN='Shipment Date';
        Sales_Header___Due_Date__Control19CaptionLbl : TextConst ENU='Due Date',ENN='Due Date';
        Sales_Header___Pmt__Discount_Date__Control22CaptionLbl : TextConst ENU='Pmt. Discount Date',ENN='Pmt. Discount Date';
        Sales_Header___Posting_Date__Control131CaptionLbl : TextConst ENU='Posting Date',ENN='Posting Date';
        Sales_Header___Document_Date__Control132CaptionLbl : TextConst ENU='Document Date',ENN='Document Date';
        Sales_Header___Posting_Date__Control137CaptionLbl : TextConst ENU='Posting Date',ENN='Posting Date';
        Sales_Header___Document_Date__Control138CaptionLbl : TextConst ENU='Document Date',ENN='Document Date';
        Header_DimensionsCaptionLbl : TextConst ENU='Header Dimensions',ENN='Header Dimensions';
        ErrorText_Number_CaptionLbl : TextConst ENU='Warning!',ENN='Warning!';
        Unit_PriceCaptionLbl : TextConst ENU='Unit Price',ENN='Unit Price';
        Sales_Line___Line_Discount___CaptionLbl : TextConst ENU='Line Disc. %',ENN='Line Disc. %';
        Sales_Line___Line_Discount_Amount_CaptionLbl : TextConst ENU='Line Discount Amount',ENN='Line Discount Amount';
        AmountCaptionLbl : TextConst ENU='Amount',ENN='Amount';
        TempSalesLine__Inv__Discount_Amount_CaptionLbl : TextConst ENU='Inv. Discount Amount',ENN='Inv. Discount Amount';
        SubtotalCaptionLbl : TextConst ENU='Subtotal',ENN='Subtotal';
        TempSalesLine__Excise_Amount_CaptionLbl : TextConst ENU='Excise Amount',ENN='Excise Amount';
        TempSalesLine__Tax_Amount_CaptionLbl : TextConst ENU='Tax Amount',ENN='Tax Amount';
        ServiceTaxAmtCaptionLbl : TextConst ENU='Service Tax Amount',ENN='Service Tax Amount';
        Charges_AmountCaptionLbl : TextConst ENU='Charges Amount',ENN='Charges Amount';
        Other_Taxes_AmountCaptionLbl : TextConst ENU='Other Taxes Amount',ENN='Other Taxes Amount';
        ServiceTaxECessAmtCaptionLbl : TextConst ENU='Service TaxeCess Amount',ENN='Service TaxeCess Amount';
        TCS_AmountCaptionLbl : TextConst ENU='TCS Amount',ENN='TCS Amount';
        TCS_Amount__Applied_CaptionLbl : TextConst ENU='TCS Amount (Applied)',ENN='TCS Amount (Applied)';
        Svc_Tax_Amt__Applied_CaptionLbl : TextConst ENU='Svc Tax Amt (Applied)',ENN='Svc Tax Amt (Applied)';
        Svc_Tax_eCess_Amt__Applied_CaptionLbl : TextConst ENU='Svc Tax eCess Amt (Applied)',ENN='Svc Tax eCess Amt (Applied)';
        ServiceTaxSHECessAmtCaptionLbl : TextConst ENU='Service Tax SHECess Amt',ENN='Service Tax SHECess Amt';
        Svc_Tax_SHECess_Amt_Applied_CaptionLbl : TextConst ENU='Svc Tax SHECess Amt(Applied)',ENN='Svc Tax SHECess Amt(Applied)';
        VATDiscountAmountCaptionLbl : TextConst ENU='Payment Discount on VAT',ENN='Payment Discount on VAT';
        Line_DimensionsCaptionLbl : TextConst ENU='Line Dimensions',ENN='Line Dimensions';
        ErrorText_Number__Control97CaptionLbl : TextConst ENU='Warning!',ENN='Warning!';
        VATAmountLine__VAT_Amount__Control150CaptionLbl : TextConst ENU='VAT Amount',ENN='VAT Amount';
        VATAmountLine__VAT_Base__Control151CaptionLbl : TextConst ENU='VAT Base',ENN='VAT Base';
        VATAmountLine__VAT___CaptionLbl : TextConst ENU='VAT %',ENN='VAT %';
        VAT_Amount_SpecificationCaptionLbl : TextConst ENU='VAT Amount Specification',ENN='VAT Amount Specification';
        VATAmountLine__VAT_Identifier_CaptionLbl : TextConst ENU='VAT Identifier',ENN='VAT Identifier';
        VATAmountLine__Invoice_Discount_Amount__Control173CaptionLbl : TextConst ENU='Invoice Discount Amount',ENN='Invoice Discount Amount';
        VATAmountLine__Inv__Disc__Base_Amount__Control171CaptionLbl : TextConst ENU='Inv. Disc. Base Amount',ENN='Inv. Disc. Base Amount';
        VATAmountLine__Line_Amount__Control169CaptionLbl : TextConst ENU='Line Amount',ENN='Line Amount';
        ContinuedCaptionLbl : TextConst ENU='Continued',ENN='Continued';
        ContinuedCaption_Control155Lbl : TextConst ENU='Continued',ENN='Continued';
        TotalCaptionLbl : TextConst ENU='Total',ENN='Total';
        VALVATAmountLCY_Control88CaptionLbl : TextConst ENU='VAT Amount',ENN='VAT Amount';
        VALVATBaseLCY_Control165CaptionLbl : TextConst ENU='VAT Base',ENN='VAT Base';
        VATAmountLine__VAT____Control167CaptionLbl : TextConst ENU='VAT %',ENN='VAT %';
        VATAmountLine__VAT_Identifier__Control241CaptionLbl : TextConst ENU='VAT Identifier',ENN='VAT Identifier';
        ContinuedCaption_Control87Lbl : TextConst ENU='Continued',ENN='Continued';
        ContinuedCaption_Control244Lbl : TextConst ENU='Continued',ENN='Continued';
        TotalCaption_Control247Lbl : TextConst ENU='Total',ENN='Total';
        Item_Charge_SpecificationCaptionLbl : TextConst ENU='Item Charge Specification',ENN='Item Charge Specification';
        SalesLine2_DescriptionCaptionLbl : TextConst ENU='Description',ENN='Description';
        SalesLine2_QuantityCaptionLbl : TextConst ENU='Assignable Qty',ENN='Assignable Qty';
        ContinuedCaption_Control210Lbl : TextConst ENU='Continued',ENN='Continued';
        TotalCaption_Control220Lbl : TextConst ENU='Total',ENN='Total';
        ContinuedCaption_Control223Lbl : TextConst ENU='Continued',ENN='Continued';
        StructureLineDetails : Record "Structure Order Line Details";
        check : Report Check;
                    s : Decimal;
                    DescriptionLine : array [2] of Text[132];
                    s1 : Text[30];
                    desc : Text[30];
                    s2 : Text[30];
                    n : Integer;
                    c : Integer;
                    tax : Decimal;
                    taxamt : Decimal;
                    advance : Decimal;
                    Dutycap : Text[30];
                    dutyper : Text[30];
                    taxcap : Text[30];
                    vatcap : Text[30];
                    descrienable : Boolean;
                    ConsigneeCaptionLbl : Label 'Consignee';
        Sold_toCaptionLbl : Label 'Sold-to';
        With_Reference_to_the_above_purchase_order__we_here_by_inform_that_RDSO_inspection_is_completed__will_be_completed_in______daLbl : Label 'With Reference to the above purchase order ,we here by inform that RDSO inspection is completed/ will be completed in ____ days. Hence We request to kindly Release the payment at the earliest';
        Dear_Sir_CaptionLbl : Label 'Dear Sir,';
        Order_No_CaptionLbl : Label 'Order No.';
        Dt_CaptionLbl : Label 'Dt:';
        TIN_NO__28350166764CaptionLbl : Label 'TIN NO: 37350166764';
        CST_NO__28350166764CaptionLbl : Label 'CST NO: 37350166764(CENTRAL)';
        TOCaptionLbl : Label 'TO';
        DT_Caption_Control1000000014Lbl : Label 'DT:';
        PROFORMA_INVOICECaptionLbl : Label 'PROFORMA INVOICE';
        QtyCaptionLbl : Label 'Qty';
        S_NoCaptionLbl : Label 'S.No';
        Description_of_GoodsCaptionLbl : Label 'Description of Goods';
        RDSO_ChargesCaptionLbl : Label 'RDSO Charges';
        Grand_TotalCaptionLbl : Label 'Grand Total';
        for_EFFTRONICS_SYSTEMS_PVT__LTD__CaptionLbl : Label 'for EFFTRONICS SYSTEMS PVT. LTD.,';
        AUTHORISED_SIGNATORYCaptionLbl : Label 'AUTHORISED SIGNATORY';
        In_words_CaptionLbl : Label '(In words)';
        AdvanceCaptionLbl : Label 'Advance';
        NOTE_Lbl : Label '"NOTE :   "';
        Note1_Lbl : Label '"1.SALES TAX CHARGED IN THE ABOVE INVOICE AT 2% AGAINST ''C'' FORM,  IN CASE "';
        C_form_Lbl : Label '''C'' FORM NOT PROVIDED, REMAINING 3% SALES TAX WILL BE CHARGED EXTRA.';
        Note2_Lbl : Label '2. TRANSPORTATION EXTRA AT ACTUALS OR TO PAY.';
        LineAmountVar : Decimal;
        ExciseVar : Decimal;
        SalesLineTaxAmt : Decimal;
        AppliedServiceTaxSBCAmount : Decimal;
        AppliedServiceTaxSBCAmt : Decimal;
        ServiceTaxSBCAmt : Decimal;
        SumSvcTaxSBCAmount : Decimal;
        ServiceTaxSBCAmtCaptionLbl : Label 'SBC Amount';
        Svc_Tax_SBC_Amt__Applied_CaptionLbl : Label 'Svc Tax SBC Amt (Applied)';
        AppliedKKCessAmount : Decimal;
        AppliedKKCessAmt : Decimal;
        KKCessAmt : Decimal;
        SumKKCessAmount : Decimal;
        KKCessAmtCaptionLbl : Label 'KK Cess Amount';
        KK_Cess_Amt__Applied_CaptionLbl : Label 'KK Cess Amt (Applied)';
        STS : Record "Service Tax Setup";
        SL : Record "Sales Line";

    [LineStart(12233)]
    local procedure AddError(Text : Text[250]);
    begin
        ErrorCounter := ErrorCounter + 1;
        ErrorText[ErrorCounter] := Text;
    end;

    [LineStart(12237)]
    local procedure CheckShptLines(SalesLine2 : Record "Sales Line");
    var
        TempPostedDimSetEntry : Record "Dimension Set Entry" temporary;
    begin
        WITH SalesLine2 DO BEGIN
          IF ABS(RemQtyToBeInvoiced) > ABS("Qty. to Ship") THEN BEGIN
            SaleShptLine.RESET;
            CASE "Document Type" OF
              "Document Type"::Order:
                BEGIN
                  SaleShptLine.SETCURRENTKEY("Order No.","Order Line No.");
                  SaleShptLine.SETRANGE("Order No.","Document No.");
                  SaleShptLine.SETRANGE("Order Line No.","Line No.");
                END;
              "Document Type"::Invoice:
                BEGIN
                  SaleShptLine.SETRANGE("Document No.","Shipment No.");
                  SaleShptLine.SETRANGE("Line No.","Shipment Line No.");
                END;
            END;

            SaleShptLine.SETFILTER("Qty. Shipped Not Invoiced",'<>0');
            IF SaleShptLine.FIND('-') THEN
              REPEAT
                DimMgt.GetDimensionSet(TempPostedDimSetEntry,SaleShptLine."Dimension Set ID");
                IF NOT DimMgt.CheckDimIDConsistency(
                     TempDimSetEntry,TempPostedDimSetEntry,DATABASE::"Sales Line",DATABASE::"Sales Shipment Line")
                THEN
                  AddError(DimMgt.GetDocDimConsistencyErr);
                IF SaleShptLine."Sell-to Customer No." <> "Sell-to Customer No." THEN
                  AddError(
                    STRSUBSTNO(
                      Text024,
                      FIELDCAPTION("Sell-to Customer No.")));
                IF SaleShptLine.Type <> Type THEN
                  AddError(
                    STRSUBSTNO(
                      Text024,
                      FIELDCAPTION(Type)));
                IF SaleShptLine."No." <> "No." THEN
                  AddError(
                    STRSUBSTNO(
                      Text024,
                      FIELDCAPTION("No.")));
                IF SaleShptLine."Gen. Bus. Posting Group" <> "Gen. Bus. Posting Group" THEN
                  AddError(
                    STRSUBSTNO(
                      Text024,
                      FIELDCAPTION("Gen. Bus. Posting Group")));
                IF SaleShptLine."Gen. Prod. Posting Group" <> "Gen. Prod. Posting Group" THEN
                  AddError(
                    STRSUBSTNO(
                      Text024,
                      FIELDCAPTION("Gen. Prod. Posting Group")));
                IF SaleShptLine."Location Code" <> "Location Code" THEN
                  AddError(
                    STRSUBSTNO(
                      Text024,
                      FIELDCAPTION("Location Code")));
                IF SaleShptLine."Job No." <> "Job No." THEN
                  AddError(
                    STRSUBSTNO(
                      Text024,
                      FIELDCAPTION("Job No.")));

                IF (-SalesLine."Qty. to Invoice") * SaleShptLine.Quantity < 0 THEN
                  AddError(
                    STRSUBSTNO(
                      Text027,FIELDCAPTION("Qty. to Invoice")));

                QtyToBeInvoiced := RemQtyToBeInvoiced - SalesLine."Qty. to Ship";
                IF ABS(QtyToBeInvoiced) > ABS(SaleShptLine.Quantity - SaleShptLine."Quantity Invoiced") THEN
                  QtyToBeInvoiced := -(SaleShptLine.Quantity - SaleShptLine."Quantity Invoiced");
                RemQtyToBeInvoiced := RemQtyToBeInvoiced - QtyToBeInvoiced;
                SaleShptLine."Quantity Invoiced" := SaleShptLine."Quantity Invoiced" - QtyToBeInvoiced;
                SaleShptLine."Qty. Shipped Not Invoiced" :=
                  SaleShptLine.Quantity - SaleShptLine."Quantity Invoiced"
              UNTIL (SaleShptLine.NEXT = 0) OR (ABS(RemQtyToBeInvoiced) <= ABS("Qty. to Ship"))
            ELSE
              AddError(
                STRSUBSTNO(
                  Text026,
                  "Shipment Line No.",
                  "Shipment No."));
          END;

          IF ABS(RemQtyToBeInvoiced) > ABS("Qty. to Ship") THEN
            IF "Document Type" = "Document Type"::Invoice THEN
               AddError(
                 STRSUBSTNO(
                   Text036,
                   "Shipment No."));
        END;
        n:=n+1;
        //IF (SalesLine."Qty. to Ship"=0) OR (SalesLine."Unit Price"=0) THEN
        IF (TempSalesLine."Qty. to Ship"=0) OR (TempSalesLine."Unit Price"=0) THEN BEGIN
          c:=1;
          n:=n-c;
          CurrReport.SKIP;
        END;

        IF(TempSalesLine."Tax Area Code"='SALES CST') THEN BEGIN
          taxcap:='CST';
          IF (TempSalesLine."Tax %"=2)   THEN BEGIN
            desc:='(Against Form-C)';
            tax:=tax+ROUND(((TempSalesLine."Qty. to Ship")*(TempSalesLine."Unit Price")+(TempSalesLine."Excise Amount"))*2/100,1);
            s1:='2%';
          END;
          IF (TempSalesLine."Tax %"=3)   THEN BEGIN
            desc:='(Against Form-C)';
            tax:=tax+ROUND(((TempSalesLine."Qty. to Ship")*(TempSalesLine."Unit Price")+(TempSalesLine."Excise Amount"))*3/100,1);
            s1:='3%';
          END;
          IF (TempSalesLine."Tax %"=12.5) THEN BEGIN
            desc:='';
            s1:='12.5%';
            tax:=tax+ROUND(((TempSalesLine."Qty. to Ship")*(TempSalesLine."Unit Price")+(TempSalesLine."Excise Amount"))*12.5/100,1);
          END;
          IF (TempSalesLine."Tax %"=4)   THEN BEGIN
            desc:='';
            tax:=tax+ROUND(((TempSalesLine."Qty. to Ship")*(TempSalesLine."Unit Price")+(TempSalesLine."Excise Amount"))*3/100,1);
            s1:='4%';
          END;
        END ELSE
          s1:='';

        IF TempSalesLine."Tax Amount"=0 THEN BEGIN
          s1:='';
          desc:='';
        END;

        IF (TempSalesLine."Tax Area Code"='SALES VAT') THEN BEGIN
           taxcap:='VAT';
         IF(TempSalesLine."Tax %"=4) THEN
          //s2:='4%';
          s1:='4%';
         IF(TempSalesLine."Tax %"=5) THEN
          //s2:='5%';
          s1:='5%';
         IF(TempSalesLine."Tax %"=14.5) THEN
          //s2:='14.5%';
          s1:='14.5%';
         IF(TempSalesLine."Tax %"=12.5) THEN
          //s2:='12.5%';
          s1:='12.5%';
        END ELSE
         //s2:='';
         s1:='';

        IF "Sales Header".Structure<>'SERVICE' THEN BEGIN
          s:=s+ROUND(ROUND(TempSalesLine."Line Amount",1)+ROUND(TempSalesLine."Excise Amount",1)+
          ROUND(TempSalesLine."RDSO Charges",1)+TempSalesLine."Tax Amount",1);
        END ELSE
          s:=s+ROUND(ROUND(TempSalesLine."Line Amount",1)+ROUND(TempSalesLine."Service Tax Amount",1)+
             ROUND(TempSalesLine."Service Tax eCess Amount",1)+ROUND(TempSalesLine."Service Tax eCess Amount",1)/2); //anil

        check.InitTextVariable;
        check.FormatNoText(DescriptionLine,ROUND(s-advance-1,1),'');
        taxamt:=tax;
    end;

    [LineStart(12394)]
    local procedure CheckRcptLines(SalesLine2 : Record "Sales Line");
    var
        TempPostedDimSetEntry : Record "Dimension Set Entry" temporary;
    begin
        WITH SalesLine2 DO BEGIN
          IF ABS(RemQtyToBeInvoiced) > ABS("Return Qty. to Receive") THEN BEGIN
            ReturnRcptLine.RESET;
            CASE "Document Type" OF
              "Document Type"::"Return Order":
                BEGIN
                  ReturnRcptLine.SETCURRENTKEY("Return Order No.","Return Order Line No.");
                  ReturnRcptLine.SETRANGE("Return Order No.","Document No.");
                  ReturnRcptLine.SETRANGE("Return Order Line No.","Line No.");
                END;
              "Document Type"::"Credit Memo":
                BEGIN
                  ReturnRcptLine.SETRANGE("Document No.","Return Receipt No.");
                  ReturnRcptLine.SETRANGE("Line No.","Return Receipt Line No.");
                END;
            END;

            ReturnRcptLine.SETFILTER("Return Qty. Rcd. Not Invd.",'<>0');
            IF ReturnRcptLine.FIND('-') THEN
              REPEAT
                DimMgt.GetDimensionSet(TempPostedDimSetEntry,ReturnRcptLine."Dimension Set ID");
                IF NOT DimMgt.CheckDimIDConsistency(
                     TempDimSetEntry,TempPostedDimSetEntry,DATABASE::"Sales Line",DATABASE::"Return Receipt Line")
                THEN
                  AddError(DimMgt.GetDocDimConsistencyErr);
                IF ReturnRcptLine."Sell-to Customer No." <> "Sell-to Customer No." THEN
                  AddError(
                    STRSUBSTNO(
                      Text038,
                      FIELDCAPTION("Sell-to Customer No.")));
                IF ReturnRcptLine.Type <> Type THEN
                  AddError(
                    STRSUBSTNO(
                      Text038,
                      FIELDCAPTION(Type)));
                IF ReturnRcptLine."No." <> "No." THEN
                  AddError(
                    STRSUBSTNO(
                      Text038,
                      FIELDCAPTION("No.")));
                IF ReturnRcptLine."Gen. Bus. Posting Group" <> "Gen. Bus. Posting Group" THEN
                  AddError(
                    STRSUBSTNO(
                      Text038,
                      FIELDCAPTION("Gen. Bus. Posting Group")));
                IF ReturnRcptLine."Gen. Prod. Posting Group" <> "Gen. Prod. Posting Group" THEN
                  AddError(
                    STRSUBSTNO(
                      Text038,
                      FIELDCAPTION("Gen. Prod. Posting Group")));
                IF ReturnRcptLine."Location Code" <> "Location Code" THEN
                  AddError(
                    STRSUBSTNO(
                      Text038,
                      FIELDCAPTION("Location Code")));
                IF ReturnRcptLine."Job No." <> "Job No." THEN
                  AddError(
                    STRSUBSTNO(
                      Text038,
                      FIELDCAPTION("Job No.")));

                IF SalesLine."Qty. to Invoice" * ReturnRcptLine.Quantity < 0 THEN
                  AddError(
                    STRSUBSTNO(
                      Text039,FIELDCAPTION("Qty. to Invoice")));
                QtyToBeInvoiced := RemQtyToBeInvoiced - SalesLine."Return Qty. to Receive";
                IF ABS(QtyToBeInvoiced) > ABS(ReturnRcptLine.Quantity - ReturnRcptLine."Quantity Invoiced") THEN
                  QtyToBeInvoiced := ReturnRcptLine.Quantity - ReturnRcptLine."Quantity Invoiced";
                RemQtyToBeInvoiced := RemQtyToBeInvoiced - QtyToBeInvoiced;
                ReturnRcptLine."Quantity Invoiced" := ReturnRcptLine."Quantity Invoiced" + QtyToBeInvoiced;
                ReturnRcptLine."Return Qty. Rcd. Not Invd." :=
                  ReturnRcptLine.Quantity - ReturnRcptLine."Quantity Invoiced";
              UNTIL (ReturnRcptLine.NEXT = 0) OR (ABS(RemQtyToBeInvoiced) <= ABS("Return Qty. to Receive"))
            ELSE
              AddError(
                STRSUBSTNO(
                  Text025,
                  "Return Receipt Line No.",
                  "Return Receipt No."));
          END;

          IF ABS(RemQtyToBeInvoiced) > ABS("Return Qty. to Receive") THEN
            IF "Document Type" = "Document Type"::"Credit Memo" THEN
              AddError(
                STRSUBSTNO(
                  Text037,
                  "Return Receipt No."));
        END;
    end;

    [LineStart(12484)]
    local procedure IsInvtPosting() : Boolean;
    var
        SalesLine : Record "Sales Line";
    begin
        WITH "Sales Header" DO BEGIN
          SalesLine.SETRANGE("Document Type","Document Type");
          SalesLine.SETRANGE("Document No.","No.");
          SalesLine.SETFILTER(Type,'%1|%2',SalesLine.Type::Item,SalesLine.Type::"Charge (Item)");
          IF SalesLine.ISEMPTY THEN
            EXIT(FALSE);
          IF Ship THEN BEGIN
            SalesLine.SETFILTER("Qty. to Ship",'<>%1',0);
            IF NOT SalesLine.ISEMPTY THEN
              EXIT(TRUE);
          END;
          IF Receive THEN BEGIN
            SalesLine.SETFILTER("Return Qty. to Receive",'<>%1',0);
            IF NOT SalesLine.ISEMPTY THEN
              EXIT(TRUE);
          END;
          IF Invoice THEN BEGIN
            SalesLine.SETFILTER("Qty. to Invoice",'<>%1',0);
            IF NOT SalesLine.ISEMPTY THEN
              EXIT(TRUE);
          END;
        END;
    end;

    [LineStart(12508)]
    procedure AddDimToTempLine(SalesLine : Record "Sales Line");
    var
        SourceCodeSetup : Record "Source Code Setup";
        TableID : array [10] of Integer;
        No : array [10] of Code[20];
    begin
        SourceCodeSetup.GET;

        WITH SalesLine DO BEGIN
          TableID[1] := DimMgt.TypeToTableID3(Type);
          No[1] := "No.";
          TableID[2] := DATABASE::Job;
          No[2] := "Job No.";
          TableID[3] := DATABASE::"Responsibility Center";
          No[3] := "Responsibility Center";

          "Shortcut Dimension 1 Code" := '';
          "Shortcut Dimension 2 Code" := '';
          "Dimension Set ID" :=
            DimMgt.GetDefaultDimID(TableID,No,SourceCodeSetup.Sales,"Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
              "Dimension Set ID",DATABASE::Customer);
        END;
    end;

    [LineStart(12526)]
    procedure CheckTotalExciseAmount();
    var
        ExciseCenvatClaim : Record "Excise Cenvat Claim";
    begin
        ExciseCenvatClaim.RESET;
        ExciseCenvatClaim.SETRANGE("Journal Template Name",GenJnlLine."Journal Template Name");
        ExciseCenvatClaim.SETRANGE("Journal Batch Name",GenJnlLine."Journal Batch Name");
        ExciseCenvatClaim.SETRANGE("Line No.",GenJnlLine."Line No.");
        ExciseCenvatClaim.SETRANGE("Document No.",GenJnlLine."Document No.");
        IF ExciseCenvatClaim.FINDFIRST THEN BEGIN

          IF (ExciseCenvatClaim."BED Amount"  <> ExciseCenvatClaim."PLA BED Amount") OR
             (ExciseCenvatClaim."AED(GSI) Amount" <> ExciseCenvatClaim."PLA AED(GSI) Amount") OR
             (ExciseCenvatClaim."AED(TTA) Amount" <> ExciseCenvatClaim."PLA AED(TTA) Amount") OR
             (ExciseCenvatClaim."SED Amount" <> ExciseCenvatClaim."PLA SED Amount") OR
             (ExciseCenvatClaim."SAED Amount" <> ExciseCenvatClaim."PLA SAED Amount")OR
             (ExciseCenvatClaim."CESS Amount" <> ExciseCenvatClaim."PLA CESS Amount") OR
             (ExciseCenvatClaim."NCCD Amount" <> ExciseCenvatClaim."PLA NCCD Amount") OR
             (ExciseCenvatClaim."eCess Amount" <> ExciseCenvatClaim."PLA eCess Amount") OR
             (ExciseCenvatClaim."SHE Cess Amount" <> ExciseCenvatClaim."PLA SHE Cess Amount") OR
             (ExciseCenvatClaim."ADET Amount" <> ExciseCenvatClaim."PLA ADET Amount") OR
             (ExciseCenvatClaim."ADE Amount" <> ExciseCenvatClaim."PLA ADE Amount") OR
             (ExciseCenvatClaim."Excise Charge Amount" <> ExciseCenvatClaim."PLA Excise Charge Amount") THEN
             AddError(Text16501);
        END;
    end;

    [LineStart(12549)]
    procedure FilterAppliedEntries();
    var
        OldCustLedgEntry : Record "Cust. Ledger Entry";
        ServiceTaxEntry : Record "Service Tax Entry";
        Cust : Record Customer;
        Currency : Record Currency;
        GenLedgSetup : Record "General Ledger Setup";
        SalesLine3 : Record "Sales Line";
        GenJnlApply : Codeunit "Gen. Jnl.-Apply";
        ApplyingDate : Date;
        AccType : Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset";
        AmountforAppl : Decimal;
        AppliedAmount : Decimal;
        AppliedAmountLCY : Decimal;
        RemainingAmount : Decimal;
        AmountToBeApplied : Decimal;
        AppliedServiceTaxAmount : Decimal;
        AppliedServiceTaxEcessAmount : Decimal;
        AppliedServiceTaxSHEcessAmount : Decimal;
    begin
        WITH "Sales Header" DO BEGIN
          //IF "Sales Line"."TCS Nature of Collection" = '' THEN BEGIN
          //  AmountforAppl :=
          //    ROUND(TempSalesLine."Line Amount" - TempSalesLine."Inv. Discount Amount" + TempSalesLine."Excise Amount" +
          //    TempSalesLine."Tax Amount" + TempSalesLine."Service Tax Amount" + ChargesAmount -
          //    TempSalesLine."Bal. TDS/TCS Including SHECESS" +
          //    TempSalesLine."Service Tax eCess Amount" + TempSalesLine."Service Tax SHE Cess Amount");
          //END ELSE BEGIN
          //  AmountforAppl :=
          //    ROUND(TempSalesLine."Line Amount" - TempSalesLine."Inv. Discount Amount" + TempSalesLine."Excise Amount" +
          //    TempSalesLine."Tax Amount" +  TempSalesLine."Service Tax Amount" + Amount +
          //    TempSalesLine."Bal. TDS/TCS Including SHECESS" +
          //    TempSalesLine."Service Tax eCess Amount" + TempSalesLine."Service Tax SHE Cess Amount");
          //END;
          AmountforAppl := TempSalesLine."Amount To Customer";
          ApplyingDate := "Posting Date";
          Cust.GET("Bill-to Customer No.");
          IF "Applies-to Doc. No." <> '' THEN BEGIN
            OldCustLedgEntry.RESET;
            OldCustLedgEntry.SETCURRENTKEY("Document No.");
            OldCustLedgEntry.SETRANGE("Document No.","Applies-to Doc. No.");
            OldCustLedgEntry.SETRANGE("Document Type","Applies-to Doc. Type");
            OldCustLedgEntry.SETRANGE("Customer No.","Bill-to Customer No.");
            OldCustLedgEntry.SETRANGE(Open,TRUE);
            OldCustLedgEntry.FINDFIRST;
            //OldCustLedgEntry.TESTFIELD(Positive,NOT NewCVLedgEntryBuf.Positive);
            IF NOT OldCustLedgEntry."Serv. Tax on Advance Payment" THEN
              EXIT;
            IF OldCustLedgEntry."Posting Date" > ApplyingDate THEN
              ApplyingDate := OldCustLedgEntry."Posting Date";
            GenJnlApply.CheckAgainstApplnCurrency("Currency Code",OldCustLedgEntry."Currency Code",AccType::Vendor,TRUE);
            OldCustLedgEntry.CALCFIELDS("Remaining Amount");
            IF "Currency Code" <> '' THEN BEGIN
              Currency.GET("Currency Code");
              FindAmtForAppln(OldCustLedgEntry,AppliedAmount,AppliedAmountLCY,
                OldCustLedgEntry."Remaining Amount",Currency."Amount Rounding Precision",AmountforAppl);
            END ELSE BEGIN
              GenLedgSetup.GET;
              FindAmtForAppln(OldCustLedgEntry,AppliedAmount,AppliedAmountLCY,
                OldCustLedgEntry."Remaining Amount",GenLedgSetup."Amount Rounding Precision",AmountforAppl);
            END;

            AppliedAmountLCY := ABS(AppliedAmountLCY);
            CheckAppliedInvHasServTax(OldCustLedgEntry);
            CheckRoundingParameters(OldCustLedgEntry);
            CheckRefundApplicationOnline(OldCustLedgEntry);
            CheckApplofSTpureAgntOnline(OldCustLedgEntry);

            IF TempSalesLine."Service Tax Amount" <> 0 THEN BEGIN
              ServiceTaxEntry.RESET;
              ServiceTaxEntry.SETRANGE("Transaction No.",OldCustLedgEntry."Transaction No.");
              ServiceTaxEntry.SETRANGE("Service Tax Group Code","Sales Line"."Service Tax Group");
              ServiceTaxEntry.SETRANGE("Service Tax Registration No.","Sales Line"."Service Tax Registration No.");
              ServiceTaxEntry.SETRANGE("ST Pure Agent",FALSE);
              IF ServiceTaxEntry.FINDSET THEN
                REPEAT
                  RemainingAmount := 0;
                  AmountToBeApplied := 0;
                  RemainingAmount := ABS(ServiceTaxEntry."Amount Including Service Tax" - ServiceTaxEntry."Amount Received/Paid");
                  IF RemainingAmount > 0 THEN BEGIN
                    IF RemainingAmount >= ABS(AppliedAmountLCY) THEN
                      AmountToBeApplied := ABS(AppliedAmountLCY)
                    ELSE
                      AmountToBeApplied := RemainingAmount;
                  END;
                  AppliedAmountLCY := AppliedAmountLCY - AmountToBeApplied;
                  CheckAppliedCustPayment(OldCustLedgEntry,AmountToBeApplied,AmountforAppl);
                  AmountforAppl := AmountforAppl - AmountToBeApplied;
                  AppliedServiceTaxAmount :=
                    ((AmountToBeApplied / ServiceTaxEntry."Amount Including Service Tax") *
                      (ServiceTaxEntry."Service Tax Amount" + ServiceTaxEntry."eCess Amount" +
                        ServiceTaxEntry."SHE Cess Amount" + ServiceTaxEntry."Service Tax SBC Amount" +
                         ServiceTaxEntry."KK Cess Amount"));
                  AppliedServiceTaxEcessAmount :=
                    ((AppliedServiceTaxAmount * ServiceTaxEntry."eCess Amount") /
                      (ServiceTaxEntry."Service Tax Amount" + ServiceTaxEntry."eCess Amount" +
                        ServiceTaxEntry."SHE Cess Amount" + ServiceTaxEntry."Service Tax SBC Amount" +
                         ServiceTaxEntry."KK Cess Amount"));
                  AppliedServiceTaxSHEcessAmount :=
                    ((AppliedServiceTaxAmount * ServiceTaxEntry."SHE Cess Amount") /
                      (ServiceTaxEntry."Service Tax Amount" + ServiceTaxEntry."eCess Amount" +
                        ServiceTaxEntry."SHE Cess Amount" + ServiceTaxEntry."Service Tax SBC Amount" +
                         ServiceTaxEntry."KK Cess Amount"));
                  AppliedServiceTaxSBCAmount :=
                    ((AppliedServiceTaxAmount * ServiceTaxEntry."Service Tax SBC Amount") /
                      (ServiceTaxEntry."Service Tax Amount" + ServiceTaxEntry."eCess Amount" +
                        ServiceTaxEntry."SHE Cess Amount" + ServiceTaxEntry."Service Tax SBC Amount" +
                         ServiceTaxEntry."KK Cess Amount"));
                  AppliedKKCessAmount :=
                    ((AppliedServiceTaxAmount * ServiceTaxEntry."KK Cess Amount") /
                      (ServiceTaxEntry."Service Tax Amount" + ServiceTaxEntry."eCess Amount" +
                        ServiceTaxEntry."SHE Cess Amount" + ServiceTaxEntry."Service Tax SBC Amount" +
                         ServiceTaxEntry."KK Cess Amount"));
                  AppliedServiceTaxSHEcessAmount := ROUND(AppliedServiceTaxSHEcessAmount);
                  AppliedServiceTaxEcessAmount := ROUND(AppliedServiceTaxEcessAmount);
                  AppliedServiceTaxSBCAmount := ROUND(AppliedServiceTaxSBCAmount);
                  AppliedKKCessAmount := ROUND(AppliedKKCessAmount);
                  AppliedServiceTaxAmount := ROUND(AppliedServiceTaxAmount - AppliedServiceTaxEcessAmount -
                   AppliedServiceTaxSHEcessAmount - AppliedServiceTaxSBCAmount - AppliedKKCessAmount);

                  AppliedServiceTaxSHECessAmt += AppliedServiceTaxSHEcessAmount;
                  AppliedServiceTaxECessAmt += AppliedServiceTaxEcessAmount;
                  AppliedServiceTaxAmt += AppliedServiceTaxAmount;
                  AppliedServiceTaxSBCAmt += AppliedServiceTaxSBCAmount;
                  AppliedKKCessAmt += AppliedKKCessAmount;
                UNTIL (ServiceTaxEntry.NEXT = 0) OR (AppliedAmountLCY = 0);
            END;
          END ELSE IF ("Applies-to ID" <> '') THEN BEGIN
            // Find the first old entry (Invoice) which the new entry (Payment) should apply to
            OldCustLedgEntry.RESET;
            OldCustLedgEntry.SETCURRENTKEY("Customer No.","Applies-to ID",Open,Positive,"Due Date");
            OldCustLedgEntry.SETRANGE("Customer No.","Bill-to Customer No.");
            OldCustLedgEntry.SETRANGE("Applies-to ID","Applies-to ID");
            OldCustLedgEntry.SETRANGE(Open,TRUE);
            IF NOT (Cust."Application Method" = Cust."Application Method"::"Apply to Oldest") THEN
              OldCustLedgEntry.SETFILTER("Amount to Apply",'<>%1',0);
            IF Cust."Application Method" = Cust."Application Method"::"Apply to Oldest" THEN
              OldCustLedgEntry.SETFILTER("Posting Date",'..%1',GenJnlLine."Posting Date");

            // Check Cust Ledger Entry and add to Temp.
            IF SalesSetup."Appln. between Currencies" = SalesSetup."Appln. between Currencies"::None THEN
              OldCustLedgEntry.SETRANGE("Currency Code","Currency Code");

            IF OldCustLedgEntry.FINDSET(FALSE,FALSE) THEN
              REPEAT
                IF OldCustLedgEntry."Serv. Tax on Advance Payment" THEN BEGIN
                  IF GenJnlApply.CheckAgainstApplnCurrency(
                    "Currency Code",OldCustLedgEntry."Currency Code",AccType::Vendor,FALSE)
                  THEN BEGIN
                    IF (OldCustLedgEntry."Posting Date" > ApplyingDate) AND (OldCustLedgEntry."Applies-to ID" <> '') THEN
                      ApplyingDate := OldCustLedgEntry."Posting Date";
                    OldCustLedgEntry.CALCFIELDS("Remaining Amount");
                    IF "Currency Code" <> '' THEN BEGIN
                      Currency.GET("Currency Code");
                      FindAmtForAppln(OldCustLedgEntry,AppliedAmount,AppliedAmountLCY,
                        OldCustLedgEntry."Remaining Amount",Currency."Amount Rounding Precision",AmountforAppl);
                    END ELSE BEGIN
                      GenLedgSetup.GET;
                      FindAmtForAppln(OldCustLedgEntry,AppliedAmount,AppliedAmountLCY,
                      OldCustLedgEntry."Remaining Amount",GenLedgSetup."Amount Rounding Precision",AmountforAppl);
                    END;

                    AppliedAmountLCY := ABS(AppliedAmountLCY);
                    CheckAppliedInvHasServTax(OldCustLedgEntry);
                    CheckRoundingParameters(OldCustLedgEntry);
                    CheckRefundApplicationOnline(OldCustLedgEntry);
                    CheckApplofSTpureAgntOnline(OldCustLedgEntry);

                    IF TempSalesLine."Service Tax Amount" <> 0 THEN BEGIN
                      ServiceTaxEntry.RESET;
                      ServiceTaxEntry.SETRANGE("Transaction No.",OldCustLedgEntry."Transaction No.");
                      ServiceTaxEntry.SETRANGE("Service Tax Group Code","Sales Line"."Service Tax Group");
                      ServiceTaxEntry.SETRANGE("Service Tax Registration No.","Sales Line"."Service Tax Registration No.");
                      ServiceTaxEntry.SETRANGE("ST Pure Agent",FALSE);
                      IF ServiceTaxEntry.FINDSET THEN
                        REPEAT
                          RemainingAmount := 0;
                          AmountToBeApplied := 0;
                          RemainingAmount := ABS(ServiceTaxEntry."Amount Including Service Tax" - ServiceTaxEntry."Amount Received/Paid");
                          IF RemainingAmount > 0 THEN BEGIN
                            IF RemainingAmount >= ABS(AppliedAmountLCY) THEN
                              AmountToBeApplied := ABS(AppliedAmountLCY)
                            ELSE
                              AmountToBeApplied := RemainingAmount;
                          END;
                          AppliedAmountLCY := AppliedAmountLCY - AmountToBeApplied;
                          CheckAppliedCustPayment(OldCustLedgEntry,AmountToBeApplied,AmountforAppl);
                          AmountforAppl := AmountforAppl - AmountToBeApplied;
                          AppliedServiceTaxAmount :=
                            ((AmountToBeApplied / ServiceTaxEntry."Amount Including Service Tax") *
                              (ServiceTaxEntry."Service Tax Amount" + ServiceTaxEntry."eCess Amount" +
                                ServiceTaxEntry."SHE Cess Amount" + ServiceTaxEntry."Service Tax SBC Amount" +
                                 ServiceTaxEntry."KK Cess Amount"));
                          AppliedServiceTaxEcessAmount :=
                            ((AppliedServiceTaxAmount * ServiceTaxEntry."eCess Amount") /
                              (ServiceTaxEntry."Service Tax Amount" + ServiceTaxEntry."eCess Amount" +
                                ServiceTaxEntry."SHE Cess Amount" + ServiceTaxEntry."Service Tax SBC Amount" +
                                 ServiceTaxEntry."KK Cess Amount"));
                          AppliedServiceTaxSHEcessAmount :=
                            ((AppliedServiceTaxAmount * ServiceTaxEntry."SHE Cess Amount") /
                              (ServiceTaxEntry."Service Tax Amount" + ServiceTaxEntry."eCess Amount" +
                                ServiceTaxEntry."SHE Cess Amount" + ServiceTaxEntry."Service Tax SBC Amount" +
                                 ServiceTaxEntry."KK Cess Amount"));
                          AppliedServiceTaxSBCAmount :=
                            ((AppliedServiceTaxAmount * ServiceTaxEntry."Service Tax SBC Amount") /
                              (ServiceTaxEntry."Service Tax Amount" + ServiceTaxEntry."eCess Amount" +
                                ServiceTaxEntry."SHE Cess Amount" + ServiceTaxEntry."Service Tax SBC Amount" +
                                 ServiceTaxEntry."KK Cess Amount"));
                          AppliedKKCessAmount :=
                            ((AppliedServiceTaxAmount * ServiceTaxEntry."KK Cess Amount") /
                              (ServiceTaxEntry."Service Tax Amount" + ServiceTaxEntry."eCess Amount" +
                                ServiceTaxEntry."SHE Cess Amount" + ServiceTaxEntry."Service Tax SBC Amount" +
                                 ServiceTaxEntry."KK Cess Amount"));

                          AppliedServiceTaxSHEcessAmount := ROUND(AppliedServiceTaxSHEcessAmount);
                          AppliedServiceTaxEcessAmount := ROUND(AppliedServiceTaxEcessAmount);
                          AppliedServiceTaxSBCAmount := ROUND(AppliedServiceTaxSBCAmount);
                          AppliedKKCessAmount := ROUND(AppliedKKCessAmount);
                          AppliedServiceTaxAmount :=
                            ROUND(AppliedServiceTaxAmount - AppliedServiceTaxEcessAmount - AppliedServiceTaxSHEcessAmount -
                             AppliedServiceTaxSBCAmount - AppliedKKCessAmount);

                          AppliedServiceTaxSHECessAmt += AppliedServiceTaxSHEcessAmount;
                          AppliedServiceTaxECessAmt += AppliedServiceTaxEcessAmount;
                          AppliedServiceTaxAmt += AppliedServiceTaxAmount;
                          AppliedServiceTaxSBCAmt += AppliedServiceTaxSBCAmount;
                          AppliedKKCessAmt += AppliedKKCessAmount;
                        UNTIL (ServiceTaxEntry.NEXT = 0) OR (AppliedAmountLCY = 0);
                    END;
                  END;
                END;
              UNTIL OldCustLedgEntry.NEXT = 0;
          END;
        END;
        SalesLine3.COPYFILTERS("Sales Line");
        SalesLine3 := "Sales Line";
        IF SalesLine3.NEXT = 0 THEN BEGIN
          AppliedServiceTaxSHECessAmt := RoundServiceTaxPrecision(AppliedServiceTaxSHECessAmt);
          AppliedServiceTaxECessAmt := RoundServiceTaxPrecision(AppliedServiceTaxECessAmt);
          AppliedServiceTaxAmt := RoundServiceTaxPrecision(AppliedServiceTaxAmt);
          AppliedServiceTaxSBCAmt := RoundServiceTaxPrecision(AppliedServiceTaxSBCAmt);
          AppliedKKCessAmt := RoundServiceTaxPrecision(AppliedKKCessAmt);

          ServiceTaxAmt -= ROUND(AppliedServiceTaxAmt);
          ServiceTaxECessAmt -= ROUND(AppliedServiceTaxECessAmt);
          ServiceTaxSHECessAmt -= ROUND(AppliedServiceTaxSHECessAmt);
          ServiceTaxSBCAmt -= ROUND(AppliedServiceTaxSBCAmt);
          KKCessAmt -= ROUND(AppliedKKCessAmt);

          ServiceTaxAmt := RoundServiceTaxPrecision(ServiceTaxAmt);
          ServiceTaxECessAmt := RoundServiceTaxPrecision(ServiceTaxECessAmt);
          ServiceTaxSHECessAmt := RoundServiceTaxPrecision(ServiceTaxSHECessAmt);
          ServiceTaxSBCAmt := RoundServiceTaxPrecision(ServiceTaxSBCAmt);
          KKCessAmt := RoundServiceTaxPrecision(KKCessAmt);
        END;
        IF ServiceTaxSHECessAmt < 0 THEN
          ServiceTaxSHECessAmt := 0;
        IF ServiceTaxECessAmt < 0 THEN
          ServiceTaxECessAmt := 0;
        IF ServiceTaxAmt < 0 THEN
          ServiceTaxAmt := 0;
        // PS39773.end
        IF ServiceTaxSBCAmt < 0 THEN
          ServiceTaxSBCAmt := 0;
        IF KKCessAmt < 0 THEN
          KKCessAmt := 0;
    end;

    [LineStart(12797)]
    local procedure FindAmtForAppln(OldCustLedgEntry : Record "Cust. Ledger Entry";var AppliedAmount : Decimal;var AppliedAmountLCY : Decimal;OldRemainingAmtBeforeAppln : Decimal;ApplnRoundingPrecision : Decimal;AmountforAppl : Decimal);
    var
        GenJnlPostLine2 : Codeunit "Gen. Jnl.-Post Line";
        OldAppliedAmount : Decimal;
    begin
        // PS39773.begin
        IF OldCustLedgEntry.GETFILTER(Positive) <> '' THEN BEGIN
          IF OldCustLedgEntry."Amount to Apply" <> 0 THEN
            AppliedAmount := -OldCustLedgEntry."Amount to Apply"
          ELSE
            AppliedAmount := -OldCustLedgEntry."Remaining Amount";
        END ELSE BEGIN
          IF (OldCustLedgEntry."Amount to Apply" <> 0) THEN BEGIN
            IF (CheckCalcPmtDisc(OldCustLedgEntry,ApplnRoundingPrecision,FALSE,FALSE,AmountforAppl) AND
              (ABS(OldCustLedgEntry."Amount to Apply") >=
              ABS(OldCustLedgEntry."Remaining Amount" - OldCustLedgEntry."Remaining Pmt. Disc. Possible")) AND
              (ABS(AmountforAppl) >=
              (ABS(OldCustLedgEntry."Amount to Apply" - OldCustLedgEntry."Remaining Pmt. Disc. Possible")))) OR
              (OldCustLedgEntry."Accepted Pmt. Disc. Tolerance")
            THEN BEGIN
              AppliedAmount := -OldCustLedgEntry."Remaining Amount";
              OldCustLedgEntry."Accepted Pmt. Disc. Tolerance" := FALSE;
            END ELSE BEGIN
              IF ABS(AmountforAppl) <= ABS(OldCustLedgEntry."Amount to Apply") THEN
                AppliedAmount := AmountforAppl
              ELSE
                AppliedAmount := -OldCustLedgEntry."Amount to Apply";
            END;
          END ELSE
            IF ABS(AmountforAppl) < ABS(OldCustLedgEntry."Remaining Amount") THEN
              AppliedAmount := AmountforAppl
            ELSE
              AppliedAmount := -OldCustLedgEntry."Remaining Amount";
        END;

        IF SalesHeader."Currency Code" = OldCustLedgEntry."Currency Code" THEN BEGIN
          AppliedAmountLCY := ROUND(AppliedAmount / OldCustLedgEntry."Original Currency Factor");
          OldAppliedAmount := AppliedAmount;
        END ELSE BEGIN
          // Management of posting in multiple currencies
          IF AppliedAmount = -OldCustLedgEntry."Remaining Amount" THEN
            OldAppliedAmount := -OldCustLedgEntry."Remaining Amount"
          ELSE
            OldAppliedAmount :=
              CurrExchRate.ExchangeAmount(
                AppliedAmount,SalesHeader."Currency Code",
                OldCustLedgEntry."Currency Code",SalesHeader."Posting Date");

          IF SalesHeader."Currency Code" <> '' THEN
            AppliedAmountLCY := ROUND(OldAppliedAmount / OldCustLedgEntry."Original Currency Factor")
          ELSE
            AppliedAmountLCY := ROUND(AppliedAmount / SalesHeader."Currency Factor");
        END;
        // PS39773.end
    end;

    [LineStart(12848)]
    local procedure CheckCalcPmtDisc(var OldCustLedgEntry : Record "Cust. Ledger Entry";ApplnRoundingPrecision : Decimal;CheckFilter : Boolean;CheckAmount : Boolean;AmountforAppl : Decimal) : Boolean;
    begin
        // PS39773.begin
        IF ((OldCustLedgEntry."Document Type" = OldCustLedgEntry."Document Type"::Invoice) AND
          (SalesHeader."Posting Date" <= OldCustLedgEntry."Pmt. Discount Date"))
        THEN BEGIN
          IF CheckFilter THEN BEGIN
            IF CheckAmount THEN BEGIN
              IF (OldCustLedgEntry.GETFILTER(Positive) <> '') OR
                (ABS(AmountforAppl) + ApplnRoundingPrecision >=
                ABS(OldCustLedgEntry."Remaining Amount" - OldCustLedgEntry."Remaining Pmt. Disc. Possible"))
              THEN
                EXIT(TRUE)
              ELSE
                EXIT(FALSE);
            END ELSE BEGIN
              IF (OldCustLedgEntry.GETFILTER(Positive) <> '')
              THEN
                EXIT(TRUE)
              ELSE
                EXIT(FALSE);
            END;
          END ELSE BEGIN
            IF CheckAmount THEN BEGIN
              IF (ABS(AmountforAppl) + ApplnRoundingPrecision >=
                ABS(OldCustLedgEntry."Remaining Amount" - OldCustLedgEntry."Remaining Pmt. Disc. Possible"))
              THEN
                EXIT(TRUE)
              ELSE
                EXIT(FALSE);
            END ELSE
              EXIT(TRUE);
          END;
          EXIT(TRUE);
        END ELSE
          EXIT(FALSE);
        // PS39773.end
    end;

    [LineStart(12885)]
    procedure RoundServiceTaxPrecision(ServiceTaxAmount : Decimal) : Decimal;
    var
        ServiceTaxRoundingDirection : Text[1];
        ServiceTaxRoundingPrecision : Decimal;
    begin
        // PS39773.begin
        CASE "Sales Header"."Service Tax Rounding Type" OF
          "Sales Header"."Service Tax Rounding Type"::Nearest:
            ServiceTaxRoundingDirection := '=';
          "Sales Header"."Service Tax Rounding Type"::Up:
            ServiceTaxRoundingDirection := '>';
          "Sales Header"."Service Tax Rounding Type"::Down:
            ServiceTaxRoundingDirection := '<';
        END;
        IF "Sales Header"."Service Tax Rounding Precision" <> 0 THEN
          ServiceTaxRoundingPrecision := "Sales Header"."Service Tax Rounding Precision"
        ELSE
          ServiceTaxRoundingPrecision := 0.01;
        EXIT(ROUND(ServiceTaxAmount,ServiceTaxRoundingPrecision,ServiceTaxRoundingDirection));
        // PS39773.end
    end;

    [LineStart(12902)]
    procedure CheckAppliedInvHasServTax(OldCustLedgEntry : Record "Cust. Ledger Entry");
    var
        SvcTaxEntry : Record "Service Tax Entry";
        SalesLine3 : Record "Sales Line";
    begin
        // PS39773.begin
        IF OldCustLedgEntry."Document Type" = OldCustLedgEntry."Document Type"::Payment THEN BEGIN
          IF NOT OldCustLedgEntry."Serv. Tax on Advance Payment" THEN
            EXIT;
          IF NOT ServiceTaxExists THEN BEGIN
            ServiceTaxEntry.RESET;
            ServiceTaxEntry.SETRANGE("Transaction No.",OldCustLedgEntry."Transaction No.");
            IF ServiceTaxEntry.FINDFIRST THEN
              AddError(Text16524);
          END;

          IF ServiceTaxExists THEN BEGIN
            SvcTaxEntry.RESET;
            SvcTaxEntry.SETRANGE("Transaction No.",OldCustLedgEntry."Transaction No.");
            IF SvcTaxEntry.FINDFIRST THEN BEGIN
              SalesLine3.RESET;
              SalesLine3.SETRANGE("Document Type","Sales Line"."Document Type");
              SalesLine3.SETRANGE("Document No.","Sales Line"."Document No.");
              SalesLine3.SETRANGE("Service Tax Group",SvcTaxEntry."Service Tax Group Code");
              IF NOT SalesLine3.FINDFIRST THEN
                AddError(Text16528);
              SalesLine3.SETRANGE("Service Tax Group");
              SalesLine3.SETRANGE("Service Tax Registration No.",SvcTaxEntry."Service Tax Registration No.");
              IF NOT SalesLine3.FINDFIRST THEN
                AddError(Text16529);
            END;
          END;
        END;
        // PS39773.end
    end;

    [LineStart(12933)]
    procedure CheckRefundApplicationOnline(OldCustLedgEntry : Record "Cust. Ledger Entry");
    begin
        // PS39773.begin
        IF (OldCustLedgEntry."Serv. Tax on Advance Payment") AND
          (OldCustLedgEntry."Document Type" = OldCustLedgEntry."Document Type"::Refund)
        THEN
          AddError(STRSUBSTNO(Text16526,"Sales Header"."Document Type",OldCustLedgEntry."Document No."));
        // PS39773.end
    end;

    [LineStart(12941)]
    procedure CheckRoundingParameters(OldCustLedgEntry : Record "Cust. Ledger Entry");
    var
        SvcTaxEntry : Record "Service Tax Entry";
    begin
        // PS39773.begin
        IF TempSalesLine."Service Tax Amount" = 0 THEN
          EXIT;
        SvcTaxEntry.RESET;
        SvcTaxEntry.SETRANGE("Transaction No.",OldCustLedgEntry."Transaction No.");
        IF NOT SvcTaxEntry.FINDFIRST THEN
          EXIT;
        IF (SvcTaxEntry."Service Tax Amount" + SvcTaxEntry."eCess Amount" + SvcTaxEntry."SHE Cess Amount" +
          SvcTaxEntry."Service Tax SBC Amount" + SvcTaxEntry."KK Cess Amount") = 0 THEN
          EXIT;
        IF ("Sales Header"."Service Tax Rounding Precision" <> SvcTaxEntry."Service Tax Rounding Precision") OR
          ("Sales Header"."Service Tax Rounding Type" <> SvcTaxEntry."Service Tax Rounding Type")
        THEN
          AddError(Text16527);
        // PS39773.end
    end;

    [LineStart(12958)]
    procedure CheckAppliedCustPayment(OldCustLedgEntry : Record "Cust. Ledger Entry";AmountToBeApplied : Decimal;AmountToBeComparedWith : Decimal);
    var
        SvcTaxEntry : Record "Service Tax Entry";
        EntryInserted : Boolean;
    begin
        // PS39773.begin
        IF NOT OldCustLedgEntry."Serv. Tax on Advance Payment" THEN
          EXIT;
        SvcTaxEntry.RESET;
        SvcTaxEntry.SETRANGE("Transaction No.",OldCustLedgEntry."Transaction No.");
        SvcTaxEntry.SETRANGE("Service Tax Group Code","Sales Line"."Service Tax Group");
        SvcTaxEntry.SETRANGE("Service Tax Registration No.","Sales Line"."Service Tax Registration No.");
        IF SvcTaxEntry.FINDFIRST THEN BEGIN
          TempSvcTaxAppllBuffer.Type := TempSvcTaxAppllBuffer.Type::Sale;
          TempSvcTaxAppllBuffer."Document No." := OldCustLedgEntry."Document No.";
          TempSvcTaxAppllBuffer."Service Tax Group Code" := SvcTaxEntry."Service Tax Group Code";
          TempSvcTaxAppllBuffer."Service Tax Registration No." := SvcTaxEntry."Service Tax Registration No.";
          TempSvcTaxAppllBuffer."Transaction No." := OldCustLedgEntry."Transaction No.";
          TempSvcTaxAppllBuffer."Amount to Apply (LCY)" := AmountToBeComparedWith;
          EntryInserted := TempSvcTaxAppllBuffer.INSERT;

          IF TempSvcTaxAppllBuffer."Amount to Apply (LCY)" < ABS(OldCustLedgEntry."Amount to Apply") THEN
            AddError(STRSUBSTNO(Text16523,OldCustLedgEntry."Document No.",-TempSvcTaxAppllBuffer."Amount to Apply (LCY)"));
          TempSvcTaxAppllBuffer."Amount to Apply (LCY)" -= AmountToBeApplied;
          TempSvcTaxAppllBuffer.MODIFY;
        END;
        // PS39773.end
    end;

    [LineStart(12982)]
    procedure CheckApplofSTpureAgntOnline(OldCustLedgEntry : Record "Cust. Ledger Entry");
    var
        ServTaxEntry : Record "Service Tax Entry";
    begin
        // PS39773.begin
        IF (OldCustLedgEntry."Document Type" = OldCustLedgEntry."Document Type":: Payment) THEN BEGIN
          IF (OldCustLedgEntry."Serv. Tax on Advance Payment") THEN BEGIN
            ServTaxEntry.RESET;
            ServTaxEntry.SETRANGE("Transaction No.",OldCustLedgEntry."Transaction No.");
            IF ServTaxEntry.FINDFIRST THEN
              IF ServTaxEntry."ST Pure Agent" <> "Sales Header"."ST Pure Agent" THEN
                AddError(Text16530);
          END;
        END;
        // PS39773.end
    end;

    [LineStart(12995)]
    procedure InitializeRequest(NewShipReceiveOnNextPostReq : Boolean;NewInvOnNextPostReq : Boolean;NewShowDim : Boolean;NewShowCostAssignment : Boolean);
    begin
        ShipReceiveOnNextPostReq := NewShipReceiveOnNextPostReq;
        InvOnNextPostReq := NewInvOnNextPostReq;
        ShowDim := NewShowDim;
        ShowCostAssignment := NewShowCostAssignment;
    end;
}

