pageextension 70143 PurchaseCreditMemosExt extends "Purchase Credit Memos"
{
    // version NAVW19.00.00.46621

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


        //Unsupported feature: Change Name on "Control 13". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 13". Please convert manually.


        //Unsupported feature: Change Name on "Control 6". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 15". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 15". Please convert manually.


        //Unsupported feature: Change Name on "Control 27". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 27". Please convert manually.


        //Unsupported feature: Change Name on "Control 23". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 23". Please convert manually.


        //Unsupported feature: Change Name on "Control 35". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 35". Please convert manually.


        //Unsupported feature: Change Name on "Control 163". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 163". Please convert manually.


        //Unsupported feature: Change Name on "Control 161". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 161". Please convert manually.


        //Unsupported feature: Change Name on "Control 33". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 33". Please convert manually.


        //Unsupported feature: Change Name on "Control 29". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 29". Please convert manually.


        //Unsupported feature: Change Name on "Control 151". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 151". Please convert manually.


        //Unsupported feature: Change Name on "Control 147". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 147". Please convert manually.


        //Unsupported feature: Change Name on "Control 145". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 145". Please convert manually.


        //Unsupported feature: Change Name on "Control 21". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 21". Please convert manually.


        //Unsupported feature: Change Name on "Control 17". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 17". Please convert manually.


        //Unsupported feature: Change Name on "Control 135". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 135". Please convert manually.


        //Unsupported feature: Change Name on "Control 131". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 131". Please convert manually.


        //Unsupported feature: Change Name on "Control 113". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 113". Please convert manually.


        //Unsupported feature: Change Name on "Control 111". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 111". Please convert manually.


        //Unsupported feature: Change Name on "Control 115". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 115". Please convert manually.


        //Unsupported feature: Change Name on "Control 99". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 99". Please convert manually.


        //Unsupported feature: Change Name on "Control 31". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 31". Please convert manually.


        //Unsupported feature: Change Name on "Control 11". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 11". Please convert manually.


        //Unsupported feature: Change Name on "Control 1102601002". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1102601002". Please convert manually.


        //Unsupported feature: Change Name on "Control 1102601004". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1102601004". Please convert manually.


        //Unsupported feature: Change Name on "Control 1102601006". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1102601006". Please convert manually.


        //Unsupported feature: Change Name on "Control 1102601008". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1102601008". Please convert manually.


        //Unsupported feature: Change Name on "Control 1102601010". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1102601010". Please convert manually.


        //Unsupported feature: Change Name on "Control 1102601012". Please convert manually.


        //Unsupported feature: Change RunObject on "Control 1102601012". Please convert manually.


        //Unsupported feature: Change Name on "Control 5". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 5". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900000007". Please convert manually.


        //Unsupported feature: Change PagePartID on "IncomingDocAttachFactBox(Control 8)". Please convert manually.


        //Unsupported feature: Change ShowFilter on "IncomingDocAttachFactBox(Control 8)". Please convert manually.


        //Unsupported feature: Change SubPageLink on "Control 1901138007". Please convert manually.


        //Unsupported feature: Change PagePartID on "Control 1901138007". Please convert manually.


        //Unsupported feature: Change Name on "Control 1901138007". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900383207". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905767507". Please convert manually.

        addafter("Control 1102601012")
        {
            field("Applies-to Doc. No."; "Applies-to Doc. No.")
            {
            }
            field("Vendor Cr. Memo No."; "Vendor Cr. Memo No.")
            {
            }
        }
        addafter("Control 5")
        {
            field(Structure; Structure)
            {
            }
            field("Tarrif Heading No"; "Tarrif Heading No")
            {
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000003". Please convert manually.


        //Unsupported feature: Change Name on "Action 1102601020". Please convert manually.

        modify(Statistics)
        {
            Promoted = true;
        }

        //Unsupported feature: Change RunObject on "Action 1102601024". Please convert manually.


        //Unsupported feature: Change RunPageLink on "Action 1102601024". Please convert manually.


        //Unsupported feature: Change Name on "Action 1102601024". Please convert manually.


        //Unsupported feature: Change AccessByPermission on "Action 1102601025". Please convert manually.


        //Unsupported feature: Change Name on "Action 1102601025". Please convert manually.


        //Unsupported feature: Change Name on "Action 10". Please convert manually.


        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.


        //Unsupported feature: Change Name on "Action 7". Please convert manually.


        //Unsupported feature: Change Name on "Action 1102601000". Please convert manually.


        //Unsupported feature: Change Name on "Action 50". Please convert manually.

        modify(Post)
        {
            Promoted = true;
            PromotedIsBig = true;
        }

        //Unsupported feature: Change Ellipsis on "TestReport(Action 51)". Please convert manually.

        modify(PostAndPrint)
        {
            Promoted = true;
            PromotedIsBig = true;
        }
        modify(PostBatch)
        {

            //Unsupported feature: Change Ellipsis on "PostBatch(Action 54)". Please convert manually.

            Promoted = true;
        }
    }


    //Unsupported feature: PropertyModification on "Action 10.OnAction.ApprovalEntries(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Action 10.OnAction.ApprovalEntries : 658;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Action 10.OnAction.ApprovalEntries : "Approval Entries";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Release(Action 1102601018).OnAction.ReleasePurchDoc(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Release : 415;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Release : "Release Purchase Document";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Reopen(Action 1102601019).OnAction.ReleasePurchDoc(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Reopen : 415;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Reopen : "Release Purchase Document";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "SendApprovalRequest(Action 14).OnAction.ApprovalsMgmt(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SendApprovalRequest : 1535;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SendApprovalRequest : "Approvals Mgmt.";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CancelApprovalRequest(Action 12).OnAction.ApprovalsMgmt(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CancelApprovalRequest : 1535;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CancelApprovalRequest : "Approvals Mgmt.";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Preview(Action 9).OnAction.PurchPostYesNo(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Preview : 91;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Preview : "Purch.-Post (Yes/No)";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "OnOpenPage.PurchasesPayablesSetup(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //OnOpenPage.PurchasesPayablesSetup : 312;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //OnOpenPage.PurchasesPayablesSetup : "Purchases & Payables Setup";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "SetControlAppearance(PROCEDURE 5).ApprovalsMgmt(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SetControlAppearance : 1535;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SetControlAppearance : "Approvals Mgmt.";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ReportPrint(Variable 1102601000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ReportPrint : 228;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ReportPrint : "Test Report-Print";
    //Variable type has not been exported.

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

