tableextension 70034 PurchCrMemoLineExt extends "Purch. Cr. Memo Line"
{


    fields
    {



        modify("No.")
        {



            CaptionClass = GetCaptionClass(FieldNo("No."));
        }


        modify("Direct Unit Cost")
        {
            CaptionClass = GetCaptionClass(FieldNo("Direct Unit Cost"));
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

