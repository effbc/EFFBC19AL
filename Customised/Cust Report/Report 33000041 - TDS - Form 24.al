report 33000041 "TDS - Form 24"
{
    // version NEOGYNPAY13.70.00.06

    DefaultLayout = RDLC;
    RDLCLayout = './TDS - Form 24.rdlc';

    dataset
    {
        dataitem(Employee; Employee)
        {
            RequestFilterFields = "No.", "Job Title/Grade", "Department Code";
            column(a__Name_of_the_EmployerCaption; a__Name_of_the_EmployerCaptionLbl)
            {
            }
            column(b__Address_of_the_EmployerCaption; b__Address_of_the_EmployerCaptionLbl)
            {
            }
            column(a__Name_of_the_person_responsible_for_paying_salary__if_not_the_employer_Caption; a__Name_of_the_person_responsible_for_paying_salary__if_not_the_employer_CaptionLbl)
            {
            }
            column(V1__Caption; V1__CaptionLbl)
            {
            }
            column(V2__Caption; V2__CaptionLbl)
            {
            }
            column(V3__Caption; V3__CaptionLbl)
            {
            }
            column(V4__Caption; V4__CaptionLbl)
            {
            }
            column(V5__Caption; V5__CaptionLbl)
            {
            }
            column(a__Tax_Deduction_Account_NoCaption; a__Tax_Deduction_Account_NoCaptionLbl)
            {
            }
            column(Form_No__24Caption; Form_No__24CaptionLbl)
            {
            }
            column(See_Section_192_and_rule_37_Caption; See_Section_192_and_rule_37_CaptionLbl)
            {
            }
            column(Annual_return_of__Salaries__under_section_206_of_the_Income_tax_Act_1961_for_the_year_ending__Caption; Annual_return_of__Salaries__under_section_206_of_the_Income_tax_Act_1961_for_the_year_ending__CaptionLbl)
            {
            }
            column(Employer_Classification_CodeCaption; Employer_Classification_CodeCaptionLbl)
            {
            }
            column(b__Permanent_Account_NoCaption; b__Permanent_Account_NoCaptionLbl)
            {
            }
            column(See_note_1_Caption; See_note_1_CaptionLbl)
            {
            }
            column(b__Address_of_the_person_responsible_for_paying_salaryCaption; b__Address_of_the_person_responsible_for_paying_salaryCaptionLbl)
            {
            }
            column(Has_address_of_the_Employer_Person_responsible_for_paying_salary_changed_since_filling_the_last_return__Caption; Has_address_of_the_Employer_Person_responsible_for_paying_salary_changed_since_filling_the_last_return__CaptionLbl)
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

    trigger OnInitReport();
    begin
        PayYear.RESET;
        PayYear.SETFILTER(Type, '=%1', 3);
        IF PayYear.FIND('-') THEN BEGIN
            PAYYEARID := PayYear.ID;
            StDate := PayYear."Year Start Date";
            EndDate := PayYear."Year End Date";
        END
        ELSE
            ERROR(Text0001);
    end;

    var
        Name: Text[240];
        Address3: Text[240];
        AmtUnder8: Decimal;
        TotalAmtUnder9: Decimal;
        AmtUnder9: Decimal;
        TotalAmtUnder10: Decimal;
        AmtUnder10: Decimal;
        AmtUnder11: Decimal;
        RvTaxMainSheet: Record "Tax Main Sheet";
        RVTaxSalaries: Record "Tax Salaries";
        AmtUnder12: Decimal;
        AmtUnder13: Decimal;
        AmtUnder14: Decimal;
        AmtUnder15: Decimal;
        AmtUnder16: Decimal;
        AmtUnder17: Decimal;
        AmtUnder18: Decimal;
        AmtUnder19: Decimal;
        AmtUnder20: Decimal;
        AmtUnder21: Decimal;
        AmtUnder22: Decimal;
        AmtUnder23: Decimal;
        AmtUnder24: Decimal;
        AmtUnder25: Decimal;
        AmtUnder26: Decimal;
        AmtUnder27: Decimal;
        AmtUnder28: Decimal;
        AmtUnder29: Decimal;
        AmtUnder30: Decimal;
        PAYYEARID: Integer;
        AmtUnder19i: Decimal;
        AmtUnder19ii: Decimal;
        AmtUnder19iii: Decimal;
        AmtUnder19iv: Decimal;
        AmtUnder19v: Decimal;
        AmtUnder19vi: Decimal;
        AmtUnder19vii: Decimal;
        PayYear: Record "Pay Year";
        StDate: Date;
        EndDate: Date;
        PerksAmount1: Decimal;
        PerksAmount2: Decimal;
        PerksAmount3: Decimal;
        PerksAmount4: Decimal;
        PerksAmount5: Decimal;
        PerksAmount6: Decimal;
        PerksAmount7: Decimal;
        PerksAmount8: Decimal;
        PerksAmount9: Decimal;
        PerksAmount10: Decimal;
        PerksAmount11: Decimal;
        RvSalarySub: Record "Tax Salaries Sub";
        RvTaxMonth: Record "Tax Months";
        Text0001: Label 'There is no assessment year period defined in the masters.';
        a__Name_of_the_EmployerCaptionLbl: Label '(a) Name of the Employer';
        b__Address_of_the_EmployerCaptionLbl: Label '(b) Address of the Employer';
        a__Name_of_the_person_responsible_for_paying_salary__if_not_the_employer_CaptionLbl: Label '(a) Name of the person responsible for paying salary (if not the employer)';
        V1__CaptionLbl: Label '(1).';
        V2__CaptionLbl: Label '(2).';
        V3__CaptionLbl: Label '(3).';
        V4__CaptionLbl: Label '(4).';
        V5__CaptionLbl: Label '(5).';
        a__Tax_Deduction_Account_NoCaptionLbl: Label '(a) Tax Deduction Account No';
        Form_No__24CaptionLbl: Label 'Form No. 24';
        See_Section_192_and_rule_37_CaptionLbl: Label '[See Section 192 and rule 37]';
        Annual_return_of__Salaries__under_section_206_of_the_Income_tax_Act_1961_for_the_year_ending__CaptionLbl: Label '"Annual return of ""Salaries"" under section 206 of the Income-tax Act,1961 for the year ending  "';
        Employer_Classification_CodeCaptionLbl: Label 'Employer Classification Code';
        b__Permanent_Account_NoCaptionLbl: Label '(b) Permanent Account No';
        See_note_1_CaptionLbl: Label '(See note 1)';
        b__Address_of_the_person_responsible_for_paying_salaryCaptionLbl: Label '(b) Address of the person responsible for paying salary';
        Has_address_of_the_Employer_Person_responsible_for_paying_salary_changed_since_filling_the_last_return__CaptionLbl: Label 'Has address of the Employer/Person responsible for paying salary changed since filling the last return ?';
}

