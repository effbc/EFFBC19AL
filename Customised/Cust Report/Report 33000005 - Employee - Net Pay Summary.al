report 33000005 "Employee - Net Pay Summary"
{
    // version NEOGYNPAY13.70.00.06

    DefaultLayout = RDLC;
    RDLCLayout = './Employee - Net Pay Summary.rdlc';

    dataset
    {
        dataitem("Pay Employee Net"; "Pay Employee Net")
        {
            DataItemTableView = SORTING(Pay Date, Payment Indicator, Employee No, Line No.);
            RequestFilterFields = "Employee No";
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
            column(Pay_Employee_Net__Employee_No_; "Employee No")
            {
            }
            column(Pay_Employee_Net__Employee_Name_; "Employee Name")
            {
            }
            column(Pay_Employee_Net__Grade_Code_; "Grade Code")
            {
            }
            column(Pay_Employee_Net__Department_Code_; "Department Code")
            {
            }
            column(Pay_Employee_Net_Branch; Branch)
            {
            }
            column(Pay_Employee_Net__Gross_Earning_; "Gross Earning")
            {
            }
            column(Pay_Employee_Net__Gross_Deduction_; "Gross Deduction")
            {
            }
            column(Pay_Employee_Net__Payable_Amount_; "Payable Amount")
            {
            }
            column(Pay_Employee_Net_Reimbursement; Reimbursement)
            {
            }
            column(Pay_Employee_Net__Include_In_PaySlip_; "Include In PaySlip")
            {
            }
            column(Pay_Employee_Net__Pay_Date_; "Pay Date")
            {
            }
            column(Pay_Employee_Net__Payable_Type_; "Payable Type")
            {
            }
            column(Employee___Net_Pay_SummaryCaption; Employee___Net_Pay_SummaryCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Pay_Employee_Net__Employee_No_Caption; FIELDCAPTION("Employee No"))
            {
            }
            column(NameCaption; NameCaptionLbl)
            {
            }
            column(Pay_Employee_Net__Grade_Code_Caption; FIELDCAPTION("Grade Code"))
            {
            }
            column(Pay_Employee_Net__Department_Code_Caption; FIELDCAPTION("Department Code"))
            {
            }
            column(Pay_Employee_Net_BranchCaption; FIELDCAPTION(Branch))
            {
            }
            column(Pay_Employee_Net__Gross_Earning_Caption; FIELDCAPTION("Gross Earning"))
            {
            }
            column(Pay_Employee_Net__Gross_Deduction_Caption; FIELDCAPTION("Gross Deduction"))
            {
            }
            column(Pay_Employee_Net__Payable_Amount_Caption; FIELDCAPTION("Payable Amount"))
            {
            }
            column(Pay_Employee_Net_ReimbursementCaption; FIELDCAPTION(Reimbursement))
            {
            }
            column(Pay_Employee_Net__Include_In_PaySlip_Caption; FIELDCAPTION("Include In PaySlip"))
            {
            }
            column(Pay_Employee_Net__Pay_Date_Caption; FIELDCAPTION("Pay Date"))
            {
            }
            column(Payment_TypeCaption; Payment_TypeCaptionLbl)
            {
            }
            column(Pay_Employee_Net_Payment_Indicator; "Payment Indicator")
            {
            }
            column(Pay_Employee_Net_Line_No_; "Line No.")
            {
            }

            trigger OnPreDataItem();
            begin
                RESET;
                TempDate1 := DMY2DATE(1, Month + 1, Year);
                TempDate2 := CALCDATE('-1D', CALCDATE('+1M', TempDate1));
                SETRANGE("Pay Date", TempDate1, TempDate2);
                IF PaymentType = 2 THEN
                    SETRANGE("Payable Type", 0, 2)
                ELSE
                    SETFILTER("Payable Type", ' = %1', PaymentType);
                IF FIND('-') THEN
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

    trigger OnInitReport();
    begin
        Year := DATE2DMY(WORKDATE, 3);
    end;

    trigger OnPreReport();
    begin
        EmpFilter := "Pay Employee Net".GETFILTERS;
    end;

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        PayEmployeeNet: Record "Pay Employee Net";
        Year: Integer;
        Month: Option;
        IsCash: Boolean;
        TempDate1: Date;
        TempDate2: Date;
        PayableType: Text[30];
        PaymentType: Option Cash,Cheque,All;
        EmpFilter: Text[250];
        Employee___Net_Pay_SummaryCaptionLbl: Label 'Employee - Net Pay Summary';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        NameCaptionLbl: Label 'Name';
        Payment_TypeCaptionLbl: Label 'Payment Type';
}

