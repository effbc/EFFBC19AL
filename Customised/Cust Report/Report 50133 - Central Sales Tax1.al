report 50133 "Central Sales Tax1"
{
    // version NAVIN3.70

    DefaultLayout = RDLC;
    RDLCLayout = './Central Sales Tax1.rdlc';

    dataset
    {
        dataitem("Company Information";"Company Information")
        {
            DataItemTableView = SORTING(Primary Key) ORDER(Ascending);
            column(Company_Information_Name;Name)
            {
            }
            column(Company_Information_Address;Address)
            {
            }
            column(Company_Information__C_S_T_No__;"C.S.T No.")
            {
            }
            column(STRSUBSTNO_Text002__Address_2__City_StateDesc_;STRSUBSTNO(Text002,"Address 2",City,StateDesc))
            {
            }
            column(StartDate;StartDate)
            {
            }
            column(Return;Return)
            {
            }
            column(EndDate;EndDate)
            {
            }
            column(TODAY__;TODAY())
            {
            }
            column(Name_of_the_Registered_DealerCaption;Name_of_the_Registered_DealerCaptionLbl)
            {
            }
            column(Company_Information_AddressCaption;FIELDCAPTION(Address))
            {
            }
            column(Registration_No_Caption;Registration_No_CaptionLbl)
            {
            }
            column(Form___C_S_T____VICaption;Form___C_S_T____VICaptionLbl)
            {
            }
            column(Form_of_Return_under_Rule_14_A_of_the_Central_Sales_Tax_Rules__1957__Andhra_Pradesh_Caption;Form_of_Return_under_Rule_14_A_of_the_Central_Sales_Tax_Rules__1957__Andhra_Pradesh_CaptionLbl)
            {
            }
            column(Starting_DateCaption;Starting_DateCaptionLbl)
            {
            }
            column(Ending_DateCaption;Ending_DateCaptionLbl)
            {
            }
            column(DateCaption;DateCaptionLbl)
            {
            }
            column(Status_Caption;Status_CaptionLbl)
            {
            }
            column(Style_of_Business_Caption;Style_of_Business_CaptionLbl)
            {
            }
            column(CompanyCaption;CompanyCaptionLbl)
            {
            }
            column(Manufacturing_of_Data_Loggers___Electronic_Moving_Display_BoardCaption;Manufacturing_of_Data_Loggers___Electronic_Moving_Display_BoardCaptionLbl)
            {
            }
            column(Company_Information_Primary_Key;"Primary Key")
            {
            }

            trigger OnPreDataItem();
            begin
                IF ReturnYear = 0 THEN
                BEGIN
                  MESSAGE('Please enter a Valid Year');
                  CurrReport.QUIT;
                END
            end;
        }
        dataitem("Sales Invoice Header";"Sales Invoice Header")
        {
            DataItemTableView = SORTING(Posting Date);
            dataitem("Sales Invoice Line";"Sales Invoice Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = SORTING(Document No.,Line No.) ORDER(Ascending);

                trigger OnPostDataItem();
                begin
                    CurrReport.CREATETOTALS(Amount);
                end;
            }
            dataitem("Cust. Ledger Entry";"Cust. Ledger Entry")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = SORTING(Customer No.,Posting Date,Currency Code) ORDER(Ascending);
            }

            trigger OnPreDataItem();
            begin
                RESET;
                SETRANGE("Posting Date",StartDate,EndDate);
                /*IF FIND('-') THEN
                  FromDocNo := "No.";
                IF FIND('+') THEN
                  ToDocNo := "No.";
                */

            end;
        }
        dataitem("Sales Cr.Memo Header";"Sales Cr.Memo Header")
        {
            DataItemTableView = SORTING(No.) ORDER(Ascending);
            dataitem("Sales Cr.Memo Line";"Sales Cr.Memo Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = SORTING(Document No.,Line No.) ORDER(Ascending);
            }

            trigger OnPreDataItem();
            begin
                SETRANGE("Posting Date",StartDate,EndDate);
            end;
        }
        dataitem("Transfer Shipment Header";"Transfer Shipment Header")
        {
            DataItemTableView = SORTING(No.) ORDER(Ascending);
            dataitem("Transfer Shipment Line";"Transfer Shipment Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = SORTING(Document No.,Line No.) ORDER(Ascending);
            }

            trigger OnPreDataItem();
            begin
                SETRANGE("Posting Date",StartDate,EndDate);
            end;
        }
        dataitem("Integer";"Integer")
        {
            DataItemTableView = SORTING(Number) ORDER(Ascending);
            MaxIteration = 1;
            column(ROUND_TaxAmountTot_1_;ROUND(TaxAmountTot,1))
            {
            }
            column(Freight;Freight)
            {
            }
            column(ROUND__GTO___LocalTO__1_;ROUND((GTO - LocalTO),1))
            {
            }
            column(ROUND_LocalTO_1_;ROUND(LocalTO,1))
            {
            }
            column(ROUND_GTO_1_;ROUND(GTO,1))
            {
            }
            column(GoodsReturned;GoodsReturned)
            {
            }
            column(CashDiscAmt;CashDiscAmt)
            {
            }
            column(JobWrksAmt;JobWrksAmt)
            {
            }
            column(CentralTOLessAmt;ROUND((Freight + GoodsReturned +(TaxAmountTot) + CashDiscAmt + JobWrksAmt),1))
            {
            }
            column(ROUND__GTO_LocalTO___Freight___GoodsReturned____TaxAmountTot_____CashDiscAmt___JobWrksAmt___1_;ROUND((GTO-LocalTO- (Freight + GoodsReturned + (TaxAmountTot ) + CashDiscAmt + JobWrksAmt)),1))
            {
            }
            column(DataItem1280019;ROUND((GTO-LocalTO-TaxAmountTot- (Freight + GoodsReturned + TaxAmount + CashDiscAmt + JobWrksAmt) - (ExportsAmt + HighSeaSalesAmt + HFormAmt + TransferAmt + EIEIIFormAmt + SalesTaxExemptAmt + SalesProvisoAmt + SalesOutAmt)),1))
            {
            }
            column(STRSUBSTNO_Text003_StateDesc_;STRSUBSTNO(Text003,StateDesc))
            {
            }
            column(V7_Caption;V7_CaptionLbl)
            {
            }
            column(Goods_wise_break_up_of_6Caption;Goods_wise_break_up_of_6CaptionLbl)
            {
            }
            column(V6_Caption;V6_CaptionLbl)
            {
            }
            column(Balance_Total_Taxable_Turnover_of_Interstate_Sales_5_Caption;Balance_Total_Taxable_Turnover_of_Interstate_Sales_5_CaptionLbl)
            {
            }
            column(V5_Caption;V5_CaptionLbl)
            {
            }
            column(Net_Turnover_Central__3_4_Caption;Net_Turnover_Central__3_4_CaptionLbl)
            {
            }
            column(Total_of_4_A___B___C___D___E_Caption;Total_of_4_A___B___C___D___E_CaptionLbl)
            {
            }
            column(E_Caption;E_CaptionLbl)
            {
            }
            column(Job_work___Work_contracts_not_accounting_to_sales_but_included_in_the_Central_TurnoverCaption;Job_work___Work_contracts_not_accounting_to_sales_but_included_in_the_Central_TurnoverCaptionLbl)
            {
            }
            column(D_Caption;D_CaptionLbl)
            {
            }
            column(Cash_Discount_allowed_according_to_ordinary_trade_practices_and_included_in_Central_TurnoverCaption;Cash_Discount_allowed_according_to_ordinary_trade_practices_and_included_in_Central_TurnoverCaptionLbl)
            {
            }
            column(C_Caption;C_CaptionLbl)
            {
            }
            column(Tax_collected_included_in_the_Central_TurnoverCaption;Tax_collected_included_in_the_Central_TurnoverCaptionLbl)
            {
            }
            column(Value_of_goods_returned_under_CST_ActCaption;Value_of_goods_returned_under_CST_ActCaptionLbl)
            {
            }
            column(B_Caption;B_CaptionLbl)
            {
            }
            column(Cost_of_freight_deliveries_freight_or_installation_separately_charged_but_included_in_the_TurnoverCaption;Cost_of_freight_deliveries_freight_or_installation_separately_charged_but_included_in_the_TurnoverCaptionLbl)
            {
            }
            column(A_Caption;A_CaptionLbl)
            {
            }
            column(V4_Caption;V4_CaptionLbl)
            {
            }
            column(Less__in_respect_of_Central_Turnover_only_Caption;Less__in_respect_of_Central_Turnover_only_CaptionLbl)
            {
            }
            column(V3_Caption;V3_CaptionLbl)
            {
            }
            column(Turnover__Central___1_2_Caption;Turnover__Central___1_2_CaptionLbl)
            {
            }
            column(V2_Caption;V2_CaptionLbl)
            {
            }
            column(Gross_Turnover__GTO___Inclusive_of_Jobworks__work_contracts__Branch_Transfer_etc__Caption;Gross_Turnover__GTO___Inclusive_of_Jobworks__work_contracts__Branch_Transfer_etc__CaptionLbl)
            {
            }
            column(V1_Caption;V1_CaptionLbl)
            {
            }
            column(Nature_of_GoodsCaption;Nature_of_GoodsCaptionLbl)
            {
            }
            column(Commodity_codeCaption;Commodity_codeCaptionLbl)
            {
            }
            column(Rate_of_TaxCaption;Rate_of_TaxCaptionLbl)
            {
            }
            column(Sales_relating_to_Reg_Dealers_on_prescribed_Declaration_in_Form___CCaption;Sales_relating_to_Reg_Dealers_on_prescribed_Declaration_in_Form___CCaptionLbl)
            {
            }
            column(Sales_to_Govt__not_being_a_Regd__Dealer_on_prescrined_certificate_in_Form_DCaption;Sales_to_Govt__not_being_a_Regd__Dealer_on_prescrined_certificate_in_Form_DCaptionLbl)
            {
            }
            column(Other_salesCaption;Other_salesCaptionLbl)
            {
            }
            column(Total_SalesCaption;Total_SalesCaptionLbl)
            {
            }
            column(Tax_dueCaption;Tax_dueCaptionLbl)
            {
            }
            column(V1Caption;V1CaptionLbl)
            {
            }
            column(V2Caption;V2CaptionLbl)
            {
            }
            column(V3Caption;V3CaptionLbl)
            {
            }
            column(V4Caption;V4CaptionLbl)
            {
            }
            column(V5Caption;V5CaptionLbl)
            {
            }
            column(V6Caption;V6CaptionLbl)
            {
            }
            column(V7Caption;V7CaptionLbl)
            {
            }
            column(V8Caption;V8CaptionLbl)
            {
            }
            column(Integer_Number;Number)
            {
            }
        }
        dataitem("<Sales Invoice Line2>";"Sales Invoice Line")
        {
            DataItemTableView = SORTING(Tax %) ORDER(Ascending) WHERE(Tax Liable=CONST(Yes),Tax %=FILTER(<>0));
            column(FORMAT__Tax________;FORMAT("Tax %")+'%')
            {
            }
            column(ROUND___Amount_To_Customer___Tax_Amount___1_;ROUND(("Amount To Customer"-"Tax Amount"),1))
            {
            }
            column(ROUND__Tax_Amount__1_;ROUND("Tax Amount",1))
            {
            }
            column(ROUND___Amount_To_Customer___Tax_Amount___1__Control1102154024;ROUND(("Amount To Customer"-"Tax Amount"),1))
            {
            }
            column(EmptyStringCaption;EmptyStringCaptionLbl)
            {
            }
            column(EmptyStringCaption_Control1102154026;EmptyStringCaption_Control1102154026Lbl)
            {
            }
            column(Sales_Invoice_Line2__Document_No_;"Document No.")
            {
            }
            column(Sales_Invoice_Line2__Line_No_;"Line No.")
            {
            }
            column(Sales_Invoice_Line2__Tax__;"Tax %")
            {
            }

            trigger OnPreDataItem();
            begin
                //SETRANGE("Document No.",FromDocNo, ToDocNo);
                SETRANGE("Document Date",StartDate,EndDate);
            end;
        }
        dataitem("<Integer1>";"Integer")
        {
            DataItemTableView = SORTING(Number);
            MaxIteration = 1;
            column(V8_Caption;V8_CaptionLbl)
            {
            }
            column(Calculation_of_Tax_for_the_Quarter_MonthCaption;Calculation_of_Tax_for_the_Quarter_MonthCaptionLbl)
            {
            }
            column(Sales_TaxCaption;Sales_TaxCaptionLbl)
            {
            }
            column(Classification_CodeCaption;Classification_CodeCaptionLbl)
            {
            }
            column(TurnoverCaption;TurnoverCaptionLbl)
            {
            }
            column(Tax_PayableCaption;Tax_PayableCaptionLbl)
            {
            }
            column(Integer1__Number;Number)
            {
            }
        }
        dataitem("<Sales Invoice Line1>";"Sales Invoice Line")
        {
            DataItemTableView = SORTING(Tax %) ORDER(Ascending) WHERE(Tax Liable=CONST(Yes),Tax %=FILTER(<>0));
            column(ROUND___Amount_To_Customer___Tax_Amount___1__Control1280033;ROUND(("Amount To Customer"-"Tax Amount"),1))
            {
            }
            column(ROUND___Tax_Amount___1_;ROUND(("Tax Amount"),1))
            {
            }
            column(Sales_Invoice_Line1___Tax___;"Tax %")
            {
            }
            column(ROUND___Amount_To_Customer___Tax_Amount___1__Control1280041;ROUND(("Amount To Customer"-"Tax Amount"),1))
            {
            }
            column(ROUND__Tax_Amount__1__Control1280042;ROUND("Tax Amount",1))
            {
            }
            column(ITaxcredit;ITaxcredit)
            {
            }
            column(ROUND__TaxAmountTot_ITaxcredit__1_;ROUND((TaxAmountTot-ITaxcredit),1))
            {
            }
            column(challno;challno)
            {
            }
            column(TODAY___Control1102154065;TODAY())
            {
            }
            column(TODAY___Control1102154093;TODAY())
            {
            }
            column(Taxable__Caption;Taxable__CaptionLbl)
            {
            }
            column(On_which_tax_amount_toCaption;On_which_tax_amount_toCaptionLbl)
            {
            }
            column(Total_Tax_payable_on_Rs_Caption;Total_Tax_payable_on_Rs_CaptionLbl)
            {
            }
            column(V9bCaption;V9bCaptionLbl)
            {
            }
            column(V9aCaption;V9aCaptionLbl)
            {
            }
            column(Less___Input_Credit_Tax______________________________________________Rs_Caption;Less___Input_Credit_Tax______________________________________________Rs_CaptionLbl)
            {
            }
            column(Total_Taxable_AmountCaption;Total_Taxable_AmountCaptionLbl)
            {
            }
            column(Tax_paid_if_any_by_means_of_Treasury_Challan__Cheque_No_Caption;Tax_paid_if_any_by_means_of_Treasury_Challan__Cheque_No_CaptionLbl)
            {
            }
            column(M_O__No__Caption;M_O__No__CaptionLbl)
            {
            }
            column(Balance_DueCaption;Balance_DueCaptionLbl)
            {
            }
            column(on_excess_paid_if_anyCaption;on_excess_paid_if_anyCaptionLbl)
            {
            }
            column(I_shall_submit_the_Declarations_and_Certificates_still_due_before_the_time_prescribed_thereof_Caption;I_shall_submit_the_Declarations_and_Certificates_still_due_before_the_time_prescribed_thereof_CaptionLbl)
            {
            }
            column(DataItem1102154068;V2___I_declare_that_to_the_best_of_my_knowledge_and_belief_the_Information_furnished_in_the_above_statement_is_true_and_complLbl)
            {
            }
            column(Dt_Caption;Dt_CaptionLbl)
            {
            }
            column(Sales_Invoice_Line1__Document_No_;"Document No.")
            {
            }
            column(Sales_Invoice_Line1__Line_No_;"Line No.")
            {
            }

            trigger OnPreDataItem();
            begin
                //SETRANGE("Document No.",FromDocNo, ToDocNo);
                SETRANGE("Document Date",StartDate,EndDate);
            end;
        }
        dataitem("<Integer2>";"Integer")
        {
            DataItemTableView = SORTING(Number);
            MaxIteration = 1;
            column(TODAY___Control1102154091;TODAY())
            {
            }
            column(PlaceCaption;PlaceCaptionLbl)
            {
            }
            column(Name_of_the_personCaption;Name_of_the_personCaptionLbl)
            {
            }
            column(DateCaption_Control1280155;DateCaption_Control1280155Lbl)
            {
            }
            column(Designation_StatusCaption;Designation_StatusCaptionLbl)
            {
            }
            column(ACKNOWLEDGEMENTCaption;ACKNOWLEDGEMENTCaptionLbl)
            {
            }
            column(Received_from____________________________________________________________________________Caption;Received_from____________________________________________________________________________CaptionLbl)
            {
            }
            column(Dealer_possessing_Registration_Certificate_No___________________________________________________Caption;Dealer_possessing_Registration_Certificate_No___________________________________________________CaptionLbl)
            {
            }
            column(Return_of_Sales_Tax_in_Form_C_S_T__VI_payable_by_him_for_the_period_from_with________________________Caption;Return_of_Sales_Tax_in_Form_C_S_T__VI_payable_by_him_for_the_period_from_with________________________CaptionLbl)
            {
            }
            column(with_enclosers_mentionded_therein_Caption;with_enclosers_mentionded_therein_CaptionLbl)
            {
            }
            column(PlaceCaption_Control1102154075;PlaceCaption_Control1102154075Lbl)
            {
            }
            column(DateCaption_Control1102154076;DateCaption_Control1102154076Lbl)
            {
            }
            column(Receiving_OfficerCaption;Receiving_OfficerCaptionLbl)
            {
            }
            column(M_V_MURALIKRISHNA_Caption;M_V_MURALIKRISHNA_CaptionLbl)
            {
            }
            column(VIJAYAWADACaption;VIJAYAWADACaptionLbl)
            {
            }
            column(DIRECTORCaption;DIRECTORCaptionLbl)
            {
            }
            column(Integer2__Number;Number)
            {
            }
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
        Tax : Option Quarterly,Monthly;
        TaxQuarterly : Option First,Second,Third,Fourth;
        TaxMonthly : Option January,February,March,April,May,June,July,August,September,October,November,December;
        StateDesc : Text[50];
        Text001 : Label 'THE CENTRAL SALES TAX (%1) RULES, 1957';
        Text002 : Label '%1';
        LastDate : Date;
        Return : Text[30];
        StartDate : Date;
        EndDate : Date;
        ReturnMonth : Option January,February,March,April,May,June,July,August,September,October,November,December;
        ReturnYear : Integer;
        GTO : Decimal;
        CustLedger : Record "Cust. Ledger Entry";
        Remainder : Integer;
        SalesInvoiceLine : Record "Sales Invoice Line";
        SalesInvHdr : Record "Sales Invoice Header";
        PostDate : Date;
        DocNo : Code[20];
        StateHdr : Code[10];
        StateRec : Record State;
        LocationRec : Record Location;
        LocalTO : Decimal;
        Freight : Decimal;
        GoodsReturned : Decimal;
        TaxAmount : Decimal;
        StructFrt : Code[10];
        ItemChFrt : Code[10];
        StructCode : Code[10];
        ChargeRec : Record "Posted Str Order Line Details";
        SalesCrHdrRec : Record "Sales Cr.Memo Header";
        SalesCrLineRec : Record "Sales Cr.Memo Line";
        CrdDocNo : Code[10];
        CrdState : Code[10];
        CashDiscAmt : Decimal;
        JobWrksAmt : Decimal;
        ExportsAmt : Decimal;
        HighSeaSalesAmt : Decimal;
        HFormCode : Code[10];
        HFormAmt : Decimal;
        TransferAmt : Decimal;
        StateFrom : Code[10];
        StateTo : Code[10];
        LocFrom : Code[10];
        LocTo : Code[10];
        EIFormCode : Code[10];
        EIIFormCode : Code[10];
        EIEIIFormAmt : Decimal;
        SalesTaxExemptAmt : Decimal;
        SalesOutAmt : Decimal;
        SalesProvisoAmt : Decimal;
        CentralTO : Decimal;
        CentralTOLessAmt : Decimal;
        NetTO : Decimal;
        DedClaimAmt : Decimal;
        BalTotTaxableTO : Decimal;
        FromDocNo : Code[30];
        ToDocNo : Code[30];
        Text003 : Label 'Turnover (Local), (Including Jobworks performed within %1)';
        Text004 : Label 'Sales of Goods outside %1[Sec.4]';
        CFormCode : Code[10];
        DecGoodsAmtCDForm : Decimal;
        DecGoodsAmtOther : Decimal;
        DFormCode : Code[10];
        NonDecGoodsAmtCDForm : Decimal;
        NonDecGoodsAmtOther : Decimal;
        HPort : Code[20];
        HSea : Boolean;
        ShipToAddRec : Record "Ship-to Address";
        Location : Code[10];
        StateLine : Code[10];
        TaxAmountTot : Decimal;
        TaxAmountState : Decimal;
        ExportDoc : Boolean;
        ExpType : Option;
        i : Decimal;
        ITaxcredit : Decimal;
        challno : Text[30];
        Name_of_the_Registered_DealerCaptionLbl : Label 'Name of the Registered Dealer';
        Registration_No_CaptionLbl : Label 'Registration No.';
        Form___C_S_T____VICaptionLbl : Label 'Form - C.S.T. - VI';
        Form_of_Return_under_Rule_14_A_of_the_Central_Sales_Tax_Rules__1957__Andhra_Pradesh_CaptionLbl : Label 'Form of Return under Rule 14-A of the Central Sales Tax Rules, 1957 [Andhra Pradesh]';
        Starting_DateCaptionLbl : Label 'Starting Date';
        Ending_DateCaptionLbl : Label 'Ending Date';
        DateCaptionLbl : Label 'Date';
        Status_CaptionLbl : Label 'Status:';
        Style_of_Business_CaptionLbl : Label 'Style of Business:';
        CompanyCaptionLbl : Label 'Company';
        Manufacturing_of_Data_Loggers___Electronic_Moving_Display_BoardCaptionLbl : Label 'Manufacturing of Data Loggers & Electronic Moving Display Board';
        V7_CaptionLbl : Label '7.';
        Goods_wise_break_up_of_6CaptionLbl : Label 'Goods wise break-up of 6';
        V6_CaptionLbl : Label '6.';
        Balance_Total_Taxable_Turnover_of_Interstate_Sales_5_CaptionLbl : Label 'Balance Total Taxable Turnover of Interstate Sales(5)';
        V5_CaptionLbl : Label '5.';
        Net_Turnover_Central__3_4_CaptionLbl : Label 'Net Turnover(Central)(3-4)';
        Total_of_4_A___B___C___D___E_CaptionLbl : Label 'Total of 4(A + B + C + D + E)';
        E_CaptionLbl : Label '(E)';
        Job_work___Work_contracts_not_accounting_to_sales_but_included_in_the_Central_TurnoverCaptionLbl : Label 'Job work & Work contracts not accounting to sales but included in the Central Turnover';
        D_CaptionLbl : Label '(D)';
        Cash_Discount_allowed_according_to_ordinary_trade_practices_and_included_in_Central_TurnoverCaptionLbl : Label 'Cash Discount allowed according to ordinary trade practices and included in Central Turnover';
        C_CaptionLbl : Label '(C)';
        Tax_collected_included_in_the_Central_TurnoverCaptionLbl : Label 'Tax collected included in the Central Turnover';
        Value_of_goods_returned_under_CST_ActCaptionLbl : Label 'Value of goods returned under CST Act';
        B_CaptionLbl : Label '(B)';
        Cost_of_freight_deliveries_freight_or_installation_separately_charged_but_included_in_the_TurnoverCaptionLbl : Label 'Cost of freight deliveries,freight or installation,separately charged but included in the Turnover';
        A_CaptionLbl : Label '(A)';
        V4_CaptionLbl : Label '4.';
        Less__in_respect_of_Central_Turnover_only_CaptionLbl : Label 'Less (in respect of Central Turnover only)';
        V3_CaptionLbl : Label '3.';
        Turnover__Central___1_2_CaptionLbl : Label 'Turnover (Central) (1-2)';
        V2_CaptionLbl : Label '2.';
        Gross_Turnover__GTO___Inclusive_of_Jobworks__work_contracts__Branch_Transfer_etc__CaptionLbl : Label 'Gross Turnover (GTO) (Inclusive of Jobworks, work contracts, Branch Transfer etc.)';
        V1_CaptionLbl : Label '1.';
        Nature_of_GoodsCaptionLbl : Label 'Nature of Goods';
        Commodity_codeCaptionLbl : Label 'Commodity code';
        Rate_of_TaxCaptionLbl : Label 'Rate of Tax';
        Sales_relating_to_Reg_Dealers_on_prescribed_Declaration_in_Form___CCaptionLbl : Label 'Sales relating to Reg.Dealers on prescribed Declaration in Form - C';
        Sales_to_Govt__not_being_a_Regd__Dealer_on_prescrined_certificate_in_Form_DCaptionLbl : Label 'Sales to Govt. not being a Regd. Dealer on prescrined certificate in Form-D';
        Other_salesCaptionLbl : Label 'Other sales';
        Total_SalesCaptionLbl : Label 'Total Sales';
        Tax_dueCaptionLbl : Label 'Tax due';
        V1CaptionLbl : Label '1';
        V2CaptionLbl : Label '2';
        V3CaptionLbl : Label '3';
        V4CaptionLbl : Label '4';
        V5CaptionLbl : Label '5';
        V6CaptionLbl : Label '6';
        V7CaptionLbl : Label '7';
        V8CaptionLbl : Label '8';
        EmptyStringCaptionLbl : Label '--';
        EmptyStringCaption_Control1102154026Lbl : Label '--';
        V8_CaptionLbl : Label '8.';
        Calculation_of_Tax_for_the_Quarter_MonthCaptionLbl : Label 'Calculation of Tax for the Quarter/Month';
        Sales_TaxCaptionLbl : Label 'Sales Tax';
        Classification_CodeCaptionLbl : Label 'Classification Code';
        TurnoverCaptionLbl : Label 'Turnover';
        Tax_PayableCaptionLbl : Label 'Tax Payable';
        Taxable__CaptionLbl : Label 'Taxable @';
        On_which_tax_amount_toCaptionLbl : Label '" On which tax amount to"';
        Total_Tax_payable_on_Rs_CaptionLbl : Label 'Total Tax payable on Rs.';
        V9bCaptionLbl : Label '9b';
        V9aCaptionLbl : Label '9a';
        Less___Input_Credit_Tax______________________________________________Rs_CaptionLbl : Label 'Less:  Input Credit Tax                                              Rs.';
        Total_Taxable_AmountCaptionLbl : Label 'Total Taxable Amount';
        Tax_paid_if_any_by_means_of_Treasury_Challan__Cheque_No_CaptionLbl : Label '"     Tax paid if any by means of Treasury Challan /Cheque No:"';
        M_O__No__CaptionLbl : Label '"     M.O. No. "';
        Balance_DueCaptionLbl : Label 'Balance Due';
        on_excess_paid_if_anyCaptionLbl : Label 'on excess paid if any';
        V1___I_enclose_herewith_this_return__the_original_copy_of_each_of_the_Declarations__and_Certificates_received_by_me_in_respecLbl : Label '[1]  I enclose herewith this return, the original copy of each of the Declarations, and Certificates received by me in respect of Sales made to Registered Dealers and to Government not being a Registered Dealer together with a signed list of such Declarations and Certificates.';
        I_shall_submit_the_Declarations_and_Certificates_still_due_before_the_time_prescribed_thereof_CaptionLbl : Label '"      I shall submit the Declarations and Certificates still due before the time prescribed thereof."';
        V2___I_declare_that_to_the_best_of_my_knowledge_and_belief_the_Information_furnished_in_the_above_statement_is_true_and_complLbl : Label '[2]  I declare that to the best of my knowledge and belief the Information furnished in the above statement is true and complete';
        Dt_CaptionLbl : Label 'Dt:';
        PlaceCaptionLbl : Label 'Place';
        Name_of_the_personCaptionLbl : Label 'Name of the person';
        DateCaption_Control1280155Lbl : Label 'Date';
        Designation_StatusCaptionLbl : Label 'Designation/Status';
        ACKNOWLEDGEMENTCaptionLbl : Label 'ACKNOWLEDGEMENT';
        Received_from____________________________________________________________________________CaptionLbl : Label 'Received from____________________________________________________________________________';
        Dealer_possessing_Registration_Certificate_No___________________________________________________CaptionLbl : Label 'Dealer possessing Registration Certificate No. _________________________________________________';
        Return_of_Sales_Tax_in_Form_C_S_T__VI_payable_by_him_for_the_period_from_with________________________CaptionLbl : Label 'Return of Sales Tax in Form C.S.T  VI payable by him for the period from with _______________________';
        with_enclosers_mentionded_therein_CaptionLbl : Label 'with enclosers mentionded therein.';
        PlaceCaption_Control1102154075Lbl : Label 'Place';
        DateCaption_Control1102154076Lbl : Label 'Date';
        Receiving_OfficerCaptionLbl : Label 'Receiving Officer';
        M_V_MURALIKRISHNA_CaptionLbl : Label '(M.V.MURALIKRISHNA)';
        VIJAYAWADACaptionLbl : Label 'VIJAYAWADA';
        DIRECTORCaptionLbl : Label 'DIRECTOR';
}

