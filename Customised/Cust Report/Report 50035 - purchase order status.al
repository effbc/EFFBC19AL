report 50035 "purchase order status"
{
    // version ESPL 1.0,EFFUPG

    // IF purchaseheader.GET("Purchase Line"."Document No.") THEN
    // orderdate:=purchaseheader."Order Date";
    DefaultLayout = RDLC;
    RDLCLayout = './purchase order status.rdlc';


    dataset
    {
        dataitem("Purchase Line"; "Purchase Line")
        {
            CalcFields = Document Date;
            DataItemTableView = SORTING(Document Type, Document No., No., Buy-from Vendor No.) ORDER(Ascending) WHERE(Document Type=CONST(Order));
            RequestFilterFields = "Document No.", Type, "No.", "Buy-from Vendor No.", "Expected Receipt Date", "Order Date";
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(USERID; USERID)
            {
            }
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME_Control1000000030; COMPANYNAME)
            {
            }
            column(FORMAT_TODAY_0_4__Control1000000031; FORMAT(TODAY, 0, 4))
            {
            }
            column(USERID_Control1000000032; USERID)
            {
            }
            column(Purchase_Line__Document_No__; "Document No.")
            {
            }
            column(Purchase_Line_Description; Description)
            {
            }
            column(Purchase_Line_Quantity; Quantity)
            {
            }
            column(Purchase_Line__Unit_of_Measure_; "Unit of Measure")
            {
            }
            column(Purchase_Line__Quantity_Received_; "Quantity Received")
            {
            }
            column(Purchase_Line__Purchase_Line___Qty__to_Receive_; "Purchase Line"."Qty. to Receive")
            {
            }
            column(sno; sno)
            {
            }
            column(orderdate; orderdate)
            {
            }
            column(text1; text1)
            {
            }
            column(Purchase_Line__Purchase_Line___Direct_Unit_Cost_; "Purchase Line"."Direct Unit Cost")
            {
            }
            column(Purchase_Line__Purchase_Line___Expected_Receipt_Date_; "Purchase Line"."Expected Receipt Date")
            {
            }
            column(Purchase_Line__Quantity_Invoiced_; "Quantity Invoiced")
            {
            }
            column(Purchase_Line__Purchase_Line__Remarks; "Purchase Line".Remarks)
            {
            }
            column(Purchase_Line__Deviated_Receipt_Date_; "Deviated Receipt Date")
            {
            }
            column(text2; text2)
            {
            }
            column(text3; text3)
            {
            }
            column(UOMCaption; UOMCaptionLbl)
            {
            }
            column(Pending_QtyCaption; Pending_QtyCaptionLbl)
            {
            }
            column(Expected_Reciept_dateCaption; Expected_Reciept_dateCaptionLbl)
            {
            }
            column(Quantity_InvoicedCaption; Quantity_InvoicedCaptionLbl)
            {
            }
            column(Unit_CostCaption; Unit_CostCaptionLbl)
            {
            }
            column(DescriptionCaption; DescriptionCaptionLbl)
            {
            }
            column(Ordered_QtyCaption; Ordered_QtyCaptionLbl)
            {
            }
            column(Quantity_ReceivedCaption; Quantity_ReceivedCaptionLbl)
            {
            }
            column(Vendor_nameCaption; Vendor_nameCaptionLbl)
            {
            }
            column(Order_DateCaption; Order_DateCaptionLbl)
            {
            }
            column(Purchase_Order_No_Caption; Purchase_Order_No_CaptionLbl)
            {
            }
            column(SnoCaption; SnoCaptionLbl)
            {
            }
            column(Purchase_Order_Status_ReportCaption; Purchase_Order_Status_ReportCaptionLbl)
            {
            }
            column(RemarksCaption; RemarksCaptionLbl)
            {
            }
            column(Deviated_Reciept_DateCaption; Deviated_Reciept_DateCaptionLbl)
            {
            }
            column(Lead_TimeCaption; Lead_TimeCaptionLbl)
            {
            }
            column(No_of_Deviated_DaysCaption; No_of_Deviated_DaysCaptionLbl)
            {
            }
            column(Purchase_Order_No_Caption_Control1000000021; Purchase_Order_No_Caption_Control1000000021Lbl)
            {
            }
            column(DescriptionCaption_Control1000000023; DescriptionCaption_Control1000000023Lbl)
            {
            }
            column(UOMCaption_Control1000000025; UOMCaption_Control1000000025Lbl)
            {
            }
            column(Quantity_ReceivedCaption_Control1000000026; Quantity_ReceivedCaption_Control1000000026Lbl)
            {
            }
            column(Pending_QtyCaption_Control1000000027; Pending_QtyCaption_Control1000000027Lbl)
            {
            }
            column(Purchase_Order_Status_ReportCaption_Control1000000029; Purchase_Order_Status_ReportCaption_Control1000000029Lbl)
            {
            }
            column(SnoCaption_Control1000000033; SnoCaption_Control1000000033Lbl)
            {
            }
            column(Order_DateCaption_Control1000000035; Order_DateCaption_Control1000000035Lbl)
            {
            }
            column(Vendor_nameCaption_Control1000000036; Vendor_nameCaption_Control1000000036Lbl)
            {
            }
            column(Unit_CostCaption_Control1000000041; Unit_CostCaption_Control1000000041Lbl)
            {
            }
            column(Expected_Reciept_dateCaption_Control1000000046; Expected_Reciept_dateCaption_Control1000000046Lbl)
            {
            }
            column(Purchase_Line__Quantity_Invoiced_Caption; FIELDCAPTION("Quantity Invoiced"))
            {
            }
            column(RemarksCaption_Control1000000068; RemarksCaption_Control1000000068Lbl)
            {
            }
            column(Ordered_QtyCaption_Control1000000024; Ordered_QtyCaption_Control1000000024Lbl)
            {
            }
            column(Deviated_Reciept_DateCaption_Control1102154001; Deviated_Reciept_DateCaption_Control1102154001Lbl)
            {
            }
            column(Lead_TimeCaption_Control1000000001; Lead_TimeCaption_Control1000000001Lbl)
            {
            }
            column(No_of_Deviated_DaysCaption_Control1000000009; No_of_Deviated_DaysCaption_Control1000000009Lbl)
            {
            }
            column(Purchase_Line_Document_Type; "Document Type")
            {
            }
            column(Purchase_Line_Line_No_; "Line No.")
            {
            }
            column(All_Optioncaption; opt)
            {
            }
            column(Text_Caption; text)
            {
            }
            column(Pend_Text_Caption; ((opt = opt::Pend) AND (text = 0)))
            {
            }
            column(BodyVisi; BodyVisi)
            {
            }

            trigger OnAfterGetRecord();
            var
                IH: Record "Indent Header";
                PH: Record "Purchase Header";
            begin
                // Purchase Line, Body (3) - OnPreSection() >>
                BodyVisi := FALSE;
                text := "Purchase Line".Quantity - "Purchase Line"."Quantity Received";
                IF opt = opt::all THEN
                    sno := sno + 1;
                IF VendorInfo.GET("Purchase Line"."Pay-to Vendor No.") THEN
                    text1 := VendorInfo.Name;
                pendqtyamt := text * "Purchase Line"."Unit Cost";
                IF ITEM.GET("Purchase Line"."No.") THEN
                    text2 := FORMAT(ITEM."Safety Lead Time");

                PurchRcptLine.RESET;
                PurchRcptLine.SETFILTER(PurchRcptLine."Order No.", "Purchase Line"."Document No.");
                PurchRcptLine.SETRANGE(PurchRcptLine."Order Line No.", "Purchase Line"."Line No.");
                PurchRcptLine.SETRANGE(PurchRcptLine.Correction, FALSE);
                PurchRcptLine.SETFILTER(PurchRcptLine.Quantity, '>%1', 0);
                IF PurchRcptLine.FINDFIRST THEN
                    InwardDate := PurchRcptLine."Posting Date";
                IF "Purchase Line"."Expected Receipt Date" <> 0D THEN
                    IF ("Purchase Line"."Deviated Receipt Date" >= "Purchase Line"."Expected Receipt Date") THEN
                        text3 := FORMAT("Deviated Receipt Date" - "Purchase Line"."Expected Receipt Date")
                    ELSE
                        text3 := FORMAT(0);
                orderno := "Purchase Line"."Document No.";
                IF purchaseheader.GET(purchaseheader."Document Type"::Order, orderno) THEN
                    orderdate := purchaseheader."Order Date";

                IF opt = opt::Pend THEN BEGIN
                    IF (text = 0) THEN
                        BodyVisi := TRUE
                    ELSE BEGIN
                        orderno := "Purchase Line"."Document No.";
                        IF purchaseheader.GET(purchaseheader."Document Type"::Order, orderno) THEN
                            orderdate := purchaseheader."Order Date";
                        BodyVisi := FALSE;
                        sno := sno + 1;
                    END;
                END;

                IF EXCEL AND NOT BodyVisi THEN BEGIN
                    Row += 1;
                    Entercell(Row, 1, FORMAT(sno), FALSE, TempExcelbuffer."Cell Type"::Number);
                    Entercell(Row, 2, FORMAT("Document No."), FALSE, TempExcelbuffer."Cell Type"::Text);
                    orderno := "Purchase Line"."Document No.";
                    IF purchaseheader.GET(purchaseheader."Document Type"::Order, orderno) THEN
                        orderdate := purchaseheader."Order Date";
                    Entercell(Row, 3, FORMAT(orderdate), FALSE, TempExcelbuffer."Cell Type"::Date);
                    Entercell(Row, 4, FORMAT(text1), FALSE, TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row, 5, FORMAT("Purchase Line"."No."), FALSE, TempExcelbuffer."Cell Type"::Number);
                    Entercell(Row, 6, FORMAT(Description), FALSE, TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row, 7, FORMAT(Quantity), FALSE, TempExcelbuffer."Cell Type"::Number);
                    Entercell(Row, 8, FORMAT("Quantity Received"), FALSE, TempExcelbuffer."Cell Type"::Number);
                    Entercell(Row, 9, FORMAT("Quantity Invoiced"), FALSE, TempExcelbuffer."Cell Type"::Number);
                    Entercell(Row, 10, FORMAT("Purchase Line"."Qty. to Receive"), FALSE, TempExcelbuffer."Cell Type"::Number);
                    Entercell(Row, 11, FORMAT("Unit of Measure"), FALSE, TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row, 12, FORMAT("Purchase Line"."Direct Unit Cost"), FALSE, TempExcelbuffer."Cell Type"::Number);
                    Entercell(Row, 13, FORMAT("Purchase Line"."Expected Receipt Date"), FALSE, TempExcelbuffer."Cell Type"::Date);
                    Entercell(Row, 14, FORMAT("Deviated Receipt Date"), FALSE, TempExcelbuffer."Cell Type"::Date);
                    Entercell(Row, 15, FORMAT(text3), FALSE, TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row, 16, FORMAT("Purchase Line".Remarks), FALSE, TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row, 17, FORMAT(text2), FALSE, TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row, 18, FORMAT(InwardDate), FALSE, TempExcelbuffer."Cell Type"::Date);
                    Entercell(Row, 19, FORMAT("Purchase Line"."Part Number"), FALSE, TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row, 20, FORMAT("Purchase Line".Package), FALSE, TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row, 21, FORMAT("Purchase Line".Make), FALSE, TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row, 22, FORMAT("Purchase Line"."Indent No."), FALSE, TempExcelbuffer."Cell Type"::Text);
                    IH.RESET;
                    IH.SETFILTER(IH."No.", "Purchase Line"."Indent No.");
                    IF IH.FINDFIRST THEN
                        Entercell(Row, 23, FORMAT(IH."Release Date Time"), FALSE, TempExcelbuffer."Cell Type"::Date);
                    PH.RESET;
                    PH.SETFILTER(PH."No.", "Purchase Line"."Document No.");
                    IF PH.FINDFIRST THEN
                        Entercell(Row, 24, FORMAT(PH.Mail_Sent), FALSE, TempExcelbuffer."Cell Type"::Date);

                END;
                // Purchase Line, Body (3) - OnPreSection() <<
            end;

            trigger OnPreDataItem();
            begin
                CLEAR(sno);
                IF EXCEL THEN BEGIN
                    Row += 1;
                    Entercell(Row, 1, 'Sno', TRUE, TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row, 2, 'Purchase Order No.', TRUE, TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row, 3, 'ORDER DATE', TRUE, TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row, 4, 'Vendor Name', TRUE, TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row, 5, 'ITEM No.', TRUE, TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row, 6, 'DESCRIPTION', TRUE, TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row, 7, 'Ordered Quantity', TRUE, TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row, 8, 'Quantity Received', TRUE, TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row, 9, 'Quantity Invoiced', TRUE, TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row, 10, 'PENDING QTY', TRUE, TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row, 11, 'UOM', TRUE, TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row, 12, 'Unit Cost', TRUE, TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row, 13, 'EXPECTED RECEIPT DATE', TRUE, TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row, 14, 'Deviated RECEIPT DATE', TRUE, TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row, 15, 'No.of Deviated Days', TRUE, TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row, 16, 'Remarks', TRUE, TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row, 17, 'Lead Time', TRUE, TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row, 18, 'Inward Date', TRUE, TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row, 19, 'Part No', TRUE, TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row, 20, 'Package', TRUE, TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row, 21, 'Make', TRUE, TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row, 22, 'Indent No', TRUE, TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row, 23, 'Indent Released Dt', TRUE, TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row, 24, 'Mail Sent', TRUE, TempExcelbuffer."Cell Type"::Text);
                END;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Control1102152001)
                {
                    ShowCaption = false;
                    field(All; opt)
                    {
                        Caption = 'Select Option';
                    }
                    field(EXCEL; EXCEL)
                    {
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPostReport();
    begin
        IF EXCEL THEN BEGIN
            /*
            TempExcelbuffer.CreateBook('Purchase order Status',''); //EFFUPG
            TempExcelbuffer.WriteSheet('Purchase order Status',COMPANYNAME,USERID);
            TempExcelbuffer.CloseBook;
            TempExcelbuffer.OpenExcel;
            TempExcelbuffer.GiveUserControl;
            */
            TempExcelbuffer.CreateBookAndOpenExcel('', 'Purchase order Status', 'Purchase order Status', COMPANYNAME, USERID); //EFFUPG
        END;

    end;

    trigger OnPreReport();
    begin
        IF EXCEL THEN BEGIN
            CLEAR(TempExcelbuffer);
            TempExcelbuffer.DELETEALL;
        END;
    end;

    var
        text: Decimal;
        sno: Integer;
        VendorInfo: Record Vendor;
        text1: Text[80];
        pendqtyamt: Decimal;
        qtyinv: Decimal;
        EXCEL: Boolean;
        TempExcelbuffer: Record "Excel Buffer" temporary;
        Row: Integer;
        text2: Text[30];
        ITEM: Record Item;
        text3: Text[30];
        purchaseheader: Record "Purchase Header";
        orderdate: Date;
        orderno: Code[20];
        UOMCaptionLbl: Label 'UOM';
        Pending_QtyCaptionLbl: Label 'Pending Qty';
        Expected_Reciept_dateCaptionLbl: Label 'Expected Reciept date';
        Quantity_InvoicedCaptionLbl: Label 'Quantity Invoiced';
        Unit_CostCaptionLbl: Label 'Unit Cost';
        DescriptionCaptionLbl: Label 'Description';
        Ordered_QtyCaptionLbl: Label 'Ordered Qty';
        Quantity_ReceivedCaptionLbl: Label 'Quantity Received';
        Vendor_nameCaptionLbl: Label 'Vendor name';
        Order_DateCaptionLbl: Label 'Order Date';
        Purchase_Order_No_CaptionLbl: Label 'Purchase Order No.';
        SnoCaptionLbl: Label 'Sno';
        Purchase_Order_Status_ReportCaptionLbl: Label 'Purchase Order Status Report';
        RemarksCaptionLbl: Label 'Remarks';
        Deviated_Reciept_DateCaptionLbl: Label 'Deviated Reciept Date';
        Lead_TimeCaptionLbl: Label 'Lead Time';
        No_of_Deviated_DaysCaptionLbl: Label 'No.of Deviated Days';
        Purchase_Order_No_Caption_Control1000000021Lbl: Label 'Purchase Order No.';
        DescriptionCaption_Control1000000023Lbl: Label 'Description';
        UOMCaption_Control1000000025Lbl: Label 'UOM';
        Quantity_ReceivedCaption_Control1000000026Lbl: Label 'Quantity Received';
        Pending_QtyCaption_Control1000000027Lbl: Label 'Pending Qty';
        Purchase_Order_Status_ReportCaption_Control1000000029Lbl: Label 'Purchase Order Status Report';
        SnoCaption_Control1000000033Lbl: Label 'Sno';
        Order_DateCaption_Control1000000035Lbl: Label 'Order Date';
        Vendor_nameCaption_Control1000000036Lbl: Label 'Vendor name';
        Unit_CostCaption_Control1000000041Lbl: Label 'Unit Cost';
        Expected_Reciept_dateCaption_Control1000000046Lbl: Label 'Expected Reciept date';
        RemarksCaption_Control1000000068Lbl: Label 'Remarks';
        Ordered_QtyCaption_Control1000000024Lbl: Label 'Ordered Qty';
        Deviated_Reciept_DateCaption_Control1102154001Lbl: Label 'Deviated Reciept Date';
        Lead_TimeCaption_Control1000000001Lbl: Label 'Lead Time';
        No_of_Deviated_DaysCaption_Control1000000009Lbl: Label 'No.of Deviated Days';
        opt: Option Pend,all;
        BodyVisi: Boolean;
        PurchRcptLine: Record "Purch. Rcpt. Line";
        InwardDate: Date;

    (1617)]
    procedure Entercell(RowNo: Integer; ColumnNo: Integer; CellValue: Text[1000]; bold: Boolean; CellType: Option Number,Text,Date,Time);
    begin
        TempExcelbuffer.INIT;
        TempExcelbuffer.VALIDATE("Row No.", RowNo);
        TempExcelbuffer.VALIDATE("Column No.", ColumnNo);
        TempExcelbuffer."Cell Value as Text" := CellValue;
        TempExcelbuffer."Cell Type" := CellType; //New Parma for Excel
        TempExcelbuffer.Bold := bold;
        TempExcelbuffer.INSERT;
    end;

    (1626)]
    procedure EnterHeadings(RowNo: Integer; ColumnNo: Integer; CellValue: Text[100]; Bold: Boolean; CellType: Option Number,Text,Date,Time);
    begin
        TempExcelbuffer.INIT;
        TempExcelbuffer.VALIDATE("Row No.", RowNo);
        TempExcelbuffer.VALIDATE("Column No.", ColumnNo);
        TempExcelbuffer."Cell Value as Text" := FORMAT(CellValue);
        TempExcelbuffer.Bold := Bold;
        TempExcelbuffer."Cell Type" := CellType; //New Parma for Excel
        TempExcelbuffer.Formula := '';
        TempExcelbuffer.INSERT;
    end;
}

