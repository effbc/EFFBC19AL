pageextension 70269 ItemCardExt extends 30
{
    Editable = false;
    layout
    {
        addafter("Base Unit of Measure")
        {
            field("Description 2"; "Description 2")
            {

            }
        }
        addafter("Item Category Code")
        {
            field("Item Sub Group Code"; "Item Sub Group Code")
            {

            }
            field("Item Sub Sub Group Code"; "Item Sub Sub Group Code")
            {

            }
            field("User ID"; "User ID")
            {

            }
            field("Avg Unit Cost"; "Avg Unit Cost")
            {

            }
            field("Item Location"; "Item Location")
            {

            }
            field("Item_verified"; "Item_verified")
            {

            }
            field(atta; atta)
            {
                Caption = 'Attachments';
            }
            field(ItemlastTransDate; ItemlastTransDate)
            {

            }
            field("Item Final Cost"; "Item Final Cost")
            {

            }
            field("<Picture2>"; Picture)
            {

            }

        }
        addafter(Inventory)
        {
            field("Stock at Stores"; "Stock at Stores")
            {
                DecimalPlaces = 0 : 5;
                trigger OnDrillDown()
                begin
                    CALCFIELDS("Quantity Under Inspection", "Quantity Rejected", "Quantity Rework", "Quantity Sent for Rework");
                    IF "QC Enabled" = TRUE THEN BEGIN
                        IF ("Quantity Under Inspection" = 0) AND ("Quantity Rejected" = 0) AND ("Quantity Rework" = 0) AND ("Quantity Sent for Rework" = 0) THEN BEGIN
                            ItemLedgEntry.RESET;
                            ItemLedgEntry.SETCURRENTKEY("Item No.", "Variant Code", Open, Positive, "Location Code", "Posting Date",
                            "Expiration Date", "Lot No.", "Serial No.");
                            ItemLedgEntry.SETRANGE("Item No.", "No.");
                            ItemLedgEntry.SETRANGE(Open, TRUE);
                            ItemLedgEntry.SETRANGE("Location Code", 'STR');
                            PAGE.RUNMODAL(38, ItemLedgEntry);
                        END ELSE BEGIN
                            ItemLedgEntry.RESET;
                            ItemLedgEntry.SETCURRENTKEY("Item No.", "Variant Code", Open, Positive, "Location Code", "Posting Date",
                            "Expiration Date", "Lot No.", "Serial No.");

                            ItemLedgEntry.SETRANGE("Item No.", "No.");
                            ItemLedgEntry.SETRANGE(Open, TRUE);
                            ItemLedgEntry.SETRANGE("Location Code", 'STR');
                            IF ItemLedgEntry.FINDSET THEN
                                REPEAT
                                    /* IF (QualityItemLedgEntry.GET(ItemLedgEntry."Entry No.") AND (QualityItemLedgEntry."Inspection Status" =
                                    QualityItemLedgEntry."Inspection Status"::"Under Inspection")) OR
                                    (QualityItemLedgEntry.GET(ItemLedgEntry."Entry No.")
                                    AND (QualityItemLedgEntry."Inspection Status" = QualityItemLedgEntry."Inspection Status"::"Reject")) THEN
                                           ItemLedgEntry.MARK(FALSE);
                                   UNTIL ItemLedgEntry.NEXT = 0; */

                                    ItemLedgEntry.MARK(TRUE);
                                    IF ((QualityItemLedgEntry.GET(ItemLedgEntry."Entry No.") AND
                                    (QualityItemLedgEntry."Inspection Status" = QualityItemLedgEntry."Inspection Status"::"Under Inspection"))
                                     OR (QualityItemLedgEntry.GET(ItemLedgEntry."Entry No.")
                                    AND (QualityItemLedgEntry."Inspection Status" = QualityItemLedgEntry."Inspection Status"::Rejected))) THEN
                                        ItemLedgEntry.MARK(FALSE);
                                //  "Stock at Stores":="Stock at Stores"+ItemLedgEntry."Remaining Quantity";
                                UNTIL ItemLedgEntry.NEXT = 0;
                            ItemLedgEntry.MARKEDONLY(TRUE);
                            PAGE.RUNMODAL(38, ItemLedgEntry);
                        END;
                    END;
                end;
            }
            field("Stock at CS Stores"; "Stock at CS Stores")
            {

            }
            field("Stock at RD Stores"; "Stock at RD Stores")
            {

            }
            field("Stock at PROD Stores"; "Stock at PROD Stores")
            {

            }
            field("Stock at Mag Stores"; "Stock at Mag Stores")
            {
                Caption = 'Stock at Mangalagiri Stores';
            }
            field("Stock at Mag MCH1"; "Stock at Mag MCH1")
            {
                Caption = 'Stock at Mangalagir MCH1';
            }
            field("Total Stock"; "Item_Total_Stock")
            {
                Editable = false;
            }
            field("Quantity Under Inspection"; "Quantity Under Inspection")
            {

            }
            field("Quantity Sent for Rework"; "Quantity Sent for Rework")
            {

            }
        }
        addafter("Qty. on Purch. Order")
        {
            field("Quantity Rejected"; "Quantity Rejected")
            {

            }
        }
        addafter("Qty. on Prod. Order")
        {
            field("Quantity Accepted"; "Quantity Accepted")
            {
                DrillDown = true;
                trigger OnDrillDown()
                var
                    ItemLedgEntry: Record "Item Ledger Entry";
                    QualityItemLedgEntry: Record "Quality Item Ledger Entry";
                begin
                    //B2BQC 1.1
                    CALCFIELDS("Quantity Under Inspection", "Quantity Rejected", "Quantity Rework", "Quantity Sent for Rework");
                    IF "QC Enabled" = TRUE THEN BEGIN
                        IF ("Quantity Under Inspection" = 0) AND ("Quantity Rejected" = 0) AND ("Quantity Rework" = 0) AND ("Quantity Sent for Rework" = 0) THEN BEGIN
                            ItemLedgEntry.RESET;
                            ItemLedgEntry.SETCURRENTKEY("Location Code", Open, "Item No.");
                            ItemLedgEntry.SETRANGE("Item No.", "No.");
                            ItemLedgEntry.SETRANGE(Open, TRUE);
                            PAGE.RUNMODAL(38, ItemLedgEntry);
                        END ELSE BEGIN
                            ItemLedgEntry.RESET;
                            //New line added on 140108
                            ItemLedgEntry.SETCURRENTKEY("Location Code", Open, "Item No.");
                            //New line added on 140108
                            ItemLedgEntry.SETRANGE("Item No.", "No.");
                            ItemLedgEntry.SETRANGE(Open, TRUE);
                            IF ItemLedgEntry.FINDSET THEN
                                REPEAT
                                    ItemLedgEntry.MARK(TRUE);
                                    IF QualityItemLedgEntry.GET(ItemLedgEntry."Entry No.") THEN
                                        ItemLedgEntry.MARK(FALSE);
                                UNTIL ItemLedgEntry.NEXT = 0;
                            ItemLedgEntry.MARKEDONLY(TRUE);
                            PAGE.RUNMODAL(38, ItemLedgEntry);
                        END;
                    END;
                end;
            }
            field("Quantity Rework"; "Quantity Rework")
            {

            }
        }
        addafter("Qty. on Sales Order")
        {
            field("Qty. on Mat.Req"; "Qty. on Mat.Req")
            {

            }
        }
        addafter(PreventNegInventoryDefaultNo)
        {
            field(Sample; Sample)
            {

            }
            field("No.of Units"; "No.of Units")
            {
                trigger OnValidate()
                begin
                    //Added by Vishnu Priya
                    ProdOrders.RESET;
                    ProdOrders.SETRANGE(Status, ProdOrders.Status::Released);
                    ProdOrders.SETRANGE("Source No.", "No.");
                    IF ProdOrders.FINDSET THEN BEGIN
                        REPEAT
                            ProdOrders.Itm_card_No_of_Units := "No.of Units";
                            ProdOrders.Itm_Card_ttl_units := ProdOrders.Quantity * "No.of Units";
                            ProdOrders.MODIFY;
                        UNTIL ProdOrders.NEXT = 0;
                    END;
                    //Added by Vishnu Priya
                end;
            }
            field("CS IGC"; "CS IGC")
            {

            }
        }
        addafter("Sales Unit of Measure")
        {
            field("Service Item Group"; "Service Item Group")
            {

            }
        }
        addafter("Include Inventory")
        {
            field("Type of Solder"; "Type of Solder")
            {

            }
            field("No. of Soldering Points"; "No. of Soldering Points")
            {

            }
            field("No. of Pins"; "No. of Pins")
            {

            }
            field("No. of Opportunities"; "No. of Opportunities")
            {

            }
            field("No.of Fixing Holes"; "No.of Fixing Holes")
            {

            }
        }
        addafter("Order Multiple")
        {
            field("Safety Stock Qty (R&D)"; "Safety Stock Qty (R&D)")
            {

            }
            field("Safety Stock Qty (CS)"; "Safety Stock Qty (CS)")
            {

            }
            field("<Safety Stock Quantity2>"; "Safety Stock Quantity")
            {

            }
        }
        addafter("Use Cross-Docking")
        {
            field("BIN Address"; "BIN Address")
            {

            }
            field("Stock Address"; "Stock Address")
            {

            }
            field("<Spec ID2>"; "Spec ID")
            {
                Editable = true;
            }
            field(Picture; Picture)
            {

            }
        }
        addafter("Unit Price")
        {
            field(Quality; Quality)
            {
                Caption = 'Quality';
            }
            field("Spec ID"; "Spec ID")
            {

            }
            field("Insp. Time Inbound(In Min.)"; "Insp. Time Inbound(In Min.)")
            {

            }
            field("QC Enabled"; "QC Enabled")
            {

            }
            field("WIP QC Enabled"; "WIP QC Enabled")
            {

            }
            field("Insp. Time WIP(In Min.)"; "Insp. Time WIP(In Min.)")
            {

            }
            group(Control1900582501)
            {
                Caption = 'Specifications';
                field("Part Number"; "Part Number")
                {

                }
                field(Make; Make)
                {

                }
                field("Operating Temperature"; "Operating Temperature")
                {

                }
                field("Storage Temperature"; "Storage Temperature")
                {

                }
                field(Humidity; Humidity)
                {

                }
                field("ESD Sensitive"; "ESD Sensitive")
                {

                }
                field("Item Status"; "Item Status")
                {

                }
                field("Soldering Temp."; "Soldering Temp.")
                {

                }
                field("Soldering Time (Sec)"; "Soldering Time (Sec)")
                {

                }
                field("On C-Side"; "On C-Side")
                {

                }
                field("On D-Side"; "On D-Side")
                {

                }
                field("On S-Side"; "On S-Side")
                {

                }
                field("Surface Finish"; "Surface Finish")
                {

                }
                field("Work area Temp &  Humadity"; "Work area Temp &  Humadity")
                {

                }
                field(ESD; ESD)
                {

                }
                field(MSL; MSL)
                {

                }
                field("ESD Class"; "ESD Class")
                {

                }
                field("Floor Life at 25 C 40% RH"; "Floor Life at 25 C 40% RH")
                {

                }
                field("Bake Hours"; "Bake Hours")
                {

                }
                field("Component Shelf Life(Years)"; "Component Shelf Life(Years)")
                {

                }
                field("<Type of Solder2>"; "Type of Solder")
                {

                }
                field(Package; Package)
                {

                }
                field("<No. of Soldering Points2>"; "No. of Soldering Points")
                {

                }
                field("<No. of Pins2>"; "No. of Pins")
                {

                }
                field("PCB thickness"; "PCB thickness")
                {
                    DecimalPlaces = 1 : 5;
                    trigger OnValidate()
                    begin
                        IF (USERID <> 'EFFTRONICS\ANVKUMARI') THEN
                            ERROR('You Have No Rights');
                    end;
                }
                field("Copper Clad Thickness"; "Copper Clad Thickness")
                {
                    trigger OnValidate()
                    begin
                        IF (USERID <> 'EFFTRONICS\ANVKUMARI') THEN
                            ERROR('You Have No Rights');
                    end;
                }
                field("PCB Shape"; "PCB Shape")
                {
                    trigger OnValidate()
                    begin
                        IF (USERID <> 'EFFTRONICS\ANVKUMARI') THEN
                            ERROR('You Have No Rights');
                    end;
                }
                field(Length; Length)
                {
                    trigger OnValidate()
                    begin
                        IF (USERID <> 'EFFTRONICS\VIJAYA') THEN
                            ERROR('You Have No Rights');
                    end;
                }
                field(Width; Width)
                {
                    trigger OnValidate()
                    begin
                        IF (USERID <> 'EFFTRONICS\VIJAYA') THEN
                            ERROR('You Have No Rights');
                    end;
                }
                field("PCB Area"; "PCB Area")
                {
                    DecimalPlaces = 1 : 5;
                    trigger OnValidate()
                    begin
                        IF (USERID <> 'SUPER') THEN
                            ERROR('You Have No Rights');
                    end;
                }
                field("Semi Mounted"; "Semi Mounted")
                {

                }
                field("Thickness of Package"; "Thickness of Package")
                {

                }
                group(Machine)
                {
                    field("No of Panels"; "No of Panels")
                    {
                        Editable = mch_tag_editable;
                    }
                    field("SMD_But_mchine_cant_do"; "SMD_But_mchine_cant_do")
                    {
                        Editable = mch_tag_editable;
                    }
                }
            }
        }

    }

    actions
    {
        addfirst(processing)
        {
            group("&Quality")
            {
                Caption = 'Quality';
                group(Inspection)
                {
                    Caption = 'Inspection';
                    Image = QualificationOverview;
                    action("Inspection Data Sheets")
                    {
                        Caption = 'Inspection Data Sheets';
                        Image = WorkSheet;
                        trigger OnAction()
                        begin
                            ShowDataSheets;
                        end;
                    }
                    action("Posted Inspection Data Sheets")
                    {
                        Caption = 'Posted Inspection Data Sheets';
                        Image = PostedShipment;
                        trigger OnAction()
                        begin
                            ShowPostDataSheets;
                        end;
                    }
                    action("Inspection &Receipts")
                    {
                        Caption = 'Inspection &Receipts';
                        Image = Receipt;
                        trigger OnAction()
                        begin
                            ShowInspectReceipt;
                        end;
                    }
                    action("Posted I&nspection Receipts")
                    {
                        Caption = 'Posted I&nspection Receipts';
                        Image = PostedReceipt;
                        trigger OnAction()
                        begin
                            ShowPostInspectReceipt;
                        end;
                    }
                    action("Create Inspection Data &Sheets")
                    {
                        Caption = 'Create Inspection Data &Sheets';
                        Image = CreateDocument;
                        trigger OnAction()
                        begin
                            TESTFIELD("Quantity Accepted");
                            CreateInspectionDataSheets;
                        end;
                    }
                }
            }
        }
        addafter("&Value Entries")
        {
            action("&Quality Ledger Entries"; "&Quality Ledger Entries")
            {
                Caption='&Quality Ledger Entries';
                RunObject = Page "Quality Ledger Entries";
                RunPageLink = "Item No." = FIELD("No.");
                Image = TaskQualityMeasure;
            }
        }
        addafter(BOMStructure)
        {
            action("Alternative Items")
            {
                Caption = 'Alternative Items';
                Image = ItemVariant;
                trigger OnAction()
                begin
                    "Alternate Item".SETRANGE("Alternate Item"."Item No.", "No.");
                    PAGE.RUN(60070, "Alternate Item");
                end;
            }
            action(PCB)
            {
                Caption = 'PCB';
                Visible = visible1;
                Image = Card;
                trigger OnAction()
                begin
                    pcb1.RESET;
                    pcb1.SETRANGE(pcb1."PCB No.", "No.");
                    IF pcb1.FINDFIRST THEN
                        PAGE.RUN(60240, pcb1)
                    ELSE BEGIN
                        pcb1.INIT;
                        pcb1."PCB No." := "No.";
                        pcb1.Description := Description;
                        pcb1."PCB Thickness" := "PCB thickness";
                        pcb1."Copper Clad Thinkness" := "Copper Clad Thickness";
                        pcb1."PCB Area" := "PCB Area";
                        pcb1.Length := Length;
                        pcb1.Width := Width;
                        pcb1."PCB Shape" := "PCB Shape";
                        pcb1."On C-side" := "On C-Side";
                        pcb1."On D-side" := "On D-Side";
                        pcb1."On S-side" := "On S-Side";
                        pcb1.INSERT;
                        pcb1.RESET;
                        pcb1.SETRANGE(pcb1."PCB No.", "No.");
                        IF pcb1.FINDFIRST THEN
                            PAGE.RUN(60240, pcb1);
                    END;
                end;
            }
        }
        addafter("Skilled Resources")
        {
            action(Specifications)
            {
                Caption = 'Specifications';
                ToolTipML = Specifications;
                RunObject = Page "Item Specification";
                RunPageLink = "Item No." = FIELD("No."), "Product Group Code" = FIELD("Product Group Code"), "Item Category Code" = FIELD("Item Category Code"), "Item Sub Group Code" = FIELD("Item Sub Group Code"), "Item Sub Sub Group Code" = FIELD("Item Sub Sub Group Code");
                Image = ItemVariant;
            }
            action(Attachments)
            {
                Caption = 'Attachments';
                RunObject = Page "ESPL Attachments";
                RunPageLink = "Table ID" = CONST(27), "Document No." = FIELD("No.");
                Image = Attachments;
            }
            action("Design Work Sheet")
            {
                Caption = 'Design Work Sheet';
                RunObject = Page "Item Design WorkSheet Header";
                RunPageLink = "Item No." = FIELD("No.");
                Image = PlanningWorksheet;
            }
            action("Lot No/'s")
            {
                Caption = 'Lot No/ s';
                RunObject = Page "Deveation Master";
                RunPageLink = "Item No" = FIELD("No.");
                Image = Lot;
            }
        }
        addafter(ApplyTemplate)
        {
            action("Update BOM Cost")
            {
                Caption = 'Update BOM Cost';
                ToolTipML = "Update BOM Cost";
                Image = UpdateUnitCost;
                trigger OnAction()
                begin
                    ItemCostUpdation.UpdateBOMCost;
                end;
            }
            action("Update Routing Cost")
            {
                Caption = 'Update Routing Cost';
                ToolTipML = "Update Routing Cost";
                Image = UpdateUnitCost;
                trigger OnAction()
                begin
                    ItemCostUpdation.RoutingCostUpdation;
                end;
            }
            action(Action1000000036)
            {
                Caption = 'Attachments';
                Promoted = true;
                Image = Attachments;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    attachments.RESET;
                    attachments.SETRANGE("Table ID", DATABASE::Item);
                    attachments.SETRANGE("Document No.", "No.");
                    PAGE.RUN(PAGE::"ESPL Attachments", attachments);
                end;
            }
        }
        addafter("Item Tracing")
        {
            action("Update CS IGC")
            {
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    Window: DotNet "'Microsoft.VisualBasic, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a'.Microsoft.VisualBasic.Interaction" RUNONCLIENT;
                    CSIGC_Code: Code[20];
                begin
                    // >>Added by Pranavi on 25-Apr-2017 for CS IGC Code updatation
                    CLEAR(CSIGC_Code);

                    /*  Window.OPEN('Please enter CS IGC code: ##############1##',CSIGC_Code);
                     Window.INPUT(1,CSIGC_Code);
                     MESSAGE(CSIGC_Code);
                     Window.CLOSE; */

                    IF USERID IN ['EFFTRONICS\SRIVALLI', 'EFFTRONICS\PRANAVI'] THEN BEGIN
                        CSIGC_Code := Window.InputBox('Enter CS IGC Code:', 'INPUT', Rec."CS IGC", 100, 100);
                        IF (CSIGC_Code <> '') THEN BEGIN
                            IF ("CS IGC" <> '') THEN BEGIN
                                IF ("CS IGC" <> CSIGC_Code) THEN
                                    IF CONFIRM('Are You Sure to update the CS IGC code from ' + Rec."CS IGC" + ' to ' + CSIGC_Code + ' ?', FALSE) THEN BEGIN
                                        "CS IGC" := CSIGC_Code;
                                        MODIFY;
                                    END;
                            END ELSE BEGIN
                                "CS IGC" := CSIGC_Code;
                                MODIFY;
                            END;
                        END;
                    END ELSE
                        ERROR('You Do not have right to update CS IGC!');
                    // <<Added by Pranavi on 25-Apr-2017 for CS IGC Code updatation
                end;

            }
            action("Update BIN & Stock Address")
            {
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    Prompt: DotNet "'System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Windows.Forms.Form" RUNONCLIENT;
                    FormBorderStyle: DotNet "'System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Windows.Forms.FormBorderStyle" RUNONCLIENT;
                    FormStartPosition: DotNet "'System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Windows.Forms.FormStartPosition" RUNONCLIENT;
                    lblIBINAddress: DotNet "'System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Windows.Forms.Label" RUNONCLIENT;
                    lblStockAddress: DotNet "'System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Windows.Forms.Label" RUNONCLIENT;
                    txtBINAddress: DotNet "'System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Windows.Forms.TextBox" RUNONCLIENT;
                    txtStockAddress: DotNet "'System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Windows.Forms.TextBox" RUNONCLIENT;
                    confirmation: DotNet "'System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Windows.Forms.Button" RUNONCLIENT;
                    DialogResult: DotNet "'System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Windows.Forms.DialogResult" RUNONCLIENT;
                    BINAddress: Code[20];
                    StockAddress: Code[20];
                begin
                    //Creating the form
                    IF NOT (USERID IN ['EFFTRONICS\TULASI', 'EFFTRONICS\SUJANI', 'EFFTRONICS\MARI', 'EFFTRONICS\VSNGEETHA', 'EFFTRONICS\PADMAJA']) THEN
                        ERROR('You Do not have rights to update BIN & Stock Address!');
                    Prompt := Prompt.Form();
                    Prompt.Width := 500;
                    Prompt.Height := 230;
                    Prompt.FormBorderStyle := FormBorderStyle.FixedDialog;

                    Prompt.Text := 'Enter BIN & Stock Address Details';
                    Prompt.StartPosition := FormStartPosition.CenterScreen;

                    //Creating the form
                    //Adding Labels

                    lblIBINAddress := lblIBINAddress.Label();
                    lblIBINAddress.Text('BIN Address :');
                    lblIBINAddress.Left(50);
                    lblIBINAddress.Top(20);
                    Prompt.Controls.Add(lblIBINAddress);

                    lblStockAddress := lblStockAddress.Label();
                    lblStockAddress.Text('Stock Address :');
                    lblStockAddress.Left(50);
                    lblStockAddress.Top(50);
                    Prompt.Controls.Add(lblStockAddress);

                    //Adding Labels
                    //adding text boxes, you can use other components like the dropdown list or a calendar, //or radio buttons

                    txtBINAddress := txtBINAddress.TextBox();
                    txtBINAddress.Left(180);
                    txtBINAddress.Top(20);
                    txtBINAddress.Width(150);
                    Prompt.Controls.Add(txtBINAddress);

                    txtStockAddress := txtStockAddress.TextBox();
                    txtStockAddress.Left(180);
                    txtStockAddress.Top(50);
                    txtStockAddress.Width(150);
                    Prompt.Controls.Add(txtStockAddress);

                    //adding text boxes
                    //adding submit button

                    confirmation := confirmation.Button();
                    confirmation.Text('OK');
                    confirmation.Left(180);
                    confirmation.Top(120);
                    confirmation.Width(150);
                    confirmation.DialogResult := DialogResult.OK;
                    Prompt.Controls.Add(confirmation);
                    Prompt.AcceptButton := confirmation;

                    //adding submit button

                    // Getting the Result
                    BINAddress := "BIN Address";
                    StockAddress := "Stock Address";
                    txtBINAddress.Text := "BIN Address";
                    txtStockAddress.Text := "Stock Address";
                    IF (Prompt.ShowDialog().ToString() = DialogResult.OK.ToString()) THEN BEGIN
                        IF (txtBINAddress.Text <> BINAddress) AND (BINAddress <> '') THEN BEGIN
                            IF CONFIRM('Are You Sure to update the BIN Address from ' + Rec."BIN Address" + ' to ' + txtBINAddress.Text + ' ?', FALSE) THEN BEGIN
                                "BIN Address" := txtBINAddress.Text;
                                MODIFY;
                            END;
                        END ELSE
                            IF (txtBINAddress.Text <> BINAddress) AND (BINAddress = '') THEN BEGIN
                                "BIN Address" := txtBINAddress.Text;
                                MODIFY;
                            END;
                        IF (txtStockAddress.Text <> StockAddress) AND (StockAddress <> '') THEN BEGIN
                            IF CONFIRM('Are You Sure to update the Stock Address from ' + Rec."Stock Address" + ' to ' + txtStockAddress.Text + ' ?', FALSE) THEN BEGIN
                                "Stock Address" := txtStockAddress.Text;
                                MODIFY;
                            END;
                        END ELSE
                            IF (txtStockAddress.Text <> StockAddress) AND (StockAddress = '') THEN BEGIN
                                "Stock Address" := txtStockAddress.Text;
                                MODIFY;
                            END;
                    END;

                    Prompt.Dispose();

                    // Getting the Result
                end;
            }
            action("Verify Item")
            {
                trigger OnAction()
                begin
                    // Added by sujani on 07-06-2018 for the item verification
                    //directly add permission ITEM_VERIFICATION for the rights
                    IF NOT (SMTP_MAIL.Permission_Checking(USERID, 'ITEM_VERIFICATION'))
                     THEN
                        ERROR('You Don"t have Permissions')
                    ELSE BEGIN
                        IF Rec.Item_verified = TRUE THEN BEGIN
                            Itm_verification_confirm := DIALOG.CONFIRM('Item already Verified,would you like to Uncheck', TRUE, Description);
                            IF Itm_verification_confirm = TRUE THEN BEGIN
                                Rec.Item_verified := FALSE;
                                MODIFY;
                                CurrPage.UPDATE;
                            END;
                        END
                        ELSE BEGIN
                            Itm_verification_confirm := DIALOG.CONFIRM('Would you like to check the Item_Verified', TRUE, Description);
                            IF Itm_verification_confirm = TRUE THEN BEGIN
                                Rec.Item_verified := TRUE;
                                MODIFY;
                                CurrPage.UPDATE;
                            END;
                        END;
                    END;
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        CALCFIELDS("Inventory at Stores");
        CALCFIELDS("Quantity Under Inspection");
        CALCFIELDS("Quantity Rejected");
        "Inventory at STR" := "Inventory at Stores" - ("Quantity Under Inspection" + "Quantity Rejected");

        /* atta := FALSE;
        attachments.RESET;
        attachments.SETRANGE("Table ID", DATABASE::Item);
        attachments.SETRANGE("Document No.", "No.");
        IF attachments.COUNT > 0 THEN
        atta := TRUE; */

        "Stock at Stores" := "Inventory at Stores" - ("Quantity Under Inspection" + "Quantity Rejected");
        IF "Stock at Stores" < 0 THEN
            "Stock at Stores" := 0;

        // MODIFY;

        IF (USERID IN ['EFFTRONICS\SUJANI', 'EFFTRONICS\ANVKUMARI']) THEN
            mch_tag_editable := TRUE
        ELSE
            mch_tag_editable := FALSE;
    end;

    trigger OnAfterGetRecord()
    begin
        visible1 := FALSE;
        item.RESET;
        item.SETRANGE(item."No.", "No.");
        IF item.FINDFIRST THEN BEGIN
            IF item."Product Group Code" IN ['PCB', 'MPCB', 'CPCB'] THEN BEGIN
                visible1 := TRUE;
            END;
        END;    //swathi

        "Stock at Stores" := 0;
        //ItemCostMgt.CalculateAverageCost(Rec,AverageCostLCY,AverageCostACY);

        //B2B
        IF ("QC Enabled" = TRUE) AND (Inventory >= 0) THEN
            "Quantity Accepted" := Inventory - ("Quantity Rejected" + "Quantity Under Inspection" + "Quantity Rework" +
              "Quantity Sent for Rework");

        /* PurchaseInvLine.RESET;
PurchaseInvLine.SETCURRENTKEY(Type, "No.", "Variant Code");
PurchaseInvLine.SETRANGE(Type, PurchaseInvLine.Type::Item);
PurchaseInvLine.SETRANGE("No.", "No.");
IF PurchaseInvLine.FINDSET THEN
REPEAT
 TotQty += PurchaseInvLine.Quantity;
 TotVendorAmt += PurchaseInvLine."Amount To Vendor";
UNTIL PurchaseInvLine.NEXT = 0;
IF TotVendorAmt <> 0 THEN
"Avg Unit Cost" := TotVendorAmt / TotQty; */
        //B2B


        //B2B
        "Stock at Stores" := 0;
        CALCFIELDS("Inventory at Stores");
        CALCFIELDS("Quantity Rejected");
        CALCFIELDS("Quantity Under Inspection");
        //"Inventory at STR" := "Inventory at Stores" - ("Quantity Under Inspection"+"Quantity Rejected");
        //"Stock at Stores":= "Inventory at Stores"- ("Quantity Under Inspection"+"Quantity Rejected");
        IF "Stock at Stores" < 0 THEN
            "Stock at Stores" := 0;//a190808

        //anil

        CALCFIELDS("Quantity Under Inspection", "Quantity Rejected", "Quantity Rework", "Quantity Sent for Rework", "Stock At MCH Location", "Stock at CS Stores", "Stock at RD Stores", "Stock at PROD Stores");
        //IF "QC Enabled" = TRUE THEN BEGIN
        IF ("Quantity Under Inspection" = 0) AND ("Quantity Rejected" = 0) AND ("Quantity Rework" = 0) AND ("Quantity Sent for Rework" = 0) THEN BEGIN

            //  "Stock at Stores":=0 ;
            ItemLedgEntry.RESET;
            ItemLedgEntry.SETCURRENTKEY("Item No.", "Variant Code", Open, Positive, "Location Code", "Posting Date",
            "Expiration Date", "Lot No.", "Serial No.");
            ItemLedgEntry.SETRANGE("Item No.", "No.");
            ItemLedgEntry.SETRANGE(Open, TRUE);
            ItemLedgEntry.SETRANGE("Location Code", 'STR');
            ItemLedgEntry.SETFILTER(ItemLedgEntry."Remaining Quantity", '<>%1', 0);
            IF ItemLedgEntry.FINDSET THEN
                REPEAT
                    ItemLedgEntry.MARK(TRUE);
                UNTIL ItemLedgEntry.NEXT = 0;
            // Page.RUNMODAL(38,ItemLedgEntry);
        END ELSE BEGIN


            ItemLedgEntry.RESET;
            ItemLedgEntry.SETCURRENTKEY("Item No.", "Variant Code", Open, Positive, "Location Code", "Posting Date",
            "Expiration Date", "Lot No.", "Serial No.");

            ItemLedgEntry.SETRANGE("Item No.", "No.");
            ItemLedgEntry.SETRANGE(Open, TRUE);
            ItemLedgEntry.SETRANGE("Location Code", 'STR');
            ItemLedgEntry.SETFILTER(ItemLedgEntry."Remaining Quantity", '>%1', 0);
            IF ItemLedgEntry.FINDSET THEN
                REPEAT
                    ItemLedgEntry.MARK(TRUE);
                    IF (QualityItemLedgEntry.GET(ItemLedgEntry."Entry No.") AND (QualityItemLedgEntry."Inspection Status" =
                    QualityItemLedgEntry."Inspection Status"::"Under Inspection")) OR
                    (QualityItemLedgEntry.GET(ItemLedgEntry."Entry No.")
                    AND (QualityItemLedgEntry."Inspection Status" = QualityItemLedgEntry."Inspection Status"::Rejected)) THEN
                        ItemLedgEntry.MARK(FALSE);
                //  "Stock at Stores":="Stock at Stores"+ItemLedgEntry."Remaining Quantity";
                UNTIL ItemLedgEntry.NEXT = 0;
            //Page.RUNMODAL(38,ItemLedgEntry);
        END;
        //END;


        ItemLedgEntry.MARKEDONLY(TRUE);
        IF ItemLedgEntry.FINDSET THEN
            REPEAT

                "Stock at Stores" := "Stock at Stores" + ItemLedgEntry."Remaining Quantity";
            UNTIL ItemLedgEntry.NEXT = 0;

        Item_Total_Stock := "Stock At MCH Location" + "Stock at CS Stores" + "Stock at RD Stores" + "Stock at PROD Stores" + "Stock at Stores";
        //anil260808


        /* CALCFIELDS("Quantity Under Inspection","Quantity Rejected","Quantity Rework","Quantity Sent for Rework");
        IF "QC Enabled" = TRUE THEN BEGIN
         IF ("Quantity Under Inspection"=0)AND ("Quantity Rejected"=0) AND ("Quantity Rework"=0) AND ("Quantity Sent for Rework"=0) THEN
          BEGIN
          ItemLedgEntry.RESET;
          ItemLedgEntry.SETCURRENTKEY("Item No.","Variant Code",Open,Positive,"Location Code","Posting Date",
          "Expiration Date","Lot No.","Serial No.");
          ItemLedgEntry.SETRANGE("Item No.","No.");
          ItemLedgEntry.SETRANGE(Open,TRUE);
          ItemLedgEntry.SETRANGE("Location Code",'STR');
          IF ItemLedgEntry.FINDSET THEN
          REPEAT
            "Stock at Stores":="Stock at Stores"+ItemLedgEntry."Remaining Quantity";
          UNTIL ItemLedgEntry.NEXT=0;
         // Page.RUNMODAL(38,ItemLedgEntry);
         END ELSE BEGIN
          ItemLedgEntry.RESET;
          ItemLedgEntry.SETCURRENTKEY("Item No.","Variant Code",Open,Positive,"Location Code","Posting Date",
          "Expiration Date","Lot No.","Serial No.");

          ItemLedgEntry.SETRANGE("Item No.","No.");
          ItemLedgEntry.SETRANGE(Open,TRUE);
          ItemLedgEntry.SETRANGE("Location Code",'STR');
          IF ItemLedgEntry.FINDSET THEN
          REPEAT
           //IF (QualityItemLedgEntry.GET(ItemLedgEntry."Entry No.") AND (QualityItemLedgEntry."Inspection Status"=
           //QualityItemLedgEntry."Inspection Status"::"Under Inspection")) OR
           //(QualityItemLedgEntry.GET(ItemLedgEntry."Entry No.")
           //AND (QualityItemLedgEntry."Inspection Status"=QualityItemLedgEntry."Inspection Status"::"Reject")) THEN
            //ItemLedgEntry.MARK(FALSE);
          //UNTIL ItemLedgEntry.NEXT=0; 

           ItemLedgEntry.MARK(TRUE);
           IF( (QualityItemLedgEntry.GET(ItemLedgEntry."Entry No.") AND
           (QualityItemLedgEntry."Inspection Status"=QualityItemLedgEntry."Inspection Status"::"Under Inspection"))
            OR (QualityItemLedgEntry.GET(ItemLedgEntry."Entry No.")
           AND (QualityItemLedgEntry."Inspection Status"=QualityItemLedgEntry."Inspection Status"::Rejected))) THEN
            ItemLedgEntry.MARK(FALSE);
            "Stock at Stores":="Stock at Stores"+ItemLedgEntry."Remaining Quantity";
          UNTIL ItemLedgEntry.NEXT=0;
          ItemLedgEntry.MARKEDONLY(TRUE);
        //  Page.RUNMODAL(38,ItemLedgEntry);
          END;
        END; */


        //******** Santhosh

        /* CALCFIELDS("Quantity Under Inspection","Quantity Rejected","Quantity Rework","Quantity Sent for Rework");
        IF "QC Enabled" = TRUE THEN BEGIN
         IF ("Quantity Under Inspection"=0)AND ("Quantity Rejected"=0) AND ("Quantity Rework"=0) AND ("Quantity Sent for Rework"=0) THEN
          BEGIN
          // "Stock at Stores":=0 ;
          ItemLedgEntry.RESET;
          ItemLedgEntry.SETCURRENTKEY("Item No.","Variant Code",Open,Positive,"Location Code","Posting Date",
          "Expiration Date","Lot No.","Serial No.");
          ItemLedgEntry.SETRANGE("Item No.","No.");
          ItemLedgEntry.SETRANGE(Open,TRUE);
          ItemLedgEntry.SETRANGE("Location Code",'MCH');
         // Page.RUNMODAL(38,ItemLedgEntry);
         END ELSE BEGIN
          "Stock at Stores":=0 ;
          ItemLedgEntry.RESET;
          ItemLedgEntry.SETCURRENTKEY("Item No.","Variant Code",Open,Positive,"Location Code","Posting Date",
          "Expiration Date","Lot No.","Serial No.");

          ItemLedgEntry.SETRANGE("Item No.","No.");
          ItemLedgEntry.SETRANGE(Open,TRUE);
          ItemLedgEntry.SETRANGE("Location Code",'MCH');
          IF ItemLedgEntry.FINDSET THEN
          REPEAT
           ItemLedgEntry.MARK(TRUE);
           IF (QualityItemLedgEntry.GET(ItemLedgEntry."Entry No.") AND (QualityItemLedgEntry."Inspection Status"=
           QualityItemLedgEntry."Inspection Status"::"Under Inspection")) OR
           (QualityItemLedgEntry.GET(ItemLedgEntry."Entry No.")
           AND (QualityItemLedgEntry."Inspection Status"=QualityItemLedgEntry."Inspection Status"::Rejected)) THEN
            ItemLedgEntry.MARK(FALSE);
          //  "Stock at Stores":="Stock at Stores"+ItemLedgEntry."Remaining Quantity";
          UNTIL ItemLedgEntry.NEXT=0;
          //Page.RUNMODAL(38,ItemLedgEntry);
          END;
        END;
          ItemLedgEntry.MARKEDONLY(TRUE);
          IF ItemLedgEntry.FINDSET THEN
          REPEAT
            StockAtMCH:=StockAtMCH+ItemLedgEntry."Remaining Quantity";
             UNTIL ItemLedgEntry.NEXT=0; */
        //***********santhosh


        /* atta:=FALSE;
        attachments.RESET;
        attachments.SETRANGE("Table ID",DATABASE::Item);
        attachments.SETRANGE("Document No.","No.");
        IF attachments.COUNT>0 THEN
        atta:=TRUE; */


        //MNRAJU change on 14-May-2014 for Item Verified date

        /* chglog.RESET;
        chglog.SETCURRENTKEY(chglog."Entry No.");
        chglog.SETFILTER(chglog."Table No.",'27');
        chglog.SETFILTER(chglog."Primary Key Field 1 Value","No.");
        chglog.SETFILTER(chglog."Field No.",'60203');
        //chglog.SETFILTER(chglog."New Value",'Yes');
        IF chglog.FINDLAST THEN
        BEGIN
          Ver_Date:=chglog."Date and Time";
        END; */

        //MNRAJU change on 14-May-2014 for Item Verified date
    end;

    var
        "Inventory at STR": Decimal;
        "--B2B--"@: Integer;
        PurchaseInvLine: Record "Purch. Inv. Line";
        TotVendorAmt: Decimal;
        TotQty: Decimal;
        ItemCostUpdation: Codeunit "Item Cost Updation";
        atta: Boolean;
        attachments: Record Attachments;
        ItemLedgEntry: Record "Item Ledger Entry";
        QualityItemLedgEntry: Record "Quality Item Ledger Entry";
        StockAtMCH: Decimal;
        "Alternate Item": Record "Alternate Items";
        pcb1: Record PCB;
        visible1: Boolean;
        item: Record Item;
        Item_Total_Stock: Decimal;
        Ver_Date: DateTime;
        chglog: Record "Change Log Entry";
        SMTP_MAIL: Codeunit "SMTP Mail";
        Itm_verification_confirm: Boolean;
        mch_tag_editable: Boolean;
        ProdOrders: Record "Production Order";
}