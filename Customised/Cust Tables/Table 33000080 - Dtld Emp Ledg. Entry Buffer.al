table 33000080 "Dtld Emp Ledg. Entry Buffer"
{
    // version NEOGYNPAY13.70.00.07,Rev01


    fields
    {
        field(1;"Pay Journal Template";Code[10])
        {
            TableRelation = "Pay Journal Template";
        }
        field(2;"Pay Journal Batch";Code[10])
        {
            TableRelation = "Pay Gen. Journal Batch".Name WHERE ("Pay Journal Template"=FIELD("Pay Journal Template"));
        }
        field(3;"Entry No.";Integer)
        {
        }
        field(4;"Employee Ledger Entry No.";Integer)
        {
            TableRelation = "Employee Ledger Entry";
        }
        field(5;"Entry Type";Option)
        {
            OptionCaption = ',Initial Entry,Application,Appln. Rounding,Correction of Remaining Amount,Payment';
            OptionMembers = ,"Initial Entry",Application,"Appln. Rounding","Correction of Remaining Amount",Payment;
        }
        field(11;"Employee No.";Code[20])
        {
            TableRelation = Employee;
        }
        field(12;Description;Text[200])
        {
        }
        field(13;"Employee Posting Group";Code[10])
        {
            TableRelation = "Employee Posting Group";
        }
        field(21;"Document Type";Option)
        {
            OptionCaption = '" ,Posting,FullFinal,Reimbursement,Payment"';
            OptionMembers = " ",Posting,FullFinal,Reimbursement,Payment;
        }
        field(22;"Document No.";Code[20])
        {
        }
        field(23;"Document Date";Date)
        {
        }
        field(24;"Posting Date";Date)
        {
        }
        field(25;"Posting Month";Integer)
        {
        }
        field(26;"Posting Year";Integer)
        {
        }
        field(31;"Currency Code";Code[10])
        {
            TableRelation = Currency;
        }
        field(41;Amount;Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
        }
        field(42;"Amount (LCY)";Decimal)
        {
            AutoFormatType = 1;
        }
        field(43;"Debit Amount";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            BlankZero = true;
        }
        field(44;"Credit Amount";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            BlankZero = true;
        }
        field(45;"Debit Amount (LCY)";Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
        }
        field(46;"Credit Amount (LCY)";Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
        }
        field(51;"User ID";Code[50])
        {
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
            TableRelation = "Source Code";
        }
        field(53;"Reason Code";Code[10])
        {
            TableRelation = "Reason Code";
        }
        field(54;"Transaction No.";Integer)
        {
        }
        field(61;"Initial Entry Due Date";Date)
        {
        }
        field(62;"Initial Entry Global Dim. 1";Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No."=CONST(1));
        }
        field(63;"Initial Entry Global Dim. 2";Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No."=CONST(2));
        }
        field(64;"Initial Document Type";Option)
        {
            OptionCaption = '" ,Posting,FullFinal,Reimbursement,Payment"';
            OptionMembers = " ",Posting,FullFinal,Reimbursement,Payment;
        }
        field(70;"Include In PaySlip";Boolean)
        {
        }
        field(71;"Payment Indicator";Option)
        {
            OptionMembers = " ",Include,Exclude,Reimbursement;
        }
        field(72;"Gross Earning";Decimal)
        {
            CalcFormula = Sum("Pay Employee Pay Details"."Payable Amount" WHERE ("Employee No"=FIELD("Employee No."),
                                                                                 "Included In Pay Slip"=FIELD("Include In PaySlip"),
                                                                                 Year=FIELD("Posting Year"),
                                                                                 Month=FIELD("Posting Month"),
                                                                                 Type=CONST(Addition)));
            FieldClass = FlowField;
        }
        field(73;"Gross Deduction";Decimal)
        {
            CalcFormula = Sum("Pay Employee Pay Details"."Payable Amount" WHERE ("Employee No"=FIELD("Employee No."),
                                                                                 "Included In Pay Slip"=FIELD("Include In PaySlip"),
                                                                                 Year=FIELD("Posting Year"),
                                                                                 Month=FIELD("Posting Month"),
                                                                                 Type=CONST(Deduction)));
            FieldClass = FlowField;
        }
        field(74;Reimbursement;Decimal)
        {
            CalcFormula = Sum("Pay Employee Pay Details"."Payable Amount" WHERE ("Employee No"=FIELD("Employee No."),
                                                                                 "Included In Pay Slip"=FIELD("Include In PaySlip"),
                                                                                 Year=FIELD("Posting Year"),
                                                                                 Month=FIELD("Posting Month"),
                                                                                 Type=CONST(Reimbursement)));
            FieldClass = FlowField;
        }
        field(80;"Pay Posting Type";Option)
        {
            OptionCaption = '" ,Posting,Settlement"';
            OptionMembers = " ",Posting,Settlement;

            trigger OnValidate();
            begin
                TestField("Pay Posting Type","Pay Posting Type"::" ");
            end;
        }
        field(81;"Pay Bus. Posting Group";Code[10])
        {
            TableRelation = "Pay Business Posting Group";

            trigger OnValidate();
            begin
                TestField("Pay Bus. Posting Group",'');
            end;
        }
        field(82;"Pay Prod. Posting Group";Code[10])
        {
            TableRelation = "Pay Product Posting Group";

            trigger OnValidate();
            begin
                TestField("Pay Prod. Posting Group",'');
            end;
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
    }

    fieldgroups
    {
    }
}

