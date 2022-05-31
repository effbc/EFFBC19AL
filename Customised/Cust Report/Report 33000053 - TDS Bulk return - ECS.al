report 33000053 "TDS Bulk return - ECS"
{
    // version NEOGYNPAY13.70.00.06

    DefaultLayout = RDLC;
    RDLCLayout = './TDS Bulk return - ECS.rdlc';

    dataset
    {
        dataitem(Employee; Employee)
        {
            DataItemTableView = SORTING(No.) WHERE(Consent For Bulk Return=CONST(Yes),Consent For ECS=CONST(Yes));
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PAGENO)
            {
            }
            column(USERID; USERID)
            {
            }
            column(Employee__PAN_No_; "PAN No")
            {
            }
            column(Employee__Bank_Name_; "Bank Name")
            {
            }
            column(Employee__Bank_Branch_; "Bank Branch")
            {
            }
            column(Employee__ECS_Bank_Code_No__; "ECS Bank Code No.")
            {
            }
            column(Employee__ECS_Bank_Ledger_No_; "ECS Bank Ledger No")
            {
            }
            column(DeclarationText; DeclarationText)
            {
            }
            column(EmpName; EmpName)
            {
            }
            column(AcTypeCode; AcTypeCode)
            {
            }
            column(FORMAT_StDate____________FORMAT_EndDate_; FORMAT(StDate) + ' - ' + FORMAT(EndDate))
            {
            }
            column(Employee__Account_No_; "Account No")
            {
            }
            column(EmployeesCaption; EmployeesCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(ELECTRONIC_CLEARING_SERVICE__CREDIT_CLEARING_Caption; ELECTRONIC_CLEARING_SERVICE__CREDIT_CLEARING_CaptionLbl)
            {
            }
            column(MANDATE_FORMCaption; MANDATE_FORMCaptionLbl)
            {
            }
            column(Assesse_s_Option_to_receive_Refunds_Through_Election_Clearing_SystemCaption; Assesse_s_Option_to_receive_Refunds_Through_Election_Clearing_SystemCaptionLbl)
            {
            }
            column(Permanent_Account_No_Caption; Permanent_Account_No_CaptionLbl)
            {
            }
            column(Employee__Bank_Name_Caption; FIELDCAPTION("Bank Name"))
            {
            }
            column(Employee__Bank_Branch_Caption; FIELDCAPTION("Bank Branch"))
            {
            }
            column(Account_No_Caption; Account_No_CaptionLbl)
            {
            }
            column(Employee__ECS_Bank_Code_No__Caption; FIELDCAPTION("ECS Bank Code No."))
            {
            }
            column(Employee__ECS_Bank_Ledger_No_Caption; FIELDCAPTION("ECS Bank Ledger No"))
            {
            }
            column(Name_of_assesseeCaption; Name_of_assesseeCaptionLbl)
            {
            }
            column(Particular_of_Bank_AccountCaption; Particular_of_Bank_AccountCaptionLbl)
            {
            }
            column(Account_Type__Savings_Bank_Account_Current_Account_or_Cash_Credit__with_code_10_11_13Caption; Account_Type__Savings_Bank_Account_Current_Account_or_Cash_Credit__with_code_10_11_13CaptionLbl)
            {
            }
            column(V1_Caption; V1_CaptionLbl)
            {
            }
            column(V2_Caption; V2_CaptionLbl)
            {
            }
            column(V3_Caption; V3_CaptionLbl)
            {
            }
            column(V4_Caption; V4_CaptionLbl)
            {
            }
            column(a_Caption; a_CaptionLbl)
            {
            }
            column(b_Caption; b_CaptionLbl)
            {
            }
            column(c_Caption; c_CaptionLbl)
            {
            }
            column(e_Caption; e_CaptionLbl)
            {
            }
            column(d_Caption; d_CaptionLbl)
            {
            }
            column(f_Caption; f_CaptionLbl)
            {
            }
            column(that_the_particulars_given_above_are_correct_and_complete_and_true_to_the_best_of_my_knowledge__Caption; that_the_particulars_given_above_are_correct_and_complete_and_true_to_the_best_of_my_knowledge__CaptionLbl)
            {
            }
            column(belief_and_information_Caption; belief_and_information_CaptionLbl)
            {
            }
            column(Place__Caption; Place__CaptionLbl)
            {
            }
            column(Date__Caption; Date__CaptionLbl)
            {
            }
            column(Signature_of_the_assesseCaption; Signature_of_the_assesseCaptionLbl)
            {
            }
            column(Valid_for_Assessment_yearCaption; Valid_for_Assessment_yearCaptionLbl)
            {
            }
            column(Employee_No_; "No.")
            {
            }

            trigger OnPreDataItem();
            begin
                PayTaxPolicy.GET(PAYYEARID);
                Employee.SETFILTER("PAN No", '<>%1', '');
                IF Employee.COUNT < PayTaxPolicy."Min. of emp for bulk return" THEN
                    ERROR(Text0002);
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
        EmpName: Text[30];
        DeclarationText: Text[260];
        AcTypeCode: Text[2];
        PAYYEARID: Integer;
        PayYear: Record "Pay Year";
        EndDate: Date;
        StDate: Date;
        Text0001: Label 'Please setup assessment year';
        PayTaxPolicy: Record "Pay Tax Policy";
        Text0002: Label 'Less than minimum no of employees';
        EmployeesCaptionLbl: Label 'Employees';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        ELECTRONIC_CLEARING_SERVICE__CREDIT_CLEARING_CaptionLbl: Label 'ELECTRONIC CLEARING SERVICE (CREDIT CLEARING)';
        MANDATE_FORMCaptionLbl: Label 'MANDATE FORM';
        Assesse_s_Option_to_receive_Refunds_Through_Election_Clearing_SystemCaptionLbl: Label 'Assesse''s Option to receive Refunds Through Election Clearing System';
        Permanent_Account_No_CaptionLbl: Label 'Permanent Account No.';
        Account_No_CaptionLbl: Label 'Account No.';
        Name_of_assesseeCaptionLbl: Label 'Name of assessee';
        Particular_of_Bank_AccountCaptionLbl: Label 'Particular of Bank Account';
        Account_Type__Savings_Bank_Account_Current_Account_or_Cash_Credit__with_code_10_11_13CaptionLbl: Label 'Account Type (Savings Bank Account/Current Account or Cash Credit) with code 10/11/13';
        V1_CaptionLbl: Label '1.';
        V2_CaptionLbl: Label '2.';
        V3_CaptionLbl: Label '3.';
        V4_CaptionLbl: Label '4.';
        a_CaptionLbl: Label '(a)';
        b_CaptionLbl: Label '(b)';
        c_CaptionLbl: Label '(c)';
        e_CaptionLbl: Label '(e)';
        d_CaptionLbl: Label '(d)';
        f_CaptionLbl: Label '(f)';
        that_the_particulars_given_above_are_correct_and_complete_and_true_to_the_best_of_my_knowledge__CaptionLbl: Label '"that the particulars given above are correct and complete and true to the best of my knowledge, "';
        belief_and_information_CaptionLbl: Label 'belief and information.';
        Place__CaptionLbl: Label 'Place :';
        Date__CaptionLbl: Label 'Date :';
        Signature_of_the_assesseCaptionLbl: Label 'Signature of the assesse';
        Valid_for_Assessment_yearCaptionLbl: Label 'Valid for Assessment year';
}

