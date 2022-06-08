pageextension 70192 SalesOrderSubformExt extends "Sales Order Subform"
{
    layout
    {
        /* modify(Control1)
        {
            ShowCaption = false;
        } */
        modify(Type)
        {
            Editable = editableflag;
        }
        modify("No.")
        {
            Editable = editableflag;
            ShowMandatory = TypeChosen;
            trigger OnLookup(var Text: Text): Boolean
            begin
                IF Type = Type::Item THEN BEGIN
                    item.RESET;
                    item.SETFILTER(item."Item Status", '<>In-Active');
                    item.SETFILTER(item.Blocked, 'NO');
                    IF "No." <> '' THEN
                        item.SETRANGE("No.", "No.");
                    IF PAGE.RUNMODAL(31, item) = ACTION::LookupOK THEN
                        VALIDATE("No.", item."No.");
                END                      // copied code by swathi on 25-sep-13
                ELSE
                    IF Type = Type::"G/L Account" THEN BEGIN
                        GLAccount.RESET;
                        IF "No." <> '' THEN
                            GLAccount.SETRANGE("No.", "No.");
                        IF PAGE.RUNMODAL(18, GLAccount) = ACTION::LookupOK THEN
                            VALIDATE("No.", GLAccount."No.");
                    END;                      // copied code by swathi on 25-sep-13
                IF (xRec."No." <> "No.") AND (editableflag = FALSE) THEN BEGIN
                    "No." := xRec."No.";
                    ERROR('You Donot have rights to modify Item!');
                END;
            end;
        }
        modify("IC Partner Code")
        {
            Editable = editableflag;
        }
        /*  modify("Service Tax Group")
         {
           Editable=editableflag;
         } */
        modify("IC Partner Ref. Type")
        {
            Editable = editableflag;
        }
        modify("IC Item Reference")
        {
            Editable = editableflag;
        }
        modify("Variant Code")
        {
            Editable = editableflag;
        }
        modify("Purchasing Code")
        {
            Editable = editableflag;
        }
        modify(Description)
        {
            Editable = editableflag;
        }
        modify("Drop Shipment")
        {
            Editable = editableflag;
        }
        modify("Location Code")
        {
            Editable = editableflag;
        }
        modify("Bin Code")
        {
            Editable = editableflag;
        }
        /* modify(Control45)
        {
            ShowCaption = false;
        }
        modify(Control28)
        {
            ShowCaption = false;
        } */
        modify(Control50)
        {
            Editable = editableflag;
        }
        modify(Quantity)
        {
            Editable = editableflag;
            trigger OnAfterValidate()
            begin
                // Pranavi
                IF Quantity <> xRec.Quantity THEN BEGIN
                    IF Quantity < "Quantity Shipped" THEN
                        ERROR('Qty must not be less than Quantity Shipped!');
                    Schedule.RESET;
                    Schedule.SETRANGE(Schedule."Document No.", "Document No.");
                    Schedule.SETRANGE(Schedule."Document Line No.", "Line No.");
                    IF Schedule.FINDSET THEN
                        REPEAT
                            IF Schedule."Document Line No." = Schedule."Line No." THEN BEGIN
                                Schedule.Quantity := Quantity;
                                Schedule."Qty. Per" := 1;
                                Schedule.VALIDATE(Quantity);
                            END
                            ELSE BEGIN
                                Schedule.Quantity := Quantity * Schedule."Qty. Per";
                                Schedule.VALIDATE(Quantity);
                            END;
                            Schedule.MODIFY;
                        UNTIL Schedule.NEXT = 0;
                END;
                // Pranavi End
            end;
        }
        modify("Qty. to Assemble to Order")
        {
            Editable = editableflag;
        }
        modify("Unit of Measure Code")
        {
            Editable = editableflag;
        }
        modify("Unit Cost (LCY)")
        {
            Editable = editableflag;
        }
        modify("Line Amount")
        {
            Editable = editableflag;
        }
        modify("Line Discount %")
        {
            Editable = editableflag;
        }
        modify("Prepayment %")
        {
            Editable = editableflag;
        }
        modify("Qty. to Ship")
        {
            Editable = editableflag;
            trigger OnAfterValidate()
            begin
                // Pranavi on 02-mar-2016 for auto calc of qty to ship in schedls
                Schedule.RESET;
                Schedule.SETRANGE(Schedule."Document No.", "Document No.");
                Schedule.SETRANGE(Schedule."Document Line No.", "Line No.");
                Schedule.SETFILTER(Schedule."No.", '<>%1', '');
                IF Schedule.FINDSET THEN
                    REPEAT
                        IF Schedule."Document Line No." <> Schedule."Line No." THEN BEGIN
                            Schedule."Qty. to Ship" := ROUND(Schedule."Qty. Per" * "Qty. to Ship", 1, '>');
                            Schedule.VALIDATE("Qty. to Ship");
                            Schedule.MODIFY;
                        END;
                    UNTIL Schedule.NEXT = 0;
                // end by pranavi
            end;
        }
        modify("Quantity Shipped")
        {
            Editable = false;
        }
        modify("Qty. to Invoice")
        {
            Editable = editableflag;
        }
        modify("Quantity Invoiced")
        {
            Editable = FALSE;
        }
        modify("Planned Delivery Date")
        {
            Editable = editableflag;
        }
        modify("Planned Shipment Date")
        {
            Editable = editableflag;
        }

        modify(RefreshTotals)
        {
            ShowCaption = false;
        }
        modify("Return Reason Code")
        {
            Visible = false;
        }
        modify("Reserved Quantity")
        {
            Visible = false;
        }
        modify(Control51)
        {
            Visible = false;
        }
        addafter(Type)
        {
            field("Schedule Type"; "Schedule Type")
            {
                Editable = editableflag;
                Visible = false;
            }
            field("Gen. Bus. Posting Group"; "Gen. Bus. Posting Group")
            {
                Editable = editableflag;
            }
            field("Posting Group"; "Posting Group")
            {
                Editable = true;
            }
            field("Unit Cost"; "Unit Cost")
            {
            }
            field("Schedule No"; "Schedule No")
            {
                Editable = editableflag;
            }
        }
        addbefore("No.")
        {
            field("Tax %"; "Tax %")
            {
                Editable = false;
            }
            field("VAT Bus. Posting Group"; "VAT Bus. Posting Group")
            {
                Editable = editableflag;
            }

        }
        addafter("No.")
        {
            field("RDSO Inspection Required"; "RDSO Inspection Required")
            {
                Editable = editableflag;
            }
        }
        addafter("IC Partner Code")
        {
            field("VAT %"; "VAT %")
            {
                Editable = false;
            }
        }
        addafter("Drop Shipment")
        {
            field("BOI Status"; "BOI Status")
            {
                Editable = editableflag;
                Visible = "BOI StatusVisible";
            }
        }
        addafter(ShortcutDimCode8)
        {
            field("Qty. Shipped Not Invoiced"; "Qty. Shipped Not Invoiced")
            {
            }
            field("Outstanding Quantity"; "Outstanding Quantity")
            {
                Editable = false;
            }
            field("Unitcost(LOA)"; "Unitcost(LOA)")
            {
                Editable = editableflag;

                trigger OnValidate();
                begin
                    IF "Quantity Invoiced" > 0 THEN
                        ERROR('You cannot change the unit cost loa after the item is invoiced!');
                end;
            }
            field("OutStanding(LOA)"; "OutStanding(LOA)")
            {
                Editable = false;
            }
            field("Line Amount(LOA)"; "Line Amount(LOA)")
            {
                Editable = false;
            }
            field("Gen. Prod. Posting Group"; "Gen. Prod. Posting Group")
            {
                Editable = editableflag;
            }
            field("Retention Portion"; "Retention Portion")
            {
                Editable = editableflag;

                trigger OnValidate();
                begin
                    /*
                    IF "Retention Portion"+"Supply Portion" <> 100 THEN
                      ERROR('Total Supply & Retention Portions should be 100 %');
                    */

                end;
            }
            field("Supply Portion"; "Supply Portion")
            {
                Editable = editableflag;

                trigger OnValidate();
                begin
                    "Retention Portion" := 100 - "Supply Portion";
                end;
            }
            field("Material Reuired Date"; "Material Reuired Date")
            {
                Editable = editableflag;
            }
            field("CL_CNSGN  rcvd Qty"; "CL_CNSGN  rcvd Qty")
            {
            }
            field("Call Letter Exp Date"; "Call Letter Exp Date")
            {
                Caption = '<Cust Exp Date>';
            }
            field("Call Letter Status"; "Call Letter Status")
            {
            }
            field("Type of Item"; "Type of Item")
            {
                Editable = editableflag;
            }
            field("Dummy Unit Cost"; "Dummy Unit Cost")
            {
                Editable = editableflag;
            }
            field("RDSO Charges"; "RDSO Charges")
            {
                Editable = editableflag;
            }
            field("To Be Shipped Qty"; "To Be Shipped Qty")
            {
                Editable = editableflag;
            }
            field("Packet No"; "Packet No")
            {
                Editable = editableflag;
            }
            field("Service Tax Amount"; "Service Tax Amount")
            {
                Editable = editableflag;
            }
            field("Outstanding Amount"; "Outstanding Amount")
            {
            }
            field("Excise Bus. Posting Group"; "Excise Bus. Posting Group")
            {
                Editable = editableflag;
            }
            field("Excise Prod. Posting Group"; "Excise Prod. Posting Group")
            {
                Editable = editableflag;
            }
        }
        addafter("Unit of Measure")
        {
            field("Prod. Order Quantity"; "Prod. Order Quantity")
            {
            }
            field("Prod. Due Date"; "Prod. Due Date")
            {
            }
            field("Prod. Qty"; "Prod. Qty")
            {
            }
            field("Production BOM No."; "Production BOM No.")
            {
                Editable = editableflag;
            }
            field("Form Code"; "Form Code")
            {
                Editable = editableflag;
            }
            field("Quantity (Base)"; "Quantity (Base)")
            {
                Editable = true;
            }
            field("Outstanding Qty. (Base)"; "Outstanding Qty. (Base)")
            {
                Editable = true;
            }
            field("Qty. to Invoice (Base)"; "Qty. to Invoice (Base)")
            {
                Editable = editableflag;
            }
            field("Qty. to Ship (Base)"; "Qty. to Ship (Base)")
            {
                Editable = editableflag;
            }
            field("Qty. Shipped Not Invd. (Base)"; "Qty. Shipped Not Invd. (Base)")
            {
                Editable = true;
            }
            field("Qty. Shipped (Base)"; "Qty. Shipped (Base)")
            {
                Editable = true;
            }
            field("Qty. Invoiced (Base)"; "Qty. Invoiced (Base)")
            {
                Editable = true;
            }
            field(State; State)
            {
                Editable = editableflag;
            }
            field("Pending By Removed Date"; "Pending By Removed Date")
            {
                Editable = false;
            }
            field("Pending By"; "Pending By")
            {
                Editable = editableflag;
            }
            field("Dimension Set ID"; "Dimension Set ID")
            {
            }
            field("Purchase Remarks"; "Purchase Remarks")
            {
            }
            field("Amount To Customer"; "Amount To Customer")
            {
            }
        }
        addafter("Document No.")
        {
            field("GST %"; "GST %")
            {
            }
            field(Reason; Reason)
            {
            }
            field(MainCategory; MainCategory)
            {
            }
            field(SubCategory; SubCategory)
            {
            }
            field(Remarks; Remarks)
            {
            }
            field(ProductGroup; ProductGroup)
            {
            }
            field("Production Confirmed Status"; "Production Confirmed Status")
            {
            }
            field("Dispatch Confirm Date"; "Dispatch Confirm Date")
            {
            }
            field("TCS Nature of Collection"; "TCS Nature of Collection")
            {
            }
            field("TDS/TCS Base Amount"; "TDS/TCS Base Amount")
            {
            }
            field("TDS/TCS Amount"; "TDS/TCS Amount")
            {
            }
            field("Total TDS/TCS Incl. SHE CESS"; "Total TDS/TCS Incl. SHE CESS")
            {
            }
            field("Assessee Code"; "Assessee Code")
            {
                Editable = true;
            }
            field("TCS Type"; "TCS Type")
            {
            }
            field("Sell-to Customer No."; "Sell-to Customer No.")
            {
            }
        }
    }
    actions
    {
        addafter(SelectItemSubstitution)
        {
            action("Packing Details")
            {
                Caption = 'Packing Details';

                trigger OnAction();
                begin
                    //This functionality was copied from page #42. Unsupported part was commented. Please check it.
                    /*CurrPage.SalesLines.Page.*/
                    ShowPackingDetails;

                end;
            }
            action("Delivery &Challan")
            {
                Caption = 'Delivery &Challan';

                trigger OnAction();
                begin
                    //This functionality was copied from page #42. Unsupported part was commented. Please check it.
                    /*CurrPage.SalesLines.Page.*/
                    ShowDeliveryChallan;

                end;
            }
            action("&Line Attachments")
            {
                Caption = '&Line Attachments';
                Image = Attach;
                Visible = false;

                trigger OnAction();
                begin
                    //This functionality was copied from page #42. Unsupported part was commented. Please check it.
                    /*CurrPage.SalesLines.Page.*/
                    SalesLineAttachments;

                end;
            }
        }
        addbefore("F&unctions")
        {
            action("Design Worksheet")
            {
                Caption = 'Design Worksheet';

                trigger OnAction();
                begin
                    //This functionality was copied from page #42. Unsupported part was commented. Please check it.
                    /*CurrPage.SalesLines.Page.*/
                    ShowSalesOrderWorkSheet;

                end;
            }
            action("Sc&hedule")
            {
                Caption = 'Sc&hedule';

                trigger OnAction();
                begin
                    //This functionality was copied from page #42. Unsupported part was commented. Please check it.
                    /*CurrPage.SalesLines.Page.*/
                    ShowSchedule;

                end;
            }
            action("CreateProd.Order")
            {
                Caption = 'Create Prod. Order';

                trigger OnAction();
                var
                    NewStatus2: Option Simulated,Planned,"Firm Planned",Released;
                    NewOrderType2: Option ItemOrder,ProjectOrder;
                begin
                    /*SalesPlanForm.SetSalesOrder("No.");
                    SalesPlanForm.RUNMODAL;
                    */

                    //IF CreateOrderForm.RUNMODAL <> ACTION::Yes THEN
                    //EXIT;
                    IF FORMAT("Pending By") <> ' ' THEN             //Added By Pranavi on 23-09-2015 to restrict create RPO if item is Pending by
                        ERROR('You Can not Create Production order for Item: ' + "No." + '--' + Description + '\ As it Pending By ' + FORMAT("Pending By"));
                    SalesPlanLine.DELETEALL;
                    //Quantity := MakeLines(SalesLineRec);
                    ProdMakeQty := MakeLines(SalesLineRec);        //Added by Pranavi on 13-10-215 for quantity correction
                    NewStatus2 := NewStatus2::Released;
                    NewOrderType2 := NewOrderType2::ItemOrder;
                    //CreateOrderForm.ReturnPostingInfo(NewStatus2,NewOrderType2);
                    /*IF ("sales header"."Document Type"="sales header"."Document Type"::Order)THEN
                    BEGIN
                    //MESSAGE('hai');
                      IF "Order Assurance"=FALSE THEN
                         ERROR('Order Was not Assured By Sales Dept.');
                    //end ELSE
                    //BEGIN
                      MESSAGE(FORMAT(Quantity));
                      FOR I := 1 TO Quantity
                      DO BEGIN
                       // MESSAGE('hi');
                        Qty := 1;
                        CreateOrders(Qty);
                      END;
                    END;*/

                    //commented by Vishnu Priya
                    /*Saleshdr.RESET;
                    Saleshdr.SETFILTER(Saleshdr."Document Type",'%1',Saleshdr."Document Type"::Order);
                    Saleshdr.SETFILTER(Saleshdr."No.","Document No.");
                    IF Saleshdr.FINDFIRST THEN
                      IF Saleshdr."Order Assurance"=FALSE THEN
                        ERROR('Order Was not Assured By Sales Dept.')
                      ELSE
                      BEGIN
                    
                      FOR I := 1 TO ProdMakeQty
                        DO BEGIN
                          Qty := 1;
                          CreateOrders(Qty);
                        END;
                      END;
                    "Prod. Qty" := 0;*/
                    // ended by Vishnu on 05-02-2019

                    //added by vishnu on 05-02-2019
                    Saleshdr.RESET;
                    Saleshdr.SETFILTER(Saleshdr."Document Type", '%1', Saleshdr."Document Type"::Order);
                    Saleshdr.SETFILTER(Saleshdr."No.", "Document No.");
                    IF Saleshdr.FINDFIRST THEN
                        IF Saleshdr."Order Assurance" = FALSE THEN
                            ERROR('Order Was not Assured By Sales Dept.')
                        ELSE BEGIN
                            IF Rec."Unit of Measure" = 'Pairs' THEN BEGIN
                                FOR I := 1 TO ProdMakeQty * 2
                                  DO BEGIN
                                    Qty := 1;
                                    CreateOrders(Qty);
                                END;
                            END // end for if con of unit of measure
                            ELSE BEGIN
                                FOR I := 1 TO ProdMakeQty
                                  DO BEGIN
                                    Qty := 1;
                                    CreateOrders(Qty);
                                END;
                            END; // end for the else stmt
                        END;
                    "Prod. Qty" := 0;
                    //ended by vishnu on 05-02-2019



                    //IF NOT CreateOrders THEN
                    //MESSAGE(Text001);

                    //SalesPlanLine.SETRANGE("Planning Status");

                    //BuildForm;

                    //CurrForm.UPDATE;

                end;
            }
            action("Prod. Order Details")
            {
                Caption = 'Prod. Order Details';

                trigger OnAction();
                begin
                    //This functionality was copied from page #42. Unsupported part was commented. Please check it.
                    /*CurrPage.SalesLines.Page.*/
                    ShowPODetails;

                end;
            }
        }

        addafter(OrderTracking)
        {
            action("&Attachments")
            {
                Caption = '&Attachments';

                trigger OnAction();
                begin
                    //This functionality was copied from page #42. Unsupported part was commented. Please check it.
                    /*CurrPage.SalesLines.Page.*/
                    CustAttachments;

                end;
            }
            action("Production Approve")
            {

                trigger OnAction();
                begin
                    //Added by Vishnu Priya on  26-05-2020
                    SalesHeader.RESET;
                    SalesHeader.SETFILTER("No.", Rec."Document No.");
                    IF SalesHeader.FINDFIRST THEN BEGIN
                        SalesLine.RESET;
                        SalesLine.SETFILTER("Document No.", SalesHeader."No.");
                        IF SalesLine.FINDSET THEN
                            REPEAT
                            BEGIN
                                SalesLine."Production Confirmed Status" := TRUE;
                                SalesLine.MODIFY;
                            END;
                            UNTIL SalesLine.NEXT = 0;
                    END
                    //Added by Vishnu Priya on  26-05-2020
                end;
            }
            action("Pre Site Visit")
            {
                Caption = 'Pre Site Visit';

                trigger OnAction();
                begin
                    //This functionality was copied from page #42. Unsupported part was commented. Please check it.
                    /*CurrPage.SalesLines.Page.*/
                    _Presite;

                end;
            }
            action("Update New Item")
            {
                Caption = 'Update New Item';
                Description = 'UPG1.3 06Feb2019 Updates Item No. in Current Sales Line and in RPO if exist';
                Image = Change;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";

                trigger OnAction();
                begin
                    //>>UPG1.3 06Feb2019
                    UpdateItemNo;
                    //<<UPG1.3 06Feb2019
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        IF NOT (UPPERCASE(USERID) IN ['SUPER', '10RD010', '11RD010', '06PD033']) THEN
            "BOI StatusVisible" := FALSE;
        User.RESET;
        IF "Document Type" <> "Document Type"::Amc THEN BEGIN
            IF NOT (USERID IN ['EFFTRONICS\SUJANI', 'EFFTRONICS\NAGALAKSHMI', 'EFFTRONICS\SRIVALLI', 'EFFTRONICS\GRAVI', 'EFFTRONICS\BHAVANIP',
                               'EFFTRONICS\ANILKUMAR', 'EFFTRONICS\SPURTHI', 'EFFTRONICS\ANVESH', 'EFFTRONICS\BSATISH', 'EFFTRONICS\VISHNUPRIYA', 'EFFTRONICS\GURULAKSHMI', 'EFFTRONICS\B2BOTS']) THEN BEGIN
                User.SETFILTER(User."User Name", USERID);
                IF User.FINDFIRST THEN BEGIN
                    IF NOT (User.Dept IN ['SAL', 'MAR']) THEN
                        editableflag := FALSE
                    ELSE
                        editableflag := TRUE;
                END;
            END
            ELSE
                editableflag := TRUE;
        END
        ELSE
            editableflag := TRUE;
    end;

    trigger OnAfterGetRecord()
    begin
        IF (Type = Type::Item) AND (ProductGroup = '') THEN BEGIN
            item.RESET;
            item.SETFILTER("No.", Rec."No.");
            IF item.FINDSET THEN BEGIN
                ProductGroup := item."Item Sub Group Code";
                //Rec.MODIFY;
            END;
        END;
        IF MainCategory = MainCategory::"  " THEN BEGIN
            MainCategory := MainCategory::"Need to Specify";
            // Rec.MODIFY;
        END;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        // added by pranavi on 01-sep-2016 for payment terms
        IF "Document Type" = "Document Type"::Order THEN BEGIN
            SalesHeader.RESET;
            SalesHeader.SETRANGE(SalesHeader."No.", "Document No.");
            IF SalesHeader.FINDFIRST THEN
                IF SalesHeader."Customer Posting Group" IN ['PRIVATE', 'OTHERS'] THEN
                    IF Type = Type::Item THEN BEGIN
                        "Supply Portion" := 100;
                        "Retention Portion" := 0;
                    END ELSE BEGIN
                        "Supply Portion" := 0;
                        "Retention Portion" := 100;
                    END;
        END;
        // end by pranavi
    end;

    trigger OnModifyRecord(): Boolean
    begin
        //Added By Pranavi On 23-09-2015 to restrict sales line modify/delete except sales & ERP

        /* User.RESET;
        IF "Document Type" <> "Document Type"::Amc THEN
        BEGIN
          IF NOT (USERID IN ['EFFTRONICS\PRANAVI','EFFTRONICS\GRAVI','EFFTRONICS\ANILKUMAR','EFFTRONICS\NAGALAKSHMI','EFFTRONICS\SRIVALLI','EFFTRONICS\SPURTHI','EFFTRONICS\ANVESH']) THEN
          BEGIN
            User.SETFILTER(User."User Name",USERID);
            IF User.FINDFIRST THEN
            BEGIN
              IF NOT (User.Dept IN ['SAL','MAR']) THEN
                editableflag := FALSE
              ELSE editableflag := TRUE;
                //IF ("Product Group Code" <> 'B OUT') AND (User.Dept <> '') THEN
                  //ERROR('You Do Not Right to Modify!');
            END;
          END
          ELSE editableflag := TRUE;
        END;

        Saleshdr.RESET;
        Saleshdr.SETRANGE(Saleshdr."No.","Document No.");
        IF Saleshdr.FINDFIRST THEN
          IF (Saleshdr.Order_After_CF_Integration = TRUE) AND NOT (SalesHeader."Sell-to Customer No." IN['CUST00536','CUST01164']) THEN
            IF "Retention Portion"+"Supply Portion" <> 100 THEN
              ERROR('Total Supply & Retention Portions should be 100 %'); */

        //End By Pranavi
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        //Added By Pranavi On 23-09-2015 to restrict sales line modify/delete except sales & ERP
        User.RESET;
        IF "Document Type" <> "Document Type"::Amc THEN BEGIN
            IF NOT (USERID IN ['EFFTRONICS\VISHNUPRIYA', 'EFFTRONICS\GRAVI', 'EFFTRONICS\ANILKUMAR', 'EFFTRONICS\BHAVANIP', 'EFFTRONICS\SRIVALLI', 'EFFTRONICS\SPURTHI', 'EFFTRONICS\ANVESH', 'EFFTRONICS\VIJAYA']) THEN BEGIN
                User.SETFILTER(User."User Name", USERID);
                IF User.FINDFIRST THEN BEGIN
                    IF NOT (User.Dept IN ['SAL', 'MAR']) THEN
                        ERROR('You Do Not Right to Delete!');
                END;
            END;
        END;
        //End By Pranavi
        // Added by pranavi on 12-09-2016 for not allowing to delete if outstanding qty > 0 after partially billed
        IF (Quantity <> "Quantity Shipped") AND ("Quantity Shipped" > 0) THEN
            ERROR('You cannot delete the line as there is outstanding qty!');
        // end by pranavi
    end;

    var
        SalesPlanLine: Record "Sales Planning Line";
        item: Record Item;
        GLAccount: Record "G/L Account";
        SalesLine: Record "Sales Line";
        NewOrderType: Option ItemOrder,ProjectOrder;
        NewStatus: Option Simulated,Planned,"Firm Planned",Released;
        SalesLineRec: Record "Sales Line";
        I: Integer;
        Qty: Integer;
        Saleshdr: Record "Sales Header";
        User: Record User;
        ProdMakeQty: Integer;
        editableflag: Boolean;
        Schedule: Record Schedule2;
        TypeChosen: Boolean;
        "BOI StatusVisible": Boolean;



<<<<<<< HEAD
    //trigger OnAfterGetRecord();
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ShowShortcutDimCode(ShortcutDimCode);
    CLEAR(DocumentTotals);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    ShowShortcutDimCode(ShortcutDimCode);
    CLEAR(DocumentTotals);

    IF (Type=Type::Item) AND (ProductGroup ='') THEN
      BEGIN
          item.RESET;
          item.SETFILTER("No.",Rec."No.");
          IF item.FINDSET THEN
            BEGIN
            ProductGroup := item."Item Sub Group Code";
            //Rec.MODIFY;
            END;
       END;
       IF MainCategory = MainCategory::"  " THEN
         BEGIN
            MainCategory := MainCategory::"Need to Specify";
           // Rec.MODIFY;
        END;
    */
    //end;


    //Unsupported feature: CodeModification on "OnDeleteRecord". Please convert manually.

    //trigger OnDeleteRecord() : Boolean;
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF (Quantity <> 0) AND ItemExists("No.") THEN BEGIN
      COMMIT;
      IF NOT ReserveSalesLine.DeleteLineConfirm(Rec) THEN
        EXIT(FALSE);
      ReserveSalesLine.DeleteLine(Rec);
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //Added By Pranavi On 23-09-2015 to restrict sales line modify/delete except sales & ERP
    User.RESET;
    IF "Document Type" <> "Document Type"::Amc THEN
    BEGIN
      IF NOT (USERID IN ['EFFTRONICS\VISHNUPRIYA','EFFTRONICS\GRAVI','EFFTRONICS\ANILKUMAR','EFFTRONICS\BHAVANIP','EFFTRONICS\SRIVALLI','EFFTRONICS\SPURTHI','EFFTRONICS\ANVESH','EFFTRONICS\VIJAYA']) THEN
      BEGIN
        User.SETFILTER(User."User Name",USERID);
        IF User.FINDFIRST THEN
        BEGIN
          IF NOT (User.Dept IN ['SAL','MAR']) THEN
            ERROR('You Do Not Right to Delete!');
        END;
      END;
    END;
    //End By Pranavi
    // Added by pranavi on 12-09-2016 for not allowing to delete if outstanding qty > 0 after partially billed
    IF (Quantity <> "Quantity Shipped") AND ("Quantity Shipped" > 0) THEN
      ERROR('You cannot delete the line as there is outstanding qty!');
    // end by pranavi
    #1..6
    */
    //end;


    //Unsupported feature: CodeModification on "OnInit". Please convert manually.

    //trigger OnInit();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Process Carried OutVisible" := TRUE;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    "Process Carried OutVisible" := TRUE;
    "BOI StatusVisible" := TRUE;
    ItemPanelVisible := TRUE;
    */
    //end;


    //Unsupported feature: CodeInsertion on "OnInsertRecord". Please convert manually.

    //trigger OnInsertRecord(BelowxRec : Boolean) : Boolean;
    //begin
    /*
    // added by pranavi on 01-sep-2016 for payment terms
    IF "Document Type" = "Document Type"::Order THEN
    BEGIN
      SalesHeader.RESET;
      SalesHeader.SETRANGE(SalesHeader."No.","Document No.");
      IF SalesHeader.FINDFIRST THEN
        IF SalesHeader."Customer Posting Group" IN['PRIVATE','OTHERS'] THEN
          IF Type = Type::Item THEN
          BEGIN
            "Supply Portion" := 100;
            "Retention Portion" := 0;
          END ELSE BEGIN
            "Supply Portion" := 0;
            "Retention Portion" := 100;
          END;
    END;
    // end by pranavi
    */
    //end;


    //Unsupported feature: CodeInsertion on "OnModifyRecord". Please convert manually.

    //trigger OnModifyRecord() : Boolean;
    //begin
    /*
    //Added By Pranavi On 23-09-2015 to restrict sales line modify/delete except sales & ERP
    {
    User.RESET;
    IF "Document Type" <> "Document Type"::Amc THEN
    BEGIN
      IF NOT (USERID IN ['EFFTRONICS\PRANAVI','EFFTRONICS\GRAVI','EFFTRONICS\ANILKUMAR','EFFTRONICS\NAGALAKSHMI','EFFTRONICS\SRIVALLI','EFFTRONICS\SPURTHI','EFFTRONICS\ANVESH']) THEN
      BEGIN
        User.SETFILTER(User."User Name",USERID);
        IF User.FINDFIRST THEN
        BEGIN
          IF NOT (User.Dept IN ['SAL','MAR']) THEN
            editableflag := FALSE
          ELSE editableflag := TRUE;
            //IF ("Product Group Code" <> 'B OUT') AND (User.Dept <> '') THEN
              //ERROR('You Do Not Right to Modify!');
        END;
      END
      ELSE editableflag := TRUE;
    END;

    Saleshdr.RESET;
    Saleshdr.SETRANGE(Saleshdr."No.","Document No.");
    IF Saleshdr.FINDFIRST THEN
      IF (Saleshdr.Order_After_CF_Integration = TRUE) AND NOT (SalesHeader."Sell-to Customer No." IN['CUST00536','CUST01164']) THEN
        IF "Retention Portion"+"Supply Portion" <> 100 THEN
          ERROR('Total Supply & Retention Portions should be 100 %');
    }
    //End By Pranavi
    */
    //end;


    //Unsupported feature: CodeInsertion on "OnOpenPage". Please convert manually.

    //trigger OnOpenPage();
    //begin
    /*
    IF NOT (UPPERCASE(USERID) IN ['SUPER','10RD010','11RD010','06PD033']) THEN
    "BOI StatusVisible" :=FALSE;
    User.RESET;
    IF "Document Type" <> "Document Type"::Amc THEN
    BEGIN
      IF NOT (USERID IN ['EFFTRONICS\SUJANI','EFFTRONICS\NAGALAKSHMI','EFFTRONICS\SRIVALLI','EFFTRONICS\GRAVI','EFFTRONICS\BHAVANIP',
                         'EFFTRONICS\ANILKUMAR','EFFTRONICS\SPURTHI','EFFTRONICS\ANVESH','EFFTRONICS\BSATISH','EFFTRONICS\VISHNUPRIYA','EFFTRONICS\GURULAKSHMI','EFFTRONICS\B2BOTS']) THEN
      BEGIN
        User.SETFILTER(User."User Name",USERID);
        IF User.FINDFIRST THEN
        BEGIN
          IF NOT (User.Dept IN ['SAL','MAR']) THEN
            editableflag := FALSE
          ELSE editableflag := TRUE;
        END;
      END
      ELSE editableflag := TRUE;
    END
    ELSE editableflag := TRUE;
    */
    //end;

    procedure TrackingPage();
    begin
    end;


    //Unsupported feature: CodeModification on "ShowTracking(PROCEDURE 13)". Please convert manually.

    //procedure ShowTracking();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TrackingForm.SetSalesLine(Rec);
    TrackingForm.RUNMODAL;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    TrackingPage.SetSalesLine(Rec);
    TrackingPage.RUNMODAL;
    */
    //end;


    //Unsupported feature: CodeModification on "LocationCodeOnAfterValidate(PROCEDURE 19034787)". Please convert manually.

    //procedure LocationCodeOnAfterValidate();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SaveAndAutoAsmToOrder;

    IF (Reserve = Reserve::Always) AND
       ("Outstanding Qty. (Base)" <> 0) AND
       ("Location Code" <> xRec."Location Code")
    THEN BEGIN
      CurrPage.SAVERECORD;
      AutoReserve;
      CurrPage.UPDATE(FALSE);
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #3..10
    */
    //end;

    procedure StrOrderLineDetailsPage();
    begin
    end;


    //Unsupported feature: CodeModification on "ShowStrDetailsForm(PROCEDURE 1280001)". Please convert manually.

    //procedure ShowStrDetailsForm();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    StrOrderLineDetails.RESET;
    StrOrderLineDetails.SETCURRENTKEY("Document Type","Document No.",Type);
    StrOrderLineDetails.SETRANGE("Document Type","Document Type");
    StrOrderLineDetails.SETRANGE("Document No.","Document No.");
    StrOrderLineDetails.SETRANGE(Type,StrOrderLineDetails.Type::Sale);
    StrOrderLineDetails.SETRANGE("Item No.","No.");
    StrOrderLineDetails.SETRANGE("Line No.","Line No.");
    StrOrderLineDetailsForm.SETTABLEVIEW(StrOrderLineDetails);
    StrOrderLineDetailsForm.RUNMODAL;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..7
    StrOrderLineDetailsPage.SETTABLEVIEW(StrOrderLineDetails);
    StrOrderLineDetailsPage.RUNMODAL;
    */
    //end;

    (4171)]
=======
>>>>>>> 75554976da0214e9ec70a45a874425238783b297
    procedure "---B2B--"();
    begin
    end;

<<<<<<< HEAD
    (4174)]
=======
>>>>>>> 75554976da0214e9ec70a45a874425238783b297
    procedure CustAttachments();
    var
        CustAttach: Record Attachments;
    begin
        CustAttach.RESET;
        CustAttach.SETRANGE("Table ID", DATABASE::"Sales Header");
        CustAttach.SETRANGE("Document No.", Rec."Document No.");
        CustAttach.SETRANGE("Document Type", "Document Type");

        PAGE.RUN(PAGE::"ESPL Attachments", CustAttach);
    end;

<<<<<<< HEAD
    (4182)]
=======

>>>>>>> 75554976da0214e9ec70a45a874425238783b297
    procedure _Presite();
    var
        PreSiteCheckList: Record "Inst. PreSite Check List";
    begin
        PreSiteCheckList.RESET;
        PreSiteCheckList.SETRANGE("Sales Order No.", "Document No.");
        PreSiteCheckList.SETRANGE("Sales Order Line No.", "Line No.");
        PAGE.RUN(PAGE::"Inst. PreSite Check List", PreSiteCheckList);
    end;

<<<<<<< HEAD
    (4188)]
