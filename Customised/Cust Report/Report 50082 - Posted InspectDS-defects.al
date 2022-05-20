report 50082 "Posted InspectDS-defects"
{
    // version ESPL 1.0

    DefaultLayout = RDLC;
    RDLCLayout = './Posted InspectDS-defects.rdlc';

    dataset
    {
        dataitem("Posted Inspect DatasheetHeader";"Posted Inspect DatasheetHeader")
        {
            PrintOnlyIfDetail = true;
            RequestFilterFields = "Posting Date",Resource;
            column(COMPANYNAME;COMPANYNAME)
            {
            }
            column(FORMAT_TODAY_0_4_;FORMAT(TODAY,0,4))
            {
            }
            column(USERID;USERID)
            {
            }
            column(CurrReport_PAGENO;CurrReport.PAGENO)
            {
            }
            column(Posted_Inspect_DatasheetHeader__No__;"No.")
            {
            }
            column(Posted_Inspect_DatasheetHeader_Description;Description)
            {
            }
            column(Posted_Inspect_DatasheetHeader__Ids_Reference_No__;"Ids Reference No.")
            {
            }
            column(Posted_Inspect_DatasheetHeader__Item_No__;"Item No.")
            {
            }
            column(Posted_Inspect_DatasheetHeader__Document_Date_;"Document Date")
            {
            }
            column(Posted_Inspect_DatasheetHeader__Posting_Date_;"Posting Date")
            {
            }
            column(Posted_Inspect_DatasheetHeaderCaption;Posted_Inspect_DatasheetHeaderCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Posted_Inspect_DatasheetHeader__No__Caption;FIELDCAPTION("No."))
            {
            }
            column(Posted_Inspect_DatasheetHeader_DescriptionCaption;FIELDCAPTION(Description))
            {
            }
            column(Posted_Inspect_DatasheetHeader__Item_No__Caption;FIELDCAPTION("Item No."))
            {
            }
            column(Posted_Inspect_DatasheetHeader__Document_Date_Caption;FIELDCAPTION("Document Date"))
            {
            }
            column(Posted_Inspect_DatasheetHeader__Posting_Date_Caption;FIELDCAPTION("Posting Date"))
            {
            }
            column(Posted_Inspect_DatasheetHeader__Ids_Reference_No__Caption;FIELDCAPTION("Ids Reference No."))
            {
            }
            dataitem("Defect Tracking Details";"Defect Tracking Details")
            {
                DataItemLink = IDS No.=FIELD(Ids Reference No.);
                column(Defect_Tracking_Details__IDS_No__;"IDS No.")
                {
                }
                column(Defect_Tracking_Details__Defect_Code_;"Defect Code")
                {
                }
                column(Defect_Tracking_Details_Description;Description)
                {
                }
                column(Var1;Var1)
                {
                }
                column(Defect_Tracking_Details__IDS_No__Caption;FIELDCAPTION("IDS No."))
                {
                }
                column(Defect_Tracking_Details__Defect_Code_Caption;FIELDCAPTION("Defect Code"))
                {
                }
                column(Defect_Tracking_Details_DescriptionCaption;FIELDCAPTION(Description))
                {
                }
                column(PID_No_Caption;PID_No_CaptionLbl)
                {
                }
                column(Defect_Tracking_Details_IDS_Line_No_;"IDS Line No.")
                {
                }
                column(Defect_Tracking_Details_Line_No_;"Line No.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    PostedInspectDatasheetHeader.SETRANGE("Ids Reference No.","Defect Tracking Details"."IDS No.");
                     IF PostedInspectDatasheetHeader.FIND('-') THEN
                       Var1 := "Posted Inspect DatasheetHeader"."No.";
                end;
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
        PostedInspectDatasheetHeader : Record "Posted Inspect DatasheetHeader";
        Var1 : Code[20];
        Posted_Inspect_DatasheetHeaderCaptionLbl : Label 'Posted Inspect DatasheetHeader';
        CurrReport_PAGENOCaptionLbl : Label 'Page';
        PID_No_CaptionLbl : Label 'PID No.';
}

