report 50063 "Mean Time Between Failures"
{
    // version Nirmala

    DefaultLayout = RDLC;
    RDLCLayout = './Mean Time Between Failures.rdlc';

    dataset
    {
        dataitem("Service Header";"Service Header")
        {
            RequestFilterFields = "Bill-to Address 2";
            column(Companyinfo_Name;Companyinfo.Name)
            {
            }
            column(FORMAT_TODAY_0_4_;FORMAT(TODAY,0,4))
            {
            }
            column(mtbf;mtbf)
            {
            }
            column(Mean_Time_Between_FailuresCaption;Mean_Time_Between_FailuresCaptionLbl)
            {
            }
            column(SNOCaption;SNOCaptionLbl)
            {
            }
            column(Service_Item_DescriptionCaption;Service_Item_DescriptionCaptionLbl)
            {
            }
            column(Zone_DivisionCaption;Zone_DivisionCaptionLbl)
            {
            }
            column(FaultDescriptionCaption;FaultDescriptionCaptionLbl)
            {
            }
            column(Starting_DateCaption;Starting_DateCaptionLbl)
            {
            }
            column(Finishing_DateCaption;Finishing_DateCaptionLbl)
            {
            }
            column(NoCaption;NoCaptionLbl)
            {
            }
            column(Location_Of_Service_ItemCaption;Location_Of_Service_ItemCaptionLbl)
            {
            }
            column(Mean_Time_Between_FailuresCaption_Control1000000023;Mean_Time_Between_FailuresCaption_Control1000000023Lbl)
            {
            }
            column(Service_Header_Document_Type;"Document Type")
            {
            }
            column(Service_Header_No_;"No.")
            {
            }
            dataitem("Service Item Line";"Service Item Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = WHERE(Description=FILTER(DATA LOGGER|Data logger|DATALOGGER|Datalogger|Data Logger));
                RequestFilterFields = "Starting Date","Finishing Date","Location of Service Item";
                column(sno;sno)
                {
                }
                column(Service_Header___Bill_to_City_;"Service Header"."Bill-to City")
                {
                }
                column(text1;text1)
                {
                }
                column(Service_Item_Line__Service_Item_Line___Starting_Date_;"Service Item Line"."Starting Date")
                {
                }
                column(Service_Item_Line__Service_Item_Line___Finishing_Date_;"Service Item Line"."Finishing Date")
                {
                }
                column(Service_Item_Line__Service_Item_Line__Description;"Service Item Line".Description)
                {
                }
                column(Service_Header___Document_Type_;"Service Header"."Document Type")
                {
                }
                column(Service_Item_Line__Location_of_Service_Item_;"Location of Service Item")
                {
                }
                column(Service_Item_Line_Document_Type;"Document Type")
                {
                }
                column(Service_Item_Line_Document_No_;"Document No.")
                {
                }
                column(Service_Item_Line_Line_No_;"Line No.")
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
        Companyinfo : Record "Company Information";
        fdesc : Record "Fault Code";
        text1 : Text[200];
        sno : Integer;
        noofdays : Integer;
        mtbf : Decimal;
        Mean_Time_Between_FailuresCaptionLbl : Label 'Mean Time Between Failures';
        SNOCaptionLbl : Label 'SNO';
        Service_Item_DescriptionCaptionLbl : Label 'Service Item Description';
        Zone_DivisionCaptionLbl : Label 'Zone/Division';
        FaultDescriptionCaptionLbl : Label 'FaultDescription';
        Starting_DateCaptionLbl : Label 'Starting Date';
        Finishing_DateCaptionLbl : Label 'Finishing Date';
        NoCaptionLbl : Label 'No';
        Location_Of_Service_ItemCaptionLbl : Label 'Location Of Service Item';
        Mean_Time_Between_FailuresCaption_Control1000000023Lbl : Label 'Mean Time Between Failures';
}