=======
>>>>>>> 75554976da0214e9ec70a45a874425238783b297
    procedure Presite();
    var
        PreSiteCheckList: Record "Inst. PreSite Check List";
    begin
        PreSiteCheckList.RESET;
        PreSiteCheckList.SETRANGE("Sales Order No.", "Document No.");
        PreSiteCheckList.SETRANGE("Sales Order Line No.", "Line No.");
        PAGE.RUN(PAGE::"Inst. PreSite Check List", PreSiteCheckList);
    end;

<<<<<<< HEAD
    (4194)]
=======

>>>>>>> 75554976da0214e9ec70a45a874425238783b297
    procedure ShowPackingDetails();
    var
        PackingDetails: Record "Shortage Management Audit Data";
    begin
        /*
        PackingDetails.SETRANGE(Week,PackingDetails.Week :: "0");
        PackingDetails.SETRANGE("Sale Order","Document No.");
        PackingDetails.SETRANGE(Customer,"Line No.");
        Page.RUNMODAL(PAGE :: "Shortage Mng Audit Data",PackingDetails);
                                                                          */

    end;

<<<<<<< HEAD
    (4202)]
=======

>>>>>>> 75554976da0214e9ec70a45a874425238783b297
    procedure SalesLineAttachments();
    var
        CustAttach: Record Attachments;
    begin
        CustAttach.RESET;
        CustAttach.SETRANGE("Table ID", DATABASE::"Sales Header");
        CustAttach.SETRANGE("Document No.", Rec."Document No.");
        CustAttach.SETRANGE("Document Type", "Document Type"::Order);
        CustAttach.SETRANGE("Document Line No.", "Line No.");

        PAGE.RUN(PAGE::"ESPL Attachments", CustAttach);
    end;

