report 50139 "GSTR1 Sales"
{
    // version B2B1.0

    DefaultLayout = RDLC;
    RDLCLayout = './GSTR1 Sales.rdlc';
    Caption = 'GSTR1 Sales';

    dataset
    {
        dataitem(General; "Integer")
        {
            DataItemTableView = WHERE(Number = CONST(1));
            column(Number_General; General.Number)
            {
            }
            column(LocationErr; LocationErr)
            {
            }
            column(GSTIN_Caption; GSTIN_CaptionLbl)
            {
            }
            column(NameofTax_Caption; NameofTax_CaptionLbl)
            {
            }
            column(Period_Caption; Period_CaptionLbl)
            {
            }
            column(One_Caption; One_CaptionLbl)
            {
            }
            column(Two_Caption; Two_CaptionLbl)
            {
            }
            column(Three_Caption; Three_CaptionLbl)
            {
            }
            column(INSTRUCTIONS_Caption; INSTRUCTIONS_CaptionLbl)
            {
            }
            column(Ex_Caption; Ex_CaptionLbl)
            {
            }
            column(Avoid_Cut_Caption; Avoid_Cut_CaptionLbl)
            {
            }
            column(To_Enter_Caption; To_Enter_CaptionLbl)
            {
            }
            column(While_Pasting_Caption; While_Pasting_CaptionLbl)
            {
            }
            column(Before_any_Caption; Before_any_CaptionLbl)
            {
            }
            column(Avoid_using_Caption; Avoid_using_CaptionLbl)
            {
            }
            column(If_mandatory_Caption; If_mandatory_CaptionLbl)
            {
            }
            column(Option_Field_Caption; Option_Field_CaptionLbl)
            {
            }
            column(Mandatory_Field_Caption; Mandatory_Field_CaptionLbl)
            {
            }
            column(GeneralVisibility; GeneralVisibility)
            {
            }
            column(GSTIN; GSTIN)
            {
            }
            column(TaxablePerson; TaxablePerson)
            {
            }
            column(Period; Period)
            {
            }
            column(GeneralDate; GeneralDate)
            {
            }
            column(G1_Caption; G1_CaptionLbl)
            {
            }
            column(G2_Caption; G2_CaptionLbl)
            {
            }
            column(G3_Caption; G3_CaptionLbl)
            {
            }
            column(G4_Caption; G4_CaptionLbl)
            {
            }
            column(G5_Caption; G5_CaptionLbl)
            {
            }
            column(G6_Caption; G6_CaptionLbl)
            {
            }
            column(G7_Caption; G7_CaptionLbl)
            {
            }
            column(G8_Caption; G8_CaptionLbl)
            {
            }
            column(G9_Caption; G9_CaptionLbl)
            {
            }
            column(G10_Caption; G10_CaptionLbl)
            {
            }
            column(G11_Caption; G11_CaptionLbl)
            {
            }
            column(G12_Caption; G12_CaptionLbl)
            {
            }
            column(G13_Caption; G13_CaptionLbl)
            {
            }
            column(G14_Caption; G14_CaptionLbl)
            {
            }
            column(G15_Caption; G15_CaptionLbl)
            {
            }
            column(G16_Caption; G16_CaptionLbl)
            {
            }
            column(Notes_Caption; Notes_CaptionLbl)
            {
            }
            column(Taxable_Person_Caption; Taxable_Person_CaptionLbl)
            {
            }
            column(In_case_of_Caption; In_case_of_CaptionLbl)
            {
            }
            column(In_case_of_intra_Caption; In_case_of_intra_CaptionLbl)
            {
            }
            column(Taxable_outward_Caption; Taxable_outward_CaptionLbl)
            {
            }
            column(GSTIN_UID_Caption; GSTIN_UID_CaptionLbl)
            {
            }
            column(Party_Name_Caption; Party_Name_CaptionLbl)
            {
            }
            column(Invoice_Caption; Invoice_CaptionLbl)
            {
            }
            column(Number_Caption; Number_CaptionLbl)
            {
            }
            column(Date_Caption; Date_CaptionLbl)
            {
            }
            column(Value_Caption; Value_CaptionLbl)
            {
            }
            column(Taxable_Value_Caption; Taxable_Value_CaptionLbl)
            {
            }
            column(GST_Rate_Caption; GST_Rate_CaptionLbl)
            {
            }
            column(IGST_Caption; IGST_CaptionLbl)
            {
            }
            column(CGST_Caption; CGST_CaptionLbl)
            {
            }
            column(SGST_UTGST_Caption; SGST_UTGST_CaptionLbl)
            {
            }
            column(CESS_Caption; CESS_CaptionLbl)
            {
            }
            column(POS_only_if_Caption; POS_only_if_CaptionLbl)
            {
            }
            column(Reverse_Charge_Caption; Reverse_Charge_CaptionLbl)
            {
            }
            column(Indicate_supply_Caption; Indicate_supply_CaptionLbl)
            {
            }
            column(GSTIN_of_ecommerce_Caption; GSTIN_of_ecommerce_CaptionLbl)
            {
            }
            column(Original_Invoice_Caption; Original_Invoice_CaptionLbl)
            {
            }
            column(No_Caption; No_CaptionLbl)
            {
            }
            column(Amount_Caption; Amount_CaptionLbl)
            {
            }

            trigger OnAfterGetRecord();
            begin
                GeneralVisibility := TRUE;
            end;

            trigger OnPreDataItem();
            begin
                GeneralDate := DMY2DATE(1, Period, Year);
            end;
        }
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = SORTING(No.) ORDER(Ascending) WHERE(GST Customer Type=FILTER(<>Export));
            column(No_SalesInvoiceHeader;"Sales Invoice Header"."No.")
            {
            }
            column(Document_No;"No.")
            {
            }
            column(Customer_Name;"Sell-to Customer Name")
            {
            }
            column(PostingDate;"Posting Date")
            {
            }
            column(Amount_to_Customer;InvoiceValueTotal)
            {
            }
            column(ShipToCode;ShiptoCode)
            {
            }
            column(Customer_No;DetailedGSTLedgerEntry."Buyer/Seller Reg. No.")
            {
            }
            dataitem("Sales Invoice Line";"Sales Invoice Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = SORTING(Document No.,Line No.);
                column(DocumentNo_SalesInvoiceLine;"Sales Invoice Line"."Document No.")
                {
                }
                column(LineNo_SalesInvoiceLine;"Sales Invoice Line"."Line No.")
                {
                }
                column(SGSTAmount;SGSTAmount)
                {
                }
                column(CGSTAmount;CGSTAmount)
                {
                }
                column(IGSTAmount;IGSTAmount)
                {
                }
                column(CGSTRate;CGSTRate)
                {
                }
                column(SGSTRate;SGSTRate)
                {
                }
                column(IGSTRate;IGSTRate)
                {
                }
                column(IGSTTotal;IGSTTotal)
                {
                }
                column(CGSTTotal;CGSTTotal)
                {
                }
                column(SGSTTotal;SGSTTotal)
                {
                }
                column(GSTPertg;GSTPertg)
                {
                }
                column(GST_Pertge;DetailedGSTLedgerEntry."GST %")
                {
                }
                column(eCommOperatorGSTRegNo;DetailedGSTLedgerEntry."e-Comm. Operator GST Reg. No.")
                {
                }
                column(TaxableValue;"Sales Invoice Line"."GST Base Amount")
                {
                }
                column(N_Caption;N_CaptionLbl)
                {
                }
                column(InvoiceValueTotalGVar;InvoiceValueTotalGVar)
                {
                }

                trigger OnAfterGetRecord();
                begin
                    CLEAR(CGSTRate);
                    CLEAR(SGSTRate);
                    CLEAR(IGSTRate);
                    CLEAR(CGSTTotal);
                    CLEAR(SGSTTotal);
                    CLEAR(IGSTTotal);
                    CLEAR(CGSTAmount);
                    CLEAR(SGSTAmount);
                    CLEAR(IGSTAmount);
                    CLEAR(GSTPertg);
                    CLEAR(TaxableValueB2B);
                    CLEAR(GSTRegNo);
                    CLEAR(ShiptoCode);
                    CLEAR(InvoiceValueTotalGVar);
                    
                    IF IsGSTApplicable  THEN BEGIN
                      GSTComponent.RESET;
                      GSTComponent.SETRANGE("GST Jurisdiction Type","Sales Invoice Line"."GST Jurisdiction Type");
                      IF GSTComponent.FINDSET THEN
                        REPEAT
                          DetailedGSTLedgerEntry.RESET;
                          DetailedGSTLedgerEntry.SETCURRENTKEY("Transaction Type","Document Type","Document No.","Document Line No.");
                          DetailedGSTLedgerEntry.SETRANGE("Transaction Type",DetailedGSTLedgerEntry."Transaction Type"::Sales);
                          DetailedGSTLedgerEntry.SETRANGE("Document Type",DetailedGSTLedgerEntry."Document Type"::Invoice);
                          DetailedGSTLedgerEntry.SETRANGE("Document No.","Sales Invoice Line"."Document No.");
                          DetailedGSTLedgerEntry.SETRANGE("Document Line No.","Sales Invoice Line"."Line No.");
                          DetailedGSTLedgerEntry.SETRANGE("Entry Type",DetailedGSTLedgerEntry."Entry Type"::"Initial Entry");
                          DetailedGSTLedgerEntry.SETRANGE("GST Component Code",GSTComponent.Code);
                          IF DetailedGSTLedgerEntry.FINDSET THEN BEGIN
                            REPEAT
                              CASE DetailedGSTLedgerEntry."GST Component Code" OF
                                'IGST':
                                  BEGIN
                                    IGSTRate := DetailedGSTLedgerEntry."GST %";
                                    IGSTAmount := ABS(DetailedGSTLedgerEntry."GST Amount");
                                    IGSTTotal += IGSTAmount;
                                  END;
                                'CGST':
                                  BEGIN
                                    CGSTRate := DetailedGSTLedgerEntry."GST %";
                                    CGSTAmount := ABS(DetailedGSTLedgerEntry."GST Amount");
                                    CGSTTotal += CGSTAmount;
                                  END;
                                'SGST':
                                  BEGIN
                                    SGSTRate := DetailedGSTLedgerEntry."GST %";
                                    SGSTAmount := ABS(DetailedGSTLedgerEntry."GST Amount");
                                    SGSTTotal += SGSTAmount;
                                  END;
                              END;
                            UNTIL DetailedGSTLedgerEntry.NEXT = 0;
                          END;
                        UNTIL GSTComponent.NEXT = 0;
                      END;
                        GSTPertg := IGSTRate + CGSTRate + SGSTRate;
                        TaxableValueB2B += Amount + "Inv. Discount Amount";
                    
                    //B2B1.0>>
                    IF StateGRec.GET(DetailedGSTLedgerEntry."Buyer/Seller State Code") THEN
                      ShiptoCode := StateGRec."State Code (GST Reg. No.)"+'-'+StateGRec.Description;
                    //B2B1.0<<
                    
                    /*
                    IF SalesInvHeaderB2B."Ship-to Code"<> '' THEN BEGIN
                      ShiptoCodeGRec.RESET;
                      ShiptoCodeGRec.SETRANGE("Customer No.",SalesInvHeaderB2B."Sell-to Customer No.");
                      ShiptoCodeGRec.SETRANGE(Code,SalesInvHeaderB2B."Ship-to Code");
                      IF ShiptoCodeGRec.FINDFIRST THEN BEGIN
                        GSTRegNo := ShiptoCodeGRec."GST Registration No.";
                        IF StateGRec.GET(ShiptoCodeGRec.State) THEN
                          ShiptoCode := StateGRec."State Code (GST Reg. No.)"+'-'+StateGRec.Description;
                       END;
                    END
                    ELSE BEGIN
                      GSTRegNo := CustomerGRec."GST Registration No.";
                      IF StateGRec.GET(CustomerGRec."State Code") THEN
                        ShiptoCode := StateGRec."State Code (GST Reg. No.)"+'-'+StateGRec.Description;
                    END;
                    */
                    InvoiceValueTotalGVar := "Amount To Customer" + "TDS/TCS Amount";

                end;
            }

            trigger OnAfterGetRecord();
            begin
                CLEAR(InvoiceValueTotal);

                IsGSTApplicable := GSTManagement.IsGSTApplicable("Sales Invoice Header".Structure);

                SalesInvLine.RESET;
                SalesInvLine.SETRANGE("Document No.","Sales Invoice Header"."No.");
                SalesInvLine.SETFILTER("GST Group Code",'<>%1','');
                IF SalesInvLine.FINDSET THEN
                  REPEAT
                    InvoiceValueTotal += SalesInvLine."Amount To Customer" + SalesInvLine."TDS/TCS Amount";
                  UNTIL SalesInvLine.NEXT = 0;
            end;

            trigger OnPreDataItem();
            begin
                Exp := 'CM';
                MonthGVar := Period;
                FromDate := DMY2DATE(1,MonthGVar,Year);
                ToDate := CALCDATE(Exp,FromDate);

                SETRANGE("Posting Date",FromDate,ToDate);
                SETRANGE("Location Code",LocationCode);
            end;
        }
        dataitem(Export;"Integer")
        {
            DataItemTableView = SORTING(Number);
            column(Number_Export;Export.Number)
            {
            }
            column(IsGSTApplicableExp;IsGSTApplicableExp)
            {
            }
            column(ExportHeaderVisibility;ExportHeaderVisibility)
            {
            }
            column(Supplies_Exported_Caption;Supplies_Exported_CaptionLbl)
            {
            }
            column(Export_Type_Caption;Export_Type_CaptionLbl)
            {
            }
            column(GSTIN_Export_Caption;GSTIN_Export_CaptionLbl)
            {
            }
            column(Port_Code_Caption;Port_Code_CaptionLbl)
            {
            }
            column(Shipping_Bill_Caption;Shipping_Bill_CaptionLbl)
            {
            }
            column(ExportVisibility;ExportVisibility)
            {
            }
            column(G1_Export_Caption;G1_CaptionLbl)
            {
            }
            column(G2_Export_Caption;G2_CaptionLbl)
            {
            }
            column(G3_Export_Caption;G3_CaptionLbl)
            {
            }
            column(G4_Export_Caption;G4_CaptionLbl)
            {
            }
            column(G5_Export_Caption;G5_CaptionLbl)
            {
            }
            column(G6_Export_Caption;G6_CaptionLbl)
            {
            }
            column(G7_Export_Caption;G7_CaptionLbl)
            {
            }
            column(G8_Export_Caption;G8_CaptionLbl)
            {
            }
            column(G9_Export_Caption;G9_CaptionLbl)
            {
            }
            column(G10_Export_Caption;G10_CaptionLbl)
            {
            }
            column(G11_Export_Caption;G11_CaptionLbl)
            {
            }
            column(G12_Export_Caption;G12_CaptionLbl)
            {
            }
            column(G13_Export_Caption;G13_CaptionLbl)
            {
            }
            column(G14_Export_Caption;G14_CaptionLbl)
            {
            }
            column(Party_Name_Export_Caption;Party_Name_CaptionLbl)
            {
            }
            column(Invoice_Export_Caption;Invoice_CaptionLbl)
            {
            }
            column(Number_Export_Caption;Number_CaptionLbl)
            {
            }
            column(Date_Export_Caption;Date_CaptionLbl)
            {
            }
            column(Value_Export_Caption;Value_CaptionLbl)
            {
            }
            column(Taxable_Value_Export_Caption;Taxable_Value_CaptionLbl)
            {
            }
            column(GST_Rate_Export_Caption;GST_Rate_CaptionLbl)
            {
            }
            column(IGST_Export_Caption;IGST_CaptionLbl)
            {
            }
            column(Original_Invoice_Export_Caption;Original_Invoice_CaptionLbl)
            {
            }
            column(Amount_Export_Caption;Amount_CaptionLbl)
            {
            }
            column(Customer_No_Export;CustomerExpGRec."GST Registration No.")
            {
            }
            column(Customer_Name_Export;SalesInvHeaderExport."Sell-to Customer Name")
            {
            }
            column(GST_Pertge_Export;DetailedGSTLedgerEntry."GST %")
            {
            }
            column(Document_No_Export;SalesInvHeaderExport."No.")
            {
            }
            column(PostingDate_Export;SalesInvHeaderExport."Posting Date")
            {
            }
            column(Amount_to_Customer_Export;SalesInvHeaderExport."Amount to Customer")
            {
            }
            column(BillOfExportNo;SalesInvHeaderExport."Bill Of Export No.")
            {
            }
            column(BillOfExportDate;SalesInvHeaderExport."Bill Of Export Date")
            {
            }
            column(CGSTExpRate;CGSTExpRate)
            {
            }
            column(SGSTExpRate;SGSTExpRate)
            {
            }
            column(IGSTExpRate;IGSTExpRate)
            {
            }
            column(SGSTExpTotal;SGSTExpTotal)
            {
            }
            column(CGSTExpTotal;CGSTExpTotal)
            {
            }
            column(IGSTExpTotal;IGSTExpTotal)
            {
            }
            column(SGSTAmount_Export;ABS(SGSTExpAmount))
            {
            }
            column(CGSTAmount_Export;ABS(CGSTExpAmount))
            {
            }
            column(IGSTAmount_Export;ABS(IGSTExpAmount))
            {
            }
            column(ExportTypeGVar;ExportTypeGVar)
            {
            }
            column(TaxableValueExport;TaxableValueExport)
            {
            }

            trigger OnAfterGetRecord();
            begin
                CLEAR(CGSTExpTotal);
                CLEAR(SGSTExpTotal);
                CLEAR(IGSTExpTotal);
                CLEAR(CGSTExpRate);
                CLEAR(SGSTExpRate);
                CLEAR(IGSTExpRate);
                CLEAR(CGSTExpAmount);
                CLEAR(SGSTExpAmount);
                CLEAR(IGSTExpAmount);
                CLEAR(TaxableValueExport);
                
                IF Number = 1  THEN
                  ExportHeaderVisibility := TRUE
                ELSE
                  ExportHeaderVisibility := FALSE;
                ExportVisibility := TRUE;
                
                IF Number = 1 THEN
                  SalesInvHeaderExport.FINDFIRST
                ELSE
                  SalesInvHeaderExport.NEXT;
                SalesInvHeaderExport.CALCFIELDS("Amount to Customer");
                IsGSTApplicableExp := GSTManagement.IsGSTApplicable(SalesInvHeaderExport.Structure);
                
                IF CustomerExpGRec.GET(SalesInvHeaderExport."Sell-to Customer No.") THEN;
                SalesInvLine.RESET;
                SalesInvLine.SETRANGE("Document No.",SalesInvHeaderExport."No.");
                IF SalesInvLine.FINDSET THEN
                  REPEAT
                    IF IsGSTApplicableExp THEN BEGIN
                      GSTComponent.RESET;
                      GSTComponent.SETRANGE("GST Jurisdiction Type",SalesInvLine."GST Jurisdiction Type");
                      IF GSTComponent.FINDSET THEN
                        REPEAT
                          DetailedGSTLedgerEntry.RESET;
                          DetailedGSTLedgerEntry.SETCURRENTKEY("Transaction Type","Document Type","Document No.","Document Line No.");
                          DetailedGSTLedgerEntry.SETRANGE("Transaction Type",DetailedGSTLedgerEntry."Transaction Type"::Sales);
                          DetailedGSTLedgerEntry.SETRANGE("Document Type",DetailedGSTLedgerEntry."Document Type"::Invoice);
                          DetailedGSTLedgerEntry.SETRANGE("Document No.",SalesInvLine."Document No.");
                          DetailedGSTLedgerEntry.SETRANGE("Document Line No.",SalesInvLine."Line No.");
                          DetailedGSTLedgerEntry.SETRANGE("Entry Type",DetailedGSTLedgerEntry."Entry Type"::"Initial Entry");
                          DetailedGSTLedgerEntry.SETRANGE("GST Component Code",GSTComponent.Code);
                          IF DetailedGSTLedgerEntry.FINDSET THEN BEGIN
                            REPEAT
                              CASE DetailedGSTLedgerEntry."GST Component Code" OF
                                'IGST':
                                   BEGIN
                                     IGSTExpRate += DetailedGSTLedgerEntry."GST %";
                                     IGSTExpAmount := ABS(DetailedGSTLedgerEntry."GST Amount");
                                     IGSTExpTotal +=  IGSTExpAmount;
                                   END;
                                /*
                                'CGST':
                                   BEGIN
                                     CGSTExpRate := DetailedGSTLedgerEntry."GST %";
                                     CGSTExpAmount := ABS(DetailedGSTLedgerEntry."GST Amount");
                                     CGSTExpTotal := CGSTAmount;
                                   END;
                                'SGST':
                                   BEGIN
                                     SGSTExpRate := DetailedGSTLedgerEntry."GST %";
                                     SGSTExpAmount := ABS(DetailedGSTLedgerEntry."GST Amount");
                                     SGSTExpTotal := SGSTAmount;
                                   END;
                              */
                              END;
                            UNTIL DetailedGSTLedgerEntry.NEXT = 0;
                          END;
                        UNTIL GSTComponent.NEXT = 0;
                      END;
                    TaxableValueExport += SalesInvLine.Amount + SalesInvLine."Inv. Discount Amount";
                 UNTIL SalesInvLine.NEXT = 0;
                IF DetailedGSTLedgerEntry."GST Without Payment of Duty" THEN
                  ExportTypeGVar := 'With payment of GST'
                ELSE
                  ExportTypeGVar := 'Without payment of GST';

            end;

            trigger OnPreDataItem();
            begin
                SalesInvHeaderExport.RESET;
                SalesInvHeaderExport.SETRANGE("Posting Date",FromDate,ToDate);
                SalesInvHeaderExport.SETRANGE("Location Code",LocationCode);
                SalesInvHeaderExport.SETRANGE("Invoice Type",SalesInvHeaderExport."Invoice Type"::Export);
                IF SalesInvHeaderExport.FINDFIRST THEN
                  ExportVisibility := TRUE;
                SETRANGE(Export.Number,1,SalesInvHeaderExport.COUNT);
            end;
        }
        dataitem("Nil Rated";"Integer")
        {
            DataItemTableView = SORTING(Number);
            column(Number_NilRated;"Nil Rated".Number)
            {
            }
            column(Nilrated_Exempted_Caption;Nilrated_Exempted_CaptionLbl)
            {
            }
            column(figures_in_Rs_Caption;figures_in_Rs_CaptionLbl)
            {
            }
            column(Description_Caption;Description_CaptionLbl)
            {
            }
            column(Nil_Rated_Amount_Caption;Nil_Rated_Amount_CaptionLbl)
            {
            }
            column(Exempted_Amount_Caption;Exempted_Amount_CaptionLbl)
            {
            }
            column(NonGSTsupplies_Caption;NonGSTsupplies_CaptionLbl)
            {
            }
            column(Interstate_registered_Caption;Interstate_registered_CaptionLbl)
            {
            }
            column(Intrastate_registered_Caption;Intrastate_registered_CaptionLbl)
            {
            }
            column(Interstate_unregistered_Caption;Interstate_unregistered_CaptionLbl)
            {
            }
            column(Intrastate_unregistered_Caption;Intrastate_unregistered_CaptionLbl)
            {
            }
            column(NilRatedHeaderVisibility;NilRatedHeaderVisibility)
            {
            }
            column(NilRatedVisibility;NilRatedVisibility)
            {
            }
            column(IGSTNilRated;IGSTNilRated)
            {
            }
            column(ExemptedNilRated;ExemptedNilRated)
            {
            }
            column(ExemptedNilRatedIntra;ExemptedNilRatedIntra)
            {
            }
            column(IGSTNilRatedUnReg;IGSTNilRatedUnReg)
            {
            }
            column(ExemptedNilRatedUnReg;ExemptedNilRatedUnReg)
            {
            }
            column(ExemptedNilRatedIntraUnReg;ExemptedNilRatedIntraUnReg)
            {
            }
            column(IntraStateReg;IntraStateReg)
            {
            }
            column(IntraStateUnReg;IntraStateUnReg)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF Number = 1 THEN
                  NilRatedHeaderVisibility := TRUE
                ELSE
                  NilRatedHeaderVisibility := FALSE;
                NilRatedVisibility := TRUE;

                IF Number = 1 THEN
                  SalesInvoiceHeaderNilRated.FINDFIRST
                ELSE
                  SalesInvoiceHeaderNilRated.NEXT;
                IsGSTApplicableExp := GSTManagement.IsGSTApplicable(SalesInvoiceHeaderNilRated.Structure);

                SalesInvLine.RESET;
                SalesInvLine.SETRANGE("Document No.",SalesInvoiceHeaderNilRated."No.");
                IF SalesInvLine.FINDSET THEN
                  REPEAT
                    IF IsGSTApplicableExp THEN BEGIN
                      GSTComponent.RESET;
                      GSTComponent.SETRANGE("GST Jurisdiction Type",SalesInvLine."GST Jurisdiction Type");
                      IF GSTComponent.FINDSET THEN
                        REPEAT
                          DetailedGSTLedgerEntry.RESET;
                          DetailedGSTLedgerEntry.SETCURRENTKEY("Transaction Type","Document Type","Document No.","Document Line No.");
                          DetailedGSTLedgerEntry.SETRANGE("Transaction Type",DetailedGSTLedgerEntry."Transaction Type"::Sales);
                          DetailedGSTLedgerEntry.SETRANGE("Document Type",DetailedGSTLedgerEntry."Document Type"::Invoice);
                          DetailedGSTLedgerEntry.SETRANGE("Document No.",SalesInvLine."Document No.");
                          DetailedGSTLedgerEntry.SETRANGE("Document Line No.",SalesInvLine."Line No.");
                          DetailedGSTLedgerEntry.SETRANGE("Entry Type",DetailedGSTLedgerEntry."Entry Type"::"Initial Entry");
                          DetailedGSTLedgerEntry.SETRANGE("GST Component Code",GSTComponent.Code);
                          IF DetailedGSTLedgerEntry.FINDSET THEN BEGIN
                            REPEAT
                              CASE DetailedGSTLedgerEntry."GST Component Code" OF
                                'IGST':
                                   BEGIN
                                     IGSTExpRate += DetailedGSTLedgerEntry."GST %";
                                     IGSTExpAmount += ABS(DetailedGSTLedgerEntry."GST Amount");
                                     IGSTExpTotal :=  IGSTExpAmount;
                                   END;
                                'CGST':
                                  BEGIN
                                    CGSTExpRate := DetailedGSTLedgerEntry."GST %";
                                    CGSTExpAmount += ABS(DetailedGSTLedgerEntry."GST Amount");
                                    CGSTExpTotal := CGSTAmount;
                                  END;
                                'SGST':
                                  BEGIN
                                    SGSTExpRate := DetailedGSTLedgerEntry."GST %";
                                    SGSTExpAmount += ABS(DetailedGSTLedgerEntry."GST Amount");
                                    SGSTExpTotal := SGSTAmount;
                                  END;
                              END;
                          IF (DetailedGSTLedgerEntry."GST Component Code"<>'CGST') AND (DetailedGSTLedgerEntry."GST Component Code"<>'SGST') AND (DetailedGSTLedgerEntry."GST Customer Type" = DetailedGSTLedgerEntry."GST Customer Type"::Registered) THEN BEGIN
                             IGSTNilRated := IGSTExpTotal;
                             ExemptedNilRated += ABS(DetailedGSTLedgerEntry."GST Base Amount");
                          END
                          ELSE IF (DetailedGSTLedgerEntry."GST Component Code"<>'CGST') AND (DetailedGSTLedgerEntry."GST Component Code"<>'SGST') AND (DetailedGSTLedgerEntry."GST Customer Type" = DetailedGSTLedgerEntry."GST Customer Type"::Unregistered) THEN
                          BEGIN
                             IGSTNilRatedUnReg := IGSTExpTotal;
                             ExemptedNilRatedUnReg += ABS(DetailedGSTLedgerEntry."GST Base Amount");
                          END
                          ELSE IF (DetailedGSTLedgerEntry."GST Component Code"<>'IGST') AND (DetailedGSTLedgerEntry."GST Customer Type" = DetailedGSTLedgerEntry."GST Customer Type"::Registered) THEN BEGIN
                            IntraStateReg := CGSTExpTotal + SGSTExpTotal;
                            ExemptedNilRatedIntra := ABS(DetailedGSTLedgerEntry."GST Base Amount");
                          END
                          ELSE IF (DetailedGSTLedgerEntry."GST Component Code"<>'IGST') AND (DetailedGSTLedgerEntry."GST Customer Type" = DetailedGSTLedgerEntry."GST Customer Type"::Unregistered) THEN BEGIN
                            IntraStateUnReg := CGSTExpTotal + SGSTExpTotal;
                            ExemptedNilRatedIntraUnReg := ABS(DetailedGSTLedgerEntry."GST Base Amount");
                          END;

                            UNTIL DetailedGSTLedgerEntry.NEXT = 0;
                          END;
                        UNTIL GSTComponent.NEXT = 0;
                      END;
                   UNTIL SalesInvLine.NEXT = 0;
            end;

            trigger OnPreDataItem();
            begin
                SalesInvoiceHeaderNilRated.RESET;
                SalesInvoiceHeaderNilRated.SETRANGE("Posting Date",FromDate,ToDate);
                SalesInvoiceHeaderNilRated.SETRANGE("Location Code",LocationCode);
                SalesInvoiceHeaderNilRated.SETFILTER("Invoice Type",'<>%1',SalesInvoiceHeaderNilRated."Invoice Type"::Export);
                IF SalesInvoiceHeaderNilRated.FINDFIRST THEN
                  NilRatedVisibility := TRUE;
                SETRANGE("Nil Rated".Number,1,SalesInvoiceHeaderNilRated.COUNT);

                DetailedGSTLedgerEntry.RESET;
                DetailedGSTLedgerEntry.SETFILTER("GST Group Code",'=%1','');
                IF DetailedGSTLedgerEntry.FINDSET THEN;

                CLEAR(CGSTRate);
                CLEAR(SGSTRate);
                CLEAR(IGSTRate);
                CLEAR(CGSTAmount);
                CLEAR(SGSTAmount);
                CLEAR(IGSTAmount);
                CLEAR(SGSTTotal);
                CLEAR(CGSTTotal);
                CLEAR(IGSTTotal);
                CLEAR(IGSTNilRated);
                CLEAR(ExemptedNilRated);
                CLEAR(ExemptedNilRatedIntra);
                CLEAR(IGSTNilRatedUnReg);
                CLEAR(ExemptedNilRatedUnReg);
                CLEAR(ExemptedNilRatedIntraUnReg);
                CLEAR(IntraStateReg);
                CLEAR(IntraStateUnReg);
            end;
        }
        dataitem("Cr.Dr";"Integer")
        {
            DataItemTableView = SORTING(Number);
            column(CrDr_GSTNo;CustomerGRec."GST Registration No.")
            {
            }
            column(PurchCrMemoHdr_Vendor_Name;SalesCrMemoHeader."Sell-to Customer Name")
            {
            }
            column(PurchCrMemoHdr_Posting_Date;SalesCrMemoHeader."Posting Date")
            {
            }
            column(CrDr_DocumentNo;SalesCrMemoHeader."No.")
            {
            }
            column(GST_Pertge_CrDr;DetailedGSTLedgerEntry."GST %")
            {
            }
            column(Number_CrDr;"Cr.Dr".Number)
            {
            }
            column(Note_Caption;Note_CaptionLbl)
            {
            }
            column(Information_about_Caption;Information_about_CaptionLbl)
            {
            }
            column(Details_of_Caption;Details_of_CaptionLbl)
            {
            }
            column(Typeofnote_Caption;Typeofnote_CaptionLbl)
            {
            }
            column(Credit_Note_Caption;Credit_Note_CaptionLbl)
            {
            }
            column(Reason_Caption;Reason_CaptionLbl)
            {
            }
            column(PreGST_Caption;PreGST_CaptionLbl)
            {
            }
            column(PlaceofSupply_Caption;PlaceofSupply_CaptionLbl)
            {
            }
            column(Supplier_InvoiceValue_Caption;Supplier_InvoiceValue_CaptionLbl)
            {
            }
            column(TaxAmount_Caption;TaxAmount_CaptionLbl)
            {
            }
            column(Original_Credit_Caption;Original_Credit_CaptionLbl)
            {
            }
            column(C1_Cr_Caption;G1_CaptionLbl)
            {
            }
            column(C2_Cr_Caption;G2_CaptionLbl)
            {
            }
            column(C3_Cr_Caption;G3_CaptionLbl)
            {
            }
            column(C4_Cr_Caption;G4_CaptionLbl)
            {
            }
            column(C5_Cr_Caption;G5_CaptionLbl)
            {
            }
            column(C6_Cr_Caption;G6_CaptionLbl)
            {
            }
            column(C7_Cr_Caption;G7_CaptionLbl)
            {
            }
            column(C8_Cr_Caption;G8_CaptionLbl)
            {
            }
            column(C9_Cr_Caption;G9_CaptionLbl)
            {
            }
            column(C10_Cr_Caption;G10_CaptionLbl)
            {
            }
            column(C11_Cr_Caption;G11_CaptionLbl)
            {
            }
            column(C12_Cr_Caption;G12_CaptionLbl)
            {
            }
            column(C13_Cr_Caption;G13_CaptionLbl)
            {
            }
            column(C14_Cr_Caption;G14_CaptionLbl)
            {
            }
            column(C15_Cr_Caption;G15_CaptionLbl)
            {
            }
            column(C16_Cr_Caption;G16_CaptionLbl)
            {
            }
            column(C17_Cr_Caption;C17_CaptionLbl)
            {
            }
            column(C18_Cr_Caption;C18_CaptionLbl)
            {
            }
            column(C19_Cr_Caption;C19_CaptionLbl)
            {
            }
            column(GSTIN_UID_Cr_Caption;GSTIN_UID_CaptionLbl)
            {
            }
            column(Party_Name_Cr_Caption;Party_Name_CaptionLbl)
            {
            }
            column(Number_CrCaption;Number_CaptionLbl)
            {
            }
            column(Date_Cr_Caption;Date_CaptionLbl)
            {
            }
            column(Value_Cr_Caption;Value_CaptionLbl)
            {
            }
            column(Taxable_Value_Cr_Caption;Taxable_Value_CaptionLbl)
            {
            }
            column(GST_Rate_Cr_Caption;GST_Rate_CaptionLbl)
            {
            }
            column(IGST_Cr_Caption;IGST_CaptionLbl)
            {
            }
            column(CGST_Cr_Caption;CGST_CaptionLbl)
            {
            }
            column(SGST_UTGST_Cr_Caption;SGST_UTGST_CaptionLbl)
            {
            }
            column(CESS_Cr_Caption;CESS_CaptionLbl)
            {
            }
            column(Original_Invoice_Cr_Caption;Original_Invoice_CrDr_CaptionLbl)
            {
            }
            column(Amount_Cr_Caption;Amount_CaptionLbl)
            {
            }
            column(CrDrRegisterVisibility;CrDrRegisterVisibility)
            {
            }
            column(CrDrRegisterHeaderVisibility;CrDrRegisterHeaderVisibility)
            {
            }
            column(SGSTAmount_CrDr;ABS(SGSTAmount))
            {
            }
            column(CGSTAmount_CrDr;ABS(CGSTAmount))
            {
            }
            column(IGSTAmount_CrDr;ABS(IGSTAmount))
            {
            }
            column(CGSTRate_CrDr;CGSTRate)
            {
            }
            column(SGSTRate_CrDr;SGSTRate)
            {
            }
            column(IGSTRate_CrDr;IGSTRate)
            {
            }
            column(IGSTTotal_CrDr;IGSTTotal)
            {
            }
            column(CGSTTotal_CrDr;CGSTTotal)
            {
            }
            column(SGSTTotal_CrDr;SGSTTotal)
            {
            }
            column(PurchCrMemoHdr_COUNT;SalesCrMemoHeader.COUNT)
            {
            }

            trigger OnAfterGetRecord();
            begin
                CLEAR(CGSTRate);
                CLEAR(SGSTRate);
                CLEAR(IGSTRate);
                CLEAR(CGSTTotal);
                CLEAR(SGSTTotal);
                CLEAR(IGSTTotal);
                CLEAR(CGSTAmount);
                CLEAR(SGSTAmount);
                CLEAR(IGSTAmount);

                IF Number = 1 THEN
                  CrDrRegisterHeaderVisibility := TRUE
                ELSE
                  CrDrRegisterHeaderVisibility := FALSE;
                  CrDrRegisterVisibility := TRUE;
                IF Number = 1 THEN
                  SalesCrMemoHeader.FINDFIRST
                ELSE
                  SalesCrMemoHeader.NEXT;

                IsGSTApplicableCrDr := GSTManagement.IsGSTApplicable(SalesCrMemoHeader.Structure);
                IF CustomerGRec.GET(SalesCrMemoHeader."Sell-to Customer No.") THEN;

                SalesCrMemoLine.RESET;
                SalesCrMemoLine.SETRANGE("Document No.",SalesCrMemoHeader."No.");
                IF SalesCrMemoLine.FINDSET THEN
                  REPEAT
                    IF IsGSTApplicableCrDr  THEN BEGIN
                      GSTComponent.RESET;
                      GSTComponent.SETRANGE("GST Jurisdiction Type",SalesCrMemoLine."GST Jurisdiction Type");
                      IF GSTComponent.FINDSET THEN
                        REPEAT
                          DetailedGSTLedgerEntry.RESET;
                          DetailedGSTLedgerEntry.SETCURRENTKEY("Transaction Type","Document Type","Document No.","Document Line No.");
                          DetailedGSTLedgerEntry.SETRANGE("Transaction Type",DetailedGSTLedgerEntry."Transaction Type"::Sales);
                          DetailedGSTLedgerEntry.SETRANGE("Document Type",DetailedGSTLedgerEntry."Document Type"::"Credit Memo");
                          DetailedGSTLedgerEntry.SETRANGE("Document No.",SalesCrMemoLine."Document No.");
                          DetailedGSTLedgerEntry.SETRANGE("Document Line No.",SalesCrMemoLine."Line No.");
                          DetailedGSTLedgerEntry.SETRANGE("GST Component Code",GSTComponent.Code);
                          IF DetailedGSTLedgerEntry.FINDSET THEN BEGIN
                            REPEAT
                              CASE DetailedGSTLedgerEntry."GST Component Code" OF
                              'IGST':
                                BEGIN
                                  IGSTRate := DetailedGSTLedgerEntry."GST %";
                                  IGSTAmount := ABS(DetailedGSTLedgerEntry."GST Amount");
                                  IGSTTotal += IGSTAmount;
                                END;
                              'CGST':
                                BEGIN
                                  CGSTRate := DetailedGSTLedgerEntry."GST %";
                                  CGSTAmount := ABS(DetailedGSTLedgerEntry."GST Amount");
                                  CGSTTotal += CGSTAmount;
                                END;
                              'SGST':
                                BEGIN
                                  SGSTRate := DetailedGSTLedgerEntry."GST %";
                                  SGSTAmount := ABS(DetailedGSTLedgerEntry."GST Amount");
                                  SGSTTotal += SGSTAmount;
                                END;
                              END;
                            UNTIL DetailedGSTLedgerEntry.NEXT = 0;
                          END;
                        UNTIL GSTComponent.NEXT = 0;
                      END;
                    UNTIL SalesCrMemoLine.NEXT = 0;
            end;

            trigger OnPreDataItem();
            begin
                SalesCrMemoHeader.RESET;
                SalesCrMemoHeader.SETRANGE("Posting Date",FromDate,ToDate);
                SalesCrMemoHeader.SETRANGE("Location Code",LocationCode);
                //SalesCrMemoHeader.SETRANGE("GST Customer Type",SalesCrMemoHeader."GST Customer Type"::Registered);
                IF SalesCrMemoHeader.FINDFIRST THEN
                  CrDrRegisterVisibility := TRUE;
                SETRANGE("Cr.Dr".Number,1,SalesCrMemoHeader.COUNT);
            end;
        }
        dataitem("Cr.Dr Unregistered";"Integer")
        {
            DataItemTableView = SORTING(Number);
            column(Number_CrDrUnregistered;"Cr.Dr Unregistered".Number)
            {
            }
            column(CrDrUnRegisterVisibility;CrDrUnRegisterVisibility)
            {
            }
            column(CrDrUnRegisterHeaderVisibility;CrDrUnRegisterHeaderVisibility)
            {
            }
            column(GST_Pertg;DetailedGSTLedgerEntry."GST %")
            {
            }
            column(CrDr_Unreg_DocumentNo;SalesCrMemoHeaderUnreg."No.")
            {
            }
            column(PurchCrMemoHdr_Unreg_Vendor_Name;SalesCrMemoHeaderUnreg."Sell-to Customer Name")
            {
            }
            column(PurchCrMemoHdr_Unreg_Posting_Date;SalesCrMemoHeaderUnreg."Posting Date")
            {
            }
            column(SGSTAmount_CrDr_Unreg;ABS(SGSTAmount))
            {
            }
            column(CGSTAmount_CrDr_Unreg;ABS(CGSTAmount))
            {
            }
            column(IGSTAmount_CrDr_Unreg;ABS(IGSTAmount))
            {
            }
            column(CGSTRate_CrDr_Unreg;CGSTRate)
            {
            }
            column(SGSTRate_CrDr_Unreg;SGSTRate)
            {
            }
            column(IGSTRate_CrDr_Unreg;IGSTRate)
            {
            }
            column(IGSTTotal_CrDr_Unreg;IGSTTotal)
            {
            }
            column(CGSTTotal_CrDr_Unreg;CGSTTotal)
            {
            }
            column(SGSTTotal_CrDr_Unreg;SGSTTotal)
            {
            }
            column(Note_Unreg_Caption;Note_CaptionLbl)
            {
            }
            column(Information_about_Unreg_Caption;Information_about_CaptionLbl)
            {
            }
            column(DetailsofUnReg_Caption;DetailsofUnReg_CaptionLbl)
            {
            }
            column(Type_Unreg_Caption;Type_CaptionLbl)
            {
            }
            column(Typeofnote_Unreg_Caption;Typeofnote_CaptionLbl)
            {
            }
            column(Credit_Note_Unreg_Caption;Credit_Note_CaptionLbl)
            {
            }
            column(Reason_Unreg_Caption;Reason_CaptionLbl)
            {
            }
            column(PreGST_Unreg_Caption;PreGST_CaptionLbl)
            {
            }
            column(PlaceofSupply_Unreg_Caption;PlaceofSupply_CaptionLbl)
            {
            }
            column(Supplier_InvoiceValue_Unreg_Caption;Supplier_InvoiceValue_CaptionLbl)
            {
            }
            column(TaxAmount_Unreg_Caption;TaxAmount_CaptionLbl)
            {
            }
            column(Original_Credit_Unreg_Caption;Original_Credit_CaptionLbl)
            {
            }
            column(C1_Cr_Unreg_Caption;G1_CaptionLbl)
            {
            }
            column(C2_Cr_Unreg_Caption;G2_CaptionLbl)
            {
            }
            column(C3_Cr_Unreg_Caption;G3_CaptionLbl)
            {
            }
            column(C4_Cr_Unreg_Caption;G4_CaptionLbl)
            {
            }
            column(C5_Cr_Unreg_Caption;G5_CaptionLbl)
            {
            }
            column(C6_Cr_Unreg_Caption;G6_CaptionLbl)
            {
            }
            column(C7_Cr_Unreg_Caption;G7_CaptionLbl)
            {
            }
            column(C8_Cr_Unreg_Caption;G8_CaptionLbl)
            {
            }
            column(C9_Cr_Unreg_Caption;G9_CaptionLbl)
            {
            }
            column(C10_Cr_Unreg_Caption;G10_CaptionLbl)
            {
            }
            column(C11_Cr_Unreg_Caption;G11_CaptionLbl)
            {
            }
            column(C12_Cr_Unreg_Caption;G12_CaptionLbl)
            {
            }
            column(C13_Cr_Unreg_Caption;G13_CaptionLbl)
            {
            }
            column(C14_Cr_Unreg_Caption;G14_CaptionLbl)
            {
            }
            column(C15_Cr_Unreg_Caption;G15_CaptionLbl)
            {
            }
            column(Party_Name_Unreg_Caption;Party_Name_CaptionLbl)
            {
            }
            column(Number_Un_Caption;Number_CaptionLbl)
            {
            }
            column(Date__Un_Caption;Date_CaptionLbl)
            {
            }
            column(Value_Un_Caption;Value_CaptionLbl)
            {
            }
            column(Taxable_Value_Un_Caption;Taxable_Value_CaptionLbl)
            {
            }
            column(GST_Rate_Un_Caption;GST_Rate_CaptionLbl)
            {
            }
            column(IGST_Un_Caption;IGST_CaptionLbl)
            {
            }
            column(Original_Invoice_Cr_Unreg_Caption;Original_Invoice_CrDr_CaptionLbl)
            {
            }
            column(Amount_Cr_Unreg_Caption;Amount_CaptionLbl)
            {
            }

            trigger OnAfterGetRecord();
            begin
                CLEAR(CGSTRate);
                CLEAR(SGSTRate);
                CLEAR(IGSTRate);
                CLEAR(CGSTTotal);
                CLEAR(SGSTTotal);
                CLEAR(IGSTTotal);
                CLEAR(CGSTAmount);
                CLEAR(SGSTAmount);
                CLEAR(IGSTAmount);

                IF Number = 1 THEN
                  CrDrUnRegisterHeaderVisibility := TRUE
                ELSE
                  CrDrUnRegisterHeaderVisibility := FALSE;
                  CrDrUnRegisterVisibility := TRUE;

                IF Number = 1 THEN
                  SalesCrMemoHeaderUnreg.FINDFIRST
                ELSE
                 SalesCrMemoHeaderUnreg.NEXT;

                IsGSTApplicable := GSTManagement.IsGSTApplicable(SalesCrMemoHeaderUnreg.Structure);
                IF CustomerGRec.GET(SalesCrMemoHeaderUnreg."Sell-to Customer No.") THEN;

                IF IsGSTApplicable  THEN BEGIN
                  GSTComponent.RESET;
                  GSTComponent.SETRANGE("GST Jurisdiction Type",SalesCrMemoLine."GST Jurisdiction Type");
                  IF GSTComponent.FINDSET THEN
                    REPEAT
                      DetailedGSTLedgerEntry.RESET;
                      DetailedGSTLedgerEntry.SETCURRENTKEY("Transaction Type","Document Type","Document No.","Document Line No.");
                      DetailedGSTLedgerEntry.SETRANGE("Transaction Type",DetailedGSTLedgerEntry."Transaction Type"::Sales);
                      DetailedGSTLedgerEntry.SETRANGE("Document Type",DetailedGSTLedgerEntry."Document Type"::"Credit Memo");
                      DetailedGSTLedgerEntry.SETRANGE("Document No.",SalesCrMemoLine."Document No.");
                      DetailedGSTLedgerEntry.SETRANGE("Document Line No.",SalesCrMemoLine."Line No.");
                      DetailedGSTLedgerEntry.SETRANGE("GST Component Code",GSTComponent.Code);
                      IF DetailedGSTLedgerEntry.FINDSET THEN BEGIN
                        REPEAT
                          CASE DetailedGSTLedgerEntry."GST Component Code" OF
                            'IGST':
                              BEGIN
                                IGSTRate := DetailedGSTLedgerEntry."GST %";
                                IGSTAmount := ABS(DetailedGSTLedgerEntry."GST Amount");
                                IGSTTotal += IGSTAmount;
                              END;
                            'CGST':
                              BEGIN
                                CGSTRate := DetailedGSTLedgerEntry."GST %";
                                CGSTAmount := ABS(DetailedGSTLedgerEntry."GST Amount");
                                CGSTTotal += CGSTAmount;
                              END;
                            'SGST':
                              BEGIN
                                SGSTRate := DetailedGSTLedgerEntry."GST %";
                                SGSTAmount := ABS(DetailedGSTLedgerEntry."GST Amount");
                                SGSTTotal += SGSTAmount;
                              END;
                          END;
                        UNTIL DetailedGSTLedgerEntry.NEXT = 0;
                      END;
                    UNTIL GSTComponent.NEXT = 0;
                 END;
            end;

            trigger OnPreDataItem();
            begin
                SalesCrMemoHeaderUnreg.RESET;
                SalesCrMemoHeaderUnreg.SETRANGE("Posting Date",FromDate,ToDate);
                SalesCrMemoHeaderUnreg.SETRANGE("Location Code",LocationCode);
                //SalesCrMemoHeaderUnreg.SETRANGE("GST Customer Type",SalesCrMemoHeaderUnReg."GST Customer Type"::Unregistered);
                IF SalesCrMemoHeaderUnreg.FINDSET THEN
                  CrDrUnRegisterVisibility := TRUE;
                SETRANGE("Cr.Dr Unregistered".Number,1,SalesCrMemoHeaderUnreg.COUNT);
            end;
        }
        dataitem("Advance Received";"Integer")
        {
            DataItemTableView = SORTING(Number);
            column(Number_AdvanceReceived;"Advance Received".Number)
            {
            }
            column(AdvanceReceivedVisibility;AdvanceReceivedVisibility)
            {
            }
            column(AdvanceReceivedHeaderVisibility;AdvanceReceivedHeaderVisibility)
            {
            }
            column(Advance_amount_Caption;Advance_amount_CaptionLbl)
            {
            }
            column(TAX_Paid_Caption;TAX_Paid_CaptionLbl)
            {
            }
            column(Supply_Type_Caption;Supply_Type_CaptionLbl)
            {
            }
            column(Place_of_Supply_Adavance_Caption;Place_of_Supply_Adavance_CaptionLbl)
            {
            }
            column(Advance_Caption;Advance_CaptionLbl)
            {
            }
            column(Month_Caption;Month_CaptionLbl)
            {
            }
            column(GST_Rate_Adv_Caption;GST_Rate_Adv_CaptionLbl)
            {
            }
            column(OriginalDetails_Caption;OriginalDetails_CaptionLbl)
            {
            }
            column(IGST_Adv_Caption;IGST_Adv_CaptionLbl)
            {
            }
            column(CGST_Adv_Caption;CGST_Adv_CaptionLbl)
            {
            }
            column(SGST_Adv_UTGST_Caption;SGST_Adv_UTGST_CaptionLbl)
            {
            }
            column(CESS_Adv_Caption;CESS_Adv_CaptionLbl)
            {
            }
            column(G1_Adv_Caption;G1_Adv_CaptionLbl)
            {
            }
            column(G2_Adv_Caption;G2_Adv_CaptionLbl)
            {
            }
            column(G3_Adv_Caption;G3_Adv_CaptionLbl)
            {
            }
            column(G4_Adv_Caption;G4_Adv_CaptionLbl)
            {
            }
            column(G5_Adv_Caption;G5_Adv_CaptionLbl)
            {
            }
            column(G6_Adv_Caption;G6_Adv_CaptionLbl)
            {
            }
            column(G7_Adv_Caption;G7_Adv_CaptionLbl)
            {
            }
            column(G8_Adv_Caption;G8_Adv_CaptionLbl)
            {
            }
            column(G9_Adv_Caption;G9_Adv_CaptionLbl)
            {
            }
            column(Figures_Caption;Figures_CaptionLbl)
            {
            }
            column(Adv_SGSTAmount;SGSTAmount)
            {
            }
            column(Adv_CGSTAmount;CGSTAmount)
            {
            }
            column(Adv_IGSTAmount;IGSTAmount)
            {
            }
            column(Adv_CGSTRate;CGSTRate)
            {
            }
            column(Adv_SGSTRate;SGSTRate)
            {
            }
            column(Adv_IGSTRate;IGSTRate)
            {
            }
            column(Adv_IGSTTotal;IGSTTotal)
            {
            }
            column(Adv_CGSTTotal;CGSTTotal)
            {
            }
            column(Adv_SGSTTotal;SGSTTotal)
            {
            }
            column(Adv_GSTPertg;GSTPertg)
            {
            }
            column(Amount_Adv_Caption;Amount_Adv_CaptionLbl)
            {
            }
            column(GSTJurisdictionType;CustLedgerEntry."GST Jurisdiction Type")
            {
            }
            column(AdvanceStateDesc;AdvanceStateDesc)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF Number = 1 THEN
                  AdvanceReceivedHeaderVisibility := TRUE
                ELSE
                  AdvanceReceivedHeaderVisibility := FALSE;
                AdvanceReceivedVisibility := TRUE;

                IF Number = 1 THEN
                  CustLedgerEntry.FINDFIRST
                ELSE
                  CustLedgerEntry.NEXT;

                IF StateGRec.GET(CustLedgerEntry."Seller State Code") THEN
                  AdvanceStateDesc := StateGRec.Description;
                  GSTComponent.RESET;
                  GSTComponent.SETRANGE("GST Jurisdiction Type",CustLedgerEntry."GST Jurisdiction Type");
                  IF GSTComponent.FINDSET THEN
                    REPEAT
                      DetailedGSTLedgerEntry.RESET;
                      DetailedGSTLedgerEntry.SETCURRENTKEY("Transaction Type","Document Type","Document No.");
                      DetailedGSTLedgerEntry.SETRANGE("Transaction Type",DetailedGSTLedgerEntry."Transaction Type"::Sales);
                      DetailedGSTLedgerEntry.SETRANGE("Document Type",DetailedGSTLedgerEntry."Document Type"::Payment);
                      DetailedGSTLedgerEntry.SETRANGE("Document No.",CustLedgerEntry."Document No.");
                      DetailedGSTLedgerEntry.SETRANGE("Entry Type",DetailedGSTLedgerEntry."Entry Type"::"Initial Entry");
                      DetailedGSTLedgerEntry.SETRANGE("GST Component Code",GSTComponent.Code);
                      IF DetailedGSTLedgerEntry.FINDSET THEN BEGIN
                        REPEAT
                          CASE DetailedGSTLedgerEntry."GST Component Code" OF
                            'IGST':
                              BEGIN
                                IGSTRate := DetailedGSTLedgerEntry."GST %";
                                IGSTAmount := ABS(DetailedGSTLedgerEntry."GST Amount");
                                IGSTTotal += IGSTAmount;
                              END;
                            'CGST':
                              BEGIN
                                CGSTRate := DetailedGSTLedgerEntry."GST %";
                                CGSTAmount := ABS(DetailedGSTLedgerEntry."GST Amount");
                                CGSTTotal += CGSTAmount;
                              END;
                            'SGST':
                              BEGIN
                                SGSTRate := DetailedGSTLedgerEntry."GST %";
                                SGSTAmount := ABS(DetailedGSTLedgerEntry."GST Amount");
                                SGSTTotal += SGSTAmount;
                              END;
                          END;
                        UNTIL DetailedGSTLedgerEntry.NEXT = 0;
                     END;
                     GSTPertg := IGSTRate + CGSTRate + SGSTRate;
                  UNTIL GSTComponent.NEXT = 0;
            end;

            trigger OnPreDataItem();
            begin
                CustLedgerEntry.RESET;
                CustLedgerEntry.SETRANGE("Posting Date",FromDate,ToDate);
                CustLedgerEntry.SETRANGE("Location Code",LocationCode);
                CustLedgerEntry.SETRANGE("GST on Advance Payment",TRUE);
                CustLedgerEntry.SETRANGE(Open,TRUE);
                IF CustLedgerEntry.FINDFIRST THEN
                  AdvanceReceivedVisibility := TRUE;
                SETRANGE("Advance Received".Number,1,CustLedgerEntry.COUNT);

                CLEAR(CGSTRate);
                CLEAR(SGSTRate);
                CLEAR(IGSTRate);
                CLEAR(CGSTTotal);
                CLEAR(SGSTTotal);
                CLEAR(IGSTTotal);
                CLEAR(CGSTAmount);
                CLEAR(SGSTAmount);
                CLEAR(IGSTAmount);
                CLEAR(GSTPertg);
            end;
        }
        dataitem("Advance Adjusted";"Integer")
        {
            DataItemTableView = SORTING(Number);
            column(Number_AdvanceAdjusted;"Advance Adjusted".Number)
            {
            }
            column(AdvanceAdjustedVisibility;AdvanceAdjustedVisibility)
            {
            }
            column(AdvanceAdjustedHeaderVisibility;AdvanceAdjustedHeaderVisibility)
            {
            }
            column(Amount_AdvAdj_Caption;Amount_CaptionLbl)
            {
            }
            column(Figures_Adv_CaptionLbl;Figures_CaptionLbl)
            {
            }
            column(G1_AdvAdj_Caption;G1_Adv_CaptionLbl)
            {
            }
            column(G2_AdvAdj_Caption;G2_Adv_CaptionLbl)
            {
            }
            column(G3_AdvAdj_Caption;G3_Adv_CaptionLbl)
            {
            }
            column(G4_AdvAdj_Caption;G4_Adv_CaptionLbl)
            {
            }
            column(G5_AdvAdj_Caption;G5_Adv_CaptionLbl)
            {
            }
            column(G6_AdvAdj_Caption;G6_Adv_CaptionLbl)
            {
            }
            column(G7_AdvAdj_Caption;G7_Adv_CaptionLbl)
            {
            }
            column(G8_AdvAdj_Caption;G8_Adv_CaptionLbl)
            {
            }
            column(IGST_AdvAdj_Caption;IGST_CaptionLbl)
            {
            }
            column(CGST_AdvAdj_Caption;CGST_CaptionLbl)
            {
            }
            column(SGST_UTGST_AdvAdj_Caption;SGST_UTGST_CaptionLbl)
            {
            }
            column(CESS_AdvAdj_Caption;CESS_CaptionLbl)
            {
            }
            column(TAX_Paid_Adv_Caption;TAX_Paid_CaptionLbl)
            {
            }
            column(Supply_Type_Adv_Caption;Supply_Type_CaptionLbl)
            {
            }
            column(Place_of_Supply_Adavance_Adv_Caption;Place_of_Supply_Adavance_CaptionLbl)
            {
            }
            column(Advance_Adv_Caption;Advance_CaptionLbl)
            {
            }
            column(Advance_amount_received_Caption;Advance_amount_received_CaptionLbl)
            {
            }
            column(GST_Rate_AdvAdj_Caption;GST_Rate_CaptionLbl)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF Number = 1 THEN
                  AdvanceAdjustedHeaderVisibility := TRUE
                ELSE
                  AdvanceAdjustedHeaderVisibility := FALSE;
                AdvanceAdjustedVisibility := TRUE;

                IF Number = 1 THEN
                  CustLedgerEntry.FINDFIRST
                ELSE
                  CustLedgerEntry.NEXT;
            end;

            trigger OnPreDataItem();
            begin
                CustLedgerEntry.RESET;
                CustLedgerEntry.SETRANGE("Posting Date",FromDate,ToDate);
                CustLedgerEntry.SETRANGE("Location Code",LocationCode);
                IF CustLedgerEntry.FINDFIRST THEN
                  AdvanceAdjustedVisibility := TRUE;
                SETRANGE("Advance Adjusted".Number,1,CustLedgerEntry.COUNT);
            end;
        }
        dataitem("HSN Summary";"Integer")
        {
            DataItemTableView = SORTING(Number);
            column(Number_HSNSummary;"HSN Summary".Number)
            {
            }
            column(SGSTAmount_HSN;SGSTAmount)
            {
            }
            column(CGSTAmount_HSN;CGSTAmount)
            {
            }
            column(IGSTAmount_HSN;IGSTAmount)
            {
            }
            column(CGSTRate_HSN;CGSTRate)
            {
            }
            column(SGSTRate_HSN;SGSTRate)
            {
            }
            column(IGSTRate_HSN;IGSTRate)
            {
            }
            column(IGSTTotal_HSN;IGSTTotal)
            {
            }
            column(CGSTTotal_HSN;CGSTTotal)
            {
            }
            column(SGSTTotal_HSN;SGSTTotal)
            {
            }
            column(HSNSummaryVisibility;HSNSummaryVisibility)
            {
            }
            column(HSNSummaryHeaderVisibility;HSNSummaryHeaderVisibility)
            {
            }
            column(HSN_wise_Caption;HSN_wise_CaptionLbl)
            {
            }
            column(Goods_Service_Caption;Goods_Service_CaptionLbl)
            {
            }
            column(HSN_SAC_Caption;HSN_SAC_CaptionLbl)
            {
            }
            column(Description_HSN_Caption;Description_HSN_CaptionLbl)
            {
            }
            column(UQC_Caption;UQC_CaptionLbl)
            {
            }
            column(Total_Quantity_Caption;Total_Quantity_CaptionLbl)
            {
            }
            column(Total_Value_Caption;Total_Value_CaptionLbl)
            {
            }
            column(Total_Taxable_Value_Caption;Total_Taxable_Value_CaptionLbl)
            {
            }
            column(IGST_HSN_Caption;IGST_CaptionLbl)
            {
            }
            column(CGST_HSN_Caption;CGST_CaptionLbl)
            {
            }
            column(SGST_UTGST_HSN_Caption;SGST_UTGST_CaptionLbl)
            {
            }
            column(CESS_HSN_Caption;CESS_CaptionLbl)
            {
            }
            column(Amount_HSN_Caption;Amount_CaptionLbl)
            {
            }
            column(C1_HSN_Caption;G1_CaptionLbl)
            {
            }
            column(C2_HSN_Caption;G2_CaptionLbl)
            {
            }
            column(C3_HSN_Caption;G3_CaptionLbl)
            {
            }
            column(C4_HSN_Caption;G4_CaptionLbl)
            {
            }
            column(C5_HSN_Caption;G5_CaptionLbl)
            {
            }
            column(C6_HSN_Caption;G6_CaptionLbl)
            {
            }
            column(C7_HSN_Caption;G7_CaptionLbl)
            {
            }
            column(C8_HSN_Caption;G8_CaptionLbl)
            {
            }
            column(C9_HSN_Caption;G9_CaptionLbl)
            {
            }
            column(C10_HSN_Caption;G10_CaptionLbl)
            {
            }
            column(C11_HSN_Caption;G11_CaptionLbl)
            {
            }
            column(C12_HSN_Caption;G12_CaptionLbl)
            {
            }
            column(Amount_HSNSummary_Caption;Amount_CaptionLbl)
            {
            }
            column(HSNQuantity;SalesInvLine.Quantity)
            {
            }
            column(HSNTotalValue;SalesInvLine."Amount To Customer")
            {
            }
            column(HSNTotalTaxableValue;SalesInvLine."GST Base Amount")
            {
            }
            column(HSNDescription;SalesInvLine.Description)
            {
            }
            column(UQC;SalesInvLine."Unit of Measure Code")
            {
            }
            column(HSNSAC;SalesInvLine."HSN/SAC Code")
            {
            }
            column(HSNCESS;SalesInvLine."CESS Amount")
            {
            }
            column(HSNGSTGroupType;SalesInvLine."GST Group Type")
            {
            }
            column(DocumentNoCaption;DocumentNoCaptionLbl)
            {
            }
            column(DocumentNo;SalesInvLine."Document No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                CLEAR(CGSTRate);
                CLEAR(SGSTRate);
                CLEAR(IGSTRate);
                CLEAR(CGSTAmount);
                CLEAR(SGSTAmount);
                CLEAR(IGSTAmount);
                CLEAR(CGSTTotal);
                CLEAR(SGSTTotal);
                CLEAR(IGSTTotal);
                CLEAR(IsGSTApplicable);

                IF Number = 1 THEN
                  HSNSummaryHeaderVisibility := TRUE
                ELSE
                  HSNSummaryHeaderVisibility := FALSE;
                HSNSummaryVisibility := TRUE;

                IF Number = 1 THEN
                  SalesInvLine.FINDFIRST
                ELSE
                  SalesInvLine.NEXT;

                SalesInvHeaderB2B.RESET;
                SalesInvHeaderB2B.SETRANGE("No.",SalesInvLine."Document No.");
                IF SalesInvHeaderB2B.FINDFIRST THEN;

                IsGSTApplicable := GSTManagement.IsGSTApplicable(SalesInvHeaderB2B.Structure);

                IF IsGSTApplicable  THEN BEGIN
                  GSTComponent.RESET;
                  GSTComponent.SETRANGE("GST Jurisdiction Type",SalesInvLine."GST Jurisdiction Type");
                  IF GSTComponent.FINDSET THEN
                    REPEAT
                      DetailedGSTLedgerEntry.RESET;
                      DetailedGSTLedgerEntry.SETCURRENTKEY("Transaction Type","Document Type","Document No.","Document Line No.");
                      DetailedGSTLedgerEntry.SETRANGE("Transaction Type",DetailedGSTLedgerEntry."Transaction Type"::Sales);
                      DetailedGSTLedgerEntry.SETRANGE("Document Type",DetailedGSTLedgerEntry."Document Type"::Invoice);
                      DetailedGSTLedgerEntry.SETRANGE("Document No.",SalesInvLine."Document No.");
                      DetailedGSTLedgerEntry.SETRANGE("Document Line No.",SalesInvLine."Line No.");
                      DetailedGSTLedgerEntry.SETRANGE("Entry Type",DetailedGSTLedgerEntry."Entry Type"::"Initial Entry");
                      DetailedGSTLedgerEntry.SETRANGE("GST Component Code",GSTComponent.Code);
                      IF DetailedGSTLedgerEntry.FINDSET THEN BEGIN
                        REPEAT
                          CASE DetailedGSTLedgerEntry."GST Component Code" OF
                            'IGST':
                              BEGIN
                                IGSTRate := DetailedGSTLedgerEntry."GST %";
                                IGSTAmount := ABS(DetailedGSTLedgerEntry."GST Amount");
                                IGSTTotal += IGSTAmount;
                              END;
                            'CGST':
                              BEGIN
                                CGSTRate := DetailedGSTLedgerEntry."GST %";
                                CGSTAmount := ABS(DetailedGSTLedgerEntry."GST Amount");
                                CGSTTotal += CGSTAmount;
                              END;
                            'SGST':
                              BEGIN
                                SGSTRate := DetailedGSTLedgerEntry."GST %";
                                SGSTAmount := ABS(DetailedGSTLedgerEntry."GST Amount");
                                SGSTTotal += SGSTAmount;
                              END;
                          END;
                        UNTIL DetailedGSTLedgerEntry.NEXT = 0;
                      END;
                    UNTIL GSTComponent.NEXT = 0;
                END;
            end;

            trigger OnPreDataItem();
            begin
                Exp := 'CM';
                MonthGVar := Period;
                FromDate := DMY2DATE(1,MonthGVar,Year);
                ToDate := CALCDATE(Exp,FromDate);

                SalesInvLine.RESET;
                SalesInvLine.SETRANGE("Posting Date",FromDate,ToDate);
                SalesInvLine.SETRANGE("Location Code",LocationCode);
                SalesInvLine.SETFILTER("HSN/SAC Code",'<>%1','');
                IF SalesInvLine.FINDFIRST THEN
                  HSNSummaryVisibility := TRUE;
                SETRANGE("HSN Summary".Number,1,SalesInvLine.COUNT);
            end;
        }
        dataitem("Document Issued";"Integer")
        {
            DataItemTableView = SORTING(Number) WHERE(Number=CONST(1));
            column(Number_DocumentIssued;"Document Issued".Number)
            {
            }
            column(DocumentIssuedVisibility;DocumentIssuedVisibility)
            {
            }
            column(DocumentIssuedHeaderVisibility;DocumentIssuedHeaderVisibility)
            {
            }
            column(Document_Caption;Document_CaptionLbl)
            {
            }
            column(Documents_issued_Caption;Documents_issued_CaptionLbl)
            {
            }
            column(Document_No_Caption;Document_No_CaptionLbl)
            {
            }
            column(Nature_of_Document_Caption;Nature_of_Document_CaptionLbl)
            {
            }
            column(Invoice_No_Caption;Invoice_No_CaptionLbl)
            {
            }
            column(From_Caption;From_CaptionLbl)
            {
            }
            column(To_Caption;To_CaptionLbl)
            {
            }
            column(Total_Invoice_No_Caption;Total_Invoice_No_CaptionLbl)
            {
            }
            column(cancelled_Invoices_Document_Caption;cancelled_Invoices_Document_CaptionLbl)
            {
            }
            column(C1_DocIssued_Caption;G1_CaptionLbl)
            {
            }
            column(C2_DocIssued_Caption;G2_CaptionLbl)
            {
            }
            column(C3_DocIssued_Caption;G3_CaptionLbl)
            {
            }
            column(C4_DocIssued_Caption;G4_CaptionLbl)
            {
            }
            column(C5_DocIssued_Caption;G5_CaptionLbl)
            {
            }
            column(C6_DocIssued_Caption;G6_CaptionLbl)
            {
            }
            column(C7_DocIssued_Caption;G7_CaptionLbl)
            {
            }
            column(NetInvoices_Caption;NetInvoices_CaptionLbl)
            {
            }
            column(SNo;SNo)
            {
            }
            column(InvoiceCount;InvoiceCount)
            {
            }
            column(InvoiceNo;InvoiceNo)
            {
            }
            column(InvoiceNoFirst;InvoiceNoFirst)
            {
            }
            column(No_DocumentIssued;SalesInvoiceHeaderDocument."No.")
            {
            }
            column(FirstNo;FirstNo)
            {
            }
            column(LastNo;LastNo)
            {
            }

            trigger OnAfterGetRecord();
            begin
                CLEAR(SNo);
                CLEAR(InvoiceNo);
                CLEAR(InvoiceCount);
                SNo += 1;
                IF Number = 1 THEN
                  DocumentIssuedHeaderVisibility := TRUE
                ELSE
                  DocumentIssuedHeaderVisibility := FALSE;
                DocumentIssuedVisibility := TRUE;
                
                IF Number = 1 THEN
                  SalesInvoiceHeaderDocument.FINDFIRST
                ELSE
                  SalesInvoiceHeaderDocument.NEXT;
                
                /*
                SalesInvoiceHeaderDocument.RESET;
                SalesInvoiceHeaderDocument.SETRANGE("Posting Date",FromDate,ToDate);
                SalesInvoiceHeaderDocument.SETRANGE("Location Code",LocationCode);
                */
                IF SalesInvoiceHeaderDocument.FINDSET THEN
                  InvoiceCount := SalesInvoiceHeaderDocument.COUNT;

            end;

            trigger OnPreDataItem();
            begin
                CLEAR(FirstNo);
                CLEAR(LastNo);
                CLEAR(InvoiceCount);

                SalesInvoiceHeaderDocument.RESET;
                SalesInvoiceHeaderDocument.SETRANGE("Posting Date",FromDate,ToDate);
                SalesInvoiceHeaderDocument.SETRANGE("Location Code",LocationCode);
                IF SalesInvoiceHeaderDocument.FINDFIRST THEN
                  FirstNo := SalesInvoiceHeaderDocument."No.";

                SalesInvoiceHeaderDocument.RESET;
                SalesInvoiceHeaderDocument.SETRANGE("Posting Date",FromDate,ToDate);
                SalesInvoiceHeaderDocument.SETRANGE("Location Code",LocationCode);
                IF SalesInvoiceHeaderDocument.FINDLAST THEN
                  LastNo := SalesInvoiceHeaderDocument."No.";

                DocumentIssuedVisibility := TRUE;
                SETRANGE("Document Issued".Number,1,SalesInvoiceHeaderDocument.COUNT);
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
                    CaptionML = ENU='Options',
                                ENN='Options';
                    field(GSTIN;GSTIN)
                    {
                        CaptionML = ENU='GSTIN of the location',
                                    ENN='GSTIN of the location';
                        TableRelation = "GST Registration Nos.".Code;

                        trigger OnValidate();
                        begin
                            Location.SETRANGE("GST Registration No.",GSTIN);
                            IF Location.FINDFIRST THEN BEGIN
                              TaxablePerson := Location.Name;
                              LocationCode := Location.Code;
                            END
                            ELSE
                              ERROR(LocationErr);
                        end;
                    }
                    field(TaxablePerson;TaxablePerson)
                    {
                        CaptionML = ENU='Name of the Taxable Person',
                                    ENN='Name of the Taxable Person';
                        TableRelation = Location.Name;
                    }
                    field(Period;Period)
                    {
                        CaptionML = ENU='Period',
                                    ENN='Period';
                    }
                    field(Date;Date)
                    {
                        CaptionML = ENU='Date',
                                    ENN='Date';

                        trigger OnValidate();
                        begin
                            Year := DATE2DMY(Date,3);
                        end;
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

    var
        Location : Record Location;
        GSTIN : Code[20];
        AggregateTurnover : Decimal;
        TaxablePerson : Text;
        PersonName : Text;
        Period : Option " ",Jan,Feb,March,Apr,May,June,July,Agu,Sept,Oct,Nov,Dec;
        Place : Text;
        Date : Date;
        GeneralVisibility : Boolean;
        LocationErr : Label 'LocationErr';
        GSTIN_CaptionLbl : Label 'GSTIN:';
        NameofTax_CaptionLbl : Label 'Name of Taxable Person';
        Period_CaptionLbl : Label 'Period';
        INSTRUCTIONS_CaptionLbl : Label 'INSTRUCTIONS';
        Ex_CaptionLbl : Label 'Ex:';
        Avoid_Cut_CaptionLbl : Label '1: Avoid Cut options in any of the work Sheets';
        To_Enter_CaptionLbl : Label '2: To Enter Invoice Date Enter in DD/MMM/YYYY format (02/Jan/2017) Do not Cut or copy and Paste';
        While_Pasting_CaptionLbl : Label '3: While Pasting data from other excel File, use only Paste Special / Values Option';
        Before_any_CaptionLbl : Label '4: Before any operation on excel file make sure you are not in Excel Edit mode';
        Avoid_using_CaptionLbl : Label '5: Avoid using enter character ( Alt + Enter) in any cell';
        If_mandatory_CaptionLbl : Label '6: If mandatory fields are not entered, then the record will not be Imported';
        Option_Field_CaptionLbl : Label 'Option Field';
        Mandatory_Field_CaptionLbl : Label 'Mandatory Field';
        Notes_CaptionLbl : Label 'Notes:';
        Taxable_Person_CaptionLbl : Label 'Taxable Person has the option to furnish the details of nil rate and exempted supplies in this Table';
        In_case_of_CaptionLbl : Label 'In case of inter-state supplies, only IGST would be filled';
        In_case_of_intra_CaptionLbl : Label 'In case of intra-state supplies, CGST & SGST would be filled.';
        Taxable_outward_CaptionLbl : Label '4. Taxable outward supplies made to registered persons (including UIN-holders)';
        GSTIN_UID_CaptionLbl : Label 'GSTIN/ UID';
        Party_Name_CaptionLbl : Label 'Party Name';
        Invoice_CaptionLbl : Label 'Invoice';
        Number_CaptionLbl : Label 'Number';
        Date_CaptionLbl : Label 'Date     (dd/mm/yyyy)';
        Value_CaptionLbl : Label 'Value';
        Taxable_Value_CaptionLbl : Label 'Taxable Value';
        GST_Rate_CaptionLbl : Label 'GST Rate';
        IGST_CaptionLbl : Label 'IGST';
        CGST_CaptionLbl : Label 'CGST';
        SGST_UTGST_CaptionLbl : Label 'SGST';
        CESS_CaptionLbl : Label 'CESS';
        POS_only_if_CaptionLbl : Label 'POS only if different from the location of recipient';
        Reverse_Charge_CaptionLbl : Label 'Reverse Charge';
        Indicate_supply_CaptionLbl : Label 'Indicate if supply attracts reverse charge';
        GSTIN_of_ecommerce_CaptionLbl : Label 'GSTIN of ecommerce operator (if applicable)';
        Original_Invoice_CaptionLbl : Label 'Original Invoice(If Amended)';
        One_CaptionLbl : Label '1';
        Two_CaptionLbl : Label '2';
        Three_CaptionLbl : Label '3';
        No_CaptionLbl : Label 'No.';
        Amount_CaptionLbl : Label 'Amount';
        G1_CaptionLbl : Label '(1)';
        G2_CaptionLbl : Label '(2)';
        G3_CaptionLbl : Label '(3)';
        G4_CaptionLbl : Label '(4)';
        G5_CaptionLbl : Label '(5)';
        G6_CaptionLbl : Label '(6)';
        G7_CaptionLbl : Label '(7)';
        G8_CaptionLbl : Label '(8)';
        G9_CaptionLbl : Label '(9)';
        G10_CaptionLbl : Label '(10)';
        G11_CaptionLbl : Label '(11)';
        G12_CaptionLbl : Label '(12)';
        G13_CaptionLbl : Label '(13)';
        G14_CaptionLbl : Label '(14)';
        G15_CaptionLbl : Label '(15)';
        G16_CaptionLbl : Label '(16)';
        SalesInvHeaderB2B : Record "Sales Invoice Header";
        B2BVisibility : Boolean;
        GSTComponent : Record "GST Component";
        GSTManagement : Codeunit "GST Management";
        DetailedGSTLedgerEntry : Record "Detailed GST Ledger Entry";
        IsGSTApplicable : Boolean;
        CustomerGRec : Record Customer;
        CGSTRate : Decimal;
        CGSTAmount : Decimal;
        SGSTRate : Decimal;
        SGSTAmount : Decimal;
        IGSTRate : Decimal;
        IGSTAmount : Decimal;
        SGSTTotal : Decimal;
        CGSTTotal : Decimal;
        IGSTTotal : Decimal;
        Export_Type_CaptionLbl : Label 'Export Type';
        Supplies_Exported_CaptionLbl : Label '5.Supplies Exported (including deemed exports)';
        Port_Code_CaptionLbl : Label 'Port Code';
        Shipping_Bill_CaptionLbl : Label 'Shipping Bill/Bill Of Export';
        GSTIN_Export_CaptionLbl : Label 'GSTIN';
        ExportVisibility : Boolean;
        FromDate : Date;
        ToDate : Date;
        Year : Integer;
        MonthGVar : Integer;
        Exp : Text;
        B2BHeaderVisibility : Boolean;
        ExportHeaderVisibility : Boolean;
        NilRatedHeaderVisibility : Boolean;
        Nilrated_Exempted_CaptionLbl : Label '8. Nil rated, Exempted and Non GST outward supplies*';
        figures_in_Rs_CaptionLbl : Label '(figures in Rs)';
        Description_CaptionLbl : Label 'Description';
        Nil_Rated_Amount_CaptionLbl : Label 'Nil Rated (Amount)';
        Exempted_Amount_CaptionLbl : Label 'Exempted (Amount)';
        NonGSTsupplies_CaptionLbl : Label 'Non GST supplies (Amount)';
        Interstate_registered_CaptionLbl : Label 'Interstate supplies to registered person';
        Intrastate_registered_CaptionLbl : Label 'Intrastate supplies to registered person';
        Interstate_unregistered_CaptionLbl : Label 'Interstate supplies to unregistered person';
        Intrastate_unregistered_CaptionLbl : Label 'Intrastate supplies to unregistered person';
        NilRatedVisibility : Boolean;
        Note_CaptionLbl : Label 'Note:';
        Information_about_CaptionLbl : Label 'Information about Credit Note / Debit Note to be submitted only if issued as a supplier.';
        Details_of_CaptionLbl : Label '9B. Details of Credit/Debit Notes issued to registered taxpayers';
        Typeofnote_CaptionLbl : Label 'Type of note (Debit/Credit)';
        Credit_Note_CaptionLbl : Label 'Credit Note/Debit Note';
        Reason_CaptionLbl : Label 'Reason for Issuing Note';
        PreGST_CaptionLbl : Label 'Pre GST Regime Dr./ Cr. Notes';
        PlaceofSupply_CaptionLbl : Label 'Place of Supply';
        Supplier_InvoiceValue_CaptionLbl : Label 'Supplier InvoiceValue';
        TaxAmount_CaptionLbl : Label 'Tax Amount';
        Original_Credit_CaptionLbl : Label 'Original Credit/Debit Note(If Amended)';
        C17_CaptionLbl : Label '(17)';
        C18_CaptionLbl : Label '(18)';
        C19_CaptionLbl : Label '(19)';
        CrDrRegisterVisibility : Boolean;
        CrDrRegisterHeaderVisibility : Boolean;
        DetailsofUnReg_CaptionLbl : Label '9D. Details of Credit/Debit Notes issued to Unregistered taxpayers';
        Type_CaptionLbl : Label 'Type';
        HSN_wise_CaptionLbl : Label '12. HSN-wise summary of outward supplies';
        Goods_Service_CaptionLbl : Label 'Goods/Service';
        HSN_SAC_CaptionLbl : Label 'HSN/ SAC';
        Description_HSN_CaptionLbl : Label 'Description';
        UQC_CaptionLbl : Label 'UQC (Unit Quantity Code)';
        Total_Quantity_CaptionLbl : Label 'Total Quantity';
        Total_Value_CaptionLbl : Label 'Total Value';
        Total_Taxable_Value_CaptionLbl : Label 'Total Taxable Value';
        Documents_issued_CaptionLbl : Label '13.Documents issued during the tax period';
        Document_No_CaptionLbl : Label 'Document  No.';
        Nature_of_Document_CaptionLbl : Label 'Nature of Document';
        Invoice_No_CaptionLbl : Label 'Invoice No.';
        From_CaptionLbl : Label 'From';
        To_CaptionLbl : Label 'To';
        Total_Invoice_No_CaptionLbl : Label 'Total Invoice No.';
        cancelled_Invoices_Document_CaptionLbl : Label 'cancelled Invoices';
        CrDrUnRegisterVisibility : Boolean;
        CrDrUnRegisterHeaderVisibility : Boolean;
        Original_Invoice_CrDr_CaptionLbl : Label 'Original Invoice';
        HSNSummaryVisibility : Boolean;
        HSNSummaryHeaderVisibility : Boolean;
        DocumentIssuedVisibility : Boolean;
        DocumentIssuedHeaderVisibility : Boolean;
        NetInvoices_CaptionLbl : Label 'Net Invoices issued';
        AdvanceReceivedVisibility : Boolean;
        AdvanceReceivedHeaderVisibility : Boolean;
        AdvanceAdjustedVisibility : Boolean;
        AdvanceAdjustedHeaderVisibility : Boolean;
        SalesCrMemoHeader : Record "Sales Cr.Memo Header";
        SalesCrMemoLine : Record "Sales Cr.Memo Line";
        SalesInvLine : Record "Sales Invoice Line";
        SalesInvHeaderExport : Record "Sales Invoice Header";
        SalesInvHeaderHSN : Record "Sales Invoice Header";
        SalesCrMemoHeaderUnreg : Record "Sales Cr.Memo Header";
        B2BFooterVisibility : Boolean;
        CGSTExpRate : Decimal;
        CGSTExpAmount : Decimal;
        SGSTExpRate : Decimal;
        SGSTExpAmount : Decimal;
        IGSTExpRate : Decimal;
        IGSTExpAmount : Decimal;
        SGSTExpTotal : Decimal;
        CGSTExpTotal : Decimal;
        IGSTExpTotal : Decimal;
        IsGSTApplicableExp : Boolean;
        CustomerExpGRec : Record Customer;
        ExportTypeGVar : Text;
        GSTPertg : Decimal;
        IsGSTApplicableCrDr : Boolean;
        PurchCrMemoHdrUnReg : Record "Sales Cr.Memo Header";
        TaxableValueB2B : Decimal;
        TaxableValueExport : Decimal;
        SalesInvoiceHeaderNilRated : Record "Sales Invoice Header";
        IGSTNilRated : Decimal;
        ExemptedNilRated : Decimal;
        ExemptedNilRatedIntra : Decimal;
        IGSTNilRatedUnReg : Decimal;
        ExemptedNilRatedUnReg : Decimal;
        ExemptedNilRatedIntraUnReg : Decimal;
        GeneralDate : Date;
        IntraStateReg : Decimal;
        IntraStateUnReg : Decimal;
        ShiptoCode : Text;
        ShiptoCodeGRec : Record "Ship-to Address";
        StateGRec : Record State;
        GSTRegNo : Code[15];
        N_CaptionLbl : Label 'N';
        CustLedgerEntry : Record "Cust. Ledger Entry";
        SalesInvoiceHeaderDocument : Record "Sales Invoice Header";
        SNo : Integer;
        InvoiceCount : Integer;
        InvoiceNo : Code[20];
        InvoiceNoFirst : Code[20];
        Advance_amount_CaptionLbl : Label '11. Advance amount received in the tax period for which invoice has not been issued(Figures in Rs)';
        TAX_Paid_CaptionLbl : Label 'TAX Paid on receipt of advance/on account of time of supply';
        Supply_Type_CaptionLbl : Label 'Supply Type';
        Place_of_Supply_Adavance_CaptionLbl : Label 'Place of Supply';
        Advance_CaptionLbl : Label 'Advance to be adjusted';
        Month_CaptionLbl : Label 'Month  (mmm-yyyy)';
        Advance_amount_received_CaptionLbl : Label '11.Advance amount received in earlier tax period and adjusted against the supplies';
        GST_Rate_Adv_CaptionLbl : Label 'GST Rate';
        IGST_Adv_CaptionLbl : Label 'IGST';
        CGST_Adv_CaptionLbl : Label 'CGST';
        SGST_Adv_UTGST_CaptionLbl : Label 'SGST';
        CESS_Adv_CaptionLbl : Label 'CESS';
        OriginalDetails_CaptionLbl : Label 'Original Details(If Amended)';
        G1_Adv_CaptionLbl : Label '(1)';
        G2_Adv_CaptionLbl : Label '(2)';
        G3_Adv_CaptionLbl : Label '(3)';
        G4_Adv_CaptionLbl : Label '(4)';
        G5_Adv_CaptionLbl : Label '(5)';
        G6_Adv_CaptionLbl : Label '(6)';
        G7_Adv_CaptionLbl : Label '(7)';
        G8_Adv_CaptionLbl : Label '(8)';
        G9_Adv_CaptionLbl : Label '(9)';
        Figures_CaptionLbl : Label '(Figures in Rs)';
        Amount_Adv_CaptionLbl : Label 'Amount';
        Number_Adv_CaptionLbl : Label 'Number';
        LocationErr_Adv_CaptionLbl : Label 'LocationErr';
        AdvanceStateDesc : Text[30];
        LocationCode : Code[10];
        Document_CaptionLbl : Label '1.Invoices for outward Supply';
        FirstNo : Code[20];
        LastNo : Code[20];
        FirstPostingDate : Date;
        LastPostingDate : Date;
        DocumentNoCaptionLbl : Label 'Internal Document No.';
        InvoiceValueTotal : Decimal;
        InvoiceValueTotalGVar : Decimal;
}

