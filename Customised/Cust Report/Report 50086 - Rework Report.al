report 50086 "Rework Report"
{
    // version Nirmala

    DefaultLayout = RDLC;
    RDLCLayout = './Rework Report.rdlc';

    dataset
    {
        dataitem("Posted Inspect DatasheetHeader";"Posted Inspect DatasheetHeader")
        {
            DataItemTableView = SORTING(No.) ORDER(Ascending);
            RequestFilterFields = "No.";
            column(companyinfo_Name;companyinfo.Name)
            {
            }
            column(FORMAT_TODAY_0_4_;FORMAT(TODAY,0,4))
            {
            }
            column(companyinfo_Name_Control1000000001;companyinfo.Name)
            {
            }
            column(FORMAT_TODAY_0_4__Control1000000002;FORMAT(TODAY,0,4))
            {
            }
            column(Posted_Inspect_DatasheetHeader__Item_Description_;"Item Description")
            {
            }
            column(Posted_Inspect_DatasheetHeader__Operation_Description_;"Operation Description")
            {
            }
            column(Posted_Inspect_DatasheetHeader__Prod__Order_No__;"Prod. Order No.")
            {
            }
            column(Posted_Inspect_DatasheetHeader__Prod__Description_;"Prod. Description")
            {
            }
            column(Posted_Inspect_DatasheetHeader__Serial_No__;"Serial No.")
            {
            }
            column(Posted_Inspect_DatasheetHeader_Resource;Resource)
            {
            }
            column(Posted_Inspect_DatasheetHeader__Time_Taken_;"Time Taken")
            {
            }
            column(Rework_ReportCaption;Rework_ReportCaptionLbl)
            {
            }
            column(Posted_Inspect_DatasheetHeader__Item_Description_Caption;FIELDCAPTION("Item Description"))
            {
            }
            column(Posted_Inspect_DatasheetHeader__Operation_Description_Caption;FIELDCAPTION("Operation Description"))
            {
            }
            column(Posted_Inspect_DatasheetHeader__Prod__Order_No__Caption;FIELDCAPTION("Prod. Order No."))
            {
            }
            column(Posted_Inspect_DatasheetHeader__Prod__Description_Caption;FIELDCAPTION("Prod. Description"))
            {
            }
            column(Posted_Inspect_DatasheetHeader__Serial_No__Caption;FIELDCAPTION("Serial No."))
            {
            }
            column(Posted_Inspect_DatasheetHeader_ResourceCaption;FIELDCAPTION(Resource))
            {
            }
            column(Posted_Inspect_DatasheetHeader__Time_Taken_Caption;FIELDCAPTION("Time Taken"))
            {
            }
            column(Rework_ReportCaption_Control1000000000;Rework_ReportCaption_Control1000000000Lbl)
            {
            }
            column(Defect_TypeCaption;Defect_TypeCaptionLbl)
            {
            }
            column(No_of_times_occuredCaption;No_of_times_occuredCaptionLbl)
            {
            }
            column(Total_TimeCaption;Total_TimeCaptionLbl)
            {
            }
            column(Source_TypeCaption;Source_TypeCaptionLbl)
            {
            }
            column(IDs_No_Caption;IDs_No_CaptionLbl)
            {
            }
            column(Project_No_Caption;Project_No_CaptionLbl)
            {
            }
            column(Posted_Inspect_DatasheetHeader_No_;"No.")
            {
            }
            dataitem("Posted Inspect Datasheet Line";"Posted Inspect Datasheet Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = SORTING(Document No.,Line No.) ORDER(Ascending);
            }
            dataitem("Defect Tracking Details";"Defect Tracking Details")
            {
                DataItemLink = IDS No.=FIELD(No.);
                DataItemTableView = SORTING(Defect Code,IDS No.,IDS Line No.,Line No.) ORDER(Ascending);
                column(Defect_Tracking_Details_IDS_No_;"IDS No.")
                {
                }
                column(Defect_Tracking_Details_IDS_Line_No_;"IDS Line No.")
                {
                }
                column(Defect_Tracking_Details_Line_No_;"Line No.")
                {
                }
                column(Defect_Tracking_Details_Defect_Code;"Defect Code")
                {
                }
                dataitem("<Defect Tracking Details1>";"Defect Tracking Details")
                {
                    DataItemLink = IDS No.=FIELD(IDS No.),Defect Code=FIELD(Defect Code);
                    DataItemTableView = SORTING(Defect Code,IDS No.,IDS Line No.,Line No.) ORDER(Ascending);
                    column(Defect_Tracking_Details1____Defect_Tracking_Details1____Defect_Code_;"<Defect Tracking Details1>"."Defect Code")
                    {
                    }
                    column(nooftimes;nooftimes)
                    {
                    }
                    column(Defect_Tracking_Details1___IDS_No__;"IDS No.")
                    {
                    }
                    column(Posted_Inspect_DatasheetHeader___Source_Type_;"Posted Inspect DatasheetHeader"."Source Type")
                    {
                    }
                    column(Posted_Inspect_Datasheet_Line___Time_Taken_In_Hours__;"Posted Inspect Datasheet Line"."Time Taken(In Hours)")
                    {
                    }
                    column(prod;prod)
                    {
                    }
                    column(Defect_Tracking_Details1__IDS_Line_No_;"IDS Line No.")
                    {
                    }
                    column(Defect_Tracking_Details1__Line_No_;"Line No.")
                    {
                    }

                    trigger OnPreDataItem();
                    begin
                        /*FOR j:=0 TO i DO
                        BEGIN
                         IF "Defect Tracking Details"."Defect Code" = defectarray[j+1] THEN
                          flag:=true;
                        END;
                        
                         else
                        if flag= false then
                        begin
                         defectarray[j+1] := "Defect Tracking Details"."Defect Code";
                          i:=i+1;
                          "<Defect Tracking Details1>".SETFILTER("<Defect Tracking Details1>"."Defect Code",defectarray[j+1]);
                           nooftimes := "<Defect Tracking Details1>".COUNT;
                        
                        end;*/

                    end;
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
        companyinfo : Record "Company Information";
        nooftimes : Integer;
        defect : Text[300];
        defectarray : array [100] of Code[100];
        i : Integer;
        j : Integer;
        flag : Boolean;
        idsno : Text[50];
        choice : Option Normal,Detailed;
        prod : Text[50];
        Rework_ReportCaptionLbl : Label 'Rework Report';
        Rework_ReportCaption_Control1000000000Lbl : Label 'Rework Report';
        Defect_TypeCaptionLbl : Label 'Defect Type';
        No_of_times_occuredCaptionLbl : Label 'No of times occured';
        Total_TimeCaptionLbl : Label 'Total Time';
        Source_TypeCaptionLbl : Label 'Source Type';
        IDs_No_CaptionLbl : Label 'IDs No.';
        Project_No_CaptionLbl : Label 'Project No.';
}