<<<<<<< HEAD
    (4211)]
=======

>>>>>>> 75554976da0214e9ec70a45a874425238783b297
    procedure ShowSalesOrderWorkSheet();
    var
        DesignWorksheetHeader: Record "Design Worksheet Header";
        DesignWorksheetLine: Record "Design Worksheet Line";
        Item: Record Item;
        ItemDesignWorksheetHeader: Record "Item Design Worksheet Header";
        ItemDesignWorksheetLine: Record "Item Design Worksheet Line";
    begin
        /*
        TESTFIELD("Document Type");
        TESTFIELD("Document No.");
        TESTFIELD("Line No.");
        
        CLEAR(DesignWorksheetHeader);
        DesignWorksheetHeader.SETRANGE("Document Type",DesignWorksheetHeader."Document Type"::Order);
        DesignWorksheetHeader.SETRANGE("Document No.","Document No.");
        DesignWorksheetHeader.SETRANGE("Document Line No.","Line No.");
        DesignWorksheetHeader.FILTERGROUP(2);
        IF DesignWorksheetHeader.FINDFIRST THEN
          Page.RUNMODAL(60122,DesignWorksheetHeader);
        DesignWorksheetHeader.FILTERGROUP(0);
        */
        TESTFIELD("Document Type");
        TESTFIELD("Document No.");
        TESTFIELD("Line No.");
        ItemDesignWorksheetHeader.RESET;
        IF ItemDesignWorksheetHeader.GET("No.") THEN BEGIN
            DesignWorksheetHeader.INIT;
            DesignWorksheetHeader.TRANSFERFIELDS(ItemDesignWorksheetHeader);
            DesignWorksheetHeader."Document No." := "Document No.";
            DesignWorksheetHeader."Document Line No." := "Line No.";
            DesignWorksheetHeader."Document Type" := DesignWorksheetHeader."Document Type"::Order;
            IF DesignWorksheetHeader.INSERT THEN;
            ItemDesignWorksheetLine.RESET;
            ItemDesignWorksheetLine.SETRANGE(ItemDesignWorksheetLine."Item No", ItemDesignWorksheetHeader."Item No.");
            IF ItemDesignWorksheetLine.FINDSET THEN
                REPEAT
                    DesignWorksheetLine.INIT;
                    DesignWorksheetLine.TRANSFERFIELDS(ItemDesignWorksheetLine);
                    DesignWorksheetLine."Document No." := "Document No.";
                    DesignWorksheetLine."Document Line No." := "Line No.";
                    DesignWorksheetLine."Document Type" := DesignWorksheetLine."Document Type"::Order;
                    IF DesignWorksheetLine.INSERT THEN;
                UNTIL ItemDesignWorksheetLine.NEXT = 0;
        END;
        COMMIT;

        CLEAR(DesignWorksheetHeader);
        DesignWorksheetHeader.SETRANGE("Document Type", DesignWorksheetHeader."Document Type"::Order);
        DesignWorksheetHeader.SETRANGE("Document No.", "Document No.");
        DesignWorksheetHeader.SETRANGE("Document Line No.", "Line No.");
        DesignWorksheetHeader.FILTERGROUP(2);
        IF DesignWorksheetHeader.FINDFIRST THEN
            PAGE.RUNMODAL(60122, DesignWorksheetHeader);
        DesignWorksheetHeader.FILTERGROUP(0);

    end;

