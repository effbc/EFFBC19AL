page 50014 "Bought Out Items Planning"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Worksheet;
    SourceTable = "Sales Bought Out Material List";

    layout
    {
        area(content)
        {
            field(SHowBattNChargr; SHowBattNChargr)
            {
                Caption = 'Show Batteries & Chargers';
                StyleExpr = TRUE;

                trigger OnValidate();
                begin
                    // Added by Pranavi on 24-Dec-2016 for show/not showing selection of batteries & chargers
                    IF SHowBattNChargr THEN BEGIN
                        RESET;
                        CurrPage.UPDATE;
                    END ELSE BEGIN
                        RESET;
                        SETFILTER(No, '<>%1&<>%2', 'ECBOUBT00004', 'BOICHAR00014');
                        CurrPage.UPDATE;
                    END;
                    // End by Pranavi
                end;
            }
            repeater(Group)
            {
                field("Document No"; "Document No")
                {
                    Editable = false;
                    Style = StrongAccent;
                    StyleExpr = ScheduleItemsColor;
                }
                field("Sell To Customer No"; "Sell To Customer No")
                {
                    Editable = false;
                    Style = Ambiguous;
                    StyleExpr = PlndDispDateColor;
                }
                field("Sell To Customer Name"; "Sell To Customer Name")
                {
                    Editable = false;
                    Style = Unfavorable;
                    StyleExpr = LeadTimeColor;
                }
                field("Line No"; "Line No")
                {
                    Editable = false;
                }
                field("Schedule Line No"; "Schedule Line No")
                {
                    Editable = false;
                }
                field(No; No)
                {
                    Editable = false;
                }
                field(Description; Description)
                {
                    Editable = false;
                }
                field("Description 2"; "Description 2")
                {
                    Editable = false;
                }
                field("RDSO Inspection Required"; "RDSO Inspection Required")
                {
                    Editable = false;
                }
                field("Unit Of Measure"; "Unit Of Measure")
                {
                    Editable = false;
                }
                field(Quanity; Quanity)
                {
                    Editable = false;
                }
                field("Qty Shipped"; "Qty Shipped")
                {
                    Editable = false;
                }
                field("To Be Shipped Qty"; "To Be Shipped Qty")
                {
                    Editable = false;
                }
                field("Item Lead Time"; "Item Lead Time")
                {
                    Editable = false;
                }
                field("Planned Dispatch Date"; "Planned Dispatch Date")
                {

                    trigger OnValidate();
                    begin
                        IF USERID IN ['EFFTRONICS\PRANAVI', 'EFFTRONICS\VIJAYA', 'EFFTRONICS\ANILKUMAR', 'EFFTRONICS\BSATISH', 'EFFTRONICS\SARDHAR', 'EFFTRONICS\SPURTHI', 'EFFTRONICS\ANVESH'] THEN BEGIN
                            IF "Schedule Line No" = 0 THEN BEGIN
                                SalesLin.RESET;
                                SalesLin.SETRANGE(SalesLin."Document No.", "Document No");
                                SalesLin.SETRANGE(SalesLin."Line No.", "Line No");
                                SalesLin.SETRANGE(SalesLin."No.", No);
                                IF SalesLin.FINDFIRST THEN BEGIN
                                    SalesLin."Planned Dispatch Date" := "Planned Dispatch Date";
                                    SalesLin.MODIFY;
                                END;
                            END
                            ELSE BEGIN
                                SchdlLin.RESET;
                                SchdlLin.SETRANGE(SchdlLin."Document No.", "Document No");
                                SchdlLin.SETRANGE(SchdlLin."Document Line No.", "Line No");
                                SchdlLin.SETRANGE(SchdlLin."Line No.", "Schedule Line No");
                                SchdlLin.SETRANGE(SchdlLin."No.", No);
                                IF SchdlLin.FINDFIRST THEN BEGIN
                                    SchdlLin."Planned Dispatch Date" := "Planned Dispatch Date";
                                    SchdlLin.MODIFY;
                                END;
                            END;
                        END
                        ELSE BEGIN
                            MESSAGE('You do not have rights for Planning!');
                            ERROR('You do not have rights for Planning!');
                        END;
                    end;
                }
                field(To_Be_Purch_Qty; To_Be_Purch_Qty)
                {

                    trigger OnValidate();
                    begin
                        IF NOT (USERID IN ['EFFTRONICS\PRANAVI', 'EFFTRONICS\VIJAYA', 'EFFTRONICS\ANILKUMAR', 'EFFTRONICS\CHOWDARY', 'EFFTRONICS\BRAHMAIAH', 'EFFTRONICS\RENUKACH', 'EFFTRONICS\ANANDA', 'EFFTRONICS\PARDHU']) THEN BEGIN
                            MESSAGE('You do not have rights for Planning!');
                            ERROR('You do not have rights for Planning!');
                        END;

                        IF To_Be_Purch_Qty > 0 THEN
                            IF To_Be_Purch_Qty > "To Be Shipped Qty" THEN BEGIN
                                MESSAGE('You cannot enter more than ' + FORMAT("To Be Shipped Qty"));
                                ERROR('You cannot enter more than ' + FORMAT("To Be Shipped Qty"));
                            END;
                    end;
                }
                field("Asign Vendor"; "Asign Vendor")
                {

                    trigger OnValidate();
                    begin
                        IF NOT (USERID IN ['EFFTRONICS\PRANAVI', 'EFFTRONICS\VIJAYA', 'EFFTRONICS\ANILKUMAR', 'EFFTRONICS\CHOWDARY', 'EFFTRONICS\BRAHMAIAH', 'EFFTRONICS\RENUKACH', 'EFFTRONICS\ANANDA', 'EFFTRONICS\PARDHU']) THEN BEGIN
                            MESSAGE('You do not have rights for Planning!');
                            ERROR('You do not have rights for Planning!');
                        END;
                        IF "Planned Dispatch Date" = 0D THEN BEGIN
                            MESSAGE('You cannot asign vendor as there is not dispatch plan!');
                            ERROR('You cannot asign vendor as there is not dispatch plan!');
                        END;
                    end;
                }
                field("Purchase Remarks"; "Purchase Remarks")
                {

                    trigger OnValidate();
                    begin
                        IF "Schedule Line No" = 0 THEN BEGIN
                            SalesLin.RESET;
                            SalesLin.SETRANGE(SalesLin."Document No.", "Document No");
                            SalesLin.SETRANGE(SalesLin."Line No.", "Line No");
                            SalesLin.SETRANGE(SalesLin."No.", No);
                            IF SalesLin.FINDFIRST THEN BEGIN
                                SalesLin."Purchase Remarks" := "Purchase Remarks";
                                SalesLin.MODIFY;
                            END;
                        END
                        ELSE BEGIN
                            SchdlLin.RESET;
                            SchdlLin.SETRANGE(SchdlLin."Document No.", "Document No");
                            SchdlLin.SETRANGE(SchdlLin."Document Line No.", "Line No");
                            SchdlLin.SETRANGE(SchdlLin."Line No.", "Schedule Line No");
                            SchdlLin.SETRANGE(SchdlLin."No.", No);
                            IF SchdlLin.FINDFIRST THEN BEGIN
                                SchdlLin."Purchase Remarks" := "Purchase Remarks";
                                SchdlLin.MODIFY;
                            END;
                        END;
                    end;
                }
                field("Stock At Store"; "Stock At Store")
                {
                    Editable = false;
                }
                field("Stock At MCH"; "Stock At MCH")
                {
                }
                field("Stock At R&D Store"; "Stock At R&D Store")
                {
                }
                field("Stock At CS Store"; "Stock At CS Store")
                {
                }
                field("Qty On Purch Orders"; "Qty On Purch Orders")
                {
                    Editable = false;
                }
                field("Qty Under Inspection"; "Qty Under Inspection")
                {
                    Editable = false;
                }
                field("Issued Material Qty"; "Issued Material Qty")
                {
                    Editable = false;
                }
                field("Posting Group"; "Posting Group")
                {
                    Editable = false;
                }
                field("Purchase Order  Number"; "Purchase Order  Number")
                {
                    Editable = false;
                }
                field("Vendor Name"; "Vendor Name")
                {
                    Editable = false;
                }
                field("Ordered Qty"; "Ordered Qty")
                {
                    Editable = false;
                }
                field("To Be Rec Qty"; "To Be Rec Qty")
                {
                    Editable = false;
                }
                field(Type; Type)
                {
                    Editable = false;
                }
                field("Pending By"; "Pending By")
                {
                }
            }
            group(Control1102152014)
            {
                //The GridLayout property is only supported on controls of type Grid
                //GridLayout = Rows;
                ShowCaption = false;
                fixed(Control1102152013)
                {
                    ShowCaption = false;
                    group(Control1102152012)
                    {
                        ShowCaption = false;
                        field("TotalItems+FORMAT(COUNT)"; TotalItems + FORMAT(COUNT))
                        {
                        }
                    }
                    group(Control1102152036)
                    {
                        ShowCaption = false;
                        field(LeadTimeColorText; LeadTimeColorText)
                        {
                            Style = Unfavorable;
                            StyleExpr = TRUE;
                        }
                    }
                    group(Control1102152038)
                    {
                        ShowCaption = false;
                        field(ScheduleItemsText; ScheduleItemsText)
                        {
                            Style = StrongAccent;
                            StyleExpr = TRUE;
                        }
                    }
                    group(Control1102152040)
                    {
                        ShowCaption = false;
                        field(PlndDispDateText; PlndDispDateText)
                        {
                            Style = Ambiguous;
                            StyleExpr = TRUE;
                        }
                    }
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1102152042; Links)
            {
                Visible = false;
            }
            systempart(Control1102152041; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Get Lines")
            {
                Image = GetLines;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    POAutomation.Get_BOI_Lines;
                end;
            }
            action("Show Spec")
            {
                Image = ShowSelected;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                var
                    SCh2: Record Schedule2;
                    S_LineNo: Text;
                    loopbreak: Boolean;
                    SCh2Filter: Record Schedule2;
                    S_LineNoCode: Integer;
                    LoopCount: Integer;
                begin
                    LoopCount := 0;
                    loopbreak := FALSE;
                    S_LineNo := '';
                    SCh2.RESET;
                    SCh2.SETRANGE(SCh2."Document No.", "Document No");
                    SCh2.SETRANGE(SCh2."Document Line No.", "Line No");
                    IF SCh2.FINDSET THEN BEGIN
                        LoopCount := SCh2.COUNT;
                        REPEAT
                            IF (SCh2."Line No." >= "Schedule Line No") THEN BEGIN
                                IF (SCh2."Document Line No." = SCh2."Line No.") OR ("Schedule Line No" = SCh2."Line No.") THEN
                                    S_LineNo := S_LineNo + DELCHR(FORMAT(SCh2."Line No."), '=', ',') + '|'
                                ELSE
                                    IF SCh2."No." = '' THEN
                                        S_LineNo := S_LineNo + DELCHR(FORMAT(SCh2."Line No."), '=', ',') + '|'
                                    ELSE
                                        loopbreak := TRUE;
                            END;
                            LoopCount := LoopCount - 1;
                            IF LoopCount < 2 THEN
                                loopbreak := TRUE;
                        UNTIL (SCh2.NEXT = 0) OR (loopbreak = TRUE);
                    END;
                    IF STRLEN(S_LineNo) > 1 THEN
                        S_LineNo := COPYSTR(S_LineNo, 1, STRLEN(S_LineNo) - 1)
                    ELSE
                        IF "Schedule Line No" > 0 THEN
                            S_LineNo := DELCHR(FORMAT("Schedule Line No"), '=', ',')
                        ELSE
                            S_LineNo := DELCHR(FORMAT("Line No"), '=', ',');
                    SCh2Filter.RESET;
                    SCh2Filter.SETRANGE(SCh2Filter."Document No.", "Document No");
                    SCh2Filter.SETRANGE(SCh2Filter."Document Line No.", "Line No");
                    SCh2Filter.SETFILTER(SCh2Filter."Line No.", S_LineNo);
                    IF SCh2Filter.FINDFIRST THEN
                        PAGE.RUN(60125, SCh2Filter);

                    //  SCh2.FILTERGROUP(2);

                    //  SCh2.FILTERGROUP(0);
                end;
            }
            action("Create Orders")
            {
                Ellipsis = false;
                Image = "Order";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = false;

                trigger OnAction();
                var
                    TINVendors: Text;
                    BOIPlngGRec: Record "Sales Bought Out Material List";
                    Structure: Code[10];
                    Previous_Vendor: Code[20];
                    MinDate: Integer;
                    MaxDate: Integer;
                    Temp: Integer;
                    testvar: Integer;
                    "Count": Boolean;
                    Count1: Boolean;
                    BUFFER: Text[30];
                    Previous_Order: Code[30];
                    Previous_Item: Code[30];
                    Order_Qty: Decimal;
                    ItemsList: Text;
                    LoopCount: Integer;
                    SCh2: Record Schedule2;
                    S_LineNo: Text;
                    loopbreak: Boolean;
                    SCh2Filter: Record Schedule2;
                begin
                    IF USERID IN ['EFFTRONICS\PRANAVI', 'EFFTRONICS\VIJAYA', 'EFFTRONICS\ANILKUMAR', 'EFFTRONICS\CHOWDARY', 'EFFTRONICS\BRAHMAIAH', 'EFFTRONICS\RENUKACH', 'EFFTRONICS\ANANDA', 'EFFTRONICS\PARDHU'] THEN BEGIN
                        SETCURRENTKEY("Asign Vendor", "Document Type", "Document No", No, "Line No", "Schedule Line No");
                        SETFILTER("Asign Vendor", '<>%1', '');
                        IF FINDSET THEN
                            REPEAT
                                IF Previous_Vendor <> "Asign Vendor" THEN BEGIN
                                    Previous_Vendor := "Asign Vendor";
                                    Vendor.RESET;
                                    IF Vendor.GET("Asign Vendor") THEN BEGIN
                                        IF Vendor."Vendor Posting Group" = 'FOREIGN' THEN BEGIN
                                            CurrExchRate.RESET;
                                            CurrExchRate.SETRANGE(CurrExchRate."Currency Code", Vendor."Currency Code");
                                            IF CurrExchRate.FINDLAST THEN BEGIN
                                                IF CurrExchRate."Starting Date" < TODAY THEN BEGIN
                                                    ERROR('THERE IS NO CURRENCY EXCHANGE RATE FOR TODAY FOR CURRENCY: ' + CurrExchRate."Currency Code");
                                                END;
                                            END;
                                        END ELSE BEGIN
                                            IF (Vendor."T.I.N. No." = '') AND (Vendor."T.I.N Status" IN [Vendor."T.I.N Status"::" ", Vendor."T.I.N Status"::TINAPPLIED]) THEN
                                                TINVendors := TINVendors + Vendor.Name + ', ';
                                        END;
                                    END;
                                END;
                            //IF To_Be_Purch_Qty = 0 THEN
                            //  ERROR('Please enter To Be Purchased Quanitity for '+Description+' in Order: '+"Document No"+'--'+FORMAT("Line No")+'--'+FORMAT("Schedule Line No"));
                            UNTIL NEXT = 0;
                        IF TINVendors <> '' THEN
                            ERROR('Please enter T.I.N Number in Vendor Card for :' + COPYSTR(TINVendors, 1, STRLEN(TINVendors) - 2) +
                                  'in Tax Information Tab!\IF TIN Not Applicable update TIN Status to TIN Invalid!');
                        SETCURRENTKEY(No);
                        SETFILTER("Asign Vendor", '<>%1', '');

                        IF FINDSET THEN
                            REPEAT
                                IF Previous_Item <> No THEN BEGIN
                                    Previous_Item := No;
                                    IF ItemGRec.GET(No) THEN BEGIN
                                        IF STRLEN(FORMAT(ItemGRec."Safety Lead Time")) = 0 THEN
                                            ItemsList := ItemsList + No + ', ';
                                    END;
                                END;
                            UNTIL NEXT = 0;
                        IF ItemsList <> '' THEN
                            ERROR('There is no Safety Lead Time for following items: \' + COPYSTR(ItemsList, 1, STRLEN(ItemsList) - 2) + '\Please enter Safety Lead Time in Item card!');
                        Previous_Vendor := '';
                        Previous_Order := '';
                        Previous_Item := '';
                        "No. Of Order" := 0;
                        MinDate := 0;
                        MaxDate := 0;
                        Count := FALSE;
                        Count1 := FALSE;
                        Orders_List := '';
                        SETCURRENTKEY("Document Type", "Document No", "Asign Vendor", No, "Line No", "Schedule Line No");
                        SETFILTER("Asign Vendor", '<>%1', '');
                        SETFILTER(To_Be_Purch_Qty, '>%1', 0);
                        IF FINDSET THEN
                            REPEAT
                                IF (Previous_Order <> "Document No") THEN BEGIN
                                    Previous_Order := "Document No";
                                    Previous_Vendor := '';
                                    IF (Previous_Vendor <> "Asign Vendor") THEN BEGIN
                                        Previous_Vendor := "Asign Vendor";
                                        "No. Of Order" += 1;
                                        Vendor.RESET;
                                        IF Vendor.GET("Asign Vendor") THEN BEGIN
                                            IF Vendor.Structure <> '' THEN
                                                Structure := Vendor.Structure
                                            ELSE BEGIN
                                                CASE Vendor."Tax Area Code" OF
                                                    'PUCH CST':
                                                        Structure := 'PURC-CST';
                                                    'PUCH VAT':
                                                        Structure := 'PURC-VAT';
                                                END;
                                            END;
                                            IF Vendor."Vendor Posting Group" = 'FOREIGN' THEN BEGIN
                                                IF Vendor."Tax Area Code" <> '' THEN
                                                    Structure := Vendor."Tax Area Code"
                                                ELSE
                                                    Structure := Vendor.Structure;
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
                                        //MESSAGE('purchase order no %1',PurchaseHeader."No.");
                                        Orders_List := Orders_List + PurchaseHeader."No." + ',';
                                        PurchaseHeader."Order Date" := TODAY;
                                        PurchaseHeader."Document Date" := TODAY;
                                        PurchaseHeader."Posting Date" := TODAY;
                                        PurchaseHeader."Buy-from Vendor No." := "Asign Vendor";
                                        PurchaseHeader.VALIDATE(PurchaseHeader."Buy-from Vendor No.");
                                        PurchaseHeader."Sale Order No" := "Document No";
                                        PurchaseHeader."Location Code" := 'STR';
                                        PurchaseHeader.VALIDATE("Location Code");
                                        PurchaseHeader."Shortcut Dimension 1 Code" := 'PRD-0010';
                                        PurchaseHeader."Packing Type" := 'STANDARD PACKING';
                                        PurchaseHeader.Structure := Structure;
                                        PurchaseHeader.INSERT;

                                        PurchaseLine.INIT;
                                        PurchaseLine."Document Type" := PurchaseLine."Document Type"::Order;
                                        PurchaseLine."Document No." := PurchaseHeader."No.";
                                        PurchaseLine."Line No." := PurchaseLine."Line No." + 10000;
                                        PurchaseLine."Buy-from Vendor No." := PurchaseHeader."Buy-from Vendor No.";
                                        IF Type = Type::Item THEN
                                            PurchaseLine.Type := PurchaseLine.Type::Item
                                        ELSE
                                            IF Type = Type::"G/L Account" THEN
                                                PurchaseLine.Type := PurchaseLine.Type::"G/L Account"
                                            ELSE
                                                PurchaseLine.Type := PurchaseLine.Type::" ";
                                        PurchaseLine."No." := No;
                                        PurchaseLine.VALIDATE(PurchaseLine."No.");
                                        Previous_Item := No;
                                        PurchaseLine.Description := Description;
                                        MinDate := 0;
                                        MaxDate := 0;
                                        IF ItemGRec.GET(No) THEN BEGIN
                                            IF STRLEN(FORMAT(ItemGRec."Safety Lead Time")) > 0 THEN BEGIN
                                                BUFFER := '+' + FORMAT(ItemGRec."Safety Lead Time");
                                                PurchaseLine."Expected Receipt Date" := CALCDATE(BUFFER, TODAY);
                                                PurchaseLine."Deviated Receipt Date" := CALCDATE(BUFFER, TODAY);
                                                EVALUATE(Temp, COPYSTR(FORMAT(ItemGRec."Safety Lead Time"), 1, STRLEN(FORMAT(ItemGRec."Safety Lead Time")) - 1));
                                                MinDate := Temp;
                                                MaxDate := Temp;
                                            END;
                                        END;
                                        Order_Qty := Calc_Order_Qty(PurchaseLine."No.", To_Be_Purch_Qty);
                                        PurchaseLine.Quantity := Order_Qty;
                                        PurchaseLine.VALIDATE(PurchaseLine.Quantity);
                                        PurchaseLine."Location Code" := 'STR';
                                        PurchaseLine.VALIDATE("Location Code");
                                        PurchaseLine.VALIDATE(PurchaseLine.Quantity);
                                        PurchaseLine.INSERT;
                                        PurchaseHeader.VALIDATE(PurchaseHeader.Structure);
                                        IF MinDate = 0 THEN
                                            MinDate := 3;
                                        IF PurchaseHeader."Requested Receipt Date" <> 0D THEN BEGIN
                                            IF PurchaseHeader."Requested Receipt Date" > (TODAY + (MinDate - 3)) THEN BEGIN
                                                PurchaseHeader."Requested Receipt Date" := TODAY + (MinDate - 3);
                                                PurchaseHeader.MODIFY;
                                            END;
                                        END ELSE BEGIN
                                            PurchaseHeader."Requested Receipt Date" := TODAY + (MinDate - 3);
                                            PurchaseHeader.MODIFY;
                                        END;
                                        IF PurchaseHeader."Expected Receipt Date" <> 0D THEN BEGIN
                                            IF PurchaseHeader."Expected Receipt Date" < (TODAY + MaxDate) THEN BEGIN
                                                PurchaseHeader."Expected Receipt Date" := TODAY + MaxDate;
                                                PurchaseHeader.MODIFY;
                                            END;
                                        END ELSE BEGIN
                                            PurchaseHeader."Expected Receipt Date" := TODAY + MaxDate;
                                            PurchaseHeader.MODIFY;
                                        END;
                                        // Start--Checking for Spec existance and inserting in PO
                                        LoopCount := 0;
                                        loopbreak := FALSE;
                                        S_LineNo := '';
                                        SCh2.RESET;
                                        SCh2.SETRANGE(SCh2."Document No.", "Document No");
                                        SCh2.SETRANGE(SCh2."Document Line No.", "Line No");
                                        IF SCh2.FINDSET THEN BEGIN
                                            LoopCount := SCh2.COUNT;
                                            REPEAT
                                                IF (SCh2."Line No." > "Schedule Line No") THEN BEGIN
                                                    IF SCh2."No." = '' THEN
                                                        S_LineNo := S_LineNo + DELCHR(FORMAT(SCh2."Line No."), '=', ',') + '|'
                                                    ELSE
                                                        IF (SCh2."Document Line No." = SCh2."Line No.") OR ("Schedule Line No" = SCh2."Line No.") THEN BEGIN
                                                        END ELSE
                                                            loopbreak := TRUE;
                                                END;
                                                LoopCount := LoopCount - 1;
                                                IF LoopCount < 2 THEN
                                                    loopbreak := TRUE;
                                            UNTIL (SCh2.NEXT = 0) OR (loopbreak = TRUE);
                                        END;
                                        IF STRLEN(S_LineNo) > 1 THEN BEGIN
                                            S_LineNo := COPYSTR(S_LineNo, 1, STRLEN(S_LineNo) - 1);
                                            SCh2Filter.RESET;
                                            SCh2Filter.SETRANGE(SCh2Filter."Document No.", "Document No");
                                            SCh2Filter.SETRANGE(SCh2Filter."Document Line No.", "Line No");
                                            SCh2Filter.SETFILTER(SCh2Filter."Line No.", S_LineNo);
                                            IF SCh2Filter.FINDFIRST THEN
                                                REPEAT
                                                    PurchaseLine.INIT;
                                                    PurchaseLine."Document Type" := PurchaseLine."Document Type"::Order;
                                                    PurchaseLine."Document No." := PurchaseHeader."No.";
                                                    PurchaseLine."Line No." := PurchaseLine."Line No." + 10000;
                                                    PurchaseLine."Buy-from Vendor No." := PurchaseHeader."Buy-from Vendor No.";
                                                    PurchaseLine.Type := PurchaseLine.Type::" ";
                                                    PurchaseLine.Description := SCh2Filter.Description;
                                                    PurchaseLine."Location Code" := 'STR';
                                                    PurchaseLine.VALIDATE("Location Code");
                                                    PurchaseLine.INSERT;
                                                UNTIL SCh2Filter.NEXT = 0;
                                        END;
                                        // End--Checking for Spec existance and inserting in PO
                                    END;
                                END
                                ELSE BEGIN   // if Same Sale Order No.
                                    IF (Previous_Vendor <> "Asign Vendor") THEN // if vendor changed
                                    BEGIN
                                        Previous_Vendor := "Asign Vendor";
                                        "No. Of Order" += 1;
                                        Vendor.RESET;
                                        IF Vendor.GET("Asign Vendor") THEN BEGIN
                                            IF Vendor.Structure <> '' THEN
                                                Structure := Vendor.Structure
                                            ELSE BEGIN
                                                CASE Vendor."Tax Area Code" OF
                                                    'PUCH CST':
                                                        Structure := 'PURC-CST';
                                                    'PUCH VAT':
                                                        Structure := 'PURC-VAT';
                                                END;
                                            END;
                                            IF Vendor."Vendor Posting Group" = 'FOREIGN' THEN BEGIN
                                                IF Vendor."Tax Area Code" <> '' THEN
                                                    Structure := Vendor."Tax Area Code"
                                                ELSE
                                                    Structure := Vendor.Structure;
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
                                        //MESSAGE('purchase order no %1',PurchaseHeader."No.");
                                        Orders_List := Orders_List + PurchaseHeader."No." + ',';
                                        PurchaseHeader."Order Date" := TODAY;
                                        PurchaseHeader."Document Date" := TODAY;
                                        PurchaseHeader."Posting Date" := TODAY;
                                        PurchaseHeader."Buy-from Vendor No." := "Asign Vendor";
                                        PurchaseHeader.VALIDATE(PurchaseHeader."Buy-from Vendor No.");
                                        PurchaseHeader."Sale Order No" := "Document No";
                                        PurchaseHeader."Location Code" := 'STR';
                                        PurchaseHeader.VALIDATE("Location Code");
                                        PurchaseHeader."Shortcut Dimension 1 Code" := 'PRD-0010';
                                        PurchaseHeader."Packing Type" := 'STANDARD PACKING';
                                        PurchaseHeader.Structure := Structure;
                                        PurchaseHeader.INSERT;

                                        PurchaseLine.INIT;
                                        PurchaseLine."Document Type" := PurchaseLine."Document Type"::Order;
                                        PurchaseLine."Document No." := PurchaseHeader."No.";
                                        PurchaseLine."Line No." := PurchaseLine."Line No." + 10000;
                                        PurchaseLine."Buy-from Vendor No." := PurchaseHeader."Buy-from Vendor No.";
                                        IF Type = Type::Item THEN
                                            PurchaseLine.Type := PurchaseLine.Type::Item
                                        ELSE
                                            IF Type = Type::"G/L Account" THEN
                                                PurchaseLine.Type := PurchaseLine.Type::"G/L Account"
                                            ELSE
                                                PurchaseLine.Type := PurchaseLine.Type::" ";
                                        PurchaseLine."No." := No;
                                        PurchaseLine.VALIDATE(PurchaseLine."No.");
                                        Previous_Item := No;
                                        PurchaseLine.Description := Description;
                                        MinDate := 0;
                                        MaxDate := 0;
                                        IF ItemGRec.GET(No) THEN BEGIN
                                            IF STRLEN(FORMAT(ItemGRec."Safety Lead Time")) > 0 THEN BEGIN
                                                BUFFER := '+' + FORMAT(ItemGRec."Safety Lead Time");
                                                PurchaseLine."Expected Receipt Date" := CALCDATE(BUFFER, TODAY);
                                                PurchaseLine."Deviated Receipt Date" := CALCDATE(BUFFER, TODAY);
                                                EVALUATE(Temp, COPYSTR(FORMAT(ItemGRec."Safety Lead Time"), 1, STRLEN(FORMAT(ItemGRec."Safety Lead Time")) - 1));
                                                MinDate := Temp;
                                                MaxDate := Temp;
                                            END;
                                        END;
                                        Order_Qty := Calc_Order_Qty(PurchaseLine."No.", To_Be_Purch_Qty);
                                        PurchaseLine.Quantity := Order_Qty;
                                        PurchaseLine.VALIDATE(PurchaseLine.Quantity);
                                        PurchaseLine."Location Code" := 'STR';
                                        PurchaseLine.VALIDATE("Location Code");
                                        PurchaseLine.VALIDATE(PurchaseLine.Quantity);
                                        PurchaseLine.INSERT;
                                        PurchaseHeader.VALIDATE(PurchaseHeader.Structure);
                                        IF MinDate = 0 THEN
                                            MinDate := 3;
                                        IF PurchaseHeader."Requested Receipt Date" <> 0D THEN BEGIN
                                            IF PurchaseHeader."Requested Receipt Date" > (TODAY + (MinDate - 3)) THEN BEGIN
                                                PurchaseHeader."Requested Receipt Date" := TODAY + (MinDate - 3);
                                                PurchaseHeader.MODIFY;
                                            END;
                                        END ELSE BEGIN
                                            PurchaseHeader."Requested Receipt Date" := TODAY + (MinDate - 3);
                                            PurchaseHeader.MODIFY;
                                        END;
                                        IF PurchaseHeader."Expected Receipt Date" <> 0D THEN BEGIN
                                            IF PurchaseHeader."Expected Receipt Date" < (TODAY + MaxDate) THEN BEGIN
                                                PurchaseHeader."Expected Receipt Date" := TODAY + MaxDate;
                                                PurchaseHeader.MODIFY;
                                            END;
                                        END ELSE BEGIN
                                            PurchaseHeader."Expected Receipt Date" := TODAY + MaxDate;
                                            PurchaseHeader.MODIFY;
                                        END;
                                        // Start--Checking for Spec existance and inserting in PO
                                        LoopCount := 0;
                                        loopbreak := FALSE;
                                        S_LineNo := '';
                                        SCh2.RESET;
                                        SCh2.SETRANGE(SCh2."Document No.", "Document No");
                                        SCh2.SETRANGE(SCh2."Document Line No.", "Line No");
                                        IF SCh2.FINDSET THEN BEGIN
                                            LoopCount := SCh2.COUNT;
                                            REPEAT
                                                IF (SCh2."Line No." > "Schedule Line No") THEN BEGIN
                                                    IF SCh2."No." = '' THEN
                                                        S_LineNo := S_LineNo + DELCHR(FORMAT(SCh2."Line No."), '=', ',') + '|'
                                                    ELSE
                                                        IF (SCh2."Document Line No." = SCh2."Line No.") OR ("Schedule Line No" = SCh2."Line No.") THEN BEGIN
                                                        END ELSE
                                                            loopbreak := TRUE;
                                                END;
                                                LoopCount := LoopCount - 1;
                                                IF LoopCount < 2 THEN
                                                    loopbreak := TRUE;
                                            UNTIL (SCh2.NEXT = 0) OR (loopbreak = TRUE);
                                        END;
                                        IF STRLEN(S_LineNo) > 1 THEN BEGIN
                                            S_LineNo := COPYSTR(S_LineNo, 1, STRLEN(S_LineNo) - 1);
                                            SCh2Filter.RESET;
                                            SCh2Filter.SETRANGE(SCh2Filter."Document No.", "Document No");
                                            SCh2Filter.SETRANGE(SCh2Filter."Document Line No.", "Line No");
                                            SCh2Filter.SETFILTER(SCh2Filter."Line No.", S_LineNo);
                                            IF SCh2Filter.FINDFIRST THEN
                                                REPEAT
                                                    PurchaseLine.INIT;
                                                    PurchaseLine."Document Type" := PurchaseLine."Document Type"::Order;
                                                    PurchaseLine."Document No." := PurchaseHeader."No.";
                                                    PurchaseLine."Line No." := PurchaseLine."Line No." + 10000;
                                                    PurchaseLine."Buy-from Vendor No." := PurchaseHeader."Buy-from Vendor No.";
                                                    PurchaseLine.Type := PurchaseLine.Type::" ";
                                                    PurchaseLine.Description := SCh2Filter.Description;
                                                    PurchaseLine."Location Code" := 'STR';
                                                    PurchaseLine.VALIDATE("Location Code");
                                                    PurchaseLine.INSERT;
                                                UNTIL SCh2Filter.NEXT = 0;
                                        END;
                                        // End--Checking for Spec existance and inserting in PO
                                    END
                                    ELSE BEGIN    // Same Order and Same Vendor
                                        IF Previous_Item <> No THEN BEGIN
                                            Previous_Item := No;
                                            PurchaseLine.INIT;
                                            PurchaseLine."Document Type" := PurchaseLine."Document Type"::Order;
                                            PurchaseLine."Document No." := PurchaseHeader."No.";
                                            PurchaseLine."Line No." := PurchaseLine."Line No." + 10000;
                                            PurchaseLine."Buy-from Vendor No." := PurchaseHeader."Buy-from Vendor No.";
                                            IF Type = Type::Item THEN
                                                PurchaseLine.Type := PurchaseLine.Type::Item
                                            ELSE
                                                IF Type = Type::"G/L Account" THEN
                                                    PurchaseLine.Type := PurchaseLine.Type::"G/L Account"
                                                ELSE
                                                    PurchaseLine.Type := PurchaseLine.Type::" ";
                                            PurchaseLine."No." := No;
                                            PurchaseLine.VALIDATE(PurchaseLine."No.");
                                            Previous_Item := No;
                                            PurchaseLine.Description := Description;
                                            MinDate := 0;
                                            MaxDate := 0;
                                            IF ItemGRec.GET(No) THEN BEGIN
                                                IF STRLEN(FORMAT(ItemGRec."Safety Lead Time")) > 0 THEN BEGIN
                                                    BUFFER := '+' + FORMAT(ItemGRec."Safety Lead Time");
                                                    PurchaseLine."Expected Receipt Date" := CALCDATE(BUFFER, TODAY);
                                                    PurchaseLine."Deviated Receipt Date" := CALCDATE(BUFFER, TODAY);
                                                    EVALUATE(Temp, COPYSTR(FORMAT(ItemGRec."Safety Lead Time"), 1, STRLEN(FORMAT(ItemGRec."Safety Lead Time")) - 1));
                                                    MinDate := Temp;
                                                    MaxDate := Temp;
                                                END;
                                            END;
                                            Order_Qty := Calc_Order_Qty(PurchaseLine."No.", To_Be_Purch_Qty);
                                            PurchaseLine.Quantity := Order_Qty;
                                            PurchaseLine.VALIDATE(PurchaseLine.Quantity);
                                            PurchaseLine."Location Code" := 'STR';
                                            PurchaseLine.VALIDATE("Location Code");
                                            PurchaseLine.VALIDATE(PurchaseLine.Quantity);
                                            PurchaseLine.INSERT;
                                            PurchaseHeader.VALIDATE(PurchaseHeader.Structure);
                                            IF MinDate = 0 THEN
                                                MinDate := 3;
                                            IF PurchaseHeader."Requested Receipt Date" <> 0D THEN BEGIN
                                                IF PurchaseHeader."Requested Receipt Date" > (TODAY + (MinDate - 3)) THEN BEGIN
                                                    PurchaseHeader."Requested Receipt Date" := TODAY + (MinDate - 3);
                                                    PurchaseHeader.MODIFY;
                                                END;
                                            END ELSE BEGIN
                                                PurchaseHeader."Requested Receipt Date" := TODAY + (MinDate - 3);
                                                PurchaseHeader.MODIFY;
                                            END;
                                            IF PurchaseHeader."Expected Receipt Date" <> 0D THEN BEGIN
                                                IF PurchaseHeader."Expected Receipt Date" < (TODAY + MaxDate) THEN BEGIN
                                                    PurchaseHeader."Expected Receipt Date" := TODAY + MaxDate;
                                                    PurchaseHeader.MODIFY;
                                                END;
                                            END ELSE BEGIN
                                                PurchaseHeader."Expected Receipt Date" := TODAY + MaxDate;
                                                PurchaseHeader.MODIFY;
                                            END;
                                            // Start--Checking for Spec existance and inserting in PO
                                            LoopCount := 0;
                                            loopbreak := FALSE;
                                            S_LineNo := '';
                                            SCh2.RESET;
                                            SCh2.SETRANGE(SCh2."Document No.", "Document No");
                                            SCh2.SETRANGE(SCh2."Document Line No.", "Line No");
                                            IF SCh2.FINDSET THEN BEGIN
                                                LoopCount := SCh2.COUNT;
                                                REPEAT
                                                    IF (SCh2."Line No." > "Schedule Line No") THEN BEGIN
                                                        IF SCh2."No." = '' THEN
                                                            S_LineNo := S_LineNo + DELCHR(FORMAT(SCh2."Line No."), '=', ',') + '|'
                                                        ELSE
                                                            IF (SCh2."Document Line No." = SCh2."Line No.") OR ("Schedule Line No" = SCh2."Line No.") THEN BEGIN
                                                            END ELSE
                                                                loopbreak := TRUE;
                                                    END;
                                                    LoopCount := LoopCount - 1;
                                                    IF LoopCount < 2 THEN
                                                        loopbreak := TRUE;
                                                UNTIL (SCh2.NEXT = 0) OR (loopbreak = TRUE);
                                            END;
                                            IF STRLEN(S_LineNo) > 1 THEN BEGIN
                                                S_LineNo := COPYSTR(S_LineNo, 1, STRLEN(S_LineNo) - 1);
                                                SCh2Filter.RESET;
                                                SCh2Filter.SETRANGE(SCh2Filter."Document No.", "Document No");
                                                SCh2Filter.SETRANGE(SCh2Filter."Document Line No.", "Line No");
                                                SCh2Filter.SETFILTER(SCh2Filter."Line No.", S_LineNo);
                                                IF SCh2Filter.FINDFIRST THEN
                                                    REPEAT
                                                        PurchaseLine.INIT;
                                                        PurchaseLine."Document Type" := PurchaseLine."Document Type"::Order;
                                                        PurchaseLine."Document No." := PurchaseHeader."No.";
                                                        PurchaseLine."Line No." := PurchaseLine."Line No." + 10000;
                                                        PurchaseLine."Buy-from Vendor No." := PurchaseHeader."Buy-from Vendor No.";
                                                        PurchaseLine.Type := PurchaseLine.Type::" ";
                                                        PurchaseLine.Description := SCh2Filter.Description;
                                                        PurchaseLine."Location Code" := 'STR';
                                                        PurchaseLine.VALIDATE("Location Code");
                                                        PurchaseLine.INSERT;
                                                    UNTIL SCh2Filter.NEXT = 0;
                                            END;
                                            // End--Checking for Spec existance and inserting in PO
                                        END
                                        ELSE BEGIN
                                            // Start--Checking for Spec existance and inserting in PO
                                            LoopCount := 0;
                                            loopbreak := FALSE;
                                            S_LineNo := '';
                                            SCh2.RESET;
                                            SCh2.SETRANGE(SCh2."Document No.", "Document No");
                                            SCh2.SETRANGE(SCh2."Document Line No.", "Line No");
                                            IF SCh2.FINDSET THEN BEGIN
                                                LoopCount := SCh2.COUNT;
                                                REPEAT
                                                    IF (SCh2."Line No." > "Schedule Line No") THEN BEGIN
                                                        IF SCh2."No." = '' THEN
                                                            S_LineNo := S_LineNo + DELCHR(FORMAT(SCh2."Line No."), '=', ',') + '|'
                                                        ELSE
                                                            loopbreak := TRUE;
                                                    END;
                                                    LoopCount := LoopCount - 1;
                                                    IF LoopCount < 2 THEN
                                                        loopbreak := TRUE;
                                                UNTIL (SCh2.NEXT = 0) OR (loopbreak = TRUE);
                                            END;
                                            IF STRLEN(S_LineNo) > 1 THEN BEGIN
                                                Previous_Item := No;
                                                PurchaseLine.INIT;
                                                PurchaseLine."Document Type" := PurchaseLine."Document Type"::Order;
                                                PurchaseLine."Document No." := PurchaseHeader."No.";
                                                PurchaseLine."Line No." := PurchaseLine."Line No." + 10000;
                                                PurchaseLine."Buy-from Vendor No." := PurchaseHeader."Buy-from Vendor No.";
                                                IF Type = Type::Item THEN
                                                    PurchaseLine.Type := PurchaseLine.Type::Item
                                                ELSE
                                                    IF Type = Type::"G/L Account" THEN
                                                        PurchaseLine.Type := PurchaseLine.Type::"G/L Account"
                                                    ELSE
                                                        PurchaseLine.Type := PurchaseLine.Type::" ";
                                                PurchaseLine."No." := No;
                                                PurchaseLine.VALIDATE(PurchaseLine."No.");
                                                Previous_Item := No;
                                                PurchaseLine.Description := Description;
                                                MinDate := 0;
                                                MaxDate := 0;
                                                IF ItemGRec.GET(No) THEN BEGIN
                                                    IF STRLEN(FORMAT(ItemGRec."Safety Lead Time")) > 0 THEN BEGIN
                                                        BUFFER := '+' + FORMAT(ItemGRec."Safety Lead Time");
                                                        PurchaseLine."Expected Receipt Date" := CALCDATE(BUFFER, TODAY);
                                                        PurchaseLine."Deviated Receipt Date" := CALCDATE(BUFFER, TODAY);
                                                        EVALUATE(Temp, COPYSTR(FORMAT(ItemGRec."Safety Lead Time"), 1, STRLEN(FORMAT(ItemGRec."Safety Lead Time")) - 1));
                                                        MinDate := Temp;
                                                        MaxDate := Temp;
                                                    END;
                                                END;
                                                Order_Qty := Calc_Order_Qty(PurchaseLine."No.", To_Be_Purch_Qty);
                                                PurchaseLine.Quantity := Order_Qty;
                                                PurchaseLine.VALIDATE(PurchaseLine.Quantity);
                                                PurchaseLine."Location Code" := 'STR';
                                                PurchaseLine.VALIDATE("Location Code");
                                                PurchaseLine.VALIDATE(PurchaseLine.Quantity);
                                                PurchaseLine.INSERT;
                                                PurchaseHeader.VALIDATE(PurchaseHeader.Structure);
                                                IF MinDate = 0 THEN
                                                    MinDate := 3;
                                                IF PurchaseHeader."Requested Receipt Date" <> 0D THEN BEGIN
                                                    IF PurchaseHeader."Requested Receipt Date" > (TODAY + (MinDate - 3)) THEN BEGIN
                                                        PurchaseHeader."Requested Receipt Date" := TODAY + (MinDate - 3);
                                                        PurchaseHeader.MODIFY;
                                                    END;
                                                END ELSE BEGIN
                                                    PurchaseHeader."Requested Receipt Date" := TODAY + (MinDate - 3);
                                                    PurchaseHeader.MODIFY;
                                                END;
                                                IF PurchaseHeader."Expected Receipt Date" <> 0D THEN BEGIN
                                                    IF PurchaseHeader."Expected Receipt Date" < (TODAY + MaxDate) THEN BEGIN
                                                        PurchaseHeader."Expected Receipt Date" := TODAY + MaxDate;
                                                        PurchaseHeader.MODIFY;
                                                    END;
                                                END ELSE BEGIN
                                                    PurchaseHeader."Expected Receipt Date" := TODAY + MaxDate;
                                                    PurchaseHeader.MODIFY;
                                                END;
                                                S_LineNo := COPYSTR(S_LineNo, 1, STRLEN(S_LineNo) - 1);
                                                SCh2Filter.RESET;
                                                SCh2Filter.SETRANGE(SCh2Filter."Document No.", "Document No");
                                                SCh2Filter.SETRANGE(SCh2Filter."Document Line No.", "Line No");
                                                SCh2Filter.SETFILTER(SCh2Filter."Line No.", S_LineNo);
                                                IF SCh2Filter.FINDFIRST THEN
                                                    REPEAT
                                                        PurchaseLine.INIT;
                                                        PurchaseLine."Document Type" := PurchaseLine."Document Type"::Order;
                                                        PurchaseLine."Document No." := PurchaseHeader."No.";
                                                        PurchaseLine."Line No." := PurchaseLine."Line No." + 10000;
                                                        PurchaseLine."Buy-from Vendor No." := PurchaseHeader."Buy-from Vendor No.";
                                                        PurchaseLine.Type := PurchaseLine.Type::" ";
                                                        PurchaseLine.Description := SCh2Filter.Description;
                                                        PurchaseLine."Location Code" := 'STR';
                                                        PurchaseLine.VALIDATE("Location Code");
                                                        PurchaseLine.INSERT;
                                                    UNTIL SCh2Filter.NEXT = 0;
                                                // End--Checking for Spec existance and inserting in PO
                                            END
                                            ELSE BEGIN
                                                Order_Qty := Calc_Order_Qty(PurchaseLine."No.", To_Be_Purch_Qty);
                                                PurchaseLine.Quantity := PurchaseLine.Quantity + Order_Qty;
                                                PurchaseLine.MODIFY;
                                                PurchaseHeader.VALIDATE(PurchaseHeader.Structure);
                                            END;
                                        END;
                                    END;
                                END;
                            UNTIL NEXT = 0;
                        IF STRLEN(Orders_List) > 0 THEN
                            Orders_List := COPYSTR(Orders_List, 1, STRLEN(Orders_List) - 1);
                        SETCURRENTKEY("Document Type", "Document No", "Asign Vendor", No, "Line No", "Schedule Line No");
                        SETFILTER("Asign Vendor", '<>%1', '');
                        SETFILTER(To_Be_Purch_Qty, '>%1', 0);
                        IF FINDSET THEN
                            REPEAT
                                "Asign Vendor" := '';
                                To_Be_Purch_Qty := 0;
                                MODIFY;
                            UNTIL NEXT = 0;
                        RESET;
                        CurrPage.UPDATE;
                        IF Orders_List <> '' THEN
                            MESSAGE('Following Purchase Orders are Created: \' + Orders_List);
                    END ELSE
                        ERROR('You do not have rights for Planning!');
                end;
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        LeadTimeColor := FALSE;
        ScheduleItemsColor := FALSE;
        PlndDispDateColor := FALSE;
        IF ItemGRec.GET(No) THEN
            IF STRLEN(FORMAT(ItemGRec."Safety Lead Time")) <= 0 THEN
                LeadTimeColor := TRUE;
        IF "Schedule Line No" <> 0 THEN
            ScheduleItemsColor := TRUE;
        IF "Planned Dispatch Date" = 0D THEN
            PlndDispDateColor := TRUE;
    end;

    trigger OnOpenPage();
    begin
        RESET;
        SETFILTER(No, '<>%1&<>%2', 'ECBOUBT00004', 'BOICHAR00014');
    end;

    var
        POAutomation: Codeunit "PO Automation";
        SalesLin: Record "Sales Line";
        SchdlLin: Record Schedule2;
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        ItemGRec: Record Item;
        GLAccntGRec: Record "G/L Account";
        CurrExchRate: Record "Currency Exchange Rate";
        Vendor: Record Vendor;
        "No. Of Order": Integer;
        PPSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        MOQ_Temp: Decimal;
        Orders_List: Text;
        LeadTimeColor: Boolean;
        ScheduleItemsText: Label 'Schedule Line Items';
        ScheduleItemsColor: Boolean;
        PlndDispDateColor: Boolean;
        PlndDispDateText: Label 'No Plan Date';
        LeadTimeColorText: Label 'Items Dont Have Lead Time';
        TotalItems: Label '"Total : "';
        SHowBattNChargr: Boolean;

    [LineStart(2522)]
    procedure Calc_Order_Qty(ItemNo: Code[30]; Quantity: Decimal) Order_Qty: Decimal;
    var
        ITEM: Record Item;
        MOQ_Temp: Decimal;
    begin
        //Added by Pranavi to reset the order quantity.this effects when MOQ,EFF_MOQ,SPQ not defined in item card.
        Order_Qty := Quantity;
        IF ITEM.GET(ItemNo) THEN BEGIN
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
    end;
}

