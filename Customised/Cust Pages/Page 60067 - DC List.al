page 60067 "DC List"
{
    // version B2B1.0,Rev01

    CardPageID = "DC Header";
    Editable = false;
    PageType = List;
    SourceTable = "DC Header";

    layout
    {
        area(content)
        {
            group(Control1102152036)
            {
                ShowCaption = false;
                field("xRec.COUNT";xRec.COUNT)
                {
                }
            }
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("No.";"No.")
                {
                }
                field("Document Date";"Document Date")
                {
                }
                field(Type;Type)
                {
                }
                field("Customer No.";"Customer No.")
                {
                }
                field("Sales Order No.";"Sales Order No.")
                {
                }
                field("L.R Number";"L.R Number")
                {
                }
                field("Vehicle Number";"Vehicle Number")
                {
                }
                field("User Id";"User Id")
                {
                }
                field("Created Date";"Created Date")
                {
                }
                field(Remarks;Remarks)
                {
                }
                field(Status;Status)
                {
                }
                field("From Date";"From Date")
                {
                }
                field("To Date";"To Date")
                {
                }
                field(NonReturnable;NonReturnable)
                {
                }
                field(Returned;Returned)
                {
                }
                field("Posted Shipment No.";"Posted Shipment No.")
                {
                }
                field("Received By";"Received By")
                {
                }
                field("Checked By";"Checked By")
                {
                }
                field("Prepared By";"Prepared By")
                {
                }
                field("Mode Of Transport";"Mode Of Transport")
                {
                }
                field("Docket No";"Docket No")
                {
                }
                field("Courier Agency Name";"Courier Agency Name")
                {
                }
                field("Tracking Status";"Tracking Status")
                {
                }
                field("Tracking Status Last Updated";"Tracking Status Last Updated")
                {
                }
                field("Tracking URL";"Tracking URL")
                {
                }
                field("No. Series";"No. Series")
                {
                }
                field("Last Date Modified";"Last Date Modified")
                {
                }
                field("Ship-to Code";"Ship-to Code")
                {
                }
                field("Ship-to Name";"Ship-to Name")
                {
                }
                field("Ship-to Name 2";"Ship-to Name 2")
                {
                }
                field("Ship-to Address";"Ship-to Address")
                {
                }
                field("Ship-to Address 2";"Ship-to Address 2")
                {
                }
                field("Ship-to City";"Ship-to City")
                {
                }
                field("Ship-to Contact";"Ship-to Contact")
                {
                }
                field("Customer P. O. No.";"Customer P. O. No.")
                {
                }
                field("Customer P. O. Date";"Customer P. O. Date")
                {
                }
                field("Sell-to Customer Name";"Sell-to Customer Name")
                {
                }
                field("Sell-to Customer Name 2";"Sell-to Customer Name 2")
                {
                }
                field("Sell-to Address";"Sell-to Address")
                {
                }
                field("Sell-to Address 2";"Sell-to Address 2")
                {
                }
                field("Sell-to City";"Sell-to City")
                {
                }
                field("Sell-to Contact";"Sell-to Contact")
                {
                }
                field("Sell-to Post Code";"Sell-to Post Code")
                {
                }
                field("Sell-to Country Code";"Sell-to Country Code")
                {
                }
                field("Ship-to Post Code";"Ship-to Post Code")
                {
                }
                field("Ship-to Country Code";"Ship-to Country Code")
                {
                }
                field("No.of Packages";"No.of Packages")
                {
                }
                field("Package No's";"Package No's")
                {
                }
                field("Service Order No.";"Service Order No.")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action(Release)
                {
                    Caption = 'Release';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction();
                    begin
                        TESTFIELD(Status,Status :: Open);
                        //TESTFIELD("Posted Shipment No.");
                        USER.RESET;
                        USER.SETFILTER(USER."User Security ID",USERID);
                        USER.SETFILTER(USER.levels,'%1',TRUE);
                        IF NOT USER.FINDFIRST THEN
                          ERROR('U Dont Have Rights to Authorize');
                        IF NOT CONFIRM('Do you want to release the DC') THEN
                          EXIT;
                        Status := Status :: Released;
                        Authorized:=USERID;
                        MODIFY;
                        CurrPage.UPDATE;
                    end;
                }
                action("Report")
                {
                    Caption = 'Report';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'Ctrl+p';

                    trigger OnAction();
                    begin
                        /*InspectDataSheet.SETRANGE("No.","No.");
                        REPORT.RUN(33000250,TRUE,FALSE,InspectDataSheet);*/
                        dcheader.SETRANGE(dcheader."No.","No.");
                        REPORT.RUN(33000895,TRUE,FALSE,dcheader);

                    end;
                }
                action("Request For Authorization")
                {
                    Caption = 'Request For Authorization';
                    Image = SendApprovalRequest;

                    trigger OnAction();
                    begin
                        IF Status=Status::Released THEN
                          ERROR('Request Already in Released Mode');
                        Body:='';
                        "Mail-Id".SETRANGE("Mail-Id"."User Security ID",USERID);
                        IF "Mail-Id".FINDFIRST THEN
                        "from Mail":="Mail-Id".MailID
                        ELSE
                        ERROR('You do not Have Mail id in ERP & Please Tell the ERP Administrator to Create your Mail id');

                        IF SessionCode='' THEN
                        ERROR('Enter Session Code');
                        IF "Mode Of Transport"='' THEN
                        ERROR('Enter the Mode Of Transport');
                        IF "Location Name"='' THEN
                        ERROR('DC location not Specified');
                        IF "Customer No."='' THEN
                        ERROR('Enter the Person to whom the DC');
                        IF Indented='' THEN
                        ERROR('Enter the Authorized Person Information');

                        DCL.RESET;
                        DCL.SETFILTER(DCL."Document No.","No.");
                        DCL.SETFILTER(DCL.Description,'<>%1','');
                        DCL.SETFILTER(DCL.Quantity,'%1',0);
                        IF  DCL.FINDFIRST THEN
                          ERROR('There is no quantity to Request for Authorization');

                        DCL.RESET;
                        DCL.SETFILTER(DCL."Document No.","No.");
                        DCL.SETFILTER(DCL.Description,'<>%1','');
                        DCL.SETFILTER(DCL.Quantity,'%1',0);
                        IF DCL.FINDFIRST THEN
                          ERROR('Enter Quantity in Line no %1',DCL."Line No.");

                        "Mail-Id".RESET;
                        "Mail-Id".SETRANGE("Mail-Id"."User Security ID",Indented);
                        IF "Mail-Id".FINDFIRST THEN
                        BEGIN
                        IF "Mail-Id".levels=TRUE THEN
                        Mail_to:="Mail-Id".MailID
                        ELSE
                        ERROR('You are Specified UnAuthorized person & If any Modification Please Contact ERP Administrtor');
                        END;

                        IF Remarks='' THEN
                        ERROR('Please Enter DC purpose in Remarks column');

                        Subject:='DC Request for Authorisation'+FORMAT("No.");
                        Body+='<body><strong><form><table style="WIDTH:400px; HEIGHT: 20px; FONT-WEIGHT: bold"';
                        Body+='border="1" align="center">';
                        Body+='<tr><td>Requested No</td><td>'+"No."+'</td></tr><br>';
                        Body+='<tr><td>Requested User</td><td>'+"User Id"+':  '+"Reciver Name"+'</td></tr><br>';
                        //Body+='<tr><td>Project Name</td><td>'+"Proj Description"+'</td></tr>';
                        Body+='<tr><td bgcolor="green">'; //#009900
                        Body+='<a Href="http://192.168.0.155:5556/erp_reports/Mat_Auth.aspx?val1='+FORMAT("No.")+'&val2='+FORMAT("User Id");
                        Body+='&val3='+FORMAT(Indented);
                        Body+='&val4=1';
                        Body+='&val5='+Mail_to;
                        Body+='&val6='+"from Mail";
                        Body+='&val7=Accepted"target="_blank">';
                        Body+='<font face="arial" color="#ffffff">ACCEPT</font></a>';
                        Body+='</td><td bgcolor="red">';
                        Body+='<a Href="http://192.168.0.155:5556/erp_reports/Mat_Auth.aspx?val1='+FORMAT("No.");
                        Body+='&val2='+FORMAT("User Id");
                        Body+='&val3='+FORMAT(Indented);
                        Body+='&val4=0';
                        Body+='&val5='+Mail_to;
                        Body+='&val6='+"from Mail";
                        Body+='&val7=Rejected';
                        Body+='"target="_blank">';
                        Body+='<font face="arial" color="#ffffff">REJECT</font></a></td></tr>';
                        Body+='</table></form></font></strong></body>';
                        dcheader.SETRANGE(dcheader."No.","No.");
                        IF dcheader.FINDFIRST THEN
                        REPORT.RUN(50193,FALSE,FALSE,dcheader);
                        REPORT.SAVEASHTML(50193,'\\erpserver\ErpAttachments\ErpAttachments1\'+CONVERT("No.")+'.htm',FALSE,dcheader);
                        Attachment:='\\erpserver\ErpAttachments\ErpAttachments1\'+CONVERT("No.")+'.htm';
                        SMTP_MAIL.CreateMessage("Mail-Id"."User Name","from Mail",Mail_to,Subject,Body,TRUE);
                        SMTP_MAIL.AddAttachment(Attachment,'');//EFFUPG Added ('')
                        SMTP_MAIL.Send;
                        MESSAGE('Mail Has been Sent');
                    end;
                }
            }
            action(Refresh)
            {
                Caption = 'Refresh';
                Image = RefreshLines;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    IF Status<>Status::Released THEN
                    BEGIN
                    IF ISCLEAR(SQLConnection) THEN
                      CREATE(SQLConnection,FALSE,TRUE);// Rev01
                    
                    IF ISCLEAR(RecordSet) THEN
                      CREATE(RecordSet,FALSE,TRUE);// Rev01
                    
                    IF ConnectionOpen<>1 THEN
                    BEGIN
                      SQLConnection.ConnectionString :='DSN=salinvoiceuser;UID=salinvoiceuser;PASSWORD=salinvoiceuser;SERVER=oracle_80;';
                      SQLConnection.Open;
                      SQLConnection.BeginTrans;
                      ConnectionOpen:=1;
                    END;
                    SQLQuery := 'select requestid,status from materialauthor where (status=1) and materialauthor.requestid='''+FORMAT("No.")+'''';
                    //MESSAGE(SQLQuery);
                    RecordSet := SQLConnection.Execute(SQLQuery,RowCount);
                    //MESSAGE(FORMAT(RowCount));
                    IF RowCount < -1 THEN
                      ERROR('Request not yet authorized to Refresh the data')
                    ELSE
                    BEGIN
                    IF NOT((RecordSet.BOF) OR (RecordSet.EOF)) THEN
                      RecordSet.MoveFirst;
                    
                    WHILE NOT RecordSet.EOF DO
                      BEGIN
                    
                        IF ("No."=FORMAT(RecordSet.Fields.Item('requestid').Value))  THEN
                        BEGIN
                          VALIDATE(Status,Status::Released);
                          VALIDATE(Authorized,Indented);
                          VALIDATE("Authorized name","Indented Name");
                         /*
                         VALIDATE("Released By","Request for Authorization");
                          "Posting Date":=TODAY;
                          IF "Authorized Date"=0D THEN
                            "Authorized Date":=TODAY;
                            */
                          MODIFY;
                          MESSAGE('Data Refreshed');
                        END;
                        RecordSet.MoveNext;
                     END;
                    END;
                    END ELSE
                    ERROR('The Request has Already in the Released Mode');

                end;
            }
            action("Send DC Mail")
            {

                trigger OnAction();
                begin
                    MailDC();
                end;
            }
        }
    }

    var
        dcheader : Record "DC Header";
        "Mail-Id" : Record User;
        "from Mail" : Text[150];
        "to mail" : Text[1000];
        Mail_Subject : Text[1000];
        Mail_Body : Text[1000];
        mail : Codeunit Mail;
        newline : Char;
        SMTP_MAIL : Codeunit "SMTP Mail";
        Attachment1 : Text[1000];
        Body : Text[1000];
        Mail_to : Text[1000];
        Subject : Text[1000];
        SQLQuery : Text[1000];
        ConnectionOpen : Integer;
        RowCount : Integer;
        DCL : Record "DC Line";
        Attachment : Text[1000];
        Cust : Record Customer;
        Vend : Record Vendor;
        EMP : Record Employee;
        USER : Record User;
        Fname : Text[100];
        [InDataSet]
        sendmailVisible : Boolean;
        ".......Rev01........" : Integer;
        SQLConnection : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000514-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Connection";
        RecordSet : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000535-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Recordset";
        Dchdr : Record "DC Header";
        DCMail : Codeunit "SMTP Mail";
        dcLine : Integer;
        dcnum : Code[20];
        docnum : Code[30];
        Courier : Code[30];
        DIMENSIONS : Record "Dimension Value";

    [LineStart(6030)]
    procedure CONVERT(No : Code[20]) NEW_NO : Code[20];
    var
        i : Integer;
    begin
        NEW_NO:='';
        FOR i:=1 TO STRLEN(No) DO
        BEGIN
        IF COPYSTR(No,i,1)<>'/' THEN
          NEW_NO:=NEW_NO+COPYSTR(No,i,1)
        ELSE
          NEW_NO:=NEW_NO+'_';
        END;
    end;

    [LineStart(6040)]
    local procedure sendmailOnPush();
    begin
        IF sendmail THEN
        BEGIN
          newline:=10;
          Mail_Subject:='DC Information  '+"No.";
          Mail_Body:='DC Information     : '+"No.";
          Mail_Body+=FORMAT(newline);
          Mail_Body+=FORMAT(newline);
          Mail_Body+=FORMAT(newline);
          Mail_Body+='***** Auto Mail Generated From ERP *****';
          "Mail-Id".SETRANGE("Mail-Id"."User Security ID",USERID);
          IF "Mail-Id".FINDFIRST THEN
           "from Mail":="Mail-Id".MailID;

          dcheader.RESET;
          dcheader.SETFILTER(dcheader."No.","No.");
          IF dcheader.FINDFIRST THEN
          BEGIN
            Fname:='\\erpserver\ErpAttachments\dcdetails'+COPYSTR("No.",15,3)+'.html';
            REPORT.SAVEASHTML(50193,Fname,FALSE,dcheader);
            Attachment1:=Fname;
          END;
          "Mail-Id".RESET;
          "Mail-Id".GET(Indented);
          "to mail":='nayomi@efftronics.com,sundar@efftronics.com,'+"Mail-Id".MailID;

          EMP.RESET;
          EMP.SETFILTER(EMP."No.",Reciver);
          EMP.SETFILTER(EMP."E-Mail",'<>%1','');
          IF EMP.FINDFIRST THEN
          BEGIN
            "to mail"+=','+EMP."E-Mail";
          END;
          IF ( "from Mail"<>'') AND ("to mail"<>'') THEN
          BEGIN
             "from Mail":='erp@efftronics.com';
              SMTP_MAIL.CreateMessage('EFF',"from Mail","to mail",Mail_Subject,Mail_Body,FALSE);
              SMTP_MAIL.AddAttachment(Attachment1,'');//EFFUPG Added ('')
              SMTP_MAIL.Send;
          END;
        END;
    end;

    [LineStart(6082)]
    procedure MailDC();
    var
        Custmr : Record Customer;
        Cust_Name : Text[50];
    begin
        Dchdr.RESET;
        Dchdr.SETFILTER(Dchdr."Created Date",'>01-12-2014');
        Dchdr.SETFILTER(Dchdr.sendmail,'%1',FALSE);
        //Dchdr.SETFILTER(Dchdr.Status,'%1',Dchdr.Status:: Released);
        
        IF Dchdr.FINDFIRST THEN
        REPEAT
          IF COPYSTR(Dchdr."No.",1,3)='CUS' THEN
          BEGIN
            "from Mail":='erp@efftronics.com';
            "Mail-Id".RESET;
            "Mail-Id".SETFILTER("Mail-Id"."User Name",Dchdr.Indented);
            IF "Mail-Id".FINDFIRST THEN
            "to mail":="Mail-Id".MailID;
        
            USER.RESET;
            USER.SETFILTER(USER."User Name",Dchdr.Reciver);
            IF USER.FINDFIRST THEN
              BEGIN
              IF (USER.EmployeeID<>'') AND  (USER.MailID <>'')  THEN
                BEGIN
                  IF   "to mail" <> '' THEN
                     "to mail"+=','+USER.MailID
                  ELSE
                     "to mail" :=USER.MailID;
              END;
              /*
               IF USER.EmployeeID<>''  THEN
                BEGIN
                EMP.RESET;
                EMP.SETFILTER(EMP."No.",USER.EmployeeID);
                EMP.SETFILTER(EMP."E-Mail",'<>%1','');
                IF EMP.FINDFIRST THEN
                BEGIN
                  IF   "to mail" <> '' THEN
                  "to mail"+=','+EMP."E-Mail"
                  ELSE
                     "to mail" :=EMP."E-Mail";
                END;
              END;
              */
            END;
           // "to mail" :='rakesht@efftronics.com';
            //dcheader.RESET;
            //dcheader.SETFILTER(dcheader."No.",Dchdr."No.");
            //IF dcheader.FINDFIRST THEN
            //BEGIN
             // Fname:='\\erpserver\ErpAttachments\dcdetails'+COPYSTR(dcheader."No.",15,3)+'.pdf';
            //  REPORT.SAVEASPDF(33000896,Fname,dcheader);
            //  Attachment1:=Fname;
            //END;
            //  "to mail":='mnraju@efftronics.com';
        
            IF ( "from Mail"<>'') AND ("to mail"<>'') THEN
            BEGIN
             // "from Mail":='erp@efftronics.com';
             "to mail"+=',erp@efftronics.com,nagalakshmi@efftronics.com,srivalli@efftronics.com';
              Mail_Subject:='ERP - DC Information '+Dchdr."No.";
              DCMail.CreateMessage('ERP',"from Mail","to mail",Mail_Subject,Mail_Body,TRUE);
              DCMail.AppendBody('<html><head><style> divone{background-color: white; width: 700px; padding: 20px; border-style:solid ; border-color:#666699;  margin: 20px;} </style></head>');
              DCMail.AppendBody('<body><div style="border-color:#025E4D;  margin: 20px; border-width:15px;   border-style:solid; padding: 20px; width: 600px;"><label><font size="6"> DC Information</font></label>');
              DCMail.AppendBody('<hr style=solid; color= #3333CC>');
              DCMail.AppendBody('<h>Dear Sir/Madam,</h><br>');
              DCMail.AppendBody('<P>DC Information details</P>');
        
              //Added by Rakesh on 01-Jan-15
              dcnum  := '';
              docnum := '';
              Courier := '';
              SQLQuery := '';
              IF ISCLEAR(SQLConnection) THEN
                CREATE(SQLConnection,FALSE,TRUE);
              IF ISCLEAR(RecordSet) THEN
                CREATE(RecordSet,FALSE,TRUE);
              SQLConnection.ConnectionString := 'DSN=intranet;UID=sa;PASSWORD=admin@123;SERVER:=intranet;providerName=System.Data.SqlClient;';
              SQLConnection.Open;
              SQLQuery :=  ' SELECT  nvarchar4 AS CITY, nvarchar6 AS MODE, nvarchar7 AS DOCNUM, nvarchar1 AS DC FROM  [WSS_Content].[dbo].[AllUserData] '+
                           ' WHERE (tp_ListId = '+'''D9CE8F4F-70CA-45C8-BD9D-67AC0531848C'')'+' and (nvarchar1 like ''%'+FORMAT(Dchdr."No.")+'%'') '+
                           ' ORDER BY [tp_Created] DESC';
              RecordSet :=SQLConnection.Execute(SQLQuery);
              IF NOT (RecordSet.EOF OR RecordSet.BOF) THEN
              BEGIN
               /*
                IF NOT ISNULL(RecordSet.Fields.Item('DC').Value) THEN
                  dcnum  := FORMAT(RecordSet.Fields.Item('DC').Value);
               */// Commented by Pranavi on 19-Jul-2016
                 IF NOT ISNULL(RecordSet.Fields.Item('DOCNUM').Value) THEN
                  docnum := FORMAT(RecordSet.Fields.Item('DOCNUM').Value);
                IF NOT ISNULL(RecordSet.Fields.Item('MODE').Value) THEN
                  Courier := FORMAT(RecordSet.Fields.Item('MODE').Value);
              END;
              SQLConnection.Close;
             // end by Rakesh
             // Added by Pranavi on 30-Jan-2016 to include cust name if led cards dc
             Cust_Name:='';
             IF Dchdr."Location Code" = 'LED-GEN' THEN
             BEGIN
               Custmr.RESET;
               Custmr.SETRANGE(Custmr."No.",Dchdr."Customer No.");
               IF Custmr.FINDFIRST THEN
               BEGIN
                Cust_Name := Custmr.Name;
               END;
             END;
        
              DCMail.AppendBody('<table border="1" style="border-collapse:collapse; width:100%; font-size:10pt;"><tr><td width="40%"><b> DC No. </b> </td><td>'+Dchdr."No."+'</td></tr>');
              DCMail.AppendBody('<tr><td><b> Location name </b> </td><td>' +Dchdr."Location Name"+'</td></tr>');
              IF (Dchdr."Location Code" = 'LED-GEN') AND (Cust_Name <> '') THEN
                DCMail.AppendBody('<tr><td><b> Customer </b> </td><td>' +Cust_Name+'</td></tr>');  // Added by Pranavi on 30-Jan-2016 to include cust name if led cards dc
              IF Dchdr."Indented Name"<>'' THEN
                DCMail.AppendBody('<tr><td><b>Manager</b>  </td><td>'+Dchdr."Indented Name"+'</td></tr>')
              ELSE
                DCMail.AppendBody('<tr><td><b>Manager</b>  </td><td>'+dcheader.Indented+'</td></tr>');
        
              DCMail.AppendBody('<tr><td><b>Receiver</b>  </td><td>'+Dchdr."Reciver Name"+'</td></tr>');
              DCMail.AppendBody('<tr><td><b>  LR Number </b>  </td><td>'+Dchdr."L.R Number"+'</td></tr>');
              DCMail.AppendBody('<tr><td><b> Mode of transport   </b> </td><td>'+Dchdr."Mode Of Transport"+'</td></tr>');
              DCMail.AppendBody('<tr><td><b> Courier agent </b> </td><td>'+Courier+'</td></tr>');
              DCMail.AppendBody('<tr><td><b> Courier Doc no.   </b> </td><td>'+docnum+'</td></tr>');
              DCMail.AppendBody('<tr><td><b> DC generated date </b></td><td>'+FORMAT(Dchdr."Created Date")+'</td></tr>');
        
        
              DCMail.AppendBody('<tr><td><b> Authorized by  </b> </td><td>'+Dchdr."StoreIncharge Name"+'</td></tr>');
              DCMail.AppendBody('<tr><td><b> Remarks </b></td><td>' +Dchdr.Remarks+'</td></tr></table><br>');
              DCMail.AppendBody('<br>');
              DCMail.AppendBody('<table border="1" style="border-collapse:collapse; width:100%; font-size:10pt;"><tr><th><b>Item no.</b> </th><th>Item Description </th> <th>Quantity</th><TH>Non-Returnable</TH></tr>');
              DCL.RESET;
              DCL.SETFILTER(DCL."Document No.",Dchdr."No.");
              IF DCL.FINDSET THEN
              REPEAT
              DCMail.AppendBody('<tr><td>'+DCL."No."+'</td><td>'+DCL.Description+'</td><TD>'+FORMAT(DCL.Quantity)+'</TD><TD>'+FORMAT(DCL."Non-Returnable")+'</TD></tr>');
        
              UNTIL DCL.NEXT=0;
              DCMail.AppendBody('</TABLE>');
        
              DCMail.AppendBody('<BR><p align ="left"> Regards,<br>ERP Team </p>');
              DCMail.AppendBody('<br><p align = "center">::::Note: Auto Generated mail from ERP:::: </b></P></div></body></html>');
        
        
              DCMail.AddAttachment(Attachment1,'');//EFFUPG Added ('')
              DCMail.Send;
              IF docnum <> '' THEN
                Dchdr."Docket No" := docnum
              ELSE
                Dchdr."Docket No" :=  'NOT AVAILABLE';
              Dchdr."Courier Agency Name" := Courier;
              Dchdr.sendmail := TRUE;
              Dchdr.MODIFY(TRUE);
            END;
          END;
        //END;
        UNTIL Dchdr.NEXT=0;
        MESSAGE('DC MAILS SUCCESSFULLY SENT');

    end;

    [LineStart(6237)]
    procedure MailDC_NEW();
    var
        Custmr : Record Customer;
        Cust_Name : Text[50];
    begin
        Dchdr.RESET;
        Dchdr.SETFILTER(Dchdr."Created Date",'>%1&<=%2',120114D,TODAY()-1);
        Dchdr.SETFILTER(Dchdr.sendmail,'%1',FALSE);
        //Dchdr.SETFILTER(Dchdr.Status,'%1',Dchdr.Status:: Released);
        
        IF Dchdr.FINDFIRST THEN
        REPEAT
          IF COPYSTR(Dchdr."No.",1,3)='CUS' THEN
          BEGIN
            "from Mail":='erp@efftronics.com';
            "Mail-Id".RESET;
            "Mail-Id".SETFILTER("Mail-Id"."User Name",Dchdr.Indented);
            IF "Mail-Id".FINDFIRST THEN
            "to mail":="Mail-Id".MailID;
        
            USER.RESET;
            USER.SETFILTER(USER."User Name",Dchdr.Reciver);
            IF USER.FINDFIRST THEN
              BEGIN
              IF (USER.EmployeeID<>'') AND  (USER.MailID <>'')  THEN
                BEGIN
                  IF   "to mail" <> '' THEN
                     "to mail"+=','+USER.MailID
                  ELSE
                     "to mail" :=USER.MailID;
              END;
              /*
               IF USER.EmployeeID<>''  THEN
                BEGIN
                EMP.RESET;
                EMP.SETFILTER(EMP."No.",USER.EmployeeID);
                EMP.SETFILTER(EMP."E-Mail",'<>%1','');
                IF EMP.FINDFIRST THEN
                BEGIN
                  IF   "to mail" <> '' THEN
                  "to mail"+=','+EMP."E-Mail"
                  ELSE
                     "to mail" :=EMP."E-Mail";
                END;
              END;
              */
            END;
           // "to mail" :='rakesht@efftronics.com';
            //dcheader.RESET;
            //dcheader.SETFILTER(dcheader."No.",Dchdr."No.");
            //IF dcheader.FINDFIRST THEN
            //BEGIN
             // Fname:='\\erpserver\ErpAttachments\dcdetails'+COPYSTR(dcheader."No.",15,3)+'.pdf';
            //  REPORT.SAVEASPDF(33000896,Fname,dcheader);
            //  Attachment1:=Fname;
            //END;
            //  "to mail":='mnraju@efftronics.com';
        
            IF ( "from Mail"<>'') AND ("to mail"<>'') THEN
            BEGIN
             // "from Mail":='erp@efftronics.com';
             "to mail"+=',erp@efftronics.com,nagalakshmi@efftronics.com,srivalli@efftronics.com';
             IF (Dchdr."Mode Of Transport"='Courier') AND (Dchdr."Doc Number entered" <>'') THEN  //Required by rama gopal sir to restrict the no of mails to logistics
               "to mail"+=',logistics@efftronics.com';
              Mail_Subject:='ERP - DC Information '+Dchdr."No.";
              DCMail.CreateMessage('ERP',"from Mail","to mail",Mail_Subject,Mail_Body,TRUE);
              DCMail.AppendBody('<html><head><style> divone{background-color: white; width: 700px; padding: 20px; border-style:solid ; border-color:#666699;  margin: 20px;} </style></head>');
              DCMail.AppendBody('<body><div style="border-color:#025E4D;  margin: 20px; border-width:15px;   border-style:solid; padding: 20px; width: 600px;"><label><font size="6"> DC Information</font></label>');
              DCMail.AppendBody('<hr style=solid; color= #3333CC>');
              DCMail.AppendBody('<h>Dear Sir/Madam,</h><br>');
              DCMail.AppendBody('<P>DC Information details</P>');
        
              //Added by Rakesh on 01-Jan-15
              dcnum  := '';
              docnum := '';
              Courier := '';
        //**********************************************************************************************************************
             /* SQLQuery := '';
              IF ISCLEAR(SQLConnection) THEN
                CREATE(SQLConnection,FALSE,TRUE);
              IF ISCLEAR(RecordSet) THEN
                CREATE(RecordSet,FALSE,TRUE);
              SQLConnection.ConnectionString := 'DSN=intranet;UID=sa;PASSWORD=admin@123;SERVER:=intranet;providerName=System.Data.SqlClient;';
              SQLConnection.Open;
              SQLQuery :=  ' SELECT  nvarchar4 AS CITY, nvarchar6 AS MODE, nvarchar7 AS DOCNUM, nvarchar1 AS DC FROM  [WSS_Content].[dbo].[AllUserData] '+
                           ' WHERE (tp_ListId = '+'''D9CE8F4F-70CA-45C8-BD9D-67AC0531848C'')'+' and (nvarchar1 like ''%'+FORMAT(Dchdr."No.")+'%'') '+
                           ' ORDER BY [tp_Created] DESC';
              RecordSet :=SQLConnection.Execute(SQLQuery);
              IF NOT (RecordSet.EOF OR RecordSet.BOF) THEN
              BEGIN
               {
                IF NOT ISNULL(RecordSet.Fields.Item('DC').Value) THEN
                  dcnum  := FORMAT(RecordSet.Fields.Item('DC').Value);
               }// Commented by Pranavi on 19-Jul-2016
                 IF NOT ISNULL(RecordSet.Fields.Item('DOCNUM').Value) THEN
                  docnum := FORMAT(RecordSet.Fields.Item('DOCNUM').Value);
                IF NOT ISNULL(RecordSet.Fields.Item('MODE').Value) THEN
                  Courier := FORMAT(RecordSet.Fields.Item('MODE').Value);
              END;
              SQLConnection.Close;
              */
        //**********************************************************************************************************************
              docnum := Dchdr."Doc Number entered";
              Courier := Dchdr."Mode Entered";
        
        
             // end by Rakesh
             // Added by Pranavi on 30-Jan-2016 to include cust name if led cards dc
             Cust_Name:='';
             IF Dchdr."Location Code" = 'LED-GEN' THEN
             BEGIN
               Custmr.RESET;
               Custmr.SETRANGE(Custmr."No.",Dchdr."Customer No.");
               IF Custmr.FINDFIRST THEN
               BEGIN
                Cust_Name := Custmr.Name;
               END;
             END;
        
              DCMail.AppendBody('<table border="1" style="border-collapse:collapse; width:100%; font-size:10pt;"><tr><td width="40%"><b> DC No. </b> </td><td>'+Dchdr."No."+'</td></tr>');
              DCMail.AppendBody('<tr><td><b> Location name </b> </td><td>' +Dchdr."Location Name"+'</td></tr>');
              IF (Dchdr."Location Code" = 'LED-GEN') AND (Cust_Name <> '') THEN
                DCMail.AppendBody('<tr><td><b> Customer </b> </td><td>' +Cust_Name+'</td></tr>');  // Added by Pranavi on 30-Jan-2016 to include cust name if led cards dc
              IF Dchdr."Indented Name"<>'' THEN
                DCMail.AppendBody('<tr><td><b>Manager</b>  </td><td>'+Dchdr."Indented Name"+'</td></tr>')
              ELSE
                DCMail.AppendBody('<tr><td><b>Manager</b>  </td><td>'+dcheader.Indented+'</td></tr>');
        
              DCMail.AppendBody('<tr><td><b>Receiver</b>  </td><td>'+Dchdr."Reciver Name"+'</td></tr>');
              DCMail.AppendBody('<tr><td><b>  LR Number </b>  </td><td>'+Dchdr."L.R Number"+'</td></tr>');
              DCMail.AppendBody('<tr><td><b> Mode of transport   </b> </td><td>'+Dchdr."Mode Of Transport"+'</td></tr>');
              DCMail.AppendBody('<tr><td><b> Courier agent </b> </td><td>'+Courier+'</td></tr>');
              DCMail.AppendBody('<tr><td><b> Courier Doc no.   </b> </td><td>'+docnum+'</td></tr>');
              DCMail.AppendBody('<tr><td><b> DC generated date </b></td><td>'+FORMAT(Dchdr."Created Date")+'</td></tr>');
              DCMail.AppendBody('<tr><td><b> Authorized by  </b> </td><td>'+Dchdr."StoreIncharge Name"+'</td></tr>');
              DCMail.AppendBody('<tr><td><b> Remarks </b></td><td>' +Dchdr.Remarks+'</td></tr>');
              //Added by Vishnu Priya to include the address also in DC Mails on 04-02-2020
              DIMENSIONS.RESET;
              DIMENSIONS.SETFILTER("Dimension Code",'LOCATIONS');
              DIMENSIONS.SETFILTER(Blocked,'No');
              DIMENSIONS.SETFILTER(Code,Dchdr."Location Code");
              IF DIMENSIONS .FINDFIRST THEN
                      DCMail.AppendBody('<tr><td><b> Address </b></td><td>' +FORMAT(DIMENSIONS.Address1)+'</td></tr>')
              ELSE
                      DCMail.AppendBody('<tr><td><b> Address </b></td><td>' +' '+'</td></tr>');
              //Added by Vishnu Priya to include the address also in DC Mails on 04-02-2020
              DCMail.AppendBody('</table><br>');
              DCMail.AppendBody('<br>');
              DCMail.AppendBody('<table border="1" style="border-collapse:collapse; width:100%; font-size:10pt;"><tr><th><b>Item no.</b> </th><th>Item Description </th> <th>Quantity</th><TH>Non-Returnable</TH></tr>');
              DCL.RESET;
              DCL.SETFILTER(DCL."Document No.",Dchdr."No.");
              IF DCL.FINDSET THEN
              REPEAT
              DCMail.AppendBody('<tr><td>'+DCL."No."+'</td><td>'+DCL.Description+'</td><TD>'+FORMAT(DCL.Quantity)+'</TD><TD>'+FORMAT(DCL."Non-Returnable")+'</TD></tr>');
              UNTIL DCL.NEXT=0;
              DCMail.AppendBody('</TABLE>');
        
              DCMail.AppendBody('<BR><p align ="left"> Regards,<br>ERP Team </p>');
              DCMail.AppendBody('<br><p align = "center">::::Note: Auto Generated mail from ERP:::: </b></P></div></body></html>');
        
        
              DCMail.AddAttachment(Attachment1,'');//EFFUPG Added ('')
              DCMail.Send;
              IF docnum <> '' THEN
                Dchdr."Docket No" := docnum
              ELSE
                Dchdr."Docket No" :=  'NOT AVAILABLE';
              Dchdr."Courier Agency Name" := Courier;
              Dchdr.sendmail := TRUE;
              Dchdr.MODIFY(TRUE);
            END;
          END;
        //END;
        UNTIL Dchdr.NEXT=0;
        MESSAGE('DC MAILS SUCCESSFULLY SENT');

    end;

    //event RecordSet(cFields : Integer;"Fields" : Variant;adStatus : Integer;pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset");
    //begin
        /*
        */
    //end;

    //event RecordSet(cFields : Integer;"Fields" : Variant;pError : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000500-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Error";adStatus : Integer;pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset");
    //begin
        /*
        */
    //end;

    //event RecordSet(adReason : Integer;cRecords : Integer;adStatus : Integer;pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset");
    //begin
        /*
        */
    //end;

    //event RecordSet(adReason : Integer;cRecords : Integer;pError : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000500-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Error";adStatus : Integer;pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset");
    //begin
        /*
        */
    //end;

    //event RecordSet(adReason : Integer;adStatus : Integer;pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset");
    //begin
        /*
        */
    //end;

    //event RecordSet(adReason : Integer;pError : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000500-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Error";adStatus : Integer;pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset");
    //begin
        /*
        */
    //end;

    //event RecordSet(adReason : Integer;adStatus : Integer;pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset");
    //begin
        /*
        */
    //end;

    //event RecordSet(adReason : Integer;pError : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000500-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Error";adStatus : Integer;pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset");
    //begin
        /*
        */
    //end;

    //event RecordSet(var fMoreData : Boolean;adStatus : Integer;pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset");
    //begin
        /*
        */
    //end;

    //event RecordSet(Progress : Integer;MaxProgress : Integer;adStatus : Integer;pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset");
    //begin
        /*
        */
    //end;

    //event RecordSet(pError : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000500-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Error";adStatus : Integer;pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset");
    //begin
        /*
        */
    //end;

    //event SQLConnection(pError : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000500-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Error";adStatus : Integer;pConnection : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000550-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Connection");
    //begin
        /*
        */
    //end;

    //event SQLConnection(TransactionLevel : Integer;pError : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000500-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Error";adStatus : Integer;pConnection : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000550-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Connection");
    //begin
        /*
        */
    //end;

    //event SQLConnection(pError : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000500-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Error";adStatus : Integer;pConnection : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000550-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Connection");
    //begin
        /*
        */
    //end;

    //event SQLConnection(pError : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000500-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Error";adStatus : Integer;pConnection : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000550-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Connection");
    //begin
        /*
        */
    //end;

    //event SQLConnection(var Source : Text;CursorType : Integer;LockType : Integer;var Options : Integer;adStatus : Integer;pCommand : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{B08400BD-F9D1-4D02-B856-71D5DBA123E9}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Command";pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset";pConnection : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000550-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Connection");
    //begin
        /*
        */
    //end;

    //event SQLConnection(RecordsAffected : Integer;pError : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000500-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Error";adStatus : Integer;pCommand : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{B08400BD-F9D1-4D02-B856-71D5DBA123E9}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Command";pRecordset : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000556-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Recordset";pConnection : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000550-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Connection");
    //begin
        /*
        */
    //end;

    //event SQLConnection(var ConnectionString : Text;var UserID : Text;var Password : Text;var Options : Integer;adStatus : Integer;pConnection : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000550-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Connection");
    //begin
        /*
        */
    //end;

    //event SQLConnection(pError : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000500-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Error";adStatus : Integer;pConnection : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000550-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Connection");
    //begin
        /*
        */
    //end;

    //event SQLConnection(adStatus : Integer;pConnection : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000550-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'._Connection");
    //begin
        /*
        */
    //end;
}

