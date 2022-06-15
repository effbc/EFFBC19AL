page 60065 "DC Header"
{
    // version B2B1.0,Rev01

    PageType = Document;
    SourceTable = "DC Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; "No.")
                {
                    Editable = false;

                    trigger OnAssistEdit();
                    begin
                        IF AssistEdit THEN
                            CurrPage.UPDATE;
                    end;
                }
                field("Sell-to Customer Name"; "Sell-to Customer Name")
                {
                    Description = '<> ';
                }
                field("From Date"; "From Date")
                {
                    Caption = 'From Date *';
                }
                field(Reciver; Reciver)
                {
                    Caption = 'Receiver';
                    LookupPageID = 59;

                    trigger OnLookup(Text: Text): Boolean;
                    begin
                        User1.RESET;
                        //User1.Setfilter(User1."User Name",Reciver);
                        IF PAGE.RUNMODAL(9800, User1) = ACTION::LookupOK THEN BEGIN
                            Reciver := User1."User Name";
                            "Reciver Name" := User1."Full Name";
                        END;
                    end;
                }
                field(Receptionist; Receptionist)
                {
                }
                field(Indented; Indented)
                {
                    LookupPageID = 59;
                }
                field(StoreIncharge; StoreIncharge)
                {
                }
                field("L.R Number"; "L.R Number")
                {
                }
                field(ModOfTrnsprt; ModOfTrnsprt)
                {
                    Caption = 'Mode Of Transport *';

                    trigger OnValidate();
                    begin
                        "Mode Of Transport" := FORMAT(ModOfTrnsprt);
                    end;
                }
                field("Location Code"; "Location Code")
                {
                }
                field(Type; Type)
                {
                }
                field("Customer No."; "Customer No.")
                {
                    Caption = 'Customer No. *';

                    trigger OnValidate();
                    begin
                        CASE FORMAT(Type) OF
                            '0':
                                BEGIN
                                    Cust.RESET;
                                    Cust.SETFILTER(Cust."No.", "Customer No.");
                                    IF Cust.FINDFIRST THEN BEGIN
                                        "Sell-to Customer Name" := Cust.Name;
                                        MODIFY;
                                    END;
                                END;

                            '1':
                                BEGIN
                                    Vend.RESET;
                                    Vend.SETFILTER(Vend."No.", "Customer No.");
                                    IF Vend.FINDFIRST THEN BEGIN
                                        "Sell-to Customer Name" := Vend.Name;
                                        MODIFY;
                                    END;
                                END;

                            '2':
                                BEGIN
                                    EMP.RESET;
                                    EMP.SETFILTER(EMP."No.", "Customer No.");
                                    IF EMP.FINDFIRST THEN BEGIN
                                        "Sell-to Customer Name" := EMP."Job Title";
                                        MODIFY;
                                    END;
                                END;
                            'Customer':
                                BEGIN
                                    Cust.RESET;
                                    Cust.SETFILTER(Cust."No.", "Customer No.");
                                    IF Cust.FINDFIRST THEN BEGIN
                                        "Sell-to Customer Name" := Cust.Name;
                                        MODIFY;
                                    END;
                                END;

                            'Vendor':
                                BEGIN
                                    Vend.RESET;
                                    Vend.SETFILTER(Vend."No.", "Customer No.");
                                    IF Vend.FINDFIRST THEN BEGIN
                                        "Sell-to Customer Name" := Vend.Name;
                                        MODIFY;
                                    END;
                                END;

                            'Site':
                                BEGIN
                                    EMP.RESET;
                                    EMP.SETFILTER(EMP."No.", "Customer No.");
                                    IF EMP.FINDFIRST THEN BEGIN
                                        "Sell-to Customer Name" := EMP."Job Title";
                                        MODIFY;
                                    END;
                                END;

                        END;
                    end;
                }
                field(sendmail; sendmail)
                {
                    Editable = false;
                    Visible = sendmailVisible;

                    trigger OnValidate();
                    begin
                        sendmailOnPush;
                    end;
                }
                field(SessionCode; SessionCode)
                {
                }
                field("To Date"; "To Date")
                {
                    Caption = 'To Date *';
                }
                field(NonReturnable; NonReturnable)
                {
                    Caption = 'NonReturnable *';
                }
                field("Reciver Name"; "Reciver Name")
                {
                }
                field("Receptionist Name"; "Receptionist Name")
                {
                }
                field("Indented Name"; "Indented Name")
                {
                }
                field("StoreIncharge Name"; "StoreIncharge Name")
                {
                }
                field(Remarks; Remarks)
                {
                }
                field("Location Name"; "Location Name")
                {
                }
                field(Status; Status)
                {
                    Editable = false;
                }
                field("Created Date"; "Created Date")
                {
                }
                field(Returned; Returned)
                {
                    Caption = 'Returned *';

                    trigger OnValidate();
                    begin
                        // Added by Pranavi on 15-11-2016
                        IF Returned = TRUE THEN BEGIN
                            DCL1.RESET;
                            DCL1.SETRANGE(DCL1."Document No.", "No.");
                            DCL1.SETFILTER(DCL1.Quantity, '>%1', 0);
                            DCL1.SETRANGE(DCL1."Non-Returnable", FALSE);
                            IF DCL1.FINDSET THEN
                                REPEAT
                                    IF DCL1."Returned Quantity" <> DCL1.Quantity THEN
                                        ERROR('Returned Quantity must be equal to Quantity in Line No.: ' + FORMAT(DCL1."Line No."));
                                UNTIL DCL1.NEXT = 0;
                            IF "Returned Date" = 0D THEN
                                "Returned Date" := TODAY();
                            DCL1.RESET;
                            DCL1.SETRANGE(DCL1."Document No.", "No.");
                            DCL1.SETFILTER(DCL1.Quantity, '>%1', 0);
                            DCL1.SETRANGE(DCL1."Non-Returnable", FALSE);
                            IF DCL1.FINDSET THEN
                                REPEAT
                                    IF DCL1."Returned Quantity" = DCL1.Quantity THEN BEGIN
                                        DCL1.Returned := TRUE;
                                        DCL1."Returned Date" := "Returned Date";
                                        DCL1.MODIFY;
                                    END;
                                UNTIL DCL1.NEXT = 0;
                        END
                        ELSE BEGIN
                            "Returned Date" := 0D;
                        END;
                        // End by Pranavi
                    end;
                }
                field("Returned Date"; "Returned Date")
                {
                    Editable = false;
                }
                field("Courier Agency Name"; "Courier Agency Name")
                {
                }
                field("Docket No"; "Docket No")
                {
                }
            }
            part(DCLine; "DC Subform")
            {
                SubPageLink = Document No.=FIELD(No.);
            }
            group(Shipping)
            {
                Caption = 'Shipping';
                field("Ship-to Code"; "Ship-to Code")
                {
                }
                field("Ship-to Name"; "Ship-to Name")
                {
                }
                field("Ship-to Name 2"; "Ship-to Name 2")
                {
                }
                field("Ship-to Address"; "Ship-to Address")
                {
                }
                field("Ship-to Address 2"; "Ship-to Address 2")
                {
                }
                field("Ship-to City"; "Ship-to City")
                {
                }
                field("Ship-to Contact"; "Ship-to Contact")
                {
                }
                field("Ship-to Post Code"; "Ship-to Post Code")
                {
                }
                field("Ship-to Country Code"; "Ship-to Country Code")
                {
                }
                field("<L.R Number2>"; "L.R Number")
                {
                }
                field("Vehicle Number"; "Vehicle Number")
                {
                }
                field("Received By"; "Received By")
                {
                }
                field("Checked By"; "Checked By")
                {
                }
                field("Prepared By"; "Prepared By")
                {
                }
                field("Posted Shipment No."; "Posted Shipment No.")
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
                        TESTFIELD(Status, Status::Open);
                        //TESTFIELD("Posted Shipment No.");
                        IF NOT (USERID IN ['EFFTRONICS\PARDHU', 'EFFTRONICS\BRAHMAIAH', 'EFFTRONICS\RENUKACH', 'EFFTRONICS\RAVIKIRAN']) THEN BEGIN
                            USER.RESET;
                            USER.SETFILTER(USER."User Security ID", USERSECURITYID);
                            USER.SETFILTER(USER.levels, '%1', TRUE);
                            IF NOT USER.FINDFIRST THEN
                                ERROR('U Dont Have Rights to Authorize');
                        END;
                        IF "From Date" = 0D THEN
                            ERROR('Please Enter From Date!');
                        IF (NonReturnable = FALSE) AND ("To Date" = 0D) THEN
                            ERROR('Please Enter To Date as there are Returnable Items!');
                        IF ("Mode Of Transport" = '') OR ("Mode Of Transport" = ' ') THEN
                            ERROR('Please Enter Mode Of Transport!');
                        IF ("Customer No." = '') OR ("Customer No." = ' ') THEN
                            ERROR('Please Enter Customer No.!');
                        IF NOT CONFIRM('Do you want to release the DC') THEN
                            EXIT;
                        Status := Status::Released;
                        Authorized := USERID;
                        MODIFY;
                        CurrPage.UPDATE;
                    end;
                }
                action("Report")
                {
                    Caption = 'Report';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'Ctrl+p';

                    trigger OnAction();
                    begin
                        /*InspectDataSheet.SETRANGE("No.","No.");
                        REPORT.RUN(33000250,TRUE,FALSE,InspectDataSheet);*/
                        TESTFIELD(Status, Status::Released);
                        dcheader.SETRANGE(dcheader."No.", "No.");
                        REPORT.RUN(33000895, TRUE, FALSE, dcheader);

                    end;
                }
                action(Reopen)
                {
                    Caption = 'Reopen';
                    Image = ReOpen;

                    trigger OnAction();
                    begin
                        TESTFIELD(Status, Status::Released);
                        IF NOT (USERID IN ['EFFTRONICS\PARDHU', 'EFFTRONICS\BRAHMAIAH', 'EFFTRONICS\RENUKACH', 'EFFTRONICS\RAVIKIRAN']) THEN BEGIN
                            USER.RESET;
                            USER.SETFILTER(USER."User Security ID", USERSECURITYID);
                            USER.SETFILTER(USER.levels, '%1', TRUE);
                            IF NOT USER.FINDFIRST THEN
                                ERROR('U Dont Have Rights to reopen');
                        END;
                        IF NOT CONFIRM('Do you want to reopen the DC') THEN
                            EXIT;
                        Status := Status::Open;
                        Authorized := USERID;
                        MODIFY;
                        CurrPage.UPDATE;
                    end;
                }
                action("Request For Authorization")
                {
                    Caption = 'Request For Authorization';
                    Image = SendApprovalRequest;

                    trigger OnAction();
                    begin
                        IF Status = Status::Released THEN
                            ERROR('Request Already in Released Mode');
                        Body := '';
                        "Mail-Id".SETRANGE("Mail-Id"."User Name", USERID);
                        IF "Mail-Id".FINDFIRST THEN BEGIN
                            IF "Mail-Id".MailID <> '' THEN
                                "from Mail" := "Mail-Id".MailID
                            ELSE
                                ERROR('You do not Have Mail id in ERP & Please Tell the ERP Administrator to Create your Mail id');
                        END
                        ELSE
                            "from Mail" := 'erp@efftronics.com';

                        IF SessionCode = '' THEN
                            ERROR('Enter Session Code');
                        IF "Mode Of Transport" = '' THEN
                            ERROR('Enter the Mode Of Transport');
                        IF "Location Name" = '' THEN
                            ERROR('DC location not Specified');
                        IF "Customer No." = '' THEN
                            ERROR('Enter the Person to whom the DC');
                        IF Indented = '' THEN
                            ERROR('Enter the Authorized Person Information');

                        DCL.RESET;
                        DCL.SETFILTER(DCL."Document No.", "No.");
                        DCL.SETFILTER(DCL.Description, '<>%1', '');
                        DCL.SETFILTER(DCL.Quantity, '%1', 0);
                        IF DCL.FINDFIRST THEN
                            ERROR('There is no quantity to Request for Authorization in line: ' + FORMAT(DCL."Line No."));

                        DCL.RESET;
                        DCL.SETFILTER(DCL."Document No.", "No.");
                        DCL.SETFILTER(DCL.Description, '<>%1', '');
                        DCL.SETFILTER(DCL.Quantity, '%1', 0);
                        IF DCL.FINDFIRST THEN
                            ERROR('Enter Quantity in Line no %1', DCL."Line No.");

                        "Mail-Id".RESET;
                        "Mail-Id".SETRANGE("Mail-Id"."User Name", Indented);
                        IF "Mail-Id".FINDFIRST THEN BEGIN
                            IF "Mail-Id".levels = TRUE THEN
                                Mail_to := "Mail-Id".MailID
                            ELSE
                                ERROR('You are Specified UnAuthorized person & If any Modification Please Contact ERP Administrtor');
                        END;

                        IF Remarks = '' THEN
                            ERROR('Please Enter DC purpose in Remarks column');

                        Subject := 'ERP- DC Request for Authorisation' + FORMAT("No.");
                        Body += '<body><strong><form><table style="WIDTH:400px; HEIGHT: 20px; FONT-WEIGHT: bold"';
                        Body += 'border="1" align="center">';
                        Body += '<tr><td>Requested No</td><td>' + "No." + '</td></tr><br>';
                        Body += '<tr><td>Requested User</td><td>' + "User Id" + ':  ' + "Reciver Name" + '</td></tr><br>';
                        //Body+='<tr><td>Project Name</td><td>'+"Proj Description"+'</td></tr>';
                        Body += '<tr><td bgcolor="green">'; //#009900

                        //mnraju
                        UserSetup.RESET;
                        UserSetup.SETRANGE("User ID", USERID);
                        IF UserSetup.FINDFIRST THEN BEGIN
                            CurrentUserID := UserSetup."Current UserId";
                        END;
                        //mnraju

                        Body += '<a Href="http://192.168.50.155:5556/erp_reports/Mat_Auth.aspx?val1=' + FORMAT("No.") + '&val2=' + FORMAT(CurrentUserID);

                        //mnraju
                        UserSetup.RESET;
                        UserSetup.SETRANGE("User ID", Indented);
                        IF UserSetup.FINDFIRST THEN BEGIN
                            AuthorizedID := UserSetup."Current UserId";
                        END;
                        //mnraju

                        Body += '&val3=' + FORMAT(AuthorizedID);
                        Body += '&val4=1';
                        Body += '&val5=' + Mail_to;
                        Body += '&val6=' + "from Mail";
                        Body += '&val7=Accepted"target="_blank">';
                        Body += '<font face="arial" color="#ffffff">ACCEPT</font></a>';
                        Body += '</td><td bgcolor="red">';
                        Body += '<a Href="http://192.168.50.155:5556/erp_reports/Mat_Auth.aspx?val1=' + FORMAT("No.");
                        Body += '&val2=' + FORMAT(CurrentUserID);
                        Body += '&val3=' + FORMAT(AuthorizedID);
                        Body += '&val4=0';
                        Body += '&val5=' + Mail_to;
                        Body += '&val6=' + "from Mail";
                        Body += '&val7=Rejected';
                        Body += '"target="_blank">';
                        Body += '<font face="arial" color="#ffffff">REJECT</font></a></td></tr>';
                        Body += '</table></form></font></strong></body>';
                        dcheader.SETRANGE(dcheader."No.", "No.");
                        IF dcheader.FINDFIRST THEN
                            //REPORT.RUN(50193,FALSE,FALSE,dcheader);
                            REPORT.SAVEASPDF(33000896, '\\erpserver\ErpAttachments\ErpAttachments1\' + CONVERT("No.") + '.pdf', dcheader);
                        Attachment := '\\erpserver\ErpAttachments\ErpAttachments1\' + CONVERT("No.") + '.pdf';
                        SMTP_MAIL.CreateMessage("Mail-Id"."User Name", 'erp@efftronics.com', Mail_to, Subject, Body, TRUE);
                        SMTP_MAIL.AddAttachment(Attachment, '');//EFFUPG Added ('')
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
                    IF Status <> Status::Released THEN BEGIN
                        IF ISCLEAR(SQLConnection) THEN
                            CREATE(SQLConnection, FALSE, TRUE);// Rev01

                        IF ISCLEAR(RecordSet) THEN
                            CREATE(RecordSet, FALSE, TRUE);// Rev01

                        IF ConnectionOpen <> 1 THEN BEGIN
                            SQLConnection.ConnectionString := 'DSN=salinvoiceuser;UID=salinvoiceuser;PASSWORD=salinvoiceuser;SERVER=oracle_80;';
                            SQLConnection.Open;
                            SQLConnection.BeginTrans;
                            ConnectionOpen := 1;
                        END;
                        SQLQuery := 'select requestid,status from materialauthor where (status=1) and materialauthor.requestid=''' + FORMAT("No.") + '''';
                        //MESSAGE(SQLQuery);
                        RecordSet := SQLConnection.Execute(SQLQuery, RowCount);
                        //MESSAGE(FORMAT(RowCount));
                        IF RowCount < -1 THEN
                            ERROR('Request not yet authorized to Refresh the data')
                        ELSE BEGIN
                            IF NOT ((RecordSet.BOF) OR (RecordSet.EOF)) THEN
                                RecordSet.MoveFirst;

                            WHILE NOT RecordSet.EOF DO BEGIN

                                IF ("No." = FORMAT(RecordSet.Fields.Item('requestid').Value)) THEN BEGIN
                                    VALIDATE(Status, Status::Released);
                                    VALIDATE(Authorized, Indented);
                                    VALIDATE("Authorized name", "Indented Name");
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
        }
    }

    trigger OnDeleteRecord(): Boolean;
    begin
        IF NOT (USERID IN ['EFFTRONICS\SUJANI', 'EFFTRONICS\VISHNUPRIYA']) THEN
            ERROR('YOU DO NOT HAVE THE RIGHTS TO DELETE DC');
    end;

    trigger OnInit();
    begin
        sendmailVisible := FALSE;
        IF UPPERCASE(USERID) IN ['EFFTRONICS\PRANAVI', 'EFFTRONICS\VIJAYA', 'EFFTRONICS\RATNA', 'EFFTRONICS\DMADHAVI'] THEN
            sendmailVisible := TRUE
        ELSE
            sendmailVisible := FALSE;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean;
    begin
        Type := Type::Site;
        IF UPPERCASE(USERID) IN ['EFFTRONICS\PARDHU', 'EFFTRONICS\BRAHMAIAH', 'EFFTRONICS\PHANI', 'EFFTRONICS\RENUKACH'] THEN
            Type := Type::Vendor;
    end;

    var
        dcheader: Record "DC Header";
        "Mail-Id": Record User;
        "from Mail": Text[150];
        "to mail": Text[1000];
        Mail_Subject: Text[1000];
        Mail_Body: Text[1000];
        mail: Codeunit Mail;
        newline: Char;
        SMTP_MAIL: Codeunit "SMTP Mail";
        Attachment1: Text[1000];
        Body: Text[1000];
        Mail_to: Text[1000];
        Subject: Text[1000];
        SQLQuery: Text[1000];
        ConnectionOpen: Integer;
        RowCount: Integer;
        DCL: Record "DC Line";
        Attachment: Text[1000];
        Cust: Record Customer;
        Vend: Record Vendor;
        EMP: Record Employee;
        USER: Record User;
        Fname: Text[100];
        [InDataSet]
        sendmailVisible: Boolean;
        ".......Rev01........": Integer;
        SQLConnection: Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000514-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Connection";
        RecordSet: Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000535-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Recordset";
        UserSetup: Record "User Setup";
        CurrentUserID: Text[50];
        AuthorizedID: Text[50];
        User1: Record User;
        DCL1: Record "DC Line";

    (5902)]
    procedure CONVERT(No: Code[20]) NEW_NO: Code[20];
    var
        i: Integer;
    begin
        NEW_NO := '';
        FOR i := 1 TO STRLEN(No) DO BEGIN
            IF COPYSTR(No, i, 1) <> '/' THEN
                NEW_NO := NEW_NO + COPYSTR(No, i, 1)
            ELSE
                NEW_NO := NEW_NO + '_';
        END;
    end;

    (5912)]
    local procedure sendmailOnPush();
    begin

        IF sendmail THEN BEGIN
            newline := 10;
            Mail_Subject := 'ERP- DC Information  ' + "No.";
            Mail_Body := 'DC Information     : ' + "No.";
            Mail_Body += FORMAT(newline);
            Mail_Body += FORMAT(newline);
            Mail_Body += FORMAT(newline);
            Mail_Body += '***** Auto Mail Generated From ERP *****';
            "Mail-Id".SETRANGE("Mail-Id"."User Name", USERID);
            IF "Mail-Id".FINDFIRST THEN
                "from Mail" := "Mail-Id".MailID;

            "Mail-Id".RESET;
            "Mail-Id".SETFILTER("Mail-Id"."User Name", Indented);
            IF "Mail-Id".FINDFIRST THEN
                "to mail" := 'ratna@efftronics.com,' + "Mail-Id".MailID;

            USER.RESET;
            USER.SETFILTER(USER."User Name", Reciver);
            IF USER.FINDFIRST THEN BEGIN
                IF USER.EmployeeID <> '' THEN BEGIN
                    EMP.RESET;
                    EMP.SETFILTER(EMP."No.", USER.EmployeeID);
                    EMP.SETFILTER(EMP."E-Mail", '<>%1', '');
                    IF EMP.FINDFIRST THEN BEGIN
                        "to mail" += ',' + EMP."E-Mail";
                    END;
                END;
            END;
            dcheader.RESET;
            dcheader.SETFILTER(dcheader."No.", "No.");
            IF dcheader.FINDFIRST THEN BEGIN
                Fname := '\\erpserver\ErpAttachments\dcdetails' + COPYSTR("No.", 15, 3) + '.pdf';
                REPORT.SAVEASPDF(33000896, Fname, dcheader);
                Attachment1 := Fname;
            END;

            IF ("from Mail" <> '') AND ("to mail" <> '') THEN BEGIN
                "from Mail" := 'erp@efftronics.com';
                SMTP_MAIL.CreateMessage('EFF', "from Mail", "to mail", Mail_Subject, Mail_Body, FALSE);
                SMTP_MAIL.AddAttachment(Attachment1, '');//EFFUPG Added ('')
                SMTP_MAIL.Send;
            END;
        END;
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

