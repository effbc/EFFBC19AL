report 50109 "Session Info 2013"
{
    // version Track,UserID,Rev01

    DefaultLayout = RDLC;
    RDLCLayout = './Session Info 2013.rdlc';

    dataset
    {
        dataitem(Sessions; Session)
        {
            column(IValue; i)
            {
            }
            column(ConnectionID_Sessions; Sessions."Connection ID")
            {
                IncludeCaption = true;
            }
            column(UserID_Sessions; Sessions."User ID")
            {
                IncludeCaption = true;
            }
            column(MySession_Sessions; Sessions."My Session")
            {
                IncludeCaption = true;
            }
            column(LoginTime_Sessions; Sessions."Login Time")
            {
                IncludeCaption = true;
            }
            column(LoginDate_Sessions; Sessions."Login Date")
            {
                IncludeCaption = true;
            }
            column(DatabaseName_Sessions; Sessions."Database Name")
            {
                IncludeCaption = true;
            }
            column(ApplicationName_Sessions; Sessions."Application Name")
            {
                IncludeCaption = true;
            }
            column(LoginType_Sessions; Sessions."Login Type")
            {
                IncludeCaption = true;
            }
            column(HostName_Sessions; Sessions."Host Name")
            {
                IncludeCaption = true;
            }

            trigger OnAfterGetRecord();
            begin
                i := i + 1;
                Name := '';
                Body += FORMAT(New_LIne);
                IF Sessions."User ID" <> '' THEN BEGIN
                    //  MESSAGE(COPYSTR(Session."User ID",2));
                    user.GET(COPYSTR(Sessions."User ID", 2));
                    Name := user."Full Name";
                    user.RESET;
                END;
                bodies := 1;
                New_LIne := 10;
                "Mail-Id".RESET;
                "Mail-Id".SETRANGE("Mail-Id"."User Name", COPYSTR(Sessions."User ID", 2));
                IF "Mail-Id".FIND('-') THEN BEGIN
                    Body += "Mail-Id"."User Name";
                    spac := 10 - STRLEN(Sessions."User ID");
                    FOR j := 1 TO spac DO
                        Body += ' ';
                    Body += "Mail-Id"."Full Name";
                    Spaces := 30 - STRLEN("Mail-Id"."Full Name");
                    FOR j := 1 TO Spaces DO
                        Body += ' ';
                    Body += FORMAT(Sessions."Login Time");
                    IF (STRLEN(Body) > 950) THEN BEGIN
                        Mail_Body[bodies] := Body;
                        bodies += 1;
                        Body := '';
                    END;
                END;
            end;

            trigger OnPostDataItem();
            begin
                //smtpmail.CreateMessage('ERP',From,'sitarajyam@efftronics.com,phani@efftronics.com','TEST',Body,FALSE);
                // smtpmail.Send;
                MESSAGE('Sent');
                /*SMTPSETUP.SETFILTER(SMTPSETUP."SMTP Server name",'mail.efftronics.com');
                IF SMTPSETUP.FIND('-')  THEN
                BEGIN
                SMTPSETUP.TESTFIELD(SMTPSETUP."SMTP Server name");
                SMTPSETUP.TESTFIELD(SMTPSETUP."SMTP Port No");
                SMTPSETUP.TESTFIELD(SMTPSETUP."E-Mail From");
                END;
                IF ISCLEAR(objEmailConf) THEN
                  CREATE(objEmailConf);
                flds := objEmailConf.Fields;
                fld := flds.Item('http://schemas.microsoft.com/cdo/configuration/smtpserver');
                fld.Value(SMTPSETUP."SMTP Server name");
                fld := flds.Item('http://schemas.microsoft.com/cdo/configuration/smtpserverport');
                fld.Value(SMTPSETUP."SMTP Port No");
                fld := flds.Item('http://schemas.microsoft.com/cdo/configuration/sendusing');
                fld.Value(2);
                flds.Update();
                IF ISCLEAR(objEmail) THEN CREATE(objEmail);
                objEmail.Configuration :=objEmailConf;
                objEmail.From :=From;
                objEmail."To" :=To_Mail;
                objEmail.Subject := Subject;
                //FOR i:=1 TO bodies DO
                objEmail.TextBody:=Mail_Body[1]+Body;
                objEmail.Send;
                */

            end;

            trigger OnPreDataItem();
            begin
                "Mail-Id".SETRANGE("Mail-Id"."User Name", USERID);
                IF "Mail-Id".FIND('-') THEN
                    From := "Mail-Id".MailID;
                //To_Mail:='sreenu@efftronics.com';
                New_LIne := 10;
                Body := '';
                Subject := 'Session Information';
                Body := 'UserID    User Name                     Login Time';
                Body += '------    ---------                     ----------';
                Body += FORMAT(New_LIne);
                i := 0;
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
        "Mail-Id": Record User;
        user: Record User;
        From: Text;
        New_LIne: Char;
        Body: Text;
        Subject: Text;
        i: Integer;
        j: Integer;
        Name: Text[50];
        bodies: Integer;
        spac: Integer;
        Spaces: Integer;
        Mail_Body: array[2] of Text;
        smtpmail: Codeunit "SMTP Mail";
}

