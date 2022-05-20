report 33000276 "Bank Ledger Updation"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Bank Ledger Updation.rdlc';

    dataset
    {
        dataitem("Bank Account Ledger Entry";"Bank Account Ledger Entry")
        {
            DataItemTableView = WHERE(Open=CONST(Yes));

            trigger OnPreDataItem();
            begin
                "Bank Account Ledger Entry".Open := TRUE;
                "Bank Account Ledger Entry".MODIFY;
            end;
        }
        dataitem("Check Ledger Entry";"Check Ledger Entry")
        {
            DataItemTableView = WHERE(Open=CONST(Yes));

            trigger OnPreDataItem();
            begin
                "Check Ledger Entry".Open := TRUE;
                "Check Ledger Entry".MODIFY;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }
}

