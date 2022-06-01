report 50074 "List of Posted IR"
{
    // version FDe-Js/Al/Nirmala

    DefaultLayout = RDLC;
    RDLCLayout = './List of Posted IR.rdlc';

    dataset
    {
        dataitem("Inspection Receipt Header"; "Inspection Receipt Header")
        {
            DataItemTableView = SORTING(No.) WHERE(Status = FILTER(Yes));
            RequestFilterFields = "No.", "Reason Description", "Vendor No.", "Item No.";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(companyid_Name; companyid.Name)
            {
            }
            column(Inspection_Receipt_Header__Inspection_Receipt_Header___Reason_for_Pending_; "Inspection Receipt Header"."Reason for Pending")
            {
            }
            column(Inspection_Receipt_Header__Reason_Description_; "Reason Description")
            {
            }
            column(FORMAT_TODAY_0_4__Control1000000002; FORMAT(TODAY, 0, 4))
            {
            }
            column(companyid_Name_Control1000000003; companyid.Name)
            {
            }
            column(totalqty; totalqty)
            {
            }
            column(totalrejqty; totalrejqty)
            {
            }
            column(totalqtysendtorework; totalqtysendtorework)
            {
            }
            column(totalreworkqty; totalreworkqty)
            {
            }
            column(totalrecivedqty; totalrecivedqty)
            {
            }
            column(ppm; ppm)
            {
            }
            column(datesdiffsum; datesdiffsum)
            {
            }
            column(totprt; totprt)
            {
            }
            column(List_of_Posted_Inspected_ReceiptsCaption; List_of_Posted_Inspected_ReceiptsCaptionLbl)
            {
            }
            column(Serail_No_Caption; Serail_No_CaptionLbl)
            {
            }
            column(Inspection_Receipt_Header__Reason_Description_Caption; FIELDCAPTION("Reason Description"))
            {
            }
            column(List_of_Posted_Inspected_ReceiptsCaption_Control1000000001; List_of_Posted_Inspected_ReceiptsCaption_Control1000000001Lbl)
            {
            }
            column(No_Caption; No_CaptionLbl)
            {
            }
            column(Vendor_NameCaption; Vendor_NameCaptionLbl)
            {
            }
            column(Item_DescriptionCaption; Item_DescriptionCaptionLbl)
            {
            }
            column(QuantityCaption; QuantityCaptionLbl)
            {
            }
            column(Qty_ReworkCaption; Qty_ReworkCaptionLbl)
            {
            }
            column(Qty_RejectedCaption; Qty_RejectedCaptionLbl)
            {
            }
            column(Inwards_Cleared_DateCaption; Inwards_Cleared_DateCaptionLbl)
            {
            }
            column(Inwards_Received_DateCaption; Inwards_Received_DateCaptionLbl)
            {
            }
            column(Qty_Sent_to_VendorCaption; Qty_Sent_to_VendorCaptionLbl)
            {
            }
            column(Qty_ReceivedCaption; Qty_ReceivedCaptionLbl)
            {
            }
            column(DifferenceCaption; DifferenceCaptionLbl)
            {
            }
            column(MakeCaption; MakeCaptionLbl)
            {
            }
            column(TotalsCaption; TotalsCaptionLbl)
            {
            }
            column(PPM_LevelCaption; PPM_LevelCaptionLbl)
            {
            }
            column(isCaption; isCaptionLbl)
            {
            }
            column(Total_Posted_IR_sCaption; Total_Posted_IR_sCaptionLbl)
            {
            }
            column(Inspection_Receipt_Header_No_; "No.")
            {
            }
            column(Inspection_Receipt_Header_Item_No_; "Item No.")
            {
            }
            column(Inspection_Receipt_Header_Lot_No_; "Lot No.")
            {
            }
            dataitem("Posted Inspect DatasheetHeader"; "Posted Inspect DatasheetHeader")
            {
                DataItemLink = Item No.=FIELD(Item No.),Lot No.=FIELD(Lot No.),Inspection Receipt No.=FIELD(No.);
                column(Inspection_Receipt_Header___No__;"Inspection Receipt Header"."No.")
                {
                }
                column(Inspection_Receipt_Header___Vendor_Name_;"Inspection Receipt Header"."Vendor Name")
                {
                }
                column(Inspection_Receipt_Header___Item_Description_;"Inspection Receipt Header"."Item Description")
                {
                }
                column(Inspection_Receipt_Header__Quantity;"Inspection Receipt Header".Quantity)
                {
                }
                column(Inspection_Receipt_Header___Qty__Rework_;"Inspection Receipt Header"."Qty. Rework")
                {
                }
                column(Inspection_Receipt_Header___Qty__Rejected_;"Inspection Receipt Header"."Qty. Rejected")
                {
                }
                column(Inspection_Receipt_Header___Posting_Date_;"Inspection Receipt Header"."Posting Date")
                {
                }
                column(Inspection_Receipt_Header___Qty__Sent_To_Vendor__Rework__;"Inspection Receipt Header"."Qty. Sent To Vendor (Rework)")
                {
                }
                column(Inspection_Receipt_Header___Qty__Received_Rework__;"Inspection Receipt Header"."Qty. Received(Rework)")
                {
                }
                column(datesdiff;datesdiff)
                {
                }
                column(Posted_Inspect_DatasheetHeader__Posted_Inspect_DatasheetHeader___Posting_Date_;"Posted Inspect DatasheetHeader"."Posting Date")
                {
                }
                column(text1;text1)
                {
                }
                column(Posted_Inspect_DatasheetHeader_No_;"No.")
                {
                }
                column(Posted_Inspect_DatasheetHeader_Item_No_;"Item No.")
                {
                }
                column(Posted_Inspect_DatasheetHeader_Lot_No_;"Lot No.")
                {
                }
                column(Posted_Inspect_DatasheetHeader_Inspection_Receipt_No_;"Inspection Receipt No.")
                {
                }
            }

            trigger OnPreDataItem();
            begin
                LastFieldNo := FIELDNO("No.");
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
        LastFieldNo : Integer;
        FooterPrinted : Boolean;
        totalqty : Decimal;
        totalacceptedqty : Decimal;
        totalrejqty : Decimal;
        totalqtysendtorework : Decimal;
        totalrecivedqty : Decimal;
        totalreworkqty : Decimal;
        choose : Option General,SelectionBased;
        companyid : Record "Company Information";
        datesdiffsum : Integer;
        datesdiff : Integer;
        ppm : Decimal;
        PIDS : Record "Posted Inspect Datasheet Line";
        text1 : Text[100];
        totprt : Integer;
        List_of_Posted_Inspected_ReceiptsCaptionLbl : Label 'List of Posted Inspected Receipts';
        Serail_No_CaptionLbl : Label 'Serail No.';
        List_of_Posted_Inspected_ReceiptsCaption_Control1000000001Lbl : Label 'List of Posted Inspected Receipts';
        No_CaptionLbl : Label 'No.';
        Vendor_NameCaptionLbl : Label 'Vendor Name';
        Item_DescriptionCaptionLbl : Label 'Item Description';
        QuantityCaptionLbl : Label 'Quantity';
        Qty_ReworkCaptionLbl : Label 'Qty Rework';
        Qty_RejectedCaptionLbl : Label 'Qty Rejected';
        Inwards_Cleared_DateCaptionLbl : Label 'Inwards Cleared Date';
        Inwards_Received_DateCaptionLbl : Label 'Inwards Received Date';
        Qty_Sent_to_VendorCaptionLbl : Label 'Qty Sent to Vendor';
        Qty_ReceivedCaptionLbl : Label 'Qty Received';
        DifferenceCaptionLbl : Label 'Difference';
        MakeCaptionLbl : Label 'Make';
        TotalsCaptionLbl : Label 'Totals';
        PPM_LevelCaptionLbl : Label 'PPM Level';
        isCaptionLbl : Label 'is';
        Total_Posted_IR_sCaptionLbl : Label 'Total Posted IR''s';
}

