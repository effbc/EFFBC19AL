table 33000020 "Pay Salary Payment Line"
{
    // version NEOGYNPAY13.70.00.06

    Caption = 'Salary Payment Entry';
    DrillDownPageID = 33000031;
    LookupPageID = 33000031;
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Salary Entry Doc.No."; Code[10])
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(3; "Line No."; Integer)
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(5; "Salary Entry Date"; Date)
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(6; "Employee No."; Code[20])
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(7; "Employee Name"; Text[30])
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(8; "Balance Amount"; Decimal)
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(10; "Payment Indicator"; Option)
        {
            Editable = false;
            OptionMembers = " ",Include,Exclude,Reimbursement;
            DataClassification = CustomerContent;
        }
        field(12; "Payment date"; Date)
        {
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if "Payment date" > WorkDate then Error(Text001);
            end;
        }
        field(14; "Cheque No."; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(16; "Cheque Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(18; Amount; Decimal)
        {
            MinValue = 0;
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if (Amount > "Balance Amount") then Error(Text000);
            end;
        }
        field(20; "Payment Entry Doc. No."; Code[20])
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(22; Posted; Boolean)
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(24; "Department Code"; Code[20])
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(26; Grade; Code[10])
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(28; Branch; Code[20])
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(30; "Template Name"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(31; "Batch Name"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(32; "Salary Stopped"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(35; "Location Code"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(36; "Job Title Code"; Code[20])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Salary Entry Doc.No.", "Salary Entry Date", "Employee No.", "Line No.")
        {
        }
        key(Key2; "Salary Entry Date", "Employee No.", "Payment Indicator", Posted)
        {
            SumIndexFields = Amount;
        }
        key(Key3; "Payment Entry Doc. No.", "Payment date")
        {
        }
        key(Key4; "Line No.")
        {
        }
        key(Key5; "Payment Indicator", Posted, "Department Code", Grade, Branch)
        {
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }

    var
        Text000: Label 'Amount Cannot be greater than Balance Amount.';
        Text001: Label 'Payment Date Cannot be Greater Than WorkDate.';
}

