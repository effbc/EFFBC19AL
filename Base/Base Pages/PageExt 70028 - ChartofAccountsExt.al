pageextension 70028 ChartofAccountsExt extends "Chart of Accounts"
{
    // version NAVW19.00.00.45778,B2B1.0

    layout
    {

        //Unsupported feature: Change Name on "Control 1900000001". Please convert manually.

        modify("Control 1")
        {

            //Unsupported feature: Change Name on "Control 1". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change Name on "Control 2". Please convert manually.


        //Unsupported feature: Change Editable on "Control 2". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 2". Please convert manually.


        //Unsupported feature: Change Name on "Control 4". Please convert manually.


        //Unsupported feature: Change Editable on "Control 4". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 4". Please convert manually.


        //Unsupported feature: Change Name on "Control 6". Please convert manually.


        //Unsupported feature: Change Editable on "Control 6". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 8". Please convert manually.


        //Unsupported feature: Change Editable on "Control 8". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 8". Please convert manually.


        //Unsupported feature: Change Name on "Control 26". Please convert manually.


        //Unsupported feature: Change Editable on "Control 26". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 26". Please convert manually.


        //Unsupported feature: Change Name on "Control 10". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 10". Please convert manually.


        //Unsupported feature: Change Name on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 12". Please convert manually.


        //Unsupported feature: Change Name on "Control 37". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 37". Please convert manually.


        //Unsupported feature: Change Name on "Control 14". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 14". Please convert manually.


        //Unsupported feature: Change Name on "Control 32". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 32". Please convert manually.


        //Unsupported feature: Change Name on "Control 44". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 44". Please convert manually.


        //Unsupported feature: Change BlankZero on "Control 16". Please convert manually.


        //Unsupported feature: Change Name on "Control 16". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 16". Please convert manually.


        //Unsupported feature: Change BlankZero on "Control 59". Please convert manually.


        //Unsupported feature: Change Name on "Control 59". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 59". Please convert manually.


        //Unsupported feature: Change BlankZero on "Control 18". Please convert manually.


        //Unsupported feature: Change Name on "Control 18". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 18". Please convert manually.


        //Unsupported feature: Change BlankZero on "Control 46". Please convert manually.


        //Unsupported feature: Change Name on "Control 46". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 46". Please convert manually.


        //Unsupported feature: Change BlankZero on "Control 48". Please convert manually.


        //Unsupported feature: Change Name on "Control 48". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 48". Please convert manually.


        //Unsupported feature: Change BlankZero on "Control 50". Please convert manually.


        //Unsupported feature: Change Name on "Control 50". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 50". Please convert manually.


        //Unsupported feature: Change Name on "Control 39". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 39". Please convert manually.


        //Unsupported feature: Change Name on "Control 41". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 41". Please convert manually.


        //Unsupported feature: Change Name on "Control 3". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 3". Please convert manually.


        //Unsupported feature: Change Name on "Control 61". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 61". Please convert manually.


        //Unsupported feature: Change Name on "Control 57". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 57". Please convert manually.


        //Unsupported feature: Change Name on "Control 7". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 7". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900000007". Please convert manually.


        //Unsupported feature: Change SubPageLink on "Control 1905532107". Please convert manually.


        //Unsupported feature: Change PagePartID on "Control 1905532107". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905532107". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900383207". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905767507". Please convert manually.

        addafter("Control 8")
        {
            field("PL Head"; "PL Head")
            {
            }
            field(Reflected_in_pl_userid; Reflected_in_pl_userid)
            {
            }
            field(Reflected_in_pl_datetime; Reflected_in_pl_datetime)
            {
            }
        }
        addafter("Control 26")
        {
            field("Debit Amount"; "Debit Amount")
            {
            }
            field("Credit Amount"; "Credit Amount")
            {
            }
        }
        addafter("Control 10")
        {
            field("Budgeted Amount"; "Budgeted Amount")
            {
            }
            field("Budget Filter"; "Budget Filter")
            {
            }
        }
        addafter("Control 18")
        {
            field("Cash Account"; "Cash Account")
            {
                Visible = false;
            }
            field("TDS Account"; "TDS Account")
            {
                Visible = false;
            }
            field("Work Tax Account"; "Work Tax Account")
            {
                Visible = false;
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000003". Please convert manually.


        //Unsupported feature: Change Name on "Action 22". Please convert manually.

        modify("Action 28")
        {

            //Unsupported feature: Change RunObject on "Action 28". Please convert manually.

            Promoted = false;

            //Unsupported feature: Change Name on "Action 28". Please convert manually.

        }

        //Unsupported feature: Change RunObject on "Action 25". Please convert manually.


        //Unsupported feature: Change RunPageLink on "Action 25". Please convert manually.


        //Unsupported feature: Change Name on "Action 25". Please convert manually.


        //Unsupported feature: Change Name on "Action 34". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 84". Please convert manually.


        //Unsupported feature: Change RunPageLink on "Action 84". Please convert manually.


        //Unsupported feature: Change Name on "Action 84". Please convert manually.


        //Unsupported feature: Change AccessByPermission on "Action 33". Please convert manually.


        //Unsupported feature: Change Name on "Action 33". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 23". Please convert manually.


        //Unsupported feature: Change RunPageLink on "Action 23". Please convert manually.


        //Unsupported feature: Change Name on "Action 23". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 27". Please convert manually.


        //Unsupported feature: Change Name on "Action 27". Please convert manually.


        //Unsupported feature: Change Name on "Action 54". Please convert manually.


        //Unsupported feature: Change Name on "Action 123". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 36". Please convert manually.


        //Unsupported feature: Change RunPageLink on "Action 36". Please convert manually.


        //Unsupported feature: Change Name on "Action 36". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 132". Please convert manually.


        //Unsupported feature: Change RunPageOnRec on "Action 132". Please convert manually.


        //Unsupported feature: Change RunPageLink on "Action 132". Please convert manually.


        //Unsupported feature: Change Name on "Action 132". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 126". Please convert manually.


        //Unsupported feature: Change Name on "Action 126". Please convert manually.


        //Unsupported feature: Change Name on "Action 52". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 53". Please convert manually.


        //Unsupported feature: Change RunPageLink on "Action 53". Please convert manually.


        //Unsupported feature: Change Name on "Action 53". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 35". Please convert manually.


        //Unsupported feature: Change RunPageOnRec on "Action 35". Please convert manually.


        //Unsupported feature: Change RunPageLink on "Action 35". Please convert manually.


        //Unsupported feature: Change Name on "Action 35". Please convert manually.


        //Unsupported feature: Change Name on "Action 55". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 56". Please convert manually.


        //Unsupported feature: Change Name on "Action 56". Please convert manually.

        modify("Action 1900210203")
        {

            //Unsupported feature: Change RunObject on "Action 1900210203". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 1900210203". Please convert manually.

        }

        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.


        //Unsupported feature: Change Name on "Action 122". Please convert manually.

        modify(IndentChartOfAccounts)
        {

            //Unsupported feature: Change RunObject on "IndentChartOfAccounts(Action 30)". Please convert manually.

            Promoted = true;
            PromotedIsBig = true;
        }

        //Unsupported feature: Change Name on "Action 40". Please convert manually.

        modify("Action 70")
        {

            //Unsupported feature: Change RunObject on "Action 70". Please convert manually.

            Promoted = true;
            PromotedIsBig = true;

            //Unsupported feature: Change Name on "Action 70". Please convert manually.

        }
        modify("Action 20")
        {

            //Unsupported feature: Change RunObject on "Action 20". Please convert manually.

            Promoted = true;
            PromotedIsBig = true;

            //Unsupported feature: Change Name on "Action 20". Please convert manually.

        }

        //Unsupported feature: Change Name on "Action 1900000006". Please convert manually.

        modify("Action 1900670506")
        {

            //Unsupported feature: Change RunObject on "Action 1900670506". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 1900670506". Please convert manually.

        }
        modify("Action 1904082706")
        {

            //Unsupported feature: Change RunObject on "Action 1904082706". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 1904082706". Please convert manually.

        }
        modify("Action 1902174606")
        {

            //Unsupported feature: Change RunObject on "Action 1902174606". Please convert manually.

            Promoted = false;

            //Unsupported feature: Change Name on "Action 1902174606". Please convert manually.

        }
        modify("Action 1900210206")
        {

            //Unsupported feature: Change RunObject on "Action 1900210206". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 1900210206". Please convert manually.

        }
        addfirst("Action 22")
        {
            action(Card)
            {
                Caption = 'Card';
                RunObject = Page "G/L Account Card";
                RunPageLink = No.=FIELD(No.),Date Filter=FIELD(Date Filter),Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter),Budget Filter=FIELD(Budget Filter),Business Unit Filter=FIELD(Business Unit Filter);
                ShortCutKey = 'Shift+F5';
            }
        }
        addafter("Action 27")
        {
            action("&MSPT Receivables-Payables")
            {
                Caption = '&MSPT Receivables-Payables';
                RunObject = Page "MSPT Receivables-Payables";
            }
        }
    }


    //Unsupported feature: PropertyModification on "Action 33.OnAction.GLAcc(Variable 1001)". Please convert manually.

    //var
        //>>>> ORIGINAL VALUE:
        //Action 33.OnAction.GLAcc : 15;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //Action 33.OnAction.GLAcc : "G/L Account";
        //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Action 33.OnAction.DefaultDimMultiple(Variable 1002)". Please convert manually.

    //var
        //>>>> ORIGINAL VALUE:
        //Action 33.OnAction.DefaultDimMultiple : 542;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //Action 33.OnAction.DefaultDimMultiple : "Default Dimensions-Multiple";
        //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Action 54.OnAction.CalcGLAccWhereUsed(Variable 1000)". Please convert manually.

    //var
        //>>>> ORIGINAL VALUE:
        //Action 54.OnAction.CalcGLAccWhereUsed : 100;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //Action 54.OnAction.CalcGLAccWhereUsed : "Calc. G/L Acc. Where-Used";
        //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "DocsWithoutIC(Action 5).OnAction.PostedDocsWithNoIncBuf(Variable 1001)". Please convert manually.

    //var
        //>>>> ORIGINAL VALUE:
        //DocsWithoutIC : 134;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //DocsWithoutIC : "Posted Docs. With No Inc. Buf.";
        //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Control 10.OnLookup.GLaccList(Variable 1000)". Please convert manually.

    //var
        //>>>> ORIGINAL VALUE:
        //Control 10.OnLookup.GLaccList : 18;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //Control 10.OnLookup.GLaccList : "G/L Account List";
        //Variable type has not been exported.

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