<<<<<<< HEAD
    (4260)]
=======

>>>>>>> 75554976da0214e9ec70a45a874425238783b297
    procedure ShowDeliveryChallan();
    var
        DeliveryChallan: Record "DC Header";
    begin
        DeliveryChallan.SETRANGE(Status, DeliveryChallan.Status::Open);
        DeliveryChallan.SETRANGE("Sales Order No.", "Document No.");
        //DeliveryChallan.SETRANGE("Document Line No.","Line No.");
        PAGE.RUNMODAL(PAGE::"DC Header", DeliveryChallan);
    end;

<<<<<<< HEAD
    (4266)]
=======

>>>>>>> 75554976da0214e9ec70a45a874425238783b297
    procedure ShowSchedule2();
    var
        Schedule: Record Schedule2;
    begin
        IF ("Tender No." = '') AND ("Tender Line No." = 0) THEN BEGIN
            Schedule.RESET;
            Schedule.SETRANGE("Document Type", Schedule."Document Type"::Order);
            Schedule.SETRANGE("Document No.", "Document No.");
            Schedule.SETRANGE("Document Line No.", "Line No.");
            //Schedule.SETRANGE("Item No.","No.");
            //Schedule.SETRANGE(Quantity,Quantity);
            Schedule.FILTERGROUP(2);
            PAGE.RUN(60125, Schedule);
            Schedule.FILTERGROUP(0);
        END ELSE BEGIN
            Schedule.RESET;
            Schedule.SETRANGE("Document Type", Schedule."Document Type"::Tender);
            Schedule.SETRANGE("Document No.", "Tender No.");
            Schedule.SETRANGE("Document Line No.", "Tender Line No.");
            //Schedule.SETRANGE("Item No.","No.");
            //Schedule.SETRANGE(Quantity,Quantity);
            Schedule.FILTERGROUP(2);
            PAGE.RUN(60127, Schedule);
            Schedule.FILTERGROUP(0);
        END;
    end;

