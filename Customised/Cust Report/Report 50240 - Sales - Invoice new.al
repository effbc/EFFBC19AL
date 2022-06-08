report 50240 "Sales - Invoice new"
{
    // version NAVW13.70,NAVIN3.70.00.13,sreenivas,DIM1.0

    // Project : EFFTRONICS
    // *************************************************************************************************************************
    // SIGN Name
    // ************************************************************************************************************************
    // DIM : Resolution of Dimension Issues after Upgarding.
    // ***********************************************************************************************************************
    // Version  sign     Date       USERID    Description
    // *************************************************************************************************************************
    // 1.0      DIM      28-May-13  SAIRAM    New Code has been added for the dimensions updation after upgarding.
    DefaultLayout = RDLC;
    RDLCLayout = './Sales - Invoice new.rdlc';

    Caption = 'Sales - Invoice';

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = SORTING(No.);
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
            ReqFilterHeading = 'Posted Sales Invoice';
            column(Sales_Invoice_Header_No_; "No.")
            {
            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING(Number);
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                    column(FORMAT__Sales_Invoice_Header___Posting_Date__0_4_; FORMAT("Sales Invoice Header"."Posting Date", 0, 4))
                    {
                    }
                    column(Sales_Invoice_Header___External_Document_No__; "Sales Invoice Header"."External Document No.")
                    {
                    }
                    column(Sales_Invoice_Header___Sell_to_Customer_Name_; "Sales Invoice Header"."Sell-to Customer Name")
                    {
                    }
                    column(CompanyInfo__Fax_No__; CompanyInfo."Fax No.")
                    {
                    }
                    column(CompanyAddr_2_; CompanyAddr[2])
                    {
                    }
                    column(CompanyAddr_3_; CompanyAddr[3])
                    {
                    }
                    column(CompanyAddr_1_; CompanyAddr[1])
                    {
                    }
                    column(DATE__Caption; DATE__CaptionLbl)
                    {
                    }
                    column(Bill_No_Caption; Bill_No_CaptionLbl)
                    {
                    }
                    column(E_C__Code_No__AAACE_4879Q_XM001Caption; E_C__Code_No__AAACE_4879Q_XM001CaptionLbl)
                    {
                    }
                    column(CompanyInfo__Fax_No__Caption; CompanyInfo__Fax_No__CaptionLbl)
                    {
                    }
                    column(Tin_No__28350166764Caption; Tin_No__28350166764CaptionLbl)
                    {
                    }
                    column(Ph____91_866__2466675__2493375Caption; Ph____91_866__2466675__2493375CaptionLbl)
                    {
                    }
                    column(CASH_BILLCaption; CASH_BILLCaptionLbl)
                    {
                    }
                    column(M_sCaption; M_sCaptionLbl)
                    {
                    }
                    column(EmptyStringCaption; EmptyStringCaptionLbl)
                    {
                    }
                    column(E_Mail__Info_Efftronics_comCaption; E_Mail__Info_Efftronics_comCaptionLbl)
                    {
                    }
                    column(Visit_us__www_efftronics_comCaption; Visit_us__www_efftronics_comCaptionLbl)
                    {
                    }
                    column(PageLoop_Number; Number)
                    {
                    }
                    dataitem(DimensionLoop1; "Integer")
                    {
                        DataItemLinkReference = "Sales Invoice Header";
                        DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));

                        trigger OnAfterGetRecord();
                        begin
                            //DIM1.0 Start
                            //Code Commented
                            /*
                            IF Number = 1 THEN BEGIN
                              IF NOT PostedDocDim1.FIND('-') THEN
                                CurrReport.BREAK;
                            END ELSE
                              IF NOT Continue THEN
                                CurrReport.BREAK;
                            
                            CLEAR(DimText);
                            Continue := FALSE;
                            REPEAT
                              OldDimText := DimText;
                              IF DimText = '' THEN
                                DimText := STRSUBSTNO(
                                  '%1 %2',PostedDocDim1."Dimension Code",PostedDocDim1."Dimension Value Code")
                              ELSE
                                DimText :=
                                  STRSUBSTNO(
                                    '%1, %2 %3',DimText,
                                    PostedDocDim1."Dimension Code",PostedDocDim1."Dimension Value Code");
                              IF STRLEN(DimText) > MAXSTRLEN(OldDimText) THEN BEGIN
                                DimText := OldDimText;
                                Continue := TRUE;
                                EXIT;
                              END;
                            UNTIL (PostedDocDim1.NEXT = 0);
                            */

                            IF Number = 1 THEN BEGIN
                                IF NOT DimSetEntryGRec.FIND('-') THEN
                                    CurrReport.BREAK;
                            END ELSE
                                IF NOT Continue THEN
                                    CurrReport.BREAK;

                            CLEAR(DimText);
                            Continue := FALSE;
                            REPEAT
                                OldDimText := DimText;
                                IF DimText = '' THEN
                                    DimText := STRSUBSTNO(
                                      '%1 %2', DimSetEntryGRec."Dimension Code", DimSetEntryGRec."Dimension Value Code")
                                ELSE
                                    DimText :=
                                      STRSUBSTNO(
                                        '%1, %2 %3', DimText,
                                        DimSetEntryGRec."Dimension Code", DimSetEntryGRec."Dimension Value Code");
                                IF STRLEN(DimText) > MAXSTRLEN(OldDimText) THEN BEGIN
                                    DimText := OldDimText;
                                    Continue := TRUE;
                                    EXIT;
                                END;
                            UNTIL (DimSetEntryGRec.NEXT = 0);

                            //DIM1.0 End

                        end;

                        trigger OnPreDataItem();
                        begin
                            IF NOT ShowInternalInfo THEN
                                CurrReport.BREAK;
                        end;
                    }
                    dataitem("Sales Invoice Line"; "Sales Invoice Line")
                    {
                        DataItemLink = Document No.=FIELD(No.);
                        DataItemLinkReference = "Sales Invoice Header";
                        DataItemTableView = SORTING(Document No., Line No.) WHERE(Quantity = FILTER(> 0));
                        column(d1_1_; d1[1])
                        {
                        }
                        column(tot_1__3_; tot[1] [3])
                        {
                        }
                        column(tot_1__4_; tot[1] [4])
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 2;
                        }
                        column(tot_1__5_; tot[1] [5])
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(d1_2_; d1[2])
                        {
                        }
                        column(tot_2__3_; tot[2] [3])
                        {
                        }
                        column(tot_2__4_; tot[2] [4])
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 2;
                        }
                        column(tot_2__5_; tot[2] [5])
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(d1_3_; d1[3])
                        {
                        }
                        column(tot_3__3_; tot[3] [3])
                        {
                        }
                        column(tot_3__5_; tot[3] [5])
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(tot_3__4_; tot[3] [4])
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 2;
                        }
                        column(d1_4_; d1[4])
                        {
                        }
                        column(tot_4__3_; tot[4] [3])
                        {
                        }
                        column(tot_4__4_; tot[4] [4])
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 2;
                        }
                        column(tot_4__5_; tot[4] [5])
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(d1_5_; d1[5])
                        {
                        }
                        column(tot_5__3_; tot[5] [3])
                        {
                        }
                        column(tot_5__4_; tot[5] [4])
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 2;
                        }
                        column(tot_5__5_; tot[5] [5])
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(tot_10__5_; tot[10] [5])
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(tot_9__5_; tot[9] [5])
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(tot_9__4_; tot[9] [4])
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 2;
                        }
                        column(tot_10__4_; tot[10] [4])
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 2;
                        }
                        column(tot_9__3_; tot[9] [3])
                        {
                        }
                        column(tot_10__3_; tot[10] [3])
                        {
                        }
                        column(tot_8__3_; tot[8] [3])
                        {
                        }
                        column(tot_8__5_; tot[8] [5])
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(tot_8__4_; tot[8] [4])
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 2;
                        }
                        column(tot_7__3_; tot[7] [3])
                        {
                        }
                        column(tot_7__4_; tot[7] [4])
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 2;
                        }
                        column(tot_7__5_; tot[7] [5])
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(d1_7_; d1[7])
                        {
                        }
                        column(d1_8_; d1[8])
                        {
                        }
                        column(d1_9_; d1[9])
                        {
                        }
                        column(d1_10_; d1[10])
                        {
                        }
                        column(d1_6_; d1[6])
                        {
                        }
                        column(tot_6__3_; tot[6] [3])
                        {
                        }
                        column(tot_6__4_; tot[6] [4])
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 2;
                        }
                        column(tot_6__5_; tot[6] [5])
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(FORMAT_ROUND_AMT_TOT_1_____00_; FORMAT(ROUND(AMT_TOT, 1)) + '.00')
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(ROUND_bedamt_1_; ROUND(bedamt, 1))
                        {
                        }
                        column(DataItem1280017; ROUND(LineAmt + bedamt + cessamt + ecessamt + "Sales Invoice Line"."Tax Amount" + roundoff + "Sales Invoice Line"."Charges To Customer", 1))
                        {
                        }
                        column(ROUND_LineAmt__Sales_Invoice_Line___Charges_To_Customer__1__ROUND_bedamt_1__; (ROUND(LineAmt + "Sales Invoice Line"."Charges To Customer", 1) + ROUND(bedamt, 1)))
                        {
                        }
                        column(ROUND_cessamt_1_; ROUND(cessamt, 1))
                        {
                        }
                        column(ROUND_ecessamt_1_; ROUND(ecessamt, 1))
                        {
                        }
                        column(caplabel; caplabel)
                        {
                        }
                        column(ROUND_taxamt_1_; ROUND(taxamt, 1))
                        {
                        }
                        column(caplabel1; caplabel1)
                        {
                        }
                        column(round1; round1)
                        {
                        }
                        column(bedcap____; bedcap + '%')
                        {
                        }
                        column(ROUND_vatamt_1_; ROUND(vatamt, 1))
                        {
                        }
                        column(DescriptionCaption; DescriptionCaptionLbl)
                        {
                        }
                        column(QuantityCaption; QuantityCaptionLbl)
                        {
                        }
                        column(Unit_PriceCaption; Unit_PriceCaptionLbl)
                        {
                        }
                        column(AmountCaption; AmountCaptionLbl)
                        {
                        }
                        column(Inclusive_of_all_taxes_Caption; Inclusive_of_all_taxes_CaptionLbl)
                        {
                        }
                        column(TotalCaption; TotalCaptionLbl)
                        {
                        }
                        column(B_E_D__Rate________Caption; B_E_D__Rate________CaptionLbl)
                        {
                        }
                        column(Sub_Total____Caption; Sub_Total____CaptionLbl)
                        {
                        }
                        column(E_Cess___2___on_BEDCaption; E_Cess___2___on_BEDCaptionLbl)
                        {
                        }
                        column(SHE_Cess___1___on_BEDCaption; SHE_Cess___1___on_BEDCaptionLbl)
                        {
                        }
                        column(GRAND_TOTAL___Caption; GRAND_TOTAL___CaptionLbl)
                        {
                        }
                        column(VATCaption; VATCaptionLbl)
                        {
                        }
                        column(CSTCaption; CSTCaptionLbl)
                        {
                        }
                        column(Round_offCaption; Round_offCaptionLbl)
                        {
                        }
                        column(Sales_Invoice_Line_Document_No_; "Document No.")
                        {
                        }
                        column(Sales_Invoice_Line_Line_No_; "Line No.")
                        {
                        }
                        dataitem(DimensionLoop2; "Integer")
                        {
                            DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));

                            trigger OnAfterGetRecord();
                            begin
                                //DIM1.0 Start
                                //Code Commented
                                /*
                                IF Number = 1 THEN BEGIN
                                  IF NOT PostedDocDim2.FIND('-') THEN
                                    CurrReport.BREAK;
                                END ELSE
                                  IF NOT Continue THEN
                                    CurrReport.BREAK;
                                
                                CLEAR(DimText);
                                Continue := FALSE;
                                REPEAT
                                  OldDimText := DimText;
                                  IF DimText = '' THEN
                                    DimText := STRSUBSTNO(
                                      '%1 %2',PostedDocDim2."Dimension Code",PostedDocDim2."Dimension Value Code")
                                  ELSE
                                    DimText :=
                                      STRSUBSTNO(
                                        '%1, %2 %3',DimText,
                                        PostedDocDim2."Dimension Code",PostedDocDim2."Dimension Value Code");
                                  IF STRLEN(DimText) > MAXSTRLEN(OldDimText) THEN BEGIN
                                    DimText := OldDimText;
                                    Continue := TRUE;
                                    EXIT;
                                  END;
                                UNTIL (PostedDocDim2.NEXT = 0);
                                */
                                IF Number = 1 THEN BEGIN
                                    IF NOT DimSetEntryGRec2.FIND('-') THEN
                                        CurrReport.BREAK;
                                END ELSE
                                    IF NOT Continue THEN
                                        CurrReport.BREAK;

                                CLEAR(DimText);
                                Continue := FALSE;
                                REPEAT
                                    OldDimText := DimText;
                                    IF DimText = '' THEN
                                        DimText := STRSUBSTNO(
                                          '%1 %2', DimSetEntryGRec2."Dimension Code", DimSetEntryGRec2."Dimension Value Code")
                                    ELSE
                                        DimText :=
                                          STRSUBSTNO(
                                            '%1, %2 %3', DimText,
                                            DimSetEntryGRec2."Dimension Code", DimSetEntryGRec2."Dimension Value Code");
                                    IF STRLEN(DimText) > MAXSTRLEN(OldDimText) THEN BEGIN
                                        DimText := OldDimText;
                                        Continue := TRUE;
                                        EXIT;
                                    END;
                                UNTIL (DimSetEntryGRec2.NEXT = 0);
                                //DIM1.0 End

                            end;

                            trigger OnPreDataItem();
                            begin
                                IF NOT ShowInternalInfo THEN
                                    CurrReport.BREAK;

                                //DIM1.0 Start
                                //Code commented
                                /*
                                PostedDocDim2.SETRANGE("Table ID",DATABASE::"Sales Invoice Line");
                                PostedDocDim2.SETRANGE("Document No.","Sales Invoice Line"."Document No.");
                                PostedDocDim2.SETRANGE("Line No.","Sales Invoice Line"."Line No.");
                                */
                                DimSetEntryGRec2.RESET;
                                DimSetEntryGRec2.SETRANGE("Dimension Set ID", "Sales Invoice Line"."Dimension Set ID");
                                //DIM1.0 End

                            end;
                        }

                        trigger OnAfterGetRecord();
                        begin
                            AMT_TOT += "Sales Invoice Line"."Amount To Customer";
                            CstVatAmt := CstVatAmt + "Sales Invoice Line"."Tax Amount";
                            bed := 0;
                            EPS.SETRANGE("Excise Bus. Posting Group", "Sales Invoice Line"."Excise Bus. Posting Group");
                            EPS.SETRANGE("Excise Prod. Posting Group", "Sales Invoice Line"."Excise Prod. Posting Group");
                            IF ("Sales Invoice Header"."Posting Date" <> 0D) THEN
                                EPS.SETRANGE("From Date", 0D, "Sales Invoice Header"."Posting Date")
                            ELSE
                                EPS.SETRANGE("From Date", 0D, WORKDATE);
                            IF EPS.FIND('+') THEN
                                bed := EPS."BED %";




                            // NAVIN
                            //SREENIVAS-EFF
                            n := n + 1;
                            IF ("Sales Invoice Line"."Unit Price" = 0) THEN BEGIN
                                c := 1;
                                n := n - c;
                                CurrReport.SKIP;
                            END;

                            IF ("Sales Invoice Line"."Unit Price" <> 0) THEN BEGIN
                                IF bed = 0 THEN
                                    bedcap := ''
                                ELSE
                                    bedcap := FORMAT(bed);
                            END;

                            IF ("Sales Invoice Line"."Tax Area Code" = 'SALES CST') AND ("Sales Invoice Line"."Amount To Customer" <> 0) THEN BEGIN
                                taxamt := taxamt + "Sales Invoice Line"."Tax Amount";
                                IF ("Sales Invoice Line"."Tax %" = 2) THEN
                                    caplabel := '(2% aganist Form - C)';
                                IF ("Sales Invoice Line"."Tax %" = 3) THEN
                                    caplabel := '(3% aganist Form - C)';
                                IF ("Sales Invoice Line"."Tax %" = 4) THEN
                                    caplabel := '4%';
                                IF ("Sales Invoice Line"."Tax %" = 12.5) THEN
                                    caplabel := '(12.5%)';
                                IF ("Sales Invoice Line"."Tax %" = 5) THEN
                                    caplabel := '5%';
                                IF ("Sales Invoice Line"."Tax %" = 14.5) THEN
                                    caplabel := '(14.5%)';
                            END ELSE
                                caplabel := '';

                            IF ("Sales Invoice Line"."Tax Area Code" = 'SALES VAT') AND ("Sales Invoice Line"."Amount To Customer" <> 0) THEN BEGIN
                                vatamt := vatamt + "Sales Invoice Line"."Tax Amount";  //anil comented
                                                                                       //   vatamt:="Sales Invoice Line"."Tax Amount";
                                IF ("Sales Invoice Line"."Tax %" = 5) THEN
                                    caplabel1 := '5%';
                                IF ("Sales Invoice Line"."Tax %" = 4) THEN
                                    caplabel1 := '4%';
                                IF ("Sales Invoice Line"."Tax %" = 12.5) THEN
                                    caplabel1 := '12.5%';
                                IF ("Sales Invoice Line"."Tax %" = 14.5) THEN
                                    caplabel1 := '14.5%';
                            END ELSE
                                caplabel1 := '';



                            IF ("Sales Invoice Line"."Tax Group Code" = 'SOFTWARE') THEN
                                capt := '';
                            IF (("Sales Invoice Line"."Tax Group Code" = 'BOI-COMPUT') OR ("Sales Invoice Line"."Tax Group Code" = 'BOI-O') OR (
                            "Sales Invoice Line"."Tax Group Code" = 'BOI-O 2%') OR ("Sales Invoice Line"."Tax Group Code" = 'RAW') OR (
                            "Sales Invoice Line"."Tax Group Code" = 'RAW 10.5') OR ("Sales Invoice Line"."Tax Group Code" = 'RAW 12.5') OR
                            ("Sales Invoice Line"."Tax Group Code" = '2%') OR ("Sales Invoice Line"."Tax Group Code" = '14.5%') OR (
                            "Sales Invoice Line"."Tax Group Code" = 'BO-COM14.5') OR ("Sales Invoice Line"."Tax Group Code" = 'BOI-O 5%')
                            OR ("Sales Invoice Line"."Tax Group Code" = 'BOI-OVAT') OR ("Sales Invoice Line"."Tax Group Code" = 'BOI 1%')) THEN BEGIN
                                cap := 'COMMERCIAL INVOICE CUM DELIVERY CHALLAN';
                                CopyText := '';
                                capt := '(Trading item)';
                            END ELSE
                                cap := 'TAX INVOICE CUM DELIVERY CHALLAN';    //MODIFIED ON 01-31-09
                            //cap:='SALE INVOICE CUM DELIVERY CHALLAN';


                            IF "Sales Invoice Line"."Excise Bus. Posting Group" = 'EXPORT' THEN
                                cap := 'EXPORT INVOICE CUM DELIVERY CHALLAN';
                            LineAmt := Quantity * "Unit Price";
                            //MESSAGE(FORMAT(LineAmt));//anil240312
                            LineTotAmt := LineTotAmt + LineAmt;
                            // MESSAGE(FORMAT(LineTotAmt));
                            StructureLineDetails.RESET;
                            StructureLineDetails.SETRANGE(Type, StructureLineDetails.Type::Sale);
                            StructureLineDetails.SETRANGE("Document Type", StructureLineDetails."Document Type"::Invoice);
                            StructureLineDetails.SETRANGE("Invoice No.", "Document No.");
                            StructureLineDetails.SETRANGE("Item No.", "No.");
                            StructureLineDetails.SETRANGE("Line No.", "Line No.");
                            IF StructureLineDetails.FIND('-') THEN
                                REPEAT
                                    IF StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::Charges THEN
                                        Charges := Charges + ABS(StructureLineDetails.Amount);
                                    IF StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::"Other Taxes" THEN
                                        Othertaxes := Othertaxes + ABS(StructureLineDetails.Amount);
                                    IF StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::"Sales Tax" THEN
                                        SalesTax := SalesTax + ABS(StructureLineDetails.Amount);
                                    IF StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::"Service Tax" THEN
                                        ServiceTax := ServiceTax + ABS(StructureLineDetails.Amount);
                                    IF (NOT (StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::Excise)) THEN
                                        LineTotAmt := LineTotAmt + ABS(StructureLineDetails.Amount);
                                UNTIL StructureLineDetails.NEXT = 0;
                            // NAVIN
                            ExciseAmount += "BED Amount" + "AED(GSI) Amount" + "AED(TTA) Amount" + "SED Amount" + "SAED Amount" + "CESS Amount" +
                                            "NCCD Amount" + "eCess Amount" + "ADET Amount";
                            LineTotAmt += "BED Amount" + "AED(GSI) Amount" + "AED(TTA) Amount" + "SED Amount" + "SAED Amount" + "CESS Amount" +
                                          "NCCD Amount" + "eCess Amount" + "ADET Amount";
                            //    MESSAGE(FORMAT(LineTotAmt));
                            IF (Type = Type::"G/L Account") AND (NOT ShowInternalInfo) THEN
                                "No." := '';
                            //SREENIVAS -EFF
                            IF ("Sales Invoice Line"."Tax Group Code" = 'MPBI') OR ("Sales Invoice Line"."Tax Group Code" = 'MPBIVAT') THEN BEGIN
                                s := '84711000';
                                capt := '(Microprocessor based data acquisition&control system)';
                            END;
                            IF ("Sales Invoice Line"."Tax Group Code" = 'LED-5%') THEN BEGIN
                                IF ("Sales Invoice Line"."Excise Prod. Posting Group" = '94054090') THEN BEGIN
                                    s := '94054090';
                                    capt := '(LED Lighting)';
                                END;
                            END;
                            IF ("Sales Invoice Line"."Excise Prod. Posting Group" = '85414020') THEN BEGIN
                                s := '85414020';
                                capt := '(Electronic Moving Display unit for information Text)';
                            END;

                            IF ("Sales Invoice Line"."Excise Prod. Posting Group" = '85481090') THEN BEGIN
                                s := '85481090';
                                capt := '(Other Waste & Scrap)';

                            END;

                            IF "Sales Invoice Line"."Tax Group Code" = 'SOFTWARE' THEN BEGIN
                                s := '85249112';
                            END;
                            IF (("Sales Invoice Line"."Tax Group Code" = 'BOI-COMPUT') OR ("Sales Invoice Line"."Tax Group Code" = 'BOI-O') OR (
                            "Sales Invoice Line"."Tax Group Code" = 'BOI-O 2%') OR ("Sales Invoice Line"."Tax Group Code" = 'RAW') OR (
                            "Sales Invoice Line"."Tax Group Code" = 'RAW 10.5') OR ("Sales Invoice Line"."Tax Group Code" = 'RAW 12.5') OR
                            ("Sales Invoice Line"."Tax Group Code" = '2%') OR ("Sales Invoice Line"."Tax Group Code" = '4%') OR (
                            "Sales Invoice Line"."Tax Group Code" = 'BOI-O 4%') OR ("Sales Invoice Line"."Tax Group Code" = 'BOI-O 5%')) THEN BEGIN
                                bedamt := 0;
                                cessamt := 0;
                                ecessamt := 0;
                            END ELSE BEGIN
                                //bedamt:=bedamt+(LineAmt*(bed)/100);
                                //ROUND(LineAmt+bedamt+cessamt+ecessamt+"Sales Invoice Line"."Tax Amount"+roundoff,1)
                                bedamt := bedamt + (LineAmt * (bed) / 100);
                                cessamt := (bedamt) * 2 / 100;
                                ecessamt := (bedamt) * 1 / 100;
                            END;


                            sub := LineAmt + bedamt;
                            sub1 := sub + cessamt + ecessamt;
                            sub2 := sub1 + CstVatAmt;
                            subtotal := ROUND(sub, 1);
                            subtotal1 := ROUND(sub1, 1);
                            subtotal2 := ROUND(sub2, 1);
                        end;

                        trigger OnPreDataItem();
                        begin
                            // NAVIN
                            n := 0;
                            k := 1;
                            LineTotAmt := 0;
                            ExciseAmount := 0;
                            Charges := 0;
                            Othertaxes := 0;
                            SalesTax := 0;
                            bedamt := 0;
                            servicetaxamt := 0;
                            servicecess := 0;
                            CstVatAmt := 0;
                            taxamt := 0;
                            vatamt := 0;




                            // NAVIN

                            VATAmountLine.DELETEALL;
                            MoreLines := FIND('+');
                            WHILE MoreLines AND (Description = '') AND ("No." = '') AND (Quantity = 0) AND (Amount = 0) DO
                                MoreLines := NEXT(-1) <> 0;
                            IF NOT MoreLines THEN
                                CurrReport.BREAK;
                            SETRANGE("Line No.", 0, "Line No.");

                            // NAVIN
                            //CurrReport.CREATETOTALS("Line Amount",Amount,"Amount Including VAT","Inv. Discount Amount");
                            CurrReport.CREATETOTALS("Line Amount", Amount, "Amount Including VAT", "Inv. Discount Amount",
                            "Line Discount Amount", "Tax Amount",
                            "Amount Including Tax", "Excise Amount", "Tax Base Amount");
                            CurrReport.CREATETOTALS(LineAmt);
                            // NAVIN
                            //taxamt:="Sales Invoice Line"."Tax Amount";
                            //vatamt:="Sales Invoice Line"."VAT Amount";
                        end;
                    }
                    dataitem(VATCounter; "Integer")
                    {
                        DataItemTableView = SORTING(Number);

                        trigger OnAfterGetRecord();
                        begin
                            VATAmountLine.GetLine(Number);
                        end;

                        trigger OnPreDataItem();
                        begin
                            IF VATAmountLine.GetTotalVATAmount = 0 THEN
                                CurrReport.BREAK;
                            SETRANGE(Number, 1, VATAmountLine.COUNT);
                            CurrReport.CREATETOTALS(
                              VATAmountLine."Line Amount", VATAmountLine."Inv. Disc. Base Amount",
                              VATAmountLine."Invoice Discount Amount", VATAmountLine."VAT Base", VATAmountLine."VAT Amount");
                        end;
                    }
                    dataitem(Total; "Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                        column(descri_1_; descri[1])
                        {
                        }
                        column(DataItem1000000029; Certified_that_the_Particulars_given_above_are_true_and_correct_and_the_amount_indicated_represents_the_price_actually_chargeLbl)
                        {
                        }
                        column(Authorised_SignatoryCaption; Authorised_SignatoryCaptionLbl)
                        {
                        }
                        column(Rupees__in_Words__Caption; Rupees__in_Words__CaptionLbl)
                        {
                        }
                        column(Total_Number; Number)
                        {
                        }
                    }
                    dataitem(Total2; "Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));

                        trigger OnPreDataItem();
                        begin
                            IF NOT ShowShippingAddr THEN
                                CurrReport.BREAK;
                        end;
                    }
                }

                trigger OnAfterGetRecord();
                begin
                    //SREENIVAS-EFF
                    IF Number = 1 THEN
                        CopyText := text007;
                    IF Number = 2 THEN
                        CopyText := Text003;
                    IF Number = 3 THEN
                        CopyText := text008;
                    IF Number = 4 THEN
                        CopyText := text009;

                    CurrReport.PAGENO := 1;
                end;

                trigger OnPostDataItem();
                begin
                    IF NOT CurrReport.PREVIEW THEN
                        SalesInvCountPrinted.RUN("Sales Invoice Header");
                end;

                trigger OnPreDataItem();
                begin
                    NoOfLoops := 4;
                    IF NoOfLoops <= 0 THEN
                        NoOfLoops := 1;
                    CopyText := '';
                    SETRANGE(Number, 1, NoOfLoops);
                end;
            }
            dataitem("Sales Header"; "Sales Header")
            {
                DataItemLink = External Document No.=FIELD(External Document No.);
                DataItemTableView = SORTING(Document Type, No.) ORDER(Ascending);
            }
            dataitem("Transit Document Order Details"; "Transit Document Order Details")
            {
                DataItemLink = PO / SO No.=FIELD(No.);
                DataItemTableView = SORTING(Line No., Type, PO / SO No., Vendor / Customer Ref., State, Form No.) ORDER(Ascending);
            }

            trigger OnAfterGetRecord();
            begin
                CurrReport.LANGUAGE := Language.GetLanguageID("Language Code");

                CompanyInfo.GET;

                IF RespCenter.GET("Responsibility Center") THEN BEGIN
                    FormatAddr.RespCenter(CompanyAddr, RespCenter);
                    CompanyInfo."Phone No." := RespCenter."Phone No.";
                    CompanyInfo."Fax No." := RespCenter."Fax No.";
                END ELSE BEGIN
                    FormatAddr.Company(CompanyAddr, CompanyInfo);
                END;
                //DIM1.0 Start
                //Code commented
                /*
                PostedDocDim1.SETRANGE("Table ID",DATABASE::"Sales Invoice Header");
                PostedDocDim1.SETRANGE("Document No.","Sales Invoice Header"."No.");
                */
                DimSetEntryGRec.RESET;
                DimSetEntryGRec.SETRANGE("Dimension Set ID", "Dimension Set ID");
                //DIM1.0 End


                IF "Order No." = '' THEN
                    OrderNoText := ''
                ELSE
                    OrderNoText := FIELDCAPTION("Order No.");
                IF "Salesperson Code" = '' THEN BEGIN
                    SalesPurchPerson.INIT;
                    SalesPersonText := '';
                END ELSE BEGIN
                    SalesPurchPerson.GET("Salesperson Code");
                    SalesPersonText := Text000;
                END;
                IF "Your Reference" = '' THEN
                    ReferenceText := ''
                ELSE
                    ReferenceText := FIELDCAPTION("Your Reference");
                IF "VAT Registration No." = '' THEN
                    VATNoText := ''
                ELSE
                    VATNoText := FIELDCAPTION("VAT Registration No.");
                IF "Currency Code" = '' THEN BEGIN
                    GLSetup.TESTFIELD("LCY Code");
                    TotalText := STRSUBSTNO(Text001, GLSetup."LCY Code");
                    TotalInclVATText := STRSUBSTNO(Text002, GLSetup."LCY Code");
                    TotalExclVATText := STRSUBSTNO(Text006, GLSetup."LCY Code");
                END ELSE BEGIN
                    TotalText := STRSUBSTNO(Text001, "Currency Code");
                    TotalInclVATText := STRSUBSTNO(Text002, "Currency Code");
                    TotalExclVATText := STRSUBSTNO(Text006, "Currency Code");
                END;
                FormatAddr.SalesInvBillTo(CustAddr, "Sales Invoice Header");
                Cust.GET("Bill-to Customer No.");

                IF "Payment Terms Code" = '' THEN
                    PaymentTerms.INIT
                ELSE
                    PaymentTerms.GET("Payment Terms Code");
                IF "Shipment Method Code" = '' THEN
                    ShipmentMethod.INIT
                ELSE
                    ShipmentMethod.GET("Shipment Method Code");

                FormatAddr.SalesInvShipTo(ShipToAddr, "Sales Invoice Header");
                ShowShippingAddr := "Sell-to Customer No." <> "Bill-to Customer No.";
                FOR i := 1 TO ARRAYLEN(ShipToAddr) DO
                    IF ShipToAddr[i] <> CustAddr[i] THEN
                        ShowShippingAddr := TRUE;

                IF LogInteraction THEN
                    IF NOT CurrReport.PREVIEW THEN BEGIN
                        IF "Bill-to Contact No." <> '' THEN
                            SegManagement.LogDocument(
                              4, "No.", 0, 0, DATABASE::Contact, "Bill-to Contact No.", "Salesperson Code",
                              "Campaign No.", "Posting Description", '')
                        ELSE
                            SegManagement.LogDocument(
                              4, "No.", 0, 0, DATABASE::Customer, "Bill-to Customer No.", "Salesperson Code",
                              "Campaign No.", "Posting Description", '');
                    END;
                TDD.SETRANGE(TDD."Vendor / Customer Ref.", "Sales Invoice Header"."Sell-to Customer No.");
                TDD.SETRANGE(TDD."PO / SO No.", "Sales Invoice Header"."Order No.");
                IF TDD.FINDFIRST THEN
                    wayb1 := TDD."Form No.";
                //MESSAGE('%1',WayBillNo);

            end;

            trigger OnPreDataItem();
            begin
                CompanyInfo.GET;  // NAVIN
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
                    Caption = 'Options';
                    field(NoOfCopies; NoOfCopies)
                    {
                        Caption = 'No. of Copies';
                    }
                    field(ShowInternalInfo; ShowInternalInfo)
                    {
                        Caption = 'Show Internal Information';
                    }
                    field(LogInteraction; LogInteraction)
                    {
                        Caption = 'Log Interaction';
                    }
                    field("Round off Value"; roundoff)
                    {
                        Caption = 'Round off Value';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnInit();
        begin
            LogInteractionEnable := TRUE;
        end;

        trigger OnOpenPage();
        begin
            InitLogInteraction;
            /*//B2B
            RequestOptionsPage.LogInteraction.ENABLED(LogInteraction);
            */
            LogInteractionEnable := LogInteraction;//B2B

        end;
    }

    labels
    {
    }

    trigger OnInitReport();
    begin
        GLSetup.GET;
    end;

    trigger OnPreReport();
    begin
        IF NOT CurrReport.USEREQUESTPAGE THEN
            InitLogInteraction;
        //CompanyInfo.CALCFIELDS(Picture);
    end;

    var
        Text000: Label 'Salesperson';
        Text001: Label 'Total %1';
        Text002: Label 'Total %1 Incl. VAT';
        Text003: Label 'DUPLICATE FOR TRANSPORTER';
        Text004: Label 'Sales - Invoice %1';
        Text005: Label 'Page %1';
        Text006: Label 'Total %1 Excl. VAT';
        GLSetup: Record "General Ledger Setup";
        ShipmentMethod: Record "Shipment Method";
        PaymentTerms: Record "Payment Terms";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        CompanyInfo: Record "Company Information";
        Cust: Record Customer;
        VATAmountLine: Record "VAT Amount Line" temporary;
        RespCenter: Record "Responsibility Center";
        Language: Record Language;
        SalesInvCountPrinted: Codeunit "Sales Inv.-Printed";
        FormatAddr: Codeunit "Format Address";
        SegManagement: Codeunit SegManagement;
        CustAddr: array[8] of Text[50];
        ShipToAddr: array[8] of Text[50];
        CompanyAddr: array[8] of Text[50];
        OrderNoText: Text[30];
        SalesPersonText: Text[30];
        VATNoText: Text[30];
        ReferenceText: Text[30];
        TotalText: Text[50];
        TotalExclVATText: Text[50];
        TotalInclVATText: Text[50];
        MoreLines: Boolean;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        ShowShippingAddr: Boolean;
        i: Integer;
        DimText: Text[120];
        OldDimText: Text[75];
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        LogInteraction: Boolean;
        "-NAVIN-": Integer;
        StructureLineDetails: Record "Posted Str Order Line Details";
        TotalTaxAmount: Decimal;
        LineAmt: Decimal;
        LineTotAmt: Decimal;
        ExciseAmount: Decimal;
        Charges: Decimal;
        Othertaxes: Decimal;
        SalesTax: Decimal;
        ServiceTax: Decimal;
        saleorder: Record "Sales Header";
        s: Text[30];
        descri: array[2] of Text[250];
        check: Report Check;
        s1: Decimal;
        bedamt: Decimal;
        cessamt: Decimal;
        ecessamt: Decimal;
        "sum": Decimal;
        desc: Text[30];
        cap: Text[40];
        n: Integer;
        c: Integer;
        text007: Label 'EXTRA COPY';
        text008: Label 'TRIPLICATE FOR ASSESSEE';
        text009: Label 'ORIGINAL FOR BUYER';
        capt: Text[60];
        j: Text[30];
        s2: Decimal;
        descri1: array[2] of Text[60];
        caplabel: Text[30];
        waybillno: Code[10];
        caplabel1: Text[30];
        d1: array[10] of Text[300];
        tot: array[10, 6] of Text[30];
        k: Integer;
        saleinvoice: Record "Sales Invoice Line";
        choice: Option saleinvoice,Commercialinvoice;
        taxamt: Decimal;
        vatamt: Decimal;
        str: Text[5];
        str1: Text[30];
        pos: Integer;
        subtotal: Decimal;
        subtotal1: Decimal;
        sub: Decimal;
        sub1: Decimal;
        subtotal2: Decimal;
        sub2: Decimal;
        roundoff: Decimal;
        round1: Decimal;
        servicetaxamt: Decimal;
        servicecess: Decimal;
        servicetotal: Decimal;
        servicetax1: Decimal;
        cesstax: Decimal;
        num: array[4] of Text[60];
        bedcap: Text[4];
        pstr: Record "Posted Str Order Line Details";
        packing: Decimal;
        forwarding: Decimal;
        EPS: Record "Excise Posting Setup";
        bed: Decimal;
        CstVatAmt: Decimal;
        SSH: Record "Sales Shipment Header";
        TDD: Record "Transit Document Order Details";
        wayb1: Text[30];
        AMT_TOT: Decimal;
        DATE__CaptionLbl: Label 'DATE :';
        Bill_No_CaptionLbl: Label 'Bill No:';
        E_C__Code_No__AAACE_4879Q_XM001CaptionLbl: Label 'E.C. Code No. AAACE 4879Q XM001';
        CompanyInfo__Fax_No__CaptionLbl: Label 'Fax No.';
        Tin_No__28350166764CaptionLbl: Label 'Tin No. 28350166764';
        Ph____91_866__2466675__2493375CaptionLbl: Label 'Ph : +91(866) 2466675, 2493375';
        CASH_BILLCaptionLbl: Label 'CASH BILL';
        M_sCaptionLbl: Label 'M/s';
        EmptyStringCaptionLbl: Label ',';
        E_Mail__Info_Efftronics_comCaptionLbl: Label 'E-Mail: Info@Efftronics.com';
        Visit_us__www_efftronics_comCaptionLbl: Label 'Visit us: www.efftronics.com';
        DescriptionCaptionLbl: Label 'Description';
        QuantityCaptionLbl: Label 'Quantity';
        Unit_PriceCaptionLbl: Label 'Unit Price';
        AmountCaptionLbl: Label 'Amount';
        Inclusive_of_all_taxes_CaptionLbl: Label '(Inclusive of all taxes)';
        TotalCaptionLbl: Label 'Total';
        B_E_D__Rate________CaptionLbl: Label '"B.E.D. Rate     :  "';
        Sub_Total____CaptionLbl: Label 'Sub Total   :';
        E_Cess___2___on_BEDCaptionLbl: Label 'E.Cess:  2 % on BED';
        SHE_Cess___1___on_BEDCaptionLbl: Label 'SHE Cess : 1 % on BED';
        GRAND_TOTAL___CaptionLbl: Label 'GRAND TOTAL  :';
        VATCaptionLbl: Label 'VAT';
        CSTCaptionLbl: Label 'CST';
        Round_offCaptionLbl: Label 'Round off';
        Certified_that_the_Particulars_given_above_are_true_and_correct_and_the_amount_indicated_represents_the_price_actually_chargeLbl: Label 'Certified that the Particulars given above are true and correct and the amount indicated represents the price actually charged and that there is no flow of additional consideration directly or indirectly from the buyer';
        Authorised_SignatoryCaptionLbl: Label 'Authorised Signatory';
        Rupees__in_Words__CaptionLbl: Label 'Rupees (in Words):';
        [InDataSet]
        LogInteractionEnable: Boolean;
        "-DIM1.0-": Integer;
        DimSetEntryGRec: Record "Dimension Set Entry";
        DimSetEntryGRec2: Record "Dimension Set Entry";

    (11342)]
    procedure InitLogInteraction();
    begin
        LogInteraction := SegManagement.FindInteractTmplCode(4) <> '';
    end;
}

