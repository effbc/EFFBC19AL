report 33000024 "TDS -  Monthly Payment"
{
    // version NEOGYNPAY13.70.00.06

    DefaultLayout = RDLC;
    RDLCLayout = './TDS -  Monthly Payment.rdlc';

    dataset
    {
        dataitem(Employee;Employee)
        {
            DataItemTableView = SORTING(No.);
            RequestFilterFields = "No.","Job Title/Grade","Branch Code","Department Code";
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
            column(ForMonth;ForMonth)
            {
            }
            column(Year;Year)
            {
            }
            column(Ctr;Ctr)
            {
            }
            column(Employee__No__;"No.")
            {
            }
            column(Name;Name)
            {
            }
            column(Employee__Job_Title_Grade_;"Job Title/Grade")
            {
            }
            column(Employee__Branch_Code_;"Branch Code")
            {
            }
            column(Employee__Department_Code_;"Department Code")
            {
            }
            column(PayableAmt;PayableAmt)
            {
            }
            column(TotalPayable;TotalPayable)
            {
            }
            column(Detail_of_Tax_Deducted_at_source_from_Employee_s_salary_for_the_Month_of_Caption;Detail_of_Tax_Deducted_at_source_from_Employee_s_salary_for_the_Month_of_CaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
            {
            }
            column(SNo_Caption;SNo_CaptionLbl)
            {
            }
            column(Emp_No_Caption;Emp_No_CaptionLbl)
            {
            }
            column(NameCaption;NameCaptionLbl)
            {
            }
            column(GradeCaption;GradeCaptionLbl)
            {
            }
            column(BranchCaption;BranchCaptionLbl)
            {
            }
            column(DepartmentCaption;DepartmentCaptionLbl)
            {
            }
            column(TDS_AmountCaption;TDS_AmountCaptionLbl)
            {
            }
            column(TotalCaption;TotalCaptionLbl)
            {
            }
        }
        dataitem("Pay Employee Pay Details";"Pay Employee Pay Details")
        {
            DataItemTableView = SORTING(PayRollMonthDate,Pay Element Code);
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
        Year :=DATE2DMY(WORKDATE,3);
    end;

    trigger OnPreReport();
    begin

        IF (Month=0) THEN
          ERROR(Text0001);
        IF (Month>12) THEN
          ERROR(Text0002);
        IF Year=0 THEN
          ERROR(Text0003);
        CASE Month OF
          1: ForMonth:='January - ';
          2: ForMonth:='February - ';
          3: ForMonth:='Marhc - ';
          4: ForMonth:='April - ';
          5: ForMonth:='May - ';
          6: ForMonth:='June - ';
          7: ForMonth:='July - ';
          8: ForMonth:='August - ';
          9: ForMonth:='September - ';
          10: ForMonth:='October - ';
          11: ForMonth:='November - ';
          12: ForMonth:='December - ';
        END;
    end;

    var
        Ctr : Integer;
        Name : Text[100];
        PayableAmt : Decimal;
        Month : Integer;
        Year : Integer;
        ForMonth : Text[30];
        TotalPayable : Decimal;
        Text0001 : Label 'The month value can not be left blank please choose a month.';
        Text0002 : Label 'Please choose a valid month.';
        Text0003 : Label 'The year value can not be left blank please choose a year.';
        MonthName : Option January,February,March,April,May,June,July,August,September,October,November,December;
        Detail_of_Tax_Deducted_at_source_from_Employee_s_salary_for_the_Month_of_CaptionLbl : Label '"Detail of Tax Deducted at source from Employee''s salary for the Month of "';
        CurrReport_PAGENOCaptionLbl : Label 'Page';
        SNo_CaptionLbl : Label 'SNo.';
        Emp_No_CaptionLbl : Label 'Emp No.';
        NameCaptionLbl : Label 'Name';
        GradeCaptionLbl : Label 'Grade';
        BranchCaptionLbl : Label 'Branch';
        DepartmentCaptionLbl : Label 'Department';
        TDS_AmountCaptionLbl : Label 'TDS Amount';
        TotalCaptionLbl : Label 'Total';
}

