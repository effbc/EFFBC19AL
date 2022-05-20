pageextension 70258 WarehouseReceiptExt extends "Warehouse Receipt"
{
    // version NAVW19.00.00.45778,QC1.0

    layout
    {

        //Unsupported feature: Change Name on "Control 1900000001". Please convert manually.


        //Unsupported feature: Change Name on "Control 1". Please convert manually.


        //Unsupported feature: Change Name on "Control 2". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 2". Please convert manually.


        //Unsupported feature: Change Name on "Control 36". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 36". Please convert manually.


        //Unsupported feature: Change Name on "Control 16". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 16". Please convert manually.


        //Unsupported feature: Change Name on "Control 22". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 22". Please convert manually.


        //Unsupported feature: Change Name on "Control 38". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 38". Please convert manually.


        //Unsupported feature: Change Name on "Control 42". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 42". Please convert manually.


        //Unsupported feature: Change Name on "Control 44". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 44". Please convert manually.


        //Unsupported feature: Change Name on "Control 5". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 5". Please convert manually.


        //Unsupported feature: Change Name on "Control 15". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 15". Please convert manually.


        //Unsupported feature: Change Name on "Control 29". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 29". Please convert manually.


        //Unsupported feature: Change Name on "Control 13". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 13". Please convert manually.


        //Unsupported feature: Change PagePartID on "WhseReceiptLines(Control 97)". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900000007". Please convert manually.


        //Unsupported feature: Change PagePartID on "Control 1901796907". Please convert manually.


        //Unsupported feature: Change ProviderID on "Control 1901796907". Please convert manually.


        //Unsupported feature: Change Name on "Control 1901796907". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900383207". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905767507". Please convert manually.

    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000003". Please convert manually.


        //Unsupported feature: Change Name on "Action 100". Please convert manually.


        //Unsupported feature: Change Name on "Action 101". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 31". Please convert manually.


        //Unsupported feature: Change RunPageLink on "Action 31". Please convert manually.


        //Unsupported feature: Change Name on "Action 31". Please convert manually.

        modify("Action 6")
        {

            //Unsupported feature: Change RunObject on "Action 6". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 6". Please convert manually.

        }

        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.


        //Unsupported feature: Change Name on "Action 9". Please convert manually.

        modify("Action 34")
        {

            //Unsupported feature: Change Ellipsis on "Action 34". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 34". Please convert manually.

        }
        modify("Action 23")
        {

            //Unsupported feature: Change Ellipsis on "Action 23". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 23". Please convert manually.

        }

        //Unsupported feature: Change Name on "Action 24". Please convert manually.

        modify("Action 35")
        {
            Promoted = true;
            PromotedIsBig = true;

            //Unsupported feature: Change Name on "Action 35". Please convert manually.

        }

        //Unsupported feature: Change Name on "Action 17". Please convert manually.


        //Unsupported feature: Change Name on "Action 40". Please convert manually.

        modify(CalculateCrossDock)
        {
            Promoted = true;
        }

        //Unsupported feature: Change Name on "Action 8". Please convert manually.

        modify("Post Receipt")
        {
            Promoted = true;
            PromotedIsBig = true;
        }
        modify("Action 47")
        {
            Promoted = true;
            PromotedIsBig = true;

            //Unsupported feature: Change Name on "Action 47". Please convert manually.

        }
        modify("Action 26")
        {
            Promoted = true;
            PromotedIsBig = true;

            //Unsupported feature: Change Name on "Action 26". Please convert manually.

        }
        modify("Action 21")
        {

            //Unsupported feature: Change Ellipsis on "Action 21". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 21". Please convert manually.

        }
        addafter(CalculateCrossDock)
        {
            separator(Action1102152000)
            {
            }
        }
    }


    //Unsupported feature: PropertyModification on "Action 34.OnAction.GetSourceDocInbound(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Action 34.OnAction.GetSourceDocInbound : 5751;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Action 34.OnAction.GetSourceDocInbound : "Get Source Doc. Inbound";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Action 23.OnAction.GetSourceDocInbound(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Action 23.OnAction.GetSourceDocInbound : 5751;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Action 23.OnAction.GetSourceDocInbound : "Get Source Doc. Inbound";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CalculateCrossDock(Action 46).OnAction.CrossDockOpp(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CalculateCrossDock : 5768;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CalculateCrossDock : "Whse. Cross-Dock Opportunity";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CalculateCrossDock(Action 46).OnAction.CrossDockMgt(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CalculateCrossDock : 5780;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CalculateCrossDock : "Whse. Cross-Dock Management";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "WhseDocPrint(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //WhseDocPrint : 5776;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //WhseDocPrint : "Warehouse Document-Print";
    //Variable type has not been exported.

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

