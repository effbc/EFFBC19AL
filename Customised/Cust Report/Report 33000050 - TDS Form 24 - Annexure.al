report 33000050 "TDS Form 24 - Annexure"
{
    // version NEOGYNPAY13.70.00.06

    DefaultLayout = RDLC;
    RDLCLayout = './TDS Form 24 - Annexure.rdlc';

    dataset
    {
        dataitem(Employee; Employee)
        {
            column(CompanyInfo__Address_2_; CompanyInfo."Address 2")
            {
            }
            column(CompanyInfo_City; CompanyInfo.City)
            {
            }
            column(CompanyInfo_Address; CompanyInfo.Address)
            {
            }
            column(CompanyInfo__Post_Code_; CompanyInfo."Post Code")
            {
            }
            column(CompanyInfo_Name; CompanyInfo.Name)
            {
            }
            column(CompanyPolicy__Company_Classification_Code_; CompanyPolicy."Company Classification Code")
            {
            }
            column(CompanyInfo__P_A_N__No__; CompanyInfo."P.A.N. No.")
            {
            }
            column(CompanyInfo__T_A_N__No__; CompanyInfo."T.A.N. No.")
            {
            }
            column(FORMAT___CALCDATE___1Y__EndDate____0____Day___Month_Text___Year4___; FORMAT(CALCDATE('-1Y', EndDate), 0, '<Day> <Month Text> <Year4>'))
            {
            }
            column(CurrReport_PAGENO; CurrReport.PAGENO)
            {
            }
            column(Employee__First_Name__________Employee__Last_Name_; Employee."First Name" + ' ' + Employee."Last Name")
            {
            }
            column(SlNo; SlNo)
            {
            }
            column(Column3; Column3)
            {
            }
            column(Column4; Column4)
            {
            }
            column(Column5; Column5)
            {
            }
            column(Column6; Column6)
            {
            }
            column(Column7; Column7)
            {
            }
            column(Column8; Column8)
            {
            }
            column(Column9; Column9)
            {
            }
            column(Column10; Column10)
            {
            }
            column(Column11; Column11)
            {
            }
            column(Column12; Column12)
            {
            }
            column(Column13; Column13)
            {
            }
            column(Column14; Column14)
            {
            }
            column(Column15; Column15)
            {
            }
            column(Column16; Column16)
            {
            }
            column(PINCaption; PINCaptionLbl)
            {
            }
            column(Name_of_the_EmployerCaption; Name_of_the_EmployerCaptionLbl)
            {
            }
            column(Address_of_the_EmployerCaption; Address_of_the_EmployerCaptionLbl)
            {
            }
            column(Employer_Classification_CodeCaption; Employer_Classification_CodeCaptionLbl)
            {
            }
            column(V2_Caption; V2_CaptionLbl)
            {
            }
            column(V3_Caption; V3_CaptionLbl)
            {
            }
            column(a_Caption; a_CaptionLbl)
            {
            }
            column(b_Caption; b_CaptionLbl)
            {
            }
            column(b_Caption_Control31; b_Caption_Control31Lbl)
            {
            }
            column(Permanent_Account_No_Caption; Permanent_Account_No_CaptionLbl)
            {
            }
            column(Tax_Deduction_Account_No_Caption; Tax_Deduction_Account_No_CaptionLbl)
            {
            }
            column(a_Caption_Control37; a_Caption_Control37Lbl)
            {
            }
            column(V1_Caption; V1_CaptionLbl)
            {
            }
            column(FORM_24_AnnexureCaption; FORM_24_AnnexureCaptionLbl)
            {
            }
            column(Particulars_of_value_of_perquisites_to_employee_s_Provident_Fund_account_for_the_year_ending_Caption; Particulars_of_value_of_perquisites_to_employee_s_Provident_Fund_account_for_the_year_ending_CaptionLbl)
            {
            }
            column(Name_of_EmployeeCaption; Name_of_EmployeeCaptionLbl)
            {
            }
            column(Employee_s_S__No__in_FORM_24Caption; Employee_s_S__No__in_FORM_24CaptionLbl)
            {
            }
            column(Value_of_rent_free_accommodation_or_value_of_any_concession_in_rent_for_the_accomodation_provided_by_the_employerCaption; Value_of_rent_free_accommodation_or_value_of_any_concession_in_rent_for_the_accomodation_provided_by_the_employerCaptionLbl)
            {
            }
            column(Where_accomodation_is_furnishedCaption; Where_accomodation_is_furnishedCaptionLbl)
            {
            }
            column(Where_accomodation_is_furnishedCaption_Control6; Where_accomodation_is_furnishedCaption_Control6Lbl)
            {
            }
            column(Value_as_if_accomodation_is_unfurnishedCaption; Value_as_if_accomodation_is_unfurnishedCaptionLbl)
            {
            }
            column(Cost_of_furnitureCaption; Cost_of_furnitureCaptionLbl)
            {
            }
            column(Perquisite_value_of_furnitureCaption; Perquisite_value_of_furnitureCaptionLbl)
            {
            }
            column(V1_Caption_Control12; V1_Caption_Control12Lbl)
            {
            }
            column(V2_Caption_Control13; V2_Caption_Control13Lbl)
            {
            }
            column(V3_Caption_Control14; V3_Caption_Control14Lbl)
            {
            }
            column(V4_Caption; V4_CaptionLbl)
            {
            }
            column(V5_Caption; V5_CaptionLbl)
            {
            }
            column(V6_Caption; V6_CaptionLbl)
            {
            }
            column(Total_of_Columns_4_and_6Caption; Total_of_Columns_4_and_6CaptionLbl)
            {
            }
            column(Rent_if_any_paid_by_the_employeeCaption; Rent_if_any_paid_by_the_employeeCaptionLbl)
            {
            }
            column(Value_of_perquisite_Caption; Value_of_perquisite_CaptionLbl)
            {
            }
            column(Conveyance_AllowanceCaption; Conveyance_AllowanceCaptionLbl)
            {
            }
            column(Renumeration_for_domestic_helpCaption; Renumeration_for_domestic_helpCaptionLbl)
            {
            }
            column(Travelling_AllowanceCaption; Travelling_AllowanceCaptionLbl)
            {
            }
            column(Estimated_value_of_other_benefits_not_included_in_preceeding_coloumnsCaption; Estimated_value_of_other_benefits_not_included_in_preceeding_coloumnsCaptionLbl)
            {
            }
            column(Employer_s_contribution_to_regognised_PF_in_excess_of_10__of_emploee_s_shareCaption; Employer_s_contribution_to_regognised_PF_in_excess_of_10__of_emploee_s_shareCaptionLbl)
            {
            }
            column(Interest_credited_to_the_assesse_s_account_in_recognised_PF_in_excess_of_rate_fixed_by_govermentCaption; Interest_credited_to_the_assesse_s_account_in_recognised_PF_in_excess_of_rate_fixed_by_govermentCaptionLbl)
            {
            }
            column(Total_of_columns_9_to_15Caption; Total_of_columns_9_to_15CaptionLbl)
            {
            }
            column(V7_Caption; V7_CaptionLbl)
            {
            }
            column(V8_Caption; V8_CaptionLbl)
            {
            }
            column(V9_Caption; V9_CaptionLbl)
            {
            }
            column(V10_Caption; V10_CaptionLbl)
            {
            }
            column(V11_Caption; V11_CaptionLbl)
            {
            }
            column(V12_Caption; V12_CaptionLbl)
            {
            }
            column(V13_Caption; V13_CaptionLbl)
            {
            }
            column(V14_Caption; V14_CaptionLbl)
            {
            }
            column(V15_Caption; V15_CaptionLbl)
            {
            }
            column(V16_Caption; V16_CaptionLbl)
            {
            }
            column(PageCaption; PageCaptionLbl)
            {
            }
            column(Employee_No_; "No.")
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

    trigger OnPreReport();
    begin
        CompanyInfo.GET;
        CompanyPolicy.GET;
        SlNo := 0;
    end;

    var
        PAYYEARID: Integer;
        StDate: Date;
        EndDate: Date;
        PayYear: Record "Pay Year";
        Text0001: Label 'Assesment Year not defined';
        CompanyInfo: Record "Company Information";
        CompanyPolicy: Record "Pay Company Policy";
        TaxMonths: Record "Tax Months";
        TaxSalary: Record "Tax Salaries";
        TaxSalarySub: Record "Tax Salaries Sub";
        SlNo: Integer;
        Column3: Decimal;
        Column4: Decimal;
        Column5: Decimal;
        Column6: Decimal;
        Column7: Decimal;
        Column8: Decimal;
        Column9: Decimal;
        Column10: Decimal;
        Column11: Decimal;
        Column12: Decimal;
        Column13: Decimal;
        Column14: Decimal;
        Column15: Decimal;
        Column16: Decimal;
        PINCaptionLbl: Label 'PIN';
        Name_of_the_EmployerCaptionLbl: Label 'Name of the Employer';
        Address_of_the_EmployerCaptionLbl: Label 'Address of the Employer';
        Employer_Classification_CodeCaptionLbl: Label 'Employer Classification Code';
        V2_CaptionLbl: Label '2.';
        V3_CaptionLbl: Label '3.';
        a_CaptionLbl: Label '(a)';
        b_CaptionLbl: Label '(b)';
        b_Caption_Control31Lbl: Label '(b)';
        Permanent_Account_No_CaptionLbl: Label 'Permanent Account No.';
        Tax_Deduction_Account_No_CaptionLbl: Label 'Tax Deduction Account No.';
        a_Caption_Control37Lbl: Label '(a)';
        V1_CaptionLbl: Label '1.';
        FORM_24_AnnexureCaptionLbl: Label 'FORM 24 Annexure';
        Particulars_of_value_of_perquisites_to_employee_s_Provident_Fund_account_for_the_year_ending_CaptionLbl: Label '"Particulars of value of perquisites to employee''s Provident Fund account for the year ending "';
        Name_of_EmployeeCaptionLbl: Label 'Name of Employee';
        Employee_s_S__No__in_FORM_24CaptionLbl: Label 'Employee''s S. No. in FORM 24';
        Value_of_rent_free_accommodation_or_value_of_any_concession_in_rent_for_the_accomodation_provided_by_the_employerCaptionLbl: Label 'Value of rent free accommodation or value of any concession in rent for the accomodation provided by the employer';
        Where_accomodation_is_furnishedCaptionLbl: Label 'Where accomodation is furnished';
        Where_accomodation_is_furnishedCaption_Control6Lbl: Label 'Where accomodation is furnished';
        Value_as_if_accomodation_is_unfurnishedCaptionLbl: Label 'Value as if accomodation is unfurnished';
        Cost_of_furnitureCaptionLbl: Label 'Cost of furniture';
        Perquisite_value_of_furnitureCaptionLbl: Label 'Perquisite value of furniture';
        V1_Caption_Control12Lbl: Label '(1)';
        V2_Caption_Control13Lbl: Label '(2)';
        V3_Caption_Control14Lbl: Label '(3)';
        V4_CaptionLbl: Label '(4)';
        V5_CaptionLbl: Label '(5)';
        V6_CaptionLbl: Label '(6)';
        Total_of_Columns_4_and_6CaptionLbl: Label 'Total of Columns 4 and 6';
        Rent_if_any_paid_by_the_employeeCaptionLbl: Label 'Rent if any paid by the employee';
        Value_of_perquisite_CaptionLbl: Label '"Value of perquisite "';
        Conveyance_AllowanceCaptionLbl: Label 'Conveyance Allowance';
        Renumeration_for_domestic_helpCaptionLbl: Label 'Renumeration for domestic help';
        Travelling_AllowanceCaptionLbl: Label 'Travelling Allowance';
        Estimated_value_of_other_benefits_not_included_in_preceeding_coloumnsCaptionLbl: Label 'Estimated value of other benefits not included in preceeding coloumns';
        Employer_s_contribution_to_regognised_PF_in_excess_of_10__of_emploee_s_shareCaptionLbl: Label 'Employer''s contribution to regognised PF in excess of 10% of emploee''s share';
        Interest_credited_to_the_assesse_s_account_in_recognised_PF_in_excess_of_rate_fixed_by_govermentCaptionLbl: Label 'Interest credited to the assesse''s account in recognised PF in excess of rate fixed by goverment';
        Total_of_columns_9_to_15CaptionLbl: Label 'Total of columns 9 to 15';
        V7_CaptionLbl: Label '(7)';
        V8_CaptionLbl: Label '(8)';
        V9_CaptionLbl: Label '(9)';
        V10_CaptionLbl: Label '(10)';
        V11_CaptionLbl: Label '(11)';
        V12_CaptionLbl: Label '(12)';
        V13_CaptionLbl: Label '(13)';
        V14_CaptionLbl: Label '(14)';
        V15_CaptionLbl: Label '(15)';
        V16_CaptionLbl: Label '(16)';
        PageCaptionLbl: Label 'Page';
}

