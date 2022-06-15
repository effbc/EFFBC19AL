page 56777 "Test - Delete"
{
    PageType = List;
    RefreshOnActivate = true;
    SourceTable = "Active Session";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("User SID"; "User SID")
                {
                }
                field("Server Instance ID"; "Server Instance ID")
                {
                }
                field("Session ID"; "Session ID")
                {
                }
                field("Server Instance Name"; "Server Instance Name")
                {
                }
                field("Server Computer Name"; "Server Computer Name")
                {
                }
                field("User ID"; "User ID")
                {
                }
                field("Client Type"; "Client Type")
                {
                }
                field("Client Computer Name"; "Client Computer Name")
                {
                }
                field("Login Datetime"; "Login Datetime")
                {
                }
                field("Database Name"; "Database Name")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Kill Session")
            {
                Caption = 'Kill Session';

                trigger OnAction();
                begin
                    IF CONFIRM('Kill session') THEN
                        STOPSESSION("Session ID")
                end;
            }
        }
    }
}

