pageextension 70123 PostedSalesShptSubformExt extends "Posted Sales Shpt. Subform"
{
    // version NAVW19.00.00.51685,NAVIN9.00.00.51685

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


        //Unsupported feature: Change Name on "Control 24". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 24". Please convert manually.


        //Unsupported feature: Change Name on "Control 14". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 14". Please convert manually.


        //Unsupported feature: Change Name on "Control 6". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 20". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 20". Please convert manually.


        //Unsupported feature: Change Name on "Control 46". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 46". Please convert manually.


        //Unsupported feature: Change Name on "Control 54". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 54". Please convert manually.


        //Unsupported feature: Change BlankZero on "Control 8". Please convert manually.


        //Unsupported feature: Change Name on "Control 8". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 8". Please convert manually.


        //Unsupported feature: Change Name on "Control 22". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 22". Please convert manually.


        //Unsupported feature: Change Name on "Control 10". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 10". Please convert manually.


        //Unsupported feature: Change BlankZero on "Control 12". Please convert manually.


        //Unsupported feature: Change Name on "Control 12". Please convert manually.


        //Unsupported feature: Change Editable on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 12". Please convert manually.


        //Unsupported feature: Change Editable on "Control 44". Please convert manually.


        //Unsupported feature: Change Name on "Control 44". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 44". Please convert manually.


        //Unsupported feature: Change Name on "Control 18". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 18". Please convert manually.


        //Unsupported feature: Change Name on "Control 28". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 28". Please convert manually.


        //Unsupported feature: Change Name on "Control 36". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 36". Please convert manually.


        //Unsupported feature: Change Name on "Control 40". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 40". Please convert manually.


        //Unsupported feature: Change Name on "Control 16". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 16". Please convert manually.


        //Unsupported feature: Change Name on "Control 32". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 32". Please convert manually.


        //Unsupported feature: Change Name on "Control 38". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 38". Please convert manually.


        //Unsupported feature: Change Name on "Control 34". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 34". Please convert manually.


        //Unsupported feature: Change Name on "Control 42". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 42". Please convert manually.


        //Unsupported feature: Change Name on "Control 50". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 50". Please convert manually.


        //Unsupported feature: Change Name on "Control 48". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 48". Please convert manually.


        //Unsupported feature: Change Name on "Control 52". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 52". Please convert manually.


        //Unsupported feature: Change Name on "Control 1055605". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1055605". Please convert manually.


        //Unsupported feature: Change Name on "Control 1055603". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1055603". Please convert manually.


        //Unsupported feature: Change Name on "Control 1055602". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1055602". Please convert manually.


        //Unsupported feature: Change Name on "Control 1055600". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1055600". Please convert manually.


        //Unsupported feature: Change Name on "Control 1055601". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1055601". Please convert manually.

        addafter("Control 2")
        {
            field("Line No."; "Line No.")
            {
            }
        }
        addafter("Control 16")
        {
            field("RDSO Unit Charges"; "RDSO Unit Charges")
            {
            }
            field("RDSO Charges Paid By"; "RDSO Charges Paid By")
            {
            }
            field("RDSO Inspection Required"; "RDSO Inspection Required")
            {
            }
            field("RDSO Inspection By"; "RDSO Inspection By")
            {
            }
            field("RDSO Charges"; "RDSO Charges")
            {
            }
        }
        addafter("Control 1055601")
        {
            field("Qty. Invoiced (Base)"; "Qty. Invoiced (Base)")
            {
                Editable = true;
            }
            field("Posting Date"; "Posting Date")
            {
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.


        //Unsupported feature: Change Name on "Action 1906587504". Please convert manually.


        //Unsupported feature: Change Name on "Action 1903098504". Please convert manually.


        //Unsupported feature: Change Name on "Action 1907935204". Please convert manually.


        //Unsupported feature: Change AccessByPermission on "Dimensions(Action 1903100004)". Please convert manually.


        //Unsupported feature: Change AccessByPermission on "Action 3". Please convert manually.


        //Unsupported feature: Change Name on "Action 3". Please convert manually.

        addafter(ItemInvoiceLines)
        {
            action("Design Worksheet")
            {
                Caption = 'Design Worksheet';

                trigger OnAction();
                begin
                    //This functionality was copied from page #130. Unsupported part was commented. Please check it.
                    /*CurrPage.SalesShipmLines.Page.*/
                    ShowSalesOrderWorkSheet;

                end;
            }
            action(Schedule)
            {
                Caption = 'Schedule';

                trigger OnAction();
                begin
                    //This functionality was copied from page #130. Unsupported part was commented. Please check it.
                    /*CurrPage.SalesShipmLines.Page.*/
                    ShowSchedule;

                end;
            }
        }
    }


    //Unsupported feature: PropertyModification on "ShowTracking(PROCEDURE 1).ItemLedgEntry(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ShowTracking : 32;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ShowTracking : "Item Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ShowTracking(PROCEDURE 1).TempItemLedgEntry(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ShowTracking : 32;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ShowTracking : "Item Ledger Entry";
    //Variable type has not been exported.

    var
        TrackingPage: Page "Order Tracking";


    //Unsupported feature: PropertyModification on "UndoShipmentPosting(PROCEDURE 2).SalesShptLine(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //UndoShipmentPosting : 111;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //UndoShipmentPosting : "Sales Shipment Line";
    //Variable type has not been exported.

    procedure TrackingPage();
    begin
    end;


    //Unsupported feature: CodeModification on "ShowTracking(PROCEDURE 1)". Please convert manually.

    //procedure ShowTracking();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TESTFIELD(Type,Type::Item);
    IF "Item Shpt. Entry No." <> 0 THEN BEGIN
      ItemLedgEntry.GET("Item Shpt. Entry No.");
      TrackingForm.SetItemLedgEntry(ItemLedgEntry);
    END ELSE
      TrackingForm.SetMultipleItemLedgEntries(TempItemLedgEntry,
        DATABASE::"Sales Shipment Line",0,"Document No.",'',0,"Line No.");

    TrackingForm.RUNMODAL;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
      TrackingPage.SetItemLedgEntry(ItemLedgEntry);
    END ELSE
      TrackingPage.SetMultipleItemLedgEntries(TempItemLedgEntry,
        DATABASE::"Sales Shipment Line",0,"Document No.",'',0,"Line No.");

    TrackingPage.RUNMODAL;
    */
    //end;

    (13620)]
    procedure ShowSalesOrderWorkSheet();
    var
        DesignWorksheetHeader: Record "Design Worksheet Header";
        Item: Record Item;
    begin
        //TESTFIELD("Document Type");
        TESTFIELD("Document No.");
        TESTFIELD("Line No.");

        CLEAR(DesignWorksheetHeader);
        DesignWorksheetHeader.SETRANGE("Document Type", DesignWorksheetHeader."Document Type"::Order);
        DesignWorksheetHeader.SETRANGE("Document No.", "Order No.");
        DesignWorksheetHeader.FILTERGROUP(2);
        DesignWorksheetHeader.SETRANGE("Document Line No.", "Order Line No.");
        PAGE.RUNMODAL(PAGE::"Posted Design Worksheet", DesignWorksheetHeader);
        DesignWorksheetHeader.FILTERGROUP(0);
    end;

    (13633)]
    procedure ShowSchedule();
    var
        Schedule: Record Schedule2;
        SalesShptHeader: Record "Sales Shipment Header";
        OrderNo: Code[20];
    begin
        IF SalesShptHeader.GET("Document No.") THEN;
        OrderNo := SalesShptHeader."Order No.";
        Schedule.RESET;
        Schedule.SETRANGE("Document No.", OrderNo);
        Schedule.SETRANGE(Schedule."Document Line No.", "Order Line No.");
        PAGE.RUN(60189, Schedule);
    end;

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

