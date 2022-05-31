report 60030 "TEST-SAMPLE"
{
    DefaultLayout = RDLC;
    RDLCLayout = './TEST-SAMPLE.rdlc';

    dataset
    {
        dataitem("Production BOM Line"; "Production BOM Line")
        {
            DataItemTableView = SORTING(Type, No.) ORDER(Ascending) WHERE(Type = FILTER(<> ' '), No.=FILTER(<>''));

            trigger OnAfterGetRecord();
            begin
                /*"Production BOM Line".VALIDATE("Production BOM Line"."Storage Temperature");*/

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

