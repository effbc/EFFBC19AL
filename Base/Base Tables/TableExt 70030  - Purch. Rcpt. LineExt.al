tableextension 70030 PurchRcptLineExt extends "Purch. Rcpt. Line"
{
   
    fields
    {

      
        modify("No.")
        {


            CaptionClass = GetCaptionClass(FieldNo("No."));
        }

     
        field(60001; "Indent No."; Code[20])
        {
            Description = 'B2B';
            Editable = false;
        }
        field(60002; "Indent Line No."; Integer)
        {
            Description = 'B2B';
            Editable = false;
        }
        field(60003; Remarks; Text[250])
        {
            Description = 'B2B';
        }
        field(60007; "Delivery Rating"; Decimal)
        {
            Description = 'POAU';
        }
        field(60008; "Document date"; Date)
        {
            CalcFormula = Lookup("Purch. Rcpt. Header"."Posting Date" WHERE("No." = FIELD("Document No.")));
            FieldClass = FlowField;
        }
        field(60009; "Store Remarks"; Text[250])
        {
        }
        field(60013; Sample; Boolean)
        {
            Editable = true;
        }
        field(60014; Make; Code[30])
        {
            TableRelation = Make;
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
        field(60092; "QC Passed"; Boolean)
        {
            Description = 'added  by sujani for QC Passed confirmation to Bill Transfer';
            Editable = false;
        }
        field(70005; "Part Number"; Code[30])
        {
        }
        field(33000250; "Spec ID"; Code[20])
        {
            TableRelation = "Specification Header";
        }
        field(33000251; "Quantity Accepted"; Decimal)
        {

            trigger OnValidate();
            begin
                if ("Quantity Accepted" + "Quantity Rework") > Quantity then
                    Error('Sum of the Quantity accepted and rejected should not be more than Receipt Quantity');
            end;
        }
        field(33000252; "Quantity Rework"; Decimal)
        {

            trigger OnValidate();
            begin
                Validate("Quantity Accepted");
            end;
        }
        field(33000253; "QC Enabled"; Boolean)
        {
        }
        field(33000254; "Quantity Rejected"; Decimal)
        {
        }
        field(33000255; "Quality Before Receipt"; Boolean)
        {
        }
        field(33000259; "Spec Version"; Code[20])
        {
            TableRelation = "Specification Version"."Version Code" WHERE("Specification No." = FIELD("Spec ID"));
        }
    }
  

    var
        USER: Record User;
        Body: Text[250];
        Mail_From: Text[250];
        Mail_To: Text[250];
        Mail: Codeunit Mail;
        Subject: Text[250];
        TDSNatureofDeduction: Record "TDS Nature of Deduction";
}

