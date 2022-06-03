report 50137 "GSTR2 Purchase"
{
    // version B2B1.0

    DefaultLayout = RDLC;
    RDLCLayout = './GSTR2 Purchase.rdlc';
    Caption = 'GSTR2 Purchase';

    dataset
    {
        dataitem(General; "Integer")
        {
            DataItemTableView = WHERE(Number = CONST(1));
            column(Number_General; General.Number)
            {
            }
            column(LocationErr; LocationErr)
            {
            }
            column(GSTIN_Caption; GSTIN_CaptionLbl)
            {
            }
            column(NameofTax_Caption; NameofTax_CaptionLbl)
            {
            }
            column(Period_Caption; Period_CaptionLbl)
            {
            }
            column(One_Caption; One_CaptionLbl)
            {
            }
            column(Two_Caption; Two_CaptionLbl)
            {
            }
            column(Three_Caption; Three_CaptionLbl)
            {
            }
            column(INSTRUCTIONS_Caption; INSTRUCTIONS_CaptionLbl)
            {
            }
            column(Ex_Caption; Ex_CaptionLbl)
            {
            }
            column(Avoid_Cut_Caption; Avoid_Cut_CaptionLbl)
            {
            }
            column(To_Enter_Caption; To_Enter_CaptionLbl)
            {
            }
            column(While_Pasting_Caption; While_Pasting_CaptionLbl)
            {
            }
            column(Before_any_Caption; Before_any_CaptionLbl)
            {
            }
            column(Avoid_using_Caption; Avoid_using_CaptionLbl)
            {
            }
            column(If_mandatory_Caption; If_mandatory_CaptionLbl)
            {
            }
            column(Option_Field_Caption; Option_Field_CaptionLbl)
            {
            }
            column(Mandatory_Field_Caption; Mandatory_Field_CaptionLbl)
            {
            }
            column(GeneralVisibility; GeneralVisibility)
            {
            }
            column(GSTIN; GSTIN)
            {
            }
            column(TaxablePerson; TaxablePerson)
            {
            }
            column(Period; Period)
            {
            }
            column(GeneralDate; GeneralDate)
            {
            }

            trigger OnAfterGetRecord();
            begin
                GeneralVisibility := TRUE;
            end;

            trigger OnPreDataItem();
            begin
                GeneralDate := DMY2DATE(1, Period, Year);
            end;
        }
        dataitem(B2B; "Integer")
        {
            DataItemTableView = SORTING(Number);
            column(Number_B2B; B2B.Number)
            {
            }
            column(B2BVisibility; B2BVisibility)
            {
            }
            column(G1_Caption2; G1_CaptionLbl)
            {
            }
            column(G2_Caption2; G2_CaptionLbl)
            {
            }
            column(G3_Caption2; G3_CaptionLbl)
            {
            }
            column(G4_Caption2; G4_CaptionLbl)
            {
            }
            column(G5_Caption2; G5_CaptionLbl)
            {
            }
            column(G6_Caption2; G6_CaptionLbl)
            {
            }
            column(G7_Caption2; G7_CaptionLbl)
            {
            }
            column(G8_Caption2; G8_CaptionLbl)
            {
            }
            column(G9_Caption2; G9_CaptionLbl)
            {
            }
            column(G10_Caption2; G10_CaptionLbl)
            {
            }
            column(G11_Caption2; G11_CaptionLbl)
            {
            }
            column(G12_Caption2; G12_CaptionLbl)
            {
            }
            column(G13_Caption2; G13_CaptionLbl)
            {
            }
            column(G14_Caption2; G14_CaptionLbl)
            {
            }
            column(G15_Caption2; G15_CaptionLbl)
            {
            }
            column(G16_Caption2; G16_CaptionLbl)
            {
            }
            column(G17_Caption2; G17_CaptionLbl)
            {
            }
            column(G18_Caption2; G18_CaptionLbl)
            {
            }
            column(G19_Caption2; G19_CaptionLbl)
            {
            }
            column(IftheSupply_Caption2; IftheSupply_CaptionLbl)
            {
            }
            column(InwardSupplies_Caption2; InwardSupplies_CaptionLbl)
            {
            }
            column(EligibilityITC_Caption2; EligibilityITC_CaptionLbl)
            {
            }
            column(Notes_Caption2; Notes_CaptionLbl)
            {
            }
            column(Taxable_Person_Caption2; Taxable_Person_CaptionLbl)
            {
            }
            column(In_case_of_Caption2; In_case_of_CaptionLbl)
            {
            }
            column(In_case_of_intra_Caption2; In_case_of_intra_CaptionLbl)
            {
            }
            column(Taxable_outward_Caption2; Taxable_outward_CaptionLbl)
            {
            }
            column(GSTIN_UID_Caption2; GSTIN_UID_CaptionLbl)
            {
            }
            column(Party_Name_Caption2; Party_Name_CaptionLbl)
            {
            }
            column(Invoice_Caption2; Invoice_CaptionLbl)
            {
            }
            column(Number_Caption2; Number_CaptionLbl)
            {
            }
            column(Date_Caption2; Date_CaptionLbl)
            {
            }
            column(Value_Caption2; Value_CaptionLbl)
            {
            }
            column(Taxable_Value_Caption2; Taxable_Value_CaptionLbl)
            {
            }
            column(GST_Rate_Caption2; GST_Rate_CaptionLbl)
            {
            }
            column(IGST_Caption2; IGST_CaptionLbl)
            {
            }
            column(CGST_Caption2; CGST_CaptionLbl)
            {
            }
            column(SGST_UTGST_Caption2; SGST_UTGST_CaptionLbl)
            {
            }
            column(CESS_Caption2; CESS_CaptionLbl)
            {
            }
            column(POS_only_if_Caption2; PlaceofSupply_CaptionLbl)
            {
            }
            column(Reverse_Charge_Caption2; Reverse_Charge_CaptionLbl)
            {
            }
            column(Indicate_supply_Caption2; Indicate_supply_CaptionLbl)
            {
            }
            column(GSTIN_of_ecommerce_Caption2; GSTIN_of_ecommerce_CaptionLbl)
            {
            }
            column(Original_Invoice_Caption2; Original_Invoice_CaptionLbl)
            {
            }
            column(No_Caption2; No_CaptionLbl)
            {
            }
            column(Amount_Caption2; Amount_CaptionLbl)
            {
            }
            column(AmountITC_Caption2; AmountITC_CaptionLbl)
            {
            }
            column(SGSTAmount2; SGSTAmount)
            {
            }
            column(CGSTAmount2; CGSTAmount)
            {
            }
            column(IGSTAmount2; IGSTAmount)
            {
            }
            column(CGSTRate2; CGSTRate)
            {
            }
            column(SGSTRate2; SGSTRate)
            {
            }
            column(IGSTRate2; IGSTRate)
            {
            }
            column(IGSTTotal2; IGSTTotal)
            {
            }
            column(CGSTTotal2; CGSTTotal)
            {
            }
            column(SGSTTotal2; SGSTTotal)
            {
            }
            column(GSTPertg2; GSTPertg)
            {
            }
            column(IsGSTApplicable2; IsGSTApplicable)
            {
            }
            column(Vendor_No2; DetailedGSTLedgerEntry."Buyer/Seller Reg. No.")
            {
            }
            column(Document_No2; PurchInvHeaderB2B."No.")
            {
            }
            column(DocNo22; PurchInvLine."Document No.")
            {
            }
            column(Lineno2; PurchInvLine."Line No.")
            {
            }
            column(Vendor_Name2; PurchInvHeaderB2B."Buy-from Vendor Name")
            {
            }
            column(PostingDate2; PurchInvHeaderB2B."Document Date")
            {
            }
            column(Amount_to_Vendor2; PurchInvLine."Amount To Vendor")
            {
            }
            column(B2BHeaderVisibility2; B2BHeaderVisibility)
            {
            }
            column(B2BFooterVisibility2; B2BFooterVisibility)
            {
            }
            column(TaxableValueB2B2; TaxableValueB2B)
            {
            }
            column(StateDescription2; StateDescription)
            {
            }

            trigger OnAfterGetRecord();
            begin
                CLEAR(CGSTRate);
                CLEAR(SGSTRate);
                CLEAR(IGSTRate);
                CLEAR(CGSTTotal);
                CLEAR(SGSTTotal);
                CLEAR(IGSTTotal);
                CLEAR(CGSTAmount);
                CLEAR(SGSTAmount);
                CLEAR(IGSTAmount);
                CLEAR(GSTPertg);
                CLEAR(TaxableValueB2B);
                CLEAR(StateDescription);

                IF Number = 1 THEN
                    B2BHeaderVisibility := TRUE
                ELSE
                    B2BHeaderVisibility := FALSE;
                B2BVisibility := FALSE;
                IF Number = 1 THEN
                    PurchInvHeaderB2B.FINDFIRST
                ELSE
                    PurchInvHeaderB2B.NEXT;
                PurchInvHeaderB2B.CALCFIELDS("Amount to Vendor");

                IsGSTApplicable := GSTManagement.IsGSTApplicable(PurchInvHeaderB2B.Structure);
                IF VendorGRec.GET(PurchInvHeaderB2B."Buy-from Vendor No.") THEN;

                PurchInvLine.RESET;
                PurchInvLine.SETRANGE("Document No.", PurchInvHeaderB2B."No.");
                PurchInvLine.SETFILTER("GST Group Code", '<>%1', '');
                IF PurchInvLine.FINDSET THEN
                    REPEAT
                        IF IsGSTApplicable THEN BEGIN
                            GSTComponent.RESET;
                            GSTComponent.SETRANGE("GST Jurisdiction Type", PurchInvLine."GST Jurisdiction Type");
                            IF GSTComponent.FINDSET THEN
                                REPEAT
                                    DetailedGSTLedgerEntry.RESET;
                                    DetailedGSTLedgerEntry.SETCURRENTKEY("Transaction Type", "Document Type", "Document No.", "Document Line No.");
                                    DetailedGSTLedgerEntry.SETRANGE("Transaction Type", DetailedGSTLedgerEntry."Transaction Type"::Purchase);
                                    DetailedGSTLedgerEntry.SETRANGE("Document Type", DetailedGSTLedgerEntry."Document Type"::Invoice);
                                    DetailedGSTLedgerEntry.SETRANGE("Document No.", PurchInvLine."Document No.");
                                    DetailedGSTLedgerEntry.SETRANGE("Document Line No.", PurchInvLine."Line No.");
                                    DetailedGSTLedgerEntry.SETRANGE("Entry Type", DetailedGSTLedgerEntry."Entry Type"::"Initial Entry");
                                    DetailedGSTLedgerEntry.SETRANGE("GST Component Code", GSTComponent.Code);
                                    IF DetailedGSTLedgerEntry.FINDSET THEN BEGIN
                                        REPEAT
                                            CASE DetailedGSTLedgerEntry."GST Component Code" OF
                                                'IGST':
                                                    BEGIN
                                                        IGSTRate := DetailedGSTLedgerEntry."GST %";
                                                        IGSTAmount := ABS(DetailedGSTLedgerEntry."GST Amount");
                                                        IGSTTotal += IGSTAmount;
                                                    END;
                                                'CGST':
                                                    BEGIN
                                                        CGSTRate := DetailedGSTLedgerEntry."GST %";
                                                        CGSTAmount := ABS(DetailedGSTLedgerEntry."GST Amount");
                                                        CGSTTotal += CGSTAmount;
                                                    END;
                                                'SGST':
                                                    BEGIN
                                                        SGSTRate := DetailedGSTLedgerEntry."GST %";
                                                        SGSTAmount := ABS(DetailedGSTLedgerEntry."GST Amount");
                                                        SGSTTotal += SGSTAmount;
                                                    END;
                                            END;
                                        UNTIL DetailedGSTLedgerEntry.NEXT = 0;
                                    END;
                                UNTIL GSTComponent.NEXT = 0;
                        END;
                        GSTPertg := IGSTRate + CGSTRate + SGSTRate;
                        TaxableValueB2B := PurchInvLine."GST Base Amount";
                        ValueTdsAmount := PurchInvLine."TDS Amount";
                        IF LocationGRec.GET(PurchInvHeaderB2B."Location Code") THEN;
                        StateGRec.RESET;
                        StateGRec.SETRANGE(Code, LocationGRec."State Code");
                        IF StateGRec.FINDFIRST THEN
                            StateDescription := StateGRec.Description;
                    UNTIL PurchInvLine.NEXT = 0;
            end;

            trigger OnPostDataItem();
            begin
                B2BFooterVisibility := TRUE;
            end;

            trigger OnPreDataItem();
            begin
                Exp := 'CM';
                MonthGVar := Period;
                FromDate := DMY2DATE(1, MonthGVar, Year);
                ToDate := CALCDATE(Exp, FromDate);

                PurchInvHeaderB2B.RESET;
                PurchInvHeaderB2B.SETRANGE("Posting Date", FromDate, ToDate);
                PurchInvHeaderB2B.SETRANGE("Location Code", LocationCode);
                PurchInvHeaderB2B.SETRANGE("GST Vendor Type", PurchInvHeaderB2B."GST Vendor Type"::Registered);
                IF PurchInvHeaderB2B.FINDFIRST THEN;
                MESSAGE(FORMAT(PurchInvHeaderB2B.COUNT));
                DetailedGSTLedgerEntry.RESET;
                DetailedGSTLedgerEntry.SETRANGE("Reverse Charge", FALSE);
                IF DetailedGSTLedgerEntry.FINDFIRST THEN
                    B2BVisibility := FALSE;
                SETRANGE(B2B.Number, 1, PurchInvHeaderB2B.COUNT);
            end;
        }
        dataitem("Reverse Charge"; "Integer")
        {
            DataItemTableView = SORTING(Number);
            column(Reverse_Charge_Number; "Reverse Charge".Number)
            {
            }
            column(Reverse_TaxableValue; TaxableValueB2B)
            {
            }
            column(ReverseTaxbleValue; ReverseTaxbleValue)
            {
            }
            column(ReverseChargeHeaderVisibility; ReverseChargeHeaderVisibility)
            {
            }
            column(ReverseChargeVisibility; ReverseChargeVisibility)
            {
            }
            column(ReverseCharge_GSTNo; VendorReverseGRec."GST Registration No.")
            {
            }
            column(Reverse_Category; PurchInvHeaderB2B."GST Vendor Type")
            {
            }
            column(Reverse_Document_No; PurchInvHeaderB2B."Vendor Invoice No.")
            {
            }
            column(Reverse_Vendor_Name; PurchInvHeaderB2B."Buy-from Vendor Name")
            {
            }
            column(Reverse_PostingDate; PurchInvHeaderB2B."Document Date")
            {
            }
            column(Reverse_Amount_to_Vendor; PurchInvHeaderB2B."Amount to Vendor")
            {
            }
            column(Reverse_InternalDocNo_Caption; InternalDocNo_CaptionLbl)
            {
            }
            column(Reverse_InternalDocDate_Caption; InternalDocDate_CaptionLbl)
            {
            }
            column(Reverse_InternalDocNo; PurchInvHeaderB2B."No.")
            {
            }
            column(Reverse_InternalDocDate; PurchInvHeaderB2B."Posting Date")
            {
            }
            column(Reverse_StateDescription; StateDescription)
            {
            }
            column(Reverse_GSTPertg; GSTPertg)
            {
            }
            column(IftheSupplyReverse_Caption; IftheSupplyReverse_CaptionLbl)
            {
            }
            column(InwardsuppliesRev_Caption; InwardsuppliesRev_CaptionLbl)
            {
            }
            column(EligibilityITC_ReverseCaption; EligibilityITC_CaptionLbl)
            {
            }
            column(G1_Reverse_Caption; G1_CaptionLbl)
            {
            }
            column(G2_Reverse_Caption; G2_CaptionLbl)
            {
            }
            column(G3_Reverse_Caption; G3_CaptionLbl)
            {
            }
            column(G4_Reverse_Caption; G4_CaptionLbl)
            {
            }
            column(G5_Reverse_Caption; G5_CaptionLbl)
            {
            }
            column(G6_Reverse_Caption; G6_CaptionLbl)
            {
            }
            column(G7_Reverse_Caption; G7_CaptionLbl)
            {
            }
            column(G8_Reverse_Caption; G8_CaptionLbl)
            {
            }
            column(G9_Reverse_Caption; G9_CaptionLbl)
            {
            }
            column(G10_Reverse_Caption; G10_CaptionLbl)
            {
            }
            column(G11_Reverse_Caption; G11_CaptionLbl)
            {
            }
            column(G12_Reverse_Caption; G12_CaptionLbl)
            {
            }
            column(G13_Reverse_Caption; G13_CaptionLbl)
            {
            }
            column(G14_Reverse_Caption; G14_CaptionLbl)
            {
            }
            column(G15_Reverse_Caption; G15_CaptionLbl)
            {
            }
            column(G16_Reverse_Caption; G16_CaptionLbl)
            {
            }
            column(G17_Reverse_Caption; G17_CaptionLbl)
            {
            }
            column(G18_Reverse_Caption; G18_CaptionLbl)
            {
            }
            column(G19_Reverse_Caption; G19_CaptionLbl)
            {
            }
            column(G20_Reverse_Caption; G20_CaptionLbl)
            {
            }
            column(G21_Reverse_Caption; G21_CaptionLbl)
            {
            }
            column(G22_Reverse_Caption; G22_CaptionLbl)
            {
            }
            column(Notes_Reverse_Caption; Notes_CaptionLbl)
            {
            }
            column(Taxable_Reverse_Person_Caption; Taxable_Person_CaptionLbl)
            {
            }
            column(In_case_Reverse_of_Caption; In_case_of_CaptionLbl)
            {
            }
            column(In_case_Reverse_of_intra_Caption; In_case_of_intra_CaptionLbl)
            {
            }
            column(Taxable_Reverse_outward_Caption; Taxable_outward_CaptionLbl)
            {
            }
            column(GSTIN_Reverse_Caption; GSTIN_UID_CaptionLbl)
            {
            }
            column(PartyName_Reverse_Caption; Party_Name_CaptionLbl)
            {
            }
            column(Invoice_Reverse_Caption; Invoice_CaptionLbl)
            {
            }
            column(Number_Reverse_Caption; Number_CaptionLbl)
            {
            }
            column(Date_Reverse_Caption; Date_CaptionLbl)
            {
            }
            column(Value_Reverse_Caption; Value_CaptionLbl)
            {
            }
            column(Taxable_Value_Reverse_Caption; Taxable_Value_CaptionLbl)
            {
            }
            column(GST_Rate_Reverse_Caption; GST_Rate_CaptionLbl)
            {
            }
            column(IGST_Reverse_Caption; IGST_CaptionLbl)
            {
            }
            column(CGST_Reverse_Caption; CGST_CaptionLbl)
            {
            }
            column(SGST_Reverse_Caption; SGST_UTGST_CaptionLbl)
            {
            }
            column(CESS_Reverse_Caption; CESS_CaptionLbl)
            {
            }
            column(POS_only_if_Reverse_Caption; PlaceofSupply_CaptionLbl)
            {
            }
            column(Reverse_Charge_Reverse_Caption; Reverse_Charge_CaptionLbl)
            {
            }
            column(Indicate_supply_Reverse_Caption; Indicate_supply_CaptionLbl)
            {
            }
            column(Original_Invoice_Reverse_Caption; Original_Invoice_CaptionLbl)
            {
            }
            column(No_Reverse_Caption; No_CaptionLbl)
            {
            }
            column(Amount_Reverse_Caption; Amount_CaptionLbl)
            {
            }
            column(AmountITC_Reverse_Caption; AmountITC_CaptionLbl)
            {
            }
            column(SGSTAmount_Reverse; SGSTAmount)
            {
            }
            column(CGSTAmount_Reverse; CGSTAmount)
            {
            }
            column(IGSTAmount_Reverse; IGSTAmount)
            {
            }
            column(CGSTRate_Reverse; CGSTRate)
            {
            }
            column(SGSTRate_Reverse; SGSTRate)
            {
            }
            column(IGSTRate_Reverse; IGSTRate)
            {
            }
            column(IGSTTotal_Reverse; IGSTTotal)
            {
            }
            column(CGSTTotal_Reverse; CGSTTotal)
            {
            }
            column(SGSTTotal_Reverse; SGSTTotal)
            {
            }
            column(GSTPertg_Reverse; GSTPertg)
            {
            }
            column(Category__Reverse_Caption; Category_CaptionLbl)
            {
            }
            column(Cess_ReverseCharge; PurchInvLine."CESS Amount")
            {
            }
            column(GST_Credit_ReverseCharge; PurchInvLine."GST Credit")
            {
            }
            column(ITC_IGST; IGSTEligibility)
            {
            }
            column(ITC_CGST; CGSTEligibility)
            {
            }
            column(ITC_SGST; SGSTEligibility)
            {
            }
            column(ReverseCharge; DetailedGSTLedgerEntry."Reverse Charge")
            {
            }
            column(GstVendortype; DetailedGSTLedgerEntry."GST Vendor Type")
            {
            }
            column(ReverseChargeEmpty; ReverseChargeEmpty)
            {
            }
            column(ReverseChargeFooter; ReverseChargeFooter)
            {
            }
            column(ReverseIGST; ReverseIGST)
            {
            }
            column(ReverseCGST; ReverseCGST)
            {
            }
            column(ReverseSGST; ReverseSGST)
            {
            }
            column(ReverseIGSTITC; ReverseIGSTITC)
            {
            }
            column(ReverseCGSTITC; ReverseCGSTITC)
            {
            }
            column(ReverseSGSTITC; ReverseSGSTITC)
            {
            }

            trigger OnAfterGetRecord();
            begin
                CLEAR(CGSTRate);
                CLEAR(SGSTRate);
                CLEAR(IGSTRate);
                CLEAR(CGSTTotal);
                CLEAR(SGSTTotal);
                CLEAR(IGSTTotal);
                CLEAR(CGSTAmount);
                CLEAR(SGSTAmount);
                CLEAR(IGSTAmount);
                CLEAR(GSTPertg);
                CLEAR(IGSTEligibility);
                CLEAR(CGSTEligibility);
                CLEAR(SGSTEligibility);
                CLEAR(TaxableValueB2B);
                CLEAR(StateDescription);

                IF Number = 1 THEN
                    ReverseChargeHeaderVisibility := TRUE
                ELSE
                    ReverseChargeHeaderVisibility := FALSE;
                ReverseChargeVisibility := TRUE;

                IF Number = 1 THEN
                    PurchInvHeaderB2B.FINDFIRST
                ELSE
                    PurchInvHeaderB2B.NEXT;
                PurchInvHeaderB2B.CALCFIELDS("Amount to Vendor");

                IsGSTApplicable := GSTManagement.IsGSTApplicable(PurchInvHeaderB2B.Structure);
                IF VendorReverseGRec.GET(PurchInvHeaderB2B."Buy-from Vendor No.") THEN;

                PurchInvLine.RESET;
                PurchInvLine.SETRANGE("Document No.", PurchInvHeaderB2B."No.");
                //PurchInvLine.SETRANGE("GST Credit",PurchInvLine."GST Credit"::Availment);
                IF PurchInvLine.FINDSET THEN BEGIN
                    REPEAT
                        IF IsGSTApplicable THEN BEGIN
                            GSTComponent.RESET;
                            GSTComponent.SETRANGE("GST Jurisdiction Type", PurchInvLine."GST Jurisdiction Type");
                            IF GSTComponent.FINDSET THEN
                                REPEAT
                                    DetailedGSTLedgerEntry.RESET;
                                    DetailedGSTLedgerEntry.SETCURRENTKEY("Transaction Type", "Document Type", "Document No.", "Document Line No.");
                                    DetailedGSTLedgerEntry.SETRANGE("Transaction Type", DetailedGSTLedgerEntry."Transaction Type"::Purchase);
                                    DetailedGSTLedgerEntry.SETRANGE("Document Type", DetailedGSTLedgerEntry."Document Type"::Invoice);
                                    DetailedGSTLedgerEntry.SETRANGE("Document No.", PurchInvLine."Document No.");
                                    DetailedGSTLedgerEntry.SETRANGE("Document Line No.", PurchInvLine."Line No.");
                                    DetailedGSTLedgerEntry.SETRANGE("Entry Type", DetailedGSTLedgerEntry."Entry Type"::"Initial Entry");
                                    DetailedGSTLedgerEntry.SETRANGE("GST Component Code", GSTComponent.Code);
                                    IF DetailedGSTLedgerEntry.FINDSET THEN BEGIN
                                        REPEAT
                                            CASE DetailedGSTLedgerEntry."GST Component Code" OF
                                                'IGST':
                                                    BEGIN
                                                        IGSTRate := DetailedGSTLedgerEntry."GST %";
                                                        IGSTAmount := ABS(DetailedGSTLedgerEntry."GST Amount");
                                                        IGSTTotal += IGSTAmount;
                                                    END;
                                                'CGST':
                                                    BEGIN
                                                        CGSTRate := DetailedGSTLedgerEntry."GST %";
                                                        CGSTAmount := ABS(DetailedGSTLedgerEntry."GST Amount");
                                                        CGSTTotal += CGSTAmount;
                                                    END;
                                                'SGST':
                                                    BEGIN
                                                        SGSTRate := DetailedGSTLedgerEntry."GST %";
                                                        SGSTAmount := ABS(DetailedGSTLedgerEntry."GST Amount");
                                                        SGSTTotal += SGSTAmount;
                                                    END;
                                            END;
                                        UNTIL DetailedGSTLedgerEntry.NEXT = 0;
                                    END;
                                UNTIL GSTComponent.NEXT = 0;
                        END;

                        GSTPertg := IGSTRate + CGSTRate + SGSTRate;
                        TaxableValueB2B += PurchInvLine."GST Base Amount";//2711

                        IF LocationGRec.GET(PurchInvHeaderB2B."Location Code") THEN;
                        StateGRec.RESET;
                        StateGRec.SETRANGE(Code, LocationGRec."State Code");
                        IF StateGRec.FINDFIRST THEN
                            StateDescription := StateGRec.Description;

                    UNTIL PurchInvLine.NEXT = 0;
                END;
                // ELSE BEGIN
                //CurrReport.SKIP;

                //GST Credit 111717
                //B2B1.0>>
                IF PurchInvLine."GST Credit" = PurchInvLine."GST Credit"::Availment THEN BEGIN
                    IGSTEligibility := IGSTAmount;
                    CGSTEligibility := CGSTAmount;
                    SGSTEligibility := SGSTAmount;
                END ELSE
                    IF PurchInvLine."GST Credit" = PurchInvLine."GST Credit"::"Non-Availment" THEN BEGIN
                        IGSTEligibility := 0;
                        CGSTEligibility := 0;
                        SGSTEligibility := 0;
                    END;
                //B2B1.0<<
                //111717

                //TEST

                IF (DetailedGSTLedgerEntry."Reverse Charge" = TRUE) AND (ReverseChargeVisibility = TRUE) THEN BEGIN
                    ReverseTaxbleValue += PurchInvLine."GST Base Amount";
                    ReverseIGST += IGSTTotal;
                    ReverseCGST += CGSTTotal;
                    ReverseSGST += SGSTTotal;
                    ReverseIGSTITC += IGSTEligibility;
                    ReverseCGSTITC += CGSTEligibility;
                    ReverseSGSTITC += SGSTEligibility;
                END;
            end;

            trigger OnPreDataItem();
            begin
                PurchInvHeaderB2B.RESET;
                PurchInvHeaderB2B.SETRANGE("Posting Date", FromDate, ToDate);
                PurchInvHeaderB2B.SETRANGE("Location Code", LocationCode);
                PurchInvHeaderB2B.SETFILTER("GST Vendor Type", '%1|%2', PurchInvHeaderB2B."GST Vendor Type"::Registered, PurchInvHeaderB2B."GST Vendor Type"::Unregistered);
                IF PurchInvHeaderB2B.FINDFIRST THEN BEGIN
                    DetailedGSTLedgerEntry.RESET;
                    DetailedGSTLedgerEntry.SETRANGE("Document No.", PurchInvHeaderB2B."No.");
                    DetailedGSTLedgerEntry.SETFILTER("GST Vendor Type", '%1|%2', DetailedGSTLedgerEntry."GST Vendor Type"::Registered, DetailedGSTLedgerEntry."GST Vendor Type"::Unregistered);
                    DetailedGSTLedgerEntry.SETRANGE("Reverse Charge", TRUE);
                    SETRANGE("Reverse Charge".Number, 1, PurchInvHeaderB2B.COUNT);
                    IF DetailedGSTLedgerEntry.FINDFIRST THEN
                        ReverseChargeVisibility := TRUE;
                END;
                CLEAR(ReverseTaxbleValue);
                CLEAR(ReverseIGST);
                CLEAR(ReverseCGST);
                CLEAR(ReverseSGST);
            end;
        }
        dataitem("Import Goods"; "Integer")
        {
            DataItemTableView = SORTING(Number);
            column(ImportGoods_Number; "Import Goods".Number)
            {
            }
            column(ImportGoodsHeaderVisibility; ImportGoodsHeaderVisibility)
            {
            }
            column(ImportGoodsVisibility; ImportGoodsVisibility)
            {
            }
            column(IftheSupplyImport_Caption; IftheSupplyImport_CaptionLbl)
            {
            }
            column(InputsImport_Caption; InputsImport_CaptionLbl)
            {
            }
            column(Notes_ImportGoods_Caption; Notes_CaptionLbl)
            {
            }
            column(Category_ImportGoods_Caption; Category_CaptionLbl)
            {
            }
            column(GSTIN_ImportGoods_Caption; GSTIN_UID_CaptionLbl)
            {
            }
            column(EligibilityITC_ImportGoods_Caption; EligibilityITC_CaptionLbl)
            {
            }
            column(GST_Rate_ImportGoods_Caption; GST_Rate_CaptionLbl)
            {
            }
            column(IGST_ImportGoods_Caption; IGST_CaptionLbl)
            {
            }
            column(CGST_ImportGoods_Caption; CGST_CaptionLbl)
            {
            }
            column(SGST_ImportGoods_Caption; SGST_UTGST_CaptionLbl)
            {
            }
            column(CESS_ImportGoods_Caption; CESS_CaptionLbl)
            {
            }
            column(PartyName_ImportGoods_Caption; Party_Name_CaptionLbl)
            {
            }
            column(Invoice_ImportGoods_Caption; Invoice_CaptionLbl)
            {
            }
            column(Number_ImportGoods_Caption; Number_CaptionLbl)
            {
            }
            column(Date_ImportGoods_Caption; Date_CaptionLbl)
            {
            }
            column(Value_ImportGoods_Caption; Value_CaptionLbl)
            {
            }
            column(Taxable_Value_ImportGoods_Caption; Taxable_Value_CaptionLbl)
            {
            }
            column(Original_Invoice_ImportGoods_Caption; Original_Invoice_CaptionLbl)
            {
            }
            column(No_ImportGoods_Caption; No_CaptionLbl)
            {
            }
            column(Amount_ImportGoods_Caption; Amount_CaptionLbl)
            {
            }
            column(AmountITC_ImportGoods_Caption; AmountITC_CaptionLbl)
            {
            }
            column(G1_ImportGoods_Caption; G1_CaptionLbl)
            {
            }
            column(G2_ImportGoods_Caption; G2_CaptionLbl)
            {
            }
            column(G3_ImportGoods_Caption; G3_CaptionLbl)
            {
            }
            column(G4_ImportGoods_Caption; G4_CaptionLbl)
            {
            }
            column(G5_ImportGoods_Caption; G5_CaptionLbl)
            {
            }
            column(G6_ImportGoods_Caption; G6_CaptionLbl)
            {
            }
            column(G7_ImportGoods_Caption; G7_CaptionLbl)
            {
            }
            column(G8_ImportGoods_Caption; G8_CaptionLbl)
            {
            }
            column(G9_ImportGoods_Caption; G9_CaptionLbl)
            {
            }
            column(G10_ImportGoods_Caption; G10_CaptionLbl)
            {
            }
            column(G11_ImportGoods_Caption; G11_CaptionLbl)
            {
            }
            column(G12_ImportGoods_Caption; G12_CaptionLbl)
            {
            }
            column(G13_ImportGoods_Caption; G13_CaptionLbl)
            {
            }
            column(G14_ImportGoods_Caption; G14_CaptionLbl)
            {
            }
            column(G15_ImportGoods_Caption; G15_CaptionLbl)
            {
            }
            column(G16_ImportGoods_Caption; G16_CaptionLbl)
            {
            }
            column(G17_ImportGoods_Caption; G17_CaptionLbl)
            {
            }
            column(G18_ImportGoods_Caption; G18_CaptionLbl)
            {
            }
            column(G19_ImportGoods_Caption; G19_CaptionLbl)
            {
            }
            column(G20_ImportGoods_Caption; G20_CaptionLbl)
            {
            }
            column(G21_ImportGoods_Caption; G21_CaptionLbl)
            {
            }
            column(Cr_Caption; Cr22_CaptionLbl)
            {
            }
            column(GSTIN_Import_Caption; GSTIN_Import_CaptionLbl)
            {
            }
            column(Bill_of_Entry_No_Caption; Bill_of_Entry_No_CaptionLbl)
            {
            }
            column(Bill_of_Entry_Date_Caption; Bill_of_Entry_Date_CaptionLbl)
            {
            }
            column(Bill_of_Entry_Value_Caption; Bill_of_Entry_Value_CaptionLbl)
            {
            }
            column(InternalDocNo_Caption; InternalDocNo_CaptionLbl)
            {
            }
            column(InternalDocDate_Caption; InternalDocDate_CaptionLbl)
            {
            }
            column(Port_Code_Import_Caption; Port_Code_CaptionLbl)
            {
            }
            column(Import_Category; PurchInvHeaderB2B."GST Vendor Type")
            {
            }
            column(Bill_of_Entry_No; PurchInvHeaderB2B."Bill of Entry No.")
            {
            }
            column(Bill_of_Entry_Date; PurchInvHeaderB2B."Bill of Entry Date")
            {
            }
            column(Bill_of_Entry_Value; PurchInvHeaderB2B."Bill of Entry Value")
            {
            }
            column(InternalDocNo; PurchInvHeaderB2B."No.")
            {
            }
            column(InternalDocDate; PurchInvHeaderB2B."Posting Date")
            {
            }
            column(Import_Document_No; PurchInvHeaderB2B."Vendor Invoice No.")
            {
            }
            column(Import_Vendor_Name; PurchInvHeaderB2B."Buy-from Vendor Name")
            {
            }
            column(Import_PostingDate; PurchInvHeaderB2B."Document Date")
            {
            }
            column(Import_Amount_to_Vendor; PurchInvHeaderB2B."Amount to Vendor")
            {
            }
            column(Import_TaxableValue; TaxableValueB2B)
            {
            }
            column(Import_IGSTAmount; IGSTAmount)
            {
            }
            column(Import_IGSTRate; IGSTRate)
            {
            }
            column(Import_IGSTTotal; IGSTTotal)
            {
            }
            column(Import_GSTPertg; GSTPertg)
            {
            }
            column(Cess_Import; PurchInvLine."CESS Amount")
            {
            }
            column(GST_Credit_Import; PurchInvLine."GST Credit")
            {
            }
            column(Import_IGST; IGSTEligibility)
            {
            }
            column(Import_CGST; CGSTEligibility)
            {
            }
            column(Import_SGST; SGSTEligibility)
            {
            }

            trigger OnAfterGetRecord();
            begin
                CLEAR(IGSTRate);
                CLEAR(IGSTTotal);
                CLEAR(IGSTAmount);
                CLEAR(GSTPertg);
                CLEAR(IGSTEligibility);
                CLEAR(CGSTEligibility);
                CLEAR(SGSTEligibility);
                CLEAR(TaxableValueB2B);

                IF Number = 1 THEN
                    ImportGoodsHeaderVisibility := TRUE
                ELSE
                    ImportGoodsHeaderVisibility := FALSE;
                ImportGoodsVisibility := TRUE;

                IF Number = 1 THEN
                    PurchInvHeaderB2B.FINDFIRST
                ELSE
                    PurchInvHeaderB2B.NEXT;

                PurchInvHeaderB2B.CALCFIELDS("Amount to Vendor");
                IsGSTApplicable := GSTManagement.IsGSTApplicable(PurchInvHeaderB2B.Structure);
                IF VendorReverseGRec.GET(PurchInvHeaderB2B."Buy-from Vendor No.") THEN;

                PurchInvLine.RESET;
                PurchInvLine.SETRANGE("Document No.", PurchInvHeaderB2B."No.");
                //PurchInvLine.SETRANGE("GST Credit",PurchInvLine."GST Credit"::Availment);
                IF PurchInvLine.FINDSET THEN BEGIN
                    REPEAT
                        IF IsGSTApplicable THEN BEGIN
                            GSTComponent.RESET;
                            GSTComponent.SETRANGE("GST Jurisdiction Type", PurchInvLine."GST Jurisdiction Type");
                            IF GSTComponent.FINDSET THEN
                                REPEAT
                                    DetailedGSTLedgerEntry.RESET;
                                    DetailedGSTLedgerEntry.SETCURRENTKEY("Transaction Type", "Document Type", "Document No.", "Document Line No.");
                                    DetailedGSTLedgerEntry.SETRANGE("Transaction Type", DetailedGSTLedgerEntry."Transaction Type"::Purchase);
                                    DetailedGSTLedgerEntry.SETRANGE("Document Type", DetailedGSTLedgerEntry."Document Type"::Invoice);
                                    DetailedGSTLedgerEntry.SETRANGE("Document No.", PurchInvLine."Document No.");
                                    DetailedGSTLedgerEntry.SETRANGE("Document Line No.", PurchInvLine."Line No.");
                                    DetailedGSTLedgerEntry.SETRANGE("Entry Type", DetailedGSTLedgerEntry."Entry Type"::"Initial Entry");
                                    DetailedGSTLedgerEntry.SETRANGE("GST Component Code", GSTComponent.Code);
                                    IF DetailedGSTLedgerEntry.FINDSET THEN BEGIN
                                        REPEAT
                                            CASE DetailedGSTLedgerEntry."GST Component Code" OF
                                                'IGST':
                                                    BEGIN
                                                        IGSTRate := DetailedGSTLedgerEntry."GST %";
                                                        IGSTAmount += ABS(DetailedGSTLedgerEntry."GST Amount");
                                                        IGSTTotal := IGSTAmount;
                                                    END;
                                            /* 'CGST':
                                                BEGIN
                                                  CGSTRate := DetailedGSTLedgerEntry."GST %";
                                                  CGSTAmount := ABS(DetailedGSTLedgerEntry."GST Amount");
                                                  CGSTTotal += CGSTAmount;
                                                END;
                                              'SGST':
                                                BEGIN
                                                  SGSTRate := DetailedGSTLedgerEntry."GST %";
                                                  SGSTAmount := ABS(DetailedGSTLedgerEntry."GST Amount");
                                                  SGSTTotal += SGSTAmount;
                                                END; */
                                            END;
                                        UNTIL DetailedGSTLedgerEntry.NEXT = 0;
                                    END;
                                UNTIL GSTComponent.NEXT = 0;
                        END;
                        //GSTPertg := IGSTRate + CGSTRate + SGSTRate;
                        TaxableValueB2B += PurchInvLine."GST Base Amount";
                    UNTIL PurchInvLine.NEXT = 0;
                END; //ELSE
                     // CurrReport.SKIP;

                /*
                //B2B1.0
                IF PurchInvLine."GST Credit" = PurchInvLine."GST Credit"::"Non-Availment" THEN BEGIN
                  IGSTAmount := 0;
                  CGSTAmount := 0;
                  SGSTAmount := 0;
                END;
                //B2B1.0
                */

                //B2B1.0 171117
                IF PurchInvLine."GST Credit" = PurchInvLine."GST Credit"::Availment THEN BEGIN
                    IGSTEligibility := IGSTAmount;
                    CGSTEligibility := CGSTAmount;
                    SGSTEligibility := SGSTAmount;
                END ELSE
                    IF PurchInvLine."GST Credit" = PurchInvLine."GST Credit"::"Non-Availment" THEN BEGIN
                        IGSTEligibility := 0;
                        CGSTEligibility := 0;
                        SGSTEligibility := 0;
                    END;
                //B2B1.0 171117

            end;

            trigger OnPreDataItem();
            begin
                PurchInvHeaderB2B.RESET;
                PurchInvHeaderB2B.SETRANGE("Posting Date", FromDate, ToDate);
                PurchInvHeaderB2B.SETRANGE("Location Code", LocationCode);
                PurchInvHeaderB2B.SETRANGE("GST Vendor Type", PurchInvHeaderB2B."GST Vendor Type"::Import);
                IF PurchInvHeaderB2B.FINDFIRST THEN;

                DetailedGSTLedgerEntry.RESET;
                DetailedGSTLedgerEntry.SETRANGE("Reverse Charge", TRUE);
                IF DetailedGSTLedgerEntry.FINDFIRST THEN
                    ImportGoodsVisibility := TRUE;
                SETRANGE("Import Goods".Number, 1, PurchInvHeaderB2B.COUNT);
            end;
        }
        dataitem("Nil Rated"; "Integer")
        {
            DataItemTableView = SORTING(Number);
            column(Number_NilRated; "Nil Rated".Number)
            {
            }
            column(SuppliesNilRate_Caption; SuppliesNilRate_CaptionLbl)
            {
            }
            column(FiguresNilrated_Caption; FiguresNilrated_CaptionLbl)
            {
            }
            column(SupplyType_Caption; SupplyType_CaptionLbl)
            {
            }
            column(Compounding_Caption; Compounding_CaptionLbl)
            {
            }
            column(AnyExempt_Caption; AnyExempt_CaptionLbl)
            {
            }
            column(AnyNilRated_Caption; AnyNilRated_CaptionLbl)
            {
            }
            column(NonGSTSupply_Caption; NonGSTSupply_CaptionLbl)
            {
            }
            column(N1_Caption; G1_CaptionLbl)
            {
            }
            column(N2_Caption; G2_CaptionLbl)
            {
            }
            column(N3_Caption; G3_CaptionLbl)
            {
            }
            column(N4_Caption; G4_CaptionLbl)
            {
            }
            column(N5_Caption; G5_CaptionLbl)
            {
            }
            column(Nilrated_Exempted_Caption; Nilrated_Exempted_CaptionLbl)
            {
            }
            column(figures_in_Rs_Caption; figures_in_Rs_CaptionLbl)
            {
            }
            column(Description_Caption; Description_CaptionLbl)
            {
            }
            column(Nil_Rated_Amount_Caption; Nil_Rated_Amount_CaptionLbl)
            {
            }
            column(Exempted_Amount_Caption; Exempted_Amount_CaptionLbl)
            {
            }
            column(NonGSTsupplies_Caption; NonGSTsupplies_CaptionLbl)
            {
            }
            column(Interstate_registered_Caption; Interstate_registered_CaptionLbl)
            {
            }
            column(Intrastate_registered_Caption; Intrastate_registered_CaptionLbl)
            {
            }
            column(Interstate_unregistered_Caption; Interstate_unregistered_CaptionLbl)
            {
            }
            column(Intrastate_unregistered_Caption; Intrastate_unregistered_CaptionLbl)
            {
            }
            column(NilRatedHeaderVisibility; NilRatedHeaderVisibility)
            {
            }
            column(NilRatedVisibility; NilRatedVisibility)
            {
            }
            column(NilRatedBaseAmount; NilRatedBaseAmount)
            {
            }
            column(SupplyType; PurchInvLine."GST Jurisdiction Type")
            {
            }

            trigger OnAfterGetRecord();
            begin
                CLEAR(NilRatedBaseAmount);

                IF Number = 1 THEN
                    NilRatedHeaderVisibility := TRUE
                ELSE
                    NilRatedHeaderVisibility := FALSE;
                NilRatedVisibility := TRUE;

                IF Number = 1 THEN
                    PurchInvHeaderNilRated.FINDFIRST
                ELSE
                    PurchInvHeaderNilRated.NEXT;

                PurchInvLine.RESET;
                PurchInvLine.SETRANGE("Document No.", PurchInvHeaderNilRated."No.");
                IF PurchInvLine.FINDFIRST THEN
                    NilRatedBaseAmount := PurchInvLine."GST Base Amount";
            end;

            trigger OnPreDataItem();
            begin
                PurchInvHeaderNilRated.RESET;
                PurchInvHeaderNilRated.SETRANGE("Posting Date", FromDate, ToDate);
                PurchInvHeaderNilRated.SETRANGE("Location Code", LocationCode);
                PurchInvHeaderNilRated.SETFILTER("GST Vendor Type", '%1|%2', PurchInvHeaderNilRated."GST Vendor Type"::Exempted, PurchInvHeaderNilRated."GST Vendor Type"::Composite);
                IF PurchInvHeaderNilRated.FINDFIRST THEN
                    NilRatedVisibility := TRUE;
                SETRANGE("Nil Rated".Number, 1, PurchInvHeaderNilRated.COUNT);
            end;
        }
        dataitem("Cr.Dr"; "Integer")
        {
            DataItemTableView = SORTING(Number);
            column(CrDr_GSTNo; VendorGRec."GST Registration No.")
            {
            }
            column(PurchCrMemoHdr_Vendor_Name; PurchCrMemoHdr."Buy-from Vendor Name")
            {
            }
            column(PurchCrMemoHdr_Posting_Date; PurchCrMemoHdr."Document Date")
            {
            }
            column(CrDr_DocumentNo; PurchCrMemoHdr."No.")
            {
            }
            column(GST_Pertge_CrDr; DetailedGSTLedgerEntry."GST %")
            {
            }
            column(Number_CrDr; "Cr.Dr".Number)
            {
            }
            column(Note_Caption; Note_CaptionLbl)
            {
            }
            column(Information_about_Caption; Information_about_CaptionLbl)
            {
            }
            column(Details_of_Caption; Details_of_CaptionLbl)
            {
            }
            column(Typeofnote_Caption; Typeofnote_CaptionLbl)
            {
            }
            column(Credit_Note_Caption; Credit_Note_CaptionLbl)
            {
            }
            column(Reason_Caption; Reason_CaptionLbl)
            {
            }
            column(PreGST_Caption; PreGST_CaptionLbl)
            {
            }
            column(PlaceofSupply_Caption; PlaceofSupply_CaptionLbl)
            {
            }
            column(Supplier_InvoiceValue_Caption; Supplier_InvoiceValue_CaptionLbl)
            {
            }
            column(TaxAmount_Caption; TaxAmount_CaptionLbl)
            {
            }
            column(Original_Credit_Caption; Original_Credit_CaptionLbl)
            {
            }
            column(C1_Cr_Caption; G1_CaptionLbl)
            {
            }
            column(C2_Cr_Caption; G2_CaptionLbl)
            {
            }
            column(C3_Cr_Caption; G3_CaptionLbl)
            {
            }
            column(C4_Cr_Caption; G4_CaptionLbl)
            {
            }
            column(C5_Cr_Caption; G5_CaptionLbl)
            {
            }
            column(C6_Cr_Caption; G6_CaptionLbl)
            {
            }
            column(C7_Cr_Caption; G7_CaptionLbl)
            {
            }
            column(C8_Cr_Caption; G8_CaptionLbl)
            {
            }
            column(C9_Cr_Caption; G9_CaptionLbl)
            {
            }
            column(C10_Cr_Caption; G10_CaptionLbl)
            {
            }
            column(C11_Cr_Caption; G11_CaptionLbl)
            {
            }
            column(C12_Cr_Caption; G12_CaptionLbl)
            {
            }
            column(C13_Cr_Caption; G13_CaptionLbl)
            {
            }
            column(C14_Cr_Caption; G14_CaptionLbl)
            {
            }
            column(C15_Cr_Caption; G15_CaptionLbl)
            {
            }
            column(C16_Cr_Caption; G16_CaptionLbl)
            {
            }
            column(C17_Cr_Caption; C17_CaptionLbl)
            {
            }
            column(C18_Cr_Caption; C18_CaptionLbl)
            {
            }
            column(C19_Cr_Caption; C19_CaptionLbl)
            {
            }
            column(G20_Cr_Caption; G20_CaptionLbl)
            {
            }
            column(Cr21_Caption; Cr21_CaptionLbl)
            {
            }
            column(Cr22_Caption; Cr22_CaptionLbl)
            {
            }
            column(Cr23_Caption; Cr23_CaptionLbl)
            {
            }
            column(Cr24_Caption; Cr24_CaptionLbl)
            {
            }
            column(GSTIN_UID_Cr_Caption; GSTIN_UID_CaptionLbl)
            {
            }
            column(Party_Name_Cr_Caption; Party_Name_CaptionLbl)
            {
            }
            column(Number_CrCaption; Number_CaptionLbl)
            {
            }
            column(Date_Cr_Caption; Date_CaptionLbl)
            {
            }
            column(Value_Cr_Caption; Value_CaptionLbl)
            {
            }
            column(Taxable_Value_Cr_Caption; Taxable_Value_CaptionLbl)
            {
            }
            column(GST_Rate_Cr_Caption; GST_Rate_CaptionLbl)
            {
            }
            column(IGST_Cr_Caption; IGST_CaptionLbl)
            {
            }
            column(CGST_Cr_Caption; CGST_CaptionLbl)
            {
            }
            column(SGST_UTGST_Cr_Caption; SGST_UTGST_CaptionLbl)
            {
            }
            column(CESS_Cr_Caption; CESS_CaptionLbl)
            {
            }
            column(Original_Invoice_Cr_Caption; Original_Invoice_CrDr_CaptionLbl)
            {
            }
            column(Amount_Cr_Caption; Amount_CaptionLbl)
            {
            }
            column(CrDrRegisterVisibility; CrDrRegisterVisibility)
            {
            }
            column(CrDrRegisterHeaderVisibility; CrDrRegisterHeaderVisibility)
            {
            }
            column(SGSTAmount_CrDr; ABS(SGSTAmount))
            {
            }
            column(CGSTAmount_CrDr; ABS(CGSTAmount))
            {
            }
            column(IGSTAmount_CrDr; ABS(IGSTAmount))
            {
            }
            column(CGSTRate_CrDr; CGSTRate)
            {
            }
            column(SGSTRate_CrDr; SGSTRate)
            {
            }
            column(IGSTRate_CrDr; IGSTRate)
            {
            }
            column(IGSTTotal_CrDr; IGSTTotal)
            {
            }
            column(CGSTTotal_CrDr; CGSTTotal)
            {
            }
            column(SGSTTotal_CrDr; SGSTTotal)
            {
            }
            column(DetailsCrDr_Caption; DetailsCrDr_CaptionLbl)
            {
            }
            column(NoCrDr_Caption; NoCrDr_CaptionLbl)
            {
            }
            column(OriginalInvoiceCrDr_Caption; OriginalInvoiceCrDr_CaptionLbl)
            {
            }
            column(InvoiceValue_Caption; InvoiceValue_CaptionLbl)
            {
            }
            column(DifferentialCrDr_Caption; DifferentialCrDr_CaptionLbl)
            {
            }
            column(Differentialtax_Caption; Differentialtax_CaptionLbl)
            {
            }
            column(TotalTax_Caption; TotalTax_CaptionLbl)
            {
            }
            column(EligibilityITCCrDr_Caption; EligibilityITCCrDr_CaptionLbl)
            {
            }
            column(OriginalCrDr_Caption; OriginalCrDr_CaptionLbl)
            {
            }
            column(GST_Caption; GST_CaptionLbl)
            {
            }
            column(Rate_Caption; Rate_CaptionLbl)
            {
            }

            trigger OnAfterGetRecord();
            begin
                CLEAR(CGSTRate);
                CLEAR(SGSTRate);
                CLEAR(IGSTRate);
                CLEAR(CGSTTotal);
                CLEAR(SGSTTotal);
                CLEAR(IGSTTotal);
                CLEAR(CGSTAmount);
                CLEAR(SGSTAmount);
                CLEAR(IGSTAmount);

                IF Number = 1 THEN
                    CrDrRegisterHeaderVisibility := TRUE
                ELSE
                    CrDrRegisterHeaderVisibility := FALSE;
                CrDrRegisterVisibility := TRUE;

                IF Number = 1 THEN
                    PurchCrMemoHdr.FINDFIRST
                ELSE
                    PurchCrMemoHdr.NEXT;

                IsGSTApplicableCrDr := GSTManagement.IsGSTApplicable(PurchCrMemoHdr.Structure);
                IF VendorGRec.GET(PurchCrMemoHdr."Buy-from Vendor No.") THEN;

                PurchCrMemoLine.RESET;
                PurchCrMemoLine.SETRANGE("Document No.", PurchCrMemoHdr."No.");
                IF PurchCrMemoLine.FINDSET THEN
                    REPEAT
                        IF IsGSTApplicableCrDr THEN BEGIN
                            GSTComponent.RESET;
                            IF GSTComponent.FINDSET THEN
                                REPEAT
                                    DetailedGSTLedgerEntry.RESET;
                                    DetailedGSTLedgerEntry.SETCURRENTKEY("Transaction Type", "Document Type", "Document No.", "Document Line No.");
                                    DetailedGSTLedgerEntry.SETRANGE("Transaction Type", DetailedGSTLedgerEntry."Transaction Type"::Purchase);
                                    DetailedGSTLedgerEntry.SETRANGE("Document Type", DetailedGSTLedgerEntry."Document Type"::"Credit Memo");
                                    DetailedGSTLedgerEntry.SETRANGE("Document No.", PurchCrMemoLine."Document No.");
                                    DetailedGSTLedgerEntry.SETRANGE("Document Line No.", PurchCrMemoLine."Line No.");
                                    DetailedGSTLedgerEntry.SETRANGE("GST Component Code", GSTComponent.Code);
                                    IF DetailedGSTLedgerEntry.FINDSET THEN BEGIN
                                        REPEAT
                                            CASE DetailedGSTLedgerEntry."GST Component Code" OF
                                                'IGST':
                                                    BEGIN
                                                        IGSTRate := DetailedGSTLedgerEntry."GST %";
                                                        IGSTAmount := ABS(DetailedGSTLedgerEntry."GST Amount");
                                                        IGSTTotal += IGSTAmount;
                                                    END;
                                                'CGST':
                                                    BEGIN
                                                        CGSTRate := DetailedGSTLedgerEntry."GST %";
                                                        CGSTAmount := ABS(DetailedGSTLedgerEntry."GST Amount");
                                                        CGSTTotal += CGSTAmount;
                                                    END;
                                                'SGST':
                                                    BEGIN
                                                        SGSTRate := DetailedGSTLedgerEntry."GST %";
                                                        SGSTAmount := ABS(DetailedGSTLedgerEntry."GST Amount");
                                                        SGSTTotal += SGSTAmount;
                                                    END;
                                            END;
                                        UNTIL DetailedGSTLedgerEntry.NEXT = 0;
                                    END;
                                UNTIL GSTComponent.NEXT = 0;
                        END;
                    UNTIL PurchCrMemoLine.NEXT = 0;
            end;

            trigger OnPreDataItem();
            begin
                PurchCrMemoHdr.RESET;
                PurchCrMemoHdr.SETRANGE("Posting Date", FromDate, ToDate);
                PurchCrMemoHdr.SETRANGE("Location Code", LocationCode);
                //PurchCrMemoHdr.SETRANGE("GST Vendor Type",PurchCrMemoHdr."GST Vendor Type"::Registered);
                IF PurchCrMemoHdr.FINDFIRST THEN
                    CrDrRegisterVisibility := TRUE;
                SETRANGE("Cr.Dr".Number, 1, PurchCrMemoHdr.COUNT);
            end;
        }
        dataitem("Advance Paid"; "Integer")
        {
            DataItemTableView = SORTING(Number);
            column(AdvancePaid_Number; "Advance Paid".Number)
            {
            }
            column(AdvancePaidVisibility; AdvancePaidVisibility)
            {
            }
            column(AdvancePaidHeaderVisibility; AdvancePaidHeaderVisibility)
            {
            }
            column(StatementAdv_Caption; StatementAdv_CaptionLbl)
            {
            }
            column(TaxPaidAdv_Caption; TaxPaidAdv_CaptionLbl)
            {
            }
            column(FiguresAdv_Caption; FiguresAdv_CaptionLbl)
            {
            }
            column(Month_Caption; Month_CaptionLbl)
            {
            }
            column(Amount_Adv_Caption; Amount_CaptionLbl)
            {
            }
            column(Supply_Type_Caption; Supply_Type_CaptionLbl)
            {
            }
            column(Place_of_Supply_Adavance_Caption; Place_of_Supply_Adavance_CaptionLbl)
            {
            }
            column(Advance_Caption; Advance_CaptionLbl)
            {
            }
            column(GST_Rate_Adv_Caption; GST_Rate_Adv_CaptionLbl)
            {
            }
            column(OriginalDetails_Caption; OriginalDetails_CaptionLbl)
            {
            }
            column(IGST_Adv_Caption; IGST_Adv_CaptionLbl)
            {
            }
            column(CGST_Adv_Caption; CGST_Adv_CaptionLbl)
            {
            }
            column(SGST_Adv_UTGST_Caption; SGST_Adv_UTGST_CaptionLbl)
            {
            }
            column(CESS_Adv_Caption; CESS_Adv_CaptionLbl)
            {
            }
            column(G1_Adv_Caption; G1_Adv_CaptionLbl)
            {
            }
            column(G2_Adv_Caption; G2_Adv_CaptionLbl)
            {
            }
            column(G3_Adv_Caption; G3_Adv_CaptionLbl)
            {
            }
            column(G4_Adv_Caption; G4_Adv_CaptionLbl)
            {
            }
            column(G5_Adv_Caption; G5_Adv_CaptionLbl)
            {
            }
            column(G6_Adv_Caption; G6_Adv_CaptionLbl)
            {
            }
            column(G7_Adv_Caption; G7_Adv_CaptionLbl)
            {
            }
            column(G8_Adv_Caption; G8_Adv_CaptionLbl)
            {
            }
            column(G9_Adv_Caption; G9_Adv_CaptionLbl)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF Number = 1 THEN
                    AdvancePaidHeaderVisibility := TRUE
                ELSE
                    AdvancePaidHeaderVisibility := FALSE;
                AdvancePaidVisibility := TRUE;

                IF Number = 1 THEN
                    VendorLedgerEntry.FINDFIRST
                ELSE
                    VendorLedgerEntry.NEXT;
            end;

            trigger OnPreDataItem();
            begin
                VendorLedgerEntry.RESET;
                VendorLedgerEntry.SETRANGE("Posting Date", FromDate, ToDate);
                IF VendorLedgerEntry.FINDFIRST THEN
                    AdvancePaidVisibility := TRUE;
                SETRANGE("Advance Paid".Number, 1, VendorLedgerEntry.COUNT);
            end;
        }
        dataitem("Advance Adjusted"; "Integer")
        {
            DataItemTableView = SORTING(Number);
            column(AdvanceAdjusted_Number; "Advance Adjusted".Number)
            {
            }
            column(AdvanceAdjustedVisibility; AdvanceAdjustedVisibility)
            {
            }
            column(AdvanceAdjustedHeaderVisibility; AdvanceAdjustedHeaderVisibility)
            {
            }
            column(AdvanceAdj_Caption; AdvanceAdj_CaptionLbl)
            {
            }
            column(TaxPaidAdjusted_Caption; TaxPaidAdjusted_CaptionLbl)
            {
            }
            column(FiguresAdv_Adj_Caption; FiguresAdv_CaptionLbl)
            {
            }
            column(Supply_Type_Adj_Caption; Supply_Type_CaptionLbl)
            {
            }
            column(Place_of_Supply_Adavance_Adj_Caption; Place_of_Supply_Adavance_CaptionLbl)
            {
            }
            column(Advance_Adj_Caption; Advance_CaptionLbl)
            {
            }
            column(Amount_Adv_Adj_Caption; Amount_CaptionLbl)
            {
            }
            column(GST_Rate_Adv_Adj_Caption; GST_Rate_Adv_CaptionLbl)
            {
            }
            column(IGST_Adv_Adj_Caption; IGST_Adv_CaptionLbl)
            {
            }
            column(CGST_Adv_Adj_Caption; CGST_Adv_CaptionLbl)
            {
            }
            column(SGST_AdvAdj_Caption; SGST_Adv_UTGST_CaptionLbl)
            {
            }
            column(CESS_Adv_Adj_Caption; CESS_Adv_CaptionLbl)
            {
            }
            column(G1_Adv_Adj_Caption; G1_Adv_CaptionLbl)
            {
            }
            column(G2_Adv_Adj_Caption; G2_Adv_CaptionLbl)
            {
            }
            column(G3_Adv_Adj_Caption; G3_Adv_CaptionLbl)
            {
            }
            column(G4_Adv_Adj_Caption; G4_Adv_CaptionLbl)
            {
            }
            column(G5_Adv_Adj_Caption; G5_Adv_CaptionLbl)
            {
            }
            column(G6_Adv_Adj_Caption; G6_Adv_CaptionLbl)
            {
            }
            column(G7_Adv_Adj_Caption; G7_Adv_CaptionLbl)
            {
            }
            column(G8_Adv_Adj_Caption; G8_Adv_CaptionLbl)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF Number = 1 THEN
                    AdvanceAdjustedHeaderVisibility := TRUE
                ELSE
                    AdvanceAdjustedHeaderVisibility := FALSE;
                AdvanceAdjustedVisibility := TRUE;

                IF Number = 1 THEN
                    VendorLedgerEntry.FINDFIRST
                ELSE
                    VendorLedgerEntry.NEXT;
            end;

            trigger OnPreDataItem();
            begin
                VendorLedgerEntry.RESET;
                VendorLedgerEntry.SETRANGE("Posting Date", FromDate, ToDate);
                IF VendorLedgerEntry.FINDFIRST THEN
                    AdvanceAdjustedVisibility := TRUE;
                SETRANGE("Advance Adjusted".Number, 1, VendorLedgerEntry.COUNT);
            end;
        }
        dataitem("ITC reversal"; "Integer")
        {
            DataItemTableView = SORTING(Number);
            column(ITCreversal_Number; "ITC reversal".Number)
            {
            }
            column(ITCreversalHeaderVisibility; ITCreversalHeaderVisibility)
            {
            }
            column(ITCreversalVisibility; ITCreversalVisibility)
            {
            }
            column(InputITC_Caption; InputITC_CaptionLbl)
            {
            }
            column(DescriptionITC_Caption; DescriptionITC_CaptionLbl)
            {
            }
            column(TobeITC_Caption; TobeITC_CaptionLbl)
            {
            }
            column(Amount_ITC_Caption; Amount_CaptionLbl)
            {
            }
            column(IGST_ITC_Caption; IGST_Adv_CaptionLbl)
            {
            }
            column(CGST_ITC_Caption; CGST_Adv_CaptionLbl)
            {
            }
            column(SGST_ITC_Caption; SGST_Adv_UTGST_CaptionLbl)
            {
            }
            column(CESS_ITC_Caption; CESS_Adv_CaptionLbl)
            {
            }
            column(G1_ITC_Caption; G1_Adv_CaptionLbl)
            {
            }
            column(G2_ITC_Caption; G2_Adv_CaptionLbl)
            {
            }
            column(G3_ITC_Caption; G3_Adv_CaptionLbl)
            {
            }
            column(G4_ITC_Caption; G4_Adv_CaptionLbl)
            {
            }
            column(G5_ITC_Caption; G5_Adv_CaptionLbl)
            {
            }
            column(G6_ITC_Caption; G6_Adv_CaptionLbl)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF Number = 1 THEN
                    ITCreversalHeaderVisibility := TRUE
                ELSE
                    ITCreversalHeaderVisibility := FALSE;
                ITCreversalVisibility := TRUE;

                IF Number = 1 THEN
                    PurchInvHeaderB2B.FINDFIRST
                ELSE
                    PurchInvHeaderB2B.NEXT;
            end;

            trigger OnPreDataItem();
            begin
                PurchInvHeaderB2B.RESET;
                PurchInvHeaderB2B.SETRANGE("Posting Date", FromDate, ToDate);
                PurchInvHeaderB2B.SETRANGE("Location Code", LocationCode);
                IF PurchInvHeaderB2B.FINDFIRST THEN
                    ITCreversalVisibility := TRUE;
                SETRANGE("ITC reversal".Number, 1, PurchInvHeaderB2B.COUNT);
            end;
        }
        dataitem("Addition Reduction"; "Integer")
        {
            DataItemTableView = SORTING(Number);
            column(AdditionReduction_Number; "Addition Reduction".Number)
            {
            }
            column(AdditionReductionVisibility; AdditionReductionVisibility)
            {
            }
            column(AdditionReductionHeaderVisibility; AdditionReductionHeaderVisibility)
            {
            }
            column(Addition_Caption; Addition_CaptionLbl)
            {
            }
            column(DescriptionAddition_Caption; DescriptionAddition_CaptionLbl)
            {
            }
            column(Amount_Addition_Caption; Amount_CaptionLbl)
            {
            }
            column(IGST_Addition_Caption; IGST_Adv_CaptionLbl)
            {
            }
            column(CGST_Addition_Caption; CGST_Adv_CaptionLbl)
            {
            }
            column(SGST_Addition_Caption; SGST_Adv_UTGST_CaptionLbl)
            {
            }
            column(CESS_Addition_Caption; CESS_Adv_CaptionLbl)
            {
            }
            column(G1_Addition_Caption; G1_Adv_CaptionLbl)
            {
            }
            column(G2_Addition_Caption; G2_Adv_CaptionLbl)
            {
            }
            column(G3_Addition_Caption; G3_Adv_CaptionLbl)
            {
            }
            column(G4_Addition_Caption; G4_Adv_CaptionLbl)
            {
            }
            column(G5_Addition_Caption; G5_Adv_CaptionLbl)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF Number = 1 THEN
                    AdditionReductionHeaderVisibility := TRUE
                ELSE
                    AdditionReductionHeaderVisibility := FALSE;
                AdditionReductionVisibility := TRUE;
                IF Number = 1 THEN
                    PurchInvHeaderB2B.FINDFIRST
                ELSE
                    PurchInvHeaderB2B.NEXT;
            end;

            trigger OnPreDataItem();
            begin
                PurchInvHeaderB2B.RESET;
                PurchInvHeaderB2B.SETRANGE("Posting Date", FromDate, ToDate);
                PurchInvHeaderB2B.SETRANGE("Location Code", LocationCode);
                IF PurchInvHeaderB2B.FINDFIRST THEN
                    AdditionReductionVisibility := TRUE;
                SETRANGE("Addition Reduction".Number, 1, PurchInvHeaderB2B.COUNT);
            end;
        }
        dataitem("HSN Summary"; "Integer")
        {
            DataItemTableView = SORTING(Number);
            column(Number_HSNSummary; "HSN Summary".Number)
            {
            }
            column(PurchInvLine_GSTGroupType; PurchInvLine."GST Group Type")
            {
            }
            column(PurchInvLine_HSN_SAC_Code; PurchInvLine."HSN/SAC Code")
            {
            }
            column(PurchInvLine_Description; PurchInvLine.Description)
            {
            }
            column(PurchInvLine_Unit_of_Measure_Code; PurchInvLine."Unit of Measure Code")
            {
            }
            column(PurchInvLin_CESS_Amount; PurchInvLine."CESS Amount")
            {
            }
            column(SGSTAmount_HSN; SGSTAmount)
            {
            }
            column(CGSTAmount_HSN; CGSTAmount)
            {
            }
            column(IGSTAmount_HSN; IGSTAmount)
            {
            }
            column(IGSTTotal_HSN; IGSTTotal)
            {
            }
            column(CGSTTotal_HSN; CGSTTotal)
            {
            }
            column(SGSTTotal_HSN; SGSTTotal)
            {
            }
            column(HSNSummaryVisibility; HSNSummaryVisibility)
            {
            }
            column(HSNSummaryHeaderVisibility; HSNSummaryHeaderVisibility)
            {
            }
            column(HSNSumm_Caption; HSNSumm_CaptionLbl)
            {
            }
            column(Goods_Service_Caption; Goods_Service_CaptionLbl)
            {
            }
            column(HSN_SAC_Caption; HSN_SAC_CaptionLbl)
            {
            }
            column(Description_HSN_Caption; Description_HSN_CaptionLbl)
            {
            }
            column(UQC_Caption; UQC_CaptionLbl)
            {
            }
            column(Total_Quantity_Caption; Total_Quantity_CaptionLbl)
            {
            }
            column(Total_Value_Caption; Total_Value_CaptionLbl)
            {
            }
            column(Total_Taxable_Value_Caption; Total_Taxable_Value_CaptionLbl)
            {
            }
            column(IGST_HSN_Caption; IGST_CaptionLbl)
            {
            }
            column(CGST_HSN_Caption; CGST_CaptionLbl)
            {
            }
            column(SGST_UTGST_HSN_Caption; SGST_UTGST_CaptionLbl)
            {
            }
            column(CESS_HSN_Caption; CESS_CaptionLbl)
            {
            }
            column(Amount_HSN_Caption; Amount_CaptionLbl)
            {
            }
            column(C1_HSN_Caption; G1_CaptionLbl)
            {
            }
            column(C2_HSN_Caption; G2_CaptionLbl)
            {
            }
            column(C3_HSN_Caption; G3_CaptionLbl)
            {
            }
            column(C4_HSN_Caption; G4_CaptionLbl)
            {
            }
            column(C5_HSN_Caption; G5_CaptionLbl)
            {
            }
            column(C6_HSN_Caption; G6_CaptionLbl)
            {
            }
            column(C7_HSN_Caption; G7_CaptionLbl)
            {
            }
            column(C8_HSN_Caption; G8_CaptionLbl)
            {
            }
            column(C9_HSN_Caption; G9_CaptionLbl)
            {
            }
            column(C10_HSN_Caption; G10_CaptionLbl)
            {
            }
            column(C11_HSN_Caption; G11_CaptionLbl)
            {
            }
            column(C12_HSN_Caption; G12_CaptionLbl)
            {
            }
            column(C13_HSN_Caption; G13_CaptionLbl)
            {
            }
            column(Amount_HSNSummary_Caption; Amount_CaptionLbl)
            {
            }
            column(HSN_InternalDocNo_Caption; InternalDocNo_CaptionLbl)
            {
            }
            column(HSN_InternalDocDate_Caption; InternalDocDate_CaptionLbl)
            {
            }
            column(HSN_InternalDocNo; PurchInvLine."Document No.")
            {
            }
            column(HSN_InternalDocDate; PurchInvLine."Posting Date")
            {
            }
            column(HSNQuantity; PurchInvLine.Quantity)
            {
            }
            column(HSNTotalValue; PurchInvLine."Amount To Vendor")
            {
            }
            column(HSNTotalTaxableValue; PurchInvLine."GST Base Amount")
            {
            }
            column(HSNDescription; PurchInvLine.Description)
            {
            }
            column(UQC; PurchInvLine."Unit of Measure Code")
            {
            }
            column(HSNSAC; PurchInvLine."HSN/SAC Code")
            {
            }
            column(HSNCESS; PurchInvLine."CESS Amount")
            {
            }
            column(HSNGSTGroupType; PurchInvLine."GST Group Type")
            {
            }

            trigger OnAfterGetRecord();
            begin
                CLEAR(CGSTRate);
                CLEAR(SGSTRate);
                CLEAR(IGSTRate);
                CLEAR(CGSTAmount);
                CLEAR(SGSTAmount);
                CLEAR(IGSTAmount);
                CLEAR(CGSTTotal);
                CLEAR(SGSTTotal);
                CLEAR(IGSTTotal);

                IF Number = 1 THEN
                    HSNSummaryHeaderVisibility := TRUE
                ELSE
                    HSNSummaryHeaderVisibility := FALSE;
                HSNSummaryVisibility := TRUE;

                IF Number = 1 THEN
                    PurchInvLine.FINDFIRST
                ELSE
                    PurchInvLine.NEXT;

                IF IsGSTApplicable THEN BEGIN
                    GSTComponent.RESET;
                    GSTComponent.SETRANGE("GST Jurisdiction Type", PurchInvLine."GST Jurisdiction Type");
                    IF GSTComponent.FINDSET THEN
                        REPEAT
                            DetailedGSTLedgerEntry.RESET;
                            DetailedGSTLedgerEntry.SETCURRENTKEY("Transaction Type", "Document Type", "Document No.", "Document Line No.");
                            DetailedGSTLedgerEntry.SETRANGE("Transaction Type", DetailedGSTLedgerEntry."Transaction Type"::Purchase);
                            DetailedGSTLedgerEntry.SETRANGE("Document Type", DetailedGSTLedgerEntry."Document Type"::Invoice);
                            DetailedGSTLedgerEntry.SETRANGE("Document No.", PurchInvLine."Document No.");
                            DetailedGSTLedgerEntry.SETRANGE("Document Line No.", PurchInvLine."Line No.");
                            DetailedGSTLedgerEntry.SETRANGE("GST Component Code", GSTComponent.Code);
                            IF DetailedGSTLedgerEntry.FINDSET THEN BEGIN
                                REPEAT
                                    CASE DetailedGSTLedgerEntry."GST Component Code" OF
                                        'IGST':
                                            BEGIN
                                                IGSTRate := DetailedGSTLedgerEntry."GST %";
                                                IGSTAmount := ABS(DetailedGSTLedgerEntry."GST Amount");
                                                IGSTTotal += IGSTAmount;
                                            END;
                                        'CGST':
                                            BEGIN
                                                CGSTRate := DetailedGSTLedgerEntry."GST %";
                                                CGSTAmount := ABS(DetailedGSTLedgerEntry."GST Amount");
                                                CGSTTotal += CGSTAmount;
                                            END;
                                        'SGST':
                                            BEGIN
                                                SGSTRate := DetailedGSTLedgerEntry."GST %";
                                                SGSTAmount := ABS(DetailedGSTLedgerEntry."GST Amount");
                                                SGSTTotal += SGSTAmount;
                                            END;
                                    END;
                                UNTIL DetailedGSTLedgerEntry.NEXT = 0;
                            END;
                        UNTIL GSTComponent.NEXT = 0;
                END;
            end;

            trigger OnPreDataItem();
            begin
                PurchInvLine.RESET;
                PurchInvLine.SETRANGE("Posting Date", FromDate, ToDate);
                PurchInvLine.SETRANGE("Location Code", LocationCode);
                PurchInvLine.SETFILTER("HSN/SAC Code", '<>%1', '');
                IF PurchInvLine.FINDFIRST THEN
                    HSNSummaryVisibility := TRUE;
                SETRANGE("HSN Summary".Number, 1, PurchInvLine.COUNT);
            end;
        }
        dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
        {
            DataItemTableView = SORTING(No.) WHERE(GST Vendor Type=FILTER(Registered));
            PrintOnlyIfDetail = true;
            column(GSTINNo;DetailedGSTLedgerEntry."Buyer/Seller Reg. No.")
            {
            }
            column(No_PurchInvHeader;"Purch. Inv. Header"."Vendor Invoice No.")
            {
            }
            column(BuyfromVendorName_PurchInvHeader;"Buy-from Vendor Name")
            {
            }
            column(DocumentDate_PurchInvHeader;"Document Date")
            {
            }
            column(G1_Caption;G1_CaptionLbl)
            {
            }
            column(G2_Caption;G2_CaptionLbl)
            {
            }
            column(G3_Caption;G3_CaptionLbl)
            {
            }
            column(G4_Caption;G4_CaptionLbl)
            {
            }
            column(G5_Caption;G5_CaptionLbl)
            {
            }
            column(G6_Caption;G6_CaptionLbl)
            {
            }
            column(G7_Caption;G7_CaptionLbl)
            {
            }
            column(G8_Caption;G8_CaptionLbl)
            {
            }
            column(G9_Caption;G9_CaptionLbl)
            {
            }
            column(G10_Caption;G10_CaptionLbl)
            {
            }
            column(G11_Caption;G11_CaptionLbl)
            {
            }
            column(G12_Caption;G12_CaptionLbl)
            {
            }
            column(G13_Caption;G13_CaptionLbl)
            {
            }
            column(G14_Caption;G14_CaptionLbl)
            {
            }
            column(G15_Caption;G15_CaptionLbl)
            {
            }
            column(G16_Caption;G16_CaptionLbl)
            {
            }
            column(G17_Caption;G17_CaptionLbl)
            {
            }
            column(G18_Caption;G18_CaptionLbl)
            {
            }
            column(G19_Caption;G19_CaptionLbl)
            {
            }
            column(G20_Caption;G20_CaptionLbl)
            {
            }
            column(G21_Caption;G21_CaptionLbl)
            {
            }
            column(IftheSupply_Caption;IftheSupply_CaptionLbl)
            {
            }
            column(InwardSupplies_Caption;InwardSupplies_CaptionLbl)
            {
            }
            column(EligibilityITC_Caption;EligibilityITC_CaptionLbl)
            {
            }
            column(Notes_Caption;Notes_CaptionLbl)
            {
            }
            column(Taxable_Person_Caption;Taxable_Person_CaptionLbl)
            {
            }
            column(In_case_of_Caption;In_case_of_CaptionLbl)
            {
            }
            column(In_case_of_intra_Caption;In_case_of_intra_CaptionLbl)
            {
            }
            column(Taxable_outward_Caption;Taxable_outward_CaptionLbl)
            {
            }
            column(GSTIN_UID_Caption;GSTIN_UID_CaptionLbl)
            {
            }
            column(Party_Name_Caption;Party_Name_CaptionLbl)
            {
            }
            column(Invoice_Caption;Invoice_CaptionLbl)
            {
            }
            column(Number_Caption;Number_CaptionLbl)
            {
            }
            column(Date_Caption;Date_CaptionLbl)
            {
            }
            column(Value_Caption;InvoiceValuepurch_CaptionLbl)
            {
            }
            column(Taxable_Value_Caption;Taxable_Value_CaptionLbl)
            {
            }
            column(GST_Rate_Caption;GST_Rate_CaptionLbl)
            {
            }
            column(IGST_Caption;IGST_CaptionLbl)
            {
            }
            column(CGST_Caption;CGST_CaptionLbl)
            {
            }
            column(SGST_UTGST_Caption;SGST_UTGST_CaptionLbl)
            {
            }
            column(CESS_Caption;CESS_CaptionLbl)
            {
            }
            column(POS_only_if_Caption;PlaceofSupply_CaptionLbl)
            {
            }
            column(Reverse_Charge_Caption;Reverse_Charge_CaptionLbl)
            {
            }
            column(Indicate_supply_Caption;Indicate_supply_CaptionLbl)
            {
            }
            column(GSTIN_of_ecommerce_Caption;GSTIN_of_ecommerce_CaptionLbl)
            {
            }
            column(Original_Invoice_Caption;Original_Invoice_CaptionLbl)
            {
            }
            column(No_Caption;No_CaptionLbl)
            {
            }
            column(Amount_Caption;Amount_CaptionLbl)
            {
            }
            column(AmountITC_Caption;AmountITC_CaptionLbl)
            {
            }
            column(InvoiceValueTotal;InvoiceValueTotal)
            {
            }
            column(InternalDocNo_B2B_Caption;InternalDocNo_CaptionLbl)
            {
            }
            column(InternalDocDate_B2B_Caption;InternalDocDate_CaptionLbl)
            {
            }
            column(InternalDocNo_PurchInvHeader;"No.")
            {
            }
            column(InternalDocDate_PurchInvHeader;"Posting Date")
            {
            }
            column(B2BReverseCharge;DetailedGSTLedgerEntry."Reverse Charge")
            {
            }
            dataitem("Purch. Inv. Line";"Purch. Inv. Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = SORTING(Document No.,Line No.) WHERE(GST Group Code=FILTER(<>''));
                column(DocumentNo_PurchInvLine;"Document No.")
                {
                }
                column(GSTBaseAmount_PurchInvLine;"GST Base Amount")
                {
                }
                column(StateDescription;StateDescription)
                {
                }
                column(SGSTAmount;SGSTAmount)
                {
                }
                column(CGSTAmount;CGSTAmount)
                {
                }
                column(IGSTAmount;IGSTAmount)
                {
                }
                column(CGSTRate;CGSTRate)
                {
                }
                column(SGSTRate;SGSTRate)
                {
                }
                column(IGSTRate;IGSTRate)
                {
                }
                column(IGSTTotal;IGSTTotal)
                {
                }
                column(CGSTTotal;CGSTTotal)
                {
                }
                column(SGSTTotal;SGSTTotal)
                {
                }
                column(GSTPertg;GSTPertg)
                {
                }
                column(CESSAmount_PurchInvLine;"CESS Amount")
                {
                }
                column(GSTCredit_PurchInvLine;"GST Credit")
                {
                }
                column(IGSTEligibility;IGSTEligibility)
                {
                }
                column(CGSTEligibility;CGSTEligibility)
                {
                }
                column(SGSTEligibility;SGSTEligibility)
                {
                }

                trigger OnAfterGetRecord();
                begin
                    CLEAR(CGSTRate);
                    CLEAR(SGSTRate);
                    CLEAR(IGSTRate);
                    CLEAR(CGSTTotal);
                    CLEAR(SGSTTotal);
                    CLEAR(IGSTTotal);
                    CLEAR(CGSTAmount);
                    CLEAR(SGSTAmount);
                    CLEAR(IGSTAmount);
                    CLEAR(GSTPertg);
                    CLEAR(TaxableValueB2B);
                    CLEAR(StateDescription);
                    CLEAR(IGSTEligibility);
                    CLEAR(CGSTEligibility);
                    CLEAR(SGSTEligibility);
                    SETFILTER("GST Group Code",'<>%1','');

                    IF IsGSTApplicable  THEN BEGIN
                      GSTComponent.RESET;
                      GSTComponent.SETRANGE("GST Jurisdiction Type","Purch. Inv. Line"."GST Jurisdiction Type");
                      IF GSTComponent.FINDSET THEN
                        REPEAT
                          DetailedGSTLedgerEntry.RESET;
                          DetailedGSTLedgerEntry.SETCURRENTKEY("Transaction Type","Document Type","Document No.","Document Line No.");
                          DetailedGSTLedgerEntry.SETRANGE("Transaction Type",DetailedGSTLedgerEntry."Transaction Type"::Purchase);
                          DetailedGSTLedgerEntry.SETRANGE("Document Type",DetailedGSTLedgerEntry."Document Type"::Invoice);
                          DetailedGSTLedgerEntry.SETRANGE("Document No.","Purch. Inv. Line"."Document No.");
                          DetailedGSTLedgerEntry.SETRANGE("Document Line No.","Purch. Inv. Line"."Line No.");
                          DetailedGSTLedgerEntry.SETRANGE("Entry Type",DetailedGSTLedgerEntry."Entry Type"::"Initial Entry");
                          DetailedGSTLedgerEntry.SETRANGE("GST Component Code",GSTComponent.Code);
                          DetailedGSTLedgerEntry.SETRANGE("Reverse Charge",FALSE);
                          IF DetailedGSTLedgerEntry.FINDSET THEN BEGIN
                            REPEAT
                              CASE DetailedGSTLedgerEntry."GST Component Code" OF
                                'IGST':
                                  BEGIN
                                    IGSTRate := DetailedGSTLedgerEntry."GST %";
                                    IGSTAmount := ABS(DetailedGSTLedgerEntry."GST Amount");
                                    IGSTTotal += IGSTAmount;
                                  END;
                                'CGST':
                                  BEGIN
                                    CGSTRate := DetailedGSTLedgerEntry."GST %";
                                    CGSTAmount := ABS(DetailedGSTLedgerEntry."GST Amount");
                                    CGSTTotal += CGSTAmount;
                                  END;
                                'SGST':
                                  BEGIN
                                    SGSTRate := DetailedGSTLedgerEntry."GST %";
                                    SGSTAmount := ABS(DetailedGSTLedgerEntry."GST Amount");
                                    SGSTTotal += SGSTAmount;
                                  END;
                              END;
                            UNTIL DetailedGSTLedgerEntry.NEXT = 0;
                          END;
                        UNTIL GSTComponent.NEXT = 0;
                    END;

                    GSTPertg := IGSTRate + CGSTRate + SGSTRate;
                    IF LocationGRec.GET("Purch. Inv. Line"."Location Code") THEN;
                    StateGRec.RESET;
                    StateGRec.SETRANGE(Code,LocationGRec."State Code");
                    IF StateGRec.FINDFIRST THEN
                      StateDescription := StateGRec.Description;

                    //B2B1.0 171117 // For Gst Credit Non-Availment

                    //B2B1.0 110217
                    IF "GST Credit" = "Purch. Inv. Line"."GST Credit"::Availment THEN BEGIN
                      IGSTEligibility := IGSTAmount;
                      CGSTEligibility := CGSTAmount;
                      SGSTEligibility := SGSTAmount;
                    END ELSE IF "GST Credit" = "Purch. Inv. Line"."GST Credit"::"Non-Availment" THEN BEGIN
                      IGSTEligibility := 0;
                      CGSTEligibility := 0;
                      SGSTEligibility := 0;
                    END;
                    //B2B1.0 110217
                end;
            }

            trigger OnAfterGetRecord();
            begin
                CLEAR(InvoiceValueTotal);
                //B2B1.0>>241117
                PurchInvHeaderGRec.RESET;
                PurchInvHeaderGRec.SETRANGE("No.","No.");
                PurchInvHeaderGRec.SETRANGE("GST Vendor Type",PurchInvHeaderGRec."GST Vendor Type"::Registered);
                IF PurchInvHeaderGRec.FINDFIRST THEN BEGIN
                  DetailedGSTLedgerEntry.RESET;
                  DetailedGSTLedgerEntry.SETRANGE("Document No.",PurchInvHeaderGRec."No.");
                  DetailedGSTLedgerEntry.SETRANGE("GST Vendor Type",DetailedGSTLedgerEntry."GST Vendor Type"::Registered);
                  DetailedGSTLedgerEntry.SETRANGE("Reverse Charge",TRUE);
                  IF DetailedGSTLedgerEntry.FINDSET THEN
                    CurrReport.SKIP;
                END;
                //B2B1.0<<

                IsGSTApplicable := GSTManagement.IsGSTApplicable("Purch. Inv. Header".Structure);

                PurchInvLineInvValue.RESET;
                PurchInvLineInvValue.SETRANGE("Document No.","Purch. Inv. Header"."No.");
                PurchInvLineInvValue.SETFILTER("GST Group Code",'<>%1','');
                IF PurchInvLineInvValue.FINDSET THEN
                  REPEAT
                    InvoiceValueTotal += PurchInvLineInvValue."Amount To Vendor" + PurchInvLineInvValue."TDS Amount";
                  UNTIL PurchInvLineInvValue.NEXT = 0;
            end;

            trigger OnPreDataItem();
            begin
                Exp := 'CM';
                MonthGVar := Period;
                FromDate := DMY2DATE(1,MonthGVar,Year);
                ToDate := CALCDATE(Exp,FromDate);

                SETRANGE("Posting Date",FromDate,ToDate);
                SETRANGE("Location Code",LocationCode);
                SETRANGE("GST Vendor Type","Purch. Inv. Header"."GST Vendor Type"::Registered);
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
                    CaptionML = ENU='Options',
                                ENN='Options';
                    field(GSTIN;GSTIN)
                    {
                        CaptionML = ENU='GSTIN of the location',
                                    ENN='GSTIN of the location';
                        TableRelation = "GST Registration Nos.".Code;

                        trigger OnValidate();
                        begin
                            Location.SETRANGE("GST Registration No.",GSTIN);
                            IF Location.FINDFIRST THEN BEGIN
                              TaxablePerson := Location.Name;
                              LocationCode := Location.Code;
                             END
                            ELSE
                              ERROR(LocationErr);
                        end;
                    }
                    field(TaxablePerson;TaxablePerson)
                    {
                        CaptionML = ENU='Name of the Taxable Person',
                                    ENN='Name of the Taxable Person';
                        TableRelation = Location.Name;
                    }
                    field(Period;Period)
                    {
                        CaptionML = ENU='Period',
                                    ENN='Period';
                    }
                    field(Date;Date)
                    {
                        CaptionML = ENU='Date',
                                    ENN='Date';

                        trigger OnValidate();
                        begin
                            Year := DATE2DMY(Date,3);
                        end;
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
        Location : Record Location;
        GSTIN : Code[20];
        ItemNo : array [4] of Code[20];
        HSNCode : array [50] of Code[10];
        TaxablePerson : Text;
        AggregateTurnover : Decimal;
        PersonName : Text;
        Place : Text;
        Period : Option " ",Jan,Feb,March,Apr,May,June,July,Agu,Sept,Oct,Nov,Dec;
        Year : Integer;
        PostingDate : array [50] of Date;
        Date : Date;
        LocationErr : Label 'LocationErr';
        GSTIN_CaptionLbl : Label 'GSTIN:';
        NameofTax_CaptionLbl : Label 'Name of Taxable Person';
        Period_CaptionLbl : Label 'Period';
        INSTRUCTIONS_CaptionLbl : Label 'INSTRUCTIONS';
        Ex_CaptionLbl : Label 'Ex:';
        Avoid_Cut_CaptionLbl : Label '1: Avoid Cut options in any of the work Sheets';
        To_Enter_CaptionLbl : Label '2: To Enter Invoice Date Enter in DD/MMM/YYYY format (02/Jan/2017) Do not Cut or copy and Paste';
        While_Pasting_CaptionLbl : Label '3: While Pasting data from other excel File, use only Paste Special / Values Option';
        Before_any_CaptionLbl : Label '4: Before any operation on excel file make sure you are not in Excel Edit mode';
        Avoid_using_CaptionLbl : Label '5: Avoid using enter character ( Alt + Enter) in any cell';
        If_mandatory_CaptionLbl : Label '6: If mandatory fields are not entered, then the record will not be Imported';
        Option_Field_CaptionLbl : Label 'Option Field';
        Mandatory_Field_CaptionLbl : Label 'Mandatory Field';
        Notes_CaptionLbl : Label 'Notes:';
        Taxable_Person_CaptionLbl : Label 'Taxable Person has the option to furnish the details of nil rate and exempted supplies in this Table';
        In_case_of_CaptionLbl : Label 'In case of inter-state supplies, only IGST would be filled';
        In_case_of_intra_CaptionLbl : Label 'In case of intra-state supplies, CGST & SGST would be filled.';
        Taxable_outward_CaptionLbl : Label '4. Taxable outward supplies made to registered persons (including UIN-holders)';
        GSTIN_UID_CaptionLbl : Label 'GSTIN';
        Party_Name_CaptionLbl : Label 'Party Name';
        Invoice_CaptionLbl : Label 'Invoice';
        Number_CaptionLbl : Label 'No.';
        Date_CaptionLbl : Label 'Date     (dd/mm/yyyy)';
        Value_CaptionLbl : Label 'Value';
        Taxable_Value_CaptionLbl : Label 'Taxable Value';
        GST_Rate_CaptionLbl : Label 'GST Rate';
        IGST_CaptionLbl : Label 'IGST';
        CGST_CaptionLbl : Label 'CGST';
        SGST_UTGST_CaptionLbl : Label 'SGST';
        CESS_CaptionLbl : Label 'CESS';
        POS_only_if_CaptionLbl : Label 'POS only if different from the location of recipient';
        Reverse_Charge_CaptionLbl : Label 'Reverse Charge';
        Indicate_supply_CaptionLbl : Label 'Indicate if supply attracts reverse charge';
        GSTIN_of_ecommerce_CaptionLbl : Label 'GSTIN of ecommerce operator (if applicable)';
        Original_Invoice_CaptionLbl : Label 'Original Invoice(If Amended)';
        One_CaptionLbl : Label '1';
        Two_CaptionLbl : Label '2';
        Three_CaptionLbl : Label '3';
        No_CaptionLbl : Label 'No.';
        Amount_CaptionLbl : Label 'Amount';
        G1_CaptionLbl : Label '(1)';
        G2_CaptionLbl : Label '(2)';
        G3_CaptionLbl : Label '(3)';
        G4_CaptionLbl : Label '(4)';
        G5_CaptionLbl : Label '(5)';
        G6_CaptionLbl : Label '(6)';
        G7_CaptionLbl : Label '(7)';
        G8_CaptionLbl : Label '(8)';
        G9_CaptionLbl : Label '(9)';
        G10_CaptionLbl : Label '(10)';
        G11_CaptionLbl : Label '(11)';
        G12_CaptionLbl : Label '(12)';
        G13_CaptionLbl : Label '(13)';
        G14_CaptionLbl : Label '(14)';
        G15_CaptionLbl : Label '(15)';
        G16_CaptionLbl : Label '(16)';
        GeneralVisibility : Boolean;
        PurchInvHeaderB2B : Record "Purch. Inv. Header";
        B2BVisibility : Boolean;
        GSTComponent : Record "GST Component";
        GSTManagement : Codeunit "GST Management";
        DetailedGSTLedgerEntry : Record "Detailed GST Ledger Entry";
        IsGSTApplicable : Boolean;
        VendorGRec : Record Vendor;
        CGSTRate : Decimal;
        CGSTAmount : Decimal;
        SGSTRate : Decimal;
        SGSTAmount : Decimal;
        IGSTRate : Decimal;
        IGSTAmount : Decimal;
        SGSTTotal : Decimal;
        CGSTTotal : Decimal;
        IGSTTotal : Decimal;
        G17_CaptionLbl : Label '(17)';
        G18_CaptionLbl : Label '(18)';
        G19_CaptionLbl : Label '(19)';
        G20_CaptionLbl : Label '(20)';
        Export_Type_CaptionLbl : Label 'Export Type';
        Supplies_Exported_CaptionLbl : Label '5.Supplies Exported (including deemed exports)';
        Port_Code_CaptionLbl : Label 'Port Code';
        Shipping_Bill_CaptionLbl : Label 'Shipping Bill/Bill Of Export';
        GSTIN_Export_CaptionLbl : Label 'GSTIN';
        ExportVisibility : Boolean;
        FromDate : Date;
        ToDate : Date;
        MonthGVar : Integer;
        Exp : Text;
        B2BHeaderVisibility : Boolean;
        ExportHeaderVisibility : Boolean;
        NilRatedHeaderVisibility : Boolean;
        Nilrated_Exempted_CaptionLbl : Label '8. Nil rated, Exempted and Non GST outward supplies*';
        figures_in_Rs_CaptionLbl : Label '(figures in Rs)';
        Description_CaptionLbl : Label 'Description';
        Nil_Rated_Amount_CaptionLbl : Label 'Nil Rated (Amount)';
        Exempted_Amount_CaptionLbl : Label 'Exempted (Amount)';
        NonGSTsupplies_CaptionLbl : Label 'Non GST supplies (Amount)';
        Interstate_registered_CaptionLbl : Label 'Interstate supplies to registered person';
        Intrastate_registered_CaptionLbl : Label 'Intrastate supplies to registered person';
        Interstate_unregistered_CaptionLbl : Label 'Interstate supplies to unregistered person';
        Intrastate_unregistered_CaptionLbl : Label 'Intrastate supplies to unregistered person';
        NilRatedVisibility : Boolean;
        Note_CaptionLbl : Label 'Note:';
        Information_about_CaptionLbl : Label 'Information about Credit Note / Debit Note to be submitted only if issued as a supplier.';
        Details_of_CaptionLbl : Label '9B. Details of Credit/Debit Notes issued to registered taxpayers';
        Typeofnote_CaptionLbl : Label 'Type of note (Debit/Credit)';
        Credit_Note_CaptionLbl : Label 'Credit Note/Debit Note';
        Reason_CaptionLbl : Label 'Reason for Issuing Note';
        PreGST_CaptionLbl : Label 'Pre GST Regime Dr./ Cr. Notes';
        PlaceofSupply_CaptionLbl : Label 'Place of Supply';
        Supplier_InvoiceValue_CaptionLbl : Label 'Supplier InvoiceValue';
        TaxAmount_CaptionLbl : Label 'Tax Amount';
        Original_Credit_CaptionLbl : Label 'Original Credit/Debit Note(If Amended)';
        C17_CaptionLbl : Label '(17)';
        C18_CaptionLbl : Label '(18)';
        C19_CaptionLbl : Label '(19)';
        CrDrRegisterVisibility : Boolean;
        CrDrRegisterHeaderVisibility : Boolean;
        DetailsofUnReg_CaptionLbl : Label '9D. Details of Credit/Debit Notes issued to Unregistered taxpayers';
        Type_CaptionLbl : Label 'Type';
        HSN_wise_CaptionLbl : Label '12. HSN-wise summary of outward supplies';
        Goods_Service_CaptionLbl : Label 'Goods or Service';
        HSN_SAC_CaptionLbl : Label 'HSN/ SAC';
        Description_HSN_CaptionLbl : Label 'Description';
        UQC_CaptionLbl : Label 'UQC (Unit of Measure)';
        Total_Quantity_CaptionLbl : Label 'Total Quantity';
        Total_Value_CaptionLbl : Label 'Total Value';
        Total_Taxable_Value_CaptionLbl : Label 'Taxable Value';
        Documents_issued_CaptionLbl : Label '13.Documents issued during the tax period';
        Document_No_CaptionLbl : Label 'Document  No.';
        Nature_of_Document_CaptionLbl : Label 'Nature of Document';
        Invoice_No_CaptionLbl : Label 'Invoice No.';
        From_CaptionLbl : Label 'From';
        To_CaptionLbl : Label 'To';
        Total_Invoice_No_CaptionLbl : Label 'Total Invoice No.';
        cancelled_Invoices_Document_CaptionLbl : Label 'cancelled Invoices';
        CrDrUnRegisterVisibility : Boolean;
        CrDrUnRegisterHeaderVisibility : Boolean;
        Original_Invoice_CrDr_CaptionLbl : Label 'Original Invoice';
        HSNSummaryVisibility : Boolean;
        HSNSummaryHeaderVisibility : Boolean;
        DocumentIssuedVisibility : Boolean;
        DocumentIssuedHeaderVisibility : Boolean;
        NetInvoices_CaptionLbl : Label 'Net Invoices issued';
        PurchCrMemoHdr : Record "Purch. Cr. Memo Hdr.";
        PurchCrMemoLine : Record "Purch. Cr. Memo Line";
        PurchInvLine : Record "Purch. Inv. Line";
        PurchInvHeaderExport : Record "Purch. Inv. Header";
        PurchInvHeaderHSN : Record "Purch. Inv. Header";
        PurchCrMemoCrDrUnreg : Record "Purch. Cr. Memo Hdr.";
        B2BFooterVisibility : Boolean;
        CGSTExpRate : Decimal;
        CGSTExpAmount : Decimal;
        SGSTExpRate : Decimal;
        SGSTExpAmount : Decimal;
        IGSTExpRate : Decimal;
        IGSTExpAmount : Decimal;
        SGSTExpTotal : Decimal;
        CGSTExpTotal : Decimal;
        IGSTExpTotal : Decimal;
        IsGSTApplicableExp : Boolean;
        VendorExpGRec : Record Vendor;
        ExportTypeGVar : Text;
        GSTPertg : Integer;
        IsGSTApplicableCrDr : Boolean;
        GSTEcommOperator : Code[15];
        PurchCrMemoHdrUnReg : Record "Purch. Cr. Memo Hdr.";
        TaxableValueB2B : Decimal;
        GeneralDate : Date;
        IftheSupply_CaptionLbl : Label 'If the supply is received in more than one lot, the invoice information should be reported in the return period in which the last lot is received and recorded in the books of accounts.';
        InwardSupplies_CaptionLbl : Label '3.Inward supplies received from a registered person other than the supplies attracting reverse charge';
        EligibilityITC_CaptionLbl : Label 'Eligibility for ITC';
        AmountITC_CaptionLbl : Label 'Amount of ITC available';
        Category_CaptionLbl : Label 'Category';
        IftheSupplyReverse_CaptionLbl : Label 'If the supply is received in more than one lot, the invoice information should be reported in the return period in which the last lot is received and recorded in the books of accounts.';
        InwardsuppliesRev_CaptionLbl : Label '4. Inward supplies on which tax is to be paid on reverse charge.';
        ReverseChargeHeaderVisibility : Boolean;
        ReverseChargeVisibility : Boolean;
        IftheSupplyImport_CaptionLbl : Label 'If the supply is received in more than one lot, the invoice information should be reported in the return period in which the last lot is received and recorded in the books of accounts.';
        InputsImport_CaptionLbl : Label '5. Inputs/Capital goods received from Overseas or from SEZ units on a Bill of Entry';
        GSTIN_Import_CaptionLbl : Label 'GSTIN/Name of unregistered';
        ImportGoodsHeaderVisibility : Boolean;
        ImportGoodsVisibility : Boolean;
        DetailsCrDr_CaptionLbl : Label '7. Details of Credit/Debit Notes';
        NoCrDr_CaptionLbl : Label 'No.';
        OriginalInvoiceCrDr_CaptionLbl : Label 'Original Invoice';
        InvoiceValue_CaptionLbl : Label 'Invoice Value';
        DifferentialCrDr_CaptionLbl : Label 'Differential Value (Plus or Minus)';
        Differentialtax_CaptionLbl : Label 'Differential tax';
        TotalTax_CaptionLbl : Label 'Total Tax available as ITC';
        EligibilityITCCrDr_CaptionLbl : Label 'Eligibility of ITC';
        OriginalCrDr_CaptionLbl : Label 'Original Debit Note/ credit note';
        Cr21_CaptionLbl : Label '(21)';
        Cr22_CaptionLbl : Label '(22)';
        Cr23_CaptionLbl : Label '(23)';
        Cr24_CaptionLbl : Label '(24)';
        GST_CaptionLbl : Label 'GST';
        Rate_CaptionLbl : Label 'Rate';
        SuppliesNilRate_CaptionLbl : Label '7. Supplies received from composition taxable person and other exempt/Nil rated/Non GST supplies received';
        FiguresNilrated_CaptionLbl : Label '(figures in Rs)';
        SupplyType_CaptionLbl : Label 'Supply Type';
        Compounding_CaptionLbl : Label 'Compounding Taxable person(Applicable only for Intra-State)';
        AnyExempt_CaptionLbl : Label 'Any exempt supply not included in Table 4 above';
        AnyNilRated_CaptionLbl : Label 'Any nil rated supply not included in B2B table';
        NonGSTSupply_CaptionLbl : Label 'Non GST Supply';
        PurchInvHeaderNilRated : Record "Purch. Inv. Header";
        StatementAdv_CaptionLbl : Label '10. Statement of Advances paid on account of receipt of supply';
        TaxPaidAdv_CaptionLbl : Label 'TAX Paid on receipt of advance/on account of time of supply';
        FiguresAdv_CaptionLbl : Label '(Figures in Rs)';
        Month_CaptionLbl : Label 'Month';
        Supply_Type_CaptionLbl : Label 'Supply Type';
        Place_of_Supply_Adavance_CaptionLbl : Label 'Place of Supply';
        Advance_CaptionLbl : Label 'Advance to be adjusted';
        GST_Rate_Adv_CaptionLbl : Label 'GST Rate';
        IGST_Adv_CaptionLbl : Label 'IGST';
        CGST_Adv_CaptionLbl : Label 'CGST';
        SGST_Adv_UTGST_CaptionLbl : Label 'SGST';
        CESS_Adv_CaptionLbl : Label 'CESS';
        OriginalDetails_CaptionLbl : Label 'Original Details(If Amended)';
        G1_Adv_CaptionLbl : Label '(1)';
        G2_Adv_CaptionLbl : Label '(2)';
        G3_Adv_CaptionLbl : Label '(3)';
        G4_Adv_CaptionLbl : Label '(4)';
        G5_Adv_CaptionLbl : Label '(5)';
        G6_Adv_CaptionLbl : Label '(6)';
        G7_Adv_CaptionLbl : Label '(7)';
        G8_Adv_CaptionLbl : Label '(8)';
        G9_Adv_CaptionLbl : Label '(9)';
        AdvancePaidHeaderVisibility : Boolean;
        AdvancePaidVisibility : Boolean;
        VendorLedgerEntry : Record "Vendor Ledger Entry";
        AdvanceAdj_CaptionLbl : Label '10.Advance amount on which tax was paid in earlier period but invoice has been received in the current period';
        TaxPaidAdjusted_CaptionLbl : Label 'TAX Paid on receipt of advance/on account of time of supply';
        AdvanceAdjustedHeaderVisibility : Boolean;
        AdvanceAdjustedVisibility : Boolean;
        InputITC_CaptionLbl : Label '11. Input Tax Credit Reversal / Reclaim';
        DescriptionITC_CaptionLbl : Label 'Description for reversal of ITC';
        TobeITC_CaptionLbl : Label 'To be Added or Reduced(only in case of Others)';
        Addition_CaptionLbl : Label '12. Addition and reduction of amount in output tax for mismatch and other reasons';
        DescriptionAddition_CaptionLbl : Label 'Description';
        HSNSumm_CaptionLbl : Label '"13. HSN summary of inward supplies "';
        ITCreversalHeaderVisibility : Boolean;
        ITCreversalVisibility : Boolean;
        AdditionReductionHeaderVisibility : Boolean;
        AdditionReductionVisibility : Boolean;
        LocationGRec : Record Location;
        StateGRec : Record State;
        StateDescription : Text[50];
        VendorReverseGRec : Record Vendor;
        LocationCode : Code[10];
        NilRatedBaseAmount : Decimal;
        ValueTdsAmount : Decimal;
        InvoiceValuepurch_CaptionLbl : Label 'Invoice Value';
        PurchInvLineInvValue : Record "Purch. Inv. Line";
        InvoiceValueTotal : Decimal;
        Bill_of_Entry_No_CaptionLbl : Label 'Bill of Entry No.';
        Bill_of_Entry_Date_CaptionLbl : Label 'Bill of Entry Date';
        Bill_of_Entry_Value_CaptionLbl : Label 'Bill of Entry Value';
        InternalDocNo_CaptionLbl : Label 'Internal Document No.';
        InternalDocDate_CaptionLbl : Label 'Internal Document Date';
        G21_CaptionLbl : Label '(21)';
        G22_CaptionLbl : Label '(22)';
        IGSTEligibility : Decimal;
        CGSTEligibility : Decimal;
        SGSTEligibility : Decimal;
        DetailedGSTLedEntryGRec : Record "Detailed GST Ledger Entry";
        ReverseChargeEmpty : Boolean;
        PurchInvHeaderGRec : Record "Purch. Inv. Header";
        ReverseChargeFooter : Boolean;
        ReverseTaxbleValue : Decimal;
        ReverseIGST : Decimal;
        ReverseCGST : Decimal;
        ReverseSGST : Decimal;
        ReverseIGSTITC : Decimal;
        ReverseCGSTITC : Decimal;
        ReverseSGSTITC : Decimal;
}

