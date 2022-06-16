pageextension 70243 TransferOrderSubformExt extends "Transfer Order Subform"
{

    layout
    {



        /*  modify("Control1")
          {


              ShowCaption = false;
          }*/


        addafter("Control 1500016")
        {
            field("Excise Prod. Posting Group"; Rec."Excise Prod. Posting Group")
            {
                ApplicationArea = All;
            }
            field("Excise Bus. Posting Group"; Rec."Excise Bus. Posting Group")
            {
                ApplicationArea = All;
            }
        }
        addafter("Appl.-to Item Entry")
        {
            field("DL Model"; Rec."DL Model")
            {
                ApplicationArea = All;
            }
            field(Type; Rec.Type)
            {
                ApplicationArea = All;
            }
            field(Station; Rec.Station)
            {
                ApplicationArea = All;
            }
            field("Station Name"; Rec."Station Name")
            {
                ApplicationArea = All;
            }
            field("Requirement Reason"; Rec."Requirement Reason")
            {
                ApplicationArea = All;
            }
            field("Required Date"; Rec."Required Date")
            {
                ApplicationArea = All;
            }
            field(Priority; Rec.Priority)
            {
                ApplicationArea = All;
            }
            field("Promised Receipt Date"; Rec."Promised Receipt Date")
            {
                ApplicationArea = All;
            }
            field("Status."; Rec."Status.")
            {
                ApplicationArea = All;

                trigger OnValidate();
                begin
                    StatusOnAfterValidate;
                end;
            }
            field(Remarks; Rec.Remarks)
            {
                ApplicationArea = All;
            }
            field(Reason; Rec.Reason)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {


        addafter(Reserve)
        {
            action("Create Inspection Data &Sheets")
            {
                Caption = 'Create Inspection Data &Sheets';
                ApplicationArea = All;

                trigger OnAction();
                begin
                    //This functionality was copied from page #5740. Unsupported part was commented. Please check it.
                    /*CurrPage.TransferLines.Page.*/
                    _CreateInspectionDataSheets;

                end;
            }
        }
        addafter("Action 1500013")
        {
            group(Inspection)
            {
                Caption = 'Inspection';
                action("Inspection Data Sheets")
                {
                    Caption = 'Inspection Data Sheets';
                    ApplicationArea = All;

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #5740. Unsupported part was commented. Please check it.
                        /*CurrPage.TransferLines.Page.*/
                        _ShowDataSheets;

                    end;
                }
                action("Posted Inspection Data Sheets")
                {
                    Caption = 'Posted Inspection Data Sheets';
                    ApplicationArea = All;

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #5740. Unsupported part was commented. Please check it.
                        /*CurrPage.TransferLines.Page.*/
                        _ShowPostDataSheets;

                    end;
                }
                action("Inspection &Receipts")
                {
                    Caption = 'Inspection &Receipts';
                    ApplicationArea = All;

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #5740. Unsupported part was commented. Please check it.
                        /*CurrPage.TransferLines.Page.*/
                        _ShowInspectReceipt;

                    end;
                }
                action("Posted I&nspection Receipts")
                {
                    Caption = 'Posted I&nspection Receipts';
                    ApplicationArea = All;

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #5740. Unsupported part was commented. Please check it.
                        /*CurrPage.TransferLines.Page.*/
                        _ShowPostInspectReceipt;

                    end;
                }
            }
        }
    }




    var
        StrOrderLineDetailsPage: Page "Structure Order Line Details";



    /* procedure StrOrderLineDetailsPage();
     begin
     end;*/



    procedure "--B2B--"();
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

 x
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

   
    procedure CancelInspection(var QualityStatus: Text[50]);
    begin
        TESTFIELD("QC Enabled");
        "Cancel Inspection"(QualityStatus);
    end;

  x
    procedure CloseInspection(var QualityStatus: Text[50]);
    begin
        TESTFIELD("QC Enabled");
        "Close Inspection"(QualityStatus);
    end;


    procedure "AssignSerialNo."();
    begin
        AssignSerialNo;
    end;

   
    procedure QCOverride();
    begin
        QCOverride;
    end;

   
    procedure AllowExcessQty();
    begin
        IF USERID = 'SUPER' THEN
            IF "Allow Excess Qty." = FALSE THEN BEGIN
                "Allow Excess Qty." := TRUE;
                MODIFY;
            END;
    end;

   
    local procedure StatusOnAfterValidate();
    begin
        IF "Status." = "Status."::ToBePlanned THEN BEGIN
            TESTFIELD(Remarks);
        END;
    end;

  
    local procedure PromisedReceiptDateOnInputChan(var Text: Text[1024]);
    begin
        IF "Promised Receipt Date" > 0D THEN
            TESTFIELD(Remarks);
    end;

    
    local procedure ReasonOnInputChange(var Text: Text[1024]);
    begin
        ERROR('Please Enter the Reason In "Required Reason Field"');
    end;

   

}

