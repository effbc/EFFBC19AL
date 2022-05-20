page 60304 "Bank ledger entries"
{
    PageType = List;
    Permissions = TableData "Bank Account Ledger Entry"=rimd;
    SourceTable = "Bank Account Ledger Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("=rimdO";"Entry No.")
                {
                }
                field("Bank Account No.";"Bank Account No.")
                {
                }
                field("Posting Date";"Posting Date")
                {
                }
                field("Document Type";"Document Type")
                {
                }
                field("Document No.";"Document No.")
                {
                }
                field(Description;Description)
                {
                }
                field("Currency Code";"Currency Code")
                {
                }
                field(Amount;Amount)
                {
                }
                field("Remaining Amount";"Remaining Amount")
                {
                }
                field("Amount (LCY)";"Amount (LCY)")
                {
                }
                field("Bank Acc. Posting Group";"Bank Acc. Posting Group")
                {
                }
                field("Global Dimension 1 Code";"Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code";"Global Dimension 2 Code")
                {
                }
                field("Our Contact Code";"Our Contact Code")
                {
                }
                field("User ID";"User ID")
                {
                }
                field("Source Code";"Source Code")
                {
                }
                field(Open;Open)
                {
                }
                field(Positive;Positive)
                {
                }
                field("Closed by Entry No.";"Closed by Entry No.")
                {
                }
                field("Closed at Date";"Closed at Date")
                {
                }
                field("Journal Batch Name";"Journal Batch Name")
                {
                }
                field("Reason Code";"Reason Code")
                {
                }
                field("Bal. Account Type";"Bal. Account Type")
                {
                }
                field("Bal. Account No.";"Bal. Account No.")
                {
                }
                field("Transaction No.";"Transaction No.")
                {
                }
                field("Statement Status";"Statement Status")
                {
                }
                field("Statement No.";"Statement No.")
                {
                }
                field("Statement Line No.";"Statement Line No.")
                {
                }
                field("Debit Amount";"Debit Amount")
                {
                }
                field("Credit Amount";"Credit Amount")
                {
                }
                field("Debit Amount (LCY)";"Debit Amount (LCY)")
                {
                }
                field("Credit Amount (LCY)";"Credit Amount (LCY)")
                {
                }
                field("Document Date";"Document Date")
                {
                }
                field("External Document No.";"External Document No.")
                {
                }
                field(Reversed;Reversed)
                {
                }
                field("Reversed by Entry No.";"Reversed by Entry No.")
                {
                }
                field("Reversed Entry No.";"Reversed Entry No.")
                {
                }
                field("Check Ledger Entries";"Check Ledger Entries")
                {
                }
                field("Dimension Set ID";"Dimension Set ID")
                {
                }
                field("Location Code";"Location Code")
                {
                }
                field("Cheque No.";"Cheque No.")
                {
                }
                field("Cheque Date";"Cheque Date")
                {
                }
                field("Stale Cheque";"Stale Cheque")
                {
                }
                field("Stale Cheque Expiry Date";"Stale Cheque Expiry Date")
                {
                }
                field("Cheque Stale Date";"Cheque Stale Date")
                {
                }
                field("customer ord no";"customer ord no")
                {
                }
                field("Payment Type";"Payment Type")
                {
                }
                field("DD/FDR No.";"DD/FDR No.")
                {
                }
                field("Payment Through";"Payment Through")
                {
                }
            }
        }
    }

    actions
    {
        separator(Action1102152052)
        {
        }
        area(creation)
        {
            action(set)
            {

                trigger OnAction();
                begin
                    /*Rec.RESET;
                    Rec.SETFILTER("Posting Date",'<%1',010418D);
                    IF Rec.FINDSET THEN
                    REPEAT
                      Rec.Open := FALSE;
                      Rec.MODIFY;
                    UNTIL Rec.NEXT =0;
                    MESSAGE('updated');*/

                end;
            }
        }
        action("SET FALSE")
        {
            ShortCutKey = 'Ctrl+u';
        }
    }
}

