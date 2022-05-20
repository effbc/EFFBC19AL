pageextension 70201 SalespersonPurchaserCardExt extends "Salesperson/Purchaser Card"
{
    // version NAVW19.00.00.50221

    layout
    {

        //Unsupported feature: Change Name on "Control 1900000001". Please convert manually.


        //Unsupported feature: Change Name on "Control 1". Please convert manually.


        //Unsupported feature: Change Name on "Control 2". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 2". Please convert manually.


        //Unsupported feature: Change Name on "Control 4". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 4". Please convert manually.


        //Unsupported feature: Change Name on "Control 22". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 22". Please convert manually.


        //Unsupported feature: Change Name on "Control 6". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 10". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 10". Please convert manually.


        //Unsupported feature: Change Name on "Control 8". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 8". Please convert manually.


        //Unsupported feature: Change Name on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 12". Please convert manually.


        //Unsupported feature: Change Name on "Control 195". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 195". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905885101". Please convert manually.


        //Unsupported feature: Change Name on "Control 14". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 14". Please convert manually.


        //Unsupported feature: Change Name on "Control 16". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 16". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900000007". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900383207". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905767507". Please convert manually.

        addafter("Control 12")
        {
            field("Sales Person Signature"; "Sales Person Signature")
            {
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000003". Please convert manually.


        //Unsupported feature: Change Name on "Action 19". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 28". Please convert manually.


        //Unsupported feature: Change Name on "Action 28". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 25". Please convert manually.


        //Unsupported feature: Change Name on "Action 25". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 23". Please convert manually.


        //Unsupported feature: Change RunPageLink on "Action 23". Please convert manually.


        //Unsupported feature: Change Name on "Action 23". Please convert manually.

        modify("Action 21")
        {

            //Unsupported feature: Change RunObject on "Action 21". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 21". Please convert manually.

        }

        //Unsupported feature: Change RunObject on "Action 26". Please convert manually.


        //Unsupported feature: Change Name on "Action 26". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 27". Please convert manually.


        //Unsupported feature: Change Name on "Action 27". Please convert manually.


        //Unsupported feature: Change Name on "Action 33". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 32". Please convert manually.


        //Unsupported feature: Change Name on "Action 32". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 76". Please convert manually.


        //Unsupported feature: Change Name on "Action 76". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 35". Please convert manually.


        //Unsupported feature: Change RunPageLink on "Action 35". Please convert manually.


        //Unsupported feature: Change Name on "Action 35". Please convert manually.


        //Unsupported feature: Change Name on "Action 78". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 34". Please convert manually.


        //Unsupported feature: Change Name on "Action 34". Please convert manually.


        //Unsupported feature: Change AccessByPermission on "CRMSynchronizeNow(Action 20)". Please convert manually.


        //Unsupported feature: Change AccessByPermission on "ManageCRMCoupling(Action 9)". Please convert manually.


        //Unsupported feature: Change AccessByPermission on "DeleteCRMCoupling(Action 7)". Please convert manually.


        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.

        modify("Action 36")
        {

            //Unsupported feature: Change AccessByPermission on "Action 36". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 36". Please convert manually.

        }
    }


    //Unsupported feature: PropertyModification on "CRMGotoSystemUser(Action 11).OnAction.CRMIntegrationManagement(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CRMGotoSystemUser : 5330;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CRMGotoSystemUser : "CRM Integration Management";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CRMSynchronizeNow(Action 20).OnAction.CRMIntegrationManagement(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CRMSynchronizeNow : 5330;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CRMSynchronizeNow : "CRM Integration Management";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ManageCRMCoupling(Action 9).OnAction.CRMIntegrationManagement(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ManageCRMCoupling : 5330;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ManageCRMCoupling : "CRM Integration Management";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "DeleteCRMCoupling(Action 7).OnAction.CRMCouplingManagement(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //DeleteCRMCoupling : 5331;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DeleteCRMCoupling : "CRM Coupling Management";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "OnAfterGetCurrRecord.CRMCouplingManagement(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //OnAfterGetCurrRecord.CRMCouplingManagement : 5331;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //OnAfterGetCurrRecord.CRMCouplingManagement : "CRM Coupling Management";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "OnOpenPage.CRMIntegrationManagement(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //OnOpenPage.CRMIntegrationManagement : 5330;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //OnOpenPage.CRMIntegrationManagement : "CRM Integration Management";
    //Variable type has not been exported.

    //Unsupported feature: PropertyChange. Please convert manually.

}

