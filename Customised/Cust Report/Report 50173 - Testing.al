report 50173 Testing
{
    DefaultLayout = RDLC;
    RDLCLayout = './Testing.rdlc';

    dataset
    {
        dataitem("Dimension Value";"Dimension Value")
        {

            trigger OnAfterGetRecord();
            begin
                "Dimension Value"."Dimension Value ID" := 4699;
                "Dimension Value".MODIFY;
            end;

            trigger OnPreDataItem();
            begin
                "Dimension Value".SETFILTER("Dimension Value"."Dimension Code",'EMPLOYEE CODES');
                "Dimension Value".SETFILTER("Dimension Value".Code,'%1','17CA074');
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

