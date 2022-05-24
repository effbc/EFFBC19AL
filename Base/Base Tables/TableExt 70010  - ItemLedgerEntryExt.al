tableextension 70010 ItemLedgerEntryExt extends "Item Ledger Entry"
{


    fields
    {


        field(60001; "ITL Doc No."; Code[20])
        {
            Description = 'B2B';
        }
        field(60002; "ITL Doc Line No."; Integer)
        {
            Description = 'B2B';
        }
        field(60003; "ITL Doc Ref Line No."; Integer)
        {
            Description = 'B2B';
        }
        field(60004; "Reason Code22"; Code[10])
        {
            TableRelation = "Reason Code";
        }
        field(60012; "Job No.2"; Code[20])
        {
            Description = 'B2B';
        }
        field(60013; "Job budget Line No."; Integer)
        {
            Description = 'B2B';
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
        field(60105; "User ID"; Code[50])
        {
            Description = 'Rev01';
            Editable = false;
            TableRelation = User."User Name";
        }
        field(60106; "Sales Order No"; Code[20])
        {
            Description = 'SH1.0';
        }
        field(60107; "Sales Order Line No"; Integer)
        {
            Description = 'SH1.0';
        }
        field(60108; "Schedule Line No"; Integer)
        {
            Description = 'SH1.0';
        }
        field(60109; "Issued Date Time"; DateTime)
        {
        }
        field(60110; "DC Check"; Boolean)
        {
        }
        field(60111; "MBB Packed Date"; Date)
        {
        }
        field(60112; "MFD Date"; Date)
        {
        }
        field(60113; "Recharge Cycles"; Integer)
        {
        }
        field(60114; "Floor Life"; Decimal)
        {
        }
        field(60115; "MBB Packet Open DateTime"; DateTime)
        {
        }
        field(60116; "MBB Packet Close DateTime"; DateTime)
        {
        }
        field(33000260; "Purch.Rcpt Line"; Integer)
        {
        }
        field(33000261; "QC Check"; Boolean)
        {
        }
    }



    var
        USER: Record User;
        Body: Text[250];
        Mail_From: Text[250];
        Mail_To: Text[250];
        Mail: Codeunit mail;

        Subject: Text[250];
}

