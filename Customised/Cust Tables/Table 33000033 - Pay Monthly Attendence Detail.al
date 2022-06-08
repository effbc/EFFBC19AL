table 33000033 "Pay Monthly Attendence Detail"
{
    DataClassification = CustomerContent;
    // version NEOGYNPAY13.70.00.06


    fields
    {
        field(1; "Employee No"; Code[20])
        {
            NotBlank = true;
            TableRelation = Employee."No.";
            DataClassification = CustomerContent;
        }
        field(2; Year; Integer)
        {
            Editable = true;
            DataClassification = CustomerContent;
        }
        field(3; Month; Integer)
        {
            Editable = true;
            DataClassification = CustomerContent;
        }
        field(5; "Employee Name"; Text[250])
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(14; "Present Days"; Integer)
        {
            CalcFormula = Count("Pay Daily Attendence Detail" WHERE("Employee Code" = FIELD("Employee No"),
                                                                     Year = FIELD(Year),
                                                                     Month = FIELD(Month),
                                                                     Active = CONST(true),
                                                                     Status = CONST(Present)));
            FieldClass = FlowField;
        }
        field(15; "LWP Days (Half-Days)"; Integer)
        {
            CalcFormula = Count("Pay Daily Attendence Detail" WHERE("Employee Code" = FIELD("Employee No"),
                                                                     Year = FIELD(Year),
                                                                     Month = FIELD(Month),
                                                                     Active = CONST(true),
                                                                     Status = CONST("LWP(Half-Day)")));
            FieldClass = FlowField;
        }
        field(16; Holiday; Integer)
        {
            CalcFormula = Count("Pay Daily Attendence Detail" WHERE("Employee Code" = FIELD("Employee No"),
                                                                     Year = FIELD(Year),
                                                                     Month = FIELD(Month),
                                                                     Active = CONST(true),
                                                                     Holiday = CONST(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(17; "Off Day"; Integer)
        {
            CalcFormula = Count("Pay Daily Attendence Detail" WHERE("Employee Code" = FIELD("Employee No"),
                                                                     Year = FIELD(Year),
                                                                     Month = FIELD(Month),
                                                                     Active = CONST(true),
                                                                     "Off Day" = CONST(true),
                                                                     Status = CONST("Off-Day"),
                                                                     "Off Type" = CONST("Full-Day")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(18; "LWP Days (Full-Days)"; Integer)
        {
            CalcFormula = Count("Pay Daily Attendence Detail" WHERE("Employee Code" = FIELD("Employee No"),
                                                                     Year = FIELD(Year),
                                                                     Month = FIELD(Month),
                                                                     Active = CONST(true),
                                                                     Status = CONST("LWP(Full-Day)")));
            FieldClass = FlowField;

            trigger OnValidate();
            begin
                TotalDayInMonth;
            end;
        }
        field(20; "Overtime Hours"; Decimal)
        {
            CalcFormula = Sum("Pay Daily Attendence Detail"."Approved Extra Hours Worked" WHERE("Employee Code" = FIELD("Employee No"),
                                                                                                 Year = FIELD(Year),
                                                                                                 Month = FIELD(Month),
                                                                                                 Active = CONST(true),
                                                                                                 "OT Applicable" = CONST(true)));
            FieldClass = FlowField;
        }
        field(21; "Leave (Full-Days)"; Integer)
        {
            CalcFormula = Count("Pay Daily Attendence Detail" WHERE("Employee Code" = FIELD("Employee No"),
                                                                     Year = FIELD(Year),
                                                                     Month = FIELD(Month),
                                                                     Active = CONST(true),
                                                                     Status = CONST(Leave)));
            FieldClass = FlowField;
        }
        field(23; "Late Coming"; Integer)
        {
            CalcFormula = Count("Pay Daily Attendence Detail" WHERE("Employee Code" = FIELD("Employee No"),
                                                                     Year = FIELD(Year),
                                                                     Month = FIELD(Month),
                                                                     "Late Coming" = CONST(true)));
            FieldClass = FlowField;
        }
        field(40; "Paid Days"; Decimal)
        {
            CalcFormula = Sum("Pay Paid"."Paid Days" WHERE(Year = FIELD(Year),
                                                            Month = FIELD(Month),
                                                            "Employee Code" = FIELD("Employee No")));
            Description = 'Month days -18-(15/2)-N.A-Late coming(accord. to formula in company policy)';
            Editable = true;
            FieldClass = FlowField;
        }
        field(45; "Daily Attendance Import"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50; "Salary Processed"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(55; "Department Code"; Code[20])
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(60; Grade; Code[10])
        {
            Editable = false;
            TableRelation = "Pay Grade"."Designation Code";
            DataClassification = CustomerContent;
        }
        field(65; Branch; Code[20])
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(66; "Location Code"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(67; "Job Title Code"; Code[20])
        {
            TableRelation = "Job Titles"."Job Code";
            DataClassification = CustomerContent;
        }
        field(70; "Department Filter"; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(75; "Grade Filter"; Code[10])
        {
            Editable = false;
            FieldClass = FlowFilter;
            TableRelation = "Pay Grade"."Designation Code";
        }
        field(80; "Branch Filter"; Code[20])
        {
            Editable = false;
            FieldClass = FlowFilter;
        }
        field(90; "Month closed"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50021; "Employee Leave Date"; Date)
        {
            CalcFormula = Lookup(Employee."Leave Date" WHERE("No." = FIELD("Employee No")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Employee No", Month, Year)
        {
        }
    }

    fieldgroups
    {
    }

    var
        PayPayrollEmployee: Record Employee;
        PayCompanyPolicy: Record "Pay Company Policy";
        PayEmployeeLeaveApplication: Record "Pay Employee Leave Application";
        PayEmployeeLeaveEntitled: Record "Pay Employee Leave Entitled";
        PayLeaveMaster: Record "Pay Leave";
        PaySBHMNCR: Record "Pay Holidays";
        PayMonthlyAttendanceHead: Record "Pay Monthly Attendence Detail";
        StartDate: Date;
        EndDate: Date;
        MonthDays: Integer;
        CheckDays: Boolean;
        LeavePerMonth: Integer;
        Winstatus: Dialog;
        Ctr: Integer;
        Text001: Label 'Month and Year values are missing for attendance';
        PayPaidDays: Record "Pay Paid";
        PayBranches: Record "Pay Branch";
        PayDailyAttendance: Record "Pay Daily Attendence Detail";
        PaidDays: Decimal;


    procedure TotalDayInMonth() TotalMonthdays: Integer;
    var
        TotalDays: Integer;
    begin
        if (Month = 0) or (Year = 0) then
            Error(Text001);
        StartDate := DMY2Date(1, Month, Year);
        EndDate := CalcDate('1M-1D', StartDate);
        MonthDays := Date2DMY(EndDate, 1);
        TotalMonthdays := Date2DMY(EndDate, 1);
        exit(TotalMonthdays);
    end;


    procedure "Calculate PaidDays"();
    begin
        UpdateBranchCodes();
        PayBranches.Reset;
        if not PayBranches.Find('-') then
            InsertIntoPaidDays('', '')
        else begin
            InsertIntoPaidDays('', '');
            repeat
                InsertIntoPaidDays(PayBranches.Code, PayBranches."State Code");
            until PayBranches.Next() = 0;
        end;


        /*
        CALCFIELDS("Present Days",
                   "LWP Days (Half-Days)",
                   "LWP Days (Full-Days)",
                   "Late Coming",
                   "Leave (Full-Days)",
                   Holiday,
                   "Off Day");
        
        "Paid Days" := "Present Days"
                       + ("LWP Days (Half-Days)" / 2)
                       + "Leave (Full-Days)"
                       + Holiday
                       + "Off Day"
                       - "Total Days Ded (LC)";
        MODIFY;
         */

    end;


    procedure "Total Days Ded (LC)"(BranchCode: Code[20]) "Total Days to be deducted": Decimal;
    var
        "No. of LC": Integer;
        "No. of days off": Decimal;
        PayBranch: Record "Pay Branch Policy";
        "Total LC": Integer;
    begin
        PayCompanyPolicy.Get;
        if PayCompanyPolicy."Attendance System (Based On)" = PayCompanyPolicy."Attendance System (Based On)"::"Flexi-Hours" then
            exit(0.0);

        if (PayCompanyPolicy."Payroll System (Based on)" = PayCompanyPolicy."Payroll System (Based on)"::"Company-Based")
           or (BranchCode = '') then begin
            "No. of LC" := PayCompanyPolicy."No. of Late Comings in a month";
            "No. of days off" := PayCompanyPolicy."No. of Days off (Against LC)";
        end else begin
            PayPayrollEmployee.SetFilter(PayPayrollEmployee."No.", "Employee No");
            PayPayrollEmployee.Find('-');
            PayBranch.SetFilter(PayBranch."Branch Code", BranchCode);
            if PayBranch.Find('-') then begin
                "No. of LC" := PayBranch."No. of Late Comings in a month";
                "No. of days off" := PayBranch."No. of Days off (Against LC)";
            end;
        end;

        PayDailyAttendance.SetRange("Late Coming", true);
        "Total LC" := PayDailyAttendance.Count();

        if ("No. of LC" <> 0) and ("Total LC" >= "No. of LC") then
            "Total Days to be deducted" := Round("Total LC" / "No. of LC", 1, '<') * "No. of days off"
        else
            "Total Days to be deducted" := 0.0;

        exit("Total Days to be deducted");
    end;


    procedure InsertIntoPaidDays(BranchCode: Code[20]; StateCode: Code[20]);
    begin
        StartDate := DMY2Date(1, Month, Year);
        EndDate := CalcDate('1M-1D', StartDate);
        PaidDays := 0;
        PayDailyAttendance.Reset();
        PayDailyAttendance.SetRange(PayDailyAttendance."Employee Code", "Employee No");
        PayDailyAttendance.SetRange("Attend Date", StartDate, EndDate);
        PayDailyAttendance.SetRange(PayDailyAttendance.Branch, BranchCode);
        PayDailyAttendance.SetRange(PayDailyAttendance.Status, PayDailyAttendance.Status::Present);
        PaidDays := PayDailyAttendance.Count;
        PayDailyAttendance.SetRange(PayDailyAttendance.Status, PayDailyAttendance.Status::"LWP(Half-Day)");
        PaidDays += (PayDailyAttendance.Count / 2);
        PayDailyAttendance.SetRange(PayDailyAttendance.Status, PayDailyAttendance.Status::Holiday);
        PaidDays += (PayDailyAttendance.Count);
        PayDailyAttendance.SetRange(PayDailyAttendance.Status, PayDailyAttendance.Status::"Off-Day");
        PayDailyAttendance.SetRange(PayDailyAttendance."Off Type", PayDailyAttendance."Off Type"::"Full-Day");
        PaidDays += (PayDailyAttendance.Count);
        PayDailyAttendance.SetRange(PayDailyAttendance.Status, PayDailyAttendance.Status::"Off-Day");
        PayDailyAttendance.SetRange(PayDailyAttendance."Off Type", PayDailyAttendance."Off Type"::"Half-Day");
        PaidDays += (PayDailyAttendance.Count / 2);
        PayDailyAttendance.SetRange(PayDailyAttendance."Off Type");

        PayDailyAttendance.SetRange(PayDailyAttendance.Status, PayDailyAttendance.Status::Leave);
        PayDailyAttendance.SetRange(PayDailyAttendance."Leave Type", PayDailyAttendance."Leave Type"::"Full-Day");
        PaidDays += PayDailyAttendance.Count;
        PayDailyAttendance.SetRange(PayDailyAttendance."Leave Type", PayDailyAttendance."Leave Type"::"Half-Day");
        PaidDays += (PayDailyAttendance.Count / 2);
        PayDailyAttendance.SetRange(PayDailyAttendance."Leave Type");
        PayDailyAttendance.SetRange(PayDailyAttendance.Status);

        if PayDailyAttendance.Find('-') and (PaidDays > 0) then begin
            PayPaidDays.SetRange(PayPaidDays.Year, Year);
            PayPaidDays.SetRange(PayPaidDays.Month, Month);
            PayPaidDays.SetRange(PayPaidDays."Employee Code", "Employee No");
            PayPaidDays.SetRange(PayPaidDays."Branch Code", BranchCode);
            if PayPaidDays.Find('-') then begin
                PayPaidDays.State := StateCode;
                PayPaidDays."Location Code" := "Location Code";
                PayPaidDays."Job Title Code" := "Job Title Code";
                PayPaidDays.Grade := Grade;
                PayPaidDays."Deduction for LC" := "Total Days Ded (LC)"(BranchCode);
                PayPaidDays."Paid Days" := PaidDays - PayPaidDays."Deduction for LC";
                PayPaidDays.PayRollMonthDate := PayCompanyPolicy."Payroll Processing Month Date";
                PayPaidDays.ForMonthDate := PayCompanyPolicy."Payroll Processing Month Date";
                PayPaidDays.Modify();
            end else begin
                PayPaidDays.Init;
                PayPaidDays.Year := Year;
                PayPaidDays.Month := Month;
                PayPaidDays."Employee Code" := "Employee No";
                PayPaidDays."Branch Code" := BranchCode;
                PayPaidDays."Employee Name" := PayPayrollEmployee.FullName;
                PayPaidDays.State := StateCode;
                PayPaidDays.Grade := Grade;
                PayPaidDays."Location Code" := "Location Code";
                PayPaidDays."Job Title Code" := "Job Title Code";
                PayPaidDays."Professional Tax Salary" := 0;
                PayPaidDays."Professional Tax" := 0;
                PayPaidDays.AYID := 0;
                PayPaidDays."Deduction for LC" := "Total Days Ded (LC)"(BranchCode);
                PayPaidDays."Paid Days" := PaidDays - PayPaidDays."Deduction for LC";
                PayPaidDays.PayRollMonthDate := PayCompanyPolicy."Payroll Processing Month Date";
                PayPaidDays.ForMonthDate := PayCompanyPolicy."Payroll Processing Month Date";
                PayPaidDays.Insert();
            end
        end else begin
            PayPaidDays.SetRange(PayPaidDays.Year, Year);
            PayPaidDays.SetRange(PayPaidDays.Month, Month);
            PayPaidDays.SetRange(PayPaidDays."Employee Code", "Employee No");
            PayPaidDays.SetRange(PayPaidDays."Branch Code", BranchCode);
            if PayPaidDays.Find('-') then
                PayPaidDays.Delete();
        end;
    end;


    procedure UpdateBranchCodes();
    begin
        StartDate := DMY2Date(1, Month, Year);
        EndDate := CalcDate('1M-1D', StartDate);

        PayDailyAttendance.Reset();
        PayDailyAttendance.SetRange(PayDailyAttendance."Employee Code", "Employee No");
        PayDailyAttendance.SetRange(PayDailyAttendance."Attend Date", StartDate, EndDate);
        if PayDailyAttendance.Find('-') then
            repeat
                //
                //  PayDailyAttendance.Branch := PayPayrollEmployee.GetBranchCode("Employee No",PayDailyAttendance."Attend Date");
                PayDailyAttendance.Modify();
            until PayDailyAttendance.Next() = 0;
        Commit;
    end;
}

