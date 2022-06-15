pageextension 70116 PostedPurchaseRcptSubformExt extends "Posted Purchase Rcpt. Subform"
{
    Editable = true;
    layout
    {
        /* modify(Control1)
        {
            ShowCaption = false;
        } */
        addafter("No.")
        {
            field(Sample; Sample)
            {
                Editable = EditableFields;
            }
            field("Store Remarks"; "Store Remarks")
            {
            }
            field("Gen. Prod. Posting Group"; "Gen. Prod. Posting Group")
            {
            }
            field("Gen. Bus. Posting Group"; "Gen. Bus. Posting Group")
            {
            }
            field("Quantity Accepted"; "Quantity Accepted")
            {
                Editable = "Quantity AcceptedEditable";
            }
            field("Quantity Rejected"; "Quantity Rejected")
            {
                Editable = "Quantity RejectedEditable";
            }
            field("Unit Cost"; "Unit Cost")
            {
                Editable = EditableFields;
            }
            field("QC Enabled"; "QC Enabled")
            {
                Editable = EditableFields;
            }
            field("Quality Before Receipt"; "Quality Before Receipt")
            {
            }
        }
        addafter("Variant Code")
        {
            field("Indent No."; "Indent No.")
            {
            }
            field("Indent Line No."; "Indent Line No.")
            {
            }
            field("Quantity Rework"; "Quantity Rework")
            {
                Editable = "Quantity ReworkEditable";
            }
            field("Document date"; "Document date")
            {
            }
        }
        addafter(Correction)
        {
            field("Pay-to Vendor No."; "Pay-to Vendor No.")
            {
            }
            field("Buy-from Vendor No."; "Buy-from Vendor No.")
            {
            }
            field(Make; Make)
            {
                Editable = EditableFields;
            }
            field("Qty. Invoiced (Base)"; "Qty. Invoiced (Base)")
            {
                Editable = true;
            }
            field("Order No."; "Order No.")
            {
                Editable = EditableFields;
            }
            field("Order Line No."; "Order Line No.")
            {
                Editable = EditableFields;
            }
            field("Line No."; "Line No.")
            {
            }
            field("Quantity (Base)"; "Quantity (Base)")
            {
            }
            field("VAT Bus. Posting Group"; "VAT Bus. Posting Group")
            {
            }
            field("VAT Prod. Posting Group"; "VAT Prod. Posting Group")
            {
            }
            field("Order Address Code"; "Order Address Code")
            {
            }
            field("Buy-From GST Registration No"; "Buy-From GST Registration No")
            {
            }
            field("Item Rcpt. Entry No."; "Item Rcpt. Entry No.")
            {
            }
            field("Currency Code"; "Currency Code")
            {
            }
            field("GST Jurisdiction Type"; "GST Jurisdiction Type")
            {
            }
            field("Part Number"; "Part Number")
            {
            }
        }
    }
    actions
    {
        addafter(ItemInvoiceLines)
        {
            action("Inspection &Lots")
            {
                Caption = 'Inspection &Lots';

                trigger OnAction();
                begin
                    //This functionality was copied from page #136. Unsupported part was commented. Please check it.
                    /*CurrPage.PurchReceiptLines.Page.*/
                    ShowInspectLots;

                end;
            }
            action("Sample Lot Inspection")
            {
                Caption = 'Sample Lot Inspection';

                trigger OnAction();
                begin
                    //This functionality was copied from page #136. Unsupported part was commented. Please check it.
                    /*CurrPage.PurchReceiptLines.Page.*/
                    _SampleLotInspection;

                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        IF USERID IN ['EFFTRONICS\SUJANI', 'EFFTRONICS\ANILKUMAR', 'EFFTRONICS\VISHNUPRIYA', 'EFFTRONICS\B2BOTS', 'EFFTRONICS\RENUKACH'] THEN   //'EFFTRONICS\VISHNUPRIYA',
            EditableFields := TRUE
        ELSE
            EditableFields := FALSE;
    end;






    var
        InspectDataSheet: Record "Inspection Datasheet Header";
        PostedInspectDataSheet: Record "Posted Inspect DatasheetHeader";
        InspectReportHeader: Record "Inspection Receipt Header";
        InspectLots: Record "Inspection Lot";
        PostInspLot: Codeunit "Inspection Data Sheets";
        Text000: Label 'Inspection Data Sheets already exists for atleast one of the Inspection Lots.\Inspection Data sheets cannot be created here.';
        Text001: Label 'Inspection Data Sheet already exists for the Receipt.';

        "Quantity AcceptedEditable": Boolean;

        "Quantity RejectedEditable": Boolean;

        "Quantity ReworkEditable": Boolean;
        EditableFields: Boolean;



    procedure TrackingPage();
    begin
    end;

    LOCAL PROCEDURE UndoReceiptLine();
    VAR
        PurchRcptLine: Record "Purch. Rcpt. Line";
        IDS: Record "Inspection Datasheet Header";
        IDSL: Record "Inspection Datasheet Line";
        QILE: Record "Quality Item Ledger Entry";
        PIDS: Record "Posted Inspect DatasheetHeader";
        PIDSL: Record "Posted Inspect Datasheet Line";
        IR: Record "Inspection Receipt Header";
    BEGIN
        IF "QC Enabled" = TRUE THEN BEGIN
            IDS.SETRANGE("Receipt No.", "Document No.");
            IDS.SETRANGE("Purch Line No", "Line No.");
            IF IDS.FINDSET THEN BEGIN
                REPEAT
                    PIDS.TRANSFERFIELDS(IDS);
                    PIDS."Quality Status" := PIDS."Quality Status"::Cancel;
                    PIDS.INSERT;
                    IDS.DELETE;
                    IDSL.SETRANGE("Document No.", IDS."No.");
                    IF IDSL.FINDSET THEN BEGIN
                        REPEAT
                            PIDSL.TRANSFERFIELDS(IDSL);
                            PIDSL.INSERT;
                        UNTIL IDSL.NEXT = 0;
                        IDSL.DELETEALL;
                    END;
                UNTIL IDS.NEXT = 0;
                QILE.SETRANGE("Document No.", IDS."Receipt No.");
                QILE.SETRANGE(QILE."Purch.Rcpt Line", "Line No.");
                IF QILE.FINDSET THEN
                    REPEAT
                        QILE.DELETE;
                    UNTIL QILE.NEXT = 0;
            END;
        END;

        /* IR.SETRANGE("Receipt No.", "Document No.");
        IR.SETRANGE("Purch Line No", "Line No.");
        IR.SETFILTER(Status, 'NO');
        IF IR.FINDSET THEN BEGIN
            REPEAT
                IR.Status := TRUE;
                //IR."Quality Status" := IR."Quality Status" :: Close;
                IR.MODIFY;
            UNTIL IR.NEXT = 0;
        END;
        QILE.SETRANGE("Document No.", IR."Receipt No.");
        QILE.SETRANGE(QILE."Purch.Rcpt Line", "Line No.");
        IF QILE.FINDSET THEN
            REPEAT
                QILE.DELETE;
            UNTIL QILE.NEXT = 0;
    END; */

    end;

    procedure "---Quality control---"();
    begin
    end;


    procedure ShowDataSheet();
    begin
        InspectDataSheet.SETRANGE("Receipt No.", "Document No.");
        InspectDataSheet.SETRANGE("Item No.", "No.");
        InspectDataSheet.SETRANGE("Purch Line No", "Line No.");
        InspectDataSheet.SETCURRENTKEY("Rework Level");
        PAGE.RUN(PAGE::"Inspection Data Sheet List", InspectDataSheet);
    end;


    procedure ShowPostedDataSheet();
    begin
        PostedInspectDataSheet.SETRANGE("Receipt No.", "Document No.");
        PostedInspectDataSheet.SETRANGE("Item No.", "No.");
        PostedInspectDataSheet.SETRANGE("Purch Line No", "Line No.");
        PostedInspectDataSheet.SETCURRENTKEY("Rework Level");
        PAGE.RUN(PAGE::"Posted Inspect Data Sheet List", PostedInspectDataSheet);
    end;


    procedure ShowInspectReport(Status: Boolean);
    begin
        InspectReportHeader.SETRANGE("Receipt No.", "Document No.");
        InspectReportHeader.SETRANGE("Purch Line No", "Line No.");
        InspectReportHeader.SETFILTER(InspectReportHeader.Status, '%1', Status);
        InspectReportHeader.SETCURRENTKEY("Rework Level");
        PAGE.RUN(PAGE::"Inspection Receipt List", InspectReportHeader);
        InspectReportHeader.RESET;
    end;


    procedure ShowInspectLots();
    var
        PostPurchHead: Record "Purch. Rcpt. Header";
    begin
        TESTFIELD("QC Enabled");
        IF Type = Type::Item THEN BEGIN
            InspectLots.RESET;
            InspectLots.SETRANGE("Document No.", "Document No.");
            InspectLots.SETRANGE("Purch. Line No.", "Line No.");
            InspectLots.SETRANGE("Item No.", "No.");
            PAGE.RUN(PAGE::"Inspection Lots", InspectLots);
        END;
    end;


    procedure CreateInpDataSheets();
    begin
        IF Type = Type::Item THEN BEGIN
            TESTFIELD("Spec ID");
            InspectLots.SETRANGE("Document No.", "Document No.");
            InspectLots.SETRANGE("Purch. Line No.", "Line No.");
            InspectLots.SETRANGE("Item No.", "No.");
            InspectLots.SETRANGE("Inspect. Data sheet created", TRUE);
            IF NOT InspectLots.FINDFIRST THEN BEGIN
                InspectLots.SETRANGE("Inspect. Data sheet created");
                IF InspectLots.FINDSET THEN
                    REPEAT
                        PostInspLot.RUN(InspectLots);
                    UNTIL InspectLots.NEXT = 0;
            END ELSE
                ERROR(Text000);
        END;
    end;


    procedure QcOverRide();
    begin
        IF NOT "QC Enabled" THEN BEGIN
            "Quantity AcceptedEditable" := TRUE;
            "Quantity RejectedEditable" := TRUE;
            "Quantity ReworkEditable" := TRUE
        END ELSE
            MESSAGE('Quantity Accepted/Rejected can''t be override when QC is enabled');
    end;


    procedure QcOverRideDisabled();
    begin
        "Quantity AcceptedEditable" := FALSE;
        "Quantity RejectedEditable" := FALSE;
        "Quantity ReworkEditable" := FALSE;
    end;


    procedure _SampleLotInspection();
    var
        SampleLotInspection: Record "Sample Lot Inspection";
    begin
        //"Sample Lot Inspection" := TRUE;
        SampleLotInspection.SETRANGE("Purchase Order No.", "Order No.");
        SampleLotInspection.SETRANGE("Purchase Line No.", "Order Line No.");
        PAGE.RUN(60072, SampleLotInspection);
    end;


    procedure SampleLotInspection();
    var
        SampleLotInspection: Record "Sample Lot Inspection";
    begin
        //"Sample Lot Inspection" := TRUE;
        SampleLotInspection.SETRANGE("Purchase Order No.", "Order No.");
        SampleLotInspection.SETRANGE("Purchase Line No.", "Order Line No.");
        PAGE.RUN(60072, SampleLotInspection);
    end;

}

