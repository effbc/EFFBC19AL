table 33000270 "Inspection Receipt Line"
{
    // version QC1.0,Cal1.0

    // B2B 10sep2007
    // added a field "Rework Reason Code"


    fields
    {
        field(1;"Document No.";Code[20])
        {
            NotBlank = true;
            TableRelation = "Inspection Receipt Header";
        }
        field(2;"Line No.";Integer)
        {
        }
        field(3;"Character Code";Code[20])
        {
            TableRelation = Characteristic.Code;
        }
        field(4;Description;Text[50])
        {
        }
        field(5;"Sampling Plan Code";Code[20])
        {
            TableRelation = "Sampling Plan Header".Code;
        }
        field(6;"Normal Value (Num)";Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0:5;
        }
        field(7;"Min. Value (Num)";Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0:5;
        }
        field(8;"Max. Value (Num)";Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0:5;
        }
        field(10;"Normal Value (Text)";Code[20])
        {
        }
        field(11;"Min. Value (Text)";Code[20])
        {
        }
        field(12;"Max. Value (Text)";Code[20])
        {
        }
        field(14;"Unit Of Measure Code";Code[20])
        {
            TableRelation = "Unit of Measure";
        }
        field(15;"Character Group No.";Integer)
        {
        }
        field(17;"Lot Size - Min";Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0:0;
            MinValue = 0;
        }
        field(18;"Lot Size - Max";Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0:0;
            MinValue = 0;
        }
        field(19;"Sampling Size";Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0:0;
            MinValue = 0;
        }
        field(20;"Allowable Defects - Min";Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0:0;
            MinValue = 0;
        }
        field(21;"Allowable Defects - Max";Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0:0;
            MinValue = 0;
        }
        field(22;"Receipt No.";Code[20])
        {
            TableRelation = "Purch. Rcpt. Header";
        }
        field(23;"Posting Date";Date)
        {
        }
        field(24;"Item No.";Code[20])
        {
        }
        field(25;"Accepted Qty";Integer)
        {
            CalcFormula = Count("Posted Inspect Datasheet Line" WHERE ("Document No."=FIELD("Posted Inspect Doc. No."),
                                                                       "Character Code"=FIELD("Character Code"),
                                                                       "Character Group No."=FIELD("Character Group No."),
                                                                       Accept=CONST(true)));
            FieldClass = FlowField;
        }
        field(26;"Rejected Qty";Integer)
        {
            CalcFormula = Count("Posted Inspect Datasheet Line" WHERE ("Document No."=FIELD("Posted Inspect Doc. No."),
                                                                       "Character Code"=FIELD("Character Code"),
                                                                       "Character Group No."=FIELD("Character Group No."),
                                                                       Accept=CONST(false)));
            FieldClass = FlowField;
        }
        field(27;"Total Qty";Integer)
        {
            CalcFormula = Count("Posted Inspect Datasheet Line" WHERE ("Document No."=FIELD("Posted Inspect Doc. No."),
                                                                       "Character Code"=FIELD("Character Code"),
                                                                       "Character Group No."=FIELD("Character Group No.")));
            FieldClass = FlowField;
        }
        field(28;"Purch Line No.";Integer)
        {
        }
        field(29;"Reason Code";Code[20])
        {
            TableRelation = "Quality Reason Code";
        }
        field(30;Remarks;Text[50])
        {
        }
        field(31;"Inspection Persons";Code[20])
        {
            TableRelation = "Machine Center"."No.";
        }
        field(32;Accept;Boolean)
        {
        }
        field(33;"Vendor No.";Code[20])
        {
        }
        field(34;"Posted Inspect Doc. No.";Code[20])
        {
            TableRelation = "Posted Inspect DatasheetHeader";
        }
        field(35;"Character Type";Option)
        {
            OptionCaption = 'Standard,Heading,Begin,End';
            OptionMembers = Standard,Heading,"Begin","End";
        }
        field(36;Indentation;Integer)
        {
        }
        field(37;Qualitative;Boolean)
        {
        }
        field(60003;"Rework Reason Code";Code[20])
        {
            Description = 'B2B1.0-ESPLQC';
            Editable = false;
            TableRelation = "Quality Reason Code";
        }
        field(60100;"IDS No.";Code[20])
        {
            Description = 'B2B1.0-ESPLQC';
        }
        field(60101;"IDS Line No.";Integer)
        {
            Description = 'B2B1.0-ESPLQC';
        }
    }

    keys
    {
        key(Key1;"Document No.","Line No.")
        {
        }
        key(Key2;"Character Code","Character Group No.")
        {
        }
        key(Key3;"Vendor No.","Item No.","Character Code")
        {
        }
        key(Key4;"Receipt No.","Item No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnModify();
    begin
        InspectReceiptHeader.SetRange("No.","Document No.");
        InspectReceiptHeader."Data Entered By" := UserId;
    end;

    var
        InspectReceiptHeader : Record "Inspection Receipt Header";
}

