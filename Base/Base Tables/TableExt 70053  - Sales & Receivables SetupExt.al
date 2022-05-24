tableextension 70053 SalesReceivablesSetupExt extends "Sales & Receivables Setup"
{

    fields
    {
        field(60001; "Tender Nos."; Code[20])
        {
            Description = 'B2B';
            TableRelation = "No. Series";
        }
        field(60002; "Tender Posting Nos."; Code[20])
        {
            Description = 'B2B';
            TableRelation = "No. Series";
        }
    }

}

