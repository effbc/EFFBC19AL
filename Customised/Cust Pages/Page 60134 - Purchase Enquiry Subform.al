page 60134 "Purchase Enquiry Subform"
{
    // version POAU

    AutoSplitKey = true;
    Caption = 'Purchase Enquiry Subform';
    DelayedInsert = true;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Purchase Line";
    SourceTableView = WHERE(Document Type=FILTER(Enquiry));

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field(Type;Type)
                {
                }
                field("No.";"No.")
                {

                    trigger OnValidate();
                    begin
                        ShowShortcutDimCode(ShortcutDimCode);
                        //PoAutomation.CheckApprovedVendorInLine("Buy-from Vendor No.","No.");
                          NoOnAfterValidate;
                    end;
                }
                field(Description;Description)
                {
                }
                field("Description 2";"Description 2")
                {
                }
                field("Location Code";"Location Code")
                {
                }
                field(Quantity;Quantity)
                {
                    BlankZero = true;
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                }
                field("Expected Receipt Date";"Expected Receipt Date")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("E&xplode BOM")
                {
                    Caption = 'E&xplode BOM';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #60133. Unsupported part was commented. Please check it.
                        /*CurrPage.PurchLines.FORM.*/
                        ExplodeBOM;

                    end;
                }
                action("Insert &Ext. Texts")
                {
                    Caption = 'Insert &Ext. Texts';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #60133. Unsupported part was commented. Please check it.
                        /*CurrPage.PurchLines.FORM.*/
                        _InsertExtendedText(TRUE);

                    end;
                }
                action("&Attachments")
                {
                    Caption = '&Attachments';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #60133. Unsupported part was commented. Please check it.
                        /*CurrPage.PurchLines.FORM.*/
                        OpenAttachments;

                    end;
                }
            }
            group("&Line")
            {
                Caption = '&Line';
                group("Item Availability by")
                {
                    Caption = 'Item Availability by';
                    action(Period)
                    {
                        Caption = 'Period';

                        trigger OnAction();
                        begin
                            //This functionality was copied from page #60133. Unsupported part was commented. Please check it.
                            /*CurrPage.PurchLines.FORM.*/
                            _ItemAvailability(0);

                        end;
                    }
                    action(Variant)
                    {
                        Caption = 'Variant';

                        trigger OnAction();
                        begin
                            //This functionality was copied from page #60133. Unsupported part was commented. Please check it.
                            /*CurrPage.PurchLines.FORM.*/
                            _ItemAvailability(1);

                        end;
                    }
                    action(Location)
                    {
                        Caption = 'Location';

                        trigger OnAction();
                        begin
                            //This functionality was copied from page #60133. Unsupported part was commented. Please check it.
                            /*CurrPage.PurchLines.FORM.*/
                            _ItemAvailability(2);

                        end;
                    }
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        ShowShortcutDimCode(ShortcutDimCode);
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        Type := xRec.Type;
        CLEAR(ShortcutDimCode);
    end;

    var
        TransferExtendedText : Codeunit "Transfer Extended Text";
        ShortcutDimCode : array [8] of Code[20];
        PoAutomation : Codeunit "PO Automation";

    [LineStart(11760)]
    procedure ApproveCalcInvDisc();
    begin
        CODEUNIT.RUN(CODEUNIT::"Purch.-Disc. (Yes/No)",Rec);
    end;

    [LineStart(11763)]
    procedure CalcInvDisc();
    begin
        CODEUNIT.RUN(CODEUNIT::"Purch.-Calc.Discount",Rec);
    end;

    [LineStart(11766)]
    procedure ExplodeBOM();
    begin
        CODEUNIT.RUN(CODEUNIT::"Purch.-Explode BOM",Rec);
    end;

    [LineStart(11769)]
    procedure GetPhaseTaskStep();
    begin
        CODEUNIT.RUN(CODEUNIT::Codeunit75,Rec);
    end;

    [LineStart(11772)]
    procedure _InsertExtendedText(Unconditionally : Boolean);
    begin
        IF TransferExtendedText.PurchCheckIfAnyExtText(Rec,Unconditionally) THEN BEGIN
          CurrPage.SAVERECORD;
          TransferExtendedText.InsertPurchExtText(Rec);
        END;
        IF TransferExtendedText.MakeUpdate THEN
          UpdateForm(TRUE);
    end;

    [LineStart(11780)]
    procedure InsertExtendedText(Unconditionally : Boolean);
    begin
        IF TransferExtendedText.PurchCheckIfAnyExtText(Rec,Unconditionally) THEN BEGIN
          CurrPage.SAVERECORD;
          TransferExtendedText.InsertPurchExtText(Rec);
        END;
        IF TransferExtendedText.MakeUpdate THEN
          UpdateForm(TRUE);
    end;

    [LineStart(11788)]
    procedure _ItemAvailability(AvailabilityType : Option Date,Variant,Location,Bin);
    begin
        //Rec.InitType(AvailabilityType); //B2b1.0
    end;

    [LineStart(11791)]
    procedure ItemAvailability(AvailabilityType : Option Date,Variant,Location,Bin);
    begin
        //Rec.InitType(AvailabilityType); //B2b1.0
    end;

    [LineStart(11794)]
    procedure ShowDimensions();
    begin
        Rec.ShowDimensions;
    end;

    [LineStart(11797)]
    procedure ItemChargeAssgnt();
    begin
        Rec.ShowItemChargeAssgnt;
    end;

    [LineStart(11800)]
    procedure OpenItemTrackingLines();
    begin
        Rec.OpenItemTrackingLines;
    end;

    [LineStart(11803)]
    procedure UpdateForm(SetSaveRecord : Boolean);
    begin
        CurrPage.UPDATE(SetSaveRecord);
    end;

    [LineStart(11806)]
    procedure "---NAVIN---"();
    begin
    end;

    [LineStart(11809)]
    procedure ShowStrDetailsForm();
    var
        StrOrderLineDetails : Record "Structure Order Line Details";
        StrOrderLineDetailsForm : Page "Structure Order Line Details";
    begin
        StrOrderLineDetails.RESET;
        StrOrderLineDetails.SETRANGE(Type,StrOrderLineDetails.Type::Purchase);
        StrOrderLineDetails.SETRANGE("Document Type","Document Type");
        StrOrderLineDetails.SETRANGE("Document No.","Document No.");
        StrOrderLineDetails.SETRANGE("Item No.","No.");
        StrOrderLineDetails.SETRANGE("Line No.","Line No.");
        StrOrderLineDetailsForm.SETTABLEVIEW(StrOrderLineDetails);
        StrOrderLineDetailsForm.RUNMODAL;
    end;

    [LineStart(11819)]
    procedure "---B2B---"();
    begin
    end;

    [LineStart(11822)]
    procedure OpenAttachments();
    begin
        /*Attachment.RESET;
        Attachment.SETRANGE("Table ID",DATABASE::"Purchase Header");
        Attachment.SETRANGE("Document No.","Document No.");
        Attachment.SETRANGE("Document Type","Document Type");
        
        FORM.RUN(FORM::Form60117,Attachment);
         */

    end;

    [LineStart(11831)]
    local procedure NoOnAfterValidate();
    begin
        InsertExtendedText(FALSE);
        IF (Type = Type::"Charge (Item)") AND ("No." <> xRec."No.") AND
           (xRec."No." <> '')
        THEN
          CurrPage.SAVERECORD;
    end;
}

