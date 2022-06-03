report 33000254 "Inspection Receipt"
{
    // version QC1.0,B2B1.0

    DefaultLayout = RDLC;
    RDLCLayout = './Inspection Receipt.rdlc';

    dataset
    {
        dataitem("Inspection Receipt Header"; "Inspection Receipt Header")
        {
            RequestFilterFields = "No.";
            ReqFilterHeading = 'Inspection receipt';
            column(Inspection_Receipt_Header__Inspection_Receipt_Header___No__; "Inspection Receipt Header"."No.")
            {
            }
            column(Inspdatasheetno; Inspdatasheetno)
            {
            }
            column(Inspection_Receipt_Header__Prod__Order_No__; "Prod. Order No.")
            {
            }
            column(Inspection_Receipt_Header__Posting_Date_; "Posting Date")
            {
            }
            column(Inspection_Receipt_Header__Source_Type_; "Source Type")
            {
            }
            column(FORMAT__Vendor_No_________Vendor_Name__; FORMAT("Vendor No." + '  ' + "Vendor Name"))
            {
            }
            column(FORMAT__External_Document_No__________FORMAT__Document_Date__; FORMAT("External Document No.") + '   ' + FORMAT("Document Date"))
            {
            }
            column(Inspection_Receipt_Header__Order_No__; "Order No.")
            {
            }
            column(LineNo; LineNo)
            {
            }
            column(Inspection_Receipt_Header__Document_Date_; "Document Date")
            {
            }
            column(USERID; USERID)
            {
            }
            column(Inspection_Receipt_Header_Quantity; Quantity)
            {
            }
            column(Inspection_Receipt_Header__Qty__Accepted_; "Qty. Accepted")
            {
            }
            column(Inspection_Receipt_Header__Qty__Accepted_Under_Deviation_; "Qty. Accepted Under Deviation")
            {
            }
            column(Inspection_Receipt_Header__Qty__Rework_; "Qty. Rework")
            {
            }
            column(Inspection_Receipt_Header__Qty__Rejected_; "Qty. Rejected")
            {
            }
            column(Inspection_Receipt_Header__Qty__Accepted_UD_Reason_; "Qty. Accepted UD Reason")
            {
            }
            column(Inspection_Receipt_Header__Item_No__; "Item No.")
            {
            }
            column(Inspection_Receipt_Header__Item_Description_; "Item Description")
            {
            }
            column(Inspection_Receipt_Header__Operation_No__; "Operation No.")
            {
            }
            column(DrawingNo; DrawingNo)
            {
            }
            column(IndentReference; IndentReference)
            {
            }
            column(Inspection_Receipt_Header__Calibration_Party_; "Calibration Party")
            {
            }
            column(Inspection_Receipt_Header__Nature_Of_Rejection_; "Nature Of Rejection")
            {
            }
            column(Inspection_Receipt_Header__Reason_Description_; "Reason Description")
            {
            }
            column(Inspection_ReceiptCaption; Inspection_ReceiptCaptionLbl)
            {
            }
            column(Inspection_Receipt_No_Caption; Inspection_Receipt_No_CaptionLbl)
            {
            }
            column(Inspection_Receipt_DateCaption; Inspection_Receipt_DateCaptionLbl)
            {
            }
            column(PO_No__and_line_numberCaption; PO_No__and_line_numberCaptionLbl)
            {
            }
            column(Vendor_no__and_nameCaption; Vendor_no__and_nameCaptionLbl)
            {
            }
            column(Vendor_Shipment_no_and_dateCaption; Vendor_Shipment_no_and_dateCaptionLbl)
            {
            }
            column(Inspection_TypeCaption; Inspection_TypeCaptionLbl)
            {
            }
            column(Prepared_byCaption; Prepared_byCaptionLbl)
            {
            }
            column(Inspection_datasheet_no_Caption; Inspection_datasheet_no_CaptionLbl)
            {
            }
            column(Prepared_date_Caption; Prepared_date_CaptionLbl)
            {
            }
            column(VOITH_TURBO_PRIVATE_LIMITEDCaption; VOITH_TURBO_PRIVATE_LIMITEDCaptionLbl)
            {
            }
            column(QtyCaption; QtyCaptionLbl)
            {
            }
            column(Inspection_Receipt_Header__Item_Description_Caption; FIELDCAPTION("Item Description"))
            {
            }
            column(Inspection_Receipt_Header__Item_No__Caption; FIELDCAPTION("Item No."))
            {
            }
            column(Inspection_Receipt_Header__Qty__Accepted_Caption; FIELDCAPTION("Qty. Accepted"))
            {
            }
            column(Inspection_Receipt_Header__Qty__Accepted_Under_Deviation_Caption; FIELDCAPTION("Qty. Accepted Under Deviation"))
            {
            }
            column(Inspection_Receipt_Header__Qty__Rework_Caption; FIELDCAPTION("Qty. Rework"))
            {
            }
            column(Inspection_Receipt_Header__Qty__Rejected_Caption; FIELDCAPTION("Qty. Rejected"))
            {
            }
            column(Inspection_Receipt_Header__Qty__Accepted_UD_Reason_Caption; FIELDCAPTION("Qty. Accepted UD Reason"))
            {
            }
            column(Opn__NoCaption; Opn__NoCaptionLbl)
            {
            }
            column(Drawing_No_Caption; Drawing_No_CaptionLbl)
            {
            }
            column(Indent_ReferenceCaption; Indent_ReferenceCaptionLbl)
            {
            }
            column(DateCaption; DateCaptionLbl)
            {
            }
            column(Inspected_byCaption; Inspected_byCaptionLbl)
            {
            }
            column(QA_approved_byCaption; QA_approved_byCaptionLbl)
            {
            }
            column(QA_approved_dtCaption; QA_approved_dtCaptionLbl)
            {
            }
            column(Stores_InchargeCaption; Stores_InchargeCaptionLbl)
            {
            }
            column(Date_of_receipt_at_storesCaption; Date_of_receipt_at_storesCaptionLbl)
            {
            }
            column(Accepted_under_deviationCaption; Accepted_under_deviationCaptionLbl)
            {
            }
            column(Nature_Of_RejectionCaption; Nature_Of_RejectionCaptionLbl)
            {
            }
            column(IGC_RemarksCaption; IGC_RemarksCaptionLbl)
            {
            }
            dataitem("Inspect. Recpt. Accept Level"; "Inspect. Recpt. Accept Level")
            {
                DataItemLink = Inspection Receipt No.=FIELD(No.);
                DataItemTableView = SORTING(Inspection Receipt No., Quality Type, Line No.);
                column(Inspect__Recpt__Accept_Level__Quality_Type_; "Quality Type")
                {
                }
                column(Inspect__Recpt__Accept_Level__Acceptance_Code_; "Acceptance Code")
                {
                }
                column(Inspect__Recpt__Accept_Level__Reason_Code_; "Reason Code")
                {
                }
                column(Inspect__Recpt__Accept_Level__Reason_Code_Caption; FIELDCAPTION("Reason Code"))
                {
                }
                column(Inspect__Recpt__Accept_Level__Acceptance_Code_Caption; FIELDCAPTION("Acceptance Code"))
                {
                }
                column(Inspect__Recpt__Accept_Level__Quality_Type_Caption; FIELDCAPTION("Quality Type"))
                {
                }
                column(Inspect__Recpt__Accept_Level_Inspection_Receipt_No_; "Inspection Receipt No.")
                {
                }
                column(Inspect__Recpt__Accept_Level_Line_No_; "Line No.")
                {
                }
            }

            trigger OnAfterGetRecord();
            begin
                InspectRecptAcceptLevel.SETRANGE("Inspection Receipt No.", "Inspection Receipt Header"."No.");
                IF InspectRecptAcceptLevel.FIND('-') THEN;

                Inspdatasheetno := '';

                IF "Source Type" = "Source Type"::"In Bound" THEN BEGIN
                    LineNo := "Purch Line No";
                    PostedIDS.SETRANGE("Purchase Consignment No.", "Purchase Consignment");
                    IF PostedIDS.FIND('-') THEN
                        Inspdatasheetno := PostedIDS."No.";
                END;

                IF "Source Type" = "Source Type"::WIP THEN BEGIN
                    LineNo := "Prod. Order Line";
                    PostedIDS.SETRANGE("Production Batch No.", "Production Batch No.");
                    IF PostedIDS.FIND('-') THEN
                        Inspdatasheetno := PostedIDS."No.";
                END;

                PurchRecptLine.INIT;
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
        PurchRectHeader: Record "Purch. Rcpt. Header";
        ShipToName: Text[100];
        ShipToAddr: Text[30];
        ShipToCity: Text[30];
        ShipToPC: Text[30];
        InspectRecptAcceptLevel: Record "Inspect. Recpt. Accept Level";
        desc: Code[10];
        PostedIDS: Record "Posted Inspect DatasheetHeader";
        Inspdatasheetno: Code[20];
        LineNo: Integer;
        PurchRecptLine: Record "Purch. Rcpt. Line";
        DrawingNo: Code[20];
        IndentReference: Text[50];
        Inspection_ReceiptCaptionLbl: Label 'Inspection Receipt';
        Inspection_Receipt_No_CaptionLbl: Label 'Inspection Receipt No.';
        Inspection_Receipt_DateCaptionLbl: Label 'Inspection Receipt Date';
        PO_No__and_line_numberCaptionLbl: Label 'PO.No. and line number';
        Vendor_no__and_nameCaptionLbl: Label 'Vendor no. and name';
        Vendor_Shipment_no_and_dateCaptionLbl: Label 'Vendor Shipment no and date';
        Inspection_TypeCaptionLbl: Label 'Inspection Type';
        Prepared_byCaptionLbl: Label 'Prepared by';
        Inspection_datasheet_no_CaptionLbl: Label 'Inspection datasheet no.';
        Prepared_date_CaptionLbl: Label 'Prepared date:';
        VOITH_TURBO_PRIVATE_LIMITEDCaptionLbl: Label 'VOITH TURBO PRIVATE LIMITED';
        QtyCaptionLbl: Label 'Qty';
        Opn__NoCaptionLbl: Label 'Opn. No';
        Drawing_No_CaptionLbl: Label 'Drawing No.';
        Indent_ReferenceCaptionLbl: Label 'Indent Reference';
        DateCaptionLbl: Label 'Date';
        Inspected_byCaptionLbl: Label 'Inspected by';
        QA_approved_byCaptionLbl: Label 'QA approved by';
        QA_approved_dtCaptionLbl: Label 'QA approved dt';
        Stores_InchargeCaptionLbl: Label 'Stores Incharge';
        Date_of_receipt_at_storesCaptionLbl: Label 'Date of receipt at stores';
        Accepted_under_deviationCaptionLbl: Label 'Accepted under deviation';
        Nature_Of_RejectionCaptionLbl: Label 'Nature Of Rejection';
        IGC_RemarksCaptionLbl: Label 'IGC Remarks';
}

