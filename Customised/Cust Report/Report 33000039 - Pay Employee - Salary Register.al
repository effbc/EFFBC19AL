report 33000039 "Pay Employee - Salary Register"
{
    // version NEOGYNPAY13.70.00.06

    DefaultLayout = RDLC;
    RDLCLayout = './Pay Employee - Salary Register.rdlc';

    dataset
    {
        dataitem(Employee;Employee)
        {
            DataItemTableView = SORTING(No.);
            RequestFilterFields = "No.";
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
            column(Salary_Period_______MonthYear;'Salary Period : ' + MonthYear)
            {
            }
            column(EmployeesFilter;EmployeesFilter)
            {
            }
            column(First_Name_____Last_Name_;"First Name" + "Last Name")
            {
            }
            column(SNo;SNo)
            {
            }
            column(TotalBasicAllowances;TotalBasicAllowances)
            {
            }
            column(TotalMonthlyAllowances;TotalMonthlyAllowances)
            {
            }
            column(TotalYearlyAllowances;TotalYearlyAllowances)
            {
            }
            column(TotalAllowances;TotalAllowances)
            {
            }
            column(V1_TotalLoanAdvDeductions;-1*TotalLoanAdvDeductions)
            {
            }
            column(TotalPFDeductions;-TotalPFDeductions)
            {
            }
            column(TotalESIDeductions;-TotalESIDeductions)
            {
            }
            column(TotalDeductions;-TotalDeductions)
            {
            }
            column(NetAmount;NetAmount)
            {
            }
            column(OTAllowances;OTAllowances)
            {
            }
            column(SalaryPaymentDate;SalaryPaymentDate)
            {
            }
            column(Employee__Father_Husband_;"Father/Husband")
            {
            }
            column(TotalTDSDeductions;-TotalTDSDeductions)
            {
            }
            column(Register_of_Employment_and_Renumeration_of_EmployeesCaption;Register_of_Employment_and_Renumeration_of_EmployeesCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Name_of_the_EmployeeCaption;Name_of_the_EmployeeCaptionLbl)
            {
            }
            column(Sl__No_Caption;Sl__No_CaptionLbl)
            {
            }
            column(REMUNERATION_DUECaption;REMUNERATION_DUECaptionLbl)
            {
            }
            column(LESS_DEDUCTIONSCaption;LESS_DEDUCTIONSCaptionLbl)
            {
            }
            column(Basic_SalaryCaption;Basic_SalaryCaptionLbl)
            {
            }
            column(Monthly_AllowancesCaption;Monthly_AllowancesCaptionLbl)
            {
            }
            column(Yearly_AllowancesCaption;Yearly_AllowancesCaptionLbl)
            {
            }
            column(Loan_AdvancesCaption;Loan_AdvancesCaptionLbl)
            {
            }
            column(Consolidated_SalaryCaption;Consolidated_SalaryCaptionLbl)
            {
            }
            column(OvertimeCaption;OvertimeCaptionLbl)
            {
            }
            column(Professional_TaxCaption;Professional_TaxCaptionLbl)
            {
            }
            column(PFCaption;PFCaptionLbl)
            {
            }
            column(ESICaption;ESICaptionLbl)
            {
            }
            column(Total_DeductionsCaption;Total_DeductionsCaptionLbl)
            {
            }
            column(Net_AmountCaption;Net_AmountCaptionLbl)
            {
            }
            column(Date_of_paymentCaption;Date_of_paymentCaptionLbl)
            {
            }
            column(RemarksCaption;RemarksCaptionLbl)
            {
            }
            column(Employee_s_SignatureCaption;Employee_s_SignatureCaptionLbl)
            {
            }
            column(Employee__Father_Husband_Caption;FIELDCAPTION("Father/Husband"))
            {
            }
            column(TDSCaption;TDSCaptionLbl)
            {
            }
            column(EmptyStringCaption;EmptyStringCaptionLbl)
            {
            }
            column(EmptyStringCaption_Control1102151050;EmptyStringCaption_Control1102151050Lbl)
            {
            }
            column(EmptyStringCaption_Control1102151051;EmptyStringCaption_Control1102151051Lbl)
            {
            }
            column(EmptyStringCaption_Control1102151052;EmptyStringCaption_Control1102151052Lbl)
            {
            }
            column(Employee_No_;"No.")
            {
            }

            trigger OnPreDataItem();
            begin
                LastFieldNo := FIELDNO("No.");
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
        Month :=DATE2DMY(WORKDATE,2);
        MonthList := DATE2DMY(WORKDATE,2)-1;
        Year :=DATE2DMY(WORKDATE,3);
        PayrollDate :=CALCULATELASTDATEOFMONTH(Month,Year);
    end;

    trigger OnPreReport();
    begin
        Month :=MonthList +1;
        PayrollDate :=CALCULATELASTDATEOFMONTH(Month,Year);
        MonthYear :=FORMAT(PayrollDate,0,'<Month Text>-<year>.');

        IF Employee.HASFILTER THEN
           EmployeesFilter := Employee.TABLECAPTION + Employee.GETFILTERS;

         PayElements.RESET;
         PayElements.SETRANGE("Basic Pay",TRUE);
         IF PayElements.FIND('-') THEN
             BasicCode := PayElements.Code
         ELSE
            ERROR(Text0003);

         PFCode := 'PF';
         ESICode := 'ESI';
         TDSCode := 'TDS';
         LoanCode := 'LOANDED';
         AdvCode := 'ADVANCE';
    end;

    var
        LastFieldNo : Integer;
        FooterPrinted : Boolean;
        SNo : Integer;
        MonthList : Option January,February,March,April,May,June,July,August,September,October,November,December;
        Year : Integer;
        Month : Integer;
        PayrollDate : Date;
        Text0001 : Label 'Please provide a valid month.';
        Text0002 : Label 'The month value can not be left blank.';
        MonthYear : Text[30];
        PayDetails : Record "Pay Employee Pay Details";
        PayElements : Record "Pay Elements";
        PaymentLine : Record "Pay Salary Payment Line";
        BasicCode : Text[30];
        PFCode : Text[30];
        ESICode : Text[30];
        TDSCode : Text[30];
        LoanCode : Text[30];
        AdvCode : Text[30];
        TotalBasicAllowances : Decimal;
        TotalMonthlyAllowances : Decimal;
        TotalYearlyAllowances : Decimal;
        TotalAllowances : Decimal;
        OTAllowances : Decimal;
        TotalLoanDeductions : Decimal;
        TotalAdvDeductions : Decimal;
        TotalLoanAdvDeductions : Decimal;
        TotalPFDeductions : Decimal;
        TotalESIDeductions : Decimal;
        TotalTDSDeductions : Decimal;
        TotalDeductions : Decimal;
        NetAmount : Decimal;
        SalaryPaymentDate : Date;
        EmployeesFilter : Text[30];
        Text0003 : Label 'No records available';
        Register_of_Employment_and_Renumeration_of_EmployeesCaptionLbl : Label 'Register of Employment and Renumeration of Employees';
        CurrReport_PAGENOCaptionLbl : Label 'Page';
        Name_of_the_EmployeeCaptionLbl : Label 'Name of the Employee';
        Sl__No_CaptionLbl : Label 'Sl. No.';
        REMUNERATION_DUECaptionLbl : Label 'REMUNERATION DUE';
        LESS_DEDUCTIONSCaptionLbl : Label 'LESS DEDUCTIONS';
        Basic_SalaryCaptionLbl : Label 'Basic Salary';
        Monthly_AllowancesCaptionLbl : Label 'Monthly Allowances';
        Yearly_AllowancesCaptionLbl : Label 'Yearly Allowances';
        Loan_AdvancesCaptionLbl : Label 'Loan/Advances';
        Consolidated_SalaryCaptionLbl : Label 'Consolidated Salary';
        OvertimeCaptionLbl : Label 'Overtime';
        Professional_TaxCaptionLbl : Label 'Professional Tax';
        PFCaptionLbl : Label 'PF';
        ESICaptionLbl : Label 'ESI';
        Total_DeductionsCaptionLbl : Label 'Total Deductions';
        Net_AmountCaptionLbl : Label 'Net Amount';
        Date_of_paymentCaptionLbl : Label 'Date of payment';
        RemarksCaptionLbl : Label 'Remarks';
        Employee_s_SignatureCaptionLbl : Label 'Employee''s Signature';
        TDSCaptionLbl : Label 'TDS';
        EmptyStringCaptionLbl : Label '>';
        EmptyStringCaption_Control1102151050Lbl : Label '<';
        EmptyStringCaption_Control1102151051Lbl : Label '<';
        EmptyStringCaption_Control1102151052Lbl : Label '>';

    [LineStart(20480)]
    procedure CALCULATELASTDATEOFMONTH(Month : Integer;Year : Integer) PayDate : Date;
    begin
        PayDate :=DMY2DATE(1,Month,Year);
        PayDate := CALCDATE('+1M-1D',PayDate);
    end;
}

