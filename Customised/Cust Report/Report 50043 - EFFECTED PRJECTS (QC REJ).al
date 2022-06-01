report 50043 "EFFECTED PRJECTS (QC REJ)"
{
    //  LTC09RTU01
    DefaultLayout = RDLC;
    RDLCLayout = './EFFECTED PRJECTS (QC REJ).rdlc';

    EnableExternalImages = true;

    dataset
    {
        dataitem("Inspection Receipt Header"; "Inspection Receipt Header")
        {

            trigger OnAfterGetRecord();
            begin
                "G/L".GET;

                ITEM_STOCK := ITEML_STOCK_CALC.ITEM_STOCK("Inspection Receipt Header"."Item No.");

                MAT_ISSUE_TRACKING.SETCURRENTKEY("Item No.", "Location Code", "Lot No.", "Serial No.", "Appl.-to Item Entry");
                MAT_ISSUE_TRACKING.SETRANGE("Item No.", "Inspection Receipt Header"."Item No.");
                MAT_ISSUE_TRACKING.SETRANGE("Location Code", 'STR');
                MAT_ISSUE_TRACKING.CALCSUMS(MAT_ISSUE_TRACKING.Quantity);
                ITEM_STOCK := ITEM_STOCK - MAT_ISSUE_TRACKING.Quantity;

                REJECTED_QTY := "Inspection Receipt Header"."Qty. Rejected";
                ITEM_STOCK += "Inspection Receipt Header"."Qty. Accepted";

                Prod_Order_Component.SETCURRENTKEY("Production Plan Date", "Item No.", "Prod. Order No.");
                Prod_Order_Component.SETFILTER(Prod_Order_Component."Production Plan Date", '>=%1', "G/L"."Allow Posting To");
                Prod_Order_Component.SETRANGE(Prod_Order_Component."Item No.", "Inspection Receipt Header"."Item No.");
                IF Prod_Order_Component.FINDSET THEN
                    Prod_Order_Component.CALCFIELDS("Qty. in Material Issues", "Qty. in Posted Material Issues");
                REPEAT
                    REQUIRED_QTY := (Prod_Order_Component."Expected Quantity" - (Prod_Order_Component."Qty. in Material Issues" +
                                                                             Prod_Order_Component."Qty. in Posted Material Issues"));
                    IF REQUIRED_QTY < ITEM_STOCK THEN
                        ITEM_STOCK := ITEM_STOCK - REQUIRED_QTY
                    ELSE BEGIN
                        IF REQUIRED_QTY < REJECTED_QTY THEN BEGIN
                            REJECTED_QTY -= REQUIRED_QTY;
                            IF COPYSTR(PREV_PROD_ORDER, 1, 8) <> COPYSTR(Prod_Order_Component."Prod. Order No.", 1, 8) THEN BEGIN
                                IF I > 1 THEN BEGIN
                                    PRODUCTION_ORDER_CODES[I] [2] := PREV_PROD_ORDER;
                                    PRODUCTION_DATES[I] [2] := PREV_PROD_PLAN_DATE;
                                END;
                                I += 1;
                                PRODUCTION_ORDER_CODES[I] [1] := Prod_Order_Component."Prod. Order No.";
                                PRODUCTION_DATES[I] [1] := Prod_Order_Component."Production Plan Date";
                                PREV_PROD_ORDER := Prod_Order_Component."Prod. Order No.";
                                PREV_PROD_PLAN_DATE := Prod_Order_Component."Production Plan Date";
                            END ELSE BEGIN
                                PREV_PROD_ORDER := Prod_Order_Component."Prod. Order No.";
                                PREV_PROD_PLAN_DATE := Prod_Order_Component."Production Plan Date";
                            END;
                        END ELSE
                            EXIT;

                    END;
                UNTIL Prod_Order_Component.NEXT = 0;
            end;

            trigger OnPreDataItem();
            begin
                QC_SETUP.GET;
                "Inspection Receipt Header".SETRANGE("Inspection Receipt Header"."No.", QC_SETUP."Rejected IR No.");
            end;
        }
        dataitem("Integer"; "Integer")
        {
            DataItemTableView = SORTING(Number);
            column(PROD_ORDER_GRP; PROD_ORDER_GRP)
            {
            }
            column(SALE_ORDER; SALE_ORDER)
            {
            }
            column(CUSTOMER_NAME; CUSTOMER_NAME)
            {
            }
            column(PRODUCTION_DATES_TXT; PRODUCTION_DATES_TXT)
            {
            }
            column(PRODUCT_TYPE; PRODUCT_TYPE)
            {
            }
            column(PRODUCTS_QTY; PRODUCTS_QTY)
            {
            }
            column(EFFECTED_PROJECTSCaption; EFFECTED_PROJECTSCaptionLbl)
            {
            }
            column(PROJECTSCaption; PROJECTSCaptionLbl)
            {
            }
            column(SALE_ORDERCaption; SALE_ORDERCaptionLbl)
            {
            }
            column(CUSTOMERCaption; CUSTOMERCaptionLbl)
            {
            }
            column(PLAN_DATESCaption; PLAN_DATESCaptionLbl)
            {
            }
            column(PRODUCTCaption; PRODUCTCaptionLbl)
            {
            }
            column(QTYCaption; QTYCaptionLbl)
            {
            }
            column(Integer_Number; Number)
            {
            }

            trigger OnAfterGetRecord();
            begin
                J += 1;
                IF J > I THEN
                    CurrReport.BREAK;

                //Rev01

                //Integer, Body (3) - OnPreSection()
                PROD_ORDER_GRP := '';
                SALE_ORDER := '';
                PRODUCTION_DATES_TXT := '';
                CUSTOMER_NAME := '';
                PRODUCT_TYPE := '';
                PRODUCTS_QTY := 0;
                IF ((PRODUCTION_ORDER_CODES[J] [1] <> '') AND (PRODUCTION_ORDER_CODES[J] [2] <> '')) AND
                   (PRODUCTION_ORDER_CODES[J] [1] <> PRODUCTION_ORDER_CODES[J] [2]) THEN BEGIN
                    PROD_ORDER_GRP := PRODUCTION_ORDER_CODES[J] [1] + '..' + COPYSTR(PRODUCTION_ORDER_CODES[J] [2], 9);
                    IF COPYSTR(PRODUCTION_ORDER_CODES[J] [1], STRLEN(PRODUCTION_ORDER_CODES[J] [1]) - 1) IN ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'] THEN
                        EVALUATE(FROM_QTY, COPYSTR(PRODUCTION_ORDER_CODES[J] [1], 9))
                    ELSE
                        EVALUATE(FROM_QTY, COPYSTR(PRODUCTION_ORDER_CODES[J] [1], 9, STRLEN(PRODUCTION_ORDER_CODES[J] [1]) - 9));
                    IF COPYSTR(PRODUCTION_ORDER_CODES[J] [2], STRLEN(PRODUCTION_ORDER_CODES[J] [2]) - 1) IN ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'] THEN
                        EVALUATE(TO_QTY, COPYSTR(PRODUCTION_ORDER_CODES[J] [2], 9))
                    ELSE
                        EVALUATE(FROM_QTY, COPYSTR(PRODUCTION_ORDER_CODES[J] [2], 9, STRLEN(PRODUCTION_ORDER_CODES[J] [2]) - 9));
                    PRODUCTS_QTY := TO_QTY - FROM_QTY;
                END ELSE BEGIN
                    PROD_ORDER_GRP := PRODUCTION_ORDER_CODES[J] [1];
                    PRODUCTS_QTY := 1;
                END;

                PO.RESET;
                PO.SETRANGE(PO."No.", PRODUCTION_ORDER_CODES[J] [1]);
                IF PO.FINDFIRST THEN BEGIN
                    SALE_ORDER := PO."Sales Order No.";
                    PRODUCT_TYPE := PO."Item Sub Group Code";
                END;

                SALES_HEADER.SETRANGE(SALES_HEADER."No.", SALE_ORDER);
                IF SALES_HEADER.FINDFIRST THEN BEGIN
                    IF CUSTOMER.GET(SALES_HEADER."Bill-to Customer No.") THEN
                        CUSTOMER_NAME := CUSTOMER.Name;
                END;

                IF ((PRODUCTION_DATES[J] [1] > 0D) AND (PRODUCTION_DATES[J] [2] > 0D)) AND
                   (PRODUCTION_DATES[J] [1] <> PRODUCTION_DATES[J] [2]) THEN
                    PRODUCTION_DATES_TXT := FORMAT(PRODUCTION_DATES[J] [1], 0, '<Day>-<Month Text,3>-<Year4>') + '..' +
                                          FORMAT(PRODUCTION_DATES[J] [2], 0, '<Day>-<Month Text,3>-<Year4>')
                ELSE
                    PRODUCTION_DATES_TXT := FORMAT(PRODUCTION_DATES[J] [1], 0, '<Day>-<Month Text,3>-<Year4>');

                //Integer, Body (3) - OnPreSection()
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    field("From Date"; From_Date)
                    {
                        Caption = 'From Date';
                    }
                    field("No. of Shifting Days"; Shift_Days)
                    {
                    }
                    field("Production Plan"; Prod_Plan)
                    {
                    }
                    field("Sales Line"; Sal_line)
                    {
                    }
                    field(Schedule; Sal_Sch)
                    {
                    }
                    field("Shift "; Shift)
                    {

                        trigger OnValidate();
                        begin
                            IF Shift = TRUE THEN BEGIN
                                IF (USERID = '04DI002') OR (USERID = 'SUPER') OR (USERID = '07TE024') THEN BEGIN
                                    IF Prod_Plan THEN BEGIN
                                        "Production Order".RESET;
                                        "Production Order".SETCURRENTKEY("Production Order"."Prod Start date");
                                        "Production Order".SETFILTER("Production Order"."Prod Start date", '>=%1', From_Date);
                                        "Production Order".SETRANGE("Production Order"."Change To Specified Plan Date", FALSE);
                                        IF "Production Order".FIND('-') THEN
                                            REPEAT
                                                Prod_Order_Component.RESET;
                                                Prod_Order_Component.SETCURRENTKEY(Prod_Order_Component."Prod. Order No.",
                                                                                   Prod_Order_Component."Item No.",
                                                                                   Prod_Order_Component."Material Required Day");
                                                Prod_Order_Component.SETRANGE(Prod_Order_Component."Prod. Order No.", "Production Order"."No.");
                                                IF Prod_Order_Component.FIND('-') THEN
                                                    REPEAT
                                                        IF Prod_Order_Component."Production Plan Date" > 0D THEN
                                                            Prod_Order_Component."Production Plan Date" := Prod_Order_Component."Production Plan Date" + Shift_Days
                                                        ELSE BEGIN
                                                            IF Prod_Order_Component."Material Required Day" <> 99 THEN
                                                                Prod_Order_Component."Production Plan Date" := Prod_Order_Component."Production Plan Date"
                                                            ELSE
                                                                Prod_Order_Component."Production Plan Date" := "Production Order"."Planned Dispatch Date" + Shift_Days;
                                                        END;
                                                        Prod_Order_Component.MODIFY;
                                                    UNTIL Prod_Order_Component.NEXT = 0;
                                                PO.RESET;
                                                PO.SETRANGE(PO."No.", "Production Order"."No.");
                                                IF PO.FIND('-') THEN BEGIN
                                                    SD_B := PO."Prod Start date";
                                                    IF PO."Prod Start date" > 0D THEN
                                                        PO."Prod Start date" := PO."Prod Start date" + Shift_Days;
                                                    //        po."Prod Start date"+=Shift_Days;

                                                    SD_A := PO."Prod Start date";
                                                    DD_B := PO."Planned Dispatch Date";
                                                    IF PO."Planned Dispatch Date" > 0D THEN
                                                        PO."Planned Dispatch Date" := PO."Planned Dispatch Date" + Shift_Days;

                                                    //   po."Planned Dispatch Date"+=Shift_Days;
                                                    DD_A := PO."Planned Dispatch Date";
                                                    PO."Change To Specified Plan Date" := TRUE;
                                                    PO.MODIFY;
                                                END;

                                            UNTIL "Production Order".NEXT = 0;
                                        "Production Order".RESET;
                                        "Production Order".SETCURRENTKEY("Production Order"."Prod Start date");
                                        "Production Order".SETFILTER("Production Order"."Prod Start date", '>=%1', From_Date);
                                        "Production Order".SETRANGE("Production Order"."Change To Specified Plan Date", TRUE);
                                        IF "Production Order".FIND('-') THEN
                                            REPEAT
                                                "Production Order"."Change To Specified Plan Date" := FALSE;
                                                "Production Order".MODIFY;

                                            UNTIL "Production Order".NEXT = 0;

                                    END;
                                    IF Sal_line THEN BEGIN
                                        Sales_Line.SETCURRENTKEY(Sales_Line."Material Reuired Date", Sales_Line."No.");
                                        Sales_Line.SETFILTER(Sales_Line."Material Reuired Date", '>=%1', From_Date);
                                        Sales_Line.SETRANGE(Sales_Line."Change to Specified Plan Date", FALSE);
                                        IF Sales_Line.FIND('-') THEN
                                            REPEAT
                                                Sales_Line2.RESET;
                                                Sales_Line2.SETRANGE(Sales_Line2."Document Type", Sales_Line."Document Type");
                                                Sales_Line2.SETRANGE(Sales_Line2."Document No.", Sales_Line."Document No.");
                                                Sales_Line2.SETRANGE(Sales_Line2."Line No.", Sales_Line."Line No.");
                                                IF Sales_Line2.FIND('-') THEN BEGIN
                                                    IF Sales_Line2."Material Reuired Date" > 0D THEN
                                                        Sales_Line2."Material Reuired Date" := Sales_Line2."Material Reuired Date" + Shift_Days;
                                                    Sales_Line2."Change to Specified Plan Date" := TRUE;
                                                    Sales_Line2.MODIFY;
                                                END;
                                            UNTIL Sales_Line.NEXT = 0;
                                        Sales_Line.SETCURRENTKEY(Sales_Line."Material Reuired Date", Sales_Line."No.");
                                        Sales_Line.SETFILTER(Sales_Line."Material Reuired Date", '>=%1', From_Date);
                                        Sales_Line.SETRANGE(Sales_Line."Change to Specified Plan Date", TRUE);
                                        IF Sales_Line.FIND('-') THEN
                                            REPEAT
                                                Sales_Line."Change to Specified Plan Date" := FALSE;
                                                Sales_Line.MODIFY;
                                            UNTIL Sales_Line.NEXT = 0;
                                    END;
                                    IF Sal_Sch THEN BEGIN
                                        Sal_Schedule.SETCURRENTKEY(Sal_Schedule."Material Required Date", Sal_Schedule."No.");
                                        Sal_Schedule.SETFILTER(Sal_Schedule."Material Required Date", '>=%1', From_Date);
                                        Sal_Schedule.SETRANGE(Sal_Schedule."Change To Specified Plan Date", FALSE);
                                        I := 1;
                                        MESSAGE(FORMAT(Sal_Schedule.COUNT));
                                        IF Sal_Schedule.FIND('-') THEN
                                            REPEAT
                                                /*  Temp_Order:=Sal_Schedule."Document No.";
                                                  Temp_Item:=Sal_Schedule.Description;
                                                  Temp_Line_No:=Sal_Schedule."Document Line No.";*/
                                                Sal_Schedule2.RESET;
                                                Sal_Schedule2.SETRANGE(Sal_Schedule2."Document Type", Sal_Schedule."Document Type");
                                                Sal_Schedule2.SETRANGE(Sal_Schedule2."Document No.", Sal_Schedule."Document No.");
                                                Sal_Schedule2.SETRANGE(Sal_Schedule2."Document Line No.", Sal_Schedule."Document Line No.");
                                                Sal_Schedule2.SETRANGE(Sal_Schedule2."Line No.", Sal_Schedule."Line No.");
                                                IF Sal_Schedule2.FIND('-') THEN BEGIN
                                                    SD_B := Sal_Schedule2."Material Required Date";
                                                    IF Sal_Schedule2."Material Required Date" > 0D THEN BEGIN
                                                        Sal_Schedule2."Material Required Date" := Sal_Schedule2."Material Required Date" + Shift_Days;
                                                        SD_A := Sal_Schedule2."Material Required Date";
                                                    END ELSE BEGIN
                                                        /*  MESSAGE(Sal_Schedule2."Document No.");
                                                          MESSAGE(FORMAT(Sal_Schedule2."Document Line No."));
                                                          MESSAGE(FORMAT(Sal_Schedule2."Line No."));
                                                          MESSAGE(Sal_Schedule2."No."); */
                                                    END;
                                                    Sal_Schedule2."Change To Specified Plan Date" := TRUE;
                                                    Sal_Schedule2.MODIFY;
                                                END;

                                            UNTIL Sal_Schedule.NEXT = 0;

                                        Sal_Schedule.SETCURRENTKEY(Sal_Schedule."Material Required Date", Sal_Schedule."No.");
                                        Sal_Schedule.SETFILTER(Sal_Schedule."Material Required Date", '>=%1', From_Date);
                                        Sal_Schedule.SETRANGE(Sal_Schedule."Change To Specified Plan Date", TRUE);
                                        IF Sal_Schedule.FIND('-') THEN
                                            REPEAT

                                                Sal_Schedule."Change To Specified Plan Date" := FALSE;
                                                Sal_Schedule.MODIFY;
                                            UNTIL Sal_Schedule.NEXT = 0;
                                    END;
                                    MESSAGE('Production Plan Updation Was Completed');
                                END ELSE
                                    ERROR('YOU DO NOT HAVE PERMISSION');
                            END;

                        end;
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        Prod_Order_Component: Record "Prod. Order Component";
        PRODUCTION_ORDER_CODES: array[100, 2] of Code[20];
        PRODUCTION_DATES: array[100, 2] of Date;
        From_Date: Date;
        Shift_Days: Integer;
        Prod_Plan: Boolean;
        "Production Order": Record "Production Order";
        PO: Record "Production Order";
        SD_B: Date;
        SD_A: Date;
        DD_B: Date;
        DD_A: Date;
        Sal_line: Boolean;
        Sales_Line: Record "Sales Line";
        Sales_Line2: Record "Sales Line";
        Sal_Sch: Boolean;
        Sal_Schedule: Record Schedule2;
        I: Integer;
        Sal_Schedule2: Record Schedule2;
        "G/L": Record "General Ledger Setup";
        ITEM_STOCK: Decimal;
        ITEML_STOCK_CALC: Codeunit "item stock at stores1";
        MAT_ISSUE_TRACKING: Record "Mat.Issue Track. Specification";
        REQUIRED_QTY: Decimal;
        REJECTED_QTY: Decimal;
        PREV_PROD_ORDER: Code[20];
        J: Integer;
        SALES_HEADER: Record "Sales Header";
        CUSTOMER_NAME: Text[50];
        PROD_ORDER_GRP: Text[50];
        SALE_ORDER: Code[20];
        PRODUCTION_DATES_TXT: Text[50];
        CUSTOMER: Record Customer;
        PREV_PROD_PLAN_DATE: Date;
        PRODUCT_TYPE: Code[20];
        PRODUCTS_QTY: Integer;
        FROM_QTY: Integer;
        TO_QTY: Integer;
        QC_SETUP: Record "Quality Control Setup";
        EFFECTED_PROJECTSCaptionLbl: Label 'EFFECTED PROJECTS';
        PROJECTSCaptionLbl: Label 'PROJECTS';
        SALE_ORDERCaptionLbl: Label 'SALE ORDER';
        CUSTOMERCaptionLbl: Label 'CUSTOMER';
        PLAN_DATESCaptionLbl: Label 'PLAN DATES';
        PRODUCTCaptionLbl: Label 'PRODUCT';
        QTYCaptionLbl: Label 'QTY';
        Shift: Boolean;
}

