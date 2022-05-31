tableextension 70044 BankAccountLedgerEntryExt extends "Bank Account Ledger Entry"
{

    fields
    {
        modify("Document Date")
        {
            ClosingDates = true;
        }

        field(60063; "customer ord no"; Code[65])
        {
        }
        field(60064; "Payment Type"; Enum "Payment Type")
        {

        }
        field(60073; "DD/FDR No."; Code[20])
        {
            Description = 'Rev01';
        }
        field(60074; "Payment Through"; Enum "Payment Through")
        {
            Description = 'Rev01';
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
    keys
    {
        key(Key9; "Posting Date")
        {

        }
    }
    trigger OnModify()
    begin
        if UserSetupGRec.Get(UserId) then begin
            if not UserSetupGRec."Edit Posted Ledger Entries" then
                Error('You Dont have Permissions');
        end else
            Error('User Setup not found. contact ERP Team');
    end;




    var
        UserSetupGRec: Record "User Setup";
        User: Record User;
}