<<<<<<< HEAD
    (4289)]
=======

>>>>>>> 75554976da0214e9ec70a45a874425238783b297
    procedure ShowPODetails();
    var
        SOPodetails: Record "SO Prod.Order Details";
    begin
        SOPodetails.SETRANGE("Sales Order No.", "Document No.");
        SOPodetails.SETRANGE("Sales Order Line No.", "Line No.");
        PAGE.RUNMODAL(60126, SOPodetails);
    end;

<<<<<<< HEAD
    (4294)]
=======

>>>>>>> 75554976da0214e9ec70a45a874425238783b297
    procedure MakeLines(var SalesLineparam: Record "Sales Line"): Decimal;
    var
        SalesLine: Record "Sales Line";
        ProdOrderLine: Record "Prod. Order Line";
        PurchLine: Record "Purchase Line";
        ReqLine: Record "Requisition Line";
        ReservEntry2: Record "Reservation Entry";
        Item: Record Item;
    begin
        SalesPlanLine.DELETEALL;
        ValidateProdOrder;
        SalesLine.SETRANGE("Document Type", SalesLine."Document Type"::Order);
        SalesLine.SETRANGE("Document No.", "Document No.");
        //NSS 301207
        SalesLine.SETRANGE("Line No.", "Line No.");
        //NSS
        SalesLine.SETRANGE(Type, SalesLine.Type::Item);

        IF SalesLine.FINDFIRST THEN BEGIN
            //REPEAT
            SalesLine.TESTFIELD("Prod. Qty");
            SalesLine.TESTFIELD("Prod. Due Date");
            SalesPlanLine.INIT;
            SalesPlanLine."Sales Order No." := SalesLine."Document No.";
            SalesPlanLine."Sales Order Line No." := SalesLine."Line No.";
            SalesPlanLine."Item No." := SalesLine."No.";

            SalesPlanLine."Variant Code" := SalesLine."Variant Code";
            Item.RESET;
            IF Item.GET(SalesLine."No.") THEN
                SalesPlanLine.Description := Item.Description
            ELSE
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

