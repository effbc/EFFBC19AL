report 50132 "Vat Returns Report"
{
    // version NAVIN3.70.00.11

    DefaultLayout = RDLC;
    RDLCLayout = './Vat Returns Report.rdlc';

    dataset
    {
        dataitem("G/L Entry"; "G/L Entry")
        {
            DataItemTableView = SORTING(G/L Account No., Posting Date) ORDER(Ascending) WHERE(G/L Account No.=FILTER(23800|23801|23802),Amount=FILTER(>0));

            trigger OnAfterGetRecord();
            begin
                GLtot:=0;
                GLvatper:=0;
                GLVATAmt:=0;
                VNo:='';
                VName:='';
                //GL.SETCURRENTKEY(GL."G/L Account No.",GL."Posting Date");
                GL.SETRANGE(GL."Journal Batch Name","G/L Entry"."Journal Batch Name");
                GL.SETRANGE(GL."Document No.","G/L Entry"."Document No.");
                GL.SETFILTER(GL.Amount,'>0');
                IF GL.FIND('-') THEN
                REPEAT
                IF (GL."G/L Account No."='23800') OR (GL."G/L Account No."='23801') THEN
                GLVATAmt:=GL.Amount
                ELSE
                GLtot:=GLtot+GL.Amount;
                
                IF (GL."G/L Account No."='61400') OR (GL."G/L Account No."='61904') THEN
                GLtot:=GLtot-GL.Amount;
                
                totalamt:=totalamt+GL.Amount;
                UNTIL GL.NEXT=0;
                IF GLtot<>0 THEN
                GLvatper:=ROUND(((GLVATAmt/GLtot)*100),1);
                /*VLE.SETRANGE(VLE."Document No.","G/L Entry"."Document No.");
                IF VLE.FIND('-') THEN
                REPEAT
                VNo:=VLE."Vendor No.";
                Vendor.SETRANGE(Vendor."No.",VNo);
                IF Vendor.FIND('-') THEN
                BEGIN
                VName:=Vendor.Name;
                END;
                UNTIL VLE.NEXT=0;*/
                IF (GLvatper>=3) AND (GLvatper<=5) THEN
                BEGIN
                "Assessable4%":="Assessable4%"+GLtot;
                END;
                  IF (GLvatper>=8)AND(GLvatper<14.5)  THEN
                  BEGIN
                  "Assessable12.5%":="Assessable12.5%"+GLtot;
                  END;
                  IF (GLvatper>=14.5)AND(GLvatper<=16)  THEN
                  BEGIN
                  "Assessable14.5%":="Assessable14.5%"+GLtot;
                  END;

            end;

            trigger OnPreDataItem();
            begin
                QtyManfactured1:=0;
                QtyManfactured2:=0;
                QtyManfactured3:=0;
                QtyManfactured4:=0;
                QtyManfactured5:=0;

                Assessable1:=0;
                Assessable2:=0;
                Assessable3:=0;

                "Assessable4%":=0;
                "Assessable12.5%":=0;
                "Assessable1%":=0;

                VatAmt4:=0;
                Vatamt12:=0;
                VatAmt1:=0;

                Dummycess1:=0;
                Dummycess2:=0;
                Dummycess3:=0;

                Excise:=0;

                totalbilled:=0;
                totalvatbilled:=0;
                CST1:=0;
                "vat4%":=0;
                "vat12.5%":=0;


                j:=1;
                d1:=DATE2DMY(StartDt,1);
                m1:=DATE2DMY(StartDt,2);
                y1:=DATE2DMY(StartDt,3);

                d2:=DATE2DMY(EndDt,1);
                m2:=DATE2DMY(EndDt,2);
                y2:=DATE2DMY(EndDt,3);

                "G/L Entry".SETRANGE("G/L Entry"."Posting Date",StartDt,EndDt);
                "G/L Entry".SETFILTER("G/L Entry"."Document No.",'JV*|CPV*');
            end;
        }
        dataitem("Sales Invoice Header";"Sales Invoice Header")
        {
            DataItemTableView = SORTING(No.) ORDER(Ascending);

            trigger OnAfterGetRecord();
            begin
                tempexcise:=0;
                tempcess:=0;
                SIL.SETRANGE(SIL."Document No.","Sales Invoice Header"."No.");
                IF SIL.FIND('-') THEN
                REPEAT
                IF SIL."Amount To Customer">0 THEN
                BEGIN

                // To Calculate only VAT related Sales Bills

                IF ("Sales Invoice Header".Structure='SALE-E+V') OR ("Sales Invoice Header".Structure='SALE-VAT') THEN
                BEGIN
                //To Calculate only VAT 4% related Sales Bills
                 IF (SIL."Tax %"=4.0) AND (SIL."Tax Area Code"='SALES VAT') THEN
                 BEGIN
                   "vat4%":="vat4%"+SIL."Tax Amount";
                   Assessable1:=Assessable1+SIL.Amount;
                   Excise1:=Excise1+SIL."BED Amount";
                   Dummycess1:=Dummycess1+SIL."eCess Amount";
                 END;
                 IF SIL."SHE Cess Amount"<>0 THEN
                 BEGIN
                   Ecess1:=SIL."eCess Amount";
                   SHEcess1:=SIL."SHE Cess Amount";
                 END ELSE
                 BEGIN
                   Ecess1:=Dummycess1*(2/3);
                   SHEcess1:=Dummycess1*(1/3);
                 END;


                //To Calculate only VAT 12.5% related Sales Bills

                 IF (SIL."Tax %"=12.5) AND (SIL."Tax Area Code"='SALES VAT') THEN
                 BEGIN
                   "vat12.5%":="vat12.5%"+SIL."Tax Amount";
                   Assessable2:=Assessable2+SIL.Amount;
                   excise2:=excise2+SIL."BED Amount";
                   Dummycess2:=Dummycess2+SIL."eCess Amount";
                 END;

                  IF SIL."SHE Cess Amount"<>0 THEN
                  BEGIN
                   SHEcess2:=SIL."SHE Cess Amount";
                   Ecess2:=SIL."eCess Amount";
                   END ELSE
                   BEGIN
                   Ecess2:=Dummycess2*(2/3);
                   SHEcess2:=Dummycess2*(1/3);
                   END;

                //To Calculate only VAT 14.5% related Sales Bills

                 IF (SIL."Tax %"=14.5) AND (SIL."Tax Area Code"='SALES VAT') THEN
                 BEGIN
                   "vat14.5%":="vat14.5%"+SIL."Tax Amount";
                   Assessable4:=Assessable4+SIL.Amount;
                   excise4:=excise4+SIL."BED Amount";
                   Dummycess4:=Dummycess4+SIL."eCess Amount";
                 END;

                  IF SIL."SHE Cess Amount"<>0 THEN
                  BEGIN
                   SHEcess4:=SIL."SHE Cess Amount";
                   Ecess4:=SIL."eCess Amount";
                   END ELSE
                   BEGIN
                   Ecess4:=Dummycess4*(2/3);
                   SHEcess4:=Dummycess4*(1/3);
                   END;


                totalvatbilled:=totalvatbilled+SIL."Amount To Customer";
                END;
                //To Calculate only CST related Sales Bills

                    IF ("Sales Invoice Header".Structure='SALE-E+CST') OR ("Sales Invoice Header".Structure='SALE-CST') THEN
                    BEGIN
                      Assessable3:=Assessable3+SIL.Amount;
                      excise3:=excise3+SIL."BED Amount";
                      CST1:=CST1+SIL."Tax Amount";
                      Dummycess3:=Dummycess3+SIL."eCess Amount";
                //      Ecess3:=Dummycess3*(2/3);
                 //     SHEcess3:=Dummycess3*(1/3);
                    IF SIL."SHE Cess Amount"<>0 THEN
                    BEGIN
                     SHEcess3:=SIL."SHE Cess Amount";
                     Ecess3:=SIL."eCess Amount";
                    END ELSE
                    BEGIN
                     Ecess3:=Dummycess3*(2/3);
                     SHEcess3:=Dummycess3*(1/3);
                    END;


                // Total Billed Value of CST Bills with taxes

                      TurnoverCST:=TurnoverCST+SIL."Amount To Customer";

                    END;

                // To Calculate total Period wise Sales Bills both CST bills & VAT Bills)

                totalbilled:=totalbilled+SIL."Amount To Customer";

                END;

                UNTIL SIL.NEXT=0;
            end;

            trigger OnPreDataItem();
            begin

                SETRANGE("Posting Date",StartDt,EndDt);
            end;
        }
        dataitem("Purch. Inv. Header";"Purch. Inv. Header")
        {
            DataItemTableView = SORTING(Type of Supplier,Buy-from Vendor Name) ORDER(Ascending);

            trigger OnAfterGetRecord();
            begin
                PIL.SETRANGE(PIL."Document No.","Purch. Inv. Header"."No.");
                //PIL.SETRANGE();
                IF PIL.FIND('-') THEN
                REPEAT
                IF PIL."Tax Area Code"='PUCH VAT' THEN
                BEGIN
                IF PIL."Tax %"=4.0 THEN
                BEGIN
                "Assessable4%"+=PIL."Tax Base Amount";
                VatAmt4+=PIL."Tax Amount";
                END;
                IF PIL."Tax %"=12.5 THEN
                BEGIN
                "Assessable12.5%"+=PIL."Tax Base Amount";
                Vatamt12+=PIL."Tax Amount";
                END;
                /*IF PIL."Tax %"=1.0 THEN
                BEGIN
                "Assessable1%"+=PIL."Tax Base Amount";
                VatAmt1+=PIL."Tax Amount";
                END;
                */
                IF PIL."Tax %"=14.5 THEN
                BEGIN
                "Assessable14.5%"+=PIL."Tax Base Amount";
                vatamt14+=PIL."Tax Amount";
                END;
                END;
                UNTIL PIL.NEXT=0;
                "Purch. Inv. Header".CALCFIELDS("Purch. Inv. Header"."Invoiced Amount");
                totalamt+="Purch. Inv. Header"."Invoiced Amount";
                
                //IF Assessable=0 THEN
                // CurrReport.SKIP;

            end;

            trigger OnPostDataItem();
            begin
                //MESSAGE(FORMAT(VatAmt4));
                //MESSAGE(FORMAT(Vatamt12));
                "Assessable4%":="Assessable4%";
                "Assessable12.5%":="Assessable12.5%";
            end;

            trigger OnPreDataItem();
            begin
                SETRANGE("Posting Date",StartDt,EndDt);
                //SETFILTER("Purch. Inv. Header".Structure,'PURC-E+VAT|PURC-VAT|PUR+EF+VAT|PUR-VAT|PUR-VAT-ST|P-E+VAT+AD');
            end;
        }
        dataitem(Title;"Integer")
        {
            DataItemTableView = SORTING(Number) WHERE(Number=CONST(1));

            trigger OnPreDataItem();
            begin
                Month := ReturnMonth + 1
            end;
        }
        dataitem("Company Information";"Company Information")
        {
            DataItemTableView = SORTING(Primary Key);
        }
        dataitem("<Integer1>";"Integer")
        {
            DataItemTableView = SORTING(Number) WHERE(Number=CONST(1));
        }
        dataitem("<Integer2>";"Integer")
        {
            DataItemTableView = SORTING(Number) WHERE(Number=CONST(1));
            column(ReportType;ReportType)
            {
            }
            column(y1;y1)
            {
            }
            column(d1;d1)
            {
            }
            column(m1;m1)
            {
            }
            column(d2;d2)
            {
            }
            column(m2;m2)
            {
            }
            column(y2;y2)
            {
            }
            column(Company_Information__Name;"Company Information".Name)
            {
            }
            column(UPPERCASE__Company_Information__Address__________________UPPERCASE__Company_Information__City_;UPPERCASE("Company Information".Address)+'             '+UPPERCASE("Company Information".City))
            {
            }
            column(Company_Information___Fax_No__;"Company Information"."Fax No.")
            {
            }
            column(Company_Information___Phone_No__;"Company Information"."Phone No.")
            {
            }
            column(Inputtaxcredited;Inputtaxcredited)
            {
            }
            column(ROUND__Assessable4___1_;ROUND("Assessable4%",1))
            {
            }
            column(ROUND__Assessable12_5___1_;ROUND("Assessable12.5%",1))
            {
            }
            column(ROUND__Assessable1___1_;ROUND("Assessable1%",1))
            {
            }
            column(ROUND___Assessable4____4_100_1_;ROUND(("Assessable4%")*4/100,1))
            {
            }
            column(ROUND___Assessable12_5___12_5_100__1_;ROUND(("Assessable12.5%"*12.5/100),1))
            {
            }
            column(ROUND___Assessable1____1_100_1_;ROUND(("Assessable1%")*1/100,1))
            {
            }
            column(DataItem1102154083;ROUND(("Assessable4%")*4/100,1)+ROUND(("Assessable12.5%"*12.5/100),1)+Inputtaxcredited+ROUND(("Assessable14.5%"*14.5/100),1))
            {
            }
            column(V0;0)
            {
            }
            column(ROUND_TurnoverCST_1_;ROUND(TurnoverCST,1))
            {
            }
            column(ROUND__Assessable1_Excise1_Dummycess1__1_;ROUND((Assessable1+Excise1+Dummycess1),1))
            {
            }
            column(ROUND__Assessable2_excise2_Dummycess2__1_;ROUND((Assessable2+excise2+Dummycess2),1))
            {
            }
            column(ROUND__Assessable1_Excise1_Dummycess1__4_100_1_;ROUND((Assessable1+Excise1+Dummycess1)*4/100,1))
            {
            }
            column(ROUND__Assessable2_excise2_Dummycess2__12_5_100_1_;ROUND((Assessable2+excise2+Dummycess2)*12.5/100,1))
            {
            }
            column(DataItem1102154120;ROUND((Assessable2+excise2+Dummycess2)*12.5/100,1)+ROUND((Assessable1+Excise1+Dummycess1)*4/100,1)+ROUND((Assessable4+excise4+Dummycess4)*14.5/100,1))
            {
            }
            column(DataItem1102154003;ROUND(totalamt,1)-ROUND("Assessable4%",1)-ROUND("Assessable12.5%",1)-ROUND(("Assessable4%")*4/100,1)-ROUND(("Assessable12.5%"*12.5/100),1)-ROUND(("Assessable14.5%"*14.5/100),1))
            {
            }
            column(ROUND__Assessable14_5___1_;ROUND("Assessable14.5%",1))
            {
            }
            column(ROUND___Assessable14_5____14_5_100_1_;ROUND(("Assessable14.5%")*14.5/100,1))
            {
            }
            column(ROUND__Assessable4_excise4_Dummycess4__1_;ROUND((Assessable4+excise4+Dummycess4),1))
            {
            }
            column(ROUND__Assessable4_excise4_Dummycess4__14_5_100_1_;ROUND((Assessable4+excise4+Dummycess4)*14.5/100,1))
            {
            }
            column(V24variable_;"24variable")
            {
            }
            column(ROUND_totadjustcst_1_;ROUND(totadjustcst,1))
            {
            }
            column(V24bvariable_;"24bvariable")
            {
            }
            column(TODAY__;TODAY())
            {
            }
            column(Adjustvat;Adjustvat)
            {
            }
            column(adjustdetails;adjustdetails)
            {
            }
            column(Adjustvat_Control1102154104;Adjustvat)
            {
            }
            column(MONTHLY_RETURN_FOR_VALUE_ADDED_TAXCaption;MONTHLY_RETURN_FOR_VALUE_ADDED_TAXCaptionLbl)
            {
            }
            column(Please_read_notes_before_completing_this_formCaption;Please_read_notes_before_completing_this_formCaptionLbl)
            {
            }
            column(FORM_VAT_200Caption;FORM_VAT_200CaptionLbl)
            {
            }
            column(V01________________________TINCaption;V01________________________TINCaptionLbl)
            {
            }
            column(V02__________________Period_covered_by_this_ReturnCaption;V02__________________Period_covered_by_this_ReturnCaptionLbl)
            {
            }
            column(FROMCaption;FROMCaptionLbl)
            {
            }
            column(V6Caption;V6CaptionLbl)
            {
            }
            column(V4Caption;V4CaptionLbl)
            {
            }
            column(V6Caption_Control1102154028;V6Caption_Control1102154028Lbl)
            {
            }
            column(V7Caption;V7CaptionLbl)
            {
            }
            column(V1Caption;V1CaptionLbl)
            {
            }
            column(V6Caption_Control1102154031;V6Caption_Control1102154031Lbl)
            {
            }
            column(V5Caption;V5CaptionLbl)
            {
            }
            column(V0Caption;V0CaptionLbl)
            {
            }
            column(V8Caption;V8CaptionLbl)
            {
            }
            column(V3Caption;V3CaptionLbl)
            {
            }
            column(V2Caption;V2CaptionLbl)
            {
            }
            column(TOCaption;TOCaptionLbl)
            {
            }
            column(DDCaption;DDCaptionLbl)
            {
            }
            column(MMCaption;MMCaptionLbl)
            {
            }
            column(YYYYCaption;YYYYCaptionLbl)
            {
            }
            column(DDCaption_Control1102154043;DDCaption_Control1102154043Lbl)
            {
            }
            column(MMCaption_Control1102154044;MMCaption_Control1102154044Lbl)
            {
            }
            column(YYYYCaption_Control1102154045;YYYYCaption_Control1102154045Lbl)
            {
            }
            column(V03_Name_of_Enterprises_Caption;V03_Name_of_Enterprises_CaptionLbl)
            {
            }
            column(Address__Caption;Address__CaptionLbl)
            {
            }
            column(Fax_No_Caption;Fax_No_CaptionLbl)
            {
            }
            column(Phone_No_Caption;Phone_No_CaptionLbl)
            {
            }
            column(If_you_have_made_no_purchases_and_no_sales__cross_this_box_Caption;If_you_have_made_no_purchases_and_no_sales__cross_this_box_CaptionLbl)
            {
            }
            column(If_you_have_no_entry_for_a_box__insert__NIL___Do_not_leave_any_box_blank_unless_you_cross_box_04_Caption;If_you_have_no_entry_for_a_box__insert__NIL___Do_not_leave_any_box_blank_unless_you_cross_box_04_CaptionLbl)
            {
            }
            column(Input_tax_credit_from_previous_month_Caption;Input_tax_credit_from_previous_month_CaptionLbl)
            {
            }
            column(V4Caption_Control1102154014;V4Caption_Control1102154014Lbl)
            {
            }
            column(V5Caption_Control1102154015;V5Caption_Control1102154015Lbl)
            {
            }
            column(Box_24_or_24__b__of_your_previous_tax_return_Caption;Box_24_or_24__b__of_your_previous_tax_return_CaptionLbl)
            {
            }
            column(PURCHASES_IN_THE_MONTH_Caption;PURCHASES_IN_THE_MONTH_CaptionLbl)
            {
            }
            column(Value_excluding_VATCaption;Value_excluding_VATCaptionLbl)
            {
            }
            column(VAT_ClaimedCaption;VAT_ClaimedCaptionLbl)
            {
            }
            column(INPUT_Caption;INPUT_CaptionLbl)
            {
            }
            column(A_Caption;A_CaptionLbl)
            {
            }
            column(B_Caption;B_CaptionLbl)
            {
            }
            column(Exempt_or_non_creditable_PurchasesCaption;Exempt_or_non_creditable_PurchasesCaptionLbl)
            {
            }
            column(V4__Rate_PurchasesCaption;V4__Rate_PurchasesCaptionLbl)
            {
            }
            column(V12_5__Rate_PurchasesCaption;V12_5__Rate_PurchasesCaptionLbl)
            {
            }
            column(V1__Rate_PurchasesCaption;V1__Rate_PurchasesCaptionLbl)
            {
            }
            column(Special_Rate_PurchasesCaption;Special_Rate_PurchasesCaptionLbl)
            {
            }
            column(Total_Amount_of_input_tax__5_7_B__8_B__9_B_Caption;Total_Amount_of_input_tax__5_7_B__8_B__9_B_CaptionLbl)
            {
            }
            column(V6Caption_Control1102154047;V6Caption_Control1102154047Lbl)
            {
            }
            column(V7Caption_Control1102154067;V7Caption_Control1102154067Lbl)
            {
            }
            column(V8Caption_Control1102154068;V8Caption_Control1102154068Lbl)
            {
            }
            column(V9Caption;V9CaptionLbl)
            {
            }
            column(V11Caption;V11CaptionLbl)
            {
            }
            column(V12Caption;V12CaptionLbl)
            {
            }
            column(V12Caption_Control1102154054;V12Caption_Control1102154054Lbl)
            {
            }
            column(V13Caption;V13CaptionLbl)
            {
            }
            column(V14Caption;V14CaptionLbl)
            {
            }
            column(V15Caption;V15CaptionLbl)
            {
            }
            column(V16Caption;V16CaptionLbl)
            {
            }
            column(V17Caption;V17CaptionLbl)
            {
            }
            column(SALES_IN_THE_MONTH_Caption;SALES_IN_THE_MONTH_CaptionLbl)
            {
            }
            column(INPUT_Caption_Control1102154086;INPUT_Caption_Control1102154086Lbl)
            {
            }
            column(Exempt_SalesCaption;Exempt_SalesCaptionLbl)
            {
            }
            column(Zero_Rate_Sales_International_ExportsCaption;Zero_Rate_Sales_International_ExportsCaptionLbl)
            {
            }
            column(Zero_Rate_Sales_Others__CST_Sales_Caption;Zero_Rate_Sales_Others__CST_Sales_CaptionLbl)
            {
            }
            column(Tax_Due_on_Purchase_of_goodsCaption;Tax_Due_on_Purchase_of_goodsCaptionLbl)
            {
            }
            column(V4__Rate_SalesCaption;V4__Rate_SalesCaptionLbl)
            {
            }
            column(V12_5__Rate_SalesCaption;V12_5__Rate_SalesCaptionLbl)
            {
            }
            column(Value_excluding_VATCaption_Control1102154093;Value_excluding_VATCaption_Control1102154093Lbl)
            {
            }
            column(A_Caption_Control1102154094;A_Caption_Control1102154094Lbl)
            {
            }
            column(VAT_DueCaption;VAT_DueCaptionLbl)
            {
            }
            column(B_Caption_Control1102154102;B_Caption_Control1102154102Lbl)
            {
            }
            column(V18Caption;V18CaptionLbl)
            {
            }
            column(Special_Rate_SalesCaption;Special_Rate_SalesCaptionLbl)
            {
            }
            column(V19Caption;V19CaptionLbl)
            {
            }
            column(V1__Rate_SalesCaption;V1__Rate_SalesCaptionLbl)
            {
            }
            column(V20Caption;V20CaptionLbl)
            {
            }
            column(Total_Amount_of_output_tax__15_B__16_B__17_B__19_B_Caption;Total_Amount_of_output_tax__15_B__16_B__17_B__19_B_CaptionLbl)
            {
            }
            column(If_total_of_box_20_exceeds_box_11_pay_this_amountCaption;If_total_of_box_20_exceeds_box_11_pay_this_amountCaptionLbl)
            {
            }
            column(V21Caption;V21CaptionLbl)
            {
            }
            column(NILCaption;NILCaptionLbl)
            {
            }
            column(NILCaption_Control1102154098;NILCaption_Control1102154098Lbl)
            {
            }
            column(NILCaption_Control1102154111;NILCaption_Control1102154111Lbl)
            {
            }
            column(NILCaption_Control1102154115;NILCaption_Control1102154115Lbl)
            {
            }
            column(NILCaption_Control1102154119;NILCaption_Control1102154119Lbl)
            {
            }
            column(NILCaption_Control1102154123;NILCaption_Control1102154123Lbl)
            {
            }
            column(NILCaption_Control1102154129;NILCaption_Control1102154129Lbl)
            {
            }
            column(NILCaption_Control1102154130;NILCaption_Control1102154130Lbl)
            {
            }
            column(NILCaption_Control1102154077;NILCaption_Control1102154077Lbl)
            {
            }
            column(V10Caption;V10CaptionLbl)
            {
            }
            column(V14_5__Rate_PurchasesCaption;V14_5__Rate_PurchasesCaptionLbl)
            {
            }
            column(V18Caption_Control1102154143;V18Caption_Control1102154143Lbl)
            {
            }
            column(V14_5__Rate_SalesCaption;V14_5__Rate_SalesCaptionLbl)
            {
            }
            column(V22Caption;V22CaptionLbl)
            {
            }
            column(Payment___Adjustment_Details_Caption;Payment___Adjustment_Details_CaptionLbl)
            {
            }
            column(DetailsCaption;DetailsCaptionLbl)
            {
            }
            column(Challan___Instrument_No_Caption;Challan___Instrument_No_CaptionLbl)
            {
            }
            column(DateCaption;DateCaptionLbl)
            {
            }
            column(Blank___TreasuryCaption;Blank___TreasuryCaptionLbl)
            {
            }
            column(Payment_DetailsCaption;Payment_DetailsCaptionLbl)
            {
            }
            column(Adjustment__Give_Details_in_22_a__Caption;Adjustment__Give_Details_in_22_a__CaptionLbl)
            {
            }
            column(Branch_CodeCaption;Branch_CodeCaptionLbl)
            {
            }
            column(AmountCaption;AmountCaptionLbl)
            {
            }
            column(TotalCaption;TotalCaptionLbl)
            {
            }
            column(Nature_AdjustmentCaption;Nature_AdjustmentCaptionLbl)
            {
            }
            column(V22_a____Adjustment_Details_Caption;V22_a____Adjustment_Details_CaptionLbl)
            {
            }
            column(DetailsCaption_Control1102154197;DetailsCaption_Control1102154197Lbl)
            {
            }
            column(AmountCaption_Control1102154198;AmountCaption_Control1102154198Lbl)
            {
            }
            column(IfLbl;IfLbl)
            {
            }
            column(DataItem1102154205;If_you_have_declared_no_exports_in_box_13_A__you_must_carry_the_credit_forward_in_box_24_unless_you_have_carried_forward_a_taLbl)
            {
            }
            column(Refund_23Caption;Refund_23CaptionLbl)
            {
            }
            column(Rs__NILCaption;Rs__NILCaptionLbl)
            {
            }
            column(Credit_carried_forwardCaption;Credit_carried_forwardCaptionLbl)
            {
            }
            column(V24Caption;V24CaptionLbl)
            {
            }
            column(DataItem1102154211;If_you_want_to_adjust_the_excess_amount_against_the_liability_under_the_CST_Act_please_fill_in_boxes_24_a__and_24_b__Tax_due_Lbl)
            {
            }
            column(V24_a_Caption;V24_a_CaptionLbl)
            {
            }
            column(V24_a_Caption_Control1102154216;V24_a_Caption_Control1102154216Lbl)
            {
            }
            column(V24_b_Caption;V24_b_CaptionLbl)
            {
            }
            column(Net_credit_carried_forwardCaption;Net_credit_carried_forwardCaptionLbl)
            {
            }
            column(V24_b_Caption_Control1102154220;V24_b_Caption_Control1102154220Lbl)
            {
            }
            column(Declaration__Caption;Declaration__CaptionLbl)
            {
            }
            column(V25_Caption;V25_CaptionLbl)
            {
            }
            column(DataItem1102154225;Name_M_V_MURALI_KRISHNA__being__title__DIRECTOR___of_the_above_enterprise_do_hereby_declare_that_the_information_given_in_thiLbl)
            {
            }
            column(Signature___Stamp___________________Date_of_declaration_Caption;Signature___Stamp___________________Date_of_declaration_CaptionLbl)
            {
            }
            column(VATCaption;VATCaptionLbl)
            {
            }
            column(Integer2__Number;Number)
            {
            }
        }
        dataitem("<Integer3>";"Integer")
        {
            DataItemTableView = SORTING(Number) WHERE(Number=CONST(1));

            trigger OnPreDataItem();
            begin
                /*// Opening Balances - RG23CPartII
                OpenCenvatCG := 0.00;
                OpenAEDCG := 0.00;
                OpenOTHCG := 0.00;
                OpeneCESSCG := 0.00;
                RG23CPARTII.RESET;
                RG23CPARTII.SETRANGE(RG23CPARTII."Posting Date",0D,StartingDate-1);
                IF LocationNo <> '' THEN
                   RG23CPARTII.SETRANGE("Location E.C.C. No.",LocationNo);
                IF RG23CPARTII.FIND('-') THEN
                  REPEAT
                      OpenCenvatCG := OpenCenvatCG + RG23CPARTII."BED Credit" + RG23CPARTII."SED Credit" + RG23CPARTII."SAED Credit" +
                                      + RG23CPARTII."AED(GSI) Credit" + RG23CPARTII."ADE Credit"  -
                                      RG23CPARTII."BED Debit" - RG23CPARTII."SED Debit" - RG23CPARTII."SAED Debit" - RG23CPARTII."AED(GSI) Debit" -
                                      RG23CPARTII."ADE Debit" ;
                      OpenAEDCG := OpenAEDCG + RG23CPARTII."AED(TTA) Credit" - RG23CPARTII."AED(TTA) Debit";
                      OpenOTHCG := OpenOTHCG + RG23CPARTII."NCCD Credit" - RG23CPARTII."NCCD Debit";
                      OpeneCESSCG := OpeneCESSCG + RG23CPARTII."eCess Credit" - RG23CPARTII."eCess Debit";
                      OpenADETCG := OpenADETCG + RG23CPARTII."ADET Credit" - RG23CPARTII."ADET Debit";
                      OpenSTCG := OpenSTCG + RG23CPARTII."Service Tax  Credit" - RG23CPARTII."Service Tax  Debit";
                      OpenSTeCessCG := OpenSTeCessCG + RG23CPARTII."Service Tax eCess Credit" - RG23CPARTII."Service Tax eCess Debit";
                  UNTIL RG23CPARTII.NEXT = 0;
                
                // Credit Availed - RG23CPartII
                CrCenvatTakeCG := 0.00;
                CrAEDTakeCG := 0.00;
                CrOTHTakeCG := 0.00;
                CreCESSTakeCG := 0.00;
                CrADETTakeCG := 0.00;
                RG23CPARTII.RESET;
                RG23CPARTII.SETRANGE(RG23CPARTII."Posting Date",StartingDate,EndingDate);
                IF LocationNo <> '' THEN
                   RG23CPARTII.SETRANGE("Location E.C.C. No.",LocationNo);
                IF RG23CPARTII.FIND('-') THEN
                  REPEAT
                    CrCenvatTakeCG := CrCenvatTakeCG + RG23CPARTII."BED Credit" + RG23CPARTII."SED Credit" + RG23CPARTII."SAED Credit" +
                                      RG23CPARTII."AED(GSI) Credit" + RG23CPARTII."ADE Credit";
                    CrAEDTakeCG := CrAEDTakeCG + RG23CPARTII."AED(TTA) Credit";
                    CrOTHTakeCG := CrOTHTakeCG + RG23CPARTII."NCCD Credit";
                    CreCESSTakeCG := CreCESSTakeCG + RG23CPARTII."eCess Credit";
                    CrADETTakeCG := CrADETTakeCG + RG23CPARTII."ADET Credit";
                    CrSTTakeCG := CrSTTakeCG + RG23CPARTII."Service Tax  Credit";
                    CrSTeCessTakeCG := CrSTeCessTakeCG + RG23CPARTII."Service Tax eCess Credit";
                    IF RG23CPARTII.Type = RG23CPARTII.Type::Purchase THEN BEGIN
                      CrCenvatTakeCG := CrCenvatTakeCG - RG23CPARTII."BED Debit" - RG23CPARTII."SED Debit" - RG23CPARTII."SAED Debit" -
                        RG23CPARTII."AED(GSI) Debit" - RG23CPARTII."ADE Debit";
                      CrAEDTakeCG := CrAEDTakeCG - RG23CPARTII."AED(TTA) Debit";
                      CrOTHTakeCG := CrOTHTakeCG -  RG23CPARTII."NCCD Debit";
                      CreCESSTakeCG := CreCESSTakeCG - RG23CPARTII."eCess Debit";
                      CrADETTakeCG := CrADETTakeCG - RG23CPARTII."ADET Debit";
                      CrSTTakeCG := CrSTTakeCG + RG23CPARTII."Service Tax  Debit";
                      CrSTeCessTakeCG := CrSTeCessTakeCG + RG23CPARTII."Service Tax eCess Debit";
                    END
                  UNTIL RG23CPARTII.NEXT = 0;
                
                // Credit Used - RG23CPartII
                CrCenvatUsedCG := 0.00;
                CrAEDUsedCG := 0.00;
                CrOTHUsedCG := 0.00;
                CreCESSUsedCG := 0.00;
                CrADETUsedCG := 0.00;
                RG23CPARTII.RESET;
                RG23CPARTII.SETRANGE(RG23CPARTII."Posting Date",StartingDate,EndingDate);
                RG23CPARTII.SETRANGE(Type,RG23CPARTII.Type::Sale);
                IF LocationNo <> '' THEN
                   RG23CPARTII.SETRANGE("Location E.C.C. No.",LocationNo);
                IF RG23CPARTII.FIND('-') THEN
                  REPEAT
                    CrCenvatUsedCG := CrCenvatUsedCG + RG23CPARTII."BED Debit" + RG23CPARTII."SED Debit" + RG23CPARTII."SAED Debit" +
                                      RG23CPARTII."ADE Debit" + RG23CPARTII."AED(GSI) Debit";
                    CrAEDUsedCG := CrAEDUsedCG + RG23CPARTII."AED(TTA) Debit";
                    CrOTHUsedCG := CrOTHUsedCG + RG23CPARTII."NCCD Debit";
                    CreCESSUsedCG := CreCESSUsedCG + RG23CPARTII."eCess Debit";
                    CrADETUsedCG := CrADETUsedCG + RG23CPARTII."ADET Debit";
                    CrSTUsedCG := CrSTUsedCG + RG23CPARTII."Service Tax  Debit";
                    CrSTeCessUsedCG := CrSTeCessUsedCG + RG23CPARTII."Service Tax eCess Debit";
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
                OpenCenvatIN := 0.00;
                OpenAEDIN := 0.00;
                OpenOTHIN := 0.00;
                OpeneCESSIN := 0.00;
                OpenADETIN := 0.00;
                RG23APartII.RESET;
                RG23APartII.SETRANGE(RG23APartII."Posting Date",0D,StartingDate-1);
                IF LocationNo <> '' THEN
                   RG23APartII.SETRANGE("Location E.C.C. No.",LocationNo);
                IF RG23APartII.FIND('-') THEN
                  REPEAT
                    OpenCenvatIN := OpenCenvatIN + RG23APartII."BED Credit" - RG23APartII."BED Debit" +
                      RG23APartII."SED Credit" - RG23APartII."SED Debit"  +
                       RG23APartII."SAED Credit" - RG23APartII."SAED Debit" +
                       RG23APartII."ADE Credit" - RG23APartII."ADE Debit" +
                       RG23APartII."AED(GSI) Credit" - RG23APartII."AED(GSI) Debit";
                    OpenAEDIN := OpenAEDIN + RG23APartII."AED(TTA) Credit" - RG23APartII."AED(TTA) Debit";
                    OpenOTHIN := OpenOTHIN + RG23APartII."NCCD Credit" - RG23APartII."NCCD Debit";
                    OpeneCESSIN := OpeneCESSIN + RG23APartII."eCess Credit" - RG23APartII."eCess Debit";
                    OpenADETIN := OpenADETIN + RG23APartII."ADET Credit" - RG23APartII."ADET Debit";
                    OpenSTIN := OpenSTIN + RG23APartII."Service Tax Credit" - RG23APartII."Service Tax Debit";
                    OpenSTeCessIN := OpenSTeCessIN + RG23APartII."Service Tax eCess Credit" - RG23APartII."Service Tax eCess Debit";
                  UNTIL RG23APartII.NEXT = 0;
                
                
                //Credit Availed - RG23APartII
                CrCenvatTakeIN := 0;
                CrAEDTakeIN := 0;
                CrOTHTakeIN := 0;
                CreCESSTakeIN := 0;
                CrADETTakeIN := 0;
                RG23APartII.RESET;
                RG23APartII.SETRANGE(RG23APartII."Posting Date",StartingDate,EndingDate);
                IF LocationNo <> '' THEN
                   RG23APartII.SETRANGE("Location E.C.C. No.",LocationNo);
                IF RG23APartII.FIND('-') THEN
                  REPEAT
                    CrCenvatTakeIN := CrCenvatTakeIN + RG23APartII."BED Credit" + RG23APartII."SED Credit"
                      + RG23APartII."SAED Credit" + RG23APartII."ADE Credit" + RG23APartII."AED(GSI) Credit";
                    CrAEDTakeIN := CrAEDTakeIN + RG23APartII."AED(TTA) Credit";
                    CrOTHTakeIN := CrOTHTakeIN + RG23APartII."NCCD Credit";
                    CreCESSTakeIN := CreCESSTakeIN + RG23APartII."eCess Credit";
                    CrADETTakeIN := CrADETTakeIN + RG23APartII."ADET Credit";
                    CrSTTakeIN := CrSTTakeIN + RG23APartII."Service Tax Credit";
                    CrSTeCessTakeIN := CrSTeCessTakeIN + RG23APartII."Service Tax eCess Credit";
                    IF RG23APartII.Type = RG23APartII.Type::Purchase THEN BEGIN
                      CrCenvatTakeIN := CrCenvatTakeIN - RG23APartII."BED Debit" - RG23APartII."SED Debit" - RG23APartII."SAED Debit" -
                                        RG23APartII."ADE Debit" - RG23APartII."AED(GSI) Debit";
                      CrAEDTakeIN := CrAEDTakeIN - RG23APartII."AED(TTA) Debit";
                      CrOTHTakeIN := CrOTHTakeIN -  RG23APartII."NCCD Debit";
                      CreCESSTakeIN := CreCESSTakeIN - RG23APartII."eCess Debit";
                      CrADETTakeIN := CrADETTakeIN - RG23APartII."ADET Debit";
                      CrSTTakeIN := CrSTTakeIN + RG23APartII."Service Tax Debit";
                      CrSTeCessTakeIN := CrSTeCessTakeIN + RG23APartII."Service Tax eCess Debit";
                    END
                  UNTIL RG23APartII.NEXT = 0;
                
                
                //Credit Used - RG23APartII
                
                CrCenvatUsedIN := 0;
                CrAEDUsedIN := 0;
                CrOTHUsedIN := 0;
                CreCESSUsedIN := 0;
                CrADETUsedIN := 0;
                RG23APartII.RESET;
                RG23APartII.SETRANGE(RG23APartII."Posting Date",StartingDate,EndingDate);
                IF LocationNo <> '' THEN
                   RG23APartII.SETRANGE("Location E.C.C. No.",LocationNo);
                RG23APartII.SETRANGE(Type,RG23APartII.Type::Sale);
                IF RG23APartII.FIND('-') THEN
                  REPEAT
                    CrCenvatUsedIN := CrCenvatUsedIN + RG23APartII."BED Debit" + RG23APartII."SED Debit"
                      + RG23APartII."SAED Debit" + RG23APartII."AED(GSI) Debit" + RG23APartII."ADE Debit";
                    CrAEDUsedIN := CrAEDUsedIN + RG23APartII."AED(TTA) Debit";
                    CrOTHUsedIN := CrOTHUsedIN + RG23APartII."NCCD Debit";
                    CreCESSUsedIN := CreCESSUsedIN + RG23APartII."eCess Debit";
                    CrADETUsedIN := CrADETUsedIN + RG23APartII."ADET Debit";
                    CrSTUsedIN := CrSTUsedIN + RG23APartII."Service Tax Debit";
                    CrSTeCessUsedIN := CrSTeCessUsedIN + RG23APartII."Service Tax eCess Debit";
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
                PLARec.SETRANGE("Posting Date",StartingDate,EndingDate);
                IF LocationNo <> '' THEN
                   PLARec.SETRANGE("Location E.C.C. No.",LocationNo);
                IF PLARec.FIND('-') THEN
                  REPEAT
                    PLAAmount := PLAAmount + PLARec."BED Credit" + PLARec."AED(GSI) Credit" + PLARec."SED Credit" +
                               PLARec."SAED Credit" + PLARec."CESS Credit" + PLARec."NCCD Credit" +
                               PLARec."eCess Credit" +PLARec."Excise Charges Credit" + PLARec."ADE Credit" + PLARec."ADET Credit" +
                               PLARec."AED(TTA) Credit";
                  UNTIL PLARec.NEXT = 0;
                
                
                // Update Invoice Numbers
                ExciseEntry.SETRANGE("Posting Date",StartingDate,EndingDate);
                ExciseEntry.SETRANGE("Document Type",ExciseEntry."Document Type"::Invoice);
                ExciseEntry.SETRANGE("E.C.C. No.",LocationNo);
                ExciseEntry.SETRANGE(Type,ExciseEntry.Type::Sale);
                IF ExciseEntry.FIND('-') THEN
                  SlNo1 := ExciseEntry."Document No.";
                IF ExciseEntry.FIND('+') THEN
                  SlNo2 := ExciseEntry."Document No.";
                
                //VISU
                {
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
                }
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
          StartDt := DMY2DATE(1,ReturnMonth +1,ReturnYear);
          IF ReturnMonth = 11 THEN
            EndDt := DMY2DATE(31,ReturnMonth + 1,ReturnYear)
          ELSE
            EndDt := CALCDATE('-1D',DMY2DATE(1,ReturnMonth + 2,ReturnYear));
        END
    end;

    var
        RG23APartII : Record "RG 23 A Part II";
        RG23CPARTII : Record "RG 23 C Part II";
        PLARec : Record "PLA Entry";
        ExciseEntry : Record "Excise Entry";
        Location : Record Location;
        ReturnMonth : Option January,February,March,April,May,June,July,August,September,October,November,December;
        ReturnYear : Integer;
        StartingDate : Date;
        EndingDate : Date;
        ReportType : Option Original,Duplicate,Triplicate;
        CENVATAmount : Decimal;
        SEDAmount : Decimal;
        AEDAmount : Decimal;
        SAEDAmount : Decimal;
        CESSAmount : Decimal;
        NCCDAmount : Decimal;
        Notification : Option Yes,No;
        OpenSEDIN : Decimal;
        CrSEDTakeIN : Decimal;
        CrSEDUsedIN : Decimal;
        CloseSEDIN : Decimal;
        OpenAEDIN : Decimal;
        CrAEDTakeIN : Decimal;
        CrAEDUsedIN : Decimal;
        CloseAEDIN : Decimal;
        OpenADDIN : Decimal;
        CrADDTakeIN : Decimal;
        CrADDUsedIN : Decimal;
        CloseADDIN : Decimal;
        OpenOTHIN : Decimal;
        CrOTHTakeIN : Decimal;
        CrOTHUsedIN : Decimal;
        CloseOTHIN : Decimal;
        OpenCenvatIN : Decimal;
        CrCenvatTakeIN : Decimal;
        CrCenvatUsedIN : Decimal;
        CloseCenvatIN : Decimal;
        OpenCenvatCG : Decimal;
        CrCenvatTakeCG : Decimal;
        CrCenvatUsedCG : Decimal;
        CloseCenvatCG : Decimal;
        OpenSEDCG : Decimal;
        CrSEDTakeCG : Decimal;
        CrSEDUsedCG : Decimal;
        CloseSEDCG : Decimal;
        OpenAEDCG : Decimal;
        CrAEDTakeCG : Decimal;
        CrAEDUsedCG : Decimal;
        CloseAEDCG : Decimal;
        OpenADDCG : Decimal;
        CrADDTakeCG : Decimal;
        CrADDUsedCG : Decimal;
        CloseADDCG : Decimal;
        OpenOTHCG : Decimal;
        CrOTHTakeCG : Decimal;
        CrOTHUsedCG : Decimal;
        CloseOTHCG : Decimal;
        Text001 : Label 'Please enter the year for generating the report';
        Month : Integer;
        PLAAmount : Decimal;
        SlNo1 : Code[20];
        SlNo2 : Code[20];
        LocationNo : Code[20];
        RegistrationNo : Code[20];
        OpeneCESSCG : Decimal;
        CreCESSTakeCG : Decimal;
        CreCESSUsedCG : Decimal;
        CloseeCESSCG : Decimal;
        OpeneCESSIN : Decimal;
        CreCESSTakeIN : Decimal;
        CreCESSUsedIN : Decimal;
        CloseeCESSIN : Decimal;
        eCESSAmount : Decimal;
        "--VISU--" : Integer;
        STOpening : Decimal;
        STCredit : Decimal;
        STClosing : Decimal;
        STeCessOpening : Decimal;
        STeCessCredit : Decimal;
        STeCessClosing : Decimal;
        "--GS" : Integer;
        AEDTTAAmount : Decimal;
        ADEAmount : Decimal;
        ADETAmount : Decimal;
        OpenADETCG : Decimal;
        CrADETTakeCG : Decimal;
        CrADETUsedCG : Decimal;
        CloseADETCG : Decimal;
        OpenADETIN : Decimal;
        CrADETTakeIN : Decimal;
        CrADETUsedIN : Decimal;
        CloseADETIN : Decimal;
        OpenSTCG : Decimal;
        OpenSTeCessCG : Decimal;
        CrSTTakeCG : Decimal;
        CrSTeCessTakeCG : Decimal;
        CrSTUsedCG : Decimal;
        CrSTeCessUsedCG : Decimal;
        CloseSTCG : Decimal;
        CloseSTeCessCG : Decimal;
        OpenSTIN : Decimal;
        OpenSTeCessIN : Decimal;
        CrSTTakeIN : Decimal;
        CrSTeCessTakeIN : Decimal;
        CrSTUsedIN : Decimal;
        CrSTeCessUsedIN : Decimal;
        CloseSTIN : Decimal;
        CloseSTeCessIN : Decimal;
        SIL : Record "Sales Invoice Line";
        QtyManfactured1 : Decimal;
        QtyManfactured2 : Decimal;
        QtyManfactured3 : Decimal;
        QtyManfactured4 : Decimal;
        QtyManfactured5 : Decimal;
        QtyManfactured6 : Decimal;
        Assessable1 : Decimal;
        Assessable2 : Decimal;
        Excise1 : Decimal;
        excise2 : Decimal;
        Ecess1 : Decimal;
        Ecess2 : Decimal;
        SHEcess1 : Decimal;
        SHEcess2 : Decimal;
        Dummycess1 : Decimal;
        Dummycess2 : Decimal;
        Excise : Decimal;
        cess : Decimal;
        tempexcise : Decimal;
        tempcess : Decimal;
        VendType : Option;
        VendorType : Text[30];
        Desc : Text[50];
        Subheading : Code[10];
        Qty : Decimal;
        MaxValue : Decimal;
        Itm : Record Item;
        ItmNo : Code[10];
        dummy : Integer;
        FixAsset : Record "Fixed Asset";
        "ecc no" : Code[10];
        invoiceno : Code[10];
        Dummyrg23 : Record "RG 23 A Part II";
        dummybed : Decimal;
        previousno : Text[30];
        dummycess : Decimal;
        i : Integer;
        STD : Record "Posted Str Order Line Details";
        Addduty : Decimal;
        cess2 : Decimal;
        cess1 : Decimal;
        StartDt : Date;
        EndDt : Date;
        VendorNo : Code[20];
        OrdNo : Code[20];
        Amt : Decimal;
        PurchInvL : Record "Purch. Inv. Line";
        Vend : Record Vendor;
        VendorName : Text[30];
        j : Integer;
        InvStNo : Code[10];
        InvEndNo : Code[10];
        AccountCenvat : Decimal;
        AccountCess : Decimal;
        totpaidamt : Decimal;
        ChallanNo : Text[50];
        d1 : Integer;
        d2 : Integer;
        m1 : Integer;
        m2 : Integer;
        y1 : Integer;
        y2 : Integer;
        DummyVat : Decimal;
        PIL : Record "Purch. Inv. Line";
        "Assessable4%" : Decimal;
        "Assessable12.5%" : Decimal;
        "Assessable14.5%" : Decimal;
        VatAmt4 : Decimal;
        Vatamt12 : Decimal;
        totalamt : Decimal;
        "Assessable1%" : Decimal;
        VatAmt1 : Decimal;
        Inputtaxcredited : Decimal;
        "vat4%" : Decimal;
        CST1 : Decimal;
        totalbilled : Decimal;
        totalvatbilled : Decimal;
        "vat12.5%" : Decimal;
        "vat14.5%" : Decimal;
        Assessable3 : Decimal;
        Assessable4 : Decimal;
        excise3 : Decimal;
        Dummycess3 : Decimal;
        Dummycess4 : Decimal;
        Ecess3 : Decimal;
        Ecess4 : Decimal;
        SHEcess3 : Decimal;
        SHEcess4 : Decimal;
        TurnoverCST : Decimal;
        temp : Decimal;
        GL : Record "G/L Entry";
        GLvatper : Decimal;
        GLtot : Decimal;
        GLVATAmt : Decimal;
        VLE : Record "Vendor Ledger Entry";
        VName : Text[30];
        VNo : Text[10];
        Vendor : Record Vendor;
        jvvat4 : Boolean;
        fromdate : Date;
        todate : Date;
        jvvat12 : Boolean;
        TempExcelbuffer : Record "Excel Buffer";
        Row : Integer;
        Excel : Boolean;
        Adjustvat : Decimal;
        adjustdetails : Text[250];
        totadjustcst : Decimal;
        excise4 : Decimal;
        vatamt14 : Decimal;
        "24variable" : Decimal;
        "24bvariable" : Decimal;
        MONTHLY_RETURN_FOR_VALUE_ADDED_TAXCaptionLbl : Label 'MONTHLY RETURN FOR VALUE ADDED TAX';
        Please_read_notes_before_completing_this_formCaptionLbl : Label 'Please read notes before completing this form';
        FORM_VAT_200CaptionLbl : Label 'FORM VAT 200';
        V01________________________TINCaptionLbl : Label '01                        TIN';
        V02__________________Period_covered_by_this_ReturnCaptionLbl : Label '02                  Period covered by this Return';
        FROMCaptionLbl : Label 'FROM';
        V6CaptionLbl : Label '6';
        V4CaptionLbl : Label '4';
        V6Caption_Control1102154028Lbl : Label '6';
        V7CaptionLbl : Label '7';
        V1CaptionLbl : Label '1';
        V6Caption_Control1102154031Lbl : Label '6';
        V5CaptionLbl : Label '5';
        V0CaptionLbl : Label '0';
        V8CaptionLbl : TextConst CAT='',ENU='8';
        V3CaptionLbl : Label '3';
        V2CaptionLbl : Label '2';
        TOCaptionLbl : Label 'TO';
        DDCaptionLbl : Label 'DD';
        MMCaptionLbl : Label 'MM';
        YYYYCaptionLbl : Label 'YYYY';
        DDCaption_Control1102154043Lbl : Label 'DD';
        MMCaption_Control1102154044Lbl : Label 'MM';
        YYYYCaption_Control1102154045Lbl : Label 'YYYY';
        V03_Name_of_Enterprises_CaptionLbl : Label '03 Name of Enterprises:';
        Address__CaptionLbl : Label 'Address :';
        Fax_No_CaptionLbl : Label 'Fax No:';
        Phone_No_CaptionLbl : Label 'Phone No:';
        If_you_have_made_no_purchases_and_no_sales__cross_this_box_CaptionLbl : Label 'If you have made no purchases and no sales, cross this box.';
        If_you_have_no_entry_for_a_box__insert__NIL___Do_not_leave_any_box_blank_unless_you_cross_box_04_CaptionLbl : Label 'If you have no entry for a box, insert "NIL". Do not leave any box blank unless you cross box 04.';
        Input_tax_credit_from_previous_month_CaptionLbl : Label '"Input tax credit from previous month "';
        V4Caption_Control1102154014Lbl : Label '4';
        V5Caption_Control1102154015Lbl : Label '5';
        Box_24_or_24__b__of_your_previous_tax_return_CaptionLbl : Label '(Box 24 or 24 (b) of your previous tax return)';
        PURCHASES_IN_THE_MONTH_CaptionLbl : Label '"PURCHASES IN THE MONTH "';
        Value_excluding_VATCaptionLbl : Label 'Value excluding VAT';
        VAT_ClaimedCaptionLbl : Label 'VAT Claimed';
        INPUT_CaptionLbl : Label '"                   (INPUT)"';
        A_CaptionLbl : Label '(A)';
        B_CaptionLbl : Label '(B)';
        Exempt_or_non_creditable_PurchasesCaptionLbl : Label 'Exempt or non-creditable Purchases';
        V4__Rate_PurchasesCaptionLbl : Label '4% Rate Purchases';
        V12_5__Rate_PurchasesCaptionLbl : Label '12.5% Rate Purchases';
        V1__Rate_PurchasesCaptionLbl : Label '1% Rate Purchases';
        Special_Rate_PurchasesCaptionLbl : Label 'Special Rate Purchases';
        Total_Amount_of_input_tax__5_7_B__8_B__9_B_CaptionLbl : Label 'Total Amount of input tax (5+7(B)+8(B)+9(B)';
        V6Caption_Control1102154047Lbl : Label '6';
        V7Caption_Control1102154067Lbl : Label '7';
        V8Caption_Control1102154068Lbl : Label '8';
        V9CaptionLbl : Label '9';
        V11CaptionLbl : Label '11';
        V12CaptionLbl : Label '12';
        V12Caption_Control1102154054Lbl : Label '12';
        V13CaptionLbl : Label '13';
        V14CaptionLbl : Label '14';
        V15CaptionLbl : Label '15';
        V16CaptionLbl : Label '16';
        V17CaptionLbl : Label '17';
        SALES_IN_THE_MONTH_CaptionLbl : Label '"SALES IN THE MONTH "';
        INPUT_Caption_Control1102154086Lbl : Label '"                   (INPUT)"';
        Exempt_SalesCaptionLbl : Label 'Exempt Sales';
        Zero_Rate_Sales_International_ExportsCaptionLbl : Label 'Zero Rate Sales-International Exports';
        Zero_Rate_Sales_Others__CST_Sales_CaptionLbl : Label 'Zero Rate Sales-Others (CST Sales)';
        Tax_Due_on_Purchase_of_goodsCaptionLbl : Label 'Tax Due on Purchase of goods';
        V4__Rate_SalesCaptionLbl : Label '4% Rate Sales';
        V12_5__Rate_SalesCaptionLbl : Label '12.5% Rate Sales';
        Value_excluding_VATCaption_Control1102154093Lbl : Label 'Value excluding VAT';
        A_Caption_Control1102154094Lbl : Label '(A)';
        VAT_DueCaptionLbl : Label 'VAT Due';
        B_Caption_Control1102154102Lbl : Label '(B)';
        V18CaptionLbl : Label '18';
        Special_Rate_SalesCaptionLbl : Label 'Special Rate Sales';
        V19CaptionLbl : Label '19';
        V1__Rate_SalesCaptionLbl : Label '1% Rate Sales';
        V20CaptionLbl : Label '20';
        Total_Amount_of_output_tax__15_B__16_B__17_B__19_B_CaptionLbl : Label 'Total Amount of output tax (15(B)+16(B)+17(B)+19(B)';
        If_total_of_box_20_exceeds_box_11_pay_this_amountCaptionLbl : Label 'If total of box 20 exceeds box 11 pay this amount';
        V21CaptionLbl : Label '21';
        NILCaptionLbl : Label 'NIL';
        NILCaption_Control1102154098Lbl : Label 'NIL';
        NILCaption_Control1102154111Lbl : Label 'NIL';
        NILCaption_Control1102154115Lbl : Label 'NIL';
        NILCaption_Control1102154119Lbl : Label 'NIL';
        NILCaption_Control1102154123Lbl : Label 'NIL';
        NILCaption_Control1102154129Lbl : Label 'NIL';
        NILCaption_Control1102154130Lbl : Label 'NIL';
        NILCaption_Control1102154077Lbl : Label 'NIL';
        V10CaptionLbl : Label '10';
        V14_5__Rate_PurchasesCaptionLbl : Label '14.5% Rate Purchases';
        V18Caption_Control1102154143Lbl : Label '18';
        V14_5__Rate_SalesCaptionLbl : Label '14.5% Rate Sales';
        V22CaptionLbl : Label '22';
        Payment___Adjustment_Details_CaptionLbl : Label 'Payment / Adjustment Details:';
        DetailsCaptionLbl : Label 'Details';
        Challan___Instrument_No_CaptionLbl : Label 'Challan / Instrument No.';
        DateCaptionLbl : Label 'Date';
        Blank___TreasuryCaptionLbl : Label 'Blank / Treasury';
        Payment_DetailsCaptionLbl : Label 'Payment Details';
        Adjustment__Give_Details_in_22_a__CaptionLbl : Label 'Adjustment (Give Details in 22(a))';
        Branch_CodeCaptionLbl : Label 'Branch Code';
        AmountCaptionLbl : Label 'Amount';
        TotalCaptionLbl : Label 'Total';
        Nature_AdjustmentCaptionLbl : Label 'Nature Adjustment';
        V22_a____Adjustment_Details_CaptionLbl : Label '22(a).  Adjustment Details:';
        DetailsCaption_Control1102154197Lbl : Label 'Details';
        AmountCaption_Control1102154198Lbl : Label 'Amount';
        IfLbl : Label 'If total of box 11 exceeds total of box 20 (or the payment and adjustment in boxes 22 and 22(a) put together exceed the tax due in box 21) and you have declared exports in box 13(A) and not adjusting the excess amount against tax liability if any under the CST Act, you can claim a refund in box 23 or carry a credit forward in box 24.';
        If_you_have_declared_no_exports_in_box_13_A__you_must_carry_the_credit_forward_in_box_24_unless_you_have_carried_forward_a_taLbl : Label 'If you have declared no exports in box 13(A) you must carry the credit forward in box 24,unless you have carried forward a tax credit and not adjusting the excess amount against the tax liability if any under the CST Act.';
        Refund_23CaptionLbl : Label 'Refund 23';
        Rs__NILCaptionLbl : Label 'Rs. NIL';
        Credit_carried_forwardCaptionLbl : Label 'Credit carried forward';
        V24CaptionLbl : Label '24';
        If_you_want_to_adjust_the_excess_amount_against_the_liability_under_the_CST_Act_please_fill_in_boxes_24_a__and_24_b__Tax_due_Lbl : Label 'If you want to adjust the excess amount against the liability under the CST Act please fill in boxes 24(a) and 24(b) Tax due under the CST Act and adjusted against the excess amount in box 24.';
        V24_a_CaptionLbl : Label '24(a)';
        V24_a_Caption_Control1102154216Lbl : Label '24(a)';
        V24_b_CaptionLbl : Label '24(b)';
        Net_credit_carried_forwardCaptionLbl : Label '" Net credit carried forward"';
        V24_b_Caption_Control1102154220Lbl : Label '24(b)';
        Declaration__CaptionLbl : Label 'Declaration :';
        V25_CaptionLbl : Label '25.';
        Name_M_V_MURALI_KRISHNA__being__title__DIRECTOR___of_the_above_enterprise_do_hereby_declare_that_the_information_given_in_thiLbl : Label 'Name M.V.MURALI KRISHNA  being (title) DIRECTOR   of the above enterprise do hereby declare that the information given in this return is true and correct';
        Signature___Stamp___________________Date_of_declaration_CaptionLbl : Label '"Signature & Stamp …………………...        Date of declaration "';
        VATCaptionLbl : Label 'VAT';
}

