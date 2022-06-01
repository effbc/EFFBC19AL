report 32000004 "Duplicate Dim Value"
{
    // version ONETIME

    DefaultLayout = RDLC;
    RDLCLayout = './Duplicate Dim Value.rdlc';

    dataset
    {
        dataitem("Dimension Value"; "Dimension Value")
        {
            column(DimensionValueID_DimensionValue; "Dimension Value"."Dimension Value ID")
            {
            }

            trigger OnAfterGetRecord();
            begin
                DimensionValue.RESET;
                DimensionValue.SETRANGE(DimensionValue."Dimension Value ID", "Dimension Value ID");
                IF DimensionValue.FINDSET THEN
                    IF DimensionValue.COUNT = 1 THEN
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
        DimensionValue: Record "Dimension Value";
}

