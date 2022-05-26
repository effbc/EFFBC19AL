tableextension 70100 ServiceItemExt extends "Service Item"
{

    fields
    {

        modify("No.")
        {
            trigger OnAfterValidate()
            begin
                "Creation Date" := Today;
            end;
        }
        field(60001; Territory; Code[20])
        {
            Description = 'B2B';
            Editable = false;
            TableRelation = Territory.Code;
        }
        field(60002; "Installed Location"; Text[70])
        {
            Description = 'B2B';
            Editable = false;
        }
        field(60003; "Installation Status"; Text[30])
        {
            Description = 'B2B';
            Editable = false;
        }
        field(60004; "Datalogger Version"; Code[20])
        {
            Description = 'B2B';
            Editable = false;
        }
        field(60005; Position; Code[20])
        {
            Description = 'B2B';
            Editable = false;
        }
        field(60006; "Software Version"; Code[20])
        {
            Description = 'B2B';
            Editable = false;
            TableRelation = CFormlist.Year;
        }
        field(60007; "Power Supply"; Enum PowerSupply)
        {
            Description = 'B2B';
            Editable = false;

        }
        field(60008; "Batch No."; Code[20])
        {
            Description = 'B2B';
        }
        field(60009; "Job No."; Code[20])
        {
            Description = 'B2B';
            Editable = false;
            TableRelation = Job."No.";
        }
        field(60010; "Job Installation Date"; Date)
        {
            Description = 'B2B';
            Editable = false;
        }
        field(60011; "Software Code"; Code[20])
        {
            Description = 'B2B';
            Editable = false;
            TableRelation = CFormlist.vendor;
        }
        field(60012; "SO No."; Code[20])
        {
            Description = 'B2B';
            Editable = false;
            TableRelation = "Sales Header"."No.";
        }
        field(60013; "SO Line No."; Integer)
        {
            Description = 'B2B';
            Editable = false;
            TableRelation = "Sales Line"."Line No." WHERE("Document No." = FIELD("SO No."));
        }
        field(60030; "Countrol Section"; Code[10])
        {
        }
        field(60031; "N/W Stand Alone"; Enum "NetWork Stand Alone")
        {

        }
        field(60032; IDNO; Code[10])
        {
        }
        field(60033; "F/W Version"; Code[10])
        {
        }
        field(60034; "S/W Version"; Text[30])
        {
        }
        field(60035; "H/W Process Type"; Text[30])
        {
        }
        field(60036; "Operating Voltage"; Enum "Operating Voltage")
        {

        }
        field(60037; "Supply Giving From"; Text[30])
        {
        }
        field(60038; "Earth Status"; Enum "Earth Status")
        {

        }
        field(60039; "Communication Media"; Enum "Communication Media")
        {

        }
        field(60040; "Warr/AMC/None"; Enum "Warr AMC None")
        {

        }
        field(60041; Zone; Code[10])
        {
            TableRelation = Zone;
        }
        field(60042; Division; Code[10])
        {
            //TableRelation = Table50012.Field1 WHERE(Field2 = FIELD(Zone));
        }
        field(60043; Station; Code[20])
        {
            //TableRelation = Table50013.Field1 WHERE(Field2 = FIELD(Division));
        }
        field(60044; "Creation Date"; Date)
        {
        }
        field(60045; ITLSNO; Integer)
        {
            TableRelation = "Item Ledger Entry"."Entry No." WHERE("Item No." = FIELD("Item No."),
                                                                   "Variant Code" = FIELD("Variant Code"),
                                                                   "Serial No." = FIELD("Serial No."));

            trigger OnValidate();
            begin
                ITEMLEDGER.SetFilter(ITEMLEDGER."Entry No.", Format(ITLSNO));
                // MESSAGE(FORMAT(ITEMLEDGER.COUNT));
                if ITEMLEDGER.Find('-') then
                    repeat
                        "Serial No." := ITEMLEDGER."Serial No.";
                    until ITEMLEDGER.Next = 0;
                // MESSAGE(FORMAT(ITEMLEDGER."Serial No."));
            end;
        }
        field(60046; "AMC Order NO"; Code[30])
        {
            TableRelation = "Service Contract Header"."Contract No.";
        }
        field(60047; "Present Location"; Code[80])
        {
            Editable = true;
        }
        field(60048; Valid; Boolean)
        {
        }
        field(60049; "WORKING STATUS"; Enum WORKINGSTATUS)
        {

        }
        field(60050; "Changed Location"; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('LOCATIONS'));
        }
        field(60051; "ove to Non Moving Location"; Boolean)
        {
        }
        field(60052; "Get From Non-Moving Location"; Enum "Get From Non-MovingLocation")
        {

        }
    }
    keys
    {
        /* key(Key7; "Present Location","Item No.","WORKING STATUS")
        {

        } */
    }

    var
        ITEMLEDGER: Record "Item Ledger Entry";

    PROCEDURE "--B2B--"();
    BEGIN
    END;


    PROCEDURE Attachments();
    VAR
        Attachments: Record Attachments;
    BEGIN
        Attachments.Reset;
        Attachments.SetRange("Table ID", DATABASE::"Service Item");
        Attachments.SetRange("Document No.", "No.");
        //Attachments.SETRANGE("Document Type","Document Type");

        PAGE.Run(PAGE::"ESPL Attachments", Attachments);
    END;
}

