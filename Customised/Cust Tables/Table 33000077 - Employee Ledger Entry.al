table 33000077 "Employee Ledger Entry"
{
    // version NEOGYNPAY13.70.00.07,Rev01

    DrillDownPageID = 33000169;
    LookupPageID = 33000169;

    fields
    {
        field(1;"Pay Journal Template";Code[10])
        {
            Caption = 'Pay Journal Template';
            TableRelation = "Pay Journal Template";
        }
        field(2;"Pay Journal Batch";Code[10])
        {
            Caption = 'Pay Journal Batch';
            TableRelation = "Pay Gen. Journal Batch".Name WHERE ("Pay Journal Template"=FIELD("Pay Journal Template"));
        }
        field(3;"Entry No.";Integer)
        {
            Caption = 'Entry No.';
        }
        field(4;"Employee No.";Code[20])
        {
            Caption = 'Employee No.';
            TableRelation = Employee;
        }
        field(5;Description;Text[200])
        {
        }
        field(6;"Employee Posting Group";Code[10])
        {
            Caption = 'Employee Posting Group';
            TableRelation = "Employee Posting Group";
        }
        field(11;"Document Type";Option)
        {
            OptionCaption = '" ,Posting,FullFinal,Reimbursement,Payment"';
            OptionMembers = " ",Posting,FullFinal,Reimbursement,Payment;
        }
        field(12;"Document No.";Code[20])
        {
        }
        field(13;"Document Date";Date)
        {
            Caption = 'Document Date';
        }
        field(14;"Posting Date";Date)
        {
            Caption = 'Posting Date';
        }
        field(15;"Posting Month";Integer)
        {
        }
        field(16;"Posting Year";Integer)
        {
        }
        field(21;"Bal. Account Type";Option)
        {
            Caption = 'Bal. Account Type';
            OptionCaption = 'Employee,G/L Account,Bank Account';
            OptionMembers = Employee,"G/L Account","Bank Account";
        }
        field(22;"Bal. Account No.";Code[20])
        {
            Caption = 'Bal. Account No.';
            TableRelation = IF ("Bal. Account Type"=FILTER(Employee)) Employee."No.";
        }
        field(31;Amount;Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Employee Ledg. Entry".Amount WHERE ("Employee Ledger Entry No."=FIELD("Entry No."),
                                                                            "Entry Type"=FILTER("Initial Entry"),
                                                                            "Posting Date"=FIELD("Date Filter")));
            Caption = 'Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(32;"Amount (LCY)";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Employee Ledg. Entry"."Amount (LCY)" WHERE ("Employee Ledger Entry No."=FIELD("Entry No."),
                                                                                    "Entry Type"=FILTER("Initial Entry"),
                                                                                    "Posting Date"=FIELD("Date Filter")));
            Caption = 'Amount (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(33;"Original Amount";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Employee Ledg. Entry".Amount WHERE ("Employee Ledger Entry No."=FIELD("Entry No."),
                                                                            "Entry Type"=FILTER("Initial Entry"),
                                                                            "Posting Date"=FIELD("Date Filter")));
            Caption = 'Original Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(34;"Original Amt. (LCY)";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Employee Ledg. Entry"."Amount (LCY)" WHERE ("Employee Ledger Entry No."=FIELD("Entry No."),
                                                                                    "Entry Type"=FILTER("Initial Entry"),
                                                                                    "Posting Date"=FIELD("Date Filter")));
            Caption = 'Original Amt. (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(35;"Remaining Amount";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Employee Ledg. Entry".Amount WHERE ("Employee Ledger Entry No."=FIELD("Entry No."),
                                                                            "Posting Date"=FIELD("Date Filter")));
            Caption = 'Remaining Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(36;"Remaining Amt. (LCY)";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Employee Ledg. Entry"."Amount (LCY)" WHERE ("Employee Ledger Entry No."=FIELD("Entry No."),
                                                                                    "Posting Date"=FIELD("Date Filter")));
            Caption = 'Remaining Amt. (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(41;"Currency Code";Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }
        field(42;"Adjusted Currency Factor";Decimal)
        {
            Caption = 'Adjusted Currency Factor';
            DecimalPlaces = 0:15;
        }
        field(43;"Original Currency Factor";Decimal)
        {
            Caption = 'Original Currency Factor';
            DecimalPlaces = 0:15;
        }
        field(51;"Global Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No."=CONST(1));
        }
        field(52;"Global Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No."=CONST(2));
        }
        field(53;Grade;Code[10])
        {
            Caption = 'Grade';
            TableRelation = "Pay Grade";
        }
        field(54;"Location Code";Code[20])
        {
            Caption = 'Location Code';
        }
        field(55;"Job Title Code";Code[20])
        {
            Caption = 'Job Title Code';
        }
        field(61;"User ID";Code[50])
        {
            Caption = 'User ID';
            Description = 'Rev01';
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;

            trigger OnLookup();
            var
                LoginMgt : Codeunit "User Management";
            begin
            end;

            trigger OnValidate();
            begin
                //LoginMgt.LookupUserID("User ID");
            end;
        }
        field(62;"Source Code";Code[10])
        {
            Caption = 'Source Code';
            TableRelation = "Source Code";
        }
        field(63;"Reason Code";Code[10])
        {
            TableRelation = "Reason Code";
        }
        field(64;"Transaction No.";Integer)
        {
            Caption = 'Transaction No.';
        }
        field(71;"On Hold";Code[3])
        {
            Caption = 'On Hold';
        }
        field(72;"Applies-to Doc. Type";Option)
        {
            Caption = 'Applies-to Doc. Type';
            OptionCaption = '" ,Posting,FullFinal,Reimbursement,Payment"';
            OptionMembers = " ",Posting,FullFinal,Reimbursement,Payment;
        }
        field(73;"Applies-to Doc. No.";Code[20])
        {
            Caption = 'Applies-to Doc. No.';
        }
        field(74;Open;Boolean)
        {
            Caption = 'Open';
        }
        field(75;"Due Date";Date)
        {
            Caption = 'Due Date';

            trigger OnValidate();
            begin
                TestField(Open,true);
            end;
        }
        field(81;"Pmt. Discount Date";Date)
        {
            Caption = 'Pmt. Discount Date';

            trigger OnValidate();
            begin
                TestField(Open,true);
            end;
        }
        field(82;"Original Pmt. Disc. Possible";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Original Pmt. Disc. Possible';
            Editable = false;
        }
        field(83;"Pmt. Disc. Given (LCY)";Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Pmt. Disc. Given (LCY)';
        }
        field(84;Positive;Boolean)
        {
            Caption = 'Positive';
        }
        field(85;"Closed by Entry No.";Integer)
        {
            TableRelation = "Cust. Ledger Entry";
        }
        field(86;"Closed at Date";Date)
        {
        }
        field(87;"Closed by Amount";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
        }
        field(88;"Applies-to ID";Code[20])
        {
            Caption = 'Applies-to ID';

            trigger OnValidate();
            begin
                TestField(Open,true);
            end;
        }
        field(89;"Closed by Amount (LCY)";Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Closed by Amount (LCY)';
        }
        field(90;"Debit Amount";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum("Detailed Employee Ledg. Entry"."Debit Amount" WHERE ("Employee Ledger Entry No."=FIELD("Entry No."),
                                                                                    "Entry Type"=FILTER(<>Application),
                                                                                    "Posting Date"=FIELD("Date Filter")));
            Caption = 'Debit Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(91;"Credit Amount";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum("Detailed Employee Ledg. Entry"."Credit Amount" WHERE ("Employee Ledger Entry No."=FIELD("Entry No."),
                                                                                     "Entry Type"=FILTER(<>Application),
                                                                                     "Posting Date"=FIELD("Date Filter")));
            Caption = 'Credit Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(92;"Debit Amount (LCY)";Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum("Detailed Employee Ledg. Entry"."Debit Amount (LCY)" WHERE ("Employee Ledger Entry No."=FIELD("Entry No."),
                                                                                          "Entry Type"=FILTER(<>Application),
                                                                                          "Posting Date"=FIELD("Date Filter")));
            Caption = 'Debit Amount (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(93;"Credit Amount (LCY)";Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum("Detailed Employee Ledg. Entry"."Credit Amount (LCY)" WHERE ("Employee Ledger Entry No."=FIELD("Entry No."),
                                                                                           "Entry Type"=FILTER(<>Application),
                                                                                           "Posting Date"=FIELD("Date Filter")));
            Caption = 'Credit Amount (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(94;"Closed by Currency Code";Code[10])
        {
            Caption = 'Closed by Currency Code';
            TableRelation = Currency;
        }
        field(95;"Closed by Currency Amount";Decimal)
        {
            AutoFormatExpression = "Closed by Currency Code";
            AutoFormatType = 1;
            Caption = 'Closed by Currency Amount';
        }
        field(100;"Date Filter";Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(50000;"Payment Indicator";Option)
        {
            Caption = 'Payment Indicator';
            OptionMembers = " ",Include,Exclude,Reimbursement;
        }
        field(50001;"Gross Earning";Decimal)
        {
            CalcFormula = -Sum("Pay Employee Pay Details"."Payable Amount" WHERE ("Employee No"=FIELD("Employee No."),
                                                                                  Year=FIELD("Posting Year"),
                                                                                  Month=FIELD("Posting Month"),
                                                                                  Type=CONST(Addition),
                                                                                  "Payment Indicator"=FIELD("Payment Indicator"),
                                                                                  "Document No."=FIELD("Document No.")));
            Caption = 'Gross Earning';
            FieldClass = FlowField;
        }
        field(50002;"Gross Deduction";Decimal)
        {
            CalcFormula = -Sum("Pay Employee Pay Details"."Payable Amount" WHERE ("Employee No"=FIELD("Employee No."),
                                                                                  Year=FIELD("Posting Year"),
                                                                                  Month=FIELD("Posting Month"),
                                                                                  Type=CONST(Deduction),
                                                                                  "Payment Indicator"=FIELD("Payment Indicator"),
                                                                                  "Document No."=FIELD("Document No.")));
            Caption = 'Gross Deduction';
            FieldClass = FlowField;
        }
        field(50003;Reimbursement;Decimal)
        {
            CalcFormula = -Sum("Pay Employee Pay Details"."Payable Amount" WHERE ("Employee No"=FIELD("Employee No."),
                                                                                  Year=FIELD("Posting Year"),
                                                                                  Month=FIELD("Posting Month"),
                                                                                  Type=CONST(Reimbursement),
                                                                                  "Payment Indicator"=FIELD("Payment Indicator"),
                                                                                  "Document No."=FIELD("Document No.")));
            Caption = 'Reimbursement';
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
        }
        key(Key2;"Pay Journal Template","Pay Journal Batch","Entry No.")
        {
        }
        key(Key3;"Document No.","Document Type","Employee No.",Open)
        {
        }
        key(Key4;"Employee No.","Applies-to ID",Open,Positive,"Due Date")
        {
        }
        key(Key5;"Employee No.","Posting Date")
        {
        }
        key(Key6;"Closed by Entry No.")
        {
        }
        key(Key7;"Employee No.",Open,Positive,"Due Date")
        {
        }
    }

    fieldgroups
    {
    }

    [LineStart(7107)]
    procedure DrillDownOnEntries(var RecDtldEmpLedgEntry : Record "Detailed Employee Ledg. Entry");
    var
        EmpLedgerEntryLocal : Record "Employee Ledger Entry";
    begin
        EmpLedgerEntryLocal.Reset;
        RecDtldEmpLedgEntry.CopyFilter("Employee No.",EmpLedgerEntryLocal."Employee No.");
        RecDtldEmpLedgEntry.CopyFilter("Currency Code",EmpLedgerEntryLocal."Currency Code");
        RecDtldEmpLedgEntry.CopyFilter("Initial Entry Global Dim. 1",EmpLedgerEntryLocal."Global Dimension 1 Code");
        RecDtldEmpLedgEntry.CopyFilter("Initial Entry Global Dim. 2",EmpLedgerEntryLocal."Global Dimension 2 Code");
        EmpLedgerEntryLocal.SetCurrentKey("Employee No.","Posting Date");
        PAGE.Run(0,EmpLedgerEntryLocal);
    end;

    [LineStart(7116)]
    procedure DrillDownOnOverdueEntries(var RecDtldEmpLedgEntry : Record "Detailed Employee Ledg. Entry");
    var
        EmpLedgerEntryLocal : Record "Employee Ledger Entry";
    begin
        EmpLedgerEntryLocal.Reset;
        RecDtldEmpLedgEntry.CopyFilter("Employee No.",EmpLedgerEntryLocal."Employee No.");
        RecDtldEmpLedgEntry.CopyFilter("Currency Code",EmpLedgerEntryLocal."Currency Code");
        RecDtldEmpLedgEntry.CopyFilter("Initial Entry Global Dim. 1",EmpLedgerEntryLocal."Global Dimension 1 Code");
        RecDtldEmpLedgEntry.CopyFilter("Initial Entry Global Dim. 2",EmpLedgerEntryLocal."Global Dimension 2 Code");
        EmpLedgerEntryLocal.SetCurrentKey("Employee No.","Posting Date");
        EmpLedgerEntryLocal.SetRange(Open,true);
        EmpLedgerEntryLocal.SetFilter("Due Date",'<%1',WorkDate);
        PAGE.Run(0,EmpLedgerEntryLocal);
    end;
}

