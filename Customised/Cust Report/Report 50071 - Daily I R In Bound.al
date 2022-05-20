report 50071 "Daily I R In Bound"
{
    // version B2B 1.0

    DefaultLayout = RDLC;
    RDLCLayout = './Daily I R In Bound.rdlc';

    dataset
    {
        dataitem("Inspection Receipt Header";"Inspection Receipt Header")
        {
            DataItemTableView = SORTING(Document Date,Source Type,Vendor No.,Prod. Order No.) WHERE(Source Type=CONST(In Bound),Status=CONST(No));
            RequestFilterFields = "Posting Date","Vendor No.","Order No.",Status,"Source Type";
            ReqFilterHeading = 'Inspection Receipt';
            column(COMPANYNAME;COMPANYNAME)
            {
            }
            column(STRSUBSTNO_Text005_FORMAT_CurrReport_PAGENO__;STRSUBSTNO(Text005,FORMAT(CurrReport.PAGENO)))
            {
            }
            column(Inspection_Receipt_Header__Document_Date_;"Document Date")
            {
            }
            column(Vendor_No_________Vendor_Name_;  "Vendor No."+'  '+"Vendor Name")
            {
            }
            column(Inspection_Receipt_Header__No__;"No.")
            {
            }
            column(Inspection_Receipt_Header__Item_No__;"Item No.")
            {
            }
            column(Item_Description_______Desc;"Item Description"+'  '+Desc)
            {
            }
            column(Inspection_Receipt_Header_Quantity;Quantity)
            {
            }
            column(Inspection_Receipt_Header__Rework_Reference_No__;"Rework Reference No.")
            {
            }
            column(Inspection_Receipt_Header__Order_No__;"Order No.")
            {
            }
            column(Inspection_Receipt_Header__Unit_Of_Measure_Code_;"Unit Of Measure Code")
            {
            }
            column(Inspection_Receipt_Header__Source_Type_;"Source Type")
            {
            }
            column(Daily_Material_Receipt_and_Inspection_ReportCaption;Daily_Material_Receipt_and_Inspection_ReportCaptionLbl)
            {
            }
            column(DateCaption;DateCaptionLbl)
            {
            }
            column(Vendor_No_____NameCaption;Vendor_No_____NameCaptionLbl)
            {
            }
            column(No_Caption;No_CaptionLbl)
            {
            }
            column(Inspection_Receipt_Header__Item_No__Caption;FIELDCAPTION("Item No."))
            {
            }
            column(Item_DescriptionCaption;Item_DescriptionCaptionLbl)
            {
            }
            column(QuantityCaption;QuantityCaptionLbl)
            {
            }
            column(Inspection_Receipt_Header__Rework_Reference_No__Caption;FIELDCAPTION("Rework Reference No."))
            {
            }
            column(UOMCaption;UOMCaptionLbl)
            {
            }
            column(Order_No_Caption;Order_No_CaptionLbl)
            {
            }
            column(Source_TypeCaption;Source_TypeCaptionLbl)
            {
            }
            column(RemarksCaption;RemarksCaptionLbl)
            {
            }
            column(Inspection_Receipt_Header_Vendor_No_;"Vendor No.")
            {
            }
            column(Inspection_Receipt_Header_Receipt_No_;"Receipt No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF Item.GET("Item No.") THEN
                   Desc := Item."Description 2";

                PurchaseLine.SETRANGE("Document Type",PurchaseLine."Document Type" :: Order);
                PurchaseLine.SETRANGE("Document No.","Order No.");
                PurchaseLine.SETRANGE("Line No.","Purch Line No");
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
        Text005 : Label 'Page %1';
        Item : Record Item;
        Desc : Text[50];
        UOM : Code[20];
        PurchaseLine : Record "Purchase Line";
        Daily_Material_Receipt_and_Inspection_ReportCaptionLbl : Label 'Daily Material Receipt and Inspection Report';
        DateCaptionLbl : Label 'Date';
        Vendor_No_____NameCaptionLbl : Label 'Vendor No. &  Name';
        No_CaptionLbl : Label '"  No."';
        Item_DescriptionCaptionLbl : Label 'Item Description';
        QuantityCaptionLbl : Label 'Quantity';
        UOMCaptionLbl : Label 'UOM';
        Order_No_CaptionLbl : Label 'Order No.';
        Source_TypeCaptionLbl : Label 'Source Type';
        RemarksCaptionLbl : Label 'Remarks';
}

