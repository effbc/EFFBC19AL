table 33000048 "Pay Journal Template"
{
    // version NEOGYNPAY13.70.00.06

    Caption = 'Pay Journal Template';
    DrillDownPageID = "Job Journal Template List";
    LookupPageID = 33000095;
    DataClassification = CustomerContent;

    fields
    {
        field(1; Name; Code[10])
        {
            Caption = 'Name';
            NotBlank = true;
            DataClassification = CustomerContent;
        }
        field(2; Description; Text[80])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(5; "Test Report ID"; Integer)
        {
            Caption = 'Test Report ID';
            TableRelation = Object.ID WHERE(Type = CONST(Report));
            DataClassification = CustomerContent;
        }
        field(6; "Form ID"; Integer)
        {
            Caption = 'Form ID';
            TableRelation = Object.ID WHERE(Type = CONST(Page));
            DataClassification = CustomerContent;
        }
        field(7; "Posting Report ID"; Integer)
        {
            Caption = 'Posting Report ID';
            TableRelation = Object.ID WHERE(Type = CONST(Report));
            DataClassification = CustomerContent;
        }
        field(8; "Force Posting Report"; Boolean)
        {
            Caption = 'Force Posting Report';
            DataClassification = CustomerContent;
        }
        field(10; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            TableRelation = "Source Code";
            DataClassification = CustomerContent;
        }
        field(11; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            TableRelation = "Reason Code";
            DataClassification = CustomerContent;
        }
        field(12; Recurring; Boolean)
        {
            Caption = 'Recurring';
            DataClassification = CustomerContent;
        }
        field(13; "Test Report Name"; Text[30])
        {
            CalcFormula = Lookup(Object.Name WHERE(Type = CONST(Report),
                                                    ID = FIELD("Test Report ID")));
            Caption = 'Test Report Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(14; "Form Name"; Text[30])
        {
            CalcFormula = Lookup(Object.Name WHERE(Type = CONST(Page),
                                                    ID = FIELD("Form ID")));
            Caption = 'Form Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(15; "Posting Report Name"; Text[30])
        {
            CalcFormula = Lookup(Object.Name WHERE(Type = CONST(Report),
                                                    ID = FIELD("Posting Report ID")));
            Caption = 'Posting Report Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(16; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(17; "Posting No. Series"; Code[10])
        {
            Caption = 'Posting No. Series';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if ("Posting No. Series" = "No. Series") and ("Posting No. Series" <> '') then
                    FieldError("Posting No. Series", StrSubstNo(Text001, "Posting No. Series"));
            end;
        }
    }

    keys
    {
        key(Key1; Name)
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        PayJnlLine.SetRange("Pay Journal Template", Name);
        PayJnlLine.DeleteAll(true);
        PayJnlBatch.SetRange("Pay Journal Template", Name);
        PayJnlBatch.DeleteAll(true);
    end;

    trigger OnInsert();
    begin
        Validate("Form ID");
    end;

    var
        Text000: Label 'Only the %1 field can be filled in on recurring journals.';
        Text001: Label 'must not be %1';
        JobJnlBatch: Record "Job Journal Batch";
        JobJnlLine: Record "Job Journal Line";
        SourceCodeSetup: Record "Source Code Setup";
        PayJnlBatch: Record "Pay Gen. Journal Batch";
        PayJnlLine: Record "Pay General Journal Line";
}

