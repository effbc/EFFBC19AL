pageextension 70263 WhseReceiptSubformExt extends "Whse. Receipt Subform"
{
    // version NAVW19.00.00.51552,NAVIN9.00.00.51552,QC1.0

    layout
    {

        //Unsupported feature: Change Name on "Control 1900000001". Please convert manually.

        modify("Control 1")
        {

            //Unsupported feature: Change Name on "Control 1". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change Name on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 12". Please convert manually.


        //Unsupported feature: Change Name on "Control 6". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 22". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 22". Please convert manually.


        //Unsupported feature: Change Name on "Control 14". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 14". Please convert manually.


        //Unsupported feature: Change Name on "Control 30". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 30". Please convert manually.


        //Unsupported feature: Change Name on "Control 16". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 16". Please convert manually.


        //Unsupported feature: Change Name on "Control 42". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 42". Please convert manually.


        //Unsupported feature: Change Name on "Control 40". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 40". Please convert manually.


        //Unsupported feature: Change Name on "Control 38". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 38". Please convert manually.


        //Unsupported feature: Change Name on "Control 20". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 20". Please convert manually.


        //Unsupported feature: Change Name on "Control 18". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 18". Please convert manually.


        //Unsupported feature: Change Name on "Control 34". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 34". Please convert manually.


        //Unsupported feature: Change Name on "Control 4". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 4". Please convert manually.


        //Unsupported feature: Change Name on "Control 46". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 46". Please convert manually.


        //Unsupported feature: Change Name on "Control 44". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 44". Please convert manually.


        //Unsupported feature: Change Name on "Control 32". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 32". Please convert manually.


        //Unsupported feature: Change Name on "Control 28". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 28". Please convert manually.


        //Unsupported feature: Change Name on "Control 48". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 48". Please convert manually.


        //Unsupported feature: Change Name on "Control 36". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 36". Please convert manually.


        //Unsupported feature: Change Name on "Control 8". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 8". Please convert manually.


        //Unsupported feature: Change Name on "Control 10". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 10". Please convert manually.


        //Unsupported feature: Change Name on "Control 2". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 2". Please convert manually.


        //Unsupported feature: Change Name on "Control 26". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 26". Please convert manually.


        //Unsupported feature: Change Name on "Control 24". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 24". Please convert manually.

        addafter("Control 30")
        {
            field("Quantity Accepted"; "Quantity Accepted")
            {
            }
            field("Quantity Rework"; "Quantity Rework")
            {
            }
            field("Quantity Rejected"; "Quantity Rejected")
            {
            }
            field("Qty. Sending To Quality"; "Qty. Sending To Quality")
            {
            }
            field("Qty. Sent To Quality"; "Qty. Sent To Quality")
            {
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.


        //Unsupported feature: Change Name on "Action 1907935204". Please convert manually.


        //Unsupported feature: Change Name on "Action 1900724404". Please convert manually.


        //Unsupported feature: Change AccessByPermission on "Action 1901313204". Please convert manually.


        //Unsupported feature: Change Name on "Action 1901313204". Please convert manually.


        //Unsupported feature: Change Name on "Action 1903867104". Please convert manually.


        //Unsupported feature: Change Name on "Action 3". Please convert manually.


        //Unsupported feature: Change Name on "Action 1901313504". Please convert manually.


        //Unsupported feature: Change Name on "Action 1900295904". Please convert manually.


        //Unsupported feature: Change AccessByPermission on "Action 1901742304". Please convert manually.


        //Unsupported feature: Change Name on "Action 1901742304". Please convert manually.


        //Unsupported feature: Change Name on "Action 1906587504". Please convert manually.


        //Unsupported feature: Change Name on "Action 1901073304". Please convert manually.


        //Unsupported feature: Change Name on "Action 1901564204". Please convert manually.


        //Unsupported feature: Change Name on "Action 1905408804". Please convert manually.

        addafter(ItemTrackingLines)
        {
            group(Inspection)
            {
                Caption = 'Inspection';
                action("Inspection Data Sheets")
                {
                    Caption = 'Inspection Data Sheets';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #5768. Unsupported part was commented. Please check it.
                        /*CurrPage.WhseReceiptLines.Page.*/
                        _ShowDataSheets;

                    end;
                }
                action(Action1901755704)
                {
                    Caption = 'Inspection Data Sheets';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #5768. Unsupported part was commented. Please check it.
                        /*CurrPage.WhseReceiptLines.Page.*/
                        _ShowPostDataSheets;

                    end;
                }
                action("Inspection &Receipts")
                {
                    Caption = 'Inspection &Receipts';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #5768. Unsupported part was commented. Please check it.
                        /*CurrPage.WhseReceiptLines.Page.*/
                        _ShowInspectReceipt;

                    end;
                }
                action("Posted I&nspection Receipts")
                {
                    Caption = 'Posted I&nspection Receipts';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #5768. Unsupported part was commented. Please check it.
                        /*CurrPage.WhseReceiptLines.Page.*/
                        _ShowPostInspectReceipt;

                    end;
                }
            }
        }
        addafter("Action 1901073304")
        {
            action("Create Inspection Data &Sheets")
            {
                Caption = 'Create Inspection Data &Sheets';

                trigger OnAction();
                begin
                    //This functionality was copied from page #5768. Unsupported part was commented. Please check it.
                    /*CurrPage.WhseReceiptLines.Page.*/
                    _CreateInspectionDataSheets;

                end;
            }
        }
    }


    //Unsupported feature: PropertyModification on "ShowSourceLine(PROCEDURE 1).WMSMgt(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ShowSourceLine : 7302;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ShowSourceLine : "WMS Management";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ShowBinContents(PROCEDURE 6).BinContent(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ShowBinContents : 7302;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ShowBinContents : "Bin Content";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "WhsePostRcptYesNo(PROCEDURE 3).WhseRcptLine(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //WhsePostRcptYesNo : 7317;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //WhsePostRcptYesNo : "Warehouse Receipt Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "WhsePostRcptYesNo(PROCEDURE 3).WhsePostReceiptYesNo(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //WhsePostRcptYesNo : 5761;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //WhsePostRcptYesNo : "Whse.-Post Receipt (Yes/No)";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "WhsePostRcptPrint(PROCEDURE 4).WhseRcptLine(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //WhsePostRcptPrint : 7317;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //WhsePostRcptPrint : "Warehouse Receipt Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "WhsePostRcptPrint(PROCEDURE 4).WhsePostReceiptPrint(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //WhsePostRcptPrint : 5762;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //WhsePostRcptPrint : "Whse.-Post Receipt + Print";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "WhsePostRcptPrintPostedRcpt(PROCEDURE 5).WhseRcptLine(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //WhsePostRcptPrintPostedRcpt : 7317;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //WhsePostRcptPrintPostedRcpt : "Warehouse Receipt Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "WhsePostRcptPrintPostedRcpt(PROCEDURE 5).WhsePostReceiptPrintPostedRcpt(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //WhsePostRcptPrintPostedRcpt : 5766;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //WhsePostRcptPrintPostedRcpt : "Whse.-Post Receipt + Pr. Pos.";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "AutofillQtyToReceive(PROCEDURE 10).WhseRcptLine(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //AutofillQtyToReceive : 7317;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AutofillQtyToReceive : "Warehouse Receipt Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "DeleteQtyToReceive(PROCEDURE 8).WhseRcptLine(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //DeleteQtyToReceive : 7317;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DeleteQtyToReceive : "Warehouse Receipt Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ShowCrossDockOpp(PROCEDURE 2).CrossDockMgt(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ShowCrossDockOpp : 5780;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ShowCrossDockOpp : "Whse. Cross-Dock Management";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CrossDockOpp2(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CrossDockOpp2 : 5768;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CrossDockOpp2 : "Whse. Cross-Dock Opportunity";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ItemAvailFormsMgt(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ItemAvailFormsMgt : 353;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ItemAvailFormsMgt : "Item Availability Forms Mgt";
    //Variable type has not been exported.

    (26487)]
    procedure "--QC"();
    begin
    end;

    (26490)]
    procedure _CreateInspectionDataSheets();
    begin
        CreateInspectionDataSheets;
    end;

    (26493)]
    procedure CreateInspectionDataSheets();
    begin
        CreateInspectionDataSheets;
    end;

    (26496)]
    procedure _ShowDataSheets();
    var
        InspectDataSheet: Record "Inspection Datasheet Header";
    begin
        ShowDataSheets;
    end;

    (26499)]
    procedure ShowDataSheets();
    var
        InspectDataSheet: Record "Inspection Datasheet Header";
    begin
        ShowDataSheets;
    end;

    (26502)]
    procedure _ShowPostDataSheets();
    var
        PostInspectDataSheet: Record "Posted Inspect DatasheetHeader";
    begin
        ShowPostDataSheets;
    end;

    (26505)]
    procedure ShowPostDataSheets();
    var
        PostInspectDataSheet: Record "Posted Inspect DatasheetHeader";
    begin
        ShowPostDataSheets;
    end;

    (26508)]
    procedure _ShowInspectReceipt();
    var
        InspectionReceipt: Record "Inspection Receipt Header";
    begin
        ShowInspectReceipt;
    end;

    (26511)]
    procedure ShowInspectReceipt();
    var
        InspectionReceipt: Record "Inspection Receipt Header";
    begin
        ShowInspectReceipt;
    end;

    (26514)]
    procedure _ShowPostInspectReceipt();
    var
        InspectionReceipt: Record "Inspection Receipt Header";
    begin
        ShowPostInspectReceipt;
    end;

    (26517)]
    procedure ShowPostInspectReceipt();
    var
        InspectionReceipt: Record "Inspection Receipt Header";
    begin
        ShowPostInspectReceipt;
    end;

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

