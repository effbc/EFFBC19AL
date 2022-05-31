report 33000269 "Inspection Receipt List"
{
    // version B2B 1.0

    DefaultLayout = RDLC;
    RDLCLayout = './Inspection Receipt List.rdlc';

    dataset
    {
        dataitem("Inspection Receipt Header"; "Inspection Receipt Header")
        {
            DataItemTableView = SORTING(Document Date, Source Type, Vendor No., Prod. Order No.);
            RequestFilterFields = "Document Date", "Vendor No.", "Order No.", "Prod. Order No.", Status;
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
            column(Prod__Order_No_________Prod__Description_; "Prod. Order No." + '  ' + "Prod. Description")
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
            column(Inspection_Receipt_Header__Unit_Of_Measure_Code_; "Unit Of Measure Code")
            {
            }
            column(Inspection_Receipt_Header__Order_No__; "Order No.")
            {
            }
            column(Inspection_Receipt_Header__Operation_No__; "Operation No.")
            {
            }
            column(Inspection_Receipt_Header__Base_Unit_Of_Measure_; "Base Unit Of Measure")
            {
            }
            column(Inspection_Receipt_Header__Quantity_Base__; "Quantity(Base)")
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
            column(UOM___Base_UOMCaption; UOM___Base_UOMCaptionLbl)
            {
            }
            column(Order_No_Caption; Order_No_CaptionLbl)
            {
            }
            column(Base_Qty_Caption; Base_Qty_CaptionLbl)
            {
            }
            column(DateCaption_Control1102152032; DateCaption_Control1102152032Lbl)
            {
            }
            column(Prod__Ord__No___DescriptionCaption; Prod__Ord__No___DescriptionCaptionLbl)
            {
            }
            column(No_Caption_Control1102152034; No_Caption_Control1102152034Lbl)
            {
            }
            column(Item_No_Caption; Item_No_CaptionLbl)
            {
            }
            column(Item_DescriptionCaption_Control1102152036; Item_DescriptionCaption_Control1102152036Lbl)
            {
            }
            column(TotalCaption_Control1102152037; TotalCaption_Control1102152037Lbl)
            {
            }
            column(QuantityCaption_Control1102152038; QuantityCaption_Control1102152038Lbl)
            {
            }
            column(AcceptedCaption_Control1102152039; AcceptedCaption_Control1102152039Lbl)
            {
            }
            column(ReworkCaption_Control1102152040; ReworkCaption_Control1102152040Lbl)
            {
            }
            column(RejectedCaption_Control1102152041; RejectedCaption_Control1102152041Lbl)
            {
            }
            column(Rework_Reference_No_Caption; Rework_Reference_No_CaptionLbl)
            {
            }
            column(UOM___Base_UOMCaption_Control1102152044; UOM___Base_UOMCaption_Control1102152044Lbl)
            {
            }
            column(Operation_No_Caption; Operation_No_CaptionLbl)
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
            column(Inspection_Receipt_Header_Prod__Order_No_; "Prod. Order No.")
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

            trigger OnPreDataItem();
            begin
                IF Select = Select::"In Bound" THEN
                    SETRANGE("Source Type", "Source Type"::"In Bound")
                ELSE
                    SETRANGE("Source Type", "Source Type"::WIP)
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
        Select: Option "In Bound",WIP;
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
        UOM___Base_UOMCaptionLbl: Label 'UOM / Base UOM';
        Order_No_CaptionLbl: Label 'Order No.';
        Base_Qty_CaptionLbl: Label 'Base Qty.';
        DateCaption_Control1102152032Lbl: Label 'Date';
        Prod__Ord__No___DescriptionCaptionLbl: Label 'Prod. Ord. No & Description';
        No_Caption_Control1102152034Lbl: Label '"  No."';
        Item_No_CaptionLbl: Label 'Item No.';
        Item_DescriptionCaption_Control1102152036Lbl: Label 'Item Description';
        TotalCaption_Control1102152037Lbl: Label 'Total';
        QuantityCaption_Control1102152038Lbl: Label 'Quantity';
        AcceptedCaption_Control1102152039Lbl: Label 'Accepted';
        ReworkCaption_Control1102152040Lbl: Label 'Rework';
        RejectedCaption_Control1102152041Lbl: Label 'Rejected';
        Rework_Reference_No_CaptionLbl: Label 'Rework Reference No.';
        UOM___Base_UOMCaption_Control1102152044Lbl: Label 'UOM / Base UOM';
        Operation_No_CaptionLbl: Label 'Operation No.';
        RemarksCaptionLbl: Label 'Remarks';
        Inspected_byCaptionLbl: Label 'Inspected by';
        Approved_ByCaptionLbl: Label 'Approved By';
}

