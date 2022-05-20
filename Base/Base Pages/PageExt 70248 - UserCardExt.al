pageextension 70248 UserCardExt extends "User Card"
{
    // version NAVW19.00.00.48992,Rev01

    layout
    {

        //Unsupported feature: Change Name on "Control 1". Please convert manually.


        //Unsupported feature: Change Name on "Control 3". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 3". Please convert manually.


        //Unsupported feature: Change Name on "Control 4". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 4". Please convert manually.


        //Unsupported feature: Change Name on "Control 5". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 5". Please convert manually.


        //Unsupported feature: Change Name on "Control 8". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 8". Please convert manually.


        //Unsupported feature: Change Name on "Control 6". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 13". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 13". Please convert manually.


        //Unsupported feature: Change Name on "Control 29". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 29". Please convert manually.


        //Unsupported feature: Change Name on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on ""Windows User Name"(Control 7)". Please convert manually.


        //Unsupported feature: Change DrillDown on "Control 22". Please convert manually.


        //Unsupported feature: Change AssistEdit on "Control 22". Please convert manually.


        //Unsupported feature: Change Name on "Control 22". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 22". Please convert manually.


        //Unsupported feature: Change AssistEdit on "Control 25". Please convert manually.


        //Unsupported feature: Change Name on "Control 25". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 25". Please convert manually.


        //Unsupported feature: Change Name on "Control 26". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 26". Please convert manually.


        //Unsupported feature: Change AssistEdit on "Control 23". Please convert manually.


        //Unsupported feature: Change Name on "Control 23". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 23". Please convert manually.


        //Unsupported feature: Change Name on "Control 30". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 30". Please convert manually.


        //Unsupported feature: Change Name on "Control 28". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 28". Please convert manually.


        //Unsupported feature: Change ImplicitType on "AuthenticationStatus(Control 32)". Please convert manually.


        //Unsupported feature: Change PagePartID on "UserGroups(Control 33)". Please convert manually.


        //Unsupported feature: Change PagePartID on "Permissions(Control 14)". Please convert manually.


        //Unsupported feature: Change Name on "Control 16". Please convert manually.


        //Unsupported feature: Change Name on "Control 17". Please convert manually.


        //Unsupported feature: Change Name on "Control 18". Please convert manually.

        addafter("Office 365 Authentication")
        {
            group(Others)
            {
                field(levels; levels)
                {
                }
                field(Dept; Dept)
                {
                }
                field(MailID; MailID)
                {
                }
                field(Blocked; Blocked)
                {
                }
                field(EmployeeID; EmployeeID)
                {
                }
                field(Tams_Dept; Tams_Dept)
                {
                }
                field(Dimension; Dimension)
                {
                }
            }
        }
        addafter(Permissions)
        {
            group("Other Required Fields")
            {
                field("Dept."; Department)
                {
                    TableRelation = "Dimension Value".Code WHERE(Global Dimension No.=CONST(1));
                }
                field(Mobile_no; Mobile_no)
                {
                }
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 10". Please convert manually.


        //Unsupported feature: Change Name on "Action 9". Please convert manually.

        modify("Action 21")
        {
            Promoted = true;
            PromotedIsBig = true;

            //Unsupported feature: Change Name on "Action 21". Please convert manually.

        }
        modify("Action 24")
        {
            Promoted = true;
            PromotedIsBig = true;

            //Unsupported feature: Change Name on "Action 24". Please convert manually.

        }
        modify("Action 20")
        {
            Promoted = true;
            PromotedIsBig = true;

            //Unsupported feature: Change Name on "Action 20". Please convert manually.

        }
        addafter("Action 20")
        {
            action(Autofill)
            {
                Image = Apply;

                trigger OnAction();
                begin
                    //Added by Rakesh for posting the data from User table to UserSetup,Employee and Resource tables on 03-Mar-14
                    //start

                    // Data into User Setup

                    //Added by RAkesh on 15-Apr-14
                    Error_str := 'Enter the Following Fields: ';
                    IF (Department = '') THEN
                        Error_str := Error_str + 'Department; ';
                    IF ("Full Name" = '') THEN
                        Error_str := Error_str + 'Full Name; ';
                    IF (EmployeeID = '') THEN
                        Error_str := Error_str + 'EmployeeID; ';
                    /*IF (MailID = '') THEN
                      Error_str := Error_str+'MailID; ';*/  // Commented by Rakesh as trainees don't have E-mail ID

                    IF (Error_str = 'Enter the Following Fields: ') THEN BEGIN
                        IF UserSetup.GET("User Name") THEN BEGIN
                            UserSetup."Current UserId" := EmployeeID;
                            UserSetup."E-Mail" := MailID;
                            UserSetup.MODIFY;
                        END
                        ELSE BEGIN
                            UserSetup.INIT;
                            UserSetup."User ID" := "User Name";
                            UserSetup."Allow Posting From" := TODAY;
                            UserSetup."Allow Posting To" := TODAY;
                            UserSetup."Current UserId" := EmployeeID;
                            UserSetup."E-Mail" := MailID;
                            UserSetup.INSERT;
                        END;

                        // Data into Employee
                        IF EmployeeGRec.GET(EmployeeID) THEN BEGIN
                            EmployeeGRec."First Name" := "Full Name";
                            EmployeeGRec."E-Mail" := MailID;
                            EmployeeGRec."Global Dimension 1 Code" := Department;
                            EmployeeGRec."Mobile Phone No." := Mobile_no;
                            EmployeeGRec.MODIFY;
                        END
                        ELSE BEGIN
                            EmployeeGRec.INIT;
                            EmployeeGRec."No." := EmployeeID;
                            EmployeeGRec."First Name" := "Full Name";
                            EmployeeGRec."E-Mail" := MailID;
                            EmployeeGRec."Global Dimension 1 Code" := Department;
                            EmployeeGRec."Mobile Phone No." := Mobile_no;
                            EmployeeGRec.INSERT;
                        END;

                        //data into Resource
                        IF ResourceGRec.GET(EmployeeID) THEN BEGIN
                            ResourceUOM.RESET;
                            ResourceUOM.SETFILTER(ResourceUOM."Resource No.", EmployeeID);
                            ResourceUOM.SETFILTER(ResourceUOM.Code, 'HOUR');
                            IF NOT ResourceUOM.FINDFIRST THEN BEGIN
                                ResourceUOM.INIT;
                                ResourceUOM."Resource No." := EmployeeID;
                                ResourceUOM.Code := 'HOUR';
                                ResourceUOM."Qty. per Unit of Measure" := 1;
                                ResourceUOM."Related to Base Unit of Meas." := TRUE;
                                ResourceUOM.INSERT;
                            END;
                            ResourceGRec."User Id" := "User Name";
                            ResourceGRec.Name := "Full Name";
                            ResourceGRec."Search Name" := "Full Name";
                            ResourceGRec."Global Dimension 1 Code" := Department;
                            ResourceGRec."Base Unit of Measure" := 'HOUR';
                            ResourceGRec."Gen. Prod. Posting Group" := 'MISC';
                            IF (Dept = 'CS') AND (COPYSTR(Dimension, 1, 3) = 'CUS') THEN
                                ResourceGRec."VAT Prod. Posting Group" := 'NO VAT';
                            ResourceGRec.MODIFY;
                        END
                        ELSE BEGIN
                            ResourceUOM.RESET;
                            ResourceUOM.INIT;
                            ResourceUOM."Resource No." := EmployeeID;
                            ResourceUOM.Code := 'HOUR';
                            ResourceUOM."Qty. per Unit of Measure" := 1;
                            ResourceUOM."Related to Base Unit of Meas." := TRUE;
                            ResourceUOM.INSERT;

                            ResourceGRec.RESET;
                            ResourceGRec.INIT;
                            ResourceGRec."No." := EmployeeID;
                            ResourceGRec."User Id" := "User Name";
                            ResourceGRec.Name := "Full Name";
                            ResourceGRec."Search Name" := "Full Name";
                            ResourceGRec."Global Dimension 1 Code" := Department;
                            ResourceGRec."Base Unit of Measure" := 'HOUR';
                            ResourceGRec."Gen. Prod. Posting Group" := 'MISC';
                            ResourceGRec.INSERT;
                        END;
                        //MESSAGE(Department);
                        DimValue.RESET;
                        DimValue.SETFILTER(DimValue.Code, EmployeeID);
                        IF NOT DimValue.FINDFIRST THEN BEGIN
                            // Finding Last Dimenison Value ID>>
                            DimValue2.RESET;
                            DimValue2.SETCURRENTKEY("Dimension Value ID");
                            IF DimValue2.FINDLAST THEN;
                            // Finding Last Dimenison Value ID<<
                            DimValue."Dimension Code" := 'EMPLOYEE CODES';
                            DimValue.Code := EmployeeID;
                            DimValue.Name := "Full Name";
                            DimValue."Dimension Value Type" := DimValue."Dimension Value Type"::Standard;
                            DimValue."Dimension Value ID" := DimValue2."Dimension Value ID" + 1;
                            DimValue.INSERT;
                        END;
                        MESSAGE('Data Entered into User Setup, Employee, Resource Tables');
                    END
                    ELSE
                        ERROR(Error_str);
                    // end by rakesh

                end;
            }
        }
    }


    //Unsupported feature: PropertyModification on ""Windows User Name"(Control 7).OnAssistEdit.DSOP(Variable 1000)". Please convert manually.

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


    //Unsupported feature: PropertyModification on "EditWebServiceID(PROCEDURE 6).SetWebServiceAccessKey(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //EditWebServiceID : 9812;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //EditWebServiceID : "Set Web Service Access Key";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "EditNavPassword(PROCEDURE 8).SetPassword(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //EditNavPassword : 9810;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //EditNavPassword : "Set Password";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "EditACSStatus(PROCEDURE 9).UserACSSetup(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //EditACSStatus : 9811;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //EditACSStatus : "User ACS Setup";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "UserSecID(Variable 1007)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //UserSecID : 2000000120;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //UserSecID : User;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "IdentityManagement(Variable 1011)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //IdentityManagement : 9801;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //IdentityManagement : "Identity Management";
    //Variable type has not been exported.

    var
        UserSetup: Record "User Setup";
        EmployeeGRec: Record Employee;
        ResourceGRec: Record Resource;
        ResourceUOM: Record "Resource Unit of Measure";
        Department: Text[20];
        Mobile_no: Text[30];
        Error_str: Text[250];
        DimValue: Record "Dimension Value";
        DimValue2: Record "Dimension Value";


    //Unsupported feature: CodeModification on "OnAfterGetRecord". Please convert manually.

    //trigger OnAfterGetRecord();
    //>>>> ORIGINAL CODE:
    //begin
    /*
    WindowsUserName := IdentityManagement.UserName("Windows Security ID");

    TESTFIELD("User Name");
    #4..6
    ACSStatus := IdentityManagement.GetACSStatus("User Security ID");
    WebServiceExpiryDate := IdentityManagement.GetWebServiceExpiryDate("User Security ID");
    AuthenticationStatus := IdentityManagement.GetAuthenticationStatus("User Security ID");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..9
    // Added by Rakesh for automation of Dept. and Phone. no on 15-Apr-14
    // start
    IF  Department = '' THEN
    BEGIN
    EmployeeGRec.RESET;
    EmployeeGRec.SETRANGE("No.",EmployeeID);
    IF EmployeeGRec.FINDFIRST THEN
    BEGIN
      IF EmployeeGRec."Global Dimension 1 Code" <> '' THEN
        Department := EmployeeGRec."Global Dimension 1 Code";
      IF EmployeeGRec."Mobile Phone No." <> '' THEN
        Mobile_no := EmployeeGRec."Mobile Phone No.";
    END;
    END;
    // end by Rakesh
    */
    //end;


    //Unsupported feature: CodeInsertion on "OnClosePage". Please convert manually.

    //trigger OnClosePage();
    //begin
    /*
    // Rev01 >>
    {
    UserSetup.RESET;
    UserSetup.SETRANGE("User ID","User Name");
    IF NOT UserSetup.FINDFIRST THEN BEGIN

    END;
    }
    // Rev01 <<
    */
    //end;

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

