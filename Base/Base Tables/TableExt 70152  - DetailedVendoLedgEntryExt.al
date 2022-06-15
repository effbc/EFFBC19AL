tableextension 70152 DetailedVendoLedgEntryExt extends "Detailed Vendor Ledg. Entry"
{

    fields
    {

    }
    keys
    {
        key(Key12; "Vendor No.", "Posting Date", "Initial Entry Global Dim. 1", "Initial Entry Global Dim. 2", "Currency Code")
        {
            SumIndexFields = Amount, "Amount (LCY)";
        }
    }

    trigger OnModify()
    begin
        if UserSetupGRec.Get(UserId) then begin
            if not UserSetupGRec."Edit Posted Ledger Entries" then
                Error('You Dont have Permissions');
        end else
            Error('User Setup not found. contact ERP Team');
    end;

    trigger OnDelete()
    begin
        Body := '****  Auto Mail Generated From ERP  ****';
        Mail_From := 'erp@efftronics.net';
        Mail_To := 'anilkumar@efftronics.net,santhoshk@efftronics.net,swarupa@efftronics.net,sreenu@efftronics.net,phani@efftronics.net';
        // Mail_To:='santhoshk@efftronics.net';
        //USER.SETRANGE(USER."User Security ID" ,USERID);// Changed User."User Id" to User."User Security ID" B2B//UPGREV2.0
        USER.SetRange("User Name", UserId);//UPGREV2.0
        if USER.Find('-') then
            Subject := USER."User Name" + '  is trying to Delete Detailed Vendor Ledger Entry Records';// Changed User."Name" to User."User Name" B2B
        //Mail.NewCDOMessage(Mail_From, Mail_To, Subject, Body, '');
        Error('U Dont Have Permissions to Delete');
    end;

    var
        UserSetupGRec: Record "User Setup";
        USER: Record User;
        Body: Text[250];
        Mail_From: Text[250];
        Mail_To: Text[250];
        Subject: Text[250];
    //Mail: Codeunit Mail;
}

