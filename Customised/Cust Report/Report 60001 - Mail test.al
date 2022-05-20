report 60001 "Mail test"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Mail test.rdlc';

    dataset
    {
        dataitem("Integer";"Integer")
        {
            DataItemTableView = SORTING(Number) WHERE(Number=CONST(1));

            trigger OnAfterGetRecord();
            begin
                smtp_mail.CreateMessage('test','santhoshk@efftronics.com','santhoshk@efftronics.com','test','hi',FALSE);
                smtp_mail.Send;
                MESSAGE('sent');
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
        smtp_mail : Codeunit "SMTP Mail";
}

