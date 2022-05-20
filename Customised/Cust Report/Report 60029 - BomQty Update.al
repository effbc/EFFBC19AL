report 60029 "BomQty Update"
{
    DefaultLayout = RDLC;
    RDLCLayout = './BomQty Update.rdlc';

    dataset
    {
        dataitem("Production BOM Line";"Production BOM Line")
        {

            trigger OnAfterGetRecord();
            begin
                "Production BOM Line"."No. of Pins":=0;
                "Production BOM Line"."No. of Soldering Points":=0;
                "Production BOM Line"."No. of Opportunities":=0;
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

