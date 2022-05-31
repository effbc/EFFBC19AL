table 33000044 "Pay Employee Loan Detail"
{
    // version NEOGYNPAY13.70.00.06

    // //NEOGYNPAY13.10.01
    // //Loan Installment Deduction//21
    // 
    // //NEOGYNPAY13.10.01
    // //ROUNDING/13

    DrillDownPageID = 33000087;
    LookupPageID = 33000087;
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Employee No."; Code[20])
        {
            TableRelation = Employee."No.";
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
        }
        field(9; "Line No."; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(10; "Pay Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(12; Month; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(15; EntryNo; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(20; "Loan Amount"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(22; "Installment Amount"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(24; Interest; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(26; Principal; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(27; "Repayment Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(28; "Principal Repayment"; Decimal)
        {
            CalcFormula = Sum("Pay Employee Loan Repayment"."Repayment Amount" WHERE("Employee No." = FIELD("Employee No."),
                                                                                      "Pay Date" = FIELD("Pay Date"),
                                                                                      "Loan code" = FIELD(Code),
                                                                                      "Line No." = FIELD("Line No.")));
            FieldClass = FlowField;
        }
        field(29; Balance; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(30; "EMI Deducted"; Decimal)
        {
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if "EMI Deducted" = xRec."EMI Deducted" then exit;

                if "EMI Deducted" > "Installment Amount" then begin
                    "EMI Deducted" := "Installment Amount";

                    //////NEOGYNPAY13.10.01
                    /////Loan Installment Deduction//21
                    "Requested EMI Deduction" := "Installment Amount";
                    ///
                    exit;
                end;

                //NEOGYNPAY13.10.01
                //Loan Installment Deduction//21
                "Requested EMI Deduction" := "EMI Deducted";
                ///

                VarPrincipal := Principal;
                Principal := "EMI Deducted" - Interest;
                NetPrincipalDifference := Principal - VarPrincipal;
                Balance := Balance - NetPrincipalDifference;
                InstallmentCreationOnPayment
            end;
        }
        field(31; "Paid Month"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(33; "Paid Year"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(50; "Department Code"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(52; "Location Code"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(54; "Project Code"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(55; Branch; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(56; "Job Title Code"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(60; Paid; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(65; LastCalculatedDate; Date)
        {
            Description = 'Date on which Installments Created';
            DataClassification = CustomerContent;
        }
        field(50010; "Requested EMI Deduction"; Decimal)
        {
            MinValue = 0;
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                //NEOGYNPAY13.10.01
                //Loan Installment Deduction//21

                if "Requested EMI Deduction" = xRec."Requested EMI Deduction" then exit;
                if "Requested EMI Deduction" > "Installment Amount" then begin
                    Error(Text001);
                    "Requested EMI Deduction" := "Installment Amount";
                    exit;
                end;
                //
            end;
        }
        field(50020; "Loan Closed"; Boolean)
        {
            CalcFormula = Lookup("Pay Employee Loan".Completed WHERE("Employee No." = FIELD("Employee No."),
                                                                      Type = FIELD(Type),
                                                                      Code = FIELD(Code),
                                                                      "Line No." = FIELD("Line No.")));
            FieldClass = FlowField;
        }
        field(50021; "Employee Leave Date"; Date)
        {
            CalcFormula = Lookup(Employee."Leave Date" WHERE("No." = FIELD("Employee No.")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Employee No.", Type, "Code", "Pay Date", "Line No.")
        {
        }
        key(Key2; "Employee No.", Type, "Code", Paid, LastCalculatedDate, "Line No.")
        {
            SumIndexFields = Principal, "Installment Amount", "EMI Deducted";
        }
        key(Key3; "Employee No.", Type, "Code", LastCalculatedDate, "Line No.")
        {
            SumIndexFields = Interest;
        }
    }

    fieldgroups
    {
    }

    var
        PayEmployeeLoanDetail: Record "Pay Employee Loan Detail";
        PayEmployeeLoan: Record "Pay Employee Loan";
        PayScheme: Record "Pay Loan Master";
        NetPrincipalDifference: Decimal;
        VarPrincipal: Decimal;
        EntNo: Integer;
        TempPrincipal: Decimal;
        TempInterest: Decimal;
        LoanAmount: Decimal;
        PrincipalAmount: Decimal;
        InterestAmount: Decimal;
        RemainingBalance: Decimal;
        EMI: Decimal;
        StartDate: Date;
        PayDate: Date;
        RateIntrest: Decimal;
        TempDate: Date;
        Text001: Label 'Requested Deduction Amount not more than Installment Amount';

    [LineStart(6553)]
    procedure InstallmentCreationOnPayment();
    var
        FirstPaydate: Date;
        LastPayDate: Date;
    begin
        PayEmployeeLoanDetail.Reset;
        PayEmployeeLoanDetail.SetFilter("Employee No.", "Employee No.");
        PayEmployeeLoanDetail.SetRange(Type, Type);
        PayEmployeeLoanDetail.SetRange("Line No.", "Line No.");
        PayEmployeeLoanDetail.SetFilter(Code, Code);
        PayEmployeeLoanDetail.SetRange(LastCalculatedDate, LastCalculatedDate);

        FirstPaydate := DMY2Date(1, Date2DMY("Pay Date", 2), Date2DMY("Pay Date", 3));
        LastPayDate := CalcDate('+1M', FirstPaydate) - 1;

        PayEmployeeLoanDetail.SetFilter("Pay Date", '%1..%2', FirstPaydate, LastPayDate);
        if PayEmployeeLoanDetail.Find('-') then begin
            EntNo := EntryNo;
            LoanAmount := Balance;

            PayEmployeeLoan.Reset;
            PayEmployeeLoan.SetFilter("Employee No.", "Employee No.");
            PayEmployeeLoan.SetRange(Type, Type);
            PayEmployeeLoan.SetRange("Line No.", "Line No.");
            PayEmployeeLoan.SetFilter(Code, Code);
            PayEmployeeLoan.SetRange("Start Date", LastCalculatedDate);
            if PayEmployeeLoan.Find('-') then begin
                LastCalculatedDate := LastCalculatedDate;
                PayEmployeeLoan.CalcFields(PayEmployeeLoan."No. of Installments");
                if (PayEmployeeLoan."No. of Installments" - EntNo) = 0 then begin
                    ///////////////////NEOGYNPAY13.10.01///////////////////////
                    //////////////////ROUNDING/13/////////////////////////////

                    PrincipalAmount := LoanAmount / (1);
                    InterestAmount := (LoanAmount * PayEmployeeLoan."Rate of Interest") / (12 * 100) + (TempInterest /
                     (1));

                    //// PrincipalAmount := ROUND(LoanAmount / (1),1,'=');
                    //// InterestAmount := ROUND((LoanAmount * PayEmployeeLoan."Rate of Interest") / (12 * 100) + (TempInterest/
                    ////  (1)),1,'=');
                end
                else begin

                    ///////////////////NEOGYNPAY13.10.01///////////////////////
                    //////////////////ROUNDING/13/////////////////////////////

                    PrincipalAmount := LoanAmount / (PayEmployeeLoan."No. of Installments" - EntNo);
                    InterestAmount := (LoanAmount * PayEmployeeLoan."Rate of Interest") / (12 * 100) + (TempInterest /
                     (PayEmployeeLoan."No. of Installments" - EntNo));


                    ////PrincipalAmount := ROUND(LoanAmount / (PayEmployeeLoan."No. of Installments" - EntNo),1,'=');
                    ////InterestAmount := ROUND((LoanAmount * PayEmployeeLoan."Rate of Interest") / (12 * 100) + (TempInterest/
                    //// (PayEmployeeLoan."No. of Installments" - EntNo)),1,'=');
                end;

                ///////////////////NEOGYNPAY13.10.01///////////////////////
                //////////////////ROUNDING/13/////////////////////////////
                //Deleted Globalvar -PayPayrollFunctionsCodeunitCodeunit33000001//EFFUPG

                //EMI := PayPayrollFunctions.PayrollRounding(PrincipalAmount + InterestAmount);//EFFUPG
                ////EMI := PrincipalAmount + InterestAmount;
                ///////

                ///////////
                CalculateInstallments
            end;
        end;
    end;

    [LineStart(6622)]
    procedure CalculateInstallments();
    begin

        PayEmployeeLoanDetail.Reset;
        PayEmployeeLoanDetail.SetFilter("Employee No.", "Employee No.");
        PayEmployeeLoanDetail.SetRange(Type, Type);
        PayEmployeeLoanDetail.SetFilter(Code, Code);
        PayEmployeeLoanDetail.SetRange("Line No.", "Line No.");
        PayEmployeeLoanDetail.SetRange(LastCalculatedDate, LastCalculatedDate);
        PayEmployeeLoan.CalcFields(PayEmployeeLoan."No. of Installments");
        PayEmployeeLoanDetail.SetRange(EntryNo, EntNo + 1, PayEmployeeLoan."No. of Installments");
        PayEmployeeLoanDetail.DeleteAll;
        StartDate := CalcDate('+1M', "Pay Date");
        InsertingRecords
    end;

    [LineStart(6636)]
    procedure InsertingRecords();
    begin

        if PayEmployeeLoan.LoanType = 1 then begin
            InterestAmount := 0;

            ///////////////////NEOGYNPAY13.10.01///////////////////////
            //////////////////ROUNDING/13/////////////////////////////

            //EMI := PayPayrollFunctions.PayrollRounding(PrincipalAmount + InterestAmount);//EFFUPG
            ////EMI := PrincipalAmount + InterestAmount;
            ///////
        end;

        repeat
            RemainingBalance := LoanAmount - PrincipalAmount;
            PayEmployeeLoanDetail.Init;
            PayEmployeeLoanDetail."Employee No." := "Employee No.";
            PayEmployeeLoanDetail.Type := Type;
            PayEmployeeLoanDetail.Code := Code;
            PayEmployeeLoanDetail."Line No." := "Line No.";
            PayEmployeeLoanDetail."Pay Date" := StartDate;
            PayEmployeeLoanDetail.Month := Date2DMY(StartDate, 2);
            PayEmployeeLoanDetail.EntryNo := EntNo + 1;

            ///////////////////NEOGYNPAY13.10.01///////////////////////
            //////////////////ROUNDING/13/////////////////////////////

            PayEmployeeLoanDetail."Loan Amount" := LoanAmount;
            PayEmployeeLoanDetail."Installment Amount" := EMI;
            PayEmployeeLoanDetail."EMI Deducted" := EMI;

            ////PayEmployeeLoanDetail."Loan Amount" := ROUND(LoanAmount,1,'=');
            ////PayEmployeeLoanDetail."Installment Amount" := ROUND(EMI,1,'=');
            ////PayEmployeeLoanDetail."EMI Deducted" := ROUND(EMI,1,'=');

            ////////

            //NEOGYNPAY13.10.01
            //Loan Installment Deduction//21

            PayEmployeeLoanDetail."Requested EMI Deduction" := Round(EMI, 1, '=');
            ///

            ///////////////////NEOGYNPAY13.10.01///////////////////////
            //////////////////ROUNDING/13/////////////////////////////

            PayEmployeeLoanDetail.Interest := InterestAmount;
            PayEmployeeLoanDetail.Principal := PrincipalAmount;
            PayEmployeeLoanDetail.Balance := RemainingBalance;

            ////PayEmployeeLoanDetail.Interest := ROUND(InterestAmount,1,'=');
            ////PayEmployeeLoanDetail.Principal:= ROUND(PrincipalAmount,1,'=');
            ////PayEmployeeLoanDetail.Balance := ROUND(RemainingBalance,1,'=');
            ////////

            PayEmployeeLoanDetail.LastCalculatedDate := LastCalculatedDate;
            PayEmployeeLoanDetail."Department Code" := "Department Code";
            PayEmployeeLoanDetail."Location Code" := "Location Code";
            PayEmployeeLoanDetail."Project Code" := "Project Code";
            PayEmployeeLoanDetail.Branch := Branch;
            PayEmployeeLoanDetail."Job Title Code" := "Job Title Code";

            PayEmployeeLoanDetail.Insert;

            LoanAmount := LoanAmount - PrincipalAmount;
            if (PrincipalAmount > LoanAmount) then begin
                PrincipalAmount := LoanAmount;

                ///////////////////NEOGYNPAY13.10.01///////////////////////
                //////////////////ROUNDING/13/////////////////////////////
                InterestAmount := (LoanAmount * PayEmployeeLoan."Rate of Interest") / (12 * 100);
                ////InterestAmount := ROUND((LoanAmount * PayEmployeeLoan."Rate of Interest") / (12 * 100),1,'=');

                //EMI := PayPayrollFunctions.PayrollRounding(PrincipalAmount + InterestAmount) ;//EFFUPG
                /////
            end;

            EntNo := EntNo + 1;
            if EntNo mod 12 = 0 then
                if PayEmployeeLoan.LoanType = 2 then begin

                    ///////////////////NEOGYNPAY13.10.01///////////////////////
                    //////////////////ROUNDING/13/////////////////////////////
                    InterestAmount := (RemainingBalance * PayEmployeeLoan."Rate of Interest") / (12 * 100);
                    ////InterestAmount := ROUND((RemainingBalance * PayEmployeeLoan."Rate of Interest") / (12 * 100),1,'=');

                    //EMI := PayPayrollFunctions.PayrollRounding(PrincipalAmount + InterestAmount) ;//EFFUPG
                    /////
                end;

            StartDate := CalcDate('+1M', StartDate);
        until RemainingBalance <= 0;

        PayEmployeeLoan."End Date" := StartDate;
        PayEmployeeLoan."Installment Amount" := EMI;
        PayEmployeeLoan.Modify;
    end;
}

