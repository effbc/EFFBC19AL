pageextension 70250 UsersExt extends Users
{
    // version NAVW19.00.00.45778

    layout
    {

        //Unsupported feature: Change Name on "Control 1". Please convert manually.


        //Unsupported feature: Change Name on "Control 3". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 3". Please convert manually.

        modify("User Name")
        {
            StyleExpr = "Valid_color";

            //Unsupported feature: Change ImplicitType on ""User Name"(Control 4)". Please convert manually.

        }

        //Unsupported feature: Change ImplicitType on ""Full Name"(Control 5)". Please convert manually.


        //Unsupported feature: Change Name on "Control 7". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 7". Please convert manually.


        //Unsupported feature: Change ImplicitType on ""Windows User Name"(Control 6)". Please convert manually.


        //Unsupported feature: Change ImplicitType on ""License Type"(Control 14)". Please convert manually.


        //Unsupported feature: Change ImplicitType on ""Authentication Email"(Control 13)". Please convert manually.


        //Unsupported feature: Change Name on "Control 8". Please convert manually.


        //Unsupported feature: Change PagePartID on "Control 18". Please convert manually.


        //Unsupported feature: Change Name on "Control 18". Please convert manually.


        //Unsupported feature: Change PagePartID on "Control 17". Please convert manually.


        //Unsupported feature: Change Name on "Control 17". Please convert manually.


        //Unsupported feature: Change PagePartID on "Control 20". Please convert manually.


        //Unsupported feature: Change Name on "Control 20". Please convert manually.


        //Unsupported feature: Change PagePartID on "Control 32". Please convert manually.


        //Unsupported feature: Change ShowFilter on "Control 32". Please convert manually.


        //Unsupported feature: Change Name on "Control 32". Please convert manually.


        //Unsupported feature: Change PagePartID on "Control 28". Please convert manually.


        //Unsupported feature: Change ShowFilter on "Control 28". Please convert manually.


        //Unsupported feature: Change Name on "Control 28". Please convert manually.


        //Unsupported feature: Change PagePartID on "Control 29". Please convert manually.


        //Unsupported feature: Change ShowFilter on "Control 29". Please convert manually.


        //Unsupported feature: Change Name on "Control 29". Please convert manually.


        //Unsupported feature: Change PagePartID on "Control 30". Please convert manually.


        //Unsupported feature: Change ShowFilter on "Control 30". Please convert manually.


        //Unsupported feature: Change Name on "Control 30". Please convert manually.


        //Unsupported feature: Change Name on "Control 11". Please convert manually.


        //Unsupported feature: Change Name on "Control 12". Please convert manually.

        addafter("User Name")
        {
            field(Tams_Dept; Tams_Dept)
            {
            }
            field(Dept; Dept)
            {
            }
        }
        addafter("Control 7")
        {
            field(levels; levels)
            {
            }
        }
        addafter("Authentication Email")
        {
            field(Blocked; Blocked)
            {
            }
            field(State; State)
            {
            }
            field(EmployeeID; EmployeeID)
            {
            }
            field(MailID; MailID)
            {
            }
            group(Control1102152012)
            {
                ShowCaption = false;
                grid(Control1102152010)
                {
                    ShowCaption = false;
                    group(Control1102152011)
                    {
                        ShowCaption = false;
                        field("xRec.COUNT"; xRec.COUNT)
                        {
                        }
                    }
                    group(Control1102152007)
                    {
                        ShowCaption = false;
                        field(Color_User; Color_User)
                        {
                            Style = StrongAccent;
                            StyleExpr = TRUE;
                        }
                    }
                }
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 10". Please convert manually.


        //Unsupported feature: Change Name on "Action 24". Please convert manually.

        modify("Action 15")
        {

            //Unsupported feature: Change RunObject on "Action 15". Please convert manually.

            Promoted = true;
            PromotedIsBig = true;

            //Unsupported feature: Change Name on "Action 15". Please convert manually.

        }

        //Unsupported feature: Change Name on "Action 25". Please convert manually.

        modify("Action 16")
        {

            //Unsupported feature: Change RunObject on "Action 16". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 16". Please convert manually.

        }
        modify("Action 9")
        {

            //Unsupported feature: Change RunObject on "Action 9". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 9". Please convert manually.

        }
        modify("Action 19")
        {

            //Unsupported feature: Change RunObject on "Action 19". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 19". Please convert manually.

        }

        //Unsupported feature: Change RunObject on "Action 23". Please convert manually.


        //Unsupported feature: Change Name on "Action 23". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 26". Please convert manually.


        //Unsupported feature: Change Name on "Action 26". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 27". Please convert manually.


        //Unsupported feature: Change Name on "Action 27". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 31". Please convert manually.


        //Unsupported feature: Change Name on "Action 31". Please convert manually.


        //Unsupported feature: Change Name on "Action 22". Please convert manually.

        modify(AddMeAsSuper)
        {
            Promoted = true;
        }
    }


    //Unsupported feature: PropertyModification on ""Windows User Name"(Control 6).OnAssistEdit.DSOP(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //"Windows User Name" : 'Microsoft.Dynamics.Nav.Management.DSObjectPickerWrapper, Version=9.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.Management.DSObjectPicker.DSObjectPickerWrapper;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //"Windows User Name" : 'Microsoft.Dynamics.Nav.Management.DSObjectPickerWrapper, Version=14.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.Management.DSObjectPicker.DSObjectPickerWrapper;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ValidateSid(PROCEDURE 1).User(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ValidateSid : 2000000120;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ValidateSid : User;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ValidateUserName(PROCEDURE 3).UserMgt(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ValidateUserName : 418;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ValidateUserName : "User Management";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "IdentityManagement(Variable 1004)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //IdentityManagement : 9801;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //IdentityManagement : "Identity Management";
    //Variable type has not been exported.

    var
        Valid_color: Text;
        EmployeeGRec: Record Employee;
        ResourceGRec: Record Resource;
        UserSetupGRec: Record "User Setup";
        Color_User: Text[100];
        User1: Record User;


    //Unsupported feature: CodeModification on "OnAfterGetRecord". Please convert manually.

    //trigger OnAfterGetRecord();
    //>>>> ORIGINAL CODE:
    //begin
    /*
    WindowsUserName := IdentityManagement.UserName("Windows Security ID");
    NoUserExists := FALSE;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    WindowsUserName := IdentityManagement.UserName("Windows Security ID");
    NoUserExists := FALSE;
    // Added by Rakesh for color indication for the user having data in all tables on 23-Apr-14
    Assign_color;
    Color_User := 'Having Details in Employee, Resource and User Setup';
    */
    //end;


    //Unsupported feature: CodeModification on "OnOpenPage". Please convert manually.

    //trigger OnOpenPage();
    //>>>> ORIGINAL CODE:
    //begin
    /*
    NoUserExists := ISEMPTY;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    NoUserExists := ISEMPTY;
    User1.RESET;
    Rec.SETRANGE(Blocked,FALSE);
    */
    //end;

    [LineStart(31889)]
    procedure Assign_color();
    begin

        EmployeeGRec.RESET;
        ResourceGRec.RESET;
        UserSetupGRec.RESET;

        IF (EmployeeGRec.GET(EmployeeID)) AND (ResourceGRec.GET(EmployeeID)) AND (UserSetupGRec.GET("User Name")) THEN
            Valid_color := 'StrongAccent'
        ELSE
            Valid_color := 'None';
    end;

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

