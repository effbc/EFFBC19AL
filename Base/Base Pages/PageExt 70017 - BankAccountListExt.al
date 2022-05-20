pageextension 70017 BankAccountListExt extends "Bank Account List"
{
    // version NAVW19.00.00.45778,NAVIN9.00.00.45778,Rev01

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


        //Unsupported feature: Change Name on "Control 87". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 87". Please convert manually.


        //Unsupported feature: Change Name on "Control 89". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 89". Please convert manually.


        //Unsupported feature: Change Name on "Control 91". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 91". Please convert manually.


        //Unsupported feature: Change Name on "Control 93". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 93". Please convert manually.


        //Unsupported feature: Change Name on "Control 23". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 23". Please convert manually.


        //Unsupported feature: Change Name on "Control 105". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 105". Please convert manually.


        //Unsupported feature: Change Name on "Control 26". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 26". Please convert manually.


        //Unsupported feature: Change Name on "Control 28". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 28". Please convert manually.


        //Unsupported feature: Change Name on "Control 95". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 95". Please convert manually.


        //Unsupported feature: Change Name on "Control 97". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 97". Please convert manually.


        //Unsupported feature: Change Name on "Control 8". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 8". Please convert manually.


        //Unsupported feature: Change Name on "Control 103". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 103". Please convert manually.


        //Unsupported feature: Change Name on "Control 10". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 10". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900000007". Please convert manually.


        //Unsupported feature: Change SubPageLink on "Control 1905532107". Please convert manually.


        //Unsupported feature: Change PagePartID on "Control 1905532107". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905532107". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900383207". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905767507". Please convert manually.

        addafter("Control 4")
        {
            field(Control1000000000; Balance)
            {
                Visible = false;

                trigger OnDrillDown();
                begin
                    DrillDownBankBalance; //Rev01
                end;
            }
            field("Balance (LCY)"; "Balance (LCY)")
            {
                Visible = false;

                trigger OnDrillDown();
                begin
                    DrillDownBankBalanceLCY; //Rev01
                end;
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000003". Please convert manually.


        //Unsupported feature: Change Name on "Action 15". Please convert manually.

        modify("Action 17")
        {

            //Unsupported feature: Change RunObject on "Action 17". Please convert manually.


            //Unsupported feature: Change RunPageLink on "Action 17". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 17". Please convert manually.

        }

        //Unsupported feature: Change RunObject on "Action 18". Please convert manually.


        //Unsupported feature: Change RunPageLink on "Action 18". Please convert manually.


        //Unsupported feature: Change Name on "Action 18". Please convert manually.

        modify(PositivePayExport)
        {

            //Unsupported feature: Change RunObject on "PositivePayExport(Action 9)". Please convert manually.

            Promoted = true;
        }

        //Unsupported feature: Change Name on "Action 22". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 84". Please convert manually.


        //Unsupported feature: Change RunPageLink on "Action 84". Please convert manually.


        //Unsupported feature: Change Name on "Action 84". Please convert manually.


        //Unsupported feature: Change AccessByPermission on "Action 21". Please convert manually.


        //Unsupported feature: Change Name on "Action 21". Please convert manually.

        modify("Action 6")
        {

            //Unsupported feature: Change RunObject on "Action 6". Please convert manually.


            //Unsupported feature: Change RunPageLink on "Action 6". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 6". Please convert manually.

        }

        //Unsupported feature: Change RunObject on "Statements(Action 7)". Please convert manually.

        modify("Action 19")
        {

            //Unsupported feature: Change RunObject on "Action 19". Please convert manually.

            Promoted = false;

            //Unsupported feature: Change Name on "Action 19". Please convert manually.

        }

        //Unsupported feature: Change RunObject on "Action 20". Please convert manually.


        //Unsupported feature: Change Name on "Action 20". Please convert manually.


        //Unsupported feature: Change Name on "Action 25". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 1500000". Please convert manually.


        //Unsupported feature: Change Name on "Action 1500000". Please convert manually.


        //Unsupported feature: Change RunObject on "PagePosPayEntries(Action 5)". Please convert manually.


        //Unsupported feature: Change Name on "Action 1900000006". Please convert manually.

        modify("Action 1900670506")
        {

            //Unsupported feature: Change RunObject on "Action 1900670506". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 1900670506". Please convert manually.

        }
        modify("Action 1904208406")
        {

            //Unsupported feature: Change RunObject on "Action 1904208406". Please convert manually.

            Promoted = false;

            //Unsupported feature: Change Name on "Action 1904208406". Please convert manually.

        }
        modify("Action 1902174606")
        {

            //Unsupported feature: Change RunObject on "Action 1902174606". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 1902174606". Please convert manually.

        }
        modify("Action 1904082706")
        {

            //Unsupported feature: Change RunObject on "Action 1904082706". Please convert manually.

            Promoted = false;

            //Unsupported feature: Change Name on "Action 1904082706". Please convert manually.

        }
        modify("Action 1902971506")
        {

            //Unsupported feature: Change RunObject on "Action 1902971506". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 1902971506". Please convert manually.

        }

        //Unsupported feature: Change RunObject on "Action 3". Please convert manually.


        //Unsupported feature: Change Name on "Action 3". Please convert manually.

    }


    //Unsupported feature: PropertyModification on "Action 21.OnAction.BankAcc(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Action 21.OnAction.BankAcc : 270;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Action 21.OnAction.BankAcc : "Bank Account";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Action 21.OnAction.DefaultDimMultiple(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Action 21.OnAction.DefaultDimMultiple : 542;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Action 21.OnAction.DefaultDimMultiple : "Default Dimensions-Multiple";
    //Variable type has not been exported.

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

