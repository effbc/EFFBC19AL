report 60010 productionbomstartdatedelete
{
    DefaultLayout = RDLC;
    RDLCLayout = './productionbomstartdatedelete.rdlc';

    dataset
    {
        dataitem("Production BOM Line"; "Production BOM Line")
        {
            DataItemTableView = WHERE(Starting Date=FILTER(<>''));
            RequestFilterFields = "Production BOM No.";
            column(Production_BOM_Line__Production_BOM_No__;"Production BOM No.")
            {
            }
            column(Production_BOM_Line_Version_Code;"Version Code")
            {
            }
            column(Production_BOM_Line_Line_No_;"Line No.")
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
        item : Record Item;
}

