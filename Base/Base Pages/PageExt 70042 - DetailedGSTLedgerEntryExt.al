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
            }
            field("Bill of Entry Date"; "Bill of Entry Date")
            {
            }
            field("Eligibility for ITC"; "Eligibility for ITC")
            {
            }
            field("GST Assessable Value"; "GST Assessable Value")
            {
            }
        }
        addafter("Control 1500086")
        {
            field("Remaining Base Amount"; "Remaining Base Amount")
            {
                Editable = true;
            }
            field("Remaining GST Amount"; "Remaining GST Amount")
            {
                Editable = true;
            }
        }
        moveafter("Cess Factor Quantity"; "Control 1502003")
    }
    actions
    {



    }



}

