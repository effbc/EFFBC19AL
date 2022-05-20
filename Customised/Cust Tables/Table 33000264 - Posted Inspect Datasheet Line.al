table 33000264 "Posted Inspect Datasheet Line"
{
    // version QC1.0,Cal1.0

    // B2B 10sep2007
    // added a field "Rework Reason Code"

    DrillDownPageID = "PostedInspec DataSheet Subform";

    fields
    {
        field(1;"Document No.";Code[20])
        {
            NotBlank = true;
            TableRelation = "Posted Inspect DatasheetHeader";
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
        field(9;"Actual Value (Num)";Decimal)
        {
            BlankZero = false;
            DecimalPlaces = 0:5;

            trigger OnValidate();
            begin
                /*IF ("Normal Value (Num)" = 0) AND ("Min. Value (Num)" = 0) AND ("Max. Value (Num)" = 0)  THEN
                  ERROR('You Can''t define Actual Numeric Value')
                ELSE BEGIN
                  IF ("Normal Value (Text)" = '') AND ("Min. Value (Text)" = '') AND ("Max. Value (Text)" = '') THEN
                    IF ("Actual Value (Num)" <= "Max. Value (Num)") AND ("Actual Value (Num)" >= "Min. Value (Num)") THEN
                      Accept := TRUE
                    ELSE
                      Accept := FALSE;
                END;
                 */

            end;
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
        field(13;"Actual  Value (Text)";Code[20])
        {
        }
        field(14;"Unit Of Measure Code";Code[20])
        {
            TableRelation = "Unit of Measure";
        }
        field(15;"Character Group No.";Integer)
        {
        }
        field(16;Accept;Boolean)
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
        field(29;"Reason Code";Code[20])
        {
            TableRelation = "Quality Reason Code";
        }
        field(30;Remarks;Text[50])
        {
        }
        field(31;"Inspection Persons";Text[100])
        {
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
        field(60001;"Actul Time(In Hours)";Decimal)
        {
            Description = 'B2B1.0-ESPLQC';
        }
        field(60002;"Time Taken(In Hours)";Decimal)
        {
            Description = 'B2B1.0-ESPLQC';
        }
        field(60003;"Rework Reason Code";Code[20])
        {
            Description = 'B2B1.0-ESPLQC';
            TableRelation = "Quality Reason Code";
        }
        field(60005;"Serial No.";Text[250])
        {
        }
        field(60100;"IDS No.";Code[20])
        {
            Description = 'B2B1.0-ESPLQC';
        }
        field(60101;"IDS Line No.";Integer)
        {
            Description = 'B2B1.0-ESPLQC';
        }
        field(60103;"Item No.";Code[20])
        {
            TableRelation = Item;
        }
    }

    keys
    {
        key(Key1;"Document No.","Line No.","Item No.")
        {
            SumIndexFields = "Actul Time(In Hours)","Time Taken(In Hours)";
        }
        key(Key2;"Character Code","Character Group No.")
        {
        }
        key(Key3;"Document No.","Character Code","Character Group No.",Accept)
        {
            SumIndexFields = "Min. Value (Num)";
        }
    }

    fieldgroups
    {
    }
}

