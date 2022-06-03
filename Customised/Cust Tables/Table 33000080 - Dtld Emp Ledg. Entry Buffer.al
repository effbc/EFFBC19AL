table 33000080 "Dtld Emp Ledg. Entry Buffer"
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
        field(4; "Employee Ledger Entry No."; Integer)
        {
            TableRelation = "Employee Ledger Entry";
            DataClassification = CustomerContent;
        }
        field(5; "Entry Type"; Option)
        {
            OptionCaption = ',Initial Entry,Application,Appln. Rounding,Correction of Remaining Amount,Payment';
            OptionMembers = ,"Initial Entry",Application,"Appln. Rounding","Correction of Remaining Amount",Payment;
            DataClassification = CustomerContent;
        }
        field(11; "Employee No."; Code[20])
        {
            TableRelation = Employee;
            DataClassification = CustomerContent;
        }
        field(12; Description; Text[200])
        {
            DataClassification = CustomerContent;
        }
        field(13; "Employee Posting Group"; Code[10])
        {
            TableRelation = "Employee Posting Group";
            DataClassification = CustomerContent;
        }
        field(21; "Document Type"; Option)
        {
            OptionCaption = '" ,Posting,FullFinal,Reimbursement,Payment"';
            OptionMembers = " ",Posting,FullFinal,Reimbursement,Payment;
            DataClassification = CustomerContent;
        }
        field(22; "Document No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(23; "Document Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(24; "Posting Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(25; "Posting Month"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(26; "Posting Year"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(31; "Currency Code"; Code[10])
        {
            TableRelation = Currency;
            DataClassification = CustomerContent;
        }
        field(41; Amount; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            DataClassification = CustomerContent;
        }
        field(42; "Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            DataClassification = CustomerContent;
        }
        field(43; "Debit Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            BlankZero = true;
            DataClassification = CustomerContent;
        }
        field(44; "Credit Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            BlankZero = true;
            DataClassification = CustomerContent;
        }
        field(45; "Debit Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            DataClassification = CustomerContent;
        }
        field(46; "Credit Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            DataClassification = CustomerContent;
        }
        field(51; "User ID"; Code[50])
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
                //LoginMgt.LookupUserID("User ID");
            end;
        }
        field(52; "Source Code"; Code[10])
        {
            TableRelation = "Source Code";
            DataClassification = CustomerContent;
        }
        field(53; "Reason Code"; Code[10])
        {
            TableRelation = "Reason Code";
            DataClassification = CustomerContent;
        }
        field(54; "Transaction No."; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(61; "Initial Entry Due Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(62; "Initial Entry Global Dim. 1"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
            DataClassification = CustomerContent;
        }
        field(63; "Initial Entry Global Dim. 2"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
            DataClassification = CustomerContent;
        }
        field(64; "Initial Document Type"; Option)
        {
            OptionCaption = '" ,Posting,FullFinal,Reimbursement,Payment"';
            OptionMembers = " ",Posting,FullFinal,Reimbursement,Payment;
            DataClassification = CustomerContent;
        }
        field(70; "Include In PaySlip"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(71; "Payment Indicator"; Option)
        {
            OptionMembers = " ",Include,Exclude,Reimbursement;
            DataClassification = CustomerContent;
        }
        field(72; "Gross Earning"; Decimal)
        {
            CalcFormula = Sum("Pay Employee Pay Details"."Payable Amount" WHERE("Employee No" = FIELD("Employee No."),
                                                                                 "Included In Pay Slip" = FIELD("Include In PaySlip"),
                                                                                 Year = FIELD("Posting Year"),
                                                                                 Month = FIELD("Posting Month"),
                                                                                 Type = CONST(Addition)));
            FieldClass = FlowField;
        }
        field(73; "Gross Deduction"; Decimal)
        {
            CalcFormula = Sum("Pay Employee Pay Details"."Payable Amount" WHERE("Employee No" = FIELD("Employee No."),
                                                                                 "Included In Pay Slip" = FIELD("Include In PaySlip"),
                                                                                 Year = FIELD("Posting Year"),
                                                                                 Month = FIELD("Posting Month"),
                                                                                 Type = CONST(Deduction)));
            FieldClass = FlowField;
        }
        field(74; Reimbursement; Decimal)
        {
            CalcFormula = Sum("Pay Employee Pay Details"."Payable Amount" WHERE("Employee No" = FIELD("Employee No."),
                                                                                 "Included In Pay Slip" = FIELD("Include In PaySlip"),
                                                                                 Year = FIELD("Posting Year"),
                                                                                 Month = FIELD("Posting Month"),
                                                                                 Type = CONST(Reimbursement)));
            FieldClass = FlowField;
        }
        field(80; "Pay Posting Type"; Option)
        {
            OptionCaption = '" ,Posting,Settlement"';
            OptionMembers = " ",Posting,Settlement;
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                TestField("Pay Posting Type", "Pay Posting Type"::" ");
            end;
        }
        field(81; "Pay Bus. Posting Group"; Code[10])
        {
            TableRelation = "Pay Business Posting Group";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                TestField("Pay Bus. Posting Group", '');
            end;
        }
        field(82; "Pay Prod. Posting Group"; Code[10])
        {
            TableRelation = "Pay Product Posting Group";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                TestField("Pay Prod. Posting Group", '');
            end;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
        }
        key(Key2; "Pay Journal Template", "Pay Journal Batch", "Employee Ledger Entry No.", "Entry No.")
        {
        }
        key(Key3; "Employee Ledger Entry No.", "Entry Type", "Posting Date")
        {
            SumIndexFields = Amount, "Amount (LCY)", "Debit Amount", "Credit Amount", "Debit Amount (LCY)", "Credit Amount (LCY)";
        }
    }

    fieldgroups
    {
    }
}

