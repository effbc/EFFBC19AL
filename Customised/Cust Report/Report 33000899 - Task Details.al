report 33000899 "Task Details"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Task Details.rdlc';

    dataset
    {
        dataitem("Issue Track Header";"Issue Track Header")
        {
            column(IssueId;"Issue Track Header"."Issue Id")
            {
            }
            column(Log;"Issue Track Header"."Issue Logged By")
            {
            }
            column(LogDate;"Issue Track Header"."Issued Logged Date")
            {
            }
            column(Description;"Issue Track Header".Description)
            {
            }
            column(Handledby;"Issue Track Header"."Handled By")
            {
            }
            column(HandledDate;"Issue Track Header"."Handled Date Time")
            {
            }
            column(Status;"Issue Track Header".Status)
            {
            }
            column(Remarks;"Issue Track Header".Remarks)
            {
            }
            column(ReopenResion;"Issue Track Header"."Reason for Reopen")
            {
            }
            column(SlNo;SlNo)
            {
            }

            trigger OnAfterGetRecord();
            begin
                SlNo +=1;
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
        SlNo : Integer;
}

