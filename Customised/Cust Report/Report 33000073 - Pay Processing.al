report 33000073 "Pay Processing"
{
    // version NEOGYNPAY13.70.00.06

    ProcessingOnly = true;

    dataset
    {
        dataitem(Employee; Employee)
        {
            DataItemTableView = SORTING(No.);
            RequestFilterFields = "No.", "Job Title/Grade";

            trigger OnPreDataItem();
            begin
                CODEUNIT.RUN(CODEUNIT::"Monthly Pay Process", Employee);
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
    var
        Text0001: Label 'Company Policies Not Defined';
        Text0002: Label 'Define Processing Date';
        Error0001: Label 'Monthly Attendance  Not Processed';
        Error0002: Label 'Already Posting done for all employees';
    begin
        IF NOT PayCompanyPolicy.GET THEN ERROR(Text0001);
        IF PayCompanyPolicy."Payroll Processing Month Date" = 0D THEN ERROR(Text0002);
        IF PayCompanyPolicy.MonthlyAttendanceProcessed = FALSE THEN ERROR(Error0001);

        Employee.SETRANGE(Employee."Leave Date", 0D);
        Employee.SETRANGE(Employee."Salary Posted", FALSE);
        IF NOT Employee.FIND('-') THEN ERROR(Error0002);
    end;

    var
        MonthlyPayProcessCu: Codeunit "Monthly Pay Process";
        PayCompanyPolicy: Record "Pay Company Policy";
}

