report 60033 "Commercial Invoice"
{
    // version B2B 1.0

    DefaultLayout = RDLC;
    RDLCLayout = './Commercial Invoice.rdlc';

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
            ReqFilterHeading = 'Posted Sales Invoice';
            column(CompanyInfo_Name; CompanyInfo.Name)
            {
            }
            column(CompanyInfo_Address; CompanyInfo.Address)
            {
            }
            column(CompanyInfo__Address_2_; CompanyInfo."Address 2")
            {
            }
            column(CompanyInfo__Fax_No__; CompanyInfo."Fax No.")
            {
            }
            column(CompanyInfo__Phone_No__; CompanyInfo."Phone No.")
            {
            }
            column(CompanyInfo__Home_Page_; CompanyInfo."Home Page")
            {
            }
            column(CompanyInfo__C_S_T_No__; CompanyInfo."C.S.T No.")
            {
            }
            column(STRSUBSTNO_Text005_FORMAT_CurrReport_PAGENO__; STRSUBSTNO(Text005, FORMAT(CurrReport.PAGENO)))
            {
            }
            column(CompanyInfo__L_S_T__No__; CompanyInfo."L.S.T. No.")
            {
            }
            column(CompanyInfo__E_Mail_; CompanyInfo."E-Mail")
            {
            }
            column(CompanyInfo_Picture; CompanyInfo.Picture)
            {
            }
            column(Sales_Invoice_Header__Sales_Invoice_Header___Bill_to_City_; "Sales Invoice Header"."Bill-to City")
            {
            }
            column(Sales_Invoice_Header__Sales_Invoice_Header___Bill_to_Address_2_; "Sales Invoice Header"."Bill-to Address 2")
            {
            }
            column(Sales_Invoice_Header__Sales_Invoice_Header___Bill_to_Address_; "Sales Invoice Header"."Bill-to Address")
            {
            }
            column(Sales_Invoice_Header__Sales_Invoice_Header___Bill_to_Name_2_; "Sales Invoice Header"."Bill-to Name 2")
            {
            }
            column(Sales_Invoice_Header__Sales_Invoice_Header___Bill_to_Name_; "Sales Invoice Header"."Bill-to Name")
            {
            }
            column(Sales_Invoice_Header__Sales_Invoice_Header___Bill_to_Customer_No__; "Sales Invoice Header"."Bill-to Customer No.")
            {
            }
            column(Sales_Invoice_Header__Sales_Invoice_Header___No__; "Sales Invoice Header"."No.")
            {
            }
            column(Text0001______No_______Text0002; Text0001 + ' ' + "No." + ' ' + Text0002)
            {
            }
            column(Sales_Invoice_Header__Posting_Date_; "Posting Date")
            {
            }
            column(AssessableValue; AssessableValue)
            {
            }
            column(CompanyInfo__VAT_Registration_No__; CompanyInfo."VAT Registration No.")
            {
            }
            column(CompanyInfo__C_S_T_No___Control1102152151; CompanyInfo."C.S.T No.")
            {
            }
            column(CompanyInfo__C_E__Registration_No__; CompanyInfo."C.E. Registration No.")
            {
            }
            column(BasicExciseDuty; BasicExciseDuty)
            {
            }
            column(EDcess; EDcess)
            {
            }
            column(VAT; VAT)
            {
            }
            column(Freight; Freight)
            {
            }
            column(PFAmount; PFAmount)
            {
            }
            column(Insurence; Insurence)
            {
            }
            column(Charges; Charges)
            {
            }
            column(Rupees; Rupees)
            {
            }
            column(AdvanceReceive; AdvanceReceive)
            {
            }
            column(GrandTotal; GrandTotal)
            {
            }
            column(Sales_Invoice_Header__Posting_Date__Control1102152168; "Posting Date")
            {
            }
            column(AssessableValue_Control1102152001; AssessableValue)
            {
            }
            column(Numtext_1______Numtext_2_; Numtext[1] + ' ' + Numtext[2])
            {
            }
            column(Sales_Invoice_Header__Order_No__; "Order No.")
            {
            }
            column(Charge_Type_; "Charge Type")
            {
            }
            column(Freight_Text_; "Freight Text")
            {
            }
            column(Insurance_Text_; "Insurance Text")
            {
            }
            column(Charge_Type1_; "Charge Type1")
            {
            }
            column(Charge_Type1Dec_; "Charge Type1Dec")
            {
            }
            column(Currency; Currency)
            {
            }
            column(Invoice_Type_; "Invoice Type")
            {
            }
            column(NotDue; NotDue)
            {
            }
            column(NotDueDtl; NotDueDtl)
            {
            }
            column(Sales_Invoice_Header__Posting_Date__Control1000000016; "Posting Date")
            {
            }
            column(DELSTR__Sales_Invoice_Header___No___1_8_; DELSTR("Sales Invoice Header"."No.", 1, 8))
            {
            }
            column(CST1; CST1)
            {
                OptionMembers = "4%","10%";
            }
            column(VAT1; VAT1)
            {
                OptionMembers = "12.5%","4%";
            }
            column(Sales_Invoice_Header__Posting_Date__Control1102152011; "Posting Date")
            {
            }
            column(FAX_Caption; FAX_CaptionLbl)
            {
            }
            column(Visit_us_Caption; Visit_us_CaptionLbl)
            {
            }
            column(CST_No________Caption; CST_No________CaptionLbl)
            {
            }
            column(APGST_No___Caption; APGST_No___CaptionLbl)
            {
            }
            column(E_Mail_Caption; E_Mail_CaptionLbl)
            {
            }
            column(Ph_Caption; Ph_CaptionLbl)
            {
            }
            column(Our_Ref_____CO_No_Caption; Our_Ref_____CO_No_CaptionLbl)
            {
            }
            column(Consignee_Name___Address_Caption; Consignee_Name___Address_CaptionLbl)
            {
            }
            column(COMMERCIAL_INV_NO_Caption; COMMERCIAL_INV_NO_CaptionLbl)
            {
            }
            column(INVOICE_Caption; INVOICE_CaptionLbl)
            {
            }
            column(All_disputes_are_subject_to_jurisdiction_of_Hyderabad_onlyCaption; All_disputes_are_subject_to_jurisdiction_of_Hyderabad_onlyCaptionLbl)
            {
            }
            column(Balance_payable_nowCaption; Balance_payable_nowCaptionLbl)
            {
            }
            column(Less__Amount_ReceivedCaption; Less__Amount_ReceivedCaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(Educational_Cess___2__on_EDCaption; Educational_Cess___2__on_EDCaptionLbl)
            {
            }
            column(Supplied_subject_to_our_usual_terms_of_sales_as_modified_by_us_in_writing_where_applicableCaption; Supplied_subject_to_our_usual_terms_of_sales_as_modified_by_us_in_writing_where_applicableCaptionLbl)
            {
            }
            column(Central_Excise_duty_as_per_CE_InvoiceCaption; Central_Excise_duty_as_per_CE_InvoiceCaptionLbl)
            {
            }
            column(CST___________Service_Tax_10_2____VAT__________Caption; CST___________Service_Tax_10_2____VAT__________CaptionLbl)
            {
            }
            column(Packing_ChargesCaption; Packing_ChargesCaptionLbl)
            {
            }
            column(Date__Caption; Date__CaptionLbl)
            {
            }
            column(Unit_RateCaption; Unit_RateCaptionLbl)
            {
            }
            column(Qty_Caption; Qty_CaptionLbl)
            {
            }
            column(AmountCaption; AmountCaptionLbl)
            {
            }
            column(DescriptionCaption; DescriptionCaptionLbl)
            {
            }
            column(S_No_Caption; S_No_CaptionLbl)
            {
            }
            column(Amount_in_wordsCaption; Amount_in_wordsCaptionLbl)
            {
            }
            column(TIN_No___Caption; TIN_No___CaptionLbl)
            {
            }
            column(CST_No___Caption; CST_No___CaptionLbl)
            {
            }
            column(CE_Regn__No___Caption; CE_Regn__No___CaptionLbl)
            {
            }
            column(CE_Invoice_No_Caption; CE_Invoice_No_CaptionLbl)
            {
            }
            column(CE_Invoice_Date_Caption; CE_Invoice_Date_CaptionLbl)
            {
            }
            column(V0Caption; V0CaptionLbl)
            {
            }
            column(Way_Bill_No_Caption; Way_Bill_No_CaptionLbl)
            {
            }
            column(Your_Order_No_Caption; Your_Order_No_CaptionLbl)
            {
            }
            column(Date__Caption_Control1102152009; Date__Caption_Control1102152009Lbl)
            {
            }
            column(Prepared_byCaption; Prepared_byCaptionLbl)
            {
            }
            column(For_Efftronics_Systems__P__Ltd__Caption; For_Efftronics_Systems__P__Ltd__CaptionLbl)
            {
            }
            column(VerifiedCaption; VerifiedCaptionLbl)
            {
            }
            column(Authorised_SignatoryCaption; Authorised_SignatoryCaptionLbl)
            {
            }
            column(DataItem1102152024; Certified_that_the_Particulars_given_above_are_true_and_correct_and_the_amount_indicated_represents_the_price_actually_chargeLbl)
            {
            }
            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = SORTING(Document No., Line No.);
                column(Sales_Invoice_Header___Bill_to_Name_; "Sales Invoice Header"."Bill-to Name")
                {
                }
                column(Sales_Invoice_Header___No__; "Sales Invoice Header"."No.")
                {
                }
                column(Sales_Invoice_Header___Posting_Date_; "Sales Invoice Header"."Posting Date")
                {
                }
                column(CompanyInfo2_Picture; CompanyInfo2.Picture)
                {
                }
                column(Currency_Control1000000008; Currency)
                {
                }
                column(Currency_Control1000000009; Currency)
                {
                }
                column(Sales_Invoice_Line_Amount; Amount)
                {
                }
                column(Sales_Invoice_Line_Quantity; Quantity)
                {
                }
                column(Sales_Invoice_Line_Description; Description)
                {
                }
                column(SINO; SINO)
                {
                }
                column(Sales_Invoice_Line__Unit_Price_; "Unit Price")
                {
                }
                column(Sales_Invoice_Line_Description_Control1102152219; Description)
                {
                }
                column(Sales_Invoice_Line_Amount_Control1102152004; Amount)
                {
                }
                column(Unit_RateCaption_Control1102152193; Unit_RateCaption_Control1102152193Lbl)
                {
                }
                column(Qty_Caption_Control1102152194; Qty_Caption_Control1102152194Lbl)
                {
                }
                column(AmountCaption_Control1102152195; AmountCaption_Control1102152195Lbl)
                {
                }
                column(DescriptionCaption_Control1102152196; DescriptionCaption_Control1102152196Lbl)
                {
                }
                column(S_No_Caption_Control1102152197; S_No_Caption_Control1102152197Lbl)
                {
                }
                column(Customer_Name_Caption; Customer_Name_CaptionLbl)
                {
                }
                column(ANNEXURE_TO_INVOICE_NO__Caption; ANNEXURE_TO_INVOICE_NO__CaptionLbl)
                {
                }
                column(DATED_Caption; DATED_CaptionLbl)
                {
                }
                column(Unit_RateCaption_Control1102152207; Unit_RateCaption_Control1102152207Lbl)
                {
                }
                column(Qty_Caption_Control1102152208; Qty_Caption_Control1102152208Lbl)
                {
                }
                column(AmountCaption_Control1102152209; AmountCaption_Control1102152209Lbl)
                {
                }
                column(DescriptionCaption_Control1102152210; DescriptionCaption_Control1102152210Lbl)
                {
                }
                column(S_No_Caption_Control1102152211; S_No_Caption_Control1102152211Lbl)
                {
                }
                column(TotalCaption_Control1102152010; TotalCaption_Control1102152010Lbl)
                {
                }
                column(Sales_Invoice_Line_Document_No_; "Document No.")
                {
                }
                column(Sales_Invoice_Line_Line_No_; "Line No.")
                {
                }

                trigger OnPreDataItem();
                begin
                    SINO := 0;
                end;
            }

            trigger OnAfterGetRecord();
            begin
                AssessableValue := 0;
                PFAmount := 0;
                Excise := 0;
                EducationCess := 0;
                Freight := 0;
                GrandTotal := 0;
                Rupees := 0;
                ExciseAmount := 0;
                EducationCess := 0;
                TAXAmount := 0;
                BasicExciseDuty := 0;
                EDcess := 0;
                VAT := 0;
                APVAT := 0;

                SalesInvoiceLine.SETRANGE("Document No.", "No.");
                IF SalesInvoiceLine.FIND('-') THEN BEGIN
                    REPEAT
                        AssessableValue := AssessableValue + SalesInvoiceLine."Line Amount";
                    UNTIL SalesInvoiceLine.NEXT = 0;
                END;

                SalesInvoiceLine.SETRANGE("Document No.", "Sales Invoice Header"."No.");
                IF SalesInvoiceLine.FIND('-') THEN
                    REPEAT
                        IF SalesInvoiceLine.Quantity <> 0 THEN BEGIN
                            ExciseAmount := ExciseAmount + SalesInvoiceLine."Excise Amount";
                            EducationCess := EducationCess + SalesInvoiceLine."eCess Amount";
                            TAXAmount := TAXAmount + SalesInvoiceLine."Tax Amount";
                            //      VAT := VAT + SalesInvoiceLine."VAT Amount";
                        END;
                    UNTIL SalesInvoiceLine.NEXT = 0;
                VAT := VAT + TAXAmount;
                CEDuty := ExciseAmount - EducationCess;

                ExciseEntry.SETRANGE(Type, ExciseEntry.Type::Sale);
                ExciseEntry.SETRANGE("Document Type", ExciseEntry."Document Type"::Invoice);
                ExciseEntry.SETRANGE("Document No.", "Sales Invoice Header"."No.");
                IF ExciseEntry.FIND('-') THEN
                    REPEAT
                        BasicExciseDuty := BasicExciseDuty - ExciseEntry.Amount + ExciseEntry."eCess Amount" + ExciseEntry."CESS Amount";
                        EDcess := EDcess - ExciseEntry."eCess Amount" - ExciseEntry."CESS Amount";
                    UNTIL ExciseEntry.NEXT = 0;

                //Message('%1-%2',BasicExciseDuty,EDcess);
                //APVAT

                PostedStrOrderLineDetails.SETRANGE(Type, PostedStrOrderLineDetails.Type::Sale);
                PostedStrOrderLineDetails.SETRANGE("Document Type", PostedStrOrderLineDetails."Document Type"::Invoice);
                PostedStrOrderLineDetails.SETRANGE("Invoice No.", "Sales Invoice Header"."No.");
                PostedStrOrderLineDetails.SETRANGE(PostedStrOrderLineDetails."Tax/Charge Type",
                   PostedStrOrderLineDetails."Tax/Charge Type"::"Other Taxes");
                IF PostedStrOrderLineDetails.FIND('-') THEN
                    REPEAT
                        VAT := VAT + PostedStrOrderLineDetails.Amount;
                    UNTIL PostedStrOrderLineDetails.NEXT = 0;

                //VAT := APVAT;
                //APVAT

                PostedStrOrderLineDetails.RESET;
                PostedStrOrderLineDetails.SETRANGE(Type, PostedStrOrderLineDetails.Type::Sale);
                PostedStrOrderLineDetails.SETRANGE("Document Type", PostedStrOrderLineDetails."Document Type"::Invoice);
                PostedStrOrderLineDetails.SETRANGE("Invoice No.", "Sales Invoice Header"."No.");
                PostedStrOrderLineDetails.SETRANGE("Tax/Charge Type", PostedStrOrderLineDetails."Tax/Charge Type"::Charges);

                /*PostedStrOrderLineDetails.SETRANGE("Charge Type",PostedStrOrderLineDetails."Charge Type" :: "1");
                IF PostedStrOrderLineDetails.FIND('-') THEN
                  REPEAT
                    Freight := Freight + PostedStrOrderLineDetails.Amount;
                  UNTIL PostedStrOrderLineDetails.NEXT =0;
                
                PostedStrOrderLineDetails.SETRANGE("Charge Type",PostedStrOrderLineDetails."Charge Type" :: "2");
                IF PostedStrOrderLineDetails.FIND('-') THEN
                  REPEAT
                    Insurance := Insurance + PostedStrOrderLineDetails.Amount;
                  UNTIL PostedStrOrderLineDetails.NEXT =0;
                
                
                PostedStrOrderLineDetails.SETRANGE("Charge Type",PostedStrOrderLineDetails."Charge Type" :: "0");
                IF InvtSetup."DC Nos." <> '' THEN BEGIN
                  PostedStrOrderLineDetails.SETRANGE("Tax/Charge Group",InvtSetup."DC Nos.");
                  IF PostedStrOrderLineDetails.FIND('-') THEN
                    REPEAT
                      PFAmount := PFAmount + PostedStrOrderLineDetails.Amount;
                    UNTIL PostedStrOrderLineDetails.NEXT =0;
                END;
                */
                //Rupees := Rupees + AssessableValue + BasicExciseDuty
                //+ TAXAmount + Freight + PFAmount  + Insurence + Charges + EDcess + "Charge Type1Dec";

                Rupees := Rupees + AssessableValue + BasicExciseDuty
                 + Freight + PFAmount + Insurence + Charges + EDcess + "Charge Type1Dec" + VAT;

                GrandTotal := Rupees - AdvanceReceive - NotDue;

                IF Customer.GET("Sales Invoice Header"."Bill-to Customer No.") THEN BEGIN
                    BilltocustomerCST := Customer."C.S.T. No.";
                    BilltocustomerLST := Customer."L.S.T. No.";
                END;

            end;

            trigger OnPreDataItem();
            begin
                /*CompanyInfo.GET;
                IF PrintLogo THEN
                  CompanyInfo2.CALCFIELDS(Picture);
                InvtSetup.GET;
                */
                IF CompanyInfo.FIND('-') THEN
                    CompanyInfo.CALCFIELDS(CompanyInfo.Picture);

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
        CompanyInfo: Record "Company Information";
        PrintLogo: Boolean;
        CompanyInfo2: Record "Company Information";
        InvtSetup: Record "Inventory Setup";
        Customer: Record Customer;
        SINO: Integer;
        CST: Record Customer;
        APGST: Record "Company Information";
        CSTNO: Record "Company Information";
        CEREG: Record "Company Information";
        ExciseAmount: Decimal;
        EducationCess: Decimal;
        CEDuty: Decimal;
        TAXAmount: Decimal;
        Freight: Decimal;
        PFAmount: Decimal;
        Excise: Decimal;
        STAmount: Decimal;
        Insurence: Decimal;
        Charges: Decimal;
        Rupees: Decimal;
        AdvanceReceive: Decimal;
        GrandTotal: Decimal;
        SalesInvoiceLine: Record "Sales Invoice Line";
        AssessableValue: Decimal;
        PostedStrOrderLineDetails: Record "Posted Str Order Line Details";
        Text0001: Label 'DETAILS VIDE ANNEXURE TO INVOICE NO';
        Text0002: Label 'DATED';
        OurReference: Text[30];
        Numtext: array[2] of Text[80];
        check: Report Check;
        "Charge Type": Text[50];
        ExciseEntry: Record "Excise Entry";
        TaxEntry: Record "Tax Entry";
        BasicExciseDuty: Decimal;
        EDcess: Decimal;
        BilltocustomerCST: Code[50];
        BilltocustomerLST: Code[50];
        "Freight Text": Text[30];
        "Insurance Text": Text[30];
        "Charge Type1": Text[50];
        "Charge Type1Dec": Decimal;
        Currency: Code[10];
        CustomerPO: Text[30];
        "Invoice Type": Text[30];
        Temp: Boolean;
        VAT: Decimal;
        APVAT: Decimal;
        NotDue: Decimal;
        NotDueDtl: Text[100];
        CST1: Option;
        VAT1: Option;
        Text005: Label 'Page %1';
        FAX_CaptionLbl: Label 'FAX:';
        Visit_us_CaptionLbl: Label 'Visit us:';
        CST_No________CaptionLbl: Label 'CST No.      :';
        APGST_No___CaptionLbl: Label 'APGST No. :';
        E_Mail_CaptionLbl: Label 'E Mail:';
        Ph_CaptionLbl: Label 'Ph:';
        Our_Ref_____CO_No_CaptionLbl: Label 'Our Ref.:   CO No.';
        Consignee_Name___Address_CaptionLbl: Label 'Consignee Name & Address:';
        COMMERCIAL_INV_NO_CaptionLbl: Label 'COMMERCIAL INV NO.';
        INVOICE_CaptionLbl: Label '"-  INVOICE "';
        All_disputes_are_subject_to_jurisdiction_of_Hyderabad_onlyCaptionLbl: Label 'All disputes are subject to jurisdiction of Hyderabad only';
        Under_Centeral_Excise_Rule_7_1__CENVAT_credit_can_be_taken_on_any_copy_of_invoice_issued_by_us_as_manufacturers_under_CENVAT_Lbl: Label 'Under Centeral Excise Rule 7(1) CENVAT credit can be taken on any copy of invoice issued by us as manufacturers under CENVAT rule 11. No additional proof of payment of Excise Duty is envisaged under the Rules. The Excise Duty charged in our invoice should be paid fully and we accept no deduction from our invoice on any account whatsoever.';
        Balance_payable_nowCaptionLbl: Label 'Balance payable now';
        Less__Amount_ReceivedCaptionLbl: Label 'Less: Amount Received';
        TotalCaptionLbl: Label 'Total';
        Educational_Cess___2__on_EDCaptionLbl: Label 'Educational Cess @ 2% on ED';
        Supplied_subject_to_our_usual_terms_of_sales_as_modified_by_us_in_writing_where_applicableCaptionLbl: Label 'Supplied subject to our usual terms of sales as modified by us in writing where applicable';
        Central_Excise_duty_as_per_CE_InvoiceCaptionLbl: Label 'Central Excise duty as per CE Invoice';
        CST___________Service_Tax_10_2____VAT__________CaptionLbl: Label '"CST @       / Service Tax@10.2% / VAT@         "';
        Packing_ChargesCaptionLbl: Label 'Packing Charges';
        Date__CaptionLbl: Label 'Date :';
        Unit_RateCaptionLbl: Label 'Unit Rate';
        Qty_CaptionLbl: Label 'Qty.';
        AmountCaptionLbl: Label 'Amount';
        DescriptionCaptionLbl: Label 'Description';
        S_No_CaptionLbl: Label 'S.No.';
        Amount_in_wordsCaptionLbl: Label 'Amount in words';
        TIN_No___CaptionLbl: Label 'TIN No. :';
        CST_No___CaptionLbl: Label 'CST No. :';
        CE_Regn__No___CaptionLbl: Label 'CE Regn. No. :';
        CE_Invoice_No_CaptionLbl: Label 'CE Invoice No.';
        CE_Invoice_Date_CaptionLbl: Label 'CE Invoice Date:';
        V0CaptionLbl: Label '0';
        Way_Bill_No_CaptionLbl: Label 'Way Bill No.';
        Your_Order_No_CaptionLbl: Label 'Your Order No.';
        Date__Caption_Control1102152009Lbl: Label 'Date :';
        Prepared_byCaptionLbl: Label 'Prepared by';
        For_Efftronics_Systems__P__Ltd__CaptionLbl: Label 'For Efftronics Systems (P) Ltd.,';
        VerifiedCaptionLbl: Label 'Verified';
        Authorised_SignatoryCaptionLbl: Label 'Authorised Signatory';
        Certified_that_the_Particulars_given_above_are_true_and_correct_and_the_amount_indicated_represents_the_price_actually_chargeLbl: Label 'Certified that the Particulars given above are true and correct and the amount indicated represents the price actually charged and that there is no flow of additional considerations directly or indirectly from the buyer.';
        Unit_RateCaption_Control1102152193Lbl: Label 'Unit Rate';
        Qty_Caption_Control1102152194Lbl: Label 'Qty.';
        AmountCaption_Control1102152195Lbl: Label 'Amount';
        DescriptionCaption_Control1102152196Lbl: Label 'Description';
        S_No_Caption_Control1102152197Lbl: Label 'S.No.';
        Customer_Name_CaptionLbl: Label 'Customer Name:';
        ANNEXURE_TO_INVOICE_NO__CaptionLbl: Label '" ANNEXURE TO INVOICE NO.:"';
        DATED_CaptionLbl: Label 'DATED:';
        Unit_RateCaption_Control1102152207Lbl: Label 'Unit Rate';
        Qty_Caption_Control1102152208Lbl: Label 'Qty.';
        AmountCaption_Control1102152209Lbl: Label 'Amount';
        DescriptionCaption_Control1102152210Lbl: Label 'Description';
        S_No_Caption_Control1102152211Lbl: Label 'S.No.';
        TotalCaption_Control1102152010Lbl: Label 'Total';
}

