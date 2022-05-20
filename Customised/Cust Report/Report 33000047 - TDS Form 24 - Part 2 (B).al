report 33000047 "TDS Form 24 - Part 2 (B)"
{
    // version NEOGYNPAY13.70.00.06

    DefaultLayout = RDLC;
    RDLCLayout = './TDS Form 24 - Part 2 (B).rdlc';

    dataset
    {
        dataitem(Employee;Employee)
        {
            column(CurrReport_PAGENO;CurrReport.PAGENO)
            {
            }
            column(Column8;Column8)
            {
            }
            column(Column9;Column9)
            {
            }
            column(Column10;Column10)
            {
            }
            column(Column11;Column11)
            {
            }
            column(Column8___Column9___Column10;Column8 + Column9 + Column10)
            {
            }
            column(Column13_16_1;Column13_16_1)
            {
            }
            column(Column13_16_2;Column13_16_2)
            {
            }
            column(Column13_16_3;Column13_16_3)
            {
            }
            column(Column8___Column9___Column10_______Column13_16_1___Column13_16_2___Column13_16_3_;(Column8 + Column9 + Column10 ) - ( Column13_16_1 + Column13_16_2 + Column13_16_3))
            {
            }
            column(Column8___Column9___Column10_______Column13_16_1___Column13_16_2___Column13_16_3____Column15;(Column8 + Column9 + Column10 ) - ( Column13_16_1 + Column13_16_2 + Column13_16_3) + Column15)
            {
            }
            column(Column15;Column15)
            {
            }
            column(Column17;Column17)
            {
            }
            column(Column18;Column18)
            {
            }
            column(Column19;Column19)
            {
            }
            column(Column17___Column18___Column19;Column17 + Column18 + Column19)
            {
            }
            column(DataItem54;((Column8 + Column9 + Column10 ) - ( Column13_16_1 + Column13_16_2 + Column13_16_3) + Column15) - (Column17 + Column18 + Column19))
            {
            }
            column(Column13_16_1___Column13_16_2___Column13_16_3;Column13_16_1 + Column13_16_2 + Column13_16_3)
            {
            }
            column(Employee__First_Name______Employee__Last_Name_;Employee."First Name"+' '+Employee."Last Name")
            {
            }
            column(Total_amount_of_salary__excluding_amount_required_to_be_shown_in_coloumns_9___10Caption;Total_amount_of_salary__excluding_amount_required_to_be_shown_in_coloumns_9___10CaptionLbl)
            {
            }
            column(V8_Caption;V8_CaptionLbl)
            {
            }
            column(Total_amount_of_HRA_and_other_allowances_to_the_exrend_chargable_to_taxCaption;Total_amount_of_HRA_and_other_allowances_to_the_exrend_chargable_to_taxCaptionLbl)
            {
            }
            column(V9_Caption;V9_CaptionLbl)
            {
            }
            column(V10_Caption;V10_CaptionLbl)
            {
            }
            column(Value_of_perquisites_and_amount_of_accretion_to_employee_s_PF_as_per_AnnexureCaption;Value_of_perquisites_and_amount_of_accretion_to_employee_s_PF_as_per_AnnexureCaptionLbl)
            {
            }
            column(Amount_of_allowances_and_perquisites_clamined_as_exempt_and_not_included_in_columns_9_and_10Caption;Amount_of_allowances_and_perquisites_clamined_as_exempt_and_not_included_in_columns_9_and_10CaptionLbl)
            {
            }
            column(V11_Caption;V11_CaptionLbl)
            {
            }
            column(Total_of_columns_8__9_and_10Caption;Total_of_columns_8__9_and_10CaptionLbl)
            {
            }
            column(V12_Caption;V12_CaptionLbl)
            {
            }
            column(Total_deductions_under_16_i___16_ii__and_16_iii_Caption;Total_deductions_under_16_i___16_ii__and_16_iii_CaptionLbl)
            {
            }
            column(Income_chargable_under_the_heads__salaries___Column_12_minius_13_Caption;Income_chargable_under_the_heads__salaries___Column_12_minius_13_CaptionLbl)
            {
            }
            column(Income__not_being_loss__under_any_head_than_Income_under_the_head__Salaries___Section_192_2B__Caption;Income__not_being_loss__under_any_head_than_Income_under_the_head__Salaries___Section_192_2B__CaptionLbl)
            {
            }
            column(Gross_total_income__total_of_coloumns_14_and_15_Caption;Gross_total_income__total_of_coloumns_14_and_15_CaptionLbl)
            {
            }
            column(V13_Caption;V13_CaptionLbl)
            {
            }
            column(V14_Caption;V14_CaptionLbl)
            {
            }
            column(V15_Caption;V15_CaptionLbl)
            {
            }
            column(V16_Caption;V16_CaptionLbl)
            {
            }
            column(Total_deductible_under_section_80G_in_respect_of_donations_to_certain_funds__charitable_institutionsCaption;Total_deductible_under_section_80G_in_respect_of_donations_to_certain_funds__charitable_institutionsCaptionLbl)
            {
            }
            column(Amount_deductible_under_section_80GG_in_respect_of_rents_paidCaption;Amount_deductible_under_section_80GG_in_respect_of_rents_paidCaptionLbl)
            {
            }
            column(Amount_deductible_under_any_other_provision_of_Chapter_VI_A__indicate_relevant_section_and_amount_deducted_Caption;Amount_deductible_under_any_other_provision_of_Chapter_VI_A__indicate_relevant_section_and_amount_deducted_CaptionLbl)
            {
            }
            column(Total_amount_deductible_under_Chapter_VI_A__Total_of_coloumns_17__18__and_19__Caption;Total_amount_deductible_under_Chapter_VI_A__Total_of_coloumns_17__18__and_19__CaptionLbl)
            {
            }
            column(V17_Caption;V17_CaptionLbl)
            {
            }
            column(V18_Caption;V18_CaptionLbl)
            {
            }
            column(V19_Caption;V19_CaptionLbl)
            {
            }
            column(V20_Caption;V20_CaptionLbl)
            {
            }
            column(V21_Caption;V21_CaptionLbl)
            {
            }
            column(Total_taxable_income__coloumn_16_minus_coloumn_20_Caption;Total_taxable_income__coloumn_16_minus_coloumn_20_CaptionLbl)
            {
            }
            column(Std__ded_Caption;Std__ded_CaptionLbl)
            {
            }
            column(E__Allow_Caption;E__Allow_CaptionLbl)
            {
            }
            column(Prof__taxCaption;Prof__taxCaptionLbl)
            {
            }
            column(PageCaption;PageCaptionLbl)
            {
            }
            column(Name_of_the_employeeCaption;Name_of_the_employeeCaptionLbl)
            {
            }
            column(Employee_No_;"No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                Employee.RESET;
                Employee.SETFILTER("Leave Date",'>%1|%2',CALCDATE('-1Y',StDate),0D);
                Employee.SETFILTER("Employment Date",'<%1',CALCDATE('-1Y',EndDate));
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
        SlNo : Integer;
        StDate : Date;
        EndDate : Date;
        PAYYEARID : Integer;
        PayYear : Record "Pay Year";
        Text0001 : Label 'Please setup Assesment Year';
        Column8 : Decimal;
        Column9 : Decimal;
        Column13_16_1 : Decimal;
        Column13_16_2 : Decimal;
        Column13_16_3 : Decimal;
        Column15 : Decimal;
        Column17 : Decimal;
        Column18 : Decimal;
        Column19 : Decimal;
        AllowExempt : Decimal;
        PerksExempt : Decimal;
        Column10 : Decimal;
        Column11 : Decimal;
        TaxMainSheet : Record "Tax Main Sheet";
        TaxSalaries : Record "Tax Salaries";
        TaxSalariesSub : Record "Tax Salaries Sub";
        Total_amount_of_salary__excluding_amount_required_to_be_shown_in_coloumns_9___10CaptionLbl : Label 'Total amount of salary, excluding amount required to be shown in coloumns 9 & 10';
        V8_CaptionLbl : Label '(8)';
        Total_amount_of_HRA_and_other_allowances_to_the_exrend_chargable_to_taxCaptionLbl : Label 'Total amount of HRA and other allowances to the exrend chargable to tax';
        V9_CaptionLbl : Label '(9)';
        V10_CaptionLbl : Label '(10)';
        Value_of_perquisites_and_amount_of_accretion_to_employee_s_PF_as_per_AnnexureCaptionLbl : Label 'Value of perquisites and amount of accretion to employee''s PF as per Annexure';
        Amount_of_allowances_and_perquisites_clamined_as_exempt_and_not_included_in_columns_9_and_10CaptionLbl : Label 'Amount of allowances and perquisites clamined as exempt and not included in columns 9 and 10';
        V11_CaptionLbl : Label '(11)';
        Total_of_columns_8__9_and_10CaptionLbl : Label 'Total of columns 8, 9 and 10';
        V12_CaptionLbl : Label '(12)';
        Total_deductions_under_16_i___16_ii__and_16_iii_CaptionLbl : Label 'Total deductions under 16(i), 16(ii) and 16(iii)';
        Income_chargable_under_the_heads__salaries___Column_12_minius_13_CaptionLbl : Label 'Income chargable under the heads "salaries" (Column 12 minius 13)';
        Income__not_being_loss__under_any_head_than_Income_under_the_head__Salaries___Section_192_2B__CaptionLbl : Label 'Income (not being loss) under any head than Income under the head "Salaries" [Section 192(2B)]';
        Gross_total_income__total_of_coloumns_14_and_15_CaptionLbl : Label 'Gross total income (total of coloumns 14 and 15)';
        V13_CaptionLbl : Label '(13)';
        V14_CaptionLbl : Label '(14)';
        V15_CaptionLbl : Label '(15)';
        V16_CaptionLbl : Label '(16)';
        Total_deductible_under_section_80G_in_respect_of_donations_to_certain_funds__charitable_institutionsCaptionLbl : Label 'Total deductible under section 80G in respect of donations to certain funds, charitable institutions';
        Amount_deductible_under_section_80GG_in_respect_of_rents_paidCaptionLbl : Label 'Amount deductible under section 80GG in respect of rents paid';
        Amount_deductible_under_any_other_provision_of_Chapter_VI_A__indicate_relevant_section_and_amount_deducted_CaptionLbl : Label 'Amount deductible under any other provision of Chapter VI-A (indicate relevant section and amount deducted)';
        Total_amount_deductible_under_Chapter_VI_A__Total_of_coloumns_17__18__and_19__CaptionLbl : Label '"Total amount deductible under Chapter VI-A (Total of coloumns 17, 18, and 19) "';
        V17_CaptionLbl : Label '(17)';
        V18_CaptionLbl : Label '(18)';
        V19_CaptionLbl : Label '(19)';
        V20_CaptionLbl : Label '(20)';
        V21_CaptionLbl : Label '(21)';
        Total_taxable_income__coloumn_16_minus_coloumn_20_CaptionLbl : Label 'Total taxable income (coloumn 16 minus coloumn 20)';
        Std__ded_CaptionLbl : Label 'Std. ded.';
        E__Allow_CaptionLbl : Label 'E. Allow.';
        Prof__taxCaptionLbl : Label 'Prof. tax';
        PageCaptionLbl : Label 'Page';
        Name_of_the_employeeCaptionLbl : Label 'Name of the employee';
}

