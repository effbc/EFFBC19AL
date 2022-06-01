table 33000077 "Employee Ledger Entry"
{
    // version NEOGYNPAY13.70.00.07,Rev01

    DrillDownPageID = 33000169;
    LookupPageID = 33000169;
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Pay Journal Template"; Code[10])
        {
            Caption = 'Pay Journal Template';
            TableRelation = "Pay Journal Template";
            DataClassification = CustomerContent;
        }
        field(2; "Pay Journal Batch"; Code[10])
        {
            Caption = 'Pay Journal Batch';
            TableRelation = "Pay Gen. Journal Batch".Name WHERE("Pay Journal Template" = FIELD("Pay Journal Template"));
            DataClassification = CustomerContent;
        }
        field(3; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
        }
        field(4; "Employee No."; Code[20])
        {
            Caption = 'Employee No.';
            TableRelation = Employee;
            DataClassification = CustomerContent;
        }
        field(5; Description; Text[200])
        {
            DataClassification = CustomerContent;
        }
        field(6; "Employee Posting Group"; Code[10])
        {
            Caption = 'Employee Posting Group';
            TableRelation = "Employee Posting Group";
            DataClassification = CustomerContent;
        }
        field(11; "Document Type"; Option)
        {
            OptionCaption = '" ,Posting,FullFinal,Reimbursement,Payment"';
            OptionMembers = " ",Posting,FullFinal,Reimbursement,Payment;
            DataClassification = CustomerContent;
        }
        field(12; "Document No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(13; "Document Date"; Date)
        {
            Caption = 'Document Date';
            DataClassification = CustomerContent;
        }
        field(14; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
        }
        field(15; "Posting Month"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(16; "Posting Year"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(21; "Bal. Account Type"; Option)
        {
            Caption = 'Bal. Account Type';
            OptionCaption = 'Employee,G/L Account,Bank Account';
            OptionMembers = Employee,"G/L Account","Bank Account";
            DataClassification = CustomerContent;
        }
        field(22; "Bal. Account No."; Code[20])
        {
            Caption = 'Bal. Account No.';
            TableRelation = IF ("Bal. Account Type" = FILTER(Employee)) Employee."No.";
            DataClassification = CustomerContent;
        }
        field(31; Amount; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Employee Ledg. Entry".Amount WHERE("Employee Ledger Entry No." = FIELD("Entry No."),
                                                                            "Entry Type" = FILTER("Initial Entry"),
                                                                            "Posting Date" = FIELD("Date Filter")));
            Caption = 'Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(32; "Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Employee Ledg. Entry"."Amount (LCY)" WHERE("Employee Ledger Entry No." = FIELD("Entry No."),
                                                                                    "Entry Type" = FILTER("Initial Entry"),
                                                                                    "Posting Date" = FIELD("Date Filter")));
            Caption = 'Amount (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(33; "Original Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Employee Ledg. Entry".Amount WHERE("Employee Ledger Entry No." = FIELD("Entry No."),
                                                                            "Entry Type" = FILTER("Initial Entry"),
                                                                            "Posting Date" = FIELD("Date Filter")));
            Caption = 'Original Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(34; "Original Amt. (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Employee Ledg. Entry"."Amount (LCY)" WHERE("Employee Ledger Entry No." = FIELD("Entry No."),
                                                                                    "Entry Type" = FILTER("Initial Entry"),
                                                                                    "Posting Date" = FIELD("Date Filter")));
            Caption = 'Original Amt. (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(35; "Remaining Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Employee Ledg. Entry".Amount WHERE("Employee Ledger Entry No." = FIELD("Entry No."),
                                                                            "Posting Date" = FIELD("Date Filter")));
            Caption = 'Remaining Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(36; "Remaining Amt. (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Employee Ledg. Entry"."Amount (LCY)" WHERE("Employee Ledger Entry No." = FIELD("Entry No."),
                                                                                    "Posting Date" = FIELD("Date Filter")));
            Caption = 'Remaining Amt. (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(41; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
            DataClassification = CustomerContent;
        }
        field(42; "Adjusted Currency Factor"; Decimal)
        {
            Caption = 'Adjusted Currency Factor';
            DecimalPlaces = 0 : 15;
            DataClassification = CustomerContent;
        }
        field(43; "Original Currency Factor"; Decimal)
        {
            Caption = 'Original Currency Factor';
            DecimalPlaces = 0 : 15;
            DataClassification = CustomerContent;
        }
        field(51; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
            DataClassification = CustomerContent;
        }
        field(52; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
            DataClassification = CustomerContent;
        }
        field(53; Grade; Code[10])
        {
            Caption = 'Grade';
            TableRelation = "Pay Grade";
            DataClassification = CustomerContent;
        }
        field(54; "Location Code"; Code[20])
        {
            Caption = 'Location Code';
            DataClassification = CustomerContent;
        }
        field(55; "Job Title Code"; Code[20])
        {
            Caption = 'Job Title Code';
            DataClassification = CustomerContent;
        }
        field(61; "User ID"; Code[50])
        {
            Caption = 'User ID';
            Description = 'Rev01';
            TableRelation = User."User Name";
            DataClassification = CustomerContent;
            //This property is currently not supported
            //TestTableRelation = false;

            trigger OnLookup();
            var
                LoginMgt: Codeunit "User Management";
            begin
            end;

            trigger OnValidate();
            begin
                //LoginMgt.LookupUserID("User ID");
            end;
        }
        field(62; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            TableRelation = "Source Code";
            DataClassification = CustomerContent;
        }
        field(63; "Reason Code"; Code[10])
        {
            TableRelation = "Reason Code";
            DataClassification = CustomerContent;
        }
        field(64; "Transaction No."; Integer)
        {
            Caption = 'Transaction No.';
            DataClassification = CustomerContent;
        }
        field(71; "On Hold"; Code[3])
        {
            Caption = 'On Hold';
            DataClassification = CustomerContent;
        }
        field(72; "Applies-to Doc. Type"; Option)
        {
            Caption = 'Applies-to Doc. Type';
            OptionCaption = '" ,Posting,FullFinal,Reimbursement,Payment"';
            OptionMembers = " ",Posting,FullFinal,Reimbursement,Payment;
            DataClassification = CustomerContent;
        }
        field(73; "Applies-to Doc. No."; Code[20])
        {
            Caption = 'Applies-to Doc. No.';
            DataClassification = CustomerContent;
        }
        field(74; Open; Boolean)
        {
            Caption = 'Open';
            DataClassification = CustomerContent;
        }
        field(75; "Due Date"; Date)
        {
            Caption = 'Due Date';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                TestField(Open, true);
            end;
        }
        field(81; "Pmt. Discount Date"; Date)
        {
            Caption = 'Pmt. Discount Date';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                TestField(Open, true);
            end;
        }
        field(82; "Original Pmt. Disc. Possible"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Original Pmt. Disc. Possible';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(83; "Pmt. Disc. Given (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Pmt. Disc. Given (LCY)';
            DataClassification = CustomerContent;
        }
        field(84; Positive; Boolean)
        {
            Caption = 'Positive';
            DataClassification = CustomerContent;
        }
        field(85; "Closed by Entry No."; Integer)
        {
            TableRelation = "Cust. Ledger Entry";
            DataClassification = CustomerContent;
        }
        field(86; "Closed at Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(87; "Closed by Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            DataClassification = CustomerContent;
        }
        field(88; "Applies-to ID"; Code[20])
        {
            Caption = 'Applies-to ID';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                TestField(Open, true);
            end;
        }
        field(89; "Closed by Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Closed by Amount (LCY)';
            DataClassification = CustomerContent;
        }
        field(90; "Debit Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum("Detailed Employee Ledg. Entry"."Debit Amount" WHERE("Employee Ledger Entry No." = FIELD("Entry No."),
                                                                                    "Entry Type" = FILTER(<> Application),
                                                                                    "Posting Date" = FIELD("Date Filter")));
            Caption = 'Debit Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(91; "Credit Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum("Detailed Employee Ledg. Entry"."Credit Amount" WHERE("Employee Ledger Entry No." = FIELD("Entry No."),
                                                                                     "Entry Type" = FILTER(<> Application),
                                                                                     "Posting Date" = FIELD("Date Filter")));
            Caption = 'Credit Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(92; "Debit Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum("Detailed Employee Ledg. Entry"."Debit Amount (LCY)" WHERE("Employee Ledger Entry No." = FIELD("Entry No."),
                                                                                          "Entry Type" = FILTER(<> Application),
                                                                                          "Posting Date" = FIELD("Date Filter")));
            Caption = 'Debit Amount (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(93; "Credit Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum("Detailed Employee Ledg. Entry"."Credit Amount (LCY)" WHERE("Employee Ledger Entry No." = FIELD("Entry No."),
                                                                                           "Entry Type" = FILTER(<> Application),
                                                                                           "Posting Date" = FIELD("Date Filter")));
            Caption = 'Credit Amount (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(94; "Closed by Currency Code"; Code[10])
        {
            Caption = 'Closed by Currency Code';
            TableRelation = Currency;
            DataClassification = CustomerContent;
        }
        field(95; "Closed by Currency Amount"; Decimal)
        {
            AutoFormatExpression = "Closed by Currency Code";
            AutoFormatType = 1;
            Caption = 'Closed by Currency Amount';
            DataClassification = CustomerContent;
        }
        field(100; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(50000; "Payment Indicator"; Option)
        {
            Caption = 'Payment Indicator';
            OptionMembers = " ",Include,Exclude,Reimbursement;
            DataClassification = CustomerContent;
        }
        field(50001; "Gross Earning"; Decimal)
        {
            CalcFormula = - Sum("Pay Employee Pay Details"."Payable Amount" WHERE("Employee No" = FIELD("Employee No."),
                                                                                  Year = FIELD("Posting Year"),
                                                                                  Month = FIELD("Posting Month"),
                                                                                  Type = CONST(Addition),
                                                                                  "Payment Indicator" = FIELD("Payment Indicator"),
                                                                                  "Document No." = FIELD("Document No.")));
            Caption = 'Gross Earning';
            FieldClass = FlowField;
        }
        field(50002; "Gross Deduction"; Decimal)
        {
            CalcFormula = - Sum("Pay Employee Pay Details"."Payable Amount" WHERE("Employee No" = FIELD("Employee No."),
                                                                                  Year = FIELD("Posting Year"),
                                                                                  Month = FIELD("Posting Month"),
                                                                                  Type = CONST(Deduction),
                                                                                  "Payment Indicator" = FIELD("Payment Indicator"),
                                                                                  "Document No." = FIELD("Document No.")));
            Caption = 'Gross Deduction';
            FieldClass = FlowField;
        }
        field(50003; Reimbursement; Decimal)
        {
            CalcFormula = - Sum("Pay Employee Pay Details"."Payable Amount" WHERE("Employee No" = FIELD("Employee No."),
                                                                                  Year = FIELD("Posting Year"),
                                                                                  Month = FIELD("Posting Month"),
                                                                                  Type = CONST(Reimbursement),
                                                                                  "Payment Indicator" = FIELD("Payment Indicator"),
                                                                                  "Document No." = FIELD("Document No.")));
            Caption = 'Reimbursement';
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
        }
        key(Key2; "Pay Journal Template", "Pay Journal Batch", "Entry No.")
        {
        }
        key(Key3; "Document No.", "Document Type", "Employee No.", Open)
        {
        }
        key(Key4; "Employee No.", "Applies-to ID", Open, Positive, "Due Date")
        {
        }
        key(Key5; "Employee No.", "Posting Date")
        {
        }
        key(Key6; "Closed by Entry No.")
        {
        }
        key(Key7; "Employee No.", Open, Positive, "Due Date")
        {
        }
    }

    fieldgroups
    {
    }

    [LineStart(7107)]
    procedure DrillDownOnEntries(var RecDtldEmpLedgEntry: Record "Detailed Employee Ledg. Entry");
    var
        EmpLedgerEntryLocal: Record "Employee Ledger Entry";
    begin
        EmpLedgerEntryLocal.Reset;
        RecDtldEmpLedgEntry.CopyFilter("Employee No.", EmpLedgerEntryLocal."Employee No.");
        RecDtldEmpLedgEntry.CopyFilter("Currency Code", EmpLedgerEntryLocal."Currency Code");
        RecDtldEmpLedgEntry.CopyFilter("Initial Entry Global Dim. 1", EmpLedgerEntryLocal."Global Dimension 1 Code");
        RecDtldEmpLedgEntry.CopyFilter("Initial Entry Global Dim. 2", EmpLedgerEntryLocal."Global Dimension 2 Code");
        EmpLedgerEntryLocal.SetCurrentKey("Employee No.", "Posting Date");
        PAGE.Run(0, EmpLedgerEntryLocal);
    end;

    [LineStart(7116)]
    procedure DrillDownOnOverdueEntries(var RecDtldEmpLedgEntry: Record "Detailed Employee Ledg. Entry");
    var
        EmpLedgerEntryLocal: Record "Employee Ledger Entry";
    begin
        EmpLedgerEntryLocal.Reset;
        RecDtldEmpLedgEntry.CopyFilter("Employee No.", EmpLedgerEntryLocal."Employee No.");
        RecDtldEmpLedgEntry.CopyFilter("Currency Code", EmpLedgerEntryLocal."Currency Code");
        RecDtldEmpLedgEntry.CopyFilter("Initial Entry Global Dim. 1", EmpLedgerEntryLocal."Global Dimension 1 Code");
        RecDtldEmpLedgEntry.CopyFilter("Initial Entry Global Dim. 2", EmpLedgerEntryLocal."Global Dimension 2 Code");
        EmpLedgerEntryLocal.SetCurrentKey("Employee No.", "Posting Date");
        EmpLedgerEntryLocal.SetRange(Open, true);
        EmpLedgerEntryLocal.SetFilter("Due Date", '<%1', WorkDate);
        PAGE.Run(0, EmpLedgerEntryLocal);
    end;
}

