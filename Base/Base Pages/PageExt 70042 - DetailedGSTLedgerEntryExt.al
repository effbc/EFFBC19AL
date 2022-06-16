pageextension 70042 DetailedGSTLedgerEntryExt extends "Detailed GST Ledger Entry"
{


    layout
    {


        modify("Control 1501037")
        {
            Visible = false;
        }
        modify("Control 1501040")
        {
            Visible = false;
        }
        modify("Control 1501041")
        {
            Visible = false;
        }
        modify("Control 1501042")
        {
            Visible = false;
        }
        addafter("Control 1500035")
        {
            field("Bill of Entry No."; "Bill of Entry No.")
            {
                ApplicationArea = All;
            }
            field("Bill of Entry Date"; "Bill of Entry Date")
            {
                ApplicationArea = All;
            }
            field("Eligibility for ITC"; "Eligibility for ITC")
            {
                ApplicationArea = All;
            }
            field("GST Assessable Value"; "GST Assessable Value")
            {
                ApplicationArea = All;
            }
        }
        addafter("Control 1500086")
        {
            field("Remaining Base Amount"; "Remaining Base Amount")
            {
                Editable = true;
                ApplicationArea = All;
            }
            field("Remaining GST Amount"; "Remaining GST Amount")
            {
                Editable = true;
                ApplicationArea = All;
            }
        }
        moveafter("Cess Factor Quantity"; "Control 1502003")
    }
    actions
    {



    }



}

