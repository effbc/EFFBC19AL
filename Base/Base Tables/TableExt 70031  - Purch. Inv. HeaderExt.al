tableextension 70031 PurchInvHeaderExt extends "Purch. Inv. Header"
{


    fields
    {



        field(50000; "MSPT Date"; Date)
        {
            Description = 'MSPT1.0';
            Editable = false;
        }
        field(50001; "MSPT Code"; Code[20])
        {
            Description = 'MSPT1.0';
            Editable = false;
            TableRelation = "MSPT Header".Code WHERE(Status = CONST(Released));

            trigger OnValidate();
            var
                MSPTHeader: Record "MSPT Header";
                "MSPT Details": Record "MSPT Line";
            begin
            end;
        }
        field(50002; "MSPT Applicable at Line Level"; Boolean)
        {
            Description = 'MSPT1.0';
            Editable = false;
        }
        field(60001; "Vendor Excise Invoice No."; Code[30])
        {
            Description = 'B2B';
            Editable = true;
        }
        field(60002; "Vend. Excise Inv. Date"; Date)
        {
            Description = 'B2B';
            Editable = false;
        }
        field(60003; "Cancel Short Close"; Option)
        {
            Description = 'B2B';
            OptionCaption = '" ,Cancelled,Short Closed"';
            OptionMembers = " ",Cancelled,"Short Closed";
        }
        field(60004; "RFQ No."; Code[20])
        {
            Description = 'B2B';
            TableRelation = "Service Invoice Line Archive"."Document No.";
        }
        field(60005; Make; Text[50])
        {
            Description = 'B2B';
        }
        field(60006; "Packint Type"; Text[50])
        {
            Description = 'B2B';
        }
        field(60007; Verification; Text[50])
        {
            Description = 'B2B';
        }
        field(60008; "Invoiced Amount"; Decimal)
        {
            CalcFormula = Sum("Purch. Inv. Line".Amount WHERE("Document No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(60019; "Vendor Invoice Date"; Date)
        {
        }
        field(60079; "Order (Digits)"; Code[10])
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
        field(60095; "Actual Invoiced Date"; Date)
        {
        }
        field(60096; "Additional Duty Value"; Decimal)
        {
        }
        field(60097; "Type of Supplier"; Option)
        {
            OptionCaption = '" ,Manufacturer,First Stage Dealer,Second Stage Dealer,Importer,Trader,Authorized distributor"';
            OptionMembers = " ",Manufacturer,"First Stage Dealer","Second Stage Dealer",Importer,Trader,"Authorized distributor";
        }
        field(60098; "Excise Not to Consider"; Boolean)
        {
        }
        field(60099; "C Status"; Enum "Purch Line Enum8")
        {
            //OptionMembers = " ",ToBeSent,Sent;
        }
        field(60100; "Vehicle Number"; Text[30])
        {
        }
        field(60101; "Transporter Name"; Text[30])
        {
        }
        field(60102; "C-Form Number"; Code[20])
        {
        }
        field(60103; "C-Form Issue Date"; Date)
        {
        }
        field(60104; "Excise Claimed Date"; Date)
        {
            Editable = false;
        }
        field(60105; ExciseRemarks; Enum "Purch Line Enum4")
        {
            // OptionMembers = " "," Claimed","Bill Not rcvd"," Need To Claim"," Not Known"," Need Not Claim";
        }
        field(60122; "Tarrif Heading No"; Code[50])
        {
        }
        field(60127; RCM_Paid_Date; Date)
        {
            Editable = false;
        }
        field(70001; "% of input for Claimed Month"; Enum "Purch Line Enum7")
        {
            Description = 'added by vishnu Priya for the GST Claiming  Purpose';

        }
    }


    var
        USER: Record User;
        Body: Text[250];
        Mail_From: Text[250];
        Mail_To: Text[250];
        Mail: Codeunit Mail;
        Subject: Text[250];
}

