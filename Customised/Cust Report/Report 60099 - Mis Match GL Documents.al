report 60099 "Mis Match GL Documents"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Mis Match GL Documents.rdlc';

    dataset
    {
        dataitem("G/L Entry"; "G/L Entry")
        {
            column(DocumentNo_GLEntry; "G/L Entry"."Document No.")
            {
            }
            column(DebitAmount; GLEntry."Debit Amount")
            {
            }
            column(CreditAmount; GLEntry."Credit Amount")
            {
            }
            column(DiffAmount; GLEntry."Debit Amount")
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF PrevDocNo = "G/L Entry"."Document No." THEN
                    CurrReport.SKIP;
                PrevDocNo := "G/L Entry"."Document No.";
                GLEntry.RESET;
                GLEntry.SETCURRENTKEY("Document No.", "Debit Amount", "Credit Amount");
                GLEntry.SETRANGE("Document No.", "G/L Entry"."Document No.");
                GLEntry.CALCSUMS("Debit Amount", "Credit Amount");
                IF GLEntry."Debit Amount" = GLEntry."Credit Amount" THEN
                    CurrReport.SKIP;
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

    trigger OnInitReport();
    begin
        MESSAGE('Testing on Init Report');
    end;

    var
        PrevDocNo: Text;
        GLEntry: Record "G/L Entry";
}

