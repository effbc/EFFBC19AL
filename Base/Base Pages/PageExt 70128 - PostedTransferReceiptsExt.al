pageextension 70128 PostedTransferReceiptsExt extends "Posted Transfer Receipts"
{
    // version NAVW19.00.00.45778

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


        //Unsupported feature: Change Name on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 12". Please convert manually.


        //Unsupported feature: Change Name on "Control 1102601001". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1102601001". Please convert manually.


        //Unsupported feature: Change Name on "Control 1102601003". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1102601003". Please convert manually.


        //Unsupported feature: Change Name on "Control 1102601005". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1102601005". Please convert manually.


        //Unsupported feature: Change Name on "Control 1102601007". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1102601007". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900000007". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900383207". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905767507". Please convert manually.

        addafter("Control 6")
        {
            field("Prod. Order No."; "Prod. Order No.")
            {
            }
            field("Prod. Order Line No."; "Prod. Order Line No.")
            {
            }
            field("Machine Center No."; "Machine Center No.")
            {
                Caption = 'Resource';
            }
            field("User ID"; "User ID")
            {
            }
            field("Due Date"; "Due Date")
            {
            }
            field("Required Date"; "Required Date")
            {
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000003". Please convert manually.


        //Unsupported feature: Change Name on "Action 17". Please convert manually.

        modify("Action 21")
        {

            //Unsupported feature: Change RunObject on "Action 21". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 21". Please convert manually.

        }

        //Unsupported feature: Change RunObject on "Action 22". Please convert manually.


        //Unsupported feature: Change RunPageLink on "Action 22". Please convert manually.


        //Unsupported feature: Change Name on "Action 22". Please convert manually.


        //Unsupported feature: Change AccessByPermission on "Action 1102601000". Please convert manually.


        //Unsupported feature: Change Name on "Action 1102601000". Please convert manually.


        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.

        modify("Action 19")
        {

            //Unsupported feature: Change Ellipsis on "Action 19". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 19". Please convert manually.

        }
        modify("Action 18")
        {
            Promoted = true;

            //Unsupported feature: Change Name on "Action 18". Please convert manually.

        }
    }


    //Unsupported feature: PropertyModification on "TransRcptHeader(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //TransRcptHeader : 5746;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TransRcptHeader : "Transfer Receipt Header";
    //Variable type has not been exported.

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

