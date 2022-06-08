pageextension 70193 SalesQuoteArchiveSubformExt extends "Sales Quote Archive Subform"
{
    // version NAVW19.00.00.45778,NAVIN9.00.00.45778

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


        //Unsupported feature: Change Name on "Control 14". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 14". Please convert manually.


        //Unsupported feature: Change Name on "Control 16". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 16". Please convert manually.


        //Unsupported feature: Change Name on "Control 18". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 18". Please convert manually.


        //Unsupported feature: Change BlankZero on "Control 20". Please convert manually.


        //Unsupported feature: Change Name on "Control 20". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 20". Please convert manually.


        //Unsupported feature: Change Name on "Control 22". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 22". Please convert manually.


        //Unsupported feature: Change Name on "Control 24". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 24". Please convert manually.


        //Unsupported feature: Change Name on "Control 26". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 26". Please convert manually.


        //Unsupported feature: Change BlankZero on "Control 28". Please convert manually.


        //Unsupported feature: Change Name on "Control 28". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 28". Please convert manually.


        //Unsupported feature: Change BlankZero on "Control 30". Please convert manually.


        //Unsupported feature: Change Name on "Control 30". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 30". Please convert manually.


        //Unsupported feature: Change BlankZero on "Control 32". Please convert manually.


        //Unsupported feature: Change Name on "Control 32". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 32". Please convert manually.


        //Unsupported feature: Change Name on "Control 34". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 34". Please convert manually.


        //Unsupported feature: Change Name on "Control 36". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 36". Please convert manually.


        //Unsupported feature: Change Name on "Control 38". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 38". Please convert manually.


        //Unsupported feature: Change Name on "Control 44". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 44". Please convert manually.


        //Unsupported feature: Change Name on "Control 50". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 50". Please convert manually.


        //Unsupported feature: Change Name on "Control 52". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 52". Please convert manually.


        //Unsupported feature: Change Name on "Control 54". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 54". Please convert manually.


        //Unsupported feature: Change Name on "Control 56". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 56". Please convert manually.


        //Unsupported feature: Change Name on "Control 58". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 58". Please convert manually.

    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.


        //Unsupported feature: Change Name on "Action 1907935204". Please convert manually.


        //Unsupported feature: Change AccessByPermission on "Action 1904320404". Please convert manually.


        //Unsupported feature: Change Name on "Action 1904320404". Please convert manually.


        //Unsupported feature: Change Name on "Action 1900639404". Please convert manually.


        //Unsupported feature: Change Name on "Action 1907307904". Please convert manually.

        addafter("Action 1907307904")
        {
            action("Design Worksheet")
            {
                Caption = 'Design Worksheet';

                trigger OnAction();
                begin
                    //This functionality was copied from page #5162. Unsupported part was commented. Please check it.
                    /*CurrPage.SalesLinesArchive.Page.*/
                    ShowSalesOrderWorkSheet;

                end;
            }
        }
    }


    //Unsupported feature: PropertyModification on "ShowStrDetailsArchiveForm(PROCEDURE 1500001).StrOrderLineArchiveDetails(Variable 1280001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ShowStrDetailsArchiveForm : 13799;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ShowStrDetailsArchiveForm : "Str Order Line Archive Details";
    //Variable type has not been exported.

    var
        StrOrderLineArchiveDetailsPage: Page "Str Order Line Archive Details";

    procedure StrOrderLineArchiveDetailsPage();
    begin
    end;


    //Unsupported feature: CodeModification on "ShowStrDetailsArchiveForm(PROCEDURE 1500001)". Please convert manually.

    //procedure ShowStrDetailsArchiveForm();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    StrOrderLineArchiveDetails.RESET;
    StrOrderLineArchiveDetails.SETCURRENTKEY("Document Type","Document No.",Type);
    StrOrderLineArchiveDetails.SETRANGE("Document Type","Document Type");
    StrOrderLineArchiveDetails.SETRANGE("Document No.","Document No.");
    StrOrderLineArchiveDetails.SETRANGE(Type,StrOrderLineArchiveDetails.Type::Sale);
    StrOrderLineArchiveDetails.SETRANGE("Item No.","No.");
    StrOrderLineArchiveDetails.SETRANGE("Line No.","Line No.");
    StrOrderLineArchiveDetails.SETRANGE("Version No.","Version No.");
    StrOrderLineArchiveDetailsForm.SETTABLEVIEW(StrOrderLineArchiveDetails);
    StrOrderLineArchiveDetailsForm.RUNMODAL;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..8
    StrOrderLineArchiveDetailsPage.SETTABLEVIEW(StrOrderLineArchiveDetails);
    StrOrderLineArchiveDetailsPage.RUNMODAL;
    */
    //end;

    (25441)]
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

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

