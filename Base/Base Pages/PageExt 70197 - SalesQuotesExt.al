pageextension 70197 SalesQuotesExt extends "Sales Quotes"
{
    // version NAVW19.00.00.45778

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


        //Unsupported feature: Change Name on "Control 1102601001". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1102601001". Please convert manually.


        //Unsupported feature: Change Name on "Control 1102601003". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1102601003". Please convert manually.


        //Unsupported feature: Change Name on "Control 1102601005". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1102601005". Please convert manually.


        //Unsupported feature: Change Name on "Control 1102601007". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1102601007". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900000007". Please convert manually.


        //Unsupported feature: Change SubPageLink on "Control 1902018507". Please convert manually.


        //Unsupported feature: Change PagePartID on "Control 1902018507". Please convert manually.


        //Unsupported feature: Change Name on "Control 1902018507". Please convert manually.


        //Unsupported feature: Change SubPageLink on "Control 1900316107". Please convert manually.


        //Unsupported feature: Change PagePartID on "Control 1900316107". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900316107". Please convert manually.


        //Unsupported feature: Change PagePartID on "IncomingDocAttachFactBox(Control 8)". Please convert manually.


        //Unsupported feature: Change ShowFilter on "IncomingDocAttachFactBox(Control 8)". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900383207". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905767507". Please convert manually.

        addafter("Control 6")
        {
            field(Product; Product)
            {
            }
            field("Nature of Enquiry"; "Nature of Enquiry")
            {
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000003". Please convert manually.


        //Unsupported feature: Change Name on "Action 1102601026". Please convert manually.

        modify(Statistics)
        {
            Promoted = true;
        }

        //Unsupported feature: Change RunObject on "Action 1102601029". Please convert manually.


        //Unsupported feature: Change Name on "Action 1102601029". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 1102601030". Please convert manually.


        //Unsupported feature: Change Name on "Action 1102601030". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 1102601031". Please convert manually.


        //Unsupported feature: Change RunPageLink on "Action 1102601031". Please convert manually.


        //Unsupported feature: Change Name on "Action 1102601031". Please convert manually.


        //Unsupported feature: Change AccessByPermission on "Action 1102601032". Please convert manually.


        //Unsupported feature: Change Name on "Action 1102601032". Please convert manually.


        //Unsupported feature: Change Name on "Action 1102601033". Please convert manually.


        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.

        modify("Action 69")
        {

            //Unsupported feature: Change Ellipsis on "Action 69". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 69". Please convert manually.

        }

        //Unsupported feature: Change Name on "Action 7". Please convert manually.


        //Unsupported feature: Change Name on "Action 3". Please convert manually.


        //Unsupported feature: Change Name on "Action 1102601020". Please convert manually.


        //Unsupported feature: Change Name on "Action 1102601021". Please convert manually.


        //Unsupported feature: Change Name on "Action 5". Please convert manually.

        modify(MakeOrder)
        {
            Promoted = true;
        }

        //Unsupported feature: Change Name on "Action 1102601015". Please convert manually.


        //Unsupported feature: Change AccessByPermission on "Action 1102601025". Please convert manually.


        //Unsupported feature: Change Name on "Action 1102601025". Please convert manually.


        //Unsupported feature: Change Name on "Action 1102601000". Please convert manually.

    }


    //Unsupported feature: PropertyModification on "Action 1102601033.OnAction.ApprovalEntries(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Action 1102601033.OnAction.ApprovalEntries : 658;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Action 1102601033.OnAction.ApprovalEntries : "Approval Entries";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Action 1102601020.OnAction.ReleaseSalesDoc(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Action 1102601020.OnAction.ReleaseSalesDoc : 414;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Action 1102601020.OnAction.ReleaseSalesDoc : "Release Sales Document";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Action 1102601021.OnAction.ReleaseSalesDoc(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Action 1102601021.OnAction.ReleaseSalesDoc : 414;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Action 1102601021.OnAction.ReleaseSalesDoc : "Release Sales Document";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "MakeOrder(Action 68).OnAction.ApprovalsMgmt(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //MakeOrder : 1535;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //MakeOrder : "Approvals Mgmt.";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "SendApprovalRequest(Action 1102601017).OnAction.ApprovalsMgmt(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SendApprovalRequest : 1535;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SendApprovalRequest : "Approvals Mgmt.";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CancelApprovalRequest(Action 1102601018).OnAction.ApprovalsMgmt(Variable 1001)". Please convert manually.

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

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

