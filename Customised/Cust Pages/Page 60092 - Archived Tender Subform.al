page 60092 "Archived Tender Subform"
{
    // version B2B1.0,SH1.0

    AutoSplitKey = true;
    DelayedInsert = true;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Tender Line Archive";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field(Type; Type)
                {
                }
                field("No."; "No.")
                {
                }
                field(Description; Description)
                {
                }
                field(UOM; UOM)
                {
                }
                field(Quantity; Quantity)
                {
                }
                field("Unit Cost"; "Unit Cost")
                {
                }
                field("Production Bom No."; "Production Bom No.")
                {
                }
                field("Production Bom Version No."; "Production Bom Version No.")
                {
                }
                field("Design Cost"; "Design Cost")
                {
                }
                field("CRM Cost"; "CRM Cost")
                {
                }
                field("Total Amount"; "Total Amount")
                {
                }
                field("Estimated Unit Cost"; "Estimated Unit Cost")
                {
                }
                field("Estimated Total Unit Cost"; "Estimated Total Unit Cost")
                {
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
                        //This functionality was copied from page #60091. Unsupported part was commented. Please check it.
                        /*CurrPage.TenderLines.FORM.*/
                        ShowSchedule;

                    end;
                }
            }
        }
    }

    [LineStart(10683)]
    procedure ShowSalesOrderWorkSheet();
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

    [LineStart(10696)]
    procedure ShowSchedule();
    var
        Schedule: Record Schedule2;
    begin
        Schedule.RESET;
        Schedule.SETRANGE("Document Type", Schedule."Document Type"::Tender);
        Schedule.SETRANGE("Document No.", "Document No.");
        Schedule.SETRANGE("Document Line No.", "Line No.");
        //Schedule.SETRANGE("Item No.","No.");
        //Schedule.SETRANGE(Quantity,Quantity);
        Schedule.FILTERGROUP(2);
        PAGE.RUN(60186, Schedule);
        Schedule.FILTERGROUP(0);
    end;
}

