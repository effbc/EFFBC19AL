page 99999 sample123
{
    PageType = Card;
    SourceTable = Item;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No.";"No.")
                {
                }
                field("No. 2";"No. 2")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Send)
            {
                Caption = 'Send';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    Rec.FINDFIRST;
                    Body := "No."+Description;
                    CU.CreateMessage('Ramesh','santhoshk@efftronics.com','santhoshk@efftronics.com','TEST',Body,FALSE);

                    Rec.NEXT;

                    REPEAT

                    body1 := "No."+Description;
                    len+=STRLEN(body1);
                    CU.AppendBody(body1);
                    UNTIL NEXT=0;

                    CU.Send;
                    MESSAGE('Mail Sent');
                    MESSAGE(FORMAT(len));
                end;
            }
        }
    }

    var
        CU : Codeunit "SMTP Mail";
        Tb : Record "SMTP Mail Setup";
        Body : Text[1024];
        body1 : Text[1024];
        len : Integer;
}

