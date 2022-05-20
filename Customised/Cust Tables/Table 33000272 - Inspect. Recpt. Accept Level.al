table 33000272 "Inspect. Recpt. Accept Level"
{
    // version QC1.1


    fields
    {
        field(1;"Inspection Receipt No.";Code[20])
        {
        }
        field(2;"Line No.";Integer)
        {
        }
        field(3;"Quality Type";Option)
        {
            OptionMembers = Accepted,"Accepted Under Deviation",Rework,Rejected;
        }
        field(4;"Acceptance Code";Code[20])
        {
            TableRelation = "Acceptance Level".Code WHERE (Type=FIELD("Quality Type"));

            trigger OnValidate();
            begin
                AcptLevel.Get("Acceptance Code");
                "Reason Code" := AcptLevel."Reason Code";
            end;
        }
        field(5;"Reason Code";Code[20])
        {
            TableRelation = "Quality Reason Code";
        }
        field(6;Quantity;Decimal)
        {
            DecimalPlaces = 0:5;
        }
        field(7;Type;Option)
        {
            OptionCaption = 'Accepted,Accepted Under Deviation,Rework,Rejected';
            OptionMembers = Accepted,"Accepted Under Deviation",Rework,Rejected;
        }
        field(8;"Item No.";Code[20])
        {
            TableRelation = Item;
        }
        field(9;"Source Type";Option)
        {
            OptionMembers = "In Bound",WIP;
        }
        field(10;"Vendor No.";Code[20])
        {
            TableRelation = Vendor;
        }
        field(11;"Production Order No.";Code[20])
        {
            TableRelation = "Production Order"."No." WHERE (Status=CONST(Released));
        }
        field(12;"Rework Level";Integer)
        {
        }
        field(13;Status;Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Inspection Receipt No.","Quality Type","Line No.")
        {
        }
        key(Key2;"Quality Type",Quantity)
        {
            SumIndexFields = Quantity;
        }
        key(Key3;"Item No.","Vendor No.","Acceptance Code","Quality Type")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        //TestStatus;
    end;

    trigger OnInsert();
    begin
        TestStatus;
        TestField(Quantity);
        TestField("Acceptance Code");
        "Item No." := InspectRcpt."Item No.";
        "Vendor No." := InspectRcpt."Vendor No.";
        "Source Type" := InspectRcpt."Source Type";
        "Production Order No." := InspectRcpt."Prod. Order No.";
        "Rework Level" := InspectRcpt."Rework Level";
    end;

    trigger OnModify();
    begin
        TestStatus;
        TestField(Quantity);
        TestField("Acceptance Code");
    end;

    var
        InspectRcpt : Record "Inspection Receipt Header";
        AcptLevel : Record "Acceptance Level";

    [LineStart(7912)]
    procedure TestStatus();
    begin
        InspectRcpt.Get("Inspection Receipt No.");
        InspectRcpt.TestField(Status,false);
    end;
}

