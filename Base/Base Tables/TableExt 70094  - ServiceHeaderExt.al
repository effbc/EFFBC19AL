tableextension 70094 ServiceHeaderExt extends "Service Header"
{
    fields
    {

        field(60001; "Doc. No. Occurrence"; Integer)
        {
        }
        field(60005; "Version No."; Integer)
        {
        }
        field(60006; "No. of Archived Versions"; Integer)
        {
            CalcFormula = Max("Service Header"."Version No." WHERE("Document Type" = FIELD("Document Type"),
                                                                    "No." = FIELD("No."),
                                                                    "Doc. No. Occurrence" = FIELD("Doc. No. Occurrence")));
            Caption = 'No. of Archived Versions';
            Editable = false;
            FieldClass = FlowField;
        }
        field(60007; Purpose; Enum Purpose)
        {
            
        }
        field(60008; "Material Issue no."; Code[12])
        {
            Editable = false;
        }
        field(60009; "Customer Cards"; Boolean)
        {

            trigger OnValidate();
            begin
                ServItemLine.Reset;
                ServItemLine.SetFilter(ServItemLine."Document No.", "No.");
                ServItemLine.SetFilter(ServItemLine."To Location", '<>%1', '');
                if ServItemLine.FindFirst then begin
                    Error('One or more cards are already Transfered to Other Locations');
                end;
            end;
        }
        field(60010; "Transation ID"; Code[10])
        {
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

    var
    ServItemLine:Record "Service Item Line";
   
}

