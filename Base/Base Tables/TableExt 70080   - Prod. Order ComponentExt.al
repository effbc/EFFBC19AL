tableextension 70080 ProdOrderComponentExt extends "Prod. Order Component"
{
    fields
    {
      
      field(50001; "Qty. in Material Issues"; Decimal)
        {
            CalcFormula = Sum("Material Issues Line"."Qty. to Receive" WHERE("Prod. Order No." = FIELD("Prod. Order No."),
                                                                              "Prod. Order Line No." = FIELD("Prod. Order Line No."),
                                                                              "Prod. Order Comp. Line No." = FIELD("Line No.")));
            Description = 'MI1.0';
            FieldClass = FlowField;
        }
        field(50002; "Qty. in Posted Material Issues"; Decimal)
        {
            CalcFormula = Sum("Posted Material Issues Line".Quantity WHERE("Prod. Order No." = FIELD("Prod. Order No."),
                                                                            "Prod. Order Line No." = FIELD("Prod. Order Line No."),
                                                                            "Item No." = FIELD("Item No.")));
            Description = 'MI1.0';
            FieldClass = FlowField;
        }
        field(60001; "Position 4"; Code[250])
        {
            Description = 'B2B';
        }
        field(60002; "Source No."; Code[20])
        {
            Description = 'B2B';
            Editable = false;
        }
        field(60003; "BOM Type"; Option)
        {
            Description = 'B2B';
            Editable = false;
            OptionCaption = '" ,Mechanical,Wiring,Testing,Packing"';
            OptionMembers = " ",Mechanical,Wiring,Testing,Packing;
        }
        field(60006; "Type of Solder"; Option)
        {
            Description = 'B2B';
            Editable = true;
            OptionMembers = " ",SMD,DIP;
        }
        field(60007; "Production Plan Date"; Date)
        {
            FieldClass = Normal;

            trigger OnValidate();
            begin
                /*
                //B2B1.0 Start
                MESSAGE('HI2');
                IF "Material Required Day" = 0 THEN
                  "Material Requisition Date" := 0D
                ELSE IF "Material Required Day" = 1 THEN
                  "Material Requisition Date" :=  "Production Plan Date"
                ELSE
                  "Material Requisition Date" := CALCDATE(FORMAT("Material Required Day" - 1) +'D',"Production Plan Date");
                  MODIFY;
                //B2B1.0 END
                */

            end;
        }
        field(60008; "Material Required Day"; Integer)
        {
        }
        field(60009; "Don't Consider"; Boolean)
        {
        }
        field(60091; "OLD Dim Set ID"; Integer)
        {
            Description = 'added  by sujani for Dimension issue clearance (B2B Assistance)';
            Editable = false;
            TableRelation = "Dimension Set Entry Backup2"."Dimension Set ID" WHERE("Dimension Set ID" = FIELD("OLD Dim Set ID"));

            trigger OnLookup();
            begin
                //ShowDimensionsOLD;
            end;
        }
        field(60092; "Dimension Corrected"; Boolean)
        {
            Description = 'added  by sujani for Dimension issue clearance (B2B Assistance)';
            Editable = false;
        }
        field(60100; Copy1; Boolean)
        {
            Editable = false;
        }
        field(60101; "Qty Copied"; Decimal)
        {
            CalcFormula = Sum("Item Journal Line".Quantity WHERE("ITL Doc No." = FIELD("Prod. Order No."),
                                                                  "ITL Doc Line No." = FIELD("Prod. Order Line No."),
                                                                  "ITL Doc Ref Line No." = FIELD("Line No.")));
            FieldClass = FlowField;
        }
        field(60102; "Qty Posted"; Decimal)
        {
            CalcFormula = Sum("Material Issue Line"."Received Quantity" WHERE("Prod. Order No." = FIELD("Prod. Order No."),
                                                                               "Prod. Order Line No." = FIELD("Prod. Order Line No."),
                                                                               "Prod. Order Comp. Line No." = FIELD("Line No.")));
            FieldClass = FlowField;
        }
        field(60103; "Qty in To"; Decimal)
        {
            CalcFormula = Sum("Transfer Line".Quantity WHERE("Prod. Order No." = FIELD("Prod. Order No."),
                                                              "Prod. Order Line No." = FIELD("Prod. Order Line No."),
                                                              "Prod. Order Comp. Line No." = FIELD("Line No.")));
            FieldClass = FlowField;
        }
        field(60104; "Qty Shipped in To"; Decimal)
        {
            CalcFormula = Sum("Transfer Shipment Line".Quantity WHERE("Prod. Order No." = FIELD("Prod. Order No."),
                                                                       "Prod. Order Line No." = FIELD("Prod. Order Line No."),
                                                                       "Prod. Order Comp. Line No." = FIELD("Line No.")));
            FieldClass = FlowField;
        }
        field(60105; "BOM Qty"; Decimal)
        {
            Description = 'B2B    For Getting The Actual Qty of the BOM';
        }
        field(60106; PCB; Boolean)
        {
        }
        field(60107; "AVG Unit cost"; Decimal)
        {
        }
        field(60108; "Product Group Code"; Code[20])
        {
            CalcFormula = Lookup(Item."Product Group Code" WHERE("No." = FIELD("Item No.")));
            FieldClass = FlowField;
        }
        field(60109; "Type of Solder2"; Text[10])
        {
        }
        field(60111; "Material Requisition Date"; Date)
        {
            Description = 'B2B1.0';
        }
        field(60112; "Operation No."; Code[10])
        {
        }
        field(60113; Dept; Code[10])
        {
        }
    }
    keys
    {

        
        key(Key1; Status, "Prod. Order No.", "Prod. Order Line No.", "Line No.")
        {
        }
        key(Key2; "Prod. Order No.", "Prod. Order Line No.", "Line No.", Status)
        {
        }
        key(Key3; Status, "Prod. Order No.", "Prod. Order Line No.", "Due Date")
        {
            SumIndexFields = "Expected Quantity", "Cost Amount";
        }
        key(Key4; Status, "Prod. Order No.", "Prod. Order Line No.", "Item No.", "Line No.")
        {
            MaintainSQLIndex = false;
        }
        key(Key5; Status, "Item No.", "Variant Code", "Location Code", "Due Date")
        {
            SumIndexFields = "Expected Quantity", "Remaining Qty. (Base)", "Cost Amount", "Overhead Amount";
        }
        key(Key6; "Item No.", "Variant Code", "Location Code", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", "Due Date")
        {
            Enabled = false;
            SumIndexFields = "Expected Quantity", "Remaining Qty. (Base)", "Cost Amount", "Overhead Amount";
        }
        key(Key7; Status, "Prod. Order No.", "Routing Link Code", "Flushing Method")
        {
        }
        key(Key8; Status, "Prod. Order No.", "Location Code")
        {
        }
        key(Key9; "Item No.", "Variant Code", "Location Code", Status, "Due Date")
        {
            MaintainSIFTIndex = false;
            SumIndexFields = "Expected Qty. (Base)", "Remaining Qty. (Base)", "Cost Amount", "Overhead Amount", "Qty. Picked (Base)";
        }
        key(Key10; Status, "Prod. Order No.", "Prod. Order Line No.", "Item Low-Level Code")
        {
            MaintainSQLIndex = false;
        }
        key(Key11; "Supplied-by Line No.")
        {
        }
        key(Key12; "Item No.", "Prod. Order No.", "Prod. Order Line No.", "Line No.", Status)
        {
        }
        key(Key13; "Item No.")
        {
        }
        key(Key14; "Item No.", "Location Code")
        {
        }
        key(Key15; "Prod. Order No.", "Item No.", "Material Required Day")
        {
        }
        key(Key16; "Production Plan Date", "Item No.", "Prod. Order No.")
        {
            SumIndexFields = "Expected Quantity";
        }
    }


    
}

