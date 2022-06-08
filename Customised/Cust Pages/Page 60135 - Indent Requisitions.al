page 60135 "Indent Requisitions"
{
    // version POAU,PO1.0,Rev1

    DelayedInsert = true;
    PageType = List;
    SaveValues = true;
    SourceTable = "Create Indents";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("Item No."; "Item No.")
                {
                    Style = None;
                    StyleExpr = "No.Format";
                }
                field(Type; Type)
                {
                    Editable = false;
                }
                field(Description; Description)
                {
                    Style = None;
                    StyleExpr = "No.Format";
                }
                field("Indent No."; "Indent No.")
                {

                    trigger OnDrillDown();
                    begin
                        PAGE.RUN(PAGE::Indent, IndentHeader);
                    end;
                }
                field("Last Modified date"; "Last Modified date")
                {
                }
                field(Remarks; Remarks)
                {
                }
                field(Quantity; Quantity)
                {
                }
                field("Unit of Measure"; "Unit of Measure")
                {
                }
                field("Suitable Vendor"; "Suitable Vendor")
                {
                }
                field("Part Number"; "Part Number")
                {
                }
                field("Unit Cost"; "Unit Cost")
                {
                }
                field("ICN No."; "ICN No.")
                {
                    Editable = true;
                }
                field("Suitable Vendor Name"; "Suitable Vendor Name")
                {
                }
                field("Project Description"; "Project Description")
                {
                }
                field("Production Order Description"; "Production Order Description")
                {
                }
                field("Production Start date"; "Production Start date")
                {
                }
                field("Manufacturer Code"; "Manufacturer Code")
                {
                }
                field("Accept Action Message"; "Accept Action Message")
                {
                }
                field("Due Date"; "Due Date")
                {
                }
                field("Location Code"; "Location Code")
                {
                }
                field(Department; Department)
                {
                }
                field("Release Status"; "Release Status")
                {
                }
                field(Make; Make)
                {
                }
                field("Purchase Remarks"; "Purchase Remarks")
                {
                }
                field("Purchase Orders"; "Purchase Orders")
                {
                    Caption = 'Purchase Orders';

                    trigger OnLookup(Text: Text): Boolean;
                    begin
                        IF "Item No." <> '' THEN BEGIN
                            PurchaseLine.RESET;
                            PurchaseLine.SETFILTER(PurchaseLine."No.", "Item No.");
                            PAGE.RUNMODAL(PAGE::"Purchase Orders", PurchaseLine);
                        END;
                    end;
                }
                field("Stock At Stores"; "Stock At Stores")
                {
                }
                field("Stock At CS Stores"; "Stock At CS Stores")
                {
                }
                field("Stock At RD Stores"; "Stock At RD Stores")
                {
                }
                field("Stock At MCH Stores"; "Stock At MCH Stores")
                {
                }
            }
            group(Control1102152018)
            {
                Editable = false;
                ShowCaption = false;
                grid(Control1102152017)
                {
                    ShowCaption = false;
                    group(Control1102152016)
                    {
                        ShowCaption = false;
                        field("Rec.COUNT"; Rec.COUNT)
                        {
                            Editable = false;
                        }
                    }
                    group(Control1102152013)
                    {
                        ShowCaption = false;
                        field(Color_Inwd_Rej; Color_Inwd_Rej)
                        {
                            Editable = false;
                            Style = StrongAccent;
                            StyleExpr = TRUE;
                        }
                    }
                    group(Control1102152027)
                    {
                        ShowCaption = false;
                        field(Color_CS_Stock; Color_CS_Stock)
                        {
                            Style = Favorable;
                            StyleExpr = TRUE;
                        }
                    }
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Requisitions")
            {
                Caption = '&Requisitions';
                action("Get Requisition Lines")
                {
                    Caption = 'Get Requisition Lines';
                    Image = GetLines;

                    trigger OnAction();
                    begin
                        POAutomation.GetIndentLines;
                    end;
                }
                separator(Action1102152025)
                {
                }
                action("Create Enquiry")
                {
                    Caption = 'Create Enquiry';
                    Image = CreateDocument;
                    Visible = false;

                    trigger OnAction();
                    var
                        Text000: Label 'Enquiries created successfully.';
                    begin
                        POAutomation.CreateEnquiries;
                    end;
                }
                separator(Action1102152022)
                {
                }
                action("Create Quote")
                {
                    Caption = 'Create Quote';
                    Image = Quote;
                    Visible = false;

                    trigger OnAction();
                    var
                        Text001: Label 'Quotes are created successfully.';
                    begin
                        POAutomation.CreateQuotes;
                        //MESSAGE(Text001);
                    end;
                }
                action("Create Orders")
                {
                    Caption = 'Create Orders';
                    Image = "Order";

                    trigger OnAction();
                    begin
                        CreateOrders;
                    end;
                }
                action("Create Vendor Wise Orders")
                {
                    Caption = 'Create Vendor Wise Orders';
                    Image = VendorBill;

                    trigger OnAction();
                    var
                        MinDate: Integer;
                        MaxDate: Integer;
                        Temp: Integer;
                        testvar: Integer;
                        Itm: Record Item;
                        CountVar: Boolean;
                        TINVendors: Text;
                        Count1: Boolean;
                        Purch_Lines: Record "Purchase Line";
                        CreateIndentsRec: Record "Create Indents";
                        CopyCreateIndentsRec2: Record "Create Indents";
                    begin
                        // Added by Pranavi on 09-Jan-2016 for checking currency exchrate updated for today if foreign vendor exists prior the creation of POs
                        "Previous Vendor" := '';

                        CurrPage.SETSELECTIONFILTER(CopyCreateIndentsRec2);
                        CopyCreateIndentsRec2.SETCURRENTKEY("Suitable Vendor", "Item No.");
                        //SETFILTER("Suitable Vendor",'<>'' ''');
                        CopyCreateIndentsRec2.SETFILTER("Suitable Vendor", '<>%1', '');
                        CreateIndentsRec.COPY(CopyCreateIndentsRec2);
                        WITH CreateIndentsRec DO BEGIN
                            IF FINDSET THEN
                                REPEAT
                                    IRH.RESET;
                                    IRH.SETCURRENTKEY(Flag, "Item No.", "Vendor No.");
                                    IRH.SETFILTER(IRH.Flag, '%1', TRUE);
                                    IRH.SETFILTER(IRH."Item No.", "Item No.");
                                    IRH.SETFILTER(IRH.Status, '%1', TRUE);
                                    // IRH.SETRANGE(IRH."Vendor No.","Suitable Vendor"); // Added by Vishnu Priya on 30-06-2020 for avoiding the Orders placing of flaged items to concenred vendor.
                                    IF NOT IRH.FINDFIRST THEN BEGIN
                                        IF "Previous Vendor" <> "Suitable Vendor" THEN BEGIN
                                            "Previous Vendor" := "Suitable Vendor";
                                            "No. Of Order" += 1;
                                            Vendor.RESET;
                                            IF Vendor.GET("Suitable Vendor") THEN BEGIN
                                                IF Vendor."Vendor Posting Group" = 'FOREIGN' THEN BEGIN
                                                    Structure := Vendor."Tax Area Code";
                                                    CurrExchRate.RESET;
                                                    CurrExchRate.SETRANGE(CurrExchRate."Currency Code", Vendor."Currency Code");
                                                    IF CurrExchRate.FINDLAST THEN BEGIN
                                                        IF CurrExchRate."Starting Date" < TODAY THEN BEGIN
                                                            ERROR(' THERE IS NO CURRENCY EXCHANGE RATE FOR TODAY FOR CURRENCY: ' + CurrExchRate."Currency Code");
                                                        END;
                                                    END;
                                                END ELSE BEGIN
                                                    IF (Vendor."T.I.N. No." = '') AND (Vendor."T.I.N Status" IN [Vendor."T.I.N Status"::" ", Vendor."T.I.N Status"::TINAPPLIED]) THEN
                                                        TINVendors := TINVendors + Vendor.Name + ', ';
                                                END;
                                            END;
                                        END;
                                    END;
                                UNTIL NEXT = 0;
                        END;
                        IF TINVendors <> '' THEN
                            ERROR('Please enter T.I.N Number in Vendor Card for :' + COPYSTR(TINVendors, 1, STRLEN(TINVendors) - 2) +
                                  'in Tax Information Tab!\IF TIN Not Applicable update TIN Status to TIN Invalid!');
                        // End by Pranavi on 09-Jan-2016
                        "Previous Vendor" := '';

                        WITH CopyCreateIndentsRec2 DO BEGIN
                            SETCURRENTKEY("Suitable Vendor", "Item No.");
                            SETFILTER("Suitable Vendor", '<>'' ''');
                            MinDate := 0;
                            MaxDate := 0;
                            CountVar := FALSE;
                            Count1 := FALSE;
                            IF FINDSET THEN
                                REPEAT
                                    IRH.RESET;
                                    IRH.SETCURRENTKEY(Flag, "Item No.", "Vendor No.");
                                    IRH.SETFILTER(IRH.Flag, '%1', TRUE);
                                    IRH.SETFILTER(IRH."Item No.", "Item No.");
                                    IRH.SETFILTER(IRH.Status, '%1', TRUE);
                                    // IRH.SETRANGE(IRH."Vendor No.","Suitable Vendor"); // Added by Vishnu Priya on 30-06-2020 for avoiding the Orders placing of flaged items to concenred vendor.
                                    IF NOT IRH.FINDFIRST THEN BEGIN

                                        IF "Previous Vendor" <> "Suitable Vendor" THEN BEGIN
                                            "Previous Vendor" := "Suitable Vendor";

                                            IF CountVar = TRUE THEN BEGIN
                                                PurchaseHeader."Requested Receipt Date" := TODAY + (MinDate - 3);
                                                PurchaseHeader."Expected Receipt Date" := TODAY + MaxDate;
                                                PurchaseHeader.MODIFY;
                                                // Start--Added by Pranavi on 11-Feb-2017 for correcting Dev & Exp Recp Dates Calc
                                                Purch_Lines.RESET;
                                                Purch_Lines.SETRANGE(Purch_Lines."Document Type", Purch_Lines."Document Type"::Order);
                                                Purch_Lines.SETRANGE(Purch_Lines."Document No.", PurchaseHeader."No.");
                                                Purch_Lines.SETFILTER(Purch_Lines."No.", '<>%1', '');
                                                Purch_Lines.SETFILTER(Purch_Lines.Quantity, '>%1', 0);
                                                IF Purch_Lines.FINDSET THEN
                                                    REPEAT
                                                        Purch_Lines."Requested Receipt Date" := PurchaseHeader."Requested Receipt Date";
                                                        Purch_Lines.MODIFY;
                                                    UNTIL Purch_Lines.NEXT = 0;
                                                // End--Added by Pranavi on 11-Feb-2017 for correcting Dev & Exp Recp Dates Calc
                                                MinDate := 0;
                                                MaxDate := 0;
                                            END;
                                            Itm.RESET;
                                            Itm.SETFILTER(Itm."No.", "Item No.");
                                            IF Itm.FINDFIRST THEN BEGIN
                                                IF STRLEN(FORMAT(Itm."Safety Lead Time")) > 0 THEN BEGIN
                                                    EVALUATE(Temp, COPYSTR(FORMAT(Itm."Safety Lead Time"), 1, STRLEN(FORMAT(Itm."Safety Lead Time")) - 1));
                                                    MinDate := Temp;
                                                    MaxDate := Temp;
                                                    Count1 := FALSE;
                                                END
                                                ELSE
                                                    Count1 := TRUE;
                                            END
                                            ELSE
                                                Count1 := TRUE;

                                            CountVar := TRUE;

                                            "No. Of Order" += 1;
                                            Vendor.RESET;
                                            IF Vendor.GET("Suitable Vendor") THEN BEGIN
                                                Structure := Vendor.Structure;
                                                IF Vendor."Vendor Posting Group" = 'FOREIGN' THEN BEGIN
                                                    IF Vendor."Tax Area Code" = 'FOREIGN' THEN
                                                        Structure := 'FORIEGN';
                                                    CurrExchRate.RESET;
                                                    CurrExchRate.SETRANGE(CurrExchRate."Currency Code", Vendor."Currency Code");
                                                    IF CurrExchRate.FINDLAST THEN BEGIN
                                                        IF CurrExchRate."Starting Date" < TODAY THEN
                                                            ERROR(' THERE IS NO CURRENCY EXCHANGE RATE FOR TODAY');
                                                    END;
                                                END;
                                            END;

                                            PurchaseHeader.INIT;
                                            PurchaseHeader."Document Type" := PurchaseHeader."Document Type"::Order;
                                            PPSetup.GET;
                                            PurchaseHeader."No." := NoSeriesMgt.GetNextNo(PPSetup."Order Nos.", WORKDATE, TRUE);
                                            MESSAGE('purchase order no %1', PurchaseHeader."No.");
                                            PurchaseHeader."Order Date" := TODAY;
                                            PurchaseHeader."Posting Date" := TODAY;
                                            PurchaseHeader."Buy-from Vendor No." := "Suitable Vendor";
                                            PurchaseHeader.VALIDATE(PurchaseHeader."Buy-from Vendor No.");
                                            PurchaseHeader."Location Code" := "Location Code";
                                            PurchaseHeader.VALIDATE("Location Code");
                                            PurchaseHeader."ICN No." := "ICN No.";
                                            PurchaseHeader."Packing Type" := 'STANDARD PACKING';
                                            IF "Location Code" IN ['STR', 'PROD'] THEN
                                                PurchaseHeader."Shortcut Dimension 1 Code" := 'PRD-0010'
                                            ELSE
                                                IF "Location Code" = 'CS STR' THEN
                                                    PurchaseHeader."Shortcut Dimension 1 Code" := 'CUS-005'
                                                ELSE
                                                    IF "Location Code" = 'R&D STR' THEN
                                                        PurchaseHeader."Shortcut Dimension 1 Code" := 'RD-000';

                                            PurchaseHeader.Structure := 'PURCH_GST';
                                            PurchaseHeader.INSERT;

                                            PurchaseLine.INIT;
                                            PurchaseLine."Document Type" := PurchaseLine."Document Type"::Order;
                                            PurchaseLine."Document No." := PurchaseHeader."No.";
                                            PurchaseLine."Line No." := PurchaseLine."Line No." + 10000;
                                            PurchaseLine."Buy-from Vendor No." := PurchaseHeader."Buy-from Vendor No.";
                                            // added by vishnu Priya on 09-11-2020 for the indents to G/L Accounts.
                                            IF Rec.Type = Rec.Type::"G/L Account" THEN
                                                PurchaseLine.Type := PurchaseLine.Type::"G/L Account"
                                            ELSE
                                                IF Rec.Type = Rec.Type::Item THEN
                                                    PurchaseLine.Type := PurchaseLine.Type::Item
                                                ELSE
                                                    IF Rec.Type = Rec.Type::"Fixed Asset" THEN
                                                        PurchaseLine.Type := PurchaseLine.Type::"Fixed Asset";


                                            //PurchaseLine.Type := (Rec.Type); // added by vishnu Priya on 09-11-2020 for the indents to G/L Accounts.
                                            //PurchaseLine.Type := PurchaseLine.Type :: Item; commented by Vishnu Priya on 09-11-2020 for the indents to G/L Accounts.
                                            PurchaseLine."Direct Unit Cost" := ROUND("Unit Cost", 0.001);
                                            PurchaseLine."No." := "Item No.";
                                            PurchaseLine.VALIDATE(PurchaseLine."No.");
                                            PurchaseLine.Description := Description;

                                            Order_Qty := Quantity;//Added by sundar to reset the order quantity.this effects when MOQ,EFF_MOQ,SPQ not defined in item card.
                                            IF ITEM.GET("Item No.") THEN BEGIN
                                                IF ITEM.EFF_MOQ > 0 THEN
                                                    MOQ_Temp := ITEM.EFF_MOQ
                                                ELSE
                                                    MOQ_Temp := ITEM."Minimum Order Quantity";

                                                IF (MOQ_Temp > 0) AND (ITEM."Standard Packing Quantity" = 0) THEN BEGIN
                                                    IF MOQ_Temp > 1 THEN BEGIN
                                                        IF Quantity < MOQ_Temp THEN
                                                            Order_Qty := MOQ_Temp
                                                        ELSE
                                                            Order_Qty := Quantity;
                                                    END ELSE BEGIN
                                                        Order_Qty := Quantity;
                                                    END;
                                                END ELSE
                                                    IF (MOQ_Temp > 0) AND (ITEM."Standard Packing Quantity" <= MOQ_Temp) THEN BEGIN
                                                        IF MOQ_Temp > 1 THEN BEGIN
                                                            IF Quantity < MOQ_Temp THEN
                                                                Order_Qty := MOQ_Temp
                                                            ELSE BEGIN
                                                                IF MOQ_Temp = 1 THEN
                                                                    Order_Qty := (Quantity DIV ITEM."Standard Packing Quantity") * ITEM."Standard Packing Quantity"
                                                                ELSE
                                                                    Order_Qty := ((Quantity DIV ITEM."Standard Packing Quantity") + 1) * ITEM."Standard Packing Quantity"
                                                            END;
                                                        END ELSE
                                                            Order_Qty := Quantity;
                                                    END ELSE
                                                        IF (MOQ_Temp > 0) AND (ITEM."Standard Packing Quantity" > MOQ_Temp) THEN BEGIN
                                                            IF MOQ_Temp > 1 THEN BEGIN
                                                                IF Quantity < MOQ_Temp THEN
                                                                    Order_Qty := MOQ_Temp
                                                                ELSE
                                                                    Order_Qty := ((Quantity DIV MOQ_Temp) + 1) * MOQ_Temp
                                                            END ELSE
                                                                Order_Qty := Quantity;

                                                        END ELSE
                                                            IF (MOQ_Temp = 0) AND (ITEM."Standard Packing Quantity" > 0) THEN BEGIN
                                                                IF Quantity < ITEM."Standard Packing Quantity" THEN
                                                                    Order_Qty := ITEM."Standard Packing Quantity"
                                                                ELSE
                                                                    Order_Qty := ((Quantity DIV ITEM."Standard Packing Quantity") + 1) * ITEM."Standard Packing Quantity"
                                                            END;
                                            END;

                                            PurchaseLine.Quantity := Order_Qty;
                                            PurchaseLine.VALIDATE(PurchaseLine.Quantity);
                                            PurchaseLine."Indent No." := "Indent No.";
                                            PurchaseLine."Indent Line No." := "Indent Line No.";
                                            PurchaseLine."ICN No." := "ICN No."; //ReachSSR
                                                                                 //NSS1.0 >> BEGIN
                                                                                 //NSS1.0 << END
                                            PurchaseLine."Location Code" := "Location Code";
                                            PurchaseLine.VALIDATE("Location Code");
                                            PurchaseLine."Direct Unit Cost" := ROUND("Unit Cost", 0.001);
                                            PurchaseLine.VALIDATE(PurchaseLine.Quantity);
                                            itemrec.RESET;
                                            IF itemrec.GET("Item No.") THEN
                                                PurchaseLine."Part Number" := itemrec."Part Number";
                                            //PurchaseLine."Part Number" := "Part Number"; // added by vishnu on 13-11-2020

                                            IF COPYSTR("ICN No.", STRLEN("ICN No.") - 2, STRLEN("ICN No.")) = 'NC' THEN BEGIN
                                                SHORTAGE_DET.SETCURRENTKEY(SHORTAGE_DET."Item No", SHORTAGE_DET."Material Required Date");
                                                SHORTAGE_DET.SETRANGE(SHORTAGE_DET."Item No", "Item No.");
                                                IF SHORTAGE_DET.FINDFIRST THEN BEGIN
                                                    PurchaseLine."Expected Receipt Date" := SHORTAGE_DET."Material Required Date";
                                                    PurchaseLine."Deviated Receipt Date" := SHORTAGE_DET."Material Required Date";
                                                END;
                                            END ELSE BEGIN
                                                IF ITEM.GET("Item No.") THEN BEGIN
                                                    BUFFER := '+' + FORMAT(ITEM."Safety Lead Time");
                                                    PurchaseLine."Expected Receipt Date" := CALCDATE(BUFFER, TODAY);
                                                    PurchaseLine."Deviated Receipt Date" := CALCDATE(BUFFER, TODAY);
                                                END;
                                            END;
                                            //>>Added by Pranavi on 07-Mar-2017 For updating Vendor Mat. Disp Date
                                            IF PurchaseLine."Deviated Receipt Date" <> 0D THEN BEGIN
                                                IF Vendor.GET(PurchaseLine."Buy-from Vendor No.") THEN BEGIN
                                                    PurchaseLine."Vendor Mat. Dispatch Date" := CALCDATE('-' + FORMAT(Vendor."Transportation Days") + 'D', PurchaseLine."Deviated Receipt Date");
                                                END ELSE
                                                    PurchaseLine."Vendor Mat. Dispatch Date" := PurchaseLine."Deviated Receipt Date";
                                            END;
                                            //<<Added by Pranavi on 07-Mar-2017 For updating Vendor Mat. Disp Date

                                            PurchaseLine.INSERT;

                                            PurchaseHeader.VALIDATE(PurchaseHeader.Structure);

                                            IndentLine.RESET;
                                            IndentLine.SETFILTER(IndentLine."No.", "Item No.");
                                            IndentLine.SETFILTER(IndentLine."ICN No.", "ICN No.");
                                            IndentLine.SETFILTER(IndentLine.Description, Description); //ADDED AFTER GL AND FIXED ASSETS ADDITION
                                            IndentLine.SETFILTER(IndentLine."Delivery Location", "Location Code");
                                            IF IndentLine.FINDSET THEN //findfirst to findset changed
                                                REPEAT
                                                    IndentLine."Indent Status" := IndentLine."Indent Status"::Order;
                                                    IndentLine.MODIFY;
                                                UNTIL IndentLine.NEXT = 0;
                                            PurchaseLine."Direct Unit Cost" := ROUND("Unit Cost", 0.001);
                                            PurchaseLine.VALIDATE(PurchaseLine.Quantity);
                                            PurchaseLine.MODIFY;
                                            PurchaseHeader.VALIDATE(PurchaseHeader.Structure);//
                                        END ELSE BEGIN
                                            Itm.RESET;
                                            Itm.SETFILTER(Itm."No.", "Item No.");
                                            IF Itm.FINDFIRST THEN BEGIN
                                                IF Count1 THEN BEGIN
                                                    IF STRLEN(FORMAT(Itm."Safety Lead Time")) > 0 THEN BEGIN
                                                        EVALUATE(Temp, COPYSTR(FORMAT(Itm."Safety Lead Time"), 1, STRLEN(FORMAT(Itm."Safety Lead Time")) - 1));
                                                        MinDate := Temp;
                                                        MaxDate := Temp;
                                                        Count1 := FALSE;
                                                    END;
                                                END
                                                ELSE BEGIN
                                                    IF STRLEN(FORMAT(Itm."Safety Lead Time")) > 0 THEN BEGIN
                                                        EVALUATE(Temp, COPYSTR(FORMAT(Itm."Safety Lead Time"), 1, STRLEN(FORMAT(Itm."Safety Lead Time")) - 1));
                                                        IF MinDate > Temp THEN
                                                            MinDate := Temp;
                                                        IF MaxDate < Temp THEN
                                                            MaxDate := Temp;
                                                    END;
                                                END;
                                            END;
                                            PurchaseLine.INIT;
                                            PurchaseLine."Document Type" := PurchaseLine."Document Type"::Order;
                                            PurchaseLine."Document No." := PurchaseHeader."No.";
                                            PurchaseLine."Line No." := PurchaseLine."Line No." + 10000;
                                            PurchaseLine."Buy-from Vendor No." := PurchaseHeader."Buy-from Vendor No.";
                                            // added by vishnu priya on 09-11-2020
                                            IF Rec.Type = Rec.Type::Item THEN
                                                PurchaseLine.Type := PurchaseLine.Type::Item
                                            ELSE
                                                IF Rec.Type = Rec.Type::"G/L Account" THEN
                                                    PurchaseLine.Type := PurchaseLine.Type::"G/L Account"
                                                ELSE
                                                    IF Rec.Type = Rec.Type::"Fixed Asset" THEN
                                                        PurchaseLine.Type := PurchaseLine.Type::"Fixed Asset";
                                            // added by vishnu priya on 09-11-2020
                                            //PurchaseLine.Type := Rec.Type; // Added by Vishnu Priya on 09-11-2020
                                            //PurchaseLine.Type := PurchaseLine.Type :: Item; // Commented by Vishnu Priya on 09-11-2020 for indents to G/L Accounts
                                            PurchaseLine."Direct Unit Cost" := ROUND("Unit Cost", 0.001);
                                            PurchaseLine."No." := "Item No.";
                                            PurchaseLine.VALIDATE(PurchaseLine."No.");
                                            PurchaseLine.Description := Description;
                                            Order_Qty := Quantity;//Added by sundar to reset the order quantity.this effects when MOQ,EFF_MOQ,SPQ not defined in item card.
                                            IF ITEM.GET("Item No.") THEN BEGIN
                                                IF ITEM.EFF_MOQ > 0 THEN
                                                    MOQ_Temp := ITEM.EFF_MOQ
                                                ELSE
                                                    MOQ_Temp := ITEM."Minimum Order Quantity";

                                                IF (MOQ_Temp > 0) AND (ITEM."Standard Packing Quantity" = 0) THEN BEGIN
                                                    IF MOQ_Temp > 1 THEN BEGIN
                                                        IF Quantity < MOQ_Temp THEN
                                                            Order_Qty := MOQ_Temp
                                                        ELSE
                                                            Order_Qty := Quantity;
                                                    END ELSE BEGIN
                                                        Order_Qty := Quantity;
                                                    END;
                                                END ELSE
                                                    IF (MOQ_Temp > 0) AND (ITEM."Standard Packing Quantity" <= MOQ_Temp) THEN BEGIN
                                                        IF MOQ_Temp > 1 THEN BEGIN
                                                            IF Quantity < MOQ_Temp THEN
                                                                Order_Qty := MOQ_Temp
                                                            ELSE BEGIN
                                                                IF MOQ_Temp = 1 THEN
                                                                    Order_Qty := (Quantity DIV ITEM."Standard Packing Quantity") * ITEM."Standard Packing Quantity"
                                                                ELSE
                                                                    Order_Qty := ((Quantity DIV ITEM."Standard Packing Quantity") + 1) * ITEM."Standard Packing Quantity"
                                                            END;
                                                        END ELSE
                                                            Order_Qty := Quantity;
                                                    END ELSE
                                                        IF (MOQ_Temp > 0) AND (ITEM."Standard Packing Quantity" > MOQ_Temp) THEN BEGIN
                                                            IF MOQ_Temp > 1 THEN BEGIN
                                                                IF Quantity < MOQ_Temp THEN
                                                                    Order_Qty := MOQ_Temp
                                                                ELSE
                                                                    Order_Qty := ((Quantity DIV MOQ_Temp) + 1) * MOQ_Temp
                                                            END ELSE
                                                                Order_Qty := Quantity;

                                                        END ELSE
                                                            IF (MOQ_Temp = 0) AND (ITEM."Standard Packing Quantity" > 0) THEN BEGIN
                                                                IF Quantity < ITEM."Standard Packing Quantity" THEN
                                                                    Order_Qty := ITEM."Standard Packing Quantity"
                                                                ELSE
                                                                    Order_Qty := ((Quantity DIV ITEM."Standard Packing Quantity") + 1) * ITEM."Standard Packing Quantity"
                                                            END;
                                            END;


                                            PurchaseLine.Quantity := Order_Qty;
                                            PurchaseLine.VALIDATE(PurchaseLine.Quantity);
                                            PurchaseLine."Indent No." := "Indent No.";
                                            PurchaseLine."Indent Line No." := "Indent Line No.";


                                            PurchaseLine."ICN No." := "ICN No."; //ReachSSR
                                                                                 //NSS1.0 >> BEGIN
                                                                                 //NSS1.0 << END
                                            PurchaseLine."Location Code" := "Location Code";
                                            PurchaseLine.VALIDATE("Location Code");
                                            PurchaseLine."Direct Unit Cost" := ROUND("Unit Cost", 0.001);
                                            PurchaseLine.VALIDATE(PurchaseLine.Quantity);
                                            itemrec.RESET;
                                            IF itemrec.GET("Item No.") THEN
                                                PurchaseLine."Part Number" := itemrec."Part Number";


                                            IF COPYSTR("ICN No.", STRLEN("ICN No.") - 2, STRLEN("ICN No.")) = 'NC' THEN BEGIN
                                                SHORTAGE_DET.SETCURRENTKEY(SHORTAGE_DET."Item No", SHORTAGE_DET."Material Required Date");
                                                SHORTAGE_DET.SETRANGE(SHORTAGE_DET."Item No", "Item No.");
                                                IF SHORTAGE_DET.FINDFIRST THEN BEGIN
                                                    PurchaseLine."Expected Receipt Date" := SHORTAGE_DET."Material Required Date";
                                                    PurchaseLine."Deviated Receipt Date" := SHORTAGE_DET."Material Required Date";
                                                END;
                                            END ELSE BEGIN
                                                IF ITEM.GET("Item No.") THEN BEGIN
                                                    BUFFER := '+' + FORMAT(ITEM."Safety Lead Time");
                                                    PurchaseLine."Expected Receipt Date" := CALCDATE(BUFFER, TODAY);
                                                    PurchaseLine."Deviated Receipt Date" := CALCDATE(BUFFER, TODAY);
                                                END;
                                            END;
                                            //>>Added by Pranavi on 07-Mar-2017 For updating Vendor Mat. Disp Date
                                            IF PurchaseLine."Deviated Receipt Date" <> 0D THEN BEGIN
                                                IF Vendor.GET(PurchaseLine."Buy-from Vendor No.") THEN BEGIN
                                                    PurchaseLine."Vendor Mat. Dispatch Date" := CALCDATE('-' + FORMAT(Vendor."Transportation Days") + 'D', PurchaseLine."Deviated Receipt Date");
                                                END ELSE
                                                    PurchaseLine."Vendor Mat. Dispatch Date" := PurchaseLine."Deviated Receipt Date";
                                            END;
                                            //<<Added by Pranavi on 07-Mar-2017 For updating Vendor Mat. Disp Date


                                            PurchaseLine.INSERT;

                                            PurchaseHeader.VALIDATE(PurchaseHeader.Structure);//

                                            IndentLine.RESET;
                                            IndentLine.SETFILTER(IndentLine."No.", "Item No.");
                                            IndentLine.SETFILTER(IndentLine.Description, Description); // ADDED AFTER G/L AND FIXED ASSETS ADDITION
                                            IndentLine.SETFILTER(IndentLine."ICN No.", "ICN No.");
                                            IndentLine.SETFILTER(IndentLine."Delivery Location", "Location Code");
                                            IF IndentLine.FINDSET THEN  // FROM FINDFIRST TO FINDSET CONVERTED.
                                                REPEAT
                                                    IndentLine."Indent Status" := IndentLine."Indent Status"::Order;
                                                    IndentLine.MODIFY;
                                                UNTIL IndentLine.NEXT = 0;
                                            PurchaseLine."Direct Unit Cost" := ROUND("Unit Cost", 0.001);
                                            PurchaseLine.VALIDATE(PurchaseLine.Quantity);
                                            PurchaseLine.MODIFY;
                                            PurchaseHeader.VALIDATE(PurchaseHeader.Structure);//
                                        END;
                                    END;
                                UNTIL NEXT = 0;
                            IF CountVar = TRUE THEN BEGIN
                                PurchaseHeader."Requested Receipt Date" := TODAY + (MinDate - 3);
                                PurchaseHeader."Expected Receipt Date" := TODAY + MaxDate;
                                PurchaseHeader.VALIDATE(PurchaseHeader.Structure);//
                                PurchaseHeader.MODIFY;
                                // Start--Added by Pranavi on 11-Feb-2017 for correcting Dev & Exp Recp Dates Calc
                                Purch_Lines.RESET;
                                Purch_Lines.SETRANGE(Purch_Lines."Document Type", Purch_Lines."Document Type"::Order);
                                Purch_Lines.SETRANGE(Purch_Lines."Document No.", PurchaseHeader."No.");
                                Purch_Lines.SETFILTER(Purch_Lines."No.", '<>%1', '');
                                Purch_Lines.SETFILTER(Purch_Lines.Quantity, '>%1', 0);
                                IF Purch_Lines.FINDSET THEN
                                    REPEAT
                                        Purch_Lines."Requested Receipt Date" := PurchaseHeader."Requested Receipt Date";
                                        Purch_Lines."Expected Receipt Date" := PurchaseHeader."Expected Receipt Date"; // added by vijaya on 28-Apr-17
                                        Purch_Lines."Deviated Receipt Date" := PurchaseHeader."Expected Receipt Date";
                                        Purch_Lines.MODIFY;
                                    UNTIL Purch_Lines.NEXT = 0;
                                // End--Added by Pranavi on 11-Feb-2017 for correcting Dev & Exp Recp Dates Calc
                            END;
                        END;
                    end;
                }
                action(Temp)
                {
                    Caption = 'Temp';
                    Image = Template;

                    trigger OnAction();
                    begin
                        SETFILTER("Last Modified date", '<%1', 082309D);
                        IF FINDSET THEN
                            REPEAT
                                IndentLine.RESET;
                                IndentLine.SETRANGE(IndentLine."Document No.", "Indent No.");
                                //IndentLine.SETRANGE(IndentLine."No.","Item No.");
                                IndentLine.SETRANGE(IndentLine."Line No.", "Indent Line No.");
                                //  IndentLine.SETRANGE(IndentLine.Description,Description);
                                IF IndentLine.FINDFIRST THEN BEGIN
                                    IndentLine."Indent Status" := IndentLine."Indent Status"::Order;
                                    IndentLine.MODIFY;

                                END;
                            UNTIL NEXT = 0;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        //Color_Inwd_Rej_Bool:=FALSE; commentd by vijaya on 02-Mar-17
        IndentHeader.RESET;
        IF IndentHeader.Description = 'Created From QC Inward Item Rejection' THEN BEGIN
            "No.Format" := 'StrongAccent';
        END
        ELSE
            IF IndentHeader.Description = 'Created for CS Minimum Stock' THEN BEGIN
                "No.Format" := 'Favorable';
            END
            ELSE
                "No.Format" := 'None';
        IndentHeader.SETRANGE(IndentHeader."No.", "Indent No.");
        IF IndentHeader.FINDFIRST THEN BEGIN
        END;
        IndentLine.RESET;
        IndentLine.SETFILTER(IndentLine."Document No.", "Indent No.");
        IndentLine.SETRANGE(IndentLine."Line No.", "Indent Line No.");
        IF IndentLine.FINDFIRST THEN BEGIN
            Make := IndentLine.Make;
            "Purchase Remarks" := IndentLine."Purchase Remarks";
        END;
        IF "Item No." <> '' THEN BEGIN
            "Purchase Orders" := 0;
            PurchaseLine.RESET;
            PurchaseLine.SETFILTER(PurchaseLine."No.", "Item No.");
            IF PurchaseLine.FINDSET THEN BEGIN
                "Purchase Orders" := PurchaseLine.COUNT;
            END;
        END;
    end;

    var
        POAutomation: Codeunit "PO Automation";
        ItemVendor: Record "Item Vendor";
        CreateIndents: Record "Create Indents";
        Vendor: Record Vendor;
        "Previous Vendor": Code[20];
        "No. Of Order": Integer;
        PPSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        IndentLine: Record "Indent Line";
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        ITEM: Record Item;
        BUFFER: Text[30];
        SHORTAGE_DET: Record "Item Lot Numbers";
        CurrExchRate: Record "Currency Exchange Rate";
        Order_Qty: Decimal;
        MOQ_Temp: Decimal;
        Structure: Code[10];
        VendorList: Page "Vendor List";
        "Purchase Orders": Integer;
        IRH: Record "Inspection Receipt Header";
        Color_Inwd_Rej: Label 'Created From QC Inward Rejection';
        Color_Inwd_Rej_Bool: Boolean;
        IndentHeader: Record "Indent Header";
        "No.Format": Text;
        Color_CS_Stock: Label 'Created for CS Minimum Stock';
        TypeNumber: Integer;
        itemrec: Record Item;

    (11871)]
    procedure CreateOrders();
    begin
        /*
        CreateIndents.SETRANGE(CreateIndents."Accept Action Message",TRUE);
        IF NOT CreateIndents.FINDFIRST THEN
          EXIT;
        IF NOT CONFIRM('Do You want to create orders ?') THEN
        EXIT;
        MARKEDONLY(TRUE);
        CLEAR(VendorList);
        VendorList.LOOKUPMODE(TRUE);
        VendorList.RUNMODAL;
        VendorList.SetSelection(Vendor);
        Vendor.MARKEDONLY(TRUE);
        IF Vendor.COUNT>=1 THEN BEGIN
          POAutomation.CreateOrder(Vendor,CreateIndents);
          MESSAGE('Orders Created Successfully');
        END ELSE
        EXIT;
        */
        CreateIndents.RESET;
        CreateIndents.SETRANGE(CreateIndents."Accept Action Message", TRUE);
        IF NOT CreateIndents.FINDFIRST THEN
            EXIT;
        IF NOT CONFIRM('Do You want to create orders ?') THEN
            EXIT;
        CLEAR(VendorList);
        VendorList.LOOKUPMODE(TRUE);
        VendorList.RUNMODAL;
        VendorList.SetSelection(Vendor);
        //Vendor.MARKEDONLY(TRUE);
        IF Vendor.COUNT >= 1 THEN BEGIN
            //MESSAGE('%1 %2',CreateIndents.COUNTAPPROX,Rec.COUNT);
            POAutomation.CreateOrder(Vendor, CreateIndents);
            MESSAGE('Orders Created Successfully');
        END ELSE
            EXIT;

    end;
}

