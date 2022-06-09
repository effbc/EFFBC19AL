pageextension 70277 PostedPurchaseReceiptExt extends 136
{
    layout
    {
        modify("Pay-to Vendor No.")
        {
            trigger OnBeforeValidate()
            begin
                IF (USERID IN ['EFFTRONICS\SUJANI', 'EFFTRONICS\VISHNUPRIYA']) THEN
                    VEND.RESET;
                VEND.SETFILTER("No.", "Pay-to Vendor No.");
                IF VEND.FINDFIRST THEN BEGIN
                    "Pay-to Contact no." := VEND.Contact;
                    "Pay-to Name" := VEND.Name;
                    "Pay-to Address" := VEND.Address;
                    "Pay-to Post Code" := VEND."Post Code";
                    "Pay-to City" := VEND.City;

                END;
            end;
        }
        modify("Pay-to Post Code")
        {
            Caption = 'Pay-to Post Code/City';
        }
        modify("Ship-to Post Code")
        {
            Caption = 'Ship-to Post Code/City';
        }
        addafter("Buy-from Contact")
        {
            field("Bill Received"; "Bill Received")
            {
                trigger OnValidate()
                begin
                    IF NOT (USERID IN ['EFFTRONICS\MARY', 'EFFTRONICS\VARALAKSHMI', 'EFFTRONICS\PADMASRI', 'EFFTRONICS\PARDHU', 'EFFTRONICS\VISHNUPRIYA',
                            'EFFTRONICS\ANANDA', 'EFFTRONICS\B2BOTS', 'EFFTRONICS\PSUNITHA', 'EFFTRONICS\20TE061',
                            'EFFTRONICS\GRAVI', 'EFFTRONICS\NSUDHEER']) THEN
                        ERROR('You Do not have permission!');
                    IF "Bill Received" = "Bill Received"::"1" THEN
                        "Bill ReceivedEditable" := FALSE
                    ELSE
                        "Bill ReceivedEditable" := TRUE;
                end;
            }
            field("Created Date Time"; "Created Date Time")
            {
                Caption = 'Created Date Time';
                Editable = false;
            }
        }
        addbefore(PurchReceiptLines)
        {
            field("User ID"; "User ID")
            {
                Editable = false;
            }
        }
        addafter("Pay-to Contact")
        {
            field("Vend. Excise Inv. Date"; "Vend. Excise Inv. Date")
            {

            }
            field("Vendor Excise Invoice No."; "Vendor Excise Invoice No.")
            {

            }
        }
        addafter("Shortcut Dimension 2 Code")
        {
            field("Bill Transfered"; "Bill Transfered")
            {
                Editable = "Bill TransferedEditable";
                trigger OnValidate()
                begin
                    // TESTFIELD(USERID,93fd001);
                    IF NOT (USERID IN ['EFFTRONICS\RATNA', 'EFFTRONICS\MARY', 'EFFTRONICS\PADMASRI', 'EFFTRONICS\PARDHU',
                      'EFFTRONICS\VISHNUPRIYA', 'EFFTRONICS\ANANDA', 'EFFTRONICS\B2BOTS', 'EFFTRONICS\20TE061', 'EFFTRONICS\GRAVI', 'EFFTRONICS\NSUDHEER']) THEN
                        ERROR('You Do not have permission!');

                    IF "Bill Received" = "Bill Received"::"0" THEN
                        ERROR('Please chek on Bill Receive to Transfer');
                    /* charline := 10;
                   body := '';
                   PRL.SETRANGE(PRL."Document No.", "No.");
                   PRL.SETFILTER(PRL.Quantity, '<>%1', 0);
                   IF PRL.FINDSET THEN
                       Mail_Subject := 'Bill Transfered For Receipt ' + "No.";
                   bodies := 1;
                   body += 'Auto Mail Generated from ERP ';
                   body += FORMAT(charline);
                   body += 'DETAILS  ';
                   body += FORMAT(charline);
                   body += FORMAT(charline);
                   body += 'Receipt No.      : ' + "No.";
                   body += FORMAT(charline);
                   body += FORMAT(charline);
                   REPEAT
                       IF (STRLEN(body) > 800) THEN BEGIN
                           Mail_Body[bodies] := body;
                           bodies += 1;
                           body := '';
                       END;

                       body += 'Item Name        : ' + PRL.Description;
                       body += FORMAT(charline);
                       body += 'Quantity         : ' + FORMAT(PRL.Quantity);
                       body += FORMAT(charline);
                       body += 'Unit Of Measure  : ' + PRL."Unit of Measure";
                       body += FORMAT(charline);
                       body += 'Unit Price       : ' + FORMAT(PRL."Unit Cost");
                       body += FORMAT(charline);
                       body += FORMAT(charline);
                       IF (STRLEN(body) > 800) THEN BEGIN
                           Mail_Body[bodies] := body;
                           bodies += 1;
                           body := '';
                       END;

                   UNTIL PRL.NEXT = 0;

                   user.SETRANGE(user."User ID", USERID);
                   IF user.FINDFIRST THEN
                       "from Mail" := user.MailID;
                   "to mail" := 'dmadhavi@efftronics.com,anilkumar@efftronics.com';
                   IF ("from Mail" <> '') AND ("to mail" <> '') THEN  */
                    //  mail.NewCDOMessage("from Mail","to mail",Mail_Subject,body,'');
                    IF "Bill Transfered" = "Bill Transfered"::"1" THEN
                        "Bill TransferedEditable" := FALSE
                    ELSE
                        "Bill TransferedEditable" := TRUE;
                end;
            }
            field("Bill Transfered Date"; "Bill Transfered Date")
            {

            }
            field(Pending; Pending)
            {

            }
            field("<Vendor Order No.2>"; "Vendor Order No.")
            {

            }
            field("Currency Factor"; "Currency Factor")
            {
                Visible = true;
            }
            field("Currency Code"; "Currency Code")
            {

            }
        }
        addafter("Ship-to Contact")
        {
            field("Packint Type"; "Packint Type")
            {

            }
            field("<Created Date Time2>"; "Created Date Time")
            {

            }
        }
        addafter("Expected Receipt Date")
        {
            field(Remarks; Remarks)
            {

            }
        }
    }

    actions
    {
        addbefore("&Print")
        {
            group("I&nspection")
            {
                Caption = 'I&nspection';
                action("Inspection Data Sheets")
                {
                    Caption = 'Inspection Data Sheets';
                    RunObject = Page "Inspection Data Sheet List";
                    RunPageView = SORTING("Rework Level");
                    RunPageLink = "Order No." = FIELD("Order No.");
                }
                action("Posted Inspection Data Sheets")
                {
                    Caption = 'Posted Inspection Data Sheets';
                    RunObject = Page "Posted Inspect Data Sheet List";
                    RunPageView = SORTING("Rework Level");
                    RunPageLink = "Order No." = FIELD("Order No.");
                }
                action("I&nspection Receipts")
                {
                    Caption = 'I&nspection Receipts';
                    RunObject = Page "Inspection Receipt List";
                    RunPageView = SORTING("Rework Level");
                    RunPageLink = "Order No." = FIELD("Order No."), Status = FILTER(false);
                }
                action("Posted I&nspection Receipts")
                {
                    Caption = 'Posted I&nspection Receipts';
                    RunObject = Page "Inspection Receipt List";
                    RunPageView = SORTING("Rework Level");
                    RunPageLink = "Order No." = FIELD("Order No."), Status = FILTER(<> false);
                }
                separator(Action1102152012)
                {

                }
                action("QC Override")
                {
                    Caption = 'QC Override';
                    trigger OnAction()
                    begin
                        QcOverrideCheck := TRUE;
                        CurrPage.PurchReceiptLines.PAGE.QcOverRide;
                    end;
                }
            }
        }
        addafter("&Navigate")
        {
            action(FwdToCashFlow)
            {
                Caption = 'Forward To CashFlow';
                trigger OnAction()
                var
                    Dept: Code[10];
                    Vend: Record Vendor;
                begin
                    IF USERID IN ['EFFTRONICS\VISHNUPRIYA', 'EFFTRONICS\SUJANI'] THEN
                        SQLInt.Purch_Receipt_in_CF(Rec);
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        IF NOT (USERID IN ['EFFTRONICS\SUJANI', 'EFFTRONICS\VISHNUPRIYA', 'EFFTRONICS\B2BOTS']) THEN BEGIN
            IF "Bill Transfered" = "Bill Transfered"::"1" THEN
                "Bill TransferedEditable" := FALSE
            ELSE
                "Bill TransferedEditable" := TRUE;

            IF "Bill Received" = "Bill Received"::"1" THEN
                "Bill ReceivedEditable" := FALSE
            ELSE
                "Bill ReceivedEditable" := TRUE;
        END ELSE
            "Bill ReceivedEditable" := TRUE;
        //RESET;

        //edit resrtictins
        IF USERID IN ['EFFTRONICS\VISHNUPRIYA', 'EFFTRONICS\SUJANI', 'EFFTRONICS\ANILKUMAR', 'EFFTRONICS\B2BOTS', 'EFFTRONICS\RENUKACH'] THEN
            EditControlling := TRUE
        ELSE
            EditControlling := FALSE;
    end;

    trigger OnAfterGetRecord()
    begin
        IF NOT (USERID IN ['EFFTRONICS\SUJANI', 'EFFTRONICS\VISHNUPRIYA', 'EFFTRONICS\B2BOTS']) THEN BEGIN
            IF "Bill Transfered" = "Bill Transfered"::"1" THEN
                "Bill TransferedEditable" := FALSE
            ELSE
                "Bill TransferedEditable" := TRUE;

            IF "Bill Received" = "Bill Received"::"1" THEN
                "Bill ReceivedEditable" := FALSE
            ELSE
                "Bill ReceivedEditable" := TRUE;
        END;
    end;

    var
        "--QC--": Integer;
        InspectReportHeader: Record "Inspection Receipt Header";
        QcOverrideCheck: Boolean;
        t1: Label 'not possible';
        PRL: Record "Purch. Rcpt. Line";
        user: Record User;
        "from Mail": Text[500];
        "to mail": Text[1000];
        Mail_Subject: Text[1000];
        Mail_Body: ARRAY[5] OF Text[1000];
        mail: Codeunit 397;
        charline: Char;
        bodies: Integer;
        body: Text[1000];
        SMTPSETUP: Record "SMTP SETUP";
        AttachFileName: Text[30];

        "Bill TransferedEditable": Boolean;
        "Bill ReceivedEditable": Boolean;

        "G|l": Record "General Ledger Setup";
        PurchRcptLine: Record "Purch. Rcpt. Line";
        SQLQuery: Text;
        SQLInt: Codeunit SQLIntegration;
        VEND: Record Vendor;
        EditControlling: Boolean;

}