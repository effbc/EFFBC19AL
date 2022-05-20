pageextension 70141 PurchReceiptLinesExt extends "Purch. Receipt Lines"
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


        //Unsupported feature: Change Name on "Control 52". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 52". Please convert manually.


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


        //Unsupported feature: Change Name on "Control 14". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 14". Please convert manually.


        //Unsupported feature: Change Name on "Control 16". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 16". Please convert manually.


        //Unsupported feature: Change Name on "Control 18". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 18". Please convert manually.


        //Unsupported feature: Change Name on "Control 20". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 20". Please convert manually.


        //Unsupported feature: Change Name on "Control 22". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 22". Please convert manually.


        //Unsupported feature: Change Name on "Control 24". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 24". Please convert manually.


        //Unsupported feature: Change Name on "Control 26". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 26". Please convert manually.


        //Unsupported feature: Change Name on "Control 28". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 28". Please convert manually.


        //Unsupported feature: Change Name on "Control 30". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 30". Please convert manually.


        //Unsupported feature: Change Name on "Control 32". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 32". Please convert manually.


        //Unsupported feature: Change Name on "Control 34". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 34". Please convert manually.


        //Unsupported feature: Change Name on "Control 38". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 38". Please convert manually.


        //Unsupported feature: Change Name on "Control 40". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 40". Please convert manually.


        //Unsupported feature: Change Name on "Control 42". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 42". Please convert manually.


        //Unsupported feature: Change Name on "Control 44". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 44". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900000007". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900383207". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905767507". Please convert manually.

    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000003". Please convert manually.


        //Unsupported feature: Change Name on "Action 49". Please convert manually.


        //Unsupported feature: Change Name on "Action 50". Please convert manually.


        //Unsupported feature: Change AccessByPermission on "Action 51". Please convert manually.


        //Unsupported feature: Change Name on "Action 51". Please convert manually.


        //Unsupported feature: Change Name on "Action 6500". Please convert manually.

    }

    //Unsupported feature: PropertyModification on "Action 50.OnAction.PurchRcptHeader(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Action 50.OnAction.PurchRcptHeader : 120;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Action 50.OnAction.PurchRcptHeader : "Purch. Rcpt. Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "IsFirstDocLine(PROCEDURE 2).PurchRcptLine(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //IsFirstDocLine : 121;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //IsFirstDocLine : "Purch. Rcpt. Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "FromPurchRcptLine(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //FromPurchRcptLine : 121;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //FromPurchRcptLine : "Purch. Rcpt. Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "TempPurchRcptLine(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //TempPurchRcptLine : 121;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TempPurchRcptLine : "Purch. Rcpt. Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ItemChargeAssgntPurch(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ItemChargeAssgntPurch : 5805;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ItemChargeAssgntPurch : "Item Charge Assignment (Purch)";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "AssignItemChargePurch(Variable 1003)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //AssignItemChargePurch : 5805;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AssignItemChargePurch : "Item Charge Assgnt. (Purch.)";
    //Variable type has not been exported.


    //Unsupported feature: CodeModification on "OnOpenPage". Please convert manually.

    //trigger OnOpenPage();
    //>>>> ORIGINAL CODE:
    //begin
    /*
    FILTERGROUP(2);
    SETRANGE(Type,Type::Item);
    SETFILTER(Quantity,'<>0');
    SETRANGE(Correction,FALSE);
    FILTERGROUP(0);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    FILTERGROUP(2);
    //SETRANGE(Type,Type::Item);    // Commented by Pranavi on 25-Oct-2017 for allowing
    SETFILTER(Type,'<>%1&<>%2',Type::" ",Type::"Charge (Item)");    // Added by Pranavi on 25-Oct-2017 for allowing
    #3..5
    */
    //end;

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

