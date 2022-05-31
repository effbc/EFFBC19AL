report 80801 "Sales Line Arch update"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Sales Line Arch update.rdlc';

    dataset
    {
        dataitem("Sales Line Archive"; "Sales Line Archive")
        {

            trigger OnAfterGetRecord();
            begin
                /*
                "% of Excise Applicable 2" := 0;
                "VAT Business Posting Group 2" := '';
                "Service Tax % 2" := 0;
                "Service Tax eCess % 2" := 0;
                "VAT Product Posting Group 2" := '';
                "VAT %age 2" := 0;
                "VAT Base 2":= 0;
                "VAT Amount 2" := 0;
                "Excise % 2" := 0;
                "Excise Calculation Type 2" := 0;
                "eCess % / Amount 2" := 0;
                MODIFY;
                */

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

