pageextension 70193 SalesQuoteArchiveSubformExt extends "Sales Quote Archive Subform"
{


    layout
    {



        /* modify("Control1")
         {



             ShowCaption = false;
         }*/



    }
    actions
    {



        addafter("Co&mments")
        {
            action("Design Worksheet")
            {
                Caption = 'Design Worksheet';
                ApplicationArea = All;

                trigger OnAction();
                begin
                    //This functionality was copied from page #5162. Unsupported part was commented. Please check it.
                    /*CurrPage.SalesLinesArchive.Page.*/
                    ShowSalesOrderWorkSheet;

                end;
            }
        }
    }




    var
    //StrOrderLineArchiveDetailsPage: Page "Str Order Line Archive Details";

    procedure StrOrderLineArchiveDetailsPage();
    begin
    end;





    procedure ShowSalesOrderWorkSheet();
    var
        ArchivedDesignWorksheetHeader: Record "Archived DesignWorksheet";
        Item: Record Item;
    begin
        //TESTFIELD("Document Type");
        TESTFIELD("Document No.");
        TESTFIELD("Line No.");

        CLEAR(ArchivedDesignWorksheetHeader);
        ArchivedDesignWorksheetHeader.SETRANGE("Document Type", ArchivedDesignWorksheetHeader."Document Type"::Quote);
        ArchivedDesignWorksheetHeader.SETRANGE("Document No.", "Document No.");
        ArchivedDesignWorksheetHeader.FILTERGROUP(2);
        ArchivedDesignWorksheetHeader.SETRANGE("Document Line No.", "Line No.");
        ArchivedDesignWorksheetHeader.SETRANGE("Version No.", "Version No.");
        PAGE.RUNMODAL(PAGE::"Archived Design Worksheet", ArchivedDesignWorksheetHeader);
        ArchivedDesignWorksheetHeader.FILTERGROUP(0);
    end;



}

