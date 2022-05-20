report 90004 "QC Problem"
{
    ProcessingOnly = true;

    dataset
    {
        dataitem("Quality Problem";"Quality Problem")
        {

            trigger OnAfterGetRecord();
            begin
                "Purch.RcptLine".SETRANGE("Document No.","Purch.Rcpt No.");
                "Purch.RcptLine".SETRANGE("Line No.","Quality Problem"."Line No.");
                IF "Purch.RcptLine".FIND('-') THEN BEGIN
                  "Purch.RcptLine"."Quantity Accepted" := "Quality Problem"."Qty.Accepted";
                  "Purch.RcptLine"."Quantity Rejected" := "Quality Problem"."Qty Rejected";
                  "Purch.RcptLine".MODIFY;
                END;
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

    var
        "Purch.RcptLine" : Record "Purch. Rcpt. Line";
}

