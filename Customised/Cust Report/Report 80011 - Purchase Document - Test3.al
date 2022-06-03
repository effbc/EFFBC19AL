report 80011 "Purchase Document - Test3"
{
    // version NAVW17.00,NAVIN7.00,KKC

    // <changelog>
    //     <change releaseversion="IN6.00"/>
    // <add id="IN0063" dev="Ravinder" date="2007-12-07" area="EXCREFUND" releaseversion="IN5.00.01" feature="25199"
    // >Code Added for excise refund</add>
    // <add id="IN0061" dev="Garima" date="2007-11-29" area="CWIP" releaseversion="IN5.00.01" feature="25195"
    // >Code added to incorporate CWIP related error messages</add>
    // <change id="IN0090" dev="AUGMENTUM" date="2008-05-28" area="Purchase"
    //      baseversion="IN5.00.01" releaseversion="IN6.0" feature="NAVCORS20361">
    //      Report transformation.
    //     </change>
    // <add id="PS36451" dev="Vineet" date="2008-08-07" area="VAT" releaseversion="IN6.00" feature="36451"
    // > Code are added to show warning for Tax Type</add>
    // <add id="PS39773" dev="Anup" date="2008-11-15" area="STAPPL" releaseversion="IN6.00.01" feature="39773"
    // >Functions FilterAppliedEntries,FindAmtForAppln,CheckCalcPmtDisc,RoundServiceTaxPrecision,CheckAppliedInvHasServTax,
    // CheckInputServiceDistOnline,CheckRefundApplicationOnline,CheckRoundingParameters,CheckAppliedVendPayment added</add>
    // <change id="IN0091" dev="AUGMENTUM" date="2009-03-06" area="Purchase"
    //      baseversion="IN6.00" releaseversion="IN6.00.01" feature="NAVCORS33715">
    //      Added a hidden textbox in the old client, in order to break the page in the new client.
    //      Added a function in the new client to show some textboxes that only displayed in the first page.
    //      Refined the display effect.</change>
    // </changelog>
    DefaultLayout = RDLC;
    RDLCLayout = './Purchase Document - Test3.rdlc';

    CaptionML = ENU = 'Purchase Document - Test',
                ENN = 'Purchase Document - Test';

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = WHERE(Document Type=FILTER(<>Quote));
            RequestFilterFields = "Document Type","No.";
            ReqFilterHeading = 'Purchase Document';
            column(Purchase_Header_Document_Type;"Document Type")
            {
            }
            column(Purchase_Header_No_;"No.")
            {
            }
            column(Choice_Value;Choice)
            {
            }
            column(HeaderTextDesc;HeaderTextDesc)
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
            column(CompanyInfo__Fax_No__;CompanyInfo."Fax No.")
            {
            }
            column(CompanyInfo__Home_Page_;CompanyInfo."Home Page")
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
            column(E__Mail_Caption;E__Mail_CaptionLbl)
            {
            }
            column(purchase_efftronics_comCaption;purchase_efftronics_comCaptionLbl)
            {
            }
            column(TINNo;TNo)
            {
            }
            column(CSTNo;CSTNo)
            {
            }
            column(TINNoCaption;TINNoCaption)
            {
            }
            column(CSTNoCaption;CSTNoCaption)
            {
            }
            column(LinesCount;LinesCount)
            {
            }
            column(C_E__RegN__No__AAACE4879QXM001__E_C_Code_No_AAACE_4879Q_XM001_Range_IV_divn_VijayaLbl;C_E__RegN__No__AAACE4879QXM001__E_C_Code_No_AAACE_4879Q_XM001_Range_IV_divn_VijayaLbl)
            {
            }
            column(Tariff_Heading_No__CaptionLbl;Tariff_Heading_No__CaptionLbl)
            {
            }
            column(ECCCaptionLbl;ECCCaptionLbl)
            {
            }
            column(CentralCaptionLbl;CentralCaptionLbl)
            {
            }
            column(Tarrif_Heading_No;"Tarrif Heading No")
            {
            }
            column(DebitNoteAmtDesc;DebitNoteAmtDesc)
            {
            }
            column(UOM_Caption;UOM)
            {
            }
            dataitem(PageCounter;"Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number=CONST(1));
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
                column(STRSUBSTNO_Text018_PurchHeaderFilter_;STRSUBSTNO(Text018,PurchHeaderFilter))
                {
                }
                column(PurchHeaderFilter;PurchHeaderFilter)
                {
                }
                column(ReceiveInvoiceText;ReceiveInvoiceText)
                {
                }
                column(ShipInvoiceText;ShipInvoiceText)
                {
                }
                column(Purchase_Header___Sell_to_Customer_No__;"Purchase Header"."Sell-to Customer No.")
                {
                }
                column(ShipToAddr_1_;ShipToAddr[1])
                {
                }
                column(ShipToAddr_2_;ShipToAddr[2])
                {
                }
                column(ShipToAddr_3_;ShipToAddr[3])
                {
                }
                column(ShipToAddr_4_;ShipToAddr[4])
                {
                }
                column(ShipToAddr_5_;ShipToAddr[5])
                {
                }
                column(ShipToAddr_6_;ShipToAddr[6])
                {
                }
                column(ShipToAddr_7_;ShipToAddr[7])
                {
                }
                column(ShipToAddr_8_;ShipToAddr[8])
                {
                }
                column(FORMAT__Purchase_Header___Document_Type____________Purchase_Header___No__;FORMAT("Purchase Header"."Document Type") + ' ' + "Purchase Header"."No.")
                {
                }
                column(BuyFromAddr_8_;BuyFromAddr[8])
                {
                }
                column(BuyFromAddr_7_;BuyFromAddr[7])
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
                column(BuyFromAddr_2_;BuyFromAddr[2])
                {
                }
                column(BuyFromAddr_1_;BuyFromAddr[1])
                {
                }
                column(Vendor_ECC_No;Vendor_ECC_No)
                {
                }
                column(Vendor_TIN_No;Vendor_TIN_No)
                {
                }
                column(Vendor_CST_No;Vendor_CST_No)
                {
                }
                column(Purchase_Header___Buy_from_Vendor_No__;"Purchase Header"."Buy-from Vendor No.")
                {
                }
                column(Purchase_Header___Document_Type_;FORMAT("Purchase Header"."Document Type",0,2))
                {
                }
                column(Purchase_Header___VAT_Base_Discount___;"Purchase Header"."VAT Base Discount %")
                {
                }
                column(PricesInclVATtxt;PricesInclVATtxt)
                {
                }
                column(ShowItemChargeAssgnt;ShowItemChargeAssgnt)
                {
                }
                column(PayToAddr_1_;PayToAddr[1])
                {
                }
                column(PayToAddr_2_;PayToAddr[2])
                {
                }
                column(PayToAddr_3_;PayToAddr[3])
                {
                }
                column(PayToAddr_4_;PayToAddr[4])
                {
                }
                column(PayToAddr_5_;PayToAddr[5])
                {
                }
                column(PayToAddr_6_;PayToAddr[6])
                {
                }
                column(PayToAddr_7_;PayToAddr[7])
                {
                }
                column(PayToAddr_8_;PayToAddr[8])
                {
                }
                column(Purchase_Header___Pay_to_Vendor_No__;"Purchase Header"."Pay-to Vendor No.")
                {
                }
                column(Purchase_Header___Purchaser_Code_;"Purchase Header"."Purchaser Code")
                {
                }
                column(Purchase_Header___Your_Reference_;"Purchase Header"."Your Reference")
                {
                }
                column(Purchase_Header___Vendor_Posting_Group_;"Purchase Header"."Vendor Posting Group")
                {
                }
                column(Purchase_Header___Posting_Date_;FORMAT("Purchase Header"."Posting Date"))
                {
                }
                column(Purchase_Header___Document_Date_;FORMAT("Purchase Header"."Document Date"))
                {
                }
                column(Purchase_Header___Prices_Including_VAT_;"Purchase Header"."Prices Including VAT")
                {
                }
                column(Purchase_Header___Payment_Terms_Code_;"Purchase Header"."Payment Terms Code")
                {
                }
                column(Purchase_Header___Payment_Discount___;"Purchase Header"."Payment Discount %")
                {
                }
                column(Purchase_Header___Due_Date_;FORMAT("Purchase Header"."Due Date"))
                {
                }
                column(Purchase_Header___Pmt__Discount_Date_;FORMAT("Purchase Header"."Pmt. Discount Date"))
                {
                }
                column(Purchase_Header___Shipment_Method_Code_;"Purchase Header"."Shipment Method Code")
                {
                }
                column(Purchase_Header___Payment_Method_Code_;"Purchase Header"."Payment Method Code")
                {
                }
                column(Purchase_Header___Vendor_Order_No__;"Purchase Header"."Vendor Order No.")
                {
                }
                column(Purchase_Header___Vendor_Shipment_No__;"Purchase Header"."Vendor Shipment No.")
                {
                }
                column(Purchase_Header___Vendor_Invoice_No__;"Purchase Header"."Vendor Invoice No.")
                {
                }
                column(Purchase_Header___Vendor_Posting_Group__Control104;"Purchase Header"."Vendor Posting Group")
                {
                }
                column(Purchase_Header___Posting_Date__Control106;FORMAT("Purchase Header"."Posting Date"))
                {
                }
                column(Purchase_Header___Document_Date__Control107;FORMAT("Purchase Header"."Document Date"))
                {
                }
                column(Purchase_Header___Order_Date_;FORMAT("Purchase Header"."Order Date"))
                {
                }
                column(Purchase_Header___Expected_Receipt_Date_;FORMAT("Purchase Header"."Expected Receipt Date"))
                {
                }
                column(Purchase_Header___Prices_Including_VAT__Control212;"Purchase Header"."Prices Including VAT")
                {
                }
                column(Purchase_Header___Payment_Discount____Control14;"Purchase Header"."Payment Discount %")
                {
                }
                column(Purchase_Header___Payment_Terms_Code__Control18;"Purchase Header"."Payment Terms Code")
                {
                }
                column(Purchase_Header___Due_Date__Control19;FORMAT("Purchase Header"."Due Date"))
                {
                }
                column(Purchase_Header___Pmt__Discount_Date__Control22;FORMAT("Purchase Header"."Pmt. Discount Date"))
                {
                }
                column(Purchase_Header___Payment_Method_Code__Control30;"Purchase Header"."Payment Method Code")
                {
                }
                column(Purchase_Header___Shipment_Method_Code__Control33;"Purchase Header"."Shipment Method Code")
                {
                }
                column(Purchase_Header___Vendor_Shipment_No___Control34;"Purchase Header"."Vendor Shipment No.")
                {
                }
                column(Purchase_Header___Vendor_Invoice_No___Control35;"Purchase Header"."Vendor Invoice No.")
                {
                }
                column(Purchase_Header___Vendor_Posting_Group__Control110;"Purchase Header"."Vendor Posting Group")
                {
                }
                column(Purchase_Header___Posting_Date__Control112;FORMAT("Purchase Header"."Posting Date"))
                {
                }
                column(Purchase_Header___Document_Date__Control113;FORMAT("Purchase Header"."Document Date"))
                {
                }
                column(Purchase_Header___Prices_Including_VAT__Control214;"Purchase Header"."Prices Including VAT")
                {
                }
                column(Purchase_Header___Vendor_Cr__Memo_No__;"Purchase Header"."Vendor Cr. Memo No.")
                {
                }
                column(Purchase_Header___Applies_to_Doc__Type_;"Purchase Header"."Applies-to Doc. Type")
                {
                }
                column(Purchase_Header___Applies_to_Doc__No__;"Purchase Header"."Applies-to Doc. No.")
                {
                }
                column(Purchase_Header___Vendor_Posting_Group__Control128;"Purchase Header"."Vendor Posting Group")
                {
                }
                column(Purchase_Header___Posting_Date__Control130;FORMAT("Purchase Header"."Posting Date"))
                {
                }
                column(Purchase_Header___Document_Date__Control131;FORMAT("Purchase Header"."Document Date"))
                {
                }
                column(Purchase_Header___Prices_Including_VAT__Control216;"Purchase Header"."Prices Including VAT")
                {
                }
                column(PageCounter_Number;Number)
                {
                }
                column(Purchase_Document___TestCaption;Purchase_Document___TestCaptionLbl)
                {
                }
                column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
                {
                }
                column(Purchase_Header___Sell_to_Customer_No__Caption;"Purchase Header".FIELDCAPTION("Sell-to Customer No."))
                {
                }
                column(Ship_toCaption;Ship_toCaptionLbl)
                {
                }
                column(Buy_fromCaption;Buy_fromCaptionLbl)
                {
                }
                column(ToCaption_lbl;ToCaption_lbl)
                {
                }
                column(SubTotalCaption_New;SubTotalCaption)
                {
                }
                column(Purchase_Header___Buy_from_Vendor_No__Caption;"Purchase Header".FIELDCAPTION("Buy-from Vendor No."))
                {
                }
                column(Pay_toCaption;Pay_toCaptionLbl)
                {
                }
                column(Purchase_Header___Pay_to_Vendor_No__Caption;"Purchase Header".FIELDCAPTION("Pay-to Vendor No."))
                {
                }
                column(Purchase_Header___Purchaser_Code_Caption;"Purchase Header".FIELDCAPTION("Purchaser Code"))
                {
                }
                column(Purchase_Header___Your_Reference_Caption;"Purchase Header".FIELDCAPTION("Your Reference"))
                {
                }
                column(Purchase_Header___Vendor_Posting_Group_Caption;"Purchase Header".FIELDCAPTION("Vendor Posting Group"))
                {
                }
                column(Purchase_Header___Posting_Date_Caption;Purchase_Header___Posting_Date_CaptionLbl)
                {
                }
                column(Purchase_Header___Document_Date_Caption;Purchase_Header___Document_Date_CaptionLbl)
                {
                }
                column(Purchase_Header___Prices_Including_VAT_Caption;"Purchase Header".FIELDCAPTION("Prices Including VAT"))
                {
                }
                column(Purchase_Header___Payment_Terms_Code_Caption;"Purchase Header".FIELDCAPTION("Payment Terms Code"))
                {
                }
                column(Purchase_Header___Payment_Discount___Caption;"Purchase Header".FIELDCAPTION("Payment Discount %"))
                {
                }
                column(Purchase_Header___Due_Date_Caption;Purchase_Header___Due_Date_CaptionLbl)
                {
                }
                column(Purchase_Header___Pmt__Discount_Date_Caption;Purchase_Header___Pmt__Discount_Date_CaptionLbl)
                {
                }
                column(Purchase_Header___Shipment_Method_Code_Caption;"Purchase Header".FIELDCAPTION("Shipment Method Code"))
                {
                }
                column(Purchase_Header___Payment_Method_Code_Caption;"Purchase Header".FIELDCAPTION("Payment Method Code"))
                {
                }
                column(Purchase_Header___Vendor_Order_No__Caption;"Purchase Header".FIELDCAPTION("Vendor Order No."))
                {
                }
                column(Purchase_Header___Vendor_Shipment_No__Caption;"Purchase Header".FIELDCAPTION("Vendor Shipment No."))
                {
                }
                column(Purchase_Header___Vendor_Invoice_No__Caption;"Purchase Header".FIELDCAPTION("Vendor Invoice No."))
                {
                }
                column(Purchase_Header___Vendor_Posting_Group__Control104Caption;"Purchase Header".FIELDCAPTION("Vendor Posting Group"))
                {
                }
                column(Purchase_Header___Posting_Date__Control106Caption;Purchase_Header___Posting_Date__Control106CaptionLbl)
                {
                }
                column(Purchase_Header___Document_Date__Control107Caption;Purchase_Header___Document_Date__Control107CaptionLbl)
                {
                }
                column(Purchase_Header___Order_Date_Caption;Purchase_Header___Order_Date_CaptionLbl)
                {
                }
                column(Purchase_Header___Expected_Receipt_Date_Caption;Purchase_Header___Expected_Receipt_Date_CaptionLbl)
                {
                }
                column(Purchase_Header___Prices_Including_VAT__Control212Caption;"Purchase Header".FIELDCAPTION("Prices Including VAT"))
                {
                }
                column(Purchase_Header___Payment_Discount____Control14Caption;"Purchase Header".FIELDCAPTION("Payment Discount %"))
                {
                }
                column(Purchase_Header___Payment_Terms_Code__Control18Caption;"Purchase Header".FIELDCAPTION("Payment Terms Code"))
                {
                }
                column(Purchase_Header___Due_Date__Control19Caption;Purchase_Header___Due_Date__Control19CaptionLbl)
                {
                }
                column(Purchase_Header___Pmt__Discount_Date__Control22Caption;Purchase_Header___Pmt__Discount_Date__Control22CaptionLbl)
                {
                }
                column(Purchase_Header___Payment_Method_Code__Control30Caption;"Purchase Header".FIELDCAPTION("Payment Method Code"))
                {
                }
                column(Purchase_Header___Shipment_Method_Code__Control33Caption;"Purchase Header".FIELDCAPTION("Shipment Method Code"))
                {
                }
                column(Purchase_Header___Vendor_Shipment_No___Control34Caption;"Purchase Header".FIELDCAPTION("Vendor Shipment No."))
                {
                }
                column(Purchase_Header___Vendor_Invoice_No___Control35Caption;"Purchase Header".FIELDCAPTION("Vendor Invoice No."))
                {
                }
                column(Purchase_Header___Vendor_Posting_Group__Control110Caption;"Purchase Header".FIELDCAPTION("Vendor Posting Group"))
                {
                }
                column(Purchase_Header___Posting_Date__Control112Caption;Purchase_Header___Posting_Date__Control112CaptionLbl)
                {
                }
                column(Purchase_Header___Document_Date__Control113Caption;Purchase_Header___Document_Date__Control113CaptionLbl)
                {
                }
                column(Purchase_Header___Prices_Including_VAT__Control214Caption;"Purchase Header".FIELDCAPTION("Prices Including VAT"))
                {
                }
                column(Purchase_Header___Vendor_Cr__Memo_No__Caption;"Purchase Header".FIELDCAPTION("Vendor Cr. Memo No."))
                {
                }
                column(Purchase_Header___Applies_to_Doc__Type_Caption;"Purchase Header".FIELDCAPTION("Applies-to Doc. Type"))
                {
                }
                column(Purchase_Header___Applies_to_Doc__No__Caption;"Purchase Header".FIELDCAPTION("Applies-to Doc. No."))
                {
                }
                column(Purchase_Header___Vendor_Posting_Group__Control128Caption;"Purchase Header".FIELDCAPTION("Vendor Posting Group"))
                {
                }
                column(Purchase_Header___Posting_Date__Control130Caption;Purchase_Header___Posting_Date__Control130CaptionLbl)
                {
                }
                column(Purchase_Header___Document_Date__Control131Caption;Purchase_Header___Document_Date__Control131CaptionLbl)
                {
                }
                column(Purchase_Header___Prices_Including_VAT__Control216Caption;"Purchase Header".FIELDCAPTION("Prices Including VAT"))
                {
                }
                column(DateCaptionlbl;DateCaptionlbl)
                {
                }
                column(Purchase_Header__Vendor_Cr_Memo_No;"Purchase Header"."Vendor Cr. Memo No.")
                {
                }
                column(Rupees_Words_Caption;Rupees_Words_Caption)
                {
                }
                column(Certify_Caption;Certify_Caption)
                {
                }
                dataitem(DimensionLoop1;"Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number=FILTER(1..));
                    column(DimText;DimText)
                    {
                    }
                    column(DimensionLoop1_Number;Number)
                    {
                    }
                    column(DimText_Control163;DimText)
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
                    dataitem("Purchase Line";"Purchase Line")
                    {
                        DataItemLink = Document Type=FIELD(Document Type), Document No.=FIELD(No.);
                        DataItemLinkReference = "Purchase Header";
                        DataItemTableView = SORTING(Document Type,Document No.,Line No.);
                        column(Purchase_Line_Document_Type;"Document Type")
                        {
                        }
                        column(Purchase_Line_Document_No_;"Document No.")
                        {
                        }
                        column(Purchase_Line_Line_No_;"Line No.")
                        {
                        }

                        trigger OnPreDataItem();
                        begin
                            IF FIND('+') THEN
                              OrigMaxLineNo := "Line No.";
                            CurrReport.BREAK;
                        end;
                    }
                    dataitem(RoundLoop;"Integer")
                    {
                        DataItemTableView = SORTING(Number);
                        column(Total_Caption;Total_CaptionLbl)
                        {
                        }
                        column(Total;LineTotAmt-TempPurchLine."Inv. Discount Amount"-TempPurchLine."Bal. TDS Including SHE CESS" - TempPurchLine."Work Tax Amount")
                        {
                        }
                        column(TestVar1;TestVar1)
                        {
                        }
                        column(QtyToHandleCaption;QtyToHandleCaption)
                        {
                        }
                        column(Purchase_Line__Type;"Purchase Line".Type)
                        {
                        }
                        column(Purchase_Line___Line_Amount_;"Purchase Line"."Line Amount")
                        {
                            AutoFormatExpression = "Purchase Line"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(Purchase_Line___Line_Discount_Amount_;"Purchase Line"."Line Discount Amount")
                        {
                        }
                        column(Purchase_Line___Allow_Invoice_Disc__;"Purchase Line"."Allow Invoice Disc.")
                        {
                        }
                        column(Purchase_Line___Line_Discount___;"Purchase Line"."Line Discount %")
                        {
                        }
                        column(Purchase_Line___Direct_Unit_Cost_;"Purchase Line"."Direct Unit Cost")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 2;
                        }
                        column(Purchase_Line___Qty__to_Invoice_;"Purchase Line"."Qty. to Invoice")
                        {
                        }
                        column(QtyToHandle;QtyToHandle)
                        {
                            DecimalPlaces = 0:5;
                        }
                        column(Purchase_Line__Quantity;"Purchase Line".Quantity)
                        {
                        }
                        column(Purchase_Line__Description;"Purchase Line".Description)
                        {
                        }
                        column(Purchase_Line___No__;"Purchase Line"."No.")
                        {
                        }
                        column(Purchase_Line___Line_No__;"Purchase Line"."Line No.")
                        {
                        }
                        column(Purchase_Line___Inv__Discount_Amount_;"Purchase Line"."Inv. Discount Amount")
                        {
                        }
                        column(UOM;"Purchase Line"."Unit of Measure Code")
                        {
                        }
                        column(Tax_Area_Code;"Purchase Line"."Tax Area Code")
                        {
                        }
                        column(Tax_Pernctg;"Purchase Line"."Tax %")
                        {
                        }
                        column(SerialNo;SerialNo)
                        {
                        }
                        column(NewSerialNo;NewSerialNo)
                        {
                        }
                        column(AllowInvDisctxt;AllowInvDisctxt)
                        {
                        }
                        column(ShowDim;ShowDim)
                        {
                        }
                        column(TempPurchLine__Inv__Discount_Amount_;-TempPurchLine."Inv. Discount Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TempPurchLine__Line_Amount_;TempPurchLine."Line Amount")
                        {
                            AutoFormatExpression = "Purchase Line"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalText;TotalText)
                        {
                        }
                        column(TempPurchLine__Line_Amount____TempPurchLine__Inv__Discount_Amount_;TempPurchLine."Line Amount" - TempPurchLine."Inv. Discount Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalInclVATText;TotalInclVATText)
                        {
                        }
                        column(TotIncTaxes;TotIncTaxes)
                        {
                        }
                        column(TempPurchLine__Line_Amount____TempPurchLine__Inv__Discount_Amount____VATAmount;NetTotal)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(SumInvDiscountAmount;SumInvDiscountAmount)
                        {
                        }
                        column(SumLineAmount;SumLineAmount)
                        {
                        }
                        column(LineTotAmt;LineTotAmt)
                        {
                        }
                        column(LineTotAmt_Ex_Tax;LineTotAmt_Ex_Tax)
                        {
                        }
                        column(Tot_Amt_To_Vendor;Tot_Amt_To_Vendor)
                        {
                        }
                        column(TaxBaseAmt;TaxBaseAmt)
                        {
                        }
                        column(descri_1__;descri[1])
                        {
                        }
                        column(TempPurchLine__Excise_Amount_;TempPurchLine."Excise Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TempPurchLine__Tax_Amount_;TempPurchLine."Tax Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(ServiceTaxAmt;ServiceTaxAmt)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TempPurchLine__Total_TDS_Including_SHE_CESS_;-TempPurchLine."Total TDS Including SHE CESS")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TempPurchLine__Work_Tax_Amount_;-TempPurchLine."Work Tax Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(OtherTaxesAmount;OtherTaxesAmount)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(ChargesAmount;Charges)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(ServiceTaxECessAmt;ServiceTaxECessAmt)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(AppliedServiceTaxAmt;AppliedServiceTaxAmt)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(AppliedServiceTaxECessAmt;AppliedServiceTaxECessAmt)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(ServiceTaxSHECessAmt;ServiceTaxSHECessAmt)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(AppliedServiceTaxSHECessAmt;AppliedServiceTaxSHECessAmt)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(ServiceTaxSBCAmt;ServiceTaxSBCAmt)
                        {
                        }
                        column(AppliedServiceTaxSBCAmount;AppliedServiceTaxSBCAmount)
                        {
                        }
                        column(KKCessAmt;KKCessAmt)
                        {
                        }
                        column(AppliedKKCessAmount;AppliedKKCessAmount)
                        {
                        }
                        column(SumExciseAmount;SumExciseAmount)
                        {
                        }
                        column(SumTaxAmount;SumTaxAmount)
                        {
                        }
                        column(SumSvcTaxAmount;SumSvcTaxAmount)
                        {
                        }
                        column(SumSvcTaxeCessAmount;SumSvcTaxeCessAmount)
                        {
                        }
                        column(SumSvcTaxSHECESSAmount;SumSvcTaxSHECESSAmount)
                        {
                        }
                        column(SumSvcTaxSBCAmount;SumSvcTaxSBCAmount)
                        {
                        }
                        column(SumKKCessAmount;SumKKCessAmount)
                        {
                        }
                        column(SumAmountToVendor;SumAmountToVendor)
                        {
                        }
                        column(SumTotalTDSIncSHECESS;SumTotalTDSIncSHECESS)
                        {
                        }
                        column(SumWorkTaxAmount;SumWorkTaxAmount)
                        {
                        }
                        column(VATDiscountAmount;-VATDiscountAmount)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmount;VATAmount)
                        {
                        }
                        column(TotalInclVATText_Control155;TotalInclVATText)
                        {
                        }
                        column(VATAmountLine_VATAmountText_Control151;VATAmountLine.VATAmountText)
                        {
                        }
                        column(TotalExclVATText_Control153;TotalExclVATText)
                        {
                        }
                        column(VATBaseAmount;VATBaseAmount)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATBaseAmount___VATAmount;VATBaseAmount + VATAmount)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmount_Control150;VATAmount)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(RoundLoop_Number;Number)
                        {
                        }
                        column(AmountCaption;AmountCaptionLbl)
                        {
                        }
                        column(Purchase_Line___Line_Discount_Amount_Caption;Purchase_Line___Line_Discount_Amount_CaptionLbl)
                        {
                        }
                        column(Purchase_Line___Allow_Invoice_Disc__Caption;"Purchase Line".FIELDCAPTION("Allow Invoice Disc."))
                        {
                        }
                        column(Purchase_Line___Line_Discount___Caption;Purchase_Line___Line_Discount___CaptionLbl)
                        {
                        }
                        column(Direct_Unit_CostCaption;Direct_Unit_CostCaptionLbl)
                        {
                        }
                        column(Purchase_Line___Qty__to_Invoice_Caption;"Purchase Line".FIELDCAPTION("Qty. to Invoice"))
                        {
                        }
                        column(Purchase_Line__QuantityCaption;"Purchase Line".FIELDCAPTION(Quantity))
                        {
                        }
                        column(Purchase_Line__DescriptionCaption;"Purchase Line".FIELDCAPTION(Description))
                        {
                        }
                        column(Purchase_Line___No__Caption;"Purchase Line".FIELDCAPTION("No."))
                        {
                        }
                        column(Purchase_Line__TypeCaption;"Purchase Line".FIELDCAPTION(Type))
                        {
                        }
                        column(TempPurchLine__Inv__Discount_Amount_Caption;TempPurchLine__Inv__Discount_Amount_CaptionLbl)
                        {
                        }
                        column(SubtotalCaption;SubtotalCaptionLbl)
                        {
                        }
                        column(TempPurchLine__Excise_Amount_Caption;TempPurchLine__Excise_Amount_CaptionLbl)
                        {
                        }
                        column(TempPurchLine__Tax_Amount_Caption;TempPurchLine__Tax_Amount_CaptionLbl)
                        {
                        }
                        column(ServiceTaxAmtCaption;ServiceTaxAmtCaptionLbl)
                        {
                        }
                        column(TempPurchLine__Total_TDS_Including_SHE_CESS_Caption;TempPurchLine__Total_TDS_Including_SHE_CESS_CaptionLbl)
                        {
                        }
                        column(TempPurchLine__Work_Tax_Amount_Caption;TempPurchLine__Work_Tax_Amount_CaptionLbl)
                        {
                        }
                        column(Other_Taxes_AmountCaption;Other_Taxes_AmountCaptionLbl)
                        {
                        }
                        column(Charges_AmountCaption;Charges_AmountCaptionLbl)
                        {
                        }
                        column(ServiceTaxECessAmtCaption;ServiceTaxECessAmtCaptionLbl)
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
                        column(ServiceTaxSBCAmtCaption;ServiceTaxSBCAmtCaptionLbl)
                        {
                        }
                        column(Svc_Tax_SBC_Amt__Applied_Caption;Svc_Tax_SBC_Amt__Applied_CaptionLbl)
                        {
                        }
                        column(KKCessAmtCaption;KKCessAmtCaptionLbl)
                        {
                        }
                        column(KKCess_Amt__Applied_Caption;KKCess_Amt__Applied_CaptionLbl)
                        {
                        }
                        dataitem(DimensionLoop2;"Integer")
                        {
                            DataItemTableView = SORTING(Number) WHERE(Number=FILTER(1..));
                            column(DimText_Control165;DimText)
                            {
                            }
                            column(DimensionLoop2_Number;Number)
                            {
                            }
                            column(DimText_Control167;DimText)
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
                                SumLineAmount := SumLineAmount + TempPurchLine."Line Amount";
                                SumInvDiscountAmount := SumInvDiscountAmount + TempPurchLine."Inv. Discount Amount";
                                // IN0090.BEGIN
                                SumExciseAmount := SumExciseAmount + TempPurchLine."Excise Amount";
                                SumTaxAmount := SumTaxAmount + TempPurchLine."Tax Amount";
                                SumSvcTaxAmount := SumSvcTaxAmount + TempPurchLine."Service Tax Amount";
                                SumSvcTaxeCessAmount := SumSvcTaxeCessAmount + TempPurchLine."Service Tax eCess Amount";
                                SumSvcTaxSHECESSAmount := SumSvcTaxSHECESSAmount + TempPurchLine."Service Tax SHE Cess Amount";
                                SumSvcTaxSBCAmount :=  SumSvcTaxSBCAmount + TempPurchLine."Service Tax SBC Amount";
                                SumKKCessAmount :=  SumKKCessAmount + TempPurchLine."KK Cess Amount";
                                SumAmountToVendor := SumAmountToVendor + TempPurchLine."Amount To Vendor";
                                SumTotalTDSIncSHECESS := SumTotalTDSIncSHECESS - TempPurchLine."Total TDS Including SHE CESS";
                                SumWorkTaxAmount := SumWorkTaxAmount - TempPurchLine."Work Tax Amount";
                                // IN0090.END
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
                            column(ErrorText_Number__Control103;ErrorText[Number])
                            {
                            }
                            column(LineErrorCounter_Number;Number)
                            {
                            }
                            column(ErrorText_Number__Control103Caption;ErrorText_Number__Control103CaptionLbl)
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
                              TempPurchLine.FIND('-')
                            ELSE
                              TempPurchLine.NEXT;
                            "Purchase Line" := TempPurchLine;

                            WITH "Purchase Line" DO BEGIN
                              IF NOT "Purchase Header"."Prices Including VAT" AND
                                 ("VAT Calculation Type" = "VAT Calculation Type"::"Full VAT")
                              THEN
                                TempPurchLine."Line Amount" := 0;
                              DimSetEntry2.SETRANGE("Dimension Set ID","Dimension Set ID");
                              DimMgt.GetDimensionSet(TempDimSetEntry,"Dimension Set ID");

                            FormsDue := 'FORM s DUE';
                            CrDays := 'CREDIT DAYS';

                              // PS39773.begin
                              FilterAppliedEntries;
                              ////IF ("Purchase Header"."Transaction No. Serv. Tax" <> 0) AND ("Service Tax Group" <> '') THEN BEGIN
                              //IF ("Purchase Header"."Transaction No. Serv. Tax" <> 0) AND ("Service Tax Group" <> '') AND
                              //  ("Document Type" <> "Document Type"::"Credit Memo")
                              //THEN BEGIN
                              //  ServiceTaxEntry.RESET;
                              //  ServiceTaxEntry.SETCURRENTKEY("Transaction No.");
                              //  ServiceTaxEntry.SETRANGE("Transaction No.","Purchase Header"."Transaction No. Serv. Tax");
                              //  ServiceTaxEntry.SETFILTER("Document Type",'<>%1',"Document Type"::"Credit Memo");
                              //  IF ServiceTaxEntry.FINDFIRST THEN BEGIN
                              //    IF (ServiceTaxEntry."Service Tax Group Code" <> "Service Tax Group") THEN
                              //      AddError(Text16501);
                              //    IF (ServiceTaxEntry."Service Tax Registration No." <> "Service Tax Registration No.") THEN
                              //      AddError(Text16500);
                              //    IF ABS(ServiceTaxEntry."Remaining Serv. Tax Amt") <= TempPurchLine."Service Tax Amount" THEN BEGIN
                              //      ServiceTaxAmt := ABS(TempPurchLine."Service Tax Amount" - ABS(ServiceTaxEntry."Remaining Serv. Tax Amt"));
                              //      ServiceTaxECessAmt := ABS(TempPurchLine."Service Tax eCess Amount" -
                              //        ABS(ServiceTaxEntry."Remaining Serv. Tax eCess Amt"));
                              //      ServiceTaxSHECessAmt := ABS(TempPurchLine."Service Tax SHE Cess Amount" -
                              //        ABS(ServiceTaxEntry."Remaining Serv Tax SHECess Amt"));
                              //      AppliedServiceTaxAmt := ABS(ServiceTaxEntry."Remaining Serv. Tax Amt");
                              //      AppliedServiceTaxECessAmt := ABS(ServiceTaxEntry."Remaining Serv. Tax eCess Amt");
                              //      AppliedServiceTaxSHECessAmt := ABS(ServiceTaxEntry."Remaining Serv Tax SHECess Amt");
                              //    END ELSE BEGIN
                              //      AppliedServiceTaxAmt := TempPurchLine."Service Tax Amount";
                              //      AppliedServiceTaxECessAmt := TempPurchLine."Service Tax eCess Amount";
                              //      AppliedServiceTaxSHECessAmt := TempPurchLine."Service Tax SHE Cess Amount";
                              //    END;
                              //    NetTotal := TempPurchLine."Amount To Vendor" - TempPurchLine."Service Tax Amount" -
                              //      TempPurchLine."Service Tax eCess Amount" - TempPurchLine."Service Tax SHE Cess Amount" +
                              //      ServiceTaxAmt + ServiceTaxECessAmt + ServiceTaxSHECessAmt + AppliedServiceTaxAmt +
                              //      AppliedServiceTaxECessAmt + AppliedServiceTaxSHECessAmt;
                              //  END;
                              //END ELSE IF ("Purchase Header"."Applies-to ID" <> '') AND ("Document Type" <> "Document Type"::"Credit Memo") THEN BEGIN
                              //  OldVendLedgEntry.RESET;
                              //  OldVendLedgEntry.SETCURRENTKEY("Vendor No.","Applies-to ID",Open,Positive,"Due Date");
                              //  OldVendLedgEntry.SETRANGE("Vendor No.","Purchase Header"."Buy-from Vendor No.");
                              //  OldVendLedgEntry.SETRANGE("Applies-to ID","Purchase Header"."Applies-to ID");
                              //  OldVendLedgEntry.SETRANGE(Open,TRUE);
                              //  OldVendLedgEntry.SETFILTER("Document Type",'<>%1',"Document Type"::"Credit Memo");
                              //  IF OldVendLedgEntry.FINDSET THEN
                              //    REPEAT
                              //      ServiceTaxEntry.RESET;
                              //      ServiceTaxEntry.SETRANGE("Transaction No.",OldVendLedgEntry."Transaction No.");
                              //      IF ServiceTaxEntry.FINDFIRST THEN BEGIN
                              //
                              //        ServiceTaxEntry."Remaining Serv. Tax Amt" := ABS(ServiceTaxEntry."Remaining Serv. Tax Amt");
                              //        ServiceTaxEntry."Remaining Serv. Tax eCess Amt" := ABS(ServiceTaxEntry."Remaining Serv. Tax eCess Amt");
                              //        ServiceTaxEntry."Remaining Serv Tax SHECess Amt" := ABS(ServiceTaxEntry."Remaining Serv Tax SHECess Amt");
                              //
                              //        IF ServiceTaxEntry."Remaining Serv. Tax Amt" <= ServiceTaxAmt THEN BEGIN
                              //          ServiceTaxAmt := ServiceTaxAmt - ServiceTaxEntry."Remaining Serv. Tax Amt";
                              //          ServiceTaxECessAmt := ServiceTaxECessAmt - ServiceTaxEntry."Remaining Serv. Tax eCess Amt";
                              //          ServiceTaxSHECessAmt := ServiceTaxSHECessAmt - ServiceTaxEntry."Remaining Serv Tax SHECess Amt";
                              //          AppliedServiceTaxAmt += ServiceTaxEntry."Remaining Serv. Tax Amt";
                              //          AppliedServiceTaxECessAmt += ServiceTaxEntry."Reaining Serv. Tax eCess Amt";
                              //          AppliedServiceTaxSHECessAmt += ServiceTaxEntry."Remaining Serv Tax SHECess Amt";
                              //        END ELSE BEGIN
                              //          AppliedServiceTaxAmt += ServiceTaxAmt;
                              //          AppliedServiceTaxECessAmt += ServiceTaxECessAmt;
                              //          AppliedServiceTaxSHECessAmt += ServiceTaxSHECessAmt;
                              //          ServiceTaxAmt := 0;
                              //          ServiceTaxECessAmt := 0;
                              //          ServiceTaxSHECessAmt := 0;
                              //        END;
                              //END ELSE IF ("Service Tax Group" <> '') THEN BEGIN
                              //  ServiceTaxAmt := TempPurchLine."Service Tax Amount";
                              //  ServiceTaxECessAmt := TempPurchLine."Service Tax eCess Amount";
                              //  ServiceTaxSHECessAmt := TempPurchLine."Service Tax SHE Cess Amount";
                              //  NetTotal := TempPurchLine."Amount To Vendor";
                              //END;
                            //UNTIL OldVendLedgEntry.NEXT = 0;
                            //      NetTotal := AmountToVendor2 + ServiceTaxAmt + ServiceTaxECessAmt + ServiceTaxSHECessAmt + AppliedServiceTaxAmt +
                            //        AppliedServiceTaxECessAmt + AppliedServiceTaxSHECessAmt;
                            //  END ELSE
                            //    NetTotal := AmountToVendor;
                            // PS39773.end
                              IF (NOT "Purchase Header".Trading) AND ("CIF Amount" + "BCD Amount" = 0) AND CVD THEN
                                AddError(Text16502);

                            // NAVIN
                            LineAmt :=( LineAmt+"Purchase Line".Quantity * "Purchase Line"."Direct Unit Cost")- "Purchase Line"."Line Discount Amount";
                            //LineAmt:="Purchase Line"."Amount To Vendor"- "Purchase Line"."Line Discount Amount";
                            LineTotAmt := LineTotAmt + LineAmt;
                            //LineTotAmt:=LineTotAmt+"Purchase Line"."Line Amount";
                            LineTotAmt_Ex_Tax:=LineTotAmt_Ex_Tax+"Purchase Line"."Line Amount";
                            Tot_Amt_To_Vendor := Tot_Amt_To_Vendor+"Purchase Line"."Amount To Vendor";
                            TaxBaseAmt:=TaxBaseAmt+"Purchase Line"."Tax Base Amount";
                            check.InitTextVariable;
                            check.FormatNoText(descri,ROUND(Tot_Amt_To_Vendor,0.01),'');
                            //--pranavi
                            PLineTemp1.INIT;
                            PLineTemp1:="Purchase Line";
                            PLineTemp1.INSERT;
                            PLineTemp1.RESET;
                            PLineTemp1.SETRANGE(PLineTemp1."Document No.","Purchase Line"."Document No.");
                            PLineTemp1.SETRANGE(PLineTemp1."No.","Purchase Line"."No.");
                            PLineTemp1.SETRANGE(PLineTemp1."Line No.","Purchase Line"."Line No.");
                            IF PLineTemp1.FINDFIRST THEN
                            BEGIN
                              PLineTemp.RESET;
                              PLineTemp.SETRANGE(PLineTemp."Document No.",PLineTemp1."Document No.");
                              PLineTemp.SETRANGE(PLineTemp."No.",PLineTemp1."No.");
                              PLineTemp.SETRANGE(PLineTemp.Quantity,PLineTemp1.Quantity);
                              PLineTemp.SETFILTER(PLineTemp."Line No.",'<>%1',PLineTemp1."Line No.");
                              IF NOT PLineTemp.FINDFIRST THEN
                              BEGIN
                                SerialNo := SerialNo+1;
                                PLineTemp1."No. Of Deviations" := SerialNo;
                              END
                              ELSE
                                PLineTemp1."No. Of Deviations" := PLineTemp."No. Of Deviations";
                              PLineTemp1.MODIFY;
                              NewSerialNo:= PLineTemp1."No. Of Deviations";
                            END;

                            // NAVIN

                              IF "Document Type" IN ["Document Type"::"Return Order","Document Type"::"Credit Memo"]
                              THEN BEGIN
                                IF "Document Type" = "Document Type"::"Credit Memo" THEN BEGIN
                                  IF ("Return Qty. to Ship" <> Quantity) AND ("Return Shipment No." = '') THEN
                                    AddError(STRSUBSTNO(Text019,FIELDCAPTION("Return Qty. to Ship"),Quantity));
                                  IF "Qty. to Invoice" <> Quantity THEN
                                    AddError(STRSUBSTNO(Text019,FIELDCAPTION("Qty. to Invoice"),Quantity));
                                END;
                                IF "Qty. to Receive" <> 0 THEN
                                  AddError(STRSUBSTNO(Text040,FIELDCAPTION("Qty. to Receive")));
                              END ELSE BEGIN
                                IF "Document Type" = "Document Type"::Invoice THEN BEGIN
                                  IF ("Qty. to Receive" <> Quantity) AND ("Receipt No." = '') THEN
                                    AddError(STRSUBSTNO(Text019,FIELDCAPTION("Qty. to Receive"),Quantity));
                                  IF "Qty. to Invoice" <> Quantity THEN
                                    AddError(STRSUBSTNO(Text019,FIELDCAPTION("Qty. to Invoice"),Quantity));
                                END;
                                IF "Return Qty. to Ship" <> 0 THEN
                                  AddError(STRSUBSTNO(Text040,FIELDCAPTION("Return Qty. to Ship")));
                              END;

                              IF NOT "Purchase Header".Receive THEN
                                "Qty. to Receive" := 0;
                              IF NOT "Purchase Header".Ship THEN
                                "Return Qty. to Ship" := 0;

                              IF ("Document Type" = "Document Type"::Invoice) AND ("Receipt No." <> '') THEN BEGIN
                                "Quantity Received" := Quantity;
                                "Qty. to Receive" := 0;
                              END;

                              IF ("Document Type" = "Document Type"::"Credit Memo") AND ("Return Shipment No." <> '') THEN BEGIN
                                "Return Qty. Shipped" := Quantity;
                                "Return Qty. to Ship" := 0;
                              END;

                              IF "Purchase Header".Invoice THEN BEGIN
                                IF "Document Type" = "Document Type"::"Credit Memo" THEN
                                  MaxQtyToBeInvoiced := "Return Qty. to Ship" + "Return Qty. Shipped" - "Quantity Invoiced"
                                ELSE
                                  MaxQtyToBeInvoiced := "Qty. to Receive" + "Quantity Received" - "Quantity Invoiced";
                                IF ABS("Qty. to Invoice") > ABS(MaxQtyToBeInvoiced) THEN
                                  "Qty. to Invoice" := MaxQtyToBeInvoiced;
                              END ELSE
                                "Qty. to Invoice" := 0;

                              IF "Gen. Prod. Posting Group" <> '' THEN BEGIN
                                CLEAR(GenPostingSetup);
                                GenPostingSetup.RESET;
                                GenPostingSetup.SETRANGE("Gen. Bus. Posting Group","Gen. Bus. Posting Group");
                                GenPostingSetup.SETRANGE("Gen. Prod. Posting Group","Gen. Prod. Posting Group");
                                IF NOT GenPostingSetup.FINDLAST THEN
                                  AddError(
                                    STRSUBSTNO(
                                      Text020,
                                      GenPostingSetup.TABLECAPTION,"Gen. Bus. Posting Group","Gen. Prod. Posting Group"));
                              END;

                              IF Quantity <> 0 THEN BEGIN
                                IF "No." = '' THEN
                                  AddError(STRSUBSTNO(Text006,FIELDCAPTION("No.")));
                                IF Type = 0 THEN
                                  AddError(STRSUBSTNO(Text006,FIELDCAPTION(Type)));
                              END ELSE
                                IF Amount <> 0 THEN
                                  AddError(STRSUBSTNO(Text021,FIELDCAPTION(Amount),FIELDCAPTION(Quantity)));

                              PurchLine := "Purchase Line";
                              IF "Document Type" IN ["Document Type"::"Return Order","Document Type"::"Credit Memo"]
                              THEN BEGIN
                                PurchLine."Return Qty. to Ship" := -PurchLine."Return Qty. to Ship";
                                PurchLine."Qty. to Invoice" := -PurchLine."Qty. to Invoice";
                              END;

                              RemQtyToBeInvoiced := PurchLine."Qty. to Invoice";

                              CASE "Document Type" OF
                                "Document Type"::"Return Order","Document Type"::"Credit Memo":
                                  CheckShptLines("Purchase Line");
                                "Document Type"::Order,"Document Type"::Invoice:
                                  CheckRcptLines("Purchase Line");
                              END;

                              IF (Type >= Type::"G/L Account") AND ("Qty. to Invoice" <> 0) THEN
                                IF NOT GenPostingSetup.GET("Gen. Bus. Posting Group","Gen. Prod. Posting Group") THEN
                                  AddError(
                                    STRSUBSTNO(
                                      Text020,
                                      GenPostingSetup.TABLECAPTION,"Gen. Bus. Posting Group","Gen. Prod. Posting Group"));

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
                                        IF Item."Costing Method" = Item."Costing Method"::Specific THEN
                                          IF Item.Reserve = Item.Reserve::Always THEN BEGIN
                                            CALCFIELDS("Reserved Quantity");
                                            IF (Signed(Quantity) < 0) AND (ABS("Reserved Quantity") < ABS("Qty. to Receive")) THEN
                                              AddError(
                                                STRSUBSTNO(
                                                  Text019,
                                                  FIELDCAPTION("Reserved Quantity"),Signed("Qty. to Receive")));
                                          END;
                                      END ELSE
                                        AddError(
                                          STRSUBSTNO(
                                            Text008,
                                            Item.TABLECAPTION,"No."));
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
                              StructureLineDetails.SETRANGE(StructureLineDetails.Type,StructureLineDetails.Type::Purchase);
                              StructureLineDetails.SETRANGE(StructureLineDetails."Document Type",PurchLine."Document Type");
                              StructureLineDetails.SETRANGE(StructureLineDetails."Document No.",PurchLine."Document No.");
                              StructureLineDetails.SETRANGE(StructureLineDetails."Item No.",PurchLine."No.");
                              StructureLineDetails.SETRANGE("Line No.",PurchLine."Line No.");
                              StructureLineDetails.SETRANGE("Payable to Third Party",FALSE); //ADSK
                              IF StructureLineDetails.FIND('-') THEN
                                REPEAT
                                IF StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::Excise THEN
                                  ExciseAmount := ExciseAmount + StructureLineDetails.Amount;
                                IF (StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::Charges) AND
                                    (StructureLineDetails."Tax/Charge Group"<>'ROUNDING')    THEN
                                  Charges := Charges + StructureLineDetails.Amount;
                                IF StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::"Other Taxes" THEN
                                  Othertaxes := Othertaxes + StructureLineDetails.Amount;
                                IF (StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::"Sales Tax") AND
                                   (PurchLine."Tax Area Code"='PUCH CST') THEN
                                  SalesTax := SalesTax + StructureLineDetails.Amount;
                                IF StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::"5" THEN
                                  ServiceTax := ServiceTax + StructureLineDetails.Amount;
                                IF StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::"Service Tax" THEN
                                  VATAmount := VATAmount + StructureLineDetails.Amount;
                                IF (StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::Charges) AND
                                   (StructureLineDetails."Tax/Charge Group"='ROUNDING')  THEN
                                   Round_Value :=Round_Value + StructureLineDetails.Amount;

                                LineTotAmt := LineTotAmt + StructureLineDetails.Amount;

                              UNTIL StructureLineDetails.NEXT = 0;
                            // NAVIN

                            //ADSK
                            //RoundLoop, Footer (5) - OnPreSection()
                              IF "Purchase Line"."Currency Code" <> '' THEN
                              BEGIN
                               CurrReport.SHOWOUTPUT :=TRUE;
                               CurrExchgRate.SETRANGE(CurrExchgRate."Currency Code","Purchase Header"."Currency Code");
                               CurrExchgRate.SETFILTER(CurrExchgRate."Starting Date",'>%1',"Purchase Header"."Posting Date");
                               IF CurrExchgRate.FIND('-') THEN
                               BEGIN
                                 ExchangeRate:=CurrExchgRate."Relational Exch. Rate Amount";
                               END;
                               CurrReport.SHOWOUTPUT(Choice=Choice::Inv);
                              END    ELSE
                               CurrReport.SHOWOUTPUT :=FALSE;

                            IF Choice=Choice::Inv THEN BEGIN
                              TesVar := (LineTotAmt-TempPurchLine."Inv. Discount Amount"-TempPurchLine."Bal. TDS Including SHE CESS" - TempPurchLine."Work Tax Amount");
                              IF "Purchase Header"."Currency Factor" >0 THEN
                                TestVar1 := TesVar/"Purchase Header"."Currency Factor";
                            END;
                        end;

                        trigger OnPreDataItem();
                        var
                            MoreLines : Boolean;
                        begin
                            // NAVIN
                            LineTotAmt := 0;
                            LineTotAmt_Ex_Tax:=0;
                            Tot_Amt_To_Vendor:=0;
                            TaxBaseAmt:=0;
                            LineAmt := 0;
                            TotalTaxAmount := 0;
                            ExciseAmount := 0;
                            Charges := 0;
                            Othertaxes := 0;
                            SalesTax := 0;
                            SerialNo:=0;
                            // NAVIN

                            MoreLines := TempPurchLine.FIND('+');
                            WHILE MoreLines AND (TempPurchLine.Description = '') AND (TempPurchLine."Description 2" = '') AND
                                  (TempPurchLine."No." = '') AND (TempPurchLine.Quantity = 0) AND
                                  (TempPurchLine.Amount = 0)
                            DO
                              MoreLines := TempPurchLine.NEXT(-1) <> 0;
                            IF NOT MoreLines THEN
                              CurrReport.BREAK;
                            TempPurchLine.SETRANGE("Line No.",0,TempPurchLine."Line No.");
                            SETRANGE(Number,1,TempPurchLine.COUNT);

                            // NAVIN
                            //CurrReport.CREATETOTALS(TempPurchLine."Line Amount",TempPurchLine."Inv. Discount Amount");
                            CurrReport.CREATETOTALS(TempPurchLine."Line Amount",TempPurchLine.Amount,TempPurchLine."Inv. Discount Amount",
                            TempPurchLine."Line Discount Amount",TempPurchLine."Inv. Discount Amount",TempPurchLine."Amount Including Excise",
                            TempPurchLine."Tax Base Amount",TempPurchLine."Amount Including Tax",TempPurchLine."Excise Amount",TempPurchLine."Tax Amount");
                            CurrReport.CREATETOTALS(LineAmt,TempPurchLine."TDS Amount Including Surcharge",TempPurchLine."Work Tax Amount");
                            // NAVIN
                        end;
                    }
                    dataitem(VATCounter;"Integer")
                    {
                        DataItemTableView = SORTING(Number);
                        column(VATAmountLine__VAT_Amount_;VATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__VAT_Base_;VATAmountLine."VAT Base")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Invoice_Discount_Amount_;VATAmountLine."Invoice Discount Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Inv__Disc__Base_Amount_;VATAmountLine."Inv. Disc. Base Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Line_Amount_;VATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__VAT_Amount__Control98;VATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__VAT_Base__Control138;VATAmountLine."VAT Base")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__VAT___;VATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0:5;
                        }
                        column(VATAmountLine__VAT_Identifier_;VATAmountLine."VAT Identifier")
                        {
                        }
                        column(VATAmountLine__Line_Amount__Control175;VATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Inv__Disc__Base_Amount__Control176;VATAmountLine."Inv. Disc. Base Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Invoice_Discount_Amount__Control177;VATAmountLine."Invoice Discount Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__VAT_Amount__Control95;VATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__VAT_Base__Control139;VATAmountLine."VAT Base")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Invoice_Discount_Amount__Control181;VATAmountLine."Invoice Discount Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Inv__Disc__Base_Amount__Control182;VATAmountLine."Inv. Disc. Base Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Line_Amount__Control183;VATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__VAT_Amount__Control85;VATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__VAT_Base__Control137;VATAmountLine."VAT Base")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Invoice_Discount_Amount__Control187;VATAmountLine."Invoice Discount Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Inv__Disc__Base_Amount__Control188;VATAmountLine."Inv. Disc. Base Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Line_Amount__Control189;VATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATCounter_Number;Number)
                        {
                        }
                        column(VAT_Amount_SpecificationCaption;VAT_Amount_SpecificationCaptionLbl)
                        {
                        }
                        column(VATAmountLine__VAT_Amount__Control98Caption;VATAmountLine__VAT_Amount__Control98CaptionLbl)
                        {
                        }
                        column(VATAmountLine__VAT_Base__Control138Caption;VATAmountLine__VAT_Base__Control138CaptionLbl)
                        {
                        }
                        column(VATAmountLine__VAT___Caption;VATAmountLine__VAT___CaptionLbl)
                        {
                        }
                        column(VATAmountLine__VAT_Identifier_Caption;VATAmountLine__VAT_Identifier_CaptionLbl)
                        {
                        }
                        column(VATAmountLine__Inv__Disc__Base_Amount__Control176Caption;VATAmountLine__Inv__Disc__Base_Amount__Control176CaptionLbl)
                        {
                        }
                        column(VATAmountLine__Line_Amount__Control175Caption;VATAmountLine__Line_Amount__Control175CaptionLbl)
                        {
                        }
                        column(VATAmountLine__Invoice_Discount_Amount__Control177Caption;VATAmountLine__Invoice_Discount_Amount__Control177CaptionLbl)
                        {
                        }
                        column(VATAmountLine__VAT_Base_Caption;VATAmountLine__VAT_Base_CaptionLbl)
                        {
                        }
                        column(VATAmountLine__VAT_Base__Control139Caption;VATAmountLine__VAT_Base__Control139CaptionLbl)
                        {
                        }
                        column(VATAmountLine__VAT_Base__Control137Caption;VATAmountLine__VAT_Base__Control137CaptionLbl)
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
                        column(VALVATAmountLCY_Control242;VALVATAmountLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VALVATBaseLCY_Control243;VALVATBaseLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__VAT____Control244;VATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0:5;
                        }
                        column(VATAmountLine__VAT_Identifier__Control245;VATAmountLine."VAT Identifier")
                        {
                        }
                        column(VALVATAmountLCY_Control246;VALVATAmountLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VALVATBaseLCY_Control247;VALVATBaseLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VALVATAmountLCY_Control249;VALVATAmountLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VALVATBaseLCY_Control250;VALVATBaseLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VATCounterLCY_Number;Number)
                        {
                        }
                        column(VALVATAmountLCY_Control242Caption;VALVATAmountLCY_Control242CaptionLbl)
                        {
                        }
                        column(VALVATBaseLCY_Control243Caption;VALVATBaseLCY_Control243CaptionLbl)
                        {
                        }
                        column(VATAmountLine__VAT____Control244Caption;VATAmountLine__VAT____Control244CaptionLbl)
                        {
                        }
                        column(VATAmountLine__VAT_Identifier__Control245Caption;VATAmountLine__VAT_Identifier__Control245CaptionLbl)
                        {
                        }
                        column(ContinuedCaption;ContinuedCaptionLbl)
                        {
                        }
                        column(ContinuedCaption_Control248;ContinuedCaption_Control248Lbl)
                        {
                        }
                        column(TotalCaption;TotalCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord();
                        begin
                            VATAmountLine.GetLine(Number);

                            VALVATBaseLCY := ROUND(CurrExchRate.ExchangeAmtFCYToLCY(
                                  "Purchase Header"."Posting Date","Purchase Header"."Currency Code",
                                  VATAmountLine."VAT Base","Purchase Header"."Currency Factor"));
                            VALVATAmountLCY := ROUND(CurrExchRate.ExchangeAmtFCYToLCY(
                                  "Purchase Header"."Posting Date","Purchase Header"."Currency Code",
                                  VATAmountLine."VAT Amount","Purchase Header"."Currency Factor"));
                        end;

                        trigger OnPreDataItem();
                        begin
                            IF (NOT GLSetup."Print VAT specification in LCY") OR
                               ("Purchase Header"."Currency Code" = '')
                            THEN
                              CurrReport.BREAK;

                            SETRANGE(Number,1,VATAmountLine.COUNT);
                            CurrReport.CREATETOTALS(VALVATBaseLCY,VALVATAmountLCY);

                            IF GLSetup."LCY Code" = '' THEN
                              VALSpecLCYHeader := Text050 + Text051
                            ELSE
                              VALSpecLCYHeader := Text050 + FORMAT(GLSetup."LCY Code");

                            CurrExchRate.FindCurrency("Purchase Header"."Posting Date","Purchase Header"."Currency Code",1);
                            VALExchRate := STRSUBSTNO(Text052,CurrExchRate."Relational Exch. Rate Amount",CurrExchRate."Exchange Rate Amount");
                        end;
                    }
                    dataitem("Item Charge Assignment (Purch)";"Item Charge Assignment (Purch)")
                    {
                        DataItemLink = Document Type=FIELD(Document Type), Document No.=FIELD(Document No.);
                        DataItemLinkReference = "Purchase Line";
                        DataItemTableView = SORTING(Document Type,Document No.,Document Line No.,Line No.);
                        column(Item_Charge_Assignment__Purch___Qty__to_Assign_;"Qty. to Assign")
                        {
                        }
                        column(Item_Charge_Assignment__Purch___Amount_to_Assign_;"Amount to Assign")
                        {
                        }
                        column(Item_Charge_Assignment__Purch___Item_Charge_No__;"Item Charge No.")
                        {
                        }
                        column(PurchLine2_Description;PurchLine2.Description)
                        {
                        }
                        column(PurchLine2_Quantity;PurchLine2.Quantity)
                        {
                        }
                        column(Item_Charge_Assignment__Purch___Item_No__;"Item No.")
                        {
                        }
                        column(Item_Charge_Assignment__Purch___Qty__to_Assign__Control204;"Qty. to Assign")
                        {
                        }
                        column(Item_Charge_Assignment__Purch___Unit_Cost_;"Unit Cost")
                        {
                        }
                        column(Item_Charge_Assignment__Purch___Amount_to_Assign__Control210;"Amount to Assign")
                        {
                        }
                        column(Item_Charge_Assignment__Purch___Qty__to_Assign__Control195;"Qty. to Assign")
                        {
                        }
                        column(Item_Charge_Assignment__Purch___Amount_to_Assign__Control196;"Amount to Assign")
                        {
                        }
                        column(Item_Charge_Assignment__Purch___Qty__to_Assign__Control191;"Qty. to Assign")
                        {
                        }
                        column(Item_Charge_Assignment__Purch___Amount_to_Assign__Control193;"Amount to Assign")
                        {
                        }
                        column(Item_Charge_Assignment__Purch__Document_Type;"Document Type")
                        {
                        }
                        column(Item_Charge_Assignment__Purch__Document_No_;"Document No.")
                        {
                        }
                        column(Item_Charge_Assignment__Purch__Document_Line_No_;"Document Line No.")
                        {
                        }
                        column(Item_Charge_Assignment__Purch__Line_No_;"Line No.")
                        {
                        }
                        column(Item_Charge_SpecificationCaption;Item_Charge_SpecificationCaptionLbl)
                        {
                        }
                        column(Item_Charge_Assignment__Purch___Item_Charge_No__Caption;FIELDCAPTION("Item Charge No."))
                        {
                        }
                        column(Item_Charge_Assignment__Purch___Item_No__Caption;FIELDCAPTION("Item No."))
                        {
                        }
                        column(Item_Charge_Assignment__Purch___Qty__to_Assign__Control204Caption;FIELDCAPTION("Qty. to Assign"))
                        {
                        }
                        column(Item_Charge_Assignment__Purch___Unit_Cost_Caption;FIELDCAPTION("Unit Cost"))
                        {
                        }
                        column(Item_Charge_Assignment__Purch___Amount_to_Assign__Control210Caption;FIELDCAPTION("Amount to Assign"))
                        {
                        }
                        column(DescriptionCaption;DescriptionCaptionLbl)
                        {
                        }
                        column(PurchLine2_QuantityCaption;PurchLine2_QuantityCaptionLbl)
                        {
                        }
                        column(ContinuedCaption_Control197;ContinuedCaption_Control197Lbl)
                        {
                        }
                        column(TotalCaption_Control194;TotalCaption_Control194Lbl)
                        {
                        }
                        column(ContinuedCaption_Control192;ContinuedCaption_Control192Lbl)
                        {
                        }

                        trigger OnAfterGetRecord();
                        begin
                            IF PurchLine2.GET("Document Type","Document No.","Document Line No.") THEN;
                        end;

                        trigger OnPreDataItem();
                        begin
                            IF NOT ShowItemChargeAssgnt THEN
                              CurrReport.BREAK;
                            CurrReport.CREATETOTALS("Amount to Assign","Qty. to Assign");
                        end;
                    }

                    trigger OnAfterGetRecord();
                    var
                        PurchPost : Codeunit "Purch.-Post";
                    begin
                        CLEAR(TempPurchLine);
                        CLEAR(PurchPost);
                        TempPurchLine.DELETEALL;
                        VATAmountLine.DELETEALL;
                        PurchPost.ApplLookup(TRUE);
                        PurchPost.GetPurchLines("Purchase Header",TempPurchLine,1);
                        TempPurchLine.CalcVATAmountLines(0,"Purchase Header",TempPurchLine,VATAmountLine);
                        TempPurchLine.UpdateVATOnLines(0,"Purchase Header",TempPurchLine,VATAmountLine);
                        VATAmount := VATAmountLine.GetTotalVATAmount;
                        VATBaseAmount := VATAmountLine.GetTotalVATBase;
                        VATDiscountAmount :=
                          VATAmountLine.GetTotalVATDiscount("Purchase Header"."Currency Code","Purchase Header"."Prices Including VAT");
                        TotalAmountInclVAT := VATAmountLine.GetTotalAmountInclVAT;

                        // PS39773.begin
                        //ServiceTaxAmt := 0;
                        //ServiceTaxECessAmt := 0;
                        //ServiceTaxSHECessAmt :=0;
                        //AppliedServiceTaxAmt :=0;
                        //AppliedServiceTaxECessAmt :=0;
                        //AppliedServiceTaxSHECessAmt :=0;
                        // PS39773.end
                    end;
                }
            }

            trigger OnAfterGetRecord();
            var
                TableID : array [10] of Integer;
                No : array [10] of Code[20];
            begin

                IF ("Purchase Header"."Vendor Cr. Memo No." IN['',' ']) AND ("Document Type" = "Document Type"::"Credit Memo")THEN
                  ERROR('Please enter Debit Note No.!');

                DebitNoteAmtDesc:='';
                PurchLine.RESET;
                PurchLine.SETRANGE("Document Type","Document Type");
                PurchLine.SETRANGE("Document No.","No.");
                PurchLine.SETFILTER(Quantity,'<>0');
                IF PurchLine.FINDSET THEN
                BEGIN
                  LinesCount := PurchLine.COUNT;
                  REPEAT
                    TotAmtt:=TotAmtt+PurchLine."Amount To Vendor";
                  UNTIL PurchLine.NEXT=0;
                END;
                DebitNoteAmtDesc:='We have DEBITED to your A/c with a sum of Rs. '+FORMAT(ROUND(TotAmtt,0.02))+' as detailed under.';

                DimSetEntry1.SETRANGE("Dimension Set ID","Purchase Header"."Dimension Set ID");
                ServiceTaxSBCAmt := 0;
                KKCessAmt := 0; //KKCSS

                FormatAddr.PurchHeaderPayTo(PayToAddr,"Purchase Header");
                //FormatAddr.PurchHeaderBuyFrom(BuyFromAddr,"Purchase Header");
                FormatAddr.PurchHeaderBuyFromtemp(BuyFromAddr,"Purchase Header");
                FormatAddr.PurchHeaderShipTo(ShipToAddr,"Purchase Header");
                //pranavi
                Vend.RESET;
                Vend.SETRANGE(Vend."No.","Purchase Header"."Buy-from Vendor No.");
                IF Vend.FINDFIRST THEN
                  IF Vend."E.C.C. No." <> '' THEN
                    Vendor_ECC_No := 'ECC No.: '+Vend."E.C.C. No.";
                  Vendor_TIN_No := 'TIN: '+Vend."T.I.N. No.";
                  Vendor_CST_No := Vend."C.S.T. No.";
                IF "Currency Code" = '' THEN BEGIN
                  GLSetup.TESTFIELD("LCY Code");
                  TotalText := STRSUBSTNO(Text004,GLSetup."LCY Code");
                  TotalInclVATText := STRSUBSTNO(Text005,GLSetup."LCY Code");
                  TotalExclVATText := STRSUBSTNO(Text031,GLSetup."LCY Code");
                END ELSE BEGIN
                  TotalText := STRSUBSTNO(Text004,"Currency Code");
                  TotalInclVATText := STRSUBSTNO(Text005,"Currency Code");
                  TotalExclVATText := STRSUBSTNO(Text031,"Currency Code");
                END;
                TotalText:='Total Amount';
                Invoice := InvOnNextPostReq;
                Receive := ReceiveShipOnNextPostReq;
                Ship := ReceiveShipOnNextPostReq;

                IF "Buy-from Vendor No." = '' THEN
                  AddError(STRSUBSTNO(Text006,FIELDCAPTION("Buy-from Vendor No.")))
                ELSE BEGIN
                  IF Vend.GET("Buy-from Vendor No.") THEN BEGIN
                    IF Vend.Blocked = Vend.Blocked::All THEN
                      AddError(
                        STRSUBSTNO(
                          Text041,
                          Vend.FIELDCAPTION(Blocked),Vend.Blocked,Vend.TABLECAPTION,"Buy-from Vendor No."));
                  END ELSE
                    AddError(
                      STRSUBSTNO(
                        Text008,
                        Vend.TABLECAPTION,"Buy-from Vendor No."));
                END;

                IF "Pay-to Vendor No." = '' THEN
                  AddError(STRSUBSTNO(Text006,FIELDCAPTION("Pay-to Vendor No.")))
                ELSE
                  IF "Pay-to Vendor No." <> "Buy-from Vendor No." THEN BEGIN
                    IF Vend.GET("Pay-to Vendor No.") THEN BEGIN
                      IF Vend.Blocked = Vend.Blocked::All THEN
                        AddError(
                          STRSUBSTNO(
                            Text041,
                            Vend.FIELDCAPTION(Blocked),Vend.Blocked::All,Vend.TABLECAPTION,"Pay-to Vendor No."));
                    END ELSE
                      AddError(
                        STRSUBSTNO(
                          Text008,
                          Vend.TABLECAPTION,"Pay-to Vendor No."));
                  END;

                PurchSetup.GET;
                GLSetup.GET; // NAVIN

                IF "Posting Date" = 0D THEN
                  AddError(STRSUBSTNO(Text006,FIELDCAPTION("Posting Date")))
                ELSE
                  IF "Posting Date" <> NORMALDATE("Posting Date") THEN
                    AddError(STRSUBSTNO(Text009,FIELDCAPTION("Posting Date")))
                  ELSE BEGIN
                    IF (AllowPostingFrom = 0D) AND (AllowPostingTo = 0D) THEN BEGIN
                      IF USERID <> '' THEN
                        IF UserSetup.GET(USERID) THEN BEGIN
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
                      AddError(STRSUBSTNO(Text010,FIELDCAPTION("Posting Date")));
                  END;

                IF "Document Date" <> 0D THEN
                  IF "Document Date" <> NORMALDATE("Document Date") THEN
                    AddError(STRSUBSTNO(Text009,FIELDCAPTION("Document Date")));

                CASE "Document Type" OF
                  "Document Type"::Order:
                    Ship := FALSE;
                  "Document Type"::Invoice:
                    BEGIN
                      Receive := TRUE;
                      Invoice := TRUE;
                      Ship := FALSE;
                    END;
                  "Document Type"::"Return Order":
                    Receive := FALSE;
                  "Document Type"::"Credit Memo":
                    BEGIN
                      Receive := FALSE;
                      Invoice := TRUE;
                      Ship := TRUE;
                    END;
                END;

                IF NOT (Receive OR Invoice OR Ship) THEN
                  AddError(
                    STRSUBSTNO(
                      Text032,
                      FIELDCAPTION(Receive),FIELDCAPTION(Invoice),FIELDCAPTION(Ship)));

                IF Invoice THEN BEGIN
                  PurchLine.RESET;
                  PurchLine.SETRANGE("Document Type","Document Type");
                  PurchLine.SETRANGE("Document No.","No.");
                  PurchLine.SETFILTER(Quantity,'<>0');
                  IF "Document Type" IN ["Document Type"::Order,"Document Type"::"Return Order"] THEN
                    PurchLine.SETFILTER("Qty. to Invoice",'<>0');
                  Invoice := PurchLine.FIND('-');
                  IF Invoice AND (NOT Receive) AND ("Document Type" = "Document Type"::Order) THEN BEGIN
                    Invoice := FALSE;
                    REPEAT
                      Invoice := PurchLine."Quantity Received" - PurchLine."Quantity Invoiced" <> 0;
                    UNTIL Invoice OR (PurchLine.NEXT = 0);
                  END ELSE
                    IF Invoice AND (NOT Ship) AND ("Document Type" = "Document Type"::"Return Order") THEN BEGIN
                      Invoice := FALSE;
                      REPEAT
                        Invoice := PurchLine."Return Qty. Shipped" - PurchLine."Quantity Invoiced" <> 0;
                      UNTIL Invoice OR (PurchLine.NEXT = 0);
                    END;
                END;

                IF Receive THEN BEGIN
                  PurchLine.RESET;
                  PurchLine.SETRANGE("Document Type","Document Type");
                  PurchLine.SETRANGE("Document No.","No.");
                  PurchLine.SETFILTER(Quantity,'<>0');
                  IF "Document Type" = "Document Type"::Order THEN
                    PurchLine.SETFILTER("Qty. to Receive",'<>0');
                  PurchLine.SETRANGE("Receipt No.",'');
                  Receive := PurchLine.FIND('-');
                END;
                IF Ship THEN BEGIN
                  PurchLine.RESET;
                  PurchLine.SETRANGE("Document Type","Document Type");
                  PurchLine.SETRANGE("Document No.","No.");
                  PurchLine.SETFILTER(Quantity,'<>0');
                  IF "Document Type" = "Document Type"::"Return Order" THEN
                    PurchLine.SETFILTER("Return Qty. to Ship",'<>0');
                  PurchLine.SETRANGE("Return Shipment No.",'');
                  Receive := PurchLine.FIND('-');
                END;

                IF NOT (Receive OR Invoice OR Ship) THEN
                  AddError(Text012);

                IF Invoice THEN BEGIN
                  PurchLine.RESET;
                  PurchLine.SETRANGE("Document Type","Document Type");
                  PurchLine.SETRANGE("Document No.","No.");
                  PurchLine.SETFILTER("Sales Order Line No.",'<>0');
                  IF PurchLine.FIND('-') THEN
                    REPEAT
                      SalesLine.GET(SalesLine."Document Type"::Order,PurchLine."Sales Order No.",PurchLine."Sales Order Line No.");
                      IF Receive AND
                         Invoice AND
                         (PurchLine."Qty. to Invoice" <> 0) AND
                         (PurchLine."Qty. to Receive" <> 0)
                      THEN
                        AddError(Text013);
                      IF ABS(PurchLine."Quantity Received" - PurchLine."Quantity Invoiced") <
                         ABS(PurchLine."Qty. to Invoice")
                      THEN
                        PurchLine."Qty. to Invoice" := PurchLine."Quantity Received" - PurchLine."Quantity Invoiced";
                      IF ABS(PurchLine.Quantity - (PurchLine."Qty. to Invoice" + PurchLine."Quantity Invoiced")) <
                         ABS(SalesLine.Quantity - SalesLine."Quantity Invoiced")
                      THEN
                        AddError(
                          STRSUBSTNO(
                            Text014,
                            PurchLine."Sales Order No."));
                    UNTIL PurchLine.NEXT = 0;
                END;

                IF Invoice THEN
                  IF NOT ("Document Type" IN ["Document Type"::"Return Order","Document Type"::"Credit Memo"]) THEN
                    IF "Due Date" = 0D THEN
                      AddError(STRSUBSTNO(Text006,FIELDCAPTION("Due Date")));

                IF Receive AND ("Receiving No." = '') THEN
                  IF ("Document Type" = "Document Type"::Order) OR
                     (("Document Type" = "Document Type"::Invoice) AND PurchSetup."Receipt on Invoice")
                  THEN
                    IF "Receiving No. Series" = '' THEN
                      AddError(
                        STRSUBSTNO(
                          Text015,
                          FIELDCAPTION("Receiving No. Series")));

                IF Ship AND ("Return Shipment No." = '') THEN
                  IF ("Document Type" = "Document Type"::"Return Order") OR
                     (("Document Type" = "Document Type"::"Credit Memo") AND PurchSetup."Return Shipment on Credit Memo")
                  THEN
                    IF "Return Shipment No. Series" = '' THEN
                      AddError(
                        STRSUBSTNO(
                          Text015,
                          FIELDCAPTION("Return Shipment No. Series")));

                IF Invoice AND ("Posting No." = '') THEN
                  IF "Document Type" IN ["Document Type"::Order,"Document Type"::"Return Order"] THEN
                    IF "Posting No. Series" = '' THEN
                      AddError(
                        STRSUBSTNO(
                          Text015,
                          FIELDCAPTION("Posting No. Series")));

                PurchLine.RESET;
                PurchLine.SETRANGE("Document Type","Document Type");
                PurchLine.SETRANGE("Document No.","No.");
                PurchLine.SETFILTER("Sales Order Line No.",'<>0');
                IF PurchLine.FIND('-') THEN BEGIN
                  DropShipOrder := TRUE;
                  IF Receive THEN
                    REPEAT
                      IF SalesHeader."No." <> PurchLine."Sales Order No." THEN BEGIN
                        SalesHeader.GET(1,PurchLine."Sales Order No.");
                        IF SalesHeader."Bill-to Customer No." = '' THEN
                          AddError(
                            STRSUBSTNO(
                              Text016,
                              SalesHeader.FIELDCAPTION("Bill-to Customer No.")));
                        IF SalesHeader."Shipping No." = '' THEN
                          IF SalesHeader."Shipping No. Series" = '' THEN
                            AddError(
                              STRSUBSTNO(
                                Text016,
                                SalesHeader.FIELDCAPTION("Shipping No. Series")));
                      END;
                    UNTIL PurchLine.NEXT = 0;
                END;

                IF Invoice THEN
                  IF "Document Type" IN ["Document Type"::Order,"Document Type"::Invoice] THEN BEGIN
                    IF PurchSetup."Ext. Doc. No. Mandatory" AND ("Vendor Invoice No." = '') THEN
                      AddError(STRSUBSTNO(Text006,FIELDCAPTION("Vendor Invoice No.")));
                  END ELSE
                    IF PurchSetup."Ext. Doc. No. Mandatory" AND ("Vendor Cr. Memo No." = '') THEN
                      AddError(STRSUBSTNO(Text006,FIELDCAPTION("Vendor Cr. Memo No.")));

                IF "Vendor Invoice No." <> '' THEN BEGIN
                  VendLedgEntry.SETCURRENTKEY("Document No.","Document Type","Vendor No.");
                  VendLedgEntry.SETRANGE("Document Type","Document Type");
                  VendLedgEntry.SETRANGE("Document No.","Vendor Invoice No.");
                  VendLedgEntry.SETRANGE("Vendor No.","Pay-to Vendor No.");
                  IF VendLedgEntry.FINDFIRST THEN
                    AddError(
                      STRSUBSTNO(
                        Text017,
                        "Document Type","Vendor Invoice No."));
                END;

                IF NOT DimMgt.CheckDimIDComb("Dimension Set ID") THEN
                  AddError(DimMgt.GetDimCombErr);

                TableID[1] := DATABASE::Vendor;
                No[1] := "Pay-to Vendor No.";
                TableID[2] := DATABASE::Job;
                //No[2] := "Job No.";//B2B
                TableID[3] := DATABASE::"Salesperson/Purchaser";
                No[3] := "Purchaser Code";
                TableID[4] := DATABASE::Campaign;
                No[4] := "Campaign No.";
                TableID[5] := DATABASE::"Responsibility Center";
                No[5] := "Responsibility Center";

                IF NOT DimMgt.CheckDimValuePosting(TableID,No,"Dimension Set ID") THEN
                  AddError(DimMgt.GetDimValuePostingErr);
                // Added by Pranavi on 19-Nov-2016
                CompanyInfo.GET;
                FormatAddr.Company(CompanyAddr,CompanyInfo);
                TIN.RESET;
                TIN.SETCURRENTKEY(TIN.Group,TIN.Code,TIN.Description,TIN."Effective Date");
                TIN.SETFILTER(TIN."Effective Date",'<=%1',"Purchase Header"."Order Date");
                TIN.SETFILTER(TIN.Group,'TIN');
                IF TIN.FINDLAST THEN
                BEGIN
                  TNo:=TIN.Code;
                END;

                TIN.RESET;
                TIN.SETCURRENTKEY(TIN.Group,TIN.Code,TIN.Description,TIN."Effective Date");
                TIN.SETFILTER(TIN."Effective Date",'<=%1',"Purchase Header"."Order Date");
                TIN.SETFILTER(TIN.Group,'CST');
                IF TIN.FINDLAST THEN
                BEGIN
                  CSTNo:=TIN.Code;
                END;

                IF ("Document Type" = "Document Type"::"Credit Memo") THEN
                BEGIN
                  HeaderTextDesc := 'DEBIT NOTE';
                  PurchLineT.RESET;
                  PurchLineT.SETRANGE(PurchLineT."Document No.","No.");
                  PurchLineT.SETRANGE(PurchLineT."Document Type","Document Type");
                  PurchLineT.SETFILTER(PurchLineT.Quantity,'>%1',0);
                  IF PurchLineT.FINDSET THEN
                  REPEAT
                    IF PurchLineT."BED Amount" > 0 THEN
                      HeaderTextDesc := 'PURCHASE RETURN INVOICE';
                  UNTIL PurchLineT.NEXT=0;
                END;
                IF (HeaderTextDesc = 'PURCHASE RETURN INVOICE') AND ("Purchase Header"."Tarrif Heading No" IN['',' ']) THEN
                  ERROR('Please enter Excise Tarrif Heading No.!');
                // End by Pranavi
            end;

            trigger OnPreDataItem();
            begin
                PurchHeader.COPY("Purchase Header");
                PurchHeader.FILTERGROUP := 2;
                PurchHeader.SETRANGE("Document Type",PurchHeader."Document Type"::Order);
                IF PurchHeader.FINDFIRST THEN BEGIN
                  CASE TRUE OF
                    ReceiveShipOnNextPostReq AND InvOnNextPostReq:
                      ReceiveInvoiceText := Text000;
                    ReceiveShipOnNextPostReq:
                      ReceiveInvoiceText := Text001;
                    InvOnNextPostReq:
                      ReceiveInvoiceText := Text002;
                  END;
                  ReceiveInvoiceText := STRSUBSTNO(Text003,ReceiveInvoiceText);
                END;
                PurchHeader.SETRANGE("Document Type",PurchHeader."Document Type"::"Return Order");
                IF PurchHeader.FINDFIRST THEN BEGIN
                  CASE TRUE OF
                    ReceiveShipOnNextPostReq AND InvOnNextPostReq:
                      ShipInvoiceText := Text028;
                    ReceiveShipOnNextPostReq:
                      ShipInvoiceText := Text029;
                    InvOnNextPostReq:
                      ShipInvoiceText := Text002;
                  END;
                  ShipInvoiceText := STRSUBSTNO(Text030,ShipInvoiceText);
                END;
                TempSvcTaxAppllBuffer.DELETEALL;
            end;
        }
        dataitem("Integer";"Integer")
        {
            MaxIteration = 0;
            column(BillValue;BillValue)
            {
            }
            column(INT_TestVar1;TestVar1)
            {
            }
            column(Dept_;Dept)
            {
            }
            column(Title_;Title)
            {
            }
            column(TAX_TYPE;TAX_TYPE)
            {
            }
            column(PH_Posting_Date;"Purchase Header"."Posting Date")
            {
            }
            column(Purchase_Header_Pay_to_Name;"Purchase Header"."Pay-to Name")
            {
            }
            column(Purchase_Header_Buy_from_City;"Purchase Header"."Buy-from City")
            {
            }
            column(Purchase_Header_Vendor_Invoice_No;"Purchase Header"."Vendor Invoice No.")
            {
            }
            column(Purchase_Header_Vendor_Invoice_Date;"Purchase Header"."Vendor Invoice Date")
            {
            }
            column(BillAmtValue;ROUND((LineTotAmt-TempPurchLine."Inv. Discount Amount"-TempPurchLine."Bal. TDS Including SHE CESS" - TempPurchLine."Work Tax Amount")+Man_Val,0.01))
            {
            }
            column(ACNT_HEAD_NAME;ACNT_HEAD_NAME)
            {
            }
            column(HEADS_VALUESI;HEADS_VALUES[I])
            {
            }
            column(Item_Desc;Item_Desc)
            {
            }
            column(Purchase_Header_Form_Code;"Purchase Header"."Form Code")
            {
            }
            column(Payment_Terms_Description;Payment_Terms.Description)
            {
            }
            column(Payment_Terms_Due_Date_Calculation;Payment_Terms."Due Date Calculation")
            {
            }
            column(FormsDue;FormsDue)
            {
            }
            column(CrDays;CrDays)
            {
            }
            column(BOut;BOut)
            {
            }
            column(OtherStores;OtherStores)
            {
            }

            trigger OnAfterGetRecord();
            begin
                 I+=1;
                 IF I>NO_OF_HEADS THEN
                   CurrReport.BREAK;
                //rev01 code copied from //Integer, Body (3) - OnPreSection()
                
                  ACNT_HEAD_NAME:='';
                 IF (HEADS_INFORMATION[I] = FORMAT(18100) )OR (HEADS_INFORMATION[I]=FORMAT(18200))OR (HEADS_INFORMATION[I]=FORMAT(18200))
                    OR (HEADS_INFORMATION[I]=FORMAT(18300)) OR (HEADS_INFORMATION[I]=FORMAT(18400)) THEN
                    BEGIN
                //    HEADS_INFORMATION[I]:=FORMAT(18000);
                 "G/L".GET(FORMAT(18000));
                   ACNT_HEAD_NAME:="G/L".Name+' ( '+HEADS_INFORMATION[I]+' )';
                   END  //ANIL
                    ELSE
                 IF (HEADS_INFORMATION[I] = FORMAT(12951) )OR (HEADS_INFORMATION[I]=FORMAT(12952))OR (HEADS_INFORMATION[I]=FORMAT(12953))
                    OR (HEADS_INFORMATION[I]=FORMAT(12954))  THEN
                    BEGIN
                //    HEADS_INFORMATION[I]:=FORMAT(18000);
                 "G/L".GET(FORMAT(12950));
                   ACNT_HEAD_NAME:="G/L".Name+' ( '+HEADS_INFORMATION[I]+' )';
                   END  //ANIL
                   ELSE
                 IF (HEADS_INFORMATION[I] = FORMAT(15100) )OR (HEADS_INFORMATION[I]=FORMAT(15200))OR (HEADS_INFORMATION[I]=FORMAT(15300))
                    OR (HEADS_INFORMATION[I]=FORMAT(15400))  THEN
                    BEGIN
                //    HEADS_INFORMATION[I]:=FORMAT(18000);
                 "G/L".GET(FORMAT(15000));
                   ACNT_HEAD_NAME:="G/L".Name+' ( '+HEADS_INFORMATION[I]+' )';
                   END  //ANIL
                   ELSE
                 IF (HEADS_INFORMATION[I] = FORMAT(13100) )OR (HEADS_INFORMATION[I]=FORMAT(13200))OR (HEADS_INFORMATION[I]=FORMAT(13300))
                    OR (HEADS_INFORMATION[I]=FORMAT(13400))  THEN
                    BEGIN
                //    HEADS_INFORMATION[I]:=FORMAT(18000);
                 "G/L".GET(FORMAT(13000));
                   ACNT_HEAD_NAME:="G/L".Name+' ( '+HEADS_INFORMATION[I]+' )';
                   END  //ANIL
                   ELSE
                    BEGIN
                 IF "G/L".GET(HEADS_INFORMATION[I]) THEN
                   ACNT_HEAD_NAME:="G/L".Name+' ( '+HEADS_INFORMATION[I]+' )';  //ANIL
                END;
                //Rev01 code copied from //Integer, Body (3) - OnPreSection()
                
                
                //rev01 //Integer, Footer (4) - OnPreSection()
                Payment_Terms.GET("Purchase Header"."Payment Terms Code");
                //Rev01 //Integer, Footer (4) - OnPreSection()
                
                /*
                //ADSK
                IF Choice = Choice :: Jnl THEN BEGIN
                  TesVar := (LineTotAmt-TempPurchLine."Inv. Discount Amount"-TempPurchLine."Bal. TDS Including SHE CESS" - TempPurchLine."Work Tax Amount");
                  TestVar1 := TesVar/"Purchase Header"."Currency Factor";
                END;
                */

            end;

            trigger OnPreDataItem();
            begin
                IF Choice<>Choice::Jnl THEN
                   CurrReport.BREAK;
                
                  "Purchase Header"."Purchase Journal":=TRUE;
                  "Purchase Header".MODIFY;
                  "Dimension Value".RESET;
                  "Dimension Value".SETRANGE("Dimension Value"."Dimension Code",'DEPARTMENTS');
                  "Dimension Value".SETRANGE("Dimension Value".Code,"Purchase Header"."Shortcut Dimension 1 Code");
                  IF "Dimension Value".FIND('-') THEN
                    Dept:="Dimension Value".Name;
                
                  BOut := '';
                  PurchLine.RESET;
                  PurchLine.SETRANGE(PurchLine."Document No.","Purchase Header"."No.");
                  PurchLine.SETFILTER(PurchLine."No.",'<>%1','');
                
                  IF PurchLine.FINDSET THEN
                  REPEAT
                    // CAPTURING  ITEMS HEADS INFORMATION
                
                    IF PurchLine.Type=1 THEN
                    BEGIN
                      // MESSAGE(FORMAT(PurchLine.Type));
                      //>>Added by Pranavi on 01-04-2017
                      IF "Purchase Header"."Currency Factor" <> 0 THEN
                        INCLUDE_ITEMS_HEAD_INFO(PurchLine."No.",PurchLine."Line Amount"/"Purchase Header"."Currency Factor")
                      ELSE //<<Added by Pranavi on 01-04-2017
                        INCLUDE_ITEMS_HEAD_INFO(PurchLine."No.",PurchLine."Line Amount");
                      // MESSAGE('type1');
                    END ELSE IF PurchLine.Type=2 THEN
                    BEGIN
                //  MESSAGE(FORMAT(PurchLine.Type));
                      GPS.RESET;
                      GPS.SETRANGE(GPS."Gen. Prod. Posting Group",PurchLine."Gen. Prod. Posting Group");
                      GPS.SETFILTER(GPS."Gen. Bus. Posting Group",PurchLine."Gen. Bus. Posting Group");
                      IF GPS.FIND('-') THEN
                        IF "Purchase Header"."Currency Factor" <> 0 THEN  //>>Added by Pranavi on 01-04-2017
                          INCLUDE_ITEMS_HEAD_INFO(GPS."Purch. Account",PurchLine."Line Amount"/"Purchase Header"."Currency Factor")
                        ELSE    //<<Added by Pranavi on 01-04-2017
                          INCLUDE_ITEMS_HEAD_INFO(GPS."Purch. Account",PurchLine."Line Amount");
                
                    END ELSE IF PurchLine.Type=4 THEN
                    BEGIN
                 //    MESSAGE(FORMAT(PurchLine.Type));
                      FA_DEPRICIATION.RESET;
                      FA_DEPRICIATION.SETRANGE(FA_DEPRICIATION."FA No.",PurchLine."No.");
                 //     MESSAGE(FORMAT(FA_DEPRICIATION.COUNT));
                      IF FA_DEPRICIATION.FINDFIRST THEN
                      BEGIN
                        IF FA_POSTING_GROUP.GET(FA_DEPRICIATION."FA Posting Group") THEN
                          IF "Purchase Header"."Currency Factor" <> 0 THEN  //>>Added by Pranavi on 01-04-2017
                            INCLUDE_ITEMS_HEAD_INFO(FA_POSTING_GROUP."Acquisition Cost Account",PurchLine."Line Amount"/"Purchase Header"."Currency Factor")
                          ELSE  //<<Added by Pranavi on 01-04-2017
                            INCLUDE_ITEMS_HEAD_INFO(FA_POSTING_GROUP."Acquisition Cost Account",PurchLine."Line Amount");
                      END;
                    END;
                
                    // CAPTURING TAXES INFORMATION
                
                    IF PurchLine."Tax Amount">0 THEN
                    BEGIN
                      IF PurchLine."Tax Area Code"='PUCH CST' THEN
                      BEGIN
                        INCLUDE_ITEMS_HEAD_INFO('51100',PurchLine."Tax Amount");
                
                        TAX_TYPE:='CST';
                      END ELSE
                      BEGIN
                        TAX_TYPE:='VAT';
                        IF (PurchLine."Tax Group Code"='14.5%') OR
                           (PurchLine."Tax Group Code"='BO-COM14.5') OR
                           (PurchLine."Tax Group Code"='BOI14.5VAT') OR
                           (PurchLine."Tax Group Code"='RAW 14.50') THEN
                           INCLUDE_ITEMS_HEAD_INFO('23802',PurchLine."Tax Amount")
                        ELSE
                        IF  (PurchLine."Tax Group Code"='5%')  OR
                            (PurchLine."Tax Group Code"='BOI-O 5%') OR
                           (PurchLine."Tax Group Code"='BOI 5 VAT') OR
                           (PurchLine."Tax Group Code"='RAW 5%') THEN
                           INCLUDE_ITEMS_HEAD_INFO('23804',PurchLine."Tax Amount")
                        ELSE
                
                        IF (PurchLine."Tax Group Code"='4 %') OR
                           (PurchLine."Tax Group Code"='BOI-O 4%') OR
                           (PurchLine."Tax Group Code"='RAW 4%') OR
                           (PurchLine."Tax Group Code"='BOI-COMP') OR //FIXED ASSE
                          //  (PurchLine."Tax Group Code"='FIXED ASSE.') OR //FIXED ASSE
                           (PurchLine."Tax Group Code"='FA') OR
                           (PurchLine."Tax Group Code"='RAW') THEN
                           INCLUDE_ITEMS_HEAD_INFO('23800',PurchLine."Tax Amount")
                        ELSE
                        IF (PurchLine."Tax Group Code"='TOT 1%') THEN
                          INCLUDE_ITEMS_HEAD_INFO('23803',PurchLine."Tax Amount");
                      END;
                    END;
                    IF PurchLine."Excise Amount">0 THEN
                    BEGIN
                      EPS.RESET;
                      EPS.SETRANGE(EPS."Excise Bus. Posting Group",PurchLine."Excise Bus. Posting Group");
                      EPS.SETRANGE(EPS."Excise Prod. Posting Group",PurchLine."Excise Prod. Posting Group");
                      IF EPS.FINDFIRST THEN
                        INCLUDE_ITEMS_HEAD_INFO(EPS."Cenvat Cr. Receivable Account",(PurchLine."Excise Amount" ));
                    END;
                    IF PurchLine."Service Tax Amount">0 THEN
                    BEGIN
                      INCLUDE_ITEMS_HEAD_INFO('61400', PurchLine."Service Tax Amount");
                     /*
                      INCLUDE_ITEMS_HEAD_INFO('61904', PurchLine."eCess Amount");
                      INCLUDE_ITEMS_HEAD_INFO('61908',PurchLine."SHE Cess Amount");
                     */
                      IF PurchLine."Service Tax SBC Amount" > 0 THEN    // Added by Pranavi on 06-06-2016 for sb & kk cess calc
                      BEGIN
                        INCLUDE_ITEMS_HEAD_INFO('47506',PurchLine."Service Tax SBC Amount");
                        INCLUDE_ITEMS_HEAD_INFO('47507',PurchLine."KK Cess Amount");
                      END
                      ELSE BEGIN
                        INCLUDE_ITEMS_HEAD_INFO('61904',PurchLine."Service Tax eCess Amount");
                        INCLUDE_ITEMS_HEAD_INFO('61908',PurchLine."Service Tax SHE Cess Amount");
                      END;
                    END;
                    Item_Desc:=PurchLine.Description;
                    Prchdr.RESET;
                    Prchdr.SETRANGE(Prchdr."No.",PurchLine."Purchase_Order No.");
                    Prchdr.SETFILTER(Prchdr."Sale Order No",'<>%1','');
                    IF Prchdr.FINDFIRST THEN
                      BOut := 'Bought-Out Item!';
                    CASE PurchLine."Location Code" OF
                      'STR':
                        strcount := strcount+1;
                      'CS STR':
                        cscount := cscount+1;
                      'R&D STR':
                        rdcount := rdcount+1;
                    END;
                  UNTIL PurchLine.NEXT=0;
                  OtherStores := '';
                  CASE COPYSTR("Purchase Header"."Shortcut Dimension 1 Code",1,3) OF
                    'PRD':
                    BEGIN
                      IF cscount >0 THEN
                        OtherStores := OtherStores+'CS-GEN,';
                      IF rdcount > 0 THEN
                        OtherStores := OtherStores+'R&D-GEN,';
                    END;
                    'RD-':
                    BEGIN
                      IF cscount >0 THEN
                        OtherStores := OtherStores+'CS-GEN,';
                      IF strcount > 0 THEN
                        OtherStores := OtherStores+'PROD-GEN,';
                    END;
                    'CUS':
                    BEGIN
                      IF strcount >0 THEN
                        OtherStores := OtherStores+'PROD-GEN,';
                      IF rdcount > 0 THEN
                        OtherStores := OtherStores+'R&D-GEN,';
                    END;
                    'ADM-':
                    BEGIN
                      IF cscount >0 THEN
                        OtherStores := OtherStores+'CS-GEN,';
                      IF rdcount > 0 THEN
                        OtherStores := OtherStores+'R&D-GEN,';
                      IF strcount > 0 THEN
                        OtherStores := OtherStores+'PROD-GEN,';
                    END;
                  END;
                  IF OtherStores <> '' THEN
                    OtherStores := COPYSTR(OtherStores,1,STRLEN(OtherStores)-1)+' Material Included!';
                  // CAPTURING CHARGES INFORMATION
                  STR_ORDER_DETAILS.SETRANGE(Type,1);
                  STR_ORDER_DETAILS.SETRANGE("Document Type",2);
                  STR_ORDER_DETAILS.SETRANGE("Document No.","Purchase Header"."No.");
                  STR_ORDER_DETAILS.SETFILTER("Calculation Value",'<>%1',0);
                  STR_ORDER_DETAILS.SETFILTER(STR_ORDER_DETAILS."Account No.",'<>%1','');
                  IF STR_ORDER_DETAILS.FINDSET THEN
                  REPEAT
                    IF STR_ORDER_DETAILS."Account No."<>'' THEN
                    INCLUDE_ITEMS_HEAD_INFO(STR_ORDER_DETAILS."Account No.",STR_ORDER_DETAILS."Calculation Value");
                  UNTIL STR_ORDER_DETAILS.NEXT=0;
                
                //NO_OF_HEADS:=3;
                I:=0;

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
                    field("Order/Credit Memo Posting";'')
                    {
                        Caption = 'Order/Credit Memo Posting';
                    }
                    field(ReceiveShipOnNextPostReq;ReceiveShipOnNextPostReq)
                    {
                        Caption = 'Receive/Ship';

                        trigger OnValidate();
                        begin

                            IF NOT ReceiveShipOnNextPostReq THEN
                              InvOnNextPostReq := TRUE;
                        end;
                    }
                    field(InvOnNextPostReq;InvOnNextPostReq)
                    {
                        Caption = 'Invoice';

                        trigger OnValidate();
                        begin

                            IF NOT InvOnNextPostReq THEN
                              ReceiveShipOnNextPostReq := TRUE;
                        end;
                    }
                    field(ShowDim;ShowDim)
                    {
                        Caption = 'Show Dimensions';
                    }
                    field(ShowItemChargeAssgnt;ShowItemChargeAssgnt)
                    {
                        Caption = 'Show Item Charge Assgnt.';
                    }
                    field(Choice;Choice)
                    {
                        Caption = 'Invoice/Journal';
                        OptionCaption = 'Invoice,Journal';
                    }
                    field(Man_Val;Man_Val)
                    {
                        Caption = 'Manually Rounded Value';
                    }
                    field(jV;jV)
                    {
                        Caption = 'Journal Voucher';

                        trigger OnValidate();
                        begin

                             IF jV THEN
                               Title:='Journal Voucher'
                             ELSE
                               Title:='Purchase Journal'
                        end;
                    }
                    field(CASH1;CASH1)
                    {
                        Caption = 'CASH';

                        trigger OnValidate();
                        begin
                             IF jV THEN
                             IF CASH1 THEN
                               Title:='Journal Voucher(Cash)'
                               ELSE
                                Title:='Journal Voucher(Credit)';
                        end;
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage();
        begin

            IF NOT ReceiveShipOnNextPostReq AND NOT InvOnNextPostReq THEN BEGIN
              ReceiveShipOnNextPostReq := TRUE;
              InvOnNextPostReq := TRUE;
            END;

            Choice := Choice::Jnl;
        end;
    }

    labels
    {
    }

    trigger OnInitReport();
    begin
        GLSetup.GET;
        Total:=0;
        vat:=0;
        Title:='Purchase Journal';
        jV:=FALSE;
    end;

    trigger OnPreReport();
    begin
        PurchHeaderFilter := "Purchase Header".GETFILTERS;
        HeaderTextDesc:='Test!';
    end;

    var
        Text000 : TextConst ENU='Receive and Invoice',ENN='Receive and Invoice';
        Text001 : TextConst ENU='Receive',ENN='Receive';
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
        Text013 : TextConst ENU='A drop shipment from a purchase order cannot be received and invoiced at the same time.',ENN='A drop shipment from a purchase order cannot be received and invoiced at the same time.';
        Text014 : TextConst ENU='Please invoice sales order %1 before invoicing this purchase order.',ENN='Please invoice sales order %1 before invoicing this purchase order.';
        Text015 : TextConst ENU='%1 must be entered.',ENN='%1 must be entered.';
        Text016 : TextConst ENU='%1 must be entered on the sales order header.',ENN='%1 must be entered on the sales order header.';
        Text017 : TextConst ENU='Purchase %1 %2 already exists for this vendor.',ENN='Purchase %1 %2 already exists for this vendor.';
        Text018 : TextConst ENU='Purchase Document: %1',ENN='Purchase Document: %1';
        Text019 : TextConst ENU='%1 must be %2.',ENN='%1 must be %2.';
        Text020 : TextConst ENU='%1 %2 %3 does not exist.',ENN='%1 %2 %3 does not exist.';
        Text021 : TextConst ENU='%1 must be 0 when %2 is 0.',ENN='%1 must be 0 when %2 is 0.';
        Text022 : TextConst ENU='The %1 on the receipt is not the same as the %1 on the purchase header.',ENN='The %1 on the receipt is not the same as the %1 on the purchase header.';
        Text023 : TextConst ENU='%1 must have the same sign as the receipt.',ENN='%1 must have the same sign as the receipt.';
        Text025 : TextConst ENU='%1 must have the same sign as the return shipment.',ENN='%1 must have the same sign as the return shipment.';
        Text028 : TextConst ENU='Ship and Invoice',ENN='Ship and Invoice';
        Text029 : TextConst ENU='Ship',ENN='Ship';
        Text030 : TextConst ENU='Return Order Posting: %1',ENN='Return Order Posting: %1';
        Text031 : TextConst ENU='Total %1 Excl. VAT',ENN='Total %1 Excl. VAT';
        Text032 : TextConst ENU='Enter "Yes" in %1 and/or %2 and/or %3.',ENN='Enter "Yes" in %1 and/or %2 and/or %3.';
        Text033 : TextConst ENU='Line %1 of the receipt %2, which you are attempting to invoice, has already been invoiced.',ENN='Line %1 of the receipt %2, which you are attempting to invoice, has already been invoiced.';
        Text034 : TextConst ENU='Line %1 of the return shipment %2, which you are attempting to invoice, has already been invoiced.',ENN='Line %1 of the return shipment %2, which you are attempting to invoice, has already been invoiced.';
        Text036 : TextConst ENU='The %1 on the return shipment is not the same as the %1 on the purchase header.',ENN='The %1 on the return shipment is not the same as the %1 on the purchase header.';
        Text037 : TextConst ENU='The quantity you are attempting to invoice is greater than the quantity in receipt %1.',ENN='The quantity you are attempting to invoice is greater than the quantity in receipt %1.';
        Text038 : TextConst ENU='The quantity you are attempting to invoice is greater than the quantity in return shipment %1.',ENN='The quantity you are attempting to invoice is greater than the quantity in return shipment %1.';
        PurchSetup : Record "Purchases & Payables Setup";
        GLSetup : Record "General Ledger Setup";
        UserSetup : Record "User Setup";
        Vend : Record Vendor;
        VendLedgEntry : Record "Vendor Ledger Entry";
        PurchHeader : Record "Purchase Header";
        PurchLine : Record "Purchase Line";
        Total : Decimal;
        PurchLine2 : Record "Purchase Line";
        TempPurchLine : Record "Purchase Line" temporary;
        GLAcc : Record "G/L Account";
        Item : Record Item;
        vat : Decimal;
        FA : Record "Fixed Asset";
        PurchRcptLine : Record "Purch. Rcpt. Line";
        ReturnShptLine : Record "Return Shipment Line";
        SalesHeader : Record "Sales Header";
        SalesLine : Record "Sales Line";
        GenPostingSetup : Record "General Posting Setup";
        VATAmountLine : Record "VAT Amount Line" temporary;
        DimSetEntry1 : Record "Dimension Set Entry";
        DimSetEntry2 : Record "Dimension Set Entry";
        TempDimSetEntry : Record "Dimension Set Entry" temporary;
        CurrExchRate : Record "Currency Exchange Rate";
        InvtPeriod : Record "Inventory Period";
        FormatAddr : Codeunit "Format Address";
        DimMgt : Codeunit DimensionManagement;
        PayToAddr : array [8] of Text[50];
        BuyFromAddr : array [8] of Text[50];
        ShipToAddr : array [8] of Text[50];
        PurchHeaderFilter : Text[250];
        ErrorText : array [99] of Text[250];
        DimText : Text[120];
        OldDimText : Text[75];
        ReceiveInvoiceText : Text[50];
        ShipInvoiceText : Text[50];
        TotalText : Text[50];
        TotalInclVATText : Text[50];
        TotalExclVATText : Text[50];
        QtyToHandleCaption : Text[30];
        AllowPostingFrom : Date;
        AllowPostingTo : Date;
        MaxQtyToBeInvoiced : Decimal;
        RemQtyToBeInvoiced : Decimal;
        QtyToBeInvoiced : Decimal;
        QtyToHandle : Decimal;
        VATAmount : Decimal;
        VATBaseAmount : Decimal;
        VATDiscountAmount : Decimal;
        TotalAmountInclVAT : Decimal;
        ErrorCounter : Integer;
        OrigMaxLineNo : Integer;
        DropShipOrder : Boolean;
        InvOnNextPostReq : Boolean;
        ReceiveShipOnNextPostReq : Boolean;
        ShowDim : Boolean;
        Continue : Boolean;
        ShowItemChargeAssgnt : Boolean;
        Text040 : TextConst ENU='%1 must be zero.',ENN='%1 must be zero.';
        Text041 : TextConst ENU='%1 must not be %2 for %3 %4.',ENN='%1 must not be %2 for %3 %4.';
        Text042 : TextConst ENU='%1 must be completely preinvoiced before you can ship or invoice the line.',ENN='%1 must be completely preinvoiced before you can ship or invoice the line.';
        Text050 : TextConst ENU='VAT Amount Specification in ',ENN='VAT Amount Specification in ';
        Text051 : TextConst ENU='Local Currency',ENN='Local Currency';
        Text052 : TextConst ENU='Exchange rate: %1/%2',ENN='Exchange rate: %1/%2';
        VALVATBaseLCY : Decimal;
        VALVATAmountLCY : Decimal;
        VALSpecLCYHeader : Text[80];
        VALExchRate : Text[50];
        Text053 : TextConst ENU='%1 can at most be %2.',ENN='%1 can at most be %2.';
        Text054 : TextConst ENU='%1 must be at least %2.',ENN='%1 must be at least %2.';
        PricesInclVATtxt : Text[30];
        AllowInvDisctxt : Text[30];
        SumLineAmount : Decimal;
        SumInvDiscountAmount : Decimal;
        OtherTaxesAmount : Decimal;
        ChargesAmount : Decimal;
        Text13700 : TextConst ENU='Total %1 Incl. Taxes',ENN='Total %1 Incl. Taxes';
        Text13701 : TextConst ENU='Total %1 Excl. Taxes',ENN='Total %1 Excl. Taxes';
        Text16500 : TextConst ENU='The Service Tax Registration No. of the document should be same as that of the document applied.',ENN='The Service Tax Registration No. of the document should be same as that of the document applied.';
        Text16501 : TextConst ENU='The Service Tax Group Code of the document should be same as that of the document applied.',ENN='The Service Tax Group Code of the document should be same as that of the document applied.';
        ServiceTaxEntry : Record "Service Tax Entry";
        ServiceTaxAmt : Decimal;
        ServiceTaxECessAmt : Decimal;
        AppliedServiceTaxAmt : Decimal;
        AppliedServiceTaxECessAmt : Decimal;
        NetTotal : Decimal;
        Text16502 : TextConst ENU='Sum of CIF Amount and BCD Amount should not be 0 for CVD Calculation.',ENN='Sum of CIF Amount and BCD Amount should not be 0 for CVD Calculation.';
        ServiceTaxSHECessAmt : Decimal;
        AppliedServiceTaxSHECessAmt : Decimal;
        Text16503 : TextConst ENU='Fixed Asset or Capital Item Should not be Used in Trading Transaction',ENN='Fixed Asset or Capital Item Should not be Used in Trading Transaction';
        Text16504 : TextConst ENU='This Excise Refund Transaction can not be posted in case of an Excise Loading on Inventory Transaction.',ENN='This Excise Refund Transaction can not be posted in case of an Excise Loading on Inventory Transaction.';
        Text16505 : TextConst ENU='This Excise Refund Transaction can not be posted in case of a Trading Transaction.',ENN='This Excise Refund Transaction can not be posted in case of a Trading Transaction.';
        Text16506 : TextConst ENU='This Excise Refund Transaction can not be posted in case of a CVD Transaction.',ENN='This Excise Refund Transaction can not be posted in case of a CVD Transaction.';
        Text16507 : TextConst ENU='Job Type must not be Capital WIP in case of Trading in Document Type=%1, Document No.=%2, Line No.=%3.',ENN='Job Type must not be Capital WIP in case of Trading in Document Type=%1, Document No.=%2, Line No.=%3.';
        Text16509 : TextConst ENU='Job Type must not be Capital WIP in case of Input Service Distribution in Document Type=%1, Document No.=%2, Line No.=%3.',ENN='Job Type must not be Capital WIP in case of Input Service Distribution in Document Type=%1, Document No.=%2, Line No.=%3.';
        Text16510 : TextConst ENU='CWIP G/L Type must be   in Purchase Line Document Type=%1,Document No.=%2,Line No.=%3.',ENN='CWIP G/L Type must be   in Purchase Line Document Type=%1,Document No.=%2,Line No.=%3.';
        Text16511 : TextConst ENU='Job Type Capital WIP must not be selected with non Capital WIP type of job.',ENN='Job Type Capital WIP must not be selected with non Capital WIP type of job.';
        Text16512 : TextConst ENU='Job No. must not be blank, if CWIP Type of Job is selected on order, in Document Type=%1, Document No.=%2, Line No.=%3. ',ENN='Job No. must not be blank, if CWIP Type of Job is selected on order, in Document Type=%1, Document No.=%2, Line No.=%3. ';
        Text16508 : TextConst ENU='%1 must not be %2 in Purchase Line Document Type=%3,Document No.=%4,Line No.=%5.',ENN='%1 must not be %2 in Purchase Line Document Type=%3,Document No.=%4,Line No.=%5.';
        SumExciseAmount : Decimal;
        SumTaxAmount : Decimal;
        SumSvcTaxAmount : Decimal;
        SumSvcTaxeCessAmount : Decimal;
        SumSvcTaxSHECESSAmount : Decimal;
        SumAmountToVendor : Decimal;
        SumTotalTDSIncSHECESS : Decimal;
        SumWorkTaxAmount : Decimal;
        Text16522 : TextConst ENU='Tax Type must be %1 for Tax Jurisdiction in Tax Area Line %2',ENN='Tax Type must be %1 for Tax Jurisdiction in Tax Area Line %2';
        TaxAreaLine : Record "Tax Area Line";
        TaxJurisdiction : Record "Tax Jurisdiction";
        TaxType : Text[30];
        AmountToVendor : Decimal;
        AmountToVendor2 : Decimal;
        TempSvcTaxAppllBuffer : Record "Service Tax Application Buffer" temporary;
        ServiceTaxExists : Boolean;
        Text16523 : TextConst ENU='The Applied Payment Document %1 should not have amount to apply greater than %2.',ENN='The Applied Payment Document %1 should not have amount to apply greater than %2.';
        Text16524 : TextConst ENU='Service Tax Advance Payment Document/s cannot be applied with non Service Tax Invoice/s.',ENN='Service Tax Advance Payment Document/s cannot be applied with non Service Tax Invoice/s.';
        Text16525 : TextConst ENU='The Payment %1 is not an Input Service Distribution Payment. Hence cannot be applied with the Invoice %2.',ENN='The Payment %1 is not an Input Service Distribution Payment. Hence cannot be applied with the Invoice %2.';
        Text16526 : TextConst ENU='Document Type %1 should not be applied against a Refund document %2 having service tax on advance payment.',ENN='Document Type %1 should not be applied against a Refund document %2 having service tax on advance payment.';
        Text16527 : TextConst ENU='Invoice/s and Payment/s documents cannot be applied as both have different Service Tax Rounding Precision/Type.',ENN='Invoice/s and Payment/s documents cannot be applied as both have different Service Tax Rounding Precision/Type.';
        Text16528 : TextConst ENU='Invoice/s and Payment/s documents cannot be applied as both have different Service Tax Group Codes.',ENN='Invoice/s and Payment/s documents cannot be applied as both have different Service Tax Group Codes.';
        Text16529 : TextConst ENU='Invoice/s and Payment/s documents cannot be applied as both have different Service Tax Registration Nos.',ENN='Invoice/s and Payment/s documents cannot be applied as both have different Service Tax Registration Nos.';
        Purchase_Document___TestCaptionLbl : TextConst ENU='Purchase Document - Test',ENN='Purchase Document - Test';
        CurrReport_PAGENOCaptionLbl : TextConst ENU='Page',ENN='Page';
        Ship_toCaptionLbl : TextConst ENU='Ship-to',ENN='Ship-to';
        Buy_fromCaptionLbl : TextConst ENU='To,',ENN='Buy-from';
        Pay_toCaptionLbl : TextConst ENU='Pay-to',ENN='Pay-to';
        Purchase_Header___Posting_Date_CaptionLbl : TextConst ENU='Posting Date',ENN='Posting Date';
        Purchase_Header___Document_Date_CaptionLbl : TextConst ENU='Document Date',ENN='Document Date';
        Purchase_Header___Due_Date_CaptionLbl : TextConst ENU='Due Date',ENN='Due Date';
        Purchase_Header___Pmt__Discount_Date_CaptionLbl : TextConst ENU='Pmt. Discount Date',ENN='Pmt. Discount Date';
        Purchase_Header___Posting_Date__Control106CaptionLbl : TextConst ENU='Posting Date',ENN='Posting Date';
        Purchase_Header___Document_Date__Control107CaptionLbl : TextConst ENU='Document Date',ENN='Document Date';
        Purchase_Header___Order_Date_CaptionLbl : TextConst ENU='Order Date',ENN='Order Date';
        Purchase_Header___Expected_Receipt_Date_CaptionLbl : TextConst ENU='Expected Receipt Date',ENN='Expected Receipt Date';
        Purchase_Header___Due_Date__Control19CaptionLbl : TextConst ENU='Due Date',ENN='Due Date';
        Purchase_Header___Pmt__Discount_Date__Control22CaptionLbl : TextConst ENU='Pmt. Discount Date',ENN='Pmt. Discount Date';
        Purchase_Header___Posting_Date__Control112CaptionLbl : TextConst ENU='Posting Date',ENN='Posting Date';
        Purchase_Header___Document_Date__Control113CaptionLbl : TextConst ENU='Document Date',ENN='Document Date';
        Purchase_Header___Posting_Date__Control130CaptionLbl : TextConst ENU='Posting Date',ENN='Posting Date';
        Purchase_Header___Document_Date__Control131CaptionLbl : TextConst ENU='Document Date',ENN='Document Date';
        Header_DimensionsCaptionLbl : TextConst ENU='Header Dimensions',ENN='Header Dimensions';
        ErrorText_Number_CaptionLbl : TextConst ENU='Warning!',ENN='Warning!';
        AmountCaptionLbl : TextConst ENU='Amount',ENN='Amount';
        Purchase_Line___Line_Discount_Amount_CaptionLbl : TextConst ENU='Line Discount Amount',ENN='Line Discount Amount';
        Purchase_Line___Line_Discount___CaptionLbl : TextConst ENU='Line Disc. %',ENN='Line Disc. %';
        Direct_Unit_CostCaptionLbl : TextConst ENU='Direct Unit Cost',ENN='Direct Unit Cost';
        TempPurchLine__Inv__Discount_Amount_CaptionLbl : TextConst ENU='Inv. Discount Amount',ENN='Inv. Discount Amount';
        SubtotalCaptionLbl : TextConst ENU='Subtotal',ENN='Subtotal';
        TempPurchLine__Excise_Amount_CaptionLbl : TextConst ENU='Excise Amount',ENN='Excise Amount';
        TempPurchLine__Tax_Amount_CaptionLbl : TextConst ENU='Tax Amount',ENN='Tax Amount';
        ServiceTaxAmtCaptionLbl : TextConst ENU='Service Tax Amount',ENN='Service Tax Amount';
        TempPurchLine__Total_TDS_Including_SHE_CESS_CaptionLbl : TextConst ENU='Total TDS Incl. eCess Amount',ENN='Total TDS Incl. eCess Amount';
        TempPurchLine__Work_Tax_Amount_CaptionLbl : TextConst ENU='Work Tax Amount',ENN='Work Tax Amount';
        Other_Taxes_AmountCaptionLbl : TextConst ENU='Other Taxes Amount',ENN='Other Taxes Amount';
        Charges_AmountCaptionLbl : TextConst ENU='Charges Amount',ENN='Charges Amount';
        ServiceTaxECessAmtCaptionLbl : TextConst ENU='Service Tax eCess Amount',ENN='Service Tax eCess Amount';
        Svc_Tax_Amt__Applied_CaptionLbl : TextConst ENU='Svc Tax Amt (Applied)',ENN='Svc Tax Amt (Applied)';
        Svc_Tax_eCess_Amt__Applied_CaptionLbl : TextConst ENU='Svc Tax eCess Amt (Applied)',ENN='Svc Tax eCess Amt (Applied)';
        ServiceTaxSHECessAmtCaptionLbl : TextConst ENU='Service Tax SHECess Amount',ENN='Service Tax SHECess Amount';
        Svc_Tax_SHECess_Amt_Applied_CaptionLbl : TextConst ENU='Svc Tax SHECess Amt(Applied)',ENN='Svc Tax SHECess Amt(Applied)';
        VATDiscountAmountCaptionLbl : TextConst ENU='Payment Discount on VAT',ENN='Payment Discount on VAT';
        Line_DimensionsCaptionLbl : TextConst ENU='Line Dimensions',ENN='Line Dimensions';
        ErrorText_Number__Control103CaptionLbl : TextConst ENU='Warning!',ENN='Warning!';
        VAT_Amount_SpecificationCaptionLbl : TextConst ENU='VAT Amount Specification',ENN='VAT Amount Specification';
        VATAmountLine__VAT_Amount__Control98CaptionLbl : TextConst ENU='VAT Amount',ENN='VAT Amount';
        VATAmountLine__VAT_Base__Control138CaptionLbl : TextConst ENU='VAT Base',ENN='VAT Base';
        VATAmountLine__VAT___CaptionLbl : TextConst ENU='VAT %',ENN='VAT %';
        VATAmountLine__VAT_Identifier_CaptionLbl : TextConst ENU='VAT Identifier',ENN='VAT Identifier';
        VATAmountLine__Inv__Disc__Base_Amount__Control176CaptionLbl : TextConst ENU='Invoice Discount Base Amount',ENN='Invoice Discount Base Amount';
        VATAmountLine__Line_Amount__Control175CaptionLbl : TextConst ENU='Line Amount',ENN='Line Amount';
        VATAmountLine__Invoice_Discount_Amount__Control177CaptionLbl : TextConst ENU='Invoice Discount Amount',ENN='Invoice Discount Amount';
        VATAmountLine__VAT_Base_CaptionLbl : TextConst ENU='Continued',ENN='Continued';
        VATAmountLine__VAT_Base__Control139CaptionLbl : TextConst ENU='Continued',ENN='Continued';
        VATAmountLine__VAT_Base__Control137CaptionLbl : TextConst ENU='Total',ENN='Total';
        VALVATAmountLCY_Control242CaptionLbl : TextConst ENU='VAT Amount',ENN='VAT Amount';
        VALVATBaseLCY_Control243CaptionLbl : TextConst ENU='VAT Base',ENN='VAT Base';
        VATAmountLine__VAT____Control244CaptionLbl : TextConst ENU='VAT %',ENN='VAT %';
        VATAmountLine__VAT_Identifier__Control245CaptionLbl : TextConst ENU='VAT Identifier',ENN='VAT Identifier';
        ContinuedCaptionLbl : TextConst ENU='Continued',ENN='Continued';
        ContinuedCaption_Control248Lbl : TextConst ENU='Continued',ENN='Continued';
        TotalCaptionLbl : TextConst ENU='Total',ENN='Total';
        Item_Charge_SpecificationCaptionLbl : TextConst ENU='Item Charge Specification',ENN='Item Charge Specification';
        DescriptionCaptionLbl : TextConst ENU='Description',ENN='Description';
        PurchLine2_QuantityCaptionLbl : TextConst ENU='Assignable Qty',ENN='Assignable Qty';
        ContinuedCaption_Control197Lbl : TextConst ENU='Continued',ENN='Continued';
        TotalCaption_Control194Lbl : TextConst ENU='Total',ENN='Total';
        ContinuedCaption_Control192Lbl : TextConst ENU='Continued',ENN='Continued';
        NO_OF_HEADS : Integer;
        HEADS_VALUES : array [10] of Decimal;
        HEADS_INFORMATION : array [10] of Code[10];
        I : Integer;
        AVB : Boolean;
        Title : Text[30];
        jV : Boolean;
        LineTotAmt : Decimal;
        LineAmt : Decimal;
        "-NAVIN-" : Integer;
        StructureLineDetails : Record "Structure Order Line Details";
        TotalTaxAmount : Decimal;
        ExciseAmount : Decimal;
        Charges : Decimal;
        Othertaxes : Decimal;
        SalesTax : Decimal;
        ServiceTax : Decimal;
        ExchangeRate : Decimal;
        CurrExchgRate : Record "Currency Exchange Rate";
        Payment_Terms : Record "Payment Terms";
        GPS : Record "General Posting Setup";
        "Account Head" : Text[75];
        Item_Desc : Text[50];
        "Purch. Rcpt Header" : Record "Purch. Rcpt. Header";
        Inward_Date : Date;
        Choice : Option Inv,Jnl;
        Dept : Text[30];
        "Dimension Value" : Record "Dimension Value";
        "Fixed Asset" : Record "Fixed Asset";
        "G\L" : Record "G/L Account";
        Man_Val : Decimal;
        Round_Value : Decimal;
        FA_DEPRICIATION : Record "FA Depreciation Book";
        FA_POSTING_GROUP : Record "FA Posting Group";
        EPS : Record "Excise Posting Setup";
        STR_ORDER_DETAILS : Record "Structure Order Details";
        ACNT_HEAD_NAME : Text[50];
        "G/L" : Record "G/L Account";
        TAX_TYPE : Code[10];
        cash : Text[30];
        CASH1 : Boolean;
        SUPPLIER_NAME_M_s__CaptionLbl : Label 'SUPPLIER NAME M/s .';
        STATIONCaptionLbl : Label 'STATION';
        BILL_No_CaptionLbl : Label 'BILL No.';
        BILL_DATECaptionLbl : Label 'BILL DATE';
        BILL_AMT__Rs_CaptionLbl : Label 'BILL AMT. Rs.';
        ACCOUNT_HEADCaptionLbl : Label 'ACCOUNT HEAD';
        ITEM_DESCRIPTIONCaptionLbl : Label 'ITEM DESCRIPTION';
        FORM_S_DUECaptionLbl : Label 'FORM''S DUE';
        PAYMENT_DETAILSCaptionLbl : Label 'PAYMENT DETAILS';
        CREDIT_DAYSCaptionLbl : Label 'CREDIT DAYS';
        FRIEGHT_PAID_BY_USCaptionLbl : Label 'FRIEGHT PAID BY US';
        MANAGER_CaptionLbl : Label '"MANAGER "';
        EmptyStringCaptionLbl : Label '.............................';
        FormsDue : Text;
        CrDays : Text;
        TesVar : Decimal;
        TestVar1 : Decimal;
        Total_CaptionLbl : Label 'Total Amount (LCY)';
        BillValue : Decimal;
        "$" : Decimal;
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
        KKCessAmtCaptionLbl : Label 'KKC Amount';
        KKCess_Amt__Applied_CaptionLbl : Label 'KK Cess Amt (Applied)';
        BOut : Code[20];
        Prchdr : Record "Purchase Header";
        strcount : Integer;
        cscount : Integer;
        rdcount : Integer;
        OtherStores : Code[50];
        PurchLineT : Record "Purchase Line";
        HeaderTextDesc : Text;
        TIN : Record "T.I.N. Nos.";
        TNo : Code[30];
        CSTNo : Code[50];
        CompanyInfo : Record "Company Information";
        CompanyAddr : array [8] of Text[100];
        Ph_CaptionLbl : Label 'Ph:';
        FAX_CaptionLbl : Label '"   FAX:"';
        URL_CaptionLbl : Label 'URL:';
        E__Mail_CaptionLbl : Label 'E- Mail:';
        purchase_efftronics_comCaptionLbl : Label 'purchase@efftronics.com';
        ToCaption_lbl : Label 'To,';
        DateCaptionlbl : Label 'Date';
        TINNoCaption : Label '"TIN: "';
        CSTNoCaption : Label '"CST: "';
        Certify_Caption : Label '" Certified that the Particulars given above are true and correct and the amount indicated represents the price actually charged and that there is no flow of additional consideration directly or indirectly from the buyer"';
        Rupees_Words_Caption : Label '" Rupees   (in   Words):"';
        LineTotAmt_Ex_Tax : Decimal;
        Tot_Amt_To_Vendor : Decimal;
        descri : array [2] of Text[250];
        check : Report Check;
                    TotIncTaxes : Label 'Grand Total';
        LinesCount : Integer;
        Tariff_Heading_No__CaptionLbl : Label 'Tariff Heading No.:';
        C_E__RegN__No__AAACE4879QXM001__E_C_Code_No_AAACE_4879Q_XM001_Range_IV_divn_VijayaLbl : Label 'C.E. RegN. No. AAACE4879QXM001';
        ECCCaptionLbl : Label '"E.C. Code No. AAACE 4879Q XM001.Range IV:divn:Vijayawada  "';
        CentralCaptionLbl : Label 'Central Revenue Building, M.G. Road, Vijayawada - 520002';
        SubTotalCaption : Label 'Sub Total';
        TaxBaseAmt : Decimal;
        Vendor_ECC_No : Code[30];
        DebitNoteAmtDesc : Text;
        TotAmtt : Decimal;
        SerialNo : Integer;
        PLineTemp : Record "Purchase Line";
        PLineTemp1 : Record "Purchase Line" temporary;
        NewSerialNo : Integer;
        UOM : Label 'UOM';
        Vendor_TIN_No : Code[100];
        Vendor_CST_No : Code[100];

    [LineStart(13125)]
    local procedure AddError(Text : Text[250]);
    begin
        ErrorCounter := ErrorCounter + 1;
        ErrorText[ErrorCounter] := Text;
    end;

    [LineStart(13129)]
    local procedure CheckRcptLines(PurchLine2 : Record "Purchase Line");
    var
        TempPostedDimSetEntry : Record "Dimension Set Entry" temporary;
    begin
        WITH PurchLine2 DO BEGIN
          IF ABS(RemQtyToBeInvoiced) > ABS("Qty. to Receive") THEN BEGIN
            PurchRcptLine.RESET;
            CASE "Document Type" OF
              "Document Type"::Order:
                BEGIN
                  PurchRcptLine.SETCURRENTKEY("Order No.","Order Line No.");
                  PurchRcptLine.SETRANGE("Order No.","Document No.");
                  PurchRcptLine.SETRANGE("Order Line No.","Line No.");
                END;
              "Document Type"::Invoice:
                BEGIN
                  PurchRcptLine.SETRANGE("Document No.","Receipt No.");
                  PurchRcptLine.SETRANGE("Line No.","Receipt Line No.");
                END;
            END;

            PurchRcptLine.SETFILTER("Qty. Rcd. Not Invoiced",'<>0');
            IF PurchRcptLine.FIND('-') THEN
              REPEAT
                DimMgt.GetDimensionSet(TempPostedDimSetEntry,PurchRcptLine."Dimension Set ID");
                IF NOT DimMgt.CheckDimIDConsistency(
                     TempDimSetEntry,TempPostedDimSetEntry,DATABASE::"Purchase Line",DATABASE::"Purch. Rcpt. Line")
                THEN
                  AddError(DimMgt.GetDocDimConsistencyErr);
                IF PurchRcptLine."Buy-from Vendor No." <> "Buy-from Vendor No." THEN
                  AddError(
                    STRSUBSTNO(
                      Text022,
                      FIELDCAPTION("Buy-from Vendor No.")));
                IF PurchRcptLine.Type <> Type THEN
                  AddError(
                    STRSUBSTNO(
                      Text022,
                      FIELDCAPTION(Type)));
                IF PurchRcptLine."No." <> "No." THEN
                  AddError(
                    STRSUBSTNO(
                      Text022,
                      FIELDCAPTION("No.")));
                IF PurchRcptLine."Gen. Bus. Posting Group" <> "Gen. Bus. Posting Group" THEN
                  AddError(
                    STRSUBSTNO(
                      Text022,
                      FIELDCAPTION("Gen. Bus. Posting Group")));
                IF PurchRcptLine."Gen. Prod. Posting Group" <> "Gen. Prod. Posting Group" THEN
                  AddError(
                    STRSUBSTNO(
                      Text022,
                      FIELDCAPTION("Gen. Prod. Posting Group")));
                IF PurchRcptLine."Location Code" <> "Location Code" THEN
                  AddError(
                    STRSUBSTNO(
                      Text022,
                      FIELDCAPTION("Location Code")));
                IF PurchRcptLine."Job No." <> "Job No." THEN
                  AddError(
                    STRSUBSTNO(
                      Text022,
                      FIELDCAPTION("Job No.")));

                IF PurchLine."Qty. to Invoice" * PurchRcptLine.Quantity < 0 THEN
                  AddError(STRSUBSTNO(Text023,FIELDCAPTION("Qty. to Invoice")));

                QtyToBeInvoiced := RemQtyToBeInvoiced - PurchLine."Qty. to Receive";
                IF ABS(QtyToBeInvoiced) > ABS(PurchRcptLine.Quantity - PurchRcptLine."Quantity Invoiced") THEN
                  QtyToBeInvoiced := PurchRcptLine.Quantity - PurchRcptLine."Quantity Invoiced";
                RemQtyToBeInvoiced := RemQtyToBeInvoiced - QtyToBeInvoiced;
                PurchRcptLine."Quantity Invoiced" := PurchRcptLine."Quantity Invoiced" + QtyToBeInvoiced;
              UNTIL (PurchRcptLine.NEXT = 0) OR (ABS(RemQtyToBeInvoiced) <= ABS("Qty. to Receive"))
            ELSE
              AddError(
                STRSUBSTNO(
                  Text033,
                  "Receipt Line No.",
                  "Receipt No."));
          END;

          IF ABS(RemQtyToBeInvoiced) > ABS("Qty. to Receive") THEN
            IF "Document Type" = "Document Type"::Invoice THEN
              AddError(
                STRSUBSTNO(
                  Text037,
                  "Receipt No."))
        END;
    end;

    [LineStart(13216)]
    local procedure CheckShptLines(PurchLine2 : Record "Purchase Line");
    var
        TempPostedDimSetEntry : Record "Dimension Set Entry" temporary;
    begin
        WITH PurchLine2 DO BEGIN
          IF ABS(RemQtyToBeInvoiced) > ABS("Return Qty. to Ship") THEN BEGIN
            ReturnShptLine.RESET;
            CASE "Document Type" OF
              "Document Type"::"Return Order":
                BEGIN
                  ReturnShptLine.SETCURRENTKEY("Return Order No.","Return Order Line No.");
                  ReturnShptLine.SETRANGE("Return Order No.","Document No.");
                  ReturnShptLine.SETRANGE("Return Order Line No.","Line No.");
                END;
              "Document Type"::"Credit Memo":
                BEGIN
                  ReturnShptLine.SETRANGE("Document No.","Return Shipment No.");
                  ReturnShptLine.SETRANGE("Line No.","Return Shipment Line No.");
                END;
            END;

            PurchRcptLine.SETFILTER("Qty. Rcd. Not Invoiced",'<>0');
            IF ReturnShptLine.FIND('-') THEN
              REPEAT
                DimMgt.GetDimensionSet(TempPostedDimSetEntry,ReturnShptLine."Dimension Set ID");
                IF NOT DimMgt.CheckDimIDConsistency(
                     TempDimSetEntry,TempPostedDimSetEntry,DATABASE::"Purchase Line",DATABASE::"Return Shipment Line")
                THEN
                  AddError(DimMgt.GetDocDimConsistencyErr);

                IF ReturnShptLine."Buy-from Vendor No." <> "Buy-from Vendor No." THEN
                  AddError(
                    STRSUBSTNO(
                      Text036,
                      FIELDCAPTION("Buy-from Vendor No.")));
                IF ReturnShptLine.Type <> Type THEN
                  AddError(
                    STRSUBSTNO(
                      Text036,
                      FIELDCAPTION(Type)));
                IF ReturnShptLine."No." <> "No." THEN
                  AddError(
                    STRSUBSTNO(
                      Text036,
                      FIELDCAPTION("No.")));
                IF ReturnShptLine."Gen. Bus. Posting Group" <> "Gen. Bus. Posting Group" THEN
                  AddError(
                    STRSUBSTNO(
                      Text036,
                      FIELDCAPTION("Gen. Bus. Posting Group")));
                IF ReturnShptLine."Gen. Prod. Posting Group" <> "Gen. Prod. Posting Group" THEN
                  AddError(
                    STRSUBSTNO(
                      Text036,
                      FIELDCAPTION("Gen. Prod. Posting Group")));
                IF ReturnShptLine."Location Code" <> "Location Code" THEN
                  AddError(
                    STRSUBSTNO(
                      Text036,
                      FIELDCAPTION("Location Code")));
                IF ReturnShptLine."Job No." <> "Job No." THEN
                  AddError(
                    STRSUBSTNO(
                      Text036,
                      FIELDCAPTION("Job No.")));

                IF -PurchLine."Qty. to Invoice" * ReturnShptLine.Quantity < 0 THEN
                  AddError(STRSUBSTNO(Text025,FIELDCAPTION("Qty. to Invoice")));
                QtyToBeInvoiced := RemQtyToBeInvoiced - PurchLine."Return Qty. to Ship";
                IF ABS(QtyToBeInvoiced) > ABS(ReturnShptLine.Quantity - ReturnShptLine."Quantity Invoiced") THEN
                  QtyToBeInvoiced := ReturnShptLine.Quantity - ReturnShptLine."Quantity Invoiced";
                RemQtyToBeInvoiced := RemQtyToBeInvoiced - QtyToBeInvoiced;
                ReturnShptLine."Quantity Invoiced" := ReturnShptLine."Quantity Invoiced" + QtyToBeInvoiced;
              UNTIL (ReturnShptLine.NEXT = 0) OR (ABS(RemQtyToBeInvoiced) <= ABS("Return Qty. to Ship"))
            ELSE
              AddError(
                STRSUBSTNO(
                  Text034,
                  "Return Shipment Line No.",
                  "Return Shipment No."));
          END;

          IF ABS(RemQtyToBeInvoiced) > ABS("Return Qty. to Ship") THEN
            IF "Document Type" = "Document Type"::"Credit Memo" THEN
              AddError(
                STRSUBSTNO(
                  Text038,
                  "Return Shipment No."));
        END;
    end;

    [LineStart(13303)]
    procedure INCLUDE_ITEMS_HEAD_INFO(HEAD_NO : Code[10];VALUE : Decimal);
    begin

        IF NO_OF_HEADS>0 THEN
        BEGIN
          AVB:=FALSE;
          FOR I:=1 TO NO_OF_HEADS DO
            IF HEAD_NO=HEADS_INFORMATION[I] THEN
            BEGIN
              IF "Purchase Header"."Currency Factor" <> 0 THEN BEGIN
                TesVar := (LineTotAmt-TempPurchLine."Inv. Discount Amount"-TempPurchLine."Bal. TDS Including SHE CESS" - TempPurchLine."Work Tax Amount");
                TestVar1 := TesVar/"Purchase Header"."Currency Factor";
                //>>Added by Pranavi on 01-04-2017
                // HEADS_VALUES[I] := TestVar1;
                HEADS_VALUES[I] += VALUE;
                //<<Added by Pranavi on 01-04-2017
                // HEADS_VALUES[I] += VALUE/"Purchase Header"."Currency Factor";
              END ELSE
                HEADS_VALUES[I] += VALUE;
                // MESSAGE('%1',HEADS_VALUES[I]); //ADSK
              AVB:=TRUE;
            END;
          IF NOT AVB THEN
          BEGIN
            NO_OF_HEADS+=1;
            HEADS_INFORMATION[NO_OF_HEADS]:=HEAD_NO;
            HEADS_VALUES[NO_OF_HEADS]:=VALUE;
          END;
        END ELSE
        BEGIN
          NO_OF_HEADS+=1;
          HEADS_INFORMATION[NO_OF_HEADS]:=HEAD_NO;
          HEADS_VALUES[NO_OF_HEADS]:=VALUE;
        END;
        //>>Added by Pranavi on 01-04-2017
        IF "Purchase Header"."Currency Factor" <> 0 THEN
        BEGIN
          TesVar := (LineTotAmt-TempPurchLine."Inv. Discount Amount"-TempPurchLine."Bal. TDS Including SHE CESS" - TempPurchLine."Work Tax Amount");
          TestVar1 := TesVar/"Purchase Header"."Currency Factor";
        END;
        //<<Added by Pranavi on 01-04-2017
    end;

    [LineStart(13344)]
    procedure TestJobFields(var PurchLine : Record "Purchase Line");
    var
        Job : Record Job;
        JT : Record "Job Task";
        PurchHeader2 : Record "Purchase Header";
        PurchLine3 : Record "Purchase Line";
        Job1 : Record Job;
    begin
        WITH PurchLine DO BEGIN
          IF "Job No." = '' THEN
            EXIT;
          // IN0061.begin
          IF Job.GET("Job No.") THEN BEGIN
            PurchHeader2.GET("Document Type","Document No.");
            IF (Job."Job Type" = Job."Job Type"::"Capital WIP") AND
              NOT ("Job Line Type" IN ["Job Line Type"::" ","Job Line Type"::Schedule])
            THEN BEGIN
              AddError(STRSUBSTNO(Text16508,FIELDCAPTION("Job Line Type"),"Job Line Type","Document Type","Document No.","Line No."));
              EXIT;
            END;
            IF (Job."Job Type" = Job."Job Type"::"Capital WIP") AND PurchHeader2.Trading THEN BEGIN
              AddError(STRSUBSTNO(Text16507,"Document Type","Document No.","Line No."));
              EXIT;
            END;
            IF (Job."Job Type" = Job."Job Type"::"Capital WIP") AND PurchHeader2."Input Service Distribution" AND
              (PurchLine."Service Tax Amount" <> 0)
            THEN BEGIN
                AddError(STRSUBSTNO(Text16509,"Document Type","Document No.","Line No."));
                EXIT;
            END;
            IF (Job."Job Type" = Job."Job Type"::"Capital WIP") AND ("CWIP G/L Type" = "CWIP G/L Type"::" ") THEN BEGIN
              AddError(STRSUBSTNO(Text16508,FIELDCAPTION("CWIP G/L Type"),"CWIP G/L Type","Document Type","Document No.","Line No."));
              EXIT;
            END;
            IF (Job."Job Type" <> Job."Job Type"::"Capital WIP") AND ("CWIP G/L Type" <> "CWIP G/L Type"::" ") THEN BEGIN
              AddError(STRSUBSTNO(Text16510,"Document Type","Document No.","Line No."));
              EXIT;
            END;
            IF (Job."Job Type" = Job."Job Type"::"Capital WIP") THEN BEGIN
              PurchLine3.RESET;
              PurchLine3.SETRANGE("Document Type","Document Type");
              PurchLine3.SETRANGE("Document No.","Document No.");
              IF PurchLine3.FINDSET THEN
                REPEAT
                  IF PurchLine3."Job No." <> '' THEN BEGIN
                    Job1.GET(PurchLine3."Job No.");
                    IF Job1."Job Type" <> Job1."Job Type"::"Capital WIP" THEN BEGIN
                      AddError(Text16511);
                      EXIT;
                    END;
                  END ELSE BEGIN
                    AddError(STRSUBSTNO(Text16512,PurchLine3."Document Type",PurchLine3."Document No.",PurchLine3."Line No."));
                    EXIT;
                  END;
                UNTIL PurchLine3.NEXT = 0;
            END;
          END;
          // IN0061.end
          IF (Type <> Type::"G/L Account") AND (Type <> Type::Item) THEN
            EXIT;
          IF ("Document Type" <> "Document Type"::Invoice) AND
             ("Document Type" <> "Document Type"::"Credit Memo")
          THEN
            EXIT;
          IF NOT Job.GET("Job No.") THEN
            AddError(STRSUBSTNO(Text053,Job.TABLECAPTION,"Job No."))
          ELSE
            IF Job.Blocked > Job.Blocked::" " THEN
              AddError(
                STRSUBSTNO(
                  Text054,Job.FIELDCAPTION(Blocked),Job.Blocked,Job.TABLECAPTION,"Job No."));

          IF "Job Task No." = '' THEN
            AddError(STRSUBSTNO(Text006,FIELDCAPTION("Job Task No.")))
          ELSE
            IF NOT JT.GET("Job No.","Job Task No.") THEN
              AddError(STRSUBSTNO(Text053,JT.TABLECAPTION,"Job Task No."))
        END;
    end;

    [LineStart(13416)]
    local procedure IsInvtPosting() : Boolean;
    var
        PurchLine : Record "Purchase Line";
    begin
        WITH "Purchase Header" DO BEGIN
          PurchLine.SETRANGE("Document Type","Document Type");
          PurchLine.SETRANGE("Document No.","No.");
          PurchLine.SETFILTER(Type,'%1|%2',PurchLine.Type::Item,PurchLine.Type::"Charge (Item)");
          IF PurchLine.ISEMPTY THEN
            EXIT(FALSE);
          IF Receive THEN BEGIN
            PurchLine.SETFILTER("Qty. to Receive",'<>%1',0);
            IF NOT PurchLine.ISEMPTY THEN
              EXIT(TRUE);
          END;
          IF Ship THEN BEGIN
            PurchLine.SETFILTER("Return Qty. to Ship",'<>%1',0);
            IF NOT PurchLine.ISEMPTY THEN
              EXIT(TRUE);
          END;
          IF Invoice THEN BEGIN
            PurchLine.SETFILTER("Qty. to Invoice",'<>%1',0);
            IF NOT PurchLine.ISEMPTY THEN
              EXIT(TRUE);
          END;
        END;
    end;

    [LineStart(13440)]
    procedure AddDimToTempLine(PurchLine : Record "Purchase Line");
    var
        SourceCodesetup : Record "Source Code Setup";
        TableID : array [10] of Integer;
        No : array [10] of Code[20];
    begin
        SourceCodesetup.GET;

        WITH PurchLine DO BEGIN
          TableID[1] := DimMgt.TypeToTableID3(Type);
          No[1] := "No.";
          TableID[2] := DATABASE::Job;
          No[2] := "Job No.";
          TableID[3] := DATABASE::"Responsibility Center";
          No[3] := "Responsibility Center";

          "Shortcut Dimension 1 Code" := '';
          "Shortcut Dimension 2 Code" := '';

          "Dimension Set ID" :=
            DimMgt.GetDefaultDimID(TableID,No,SourceCodesetup.Purchases,"Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
              "Dimension Set ID",DATABASE::Vendor);
        END;
    end;

    [LineStart(13459)]
    procedure CheckExciseRefund(PurchaseLine : Record "Purchase Line");
    begin
        // IN0063.begin
        WITH PurchaseLine DO BEGIN
          IF "Excise Refund" THEN BEGIN
            IF "Excise Loading on Inventory" THEN
              AddError(Text16504);
            IF PurchHeader.Trading THEN
             AddError(Text16505);
            IF PurchHeader.CVD THEN
              AddError(Text16506);
          END;
        END;
    end;

    [LineStart(13472)]
    procedure FilterAppliedEntries();
    var
        OldVendLedgEntry : Record "Vendor Ledger Entry";
        ServiceTaxEntry : Record "Service Tax Entry";
        Vendor : Record Vendor;
        Currency : Record Currency;
        GenLedgSetup : Record "General Ledger Setup";
        PurchLine3 : Record "Purchase Line";
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
        // PS39773.begin
        WITH "Purchase Header" DO BEGIN
          Vendor.GET("Pay-to Vendor No.");
          AmountforAppl := ROUND("Purchase Line"."Amount To Vendor");

          ApplyingDate := "Posting Date";
          Vend.GET("Pay-to Vendor No.");
          IF "Applies-to Doc. No." <> '' THEN BEGIN
            OldVendLedgEntry.RESET;
            OldVendLedgEntry.SETCURRENTKEY("Document No.","Document Type","Vendor No.");
            OldVendLedgEntry.SETRANGE("Document No.","Applies-to Doc. No.");
            OldVendLedgEntry.SETRANGE("Document Type","Applies-to Doc. Type");
            OldVendLedgEntry.SETRANGE("Vendor No.","Pay-to Vendor No.");
            IF "Document Type" <> "Document Type"::"Credit Memo" THEN   // Condition added by Pranavi on 10-03-2017 to clear error in test report in debit note
              OldVendLedgEntry.SETRANGE(Open,TRUE);
            OldVendLedgEntry.SETRANGE("On Hold",'');

            OldVendLedgEntry.FINDFIRST;
            IF NOT OldVendLedgEntry."Serv. Tax on Advance Payment" THEN
              EXIT;
            IF OldVendLedgEntry."Posting Date" > ApplyingDate THEN
              ApplyingDate := OldVendLedgEntry."Posting Date";
            GenJnlApply.CheckAgainstApplnCurrency("Currency Code",OldVendLedgEntry."Currency Code",AccType::Vendor,TRUE);
            OldVendLedgEntry.CALCFIELDS("Remaining Amount");
            IF "Currency Code" <> '' THEN BEGIN
              Currency.GET("Currency Code");
              FindAmtForAppln(OldVendLedgEntry,AppliedAmount,AppliedAmountLCY,
                OldVendLedgEntry."Remaining Amount",Currency."Amount Rounding Precision",AmountforAppl);
            END ELSE BEGIN
              GenLedgSetup.GET;
              FindAmtForAppln(OldVendLedgEntry,AppliedAmount,AppliedAmountLCY,
                OldVendLedgEntry."Remaining Amount",GenLedgSetup."Amount Rounding Precision",AmountforAppl);
            END;

            AppliedAmountLCY := ABS(AppliedAmountLCY);
            CheckAppliedInvHasServTax(OldVendLedgEntry);
            CheckRoundingParameters(OldVendLedgEntry);
            CheckInputServiceDistOnline(OldVendLedgEntry);
            CheckRefundApplicationOnline(OldVendLedgEntry);

            IF TempPurchLine."Service Tax Amount" <> 0 THEN BEGIN
              ServiceTaxEntry.RESET;
              ServiceTaxEntry.SETRANGE("Transaction No.",OldVendLedgEntry."Transaction No.");
              ServiceTaxEntry.SETRANGE("Service Tax Group Code","Purchase Line"."Service Tax Group");
              ServiceTaxEntry.SETRANGE("Service Tax Registration No.","Purchase Line"."Service Tax Registration No.");
              IF ServiceTaxEntry.FINDSET THEN
                REPEAT
                  RemainingAmount := 0;
                  AmountToBeApplied := 0;
                  IF ServiceTaxEntry."Reverse Charge" THEN
                    RemainingAmount :=
                      ABS(ServiceTaxEntry."Amount Including Service Tax" - ServiceTaxEntry."Amount Received/Paid" -
                        (ServiceTaxEntry."Service Tax Amount" + ServiceTaxEntry."eCess Amount" + ServiceTaxEntry."SHE Cess Amount" +
                          ServiceTaxEntry."Service Tax SBC Amount" + ServiceTaxEntry."KK Cess Amount"))
                  ELSE
                    RemainingAmount := ABS(ServiceTaxEntry."Amount Including Service Tax" - ServiceTaxEntry."Amount Received/Paid");
                  IF RemainingAmount > 0 THEN BEGIN
                    IF RemainingAmount >= ABS(AppliedAmountLCY) THEN
                      AmountToBeApplied := ABS(AppliedAmountLCY)
                    ELSE
                      AmountToBeApplied := RemainingAmount;
                  END;
                  AppliedAmountLCY := AppliedAmountLCY - AmountToBeApplied;
                  CheckAppliedVendPayment(OldVendLedgEntry,AmountToBeApplied,AmountforAppl);
                  AmountforAppl := AmountforAppl - AmountToBeApplied;
                  IF ServiceTaxEntry."Reverse Charge" THEN BEGIN
                    AppliedServiceTaxAmount :=
                      ((AmountToBeApplied / (ServiceTaxEntry."Amount Including Service Tax" -
                        (ServiceTaxEntry."Service Tax Amount" + ServiceTaxEntry."eCess Amount" +
                          ServiceTaxEntry."SHE Cess Amount" + ServiceTaxEntry."Service Tax SBC Amount" +
                            ServiceTaxEntry."KK Cess Amount")) *
                            (ServiceTaxEntry."Service Tax Amount" + ServiceTaxEntry."eCess Amount" +
                              ServiceTaxEntry."SHE Cess Amount" + ServiceTaxEntry."Service Tax SBC Amount" +
                                ServiceTaxEntry."KK Cess Amount")));
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
                  END ELSE BEGIN
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
                      ((AppliedServiceTaxAmount * ServiceTaxEntry."SHE Cess Amount" /
                        (ServiceTaxEntry."Service Tax Amount" + ServiceTaxEntry."eCess Amount" +
                          ServiceTaxEntry."SHE Cess Amount" + ServiceTaxEntry."Service Tax SBC Amount" +
                           ServiceTaxEntry."KK Cess Amount")));
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
                  END;
                  AppliedServiceTaxSHEcessAmount := ROUND(AppliedServiceTaxSHEcessAmount);
                  AppliedServiceTaxEcessAmount := ROUND(AppliedServiceTaxEcessAmount);
                  AppliedServiceTaxSBCAmount := ROUND(AppliedServiceTaxSBCAmount);
                  AppliedKKCessAmount := ROUND(AppliedKKCessAmount);
                  AppliedServiceTaxAmount :=
                    ROUND(AppliedServiceTaxAmount - AppliedServiceTaxEcessAmount - AppliedServiceTaxSHEcessAmount -
                     AppliedServiceTaxSBCAmount - AppliedKKCessAmount);

                  AppliedServiceTaxSHECessAmt += ROUND(AppliedServiceTaxSHEcessAmount);
                  AppliedServiceTaxECessAmt += ROUND(AppliedServiceTaxEcessAmount);
                  AppliedServiceTaxAmt += ROUND(AppliedServiceTaxAmount);
                  AppliedServiceTaxSBCAmt += ROUND(AppliedServiceTaxSBCAmount);
                  AppliedKKCessAmt += ROUND(AppliedKKCessAmount);

                UNTIL (ServiceTaxEntry.NEXT = 0) OR (AppliedAmountLCY = 0);
            END;
          END ELSE IF "Applies-to ID" <> '' THEN BEGIN
            // Find the first old entry (Invoice) which the new entry (Payment) should apply to
            OldVendLedgEntry.SetAppliesToIDFilter("Pay-to Vendor No.","Applies-to ID");

            IF NOT(Vend."Application Method" = Vend."Application Method"::"Apply to Oldest") THEN
              OldVendLedgEntry.SETFILTER("Amount to Apply",'<>%1',0);

            //Check and Move Ledger Entries to Temp
            IF PurchSetup."Appln. between Currencies" = PurchSetup."Appln. between Currencies"::None THEN
              OldVendLedgEntry.SETRANGE("Currency Code","Currency Code");

            IF OldVendLedgEntry.FINDSET(FALSE,FALSE) THEN
              REPEAT
                IF OldVendLedgEntry."Serv. Tax on Advance Payment" THEN BEGIN
                  IF GenJnlApply.CheckAgainstApplnCurrency(
                    "Currency Code",OldVendLedgEntry."Currency Code",AccType::Vendor,FALSE)
                  THEN BEGIN
                    IF (OldVendLedgEntry."Posting Date" > ApplyingDate) AND (OldVendLedgEntry."Applies-to ID" <> '') THEN
                      ApplyingDate := OldVendLedgEntry."Posting Date";
                    OldVendLedgEntry.CALCFIELDS("Remaining Amount");
                    FindAmtForAppln(OldVendLedgEntry,AppliedAmount,AppliedAmountLCY,
                      OldVendLedgEntry."Remaining Amount",Currency."Amount Rounding Precision",AmountforAppl);

                    AppliedAmountLCY := ABS(AppliedAmountLCY);
                    CheckAppliedInvHasServTax(OldVendLedgEntry);
                    CheckRoundingParameters(OldVendLedgEntry);
                    CheckInputServiceDistOnline(OldVendLedgEntry);
                    CheckRefundApplicationOnline(OldVendLedgEntry);

                    IF TempPurchLine."Service Tax Amount" <> 0 THEN BEGIN
                      ServiceTaxEntry.RESET;
                      ServiceTaxEntry.SETRANGE("Transaction No.",OldVendLedgEntry."Transaction No.");
                      ServiceTaxEntry.SETRANGE("Service Tax Group Code","Purchase Line"."Service Tax Group");
                      ServiceTaxEntry.SETRANGE("Service Tax Registration No.","Purchase Line"."Service Tax Registration No.");
                      IF ServiceTaxEntry.FINDSET THEN
                        REPEAT
                          RemainingAmount := 0;
                          AmountToBeApplied := 0;
                          IF ServiceTaxEntry."Reverse Charge" THEN
                            RemainingAmount :=
                              ABS(ServiceTaxEntry."Amount Including Service Tax" - ServiceTaxEntry."Amount Received/Paid" -
                                (ServiceTaxEntry."Service Tax Amount" + ServiceTaxEntry."eCess Amount" + ServiceTaxEntry."SHE Cess Amount" +
                                  ServiceTaxEntry."Service Tax SBC Amount" + ServiceTaxEntry."KK Cess Amount"))
                          ELSE
                            RemainingAmount := ABS(ServiceTaxEntry."Amount Including Service Tax" -
                              ServiceTaxEntry."Amount Received/Paid");
                          IF RemainingAmount > 0 THEN BEGIN
                            IF RemainingAmount >= ABS(AppliedAmountLCY) THEN
                              AmountToBeApplied := ABS(AppliedAmountLCY)
                            ELSE
                              AmountToBeApplied := RemainingAmount;
                          END;
                          AppliedAmountLCY := AppliedAmountLCY - AmountToBeApplied;
                          CheckAppliedVendPayment(OldVendLedgEntry,AmountToBeApplied,AmountforAppl);
                          AmountforAppl := AmountforAppl - AmountToBeApplied;
                          IF ServiceTaxEntry."Reverse Charge" THEN BEGIN
                            AppliedServiceTaxAmount :=
                              ((AmountToBeApplied / (ServiceTaxEntry."Amount Including Service Tax" -
                                (ServiceTaxEntry."Service Tax Amount" + ServiceTaxEntry."eCess Amount" +
                                  ServiceTaxEntry."SHE Cess Amount" + ServiceTaxEntry."Service Tax SBC Amount" +
                                   ServiceTaxEntry."KK Cess Amount")) *
                                    (ServiceTaxEntry."Service Tax Amount" + ServiceTaxEntry."eCess Amount" +
                                      ServiceTaxEntry."SHE Cess Amount" + ServiceTaxEntry."Service Tax SBC Amount" +
                                       ServiceTaxEntry."KK Cess Amount")));
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
                          END ELSE BEGIN
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

                          END;
                          AppliedServiceTaxSHEcessAmount := ROUND(AppliedServiceTaxSHEcessAmount);
                          AppliedServiceTaxEcessAmount := ROUND(AppliedServiceTaxEcessAmount);
                          AppliedServiceTaxSBCAmount := ROUND(AppliedServiceTaxSBCAmount);
                          AppliedKKCessAmount := ROUND(AppliedKKCessAmount);
                          AppliedServiceTaxAmount :=
                            ROUND(AppliedServiceTaxAmount - AppliedServiceTaxEcessAmount - AppliedServiceTaxSHEcessAmount -
                              AppliedServiceTaxSBCAmount - AppliedKKCessAmount);

                          AppliedServiceTaxSHECessAmt += ROUND(AppliedServiceTaxSHEcessAmount);
                          AppliedServiceTaxECessAmt += ROUND(AppliedServiceTaxEcessAmount);
                          AppliedServiceTaxAmt += ROUND(AppliedServiceTaxAmount);
                          AppliedServiceTaxSBCAmt += ROUND(AppliedServiceTaxSBCAmount);
                          AppliedKKCessAmt += ROUND(AppliedKKCessAmount);

                        UNTIL (ServiceTaxEntry.NEXT = 0) OR (AppliedAmountLCY = 0);
                    END;
                  END;
                END;
              UNTIL OldVendLedgEntry.NEXT = 0;
          END;
        END;
        PurchLine3.COPYFILTERS("Purchase Line");
        PurchLine3 := "Purchase Line";
        IF PurchLine3.NEXT = 0 THEN BEGIN
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
        IF ServiceTaxSBCAmt < 0 THEN
          ServiceTaxSBCAmt := 0;
        IF KKCessAmt < 0 THEN
          KKCessAmt := 0;
        IF AppliedServiceTaxAmt = 0 THEN
          NetTotal := AmountToVendor
        ELSE
          NetTotal := AmountToVendor2 + ServiceTaxAmt + ServiceTaxECessAmt + ServiceTaxSHECessAmt + ServiceTaxSBCAmt +
            KKCessAmt + AppliedServiceTaxAmt +
             AppliedServiceTaxECessAmt + AppliedServiceTaxSHECessAmt + AppliedServiceTaxSBCAmt + AppliedKKCessAmt;
    end;

    [LineStart(13780)]
    local procedure FindAmtForAppln(OldVendLedgEntry : Record "Vendor Ledger Entry";var AppliedAmount : Decimal;var AppliedAmountLCY : Decimal;OldRemainingAmtBeforeAppln : Decimal;ApplnRoundingPrecision : Decimal;AmountforAppl : Decimal);
    var
        GenJnlPostLine2 : Codeunit "Gen. Jnl.-Post Line";
        OldAppliedAmount : Decimal;
    begin
        // PS39773.begin
        IF OldVendLedgEntry.GETFILTER(Positive) <> '' THEN BEGIN
          IF OldVendLedgEntry."Amount to Apply" <> 0 THEN
            AppliedAmount := -OldVendLedgEntry."Amount to Apply"
          ELSE
            AppliedAmount := -OldVendLedgEntry."Remaining Amount";
        END ELSE BEGIN
          IF (OldVendLedgEntry."Amount to Apply" <> 0) THEN BEGIN
            IF (CheckCalcPmtDisc(OldVendLedgEntry,ApplnRoundingPrecision,FALSE,FALSE,AmountforAppl) AND
              (ABS(OldVendLedgEntry."Amount to Apply") >=
              ABS(OldVendLedgEntry."Remaining Amount" - OldVendLedgEntry."Remaining Pmt. Disc. Possible")) AND
              (ABS(AmountforAppl) >=
              (ABS(OldVendLedgEntry."Amount to Apply" - OldVendLedgEntry."Remaining Pmt. Disc. Possible")))) OR
              (OldVendLedgEntry."Accepted Pmt. Disc. Tolerance")
            THEN BEGIN
              AppliedAmount := -OldVendLedgEntry."Remaining Amount";
              OldVendLedgEntry."Accepted Pmt. Disc. Tolerance" := FALSE;
            END ELSE BEGIN
              IF ABS(AmountforAppl) <= ABS(OldVendLedgEntry."Amount to Apply") THEN
                AppliedAmount := AmountforAppl
              ELSE
                AppliedAmount := -OldVendLedgEntry."Amount to Apply";
            END;
          END ELSE
            IF ABS(AmountforAppl) < ABS(OldVendLedgEntry."Remaining Amount") THEN
              AppliedAmount := AmountforAppl
            ELSE
              AppliedAmount := -OldVendLedgEntry."Remaining Amount";
        END;

        IF PurchHeader."Currency Code" = OldVendLedgEntry."Currency Code" THEN BEGIN
          AppliedAmountLCY := ROUND(AppliedAmount / OldVendLedgEntry."Original Currency Factor");
          OldAppliedAmount := AppliedAmount;
        END ELSE BEGIN
          // Management of posting in multiple currencies
          IF AppliedAmount = -OldVendLedgEntry."Remaining Amount" THEN
            OldAppliedAmount := -OldVendLedgEntry."Remaining Amount"
          ELSE
            OldAppliedAmount :=
              GenJnlPostLine2.ExchAmount(
                AppliedAmount,PurchHeader."Currency Code",
                OldVendLedgEntry."Currency Code",PurchHeader."Posting Date");

          IF PurchHeader."Currency Code" <> '' THEN
            AppliedAmountLCY := ROUND(OldAppliedAmount / OldVendLedgEntry."Original Currency Factor")
          ELSE
            AppliedAmountLCY := ROUND(AppliedAmount / PurchHeader."Currency Factor");
        END;
        // PS39773.end
    end;

    [LineStart(13831)]
    local procedure CheckCalcPmtDisc(var OldVendLedgEntry : Record "Vendor Ledger Entry";ApplnRoundingPrecision : Decimal;CheckFilter : Boolean;CheckAmount : Boolean;AmountforAppl : Decimal) : Boolean;
    begin
        // PS39773.begin
        IF ((OldVendLedgEntry."Document Type" = OldVendLedgEntry."Document Type"::Invoice) AND
          (PurchHeader."Posting Date" <= OldVendLedgEntry."Pmt. Discount Date"))
        THEN BEGIN
          IF CheckFilter THEN BEGIN
            IF CheckAmount THEN BEGIN
              IF (OldVendLedgEntry.GETFILTER(Positive) <> '') OR
                (ABS(AmountforAppl) + ApplnRoundingPrecision >=
                ABS(OldVendLedgEntry."Remaining Amount" - OldVendLedgEntry."Remaining Pmt. Disc. Possible"))
              THEN
                EXIT(TRUE)
              ELSE
                EXIT(FALSE);
            END ELSE BEGIN
              IF (OldVendLedgEntry.GETFILTER(Positive) <> '')
              THEN
                EXIT(TRUE)
              ELSE
                EXIT(FALSE);
            END;
          END ELSE BEGIN
            IF CheckAmount THEN BEGIN
              IF (ABS(AmountforAppl) + ApplnRoundingPrecision >=
                ABS(OldVendLedgEntry."Remaining Amount" - OldVendLedgEntry."Remaining Pmt. Disc. Possible"))
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

    [LineStart(13868)]
    procedure RoundServiceTaxPrecision(ServiceTaxAmount : Decimal) : Decimal;
    var
        ServiceTaxEntry : Record "Service Tax Entry";
    begin
        ServiceTaxEntry."Service Tax Rounding Precision" := "Purchase Header"."Service Tax Rounding Precision";
        ServiceTaxEntry."Service Tax Rounding Type" := "Purchase Header"."Service Tax Rounding Type";
        EXIT(ServiceTaxEntry.RoundAmount(ServiceTaxAmount));
    end;

    [LineStart(13873)]
    procedure CheckAppliedInvHasServTax(OldVendLedgEntry : Record "Vendor Ledger Entry");
    var
        SvcTaxEntry : Record "Service Tax Entry";
        PurchLine3 : Record "Purchase Line";
    begin
        // PS39773.begin
        IF OldVendLedgEntry."Document Type" = OldVendLedgEntry."Document Type"::Payment THEN BEGIN
          IF NOT OldVendLedgEntry."Serv. Tax on Advance Payment" THEN
            EXIT;
          IF NOT ServiceTaxExists THEN BEGIN
            ServiceTaxEntry.RESET;
            ServiceTaxEntry.SETRANGE("Transaction No.",OldVendLedgEntry."Transaction No.");
            IF ServiceTaxEntry.FINDFIRST THEN
              AddError(STRSUBSTNO(Text16524,OldVendLedgEntry."Document No.",
                "Purchase Header"."Document Type","Purchase Header"."No."));
          END;

          IF ServiceTaxExists THEN BEGIN
            SvcTaxEntry.RESET;
            SvcTaxEntry.SETRANGE("Transaction No.",OldVendLedgEntry."Transaction No.");
            IF SvcTaxEntry.FINDFIRST THEN BEGIN
              PurchLine3.RESET;
              PurchLine3.SETRANGE("Document Type","Purchase Line"."Document Type");
              PurchLine3.SETRANGE("Document No.","Purchase Line"."Document No.");
              PurchLine3.SETRANGE("Service Tax Group",SvcTaxEntry."Service Tax Group Code");
              IF NOT PurchLine3.FINDFIRST THEN
                AddError(Text16528);
              PurchLine3.SETRANGE("Service Tax Group");
              PurchLine3.SETRANGE("Service Tax Registration No.",SvcTaxEntry."Service Tax Registration No.");
              IF NOT PurchLine3.FINDFIRST THEN
                AddError(Text16529);
            END;
          END;
        END;
        // PS39773.end
    end;

    [LineStart(13905)]
    procedure CheckInputServiceDistOnline(OldVendLedgEntry : Record "Vendor Ledger Entry");
    begin
        // PS39773.begin
        IF "Purchase Header"."Input Service Distribution" THEN BEGIN
          IF (OldVendLedgEntry."Serv. Tax on Advance Payment") AND
            (NOT OldVendLedgEntry."Input Service Distribution")
          THEN
            AddError(STRSUBSTNO(Text16525,OldVendLedgEntry."Document No.","Purchase Header"."No."));
        END;
        // PS39773.end
    end;

    [LineStart(13915)]
    procedure CheckRefundApplicationOnline(OldVendLedgEntry : Record "Vendor Ledger Entry");
    begin
        // PS39773.begin
        IF (OldVendLedgEntry."Serv. Tax on Advance Payment") AND
          (OldVendLedgEntry."Document Type" = OldVendLedgEntry."Document Type"::Refund)
        THEN
          AddError(STRSUBSTNO(Text16526,"Purchase Header"."Document Type",OldVendLedgEntry."Document No."));
        // PS39773.end
    end;

    [LineStart(13923)]
    procedure CheckRoundingParameters(OldVendLedgEntry : Record "Vendor Ledger Entry");
    var
        SvcTaxEntry : Record "Service Tax Entry";
    begin
        // PS39773.begin
        IF TempPurchLine."Service Tax Amount" = 0 THEN
          EXIT;
        SvcTaxEntry.RESET;
        SvcTaxEntry.SETRANGE("Transaction No.",OldVendLedgEntry."Transaction No.");
        IF NOT SvcTaxEntry.FINDFIRST THEN
          EXIT;
        IF (SvcTaxEntry."Service Tax Amount" + SvcTaxEntry."eCess Amount" + SvcTaxEntry."SHE Cess Amount") = 0 THEN
          EXIT;
        IF ("Purchase Header"."Service Tax Rounding Precision" <> SvcTaxEntry."Service Tax Rounding Precision") OR
          ("Purchase Header"."Service Tax Rounding Type" <> SvcTaxEntry."Service Tax Rounding Type")
        THEN
          AddError(Text16527);
        // PS39773.end
    end;

    [LineStart(13939)]
    procedure CheckAppliedVendPayment(OldVendLedgEntry : Record "Vendor Ledger Entry";AmountToBeApplied : Decimal;AmountToBeComparedWith : Decimal);
    var
        SvcTaxEntry : Record "Service Tax Entry";
        EntryInserted : Boolean;
    begin
        // PS39773.begin
        IF NOT OldVendLedgEntry."Serv. Tax on Advance Payment" THEN
          EXIT;
        SvcTaxEntry.RESET;
        SvcTaxEntry.SETRANGE("Transaction No.",OldVendLedgEntry."Transaction No.");
        SvcTaxEntry.SETRANGE("Service Tax Group Code","Purchase Line"."Service Tax Group");
        SvcTaxEntry.SETRANGE("Service Tax Registration No.","Purchase Line"."Service Tax Registration No.");
        IF SvcTaxEntry.FINDFIRST THEN BEGIN
          TempSvcTaxAppllBuffer.Type := TempSvcTaxAppllBuffer.Type::Purchase;
          TempSvcTaxAppllBuffer."Document No." := OldVendLedgEntry."Document No.";
          TempSvcTaxAppllBuffer."Service Tax Group Code" := SvcTaxEntry."Service Tax Group Code";
          TempSvcTaxAppllBuffer."Service Tax Registration No." := SvcTaxEntry."Service Tax Registration No.";
          TempSvcTaxAppllBuffer."Transaction No." := OldVendLedgEntry."Transaction No.";
          TempSvcTaxAppllBuffer."Amount to Apply (LCY)" := AmountToBeComparedWith;
          EntryInserted := TempSvcTaxAppllBuffer.INSERT;

          IF TempSvcTaxAppllBuffer."Amount to Apply (LCY)" < OldVendLedgEntry."Amount to Apply" THEN
            AddError(STRSUBSTNO(Text16523,OldVendLedgEntry."Document No.",TempSvcTaxAppllBuffer."Amount to Apply (LCY)"));
          TempSvcTaxAppllBuffer."Amount to Apply (LCY)" -= AmountToBeApplied;
          TempSvcTaxAppllBuffer.MODIFY;
        END;
        // PS39773.end
    end;

    [LineStart(13963)]
    procedure InitializeRequest(NewReceiveShipOnNextPostReq : Boolean;NewInvOnNextPostReq : Boolean;NewShowDim : Boolean;NewShowItemChargeAssgnt : Boolean);
    begin
        ReceiveShipOnNextPostReq := NewReceiveShipOnNextPostReq;
        InvOnNextPostReq := NewInvOnNextPostReq;
        ShowDim := NewShowDim;
        ShowItemChargeAssgnt := NewShowItemChargeAssgnt;
    end;
}

