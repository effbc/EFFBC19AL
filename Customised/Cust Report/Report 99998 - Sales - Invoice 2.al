report 99998 "Sales - Invoice 2"
{
    // version NAVW13.70,NAVIN3.70.00.13,sreenivas

    DefaultLayout = RDLC;
    RDLCLayout = './Sales - Invoice 2.rdlc';
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
            column(Sales_Invoice_Header_Structure; "Sales Invoice Header".Structure)
            {
            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING(Number);
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                    column(STRSUBSTNO_CopyText_; STRSUBSTNO(CopyText))
                    {
                    }
                    column(Sales_Invoice_Header___Sell_to_Customer_Name_; "Sales Invoice Header"."Sell-to Customer Name")
                    {
                    }
                    column(CompanyAddr_1_; CompanyAddr[1])
                    {
                    }
                    column(Sales_Invoice_Header___Sell_to_City_; "Sales Invoice Header"."Sell-to City")
                    {
                    }
                    column(CompanyAddr_2_; CompanyAddr[2])
                    {
                    }
                    column(CompanyAddr_3_; CompanyAddr[3])
                    {
                    }
                    column(CompanyInfo__Phone_No__; CompanyInfo."Phone No.")
                    {
                    }
                    column(CompanyInfo__Fax_No__; CompanyInfo."Fax No.")
                    {
                    }
                    column(FORMAT__Sales_Invoice_Header___Posting_Date__0_4_; FORMAT("Sales Invoice Header"."Posting Date", 0, 4))
                    {
                    }
                    column(Sales_Invoice_Header___External_Document_No__; "Sales Invoice Header"."External Document No.")
                    {
                    }
                    column(Sales_Invoice_Header___Customer_OrderNo__; "Sales Invoice Header"."Customer OrderNo.")
                    {
                    }
                    column(FORMAT__Sales_Invoice_Header___Customer_Order_Date__0_4_; FORMAT("Sales Invoice Header"."Customer Order Date", 0, 4))
                    {
                    }
                    column(Sales_Invoice_Header___Ship_to_Address_; "Sales Invoice Header"."Ship-to Address")
                    {
                    }
                    column(cap; cap)
                    {
                    }
                    column(TIME; TIME)
                    {
                    }
                    column(Sales_Invoice_Header__WayBillNo; "Sales Invoice Header".WayBillNo)
                    {
                    }
                    column(Sales_Invoice_Header___Ship_to_Address_2_; "Sales Invoice Header"."Ship-to Address 2")
                    {
                    }
                    column(Sales_Invoice_Header___Ship_to_Name_; "Sales Invoice Header"."Ship-to Name")
                    {
                    }
                    column(CompanyInfo__Phone_No__Caption; CompanyInfo__Phone_No__CaptionLbl)
                    {
                    }
                    column(CompanyInfo__Fax_No__Caption; CompanyInfo__Fax_No__CaptionLbl)
                    {
                    }
                    column(INVOICE_NO_Caption; INVOICE_NO_CaptionLbl)
                    {
                    }
                    column(DATE__Caption; DATE__CaptionLbl)
                    {
                    }
                    column(Tin_No__28350166764Caption; Tin_No__28350166764CaptionLbl)
                    {
                    }
                    column(CST_No__VJ2_07_1_1976_02_05_1988Caption; CST_No__VJ2_07_1_1976_02_05_1988CaptionLbl)
                    {
                    }
                    column(Consignee_Name___AddressCaption; Consignee_Name___AddressCaptionLbl)
                    {
                    }
                    column(Your_Order_No_Caption; Your_Order_No_CaptionLbl)
                    {
                    }
                    column(Dt__Caption; Dt__CaptionLbl)
                    {
                    }
                    column(TIME_OF_ISSUE_OF_INVOICECaption; TIME_OF_ISSUE_OF_INVOICECaptionLbl)
                    {
                    }
                    column(WAY_BILL_NO_Caption; WAY_BILL_NO_CaptionLbl)
                    {
                    }
                    column(Regd__Office___Factory__Caption; Regd__Office___Factory__CaptionLbl)
                    {
                    }
                    column(EmptyStringCaption; EmptyStringCaptionLbl)
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
                            IF Number = 1 THEN BEGIN
                                IF NOT DimSetEntry1.FINDSET THEN
                                    CurrReport.BREAK;
                            END ELSE
                                IF NOT Continue THEN
                                    CurrReport.BREAK;

                            CLEAR(DimText);
                            Continue := FALSE;
                            REPEAT
                                OldDimText := DimText;
                                IF DimText = '' THEN
                                    DimText := STRSUBSTNO('%1 - %2', DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code")
                                ELSE
                                    DimText :=
                                      STRSUBSTNO(
                                        '%1; %2 - %3', DimText,
                                        DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code");
                                IF STRLEN(DimText) > MAXSTRLEN(OldDimText) THEN BEGIN
                                    DimText := OldDimText;
                                    Continue := TRUE;
                                    EXIT;
                                END;
                            UNTIL DimSetEntry1.NEXT = 0;
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
                        column(tot_1__1_; tot[1] [1])
                        {
                        }
                        column(d1_1_; d1[1])
                        {
                        }
                        column(tot_1__2_; tot[1] [2])
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
                        column(tot_2__1_; tot[2] [1])
                        {
                        }
                        column(d1_2_; d1[2])
                        {
                        }
                        column(tot_2__2_; tot[2] [2])
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
                        column(tot_3__1_; tot[3] [1])
                        {
                        }
                        column(d1_3_; d1[3])
                        {
                        }
                        column(tot_3__2_; tot[3] [2])
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
                        column(tot_4__1_; tot[4] [1])
                        {
                        }
                        column(d1_4_; d1[4])
                        {
                        }
                        column(tot_4__2_; tot[4] [2])
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
                        column(tot_5__1_; tot[5] [1])
                        {
                        }
                        column(d1_5_; d1[5])
                        {
                        }
                        column(tot_5__2_; tot[5] [2])
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
                        column(tot_1__6_; tot[1] [6])
                        {
                        }
                        column(tot_2__6_; tot[2] [6])
                        {
                        }
                        column(tot_3__6_; tot[3] [6])
                        {
                        }
                        column(tot_4__6_; tot[4] [6])
                        {
                        }
                        column(tot_5__6_; tot[5] [6])
                        {
                        }
                        column(Capt12; Capt12)
                        {
                        }
                        column(formatadress_ChangeCurrency_ROUND_bedamt_1_____00_; formatadress.ChangeCurrency(ROUND(bedamt, 1)) + '.00')
                        {
                        }
                        column(FORMAT_formatadress_ChangeCurrency_ROUND_LineAmt_1______00_; FORMAT(formatadress.ChangeCurrency(ROUND(LineAmt, 1))) + '.00')
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(DataItem1280017; formatadress.ChangeCurrency(ROUND(LineAmt + bedamt + cessamt + ecessamt + "Sales Invoice Line"."Tax Amount" + roundoff + "Sales Invoice Line"."Charges To Customer", 1)) + '.00')
                        {
                        }
                        column(s; s)
                        {
                        }
                        column(forwarding; forwarding)
                        {
                        }
                        column(formatadress_ChangeCurrency__ROUND_LineAmt__Sales_Invoice_Line___Charges_To_Customer__1__ROUND_bedamt_1______00_; formatadress.ChangeCurrency((ROUND(LineAmt + "Sales Invoice Line"."Charges To Customer", 1) + ROUND(bedamt, 1))) + '.00')
                        {
                        }
                        column(ROUND_cessamt_1_; ROUND(cessamt, 1))
                        {
                        }
                        column(ROUND_ecessamt_1_; ROUND(ecessamt, 1))
                        {
                        }
                        column(DataItem1000000065; formatadress.ChangeCurrency(ROUND((ROUND(LineAmt, 1) + ROUND(bedamt, 1)) + cessamt + ecessamt + "Sales Invoice Line"."Charges To Customer", 1)) + '.00')
                        {
                        }
                        column(FORMAT__Sales_Invoice_Header___Posting_Date__0_4__Control1000000038; FORMAT("Sales Invoice Header"."Posting Date", 0, 4))
                        {
                        }
                        column(Sales_Invoice_Header___Transport_Method___Sales_Invoice_Header___Vehicle_No__; "Sales Invoice Header"."Transport Method" + "Sales Invoice Header"."Vehicle No.")
                        {
                        }
                        column(descri1_1__descri1_2_; descri1[1] + descri1[2])
                        {
                        }
                        column(TIME_3600000; TIME + 3600000)
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
                        column(packing; packing)
                        {
                        }
                        column(ROUND__packing__Sales_Invoice_Line___Line_Amount___100_0_01_; ROUND((packing / "Sales Invoice Line"."Line Amount") * 100, 0.01))
                        {
                        }
                        column(ROUND__forwarding__Sales_Invoice_Line___Line_Amount___100_0_001_; ROUND((forwarding / "Sales Invoice Line"."Line Amount") * 100, 0.001))
                        {
                        }
                        column(formatadress_ChangeCurrency_ROUND_vatamt_1_____00_; formatadress.ChangeCurrency(ROUND(vatamt, 1)) + '.00')
                        {
                        }
                        column(capt; capt)
                        {
                        }
                        column(S_noCaption; S_noCaptionLbl)
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
                        column(No_of_PacketsCaption; No_of_PacketsCaptionLbl)
                        {
                        }
                        column(Sch__NoCaption; Sch__NoCaptionLbl)
                        {
                        }
                        column(Sub_TotalCaption; Sub_TotalCaptionLbl)
                        {
                        }
                        column(DataItem1000000010; C_E__RegN__No__AAACE4879QXM001___________________________________________E_C__Code_No__AAACE_4879Q_XM001_Range_IV_divn_VijayaLbl)
                        {
                        }
                        column(Details_of_Reduction_Additions_made_to_arrive_at_value_under_sec__4_at_the_ActCaption; Details_of_Reduction_Additions_made_to_arrive_at_value_under_sec__4_at_the_ActCaptionLbl)
                        {
                        }
                        column(Tariff_Heading_No__Caption; Tariff_Heading_No__CaptionLbl)
                        {
                        }
                        column(Exemption_notification_No_Caption; Exemption_notification_No_CaptionLbl)
                        {
                        }
                        column(PackingCaption; PackingCaptionLbl)
                        {
                        }
                        column(Total_Assessable_Value_or_Tariff_ValueCaption; Total_Assessable_Value_or_Tariff_ValueCaptionLbl)
                        {
                        }
                        column(Serial_Number_of_Debit___Entry_in_PLA___Rg_23A_Part_II_Caption; Serial_Number_of_Debit___Entry_in_PLA___Rg_23A_Part_II_CaptionLbl)
                        {
                        }
                        column(B_E_D__Rate________Caption; B_E_D__Rate________CaptionLbl)
                        {
                        }
                        column(Total_Duty_Paid___in_words_Caption; Total_Duty_Paid___in_words_CaptionLbl)
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
                        column(Sub_Total_______Caption; Sub_Total_______CaptionLbl)
                        {
                        }
                        column(GRAND_TOTAL___Caption; GRAND_TOTAL___CaptionLbl)
                        {
                        }
                        column(Mode_of_Transport___Vechicle_Regn_No_Caption; Mode_of_Transport___Vechicle_Regn_No_CaptionLbl)
                        {
                        }
                        column(DataItem1000000026; Goods_once_sold_cannot_be_taken_back_____________________Our_responsibility_cases_ex__our_Works___Godown______Subject_to_VijaLbl)
                        {
                        }
                        column(Customer_s_Signature__Caption; Customer_s_Signature__CaptionLbl)
                        {
                        }
                        column(DateCaption; DateCaptionLbl)
                        {
                        }
                        column(Time_of_Removal_of_GoodsCaption; Time_of_Removal_of_GoodsCaptionLbl)
                        {
                        }
                        column(EmptyStringCaption_Control1000000082; EmptyStringCaption_Control1000000082Lbl)
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
                        column(ForwardingCaption; ForwardingCaptionLbl)
                        {
                        }
                        column(EmptyStringCaption_Control1102154049; EmptyStringCaption_Control1102154049Lbl)
                        {
                        }
                        column(EmptyStringCaption_Control1102154050; EmptyStringCaption_Control1102154050Lbl)
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
                                IF Number = 1 THEN BEGIN
                                    IF NOT DimSetEntry2.FINDSET THEN
                                        CurrReport.BREAK;
                                END ELSE
                                    IF NOT Continue THEN
                                        CurrReport.BREAK;

                                CLEAR(DimText);
                                Continue := FALSE;
                                REPEAT
                                    OldDimText := DimText;
                                    IF DimText = '' THEN
                                        DimText := STRSUBSTNO('%1 - %2', DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code")
                                    ELSE
                                        DimText :=
                                          STRSUBSTNO(
                                            '%1; %2 - %3', DimText,
                                            DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code");
                                    IF STRLEN(DimText) > MAXSTRLEN(OldDimText) THEN BEGIN
                                        DimText := OldDimText;
                                        Continue := TRUE;
                                        EXIT;
                                    END;
                                UNTIL DimSetEntry2.NEXT = 0;
                            end;

                            trigger OnPreDataItem();
                            begin
                                IF NOT ShowInternalInfo THEN
                                    CurrReport.BREAK;
                            end;
                        }

                        trigger OnAfterGetRecord();
                        begin
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
                            IF "Sales Invoice Line"."Tax Liable" = FALSE THEN BEGIN
                                Capt12 := 'EXEMPTED VIDE NOTIFICATION NO. 42/2001- Central Excise (N.T.) Dated 26th June 2001, Bond.no. V(16)Tech/Bond/31/2012 on ';
                                Capt12 += '20.12.2012 Vide CT-1 Form.no. 366/2012 dt:28.12.2012';
                            END;
                            IF "Sales Invoice Line"."Sell-to Customer No." = 'CUST00464' THEN BEGIN
                                Capt12 := 'UNDER NOTIFICATION NO:10/97- CENTRAL EXCISE DT:01.03.97';
                            END;



                            //Sales Invoice Line, Body (2) - OnPreSection()
                            //CurrReport.SHOWOUTPUT(Type > 0);
                            //SREENIVAS-EFF
                            //  if "Sales Invoice Line"."No."<>'48400' then

                            IF Type > 0 THEN BEGIN
                                //d1[k]:='SUPPLY OF '+"Sales Invoice Line".Description;
                                d1[k] := ' ' + "Sales Invoice Line".Description;
                                // IF "Sales Invoice Header"."Customer Posting Group"='PRIVATE' THEN
                                tot[k] [1] := FORMAT(n);
                                // ELSE
                                //   tot[k][1]:=FORMAT("Sales Invoice Line"."Schedule No");
                                tot[k] [2] := FORMAT("Sales Invoice Line"."Packet No");
                                IF "Sales Invoice Line"."Unit of Measure Code" = 'NOS' THEN
                                    tot[k] [3] := FORMAT("Sales Invoice Line".Quantity) + ' Nos';
                                IF "Sales Invoice Line"."Unit of Measure Code" = 'MTS' THEN
                                    tot[k] [3] := FORMAT("Sales Invoice Line".Quantity) + ' Mts';
                                IF "Sales Invoice Line"."Unit of Measure Code" = 'KMS' THEN
                                    tot[k] [3] := FORMAT("Sales Invoice Line".Quantity) + ' KMs';
                                IF "Sales Invoice Line"."Unit of Measure Code" = 'FT' THEN
                                    tot[k] [3] := FORMAT("Sales Invoice Line".Quantity) + ' Fts';
                                IF "Sales Invoice Line"."Unit of Measure Code" = 'SETS' THEN
                                    tot[k] [3] := FORMAT("Sales Invoice Line".Quantity) + ' Sets';
                                IF "Sales Invoice Line"."Unit of Measure Code" = 'PAIR' THEN
                                    tot[k] [3] := FORMAT("Sales Invoice Line".Quantity) + ' Pairs';
                                IF "Sales Invoice Line"."Unit of Measure Code" = 'SQFT' THEN
                                    tot[k] [3] := FORMAT("Sales Invoice Line".Quantity) + ' Sq Fts';




                                //   tot[k][3]:=FORMAT("Sales Invoice Line".Quantity);
                                tot[k] [4] := formatadress.ChangeCurrency(ROUND("Sales Invoice Line"."Unit Price", 0.001));
                                tot[k] [5] := formatadress.ChangeCurrency(ROUND("Sales Invoice Line"."Line Amount", 1)) + '.00';
                                tot[k] [6] := FORMAT("Sales Invoice Line"."Schedule Type") + FORMAT("Sales Invoice Line"."Schedule No");
                                //    tot[k][6]:=FORMAT("Sales Invoice Line"."Schedule No");
                                IF "Sales Invoice Header".Structure = 'SERVICE' THEN
                                    d1[k] := "Sales Invoice Line".Description;
                                k := k + 1;
                            END;


                            //Sales Invoice Line, Footer (4) - OnPreSection()
                            IF choice = choice::Commercialinvoice THEN
                                CurrReport.SHOWOUTPUT := FALSE;
                            str := '-';
                            str1 := FORMAT("Sales Invoice Header"."External Document No.");
                            pos := STRPOS(str1, str);
                            IF (pos = 3) OR (pos = 4) THEN
                                CurrReport.SHOWOUTPUT := FALSE
                            ELSE
                                CurrReport.SHOWOUTPUT := TRUE;

                            // for packing and forward purpose
                            packing := 0;
                            forwarding := 0;

                            pstr.SETRANGE(pstr."Invoice No.", "Sales Invoice Header"."No.");
                            IF pstr.FIND('-') THEN
                                REPEAT
                                    IF pstr."Tax/Charge Group" = 'PACKING' THEN
                                        packing := packing + pstr."Calculation Value";

                                    IF pstr."Tax/Charge Group" = 'FORWARDING' THEN
                                        forwarding := forwarding + pstr."Calculation Value";

                                UNTIL pstr.NEXT = 0;


                            //   CurrReport.SHOWOUTPUT(choice=choice::saleinvoice);
                            /*
                              IF ("Sales Invoice Line"."Tax %"=2)AND("Sales Invoice Line"."Tax Area Code"='SALES CST') THEN
                                caplabel:='(2% aganist Form - C)';
                              IF ("Sales Invoice Line"."Tax %"=3)AND("Sales Invoice Line"."Tax Area Code"='SALES CST') THEN
                                caplabel:='(3% aganist Form - C)';
                              IF ("Sales Invoice Line"."Tax %"=12.5)AND("Sales Invoice Line"."Tax Area Code"='SALES CST') THEN
                                caplabel:='(12.5%)';
                              IF ("Sales Invoice Line"."Tax %"=4)AND("Sales Invoice Line"."Tax Area Code"='SALES VAT') THEN
                                caplabel1:='4%';
                              IF ("Sales Invoice Line"."Tax %"=12.5)AND("Sales Invoice Line"."Tax Area Code"='SALES VAT') THEN
                              caplabel1:='12.5%';
                              IF ("Sales Invoice Line"."Tax Area Code"='SALES VAT') THEN
                              caplabel1:='';
                            */
                            s2 := ROUND(bedamt, 1);
                            check.InitTextVariable;
                            check.FormatNoText(descri1, s2, '');
                            //SREENIVAS-EFF
                            IF roundoff < 0 THEN
                                round1 := -(roundoff);
                            IF roundoff > 0 THEN
                                round1 := roundoff;
                            //MESSAGE(capt);

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
                        column(capt_Control1000000204; capt)
                        {
                        }
                        column(FORMAT_ROUND_LineAmt_1_____00_; FORMAT(ROUND(LineAmt, 1)) + '.00')
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(FORMAT_ROUND_LineAmt_1_____00__Control1000000212; FORMAT(ROUND(LineAmt, 1)) + '.00')
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(caplabel_Control1000000214; caplabel)
                        {
                        }
                        column(ROUND_taxamt_1__Control1000000215; ROUND(taxamt, 1))
                        {
                        }
                        column(caplabel1_Control1000000217; caplabel1)
                        {
                        }
                        column(formatadress_ChangeCurrency_ROUND_LineTotAmt_roundoff_1_____00_; formatadress.ChangeCurrency(ROUND(LineTotAmt + roundoff, 1)) + '.00')
                        {
                        }
                        column(round1_Control1102154003; round1)
                        {
                        }
                        column(Sales_Invoice_Header___Transport_Method___Sales_Invoice_Header___Vehicle_No___Control1102154046; "Sales Invoice Header"."Transport Method" + "Sales Invoice Header"."Vehicle No.")
                        {
                        }
                        column(ROUND_vatamt_1_; ROUND(vatamt, 1))
                        {
                        }
                        column(descri_1_; descri[1])
                        {
                        }
                        column(Mode_of_Transport___Vechicle_Regn_No_Caption_Control1000000205; Mode_of_Transport___Vechicle_Regn_No_Caption_Control1000000205Lbl)
                        {
                        }
                        column(Packing___ForwardingCaption; Packing___ForwardingCaptionLbl)
                        {
                        }
                        column(EmptyStringCaption_Control1000000208; EmptyStringCaption_Control1000000208Lbl)
                        {
                        }
                        column(Sub_TotalCaption_Control1000000209; Sub_TotalCaption_Control1000000209Lbl)
                        {
                        }
                        column(Sub_TotalCaption_Control1000000211; Sub_TotalCaption_Control1000000211Lbl)
                        {
                        }
                        column(CSTCaption_Control1000000213; CSTCaption_Control1000000213Lbl)
                        {
                        }
                        column(VATCaption_Control1000000216; VATCaption_Control1000000216Lbl)
                        {
                        }
                        column(GRAND_TOTAL___Caption_Control1000000219; GRAND_TOTAL___Caption_Control1000000219Lbl)
                        {
                        }
                        column(InsuranceCaption; InsuranceCaptionLbl)
                        {
                        }
                        column(EmptyStringCaption_Control1000000222; EmptyStringCaption_Control1000000222Lbl)
                        {
                        }
                        column(DataItem1000000223; Goods_once_sold_cannot_be_taken_back_____________________Our_responsibility_cases_ex__our_Works___Godwon______Subject_to_VijaLbl)
                        {
                        }
                        column(Customer_s_Signature__Caption_Control1000000230; Customer_s_Signature__Caption_Control1000000230Lbl)
                        {
                        }
                        column(Round_offCaption_Control1102154004; Round_offCaption_Control1102154004Lbl)
                        {
                        }
                        column(DataItem1000000029; Certified_that_the_Particulars_given_above_are_true_and_correct_and_the_amount_indicated_represents_the_price_actually_chargeLbl)
                        {
                        }
                        column(Rupees__in_Words__Caption; Rupees__in_Words__CaptionLbl)
                        {
                        }
                        column(DataItem1000000000; For_Efftronics_Systems__P__Ltd_______________________________________________________________________________________________Lbl)
                        {
                        }
                        column(Authorised_SignatoryCaption; Authorised_SignatoryCaptionLbl)
                        {
                        }
                        column(Prepared_byCaption; Prepared_byCaptionLbl)
                        {
                        }
                        column(Checked_byCaption; Checked_byCaptionLbl)
                        {
                        }
                        column(Total_Number; Number)
                        {
                        }

                        trigger OnAfterGetRecord();
                        begin

                            //Total, Body (1) - OnPreSection()
                            /* IF choice=choice::Commercialinvoice THEN
                             CurrReport.SHOWOUTPUT:=TRUE;  */

                            IF (choice = choice::saleinvoice) THEN
                                CurrReport.SHOWOUTPUT := FALSE;
                            str := '-';
                            str1 := FORMAT("Sales Invoice Header"."External Document No.");
                            pos := STRPOS(str1, str);
                            IF (pos = 3) OR (pos = 4) THEN
                                CurrReport.SHOWOUTPUT := TRUE;
                            // MESSAGE(FORMAT(ROUND(bedamt+cessamt+ecessamt)));
                            //anil
                            IF roundoff < 0 THEN
                                round1 := -(roundoff);
                            IF roundoff > 0 THEN
                                round1 := roundoff;

                            //Total, Body (2) - OnPreSection()
                            //SREENIVAS-EFF
                            s1 := ROUND(LineAmt + bedamt + cessamt + ecessamt + "Sales Invoice Line"."Tax Amount" + roundoff
                            + "Sales Invoice Line"."Charges To Customer", 1);
                            //  s1:=ROUND(LineTotAmt);
                            //  s1:=subtotal2;   anil
                            check.InitTextVariable;
                            check.FormatNoText(descri, s1, '');


                        end;
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

                DimSetEntry1.SETRANGE("Dimension Set ID", "Dimension Set ID");

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
                group(options)
                {
                    field("No. of Copies"; NoOfCopies)
                    {
                    }
                    field("Show Internal Information"; ShowInternalInfo)
                    {
                    }
                    field("Log Interaction"; LogInteraction)
                    {
                    }
                    field("Round Off Value"; roundoff)
                    {
                    }
                    field(Choice; choice)
                    {
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

    trigger OnInitReport();
    begin
        GLSetup.GET;
    end;

    trigger OnPreReport();
    begin
        //IF NOT CurrReport.USEREQUESTFORM THEN
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
        DimSetEntry1: Record "Dimension Set Entry";
        DimSetEntry2: Record "Dimension Set Entry";
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
        bedcap: Text[6];
        pstr: Record "Posted Str Order Line Details";
        packing: Decimal;
        forwarding: Decimal;
        EPS: Record "Excise Posting Setup";
        bed: Decimal;
        CstVatAmt: Decimal;
        SSH: Record "Sales Shipment Header";
        TDD: Record "Transit Document Order Details";
        wayb1: Text[30];
        Capt12: Text[250];
        formatadress: Codeunit "Format Address";
        CompanyInfo__Phone_No__CaptionLbl: Label 'Phone No.';
        CompanyInfo__Fax_No__CaptionLbl: Label 'Fax No.';
        INVOICE_NO_CaptionLbl: Label 'INVOICE NO:';
        DATE__CaptionLbl: Label 'DATE :';
        Tin_No__28350166764CaptionLbl: Label 'Tin No. 28350166764';
        CST_No__VJ2_07_1_1976_02_05_1988CaptionLbl: Label 'CST No. VJ2-07-1-1976/02-05-1988';
        Consignee_Name___AddressCaptionLbl: Label 'Consignee Name & Address';
        Your_Order_No_CaptionLbl: Label 'Your Order No.';
        Dt__CaptionLbl: Label 'Dt.:';
        TIME_OF_ISSUE_OF_INVOICECaptionLbl: Label 'TIME OF ISSUE:OF INVOICE';
        WAY_BILL_NO_CaptionLbl: Label 'WAY BILL NO.';
        Regd__Office___Factory__CaptionLbl: Label 'Regd. Office - Factory :';
        EmptyStringCaptionLbl: Label ',';
        S_noCaptionLbl: Label 'S.no';
        DescriptionCaptionLbl: Label 'Description';
        QuantityCaptionLbl: Label 'Quantity';
        Unit_PriceCaptionLbl: Label 'Unit Price';
        AmountCaptionLbl: Label 'Amount';
        No_of_PacketsCaptionLbl: Label 'No.of Packets';
        Sch__NoCaptionLbl: Label 'Sch. No';
        Sub_TotalCaptionLbl: Label 'Sub Total';
        C_E__RegN__No__AAACE4879QXM001___________________________________________E_C__Code_No__AAACE_4879Q_XM001_Range_IV_divn_VijayaLbl: Label 'C.E. RegN. No. AAACE4879QXM001                                           E.C. Code No. AAACE 4879Q XM001.Range IV:divn:Vijayawada  Central Revenue Building, M.G. Road, Vijayawada - 520002';
        Details_of_Reduction_Additions_made_to_arrive_at_value_under_sec__4_at_the_ActCaptionLbl: Label 'Details of Reduction/Additions made to arrive at value under sec. 4 at the Act';
        Tariff_Heading_No__CaptionLbl: Label 'Tariff Heading No.:';
        Exemption_notification_No_CaptionLbl: Label 'Exemption notification No.';
        PackingCaptionLbl: Label 'Packing';
        Total_Assessable_Value_or_Tariff_ValueCaptionLbl: Label 'Total Assessable Value or Tariff Value';
        Serial_Number_of_Debit___Entry_in_PLA___Rg_23A_Part_II_CaptionLbl: Label 'Serial Number of Debit   Entry in PLA / Rg-23A Part II:';
        B_E_D__Rate________CaptionLbl: Label '"B.E.D. Rate     :  "';
        Total_Duty_Paid___in_words_CaptionLbl: Label 'Total Duty Paid :(in words)';
        Sub_Total____CaptionLbl: Label 'Sub Total   :';
        E_Cess___2___on_BEDCaptionLbl: Label 'E.Cess:  2 % on BED';
        SHE_Cess___1___on_BEDCaptionLbl: Label 'SHE Cess : 1 % on BED';
        Sub_Total_______CaptionLbl: Label 'Sub Total      :';
        GRAND_TOTAL___CaptionLbl: Label 'GRAND TOTAL  :';
        Mode_of_Transport___Vechicle_Regn_No_CaptionLbl: Label 'Mode of Transport & Vechicle Regn.No:';
        Goods_once_sold_cannot_be_taken_back_____________________Our_responsibility_cases_ex__our_Works___Godown______Subject_to_VijaLbl: Label '"*  Goods once sold cannot be taken back                  *  Our responsibility cases ex; our Works / Godown   *  Subject to Vijayawada Jurisdiction only                  *  E & O.E."';
        Customer_s_Signature__CaptionLbl: Label 'Customer''s Signature :';
        DateCaptionLbl: Label 'Date';
        Time_of_Removal_of_GoodsCaptionLbl: Label 'Time of Removal of Goods';
        EmptyStringCaption_Control1000000082Lbl: Label '------------';
        VATCaptionLbl: Label 'VAT';
        CSTCaptionLbl: Label 'CST';
        Round_offCaptionLbl: Label 'Round off';
        ForwardingCaptionLbl: Label 'Forwarding';
        EmptyStringCaption_Control1102154049Lbl: Label '%';
        EmptyStringCaption_Control1102154050Lbl: Label '%';
        Mode_of_Transport___Vechicle_Regn_No_Caption_Control1000000205Lbl: Label 'Mode of Transport & Vechicle Regn.No:';
        Packing___ForwardingCaptionLbl: Label 'Packing & Forwarding';
        EmptyStringCaption_Control1000000208Lbl: Label '-------------';
        Sub_TotalCaption_Control1000000209Lbl: Label 'Sub Total';
        Sub_TotalCaption_Control1000000211Lbl: Label 'Sub Total';
        CSTCaption_Control1000000213Lbl: Label 'CST';
        VATCaption_Control1000000216Lbl: Label 'VAT';
        GRAND_TOTAL___Caption_Control1000000219Lbl: Label 'GRAND TOTAL  :';
        InsuranceCaptionLbl: Label 'Insurance';
        EmptyStringCaption_Control1000000222Lbl: Label '----------------';
        Goods_once_sold_cannot_be_taken_back_____________________Our_responsibility_cases_ex__our_Works___Godwon______Subject_to_VijaLbl: Label '"*  Goods once sold cannot be taken back                  *  Our responsibility cases ex; our Works / Godwon   *  Subject to Vijayawada Jurisdiction only                  *  E & O.E."';
        Customer_s_Signature__Caption_Control1000000230Lbl: Label 'Customer''s Signature :';
        Round_offCaption_Control1102154004Lbl: Label 'Round off';
        Certified_that_the_Particulars_given_above_are_true_and_correct_and_the_amount_indicated_represents_the_price_actually_chargeLbl: Label 'Certified that the Particulars given above are true and correct and the amount indicated represents the price actually charged and that there is no flow of additional consideration directly or indirectly from the buyer';
        Rupees__in_Words__CaptionLbl: Label 'Rupees (in Words):';
        For_Efftronics_Systems__P__Ltd_______________________________________________________________________________________________Lbl: Label '"For Efftronics Systems (P) Ltd.,                                                                                                                                                                               "';
        Authorised_SignatoryCaptionLbl: Label 'Authorised Signatory';
        Prepared_byCaptionLbl: Label 'Prepared by';
        Checked_byCaptionLbl: Label 'Checked by';

    [LineStart(18901)]
    procedure InitLogInteraction();
    begin
        LogInteraction := SegManagement.FindInteractTmplCode(4) <> '';
    end;
}

