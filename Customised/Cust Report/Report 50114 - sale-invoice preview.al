report 50114 "sale-invoice preview"
{
    DefaultLayout = RDLC;
    RDLCLayout = './sale-invoice preview.rdlc';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            RequestFilterFields = "No.";
            column(Sales_Header_Document_Type; "Document Type")
            {
            }
            column(Sales_Header_No_; "No.")
            {
            }
            dataitem(PageLoop; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                column(STRSUBSTNO_CopyText_; STRSUBSTNO(CopyText))
                {
                }
                column(Sales_Header___Sell_to_Customer_Name_; "Sales Header"."Sell-to Customer Name")
                {
                }
                column(CompanyAddr_1_; CompanyAddr[1])
                {
                }
                column(Sales_Header___Sell_to_City_; "Sales Header"."Sell-to City")
                {
                }
                column(CompanyAddr_2_; CompanyAddr[2])
                {
                }
                column(CompanyAddr_3_; CompanyAddr[3])
                {
                }
                column(CompanyAddr_4_; CompanyAddr[4])
                {
                }
                column(CompanyInfo__Phone_No__; CompanyInfo."Phone No.")
                {
                }
                column(CompanyInfo__Fax_No__; CompanyInfo."Fax No.")
                {
                }
                column(FORMAT__Sales_Header___Posting_Date__0_4_; FORMAT("Sales Header"."Posting Date", 0, 4))
                {
                }
                column(Sales_Header___External_Document_No__; "Sales Header"."External Document No.")
                {
                }
                column(Sales_Header___Customer_OrderNo__; "Sales Header"."Customer OrderNo.")
                {
                }
                column(FORMAT__Sales_Header___Customer_Order_Date__0_4_; FORMAT("Sales Header"."Customer Order Date", 0, 4))
                {
                }
                column(Sales_Header___Ship_to_Address_; "Sales Header"."Ship-to Address")
                {
                }
                column(cap; cap)
                {
                }
                column(TIME; TIME)
                {
                }
                column(Sales_Header__WayBillNo; "Sales Header".WayBillNo)
                {
                }
                column(Sales_Header___Ship_to_Address_2_; "Sales Header"."Ship-to Address 2")
                {
                }
                column(Sales_Header___Ship_to_Name_; "Sales Header"."Ship-to Name")
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
                column(PageLoop_Number; Number)
                {
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
                    /*IF NOT CurrReport.PREVIEW THEN
                      SalesInvCountPrinted.RUN("Sales Invoice Header");
                     */

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
            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = SORTING(Document Type, Document No., Line No.) WHERE(Quantity = FILTER(> 0));
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
                    AutoFormatType = 2;
                }
                column(tot_1__5_; tot[1] [5])
                {
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
                    AutoFormatType = 2;
                }
                column(tot_2__5_; tot[2] [5])
                {
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
                    AutoFormatType = 1;
                }
                column(tot_3__4_; tot[3] [4])
                {
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
                    AutoFormatType = 2;
                }
                column(tot_4__5_; tot[4] [5])
                {
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
                    AutoFormatType = 2;
                }
                column(tot_5__5_; tot[5] [5])
                {
                    AutoFormatType = 1;
                }
                column(tot_6__1_; tot[6] [1])
                {
                }
                column(tot_6__2_; tot[6] [2])
                {
                }
                column(tot_6__3_; tot[6] [3])
                {
                }
                column(tot_6__4_; tot[6] [4])
                {
                    AutoFormatType = 2;
                }
                column(tot_6__5_; tot[6] [5])
                {
                    AutoFormatType = 1;
                }
                column(tot_7__1_; tot[7] [1])
                {
                }
                column(d1_7_; d1[7])
                {
                }
                column(tot_7__2_; tot[7] [2])
                {
                }
                column(tot_7__3_; tot[7] [3])
                {
                }
                column(tot_7__4_; tot[7] [4])
                {
                    AutoFormatType = 2;
                }
                column(tot_7__5_; tot[7] [5])
                {
                    AutoFormatType = 1;
                }
                column(tot_8__1_; tot[8] [1])
                {
                }
                column(d1_8_; d1[8])
                {
                }
                column(tot_8__2_; tot[8] [2])
                {
                }
                column(tot_8__3_; tot[8] [3])
                {
                }
                column(tot_8__4_; tot[8] [4])
                {
                    AutoFormatType = 2;
                }
                column(tot_8__5_; tot[8] [5])
                {
                    AutoFormatType = 1;
                }
                column(d1_9_; d1[9])
                {
                }
                column(tot_9__2_; tot[9] [2])
                {
                }
                column(tot_9__3_; tot[9] [3])
                {
                }
                column(tot_9__4_; tot[9] [4])
                {
                    AutoFormatType = 2;
                }
                column(tot_9__5_; tot[9] [5])
                {
                    AutoFormatType = 1;
                }
                column(tot_10__1_; tot[10] [1])
                {
                }
                column(d1_10_; d1[10])
                {
                }
                column(tot_10__2_; tot[10] [2])
                {
                }
                column(tot_10__3_; tot[10] [3])
                {
                }
                column(tot_10__4_; tot[10] [4])
                {
                    AutoFormatType = 2;
                }
                column(tot_10__5_; tot[10] [5])
                {
                    AutoFormatType = 1;
                }
                column(d1_6_; d1[6])
                {
                }
                column(tot_9__1_; tot[9] [1])
                {
                }
                column(ROUND_totalbed_1_; ROUND(totalbed, 1))
                {
                }
                column(FORMAT_ROUND_LineAmt_1_____00_; FORMAT(ROUND(LineAmt, 1)) + '.00')
                {
                    AutoFormatType = 1;
                }
                column(subtotal2; subtotal2)
                {
                }
                column(s; s)
                {
                }
                column(ROUND_LineAmt_1_; ROUND(LineAmt, 1))
                {
                }
                column(ROUND_LineAmt_1__ROUND_bedamt_1__; (ROUND(LineAmt, 1) + ROUND(bedamt, 1)))
                {
                }
                column(ROUND_totalcess_1_; ROUND(totalcess, 1))
                {
                }
                column(ROUND_totalecess_1_; ROUND(totalecess, 1))
                {
                }
                column(sub1; sub1)
                {
                }
                column(FORMAT__Sales_Header___Posting_Date__0_4__Control1102154153; FORMAT("Sales Header"."Posting Date", 0, 4))
                {
                }
                column(Sales_Header___Transport_Method_; "Sales Header"."Transport Method")
                {
                }
                column(capt; capt)
                {
                }
                column(descri1_1_; descri1[1])
                {
                }
                column(TIME_3600000; TIME + 3600000)
                {
                }
                column(descri1_2_; descri1[2])
                {
                }
                column(caplabel; caplabel)
                {
                }
                column(ROUND_totalvat_1_; ROUND(totalvat, 1))
                {
                }
                column(ROUND_totaltax_1_; ROUND(totaltax, 1))
                {
                }
                column(caplabel1; caplabel1)
                {
                }
                column(round1; round1)
                {
                }
                column(S_NoCaption; S_NoCaptionLbl)
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
                column(Sub_TotalCaption; Sub_TotalCaptionLbl)
                {
                }
                column(DataItem1102154116; C_E__RegN__No__AAACE4879QXM001____________________E_C__Code_No__AAACE_4879Q_XM001_____________Range_IV_divn_Vijayawada_______Lbl)
                {
                }
                column(Details_of_Reduction_Additions_mada_to_arrive_at_value_under_sec__4_at_the_ActCaption; Details_of_Reduction_Additions_mada_to_arrive_at_value_under_sec__4_at_the_ActCaptionLbl)
                {
                }
                column(Tariff_Heading_No__Caption; Tariff_Heading_No__CaptionLbl)
                {
                }
                column(Exemption_notification_No_Caption; Exemption_notification_No_CaptionLbl)
                {
                }
                column(Packing___ForwardingCaption; Packing___ForwardingCaptionLbl)
                {
                }
                column(Total_Assessable_Value_or_Tariff_ValueCaption; Total_Assessable_Value_or_Tariff_ValueCaptionLbl)
                {
                }
                column(Serial_Number_of_Debit___Entry_in_PLA___Rg_23A_Part_II_Caption; Serial_Number_of_Debit___Entry_in_PLA___Rg_23A_Part_II_CaptionLbl)
                {
                }
                column(B_E_D__Rate________10_Caption; B_E_D__Rate________10_CaptionLbl)
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
                column(DataItem1102154132; Goods_once_sold_cannot_be_taken_back_____________________Our_responsibility_cases_ex__our_Works___Godwon______Subject_to_VijaLbl)
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
                column(EmptyStringCaption; EmptyStringCaptionLbl)
                {
                }
                column(EmptyStringCaption_Control1102154168; EmptyStringCaption_Control1102154168Lbl)
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
                column(Sales_Line_Document_Type; "Document Type")
                {
                }
                column(Sales_Line_Document_No_; "Document No.")
                {
                }
                column(Sales_Line_Line_No_; "Line No.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    // NAVIN
                    //SREENIVAS-EFF
                    bedamt := 0;
                    vatamt := 0;
                    taxamt := 0;
                    cessamt := 0;
                    ecessamt := 0;
                    LineAmt := 0;
                    n := n + 1;
                    IF ("Sales Line"."Unit Price" = 0) THEN BEGIN
                        c := 1;
                        n := n - c;
                        CurrReport.SKIP;
                    END;

                    BED := 0;
                    EPS.SETRANGE("Excise Bus. Posting Group", "Sales Line"."Excise Bus. Posting Group");
                    EPS.SETRANGE("Excise Prod. Posting Group", "Sales Line"."Excise Prod. Posting Group");
                    IF ("Sales Header"."Posting Date" <> 0D) THEN
                        EPS.SETRANGE("From Date", 0D, "Sales Header"."Posting Date")
                    ELSE
                        EPS.SETRANGE("From Date", 0D, WORKDATE);
                    IF EPS.FIND('+') THEN
                        BED := EPS."BED %";


                    IF ("Sales Line"."Tax Group Code" = 'SOFTWARE') THEN
                        capt := '';
                    IF (("Sales Line"."Tax Group Code" = 'BOI-COMPUT') OR ("Sales Line"."Tax Group Code" = 'BOI-O') OR (
                    "Sales Line"."Tax Group Code" = 'BOI-O 2%') OR ("Sales Line"."Tax Group Code" = 'RAW') OR (
                    "Sales Line"."Tax Group Code" = 'RAW 10.5') OR ("Sales Line"."Tax Group Code" = 'RAW 12.5') OR
                    ("Sales Line"."Tax Group Code" = '2%')) THEN BEGIN
                        cap := 'COMMERCIAL INVOICE CUM DELIVERY CHALLAN';
                        CopyText := '';
                        capt := '(Bought out item)';
                    END ELSE
                        cap := 'SALE INVOICE CUM DELIVERY CHALLAN';

                    IF "Sales Line"."Excise Bus. Posting Group" = 'EXPORT' THEN
                        cap := 'EXPORT INVOICE CUM DELIVERY CHALLAN';
                    IF "Sales Line"."Qty. to Ship" <> 0 THEN BEGIN
                        LineAmt := "Sales Line"."Qty. to Ship" * "Unit Price";
                        LineTotAmt := LineTotAmt + LineAmt;
                    END;
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
                            IF StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::GST THEN
                                ServiceTax := ServiceTax + ABS(StructureLineDetails.Amount);
                            IF (NOT (StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::Excise)) THEN
                                LineTotAmt := LineTotAmt + ABS(StructureLineDetails.Amount);
                        UNTIL StructureLineDetails.NEXT = 0;
                    // NAVIN
                    ExciseAmount += "BED Amount" + "AED(GSI) Amount" + "AED(TTA) Amount" + "SED Amount" + "SAED Amount" + "CESS Amount" +
                                    "NCCD Amount" + "eCess Amount" + "ADET Amount";
                    LineTotAmt += "BED Amount" + "AED(GSI) Amount" + "AED(TTA) Amount" + "SED Amount" + "SAED Amount" + "CESS Amount" +
                                  "NCCD Amount" + "eCess Amount" + "ADET Amount";
                    IF (Type = Type::"G/L Account") AND (NOT ShowInternalInfo) THEN
                        "No." := '';
                    //SREENIVAS -EFF
                    IF "Sales Line"."Tax Group Code" = 'MPBI' THEN BEGIN
                        s := '84711000';
                        capt := '(Microprocessor based data acquisition&control system)';
                    END;
                    IF "Sales Line"."Tax Group Code" = 'EDB' THEN BEGIN
                        s := '85414020';
                        capt := '(Electronic Moving Display unit for information Text)';
                    END;
                    IF "Sales Line"."Tax Group Code" = 'SOFTWARE' THEN BEGIN
                        s := '85249112';
                    END;
                    IF ("Sales Line"."Qty. to Ship" <> 0) THEN BEGIN
                        IF (("Sales Line"."Tax Group Code" = 'BOI-COMPUT') OR ("Sales Line"."Tax Group Code" = 'BOI-O') OR (
                           "Sales Line"."Tax Group Code" = 'BOI-O 2%') OR ("Sales Line"."Tax Group Code" = 'RAW') OR (
                           "Sales Line"."Tax Group Code" = 'RAW 10.5') OR ("Sales Line"."Tax Group Code" = 'RAW 12.5') OR
                           ("Sales Line"."Tax Group Code" = 'SOFTWARE') OR ("Sales Line"."Tax Group Code" = '2%')) THEN BEGIN
                            bedamt := 0;
                            cessamt := 0;
                            ecessamt := 0;
                        END ELSE BEGIN
                            bedamt := bedamt + (("Sales Line"."Unit Price" * "Sales Line"."Qty. to Ship") * BED / 100);
                            cessamt := cessamt + (bedamt) * 2 / 100;
                            ecessamt := ecessamt + (bedamt) * 1 / 100;
                        END;
                        IF (("Sales Header".Structure = 'SALE-E+CST') OR ("Sales Header".Structure = 'SALE-CST')) AND ("Sales Line"."Tax %" = 2) THEN BEGIN
                            caplabel := '(2% aganist Form - C)';
                            taxamt := (("Sales Line"."Unit Price" * "Sales Line"."Qty. to Ship") + bedamt + cessamt + ecessamt) * 0.02;
                        END;
                        IF ("Sales Line"."Tax %" = 0) THEN
                            caplabel := '';
                        IF (("Sales Header".Structure = 'SALE-E+CST') OR ("Sales Header".Structure = 'SALE-CST')) AND ("Sales Line"."Tax %" = 3) THEN BEGIN
                            caplabel := '(3% aganist Form - C)';
                            taxamt := (("Sales Line"."Unit Price" * "Sales Line"."Qty. to Ship") + bedamt + cessamt + ecessamt) * 0.03;
                        END;
                        IF (("Sales Header".Structure = 'SALE-E+CST') OR ("Sales Header".Structure = 'SALE-CST')) AND ("Sales Line"."Tax %" = 12.5) THEN BEGIN
                            caplabel := '(12.5%)';
                            taxamt := (("Sales Line"."Unit Price" * "Sales Line"."Qty. to Ship") + bedamt + cessamt + ecessamt) * 0.125;
                        END;
                        IF (("Sales Header".Structure = 'SALE-E+V') OR ("Sales Header".Structure = 'SALE-VAT')) AND ("Sales Line"."VAT %" = 4) THEN BEGIN
                            caplabel1 := '4%';
                            vatamt := (("Sales Line"."Unit Price" * "Sales Line"."Qty. to Ship") + bedamt + cessamt + ecessamt) * 0.04;
                        END;
                        IF (("Sales Header".Structure = 'SALE-E+V') OR ("Sales Header".Structure = 'SALE-VAT')) AND ("Sales Line"."VAT %" = 12.5) THEN BEGIN
                            caplabel1 := '12.5%';
                            vatamt := (("Sales Line"."Unit Price" * "Sales Line"."Qty. to Ship") + bedamt + cessamt + ecessamt) * 0.125;
                        END;
                        IF ("Sales Line"."VAT %" = 0) THEN BEGIN
                            caplabel1 := '';
                        END;
                        // IF ("Sales Line"."VAT %"=3) THEN
                        // caplabel1:='3%';
                        totaltax += taxamt;
                        totalvat += vatamt;
                        totalbed += bedamt;
                        totalcess += cessamt;
                        totalecess += ecessamt;
                        sub += ("Sales Line"."Unit Price" * "Sales Line"."Qty. to Ship") + bedamt;
                        sub1 := sub + totalcess + totalecess;
                        sub2 := sub1 + totaltax + totalvat;
                        subtotal := ROUND(sub, 1);
                        subtotal1 := ROUND(sub1, 1);
                        subtotal2 := ROUND(sub2, 1);

                    END;
                end;

                trigger OnPreDataItem();
                begin
                    // NAVIN
                    n := 0;
                    k := 1;
                    LineTotAmt := 0;
                    ExciseAmount := 0;
                    totaltax := 0;
                    totalvat := 0;
                    totalcess := 0;
                    totalecess := 0;
                    Charges := 0;
                    Othertaxes := 0;
                    SalesTax := 0;
                    bedamt := 0;
                    servicetaxamt := 0;
                    servicecess := 0;

                    // NAVIN

                    FOR i := 1 TO 10 DO BEGIN
                        d1[k] := '';
                    END;

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
                end;
            }
            dataitem(Total; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                column(descri_2_; descri[2])
                {
                }
                column(descri_1_; descri[1])
                {
                }
                column(descri_3_; descri[3])
                {
                }
                column(DataItem1102154185; Certified_that_the_Particulars_given_above_are_true_and_correct_and_the_amount_indicated_represents_the_price_actually_chargeLbl)
                {
                }
                column(Rupees__in_Words__Caption; Rupees__in_Words__CaptionLbl)
                {
                }
                column(DataItem1102154191; For_Efftronics_Systems__P__Ltd_______________________________________________________________________________________________Lbl)
                {
                }
                column(Authorised_SignatoryCaption; Authorised_SignatoryCaptionLbl)
                {
                }
                column(Total_Number; Number)
                {
                }
            }

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
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
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
        descri: array[4] of Text[30];
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
        capt: Text[60];
        j: Text[30];
        s2: Decimal;
        descri1: array[4] of Text[30];
        caplabel: Text[30];
        waybillno: Code[10];
        caplabel1: Text[30];
        d1: array[10] of Text[100];
        tot: array[10, 5] of Text[30];
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
        Text000: Label 'Salesperson';
        Text001: Label 'Total %1';
        Text002: Label 'Total %1 Incl. VAT';
        Text003: Label 'DUPLICATE FOR TRANSPORTER';
        Text004: Label 'Sales - Invoice %1';
        Text005: Label 'Page %1';
        Text006: Label 'Total %1 Excl. VAT';
        text007: Label 'EXTRA COPY';
        text008: Label 'TRIPLICATE FOR ASSESSEE';
        text009: Label 'ORIGINAL FOR BUYER';
        totalbed: Decimal;
        totaltax: Decimal;
        totalvat: Decimal;
        totalcess: Decimal;
        totalecess: Decimal;
        EPS: Record "Excise Posting Setup";
        BED: Decimal;
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
        S_NoCaptionLbl: Label 'S.No';
        DescriptionCaptionLbl: Label 'Description';
        QuantityCaptionLbl: Label 'Quantity';
        Unit_PriceCaptionLbl: Label 'Unit Price';
        AmountCaptionLbl: Label 'Amount';
        No_of_PacketsCaptionLbl: Label 'No.of Packets';
        Sub_TotalCaptionLbl: Label 'Sub Total';
        C_E__RegN__No__AAACE4879QXM001____________________E_C__Code_No__AAACE_4879Q_XM001_____________Range_IV_divn_Vijayawada_______Lbl: Label 'C.E. RegN. No. AAACE4879QXM001                    E.C. Code No. AAACE 4879Q XM001.            Range IV:divn:Vijayawada                                Central Revenue Building, M.G. Raod, Vijayawada - 520002';
        Details_of_Reduction_Additions_mada_to_arrive_at_value_under_sec__4_at_the_ActCaptionLbl: Label 'Details of Reduction/Additions mada to arrive at value under sec. 4 at the Act';
        Tariff_Heading_No__CaptionLbl: Label 'Tariff Heading No.:';
        Exemption_notification_No_CaptionLbl: Label 'Exemption notification No.';
        Packing___ForwardingCaptionLbl: Label 'Packing & Forwarding';
        Total_Assessable_Value_or_Tariff_ValueCaptionLbl: Label 'Total Assessable Value or Tariff Value';
        Serial_Number_of_Debit___Entry_in_PLA___Rg_23A_Part_II_CaptionLbl: Label 'Serial Number of Debit   Entry in PLA / Rg-23A Part II:';
        B_E_D__Rate________10_CaptionLbl: Label 'B.E.D. Rate     :  10%';
        Total_Duty_Paid___in_words_CaptionLbl: Label 'Total Duty Paid :(in words)';
        Sub_Total____CaptionLbl: Label 'Sub Total   :';
        E_Cess___2___on_BEDCaptionLbl: Label 'E.Cess:  2 % on BED';
        SHE_Cess___1___on_BEDCaptionLbl: Label 'SHE Cess : 1 % on BED';
        Sub_Total_______CaptionLbl: Label 'Sub Total      :';
        GRAND_TOTAL___CaptionLbl: Label 'GRAND TOTAL  :';
        Mode_of_Transport___Vechicle_Regn_No_CaptionLbl: Label 'Mode of Transport & Vechicle Regn.No:';
        Goods_once_sold_cannot_be_taken_back_____________________Our_responsibility_cases_ex__our_Works___Godwon______Subject_to_VijaLbl: Label '"*  Goods once sold cannot be taken back                  *  Our responsibility cases ex; our Works / Godwon   *  Subject to Vijayawada Jurisdiction only                  *  E & O.E."';
        Customer_s_Signature__CaptionLbl: Label 'Customer''s Signature :';
        DateCaptionLbl: Label 'Date';
        Time_of_Removal_of_GoodsCaptionLbl: Label 'Time of Removal of Goods';
        EmptyStringCaptionLbl: Label '------------';
        EmptyStringCaption_Control1102154168Lbl: Label '-------------';
        VATCaptionLbl: Label 'VAT';
        CSTCaptionLbl: Label 'CST';
        Round_offCaptionLbl: Label 'Round off';
        Certified_that_the_Particulars_given_above_are_true_and_correct_and_the_amount_indicated_represents_the_price_actually_chargeLbl: Label 'Certified that the Particulars given above are true and correct and the amount indicated represents the price actually charged and that there is no flow of additional consideration directly or indirectly from the buyer';
        Rupees__in_Words__CaptionLbl: Label 'Rupees (in Words):';
        For_Efftronics_Systems__P__Ltd_______________________________________________________________________________________________Lbl: Label '"For Efftronics Systems (P) Ltd.,                                                                                                                                                                               "';
        Authorised_SignatoryCaptionLbl: Label 'Authorised Signatory';

    [LineStart(6919)]
    procedure InitLogInteraction();
    begin
    end;
}

