page 60121 "Tender Subform - Design"
{
    // version B2B1.0,DWS1.0,SH1.0

    AutoSplitKey = true;
    DelayedInsert = true;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Tender Line";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field(Type; Type)
                {
                    Editable = false;
                }
                field("No."; "No.")
                {
                    Editable = false;
                }
                field(Description; Description)
                {
                    Editable = false;
                }
                field(Quantity; Quantity)
                {
                    Editable = false;
                }
                field("Production Bom No."; "Production Bom No.")
                {
                }
                field("Production Bom Version No."; "Production Bom Version No.")
                {
                }
                field("Unit Cost"; "Unit Cost")
                {
                    Editable = false;
                }
                field("Design Cost"; "Design Cost")
                {
                    Editable = false;
                }
                field("CRM Cost"; "CRM Cost")
                {
                    Editable = false;
                }
                field("Total Amount"; "Total Amount")
                {
                    Editable = false;
                }
                field("Estimated Unit Cost"; "Estimated Unit Cost")
                {
                    Editable = false;
                }
                field("Estimated Total Unit Cost"; "Estimated Total Unit Cost")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                action(Schedule)
                {
                    Caption = 'Schedule';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #60120. Unsupported part was commented. Please check it.
                        /*CurrPage.TenderLines.FORM.*/
                        ShowSchedule2;

                    end;
                }
            }
        }
    }

    var
        TransferExtendedText: Codeunit "Transfer Extended Text";

    (11278)]
    procedure ShowSalesOrderWorkSheet2();
    var
        DesignWorksheetHeader: Record "Design Worksheet Header";
        Item: Record Item;
    begin
        //TESTFIELD("Document Type");
        TESTFIELD("Document No.");
        TESTFIELD("Line No.");

        CLEAR(DesignWorksheetHeader);
        DesignWorksheetHeader.SETRANGE("Document Type", DesignWorksheetHeader."Document Type"::Tender);
        DesignWorksheetHeader.SETRANGE("Document No.", "Document No.");
        DesignWorksheetHeader.FILTERGROUP(2);
        DesignWorksheetHeader.SETRANGE("Document Line No.", "Line No.");
        PAGE.RUNMODAL(PAGE::"Design Worksheet", DesignWorksheetHeader);
        DesignWorksheetHeader.FILTERGROUP(0);
    end;

    (11291)]
    procedure InsertExtendedText(Unconditionally: Boolean);
    begin
        IF TransferExtendedText.TenderCheckIfAnyExtText(Rec, Unconditionally) THEN BEGIN
            CurrPage.SAVERECORD;
            TransferExtendedText.InsertTenderExtText(Rec);
        END;
        IF TransferExtendedText.MakeUpdate THEN
            CurrPage.UPDATE(TRUE);
    end;

    (11299)]
    procedure ShowSchedule2();
    var
        Schedule: Record Schedule2;
    begin
        Schedule.SETRANGE("Document Type", Schedule."Document Type"::Tender);
        Schedule.SETRANGE("Document No.", "Document No.");
        Schedule.SETRANGE("Document Line No.", "Line No.");
        PAGE.RUNMODAL(60125, Schedule);
    end;

    (11305)]
    procedure ShowSalesOrderWorkSheet();
    var
        DesignWorksheetHeader: Record "Design Worksheet Header";
        DesignWorksheetLine: Record "Design Worksheet Line";
        Item: Record Item;
        ItemDesignWorksheetHeader: Record "Item Design Worksheet Header";
        ItemDesignWorksheetLine: Record "Item Design Worksheet Line";
    begin
        //TESTFIELD("Document Type");
        TESTFIELD("Document No.");
        TESTFIELD("Line No.");
        ItemDesignWorksheetHeader.RESET;
        IF ItemDesignWorksheetHeader.GET("No.") THEN BEGIN
            DesignWorksheetHeader.INIT;
            DesignWorksheetHeader.TRANSFERFIELDS(ItemDesignWorksheetHeader);
            DesignWorksheetHeader."Document No." := "Document No.";
            DesignWorksheetHeader."Document Line No." := "Line No.";
            DesignWorksheetHeader."Document Type" := DesignWorksheetHeader."Document Type"::Order;
            IF DesignWorksheetHeader.INSERT THEN;
            ItemDesignWorksheetLine.RESET;
            ItemDesignWorksheetLine.SETRANGE(ItemDesignWorksheetLine."Item No", ItemDesignWorksheetHeader."Item No.");
            IF ItemDesignWorksheetLine.FINDSET THEN
                REPEAT
                    DesignWorksheetLine.INIT;
                    DesignWorksheetLine.TRANSFERFIELDS(ItemDesignWorksheetLine);
                    DesignWorksheetLine."Document No." := "Document No.";
                    DesignWorksheetLine."Document Line No." := "Line No.";
                    DesignWorksheetLine."Document Type" := DesignWorksheetLine."Document Type"::Tender;
                    IF DesignWorksheetLine.INSERT THEN;
                UNTIL ItemDesignWorksheetLine.NEXT = 0;
        END;
        COMMIT;


        CLEAR(DesignWorksheetHeader);
        DesignWorksheetHeader.SETRANGE("Document Type", DesignWorksheetHeader."Document Type"::Tender);
        DesignWorksheetHeader.SETRANGE("Document No.", "Document No.");
        DesignWorksheetHeader.FILTERGROUP(2);
        DesignWorksheetHeader.SETRANGE("Document Line No.", "Line No.");
        PAGE.RUNMODAL(PAGE::"Design Worksheet", DesignWorksheetHeader);
        DesignWorksheetHeader.FILTERGROUP(0);
    end;

    (11340)]
    procedure ShowSchedule();
    var
        Schedule: Record Schedule2;
    begin
        Schedule.RESET;
        Schedule.SETRANGE("Document Type", Schedule."Document Type"::Tender);
        Schedule.SETRANGE("Document No.", "Document No.");
        Schedule.SETRANGE("Document Line No.", "Line No.");
        PAGE.RUNMODAL(60129, Schedule);
    end;
}

