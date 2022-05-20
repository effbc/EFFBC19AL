table 33000256 "Inspection Datasheet Line"
{
    // version QC1.0,Cal1.0

    // B2B 10sep2007
    // added a field "Rework Reason Code"

    DrillDownPageID = "Inspection Data Sheet Subform";

    fields
    {
        field(1;"Document No.";Code[20])
        {
            NotBlank = true;
            TableRelation = "Inspection Datasheet Header"."No.";
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

            trigger OnLookup();
            begin
                TestField("Character Type","Character Type" :: Standard);
                TestField(Qualitative,false);
            end;

            trigger OnValidate();
            begin
                TestField("Character Type","Character Type" :: Standard);
                TestField(Qualitative,false);
                if ("Normal Value (Text)" = '') and ("Min. Value (Text)" = '') and ("Max. Value (Text)" = '') then
                  if ("Actual Value (Num)" <= "Max. Value (Num)") and ("Actual Value (Num)" >= "Min. Value (Num)") then
                    Accept := true
                  else
                    Accept := true;//ANIL 9-03-2009
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

            trigger OnValidate();
            begin
                TestField("Character Type","Character Type" :: Standard);
                TestField(Qualitative,true);
            end;
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

            trigger OnValidate();
            begin
                TestField("Character Type","Character Type" :: Standard);
            end;
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
        field(31;"Inspection Persons";Code[20])
        {
            TableRelation = "Machine Center"."No.";
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
        field(60001;"Bench Mark Time(In Min.)";Decimal)
        {
            Caption = 'Bench Mark Time(In Min.)';
            Description = 'B2B1.0-ESPLQC';
        }
        field(60002;"Time Taken(In Min.)";Decimal)
        {
            Caption = 'Time Taken(In Min.)';
            Description = 'B2B1.0-ESPLQC';
        }
        field(60003;"Rework Reason Code";Code[20])
        {
            Description = 'B2B1.0-ESPLQC';
            Editable = false;
            TableRelation = "Quality Reason Code";
        }
        field(60004;"Item No.";Code[20])
        {
            TableRelation = Item;
        }
        field(60005;"Serial No.";Text[250])
        {
        }
    }

    keys
    {
        key(Key1;"Document No.","Line No.")
        {
            SumIndexFields = "Bench Mark Time(In Min.)","Time Taken(In Min.)";
        }
        key(Key2;"Character Code","Character Group No.")
        {
        }
        key(Key3;"Document No.","Character Code","Character Group No.",Accept)
        {
            SumIndexFields = "Min. Value (Num)";
        }
        key(Key4;"Character Group No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnModify();
    begin
        TestStatusOpen;
        InspectDatasheetHeader.Modify(true);
    end;

    var
        InspectDatasheetHeader : Record "Inspection Datasheet Header";

    [LineStart(7538)]
    procedure TestStatusOpen();
    begin
        InspectDatasheetHeader.SetRange("No.","Document No.");
        InspectDatasheetHeader.Find('-');
        if InspectDatasheetHeader.Status = InspectDatasheetHeader.Status :: Released then
          InspectDatasheetHeader.TestField(Status,InspectDatasheetHeader.Status::Open);
    end;
}

