tableextension 70029 PurchRcptHeaderExt extends "Purch. Rcpt. Header"
{


    fields
    {


        modify("No.")
        {
            CaptionML = ENU = 'Reciept No.', ENN = 'Reciept No.';
        }



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
        field(60001; "Vendor Excise Invoice No."; Code[20])
        {
            Description = 'B2B';
        }
        field(60002; "Vend. Excise Inv. Date"; Date)
        {
            Description = 'B2B';
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
            TableRelation = "Create Indents"."Item No.";
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
        field(60013; "Bill Received"; Boolean)
        {
        }
        field(60014; "Bill Transfered"; Boolean)
        {

            trigger OnValidate();
            begin
                if "Bill Received" = false then
                    Error('Bill received must be ticked')
                else begin
                    if UpperCase(UserId) in ['EFFTRONICS\PARDHU', 'EFFTRONICS\DURGAMAHESWARI', 'EFFTRONICS\ANANDA', 'EFFTRONICS\MARY', 'EFFTRONICS\PADMASRI',
                      'EFFTRONICS\B2BOTS', 'EFFTRONICS\20TE061', 'EFFTRONICS\GRAVI', 'EFFTRONICS\NSUDHEER', 'EFFTRONICS\ASWINI', 'EFFTRONICS\CHRAJYALAKSHMI', 'EFFTRONICS\MRAJYALAKSHMI', 'EFFTRONICS\SUJITH', 'EFFTRONICS\BLAVANYA', 'EFFTRONICS\SNANDINI'] then begin
                        "Bill Transfered Date" := Today;
                    end else begin
                        Error(t1);
                        "Bill Transfered Date" := 0D;
                    end;
                end;
            end;
        }
        field(60015; "Bill Transfered Date"; Date)
        {
        }
        field(60016; Remarks; Text[250])
        {
        }
        field(60017; "Created Date Time"; DateTime)
        {
        }
        field(60019; "Vendor Invoice Date"; Date)
        {
        }
        field(60079; "Order (Digits)"; Code[10])
        {
        }
        field(60080; Pending; Boolean)
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
        field(60093; "QC Passed"; Boolean)
        {
            Description = 'added  by sujani for QC Passed confirmation to Bill Transfer';
            Editable = false;
        }
    }





    var
        t1: Label 'u have no permissions';
        USER: Record User;
        Body: Text[250];
        Mail_From: Text[250];
        Mail_To: Text[250];
        Mail: Codeunit Mail;
        Subject: Text[250];
}

