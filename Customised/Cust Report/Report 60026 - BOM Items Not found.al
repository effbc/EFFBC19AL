report 60026 "BOM Items Not found"
{
    DefaultLayout = RDLC;
    RDLCLayout = './BOM Items Not found.rdlc';

    dataset
    {
        dataitem("Production BOM Line"; "Production BOM Line")
        {
            DataItemTableView = WHERE(Type = CONST(Item));
            column(Production_BOM_Line__Production_BOM_No__; "Production BOM No.")
            {
            }
            column(Production_BOM_Line__No__; "No.")
            {
            }
            column(Production_BOM_Line__Production_BOM_No__Caption; FIELDCAPTION("Production BOM No."))
            {
            }
            column(Production_BOM_Line__No__Caption; FIELDCAPTION("No."))
            {
            }
            column(Production_BOM_Line_Version_Code; "Version Code")
            {
            }
            column(Production_BOM_Line_Line_No_; "Line No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF Item.GET("Production BOM Line"."No.") THEN
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

    var
        Item: Record Item;
}

