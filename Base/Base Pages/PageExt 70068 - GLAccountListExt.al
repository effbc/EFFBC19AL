pageextension 70068 GLAccountListExt extends "G/L Account List"
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


        //Unsupported feature: Change Name on "Control 8". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 8". Please convert manually.


        //Unsupported feature: Change Name on "Control 10". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 10". Please convert manually.


        //Unsupported feature: Change Name on "Control 25". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 25". Please convert manually.


        //Unsupported feature: Change Name on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 12". Please convert manually.


        //Unsupported feature: Change Name on "Control 21". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 21". Please convert manually.


        //Unsupported feature: Change Name on "Control 26". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 26". Please convert manually.


        //Unsupported feature: Change Name on "Control 30". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 30". Please convert manually.


        //Unsupported feature: Change Name on "Control 14". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 14". Please convert manually.


        //Unsupported feature: Change Name on "Control 3". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 3". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900000007". Please convert manually.


        //Unsupported feature: Change SubPageLink on "Control 1905532107". Please convert manually.


        //Unsupported feature: Change PagePartID on "Control 1905532107". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905532107". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900383207". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905767507". Please convert manually.

        addafter("Control 6")
        {
            field("Search Name"; "Search Name")
            {
            }
        }
        addafter("Control 3")
        {
            field("Cash Account"; "Cash Account")
            {
            }
            field("TDS Account"; "TDS Account")
            {
            }
            field("Work Tax Account"; "Work Tax Account")
            {
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000003". Please convert manually.


        //Unsupported feature: Change Name on "Action 18". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 23". Please convert manually.


        //Unsupported feature: Change Name on "Action 23". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 20". Please convert manually.


        //Unsupported feature: Change RunPageLink on "Action 20". Please convert manually.


        //Unsupported feature: Change Name on "Action 20". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 84". Please convert manually.


        //Unsupported feature: Change RunPageLink on "Action 84". Please convert manually.


        //Unsupported feature: Change Name on "Action 84". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 132". Please convert manually.


        //Unsupported feature: Change RunPageLink on "Action 132". Please convert manually.


        //Unsupported feature: Change Name on "Action 132". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 22". Please convert manually.


        //Unsupported feature: Change Name on "Action 22". Please convert manually.


        //Unsupported feature: Change Name on "Action 33". Please convert manually.


        //Unsupported feature: Change Name on "Action 118". Please convert manually.

        modify("Action 32")
        {

            //Unsupported feature: Change RunObject on "Action 32". Please convert manually.


            //Unsupported feature: Change RunPageLink on "Action 32". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 32". Please convert manually.

        }
        modify("Action 126")
        {

            //Unsupported feature: Change RunObject on "Action 126". Please convert manually.


            //Unsupported feature: Change RunPageOnRec on "Action 126". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 126". Please convert manually.

        }
        modify("Action 120")
        {

            //Unsupported feature: Change RunObject on "Action 120". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 120". Please convert manually.

        }

        //Unsupported feature: Change Name on "Action 1900000006". Please convert manually.

        modify("Action 1904082706")
        {

            //Unsupported feature: Change RunObject on "Action 1904082706". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 1904082706". Please convert manually.

        }
        modify("Action 1902174606")
        {

            //Unsupported feature: Change RunObject on "Action 1902174606". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 1902174606". Please convert manually.

        }
        modify("Action 1900670506")
        {

            //Unsupported feature: Change RunObject on "Action 1900670506". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 1900670506". Please convert manually.

        }
    }


    //Unsupported feature: PropertyModification on "Action 33.OnAction.CalcGLAccWhereUsed(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Action 33.OnAction.CalcGLAccWhereUsed : 100;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Action 33.OnAction.CalcGLAccWhereUsed : "Calc. G/L Acc. Where-Used";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GetSelectionFilter(PROCEDURE 3).GLAcc(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GetSelectionFilter : 15;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GetSelectionFilter : "G/L Account";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GetSelectionFilter(PROCEDURE 3).SelectionFilterManagement(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GetSelectionFilter : 46;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GetSelectionFilter : SelectionFilterManagement;
    //Variable type has not been exported.

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

