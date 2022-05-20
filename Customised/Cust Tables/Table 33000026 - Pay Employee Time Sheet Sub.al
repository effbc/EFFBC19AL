table 33000026 "Pay Employee Time Sheet Sub"
{
    // version NEOGYNPAY13.70.00.06


    fields
    {
        field(1;"Employee No";Code[20])
        {
            NotBlank = true;
            TableRelation = Employee;
        }
        field(5;"Attend Date";Date)
        {
            NotBlank = true;
        }
        field(10;"Line No";Integer)
        {
        }
        field(15;"Time From";Time)
        {
            NotBlank = true;

            trigger OnValidate();
            begin
                if TimeFromCheck =false then
                  FieldError("Time From",text001);
                CalHour;
            end;
        }
        field(20;"Time To";Time)
        {
            BlankNumbers = BlankZero;
            NotBlank = true;

            trigger OnValidate();
            begin
                if TimeToCheck =false then
                  FieldError("Time To",Text002);
                CalHour;
            end;
        }
        field(21;"Total Hours";Decimal)
        {
        }
        field(25;"Project Code";Code[20])
        {

            trigger OnLookup();
            begin
                if not PayCompanyPolicy.Get then Error(Text003);
                if PayCompanyPolicy."Project Dimension Code" = '' then Error(Text005);
                DimensionValue.Reset;
                DimensionValue.SetRange("Dimension Code",PayCompanyPolicy."Project Dimension Code");
                if DimensionValue.Find('-') then
                if PAGE.RunModal(0,DimensionValue)= ACTION::LookupOK then
                  "Project Code" := DimensionValue.Code;
            end;
        }
        field(26;"Branch Code";Code[20])
        {
            TableRelation = "Pay Branch Policy"."Branch Code";
        }
        field(27;"Department Code";Code[20])
        {

            trigger OnLookup();
            begin
                if not PayCompanyPolicy.Get then Error(Text003);
                if PayCompanyPolicy."Department Dimension Code" = '' then Error(Text005);
                DimensionValue.Reset;
                DimensionValue.SetRange("Dimension Code",PayCompanyPolicy."Department Dimension Code");
                if DimensionValue.Find('-') then
                if PAGE.RunModal(0,DimensionValue)= ACTION::LookupOK then
                  "Department Code" := DimensionValue.Code;
            end;
        }
        field(28;"Location Code";Code[20])
        {
        }
        field(29;"Job Title Code";Code[20])
        {
            TableRelation = "Job Titles"."Job Code";
        }
        field(30;Description;Text[250])
        {
        }
    }

    keys
    {
        key(Key1;"Employee No","Attend Date","Time From","Time To","Line No")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    var
        PayEmployeeTimeSheetMain : Record "Pay Employee Time Sheet Main";
        EmployeeMaster : Record Employee;
    begin
        PayEmployeeTimeSheetMain.SetRange(PayEmployeeTimeSheetMain."Employee No","Employee No");
        PayEmployeeTimeSheetMain.SetRange(PayEmployeeTimeSheetMain."Attend Date","Attend Date");
        if not PayEmployeeTimeSheetMain.Find('-') then
          begin
            EmployeeMaster.SetRange(EmployeeMaster."No.","Employee No");
            if EmployeeMaster.Find('-') then
              begin
                PayEmployeeTimeSheetMain.Init;
                PayEmployeeTimeSheetMain."Employee No" := "Employee No";
                PayEmployeeTimeSheetMain."Attend Date" := "Attend Date";
                PayEmployeeTimeSheetMain."Employee Name" := EmployeeMaster.FullName;
                PayEmployeeTimeSheetMain."Department Code" := EmployeeMaster."Department Code";
                PayEmployeeTimeSheetMain.Grade := EmployeeMaster."Job Title/Grade";
                //PayEmployeeTimeSheetMain."Branch Code" := EmployeeMaster.GetBranchCode("Employee No","Attend Date");
                PayEmployeeTimeSheetMain."Location Code" :=  EmployeeMaster."Location Code";
                PayEmployeeTimeSheetMain."Job Title Code"  := EmployeeMaster."Job Title Code";
                PayEmployeeTimeSheetMain.Insert;
              end
            else
              Error(Text000);
          end;
        //"Branch Code":=PayPayrollEmployee.GetBranchCode("Employee No","Attend Date");
    end;

    var
        PayPayrollEmployee : Record Employee;
        TimeSheetSub : Record "Pay Employee Time Sheet Sub";
        TodayDate : Date;
        NextDayDate : Date;
        minutes : Decimal;
        Text000 : Label 'Invalid employee code or the employee has left the organization.';
        text001 : Label 'Cannot be less than Time To of previous record.';
        Text002 : Label 'Cannot be less than Time From';
        DimensionValue : Record "Dimension Value";
        PayCompanyPolicy : Record "Pay Company Policy";
        Text003 : Label 'Company Policies Not Defined.';
        Text004 : Label 'Required Project Dimension code in setup.';
        Text005 : Label 'Required Department Dimension code in setup.';

    [LineStart(5968)]
    procedure CalHour();
    begin
        if ("Time From" <> 0T) and ("Time To" <> 0T) then
          begin
            if "Attend Date" <> 0D then
              if "Time From" < "Time To" then
                "Total Hours" := ("Time To" - "Time From")/3600000
              else
                begin
                  TodayDate:=Today;
                  NextDayDate:=CalcDate('1D',Today);
                  minutes := Round((1440 * (NextDayDate-TodayDate)) + (("Time To" - "Time From") / 60000),1);
                  "Total Hours" := minutes/60;
                end;
          end
        else
          "Total Hours" := 0;
    end;

    [LineStart(5985)]
    procedure TimeFromCheck() TimeCheckFrom : Boolean;
    begin
        TimeSheetSub.Reset;
        TimeSheetSub.SetRange(TimeSheetSub."Employee No","Employee No");
        TimeSheetSub.SetRange(TimeSheetSub."Attend Date","Attend Date");

          if TimeSheetSub.Find('+') then
            if "Time From"< TimeSheetSub."Time To" then
              begin
                TimeCheckFrom:=false;
                exit(TimeCheckFrom);
              end;
            TimeCheckFrom:=true;
            exit(TimeCheckFrom);
    end;

    [LineStart(5999)]
    procedure TimeToCheck() CheckTimeTo : Boolean;
    begin
        if "Time From" <>0T then
          if "Time From">"Time To" then
            begin
              CheckTimeTo:=false;
              exit(CheckTimeTo);
            end;
          CheckTimeTo:=true;
          exit(CheckTimeTo);
    end;
}

