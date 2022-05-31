report 90000 "Sales - Quote2-before"
{
    // version B2B 1.0,sreenivas,DIM1.0

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
    // Version  sign     Date       USERID        Description
    // *************************************************************************************************************************
    // 1.0      DIM      28-May-13  JAGADEESH.P   New Code has been added for the dimensions updation after upgarding.
    DefaultLayout = RDLC;
    RDLCLayout = './Sales - Quote2-before.rdlc';


    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = SORTING(Document Type, No.) WHERE(Document Type=CONST(Quote));
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
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
                    column(CustAddr_2_; CustAddr[2])
                    {
                    }
                    column(CustAddr_3_; CustAddr[3])
                    {
                    }
                    column(CustAddr_4_; CustAddr[4])
                    {
                    }
                    column(CustAddr_1_; CustAddr[1])
                    {
                    }
                    column(FORMAT__Sales_Header___Order_Date__0_4_; FORMAT("Sales Header"."Order Date", 0, 4))
                    {
                    }
                    column(Sales_Header___Quote_No__; "Sales Header"."Quote No.")
                    {
                    }
                    column(Sales_Header___No__; "Sales Header"."No.")
                    {
                    }
                    column(data_1__data_2__data_3_; data[1] + data[2] + data[3])
                    {
                    }
                    column(str1; str1)
                    {
                    }
                    column(desc1; desc1)
                    {
                    }
                    column(data_29_; data[29])
                    {
                    }
                    column(data_24__data_25__data_26__data_27__data_28_; data[24] + data[25] + data[26] + data[27] + data[28])
                    {
                    }
                    column(data_30_; data[30])
                    {
                    }
                    column(data_31_; data[31])
                    {
                    }
                    column(salesman; salesman)
                    {
                    }
                    column(desigantion1; desigantion1)
                    {
                    }
                    column(name2; name2)
                    {
                    }
                    column(designation2; designation2)
                    {
                    }
                    column(Ref_No___Caption; Ref_No___CaptionLbl)
                    {
                    }
                    column(Dt_Caption; Dt_CaptionLbl)
                    {
                    }
                    column(Dear_Sir_Caption; Dear_Sir_CaptionLbl)
                    {
                    }
                    column(SUB__________Caption; SUB__________CaptionLbl)
                    {
                    }
                    column(SCHEDULE_Caption; SCHEDULE_CaptionLbl)
                    {
                    }
                    column(TERMS___CONDITIONS__Caption; TERMS___CONDITIONS__CaptionLbl)
                    {
                    }
                    column(V4__PAYMENT________________Caption; V4__PAYMENT________________CaptionLbl)
                    {
                    }
                    column(RDSO_INSPECTION_CHARGESCaption; RDSO_INSPECTION_CHARGESCaptionLbl)
                    {
                    }
                    column(V2__DELIVERY_______________Caption; V2__DELIVERY_______________CaptionLbl)
                    {
                    }
                    column(V1__WARRANTYCaption; V1__WARRANTYCaptionLbl)
                    {
                    }
                    column(V3__OFFER_VALIDITY___Caption; V3__OFFER_VALIDITY___CaptionLbl)
                    {
                    }
                    column(Thanking_You_Caption; Thanking_You_CaptionLbl)
                    {
                    }
                    column(Yours_faithfullyCaption; Yours_faithfullyCaptionLbl)
                    {
                    }
                    column(EFFTRONICS__SYSTEMS_PVT__LTD_Caption; EFFTRONICS__SYSTEMS_PVT__LTD_CaptionLbl)
                    {
                    }
                    column(For_any_further_clarifications__please_contact_us_Caption; For_any_further_clarifications__please_contact_us_CaptionLbl)
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
                            //DIM1.0 End

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
                        column(Sales_Line__Unit_of_Measure_;"Unit of Measure")
                        {
                        }
                        column(Sales_Line_Quantity;Quantity)
                        {
                        }
                        column(Sales_Line__Unit_Price_;"Unit Price")
                        {
                        }
                        column(SLNO;SLNO)
                        {
                        }
                        column(Sales_Line_Description;Description)
                        {
                        }
                        column(Sales_Line__Line_Amount_;"Line Amount")
                        {
                        }
                        column(Sales_Line__Unit_of_Measure__Control1102154021;"Unit of Measure")
                        {
                        }
                        column(Sales_Line_Quantity_Control1102154025;Quantity)
                        {
                        }
                        column(Sales_Line__Unit_Price__Control1102154036;"Unit Price")
                        {
                        }
                        column(SLNO_Control1102154037;SLNO)
                        {
                        }
                        column(Sales_Line_Description_Control1102154047;Description)
                        {
                        }
                        column(Sales_Line__Line_Amount__Control1102154048;"Line Amount")
                        {
                        }
                        column(Sales_Line__Unit_of_Measure__Control1102154050;"Unit of Measure")
                        {
                        }
                        column(Sales_Line_Quantity_Control1102154051;Quantity)
                        {
                        }
                        column(Sales_Line__Unit_Price__Control1102154052;"Unit Price")
                        {
                        }
                        column(SLNO_Control1102154053;SLNO)
                        {
                        }
                        column(Sales_Line_Description_Control1102154061;Description)
                        {
                        }
                        column(Sales_Line__Line_Amount__Control1102154062;"Line Amount")
                        {
                        }
                        column(Sales_Line_Description_Control1102154027;Description)
                        {
                        }
                        column(data_4__data_5__data_6__data_7_;data[4]+data[5]+data[6]+data[7])
                        {
                        }
                        column(data_8__data_9__data_10_;data[8]+data[9]+data[10])
                        {
                        }
                        column(data_11__data_12__data_13_;data[11]+data[12]+data[13])
                        {
                        }
                        column(data_17_;data[17])
                        {
                        }
                        column(data_18_;data[18])
                        {
                        }
                        column(data_19_;data[19])
                        {
                        }
                        column(data_23_;data[23])
                        {
                        }
                        column(data_20_;data[20])
                        {
                        }
                        column(data_22_;data[22])
                        {
                        }
                        column(data_21_;data[21])
                        {
                        }
                        column(data_14_;data[14])
                        {
                        }
                        column(data_15_;data[15])
                        {
                        }
                        column(data_16_;data[16])
                        {
                        }
                        column(QtyCaption;QtyCaptionLbl)
                        {
                        }
                        column(UnitsCaption;UnitsCaptionLbl)
                        {
                        }
                        column(Sl_No_Caption;Sl_No_CaptionLbl)
                        {
                        }
                        column(DescriptionCaption;DescriptionCaptionLbl)
                        {
                        }
                        column(Amount_Rs__Caption;Amount_Rs__CaptionLbl)
                        {
                        }
                        column(Unit_Price_Rs__Caption;Unit_Price_Rs__CaptionLbl)
                        {
                        }
                        column(Note__Necessary_wiring_from_Relay_contacts_to_the_tag_block_of_RTU_should_be_done_by_RailwaysCaption;Note__Necessary_wiring_from_Relay_contacts_to_the_tag_block_of_RTU_should_be_done_by_RailwaysCaptionLbl)
                        {
                        }
                        column(On_the_above_Quoted_price__CST___12_5__Extra_Caption;On_the_above_Quoted_price__CST___12_5__Extra_CaptionLbl)
                        {
                        }
                        column(TERMS___CONDITIONS__Caption_Control1102154013;TERMS___CONDITIONS__Caption_Control1102154013Lbl)
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
                        column(Sales_Line_Schedule_Type;"Schedule Type")
                        {
                        }

                        trigger OnAfterGetRecord();
                        begin
                            
                            IF ("Sales Line".Type<>"Sales Line".Type::" ")THEN
                                  SLNO:=SLNO+1;
                            IF ("Sales Line".Type<>"Sales Line".Type::" ") AND ("Sales Line"."Schedule Type"="Sales Line"."Schedule Type"::B) THEN
                                  SLNO1:=SLNO1+1;
                            
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
                              //salesman:="Sales Header"."Salesperson Code";
                               salesman:=SalesPurchPerson.Name;

                        end;

                        trigger OnPreDataItem();
                        begin
                            //CurrReport.BREAK;
                            SLNO:=0;
                            SLNO1:=0;
                            j:=1;
                            k:=1;
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
                                //DIM1.0 Start
                                //Code commented
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
                                //DIM1.0 End

                            end;

                            trigger OnPreDataItem();
                            begin
                                IF NOT ShowInternalInfo THEN
                                  CurrReport.BREAK;
                                //DIM1.0 Start
                                //Code Commented
                                /*
                                DocDim2.SETRANGE("Table ID",DATABASE::"Sales Line");
                                DocDim2.SETRANGE("Document Type","Sales Line"."Document Type");
                                DocDim2.SETRANGE("Document No.","Sales Line"."Document No.");
                                DocDim2.SETRANGE("Line No.","Sales Line"."Line No.");
                                */
                                DimSetEntryGRec2.RESET;
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
                IF UserSetup.GET(userid1) THEN;
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
                l:=1;
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
                    descri : Text[1000];
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
                    str : Text[200];
                    str1 : Text[100];
                    pos : Integer;
                    "sales comment" : Record "Sales Comment Line";
                    "payment terms" : Record "Payment Terms";
                    desc1 : Text[200];
                    des : array [10,6] of Text[50];
                    j : Integer;
                    des1 : array [10,6] of Text[50];
                    choice : Option A,B;
                    a : Text[1];
                    k : Integer;
                    text1 : Text[1];
                    text2 : Text[1];
                    cusname : Text[30];
                    rcaption : Text[5];
                    pos1 : Integer;
                    SLNO1 : Integer;
                    data : array [50] of Text[200];
                    l : Integer;
                    salesman : Text[30];
                    des2 : Text[50];
                    hardcopy : Boolean;
                    softcopy : Boolean;
                    Ref_No___CaptionLbl : Label 'Ref No  :';
        Dt_CaptionLbl : Label 'Dt:';
        Dear_Sir_CaptionLbl : Label 'Dear Sir,';
        SUB__________CaptionLbl : Label 'SUB         :';
        SCHEDULE_CaptionLbl : Label '"SCHEDULE "';
        TERMS___CONDITIONS__CaptionLbl : Label 'TERMS & CONDITIONS :';
        V4__PAYMENT________________CaptionLbl : Label '4) PAYMENT               :';
        RDSO_INSPECTION_CHARGESCaptionLbl : Label 'RDSO INSPECTION CHARGES';
        V2__DELIVERY_______________CaptionLbl : Label '2) DELIVERY              :';
        V1__WARRANTYCaptionLbl : Label '1) WARRANTY';
        V3__OFFER_VALIDITY___CaptionLbl : Label '3) OFFER VALIDITY  :';
        Thanking_You_CaptionLbl : Label 'Thanking You,';
        Yours_faithfullyCaptionLbl : Label 'Yours faithfully';
        EFFTRONICS__SYSTEMS_PVT__LTD_CaptionLbl : Label 'EFFTRONICS  SYSTEMS PVT. LTD.';
        For_any_further_clarifications__please_contact_us_CaptionLbl : Label 'For any further clarifications, please contact us.';
        QtyCaptionLbl : Label 'Qty';
        UnitsCaptionLbl : Label 'Units';
        Sl_No_CaptionLbl : Label 'Sl.No.';
        DescriptionCaptionLbl : Label '" Description"';
        Amount_Rs__CaptionLbl : Label 'Amount(Rs.)';
        Unit_Price_Rs__CaptionLbl : Label 'Unit Price(Rs.)';
        Note__Necessary_wiring_from_Relay_contacts_to_the_tag_block_of_RTU_should_be_done_by_RailwaysCaptionLbl : Label 'Note: Necessary wiring from Relay contacts to the tag block of RTU should be done by Railways';
        On_the_above_Quoted_price__CST___12_5__Extra_CaptionLbl : Label '*  On the above Quoted price, CST - 12.5% Extra.';
        TERMS___CONDITIONS__Caption_Control1102154013Lbl : Label 'TERMS & CONDITIONS :';
        "-DIM1.0-" : Integer;
        DimSetEntryGRec : Record "Dimension Set Entry";
        DimSetEntryGRec2 : Record "Dimension Set Entry";
}

