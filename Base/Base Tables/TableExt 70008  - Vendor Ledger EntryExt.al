tableextension 70008 VendorLedgerEntryExt extends "Vendor Ledger Entry"
{


    fields
    {

        field(60073; "DD/FDR No."; Code[20])
        {
            Description = 'Rev01';
        }
        field(60074; "Payment Through"; Enum "VendorLedg Payment")
        {
            Description = 'Rev01';

        }
        field(60090; "Dimension Corrected"; Boolean)
        {
            Description = 'added  by sujani for Dimension issue clearance (B2B Assistance)';
            Editable = false;
        }
        field(60091; "OLD Dim Set ID"; Integer)
        {
            Description = 'added  by sujani for Dimension issue clearance (B2B Assistance)';
            Editable = false;
            TableRelation = "Dimension Set Entry Backup2"."Dimension Set ID" WHERE("Dimension Set ID" = FIELD("OLD Dim Set ID"));

            trigger OnLookup();
            begin
                ShowDimensionsOLD;
            end;
        }
    }
    trigger OnModify()
    var
        myInt: Integer;
    begin
        /*{IF UserSetupGRec.GET(USERID) THEN
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
            IF NOT (USER.Tams_Dept IN ['CRROOM', 'ERP']) THEN
                ERROR('You don''t have Permissions');
        END
        ELSE
            ERROR('User not found. Contact ERP');
    END;


    trigger OnDelete()
    var
        myInt: Integer;
    begin
        /* {     Body:='****  Auto Mail Generated From ERP  ****';
                   Mail_From:='erp@efftronics.net';
                  Mail_To:='anilkumar@efftronics.net,santhoshk@efftronics.net,swarupa@efftronics.net,sreenu@efftronics.net,phani@efftronics.net';
              
                  // Mail_To:='santhoshk@efftronics.net';
                   USER.SETRANGE(USER."User Security ID",USERID);//Changed User."User Id" to User."User Security ID" B2B
                   IF USER.FIND('-') THEN
                   Subject:=USER."User Name"+'  is trying to Delete Vendor Ledger Entry Records';//Changed User.Name to User."User Name" B2B
                   Mail.NewCDOMessage(Mail_From,Mail_To,Subject,Body,'');  }*/
        ERROR('U Dont Have Permissions to Delete');
    end;


    var
        USER: Record User;
        Body: Text[250];
        Mail_From: Text[250];
        Mail_To: Text[250];
        Mail: Codeunit Email;
        Subject: Text[250];
        UserSetupGRec: Record "User Setup";
}

