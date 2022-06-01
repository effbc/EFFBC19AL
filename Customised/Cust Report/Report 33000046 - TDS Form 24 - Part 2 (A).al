report 33000046 "TDS Form 24 - Part 2 (A)"
{
    // version NEOGYNPAY13.70.00.06

    DefaultLayout = RDLC;
    RDLCLayout = './TDS Form 24 - Part 2 (A).rdlc';

    dataset
    {
        dataitem(Employee; Employee)
        {
            column(CurrReport_PAGENO; CurrReport.PAGENO)
            {
            }
            column(Employee__First_Name______Employee__Last_Name_; Employee."First Name" + ' ' + Employee."Last Name")
            {
            }
            column(SlNo; SlNo)
            {
            }
            column(Employee__PAN_No_; "PAN No")
            {
            }
            column(Employee_Address_________Employee__Address_2________Employee_City; Employee.Address + ' ' + Employee."Address 2" + ' ' + Employee.City)
            {
            }
            column(OccupationDesc; OccupationDesc)
            {
            }
            column(DateEmployed; DateEmployed)
            {
            }
            column(DateUptoEmployed; DateUptoEmployed)
            {
            }
            column(V6_Caption; V6_CaptionLbl)
            {
            }
            column(Details_of_salary_paid_and_tax_deducted_thereon_from_employeesCaption; Details_of_salary_paid_and_tax_deducted_thereon_from_employeesCaptionLbl)
            {
            }
            column(Employee__PAN_No_Caption; FIELDCAPTION("PAN No"))
            {
            }
            column(Sl__No_Caption; Sl__No_CaptionLbl)
            {
            }
            column(Name_of_the_employeeCaption; Name_of_the_employeeCaptionLbl)
            {
            }
            column(Residential_Address_of_the_EmployeeCaption; Residential_Address_of_the_EmployeeCaptionLbl)
            {
            }
            column(Occupational_Classification_CodeCaption; Occupational_Classification_CodeCaptionLbl)
            {
            }
            column(Date_from_which_employed_during_the_financial_year__Caption; Date_from_which_employed_during_the_financial_year__CaptionLbl)
            {
            }
            column(Date_upto_which_employed_during_the_financial_year__Caption; Date_upto_which_employed_during_the_financial_year__CaptionLbl)
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
            column(V5_Caption; V5_CaptionLbl)
            {
            }
            column(V6_Caption_Control22; V6_Caption_Control22Lbl)
            {
            }
            column(V7_Caption; V7_CaptionLbl)
            {
            }
            column(PageCaption; PageCaptionLbl)
            {
            }
            column(Employee_No_; "No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                Employee.RESET;
                Employee.SETFILTER("Leave Date", '>%1|%2', CALCDATE('-1Y', StDate), 0D);
                Employee.SETFILTER("Employment Date", '<%1', CALCDATE('-1Y', EndDate));
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
        SlNo: Integer;
        DateEmployed: Date;
        DateUptoEmployed: Date;
        StDate: Date;
        EndDate: Date;
        PAYYEARID: Integer;
        PayYear: Record "Pay Year";
        Text0001: Label 'Please setup Assessment Year';
        PayOccupationClassification: Record "Pay Occupation Classification";
        OccupationDesc: Text[30];
        V6_CaptionLbl: Label '6.';
        Details_of_salary_paid_and_tax_deducted_thereon_from_employeesCaptionLbl: Label 'Details of salary paid and tax deducted thereon from employees';
        Sl__No_CaptionLbl: Label 'Sl. No.';
        Name_of_the_employeeCaptionLbl: Label 'Name of the employee';
        Residential_Address_of_the_EmployeeCaptionLbl: Label 'Residential Address of the Employee';
        Occupational_Classification_CodeCaptionLbl: Label 'Occupational Classification Code';
        Date_from_which_employed_during_the_financial_year__CaptionLbl: Label '"Date from which employed during the financial year  "';
        Date_upto_which_employed_during_the_financial_year__CaptionLbl: Label '"Date upto which employed during the financial year  "';
        V1_CaptionLbl: Label '(1)';
        V2_CaptionLbl: Label '(2)';
        V3_CaptionLbl: Label '(3)';
        V4_CaptionLbl: Label '(4)';
        V5_CaptionLbl: Label '(5)';
        V6_Caption_Control22Lbl: Label '(6)';
        V7_CaptionLbl: Label '(7)';
        PageCaptionLbl: Label 'Page';
}

