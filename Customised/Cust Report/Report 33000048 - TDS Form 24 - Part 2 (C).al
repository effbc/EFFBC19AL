report 33000048 "TDS Form 24 - Part 2 (C)"
{
    // version NEOGYNPAY13.70.00.06

    DefaultLayout = RDLC;
    RDLCLayout = './TDS Form 24 - Part 2 (C).rdlc';

    dataset
    {
        dataitem(Employee; Employee)
        {
            column(CurrReport_PAGENO; CurrReport.PAGENO)
            {
            }
            column(Column22; Column22)
            {
            }
            column(Column23; Column23)
            {
            }
            column(Column24; Column24)
            {
            }
            column(Column22_____Column23___Column24_; Column22 - (Column23 + Column24))
            {
            }
            column(Column26; Column26)
            {
            }
            column(Column27; Column27)
            {
            }
            column(Column26___Column27; Column26 + Column27)
            {
            }
            column(column29; column29)
            {
            }
            column(Column23A; Column23A)
            {
            }
            column(Column23B; Column23B)
            {
            }
            column(Employee__First_Name______Employee__Last_Name_; Employee."First Name" + ' ' + Employee."Last Name")
            {
            }
            column(SlNo; SlNo)
            {
            }
            column(Employee__PAN_No_; "PAN No")
            {
            }
            column(Income_tax_on_total_incomeCaption; Income_tax_on_total_incomeCaptionLbl)
            {
            }
            column(V22_Caption; V22_CaptionLbl)
            {
            }
            column(Income_tax_rebate_under_section_88_on_life_insurance_premium_contribution_to_PF_etcCaption; Income_tax_rebate_under_section_88_on_life_insurance_premium_contribution_to_PF_etcCaptionLbl)
            {
            }
            column(V23_Caption; V23_CaptionLbl)
            {
            }
            column(V24_Caption; V24_CaptionLbl)
            {
            }
            column(Income_tax_relief_under_section_89__when_salary_etc__is_paid_in_arrears_or_in_advanceCaption; Income_tax_relief_under_section_89__when_salary_etc__is_paid_in_arrears_or_in_advanceCaptionLbl)
            {
            }
            column(Total_income_tax_payable__Column_22_minus_total_of_columns_23_and_24__and_surchage_thereonCaption; Total_income_tax_payable__Column_22_minus_total_of_columns_23_and_24__and_surchage_thereonCaptionLbl)
            {
            }
            column(V25_Caption; V25_CaptionLbl)
            {
            }
            column(Tax_deducted_at_source___Income_taxCaption; Tax_deducted_at_source___Income_taxCaptionLbl)
            {
            }
            column(V26_Caption; V26_CaptionLbl)
            {
            }
            column(Tax_deducted_at_source___surchargeCaption; Tax_deducted_at_source___surchargeCaptionLbl)
            {
            }
            column(Total_Income_tax_deducted_at_sourceCaption; Total_Income_tax_deducted_at_sourceCaptionLbl)
            {
            }
            column(Tax_payable_refundableCaption; Tax_payable_refundableCaptionLbl)
            {
            }
            column(RemarksCaption; RemarksCaptionLbl)
            {
            }
            column(V27_Caption; V27_CaptionLbl)
            {
            }
            column(V28_Caption; V28_CaptionLbl)
            {
            }
            column(V29_Caption; V29_CaptionLbl)
            {
            }
            column(V30_Caption; V30_CaptionLbl)
            {
            }
            column(Income_tax_rebate_under_section_88_B_for_senior_citizensCaption; Income_tax_rebate_under_section_88_B_for_senior_citizensCaptionLbl)
            {
            }
            column(Income_tax_rebate_under_section_88_C_for_womenCaption; Income_tax_rebate_under_section_88_C_for_womenCaptionLbl)
            {
            }
            column(V23_A_Caption; V23_A_CaptionLbl)
            {
            }
            column(V23_B_Caption; V23_B_CaptionLbl)
            {
            }
            column(PageCaption; PageCaptionLbl)
            {
            }
            column(Sl__No_Caption; Sl__No_CaptionLbl)
            {
            }
            column(PAN_No_Caption; PAN_No_CaptionLbl)
            {
            }
            column(Name_Of_EmployeeCaption; Name_Of_EmployeeCaptionLbl)
            {
            }
            column(Employee_No_; "No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                Employee.RESET;
                Employee.SETFILTER("Leave Date", '>%1|%2', CALCDATE('-1Y', StDate), 0D);
                Employee.SETFILTER("Employment Date", '<%1', CALCDATE('-1Y', EndDate));
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
        SlNo: Integer;
        StDate: Date;
        EndDate: Date;
        PAYYEARID: Integer;
        PayYear: Record "Pay Year";
        Text0001: Label 'Please setup Assesment Year';
        Column22: Decimal;
        Column23: Decimal;
        Column23A: Decimal;
        Column23B: Decimal;
        Column24: Decimal;
        column25: Decimal;
        Column26: Decimal;
        Column27: Decimal;
        column29: Integer;
        TaxMainSheet: Record "Tax Main Sheet";
        TaxSalaries: Record "Tax Salaries";
        PayTaxPolicy: Record "Pay Tax Policy";
        SurchargeRate: Decimal;
        var1: Decimal;
        var2: Decimal;
        var3: Decimal;
        var4: Decimal;
        var5: Decimal;
        Income_tax_on_total_incomeCaptionLbl: Label 'Income-tax on total income';
        V22_CaptionLbl: Label '(22)';
        Income_tax_rebate_under_section_88_on_life_insurance_premium_contribution_to_PF_etcCaptionLbl: Label 'Income tax rebate under section 88 on life insurance premium contribution to PF etc';
        V23_CaptionLbl: Label '(23)';
        V24_CaptionLbl: Label '(24)';
        Income_tax_relief_under_section_89__when_salary_etc__is_paid_in_arrears_or_in_advanceCaptionLbl: Label 'Income tax relief under section 89, when salary etc. is paid in arrears or in advance';
        Total_income_tax_payable__Column_22_minus_total_of_columns_23_and_24__and_surchage_thereonCaptionLbl: Label 'Total income-tax payable (Column 22 minus total of columns 23 and 24) and surchage thereon';
        V25_CaptionLbl: Label '(25)';
        Tax_deducted_at_source___Income_taxCaptionLbl: Label 'Tax deducted at source - Income tax';
        V26_CaptionLbl: Label '(26)';
        Tax_deducted_at_source___surchargeCaptionLbl: Label 'Tax deducted at source - surcharge';
        Total_Income_tax_deducted_at_sourceCaptionLbl: Label 'Total Income tax deducted at source';
        Tax_payable_refundableCaptionLbl: Label 'Tax payable/refundable';
        RemarksCaptionLbl: Label 'Remarks';
        V27_CaptionLbl: Label '(27)';
        V28_CaptionLbl: Label '(28)';
        V29_CaptionLbl: Label '(29)';
        V30_CaptionLbl: Label '(30)';
        Income_tax_rebate_under_section_88_B_for_senior_citizensCaptionLbl: Label 'Income tax rebate under section 88 B for senior citizens';
        Income_tax_rebate_under_section_88_C_for_womenCaptionLbl: Label 'Income tax rebate under section 88 C for women';
        V23_A_CaptionLbl: Label '(23 A)';
        V23_B_CaptionLbl: Label '(23 B)';
        PageCaptionLbl: Label 'Page';
        Sl__No_CaptionLbl: Label 'Sl. No.';
        PAN_No_CaptionLbl: Label 'PAN No.';
        Name_Of_EmployeeCaptionLbl: Label 'Name Of Employee';
}

