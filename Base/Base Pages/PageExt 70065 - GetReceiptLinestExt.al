pageextension 70065 GetReceiptLinestExt extends "Get Receipt Lines"
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


        //Unsupported feature: Change Lookup on "Control 29". Please convert manually.


        //Unsupported feature: Change DrillDown on "Control 29". Please convert manually.


        //Unsupported feature: Change Name on "Control 29". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 29". Please convert manually.


        //Unsupported feature: Change Name on "Control 14". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 14". Please convert manually.


        //Unsupported feature: Change Name on "Control 16". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 16". Please convert manually.


        //Unsupported feature: Change Name on "Control 18". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 18". Please convert manually.


        //Unsupported feature: Change Name on "Control 24". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 24". Please convert manually.


        //Unsupported feature: Change Name on "Control 26". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 26". Please convert manually.


        //Unsupported feature: Change Name on "Control 32". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 32". Please convert manually.


        //Unsupported feature: Change Name on "Control 22". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 22". Please convert manually.


        //Unsupported feature: Change Name on "Control 34". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 34". Please convert manually.


        //Unsupported feature: Change Name on "Control 36". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 36". Please convert manually.


        //Unsupported feature: Change Name on "Control 38". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 38". Please convert manually.


        //Unsupported feature: Change Name on "Control 40". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 40". Please convert manually.


        //Unsupported feature: Change Name on "Control 20". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 20". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900000007". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900383207". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905767507". Please convert manually.

        addfirst("Control 1")
        {
            field("Order No."; "Order No.")
            {
            }
        }
        addafter("Control 4")
        {
            field("Pay-to Vendor No."; "Pay-to Vendor No.")
            {
            }
        }
        addafter("Control 34")
        {
            field("Item QC Status"; Inwardstatus)
            {
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000003". Please convert manually.


        //Unsupported feature: Change Name on "Action 45". Please convert manually.


        //Unsupported feature: Change Name on "Action 46". Please convert manually.


        //Unsupported feature: Change AccessByPermission on "Action 47". Please convert manually.


        //Unsupported feature: Change Name on "Action 47". Please convert manually.


        //Unsupported feature: Change Name on "Action 28". Please convert manually.

    }


    //Unsupported feature: PropertyModification on "IsFirstDocLine(PROCEDURE 2).PurchRcptLine(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //IsFirstDocLine : 121;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //IsFirstDocLine : "Purch. Rcpt. Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "PurchHeader(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //PurchHeader : 38;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PurchHeader : "Purchase Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "PurchRcptHeader(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //PurchRcptHeader : 120;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PurchRcptHeader : "Purch. Rcpt. Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "TempPurchRcptLine(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //TempPurchRcptLine : 121;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TempPurchRcptLine : "Purch. Rcpt. Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GetReceipts(Variable 1003)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GetReceipts : 74;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GetReceipts : "Purch.-Get Receipt";
    //Variable type has not been exported.

    var
        Inwardstatus: Text;
        IRH: Record "Inspection Receipt Header";
        IDS: Record "Inspection Datasheet Header";


    //Unsupported feature: CodeModification on "OnAfterGetRecord". Please convert manually.

    //trigger OnAfterGetRecord();
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Document No.HideValue" := FALSE;
    DocumentNoOnFormat;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    "Document No.HideValue" := FALSE;
    DocumentNoOnFormat;

    //added by vishnu priya on 06-01-2020
        IDS.RESET;
        IDS.SETFILTER("Receipt No.",Rec."Document No.");
        IDS.SETFILTER("Item No.",Rec."No.");
        IF IDS.FINDSET THEN
          Inwardstatus := 'IN IDS'
        ELSE
          BEGIN
            IRH.RESET;
            IRH.SETFILTER("Receipt No.",Rec."Document No.");
            IRH.SETFILTER(Status,FORMAT(0));
            IRH.SETFILTER("Source Type",FORMAT(0));
            IRH.SETFILTER("Item No.",Rec."No.");
            IF IRH.FINDSET THEN
              Inwardstatus := 'IN IR'
            ELSE
               Inwardstatus := 'Completed';
           END;
      // end by vishnu priya on 06-01-2020
    */
    //end;

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

