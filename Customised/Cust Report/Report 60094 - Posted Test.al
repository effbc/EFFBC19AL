report 60094 "Posted Test"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Posted Test.rdlc';

    dataset
    {
        dataitem("Posted Material Issues Header"; "Posted Material Issues Header")
        {
            DataItemTableView = SORTING(Prod. Order No., Prod. Order Line No.) ORDER(Ascending) WHERE(Posting Date=CONST(09/27/10),Transfer-from Code=CONST(STR),Transfer-to Code=CONST(PROD),Posted By=CONST(08PS002));
            column(Posted_Material_Issues_Header__Prod__Order_No__; "Prod. Order No.")
            {
            }
            column(nO__OF_uNTIS_; "nO. OF uNTIS")
            {
            }
            column(TOTAL_UNITS; TOTAL_UNITS)
            {
            }
            column(Posted_Material_Issues_Header_No_; "No.")
            {
            }
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
        "nO. OF uNTIS": Decimal;
        "Porduction order": Record "Production Order";
        Item: Record Item;
        TOTAL_UNITS: Decimal;
}

