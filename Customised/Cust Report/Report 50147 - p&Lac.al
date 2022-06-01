report 50147 "p&La/c"
{
    DefaultLayout = RDLC;
    RDLCLayout = './p&Lac.rdlc';

    dataset
    {
        dataitem("Company Information"; "Company Information")
        {
            DataItemTableView = SORTING(Primary Key) ORDER(Ascending);
        }
        dataitem("G/L Account"; "G/L Account")
        {
            PrintOnlyIfDetail = false;
            RequestFilterFields = "Date Filter", "Global Dimension 1 Filter";
            column(ABS__8totsales__; ABS("8totsales"))
            {
            }
            column(ABS__17totindirectincome__; ABS("17totindirectincome"))
            {
            }
            column(ABS_ROUND_TOTINCOMINGS_1__; ABS(ROUND(TOTINCOMINGS, 1)))
            {
            }
            column(V13totcostofsales_; "13totcostofsales")
            {
            }
            column(V12directexpenses_; "12directexpenses")
            {
            }
            column(V19emprem_; "19emprem")
            {
            }
            column(V20fincharges_; "20fincharges")
            {
            }
            column(V21mngrem_; "21mngrem")
            {
            }
            column(V22depr_; "22depr")
            {
            }
            column(V23amortisation_; "23amortisation")
            {
            }
            column(ABS_ROUND_TOTOUTGOINGS_1__; ABS(ROUND(TOTOUTGOINGS, 1)))
            {
            }
            column(ABS_ROUND_PLBEFORETAX_1__; ABS(ROUND(PLBEFORETAX, 1)))
            {
            }
            column(V18adminexp_sellingexp_; "18adminexp_sellingexp")
            {
            }
            column(V18adminexp_sellingexp__Control1102154162; "18adminexp_sellingexp")
            {
            }
            column(Company_Information__Name; "Company Information".Name)
            {
            }
            column(Company_Information__Address; "Company Information".Address)
            {
            }
            column(Company_Information___Address_2_; "Company Information"."Address 2")
            {
            }
            column(Company_Information__City; "Company Information".City)
            {
            }
            column(PLCAPTION; PLCAPTION)
            {
            }
            column(PeriodStartDate; PeriodStartDate)
            {
            }
            column(PeriodEndDate; PeriodEndDate)
            {
            }
            column(ABS__1mpbi__; ABS("1mpbi"))
            {
            }
            column(ABS__2dispb__; ABS("2dispb"))
            {
            }
            column(ABS__3othersales__; ABS("3othersales"))
            {
            }
            column(ABS__4softwaresales__; ABS("4softwaresales"))
            {
            }
            column(ABS__5compoundsales__; ABS("5compoundsales"))
            {
            }
            column(ABS__6taxesexcise__; ABS("6taxesexcise"))
            {
            }
            column(ABS__7insurancecollected__; ABS("7insurancecollected"))
            {
            }
            column(ABS__8totsales___Control1102154000; ABS("8totsales"))
            {
            }
            column(ABS__17totindirectincome___Control1102154047; ABS("17totindirectincome"))
            {
            }
            column(ABS__6taxvat__; ABS("6taxvat"))
            {
            }
            column(ABS__6taxcst__; ABS("6taxcst"))
            {
            }
            column(ABS__15miscreceipts__; ABS("15miscreceipts"))
            {
            }
            column(ABS__16otherincomes4__; ABS("16otherincomes4"))
            {
            }
            column(ABS__16otherincomes1__; ABS("16otherincomes1"))
            {
            }
            column(ABS__16otherincomes2__; ABS("16otherincomes2"))
            {
            }
            column(V9openingstock_; "9openingstock")
            {
            }
            column(V10purchaseaccounts_; "10purchaseaccounts")
            {
            }
            column(V11closingstock_; "11closingstock")
            {
            }
            column(V13totcostofsales__Control1102154064; "13totcostofsales")
            {
            }
            column(V19emprem7_; "19emprem7")
            {
            }
            column(V12directexpenses1_; "12directexpenses1")
            {
            }
            column(V12directexpenses3_; "12directexpenses3")
            {
            }
            column(V12directexpenses4_; "12directexpenses4")
            {
            }
            column(V12directexpenses5_; "12directexpenses5")
            {
            }
            column(V12directexpenses6_; "12directexpenses6")
            {
            }
            column(V12directexpenses7_; "12directexpenses7")
            {
            }
            column(V12directexpenses2_; "12directexpenses2")
            {
            }
            column(V12directexpenses__Control1102154086; "12directexpenses")
            {
            }
            column(V19emprem1_; "19emprem1")
            {
            }
            column(V19emprem2_; "19emprem2")
            {
            }
            column(V19emprem3_; "19emprem3")
            {
            }
            column(V19emprem4_; "19emprem4")
            {
            }
            column(V19emprem5_; "19emprem5")
            {
            }
            column(V19emprem6_; "19emprem6")
            {
            }
            column(V19emprem9_; "19emprem9")
            {
            }
            column(V19emprem10_; "19emprem10")
            {
            }
            column(V19emprem8_; "19emprem8")
            {
            }
            column(V19emprem11_; "19emprem11")
            {
            }
            column(V19emprem12_; "19emprem12")
            {
            }
            column(V19emprem__Control1102154130; "19emprem")
            {
            }
            column(V18ad_sel1_; "18ad_sel1")
            {
            }
            column(V18ad_sel2_; "18ad_sel2")
            {
            }
            column(V18ad_sel3_; "18ad_sel3")
            {
            }
            column(V18ad_sel4_; "18ad_sel4")
            {
            }
            column(V18ad_sel5_; "18ad_sel5")
            {
            }
            column(V18ad_sel6_; "18ad_sel6")
            {
            }
            column(V18ad_sel7_; "18ad_sel7")
            {
            }
            column(V18ad_sel8_; "18ad_sel8")
            {
            }
            column(V18ad_sel9_; "18ad_sel9")
            {
            }
            column(V18ad_sel10_; "18ad_sel10")
            {
            }
            column(V18ad_sel11_; "18ad_sel11")
            {
            }
            column(V18ad_sel12_; "18ad_sel12")
            {
            }
            column(V18ad_sel13_; "18ad_sel13")
            {
            }
            column(V18ad_sel14_; "18ad_sel14")
            {
            }
            column(V18ad_sel15_; "18ad_sel15")
            {
            }
            column(V18ad_sel16_; "18ad_sel16")
            {
            }
            column(V18ad_sel17_; "18ad_sel17")
            {
            }
            column(V18ad_sel18_; "18ad_sel18")
            {
            }
            column(V18ad_sel19_; "18ad_sel19")
            {
            }
            column(V18ad_sel20_; "18ad_sel20")
            {
            }
            column(V18ad_sel21_; "18ad_sel21")
            {
            }
            column(V18ad_sel22_; "18ad_sel22")
            {
            }
            column(V18ad_sel23_; "18ad_sel23")
            {
            }
            column(V18ad_sel24_; "18ad_sel24")
            {
            }
            column(V18ad_sel25_; "18ad_sel25")
            {
            }
            column(V18ad_sel26_; "18ad_sel26")
            {
            }
            column(V18ad_sel27_; "18ad_sel27")
            {
            }
            column(V18ad_sel28_; "18ad_sel28")
            {
            }
            column(V18ad_sel29_; "18ad_sel29")
            {
            }
            column(V18ad_sel30_; "18ad_sel30")
            {
            }
            column(V18ad_sel31_; "18ad_sel31")
            {
            }
            column(V18ad_sel32_; "18ad_sel32")
            {
            }
            column(V18ad_sel33_; "18ad_sel33")
            {
            }
            column(V18ad_sel34_; "18ad_sel34")
            {
            }
            column(V18ad_sel35_; "18ad_sel35")
            {
            }
            column(V18ad_sel36_; "18ad_sel36")
            {
            }
            column(V18ad_sel37_; "18ad_sel37")
            {
            }
            column(V18ad_sel38_; "18ad_sel38")
            {
            }
            column(V18ad_sel39_; "18ad_sel39")
            {
            }
            column(V18ad_sel40_; "18ad_sel40")
            {
            }
            column(V24workstax_; "24workstax")
            {
            }
            column(V18ad_sel42_; "18ad_sel42")
            {
            }
            column(V18adminexp_sellingexp__Control1102154149; "18adminexp_sellingexp")
            {
            }
            column(V20fincharges1_; "20fincharges1")
            {
            }
            column(V20fincharges2_; "20fincharges2")
            {
            }
            column(V20fincharges3_; "20fincharges3")
            {
            }
            column(V20fincharges4_; "20fincharges4")
            {
            }
            column(V20fincharges5_; "20fincharges5")
            {
            }
            column(V20fincharges6_; "20fincharges6")
            {
            }
            column(V20fincharges1__Control1102154231; "20fincharges1")
            {
            }
            column(V20fincharges__Control1102154232; "20fincharges")
            {
            }
            column(V21mngrem__Control1102154240; "21mngrem")
            {
            }
            column(V22depr__Control1102154241; "22depr")
            {
            }
            column(V23amortisation__Control1102154242; "23amortisation")
            {
            }
            column(V24workstax__Control1102154243; "24workstax")
            {
            }
            column(INCOMINGS_Caption; INCOMINGS_CaptionLbl)
            {
            }
            column(MISCELLANEOUS_INCOMECaption; MISCELLANEOUS_INCOMECaptionLbl)
            {
            }
            column(SALES_Caption; SALES_CaptionLbl)
            {
            }
            column(TOTAL_INCOMINGS_Caption; TOTAL_INCOMINGS_CaptionLbl)
            {
            }
            column(OUT_GOINGS_Caption; OUT_GOINGS_CaptionLbl)
            {
            }
            column(RAW_MATERIALS_CONSUMEDCaption; RAW_MATERIALS_CONSUMEDCaptionLbl)
            {
            }
            column(TOTAL_DIRECT___EXPENDITURECaption; TOTAL_DIRECT___EXPENDITURECaptionLbl)
            {
            }
            column(EMPLOYEES_REMUNERATION___BENEFITSCaption; EMPLOYEES_REMUNERATION___BENEFITSCaptionLbl)
            {
            }
            column(ADMINISTRATIVE___SELLING_EXPENCESCaption; ADMINISTRATIVE___SELLING_EXPENCESCaptionLbl)
            {
            }
            column(FINANCIAL_CHARGESCaption; FINANCIAL_CHARGESCaptionLbl)
            {
            }
            column(MANAGERIAL_REMUNERATIONCaption; MANAGERIAL_REMUNERATIONCaptionLbl)
            {
            }
            column(DEPRECIATIONCaption; DEPRECIATIONCaptionLbl)
            {
            }
            column(AMORTISATION_OF_MISC__EXPENDITURECaption; AMORTISATION_OF_MISC__EXPENDITURECaptionLbl)
            {
            }
            column(R_D_CENTRE_S_EXPENDITURECaption; R_D_CENTRE_S_EXPENDITURECaptionLbl)
            {
            }
            column(TOTAL_OUT_GOINGSCaption; TOTAL_OUT_GOINGSCaptionLbl)
            {
            }
            column(PROFIT_AND_LOSS_ACCOUNT_FOR_THE_PERIOD_Caption; PROFIT_AND_LOSS_ACCOUNT_FOR_THE_PERIOD_CaptionLbl)
            {
            }
            column(TOCaption; TOCaptionLbl)
            {
            }
            column(Micro_Processor_Based_ItemsCaption; Micro_Processor_Based_ItemsCaptionLbl)
            {
            }
            column(Display_BoardCaption; Display_BoardCaptionLbl)
            {
            }
            column(Other_SalesCaption; Other_SalesCaptionLbl)
            {
            }
            column(Software_SalesCaption; Software_SalesCaptionLbl)
            {
            }
            column(Compound_Units_SalesCaption; Compound_Units_SalesCaptionLbl)
            {
            }
            column(Central_Excise_Duty_CollectedCaption; Central_Excise_Duty_CollectedCaptionLbl)
            {
            }
            column(Insurance_CollectedCaption; Insurance_CollectedCaptionLbl)
            {
            }
            column(TOTAL_SALESCaption; TOTAL_SALESCaptionLbl)
            {
            }
            column(SALES_ACCOUNTS_Caption; SALES_ACCOUNTS_CaptionLbl)
            {
            }
            column(Account_Head_NameCaption; Account_Head_NameCaptionLbl)
            {
            }
            column(Net_ChangeCaption; Net_ChangeCaptionLbl)
            {
            }
            column(TOTAL_INDIRECT_INCOMESCaption; TOTAL_INDIRECT_INCOMESCaptionLbl)
            {
            }
            column(VAT_COLLECTEDCaption; VAT_COLLECTEDCaptionLbl)
            {
            }
            column(CST_CollectedCaption; CST_CollectedCaptionLbl)
            {
            }
            column(INDIRECT_INCOMESCaption; INDIRECT_INCOMESCaptionLbl)
            {
            }
            column(Miscellaneous_ReceiptsCaption; Miscellaneous_ReceiptsCaptionLbl)
            {
            }
            column(Service_Tax_Collected_Education_Cess_on_Service_tax_collectedCaption; Service_Tax_Collected_Education_Cess_on_Service_tax_collectedCaptionLbl)
            {
            }
            column(Servicing_ChargesCaption; Servicing_ChargesCaptionLbl)
            {
            }
            column(Installation_and_Commission_ReceivedCaption; Installation_and_Commission_ReceivedCaptionLbl)
            {
            }
            column(DETAILS_OF_RAW___MATERIAL_CONSUMPTION_Caption; DETAILS_OF_RAW___MATERIAL_CONSUMPTION_CaptionLbl)
            {
            }
            column(Opening_StockCaption; Opening_StockCaptionLbl)
            {
            }
            column(ADD__PurchasesCaption; ADD__PurchasesCaptionLbl)
            {
            }
            column(LESS__Closing_StockCaption; LESS__Closing_StockCaptionLbl)
            {
            }
            column(Raw___Material_ConsumptionCaption; Raw___Material_ConsumptionCaptionLbl)
            {
            }
            column(EMPLOYEES_REMUNERATION___BENEFITSCaption_Control1102154088; EMPLOYEES_REMUNERATION___BENEFITSCaption_Control1102154088Lbl)
            {
            }
            column(Freight_ChargesCaption; Freight_ChargesCaptionLbl)
            {
            }
            column(DIRECT_EXPENSESCaption; DIRECT_EXPENSESCaptionLbl)
            {
            }
            column(Import__Duty_PaidCaption; Import__Duty_PaidCaptionLbl)
            {
            }
            column(Electricity_chargesCaption; Electricity_chargesCaptionLbl)
            {
            }
            column(Central__Excise_DutyCaption; Central__Excise_DutyCaptionLbl)
            {
            }
            column(Installation_ChargesCaption; Installation_ChargesCaptionLbl)
            {
            }
            column(Packing___Farwording_chargesCaption; Packing___Farwording_chargesCaptionLbl)
            {
            }
            column(Repairs___MaintenanceCaption; Repairs___MaintenanceCaptionLbl)
            {
            }
            column(TOTAL_DIRECT___EXPENDITURECaption_Control1102154095; TOTAL_DIRECT___EXPENDITURECaption_Control1102154095Lbl)
            {
            }
            column(SalariesCaption; SalariesCaptionLbl)
            {
            }
            column(Provident_FundCaption; Provident_FundCaptionLbl)
            {
            }
            column(E_S_ICaption; E_S_ICaptionLbl)
            {
            }
            column(Food___BeveragesCaption; Food___BeveragesCaptionLbl)
            {
            }
            column(StifendCaption; StifendCaptionLbl)
            {
            }
            column(ELS_EncashmentCaption; ELS_EncashmentCaptionLbl)
            {
            }
            column(Uniform_ExpensesCaption; Uniform_ExpensesCaptionLbl)
            {
            }
            column(Travelling_IncentivesCaption; Travelling_IncentivesCaptionLbl)
            {
            }
            column(Staff_Welfare_ExpensesCaption; Staff_Welfare_ExpensesCaptionLbl)
            {
            }
            column(GratuityCaption; GratuityCaptionLbl)
            {
            }
            column(Incentives_to_Sales_ExecutivesCaption; Incentives_to_Sales_ExecutivesCaptionLbl)
            {
            }
            column(Bonus___ExgratiaCaption; Bonus___ExgratiaCaptionLbl)
            {
            }
            column(TOTAL_EMPLOYEE___EXPENDITURECaption; TOTAL_EMPLOYEE___EXPENDITURECaptionLbl)
            {
            }
            column(Allowance_for_short_suppliesCaption; Allowance_for_short_suppliesCaptionLbl)
            {
            }
            column(AdvertisementCaption; AdvertisementCaptionLbl)
            {
            }
            column(Auditors__RemunerationCaption; Auditors__RemunerationCaptionLbl)
            {
            }
            column(Books___PeriodicalsCaption; Books___PeriodicalsCaptionLbl)
            {
            }
            column(DiscountCaption; DiscountCaptionLbl)
            {
            }
            column(Conferences___MeetingsCaption; Conferences___MeetingsCaptionLbl)
            {
            }
            column(Consultancy_ChargesCaption; Consultancy_ChargesCaptionLbl)
            {
            }
            column(DonationsCaption; DonationsCaptionLbl)
            {
            }
            column(ROC_Filing_FeeCaption; ROC_Filing_FeeCaptionLbl)
            {
            }
            column(InsuranceCaption; InsuranceCaptionLbl)
            {
            }
            column(Repairs___Maintenance_of_Office_PremisesCaption; Repairs___Maintenance_of_Office_PremisesCaptionLbl)
            {
            }
            column(Internet_chargesCaption; Internet_chargesCaptionLbl)
            {
            }
            column(ISO_Certification_ExpenditureCaption; ISO_Certification_ExpenditureCaptionLbl)
            {
            }
            column(Licences___RenewalsCaption; Licences___RenewalsCaptionLbl)
            {
            }
            column(Marketing__ExpensesCaption; Marketing__ExpensesCaptionLbl)
            {
            }
            column(Income_taxCaption; Income_taxCaptionLbl)
            {
            }
            column(Exhibition_Participation_ExpensesCaption; Exhibition_Participation_ExpensesCaptionLbl)
            {
            }
            column(DemurragesCaption; DemurragesCaptionLbl)
            {
            }
            column(Membership_Fee_A_CCaption; Membership_Fee_A_CCaptionLbl)
            {
            }
            column(Late_Delivery_Liquidatd_DamagesCaption; Late_Delivery_Liquidatd_DamagesCaptionLbl)
            {
            }
            column(Modification_Charges___Quality_DeductionsCaption; Modification_Charges___Quality_DeductionsCaptionLbl)
            {
            }
            column(Office__Expenses___MaintenanceCaption; Office__Expenses___MaintenanceCaptionLbl)
            {
            }
            column(Postage____TelegramsCaption; Postage____TelegramsCaptionLbl)
            {
            }
            column(Printing___StationaryCaption; Printing___StationaryCaptionLbl)
            {
            }
            column(Rates___TaxesCaption; Rates___TaxesCaptionLbl)
            {
            }
            column(RDSO_Inspection_ChargesCaption; RDSO_Inspection_ChargesCaptionLbl)
            {
            }
            column(RentCaption; RentCaptionLbl)
            {
            }
            column(Job_Work_ExpensesCaption; Job_Work_ExpensesCaptionLbl)
            {
            }
            column(Security__ChargesCaption; Security__ChargesCaptionLbl)
            {
            }
            column(Service_ChargesCaption; Service_ChargesCaptionLbl)
            {
            }
            column(Service_Tax_PaidCaption; Service_Tax_PaidCaptionLbl)
            {
            }
            column(SubscriptionsCaption; SubscriptionsCaptionLbl)
            {
            }
            column(Sales_Commission_to_OutsidersCaption; Sales_Commission_to_OutsidersCaptionLbl)
            {
            }
            column(VAT___CST__PaidCaption; VAT___CST__PaidCaptionLbl)
            {
            }
            column(Telephone___Trunk_CallsCaption; Telephone___Trunk_CallsCaptionLbl)
            {
            }
            column(Tender_FormsCaption; Tender_FormsCaptionLbl)
            {
            }
            column(Training_ExpensesCaption; Training_ExpensesCaptionLbl)
            {
            }
            column(Travelling____ConveyanceCaption; Travelling____ConveyanceCaptionLbl)
            {
            }
            column(DirectorsCaption; DirectorsCaptionLbl)
            {
            }
            column(OthersCaption; OthersCaptionLbl)
            {
            }
            column(Vehicle_MaintenanceCaption; Vehicle_MaintenanceCaptionLbl)
            {
            }
            column(Works_TaxCaption; Works_TaxCaptionLbl)
            {
            }
            column(Professional_TaxCaption; Professional_TaxCaptionLbl)
            {
            }
            column(TOTAL_ADMINSTRATIVE___SELLING_EXP_Caption; TOTAL_ADMINSTRATIVE___SELLING_EXP_CaptionLbl)
            {
            }
            column(ADMINISTRATIVE___SELLING_EXPENDITURECaption; ADMINISTRATIVE___SELLING_EXPENDITURECaptionLbl)
            {
            }
            column(FINANCIAL_CHARGESCaption_Control1102154216; FINANCIAL_CHARGESCaption_Control1102154216Lbl)
            {
            }
            column(Interest_on_Term_LoanCaption; Interest_on_Term_LoanCaptionLbl)
            {
            }
            column(Interest_on_Cash_Credit_a_cCaption; Interest_on_Cash_Credit_a_cCaptionLbl)
            {
            }
            column(Interest_on_Unsecured_LoansCaption; Interest_on_Unsecured_LoansCaptionLbl)
            {
            }
            column(Interest_on_S_D__from_EmployeesCaption; Interest_on_S_D__from_EmployeesCaptionLbl)
            {
            }
            column(Bank_ChargesCaption; Bank_ChargesCaptionLbl)
            {
            }
            column(Loan_Processing_chargesCaption; Loan_Processing_chargesCaptionLbl)
            {
            }
            column(Interest_on_statutory_taxesCaption; Interest_on_statutory_taxesCaptionLbl)
            {
            }
            column(TOTAL_FINANCIAL_CHARGESCaption; TOTAL_FINANCIAL_CHARGESCaptionLbl)
            {
            }
            column(DepreciationCaption_Control1102154236; DepreciationCaption_Control1102154236Lbl)
            {
            }
            column(Amortisation_of_Misc__ExpensesCaption; Amortisation_of_Misc__ExpensesCaptionLbl)
            {
            }
            column(Works_TaxCaption_Control1102154238; Works_TaxCaption_Control1102154238Lbl)
            {
            }
            column(Managerial_RemunerationCaption_Control1102154239; Managerial_RemunerationCaption_Control1102154239Lbl)
            {
            }
            column(G_L_Account_No_; "No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                "G/L Account".CALCFIELDS("G/L Account"."Debit Amount", "G/L Account"."Credit Amount");

                // For Total Sales data

                IF "G/L Account"."No." = '46100' THEN
                    "1mpbi" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF "G/L Account"."No." = '46200' THEN
                    "2dispb" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF "G/L Account"."No." = '46300' THEN
                    "3othersales" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF "G/L Account"."No." = '46400' THEN
                    "4softwaresales" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF "G/L Account"."No." = '46500' THEN
                    "5compoundsales" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '38100') THEN
                    "6taxvat" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";
                IF ("G/L Account"."No." = '38200') THEN
                    "6taxcst" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";
                IF ("G/L Account"."No." = '38300') THEN
                    "6taxesexcise" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF "G/L Account"."No." = '48300' THEN
                    "7insurancecollected" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                "6taxes" := "6taxesexcise" + "6taxcst" + "6taxvat";
                "8totsales" := "1mpbi" + "2dispb" + "3othersales" + "4softwaresales" + "5compoundsales" + "6taxes" + "7insurancecollected";


                // miscellneous receipts

                IF ("G/L Account"."No." = '48700') OR ("G/L Account"."No." = '49100') OR
                ("G/L Account"."No." = '48500') THEN
                    "15miscreceipts" += "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";


                IF ("G/L Account"."No." = '47503') THEN
                    "16otherincomes1" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '47300') THEN
                    "16otherincomes2" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '48701') THEN
                    "16otherincomes3" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '47502') OR ("G/L Account"."No." = '47504') THEN
                    "16otherincomes4" += "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                "17totindirectincome" := "15miscreceipts" + "16otherincomes1" + "16otherincomes2" + "16otherincomes3" + "16otherincomes4";

                // financial charges

                IF ("G/L Account"."No." = '67100') THEN
                    "20fincharges1" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '67200') THEN
                    "20fincharges2" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '67300') THEN
                    "20fincharges3" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '67400') THEN
                    "20fincharges4" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '67600') THEN
                    "20fincharges5" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '67500') THEN
                    "20fincharges6" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '67601') THEN
                    "20fincharges7" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                "20fincharges" := "20fincharges1" + "20fincharges2" + "20fincharges3" + "20fincharges4" + "20fincharges5" + "20fincharges6" + "20fincharges7";


                // For total Cost of Sales

                IF "G/L Account"."No." = '21100' THEN
                    "9openingstock" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '51300') OR ("G/L Account"."No." = '23300') OR ("G/L Account"."No." = '51700') OR
                ("G/L Account"."No." = '51100') OR ("G/L Account"."No." = '50300') OR ("G/L Account"."No." = '50500') OR
                ("G/L Account"."No." = '56100') OR ("G/L Account"."No." = '51500') THEN
                    "10purchaseaccounts" += "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF "G/L Account"."No." = '21600' THEN
                    "11closingstock" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                // direct expenses

                IF ("G/L Account"."No." = '51400') THEN
                    "12directexpenses1" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '51800') THEN
                    "12directexpenses2" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '53200') OR ("G/L Account"."No." = '53901') OR ("G/L Account"."No." = '61500') THEN    //53200+53901+61500
                    "12directexpenses3" += "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '53600') THEN
                    "12directexpenses4" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '53100') THEN
                    "12directexpenses5" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '53903') THEN
                    "12directexpenses6" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '60103') OR ("G/L Account"."No." = '60100') OR ("G/L Account"."No." = '51600') THEN
                    "12directexpenses7" += "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";  //51600 clearing charges

                "12directexpenses" := "12directexpenses7" + "12directexpenses6" + "12directexpenses1" + "12directexpenses2" + "12directexpenses3"
                                    + "12directexpenses4" + "12directexpenses5";


                // EMPLOYEE REMUNERATION AND BENIFITS


                IF ("G/L Account"."No." = '64100') THEN
                    "19emprem1" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '64200') THEN
                    "19emprem2" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '64300') THEN
                    "19emprem3" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '64500') THEN
                    "19emprem4" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '64600') THEN
                    "19emprem5" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '64700') THEN
                    "19emprem6" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '65401') THEN
                    "19emprem7" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '65402') THEN
                    "19emprem8" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '61700') THEN
                    "19emprem9" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '65100') THEN
                    "19emprem10" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '64800') THEN
                    "19emprem11" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '65400') THEN
                    "19emprem12" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";


                "19emprem" := "19emprem1" + "19emprem2" + "19emprem3" + "19emprem4" + "19emprem5" + "19emprem6" + "19emprem7"
                            + "19emprem8" + "19emprem9" + "19emprem10" + "19emprem11" + "19emprem12";

                //

                "13totcostofsales" := "9openingstock" + "10purchaseaccounts" + "12directexpenses" - "11closingstock";

                /*
                IF "8totsales">"13totcostofsales" THEN
                "14GROSSPROFIT":="8totsales"-"13totcostofsales"
                ELSE
                "14GROSSPROFIT":="8totsales"+"13totcostofsales";
                
                */

                // administrative expenditures

                IF ("G/L Account"."No." = '61912') THEN
                    "18ad_sel1" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '58100') THEN
                    "18ad_sel2" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";


                IF ("G/L Account"."No." = '62100') THEN
                    "18ad_sel3" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '58200') THEN
                    "18ad_sel4" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '61914') THEN
                    "18ad_sel5" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '') THEN    // not having any account in erp
                    "18ad_sel7" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '58300') THEN
                    "18ad_sel8" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '58400') THEN
                    "18ad_sel9" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '58600') THEN
                    "18ad_sel10" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '58700') THEN
                    "18ad_sel11" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '') THEN                                            // no need to insert it in accounts
                    "18ad_sel12" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";


                IF ("G/L Account"."No." = '58800') THEN
                    "18ad_sel13" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '58900') THEN
                    "18ad_sel14" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '59000') THEN
                    "18ad_sel15" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";


                IF ("G/L Account"."No." = '59100') THEN
                    "18ad_sel16" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '') THEN                                          // there is no head avaialable in ERP
                    "18ad_sel17" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '65901') THEN
                    "18ad_sel18" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '59200') THEN
                    "18ad_sel19" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '') THEN
                    "18ad_sel20" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '') THEN
                    "18ad_sel21" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '61910') OR ("G/L Account"."No." = '61913') THEN
                    "18ad_sel22" += "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '59400') THEN
                    "18ad_sel23" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '59500') OR ("G/L Account"."No." = '61200') THEN
                    "18ad_sel24" += "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '59600') THEN
                    "18ad_sel25" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";
                IF ("G/L Account"."No." = '59700') THEN
                    "18ad_sel26" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";
                IF ("G/L Account"."No." = '59800') THEN
                    "18ad_sel27" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";
                IF ("G/L Account"."No." = '53300') THEN
                    "18ad_sel28" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '59900') THEN
                    "18ad_sel29" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";
                IF ("G/L Account"."No." = '61905') THEN
                    "18ad_sel30" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";
                IF ("G/L Account"."No." = '60300') THEN
                    "18ad_sel31" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '61400') THEN
                    "18ad_sel32" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '61906') THEN
                    "18ad_sel33" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";
                IF ("G/L Account"."No." = '60400') THEN
                    "18ad_sel34" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";
                IF ("G/L Account"."No." = '') THEN
                    "18ad_sel35" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";
                IF ("G/L Account"."No." = '') THEN
                    "18ad_sel36" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";
                IF ("G/L Account"."No." = '60600') THEN
                    "18ad_sel37" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";
                IF ("G/L Account"."No." = '60700') THEN
                    "18ad_sel38" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";
                IF ("G/L Account"."No." = '60800') THEN
                    "18ad_sel39" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF ("G/L Account"."No." = '61300') OR ("G/L Account"."No." = '61000') THEN
                    "18ad_sel40" += "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";
                IF ("G/L Account"."No." = '60000') THEN
                    "18ad_sel41" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";
                IF ("G/L Account"."No." = '64900') THEN
                    "18ad_sel42" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";
                IF ("G/L Account"."No." = '') THEN
                    "18ad_sel42" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";
                IF "G/L Account"."No." = '53500' THEN
                    "24workstax" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";



                IF "G/L Account"."No." = '71100' THEN
                    "21mngrem" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF "G/L Account"."No." = '66900' THEN
                    "22depr" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";

                IF "G/L Account"."No." = '70100' THEN
                    "23amortisation" := "G/L Account"."Debit Amount" - "G/L Account"."Credit Amount";


                "25totindirectexp" := "18adminexp_sellingexp" + "19emprem" + "20fincharges" + "21mngrem" + "22depr" + "23amortisation";

                "18adminexp_sellingexp" := "18ad_sel1" + "18ad_sel2" + "18ad_sel3" + "18ad_sel4" + "18ad_sel5" + "18ad_sel6" + "18ad_sel7" + "18ad_sel8" + "18ad_sel9"
                                         + "18ad_sel10" + "18ad_sel11" + "18ad_sel12" + "18ad_sel13" + "18ad_sel14" + "18ad_sel15" + "18ad_sel16" + "18ad_sel17" +
                                         "18ad_sel18" + "18ad_sel19" + "18ad_sel20" + "18ad_sel21" + "18ad_sel22" + "18ad_sel23" + "18ad_sel24" + "18ad_sel25" +
                                         "18ad_sel26" + "18ad_sel27" + "18ad_sel28" + "18ad_sel29" + "18ad_sel30" + "18ad_sel31" + "18ad_sel32" + "18ad_sel33" +
                                         "18ad_sel34" + "18ad_sel35" + "18ad_sel36" + "18ad_sel37" + "18ad_sel38" + "18ad_sel39" + "18ad_sel40" + "18ad_sel41" +
                                         "18ad_sel42" + "18ad_sel43";



                IF ("14GROSSPROFIT" > 0) AND ("17totindirectincome" > 0) THEN
                    "28profitbeforetax" := "14GROSSPROFIT" + "17totindirectincome" - "25totindirectexp";

                IF ("14GROSSPROFIT" > 0) AND ("17totindirectincome" < 0) THEN
                    "28profitbeforetax" := "14GROSSPROFIT" - "17totindirectincome" - "25totindirectexp";

                IF ("14GROSSPROFIT" < 0) AND ("17totindirectincome" < 0) THEN
                    "28profitbeforetax" := "14GROSSPROFIT" + "17totindirectincome" + "25totindirectexp";

                IF (("14GROSSPROFIT" < 0) AND ("17totindirectincome" > 0)) THEN
                    "28profitbeforetax" := "14GROSSPROFIT" + "17totindirectincome" - "25totindirectexp";

            end;

            trigger OnPreDataItem();
            begin
                "1mpbi" := 0;
                "2dispb" := 0;
                "3othersales" := 0;
                "4softwaresales" := 0;
                "5compoundsales" := 0;
                "6taxes" := 0;
                "7insurancecollected" := 0;
                "8totsales" := 0;
                //filters:="G/L Account".GETFILTERS;
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
        WITH "G/L Account" DO BEGIN
            periodfilter := GETFILTER("Date Filter");
            PeriodStartDate := GETRANGEMIN("Date Filter");
            PeriodEndDate := GETRANGEMAX("Date Filter");
        END;
    end;

    var
        "1mpbi": Decimal;
        "2dispb": Decimal;
        "3othersales": Decimal;
        "4softwaresales": Decimal;
        "5compoundsales": Decimal;
        "6taxes": Decimal;
        "7insurancecollected": Decimal;
        "8totsales": Decimal;
        "9openingstock": Decimal;
        "10purchaseaccounts": Decimal;
        "11closingstock": Decimal;
        "12directexpenses": Decimal;
        "13totcostofsales": Decimal;
        "14GROSSPROFIT": Decimal;
        "15miscreceipts": Decimal;
        "16otherincomes": Decimal;
        "17totindirectincome": Decimal;
        "18adminexp_sellingexp": Decimal;
        "19emprem": Decimal;
        "20fincharges": Decimal;
        "21mngrem": Decimal;
        "22depr": Decimal;
        "23amortisation": Decimal;
        "24workstax": Decimal;
        "25totindirectexp": Decimal;
        "28profitbeforetax": Decimal;
        fromdate: Date;
        todate: Date;
        "6taxesexcise": Decimal;
        "6taxcst": Decimal;
        "6taxvat": Decimal;
        "16otherincomes1": Decimal;
        "16otherincomes2": Decimal;
        "16otherincomes3": Decimal;
        "16otherincomes4": Decimal;
        "16otherincomes5": Decimal;
        "20fincharges1": Decimal;
        "20fincharges2": Decimal;
        "20fincharges3": Decimal;
        "20fincharges4": Decimal;
        "20fincharges5": Decimal;
        "20fincharges6": Decimal;
        "20fincharges7": Decimal;
        "12directexpenses1": Decimal;
        "12directexpenses2": Decimal;
        "12directexpenses3": Decimal;
        "12directexpenses4": Decimal;
        "12directexpenses5": Decimal;
        "12directexpenses6": Decimal;
        "12directexpenses7": Decimal;
        "19emprem1": Decimal;
        "19emprem2": Decimal;
        "19emprem3": Decimal;
        "19emprem4": Decimal;
        "19emprem5": Decimal;
        "19emprem6": Decimal;
        "19emprem7": Decimal;
        "19emprem8": Decimal;
        "19emprem9": Decimal;
        "19emprem10": Decimal;
        "19emprem11": Decimal;
        "19emprem12": Decimal;
        "18ad_sel1": Decimal;
        "18ad_sel2": Decimal;
        "18ad_sel3": Decimal;
        "18ad_sel4": Decimal;
        "18ad_sel5": Decimal;
        "18ad_sel6": Decimal;
        "18ad_sel7": Decimal;
        "18ad_sel8": Decimal;
        "18ad_sel9": Decimal;
        "18ad_sel10": Decimal;
        "18ad_sel11": Decimal;
        "18ad_sel12": Decimal;
        "18ad_sel13": Decimal;
        "18ad_sel14": Decimal;
        "18ad_sel15": Decimal;
        "18ad_sel16": Decimal;
        "18ad_sel17": Decimal;
        "18ad_sel18": Decimal;
        "18ad_sel19": Decimal;
        "18ad_sel20": Decimal;
        "18ad_sel21": Decimal;
        "18ad_sel22": Decimal;
        "18ad_sel23": Decimal;
        "18ad_sel24": Decimal;
        "18ad_sel25": Decimal;
        "18ad_sel26": Decimal;
        "18ad_sel27": Decimal;
        "18ad_sel28": Decimal;
        "18ad_sel29": Decimal;
        "18ad_sel30": Decimal;
        "18ad_sel31": Decimal;
        "18ad_sel32": Decimal;
        "18ad_sel33": Decimal;
        "18ad_sel34": Decimal;
        "18ad_sel35": Decimal;
        "18ad_sel36": Decimal;
        "18ad_sel37": Decimal;
        "18ad_sel38": Decimal;
        "18ad_sel39": Decimal;
        "18ad_sel40": Decimal;
        "18ad_sel41": Decimal;
        "18ad_sel42": Decimal;
        "18ad_sel43": Decimal;
        TOTINCOMINGS: Decimal;
        TOTOUTGOINGS: Decimal;
        PLBEFORETAX: Decimal;
        CONSOLIDATED: Boolean;
        DETAILED: Boolean;
        PLCAPTION: Text[100];
        periodfilter: Text[200];
        PeriodStartDate: Date;
        PeriodEndDate: Date;
        INCOMINGS_CaptionLbl: Label 'INCOMINGS:';
        MISCELLANEOUS_INCOMECaptionLbl: Label 'MISCELLANEOUS INCOME';
        SALES_CaptionLbl: Label 'SALES:';
        TOTAL_INCOMINGS_CaptionLbl: Label 'TOTAL INCOMINGS:';
        OUT_GOINGS_CaptionLbl: Label 'OUT GOINGS:';
        RAW_MATERIALS_CONSUMEDCaptionLbl: Label 'RAW MATERIALS CONSUMED';
        TOTAL_DIRECT___EXPENDITURECaptionLbl: Label 'TOTAL DIRECT   EXPENDITURE';
        EMPLOYEES_REMUNERATION___BENEFITSCaptionLbl: Label 'EMPLOYEES REMUNERATION & BENEFITS';
        ADMINISTRATIVE___SELLING_EXPENCESCaptionLbl: Label 'ADMINISTRATIVE & SELLING EXPENCES';
        FINANCIAL_CHARGESCaptionLbl: Label 'FINANCIAL CHARGES';
        MANAGERIAL_REMUNERATIONCaptionLbl: Label 'MANAGERIAL REMUNERATION';
        DEPRECIATIONCaptionLbl: Label 'DEPRECIATION';
        AMORTISATION_OF_MISC__EXPENDITURECaptionLbl: Label 'AMORTISATION OF MISC. EXPENDITURE';
        R_D_CENTRE_S_EXPENDITURECaptionLbl: Label 'R&D CENTRE''S EXPENDITURE';
        TOTAL_OUT_GOINGSCaptionLbl: Label 'TOTAL OUT GOINGS';
        PROFIT_AND_LOSS_ACCOUNT_FOR_THE_PERIOD_CaptionLbl: Label '" PROFIT AND LOSS ACCOUNT FOR THE PERIOD "';
        TOCaptionLbl: Label 'TO';
        Micro_Processor_Based_ItemsCaptionLbl: Label 'Micro Processor Based Items';
        Display_BoardCaptionLbl: Label 'Display Board';
        Other_SalesCaptionLbl: Label 'Other Sales';
        Software_SalesCaptionLbl: Label 'Software Sales';
        Compound_Units_SalesCaptionLbl: Label 'Compound Units Sales';
        Central_Excise_Duty_CollectedCaptionLbl: Label 'Central Excise Duty Collected';
        Insurance_CollectedCaptionLbl: Label 'Insurance Collected';
        TOTAL_SALESCaptionLbl: Label 'TOTAL SALES';
        SALES_ACCOUNTS_CaptionLbl: Label 'SALES ACCOUNTS:';
        Account_Head_NameCaptionLbl: Label 'Account Head Name';
        Net_ChangeCaptionLbl: Label 'Net Change';
        TOTAL_INDIRECT_INCOMESCaptionLbl: Label 'TOTAL INDIRECT INCOMES';
        VAT_COLLECTEDCaptionLbl: Label 'VAT COLLECTED';
        CST_CollectedCaptionLbl: Label 'CST Collected';
        INDIRECT_INCOMESCaptionLbl: Label 'INDIRECT INCOMES';
        Miscellaneous_ReceiptsCaptionLbl: Label 'Miscellaneous Receipts';
        Service_Tax_Collected_Education_Cess_on_Service_tax_collectedCaptionLbl: Label 'Service Tax Collected+Education Cess on Service tax collected';
        Servicing_ChargesCaptionLbl: Label 'Servicing Charges';
        Installation_and_Commission_ReceivedCaptionLbl: Label 'Installation and Commission Received';
        DETAILS_OF_RAW___MATERIAL_CONSUMPTION_CaptionLbl: Label '"DETAILS OF RAW - MATERIAL CONSUMPTION "';
        Opening_StockCaptionLbl: Label 'Opening Stock';
        ADD__PurchasesCaptionLbl: Label 'ADD: Purchases';
        LESS__Closing_StockCaptionLbl: Label 'LESS: Closing Stock';
        Raw___Material_ConsumptionCaptionLbl: Label 'Raw - Material Consumption';
        EMPLOYEES_REMUNERATION___BENEFITSCaption_Control1102154088Lbl: Label 'EMPLOYEES REMUNERATION & BENEFITS';
        Freight_ChargesCaptionLbl: Label 'Freight Charges';
        DIRECT_EXPENSESCaptionLbl: Label 'DIRECT EXPENSES';
        Import__Duty_PaidCaptionLbl: Label 'Import  Duty Paid';
        Electricity_chargesCaptionLbl: Label 'Electricity charges';
        Central__Excise_DutyCaptionLbl: Label 'Central  Excise Duty';
        Installation_ChargesCaptionLbl: Label 'Installation Charges';
        Packing___Farwording_chargesCaptionLbl: Label 'Packing & Farwording charges';
        Repairs___MaintenanceCaptionLbl: Label 'Repairs & Maintenance';
        TOTAL_DIRECT___EXPENDITURECaption_Control1102154095Lbl: Label 'TOTAL DIRECT   EXPENDITURE';
        SalariesCaptionLbl: Label 'Salaries';
        Provident_FundCaptionLbl: Label 'Provident Fund';
        E_S_ICaptionLbl: Label 'E.S.I';
        Food___BeveragesCaptionLbl: Label 'Food & Beverages';
        StifendCaptionLbl: Label 'Stifend';
        ELS_EncashmentCaptionLbl: Label 'ELS Encashment';
        Uniform_ExpensesCaptionLbl: Label 'Uniform Expenses';
        Travelling_IncentivesCaptionLbl: Label 'Travelling Incentives';
        Staff_Welfare_ExpensesCaptionLbl: Label 'Staff Welfare Expenses';
        GratuityCaptionLbl: Label 'Gratuity';
        Incentives_to_Sales_ExecutivesCaptionLbl: Label '" Incentives to Sales Executives"';
        Bonus___ExgratiaCaptionLbl: Label 'Bonus & Exgratia';
        TOTAL_EMPLOYEE___EXPENDITURECaptionLbl: Label 'TOTAL EMPLOYEE   EXPENDITURE';
        Allowance_for_short_suppliesCaptionLbl: Label 'Allowance for short supplies';
        AdvertisementCaptionLbl: Label 'Advertisement';
        Auditors__RemunerationCaptionLbl: Label 'Auditors'' Remuneration';
        Books___PeriodicalsCaptionLbl: Label 'Books & Periodicals';
        DiscountCaptionLbl: Label 'Discount';
        Conferences___MeetingsCaptionLbl: Label 'Conferences & Meetings';
        Consultancy_ChargesCaptionLbl: Label 'Consultancy Charges';
        DonationsCaptionLbl: Label 'Donations';
        ROC_Filing_FeeCaptionLbl: Label 'ROC Filing Fee';
        InsuranceCaptionLbl: Label '" Insurance"';
        Repairs___Maintenance_of_Office_PremisesCaptionLbl: Label 'Repairs & Maintenance of Office Premises';
        Internet_chargesCaptionLbl: Label 'Internet charges';
        ISO_Certification_ExpenditureCaptionLbl: Label 'ISO Certification Expenditure';
        Licences___RenewalsCaptionLbl: Label 'Licences & Renewals';
        Marketing__ExpensesCaptionLbl: Label 'Marketing  Expenses';
        Income_taxCaptionLbl: Label 'Income tax';
        Exhibition_Participation_ExpensesCaptionLbl: Label 'Exhibition Participation Expenses';
        DemurragesCaptionLbl: Label 'Demurrages';
        Membership_Fee_A_CCaptionLbl: Label 'Membership Fee A/C';
        Late_Delivery_Liquidatd_DamagesCaptionLbl: Label 'Late Delivery/Liquidatd Damages';
        Modification_Charges___Quality_DeductionsCaptionLbl: Label 'Modification Charges / Quality Deductions';
        Office__Expenses___MaintenanceCaptionLbl: Label 'Office  Expenses & Maintenance';
        Postage____TelegramsCaptionLbl: Label 'Postage  & Telegrams';
        Printing___StationaryCaptionLbl: Label 'Printing & Stationary';
        Rates___TaxesCaptionLbl: Label 'Rates & Taxes';
        RDSO_Inspection_ChargesCaptionLbl: Label 'RDSO Inspection Charges';
        RentCaptionLbl: Label 'Rent';
        Job_Work_ExpensesCaptionLbl: Label 'Job Work Expenses';
        Security__ChargesCaptionLbl: Label 'Security  Charges';
        Service_ChargesCaptionLbl: Label 'Service Charges';
        Service_Tax_PaidCaptionLbl: Label 'Service Tax Paid';
        SubscriptionsCaptionLbl: Label 'Subscriptions';
        Sales_Commission_to_OutsidersCaptionLbl: Label 'Sales Commission to Outsiders';
        VAT___CST__PaidCaptionLbl: Label 'VAT / CST  Paid';
        Telephone___Trunk_CallsCaptionLbl: Label 'Telephone & Trunk Calls';
        Tender_FormsCaptionLbl: Label 'Tender Forms';
        Training_ExpensesCaptionLbl: Label 'Training Expenses';
        Travelling____ConveyanceCaptionLbl: Label 'Travelling  & Conveyance';
        DirectorsCaptionLbl: Label '"  -  Directors"';
        OthersCaptionLbl: Label '"   -  Others"';
        Vehicle_MaintenanceCaptionLbl: Label 'Vehicle Maintenance';
        Works_TaxCaptionLbl: Label 'Works Tax';
        Professional_TaxCaptionLbl: Label 'Professional Tax';
        TOTAL_ADMINSTRATIVE___SELLING_EXP_CaptionLbl: Label 'TOTAL ADMINSTRATIVE & SELLING EXP.';
        ADMINISTRATIVE___SELLING_EXPENDITURECaptionLbl: Label 'ADMINISTRATIVE & SELLING EXPENDITURE';
        FINANCIAL_CHARGESCaption_Control1102154216Lbl: Label 'FINANCIAL CHARGES';
        Interest_on_Term_LoanCaptionLbl: Label 'Interest on Term Loan';
        Interest_on_Cash_Credit_a_cCaptionLbl: Label 'Interest on Cash Credit a/c';
        Interest_on_Unsecured_LoansCaptionLbl: Label 'Interest on Unsecured Loans';
        Interest_on_S_D__from_EmployeesCaptionLbl: Label 'Interest on S.D. from Employees';
        Bank_ChargesCaptionLbl: Label 'Bank Charges';
        Loan_Processing_chargesCaptionLbl: Label 'Loan Processing charges';
        Interest_on_statutory_taxesCaptionLbl: Label 'Interest on statutory taxes';
        TOTAL_FINANCIAL_CHARGESCaptionLbl: Label 'TOTAL FINANCIAL CHARGES';
        DepreciationCaption_Control1102154236Lbl: Label 'Depreciation';
        Amortisation_of_Misc__ExpensesCaptionLbl: Label 'Amortisation of Misc. Expenses';
        Works_TaxCaption_Control1102154238Lbl: Label 'Works Tax';
        Managerial_RemunerationCaption_Control1102154239Lbl: Label 'Managerial Remuneration';
}

