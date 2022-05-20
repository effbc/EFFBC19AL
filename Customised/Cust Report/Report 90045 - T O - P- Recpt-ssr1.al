report 90045 "T O - P- Recpt-ssr1"
{
    // version B2B 1.0,DIM1.0

    // Project : EFFTRONICS
    // *************************************************************************************************************************
    // SIGN Name
    // ************************************************************************************************************************
    // DIM : Resolution of Dimension Issues after Upgarding.
    // ***********************************************************************************************************************
    // Version  sign     Date       USERID         Description
    // *************************************************************************************************************************
    // 1.0      DIM      28-May-13  JAGADEESH.P    New Code has been added for the dimensions updation after upgarding.
    DefaultLayout = RDLC;
    RDLCLayout = './T O - P- Recpt-ssr1.rdlc';

    Caption = 'Transfer Order';

    dataset
    {
        dataitem("Transfer Receipt Header";"Transfer Receipt Header")
        {
            DataItemTableView = SORTING(No.);
            RequestFilterFields = "No.","Transfer-from Code","Transfer-to Code";
            ReqFilterHeading = 'Transfer Order';
            column(Transfer_Receipt_Header_No_;"No.")
            {
            }
            dataitem(CopyLoop;"Integer")
            {
                DataItemTableView = SORTING(Number);
                dataitem(PageLoop;"Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number=CONST(1));
                    column(Transfer_Receipt_Header___Posting_Date_;"Transfer Receipt Header"."Posting Date")
                    {
                    }
                    column(Transfer_Receipt_Header___No__;"Transfer Receipt Header"."No.")
                    {
                    }
                    column(Transfer_Receipt_Header___Transfer_from_Code_;"Transfer Receipt Header"."Transfer-from Code")
                    {
                    }
                    column(Transfer_Receipt_Header___Transfer_to_Code_;"Transfer Receipt Header"."Transfer-to Code")
                    {
                    }
                    column(CurrReport_PAGENO;CurrReport.PAGENO)
                    {
                    }
                    column(COMPANYNAME;COMPANYNAME)
                    {
                    }
                    column(Transfer_Receipt_Header___Transfer_Order_No__;"Transfer Receipt Header"."Transfer Order No.")
                    {
                    }
                    column(Transfer_Receipt_Header___Prod__Order_No__;"Transfer Receipt Header"."Prod. Order No.")
                    {
                    }
                    column(Transfer_Receipt_Header___Prod__Order_Line_No__;"Transfer Receipt Header"."Prod. Order Line No.")
                    {
                    }
                    column(Transfer_Receipt_Header___No___Control1102152001;"Transfer Receipt Header"."No.")
                    {
                    }
                    column(CurrReport_PAGENO_Control1102152005;CurrReport.PAGENO)
                    {
                    }
                    column(COMPANYNAME_Control1102152008;COMPANYNAME)
                    {
                    }
                    column(Posted_Transfer_Order_ReceiptCaption;Posted_Transfer_Order_ReceiptCaptionLbl)
                    {
                    }
                    column(Posted_TO_Receipt_No_Caption;Posted_TO_Receipt_No_CaptionLbl)
                    {
                    }
                    column(Transfer__from_codeCaption;Transfer__from_codeCaptionLbl)
                    {
                    }
                    column(Transfer_to_codeCaption;Transfer_to_codeCaptionLbl)
                    {
                    }
                    column(Prod_Order_No_Caption;Prod_Order_No_CaptionLbl)
                    {
                    }
                    column(Prod_Order_Line_No_Caption;Prod_Order_Line_No_CaptionLbl)
                    {
                    }
                    column(Posting_dateCaption;Posting_dateCaptionLbl)
                    {
                    }
                    column(PageCaption;PageCaptionLbl)
                    {
                    }
                    column(Transfer_Order_No_Caption;Transfer_Order_No_CaptionLbl)
                    {
                    }
                    column(Transfer_Order_No_Caption_Control1102152000;Transfer_Order_No_Caption_Control1102152000Lbl)
                    {
                    }
                    column(Prod_Order_No_Caption_Control1102152002;Prod_Order_No_Caption_Control1102152002Lbl)
                    {
                    }
                    column(Transfer_OrderCaption;Transfer_OrderCaptionLbl)
                    {
                    }
                    column(PageCaption_Control1102152006;PageCaption_Control1102152006Lbl)
                    {
                    }
                    column(PageLoop_Number;Number)
                    {
                    }
                    dataitem(DimensionLoop1;"Integer")
                    {
                        DataItemLinkReference = "Transfer Receipt Header";
                        DataItemTableView = SORTING(Number) WHERE(Number=FILTER(1..));

                        trigger OnAfterGetRecord();
                        begin
                            //DIM1.0  Start
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
                                  '%1 - %2',DocDim1."Dimension Code",DocDim1."Dimension Value Code")
                              ELSE
                                DimText :=
                                  STRSUBSTNO(
                                    '%1; %2 - %3',DimText,
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
                                DimText := STRSUBSTNO('%1 - %2',DimSetEntryGRec."Dimension Code",DimSetEntryGRec."Dimension Value Code")
                              ELSE
                                DimText :=
                                  STRSUBSTNO(
                                    '%1, %2 - %3',DimText,DimSetEntryGRec."Dimension Code",DimSetEntryGRec."Dimension Value Code");
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
                    dataitem("Transfer Receipt Line";"Transfer Receipt Line")
                    {
                        DataItemLink = Document No.=FIELD(No.);
                        DataItemLinkReference = "Transfer Receipt Header";
                        column(Transfer_Receipt_Line__Item_No__;"Item No.")
                        {
                        }
                        column(Description_______Description_2_;Description+'  '+"Description 2")
                        {
                        }
                        column(Transfer_Receipt_Line__Unit_of_Measure_Code_;"Unit of Measure Code")
                        {
                        }
                        column(SLNO;SLNO)
                        {
                        }
                        column(Transfer_Receipt_Line_Quantity_;Quantity )
                        {
                        }
                        column(Transfer_Receipt_Line_Quantity__Control1000000021;Quantity )
                        {
                        }
                        column(Transfer_Receipt_Line_Quantity__Control1000000038;Quantity )
                        {
                        }
                        column(Item_NoCaption;Item_NoCaptionLbl)
                        {
                        }
                        column(DescriptionCaption;DescriptionCaptionLbl)
                        {
                        }
                        column(QuantityCaption;QuantityCaptionLbl)
                        {
                        }
                        column(UOMCaption;UOMCaptionLbl)
                        {
                        }
                        column(Quantity_ShippedCaption;Quantity_ShippedCaptionLbl)
                        {
                        }
                        column(Quantity_ReceivedCaption;Quantity_ReceivedCaptionLbl)
                        {
                        }
                        column(SignatureCaption;SignatureCaptionLbl)
                        {
                        }
                        column(S_No_Caption;S_No_CaptionLbl)
                        {
                        }
                        column(Quantity_ReceivedCaption_Control1000000034;Quantity_ReceivedCaption_Control1000000034Lbl)
                        {
                        }
                        column(Quantity_ShippedCaption_Control1000000037;Quantity_ShippedCaption_Control1000000037Lbl)
                        {
                        }
                        column(QuantityCaption_Control1000000039;QuantityCaption_Control1000000039Lbl)
                        {
                        }
                        column(SignatureCaption_Control1000000044;SignatureCaption_Control1000000044Lbl)
                        {
                        }
                        column(UOMCaption_Control1000000045;UOMCaption_Control1000000045Lbl)
                        {
                        }
                        column(DescriptionCaption_Control1000000046;DescriptionCaption_Control1000000046Lbl)
                        {
                        }
                        column(Item_NoCaption_Control1000000047;Item_NoCaption_Control1000000047Lbl)
                        {
                        }
                        column(S_No_Caption_Control1102152012;S_No_Caption_Control1102152012Lbl)
                        {
                        }
                        column(Released_byCaption;Released_byCaptionLbl)
                        {
                        }
                        column(DateCaption;DateCaptionLbl)
                        {
                        }
                        column(Shipped_byCaption;Shipped_byCaptionLbl)
                        {
                        }
                        column(DateCaption_Control1000000024;DateCaption_Control1000000024Lbl)
                        {
                        }
                        column(Received_byCaption;Received_byCaptionLbl)
                        {
                        }
                        column(DateCaption_Control1000000033;DateCaption_Control1000000033Lbl)
                        {
                        }
                        column(Transfer_Receipt_Line_Document_No_;"Document No.")
                        {
                        }
                        column(Transfer_Receipt_Line_Line_No_;"Line No.")
                        {
                        }
                        dataitem(DimensionLoop2;"Integer")
                        {
                            DataItemTableView = SORTING(Number) WHERE(Number=FILTER(1..));
                            column(DimText;DimText)
                            {
                            }
                            column(DimText_Control89;DimText)
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
                                      '%1 - %2',DocDim2."Dimension Code",DocDim2."Dimension Value Code")
                                  ELSE
                                    DimText :=
                                      STRSUBSTNO(
                                        '%1; %2 - %3',DimText,
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
                                    DimText := STRSUBSTNO('%1 - %2',DimSetEntryGRec2."Dimension Code",DimSetEntryGRec2."Dimension Value Code")
                                  ELSE
                                    DimText :=
                                      STRSUBSTNO(
                                        '%1, %2 - %3',DimText,DimSetEntryGRec2."Dimension Code",DimSetEntryGRec2."Dimension Value Code");
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
                            end;
                        }
                        dataitem("Reservation Entry";"Reservation Entry")
                        {
                            DataItemLink = Item No.=FIELD(Item No.),Source Ref. No.=FIELD(Line No.),Source ID=FIELD(Document No.);
                            column(Reservation_Entry__Item_No__;"Item No.")
                            {
                            }
                            column(Reservation_Entry__Item_No__Caption;FIELDCAPTION("Item No."))
                            {
                            }
                            column(Reservation_Entry_Entry_No_;"Entry No.")
                            {
                            }
                            column(Reservation_Entry_Positive;Positive)
                            {
                            }
                            column(Reservation_Entry_Source_Ref__No_;"Source Ref. No.")
                            {
                            }
                            column(Reservation_Entry_Source_ID;"Source ID")
                            {
                            }
                        }

                        trigger OnAfterGetRecord();
                        begin
                            //DIM1.0 Start
                            /*
                            DocDim2.SETRANGE("Table ID",DATABASE::"Transfer Receipt Line");
                            DocDim2.SETRANGE("Document No.","Transfer Receipt Line"."Document No.");
                            DocDim2.SETRANGE("Line No.","Transfer Receipt Line"."Line No.");
                            */
                            
                            DimSetEntryGRec2.RESET;
                            DimSetEntryGRec2.SETRANGE("Dimension Set ID","Transfer Receipt Line"."Dimension Set ID");
                            //DIM1.0 End
                            
                            SLNO := SLNO+1;
                            //xxx
                            //TORl.GET("Transfer Receipt Line"."Transfer Order No.");
                            ReservationEntry.SETRANGE("Source Type",DATABASE::"Transfer Line");
                            ReservationEntry.SETRANGE("Source ID","Document No.");
                            ReservationEntry.SETRANGE("Source Ref. No.","Line No.");

                        end;

                        trigger OnPreDataItem();
                        begin
                            SLNO := 0;
                        end;
                    }
                }

                trigger OnAfterGetRecord();
                begin
                    IF Number > 1 THEN
                      CopyText := Text000;
                    CurrReport.PAGENO := 1;
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
                //DIM1.0 Start
                //Code Commented
                /*
                DocDim1.SETRANGE("Table ID",DATABASE::"Transfer Receipt Header");
                DocDim1.SETRANGE("Document No.","Transfer Receipt Header"."No.");
                */
                DimSetEntryGRec.RESET;
                DimSetEntryGRec.SETRANGE("Dimension Set ID","Dimension Set ID");
                //DIM1.0 End
                
                //FormatAddr.TransferHeaderTransferFrom(TransferFromAddr,"Transfer Receipt Header");
                //FormatAddr.TransferHeaderTransferTo(TransferToAddr,"Transfer Receipt Header");
                
                IF NOT ShipmentMethod.GET("Shipment Method Code") THEN
                  ShipmentMethod.INIT;

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
        Text000 : Label 'COPY';
        Text001 : Label 'Transfer Order %1';
        Text002 : Label 'Page %1';
        ShipmentMethod : Record "Shipment Method";
        FormatAddr : Codeunit "Format Address";
        TransferFromAddr : array [8] of Text[50];
        TransferToAddr : array [8] of Text[50];
        NoOfCopies : Integer;
        NoOfLoops : Integer;
        CopyText : Text[30];
        DimText : Text[120];
        OldDimText : Text[75];
        ShowInternalInfo : Boolean;
        Continue : Boolean;
        SLNO : Integer;
        TORh : Record "Transfer Header";
        TORl : Record "Transfer Line";
        ReservationEntry : Record "Reservation Entry";
        Posted_Transfer_Order_ReceiptCaptionLbl : Label 'Posted Transfer Order-Receipt';
        Posted_TO_Receipt_No_CaptionLbl : Label 'Posted TO Receipt No.';
        Transfer__from_codeCaptionLbl : Label 'Transfer -from code';
        Transfer_to_codeCaptionLbl : Label 'Transfer-to code';
        Prod_Order_No_CaptionLbl : Label 'Prod.Order No.';
        Prod_Order_Line_No_CaptionLbl : Label 'Prod.Order Line No.';
        Posting_dateCaptionLbl : Label 'Posting date';
        PageCaptionLbl : Label 'Page';
        Transfer_Order_No_CaptionLbl : Label 'Transfer Order No.';
        Transfer_Order_No_Caption_Control1102152000Lbl : Label 'Transfer Order No.';
        Prod_Order_No_Caption_Control1102152002Lbl : Label 'Prod.Order No.';
        Transfer_OrderCaptionLbl : Label 'Transfer Order';
        PageCaption_Control1102152006Lbl : Label 'Page';
        Item_NoCaptionLbl : Label 'Item No';
        DescriptionCaptionLbl : Label 'Description';
        QuantityCaptionLbl : Label 'Quantity';
        UOMCaptionLbl : Label 'UOM';
        Quantity_ShippedCaptionLbl : Label 'Quantity Shipped';
        Quantity_ReceivedCaptionLbl : Label 'Quantity Received';
        SignatureCaptionLbl : Label 'Signature';
        S_No_CaptionLbl : Label 'S.No.';
        Quantity_ReceivedCaption_Control1000000034Lbl : Label 'Quantity Received';
        Quantity_ShippedCaption_Control1000000037Lbl : Label 'Quantity Shipped';
        QuantityCaption_Control1000000039Lbl : Label 'Quantity';
        SignatureCaption_Control1000000044Lbl : Label 'Signature';
        UOMCaption_Control1000000045Lbl : Label 'UOM';
        DescriptionCaption_Control1000000046Lbl : Label 'Description';
        Item_NoCaption_Control1000000047Lbl : Label 'Item No';
        S_No_Caption_Control1102152012Lbl : Label 'S.No.';
        Released_byCaptionLbl : Label 'Released by';
        DateCaptionLbl : Label 'Date';
        Shipped_byCaptionLbl : Label 'Shipped by';
        DateCaption_Control1000000024Lbl : Label 'Date';
        Received_byCaptionLbl : Label 'Received by';
        DateCaption_Control1000000033Lbl : Label 'Date';
        Line_DimensionsCaptionLbl : Label 'Line Dimensions';
        "-DIM1.0-" : Integer;
        DimSetEntryGRec : Record "Dimension Set Entry";
        DimSetEntryGRec2 : Record "Dimension Set Entry";
}

