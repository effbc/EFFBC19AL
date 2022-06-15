pageextension 70271 SalesOrderExt extends 42
{
    layout
    {
        modify("Sell-to Customer No.")
        {
            trigger OnBeforeValidate()
            begin
                CUS.SETRANGE(CUS."No.", "Sell-to Customer No.");
                IF CUS.FINDFIRST THEN BEGIN
                    // Added by Pranavi on 22-Jul-2016
                    IF (CUS."Copy Sell-to Addr. to Qte From" = CUS."Copy Sell-to Addr. to Qte From"::Company) AND (CUS."T.I.N. No." = '') AND
                       (NOT (CUS."Customer Posting Group" IN ['EXPORT', 'RAILWAYS'])) THEN
                        ERROR('Please enter the T.I.N Number in Customer Card in Taxes Information Tab for Customer :' + CUS."No.");
                    // END by Pranavi
                    Territory := CUS."Territory Code";
                    IF (CUS."Customer Posting Group" IN ['PRIVATE', 'OTHERS']) AND NOT (CUS."No." IN ['CUST00536', 'CUST01164']) THEN
                        IF CUS."Payment Terms Code" = '' THEN
                            ERROR('Please enter Payment Terms Code in customer card for the customer: ' + CUS.Name);
                END;
                IF "Sell-to Customer No." <> xRec."Sell-to Customer No." THEN BEGIN
                    SL1.RESET;
                    SL1.SETRANGE(SL1."Document Type", SL1."Document Type"::Order);
                    SL1.SETRANGE(SL1."Document No.", "No.");
                    SL1.SETFILTER(SL1."No.", '<>%1', '');
                    SL1.SETFILTER(SL1.Quantity, '>%1', 0);
                    IF SL1.FINDSET THEN
                        REPEAT
                            IF SL1."Quantity Invoiced" > 0 THEN
                                ERROR('You Cannot Change the Customer as some of the items already invoiced!');
                        UNTIL SL1.NEXT = 0;
                END;
            end;
        }
        modify("Sell-to Customer Name")
        {
            Editable = true;
        }
        modify("Sell-to Address")
        {
            Editable = false;
        }
        modify("Sell-to Address 2")
        {
            Editable = true;
        }
        modify("Sell-to Post Code")
        {
            Caption = 'Sell-to Post Code/City *';
            Editable = false;
        }
        modify("Sell-to City")
        {
            Editable = true;
        }
        addafter("No. of Archived Versions")
        {
            field(Control980; Comment)
            {
                Editable = False;
            }
            field("Installation Amount"; "Installation Amount")
            {
                Editable = FALSE;
            }
            field("Bought out Items Amount"; "Bought out Items Amount")
            {
                Editable = FALSE;
            }
            field(Product; Product)
            {
                Caption = 'Product *';
            }
            field("Software Amount"; "Software Amount")
            {
                Editable = false;
            }
            field("<Salesperson Code 2>"; "Salesperson Code")
            {
                Editable = true;
                QuickEntry = FALSE;
                trigger OnValidate()
                begin
                    SalespersonCodeOnAfterValidate;
                end;
            }
            field("Tax Area Code"; "Tax Area Code")
            {

            }
            field("<Status 2>"; Status)
            {
                Importance = Promoted;
                Editable = FALSE;
                QuickEntry = FALSE;
            }
        }
        modify("Order Date")
        {
            Editable = order_date_editable;
        }
        modify("Document Date")
        {
            Caption = 'Document Date *';
        }
        modify("Requested Delivery Date")
        {
            Caption = 'Requested Delivery Date';
            trigger OnBeforeValidate()
            begin
                IF "Order Date" > "Requested Delivery Date" THEN
                    ERROR('Requested Delivery Date Must be Greater than Order Date');
                //added by Vishnu on 23-11-2020
                SalesLine2.RESET;
                SalesLine2.SETRANGE("Document No.", Rec."No.");
                SalesLine2.SETFILTER("Outstanding Quantity", '>0');
                SalesLine2.SETFILTER(MainCategory, '<>%1', 8);
                SalesLine2.SETFILTER("Call Letter Exp Date", '<>%1', 0D);
                IF SalesLine2.FINDSET THEN
                    REPEAT
                        SalesLine2."Call Letter Exp Date" := Rec."Requested Delivery Date";
                        SalesLine2.MODIFY;
                    UNTIL SalesLine2.NEXT = 0;
                //added by Vishnu on 23-11-2020
            end;
        }
        modify("Promised Delivery Date")
        {
            Caption = 'Promised Delivery Date';
        }
        addafter("Promised Delivery Date")
        {
            field("Project Completion Date"; "Project Completion Date")
            {

            }
            field("Order Released Date"; "Order Released Date")
            {
                Editable = false;
            }
            field(InvoiceNos; InvoiceNos)
            {
                Caption = 'INVOICE NO SERIES';
                trigger OnValidate()
                begin
                    IF "Posting Date" = 0D THEN
                        ERROR('Enter posting date');
                    //commented bu vishnu

                    IF "Posting Date" < TODAY THEN    // Added by Pranavi on 16-04-2016 for correction of prev year ext doc no. updatation
                        ERROR('Posting Date should not be Previous date!');


                    ExtenalDocNo(InvoiceNos, "Posting Date");
                    //ChooseInvoice;
                end;
            }
        }
        modify("External Document No.")
        {
            Editable = true;
        }
        addafter("External Document No.")
        {
            field("Total Order(LOA)Value"; "Total Order(LOA)Value")
            {
                Editable = false;
            }
            field("Pending(LOA)Value"; "Pending(LOA)Value")
            {
                Editable = false;
            }
            field("Sale Order Total Amount"; "Sale Order Total Amount")
            {
                Caption = 'Sale Order Total Amount *';
                Editable = true;
                trigger OnValidate()
                begin
                    /* IF "Sale Order Total Amount">0 THEN
                            CurrPage."Sale Order Total Amount".EDITABLE:=FALSE
                            ELSE
                          CurrPage."Sale Order Total Amount".EDITABLE:=TRUE; */

                    //Added by sundar(26-03-12) to reflect the changes in Saler order total amount to the invoices all ready posted
                    SIH.RESET;
                    SIH.SETFILTER(SIH."Order No.", "No.");
                    IF SIH.FINDFIRST THEN
                        REPEAT
                            SIH."Sale Order Total Amount" := "Sale Order Total Amount";
                            SIH.MODIFY;
                        UNTIL SIH.NEXT = 0;
                    //sundar(26-03-12)
                end;
            }
            field("Customer OrderNo."; "Customer OrderNo.")
            {
                Caption = 'Customer OrderNo. *';
            }
            field("Customer Order Date"; "Customer Order Date")
            {
                Caption = 'Customer Order Date *';
            }
            field(Remarks; Remarks)
            {
                MultiLine = true;
            }
            field("Payment Received"; "Payment Received")
            {

            }
            field("Order Verified"; "Order Verified")
            {
                Visible = true;
                trigger OnValidate()
                begin
                    //Added by Pranavi on 08-Dec-2015 for order verification rights
                    // Commented by Vishnu Priya on 29-09-2020 by the chnage in the process by the MD Sir.

                    /* IF NOT (USERID IN ['EFFTRONICS\SUJANI', 'EFFTRONICS\VISHNUPRIYA', 'EFFTRONICS\ANILKUMAR', 'EFFTRONICS\VIJAYA', 'EFFTRONICS\VANIDEVI', 'EFFTRONICS\VSNGEETHA', 'EFFTRONICS\B2BOTS']) THEN
               ERROR('You Do Not Have Rights!'); */

                    //End by Pranavi
                end;
            }
            field("Verification Status"; "Verification Status")
            {
                trigger OnValidate()
                var
                    Remarks: Text;
                    salesperson: Record "Salesperson/Purchaser";
                    MailCC: Text;
                begin
                    // ADDED BY VIJAYA ON 20-MAY-2016 for order Verifying
                    IF (xRec."Verification Status" <> "Verification Status"::Request) THEN
                        ERROR('Sales Dept Not Requested For Changing verification Status');
                    IF (USERID IN ['EFFTRONICS\JHANSI', 'EFFTRONICS\VISHNUPRIYA', 'EFFTRONICS\SUJANI', 'EFFTRONICS\ANILKUMAR', 'EFFTRONICS\VANIDEVI', 'EFFTRONICS\VSNGEETHA']) THEN BEGIN
                        IF ("Verification Status" = "Verification Status"::Accept) THEN BEGIN
                            IF (NOT (CONFIRM('Do you want to Accept'))) THEN BEGIN
                                "Verification Status" := "Verification Status"::Request;
                                MODIFY;
                                EXIT;
                            END;
                            IF ("Order Verified" = FALSE) THEN BEGIN
                                user.RESET;
                                user.SETRANGE(user."User Name", USERID);
                                IF user.FINDFIRST THEN
                                    username := user."Full Name"
                                ELSE
                                    username := 'ERP User';
                                Remarks := InputBox();
                                IF (Remarks = '') THEN BEGIN
                                    ERROR('You must enter Remarks');
                                    EXIT;
                                END;
                                "Order Verified" := TRUE;
                                MODIFY;
                                salesperson.RESET;
                                salesperson.SETRANGE(salesperson.Code, "Salesperson Code");
                                IF salesperson.FINDFIRST THEN
                                    MailCC := 'anvesh@efftronics.com,' + salesperson."E-Mail"
                                ELSE
                                    MailCC := 'anvesh@efftronics.com';
                                MailCC := MailCC + ',pmurali@efftronics.com';
                                Mail_From := 'ERP@efftronics.com';
                                Mail_To := "Verfication Req MailID" + ',vanidevi@efftronics.com,vsngeetha@efftronics.com';
                                Subject := 'Sale Order Verified ::' + "No.";
                                SMTP_MAIL.CreateMessage('ERP', Mail_From, Mail_To, Subject, Body, TRUE);
                                SMTP_MAIL.AddCC(MailCC);
                                SMTP_MAIL.AppendBody('<html><body><div style="border-color:white;  margin: 20px; border-width:10px; font-size:11pt;  border-style:solid; padding: 20px; width: 800px;">');
                                SMTP_MAIL.AppendBody('<div style="Background-color:#0971D9; color:#F0F1F5; "><br/><label><font size="4"> Sale Order Verification Status</font></label></div><br/>');
                                SMTP_MAIL.AppendBody('Dear Sir/Madam,');
                                SMTP_MAIL.AppendBody('<br><br>');
                                SMTP_MAIL.AppendBody('The Sale Order has been Verified.<br><br><label><font size="3" color ="#0971D9">The Sale Order ' + "No." + '</font></label><br>');
                                SMTP_MAIL.AppendBody('<font size="2" color ="#0971D9">Customer Name :: ' + "Sell-to Customer Name" + '</font></label><br>');
                                SMTP_MAIL.AppendBody('<br><br><b>Remarks</b><br>');
                                SMTP_MAIL.AppendBody(Remarks + '<br>');
                                SMTP_MAIL.AppendBody('<br><br>With Regards<br>');
                                SMTP_MAIL.AppendBody(username + '<br>');
                                SMTP_MAIL.AppendBody('<div style="Background-color:#0971D9; color:#F0F1F5; "><p align= "center">:::: AUTO GENERATED MAIL FROM ERP ::::</div><br/></div>');
                                //SMTP_MAIL.AppendBody('This Mail Sent to :: '+"Verfication Req MailID");
                                //SMTP_MAIL.AppendBody('This Mail CC to :: '+MailCC);
                                //SMTP_MAIL.AddBCC('vijaya@efftronics.com');
                                SMTP_MAIL.Send;
                                MESSAGE('Mail sent to Sales Dept');

                            END
                            ELSE BEGIN
                                user.RESET;
                                user.SETRANGE(user."User Name", USERID);
                                IF user.FINDFIRST THEN
                                    username := user."Full Name"
                                ELSE
                                    username := 'ERP User';
                                Remarks := InputBox();
                                IF (Remarks = '') THEN BEGIN
                                    ERROR('You must enter Remarks');
                                    EXIT;
                                END;
                                "Order Verified" := FALSE;
                                MODIFY;
                                salesperson.RESET;
                                salesperson.SETRANGE(salesperson.Code, "Salesperson Code");
                                IF salesperson.FINDFIRST THEN
                                    MailCC := 'anvesh@efftronics.com,' + salesperson."E-Mail"
                                ELSE
                                    MailCC := 'anvesh@efftronics.com';
                                MailCC := MailCC + ',pmurali@efftronics.com';
                                Mail_From := 'ERP@efftronics.com';
                                Mail_To := "Verfication Req MailID" + ',vanidevi@efftronics.com,vsngeetha@efftronics.com';
                                Subject := 'Sale Order verified :: ' + "No.";
                                SMTP_MAIL.CreateMessage('ERP', Mail_From, Mail_To, Subject, Body, TRUE);
                                SMTP_MAIL.AddCC(MailCC);
                                SMTP_MAIL.AppendBody('<html><body><div style="border-color:white;  margin: 20px; border-width:10px; font-size:11pt;  border-style:solid; padding: 20px; width: 800px;">');
                                SMTP_MAIL.AppendBody('<div style="Background-color:#0971D9; color:#F0F1F5; "><br/><label><font size="4"> Sale Order Verification Status</font></label></div><br/>');
                                SMTP_MAIL.AppendBody('Dear Sir/Madam,');
                                SMTP_MAIL.AppendBody('<br><br>');
                                SMTP_MAIL.AppendBody('The Sale Order Verification Status Removed.<br><br><label><font size="3" color ="#0971D9">The Sale Order ' + "No." + '</font></label><br>');
                                SMTP_MAIL.AppendBody('<font size="2" color ="#0971D9">Customer Name :: ' + "Sell-to Customer Name" + '</font></label><br>');
                                SMTP_MAIL.AppendBody('<br><br><b>Remarks</b><br>');
                                SMTP_MAIL.AppendBody(Remarks + '<br>');
                                SMTP_MAIL.AppendBody('<br><br>With Regards<br>');
                                SMTP_MAIL.AppendBody(username + '<br>');
                                SMTP_MAIL.AppendBody('<div style="Background-color:#0971D9; color:#F0F1F5; "><p align= "center">:::: AUTO GENERATED MAIL FROM ERP ::::</div><br/></div>');
                                //SMTP_MAIL.AppendBody('This Mail Sent to :: '+"Verfication Req MailID");
                                //SMTP_MAIL.AppendBody('This Mail CC to :: '+MailCC);
                                //SMTP_MAIL.AddBCC('vijaya@efftronics.com');
                                SMTP_MAIL.Send;
                                MESSAGE('Mail sent to Sales Dept');
                            END;
                        END
                        ELSE
                            IF ("Verification Status" = "Verification Status"::Reject) THEN BEGIN
                                IF (NOT (CONFIRM('Do you want to Reject'))) THEN BEGIN
                                    "Verification Status" := "Verification Status"::Request;
                                    MODIFY;
                                    EXIT;
                                END;
                                IF ("Order Verified" = FALSE) THEN BEGIN
                                    user.RESET;
                                    user.SETRANGE(user."User Name", USERID);
                                    IF user.FINDFIRST THEN
                                        username := user."Full Name"
                                    ELSE
                                        username := 'ERP User';
                                    Remarks := InputBox();
                                    IF (Remarks = '') THEN BEGIN
                                        ERROR('You must enter Remarks');
                                        EXIT;
                                    END;
                                    salesperson.RESET;
                                    salesperson.SETRANGE(salesperson.Code, "Salesperson Code");
                                    IF salesperson.FINDFIRST THEN
                                        MailCC := 'anvesh@efftronics.com,' + salesperson."E-Mail"
                                    ELSE
                                        MailCC := 'anvesh@efftronics.com';
                                    MailCC := MailCC + ',pmurali@efftronics.com';
                                    //"Order Verified" :=
                                    Mail_From := 'ERP@efftronics.com';
                                    Mail_To := "Verfication Req MailID" + ',vanidevi@efftronics.com,vsngeetha@efftronics.com';
                                    Subject := 'Sale Order Rejected ::' + "No.";
                                    SMTP_MAIL.CreateMessage('ERP', Mail_From, Mail_To, Subject, Body, TRUE);
                                    SMTP_MAIL.AddCC(MailCC);
                                    SMTP_MAIL.AppendBody('<html><body><div style="border-color:white;  margin: 20px; border-width:10px; font-size:11pt;  border-style:solid; padding: 20px; width: 800px;">');
                                    SMTP_MAIL.AppendBody('<div style="Background-color:#0971D9; color:#F0F1F5; "><br/><label><font size="4"> Sale Order Verification Status</font></label></div><br/>');
                                    SMTP_MAIL.AppendBody('Dear Sir/Madam,');
                                    SMTP_MAIL.AppendBody('<br><br>');
                                    SMTP_MAIL.AppendBody('<font color="#FF0000">The Sale Order has been not Verified.</font><br><br><label><font size="3" color ="#0971D9">The Sale Order ' + "No." + '</font></label><br>');
                                    SMTP_MAIL.AppendBody('<font size="2" color ="#0971D9">Customer Name :: ' + "Sell-to Customer Name" + '</font></label><br>');
                                    SMTP_MAIL.AppendBody('<br><br><b>Remarks</b><br>');
                                    SMTP_MAIL.AppendBody(Remarks + '<br>');
                                    SMTP_MAIL.AppendBody('<br><br>With Regards<br>');
                                    SMTP_MAIL.AppendBody(username + '<br>');
                                    SMTP_MAIL.AppendBody('<div style="Background-color:#0971D9; color:#F0F1F5; "><p align= "center">:::: AUTO GENERATED MAIL FROM ERP ::::</div><br/></div>');
                                    // SMTP_MAIL.AppendBody('This Mail Sent to :: '+"Verfication Req MailID");
                                    //SMTP_MAIL.AppendBody('This Mail CC to :: '+MailCC);
                                    //SMTP_MAIL.AddBCC('vijaya@efftronics.com');
                                    SMTP_MAIL.Send;
                                    MESSAGE('Mail sent to Sales Dept');

                                END
                                ELSE BEGIN
                                    user.RESET;
                                    user.SETRANGE(user."User Name", USERID);
                                    IF user.FINDFIRST THEN
                                        username := user."Full Name"
                                    ELSE
                                        username := 'ERP User';
                                    Remarks := InputBox();
                                    IF (Remarks = '') THEN BEGIN
                                        ERROR('You must enter Remarks');
                                        EXIT;
                                    END;
                                    "Order Verified" := FALSE;
                                    MODIFY;
                                    salesperson.RESET;
                                    salesperson.SETRANGE(salesperson.Code, "Salesperson Code");
                                    IF salesperson.FINDFIRST THEN
                                        MailCC := 'anvesh@efftronics.com,' + salesperson."E-Mail"
                                    ELSE
                                        MailCC := 'anvesh@efftronics.com';

                                    MailCC := MailCC + ',pmurali@efftronics.com';
                                    Mail_From := 'ERP@efftronics.com';
                                    Mail_To := "Verfication Req MailID" + ',vanidevi@efftronics.com,vsngeetha@efftronics.com';
                                    Subject := 'Sale Order Rejected ::' + "No.";
                                    SMTP_MAIL.CreateMessage('ERP', Mail_From, Mail_To, Subject, Body, TRUE);
                                    SMTP_MAIL.AddCC(MailCC);
                                    SMTP_MAIL.AppendBody('<html><body><div style="border-color:white;  margin: 20px; border-width:10px; font-size:11pt;  border-style:solid; padding: 20px; width: 800px;">');
                                    SMTP_MAIL.AppendBody('<div style="Background-color:#0971D9; color:#F0F1F5; "><br/><label><font size="4"> Sale Order Verification Status</font></label></div><br/>');
                                    SMTP_MAIL.AppendBody('Dear Sir/Madam,');
                                    SMTP_MAIL.AppendBody('<br><br>');
                                    SMTP_MAIL.AppendBody('<font color="#FF0000">The Sale Order Verification Status Not Removed.</font><br><br><label><font size="3" color ="#0971D9">The Sale Order ' + "No." + '</font></label><br>');
                                    SMTP_MAIL.AppendBody('<font size="2" color ="#0971D9">Customer Name :: ' + "Sell-to Customer Name" + '</font></label><br>');
                                    SMTP_MAIL.AppendBody('<br><br><b>Remarks</b><br>');
                                    SMTP_MAIL.AppendBody(Remarks + '<br>');
                                    SMTP_MAIL.AppendBody('<br><br>With Regards<br>');
                                    SMTP_MAIL.AppendBody(username + '<br>');
                                    SMTP_MAIL.AppendBody('<div style="Background-color:#0971D9; color:#F0F1F5; "><p align= "center">:::: AUTO GENERATED MAIL FROM ERP ::::</div><br/></div>');
                                    //SMTP_MAIL.AppendBody('This Mail Sent to :: '+"Verfication Req MailID");
                                    //SMTP_MAIL.AppendBody('This Mail CC to :: '+MailCC);
                                    //SMTP_MAIL.AddBCC('vijaya@efftronics.com');
                                    SMTP_MAIL.Send;
                                    MESSAGE('Mail sent to Sales Dept');
                                END;

                            END
                    END
                    ELSE
                        MESSAGE('You Do not have a Right To Verify Order');

                    // end by Vijaya

                end;
            }
            field(Vertical; Vertical)
            {

            }
            field("Assessee Code"; "Assessee Code")
            {

            }
            field("Shipment Type"; "Shipment Type")
            {

            }
            field("Insurance Applicable"; "Insurance Applicable")
            {

            }
            group("OMS Details")
            {
                Visible = forwordomsVisible;
                field(forwordoms; forwordtooms)
                {
                    Style = Unfavorable;
                    StyleExpr = TRUE;
                }
            }
        }
        modify("Bill-to Post Code")
        {
            Caption = 'Bill-to Post Code/City';
        }
        addafter("Bill-to Contact")
        {
            field("No. Series"; "No. Series")
            {
                Editable = true;
            }
            field(Consignee; Consignee)
            {
                Caption = 'Consignee Name';
                NotBlank = true;
                ShowMandatory = true;
            }
            field("Posting No. Series"; "Posting No. Series")
            {
                caption = 'Posting No. Series';
            }
            field("Blanket Order No"; "Blanket Order No")
            {
                Editable = FALSE;
            }
            field("Order Status"; "Order Status")
            {

            }
        }
        modify("Shortcut Dimension 1 Code")
        {
            caption = 'Shortcut Dimension 1 Code';
        }
        modify("Payment Terms Code")
        {
            caption = 'Payment Terms Code';
            trigger OnBeforeValidate()
            begin
                // Added by Pranavi on 01-Oct-2016
                IF (xRec."Payment Terms Code" <> "Payment Terms Code") AND (xRec."Payment Terms Code" <> '') THEN BEGIN
                    SalesLine.SETRANGE(SalesLine."Document No.", "No.");
                    SalesLine.SETFILTER(SalesLine."No.", '<>%1', '');
                    SalesLine.SETFILTER(SalesLine.Quantity, '>%1', 0);
                    IF SalesLine.FINDSET THEN
                        REPEAT
                            IF SalesLine."Quantity Invoiced" > 0 THEN
                                ERROR('You Cannot Change the Payment terms code after the order is invoice!');
                        UNTIL SalesLine.NEXT = 0;
                    PayTerm.SETRANGE(PayTerm.Code, xRec."Payment Terms Code");
                    IF PayTerm.FINDFIRST THEN BEGIN
                        IF PayTerm."Stage 1" = PayTerm."Stage 1"::Advance THEN BEGIN
                            CustLedgEntr.RESET;
                            CustLedgEntr.SETRANGE(CustLedgEntr."Sale Order no", "No.");
                            CustLedgEntr.SETRANGE(CustLedgEntr."Payment Type", CustLedgEntr."Payment Type"::Advance);
                            IF CustLedgEntr.FINDFIRST THEN
                                ERROR('You cannot change the payment terms code as the advance amount is already paid for the order!');
                        END;
                    END;
                END;
                // End by Pranavi
            end;
        }
        addafter("VAT Bus. Posting Group")
        {

            field(Territory; Territory)
            {
                Caption = 'Territory *';
            }
            field("<Document Date2>"; "Document Date")
            {

            }
            field("<Project Completion Date2>"; "Project Completion Date")
            {

            }
            field("Customer Posting Group"; "Customer Posting Group")
            {
                Editable = true;
            }
            field("Installation Amount(CS)"; "Installation Amount(CS)")
            {
                Editable = InstallationAmountCSEditable;
                trigger OnValidate()
                begin
                    InstallationAmountCSOnAfterVal;
                end;
            }
            field("PT Release Auth Stutus"; "PT Release Auth Stutus")
            {
                Editable = Editable_Bool;
            }
            field("PT Post Auth Stutus"; "PT Post Auth Stutus")
            {
                Editable = Editable_Bool;
            }
        }
        modify("Ship-to Post Code")
        {
            Caption = 'Ship-to Post Code/City';
        }
        addafter("Ship-to Contact")
        {
            field("Shipping No. Series"; "Shipping No. Series")
            {

            }
            field("MSPT Date"; "MSPT Date")
            {

            }
            field("MSPT Code"; "MSPT Code")
            {

            }
            field("<Transport Method2>"; "Transport Method")
            {

            }
            field("Tax Liable"; "Tax Liable")
            {

            }
            field(State; State)
            {

            }
        }
        modify("Shipment Date")
        {
            trigger OnBeforeValidate()
            begin
                SalesLine."Shipment Date" := "Posting Date";
            end;
        }
        addafter("Shipping Advice")
        {
            field(WayBillNo; WayBillNo)
            {

            }
            field("<Payment Discount %2>"; "Payment Discount %")
            {
                Caption = 'Supply Portion';
            }
            field("Order Completion Period"; "Order Completion Period")
            {

            }
            group("Installtion Status")
            {
                Caption = 'Installtion Status';
                field(Installation; Installation)
                {
                    Caption = 'Installation *';
                }
                field("Inst.Start Date"; "Inst.Start Date")
                {
                    Caption = 'Base Plan Start date';
                }
                field("Inst.Status"; "Inst.Status")
                {

                }
                field("Assured Date"; "Assured Date")
                {

                }
                field("Exit Point"; "Exit Point")
                {

                }
                field(Area;Area)
                {

                } 
            }
            field("Security Deposit Status";"Security Deposit Status")
            {
                caption='Status';
            }
            field("Expected Order Month";"Expected Order Month")
            {

            }
            group("Sales Status")
            {
                caption='Sales Status';
                field("<Order Status2>";"Order Status")
                {
                    trigger Onvalidate()
                    begin
                        //Added by vihnu priya on 12-11-2020
                             SalesLineRec.RESET;
                             SalesLineRec.SETFILTER("Document No.",Rec."No.");
                             IF SalesLineRec.FINDSET THEN
                               REPEAT
                                 SalesLineRec.MainCategory := SalesLineRec.MainCategory::"Temp-Closed";
                                 SalesLineRec.MODIFY;
                               UNTIL SalesLineRec.NEXT =0;
                               //Added by vihnu priya on 12-11-2020
                    end;
                    
                }
                field(Inspection;Inspection)
                {

                }
                field("Call letters Status";"Call letters Status")
                {

                }
                field(CallLetterExpireDate;CallLetterExpireDate)
                {
                    caption='CallLetterExpireDate *';
                }
                field(CallLetterRecivedDate;CallLetterRecivedDate)
                {

                }
                field("BG Status";"BG Status")
                {
                    caption='BG Status *';
                }
                field("Remarks for Sales Status";"Remarks for Sales Status")
                {
                    trigger OnValidate()
                    begin
                        //FLAG_VALUE := CompareTwoRecords; commented by sujani
                             FLAG_VALUE := TRUE; //added by sujani
                    end;
                }
                field("CA Date";"CA Date")
                {
                    caption='BG. Require Date *';
                }
                field("<Payment Terms Code2>";"Payment Terms Code")
                {
                    
                }
                field("Exp.Payment";"Exp.Payment")
                {
                    caption='BG Value *';
                }
                field("Station Names1";Consignee)
                {
                    caption='Station Names';
                }
                field("Posting No.";"Posting No.")
                {
                    Visible=FALSE;
                }   
                field("Extended Date";"Extended Date")
                {

                }
                field("Call Letter Exp.Date";"Call Letter Exp.Date")
                {

                }
                group(" Others")
                {
                    caption='Others';
                    field("RDSO Charges Paid By";"RDSO Charges Paid By")
                    {
                        Caption='RDSO Charges Paid By *';
                    }
                    field("RDSO Inspection Req";"RDSO Inspection Req")
                    {
                        Caption='RDSO Inspection Req *';
                    }
                    field("RDSO Inspection By";"RDSO Inspection By")
                    {

                    }
                    field("RDSO Charges";"RDSO Charges")
                    {

                    }
                    field("RDSO Call Letter";"RDSO Call Letter")
                    {

                    }
                    field("RDSO No";"RDSO No")
                    {

                    }
                }
            }
        }
        
        addafter("Prepayment Due Date")
        {
            field("LD Amount";"LD Amount")
            {

            }
            field("Document Position";"Document Position")
            {

            }
            field("Reason Code";"Reason Code")
            {

            }
            group("Security Deposit")
            {
                caption='Security Deposit';
                field("Security Deposit Amount";"Security Deposit Amount")
                {
                    caption='Security Deposit Amount(Inc of EMD)*';
                }
                field("EMD Amount";"EMD Amount")
                {

                }
                field("Tender No.";"Tender No.")
                {
                    trigger OnValidate()
                    begin
                        // Start--added by pranavi on 28-Oct-2016 for tender status updation
                             IF "Tender No." <> '' THEN
                             BEGIN
                               TH.RESET;
                               TH.SETRANGE(TH."Tender No.","Tender No.");
                               IF TH.FINDFIRST THEN
                               BEGIN
                                 TH."Sales Order Created" := TRUE;
                                 TH."Tender Status" := TH."Tender Status"::Received;
                                 TH.MODIFY;
                               END;
                             END;
                             // ENd--added by pranavi on 28-Oct-2016 for tender status updation
                    end;
                    
                }
                field("Deposit Payment Due Date";"Deposit Payment Due Date")
                {

                }
                field("Deposit Payment Date";"Deposit Payment Date")
                {

                }
                field("<Security Deposit Status21>";"Security Deposit Status")
                {
                    caption='Security Deposit Status2';
                }
                field("SD Requested Date";"SD Requested Date")
                {

                }
                field("SD Required Date";"SD Required Date")
                {

                }
                field("SecurityDeposit Exp. Rcpt Date";"SecurityDeposit Exp. Rcpt Date")
                {

                }
                field("Order Assurance";"Order Assurance")
                {
                    Editable="Order AssuranceEditable";
                }
                field("<Shipment Date2>";"Shipment Date")
                {

                }
                field("Final Bill Date";"Final Bill Date")
                {

                }
                field("SD Status";"SD Status")
                {

                }
                field("SD Mode";"SD Mode")
                {
                    caption='SD Mode';
                }
                field("<Due Date2>";"Due Date")
                {

                }
                field("Warranty Period";"Warranty Period")
                {
                    Caption='Warranty Period *';
                }
                field(SecDepStatus;SecDepStatus)
                {

                }
                field("Price Inclusive of Taxes";"Price Inclusive of Taxes")
                {

                }

            }
        }
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
        addafter(OrderPromising)
        {
            action("Cancel Order")
            {
                Caption = 'Cancel Order';
                ToolTipML = "Cancel Order";
                Enabled = True;
                Image = CancelLine;
                trigger OnAction()
                var
                    OrderStatusValue: Text[50];
                    Text051: Label 'Do you want to Cancel the Order No. %1';
                begin
                    IF CONFIRM(Text051, FALSE, "No.") THEN BEGIN
                        OrderStatusValue := 'Cancel';
                        CancelCloseOrder(OrderStatusValue, Rec);
                        CurrPage.UPDATE(FALSE);
                    END;
                end;
            }
            action("Short Close Order")
            {
                Caption = 'Short Close Order';
                ToolTipML = "Short Close Order";
                Image = Close;
                trigger OnAction()
                var
                    OrderStatusValue: Text[50];
                    Text050: Label 'Do you want to Short Close the Order No. %1';
                begin
                    IF NOT (USERID IN ['EFFTRONICS\ANILKUMAR', 'EFFTRONICS\SUJANI', 'EFFTRONICS\VISHNUPRIYA']) THEN
                        ERROR('You Do not have Right to Short Close!');
                    IF CONFIRM(Text050, FALSE, "No.") THEN BEGIN
                        OrderStatusValue := 'Close';
                        CancelCloseOrder(OrderStatusValue, Rec);
                        CurrPage.UPDATE(FALSE);
                    END;
                end;
            }
        }
        addafter("Demand Overview")
        {
            action(Production_Approval)
            {
                Caption = 'Production_Approval';
                Promoted = false;
                Image = Approval;
                //PromotedCategory = Process;
                trigger OnAction()
                begin
                    //Added by Vishnu Priya on  26-05-2020
                    /* SalesLine.RESET;
                    SalesLine.SETFILTER("Document No.", Rec."No.");
                    IF SalesLine.FINDSET THEN BEGIN
                        SalesLine."Production Confirmed Status" := TRUE;
                        SalesLine.MODIFY;
                    END */

                    //Added by Vishnu Priya on  26-05-2020
                end;

            }
        }
        addafter(CancelApprovalRequest)
        {
            action("Re&lease")
            {
                ShortCutKey = 'Ctrl+F9';
                Caption = 'Re&lease';
                Promoted = true;
                Image = ReleaseDoc;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    ReleaseSalesDoc: Codeunit 414;
                    SalesLine: Record "Sales Line";
                    OMSIntegrateCode: Codeunit SQLIntegration;
                    PaymentTerms: Record "Payment Terms";
                    CLE: Record "Cust. Ledger Entry";
                    DCLE: Record "Detailed Cust. Ledg. Entry";
                    AdvPaymentAmt: Decimal;
                begin
                    /* IF ("Sell-to Customer No." <> 'CS INT') OR ("Sell-to Customer No." <> 'R&D INT') THEN
                        TESTFIELD("SalOrd Des Approval");
                    comented for design approval */
                    TESTFIELD("Warranty Period");
                    /* IF FORMAT("Project Completion Date") = '' THEN
                    ERROR('Please Enter the Project Completion Date');
                    VALIDATE("Project Completion Date");

                    IF FORMAT("Promised Delivery Date") = '' THEN
                        ERROR('Please Enter the Promised Delivery Date');
                    VALIDATE("Promised Delivery Date");

                    IF FORMAT("Project Completion Date") = '' THEN
                        ERROR('Please Enter the Project Completion Date'); */

                    IF Vertical = Vertical::" " THEN BEGIN
                        ERROR('Please choose Vertical');
                    END;

                    IF "Shipment Type" = "Shipment Type"::"  " THEN BEGIN
                        ERROR('Please choose partial shipment allowed or not');
                    END;

                    SCHEDULEOMS.RESET;
                    SCHEDULEOMS.SETFILTER(SCHEDULEOMS."No.", "No.");
                    IF SCHEDULEOMS.FIND('-') THEN
                        REPEAT
                            IF SCHEDULEOMS.Type = SCHEDULEOMS.Type::Item THEN BEGIN
                                IF SCHEDULEOMS."No." = '' THEN
                                    ERROR('sales line ' + FORMAT(SCHEDULEOMS."Document Line No.") + 'Schedules Must have  Item Numbers');
                                IF SCHEDULEOMS."No." <> '' THEN
                                    IF FORMAT(SCHEDULEOMS.Quantity) = '' THEN
                                        ERROR('Sales line ' + FORMAT(SCHEDULEOMS."Document Line No.") + 'Schedule Must have  Item Number');
                            END;
                        UNTIL SCHEDULEOMS.NEXT = 0;

                    //sundar
                    IF ("RDSO Inspection Req" = "RDSO Inspection Req"::YES) AND ("Call letters Status" = "Call letters Status"::NA) THEN
                        ERROR('Call Letter Status should not be NA while RDSO inspection Req is YES');

                    IF "Call letters Status" = "Call letters Status"::Pending THEN BEGIN
                        IF ((CallLetterExpireDate <> 0D) OR (CallLetterRecivedDate <> 0D)) THEN
                            ERROR('Call letter Expire date and received date must be empty');
                        IF "Call Letter Exp.Date" < TODAY THEN
                            ERROR('Call letter Expected date must be greater than or equal to today ');
                    END;

                    IF "Call letters Status" = "Call letters Status"::Received THEN BEGIN
                        IF ((CallLetterExpireDate = 0D) OR (CallLetterRecivedDate = 0D)) THEN
                            ERROR('Call letter Expire date and received date must be Filled');
                        IF CallLetterExpireDate <= TODAY THEN
                            ERROR('Call letter Expire date must be greater than today ');
                        IF CallLetterRecivedDate > TODAY THEN
                            ERROR('Call letter Received date must be less than or equal to today ');

                    END;
                    //Added by Pranavi on 18-08-2015
                    IF "Salesperson Code" = '' THEN
                        ERROR('Please Enter Sales Person Code!');
                    IF "Customer Posting Group" = '' THEN
                        ERROR('Please select Customer Posting Group!');
                    IF "Payment Terms Code" = '' THEN
                        ERROR('Please select Payment Terms Code!');
                    //End By Pranavi
                    IF "Ship-to Name" IN ['', ' '] THEN   // >> Validation added by Pranavi on 03-05-17
                        ERROR('Please enter the Consignee(Ship-to-Name) in Shipping FastTab!');
                    // Added by Pranavi on 22-Jul-2016
                    CUS.RESET;
                    CUS.SETRANGE(CUS."No.", "Sell-to Customer No.");
                    IF CUS.FINDFIRST THEN BEGIN
                        IF (CUS."Copy Sell-to Addr. to Qte From" = CUS."Copy Sell-to Addr. to Qte From"::Company) AND (CUS."T.I.N. No." = '') AND
                         (NOT (CUS."Customer Posting Group" IN ['RAILWAYS', 'EXPORT'])) THEN
                            // (CUS."Customer Posting Group" <> 'RAILWAYS') THEN
                            ERROR('Please enter the T.I.N Number in Customer Card in Taxes Information Tab for Customer :' + CUS."No.");
                    END;
                    // END by Pranavi

                    //Added by Pranavi on 08-Dec-2015 for not allowing to release order if 1st time release if order is not verified
                    /* IF NOT (COPYSTR("No.", 14, 2) IN ['/L', '/T']) THEN BEGIN
                        SHA.RESET;
                        SHA.SETFILTER(SHA."No.", "No.");
                        IF NOT SHA.FINDFIRST THEN  */  // Commented by vijaya on 24-Jun-16 for not allowing to release order if order is not verified

                    // Commented by Vishnu Priya on 29-09-2020 by the chnage in the process by the MD Sir.

                    /* IF (("Order Verified" = FALSE) OR ("Verification Status" = "Verification Status"::Reject)) THEN
             ERROR('Order is not Verified So You can not release order!'); */

                    // Commented by Vishnu Priya on 29-09-2020 by the chnage in the process by the MD Sir.
                    //END;
                    //End by Pranavi on 08-Dec-2015


                    SalesLine.SETFILTER(SalesLine."Document No.", "No.");
                    SalesLine.SETRANGE(SalesLine."RDSO Inspection Required", TRUE);
                    IF SalesLine.FINDFIRST THEN BEGIN
                        IF "RDSO Inspection Req" <> "RDSO Inspection Req"::YES THEN
                            ERROR('You must specify RDSO Inspection Req to Yes in header as one or more lines have Rdso inspection');
                    END
                    ELSE
                        IF "RDSO Inspection Req" = "RDSO Inspection Req"::YES THEN
                            ERROR('Rdso Inspection is Yes and no lines have rdso inspection yes');
                    //sundar
                    //Added by Pranavi on 02-11-2015
                    IF NOT ("Sell-to Customer No." IN ['CUST00536', 'CUST01164']) THEN BEGIN
                        attachments.RESET;
                        attachments.SETFILTER(attachments."Document Type", '%1', "Document Type");
                        attachments.SETFILTER(attachments."Document No.", "No.");
                        attachments.SETFILTER(attachments."Attachment Status", '%1', TRUE);
                        IF NOT attachments.FINDFIRST THEN
                            ERROR('Please attach Sale Order Document/ LOA of the Order!');
                    END
                    ELSE BEGIN
                        IF Remarks = '' THEN   // Added by Pranavi on 06-Aprl-2016
                            ERROR('Please enter remarks for the Order in General Tab!\Remarks are mandatory for Efftronics Order!');
                    END;
                    Remarks := DELCHR(Remarks, '=', Quote);
                    Remarks := StringReplaceFunction.ReplaceString(Remarks, '<br>', '');
                    //End by Pranavi

                    //Added by Pranavi on 09-Dec-2015 for not allowing to release led order if tax structure not calcted
                    IF COPYSTR("No.", 14, 2) IN ['/T', '/L'] THEN BEGIN
                        IF (NOT "Calculate Tax Structure") AND (Structure <> '') THEN
                            ERROR('Please Calculate Tax Structure!');
                        IF (Structure = '') THEN
                            ERROR('Please Select Tax Structure!');
                        CALCFIELDS("Total Order(LOA)Value");
                        IF ROUND("Total Order(LOA)Value") <> ROUND("Sale Order Total Amount") THEN
                            ERROR('Sale Order Total Amount and Total Order(LOA) Value are not equal!');
                    END;
                    //End by Pranavi
                    //Added by Pranavi on 16-Sep-2016 for not allowing to release led order if tax structure not calcted
                    IF ("Customer Posting Group" IN ['PRIVATE', 'OTHERS', 'EXPORT']) AND NOT ("Sell-to Customer No." IN ['CUST00536', 'CUST01164']) AND (Order_After_CF_Integration = TRUE) THEN BEGIN
                        IF (NOT "Calculate Tax Structure") AND (Structure <> '') THEN
                            ERROR('Please Calculate Tax Structure!');
                        IF (Structure = '') AND ("Customer Posting Group" <> 'EXPORT') THEN
                            ERROR('Please Select Tax Structure!');
                        CALCFIELDS("Total Order(LOA)Value");
                        IF ROUND("Total Order(LOA)Value", 1, '>') <> ROUND("Sale Order Total Amount", 1, '>') THEN
                            ERROR('Sale Order Total Amount and Total Order(LOA) Value are not equal!');
                        CUS.RESET;
                        CUS.SETRANGE(CUS."No.", "Sell-to Customer No.");
                        IF CUS.FINDFIRST THEN BEGIN
                            IF CUS."Customer Posting Group" IN ['PRIVATE', 'OTHERS', 'EXPORT'] THEN BEGIN
                                PT.RESET;
                                PT.SETRANGE(PT.Code, CUS."Payment Terms Code");
                                IF PT.FINDFIRST THEN
                                    IF (PT."Stage 1" = PT."Stage 1"::Credit) OR (PT."Stage 2" = PT."Stage 2"::Credit) OR (PT."Stage 3" = PT."Stage 3"::Credit) THEN
                                        IF CUS."Payment Term Auth" = CUS."Payment Term Auth"::Rejected THEN
                                            ERROR('Payment terms of customer authorization is rejected for credit based term!\' +
                                                  'Please change payment terms code or take authorization')
                                        ELSE
                                            IF CUS."Payment Term Auth" IN [CUS."Payment Term Auth"::"Sent For Authorization", CUS."Payment Term Auth"::" "] THEN
                                                ERROR('Payment term is not authorized for the customer as it is credit based term!\' +
                                                      'Please change payment terms code or take authorization');
                            END;
                        END;
                        SalesLineRec.RESET;
                        SalesLineRec.SETRANGE(SalesLineRec."Document No.", "No.");
                        SalesLineRec.SETFILTER(SalesLineRec."No.", '<>%1', '');
                        IF SalesLineRec.FINDSET THEN
                            REPEAT
                                IF (SalesLineRec."Supply Portion" = 0) AND (SalesLineRec."Retention Portion" = 0) THEN
                                    ERROR('Please enter Suply & Retention Portion for the line no. ' + FORMAT(SalesLineRec."Line No."));
                            UNTIL SalesLineRec.NEXT = 0;
                    END;
                    //End by Pranavi
                    // Added by Pranavi on 26-Jul-2016 for payment terms process
                    IF ("Customer Posting Group" IN ['PRIVATE', 'OTHERS', 'EXPORT']) AND NOT ("Sell-to Customer No." IN ['CUST00536', 'CUST01164'])
                       AND (Order_After_CF_Integration = TRUE) THEN BEGIN
                        IF "Payment Terms Code" = '' THEN BEGIN
                            CUS.RESET;
                            CUS.SETRANGE(CUS."No.", "Sell-to Customer No.");
                            IF CUS.FINDFIRST THEN BEGIN
                                IF CUS."Payment Terms Code" <> '' THEN BEGIN
                                    "Payment Terms Code" := CUS."Payment Terms Code";
                                    MODIFY;
                                END
                                ELSE
                                    ERROR('Please enter Payment terms code in customer card!');
                            END;
                        END
                        ELSE BEGIN
                            IF "Payment Terms Code" IN ['ASPERMNC', 'ASPERTNDR'] THEN
                                ERROR('Please enter Payment Terms mentioned in PO!\It should not be ' + "Payment Terms Code")
                            ELSE BEGIN
                                "PT_Adv%" := 0;
                                "PT_Del%" := 0;
                                "PT_Crd%" := 0;
                                PT.RESET;
                                PT.SETRANGE(PT.Code, "Payment Terms Code");
                                IF PT.FINDFIRST THEN BEGIN
                                    IF PT."Stage 1" = PT."Stage 1"::Advance THEN
                                        "PT_Adv%" := PT."Percentage 1"
                                    ELSE
                                        IF PT."Stage 1" IN [PT."Stage 1"::Delivery, PT."Stage 1"::Against_RDSO_IC, PT."Stage 1"::Before_Delivery] THEN
                                            "PT_Del%" := PT."Percentage 1"
                                        ELSE
                                            IF PT."Stage 1" = PT."Stage 1"::Credit THEN
                                                "PT_Crd%" := PT."Percentage 1";

                                    IF PT."Stage 2" IN [PT."Stage 2"::Delivery, PT."Stage 2"::Against_RDSO_IC, PT."Stage 2"::Before_Delivery] THEN
                                        "PT_Del%" := PT."Percentage 2"
                                    ELSE
                                        IF PT."Stage 2" = PT."Stage 2"::Credit THEN
                                            "PT_Crd%" := PT."Percentage 2";

                                    IF PT."Stage 3" IN [PT."Stage 3"::Delivery, PT."Stage 3"::Against_RDSO_IC, PT."Stage 3"::Before_Delivery] THEN
                                        "PT_Del%" := PT."Percentage 3"
                                    ELSE
                                        IF PT."Stage 3" = PT."Stage 3"::Credit THEN
                                            "PT_Crd%" := PT."Percentage 3";
                                    SL1.RESET;
                                    SL1.SETRANGE(SL1."Document Type", SL1."Document Type"::Order);
                                    SL1.SETRANGE(SL1."Document No.", "No.");
                                    SL1.SETFILTER(SL1."No.", '<>%1', '');
                                    SL1.SETFILTER(SL1.Quantity, '>%1', 0);
                                    IF SL1.FINDSET THEN
                                        REPEAT
                                            IF SL1.Type = SL1.Type::Item THEN BEGIN
                                                IF Item_Grp.GET(SL1."No.") THEN BEGIN
                                                    IF (COPYSTR(SL1."No.", 1, 4) = 'INST') AND (Item_Grp."Item Sub Sub Group Code" = 'INSTALLATION') THEN BEGIN
                                                        IF SL1."Supply Portion" + SL1."Retention Portion" <> 100 THEN
                                                            ERROR('Total supply and retention portion must be equal to 100 %!\present value is :' +
                                                                  FORMAT(SL1."Supply Portion" + SL1."Retention Portion"));
                                                        IF SL1."Retention Portion" <> 100 THEN
                                                            ERROR('Retention portion of line no.: ' + FORMAT(SL1."Line No.") + ' must be 100 % for G/L Accounts!');
                                                    END ELSE BEGIN
                                                        IF SL1."Supply Portion" + SL1."Retention Portion" <> 100 THEN
                                                            ERROR('Total supply and retention portion must be equal to 100 %!\present value is :' +
                                                                  FORMAT(SL1."Supply Portion" + SL1."Retention Portion"));
                                                        IF SL1."Retention Portion" > 0 THEN BEGIN
                                                            IF SL1."Supply Portion" <> ("PT_Adv%" + "PT_Del%") THEN
                                                                ERROR('Supply portion of line no.: ' + FORMAT(SL1."Line No.") + ' must be equal to (adv+del)% in payment term!');
                                                            IF SL1."Retention Portion" <> "PT_Crd%" THEN
                                                                ERROR('Retention portion of line no.: ' + FORMAT(SL1."Line No.") + ' must be equal to credit % in payment term!');
                                                        END ELSE BEGIN
                                                            IF SL1."Supply Portion" <> ("PT_Adv%" + "PT_Del%" + "PT_Crd%") THEN
                                                                ERROR('Supply portion of line no.: ' + FORMAT(SL1."Line No.") + ' must be equal to (adv+del)% in payment term!');
                                                        END;
                                                    END;
                                                END;
                                            END ELSE BEGIN
                                                IF SL1."Supply Portion" + SL1."Retention Portion" <> 100 THEN
                                                    ERROR('Total supply and retention portion must be equal to 100 %!\present value is :' +
                                                          FORMAT(SL1."Supply Portion" + SL1."Retention Portion"));
                                                IF SL1."Retention Portion" <> 100 THEN
                                                    ERROR('Retention portion of line no.: ' + FORMAT(SL1."Line No.") + ' must be 100 % for G/L Accounts!');
                                            END;
                                        UNTIL SL1.NEXT = 0;
                                    SalesLine.RESET;
                                    SalesLine.SETRANGE(SalesLine."Document Type", SalesLine."Document Type"::Order);
                                    SalesLine.SETRANGE(SalesLine."Document No.", "No.");
                                    SalesLine.SETFILTER(SalesLine."No.", '<>%1', '');
                                    SalesLine.SETFILTER(SalesLine.Quantity, '>%1', 0);
                                    IF SalesLine.FINDSET THEN
                                        REPEAT
                                            IF SalesLine."Unitcost(LOA)" = 0 THEN
                                                ERROR('Please emter UnitCost(LOA) amount line no.:' + FORMAT(SalesLine."Line No."));
                                            LineAmtLOA := 0;
                                            LineAmtLOA := ROUND(SalesLine.Quantity * SalesLine."Unitcost(LOA)", 1);
                                            IF SalesLine.Type = SalesLine.Type::Item THEN BEGIN
                                                IF Item_Grp.GET(SalesLine."No.") THEN BEGIN
                                                    IF (COPYSTR(SalesLine."No.", 1, 4) = 'INST') AND (Item_Grp."Item Sub Sub Group Code" = 'INSTALLATION') THEN BEGIN
                                                        InstAmt := InstAmt + ROUND(SalesLine.Quantity * SalesLine."Unitcost(LOA)", 1);
                                                    END ELSE BEGIN
                                                        AdvAmt += LineAmtLOA * "PT_Adv%" / 100;
                                                        IF SalesLine."Retention Portion" > 0 THEN BEGIN
                                                            RetentionAmt := RetentionAmt + (LineAmtLOA * SalesLine."Retention Portion" / 100);
                                                            SupplyAmt := SupplyAmt + (LineAmtLOA - (LineAmtLOA * SalesLine."Retention Portion" / 100));
                                                        END ELSE BEGIN
                                                            SupplyAmt := SupplyAmt + LineAmtLOA;
                                                        END;
                                                    END;
                                                END;
                                            END
                                            ELSE
                                                IF SalesLine.Type = SalesLine.Type::"G/L Account" THEN BEGIN
                                                    InstAmt := InstAmt + ROUND(SalesLine.Quantity * SalesLine."Unitcost(LOA)", 1);
                                                END;
                                        UNTIL SalesLine.NEXT = 0;

                                    IF (PT."Stage 1" = PT."Stage 1"::Credit) OR (PT."Stage 1" = PT."Stage 2"::Credit) OR
                                       (PT."Stage 1" = PT."Stage 3"::Credit) THEN BEGIN
                                        CUS.RESET;
                                        CUS.SETRANGE(CUS."No.", "Sell-to Customer No.");
                                        IF CUS.FINDFIRST THEN
                                            IF CUS."Payment Term Auth" <> CUS."Payment Term Auth"::Authorized THEN
                                                ERROR('As payment terms is credit based. Authorization is required!\Please take authorization!');
                                    END;
                                    IF PT."Update In Cashflow" = FALSE THEN
                                        ERROR('Please update Payment Term Code: ' + "Payment Terms Code" + ' to CashFlow!')
                                    ELSE BEGIN
                                        IF (PT."Stage 1" = PT."Stage 1"::Advance) AND (PT."Percentage 1" <> 0) THEN BEGIN
                                            CLE.RESET;
                                            CLE.SETRANGE(CLE."Customer No.", "Sell-to Customer No.");
                                            CLE.SETRANGE(CLE."Payment Type", CLE."Payment Type"::Advance);
                                            CLE.SETRANGE(CLE."Sale Order no", "No.");
                                            IF CLE.FINDSET THEN BEGIN
                                                REPEAT
                                                    DCLE.RESET;
                                                    DCLE.SETRANGE(DCLE."Cust. Ledger Entry No.", CLE."Entry No.");
                                                    DCLE.SETRANGE(DCLE."Entry Type", DCLE."Entry Type"::"Initial Entry");
                                                    IF DCLE.FINDSET THEN
                                                        REPEAT
                                                            AdvPaymentAmt := AdvPaymentAmt + ABS(DCLE."Amount (LCY)");
                                                        UNTIL DCLE.NEXT = 0;
                                                UNTIL CLE.NEXT = 0;
                                                IF ABS(ROUND(AdvPaymentAmt, 0.01, '>') - ROUND((SupplyAmt * PT."Percentage 1") / 100, 0.01, '>')) > 1 THEN BEGIN
                                                    IF Rec."PT Release Auth Stutus" = "PT Release Auth Stutus"::"Sent For Auth" THEN
                                                        ERROR('Authorization is in pending.Please take Authorization!')
                                                    ELSE
                                                        IF Rec."PT Release Auth Stutus" = "PT Release Auth Stutus"::Rejected THEN
                                                            ERROR('Your permission for releasing is rejected!');
                                                    IF Rec."PT Release Auth Stutus" = "PT Release Auth Stutus"::" " THEN BEGIN
                                                        MESSAGE('Total Advance Payment is not recovered!Advance Amt of Order Value is: ' +
                                                              FORMAT(ROUND(("Sale Order Total Amount" * PT."Percentage 1") / 100, 0.01, '>')) +
                                                              '\Recovered Adv Amount is: ' + FORMAT(ROUND(AdvPaymentAmt, 0.01, '>')));
                                                        IF CONFIRM('Do you want to release with Authorization?\Do you want to Send for Authorization? ') THEN
                                                            SendForAuth('Release');
                                                        EXIT;
                                                    END;
                                                END;
                                            END ELSE BEGIN
                                                IF "PT Release Auth Stutus" = "PT Release Auth Stutus"::"Sent For Auth" THEN
                                                    ERROR('Authorization is in pending.Please take Authorization!')
                                                ELSE
                                                    IF "PT Release Auth Stutus" = "PT Release Auth Stutus"::Rejected THEN
                                                        ERROR('Your permission for releasing is rejected!');
                                                IF "PT Release Auth Stutus" = "PT Release Auth Stutus"::" " THEN BEGIN
                                                    MESSAGE('Payment terms has ' + FORMAT(PT."Percentage 1") + ' % Advance Payment! But Advance payment is not done!');
                                                    IF CONFIRM('Do you want to release with Authorization?\Do you want to Send for Authorization? ') THEN
                                                        SendForAuth('Release');
                                                    EXIT;
                                                END;
                                            END;
                                        END;
                                    END;
                                END
                                ELSE
                                    ERROR('Payment Terms Code ' + "Payment Terms Code" + ' does not exist in Payment Terms Table!');
                            END;
                        END;
                    END;
                    // End by Pranavi

                    // Added by Pranavi on 16-feb-2016 for not allowing to release if location code not updated in lines
                    SalesLine.RESET;
                    SalesLine.SETRANGE("Document Type", "Document Type");
                    SalesLine.SETRANGE("Document No.", "No.");
                    IF SalesLine.FINDSET THEN
                        REPEAT
                            IF SalesLine."Location Code" = '' THEN
                                ERROR('Please enter Location Code in Line No.: ' + FORMAT(SalesLine."Line No."));
                            Schedl2.RESET;
                            Schedl2.SETRANGE(Schedl2."Document No.", SalesLine."Document No.");
                            Schedl2.SETRANGE(Schedl2."Document Line No.", SalesLine."Line No.");
                            Schedl2.SETFILTER(Schedl2."No.", '<>%1', '');
                            IF Schedl2.FINDSET THEN
                                REPEAT
                                    IF Schedl2."Document Line No." <> Schedl2."Line No." THEN
                                        IF Schedl2."Location Code" = '' THEN
                                            ERROR('Please enter Location Code in the Schedules for the Doc Line No.: ' + FORMAT(SalesLine."Line No.") + ' Line No.: ' + FORMAT(Schedl2."Line No."));
                                UNTIL Schedl2.NEXT = 0;
                        UNTIL SalesLine.NEXT = 0;
                    // End by Pranavi

                    // Added by Pranavi on 30-Jun-2016 for SD amount checking
                    IF ("SD Status" <> "SD Status"::NA) AND ("Security Deposit Amount" <= 5) THEN
                        ERROR('Please enter Security Deposit Amount!\If SD amount not applicable update SD Status as NA!');
                    // End by pranavi

                    ReleaseSalesDoc.PerformManualRelease(Rec);
                    //added by vishnu priya for notification purpose on 06-10-2018
                    //Modifications_mail;
                    //ended by vishnu priya for notification purpose on 06-10-2018

                    //mnraju- forward to oms on release the order
                    IF Status = Status::Released THEN BEGIN
                        // MESSAGE('Today OMS Integration Stopped');
                        //  MESSAGE("No.");
                        SHA.RESET;
                        SHA.SETFILTER(SHA."No.", "No.");
                        IF NOT SHA.FINDFIRST THEN BEGIN
                            "First Released Date Time" := CURRENTDATETIME;
                            MODIFY;
                        END;
                        SalesLine.RESET;
                        SalesLine.SETRANGE("Document Type", "Document Type");
                        SalesLine.SETRANGE("Document No.", "No.");
                        // SalesLine.SETRANGE(Type,SalesLine.Type::Item);
                        IF SalesLine.FINDFIRST THEN BEGIN
                            // MESSAGE('Enter in OMS Part');      OR ("Document Type"="Document Type"::"Blanket Order")
                            IF "Document Type" = "Document Type"::Order THEN BEGIN
                                IF (OMSIntegrateCode.SaleOrderCreationinOMS(Rec)) = FALSE THEN BEGIN
                                    MESSAGE('Error occured in OMS integration and record is not posted');
                                END;
                            END;
                        END;

                        // Added by pranavi on 19-may-2016
                        IF NOT ("Sell-to Customer No." IN ['CUST00536', 'CUST01164']) THEN BEGIN
                            IF "Customer Posting Group" = 'RAILWAYS' THEN
                                OMSIntegrateCode.SaleOrderCreationinCashFlow(Rec)
                            ELSE BEGIN
                                IF Order_After_CF_Integration = TRUE THEN
                                    OMSIntegrateCode.PrivateSaleOrdrCreationInCashFlow(Rec)
                                ELSE BEGIN
                                    IF "Payment Received" = FALSE THEN
                                        OMSIntegrateCode.SaleOrderCreationinCashFlow(Rec);
                                END;
                            END;
                        END;
                        // end by Pranavi

                    END ELSE
                        ERROR('Order in Open State');
                    forwordomsVisible := FALSE;
                    //mnraju- forward to oms on release the order
                end;
            }
            action(CUSTOMRELEASE)
            {
                Caption = 'CUSTOMRELEASE';
                trigger OnAction()
                var
                    ROMail: Codeunit "SMTP Mail";
                    Tot_amt: Text;
                    SPP: Record "Salesperson/Purchaser";
                    SAL: Record "Sales Line Archive";
                    LastModifiedDate: DateTime;
                    RegExp: Text;
                    Itm: Record Item;
                    Entr: Integer;
                begin
                    // Added by Vishnu Priya for  Notification of Modified sales orders on 06-10-2018
                    "sales header".RESET;
                    SHA.RESET;
                    SAL.RESET;
                    SHA.SETCURRENTKEY(SHA."Document Type", SHA."No.", SHA."Doc. No. Occurrence", SHA."Version No.");
                    SAL.SETCURRENTKEY(SAL."Document Type", SAL."Document No.", SAL."Doc. No. Occurrence", SAL."Version No.", SAL."Line No.");
                    SHA.SETFILTER("No.", "sales header"."No.");
                    IF SHA.FINDLAST THEN BEGIN
                        Mail_Subject := 'Sale Order ' + "No." + ' MOdified Details';
                        Mail_From := 'erp@efftronics.com';
                        Mail_To := 'vishnupriya@efftronics.com';
                        ROMail.CreateMessage('erp', 'erp@efftronics.com', Mail_To, 'ERP - ' + Mail_Subject, Body, TRUE);
                        ROMail.AppendBody('<html><head><style> divone{background-color: white; width: 2000px; padding: 20px; border-style:solid ; border-color:#666699;  margin: 20px;} </style></head>');
                        ROMail.AppendBody('<body><div style="border-color:#025E4D;  margin: 20px; border-width:15px;   border-style:solid; padding: 20px; width: 1000px;">');
                        ROMail.AppendBody('<label><font size="6"> Sale Order Information</font></label>');
                        ROMail.AppendBody('<hr style=solid; color= #3333CC>');
                        ROMail.AppendBody('<h>Dear Sir/Madam,</h><br>');
                        ROMail.AppendBody('<P>SALE ORDER  DETAILS</P>');
                        SL.RESET;
                        "sales header".SETFILTER("No.", Rec."No.");
                        SL.SETFILTER("Document No.", Rec."No.");
                        SL.FINDSET;
                        SAL.SETFILTER("Document No.", Rec."No.");
                        SAL.SETFILTER("Version No.", FORMAT(SHA."Version No."));
                        SL.SETFILTER("Line No.", FORMAT(SAL."Line No."));
                        ROMail.AppendBody('<P><b>Modified Lines  in the Sale Order</b>  ' + Rec."No." + '</P>');
                        ROMail.AppendBody('<table border = "1" style="border-collapse:collapse; width:100%; fond-size:10pt;">');
                        ROMail.AppendBody('<tr>');
                        ROMail.AppendBody('<th>Line No </th>');
                        ROMail.AppendBody('<th>Item no.</th>');
                        ROMail.AppendBody('<th>Item Description </th>');
                        ROMail.AppendBody('<th>Previous Qty</th>');
                        ROMail.AppendBody('<th>Current Qty</th>');
                        ROMail.AppendBody('<th>Pre. Qty.to-Ship </th>');
                        ROMail.AppendBody('<th>Curr. Qty.to-Ship</th>');
                        ROMail.AppendBody('</tr>');
                        IF SAL.FINDSET THEN
                            REPEAT
                                SL.SETFILTER("Line No.", FORMAT(SAL."Line No."));
                                SL.FINDSET;
                                IF (SAL."Qty. to Ship" <> SL."Qty. to Ship") OR (SAL.Quantity <> SL.Quantity) THEN BEGIN
                                    ROMail.AppendBody('<tr>');
                                    ROMail.AppendBody('<td>' + ' ' + FORMAT(SAL."Line No.") + '</td>');
                                    ROMail.AppendBody('<td>' + ' ' + SAL."No." + '</td>');
                                    ROMail.AppendBody('<td>' + ' ' + SAL.Description + '</td>');
                                    IF SAL.Quantity = SL.Quantity THEN BEGIN
                                        ROMail.AppendBody('<td >' + ' ' + FORMAT(SAL.Quantity) + '</td>');
                                        ROMail.AppendBody('<td>' + ' ' + FORMAT(SL.Quantity) + '</td>');
                                    END
                                    ELSE BEGIN
                                        ROMail.AppendBody('<td style = "color:red" >' + ' ' + FORMAT(SAL.Quantity) + '</td>');
                                        ROMail.AppendBody('<td style = "color:green" >' + ' ' + FORMAT(SL.Quantity) + '</td>');
                                    END;
                                    IF SAL."Qty. to Ship" = SL."Qty. to Ship" THEN BEGIN
                                        ROMail.AppendBody('<td style = "color:red" >' + ' ' + FORMAT(SAL."Qty. to Ship") + '</td>');
                                        ROMail.AppendBody('<td style = "color:green" >' + ' ' + FORMAT(SL."Qty. to Ship") + '</td>');
                                    END
                                    ELSE BEGIN
                                        ROMail.AppendBody('<td style = "color:red" >' + ' ' + FORMAT(SAL."Qty. to Ship") + '</td>');
                                        ROMail.AppendBody('<td style = "color:green" >' + ' ' + FORMAT(SL."Qty. to Ship") + '</td>');
                                    END;
                                    ROMail.AppendBody('</tr>');
                                END

                            UNTIL SAL.NEXT = 0;
                        ROMail.AppendBody('</table>');
                        ROMail.AppendBody('<P><b>Schedules in the Sale Order</b>  ' + Rec."No." + '</P>');

                        // for schedules

                        Schedl2.RESET;
                        Schedl2.SETCURRENTKEY(Schedl2."Document Type", Schedl2."Document No.", Schedl2."Document Line No.", Schedl2."Line No.");
                        Schedl2.SETRANGE(Schedl2."Document No.", "sales header"."No.");
                        Schedl2.SETFILTER(Schedl2."Document Line No.", '<>%1', Schedl2."Line No.");
                        Schedl2.SETFILTER(Quantity, '>%1', 0);
                        IF Schedl2.FINDSET THEN
                            ROMail.AppendBody('<br><table border = "1" style="border-collapse:collapse; width:100%; fond-size:10pt;"><tr><th><b>Sales Line no.</b></th>');
                        ROMail.AppendBody('<th> Sch Line No.</th><th>Item No.</th>');
                        ROMail.AppendBody('<th>Item Description </th>');
                        ROMail.AppendBody('<th> Type of Change </th>');
                        ROMail.AppendBody('<th>Changed Field</th>');
                        ROMail.AppendBody('<th>Previous Qty </th>');
                        ROMail.AppendBody('<th>New Qty </th></tr>');
                        REPEAT
                            IF Schedl2."Document Line No." <> Schedl2."Line No." THEN BEGIN
                                CHANGELOGSETUP.RESET;
                                CHANGELOGSETUP.SETRANGE(CHANGELOGSETUP."Table No.", 60095);
                                CHANGELOGSETUP.SETRANGE(CHANGELOGSETUP."Primary Key Field 2 Value", "sales header"."No.");
                                RegExp := '*' + FORMAT(Schedl2."Document Line No.") + '*' + FORMAT(Schedl2."Line No.") + '*';
                                CHANGELOGSETUP.SETFILTER("Primary Key", RegExp);
                                IF CHANGELOGSETUP.FINDLAST THEN
                                    Entr := CHANGELOGSETUP."Entry No.";
                                CHANGELOGSETUP.SETFILTER("Entry No.", FORMAT(Entr));
                                IF CHANGELOGSETUP.FINDLAST THEN
                                    REPEAT
                                        ROMail.AppendBody('<tr><td>' + CHANGELOGSETUP."Primary Key Field 3 Value" + '</td><td>' + FORMAT(Schedl2."Line No.") + '</td>');
                                        ROMail.AppendBody('<td>' + Schedl2."No." + '</td><td>' + Schedl2.Description + '</td>');

                                        CASE CHANGELOGSETUP."Type of Change" OF
                                            CHANGELOGSETUP."Type of Change"::Insertion:
                                                ROMail.AppendBody('<td>Insertion</td>');
                                            CHANGELOGSETUP."Type of Change"::Modification:
                                                ROMail.AppendBody('<td>Modification</td>');
                                            CHANGELOGSETUP."Type of Change"::Deletion:
                                                ROMail.AppendBody('<td>Deletion</td>');
                                        END;
                                        CASE CHANGELOGSETUP."Field No." OF
                                            5:
                                                ROMail.AppendBody('<td>Item No</td>');
                                            7:
                                                ROMail.AppendBody('<td>Quantity</td>');
                                        END;

                                        IF CHANGELOGSETUP."Old Value" = FORMAT(Schedl2.Quantity) THEN BEGIN
                                            ROMail.AppendBody('<td>' + CHANGELOGSETUP."Old Value" + '</td>');
                                            ROMail.AppendBody('<td>' + FORMAT(Schedl2.Quantity) + '</td><td>');
                                        END
                                        ELSE BEGIN
                                            ROMail.AppendBody('<td style = "color:red" >' + ' ' + FORMAT(CHANGELOGSETUP."Old Value") + '</td>');
                                            ROMail.AppendBody('<td style = "color:green" >' + ' ' + FORMAT(Schedl2.Quantity) + '</td>');
                                        END;
                                    UNTIL CHANGELOGSETUP.NEXT = 0;
                            END;
                        UNTIL Schedl2.NEXT = 0;
                        ROMail.AppendBody('</table>');
                        ROMail.Send;
                    END;
                    // ended by Vishnu Priya for  Notification of Modified sales orders on 06-10-2018
                end;
            }
            action(Action134)
            {
                Caption = 'Re&open';
                Promoted = true;
                Image = ReOpen;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    ReleaseSalesDoc: Codeunit 414;
                    SalesLine: Record "Sales Line";
                    OMSIntegrateCode: Codeunit SQLIntegration;
                begin
                    ReleaseSalesDoc.PerformManualReopen(Rec);
                    /* IF (userid1 <> 'SUPER') THEN BEGIN
                        user1.SETRANGE(user1."User ID", userid1);
                        IF user1.FINDFIRST THEN
                            username := user1.Name;
                        Mail_From := 'erp@efftronics.com';
                        Mail_To := 'padmaja@efftronics.com,jhansi@efftronics.com,Sal@efftronics.com,';
                        Mail_To += 'mohang@efftronics.com';
                        Subject := "No." + ' Order Has been Re-opened';
                        Body := '<body><strong><form><table style="WIDTH:400px; HEIGHT: 20px; FONT-WEIGHT: bold"';
                        Body += 'border="1" align="left">';
                        Body += '<tr><td>Order No:</td><td>' + "No.";
                        Body += '</td></tr><tr><td>Customer Name:</td><td>' + "Sell-to Customer Name";
                        Body += '</td></tr><tr><td>Previously Order Release on:</td><td>' + FORMAT("Order Released Date", 0, 4);
                        Body += '</td></tr><tr><td>Re-Opened By:</td><td>' + username;
                        Body += '</td></tr><tr><td>Re-opened Date:</td><td>' + FORMAT(TODAY, 0, 4) + '</td></td></table></form></strong></body>';
                        Body += '<br><br><br><br><br>****  Automatic Mail Generated From ERP  ****';
                        Attachment := '';
                        SMTP_MAIL.CreateMessage('ERP', Mail_From, Mail_To, Subject, Body, TRUE);
                        SMTP_MAIL.AddAttachment(Attachment);
                        SMTP_MAIL.Send;
                        //NewCDOMessage(Mail_From,Mail_To,Subject,Body,Attachment);
                        // CODE WAS COMMENTED FOR NAVISION UPGRADATION

                    END; */

                    /* IF ISCLEAR(MAPIHandler) THEN
                    CREATE(MAPIHandler);
                    IF user.GET(user."User ID") THEN
                    eroorno := 0;
                    MAPIHandler.ToName := 'bharat@efftronics.net';
                    MAPIHandler.ToName := 'chowdary@efftronics.net';
                    MAPIHandler.ToName := 'jhansi@efftronics.net';
                    MAPIHandler.ToName := 'anulatha@efftronics.net';
                    MAPIHandler.ToName := 'sganesh@efftronics.net';
                    MAPIHandler.ToName := 'dir@efftronics.net';
                    MAPIHandler.ToName := 'prasanthi@efftronics.net';
                    MAPIHandler.CCName := 'padmaja@efftronics.net';
                    MAPIHandler.Subject := xRec."No." + 'ORDER Reopen';
                    //OpenNewMessage('anilkumar@efftronics.net');
                    //NewMessage('anilkumar@efftronics','swarupa@efftronics.net','hai','body','attachment',TRUE);
                    MAPIHandler.AddBodyText('ORDER number in ERP' + xRec."No." + ',');
                    MAPIHandler.AddBodyText(xRec."Sell-to Customer Name" + ' is Reopen');
                    MAPIHandler.Send;
                    eroorno := MAPIHandler.ErrorStatus; */
                    "Calculate Tax Structure" := FALSE; //Added by Pranavi on 09-Dec-2015
                end;
            }
        }
        /* modify("<Action1500032>")
        {
            Caption='Calc&ulate Structure Values';
            
        } */        //Removed in BC
        /* modify("Calculate TCS")
        {
            ToolTip ='Calculate TCS';
            Image = CalculateLines;
        } */        //Removed in BC

        addbefore("Create Inventor&y Put-away/Pick")
        {
            action("Request for Authorisation")
            {
                Caption = 'Request for Authorisation';
                Image = SendApprovalRequest;
                trigger OnAction()
                begin
                    IF "Customer Posting Group" = 'PRIVATE' THEN BEGIN
                        IF "Reason For Pending" = '' THEN
                            ERROR('Please Enter Comment At Shipping Tab, Supply Issues Field At Sales Header')
                        ELSE
                            "Request for Authorisation" := TRUE;
                        MODIFY;

                        CLE.SETRANGE(CLE."Customer No.", "Sell-to Customer No.");
                        CLE.SETRANGE(CLE."Sale Order no", "No.");
                        IF CLE.FINDSET THEN
                            REPEAT
                                CLE.CALCFIELDS(CLE.Amount);
                                Receivedamt := Receivedamt + ABS(CLE.Amount);
                            UNTIL CLE.NEXT = 0;


                        /* Cust.SETRANGE(Cust."No.", "Sell-to Customer No.");
               Cust.SETRANGE(Cust."Date Filter", (040108D), TODAY);
               IF Cust.FINDFIRST THEN
                   REPORT.RUN(50136, FALSE, FALSE, Cust);
               REPORT.SAVEASHTML(50136, FORMAT('\\eff-cpu-222\ErpAttachments\cusstatement.html'), FALSE); */


                        PT.SETRANGE(PT.Code, "Payment Terms Code");
                        IF PT.FINDFIRST THEN
                            paymenttermdesc := PT.Description;

                        SALPUR.SETRANGE(SALPUR.Code, "Salesperson Code");
                        IF SALPUR.FINDFIRST THEN
                            spname := SALPUR.Name;

                        Cust.RESET;
                        Cust.SETRANGE(Cust."No.", "Sell-to Customer No.");
                        IF Cust.FINDFIRST THEN BEGIN
                            Cust.CALCFIELDS(Cust."Sales (LCY)");
                            cusbalance := FORMAT(ROUND(Cust."Sales (LCY)", 1));
                        END;

                        "Mail-Id".SETRANGE("Mail-Id"."User Security ID", USERID);
                        IF "Mail-Id".FINDFIRST THEN
                            "from Mail" := "Mail-Id".MailID;
                        //Mail_From:='anilkumar@efftronics.com';
                        Mail_To := 'dir@efftronics.com';
                        Subject := 'Request for Authorisation of Invoice For the Order No:' + FORMAT("No.");
                        Body += '<body><strong><form><table style="WIDTH:400px; HEIGHT: 20px; FONT-WEIGHT: bold"';
                        //cellspacing="7"
                        //cellpadding="1"
                        //width="105"
                        Body += 'border="1" align="center">';
                        Body += '<tr><td>Name</td><td>' + "Sell-to Customer Name" + '</td></tr><br>';
                        Body += '<tr><td>Balance</td><td>' + cusbalance + '</td></tr><br>';
                        Body += '<tr><td>OrderValue</td><td>' + FORMAT("Sale Order Total Amount") + '</td></tr>';
                        Body += '<tr><td>Rec.Amount</td><td>' + FORMAT(ROUND(Receivedamt, 1)) + '</td></tr><br>';
                        Body += '<tr><td>PaymentTerms</td><td>' + paymenttermdesc + '</td></tr>';
                        Body += '<tr><td>Sal.Person</td><td>' + spname + '</td></tr>';
                        Body += '<tr><td>Req.Comments</td><td>' + "Reason For Pending" + '</td></tr>';
                        Body += '<tr><td bgcolor="green">'; //#009900
                        Body += '<a Href="http://eff-cpu-178/erp/webform1.aspx?val1=' + FORMAT("No.") + '&val2=' + FORMAT(spname);
                        //Body+='&val2='+FORMAT(ROUND(Receivedamt,1));
                        Body += '&val3=' + FORMAT('Accepted');
                        //Body+='&val2='+FORMAT(spname);
                        Body += '&val4=1"target="_blank">';
                        //Calibri,#ffffff white
                        Body += '<font face="arial" color="#ffffff">ACCEPT</font></a>';
                        Body += '</td><td bgcolor="red">';
                        Body += '<a Href="http://eff-cpu-178/erp/webform1.aspx?val1=' + FORMAT("No.");
                        Body += '&val2=' + FORMAT(spname);
                        Body += '&val3=' + FORMAT('rejected');
                        Body += '&val4=0';
                        Body += '"target="_blank">';
                        Body += '<font face="arial" color="#ffffff">REJECT</font></a></td></tr>';
                        Body += '</table></form></font></strong></body>';
                        //Attachment:='\\eff-cpu-222\ErpAttachments\cusstatement.html';
                        Attachment := '';
                        //NewCDOMessage(Mail_From,Mail_To,Subject,Body,Attachment);
                        SMTP_MAIL.CreateMessage('ERP', "from Mail", Mail_To, Subject, Body, TRUE);
                        //EFFUPG Start

                        //SMTP_MAIL.AddAttachment(Attachment);

                        SMTP_MAIL.AddAttachment(Attachment, '');
                        //EFFUPG End
                        SMTP_MAIL.Send;

                        //NewCDOMessage("from Mail",Mail_To,Subject,Body,Attachment);
                        MESSAGE(Body);
                    END ELSE
                        ERROR('This Option Only For Private Orders Only');

                    /* UpdateAllowed() : Boolean
                    IF CurrPage.EDITABLE = FALSE THEN
                      ERROR(Text000);
                    EXIT(TRUE); */
                end;
            }
            action("Release To Design")
            {
                Caption = 'Release To Design';
                ToolTipML = "Release To Design";
                Image = Design;
                trigger OnAction()
                var
                    Text01: Label 'Do You want to Send the Document to Design?';
                begin
                    IF ("Sell-to Customer No." = 'CS INT') OR ("Sell-to Customer No." = 'R&D INT') THEN
                        ERROR('These are internal department orders no need to send for DESIGN Approval');
                    IF Status = 1 THEN
                        ERROR('This is released order Not possible to release to Design');
                    IF "SalOrd Des Approval" = TRUE THEN
                        ERROR('This blanket Order already approved');
                    user.GET(USERID);
                    IF NOT CONFIRM(Text01, FALSE) THEN
                        EXIT;
                    newline := 10;
                    TESTFIELD("Document Position", "Document Position"::Sales);
                    "Document Position" := "Document Position"::Design;
                    MODIFY;
                    Mail_Subject := 'Order Released to Design by ' + user."User Name";
                    Mail_Body := 'Order No        : ' + "No.";
                    Mail_Body += FORMAT(newline);
                    Mail_Body += 'Customer Name   : ' + "Sell-to Customer Name";
                    Mail_Body += FORMAT(newline);
                    Mail_Body += FORMAT(newline);
                    Mail_Body += '***** Auto Mail Generated From ERP *****';
                    "Mail-Id".SETRANGE("Mail-Id"."User Security ID", USERID);
                    IF "Mail-Id".FINDFIRST THEN
                        "from Mail" := "Mail-Id".MailID;
                    salesheader.RESET;
                    salesheader.SETFILTER(salesheader."No.", "No.");
                    REPORT.RUN(60004, FALSE, FALSE, salesheader);
                    REPORT.SAVEASHTML(60004, '\\erpserver\ErpAttachments\SALEORDER1.html', FALSE, salesheader);
                    Attachment1 := '\\erpserver\ErpAttachments\SALEORDER1.html';

                    "to mail" := 'prodeng@efftronics.com,sal@efftronics.com,anilkumar@efftronics.com,Pmurali@efftronics.com';
                    MODIFY;
                    IF ("from Mail" <> '') AND ("to mail" <> '') THEN BEGIN
                        SMTP_MAIL.CreateMessage('ERP', "from Mail", "to mail", Mail_Subject, Mail_Body, FALSE);
                        //EFFUPG Start

                        //SMTP_MAIL.AddAttachment(Attachment);

                        SMTP_MAIL.AddAttachment(Attachment, '');
                        //EFFUPG End
                        SMTP_MAIL.Send;
                    END;
                    // mail.NewCDOMessage("from Mail","to mail",Mail_Subject,Mail_Body,'');

                    /* IF ISCLEAR(MAPIHandler) THEN
                      CREATE(MAPIHandler);
                    IF user.GET(user."User ID") THEN
                    eroorno:=0;
                    //MAPIHandler.ToName := 'anilkumar@efftronics.net';
                    MAPIHandler.ToName := 'chowdary@efftronics.net';
                    MAPIHandler.ToName := 'jhansi@efftronics.net';
                    MAPIHandler.ToName := 'anulatha@efftronics.net';
                    MAPIHandler.ToName := 'sganesh@efftronics.net';
                    MAPIHandler.ToName := 'dir@efftronics.net';
                    MAPIHandler.ToName := 'prasanthi@efftronics.net';
                    MAPIHandler.CCName := 'anilkumar@efftronics.net';
                    MAPIHandler.Subject :=xRec."No."+'ORDER Relesed to design';
                    //OpenNewMessage('anilkumar@efftronics.net');
                    //NewMessage('anilkumar@efftronics','swarupa@efftronics.net','hai','body','attachment',TRUE);
                    MAPIHandler.AddBodyText('ORDER number in ERP'+xRec."No."+',');
                    MAPIHandler.AddBodyText(xRec."Sell-to Customer Name"+' is Relesed to Design');
                    MAPIHandler.Send;
                    eroorno:=MAPIHandler.ErrorStatus; */
                end;
            }
            action("Update RDSO Details")
            {
                Caption = 'Update RDSO Details';
                Image = UpdateDescription;
                trigger OnAction()
                var
                    SalesLine: Record "Sales Line";
                begin
                    SalesLine.SETRANGE(SalesLine."Document Type", "Document Type");
                    SalesLine.SETRANGE(SalesLine."Document No.", "No.");
                    IF SalesLine.FINDSET THEN
                        REPEAT
                            SalesLine."RDSO Charges Paid By" := "RDSO Charges Paid By";
                            SalesLine."RDSO Inspection Required" := "RDSO Inspection Required";
                            SalesLine."RDSO Inspection By" := "RDSO Inspection By";
                            SalesLine."RDSO Charges" := "RDSO Charges";
                            SalesLine.MODIFY;
                        UNTIL SalesLine.NEXT = 0;
                end;
            }
            action("Release To Finance")
            {
                Caption = 'Release To Finance';
                Image = SuggestFinancialCharge;
                trigger OnAction()
                var
                    Text01: Label 'Do You want to Send the Document to Finance?';
                begin
                    IF NOT CONFIRM(Text01, FALSE) THEN
                        EXIT;
                    TESTFIELD("Document Position", "Document Position"::Sales);
                    "Document Position" := "Document Position"::"3";
                    MODIFY;
                end;

            }
        }
        addafter("P&osting")
        {
            action("ProformaInvoice Report")
            {
                Ellipsis = true;
                Caption = 'ProformaInvoice Report';
                Image = SelectReport;
                trigger OnAction()
                begin
                    ReportPrint.PrintSalesHeader(Rec);
                end;
            }
            action("Test Report2")
            {
                Caption = 'Test Report2';
                Image = TestReport;
                trigger OnAction()
                begin
                    "sales header".SETRANGE("sales header"."No.", "No.");
                    REPORT.RUN(50151, TRUE, FALSE, "sales header");
                end;
            }
        }
        modify(Post)
        {
            trigger OnBeforeAction()
            var
                PurchaseHeader: Record "Purchase Header";
                SalesLine: Record "Sales Line";
                ScheduleComp: Record Schedule2;
                Item: Record Item;
                ReservationEntry: Record "Reservation Entry";
                Qty: Decimal;
                ScheduleComp1: Record Schedule2;
                SalesLine1: Record "Sales Line";
                PaymentTerms: Record "Payment Terms";
                DCLE: Record "Detailed Cust. Ledg. Entry";
                AdvPaymentAmt: Decimal;
            begin
                //Added by Pranavi on 26-06-2015 to restrict posting if order not released atleast once
                SHA.RESET;
                SHA.SETCURRENTKEY("Document Type", "No.", "Date Archived", "Time Archived");
                SHA.SETFILTER(SHA."No.", "No.");
                IF NOT SHA.FINDFIRST THEN BEGIN
                    IF Status <> Status::Released THEN
                        ERROR('Order Must be released atleast One Time!\ Please release the Order!');
                END;
                SHA.RESET;
                //End by Pranavi

                //temprarily commented by vishnu priya on 01-04-2020

                // Added by Rakesh on 19-May-14 for validating posting date
                IF "Posting Date" < TODAY THEN BEGIN
                    //IF NOT ("No." IN ['EFF/SAL/14-15/077']) THEN
                    ERROR('Bill cannot be posted with Previous date');
                    /* IF CONFIRM('Do want to Post with Previous date ?') = FALSE THEN
                       EXIT; */
                END;

                // end by Rakesh

                //Added by Rakesh to restrict posting items with unit cost zero on 15-Oct-14
                SalesLine.RESET;
                SalesLine.SETFILTER(SalesLine."Document No.", "No.");
                SalesLine.SETFILTER(SalesLine."Qty. to Invoice", '>%1', 0);
                SalesLine.SETFILTER("Sell-to Customer No.", '<>%1', 'CUST00536');
                IF SalesLine.FINDSET THEN
                    REPEAT
                        IF (SalesLine."Line Amount" = 0) OR (SalesLine."Unitcost(LOA)" = 0) THEN
                            ERROR('Amount for the ' + SalesLine."No." + ' is zero.');
                    UNTIL SalesLine.NEXT = 0;
                //end by Rakesh



                //IF "Posting Date" < "Order Date" THEN
                // ERROR('Posting Date must be Greater than Order Date');

                DepartmentsCode := COPYSTR("Shortcut Dimension 1 Code", 1, 3);
                //MESSAGE('%1',DepartmentsCode);
                IF InvoiceNos IN [InvoiceNos::ExciseInv, InvoiceNos::InstInv, InvoiceNos::TradingInv] THEN BEGIN
                    IF DepartmentsCode <> 'PRD' THEN
                        ERROR('Departments Code must be "PRD" for %1', InvoiceNos);
                END;
                IF InvoiceNos IN [InvoiceNos::ServiceInv] THEN BEGIN
                    IF DepartmentsCode <> 'CUS' THEN
                        ERROR('Departments Code must be "CUS" for %1', InvoiceNos);
                END;
                /* IF ("Sell-to Customer No."='CUST00822') AND ("Total Order(LOA)Value" >1000) THEN
                ERROR('change the customer.you cannot post orders with this customer'); */


                // Added by Rakesh on 16-Jun-14 for validating the Salesperson code
                IF "Salesperson Code" = '' THEN
                    ERROR('Enter the Salesperson code in General tab');
                // End by Rakesh
                IF "Ship-to Name" IN ['', ' '] THEN   // >> Validation added by Pranavi on 03-05-17
                    ERROR('Please enter the Consignee(Ship-to-Name) in Shipping FastTab!');

                //posting date error
                SaleInvHeadRec.RESET;
                SaleInvHeadRec.SETRANGE(SaleInvHeadRec."External Document No.", "External Document No.");
                IF SaleInvHeadRec.FINDLAST THEN
                    IF ("Posting Date" < SaleInvHeadRec."Posting Date") THEN
                        ERROR('Please Check the Posting Date');



                SalesLine.SETRANGE(SalesLine."Document No.", "No.");
                SalesLine.SETFILTER(SalesLine."Qty. to Invoice", '%1..%2', 1, 1000000000);
                IF SalesLine.FINDSET THEN BEGIN
                    /* IF SalesLine.COUNT>5 THEN
                    ERROR('At a time you can invoice a maximum of 5 lines only' ); */
                END;

                IF "Customer Posting Group" = 'RAILWAYS' THEN BEGIN
                    SalesLine.SETRANGE(SalesLine."Document No.", "No.");
                    SalesLine.SETFILTER(SalesLine."Qty. to Invoice", '%1..%2', 1, 1000000000);
                    IF SalesLine.FINDSET THEN
                        REPEAT
                            IF (SalesLine."Schedule No" = 0) OR (SalesLine."Schedule Type" = 0) THEN
                                ERROR('PLEASE ENTER SCHEDULE NO');
                        UNTIL SalesLine.NEXT = 0;
                END;
                servicetaxamt := 0;
                IF Structure = 'SERVICE' THEN BEGIN
                    SL.RESET;
                    SL.SETRANGE(SL."Document No.", "No.");
                    SL.SETFILTER(SL."No.", '<>%1', '');
                    SL.SETFILTER(SL."Qty. to Ship", '>%1', 0);
                    IF SL.FINDSET THEN
                        REPEAT
                            servicetaxamt := servicetaxamt + SL."Service Tax Amount";
                        UNTIL SL.NEXT = 0;
                    IF (servicetaxamt = 0) AND (SL."Service Tax Group" <> 'INC COM & INST_RLY') THEN
                        ERROR('You are not calculated the Service Tax Amount, first calculate the Structure Values then post the invoice');
                END;

                // Added by Pranavi on 07-Jul-2016 for checking if Ext doc no already exist
                IF DATE2DMY("Posting Date", 2) <= 3 THEN
                    FYear := DATE2DMY("Posting Date", 3) - 1
                ELSE
                    FYear := DATE2DMY("Posting Date", 3);

                POSTEDINVOICE1.RESET;
                POSTEDINVOICE1.SETCURRENTKEY(POSTEDINVOICE1."External Document No.");
                POSTEDINVOICE1.ASCENDING;
                POSTEDINVOICE1.SETRANGE(POSTEDINVOICE1."Posting Date", DMY2DATE(1, 4, FYear), DMY2DATE(1, 4, FYear + 1));  // Added by Rakesh
                POSTEDINVOICE1.SETFILTER(POSTEDINVOICE1."External Document No.", "External Document No.");
                IF POSTEDINVOICE1.FINDFIRST THEN BEGIN
                    ERROR('External Doc No.' + "External Document No." + ' already exist. Select again the Invoice No. Series!');
                END;
                // End by Pranavi on 07-Jul-2016
                // Added by Pranavi on 14-Jul-2016 for Customer Checking
                IF "Sell-to Customer No." <> "Bill-to Customer No." THEN
                    ERROR('Sell to Customer No.:' + "Sell-to Customer No." + ' and Bill to Customer No.:' + "Bill-to Customer No." + ' should be equal!');
                // End by Pranavi on14-Jul-2016
                //PRANAVI

                // un commented by sujani 29-10-19 to enable qty to ship restriction for schedule

                //B2BSP  Start
                //B2B

                //ERROR('Please contact ERP Team'); // added by vishnu on 11-02-2020 for the Schedules testing purpose

                SalesLine1.RESET;
                SalesLine1.SETRANGE("Document No.", Rec."No.");
                IF SalesLine1.FINDSET THEN BEGIN
                    REPEAT
                        SalesLine.RESET;
                        SalesLine.SETRANGE("Document No.", SalesLine1."Document No.");
                        //SalesLine.SETRANGE("Line No.",SalesLine1."Line No.");
                        SalesLine.SETRANGE(Type, SalesLine.Type::Item);
                        SalesLine.SETFILTER("Qty. to Ship", '<>%1', 0);
                        IF SalesLine.FINDSET THEN BEGIN
                            REPEAT

                                /* // condition added by Pranavi on 29-09-2016 for pvt orders payment terms integration
                                IF NOT("Sell-to Customer No." IN['CUST00536','CUST01164']) AND ("Customer Posting Group" IN['PRIVATE','OTHERS','EXPORT']) AND (Order_After_CF_Integration = TRUE) THEN
                                  IF ROUND(SalesLine."Unitcost(LOA)"*SalesLine."Qty. to Ship",1,'>') <> ROUND(SalesLine."Amount To Customer",1,'>') THEN
                                    ERROR('Amount to Customer:'+FORMAT(ROUND(SalesLine."Amount To Customer",1,'>'))+' and UnitCost(LOA)*Qty.to Ship: '+
                                          FORMAT(ROUND(SalesLine."Unitcost(LOA)"*SalesLine."Qty. to Ship",1,'>'))+' must be equal!');
                                // end by pranavi */

                                IF Rec."No." <> 'EFF/SAL/19-20/0457' THEN  // added  by vishnu priya on 14-12-2019
                                BEGIN
                                    ScheduleComp.RESET;
                                    //ScheduleComp.SETFILTER("Document No.",'<>%1&<>%2','EFF/SAL/19-20/0457','');
                                    ScheduleComp.SETRANGE("Document No.", SalesLine."Document No.");
                                    ScheduleComp.SETRANGE("Document Line No.", SalesLine."Line No.");
                                    ScheduleComp.SETRANGE(Type, ScheduleComp.Type::Item);
                                    ScheduleComp.SETFILTER("Line No.", '<>%1', 10000);
                                    ScheduleComp.SETFILTER("Outstanding Qty.", '>%1', 0);
                                    //b2bJM >>
                                    //ScheduleComp.SETFILTER("Document No.",'<>%1','EFF/SAL/19-20/0457'); //Given provision for EFF/SAL/19-20/0387 by the anvesh sir approval
                                    ScheduleComp.SETFILTER("Qty. to Ship", '>%1', 0); // uncomment this for temp solution for emergency orders with out shipping schedule add by sujani on 29-10-19
                                                                                      //b2bJM <<
                                    IF ScheduleComp.FINDSET THEN BEGIN
                                        REPEAT
                                            IF ScheduleComp."Document Line No." <> ScheduleComp."Line No." THEN BEGIN
                                                IF NOT (ROUND(ScheduleComp."Qty. to ship (Base)", 1, '>') = ROUND((ScheduleComp."Qty. Per" * SalesLine."Qty. to Ship (Base)"), 1, '>')) THEN BEGIN
                                                    MESSAGE('%1-- %2', ROUND(ScheduleComp."Qty. to ship (Base)", 1, '>'), ROUND(ScheduleComp."Qty. Per" * SalesLine."Qty. to Ship (Base)"), 1, '>');
                                                    ERROR('As per the "Qty Per" Schedule Items are not sufficient for Schedule Component line no %1 of Line No.: %2', ScheduleComp."Line No.", ScheduleComp."Document Line No.");
                                                END;
                                                Item.GET(ScheduleComp."No.");
                                                IF Item."Item Tracking Code" <> '' THEN BEGIN
                                                    CLEAR(Qty);
                                                    ReservationEntry.SETRANGE("Source ID", ScheduleComp."Document No.");
                                                    ReservationEntry.SETRANGE("Source Prod. Order Line", ScheduleComp."Document Line No.");
                                                    ReservationEntry.SETRANGE("Source Ref. No.", ScheduleComp."Line No.");
                                                    IF ReservationEntry.FINDSET THEN BEGIN
                                                        REPEAT
                                                            Qty += ABS(ReservationEntry.Quantity);
                                                        UNTIL ReservationEntry.NEXT = 0;
                                                        IF Qty < (ScheduleComp."Qty. to Ship") THEN
                                                            ERROR('Define Item Tracking for Schedule Components Line no  %1 of Line No.: %2', ScheduleComp."Line No.", ScheduleComp."Document Line No.");//  Commented by vijaya on 11-Feb-2016
                                                    END ELSE
                                                        ERROR('Item Tracking Doesnt Exist for the Schedule Comp Line no %1 of Line No.: %2', ScheduleComp."Line No.", ScheduleComp."Document Line No.");
                                                END;
                                            END;
                                        UNTIL ScheduleComp.NEXT = 0;
                                    END;
                                END;

                            UNTIL SalesLine.NEXT = 0;
                        END;
                    UNTIL SalesLine1.NEXT = 0;
                END;
                //B2B

                //B2BSP End
                //}un commented by sujani 29-10-19 to enable qty to ship restriction for schedule
                IF ((Rec."No." IN ['EFF/SAL/18-19/0211', 'EFF/SAL/18-19/0180', 'EFF/SAL/18-19/0181', 'EFF/SAL/18-19/0472',
                'EFF/SAL/18-19/0397', 'EFF/SAL/18-19/0532', 'EFF/SAL/18-19/0597', 'EFF/SAL/18-19/0583', 'EFF/SAL/18-19/0567',
                'EFF/SAL/18-19/0891', 'EFF/SAL/18-19/0896', 'EFF/SAL/18-19/0740', 'EFF/SAL/18-19/0760', 'EFF/SAL/18-19/0761',
                'EFF/SAL/18-19/0762', 'EFF/SAL/18-19/0842', 'EFF/SAL/18-19/0843', 'EFF/SAL/18-19/0868', 'EFF/SAL/18-19/0869',
                'EFF/SAL/18-19/0887', 'EFF/SAL/18-19/0888', 'EFF/SAL/18-19/L00077', 'EFF/SAL/18-19/0769', 'EFF/SAL/18-19/0835',
                'EFF/SAL/18-19/0747', 'EFF/SAL/18-19/0720', 'EFF/SAL/18-19/0940', 'EFF/SAL/18-19/0865', 'EFF/SAL/18-19/0931',
                'EFF/SAL/18-19/0891', 'EFF/SAL/18-19/0932', 'EFF/SAL/18-19/0741', 'EFF/SAL/18-19/L00108',
                'EFF/SAL/18-19/0897', 'EFF/SAL/18-19/0907', 'EFF/SAL/18-19/0921', 'EFF/SAL/18-19/0926', 'EFF/SAL/18-19/0944',
                'EFF/SAL/18-19/0949', 'EFF/SAL/18-19/0952', 'EFF/SAL/18-19/0367', 'EFF/SAL/18-19/0955', 'EFF/SAL/18-19/0842',
                'EFF/SAL/18-19/0937', 'EFF/SAL/18-19/0947', 'EFF/SAL/18-19/0889', 'EFF/SAL/18-19/0838', 'EFF/SAL/18-19/0908',
                'EFF/SAL/18-19/0248', 'EFF/SAL/18-19/0272', 'EFF/SAL/18-19/0338', 'EFF/SAL/18-19/0339', 'EFF/SAL/18-19/0552',
                'EFF/SAL/18-19/0627', 'EFF/SAL/18-19/0733', 'EFF/SAL/18-19/0759', 'EFF/SAL/18-19/0767', 'EFF/SAL/18-19/0776',
                'EFF/SAL/18-19/0777', 'EFF/SAL/18-19/0830', 'EFF/SAL/18-19/0833', 'EFF/SAL/18-19/0733',
                'EFF/SAL/18-19/0800', 'EFF/SAL/18-19/0809', 'EFF/SAL/18-19/0812', 'EFF/SAL/18-19/0853', 'EFF/SAL/18-19/0855',
                'EFF/SAL/18-19/0870', 'EFF/SAL/18-19/0885', 'EFF/SAL/18-19/0908', 'EFF/SAL/18-19/0909', 'EFF/SAL/18-19/0910',
                'EFF/SAL/18-19/0911', 'EFF/SAL/18-19/0914', 'EFF/SAL/19-20/0219', 'EFF/SAL/19-20/0133', 'EFF/SAL/18-19/0658',
                'EFF/SAL/18-19/0916', 'EFF/SAL/18-19/0930', 'EFF/SAL/18-19/0958', 'EFF/SAL/19-20/0417',
                'EFF/SAL/18-19/0909', 'EFF/SAL/18-19/0910', 'EFF/SAL/18-19/0927', 'EFF/SAL/18-19/0917', 'EFF/SAL/19-20/0440', 'EFF/SAL/19-20/0315',
                'EFF/SAL/19-20/0417', 'EFF/SAL/19-20/0556', 'EFF/SAL/19-20/0579', 'EFF/SAL/19-20/0728', 'EFF/SAL/19-20/0729', 'EFF/SAL/19-20/0739', 'EFF/SAL/19-20/0764', 'EFF/SAL/19-20/0772',
                'EFF/SAL/19-20/0703', 'EFF/SAL/19-20/0823', 'EFF/SAL/19-20/0829', 'EFF/SAL/19-20/0861', 'EFF/SAL/19-20/0871',
                'EFF/SAL/19-20/0563', 'EFF/SAL/19-20/0702', 'EFF/SAL/19-20/0708', 'EFF/SAL/19-20/0717', 'EFF/SAL/19-20/0730', 'EFF/SAL/19-20/0833',
                'EFF/SAL/19-20/0135', 'EFF/SAL/19-20/0580', 'EFF/SAL/19-20/0734', 'EFF/SAL/19-20/0742', 'EFF/SAL/19-20/0774', 'EFF/SAL/19-20/0819', 'EFF/SAL/19-20/0891',
                'EFF/SAL/19-20/0432', 'EFF/SAL/19-20/0762',
                'EFF/SAL/20-21/0050', 'EFF/SAL/20-21/0066', 'EFF/SAL/20-21/0095', 'EFF/SAL/20-21/0111', 'EFF/SAL/20-21/0114', 'EFF/SAL/19-20/0779',
                'EFF/SAL/19-20/0806', 'EFF/SAL/19-20/0894', 'EFF/SAL/19-20/0906', 'EFF/SAL/20-21/0024', 'EFF/SAL/20-21/0083', 'EFF/SAL/20-21/0099',
                'EFF/SAL/20-21/0117', 'EFF/SAL/20-21/0121', 'EFF/SAL/20-21/0128', 'EFF/SAL/20-21/0136', 'EFF/SAL/20-21/0102', 'EFF/SAL/20-21/0139',
                'EFF/SAL/20-21/0146', 'EFF/SAL/20-21/0048', 'EFF/SAL/20-21/0071', 'EFF/SAL/19-20/0899', 'EFF/SAL/18-19/0706', 'EFF/SAL/19-20/0210',
                'EFF/SAL/18-19/0170', 'EFF/SAL/20-21/0089', 'EFF/SAL/20-21/0131', 'EFF/SAL/20-21/0026', 'EFF/SAL/20-21/0151', 'EFF/SAL/20-21/0221'])
                OR (Rec."Sell-to Customer No." IN ['CUST01883', 'CUST01488']))
                THEN // added by sujani 21-09-18 FOR BILLING WITH OUT MOVING IT TO FPO
                     //IF (Rec."Sell-to Customer No." IN ['CUST01883','CUST01488']) THEN // ivis and security brands
                    MESSAGE('You are billing this Order With Out Finishing RPO Click Yes to continue')
                ELSE BEGIN
                    TestRPOStatus;
                END;    //Added by Pranavi on 28-10-2015 for not allowing to post if RPO is not finished
                        //COOMENTED FOR f_YEAR ENDING BILLINGS

                // Added by Pranavi on 26-Jul-2016 for payment terms process
                IF ("Customer Posting Group" IN ['PRIVATE', 'OTHERS', 'EXPORT']) AND NOT ("Sell-to Customer No." IN ['CUST00536', 'CUST01164'])
                  AND (Order_After_CF_Integration = TRUE) THEN BEGIN
                    IF "Payment Terms Code" = '' THEN BEGIN
                        CUS.RESET;
                        CUS.SETRANGE(CUS."No.", "Sell-to Customer No.");
                        IF CUS.FINDFIRST THEN BEGIN
                            IF CUS."Payment Terms Code" <> '' THEN BEGIN
                                "Payment Terms Code" := CUS."Payment Terms Code";
                                MODIFY;
                            END
                            ELSE
                                ERROR('Please enter Payment terms code in customer card!');
                        END;
                    END
                    ELSE BEGIN
                        IF "Payment Terms Code" IN ['ASPERMNC', 'ASPERTNDR'] THEN
                            ERROR('Please enter Payment Terms mentioned in PO!\It should not be ' + "Payment Terms Code")
                        ELSE BEGIN
                            PT.RESET;
                            PT.SETRANGE(PT.Code, "Payment Terms Code");
                            IF PT.FINDFIRST THEN BEGIN
                                IF PT."Stage 1" = PT."Stage 1"::Advance THEN
                                    "PT_Adv%" := PT."Percentage 1"
                                ELSE
                                    IF PT."Stage 1" IN [PT."Stage 1"::Delivery, PT."Stage 1"::Against_RDSO_IC, PT."Stage 1"::Before_Delivery] THEN
                                        "PT_Del%" := PT."Percentage 1"
                                    ELSE
                                        IF PT."Stage 1" = PT."Stage 1"::Credit THEN
                                            "PT_Crd%" := PT."Percentage 1";

                                IF PT."Stage 2" IN [PT."Stage 2"::Delivery, PT."Stage 2"::Against_RDSO_IC, PT."Stage 2"::Before_Delivery] THEN
                                    "PT_Del%" := PT."Percentage 2"
                                ELSE
                                    IF PT."Stage 2" = PT."Stage 2"::Credit THEN
                                        "PT_Crd%" := PT."Percentage 2";

                                IF PT."Stage 3" IN [PT."Stage 3"::Delivery, PT."Stage 3"::Against_RDSO_IC, PT."Stage 3"::Before_Delivery] THEN
                                    "PT_Del%" := PT."Percentage 3"
                                ELSE
                                    IF PT."Stage 3" = PT."Stage 3"::Credit THEN
                                        "PT_Crd%" := PT."Percentage 3";
                                SL1.RESET;
                                SL1.SETRANGE(SL1."Document Type", SL1."Document Type"::Order);
                                SL1.SETRANGE(SL1."Document No.", "No.");
                                SL1.SETFILTER(SL1."No.", '<>%1', '');
                                SL1.SETFILTER(SL1.Quantity, '>%1', 0);
                                IF SL1.FINDSET THEN
                                    REPEAT
                                        IF SL1.Type = SL1.Type::Item THEN BEGIN
                                            IF Itm_Tmp.GET(SL1."No.") THEN BEGIN
                                                IF Itm_Tmp."Item Sub Sub Group Code" = 'INSTALLATION' THEN BEGIN
                                                    IF SL1."Supply Portion" + SL1."Retention Portion" <> 100 THEN
                                                        ERROR('Total supply and retention portion must be equal to 100 %!\present value is :' +
                                                            FORMAT(SL1."Supply Portion" + SL1."Retention Portion"));
                                                    IF SL1."Retention Portion" <> 100 THEN
                                                        ERROR('Retention portion of line no.: ' + FORMAT(SL1."Line No.") + ' must be 100 % for G/L Accounts!');
                                                END ELSE BEGIN
                                                    IF SL1."Supply Portion" + SL1."Retention Portion" <> 100 THEN
                                                        ERROR('Total supply and retention portion must be equal to 100 %!\present value is :' +
                                                              FORMAT(SL1."Supply Portion" + SL1."Retention Portion"));
                                                    IF SL1."Retention Portion" > 0 THEN BEGIN
                                                        IF SL1."Supply Portion" <> ("PT_Adv%" + "PT_Del%") THEN
                                                            ERROR('Supply portion of line no.: ' + FORMAT(SL1."Line No.") + ' must be equal to (adv+del)% in payment term!');
                                                        IF SL1."Retention Portion" <> "PT_Crd%" THEN
                                                            ERROR('Retention portion of line no.: ' + FORMAT(SL1."Line No.") + ' must be equal to credit % in payment term!');
                                                    END ELSE BEGIN
                                                        IF SL1."Supply Portion" <> ("PT_Adv%" + "PT_Del%" + "PT_Crd%") THEN
                                                            ERROR('Supply portion of line no.: ' + FORMAT(SL1."Line No.") + ' must be equal to (adv+del)% in payment term!');
                                                    END;
                                                END;
                                            END;
                                        END ELSE BEGIN
                                            IF SL1."Supply Portion" + SL1."Retention Portion" <> 100 THEN
                                                ERROR('Total supply and retention portion must be equal to 100 %!\present value is :' +
                                                      FORMAT(SL1."Supply Portion" + SL1."Retention Portion"));
                                            IF SL1."Retention Portion" <> 100 THEN
                                                ERROR('Retention portion of line no.: ' + FORMAT(SL1."Line No.") + ' must be 100 % for G/L Accounts!');
                                        END;
                                    UNTIL SL1.NEXT = 0;
                                SalesLine.RESET;
                                SalesLine.SETRANGE(SalesLine."Document Type", SalesLine."Document Type"::Order);
                                SalesLine.SETRANGE(SalesLine."Document No.", "No.");
                                SalesLine.SETFILTER(SalesLine."No.", '<>%1', '');
                                SalesLine.SETFILTER(SalesLine.Quantity, '>%1', 0);
                                IF SalesLine.FINDSET THEN
                                    REPEAT
                                        IF SalesLine."Unitcost(LOA)" = 0 THEN
                                            ERROR('Please enter UnitCost(LOA) amount line no.:' + FORMAT(SalesLine."Line No."));
                                        LineAmtLOA := 0;
                                        LineAmtLOA := ROUND(SalesLine.Quantity * SalesLine."Unitcost(LOA)", 1);
                                        IF SalesLine.Type = SalesLine.Type::Item THEN BEGIN
                                            IF Itm_Tmp.GET(SL1."No.") THEN BEGIN
                                                IF Itm_Tmp."Item Sub Sub Group Code" = 'INSTALLATION' THEN BEGIN
                                                    InstAmt := InstAmt + ROUND(SalesLine.Quantity * SalesLine."Unitcost(LOA)", 1);
                                                END ELSE BEGIN
                                                    AdvAmt += LineAmtLOA * "PT_Adv%" / 100;
                                                    IF SalesLine."Retention Portion" > 0 THEN BEGIN
                                                        RetentionAmt := RetentionAmt + (LineAmtLOA * SalesLine."Retention Portion" / 100);
                                                        SupplyAmt := SupplyAmt + (LineAmtLOA - (LineAmtLOA * SalesLine."Retention Portion" / 100));
                                                    END ELSE BEGIN
                                                        SupplyAmt := SupplyAmt + LineAmtLOA;
                                                    END;
                                                END;
                                            END;
                                        END
                                        ELSE
                                            IF SalesLine.Type = SalesLine.Type::"G/L Account" THEN BEGIN
                                                InstAmt := InstAmt + ROUND(SalesLine.Quantity * SalesLine."Unitcost(LOA)", 1);
                                            END;
                                    UNTIL SalesLine.NEXT = 0;

                                IF (PT."Stage 1" = PT."Stage 1"::Credit) OR (PT."Stage 1" = PT."Stage 2"::Credit) OR
                                   (PT."Stage 1" = PT."Stage 3"::Credit) THEN BEGIN
                                    CUS.RESET;
                                    CUS.SETRANGE(CUS."No.", "Sell-to Customer No.");
                                    IF CUS.FINDFIRST THEN
                                        IF CUS."Payment Term Auth" <> CUS."Payment Term Auth"::Authorized THEN
                                            ERROR('As payment terms is credit based. Authorization is required!\Please take authorization!');
                                END;
                                IF PT."Update In Cashflow" = FALSE THEN
                                    ERROR('Please update Payment Term Code: ' + "Payment Terms Code" + ' to CashFlow!')
                                ELSE BEGIN
                                    //Start--Advance Checking
                                    IF (PT."Stage 1" = PT."Stage 1"::Advance) AND (PT."Percentage 1" <> 0) THEN BEGIN
                                        CLE.RESET;
                                        CLE.SETRANGE(CLE."Customer No.", "Sell-to Customer No.");
                                        CLE.SETRANGE(CLE."Payment Type", CLE."Payment Type"::Advance);
                                        CLE.SETRANGE(CLE."Sale Order no", "No.");
                                        IF CLE.FINDSET THEN BEGIN
                                            REPEAT
                                                DCLE.RESET;
                                                DCLE.SETRANGE(DCLE."Cust. Ledger Entry No.", CLE."Entry No.");
                                                DCLE.SETRANGE(DCLE."Entry Type", DCLE."Entry Type"::"Initial Entry");
                                                IF DCLE.FINDSET THEN
                                                    REPEAT
                                                        AdvPaymentAmt := AdvPaymentAmt + ABS(DCLE."Amount (LCY)");
                                                    UNTIL DCLE.NEXT = 0;
                                            UNTIL CLE.NEXT = 0;
                                            IF ROUND(AdvPaymentAmt, 0.01, '>') < ROUND((SupplyAmt * PT."Percentage 1") / 100, 0.01, '>') THEN BEGIN
                                                IF "PT Post Auth Stutus" = "PT Post Auth Stutus"::"Sent For Auth" THEN
                                                    ERROR('Authorization is in pending.Please take Authorization!')
                                                ELSE
                                                    IF "PT Post Auth Stutus" = "PT Post Auth Stutus"::Rejected THEN
                                                        ERROR('Your permission for posting is rejected!');
                                                IF "PT Post Auth Stutus" = "PT Post Auth Stutus"::" " THEN BEGIN
                                                    MESSAGE('Total Advance Payment is not recovered!Advance Amt of Order Value is: ' +
                                                          FORMAT(AdvAmt) +
                                                          '\Recovered Adv Amount is: ' + FORMAT(ROUND(AdvPaymentAmt, 0.01, '>')));
                                                    IF CONFIRM('Do you want to Post with Authorization?\Do you want to Send for Authorization? ') THEN
                                                        SendForAuth('Post');
                                                    EXIT;
                                                END;
                                            END;
                                        END ELSE BEGIN
                                            IF "PT Post Auth Stutus" = "PT Post Auth Stutus"::"Sent For Auth" THEN
                                                ERROR('Authorization is in pending.Please take Authorization!')
                                            ELSE
                                                IF "PT Post Auth Stutus" = "PT Post Auth Stutus"::Rejected THEN
                                                    ERROR('Your permission for Posting is rejected!');
                                            IF "PT Post Auth Stutus" = "PT Post Auth Stutus"::" " THEN BEGIN
                                                MESSAGE('Payment terms has ' + FORMAT(PT."Percentage 1") + ' % Advance Payment! But Advance payment is not done!');
                                                IF CONFIRM('Do you want to Post with Authorization?\Do you want to Send for Authorization? ') THEN
                                                    SendForAuth('Post');
                                                EXIT;
                                            END;
                                        END;
                                    END;
                                    // End--Advance Checking
                                    // Start--Before Del Amt Checking
                                    IF (PT."Stage 1" = PT."Stage 1"::Advance) AND (PT."Percentage 1" <> 0) THEN BEGIN
                                        CLE.RESET;
                                        CLE.SETRANGE(CLE."Customer No.", "Sell-to Customer No.");
                                        CLE.SETRANGE(CLE."Payment Type", CLE."Payment Type"::Advance);
                                        CLE.SETRANGE(CLE."Sale Order no", "No.");
                                        IF CLE.FINDSET THEN BEGIN
                                            REPEAT
                                                DCLE.RESET;
                                                DCLE.SETRANGE(DCLE."Cust. Ledger Entry No.", CLE."Entry No.");
                                                DCLE.SETRANGE(DCLE."Entry Type", DCLE."Entry Type"::"Initial Entry");
                                                IF DCLE.FINDSET THEN
                                                    REPEAT
                                                        AdvPaymentAmt := AdvPaymentAmt + ABS(DCLE."Amount (LCY)");
                                                    UNTIL DCLE.NEXT = 0;
                                            UNTIL CLE.NEXT = 0;
                                            IF ROUND(AdvPaymentAmt, 0.01, '>') < ROUND((SupplyAmt * PT."Percentage 1") / 100, 0.01, '>') THEN BEGIN
                                                IF "PT Post Auth Stutus" = "PT Post Auth Stutus"::"Sent For Auth" THEN
                                                    ERROR('Authorization is in pending.Please take Authorization!')
                                                ELSE
                                                    IF "PT Post Auth Stutus" = "PT Post Auth Stutus"::Rejected THEN
                                                        ERROR('Your permission for posting is rejected!');
                                                IF "PT Post Auth Stutus" = "PT Post Auth Stutus"::" " THEN BEGIN
                                                    MESSAGE('Total Advance Payment is not recovered!Advance Amt of Order Value is: ' +
                                                          FORMAT(AdvAmt) +
                                                          '\Recovered Adv Amount is: ' + FORMAT(ROUND(AdvPaymentAmt, 0.01, '>')));
                                                    IF CONFIRM('Do you want to Post with Authorization?\Do you want to Send for Authorization? ') THEN
                                                        SendForAuth('Post');
                                                    EXIT;
                                                END;
                                            END;
                                        END ELSE BEGIN
                                            IF "PT Post Auth Stutus" = "PT Post Auth Stutus"::"Sent For Auth" THEN
                                                ERROR('Authorization is in pending.Please take Authorization!')
                                            ELSE
                                                IF "PT Post Auth Stutus" = "PT Post Auth Stutus"::Rejected THEN
                                                    ERROR('Your permission for Posting is rejected!');
                                            IF "PT Post Auth Stutus" = "PT Post Auth Stutus"::" " THEN BEGIN
                                                MESSAGE('Payment terms has ' + FORMAT(PT."Percentage 1") + ' % Advance Payment! But Advance payment is not done!');
                                                IF CONFIRM('Do you want to Post with Authorization?\Do you want to Send for Authorization? ') THEN
                                                    SendForAuth('Post');
                                                EXIT;
                                            END;
                                        END;
                                    END;
                                    IF (PT."Stage 2" IN [PT."Stage 2"::Advance]) AND (PT."Percentage 2" <> 0) THEN BEGIN
                                        CLE.RESET;
                                        CLE.SETRANGE(CLE."Customer No.", "Sell-to Customer No.");
                                        CLE.SETRANGE(CLE."Payment Type", CLE."Payment Type"::Advance);
                                        CLE.SETRANGE(CLE."Sale Order no", "No.");
                                        IF CLE.FINDSET THEN BEGIN
                                            REPEAT
                                                DCLE.RESET;
                                                DCLE.SETRANGE(DCLE."Cust. Ledger Entry No.", CLE."Entry No.");
                                                DCLE.SETRANGE(DCLE."Entry Type", DCLE."Entry Type"::"Initial Entry");
                                                IF DCLE.FINDSET THEN
                                                    REPEAT
                                                        AdvPaymentAmt := AdvPaymentAmt + ABS(DCLE."Amount (LCY)");
                                                    UNTIL DCLE.NEXT = 0;
                                            UNTIL CLE.NEXT = 0;
                                            IF ROUND(AdvPaymentAmt, 0.01, '>') < ROUND((SupplyAmt * PT."Percentage 2") / 100, 0.01, '>') THEN BEGIN
                                                IF "PT Post Auth Stutus" = "PT Post Auth Stutus"::"Sent For Auth" THEN
                                                    ERROR('Authorization is in pending.Please take Authorization!')
                                                ELSE
                                                    IF "PT Post Auth Stutus" = "PT Post Auth Stutus"::Rejected THEN
                                                        ERROR('Your permission for posting is rejected!');
                                                IF "PT Post Auth Stutus" = "PT Post Auth Stutus"::" " THEN BEGIN
                                                    MESSAGE('Total Advance Payment is not recovered!Advance Amt of Order Value is: ' +
                                                          FORMAT(AdvAmt) +
                                                          '\Recovered Adv Amount is: ' + FORMAT(ROUND(AdvPaymentAmt, 0.01, '>')));
                                                    IF CONFIRM('Do you want to Post with Authorization?\Do you want to Send for Authorization? ') THEN
                                                        SendForAuth('Post');
                                                    EXIT;
                                                END;
                                            END;
                                        END ELSE BEGIN
                                            IF "PT Post Auth Stutus" = "PT Post Auth Stutus"::"Sent For Auth" THEN
                                                ERROR('Authorization is in pending.Please take Authorization!')
                                            ELSE
                                                IF "PT Post Auth Stutus" = "PT Post Auth Stutus"::Rejected THEN
                                                    ERROR('Your permission for Posting is rejected!');
                                            IF "PT Post Auth Stutus" = "PT Post Auth Stutus"::" " THEN BEGIN
                                                MESSAGE('Payment terms has ' + FORMAT(PT."Percentage 1") + ' % Advance Payment! But Advance payment is not done!');
                                                IF CONFIRM('Do you want to Post with Authorization?\Do you want to Send for Authorization? ') THEN
                                                    SendForAuth('Post');
                                                EXIT;
                                            END;
                                        END;
                                    END;
                                    // End--Before Del Amt Checking
                                END;
                            END
                            ELSE
                                ERROR('Payment Terms Code ' + "Payment Terms Code" + ' does not exist in Payment Terms Table!');
                        END;
                    END;
                END;
                // End by Pranavi


                //Added by Pranavi on 02-Jan-2016 for CS Spares posting to H-Off problem clearence
                CustPostGrp := "Customer Posting Group";
                OrderNo := "No.";
                CustNo := "Sell-to Customer No.";
                PostingDt := "Posting Date";
                ExteranlDoc := "External Document No.";
                //End by Pranavi on 02-Jan-2016
                //EFFEUPG>>

                /* IF ApprovalMgt.PrePostApprovalCheck(Rec,PurchaseHeader) THEN
                BEGIN
                  IF ApprovalMgt.TestSalesPrepayment(Rec) THEN
                    ERROR(STRSUBSTNO(Text001,"Document Type","No."))
                  ELSE
                  BEGIN
                    IF ApprovalMgt.TestSalesPayment(Rec) THEN
                      ERROR(STRSUBSTNO(Text002,"Document Type","No."))
                    ELSE
                      CODEUNIT.RUN(CODEUNIT::"Sales-Post (Yes/No)",Rec);
                  END;
                  End; */
            end;

            trigger OnAfterAction()
            begin
                //EFFEUPG<<

                // Added by Rakesh for adjust to CS
                IF "Sell-to Customer No." = 'CUST00536' THEN BEGIN
                    IF CONFIRM('Do want to move the items from H-OFF to CS ?') = FALSE THEN
                        EXIT;

                    //AdjustforCS;  //commented by pranavi on 08-jan-2016
                    AdjustforCS1; //added by pranavi on 08-jan-2016
                                  // Mail code
                    Mail_From := 'erp@efftronics.com';
                    Mail_To := 'padmaja@efftronics.com,srivalli@efftronics.com,pmurali@efftronics.com,madhavip@efftronics.com,sales@efftronics.com,erp@efftronics.com,controlroom@efftronics.com';
                    Mail_Subject := 'ERP - CS Spares Invoiced';
                    Mail_Body := 'The following Items have been billed and moved from H-OFF to CS location';
                    Mail_Body += '<html><body><br/><br/><table border=1><col width="350"><col width="90"><tr><th>Item</th><th>Quantity</th></tr>';

                    SSH.RESET;

                    /* SSH.SETRANGE(SSH."Sell-to Customer No.", "Sell-to Customer No.");
                    SSH.SETRANGE(SSH."Posting Date", "Posting Date");
                    SSH.SETRANGE(SSH."Order No.", "No.");
                    SSH.SETRANGE(SSH."External Document No.", "External Document No."); */
                    // Commented by Pranavi on 02-Jan-2016 for CS Spares posting to H-Off problem clearence
                    SSH.SETRANGE(SSH."Sell-to Customer No.", CustNo);
                    SSH.SETRANGE(SSH."Posting Date", PostingDt);
                    SSH.SETRANGE(SSH."Order No.", OrderNo);
                    SSH.SETRANGE(SSH."External Document No.", ExteranlDoc);  //Added by Pranavi on 02-Jan-2016 for CS Spares posting to H-Off problem clearence
                    IF SSH.FINDFIRST THEN BEGIN
                        SSL.RESET;
                        SSL.SETRANGE(SSL."Document No.", SSH."No.");
                        SSL.SETFILTER(SSL.Quantity, '>%1', 0);
                        IF SSL.FINDSET THEN
                            REPEAT
                                Mail_Body += '<tr><td>' + SSL.Description + '</td><td align=right>' + FORMAT(SSL."Quantity Invoiced") + '</td></tr>';
                            UNTIL SSL.NEXT = 0;
                    END;
                    Mail_Body += '</table><br/><br/><br/>*********** This is auto generated mail from ERP ************</body></html>';
                    SMTP_MAIL.CreateMessage('ERP', Mail_From, Mail_To, Mail_Subject, Mail_Body, TRUE);
                    SMTP_MAIL.Send;

                END
                ELSE BEGIN
                    // Mail code
                    user.RESET;
                    user.SETFILTER(user.EmployeeID, "Salesperson Code");
                    IF user.FINDFIRST THEN BEGIN
                        Mail_To := user.MailID;
                    END;

                    verticalInfo.RESET;
                    verticalInfo.SETFILTER(verticalInfo.Product, Product);
                    IF verticalInfo.FINDFIRST THEN BEGIN
                        Mail_To := Mail_To + ',' + verticalInfo."Vertical Head E_mail";
                    END;

                    Mail_From := 'noreply@efftronics.com';
                    Mail_To += ',dispatch@efftronics.com,pmsubhani@efftronics.com,padmaja@efftronics.com,cuspm@efftronics.com,erp@efftronics.com,madhavip@efftronics.com,controlroom@efftronics.com';
                    Mail_Subject := 'ERP - Sale Order: ' + "No." + ' was invoiced to the customer: ' + "Sell-to Customer Name";
                    Mail_Body := '';
                    SMTP_MAIL.CreateMessage('ERP', Mail_From, Mail_To, Mail_Subject, Mail_Body, TRUE);

                    SMTP_MAIL.AppendBody('<html><body><b>Sale Order No: </b>' + "No." + '<br/><b>Customer Name: </b>' + "Sell-to Customer Name" + '<br/><br/><table border=1><col width="350"><col width="90"><tr><th>Item</th><th>Quantity</th></tr>');

                    SSH.RESET;
                    SSH.SETRANGE(SSH."Sell-to Customer No.", "Sell-to Customer No.");
                    SSH.SETRANGE(SSH."Posting Date", "Posting Date");
                    SSH.SETRANGE(SSH."Order No.", "No.");
                    SSH.SETRANGE(SSH."External Document No.", "External Document No.");
                    IF SSH.FINDFIRST THEN BEGIN
                        SSL.RESET;
                        SSL.SETRANGE(SSL."Document No.", SSH."No.");
                        SSL.SETFILTER(SSL.Quantity, '>%1', 0);
                        IF SSL.FINDSET THEN
                            REPEAT
                                SMTP_MAIL.AppendBody('<tr><td>' + SSL.Description + '</td><td align=right>' + FORMAT(SSL."Quantity Invoiced") + '</td></tr>');
                            UNTIL SSL.NEXT = 0;
                    END;
                    SMTP_MAIL.AppendBody('</table><br/><br/><br/>*********** This is auto generated mail from ERP ************</body></html>');
                    //SMTP_MAIL.Send;

                END;

                // Added by Pranavi on 08-09-2016 for payment terms integration
                IF (CustPostGrp IN ['PRIVATE', 'OTHERS', 'EXPORT']) AND NOT (CustNo IN ['CUST00536', 'CUST01164']) AND (Order_After_CF_Integration = TRUE) THEN
                    SQLInt.PvtSaleOrdrInvoiceCreationinCF(OrderNo, PostingDt, ExteranlDoc);
                // End by Pranavi

                // end by Rakesh
                //Added by Pranavi on 30 Dec 15 for duplicate external doc no
                SHNew.RESET;
                SHNew.SETRANGE(SHNew."No.", OrderNo);
                IF SHNew.FINDFIRST THEN BEGIN
                    InvoiceNos := 0;
                    SHNew."External Document No." := '';
                    SHNew.MODIFY;
                END;
                //End by Pranavi
            end;
        }
        addafter(PreviewPosting)
        {
            action(Test)
            {
                Visible = testvisible;
                trigger OnAction()
                var
                    SLn: Record "Sales Line";
                    TS: Record "Tracking Specification";
                    ILEs: Record "Item Ledger Entry";
                    RPOs: Record "Production Order";
                    REs: Record "Reservation Entry";
                begin
                    MESSAGE('Hi');
                    //AdjustforCS1; //added by pranavi on 08-jan-2016
                    // Added by Pranavi on 08-09-2016 for payment terms integration
                    IF USERID IN ['EFFTRONICS\PRANAVI'] THEN BEGIN
                        CustPostGrp := 'PRIVATE';
                        CustNo := 'CUST00822';
                        OrderNo := 'EFF/SAL/16-17/0278';
                        PostingDt := TODAY() - 2;
                        ExteranlDoc := 'IN_TEST';//'IN_TEST';//'TEST123';
                        IF (CustPostGrp IN ['PRIVATE', 'OTHERS']) AND NOT (CustNo IN ['CUST00536', 'CUST01164']) THEN
                            SQLInt.PvtSaleOrdrInvoiceCreationinCF(OrderNo, PostingDt, ExteranlDoc);
                    END;
                    // End by Pranavi
                end;
            }
        }
        addafter("Post and Print Prepmt. Cr. Mem&o")
        {
            action("Invoice Preview")
            {
                Caption = 'Invoice Preview';
                Image = PreviewChecks;
                trigger OnAction()
                begin
                    "sales header".SETRANGE("sales header"."No.", "No.");
                    REPORT.RUN(50114, TRUE, FALSE, "sales header");
                end;
            }
            action("Dispatch Note")
            {
                Caption = 'Dispatch Note';
                Image = OneNote;
                trigger OnAction()
                begin
                    "sales header".SETRANGE("sales header"."No.", "No.");
                    //REPORT.RUN(90000,TRUE,FALSE,SalesHeader);
                    REPORT.RUN(50107, TRUE, FALSE, "sales header");
                end;
            }
        }
        addafter("Pick Instruction")
        {
            action(Refresh)
            {
                Caption = 'Refresh';
                Promoted = true;
                Image = RefreshLines;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    IF ISCLEAR(SQLConnection) THEN
                        CREATE(SQLConnection, FALSE, TRUE); //Rev01

                    IF ISCLEAR(RecordSet) THEN
                        CREATE(RecordSet, FALSE, TRUE); //Rev01

                    IF ConnectionOpen <> 1 THEN BEGIN
                        SQLConnection.ConnectionString := 'DSN=salinvoiceuser;UID=salinvoiceuser;PASSWORD=salinvoiceuser;SERVER=oracle_80;';
                        SQLConnection.Open;
                        SQLConnection.BeginTrans;
                        ConnectionOpen := 1;
                    END;
                    SQLQuery := 'select orderno,salpersonname from authorisedorders where (status=1)and authorisedorders.orderno=''' + FORMAT("No.") + ''''
                    ;
                    //MESSAGE(SQLQuery);
                    RecordSet := SQLConnection.Execute(SQLQuery, RowCount);

                    IF RowCount < -1 THEN
                        ERROR('Request not yet authorized to Refresh the data')
                    ELSE BEGIN
                        IF NOT ((RecordSet.BOF) OR (RecordSet.EOF)) THEN
                            RecordSet.MoveFirst;

                        WHILE NOT RecordSet.EOF DO BEGIN

                            IF ("No." = FORMAT(RecordSet.Fields.Item('orderno').Value)) THEN BEGIN
                                IF "No." <> '' THEN BEGIN
                                    //Authorized:=TRUE;
                                    "Document Position" := "Document Position"::Sales;
                                    MODIFY;
                                END;
                            END;
                            RecordSet.MoveNext;
                        END;
                    END;
                    MESSAGE('Data Refreshed');
                end;
            }
            action("Forward to OMS")
            {
                Caption = 'Forward to OMS';
                Promoted = true;
                Image = Export;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    SalesLine: Record "Sales Line";
                    OMSIntegrateCode: Codeunit SQLIntegration;
                begin
                    //IF Status = Status::Released THEN //COMMENTED BY SUJANI FOR OMS PURPOSE
                    BEGIN
                        // MESSAGE('Today OMS Integration Stopped');
                        //MESSAGE("No.");
                        SalesLine.SETRANGE("Document Type", "Document Type");
                        SalesLine.SETRANGE("Document No.", "No.");
                        // SalesLine.SETRANGE(Type,SalesLine.Type::Item);
                        IF SalesLine.FINDFIRST THEN BEGIN
                            // MESSAGE('Enter in OMS Part');      OR ("Document Type"="Document Type"::"Blanket Order")
                            IF "Document Type" = "Document Type"::Order THEN BEGIN
                                IF (OMSIntegrateCode.SaleOrderCreationinOMS(Rec)) = FALSE THEN BEGIN
                                    MESSAGE('Error occured in OMS integration and record is not posted');
                                END;
                            END;
                        END;
                    END;
                    //ELSE ERROR('Order in Open State'); // COMMENTED BY SUJANI FOR OMS PURPOSE
                    forwordomsVisible := FALSE
                end;
            }
        }
        addafter("Print Confirmation")
        {
            action(PwerBI)
            {
                Caption = 'PwerBI';
                Promoted = false;
                //PromotedIsBig = false;
                trigger OnAction()
                begin
                    //HYPERLINK(PbiLink);
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
        SL1: Record "Sales Line";
        CUS: Record Customer;
        InvoiceNos: Option;
        SIH: Record "Sales Invoice Header";
        username: Text[30];
        "Assessee Code": Code[10];

        PROCEDURE "---B2B---"();
    BEGIN
    
    PROCEDURE DocumentPosition();
    BEGIN
      
      /* IF "Document Position" = "Document Position" :: Design THEN
        CurrPage.EDITABLE := FALSE
      ELSE
        CurrPage.EDITABLE := TRUE; */
      
    END;

   
    PROCEDURE CreateOrders(Qtyparam: Decimal) OrdersCreated : Boolean;
    VAR
      Item: Record Item;
      SalesLine : Record "Sales Line";
      ProdOrderFromSale : Codeunit "Create Prod. Order from Sale";
    BEGIN
      IF NOT SalesPlanLine.FINDSET THEN
        EXIT;

      REPEAT
        SalesLine.GET(
          SalesLine."Document Type"::Order,
          SalesPlanLine."Sales Order No.",
          SalesPlanLine."Sales Order Line No.");
          //SalesLine.TESTFIELD("Shipment Date");
        SalesLine.CALCFIELDS("Reserved Qty. (Base)");
        //IF SalesLine."Outstanding Qty. (Base)" > SalesLine."Reserved Qty. (Base)" THEN BEGIN
          Item.GET(SalesLine."No.");
          IF Item."Replenishment System" = Item."Replenishment System"::"Prod. Order" THEN BEGIN
            OrdersCreated := TRUE;
            IF AssignDateGVar THEN
              ProdOrderFromSale.ProdStartDate(TRUE);
            ProdOrderFromSale.CreateProdOrder2(
              SalesLine,NewStatus::Released,NewOrderType::ItemOrder,1);
            IF NewOrderType = NewOrderType::ProjectOrder THEN
              EXIT;
          END;
        //END;
      UNTIL (SalesPlanLine.NEXT = 0);
    END;

   
    PROCEDURE calcamt();
    BEGIN
      "Sale Order Total Amount":=0;
      SalesLine.SETRANGE(SalesLine."Document No.","No.");
      IF SalesLine.FINDSET THEN
       REPEAT
        "Sale Order Total Amount"+=SalesLine."Line Amount"+SalesLine."Excise Amount"+SalesLine."Tax Amount";
       UNTIL SalesLine.NEXT=0;
       MODIFY;
    END;

   
    PROCEDURE ChooseInvoice();
    VAR
      temp : Integer;
    BEGIN
      temp:=0;
      "sales header".RESET;
      "sales header".SETFILTER("sales header"."External Document No.",'<>%1',' ');
      IF "sales header".FINDSET THEN
      REPEAT
      "sales header"."External Document No.":='';
      "sales header".MODIFY;
      UNTIL "sales header".NEXT=0;

      CASE InvoiceNos OF
      1:
      BEGIN

        salhed.SETFILTER(salhed."Document Type",'Order');
        salhed.SETFILTER(salhed."External Document No.",'<>%1','');
        IF salhed.COUNT>0 THEN
        IF salhed.FINDSET THEN
        REPEAT
        ERROR(salhed."No."+'  Sale Have the Invoice Number');
        UNTIL salhed.NEXT=0;

      //ERROR('Invoice Number Already Assign to Another Sale Order');
        //POSTEDINVOICE.RESET;
        POSTEDINVOICE.SETCURRENTKEY(POSTEDINVOICE."External Document No.");  //sreenivas modified this line
        POSTEDINVOICE.ASCENDING;      //this line too
        POSTEDINVOICE.SETRANGE(POSTEDINVOICE."Posting Date",(040113D),(033114D));
        POSTEDINVOICE.SETFILTER(POSTEDINVOICE."External Document No.",'0..999');
      //MESSAGE(FORMAT(POSTEDINVOICE.COUNT));
        IF POSTEDINVOICE.FINDLAST THEN
        BEGIN
        y:='0';
        y:=POSTEDINVOICE."External Document No.";
        temp:=1;
        END;
        IF temp=0 THEN
          "External Document No.":='001'
        ELSE
        "External Document No.":=INCSTR(y);
      //  UNTIL POSTEDINVOICE.NEXT = 0;
      //  "External Document No.":=INCSTR(y);
      //MESSAGE(FORMAT("External Document No."));
        MODIFY;
      END;

      2:
      BEGIN
        salhed.SETFILTER(salhed."Document Type",'Order');
        salhed.SETFILTER(salhed."External Document No.",'<>%1','');
        IF salhed.COUNT>0 THEN
        IF salhed.FINDSET THEN
        REPEAT
        ERROR(salhed."No."+'  Sale Have the Invoice Number');
        UNTIL salhed.NEXT=0;

        //ERROR('Invoice Number Already Assign to Another Sale Order');
        POSTEDINVOICE.SETCURRENTKEY(POSTEDINVOICE."External Document No.");  //sreenivas modified this line
        POSTEDINVOICE.ASCENDING;      //this line too
        POSTEDINVOICE.SETRANGE(POSTEDINVOICE."Posting Date",(040113D),(033114D));
        POSTEDINVOICE.SETFILTER(POSTEDINVOICE."External Document No.",'SI*');
        //MESSAGE(FORMAT(POSTEDINVOICE.COUNT));
        IF POSTEDINVOICE.FINDLAST THEN
        BEGIN
        y:='0';
        y:=POSTEDINVOICE."External Document No.";
        temp:=1;
        END;
        IF temp=0 THEN
          "External Document No.":='SI-001'
        ELSE
        "External Document No.":=INCSTR(y);

       /* IF POSTEDINVOICE.FINDLAST THEN
        REPEAT
        y:=POSTEDINVOICE."External Document No.";
        UNTIL POSTEDINVOICE.NEXT = 0;
        "External Document No.":=INCSTR(y); */
        //MESSAGE(FORMAT("External Document No."));
        MODIFY;

      END;
      3:
      BEGIN
        salhed.SETFILTER(salhed."Document Type",'Order');
        salhed.SETFILTER(salhed."External Document No.",'<>%1','');
        IF salhed.COUNT>0 THEN
        IF salhed.FINDSET THEN
        REPEAT
        ERROR(salhed."No."+'  Sale Have the Invoice Number');
        UNTIL salhed.NEXT=0;

        //ERROR('Invoice Number Already Assign to Another Sale Order');
        POSTEDINVOICE.SETCURRENTKEY(POSTEDINVOICE."External Document No.");  //sreenivas modified this line
        POSTEDINVOICE.ASCENDING;      //this line too
        POSTEDINVOICE.SETRANGE(POSTEDINVOICE."Posting Date",(040113D),(033114D));
        POSTEDINVOICE.SETFILTER(POSTEDINVOICE."External Document No.",'CI*');
        //MESSAGE(FORMAT(POSTEDINVOICE.COUNT));
        IF POSTEDINVOICE.FINDLAST THEN
        BEGIN
        y:='0';
        y:=POSTEDINVOICE."External Document No.";
        temp:=1;
        END;
        IF temp=0 THEN
          "External Document No.":='CI-001'
        ELSE
        "External Document No.":=INCSTR(y);

        /* IF POSTEDINVOICE.FINDLAST THEN
        REPEAT
        y:=POSTEDINVOICE."External Document No.";
        UNTIL POSTEDINVOICE.NEXT = 0;
        "External Document No.":=INCSTR(y); */
        //MESSAGE(FORMAT("External Document No."));
        MODIFY;

      END;
      4:
      BEGIN
        salhed.SETFILTER(salhed."Document Type",'Order');
        salhed.SETFILTER(salhed."External Document No.",'<>%1','');
        IF salhed.COUNT>0 THEN
        IF salhed.FINDSET THEN
        REPEAT
        ERROR(salhed."No."+'  Sale Have the Invoice Number');
        UNTIL salhed.NEXT=0;

        //ERROR('Invoice Number Already Assign to Another Sale Order');
        POSTEDINVOICE.SETCURRENTKEY(POSTEDINVOICE."External Document No.");  //sreenivas modified this line
        POSTEDINVOICE.ASCENDING;      //this line too
        POSTEDINVOICE.SETRANGE(POSTEDINVOICE."Posting Date",(040113D),(033114D));
        POSTEDINVOICE.SETFILTER(POSTEDINVOICE."External Document No.",'IN*');
        //MESSAGE(FORMAT(POSTEDINVOICE.COUNT));
        IF POSTEDINVOICE.FINDLAST THEN
        BEGIN
        y:='0';
        y:=POSTEDINVOICE."External Document No.";
        temp:=1;
        END;
        IF temp=0 THEN
          "External Document No.":='IN-001'
        ELSE
        "External Document No.":=INCSTR(y);

        {IF POSTEDINVOICE.FINDLAST THEN
        REPEAT
        y:=POSTEDINVOICE."External Document No.";
        UNTIL POSTEDINVOICE.NEXT = 0;
        "External Document No.":=INCSTR(y);}
        //MESSAGE(FORMAT("External Document No."));
        MODIFY;

      END;

      END;
    END;

    
    LOCAL PROCEDURE InstallationAmountCSOnAfterVal();
    BEGIN
        IF "Installation Amount(CS)">0 THEN
        InstallationAmountCSEditable := FALSE
        ELSE
        InstallationAmountCSEditable := TRUE;
    END;

   
    LOCAL PROCEDURE ServiceInvInvoiceNosOnPush();
    BEGIN
      //ChooseInvoice;
    END;

    
    LOCAL PROCEDURE TradingInvInvoiceNosOnPush();
    BEGIN
      //ChooseInvoice;
    END;

    
    LOCAL PROCEDURE InstInvInvoiceNosOnPush();
    BEGIN
      //ChooseInvoice;
    END;

   
    LOCAL PROCEDURE ExciseInvInvoiceNosOnPush();
    BEGIN
      //ChooseInvoice;
    END;

   
    LOCAL PROCEDURE InvoiceNosOnPush();
    BEGIN
      "External Document No.":='';
      MODIFY;
    END;

    
    LOCAL PROCEDURE NoOnFormat();
    BEGIN
      IF "SalOrd Des Approval"=TRUE THEN
      BEGIN
      "No.Emphasize" :=TRUE;
      END
      ELSE
      BEGIN
      "No.Emphasize" :=TRUE;
      END;
    END;

    
    LOCAL PROCEDURE InvoiceNosOnValidate();
    BEGIN
      InvoiceNosOnPush;
    END;

   
    LOCAL PROCEDURE ExciseInvInvoiceNosOnValidate();
    BEGIN
      ExciseInvInvoiceNosOnPush;
    END;

    
    LOCAL PROCEDURE ServiceInvInvoiceNosOnValidate();
    BEGIN
      ServiceInvInvoiceNosOnPush;
    END;

    
    LOCAL PROCEDURE TradingInvInvoiceNosOnValidate();
    BEGIN
      TradingInvInvoiceNosOnPush;
    END;

   
    LOCAL PROCEDURE InstInvInvoiceNosOnValidate();
    BEGIN
      InstInvInvoiceNosOnPush;
    END;

    
    PROCEDURE CustAttachments();
    VAR
      CustAttach : Record Attachments;
    BEGIN
      CustAttach.RESET;
      CustAttach.SETRANGE("Table ID",DATABASE::"Sales Header");
      CustAttach.SETRANGE("Document No.","No.");
      CustAttach.SETRANGE("Document Type","Document Type");

      PAGE.RUN(PAGE::"ESPL Attachments",CustAttach);
    END;

    
    PROCEDURE AdjustforCS();
    BEGIN
      SSH.RESET;
      
      /* SSH.SETRANGE(SSH."Sell-to Customer No.","Sell-to Customer No.");
      SSH.SETRANGE(SSH."Posting Date","Posting Date");
      SSH.SETRANGE(SSH."Order No.","No.");
      SSH.SETRANGE(SSH."External Document No.","External Document No."); */
       //Commented by Pranavi on 02-Jan-2016 for CS Spares posting to H-Off problem clearence
      SSH.SETRANGE(SSH."Sell-to Customer No.",CustNo);
      SSH.SETRANGE(SSH."Posting Date",PostingDt);
      SSH.SETRANGE(SSH."Order No.",OrderNo);
      SSH.SETRANGE(SSH."External Document No.",ExteranlDoc); //Added by Pranavi on 02-Jan-2016 for CS Spares posting to H-Off problem clearence
      IF SSH.FINDFIRST THEN
      BEGIN
        SSL.RESET;
        SSL.SETRANGE(SSL."Document No.",SSH."No.");
        SSL.SETFILTER(SSL.Quantity,'>%1',0);
        IF SSL.FINDSET THEN
        REPEAT
          ILE.RESET;
          ILE.SETFILTER(ILE."Document No.",SSL."Document No.");
          ILE.SETFILTER(ILE."Item No.",SSL."No.");
          IF ILE.FINDFIRST THEN
          REPEAT
            ILE2.RESET;
            ILE2.SETFILTER(ILE2."Item No.",ILE."Item No.");
            ILE2.SETFILTER(ILE2."Serial No.",ILE."Serial No.");
            ILE2.SETFILTER(ILE2."Lot No.",ILE."Lot No.");
            IF ILE2.COUNT=2 THEN
            BEGIN
              IF ILE2.FINDFIRST THEN
              BEGIN
                Item_Positive_Adjustment(ILE2."Item No.",ILE2."Serial No.",'H-OFF');
              END;
            END
            ELSE
              MESSAGE('The Item '+ILE."Item No."+' are already moved to CS location');
          UNTIL ILE.NEXT=0;

        UNTIL SSL.NEXT = 0;
      END
    END;

    
    PROCEDURE Item_Positive_Adjustment("Item No." : Code[20];"Serial No." : Code[20];"Location Code" : Code[10]);
    VAR
      "Item Journal Line" : Record "Item Journal Line";
      "Reservation Entry" : Record "Reservation Entry";
      "Reservation Entry1": Record "Reservation Entry";
      NoSeriesMgt : Codeunit NoSeriesManagement;
      "Item Ledger Entry" : Record "Item Ledger Entry";
    BEGIN
      //Deleted Var (Journal Line DimensionRecordTable356) B2B
      "Item Ledger Entry".RESET;
      "Item Ledger Entry".SETCURRENTKEY("Item Ledger Entry"."Item No.",
                                        "Item Ledger Entry"."Lot No.",
                                        "Item Ledger Entry"."Serial No.");
      "Item Ledger Entry".SETRANGE("Item Ledger Entry"."Item No.","Item No.");
      "Item Ledger Entry".SETRANGE("Item Ledger Entry"."Serial No.","Serial No.");
      "Item Ledger Entry".SETFILTER("Item Ledger Entry"."Remaining Quantity",'>%1',0);
      IF NOT "Item Ledger Entry".FIND('-') THEN
      BEGIN
        // INSERTING RECORD IN ITEM JOURNAL LINE
        "Item Journal Line".INIT;
        "Item Journal Line"."Journal Template Name":='ITEM';
        "Item Journal Line"."Journal Batch Name":='POS-CS-SIG';
        "Item Journal Line"."Entry Type":="Item Journal Line"."Entry Type"::"Positive Adjmt.";
        "Item Journal Line"."Line No.":=10000;
        "Item Journal Line"."Source Code":='ITEMJNL';
        //"Item Journal Line"."Serial No.":="Serial No.";
        //"Item Journal Line"."Lot No.":=ICNNO(TODAY)+'SA01';
        "Item Journal Line"."Document No.":=NoSeriesMgt.GetNextNo('POS-ADJ-CS',TODAY,FALSE);



        "Item Journal Line".VALIDATE("Item Journal Line"."Item No.","Item No.");
        "Item Journal Line".VALIDATE(Quantity,1);
        "Item Journal Line".VALIDATE("Location Code",'CS');
        "Item Journal Line".VALIDATE("Shortcut Dimension 2 Code","Location Code");
        "Item Journal Line"."User ID":=USERID;
        "Item Journal Line"."Document Date":=TODAY;
        "Item Journal Line".INSERT;


        // INSERTING RECORD IN RESERVATION ENTRY
        "Reservation Entry".INIT;
        IF "Reservation Entry1".FIND('+') THEN
        "Reservation Entry"."Entry No.":="Reservation Entry1"."Entry No."+1;
        "Reservation Entry".VALIDATE("Item No.","Item No.");
        "Reservation Entry".VALIDATE("Location Code",'CS');
        "Reservation Entry".VALIDATE("Quantity (Base)",1);
        "Reservation Entry"."Reservation Status":="Reservation Entry"."Reservation Status"::Prospect;
        "Reservation Entry"."Creation Date":=TODAY;
        "Reservation Entry"."Source Type":=83;
        "Reservation Entry"."Source Subtype":=2;
        "Reservation Entry"."Source ID":='ITEM';
        "Reservation Entry"."Source Batch Name":='POS-CS-SIG';
        "Reservation Entry"."Source Ref. No.":=10000;
        "Reservation Entry"."Created By":='SUPER';
        "Reservation Entry".Positive:=TRUE;
        "Reservation Entry"."Expected Receipt Date":=TODAY;
        "Reservation Entry".VALIDATE("Serial No.","Serial No.");
        "Reservation Entry"."Lot No.":=ICNNO(TODAY)+'SA01';
        //"Reservation Entry".Quantity:=1;
        "Reservation Entry".INSERT;


        // INSERTING JOURNAL LINE DIMENSION
        /* "Journal Line Dimension".INIT;
        "Journal Line Dimension"."Table ID":=83;
        "Journal Line Dimension"."Journal Template Name":='ITEM';
        "Journal Line Dimension"."Journal Batch Name":='POS-CS-SIG';
        "Journal Line Dimension"."Journal Line No.":=10000;
        "Journal Line Dimension"."Dimension Code":='LOCATIONS';
        "Journal Line Dimension"."Dimension Value Code":="Location Code";
        "Journal Line Dimension".INSERT; */
      END ELSE
      ERROR(' ITEM WAS ALLREADY AVAILABLE IN INVENTORY');


      CODEUNIT.RUN(CODEUNIT::"Item Jnl.-Post","Item Journal Line");
    END;

    
    PROCEDURE ICNNO(DT: Date) ICN : Code[10];
    VAR
      Dat : Text[30];
      Mon: Text[30];
      Year: Text[30];
    BEGIN
      IF DATE2DMY(DT,1) < 10 THEN
        Dat:= '0'+FORMAT(DATE2DMY(DT,1))
      ELSE Dat:= FORMAT(DATE2DMY(DT,1));

      IF DATE2DMY(DT,2) < 10 THEN
        Mon:= '0'+FORMAT(DATE2DMY(DT,2))
      ELSE Mon:= FORMAT(DATE2DMY(DT,2));

      //IF DATE2DMY(DT,2) < 10 THEN
        Year:= COPYSTR(FORMAT(DATE2DMY(DT,3)),3,2);
      ICN:=Dat+Mon+Year;
      EXIT(ICN);
    END;

    
    PROCEDURE TestRPOStatus();
    VAR
      SLn : Record "Sales Line";
      ILEs : Record "Item Ledger Entry";
      RPOs: Record "Production Order";
      REs: Record "Reservation Entry";
      Lot : Text;
      Itm: Record Item;
    BEGIN
      //Added by Pranavi on 28-10-2015 for not allowing to post if RPO is not finished
      IF "No." <> 'EFF/SAL/15-16/0112' THEN BEGIN
      SLn.RESET;
      SLn.SETFILTER(SLn."Document Type",'%1',"Document Type");
      SLn.SETFILTER(SLn.Type,'%1',SLn.Type::Item);
      SLn.SETFILTER(SLn."Document No.","No.");
      SLn.SETFILTER(SLn."Qty. to Ship",'>%1',0);
      IF SLn.FINDSET THEN
      REPEAT
        Itm.GET(SLn."No.");
        REs.RESET;
        REs.SETFILTER(REs."Item No.",SLn."No.");
        REs.SETFILTER(REs."Source ID","No.");
        REs.SETFILTER(REs."Source Ref. No.",'%1',SLn."Line No.");
        IF REs.FINDSET THEN
        REPEAT
          ILEs.RESET;
          ILEs.SETFILTER(ILEs."Entry Type",'%1',ILEs."Entry Type"::Output);
          ILEs.SETFILTER(ILEs."Item No.",SLn."No.");
          ILEs.SETFILTER(ILEs."Serial No.",REs."Serial No.");
          ILEs.SETFILTER(ILEs."Lot No.",REs."Lot No.");
          IF ILEs.FINDFIRST THEN
          BEGIN
            Lot := '';
            IF ILEs."Lot No." <> '' THEN
              Lot := ' Lot No.: '+ILEs."Lot No.";
            RPOs.RESET;
            RPOs.SETFILTER(RPOs.Status,'%1',RPOs.Status::Released);
            RPOs.SETFILTER(RPOs."No.",ILEs."Order No.");
           IF (RPOs.FINDFIRST) AND (Itm."Product Group Code" <> 'CPCB') THEN
             ERROR('Released Prod Order '+ILEs."Order No."+' is not Finished for Item '+ILEs."Item No."+'\Serial No.: '+ILEs."Serial No."+Lot);
          END;
        UNTIL REs.NEXT=0;
      UNTIL SLn.NEXT=0;
      //End by Pranavi
      END;
    END;

    PROCEDURE AdjustforCS1();
    BEGIN
      SSH.RESET;
      SSH.SETRANGE(SSH."Sell-to Customer No.",CustNo);
      SSH.SETRANGE(SSH."Posting Date",PostingDt);
      SSH.SETRANGE(SSH."Order No.",OrderNo);
      SSH.SETRANGE(SSH."External Document No.",ExteranlDoc); //Added by Pranavi on 02-Jan-2016 for CS Spares posting to H-Off problem clearence
      IF SSH.FINDFIRST THEN
      BEGIN
        SSL.RESET;
        SSL.SETRANGE(SSL."Document No.",SSH."No.");
        SSL.SETFILTER(SSL.Quantity,'>%1',0);
        IF SSL.FINDSET THEN
        REPEAT
          SerialNos:='';
          ILE.RESET;
          ILE.SETFILTER(ILE."Document No.",SSL."Document No.");
          ILE.SETFILTER(ILE."Item No.",SSL."No.");
          IF ILE.FINDFIRST THEN
          REPEAT
            ILE2.RESET;
            ILE2.SETFILTER(ILE2."Item No.",ILE."Item No.");
            ILE2.SETFILTER(ILE2."Serial No.",ILE."Serial No.");
            ILE2.SETFILTER(ILE2."Lot No.",ILE."Lot No.");
            ILE2.SETRANGE(ILE2."Posting Date",ILE."Posting Date");
            ILE2.SETRANGE(ILE2."Entry Type",ILE2."Entry Type"::"Positive Adjmt.");
            ILE2.SETRANGE(ILE2."Location Code",'CS');
            ILE2.SETRANGE(ILE2."Global Dimension 2 Code",'H-OFF');
            // IF NOT (ILE2.COUNT=2) THEN
            IF ILE2.FINDFIRST THEN
              MESSAGE('The Item '+ILE."Item No."+' are already moved to CS location')
            ELSE
            BEGIN
              IF SerialNos = '' THEN  SerialNos:=ILE."Serial No."
              ELSE  SerialNos:=SerialNos+'|'+ILE."Serial No.";
            END;
          UNTIL ILE.NEXT=0;
          Item_Positive_Adjustment1(ILE."Item No.",SerialNos,'H-OFF',SSL."Document No.",SSL.Quantity);
        UNTIL SSL.NEXT = 0;
      END
    END;

    
    PROCEDURE Item_Positive_Adjustment1("Item No." : Code[20];"Serial No." : Text;"Location Code" : Code[10];DocumentNo : Code[30];ItmQty : Decimal);
    VAR
      "Item Journal Line": Record "Item Journal Line";
      "Reservation Entry" : Record "Reservation Entry";
      "Reservation Entry1" : Record "Reservation Entry";
      NoSeriesMgt : Codeunit NoSeriesManagement;
      "Item Ledger Entry": Record "Item Ledger Entry";
    BEGIN
      //Deleted Var (Journal Line DimensionRecordTable356) B2B
      "Item Ledger Entry".RESET;
      "Item Ledger Entry".SETCURRENTKEY("Item Ledger Entry"."Item No.",
                                        "Item Ledger Entry"."Lot No.",
                                        "Item Ledger Entry"."Serial No.");
      "Item Ledger Entry".SETRANGE("Item Ledger Entry"."Item No.","Item No.");
      "Item Ledger Entry".SETFILTER("Item Ledger Entry"."Serial No.","Serial No.");
      "Item Ledger Entry".SETFILTER("Item Ledger Entry"."Remaining Quantity",'>%1',0);
      IF NOT "Item Ledger Entry".FIND('-') THEN
      BEGIN
        // INSERTING RECORD IN ITEM JOURNAL LINE
        "Item Journal Line".INIT;
        "Item Journal Line"."Journal Template Name":='ITEM';
        "Item Journal Line"."Journal Batch Name":='POS-CS-SIG';
        "Item Journal Line"."Entry Type":="Item Journal Line"."Entry Type"::"Positive Adjmt.";
        "Item Journal Line"."Line No.":=10000;
        "Item Journal Line"."Source Code":='ITEMJNL';
        //"Item Journal Line"."Serial No.":="Serial No.";
        //"Item Journal Line"."Lot No.":=ICNNO(TODAY)+'SA01';
        "Item Journal Line"."Document No.":=NoSeriesMgt.GetNextNo('POS-ADJ-CS',TODAY,FALSE);



        "Item Journal Line".VALIDATE("Item Journal Line"."Item No.","Item No.");
        "Item Journal Line".VALIDATE(Quantity,ItmQty);
        "Item Journal Line".VALIDATE("Location Code",'CS');
        "Item Journal Line".VALIDATE("Shortcut Dimension 2 Code","Location Code");
        "Item Journal Line"."User ID":=USERID;
        "Item Journal Line"."Document Date":=TODAY;
        "Item Journal Line".INSERT;


        // INSERTING RECORD IN RESERVATION ENTRY
        ILE1.RESET;
        ILE1.SETFILTER(ILE1."Document No.",DocumentNo);
        ILE1.SETFILTER(ILE1."Item No.","Item No.");
        IF ILE1.FINDFIRST THEN
        REPEAT
          ILE21.RESET;
          ILE21.SETFILTER(ILE21."Item No.",ILE1."Item No.");
          ILE21.SETFILTER(ILE21."Serial No.",ILE1."Serial No.");
          ILE21.SETFILTER(ILE21."Lot No.",ILE1."Lot No.");
          ILE21.SETRANGE(ILE21."Posting Date",ILE1."Posting Date");
          ILE21.SETRANGE(ILE21."Entry Type",ILE21."Entry Type"::"Positive Adjmt.");
          ILE21.SETRANGE(ILE21."Location Code",'CS');
          ILE21.SETRANGE(ILE21."Global Dimension 2 Code",'H-OFF');
          // IF NOT (ILE2.COUNT=2) THEN
          IF ILE21.FINDFIRST THEN
            MESSAGE('The Item '+ILE1."Item No."+' are already moved to CS location')
          ELSE
          BEGIN
            "Reservation Entry".INIT;
            IF "Reservation Entry1".FIND('+') THEN
            "Reservation Entry"."Entry No.":="Reservation Entry1"."Entry No."+1;
            "Reservation Entry".VALIDATE("Item No.","Item No.");
            "Reservation Entry".VALIDATE("Location Code",'CS');
            "Reservation Entry".VALIDATE("Quantity (Base)",1);
            "Reservation Entry"."Reservation Status":="Reservation Entry"."Reservation Status"::Prospect;
            "Reservation Entry"."Creation Date":=TODAY;
            "Reservation Entry"."Source Type":=83;
            "Reservation Entry"."Source Subtype":=2;
            "Reservation Entry"."Source ID":='ITEM';
            "Reservation Entry"."Source Batch Name":='POS-CS-SIG';
            "Reservation Entry"."Source Ref. No.":=10000;
            "Reservation Entry"."Created By":='SUPER';
            "Reservation Entry".Positive:=TRUE;
            "Reservation Entry"."Expected Receipt Date":=TODAY;
            "Reservation Entry".VALIDATE("Serial No.",ILE1."Serial No.");
            "Reservation Entry"."Lot No.":=ICNNO(TODAY)+'SA01';
            //"Reservation Entry".Quantity:=1;
            "Reservation Entry".INSERT;
          END;
        UNTIL ILE1.NEXT=0;


         // INSERTING JOURNAL LINE DIMENSION
        /* "Journal Line Dimension".INIT;
        "Journal Line Dimension"."Table ID":=83;
        "Journal Line Dimension"."Journal Template Name":='ITEM';
        "Journal Line Dimension"."Journal Batch Name":='POS-CS-SIG';
        "Journal Line Dimension"."Journal Line No.":=10000;
        "Journal Line Dimension"."Dimension Code":='LOCATIONS';
        "Journal Line Dimension"."Dimension Value Code":="Location Code";
        "Journal Line Dimension".INSERT; */
        
      END ELSE
      ERROR(' ITEM WAS ALLREADY AVAILABLE IN INVENTORY');


      CODEUNIT.RUN(CODEUNIT::"Item Jnl.-Post","Item Journal Line");
    END;

    
    PROCEDURE SendForAuth(TypeFlag : Code[10]);
    VAR
      Body@1102152004 : Text;
      Mail_From : Text[250];
      Mail_To : Text[250];
      Mail: Codeunit Mail;
      Subject : Text[250];
      SMTP_MAIL: Codeunit "SMTP Mail";
      AuthorizedID: Text[50];
      ReqUserGRec : Record User;
      AuthUserGRec : Record User;
      PT : Record "Payment Terms";
      PT_Name : Text[100];
      Auth_User: Text[50];
      Req_User : Text[50];
      SP : Record "Salesperson/Purchaser";
      Req_Person_Id: Code[10];
    BEGIN
      Body:='';
      Mail_From:='';
      Mail_To:='';
      Req_Person_Id:='';
      ReqUserGRec.RESET;
      ReqUserGRec.SETRANGE(ReqUserGRec."User Name",USERID);
      IF ReqUserGRec.FINDFIRST THEN
      BEGIN
        Req_User:=ReqUserGRec."User Name";
        Req_Person_Id := ReqUserGRec.EmployeeID;
        IF ReqUserGRec.MailID <> '' THEN
          Mail_From := ReqUserGRec.MailID
        ELSE Mail_From := 'erp@efftronics.com';
      END ELSE Mail_From := 'erp@efftronics.com';
      Req_User := COPYSTR(USERID,12,STRLEN(USERID));
      
      /* IF COPYSTR("No.",14,2) IN['/L','/T'] THEN
      BEGIN
        Auth_User := 'VIJAYMOHAN. CHITTINENI';
        Mail_To := 'cvmohan@effe.in,erp@efftronics.com';
      END
      ELSE BEGIN
        AuthUserGRec.RESET;
        AuthUserGRec.SETRANGE(AuthUserGRec.EmployeeID,"Salesperson Code");
        IF AuthUserGRec.FINDFIRST THEN
        BEGIN
          Auth_User := AuthUserGRec."Full Name";
          IF AuthUserGRec.MailID <> '' THEN
          BEGIN
            Mail_To := AuthUserGRec.MailID+',erp@efftronics.com';
          END ELSE Mail_To := 'erp@efftronics.com';
        END ELSE Mail_To := 'erp@efftronics.com';
      END; */
      
      Auth_User := 'Murali Krishna M';
      Mail_To := 'mk@effe.in,erp@efftronics.com';
      PT.RESET;
      PT.SETRANGE(PT.Code,"Payment Terms Code");
      IF PT.FINDFIRST THEN
        PT_Name := PT.Description;
      IF TypeFlag IN['Release','RELEASE'] THEN
        Subject:='ERP-Request for Authorisation for Order Release without Advance Payment for '+FORMAT("No.")+'-'+FORMAT("Sell-to Customer Name")
      ELSE
        Subject:='ERP-Request for Authorisation for Billing Order without Advance Payment for '+FORMAT("No.")+'-'+FORMAT("Sell-to Customer Name");
      Body:='<html><head><style> divone{background-color: white; width: 700px; padding: 20px; border-style:solid ; border-color:#666699;  margin: 20px;} </style></head>';
      Body+='<body><div style="border-color:#666699;  margin: 20px; border-width:15px;   border-style:solid; padding: 20px; width: 600px;"><label><font size="6">Customer Details</font></label>';
      Body+='<hr style=solid; color= #3333CC>';
      Body+='<table border="1" style="border-collapse:collapse; width:100%; font-size:10pt;">';
      Body+='<tr><td>Sale Order</td><td>'+"No."+'</td></tr><br>';
      Body+='<tr><td>Customer</td><td>'+"Sell-to Customer Name"+'</td></tr><br>';
      Body+='<tr><td>Order Value</td><td>'+FORMAT("Sale Order Total Amount")+'</td></tr><br>';
      Body+='<tr><td>Payment Term</td><td>'+"Payment Terms Code"+':- '+PT_Name+'</td></tr><br>';
      SP.RESET;
      SP.SETRANGE(SP.Code,"Salesperson Code");
      IF SP.FINDFIRST THEN
        Body+='<tr><td>Sales Executive</td><td>'+SP.Name+'</td></tr>'
      ELSE  Body+='<tr><td>Sales Executive</td><td>'+"Salesperson Code"+'</td></tr>';
      Body+='<tr><td>Customer Type</td><td>'+"Customer Posting Group"+'</td></tr>';

      Body+='<tr><td bgcolor="green">';
      Body+='<a Href="http://app.efftronics.org:8567/erp_reports/AdvancePaymentAuth.aspx?ORDERNO='+FORMAT("No.")+'&CUSTNAME='+FORMAT("Sell-to Customer Name");
      Body+='&AUTHPERSON='+FORMAT(Auth_User);
      Body+='&REQPERSON='+FORMAT(Req_User);
      Body+='&REQPERSONMAIL='+Mail_From;
      Body+='&REQID='+Req_Person_Id;
      IF TypeFlag IN['Release','RELEASE'] THEN
        Body+='&AUTHSTATUS=1"target="_blank">'
      ELSE Body+='&AUTHSTATUS=3"target="_blank">';
      Body+='<font face="arial" color="#ffffff">ACCEPT</font></a>';

      Body+='</td><td bgcolor="red">';
      Body+='<a Href="http://app.efftronics.org:8567/erp_reports/AdvancePaymentAuth.aspx?CUSTNO='+FORMAT("No.")+'&CUSTNAME='+FORMAT("Sell-to Customer Name");
      Body+='&AUTHPERSON='+FORMAT(Auth_User);
      Body+='&REQPERSON='+FORMAT(Req_User);
      Body+='&REQPERSONMAIL='+Mail_From;
      Body+='&REQID='+Req_Person_Id;
      IF TypeFlag IN['Release','RELEASE'] THEN
        Body+='&AUTHSTATUS=0"target="_blank">'
      ELSE Body+='&AUTHSTATUS=2"target="_blank">';
      Body+='<font face="arial" color="#ffffff">REJECT</font></a></td></tr>';

      Body+='</table><br>';
      Body+='<br><p align = "center">:: Note: Auto Generated mail from ERP</b> :: </b></P></div></body></html>';
      //Mail_From:='pranavi@efftronics.com';
      //Mail_To:='pranavi@efftronics.com';
      SMTP_MAIL.CreateMessage('ERP',Mail_From,Mail_To,Subject,Body,TRUE);
      //Added By Vishnu Priya on 26-07-2019 as per MD Instruction
      SMTP_MAIL.AddCC('ceo@efftronics.com');
      SMTP_MAIL.Send;
      MESSAGE(TypeFlag);
      IF TypeFlag IN['Release','RELEASE'] THEN
        "PT Release Auth Stutus" := "PT Release Auth Stutus"::"Sent For Auth"
      ELSE  "PT Post Auth Stutus" := "PT Post Auth Stutus"::"Sent For Auth";
      MODIFY;

      MESSAGE('Authorization Mail Has been Sent!');
    END;

   
    LOCAL PROCEDURE Modifications_mail();
    BEGIN
        //added by vishnu Priya for modifications Notifications purpose on 06-10-2018.
        "sales header".RESET;
        SHA.RESET;
        SAL.RESET;
        SHA.SETCURRENTKEY(SHA."Document Type",SHA."No.",SHA."Doc. No. Occurrence",SHA."Version No.");
        SAL.SETCURRENTKEY(SAL."Document Type",SAL."Document No.",SAL."Doc. No. Occurrence",SAL."Version No.",SAL."Line No.");
        SHA.SETFILTER("No.","sales header"."No.");
        IF SHA.FINDLAST THEN
        BEGIN
             Mail_Subject:= 'Sale Order '+"No."+' MOdified Details';
             Mail_From := 'erp@efftronics.com';
             Mail_To:= 'vishnupriya@efftronics.com,erp@efftronics.com,vanidevi@efftronics.com';

             SMTP_MAIL.CreateMessage('erp','erp@efftronics.com',Mail_To,'ERP - '+Mail_Subject,Body,TRUE);
             SMTP_MAIL.AppendBody('<html><head><style> divone{background-color: white; width: 2000px; padding: 20px; border-style:solid ; border-color:#666699;  margin: 20px;} </style></head>');
             SMTP_MAIL.AppendBody('<body><div style="border-color:#025E4D;  margin: 20px; border-width:15px;   border-style:solid; padding: 20px; width: 1000px;">');
             SMTP_MAIL.AppendBody('<label><font size="6"> Sale Order Information</font></label>');
             SMTP_MAIL.AppendBody('<hr style=solid; color= #3333CC>');
             SMTP_MAIL.AppendBody('<h>Dear Sir/Madam,</h><br>');
             SMTP_MAIL.AppendBody('<P>SALE ORDER  DETAILS</P>');
             SL.RESET;
            "sales header".SETFILTER("No.",Rec."No.");
             SL.SETFILTER("Document No.",Rec."No.");
             SL.FINDSET;
             SAL.SETFILTER("Document No.",Rec."No.");
             SAL.SETFILTER("Version No.",FORMAT(SHA."Version No."));
             SL.SETFILTER("Line No.",FORMAT(SAL."Line No."));
              SMTP_MAIL.AppendBody('<P><b>Modified Lines  in the Sale Order</b>  '+Rec."No."+'</P>');
              SMTP_MAIL.AppendBody('<table border = "1" style="border-collapse:collapse; width:100%; fond-size:10pt;">');
              SMTP_MAIL.AppendBody('<tr>');
              SMTP_MAIL.AppendBody('<th>Line No </th>');
              SMTP_MAIL.AppendBody('<th>Item no.</th>');
              SMTP_MAIL.AppendBody('<th>Item Description </th>');
              SMTP_MAIL.AppendBody('<th>Previous Qty</th>');
              SMTP_MAIL.AppendBody('<th>Current Qty</th>');
              SMTP_MAIL.AppendBody('<th>Pre. Qty.to-Ship </th>');
              SMTP_MAIL.AppendBody('<th>Curr. Qty.to-Ship</th>');
              SMTP_MAIL.AppendBody('</tr>');
            IF  SAL.FINDSET THEN
            REPEAT
              SL.SETFILTER("Line No.",FORMAT(SAL."Line No."));
              SL.FINDSET;
              IF (SAL."Qty. to Ship" <> SL."Qty. to Ship") OR (SAL.Quantity <> SL.Quantity) THEN
                BEGIN
                SMTP_MAIL.AppendBody('<tr>');
                SMTP_MAIL.AppendBody('<td>'+' '+FORMAT(SAL."Line No.")+'</td>');
                SMTP_MAIL.AppendBody('<td>'+' '+SAL."No."+'</td>');
                SMTP_MAIL.AppendBody('<td>'+' '+SAL.Description+'</td>');
                IF  SAL.Quantity = SL.Quantity THEN
                BEGIN
                SMTP_MAIL.AppendBody('<td >'+' '+FORMAT(SAL.Quantity)+'</td>');
                SMTP_MAIL.AppendBody('<td>'+' '+FORMAT(SL.Quantity)+'</td>');
                END
                ELSE
                BEGIN
                SMTP_MAIL.AppendBody('<td style = "color:red" >'+' '+FORMAT(SAL.Quantity)+'</td>');
                SMTP_MAIL.AppendBody('<td style = "color:green" >'+' '+FORMAT(SL.Quantity)+'</td>');
                END;
                IF SAL."Qty. to Ship" = SL."Qty. to Ship" THEN
                BEGIN
                SMTP_MAIL.AppendBody('<td style = "color:red" >'+' '+FORMAT(SAL."Qty. to Ship")+'</td>');
                SMTP_MAIL.AppendBody('<td style = "color:green" >'+' '+FORMAT(SL."Qty. to Ship")+'</td>');
                END
                ELSE
                BEGIN
                SMTP_MAIL.AppendBody('<td style = "color:red" >'+' '+FORMAT(SAL."Qty. to Ship")+'</td>');
                SMTP_MAIL.AppendBody('<td style = "color:green" >'+' '+FORMAT(SL."Qty. to Ship")+'</td>');
                END;
                SMTP_MAIL.AppendBody('</tr>');
                END

              UNTIL SAL.NEXT = 0;
              SMTP_MAIL.AppendBody('</table>');
              SMTP_MAIL.AppendBody('<P><b>Schedules in the Sale Order</b>  '+Rec."No."+'</P>');

              // for schedules

                          Schedl2.RESET;
                          Schedl2.SETCURRENTKEY(Schedl2."Document Type",Schedl2."Document No.",Schedl2."Document Line No.",Schedl2."Line No.");
                          Schedl2.SETRANGE(Schedl2."Document No.","sales header"."No.");
                          Schedl2.SETFILTER(Schedl2."Document Line No.",'<>%1',Schedl2."Line No.");
                          Schedl2.SETFILTER(Quantity,'>%1',0);
                          IF Schedl2.FINDSET THEN
                          SMTP_MAIL.AppendBody('<br><table border = "1" style="border-collapse:collapse; width:100%; fond-size:10pt;"><tr><th><b>Sales Line no.</b></th>');
                          SMTP_MAIL.AppendBody('<th> Sch Line No.</th><th>Item No.</th>');
                          SMTP_MAIL.AppendBody('<th>Item Description </th>');
                          SMTP_MAIL.AppendBody('<th> Type of Change </th>');
                          SMTP_MAIL.AppendBody('<th>Changed Field</th>');
                          SMTP_MAIL.AppendBody('<th>Previous Qty </th>');
                          SMTP_MAIL.AppendBody('<th>New Qty </th></tr>');
                          REPEAT
                            IF Schedl2."Document Line No." <> Schedl2."Line No."  THEN
                              BEGIN
                              CHANGELOGSETUP.RESET;
                              CHANGELOGSETUP.SETRANGE(CHANGELOGSETUP."Table No.",60095);
                              CHANGELOGSETUP.SETRANGE(CHANGELOGSETUP."Primary Key Field 2 Value","sales header"."No.");
                              RegExp := '*'+FORMAT(Schedl2."Document Line No.")+'*'+FORMAT(Schedl2."Line No.")+'*';
                              CHANGELOGSETUP.SETFILTER("Primary Key",RegExp);
                              IF CHANGELOGSETUP.FINDLAST THEN
                                Entr := CHANGELOGSETUP."Entry No.";
                                  CHANGELOGSETUP.SETFILTER("Entry No.",FORMAT(Entr));
                                  IF CHANGELOGSETUP.FINDLAST THEN
                                  REPEAT
                                    SMTP_MAIL.AppendBody('<tr><td>'+CHANGELOGSETUP."Primary Key Field 3 Value"+'</td><td>'+FORMAT(Schedl2."Line No.")+'</td>');
                                    SMTP_MAIL.AppendBody('<td>'+Schedl2."No."+'</td><td>'+Schedl2.Description+'</td>');

                                     CASE CHANGELOGSETUP."Type of Change" OF
                                      CHANGELOGSETUP."Type of Change" :: Insertion : SMTP_MAIL.AppendBody('<td>Insertion</td>');
                                      CHANGELOGSETUP."Type of Change" :: Modification : SMTP_MAIL.AppendBody('<td>Modification</td>');
                                      CHANGELOGSETUP."Type of Change" :: Deletion : SMTP_MAIL.AppendBody('<td>Deletion</td>');
                                    END;
                                    CASE CHANGELOGSETUP."Field No." OF
                                        5 :SMTP_MAIL.AppendBody('<td>Item No</td>');
                                        7 :SMTP_MAIL.AppendBody('<td>Quantity</td>');
                                    END;

                                    IF  CHANGELOGSETUP."Old Value" = FORMAT(Schedl2.Quantity) THEN
                                      BEGIN
                                        SMTP_MAIL.AppendBody('<td>'+CHANGELOGSETUP."Old Value"+'</td>');
                                        SMTP_MAIL.AppendBody('<td>'+FORMAT(Schedl2.Quantity)+'</td><td>');
                                      END
                                      ELSE
                                      BEGIN
                                         SMTP_MAIL.AppendBody('<td style = "color:red" >'+' '+FORMAT(CHANGELOGSETUP."Old Value")+'</td>');
                                         SMTP_MAIL.AppendBody('<td style = "color:green" >'+' '+FORMAT(Schedl2.Quantity)+'</td>');
                                      END;
                                  UNTIL CHANGELOGSETUP.NEXT = 0;
                                END;
                             UNTIL Schedl2.NEXT = 0;
                        SMTP_MAIL.AppendBody('</table>');
              SMTP_MAIL.Send;
            END;
      //ended by vishnu Priya for modifications Notifications purpose on 06-10-2018.
    END;

   
    PROCEDURE CreateOrdersForAll(Qtyparam: Decimal) OrdersCreated: Boolean;
    VAR
      Item : Record Item;
      SalesLine : Record "Sales Line";
      ProdOrderFromSale: Codeunit "Create Prod. Order from Sale";
    BEGIN
      IF NOT SalesPlanLine.FINDSET THEN
        EXIT;

      REPEAT
        SalesLine.GET(
          SalesLine."Document Type"::Order,
          SalesPlanLine."Sales Order No.",
          SalesPlanLine."Sales Order Line No.");
          //SalesLine.TESTFIELD("Shipment Date");
        SalesLine.CALCFIELDS("Reserved Qty. (Base)");
        //IF SalesLine."Outstanding Qty. (Base)" > SalesLine."Reserved Qty. (Base)" THEN BEGIN
          Item.GET(SalesLine."No.");
          IF Item."Replenishment System" = Item."Replenishment System"::"Prod. Order" THEN BEGIN
            OrdersCreated := TRUE;
            ProdOrderFromSale.CreateProdOrder2(
              SalesLine,NewStatus::Released,NewOrderType::ItemOrder,Qtyparam);
            IF NewOrderType = NewOrderType::ProjectOrder THEN
              EXIT;
          END;
        //END;
      UNTIL (SalesPlanLine.NEXT = 0);
    END;

   
    LOCAL PROCEDURE AssignDate(AssignProdDateLpar : Boolean);
    BEGIN
      AssignDateGVar := AssignProdDateLpar;
    END;

   
    PROCEDURE InputBox() : Text;
    VAR
      Prompt : DotNet "'System.Windows.Forms, Version=4.0.0.0,

     Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Windows.Forms.Form" RUNONCLIENT;
      FormBorderStyle : DotNet "'System.Windows.Forms, Version=4.0.0.0,

     Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Windows.Forms.FormBorderStyle" RUNONCLIENT;
      FormStartPosition: DotNet "'System.Windows.Forms, Version=4.0.0.0,

     Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Windows.Forms.FormStartPosition" RUNONCLIENT;
      LblRows: DotNet "'System.Windows.Forms, Version=4.0.0.0,

     Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Windows.Forms.Label" RUNONCLIENT;
      TxtRows: DotNet "'System.Windows.Forms, Version=4.0.0.0,

     Culture=neutral, PublicKeyToken=b77a5c561934e089'.

                                                       System.Windows.Forms.TextBox" RUNONCLIENT;
      ButtonOk: DotNet "'System.Windows.Forms, Version=4.0.0.0,

     Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Windows.Forms.Button" RUNONCLIENT;
      ButtonCancel : DotNet "'System.Windows.Forms, Version=4.0.0.0,

     Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Windows.Forms.Button" RUNONCLIENT;
      DialogResult : DotNet "'System.Windows.Forms, Version=4.0.0.0,

     Culture=neutral, PublicKeyToken=b77a5c561934e089'.

      System.Windows.Forms.DialogResult" RUNONCLIENT;
      NoOFRows_gInt : Integer;
      NoOFColumns_gInt: Integer;
      Result : Text;
      FindWhat : Text[2];
      ReplaceWith : Text[4];
      NewString: Text;
      i: Integer;
    BEGIN

      // ADDED BY VIJAYA ON 20-MAY-2016 for Changing Order Status

        Prompt:= Prompt.Form();
        Prompt.Width:=400;
        Prompt.Height:=650;
        Prompt.FormBorderStyle :=FormBorderStyle.FixedToolWindow;
        Prompt.Text:= 'Remarks';
        Prompt.StartPosition := FormStartPosition.CenterParent;

        LblRows:= LblRows.Label();
        LblRows.Text := 'Enter Remarks :: ';
        LblRows.Left := 20;
        LblRows.Top := 20;
        Prompt.Controls.Add(LblRows);

        TxtRows:= TxtRows.TextBox();
        TxtRows.Left(20);
        TxtRows.Top(50);
        TxtRows.Width(350);
        TxtRows.Height(520);
        TxtRows.Multiline:= TRUE;
        TxtRows.ScrollBars := 1;


        Prompt.Controls.Add(TxtRows);

        ButtonOk := ButtonOk.Button();
        ButtonOk.Text('Ok');
        ButtonOk.Left(215);
        ButtonOk.Top(580);
        ButtonOk.Width(75);
        ButtonOk.DialogResult :=DialogResult.OK;
        Prompt.Controls.Add(ButtonOk);

        ButtonCancel := ButtonCancel.Button();
        ButtonCancel.Text('Cancel');
        ButtonCancel.Left(295);
        ButtonCancel.Top(580);
        ButtonCancel.Width(75);
        ButtonCancel.DialogResult := DialogResult.Cancel;
        Prompt.Controls.Add(ButtonCancel);

        IF(Prompt.ShowDialog().ToString() <> DialogResult.OK.ToString()) THEN
        BEGIN
            EXIT;
        END;
        Prompt.Dispose;
        Result:= TxtRows.Text  ;   
        /* FindWhat:=format(13);
        ReplaceWith:= 'xx';
        WHILE STRPOS(Result,FindWhat) > 0 DO
          Result := DELSTR(Result,STRPOS(Result,FindWhat)) + ReplaceWith + COPYSTR(Result,STRPOS(Result,FindWhat) + STRLEN(FindWhat)); */

         //NewString := String;

        i :=1;
        NewString:='';
        WHILE i < STRLEN(Result)+2 DO
        BEGIN
            IF (Result[i] = 13 ) THEN
               NewString := NewString+'<br>'
            ELSE
               NewString := NewString+FORMAT(Result[i]);
            i:= i+1;
        END;



        EXIT(NewString);

      //end by vijaya
    END;


}