pageextension 70014 BankAccReconciliationLinesExt extends "Bank Acc. Reconciliation Lines"
{
    layout
    {
        /* modify(Control1)
        {
            ShowCaption = false;
        }
        modify(Control16)
        {
            ShowCaption = false;
        } */
        modify(Control13)
        {
            ShowCaption = false;
        }
        addafter(Difference)
        {
            field("Cheque No."; "Cheque No.")
            {
                ApplicationArea = All;
            }
            field("Cheque Date"; "Cheque Date")
            {
                ApplicationArea = All;
            }
        }
        addafter("Additional Transaction Info")
        {
            field("Bank Acc LE"; "Bank Acc LE")
            {
                ApplicationArea = All;
            }
            field("Transfer to Gen. Jnl"; "Transfer to Gen. Jnl")
            {
                Description = 'B2BN1.0 11Dec2018';
                Enabled = TransferToGenJnlEnable;
                ApplicationArea = All;
            }
            field("Statement No."; "Statement No.")
            {
                ApplicationArea = All;
            }
            field("Statement Line No."; "Statement Line No.")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addafter(ApplyEntries)
        {
            action(SelectAll)
            {
                Caption = 'Select All';
                Description = 'B2BN1.0 11Dec2018';
                ApplicationArea = All;

                trigger OnAction();
                begin
                    SelectOrUnselectAll(TRUE);
                end;
            }
            action(UnselectAll)
            {
                Caption = 'Unselect All';
                Description = 'B2BN1.0 11Dec2018';
                ApplicationArea = All;

                trigger OnAction();
                begin
                    SelectOrUnselectAll(FALSE);
                end;
            }
        }
    }

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        SelectOrUnselectAll(FALSE);//B2BN1.0 11Dec2018
    end;

    var
        TransferToGenJnlEnable: Boolean;
}

