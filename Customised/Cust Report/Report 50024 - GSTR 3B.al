report 50024 "GSTR 3B"
{
    // version GST

    DefaultLayout = RDLC;
    RDLCLayout = './GSTR 3B.rdlc';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Detailed GST Ledger Entry";"Detailed GST Ledger Entry")
        {
            DataItemTableView = SORTING(Entry No.) WHERE(Entry Type=CONST(Initial Entry));
            RequestFilterFields = "Posting Date","Location  Reg. No.";
            column(EntryNo_DetailedGSTLedgerEntry;"Detailed GST Ledger Entry"."Entry No.")
            {
            }
            column(DocNo_DetailedGSTLedgerEntry;"Detailed GST Ledger Entry"."Document No.")
            {
            }
            column(PostingDate_DetailedGSTLedgerEntry;"Detailed GST Ledger Entry"."Posting Date")
            {
            }
            column(BuyerSellerStateCode_DetailedGSTLedgerEntry;DetailedGSTLedgerEntry."Buyer/Seller State Code")
            {
            }
            column(StateCodeTaxableValue;ABS(StateCodeTaxableValue))
            {
            }
            column(MonthG;MonthG)
            {
            }
            column(YearG;YearG)
            {
            }
            column(GSTRegNo_CompanyInfo;"Detailed GST Ledger Entry"."Location  Reg. No.")
            {
            }
            column(Name_CompanyInfo;CompanyInfo.Name)
            {
            }
            column(StateCodeIntegratedTax;ABS(StateCodeIntegratedTax))
            {
            }
            column(NilRatedTaxableValue;ABS(NilRatedTaxableValue))
            {
            }
            column(ZeroRatedTaxableValue;ABS(ZeroRatedTaxableValue))
            {
            }
            column(NilExemptedTaxableValue;ABS(NilExemptedTaxableValue))
            {
            }
            column(ReverseChargeTaxableValue;ABS(ReverseChargeTaxableValue))
            {
            }
            column(NonGSTTaxableValue;ABS(NonGSTTaxableValue))
            {
            }
            column(NilRatedIGST;ABS(NilRatedIGST))
            {
            }
            column(NilRatedCGST;ABS(NilRatedCGST))
            {
            }
            column(NilRatedSGST;ABS(NilRatedSGST))
            {
            }
            column(NilRatedCess;ABS(NilRatedCess))
            {
            }
            column(ZeroRatedIGST;ABS(ZeroRatedIGST))
            {
            }
            column(ZeroRatedCGST;ABS(ZeroRatedCGST))
            {
            }
            column(ZeroRatedSGST;ABS(ZeroRatedSGST))
            {
            }
            column(ZeroRatedCess;ABS(ZeroRatedCess))
            {
            }
            column(NilExemptedIGST;ABS(NilExemptedIGST))
            {
            }
            column(NilExemptedCGST;ABS(NilExemptedCGST))
            {
            }
            column(NilExemptedSGST;ABS(NilExemptedSGST))
            {
            }
            column(NilExemptedCess;ABS(NilExemptedCess))
            {
            }
            column(ReverseChargeIGST;ABS(ReverseChargeIGST))
            {
            }
            column(ReverseChargeCGST;ABS(ReverseChargeCGST))
            {
            }
            column(ReverseChargeSGST;ABS(ReverseChargeSGST))
            {
            }
            column(ReverseChargeCess;ABS(ReverseChargeCess))
            {
            }
            column(NonGSTIGST;ABS(NonGSTIGST))
            {
            }
            column(NonGSTCGST;ABS(NonGSTCGST))
            {
            }
            column(NonGSTSGST;ABS(NonGSTSGST))
            {
            }
            column(NonGSTCess;ABS(NonGSTCess))
            {
            }
            column(PurchInterStateVal;ABS(PurchInterStateVal))
            {
            }
            column(PurchIntraStateVal;ABS(PurchIntraStateVal))
            {
            }
            column(PurchNonGSTInterStateVal;ABS(PurchNonGSTInterStateVal))
            {
            }
            column(PurchNonGSTIntraStateVal;ABS(PurchNonGSTIntraStateVal))
            {
            }
            column(SalesIGSTTaxPayment;ABS(SalesIGSTTaxPayment))
            {
            }
            column(SalesCGSTTaxPayment;ABS(SalesCGSTTaxPayment))
            {
            }
            column(SalesSGSTTaxPayment;ABS(SalesSGSTTaxPayment))
            {
            }
            column(SalesCessTaxPayment;ABS(SalesCessTaxPayment))
            {
            }
            column(PurchIGSTTaxPayment;ABS(PurchIGSTTaxPayment))
            {
            }
            column(PurchCGSTTaxPayment;ABS(PurchCGSTTaxPayment))
            {
            }
            column(PurchSGSTTaxPayment;ABS(PurchSGSTTaxPayment))
            {
            }
            column(PurchCessTaxPayment;ABS(PurchCessTaxPayment))
            {
            }
            column(ImportofGoodsIGST;ABS(ImportofGoodsIGST))
            {
            }
            column(ImportofGoodsCGST;ABS(ImportofGoodsCGST))
            {
            }
            column(ImportofGoodsSGST;ABS(ImportofGoodsSGST))
            {
            }
            column(ImportofGoodsCess;ABS(ImportofGoodsCess))
            {
            }
            column(ImportofServiceIGST;ABS(ImportofServiceIGST))
            {
            }
            column(ImportofServiceCGST;ABS(ImportofServiceCGST))
            {
            }
            column(ImportofServiceSGST;ABS(ImportofServiceSGST))
            {
            }
            column(ImportofServiceCess;ABS(ImportofServiceCess))
            {
            }
            column(ITCInwardSuppliesIGST;ABS(ITCInwardSuppliesIGST))
            {
            }
            column(ITCInwardSuppliesCGST;ABS(ITCInwardSuppliesCGST))
            {
            }
            column(ITCInwardSuppliesSGST;ABS(ITCInwardSuppliesSGST))
            {
            }
            column(ITCInwardSuppliesCess;ABS(ITCInwardSuppliesCess))
            {
            }
            column(ISDInwardSuppliesIGST;ABS(ISDInwardSuppliesIGST))
            {
            }
            column(ISDInwardSuppliesCGST;ABS(ISDInwardSuppliesCGST))
            {
            }
            column(ISDInwardSuppliesSGST;ABS(ISDInwardSuppliesSGST))
            {
            }
            column(ISDInwardSuppliesCess;ABS(ISDInwardSuppliesCess))
            {
            }
            column(AllOtherITCIGST;ABS(AllOtherITCIGST))
            {
            }
            column(AllOtherITCCGST;ABS(AllOtherITCCGST))
            {
            }
            column(AllOtherITCSGST;ABS(AllOtherITCSGST))
            {
            }
            column(AllOtherITCCess;ABS(AllOtherITCCess))
            {
            }
            column(OthersIGST;ABS(OthersIGST))
            {
            }
            column(OthersCGST;ABS(OthersCGST))
            {
            }
            column(OthersSGST;ABS(OthersSGST))
            {
            }
            column(OthersCess;ABS(OthersCess))
            {
            }
            column(FormGSTRCaption;FormGSTRCaptionLbl)
            {
            }
            column(SeeRuleCaption;SeeRuleCaptionLbl)
            {
            }
            column(YearCaption;YearCaptionLbl)
            {
            }
            column(MonthCaption;MonthCaptionLbl)
            {
            }
            column(GSTINCaption;GSTINCaptionLbl)
            {
            }
            column(LegalNameCaption;LegalNameCaptionLbl)
            {
            }
            column(DetailOutwardSuppliesCaption;DetailOutwardSuppliesCaptionLbl)
            {
            }
            column(NatureofSuppliesCaption;NatureofSuppliesCaptionLbl)
            {
            }
            column(OutwardTaxableNilRatedCaption;OutwardTaxableNilRatedCaptionLbl)
            {
            }
            column(OutwardTaxableZeroRatedCaption;OutwardTaxableZeroRatedCaptionLbl)
            {
            }
            column(OtherOutwardSuppliesCaption;OtherOutwardSuppliesCaptionLbl)
            {
            }
            column(InwardSuppliesCaption;InwardSuppliesCaptionLbl)
            {
            }
            column(NonGSTOutwardSuppliesCaption;NonGSTOutwardSuppliesCaptionLbl)
            {
            }
            column(TotTaxableValueCaption;TotTaxableValueCaptionLbl)
            {
            }
            column(IGSTCaption;IGSTCaptionLbl)
            {
            }
            column(CGSTCaption;CGSTCaptionLbl)
            {
            }
            column(SGSTCaption;SGSTCaptionLbl)
            {
            }
            column(CessCaption;CessCaptionLbl)
            {
            }
            column(OftheSuppliesCaption;OftheSuppliesCaptionLbl)
            {
            }
            column(CompostiontaxablePersonsCaption;CompostiontaxablePersonsCaptionLbl)
            {
            }
            column(SuppliesMadetoUnRegCaption;SuppliesMadetoUnRegCaptionLbl)
            {
            }
            column(SuppliesMadetoCompCaption;SuppliesMadetoCompCaptionLbl)
            {
            }
            column(SuppliesmadetoUINHolderCaption;SuppliesmadetoUINHolderCaptionLbl)
            {
            }
            column(PlaceofSupplyCaption;PlaceofSupplyCaptionLbl)
            {
            }
            column(AmountofIntegratedTaxCaption;AmountofIntegratedTaxCaptionLbl)
            {
            }
            column(EligibleITCCaption;EligibleITCCaptionLbl)
            {
            }
            column(ITCAvailableCaption;ITCAvailableCaptionLbl)
            {
            }
            column(ImportofgoodsCaption;ImportofgoodsCaptionLbl)
            {
            }
            column(ImportofServicesCaption;ImportofServicesCaptionLbl)
            {
            }
            column(InwardSuppliesLiableCaption;InwardSuppliesLiableCaptionLbl)
            {
            }
            column(InwardSuppliesFromISDCaption;InwardSuppliesFromISDCaptionLbl)
            {
            }
            column(AllOtherITCCaption;AllOtherITCCaptionLbl)
            {
            }
            column(ITCReversedCaption;ITCReversedCaptionLbl)
            {
            }
            column(AsPerrulesCaption;AsPerrulesCaptionLbl)
            {
            }
            column(OthersCaption;OthersCaptionLbl)
            {
            }
            column(NetITCAvailableCaption;NetITCAvailableCaptionLbl)
            {
            }
            column(IneligibleITCCaption;IneligibleITCCaptionLbl)
            {
            }
            column(AsPerSectionCaption;AsPerSectionCaptionLbl)
            {
            }
            column(ValueofExemptCaption;ValueofExemptCaptionLbl)
            {
            }
            column(FromSupplierundercompositionCaption;FromSupplierundercompositionCaptionLbl)
            {
            }
            column(NonGSTSupplyCaption;NonGSTSupplyCaptionLbl)
            {
            }
            column(InterStateSuppliesCaption;InterStateSuppliesCaptionLbl)
            {
            }
            column(IntraStateSuppliesCaption;IntraStateSuppliesCaptionLbl)
            {
            }
            column(InterestLateFeeCaption;InterestLateFeeCaptionLbl)
            {
            }
            column(DescriptionCaption;DescriptionCaptionLbl)
            {
            }
            column(InterestCaption;InterestCaptionLbl)
            {
            }
            column(LateFeesCaption;LateFeesCaptionLbl)
            {
            }
            column(PaymentoftaxCaption;PaymentoftaxCaptionLbl)
            {
            }
            column(TaxPayableCaption;TaxPayableCaptionLbl)
            {
            }
            column(PaidthroughITCCaption;PaidthroughITCCaptionLbl)
            {
            }
            column(TaxPaidTDSTCSCaption;TaxPaidTDSTCSCaptionLbl)
            {
            }
            column(TaxCessCaption;TaxCessCaptionLbl)
            {
            }
            column(TDSTCSCreditCaption;TDSTCSCreditCaptionLbl)
            {
            }
            column(TDSCaption;TDSCaptionLbl)
            {
            }
            column(TCSCaption;TCSCaptionLbl)
            {
            }

            trigger OnAfterGetRecord();
            begin
                //MonthG := DATE2DMY("Posting Date",2);
                //YearG := DATE2DMY("Posting Date",3);
                // Sales Transactions Start
                // ------------------------------------------------------------------------------------ //
                IF ("Transaction Type"="Transaction Type"::Sales)AND ("Sales Invoice Type" <> "Sales Invoice Type"::"Non-GST") AND (NOT "GST Exempted Goods") AND  ("GST %" <> 0)AND  (NOT "Reverse Charge" ) AND ("GST Component Code"<>'CGST') THEN
                  NilRatedTaxableValue += "GST Base Amount";
                IF ("Transaction Type"="Transaction Type"::Sales)AND ("Sales Invoice Type" <> "Sales Invoice Type"::"Non-GST") AND (NOT "GST Exempted Goods") AND ("GST %" = 0)AND  (NOT "Reverse Charge" ) AND ("GST Component Code"<>'CGST') THEN
                  ZeroRatedTaxableValue += "GST Base Amount";
                IF ("Transaction Type"="Transaction Type"::Sales)AND ("Sales Invoice Type" <> "Sales Invoice Type"::"Non-GST") AND ("GST Exempted Goods") AND (NOT "Reverse Charge") AND ("GST Component Code"<>'CGST') THEN
                  NilExemptedTaxableValue += "GST Base Amount";
                IF ("Transaction Type"="Transaction Type"::Sales)AND ("Sales Invoice Type" <> "Sales Invoice Type"::"Non-GST") AND ("GST Exempted Goods") AND ("Reverse Charge") AND ("GST Component Code"<>'CGST') THEN
                  ReverseChargeTaxableValue += "GST Base Amount";
                IF ("Transaction Type"="Transaction Type"::Sales)AND ("Sales Invoice Type" = "Sales Invoice Type"::"Non-GST") AND ("GST Component Code"<>'CGST') THEN
                  NonGSTTaxableValue += "GST Base Amount";

                // IGST Amounts
                IF ("Transaction Type"="Transaction Type"::Sales)AND ("Sales Invoice Type" <> "Sales Invoice Type"::"Non-GST")  AND ("GST %" <> 0) AND ("Detailed GST Ledger Entry"."GST Component Code"='IGST') THEN
                  NilRatedIGST += "GST Amount";
                IF ("Transaction Type"="Transaction Type"::Sales)AND ("Sales Invoice Type" <> "Sales Invoice Type"::"Non-GST")  AND ("GST %" = 0) AND ("Detailed GST Ledger Entry"."GST Component Code"='IGST') THEN
                  ZeroRatedIGST += "GST Amount";
                IF ("Transaction Type"="Transaction Type"::Sales)AND ("Sales Invoice Type" <> "Sales Invoice Type"::"Non-GST")  AND ("GST Exempted Goods" ) AND ("Detailed GST Ledger Entry"."GST Component Code"='IGST') THEN
                  NilExemptedIGST += "GST Amount";
                IF ("Transaction Type"="Transaction Type"::Sales)AND ("Sales Invoice Type" = "Sales Invoice Type"::"Non-GST")  AND ("Detailed GST Ledger Entry"."GST Component Code"='IGST')THEN
                  NonGSTIGST += "GST Amount";
                IF ("Transaction Type"="Transaction Type"::Purchase)AND ("Sales Invoice Type" = "Sales Invoice Type"::"Non-GST") AND ("Reverse Charge") AND(NOT "GST Exempted Goods") AND ("Detailed GST Ledger Entry"."GST Component Code"='IGST')THEN
                  ReverseChargeIGST += "GST Amount";

                // CGST Amounts
                IF ("Transaction Type"="Transaction Type"::Sales)AND ("Sales Invoice Type" <> "Sales Invoice Type"::"Non-GST")  AND ("GST %" <> 0) AND ("Detailed GST Ledger Entry"."GST Component Code"='CGST') THEN
                  NilRatedCGST += "GST Amount";
                IF ("Transaction Type"="Transaction Type"::Sales)AND ("Sales Invoice Type" <> "Sales Invoice Type"::"Non-GST")  AND ("GST %" = 0) AND ("GST Component Code"='CGST') THEN
                  ZeroRatedCGST += "GST Amount";
                IF ("Transaction Type"="Transaction Type"::Sales)AND ("Sales Invoice Type" <> "Sales Invoice Type"::"Non-GST")  AND ("GST Exempted Goods" ) AND ("GST Component Code"='CGST') THEN
                  NilExemptedCGST += "GST Amount";
                IF ("Transaction Type"="Transaction Type"::Sales)AND ("Sales Invoice Type" = "Sales Invoice Type"::"Non-GST")  AND ("GST Component Code"='CGST')THEN
                  NonGSTCGST += "GST Amount";
                IF ("Transaction Type"="Transaction Type"::Purchase)AND ("Sales Invoice Type" = "Sales Invoice Type"::"Non-GST") AND ("Reverse Charge") AND(NOT "GST Exempted Goods") AND ("Detailed GST Ledger Entry"."GST Component Code"='CGST')THEN
                  ReverseChargeCGST += "GST Amount";

                // SGST Amounts
                IF ("Transaction Type"="Transaction Type"::Sales)AND ("Sales Invoice Type" <> "Sales Invoice Type"::"Non-GST")  AND ("GST %" <> 0) AND ("Detailed GST Ledger Entry"."GST Component Code"='SGST') THEN
                  NilRatedSGST += "GST Amount";
                IF ("Transaction Type"="Transaction Type"::Sales)AND ("Sales Invoice Type" <> "Sales Invoice Type"::"Non-GST")  AND ("GST %" = 0) AND ("GST Component Code"='SGST') THEN
                  ZeroRatedSGST += "GST Amount";
                IF ("Transaction Type"="Transaction Type"::Sales)AND ("Sales Invoice Type" <> "Sales Invoice Type"::"Non-GST")  AND ("GST Exempted Goods" ) AND ("GST Component Code"='SGST') THEN
                  NilExemptedSGST += "GST Amount";
                IF ("Transaction Type"="Transaction Type"::Sales)AND ("Sales Invoice Type" = "Sales Invoice Type"::"Non-GST")  AND ("GST Component Code"='SGST')THEN
                  NonGSTSGST += "GST Amount";
                IF ("Transaction Type"="Transaction Type"::Purchase)AND ("Sales Invoice Type" = "Sales Invoice Type"::"Non-GST") AND ("Reverse Charge") AND(NOT "GST Exempted Goods") AND ("Detailed GST Ledger Entry"."GST Component Code"='SGST')THEN
                  ReverseChargeSGST += "GST Amount";

                // Cess Amounts
                IF ("Transaction Type"="Transaction Type"::Sales)AND ("Sales Invoice Type" <> "Sales Invoice Type"::"Non-GST")  AND ("GST %" <> 0)AND ("GST Component Code" <>'IGST')
                   AND ("GST Component Code" <>'CGST') AND ("GST Component Code" <>'SGST')THEN
                  NilRatedCess += "GST Amount";
                IF ("Transaction Type"="Transaction Type"::Sales)AND ("Sales Invoice Type" <> "Sales Invoice Type"::"Non-GST")  AND ("GST %" = 0) AND ("GST Component Code" <>'IGST')
                   AND ("GST Component Code" <>'CGST') AND ("GST Component Code" <>'SGST')THEN
                  ZeroRatedCess += "GST Amount";
                IF ("Transaction Type"="Transaction Type"::Sales)AND ("Sales Invoice Type" <> "Sales Invoice Type"::"Non-GST")  AND ("GST Exempted Goods" ) AND ("GST Component Code" <>'IGST')
                   AND ("GST Component Code" <>'CGST') AND ("GST Component Code" <>'SGST') THEN
                  NilExemptedCess += "GST Amount";
                IF ("Transaction Type"="Transaction Type"::Sales)AND ("Sales Invoice Type" = "Sales Invoice Type"::"Non-GST")  AND ("GST Component Code" <>'IGST')
                   AND ("GST Component Code" <>'CGST') AND ("GST Component Code" <>'SGST')THEN
                  NonGSTCess += "GST Amount";
                IF ("Transaction Type"="Transaction Type"::Purchase)AND ("Sales Invoice Type" = "Sales Invoice Type"::"Non-GST") AND ("Reverse Charge") AND(NOT "GST Exempted Goods") AND ("GST Component Code" <>'IGST')
                   AND ("GST Component Code" <>'CGST') AND ("GST Component Code" <>'SGST')THEN
                  ReverseChargeCess += "GST Amount";

                // Filter State Code wise Value
                CLEAR(StateCodeTaxableValue);
                CLEAR(StateCodeIntegratedTax);
                DetailedGSTLedgerEntry.RESET;
                DetailedGSTLedgerEntry.SETRANGE("Transaction Type","Transaction Type"::Sales);
                DetailedGSTLedgerEntry.SETRANGE("Posting Date",FromDate,ToDate);
                DetailedGSTLedgerEntry.SETRANGE("Location  Reg. No.","Location  Reg. No.");
                DetailedGSTLedgerEntry.SETRANGE("Buyer/Seller State Code","Buyer/Seller State Code");
                DetailedGSTLedgerEntry.SETRANGE("GST Customer Type",DetailedGSTLedgerEntry."GST Customer Type"::Unregistered);
                DetailedGSTLedgerEntry.SETRANGE("GST Component Code",'IGST');
                IF DetailedGSTLedgerEntry.FINDSET THEN BEGIN
                  REPEAT
                    StateCodeTaxableValue += DetailedGSTLedgerEntry."GST Base Amount";
                    StateCodeIntegratedTax +=  DetailedGSTLedgerEntry."GST Amount";
                  UNTIL DetailedGSTLedgerEntry.NEXT=0;
                END;
                // Sales Transactions End
                // ------------------------------------------------------------------------------------ //


                // Purchase Transactions Start
                // ------------------------------------------------------------------------------------ //
                IF ("Transaction Type"="Transaction Type"::Purchase)AND ("Sales Invoice Type" <> "Sales Invoice Type"::"Non-GST") AND ("GST %"= 0) AND ("GST Exempted Goods") AND ("GST Jurisdiction Type"="GST Jurisdiction Type"::Interstate) AND ("GST Component Code"<>'CGST')
                THEN
                  PurchInterStateVal += "GST Base Amount";
                IF ("Transaction Type"="Transaction Type"::Purchase)AND ("Sales Invoice Type" <> "Sales Invoice Type"::"Non-GST") AND ("GST %"= 0) AND ("GST Exempted Goods") AND ("GST Jurisdiction Type"="GST Jurisdiction Type"::Intrastate) AND ("GST Component Code"<>'CGST')
                THEN
                  PurchIntraStateVal += "GST Base Amount";

                IF ("Transaction Type"="Transaction Type"::Purchase)AND ("Sales Invoice Type" = "Sales Invoice Type"::"Non-GST") AND ("GST Jurisdiction Type"="GST Jurisdiction Type"::Interstate) AND ("GST Component Code"<>'CGST') THEN
                  PurchNonGSTInterStateVal += "GST Base Amount";
                IF ("Transaction Type"="Transaction Type"::Purchase)AND ("Sales Invoice Type" = "Sales Invoice Type"::"Non-GST") AND ("GST Jurisdiction Type"="GST Jurisdiction Type"::Intrastate) AND ("GST Component Code"<>'CGST') THEN
                  PurchNonGSTIntraStateVal += "GST Base Amount";
                // Purchase Transactions End
                // ------------------------------------------------------------------------------------ //


                IF ("Transaction Type"="Transaction Type"::Sales)AND ("Sales Invoice Type" <> "Sales Invoice Type"::"Non-GST") AND ("GST Component Code" ='IGST') THEN
                  SalesIGSTTaxPayment += "GST Amount";
                IF  ("Transaction Type"="Transaction Type"::Sales)AND ("Sales Invoice Type" <> "Sales Invoice Type"::"Non-GST") AND ("GST Component Code" ='CGST') THEN
                  SalesCGSTTaxPayment += "GST Amount";
                IF  ("Transaction Type"="Transaction Type"::Sales)AND ("Sales Invoice Type" <> "Sales Invoice Type"::"Non-GST") AND ("GST Component Code" ='SGST') THEN
                  SalesSGSTTaxPayment += "GST Amount";
                IF ("Transaction Type"="Transaction Type"::Sales)AND ("Sales Invoice Type" = "Sales Invoice Type"::"Non-GST")  AND ("GST Component Code" <>'IGST')
                   AND ("GST Component Code" <>'CGST') AND ("GST Component Code" <>'SGST')THEN
                  SalesCessTaxPayment += "GST Amount";

                IF ("Transaction Type"="Transaction Type"::Purchase)AND ("Sales Invoice Type" <> "Sales Invoice Type"::"Non-GST") AND ("GST Component Code" ='IGST') THEN
                  PurchIGSTTaxPayment += "GST Amount";
                IF  ("Transaction Type"="Transaction Type"::Purchase)AND ("Sales Invoice Type" <> "Sales Invoice Type"::"Non-GST") AND ("GST Component Code" ='CGST') THEN
                  PurchCGSTTaxPayment += "GST Amount";
                IF  ("Transaction Type"="Transaction Type"::Purchase)AND ("Sales Invoice Type" <> "Sales Invoice Type"::"Non-GST") AND ("GST Component Code" ='SGST') THEN
                  PurchSGSTTaxPayment += "GST Amount";
                IF ("Transaction Type"="Transaction Type"::Purchase)AND ("Sales Invoice Type" = "Sales Invoice Type"::"Non-GST")  AND ("GST Component Code" <>'IGST')
                   AND ("GST Component Code" <>'CGST') AND ("GST Component Code" <>'SGST')THEN
                  PurchCessTaxPayment += "GST Amount";


                // ITC::
                // Import of Goods
                IF ("Transaction Type"="Transaction Type"::Purchase)AND ("GST Vendor Type"  IN ["GST Vendor Type"::Import,"GST Vendor Type"::SEZ]) AND ("GST Group Type" = "GST Group Type"::Goods) AND ("GST Credit" ="GST Credit"::Availment)
                  AND (("Credit Adjustment Type"="Credit Adjustment Type"::" ")OR ("Credit Adjustment Type"="Credit Adjustment Type"::"Credit Re-Availment")) AND ("GST Component Code" ='IGST')  THEN
                 ImportofGoodsIGST += "GST Amount";
                IF ("Transaction Type"="Transaction Type"::Purchase)AND ("GST Vendor Type"  IN ["GST Vendor Type"::Import,"GST Vendor Type"::SEZ]) AND ("GST Group Type" = "GST Group Type"::Goods) AND ("GST Credit" ="GST Credit"::Availment)
                  AND (("Credit Adjustment Type"="Credit Adjustment Type"::" ")OR ("Credit Adjustment Type"="Credit Adjustment Type"::"Credit Re-Availment")) AND ("GST Component Code" ='CGST')  THEN
                 ImportofGoodsCGST += "GST Amount";
                IF ("Transaction Type"="Transaction Type"::Purchase)AND ("GST Vendor Type"  IN ["GST Vendor Type"::Import,"GST Vendor Type"::SEZ]) AND ("GST Group Type" = "GST Group Type"::Goods) AND ("GST Credit" ="GST Credit"::Availment)
                  AND (("Credit Adjustment Type"="Credit Adjustment Type"::" ")OR ("Credit Adjustment Type"="Credit Adjustment Type"::"Credit Re-Availment")) AND ("GST Component Code" ='SGST')  THEN
                  ImportofGoodsSGST += "GST Amount";
                IF ("Transaction Type"="Transaction Type"::Purchase)AND ("GST Vendor Type"  IN ["GST Vendor Type"::Import,"GST Vendor Type"::SEZ]) AND ("GST Group Type" = "GST Group Type"::Goods) AND ("GST Credit" ="GST Credit"::Availment)
                  AND (("Credit Adjustment Type"="Credit Adjustment Type"::" ")OR ("Credit Adjustment Type"="Credit Adjustment Type"::"Credit Re-Availment")) AND ("GST Component Code" <>'IGST')
                   AND ("GST Component Code" <>'CGST') AND ("GST Component Code" <>'SGST')THEN
                  ImportofGoodsCess += "GST Amount";

                // Import of Services
                IF ("Transaction Type"="Transaction Type"::Purchase)AND ("GST Vendor Type"  IN ["GST Vendor Type"::Import,"GST Vendor Type"::SEZ]) AND ("GST Group Type" = "GST Group Type"::Service) AND ("GST Credit" ="GST Credit"::Availment)
                  AND (("Credit Adjustment Type"="Credit Adjustment Type"::" ")OR ("Credit Adjustment Type"="Credit Adjustment Type"::"Credit Re-Availment")) AND ("GST Component Code" ='IGST')  THEN
                 ImportofServiceIGST += "GST Amount";
                IF ("Transaction Type"="Transaction Type"::Purchase)AND ("GST Vendor Type"  IN ["GST Vendor Type"::Import,"GST Vendor Type"::SEZ]) AND ("GST Group Type" = "GST Group Type"::Service) AND ("GST Credit" ="GST Credit"::Availment)
                AND (("Credit Adjustment Type"="Credit Adjustment Type"::" ")OR ("Credit Adjustment Type"="Credit Adjustment Type"::"Credit Re-Availment")) AND ("GST Component Code" ='CGST')  THEN
                  ImportofServiceCGST += "GST Amount";
                IF ("Transaction Type"="Transaction Type"::Purchase)AND ("GST Vendor Type"  IN ["GST Vendor Type"::Import,"GST Vendor Type"::SEZ]) AND ("GST Group Type" = "GST Group Type"::Service) AND ("GST Credit" ="GST Credit"::Availment)
                AND (("Credit Adjustment Type"="Credit Adjustment Type"::" ")OR ("Credit Adjustment Type"="Credit Adjustment Type"::"Credit Re-Availment")) AND ("GST Component Code" ='SGST')  THEN
                  ImportofServiceSGST += "GST Amount";
                IF ("Transaction Type"="Transaction Type"::Purchase)AND ("GST Vendor Type"  IN ["GST Vendor Type"::Import,"GST Vendor Type"::SEZ]) AND ("GST Group Type" = "GST Group Type"::Service) AND ("GST Credit" ="GST Credit"::Availment)
                AND (("Credit Adjustment Type"="Credit Adjustment Type"::" ")OR ("Credit Adjustment Type"="Credit Adjustment Type"::"Credit Re-Availment"))AND ("GST Component Code" <>'IGST')
                   AND ("GST Component Code" <>'CGST') AND ("GST Component Code" <>'SGST')THEN
                  ImportofServiceCess += "GST Amount";

                // ITC Inward Supplies
                IF ("Transaction Type"="Transaction Type"::Purchase)AND (("GST Vendor Type"  <> "GST Vendor Type"::Import) OR ("GST Vendor Type"  <> "GST Vendor Type"::SEZ)) AND ("Reverse Charge") AND ("GST Credit" ="GST Credit"::Availment)
                  AND (("Credit Adjustment Type"="Credit Adjustment Type"::" ")OR ("Credit Adjustment Type"="Credit Adjustment Type"::"Credit Re-Availment")) AND ("GST Component Code" ='IGST')  THEN
                 ITCInwardSuppliesIGST += "GST Amount";
                IF ("Transaction Type"="Transaction Type"::Purchase)AND (("GST Vendor Type"  <> "GST Vendor Type"::Import) OR ("GST Vendor Type"  <> "GST Vendor Type"::SEZ)) AND ("Reverse Charge") AND ("GST Credit" ="GST Credit"::Availment)
                  AND (("Credit Adjustment Type"="Credit Adjustment Type"::" ")OR ("Credit Adjustment Type"="Credit Adjustment Type"::"Credit Re-Availment")) AND ("GST Component Code" ='CGST')  THEN
                  ITCInwardSuppliesCGST += "GST Amount";
                IF ("Transaction Type"="Transaction Type"::Purchase)AND (("GST Vendor Type"  <> "GST Vendor Type"::Import) OR ("GST Vendor Type"  <> "GST Vendor Type"::SEZ)) AND ("Reverse Charge") AND ("GST Credit" ="GST Credit"::Availment)
                  AND (("Credit Adjustment Type"="Credit Adjustment Type"::" ")OR ("Credit Adjustment Type"="Credit Adjustment Type"::"Credit Re-Availment")) AND ("GST Component Code" ='SGST')  THEN
                  ITCInwardSuppliesSGST += "GST Amount";
                IF ("Transaction Type"="Transaction Type"::Purchase)AND (("GST Vendor Type"  <> "GST Vendor Type"::Import) OR ("GST Vendor Type"  <> "GST Vendor Type"::SEZ)) AND ("Reverse Charge") AND ("GST Credit" ="GST Credit"::Availment)
                  AND (("Credit Adjustment Type"="Credit Adjustment Type"::" ")OR ("Credit Adjustment Type"="Credit Adjustment Type"::"Credit Re-Availment")) AND  ("GST Component Code" <>'IGST')
                   AND ("GST Component Code" <>'CGST') AND ("GST Component Code" <>'SGST')THEN
                  ITCInwardSuppliesCess += "GST Amount";

                // ISD Supplies
                IF ("Transaction Type"="Transaction Type"::Purchase)AND ("Input Service Distribution") AND (("Credit Adjustment Type"="Credit Adjustment Type"::"Credit Re-Availment") OR ("Credit Adjustment Type"="Credit Adjustment Type"::"Credit Re-Availment"))
                  AND ("GST Component Code" ='IGST')  THEN
                  ISDInwardSuppliesIGST += "GST Amount";
                IF ("Transaction Type"="Transaction Type"::Purchase)AND ("Input Service Distribution") AND (("Credit Adjustment Type"="Credit Adjustment Type"::"Credit Re-Availment")OR ("Credit Adjustment Type"="Credit Adjustment Type"::"Credit Re-Availment"))
                   AND ("GST Component Code" ='CGST') THEN
                  ISDInwardSuppliesCGST += "GST Amount";
                IF ("Transaction Type"="Transaction Type"::Purchase)AND ("Input Service Distribution") AND (("Credit Adjustment Type"="Credit Adjustment Type"::"Credit Re-Availment")OR ("Credit Adjustment Type"="Credit Adjustment Type"::"Credit Re-Availment"))
                   AND ("GST Component Code" ='SGST') THEN
                  ISDInwardSuppliesSGST += "GST Amount";
                IF ("Transaction Type"="Transaction Type"::Purchase)AND ("Input Service Distribution") AND (("Credit Adjustment Type"="Credit Adjustment Type"::"Credit Re-Availment")OR ("Credit Adjustment Type"="Credit Adjustment Type"::"Credit Re-Availment"))
                   AND ("GST Component Code" <>'IGST')
                   AND ("GST Component Code" <>'CGST') AND ("GST Component Code" <>'SGST')THEN
                  ISDInwardSuppliesCess += "GST Amount";

                // All other ITC
                IF ("Transaction Type"="Transaction Type"::Purchase)AND ("GST Vendor Type"  = "GST Vendor Type"::Registered) AND ("GST Credit" ="GST Credit"::Availment)
                  AND (("Credit Adjustment Type"="Credit Adjustment Type"::" ")OR ("Credit Adjustment Type"="Credit Adjustment Type"::"Credit Re-Availment")) AND ("GST Component Code" ='IGST')  THEN
                  AllOtherITCIGST += "GST Amount";
                IF ("Transaction Type"="Transaction Type"::Purchase)AND ("GST Vendor Type"  = "GST Vendor Type"::Registered) AND ("GST Credit" ="GST Credit"::Availment)
                  AND (("Credit Adjustment Type"="Credit Adjustment Type"::" ")OR ("Credit Adjustment Type"="Credit Adjustment Type"::"Credit Re-Availment")) AND ("GST Component Code" ='CGST')  THEN
                  AllOtherITCCGST += "GST Amount";
                IF ("Transaction Type"="Transaction Type"::Purchase)AND ("GST Vendor Type"  = "GST Vendor Type"::Registered) AND ("GST Credit" ="GST Credit"::Availment)
                  AND (("Credit Adjustment Type"="Credit Adjustment Type"::" ") OR ("Credit Adjustment Type"="Credit Adjustment Type"::"Credit Re-Availment")) AND ("GST Component Code" ='SGST')  THEN
                  AllOtherITCSGST += "GST Amount";
                IF ("Transaction Type"="Transaction Type"::Purchase)AND ("GST Vendor Type"  = "GST Vendor Type"::Registered) AND ("GST Credit" ="GST Credit"::Availment)
                  AND (("Credit Adjustment Type"="Credit Adjustment Type"::" ") OR ("Credit Adjustment Type"="Credit Adjustment Type"::"Credit Re-Availment"))AND  ("GST Component Code" <>'IGST')
                   AND ("GST Component Code" <>'CGST') AND ("GST Component Code" <>'SGST')THEN
                  AllOtherITCCess += "GST Amount";

                // Others
                IF ("Transaction Type"="Transaction Type"::Purchase)AND ("Credit Adjustment Type" ="Credit Adjustment Type"::"Permanent Reversal") AND ("GST Component Code" ='IGST') THEN
                  OthersIGST += "GST Amount";
                IF ("Transaction Type"="Transaction Type"::Purchase)AND ("Credit Adjustment Type" ="Credit Adjustment Type"::"Permanent Reversal") AND ("GST Component Code" ='CGST')THEN
                  OthersCGST += "GST Amount";
                IF ("Transaction Type"="Transaction Type"::Purchase)AND ("Credit Adjustment Type" ="Credit Adjustment Type"::"Permanent Reversal") AND ("GST Component Code" ='SGST')THEN
                  OthersSGST += "GST Amount";
                IF ("Transaction Type"="Transaction Type"::Purchase)AND ("Credit Adjustment Type" ="Credit Adjustment Type"::"Permanent Reversal") AND ("GST Component Code" <>'IGST')
                   AND ("GST Component Code" <>'CGST') AND ("GST Component Code" <>'SGST')THEN
                  OthersCess += "GST Amount";
            end;

            trigger OnPreDataItem();
            begin
                CompanyInfo.GET;

                CLEAR(NilRatedTaxableValue);
                CLEAR(ZeroRatedTaxableValue);
                CLEAR(NilExemptedTaxableValue);
                CLEAR(ReverseChargeTaxableValue);
                CLEAR(NonGSTTaxableValue);
                CLEAR(ZeroRatedIGST);
                CLEAR(ZeroRatedCGST);
                CLEAR(ZeroRatedSGST);
                CLEAR(ZeroRatedCess);
                CLEAR(NilExemptedIGST);
                CLEAR(NilExemptedCGST);
                CLEAR(NilExemptedSGST);
                CLEAR(NilExemptedCess);
                CLEAR(ReverseChargeIGST);
                CLEAR(ReverseChargeCGST);
                CLEAR(ReverseChargeSGST);
                CLEAR(ReverseChargeCess);
                CLEAR(NonGSTIGST);
                CLEAR(NonGSTCGST);
                CLEAR(NonGSTSGST);
                CLEAR(NonGSTCess);
                CLEAR(PurchInterStateVal);
                CLEAR(PurchIntraStateVal);
                CLEAR(PurchNonGSTInterStateVal);
                CLEAR(PurchNonGSTIntraStateVal);
                CLEAR(SalesIGSTTaxPayment);
                CLEAR(SalesCGSTTaxPayment);
                CLEAR(SalesSGSTTaxPayment);
                CLEAR(SalesCessTaxPayment);
                CLEAR(PurchIGSTTaxPayment);
                CLEAR(PurchCGSTTaxPayment);
                CLEAR(PurchSGSTTaxPayment);
                CLEAR(PurchCessTaxPayment);
                CLEAR(ImportofGoodsIGST);
                CLEAR(ImportofGoodsCGST);
                CLEAR(ImportofGoodsSGST);
                CLEAR(ImportofGoodsCess);
                CLEAR(ImportofServiceIGST);
                CLEAR(ImportofServiceCGST);
                CLEAR(ImportofServiceSGST);
                CLEAR(ImportofServiceCess);
                CLEAR(ITCInwardSuppliesIGST);
                CLEAR(ITCInwardSuppliesCGST);
                CLEAR(ITCInwardSuppliesSGST);
                CLEAR(ITCInwardSuppliesCess);
                CLEAR(ISDInwardSuppliesIGST);
                CLEAR(ISDInwardSuppliesCGST);
                CLEAR(ISDInwardSuppliesSGST);
                CLEAR(ISDInwardSuppliesCess);
                CLEAR(AllOtherITCIGST);
                CLEAR(AllOtherITCCGST);
                CLEAR(AllOtherITCSGST);
                CLEAR(AllOtherITCCess);
                CLEAR(OthersIGST);
                CLEAR(OthersCGST);
                CLEAR(OthersSGST);
                CLEAR(OthersCess);

                MonthG := DATE2DMY(GETRANGEMIN("Posting Date"),2);
                YearG := DATE2DMY(GETRANGEMIN("Posting Date"),3);
                FromDate := GETRANGEMIN("Posting Date");
                ToDate := GETRANGEMAX("Posting Date");
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
        FormGSTRCaptionLbl : Label 'Form GSTR-3B';
        SeeRuleCaptionLbl : Label '[ See Rule 61(5)]';
        YearCaptionLbl : Label 'Year';
        MonthCaptionLbl : Label 'Month';
        GSTINCaptionLbl : Label 'GSTIN';
        LegalNameCaptionLbl : Label 'Legal name of the registered person';
        DetailOutwardSuppliesCaptionLbl : Label '3.1 Detail of Outward Supplies and Inward supplies liable to reverse charges';
        NatureofSuppliesCaptionLbl : Label 'Nature of supplies';
        OutwardTaxableNilRatedCaptionLbl : Label '(a) Outward taxable supplies (other than zero rated, nilrated and exempted)';
        OutwardTaxableZeroRatedCaptionLbl : Label '(b) Outward taxable supplies (zero rated )';
        OtherOutwardSuppliesCaptionLbl : Label '(c) Other outward supplies (Nil rated, exempted)';
        InwardSuppliesCaptionLbl : Label '(d) Inward supplies (liable to reverse charge)';
        NonGSTOutwardSuppliesCaptionLbl : Label '(e) Non-GST outward supplies';
        TotTaxableValueCaptionLbl : Label 'Total Taxable value';
        IGSTCaptionLbl : Label 'Integrated Tax';
        CGSTCaptionLbl : Label 'Central Tax';
        SGSTCaptionLbl : Label 'State/UT Tax';
        CessCaptionLbl : Label 'Cess';
        MonthG : Integer;
        YearG : Integer;
        NilRatedTaxableValue : Decimal;
        ZeroRatedTaxableValue : Decimal;
        NilExemptedTaxableValue : Decimal;
        ReverseChargeTaxableValue : Decimal;
        NonGSTTaxableValue : Decimal;
        NilRatedIGST : Decimal;
        NilRatedCGST : Decimal;
        NilRatedSGST : Decimal;
        NilRatedCess : Decimal;
        ZeroRatedIGST : Decimal;
        ZeroRatedCGST : Decimal;
        ZeroRatedSGST : Decimal;
        ZeroRatedCess : Decimal;
        NilExemptedIGST : Decimal;
        NilExemptedCGST : Decimal;
        NilExemptedSGST : Decimal;
        NilExemptedCess : Decimal;
        ReverseChargeIGST : Decimal;
        ReverseChargeCGST : Decimal;
        ReverseChargeSGST : Decimal;
        ReverseChargeCess : Decimal;
        NonGSTIGST : Decimal;
        NonGSTCGST : Decimal;
        NonGSTSGST : Decimal;
        NonGSTCess : Decimal;
        OftheSuppliesCaptionLbl : Label '3.2 Of the supplies shown in 3.1 (a) above, details of inter-State supplies made to unregistered persons,composition taxable persons and UIN holders';
        CompostiontaxablePersonsCaptionLbl : Label 'composition taxable persons and UIN holders';
        SuppliesMadetoUnRegCaptionLbl : Label 'Supplies made to Unregistered Persons';
        SuppliesMadetoCompCaptionLbl : Label 'Supplies made to Composition Taxable Persons';
        SuppliesmadetoUINHolderCaptionLbl : Label 'Supplies made to UIN holders';
        PlaceofSupplyCaptionLbl : Label 'Place of Supply (State/UT)';
        AmountofIntegratedTaxCaptionLbl : Label 'Amount of Integrated Tax';
        EligibleITCCaptionLbl : Label '4  Eligible ITC';
        ITCAvailableCaptionLbl : Label '(A) ITC Available (whether in full or part)';
        ImportofgoodsCaptionLbl : Label '(1)  Import of goods';
        ImportofServicesCaptionLbl : Label '(2)  Import of services';
        InwardSuppliesLiableCaptionLbl : Label '(3)  Inward supplies liable to reverse charge (other than 1 & 2 above)';
        InwardSuppliesFromISDCaptionLbl : Label '(4)  Inward supplies from ISD';
        AllOtherITCCaptionLbl : Label '(5)  All other ITC';
        ITCReversedCaptionLbl : Label '(B) ITC Reversed';
        AsPerrulesCaptionLbl : Label '(1) As per rules 42 & 43 of CGST Rules';
        OthersCaptionLbl : Label '(2) Others';
        NetITCAvailableCaptionLbl : Label '(C) Net ITC Available (A) – (B)
                                                                                           ';
        IneligibleITCCaptionLbl : Label '(D) Ineligible ITC';
        AsPerSectionCaptionLbl : Label '(1) As per section 17(5)';
        ValueofExemptCaptionLbl : Label '5. Values of exempt, nil-rated and non-GST  inward supplies';
        FromSupplierundercompositionCaptionLbl : Label 'From a supplier under composition scheme, Exempt and Nil rated supply';
        NonGSTSupplyCaptionLbl : Label 'Non GST supply';
        InterStateSuppliesCaptionLbl : Label 'Inter-State Supplies';
        IntraStateSuppliesCaptionLbl : Label 'Intra-State Supplies';
        InterestLateFeeCaptionLbl : Label '5.1      Interest and Late Fee Payable';
        DescriptionCaptionLbl : Label 'Description';
        InterestCaptionLbl : Label 'Interest';
        LateFeesCaptionLbl : Label 'Late Fees';
        PaymentoftaxCaptionLbl : Label '6.1   Payment of tax';
        TaxPayableCaptionLbl : Label 'Tax payable';
        PaidthroughITCCaptionLbl : Label 'Paid through ITC';
        TaxPaidTDSTCSCaptionLbl : Label 'Tax Paid TDS/TCS';
        TaxCessCaptionLbl : Label 'Tax/Cess paid in cash';
        TDSTCSCreditCaptionLbl : Label '6.2  TDS/TCS Credit';
        TDSCaptionLbl : Label 'TDS';
        TCSCaptionLbl : Label 'TCS';
        DetailedGSTLedgerEntry : Record "Detailed GST Ledger Entry";
        StateCodeTaxableValue : Decimal;
        StateCodeIntegratedTax : Decimal;
        PurchInterStateVal : Decimal;
        PurchIntraStateVal : Decimal;
        PurchNonGSTInterStateVal : Decimal;
        PurchNonGSTIntraStateVal : Decimal;
        CompanyInfo : Record "Company Information";
        SalesIGSTTaxPayment : Decimal;
        SalesCGSTTaxPayment : Decimal;
        SalesSGSTTaxPayment : Decimal;
        SalesCessTaxPayment : Decimal;
        PurchIGSTTaxPayment : Decimal;
        PurchCGSTTaxPayment : Decimal;
        PurchSGSTTaxPayment : Decimal;
        PurchCessTaxPayment : Decimal;
        ImportofGoodsIGST : Decimal;
        ImportofGoodsCGST : Decimal;
        ImportofGoodsSGST : Decimal;
        ImportofGoodsCess : Decimal;
        ImportofServiceIGST : Decimal;
        ImportofServiceCGST : Decimal;
        ImportofServiceSGST : Decimal;
        ImportofServiceCess : Decimal;
        ITCInwardSuppliesIGST : Decimal;
        ITCInwardSuppliesCGST : Decimal;
        ITCInwardSuppliesSGST : Decimal;
        ITCInwardSuppliesCess : Decimal;
        ISDInwardSuppliesIGST : Decimal;
        ISDInwardSuppliesCGST : Decimal;
        ISDInwardSuppliesSGST : Decimal;
        ISDInwardSuppliesCess : Decimal;
        AllOtherITCIGST : Decimal;
        AllOtherITCCGST : Decimal;
        AllOtherITCSGST : Decimal;
        AllOtherITCCess : Decimal;
        OthersIGST : Decimal;
        OthersCGST : Decimal;
        OthersSGST : Decimal;
        OthersCess : Decimal;
        FromDate : Date;
        ToDate : Date;
}

