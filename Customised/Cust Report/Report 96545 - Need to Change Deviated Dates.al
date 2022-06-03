report 96545 "Need to Change Deviated Dates"
{
    // version Rev01

    DefaultLayout = RDLC;
    RDLCLayout = './Need to Change Deviated Dates.rdlc';

    dataset
    {
        dataitem("Purchase Line"; "Purchase Line")
        {
            DataItemTableView = SORTING(Document Type, Document No., Line No.) ORDER(Ascending) WHERE(Document Type=CONST(Order),Type=CONST(Item),Location Code=CONST(STR),Outstanding Quantity=FILTER(>0));

            trigger OnAfterGetRecord();
            begin
                "Deviated Receipt Date" := 071513D;
                MODIFY;
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

