pageextension 70090 ItemVendorCatalogExt extends "Item Vendor Catalog"
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

        //Unsupported feature: Change Name on "Control 20". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 20". Please convert manually.


        //Unsupported feature: Change Name on "Control 22". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 22". Please convert manually.


        //Unsupported feature: Change Name on "Control 2". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 2". Please convert manually.


        //Unsupported feature: Change Name on "Control 10". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 10". Please convert manually.


        //Unsupported feature: Change Name on "Control 8". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 8". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900000007". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900383207". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905767507". Please convert manually.

        addafter("Control 10")
        {
            field("Minimum Order Quantity"; "Minimum Order Quantity")
            {
            }
            field(Priority; Priority)
            {
            }
            field("Total Qty. Supplied"; "Total Qty. Supplied")
            {
            }
            field("Qty. Supplied With in DueDate"; "Qty. Supplied With in DueDate")
            {

                trigger OnDrillDown();
                var
                    PurchRcptHeader1: Record "Purch. Rcpt. Header";
                    PurchRcptLine1: Record "Purch. Rcpt. Line";
                begin
                    /*
                    PurchRcptHeader1.RESET;
                    PurchRcptHeader1.SETRANGE("Buy-from Vendor No.","Vendor No.");
                    IF PurchRcptHeader1.FINDFIRST THEN BEGIN
                      PurchRcptLine1.RESET;
                      PurchRcptLine1.SETRANGE("Document No.",PurchRcptHeader1."No.");
                      PurchRcptLine1.SETRANGE(Type,PurchRcptLine1.Type::Item);
                      PurchRcptLine1.SETRANGE("No.","Item No.");
                      IF PurchRcptLine1.FINDSET THEN BEGIN
                        REPEAT
                          IF PurchRcptHeader1."Posting Date" < PurchRcptLine1."Expected Receipt Date" THEN
                            PurchRcptLine1.MARK(TRUE);
                        UNTIL PurchRcptLine1.NEXT = 0;
                      END;
                      PurchRcptLine1.MARKEDONLY(TRUE);
                      Page.RUNMODAL(0,PurchRcptLine1);
                    END;
                    */
                    PurchRcptLine.MARKEDONLY(TRUE);
                    PAGE.RUNMODAL(0, PurchRcptLine);

                end;
            }
            field("Sampling Plan Code"; "Sampling Plan Code")
            {
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000003". Please convert manually.


        //Unsupported feature: Change Name on "Action 4". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 5". Please convert manually.


        //Unsupported feature: Change RunPageLink on "Action 5". Please convert manually.


        //Unsupported feature: Change Name on "Action 5". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 6". Please convert manually.


        //Unsupported feature: Change RunPageLink on "Action 6". Please convert manually.


        //Unsupported feature: Change Name on "Action 6". Please convert manually.

    }

    var
        PurchRcptHeader: Record "Purch. Rcpt. Header";
        PurchRcptLine: Record "Purch. Rcpt. Line";


    //Unsupported feature: CodeInsertion on "OnAfterGetRecord". Please convert manually.

    //trigger OnAfterGetRecord();
    //begin
    /*
    "Qty. Supplied With in DueDate" := 0;
    PurchRcptHeader.SETRANGE("Buy-from Vendor No.","Vendor No.");
    IF PurchRcptHeader.FINDSET THEN
      REPEAT
        PurchRcptLine.SETRANGE("Document No.",PurchRcptHeader."No.");
        PurchRcptLine.SETRANGE(Type,PurchRcptLine.Type::Item);
        PurchRcptLine.SETRANGE("No.","Item No.");
        IF PurchRcptLine.FINDSET THEN
          REPEAT
            IF PurchRcptHeader."Posting Date" < PurchRcptLine."Expected Receipt Date" THEN BEGIN
              "Qty. Supplied With in DueDate" := "Qty. Supplied With in DueDate" + PurchRcptLine.Quantity;
              PurchRcptLine.MARK(TRUE);
            END;
          UNTIL PurchRcptLine.NEXT = 0;
      UNTIL PurchRcptHeader.NEXT = 0;
    */
    //end;

    //Unsupported feature: PropertyChange. Please convert manually.

}

