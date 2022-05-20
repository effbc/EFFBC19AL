pageextension 70156 PurchaseOrdersExt extends "Purchase Orders"
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

        //Unsupported feature: Change Name on "Control 21". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 21". Please convert manually.


        //Unsupported feature: Change Name on "Control 23". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 23". Please convert manually.


        //Unsupported feature: Change Name on "Control 25". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 25". Please convert manually.


        //Unsupported feature: Change Name on "Control 2". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 2". Please convert manually.


        //Unsupported feature: Change Name on "Control 4". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 4". Please convert manually.


        //Unsupported feature: Change Name on "Control 6". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 27". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 27". Please convert manually.


        //Unsupported feature: Change Name on "Control 8". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 8". Please convert manually.


        //Unsupported feature: Change Name on "Control 10". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 10". Please convert manually.


        //Unsupported feature: Change Name on "Control 29". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 29". Please convert manually.


        //Unsupported feature: Change Name on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 12". Please convert manually.


        //Unsupported feature: Change Name on "Control 14". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 14". Please convert manually.


        //Unsupported feature: Change Name on "Control 16". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 16". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900000007". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900383207". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905767507". Please convert manually.

        addafter("Control 25")
        {
            field(Make; Make)
            {
            }
            field("Quantity Invoiced"; "Quantity Invoiced")
            {
            }
        }
        addafter("Control 2")
        {
            field("Order Date"; "Order Date")
            {
            }
        }
        addafter("Control 4")
        {
            field("Vendor Name"; "Vendor Name")
            {
            }
            field("Qty. to Receive"; "Qty. to Receive")
            {
            }
            field("Document Date"; "Document Date")
            {
            }
            field("Deviated Receipt Date"; "Deviated Receipt Date")
            {
            }
            field("Quantity Received"; "Quantity Received")
            {
            }
            field("Location Code"; "Location Code")
            {
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000003". Please convert manually.


        //Unsupported feature: Change Name on "Action 31". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 32". Please convert manually.


        //Unsupported feature: Change RunPageLink on "Action 32". Please convert manually.


        //Unsupported feature: Change Name on "Action 32". Please convert manually.


        //Unsupported feature: Change AccessByPermission on "Action 33". Please convert manually.


        //Unsupported feature: Change Name on "Action 33". Please convert manually.

        addafter("Action 33")
        {
            action(Deviations)
            {
                Caption = 'Deviations';

                trigger OnAction();
                begin
                    "Excepted Rcpt.Date Tracking".SETRANGE("Excepted Rcpt.Date Tracking"."Document No.", "Document No.");
                    "Excepted Rcpt.Date Tracking".SETRANGE("Excepted Rcpt.Date Tracking"."Document Line No.", "Line No.");
                    PAGE.RUNMODAL(60048, "Excepted Rcpt.Date Tracking");
                end;
            }
        }
    }

    var
        "Excepted Rcpt.Date Tracking": Record "Excepted Rcpt.Date Tracking";

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

