table 33000079 "Emp Ledger Entry Buffer"
{
    DataClassification = CustomerContent;
    // version NEOGYNPAY13.70.00.07,Rev01


    fields
    {
        field(1; "Pay Journal Template"; Code[10])
        {
            TableRelation = "Pay Journal Template";
            DataClassification = CustomerContent;
        }
        field(2; "Pay Journal Batch"; Code[10])
        {
            TableRelation = "Pay Gen. Journal Batch".Name WHERE("Pay Journal Template" = FIELD("Pay Journal Template"));
            DataClassification = CustomerContent;
        }
        field(3; "Entry No."; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(4; "Employee No."; Code[20])
        {
            TableRelation = Employee;
            DataClassification = CustomerContent;
        }
        field(5; Description; Text[200])
        {
            DataClassification = CustomerContent;
        }
        field(6; "Employee Posting Group"; Code[10])
        {
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
            DataClassification = CustomerContent;
        }
        field(14; "Posting Date"; Date)
        {
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
            OptionCaption = 'Employee,G/L Account,Bank Account';
            OptionMembers = Employee,"G/L Account","Bank Account";
            DataClassification = CustomerContent;
        }
        field(22; "Bal. Account No."; Code[20])
        {
            TableRelation = IF ("Bal. Account Type" = FILTER(Employee)) Employee."No.";
            DataClassification = CustomerContent;
        }
        field(31; Amount; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = Sum("Dtld Emp Ledg. Entry Buffer".Amount WHERE("Employee Ledger Entry No." = FIELD("Entry No."),
                                                                          "Entry Type" = FILTER("Initial Entry"),
                                                                          "Posting Date" = FIELD("Date Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(32; "Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Dtld Emp Ledg. Entry Buffer"."Amount (LCY)" WHERE("Employee Ledger Entry No." = FIELD("Entry No."),
                                                                                  "Entry Type" = FILTER("Initial Entry"),
                                                                                  "Posting Date" = FIELD("Date Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(33; "Original Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = Sum("Dtld Emp Ledg. Entry Buffer".Amount WHERE("Employee Ledger Entry No." = FIELD("Entry No."),
                                                                          "Entry Type" = FILTER("Initial Entry"),
                                                                          "Posting Date" = FIELD("Date Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(34; "Original Amt. (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Dtld Emp Ledg. Entry Buffer"."Amount (LCY)" WHERE("Employee Ledger Entry No." = FIELD("Entry No."),
                                                                                  "Entry Type" = FILTER("Initial Entry"),
                                                                                  "Posting Date" = FIELD("Date Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(35; "Remaining Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = Sum("Dtld Emp Ledg. Entry Buffer".Amount WHERE("Employee Ledger Entry No." = FIELD("Entry No."),
                                                                          "Posting Date" = FIELD("Date Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(36; "Remaining Amt. (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Dtld Emp Ledg. Entry Buffer"."Amount (LCY)" WHERE("Employee Ledger Entry No." = FIELD("Entry No."),
                                                                                  "Posting Date" = FIELD("Date Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(41; "Currency Code"; Code[10])
        {
            TableRelation = Currency;
            DataClassification = CustomerContent;
        }
        field(42; "Adjusted Currency Factor"; Decimal)
        {
            DecimalPlaces = 0 : 15;
            DataClassification = CustomerContent;
        }
        field(43; "Original Currency Factor"; Decimal)
        {
            DecimalPlaces = 0 : 15;
            DataClassification = CustomerContent;
        }
        field(51; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
            DataClassification = CustomerContent;
        }
        field(52; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
            DataClassification = CustomerContent;
        }
        field(53; Grade; Code[10])
        {
            TableRelation = "Pay Grade";
            DataClassification = CustomerContent;
        }
        field(54; "Location Code"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(55; "Job Title Code"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(61; "User ID"; Code[50])
        {
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
            DataClassification = CustomerContent;
        }
        field(71; "On Hold"; Code[3])
        {
            DataClassification = CustomerContent;
        }
        field(72; "Applies-to Doc. Type"; Option)
        {
            OptionCaption = '" ,Posting,FullFinal,Reimbursement,Payment"';
            OptionMembers = " ",Posting,FullFinal,Reimbursement,Payment;
            DataClassification = CustomerContent;
        }
        field(73; "Applies-to Doc. No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(74; Open; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(75; "Due Date"; Date)
        {
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                TestField(Open, true);
            end;
        }
        field(81; "Pmt. Discount Date"; Date)
        {
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
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(83; "Pmt. Disc. Given (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            DataClassification = CustomerContent;
        }
        field(84; Positive; Boolean)
        {
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
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                TestField(Open, true);
            end;
        }
        field(89; "Closed by Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            DataClassification = CustomerContent;
        }
        field(90; "Debit Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum("Dtld Emp Ledg. Entry Buffer"."Debit Amount" WHERE("Employee Ledger Entry No." = FIELD("Entry No."),
                                                                                  "Entry Type" = FILTER(<> Application),
                                                                                  "Posting Date" = FIELD("Date Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(91; "Credit Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum("Dtld Emp Ledg. Entry Buffer"."Credit Amount" WHERE("Employee Ledger Entry No." = FIELD("Entry No."),
                                                                                   "Entry Type" = FILTER(<> Application),
                                                                                   "Posting Date" = FIELD("Date Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(92; "Debit Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum("Dtld Emp Ledg. Entry Buffer"."Debit Amount (LCY)" WHERE("Employee Ledger Entry No." = FIELD("Entry No."),
                                                                                        "Entry Type" = FILTER(<> Application),
                                                                                        "Posting Date" = FIELD("Date Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(93; "Credit Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum("Dtld Emp Ledg. Entry Buffer"."Credit Amount (LCY)" WHERE("Employee Ledger Entry No." = FIELD("Entry No."),
                                                                                         "Entry Type" = FILTER(<> Application),
                                                                                         "Posting Date" = FIELD("Date Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(94; "Closed by Currency Code"; Code[10])
        {
            TableRelation = Currency;
            DataClassification = CustomerContent;
        }
        field(95; "Closed by Currency Amount"; Decimal)
        {
            AutoFormatExpression = "Closed by Currency Code";
            AutoFormatType = 1;
            DataClassification = CustomerContent;
        }
        field(100; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(50000; "Payment Indicator"; Option)
        {
            Caption = 'Payment Indicator';
            OptionMembers = " ",Include,Exclude,Reimbursement;
            DataClassification = CustomerContent;
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
    }

    fieldgroups
    {
    }
}

