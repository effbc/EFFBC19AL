report 50112 "Daily Stock Account 2"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Daily Stock Account 2.rdlc';

    dataset
    {
        dataitem("Sales Invoice Line"; "Sales Invoice Line")
        {
            RequestFilterFields = "Tax Group Code";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PAGENO)
            {
            }
            column(USERID; USERID)
            {
            }
            column(fromdate; fromdate)
            {
            }
            column(todate; todate)
            {
            }
            column(cap; cap)
            {
            }
            column(Sales_Invoice_Line__Shipment_Date_; "Shipment Date")
            {
            }
            column(Sales_Invoice_Line_Quantity; Quantity)
            {
            }
            column(Sales_Invoice_Line__Line_Amount_; "Line Amount")
            {
            }
            column(Sales_Invoice_Line__Excise_Amount_; "Excise Amount")
            {
            }
            column(Sales_Invoice_Line__eCess_Amount_; "eCess Amount")
            {
            }
            column(Sales_Invoice_Line_Quantity_Control1102154031; Quantity)
            {
            }
            column(Sales_Invoice_Line_Quantity_Control1102154034; Quantity)
            {
            }
            column(no; no)
            {
            }
            column(Totalqty; Totalqty)
            {
            }
            column(totalamt; totalamt)
            {
            }
            column(totalexcise; totalexcise)
            {
            }
            column(totalcess; totalcess)
            {
            }
            column(Daily_Stock_AccountCaption; Daily_Stock_AccountCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(For_Assessees_working_under_Self_Removal_Procedure_Caption; For_Assessees_working_under_Self_Removal_Procedure_CaptionLbl)
            {
            }
            column(FromCaption; FromCaptionLbl)
            {
            }
            column(ToCaption; ToCaptionLbl)
            {
            }
            column(DateCaption; DateCaptionLbl)
            {
            }
            column(Sales_Invoice_Line_QuantityCaption; FIELDCAPTION(Quantity))
            {
            }
            column(ValueCaption; ValueCaptionLbl)
            {
            }
            column(RateCaption; RateCaptionLbl)
            {
            }
            column(AmountCaption; AmountCaptionLbl)
            {
            }
            column(In_bonded_Store_room_s_Caption; In_bonded_Store_room_s_CaptionLbl)
            {
            }
            column(In_his_roomCaption; In_his_roomCaptionLbl)
            {
            }
            column(Opening_BalanceCaption; Opening_BalanceCaptionLbl)
            {
            }
            column(Quantity_ManfacuturedCaption; Quantity_ManfacuturedCaptionLbl)
            {
            }
            column(Total_of_Col_2_3Caption; Total_of_Col_2_3CaptionLbl)
            {
            }
            column(On_payment_of_dutyCaption; On_payment_of_dutyCaptionLbl)
            {
            }
            column(For_home_useCaption; For_home_useCaptionLbl)
            {
            }
            column(For_export_under_claim_for_rebate_of_dutyCaption; For_export_under_claim_for_rebate_of_dutyCaptionLbl)
            {
            }
            column(To_other_Factiores_or_Warehouses_under_bondCaption; To_other_Factiores_or_Warehouses_under_bondCaptionLbl)
            {
            }
            column(QuantityCaption; QuantityCaptionLbl)
            {
            }
            column(ValueCaption_Control1102154036; ValueCaption_Control1102154036Lbl)
            {
            }
            column(For_other_purposesCaption; For_other_purposesCaptionLbl)
            {
            }
            column(PurposeCaption; PurposeCaptionLbl)
            {
            }
            column(QuantityCaption_Control1102154039; QuantityCaption_Control1102154039Lbl)
            {
            }
            column(WithoutCaption; WithoutCaptionLbl)
            {
            }
            column(For_Export_under_bondCaption; For_Export_under_bondCaptionLbl)
            {
            }
            column(For_payment_of_dutyCaption; For_payment_of_dutyCaptionLbl)
            {
            }
            column(V1Caption; V1CaptionLbl)
            {
            }
            column(V2Caption; V2CaptionLbl)
            {
            }
            column(V3Caption; V3CaptionLbl)
            {
            }
            column(V4Caption; V4CaptionLbl)
            {
            }
            column(V5Caption; V5CaptionLbl)
            {
            }
            column(V6Caption; V6CaptionLbl)
            {
            }
            column(V7Caption; V7CaptionLbl)
            {
            }
            column(V8Caption; V8CaptionLbl)
            {
            }
            column(V9Caption; V9CaptionLbl)
            {
            }
            column(V10Caption; V10CaptionLbl)
            {
            }
            column(V11Caption; V11CaptionLbl)
            {
            }
            column(V12Caption; V12CaptionLbl)
            {
            }
            column(V13Caption; V13CaptionLbl)
            {
            }
            column(V14Caption; V14CaptionLbl)
            {
            }
            column(V15Caption; V15CaptionLbl)
            {
            }
            column(V16Caption; V16CaptionLbl)
            {
            }
            column(RemarksCaption; RemarksCaptionLbl)
            {
            }
            column(Signature_of_the_Assesse_of_his_AgentCaption; Signature_of_the_Assesse_of_his_AgentCaptionLbl)
            {
            }
            column(V17Caption; V17CaptionLbl)
            {
            }
            column(V18Caption; V18CaptionLbl)
            {
            }
            column(EmptyStringCaption; EmptyStringCaptionLbl)
            {
            }
            column(EmptyStringCaption_Control1102154051; EmptyStringCaption_Control1102154051Lbl)
            {
            }
            column(EmptyStringCaption_Control1102154052; EmptyStringCaption_Control1102154052Lbl)
            {
            }
            column(EmptyStringCaption_Control1102154053; EmptyStringCaption_Control1102154053Lbl)
            {
            }
            column(EmptyStringCaption_Control1102154054; EmptyStringCaption_Control1102154054Lbl)
            {
            }
            column(EmptyStringCaption_Control1102154056; EmptyStringCaption_Control1102154056Lbl)
            {
            }
            column(EmptyStringCaption_Control1102154071; EmptyStringCaption_Control1102154071Lbl)
            {
            }
            column(Sales_Invoice_Line_Document_No_; "Document No.")
            {
            }
            column(Sales_Invoice_Line_Line_No_; "Line No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                //IF "Sales Invoice Line"."Posting Group"<>'MPBI-FINIS' THEN
                //CurrReport.SKIP;
                IF "Sales Invoice Line".Amount <> 0 THEN BEGIN
                    Totalqty := Totalqty + "Sales Invoice Line".Quantity;
                    totalamt := totalamt + "Sales Invoice Line"."Line Amount";
                    totalexcise := totalexcise + "Sales Invoice Line"."Excise Amount";
                    totalcess := totalcess + "Sales Invoice Line"."eCess Amount";
                END;
                IF "Sales Invoice Line".Amount = 0 THEN
                    CurrReport.SKIP;
            end;

            trigger OnPreDataItem();
            begin
                totalamt := 0;
                Totalqty := 0;
                totalexcise := 0;
                totalcess := 0;
                "Sales Invoice Line".SETRANGE("Sales Invoice Line"."Shipment Date", fromdate, todate);
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
        Totalqty: Decimal;
        totalamt: Decimal;
        totalexcise: Decimal;
        totalcess: Decimal;
        fromdate: Date;
        todate: Date;
        SIH: Record "Sales Invoice Header";
        no: Code[20];
        cap: Text[65];
        Daily_Stock_AccountCaptionLbl: Label 'Daily Stock Account';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        For_Assessees_working_under_Self_Removal_Procedure_CaptionLbl: Label '(For Assessees working under Self-Removal Procedure)';
        FromCaptionLbl: Label 'From';
        ToCaptionLbl: Label 'To';
        DateCaptionLbl: Label 'Date';
        ValueCaptionLbl: Label 'Value';
        RateCaptionLbl: Label 'Rate';
        AmountCaptionLbl: Label 'Amount';
        In_bonded_Store_room_s_CaptionLbl: Label 'In bonded Store-room(s)';
        In_his_roomCaptionLbl: Label 'In his room';
        Opening_BalanceCaptionLbl: Label 'Opening Balance';
        Quantity_ManfacuturedCaptionLbl: Label 'Quantity Manfacutured';
        Total_of_Col_2_3CaptionLbl: Label 'Total of Col.2+3';
        On_payment_of_dutyCaptionLbl: Label 'On payment of duty';
        For_home_useCaptionLbl: Label 'For home use';
        For_export_under_claim_for_rebate_of_dutyCaptionLbl: Label 'For export under claim for rebate of duty';
        To_other_Factiores_or_Warehouses_under_bondCaptionLbl: Label 'To other Factiores or Warehouses under bond';
        QuantityCaptionLbl: Label 'Quantity';
        ValueCaption_Control1102154036Lbl: Label 'Value';
        For_other_purposesCaptionLbl: Label 'For other purposes';
        PurposeCaptionLbl: Label 'Purpose';
        QuantityCaption_Control1102154039Lbl: Label 'Quantity';
        WithoutCaptionLbl: Label 'Without';
        For_Export_under_bondCaptionLbl: Label 'For Export under bond';
        For_payment_of_dutyCaptionLbl: Label 'For payment of duty';
        V1CaptionLbl: Label '1';
        V2CaptionLbl: Label '2';
        V3CaptionLbl: Label '3';
        V4CaptionLbl: Label '4';
        V5CaptionLbl: Label '5';
        V6CaptionLbl: Label '6';
        V7CaptionLbl: Label '7';
        V8CaptionLbl: Label '8';
        V9CaptionLbl: Label '9';
        V10CaptionLbl: Label '10';
        V11CaptionLbl: Label '11';
        V12CaptionLbl: Label '12';
        V13CaptionLbl: Label '13';
        V14CaptionLbl: Label '14';
        V15CaptionLbl: Label '15';
        V16CaptionLbl: Label '16';
        RemarksCaptionLbl: Label 'Remarks';
        Signature_of_the_Assesse_of_his_AgentCaptionLbl: Label 'Signature of the Assesse of his Agent';
        V17CaptionLbl: Label '17';
        V18CaptionLbl: Label '18';
        EmptyStringCaptionLbl: Label '-';
        EmptyStringCaption_Control1102154051Lbl: Label '-';
        EmptyStringCaption_Control1102154052Lbl: Label '-';
        EmptyStringCaption_Control1102154053Lbl: Label '-';
        EmptyStringCaption_Control1102154054Lbl: Label '-';
        EmptyStringCaption_Control1102154056Lbl: Label '-';
        EmptyStringCaption_Control1102154071Lbl: Label '-';
}

