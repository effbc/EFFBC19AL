pageextension 70176 SalesReceivablesSetupExt extends "Sales & Receivables Setup"
{


    layout
    {



        addafter("Posted Credit Memo Nos.")
        {
            field("Tender Nos."; Rec."Tender Nos.")
            {
            }
            field("Tender Posting Nos."; Rec."Tender Posting Nos.")
            {
            }
        }
    }


}

