report 50070 "Daily Inspection Data Sheet1"
{
    // version B2B 1.0

    DefaultLayout = RDLC;
    RDLCLayout = './Daily Inspection Data Sheet1.rdlc';

    dataset
    {
        dataitem("Inspection Datasheet Header";"Inspection Datasheet Header")
        {
            DataItemTableView = SORTING(No.) WHERE(Source Type=CONST(In Bound));
            RequestFilterFields = "No.","Created Date","Vendor No.","Order No.";
            ReqFilterHeading = 'Inspection Datasheet';
            column(FORMAT_TODAY_0_4_;FORMAT(TODAY,0,4))
            {
            }
            column(COMPANYNAME;COMPANYNAME)
            {
            }
            column(CurrReport_PAGENO;CurrReport.PAGENO)
            {
            }
            column(USERID;USERID)
            {
            }
            column(Inspection_Datasheet_Header__No__;"No.")
            {
            }
            column(Inspection_Datasheet_Header__Created_Date_;"Created Date")
            {
            }
            column(Inspection_Datasheet_Header__Source_Type_;"Source Type")
            {
            }
            column(Inspection_Datasheet_Header__Item_No__;"Item No.")
            {
            }
            column(Inspection_Datasheet_Header__Item_Description_;"Item Description")
            {
            }
            column(Inspection_Datasheet_Header_Quantity;Quantity)
            {
            }
            column(Inspection_Datasheet_Header__Rework_Reference_No__;"Rework Reference No.")
            {
            }
            column(Inspection_Datasheet_Header__Vendor_No__;"Vendor No.")
            {
            }
            column(Inspection_Datasheet_Header__Vendor_Name_;"Vendor Name")
            {
            }
            column(Inspection_Datasheet_Header__Order_No__;"Order No.")
            {
            }
            column(OrderLineNO;OrderLineNO)
            {
            }
            column(Inspection_Datasheet_Header__Prod__Order_No__;"Prod. Order No.")
            {
            }
            column(Sl_No__;"Sl.No.")
            {
            }
            column(Inspection_Datasheet_Header__Inspection_Datasheet_Header___External_Document_No__;"Inspection Datasheet Header"."External Document No.")
            {
            }
            column(Inspection_Datasheet_Header__Created_By_;"Created By")
            {
            }
            column(Inspection_Datasheet_Header__Created_Date__Control1000000017;"Created Date")
            {
            }
            column(Inspection_Datasheet_Header__Posted_Date_;"Posted Date")
            {
            }
            column(Inspection_Datasheet_Header__Posted_By_;"Posted By")
            {
            }
            column(Daily_Inspection_Datasheet_HeaderCaption;Daily_Inspection_Datasheet_HeaderCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Material_Receipt___Inspection_ReportCaption;Material_Receipt___Inspection_ReportCaptionLbl)
            {
            }
            column(IDS_No___Dt_Caption;IDS_No___Dt_CaptionLbl)
            {
            }
            column(Extl_Doc__NoCaption;Extl_Doc__NoCaptionLbl)
            {
            }
            column(Inspection_Datasheet_Header__Source_Type_Caption;FIELDCAPTION("Source Type"))
            {
            }
            column(Inspection_Datasheet_Header__Item_No__Caption;FIELDCAPTION("Item No."))
            {
            }
            column(Item_DescriptionCaption;Item_DescriptionCaptionLbl)
            {
            }
            column(Qty_Caption;Qty_CaptionLbl)
            {
            }
            column(Rework_Ref__No_Caption;Rework_Ref__No_CaptionLbl)
            {
            }
            column(Vendor_No_____NameCaption;Vendor_No_____NameCaptionLbl)
            {
            }
            column(Inspection_Datasheet_Header__Order_No__Caption;FIELDCAPTION("Order No."))
            {
            }
            column(Line_NoCaption;Line_NoCaptionLbl)
            {
            }
            column(Sl_No_Caption;Sl_No_CaptionLbl)
            {
            }
            column(Inspection_Datasheet_Header__Created_By_Caption;FIELDCAPTION("Created By"))
            {
            }
            column(Inspection_Datasheet_Header__Created_Date__Control1000000017Caption;FIELDCAPTION("Created Date"))
            {
            }
            column(Stores_InchargeCaption;Stores_InchargeCaptionLbl)
            {
            }
            column(DateCaption;DateCaptionLbl)
            {
            }
            column(Inspection_Datasheet_Header__Posted_Date_Caption;FIELDCAPTION("Posted Date"))
            {
            }
            column(Inspection_Datasheet_Header__Posted_By_Caption;FIELDCAPTION("Posted By"))
            {
            }

            trigger OnAfterGetRecord();
            begin
                "Sl.No." := "Sl.No." + 1;
                IF "Inspection Datasheet Header"."Purch Line No" <> 0 THEN
                  OrderLineNO := "Inspection Datasheet Header"."Purch Line No"
                ELSE
                  OrderLineNO := "Inspection Datasheet Header"."Prod. Order Line";

                  PurchRecptLine.INIT;
                  IF PurchRecptLine.GET("Inspection Receipt No.","Purch Line No") THEN
                //   DrawingNo:=PurchRecptLine."Drawing No.";
                //  IndentReference:=PurchRecptLine."Indent Reference";
            end;

            trigger OnPreDataItem();
            begin
                LastFieldNo := FIELDNO("No.");
                "Sl.No." := 0;
                FormatAddr.Company(companyaddr,companyinfo)
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
        "Sl.No." : Integer;
        OrderNO : Code[20];
        OrderLineNO : Integer;
        PurchRecptLine : Record "Purch. Rcpt. Line";
        DrawingNo : Code[20];
        IndentReference : Text[50];
        companyinfo : Record "Company Information";
        companyaddr : array [8] of Text[30];
        FormatAddr : Codeunit "Format Address";
        Daily_Inspection_Datasheet_HeaderCaptionLbl : Label 'Daily Inspection Datasheet Header';
        CurrReport_PAGENOCaptionLbl : Label 'Page';
        Material_Receipt___Inspection_ReportCaptionLbl : Label 'Material Receipt & Inspection Report';
        IDS_No___Dt_CaptionLbl : Label 'IDS No.& Dt.';
        Extl_Doc__NoCaptionLbl : Label 'Extl.Doc. No';
        Item_DescriptionCaptionLbl : Label 'Item Description';
        Qty_CaptionLbl : Label 'Qty.';
        Rework_Ref__No_CaptionLbl : Label 'Rework Ref. No.';
        Vendor_No_____NameCaptionLbl : Label 'Vendor No. &  Name';
        Line_NoCaptionLbl : Label 'Line No';
        Sl_No_CaptionLbl : Label 'Sl.No.';
        Stores_InchargeCaptionLbl : Label 'Stores Incharge';
        DateCaptionLbl : Label 'Date';
}

