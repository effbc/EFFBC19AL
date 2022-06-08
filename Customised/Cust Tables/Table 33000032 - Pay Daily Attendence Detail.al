table 33000032 "Pay Daily Attendence Detail"
{
    // version NEOGYNPAY13.70.00.06,NAVIN3.70.00.11

    DrillDownPageID = 33000066;
    LookupPageID = 33000066;
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Employee Code"; Code[20])
        {
            NotBlank = true;
            TableRelation = Employee."No.";
            DataClassification = CustomerContent;
        }
        field(2; "Attend Date"; Date)
        {
            NotBlank = true;
            DataClassification = CustomerContent;
        }
        field(3; "Time in"; Time)
        {
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if ("Time Out" <> 0T) and ("Time in" = 0T) then
                    Error(Text000);

                if ("Time in" = 0T) or ("Time Out" = 0T) then begin
                    if Holiday then
                        Status := Status::Holiday
                    else
                        if "Off Day" then
                            Status := Status::"Off-Day"
                        else
                            Status := Status::Present;
                    "Extra Hours Worked" := 0;
                    "Hours Present" := 0;
                end
                else
                    TimeCalculate;
            end;
        }
        field(4; "Time Out"; Time)
        {
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if ("Time in" = 0T) or ("Time Out" = 0T) then begin
                    if Holiday then
                        Status := Status::Holiday
                    else
                        if "Off Day" then
                            Status := Status::"Off-Day"
                        else
                            Status := Status::Present;
                    "Extra Hours Worked" := 0;
                    "Hours Present" := 0;
                end else
                    TimeCalculate;
            end;
        }
        field(5; Status; Option)
        {
            OptionMembers = ,Present,Holiday,"Off-Day",Leave,"LWP(Half-Day)","LWP(Full-Day)";
            DataClassification = CustomerContent;

            trigger OnValidate();
            var
                PayPayrollEmployee: Record Employee;
                CompanyPolicy: Record "Pay Company Policy";
                PayBranch: Record "Pay Branch Policy";
                HalfDayHours: Decimal;
                BranchCode: Code[20];
                FullDayHours: Decimal;
                ConsiderHolidays: Boolean;
            begin
                CompanyPolicy.Get;
                PayPayrollEmployee.SetRange(PayPayrollEmployee."No.", "Employee Code");
                PayPayrollEmployee.Find('-');
                HalfDayHours := CompanyPolicy."No of hours in Half-Day";
                ConsiderHolidays := CompanyPolicy."Holiday tobe incl.in cont.Leav";

                if CompanyPolicy."Attendance System (Based On)" = CompanyPolicy."Payroll System (Based on)"::"Branch-Based" then begin
                    //  BranchCode := PayPayrollEmployee.GetBranchCode("Employee Code","Attend Date");
                    if BranchCode <> '' then begin
                        PayBranch.SetRange("Branch Code", BranchCode);
                        if PayBranch.Find('-') then begin
                            if (PayBranch."No of hours in Half-Day") = 0 then
                                Error(Text010, BranchCode);
                            HalfDayHours := PayBranch."No of hours in Half-Day";
                            FullDayHours := PayBranch."No of Hours perday";
                        end else
                            Error(Text002);
                    end;
                end;

                if ConsiderHolidays then begin
                    if (Holiday) and (Status <> Status::Leave) and ((Status <> Status::Holiday)) then
                        Error(Text001);
                    if "Off Day" and (Status <> Status::Leave) and ((Status <> Status::"Off-Day")) then
                        Error(Text001);
                end else begin
                    if (Holiday or "Off Day") and ("Off Type" = "Off Type"::"Full-Day") then
                        Error(Text001);
                end;

                if (xRec.Status = Status::Leave) then begin
                    "Leave Type" := "Leave Type"::"Full-Day";
                    "Leave Code" := '';
                end;

                if (Status = Status::Leave) or
                   (Status = Status::"LWP(Full-Day)") then begin
                    if ("Hours Present" >= HalfDayHours) and (HalfDayHours <> 0) then
                        Error(Text009);
                end;

                if (Status = Status::"LWP(Half-Day)") then begin
                    if ("Hours Present" >= FullDayHours) and (FullDayHours <> 0) then
                        Error(Text011);
                end;

                if (Status = Status::Present) then begin
                    if "Hours Present" < FullDayHours then
                        Error(Text012);
                end;


                if ("Off Day" or Holiday) and ("Off Type" = "Off Type"::"Half-Day") then begin
                    if (Status = Status::"LWP(Full-Day)") or (Status = Status::Leave) then
                        Error(Text006);
                end;


                if ("Off Day" or Holiday) and ("Off Type" = "Off Type"::"Full-Day") then begin
                    if (Status = Status::"LWP(Half-Day)") then
                        Error(Text007);
                end;


                if PayPayrollEmployee."Latest Pay Revision Date" <> 0D then begin
                    if (Date2DMY(PayPayrollEmployee."Latest Pay Revision Date", 2) = Date2DMY("Attend Date", 2)) and
                       (Date2DMY(PayPayrollEmployee."Latest Pay Revision Date", 3) = Date2DMY("Attend Date", 3)) and
                       (Date2DMY(CompanyPolicy."Payroll Processing Month Date", 2) <> Date2DMY(PayPayrollEmployee."Latest Pay Revision Date", 2)) and
                       (Date2DMY(CompanyPolicy."Payroll Processing Month Date", 3) <> Date2DMY(PayPayrollEmployee."Latest Pay Revision Date", 3)) then
                        Error(Text008);
                end;
            end;
        }
        field(6; "Hours Present"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(9; "Off Day"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(10; Holiday; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(11; "Extra Hours Worked"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(13; "Leave Type"; Option)
        {
            OptionMembers = " ","Short-Leave","Half-Day","Full-Day";
            DataClassification = CustomerContent;
        }
        field(14; "Leave Code"; Code[20])
        {
            TableRelation = "Pay Leave"."Leave Code";
            DataClassification = CustomerContent;

            trigger OnValidate();
            var
                AttendanceProcedures: Codeunit "Pay Attendance/Leave Module Fn";
            begin
                if "Leave Code" <> '' then begin
                    if AttendanceProcedures.LeaveIsValidThruDailyAttendanc("Employee Code", "Leave Code", "Leave Type", "Attend Date",
                     "Attend Date") then
                        if (Status = Status::"LWP(Full-Day)") or ("Off Day") or (Holiday) then begin
                            if ("Leave Type" = "Leave Type"::" ") then begin
                                "Leave Type" := "Leave Type"::"Full-Day";
                                Status := Status::Leave;
                            end else
                                Validate("Time Out");
                        end;
                end else begin
                    if "Off Day" then
                        Status := Status::Holiday;

                    if "Off Day" then
                        Status := Status::"Off-Day";

                    if "Off Day" or Holiday then
                        "Leave Type" := "Leave Type"::" ";

                    if "Leave Type" = "Leave Type"::"Full-Day" then begin
                        "Leave Type" := "Leave Type"::" ";
                        TimeCalculate();
                    end;
                end;
            end;
        }
        field(15; "Department Code"; Code[20])
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(20; Grade; Code[10])
        {
            Editable = false;
            TableRelation = "Pay Grade"."Designation Code";
            DataClassification = CustomerContent;
        }
        field(25; Branch; Code[20])
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(30; "Department Filter"; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(33; "Grade Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Pay Grade"."Designation Code";
        }
        field(36; "Branch Filter"; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(48; "Time Sheet Import"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50; "Salary Processed"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(60; "OT Applicable"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(65; "Off Type"; Option)
        {
            OptionMembers = " ","Half-Day","Full-Day";
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
        field(70; "Late Coming"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(75; Year; Integer)
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(76; Month; Integer)
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(80; Active; Boolean)
        {
            Description = 'For Filtering records of current year';
            DataClassification = CustomerContent;
        }
        field(90; "OT Approved"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(100; "Approved Extra Hours Worked"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(101; "Leave Compensation"; Boolean)
        {
            Description = 'Check if this day has been adjusted against a Leave';
            DataClassification = CustomerContent;
        }
        field(102; "Sanctioning Incharge"; Code[10])
        {
            CalcFormula = Lookup(Employee."Sanctioning Incharge" WHERE("No." = FIELD("Employee Code")));
            FieldClass = FlowField;
        }
        field(50021; "Employee Leave Date"; Date)
        {
            CalcFormula = Lookup(Employee."Leave Date" WHERE("No." = FIELD("Employee Code")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Employee Code", "Attend Date")
        {
            SumIndexFields = "Hours Present";
        }
        key(Key2; "OT Applicable", Active, Month, Year, "Employee Code")
        {
            SumIndexFields = "Approved Extra Hours Worked";
        }
        key(Key3; "Extra Hours Worked", "Leave Compensation")
        {
            SumIndexFields = "Extra Hours Worked", "Approved Extra Hours Worked";
        }
    }

    fieldgroups
    {
    }

    trigger OnModify();
    begin
        if Employee.Get("Employee Code") then begin
            if Employee."Leave Date" <> 0D then Error(Text014, "Employee Code");
            PayCompanyPolicy.Get;
            PayCompanyPolicy.TestField(PayCompanyPolicy."Payroll Processing Month Date");
            if Employee."Salary Posted" then Error(Text013, "Employee Code", PayCompanyPolicy."Payroll Processing Month Date");
        end;
    end;

    var
        Text000: Label 'Time in cannot be deleted when Time out exists';
        Text001: Label 'Status for and Off-Day and Holiday cannot be changed';
        Text002: Label 'The branch mentioned for the employee no longer exists';
        Text003: Label 'End time or Start time not defined in the Policy.\Please define timings in the Branch/Company Policy as applicable.';
        Text004: Label 'The attendance record for %1 could not be located';
        Text005: Label 'Time in should be less then time out';
        Text006: Label 'Cannot change to a Full Day status when Leave type is Half-Day';
        Text007: Label 'Cannot change to a Half Day status when Leave type is Full-Day';
        Text008: Label 'Cannot allow modifications in the month of salary revision.';
        Text009: Label 'Cannot change to this status as the Hours present exceeds the no of hours required for Half-Day.';
        Text010: Label 'Policy information missing for %1.Please define your branch policy and try again.';
        Text011: Label 'Cannot change to this status as the Hours present exceeds the no of hours required for Full-Day.';
        Text012: Label 'Cannot change to this status as the Hours Present are less then required.';
        Text013: Label 'Salary Already Posted for Employee No. %1 for Payroll Date %2.';
        Employee: Record Employee;
        PayCompanyPolicy: Record "Pay Company Policy";
        Text014: Label 'Employee No. %1 has left.';

    procedure TimeCalculate();
    var
        AttendanceProcedures: Codeunit "Pay Attendance/Leave Module Fn";
        PayPayrollEmployee: Record Employee;
        PayCompanyPolicy: Record "Pay Company Policy";
        PayBranch: Record "Pay Branch Policy";
        NoOfHoursInHalfDay: Decimal;
        NoOfHoursPerDay: Decimal;
        StartTime: Time;
        EndTime: Time;
        StartTimeWithGrace: Time;
        BranchCode: Code[10];
        AttendanceSystem: Option Flexi,Rigid;
        NormalHrsWorked: Decimal;
        ExtraHrsWorked: Decimal;
        ConsiderCoreForHalfDay: Boolean;
    begin
        if ("Time in" = 0T) or ("Time Out" = 0T) then begin
            "Hours Present" := 0;
            "Extra Hours Worked" := 0;
            exit;
        end;

        if PayCompanyPolicy.Get then begin
            NoOfHoursInHalfDay := PayCompanyPolicy."No of hours in Half-Day";
            NoOfHoursPerDay := PayCompanyPolicy."No of Hours perday";
            if PayCompanyPolicy."Attendance System (Based On)" = PayCompanyPolicy."Attendance System (Based On)"::"Rigid-Hours" then begin
                StartTime := PayCompanyPolicy."Start Time";
                EndTime := PayCompanyPolicy."End Time";
                StartTimeWithGrace := PayCompanyPolicy."Start Time (Incl. Grace Time)";
                AttendanceSystem := AttendanceSystem::Rigid;
            end else begin
                StartTime := PayCompanyPolicy."Core Timing Start";
                EndTime := PayCompanyPolicy."Core Timing End";
                ConsiderCoreForHalfDay := PayCompanyPolicy."Consider Core for Flexi Half";
                AttendanceSystem := AttendanceSystem::Flexi;
            end;
        end;

        if (PayCompanyPolicy."Payroll System (Based on)" = PayCompanyPolicy."Payroll System (Based on)"::"Branch-Based") then begin
            PayPayrollEmployee.SetFilter("No.", "Employee Code");
            PayPayrollEmployee.Find('-');
            //  BranchCode:= PayPayrollEmployee.GetBranchCode("Employee Code","Attend Date");
            PayBranch.SetFilter(PayBranch."Branch Code", BranchCode);
            if PayBranch.Find('-') and (BranchCode <> '') then begin
                NoOfHoursInHalfDay := PayBranch."No of hours in Half-Day";
                NoOfHoursPerDay := PayBranch."No of Hours perday";
                if PayBranch."Attendance System (Based On)" = PayBranch."Attendance System (Based On)"::"Rigid-Hours" then begin
                    StartTime := PayBranch."Start Time";
                    EndTime := PayBranch."End Time";
                    StartTimeWithGrace := PayBranch."Start Time (Incl. Grace Time)";
                    AttendanceSystem := AttendanceSystem::Rigid;
                end else begin
                    StartTime := PayBranch."Core Start Time";
                    EndTime := PayBranch."Core End Time";
                    ConsiderCoreForHalfDay := PayBranch."Consider Core for Flexi Half";
                    AttendanceSystem := AttendanceSystem::Flexi;
                end;
            end else
                if (BranchCode <> '') then Error(Text002);
        end;

        if (StartTime = 0T) or (EndTime = 0T) then
            Error(Text003);

        if ("Off Day" and ("Off Type" = "Off Type"::"Half-Day")) or
          ("Leave Type" = "Leave Type"::"Half-Day") then begin
            NoOfHoursPerDay := NoOfHoursInHalfDay;
            if (AttendanceSystem <> AttendanceSystem::Flexi) then
                EndTime := StartTime + (3600000 * NoOfHoursPerDay)
            else begin
                if ConsiderCoreForHalfDay then begin
                    StartTime := "Time in";
                    EndTime := "Time Out";
                end;
            end;
        end;


        if (AttendanceSystem = AttendanceSystem::Flexi) then begin
            AttendanceProcedures.CalRigidHoursFromRange(StartTime, EndTime, "Time in", "Time Out", NormalHrsWorked, ExtraHrsWorked);
            if NormalHrsWorked < ((EndTime - StartTime) / 3600000) then begin
                ExtraHrsWorked := ExtraHrsWorked + NormalHrsWorked;
                NormalHrsWorked := 0;
            end else begin
                ExtraHrsWorked := ExtraHrsWorked + NormalHrsWorked;
                if (ExtraHrsWorked > NoOfHoursPerDay) then begin
                    NormalHrsWorked := NoOfHoursPerDay;
                    ExtraHrsWorked := ExtraHrsWorked - NoOfHoursPerDay;
                end else begin
                    NormalHrsWorked := ExtraHrsWorked;
                    ExtraHrsWorked := 0;
                end;
            end;
        end
        else begin
            AttendanceProcedures.CalRigidHoursFromRange(StartTime, EndTime, "Time in", "Time Out", NormalHrsWorked, ExtraHrsWorked);
            if StartTimeWithGrace = 0T then
                StartTimeWithGrace := StartTime;

            if (NormalHrsWorked >= NoOfHoursInHalfDay) and
              (("Time in" <= StartTimeWithGrace) and
              ("Time in" > StartTime)) and PayCompanyPolicy."Late Coming Applicable" then
                "Late Coming" := true
            else
                "Late Coming" := false;
        end;


        NormalHrsWorked := AttendanceProcedures.RoundTo(NormalHrsWorked, 0.25);
        ExtraHrsWorked := AttendanceProcedures.RoundTo(ExtraHrsWorked, 0.25);

        "Hours Present" := NormalHrsWorked;
        "Extra Hours Worked" := ExtraHrsWorked;

        if "Leave Type" = "Leave Type"::"Short-Leave" then
            NormalHrsWorked := NormalHrsWorked + PayCompanyPolicy."Duration of ShortLeave(In hrs)";

        if ((Holiday or "Off Day") and ("Off Type" <> "Off Type"::"Half-Day")) then begin
            if Holiday then Status := Status::Holiday;
            if "Off Day" then Status := Status::"Off-Day";
            "Extra Hours Worked" := "Extra Hours Worked" + "Hours Present";
            "Hours Present" := 0;
        end
        else begin
            if "Late Coming" then
                NormalHrsWorked := NormalHrsWorked + Round((StartTimeWithGrace - StartTime) / 3600000, 0.1);

            if (NormalHrsWorked < NoOfHoursPerDay) and
              (NormalHrsWorked >= NoOfHoursInHalfDay) then
                Status := Status::"LWP(Half-Day)";

            if (NormalHrsWorked < NoOfHoursInHalfDay) then
                Status := Status::"LWP(Full-Day)";

            if (NormalHrsWorked >= NoOfHoursPerDay) then begin
                Status := Status::Present;

                if ("Leave Type" = "Leave Type"::"Short-Leave") or
                  ("Leave Type" = "Leave Type"::"Full-Day") then
                    "Leave Type" := "Leave Type"::" ";

                "Leave Code" := '';
            end;
        end;
    end;
}

