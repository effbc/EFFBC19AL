report 50040 "Period wise Item Cost (12 Mnt)"
{
    // version Cal1.0

    DefaultLayout = RDLC;
    RDLCLayout = './Period wise Item Cost (12 Mnt).rdlc';

    dataset
    {
        dataitem("Production BOM Header"; "Production BOM Header")
        {
            RequestFilterFields = "No.";
            column(Period_Wise_item_Cost_s_In_BOMCaption; Period_Wise_item_Cost_s_In_BOMCaptionLbl)
            {
            }
            column(Production_BOM_Header_No_; "No.")
            {
            }
            dataitem("Production BOM Line"; "Production BOM Line")
            {
                DataItemLink = Production BOM No.=FIELD(No.);
                DataItemTableView = SORTING(Production BOM No., Version Code, Line No.);
                column(Period_1__1_; Period[1] [1])
                {
                }
                column(Period_1__2_; Period[1] [2])
                {
                }
                column(Period_2__1_; Period[2] [1])
                {
                }
                column(Period_2__2_; Period[2] [2])
                {
                }
                column(Period_3__1_; Period[3] [1])
                {
                }
                column(Period_3__2_; Period[3] [2])
                {
                }
                column(Period_4__2_; Period[4] [2])
                {
                }
                column(Period_4__1_; Period[4] [1])
                {
                }
                column(Period_5__1_; Period[5] [1])
                {
                }
                column(Period_5__2_; Period[5] [2])
                {
                }
                column(Period_6__1_; Period[6] [1])
                {
                }
                column(Period_6__2_; Period[6] [2])
                {
                }
                column(Period_7__2_; Period[7] [2])
                {
                }
                column(Period_7__1_; Period[7] [1])
                {
                }
                column(Period_8__1_; Period[8] [1])
                {
                }
                column(Period_8__2_; Period[8] [2])
                {
                }
                column(Period_9__1_; Period[9] [1])
                {
                }
                column(Period_9__2_; Period[9] [2])
                {
                }
                column(Period_10__2_; Period[10] [2])
                {
                }
                column(Period_10__1_; Period[10] [1])
                {
                }
                column(Period_11__1_; Period[11] [1])
                {
                }
                column(Period_11__2_; Period[11] [2])
                {
                }
                column(Period_12__1_; Period[12] [1])
                {
                }
                column(Period_12__2_; Period[12] [2])
                {
                }
                column(Production_BOM_Line__No__; "No.")
                {
                }
                column(Production_BOM_Line__Production_BOM_Line__Description; "Production BOM Line".Description)
                {
                }
                column(Production_BOM_Line__No___Control1000000000; "No.")
                {
                }
                column(Production_BOM_Line__Avg_Cost_; "Avg Cost")
                {
                }
                column(Period_cost__1_; "Period cost"[1])
                {
                }
                column(Period_cost__2_; "Period cost"[2])
                {
                }
                column(Period_cost__3_; "Period cost"[3])
                {
                }
                column(Period_cost__4_; "Period cost"[4])
                {
                }
                column(Period_cost__5_; "Period cost"[5])
                {
                }
                column(Period_cost__6_; "Period cost"[6])
                {
                }
                column(Period_cost__7_; "Period cost"[7])
                {
                }
                column(Period_cost__8_; "Period cost"[8])
                {
                }
                column(Period_cost__9_; "Period cost"[9])
                {
                }
                column(Period_cost__10_; "Period cost"[10])
                {
                }
                column(Period_cost__11_; "Period cost"[11])
                {
                }
                column(Period_cost__12_; "Period cost"[12])
                {
                }
                column(Production_BOM_Line__Production_BOM_Line__Description_Control1000000074; "Production BOM Line".Description)
                {
                }
                column(TOTPRDCOST_12_; TOTPRDCOST[12])
                {
                }
                column(TOTPRDCOST_11_; TOTPRDCOST[11])
                {
                }
                column(TOTPRDCOST_10_; TOTPRDCOST[10])
                {
                }
                column(TOTPRDCOST_9_; TOTPRDCOST[9])
                {
                }
                column(TOTPRDCOST_8_; TOTPRDCOST[8])
                {
                }
                column(TOTPRDCOST_1_; TOTPRDCOST[1])
                {
                }
                column(TOTPRDCOST_7_; TOTPRDCOST[7])
                {
                }
                column(TOTPRDCOST_6_; TOTPRDCOST[6])
                {
                }
                column(TOTPRDCOST_5_; TOTPRDCOST[5])
                {
                }
                column(TOTPRDCOST_4_; TOTPRDCOST[4])
                {
                }
                column(TOTPRDCOST_3_; TOTPRDCOST[3])
                {
                }
                column(TOTPRDCOST_2_; TOTPRDCOST[2])
                {
                }
                column(Production_BOM_Header___No__; "Production BOM Header"."No.")
                {
                }
                column(Production_BOM_Header__Description; "Production BOM Header".Description)
                {
                }
                column(TOTPRODAVGCOST; TOTPRODAVGCOST)
                {
                }
                column(Production_BOM_Line__No___Control1000000000Caption; FIELDCAPTION("No."))
                {
                }
                column(Production_BOM_Line__Avg_Cost_Caption; FIELDCAPTION("Avg Cost"))
                {
                }
                column(DescriptionCaption; DescriptionCaptionLbl)
                {
                }
                column(Production_BOM_Line_Production_BOM_No_; "Production BOM No.")
                {
                }
                column(Production_BOM_Line_Version_Code; "Version Code")
                {
                }
                column(Production_BOM_Line_Line_No_; "Line No.")
                {
                }
                dataitem("<Production BOM Line1>"; "Production BOM Line")
                {
                    DataItemLink = Production BOM No.=FIELD(No.);
                    DataItemTableView = SORTING(Tot Avg Cost) ORDER(Descending);
                    column(Period_12__1__Control1000000092; Period[12] [1])
                    {
                    }
                    column(Period_12__2__Control1000000093; Period[12] [2])
                    {
                    }
                    column(Period_11__1__Control1000000094; Period[11] [1])
                    {
                    }
                    column(Period_11__2__Control1000000095; Period[11] [2])
                    {
                    }
                    column(Period_10__2__Control1000000096; Period[10] [2])
                    {
                    }
                    column(Period_10__1__Control1000000097; Period[10] [1])
                    {
                    }
                    column(Period_9__1__Control1000000098; Period[9] [1])
                    {
                    }
                    column(Period_9__2__Control1000000099; Period[9] [2])
                    {
                    }
                    column(Period_8__1__Control1000000100; Period[8] [1])
                    {
                    }
                    column(Period_8__2__Control1000000101; Period[8] [2])
                    {
                    }
                    column(Period_7__2__Control1000000102; Period[7] [2])
                    {
                    }
                    column(Period_7__1__Control1000000103; Period[7] [1])
                    {
                    }
                    column(Period_6__1__Control1000000104; Period[6] [1])
                    {
                    }
                    column(Period_6__2__Control1000000105; Period[6] [2])
                    {
                    }
                    column(Period_5__1__Control1000000106; Period[5] [1])
                    {
                    }
                    column(Period_5__2__Control1000000107; Period[5] [2])
                    {
                    }
                    column(Period_4__2__Control1000000134; Period[4] [2])
                    {
                    }
                    column(Period_4__1__Control1000000135; Period[4] [1])
                    {
                    }
                    column(Period_3__1__Control1000000136; Period[3] [1])
                    {
                    }
                    column(Period_3__2__Control1000000137; Period[3] [2])
                    {
                    }
                    column(Period_2__1__Control1000000138; Period[2] [1])
                    {
                    }
                    column(Period_2__2__Control1000000139; Period[2] [2])
                    {
                    }
                    column(Period_1__1__Control1000000140; Period[1] [1])
                    {
                    }
                    column(Period_1__2__Control1000000141; Period[1] [2])
                    {
                    }
                    column(TOTPERCOST_12_; TOTPERCOST[12])
                    {
                    }
                    column(TOTPERCOST_11_; TOTPERCOST[11])
                    {
                    }
                    column(TOTPERCOST_10_; TOTPERCOST[10])
                    {
                    }
                    column(TOTPERCOST_9_; TOTPERCOST[9])
                    {
                    }
                    column(TOTPERCOST_8_; TOTPERCOST[8])
                    {
                    }
                    column(TOTPERCOST_7_; TOTPERCOST[7])
                    {
                    }
                    column(TOTPERCOST_6_; TOTPERCOST[6])
                    {
                    }
                    column(TOTPERCOST_5_; TOTPERCOST[5])
                    {
                    }
                    column(TOTPERCOST_4_; TOTPERCOST[4])
                    {
                    }
                    column(TOTPERCOST_3_; TOTPERCOST[3])
                    {
                    }
                    column(TOTPERCOST_2_; TOTPERCOST[2])
                    {
                    }
                    column(TOTPERCOST_1_; TOTPERCOST[1])
                    {
                    }
                    column(Production_BOM_Line___No__; "Production BOM Line"."No.")
                    {
                    }
                    column(TOTAVGCOST; TOTAVGCOST)
                    {
                    }
                    column(Production_BOM_Line__Description; "Production BOM Line".Description)
                    {
                    }
                    column(Item_No_Caption; Item_No_CaptionLbl)
                    {
                    }
                    column(Unit_CostCaption; Unit_CostCaptionLbl)
                    {
                    }
                    column(DescriptionCaption_Control1000000011; DescriptionCaption_Control1000000011Lbl)
                    {
                    }
                    column(QTYCaption; QTYCaptionLbl)
                    {
                    }
                    column(Total_CostCaption; Total_CostCaptionLbl)
                    {
                    }
                    column(Production_BOM_Line1__Production_BOM_No_; "Production BOM No.")
                    {
                    }
                    column(Production_BOM_Line1__Version_Code; "Version Code")
                    {
                    }
                    column(Production_BOM_Line1__Line_No_; "Line No.")
                    {
                    }
                    column(Production_BOM_Line1__No_; "No.")
                    {
                    }
                    dataitem("Purch. Rcpt. Line"; "Purch. Rcpt. Line")
                    {
                        DataItemLink = No.=FIELD(No.);
                        DataItemTableView = SORTING(No.) WHERE(Type = CONST(Item), Quantity = FILTER(> 0));
                        column(Production_BOM_Line1____No__; "<Production BOM Line1>"."No.")
                        {
                        }
                        column(Production_BOM_Line1___Description; "<Production BOM Line1>".Description)
                        {
                        }
                        column(UC; UC)
                        {
                        }
                        column(Period_cost__12__Control1000000142; "Period cost"[12])
                        {
                        }
                        column(Period_cost__11__Control1000000143; "Period cost"[11])
                        {
                        }
                        column(Period_cost__10__Control1000000144; "Period cost"[10])
                        {
                        }
                        column(Period_cost__9__Control1000000145; "Period cost"[9])
                        {
                        }
                        column(Period_cost__8__Control1000000146; "Period cost"[8])
                        {
                        }
                        column(Period_cost__7__Control1000000147; "Period cost"[7])
                        {
                        }
                        column(Period_cost__6__Control1000000148; "Period cost"[6])
                        {
                        }
                        column(Period_cost__5__Control1000000149; "Period cost"[5])
                        {
                        }
                        column(Period_cost__4__Control1000000150; "Period cost"[4])
                        {
                        }
                        column(Period_cost__3__Control1000000151; "Period cost"[3])
                        {
                        }
                        column(Period_cost__2__Control1000000152; "Period cost"[2])
                        {
                        }
                        column(Period_cost__1__Control1000000153; "Period cost"[1])
                        {
                        }
                        column(Production_BOM_Line1___Quantity; "<Production BOM Line1>".Quantity)
                        {
                        }
                        column(TOTCOST; TOTCOST)
                        {
                        }
                        column(Purch__Rcpt__Line_Document_No_; "Document No.")
                        {
                        }
                        column(Purch__Rcpt__Line_Line_No_; "Line No.")
                        {
                        }
                        column(Purch__Rcpt__Line_No_; "No.")
                        {
                        }

                        trigger OnAfterGetRecord();
                        begin
                            FOR I := 1 TO 12 DO
                                "Period cost"[I] := 0;
                            I := 1;
                            FOR I := 1 TO 12
                            DO BEGIN
                                IF Period[I] [1] > Sdate THEN BEGIN
                                    "Purch. Rcpt. Line".SETRANGE("Purch. Rcpt. Line"."Document date", Period[I] [1], Period[I] [2]);
                                    item := "Purch. Rcpt. Line".Description;
                                    IF "Purch. Rcpt. Line".FIND('+') THEN BEGIN
                                        PIL.SETCURRENTKEY(PIL.Type, PIL."No.", PIL."Variant Code");
                                        PIL.SETRANGE(PIL."No.", "Purch. Rcpt. Line"."No.");
                                        PIL.SETRANGE(PIL."Buy-from Vendor No.", "Purch. Rcpt. Line"."Buy-from Vendor No.");
                                        PIL.SETRANGE(PIL.Quantity, "Purch. Rcpt. Line".Quantity);
                                        // PIL.SETRANGE(PIL."Document Date",Period[I][1],Period[I][2]);
                                        cost := 0;
                                        IF PIL.FIND('+') THEN BEGIN

                                            "Period cost"[I] := "<Production BOM Line1>".Quantity * (PIL."Amount To Vendor" / PIL.Quantity);
                                            cost := PIL."Amount To Vendor" / PIL.Quantity;
                                            TOTPERCOST[I] += "Period cost"[I];
                                        END ELSE
                                            IF I > 2 THEN
                                                "Period cost"[I] := "Period cost"[I - 1];
                                    END;
                                    IF (("Period cost"[I] = 0) OR (cost = 0)) AND (I > 2) THEN BEGIN
                                        "Period cost"[I] := "Period cost"[I - 1];
                                        TOTPERCOST[I] += "Period cost"[I - 1];
                                    END;
                                    IF ("Period cost"[I] = 0) AND (I > 2) THEN
                                        "Period cost"[I] := "Period cost"[I - 1];
                                END;
                            END;
                        end;
                    }

                    trigger OnAfterGetRecord();
                    begin
                        // TOTAVGCOST+="<Production BOM Line1>".Quantity*TOTCOST;
                    end;
                }

                trigger OnAfterGetRecord();
                begin
                    ITEM1.SETRANGE(ITEM1."No.", "Production BOM Line"."No.");
                    item := "Production BOM Line"."No.";
                    IF ITEM1.FIND('-') THEN
                        PGC := ITEM1."Product Group Code";
                    IF (PGC <> 'FPRODUCT') AND (PGC <> 'CPCB') THEN BEGIN
                        FOR I := 1 TO 12 DO
                            "Period cost"[I] := 0;
                    END;
                    FOR I := 1 TO 12
                    DO BEGIN
                        IF Period[I] [1] > Sdate THEN BEGIN
                            PRL.SETCURRENTKEY(PRL."No.");
                            PRL.SETRANGE(PRL."No.", "Production BOM Line"."No.");
                            PRL.SETRANGE(PRL."Document date", Period[I] [1], Period[I] [2]);
                            item := "Purch. Rcpt. Line".Description;
                            IF PRL.FIND('-') THEN BEGIN
                                PIL.SETCURRENTKEY(PIL.Type, PIL."No.", PIL."Variant Code");
                                PIL.SETRANGE(PIL."No.", PRL."No.");
                                PIL.SETRANGE(PIL."Buy-from Vendor No.", PRL."Buy-from Vendor No.");
                                PIL.SETRANGE(PIL.Quantity, PRL.Quantity);
                                IF PIL.FIND('+') THEN BEGIN
                                    IF (PIL."Amount To Vendor" / PIL.Quantity) > 10000 THEN
                                        MESSAGE(PIL."Document No.");
                                    "Period cost"[I] := PIL."Amount To Vendor" / PIL.Quantity;
                                    cost := PIL."Amount To Vendor" / PIL.Quantity;
                                    TOTPRDCOST[I] += "Production BOM Line".Quantity * "Period cost"[I];
                                END ELSE
                                    IF I > 2 THEN BEGIN

                                        "Period cost"[I] := "Period cost"[I - 1];
                                        //   IF ("Period cost"[I])>10000 THEN
                                        //      MESSAGE('INV-FAULT');

                                        TOTPRDCOST[I] += "Production BOM Line".Quantity * "Period cost"[I];
                                    END;
                            END ELSE
                                IF ("Period cost"[I] = 0) AND (I > 2) THEN BEGIN
                                    "Period cost"[I] := "Period cost"[I - 1];
                                    TOTPRDCOST[I] += "Production BOM Line".Quantity * "Period cost"[I];
                                    // IF ("Period cost"[I])>10000 THEN
                                    //    MESSAGE('RCPT-FAULT');

                                END;
                        END;
                        IF ("Period cost"[I] = 0) AND (I > 1) THEN BEGIN
                            "Period cost"[I] := "Period cost"[I - 1];
                            TOTPRDCOST[I] += "Production BOM Line".Quantity * "Period cost"[I - 1];
                            //  IF ("Period cost"[I])>10000 THEN
                            //     MESSAGE('FINAL-FAULT');

                        END;
                    END;
                    /*
                    IF ("Period cost"[I]=0)   THEN
                    BEGIN
                      "Period cost"[I]:="Period cost"[I-1];
                      TOTPRDCOST[I]+="Period cost"[I-1];
                    END;
                     */
                    //END;
                    FOR I := 1 TO 12
                    DO
                        TOTPERCOST[I] := 0;
                    TOTAVGCOST := 0;

                end;

                trigger OnPreDataItem();
                begin
                    //CurrReport.BREAK;
                end;
            }
        }
        dataitem("Integer"; "Integer")
        {
            column(BOI_j_1_; BOI[j - 1])
            {
            }
            column(item; item)
            {
            }
            column(UC_Control1000000077; UC)
            {
            }
            column(Period_cost__12__Control1000000078; "Period cost"[12])
            {
            }
            column(Period_cost__11__Control1000000079; "Period cost"[11])
            {
            }
            column(Period_cost__10__Control1000000080; "Period cost"[10])
            {
            }
            column(Period_cost__9__Control1000000081; "Period cost"[9])
            {
            }
            column(Period_cost__8__Control1000000082; "Period cost"[8])
            {
            }
            column(Period_cost__7__Control1000000083; "Period cost"[7])
            {
            }
            column(Period_cost__6__Control1000000110; "Period cost"[6])
            {
            }
            column(Period_cost__5__Control1000000111; "Period cost"[5])
            {
            }
            column(Period_cost__4__Control1000000112; "Period cost"[4])
            {
            }
            column(Period_cost__3__Control1000000113; "Period cost"[3])
            {
            }
            column(Period_cost__2__Control1000000114; "Period cost"[2])
            {
            }
            column(Period_cost__1__Control1000000115; "Period cost"[1])
            {
            }
            column(BOI_QTY_j_1_; BOI_QTY[j - 1])
            {
            }
            column(TOTCOST_Control1000000117; TOTCOST)
            {
            }
            column(TOTPRDCOST_12__Control1000000118; TOTPRDCOST[12])
            {
            }
            column(TOTPRDCOST_11__Control1000000119; TOTPRDCOST[11])
            {
            }
            column(TOTPRDCOST_10__Control1000000120; TOTPRDCOST[10])
            {
            }
            column(TOTPRDCOST_9__Control1000000121; TOTPRDCOST[9])
            {
            }
            column(TOTPRDCOST_8__Control1000000122; TOTPRDCOST[8])
            {
            }
            column(TOTPRDCOST_1__Control1000000123; TOTPRDCOST[1])
            {
            }
            column(TOTPRDCOST_7__Control1000000124; TOTPRDCOST[7])
            {
            }
            column(TOTPRDCOST_6__Control1000000125; TOTPRDCOST[6])
            {
            }
            column(TOTPRDCOST_5__Control1000000126; TOTPRDCOST[5])
            {
            }
            column(TOTPRDCOST_4__Control1000000127; TOTPRDCOST[4])
            {
            }
            column(TOTPRDCOST_3__Control1000000128; TOTPRDCOST[3])
            {
            }
            column(TOTPRDCOST_2__Control1000000129; TOTPRDCOST[2])
            {
            }
            column(Production_BOM_Header___No___Control1000000130; "Production BOM Header"."No.")
            {
            }
            column(Production_BOM_Header__Description_Control1000000131; "Production BOM Header".Description)
            {
            }
            column(TOTPRODAVGCOST_Control1000000132; TOTPRODAVGCOST)
            {
            }
            column(Integer_Number; Number)
            {
            }

            trigger OnAfterGetRecord();
            begin
                FOR I := 1 TO 12 DO
                    "Period cost"[I] := 0;
                IF j <= l THEN BEGIN
                    FOR I := 1 TO 12
                    DO BEGIN

                        IF Period[I] [1] > Sdate THEN BEGIN

                            PRL.SETRANGE(PRL."No.", BOI[j]);
                            PRL.SETRANGE(PRL."Document date", Period[I] [1], Period[I] [2]);
                            item := "Purch. Rcpt. Line".Description;
                            IF PRL.FIND('-') THEN BEGIN
                                PIL.SETRANGE(PIL."No.", PRL."No.");
                                PIL.SETRANGE(PIL."Buy-from Vendor No.", PRL."Buy-from Vendor No.");
                                PIL.SETRANGE(PIL.Quantity, PRL.Quantity);
                                IF PIL.FIND('+') THEN BEGIN
                                    IF (PIL."Amount To Vendor" > 0) AND (PIL.Quantity > 0) THEN BEGIN
                                        "Period cost"[I] := BOI_QTY[j] * (PIL."Amount To Vendor" / PRL.Quantity);
                                        cost := PIL."Amount To Vendor" / PIL.Quantity;
                                        TOTPRDCOST[I] += "Period cost"[I];
                                    END ELSE
                                        MESSAGE('%1,%2', I, j);

                                END ELSE
                                    // "Period cost"[I]:="Period cost"[I-1];
                                    IF ("Period cost"[I] = 0) AND (I > 1) THEN BEGIN
                                        "Period cost"[I] := "Period cost"[I - 1];
                                        TOTPRDCOST[I] += "Period cost"[I - 1];
                                    END ELSE
                                        IF ("Period cost"[I] = 0) THEN BEGIN
                                            // "Period cost"[I]:="Period cost"[I-1];
                                            // TOTPRDCOST[I]+="Period cost"[I-1];
                                        END;
                            END ELSE
                                IF ("Period cost"[I] = 0) AND (I > 1) THEN BEGIN
                                    "Period cost"[I] := "Period cost"[I - 1];
                                    TOTPRDCOST[I] += "Period cost"[I - 1];
                                END;

                        END;
                    END;
                END ELSE
                    CurrReport.BREAK;
            end;

            trigger OnPreDataItem();
            begin
                //CurrReport.BREAK;
                FOR K := 1 TO 4 DO BEGIN
                    IF BOI_QTY[K] > 0 THEN
                        l := K;
                END;
                j := 1;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport();
    begin
        //NextDate := CALCDATE(Duration,TODAY);
        Sdate := 040107D;
        "Start date" := WORKDATE - 365;
        Period[1] [1] := "Start date";
        FOR I := 1 TO 12
        DO BEGIN
            Period[I] [2] := CALCDATE(DF, Period[I] [1]);
            IF I < 12 THEN
                Period[I + 1] [1] := Period[I] [2];
        END;

        IF Excel THEN BEGIN
            CLEAR(TempExcelbuffer);
            TempExcelbuffer.DELETEALL;
        END;
    end;

    var
        Duration: DateFormula;
        "Start date": Date;
        PRH: Record "Purch. Rcpt. Header";
        PRL: Record "Purch. Rcpt. Line";
        PIL: Record "Purch. Inv. Line";
        QTY: Decimal;
        Temp: Date;
        Period: array[12, 2] of Date;
        DF: DateFormula;
        I: Integer;
        "Period cost": array[12] of Decimal;
        Sdate: Date;
        item: Text[50];
        cost: Decimal;
        "MAX DATE": Date;
        ITEM1: Record Item;
        PGC: Code[10];
        TOTPERCOST: array[12] of Decimal;
        TOTPRDCOST: array[12] of Decimal;
        TOTAVGCOST: Decimal;
        TOTPRODAVGCOST: Decimal;
        Item2: Record Item;
        UC: Decimal;
        TOTCOST: Decimal;
        BOI: array[4] of Code[20];
        BOI_QTY: array[4] of Integer;
        j: Integer;
        K: Integer;
        l: Integer;
        Choice: Option Detail,Brief;
        TempExcelbuffer: Record "Excel Buffer";
        Row: Integer;
        Excel: Boolean;
        Period_Wise_item_Cost_s_In_BOMCaptionLbl: Label 'Period Wise item Cost''s In BOM';
        DescriptionCaptionLbl: Label 'Description';
        Item_No_CaptionLbl: Label 'Item No.';
        Unit_CostCaptionLbl: Label 'Unit Cost';
        DescriptionCaption_Control1000000011Lbl: Label 'Description';
        QTYCaptionLbl: Label 'QTY';
        Total_CostCaptionLbl: Label 'Total Cost';

    [LineStart(3203)]
    procedure Entercell(RowNo: Integer; ColumnNo: Integer; CellValue: Text[1000]; bold: Boolean);
    begin
        TempExcelbuffer.INIT;
        TempExcelbuffer.VALIDATE("Row No.", RowNo);
        TempExcelbuffer.VALIDATE("Column No.", ColumnNo);
        TempExcelbuffer."Cell Value as Text" := CellValue;
        TempExcelbuffer.Bold := bold;

        TempExcelbuffer.INSERT;
    end;

    [LineStart(3212)]
    procedure EnterHeadings(RowNo: Integer; ColumnNo: Integer; CellValue: Text[100]; Bold: Boolean);
    begin
        TempExcelbuffer.INIT;
        TempExcelbuffer.VALIDATE("Row No.", RowNo);
        TempExcelbuffer.VALIDATE("Column No.", ColumnNo);
        TempExcelbuffer."Cell Value as Text" := FORMAT(CellValue);
        TempExcelbuffer.Bold := Bold;

        TempExcelbuffer.Formula := '';
        TempExcelbuffer.INSERT;
    end;

    [LineStart(3222)]
    procedure "Entercell New"();
    begin
    end;
}

