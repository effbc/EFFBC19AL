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




    procedure "--QC"();
    begin
    end;


    procedure _CreateInspectionDataSheets();
    begin
        CreateInspectionDataSheets;
    end;


    procedure CreateInspectionDataSheets();
    begin
        CreateInspectionDataSheets;
    end;


    procedure _ShowDataSheets();
    var
        InspectDataSheet: Record "Inspection Datasheet Header";
    begin
        ShowDataSheets;
    end;


    procedure ShowDataSheets();
    var
        InspectDataSheet: Record "Inspection Datasheet Header";
    begin
        ShowDataSheets;
    end;


    procedure _ShowPostDataSheets();
    var
        PostInspectDataSheet: Record "Posted Inspect DatasheetHeader";
    begin
        ShowPostDataSheets;
    end;


    procedure ShowPostDataSheets();
    var
        PostInspectDataSheet: Record "Posted Inspect DatasheetHeader";
    begin
        ShowPostDataSheets;
    end;


    procedure _ShowInspectReceipt();
    var
        InspectionReceipt: Record "Inspection Receipt Header";
    begin
        ShowInspectReceipt;
    end;


    procedure ShowInspectReceipt();
    var
        InspectionReceipt: Record "Inspection Receipt Header";
    begin
        ShowInspectReceipt;
    end;


    procedure _ShowPostInspectReceipt();
    var
        InspectionReceipt: Record "Inspection Receipt Header";
    begin
        ShowPostInspectReceipt;
    end;


    procedure ShowPostInspectReceipt();
    var
        InspectionReceipt: Record "Inspection Receipt Header";
    begin
        ShowPostInspectReceipt;
    end;


}

