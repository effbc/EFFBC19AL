report 50131 "E.R.-11"
{
    // version NAVIN3.70.00.11

    DefaultLayout = RDLC;
    RDLCLayout = './E.R.-11.rdlc';

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = SORTING(No.) ORDER(Ascending);

            trigger OnAfterGetRecord();
            begin
                tempexcise := 0;
                tempcess := 0;
                SIL.SETRANGE(SIL."Document No.", "Sales Invoice Header"."No.");
                SIL.SETFILTER(SIL."Excise Prod. Posting Group", '84711000|85044010|85414020|91061000');
                IF SIL.FIND('-') THEN
                    REPEAT
                        IF SIL."Amount To Customer" > 0 THEN BEGIN
                            IF j = 1 THEN
                                InvStNo := "External Document No.";
                            j := j + 1;
                            InvEndNo := "External Document No.";

                            Excise := Excise + SIL."BED Amount";
                            cess := cess + SIL."eCess Amount";

                            IF SIL."Excise Prod. Posting Group" = '84711000' THEN BEGIN
                                QtyManfactured1 := QtyManfactured1 + SIL.Quantity;
                                Assessable1 := Assessable1 + ROUND(SIL.Amount, 1);
                                Dummycess2 := Dummycess2 + ROUND(SIL."eCess Amount", 1);
                                excise2 := excise2 + ROUND(SIL."BED Amount", 1);
                                tempexcise := tempexcise + ROUND(SIL."BED Amount", 1);
                                tempcess := tempcess + ROUND(SIL."eCess Amount", 1);
                                Ecess2 := ROUND(Dummycess2 * (2 / 3), 1);
                                SHEcess2 := ROUND(Dummycess2 * (1 / 3), 1);
                            END;

                            IF SIL."Excise Prod. Posting Group" = '85044010' THEN BEGIN
                                QtyManfactured2 := QtyManfactured2 + SIL.Quantity;
                                Assessable2 := Assessable2 + ROUND(SIL.Amount, 1);
                            END;
                            IF SIL."Excise Prod. Posting Group" = '85249112' THEN BEGIN
                                QtyManfactured3 := QtyManfactured3 + SIL.Quantity;
                                Assessable3 := Assessable3 + ROUND(SIL.Amount, 1);
                                tempexcise := tempexcise + ROUND(SIL."BED Amount", 1);
                                tempcess := tempcess + ROUND(SIL."eCess Amount", 1);
                            END;

                            IF SIL."Excise Prod. Posting Group" = '85414020' THEN BEGIN
                                QtyManfactured4 := QtyManfactured4 + SIL.Quantity;
                                Assessable4 := Assessable4 + ROUND(SIL.Amount, 1);
                                Excise1 := Excise1 + ROUND(SIL."BED Amount", 1);
                                Dummycess1 := Dummycess1 + ROUND(SIL."eCess Amount", 1);
                                tempexcise := tempexcise + ROUND(SIL."BED Amount", 1);
                                tempcess := tempcess + ROUND(SIL."eCess Amount", 1);
                                Ecess1 := ROUND(Dummycess1 * (2 / 3), 1);
                                SHEcess1 := ROUND(Dummycess1 * (1 / 3), 1);
                            END;

                            IF SIL."Excise Prod. Posting Group" = '91061000' THEN BEGIN
                                QtyManfactured5 := QtyManfactured5 + SIL.Quantity;
                                Assessable5 := Assessable5 + ROUND(SIL.Amount, 1);
                                tempexcise := tempexcise + ROUND(SIL."BED Amount", 1);
                                tempcess := tempcess + ROUND(SIL."eCess Amount", 1);
                            END;
                        END;
                    UNTIL SIL.NEXT = 0;
            end;

            trigger OnPreDataItem();
            begin
                QtyManfactured1 := 0;
                QtyManfactured2 := 0;
                QtyManfactured3 := 0;
                QtyManfactured4 := 0;
                QtyManfactured5 := 0;

                Assessable1 := 0;
                Assessable2 := 0;
                Assessable3 := 0;
                Assessable4 := 0;
                Assessable5 := 0;

                Dummycess1 := 0;
                Dummycess2 := 0;
                Excise := 0;

                ImpBed := 0;
                ImpCess := 0;
                ImpSheCess := 0;
                ManBed := 0;
                ManCess := 0;
                MansheCess := 0;
                Stagebed := 0;
                StageCess := 0;
                StageSheCess := 0;

                ManAD := 0;
                StageAd := 0;
                ImpAd := 0;
                j := 1;


                IF (ReturnMonth = ReturnMonth::June) AND (ReturnYear = 2009) THEN BEGIN
                    "Sales Invoice Header".SETRANGE("Sales Invoice Header"."Posting Date", (060109D), (063009D));
                    StartDt := (060109D);
                    EndDt := (063009D);
                END;
                IF (ReturnMonth = ReturnMonth::July) AND (ReturnYear = 2009) THEN BEGIN
                    "Sales Invoice Header".SETRANGE("Sales Invoice Header"."Posting Date", (070109D), (073109D));
                    StartDt := (070109D);
                    EndDt := (073109D);
                END;
                IF (ReturnMonth = ReturnMonth::August) AND (ReturnYear = 2009) THEN BEGIN
                    "Sales Invoice Header".SETRANGE("Sales Invoice Header"."Posting Date", (080109D), (083109D));
                    StartDt := (080109D);
                    EndDt := (083109D);
                END;
                IF (ReturnMonth = ReturnMonth::September) AND (ReturnYear = 2009) THEN BEGIN
                    "Sales Invoice Header".SETRANGE("Sales Invoice Header"."Posting Date", (090109D), (093009D));
                    StartDt := (090109D);
                    EndDt := (093009D);
                END;
                IF (ReturnMonth = ReturnMonth::October) AND (ReturnYear = 2009) THEN BEGIN
                    "Sales Invoice Header".SETRANGE("Sales Invoice Header"."Posting Date", (100109D), (103109D));
                    StartDt := (100109D);
                    EndDt := (103109D);
                END;
                IF (ReturnMonth = ReturnMonth::November) AND (ReturnYear = 2009) THEN BEGIN
                    "Sales Invoice Header".SETRANGE("Sales Invoice Header"."Posting Date", (110109D), (113009D));
                    StartDt := (110109D);
                    EndDt := (113009D);
                END;
                IF (ReturnMonth = ReturnMonth::December) AND (ReturnYear = 2009) THEN BEGIN
                    "Sales Invoice Header".SETRANGE("Sales Invoice Header"."Posting Date", (120109D), (123109D));
                    StartDt := (120109D);
                    EndDt := (123109D);
                END;

                IF (ReturnMonth = ReturnMonth::January) AND (ReturnYear = 2010) THEN BEGIN
                    "Sales Invoice Header".SETRANGE("Sales Invoice Header"."Posting Date", (010110D), (013110D));
                    StartDt := (010110D);
                    EndDt := (013110D);
                END;

                IF (ReturnMonth = ReturnMonth::February) AND (ReturnYear = 2010) THEN BEGIN
                    "Sales Invoice Header".SETRANGE("Sales Invoice Header"."Posting Date", (020110D), (022810D));
                    StartDt := (020110D);
                    EndDt := (022810D);
                END;
            end;
        }
        dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
        {
            DataItemTableView = SORTING(Type of Supplier, Buy-from Vendor Name) ORDER(Ascending);

            trigger OnAfterGetRecord();
            begin
                VendorNo := "Purch. Inv. Header"."Buy-from Vendor No.";
                OrdNo := "Purch. Inv. Header"."Order No.";
                invoiceno := "Purch. Inv. Header"."Vendor Invoice No.";
                dummybed := 0;
                dummycess := 0;
                Amt := 0.0;
                Addduty := 0;
                //openbed:=86511;
                //openeducess:=5354;
                //openshecess:=1349;
                PurchInvL.RESET;
                PurchInvL.SETRANGE(PurchInvL."Document No.", "Purch. Inv. Header"."No.");
                PurchInvL.FIND('-');
                REPEAT
                    IF PurchInvL.Type = PurchInvL.Type::"Fixed Asset" THEN BEGIN
                        Amt := (Amt + (PurchInvL.Amount + PurchInvL."Charges To Vendor") / 2);
                        dummybed := dummybed + (PurchInvL."BED Amount" / 2);
                        dummycess := dummycess + (PurchInvL."eCess Amount" / 2);
                    END ELSE BEGIN
                        Amt := Amt + PurchInvL.Amount + PurchInvL."Charges To Vendor";
                        STD.SETRANGE(STD."Invoice No.", PurchInvL."Document No.");
                        STD.SETRANGE(STD."Line No.", PurchInvL."Line No.");
                        IF STD.FIND('-') THEN
                            REPEAT
                                IF "Purch. Inv. Header".Structure = 'FORIEGN' THEN BEGIN
                                    IF STD."Tax/Charge Code" = 'EXCISE' THEN
                                        dummybed := dummybed + STD."Calculation Value";
                                END ELSE BEGIN
                                    IF STD."Tax/Charge Code" = 'EXCISE' THEN
                                        dummybed := dummybed + STD.Amount;
                                END;
                            UNTIL STD.NEXT = 0;
                        IF "Purch. Inv. Header".Structure = 'FORIEGN' THEN
                            dummycess += (dummybed * 3 / 100)
                        ELSE
                            dummycess := dummycess + PurchInvL."eCess Amount";
                    END;
                UNTIL PurchInvL.NEXT = 0;
                cess2 := dummycess * 2 / 3;
                cess1 := dummycess * 1 / 3;
                Addduty := "Purch. Inv. Header"."Additional Duty Value";
                dummybed := dummybed - dummycess - Addduty;

                IF "Purch. Inv. Header"."Type of Supplier" = "Purch. Inv. Header"."Type of Supplier"::Manufacturer THEN BEGIN
                    ManBed := ManBed + ROUND(dummybed, 1);
                    //ManBed:=ManBed+PurchInvL."BED Amount";
                    ManCess := ManCess + cess2;
                    //ManCess:=ManCess+(PurchInvL."eCess Amount"*2/3);
                    //MansheCess:=ManCess+(PurchInvL."eCess Amount"/3);
                    MansheCess := MansheCess + cess1;
                    //ManAD:=ManAD+"Purch. Inv. Header"."Additional Duty Value";
                    ManAD := ManAD + Addduty;
                END;

                IF ("Purch. Inv. Header"."Type of Supplier" = "Purch. Inv. Header"."Type of Supplier"::"First Stage Dealer") OR
                ("Purch. Inv. Header"."Type of Supplier" = "Purch. Inv. Header"."Type of Supplier"::"First Stage Dealer") THEN BEGIN
                    Stagebed := Stagebed + dummybed;
                    StageCess := StageCess + cess2;
                    StageSheCess := StageSheCess + cess1;
                    StageAd := StageAd + Addduty;
                    //Stagebed:=Stagebed+PurchInvL."BED Amount";
                    //StageCess:=StageCess+(PurchInvL."eCess Amount"*2/3);
                    //StageSheCess:=StageSheCess+(PurchInvL."eCess Amount"/3);
                    //StageAd:=StageAd+"Purch. Inv. Header"."Additional Duty Value";

                END;

                IF "Purch. Inv. Header"."Type of Supplier" = "Purch. Inv. Header"."Type of Supplier"::"Second Stage Dealer" THEN BEGIN
                    ImpBed := ImpBed + dummybed;
                    ImpCess := ImpCess + cess2;
                    ImpSheCess := ImpSheCess + cess1;
                    ImpAd := ImpAd + Addduty;

                    //ImpBed:=ImpBed+PurchInvL."BED Amount";
                    //ImpCess:=ImpCess+(PurchInvL."eCess Amount"*2/3);
                    //ImpSheCess:=ImpSheCess+(PurchInvL."eCess Amount"/3);;
                    //ImpAd:=ImpAd+"Purch. Inv. Header"."Additional Duty Value";

                END;

                IF Amt > 0 THEN BEGIN
                    Vend.RESET;
                    Vend.SETRANGE(Vend."No.", "Purch. Inv. Header"."Buy-from Vendor No.");
                    IF Vend.FIND('-') THEN
                        VendorName := Vend.Name;
                    VendType := Vend."Vendor Type";

                    IF VendType = 0 THEN
                        VendorType := '';
                    IF VendType = 1 THEN
                        VendorType := 'Manufacturer';
                    IF VendType = 2 THEN
                        VendorType := 'First Stage Dealer';
                    IF VendType = 3 THEN
                        VendorType := 'Second Stage Dealer';
                    IF VendType = 4 THEN
                        VendorType := 'Importer';
                    IF VendType = 5 THEN
                        VendorType := 'Trader';

                END;
            end;

            trigger OnPreDataItem();
            begin
                previousno := '';
                SETRANGE("Actual Invoiced Date", StartDt, EndDt);
                SETFILTER("Location Code", 'STR|CS STR');
                SETFILTER("Purch. Inv. Header".Structure, 'PURC-E+VAT|PURC-E+CST|PUR+EF+VAT|P-E+CST+AD|P-E+VAT+AD|P+E+AD+ST|P+E+AD+VAT|foriegn');
            end;
        }
        dataitem(Title; "Integer")
        {
            DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));

            trigger OnPreDataItem();
            begin
                Month := ReturnMonth + 1
            end;
        }
        dataitem("Company Information"; "Company Information")
        {
            DataItemTableView = SORTING(Primary Key);
        }
        dataitem("<Integer1>"; "Integer")
        {
            DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
        }
        dataitem("<Integer2>"; "Integer")
        {
            DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
            column(QtyManfactured2; QtyManfactured2)
            {
            }
            column(QtyManfactured5; QtyManfactured5)
            {
            }
            column(QtyManfactured3; QtyManfactured3)
            {
            }
            column(QtyManfactured1; QtyManfactured1)
            {
            }
            column(QtyManfactured4; QtyManfactured4)
            {
            }
            column(QtyManfactured2_Control1102154014; QtyManfactured2)
            {
            }
            column(QtyManfactured5_Control1102154015; QtyManfactured5)
            {
            }
            column(QtyManfactured3_Control1102154016; QtyManfactured3)
            {
            }
            column(QtyManfactured1_Control1102154017; QtyManfactured1)
            {
            }
            column(Assessable4; Assessable4)
            {
            }
            column(Assessable2; Assessable2)
            {
            }
            column(Assessable5; Assessable5)
            {
            }
            column(Assessable3; Assessable3)
            {
            }
            column(Assessable1; Assessable1)
            {
            }
            column(Excise1; Excise1)
            {
            }
            column(Ecess1; Ecess1)
            {
            }
            column(SHEcess1; SHEcess1)
            {
            }
            column(excise2; excise2)
            {
            }
            column(Ecess2; Ecess2)
            {
            }
            column(SHEcess2; SHEcess2)
            {
            }
            column(ROUND_Dummycess1_Excise1_1_; ROUND(Dummycess1 + Excise1, 1))
            {
            }
            column(Dummycess2_excise2; Dummycess2 + excise2)
            {
            }
            column(ReportType; ReportType)
            {
            }
            column(Month; Month)
            {
            }
            column(ReturnYear; ReturnYear)
            {
            }
            column(Company_Information__Name; "Company Information".Name)
            {
            }
            column(LocationNo; LocationNo)
            {
            }
            column(QtyManfactured4_Control1102154233; QtyManfactured4)
            {
            }
            column(Excise; Excise)
            {
            }
            column(ROUND_cess_1_3_1_; ROUND(cess * 1 / 3, 1))
            {
            }
            column(tempexcise1; tempexcise1)
            {
            }
            column(TEMPCESS1; TEMPCESS1)
            {
            }
            column(lessbed; lessbed)
            {
            }
            column(lesseducess; lesseducess)
            {
            }
            column(TEMPSHECESS; TEMPSHECESS)
            {
            }
            column(lessshecess; lessshecess)
            {
            }
            column(ROUND_cess_2_3_1_; ROUND(cess * 2 / 3, 1))
            {
            }
            column(V85414020Caption; V85414020CaptionLbl)
            {
            }
            column(V85044010Caption; V85044010CaptionLbl)
            {
            }
            column(Electronic_Moving_Display_unit_for_information_text_and_Electronic_Time_displaying_units_Caption; Electronic_Moving_Display_unit_for_information_text_and_Electronic_Time_displaying_units_CaptionLbl)
            {
            }
            column(Electronic_InvertorsCaption; Electronic_InvertorsCaptionLbl)
            {
            }
            column(V85249112Caption; V85249112CaptionLbl)
            {
            }
            column(Time_Recorders_Caption; Time_Recorders_CaptionLbl)
            {
            }
            column(NosCaption; NosCaptionLbl)
            {
            }
            column(V91061000Caption; V91061000CaptionLbl)
            {
            }
            column(Computer_SoftwareCaption; Computer_SoftwareCaptionLbl)
            {
            }
            column(V84711000Caption; V84711000CaptionLbl)
            {
            }
            column(Microprocessor_based_data_acquisition_and_control_systems_Caption; Microprocessor_based_data_acquisition_and_control_systems_CaptionLbl)
            {
            }
            column(V0Caption; V0CaptionLbl)
            {
            }
            column(DutyCaption; DutyCaptionLbl)
            {
            }
            column(V7__Caption; V7__CaptionLbl)
            {
            }
            column(Notification_availedCaption; Notification_availedCaptionLbl)
            {
            }
            column(S__No__in_NotificationCaption; S__No__in_NotificationCaptionLbl)
            {
            }
            column(V9__Caption; V9__CaptionLbl)
            {
            }
            column(Rate_of_dutyCaption; Rate_of_dutyCaptionLbl)
            {
            }
            column(V10__Caption; V10__CaptionLbl)
            {
            }
            column(Duty_payable____________Rs__Caption; Duty_payable____________Rs__CaptionLbl)
            {
            }
            column(V12__Caption; V12__CaptionLbl)
            {
            }
            column(Provisional_assessment_number___if_any__Caption; Provisional_assessment_number___if_any__CaptionLbl)
            {
            }
            column(V13__Caption; V13__CaptionLbl)
            {
            }
            column(CENVAT___HSN_CODE_NO_85414020__Caption; CENVAT___HSN_CODE_NO_85414020__CaptionLbl)
            {
            }
            column(CENVAT___HSN_CODE_NO_85249112_Caption; CENVAT___HSN_CODE_NO_85249112_CaptionLbl)
            {
            }
            column(CENVAT___HSN_CODE_NO_84711000__Caption; CENVAT___HSN_CODE_NO_84711000__CaptionLbl)
            {
            }
            column(V8__Plus_3__Educational_Cess_Caption; V8__Plus_3__Educational_Cess_CaptionLbl)
            {
            }
            column(NILCaption; NILCaptionLbl)
            {
            }
            column(V8__Plus_3__Educational_Cess_Caption_Control1102154061; V8__Plus_3__Educational_Cess_Caption_Control1102154061Lbl)
            {
            }
            column(BREAK_UPCaption; BREAK_UPCaptionLbl)
            {
            }
            column(V8_____Caption; V8_____CaptionLbl)
            {
            }
            column(V2____Caption; V2____CaptionLbl)
            {
            }
            column(V1____Caption; V1____CaptionLbl)
            {
            }
            column(V8____Caption; V8____CaptionLbl)
            {
            }
            column(V2____Caption_Control1102154093; V2____Caption_Control1102154093Lbl)
            {
            }
            column(V1____Caption_Control1102154094; V1____Caption_Control1102154094Lbl)
            {
            }
            column(V2_2008_CE_DT_01_03_08Caption; V2_2008_CE_DT_01_03_08CaptionLbl)
            {
            }
            column(V6_2006_CE_dt_1_3_2006Caption; V6_2006_CE_dt_1_3_2006CaptionLbl)
            {
            }
            column(V2_2008_CE_DT_01_03_08Caption_Control1102154080; V2_2008_CE_DT_01_03_08Caption_Control1102154080Lbl)
            {
            }
            column(V0Caption_Control1102154081; V0Caption_Control1102154081Lbl)
            {
            }
            column(V0Caption_Control1102154134; V0Caption_Control1102154134Lbl)
            {
            }
            column(V14Caption; V14CaptionLbl)
            {
            }
            column(NILCaption_Control1102154136; NILCaption_Control1102154136Lbl)
            {
            }
            column(NILCaption_Control1102154137; NILCaption_Control1102154137Lbl)
            {
            }
            column(NILCaption_Control1102154138; NILCaption_Control1102154138Lbl)
            {
            }
            column(NILCaption_Control1102154139; NILCaption_Control1102154139Lbl)
            {
            }
            column(NILCaption_Control1102154140; NILCaption_Control1102154140Lbl)
            {
            }
            column(V11__Caption; V11__CaptionLbl)
            {
            }
            column(V3__Details_of_the_manufacture_clearance_and_duty_payable_Caption; V3__Details_of_the_manufacture_clearance_and_duty_payable_CaptionLbl)
            {
            }
            column(V5__Caption; V5__CaptionLbl)
            {
            }
            column(Assessable_Value_________________________Rs__Caption; Assessable_Value_________________________Rs__CaptionLbl)
            {
            }
            column(Quantity_clearedCaption; Quantity_clearedCaptionLbl)
            {
            }
            column(V4__Caption; V4__CaptionLbl)
            {
            }
            column(Quantity_manufacturedCaption; Quantity_manufacturedCaptionLbl)
            {
            }
            column(V3__Caption; V3__CaptionLbl)
            {
            }
            column(Unit_of_quantityCaption; Unit_of_quantityCaptionLbl)
            {
            }
            column(V2__Caption; V2__CaptionLbl)
            {
            }
            column(CETSH_NO_Caption; CETSH_NO_CaptionLbl)
            {
            }
            column(V1__Caption; V1__CaptionLbl)
            {
            }
            column(Description_of_GoodsCaption; Description_of_GoodsCaptionLbl)
            {
            }
            column(Opening_BalanceCaption; Opening_BalanceCaptionLbl)
            {
            }
            column(Closing_BalanceCaption; Closing_BalanceCaptionLbl)
            {
            }
            column(V3A__Caption; V3A__CaptionLbl)
            {
            }
            column(V5A__Caption; V5A__CaptionLbl)
            {
            }
            column(V6__Caption; V6__CaptionLbl)
            {
            }
            column(See_rule_12_of_the_Central_Excise_Rules_2002_and_rule_7__5__of_CENVAT_Credit_Rules_2002__Caption; See_rule_12_of_the_Central_Excise_Rules_2002_and_rule_7__5__of_CENVAT_Credit_Rules_2002__CaptionLbl)
            {
            }
            column(Return_of_excisable_goods_and_availment_of_CENVAT_credit_for_the_month_ofCaption; Return_of_excisable_goods_and_availment_of_CENVAT_credit_for_the_month_ofCaptionLbl)
            {
            }
            column(Form_E_R__1Caption; Form_E_R__1CaptionLbl)
            {
            }
            column(V2__Name_of_the_assesseeCaption; V2__Name_of_the_assesseeCaptionLbl)
            {
            }
            column(V1__Registration_No_Caption; V1__Registration_No_CaptionLbl)
            {
            }
            column(NosCaption_Control1102154456; NosCaption_Control1102154456Lbl)
            {
            }
            column(NosCaption_Control1102154457; NosCaption_Control1102154457Lbl)
            {
            }
            column(NosCaption_Control1102154458; NosCaption_Control1102154458Lbl)
            {
            }
            column(NosCaption_Control1102154459; NosCaption_Control1102154459Lbl)
            {
            }
            column(V0Caption_Control1102154460; V0Caption_Control1102154460Lbl)
            {
            }
            column(V0Caption_Control1102154461; V0Caption_Control1102154461Lbl)
            {
            }
            column(V0Caption_Control1102154462; V0Caption_Control1102154462Lbl)
            {
            }
            column(V0Caption_Control1102154463; V0Caption_Control1102154463Lbl)
            {
            }
            column(V8__Caption; V8__CaptionLbl)
            {
            }
            column(DataItem1000000001; V4_Clearence_details_of_inter_unit_transfer_of_intrermediate_goods_with_out_payment_of_duty_under_sub_rule_1__of_rule_12BB___Lbl)
            {
            }
            column(Regisrtration_number_of_the_Receipient_unitCaption; Regisrtration_number_of_the_Receipient_unitCaptionLbl)
            {
            }
            column(Name_and_address_of_the_receipent_PremisesCaption; Name_and_address_of_the_receipent_PremisesCaptionLbl)
            {
            }
            column(CETSH_NO_Caption_Control1000000005; CETSH_NO_Caption_Control1000000005Lbl)
            {
            }
            column(description_of_goods_sentCaption; description_of_goods_sentCaptionLbl)
            {
            }
            column(Unit_of_QuantityCaption_Control1000000008; Unit_of_QuantityCaption_Control1000000008Lbl)
            {
            }
            column(Quantity_ClearedCaption_Control1000000009; Quantity_ClearedCaption_Control1000000009Lbl)
            {
            }
            column(V5_Receipt_of_details_of_intermediate_goods_received_from_other_premises_under_sub_rule_1__of_rule_12BB__Caption; V5_Receipt_of_details_of_intermediate_goods_received_from_other_premises_under_sub_rule_1__of_rule_12BB__CaptionLbl)
            {
            }
            column(Registration_number_of_sender_premisesCaption; Registration_number_of_sender_premisesCaptionLbl)
            {
            }
            column(Name_and_Address_of_The_sender_premisesCaption; Name_and_Address_of_The_sender_premisesCaptionLbl)
            {
            }
            column(CETSH_NO_Caption_Control1000000007; CETSH_NO_Caption_Control1000000007Lbl)
            {
            }
            column(Description_of_Goods_ReceivedCaption; Description_of_Goods_ReceivedCaptionLbl)
            {
            }
            column(Unit_of_QuantityCaption_Control1000000012; Unit_of_QuantityCaption_Control1000000012Lbl)
            {
            }
            column(Quanitity_ReceivedCaption; Quanitity_ReceivedCaptionLbl)
            {
            }
            column(V1Caption; V1CaptionLbl)
            {
            }
            column(V4Caption; V4CaptionLbl)
            {
            }
            column(V2Caption; V2CaptionLbl)
            {
            }
            column(V3Caption; V3CaptionLbl)
            {
            }
            column(V5Caption; V5CaptionLbl)
            {
            }
            column(V6Caption; V6CaptionLbl)
            {
            }
            column(V1__Caption_Control1280085; V1__Caption_Control1280085Lbl)
            {
            }
            column(V2__Caption_Control1280086; V2__Caption_Control1280086Lbl)
            {
            }
            column(V3__Caption_Control1280087; V3__Caption_Control1280087Lbl)
            {
            }
            column(V4___A__Caption; V4___A__CaptionLbl)
            {
            }
            column(Duty_CodeCaption; Duty_CodeCaptionLbl)
            {
            }
            column(Account_current___Rs___Caption; Account_current___Rs___CaptionLbl)
            {
            }
            column(Credit_account____Rs___Caption; Credit_account____Rs___CaptionLbl)
            {
            }
            column(ChallanCaption; ChallanCaptionLbl)
            {
            }
            column(V6_____Details_of_duty_paid_on_excisable_goods_Caption; V6_____Details_of_duty_paid_on_excisable_goods_CaptionLbl)
            {
            }
            column(BSR_CodeCaption; BSR_CodeCaptionLbl)
            {
            }
            column(V5__Caption_Control1102154177; V5__Caption_Control1102154177Lbl)
            {
            }
            column(Total_duty_paid____Rs___Caption; Total_duty_paid____Rs___CaptionLbl)
            {
            }
            column(V6__Caption_Control1102154182; V6__Caption_Control1102154182Lbl)
            {
            }
            column(V4___B__Caption; V4___B__CaptionLbl)
            {
            }
            column(CENVATCaption; CENVATCaptionLbl)
            {
            }
            column(Educational_CessCaption; Educational_CessCaptionLbl)
            {
            }
            column(SHE_CessCaption; SHE_CessCaptionLbl)
            {
            }
            column(Integer2__Number; Number)
            {
            }
        }
        dataitem("<Integer3>"; "Integer")
        {
            DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
            column(openbed; openbed)
            {
            }
            column(AccountCenvat; AccountCenvat)
            {
            }
            column(openeducess; openeducess)
            {
            }
            column(openshecess; openshecess)
            {
            }
            column(AccountCess; AccountCess)
            {
            }
            column(ACCOUNTCESS2; ACCOUNTCESS2)
            {
            }
            column(addbed1; addbed1)
            {
            }
            column(addeducess1; addeducess1)
            {
            }
            column(addshecess1; addshecess1)
            {
            }
            column(openbed_AccountCenvat; openbed + AccountCenvat)
            {
            }
            column(openeducess_TEMPCESS1; openeducess + TEMPCESS1)
            {
            }
            column(openshecess_TEMPSHECESS; openshecess + TEMPSHECESS)
            {
            }
            column(lessbed_Control1102154368; lessbed)
            {
            }
            column(lesseducess_Control1102154370; lesseducess)
            {
            }
            column(lessshecess_Control1102154374; lessshecess)
            {
            }
            column(lessbed1; lessbed1)
            {
            }
            column(lesseducess1; lesseducess1)
            {
            }
            column(lessshecess1; lessshecess1)
            {
            }
            column(openbed_AccountCenvat_lessbed; openbed + AccountCenvat - lessbed)
            {
            }
            column(openeducess_AccountCess_lesseducess; openeducess + AccountCess - lesseducess)
            {
            }
            column(openshecess_ACCOUNTCESS2_lessshecess; openshecess + ACCOUNTCESS2 - lessshecess)
            {
            }
            column(ManBed; ManBed)
            {
            }
            column(ManAD; ManAD)
            {
            }
            column(ManBed_Stagebed_ImpBed_CENVATOB___Excise_AccountCenvat__ManAD_StageAd_ImpAd__; (ManBed + Stagebed + ImpBed + CENVATOB) - (Excise - AccountCenvat - (ManAD + StageAd + ImpAd)))
            {
            }
            column(ManAD_StageAd_ImpAd___ManAD_StageAd_ImpAd_; (ManAD + StageAd + ImpAd) - (ManAD + StageAd + ImpAd))
            {
            }
            column(ManBed_Stagebed_ImpBed_CENVATOB; ManBed + Stagebed + ImpBed + CENVATOB)
            {
            }
            column(ManAD_StageAd_ImpAd; ManAD + StageAd + ImpAd)
            {
            }
            column(ManCess; ManCess)
            {
            }
            column(ManCess_StageCess_ImpCess_EDcessOB; ManCess + StageCess + ImpCess + EDcessOB)
            {
            }
            column(ManCess_StageCess_ImpCess_EDcessOB___ROUND__cess__2_3____AccountCess__2_3___1__; (ManCess + StageCess + ImpCess + EDcessOB) - (ROUND((cess * (2 / 3)) - (AccountCess * (2 / 3)), 1)))
            {
            }
            column(Excise_AccountCenvat__ManAD_StageAd_ImpAd_; Excise - AccountCenvat - (ManAD + StageAd + ImpAd))
            {
            }
            column(ManAD_StageAd_ImpAd_Control1102154312; ManAD + StageAd + ImpAd)
            {
            }
            column(ROUND_cess__2_3__AccountCess__2_3__1_; ROUND(cess * (2 / 3) - AccountCess * (2 / 3), 1))
            {
            }
            column(CrSTTakeCG_CrSTTakeIN; CrSTTakeCG + CrSTTakeIN)
            {
            }
            column(ROUND_cess__1_3__AccountCess__1_3__1_; ROUND(cess * (1 / 3) - AccountCess * (1 / 3), 1))
            {
            }
            column(MansheCess_StageSheCess_ImpSheCess_SHEcessOB___ROUND__cess__1_3____AccountCess__1_3___1__; (MansheCess + StageSheCess + ImpSheCess + SHEcessOB) - (ROUND((cess * (1 / 3)) - (AccountCess * (1 / 3)), 1)))
            {
            }
            column(MansheCess; MansheCess)
            {
            }
            column(StageAd; StageAd)
            {
            }
            column(StageCess; StageCess)
            {
            }
            column(StageSheCess; StageSheCess)
            {
            }
            column(ImpBed; ImpBed)
            {
            }
            column(ImpAd; ImpAd)
            {
            }
            column(ImpCess; ImpCess)
            {
            }
            column(ImpSheCess; ImpSheCess)
            {
            }
            column(MansheCess_StageSheCess_ImpSheCess_SHEcessOB; MansheCess + StageSheCess + ImpSheCess + SHEcessOB)
            {
            }
            column(Stagebed; Stagebed)
            {
            }
            column(CENVATOB; CENVATOB)
            {
            }
            column(EDcessOB; EDcessOB)
            {
            }
            column(SHEcessOB; SHEcessOB)
            {
            }
            column(WORKDATE; WORKDATE)
            {
            }
            column(Company_Information__City; "Company Information".City)
            {
            }
            column(totpaidamt; totpaidamt)
            {
            }
            column(InvStNo; InvStNo)
            {
            }
            column(InvEndNo; InvEndNo)
            {
            }
            column(ChallanNo; ChallanNo)
            {
            }
            column(V7_Abstract_of_ACCOUNT___CURRENT__cash_payment___Caption; V7_Abstract_of_ACCOUNT___CURRENT__cash_payment___CaptionLbl)
            {
            }
            column(Summary_Particulars__1_Caption; Summary_Particulars__1_CaptionLbl)
            {
            }
            column(AmountCaption; AmountCaptionLbl)
            {
            }
            column(BEDCaption; BEDCaptionLbl)
            {
            }
            column(EDU_CESSCaption; EDU_CESSCaptionLbl)
            {
            }
            column(S_H_CESSCaption; S_H_CESSCaptionLbl)
            {
            }
            column(Opening_BalanceCaption_Control1000000048; Opening_BalanceCaption_Control1000000048Lbl)
            {
            }
            column(Add_TR_6_GAR_7_Challan_Payments_Made_in_Month_in_aggerigate_Caption; Add_TR_6_GAR_7_Challan_Payments_Made_in_Month_in_aggerigate_CaptionLbl)
            {
            }
            column(Add__Adjustement_of_the_excess_duty_paid_during_previous_period_under_subrule_2__of_rule_12BB_incase_of__LT_Caption; Add__Adjustement_of_the_excess_duty_paid_during_previous_period_under_subrule_2__of_rule_12BB_incase_of__LT_CaptionLbl)
            {
            }
            column(Total_Amount_AvailableCaption; Total_Amount_AvailableCaptionLbl)
            {
            }
            column(DataItem1000000089; Less_utilization_towards_payment_of_duties_on_excise_goods_during_the_month__vise_details_furnished_under_col_3_in_SI_NO__9__Lbl)
            {
            }
            column(DataItem1000000090; Less_utilization_towards_other_payments_made__during_the_month__vise_details_furnished_under_col_3_in_SI_NO__9__of_the_returnLbl)
            {
            }
            column(Closing_BalanceCaption_Control1000000091; Closing_BalanceCaption_Control1000000091Lbl)
            {
            }
            column(EmptyStringCaption; EmptyStringCaptionLbl)
            {
            }
            column(V8_____Details_of_CENVAT_credit_availed_and_utilized___Caption; V8_____Details_of_CENVAT_credit_availed_and_utilized___CaptionLbl)
            {
            }
            column(Details_of_CreditCaption; Details_of_CreditCaptionLbl)
            {
            }
            column(CENVAT__Rs__Caption; CENVAT__Rs__CaptionLbl)
            {
            }
            column(V1__Caption_Control1102154028; V1__Caption_Control1102154028Lbl)
            {
            }
            column(V2__Caption_Control1102154030; V2__Caption_Control1102154030Lbl)
            {
            }
            column(Opening_balanceCaption_Control1102154034; Opening_balanceCaption_Control1102154034Lbl)
            {
            }
            column(Credit_availed_on_inputs_on_invoices_issued_by_mfrsCaption; Credit_availed_on_inputs_on_invoices_issued_by_mfrsCaptionLbl)
            {
            }
            column(Credit_availed_on_capital_goodsCaption; Credit_availed_on_capital_goodsCaptionLbl)
            {
            }
            column(Total_credit_availedCaption; Total_credit_availedCaptionLbl)
            {
            }
            column(Credit_utilized_for_payment_of_duty_on_servicesCaption; Credit_utilized_for_payment_of_duty_on_servicesCaptionLbl)
            {
            }
            column(Closing_balanceCaption_Control1102154065; Closing_balanceCaption_Control1102154065Lbl)
            {
            }
            column(V3__Caption_Control1102154066; V3__Caption_Control1102154066Lbl)
            {
            }
            column(AED_TTA_____Rs__Caption; AED_TTA_____Rs__CaptionLbl)
            {
            }
            column(V4__Caption_Control1102154098; V4__Caption_Control1102154098Lbl)
            {
            }
            column(NCCD__Rs__Caption; NCCD__Rs__CaptionLbl)
            {
            }
            column(V5__Caption_Control1102154289; V5__Caption_Control1102154289Lbl)
            {
            }
            column(Credit_availed_on_input_servicesCaption; Credit_availed_on_input_servicesCaptionLbl)
            {
            }
            column(Credit_utilized_for_payment_of_duty_on_goodsCaption; Credit_utilized_for_payment_of_duty_on_goodsCaptionLbl)
            {
            }
            column(Credit_utilized_when_inputs_or_capital_goods_are_removed_as_suchCaption; Credit_utilized_when_inputs_or_capital_goods_are_removed_as_suchCaptionLbl)
            {
            }
            column(Service_Tax__Rs__Caption; Service_Tax__Rs__CaptionLbl)
            {
            }
            column(Education_Cess_on_Taxable_Services__Rs__Caption; Education_Cess_on_Taxable_Services__Rs__CaptionLbl)
            {
            }
            column(Cr_availed_on_inputs_on_invoices_issued_by__I_or_II_stage_dlrs_or_TradersCaption; Cr_availed_on_inputs_on_invoices_issued_by__I_or_II_stage_dlrs_or_TradersCaptionLbl)
            {
            }
            column(Credit__taken_on_imported_inputsCaption; Credit__taken_on_imported_inputsCaptionLbl)
            {
            }
            column(Education_CESS__Rs__Caption; Education_CESS__Rs__CaptionLbl)
            {
            }
            column(V9_____Details_of_other_payment_made___Caption; V9_____Details_of_other_payment_made___CaptionLbl)
            {
            }
            column(PaymentsCaption; PaymentsCaptionLbl)
            {
            }
            column(Amount_Paid___Rs__Caption; Amount_Paid___Rs__CaptionLbl)
            {
            }
            column(Account_CurrentCaption; Account_CurrentCaptionLbl)
            {
            }
            column(Credit_accountCaption; Credit_accountCaptionLbl)
            {
            }
            column(V1__Caption_Control40; V1__Caption_Control40Lbl)
            {
            }
            column(V2A__Caption; V2A__CaptionLbl)
            {
            }
            column(V2B__Caption; V2B__CaptionLbl)
            {
            }
            column(No_Caption; No_CaptionLbl)
            {
            }
            column(ChallanCaption_Control47; ChallanCaption_Control47Lbl)
            {
            }
            column(V3A__Caption_Control48; V3A__Caption_Control48Lbl)
            {
            }
            column(Arrears_of_DutyCaption; Arrears_of_DutyCaptionLbl)
            {
            }
            column(InterestCaption; InterestCaptionLbl)
            {
            }
            column(DateCaption; DateCaptionLbl)
            {
            }
            column(V3B__Caption; V3B__CaptionLbl)
            {
            }
            column(Misc__PaymentCaption; Misc__PaymentCaptionLbl)
            {
            }
            column(Source_Document_No_and_DateCaption; Source_Document_No_and_DateCaptionLbl)
            {
            }
            column(V4__Caption_Control75; V4__Caption_Control75Lbl)
            {
            }
            column(V10_____Self___assessment_memorandum___Caption; V10_____Self___assessment_memorandum___CaptionLbl)
            {
            }
            column(DataItem1280069; a_____I_hereby_declare_that_the_information_given_in_this_Return_is_true__correct_and_complete_in_every_respect_and_that_i_amLbl)
            {
            }
            column(to_sign_on_behalf_of_the_assessee_Caption; to_sign_on_behalf_of_the_assessee_CaptionLbl)
            {
            }
            column(b_____During_the_month__total_Rs_Caption; b_____During_the_month__total_Rs_CaptionLbl)
            {
            }
            column(was_deposited_vide_TR_6_ChallansCaption; was_deposited_vide_TR_6_ChallansCaptionLbl)
            {
            }
            column(Place_Caption; Place_CaptionLbl)
            {
            }
            column(Date_Caption; Date_CaptionLbl)
            {
            }
            column(DataItem1280292; c_____During_the_month__invoices_bearing_S_No________________________to_S_No______________________________were_issued_CaptionLbl)
            {
            }
            column(DataItem1000000014; d____During_the_month__transfer_Challans_under_rule_12BB_of_the_central__Excise_Rules_2002_bearing_S_No_____To________and_traLbl)
            {
            }
            column(Name_and_Signature_of_Assessee_or_Authorized_SignatoryCaption; Name_and_Signature_of_Assessee_or_Authorized_SignatoryCaptionLbl)
            {
            }
            column(DataItem1000000022; Applicable_only_for_large_taxpayers_defined_under_rule2_ea__of_the_Central_Excise_Rules_2002_and_who_has_Opted__to__operate_aLbl)
            {
            }
            column(ACKNOWLEDGEMENTCaption; ACKNOWLEDGEMENTCaptionLbl)
            {
            }
            column(Return_of_excisable_goods__and_availment_of_CENVAT_credit_for_the_month_of_Caption; Return_of_excisable_goods__and_availment_of_CENVAT_credit_for_the_month_of_CaptionLbl)
            {
            }
            column(DCaption; DCaptionLbl)
            {
            }
            column(DCaption_Control1000000095; DCaption_Control1000000095Lbl)
            {
            }
            column(MCaption; MCaptionLbl)
            {
            }
            column(MCaption_Control1000000102; MCaption_Control1000000102Lbl)
            {
            }
            column(YCaption; YCaptionLbl)
            {
            }
            column(YCaption_Control1000000124; YCaption_Control1000000124Lbl)
            {
            }
            column(Date_Of_Receipt_Caption; Date_Of_Receipt_CaptionLbl)
            {
            }
            column(YCaption_Control1102154440; YCaption_Control1102154440Lbl)
            {
            }
            column(YCaption_Control1102154441; YCaption_Control1102154441Lbl)
            {
            }
            column(copies_enclosed__Caption; copies_enclosed__CaptionLbl)
            {
            }
            column(Integer3__Number; Number)
            {
            }

            trigger OnPreDataItem();
            begin
                // Opening Balances - RG23CPartII
                OpenCenvatCG := 0.0;
                OpenAEDCG := 0.0;
                OpenOTHCG := 0.0;
                OpeneCESSCG := 0.0;
                RG23CPARTII.RESET;
                RG23CPARTII.SETRANGE(RG23CPARTII."Posting Date", 0D, StartingDate - 1);
                IF LocationNo <> '' THEN
                    RG23CPARTII.SETRANGE("Location E.C.C. No.", LocationNo);
                IF RG23CPARTII.FIND('-') THEN
                    REPEAT
                        OpenCenvatCG := OpenCenvatCG + RG23CPARTII."BED Credit" + RG23CPARTII."SED Credit" + RG23CPARTII."SAED Credit" +
                                        +RG23CPARTII."AED(GSI) Credit" + RG23CPARTII."ADE Credit" -
                                        RG23CPARTII."BED Debit" - RG23CPARTII."SED Debit" - RG23CPARTII."SAED Debit" - RG23CPARTII."AED(GSI) Debit" -
                                        RG23CPARTII."ADE Debit";
                        OpenAEDCG := OpenAEDCG + RG23CPARTII."AED(TTA) Credit" - RG23CPARTII."AED(TTA) Debit";
                        OpenOTHCG := OpenOTHCG + RG23CPARTII."NCCD Credit" - RG23CPARTII."NCCD Debit";
                        OpeneCESSCG := OpeneCESSCG + RG23CPARTII."eCess Credit" - RG23CPARTII."eCess Debit";
                        OpenADETCG := OpenADETCG + RG23CPARTII."ADET Credit" - RG23CPARTII."ADET Debit";
                    //      OpenSTCG := OpenSTCG + RG23CPARTII."Service Tax  Credit" - RG23CPARTII."Service Tax  Debit";
                    //      OpenSTeCessCG := OpenSTeCessCG + RG23CPARTII."Service Tax eCess Credit" - RG23CPARTII."Service Tax eCess Debit";
                    UNTIL RG23CPARTII.NEXT = 0;

                // Credit Availed - RG23CPartII
                CrCenvatTakeCG := 0.0;
                CrAEDTakeCG := 0.0;
                CrOTHTakeCG := 0.0;
                CreCESSTakeCG := 0.0;
                CrADETTakeCG := 0.0;
                RG23CPARTII.RESET;
                RG23CPARTII.SETRANGE(RG23CPARTII."Posting Date", StartingDate, EndingDate);
                IF LocationNo <> '' THEN
                    RG23CPARTII.SETRANGE("Location E.C.C. No.", LocationNo);
                IF RG23CPARTII.FIND('-') THEN
                    REPEAT
                        CrCenvatTakeCG := CrCenvatTakeCG + RG23CPARTII."BED Credit" + RG23CPARTII."SED Credit" + RG23CPARTII."SAED Credit" +
                                          RG23CPARTII."AED(GSI) Credit" + RG23CPARTII."ADE Credit";
                        CrAEDTakeCG := CrAEDTakeCG + RG23CPARTII."AED(TTA) Credit";
                        CrOTHTakeCG := CrOTHTakeCG + RG23CPARTII."NCCD Credit";
                        CreCESSTakeCG := CreCESSTakeCG + RG23CPARTII."eCess Credit";
                        CrADETTakeCG := CrADETTakeCG + RG23CPARTII."ADET Credit";
                        //    CrSTTakeCG := CrSTTakeCG + RG23CPARTII."Service Tax  Credit";
                        //    CrSTeCessTakeCG := CrSTeCessTakeCG + RG23CPARTII."Service Tax eCess Credit";
                        IF RG23CPARTII.Type = RG23CPARTII.Type::Purchase THEN BEGIN
                            CrCenvatTakeCG := CrCenvatTakeCG - RG23CPARTII."BED Debit" - RG23CPARTII."SED Debit" - RG23CPARTII."SAED Debit" -
                              RG23CPARTII."AED(GSI) Debit" - RG23CPARTII."ADE Debit";
                            CrAEDTakeCG := CrAEDTakeCG - RG23CPARTII."AED(TTA) Debit";
                            CrOTHTakeCG := CrOTHTakeCG - RG23CPARTII."NCCD Debit";
                            CreCESSTakeCG := CreCESSTakeCG - RG23CPARTII."eCess Debit";
                            CrADETTakeCG := CrADETTakeCG - RG23CPARTII."ADET Debit";
                            //      CrSTTakeCG := CrSTTakeCG + RG23CPARTII."Service Tax  Debit";
                            //    CrSTeCessTakeCG := CrSTeCessTakeCG + RG23CPARTII."Service Tax eCess Debit";
                        END
                    UNTIL RG23CPARTII.NEXT = 0;

                // Credit Used - RG23CPartII
                CrCenvatUsedCG := 0.0;
                CrAEDUsedCG := 0.0;
                CrOTHUsedCG := 0.0;
                CreCESSUsedCG := 0.0;
                CrADETUsedCG := 0.0;
                RG23CPARTII.RESET;
                RG23CPARTII.SETRANGE(RG23CPARTII."Posting Date", StartingDate, EndingDate);
                RG23CPARTII.SETRANGE(Type, RG23CPARTII.Type::Sale);
                IF LocationNo <> '' THEN
                    RG23CPARTII.SETRANGE("Location E.C.C. No.", LocationNo);
                IF RG23CPARTII.FIND('-') THEN
                    REPEAT
                        CrCenvatUsedCG := CrCenvatUsedCG + RG23CPARTII."BED Debit" + RG23CPARTII."SED Debit" + RG23CPARTII."SAED Debit" +
                                          RG23CPARTII."ADE Debit" + RG23CPARTII."AED(GSI) Debit";
                        CrAEDUsedCG := CrAEDUsedCG + RG23CPARTII."AED(TTA) Debit";
                        CrOTHUsedCG := CrOTHUsedCG + RG23CPARTII."NCCD Debit";
                        CreCESSUsedCG := CreCESSUsedCG + RG23CPARTII."eCess Debit";
                        CrADETUsedCG := CrADETUsedCG + RG23CPARTII."ADET Debit";
                    //    CrSTUsedCG := CrSTUsedCG + RG23CPARTII."Service Tax  Debit";
                    //   CrSTeCessUsedCG := CrSTeCessUsedCG + RG23CPARTII."Service Tax eCess Debit";
                    UNTIL RG23CPARTII.NEXT = 0;

                // Closing Balance - RG23CPartII
                CloseCenvatCG := OpenCenvatCG + CrCenvatTakeCG - CrCenvatUsedCG;
                CloseAEDCG := OpenAEDCG + CrAEDTakeCG - CrAEDUsedCG;
                CloseOTHCG := OpenOTHCG + CrOTHTakeCG - CrOTHUsedCG;
                CloseeCESSCG := OpeneCESSCG + CreCESSTakeCG - CreCESSUsedCG;
                CloseADETCG := OpenADETCG + CrADETTakeCG - CrADETUsedCG;
                CloseSTCG := OpenSTCG + CrSTTakeCG - CrSTUsedCG;
                CloseSTeCessCG := OpenSTeCessCG + CrSTeCessTakeCG - CrSTeCessUsedCG;

                // Opening Balance - RG23APartII
                OpenCenvatIN := 0.0;
                OpenAEDIN := 0.0;
                OpenOTHIN := 0.0;
                OpeneCESSIN := 0.0;
                OpenADETIN := 0.0;
                RG23APartII.RESET;
                RG23APartII.SETRANGE(RG23APartII."Posting Date", 0D, StartingDate - 1);
                IF LocationNo <> '' THEN
                    RG23APartII.SETRANGE("Location E.C.C. No.", LocationNo);
                IF RG23APartII.FIND('-') THEN
                    REPEAT
                        OpenCenvatIN := OpenCenvatIN + RG23APartII."BED Credit" - RG23APartII."BED Debit" +
                          RG23APartII."SED Credit" - RG23APartII."SED Debit" +
                           RG23APartII."SAED Credit" - RG23APartII."SAED Debit" +
                           RG23APartII."ADE Credit" - RG23APartII."ADE Debit" +
                           RG23APartII."AED(GSI) Credit" - RG23APartII."AED(GSI) Debit";
                        OpenAEDIN := OpenAEDIN + RG23APartII."AED(TTA) Credit" - RG23APartII."AED(TTA) Debit";
                        OpenOTHIN := OpenOTHIN + RG23APartII."NCCD Credit" - RG23APartII."NCCD Debit";
                        OpeneCESSIN := OpeneCESSIN + RG23APartII."eCess Credit" - RG23APartII."eCess Debit";
                        OpenADETIN := OpenADETIN + RG23APartII."ADET Credit" - RG23APartII."ADET Debit";
                    //    OpenSTIN := OpenSTIN + RG23APartII."Service Tax Credit" - RG23APartII."Service Tax Debit";
                    //   OpenSTeCessIN := OpenSTeCessIN + RG23APartII."Service Tax eCess Credit" - RG23APartII."Service Tax eCess Debit";
                    UNTIL RG23APartII.NEXT = 0;


                //Credit Availed - RG23APartII
                CrCenvatTakeIN := 0;
                CrAEDTakeIN := 0;
                CrOTHTakeIN := 0;
                CreCESSTakeIN := 0;
                CrADETTakeIN := 0;
                RG23APartII.RESET;
                RG23APartII.SETRANGE(RG23APartII."Posting Date", StartingDate, EndingDate);
                IF LocationNo <> '' THEN
                    RG23APartII.SETRANGE("Location E.C.C. No.", LocationNo);
                IF RG23APartII.FIND('-') THEN
                    REPEAT
                        CrCenvatTakeIN := CrCenvatTakeIN + RG23APartII."BED Credit" + RG23APartII."SED Credit"
                          + RG23APartII."SAED Credit" + RG23APartII."ADE Credit" + RG23APartII."AED(GSI) Credit";
                        CrAEDTakeIN := CrAEDTakeIN + RG23APartII."AED(TTA) Credit";
                        CrOTHTakeIN := CrOTHTakeIN + RG23APartII."NCCD Credit";
                        CreCESSTakeIN := CreCESSTakeIN + RG23APartII."eCess Credit";
                        CrADETTakeIN := CrADETTakeIN + RG23APartII."ADET Credit";
                        //    CrSTTakeIN := CrSTTakeIN + RG23APartII."Service Tax Credit";
                        //  CrSTeCessTakeIN := CrSTeCessTakeIN + RG23APartII."Service Tax eCess Credit";
                        IF RG23APartII.Type = RG23APartII.Type::Purchase THEN BEGIN
                            CrCenvatTakeIN := CrCenvatTakeIN - RG23APartII."BED Debit" - RG23APartII."SED Debit" - RG23APartII."SAED Debit" -
                                              RG23APartII."ADE Debit" - RG23APartII."AED(GSI) Debit";
                            CrAEDTakeIN := CrAEDTakeIN - RG23APartII."AED(TTA) Debit";
                            CrOTHTakeIN := CrOTHTakeIN - RG23APartII."NCCD Debit";
                            CreCESSTakeIN := CreCESSTakeIN - RG23APartII."eCess Debit";
                            CrADETTakeIN := CrADETTakeIN - RG23APartII."ADET Debit";
                            //      CrSTTakeIN := CrSTTakeIN + RG23APartII."Service Tax Debit";
                            //     CrSTeCessTakeIN := CrSTeCessTakeIN + RG23APartII."Service Tax eCess Debit";
                        END
                    UNTIL RG23APartII.NEXT = 0;


                //Credit Used - RG23APartII

                CrCenvatUsedIN := 0;
                CrAEDUsedIN := 0;
                CrOTHUsedIN := 0;
                CreCESSUsedIN := 0;
                CrADETUsedIN := 0;
                RG23APartII.RESET;
                RG23APartII.SETRANGE(RG23APartII."Posting Date", StartingDate, EndingDate);
                IF LocationNo <> '' THEN
                    RG23APartII.SETRANGE("Location E.C.C. No.", LocationNo);
                RG23APartII.SETRANGE(Type, RG23APartII.Type::Sale);
                IF RG23APartII.FIND('-') THEN
                    REPEAT
                        CrCenvatUsedIN := CrCenvatUsedIN + RG23APartII."BED Debit" + RG23APartII."SED Debit"
                          + RG23APartII."SAED Debit" + RG23APartII."AED(GSI) Debit" + RG23APartII."ADE Debit";
                        CrAEDUsedIN := CrAEDUsedIN + RG23APartII."AED(TTA) Debit";
                        CrOTHUsedIN := CrOTHUsedIN + RG23APartII."NCCD Debit";
                        CreCESSUsedIN := CreCESSUsedIN + RG23APartII."eCess Debit";
                        CrADETUsedIN := CrADETUsedIN + RG23APartII."ADET Debit";
                    //    CrSTUsedIN := CrSTUsedIN + RG23APartII."Service Tax Debit";
                    //    CrSTeCessUsedIN := CrSTeCessUsedIN + RG23APartII."Service Tax eCess Debit";
                    UNTIL RG23APartII.NEXT = 0;

                // Closing Balance - RG23APartII
                CloseCenvatIN := OpenCenvatIN + CrCenvatTakeIN - CrCenvatUsedIN;
                CloseAEDIN := OpenAEDIN + CrAEDTakeIN - CrAEDUsedIN;
                CloseOTHIN := OpenOTHIN + CrOTHTakeIN - CrOTHUsedIN;
                CloseeCESSIN := CloseeCESSIN + CreCESSTakeIN - CreCESSUsedIN;
                CloseADETIN := CloseADETIN + CrADETTakeIN - CrADETUsedIN;
                CloseSTIN := CloseSTIN + CrSTTakeIN - CrSTUsedIN;
                CloseSTeCessIN := CloseSTeCessIN + CrSTeCessTakeIN - CrSTeCessUsedIN;

                // Update PLA amount
                PLARec.RESET;
                PLAAmount := 0;
                PLARec.SETRANGE("Posting Date", StartingDate, EndingDate);
                IF LocationNo <> '' THEN
                    PLARec.SETRANGE("Location E.C.C. No.", LocationNo);
                IF PLARec.FIND('-') THEN
                    REPEAT
                        PLAAmount := PLAAmount + PLARec."BED Credit" + PLARec."AED(GSI) Credit" + PLARec."SED Credit" +
                                   PLARec."SAED Credit" + PLARec."CESS Credit" + PLARec."NCCD Credit" +
                                   PLARec."eCess Credit" + PLARec."Excise Charges Credit" + PLARec."ADE Credit" + PLARec."ADET Credit" +
                                   PLARec."AED(TTA) Credit";
                    UNTIL PLARec.NEXT = 0;


                // Update Invoice Numbers
                ExciseEntry.SETRANGE("Posting Date", StartingDate, EndingDate);
                ExciseEntry.SETRANGE("Document Type", ExciseEntry."Document Type"::Invoice);
                ExciseEntry.SETRANGE("E.C.C. No.", LocationNo);
                ExciseEntry.SETRANGE(Type, ExciseEntry.Type::Sale);
                IF ExciseEntry.FIND('-') THEN
                    SlNo1 := ExciseEntry."Document No.";
                IF ExciseEntry.FIND('+') THEN
                    SlNo2 := ExciseEntry."Document No.";

                //VISU
                /*
                // VISU - Service Tax as Excise Credit
                
                STOpening := 0;
                STCredit := 0;
                STClosing := 0;
                STeCessOpening := 0;
                STeCessCredit := 0;
                STeCessClosing := 0;
                
                // Opening
                RG23APartII.RESET;
                RG23APartII.SETCURRENTKEY("Posting Date","Location E.C.C. No.");
                RG23APartII.SETRANGE("Posting Date",0D,StartingDate-1);
                RG23APartII.SETRANGE("Location E.C.C. No.",LocationNo);
                IF RG23APartII.FIND('+') THEN BEGIN
                  STOpening := RG23APartII."Total Service Tax Amount";
                  STeCessOpening := RG23APartII."Total Service Tax eCess Amount";
                END;
                
                RG23CPARTII.RESET;
                RG23CPARTII.SETCURRENTKEY("Posting Date","Location E.C.C. No.");
                RG23CPARTII.SETRANGE("Posting Date",0D,StartingDate-1);
                RG23CPARTII.SETRANGE("Location E.C.C. No.",LocationNo);
                IF RG23CPARTII.FIND('-') THEN
                  REPEAT
                    STOpening := STOpening + RG23CPARTII."Service Tax  Debit";
                    STeCessOpening := STeCessOpening + RG23CPARTII."Service Tax eCess Debit";
                  UNTIL RG23CPARTII.NEXT = 0;
                
                
                // Credit Availed
                STCredit := 0;
                STeCessCredit := 0;
                
                RG23APartII.RESET;
                RG23APartII.SETCURRENTKEY("Posting Date","Location E.C.C. No.");
                RG23APartII.SETRANGE("Posting Date",StartingDate,EndingDate);
                RG23APartII.SETRANGE("Location E.C.C. No.",LocationNo);
                RG23APartII.SETFILTER("Service Tax Debit",'>%1',0);
                IF RG23APartII.FIND('-') THEN
                  REPEAT
                    STCredit := STCredit + RG23APartII."Service Tax Debit";
                    STeCessCredit := STeCessCredit + RG23APartII."Service Tax eCess Debit";
                  UNTIL RG23APartII.NEXT = 0;
                
                
                RG23CPARTII.RESET;
                RG23CPARTII.SETCURRENTKEY("Posting Date","Location E.C.C. No.");
                RG23CPARTII.SETRANGE("Posting Date",StartingDate,EndingDate);
                RG23CPARTII.SETRANGE("Location E.C.C. No.",LocationNo);
                RG23CPARTII.SETFILTER("Service Tax  Debit",'>%1',0);
                IF RG23CPARTII.FIND('-') THEN
                REPEAT
                  STCredit :=  STCredit + ROUND(RG23CPARTII."Service Tax  Debit");
                  STeCessCredit := STeCessCredit + ROUND(RG23CPARTII."Service Tax eCess Debit");
                UNTIL RG23CPARTII.NEXT = 0;
                
                // Closing Balance
                RG23APartII.RESET;
                RG23APartII.SETCURRENTKEY("Posting Date","Location E.C.C. No.");
                RG23APartII.SETRANGE("Posting Date",StartingDate,EndingDate);
                RG23APartII.SETRANGE("Location E.C.C. No.",LocationNo);
                IF RG23APartII.FIND('-') THEN BEGIN
                  REPEAT
                    STClosing := STClosing + RG23APartII."Service Tax Debit";
                    STeCessClosing := STeCessClosing + RG23APartII."Service Tax eCess Debit";
                  UNTIL RG23APartII.NEXT = 0;
                END;
                
                RG23CPARTII.RESET;
                RG23CPARTII.SETCURRENTKEY("Posting Date","Location E.C.C. No.");
                RG23CPARTII.SETRANGE("Posting Date",StartingDate,EndingDate);
                RG23CPARTII.SETRANGE("Location E.C.C. No.",LocationNo);
                IF RG23CPARTII.FIND('-') THEN
                  REPEAT
                    STClosing := STClosing + RG23CPARTII."Service Tax  Debit";
                    STeCessClosing := STeCessClosing + RG23CPARTII."Service Tax eCess Debit";
                  UNTIL RG23CPARTII.NEXT = 0;
                */

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
        IF (ReturnYear = 0) THEN
            ERROR(Text001)
        ELSE BEGIN
            StartingDate := DMY2DATE(1, ReturnMonth + 1, ReturnYear);
            IF ReturnMonth = 11 THEN
                EndingDate := DMY2DATE(31, ReturnMonth + 1, ReturnYear)
            ELSE
                EndingDate := CALCDATE('-1D', DMY2DATE(1, ReturnMonth + 2, ReturnYear));
        END
    end;

    var
        RG23APartII: Record "RG 23 A Part II";
        RG23CPARTII: Record "RG 23 C Part II";
        PLARec: Record "PLA Entry";
        ExciseEntry: Record "Excise Entry";
        Location: Record Location;
        ReturnMonth: Option January,February,March,April,May,June,July,August,September,October,November,December;
        ReturnYear: Integer;
        StartingDate: Date;
        EndingDate: Date;
        ReportType: Option Original,Duplicate,Triplicate;
        CENVATAmount: Decimal;
        SEDAmount: Decimal;
        AEDAmount: Decimal;
        SAEDAmount: Decimal;
        CESSAmount: Decimal;
        NCCDAmount: Decimal;
        Notification: Option Yes,No;
        OpenSEDIN: Decimal;
        CrSEDTakeIN: Decimal;
        CrSEDUsedIN: Decimal;
        CloseSEDIN: Decimal;
        OpenAEDIN: Decimal;
        CrAEDTakeIN: Decimal;
        CrAEDUsedIN: Decimal;
        CloseAEDIN: Decimal;
        OpenADDIN: Decimal;
        CrADDTakeIN: Decimal;
        CrADDUsedIN: Decimal;
        CloseADDIN: Decimal;
        OpenOTHIN: Decimal;
        CrOTHTakeIN: Decimal;
        CrOTHUsedIN: Decimal;
        CloseOTHIN: Decimal;
        OpenCenvatIN: Decimal;
        CrCenvatTakeIN: Decimal;
        CrCenvatUsedIN: Decimal;
        CloseCenvatIN: Decimal;
        OpenCenvatCG: Decimal;
        CrCenvatTakeCG: Decimal;
        CrCenvatUsedCG: Decimal;
        CloseCenvatCG: Decimal;
        OpenSEDCG: Decimal;
        CrSEDTakeCG: Decimal;
        CrSEDUsedCG: Decimal;
        CloseSEDCG: Decimal;
        OpenAEDCG: Decimal;
        CrAEDTakeCG: Decimal;
        CrAEDUsedCG: Decimal;
        CloseAEDCG: Decimal;
        OpenADDCG: Decimal;
        CrADDTakeCG: Decimal;
        CrADDUsedCG: Decimal;
        CloseADDCG: Decimal;
        OpenOTHCG: Decimal;
        CrOTHTakeCG: Decimal;
        CrOTHUsedCG: Decimal;
        CloseOTHCG: Decimal;
        Text001: Label 'Please enter the year for generating the report';
        Month: Integer;
        PLAAmount: Decimal;
        SlNo1: Code[20];
        SlNo2: Code[20];
        LocationNo: Code[20];
        RegistrationNo: Code[20];
        OpeneCESSCG: Decimal;
        CreCESSTakeCG: Decimal;
        CreCESSUsedCG: Decimal;
        CloseeCESSCG: Decimal;
        OpeneCESSIN: Decimal;
        CreCESSTakeIN: Decimal;
        CreCESSUsedIN: Decimal;
        CloseeCESSIN: Decimal;
        eCESSAmount: Decimal;
        "--VISU--": Integer;
        STOpening: Decimal;
        STCredit: Decimal;
        STClosing: Decimal;
        STeCessOpening: Decimal;
        STeCessCredit: Decimal;
        STeCessClosing: Decimal;
        "--GS": Integer;
        AEDTTAAmount: Decimal;
        ADEAmount: Decimal;
        ADETAmount: Decimal;
        OpenADETCG: Decimal;
        CrADETTakeCG: Decimal;
        CrADETUsedCG: Decimal;
        CloseADETCG: Decimal;
        OpenADETIN: Decimal;
        CrADETTakeIN: Decimal;
        CrADETUsedIN: Decimal;
        CloseADETIN: Decimal;
        OpenSTCG: Decimal;
        OpenSTeCessCG: Decimal;
        CrSTTakeCG: Decimal;
        CrSTeCessTakeCG: Decimal;
        CrSTUsedCG: Decimal;
        CrSTeCessUsedCG: Decimal;
        CloseSTCG: Decimal;
        CloseSTeCessCG: Decimal;
        OpenSTIN: Decimal;
        OpenSTeCessIN: Decimal;
        CrSTTakeIN: Decimal;
        CrSTeCessTakeIN: Decimal;
        CrSTUsedIN: Decimal;
        CrSTeCessUsedIN: Decimal;
        CloseSTIN: Decimal;
        CloseSTeCessIN: Decimal;
        SIL: Record "Sales Invoice Line";
        QtyManfactured1: Decimal;
        QtyManfactured2: Decimal;
        QtyManfactured3: Decimal;
        QtyManfactured4: Decimal;
        QtyManfactured5: Decimal;
        QtyManfactured6: Decimal;
        Assessable1: Decimal;
        Assessable2: Decimal;
        Assessable3: Decimal;
        Assessable4: Decimal;
        Assessable5: Decimal;
        Excise1: Decimal;
        excise2: Decimal;
        excise3: Decimal;
        excise4: Decimal;
        excise5: Decimal;
        Ecess1: Decimal;
        Ecess2: Decimal;
        Ecess3: Decimal;
        Ecess4: Decimal;
        Ecess5: Decimal;
        SHEcess1: Decimal;
        SHEcess2: Decimal;
        SHEcess3: Decimal;
        SHEcess4: Decimal;
        SHEcess5: Decimal;
        Dummycess1: Decimal;
        Dummycess2: Decimal;
        Excise: Decimal;
        cess: Decimal;
        tempexcise: Decimal;
        tempcess: Decimal;
        openbed: Decimal;
        openeducess: Decimal;
        openshecess: Decimal;
        addbed: Decimal;
        addeducess: Decimal;
        addshecess: Decimal;
        addbed1: Decimal;
        addeducess1: Decimal;
        addshecess1: Decimal;
        lessbed: Decimal;
        lesseducess: Decimal;
        lessshecess: Decimal;
        lessbed1: Decimal;
        lesseducess1: Decimal;
        lessshecess1: Decimal;
        VendType: Option;
        VendorType: Text[30];
        Desc: Text[50];
        Subheading: Code[10];
        Qty: Decimal;
        MaxValue: Decimal;
        Itm: Record Item;
        ItmNo: Code[10];
        dummy: Integer;
        FixAsset: Record "Fixed Asset";
        "ecc no": Code[10];
        invoiceno: Code[30];
        Dummyrg23: Record "RG 23 A Part II";
        dummybed: Decimal;
        previousno: Text[30];
        dummycess: Decimal;
        i: Integer;
        STD: Record "Posted Str Order Line Details";
        Addduty: Decimal;
        cess2: Decimal;
        cess1: Decimal;
        StartDt: Date;
        EndDt: Date;
        VendorNo: Code[20];
        OrdNo: Code[20];
        Amt: Decimal;
        PurchInvL: Record "Purch. Inv. Line";
        Vend: Record Vendor;
        VendorName: Text[30];
        ManBed: Decimal;
        ManCess: Decimal;
        MansheCess: Decimal;
        Stagebed: Decimal;
        StageCess: Decimal;
        StageSheCess: Decimal;
        ImpBed: Decimal;
        ImpCess: Decimal;
        ImpSheCess: Decimal;
        ManAD: Decimal;
        StageAd: Decimal;
        ImpAd: Decimal;
        j: Integer;
        InvStNo: Code[20];
        InvEndNo: Code[20];
        AccountCenvat: Decimal;
        AccountCess: Decimal;
        totpaidamt: Decimal;
        ChallanNo: Text[50];
        CENVATOB: Decimal;
        EDcessOB: Decimal;
        SHEcessOB: Decimal;
        ACCOUNTCESS2: Decimal;
        TEMPCESS1: Decimal;
        TEMPSHECESS: Decimal;
        tempexcise1: Decimal;
        V85414020CaptionLbl: Label '85414020';
        V85044010CaptionLbl: Label '85044010';
        Electronic_Moving_Display_unit_for_information_text_and_Electronic_Time_displaying_units_CaptionLbl: Label '" Electronic Moving Display unit for information text and Electronic Time displaying units."';
        Electronic_InvertorsCaptionLbl: Label '" Electronic Invertors"';
        V85249112CaptionLbl: Label '85249112';
        Time_Recorders_CaptionLbl: Label '" Time Recorders "';
        NosCaptionLbl: Label 'Nos';
        V91061000CaptionLbl: Label '91061000';
        Computer_SoftwareCaptionLbl: Label '" Computer Software"';
        V84711000CaptionLbl: Label '84711000';
        Microprocessor_based_data_acquisition_and_control_systems_CaptionLbl: Label '" Microprocessor based data acquisition and control systems."';
        V0CaptionLbl: Label '0';
        DutyCaptionLbl: Label 'Duty';
        V7__CaptionLbl: Label '( 7 )';
        Notification_availedCaptionLbl: Label 'Notification availed';
        S__No__in_NotificationCaptionLbl: Label 'S. No. in Notification';
        V9__CaptionLbl: Label '( 9 )';
        Rate_of_dutyCaptionLbl: Label 'Rate of duty';
        V10__CaptionLbl: Label '( 10 )';
        Duty_payable____________Rs__CaptionLbl: Label 'Duty payable           (Rs.)';
        V12__CaptionLbl: Label '( 12 )';
        Provisional_assessment_number___if_any__CaptionLbl: Label 'Provisional assessment number ( if any )';
        V13__CaptionLbl: Label '( 13 )';
        CENVAT___HSN_CODE_NO_85414020__CaptionLbl: Label 'CENVAT ( HSN CODE NO:85414020 )';
        CENVAT___HSN_CODE_NO_85249112_CaptionLbl: Label 'CENVAT ( HSN CODE NO:85249112)';
        CENVAT___HSN_CODE_NO_84711000__CaptionLbl: Label 'CENVAT ( HSN CODE NO:84711000 )';
        V8__Plus_3__Educational_Cess_CaptionLbl: Label '8%(Plus 3% Educational Cess)';
        NILCaptionLbl: Label 'NIL';
        V8__Plus_3__Educational_Cess_Caption_Control1102154061Lbl: Label '8%(Plus 3% Educational Cess)';
        BREAK_UPCaptionLbl: Label 'BREAK UP';
        V8_____CaptionLbl: Label '8% ---';
        V2____CaptionLbl: Label '2%---';
        V1____CaptionLbl: Label '1%---';
        V8____CaptionLbl: Label '8%---';
        V2____Caption_Control1102154093Lbl: Label '2%---';
        V1____Caption_Control1102154094Lbl: Label '1%---';
        V2_2008_CE_DT_01_03_08CaptionLbl: Label '2/2008-CE DT:01/03/08';
        V6_2006_CE_dt_1_3_2006CaptionLbl: Label '6/2006-CE dt:1-3-2006';
        V2_2008_CE_DT_01_03_08Caption_Control1102154080Lbl: Label '2/2008-CE DT:01/03/08';
        V0Caption_Control1102154081Lbl: Label '0';
        V0Caption_Control1102154134Lbl: Label '0';
        V14CaptionLbl: Label '14';
        NILCaption_Control1102154136Lbl: Label 'NIL';
        NILCaption_Control1102154137Lbl: Label 'NIL';
        NILCaption_Control1102154138Lbl: Label 'NIL';
        NILCaption_Control1102154139Lbl: Label 'NIL';
        NILCaption_Control1102154140Lbl: Label 'NIL';
        V11__CaptionLbl: Label '( 11 )';
        V3__Details_of_the_manufacture_clearance_and_duty_payable_CaptionLbl: Label '3. Details of the manufacture,clearance and duty payable:';
        V5__CaptionLbl: Label '( 5 )';
        Assessable_Value_________________________Rs__CaptionLbl: Label 'Assessable Value                        (Rs.)';
        Quantity_clearedCaptionLbl: Label 'Quantity cleared';
        V4__CaptionLbl: Label '( 4 )';
        Quantity_manufacturedCaptionLbl: Label 'Quantity manufactured';
        V3__CaptionLbl: Label '( 3 )';
        Unit_of_quantityCaptionLbl: Label 'Unit of quantity';
        V2__CaptionLbl: Label '( 2 )';
        CETSH_NO_CaptionLbl: Label 'CETSH NO.';
        V1__CaptionLbl: Label '( 1 )';
        Description_of_GoodsCaptionLbl: Label 'Description of Goods';
        Opening_BalanceCaptionLbl: Label 'Opening Balance';
        Closing_BalanceCaptionLbl: Label 'Closing Balance';
        V3A__CaptionLbl: Label '( 3A )';
        V5A__CaptionLbl: Label '( 5A )';
        V6__CaptionLbl: Label '( 6 )';
        See_rule_12_of_the_Central_Excise_Rules_2002_and_rule_7__5__of_CENVAT_Credit_Rules_2002__CaptionLbl: Label '{ See rule 12 of the Central Excise Rules,2002 and rule 7 (5) of CENVAT Credit Rules,2002 }';
        Return_of_excisable_goods_and_availment_of_CENVAT_credit_for_the_month_ofCaptionLbl: Label 'Return of excisable goods and availment of CENVAT credit for the month of';
        Form_E_R__1CaptionLbl: Label 'Form E.R.-1';
        V2__Name_of_the_assesseeCaptionLbl: Label '2. Name of the assessee';
        V1__Registration_No_CaptionLbl: Label '1. Registration No.';
        NosCaption_Control1102154456Lbl: Label 'Nos';
        NosCaption_Control1102154457Lbl: Label 'Nos';
        NosCaption_Control1102154458Lbl: Label 'Nos';
        NosCaption_Control1102154459Lbl: Label 'Nos';
        V0Caption_Control1102154460Lbl: Label '0';
        V0Caption_Control1102154461Lbl: Label '0';
        V0Caption_Control1102154462Lbl: Label '0';
        V0Caption_Control1102154463Lbl: Label '0';
        V8__CaptionLbl: Label '( 8 )';
        V4_Clearence_details_of_inter_unit_transfer_of_intrermediate_goods_with_out_payment_of_duty_under_sub_rule_1__of_rule_12BB___Lbl: Label '4.Clearence details of inter unit transfer of intrermediate goods with out payment of duty under sub-rule(1) of rule 12BB*:-';
        Regisrtration_number_of_the_Receipient_unitCaptionLbl: Label 'Regisrtration number of the Receipient unit';
        Name_and_address_of_the_receipent_PremisesCaptionLbl: Label 'Name and address of the receipent Premises';
        CETSH_NO_Caption_Control1000000005Lbl: Label 'CETSH NO.';
        description_of_goods_sentCaptionLbl: Label 'description of goods sent';
        Unit_of_QuantityCaption_Control1000000008Lbl: Label 'Unit of Quantity';
        Quantity_ClearedCaption_Control1000000009Lbl: Label 'Quantity Cleared';
        V5_Receipt_of_details_of_intermediate_goods_received_from_other_premises_under_sub_rule_1__of_rule_12BB__CaptionLbl: Label '5.Receipt of details of intermediate goods received from other premises under sub-rule(1) of rule 12BB:-';
        Registration_number_of_sender_premisesCaptionLbl: Label 'Registration number of sender premises';
        Name_and_Address_of_The_sender_premisesCaptionLbl: Label 'Name and Address of The sender premises';
        CETSH_NO_Caption_Control1000000007Lbl: Label 'CETSH NO.';
        Description_of_Goods_ReceivedCaptionLbl: Label 'Description of Goods Received';
        Unit_of_QuantityCaption_Control1000000012Lbl: Label 'Unit of Quantity';
        Quanitity_ReceivedCaptionLbl: Label 'Quanitity Received';
        V1CaptionLbl: Label '1';
        V4CaptionLbl: Label '4';
        V2CaptionLbl: Label '2';
        V3CaptionLbl: Label '3';
        V5CaptionLbl: Label '5';
        V6CaptionLbl: Label '6';
        V1__Caption_Control1280085Lbl: Label '( 1 )';
        V2__Caption_Control1280086Lbl: Label '( 2 )';
        V3__Caption_Control1280087Lbl: Label '( 3 )';
        V4___A__CaptionLbl: Label '4 ( A )';
        Duty_CodeCaptionLbl: Label 'Duty Code';
        Account_current___Rs___CaptionLbl: Label 'Account current ( Rs. )';
        Credit_account____Rs___CaptionLbl: Label 'Credit account  ( Rs. )';
        ChallanCaptionLbl: Label 'Challan';
        V6_____Details_of_duty_paid_on_excisable_goods_CaptionLbl: Label '6.    Details of duty paid on excisable goods:';
        BSR_CodeCaptionLbl: Label 'BSR Code';
        V5__Caption_Control1102154177Lbl: Label '( 5 )';
        Total_duty_paid____Rs___CaptionLbl: Label 'Total duty paid (  Rs. )';
        V6__Caption_Control1102154182Lbl: Label '( 6 )';
        V4___B__CaptionLbl: Label '4 ( B )';
        CENVATCaptionLbl: Label 'CENVAT';
        Educational_CessCaptionLbl: Label 'Educational Cess';
        SHE_CessCaptionLbl: Label 'SHE Cess';
        V7_Abstract_of_ACCOUNT___CURRENT__cash_payment___CaptionLbl: Label '7.Abstract of ACCOUNT - CURRENT (cash payment):-';
        Summary_Particulars__1_CaptionLbl: Label 'Summary Particulars (1)';
        AmountCaptionLbl: Label 'Amount';
        BEDCaptionLbl: Label 'BED';
        EDU_CESSCaptionLbl: Label 'EDU CESS';
        S_H_CESSCaptionLbl: Label 'S&H CESS';
        Opening_BalanceCaption_Control1000000048Lbl: Label 'Opening Balance';
        Add_TR_6_GAR_7_Challan_Payments_Made_in_Month_in_aggerigate_CaptionLbl: Label 'Add:TR-6/GAR-7 Challan Payments Made in Month(in aggerigate)';
        Add__Adjustement_of_the_excess_duty_paid_during_previous_period_under_subrule_2__of_rule_12BB_incase_of__LT_CaptionLbl: Label 'Add: Adjustement of the excess duty paid during previous period under subrule(2) of rule 12BB(incase of (LT)';
        Total_Amount_AvailableCaptionLbl: Label 'Total Amount Available';
        Less_utilization_towards_payment_of_duties_on_excise_goods_during_the_month__vise_details_furnished_under_col_3_in_SI_NO__9__Lbl: Label 'Less:utilization towards payment of duties on excise goods during the month (vise details furnished under col.3 in SI.NO.(9) of the return)';
        Less_utilization_towards_other_payments_made__during_the_month__vise_details_furnished_under_col_3_in_SI_NO__9__of_the_returnLbl: Label 'Less:utilization towards other payments made  during the month (vise details furnished under col.3 in SI.NO.(9) of the return)';
        Closing_BalanceCaption_Control1000000091Lbl: Label 'Closing Balance';
        EmptyStringCaptionLbl: Label '-';
        V8_____Details_of_CENVAT_credit_availed_and_utilized___CaptionLbl: Label '8.    Details of CENVAT credit availed and utilized  :';
        Details_of_CreditCaptionLbl: Label 'Details of Credit';
        CENVAT__Rs__CaptionLbl: Label 'CENVAT (Rs.)';
        V1__Caption_Control1102154028Lbl: Label '( 1 )';
        V2__Caption_Control1102154030Lbl: Label '( 2 )';
        Opening_balanceCaption_Control1102154034Lbl: Label 'Opening balance';
        Credit_availed_on_inputs_on_invoices_issued_by_mfrsCaptionLbl: Label 'Credit availed on inputs on invoices issued by mfrs';
        Credit_availed_on_capital_goodsCaptionLbl: Label 'Credit availed on capital goods';
        Total_credit_availedCaptionLbl: Label 'Total credit availed';
        Credit_utilized_for_payment_of_duty_on_servicesCaptionLbl: Label 'Credit utilized for payment of duty on services';
        Closing_balanceCaption_Control1102154065Lbl: Label 'Closing balance';
        V3__Caption_Control1102154066Lbl: Label '( 3 )';
        AED_TTA_____Rs__CaptionLbl: Label 'AED(TTA)   (Rs.)';
        V4__Caption_Control1102154098Lbl: Label '( 4 )';
        NCCD__Rs__CaptionLbl: Label 'NCCD (Rs.)';
        V5__Caption_Control1102154289Lbl: Label '( 5 )';
        Credit_availed_on_input_servicesCaptionLbl: Label 'Credit availed on input services';
        Credit_utilized_for_payment_of_duty_on_goodsCaptionLbl: Label 'Credit utilized for payment of duty on goods';
        Credit_utilized_when_inputs_or_capital_goods_are_removed_as_suchCaptionLbl: Label 'Credit utilized when inputs or capital goods are removed as such';
        Service_Tax__Rs__CaptionLbl: Label 'Service Tax (Rs.)';
        Education_Cess_on_Taxable_Services__Rs__CaptionLbl: Label 'Education Cess on Taxable Services (Rs.)';
        Cr_availed_on_inputs_on_invoices_issued_by__I_or_II_stage_dlrs_or_TradersCaptionLbl: Label 'Cr availed on inputs on invoices issued by  I or II stage dlrs or Traders';
        Credit__taken_on_imported_inputsCaptionLbl: Label 'Credit  taken on imported inputs';
        Education_CESS__Rs__CaptionLbl: Label 'Education CESS (Rs.)';
        V9_____Details_of_other_payment_made___CaptionLbl: Label '9.    Details of other payment made  :';
        PaymentsCaptionLbl: Label 'Payments';
        Amount_Paid___Rs__CaptionLbl: Label 'Amount Paid ( Rs )';
        Account_CurrentCaptionLbl: Label 'Account Current';
        Credit_accountCaptionLbl: Label 'Credit account';
        V1__Caption_Control40Lbl: Label '( 1 )';
        V2A__CaptionLbl: Label '( 2A )';
        V2B__CaptionLbl: Label '( 2B )';
        No_CaptionLbl: Label 'No.';
        ChallanCaption_Control47Lbl: Label 'Challan';
        V3A__Caption_Control48Lbl: Label '( 3A )';
        Arrears_of_DutyCaptionLbl: Label 'Arrears of Duty';
        InterestCaptionLbl: Label 'Interest';
        DateCaptionLbl: Label 'Date';
        V3B__CaptionLbl: Label '( 3B )';
        Misc__PaymentCaptionLbl: Label 'Misc. Payment';
        Source_Document_No_and_DateCaptionLbl: Label 'Source Document No and Date';
        V4__Caption_Control75Lbl: Label '( 4 )';
        V10_____Self___assessment_memorandum___CaptionLbl: Label '10.    Self - assessment memorandum  :';
        a_____I_hereby_declare_that_the_information_given_in_this_Return_is_true__correct_and_complete_in_every_respect_and_that_i_amLbl: Label '"a)    I hereby declare that the information given in this Return is true, correct and complete in every respect and that i am authorised "';
        to_sign_on_behalf_of_the_assessee_CaptionLbl: Label 'to sign on behalf of the assessee.';
        b_____During_the_month__total_Rs_CaptionLbl: Label 'b)    During the month, total Rs.';
        was_deposited_vide_TR_6_ChallansCaptionLbl: Label 'was deposited vide TR 6 Challans';
        Place_CaptionLbl: Label 'Place:';
        Date_CaptionLbl: Label 'Date:';
        c_____During_the_month__invoices_bearing_S_No________________________to_S_No______________________________were_issued_CaptionLbl: Label 'c)    During the month, invoices bearing S.No.                       to S.No.                             were issued.';
        d____During_the_month__transfer_Challans_under_rule_12BB_of_the_central__Excise_Rules_2002_bearing_S_No_____To________and_traLbl: Label 'd)   During the month, transfer Challans under rule 12BB of the central  Excise Rules,2002 bearing S.No     To      , and transfer Challan under rule 12A of the  CENVAT Credit Rule ,2004 bearing S.No       To      Were Issued.';
        Name_and_Signature_of_Assessee_or_Authorized_SignatoryCaptionLbl: Label 'Name and Signature of Assessee or Authorized Signatory';
        Applicable_only_for_large_taxpayers_defined_under_rule2_ea__of_the_Central_Excise_Rules_2002_and_who_has_Opted__to__operate_aLbl: Label '*Applicable only for large taxpayers defined under rule2(ea) of the Central Excise Rules,2002 and who has Opted  to  operate as Large Taxpayer.';
        ACKNOWLEDGEMENTCaptionLbl: Label 'ACKNOWLEDGEMENT';
        Return_of_excisable_goods__and_availment_of_CENVAT_credit_for_the_month_of_CaptionLbl: Label '"Return of excisable goods  and availment of CENVAT credit for the month of "';
        DCaptionLbl: Label 'D';
        DCaption_Control1000000095Lbl: Label 'D';
        MCaptionLbl: Label 'M';
        MCaption_Control1000000102Lbl: Label 'M';
        YCaptionLbl: Label 'Y';
        YCaption_Control1000000124Lbl: Label 'Y';
        Date_Of_Receipt_CaptionLbl: Label '"Date Of Receipt "';
        YCaption_Control1102154440Lbl: Label 'Y';
        YCaption_Control1102154441Lbl: Label 'Y';
        copies_enclosed__CaptionLbl: Label '" (copies enclosed)."';
}

