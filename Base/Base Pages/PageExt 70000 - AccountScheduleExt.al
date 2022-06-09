pageextension 70000 AccountScheduleExt extends "Account Schedule"
{
    // version NAVW19.00.00.45778

    layout
    {

        //Unsupported feature: Change Name on "Control 1900000001". Please convert manually.


        //Unsupported feature: Change Lookup on "Control 18". Please convert manually.


        //Unsupported feature: Change Name on "Control 18". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 18". Please convert manually.

       modify("Control1")
        {

            //Unsupported feature: Change Name on "Control 1". Please convert manually.


            //Unsupported feature: Change Editable on "Control 1". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change Name on "Control 2". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 2". Please convert manually.


        //Unsupported feature: Change Name on "Control 4". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 4". Please convert manually.


        //Unsupported feature: Change Name on "Control 6". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 8". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 8". Please convert manually.


        //Unsupported feature: Change Name on "Control 33". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 33". Please convert manually.


        //Unsupported feature: Change Name on "Control 35". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 35". Please convert manually.


        //Unsupported feature: Change Name on "Control 41". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 41". Please convert manually.


        //Unsupported feature: Change Name on "Control 43". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 43". Please convert manually.


        //Unsupported feature: Change Name on "Control 45". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 45". Please convert manually.


        //Unsupported feature: Change Name on "Control 47". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 47". Please convert manually.


        //Unsupported feature: Change Name on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 12". Please convert manually.


        //Unsupported feature: Change Name on "Control 20". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 20". Please convert manually.


        //Unsupported feature: Change Name on "Control 25". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 25". Please convert manually.


        //Unsupported feature: Change Name on "Control 28". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 28". Please convert manually.


        //Unsupported feature: Change Name on "Control 9". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 9". Please convert manually.


        //Unsupported feature: Change Name on "Control 31". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 31". Please convert manually.


        //Unsupported feature: Change Name on "Control 10". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 10". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900000007". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900383207". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905767507". Please convert manually.

        addafter("Control 6")
        {
            field("Dimension 1 Filter"; "Dimension 1 Filter")
            {
            }
            field("Dimension 2 Filter"; "Dimension 2 Filter")
            {
            }
            field("Dimension 3 Filter"; "Dimension 3 Filter")
            {
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000003". Please convert manually.


        //Unsupported feature: Change Name on "Action 26". Please convert manually.

        modify(Overview)
        {

            //Unsupported feature: Change Ellipsis on "Overview(Action 29)". Please convert manually.

            Promoted = true;
            PromotedIsBig = true;
        }

        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.


        //Unsupported feature: Change Name on "Action 15". Please convert manually.


        //Unsupported feature: Change Ellipsis on "InsertGLAccounts(Action 7)". Please convert manually.


        //Unsupported feature: Change Ellipsis on "InsertCFAccounts(Action 5)". Please convert manually.


        //Unsupported feature: Change Ellipsis on "InsertCostTypes(Action 3)". Please convert manually.


        //Unsupported feature: Change Ellipsis on "EditColumnLayoutSetup(Action 24)". Please convert manually.


        //Unsupported feature: Change RunObject on "EditColumnLayoutSetup(Action 24)". Please convert manually.

        modify("Action 22")
        {

            //Unsupported feature: Change Ellipsis on "Action 22". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 22". Please convert manually.

        }
    }


    //Unsupported feature: PropertyModification on "Overview(Action 29).OnAction.AccSchedOverview(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Overview : 490;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Overview : "Acc. Schedule Overview";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "InsertGLAccounts(Action 7).OnAction.AccSchedLine(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //InsertGLAccounts : 85;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //InsertGLAccounts : "Acc. Schedule Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "InsertCFAccounts(Action 5).OnAction.AccSchedLine(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //InsertCFAccounts : 85;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //InsertCFAccounts : "Acc. Schedule Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "InsertCostTypes(Action 3).OnAction.AccSchedLine(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //InsertCostTypes : 85;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //InsertCostTypes : "Acc. Schedule Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Action 22.OnAction.AccSchedName(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Action 22.OnAction.AccSchedName : 84;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Action 22.OnAction.AccSchedName : "Acc. Schedule Name";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Action 22.OnAction.AccSched(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Action 22.OnAction.AccSched : 25;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Action 22.OnAction.AccSched : "Account Schedule";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "AccSchedManagement(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //AccSchedManagement : 8;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AccSchedManagement : AccSchedManagement;
    //Variable type has not been exported.

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

