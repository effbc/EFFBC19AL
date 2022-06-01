report 33000267 "Inspection Receipt In Bound"
{
    // version B2B 1.0

    DefaultLayout = RDLC;
    RDLCLayout = './Inspection Receipt In Bound.rdlc';

    dataset
    {
        dataitem("Inspection Receipt Header"; "Inspection Receipt Header")
        {
            DataItemTableView = SORTING(Document Date, Source Type, Vendor No., Prod. Order No.) WHERE(Source Type=CONST(In Bound));
            RequestFilterFields = "Posting Date", "Vendor No.", "Order No.", Status, "Source Type";
            ReqFilterHeading = 'Inspection Receipt';
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(STRSUBSTNO_Text005_FORMAT_CurrReport_PAGENO__; STRSUBSTNO(Text005, FORMAT(CurrReport.PAGENO)))
            {
            }
            column(Inspection_Receipt_Header__Document_Date_; "Document Date")
            {
            }
            column(Vendor_No_________Vendor_Name_; "Vendor No." + '  ' + "Vendor Name")
            {
            }
            column(Inspection_Receipt_Header__No__; "No.")
            {
            }
            column(Inspection_Receipt_Header__Item_No__; "Item No.")
            {
            }
            column(Item_Description_______Desc; "Item Description" + '  ' + Desc)
            {
            }
            column(Inspection_Receipt_Header_Quantity; Quantity)
            {
            }
            column(Qty__Accepted_____Qty__Accepted_Under_Deviation_; "Qty. Accepted" + "Qty. Accepted Under Deviation")
            {
            }
            column(Inspection_Receipt_Header__Qty__Rejected_; "Qty. Rejected")
            {
            }
            column(Inspection_Receipt_Header__Qty__Rework_; "Qty. Rework")
            {
            }
            column(Inspection_Receipt_Header__Rework_Reference_No__; "Rework Reference No.")
            {
            }
            column(UOM; UOM)
            {
            }
            column(Inspection_Receipt_Header__Order_No__; "Order No.")
            {
            }
            column(Material_Receipt_and_Inspection_ReportCaption; Material_Receipt_and_Inspection_ReportCaptionLbl)
            {
            }
            column(DateCaption; DateCaptionLbl)
            {
            }
            column(Vendor_No_____NameCaption; Vendor_No_____NameCaptionLbl)
            {
            }
            column(No_Caption; No_CaptionLbl)
            {
            }
            column(Inspection_Receipt_Header__Item_No__Caption; FIELDCAPTION("Item No."))
            {
            }
            column(Item_DescriptionCaption; Item_DescriptionCaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(QuantityCaption; QuantityCaptionLbl)
            {
            }
            column(AcceptedCaption; AcceptedCaptionLbl)
            {
            }
            column(ReworkCaption; ReworkCaptionLbl)
            {
            }
            column(RejectedCaption; RejectedCaptionLbl)
            {
            }
            column(Inspection_Receipt_Header__Rework_Reference_No__Caption; FIELDCAPTION("Rework Reference No."))
            {
            }
            column(UOMCaption; UOMCaptionLbl)
            {
            }
            column(Order_No_Caption; Order_No_CaptionLbl)
            {
            }
            column(RemarksCaption; RemarksCaptionLbl)
            {
            }
            column(Inspected_byCaption; Inspected_byCaptionLbl)
            {
            }
            column(Approved_ByCaption; Approved_ByCaptionLbl)
            {
            }
            column(Inspection_Receipt_Header_Vendor_No_; "Vendor No.")
            {
            }
            column(Inspection_Receipt_Header_Receipt_No_; "Receipt No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF Item.GET("Item No.") THEN
                    Desc := Item."Description 2";

                PurchaseLine.SETRANGE("Document Type", PurchaseLine."Document Type"::Order);
                PurchaseLine.SETRANGE("Document No.", "Order No.");
                PurchaseLine.SETRANGE("Line No.", "Purch Line No");
                //PurchaseLine.SETRANGE("No.","Item No.");
                IF PurchaseLine.FIND('-') THEN
                    UOM := PurchaseLine."Unit of Measure Code";
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
        Text005: Label 'Page %1';
        Item: Record Item;
        Desc: Text[50];
        UOM: Code[20];
        PurchaseLine: Record "Purchase Line";
        Material_Receipt_and_Inspection_ReportCaptionLbl: Label 'Material Receipt and Inspection Report';
        DateCaptionLbl: Label 'Date';
        Vendor_No_____NameCaptionLbl: Label 'Vendor No. &  Name';
        No_CaptionLbl: Label '"  No."';
        Item_DescriptionCaptionLbl: Label 'Item Description';
        TotalCaptionLbl: Label 'Total';
        QuantityCaptionLbl: Label 'Quantity';
        AcceptedCaptionLbl: Label 'Accepted';
        ReworkCaptionLbl: Label 'Rework';
        RejectedCaptionLbl: Label 'Rejected';
        UOMCaptionLbl: Label 'UOM';
        Order_No_CaptionLbl: Label 'Order No.';
        RemarksCaptionLbl: Label 'Remarks';
        Inspected_byCaptionLbl: Label 'Inspected by';
        Approved_ByCaptionLbl: Label 'Approved By';
}

