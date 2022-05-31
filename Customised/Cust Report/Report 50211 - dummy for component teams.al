report 50211 "dummy for component teams"
{
    DefaultLayout = RDLC;
    RDLCLayout = './dummy for component teams.rdlc';

    dataset
    {
        dataitem("Posted Material Issues Line"; "Posted Material Issues Line")
        {
            DataItemTableView = WHERE(Transfer-to Code=FILTER(PROD));
            RequestFilterFields = "Issued DateTime","Transfer-to Code";
            column("sum";sum)
            {
            }
            column(sumCaption;sumCaptionLbl)
            {
            }
            column(Posted_Material_Issues_Line_Document_No_;"Document No.")
            {
            }
            column(Posted_Material_Issues_Line_Line_No_;"Line No.")
            {
            }

            trigger OnPreDataItem();
            begin
                sum:=0;
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
        "sum" : Decimal;
        items : Record Item;
        sumCaptionLbl : Label 'sum';
}

