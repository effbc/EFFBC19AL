page 60021 "Sales Quote Subform-Design"
{
    // version B2B1.0,DWS1.0,SH1.0

    AutoSplitKey = true;
    Caption = 'Sales Quote Subform';
    DelayedInsert = true;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Sales Line";
    SourceTableView = WHERE(Document Type=FILTER(Quote));

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field(Type;Type)
                {
                    Editable = false;
                }
                field("No.";"No.")
                {
                    Editable = false;

                    trigger OnValidate();
                    begin
                        ShowShortcutDimCode(ShortcutDimCode);
                          NoOnAfterValidate;
                    end;
                }
                field(Description;Description)
                {
                    Editable = false;
                }
                field("Location Code";"Location Code")
                {
                    Editable = false;
                }
                field(Quantity;Quantity)
                {
                    BlankZero = true;
                    Editable = false;

                    trigger OnValidate();
                    begin
                        QuantityOnAfterValidate;
                    end;
                }
                field("Production BOM No.";"Production BOM No.")
                {
                }
                field("Production Bom Version No.";"Production Bom Version No.")
                {
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                    Editable = false;

                    trigger OnValidate();
                    begin
                        UnitofMeasureCodeOnAfterValida;
                    end;
                }
                field("Unit of Measure";"Unit of Measure")
                {
                    Editable = false;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                action(DesignWorksheet)
                {
                    Caption = 'DesignWorksheet';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #60020. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.FORM.*/
                        ShowSalesOrderWorkSheet;

                    end;
                }
                action(Schedule)
                {
                    Caption = 'Schedule';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #60020. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.FORM.*/
                        ShowSchedule;

                    end;
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
        SalesHeader : Record "Sales Header";
        TransferExtendedText : Codeunit "Transfer Extended Text";
        SalesPriceCalcMgt : Codeunit "Sales Price Calc. Mgt.";
        ShortcutDimCode : array [8] of Code[20];

    (5250)]
    procedure ApproveCalcInvDisc();
    begin
        CODEUNIT.RUN(CODEUNIT::"Sales-Disc. (Yes/No)",Rec);
    end;

    (5253)]
    procedure CalcInvDisc();
    begin
        CODEUNIT.RUN(CODEUNIT::"Sales-Calc. Discount",Rec);
    end;

    (5256)]
    procedure ExplodeBOM();
    begin
        CODEUNIT.RUN(CODEUNIT::"Sales-Explode BOM",Rec);
    end;

    (5259)]
    procedure InsertExtendedText(Unconditionally : Boolean);
    begin
        IF TransferExtendedText.SalesCheckIfAnyExtText(Rec,Unconditionally) THEN BEGIN
          CurrPage.SAVERECORD;
          TransferExtendedText.InsertSalesExtText(Rec);
        END;
        IF TransferExtendedText.MakeUpdate THEN
          UpdateForm(TRUE);
    end;

    (5267)]
    procedure ItemAvailability(AvailabilityType : Option Date,Variant,Location,Bin);
    begin
        //Rec.ItemAvailability(AvailabilityType); //B2b1.0
    end;

    (5270)]
    procedure ShowDimensions();
    begin
        Rec.ShowDimensions;
    end;

    (5273)]
    procedure OpenItemTrackingLines();
    begin
        Rec.OpenItemTrackingLines;
    end;

    (5276)]
    procedure ShowItemSub();
    begin
        Rec.ShowItemSub;
    end;

    (5279)]
    procedure ShowNonstockItems();
    begin
        Rec.ShowNonstock;
    end;

    (5282)]
    procedure ItemChargeAssgnt();
    begin
        Rec.ShowItemChargeAssgnt;
    end;

    (5285)]
    procedure UpdateForm(SetSaveRecord : Boolean);
    begin
        CurrPage.UPDATE(SetSaveRecord);
    end;

    (5288)]
    procedure ShowPrices();
    begin
        SalesHeader.GET("Document Type","Document No.");
        SalesPriceCalcMgt.GetSalesLinePrice(SalesHeader,Rec);
    end;

    (5292)]
    procedure ShowLineDisc();
    begin
        SalesHeader.GET("Document Type","Document No.");
        SalesPriceCalcMgt.GetSalesLineLineDisc(SalesHeader,Rec);
    end;

    (5296)]
    procedure "---NAVIN---"();
    begin
    end;

    (5299)]
    procedure ShowStrDetailsForm();
    var
        StrOrderLineDetails : Record "Structure Order Line Details";
        StrOrderLineDetailsForm : Page "Structure Order Line Details";
    begin
        StrOrderLineDetails.RESET;
        StrOrderLineDetails.SETRANGE(Type,StrOrderLineDetails.Type::Sale);
        StrOrderLineDetails.SETRANGE("Document Type","Document Type");
        StrOrderLineDetails.SETRANGE("Document No.","Document No.");
        StrOrderLineDetails.SETRANGE("Item No.","No.");
        StrOrderLineDetails.SETRANGE("Line No.","Line No.");
        StrOrderLineDetailsForm.SETTABLEVIEW(StrOrderLineDetails);
        StrOrderLineDetailsForm.RUNMODAL;
    end;

    (5309)]
    procedure "---B2B---"();
    begin
    end;

    (5312)]
    procedure CustAttachments();
    var
        CustAttach : Record Attachments;
    begin
        CustAttach.RESET;
        CustAttach.SETRANGE("Table ID",DATABASE::"Sales Header");
        CustAttach.SETRANGE("Document No.",Rec."Document No.");
        CustAttach.SETRANGE("Document Type","Document Type"::Quote);

        PAGE.RUN(PAGE::"ESPL Attachments",CustAttach);
    end;

    (5320)]
    procedure ShowSalesOrderWorkSheet();
    var
        DesignWorksheetHeader : Record "Design Worksheet Header";
        DesignWorksheetLine : Record "Design Worksheet Line";
        Item : Record Item;
        ItemDesignWorksheetHeader : Record "Item Design Worksheet Header";
        ItemDesignWorksheetLine : Record "Item Design Worksheet Line";
    begin
        /*//TESTFIELD("Document Type");
        TESTFIELD("Document No.");
        TESTFIELD("Line No.");
        
        CLEAR(DesignWorksheetHeader);
        DesignWorksheetHeader.SETRANGE("Document Type",DesignWorksheetHeader."Document Type"::Quote);
        DesignWorksheetHeader.SETRANGE("Document No.","Document No.");
        DesignWorksheetHeader.FILTERGROUP(2);
        DesignWorksheetHeader.SETRANGE("Document Line No.","Line No.");
        Page.RUNMODAL(Page::"Design Worksheet",DesignWorksheetHeader);
        DesignWorksheetHeader.FILTERGROUP(0);
        */
        //TESTFIELD("Document Type");
        TESTFIELD("Document No.");
        TESTFIELD("Line No.");
        ItemDesignWorksheetHeader.RESET;
        IF ItemDesignWorksheetHeader.GET("No.") THEN BEGIN
          DesignWorksheetHeader.INIT;
          DesignWorksheetHeader.TRANSFERFIELDS(ItemDesignWorksheetHeader);
          DesignWorksheetHeader."Document No.":="Document No.";
          DesignWorksheetHeader."Document Line No.":="Line No.";
          DesignWorksheetHeader."Document Type":=DesignWorksheetHeader."Document Type"::Quote;
          IF DesignWorksheetHeader.INSERT THEN;
          ItemDesignWorksheetLine.RESET;
          ItemDesignWorksheetLine.SETRANGE(ItemDesignWorksheetLine."Item No",ItemDesignWorksheetHeader."Item No.");
          IF ItemDesignWorksheetLine.FINDSET THEN
            REPEAT
              DesignWorksheetLine.INIT;
              DesignWorksheetLine.TRANSFERFIELDS(ItemDesignWorksheetLine);
              DesignWorksheetLine."Document No.":="Document No.";
              DesignWorksheetLine."Document Line No.":="Line No.";
              DesignWorksheetLine."Document Type":=DesignWorksheetLine."Document Type"::Quote;
              IF DesignWorksheetLine.INSERT THEN;
            UNTIL ItemDesignWorksheetLine.NEXT=0;
        END;
        COMMIT;
        
        CLEAR(DesignWorksheetHeader);
        DesignWorksheetHeader.SETRANGE("Document Type",DesignWorksheetHeader."Document Type"::Quote);
        DesignWorksheetHeader.SETRANGE("Document No.","Document No.");
        DesignWorksheetHeader.FILTERGROUP(2);
        DesignWorksheetHeader.SETRANGE("Document Line No.","Line No.");
        PAGE.RUNMODAL(PAGE::"Design Worksheet",DesignWorksheetHeader);
        DesignWorksheetHeader.FILTERGROUP(0);

    end;

    (5366)]
    procedure ShowSchedule2();
    var
        schedule : Record Schedule2;
    begin
        schedule.SETRANGE("Document Type",schedule."Document Type" :: Order);
        schedule.SETRANGE("Document No.","Document No.");
        schedule.SETRANGE("Document Line No.","Line No.");
        PAGE.RUNMODAL(60125,schedule);
    end;

    (5372)]
    procedure ShowSchedule();
    var
        schedule : Record Schedule2;
    begin
        schedule.SETRANGE("Document Type",schedule."Document Type" :: Order);
        schedule.SETRANGE("Document No.","Document No.");
        schedule.SETRANGE("Document Line No.","Line No.");
        PAGE.RUNMODAL(60129,schedule);
    end;

    (5378)]
    local procedure NoOnAfterValidate();
    begin
        InsertExtendedText(FALSE);
        IF (Type = Type::"Charge (Item)") AND ("No." <> xRec."No.") AND
           (xRec."No." <> '')
        THEN
          CurrPage.SAVERECORD;
    end;

    (5385)]
    local procedure QuantityOnAfterValidate();
    begin
        IF Reserve = Reserve::Always THEN BEGIN
          CurrPage.SAVERECORD;
          AutoReserve;
        END;
    end;

    (5391)]
    local procedure UnitofMeasureCodeOnAfterValida();
    begin
        IF Reserve = Reserve::Always THEN BEGIN
          CurrPage.SAVERECORD;
          AutoReserve;
        END;
    end;
}

