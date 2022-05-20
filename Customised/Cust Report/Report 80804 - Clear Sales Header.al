report 80804 "Clear Sales Header"
{
    // version B2Bupg

    DefaultLayout = RDLC;
    RDLCLayout = './Clear Sales Header.rdlc';

    dataset
    {
        dataitem("Sales Header";"Sales Header")
        {

            trigger OnAfterGetRecord();
            begin
                "Adjusted from EMD" := 0;
                "Adjusted from Running Bills" := 0;
                "SD Paid Amount" := 0;
                "SD Received Amount" := 0;
                "Quote No 2." := '';
                "Reason For Pending" := '';
                "Payments Date" := 0D;
                "Base PLan Comp. Date" := 0D;
                "Revised Target Date" := 0D;
                "Sales Date" := 0D;
                Remarks := '';
                "Revised Comp.Date" := 0D;
                "Deviated Days" := '';
                "Product 1" := '';
                "Product 2" := '';
                "Product 3" := '';
                "Product 4" := '';
                "SD Running Bill Percent" := 0;
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

