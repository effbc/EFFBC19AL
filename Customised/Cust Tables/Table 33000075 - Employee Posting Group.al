table 33000075 "Employee Posting Group"
{
    // version NEOGYNPAY13.70.00.09

    Caption = 'Employee Posting Group';
    DrillDownPageID = 33000168;
    LookupPageID = 33000168;
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
            DataClassification = CustomerContent;
        }
        field(2; Description; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(3; "Salary Payable Acct"; Code[20])
        {
            TableRelation = "G/L Account";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                CheckGLAcc("Salary Payable Acct", false, false);
            end;
        }
        field(4; "Part Of Salary Payable Acct"; Code[20])
        {
            TableRelation = "G/L Account";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                CheckGLAcc("Part Of Salary Payable Acct", false, false);
            end;
        }
        field(5; "Reimbursement Salary Acct"; Code[20])
        {
            TableRelation = "G/L Account";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                CheckGLAcc("Reimbursement Salary Acct", false, false);
            end;
        }
        field(6; "PF Payable Acct"; Code[20])
        {
            Description = 'Maintaining PF Account at the time of PF';
            TableRelation = "G/L Account";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                CheckGLAcc("PF Payable Acct", false, false);
            end;
        }
        field(7; "TDS Payable Acct"; Code[20])
        {
            TableRelation = "G/L Account";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                CheckGLAcc("TDS Payable Acct", false, false);
            end;
        }
        field(8; "ESI Payable Acct"; Code[20])
        {
            TableRelation = "G/L Account";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                CheckGLAcc("ESI Payable Acct", false, false);
            end;
        }
        field(9; "Loan Refundable Acct"; Code[20])
        {
            TableRelation = "G/L Account";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                CheckGLAcc("Loan Refundable Acct", false, false);
            end;
        }
        field(10; "PF Admin Charge"; Code[20])
        {
            Caption = 'PF Admin Charge';
            Description = 'Maintaining Admin Charges Account at the time of PF';
            TableRelation = "G/L Account";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                CheckGLAcc("PF Admin Charge", false, false);
            end;
        }
        field(50000; "EPS Payable"; Code[20])
        {
            Caption = 'EPS Payable';
            Description = 'Maintaining EPS Account at the time of PF';
            TableRelation = "G/L Account";
            DataClassification = CustomerContent;
        }
        field(50001; "EDLI Payable"; Code[20])
        {
            Caption = 'EDLI Payable';
            Description = 'Maintaining EDLI Account at the time of PF';
            TableRelation = "G/L Account";
            DataClassification = CustomerContent;
        }
        field(50002; "PF Insp. Charge Payable"; Code[20])
        {
            Caption = 'PF Insp. Charge Payable';
            Description = 'Maintaining Inspection Charges Account at the time of PF';
            TableRelation = "G/L Account";
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
        }
    }

    fieldgroups
    {
    }


    local procedure CheckGLAcc(AccNo: Code[20]; CheckProdPostingGroup: Boolean; CheckDirectPosting: Boolean);
    var
        GLAcc: Record "G/L Account";
    begin
        if AccNo <> '' then begin
            GLAcc.Get(AccNo);
            GLAcc.CheckGLAcc;
        end;
    end;
}

