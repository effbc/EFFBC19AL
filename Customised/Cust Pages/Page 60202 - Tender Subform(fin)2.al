page 60202 "Tender Subform(fin)2"
{
    // version B2B1.0

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
    }

    (15975)]
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
}

