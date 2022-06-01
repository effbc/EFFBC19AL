report 50075 "Sales - Quote2"
{
    // version DIM1.0

    // ------------------------------------------------------------------------
    // Documentation()
    // +----------------------------------------+
    // | Voith Turbo, Heidenheim                |
    // +----------------------------------------+
    // 
    // ------------------------------------------
    // KUMAvision Customer Specifications
    // ------------------------------------------
    // Nr. Update Date     SS  No.        Description
    // 01         08.03.04 jwi            layout and type-fonts generally changed, new globals for User- and Company-Information
    // 
    // Project : EFFTRONICS
    // *************************************************************************************************************************
    // SIGN Name
    // ************************************************************************************************************************
    // DIM : Resolution of Dimension Issues after Upgarding.
    // ***********************************************************************************************************************
    // Version  sign     Date       USERID             Description
    // *************************************************************************************************************************
    // 1.0      DIM      28-May-13  Palla Jagadeesh    New Code has been added for the dimensions updation after upgarding.
    DefaultLayout = RDLC;
    RDLCLayout = './Sales - Quote2.rdlc';


    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = SORTING(Document Type, No.) WHERE(Document Type=CONST(Quote));
            PrintOnlyIfDetail = true;
            RequestFilterFields = "Document Type", "No.", "Sell-to Customer No.", "No. Printed", "Enquiry Status", "Type of Product", "Type of Enquiry", "Sell-to Post Code", "Salesperson Code";
            ReqFilterHeading = 'Sales Order';
            column(Sales_Header_Document_Type; "Document Type")
            {
            }
            column(Sales_Header_No_; "No.")
            {
            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING(Number);
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                    PrintOnlyIfDetail = true;
                    column(CompanyInfo__Home_Page_; CompanyInfo."Home Page")
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
                    column(CompanyAddr_3_; CompanyAddr[3])
                    {
                    }
                    column(CompanyAddr_2_; CompanyAddr[2])
                    {
                    }
                    column(CompanyAddr_1_; CompanyAddr[1])
                    {
                    }
                    column(CompanyInfo_Picture; CompanyInfo.Picture)
                    {
                    }
                    column(CustAddr_2_; CustAddr[2])
                    {
                    }
                    column(CustAddr_3_; CustAddr[3])
                    {
                    }
                    column(CustAddr_4_; CustAddr[4])
                    {
                    }
                    column(CustAddr_5_; CustAddr[5])
                    {
                    }
                    column(CustAddr_6_; CustAddr[6])
                    {
                    }
                    column(CustAddr_7_; CustAddr[7])
                    {
                    }
                    column(CustAddr_8_; CustAddr[8])
                    {
                    }
                    column(CustAddr_1_; CustAddr[1])
                    {
                    }
                    column(Sales_Header___Order_Date_; "Sales Header"."Order Date")
                    {
                    }
                    column(Sales_Header___No__; "Sales Header"."No.")
                    {
                    }
                    column(name1; name1)
                    {
                    }
                    column(desigantion1; desigantion1)
                    {
                    }
                    column(name2; name2)
                    {
                    }
                    column(attach_1_; attach[1])
                    {
                    }
                    column(attach_2_; attach[2])
                    {
                    }
                    column(attach_3_; attach[3])
                    {
                    }
                    column(attach_4_; attach[4])
                    {
                    }
                    column(designation2; designation2)
                    {
                    }
                    column(E__Mail_Caption; E__Mail_CaptionLbl)
                    {
                    }
                    column(FAX_Caption; FAX_CaptionLbl)
                    {
                    }
                    column(URL_Caption; URL_CaptionLbl)
                    {
                    }
                    column(Ph_Caption; Ph_CaptionLbl)
                    {
                    }
                    column(To_Provide_Insight_For_Enhancing_WealthCaption; To_Provide_Insight_For_Enhancing_WealthCaptionLbl)
                    {
                    }
                    column(Enquiry_Ref_NO_Caption; Enquiry_Ref_NO_CaptionLbl)
                    {
                    }
                    column(Date___Caption; Date___CaptionLbl)
                    {
                    }
                    column(Customer_NameCaption; Customer_NameCaptionLbl)
                    {
                    }
                    column(Quote_NoCaption; Quote_NoCaptionLbl)
                    {
                    }
                    column(Dear_Sir_Caption; Dear_Sir_CaptionLbl)
                    {
                    }
                    column(With_Reference_to_your_enquiry__we_are_here_with_furnishing_our_offer_for_your_kind_considerationCaption; With_Reference_to_your_enquiry__we_are_here_with_furnishing_our_offer_for_your_kind_considerationCaptionLbl)
                    {
                    }
                    column(Thanking_You_Caption; Thanking_You_CaptionLbl)
                    {
                    }
                    column(Yours_faithfullyCaption; Yours_faithfullyCaptionLbl)
                    {
                    }
                    column(Enclosures_Caption; Enclosures_CaptionLbl)
                    {
                    }
                    column(EFFTRONICS__SYSTEMS_PVT__LTD_Caption; EFFTRONICS__SYSTEMS_PVT__LTD_CaptionLbl)
                    {
                    }
                    column(PageLoop_Number; Number)
                    {
                    }
                    dataitem(DimensionLoop1; "Integer")
                    {
                        DataItemLinkReference = "Sales Header";
                        DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));

                        trigger OnAfterGetRecord();
                        begin
                            //Dim1.0 Start
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
                                IF NOT DimSetEntryGRec.FINDSET THEN
                                    CurrReport.BREAK;
                            END ELSE
                                IF NOT Continue THEN
                                    CurrReport.BREAK;

                            CLEAR(DimText);
                            Continue := FALSE;
                            REPEAT
                                OldDimText := DimText;
                                IF DimText = '' THEN
                                    DimText := STRSUBSTNO('%1 %2', DimSetEntryGRec."Dimension Code", DimSetEntryGRec."Dimension Value Code")
                                ELSE
                                    DimText :=
                                      STRSUBSTNO(
                                        '%1, %2 %3', DimText, DimSetEntryGRec."Dimension Code", DimSetEntryGRec."Dimension Value Code");
                                IF STRLEN(DimText) > MAXSTRLEN(OldDimText) THEN BEGIN
                                    DimText := OldDimText;
                                    Continue := TRUE;
                                    EXIT;
                                END;
                            UNTIL DimSetEntryGRec.NEXT = 0;
                            //Dim1.0<< end

                        end;

                        trigger OnPreDataItem();
                        begin
                            IF NOT ShowInternalInfo THEN
                                CurrReport.BREAK;
                        end;
                    }
                    dataitem("Sales Line"; "Sales Line")
                    {
                        DataItemLink = Document Type=FIELD(Document Type),Document No.=FIELD(No.);
                        DataItemLinkReference = "Sales Header";
                        DataItemTableView = SORTING(Document Type,Document No.,Schedule Type,Line No.);
                        column(Sales_Line__Schedule_Type_;"Schedule Type")
                        {
                        }
                        column(Sales_Line_Quantity;Quantity)
                        {
                        }
                        column(SLNO;SLNO)
                        {
                        }
                        column(descri;descri)
                        {
                        }
                        column(Sales_Line__Unit_of_Measure_Code_;"Unit of Measure Code")
                        {
                        }
                        column(Sales_Line_Description;Description)
                        {
                        }
                        column(Sales_Line__Line_Amount_;"Line Amount")
                        {
                        }
                        column(Sales_Line__Unit_Price_;"Unit Price")
                        {
                        }
                        column(Sales_Line_Description_Control1102152022;Description)
                        {
                        }
                        column(QtyCaption;QtyCaptionLbl)
                        {
                        }
                        column(UnitCaption;UnitCaptionLbl)
                        {
                        }
                        column(Sl_No_Caption;Sl_No_CaptionLbl)
                        {
                        }
                        column(DescriptionCaption;DescriptionCaptionLbl)
                        {
                        }
                        column(AmountCaption;AmountCaptionLbl)
                        {
                        }
                        column(Unit_PriceCaption;Unit_PriceCaptionLbl)
                        {
                        }
                        column(QtyCaption_Control1000000074;QtyCaption_Control1000000074Lbl)
                        {
                        }
                        column(UnitCaption_Control1000000075;UnitCaption_Control1000000075Lbl)
                        {
                        }
                        column(Sl_No_Caption_Control1000000095;Sl_No_Caption_Control1000000095Lbl)
                        {
                        }
                        column(DescriptionCaption_Control1102152017;DescriptionCaption_Control1102152017Lbl)
                        {
                        }
                        column(AmountCaption_Control1102152041;AmountCaption_Control1102152041Lbl)
                        {
                        }
                        column(Unit_PriceCaption_Control1102152044;Unit_PriceCaption_Control1102152044Lbl)
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
                            IF ("Sales Line".Type<>"Sales Line".Type::" ")THEN
                               SLNO:=SLNO+1;
                            /*IF "Sales Line".Type =  "Sales Line".Type::Item THEN
                              Item.GET("Sales Line"."No.");
                            
                            CrossRefCode := '';
                            
                            IF CrossRef AND (Type = Type::Item ) THEN BEGIN
                              itemCrossRef.SETRANGE(itemCrossRef."Cross-Reference Type",itemCrossRef."Cross-Reference Type"::Customer);
                              itemCrossRef.SETRANGE(itemCrossRef."Item No.","No.");
                              itemCrossRef.SETRANGE(itemCrossRef."Cross-Reference Type No.","Sales Header"."Sell-to Customer No.");
                              IF itemCrossRef.FIND('-') THEN
                                CrossRefCode := '(Your Ref. Code :  ' + itemCrossRef."Cross-Reference No." + ')' ;
                            END;*/

                        end;

                        trigger OnPreDataItem();
                        begin
                            //CurrReport.BREAK;
                            SLNO:=0;
                        end;
                    }
                    dataitem(RoundLoop;"Integer")
                    {
                        DataItemTableView = SORTING(Number);
                        dataitem(DimensionLoop2;"Integer")
                        {
                            DataItemTableView = SORTING(Number) WHERE(Number=FILTER(1..));

                            trigger OnAfterGetRecord();
                            begin
                                //Dim1.0 Start
                                //Code Commented
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
                                  IF NOT DimSetEntryGRec2.FINDSET THEN
                                    CurrReport.BREAK;
                                END ELSE
                                  IF NOT Continue THEN
                                    CurrReport.BREAK;
                                
                                CLEAR(DimText);
                                Continue := FALSE;
                                REPEAT
                                  OldDimText := DimText;
                                  IF DimText = '' THEN
                                    DimText := STRSUBSTNO('%1 %2',DimSetEntryGRec2."Dimension Code",DimSetEntryGRec2."Dimension Value Code")
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
                                UNTIL DimSetEntryGRec2.NEXT = 0;
                                //Dim1.0 end

                            end;

                            trigger OnPreDataItem();
                            begin
                                IF NOT ShowInternalInfo THEN
                                  CurrReport.BREAK;
                                
                                //DIM1.0 Start
                                //Commented
                                /*
                                DocDim2.SETRANGE("Table ID",DATABASE::"Sales Line");
                                DocDim2.SETRANGE("Document Type","Sales Line"."Document Type");
                                DocDim2.SETRANGE("Document No.","Sales Line"."Document No.");
                                DocDim2.SETRANGE("Line No.","Sales Line"."Line No.");
                                */
                                DimSetEntryGRec2.SETRANGE("Dimension Set ID","Sales Line"."Dimension Set ID");
                                //DIM1.0 End

                            end;
                        }

                        trigger OnAfterGetRecord();
                        begin
                            IF Number = 1 THEN
                              SalesLine.FIND('-')
                            ELSE
                              SalesLine.NEXT;
                            "Sales Line" := SalesLine;

                            IF NOT "Sales Header"."Prices Including VAT" AND
                               (SalesLine."VAT Calculation Type" = SalesLine."VAT Calculation Type"::"Full VAT")
                            THEN
                              SalesLine."Line Amount" := 0;

                            IF (SalesLine.Type = SalesLine.Type::"G/L Account") AND (NOT ShowInternalInfo) THEN
                              "Sales Line"."No." := '';

                            CrossRefCode := '';

                            IF CrossRef AND (SalesLine.Type = SalesLine.Type::Item ) THEN BEGIN
                              itemCrossRef.SETRANGE(itemCrossRef."Cross-Reference Type",itemCrossRef."Cross-Reference Type"::Customer);
                              itemCrossRef.SETRANGE(itemCrossRef."Item No.",SalesLine."No.");
                              itemCrossRef.SETRANGE(itemCrossRef."Cross-Reference Type No.","Sales Header"."Sell-to Customer No.");
                              IF itemCrossRef.FIND('-') THEN
                                CrossRefCode := '(Your Ref. Code :  ' + itemCrossRef."Cross-Reference No." + ')' ;
                            END;
                        end;

                        trigger OnPostDataItem();
                        begin
                            SalesLine.DELETEALL;
                        end;

                        trigger OnPreDataItem();
                        begin
                            MoreLines := SalesLine.FIND('+');
                            WHILE MoreLines AND (SalesLine.Description = '') AND (SalesLine."Description 2"= '') AND
                                  (SalesLine."No." = '') AND (SalesLine.Quantity = 0) AND
                                  (SalesLine.Amount = 0)
                            DO
                              MoreLines :=SalesLine.NEXT(-1) <> 0;
                            IF NOT MoreLines THEN
                              CurrReport.BREAK;
                            SalesLine.SETRANGE("Line No.",0,SalesLine."Line No.");
                            SETRANGE(Number,1,SalesLine.COUNT);
                            CurrReport.CREATETOTALS(SalesLine."Line Amount",SalesLine."Inv. Discount Amount");
                        end;
                    }
                    dataitem(SalesLine2;"Sales Line")
                    {
                        DataItemTableView = SORTING(Document Type,Document No.,Schedule Type,Line No.) WHERE(Document Type=CONST(Order),Type=FILTER(<>' '));

                        trigger OnAfterGetRecord();
                        begin
                            IF ("Sales Line".Type<>"Sales Line".Type::" ")THEN
                               SLNO:=SLNO+1;
                            /*SalesLine2.SETRANGE("Document No.","Sales Header"."No.");
                            IF SalesLine2.FIND('-') THEN BEGIN
                                REPEAT
                                  "Total Amount":="Total Amount"+SalesLine2.Amount;
                                UNTIL SalesLine2.NEXT=0;
                            END;*/

                        end;

                        trigger OnPreDataItem();
                        begin
                            SalesLine2.SETRANGE(SalesLine2."Document No.","Sales Header"."No.");
                            IF SalesLine2.FIND('-') THEN;
                            "Total Amount":=0;
                            SLNO:=0;
                            TechSlNo := 0;
                        end;
                    }

                    trigger OnPreDataItem();
                    begin
                          CompanyInfo.GET;
                          CompanyInfo.CALCFIELDS(Picture);
                    end;
                }

                trigger OnAfterGetRecord();
                var
                    SalesPost : Codeunit "Sales-Post";
                begin
                    /*CLEAR(SalesLine);
                    CLEAR(SalesPost);
                    SalesLine.DELETEALL;
                    //VATAmountLine.DELETEALL;
                    SalesPost.GetSalesLines("Sales Header",SalesLine,0);
                    //SalesLine.ShowPostInspectReceipt(0,"Sales Header",SalesLine,VATAmountLine);
                    SalesLine.UpdateVATOnLines(0,"Sales Header",SalesLine,VATAmountLine);
                    //VATAmount := VATAmountLine.GetTotalVATAmount;
                    //VATBaseAmount := VATAmountLine.GetTotalVATBase;
                    VATDiscountAmount :=
                      VATAmountLine.GetTotalVATDiscount("Sales Header"."Currency Code","Sales Header"."Prices Including VAT");
                    TotalAmountInclVAT := VATAmountLine.GetTotalAmountInclVAT;
                    
                    IF Number > 1 THEN
                      CopyText := Text003;
                    CurrReport.PAGENO := 1;
                    *///NS

                end;

                trigger OnPostDataItem();
                begin
                    IF NOT CurrReport.PREVIEW THEN
                      SalesCountPrinted.RUN("Sales Header");
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
                DocDim1.SETRANGE("Table ID",DATABASE::"Sales Header");
                DocDim1.SETRANGE("Document Type","Sales Header"."Document Type");
                DocDim1.SETRANGE("Document No.","Sales Header"."No.");
                */
                DimSetEntryGRec.RESET;
                DimSetEntryGRec.SETRANGE("Dimension Set ID","Dimension Set ID");
                //DIM1.0 End
                
                
                
                
                
                IF "Salesperson Code" = '' THEN BEGIN
                  SalesPurchPerson.INIT;
                  SalesPersonText := '';
                END ELSE BEGIN
                  SalesPurchPerson.GET("Salesperson Code");
                  SalesPersonText := Text000;
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
                FormatAddr.SalesHeaderSellTo(CustAddr,"Sales Header");
                
                IF "Payment Terms Code" = '' THEN
                  PaymentTerms.INIT
                ELSE
                  PaymentTerms.GET("Payment Terms Code");
                IF "Shipment Method Code" = '' THEN
                  ShipmentMethod.INIT
                ELSE
                  ShipmentMethod.GET("Shipment Method Code");
                
                FormatAddr.SalesHeaderShipTo(ShipToAddr,"Sales Header");
                //FormatAddr.SalesHeaderShipTo
                ShowShippingAddr := "Sell-to Customer No." <> "Bill-to Customer No.";
                FOR i := 1 TO ARRAYLEN(ShipToAddr) DO
                  IF ShipToAddr[i] <> CustAddr[i] THEN
                    ShowShippingAddr := TRUE;
                
                IF NOT CurrReport.PREVIEW THEN BEGIN
                  IF ArchiveDocument THEN
                    ArchiveManagement.StoreSalesDocument("Sales Header",LogInteraction);
                
                  IF LogInteraction THEN BEGIN
                    CALCFIELDS("No. of Archived Versions");
                    IF "Bill-to Contact No." <> '' THEN
                      SegManagement.LogDocument(
                        1,"No.","Doc. No. Occurrence",
                        "No. of Archived Versions",DATABASE::Contact,"Bill-to Contact No.",
                        "Salesperson Code","Campaign No.","Posting Description",'')
                    ELSE
                      SegManagement.LogDocument(
                        1,"No.","Doc. No. Occurrence",
                        "No. of Archived Versions",DATABASE::Customer,"Bill-to Customer No.",
                        "Salesperson Code","Campaign No.","Posting Description",'');
                  END;
                END;
                
                // Start kvs01.jwi
                IF UserSetup.GET(USERID) THEN;
                // STOP kvs01.jwi
                //B2B
                TechBol := FALSE;
                //B2B
                /*//NSD
                CustAttach.SETRANGE("Sales Order Line No.",DATABASE::"Sales Header");
                CustAttach.SETRANGE(Description,"No.");
                CustAttach.SETRANGE("Pre Site Parameter","Document Type");
                IF CustAttach.FIND('-') THEN BEGIN
                   i:=1;
                   REPEAT
                   IF CustAttach."Attachment Status"= TRUE THEN
                         attach[i]:=CustAttach.Description;
                      i:=i+1;
                   UNTIL CustAttach.NEXT=0;
                END;
                *///NSD
                CurrencyCode := "Sales Header"."Currency Code" ;
                TextinWords := '';
                IF CurrencyCode = '' THEN BEGIN
                  TextinWords :='Total price in words (Rs.)';
                  CurrencyCode := '('+'Rs.' + ')';
                END ELSE
                  CurrencyCode := '('+ "Sales Header"."Currency Code" +')' ;

            end;

            trigger OnPreDataItem();
            begin
                CompanyInfo.GET;
                CompanyInfo.CALCFIELDS(Picture);
                //  CompanyInfo.CALCFIELDS(CompanyInfo.Picture);
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
        IF "Sales Header".GET THEN
          "Sales Header".CALCFIELDS("Sales Header"."No. of Archived Versions");
    end;

    var
        Text000 : Label 'Salesperson';
        Text001 : Label 'Total %1';
        Text002 : Label 'Total %1 Incl. VAT';
        Text003 : Label 'COPY';
        Text004 : Label 'Order Confirmation %1';
        Text005 : Label 'Page %1';
        Text006 : Label 'Total %1 Excl. VAT';
        GLSetup : Record "General Ledger Setup";
        ShipmentMethod : Record "Shipment Method";
        PaymentTerms : Record "Payment Terms";
        SalesPurchPerson : Record "Salesperson/Purchaser";
        CompanyInfo : Record "Company Information";
        VATAmountLine : Record "VAT Amount Line" temporary;
        SalesLine : Record "Sales Line" temporary;
        RespCenter : Record "Responsibility Center";
        Language : Record Language;
        SalesCountPrinted : Codeunit "Sales-Printed";
        FormatAddr : Codeunit "Format Address";
        SegManagement : Codeunit SegManagement;
        ArchiveManagement : Codeunit ArchiveManagement;
        CustAddr : array [8] of Text[50];
        ShipToAddr : array [8] of Text[50];
        CompanyAddr : array [8] of Text[50];
        SalesPersonText : Text[50];
        VATNoText : Text[50];
        ReferenceText : Text[50];
        TotalText : Text[50];
        TotalExclVATText : Text[50];
        TotalInclVATText : Text[50];
        MoreLines : Boolean;
        NoOfCopies : Integer;
        NoOfLoops : Integer;
        CopyText : Text[50];
        ShowShippingAddr : Boolean;
        i : Integer;
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
        _KVS_ : Integer;
        UserSetup : Record "User Setup";
        OurReference : Text[50];
        PrintLogo : Boolean;
        CompanyInfo2 : Record "Company Information";
        Item : Record Item;
        "--B2B--" : Integer;
        "Material Code" : Boolean;
        CrossRef : Boolean;
        MatCode : Text[50];
        itemCrossRef : Record "Item Cross Reference";
        CrossRefCode : Text[50];
        SLNO : Integer;
        salesperson : Record "Salesperson/Purchaser";
        contactperson : Text[50];
        phone : Text[50];
        fax : Text[50];
        email : Text[50];
        job : Record Job;
        desc : Text[50];
        "Total Amount" : Integer;
        Check : Report Check;
                    NumerText : array [2] of Text[50];
                    attach : array [8] of Text[100];
                    CustAttach : Record "Inst. PreSite Check List";
                    no : Text[50];
                    descri : Text[60];
                    itemtable : Record Item;
                    name1 : Text[80];
                    desigantion1 : Text[80];
                    name2 : Text[80];
                    designation2 : Text[80];
                    headprint : Boolean;
                    TechSlNo : Integer;
                    TechBol : Boolean;
                    UnitPrice : Text[50];
                    TotalPrice1 : Text[50];
                    CurrencyCode : Text[50];
                    TextinWords : Text[50];
                    TextInWordsText : Text[200];
                    deliveryadd : array [8] of Text[30];
                    Note : Text[100];
                    Note1 : Text[100];
                    Note2 : Text[100];
                    Note3 : Text[100];
                    Note4 : Text[100];
                    Note5 : Text[100];
                    E__Mail_CaptionLbl : Label 'E- Mail:';
        FAX_CaptionLbl : Label 'FAX:';
        URL_CaptionLbl : Label 'URL:';
        Ph_CaptionLbl : Label 'Ph:';
        To_Provide_Insight_For_Enhancing_WealthCaptionLbl : Label 'To Provide Insight For Enhancing Wealth';
        Enquiry_Ref_NO_CaptionLbl : Label '"Enquiry Ref NO "';
        Date___CaptionLbl : Label '" Date   "';
        Customer_NameCaptionLbl : Label 'Customer Name';
        Quote_NoCaptionLbl : Label 'Quote No';
        Dear_Sir_CaptionLbl : Label 'Dear Sir,';
        With_Reference_to_your_enquiry__we_are_here_with_furnishing_our_offer_for_your_kind_considerationCaptionLbl : Label 'With Reference to your enquiry, we are here with furnishing our offer for your kind consideration';
        Thanking_You_CaptionLbl : Label 'Thanking You,';
        Yours_faithfullyCaptionLbl : Label 'Yours faithfully';
        Enclosures_CaptionLbl : Label 'Enclosures:';
        EFFTRONICS__SYSTEMS_PVT__LTD_CaptionLbl : Label 'EFFTRONICS  SYSTEMS PVT. LTD.';
        QtyCaptionLbl : Label 'Qty';
        UnitCaptionLbl : Label 'Unit';
        Sl_No_CaptionLbl : Label 'Sl.No.';
        DescriptionCaptionLbl : Label '" Description"';
        AmountCaptionLbl : Label 'Amount';
        Unit_PriceCaptionLbl : Label 'Unit Price';
        QtyCaption_Control1000000074Lbl : Label 'Qty';
        UnitCaption_Control1000000075Lbl : Label 'Unit';
        Sl_No_Caption_Control1000000095Lbl : Label 'Sl.No.';
        DescriptionCaption_Control1102152017Lbl : Label '" Description"';
        AmountCaption_Control1102152041Lbl : Label 'Amount';
        Unit_PriceCaption_Control1102152044Lbl : Label 'Unit Price';
        "-DIM1.0-" : Integer;
        DimSetEntryGRec : Record "Dimension Set Entry";
        DimSetEntryGRec2 : Record "Dimension Set Entry";
}