<<<<<<< HEAD
    (4378)]
=======

>>>>>>> 75554976da0214e9ec70a45a874425238783b297
    procedure ValidateProdOrder();
    begin
        CALCFIELDS("Prod. Order Quantity");
        IF "Prod. Order Quantity" > Quantity THEN
            ERROR(Text001);
    end;

<<<<<<< HEAD
    (4383)]
=======

>>>>>>> 75554976da0214e9ec70a45a874425238783b297
    procedure ShowSchedule();
    var
        Schedule: Record Schedule2;
        SalesLine: Record "Sales Line";
    begin
        IF Type = Type::Item THEN BEGIN
            IF (("Tender No." <> '') AND ("Tender Line No." <> 0)) THEN BEGIN
                Schedule.RESET;
                Schedule.SETRANGE("Document Type", Schedule."Document Type"::Order);
                Schedule.SETRANGE("Document No.", "Document No.");
                Schedule.SETRANGE("Document Line No.", "Line No.");
                //Schedule.SETRANGE("Item No.","No.");
                //Schedule.SETRANGE(Quantity,Quantity);
                Schedule.FILTERGROUP(2);
                IF Schedule.FINDFIRST THEN BEGIN
                    PAGE.RUN(60125, Schedule);
                    Schedule.FILTERGROUP(0);
                END ELSE BEGIN
                    SalesLine.RESET;
                    SalesLine.SETRANGE("Document No.", "Document No.");
                    SalesLine.SETRANGE("Line No.", "Line No.");
                    IF SalesLine.FINDSET THEN
                        REPEAT
                            Schedule.INIT;
                            Schedule."Document Type" := Schedule."Document Type"::Order;
                            Schedule."Document No." := SalesLine."Document No.";
                            Schedule."Document Line No." := SalesLine."Line No.";
                            Schedule."Line No." := SalesLine."Line No.";
                            //Schedule."Line No.":=10000;     // Pranavi
                            Schedule.Type := Schedule.Type::Item;
                            Schedule.VALIDATE("No.", SalesLine."No.");
                            Schedule."Qty. Per" := 1;
                            Schedule.Quantity := SalesLine.Quantity;
                            Schedule.VALIDATE(Quantity);
                            Schedule."Unit of Measure Code" := SalesLine."Unit of Measure Code";
                            Schedule.VALIDATE("Unit of Measure Code");
                            Schedule."Location Code" := SalesLine."Location Code";
                            //salesLine.CALCFIELDS("Estimated Unit Cost");
                            IF Schedule.INSERT THEN;
                        UNTIL SalesLine.NEXT = 0;
                    COMMIT;
                    Schedule.RESET;
                    Schedule.SETRANGE("Document Type", Schedule."Document Type"::Order);
                    Schedule.SETRANGE("Document No.", "Document No.");
                    Schedule.SETRANGE("Document Line No.", "Line No.");
                    Schedule.FILTERGROUP(2);
                    PAGE.RUN(60125, Schedule);
                    Schedule.FILTERGROUP(0);
                END
            END ELSE
                IF (("Blanket Order No." <> '') AND ("Blanket Order Line No." <> 0)) THEN BEGIN
                    Schedule.RESET;
                    Schedule.SETRANGE("Document Type", Schedule."Document Type"::Order);
                    Schedule.SETRANGE("Document No.", "Document No.");
                    Schedule.SETRANGE("Document Line No.", "Line No.");
                    Schedule.FILTERGROUP(2);
                    PAGE.RUN(60125, Schedule);
                    Schedule.FILTERGROUP(0);
                END ELSE BEGIN
                    SalesLine.RESET;
                    SalesLine.SETRANGE("Document No.", "Document No.");
                    SalesLine.SETRANGE("Line No.", "Line No.");
                    IF SalesLine.FINDSET THEN
                        REPEAT
                            Schedule.INIT;
                            Schedule."Document Type" := Schedule."Document Type"::Order;
                            Schedule."Document No." := SalesLine."Document No.";
                            Schedule."Document Line No." := SalesLine."Line No.";
                            Schedule."Line No." := SalesLine."Line No.";
                            //Schedule."Line No.":=10000;  // Pranavi
                            Schedule.Type := Schedule.Type::Item;
                            Schedule.VALIDATE("No.", SalesLine."No.");
                            Schedule."Qty. Per" := 1;
                            Schedule.Quantity := SalesLine.Quantity;
                            Schedule.VALIDATE(Quantity);
                            Schedule."Unit of Measure Code" := SalesLine."Unit of Measure Code";
                            Schedule.VALIDATE("Unit of Measure Code");
                            Schedule."Location Code" := SalesLine."Location Code";
                            Schedule."Estimated Total Unit Price" := Schedule."Estimated Unit Price" * Quantity;
                            //salesLine.CALCFIELDS("Estimated Unit Cost");
                            IF Schedule.INSERT THEN;
                        UNTIL SalesLine.NEXT = 0;
                    COMMIT;
                    Schedule.RESET;
                    Schedule.SETRANGE("Document Type", Schedule."Document Type"::Order);
                    Schedule.SETRANGE("Document No.", "Document No.");
                    Schedule.SETRANGE("Document Line No.", "Line No.");
                    Schedule.FILTERGROUP(2);
                    PAGE.RUN(60125, Schedule);
                    Schedule.FILTERGROUP(0);
                END
        END ELSE
            IF Type = Type::"G/L Account" THEN BEGIN
                Schedule.RESET;
                Schedule.SETRANGE("Document Type", Schedule."Document Type"::Order);
                Schedule.SETRANGE("Document No.", "Document No.");
                Schedule.SETRANGE("Document Line No.", "Line No.");
                Schedule.FILTERGROUP(2);
                PAGE.RUN(60125, Schedule);
                Schedule.FILTERGROUP(0);
            END;
    end;

