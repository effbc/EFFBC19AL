tableextension 70006 CustLedgerEntryExt extends "Cust. Ledger Entry"
{


    fields
    {


        field(60061; "Sale Order no"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(60062; "Customer ord No"; Code[65])
        {
            DataClassification = CustomerContent;
        }
        field(60064; "Payment Type"; Option)
        {
            OptionCaption = ',Supply Payment,AMC Amount,Final Payment,Inst.Payment,Advance,Payment Agst non-issue of C-form,SD,Retention Money,Excess';
            OptionMembers = ,"Supply Payment","AMC Amount","Final Payment","Inst.Payment",Advance,"Payment Agst non-issue of C-form",SD,"Retention Money",Excess;
            DataClassification = CustomerContent;
        }
        field(60065; "Sale Invoice No"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(60066; "invoice no"; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(60073; "DD/FDR No."; Code[20])
        {
            Description = 'Rev01';
            DataClassification = CustomerContent;
        }
        field(60074; "Payment Through"; Option)
        {
            Description = 'Rev01';
            OptionCaption = '" ,Cheque,Cash,DD,FDR,RTGS,FTT"';
            OptionMembers = " ",Cheque,Cash,DD,FDR,RTGS,FTT;
            DataClassification = CustomerContent;
        }
        field(60090; "Dimension Corrected"; Boolean)
        {
            Description = 'added  by sujani for Dimension issue clearance (B2B Assistance)';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(60091; "OLD Dim Set ID"; Integer)
        {
            Description = 'added  by sujani for Dimension issue clearance (B2B Assistance)';
            Editable = false;
            TableRelation = "Dimension Set Entry Backup2"."Dimension Set ID" WHERE("Dimension Set ID" = FIELD("OLD Dim Set ID"));
            DataClassification = CustomerContent;

            trigger OnLookup();
            begin
                //ShowDimensionsOLD;
            end;
        }
    }
    trigger OnModify()
    var
        myInt: Integer;
    begin
        // Commented by Vishnu Priya on 31-10-2020
        /* {IF UserSetupGRec.GET(USERID) THEN
         BEGIN
           IF NOT UserSetupGRec."Edit Posted Ledger Entries" THEN
             ERROR('You Dont have Permissions');
         END ELSE
           ERROR('User Setup not found. contact ERP Team');
           }*/
        // Commented by Vishnu Priya on 31-10-2020
        USER.RESET;
        USER.SETFILTER("User Name", USERID);
        IF USER.FINDFIRST THEN BEGIN
            /* IF (NOT (USER.Tams_Dept IN ['SAL', 'ERP', 'F&A'])) AND (NOT (USER."User Name" IN ['EFFTRONICS\YESU', 'EFFTRONICS\MBNAGAMANI', 'EFFTRONICS\SSIRISHA'])) THEN
                 ERROR('You don''t have Permissions');*/
        END
        ELSE
            ERROR('User not found. Contact ERP');
        //end;

    end;

    trigger OnDelete()
    var
        myInt: Integer;
    begin
        Body := '****  Auto Mail Generated From ERP  ****';
        Mail_From := 'erp@efftronics.net';
        Mail_To := 'anilkumar@efftronics.net,santhoshk@efftronics.net,swarupa@efftronics.net,sreenu@efftronics.net,phani@efftronics.net';
        // Mail_To:='santhoshk@efftronics.net';
        USER.SETRANGE(USER."User Security ID", USERID);// Changed User."User Id" to User."User Security ID" B2B
        IF USER.FIND('-') THEN
            Subject := USER."User Name" + '  is trying to Delete Customer Ledger Entry Records';// Changed User."Name" to User."User Name" B2B
                                                                                                // Email.NewCDOMessage(Mail_From, Mail_To, Subject, Body, '');
        ERROR('U Dont Have Permissions to Delete');
    end;







    var
        USER: Record User;
        Body: Text[250];
        Mail_From: Text[250];
        Mail_To: Text[250];
        Email: Codeunit EMail;
        Subject: Text[250];
        UserSetupGRec: Record "User Setup";



}

