pageextension 70173 RevaluationJournalExt extends "Revaluation Journal"
{
    // version NAVW19.00.00.45778,Rev01

    layout
    {

        //Unsupported feature: Change Name on "Control 1900000001". Please convert manually.


        //Unsupported feature: Change Lookup on "Control 25". Please convert manually.


        //Unsupported feature: Change Name on "Control 25". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 25". Please convert manually.

        modify("Control 1")
        {

            //Unsupported feature: Change Name on "Control 1". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change Name on "Control 2". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 2". Please convert manually.


        //Unsupported feature: Change Name on "Control 39". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 39". Please convert manually.


        //Unsupported feature: Change Name on "Control 6". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 27". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 27". Please convert manually.


        //Unsupported feature: Change Name on "Control 8". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 8". Please convert manually.


        //Unsupported feature: Change Name on "Control 63". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 63". Please convert manually.


        //Unsupported feature: Change Name on "Control 10". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 10". Please convert manually.


        //Unsupported feature: Change Name on "Control 41". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 41". Please convert manually.


        //Unsupported feature: Change Name on "Control 43". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 43". Please convert manually.


        //Unsupported feature: Change Name on "Control 37". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 37". Please convert manually.


        //Unsupported feature: Change Name on "Control 47". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 47". Please convert manually.


        //Unsupported feature: Change Name on "Control 45". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 45". Please convert manually.


        //Unsupported feature: Change Name on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 12". Please convert manually.


        //Unsupported feature: Change Name on "Control 67". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 67". Please convert manually.


        //Unsupported feature: Change Name on "Control 16". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 16". Please convert manually.


        //Unsupported feature: Change Name on "Control 4". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 4". Please convert manually.


        //Unsupported feature: Change Name on "Control 83". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 83". Please convert manually.


        //Unsupported feature: Change Name on "Control 49". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 49". Please convert manually.


        //Unsupported feature: Change Name on "Control 85". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 85". Please convert manually.


        //Unsupported feature: Change Name on "Control 20". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 20". Please convert manually.


        //Unsupported feature: Change Name on "Control 59". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 59". Please convert manually.


        //Unsupported feature: Change Name on "Control 61". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 61". Please convert manually.


        //Unsupported feature: Change TableRelation on "Control 300". Please convert manually.


        //Unsupported feature: Change Name on "Control 300". Please convert manually.


        //Unsupported feature: Change TableRelation on "Control 302". Please convert manually.


        //Unsupported feature: Change Name on "Control 302". Please convert manually.


        //Unsupported feature: Change TableRelation on "Control 304". Please convert manually.


        //Unsupported feature: Change Name on "Control 304". Please convert manually.


        //Unsupported feature: Change TableRelation on "Control 306". Please convert manually.


        //Unsupported feature: Change Name on "Control 306". Please convert manually.


        //Unsupported feature: Change TableRelation on "Control 308". Please convert manually.


        //Unsupported feature: Change Name on "Control 308". Please convert manually.


        //Unsupported feature: Change TableRelation on "Control 310". Please convert manually.


        //Unsupported feature: Change Name on "Control 310". Please convert manually.

        modify("Control 22")
        {

            //Unsupported feature: Change Name on "Control 22". Please convert manually.

            ShowCaption = false;
        }
        modify("Control 1900669001")
        {

            //Unsupported feature: Change Name on "Control 1900669001". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change Name on "Control 1901652601". Please convert manually.


        //Unsupported feature: Change Name on "Control 23". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 23". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900000007". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900383207". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905767507". Please convert manually.

        addafter("Control 1901652601")
        {
            group("Work Date")
            {
                Caption = 'Work Date';
                field(WorkDate; WORKDATE)
                {
                    Editable = false;
                }
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000003". Please convert manually.


        //Unsupported feature: Change Name on "Action 81". Please convert manually.


        //Unsupported feature: Change AccessByPermission on "Action 82". Please convert manually.


        //Unsupported feature: Change Name on "Action 82". Please convert manually.


        //Unsupported feature: Change Name on "Action 29". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 30". Please convert manually.


        //Unsupported feature: Change Name on "Action 30". Please convert manually.

        modify("Action 31")
        {

            //Unsupported feature: Change RunObject on "Action 31". Please convert manually.

            Promoted = false;

            //Unsupported feature: Change Name on "Action 31". Please convert manually.

        }
        modify("Action 73")
        {

            //Unsupported feature: Change RunObject on "Action 73". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 73". Please convert manually.

        }

        //Unsupported feature: Change Name on "Action 77". Please convert manually.


        //Unsupported feature: Change Name on "Action 5". Please convert manually.


        //Unsupported feature: Change Name on "Action 78". Please convert manually.


        //Unsupported feature: Change Name on "Action 79". Please convert manually.


        //Unsupported feature: Change AccessByPermission on "Action 76". Please convert manually.


        //Unsupported feature: Change Name on "Action 76". Please convert manually.


        //Unsupported feature: Change Name on "Action 3". Please convert manually.


        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.


        //Unsupported feature: Change Name on "Action 71". Please convert manually.

        modify("Action 14")
        {

            //Unsupported feature: Change Ellipsis on "Action 14". Please convert manually.


            //Unsupported feature: Change RunObject on "Action 14". Please convert manually.

            Promoted = true;
            PromotedIsBig = true;

            //Unsupported feature: Change Name on "Action 14". Please convert manually.

        }
        modify("Action 75")
        {

            //Unsupported feature: Change Ellipsis on "Action 75". Please convert manually.

            Promoted = true;
            PromotedIsBig = true;

            //Unsupported feature: Change Name on "Action 75". Please convert manually.

        }

        //Unsupported feature: Change Name on "Action 32". Please convert manually.


        //Unsupported feature: Change Ellipsis on "Action 33". Please convert manually.


        //Unsupported feature: Change Name on "Action 33". Please convert manually.

        modify("Action 34")
        {
            Promoted = true;
            PromotedIsBig = true;

            //Unsupported feature: Change Name on "Action 34". Please convert manually.

        }
        modify("Action 35")
        {
            Promoted = true;
            PromotedIsBig = true;

            //Unsupported feature: Change Name on "Action 35". Please convert manually.

        }
    }


    //Unsupported feature: PropertyModification on "Action 75.OnAction.ObjTransl(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Action 75.OnAction.ObjTransl : 377;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Action 75.OnAction.ObjTransl : "Object Translation";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CalcInvtValue(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CalcInvtValue : 5899;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CalcInvtValue : "Calculate Inventory Value";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ItemJnlMgt(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ItemJnlMgt : 240;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ItemJnlMgt : ItemJnlManagement;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ReportPrint(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ReportPrint : 228;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ReportPrint : "Test Report-Print";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ItemAvailFormsMgt(Variable 1008)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ItemAvailFormsMgt : 353;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ItemAvailFormsMgt : "Item Availability Forms Mgt";
    //Variable type has not been exported.

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

