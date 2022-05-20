table 33000078 "Detailed Employee Ledg. Entry"
{
    // version NEOGYNPAY13.70.00.07,Rev01

    DrillDownPageID = 33000170;
    LookupPageID = 33000170;

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
        field(4;"Employee Ledger Entry No.";Integer)
        {
            Caption = 'Employee Ledger Entry No.';
            TableRelation = "Employee Ledger Entry" WHERE ("Pay Journal Template"=FIELD("Pay Journal Template"),
                                                           "Pay Journal Batch"=FIELD("Pay Journal Batch"),
                                                           "Entry No."=FIELD("Employee Ledger Entry No."),
                                                           "Employee No."=FIELD("Employee No."));
        }
        field(5;"Entry Type";Option)
        {
            Caption = 'Entry Type';
            OptionCaption = ',Initial Entry,Application,Appln. Rounding,Correction of Remaining Amount,Payment';
            OptionMembers = ,"Initial Entry",Application,"Appln. Rounding","Correction of Remaining Amount",Payment;
        }
        field(11;"Employee No.";Code[20])
        {
            Caption = 'Employee No.';
            TableRelation = Employee;
        }
        field(12;Description;Text[200])
        {
            Caption = 'Description';
        }
        field(13;"Employee Posting Group";Code[10])
        {
            Caption = 'Employee Posting Group';
            TableRelation = "Employee Posting Group";
        }
        field(21;"Document Type";Option)
        {
            Caption = 'Document Type';
            OptionCaption = '" ,Posting,FullFinal,Reimbursement,Payment"';
            OptionMembers = " ",Posting,FullFinal,Reimbursement,Payment;
        }
        field(22;"Document No.";Code[20])
        {
            Caption = 'Document No.';
        }
        field(23;"Document Date";Date)
        {
            Caption = 'Document Date';
        }
        field(24;"Posting Date";Date)
        {
            Caption = 'Posting Date';
        }
        field(25;"Posting Month";Integer)
        {
            Caption = 'Posting Month';
        }
        field(26;"Posting Year";Integer)
        {
            Caption = 'Posting Year';
        }
        field(31;"Currency Code";Code[10])
        {
            TableRelation = Currency;
        }
        field(41;Amount;Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Amount';
        }
        field(42;"Amount (LCY)";Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount (LCY)';
        }
        field(43;"Debit Amount";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Debit Amount';
        }
        field(44;"Credit Amount";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Credit Amount';
        }
        field(45;"Debit Amount (LCY)";Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Debit Amount (LCY)';
        }
        field(46;"Credit Amount (LCY)";Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Credit Amount (LCY)';
        }
        field(51;"User ID";Code[50])
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
                //LoginMgt.LookupUserID("User ID");
            end;
        }
        field(52;"Source Code";Code[10])
        {
            Caption = 'Source Code';
            TableRelation = "Source Code";
        }
        field(53;"Reason Code";Code[10])
        {
            Caption = 'Reason Code';
            TableRelation = "Reason Code";
        }
        field(54;"Transaction No.";Integer)
        {
            Caption = 'Transaction No.';
        }
        field(61;"Initial Entry Due Date";Date)
        {
            Caption = 'Initial Entry Due Date';
        }
        field(62;"Initial Entry Global Dim. 1";Code[20])
        {
            Caption = 'Initial Entry Global Dim. 1';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No."=CONST(1));
        }
        field(63;"Initial Entry Global Dim. 2";Code[20])
        {
            Caption = 'Initial Entry Global Dim. 2';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No."=CONST(2));
        }
        field(64;"Initial Document Type";Option)
        {
            Caption = 'Initial Document Type';
            OptionCaption = '" ,Posting,FullFinal,Reimbursement,Payment"';
            OptionMembers = " ",Posting,FullFinal,Reimbursement,Payment;
        }
        field(70;"Include In PaySlip";Boolean)
        {
        }
        field(71;"Payment Indicator";Option)
        {
            Caption = 'Payment Indicator';
            OptionMembers = " ",Include,Exclude,Reimbursement;
        }
        field(72;"Gross Earning";Decimal)
        {
            CalcFormula = -Sum("Pay Employee Pay Details"."Payable Amount" WHERE ("Employee No"=FIELD("Employee No."),
                                                                                  "Included In Pay Slip"=FIELD("Include In PaySlip"),
                                                                                  Year=FIELD("Posting Year"),
                                                                                  Month=FIELD("Posting Month"),
                                                                                  Type=CONST(Addition),
                                                                                  "Payment Indicator"=FIELD("Payment Indicator")));
            Caption = 'Gross Earning';
            FieldClass = FlowField;
        }
        field(73;"Gross Deduction";Decimal)
        {
            CalcFormula = -Sum("Pay Employee Pay Details"."Payable Amount" WHERE ("Employee No"=FIELD("Employee No."),
                                                                                  "Included In Pay Slip"=FIELD("Include In PaySlip"),
                                                                                  Year=FIELD("Posting Year"),
                                                                                  Month=FIELD("Posting Month"),
                                                                                  Type=CONST(Deduction)));
            Caption = 'Gross Deduction';
            FieldClass = FlowField;
        }
        field(74;Reimbursement;Decimal)
        {
            CalcFormula = -Sum("Pay Employee Pay Details"."Payable Amount" WHERE ("Employee No"=FIELD("Employee No."),
                                                                                  "Included In Pay Slip"=FIELD("Include In PaySlip"),
                                                                                  Year=FIELD("Posting Year"),
                                                                                  Month=FIELD("Posting Month"),
                                                                                  Type=CONST(Reimbursement)));
            Caption = 'Reimbursement';
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
        }
        key(Key2;"Pay Journal Template","Pay Journal Batch","Employee Ledger Entry No.","Entry No.")
        {
        }
        key(Key3;"Employee Ledger Entry No.","Entry Type","Posting Date")
        {
            SumIndexFields = Amount,"Amount (LCY)","Debit Amount","Credit Amount","Debit Amount (LCY)","Credit Amount (LCY)";
        }
        key(Key4;"Document No.","Document Type","Employee No.")
        {
        }
        key(Key5;"Employee No.","Initial Entry Global Dim. 1","Initial Entry Global Dim. 2","Posting Date","Currency Code","Initial Document Type","Entry Type")
        {
            SumIndexFields = Amount,"Amount (LCY)";
        }
        key(Key6;"Employee Ledger Entry No.","Posting Date")
        {
        }
    }

    fieldgroups
    {
    }
}

