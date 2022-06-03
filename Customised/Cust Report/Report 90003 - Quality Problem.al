report 90003 "Quality Problem"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Quality Problem.rdlc';

    dataset
    {
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

    trigger OnPreReport();
    begin
        IF PurchRcptLine.FIND('-') THEN
            REPEAT
                "90003"."Purch.Rcpt No." := PurchRcptLine."Document No.";
                "90003"."Line No." := PurchRcptLine."Line No.";
                "90003"."Qty.Accepted" := PurchRcptLine."Quantity Accepted";
                "90003"."Qty Rejected" := PurchRcptLine."Quantity Rejected";
                "90003".INSERT;
                PurchRcptLine."Quantity Accepted" := 0;
                PurchRcptLine."Quantity Rejected" := 0;
                PurchRcptLine.MODIFY;
            UNTIL PurchRcptLine.NEXT = 0;
    end;

    var
        PurchRcptLine: Record "Purch. Rcpt. Line";
        "90003": Record "Quality Problem";
}

