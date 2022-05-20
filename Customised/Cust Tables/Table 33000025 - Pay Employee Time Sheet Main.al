table 33000025 "Pay Employee Time Sheet Main"
{
    // version NEOGYNPAY13.70.00.06

    DrillDownPageID = 33000060;
    LookupPageID = 33000060;

    fields
    {
        field(1;"Employee No";Code[20])
        {
            NotBlank = true;
            TableRelation = Employee;

            trigger OnValidate();
            begin
                if PayPayrollEmployee.Get("Employee No") then
                  begin
                    "Employee Name" :=PayPayrollEmployee.FullName;
                    "Department Code":=PayPayrollEmployee."Department Code";
                    Grade:=PayPayrollEmployee."Job Title/Grade";
                    //"Branch Code":=PayPayrollEmployee.GetBranchCode("Employee No",WORKDATE);
                    "Job Title Code":=PayPayrollEmployee."Job Title/Grade";
                    "Project Code":=PayPayrollEmployee."Project Code";
                    "Location Code":=PayPayrollEmployee."Location Code";

                  end;
            end;
        }
        field(2;"Employee Name";Text[30])
        {
            Editable = false;
        }
        field(3;"Attend Date";Date)
        {
            NotBlank = true;
        }
        field(10;"Department Code";Code[10])
        {
            CalcFormula = Lookup(Employee."Department Code" WHERE ("No."=FIELD("Employee No")));
            FieldClass = FlowField;
        }
        field(11;"Job Title Code";Code[20])
        {
        }
        field(12;"Project Code";Code[20])
        {
        }
        field(13;"Location Code";Code[20])
        {
        }
        field(15;Grade;Code[10])
        {
            CalcFormula = Lookup(Employee."Job Title/Grade" WHERE ("No."=FIELD("Employee No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(20;"Branch Code";Code[20])
        {
            CalcFormula = Lookup(Employee."Branch Code" WHERE ("No."=FIELD("Employee No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50;"Time Sheet Posted";Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Employee No","Attend Date")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        PayEmployeeTimeSheetSub.SetFilter("Employee No","Employee No");
        PayEmployeeTimeSheetSub.SetRange("Attend Date","Attend Date");
        PayEmployeeTimeSheetSub.DeleteAll;
    end;

    var
        PayPayrollEmployee : Record Employee;
        PayEmployeeTimeSheetSub : Record "Pay Employee Time Sheet Sub";
        PaySBHMNCR : Record "Pay Holidays";
}

