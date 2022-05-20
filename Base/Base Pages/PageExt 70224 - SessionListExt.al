pageextension 70224 SessionListExt extends "Session List"
{
    // version NAVW19.00.00.45778

    layout
    {

        //Unsupported feature: Change Name on "Control 1". Please convert manually.


        //Unsupported feature: Change Name on "Control 3". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 3". Please convert manually.


        //Unsupported feature: Change Name on "Control 4". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 4". Please convert manually.


        //Unsupported feature: Change Name on "Control 15". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 15". Please convert manually.


        //Unsupported feature: Change ImplicitType on ""Client Type"(Control 5)". Please convert manually.


        //Unsupported feature: Change Name on "Control 6". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 14". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 14". Please convert manually.


        //Unsupported feature: Change Name on "Control 7". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 7". Please convert manually.


        //Unsupported feature: Change Editable on "Control 12". Please convert manually.


        //Unsupported feature: Change Name on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 12". Please convert manually.


        //Unsupported feature: Change Name on "Control 16". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 16". Please convert manually.

        addafter("Control 16")
        {
            field("Client Computer Name"; "Client Computer Name")
            {
                Editable = false;
            }
            field("Database Name"; "Database Name")
            {
                Editable = false;
            }
            field("Session Unique ID"; "Session Unique ID")
            {
                Editable = false;
            }
            group(Control1102152007)
            {
                Editable = false;
                ShowCaption = false;
                grid(Control1102152006)
                {
                    ShowCaption = false;
                    group(Control1102152005)
                    {
                        ShowCaption = false;
                        field("FORMAT(Rec.COUNT)"; FORMAT(Rec.COUNT))
                        {
                            Editable = false;
                        }
                    }
                }
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 9". Please convert manually.


        //Unsupported feature: Change Name on "Action 8". Please convert manually.

        modify("Debug Selected Session")
        {
            Promoted = true;
            PromotedIsBig = true;
        }
        modify("Debug Next Session")
        {
            Promoted = true;
            PromotedIsBig = true;
        }
        modify("Start Full SQL Tracing")
        {
            Promoted = true;
        }
        modify("Stop Full SQL Tracing")
        {
            Promoted = true;
        }
        modify(Subscriptions)
        {

            //Unsupported feature: Change RunObject on "Subscriptions(Action 18)". Please convert manually.

            Promoted = true;
        }
        addafter("Debug Next Session")
        {
            action("Kill Session")
            {
                Caption = 'Kill Session';
                Image = Server;

                trigger OnAction();
                begin


                    IF CONFIRM('Kill Session') THEN BEGIN
                        IF "User ID" = 'ERPSERVER\ADMINISTRATOR' THEN
                            ERROR('YOU CANT DELETE SESSION')
                        ELSE BEGIN
                            STOPSESSION("Session ID");
                            COMMIT;
                        END;
                    END;
                    //STOPSESSION("Session ID" );
                end;
            }
        }
    }


    //Unsupported feature: PropertyModification on ""Debug Next Session"(Action 10).OnAction.DebuggedSessionTemp(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //"Debug Next Session" : 2000000110;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //"Debug Next Session" : "Active Session";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "DebuggerManagement(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //DebuggerManagement : 9500;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DebuggerManagement : "Debugger Management";
    //Variable type has not been exported.

    var
        SMTP_MAIL: Codeunit "SMTP Mail";


    //Unsupported feature: CodeModification on "OnAfterGetRecord". Please convert manually.

    //trigger OnAfterGetRecord();
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IsDebugging := DEBUGGER.ISACTIVE AND ("Session ID" = DEBUGGER.DEBUGGINGSESSIONID);
    IsDebugged := DEBUGGER.ISATTACHED AND ("Session ID" = DEBUGGER.DEBUGGEDSESSIONID);
    IsSQLTracing := DEBUGGER.ENABLESQLTRACE("Session ID");
    #4..9
      SessionIdText := FORMAT("Session ID");
      ClientTypeText := FORMAT("Client Type");
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*

    #1..12
    */
    //end;


    //Unsupported feature: CodeInsertion on "OnDeleteRecord". Please convert manually.

    //trigger OnDeleteRecord() : Boolean;
    //begin
    /*
    IF ("User ID" = 'ERPSERVER\ADMINISTRATOR') AND ("Client Type" <> "Client Type"::Background) THEN
      ERROR('YOU CANT DELETE SESSION')
    ELSE
      BEGIN
        STOPSESSION("Session ID");
        COMMIT;
      END;
    */
    //end;


    //Unsupported feature: CodeModification on "OnOpenPage". Please convert manually.

    //trigger OnOpenPage();
    //>>>> ORIGINAL CODE:
    //begin
    /*
    FILTERGROUP(2);
    SETFILTER("Server Instance ID",'=%1',SERVICEINSTANCEID);
    SETFILTER("Session ID",'<>%1',SESSIONID);
    FILTERGROUP(0);

    FullSQLTracingStarted := DEBUGGER.ENABLESQLTRACE(0);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*

    IF NOT (SMTP_MAIL.Permission_Checking(USERID,'SESSIONKILLING'))
        THEN ERROR('You Don"t have Permissions '+ USERID);
    #1..6
    */
    //end;

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

