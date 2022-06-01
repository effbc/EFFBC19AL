report 33000040 "Professional Tax FORM 5 A"
{
    // version NEOGYNPAY13.70.00.06

    DefaultLayout = RDLC;
    RDLCLayout = './Professional Tax FORM 5 A.rdlc';
    TransactionType = Report;

    dataset
    {
        dataitem("Pay Professional TaxStateSetup"; "Pay Professional TaxStateSetup")
        {
            column(StateDesc; StateDesc)
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(CompanyAdd1; CompanyAdd1)
            {
            }
            column(CompanyAdd2; CompanyAdd2)
            {
            }
            column(MonthName; MonthName)
            {
            }
            column(SLNO; SLNO)
            {
            }
            column(Pay_Professional_TaxStateSetup__Income_from_; "Income from")
            {
            }
            column(SalarySlabs; SalarySlabs)
            {
            }
            column(Pay_Professional_TaxStateSetup__Deduction_Amount_; "Deduction Amount")
            {
            }
            column(NoOfEmp; NoOfEmp)
            {
            }
            column(TaxPaid; TaxPaid)
            {
            }
            column(TotalTaxPaid; TotalTaxPaid)
            {
            }
            column(InterestPaid; InterestPaid)
            {
            }
            column(GrandTotal; GrandTotal)
            {
            }
            column(ChequeNo; ChequeNo)
            {
            }
            column(ChequeDate; ChequeDate)
            {
            }
            column(BankName; BankName)
            {
            }
            column(FORM_5Caption; FORM_5CaptionLbl)
            {
            }
            column(See_Rule_11_A_Caption; See_Rule_11_A_CaptionLbl)
            {
            }
            column(RETURN_OF_TAX_PAYABLE_BY_EMPLOYER_UNDER_SUB_SECTION_1__OF_SECTION_6A_OFCaption; RETURN_OF_TAX_PAYABLE_BY_EMPLOYER_UNDER_SUB_SECTION_1__OF_SECTION_6A_OFCaptionLbl)
            {
            }
            column(TRADE__CALLINGS_AND_EMPLOYEMENTCaption; TRADE__CALLINGS_AND_EMPLOYEMENTCaptionLbl)
            {
            }
            column(TAX_ON_PROFFESSIONALSCaption; TAX_ON_PROFFESSIONALSCaptionLbl)
            {
            }
            column(Amount_of_tax_deductedCaption; Amount_of_tax_deductedCaptionLbl)
            {
            }
            column(No__of_employees_during_the_month_in_respect_of_whom_the_tax_is_payable_is_as_underCaption; No__of_employees_during_the_month_in_respect_of_whom_the_tax_is_payable_is_as_underCaptionLbl)
            {
            }
            column(CessCaption; CessCaptionLbl)
            {
            }
            column(P_T_O_Circle_No_Caption; P_T_O_Circle_No_CaptionLbl)
            {
            }
            column(Rate_of_tax_per_monthCaption; Rate_of_tax_per_monthCaptionLbl)
            {
            }
            column(Certificate_No_Caption; Certificate_No_CaptionLbl)
            {
            }
            column(Return_on_tax_payable_for_the_month_endingCaption; Return_on_tax_payable_for_the_month_endingCaptionLbl)
            {
            }
            column(No__of_employeesCaption; No__of_employeesCaptionLbl)
            {
            }
            column(Employees_whose_month_salary_or_wages_of_both_areCaption; Employees_whose_month_salary_or_wages_of_both_areCaptionLbl)
            {
            }
            column(Name_of_the_employerCaption; Name_of_the_employerCaptionLbl)
            {
            }
            column(AddressCaption; AddressCaptionLbl)
            {
            }
            column(EmptyStringCaption; EmptyStringCaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(DataItem8; Add_simple_interest_payable___if_any___on_the_above_amount_at_two_percent_per_month_or_part_thereof___vide_section_II__2__of_Lbl)
            {
            }
            column(Grand_TotalCaption; Grand_TotalCaptionLbl)
            {
            }
            column(Amount_paid_under_challan_No___Cheque_No_Caption; Amount_paid_under_challan_No___Cheque_No_CaptionLbl)
            {
            }
            column(DatedCaption; DatedCaptionLbl)
            {
            }
            column(Name_of_the_BankCaption; Name_of_the_BankCaptionLbl)
            {
            }
            column(DataItem15; I_certify_that_all_the_employees_who_are_laible_to_pay_tax_in_my_employment_during_the_period_of_return_have_been_covered_in_Lbl)
            {
            }
            column(DataItem16; I_also_certify_that_the_necessary_revision_in_the_amount_of_tax_deductabule_from_the_salary_or_wages_of_the_employees_on_accoLbl)
            {
            }
            column(I__ShriCaption; I__ShriCaptionLbl)
            {
            }
            column(solemnly_declare_that_the_above_statements_are_true_to_the_best_of_my_knowledge_and_belief_Caption; solemnly_declare_that_the_above_statements_are_true_to_the_best_of_my_knowledge_and_belief_CaptionLbl)
            {
            }
            column(Place__Caption; Place__CaptionLbl)
            {
            }
            column(Dated__Caption; Dated__CaptionLbl)
            {
            }
            column(SignatureCaption; SignatureCaptionLbl)
            {
            }
            column(Pay_Professional_TaxStateSetup_ID; ID)
            {
            }
            column(Pay_Professional_TaxStateSetup_State_Code; "State Code")
            {
            }
            column(Pay_Professional_TaxStateSetup_Sequence_No_; "Sequence No.")
            {
            }

            trigger OnPreDataItem();
            begin
                "Pay Professional TaxStateSetup".RESET;
                "Pay Professional TaxStateSetup".SETFILTER("State Code", StateCode);
                IF NOT "Pay Professional TaxStateSetup".FIND('-') THEN
                    ERROR(Text002);

                SLNO := 0;
                TotalTaxPaid := 0;
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

    trigger OnPreReport();
    begin
        CompanyInfo.RESET;
        CompanyInfo.FIND('-');
        CompanyAdd1 := CompanyInfo.Address + CompanyInfo."Address 2";
        CompanyAdd2 := CompanyInfo.City + CompanyInfo."Post Code";

        CASE MonthList OF
            0:
                MonthName := 'April';
            1:
                MonthName := 'May';
            2:
                MonthName := 'June';
            3:
                MonthName := 'July';
            4:
                MonthName := 'August';
            5:
                MonthName := 'September';
            6:
                MonthName := 'October';
            7:
                MonthName := 'November';
            8:
                MonthName := 'December';
            9:
                MonthName := 'January';
            10:
                MonthName := 'February';
            11:
                MonthName := 'March';
        END;

        CASE MonthList OF
            0:
                MonthNo := 4;
            1:
                MonthNo := 5;
            2:
                MonthNo := 6;
            3:
                MonthNo := 7;
            4:
                MonthNo := 8;
            5:
                MonthNo := 9;
            6:
                MonthNo := 10;
            7:
                MonthNo := 11;
            8:
                MonthNo := 12;
            9:
                MonthNo := 1;
            10:
                MonthNo := 2;
            11:
                MonthNo := 3;

        END;


        IF (StateDesc = '') THEN
            ERROR(Text001);
    end;

    var
        SLNO: Integer;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        PAYYEARID: Integer;
        PayYear: Record "Pay Year";
        STDATE: Date;
        ENDDATE: Date;
        MonthList: Option;
        MonthNo: Integer;
        CompanyInfo: Record "Company Information";
        CompanyAdd1: Text[250];
        CompanyAdd2: Text[250];
        MonthName: Text[30];
        States: Record "Pay Professional Tax State";
        StateDesc: Text[30];
        Text001: Label 'Please select a state';
        StateCode: Code[20];
        SalarySlabs: Text[100];
        PayPaid: Record "Pay Paid";
        TotalTaxPaid: Decimal;
        TaxPaid: Decimal;
        NoOfEmp: Integer;
        Text002: Label 'Please setup and try again';
        Text003: Label 'No Records Exits';
        "Pay Professional Tax Paid": Record "Pay Professional Tax Paid";
        InterestPaid: Decimal;
        GrandTotal: Decimal;
        ChequeNo: Text[30];
        ChequeDate: Date;
        BankName: Text[30];
        BankAccounts: Record "Bank Account";
        FORM_5CaptionLbl: Label 'FORM 5';
        See_Rule_11_A_CaptionLbl: Label '[See Rule 11 A]';
        RETURN_OF_TAX_PAYABLE_BY_EMPLOYER_UNDER_SUB_SECTION_1__OF_SECTION_6A_OFCaptionLbl: Label 'RETURN OF TAX PAYABLE BY EMPLOYER UNDER SUB-SECTION(1) OF SECTION 6A OF';
        TRADE__CALLINGS_AND_EMPLOYEMENTCaptionLbl: Label 'TRADE, CALLINGS AND EMPLOYEMENT';
        TAX_ON_PROFFESSIONALSCaptionLbl: Label 'TAX ON PROFFESSIONALS';
        Amount_of_tax_deductedCaptionLbl: Label 'Amount of tax deducted';
        No__of_employees_during_the_month_in_respect_of_whom_the_tax_is_payable_is_as_underCaptionLbl: Label 'No. of employees during the month in respect of whom the tax is payable is as under';
        CessCaptionLbl: Label 'Cess';
        P_T_O_Circle_No_CaptionLbl: Label 'P.T.O Circle No.';
        Rate_of_tax_per_monthCaptionLbl: Label 'Rate of tax per month';
        Certificate_No_CaptionLbl: Label 'Certificate No.';
        Return_on_tax_payable_for_the_month_endingCaptionLbl: Label 'Return on tax payable for the month ending';
        No__of_employeesCaptionLbl: Label 'No. of employees';
        Employees_whose_month_salary_or_wages_of_both_areCaptionLbl: Label 'Employees whose month salary or wages of both are';
        Name_of_the_employerCaptionLbl: Label 'Name of the employer';
        AddressCaptionLbl: Label 'Address';
        EmptyStringCaptionLbl: Label '" - "';
        TotalCaptionLbl: Label 'Total';
        Add_simple_interest_payable___if_any___on_the_above_amount_at_two_percent_per_month_or_part_thereof___vide_section_II__2__of_Lbl: Label 'Add simple interest payable ( if any ) on the above amount at two percent per month or part thereof ( vide section II [2] of the Act)';
        Grand_TotalCaptionLbl: Label 'Grand Total';
        Amount_paid_under_challan_No___Cheque_No_CaptionLbl: Label 'Amount paid under challan No./ Cheque No.';
        DatedCaptionLbl: Label 'Dated';
        Name_of_the_BankCaptionLbl: Label 'Name of the Bank';
        I_certify_that_all_the_employees_who_are_laible_to_pay_tax_in_my_employment_during_the_period_of_return_have_been_covered_in_Lbl: Label 'I certify that all the employees who are laible to pay tax in my employment during the period of return have been covered in the foregoing particulars.';
        I_also_certify_that_the_necessary_revision_in_the_amount_of_tax_deductabule_from_the_salary_or_wages_of_the_employees_on_accoLbl: Label '" I also certify that the necessary revision in the amount of tax deductabule from the salary or wages of the employees on account of variation in the salary or wages earned by them has been made where necessary."';
        I__ShriCaptionLbl: Label 'I, Shri';
        solemnly_declare_that_the_above_statements_are_true_to_the_best_of_my_knowledge_and_belief_CaptionLbl: Label 'solemnly declare that the above statements are true to the best of my knowledge and belief.';
        Place__CaptionLbl: Label 'Place :';
        Dated__CaptionLbl: Label 'Dated :';
        SignatureCaptionLbl: Label 'Signature';
}

