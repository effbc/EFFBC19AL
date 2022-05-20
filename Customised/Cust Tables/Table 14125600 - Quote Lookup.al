table 14125600 "Quote Lookup"
{
    // version B2BQTO

    DrillDownPageID = "Quote LookUp List";
    LookupPageID = "Quote LookUp List";

    fields
    {
        field(2;"Lookup Code";Code[20])
        {
            Caption = 'Lookup Code';

            trigger OnValidate();
            begin
                if "System Defined" then
                 Error(Text000);
            end;
        }
        field(3;"Lookup Type ID";Integer)
        {
            Caption = 'Lookup Type ID';
            TableRelation = "Quote LookUp Type".ID;
        }
        field(4;Description;Text[250])
        {
            Caption = 'Description';
        }
        field(6;"Lookup Type Name";Code[50])
        {
            CalcFormula = Lookup("Quote LookUp Type".Name WHERE (ID=FIELD("Lookup Type ID")));
            Caption = 'Lookup Type Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(8;"System Defined";Boolean)
        {
            Caption = 'System Defined';
        }
        field(9;Select;Boolean)
        {
        }
        field(10;FieldNo1;Decimal)
        {
        }
        field(11;FieldNo2;Decimal)
        {
        }
        field(12;FieldNo3;Decimal)
        {
        }
        field(13;FieldNo4;Decimal)
        {
        }
        field(14;FieldNo5;Decimal)
        {
        }
        field(15;FieldNo6;Decimal)
        {
        }
        field(16;Qty;Decimal)
        {
        }
        field(17;Rate;Decimal)
        {
        }
        field(18;Amount;Decimal)
        {
        }
        field(19;Remarks;Text[250])
        {
        }
        field(20;"Terms LookUp";Option)
        {
            OptionCaption = '" ,Others,Financial"';
            OptionMembers = " ",Others,Financial;
        }
        field(21;"Schedule LookUp";Option)
        {
            OptionCaption = '" ,Supply items,Installation"';
            OptionMembers = " ","Supply items",Installation;
        }
    }

    keys
    {
        key(Key1;"Lookup Type ID","Lookup Code")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        if "System Defined" then
         Error(Text000);
    end;

    trigger OnRename();
    begin
        if "System Defined" then
         Error(Text000);
    end;

    var
        Text000 : Label 'You cannot modify/delete the system defined record';
}

