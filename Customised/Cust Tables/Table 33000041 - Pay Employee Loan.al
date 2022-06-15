table 33000041 "Pay Employee Loan"
{
    DataClassification = CustomerContent;
    // version NEOGYNPAY13.70.00.06

    // 
    // //NEOGYNPAY13.10
    // //ROUNDING/13


    fields
    {
        field(1; "Employee No."; Code[20])
        {
            TableRelation = Employee;
            DataClassification = CustomerContent;
        }
        field(5; Type; Option)
        {
            NotBlank = true;
            OptionMembers = "Saving Scheme",Society,Loan,Advance;
            DataClassification = CustomerContent;
        }
        field(8; "Code"; Code[10])
        {
            DataClassification = CustomerContent;

            trigger OnLookup();
            begin
                PaySavingSocietyScheme.Reset;
                PaySavingSocietyScheme.SetFilter(PaySavingSocietyScheme.Type, 'Loan');
                if PAGE.RunModal(33000085, PaySavingSocietyScheme) = ACTION::LookupOK then
                    Code := PaySavingSocietyScheme.Code;

                if PaySavingSocietyScheme.Get(Type, Code) then begin
                    if Code <> '' then begin
                        PayScheme.Reset;
                        PayScheme.SetRange(Type, PayScheme.Type::Loan);
                        PayScheme.SetFilter(Code, Code);
                        if PayScheme.Find('-') then begin
                            PayEmp.Reset;
                            PayEmp.SetFilter("No.", "Employee No.");
                            PayEmp.SetFilter("Job Title/Grade", PayScheme."Applicable Grade");
                            if not PayEmp.Find('-') then Error(Err0001);
                        end;
                    end;
                end;

                Validate(Code);
            end;

            trigger OnValidate();
            begin
                if PaySavingSocietyScheme.Get(Type, Code) then begin
                    if (Code <> xRec.Code) then begin
                        if (Code <> '') then begin
                            PayScheme.Reset;
                            PayScheme.SetRange(Type, PayScheme.Type::Loan);
                            PayScheme.SetFilter(Code, Code);
                            if PayScheme.Find('-') then begin
                                PayEmp.Reset;
                                PayEmp.SetFilter("No.", "Employee No.");
                                PayEmp.SetFilter("Job Title/Grade", PayScheme."Applicable Grade");
                                if not PayEmp.Find('-') then Error(Err0001);
                                if (PayScheme."Max. No. of Avail Times" > 0) then begin
                                    PayEmployeeLoan.Reset;
                                    PayEmployeeLoan.SetFilter("Employee No.", "Employee No.");
                                    PayEmployeeLoan.SetRange(Completed, false);
                                    PayEmployeeLoan.SetRange(Type, PayEmployeeLoan.Type::Loan);
                                    PayEmployeeLoan.SetFilter(Code, Code);
                                    if ((PayEmployeeLoan.Count + 1) > PayScheme."Max. No. of Avail Times") then
                                        Error(Err0002, PayScheme."Max. No. of Avail Times");
                                end;
                                if PayScheme.LoanType = 0 then Error(Err0007);
                                if PayScheme.LoanType <> PayScheme.LoanType::"Interest Free" then begin
                                    if PayScheme."Rate Of Interest" = 0 then Error(Err0008);
                                    if PayScheme."Max No. of Days" = 0 then Error(Err0009);
                                end;
                                if PayScheme."Applicable Grade" = '' then Error(Err0010);
                            end;
                        end;
                    end;
                    Purpose := PaySavingSocietyScheme.Description;
                    "Rate of Interest" := PaySavingSocietyScheme."Rate Of Interest";
                    LoanType := PaySavingSocietyScheme.LoanType;
                    "No. of Months" := PaySavingSocietyScheme."No. of Installments";
                end
                else
                    Error(Err0003);

                PayEmp.Reset;
                PayEmp.SetFilter("No.", "Employee No.");
                if PayEmp.Find('-') then begin
                    "Department Code" := PayEmp."Department Code";
                    //  "Branch Code" := PayEmp.GetBranchCode("Employee No.",WORKDATE);
                    "Grade Code" := PayEmp."Branch Code";
                    "Location Code" := PayEmp."Location Code";
                    "Job Title Code" := PayEmp."Job Title Code";
                end;
            end;
        }
        field(9; "Line No."; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(10; Purpose; Text[100])
        {
            Title = true;
            DataClassification = CustomerContent;
        }
        field(12; LoanType; Option)
        {
            OptionMembers = " ","Interest Free","Yearly Reducing","Flat rate","Monthly Reducing";
            DataClassification = CustomerContent;
        }
        field(20; Amount; Decimal)
        {
            MinValue = 0;
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if PaySavingSocietyScheme.Get(Type, Code) then begin
                    if Code <> '' then begin
                        PayScheme.Reset;
                        PayScheme.SetRange(Type, PayScheme.Type::Loan);
                        PayScheme.SetFilter(Code, Code);
                        if PayScheme.Find('-') then begin
                            PayEmp.Reset;
                            PayEmp.SetFilter("No.", "Employee No.");
                            PayEmp.SetFilter("Job Title/Grade", PayScheme."Applicable Grade");
                            if not PayEmp.Find('-') then Error(Err0001);
                        end;
                    end;
                end;

                if Amount > 0 then begin
                    PaySavingSocietyScheme.Reset;
                    PaySavingSocietyScheme.SetRange(Type, Type);
                    PaySavingSocietyScheme.SetFilter(Code, Code);
                    if PaySavingSocietyScheme.Find('-') then
                        if Amount > PaySavingSocietyScheme."Max Amount" then Error(Err0004, PaySavingSocietyScheme."Max Amount");
                end;
            end;
        }
        field(22; "No. of Months"; Integer)
        {
            Editable = true;
            MinValue = 0;
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if "No. of Payments Made" > 0 then Error(Err0005);
            end;
        }
        field(25; "Installment Amount"; Decimal)
        {
            Editable = true;
            DataClassification = CustomerContent;
        }
        field(28; "Total Payable"; Decimal)
        {
            CalcFormula = Sum("Pay Employee Loan Detail"."Installment Amount" WHERE("Employee No." = FIELD("Employee No."),
                                                                                     Type = FIELD(Type),
                                                                                     Code = FIELD(Code),
                                                                                     "Line No." = FIELD("Line No."),
                                                                                     LastCalculatedDate = FIELD("Start Date"),
                                                                                     Paid = CONST(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(30; "Total Payment Made"; Decimal)
        {
            CalcFormula = Sum("Pay Employee Loan Detail"."EMI Deducted" WHERE("Employee No." = FIELD("Employee No."),
                                                                               Type = FIELD(Type),
                                                                               Code = FIELD(Code),
                                                                               "Line No." = FIELD("Line No."),
                                                                               LastCalculatedDate = FIELD("Start Date"),
                                                                               Paid = CONST(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(32; "No. of Payments Made"; Integer)
        {
            CalcFormula = Count("Pay Employee Loan Detail" WHERE("Employee No." = FIELD("Employee No."),
                                                                  Type = FIELD(Type),
                                                                  Code = FIELD(Code),
                                                                  "Line No." = FIELD("Line No."),
                                                                  LastCalculatedDate = FIELD("Start Date"),
                                                                  Paid = CONST(true)));
            Editable = true;
            FieldClass = FlowField;
        }
        field(33; "Loan Type"; Option)
        {
            Editable = false;
            OptionMembers = EMI,"Fixed Principal Repayment";
            DataClassification = CustomerContent;
        }
        field(36; "Rate of Interest"; Decimal)
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(41; "Start Date"; Date)
        {
            Editable = true;
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if "No. of Payments Made" > 0 then Error(Err0006);
            end;
        }
        field(42; "End Date"; Date)
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(45; Completed; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(46; "Total Interest"; Decimal)
        {
            CalcFormula = Sum("Pay Employee Loan Detail".Interest WHERE("Employee No." = FIELD("Employee No."),
                                                                         Type = FIELD(Type),
                                                                         Code = FIELD(Code),
                                                                         "Line No." = FIELD("Line No."),
                                                                         LastCalculatedDate = FIELD("Start Date")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50; "No. of Installments"; Integer)
        {
            CalcFormula = Count("Pay Employee Loan Detail" WHERE("Employee No." = FIELD("Employee No."),
                                                                  Type = FIELD(Type),
                                                                  Code = FIELD(Code),
                                                                  "Line No." = FIELD("Line No."),
                                                                  LastCalculatedDate = FIELD("Start Date")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(55; "Total Advance Payment"; Decimal)
        {
            CalcFormula = Sum("Pay Employee Loan Repayment"."Repayment Amount" WHERE("Employee No." = FIELD("Employee No."),
                                                                                      "Loan code" = FIELD(Code),
                                                                                      "Line No." = FIELD("Line No.")));
            FieldClass = FlowField;
        }
        field(65; "Department Code"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(66; "Branch Code"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(67; "Grade Code"; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(68; "Location Code"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(69; "Job Title Code"; Code[20])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Employee No.", Type, "Code", "Line No.")
        {
        }
        key(Key2;'')
        {
            Enabled = false;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        if DeleteAllCheck then begin
            PayLoanDetails.Reset;
            PayLoanDetails.SetFilter("Employee No.", "Employee No.");
            PayLoanDetails.SetRange(Type, PayLoanDetails.Type::Loan);
            PayLoanDetails.SetFilter(Code, Code);
            PayLoanDetails.SetRange("Line No.", "Line No.");
            PayLoanDetails.DeleteAll;
        end;
    end;

    trigger OnInsert();
    begin

        PayEmp.Get("Employee No.");
        if PayEmp."Leave Date" <> 0D then Error(Text002, "Employee No.");
    end;

    var
        PayEmp: Record Employee;
        PayScheme: Record "Pay Loan Master";
        PaySavingSocietyScheme: Record "Pay Loan Master";
        PayLoanDetails: Record "Pay Employee Loan Detail";
        PayEmployeeLoan: Record "Pay Employee Loan";
        PayDate: Date;
        payloanintrest: Decimal;
        monthlyinterest: Decimal;
        LoanStartFirstDate: Date;
        LoanDate: Integer;
        LoanStartEndDate: Date;
        LoanAmount: Decimal;
        LoanStartDate: Date;
        NoofDays: Integer;
        LastDay: Integer;
        Err0001: Label 'Employee Grade is not Applicable for the Loan Code Selected';
        Err0002: Label 'Selected Loan Cannot be taken more than %1 times';
        Err0003: Label 'Code Does Not Exist';
        Err0004: Label 'Amount Exceeding Max.Limit : %1';
        Err0005: Label 'Once Payment made ,No. of Months Cannot be changed';
        Err0006: Label 'Once Payment made ,Start date cannot be Changed';
        Err0007: Label 'Loan Type is blank for the Selected Loan.';
        Err0008: Label 'Rate of Interest Cannot be Zero.';
        Err0009: Label 'Required Repayment Concession days';
        Err0010: Label '"Required Grade for the Loan Selected. "';
        Text000: Label 'Action Cancelled. Installments already created against the Loan.';
        Text001: Label 'Action Cancelled. Installments already paid against the Loan.';
        Text002: Label 'The Employee %1 has left.';

    procedure CalculateInstallments();
    begin
        if (Amount = 0) or ("Start Date" = 0D) or ("Installment Amount" = 0) then exit;

        LoanAmount := Amount;
        PayDate := DMY2Date(1, Date2DMY("Start Date", 2) + 1, Date2DMY("Start Date", 3));
        NoofDays := CalcDate('-1D', PayDate) - "Start Date";
        LastDay := Date2DMY(CalcDate('-1D', PayDate), 1);

        PayLoanDetails.Init;
        PayLoanDetails."Employee No." := "Employee No.";
        PayLoanDetails.Type := PayLoanDetails.Type::Loan;
        PayLoanDetails.Code := Code;
        PayLoanDetails."Line No." := "Line No.";
        PayLoanDetails."Pay Date" := PayDate;
        PayLoanDetails."Loan Amount" := LoanAmount;

        ///////////////////NEOGYNPAY13.10///////////////////////
        //////////////////ROUNDING/13/////////////////////////////

        monthlyinterest := ((LoanAmount * "Rate of Interest") / 1200 * NoofDays / LastDay);
        ////monthlyinterest := ROUND(((LoanAmount * "Rate of Interest") /1200 * NoofDays/LastDay),1,'=');
        //EFFUPG
        //Deleted GLOBALVAR - PayPayrollFunctionsCodeunitCodeunit33000001

        //PayLoanDetails.Interest := PayPayrollFunctions.PayrollRounding(monthlyinterest);//EFFUPG
        ////PayLoanDetails.Interest := monthlyinterest;
        ////

        PayLoanDetails."Installment Amount" := "Installment Amount";
        PayLoanDetails.Principal := "Installment Amount" - monthlyinterest;
        PayLoanDetails.Balance := LoanAmount - PayLoanDetails.Principal;
        LoanAmount := PayLoanDetails.Balance;
        PayLoanDetails.Insert;

        while (LoanAmount > 0) do begin
            PayDate := CalcDate('1M', PayDate);
            PayLoanDetails.Init;
            PayLoanDetails."Employee No." := "Employee No.";
            PayLoanDetails.Type := PayLoanDetails.Type::Loan;
            PayLoanDetails.Code := Code;
            PayLoanDetails."Line No." := "Line No.";
            PayLoanDetails."Pay Date" := PayDate;
            PayLoanDetails."Loan Amount" := LoanAmount;

            ///////////////////NEOGYNPAY13.10///////////////////////
            //////////////////ROUNDING/13/////////////////////////////

            monthlyinterest := ((LoanAmount * "Rate of Interest") / 1200 * NoofDays / LastDay);
            ////monthlyinterest := ROUND(((LoanAmount * "Rate of Interest") /1200 * NoofDays/LastDay),1,'=');

            //PayLoanDetails.Interest := PayPayrollFunctions.PayrollRounding(monthlyinterest);//EFFUPG
            ////PayLoanDetails.Interest := monthlyinterest;
            ////

            if (LoanAmount + monthlyinterest) > "Installment Amount" then begin
                PayLoanDetails."Installment Amount" := "Installment Amount";

                ///////////////////NEOGYNPAY13.10///////////////////////
                //////////////////ROUNDING/13/////////////////////////////

                //PayLoanDetails.Principal := PayPayrollFunctions.PayrollRounding("Installment Amount"- monthlyinterest) ;//EFFUPG
                ////PayLoanDetails.Principal := "Installment Amount"- monthlyinterest ;
                ////

                PayLoanDetails.Balance := LoanAmount - PayLoanDetails.Principal
            end
            else begin

                ///////////////////NEOGYNPAY13.10///////////////////////
                //////////////////ROUNDING/13/////////////////////////////

                //PayLoanDetails."Installment Amount" := PayPayrollFunctions.PayrollRounding(LoanAmount + monthlyinterest);//EFFUPG
                ////PayLoanDetails."Installment Amount" := LoanAmount + monthlyinterest;
                ////
                PayLoanDetails.Principal := LoanAmount;
                PayLoanDetails.Balance := 0
            end;
            PayLoanDetails.Insert;
            LoanAmount := PayLoanDetails.Balance
        end;
        PayLoanDetails.SetFilter(PayLoanDetails."Employee No.", "Employee No.");
        "No. of Months" := PayLoanDetails.Count;
    end;


    procedure DeleteAllCheck(): Boolean;
    var
        PrincipalRepaymentSum: Decimal;
    begin
        //DeleteAllCheck

        PayLoanDetails.Reset;
        PayLoanDetails.SetFilter("Employee No.", "Employee No.");
        PayLoanDetails.SetRange(Type, PayLoanDetails.Type::Loan);
        PayLoanDetails.SetFilter(Code, Code);
        PayLoanDetails.SetRange("Line No.", "Line No.");
        PayLoanDetails.SetFilter(PayLoanDetails."Paid Month", '<>%1', 0);
        if PayLoanDetails.Find('-') then begin
            Error(Text001);
            exit(false);
        end
        else begin
            PayLoanDetails.Reset;
            PayLoanDetails.SetFilter("Employee No.", "Employee No.");
            PayLoanDetails.SetRange(Type, PayLoanDetails.Type::Loan);
            PayLoanDetails.SetFilter(Code, Code);
            PayLoanDetails.SetRange("Line No.", "Line No.");
            if PayLoanDetails.Find('-') then
                repeat
                    PayLoanDetails.CalcFields("Principal Repayment");
                    PrincipalRepaymentSum := PrincipalRepaymentSum + PayLoanDetails."Principal Repayment";
                until PayLoanDetails.Next = 0;

            if PrincipalRepaymentSum > 0 then begin
                Error(Text001);
                exit(false);
            end
            else
                exit(true);
        end;
    end;
}

