pageextension 70022 BlanketSalesOrdersExt extends "Blanket Sales Orders"
{
    // version NAVW19.00.00.45778,Rev01

    layout
    {

        //Unsupported feature: Change Name on "Control 1900000001". Please convert manually.

        modify("Control 1")
        {

            //Unsupported feature: Change Name on "Control 1". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change Name on "Control 2". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 2". Please convert manually.


        //Unsupported feature: Change Name on "Control 4". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 4". Please convert manually.


        //Unsupported feature: Change Name on "Control 6". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 17". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 17". Please convert manually.


        //Unsupported feature: Change Name on "Control 33". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 33". Please convert manually.


        //Unsupported feature: Change Name on "Control 29". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 29". Please convert manually.


        //Unsupported feature: Change Name on "Control 41". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 41". Please convert manually.


        //Unsupported feature: Change Name on "Control 13". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 13". Please convert manually.


        //Unsupported feature: Change Name on "Control 15". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 15". Please convert manually.


        //Unsupported feature: Change Name on "Control 39". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 39". Please convert manually.


        //Unsupported feature: Change Name on "Control 35". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 35". Please convert manually.


        //Unsupported feature: Change Name on "Control 159". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 159". Please convert manually.


        //Unsupported feature: Change Name on "Control 155". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 155". Please convert manually.


        //Unsupported feature: Change Name on "Control 153". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 153". Please convert manually.


        //Unsupported feature: Change Name on "Control 27". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 27". Please convert manually.


        //Unsupported feature: Change Name on "Control 23". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 23". Please convert manually.


        //Unsupported feature: Change Name on "Control 143". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 143". Please convert manually.


        //Unsupported feature: Change Name on "Control 139". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 139". Please convert manually.


        //Unsupported feature: Change Name on "Control 121". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 121". Please convert manually.


        //Unsupported feature: Change Name on "Control 119". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 119". Please convert manually.


        //Unsupported feature: Change Name on "Control 123". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 123". Please convert manually.


        //Unsupported feature: Change Name on "Control 99". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 99". Please convert manually.


        //Unsupported feature: Change Name on "Control 21". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 21". Please convert manually.


        //Unsupported feature: Change Name on "Control 11". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 11". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900000007". Please convert manually.


        //Unsupported feature: Change SubPageLink on "Control 1902018507". Please convert manually.


        //Unsupported feature: Change PagePartID on "Control 1902018507". Please convert manually.


        //Unsupported feature: Change Name on "Control 1902018507". Please convert manually.


        //Unsupported feature: Change SubPageLink on "Control 1900316107". Please convert manually.


        //Unsupported feature: Change PagePartID on "Control 1900316107". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900316107". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900383207". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905767507". Please convert manually.

        addafter("Control 6")
        {
            field(Status; Status)
            {
            }
        }
        addafter("Control 11")
        {
            field("Payment Terms Code"; "Payment Terms Code")
            {
            }
            field(Remarks; Remarks)
            {
            }
            field("Customer Posting Group"; "Customer Posting Group")
            {
            }
            group(Control1102152003)
            {
                Editable = false;
                ShowCaption = false;
                grid(Control1102152002)
                {
                    ShowCaption = false;
                    group(Control1102152001)
                    {
                        ShowCaption = false;
                        field("TotalOrders+FORMAT(Rec.COUNT)"; TotalOrders + FORMAT(Rec.COUNT))
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

        //Unsupported feature: Change Name on "Action 1900000003". Please convert manually.


        //Unsupported feature: Change Name on "Action 1102601015". Please convert manually.

        modify(Statistics)
        {
            Promoted = true;
        }

        //Unsupported feature: Change RunObject on "Action 1102601019". Please convert manually.


        //Unsupported feature: Change RunPageLink on "Action 1102601019". Please convert manually.


        //Unsupported feature: Change Name on "Action 1102601019". Please convert manually.


        //Unsupported feature: Change AccessByPermission on "Action 1102601020". Please convert manually.


        //Unsupported feature: Change Name on "Action 1102601020". Please convert manually.


        //Unsupported feature: Change Name on "Action 1102601021". Please convert manually.


        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.


        //Unsupported feature: Change Name on "Action 1102601000". Please convert manually.


        //Unsupported feature: Change Name on "Action 1102601012". Please convert manually.


        //Unsupported feature: Change Name on "Action 1102601013". Please convert manually.


        //Unsupported feature: Change Name on "Action 1102601014". Please convert manually.

        modify("Action 73")
        {
            Promoted = true;

            //Unsupported feature: Change Name on "Action 73". Please convert manually.

        }
        modify(Print)
        {

            //Unsupported feature: Change Ellipsis on "Print(Action 78)". Please convert manually.

            Promoted = true;
        }

        //Unsupported feature: Change Name on "Action 3". Please convert manually.

    }


    //Unsupported feature: PropertyModification on "Action 1102601021.OnAction.ApprovalEntries(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Action 1102601021.OnAction.ApprovalEntries : 658;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Action 1102601021.OnAction.ApprovalEntries : "Approval Entries";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Action 1102601013.OnAction.ReleaseSalesDoc(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Action 1102601013.OnAction.ReleaseSalesDoc : 414;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Action 1102601013.OnAction.ReleaseSalesDoc : "Release Sales Document";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Action 1102601014.OnAction.ReleaseSalesDoc(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Action 1102601014.OnAction.ReleaseSalesDoc : 414;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Action 1102601014.OnAction.ReleaseSalesDoc : "Release Sales Document";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Action 73.OnAction.ApprovalsMgmt(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Action 73.OnAction.ApprovalsMgmt : 1535;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Action 73.OnAction.ApprovalsMgmt : "Approvals Mgmt.";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "SendApprovalRequest(Action 1102601010).OnAction.ApprovalsMgmt(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SendApprovalRequest : 1535;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SendApprovalRequest : "Approvals Mgmt.";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CancelApprovalRequest(Action 1102601011).OnAction.ApprovalsMgmt(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CancelApprovalRequest : 1535;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CancelApprovalRequest : "Approvals Mgmt.";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "SetControlAppearance(PROCEDURE 5).ApprovalsMgmt(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SetControlAppearance : 1535;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SetControlAppearance : "Approvals Mgmt.";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "DocPrint(Variable 1102601000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //DocPrint : 229;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DocPrint : "Document-Print";
    //Variable type has not been exported.

    var
        UserMgt: Codeunit "User Setup Management";
        TotalOrders: Label '"Total Orders: "';


    //Unsupported feature: CodeModification on "OnOpenPage". Please convert manually.

    //trigger OnOpenPage();
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SetSecurityFilterOnRespCenter;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF UserMgt.GetSalesFilter <> '' THEN BEGIN
      FILTERGROUP(2);
      SETRANGE("Responsibility Center",UserMgt.GetSalesFilter);
      FILTERGROUP(0);
    END;
    //forwordtooms:='Need To Press FORWARD OMS Button';
    SetSecurityFilterOnRespCenter;
    */
    //end;

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

