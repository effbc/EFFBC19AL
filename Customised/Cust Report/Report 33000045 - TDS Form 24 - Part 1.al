report 33000045 "TDS Form 24 - Part 1"
{
    // version NEOGYNPAY13.70.00.06

    DefaultLayout = RDLC;
    RDLCLayout = './TDS Form 24 - Part 1.rdlc';

    dataset
    {
        dataitem("Pay Company Policy";"Pay Company Policy")
        {
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
            column(FORMAT___CALCDATE___1Y__EndDate____0____Day___Month_Text___Year4___;FORMAT ( CALCDATE('-1Y',EndDate) , 0 ,'<Day> <Month Text> <Year4>'))
            {
            }
            column(CompanyInfo__T_A_N__No__;CompanyInfo."T.A.N. No.")
            {
            }
            column(Pay_Company_Policy__Company_Classification_Code_;"Company Classification Code")
            {
            }
            column(CompanyInfo__P_A_N__No__;CompanyInfo."P.A.N. No.")
            {
            }
            column(CompanyInfo_Name;CompanyInfo.Name)
            {
            }
            column(CompanyInfo_Address;CompanyInfo.Address)
            {
            }
            column(CompanyInfo__Address_2_;CompanyInfo."Address 2")
            {
            }
            column(CompanyInfo_City;CompanyInfo.City)
            {
            }
            column(CompanyInfo__Post_Code_;CompanyInfo."Post Code")
            {
            }
            column(FORM_24Caption;FORM_24CaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
            {
            }
            column(FORM_NO__24Caption;FORM_NO__24CaptionLbl)
            {
            }
            column(See_section_192_and_rule_37__Caption;See_section_192_and_rule_37__CaptionLbl)
            {
            }
            column(Annual_return_of__Salaries__under_section_206_of_the_Income_tax_Act__1961_for_the_year_ending_Caption;Annual_return_of__Salaries__under_section_206_of_the_Income_tax_Act__1961_for_the_year_ending_CaptionLbl)
            {
            }
            column(Tax_Deduction_Account_No_Caption;Tax_Deduction_Account_No_CaptionLbl)
            {
            }
            column(Employer_Classification_CodeCaption;Employer_Classification_CodeCaptionLbl)
            {
            }
            column(b_Caption;b_CaptionLbl)
            {
            }
            column(a_Caption;a_CaptionLbl)
            {
            }
            column(V1_Caption;V1_CaptionLbl)
            {
            }
            column(V2_Caption;V2_CaptionLbl)
            {
            }
            column(Permanent_Account_No_Caption;Permanent_Account_No_CaptionLbl)
            {
            }
            column(V3_Caption;V3_CaptionLbl)
            {
            }
            column(a_Caption_Control23;a_Caption_Control23Lbl)
            {
            }
            column(See_Note_1__Caption;See_Note_1__CaptionLbl)
            {
            }
            column(Name_of_the_EmployerCaption;Name_of_the_EmployerCaptionLbl)
            {
            }
            column(b_Caption_Control27;b_Caption_Control27Lbl)
            {
            }
            column(Address_of_the_EmployerCaption;Address_of_the_EmployerCaptionLbl)
            {
            }
            column(PINCaption;PINCaptionLbl)
            {
            }
            column(b_Caption_Control34;b_Caption_Control34Lbl)
            {
            }
            column(a_Caption_Control35;a_Caption_Control35Lbl)
            {
            }
            column(V4_Caption;V4_CaptionLbl)
            {
            }
            column(Name_of_the_person_responsible_forCaption;Name_of_the_person_responsible_forCaptionLbl)
            {
            }
            column(paying_salary_if_not_the_employer_Caption;paying_salary_if_not_the_employer_CaptionLbl)
            {
            }
            column(Address_of_the_person_responsible_forCaption;Address_of_the_person_responsible_forCaptionLbl)
            {
            }
            column(paying_salaryCaption;paying_salaryCaptionLbl)
            {
            }
            column(V5_Caption;V5_CaptionLbl)
            {
            }
            column(Has_address_of_Employer_Person_responsible_for_paying_salary_changed_since_filling_the_last_return__Caption;Has_address_of_Employer_Person_responsible_for_paying_salary_changed_since_filling_the_last_return__CaptionLbl)
            {
            }
            column(Pay_Company_Policy_Primary_Key;"Primary Key")
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

    var
        PAYYEARID : Integer;
        StDate : Date;
        EndDate : Date;
        PayYear : Record "Pay Year";
        Text0001 : Label 'Assesment Year not defined';
        CompanyInfo : Record "Company Information";
        FORM_24CaptionLbl : Label 'FORM 24';
        CurrReport_PAGENOCaptionLbl : Label 'Page';
        FORM_NO__24CaptionLbl : Label 'FORM NO. 24';
        See_section_192_and_rule_37__CaptionLbl : Label '[ See section 192 and rule 37 ]';
        Annual_return_of__Salaries__under_section_206_of_the_Income_tax_Act__1961_for_the_year_ending_CaptionLbl : Label '"Annual return of ""Salaries"" under section 206 of the Income-tax Act, 1961 for the year ending "';
        Tax_Deduction_Account_No_CaptionLbl : Label 'Tax Deduction Account No.';
        Employer_Classification_CodeCaptionLbl : Label 'Employer Classification Code';
        b_CaptionLbl : Label '(b)';
        a_CaptionLbl : Label '(a)';
        V1_CaptionLbl : Label '1.';
        V2_CaptionLbl : Label '2.';
        Permanent_Account_No_CaptionLbl : Label 'Permanent Account No.';
        V3_CaptionLbl : Label '3.';
        a_Caption_Control23Lbl : Label '(a)';
        See_Note_1__CaptionLbl : Label '( See Note 1 )';
        Name_of_the_EmployerCaptionLbl : Label 'Name of the Employer';
        b_Caption_Control27Lbl : Label '(b)';
        Address_of_the_EmployerCaptionLbl : Label 'Address of the Employer';
        PINCaptionLbl : Label 'PIN';
        b_Caption_Control34Lbl : Label '(b)';
        a_Caption_Control35Lbl : Label '(a)';
        V4_CaptionLbl : Label '4.';
        Name_of_the_person_responsible_forCaptionLbl : Label 'Name of the person responsible for';
        paying_salary_if_not_the_employer_CaptionLbl : Label 'paying salary(if not the employer)';
        Address_of_the_person_responsible_forCaptionLbl : Label 'Address of the person responsible for';
        paying_salaryCaptionLbl : Label 'paying salary';
        V5_CaptionLbl : Label '5.';
        Has_address_of_Employer_Person_responsible_for_paying_salary_changed_since_filling_the_last_return__CaptionLbl : Label 'Has address of Employer/Person responsible for paying salary changed since filling the last return ?';
}