<<<<<<< HEAD
    (4621)]
=======

>>>>>>> 75554976da0214e9ec70a45a874425238783b297
    procedure CreateOrders(Qtyparam: Decimal) OrdersCreated: Boolean;
    var
        Item: Record Item;
        SalesLine: Record "Sales Line";
        ProdOrderFromSale: Codeunit "Create Prod. Order from Sale";
    begin
        IF NOT SalesPlanLine.FINDSET THEN
            EXIT;

        REPEAT
            SalesLine.GET(
              SalesLine."Document Type"::Order,
              SalesPlanLine."Sales Order No.",
              SalesPlanLine."Sales Order Line No.");
            //SalesLine.TESTFIELD("Shipment Date");
            SalesLine.CALCFIELDS("Reserved Qty. (Base)");
            //IF SalesLine."Outstanding Qty. (Base)" > SalesLine."Reserved Qty. (Base)" THEN BEGIN
            Item.GET(SalesLine."No.");
            IF Item."Replenishment System" = Item."Replenishment System"::"Prod. Order" THEN BEGIN
                OrdersCreated := TRUE;
                ProdOrderFromSale.CreateProdOrder2(
                  SalesLine, NewStatus::Released, NewOrderType::ItemOrder, 1);
                IF NewOrderType = NewOrderType::ProjectOrder THEN
                    EXIT;
            END;
        //END;
        UNTIL (SalesPlanLine.NEXT = 0);
    end;

