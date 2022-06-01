report 50102 "TENDERS STATUS"
{
    // version sreenivas,Rev01

    DefaultLayout = RDLC;
    RDLCLayout = './TENDERS STATUS.rdlc';

    dataset
    {
        dataitem("Tender Header"; "Tender Header")
        {
            DataItemTableView = SORTING(Tender Status) ORDER(Ascending);
            RequestFilterFields = "Tender Status";
            column(Tender_Header__Customer_Name_; "Customer Name")
            {
            }
            column(Tender_Header__Customer_Tender_No__; "Customer Tender No.")
            {
            }
            column(Tender_Header__Tender_Description_; "Tender Description")
            {
            }
            column(Tender_Header__Minimum_Bid_Amount_; "Minimum Bid Amount")
            {
            }
            column(Tender_Header__Tender_Status_; "Tender Status")
            {
            }
            column(Tender_Header__Expected_Order_month_; "Expected Order month")
            {
            }
            column(Tender_Header__Tender_Position_; "Tender Position")
            {
            }
            column(Tender_Header__Tender_Header___EMD_Amount_; "Tender Header"."EMD Amount")
            {
            }
            column(Tender_Header__Tender_Header___Tender_Dated_; "Tender Header"."Tender Dated")
            {
            }
            column(Tender_Header__Tender_No__; "Tender No.")
            {
            }
            column(Tender_Header__Customer_Name__Control1102154002; "Customer Name")
            {
            }
            column(Tender_Header__Minimum_Bid_Amount__Control1102154004; "Minimum Bid Amount")
            {
            }
            column(Tender_Header__Tender_Status__Control1102154006; "Tender Status")
            {
            }
            column(Tender_Header__Tender_Position__Control1102154008; "Tender Position")
            {
            }
            column(Tender_Header_Status; Status)
            {
            }
            column(expvalue; expvalue)
            {
            }
            column(yettovalue; yettovalue)
            {
            }
            column(cancelvalue; cancelvalue)
            {
            }
            column(receivedamt; receivedamt)
            {
            }
            column(Unsucess; Unsucess)
            {
            }
            column(notparticipate; notparticipate)
            {
            }
            column(d1_1__1_; d1[1] [1])
            {
            }
            column(d1_2__1_; d1[2] [1])
            {
            }
            column(d1_3__1_; d1[3] [1])
            {
            }
            column(d1_4__1_; d1[4] [1])
            {
            }
            column(d1_5__1_; d1[5] [1])
            {
            }
            column(d1_6__1_; d1[6] [1])
            {
            }
            column(d1_7__1_; d1[7] [1])
            {
            }
            column(d1_8__1_; d1[8] [1])
            {
            }
            column(d1_9__1_; d1[9] [1])
            {
            }
            column(d1_10__1_; d1[10] [1])
            {
            }
            column(d1_1__2_; d1[1] [2])
            {
            }
            column(d1_2__2_; d1[2] [2])
            {
            }
            column(d1_3__2_; d1[3] [2])
            {
            }
            column(d1_4__2_; d1[4] [2])
            {
            }
            column(d1_5__2_; d1[5] [2])
            {
            }
            column(d1_6__2_; d1[6] [2])
            {
            }
            column(d1_7__2_; d1[7] [2])
            {
            }
            column(d1_8__2_; d1[8] [2])
            {
            }
            column(d1_9__2_; d1[9] [2])
            {
            }
            column(d1_10__2_; d1[10] [2])
            {
            }
            column(d1_1__3_; d1[1] [3])
            {
            }
            column(d1_2__3_; d1[2] [3])
            {
            }
            column(d1_3__3_; d1[3] [3])
            {
            }
            column(d1_4__3_; d1[4] [3])
            {
            }
            column(d1_5__3_; d1[5] [3])
            {
            }
            column(d1_6__3_; d1[6] [3])
            {
            }
            column(d1_7__3_; d1[7] [3])
            {
            }
            column(d1_8__3_; d1[8] [3])
            {
            }
            column(d1_9__3_; d1[9] [3])
            {
            }
            column(d1_10__3_; d1[10] [3])
            {
            }
            column(d1_1__4_; d1[1] [4])
            {
            }
            column(d1_2__4_; d1[2] [4])
            {
            }
            column(d1_3__4_; d1[3] [4])
            {
            }
            column(d1_4__4_; d1[4] [4])
            {
            }
            column(d1_5__4_; d1[5] [4])
            {
            }
            column(d1_6__4_; d1[6] [4])
            {
            }
            column(d1_7__4_; d1[7] [4])
            {
            }
            column(d1_8__4_; d1[8] [4])
            {
            }
            column(d1_9__4_; d1[9] [4])
            {
            }
            column(d1_10__4_; d1[10] [4])
            {
            }
            column(d1_1__5_; d1[1] [5])
            {
            }
            column(d1_2__5_; d1[2] [5])
            {
            }
            column(d1_3__5_; d1[3] [5])
            {
            }
            column(d1_4__5_; d1[4] [5])
            {
            }
            column(d1_5__5_; d1[5] [5])
            {
            }
            column(d1_6__5_; d1[6] [5])
            {
            }
            column(d1_7__5_; d1[7] [5])
            {
            }
            column(d1_8__5_; d1[8] [5])
            {
            }
            column(d1_9__5_; d1[9] [5])
            {
            }
            column(d1_10__5_; d1[10] [5])
            {
            }
            column(d1_1__6_; d1[1] [6])
            {
            }
            column(d1_2__6_; d1[2] [6])
            {
            }
            column(d1_3__6_; d1[3] [6])
            {
            }
            column(d1_4__6_; d1[4] [6])
            {
            }
            column(d1_5__6_; d1[5] [6])
            {
            }
            column(d1_6__6_; d1[6] [6])
            {
            }
            column(d1_7__6_; d1[7] [6])
            {
            }
            column(d1_8__6_; d1[8] [6])
            {
            }
            column(d1_9__6_; d1[9] [6])
            {
            }
            column(d1_10__6_; d1[10] [6])
            {
            }
            column(d1_1__7_; d1[1] [7])
            {
            }
            column(d1_2__7_; d1[2] [7])
            {
            }
            column(d1_3__7_; d1[3] [7])
            {
            }
            column(d1_4__7_; d1[4] [7])
            {
            }
            column(d1_5__7_; d1[5] [7])
            {
            }
            column(d1_6__7_; d1[6] [7])
            {
            }
            column(d1_7__7_; d1[7] [7])
            {
            }
            column(d1_8__7_; d1[8] [7])
            {
            }
            column(d1_9__7_; d1[9] [7])
            {
            }
            column(d1_10__7_; d1[10] [7])
            {
            }
            column(expvalue_Control1102154057; expvalue)
            {
            }
            column(d2_1__1_; d2[1] [1])
            {
            }
            column(d2_2__1_; d2[2] [1])
            {
            }
            column(d2_3__1_; d2[3] [1])
            {
            }
            column(d2_4__1_; d2[4] [1])
            {
            }
            column(d2_5__1_; d2[5] [1])
            {
            }
            column(d2_6__1_; d2[6] [1])
            {
            }
            column(d2_7__1_; d2[7] [1])
            {
            }
            column(d2_8__1_; d2[8] [1])
            {
            }
            column(d2_9__1_; d2[9] [1])
            {
            }
            column(d2_10__1_; d2[10] [1])
            {
            }
            column(d2_1__2_; d2[1] [2])
            {
            }
            column(d2_2__2_; d2[2] [2])
            {
            }
            column(d2_3__2_; d2[3] [2])
            {
            }
            column(d2_4__2_; d2[4] [2])
            {
            }
            column(d2_5__2_; d2[5] [2])
            {
            }
            column(d2_6__2_; d2[6] [2])
            {
            }
            column(d2_7__2_; d2[7] [2])
            {
            }
            column(d2_8__2_; d2[8] [2])
            {
            }
            column(d2_9__2_; d2[9] [2])
            {
            }
            column(d2_10__2_; d2[10] [2])
            {
            }
            column(d2_1__3_; d2[1] [3])
            {
            }
            column(d2_2__3_; d2[2] [3])
            {
            }
            column(d2_3__3_; d2[3] [3])
            {
            }
            column(d2_4__3_; d2[4] [3])
            {
            }
            column(d2_5__3_; d2[5] [3])
            {
            }
            column(d2_6__3_; d2[6] [3])
            {
            }
            column(d2_7__3_; d2[7] [3])
            {
            }
            column(d2_8__3_; d2[8] [3])
            {
            }
            column(d2_9__3_; d2[9] [3])
            {
            }
            column(d2_10__3_; d2[10] [3])
            {
            }
            column(d2_1__4_; d2[1] [4])
            {
            }
            column(d2_2__4_; d2[2] [4])
            {
            }
            column(d2_3__4_; d2[3] [4])
            {
            }
            column(d2_4__4_; d2[4] [4])
            {
            }
            column(d2_5__4_; d2[5] [4])
            {
            }
            column(d2_6__4_; d2[6] [4])
            {
            }
            column(d2_7__4_; d2[7] [4])
            {
            }
            column(d2_8__4_; d2[8] [4])
            {
            }
            column(d2_9__4_; d2[9] [4])
            {
            }
            column(d2_10__4_; d2[10] [4])
            {
            }
            column(d2_1__5_; d2[1] [5])
            {
            }
            column(d2_2__5_; d2[2] [5])
            {
            }
            column(d2_3__5_; d2[3] [5])
            {
            }
            column(d2_4__5_; d2[4] [5])
            {
            }
            column(d2_5__5_; d2[5] [5])
            {
            }
            column(d2_6__5_; d2[6] [5])
            {
            }
            column(d2_7__5_; d2[7] [5])
            {
            }
            column(d2_8__5_; d2[8] [5])
            {
            }
            column(d2_9__5_; d2[9] [5])
            {
            }
            column(d2_10__5_; d2[10] [5])
            {
            }
            column(d2_1__6_; d2[1] [6])
            {
            }
            column(d2_2__6_; d2[2] [6])
            {
            }
            column(d2_3__6_; d2[3] [6])
            {
            }
            column(d2_4__6_; d2[4] [6])
            {
            }
            column(d2_5__6_; d2[5] [6])
            {
            }
            column(d2_6__6_; d2[6] [6])
            {
            }
            column(d2_7__6_; d2[7] [6])
            {
            }
            column(d2_8__6_; d2[8] [6])
            {
            }
            column(d2_9__6_; d2[9] [6])
            {
            }
            column(d2_10__6_; d2[10] [6])
            {
            }
            column(d2_1__7_; d2[1] [7])
            {
            }
            column(d2_2__7_; d2[2] [7])
            {
            }
            column(d2_3__7_; d2[3] [7])
            {
            }
            column(d2_4__7_; d2[4] [7])
            {
            }
            column(d2_5__7_; d2[5] [7])
            {
            }
            column(d2_6__7_; d2[6] [7])
            {
            }
            column(d2_7__7_; d2[7] [7])
            {
            }
            column(d2_8__7_; d2[8] [7])
            {
            }
            column(d2_9__7_; d2[9] [7])
            {
            }
            column(d2_10__7_; d2[10] [7])
            {
            }
            column(yettovalue_Control1102154058; yettovalue)
            {
            }
            column(TENDER_DETAILSCaption; TENDER_DETAILSCaptionLbl)
            {
            }
            column(Customer_NameCaption; Customer_NameCaptionLbl)
            {
            }
            column(Tender_No_Caption; Tender_No_CaptionLbl)
            {
            }
            column(PrdouctCaption; PrdouctCaptionLbl)
            {
            }
            column(Tender_ValueCaption; Tender_ValueCaptionLbl)
            {
            }
            column(Tender_StatusCaption; Tender_StatusCaptionLbl)
            {
            }
            column(Expected_Order_MonthCaption; Expected_Order_MonthCaptionLbl)
            {
            }
            column(Tender_PositionCaption; Tender_PositionCaptionLbl)
            {
            }
            column(Emd_AmountCaption; Emd_AmountCaptionLbl)
            {
            }
            column(Tender_DatedCaption; Tender_DatedCaptionLbl)
            {
            }
            column(Tender_Header__Tender_No__Caption; FIELDCAPTION("Tender No."))
            {
            }
            column(Tender_Header__Customer_Name__Control1102154002Caption; FIELDCAPTION("Customer Name"))
            {
            }
            column(Bid_AmountCaption; Bid_AmountCaptionLbl)
            {
            }
            column(Tender_Header__Tender_Status__Control1102154006Caption; FIELDCAPTION("Tender Status"))
            {
            }
            column(Tender_Header__Tender_Position__Control1102154008Caption; FIELDCAPTION("Tender Position"))
            {
            }
            column(Tender_Header_StatusCaption; FIELDCAPTION(Status))
            {
            }
            column(ExpectedCaption; ExpectedCaptionLbl)
            {
            }
            column(Yet_To_participateCaption; Yet_To_participateCaptionLbl)
            {
            }
            column(CancelledCaption; CancelledCaptionLbl)
            {
            }
            column(ReceivedCaption; ReceivedCaptionLbl)
            {
            }
            column(SummaryCaption; SummaryCaptionLbl)
            {
            }
            column(UnsucessfulCaption; UnsucessfulCaptionLbl)
            {
            }
            column(Not_ParticipatedCaption; Not_ParticipatedCaptionLbl)
            {
            }
            column(ExpectedCaption_Control1102154218; ExpectedCaption_Control1102154218Lbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(TO_BE_PARTICIPATED_TENDERSCaption; TO_BE_PARTICIPATED_TENDERSCaptionLbl)
            {
            }
            column(TotalCaption_Control1102154062; TotalCaption_Control1102154062Lbl)
            {
            }
            dataitem("Tender Line"; "Tender Line")
            {
                DataItemLink = Document No.=FIELD(Tender No.);
                DataItemTableView = SORTING(Document No., Line No.) ORDER(Ascending);
                column(Tender_Line_Type; Type)
                {
                }
                column(Tender_Line_Description; Description)
                {
                }
                column(Tender_Line__Unit_Cost_; "Unit Cost")
                {
                }
                column(Tender_Line_Quantity; Quantity)
                {
                }
                column(Tender_Line__Total_Amount_; "Total Amount")
                {
                }
                column(Tender_Line__Tender_Line___Total_Amount_; "Tender Line"."Total Amount")
                {
                }
                column(dlc; dlc)
                {
                }
                column(fepc; fepc)
                {
                }
                column(Tender_Line_TypeCaption; FIELDCAPTION(Type))
                {
                }
                column(Item_DescriptionCaption; Item_DescriptionCaptionLbl)
                {
                }
                column(Tender_Line__Unit_Cost_Caption; FIELDCAPTION("Unit Cost"))
                {
                }
                column(Tender_Line_QuantityCaption; FIELDCAPTION(Quantity))
                {
                }
                column(Tender_Line__Total_Amount_Caption; FIELDCAPTION("Total Amount"))
                {
                }
                column(TotalCaption_Control1102154042; TotalCaption_Control1102154042Lbl)
                {
                }
                column(DLCaption; DLCaptionLbl)
                {
                }
                column(FEPCaption; FEPCaptionLbl)
                {
                }
                column(Tender_Line_Document_No_; "Document No.")
                {
                }
                column(Tender_Line_Line_No_; "Line No.")
                {
                }

                trigger OnPreDataItem();
                begin
                    CurrReport.CREATETOTALS("Tender Line"."Total Amount");
                    dlc := 0;
                    fepc := 0;
                end;
            }
            dataitem(Customer; Customer)
            {
                DataItemLink = No.=FIELD(Customer No.);
                DataItemTableView = SORTING(No.) ORDER(Ascending);
            }

            trigger OnPreDataItem();
            begin
                i := 1;
                j := 1;
                IF ("YEAR06-07" = TRUE) AND ("YEAR07-08" = FALSE) AND ("YEAR08-09" = FALSE) THEN
                    "Tender Header".SETFILTER("Tender Header"."Tender No.", 'TN-06-07*');
                IF ("YEAR07-08" = TRUE) AND ("YEAR06-07" = FALSE) AND ("YEAR08-09" = FALSE) THEN
                    "Tender Header".SETFILTER("Tender Header"."Tender No.", 'TN-07-08*');
                IF ("YEAR08-09" = TRUE) AND ("YEAR07-08" = FALSE) AND ("YEAR06-07" = FALSE) THEN
                    "Tender Header".SETFILTER("Tender Header"."Tender No.", 'TN-08-09*');
                IF ("YEAR08-09" = TRUE) AND ("YEAR07-08" = TRUE) THEN
                    "Tender Header".SETFILTER("Tender Header"."Tender No.", 'TN-07-08*|TN-08-09*');
                IF ("YEAR09-10" = TRUE) THEN
                    "Tender Header".SETFILTER("Tender Header"."Tender No.", 'TN-09-10*');
                IF ("YEAR10-11" = TRUE) THEN
                    "Tender Header".SETFILTER("Tender Header"."Tender No.", 'TN-10-11*');
                IF ("YEAR11-12" = TRUE) THEN
                    "Tender Header".SETFILTER("Tender Header"."Tender No.", 'TN-11-12*');
                IF ("YEAR12-13" = TRUE) THEN
                    "Tender Header".SETFILTER("Tender Header"."Tender No.", 'TN-12-13*');


                IF ("YEAR08-09" = TRUE) AND ("YEAR07-08" = TRUE) AND ("YEAR06-07" = TRUE) THEN
                    SETFILTER("Tender Header"."Tender No.", 'TN-06-07*|TN-07-08*|TN-08-09*');
                /*IF ("YEAR08-09"=TRUE) THEN
                 SETFILTER("Tender Header"."Tender No.",'TN-08-09*');*/

                CurrReport.CREATETOTALS("Tender Header"."Minimum Bid Amount");

            end;
        }
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = SORTING(Document Type, No.) ORDER(Ascending);
            column(Sales_Header__No__; "No.")
            {
            }
            column(Sales_Header_Amount; Amount)
            {
            }
            column(Sales_Header__Sell_to_Customer_Name_; "Sell-to Customer Name")
            {
            }
            column(totalamt; totalamt)
            {
            }
            column(expvalue_yettovalue_totalamt; expvalue + yettovalue + totalamt)
            {
            }
            column(CONTRACTORSCaption; CONTRACTORSCaptionLbl)
            {
            }
            column(TotalCaption_Control1102154070; TotalCaption_Control1102154070Lbl)
            {
            }
            column(Grand_TotalCaption; Grand_TotalCaptionLbl)
            {
            }
            column(Sales_Header_Document_Type; "Document Type")
            {
            }
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
        "YEAR06-07": Boolean;
        "YEAR07-08": Boolean;
        "YEAR08-09": Boolean;
        "SUM": Decimal;
        consolidated: Boolean;
        item: Record Item;
        desc: Text[30];
        dlc: Integer;
        fepc: Integer;
        d1: array[50, 7] of Text[60];
        i: Integer;
        j: Integer;
        d2: array[50, 7] of Text[60];
        expvalue: Decimal;
        yettovalue: Decimal;
        d3: Text[60];
        "sales line": Record "Sales Line";
        amount: Decimal;
        totalamt: Decimal;
        cancelvalue: Decimal;
        receivedamt: Decimal;
        Unsucess: Decimal;
        notparticipate: Decimal;
        "YEAR09-10": Boolean;
        "YEAR10-11": Boolean;
        "YEAR11-12": Boolean;
        "YEAR12-13": Boolean;
        TENDER_DETAILSCaptionLbl: Label 'TENDER DETAILS';
        Customer_NameCaptionLbl: Label 'Customer Name';
        Tender_No_CaptionLbl: Label 'Tender No.';
        PrdouctCaptionLbl: Label 'Prdouct';
        Tender_ValueCaptionLbl: Label 'Tender Value';
        Tender_StatusCaptionLbl: Label 'Tender Status';
        Expected_Order_MonthCaptionLbl: Label 'Expected Order Month';
        Tender_PositionCaptionLbl: Label 'Tender Position';
        Emd_AmountCaptionLbl: Label 'Emd Amount';
        Tender_DatedCaptionLbl: Label 'Tender Dated';
        Bid_AmountCaptionLbl: Label 'Bid Amount';
        ExpectedCaptionLbl: Label 'Expected';
        Yet_To_participateCaptionLbl: Label 'Yet To participate';
        CancelledCaptionLbl: Label 'Cancelled';
        ReceivedCaptionLbl: Label 'Received';
        SummaryCaptionLbl: Label 'Summary';
        UnsucessfulCaptionLbl: Label 'Unsucessful';
        Not_ParticipatedCaptionLbl: Label 'Not Participated';
        ExpectedCaption_Control1102154218Lbl: Label 'Expected';
        TotalCaptionLbl: Label 'Total';
        TO_BE_PARTICIPATED_TENDERSCaptionLbl: Label 'TO BE PARTICIPATED TENDERS';
        TotalCaption_Control1102154062Lbl: Label 'Total';
        Item_DescriptionCaptionLbl: Label 'Item Description';
        TotalCaption_Control1102154042Lbl: Label 'Total';
        DLCaptionLbl: Label 'DL';
        FEPCaptionLbl: Label 'FEP';
        CONTRACTORSCaptionLbl: Label 'CONTRACTORS';
        TotalCaption_Control1102154070Lbl: Label 'Total';
        Grand_TotalCaptionLbl: Label 'Grand Total';
}

