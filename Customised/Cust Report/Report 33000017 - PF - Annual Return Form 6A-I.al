report 33000017 "PF - Annual Return Form 6A-I"
{
    // version NEOGYNPAY13.70.00.06

    DefaultLayout = RDLC;
    RDLCLayout = './PF - Annual Return Form 6A-I.rdlc';

    dataset
    {
        dataitem("Pay Year"; "Pay Year")
        {
            DataItemTableView = SORTING(ID);
            column(Year_Start_Date_; "Pay Year"."Year Start Date")
            {
            }
            column(Year_End_Date_; "Pay Year"."Year End Date")
            {
            }
        }
        dataitem(Employee; Employee)
        {
            RequestFilterFields = "No.", "Job Title/Grade", "Department Code";
            column(StatutoryRate; StatutoryRate)
            {
            }
            column(CompanyAdd; CompanyAdd)
            {
            }
            column(Employee__PF_No_; "PF No")
            {
            }
            column(Name; Name)
            {
            }
            column(TotalWages; TotalWages)
            {
            }
            column(EPFTotal; EPFTotal)
            {
            }
            column(EMPLOYERCONTRIB2; EMPLOYERCONTRIB2)
            {
            }
            column(EMPLOYERCONTRIB1; EMPLOYERCONTRIB1)
            {
            }
            column(DataItem4; Annual_statement_of_contribution_for_the_currency_period_from___________________________________________________to___________Lbl)
            {
            }
            column(Name___Address_of_the_Factory_EstablishmentCaption; Name___Address_of_the_Factory_EstablishmentCaptionLbl)
            {
            }
            column(DataItem2; Paragraph_43_of_the_Employee_s_Provident_Funds_Scheme__1952_and_Paragraph_20_4__of_the_Employee_s_Pension_Scheme_1995_CaptionLbl)
            {
            }
            column(Statutory_rate_of_contributionCaption; Statutory_rate_of_contributionCaptionLbl)
            {
            }
            column(No__of_Members_voluntarily___Caption; No__of_Members_voluntarily___CaptionLbl)
            {
            }
            column(Contributing_at_a_higher_rate________________________Caption; Contributing_at_a_higher_rate________________________CaptionLbl)
            {
            }
            column(FORM_6_ACaption; FORM_6_ACaptionLbl)
            {
            }
            column(Code_No__of_the_Establishment____________________________Caption; Code_No__of_the_Establishment____________________________CaptionLbl)
            {
            }
            column(SI_No_Caption; SI_No_CaptionLbl)
            {
            }
            column(Account_No_Caption; Account_No_CaptionLbl)
            {
            }
            column(Name_of_the_Memeber___in_block_letters_Caption; Name_of_the_Memeber___in_block_letters_CaptionLbl)
            {
            }
            column(DataItem56; Wages__Retaining_allowance__if_any__and_D_A__including_cash_value_of_food_concession_paid_during_the_currency_periodCaptionLbl)
            {
            }
            column(Amount_of_Worker_s_Contributions_deducted_from_the_wagesCaption; Amount_of_Worker_s_Contributions_deducted_from_the_wagesCaptionLbl)
            {
            }
            column(Employer_s_ContributionCaption; Employer_s_ContributionCaptionLbl)
            {
            }
            column(Refund_of_AdvancesCaption; Refund_of_AdvancesCaptionLbl)
            {
            }
            column(RemarksCaption; RemarksCaptionLbl)
            {
            }
            column(E_P_F_differences_between_10___8_13_Caption; E_P_F_differences_between_10___8_13_CaptionLbl)
            {
            }
            column(Pension_Fund_8_13_Caption; Pension_Fund_8_13_CaptionLbl)
            {
            }
            column(Rate_of_higher_voluntary_contribution__if_any_Caption; Rate_of_higher_voluntary_contribution__if_any_CaptionLbl)
            {
            }
            column(V1Caption; V1CaptionLbl)
            {
            }
            column(V2Caption; V2CaptionLbl)
            {
            }
            column(V3Caption; V3CaptionLbl)
            {
            }
            column(V4Caption; V4CaptionLbl)
            {
            }
            column(V5Caption; V5CaptionLbl)
            {
            }
            column(V6Caption; V6CaptionLbl)
            {
            }
            column(V7Caption; V7CaptionLbl)
            {
            }
            column(V8Caption; V8CaptionLbl)
            {
            }
            column(V9Caption; V9CaptionLbl)
            {
            }
            column(V10Caption; V10CaptionLbl)
            {
            }
            column(Employee_No_; "No.")
            {
            }
            dataitem("Pay Employee Pay Details"; "Pay Employee Pay Details")
            {
                DataItemTableView = SORTING(Year, Month, Employee No, Pay Element Code, ForMonthDate);
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
        "Pay Year".SETRANGE("Pay Year".ID, PAYYEARID);
        STDATE := PAYYEAR."Year Start Date";
        ENDDATE := PAYYEAR."Year End Date";
        CTR := 1;
        WHILE (STDATE < ENDDATE) DO BEGIN
            TempDate := CALCDATE('+1M', STDATE);
            TempDate := DMY2DATE(1, DATE2DMY(TempDate, 2), DATE2DMY(TempDate, 3));
            TempDate := CALCDATE('-1D', TempDate);
            MonthsDate[CTR] [1] := TempDate;
            STDATE := CALCDATE('+1M', STDATE);
            CTR := CTR + 1;
        END;
        CompanyAdd := RvCompany.Name + ' ' + RvCompany."Name 2" + ' ' + RvCompany.Address + ' ' + RvCompany."Address 2";
    end;

    var
        Name: Text[30];
        PAYYEAR: Record "Pay Year";
        PAYYEARID: Integer;
        STDATE: Date;
        ENDDATE: Date;
        RVCompanyPol2: Record "Pay Company Policy 2";
        StatutoryRate: Text[200];
        CTR: Integer;
        TempDate: Date;
        MonthsDate: array[13, 1] of Date;
        CompanyAdd: Text[200];
        RvCompany: Record "Company Information";
        TotalWages: Decimal;
        RVEmpPayDetails: Record "Pay Elements";
        EPFTotal: Decimal;
        EMPLOYERCONTRIB2: Decimal;
        EMPLOYERCONTRIB1: Decimal;
        PayCompPol: Record "Pay Company Policy";
        Annual_statement_of_contribution_for_the_currency_period_from___________________________________________________to___________Lbl: Label 'Annual statement of contribution for the currency period from ................................................  to ........................';
        Name___Address_of_the_Factory_EstablishmentCaptionLbl: Label 'Name & Address of the Factory/Establishment';
        Paragraph_43_of_the_Employee_s_Provident_Funds_Scheme__1952_and_Paragraph_20_4__of_the_Employee_s_Pension_Scheme_1995_CaptionLbl: Label '[Paragraph 43 of the Employee''s Provident Funds Scheme, 1952 and Paragraph 20(4) of the Employee''s Pension Scheme 1995]';
        Statutory_rate_of_contributionCaptionLbl: Label 'Statutory rate of contribution';
        No__of_Members_voluntarily___CaptionLbl: Label 'No. of Members voluntarily...';
        Contributing_at_a_higher_rate________________________CaptionLbl: Label 'Contributing at a higher rate........................';
        FORM_6_ACaptionLbl: Label 'FORM 6-A';
        Code_No__of_the_Establishment____________________________CaptionLbl: Label 'Code No. of the Establishment............................';
        SI_No_CaptionLbl: Label 'SI.No.';
        Account_No_CaptionLbl: Label 'Account No.';
        Name_of_the_Memeber___in_block_letters_CaptionLbl: Label 'Name of the Memeber ( in block letters)';
        Wages__Retaining_allowance__if_any__and_D_A__including_cash_value_of_food_concession_paid_during_the_currency_periodCaptionLbl: Label 'Wages. Retaining allowance (if any) and D.A. including cash value of food concession paid during the currency period';
        Amount_of_Worker_s_Contributions_deducted_from_the_wagesCaptionLbl: Label 'Amount of Worker''s Contributions deducted from the wages';
        Employer_s_ContributionCaptionLbl: Label 'Employer''s Contribution';
        Refund_of_AdvancesCaptionLbl: Label 'Refund of Advances';
        RemarksCaptionLbl: Label 'Remarks';
        E_P_F_differences_between_10___8_13_CaptionLbl: Label 'E.P.F differences between 10 % 8-13%';
        Pension_Fund_8_13_CaptionLbl: Label 'Pension Fund 8-13%';
        Rate_of_higher_voluntary_contribution__if_any_CaptionLbl: Label 'Rate of higher voluntary contribution (if any)';
        V1CaptionLbl: Label '1';
        V2CaptionLbl: Label '2';
        V3CaptionLbl: Label '3';
        V4CaptionLbl: Label '4';
        V5CaptionLbl: Label '5';
        V6CaptionLbl: Label '6';
        V7CaptionLbl: Label '7';
        V8CaptionLbl: Label '8';
        V9CaptionLbl: Label '9';
        V10CaptionLbl: Label '10';
}

