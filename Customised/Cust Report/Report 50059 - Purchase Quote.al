report 50059 "Purchase Quote"
{
    // version NAVW13.70,NAVIN3.70.00.13,DIM1.0

    // Project : EFFTRONICS
    // *************************************************************************************************************************
    // SIGN Name
    // ************************************************************************************************************************
    // DIM : Resolution of Dimension Issues after Upgarding.
    // ***********************************************************************************************************************
    // Version  sign     Date       USERID    Description
    // *************************************************************************************************************************
    // 1.0      DIM      28-May-13  SAIRAM    New Code has been added for the dimensions updation after upgarding.
    DefaultLayout = RDLC;
    RDLCLayout = './Purchase Quote.rdlc';

    Caption = 'Purchase Quote';

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = SORTING(Document Type, No.) WHERE(Document Type=CONST(Quote));
            RequestFilterFields = "No.", "Buy-from Vendor No.", "No. Printed";
            ReqFilterHeading = 'Purchase Order';
            column(Purchase_Header_Document_Type; "Document Type")
            {
            }
            column(Purchase_Header_No_; "No.")
            {
            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING(Number);
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                    column(CompanyAddr_1_; CompanyAddr[1])
                    {
                    }
                    column(CompanyAddr_2_; CompanyAddr[2])
                    {
                    }
                    column(CompanyAddr_3_; CompanyAddr[3])
                    {
                    }
                    column(CompanyInfo__E_Mail_; CompanyInfo."E-Mail")
                    {
                    }
                    column(CompanyInfo__Phone_No__; CompanyInfo."Phone No.")
                    {
                    }
                    column(CompanyInfo__Fax_No__; CompanyInfo."Fax No.")
                    {
                    }
                    column(CompanyInfo__Home_Page_; CompanyInfo."Home Page")
                    {
                    }
                    column(CompanyInfo_Picture; CompanyInfo.Picture)
                    {
                    }
                    column(BuyFromAddr_6_; BuyFromAddr[6])
                    {
                    }
                    column(BuyFromAddr_5_; BuyFromAddr[5])
                    {
                    }
                    column(BuyFromAddr_4_; BuyFromAddr[4])
                    {
                    }
                    column(BuyFromAddr_3_; BuyFromAddr[3])
                    {
                    }
                    column(ContactCellNo__; "ContactCellNo.")
                    {
                    }
                    column(BuyFromAddr_2_; BuyFromAddr[2])
                    {
                    }
                    column(ContactPhNo__; "ContactPhNo.")
                    {
                    }
                    column(ContactFAXNo__; "ContactFAXNo.")
                    {
                    }
                    column(ContactName; ContactName)
                    {
                    }
                    column(Purchase_Header___No__; "Purchase Header"."No.")
                    {
                    }
                    column(Purchase_Header___Document_Date_; "Purchase Header"."Document Date")
                    {
                    }
                    column(ContactE_mail_; "ContactE-mail")
                    {
                    }
                    column(BuyFromAddr_1_; BuyFromAddr[1])
                    {
                    }
                    column(PaymentTerms_Description; PaymentTerms.Description)
                    {
                    }
                    column(ShipmentMethod_Description; ShipmentMethod.Description)
                    {
                    }
                    column(PurchaserName; PurchaserName)
                    {
                    }
                    column(PackingDetails; PackingDetails)
                    {
                    }
                    column(Verification_Requirements_; "Verification Requirements")
                    {
                    }
                    column(Note; Note)
                    {
                    }
                    column(Purchase_Header___Requested_Receipt_Date_; "Purchase Header"."Requested Receipt Date")
                    {
                        AutoFormatExpression = "Purchase Header"."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(E__Mail_Caption; E__Mail_CaptionLbl)
                    {
                    }
                    column(Ph_Caption; Ph_CaptionLbl)
                    {
                    }
                    column(FAX_Caption; FAX_CaptionLbl)
                    {
                    }
                    column(URL_Caption; URL_CaptionLbl)
                    {
                    }
                    column(To_Provide_Insight_For_Enhancing_WealthCaption; To_Provide_Insight_For_Enhancing_WealthCaptionLbl)
                    {
                    }
                    column(Cell_No_______Caption; Cell_No_______CaptionLbl)
                    {
                    }
                    column(Fax_No________Caption; Fax_No________CaptionLbl)
                    {
                    }
                    column(Ph_No_________Caption; Ph_No_________CaptionLbl)
                    {
                    }
                    column(ToCaption; ToCaptionLbl)
                    {
                    }
                    column(Qtn__Ref_No__Caption; Qtn__Ref_No__CaptionLbl)
                    {
                    }
                    column(Qtn_Date_Caption; Qtn_Date_CaptionLbl)
                    {
                    }
                    column(Contact_Person__Caption; Contact_Person__CaptionLbl)
                    {
                    }
                    column(E_mail_Caption; E_mail_CaptionLbl)
                    {
                    }
                    column(Payment_Terms_Caption; Payment_Terms_CaptionLbl)
                    {
                    }
                    column(Delivery_Terms__Caption; Delivery_Terms__CaptionLbl)
                    {
                    }
                    column(Delivery_Date_Caption; Delivery_Date_CaptionLbl)
                    {
                    }
                    column(Verification_Requirements_Caption; Verification_Requirements_CaptionLbl)
                    {
                    }
                    column(Packing_Details_Caption; Packing_Details_CaptionLbl)
                    {
                    }
                    column(Manager_Purchases_Caption; Manager_Purchases_CaptionLbl)
                    {
                    }
                    column(Note_Caption; Note_CaptionLbl)
                    {
                    }
                    column(PageLoop_Number; Number)
                    {
                    }
                    dataitem(DimensionLoop1; "Integer")
                    {
                        DataItemLinkReference = "Purchase Header";
                        DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
                        column(DimText; DimText)
                        {
                        }
                        column(DimText_Control72; DimText)
                        {
                        }
                        column(Header_DimensionsCaption; Header_DimensionsCaptionLbl)
                        {
                        }
                        column(DimensionLoop1_Number; Number)
                        {
                        }

                        trigger OnAfterGetRecord();
                        begin
                            //DIM1.0 Start
                            //Code Commented
                            /*
                            IF Number = 1 THEN BEGIN
                              IF NOT DocDim1.FIND('-') THEN
                                CurrReport.BREAK;
                            END ELSE
                              IF NOT Continue THEN
                                CurrReport.BREAK;
                            
                            CLEAR(DimText);
                            Continue := FALSE;
                            REPEAT
                              OldDimText := DimText;
                              IF DimText = '' THEN
                                DimText := STRSUBSTNO(
                                  '%1 %2',DocDim1."Dimension Code",DocDim1."Dimension Value Code")
                              ELSE
                                DimText :=
                                  STRSUBSTNO(
                                    '%1, %2 %3',DimText,
                                    DocDim1."Dimension Code",DocDim1."Dimension Value Code");
                              IF STRLEN(DimText) > MAXSTRLEN(OldDimText) THEN BEGIN
                                DimText := OldDimText;
                                Continue := TRUE;
                                EXIT;
                              END;
                            UNTIL (DocDim1.NEXT = 0);
                            */

                            IF Number = 1 THEN BEGIN
                                IF NOT DimSetEntryGRec.FINDFIRST THEN
                                    CurrReport.BREAK;
                            END ELSE
                                IF NOT Continue THEN
                                    CurrReport.BREAK;

                            CLEAR(DimText);
                            Continue := FALSE;
                            REPEAT
                                OldDimText := DimText;
                                IF DimText = '' THEN
                                    DimText := STRSUBSTNO(
                                      '%1 %2', DimSetEntryGRec."Dimension Code", DimSetEntryGRec."Dimension Value Code")
                                ELSE
                                    DimText :=
                                      STRSUBSTNO(
                                        '%1, %2 %3', DimText,
                                        DimSetEntryGRec."Dimension Code", DimSetEntryGRec."Dimension Value Code");
                                IF STRLEN(DimText) > MAXSTRLEN(OldDimText) THEN BEGIN
                                    DimText := OldDimText;
                                    Continue := TRUE;
                                    EXIT;
                                END;
                            UNTIL (DimSetEntryGRec.NEXT = 0);

                            //DIM1.0 End

                        end;

                        trigger OnPreDataItem();
                        begin
                            IF NOT ShowInternalInfo THEN
                                CurrReport.BREAK;
                        end;
                    }
                    dataitem("Purchase Line"; "Purchase Line")
                    {
                        DataItemLink = Document Type=FIELD(Document Type),Document No.=FIELD(No.);
                        DataItemLinkReference = "Purchase Header";
                        DataItemTableView = SORTING(Document Type,Document No.,Line No.);

                        trigger OnPreDataItem();
                        begin
                            CurrReport.BREAK;
                        end;
                    }
                    dataitem(RoundLoop;"Integer")
                    {
                        DataItemTableView = SORTING(Number);
                        column(Purchase_Line__Description;"Purchase Line".Description)
                        {
                        }
                        column(Purchase_Line___No__;"Purchase Line"."No.")
                        {
                        }
                        column(Purchase_Line__Description_Control63;"Purchase Line".Description)
                        {
                        }
                        column(Purchase_Line__Quantity;"Purchase Line".Quantity)
                        {
                        }
                        column(Purchase_Line___Unit_of_Measure_;"Purchase Line"."Unit of Measure")
                        {
                        }
                        column(Sl_No__;"Sl.No.")
                        {
                        }
                        column(LineAmt;LineAmt)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(Item_CodeCaption;Item_CodeCaptionLbl)
                        {
                        }
                        column(Item_DescriptionCaption;Item_DescriptionCaptionLbl)
                        {
                        }
                        column(Qty_Req_Caption;Qty_Req_CaptionLbl)
                        {
                        }
                        column(UnitCaption;UnitCaptionLbl)
                        {
                        }
                        column(Sl_No_Caption;Sl_No_CaptionLbl)
                        {
                        }
                        column(MakeCaption;MakeCaptionLbl)
                        {
                        }
                        column(ContinuedCaption;ContinuedCaptionLbl)
                        {
                        }
                        column(RoundLoop_Number;Number)
                        {
                        }
                        dataitem(DimensionLoop2;"Integer")
                        {
                            DataItemTableView = SORTING(Number) WHERE(Number=FILTER(1..));
                            column(DimText_Control74;DimText)
                            {
                            }
                            column(Line_DimensionsCaption;Line_DimensionsCaptionLbl)
                            {
                            }
                            column(DimensionLoop2_Number;Number)
                            {
                            }

                            trigger OnAfterGetRecord();
                            begin
                                //DIM1.0 Start
                                //Commented
                                
                                /*
                                IF Number = 1 THEN BEGIN
                                  IF NOT DocDim2.FIND('-') THEN
                                    CurrReport.BREAK;
                                END ELSE
                                  IF NOT Continue THEN
                                    CurrReport.BREAK;
                                CLEAR(DimText);
                                Continue := FALSE;
                                REPEAT
                                  OldDimText := DimText;
                                  IF DimText = '' THEN
                                    DimText := STRSUBSTNO(
                                      '%1 %2',DocDim2."Dimension Code",DocDim2."Dimension Value Code")
                                  ELSE
                                    DimText :=
                                      STRSUBSTNO(
                                        '%1, %2 %3',DimText,
                                        DocDim2."Dimension Code",DocDim2."Dimension Value Code");
                                  IF STRLEN(DimText) > MAXSTRLEN(OldDimText) THEN BEGIN
                                    DimText := OldDimText;
                                    Continue := TRUE;
                                    EXIT;
                                  END;
                                UNTIL (DocDim2.NEXT = 0);
                                */
                                
                                IF Number = 1 THEN BEGIN
                                  IF NOT DimSetEntryGRec2.FINDFIRST THEN
                                    CurrReport.BREAK;
                                END ELSE
                                  IF NOT Continue THEN
                                    CurrReport.BREAK;
                                CLEAR(DimText);
                                Continue := FALSE;
                                REPEAT
                                  OldDimText := DimText;
                                  IF DimText = '' THEN
                                    DimText := STRSUBSTNO(
                                      '%1 %2',DimSetEntryGRec2."Dimension Code",DimSetEntryGRec2."Dimension Value Code")
                                  ELSE
                                    DimText :=
                                      STRSUBSTNO(
                                        '%1, %2 %3',DimText,
                                        DimSetEntryGRec2."Dimension Code",DimSetEntryGRec2."Dimension Value Code");
                                  IF STRLEN(DimText) > MAXSTRLEN(OldDimText) THEN BEGIN
                                    DimText := OldDimText;
                                    Continue := TRUE;
                                    EXIT;
                                  END;
                                UNTIL (DimSetEntryGRec2.NEXT = 0);
                                
                                //DIM1.0 End

                            end;

                            trigger OnPreDataItem();
                            begin
                                IF NOT ShowInternalInfo THEN
                                  CurrReport.BREAK;
                                //DIM1.0 Start
                                //Commented
                                /*
                                DocDim2.SETRANGE("Table ID",DATABASE::"Purchase Line");
                                DocDim2.SETRANGE("Document Type","Purchase Line"."Document Type");
                                DocDim2.SETRANGE("Document No.","Purchase Line"."Document No.");
                                DocDim2.SETRANGE("Line No.","Purchase Line"."Line No.");
                                */
                                DimSetEntryGRec2.RESET;
                                DimSetEntryGRec2.SETRANGE("Dimension Set ID","Purchase Line"."Dimension Set ID");
                                
                                //DIM1.0 End

                            end;
                        }

                        trigger OnAfterGetRecord();
                        begin
                            IF Number = 1 THEN
                              PurchLine.FIND('-')
                            ELSE
                              PurchLine.NEXT;
                            "Purchase Line" := PurchLine;

                            IF NOT "Purchase Header"."Prices Including VAT" AND
                               (PurchLine."VAT Calculation Type" = PurchLine."VAT Calculation Type"::"Full VAT")
                            THEN
                              PurchLine."Line Amount" := 0;

                            IF (PurchLine.Type = PurchLine.Type::"G/L Account") AND (NOT ShowInternalInfo) THEN
                              "Purchase Line"."No." := '';

                            // NAVIN
                            IF Currency.GET(PurchLine."Currency Code") THEN;
                            LineAmt := ROUND(PurchLine.Quantity * PurchLine."Direct Unit Cost",Currency."Amount Rounding Precision");
                            LineTotAmt := LineTotAmt + LineAmt;

                            StructureLineDetails.SETRANGE(StructureLineDetails.Type,StructureLineDetails.Type::Purchase);
                            StructureLineDetails.SETRANGE(StructureLineDetails."Document Type",PurchLine."Document Type");
                            StructureLineDetails.SETRANGE(StructureLineDetails."Document No.",PurchLine."Document No.");
                            StructureLineDetails.SETRANGE(StructureLineDetails."Item No.",PurchLine."No.");
                            StructureLineDetails.SETRANGE("Line No.",PurchLine."Line No.");
                            IF StructureLineDetails.FIND('-') THEN
                              REPEAT
                                IF StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::Excise THEN
                                  ExciseAmount := ExciseAmount + StructureLineDetails.Amount;
                                IF StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::Charges THEN
                                  Charges := Charges + StructureLineDetails.Amount;
                                IF StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::"Other Taxes" THEN
                                  Othertaxes := Othertaxes + StructureLineDetails.Amount;
                                IF StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::"Sales Tax" THEN
                                  SalesTax := SalesTax + StructureLineDetails.Amount;
                                IF StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::GST THEN
                                  ServiceTax := ServiceTax + StructureLineDetails.Amount;
                                IF StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::"Service Tax" THEN
                                  VATAmount := VATAmount + StructureLineDetails.Amount;
                                LineTotAmt := LineTotAmt + StructureLineDetails.Amount;
                              UNTIL StructureLineDetails.NEXT = 0;
                            // NAVIN

                            //Navision Efftronics
                            IF ("Purchase Line".Type<>"Purchase Line".Type::" ")THEN
                              "Sl.No." := "Sl.No." + 1;
                        end;

                        trigger OnPostDataItem();
                        begin
                            PurchLine.DELETEALL;
                        end;

                        trigger OnPreDataItem();
                        begin
                            // NAVIN
                            LineTotAmt := 0;
                            LineAmt := 0;
                            ExciseAmount := 0;
                            Charges := 0;
                            Othertaxes := 0;
                            SalesTax := 0;
                            VATAmount := 0;
                            // NAVIN

                            MoreLines := PurchLine.FIND('+');
                            WHILE MoreLines AND (PurchLine.Description = '') AND (PurchLine."Description 2"= '') AND
                                  (PurchLine."No." = '') AND (PurchLine.Quantity = 0) AND
                                  (PurchLine.Amount = 0) DO
                              MoreLines := PurchLine.NEXT(-1) <> 0;
                            IF NOT MoreLines THEN
                              CurrReport.BREAK;
                            PurchLine.SETRANGE("Line No.",0,PurchLine."Line No.");
                            SETRANGE(Number,1,PurchLine.COUNT);

                            // NAVIN
                            //CurrReport.CREATETOTALS(PurchLine."Line Amount",PurchLine."Inv. Discount Amount");
                            CurrReport.CREATETOTALS(PurchLine."Line Amount",PurchLine.Amount,PurchLine."Inv. Discount Amount",
                            PurchLine."Line Discount Amount",PurchLine."Amount Including Excise",
                            PurchLine."Amount Including Tax",PurchLine."Excise Amount",PurchLine."Tax Amount",
                            PurchLine."Tax Base Amount",PurchLine."Excise Base Amount");
                            CurrReport.CREATETOTALS(LineAmt,PurchLine."Bal. TDS Including SHE CESS",PurchLine."Work Tax Amount");
                            // NAVIN
                            //Navision Efftronics
                            "Sl.No.":=0;
                        end;
                    }
                    dataitem(VATCounter;"Integer")
                    {
                        DataItemTableView = SORTING(Number);

                        trigger OnAfterGetRecord();
                        begin
                            VATAmountLine.GetLine(Number);
                        end;

                        trigger OnPreDataItem();
                        begin
                            IF VATAmount = 0 THEN
                              CurrReport.BREAK;
                            SETRANGE(Number,1,VATAmountLine.COUNT);
                            CurrReport.CREATETOTALS(
                              VATAmountLine."Line Amount",VATAmountLine."Inv. Disc. Base Amount",
                              VATAmountLine."Invoice Discount Amount",VATAmountLine."VAT Base",VATAmountLine."VAT Amount");
                        end;
                    }
                    dataitem(Total;"Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number=CONST(1));
                    }
                    dataitem(Total2;"Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number=CONST(1));

                        trigger OnPreDataItem();
                        begin
                            IF "Purchase Header"."Buy-from Vendor No." = "Purchase Header"."Pay-to Vendor No." THEN
                              CurrReport.BREAK;
                        end;
                    }
                    dataitem(Total3;"Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number=CONST(1));

                        trigger OnPreDataItem();
                        begin
                            IF ("Purchase Header"."Sell-to Customer No." = '') AND (ShipToAddr[1] = '') THEN
                              CurrReport.BREAK;
                        end;
                    }
                }

                trigger OnAfterGetRecord();
                begin
                    CLEAR(PurchLine);
                    CLEAR(PurchPost);
                    PurchLine.DELETEALL;
                    VATAmountLine.DELETEALL;
                    PurchPost.GetPurchLines("Purchase Header",PurchLine,0);
                    PurchLine.CalcVATAmountLines(0,"Purchase Header",PurchLine,VATAmountLine);
                    PurchLine.UpdateVATOnLines(0,"Purchase Header",PurchLine,VATAmountLine);
                    VATAmount := VATAmountLine.GetTotalVATAmount;
                    VATBaseAmount := VATAmountLine.GetTotalVATBase;
                    VATDiscountAmount :=
                      VATAmountLine.GetTotalVATDiscount("Purchase Header"."Currency Code","Purchase Header"."Prices Including VAT");
                    TotalAmountInclVAT := VATAmountLine.GetTotalAmountInclVAT;

                    IF Number > 1 THEN
                      CopyText := Text003;
                    CurrReport.PAGENO := 1;
                end;

                trigger OnPostDataItem();
                begin
                    IF NOT CurrReport.PREVIEW THEN
                      PurchCountPrinted.RUN("Purchase Header");
                end;

                trigger OnPreDataItem();
                begin
                    NoOfLoops := ABS(NoOfCopies) + 1;
                    CopyText := '';
                    SETRANGE(Number,1,NoOfLoops);
                end;
            }

            trigger OnAfterGetRecord();
            begin
                CurrReport.LANGUAGE := Language.GetLanguageID("Language Code");
                
                CompanyInfo.GET;
                
                IF RespCenter.GET("Responsibility Center") THEN BEGIN
                  FormatAddr.RespCenter(CompanyAddr,RespCenter);
                  CompanyInfo."Phone No." := RespCenter."Phone No.";
                  CompanyInfo."Fax No." := RespCenter."Fax No.";
                END ELSE
                  FormatAddr.Company(CompanyAddr,CompanyInfo);
                
                //DIM1.0 Start
                //Code Commented
                /*
                DocDim1.SETRANGE("Table ID",DATABASE::"Purchase Header");
                DocDim1.SETRANGE("Document Type","Purchase Header"."Document Type");
                DocDim1.SETRANGE("Document No.","Purchase Header"."No.");
                */
                DimSetEntryGRec.RESET;
                DimSetEntryGRec.SETRANGE("Dimension Set ID","Purchase Header"."Dimension Set ID");
                //DIM1.0 END
                
                IF "Purchaser Code" = '' THEN BEGIN
                  SalesPurchPerson.INIT;
                  PurchaserText := '';
                END ELSE BEGIN
                  SalesPurchPerson.GET("Purchaser Code");
                  PurchaserText := Text000
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
                  TotalText := STRSUBSTNO(Text001,GLSetup."LCY Code");
                  TotalInclVATText := STRSUBSTNO(Text002,GLSetup."LCY Code");
                  TotalExclVATText := STRSUBSTNO(Text006,GLSetup."LCY Code");
                END ELSE BEGIN
                  TotalText := STRSUBSTNO(Text001,"Currency Code");
                  TotalInclVATText := STRSUBSTNO(Text002,"Currency Code");
                  TotalExclVATText := STRSUBSTNO(Text006,"Currency Code");
                END;
                
                FormatAddr.PurchHeaderBuyFromtemp(BuyFromAddr,"Purchase Header");
                IF ("Purchase Header"."Buy-from Vendor No." <> "Purchase Header"."Pay-to Vendor No.") THEN
                  FormatAddr.PurchHeaderPayTo(VendAddr,"Purchase Header");
                IF "Payment Terms Code" = '' THEN
                  PaymentTerms.INIT
                ELSE
                  PaymentTerms.GET("Payment Terms Code");
                IF "Shipment Method Code" = '' THEN
                  ShipmentMethod.INIT
                ELSE
                  ShipmentMethod.GET("Shipment Method Code");
                
                FormatAddr.PurchHeaderShipTo(ShipToAddr,"Purchase Header");
                
                IF NOT CurrReport.PREVIEW THEN BEGIN
                  IF ArchiveDocument THEN
                    ArchiveManagement.StorePurchDocument("Purchase Header",LogInteraction);
                
                  IF LogInteraction THEN BEGIN
                    CALCFIELDS("No. of Archived Versions");
                    SegManagement.LogDocument(
                      13,"No.","Doc. No. Occurrence","No. of Archived Versions",DATABASE::Vendor,"Buy-from Vendor No.",
                      "Purchaser Code",'',"Posting Description",'');
                  END;
                END;
                
                //Navision Efftronics
                PurcaserCode.GET("Purchase Header"."Purchaser Code");
                PurchaserName := PurcaserCode.Name;
                IF Contact.GET("Purchase Header"."Buy-from Contact No.") THEN
                 "ContactFAXNo." := Contact."Fax No.";
                  ContactName    := Contact.Name;
                  "ContactPhNo." := Contact."Phone No.";
                 "ContactCellNo.":= Contact."Mobile Phone No.";
                  "ContactE-mail":= Contact."E-Mail";
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

    trigger OnInitReport();
    begin
        GLSetup.GET;
    end;

    var
        Text000 : Label 'Purchaser';
        Text001 : Label 'Total %1';
        Text002 : Label 'Total %1 Incl. VAT';
        Text003 : Label 'COPY';
        Text004 : Label 'Order %1';
        Text005 : Label 'Page %1';
        Text006 : Label 'Total %1 Excl. VAT';
        GLSetup : Record "General Ledger Setup";
        CompanyInfo : Record "Company Information";
        ShipmentMethod : Record "Shipment Method";
        PaymentTerms : Record "Payment Terms";
        SalesPurchPerson : Record "Salesperson/Purchaser";
        VATAmountLine : Record "VAT Amount Line" temporary;
        PurchLine : Record "Purchase Line" temporary;
        RespCenter : Record "Responsibility Center";
        Language : Record Language;
        PurchCountPrinted : Codeunit "Purch.Header-Printed";
        FormatAddr : Codeunit "Format Address";
        PurchPost : Codeunit "Purch.-Post";
        ArchiveManagement : Codeunit ArchiveManagement;
        SegManagement : Codeunit SegManagement;
        VendAddr : array [8] of Text[50];
        ShipToAddr : array [8] of Text[50];
        CompanyAddr : array [8] of Text[50];
        BuyFromAddr : array [8] of Text[50];
        PurchaserText : Text[30];
        VATNoText : Text[30];
        ReferenceText : Text[30];
        TotalText : Text[50];
        TotalInclVATText : Text[50];
        TotalExclVATText : Text[50];
        MoreLines : Boolean;
        NoOfCopies : Integer;
        NoOfLoops : Integer;
        CopyText : Text[30];
        DimText : Text[120];
        OldDimText : Text[75];
        ShowInternalInfo : Boolean;
        Continue : Boolean;
        ArchiveDocument : Boolean;
        LogInteraction : Boolean;
        VATAmount : Decimal;
        VATBaseAmount : Decimal;
        VATDiscountAmount : Decimal;
        TotalAmountInclVAT : Decimal;
        "-NAVIN-" : Integer;
        StructureLineDetails : Record "Structure Order Line Details";
        TotalTaxAmount : Decimal;
        LineAmt : Decimal;
        LineTotAmt : Decimal;
        ExciseAmount : Decimal;
        Charges : Decimal;
        Othertaxes : Decimal;
        SalesTax : Decimal;
        Currency : Record Currency;
        ServiceTax : Decimal;
        "---Navision Efftronics-----" : Integer;
        "Sl.No." : Integer;
        Vendor : Record Vendor;
        PurcaserCode : Record "Salesperson/Purchaser";
        PurchaserName : Text[50];
        "PhoneNo." : Code[20];
        Contact : Record Contact;
        "ContactFAXNo." : Code[20];
        ContactName : Text[50];
        "ContactPhNo." : Text[30];
        "ContactCellNo." : Text[30];
        "ContactE-mail" : Text[30];
        PackingDetails : Text[50];
        "Verification Requirements" : Text[50];
        Note : Text[50];
        E__Mail_CaptionLbl : Label 'E- Mail:';
        Ph_CaptionLbl : Label 'Ph:';
        FAX_CaptionLbl : Label 'FAX:';
        URL_CaptionLbl : Label 'URL:';
        To_Provide_Insight_For_Enhancing_WealthCaptionLbl : Label 'To Provide Insight For Enhancing Wealth';
        Cell_No_______CaptionLbl : Label 'Cell No.     :';
        Fax_No________CaptionLbl : Label 'Fax.No       :';
        Ph_No_________CaptionLbl : Label 'Ph.No        :';
        ToCaptionLbl : Label 'To';
        Qtn__Ref_No__CaptionLbl : Label '"Qtn. Ref.No: "';
        Qtn_Date_CaptionLbl : Label 'Qtn Date:';
        Contact_Person__CaptionLbl : Label 'Contact Person :';
        E_mail_CaptionLbl : Label 'E-mail:';
        Payment_Terms_CaptionLbl : Label 'Payment Terms:';
        Delivery_Terms__CaptionLbl : Label 'Delivery Terms :';
        Delivery_Date_CaptionLbl : Label 'Delivery Date:';
        Verification_Requirements_CaptionLbl : Label 'Verification Requirements:';
        Packing_Details_CaptionLbl : Label 'Packing Details:';
        Manager_Purchases_CaptionLbl : Label '(Manager-Purchases)';
        Note_CaptionLbl : Label 'Note:';
        Header_DimensionsCaptionLbl : Label 'Header Dimensions';
        Item_CodeCaptionLbl : Label 'Item Code';
        Item_DescriptionCaptionLbl : Label 'Item Description';
        Qty_Req_CaptionLbl : Label 'Qty.Req.';
        UnitCaptionLbl : Label 'Unit';
        Sl_No_CaptionLbl : Label 'Sl.No.';
        MakeCaptionLbl : Label 'Make';
        ContinuedCaptionLbl : Label 'Continued';
        Line_DimensionsCaptionLbl : Label 'Line Dimensions';
        "-DIM1.0-" : Integer;
        DimSetEntryGRec : Record "Dimension Set Entry";
        DimSetEntryGRec2 : Record "Dimension Set Entry";
}

