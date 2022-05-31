report 56771 "Test report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Test report.rdlc';
    Permissions = TableData "Purchase Line" = r;

    dataset
    {
        dataitem("Purchase Line"; "Purchase Line")
        {
            column(Item; "Purchase Line"."No.")
            {
            }
            column(Description; "Purchase Line".Description)
            {
            }
            column(Make; "Purchase Line".Make)
            {
            }
            column(Sample; "Purchase Line".Sample)
            {
            }

            trigger OnAfterGetRecord();
            begin
                //"User Setup".Executed := FALSE;
                //MODIFY;
            end;

            trigger OnPostDataItem();
            begin
                MESSAGE('Done')
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

