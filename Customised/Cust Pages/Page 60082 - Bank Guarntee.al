page 60082 "Bank Guarntee"
{
    // version B2B1.0,DIM1.0,Rev01

    // PROJECT : Efftronics
    // *********************************************************************
    // SIGN
    // *********************************************************************
    // B2B     : B2B Softwarre Technologies
    // *********************************************************************
    // VER      SIGN      USERID          DATE          DESCRIPTION
    // *********************************************************************
    // 1.0       B2B    PallaJagadeesh    11-May-13     ->Code in OnAfterGetRecord() and added the functions(from "BGNoOnBeforeInput"
    //                                                    to "ExtendedOnBeforeInput") for convey the OnBeforeInput() trigger in Pages.
    // 
    // 1.0       DIM    Sivaramakrishna.A 25-May-13     -> Code Commented in the InitGenJnlLine() for Journal Line Dimension Table
    //                                                     Does not Exist and added new Code To insert the GenJnlLine with out Line Dimensions

    PageType = Card;
    SourceTable = "Bank Guarantee";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("BG No."; "BG No.")
                {
                }
                field(Description; Description)
                {
                }
                field("Issuing Bank"; "Issuing Bank")
                {
                }
                field(Branch; Branch)
                {
                }
                field(Address; Address)
                {
                }
                field("Address 2"; "Address 2")
                {
                }
                field(City; City)
                {
                }
                field("Post Code"; "Post Code")
                {
                    Caption = 'Post Code / City';
                }
                field(State; State)
                {
                }
                field("Transaction Type"; "Transaction Type")
                {
                }
                field("Issued to/Received from"; "Issued to/Received from")
                {
                }
                field("Customer Name"; "Customer Name")
                {
                    Editable = false;
                }
                field("Account No."; "Account No.")
                {
                    Caption = 'Bank Account No.';
                }
                field("Issued/Received"; "Issued/Received")
                {
                }
                field("Posting Account No."; "Posting Account No.")
                {
                }
                field("BG Posting Status"; "BG Posting Status")
                {
                }
                field("Final Bill Payment"; "Final Bill Payment")
                {
                }
                field("Date Period"; "Date Period")
                {
                }
                field("BG Head Status"; "BG Head Status")
                {
                }
                field("Doc No."; "Doc No.")
                {
                    Caption = 'Sale Order No.';

                    trigger OnLookup(Text: Text): Boolean;
                    begin
                        IF "Transaction Type" = "Transaction Type"::Amc THEN
                            SH.SETRANGE(SH."Document Type", SH."Document Type"::Amc)
                        ELSE
                            SH.SETRANGE(SH."Document Type", SH."Document Type"::Order);
                        IF PAGE.RUNMODAL(0, SH) = ACTION::LookupOK THEN BEGIN
                            "Doc No." := SH."No.";
                            "Customer Order No." := SH."Customer OrderNo.";
                            "Issued to/Received from" := SH."Sell-to Customer No.";
                            "BG Value" := SH."Exp.Payment";
                            "Confirmed BY" := SH."Salesperson Code";
                            "Account No." := 'BA-000001';
                            Description := 'Issuing of BG';
                            "Issuing Bank" := 'Andhra Bank';
                            Branch := 'Ring Road Branch';
                            "Post Code" := '520001';
                            City := 'Vijayawada';
                            State := 'ANP';
                            // "Transaction Type":="Transaction Type"::Sale;    //Pranavi
                            // Added by Pranavi on 20-Jan-2016
                            IF SH."Document Type" = SH."Document Type"::Order THEN
                                "Transaction Type" := "Transaction Type"::Sale
                            ELSE
                                IF SH."Document Type" = SH."Document Type"::Amc THEN
                                    "Transaction Type" := "Transaction Type"::Amc;
                            // End by Pranavi
                            "BG Posting Status" := "BG Posting Status"::Purchased;
                            "Type of BG" := "Type of BG"::Performance;
                        END;
                    end;

                    trigger OnValidate();
                    begin
                        //CLEAR(salesList);
                        //SalesList.LOOKUPMODE:=true;
                        //SalesList.RUNMODAL;
                        //SH.MARKEDONLY:=true;
                        IF "Transaction Type" = "Transaction Type"::Amc THEN
                            SH.SETRANGE(SH."Document Type", SH."Document Type"::Amc)
                        ELSE
                            SH.SETRANGE(SH."Document Type", SH."Document Type"::Order);
                        IF PAGE.RUNMODAL(45, SH) = ACTION::LookupOK THEN BEGIN

                            "Customer Order No." := SH."Customer OrderNo.";
                            "Issued to/Received from" := SH."Sell-to Customer No.";
                            "BG Value" := SH."Exp.Payment";
                            "Confirmed BY" := SH."Salesperson Code";
                            "Account No." := 'BA-000001';
                            Description := 'Issuing of BG';
                            "Issuing Bank" := 'Andhra Bank';
                            Branch := 'Ring Road Branch';
                            "Post Code" := '520001';
                            City := 'Vijayawada';
                            State := 'ANP';
                            // "Transaction Type":="Transaction Type"::Sale;   // Pranavi
                            // Added by Pranavi on 20-Jan-2016
                            IF SH."Document Type" = SH."Document Type"::Order THEN
                                "Transaction Type" := "Transaction Type"::Sale
                            ELSE
                                IF SH."Document Type" = SH."Document Type"::Amc THEN
                                    "Transaction Type" := "Transaction Type"::Amc;
                            // End by Pranavi
                            "BG Posting Status" := "BG Posting Status"::Purchased;
                            "Type of BG" := "Type of BG"::Performance;
                        END;


                        /*
                        SH.SETFILTER(SH."No.","Doc No.");
                        IF SH.FINDFIRST THEN
                        BEGIN
                        "Customer Order No.":=SH."Customer OrderNo.";
                        "Issued to/Received from":=SH."Sell-to Customer No.";
                        "BG Value":=SH."Exp.Payment";
                        "Confirmed BY":=SH."Salesperson Code";
                        "Account No.":='BA-000001';
                        Description:='Issuing of BG';
                        "Issuing Bank":='Andhra Bank';
                        Branch:='Ring Road Branch';
                        "Post Code":='520001';
                        City:='Vijayawada';
                        State:='ANP';
                        "Transaction Type":="Transaction Type"::Sale;
                        "BG Posting Status":="BG Posting Status"::Purchased;
                        "Type of BG":="Type of BG"::Performance;
                        END;
                         */

                    end;
                }
                field("Date of Issue"; "Date of Issue")
                {
                }
                field("Expiry Date"; "Expiry Date")
                {
                }
                field("Claim Date"; "Claim Date")
                {
                    Caption = 'Extension Date';
                }
                field("Type of BG"; "Type of BG")
                {
                }
                field(Description2; Description2)
                {
                }
                field("BG Value"; "BG Value")
                {
                }
                field("Confirmed BY"; "Confirmed BY")
                {
                }
                field("Confirmed BY Name"; "Confirmed BY Name")
                {
                    Editable = false;
                }
                field(Status; Status)
                {
                }
                field("BG Margin Amount"; "BG Margin Amount")
                {
                }
                field("Tender No."; "Tender No.")
                {
                }
                field(Extended; Extended)
                {
                }
                field(Closed; Closed)
                {
                    Editable = true;

                    trigger OnValidate();
                    begin
                        IF (NOT (USERID IN ['EFFTRONICS\VISHNUPRIYA', 'EFFTRONICS\SUJANI'])) THEN
                            ERROR('Please use "Close BG" Action in Actions Tab');
                    end;
                }
                field("Released to Finance"; "Released to Finance")
                {
                    Editable = false;

                    trigger OnValidate();
                    begin
                        IF (NOT (USERID IN ['EFFTRONICS\VISHNUPRIYA', 'EFFTRONICS\SUJANI'])) THEN
                            ERROR('Please use "RELEASE TO FINANCE" Action in Actions Tab');
                    end;
                }
                field("Customer Order No."; "Customer Order No.")
                {
                }
                field("BG Received Back Date"; "BG Received Back Date")
                {
                }
                field("Warranty Period"; "Warranty Period")
                {
                    Editable = RecEditable;
                    Enabled = RecEditable;

                    trigger OnValidate();
                    begin
                        IF FORMAT("Warranty Period") <> '' THEN BEGIN
                            //Initialization start
                            RowCount := 0;
                            SQLQuery := '';
                            SDId := 0;
                            //Initializations end

                            IF ISCLEAR(SQLConnection) THEN
                                CREATE(SQLConnection, FALSE, TRUE);

                            IF ISCLEAR(RecordSet) THEN
                                CREATE(RecordSet, FALSE, TRUE);

                            IF ConnectionOpen <> 1 THEN BEGIN
                                SQLConnection.ConnectionString := 'DSN=CASHFLOW;UID=cashflowuser;PASSWORD=firewall123;SERVER=oracle_80;';
                                SQLConnection.Open;
                                SQLConnection.BeginTrans;
                                ConnectionOpen := 1;
                            END;
                            SQLQuery := 'SELECT * FROM MRP_SECURITY_DEPOSIT WHERE INT_SAL_ORD_NO = ''' + FORMAT("Doc No.") + ''' AND SD_STATUS = ''N''';
                            //MESSAGE(SQLQuery);
                            RecordSet := SQLConnection.Execute(SQLQuery, RowCount);
                            IF NOT ((RecordSet.BOF) OR (RecordSet.EOF)) THEN
                                RecordSet.MoveFirst;

                            WHILE NOT RecordSet.EOF DO BEGIN
                                SDId := RecordSet.Fields.Item('SD_ID').Value;
                                RowCount := RowCount + 1;
                                RecordSet.MoveNext;
                            END;
                            IF SDId <> 0 THEN BEGIN
                                SQLQuery := 'UPDATE MRP_SECURITY_DEPOSIT SET WARRANTY_PERIOD = ''' + FORMAT("Warranty Period") + ''', SD_FINAL_BILL_DATE = to_date(''' +
                                FORMAT("Final Railway Bill Date", 0, '<Day>-<Month Text,3>-<Year4>') + ''',''dd-mon-yyyy'') WHERE INT_SAL_ORD_NO = ''' + FORMAT("Doc No.") + '''';
                                SQLConnection.Execute(SQLQuery);
                            END;
                        END;
                        SQLConnection.CommitTrans;
                        RecordSet.Close;
                        SQLConnection.Close;
                        ConnectionOpen := 0;
                    end;
                }
                field("Final Railway Bill Date"; "Final Railway Bill Date")
                {

                    trigger OnValidate();
                    begin
                        IF "Final Railway Bill Date" <> 0D THEN BEGIN
                            //Initialization start
                            RowCount := 0;
                            SQLQuery := '';
                            SDId := 0;
                            //Initializations end

                            IF ISCLEAR(SQLConnection) THEN
                                CREATE(SQLConnection, FALSE, TRUE);

                            IF ISCLEAR(RecordSet) THEN
                                CREATE(RecordSet, FALSE, TRUE);

                            IF ConnectionOpen <> 1 THEN BEGIN
                                SQLConnection.ConnectionString := 'DSN=CASHFLOW;UID=cashflowuser;PASSWORD=firewall123;SERVER=oracle_80;';
                                SQLConnection.Open;
                                SQLConnection.BeginTrans;
                                ConnectionOpen := 1;
                            END;
                            SQLQuery := 'SELECT * FROM MRP_SECURITY_DEPOSIT WHERE INT_SAL_ORD_NO = ''' + FORMAT("Doc No.") + ''' AND SD_STATUS = ''N''';
                            //MESSAGE(SQLQuery);
                            RecordSet := SQLConnection.Execute(SQLQuery, RowCount);
                            IF NOT ((RecordSet.BOF) OR (RecordSet.EOF)) THEN
                                RecordSet.MoveFirst;

                            WHILE NOT RecordSet.EOF DO BEGIN
                                SDId := RecordSet.Fields.Item('SD_ID').Value;
                                RowCount := RowCount + 1;
                                RecordSet.MoveNext;
                            END;
                            IF SDId <> 0 THEN BEGIN
                                SQLQuery := 'UPDATE MRP_SECURITY_DEPOSIT SET WARRANTY_PERIOD = ''' + FORMAT("Warranty Period") + ''', SD_FINAL_BILL_DATE = to_date(''' +
                                FORMAT("Final Railway Bill Date", 0, '<Day>-<Month Text,3>-<Year4>') + ''',''dd-mon-yyyy'') WHERE INT_SAL_ORD_NO = ''' + FORMAT("Doc No.") + '''';
                                SQLConnection.Execute(SQLQuery);
                            END;
                        END;
                        SQLConnection.CommitTrans;
                        RecordSet.Close;
                        SQLConnection.Close;
                        ConnectionOpen := 0;
                    end;
                }
                field("BG Warranty Completion Date"; "BG Warranty Completion Date")
                {
                    Editable = false;
                }
                field(Remarks; Remarks)
                {
                    Caption = 'Remarks(Max 250 Characters)';
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
                action("BG Re&lease")
                {
                    Caption = 'BG Re&lease';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction();
                    begin

                        IF Status = Status::Released THEN
                            EXIT;
                        TESTFIELD("BG No.");
                        TESTFIELD("Issuing Bank");
                        TESTFIELD("BG Value");
                        IF CONFIRM('Do you want to Release?') THEN BEGIN
                            Status := Status::Released;
                            MESSAGE('The BG has been Released.')
                        END ELSE
                            EXIT;
                        CurrPage.UPDATE;
                    end;
                }
                action("BG Re&open")
                {
                    Caption = 'BG Re&open';
                    Image = ReOpen;

                    trigger OnAction();
                    begin
                        IF Status = Status::Open THEN
                            EXIT;
                        TESTFIELD(Closed, FALSE);
                        //TESTFIELD("Released to Finance",FALSE);
                        IF CONFIRM('Do you want to Reopen?') THEN
                            Status := Status::Open
                        ELSE
                            EXIT;
                        CurrPage.UPDATE;
                    end;
                }
                action("Release to Sales")
                {
                    Caption = 'Release to Sales';
                    Image = SalesTax;

                    trigger OnAction();
                    begin
                        IF NOT CONFIRM(Text01, FALSE) THEN
                            EXIT;
                        newline := 10;
                        Mail_Body := '';
                        SH.SETRANGE(SH."No.", "Doc No.");
                        IF SH.FINDFIRST THEN BEGIN
                            IF SH."BG Status" = SH."BG Status"::Pending THEN BEGIN
                                SH."BG Status" := SH."BG Status"::Submitted;
                                SH.MODIFY;
                            END;
                            glentry.SETRANGE(glentry."Document No.", "BG No.");
                            IF NOT glentry.FINDFIRST THEN
                                ERROR('Please Post Entry and then Release')
                            ELSE BEGIN
                                IF "Doc No." = '' THEN
                                    ERROR('Enter the Sale Order No.');
                                Mail_Subject := 'ERP- BG has been taken for ' + "Doc No.";
                                IF "Issued to/Received from" = '' THEN
                                    ERROR('Pick the Customer');
                                Mail_Body += 'BG AMOUNT TO SALES DETAILS :';
                                Mail_Body += FORMAT(newline);

                                Mail_Body += 'BG No.                : ' + FORMAT("BG No.");
                                Mail_Body += FORMAT(newline);
                                cust.SETRANGE(cust."No.", "Issued to/Received from");
                                IF cust.FINDFIRST THEN
                                    Mail_Body += 'Customer Name         : ' + FORMAT(cust.Name);
                                Mail_Body += FORMAT(newline);
                                IF "Customer Order No." = '' THEN
                                    ERROR('Pick the Customer Order No');
                                Mail_Body += 'Customer Order No.    : ' + FORMAT("Customer Order No.");
                                Mail_Body += FORMAT(newline);
                                IF "BG Value" = 0 THEN
                                    ERROR('Enter BG Value');
                                Mail_Body += 'BG Value              : ' + FORMAT(ROUND("BG Value", 1));
                                Mail_Body += FORMAT(newline);
                                SH.SETRANGE(SH."No.", "Doc No.");
                                IF SH.FINDFIRST THEN BEGIN
                                    Mail_Body += 'Order Value           : ' + FORMAT(ROUND(SH."Sale Order Total Amount", 1));
                                    Mail_Body += FORMAT(newline);
                                    cust.SETRANGE(cust."No.", SH."Sell-to Customer No.");
                                    IF cust.FINDFIRST THEN
                                        IF cust."Salesperson Code" = '' THEN
                                            ERROR('Enter Sales Person Code in Customer Card')
                                        ELSE
                                            "Mail-Id".SETRANGE("Mail-Id"."User Security ID", cust."Salesperson Code");
                                    IF "Mail-Id".FINDFIRST THEN
                                        Mail_Body += 'Sales Excecutive     : ' + FORMAT("Mail-Id"."User Name");
                                    Mail_Body += FORMAT(newline);

                                    dev := TODAY - SH."CA Date";
                                    IF dev > 0 THEN BEGIN
                                        Mail_Body += 'Deviation days        : ' + FORMAT(dev);
                                        Mail_Body += FORMAT(newline);
                                    END;
                                END;
                                Mail_Body += FORMAT(newline);
                                Mail_Body += FORMAT(newline);
                                Mail_Body += '***** Auto Mail Generated from ERP *****';
                                "Mail-Id".SETRANGE("Mail-Id"."User Security ID", USERID);
                                IF "Mail-Id".FINDFIRST THEN
                                    "from Mail" := "Mail-Id".MailID;
                                "to mail" := 'dir@efftronics.com,sganesh@efftronics.com,anilkumar@efftronics.com,cvmohan@efftronics.com,dsr@efftronics.com,';
                                "to mail" += 'durgaraov@efftronics.com,ravi@efftronics.com,samba@efftronics.com,baji@efftronics.com,prasannat@efftronics.com,';
                                "to mail" += 'anuradhag@efftronics.com,mohang@efftronics.com,anulatha@efftronics.com,milind@efftronics.com,srasc@efftronics.com';
                                "to mail" += 'sitarajyam@efftronics.com,renukach@efftronics.com,rajani@efftronics.com';

                                IF ("from Mail" <> '') AND ("to mail" <> '') THEN
                                    mail.NewCDOMessage("from Mail", "to mail", Mail_Subject, Mail_Body, '');
                                MESSAGE(Text012);
                            END;
                        END;
                    end;
                }
                action("Releasing to finance")
                {
                    Caption = 'Release to Finance';

                    trigger OnAction();
                    var
                        SelectedFile: Text;
                        FileMgt: Codeunit "File Management";
                        FileDialog: DotNet "'System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Windows.Forms.OpenFileDialog" RUNONCLIENT;
                        RetVal: Integer;
                        i: Integer;
                        filename: Text;
                        Attachment: Record Attachments;
                        Last_Num: Integer;
                        name: Text;
                    begin
                        IF Status <> Status::Released THEN
                            ERROR('BG is not in Released State');
                        IF Closed = TRUE THEN
                            ERROR('BG is already Closed');
                        IF "Released to Finance" = TRUE THEN BEGIN
                            IF (NOT (CONFIRM('Again do you want Release to Finance'))) THEN BEGIN
                                EXIT;
                            END;
                        END;
                        user.RESET;
                        user.SETRANGE(user."User Name", USERID);
                        IF user.FINDFIRST THEN
                            username := user."Full Name"
                        ELSE
                            username := 'ERP User';

                        "from Mail" := 'erp@efftronic.com';
                        "to mail" := 'rajani@efftronics.com,yesu@efftronics.com,sales@efftronics.com';

                        Mail_Subject := 'BG - Release to Finance';
                        Mail_Body := '';
                        SMTP_MAIL.CreateMessage('ERP', "from Mail", "to mail", Mail_Subject, Mail_Body, TRUE);
                        //SMTP_MAIL.AddBCC('vishnupriya@efftronics.com');
                        SMTP_MAIL.AppendBody('Dear Sir/Madam,');
                        SMTP_MAIL.AppendBody('<br><br>&nbsp&nbsp&nbsp  The following BG need to be  Closed. It is Release to Finance<br>');
                        SMTP_MAIL.AppendBody('<font size="3" color ="#0971D9">&nbsp&nbsp&nbsp BG No :: ' + "BG No." + '</font><br>');
                        SMTP_MAIL.AppendBody('<br>With Regards<br>');
                        SMTP_MAIL.AppendBody(username);
                        FileDialog := FileDialog.OpenFileDialog;
                        FileDialog.Multiselect(TRUE);

                        RetVal := FileDialog.ShowDialog();
                        //MESSAGE(FORMAT(RetVal));
                        IF RetVal = 1 THEN BEGIN
                            i := 0;
                            WHILE i <= FileDialog.FileNames.GetUpperBound(0) DO BEGIN
                                SelectedFile := FileDialog.FileNames.GetValue(i);
                                filename := FileDialog.SafeFileNames.GetValue(i);
                                FileMgt.CopyClientFile(SelectedFile, '\\erpserver\Attachment\BGAttachment\' + filename, TRUE);
                                i := i + 1;
                                Attachment.RESET;
                                Attachment.SETCURRENTKEY("No.", "Table ID", "Document Type", "Document No.");
                                IF Attachment.FINDLAST THEN
                                    Last_Num := Attachment."No." + 1;

                                Attachment.RESET;
                                Attachment.INIT;
                                Attachment."No." := Last_Num;
                                Attachment."Table ID" := 60061;
                                Attachment."Document Type" := 4;
                                Attachment."Document No." := "BG No.";
                                Attachment."Ids Reference No." := "BG No.";
                                Attachment.INSERT;

                                Attachment.RESET;
                                Attachment.SETFILTER(Attachment."No.", FORMAT(Last_Num));
                                Attachment.SETFILTER(Attachment."Table ID", '60061');
                                Attachment.SETFILTER(Attachment."Document No.", "BG No.");
                                IF Attachment.FINDSET THEN BEGIN
                                    //MESSAGE(FORMAT(Attachment."No."));
                                    Attachment.Description := 'BG_Attachment';
                                    Attachment.MODIFY;
                                    //MESSAGE(FORMAT(Attachment.Description));
                                    Attachment.ImportAttachment2('', FALSE, FALSE, '\\erpserver\Attachment\BGAttachment\' + filename);
                                    //SMTP_MAIL.AddAttachment('\\erpserver\Attachment\BGAttachment\'+filename); //EFFUPG
                                    SMTP_MAIL.AddAttachment('\\erpserver\Attachment\BGAttachment\' + filename, '');
                                END;




                            END;
                            "Released to Finance" := TRUE;
                            MODIFY;
                            MESSAGE('BG has been Released to Finance');
                            SMTP_MAIL.Send;
                            /*WHILE i <= FileDialog.FileNames.GetUpperBound(0) DO BEGIN
                              filename := FileDialog.SafeFileNames.GetValue(i) ;
                             // ('\\eff-cpu-382\Share\testing\'+filename);
                             i := i + 1;
                            END;*/
                        END
                        ELSE BEGIN
                            MESSAGE('Files are not Selected. BG doesnot Release to Finance');
                        END;

                        FileDialog.Dispose();

                    end;
                }
                action("&Close BG")
                {
                    Caption = '&Close BG';
                    Image = Closed;

                    trigger OnAction();
                    begin
                        IF Closed = TRUE THEN
                            EXIT;
                        TESTFIELD(Status, Status::Released);
                        IF CONFIRM('Do you want to close BG?') THEN BEGIN
                            MESSAGE('The BG has been closed.');
                            // ADDED BY VIJAYA 10-JUN-2016 for mail sending when BG Closed
                            "from Mail" := 'erp@efftronics.com';
                            "to mail" := 'rajani@efftronics.com,sales@efftronics.com';
                            user.RESET;
                            user.SETRANGE(user."User Name", USERID);

                            IF user.FINDFIRST THEN
                                username := user."Full Name"
                            ELSE
                                username := 'ERP User';
                            Mail_Subject := 'BG - BG has Closed';
                            SMTP_MAIL.CreateMessage('ERP', "from Mail", "to mail", Mail_Subject, Mail_Body, TRUE);
                            SMTP_MAIL.AppendBody('Dear Madam,');
                            SMTP_MAIL.AppendBody('<br><br>&nbsp&nbsp&nbsp  The following BG has been Closed<br>');
                            SMTP_MAIL.AppendBody('<font size="3" color ="#FF0000">&nbsp&nbsp&nbsp BG No :: ' + "BG No." + '</font><br>');
                            SMTP_MAIL.AppendBody('<font size="3" color ="#FF0000">&nbsp&nbsp&nbsp Customer No :: ' + "Issued to/Received from" + '</font><br>');
                            SMTP_MAIL.AppendBody('<font size="3" color ="#FF0000">&nbsp&nbsp&nbsp Order No :: ' + "Doc No." + '</font><br>');
                            SMTP_MAIL.AppendBody('<font size="3" color ="#FF0000">&nbsp&nbsp&nbsp BG Value :: ' + FORMAT("BG Value") + '</font><br>');
                            SMTP_MAIL.AppendBody('<br>With Regards<br>');
                            SMTP_MAIL.AppendBody(username);
                            SMTP_MAIL.Send;
                            // END by VIJAYA

                            Closed := TRUE;
                            //VALIDATE(Closed,TRUE);
                        END ELSE
                            EXIT;
                        CurrPage.UPDATE;
                    end;
                }
                separator(Action1102152060)
                {
                }
                group(Post)
                {
                    Caption = 'Post';
                    Image = Post;
                    action(Purchase)
                    {
                        Caption = 'Purchase';
                        Image = Purchase;

                        trigger OnAction();
                        begin
                            IF NOT CONFIRM(Text001, FALSE, "BG No.") THEN
                                EXIT;

                            TESTFIELD("Posting Account No.");
                            TESTFIELD("BG No.");
                            TESTFIELD("BG Value");
                            TESTFIELD(Status, Status::Released);
                            TESTFIELD(Posted, FALSE);

                            "AccountNo." := "Posting Account No.";
                            AccountType := AccountType::"G/L Account";
                            "BalAccountNo." := "Account No.";
                            BalAccountType := BalAccountType::"Bank Account";
                            Amount := "BG Value";
                            InitGenJnlLine(Rec, "AccountNo.", "BalAccountNo.", AccountType, BalAccountType, Amount);
                            Posted := TRUE;
                            "BG Posting Status" := "BG Posting Status"::Purchased;
                            MODIFY;
                            MESSAGE(Text002, "BG No.");
                        end;
                    }
                    action(Receipt)
                    {
                        Caption = 'Receipt';
                        Image = Receipt;

                        trigger OnAction();
                        begin
                            IF NOT CONFIRM(Text003, FALSE, "BG No.") THEN
                                EXIT;

                            TESTFIELD("Posting Account No.");
                            TESTFIELD("BG No.");
                            TESTFIELD("BG Value");
                            TESTFIELD(Status, Status::Released);
                            TESTFIELD(Posted, TRUE);
                            TESTFIELD("Issued/Received", "Issued/Received"::Received);

                            "AccountNo." := "Posting Account No.";
                            AccountType := AccountType::"G/L Account";
                            "BalAccountNo." := "Account No.";
                            BalAccountType := BalAccountType::"Bank Account";
                            Amount := -"BG Value";
                            InitGenJnlLine(Rec, "AccountNo.", "BalAccountNo.", AccountType, BalAccountType, Amount);
                            Posted := FALSE;
                            "BG Posting Status" := "BG Posting Status"::Purchased;
                            MODIFY;
                            MESSAGE(Text002, "BG No.");
                        end;
                    }
                }
            }
            group("Bank &Guarantee")
            {
                Caption = 'Bank &Guarantee';
                action(Attachment)
                {
                    Caption = 'Attachment';
                    Image = Attach;

                    trigger OnAction();
                    var
                        Attachment: Record Attachments;
                    begin
                        Attachment.RESET;
                        Attachment.SETRANGE("Table ID", DATABASE::"Bank Guarantee");
                        Attachment.SETRANGE("Document No.", "BG No.");
                        Attachment.SETRANGE("Document Type", Attachment."Document Type"::"Bank Guarantee");

                        PAGE.RUN(PAGE::"ESPL Attachments", Attachment);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        //>>B2b1.0
        BGNoOnBeforeInput;
        DescriptionOnBeforeInput;
        IssuingBankOnBeforeInput;
        BranchOnBeforeInput;
        AddressOnBeforeInput;
        Address2OnBeforeInput;
        PostCodeOnBeforeInput;
        CityOnBeforeInput;
        StateOnBeforeInput;
        TransactionTypeOnBeforeInput;
        IssuedtoReceivedfromOnBeforeIn;
        DocNoOnBeforeInput;
        DateofIssueOnBeforeInput;
        ClaimDateOnBeforeInput;
        TypeofBGOnBeforeInput;
        Description2OnBeforeInput;
        BGValueOnBeforeInput;
        BGMarginAmountOnBeforeInput;
        AccountNoOnBeforeInput;
        PostingAccountNoOnBeforeInput;
        ExtendedOnBeforeInput;
        //<<B2b1.0

        //>>Pranavi
        IF "Transaction Type" = "Transaction Type"::Sale THEN
            RecEditable := TRUE
        ELSE
            RecEditable := FALSE;
        //<<Pranavi
    end;

    trigger OnModifyRecord(): Boolean;
    begin
        IF NOT (UPPERCASE(USERID) IN ['EFFTRONICS\RAJANI', 'EFFTRONICS\YESU', 'EFFTRONICS\MDIVYA', 'EFFTRONICS\SUSMITHAL', 'EFFTRONICS\SHABANABEGUM',
                                      'EFFTRONICS\20TE168', 'EFFTRONICS\RADHIKAK', 'EFFTRONICS\SITARAJYAM', 'EFFTRONICS\DIVYA', 'EFFTRONICS\VISHNUPRIYA']) THEN BEGIN
            ERROR('You have No rights to modify this form');
        END;
    end;

    trigger OnOpenPage();
    begin
        credit_limit := 75000000;
        Total_Value := 0;
        IF BG.FINDSET THEN
            REPEAT
                //IF BG."BG Received Back Date"=0D THEN
                IF BG.Closed <> TRUE THEN
                    Total_Value := Total_Value + BG."BG Value";
            UNTIL BG.NEXT = 0;
        IF Total_Value <= credit_limit THEN
            MESSAGE('Now you have the Credit Limit upto : ' + FORMAT(credit_limit - ROUND(Total_Value, 1)) + ' to Exceed 7.5 Crores Limit')
        ELSE BEGIN
            "from Mail" := 'erp@efftronics.com';
            "to mail" := 'sganesh@efftronics.com,rajani@efftronics.com,sales@efftronics.com,anilkumar@efftronics.com';
            Mail_Subject := 'BG Credit Limit Exceeded Please Purchase FDR Forms';
            Mail_Body := '';
            /*
            SMTP_MAIL.CreateMessage('ERP',"from Mail","to mail",Mail_Subject,Mail_Body,FALSE);
            SMTP_MAIL.Send;
            */
        END;
        RecEditable := FALSE;

    end;

    var
        "AccountNo.": Code[20];
        "BalAccountNo.": Code[20];
        AccountType: Option "G/L Account","Bank Account";
        BalAccountType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset";
        Amount: Decimal;
        GenJnlLine: Record "Gen. Journal Line";
        GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
        Text001: Label 'Do you want to Purchase the FDR No. %1?';
        Text002: Label 'FDR No. %1 Posted Successfully.';
        Text003: Label 'Do you want to Receive the FDR No. %1?';
        Text004: Label 'FDR No. %1 Posted Successfully.';
        Text01: Label 'Do you want to Release Document to Sales?';
        Text012: Label 'Document has been released to Sales.';
        "Mail-Id": Record User;
        "from Mail": Text[1000];
        "to mail": Text[1000];
        Mail_Subject: Text[1000];
        Mail_Body: Text[1000];
        newline: Char;
        cust: Record Customer;
        mail: Codeunit Mail;
        dev: Integer;
        SH: Record "Sales Header";
        glentry: Record "G/L Entry";
        SIH: Record "Sales Invoice Header";
        BG: Record "Bank Guarantee";
        Total_Value: Decimal;
        credit_limit: Decimal;
        SMTPSETUP: Record "SMTP SETUP";
        AttachFileName: Text[1000];
        objEmailConf: Automation "'{CD000000-8B95-11D1-82DB-00C04FB1625D}' 1.0:'{CD000002-8B95-11D1-82DB-00C04FB1625D}':''{CD000000-8B95-11D1-82DB-00C04FB1625D}' 1.0'.Configuration";
        objEmail: Automation "'{CD000000-8B95-11D1-82DB-00C04FB1625D}' 1.0:'{CD000001-8B95-11D1-82DB-00C04FB1625D}':''{CD000000-8B95-11D1-82DB-00C04FB1625D}' 1.0'.Message";
        flds: Automation "'{00000205-0000-0010-8000-00AA006D2EA4}' 2.5:'{00000564-0000-0010-8000-00AA006D2EA4}':''{00000205-0000-0010-8000-00AA006D2EA4}' 2.5'.Fields";
        fld: Automation "'{00000205-0000-0010-8000-00AA006D2EA4}' 2.5:'{00000569-0000-0010-8000-00AA006D2EA4}':''{00000205-0000-0010-8000-00AA006D2EA4}' 2.5'.Field";
        SMTP_MAIL: Codeunit "SMTP Mail";
        [InDataSet]
        BGNoHideValue: Boolean;
        [InDataSet]
        DescriptionHideValue: Boolean;
        [InDataSet]
        IssuingBankHideValue: Boolean;
        [InDataSet]
        BranchHideValue: Boolean;
        [InDataSet]
        AddressHideValue: Boolean;
        [InDataSet]
        Address2HideValue: Boolean;
        [InDataSet]
        PostCodeHideValue: Boolean;
        [InDataSet]
        CityHideValue: Boolean;
        [InDataSet]
        StateHideValue: Boolean;
        [InDataSet]
        StatusHideValue: Boolean;
        [InDataSet]
        IssuedReceivedHideValue: Boolean;
        [InDataSet]
        DocNoHideValue: Boolean;
        [InDataSet]
        DateofIssueHideValue: Boolean;
        [InDataSet]
        ClaimDateHideValue: Boolean;
        [InDataSet]
        TypeofBGHideValue: Boolean;
        [InDataSet]
        Description2HideValue: Boolean;
        [InDataSet]
        BGHideValue: Boolean;
        [InDataSet]
        BGMarginAmountHideValue: Boolean;
        [InDataSet]
        AccountNoHideValue: Boolean;
        [InDataSet]
        PostingAccNoHideValue: Boolean;
        [InDataSet]
        ExtendedHideValue: Boolean;
        RecEditable: Boolean;
        user: Record User;
        username: Text;
        SQLQuery: Text[1000];
        RowCount: Integer;
        ConnectionOpen: Integer;
        SQLConnection: Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000514-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Connection";
        RecordSet: Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000535-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Recordset";
        SDId: Integer;

    [LineStart(9464)]
    procedure InitGenJnlLine(var Rec: Record "Bank Guarantee"; "AccountNo.": Code[20]; "BalAccountNo.": Code[20]; AccountType: Option "G/L Account","Bank Account"; BalAccountType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset"; Amount: Decimal);
    var
        DimMgt: Codeunit DimensionManagement;
        DimBufMgt: Codeunit "Dimension Buffer Management";
        PostingGroups: Record "Tender Posting Groups";
    begin
        GenJnlLine.INIT;
        GenJnlLine."Account Type" := AccountType;
        GenJnlLine."Account No." := "AccountNo.";
        GenJnlLine."Posting Date" := WORKDATE;
        GenJnlLine."Document No." := "BG No.";
        GenJnlLine."Document Type" := GenJnlLine."Document Type"::Payment;
        GenJnlLine.Description := Rec.Description;
        GenJnlLine."Bal. Account No." := "BalAccountNo.";
        GenJnlLine."Bal. Account Type" := BalAccountType;
        GenJnlLine.Amount := Amount;
        GenJnlLine.VALIDATE(Amount);
        GenJnlLine."Source Code" := 'GENJNL';
        //DIM1.0 Start
        //Code Commented
        /*
        TempJnlLineDim.DELETEALL;
        TempDocDim.RESET;
        TempDocDim.SETRANGE("Table ID",DATABASE::"Bank Guarantee");
        DimMgt.CopyDocDimToJnlLineDim(TempDocDim,TempJnlLineDim);
        GenJnlPostLine.RunWithCheck(GenJnlLine,TempJnlLineDim);
        */

        GenJnlPostLine.RunWithCheck(GenJnlLine);
        //DIM1.0 End

    end;

    [LineStart(9490)]
    local procedure BGNoOnBeforeInput();
    begin
        IF Status = Status::Released THEN
            //B2b1.0>>
            BGNoHideValue := FALSE
        ELSE
            BGNoHideValue := TRUE;

        /*  CurrForm."BG No.".UPDATEEDITABLE(FALSE)
        ELSE
          CurrForm."BG No.".UPDATEEDITABLE(TRUE)
         *///<<B2b1.0

    end;

    [LineStart(9502)]
    local procedure DescriptionOnBeforeInput();
    begin
        IF Status = Status::Released THEN
            //B2b1.0>>
            DescriptionHideValue := FALSE
        ELSE
            DescriptionHideValue := TRUE

        /*  CurrPage.Description.UPDATEEDITABLE(FALSE)
        ELSE
          CurrPage.Description.UPDATEEDITABLE(TRUE)
        *///<<B2b1.0

    end;

    [LineStart(9514)]
    local procedure IssuingBankOnBeforeInput();
    begin
        IF Status = Status::Released THEN
            //B2b1.0>>
            IssuingBankHideValue := FALSE
        ELSE
            IssuingBankHideValue := TRUE

        /* CurrPage."Issuing Bank".UPDATEEDITABLE(FALSE)
        ELSE
          CurrPage."Issuing Bank".UPDATEEDITABLE(TRUE)
        *///<<B2b1.0

    end;

    [LineStart(9526)]
    local procedure BranchOnBeforeInput();
    begin
        IF Status = Status::Released THEN
            //B2b1.0>>
            BranchHideValue := FALSE
        ELSE
            BranchHideValue := TRUE;

        /* CurrPage.Branch.UPDATEEDITABLE(FALSE)
        ELSE
          CurrPage.Branch.UPDATEEDITABLE(TRUE)
        *///B2b1.0<<

    end;

    [LineStart(9538)]
    local procedure AddressOnBeforeInput();
    begin
        IF Status = Status::Released THEN
            //B2b1.0>>
            AddressHideValue := FALSE
        ELSE
            AddressHideValue := TRUE;

        /* CurrPage.Address.UPDATEEDITABLE(FALSE)
        ELSE
          CurrPage.Address.UPDATEEDITABLE(TRUE)
        *///B2b1.0<<

    end;

    [LineStart(9550)]
    local procedure Address2OnBeforeInput();
    begin
        IF Status = Status::Released THEN
            //B2b1.0>>
            Address2HideValue := FALSE
        ELSE
            Address2HideValue := TRUE;

        /* CurrPage."Address 2".UPDATEEDITABLE(FALSE)
        ELSE
          CurrPage."Address 2".UPDATEEDITABLE(TRUE)
        *///B2b1.0<<

    end;

    [LineStart(9562)]
    local procedure PostCodeOnBeforeInput();
    begin
        IF Status = Status::Released THEN
            //B2b1.0>>
            PostCodeHideValue := FALSE
        ELSE
            PostCodeHideValue := TRUE;

        /* CurrPage."Post Code".UPDATEEDITABLE(FALSE)
        ELSE
          CurrPage."Post Code".UPDATEEDITABLE(TRUE)
        *///B2b1.0<<

    end;

    [LineStart(9574)]
    local procedure CityOnBeforeInput();
    begin
        IF Status = Status::Released THEN
            //B2b1.0>>
            CityHideValue := FALSE
        ELSE
            CityHideValue := TRUE;

        /* CurrPage.City.UPDATEEDITABLE(FALSE)
        ELSE
          CurrPage.City.UPDATEEDITABLE(TRUE)
        *///B2b1.0<<

    end;

    [LineStart(9586)]
    local procedure StateOnBeforeInput();
    begin
        IF Status = Status::Released THEN
            StateHideValue := FALSE
        ELSE
            StateHideValue := TRUE;

        /* CurrPage.State.UPDATEEDITABLE(FALSE)
        ELSE
          CurrPage.State.UPDATEEDITABLE(TRUE)
        *///B2b1.0<<

    end;

    [LineStart(9597)]
    local procedure TransactionTypeOnBeforeInput();
    begin
        IF Status = Status::Released THEN
            //B2b1.0>>
            StatusHideValue := FALSE
        ELSE
            StatusHideValue := TRUE;

        /* CurrPage."Transaction Type".UPDATEEDITABLE(FALSE)
        ELSE
          CurrPage."Transaction Type".UPDATEEDITABLE(TRUE)
        *///B2b1.0<<

    end;

    [LineStart(9609)]
    local procedure IssuedtoReceivedfromOnBeforeIn();
    begin
        IF Status = Status::Released THEN
            //B2b1.0>>
            IssuedReceivedHideValue := FALSE
        ELSE
            IssuedReceivedHideValue := TRUE;

        /* CurrPage."Issued to/Received from".UPDATEEDITABLE(FALSE)
        ELSE
          CurrPage."Issued to/Received from".UPDATEEDITABLE(TRUE)
        *///B2b1.0<<

    end;

    [LineStart(9621)]
    local procedure DocNoOnBeforeInput();
    begin
        IF Status = Status::Released THEN
            //B2b1.0>>
            DocNoHideValue := FALSE
        ELSE
            DocNoHideValue := TRUE;

        /*  CurrPage."Doc No.".UPDATEEDITABLE(FALSE)
        ELSE
          CurrPage."Doc No.".UPDATEEDITABLE(TRUE)
        *///B2b1.0<<

    end;

    [LineStart(9633)]
    local procedure DateofIssueOnBeforeInput();
    begin
        IF Status = Status::Released THEN
            //B2b1.0>>
            DateofIssueHideValue := FALSE
        ELSE
            DateofIssueHideValue := TRUE;

        /* CurrPage."Date of Issue".UPDATEEDITABLE(FALSE)
        ELSE
          CurrPage."Date of Issue".UPDATEEDITABLE(TRUE)
        *///B2b1.0<<

    end;

    [LineStart(9645)]
    local procedure ClaimDateOnBeforeInput();
    begin
        IF Status = Status::Released THEN
            //B2b1.0>>
            ClaimDateHideValue := FALSE
        ELSE
            ClaimDateHideValue := TRUE;
        /* CurrPage."Claim Date".UPDATEEDITABLE(FALSE)
        ELSE
          CurrPage."Claim Date".UPDATEEDITABLE(TRUE)
        *///B2b1.0<<

    end;

    [LineStart(9656)]
    local procedure TypeofBGOnBeforeInput();
    begin
        IF Status = Status::Released THEN
            //B2b1.0>>
            TypeofBGHideValue := FALSE
        ELSE
            TypeofBGHideValue := TRUE;

        /* CurrPage."Type of BG".UPDATEEDITABLE(FALSE)
        ELSE
          CurrPage."Type of BG".UPDATEEDITABLE(TRUE)
        *///B2b1.0<<

    end;

    [LineStart(9668)]
    local procedure Description2OnBeforeInput();
    begin
        IF Status = Status::Released THEN
            //B2b1.0>>
            Description2HideValue := FALSE
        ELSE
            Description2HideValue := TRUE;

        /* CurrPage.Description2.UPDATEEDITABLE(FALSE)
        ELSE
          CurrPage.Description2.UPDATEEDITABLE(TRUE)
        *///B2b1.0<<

    end;

    [LineStart(9680)]
    local procedure BGValueOnBeforeInput();
    begin
        IF Status = Status::Released THEN
            //B2b1.0>>
            BGHideValue := FALSE
        ELSE
            BGHideValue := TRUE;

        /* CurrPage."BG Value".UPDATEEDITABLE(FALSE)
        ELSE
          CurrPage."BG Value".UPDATEEDITABLE(TRUE)
        *///B2b1.0<<

    end;

    [LineStart(9692)]
    local procedure BGMarginAmountOnBeforeInput();
    begin
        IF Status = Status::Released THEN
            //B2b1.0>>
            BGMarginAmountHideValue := FALSE
        ELSE
            BGMarginAmountHideValue := TRUE;

        /* CurrPage."BG Margin Amount".UPDATEEDITABLE(FALSE)
        ELSE
          CurrPage."BG Margin Amount".UPDATEEDITABLE(TRUE)
        *///B2b1.0<<

    end;

    [LineStart(9704)]
    local procedure AccountNoOnBeforeInput();
    begin
        IF Status = Status::Released THEN
            //B2b1.0>>
            AccountNoHideValue := FALSE
        ELSE
            AccountNoHideValue := TRUE;

        /* CurrPage."Account No.".UPDATEEDITABLE(FALSE)
        ELSE
          CurrPage."Account No.".UPDATEEDITABLE(TRUE)
        *///B2b1.0<<

    end;

    [LineStart(9716)]
    local procedure PostingAccountNoOnBeforeInput();
    begin
        IF Status = Status::Released THEN
            //B2b1.0>>
            PostingAccNoHideValue := FALSE
        ELSE
            PostingAccNoHideValue := TRUE;

        /* CurrPage."Posting Account No.".UPDATEEDITABLE(FALSE)
        ELSE
          CurrPage."Posting Account No.".UPDATEEDITABLE(TRUE)
        *///B2b1.0<<

    end;

    [LineStart(9728)]
    local procedure ExtendedOnBeforeInput();
    begin
        IF Status = Status::Released THEN
            //B2b1.0>>
            ExtendedHideValue := FALSE
        ELSE
            ExtendedHideValue := TRUE;

        /* CurrPage.Extended.UPDATEEDITABLE(FALSE)
        ELSE
          CurrPage.Extended.UPDATEEDITABLE(TRUE)
        *///B2b1.0<<

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

