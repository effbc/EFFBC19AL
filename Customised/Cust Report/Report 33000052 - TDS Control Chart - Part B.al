report 33000052 "TDS Control Chart - Part B"
{
    // version NEOGYNPAY13.70.00.06

    DefaultLayout = RDLC;
    RDLCLayout = './TDS Control Chart - Part B.rdlc';
    Caption = 'TDS Control Chart - Part B';

    dataset
    {
        dataitem(Employee; Employee)
        {
            DataItemTableView = SORTING(No.) WHERE(Consent For Bulk Return=CONST(Yes));
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
            column(Employee__First_Name___Employee__Last_Name_; Employee."First Name" + Employee."Last Name")
            {
            }
            column(SlNO; SlNO)
            {
            }
            column(EmpTotalIncome; EmpTotalIncome)
            {
            }
            column(EmpRefund; EmpRefund)
            {
            }
            column(SendTo; SendTo)
            {
            }
            column(Part___B___Particulars_of_eligible_employeesCaption; Part___B___Particulars_of_eligible_employeesCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Name_of_employeeCaption; Name_of_employeeCaptionLbl)
            {
            }
            column(PAN_of_employeeCaption; PAN_of_employeeCaptionLbl)
            {
            }
            column(Total_IncomeCaption; Total_IncomeCaptionLbl)
            {
            }
            column(Refund_claimedCaption; Refund_claimedCaptionLbl)
            {
            }
            column(Refund_to_be_sent_toCaption; Refund_to_be_sent_toCaptionLbl)
            {
            }
            column(Sl__No_Caption; Sl__No_CaptionLbl)
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
            column(NoteCaption; NoteCaptionLbl)
            {
            }
            column(DataItem17; V1__In_Part_B_column_6_above__state_D_if_the_refund_cheque_is_sent_to_the_employer_DDo_and_state_B_for_refund_to_be_credited_Lbl)
            {
            }
            column(DataItem18; V2__The_employee_opting_for_credit_to_his_bank_account_through_the_Electric_Clearance_Scheme_of_RBI_shall_enclose_the_mandateLbl)
            {
            }
            column(DataItem19; V3__The_return_of_income_of_Form_No__2D_or_Form_No__3_should_be_in_the_same_order_as_in_Part_B_of_the_above_Chart__and_are_nuLbl)
            {
            }
            column(Place__Caption; Place__CaptionLbl)
            {
            }
            column(Date__Caption; Date__CaptionLbl)
            {
            }
            column(Name_of_signature_of_the_employer_DDOCaption; Name_of_signature_of_the_employer_DDOCaptionLbl)
            {
            }
            column(Employee_No_; "No.")
            {
            }

            trigger OnPreDataItem();
            begin
                PayTaxPolicy.GET(PAYYEARID);
                LastFieldNo := FIELDNO("No.");
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

    trigger OnPreReport();
    begin
        SlNO := 0;
    end;

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        StDate: Date;
        EndDate: Date;
        PAYYEARID: Integer;
        PayYear: Record "Pay Year";
        SlNO: Integer;
        TaxMainSheet: Record "Tax Main Sheet";
        EmpTotalIncome: Decimal;
        EmpRefund: Decimal;
        Column22: Decimal;
        Column23: Decimal;
        Column23A: Decimal;
        Column23B: Decimal;
        Column24: Decimal;
        Column25: Decimal;
        Column26: Decimal;
        Column27: Decimal;
        TaxSalaries: Record "Tax Salaries";
        PayTaxPolicy: Record "Pay Tax Policy";
        SendTo: Text[1];
        SurchargeRate: Decimal;
        Text0001: Label 'Please setup Assessment Year';
        Text0002: Label 'There are less than minimum employees';
        Part___B___Particulars_of_eligible_employeesCaptionLbl: Label 'Part - B : Particulars of eligible employees';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Name_of_employeeCaptionLbl: Label 'Name of employee';
        PAN_of_employeeCaptionLbl: Label 'PAN of employee';
        Total_IncomeCaptionLbl: Label 'Total Income';
        Refund_claimedCaptionLbl: Label 'Refund claimed';
        Refund_to_be_sent_toCaptionLbl: Label 'Refund to be sent to';
        Sl__No_CaptionLbl: Label 'Sl. No.';
        V1CaptionLbl: Label '1';
        V2CaptionLbl: Label '2';
        V3CaptionLbl: Label '3';
        V4CaptionLbl: Label '4';
        V5CaptionLbl: Label '5';
        V6CaptionLbl: Label '6';
        NoteCaptionLbl: Label 'Note';
        V1__In_Part_B_column_6_above__state_D_if_the_refund_cheque_is_sent_to_the_employer_DDo_and_state_B_for_refund_to_be_credited_Lbl: Label '1. In Part B column 6 above, state D if the refund cheque is sent to the employer/DDo and state B for refund to be credited to hte Bank account of the employee.';
        V2__The_employee_opting_for_credit_to_his_bank_account_through_the_Electric_Clearance_Scheme_of_RBI_shall_enclose_the_mandateLbl: Label '2. The employee opting for credit to his bank account through the Electric Clearance Scheme of RBI shall enclose the mandate from with his return of income in Form No. 2D or Form No. 3.';
        V3__The_return_of_income_of_Form_No__2D_or_Form_No__3_should_be_in_the_same_order_as_in_Part_B_of_the_above_Chart__and_are_nuLbl: Label '3. The return of income of Form No. 2D or Form No. 3 should be in the same order as in Part B of the above Chart, and are numbered with the same Serial number as in the chart.';
        Place__CaptionLbl: Label 'Place :';
        Date__CaptionLbl: Label 'Date :';
        Name_of_signature_of_the_employer_DDOCaptionLbl: Label 'Name of signature of the employer/DDO';
}

