pageextension 70200 SalespeoplePurchasersExt extends "Salespeople/Purchasers"
{
    // version NAVW19.00.00.50221

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


        //Unsupported feature: Change Name on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 12". Please convert manually.


        //Unsupported feature: Change Name on "Control 98". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 98". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900000007". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900383207". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905767507". Please convert manually.

        addafter("Control 98")
        {
            field("Salesperson/Purchaser"; "Salesperson/Purchaser")
            {
            }
            field("Global Dimension 1 Code"; "Global Dimension 1 Code")
            {
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000003". Please convert manually.


        //Unsupported feature: Change Name on "Action 11". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 14". Please convert manually.


        //Unsupported feature: Change Name on "Action 14". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 15". Please convert manually.


        //Unsupported feature: Change Name on "Action 15". Please convert manually.


        //Unsupported feature: Change Name on "Action 26". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 18". Please convert manually.


        //Unsupported feature: Change RunPageLink on "Action 18". Please convert manually.


        //Unsupported feature: Change Name on "Action 18". Please convert manually.


        //Unsupported feature: Change AccessByPermission on "Action 27". Please convert manually.


        //Unsupported feature: Change Name on "Action 27". Please convert manually.

        modify("Action 19")
        {

            //Unsupported feature: Change RunObject on "Action 19". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 19". Please convert manually.

        }

        //Unsupported feature: Change RunObject on "Action 20". Please convert manually.


        //Unsupported feature: Change Name on "Action 20". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 21". Please convert manually.


        //Unsupported feature: Change Name on "Action 21". Please convert manually.


        //Unsupported feature: Change Name on "Action 22". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 23". Please convert manually.


        //Unsupported feature: Change Name on "Action 23". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 29". Please convert manually.


        //Unsupported feature: Change Name on "Action 29". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 24". Please convert manually.


        //Unsupported feature: Change RunPageLink on "Action 24". Please convert manually.


        //Unsupported feature: Change Name on "Action 24". Please convert manually.


        //Unsupported feature: Change Name on "Action 30". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 25". Please convert manually.


        //Unsupported feature: Change Name on "Action 25". Please convert manually.


        //Unsupported feature: Change AccessByPermission on "CRMSynchronizeNow(Action 16)". Please convert manually.


        //Unsupported feature: Change AccessByPermission on "ManageCRMCoupling(Action 10)". Please convert manually.


        //Unsupported feature: Change AccessByPermission on "DeleteCRMCoupling(Action 3)". Please convert manually.


        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.

        modify(CreateInteraction)
        {

            //Unsupported feature: Change AccessByPermission on "CreateInteraction(Action 17)". Please convert manually.


            //Unsupported feature: Change Ellipsis on "CreateInteraction(Action 17)". Please convert manually.

            Promoted = true;
        }
    }


    //Unsupported feature: PropertyModification on "Action 27.OnAction.SalespersonPurchaser(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Action 27.OnAction.SalespersonPurchaser : 13;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Action 27.OnAction.SalespersonPurchaser : "Salesperson/Purchaser";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Action 27.OnAction.DefaultDimMultiple(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Action 27.OnAction.DefaultDimMultiple : 542;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Action 27.OnAction.DefaultDimMultiple : "Default Dimensions-Multiple";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CRMGotoSystemUser(Action 9).OnAction.CRMIntegrationManagement(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CRMGotoSystemUser : 5330;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CRMGotoSystemUser : "CRM Integration Management";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CRMSynchronizeNow(Action 16).OnAction.SalespersonPurchaser(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CRMSynchronizeNow : 13;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CRMSynchronizeNow : "Salesperson/Purchaser";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CRMSynchronizeNow(Action 16).OnAction.CRMIntegrationManagement(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CRMSynchronizeNow : 5330;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CRMSynchronizeNow : "CRM Integration Management";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ManageCRMCoupling(Action 10).OnAction.CRMIntegrationManagement(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ManageCRMCoupling : 5330;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ManageCRMCoupling : "CRM Integration Management";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "DeleteCRMCoupling(Action 3).OnAction.CRMCouplingManagement(Variable 1000)". Please convert manually.

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


    //Unsupported feature: PropertyModification on "OnInit.SegmentLine(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //OnInit.SegmentLine : 5077;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //OnInit.SegmentLine : "Segment Line";
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


    //Unsupported feature: PropertyChange. Please convert manually.

}

