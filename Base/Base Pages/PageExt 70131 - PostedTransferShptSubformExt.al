pageextension 70131 PostedTransferShptSubformExt extends "Posted Transfer Shpt. Subform"
{
    // version NAVW19.00.00.48822,NAVIN9.00.00.48822,B2B1.0

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


        //Unsupported feature: Change Name on "Control 18". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 18". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500002". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500002". Please convert manually.


        //Unsupported feature: Change Name on "Control 10". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 10". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500006". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500006". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500004". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500004". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500008". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500008". Please convert manually.


        //Unsupported feature: Change Name on "Control 8". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 8". Please convert manually.


        //Unsupported feature: Change BlankZero on "Control 4". Please convert manually.


        //Unsupported feature: Change Name on "Control 4". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 4". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500001". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500001". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500005". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500005". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500007". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500007". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500009". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500009". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500020". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500020". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500000". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500000". Please convert manually.


        //Unsupported feature: Change Name on "Control 16". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 16". Please convert manually.


        //Unsupported feature: Change Name on "Control 6". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 28". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 28". Please convert manually.


        //Unsupported feature: Change Name on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 12". Please convert manually.


        //Unsupported feature: Change Name on "Control 14". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 14". Please convert manually.

        addafter("Control 1500008")
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
        addafter("Control 1500000")
        {
            field("Allow Excess Qty."; "Allow Excess Qty.")
            {
            }
        }
        addafter("Control 14")
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

        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.


        //Unsupported feature: Change Name on "Action 1907935204". Please convert manually.


        //Unsupported feature: Change AccessByPermission on "Action 1901313004". Please convert manually.


        //Unsupported feature: Change Name on "Action 1901313004". Please convert manually.


        //Unsupported feature: Change Name on "Action 1900545004". Please convert manually.


        //Unsupported feature: Change Name on "Action 1903119404". Please convert manually.

        addafter("Action 1903119404")
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


    //Unsupported feature: PropertyModification on "ShowStrDetailsForm(PROCEDURE 1500000).StrOrderLineDetails(Variable 1280001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ShowStrDetailsForm : 13798;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ShowStrDetailsForm : "Posted Str Order Line Details";
    //Variable type has not been exported.

    var
        StrOrderLineDetailsPage: Page "Posted Str Order Line Details";


    //Unsupported feature: CodeInsertion on "OnAfterGetRecord". Please convert manually.

    //trigger OnAfterGetRecord();
    //begin
    /*
    "Amount Including Excise" :="Excise Amount"+Amount;
    */
    //end;

    procedure StrOrderLineDetailsPage();
    begin
    end;


    //Unsupported feature: CodeModification on "ShowStrDetailsForm(PROCEDURE 1500000)". Please convert manually.

    //procedure ShowStrDetailsForm();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    StrOrderLineDetails.RESET;
    StrOrderLineDetails.SETCURRENTKEY("Invoice No.",Type,"Item No.");
    StrOrderLineDetails.SETRANGE("Invoice No.","Document No.");
    StrOrderLineDetails.SETRANGE(Type,StrOrderLineDetails.Type::Transfer);
    StrOrderLineDetails.SETRANGE("Item No.","Item No.");
    StrOrderLineDetails.SETRANGE("Line No.","Line No.");
    StrOrderLineDetailsForm.SETTABLEVIEW(StrOrderLineDetails);
    StrOrderLineDetailsForm.RUNMODAL;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..6
    StrOrderLineDetailsPage.SETTABLEVIEW(StrOrderLineDetails);
    StrOrderLineDetailsPage.RUNMODAL;
    */
    //end;

    [LineStart(26370)]
    procedure "----B2B---"();
    begin
    end;

    [LineStart(26373)]
    procedure ShowDataSheets();
    var
        InspectDataSheet: Record "Inspection Datasheet Header";
    begin
        InspectDataSheet.SETRANGE("Trans. Order No.", "Transfer Order No.");
        InspectDataSheet.SETRANGE("Trans. Order Line", "Transfer Order Line No.");
        InspectDataSheet.SETRANGE("Source Type", InspectDataSheet."Source Type"::"In Bound");
        PAGE.RUN(PAGE::"Inspection Data Sheet List", InspectDataSheet);
    end;

    [LineStart(26379)]
    procedure ShowPostDataSheets();
    var
        PostInspectDataSheet: Record "Posted Inspect DatasheetHeader";
    begin
        PostInspectDataSheet.SETRANGE("Trans. Order No.", "Transfer Order No.");
        PostInspectDataSheet.SETRANGE("Trans. Order Line", "Transfer Order Line No.");
        PostInspectDataSheet.SETRANGE("Source Type", PostInspectDataSheet."Source Type"::"In Bound");
        PAGE.RUN(PAGE::"Posted Inspect Data Sheet List", PostInspectDataSheet);
    end;

    [LineStart(26385)]
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

    [LineStart(26392)]
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

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

