table 60087 "MSPT Dtld. Cust. Ledg. Entry"
{
    // version MSPT1.0,Rev01

    // B2B Software Technologies
    // ---------------------------------------------------
    // Project : Mile Stone Payment Terms
    // B2B
    // No. sign   Description
    // ---------------------------------------------------
    // 01  B2B    MSPT Detailed Customer Ledger Entry

    Caption = 'MSPT Dtld. Cust. Ledg. Entry';
    DataCaptionFields = "Customer No.";
    DrillDownPageID = "MSPT Dtld. Cust. Ledg. Entries";
    LookupPageID = "MSPT Dtld. Cust. Ledg. Entries";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
        }
        field(2; "Cust. Ledger Entry No."; Integer)
        {
            Caption = 'Cust. Ledger Entry No.';
            TableRelation = "Cust. Ledger Entry";
            DataClassification = CustomerContent;
        }
        field(3; "Entry Type"; Option)
        {
            Caption = 'Entry Type';
            OptionCaption = ',Initial Entry,Application,Unrealized Loss,Unrealized Gain,Realized Loss,Realized Gain,Payment Discount,Payment Discount (VAT Excl.),Payment Discount (VAT Adjustment),Appln. Rounding,Correction of Remaining Amount,Payment Tolerance,Payment Discount Tolerance,Payment Tolerance (VAT Excl.),Payment Tolerance (VAT Adjustment),Payment Discount Tolerance (VAT Excl.),Payment Discount Tolerance (VAT Adjustment)';
            OptionMembers = ,"Initial Entry",Application,"Unrealized Loss","Unrealized Gain","Realized Loss","Realized Gain","Payment Discount","Payment Discount (VAT Excl.)","Payment Discount (VAT Adjustment)","Appln. Rounding","Correction of Remaining Amount","Payment Tolerance","Payment Discount Tolerance","Payment Tolerance (VAT Excl.)","Payment Tolerance (VAT Adjustment)","Payment Discount Tolerance (VAT Excl.)","Payment Discount Tolerance (VAT Adjustment)";
            DataClassification = CustomerContent;
        }
        field(4; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
        }
        field(5; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = '" ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund"';
            OptionMembers = " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
            DataClassification = CustomerContent;
        }
        field(6; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = CustomerContent;
        }
        field(7; Amount; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Amount';
            DataClassification = CustomerContent;
        }
        field(8; "Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount (LCY)';
            DataClassification = CustomerContent;
        }
        field(9; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer;
            DataClassification = CustomerContent;
        }
        field(10; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
            DataClassification = CustomerContent;
        }
        field(11; "User ID"; Code[50])
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
                LoginMgt.LookupUserID("User ID");
            end;
        }
        field(12; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            TableRelation = "Source Code";
            DataClassification = CustomerContent;
        }
        field(13; "Transaction No."; Integer)
        {
            Caption = 'Transaction No.';
            DataClassification = CustomerContent;
        }
        field(14; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
            DataClassification = CustomerContent;
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(15; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            TableRelation = "Reason Code";
            DataClassification = CustomerContent;
        }
        field(16; "Debit Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Debit Amount';
            DataClassification = CustomerContent;
        }
        field(17; "Credit Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Credit Amount';
            DataClassification = CustomerContent;
        }
        field(18; "Debit Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Debit Amount (LCY)';
            DataClassification = CustomerContent;
        }
        field(19; "Credit Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Credit Amount (LCY)';
            DataClassification = CustomerContent;
        }
        field(20; "Initial Entry Due Date"; Date)
        {
            Caption = 'Initial Entry Due Date';
            DataClassification = CustomerContent;
        }
        field(21; "Initial Entry Global Dim. 1"; Code[20])
        {
            Caption = 'Initial Entry Global Dim. 1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
            DataClassification = CustomerContent;
        }
        field(22; "Initial Entry Global Dim. 2"; Code[20])
        {
            Caption = 'Initial Entry Global Dim. 2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
            DataClassification = CustomerContent;
        }
        field(35; "Initial Document Type"; Option)
        {
            Caption = 'Initial Document Type';
            OptionCaption = '" ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund"';
            OptionMembers = " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
            DataClassification = CustomerContent;
        }
        field(13700; "Export Document"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(13702; "TDS Nature of Deduction"; Code[10])
        {
            NotBlank = true;
            TableRelation = "TDS Nature of Deduction";
            DataClassification = CustomerContent;
        }
        field(13703; "TDS Group"; Option)
        {
            Editable = false;
            OptionCaption = '" ,Contractor,Commission,Professional,Interest,Rent,Dividend,Interest on Securities,Lotteries,Insurance Commission,NSS,Mutual fund,Brokerage,Income from Units,Capital Assets,Horse Races,Sports Association,Payable to Non Residents,Income of Mutual Funds,Units,Foreign Currency Bonds,FII from Securities,Others"';
            OptionMembers = " ",Contractor,Commission,Professional,Interest,Rent,Dividend,"Interest on Securities",Lotteries,"Insurance Commission",NSS,"Mutual fund",Brokerage,"Income from Units","Capital Assets","Horse Races","Sports Association","Payable to Non Residents","Income of Mutual Funds",Units,"Foreign Currency Bonds","FII from Securities",Others;
            DataClassification = CustomerContent;
        }
        field(13704; "Total TDS Including eCESS"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50001; "MSPT Dtld. Entry No."; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(50002; "MSPT Header Code"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(50003; "MSPT Line No."; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(50004; "MSPT Amount"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50005; "Calculation Type"; Option)
        {
            Enabled = false;
            OptionMembers = Percentage,"Fixed Value";
            DataClassification = CustomerContent;
        }
        field(50006; "MSPT Credit Value"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50007; "MSPT Debit Value"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50008; "Calculation Value"; Decimal)
        {
            Enabled = false;
            DataClassification = CustomerContent;
        }
        field(50009; "MSPT Due Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(50010; "MSPT Remaining Amount"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50011; "MSPT Cust. Led. Entry No."; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(50012; "MSPT Line Code"; Code[10])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "MSPT Dtld. Entry No.")
        {
        }
        key(Key2; "MSPT Cust. Led. Entry No.", "Posting Date")
        {
            SumIndexFields = "MSPT Amount";
        }
        key(Key3; "MSPT Cust. Led. Entry No.", "Entry Type", "Posting Date")
        {
            SumIndexFields = "MSPT Amount", "MSPT Credit Value", "MSPT Debit Value";
        }
        key(Key4; "Cust. Ledger Entry No.", "Posting Date")
        {
        }
        key(Key5; "Cust. Ledger Entry No.", "Entry Type", "Posting Date")
        {
            MaintainSIFTIndex = false;
            SumIndexFields = Amount, "Amount (LCY)", "Debit Amount", "Credit Amount", "Debit Amount (LCY)", "Credit Amount (LCY)";
        }
        key(Key6; "Customer No.", "Initial Entry Due Date", "Posting Date", "Currency Code")
        {
            SumIndexFields = Amount, "Amount (LCY)", "Debit Amount", "Credit Amount", "Debit Amount (LCY)", "Credit Amount (LCY)";
        }
        key(Key7; "Customer No.", "Posting Date", "Entry Type", "Currency Code")
        {
            SumIndexFields = Amount, "Amount (LCY)", "Debit Amount", "Debit Amount (LCY)", "Credit Amount", "Credit Amount (LCY)";
        }
        key(Key8; "Customer No.", "Initial Document Type", "Document Type")
        {
            SumIndexFields = Amount, "Amount (LCY)";
        }
        key(Key9; "Document No.", "Document Type", "Posting Date")
        {
        }
        key(Key10; "Initial Document Type", "Customer No.", "Posting Date", "Currency Code", "Entry Type")
        {
            SumIndexFields = Amount, "Amount (LCY)";
        }
        key(Key11; "Customer No.", "Initial Entry Due Date", "Posting Date", "Initial Entry Global Dim. 1", "Initial Entry Global Dim. 2", "Currency Code")
        {
            Enabled = false;
            SumIndexFields = Amount, "Amount (LCY)", "Debit Amount", "Credit Amount", "Debit Amount (LCY)", "Credit Amount (LCY)";
        }
        key(Key12; "Customer No.", "Posting Date", "Entry Type", "Initial Entry Global Dim. 1", "Initial Entry Global Dim. 2", "Currency Code")
        {
            Enabled = false;
            SumIndexFields = Amount, "Amount (LCY)";
        }
        key(Key13; "Customer No.", "Initial Document Type", "Document Type", "Initial Entry Global Dim. 1", "Initial Entry Global Dim. 2")
        {
            Enabled = false;
            SumIndexFields = Amount, "Amount (LCY)";
        }
        key(Key14; "Initial Document Type", "Customer No.", "Posting Date", "Currency Code", "Entry Type", "Initial Entry Global Dim. 1", "Initial Entry Global Dim. 2")
        {
            Enabled = false;
            SumIndexFields = Amount, "Amount (LCY)";
        }
        key(Key15; "Customer No.", "MSPT Due Date")
        {
            SumIndexFields = "MSPT Amount";
        }
        key(Key16; "Customer No.", "MSPT Due Date", "Posting Date")
        {
            SumIndexFields = "MSPT Amount";
        }
    }

    fieldgroups
    {
    }
}

