pageextension 70187 SalesOrderArchiveSubformExt extends "Sales Order Archive Subform"
{


    layout
    {


        /* modify("Control1")
         {



             ShowCaption = false;
         }*/



        modify("Unit Price")
        {
            Visible = false;
        }

        addafter("Shortcut Dimension 2 Code")
        {
            field("Line No."; Rec."Line No.")
            {
            }
            field("Supply Portion"; Rec."Supply Portion")
            {
            }
            field("Retention Portion"; Rec."Retention Portion")
            {
            }
        }
    }
    actions
    {



        addafter(DeferralSchedule)
        {
            action("Design Worksheet")
            {
                Caption = 'Design Worksheet';

                trigger OnAction();
                begin
                    //This functionality was copied from page #5159. Unsupported part was commented. Please check it.
                    /*CurrPage.SalesLinesArchive.Page.*/
                    ShowSalesOrderWorkSheet;

                end;
            }
        }
    }




    var
    //StrOrderLineArchiveDetailsPage: Page "Str Order Line Archive Details";

    /*procedure StrOrderLineArchiveDetailsPage();
    begin
    end;*/





    procedure ShowSalesOrderWorkSheet();
    var
        ArchivedDesignWorksheetHeader: Record "Archived DesignWorksheet";
        Item: Record Item;
    begin
        //TESTFIELD("Document Type");
        TESTFIELD("Document No.");
        TESTFIELD("Line No.");

        CLEAR(ArchivedDesignWorksheetHeader);
        ArchivedDesignWorksheetHeader.SETRANGE("Document Type", ArchivedDesignWorksheetHeader."Document Type"::Order);
        ArchivedDesignWorksheetHeader.SETRANGE("Document No.", "Document No.");
        ArchivedDesignWorksheetHeader.FILTERGROUP(2);
        ArchivedDesignWorksheetHeader.SETRANGE("Document Line No.", "Line No.");
        ArchivedDesignWorksheetHeader.SETRANGE("Version No.", "Version No.");
        PAGE.RUNMODAL(PAGE::"Archived Design Worksheet", ArchivedDesignWorksheetHeader);
        ArchivedDesignWorksheetHeader.FILTERGROUP(0);
    end;



}

