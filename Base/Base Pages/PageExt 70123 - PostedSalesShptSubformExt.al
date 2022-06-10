pageextension 70123 PostedSalesShptSubformExt extends "Posted Sales Shpt. Subform"
{
    Editable=true;
    layout
    {
        /* modify(Control1)
        {
            ShowCaption = false;
        } */

        addafter(Type)
        {
            field("Line No."; "Line No.")
            {
            }
        }
        addafter("Shipment Date")
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
        addafter(Correction)
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



    procedure TrackingPage();
    begin
    end;


<<<<<<< HEAD
   
=======
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
>>>>>>> 2cc8f1fea3184cdf038a92c8ef5fefc00ee958f1
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

<<<<<<< HEAD
=======
    (13633)]
>>>>>>> 2cc8f1fea3184cdf038a92c8ef5fefc00ee958f1
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
}

