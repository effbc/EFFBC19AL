report 33000021 "TDS - Form 16"
{
    // version NEOGYNPAY13.70.00.06

    DefaultLayout = RDLC;
    RDLCLayout = './TDS - Form 16.rdlc';

    dataset
    {
        dataitem("Pay Year";"Pay Year")
        {
            DataItemTableView = SORTING(ID);
        }
        dataitem(Employee;Employee)
        {
            RequestFilterFields = "No.","Job Title/Grade","Department Code";
            column(NAME;NAME)
            {
            }
            column(Employee__PAN_No_;"PAN No")
            {
            }
            column(STDATE;STDATE)
            {
            }
            column(ENDDATE;ENDDATE)
            {
            }
            column(COMPANYNAME;COMPANYNAME)
            {
            }
            column(CompanyAdd1;CompanyAdd1)
            {
            }
            column(undersection10;undersection10)
            {
            }
            column(Balance3;Balance3)
            {
            }
            column(SDAmt;SDAmt)
            {
            }
            column(EntAllowanceAmt;EntAllowanceAmt)
            {
            }
            column(TaxEmpAmt;TaxEmpAmt)
            {
            }
            column(Totalof4;Totalof4)
            {
            }
            column(IncomeCharges;IncomeCharges)
            {
            }
            column(AnyOtherIncome;AnyOtherIncome)
            {
            }
            column(GrossTotalof6to7;GrossTotalof6to7)
            {
            }
            column(AmountUnder10_1__1_;AmountUnder10[1][1])
            {
            }
            column(AmountUnder10_2__1_;AmountUnder10[2][1])
            {
            }
            column(AmountUnder10_3__1_;AmountUnder10[3][1])
            {
            }
            column(AmountUnder10_4__1_;AmountUnder10[4][1])
            {
            }
            column(AmountUnder10_5__1_;AmountUnder10[5][1])
            {
            }
            column(AmountUnder10_9__1_;AmountUnder10[9][1])
            {
            }
            column(AmountUnder10_8__1_;AmountUnder10[8][1])
            {
            }
            column(AmountUnder10_7__1_;AmountUnder10[7][1])
            {
            }
            column(AmountUnder10_6__1_;AmountUnder10[6][1])
            {
            }
            column(AmountUnder10_9__2_;AmountUnder10[9][2])
            {
            }
            column(AmountUnder10_8__2_;AmountUnder10[8][2])
            {
            }
            column(AmountUnder10_7__2_;AmountUnder10[7][2])
            {
            }
            column(AmountUnder10_6__2_;AmountUnder10[6][2])
            {
            }
            column(AmountUnder10_5__2_;AmountUnder10[5][2])
            {
            }
            column(AmountUnder10_4__2_;AmountUnder10[4][2])
            {
            }
            column(AmountUnder10_3__2_;AmountUnder10[3][2])
            {
            }
            column(AmountUnder10_2__2_;AmountUnder10[2][2])
            {
            }
            column(AmountUnder10_1__2_;AmountUnder10[1][2])
            {
            }
            column(AmountUnder10_9__3_;AmountUnder10[9][3])
            {
            }
            column(AmountUnder10_8__3_;AmountUnder10[8][3])
            {
            }
            column(AmountUnder10_7__3_;AmountUnder10[7][3])
            {
            }
            column(AmountUnder10_6__3_;AmountUnder10[6][3])
            {
            }
            column(AmountUnder10_5__3_;AmountUnder10[5][3])
            {
            }
            column(AmountUnder10_4__3_;AmountUnder10[4][3])
            {
            }
            column(AmountUnder10_3__3_;AmountUnder10[3][3])
            {
            }
            column(AmountUnder10_2__3_;AmountUnder10[2][3])
            {
            }
            column(AmountUnder10_1__3_;AmountUnder10[1][3])
            {
            }
            column(TotalofVIA;TotalofVIA)
            {
            }
            column(AmountUnder11;AmountUnder11)
            {
            }
            column(AmountUnder13a_1__1_;AmountUnder13a[1][1])
            {
            }
            column(AmountUnder13a_2__1_;AmountUnder13a[2][1])
            {
            }
            column(AmountUnder13a_3__1_;AmountUnder13a[3][1])
            {
            }
            column(AmountUnder13a_6__1_;AmountUnder13a[6][1])
            {
            }
            column(AmountUnder13a_4__1_;AmountUnder13a[4][1])
            {
            }
            column(AmountUnder13a_5__1_;AmountUnder13a[5][1])
            {
            }
            column(AmountUnder13a_7__1_;AmountUnder13a[7][1])
            {
            }
            column(AmountUnder13a_8__1_;AmountUnder13a[8][1])
            {
            }
            column(AmountUnder13a_1__2_;AmountUnder13a[1][2])
            {
            }
            column(AmountUnder13a_2__2_;AmountUnder13a[2][2])
            {
            }
            column(AmountUnder13a_3__2_;AmountUnder13a[3][2])
            {
            }
            column(AmountUnder13a_6__2_;AmountUnder13a[6][2])
            {
            }
            column(AmountUnder13a_4__2_;AmountUnder13a[4][2])
            {
            }
            column(AmountUnder13a_5__2_;AmountUnder13a[5][2])
            {
            }
            column(AmountUnder13a_7__2_;AmountUnder13a[7][2])
            {
            }
            column(AmountUnder13a_8__2_;AmountUnder13a[8][2])
            {
            }
            column(AmountUnder12;AmountUnder12)
            {
            }
            column(PeriodStartDate;PeriodStartDate)
            {
            }
            column(PeriodEndDate;PeriodEndDate)
            {
            }
            column(CompPan;CompPan)
            {
            }
            column(CompTAN;CompTAN)
            {
            }
            column(AmountUnder1a;AmountUnder1a)
            {
            }
            column(AmountUnder1b;AmountUnder1b)
            {
            }
            column(AmountUnder1c;AmountUnder1c)
            {
            }
            column(AmountUnder1d;AmountUnder1d)
            {
            }
            column(CompanyPost;CompanyPost)
            {
            }
            column(RebateUnderSec89;RebateUnderSec89)
            {
            }
            column(AmountUnder14;AmountUnder14)
            {
            }
            column(AmountUnder15;AmountUnder15)
            {
            }
            column(AmountUnder16;AmountUnder16)
            {
            }
            column(AmountUnder17;AmountUnder17)
            {
            }
            column(Totalof13aGross;Totalof13aGross)
            {
            }
            column(AmountUnder13a_12__1_;AmountUnder13a[12][1])
            {
            }
            column(AmountUnder13a_10__1_;AmountUnder13a[10][1])
            {
            }
            column(AmountUnder13a_11__1_;AmountUnder13a[11][1])
            {
            }
            column(AmountUnder13a_9__1_;AmountUnder13a[9][1])
            {
            }
            column(Totalof13aQual;Totalof13aQual)
            {
            }
            column(AmountUnder13a_9__2_;AmountUnder13a[9][2])
            {
            }
            column(AmountUnder13a_10__2_;AmountUnder13a[10][2])
            {
            }
            column(AmountUnder13a_11__2_;AmountUnder13a[11][2])
            {
            }
            column(AmountUnder13a_12__2_;AmountUnder13a[12][2])
            {
            }
            column(RebateUnder13;RebateUnder13)
            {
            }
            column(PayTaxPolicy_Sec88BMaxAmountupto;PayTaxPolicy.Sec88BMaxAmountupto)
            {
            }
            column(PayTaxPolicy_Sec88CMaxAmountupto;PayTaxPolicy.Sec88CMaxAmountupto)
            {
            }
            column(PayTaxPolicy_Sec88BMaxAmountupto___PayTaxPolicy_Sec88CMaxAmountupto;PayTaxPolicy.Sec88BMaxAmountupto + PayTaxPolicy.Sec88CMaxAmountupto)
            {
            }
            column(Value88B;Value88B)
            {
            }
            column(Value88C;Value88C)
            {
            }
            column(Value88B_Control294;Value88B)
            {
            }
            column(Value88C_Control295;Value88C)
            {
            }
            column(Value88B___Value88C;Value88B + Value88C)
            {
            }
            column(Value88B___Value88C_Control297;Value88B + Value88C)
            {
            }
            column(Certificate_under_Section_203_of_the_Income_tax_Act__1961Caption;Certificate_under_Section_203_of_the_Income_tax_Act__1961CaptionLbl)
            {
            }
            column(for_tax_deducted_at_source_from_income_chargableCaption;for_tax_deducted_at_source_from_income_chargableCaptionLbl)
            {
            }
            column(under_the_head__Salaries_Caption;under_the_head__Salaries_CaptionLbl)
            {
            }
            column(FORM_NO__16Caption;FORM_NO__16CaptionLbl)
            {
            }
            column(See_rule_31_1__a__Caption;See_rule_31_1__a__CaptionLbl)
            {
            }
            column(Name_and_address_of_the_EmployerCaption;Name_and_address_of_the_EmployerCaptionLbl)
            {
            }
            column(PAN_GIR_NO_Caption;PAN_GIR_NO_CaptionLbl)
            {
            }
            column(TANCaption;TANCaptionLbl)
            {
            }
            column(Name_and_Designation_of_the_employeeCaption;Name_and_Designation_of_the_employeeCaptionLbl)
            {
            }
            column(PAN_GIR_No_Caption_Control27;PAN_GIR_No_Caption_Control27Lbl)
            {
            }
            column(TDS_Circle_where_Annual_Return_Statement_underCaption;TDS_Circle_where_Annual_Return_Statement_underCaptionLbl)
            {
            }
            column(section_206_is_to_be_filedCaption;section_206_is_to_be_filedCaptionLbl)
            {
            }
            column(PeriodCaption;PeriodCaptionLbl)
            {
            }
            column(FromCaption;FromCaptionLbl)
            {
            }
            column(ToCaption;ToCaptionLbl)
            {
            }
            column(Assessment_YearCaption;Assessment_YearCaptionLbl)
            {
            }
            column(DETAILS_OF_SALARY_PAID_AND_ANY_OTHER_INCOME_AND_TAX_DEDUCTEDCaption;DETAILS_OF_SALARY_PAID_AND_ANY_OTHER_INCOME_AND_TAX_DEDUCTEDCaptionLbl)
            {
            }
            column(V2__Less___Allowance_to_the_extent_exempt_under_section_10Caption;V2__Less___Allowance_to_the_extent_exempt_under_section_10CaptionLbl)
            {
            }
            column(V3__Balance_1_2_Caption;V3__Balance_1_2_CaptionLbl)
            {
            }
            column(V4__Deductions__Caption;V4__Deductions__CaptionLbl)
            {
            }
            column(a__Standard_deductionCaption;a__Standard_deductionCaptionLbl)
            {
            }
            column(b__Entertainment_allowanceCaption;b__Entertainment_allowanceCaptionLbl)
            {
            }
            column(c__Tax_on_EmploymentCaption;c__Tax_on_EmploymentCaptionLbl)
            {
            }
            column(V5__Aggregate_of_4_a__to__c_Caption;V5__Aggregate_of_4_a__to__c_CaptionLbl)
            {
            }
            column(V6__Income_chargeable_under_the_head__Salaries___3_5_Caption;V6__Income_chargeable_under_the_head__Salaries___3_5_CaptionLbl)
            {
            }
            column(V7__Add___Any_other_income_reported_by_the_employeeCaption;V7__Add___Any_other_income_reported_by_the_employeeCaptionLbl)
            {
            }
            column(V8__Gross_total_income__6_7_Caption;V8__Gross_total_income__6_7_CaptionLbl)
            {
            }
            column(RsCaption;RsCaptionLbl)
            {
            }
            column(RsCaption_Control58;RsCaption_Control58Lbl)
            {
            }
            column(RsCaption_Control59;RsCaption_Control59Lbl)
            {
            }
            column(RsCaption_Control60;RsCaption_Control60Lbl)
            {
            }
            column(RsCaption_Control61;RsCaption_Control61Lbl)
            {
            }
            column(RsCaption_Control63;RsCaption_Control63Lbl)
            {
            }
            column(V9___Deductions_under_Chapter_VI_ACaption;V9___Deductions_under_Chapter_VI_ACaptionLbl)
            {
            }
            column(a__80_CCC__Pension_Fund_Caption;a__80_CCC__Pension_Fund_CaptionLbl)
            {
            }
            column(b__80_D__Mediclaim_Caption;b__80_D__Mediclaim_CaptionLbl)
            {
            }
            column(c__80_DD__Handicapped_dependents_Caption;c__80_DD__Handicapped_dependents_CaptionLbl)
            {
            }
            column(d__80_DDB__Medical_exp__for_specified_deceasesCaption;d__80_DDB__Medical_exp__for_specified_deceasesCaptionLbl)
            {
            }
            column(GROSSCaption;GROSSCaptionLbl)
            {
            }
            column(AMOUNTCaption;AMOUNTCaptionLbl)
            {
            }
            column(QUALIFYINGCaption;QUALIFYINGCaptionLbl)
            {
            }
            column(AMOUNTCaption_Control79;AMOUNTCaption_Control79Lbl)
            {
            }
            column(DEDUCTIBLECaption;DEDUCTIBLECaptionLbl)
            {
            }
            column(AMOUNTCaption_Control81;AMOUNTCaption_Control81Lbl)
            {
            }
            column(RsCaption_Control88;RsCaption_Control88Lbl)
            {
            }
            column(V10__Aggregate_of_deductible_amounts_underCaption;V10__Aggregate_of_deductible_amounts_underCaptionLbl)
            {
            }
            column(Chapter_VI_ACaption;Chapter_VI_ACaptionLbl)
            {
            }
            column(V11__Total_Income__8_10_Caption;V11__Total_Income__8_10_CaptionLbl)
            {
            }
            column(V12__Tax_on_total_incomeCaption;V12__Tax_on_total_incomeCaptionLbl)
            {
            }
            column(V13__Rebate_and_relief_under_Chapter_VIIICaption;V13__Rebate_and_relief_under_Chapter_VIIICaptionLbl)
            {
            }
            column(I__Under_Section_88Caption;I__Under_Section_88CaptionLbl)
            {
            }
            column(b__PF___Contribution_to_Provident_FundCaption;b__PF___Contribution_to_Provident_FundCaptionLbl)
            {
            }
            column(c__PPF___Contribution_to_Public_Provident_FundCaption;c__PPF___Contribution_to_Public_Provident_FundCaptionLbl)
            {
            }
            column(d__Contribution_to_Aproved_Super_AnnutionCaption;d__Contribution_to_Aproved_Super_AnnutionCaptionLbl)
            {
            }
            column(e__Post_Office_Saving_Deposits_10_15_yearsCaption;e__Post_Office_Saving_Deposits_10_15_yearsCaptionLbl)
            {
            }
            column(TAX_REBATE_Caption;TAX_REBATE_CaptionLbl)
            {
            }
            column(RELIEFCaption;RELIEFCaptionLbl)
            {
            }
            column(RsCaption_Control14;RsCaption_Control14Lbl)
            {
            }
            column(RsCaption_Control23;RsCaption_Control23Lbl)
            {
            }
            column(RsCaption_Control24;RsCaption_Control24Lbl)
            {
            }
            column(e__80_E__Repayment_of_loan_for_education_Caption;e__80_E__Repayment_of_loan_for_education_CaptionLbl)
            {
            }
            column(f__80_G__Donations_Caption;f__80_G__Donations_CaptionLbl)
            {
            }
            column(g__80_GG__Rent_Paid_Caption;g__80_GG__Rent_Paid_CaptionLbl)
            {
            }
            column(h__80_L__Interest_Dividends__etc__Caption;h__80_L__Interest_Dividends__etc__CaptionLbl)
            {
            }
            column(i____80_U__Physically_handicapped_Caption;i____80_U__Physically_handicapped_CaptionLbl)
            {
            }
            column(RsCaption_Control89;RsCaption_Control89Lbl)
            {
            }
            column(RsCaption_Control90;RsCaption_Control90Lbl)
            {
            }
            column(RsCaption_Control100;RsCaption_Control100Lbl)
            {
            }
            column(RsCaption_Control101;RsCaption_Control101Lbl)
            {
            }
            column(RsCaption_Control102;RsCaption_Control102Lbl)
            {
            }
            column(RsCaption_Control103;RsCaption_Control103Lbl)
            {
            }
            column(RsCaption_Control104;RsCaption_Control104Lbl)
            {
            }
            column(RsCaption_Control105;RsCaption_Control105Lbl)
            {
            }
            column(RsCaption_Control106;RsCaption_Control106Lbl)
            {
            }
            column(RsCaption_Control107;RsCaption_Control107Lbl)
            {
            }
            column(RsCaption_Control177;RsCaption_Control177Lbl)
            {
            }
            column(RsCaption_Control178;RsCaption_Control178Lbl)
            {
            }
            column(RsCaption_Control179;RsCaption_Control179Lbl)
            {
            }
            column(RsCaption_Control180;RsCaption_Control180Lbl)
            {
            }
            column(RsCaption_Control181;RsCaption_Control181Lbl)
            {
            }
            column(RsCaption_Control182;RsCaption_Control182Lbl)
            {
            }
            column(RsCaption_Control183;RsCaption_Control183Lbl)
            {
            }
            column(RsCaption_Control184;RsCaption_Control184Lbl)
            {
            }
            column(RsCaption_Control185;RsCaption_Control185Lbl)
            {
            }
            column(RsCaption_Control186;RsCaption_Control186Lbl)
            {
            }
            column(RsCaption_Control187;RsCaption_Control187Lbl)
            {
            }
            column(RsCaption_Control188;RsCaption_Control188Lbl)
            {
            }
            column(RsCaption_Control189;RsCaption_Control189Lbl)
            {
            }
            column(RsCaption_Control190;RsCaption_Control190Lbl)
            {
            }
            column(RsCaption_Control191;RsCaption_Control191Lbl)
            {
            }
            column(RsCaption_Control192;RsCaption_Control192Lbl)
            {
            }
            column(RsCaption_Control193;RsCaption_Control193Lbl)
            {
            }
            column(RsCaption_Control194;RsCaption_Control194Lbl)
            {
            }
            column(RsCaption_Control195;RsCaption_Control195Lbl)
            {
            }
            column(RsCaption_Control120;RsCaption_Control120Lbl)
            {
            }
            column(RsCaption_Control121;RsCaption_Control121Lbl)
            {
            }
            column(RsCaption_Control122;RsCaption_Control122Lbl)
            {
            }
            column(RsCaption_Control123;RsCaption_Control123Lbl)
            {
            }
            column(RsCaption_Control124;RsCaption_Control124Lbl)
            {
            }
            column(RsCaption_Control125;RsCaption_Control125Lbl)
            {
            }
            column(RsCaption_Control126;RsCaption_Control126Lbl)
            {
            }
            column(RsCaption_Control127;RsCaption_Control127Lbl)
            {
            }
            column(RsCaption_Control128;RsCaption_Control128Lbl)
            {
            }
            column(RsCaption_Control129;RsCaption_Control129Lbl)
            {
            }
            column(RsCaption_Control131;RsCaption_Control131Lbl)
            {
            }
            column(RsCaption_Control144;RsCaption_Control144Lbl)
            {
            }
            column(RsCaption_Control146;RsCaption_Control146Lbl)
            {
            }
            column(h__Contribution_to_LIC_Mutual_FundCaption;h__Contribution_to_LIC_Mutual_FundCaptionLbl)
            {
            }
            column(g__Contribution_to_ULIPCaption;g__Contribution_to_ULIPCaptionLbl)
            {
            }
            column(f__NSS___National_Saving_SchemeCaption;f__NSS___National_Saving_SchemeCaptionLbl)
            {
            }
            column(a__LIP_Life_Insurance_Prm_for_himself_spouse_childrensCaption;a__LIP_Life_Insurance_Prm_for_himself_spouse_childrensCaptionLbl)
            {
            }
            column(RsCaption_Control226;RsCaption_Control226Lbl)
            {
            }
            column(RsCaption_Control227;RsCaption_Control227Lbl)
            {
            }
            column(RsCaption_Control228;RsCaption_Control228Lbl)
            {
            }
            column(EmptyStringCaption;EmptyStringCaptionLbl)
            {
            }
            column(V1__Gross_salary_Caption;V1__Gross_salary_CaptionLbl)
            {
            }
            column(a__Salary_as_per_provisions_contained_in_sec_17_1_Caption;a__Salary_as_per_provisions_contained_in_sec_17_1_CaptionLbl)
            {
            }
            column(b__Value_of_Perquisites_u_s_17_2____as_per_Form_NO_12BB__wherever_applicable_Caption;b__Value_of_Perquisites_u_s_17_2____as_per_Form_NO_12BB__wherever_applicable_CaptionLbl)
            {
            }
            column(c__Profits_in_lieu_of_salary_under_section_17_3___as_per_Form_No_12BB__wherever_applicable_Caption;c__Profits_in_lieu_of_salary_under_section_17_3___as_per_Form_No_12BB__wherever_applicable_CaptionLbl)
            {
            }
            column(d__TotalCaption;d__TotalCaptionLbl)
            {
            }
            column(RsCaption_Control1000000007;RsCaption_Control1000000007Lbl)
            {
            }
            column(RsCaption_Control1000000009;RsCaption_Control1000000009Lbl)
            {
            }
            column(RsCaption_Control1000000011;RsCaption_Control1000000011Lbl)
            {
            }
            column(RsCaption_Control1000000013;RsCaption_Control1000000013Lbl)
            {
            }
            column(RsCaption_Control147;RsCaption_Control147Lbl)
            {
            }
            column(RsCaption_Control148;RsCaption_Control148Lbl)
            {
            }
            column(RsCaption_Control223;RsCaption_Control223Lbl)
            {
            }
            column(RsCaption_Control224;RsCaption_Control224Lbl)
            {
            }
            column(RsCaption_Control254;RsCaption_Control254Lbl)
            {
            }
            column(RsCaption_Control258;RsCaption_Control258Lbl)
            {
            }
            column(RsCaption_Control261;RsCaption_Control261Lbl)
            {
            }
            column(RsCaption_Control255;RsCaption_Control255Lbl)
            {
            }
            column(RsCaption_Control256;RsCaption_Control256Lbl)
            {
            }
            column(RsCaption_Control257;RsCaption_Control257Lbl)
            {
            }
            column(RsCaption_Control137;RsCaption_Control137Lbl)
            {
            }
            column(RsCaption_Control138;RsCaption_Control138Lbl)
            {
            }
            column(RsCaption_Control145;RsCaption_Control145Lbl)
            {
            }
            column(TOTAL___a__to__b__Caption;TOTAL___a__to__b__CaptionLbl)
            {
            }
            column(III__Under_Section_89__attach_details_Caption;III__Under_Section_89__attach_details_CaptionLbl)
            {
            }
            column(V14__Aggregate_of_tax_rebates_and_relief_at_13_aboveCaption;V14__Aggregate_of_tax_rebates_and_relief_at_13_aboveCaptionLbl)
            {
            }
            column(I_f__II_c__III_Caption;I_f__II_c__III_CaptionLbl)
            {
            }
            column(V15__Tax_payable__12_14__and_surcharge_thereonCaption;V15__Tax_payable__12_14__and_surcharge_thereonCaptionLbl)
            {
            }
            column(V16__Less___Tax_deducted_at_sourceCaption;V16__Less___Tax_deducted_at_sourceCaptionLbl)
            {
            }
            column(II__Under_Section_88B_and_88C_Caption;II__Under_Section_88B_and_88C_CaptionLbl)
            {
            }
            column(a_Caption;a_CaptionLbl)
            {
            }
            column(b_Caption;b_CaptionLbl)
            {
            }
            column(c_Caption;c_CaptionLbl)
            {
            }
            column(V17__Tax_payable_refundable__15_16_Caption;V17__Tax_payable_refundable__15_16_CaptionLbl)
            {
            }
            column(RsCaption_Control225;RsCaption_Control225Lbl)
            {
            }
            column(AMOUNTCaption_Control150;AMOUNTCaption_Control150Lbl)
            {
            }
            column(DATE_OF_PAYMENTCaption;DATE_OF_PAYMENTCaptionLbl)
            {
            }
            column(DETAILS_OF_TAX_DEDUCTED_AND_DEPOSITED_INTOCaption;DETAILS_OF_TAX_DEDUCTED_AND_DEPOSITED_INTOCaptionLbl)
            {
            }
            column(CENTRAL_GOVERNMENT_ACCOUNTCaption;CENTRAL_GOVERNMENT_ACCOUNTCaptionLbl)
            {
            }
            column(NAME_OF_BANK_AND_BRANCH_WHERE_TAX_DEPOSITEDCaption;NAME_OF_BANK_AND_BRANCH_WHERE_TAX_DEPOSITEDCaptionLbl)
            {
            }
            column(j__Contribution_to_Mutual_Fund_notified_u_s_10_23D_Caption;j__Contribution_to_Mutual_Fund_notified_u_s_10_23D_CaptionLbl)
            {
            }
            column(i__Anuity_Plan_of_LIC_Jeevan_Dhara_Jeevan_Akshoy_etc_Caption;i__Anuity_Plan_of_LIC_Jeevan_Dhara_Jeevan_Akshoy_etc_CaptionLbl)
            {
            }
            column(k__Repayment_of_Loan_for_purc_const_of_a_newly_Res_HouseCaption;k__Repayment_of_Loan_for_purc_const_of_a_newly_Res_HouseCaptionLbl)
            {
            }
            column(l__Shares_Debentures_Units_of_new_infrastructure_facilitiesCaption;l__Shares_Debentures_Units_of_new_infrastructure_facilitiesCaptionLbl)
            {
            }
            column(m_Caption;m_CaptionLbl)
            {
            }
            column(TOTAL__a__to__l_Caption;TOTAL__a__to__l_CaptionLbl)
            {
            }
            column(RsCaption_Control130;RsCaption_Control130Lbl)
            {
            }
            column(RsCaption_Control229;RsCaption_Control229Lbl)
            {
            }
            column(RsCaption_Control230;RsCaption_Control230Lbl)
            {
            }
            column(RsCaption_Control231;RsCaption_Control231Lbl)
            {
            }
            column(RsCaption_Control233;RsCaption_Control233Lbl)
            {
            }
            column(RsCaption_Control136;RsCaption_Control136Lbl)
            {
            }
            column(RsCaption_Control235;RsCaption_Control235Lbl)
            {
            }
            column(RsCaption_Control236;RsCaption_Control236Lbl)
            {
            }
            column(RsCaption_Control237;RsCaption_Control237Lbl)
            {
            }
            column(RsCaption_Control238;RsCaption_Control238Lbl)
            {
            }
            column(RsCaption_Control264;RsCaption_Control264Lbl)
            {
            }
            column(Section_88_BCaption;Section_88_BCaptionLbl)
            {
            }
            column(Section_88_CCaption;Section_88_CCaptionLbl)
            {
            }
            column(Employee_No_;"No.")
            {
            }
            dataitem("Pay Employee Pay Details";"Pay Employee Pay Details")
            {
                DataItemLink = Employee No=FIELD(No.);
                DataItemTableView = SORTING(Year,Month,Employee No,Pay Element Code);
                column(Pay_Employee_Pay_Details__Payable_Amount_;"Payable Amount")
                {
                }
                column(BankNameNBranch;BankNameNBranch)
                {
                }
                column(Pay_Employee_Pay_Details__TDS_Payment_Date_;"TDS Payment Date")
                {
                }
                column(BankAdd;BankAdd)
                {
                }
                column(NUMBERTEXT_1_;NUMBERTEXT[1])
                {
                }
                column(SumTDSAmt;SumTDSAmt)
                {
                }
                column(Place_____________________________________Caption;Place_____________________________________CaptionLbl)
                {
                }
                column(and_correct_as_per_records_Caption;and_correct_as_per_records_CaptionLbl)
                {
                }
                column(Certified_that_a_sum_of_Rs__in_words_Caption;Certified_that_a_sum_of_Rs__in_words_CaptionLbl)
                {
                }
                column(Date____________________________________Caption;Date____________________________________CaptionLbl)
                {
                }
                column(Full_Name__________________________________________________________Caption;Full_Name__________________________________________________________CaptionLbl)
                {
                }
                column(for_deduction_of_taxCaption;for_deduction_of_taxCaptionLbl)
                {
                }
                column(Signature_of_the_person_responsibleCaption;Signature_of_the_person_responsibleCaptionLbl)
                {
                }
                column(EmptyStringCaption_Control162;EmptyStringCaption_Control162Lbl)
                {
                }
                column(Designation___________________________________________Caption;Designation___________________________________________CaptionLbl)
                {
                }
                column(DataItem1430010001;has_been_deducted_at_source_and_paid_to_the_credit_of_the_Central_Government___Further_certified_that_the_above_information_iLbl)
                {
                }
                column(Pay_Employee_Pay_Details_Year;Year)
                {
                }
                column(Pay_Employee_Pay_Details_Month;Month)
                {
                }
                column(Pay_Employee_Pay_Details_Employee_No;"Employee No")
                {
                }
                column(Pay_Employee_Pay_Details_Pay_Element_Code;"Pay Element Code")
                {
                }
                column(Pay_Employee_Pay_Details_ForMonthDate;ForMonthDate)
                {
                }

                trigger OnPreDataItem();
                begin
                    "Pay Employee Pay Details".SETCURRENTKEY("Pay Employee Pay Details".PayRollMonthDate,"Pay Employee Pay Details"."Pay Element Code"
                    );
                    "Pay Employee Pay Details".SETRANGE("Pay Employee Pay Details".PayRollMonthDate ,
                      CALCDATE('-1Y',PAYYEAR."Year Start Date"),CALCDATE('-1Y',PAYYEAR."Year End Date"));
                    "Pay Employee Pay Details".SETRANGE("Pay Employee Pay Details"."Pay Element Code",'TDS');
                    "Pay Employee Pay Details".CALCSUMS("Pay Employee Pay Details"."Payable Amount");
                    SumTDSAmt := -1 * "Pay Employee Pay Details"."Payable Amount";
                end;
            }
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
        PAYYEAR.RESET;
        PAYYEAR.SETFILTER(Type,'=%1',3);
        IF PAYYEAR.FIND('-') THEN
          BEGIN
            PAYYEARID :=PAYYEAR.ID;
            STDATE :=PAYYEAR."Year Start Date";
            ENDDATE :=PAYYEAR."Year End Date"  ;
          END
        ELSE
          ERROR(Text0001);
    end;

    trigger OnPreReport();
    begin
        AssmtSTDate :=CALCDATE('-1Y',STDATE);
        AssmtENDDate :=CALCDATE('-1Y',ENDDATE);
        RvCompnayInfo.GET;
        CompanyName1 :=RvCompnayInfo.Name + ' ' +RvCompnayInfo."Name 2" ;
        CompanyAdd1  :=RvCompnayInfo.Address + ' ' +RvCompnayInfo."Address 2" + ' ' +RvCompnayInfo.City ;
        CompanyPost := RvCompnayInfo."Post Code";
        CompTAN := RvCompnayInfo."T.A.N. No.";
        CompPan := RvCompnayInfo."P.A.N. No.";
    end;

    var
        PAYYEARID : Integer;
        STDATE : Date;
        ENDDATE : Date;
        AssmtSTDate : Date;
        AssmtENDDate : Date;
        PAYYEAR : Record "Pay Year";
        NAME : Text[50];
        DESIGNATION : Text[30];
        "PAN/GIRNO" : Text[50];
        "COMPPAN/GIRNO" : Text[50];
        RvCompnayInfo : Record "Company Information";
        CompanyName1 : Text[50];
        CompanyAdd1 : Text[100];
        RvTaxSalaries : Record "Tax Salaries";
        GrossSalary1 : Decimal;
        undersection10 : Decimal;
        Balance3 : Decimal;
        SDAmt : Decimal;
        EntAllowanceAmt : Decimal;
        TaxEmpAmt : Decimal;
        Totalof4 : Decimal;
        IncomeCharges : Decimal;
        AnyOtherIncome : Decimal;
        GrossTotalof6to7 : Decimal;
        RvTaxMainSheet : Record "Tax Main Sheet";
        AmountUnder10 : array [10,3] of Decimal;
        Ctr : Integer;
        TotalofVIA : Decimal;
        AmountUnder11 : Decimal;
        AmountUnder12 : Decimal;
        DedAmtUnderVIA : Decimal;
        AmountUnder13a : array [20,2] of Decimal;
        RvTaxSalSub : Record "Tax Salaries Sub";
        Totalof13aGross : Decimal;
        Totalof13aQual : Decimal;
        RebateUnder13 : Decimal;
        RebateUnderSec89 : Decimal;
        AmountUnder14 : Decimal;
        AmountUnder15 : Decimal;
        AmountUnderA16 : Decimal;
        AmountUnderB16 : Decimal;
        AmountUnder16 : Decimal;
        AmountUnder17 : Decimal;
        BankNameNBranch : Text[100];
        RvBank : Record "Bank Account";
        BankAdd : Text[100];
        CompPan : Text[100];
        CompTAN : Text[100];
        AmountUnder1a : Decimal;
        AmountUnder1b : Decimal;
        AmountUnder1c : Decimal;
        AmountUnder1d : Decimal;
        Text0001 : Label 'No Financial year period is defined in the setup tables.';
        SumTDSAmt : Decimal;
        CheckReport : Report Check;
        NUMBERTEXT : array [2] of Text[240];
        GenJnlLine : Record "Gen. Journal Line";
        CompanyPost : Code[20];
        Value88B : Decimal;
        Value88C : Decimal;
        PayTaxPolicy : Record "Pay Tax Policy";
        PeriodStartDate : Date;
        PeriodEndDate : Date;
        var1 : Decimal;
        var2 : Decimal;
        VarA15 : Decimal;
        VarA16 : Decimal;
        Certificate_under_Section_203_of_the_Income_tax_Act__1961CaptionLbl : Label 'Certificate under Section 203 of the Income-tax Act, 1961';
        for_tax_deducted_at_source_from_income_chargableCaptionLbl : Label 'for tax deducted at source from income chargable';
        under_the_head__Salaries_CaptionLbl : Label 'under the head "Salaries"';
        FORM_NO__16CaptionLbl : Label 'FORM NO. 16';
        See_rule_31_1__a__CaptionLbl : Label '[See rule 31(1)(a)]';
        Name_and_address_of_the_EmployerCaptionLbl : Label 'Name and address of the Employer';
        PAN_GIR_NO_CaptionLbl : Label 'PAN/GIR NO.';
        TANCaptionLbl : Label 'TAN';
        Name_and_Designation_of_the_employeeCaptionLbl : TextConst ENU='Name and Designation of the employee',ENG='Name and Designation';
        PAN_GIR_No_Caption_Control27Lbl : Label 'PAN/GIR No.';
        TDS_Circle_where_Annual_Return_Statement_underCaptionLbl : Label 'TDS Circle where Annual Return/Statement under';
        section_206_is_to_be_filedCaptionLbl : Label '" section 206 is to be filed"';
        PeriodCaptionLbl : Label 'Period';
        FromCaptionLbl : Label 'From';
        ToCaptionLbl : Label 'To';
        Assessment_YearCaptionLbl : Label 'Assessment Year';
        DETAILS_OF_SALARY_PAID_AND_ANY_OTHER_INCOME_AND_TAX_DEDUCTEDCaptionLbl : Label 'DETAILS OF SALARY PAID AND ANY OTHER INCOME AND TAX DEDUCTED';
        V2__Less___Allowance_to_the_extent_exempt_under_section_10CaptionLbl : Label '2. Less : Allowance to the extent exempt under section 10';
        V3__Balance_1_2_CaptionLbl : Label '3. Balance(1-2)';
        V4__Deductions__CaptionLbl : Label '4. Deductions :';
        a__Standard_deductionCaptionLbl : Label '(a) Standard deduction';
        b__Entertainment_allowanceCaptionLbl : Label '(b) Entertainment allowance';
        c__Tax_on_EmploymentCaptionLbl : Label '(c) Tax on Employment';
        V5__Aggregate_of_4_a__to__c_CaptionLbl : Label '5. Aggregate of 4(a) to (c)';
        V6__Income_chargeable_under_the_head__Salaries___3_5_CaptionLbl : Label '6. Income chargeable under the head ''Salaries'' (3-5)';
        V7__Add___Any_other_income_reported_by_the_employeeCaptionLbl : Label '7. Add : Any other income reported by the employee';
        V8__Gross_total_income__6_7_CaptionLbl : Label '8. Gross total income (6+7)';
        RsCaptionLbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control58Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control59Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control60Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control61Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control63Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        V9___Deductions_under_Chapter_VI_ACaptionLbl : Label '9.  Deductions under Chapter VI-A';
        a__80_CCC__Pension_Fund_CaptionLbl : TextConst ENU='(a) 80 CCC (Pension Fund)',ENG='(a)';
        b__80_D__Mediclaim_CaptionLbl : TextConst ENU='(b) 80 D (Mediclaim)',ENG='(b)';
        c__80_DD__Handicapped_dependents_CaptionLbl : TextConst ENU='(c) 80 DD (Handicapped dependents)',ENG='(c)';
        d__80_DDB__Medical_exp__for_specified_deceasesCaptionLbl : TextConst ENU='(d) 80 DDB (Medical exp. for specified deceases',ENG='(d)';
        GROSSCaptionLbl : Label 'GROSS';
        AMOUNTCaptionLbl : Label 'AMOUNT';
        QUALIFYINGCaptionLbl : Label 'QUALIFYING';
        AMOUNTCaption_Control79Lbl : Label 'AMOUNT';
        DEDUCTIBLECaptionLbl : Label 'DEDUCTIBLE';
        AMOUNTCaption_Control81Lbl : Label 'AMOUNT';
        RsCaption_Control88Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        V10__Aggregate_of_deductible_amounts_underCaptionLbl : Label '10. Aggregate of deductible amounts under';
        Chapter_VI_ACaptionLbl : Label 'Chapter VI-A';
        V11__Total_Income__8_10_CaptionLbl : Label '11. Total Income (8-10)';
        V12__Tax_on_total_incomeCaptionLbl : Label '12. Tax on total income';
        V13__Rebate_and_relief_under_Chapter_VIIICaptionLbl : Label '13. Rebate and relief under Chapter VIII';
        I__Under_Section_88CaptionLbl : Label 'I. Under Section 88';
        b__PF___Contribution_to_Provident_FundCaptionLbl : TextConst ENU='(b) PF - Contribution to Provident Fund',ENG='(b)';
        c__PPF___Contribution_to_Public_Provident_FundCaptionLbl : TextConst ENU='(c) PPF - Contribution to Public Provident Fund',ENG='(c)';
        d__Contribution_to_Aproved_Super_AnnutionCaptionLbl : TextConst ENU='(d) Contribution to Aproved Super Annution',ENG='(d)';
        e__Post_Office_Saving_Deposits_10_15_yearsCaptionLbl : TextConst ENU='(e) Post Office Saving Deposits 10/15 years',ENG='(e)';
        TAX_REBATE_CaptionLbl : Label 'TAX REBATE/';
        RELIEFCaptionLbl : Label 'RELIEF';
        RsCaption_Control14Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control23Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control24Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        e__80_E__Repayment_of_loan_for_education_CaptionLbl : TextConst ENU='(e) 80 E (Repayment of loan for education)',ENG='(d)';
        f__80_G__Donations_CaptionLbl : TextConst ENU='(f) 80 G (Donations)',ENG='(d)';
        g__80_GG__Rent_Paid_CaptionLbl : TextConst ENU='(g) 80 GG (Rent Paid)',ENG='(d)';
        h__80_L__Interest_Dividends__etc__CaptionLbl : TextConst ENU='(h) 80 L (Interest/Dividends, etc.)',ENG='(d)';
        i____80_U__Physically_handicapped_CaptionLbl : TextConst ENU='(i) * 80 U (Physically handicapped)',ENG='(d)';
        RsCaption_Control89Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control90Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control100Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control101Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control102Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control103Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control104Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control105Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control106Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control107Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control177Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control178Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control179Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control180Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control181Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control182Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control183Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control184Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control185Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control186Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control187Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control188Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control189Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control190Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control191Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control192Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control193Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control194Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control195Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control120Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control121Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control122Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control123Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control124Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control125Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control126Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control127Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control128Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control129Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control131Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control144Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control146Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        h__Contribution_to_LIC_Mutual_FundCaptionLbl : TextConst ENU='(h) Contribution to LIC Mutual Fund',ENG='(c)';
        g__Contribution_to_ULIPCaptionLbl : TextConst ENU='(g) Contribution to ULIP',ENG='(b)';
        f__NSS___National_Saving_SchemeCaptionLbl : TextConst ENU='(f) NSS - National Saving Scheme',ENG='(a)';
        a__LIP_Life_Insurance_Prm_for_himself_spouse_childrensCaptionLbl : TextConst ENU='(a) LIP-Life Insurance Prm for himself/spouse/childrens',ENG='I. Under Section 88';
        RsCaption_Control226Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control227Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control228Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        EmptyStringCaptionLbl : Label '-';
        V1__Gross_salary_CaptionLbl : Label '1. Gross salary*';
        a__Salary_as_per_provisions_contained_in_sec_17_1_CaptionLbl : TextConst ENU='a) Salary as per provisions contained in sec 17(1)',ENG='1. Gross salary*';
        b__Value_of_Perquisites_u_s_17_2____as_per_Form_NO_12BB__wherever_applicable_CaptionLbl : TextConst ENU='b) Value of Perquisites u/s 17(2) ( as per Form NO.12BB, wherever applicable)',ENG='1. Gross salary*';
        c__Profits_in_lieu_of_salary_under_section_17_3___as_per_Form_No_12BB__wherever_applicable_CaptionLbl : TextConst ENU='c) Profits in lieu of salary under section 17(3)( as per Form No.12BB, wherever applicable)',ENG='1. Gross salary*';
        d__TotalCaptionLbl : TextConst ENU='d) Total',ENG='1. Gross salary*';
        RsCaption_Control1000000007Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control1000000009Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control1000000011Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control1000000013Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control147Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control148Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control223Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control224Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control254Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control258Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control261Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control255Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control256Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control257Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control137Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control138Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control145Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        TOTAL___a__to__b__CaptionLbl : Label 'TOTAL [(a) to (b)]';
        III__Under_Section_89__attach_details_CaptionLbl : Label 'III. Under Section 89 (attach details)';
        V14__Aggregate_of_tax_rebates_and_relief_at_13_aboveCaptionLbl : Label '14. Aggregate of tax rebates and relief at 13 above';
        I_f__II_c__III_CaptionLbl : Label '[I(f)+II(c)+III]';
        V15__Tax_payable__12_14__and_surcharge_thereonCaptionLbl : Label '15. Tax payable (12-14) and surcharge thereon';
        V16__Less___Tax_deducted_at_sourceCaptionLbl : Label '16. Less : Tax deducted at source';
        II__Under_Section_88B_and_88C_CaptionLbl : TextConst ENU='<II. Under Section 88B and 88C>',ENG='II. Under Section 88A';
        a_CaptionLbl : Label '(a)';
        b_CaptionLbl : Label '(b)';
        c_CaptionLbl : Label '(c)';
        V17__Tax_payable_refundable__15_16_CaptionLbl : Label '17. Tax payable/refundable (15-16)';
        RsCaption_Control225Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        AMOUNTCaption_Control150Lbl : Label 'AMOUNT';
        DATE_OF_PAYMENTCaptionLbl : Label 'DATE OF PAYMENT';
        DETAILS_OF_TAX_DEDUCTED_AND_DEPOSITED_INTOCaptionLbl : Label 'DETAILS OF TAX DEDUCTED AND DEPOSITED INTO';
        CENTRAL_GOVERNMENT_ACCOUNTCaptionLbl : Label 'CENTRAL GOVERNMENT ACCOUNT';
        NAME_OF_BANK_AND_BRANCH_WHERE_TAX_DEPOSITEDCaptionLbl : TextConst ENU='NAME OF BANK AND BRANCH WHERE TAX DEPOSITED',ENG='NAME OF BANK AND BRANCH';
        j__Contribution_to_Mutual_Fund_notified_u_s_10_23D_CaptionLbl : TextConst ENU='(j) Contribution to Mutual Fund notified u/s 10(23D)',ENG='(e)';
        i__Anuity_Plan_of_LIC_Jeevan_Dhara_Jeevan_Akshoy_etc_CaptionLbl : TextConst ENU='(i) Anuity Plan of LIC(Jeevan Dhara/Jeevan Akshoy etc)',ENG='(d)';
        k__Repayment_of_Loan_for_purc_const_of_a_newly_Res_HouseCaptionLbl : TextConst ENU='(k) Repayment of Loan for purc/const of a newly Res House',ENG='(e)';
        l__Shares_Debentures_Units_of_new_infrastructure_facilitiesCaptionLbl : TextConst ENU='(l) Shares,Debentures,Units of new infrastructure facilities',ENG='(e)';
        m_CaptionLbl : TextConst ENU='(m)',ENG='(f)';
        TOTAL__a__to__l_CaptionLbl : TextConst ENU='TOTAL (a) to (l)',ENG='TOTAL (a) to (e)';
        RsCaption_Control130Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control229Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control230Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control231Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control233Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control136Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control235Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control236Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control237Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control238Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        RsCaption_Control264Lbl : TextConst ENU='Rs',ENG='Rs. . . . . . . . .';
        Section_88_BCaptionLbl : Label 'Section 88 B';
        Section_88_CCaptionLbl : Label 'Section 88 C';
        Place_____________________________________CaptionLbl : Label 'Place. . . . . . . . . . . . . . . . . . .';
        and_correct_as_per_records_CaptionLbl : TextConst ENU='and correct as per records.',ENG='credit of the Central Government.  Further certified that the above information is true and ';
        Certified_that_a_sum_of_Rs__in_words_CaptionLbl : TextConst ENU='Certified that a sum of Rs.(in words)',ENG='Certified that a sum of Rs.(in words)......... has been deducted at source and paid to the';
        Date____________________________________CaptionLbl : Label '"Date. . . . . . . . . . . . . . . . . . "';
        Full_Name__________________________________________________________CaptionLbl : Label 'Full Name. . . . . . . . . . . . . . . . . . . . . . . . . . . . ..';
        for_deduction_of_taxCaptionLbl : Label 'for deduction of tax';
        Signature_of_the_person_responsibleCaptionLbl : Label 'Signature of the person responsible';
        EmptyStringCaption_Control162Lbl : Label '. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .';
        Designation___________________________________________CaptionLbl : Label 'Designation. . . . . . . . . . . . . . . . . . . . . .';
        has_been_deducted_at_source_and_paid_to_the_credit_of_the_Central_Government___Further_certified_that_the_above_information_iLbl : Label '"has been deducted at source and paid to the credit of the Central Government.  Further certified that the above information is true "';
}

