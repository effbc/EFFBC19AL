report 33000025 "TDS - Form 24 Annexure"
{
    // version NEOGYNPAY13.70.00.06

    DefaultLayout = RDLC;
    RDLCLayout = './TDS - Form 24 Annexure.rdlc';

    dataset
    {
        dataitem(Employee;Employee)
        {
            RequestFilterFields = "No.","Job Title/Grade","Department Code";
            column(Employee__PAN_No_;"PAN No")
            {
            }
            column(Name;Name)
            {
            }
            column(Address3;Address3)
            {
            }
            column(AmtUnder8;AmtUnder8)
            {
            }
            column(AmtUnder9;AmtUnder9)
            {
            }
            column(AmtUnder10;AmtUnder10)
            {
            }
            column(AmtUnder11;AmtUnder11)
            {
            }
            column(AmtUnder12;AmtUnder12)
            {
            }
            column(AmtUnder13;AmtUnder13)
            {
            }
            column(AmtUnder14;AmtUnder14)
            {
            }
            column(AmtUnder15;AmtUnder15)
            {
            }
            column(AmtUnder16;AmtUnder16)
            {
            }
            column(AmtUnder17;AmtUnder17)
            {
            }
            column(AmtUnder18;AmtUnder18)
            {
            }
            column(AmtUnder19i;AmtUnder19i)
            {
            }
            column(AmtUnder20;AmtUnder20)
            {
            }
            column(AmtUnder21;AmtUnder21)
            {
            }
            column(AmtUnder22;AmtUnder22)
            {
            }
            column(AmtUnder23;AmtUnder23)
            {
            }
            column(AmtUnder19ii;AmtUnder19ii)
            {
            }
            column(AmtUnder19iii;AmtUnder19iii)
            {
            }
            column(AmtUnder19iv;AmtUnder19iv)
            {
            }
            column(AmtUnder19v;AmtUnder19v)
            {
            }
            column(AmtUnder19vi;AmtUnder19vi)
            {
            }
            column(AmtUnder19vii;AmtUnder19vii)
            {
            }
            column(AmtUnder19;AmtUnder19)
            {
            }
            column(AmtUnder24;AmtUnder24)
            {
            }
            column(AmtUnder25;AmtUnder25)
            {
            }
            column(AmtUnder26;AmtUnder26)
            {
            }
            column(AmtUnder27;AmtUnder27)
            {
            }
            column(AmtUnder28;AmtUnder28)
            {
            }
            column(AmtUnder29;AmtUnder29)
            {
            }
            column(CurrReport_PAGENO;CurrReport.PAGENO)
            {
            }
            column(USERID;USERID)
            {
            }
            column(COMPANYNAME;COMPANYNAME)
            {
            }
            column(FORMAT_TODAY_0_4_;FORMAT(TODAY,0,4))
            {
            }
            column(PerksAmount1;PerksAmount1)
            {
            }
            column(PerksAmount2;PerksAmount2)
            {
            }
            column(PerksAmount3;PerksAmount3)
            {
            }
            column(PerksAmount4;PerksAmount4)
            {
            }
            column(PerksAmount5;PerksAmount5)
            {
            }
            column(PerksAmount6;PerksAmount6)
            {
            }
            column(PerksAmount7;PerksAmount7)
            {
            }
            column(PerksAmount8;PerksAmount8)
            {
            }
            column(PerksAmount9;PerksAmount9)
            {
            }
            column(PerksAmount10;PerksAmount10)
            {
            }
            column(PerksAmount11;PerksAmount11)
            {
            }
            column(Permanent_Account_Number_PAN__of_the_employee_See_note_8_Caption;Permanent_Account_Number_PAN__of_the_employee_See_note_8_CaptionLbl)
            {
            }
            column(Name_of_the_employeeCaption;Name_of_the_employeeCaptionLbl)
            {
            }
            column(Residential_address_of_the_employeeCaption;Residential_address_of_the_employeeCaptionLbl)
            {
            }
            column(Occupational_clasificatoin_of_employement_Give_Code__See_Note_2_Caption;Occupational_clasificatoin_of_employement_Give_Code__See_Note_2_CaptionLbl)
            {
            }
            column(V1__Caption;V1__CaptionLbl)
            {
            }
            column(V2__Caption;V2__CaptionLbl)
            {
            }
            column(V3__Caption;V3__CaptionLbl)
            {
            }
            column(V4__Caption;V4__CaptionLbl)
            {
            }
            column(V8__Caption;V8__CaptionLbl)
            {
            }
            column(V7__Caption;V7__CaptionLbl)
            {
            }
            column(V6__Caption;V6__CaptionLbl)
            {
            }
            column(V5__Caption;V5__CaptionLbl)
            {
            }
            column(Date_from_which_employeed_during_the_financial_yearCaption;Date_from_which_employeed_during_the_financial_yearCaptionLbl)
            {
            }
            column(Date_upto_which_empmloyeed_during_the_financial_year_Caption;Date_upto_which_empmloyeed_during_the_financial_year_CaptionLbl)
            {
            }
            column(Serial_NumberCaption;Serial_NumberCaptionLbl)
            {
            }
            column(Total_amount_of_salary_excluding_amount_required_to_be_shown_in_column_9_and_10Caption;Total_amount_of_salary_excluding_amount_required_to_be_shown_in_column_9_and_10CaptionLbl)
            {
            }
            column(DataItem18;Total_amount_of_house_rent_allowance_and_other_allownaces_to_the_extent_chargeable_to_tax___see_section_10_13A__read_with_rulLbl)
            {
            }
            column(V9__Caption;V9__CaptionLbl)
            {
            }
            column(V10__Caption;V10__CaptionLbl)
            {
            }
            column(V11__Caption;V11__CaptionLbl)
            {
            }
            column(V12__Caption;V12__CaptionLbl)
            {
            }
            column(V13__Caption;V13__CaptionLbl)
            {
            }
            column(V14__Caption;V14__CaptionLbl)
            {
            }
            column(Value_of_prerequisite_and_amount_of_exemption_to_Employees_Provident_Fund_Account_as_per_Annexure_Caption;Value_of_prerequisite_and_amount_of_exemption_to_Employees_Provident_Fund_Account_as_per_Annexure_CaptionLbl)
            {
            }
            column(Amount_of_allowances_and_prerequisite_claimed_as_exempt_and_not_included_in_columne_9_and_10_Caption;Amount_of_allowances_and_prerequisite_claimed_as_exempt_and_not_included_in_columne_9_and_10_CaptionLbl)
            {
            }
            column(Total_of_column_8_9_and_10Caption;Total_of_column_8_9_and_10CaptionLbl)
            {
            }
            column(Total_deduction_under_section_16_i__16_ii__16_iii____specify_each_deduction_separately_Caption;Total_deduction_under_section_16_i__16_ii__16_iii____specify_each_deduction_separately_CaptionLbl)
            {
            }
            column(Income_chargeable_under_the_head__Salaries____Columns_12_minus_13_Caption;Income_chargeable_under_the_head__Salaries____Columns_12_minus_13_CaptionLbl)
            {
            }
            column(Income__not_being_loss__under_any_head_other_then_Income_under_the_head__Salaries___Section_192_2B__Caption;Income__not_being_loss__under_any_head_other_then_Income_under_the_head__Salaries___Section_192_2B__CaptionLbl)
            {
            }
            column(V17__Caption;V17__CaptionLbl)
            {
            }
            column(Gross_total_income__Total_of_columns_14_and_15_Caption;Gross_total_income__Total_of_columns_14_and_15_CaptionLbl)
            {
            }
            column(V15__Caption;V15__CaptionLbl)
            {
            }
            column(Amount_deductible_under_section_80_G_in_respect_of_donation_to_certain_funds_Charitable_institutions_Caption;Amount_deductible_under_section_80_G_in_respect_of_donation_to_certain_funds_Charitable_institutions_CaptionLbl)
            {
            }
            column(V16__Caption;V16__CaptionLbl)
            {
            }
            column(V18__Caption;V18__CaptionLbl)
            {
            }
            column(Amount_deductible_under_section_80_G_in_respects_of_rent_paid_Caption;Amount_deductible_under_section_80_G_in_respects_of_rent_paid_CaptionLbl)
            {
            }
            column(Amount_deductible_under_any_other_provision_of_chapter_VI_A__indicate_relevant_section_and_amount_deducted__Caption;Amount_deductible_under_any_other_provision_of_chapter_VI_A__indicate_relevant_section_and_amount_deducted__CaptionLbl)
            {
            }
            column(Total_amount_deductible_under_chapter_VI_A__Total_of_column_17_18_and_19_Caption;Total_amount_deductible_under_chapter_VI_A__Total_of_column_17_18_and_19_CaptionLbl)
            {
            }
            column(Total_taxable_income__column_16__column_20_Caption;Total_taxable_income__column_16__column_20_CaptionLbl)
            {
            }
            column(Income_tax__on_total_incomeCaption;Income_tax__on_total_incomeCaptionLbl)
            {
            }
            column(V19__Caption;V19__CaptionLbl)
            {
            }
            column(V20__Caption;V20__CaptionLbl)
            {
            }
            column(V21__Caption;V21__CaptionLbl)
            {
            }
            column(V22__Caption;V22__CaptionLbl)
            {
            }
            column(DataItem46;Income_tax_rebate_under_section_88_on_life_insurance__Premium__contribution_to_provident_Fund_etc__see_notes_4_and_5___CaptioLbl)
            {
            }
            column(Income_releif_under_section_89__when_salary_etc_is_paid_in__arrears_or_in_advance_Caption;Income_releif_under_section_89__when_salary_etc_is_paid_in__arrears_or_in_advance_CaptionLbl)
            {
            }
            column(Total_income_tax_payable___column_22_minus_total_of_column_23_and_24___and_surcharge_thereonCaption;Total_income_tax_payable___column_22_minus_total_of_column_23_and_24___and_surcharge_thereonCaptionLbl)
            {
            }
            column(Tax_deducted_ate_source_Income_TaxCaption;Tax_deducted_ate_source_Income_TaxCaptionLbl)
            {
            }
            column(Tax_deducted_at_source_surchargeCaption;Tax_deducted_at_source_surchargeCaptionLbl)
            {
            }
            column(Total_Income_tax_deducted_at_source__Total_of_column_26_and_column_27_Caption;Total_Income_tax_deducted_at_source__Total_of_column_26_and_column_27_CaptionLbl)
            {
            }
            column(Tax_payable_refundable__Difference_of_columns_25_and_28_Caption;Tax_payable_refundable__Difference_of_columns_25_and_28_CaptionLbl)
            {
            }
            column(Remarks__See_Notes_6_and_7_Caption;Remarks__See_Notes_6_and_7_CaptionLbl)
            {
            }
            column(V23__Caption;V23__CaptionLbl)
            {
            }
            column(V24__Caption;V24__CaptionLbl)
            {
            }
            column(V25__Caption;V25__CaptionLbl)
            {
            }
            column(V26__Caption;V26__CaptionLbl)
            {
            }
            column(V27__Caption;V27__CaptionLbl)
            {
            }
            column(V28__Caption;V28__CaptionLbl)
            {
            }
            column(V29__Caption;V29__CaptionLbl)
            {
            }
            column(V30__Caption;V30__CaptionLbl)
            {
            }
            column(i__80_CCC__Pension_Fund_Caption;i__80_CCC__Pension_Fund_CaptionLbl)
            {
            }
            column(ii__80_D__Mediclaim_Caption;ii__80_D__Mediclaim_CaptionLbl)
            {
            }
            column(iii__80_DD__Handicapped_dependents_Caption;iii__80_DD__Handicapped_dependents_CaptionLbl)
            {
            }
            column(iv__80_DDB__Medical_exp__for_specified_deceasesCaption;iv__80_DDB__Medical_exp__for_specified_deceasesCaptionLbl)
            {
            }
            column(v__80_E__Repayment_of_loan_for_education_Caption;v__80_E__Repayment_of_loan_for_education_CaptionLbl)
            {
            }
            column(vi__80_L__Interest_Dividends__etc___from_all_investment_deposit_mentioned_in_Act_Caption;vi__80_L__Interest_Dividends__etc___from_all_investment_deposit_mentioned_in_Act_CaptionLbl)
            {
            }
            column(vii____80_U__Physically_handicapped_Caption;vii____80_U__Physically_handicapped_CaptionLbl)
            {
            }
            column(Total_of_19_i____19_vii_Caption;Total_of_19_i____19_vii_CaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Form_24_AnnexureCaption;Form_24_AnnexureCaptionLbl)
            {
            }
            column(Particulars_of_value_of_Perks____Caption;Particulars_of_value_of_Perks____CaptionLbl)
            {
            }
            column(V1__Value_as_if_accomodation_is_unfurnished_Caption;V1__Value_as_if_accomodation_is_unfurnished_CaptionLbl)
            {
            }
            column(V2__Cost_Rent_of_FurnitureCaption;V2__Cost_Rent_of_FurnitureCaptionLbl)
            {
            }
            column(V3__Perks_of_FurnitureCaption;V3__Perks_of_FurnitureCaptionLbl)
            {
            }
            column(V4__Total_Perks_of_accommodation_Caption;V4__Total_Perks_of_accommodation_CaptionLbl)
            {
            }
            column(V5___Rent_if_any_paid_by_employee_Caption;V5___Rent_if_any_paid_by_employee_CaptionLbl)
            {
            }
            column(V6__Value_of_perksCaption;V6__Value_of_perksCaptionLbl)
            {
            }
            column(V7__Motor_car_or_other_vehicle_Caption;V7__Motor_car_or_other_vehicle_CaptionLbl)
            {
            }
            column(V8__Domestic_ServantCaption;V8__Domestic_ServantCaptionLbl)
            {
            }
            column(V9__Travelling__Touring__accommodation_etc_Caption;V9__Travelling__Touring__accommodation_etc_CaptionLbl)
            {
            }
            column(V10__OthersCaption;V10__OthersCaptionLbl)
            {
            }
            column(V11__Total_PerksCaption;V11__Total_PerksCaptionLbl)
            {
            }
            column(Employee_No_;"No.")
            {
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
        PayYear.RESET;
        PayYear.SETFILTER(Type,'=%1',3);
        IF PayYear.FIND('-') THEN
          BEGIN
            PAYYEARID :=PayYear.ID;
            StDate :=PayYear."Year Start Date";
            EndDate :=PayYear."Year End Date"  ;
          END
        ELSE
          ERROR(Text0001);
    end;

    var
        Name : Text[100];
        Address3 : Text[1000];
        AmtUnder8 : Decimal;
        TotalAmtUnder9 : Decimal;
        AmtUnder9 : Decimal;
        TotalAmtUnder10 : Decimal;
        AmtUnder10 : Decimal;
        AmtUnder11 : Decimal;
        RvTaxMainSheet : Record "Tax Main Sheet";
        RVTaxSalaries : Record "Tax Salaries";
        AmtUnder12 : Decimal;
        AmtUnder13 : Decimal;
        AmtUnder14 : Decimal;
        AmtUnder15 : Decimal;
        AmtUnder16 : Decimal;
        AmtUnder17 : Decimal;
        AmtUnder18 : Decimal;
        AmtUnder19 : Decimal;
        AmtUnder20 : Decimal;
        AmtUnder21 : Decimal;
        AmtUnder22 : Decimal;
        AmtUnder23 : Decimal;
        AmtUnder24 : Decimal;
        AmtUnder25 : Decimal;
        AmtUnder26 : Decimal;
        AmtUnder27 : Decimal;
        AmtUnder28 : Decimal;
        AmtUnder29 : Decimal;
        AmtUnder30 : Decimal;
        PAYYEARID : Integer;
        AmtUnder19i : Decimal;
        AmtUnder19ii : Decimal;
        AmtUnder19iii : Decimal;
        AmtUnder19iv : Decimal;
        AmtUnder19v : Decimal;
        AmtUnder19vi : Decimal;
        AmtUnder19vii : Decimal;
        PayYear : Record "Pay Year";
        StDate : Date;
        EndDate : Date;
        PerksAmount1 : Decimal;
        PerksAmount2 : Decimal;
        PerksAmount3 : Decimal;
        PerksAmount4 : Decimal;
        PerksAmount5 : Decimal;
        PerksAmount6 : Decimal;
        PerksAmount7 : Decimal;
        PerksAmount8 : Decimal;
        PerksAmount9 : Decimal;
        PerksAmount10 : Decimal;
        PerksAmount11 : Decimal;
        RvSalarySub : Record "Tax Salaries Sub";
        RvTaxMonth : Record "Tax Months";
        Text0001 : Label 'There is no assessment year period defined in the masters.';
        Permanent_Account_Number_PAN__of_the_employee_See_note_8_CaptionLbl : Label 'Permanent Account Number(PAN) of the employee(See note 8)';
        Name_of_the_employeeCaptionLbl : Label 'Name of the employee';
        Residential_address_of_the_employeeCaptionLbl : Label 'Residential address of the employee';
        Occupational_clasificatoin_of_employement_Give_Code__See_Note_2_CaptionLbl : Label 'Occupational clasificatoin of employement Give Code (See Note 2)';
        V1__CaptionLbl : Label '(1).';
        V2__CaptionLbl : Label '(2).';
        V3__CaptionLbl : Label '(3).';
        V4__CaptionLbl : Label '(4).';
        V8__CaptionLbl : Label '(8).';
        V7__CaptionLbl : Label '(7).';
        V6__CaptionLbl : Label '(6).';
        V5__CaptionLbl : Label '(5).';
        Date_from_which_employeed_during_the_financial_yearCaptionLbl : Label 'Date from which employeed during the financial year';
        Date_upto_which_empmloyeed_during_the_financial_year_CaptionLbl : Label 'Date upto which empmloyeed during the financial year.';
        Serial_NumberCaptionLbl : Label 'Serial Number';
        Total_amount_of_salary_excluding_amount_required_to_be_shown_in_column_9_and_10CaptionLbl : Label 'Total amount of salary,excluding amount required to be shown in column 9 and 10';
        Total_amount_of_house_rent_allowance_and_other_allownaces_to_the_extent_chargeable_to_tax___see_section_10_13A__read_with_rulLbl : Label 'Total amount of house rent allowance and other allownaces to the extent chargeable to tax ( see section 10(13A) read with rule 2A ad section 10(14))';
        V9__CaptionLbl : Label '(9).';
        V10__CaptionLbl : Label '(10).';
        V11__CaptionLbl : Label '(11).';
        V12__CaptionLbl : Label '(12).';
        V13__CaptionLbl : Label '(13).';
        V14__CaptionLbl : Label '(14).';
        Value_of_prerequisite_and_amount_of_exemption_to_Employees_Provident_Fund_Account_as_per_Annexure_CaptionLbl : Label 'Value of prerequisite and amount of exemption to Employees Provident Fund Account as per Annexure.';
        Amount_of_allowances_and_prerequisite_claimed_as_exempt_and_not_included_in_columne_9_and_10_CaptionLbl : Label 'Amount of allowances and prerequisite claimed as exempt and not included in columne 9 and 10.';
        Total_of_column_8_9_and_10CaptionLbl : Label 'Total of column 8,9 and 10';
        Total_deduction_under_section_16_i__16_ii__16_iii____specify_each_deduction_separately_CaptionLbl : Label 'Total deduction under section 16(i),16(ii),16(iii) ( specify each deduction separately)';
        Income_chargeable_under_the_head__Salaries____Columns_12_minus_13_CaptionLbl : Label 'Income chargeable under the head ''Salaries'' ( Columns 12 minus 13)';
        Income__not_being_loss__under_any_head_other_then_Income_under_the_head__Salaries___Section_192_2B__CaptionLbl : Label 'Income (not being loss) under any head other then Income under the head ''Salaries'' [Section 192(2B)]';
        V17__CaptionLbl : Label '(17).';
        Gross_total_income__Total_of_columns_14_and_15_CaptionLbl : Label 'Gross total income( Total of columns 14 and 15)';
        V15__CaptionLbl : Label '(15).';
        Amount_deductible_under_section_80_G_in_respect_of_donation_to_certain_funds_Charitable_institutions_CaptionLbl : Label 'Amount deductible under section 80 G in respect of donation to certain funds,Charitable institutions.';
        V16__CaptionLbl : Label '(16).';
        V18__CaptionLbl : Label '(18).';
        Amount_deductible_under_section_80_G_in_respects_of_rent_paid_CaptionLbl : Label 'Amount deductible under section 80 G in respects of rent paid.';
        Amount_deductible_under_any_other_provision_of_chapter_VI_A__indicate_relevant_section_and_amount_deducted__CaptionLbl : Label 'Amount deductible under any other provision of chapter VI-A( indicate relevant section and amount deducted).';
        Total_amount_deductible_under_chapter_VI_A__Total_of_column_17_18_and_19_CaptionLbl : Label 'Total amount deductible under chapter VI-A( Total of column 17,18 and 19)';
        Total_taxable_income__column_16__column_20_CaptionLbl : Label 'Total taxable income( column 16- column 20)';
        Income_tax__on_total_incomeCaptionLbl : Label 'Income-tax  on total income';
        V19__CaptionLbl : Label '(19).';
        V20__CaptionLbl : Label '(20).';
        V21__CaptionLbl : Label '(21).';
        V22__CaptionLbl : Label '(22).';
        Income_tax_rebate_under_section_88_on_life_insurance__Premium__contribution_to_provident_Fund_etc__see_notes_4_and_5___CaptioLbl : Label 'Income tax rebate under section 88 on life insurance( Premium, contribution to provident Fund etc (see notes 4 and 5) )';
        Income_releif_under_section_89__when_salary_etc_is_paid_in__arrears_or_in_advance_CaptionLbl : Label 'Income releif under section 89, when salary etc.is paid in  arrears or in advance.';
        Total_income_tax_payable___column_22_minus_total_of_column_23_and_24___and_surcharge_thereonCaptionLbl : Label 'Total income-tax payable ( column 22 minus total of column 23 and 24 ) and surcharge thereon';
        Tax_deducted_ate_source_Income_TaxCaptionLbl : Label 'Tax deducted ate source-Income Tax';
        Tax_deducted_at_source_surchargeCaptionLbl : Label 'Tax deducted at source-surcharge';
        Total_Income_tax_deducted_at_source__Total_of_column_26_and_column_27_CaptionLbl : Label 'Total Income-tax deducted at source (Total of column 26 and column 27)';
        Tax_payable_refundable__Difference_of_columns_25_and_28_CaptionLbl : Label 'Tax payable/refundable (Difference of columns 25 and 28)';
        Remarks__See_Notes_6_and_7_CaptionLbl : Label 'Remarks (See Notes 6 and 7)';
        V23__CaptionLbl : Label '(23).';
        V24__CaptionLbl : Label '(24).';
        V25__CaptionLbl : Label '(25).';
        V26__CaptionLbl : Label '(26).';
        V27__CaptionLbl : Label '(27).';
        V28__CaptionLbl : Label '(28).';
        V29__CaptionLbl : Label '(29).';
        V30__CaptionLbl : Label '(30).';
        i__80_CCC__Pension_Fund_CaptionLbl : Label '(i) 80 CCC (Pension Fund)';
        ii__80_D__Mediclaim_CaptionLbl : Label '(ii) 80 D (Mediclaim)';
        iii__80_DD__Handicapped_dependents_CaptionLbl : Label '(iii) 80 DD (Handicapped dependents)';
        iv__80_DDB__Medical_exp__for_specified_deceasesCaptionLbl : Label '(iv) 80 DDB (Medical exp. for specified deceases';
        v__80_E__Repayment_of_loan_for_education_CaptionLbl : Label '(v) 80 E (Repayment of loan for education)';
        vi__80_L__Interest_Dividends__etc___from_all_investment_deposit_mentioned_in_Act_CaptionLbl : Label '(vi) 80 L (Interest/Dividends, etc., from all investment/deposit mentioned in Act)';
        vii____80_U__Physically_handicapped_CaptionLbl : Label '(vii) * 80 U (Physically handicapped)';
        Total_of_19_i____19_vii_CaptionLbl : Label 'Total of 19(i) - 19(vii)';
        CurrReport_PAGENOCaptionLbl : Label 'Page';
        Form_24_AnnexureCaptionLbl : Label 'Form 24 Annexure';
        Particulars_of_value_of_Perks____CaptionLbl : Label 'Particulars of value of Perks : -';
        V1__Value_as_if_accomodation_is_unfurnished_CaptionLbl : Label '1) Value as if accomodation is unfurnished.';
        V2__Cost_Rent_of_FurnitureCaptionLbl : Label '2) Cost/Rent of Furniture';
        V3__Perks_of_FurnitureCaptionLbl : Label '3) Perks of Furniture';
        V4__Total_Perks_of_accommodation_CaptionLbl : Label '4) Total Perks of accommodation.';
        V5___Rent_if_any_paid_by_employee_CaptionLbl : Label '5). Rent if any paid by employee.';
        V6__Value_of_perksCaptionLbl : Label '6) Value of perks';
        V7__Motor_car_or_other_vehicle_CaptionLbl : Label '7) Motor car or other vehicle.';
        V8__Domestic_ServantCaptionLbl : Label '8) Domestic Servant';
        V9__Travelling__Touring__accommodation_etc_CaptionLbl : Label '9) Travelling, Touring, accommodation etc.';
        V10__OthersCaptionLbl : Label '10) Others';
        V11__Total_PerksCaptionLbl : Label '11) Total Perks';
}

