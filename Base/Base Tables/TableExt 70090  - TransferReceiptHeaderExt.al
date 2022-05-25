tableextension 70090 TransferReceiptHeaderExt extends "Transfer Receipt Header"
{
    fields
    {
        field(60001; "Prod. Order No."; Code[20])
        {
            Description = 'B2B';
            TableRelation = "Production Order"."No." WHERE(Status = CONST(Released));
        }
        field(60002; "Prod. Order Line No."; Integer)
        {
            Description = 'B2B';
            TableRelation = "Prod. Order Line"."Line No." WHERE("Prod. Order No." = FIELD("Prod. Order No."),
                                                                 Status = CONST(Released));
        }
        field(60003; "Service Item No."; Code[20])
        {
            Description = 'B2B';
            TableRelation = "Service Item"."No.";
        }
        field(60004; "Customer No."; Code[20])
        {
            Description = 'B2B';
            TableRelation = Customer."No.";
        }
        field(60005; "Prod. BOM No."; Code[20])
        {
            Description = 'B2B';

            trigger OnLookup();
            var
                ProductionOrderLine: Record "Prod. Order Line";
                ProductionBOMHeader: Record "Production BOM Header";
            begin
            end;
        }
        field(60006; "Machine Center No."; Code[20])
        {
            Description = 'B2B';
            TableRelation = "Machine Center"."No.";
        }
        field(60007; "User ID"; Code[50])
        {
            Description = 'Rev01';
            Editable = false;
            TableRelation = User."User Name";
        }
        field(60008; "Required Date"; Date)
        {
            Description = 'B2B';
        }
        field(60009; "Operation No."; Code[20])
        {
            Description = 'B2B';

            trigger OnLookup();
            var
                ProductionOrderLine: Record "Prod. Order Line";
            begin
            end;
        }
        field(60010; "Due Date"; Date)
        {
        }
        field(60011; "Released Date"; Date)
        {
            Description = 'B2B';
            Editable = false;
        }
        field(60012; "Released By"; Code[50])
        {
            Description = 'Rev01';
            Editable = false;
            TableRelation = User."User Name";
        }
        field(60013; "Sales Order No."; Code[20])
        {
            Description = 'B2B';
            Editable = false;
            TableRelation = "Sales Header"."No." WHERE("Document Type" = FILTER(Order),
                                                        Status = FILTER(Released));
        }
        field(60014; "Service Order No."; Code[20])
        {
            Description = 'B2B';
            TableRelation = "Service Header"."No.";
        }
        field(60015; "Resource Name"; Text[50])
        {
            Description = 'B2B';
            Editable = false;

            trigger OnValidate();
            begin
                /*
                IF FORM.RUNMODAL(5201,Employee) = ACTION::LookupOK THEN
                  "Resource Name" := Employee."First Name";
                */

            end;
        }
        field(60090; "Dimension Corrected"; Boolean)
        {
            Description = 'added  by sujani for Dimension issue clearance (B2B Assistance)';
            Editable = false;
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
    }

}

