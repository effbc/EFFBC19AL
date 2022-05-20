table 14125603 "Customer Specification"
{
    // version B2BQTO

    Caption = 'Customer Specification';

    fields
    {
        field(1;"No.";Integer)
        {
        }
        field(2;Description;Text[250])
        {
        }
        field(3;"Customer No.";Code[20])
        {
        }
        field(4;"Lookup Code";Code[20])
        {
            Caption = 'Lookup Code';
        }
        field(5;"Lookup Type ID";Integer)
        {
            Caption = 'Lookup Type ID';
            TableRelation = "Quote LookUp Type".ID;
        }
        field(6;"Lookup Type Name";Code[50])
        {
            CalcFormula = Lookup("Quote LookUp Type".Name WHERE (ID=FIELD("Lookup Type ID")));
            Caption = 'Lookup Type Name';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"No.","Customer No.")
        {
        }
    }

    fieldgroups
    {
    }
}

