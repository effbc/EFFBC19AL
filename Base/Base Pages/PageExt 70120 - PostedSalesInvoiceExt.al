pageextension 70120 PostedSalesInvoiceExt extends "Posted Sales Invoice"
{
    Editable = true;
    layout
    {
        modify("Sell-to Post Code")
        {
            Caption = 'Sell-to Post Code/City';
        }
        modify("Ship-to Post Code")
        {
            Caption = 'Ship-to Post Code/City';
        }
        modify("Sell-to City")
        {
            trigger OnBeforeValidate()
            begin
                IF "Sell-to City" = '' THEN
                    ERROR('City cannot be empty!');
            end;
        }
        modify("Posting Date")
        {
            trigger OnBeforeValidate()
            begin
                // Added by Pranavi on 23-Dec-2016 for AMC Bill date update to Cashflow if changed to clear duplicate invoice creation in CF issue
                IF (STRLEN("Order No.") > 6) AND (COPYSTR("Order No.", 5, 3) = 'AMC') THEN BEGIN
                    IF ("Posting Date" <> xRec."Posting Date") AND (xRec."Posting Date" <> 0D) AND ("Posting Date" <> 0D) THEN BEGIN
                        SQLInt.AMC_Bill_Date_Update(Rec, xRec."Posting Date");
                    END;
                END;
                // End by Pranavi
            end;
        }
        addafter("Sell-to Contact")
        {
            field("Sale Order Total Amount"; "Sale Order Total Amount")
            {
                Editable = EditControlling;
                Enabled = true;
                Visible = true;
                ApplicationArea = All;
            }
            field("Total Invoiced Amount"; "Total Invoiced Amount")
            {
                Editable = EditControlling;
                ApplicationArea = All;
            }
            field("Total Excise Amount"; "Total Excise Amount")
            {
                ApplicationArea = All;
            }
        }
        addafter("Order No.")
        {
            field("Order Date"; "Order Date")
            {
                Editable = false;
                ApplicationArea = All;
            }
        }
        addbefore(SalesInvLines)
        {
            field("C-form Status"; "C-form Status")
            {
                Editable = true;
                ApplicationArea = All;
            }
            field("Form No."; "Form No.")
            {
                Editable = true;
                ApplicationArea = All;
            }
            field("Customer OrderNo."; "Customer OrderNo.")
            {
                Editable = true;
                ApplicationArea = All;
            }
            field("User ID"; "User ID")
            {
                Editable = false;
                ApplicationArea = All;
            }
            field("Blanket Order No"; "Blanket Order No")
            {
                ApplicationArea = All;
            }
            field("Special Condition"; "Special Condition")
            {
                Editable = Sepcial_conditio_Rights;
                ApplicationArea = All;
            }
            field(Vertical; Vertical)
            {
                Editable = EditControlling;
                ApplicationArea = All;
            }
            field("Insurance Applicable"; "Insurance Applicable")
            {
                ApplicationArea = All;
            }
        }
        addbefore("Form No.")
        {
            field("Customer Posting Group"; "Customer Posting Group")
            {
                Editable = true;
                ApplicationArea = All;
            }
        }
        addbefore("Ship-to Code")
        {
            field("Cancel Invoice"; "Cancel Invoice")
            {
                Editable = false;
                ApplicationArea = All;
            }
            field("Customer Order Date"; "Customer Order Date")
            {
                Editable = true;
                ApplicationArea = All;
            }
            field(State; State)
            {
                ApplicationArea = All;
            }
            field("Gen. Bus. Posting Group"; "Gen. Bus. Posting Group")
            {
                ApplicationArea = All;
            }
            field("Prices Including VAT"; "Prices Including VAT")
            {
                ApplicationArea = All;
            }
        }
        addafter("Ship-to Contact")
        {
            field(Consignee; Consignee)
            {
                ApplicationArea = All;
            }
        }
        addafter("Shipment Date")
        {
            field("MSPT Code"; "MSPT Code")
            {
                Editable = false;
                ApplicationArea = All;
            }
            field(WayBillNo; WayBillNo)
            {
                Editable = true;
                ApplicationArea = All;
            }
            field("Vehicle No."; "Vehicle No.")
            {
                ApplicationArea = All;
            }
        }
        addafter("Currency Code")
        {
            field("Currency Factor"; "Currency Factor")
            {
                ApplicationArea = All;
            }
        }
        addafter("EU 3-Party Trade")
        {
            field("Extended Date"; "Extended Date")
            {
                Caption = 'Material Dispatched Date';
                Editable = "Extended DateEditable";
                ApplicationArea = All;

                trigger OnValidate();
                begin
                    IF "Extended Date" <> 0D THEN
                        "Extended DateEditable" := FALSE
                    ELSE
                        "Extended DateEditable" := TRUE;
                    //  "Edit Text":=FALSE;
                end;
            }
            group("Dispatch Info")
            {
                Caption = 'Dispatch Info';
                field("<Extended Date2>"; "Extended Date")
                {
                    Caption = 'Material Dispatch Date';
                    ApplicationArea = All;

                    trigger OnValidate();
                    begin
                        IF "Extended Date" <> 0D THEN
                            "Extended DateEditable" := FALSE
                        ELSE
                            "Extended DateEditable" := TRUE;
                        //  "Edit Text":=FALSE;
                    end;
                }
                field("Date Sent"; "Date Sent")
                {
                    Caption = 'Material Reached Date';
                    ApplicationArea = All;
                }
                field("Expected Reached Date"; "Expected Reached Date")
                {
                    Editable = "Expected Reached DateEditable";
                    ApplicationArea = All;

                    trigger OnValidate();
                    begin
                        IF "Expected Reached Date" <> 0D THEN
                            "Expected Reached DateEditable" := FALSE
                        ELSE
                            "Expected Reached DateEditable" := TRUE;
                        //       "Edit Text":=FALSE;
                    end;
                }
                field("Hand Overed Person"; "Hand Overed Person")
                {
                    Editable = "Hand Overed PersonEditable";
                    ApplicationArea = All;

                    trigger OnValidate();
                    begin
                        /*
                        IF Resource.GET("Hand Overed Person") THEN BEGIN
                        "Contact Info":=Resource."Contact No.";
                        END;
                        */
                        IF "Hand Overed Person" <> '' THEN
                            "Hand Overed PersonEditable" := TRUE
                        ELSE
                            "Hand Overed PersonEditable" := FALSE;
                        //  "Edit Text":=FALSE;

                    end;
                }
                field("Contact Info"; "Contact Info")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Dispatched Location"; "Dispatched Location")
                {
                    Editable = "Dispatched LocationEditable";
                    ApplicationArea = All;

                    trigger OnValidate();
                    begin
                        IF "Dispatched Location" = '' THEN
                            "Dispatched LocationEditable" := TRUE
                        ELSE
                            "Dispatched LocationEditable" := TRUE;
                        //       "Edit Text":=FALSE;
                    end;
                }
                field("Transport Method"; "Transport Method")
                {
                    Caption = 'Mode of Transport';
                    Editable = "Transport MethodEditable";
                    ApplicationArea = All;
                }
                field("Reason For Deviation"; "Reason For Deviation")
                {
                    ApplicationArea = All;
                }
                field("Hand Overed Person(Others)"; "Hand Overed Person(Others)")
                {
                    Editable = HandOveredPersonOthersEditable;
                    ApplicationArea = All;

                    trigger OnValidate();
                    begin
                        IF "Hand Overed Person(Others)" <> '' THEN
                            HandOveredPersonOthersEditable := FALSE
                        ELSE
                            HandOveredPersonOthersEditable := TRUE;
                        //   "Edit Text":=FALSE;
                        HandOveredPersonOthersOnAfterV;
                    end;
                }
                field("Contact Info(Others)"; "Contact Info(Others)")
                {
                    Editable = "Contact Info(Others)Editable";
                    ApplicationArea = All;

                    trigger OnValidate();
                    begin
                        IF "Contact Info(Others)" <> '' THEN
                            "Contact Info(Others)Editable" := FALSE
                        ELSE
                            "Contact Info(Others)Editable" := TRUE;
                        // "Edit Text":=FALSE;
                    end;
                }
                field("Assurance by Sales"; "BizTalk Sales Invoice")
                {
                    Caption = 'Assurance by Sales';
                    ApplicationArea = All;

                    trigger OnValidate();
                    begin
                        //Rev01
                        //BizTalk Sales Invoice - OnValidate()
                        /*
                        IF "BizTalk Sales Invoice"=TRUE THEN
                        CurrPage."BizTalk Sales Invoice".EDITABLE(FALSE)
                        ELSE
                        CurrPage."BizTalk Sales Invoice".EDITABLE(TRUE);
                        */

                        IF "BizTalk Sales Invoice" = TRUE THEN
                            IF UPPERCASE(USERID) IN ['SUPER', 'EFFTRONICS\ANULATHA', 'EFFTRONICS\ANURADHAG', 'EFFTRONICS\PRASANNAT', 'EFFTRONICS\PMSUBHANI'] THEN
                                MODIFY(TRUE)
                            ELSE
                                ERROR('You Donot have Permissions');

                        //"BizTalk Sales Invoice":=FALSE;

                    end;
                }
                field("Send for Assurance"; "BizTalk Document Sent")
                {
                    Caption = 'Send for Assurance';
                    ApplicationArea = All;

                    trigger OnValidate();
                    begin
                        //Rev01

                        //sreenivas added coded as on dec-20-2009 as per instructions of anilkumar
                        //IF (UPPERCASE(USERID)='06FT008') OR (UPPERCASE(USERID)='04DI002') THEN BEGIN
                        IF (UPPERCASE(USERID) = 'EFFTRONICS\PMSUBHANI') OR (UPPERCASE(USERID) = 'EFFTRONICS\PADMAJA') THEN BEGIN
                            Mail_Body := '';
                            "from Mail" := '';
                            "to mail" := '';
                            Mail_Subject := '';
                            IF "Posting Date" > DMY2Date(04, 01, 09) THEN BEGIN
                                IF "Extended Date" = 0D THEN
                                    ERROR('Enter Material Dispatch Date');
                                IF "Expected Reached Date" = 0D THEN
                                    ERROR('Enter Expected Reached Date');
                                IF "Date Sent" = 0D THEN
                                    ERROR('Enter Material Received Date');
                                IF "Hand Overed Person" = '' THEN BEGIN
                                    IF "Hand Overed Person(Others)" = '' THEN
                                        ERROR('Enter the Hand Overed Person Name')
                                END;

                                //user.SETFILTER(user."User ID","Hand Overed Person"); //ADSK
                                user.SETFILTER(user."User Name", "Hand Overed Person");
                                IF user.FINDFIRST THEN
                                    personname := user."User Name";
                                //IF (FORMAT("Reason For Deviation")<>'') THEN
                                //ERROR('Enter Reason for Deviation');
                                IF "Dispatched Location" = '' THEN
                                    ERROR('Enter Dispatch Location');
                                division.SETFILTER(division."Division Code", "Dispatched Location");
                                IF division.FINDFIRST THEN
                                    location := division."Division Name";
                                IF "Transport Method" = '' THEN
                                    ERROR('Enter Method of Transportation');
                                MODIFY(TRUE);
                                Mail_Subject := 'DISPATCH - Assurance for Dispatched Material Status';
                                //"Mail-Id".SETRANGE("Mail-Id"."User ID",USERID);
                                "Mail-Id".SETRANGE("Mail-Id"."User Name", USERID);
                                IF "Mail-Id".FINDFIRST THEN
                                    "from Mail" := "Mail-Id".MailID;
                                charline := 10;
                                Mail_Body := 'Customer Name      :' + FORMAT("Sell-to Customer Name");
                                Mail_Body += FORMAT(charline);
                                Mail_Body += 'Invoice No.        :' + FORMAT("External Document No.");
                                Mail_Body += FORMAT(charline);
                                Mail_Body += 'Sale Order No.     :' + FORMAT("Order No.");
                                Mail_Body += FORMAT(charline);
                                Mail_Body += 'Invoice Date       :' + FORMAT(("Posting Date"), 0, 4);
                                Mail_Body += FORMAT(charline);
                                Mail_Body += 'Material Recived   :' + FORMAT(("Date Sent"), 0, 4);
                                Mail_Body += FORMAT(charline);
                                Mail_Body += 'Material Location  :' + location;
                                Mail_Body += FORMAT(charline);
                                Mail_Body += 'Mode of Transport  :' + FORMAT("Transport Method");
                                Mail_Body += FORMAT(charline);
                                IF "Hand Overed Person" = '' THEN BEGIN
                                    Mail_Body += 'Handover Person     :' + FORMAT("Hand Overed Person(Others)");
                                    Mail_Body += FORMAT(charline);
                                    Mail_Body += 'Handover Person No. :' + FORMAT("Contact Info(Others)");
                                    Mail_Body += FORMAT(charline);
                                END ELSE BEGIN
                                    Mail_Body += 'Handover Person    :' + FORMAT(personname);
                                    Mail_Body += FORMAT(charline);
                                    Mail_Body += 'Handover Person No.:' + FORMAT("Contact Info");
                                    Mail_Body += FORMAT(charline);
                                END;
                                Mail_Body += FORMAT(charline);
                                Mail_Body += '***** I confirmed from Customer/Site Person,that Material has Reached and Packing Condition Also Satisfactory *****';

                                "to mail" :=/*dir@efftronics.com,*/'erp@efftronics.com,pmsubhani@efftronics.com,padmaja@efftronics.com,anvesh@efftronics.com,spurthi@efftronics.com,';
                                "to mail" += 'cuspm@efftronics.com,';
                                "to mail" += 'pmurali@efftronics.com,';
                                "to mail" += 'bharat@efftronics.com,prasanthi@efftronics.com';
                                IF (COPYSTR("Order No.", 15, 1) = 'L') THEN
                                    "to mail" += ',bala@efftronics.com,lmd@efftronics.com'
                                ELSE
                                    "to mail" += ',sales@efftronics.com';
                                IF SalesInvHeader."Customer Posting Group" = 'RAILWAYS' THEN
                                    "to mail" += ',prasanthi@efftronics.com';
                                //"to mail"+='mohang@efftronics.com';
                                SIH.SETFILTER(SIH."No.", "No.");
                                //REPORT.RUN(50181,FALSE,FALSE,SIH);
                                "to mail" := 'pranavi@efftronics.com';
                                REPORT.SAVEASPDF(50021, '\\erpserver\ErpAttachments\ErpAttachments1\Billdetails.Pdf', SIH);
                                attachment := '\\erpserver\ErpAttachments\ErpAttachments1\Billdetails.Pdf';
                                IF ("from Mail" <> '') AND ("to mail" <> '') THEN BEGIN
                                    //mail.NewCDOMessage("from Mail","to mail",Mail_Subject,Mail_Body,attachment);
                                    SMTP_MAIL.CreateMessage('ERP', "from Mail", "to mail", Mail_Subject, Mail_Body, FALSE);
                                    //EFFUPG Start
                                    /*
                                    SMTP_MAIL.AddAttachment(attachment);
                                    */
                                    SMTP_MAIL.AddAttachment(attachment, '');
                                    //EFFUPG End
                                    SMTP_MAIL.Send;
                                END;
                                "Dispatch Assurance Date" := TODAY();     //Added by Pranavi on 04-11-2015
                                                                          //IF "BizTalk Document Sent"= TRUE THEN
                                                                          //CurrPage."BizTalk Document Sent".EDITABLE(FALSE)
                                                                          // ELSE
                                                                          // CurrPage."BizTalk Document Sent".EDITABLE(TRUE);
                            END ELSE BEGIN
                                "BizTalk Document Sent" := FALSE;
                                "Dispatch Assurance Date" := 0D;
                            END;
                            //CurrForm."BizTalk Document Sent".EDITABLE(TRUE);
                            MODIFY;
                        END;

                    end;
                }
                field("Dispatched Amount"; "Dispatched Amount")
                {
                    Caption = 'Tansportation Amount';
                    ApplicationArea = All;

                    trigger OnValidate();
                    begin
                        IF UPPERCASE(USERID) IN ['EFFTRONICS\PMSUBHANI', 'EFFTRONICS\SUJANI', 'EFFTRONICS\VIJAYA'] THEN
                            MODIFY(TRUE)
                        ELSE
                            ERROR('You Donot have Permissions');
                    end;
                }
                field("LR No."; "LR No.")
                {
                    ApplicationArea = All;

                    trigger OnValidate();
                    begin
                        IF UPPERCASE(USERID) IN ['EFFTRONICS\PMSUBHANI', 'EFFTRONICS\PRANAVI'] THEN
                            MODIFY(TRUE)
                        ELSE
                            ERROR('You Donot have Permissions');
                    end;
                }
                field(ContactName; ContactName)
                {
                    Caption = 'Contact Name';
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Customer Contact No"; "Customer Contact No")
                {
                    Caption = 'Customer_Contact_no';
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Dispatch Assurance Date"; "Dispatch Assurance Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }
            group(Others)
            {
                Caption = 'Others';
                Editable = true;
                field("RDSO Inspection Required"; "RDSO Inspection Required")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("RDSO Inspection By"; "RDSO Inspection By")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("RDSO Charges"; "RDSO Charges")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("RDSO Charges Paid By."; "RDSO Charges Paid By.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(CallLetterExpireDate; CallLetterExpireDate)
                {
                    ApplicationArea = All;
                }
                field("Call letters Status"; "Call letters Status")
                {
                    ApplicationArea = All;
                }
                field("<Tender No.2>"; "Tender No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("CA Number"; "CA Number")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("CA Date"; "CA Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("0"; "LD Amount")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(CallLetterRecivedDate; CallLetterRecivedDate)
                {
                    ApplicationArea = All;
                }
                field("Document Position"; "Document Position")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Exempted Vide Notification No."; "Exempted Vide Notification No.")
                {
                    ApplicationArea = All;
                }
                field(Order_After_CF_Integration; Order_After_CF_Integration)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }
            group("Secuirty Deposit")
            {
                Caption = 'Secuirty Deposit';
                Enabled = true;
                field("Security Deposit Amount"; "Security Deposit Amount")
                {
                    Editable = true;
                    ApplicationArea = All;

                    trigger OnValidate();
                    begin
                        SalesInvHeader.SETRANGE(SalesInvHeader."Order No.", "Order No.");
                        SalesInvHeader.SETFILTER(SalesInvHeader."No.", '<>%1', "No.");
                        IF SalesInvHeader.FINDSET THEN
                            REPEAT
                                SalesInvHeader."Security Deposit Amount" := "Security Deposit Amount";
                                SalesInvHeader.MODIFY;
                            UNTIL SalesInvHeader.NEXT = 0
                    end;
                }
                field("EMD Amount"; "EMD Amount")
                {
                    ApplicationArea = All;

                    trigger OnValidate();
                    begin
                        SalesInvHeader.RESET;
                        SalesInvHeader.SETRANGE(SalesInvHeader."Order No.", "Order No.");
                        SalesInvHeader.SETFILTER(SalesInvHeader."No.", '<>%1', "No.");
                        IF SalesInvHeader.FINDSET THEN
                            REPEAT
                                SalesInvHeader."EMD Amount" := "EMD Amount";
                                SalesInvHeader.MODIFY;
                            UNTIL SalesInvHeader.NEXT = 0
                    end;
                }
                field("Deposit Payment Due Date"; "Deposit Payment Due Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Deposit Payment Date"; "Deposit Payment Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Security Deposit Status"; "Security Deposit Status")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("SD Requested Date"; "SD Requested Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("SD Required Date"; "SD Required Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("SecurityDeposit Exp. Rcpt Date"; "SecurityDeposit Exp. Rcpt Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Final Bill Date"; "Final Bill Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Warranty Period"; "Warranty Period")
                {
                    Editable = true;
                    ApplicationArea = All;

                    trigger OnValidate();
                    begin
                        SalesInvHeader.RESET;
                        SalesInvHeader.SETRANGE(SalesInvHeader."Order No.", "Order No.");
                        SalesInvHeader.SETFILTER(SalesInvHeader."No.", '<>%1', "No.");
                        IF SalesInvHeader.FINDSET THEN
                            REPEAT
                                SalesInvHeader."Warranty Period" := "Warranty Period";
                                SalesInvHeader.MODIFY;
                            UNTIL SalesInvHeader.NEXT = 0
                    end;
                }
                field("<Due Date2>"; "Due Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("SD Status"; "SD Status")
                {
                    Editable = true;
                    ApplicationArea = All;

                    trigger OnValidate();
                    begin
                        SalesInvHeader.RESET;
                        SalesInvHeader.SETRANGE(SalesInvHeader."Order No.", "Order No.");
                        SalesInvHeader.SETFILTER(SalesInvHeader."No.", '<>%1', "No.");
                        IF SalesInvHeader.FINDSET THEN
                            REPEAT
                                SalesInvHeader."SD Status" := "SD Status";
                                SalesInvHeader.MODIFY;
                            UNTIL SalesInvHeader.NEXT = 0
                    end;
                }
                field("<Order No.2>"; "Order No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("SD Fin Verification"; "SD Fin Verification")
                {
                    ApplicationArea = All;
                }
                field(SecDepStatus; SecDepStatus)
                {
                    ApplicationArea = All;

                    trigger OnValidate();
                    begin
                        SalesInvHeader.RESET;
                        SalesInvHeader.SETRANGE(SalesInvHeader."Order No.", "Order No.");
                        SalesInvHeader.SETFILTER(SalesInvHeader."No.", '<>%1', "No.");
                        IF SalesInvHeader.FINDSET THEN
                            REPEAT
                                SalesInvHeader.SecDepStatus := SecDepStatus;
                                SalesInvHeader.MODIFY;
                            UNTIL SalesInvHeader.NEXT = 0
                    end;
                }
                field("Final Railway Bill Date"; "Final Railway Bill Date")
                {
                    ApplicationArea = All;

                    trigger OnValidate();
                    begin
                        SalesInvHeader.RESET;
                        SalesInvHeader.SETRANGE(SalesInvHeader."Order No.", "Order No.");
                        SalesInvHeader.SETFILTER(SalesInvHeader."No.", '<>%1', "No.");
                        IF SalesInvHeader.FINDSET THEN
                            REPEAT
                                SalesInvHeader."Final Railway Bill Date" := "Final Railway Bill Date";
                                SalesInvHeader.MODIFY;
                            UNTIL SalesInvHeader.NEXT = 0
                    end;
                }
                field(Remarks; Remarks)
                {
                    ApplicationArea = All;
                }
                field("Tender No."; "Tender No.")
                {
                    ApplicationArea = All;

                    trigger OnValidate();
                    begin
                        SalesInvHeader.RESET;
                        SalesInvHeader.SETRANGE(SalesInvHeader."Order No.", "Order No.");
                        SalesInvHeader.SETFILTER(SalesInvHeader."No.", '<>%1', "No.");
                        IF SalesInvHeader.FINDSET THEN
                            REPEAT
                                SalesInvHeader."Tender No." := "Tender No.";
                                SalesInvHeader.MODIFY;
                            UNTIL SalesInvHeader.NEXT = 0
                    end;
                }
            }
            field("Customer GST Reg. No."; "Customer GST Reg. No.")
            {
                ApplicationArea = All;
            }
        }
    }


    actions
    {
        modify(Statistics)
        {
            Promoted = true;
            PromotedIsBig = true;
        }
        modify("Co&mments")
        {
            Promoted = true;
            PromotedIsBig = true;
        }
        modify(Dimensions)
        {
            Promoted = true;
            PromotedIsBig = true;
        }
        modify(Approvals)
        {
            Promoted = true;
            PromotedIsBig = true;
        }
        modify("Credit Cards Transaction Lo&g Entries")
        {
            Promoted = true;
            PromotedIsBig = true;
        }
        modify("Posted Reference Invoice No.")
        {
            Promoted = true;
        }
        modify("Print Invoice")
        {
            Promoted = true;
            PromotedCategory = Process;
            trigger OnAfterAction()
            begin
                /* REPORT.RUNMODAL(REPORT::"Sales - Invoice_GST_Test", TRUE, TRUE, SalesInvHeader);

                IF USERID = 'EFFTRONICS\PRANAVI' THEN
                    REPORT.RUNMODAL(REPORT::"Sales - Invoice_GST_Test", TRUE, TRUE, SalesInvHeader)
                ELSE */

                IF (COPYSTR(Rec."Order No.", 5, 3) = 'AMC') AND (Rec.Structure = 'GST')
                THEN BEGIN
                    //REPORT.RUN(33000274,Rec);
                    REPORT.RUNMODAL(33000274, TRUE, TRUE, SalesInvHeader);
                END
                ELSE
                    ;
            end;
        }
        modify("Export Json File")
        {
            Promoted = true;
        }
        modify("Import Json File")
        {
            Promoted = true;
        }
        modify(SendCustom)
        {
            Promoted = true;
            PromotedIsBig = true;
        }
        modify("&Navigate")
        {
            Promoted = true;
            PromotedIsBig = true;
        }
        addafter(Approvals)
        {
            separator(Action1102152006)
            {
            }
            action("MSPT Details")
            {
                Caption = 'MSPT Details';
                RunObject = Page "MSPT Posted Order Details";
                RunPageLink = Type = CONST(Sale), "Document No." = FIELD("No."), "MSPT Header Code" = FIELD("MSPT Code");
                ApplicationArea = All;
            }
            action("Transit Documents")
            {
                Caption = 'Transit Documents';
                RunObject = Page "Transit Document Order Details";
                RunPageLink = Type = CONST(Sale), "Vendor / Customer Ref." = FIELD("Sell-to Customer No."), "PO / SO No." = FIELD("Order No.");
                ApplicationArea = All;
            }
        }
        addfirst("F&unctions")
        {
            action("Delivery Challan")
            {
                Caption = 'Delivery Challan';
                ApplicationArea = All;

                trigger OnAction();
                begin
                    SalesInvHeader.SETRANGE(SalesInvHeader."No.", "No.");
                    REPORT.RUN(50119, TRUE, FALSE, SalesInvHeader);
                end;
            }
            action("&Service Invoice")
            {
                Caption = '&Service Invoice';
                Image = Invoice;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction();
                begin
                    SalesInvHeader.SETRANGE(SalesInvHeader."No.", "No.");
                    REPORT.RUN(13700, TRUE, FALSE, SalesInvHeader);
                end;
            }
            action("Adjust for CS")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction();
                begin
                    // Added by Rakesh on 24-May-14
                    /*
                    IF ((TODAY-"Posting Date") > 5) THEN
                      ERROR('Items are not allowed to move for previous posting dates');
                    */
                    IF "Sell-to Customer No." = 'CUST00536' THEN BEGIN
                        SSH.RESET;
                        SSH.SETRANGE(SSH."Sell-to Customer No.", "Sell-to Customer No.");
                        SSH.SETRANGE(SSH."Posting Date", "Posting Date");
                        SSH.SETRANGE(SSH."Order No.", "Order No.");
                        SSH.SETRANGE(SSH."External Document No.", "External Document No.");
                        IF SSH.FINDFIRST THEN BEGIN
                            SSL.RESET;
                            SSL.SETRANGE(SSL."Document No.", SSH."No.");
                            SSL.SETFILTER(SSL.Quantity, '>%1', 0);
                            IF SSL.FINDSET THEN
                                REPEAT
                                    SerialNos := '';
                                    ILE.RESET;
                                    ILE.SETFILTER(ILE."Document No.", SSL."Document No.");
                                    ILE.SETFILTER(ILE."Item No.", SSL."No.");
                                    IF ILE.FINDFIRST THEN
                                        REPEAT
                                            ILE2.RESET;
                                            ILE2.SETFILTER(ILE2."Item No.", ILE."Item No.");
                                            ILE2.SETFILTER(ILE2."Serial No.", ILE."Serial No.");
                                            ILE2.SETFILTER(ILE2."Lot No.", ILE."Lot No.");
                                            ILE2.SETRANGE(ILE2."Posting Date", ILE."Posting Date");
                                            ILE2.SETRANGE(ILE2."Entry Type", ILE2."Entry Type"::"Positive Adjmt.");
                                            ILE2.SETRANGE(ILE2."Location Code", 'CS');
                                            ILE2.SETRANGE(ILE2."Global Dimension 2 Code", 'H-OFF');
                                            // IF NOT (ILE2.COUNT=2) THEN
                                            IF ILE2.FINDFIRST THEN
                                                MESSAGE('The Item ' + ILE."Item No." + ' are already moved to CS location')
                                            ELSE BEGIN
                                                IF SerialNos = '' THEN
                                                    SerialNos := ILE."Serial No."
                                                ELSE
                                                    SerialNos := SerialNos + '|' + ILE."Serial No.";
                                            END;
                                        UNTIL ILE.NEXT = 0;
                                    Item_Positive_Adjustment1(ILE."Item No.", SerialNos, 'H-OFF', SSL."Document No.", SSL.Quantity);
                                UNTIL SSL.NEXT = 0;
                        END
                    END
                    ELSE
                        ERROR('This action is applicable only for Internal sale orders');
                    // end by Rakesh

                end;
            }
        }
        addbefore(SendCustom)
        {
            action("Invoice for VMC")
            {
                Caption = 'Invoice for VMC';
                ApplicationArea = All;

                trigger OnAction();
                begin
                    CurrPage.SETSELECTIONFILTER(SalesInvHeader);
                    SalesInvHeader.PrintRecords1(TRUE);
                end;
            }
            action("Forward Invoice to Cashflow")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction();
                begin
                    // Added by Pranavi on 08-09-2016 for payment terms integration
                    IF ("Customer Posting Group" IN ['PRIVATE', 'OTHERS', 'EXPORT', 'RAILWAYS']) AND NOT ("Sell-to Customer No." IN ['CUST00536', 'CUST01164']) AND (Order_After_CF_Integration = TRUE) AND (USERID IN ['EFFTRONICS\VISHNUPRIYA', 'EFFTRONICS\SUJANI']) THEN
                        SQLInt.PvtSaleOrdrInvoiceCreationinCF("Order No.", "Posting Date", "External Document No.");
                    // End by Pranavi
                    //IF USERID IN ['EFFTRONICS\VISHNUPRIYA','EFFTRONICS\SUJANI'] THEN
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        //Added by Pranavi
        /* IF USERID IN ['EFFTRONICS\PRANAVI'] THEN
            FieldEditable := TRUE
        ELSE
            FieldEditable := FALSE; */
        //End by Pranavi
        //Added by Vishnu Priya
        /* PIF SMTP_MAIL.Permission_Checking(USERID,'ERP-ADMIN') THEN
        CurrPage.EDITABLE(TRUE)
        ELSE CurrPage.EDITABLE(FALSE); */
        // ended by Vishnu Priya on 04-June-18.


        //ADDED BY VISHNU ON 04-FEB-2019
        /* IF USERID IN ['EFFTRONICS\ANILKUMAR','EFFTRONICS\SUJANI'] THEN
        CurrPage.EDITABLE := TRUE
        ELSE
        CurrPage.EDITABLE := FALSE; */


        // added by vishnu priya to restrict the editings in the Invoice header

        IF USERID IN ['EFFTRONICS\VISHNUPRIYA', 'EFFTRONICS\SUJANI', 'EFFTRONICS\ANILKUMAR', 'EFFTRONICS\B2BOTS'] THEN
            EditControlling := TRUE
        ELSE
            EditControlling := FALSE;

        IF NOT (SMTP_MAIL.Permission_Checking(USERID, 'SALES-INV-SHIP-EDIT'))
        THEN
            SALESTEAM := TRUE;
        SalesInvHeader.SETRANGE(SalesInvHeader."Order No.", salesheader."No.");
        IF salesheader.FINDFIRST THEN
            SalesInvHeader.WayBillNo := salesheader.WayBillNo;

        SalesInvHeader.RESET;
        SalesInvHeader.SETRANGE(SalesInvHeader."No.", "No.");
        // SalesInvHeader.SETRANGE(SalesInvHeader."Edit Text",FALSE);
        IF SalesInvHeader.FINDFIRST THEN BEGIN
            IF SalesInvHeader."Extended Date" = 0D THEN
                "Extended DateEditable" := TRUE
            ELSE
                "Extended DateEditable" := FALSE;

            /* IF SalesInvHeader."Date Sent" = 0D THEN
                "Date SentEditable" := TRUE
            ELSE
                "Date SentEditable" := FALSE; *///B2b1.0

            IF SalesInvHeader."Expected Reached Date" = 0D THEN
                "Expected Reached DateEditable" := TRUE
            ELSE
                "Expected Reached DateEditable" := FALSE;

            IF SalesInvHeader."Hand Overed Person" = '' THEN
                "Hand Overed PersonEditable" := TRUE
            ELSE
                "Hand Overed PersonEditable" := FALSE;

            IF SalesInvHeader."Hand Overed Person(Others)" = '' THEN
                HandOveredPersonOthersEditable := TRUE
            ELSE
                HandOveredPersonOthersEditable := FALSE;

            IF SalesInvHeader."Contact Info(Others)" = '' THEN
                "Contact Info(Others)Editable" := TRUE
            ELSE
                "Contact Info(Others)Editable" := FALSE;

            IF SalesInvHeader."Dispatched Location" = '' THEN
                "Dispatched LocationEditable" := TRUE
            ELSE
                "Dispatched LocationEditable" := FALSE;

            /* IF SalesInvHeader."Transport Method"='' THEN
            CurrPage."Transport Method".EDITABLE(TRUE)
            ELSE
            CurrPage."Transport Method".EDITABLE(FALSE); */

            /* IF SalesInvHeader."BizTalk Sales Invoice"=TRUE THEN
            "BizTalk Sales InvoiceEditable" := FALSE
            ELSE
            "BizTalk Sales InvoiceEditable" := TRUE; *///B2b1.0


            /* IF SalesInvHeader."BizTalk Document Sent"= TRUE THEN
            "BizTalk Document SentEditable" := FALSE
            ELSE
            "BizTalk Document SentEditable" := TRUE; *///B2b1.0
        END;
        IF (USERID IN ['EFFTRONICS\ANILKUMAR', 'EFFTRONICS\ANVESH', 'EFFTRONICS\VISHNUPRIYA', 'EFFTRONICS\SUJANI']) THEN
            Sepcial_conditio_Rights := TRUE
        ELSE
            Sepcial_conditio_Rights := FALSE;
    end;

    trigger OnAfterGetRecord()
    begin
        SalesInvHeader.RESET;
        SalesInvHeader.SETRANGE(SalesInvHeader."No.", "No.");
        // SalesInvHeader.SETRANGE(SalesInvHeader."Edit Text",TRUE);


        IF SalesInvHeader.FINDFIRST THEN BEGIN

            IF SalesInvHeader."Extended Date" = 0D THEN
                "Extended DateEditable" := TRUE
            ELSE
                "Extended DateEditable" := FALSE;

            /* IF SalesInvHeader."Date Sent" = 0D THEN
                "Date SentEditable" := TRUE
            ELSE
                "Date SentEditable" := FALSE; *///B2b1.0

            IF SalesInvHeader."Expected Reached Date" = 0D THEN
                "Expected Reached DateEditable" := TRUE
            ELSE
                "Expected Reached DateEditable" := FALSE;

            IF SalesInvHeader."Hand Overed Person" = '' THEN
                "Hand Overed PersonEditable" := TRUE
            ELSE
                "Hand Overed PersonEditable" := FALSE;

            IF SalesInvHeader."Hand Overed Person(Others)" = '' THEN
                HandOveredPersonOthersEditable := TRUE
            ELSE
                HandOveredPersonOthersEditable := FALSE;

            IF SalesInvHeader."Contact Info(Others)" = '' THEN
                "Contact Info(Others)Editable" := TRUE
            ELSE
                "Contact Info(Others)Editable" := FALSE;

            IF SalesInvHeader."Dispatched Location" = '' THEN
                "Dispatched LocationEditable" := TRUE
            ELSE
                "Dispatched LocationEditable" := FALSE;


            /* IF SalesInvHeader."Transport Method"='' THEN
            CurrPage."Transport Method".EDITABLE(TRUE)
            ELSE
            CurrPage."Transport Method".EDITABLE(FALSE); */

            /* IF SalesInvHeader."BizTalk Sales Invoice"=TRUE THEN
            "BizTalk Sales InvoiceEditable" := FALSE
            ELSE
            "BizTalk Sales InvoiceEditable" := TRUE; *///B2b1.0


            /* IF SalesInvHeader."BizTalk Document Sent"=TRUE THEN
            "BizTalk Document SentEditable" := FALSE
            ELSE
            "BizTalk Document SentEditable" := TRUE; *///B2b1.0
        END;
        //CurrPage."BizTalk Document Sent".EDITABLE(TRUE);
        //added by sundar on 26-MAR-14 as dispatch team has to contact customer for availability.
        "Customer Contact No" := '';
        ContactName := '';
        CustGRec.RESET;
        IF CustGRec.GET("Sell-to Customer No.") THEN BEGIN
            "Customer Contact No" := CustGRec."Phone No.";
            IF CustGRec."Primary Contact No." <> '' THEN BEGIN
                ContactGRec.RESET;
                IF ContactGRec.GET(CustGRec."Primary Contact No.") THEN
                    ContactName := ContactGRec.Name
                ELSE
                    ContactName := CustGRec.Name;
            END;
        END;
        //added by sundar on 26-MAR-14 as dispatch team has to contact customer for availability.
    end;

    var
        salesheader: Record "Sales Header";
        Resource: Record Resource;
        "Mail-Id": Record User;
        "from Mail": Text[1000];
        "to mail": Text[1000];
        Mail_Subject: Text[1000];
        Mail_Body: Text[1000];
        mail: Codeunit 397;
        charline: Char;
        cnt: Integer;
        location: Text[30];
        personname: Text[30];
        division: Record Division;
        user: Record User;
        SIH: Record "Sales Invoice Header";
        attachment: Text[250];
        SMTP_MAIL: Codeunit "SMTP Mail";
        Subject: Text[1000];
        Body: Text[1000];
        GJL: Record "Gen. Journal Line";
        SIL: Record "Sales Invoice Line";
        Invoice_Amount: Decimal;
        Line_No: Integer;
        No: Code[20];
        NoSeriesMgt: Codeunit 396;

        "Extended DateEditable": Boolean;

        "Date SentEditable": Boolean;

        "Expected Reached DateEditable": Boolean;

        "Hand Overed PersonEditable": Boolean;

        HandOveredPersonOthersEditable: Boolean;

        "Contact Info(Others)Editable": Boolean;

        "Dispatched LocationEditable": Boolean;

        "BizTalk Sales InvoiceEditable": Boolean;

        "BizTalk Document SentEditable": Boolean;

        "Transport MethodEditable": Boolean;
        "Customer Contact No": Text;
        CustGRec: Record Customer;
        ContactGRec: Record Contact;
        ContactName: Text;
        SSH: Record "Sales Shipment Header";
        SSL: Record "Sales Shipment Line";
        ILE: Record "Item Ledger Entry";
        ILE2: Record "Item Ledger Entry";
        SQLInt: Codeunit SQLIntegration;
        SerialNos: Text;
        ILE1: Record "Item Ledger Entry";
        ILE21: Record "Item Ledger Entry";
        Sepcial_conditio_Rights: Boolean;
        EditControlling: Boolean;
        SALESTEAM: Boolean;



    local procedure HandOveredPersonOthersOnAfterV();
    begin
        "Hand Overed Person(Others)" := UPPERCASE("Hand Overed Person(Others)");
    end;


    local procedure DateSentC104OnAfterInput(var Text: Text[1024]);
    begin
        "Date SentEditable" := FALSE;
    end;


    local procedure ExtendedDateC1102154023OnAfter(var Text: Text[1024]);
    begin
        "Extended DateEditable" := FALSE;
    end;


    local procedure ContactInfoOthersOnAfterInput(var Text: Text[1024]);
    begin
        "Contact Info(Others)Editable" := FALSE;
    end;


    local procedure HandOveredPersonOthersOnAfterI(var Text: Text[1024]);
    begin
        HandOveredPersonOthersEditable := FALSE;
    end;


    local procedure ExpectedReachedDateOnAfterInpu(var Text: Text[1024]);
    begin
        "Expected Reached DateEditable" := FALSE;
    end;


    local procedure HandOveredPersonOnAfterInput(var Text: Text[1024]);
    begin
        "Hand Overed PersonEditable" := FALSE;
    end;

    local procedure TransportMethodOnAfterInput(var Text: Text[1024]);
    begin
        "Transport MethodEditable" := FALSE;
    end;


    local procedure DispatchedLocationOnAfterInput(var Text: Text[1024]);
    begin
        "Dispatched LocationEditable" := FALSE;
    end;


    procedure Item_Positive_Adjustment("Item No.": Code[20]; "Serial No.": Code[20]; "Location Code": Code[10]);
    var
        "Item Journal Line": Record "Item Journal Line";
        "Reservation Entry": Record "Reservation Entry";
        "Reservation Entry1": Record "Reservation Entry";
        NoSeriesMgt: Codeunit 396;
        "Item Ledger Entry": Record "Item Ledger Entry";
    begin
        //Deleted Var (Journal Line DimensionRecordTable356) B2B
        "Item Ledger Entry".RESET;
        "Item Ledger Entry".SETCURRENTKEY("Item Ledger Entry"."Item No.",
                                          "Item Ledger Entry"."Lot No.",
                                          "Item Ledger Entry"."Serial No.");
        "Item Ledger Entry".SETRANGE("Item Ledger Entry"."Item No.", "Item No.");
        "Item Ledger Entry".SETRANGE("Item Ledger Entry"."Serial No.", "Serial No.");
        "Item Ledger Entry".SETFILTER("Item Ledger Entry"."Remaining Quantity", '>%1', 0);
        IF NOT "Item Ledger Entry".FIND('-') THEN BEGIN
            // INSERTING RECORD IN ITEM JOURNAL LINE
            "Item Journal Line".INIT;
            "Item Journal Line"."Journal Template Name" := 'ITEM';
            "Item Journal Line"."Journal Batch Name" := 'POS-CS-SIG';
            "Item Journal Line"."Entry Type" := "Item Journal Line"."Entry Type"::"Positive Adjmt.";
            "Item Journal Line"."Line No." := 10000;
            "Item Journal Line"."Source Code" := 'ITEMJNL';
            //"Item Journal Line"."Serial No.":="Serial No.";
            //"Item Journal Line"."Lot No.":=ICNNO(TODAY)+'SA01';
            "Item Journal Line"."Document No." := NoSeriesMgt.GetNextNo('POS-ADJ-CS', TODAY, FALSE);
            "Item Journal Line".VALIDATE("Item Journal Line"."Item No.", "Item No.");
            "Item Journal Line".VALIDATE(Quantity, 1);
            "Item Journal Line".VALIDATE("Location Code", 'CS');
            "Item Journal Line".VALIDATE("Shortcut Dimension 2 Code", "Location Code");
            "Item Journal Line"."User ID" := USERID;
            "Item Journal Line"."Document Date" := TODAY;
            "Item Journal Line".INSERT;


            // INSERTING RECORD IN RESERVATION ENTRY
            "Reservation Entry".INIT;
            IF "Reservation Entry1".FIND('+') THEN
                "Reservation Entry"."Entry No." := "Reservation Entry1"."Entry No." + 1;
            "Reservation Entry".VALIDATE("Item No.", "Item No.");
            "Reservation Entry".VALIDATE("Location Code", 'CS');
            "Reservation Entry".VALIDATE("Quantity (Base)", 1);
            "Reservation Entry"."Reservation Status" := "Reservation Entry"."Reservation Status"::Prospect;
            "Reservation Entry"."Creation Date" := TODAY;
            "Reservation Entry"."Source Type" := 83;
            "Reservation Entry"."Source Subtype" := 2;
            "Reservation Entry"."Source ID" := 'ITEM';
            "Reservation Entry"."Source Batch Name" := 'POS-CS-SIG';
            "Reservation Entry"."Source Ref. No." := 10000;
            "Reservation Entry"."Created By" := 'SUPER';
            "Reservation Entry".Positive := TRUE;
            "Reservation Entry"."Expected Receipt Date" := TODAY;
            "Reservation Entry".VALIDATE("Serial No.", "Serial No.");
            "Reservation Entry"."Lot No." := ICNNO(TODAY) + 'SA01';
            //"Reservation Entry".Quantity:=1;
            "Reservation Entry".INSERT;


            /*  // INSERTING JOURNAL LINE DIMENSION
              "Journal Line Dimension".INIT;
              "Journal Line Dimension"."Table ID":=83;
              "Journal Line Dimension"."Journal Template Name":='ITEM';
              "Journal Line Dimension"."Journal Batch Name":='POS-CS-SIG';
              "Journal Line Dimension"."Journal Line No.":=10000;
              "Journal Line Dimension"."Dimension Code":='LOCATIONS';
              "Journal Line Dimension"."Dimension Value Code":="Location Code";
              "Journal Line Dimension".INSERT;*/
        END ELSE
            ERROR(' ITEM WAS ALLREADY AVAILABLE IN INVENTORY');


        CODEUNIT.RUN(CODEUNIT::"Item Jnl.-Post", "Item Journal Line");

    end;


    procedure ICNNO(DT: Date) ICN: Code[10];
    var
        Dat: Text[30];
        Mon: Text[30];
        Year: Text[30];
    begin
        IF DATE2DMY(DT, 1) < 10 THEN
            Dat := '0' + FORMAT(DATE2DMY(DT, 1))
        ELSE
            Dat := FORMAT(DATE2DMY(DT, 1));

        IF DATE2DMY(DT, 2) < 10 THEN
            Mon := '0' + FORMAT(DATE2DMY(DT, 2))
        ELSE
            Mon := FORMAT(DATE2DMY(DT, 2));

        //IF DATE2DMY(DT,2) < 10 THEN
        Year := COPYSTR(FORMAT(DATE2DMY(DT, 3)), 3, 2);
        ICN := Dat + Mon + Year;
        EXIT(ICN);
    end;


    procedure Item_Positive_Adjustment1("Item No.": Code[20]; "Serial No.": Text; "Location Code": Code[10]; DocumentNo: Code[30]; ItmQty: Decimal);
    var
        "Item Journal Line": Record "Item Journal Line";
        "Reservation Entry": Record "Reservation Entry";
        "Reservation Entry1": Record "Reservation Entry";
        NoSeriesMgt: Codeunit 396;
        "Item Ledger Entry": Record "Item Ledger Entry";
    begin
        //Deleted Var (Journal Line DimensionRecordTable356) B2B
        "Item Ledger Entry".RESET;
        "Item Ledger Entry".SETCURRENTKEY("Item Ledger Entry"."Item No.",
                                          "Item Ledger Entry"."Lot No.",
                                          "Item Ledger Entry"."Serial No.");
        "Item Ledger Entry".SETRANGE("Item Ledger Entry"."Item No.", "Item No.");
        "Item Ledger Entry".SETFILTER("Item Ledger Entry"."Serial No.", "Serial No.");
        "Item Ledger Entry".SETFILTER("Item Ledger Entry"."Remaining Quantity", '>%1', 0);
        IF NOT "Item Ledger Entry".FIND('-') THEN BEGIN
            // INSERTING RECORD IN ITEM JOURNAL LINE
            "Item Journal Line".INIT;
            "Item Journal Line"."Journal Template Name" := 'ITEM';
            "Item Journal Line"."Journal Batch Name" := 'POS-CS-SIG';
            "Item Journal Line"."Entry Type" := "Item Journal Line"."Entry Type"::"Positive Adjmt.";
            "Item Journal Line"."Line No." := 10000;
            "Item Journal Line"."Source Code" := 'ITEMJNL';
            //"Item Journal Line"."Serial No.":="Serial No.";
            //"Item Journal Line"."Lot No.":=ICNNO(TODAY)+'SA01';
            "Item Journal Line"."Document No." := NoSeriesMgt.GetNextNo('POS-ADJ-CS', TODAY, FALSE);
            "Item Journal Line".VALIDATE("Item Journal Line"."Item No.", "Item No.");
            "Item Journal Line".VALIDATE(Quantity, ItmQty);
            "Item Journal Line".VALIDATE("Location Code", 'CS');
            "Item Journal Line".VALIDATE("Shortcut Dimension 2 Code", "Location Code");
            "Item Journal Line"."User ID" := USERID;
            "Item Journal Line"."Document Date" := TODAY;
            "Item Journal Line".INSERT;


            // INSERTING RECORD IN RESERVATION ENTRY
            ILE1.RESET;
            ILE1.SETFILTER(ILE1."Document No.", DocumentNo);
            ILE1.SETFILTER(ILE1."Item No.", "Item No.");
            IF ILE1.FINDFIRST THEN
                REPEAT
                    ILE21.RESET;
                    ILE21.SETFILTER(ILE21."Item No.", ILE1."Item No.");
                    ILE21.SETFILTER(ILE21."Serial No.", ILE1."Serial No.");
                    ILE21.SETFILTER(ILE21."Lot No.", ILE1."Lot No.");
                    ILE21.SETRANGE(ILE21."Posting Date", ILE1."Posting Date");
                    ILE21.SETRANGE(ILE21."Entry Type", ILE21."Entry Type"::"Positive Adjmt.");
                    ILE21.SETRANGE(ILE21."Location Code", 'CS');
                    ILE21.SETRANGE(ILE21."Global Dimension 2 Code", 'H-OFF');
                    // IF NOT (ILE2.COUNT=2) THEN
                    IF ILE21.FINDFIRST THEN
                        MESSAGE('The Item ' + ILE1."Item No." + ' are already moved to CS location')
                    ELSE BEGIN
                        "Reservation Entry".INIT;
                        IF "Reservation Entry1".FIND('+') THEN
                            "Reservation Entry"."Entry No." := "Reservation Entry1"."Entry No." + 1;
                        "Reservation Entry".VALIDATE("Item No.", "Item No.");
                        "Reservation Entry".VALIDATE("Location Code", 'CS');
                        "Reservation Entry".VALIDATE("Quantity (Base)", 1);
                        "Reservation Entry"."Reservation Status" := "Reservation Entry"."Reservation Status"::Prospect;
                        "Reservation Entry"."Creation Date" := TODAY;
                        "Reservation Entry"."Source Type" := 83;
                        "Reservation Entry"."Source Subtype" := 2;
                        "Reservation Entry"."Source ID" := 'ITEM';
                        "Reservation Entry"."Source Batch Name" := 'POS-CS-SIG';
                        "Reservation Entry"."Source Ref. No." := 10000;
                        "Reservation Entry"."Created By" := 'SUPER';
                        "Reservation Entry".Positive := TRUE;
                        "Reservation Entry"."Expected Receipt Date" := TODAY;
                        "Reservation Entry".VALIDATE("Serial No.", ILE1."Serial No.");
                        "Reservation Entry"."Lot No." := ICNNO(TODAY) + 'SA01';
                        //"Reservation Entry".Quantity:=1;
                        "Reservation Entry".INSERT;
                    END;
                UNTIL ILE1.NEXT = 0;


            /*  // INSERTING JOURNAL LINE DIMENSION
            "Journal Line Dimension".INIT;
            "Journal Line Dimension"."Table ID":=83;
            "Journal Line Dimension"."Journal Template Name":='ITEM';
            "Journal Line Dimension"."Journal Batch Name":='POS-CS-SIG';
            "Journal Line Dimension"."Journal Line No.":=10000;
            "Journal Line Dimension"."Dimension Code":='LOCATIONS';
            "Journal Line Dimension"."Dimension Value Code":="Location Code";
            "Journal Line Dimension".INSERT;
            */
        END ELSE
            ERROR(' ITEM WAS ALLREADY AVAILABLE IN INVENTORY');

        CODEUNIT.RUN(CODEUNIT::"Item Jnl.-Post", "Item Journal Line");

    end;
}

