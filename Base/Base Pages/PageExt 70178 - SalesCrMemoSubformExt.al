pageextension 70178 SalesCrMemoSubformExt extends "Sales Cr. Memo Subform"
{
    layout
    {
        /* modify(Control1)
        {
            ShowCaption = false;
        }
        modify(Control39)
        {
            ShowCaption = false;
        }
        modify(Control35)
        {
            ShowCaption = false;
        }
        modify(Control17)
        {
            ShowCaption = false;
        }
        modify(RefreshTotals)
        {
            ShowCaption = false;
        } */
        addbefore("IC Partner Code")
        {
            field("Service Tax Group"; "Service Tax Group")
            {
            }
        }
        addafter("IC Partner Reference")
        {
            field("Excise Prod. Posting Group"; "Excise Prod. Posting Group")
            {
            }
        }
        addafter(Description)
        {
            field("Spec ID"; "Spec ID")
            {
            }
            field("Quantity Accepted"; "Quantity Accepted")
            {
            }
            field("Quantity Rework"; "Quantity Rework")
            {
            }
            field("QC Enabled"; "QC Enabled")
            {
            }
            field("Quantity Rejected"; "Quantity Rejected")
            {
            }
        }
        addafter("Shortcut Dimension 2 Code")
        {
            field("Service Tax SBC %"; "Service Tax SBC %")
            {
            }
            field("Service Tax SBC Amount"; "Service Tax SBC Amount")
            {
            }
            field("KK Cess%"; "KK Cess%")
            {
            }
            field("KK Cess Amount"; "KK Cess Amount")
            {
            }
        }
    }
    actions
    {

        addafter("Get Return &Receipt Lines")
        {
            action("Create Inspection Data Sheets")
            {
                Caption = 'Create Inspection Data Sheets';
                Visible = false;

                trigger OnAction();
                begin
                    //This functionality was copied from page #44. Unsupported part was commented. Please check it.
                    /*CurrPage.SalesLines.Page.*/
                    CreateInspectionDataSheetForm;

                end;
            }
        }
        addafter(Dimensions)
        {
            group(Inspection)
            {
                Caption = 'Inspection';
                action("Inspection Data Sheets")
                {
                    Caption = 'Inspection Data Sheets';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #44. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        ShowDataSheetsForm;

                    end;
                }
                action("Posted Inspection Data Sheets")
                {
                    Caption = 'Posted Inspection Data Sheets';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #44. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        ShowPostDataSheetsForm;

                    end;
                }
                action("Inspection &Receipts")
                {
                    Caption = 'Inspection &Receipts';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #44. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        ShowInspectReceiptForm;

                    end;
                }
                action("Posted I&nspection Receipts")
                {
                    Caption = 'Posted I&nspection Receipts';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #44. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.Page.*/
                        ShowPostInspectReceiptForm;

                    end;
                }
            }
        }
    }



    procedure StrOrderLineDetailsPage();
    begin
    end;




    procedure "---QC---"();
    begin
    end;


    procedure ShowDataSheetsForm();
    var
        InspectDataSheet: Record "Inspection Datasheet Header";
    begin
        ShowDataSheets;
    end;


    procedure ShowPostDataSheetsForm();
    var
        PostInspectDataSheet: Record "Posted Inspect DatasheetHeader";
    begin
        ShowPostDataSheets;
    end;


    procedure ShowInspectReceiptForm();
    var
        InspectionReceipt: Record "Inspection Receipt Header";
    begin
        ShowInspectReceipt;
    end;


    procedure ShowPostInspectReceiptForm();
    var
        InspectionReceipt: Record "Inspection Receipt Header";
    begin
        ShowPostInspectReceipt;
    end;


    procedure CreateInspectionDataSheetForm();
    begin
        CreateInspectionDataSheets;
    end;


    procedure CancelInspection(var QualityStatus: Text[50]);
    begin
        TESTFIELD("No.");
        TESTFIELD("QC Enabled");
        CancelInspection(QualityStatus);
    end;


    procedure CloseInspection(var QualityStatus: Text[50]);
    begin
        TESTFIELD("No.");
        TESTFIELD("QC Enabled");
        CloseInspection(QualityStatus);
    end;



}

