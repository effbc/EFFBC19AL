pageextension 70131 PostedTransferShptSubformExt extends "Posted Transfer Shpt. Subform"
{


    layout
    {


        /* modify("Control1")
         {



             ShowCaption = false;
         }*/



        addbefore("Transfer-from Bin Code")
        {
            field("Reason Code"; "Reason Code")
            {
            }
            field("Spec ID"; "Spec ID")
            {
            }
            field("Quantity Accepted"; "Quantity Accepted")
            {
            }
            field("Quantity Rejected"; "Quantity Rejected")
            {
            }
            field("QC Enabled"; "QC Enabled")
            {
            }
            field("Qty. Sending To Quality"; "Qty. Sending To Quality")
            {
            }
            field("Qty. Sent To Quality"; "Qty. Sent To Quality")
            {
            }
            field("Qty. Sending To Quality(R)"; "Qty. Sending To Quality(R)")
            {
            }
            field("Position Reference No."; "Position Reference No.")
            {
            }
        }
        addbefore("Unit of Measure Code")
        {
            field("Allow Excess Qty."; "Allow Excess Qty.")
            {
            }
        }
        addafter("Shortcut Dimension 2 Code")
        {
            field("Unit Price"; "Unit Price")
            {
            }
            field("Excise Amount"; "Excise Amount")
            {
            }
            field(Amount; Amount)
            {
            }
            field("Amount Including Excise"; "Amount Including Excise")
            {
            }
            field("Assessable Value"; "Assessable Value")
            {
            }
        }
    }
    actions
    {



        addafter("Item &Tracking Lines")
        {
            group(Inspection)
            {
                Caption = 'Inspection';
                action("Inspection Data Sheets")
                {
                    Caption = 'Inspection Data Sheets';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #5743. Unsupported part was commented. Please check it.
                        /*CurrPage.TransferShipmentLines.Page.*/
                        ShowDataSheets;

                    end;
                }
                action("Posted Inspection Data Sheets")
                {
                    Caption = 'Posted Inspection Data Sheets';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #5743. Unsupported part was commented. Please check it.
                        /*CurrPage.TransferShipmentLines.Page.*/
                        ShowPostDataSheets;

                    end;
                }
                action("Inspection &Receipts")
                {
                    Caption = 'Inspection &Receipts';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #5743. Unsupported part was commented. Please check it.
                        /*CurrPage.TransferShipmentLines.Page.*/
                        ShowInspectReceipt;

                    end;
                }
                action("Posted I&nspection Receipts")
                {
                    Caption = 'Posted I&nspection Receipts';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #5743. Unsupported part was commented. Please check it.
                        /*CurrPage.TransferShipmentLines.Page.*/
                        ShowPostInspectReceipt;

                    end;
                }
            }
        }
    }




    var
    //StrOrderLineDetailsPage: Page "Posted Str Order Line Details";



    /*procedure StrOrderLineDetailsPage();
    begin
    end;*/





    procedure "----B2B---"();
    begin
    end;


    procedure ShowDataSheets();
    var
        InspectDataSheet: Record "Inspection Datasheet Header";
    begin
        InspectDataSheet.SETRANGE("Trans. Order No.", "Transfer Order No.");
        InspectDataSheet.SETRANGE("Trans. Order Line", "Transfer Order Line No.");
        InspectDataSheet.SETRANGE("Source Type", InspectDataSheet."Source Type"::"In Bound");
        PAGE.RUN(PAGE::"Inspection Data Sheet List", InspectDataSheet);
    end;


    procedure ShowPostDataSheets();
    var
        PostInspectDataSheet: Record "Posted Inspect DatasheetHeader";
    begin
        PostInspectDataSheet.SETRANGE("Trans. Order No.", "Transfer Order No.");
        PostInspectDataSheet.SETRANGE("Trans. Order Line", "Transfer Order Line No.");
        PostInspectDataSheet.SETRANGE("Source Type", PostInspectDataSheet."Source Type"::"In Bound");
        PAGE.RUN(PAGE::"Posted Inspect Data Sheet List", PostInspectDataSheet);
    end;


    procedure ShowInspectReceipt();
    var
        InspectionReceipt: Record "Inspection Receipt Header";
    begin
        InspectionReceipt.SETRANGE("Trans. Order No.", "Transfer Order No.");
        InspectionReceipt.SETRANGE("Trans. Order Line", "Transfer Order Line No.");
        InspectionReceipt.SETRANGE("Source Type", InspectionReceipt."Source Type"::"In Bound");
        InspectionReceipt.SETRANGE(Status, FALSE);
        PAGE.RUN(PAGE::"Inspection Receipt List", InspectionReceipt);
    end;


    procedure ShowPostInspectReceipt();
    var
        InspectionReceipt: Record "Inspection Receipt Header";
    begin
        InspectionReceipt.SETRANGE("Trans. Order No.", "Transfer Order No.");
        InspectionReceipt.SETRANGE("Trans. Order Line", "Transfer Order Line No.");
        InspectionReceipt.SETRANGE("Source Type", InspectionReceipt."Source Type"::"In Bound");
        InspectionReceipt.SETRANGE(Status, TRUE);
        PAGE.RUN(PAGE::"Inspection Receipt List", InspectionReceipt);
    end;



}

