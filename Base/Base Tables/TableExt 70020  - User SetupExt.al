tableextension 70020 UserSetupExt extends "User Setup"
{


    fields
    {
        modify("Allow Posting To")
        {
            trigger OnAfterValidate()
            var
                myInt: Integer;
            begin
                "Restrict Store Material Issues" := false;
                /*{ Mail_From:='swarupa@efftronics.com';
                //  Mail_To:='anilkumar@efftronics.net,santhoshk@efftronics.net,swarupa@efftronics.net,sreenu
                @efftronics.net,phani@efftronics.net';
                Mail_To:='santhoshk@efftronics.com';
                USER.SETRANGE(USER."User ID",USERID);
                IF USER.FIND('-') THEN
                Subject:=USER.Name+'  is trying to changing the Posting Date';
                Mail.NewCDOMessage(Mail_From,Mail_To,Subject,Body,'');}*/
                // ERROR('U Dont Have Permissions to Delete');
                "Allow Posting to(15)" := "Allow Posting To" - 15;

            end;
        }


        field(60001; "Transfer- From Code"; Code[10])
        {
        }
        field(60002; "Transfer- To Code"; Code[10])
        {
        }
        field(60003; "Production Order"; Code[20])
        {
            TableRelation = "Production Order"."No." WHERE(Status = CONST(Released));
        }
        field(60050; "Current UserId"; Code[20])
        {
            Description = 'UserId';
        }
        field(60051; Executed; Boolean)
        {
            Description = 'UserId';
        }
        field(60052; "Edit Posted Ledger Entries"; Boolean)
        {
            Description = 'sundar';
        }
    }
    keys
    {
    }


}

