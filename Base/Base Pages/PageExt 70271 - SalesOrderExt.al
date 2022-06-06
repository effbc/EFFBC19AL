pageextension 70271 SalesOrderExt extends 42
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter(AssemblyOrders)
        {
            action("<Order Stage Changing>")
            {
                Caption = 'Order Stage';
                Image = Status;
                trigger OnAction()
                var
                    selection: Integer;
                    pre_value: Integer;
                    stages: Label '&Not Assigned,&Order Pending,&Yet to Start,&Inprogress,&Ready For RDSO,&Under RDSO Inspection,&Ready For Dispatch,&Dispatched';
                begin
                    // ADDED BY VIJAYA ON 20-MAY-2016 for Changing Order Status
                    IF (USERID IN ['EFFTRONICS\VIJAYA', 'EFFTRONICS\PRANAVI', 'EFFTRONICS\ANILKUMAR', 'EFFTRONICS\SPURTHI', 'EFFTRONICS\BSATISH', 'EFFTRONICS\SARDHAR']) THEN BEGIN
                        CASE "Order Status" OF
                            "Order Status"::Dispatched:
                                pre_value := 8;
                            "Order Status"::Inprogress:
                                pre_value := 4;
                            "Order Status"::"Ready For Dispatch":
                                pre_value := 7;
                            "Order Status"::"Ready For RDSO":
                                pre_value := 5;
                            "Order Status"::"Under RDSO Inspection":
                                pre_value := 6;
                            "Order Status"::"Yet to Start":
                                pre_value := 3;
                            "Order Status"::"Order Pending":
                                pre_value := 2;
                            0:
                                pre_value := 1;
                        END;
                        selection := STRMENU(stages, pre_value);
                        CASE selection OF
                            1:
                                "Order Status" := 0;
                            2:
                                "Order Status" := "Order Status"::"Order Pending";
                            3:
                                "Order Status" := "Order Status"::"Yet to Start";
                            4:
                                "Order Status" := "Order Status"::Inprogress;
                            5:
                                "Order Status" := "Order Status"::"Ready For RDSO";
                            6:
                                "Order Status" := "Order Status"::"Under RDSO Inspection";
                            7:
                                "Order Status" := "Order Status"::"Ready For Dispatch";
                            8:
                                "Order Status" := "Order Status"::Dispatched;
                        END;
                        MODIFY;
                    END
                    ELSE
                        MESSAGE('YOU Do not have a Right to change Order Status');
                    //end by Vijaya
                end;
            }
            action("RDSO No Changing")
            {
                Caption = 'RDSO No Changing';
                trigger OnAction()
                var
                    selection: Integer;
                    pre_value: Integer;
                    RDSONo: Label '&Not Assigned,&Pending,&RDSO 01,&RDSO 02,&RDSO 03,&RDSO 04,&RDSO 05,&RDSO 06,&RDSO 07,&RDSO 08,&RDSO 09,&RDSO 10';
                begin
                    // ADDED BY VIJAYA ON 20-MAY-2016 for Changing Order Status
                    IF (USERID IN ['EFFTRONICS\VIJAYA', 'EFFTRONICS\PRANAVI', 'EFFTRONICS\ANILKUMAR', 'EFFTRONICS\SPURTHI', 'EFFTRONICS\BSATISH', 'EFFTRONICS\SARDHAR']) THEN BEGIN
                        CASE "RDSO No" OF
                            0:
                                pre_value := 1;
                            "RDSO No"::Pending:
                                pre_value := 2;
                            "RDSO No"::"RDSO 01":
                                pre_value := 3;
                            "RDSO No"::"RDSO 02":
                                pre_value := 4;
                            "RDSO No"::"RDSO 03":
                                pre_value := 5;
                            "RDSO No"::"RDSO 04":
                                pre_value := 6;
                            "RDSO No"::"RDSO 05":
                                pre_value := 7;
                            "RDSO No"::"RDSO 06":
                                pre_value := 8;
                            "RDSO No"::"RDSO 07":
                                pre_value := 9;
                            "RDSO No"::"RDSO 08":
                                pre_value := 10;
                            "RDSO No"::"RDSO 09":
                                pre_value := 11;
                            "RDSO No"::"RDSO 10":
                                pre_value := 12;
                        END;
                        selection := STRMENU(RDSONo, pre_value);
                        CASE selection OF
                            1:
                                "RDSO No" := 0;
                            2:
                                "RDSO No" := "RDSO No"::Pending;
                            3:
                                "RDSO No" := "RDSO No"::"RDSO 01";
                            4:
                                "RDSO No" := "RDSO No"::"RDSO 02";
                            5:
                                "RDSO No" := "RDSO No"::"RDSO 03";
                            6:
                                "RDSO No" := "RDSO No"::"RDSO 04";
                            7:
                                "RDSO No" := "RDSO No"::"RDSO 05";
                            8:
                                "RDSO No" := "RDSO No"::"RDSO 06";
                            9:
                                "RDSO No" := "RDSO No"::"RDSO 07";
                            10:
                                "RDSO No" := "RDSO No"::"RDSO 08";
                            11:
                                "RDSO No" := "RDSO No"::"RDSO 09";
                            12:
                                "RDSO No" := "RDSO No"::"RDSO 10";
                        END;
                        MODIFY;
                    END
                    ELSE
                        MESSAGE('YOU Do not have a Right to change Order Status');
                    //end by Vijaya
                end;
            }
            action("Order Verification")
            {
                Caption = 'Order Verification';
                trigger OnAction()
                var
                    USER: Record User;
                    usename: Text;
                    prompt: DotNet "'Microsoft.VisualBasic, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a'.Microsoft.VisualBasic.Interaction" RUNONCLIENT;
                    Remarks: Text;
                    salesperson: Record "Salesperson/Purchaser";
                    MailCC: Text;
                    Shedul2_Count: Integer;
                    LastModifiedDate: DateTime;
                    RegExp: Text;
                    Tot_amt: Text;
                    formataddress: Codeunit 365;
                    Shedul2_UOM: Text;
                    Shedul2_Amt: Text;
                    Itm: Record Item;
                begin
                    // Commented by Vishnu Priya on 28-09-2020 by the new process of CRROOM input from MD Sir.

                    /* IF NOT ("Sell-to Customer No." IN ['CUST00536', 'CUST01164']) THEN BEGIN
                    attachments.RESET;
                    attachments.SETFILTER(attachments."Document Type", '%1', "Document Type");
                    attachments.SETFILTER(attachments."Document No.", "No.");
                    attachments.SETFILTER(attachments."Attachment Status", '%1', TRUE);
                    IF NOT attachments.FINDFIRST THEN
                        ERROR('Please attach Sale Order Document/ LOA of the Order!');
                END
                ELSE BEGIN
                    IF Rec.Remarks = '' THEN   // Added by Pranavi on 06-Aprl-2016
                        ERROR('Please enter remarks for the Order in General Tab!\Remarks are mandatory for Efftronics Order!');
                END;
                Remarks := DELCHR(Remarks, '=', Quote);
                Remarks := StringReplaceFunction.ReplaceString(Remarks, '<br>', '');


                IF ("Order Verified" = TRUE) THEN BEGIN
                    IF (CONFIRM('Do you want to Send Mail for Removing Verified Status')) THEN BEGIN
                        USER.RESET;
                        USER.SETRANGE(USER."User Name", USERID);
                        IF USER.FINDFIRST THEN BEGIN
                            username := USER."Full Name";
                            IF USER.MailID <> '' THEN BEGIN
                                "Verfication Req MailID" := USER.MailID;
                                MODIFY;
                            END
                            ELSE BEGIN
                                MESSAGE('You do not have Mail-ID. Mail-ID is required for requesting');
                                EXIT;
                            END
                        END
                        ELSE
                            username := 'ERP User';
                        Remarks := InputBox();
                        IF (Remarks = '') THEN BEGIN
                            MESSAGE('You must enter Remarks');
                            EXIT;
                        END;
                        salesperson.RESET;
                        salesperson.SETRANGE(salesperson.Code, "Salesperson Code");
                        salesperson.SETFILTER(salesperson."E-Mail", '<>%1', '');// added by sujani
                        IF salesperson.FINDFIRST THEN
                            MailCC := 'anvesh@efftronics.com,' + salesperson."E-Mail"
                        ELSE
                            MailCC := 'anvesh@efftronics.com';
                        MailCC := MailCC + ',pmurali@efftronics.com';
                        Mail_From := 'ERP@efftronics.com';
                        Mail_To := "Verfication Req MailID" + ',vanidevi@efftronics.com,vsngeetha@efftronics.com';
                        Subject := 'Changes for Sale Order ' + "No.";
                        SMTP_MAIL.CreateMessage('ERP', Mail_From, Mail_To, Subject, Body, TRUE);
                        SMTP_MAIL.AddCC(MailCC);
                        SMTP_MAIL.AppendBody('<html><body><div style="border-color:white;  margin: 20px; border-width:10px; font-size:11pt;  border-style:solid; padding: 20px; width: 800px;">');
                        SMTP_MAIL.AppendBody('<div style="Background-color:#0971D9; color:#F0F1F5; "><br/><label><font size="4"> Sale Order Verification</font></label></div><br/>');
                        SMTP_MAIL.AppendBody('Dear Sir/Madam,');
                        SMTP_MAIL.AppendBody('<br><br>');
                        SMTP_MAIL.AppendBody('The Sale Order has been Verified. Need to Change the item Details So Please Remove the Verified Status<br><br>');
                        SMTP_MAIL.AppendBody('<br><br><b>Remarks</b><br>');
                        SMTP_MAIL.AppendBody(Remarks + '<br>');
                        SMTP_MAIL.AppendBody('<font size="3" color ="#0971D9">The Sale Order ' + "No." + '</font></label><br>');
                        SMTP_MAIL.AppendBody('<font size="2" color ="#0971D9">Customer Name :: ' + "Sell-to Customer Name" + '</font></label><br>');
                        SMTP_MAIL.AppendBody('<br><br>With Regards<br>');
                        SMTP_MAIL.AppendBody(username + '<br>');
                        SMTP_MAIL.AppendBody('<div style="Background-color:#0971D9; color:#F0F1F5; "><p align= "center">:::: AUTO GENERATED MAIL FROM ERP ::::</div><br/></div>');
                        //SMTP_MAIL.AppendBody(' This mail Sent to :: jhansi@efftronics.com ');
                        //SMTP_MAIL.AppendBody('This Mail CC to :: '+MailCC);
                        SMTP_MAIL.AddBCC('erp@efftronics.com');
                        SMTP_MAIL.Send;
                        "Verification Status" := "Verification Status"::Request;
                        MODIFY;
                        MESSAGE('Mail sent to Authorized Person');
                    END
                    ELSE
                        EXIT;
                END
                ELSE BEGIN
                    IF (CONFIRM('Do you want to Send Mail for Order Verification')) THEN BEGIN
                        USER.RESET;
                        USER.SETRANGE(USER."User Name", USERID);
                        IF USER.FINDFIRST THEN BEGIN
                            username := USER."Full Name";
                            IF USER.MailID <> '' THEN BEGIN
                                "Verfication Req MailID" := USER.MailID;
                                MODIFY;
                            END
                            ELSE BEGIN
                                MESSAGE('You do not have Mail-ID. Mail-ID is required for requesting');
                                EXIT;
                            END;
                            MODIFY;
                        END
                        ELSE
                            username := 'ERP User';
                        Remarks := InputBox();
                        IF (Remarks = '') THEN BEGIN
                            MESSAGE('You must enter Remarks');
                            EXIT;
                        END;
                        salesperson.RESET;
                        salesperson.SETRANGE(salesperson.Code, "Salesperson Code");
                        salesperson.SETFILTER(salesperson."E-Mail", '<>%1', '');// added by sujani
                        IF salesperson.FINDFIRST THEN
                            MailCC := 'anvesh@efftronics.com,' + salesperson."E-Mail"
                        ELSE
                            MailCC := 'anvesh@efftronics.com';
                        MailCC := MailCC + ',pmurali@efftronics.com';
                        Mail_From := 'ERP@efftronics.com';
                        Mail_To := "Verfication Req MailID" + ',vanidevi@efftronics.com,vsngeetha@efftronics.com';
                        Subject := 'Order Verification for Sale Order ' + "No.";
                        SMTP_MAIL.CreateMessage('ERP', Mail_From, Mail_To, Subject, Body, TRUE);
                        SMTP_MAIL.AddCC(MailCC);
                        SMTP_MAIL.AppendBody('<html><body><div style="border-color:white;  margin: 20px; border-width:10px; font-size:11pt;  border-style:solid; padding: 20px; width: 800px;">');
                        SMTP_MAIL.AppendBody('<div style="Background-color:#0971D9; color:#F0F1F5; "><br/><label><font size="4"> Sale Order Verification</font></label></div><br/>');
                        SMTP_MAIL.AppendBody('Dear Sir/Madam,');
                        SMTP_MAIL.AppendBody('<br><br>');
                        SMTP_MAIL.AppendBody('The Sale Order Need to be Released.Please Verify the Order.<br><br><label><font size="3" color ="#0971D9">The Sale Order ' + "No.");

                        // Added by Vijaya on 11-Jul-16 for Sending Log Entry
                        //                IF NOT (COPYSTR("No.",14,2) IN ['/L','/T']) THEN
                        //                BEGIN
                        SHA.RESET;
                        SHA.SETFILTER(SHA."No.", "No.");

                        //  for the 1st Time Releasing  Verification
                        IF NOT SHA.FINDFIRST THEN BEGIN
                            SMTP_MAIL.AppendBody('(New Order)</font></label><br>');
                            SMTP_MAIL.AppendBody('<font size="2" color ="#0971D9">Customer Name :: ' + "Sell-to Customer Name" + '</font></label><br>');
                            SMTP_MAIL.AppendBody('<br><table border="1" style="border-collapse:collapse; width:100%; font-size:10pt;"><tr><th><b>Item no.</b> </th><th>Item Description </th> <th>QTY</th><th>UOM</th><th>AMOUNT</th></tr>');
                            Shedul2_Count := 0;
                            SalesLine.RESET;
                            SalesLine.SETFILTER("Document No.", "No.");
                            IF SalesLine.FINDSET THEN
                                REPEAT
                                    Tot_amt := formataddress.ChangeCurrency(ROUND(SalesLine."Amount To Customer", 1));
                                    SMTP_MAIL.AppendBody('<tr><td>' + SalesLine."No." + '</td><td>' + SalesLine.Description + '</td><TD>' + FORMAT(SalesLine.Quantity) + '</TD><td>' + SalesLine."Unit of Measure" + '</td><td align=right>' + Tot_amt + '</td></tr>');
                                    SCHEDULEOMS.RESET;
                                    SCHEDULEOMS.SETCURRENTKEY("Document Type", "Document No.", "Document Line No.", "Line No.");
                                    SCHEDULEOMS.SETFILTER(SCHEDULEOMS."Document No.", SalesLine."Document No.");
                                    SCHEDULEOMS.SETFILTER(SCHEDULEOMS."Document Line No.", '%1', SalesLine."Line No.");
                                    SCHEDULEOMS.SETFILTER(SCHEDULEOMS."Line No.", '<>%1', 10000);
                                    IF SCHEDULEOMS.FINDSET THEN
                                        REPEAT
                                            IF SCHEDULEOMS."Document Line No." <> SCHEDULEOMS."Line No." THEN BEGIN
                                                Shedul2_UOM := '';
                                                Itm.RESET;
                                                Itm.SETCURRENTKEY("No.");
                                                Itm.SETFILTER(Itm."No.", SCHEDULEOMS."No.");
                                                IF Itm.FINDFIRST THEN
                                                    Shedul2_UOM := Itm."Base Unit of Measure";
                                                Shedul2_Amt := '';
                                                Shedul2_Count := Shedul2_Count + 1;
                                                SMTP_MAIL.AppendBody('<tr><td style="color:#FF0000">' + '  ' + SCHEDULEOMS."No." + '</td><td style="color:#FF0000">' + '  ' + SCHEDULEOMS.Description + '</td>');
                                                SMTP_MAIL.AppendBody('<TD style="color:#FF0000">' + FORMAT(SCHEDULEOMS.Quantity) + '</TD><td style="color:#FF0000">' + Shedul2_UOM + '</td><td align=right style="color:#FF0000">' + Shedul2_Amt + '</td></tr>');
                                            END;
                                        UNTIL SCHEDULEOMS.NEXT = 0;
                                UNTIL SalesLine.NEXT = 0;
                            SMTP_MAIL.AppendBody('</Table>');
                            IF Shedul2_Count > 0 THEN
                                SMTP_MAIL.AppendBody('<BR><p align ="left" style="color:#FF0000"> Note: Red Color Items are Schedule Items</p>');
                        END

                        //  for already Relased Order Verification
                        ELSE BEGIN
                            SMTP_MAIL.AppendBody('(Re-Verfying Order)</font></label><br>');
                            SMTP_MAIL.AppendBody('<font size="2" color ="#0971D9">Customer Name :: ' + "Sell-to Customer Name" + '</font></label><br>');
                            SMTP_MAIL.AppendBody('<br>Sales Lines Items Modifications ::');
                            CHANGELOGSETUP.RESET;
                            CHANGELOGSETUP.SETCURRENTKEY("Table No.", "Date and Time");
                            CHANGELOGSETUP.SETRANGE(CHANGELOGSETUP."Table No.", 36);
                            CHANGELOGSETUP.SETRANGE(CHANGELOGSETUP."Field No.", 80002);
                            CHANGELOGSETUP.SETRANGE(CHANGELOGSETUP."Primary Key Field 2 Value", "No.");
                            CHANGELOGSETUP.SETRANGE(CHANGELOGSETUP."New Value", 'false');
                            IF CHANGELOGSETUP.FINDLAST THEN BEGIN
                                LastModifiedDate := CHANGELOGSETUP."Date and Time";
                            END;
                            CHANGELOGSETUP.RESET;
                            CHANGELOGSETUP.SETCURRENTKEY("Table No.", "Primary Key Field 2 Value", "Primary Key Field 3 Value", "Date and Time");
                            CHANGELOGSETUP.SETRANGE(CHANGELOGSETUP."Table No.", 37);
                            CHANGELOGSETUP.SETRANGE(CHANGELOGSETUP."Primary Key Field 2 Value", "No.");
                            CHANGELOGSETUP.SETFILTER(CHANGELOGSETUP."Date and Time", '>%1', LastModifiedDate);
                            CHANGELOGSETUP.SETFILTER(CHANGELOGSETUP."Field No.", '%1|%2|%3|%4|%5|%6', 6, 15, 80006, 7, 60, 50002);
                            SMTP_MAIL.AppendBody('<br><table border="1" style="border-collapse:collapse; width:100%; font-size:10pt;"><tr><th><b>Line no.</b></th><th>Item No.');
                            SMTP_MAIL.AppendBody('</th><th>Item Description </th><th>Type of Change</th><th>Changed Field</th><th>Previous Value</th>');
                            SMTP_MAIL.AppendBody('<th>New Value</th></tr>');
                            IF CHANGELOGSETUP.FINDSET THEN
                                REPEAT
                                    SalesLine.RESET;
                                    SalesLine.SETRANGE(SalesLine."Document No.", "No.");
                                    SalesLine.SETFILTER(SalesLine."Line No.", CHANGELOGSETUP."Primary Key Field 3 Value");
                                    IF SalesLine.FINDSET THEN BEGIN
                                        SMTP_MAIL.AppendBody('<tr><td>' + CHANGELOGSETUP."Primary Key Field 3 Value" + '</td><td>' + SalesLine."No." + '</td><td>' + SalesLine.Description + '</td>');
                                        CASE CHANGELOGSETUP."Type of Change" OF
                                            CHANGELOGSETUP."Type of Change"::Insertion:
                                                SMTP_MAIL.AppendBody('<td>Insertion</td>');
                                            CHANGELOGSETUP."Type of Change"::Modification:
                                                SMTP_MAIL.AppendBody('<td>Modification</td>');
                                            CHANGELOGSETUP."Type of Change"::Deletion:
                                                SMTP_MAIL.AppendBody('<td>Deletion</td>');
                                        END;
                                        CASE CHANGELOGSETUP."Field No." OF
                                            6:
                                                SMTP_MAIL.AppendBody('<td>Item No</td>');
                                            15:
                                                SMTP_MAIL.AppendBody('<td>Quantity</td>');
                                            80006:
                                                SMTP_MAIL.AppendBody('<td>Pending Qty</td>');
                                            7:
                                                SMTP_MAIL.AppendBody('<td>Laction Code</td>');
                                            60:
                                                SMTP_MAIL.AppendBody('<td>Qty to Shipped</td>');
                                            50002:
                                                SMTP_MAIL.AppendBody('<td>Packet No</td>');
                                        END;
                                        SMTP_MAIL.AppendBody('</td><td>' + CHANGELOGSETUP."Old Value" + '</td><td>');
                                        IF CHANGELOGSETUP."Field No." = 6 THEN BEGIN
                                            Itm.RESET;
                                            Itm.SETFILTER(Itm."No.", CHANGELOGSETUP."New Value");
                                            IF Itm.FINDSET THEN BEGIN
                                                CASE Itm."Item Status" OF
                                                    Itm."Item Status"::Obsolete:
                                                        SMTP_MAIL.AppendBody(CHANGELOGSETUP."New Value" + '(Obsolete)</td></tr>');
                                                    Itm."Item Status"::"In-Active":
                                                        SMTP_MAIL.AppendBody(CHANGELOGSETUP."New Value" + '(In-Active)</td></tr>');
                                                    ELSE
                                                        SMTP_MAIL.AppendBody(CHANGELOGSETUP."New Value" + '</td></tr>');
                                                END;
                                            END;
                                        END
                                        ELSE
                                            SMTP_MAIL.AppendBody(CHANGELOGSETUP."New Value" + '</td></tr>');
                                    END;
                                UNTIL CHANGELOGSETUP.NEXT = 0;
                            SMTP_MAIL.AppendBody('</table>');
                            SMTP_MAIL.AppendBody('<br>Shedule Items Modifications :: ');
                            SalesLine.RESET;
                            SalesLine.SETRANGE(SalesLine."Document No.", "No.");
                            CHANGELOGSETUP.RESET;
                            CHANGELOGSETUP.SETCURRENTKEY("Table No.", "Primary Key Field 2 Value", "Primary Key Field 3 Value", "Date and Time");
                            CHANGELOGSETUP.SETRANGE(CHANGELOGSETUP."Table No.", 60095);
                            CHANGELOGSETUP.SETRANGE(CHANGELOGSETUP."Primary Key Field 2 Value", "No.");
                            CHANGELOGSETUP.SETFILTER(CHANGELOGSETUP."Date and Time", '>%1', LastModifiedDate);
                            CHANGELOGSETUP.SETFILTER(CHANGELOGSETUP."Field No.", '%1|%2', 5, 7);
                            SMTP_MAIL.AppendBody('<br><table border="1" style="border-collapse:collapse; width:100%; font-size:10pt;"><tr><th><b>Sales Line no.</b></th><th>Sales Item No.');
                            SMTP_MAIL.AppendBody('</th><th>Item Description </th><th>Type of Change</th><th>Changed Field</th><th>Previous Value</th>');
                            SMTP_MAIL.AppendBody('<th>New Value</th></tr>');

                            IF SalesLine.FINDSET THEN
                                REPEAT
                                    CHANGELOGSETUP.SETFILTER(CHANGELOGSETUP."Primary Key Field 3 Value", FORMAT(SalesLine."Line No."));
                                    RegExp := '*' + FORMAT(SalesLine."Line No.") + '*' + FORMAT(SalesLine."Line No.") + '*';
                                    CHANGELOGSETUP.SETFILTER(CHANGELOGSETUP."Primary Key", '<>%1', RegExp);
                                    IF CHANGELOGSETUP.FINDSET THEN
                                        REPEAT
                                            SMTP_MAIL.AppendBody('<tr><td>' + CHANGELOGSETUP."Primary Key Field 3 Value" + '</td><td>' + SalesLine."No." + '</td><td>' + SalesLine.Description + '</td>');
                                            CASE CHANGELOGSETUP."Type of Change" OF
                                                CHANGELOGSETUP."Type of Change"::Insertion:
                                                    SMTP_MAIL.AppendBody('<td>Insertion</td>');
                                                CHANGELOGSETUP."Type of Change"::Modification:
                                                    SMTP_MAIL.AppendBody('<td>Modification</td>');
                                                CHANGELOGSETUP."Type of Change"::Deletion:
                                                    SMTP_MAIL.AppendBody('<td>Deletion</td>');
                                            END;
                                            CASE CHANGELOGSETUP."Field No." OF
                                                5:
                                                    SMTP_MAIL.AppendBody('<td>Item No</td>');
                                                7:
                                                    SMTP_MAIL.AppendBody('<td>Quantity</td>');
                                            END;
                                            SMTP_MAIL.AppendBody('</td><td>' + CHANGELOGSETUP."Old Value" + '</td><td>');
                                            IF CHANGELOGSETUP."Field No." = 5 THEN BEGIN
                                                Itm.RESET;
                                                Itm.SETFILTER(Itm."No.", CHANGELOGSETUP."New Value");
                                                IF Itm.FINDSET THEN BEGIN
                                                    CASE Itm."Item Status" OF
                                                        Itm."Item Status"::Obsolete:
                                                            SMTP_MAIL.AppendBody(CHANGELOGSETUP."New Value" + '(Obsolete)</td></tr>');
                                                        Itm."Item Status"::"In-Active":
                                                            SMTP_MAIL.AppendBody(CHANGELOGSETUP."New Value" + '(In-Active)</td></tr>');
                                                        ELSE
                                                            SMTP_MAIL.AppendBody(CHANGELOGSETUP."New Value" + '</td></tr>');
                                                    END;
                                                END;
                                            END;
                                        UNTIL CHANGELOGSETUP.NEXT = 0;
                                UNTIL SalesLine.NEXT = 0;
                        END;
                        //                END;
                        //end by Vijaya on 11-Jul-16



                        SMTP_MAIL.AppendBody('<br><br><b>Remarks</b><br>');
                        SMTP_MAIL.AppendBody(Remarks + '<br><br>');
                        SMTP_MAIL.AppendBody('<br><br>With Regards<br>');
                        SMTP_MAIL.AppendBody(username + '<br>');
                        SMTP_MAIL.AppendBody('<div style="Background-color:#0971D9; color:#F0F1F5; "><p align= "center">:::: AUTO GENERATED MAIL FROM ERP ::::</div><br/></div>');
                        //SMTP_MAIL.AppendBody(' This mail Sent to :: jhansi@efftronics.com ');
                        //SMTP_MAIL.AppendBody('This Mail CC to :: '+MailCC);
                        SMTP_MAIL.AddBCC('erp@efftronics.com');
                        SMTP_MAIL.Send;
                        "Verification Status" := "Verification Status"::Request;
                        MODIFY;
                        MESSAGE('Mail sent to Authorized Person');
                    END
                    ELSE
                        EXIT;
                END; */

                end;
            }
        }
        addafter(Action21)
        {
            action(Release)
            {
                Visible = False;
                trigger OnAction()
                var
                    SHA: Record "Sales Header Archive";
                begin
                    SHA.RESET;
                    SHA.SETFILTER(SHA."No.", "No.");
                    IF NOT SHA.FINDFIRST THEN
                        "First Released Date Time" := CURRENTDATETIME;
                    Modifications_mail;
                end;
            }
        }
        modify(Reopen)
        {
            Visible = false;
        }
        addafter(Reopen)
        {
            action("Check List")
            {
                Caption = 'Check List';
                RunObject = Page "Check List";
                RunPageLink = "Document Type" = CONST(Sales), "Document No." = FIELD("No.");
                Image = CheckList;
            }
            action("&MSPT Order Details")
            {
                Caption = '&MSPT Order Details';
                RunObject = Page "MSPT Order Details";
                RunPageLink = Type = CONST(Sale), "Document Type" = FIELD("Document Type"), "Document No." = FIELD("No."), "MSPT Header Code" = FIELD("MSPT Code"), "Party No." = FIELD("Sell-to Customer No.");
                Image = OrderTracking;
            }
            action(Schedule)
            {
                Caption = 'Schedule';
                RunObject = Page Schedule;
                RunPageLink = "Document No." = FIELD("Tender No."), "Document Type" = CONST(Order);
                Image = Planning;
            }
            group("&Line")
            {
                Caption = '&Line';
                Visible = true;
                action("Create Prod. Order")
                {
                    Caption = 'Create Prod. Order';
                    Image = GetOrder;
                    trigger OnAction()
                    var
                        NewStatus2: 'Simulated,Planned,"Firm Planned",Released';
                        NewOrderType2: 'ItemOrder,ProjectOrder';
                    begin
                        /* SalesPlanPage.SetSalesOrder("No.");
                        SalesPlanPage.RUNMODAL; */


                        //IF CreateOrderPage.RUNMODAL <> ACTION::Yes THEN
                        //EXIT;
                        Window.OPEN('Action is under process.......');

                        SalesPlanLine.DELETEALL;
                        Quantity := CurrPage.SalesLines.PAGE.MakeLines(SalesLineRec);

                        NewStatus2 := NewStatus2::Released;
                        NewOrderType2 := NewOrderType2::ItemOrder;
                        //CreateOrderPage.ReturnPostingInfo(NewStatus2,NewOrderType2);
                        /* IF ("sales header"."Document Type" = "sales header"."Document Type"::Order) THEN BEGIN
                   //MESSAGE('hai');
                   IF "Order Assurance" = FALSE THEN
                       ERROR('Order Was not Assured By Sales Dept.');
                   //end ELSE
                   //BEGIN
                   MESSAGE(FORMAT(Quantity));
                   FOR I := 1 TO Quantity
                   DO BEGIN
                       // MESSAGE('hi');
                       Qty := 1;
                       CreateOrders(Qty);
                   END;
               END; */
                        IF "Order Assurance" = FALSE THEN
                            ERROR('Order Was not Assured By Sales Dept.')
                        ELSE BEGIN
                            FOR I := 1 TO Quantity
                              DO BEGIN
                                Qty := 1;
                                CreateOrders(Qty);
                            END;
                        END;
                        Window.CLOSE;
                        //IF NOT CreateOrders THEN
                        //MESSAGE(Text001);

                        //SalesPlanLine.SETRANGE("Planning Status");

                        //BuildForm;

                        //CurrPage.UPDATE;
                    end;
                }
                action(CreateProdOrderforAll)
                {
                    Caption = 'Create Prod. Order for All';
                    Image = OrderList;
                    trigger OnAction()
                    var
                        NewStatus2: 'Simulated,Planned,"Firm Planned",Released';
                        NewOrderType2: 'ItemOrder,ProjectOrder';
                        SalesLine3: Record "Sales Line";
                        Schedule2LRec: Record Schedule2;
                        SalesPlanLineLRec: Record "Sales Planning Line";
                        ProdMakeQty: Integer;
                        SOSchedule: Page "SO Schedule";
                        SalesHeaderLRec: Record "Sales Header";
                        i: Integer;
                        Qty: Integer;
                        ProductionOrder: Record "Production Order";
                        ItemUnitofMeasure: Record "Item Unit of Measure";
                    begin
                        ProductionOrder.RESET;
                        ProductionOrder.SETRANGE(Status, ProductionOrder.Status::Released);
                        ProductionOrder.SETRANGE("Sales Order No.", Rec."No.");
                        IF ProductionOrder.FINDFIRST THEN
                            ERROR('RPO has been created for this order');

                        Window.OPEN('Action is under process.......');
                        IF "Order Assurance" = FALSE THEN
                            ERROR('Order Was not Assured By Sales Dept.')
                        ELSE BEGIN //B2BJM 06-Feb-2020 >>  creating rpo for all the lines in sales order
                            SalesLine2.RESET;
                            SalesLine2.SETRANGE("Document Type", Rec."Document Type");
                            SalesLine2.SETRANGE("Document No.", Rec."No.");
                            SalesLine2.SETRANGE(Type, SalesLine2.Type::Item);
                            SalesLine2.SETFILTER("Outstanding Quantity", '>%1', 0);
                            ItemUnitofMeasure.RESET;
                            IF SalesLine2.FINDSET THEN BEGIN
                                REPEAT
                                    SalesPlanLine.DELETEALL;
                                    Quantity := CurrPage.SalesLines.PAGE.MakeLinesSingle(SalesLine2);
                                    IF SalesLine2."Unit of Measure Code" <> 'NOS' THEN BEGIN
                                        IF ItemUnitofMeasure.GET(SalesLine2."No.", SalesLine2."Unit of Measure Code") THEN
                                            CreateOrdersForAll(Quantity * ItemUnitofMeasure."Qty. per Unit of Measure");
                                    END ELSE
                                        CreateOrdersForAll(Quantity);
                                UNTIL SalesLine2.NEXT = 0;
                            END;
                            //For Schedule items
                            SalesLine3.RESET;
                            SalesLine3.SETRANGE("Document Type", Rec."Document Type");
                            SalesLine3.SETRANGE("Document No.", Rec."No.");
                            SalesLine3.SETRANGE(Type, SalesLine3.Type::Item);
                            SalesLine3.SETFILTER("Pending By", '%1', SalesLine3."Pending By"::" ");//need to confirm
                            IF SalesLine3.FINDSET THEN
                                REPEAT
                                    Schedule2LRec.RESET;
                                    Schedule2LRec.SETRANGE("Document Type", SalesLine3."Document Type");
                                    Schedule2LRec.SETRANGE("Document No.", SalesLine3."Document No.");
                                    Schedule2LRec.SETRANGE("Document Line No.", SalesLine3."Line No.");
                                    Schedule2LRec.SETFILTER("Line No.", '>%1', SalesLine3."Line No.");
                                    Schedule2LRec.SETFILTER("Posting Group", '%1', '*MPBI*');
                                    IF Schedule2LRec.FINDSET THEN BEGIN
                                        IF SalesHeaderLRec.GET(Rec."Document Type", Rec."No.") THEN
                                            IF SalesHeaderLRec."Order Assurance" = FALSE THEN
                                                ERROR('Order Was not Assured By Sales Dept.');
                                        REPEAT
                                            SalesPlanLineLRec.DELETEALL;
                                            ProdMakeQty := SOSchedule.MakeLinesForSchedules(Schedule2LRec);
                                            IF SalesLine3."Unit of Measure Code" <> 'NOS' THEN BEGIN
                                                IF ItemUnitofMeasure.GET(SalesLine3."No.", SalesLine3."Unit of Measure Code") THEN
                                                    SOSchedule.CreateOrdersForSchedules(ProdMakeQty * ItemUnitofMeasure."Qty. per Unit of Measure")
                                            END ELSE
                                                SOSchedule.CreateOrdersForSchedules(ProdMakeQty);
                                        //       FOR i := 1 TO ProdMakeQty
                                        //         DO BEGIN
                                        //           Qty := 1;
                                        //           SOSchedule.CreateOrders(Qty);
                                        //         END;
                                        UNTIL Schedule2LRec.NEXT = 0;
                                    END;
                                UNTIL SalesLine3.NEXT = 0;
                        END;
                        Window.CLOSE;
                    end;
                }
                action(CreateSingleProdOrder)
                {
                    Caption = 'Create Single  Prod. Order';
                    Image = GetOrder;
                    trigger OnAction()
                    var
                        NewStatus2: 'Simulated,Planned,"Firm Planned",Released';
                        NewOrderType2: 'ItemOrder,ProjectOrder';
                        SalesLine: Record "Sales Line";
                        ProductionOrder: Record "Production Order";
                        ItemUnitofMeasure: Record "Item Unit of Measure";
                    begin
                        NewStatus2: 'Simulated,Planned,"Firm Planned",Released';
                        NewOrderType2: 'ItemOrder,ProjectOrder';
                        SalesLine : Record "Sales Line";
                        ProductionOrder : Record "Production Order";
                        ItemUnitofMeasure : Record "Item Unit of Measure";
                        BEGIN
                            ProductionOrder.RESET;
                            ProductionOrder.SETRANGE(Status, ProductionOrder.Status::Released);
                            ProductionOrder.SETRANGE("Sales Order No.", Rec."No.");
                            IF ProductionOrder.FINDFIRST THEN
                                ERROR('RPO has been created for this order');

                            Window.OPEN('Action under progress');
                            IF "Order Assurance" = FALSE THEN
                                ERROR('Order Was not Assured By Sales Dept.');

                            SalesLine.RESET;
                            SalesLine.SETRANGE("Document Type", SalesLine."Document Type"::Order);
                            SalesLine.SETRANGE("Document No.", Rec."No.");
                            SalesLine.SETRANGE(Type, SalesLine.Type::Item);
                            SalesLine.SETFILTER("Prod. Qty", '>%1', 0);
                            IF SalesLine.FINDSET THEN
                                REPEAT
                                    Quantity := CurrPage.SalesLines.PAGE.MakeLinesSingleQuantity(SalesLine);
                                    IF SalesLine."Unit of Measure Code" <> 'NOS' THEN BEGIN
                                        IF ItemUnitofMeasure.GET(SalesLine."No.", SalesLine."Unit of Measure Code") THEN
                                            QtyGvar := Quantity * ItemUnitofMeasure."Qty. per Unit of Measure";
                                    END ELSE
                                        QtyGvar := Quantity;

                                    FOR I := 1 TO QtyGvar
                                      DO BEGIN
                                        Qty := 1;
                                        AssignDate(TRUE);
                                        CreateOrders(Qty);
                                    END;
                                UNTIL SalesLine.NEXT = 0;
                            Window.CLOSE;
                        end;
                }
            }
        }
        modify("Archive Document")
        {
            Visible = false;
        }
        addafter("Archive Document")
        {
            action(Attachments)
            {
                Caption = 'Attachments';
                Image = Attach;
                trigger OnAction()
                begin
                    CustAttachments;
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        "sales header".SETRANGE("sales header"."No.", "No.");
        IF "sales header".FINDFIRST THEN BEGIN
            IF "sales header"."Order Assurance" = FALSE THEN
                "Order AssuranceEditable" := TRUE
            ELSE
                "Order AssuranceEditable" := FALSE;

            IF "sales header"."Order Date" = 0D THEN // added on 26-03-18 by sujani not to change order date once it is freezed
                order_date_editable := TRUE
            ELSE
                order_date_editable := FALSE;

            /*  IF "sales header"."Sale Order Total Amount" > 0 THEN
           CurrPAGE."Sale Order Total Amount".EDITABLE := FALSE
       ELSE
           CurrPage."Sale Order Total Amount".EDITABLE := TRUE;

       IF "sales header"."Salesperson Code" = '' THEN
           CurrPAGE."Salesperson Code".EDITABLE := TRUE
       ELSE
           CurrPAGE."Salesperson Code".EDITABLE := FALSE;
       IF "sales header"."Exp.Payment" > 0 THEN
           CurrPAGE."Exp.Payment".EDITABLE := FALSE
       ELSE
           CurrPAGE."Exp.Payment".EDITABLE := TRUE;

       IF "sales header"."Security Deposit Amount" > 0 THEN
           CurrPAGE."Security Deposit Amount".EDITABLE := FALSE
       ELSE
           CurrPAGE."Security Deposit Amount".EDITABLE := TRUE;   */
        END;

        "sales header".RESET;
        "sales header".SETFILTER("sales header"."External Document No.", '<>%1', ' ');
        IF "sales header".FINDSET THEN
            REPEAT
                "sales header"."External Document No." := '';
                "sales header".MODIFY;
            UNTIL "sales header".NEXT = 0;


        forwordtooms := 'Need To Press FORWARD OMS Button';
        IF "Installation Amount(CS)" > 0 THEN
            InstallationAmountCSEditable := FALSE
        ELSE
            InstallationAmountCSEditable := TRUE;
        IF USERID = 'EFFTRONICS\PRANAVI' THEN
            testvisible := TRUE
        ELSE
            testvisible := FALSE;


        IF USERID IN ['EFFTRONICS\PRANAVI'] THEN
            Editable_Bool := TRUE
        ELSE
            Editable_Bool := FALSE;


        SalesLine.RESET;
        SalesLine.SETFILTER(SalesLine."Document No.", Rec."No.");
        IF SalesLine.FINDSET THEN BEGIN
            SalesLine."Sell-to Customer Name" := Rec."Sell-to Customer Name";
            SalesLine."Prod. Qty" := SalesLine."Outstanding Quantity"; // added by sujani on 04-02-2020
            SalesLine."Prod. Due Date" := TODAY;// added by sujani on 04-02-2020
            SalesLine.MODIFY;
        END;
    end;

    trigger OnAfterGetRecord()
    begin
        "sales header".SETRANGE("sales header"."No.", "No.");
        IF "sales header".FINDFIRST THEN BEGIN
            IF "sales header"."Order Assurance" = FALSE THEN
                "Order AssuranceEditable" := TRUE
            ELSE
                "Order AssuranceEditable" := FALSE;
            /* IF "sales header"."Sale Order Total Amount" > 0 THEN
                CurrPAGE."Sale Order Total Amount".EDITABLE := FALSE
            ELSE
                CurrPAGE."Sale Order Total Amount".EDITABLE := TRUE;
            IF "sales header"."Salesperson Code" = '' THEN
                CurrPAGE."Salesperson Code".EDITABLE := TRUE
            ELSE
                CurrPAGE."Salesperson Code".EDITABLE := FALSE;

            IF "sales header"."Exp.Payment" > 0 THEN
                CurrPAGE."Exp.Payment".EDITABLE := FALSE
            ELSE
                CurrPAGE."Exp.Payment".EDITABLE := TRUE;

            IF "sales header"."Security Deposit Amount" > 0 THEN
                CurrPAGE."Security Deposit Amount".EDITABLE := FALSE
            ELSE
                CurrPAGE."Security Deposit Amount".EDITABLE := TRUE; */
        END;
        CHANGELOGSETUP.SETFILTER(CHANGELOGSETUP."Primary Key Field 2 Value", FORMAT("No."));
        CHANGELOGSETUP.SETFILTER(CHANGELOGSETUP."Field No.", '<>%1|%2|%3', 60016, 60017, 60117);
        IF CHANGELOGSETUP.COUNT > 0 THEN
            forwordomsVisible := TRUE
        ELSE
            forwordomsVisible := FALSE;
        IF "Installation Amount(CS)" > 0 THEN
            InstallationAmountCSEditable := FALSE
        ELSE
            InstallationAmountCSEditable := TRUE;
        NoOnFormat;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        IF (NOT (FLAG_VALUE)) THEN BEGIN
            //MESSAGE('TRIGGER OF ON MODIFY RECORD');
            TESTFIELD(Status, Status::Open);
        END;
    end;

    var
        "sales header": Record "Sales Header";
        "Order AssuranceEditable": Boolean /*INDATASET*/;
        order_date_editable: Boolean;
        forwordtooms: Text[50];
        InstallationAmountCSEditable: Boolean /*INDATASET*/;
        testvisible: Boolean;
        Editable_Bool: Boolean;
        SalesLine2: Record "Sales Line";
        SalesLine: Record "Sales Line";
        CHANGELOGSETUP: Record "Change Log Entry";
        forwordomsVisible: Boolean /*INDATASET*/;
        FLAG_VALUE: Boolean;
        Window: Dialog;
        SalesPlanLine: Record "Sales Planning Line";

        SalesLineRec: Record "Sales Line";
        Quantity: Decimal;
        I: Integer;
        Qty: Decimal;


}