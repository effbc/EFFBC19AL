page 90010 SMS
{
    PageType = ConfirmationDialog;

    layout
    {
        area(content)
        {
            field(PhoneNo; PhoneNo)
            {
                ShowCaption = false;
            }
            field(TextMessage; TextMessage)
            {
                ShowCaption = false;
            }
            field(Control1102152003; '')
            {
                CaptionClass = Text19027299;
                ShowCaption = false;
            }
            field(Control1102152000; '')
            {
                CaptionClass = Text19049794;
                ShowCaption = false;
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
                    Temp := 'http://b2blinux102/mts/sms.php?CELLNO=' + PhoneNo + '&CELLMSG=' + TextMessage;
                    //CommandProcessor := 'c:\command.com';
                    //Argument := '/c';
                    //DOSCommand := 'iexplore.exe ' + Temp;
                    //SHELL(CommandProcessor, Argument, DOSCommand);
                    //SHELL(DOSCommand);
                    //SHELL('',Temp);
                    //HYPERLINK(Temp);
                    DOSCommand := 'gaim.exe';
                    SHELL(DOSCommand);
                end;
            }
        }
    }

    var
        TextMessage: Text[30];
        PhoneNo: Text[30];
        Temp: Text[250];
        TEXT001: TextConst ENU = 'http://b2blinux102/mts/sms.php?CELLNO=%1&CELLMSG=%2';
        CommandProcessor: Text[250];
        Argument: Text[250];
        DOSCommand: Text[250];
        Text19049794: Label 'Phone No.';
        Text19027299: Label 'Message';
}

