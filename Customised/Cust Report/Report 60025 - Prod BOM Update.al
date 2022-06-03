report 60025 "Prod BOM Update"
{
    // "Production BOM Line"."No. of Pins":="Production BOM Line"."No. of Pins1"
    // IF "Production BOM Line"."No. of Soldering Points"="Production BOM Line"."No. of Soldering Points1" THEN
    //   "Production BOM Line"."No. of Soldering Points":=0;
    // IF "Production BOM Line"."No. of Opportunities"="Production BOM Line"."No. of Opportunities1" THEN
    //   "Production BOM Line"."No. of Opportunities":=0;
    // "Production BOM Line".MODIFY;
    DefaultLayout = RDLC;
    RDLCLayout = './Prod BOM Update.rdlc';


    dataset
    {
        dataitem("Production BOM Line"; "Production BOM Line")
        {
            DataItemTableView = SORTING(Production BOM No., Version Code, Line No.) WHERE(Type = FILTER(Item));

            trigger OnAfterGetRecord();
            begin
                "Production BOM Line"."Material Reqired Day" := 0;
                "Production BOM Line".Status := 0;
                "Production BOM Line"."No. of Opportunities" := 0;
                "Production BOM Line".MODIFY;
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

