report 50151 "Proforma Invoice1"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Proforma Invoice1.rdlc';

    dataset
    {
        dataitem("Sales Header";"Sales Header")
        {
            DataItemTableView = WHERE(Document Type=FILTER(Order));
            RequestFilterFields = "No.";
            column(Sales_Header__Sales_Header___Sell_to_City_;"Sales Header"."Sell-to City")
            {
            }
            column(Sales_Header__Sales_Header___Sell_to_Customer_Name_;"Sales Header"."Sell-to Customer Name")
            {
            }
            column(FORMAT__Sales_Header___Customer_Order_Date__0_4_;FORMAT("Sales Header"."Customer Order Date",0,4))
            {
            }
            column(Sales_Header__Sales_Header___Customer_OrderNo__;"Sales Header"."Customer OrderNo.")
            {
            }
            column(FORMAT__Sales_Header___Posting_Date__0_4_;FORMAT("Sales Header"."Posting Date",0,4))
            {
            }
            column(Sales_Header__Sales_Header___Ship_to_Address_;"Sales Header"."Ship-to Address")
            {
            }
            column(Sales_Header__Sales_Header___Ship_to_Name_;"Sales Header"."Ship-to Name")
            {
            }
            column(Sales_Header__Sales_Header___Ship_to_Address_2_;"Sales Header"."Ship-to Address 2")
            {
            }
            column(ConsigneeCaption;ConsigneeCaptionLbl)
            {
            }
            column(Sold_toCaption;Sold_toCaptionLbl)
            {
            }
            column(DataItem1102154004;With_Reference_to_the_above_purchase_order__we_here_by_inform_that_RDSO_inspection_is_completed__will_be_completed_in______daLbl)
            {
            }
            column(Dear_Sir_Caption;Dear_Sir_CaptionLbl)
            {
            }
            column(Order_No_Caption;Order_No_CaptionLbl)
            {
            }
            column(Dt_Caption;Dt_CaptionLbl)
            {
            }
            column(TIN_NO__28350166764Caption;TIN_NO__28350166764CaptionLbl)
            {
            }
            column(CST_NO__VJ2_07_02_1976_2002_03Caption;CST_NO__VJ2_07_02_1976_2002_03CaptionLbl)
            {
            }
            column(TOCaption;TOCaptionLbl)
            {
            }
            column(DT_Caption_Control1102154014;DT_Caption_Control1102154014Lbl)
            {
            }
            column(PROFORMA_INVOICECaption;PROFORMA_INVOICECaptionLbl)
            {
            }
            column(Sales_Header_Document_Type;"Document Type")
            {
            }
            column(Sales_Header_No_;"No.")
            {
            }
            dataitem("Sales Line";"Sales Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = SORTING(Document Type,Document No.,Line No.) ORDER(Ascending);
                column(Sales_Line__Sales_Line__Description;"Sales Line".Description)
                {
                }
                column(Sales_Line__Sales_Line___Qty__to_Ship_;"Sales Line"."Qty. to Ship")
                {
                }
                column(Sales_Line__Sales_Line___Unit_Price_;"Sales Line"."Unit Price")
                {
                    AutoFormatExpression = "Sales Line"."Currency Code";
                    AutoFormatType = 2;
                }
                column(lineamt;lineamt)
                {
                    AutoFormatExpression = "Sales Line"."Currency Code";
                    AutoFormatType = 1;
                }
                column(n;n)
                {
                }
                column(totlineamt;totlineamt)
                {
                }
                column(exciseamt;exciseamt)
                {
                    AutoFormatExpression = "Sales Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(totcst;totcst)
                {
                    AutoFormatExpression = "Sales Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(totinvoicevalue_advance;totinvoicevalue-advance)
                {
                    AutoFormatExpression = "Sales Header"."Currency Code";
                    AutoFormatType = 1;
                }
                column(DescriptionLine_1_;DescriptionLine[1])
                {
                }
                column(totvat;totvat)
                {
                }
                column(desc;desc)
                {
                }
                column(s1;s1)
                {
                }
                column(s2;s2)
                {
                }
                column(ROUND__Sales_Line___RDSO_Charges__1_;ROUND("Sales Line"."RDSO Charges",1))
                {
                }
                column(advance;advance)
                {
                }
                column(Dutycap;Dutycap)
                {
                }
                column(dutyper;dutyper)
                {
                }
                column(taxcap;taxcap)
                {
                }
                column(vatcap;vatcap)
                {
                }
                column(QtyCaption;QtyCaptionLbl)
                {
                }
                column(Unit_PriceCaption;Unit_PriceCaptionLbl)
                {
                }
                column(AmountCaption;AmountCaptionLbl)
                {
                }
                column(S_NoCaption;S_NoCaptionLbl)
                {
                }
                column(Description_of_GoodsCaption;Description_of_GoodsCaptionLbl)
                {
                }
                column(SubtotalCaption;SubtotalCaptionLbl)
                {
                }
                column(RDSO_ChargesCaption;RDSO_ChargesCaptionLbl)
                {
                }
                column(Grand_TotalCaption;Grand_TotalCaptionLbl)
                {
                }
                column(for_EFFTRONICS_SYSTEMS_PVT__LTD__Caption;for_EFFTRONICS_SYSTEMS_PVT__LTD__CaptionLbl)
                {
                }
                column(AUTHORISED_SIGNATORYCaption;AUTHORISED_SIGNATORYCaptionLbl)
                {
                }
                column(In_words_Caption;In_words_CaptionLbl)
                {
                }
                column(AdvanceCaption;AdvanceCaptionLbl)
                {
                }
                column(Sales_Line_Document_Type;"Document Type")
                {
                }
                column(Sales_Line_Document_No_;"Document No.")
                {
                }
                column(Sales_Line_Line_No_;"Line No.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                      BED:=0;
                      EPS.SETRANGE("Excise Bus. Posting Group","Sales Line"."Excise Bus. Posting Group");
                      EPS.SETRANGE("Excise Prod. Posting Group","Sales Line"."Excise Prod. Posting Group");
                      IF ("Sales Header"."Posting Date"<> 0D) THEN
                        EPS.SETRANGE("From Date",0D,"Sales Header"."Posting Date")
                      ELSE
                        EPS.SETRANGE("From Date",0D,WORKDATE);
                      IF EPS.FIND('+') THEN
                         BED:=EPS."BED %";

                    IF "Sales Line"."Qty. to Ship">0 THEN
                    BEGIN
                     lineamt:=0;
                     bedamt:=0;
                     cessamt:=0;
                     vatamt:=0;
                     taxamt:=0;
                     n:=n+1;
                     lineamt:=ROUND("Sales Line"."Qty. to Ship"*"Sales Line"."Unit Price",1);
                     totlineamt:=lineamt+totlineamt;
                    IF (("Sales Header".Structure='SALE-E+CST')OR("Sales Header".Structure='SALE-E+VAT')) THEN
                     bedamt:=bedamt+ROUND(lineamt*BED/100,1);
                     cessamt:=cessamt+ROUND(bedamt*3/100,1);
                     exciseamt:=exciseamt+bedamt+cessamt;
                     subtotal:=subtotal+totlineamt+exciseamt;
                     IF (("Sales Header".Structure='SALE-E+CST')OR("Sales Header".Structure='SALE-CST')) THEN
                     BEGIN
                      taxamt:=ROUND((lineamt+bedamt+cessamt)*("Sales Line"."Tax %"/100),1);
                      totcst:=totcst+taxamt;
                      Dutycap:='Excise(10.3%)';
                    //  dutyper:=FORMAT("Sales Line"."BED %");
                      taxcap:='CST';
                     END;

                     IF (("Sales Header".Structure='SALE-E+VAT')OR("Sales Header".Structure='SALE-VAT')) THEN
                     BEGIN
                      vatamt:=ROUND((lineamt+bedamt+cessamt)*("Sales Line"."Tax %"/100),1);
                      totvat:=totvat+vatamt;
                      Dutycap:='Excise(10.3%)';
                    //  dutyper:=FORMAT("Sales Line"."BED %");
                      taxcap:='VAT';
                     END;

                    IF ("Sales Line"."Tax Area Code"='SALES CST') THEN
                    BEGIN
                      IF ("Sales Line"."Tax %"=2)   THEN
                      BEGIN
                      desc:='(Against Form-C)';
                      s1:='2%';
                      END;
                      IF ("Sales Line"."Tax %"=3)   THEN
                      BEGIN
                      desc:='(Against Form-C)';
                      s1:='3%';
                      END;
                      IF ("Sales Line"."Tax %"=12.5) THEN
                      BEGIN
                      desc:='';
                      s1:='12.5%';
                      END;
                    END ELSE
                    s1:='';

                     IF ("Sales Line"."Tax Area Code"='SALES VAT') THEN
                      BEGIN
                       IF("Sales Line"."Tax %"=4) THEN
                       s2:='4%';
                       IF("Sales Line"."Tax %"=12.5) THEN
                       s2:='12.5%';
                       IF("Sales Line"."Tax %"=14.5) THEN
                       s2:='14.5%';
                      END ELSE
                      s2:='';
                    END;
                end;
            }

            trigger OnPreDataItem();
            begin
                totlineamt:=0;
                exciseamt:=0;
                //totinvoicevalue:=0;
                totvat:=0;
                totcst:=0;
                n:=0;
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
        lineamt : Decimal;
        totlineamt : Decimal;
        Dutycap : Text[30];
        dutyper : Text[30];
        taxcap : Text[30];
        vatcap : Text[30];
        descrienable : Boolean;
        s1 : Text[30];
        s2 : Text[30];
        exciseamt : Decimal;
        taxamt : Decimal;
        vatamt : Decimal;
        subtotal : Decimal;
        totinvoicevalue : Decimal;
        bedamt : Decimal;
        cessamt : Decimal;
        totvat : Decimal;
        totcst : Decimal;
        check : Report Check;
        s : Decimal;
        advance : Decimal;
        n : Integer;
        DescriptionLine : array [2] of Text[132];
        desc : Text[30];
        BED : Decimal;
        EPS : Record "Excise Posting Setup";
        ConsigneeCaptionLbl : Label 'Consignee';
        Sold_toCaptionLbl : Label 'Sold-to';
        With_Reference_to_the_above_purchase_order__we_here_by_inform_that_RDSO_inspection_is_completed__will_be_completed_in______daLbl : Label 'With Reference to the above purchase order ,we here by inform that RDSO inspection is completed/ will be completed in ____ days. Hence We request to kindly Release the payment at the earliest';
        Dear_Sir_CaptionLbl : Label 'Dear Sir,';
        Order_No_CaptionLbl : Label 'Order No.';
        Dt_CaptionLbl : Label 'Dt:';
        TIN_NO__28350166764CaptionLbl : Label 'TIN NO: 28350166764';
        CST_NO__VJ2_07_02_1976_2002_03CaptionLbl : Label 'CST NO: VJ2-07-02-1976/2002-03';
        TOCaptionLbl : Label 'TO';
        DT_Caption_Control1102154014Lbl : Label 'DT:';
        PROFORMA_INVOICECaptionLbl : Label 'PROFORMA INVOICE';
        QtyCaptionLbl : Label 'Qty';
        Unit_PriceCaptionLbl : Label 'Unit Price';
        AmountCaptionLbl : Label 'Amount';
        S_NoCaptionLbl : Label 'S.No';
        Description_of_GoodsCaptionLbl : Label 'Description of Goods';
        SubtotalCaptionLbl : Label 'Subtotal';
        RDSO_ChargesCaptionLbl : Label 'RDSO Charges';
        Grand_TotalCaptionLbl : Label 'Grand Total';
        for_EFFTRONICS_SYSTEMS_PVT__LTD__CaptionLbl : Label 'for EFFTRONICS SYSTEMS PVT. LTD.,';
        AUTHORISED_SIGNATORYCaptionLbl : Label 'AUTHORISED SIGNATORY';
        In_words_CaptionLbl : Label '(In words)';
        AdvanceCaptionLbl : Label 'Advance';
        NOTE_________________________________________________________________________________________________________________________Lbl : Label 'NOTE :                                                                                                                                                 1.SALES TAX CHARGED IN THE ABOVE INVOICE AT 2% AGAINST ''C'' FORM,  IN CASE          ''C'' FORM NOT PROVIDED, REMAINING 2% SALES TAX WILL BE CHARGED EXTRA      2. TRANSPORTATION EXTRA AT ACTUALS OR TO PAY';
}

