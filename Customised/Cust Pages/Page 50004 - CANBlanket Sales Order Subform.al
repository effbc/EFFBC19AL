page 50004 "CANBlanket Sales Order Subform"
{
    // version NAVW13.60,NAVIN3.70.00.11,SH1.0

    AutoSplitKey = true;
    Caption = 'CANBlanket Sales Order Subform';
    DelayedInsert = true;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Sales Line";
    SourceTableView = WHERE(Document Type=FILTER(Blanket Order));

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
                          NoOnAfterValidate;
                    end;
                }
                field("Cross-Reference No.";"Cross-Reference No.")
                {
                    Visible = false;
                }
                field("Variant Code";"Variant Code")
                {
                    Visible = false;
                }
                field(Description;Description)
                {
                }
                field("Location Code";"Location Code")
                {
                }
                field("Prod. Order Quantity";"Prod. Order Quantity")
                {
                }
                field("Prod. Qty";"Prod. Qty")
                {
                }
                field("Prod. Due Date";"Prod. Due Date")
                {
                }
                field("Tax Area Code";"Tax Area Code")
                {
                    Visible = false;
                }
                field("Form Code";"Form Code")
                {
                    Visible = false;
                }
                field("Form No.";"Form No.")
                {
                    Visible = false;
                }
                field(Quantity;Quantity)
                {
                    BlankZero = true;

                    trigger OnValidate();
                    begin
                        QuantityOnAfterValidate;
                    end;
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {

                    trigger OnValidate();
                    begin
                        UnitofMeasureCodeOnAfterValida;
                    end;
                }
                field("Unit of Measure";"Unit of Measure")
                {
                    Visible = false;
                }
                field("Unit Cost (LCY)";"Unit Cost (LCY)")
                {
                    Visible = false;
                }
                field(PriceExists;PriceExists)
                {
                    Caption = 'Sale Price Exists';
                    Editable = false;
                    Visible = false;
                }
                field("Unit Price";"Unit Price")
                {
                    BlankZero = true;
                }
                field("Line Amount";"Line Amount")
                {
                    BlankZero = true;
                }
                field(LineDiscExists;LineDiscExists)
                {
                    Caption = 'Sales Line Disc. Exists';
                    Editable = false;
                    Visible = false;
                }
                field("Line Discount %";"Line Discount %")
                {
                    BlankZero = true;
                }
                field("Line Discount Amount";"Line Discount Amount")
                {
                    Visible = false;
                }
                field("Tax %";"Tax %")
                {
                    Visible = false;
                }
                field("Tax Amount";"Tax Amount")
                {
                    Visible = false;
                }
                field("Excise Amount";"Excise Amount")
                {
                    Visible = false;
                }
                field("Allow Invoice Disc.";"Allow Invoice Disc.")
                {
                    Visible = false;
                }
                field("Qty. to Ship";"Qty. to Ship")
                {
                    BlankZero = true;
                }
                field("Quantity Shipped";"Quantity Shipped")
                {
                    BlankZero = true;
                }
                field("Quantity Invoiced";"Quantity Invoiced")
                {
                    BlankZero = true;
                }
                field("Shipment Date";"Shipment Date")
                {
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                    Visible = false;
                }
                field("ShortcutDimCode[3]";ShortcutDimCode[3])
                {
                    CaptionClass = '1,2,3';
                    Visible = false;

                    trigger OnLookup(Text : Text) : Boolean;
                    begin
                        LookupShortcutDimCode(3,ShortcutDimCode[3]);
                    end;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(3,ShortcutDimCode[3]);
                    end;
                }
                field("ShortcutDimCode[4]";ShortcutDimCode[4])
                {
                    CaptionClass = '1,2,4';
                    Visible = false;

                    trigger OnLookup(Text : Text) : Boolean;
                    begin
                        LookupShortcutDimCode(4,ShortcutDimCode[4]);
                    end;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(4,ShortcutDimCode[4]);
                    end;
                }
                field("ShortcutDimCode[5]";ShortcutDimCode[5])
                {
                    CaptionClass = '1,2,5';
                    Visible = false;

                    trigger OnLookup(Text : Text) : Boolean;
                    begin
                        LookupShortcutDimCode(5,ShortcutDimCode[5]);
                    end;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(5,ShortcutDimCode[5]);
                    end;
                }
                field("ShortcutDimCode[6]";ShortcutDimCode[6])
                {
                    CaptionClass = '1,2,6';
                    Visible = false;

                    trigger OnLookup(Text : Text) : Boolean;
                    begin
                        LookupShortcutDimCode(6,ShortcutDimCode[6]);
                    end;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(6,ShortcutDimCode[6]);
                    end;
                }
                field("ShortcutDimCode[7]";ShortcutDimCode[7])
                {
                    CaptionClass = '1,2,7';
                    Visible = false;

                    trigger OnLookup(Text : Text) : Boolean;
                    begin
                        LookupShortcutDimCode(7,ShortcutDimCode[7]);
                    end;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(7,ShortcutDimCode[7]);
                    end;
                }
                field("ShortcutDimCode[8]";ShortcutDimCode[8])
                {
                    CaptionClass = '1,2,8';
                    Visible = false;

                    trigger OnLookup(Text : Text) : Boolean;
                    begin
                        LookupShortcutDimCode(8,ShortcutDimCode[8]);
                    end;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(8,ShortcutDimCode[8]);
                    end;
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
                action("Calculate &Invoice Discount")
                {
                    Caption = 'Calculate &Invoice Discount';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #50003. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.FORM.*/
                        ApproveCalcInvDisc;

                    end;
                }
                action("Get &Price")
                {
                    Caption = 'Get &Price';
                    Ellipsis = true;

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #50003. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.FORM.*/
                        ShowPrices

                    end;
                }
                action("Get Li&ne Discount")
                {
                    Caption = 'Get Li&ne Discount';
                    Ellipsis = true;

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #50003. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.FORM.*/
                        ShowLineDisc

                    end;
                }
                action("E&xplode BOM")
                {
                    Caption = 'E&xplode BOM';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #50003. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.FORM.*/
                        ExplodeBOM;

                    end;
                }
                action("Insert &Ext. Texts")
                {
                    Caption = 'Insert &Ext. Texts';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #50003. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.FORM.*/
                        _InsertExtendedText(TRUE);

                    end;
                }
            }
            group("&Line")
            {
                Caption = '&Line';
                action(Dimensions)
                {
                    Caption = 'Dimensions';
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #50003. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.FORM.*/
                        _ShowDimensions;

                    end;
                }
                action("Structure Details")
                {
                    Caption = 'Structure Details';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #50003. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.FORM.*/
                        ShowStrDetailsForm;

                    end;
                }
                action("Sc&hedule")
                {
                    Caption = 'Sc&hedule';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #50003. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.FORM.*/
                        ShowSchedule;

                    end;
                }
                action("Design WorkSheet")
                {
                    Caption = 'Design WorkSheet';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #50003. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.FORM.*/
                        ShowSalesOrderWorkSheet;

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
        SalesPlanLine : Record "Sales Planning Line";
        Text001 : Label 'Prod. Order is already created against the Sales Order.';

    [LineStart(60)]
    procedure ApproveCalcInvDisc();
    begin
        CODEUNIT.RUN(CODEUNIT::"Sales-Disc. (Yes/No)",Rec);
    end;

    [LineStart(63)]
    procedure CalcInvDisc();
    begin
        CODEUNIT.RUN(CODEUNIT::"Sales-Calc. Discount",Rec);
    end;

    [LineStart(66)]
    procedure ExplodeBOM();
    begin
        CODEUNIT.RUN(CODEUNIT::"Sales-Explode BOM",Rec);
    end;

    [LineStart(69)]
    procedure _InsertExtendedText(Unconditionally : Boolean);
    begin
        IF TransferExtendedText.SalesCheckIfAnyExtText(Rec,Unconditionally) THEN BEGIN
          CurrPage.SAVERECORD;
          TransferExtendedText.InsertSalesExtText(Rec);
        END;
        IF TransferExtendedText.MakeUpdate THEN
          UpdateForm(TRUE);
    end;

    [LineStart(77)]
    procedure InsertExtendedText(Unconditionally : Boolean);
    begin
        IF TransferExtendedText.SalesCheckIfAnyExtText(Rec,Unconditionally) THEN BEGIN
          CurrPage.SAVERECORD;
          TransferExtendedText.InsertSalesExtText(Rec);
        END;
        IF TransferExtendedText.MakeUpdate THEN
          UpdateForm(TRUE);
    end;

    [LineStart(85)]
    procedure _ItemAvailability(AvailabilityType : Option Date,Variant,Location,Bin);
    begin
        //Rec.ItemAvailability(AvailabilityType);// B2B1.0
    end;

    [LineStart(88)]
    procedure ItemAvailability(AvailabilityType : Option Date,Variant,Location,Bin);
    begin
        //Rec.ItemAvailability(AvailabilityType);  // B2B1.0
    end;

    [LineStart(91)]
    procedure _ShowDimensions();
    begin
        Rec.ShowDimensions;
    end;

    [LineStart(94)]
    procedure ShowDimensions();
    begin
        Rec.ShowDimensions;
    end;

    [LineStart(97)]
    procedure UpdateForm(SetSaveRecord : Boolean);
    begin
        CurrPage.UPDATE(SetSaveRecord);
    end;

    [LineStart(100)]
    procedure ShowPrices();
    begin
        SalesHeader.GET("Document Type","Document No.");
        SalesPriceCalcMgt.GetSalesLinePrice(SalesHeader,Rec);
    end;

    [LineStart(104)]
    procedure ShowLineDisc();
    begin
        SalesHeader.GET("Document Type","Document No.");
        SalesPriceCalcMgt.GetSalesLineLineDisc(SalesHeader,Rec);
    end;

    [LineStart(108)]
    procedure "---NAVIN---"();
    begin
    end;

    [LineStart(111)]
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

    [LineStart(121)]
    procedure "--B2B1.0--"();
    begin
    end;

    [LineStart(124)]
    procedure ShowSchedule();
    var
        Schedule : Record Schedule2;
        SalesLine : Record "Sales Line";
    begin
        /*
        //IF ("Tender No." = '')  AND ("Tender Line No." =0) THEN BEGIN
          Schedule.RESET;
          Schedule.SETRANGE("Document Type",Schedule."Document Type" :: "Blanket Order");
          Schedule.SETRANGE("Document No.","Document No.");
          Schedule.SETRANGE("Document Line No.","Line No.");
          //Schedule.SETRANGE("Item No.","No.");
          //Schedule.SETRANGE(Quantity,Quantity);
          Page.RUN(60125,Schedule);
        
        //END ELSE BEGIN
          Schedule.RESET;
          Schedule.SETRANGE("Document Type",Schedule."Document Type" :: Tender);
          Schedule.SETRANGE("Document No.","Tender No.");
          Schedule.SETRANGE("Document Line No.","Tender Line No.");
          //Schedule.SETRANGE("Item No.","No.");
          //Schedule.SETRANGE(Quantity,Quantity);
          Schedule.FILTERGROUP(2);
          Page.RUN(60127,Schedule);
          Schedule.FILTERGROUP(0);
        END;
        */
        
        IF Type=Type::Item THEN BEGIN
        IF ("Tender No." <> '')  AND ("Tender Line No." <>0) THEN BEGIN
          Schedule.RESET;
          Schedule.SETRANGE("Document Type",Schedule."Document Type" ::"Blanket Order");
          Schedule.SETRANGE("Document No.","Document No.");
          Schedule.SETRANGE("Document Line No.","Line No.");
          //Schedule.SETRANGE("Item No.","No.");
          //Schedule.SETRANGE(Quantity,Quantity);
          Schedule.FILTERGROUP(2);
          IF Schedule.FINDFIRST THEN BEGIN
           PAGE.RUN(60125,Schedule);
           Schedule.FILTERGROUP(0);
          END ELSE BEGIN
            SalesLine.RESET;
            SalesLine.SETRANGE("Document No.","Document No.");
            SalesLine.SETRANGE("Line No.","Line No.");
            IF SalesLine.FINDSET THEN
              REPEAT
                Schedule.INIT;
                Schedule."Document Type":=Schedule."Document Type"::"Blanket Order";
                Schedule."Document No.":=SalesLine."Document No.";
                Schedule."Document Line No.":=SalesLine."Line No.";
                Schedule."Line No.":=SalesLine."Line No.";
                Schedule.Type:=Schedule.Type::Item;
                Schedule.VALIDATE("No.",SalesLine."No.");
                Schedule.Quantity := SalesLine.Quantity;
                //salesLine.CALCFIELDS("Estimated Unit Cost");
                IF Schedule.INSERT THEN;
              UNTIL SalesLine.NEXT=0;
          COMMIT;
          Schedule.RESET;
          Schedule.SETRANGE("Document Type",Schedule."Document Type" :: "Blanket Order");
          Schedule.SETRANGE("Document No.","Document No.");
          Schedule.SETRANGE("Document Line No.","Line No.");
          Schedule.FILTERGROUP(2);
          PAGE.RUN(60125,Schedule);
          Schedule.FILTERGROUP(0);
          END
        END ELSE BEGIN
          SalesLine.RESET;
          SalesLine.SETRANGE("Document No.","Document No.");
          SalesLine.SETRANGE("Line No.","Line No.");
          IF SalesLine.FINDSET THEN
            REPEAT
              Schedule.INIT;
              Schedule."Document Type":=Schedule."Document Type"::"Blanket Order";
              Schedule."Document No.":=SalesLine."Document No.";
              Schedule."Document Line No.":=SalesLine."Line No.";
              Schedule."Line No.":=SalesLine."Line No.";
              Schedule.Type:=Schedule.Type::Item;
              Schedule.VALIDATE("No.",SalesLine."No.");
              Schedule.Quantity := SalesLine.Quantity;
              Schedule."Estimated Total Unit Price":=Schedule."Estimated Unit Price"*Quantity;
              //salesLine.CALCFIELDS("Estimated Unit Cost");
              IF Schedule.INSERT THEN;
            UNTIL SalesLine.NEXT=0;
          COMMIT;
        
        Schedule.RESET;
        Schedule.SETRANGE("Document Type",Schedule."Document Type" ::"Blanket Order");
        Schedule.SETRANGE("Document No.","Document No.");
        Schedule.SETRANGE("Document Line No.","Line No.");
        Schedule.FILTERGROUP(2);
        PAGE.RUN(60125,Schedule);
        Schedule.FILTERGROUP(0);
        END END ELSE IF Type=Type::"G/L Account" THEN BEGIN
          Schedule.RESET;
          Schedule.SETRANGE("Document Type",Schedule."Document Type" :: "Blanket Order");
          Schedule.SETRANGE("Document No.","Document No.");
          Schedule.SETRANGE("Document Line No.","Line No.");
          Schedule.FILTERGROUP(2);
          PAGE.RUN(60125,Schedule);
          Schedule.FILTERGROUP(0);
        
        
        END;

    end;

    [LineStart(225)]
    procedure ShowSalesOrderWorkSheet();
    var
        DesignWorksheetHeader : Record "Design Worksheet Header";
        DesignWorksheetLine : Record "Design Worksheet Line";
        Item : Record Item;
        ItemDesignWorksheetHeader : Record "Item Design Worksheet Header";
        ItemDesignWorksheetLine : Record "Item Design Worksheet Line";
    begin
        TESTFIELD("Document Type");
        TESTFIELD("Document No.");
        TESTFIELD("Line No.");
        ItemDesignWorksheetHeader.RESET;
        IF ItemDesignWorksheetHeader.GET("No.") THEN BEGIN
          DesignWorksheetHeader.INIT;
          DesignWorksheetHeader.TRANSFERFIELDS(ItemDesignWorksheetHeader);
          DesignWorksheetHeader."Document No.":="Document No.";
          DesignWorksheetHeader."Document Line No.":="Line No.";
          DesignWorksheetHeader."Document Type":=DesignWorksheetHeader."Document Type"::"Blanket Order";
          IF DesignWorksheetHeader.INSERT THEN;
          ItemDesignWorksheetLine.RESET;
          ItemDesignWorksheetLine.SETRANGE(ItemDesignWorksheetLine."Item No",ItemDesignWorksheetHeader."Item No.");
          IF ItemDesignWorksheetLine.FINDSET THEN
            REPEAT
              DesignWorksheetLine.INIT;
              DesignWorksheetLine.TRANSFERFIELDS(ItemDesignWorksheetLine);
              DesignWorksheetLine."Item No":="No.";
              DesignWorksheetLine."Document No.":="Document No.";
              DesignWorksheetLine."Document Line No.":="Line No.";
              DesignWorksheetLine."Document Type":=DesignWorksheetLine."Document Type"::"Blanket Order";
              IF DesignWorksheetLine.INSERT THEN;
            UNTIL ItemDesignWorksheetLine.NEXT=0;
        END;
        COMMIT;

        CLEAR(DesignWorksheetHeader);
        DesignWorksheetHeader.SETRANGE("Document Type",DesignWorksheetHeader."Document Type"::"Blanket Order");
        DesignWorksheetHeader.SETRANGE("Document No.","Document No.");
        DesignWorksheetHeader.SETRANGE("Document Line No.","Line No.");
        DesignWorksheetHeader.FILTERGROUP(2);
        IF DesignWorksheetHeader.FINDFIRST THEN
          PAGE.RUNMODAL(60122,DesignWorksheetHeader);
        DesignWorksheetHeader.FILTERGROUP(0);
    end;

    [LineStart(261)]
    procedure MakeLines(var SalesLineparam : Record "Sales Line") : Decimal;
    var
        SalesLine : Record "Sales Line";
        ProdOrderLine : Record "Prod. Order Line";
        PurchLine : Record "Purchase Line";
        ReqLine : Record "Requisition Line";
        ReservEntry2 : Record "Reservation Entry";
    begin
        SalesPlanLine.DELETEALL;
        ValidateProdOrder;
        SalesLine.SETRANGE("Document Type",SalesLine."Document Type"::"Blanket Order");
        SalesLine.SETRANGE("Document No.","Document No.");
        //NSS 301207
        SalesLine.SETRANGE("Line No.","Line No.");
        //NSS
        SalesLine.SETRANGE(Type,SalesLine.Type::Item);
        
        IF SalesLine.FINDFIRST THEN BEGIN
          //REPEAT
            SalesLine.TESTFIELD("Prod. Qty");
            SalesLine.TESTFIELD("Prod. Due Date");
            SalesPlanLine.INIT;
            SalesPlanLine."Sales Order No." := SalesLine."Document No.";
            SalesPlanLine."Sales Order Line No." := SalesLine."Line No.";
            SalesPlanLine."Item No." := SalesLine."No.";
        
            SalesPlanLine."Variant Code" := SalesLine."Variant Code";
            SalesPlanLine.Description := SalesLine.Description;
            SalesPlanLine."Shipment Date" := SalesLine."Shipment Date";
            SalesPlanLine."Planning Status" := SalesPlanLine."Planning Status"::Released;
            SalesLine.CALCFIELDS("Reserved Qty. (Base)");
            SalesPlanLine."Planned Quantity" := SalesLine."Reserved Qty. (Base)";
            /*ReservEngineMgt.InitFilterAndSortingLookupFor(ReservEntry,FALSE);
            ReserveSalesline.FilterReservFor(ReservEntry,SalesLine);
            ReservEntry.SETRANGE("Reservation Status",ReservEntry."Reservation Status"::Reservation);
            IF ReservEntry.FINDSET THEN
              REPEAT
                IF ReservEntry2.GET(ReservEntry."Entry No.",NOT ReservEntry.Positive) THEN
                  CASE ReservEntry2."Source Type" OF
                    DATABASE::"Item Ledger Entry":
                      BEGIN
                        SalesPlanLine."Planning Status" := SalesPlanLine."Planning Status"::Inventory;
                      END;
                    DATABASE::"Requisition Line":
                      BEGIN
                        ReqLine.GET(
                          ReservEntry2."Source ID",
                          ReservEntry2."Source Batch Name",
                          ReservEntry2."Source Ref. No.");
                        SalesPlanLine."Planning Status" := SalesPlanLine."Planning Status"::Planned;
                        SalesPlanLine."Expected Delivery Date" := ReqLine."Due Date";
                      END;
                    DATABASE::"Purchase Line":
                      BEGIN
                        PurchLine.GET(
                          ReservEntry2."Source Subtype",
                          ReservEntry2."Source ID",
                          ReservEntry2."Source Ref. No.");
                        SalesPlanLine."Planning Status" := SalesPlanLine."Planning Status"::"Firm Planned";
                        SalesPlanLine."Expected Delivery Date" := PurchLine."Expected Receipt Date";
                      END;
                    DATABASE::"Prod. Order Line":
                      BEGIN
                        ProdOrderLine.GET(
                          ReservEntry2."Source Subtype",
                          ReservEntry2."Source ID",
                          ReservEntry2."Source Prod. Order Line");
                        IF ProdOrderLine."Ending Date" > SalesPlanLine."Expected Delivery Date" THEN
                          SalesPlanLine."Expected Delivery Date" := ProdOrderLine."Ending Date";
                        IF ((ProdOrderLine.Status + 1) < SalesPlanLine."Planning Status") OR
                           (SalesPlanLine."Planning Status" = SalesPlanLine."Planning Status"::None)
                        THEN
                          SalesPlanLine."Planning Status" := ProdOrderLine.Status + 1;
                      END;
                  END;
              UNTIL ReservEntry.NEXT = 0;*/
            SalesPlanLine."Needs Replanning" :=
              (SalesPlanLine."Planned Quantity" <> SalesLine."Outstanding Qty. (Base)") OR
              (SalesPlanLine."Expected Delivery Date" > SalesPlanLine."Shipment Date");
            /*CalculateDisposalPlan(
              SalesLine."Variant Code",
              SalesLine."Location Code",SalesLine."Bin Code");*/
            SalesPlanLine.INSERT;
            EXIT(SalesLine."Prod. Qty");
          //UNTIL SalesLine.NEXT = 0;
        END;

    end;

    [LineStart(341)]
    procedure ValidateProdOrder();
    begin
        CALCFIELDS("Prod. Order Quantity");
        IF "Prod. Order Quantity" > Quantity  THEN
          ERROR(Text001);
    end;

    [LineStart(346)]
    local procedure NoOnAfterValidate();
    begin
        InsertExtendedText(FALSE);
    end;

    [LineStart(349)]
    local procedure QuantityOnAfterValidate();
    begin
        IF Reserve = Reserve::Always THEN BEGIN
          CurrPage.SAVERECORD;
          AutoReserve;
        END;
    end;

    [LineStart(355)]
    local procedure UnitofMeasureCodeOnAfterValida();
    begin
        IF Reserve = Reserve::Always THEN BEGIN
          CurrPage.SAVERECORD;
          AutoReserve;
        END;
    end;
}

