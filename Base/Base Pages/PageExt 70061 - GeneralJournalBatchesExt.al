pageextension 70061 GeneralJournalBatchesExt extends "General Journal Batches"
{
    // version NAVW19.00.00.45778,NAVIN9.00.00.45778

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


        //Unsupported feature: Change Name on "Control 11". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 11". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500000". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500000". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500002". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500002". Please convert manually.


        //Unsupported feature: Change Name on "Control 13". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 13". Please convert manually.


        //Unsupported feature: Change Name on "Control 19". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 19". Please convert manually.


        //Unsupported feature: Change Name on "Control 21". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 21". Please convert manually.


        //Unsupported feature: Change Name on "Control 6". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 25". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 25". Please convert manually.


        //Unsupported feature: Change Name on "Control 27". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 27". Please convert manually.


        //Unsupported feature: Change Name on "Control 3". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 3". Please convert manually.


        //Unsupported feature: Change Name on "Control 5". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 5". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900000007". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900383207". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905767507". Please convert manually.

    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.

        modify(EditJournal)
        {
            Promoted = true;
            PromotedIsBig = true;
        }

        //Unsupported feature: Change Name on "Action 15". Please convert manually.


        //Unsupported feature: Change Name on "Action 23". Please convert manually.


        //Unsupported feature: Change Ellipsis on "TestReport(Action 16)". Please convert manually.

        modify("Action 17")
        {

            //Unsupported feature: Change RunObject on "Action 17". Please convert manually.

            Promoted = true;
            PromotedIsBig = true;

            //Unsupported feature: Change Name on "Action 17". Please convert manually.

        }
        modify("Action 18")
        {

            //Unsupported feature: Change RunObject on "Action 18". Please convert manually.

            Promoted = true;
            PromotedIsBig = true;

            //Unsupported feature: Change Name on "Action 18". Please convert manually.

        }

        //Unsupported feature: Change Name on "Action 8". Please convert manually.

        modify("Action 7")
        {

            //Unsupported feature: Change RunObject on "Action 7". Please convert manually.

            Promoted = true;
            PromotedIsBig = true;

            //Unsupported feature: Change Name on "Action 7". Please convert manually.

        }
        modify("Action 24")
        {

            //Unsupported feature: Change RunObject on "Action 24". Please convert manually.

            Promoted = true;
            PromotedIsBig = true;

            //Unsupported feature: Change Name on "Action 24". Please convert manually.

        }
        modify("Action 9")
        {

            //Unsupported feature: Change RunObject on "Action 9". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 9". Please convert manually.

        }

        //Unsupported feature: Change Name on "Action 22". Please convert manually.

        modify("Action 20")
        {

            //Unsupported feature: Change RunObject on "Action 20". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 20". Please convert manually.

        }
        modify("Action 14")
        {

            //Unsupported feature: Change RunObject on "Action 14". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 14". Please convert manually.

        }
        modify("Action 12")
        {

            //Unsupported feature: Change RunObject on "Action 12". Please convert manually.

            Promoted = false;

            //Unsupported feature: Change Name on "Action 12". Please convert manually.

        }
        modify("Action 10")
        {

            //Unsupported feature: Change RunObject on "Action 10". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 10". Please convert manually.

        }
    }

    //Unsupported feature: PropertyModification on "DataCaption(PROCEDURE 1).GenJnlTemplate(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //DataCaption : 80;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DataCaption : "Gen. Journal Template";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ReportPrint(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ReportPrint : 228;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ReportPrint : "Test Report-Print";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GenJnlManagement(Variable 1003)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GenJnlManagement : 230;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GenJnlManagement : GenJnlManagement;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GenJnlLine(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GenJnlLine : 81;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GenJnlLine : "Gen. Journal Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GLReconcile(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GLReconcile : 345;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GLReconcile : Reconciliation;
    //Variable type has not been exported.

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

