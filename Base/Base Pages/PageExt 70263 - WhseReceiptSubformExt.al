pageextension 70263 WhseReceiptSubformExt extends "Whse. Receipt Subform"
{


    layout
    {


        modify("Control 1")
        {



            ShowCaption = false;
        }


        addafter("Control 30")
        {
            field("Quantity Accepted"; Rec."Quantity Accepted")
            {
            }
            field("Quantity Rework"; Rec."Quantity Rework")
            {
            }
            field("Quantity Rejected"; Rec."Quantity Rejected")
            {
            }
            field("Qty. Sending To Quality"; Rec."Qty. Sending To Quality")
            {
            }
            field("Qty. Sent To Quality"; Rec."Qty. Sent To Quality")
            {
            }
        }
    }
    actions
    {


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




<<<<<<< HEAD
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
=======
>>>>>>> 75554976da0214e9ec70a45a874425238783b297
    procedure "--QC"();
    begin
    end;

<<<<<<< HEAD
    (26490)]
=======

>>>>>>> 75554976da0214e9ec70a45a874425238783b297
    procedure _CreateInspectionDataSheets();
    begin
        CreateInspectionDataSheets;
    end;

<<<<<<< HEAD
    (26493)]
=======

>>>>>>> 75554976da0214e9ec70a45a874425238783b297
    procedure CreateInspectionDataSheets();
    begin
        CreateInspectionDataSheets;
    end;

<<<<<<< HEAD
    (26496)]
=======

>>>>>>> 75554976da0214e9ec70a45a874425238783b297
    procedure _ShowDataSheets();
    var
        InspectDataSheet: Record "Inspection Datasheet Header";
    begin
        ShowDataSheets;
    end;

<<<<<<< HEAD
    (26499)]
=======

>>>>>>> 75554976da0214e9ec70a45a874425238783b297
    procedure ShowDataSheets();
    var
        InspectDataSheet: Record "Inspection Datasheet Header";
    begin
        ShowDataSheets;
    end;

<<<<<<< HEAD
    (26502)]
=======

>>>>>>> 75554976da0214e9ec70a45a874425238783b297
    procedure _ShowPostDataSheets();
    var
        PostInspectDataSheet: Record "Posted Inspect DatasheetHeader";
    begin
        ShowPostDataSheets;
    end;

<<<<<<< HEAD
    (26505)]
=======

>>>>>>> 75554976da0214e9ec70a45a874425238783b297
    procedure ShowPostDataSheets();
    var
        PostInspectDataSheet: Record "Posted Inspect DatasheetHeader";
    begin
        ShowPostDataSheets;
    end;

<<<<<<< HEAD
    (26508)]
=======

>>>>>>> 75554976da0214e9ec70a45a874425238783b297
    procedure _ShowInspectReceipt();
    var
        InspectionReceipt: Record "Inspection Receipt Header";
    begin
        ShowInspectReceipt;
    end;

<<<<<<< HEAD
    (26511)]
=======

>>>>>>> 75554976da0214e9ec70a45a874425238783b297
    procedure ShowInspectReceipt();
    var
        InspectionReceipt: Record "Inspection Receipt Header";
    begin
        ShowInspectReceipt;
    end;

<<<<<<< HEAD
    (26514)]
=======

>>>>>>> 75554976da0214e9ec70a45a874425238783b297
    procedure _ShowPostInspectReceipt();
    var
        InspectionReceipt: Record "Inspection Receipt Header";
    begin
        ShowPostInspectReceipt;
    end;

<<<<<<< HEAD
    (26517)]
=======

>>>>>>> 75554976da0214e9ec70a45a874425238783b297
    procedure ShowPostInspectReceipt();
    var
        InspectionReceipt: Record "Inspection Receipt Header";
    begin
        ShowPostInspectReceipt;
    end;


}

