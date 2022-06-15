pageextension 70079 ItemJournalBatchesExt extends "Item Journal Batches"
{
    // version NAVW17.00

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


        //Unsupported feature: Change Name on "Control 15". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 15". Please convert manually.


        //Unsupported feature: Change Name on "Control 17". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 17". Please convert manually.


        //Unsupported feature: Change Name on "Control 6". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900000007". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900383207". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905767507". Please convert manually.

        addafter("Control 6")
        {
            field("Material Issues"; "Material Issues")
            {
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.

        modify("Action 19")
        {
            Promoted = true;
            PromotedIsBig = true;

            //Unsupported feature: Change Name on "Action 19". Please convert manually.

        }

        //Unsupported feature: Change Name on "Action 11". Please convert manually.


        //Unsupported feature: Change Ellipsis on "Action 12". Please convert manually.


        //Unsupported feature: Change Name on "Action 12". Please convert manually.

        modify("Action 13")
        {

            //Unsupported feature: Change RunObject on "Action 13". Please convert manually.

            Promoted = true;
            PromotedIsBig = true;

            //Unsupported feature: Change Name on "Action 13". Please convert manually.

        }
        modify("Action 14")
        {

            //Unsupported feature: Change RunObject on "Action 14". Please convert manually.

            Promoted = true;
            PromotedIsBig = true;

            //Unsupported feature: Change Name on "Action 14". Please convert manually.

        }
    }


    //Unsupported feature: PropertyModification on "DataCaption(PROCEDURE 1).ItemJnlTemplate(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //DataCaption : 82;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DataCaption : "Item Journal Template";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ReportPrint(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ReportPrint : 228;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ReportPrint : "Test Report-Print";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ItemJnlMgt(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ItemJnlMgt : 240;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ItemJnlMgt : ItemJnlManagement;
    //Variable type has not been exported.

    //Unsupported feature: PropertyChange. Please convert manually.

}

