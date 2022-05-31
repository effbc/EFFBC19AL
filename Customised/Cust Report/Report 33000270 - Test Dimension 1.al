report 33000270 "Test Dimension 1"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Test Dimension 1.rdlc';

    dataset
    {
        dataitem("Dimension Set Tree Node"; "Dimension Set Tree Node")
        {
            dataitem("Dimension Set Entry"; "Dimension Set Entry")
            {
                DataItemLink = Dimension Set ID=FIELD(Dimension Set ID);
                column(DimensionSetID_DimensionSetEntry; "Dimension Set Entry"."Dimension Set ID")
                {
                }
                column(DimensionCode_DimensionSetEntry; "Dimension Set Entry"."Dimension Code")
                {
                }
                column(DimensionValueCode_DimensionSetEntry; "Dimension Set Entry"."Dimension Value Code")
                {
                }
                column(DimensionValueID_DimensionSetEntry; "Dimension Set Entry"."Dimension Value ID")
                {
                }
                column(DimensionName_DimensionSetEntry; "Dimension Set Entry"."Dimension Name")
                {
                }
                column(DimensionValueName_DimensionSetEntry; "Dimension Set Entry"."Dimension Value Name")
                {
                }
                column(ValueID_DimensionValue; DimensionValue."Dimension Value ID")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    CLEAR(DimensionValue);
                    IF DimensionValue.GET("Dimension Set Entry"."Dimension Code", "Dimension Set Entry"."Dimension Value Code") THEN;
                end;
            }

            trigger OnPreDataItem();
            begin
                SETRANGE("Dimension Set Tree Node"."Parent Dimension Set ID", 85);
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

