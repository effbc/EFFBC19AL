pageextension 70041 DetailedCustLedgEntriesExt extends "Detailed Cust. Ledg. Entries"
{


    layout
    {



        /* modify("Control1")
         {


             ShowCaption = false;
         }*/


        addafter("Customer No.")
        {
            field("Payment Type"; Rec."Payment Type")
            {
            }
        }

        addafter("Entry No.")
        {
            field("Applied Cust. Ledger Entry No."; Rec."Applied Cust. Ledger Entry No.")
            {
            }
            field("Application No."; Rec."Application No.")
            {
            }
        }
    }
    actions
    {


        modify("&Navigate")
        {
            Promoted = true;


        }
    }



}

