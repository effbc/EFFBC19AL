report 33000076 "Payroll Bonus Calculation"
{
    // version NEOGYNPAY13.70.00.06

    Caption = 'Payroll Bonus Calculation';
    ProcessingOnly = true;

    dataset
    {
        dataitem(Employee; Employee)
        {
            DataItemTableView = SORTING(No.) ORDER(Ascending) WHERE(Leave Date=FILTER(''));
            RequestFilterFields = "No.","Job Title/Grade";

            trigger OnPreDataItem();
            begin
                PayPayrollFunctions."Bonus Calculation"(Employee);
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
        IF NOT PayCompanyPolicy.GET THEN ERROR(Text0001);
        IF PayCompanyPolicy."Payroll Processing Month Date" = 0D THEN ERROR(Text0002);
        IF PayCompanyPolicy.MonthlyAttendanceProcessed = FALSE THEN ERROR(Error0001);

        Employee.SETRANGE(Employee."Leave Date",0D);
        Employee.SETRANGE(Employee."Salary Posted",FALSE);
        IF NOT Employee.FIND('-') THEN ERROR(Error0002);
    end;

    var
        PayCompanyPolicy : Record "Pay Company Policy";
        Text0001 : Label 'Company Policies Not Defined';
        Text0002 : Label 'Define Processing Date';
        Error0001 : Label 'Monthly Attendance  Not Processed';
        Error0002 : Label 'Already Posting done for all employees';
        PayPayrollFunctions : Codeunit "Pay Payroll Functions";
}