<<<<<<< HEAD
    (4644)]
=======

>>>>>>> 75554976da0214e9ec70a45a874425238783b297
    local procedure UpdateItemNo();
    var
        UpdateSalesItem: Report "Update Sales/ Schedule Item11";
    begin
        //>>UPG1.3 06Feb2019
        TESTFIELD(Type, Type::Item);
        TESTFIELD("No.");
        TESTFIELD("Quantity Shipped", 0);
        CLEAR(UpdateSalesItem);
        UpdateSalesItem.USEREQUESTPAGE(TRUE);
        UpdateSalesItem.SetValues("Document No.", "Line No.", 0);
        UpdateSalesItem.RUN;
        CurrPage.UPDATE(FALSE);
        //<<UPG1.3 06Feb2019
    end;

<<<<<<< HEAD
    (4656)]
=======

>>>>>>> 75554976da0214e9ec70a45a874425238783b297
    procedure MakeLinesSingle(var SalesLineparam: Record "Sales Line"): Decimal;
    var
        SalesLine: Record "Sales Line";
        ProdOrderLine: Record "Prod. Order Line";
        PurchLine: Record "Purchase Line";
        ReqLine: Record "Requisition Line";
        ReservEntry2: Record "Reservation Entry";
        Item: Record Item;
    begin
        SalesPlanLine.DELETEALL;
        ValidateProdOrderSingle(SalesLineparam);
        SalesLine.SETRANGE("Document Type", SalesLine."Document Type"::Order);
        SalesLine.SETRANGE("Document No.", SalesLineparam."Document No.");
        SalesLine.SETRANGE("Line No.", SalesLineparam."Line No.");
        SalesLine.SETRANGE(Type, SalesLine.Type::Item);
        IF SalesLine.FINDSET THEN BEGIN
            REPEAT
                //SalesLine.TESTFIELD("Prod. Qty");
                //SalesLine.TESTFIELD("Prod. Due Date");
                SalesPlanLine.INIT;
                SalesPlanLine."Sales Order No." := SalesLine."Document No.";
                SalesPlanLine."Sales Order Line No." := SalesLine."Line No.";
                SalesPlanLine."Item No." := SalesLine."No.";

                SalesPlanLine."Variant Code" := SalesLine."Variant Code";
                Item.RESET;
                IF Item.GET(SalesLine."No.") THEN
                    SalesPlanLine.Description := Item.Description
                ELSE
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
            UNTIL SalesLine.NEXT = 0;
            EXIT(SalesLine."Outstanding Quantity");
        END;

    end;

<<<<<<< HEAD
    (4737)]
=======

>>>>>>> 75554976da0214e9ec70a45a874425238783b297
    procedure ValidateProdOrderSingle(SalesLineLRec: Record "Sales Line");
    begin
        SalesLineLRec.CALCFIELDS("Prod. Order Quantity");
        IF SalesLineLRec."Prod. Order Quantity" > SalesLineLRec.Quantity THEN
            ERROR(Text001);
    end;

<<<<<<< HEAD
    (4742)]
=======

>>>>>>> 75554976da0214e9ec70a45a874425238783b297
    procedure MakeLinesSingleQuantity(var SalesLineparam: Record "Sales Line"): Decimal;
    var
        SalesLine: Record "Sales Line";
        ProdOrderLine: Record "Prod. Order Line";
        PurchLine: Record "Purchase Line";
        ReqLine: Record "Requisition Line";
        ReservEntry2: Record "Reservation Entry";
        Item: Record Item;
    begin
        SalesPlanLine.DELETEALL;
        ValidateProdOrderSingle(SalesLineparam);
        SalesLine.SETRANGE("Document Type", SalesLine."Document Type"::Order);
        SalesLine.SETRANGE("Document No.", SalesLineparam."Document No.");
        SalesLine.SETRANGE("Line No.", SalesLineparam."Line No.");
        SalesLine.SETRANGE(Type, SalesLine.Type::Item);
        IF SalesLine.FINDSET THEN BEGIN
            REPEAT
                SalesLine.TESTFIELD("Prod. Qty");
                SalesLine.TESTFIELD("Prod. Due Date");
                SalesPlanLine.INIT;
                SalesPlanLine."Sales Order No." := SalesLine."Document No.";
                SalesPlanLine."Sales Order Line No." := SalesLine."Line No.";
                SalesPlanLine."Item No." := SalesLine."No.";

                SalesPlanLine."Variant Code" := SalesLine."Variant Code";
                Item.RESET;
                IF Item.GET(SalesLine."No.") THEN
                    SalesPlanLine.Description := Item.Description
                ELSE
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
            UNTIL SalesLine.NEXT = 0;
            EXIT(SalesLine."Prod. Qty");
        END;

    end;



}

