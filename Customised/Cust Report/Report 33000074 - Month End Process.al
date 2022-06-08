report 33000074 "Month End Process"
{
    // version NEOGYNPAY13.70.00.06

    // //NEOGYNPAY13.10.01
    // //Month End Process

    ProcessingOnly = true;
    ShowPrintStatus = false;
    UseRequestPage = false;

    dataset
    {
        dataitem(Employee; Employee)
        {

            trigger OnAfterGetRecord();
            var
                EmployeeLocal: Record Employee;
                Text0001: Label 'Posting has not been done for Employee No. %1.';
                Text0002: Label 'Processing  has not been done for Employee No. %1.';
            begin
                //NEOGYNPAY13.10.01
                //Month End Process

                EmployeeLocal.RESET;
                EmployeeLocal.SETRANGE("No.", Employee."No.");
                EmployeeLocal.SETFILTER("Leave Date", '=%1', 0D);
                EmployeeLocal.SETRANGE("Salary Processed", FALSE);
                IF EmployeeLocal.FIND('-') THEN BEGIN
                    ERROR(Text0002, Employee."No.");
                END
                ELSE BEGIN
                    EmployeeLocal.SETRANGE("Salary Posted", FALSE);
                    IF EmployeeLocal.FIND('-') THEN
                        ERROR(Text0001, Employee."No.");
                END;
            end;

            trigger OnPostDataItem();
            begin
                //NEOGYNPAY13.10.01
                //Month End Process

                MonthEndProcess;
            end;

            trigger OnPreDataItem();
            var
                Error0001: Label 'Monthly Attendance  Not Processed';
                Text0001: Label 'Company Policies Not Defined';
                Text0002: Label 'Define Processing Date';
            begin
                //NEOGYNPAY13.10.01
                //Month End Process

                IF NOT PayCompanyPolicyGlobal.GET THEN ERROR(Text0001);
                IF PayCompanyPolicyGlobal."Payroll Processing Month Date" = 0D THEN ERROR(Text0002);
                IF PayCompanyPolicyGlobal.MonthlyAttendanceProcessed = FALSE THEN ERROR(Error0001);
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
        PayCompanyPolicyGlobal: Record "Pay Company Policy";

    (20965)]
    procedure MonthEndProcess();
    var
        nextDate: Date;
        EmployeeLocal: Record Employee;
    begin
        //NEOGYNPAY13.10.01
        //Month End Process

        EmployeeLocal.RESET;
        EmployeeLocal.SETRANGE("No.", Employee."No.");
        EmployeeLocal.SETFILTER("Leave Date", '=%1', 0D);
        EmployeeLocal.SETRANGE("Salary Processed", TRUE);
        EmployeeLocal.SETRANGE("Salary Posted", TRUE);
        IF EmployeeLocal.FIND('-') THEN BEGIN
            IF PayCompanyPolicyGlobal.FIND('-') THEN BEGIN
                nextDate := CALCDATE('+2M', PayCompanyPolicyGlobal."Payroll Processing Month Date");
                nextDate := DMY2DATE(1, DATE2DMY(nextDate, 2), DATE2DMY(nextDate, 3));

                PayCompanyPolicyGlobal."Payroll Processing Month Date" := CALCDATE('-1D', nextDate);
                PayCompanyPolicyGlobal.MonthlyAttendanceProcessed := FALSE;
                PayCompanyPolicyGlobal."Bonus Declare Date" := 0D;
                PayCompanyPolicyGlobal.MODIFY;

                EmployeeLocal.RESET;
                EmployeeLocal.SETFILTER("Leave Date", '=%1', 0D);
                IF EmployeeLocal.FIND('-') THEN BEGIN
                    EmployeeLocal.MODIFYALL("Salary Processed", FALSE);
                    EmployeeLocal.MODIFYALL("Salary Posted", FALSE);
                END;
                MESSAGE('Month End Processing Done');
            END;
        END;
    end;
}

