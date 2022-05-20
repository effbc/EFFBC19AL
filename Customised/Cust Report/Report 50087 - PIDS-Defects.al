report 50087 "PIDS-Defects"
{
    // version Nirmala1.1

    DefaultLayout = RDLC;
    RDLCLayout = './PIDS-Defects.rdlc';

    dataset
    {
        dataitem("Posted Inspect DatasheetHeader";"Posted Inspect DatasheetHeader")
        {
            RequestFilterFields = "Prod. Order No.","Reason for Pending","No.";
            column(Posted_Inspect_DatasheetHeader__Prod__Order_No__;"Prod. Order No.")
            {
            }
            column(Posted_Inspect_DatasheetHeader__Customer_Name_;"Customer Name")
            {
            }
            column(companyid_Name;companyid.Name)
            {
            }
            column(CurrReport_PAGENO;CurrReport.PAGENO)
            {
            }
            column(FORMAT_TODAY_0_4_;FORMAT(TODAY,0,4))
            {
            }
            column(prodfilter;prodfilter)
            {
            }
            column(Posted_Inspect_DatasheetHeader__Posted_Inspect_DatasheetHeader___Posted_By_;"Posted Inspect DatasheetHeader"."Posted By")
            {
            }
            column(Posted_Inspect_DatasheetHeader__Posted_Inspect_DatasheetHeader___Posted_By__Control1000000047;"Posted Inspect DatasheetHeader"."Posted By")
            {
            }
            column(totaldefqtyamt;totaldefqtyamt)
            {
            }
            column(over;over)
            {
            }
            column(defqtyamt;defqtyamt)
            {
            }
            column(Product_Name_TypeCaption;Product_Name_TypeCaptionLbl)
            {
            }
            column(Serial_No_Caption;Serial_No_CaptionLbl)
            {
            }
            column(Identified_ProblemCaption;Identified_ProblemCaptionLbl)
            {
            }
            column(Disposition_ActionsCaption;Disposition_ActionsCaptionLbl)
            {
            }
            column(Retesting_report_by_QC_incase_of_reworkCaption;Retesting_report_by_QC_incase_of_reworkCaptionLbl)
            {
            }
            column(CUSTOMER_NAME_Caption;CUSTOMER_NAME_CaptionLbl)
            {
            }
            column(PROJECT_CODE_Caption;PROJECT_CODE_CaptionLbl)
            {
            }
            column(EfftronicsCaption;EfftronicsCaptionLbl)
            {
            }
            column(Non_Conforming_Product_ControlCaption;Non_Conforming_Product_ControlCaptionLbl)
            {
            }
            column(QMS__Std__Ref__8_3_Caption;QMS__Std__Ref__8_3_CaptionLbl)
            {
            }
            column(EFF_QAS_F__011Caption;EFF_QAS_F__011CaptionLbl)
            {
            }
            column(REVISION__0Caption;REVISION__0CaptionLbl)
            {
            }
            column(PositionCaption;PositionCaptionLbl)
            {
            }
            column(Defect_QuantityCaption;Defect_QuantityCaptionLbl)
            {
            }
            column(Posted_Inspection_Data_sheet_DefectsCaption;Posted_Inspection_Data_sheet_DefectsCaptionLbl)
            {
            }
            column(Page_No_Caption;Page_No_CaptionLbl)
            {
            }
            column(Product_DescriptionCaption;Product_DescriptionCaptionLbl)
            {
            }
            column(Operation_DescriptionCaption;Operation_DescriptionCaptionLbl)
            {
            }
            column(NoCaption;NoCaptionLbl)
            {
            }
            column(Defect_CodeCaption;Defect_CodeCaptionLbl)
            {
            }
            column(PositionCaption_Control1000000011;PositionCaption_Control1000000011Lbl)
            {
            }
            column(Disposition_ActionsCaption_Control1000000020;Disposition_ActionsCaption_Control1000000020Lbl)
            {
            }
            column(DefectQtyCaption;DefectQtyCaptionLbl)
            {
            }
            column(Serial_No_Caption_Control1000000015;Serial_No_Caption_Control1000000015Lbl)
            {
            }
            column(PostedByCaption;PostedByCaptionLbl)
            {
            }
            column(Prepared_ByCaption;Prepared_ByCaptionLbl)
            {
            }
            column(Approved_ByCaption;Approved_ByCaptionLbl)
            {
            }
            column(QAS_ManagerCaption;QAS_ManagerCaptionLbl)
            {
            }
            column(DateCaption;DateCaptionLbl)
            {
            }
            column(PAGE_NO__1_of_1Caption;PAGE_NO__1_of_1CaptionLbl)
            {
            }
            column(Approval_of_MD_for_ConcessionCaption;Approval_of_MD_for_ConcessionCaptionLbl)
            {
            }
            column(Prepared_ByCaption_Control1000000070;Prepared_ByCaption_Control1000000070Lbl)
            {
            }
            column(Approved_ByCaption_Control1000000071;Approved_ByCaption_Control1000000071Lbl)
            {
            }
            column(QAS_ManagerCaption_Control1000000072;QAS_ManagerCaption_Control1000000072Lbl)
            {
            }
            column(DateCaption_Control1000000073;DateCaption_Control1000000073Lbl)
            {
            }
            column(PAGE_NO__1_of_1Caption_Control1000000074;PAGE_NO__1_of_1Caption_Control1000000074Lbl)
            {
            }
            column(Approval_of_MD_for_ConcessionCaption_Control1000000054;Approval_of_MD_for_ConcessionCaption_Control1000000054Lbl)
            {
            }
            column(Total_Pending_DefectsCaption;Total_Pending_DefectsCaptionLbl)
            {
            }
            column(SolvedCaption;SolvedCaptionLbl)
            {
            }
            column(Total_DefectsCaption;Total_DefectsCaptionLbl)
            {
            }
            column(Posted_Inspect_DatasheetHeader_No_;"No.")
            {
            }
            dataitem("Defect Tracking Details";"Defect Tracking Details")
            {
                DataItemLink = IDS No.=FIELD(No.);
                DataItemTableView = SORTING(IDS No.,IDS Line No.,Line No.);
                RequestFilterFields = "Defect Code";
                column(Posted_Inspect_DatasheetHeader___Prod__Description_;"Posted Inspect DatasheetHeader"."Prod. Description")
                {
                }
                column(Posted_Inspect_DatasheetHeader___Reason_for_Pending_;"Posted Inspect DatasheetHeader"."Reason for Pending")
                {
                }
                column(Defect_Tracking_Details__Defect_Tracking_Details__Position;"Defect Tracking Details".Position)
                {
                }
                column(Defect_Tracking_Details__Defect_Tracking_Details__Qty;"Defect Tracking Details".Qty)
                {
                }
                column(Defect_Tracking_Details__Defect_Tracking_Details___Disposition_Actions_;"Defect Tracking Details"."Disposition Actions")
                {
                }
                column(Defect_Tracking_Details_Description;Description)
                {
                }
                column(Defect_Tracking_Details__Defect_Tracking_Details___Defect_Code_;"Defect Tracking Details"."Defect Code")
                {
                }
                column(Defect_Tracking_Details__Defect_Tracking_Details__Position_Control1000000010;"Defect Tracking Details".Position)
                {
                }
                column(Defect_Tracking_Details__Defect_Tracking_Details___Disposition_Actions__Control1000000019;"Defect Tracking Details"."Disposition Actions")
                {
                }
                column(Defect_Tracking_Details__Defect_Tracking_Details__Qty_Control1000000028;"Defect Tracking Details".Qty)
                {
                }
                column(Posted_Inspect_DatasheetHeader___Reason_for_Pending__Control1000000014;"Posted Inspect DatasheetHeader"."Reason for Pending")
                {
                }
                column(Posted_Inspect_DatasheetHeader___Prod__Description__Control1000000012;"Posted Inspect DatasheetHeader"."Prod. Description")
                {
                }
                column(Posted_Inspect_DatasheetHeader___Operation_Description_;"Posted Inspect DatasheetHeader"."Operation Description")
                {
                }
                column(Posted_Inspect_DatasheetHeader___No__;"Posted Inspect DatasheetHeader"."No.")
                {
                }
                column(Posted_Inspect_DatasheetHeader___Posted_By_;"Posted Inspect DatasheetHeader"."Posted By")
                {
                }
                column(Defect_Tracking_Details_IDS_No_;"IDS No.")
                {
                }
                column(Defect_Tracking_Details_IDS_Line_No_;"IDS Line No.")
                {
                }
                column(Defect_Tracking_Details_Line_No_;"Line No.")
                {
                }
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
        DefectTrackingDetailsRec : Record "Defect Tracking Details";
        defectcode : Code[20];
        PostedInspectionDataLineRec : Record "Posted Inspect Datasheet Line";
        companyid : Record "Company Information";
        totaldefqtyamt : Decimal;
        qtyamt : Decimal;
        defqtyamt : Decimal;
        over : Decimal;
        ncf : Option General,NCFormat;
        ids : Text[30];
        prodfilter : Text[100];
        Product_Name_TypeCaptionLbl : Label 'Product Name/Type';
        Serial_No_CaptionLbl : Label 'Serial No.';
        Identified_ProblemCaptionLbl : Label 'Identified Problem';
        Disposition_ActionsCaptionLbl : Label 'Disposition Actions';
        Retesting_report_by_QC_incase_of_reworkCaptionLbl : Label 'Retesting report by QC incase of rework';
        CUSTOMER_NAME_CaptionLbl : Label 'CUSTOMER NAME:';
        PROJECT_CODE_CaptionLbl : Label 'PROJECT CODE:';
        EfftronicsCaptionLbl : Label 'Efftronics';
        Non_Conforming_Product_ControlCaptionLbl : Label 'Non-Conforming Product Control';
        QMS__Std__Ref__8_3_CaptionLbl : Label '"QMS. Std. Ref: 8.3 "';
        EFF_QAS_F__011CaptionLbl : Label 'EFF/QAS/F- 011';
        REVISION__0CaptionLbl : Label 'REVISION: 0';
        PositionCaptionLbl : Label 'Position';
        Defect_QuantityCaptionLbl : Label 'Defect Quantity';
        Posted_Inspection_Data_sheet_DefectsCaptionLbl : Label 'Posted Inspection Data sheet-Defects';
        Page_No_CaptionLbl : Label 'Page No.';
        Product_DescriptionCaptionLbl : Label 'Product Description';
        Operation_DescriptionCaptionLbl : Label 'Operation Description';
        NoCaptionLbl : Label 'No';
        Defect_CodeCaptionLbl : Label 'Defect Code';
        PositionCaption_Control1000000011Lbl : Label 'Position';
        Disposition_ActionsCaption_Control1000000020Lbl : Label 'Disposition Actions';
        DefectQtyCaptionLbl : Label 'DefectQty';
        Serial_No_Caption_Control1000000015Lbl : Label 'Serial No.';
        PostedByCaptionLbl : Label 'PostedBy';
        Prepared_ByCaptionLbl : Label 'Prepared By';
        Approved_ByCaptionLbl : Label 'Approved By';
        QAS_ManagerCaptionLbl : Label 'QAS Manager';
        DateCaptionLbl : Label 'Date';
        PAGE_NO__1_of_1CaptionLbl : Label 'PAGE NO: 1 of 1';
        Approval_of_MD_for_ConcessionCaptionLbl : Label 'Approval of MD for Concession';
        Prepared_ByCaption_Control1000000070Lbl : Label 'Prepared By';
        Approved_ByCaption_Control1000000071Lbl : Label 'Approved By';
        QAS_ManagerCaption_Control1000000072Lbl : Label 'QAS Manager';
        DateCaption_Control1000000073Lbl : Label 'Date';
        PAGE_NO__1_of_1Caption_Control1000000074Lbl : Label 'PAGE NO: 1 of 1';
        Approval_of_MD_for_ConcessionCaption_Control1000000054Lbl : Label 'Approval of MD for Concession';
        Total_Pending_DefectsCaptionLbl : Label 'Total Pending Defects';
        SolvedCaptionLbl : Label 'Solved';
        Total_DefectsCaptionLbl : Label 'Total Defects';
}

