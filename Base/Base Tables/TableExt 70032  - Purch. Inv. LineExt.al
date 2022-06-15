tableextension 70032 PurchInvLineExt extends "Purch. Inv. Line"
{
    fields
    {
        modify("Direct Unit Cost")
        {
            CaptionClass = GetCaptionClass(FieldNo("Direct Unit Cost"));
        }
        field(60001; "Indent No."; Code[20])
        {
            Description = 'B2B';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(60002; "Indent Line No."; Integer)
        {
            Description = 'B2B';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(60003; Remarks; Text[250])
        {
            Description = 'B2B';
            DataClassification = CustomerContent;
        }
        field(60090; "Dimension Corrected"; Boolean)
        {
            Description = 'added  by sujani for Dimension issue clearance (B2B Assistance)';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(60091; "OLD Dim Set ID"; Integer)
        {
            Description = 'added  by sujani for Dimension issue clearance (B2B Assistance)';
            Editable = false;
            TableRelation = "Dimension Set Entry Backup2"."Dimension Set ID" WHERE("Dimension Set ID" = FIELD("OLD Dim Set ID"));
            DataClassification = CustomerContent;

            trigger OnLookup();
            begin
                //ShowDimensionsOLD;
            end;
        }
        field(60095; "Purchase_Order No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(60098; "Invoice Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(70026; gst_group_code_reverse_charge; Boolean)
        {
            FieldClass = FlowField;
        }
        field(70027; "GST Claiming Status"; Enum "Purch Inv Enum1")
        {
            DataClassification = ToBeClassified;

        }
    }




    var
        USER: Record User;
        Body: Text[250];
        Mail_From: Text[250];
        Mail_To: Text[250];
        //Mail: Codeunit Mail;
        Subject: Text[250];

    var
        "-ALE-": Integer;
        Item: Record Item;
        Structure_Amount: Decimal;
    //StrOrdLineDetails: Record "Structure Order Line Details";
}

