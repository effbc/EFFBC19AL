table 14125604 "Sales Quote Specification"
{
    // version B2BQTO


    fields
    {
        field(1;"No.";Integer)
        {
        }
        field(2;Description;Text[250])
        {
        }
        field(3;"Sales Quote No.";Code[20])
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
        key(Key1;"No.","Sales Quote No.")
        {
        }
    }

    fieldgroups
    {
    }
}

