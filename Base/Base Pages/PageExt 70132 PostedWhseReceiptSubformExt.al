pageextension 70132 PostedWhseReceiptSubformExt extends "Posted Whse. Receipt Subform"
{
    // version NAVW19.00.00.45778

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


        //Unsupported feature: Change Name on "Control 6". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 62". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 62". Please convert manually.


        //Unsupported feature: Change Name on "Control 18". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 18". Please convert manually.


        //Unsupported feature: Change Name on "Control 10". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 10". Please convert manually.


        //Unsupported feature: Change Name on "Control 8". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 8". Please convert manually.


        //Unsupported feature: Change Name on "Control 38". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 38". Please convert manually.


        //Unsupported feature: Change Name on "Control 40". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 40". Please convert manually.


        //Unsupported feature: Change Name on "Control 22". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 22". Please convert manually.


        //Unsupported feature: Change Name on "Control 24". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 24". Please convert manually.


        //Unsupported feature: Change Name on "Control 30". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 30". Please convert manually.


        //Unsupported feature: Change Name on "Control 32". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 32". Please convert manually.


        //Unsupported feature: Change Name on "Control 4". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 4". Please convert manually.


        //Unsupported feature: Change Name on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 12". Please convert manually.


        //Unsupported feature: Change Name on "Control 14". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 14". Please convert manually.


        //Unsupported feature: Change Name on "Control 34". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 34". Please convert manually.


        //Unsupported feature: Change Name on "Control 16". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 16". Please convert manually.


        //Unsupported feature: Change Name on "Control 36". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 36". Please convert manually.


        //Unsupported feature: Change Name on "Control 20". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 20". Please convert manually.


        //Unsupported feature: Change Name on "Control 28". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 28". Please convert manually.


        //Unsupported feature: Change Name on "Control 26". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 26". Please convert manually.

    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.


        //Unsupported feature: Change Name on "Action 1907935204". Please convert manually.


        //Unsupported feature: Change Name on "Action 1900206304". Please convert manually.


        //Unsupported feature: Change Name on "Action 1901742304". Please convert manually.


        //Unsupported feature: Change Name on "Action 1903867004". Please convert manually.

        addafter("Action 1903867004")
        {
            group(Inspection)
            {
                Caption = 'Inspection';
                action("Inspection Data Sheets")
                {
                    Caption = 'Inspection Data Sheets';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #7330. Unsupported part was commented. Please check it.
                        /*CurrPage.PostedWhseRcptLines.Page.*/
                        ShowDataSheet;

                    end;
                }
                action("Posted Inspection Data Sheets")
                {
                    Caption = 'Posted Inspection Data Sheets';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #7330. Unsupported part was commented. Please check it.
                        /*CurrPage.PostedWhseRcptLines.Page.*/
                        ShowPostedDataSheet;

                    end;
                }
                action("Inspection &Receipts")
                {
                    Caption = 'Inspection &Receipts';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #7330. Unsupported part was commented. Please check it.
                        /*CurrPage.PostedWhseRcptLines.Page.*/
                        ShowInspectReceipt;

                    end;
                }
                action("Posted I&nspection Receipts")
                {
                    Caption = 'Posted I&nspection Receipts';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #7330. Unsupported part was commented. Please check it.
                        /*CurrPage.PostedWhseRcptLines.Page.*/
                        ShowPostedInspectReceipt;

                    end;
                }
            }
        }
    }


    //Unsupported feature: PropertyModification on "ShowBinContents(PROCEDURE 7301).BinContent(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ShowBinContents : 7302;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ShowBinContents : "Bin Content";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "PutAwayCreate(PROCEDURE 2).PostedWhseRcptHdr(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //PutAwayCreate : 7318;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PutAwayCreate : "Posted Whse. Receipt Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "PutAwayCreate(PROCEDURE 2).PostedWhseRcptLine(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //PutAwayCreate : 7319;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PutAwayCreate : "Posted Whse. Receipt Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "WMSMgt(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //WMSMgt : 7302;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //WMSMgt : "WMS Management";
    //Variable type has not been exported.

    var
        "QC--": Integer;
        InspectDataSheet: Record "Inspection Datasheet Header";
        PostedInspectDataSheet: Record "Posted Inspect DatasheetHeader";
        InspectReportHeader: Record "Inspection Receipt Header";

    (31008)]
    procedure "--QC--"();
    begin
    end;

    (31011)]
    procedure ShowDataSheet();
    begin
        TESTFIELD("Source Document", "Source Document"::"Purchase Order");
        InspectDataSheet.SETRANGE("Receipt No.", "Posted Source No.");
        InspectDataSheet.SETRANGE("Item No.", "Item No.");
        InspectDataSheet.SETRANGE("Purch Line No", "Source Line No.");
        PAGE.RUN(PAGE::"Inspection Data Sheet List", InspectDataSheet);
    end;

    (31018)]
    procedure ShowPostedDataSheet();
    begin
        TESTFIELD("Source Document", "Source Document"::"Purchase Order");
        PostedInspectDataSheet.SETRANGE("Receipt No.", "Posted Source No.");
        PostedInspectDataSheet.SETRANGE("Item No.", "Item No.");
        PostedInspectDataSheet.SETRANGE("Purch Line No", "Source Line No.");
        PAGE.RUN(PAGE::"Posted Inspect Data Sheet List", PostedInspectDataSheet);
    end;

    (31025)]
    procedure ShowInspectReceipt();
    begin
        /*InspectReportHeader.SETRANGE("Receipt No.","Document No.");
        InspectReportHeader.SETRANGE("Purch Line No","Line No.");
        Page.RUN(Page::"Inspection Report  List",InspectReportHeader);
        */
        TESTFIELD("Source Document", "Source Document"::"Purchase Order");
        InspectReportHeader.SETRANGE("Receipt No.", "Posted Source No.");
        InspectReportHeader.SETRANGE("Item No.", "Item No.");
        InspectReportHeader.SETRANGE("Purch Line No", "Source Line No.");
        InspectReportHeader.SETRANGE(Status, FALSE);
        PAGE.RUN(PAGE::"Inspection Receipt List", InspectReportHeader);
        InspectReportHeader.RESET;

    end;

    (31038)]
    procedure ShowPostedInspectReceipt();
    begin
        TESTFIELD("Source Document", "Source Document"::"Purchase Order");
        InspectReportHeader.SETRANGE("Receipt No.", "Posted Source No.");
        InspectReportHeader.SETRANGE("Item No.", "Item No.");
        InspectReportHeader.SETRANGE("Purch Line No", "Source Line No.");
        InspectReportHeader.SETRANGE(Status, TRUE);
        PAGE.RUN(PAGE::"Inspection Receipt List", InspectReportHeader);
        InspectReportHeader.RESET;
    end;

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

