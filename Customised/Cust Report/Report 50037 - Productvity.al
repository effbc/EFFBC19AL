report 50037 Productvity
{
    // version ESPL 1.0,Rev01,EFFUPG

    DefaultLayout = RDLC;
    RDLCLayout = './Productvity.rdlc';

    dataset
    {
        dataitem("Capacity Ledger Entry"; "Capacity Ledger Entry")
        {
            DataItemTableView = SORTING(No., Work Center No., Order No.) ORDER(Ascending) WHERE(Order Type=CONST(Production));
            RequestFilterFields = "Posting Date", "Order No.", "No.", "Work Center No.";
            ReqFilterHeading = 'Project Productivity';
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(USERID; USERID)
            {
            }
            column(prodordernofilt; prodordernofilt)
            {
            }
            column(datefilt; datefilt)
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(prod; prod)
            {
            }
            column(totalactualtime; totalactualtime)
            {
            }
            column(totalplantime; totalplantime)
            {
            }
            column(Capacity_Ledger_Entry__Work_Center_No__; "Work Center No.")
            {
            }
            column(Capacity_Ledger_Entry_Description; Description)
            {
            }
            column(Capacity_Ledger_Entry__No__; "No.")
            {
            }
            column(sno; sno)
            {
            }
            column(Rework_Time_; "Rework Time")
            {
            }
            column(plantime; plantime)
            {
            }
            column(actualtime; actualtime)
            {
            }
            column(totprod; totprod)
            {
            }
            column(Total_Rework_; "Total Rework")
            {
            }
            column(ProductivityCaption; ProductivityCaptionLbl)
            {
            }
            column(Actual_TimeCaption; Actual_TimeCaptionLbl)
            {
            }
            column(Plan_TimeCaption; Plan_TimeCaptionLbl)
            {
            }
            column(DepartmentCaption; DepartmentCaptionLbl)
            {
            }
            column(Emp_NameCaption; Emp_NameCaptionLbl)
            {
            }
            column(ProductivityCaption_Control1000000038; ProductivityCaption_Control1000000038Lbl)
            {
            }
            column(Prod_Order_NoCaption; Prod_Order_NoCaptionLbl)
            {
            }
            column(DateCaption; DateCaptionLbl)
            {
            }
            column(Emp_IdCaption; Emp_IdCaptionLbl)
            {
            }
            column(SnoCaption; SnoCaptionLbl)
            {
            }
            column(Rework_TimeCaption; Rework_TimeCaptionLbl)
            {
            }
            column(Capacity_Ledger_Entry_Entry_No_; "Entry No.")
            {
            }
            column(Plan_Time_1; "Planed Run Time")
            {
            }
            column(Actual_Time_1; "Run Time")
            {
            }
            column(ReworkUserId; "Reworked User Id")
            {
            }
            column(OperationDescription; "Operation Description")
            {
            }
            column(ProductionOrder; "Order No.")
            {
            }

            trigger OnPreDataItem();
            begin
                // "Capacity Ledger Entry".SETFILTER("Capacity Ledger Entry"."No."  ,"Machine Center"."No.");
                IF Choice <> Choice::"Project Productivity" THEN
                    CurrReport.BREAK;
            end;
        }
        dataitem("<Capacity Ledger Entry1>"; "Capacity Ledger Entry")
        {
            DataItemTableView = SORTING(Type, No., Work Shift Code, Item No., Posting Date) ORDER(Ascending) WHERE(Reworked User Id=CONST(),Type=CONST(Machine Center));
            RequestFilterFields = "Posting Date", "No.", "Item No.", "Work Center No.";
            ReqFilterHeading = 'Person Capabiltiy';
            column(Capacity_Ledger_Entry1__Description; Description)
            {
            }
            column(Capacity_Ledger_Entry1___No__; "No.")
            {
            }
            column(Capacity_Ledger_Entry1___GETFILTER___Capacity_Ledger_Entry1____Posting_Date__; "<Capacity Ledger Entry1>".GETFILTER("<Capacity Ledger Entry1>"."Posting Date"))
            {
            }
            column(Capacity_Ledger_Entry1___GETFILTER___Capacity_Ledger_Entry1____Posting_Date___Control1102154057; "<Capacity Ledger Entry1>".GETFILTER("<Capacity Ledger Entry1>"."Posting Date"))
            {
            }
            column(Capacity_Ledger_Entry1___Item_No__; "Item No.")
            {
            }
            column(Compound_Desc_; "Compound Desc")
            {
            }
            column(No__Of_Cards_; "No. Of Cards")
            {
            }
            column(Capacity_Ledger_Entry1___Order_No__; "Order No.")
            {
            }
            column(Capacity_Ledger_Entry1___Actual_Run_Time_; "Actual Run Time")
            {
            }
            column(Capacity_Ledger_Entry1____Output_Quantity___Planed_Run_Time__; ("<Capacity Ledger Entry1>"."Output Quantity" * "Planed Run Time"))
            {
            }
            column(Deatail_Productivity; Deatail_Productivity)
            {
            }
            column(Capacity_Ledger_Entry1___Output_Quantity_; "Output Quantity")
            {
            }
            column(Rework_Time__Control1102154036; "Rework Time")
            {
            }
            column(Rework_Time___Actual_Run_Time__; ("Rework Time" + "Actual Run Time"))
            {
            }
            column(Total_Planned_Time____Total_Rework_Time___Total_Actual_Time____100; ("Total Planned Time" / ("Total Rework Time" + "Total Actual Time")) * 100)
            {
            }
            column(Total_Actual_Time__60; "Total Actual Time" / 60)
            {
            }
            column(Total_Planned_Time__60; "Total Planned Time" / 60)
            {
            }
            column(Total_Rework_Time__60; "Total Rework Time" / 60)
            {
            }
            column(Total_Rework_Time__60_Control1102154042; "Total Rework Time" / 60)
            {
            }
            column(Total_Planned_Time__60_Control1102154013; "Total Planned Time" / 60)
            {
            }
            column(Total_Actual_Time__60_Control1102154018; "Total Actual Time" / 60)
            {
            }
            column(Brief_Productivity; Brief_Productivity)
            {
            }
            column(Capacity_Ledger_Entry1___Output_Quantity__Control1102154033; "Output Quantity")
            {
            }
            column(Total_Rework_Time__60_Control1102154048; "Total Rework Time" / 60)
            {
            }
            column(Compound_Desc__Control1102154051; "Compound Desc")
            {
            }
            column(Total_Rework_Time___Actual_Run_Time___60; ("Total Rework Time" + "Actual Run Time") / 60)
            {
            }
            column(Overall_Productivity; Overall_Productivity)
            {
            }
            column(Overall_Spent_Time___Overall_Rework_TIme___60; ("Overall Spent Time" + "Overall Rework TIme") / 60)
            {
            }
            column(Overall_Rework_TIme__60; "Overall Rework TIme" / 60)
            {
            }
            column(Overall_Spent_Time__60; "Overall Spent Time" / 60)
            {
            }
            column(Overall_Plan_Time__60; "Overall Plan Time" / 60)
            {
            }
            column(Card_Wise_Person_CapabiltyCaption; Card_Wise_Person_CapabiltyCaptionLbl)
            {
            }
            column(PersonCaption; PersonCaptionLbl)
            {
            }
            column(NameCaption; NameCaptionLbl)
            {
            }
            column(QuantityCaption; QuantityCaptionLbl)
            {
            }
            column(ItemCaption; ItemCaptionLbl)
            {
            }
            column(Rework_Time__Hours_Caption; Rework_Time__Hours_CaptionLbl)
            {
            }
            column(ProductivityCaption_Control1102154062; ProductivityCaption_Control1102154062Lbl)
            {
            }
            column(Total_Time__Hours_Caption; Total_Time__Hours_CaptionLbl)
            {
            }
            column(Spent_Time__Hours_Caption; Spent_Time__Hours_CaptionLbl)
            {
            }
            column(Planned_Time__Hours_Caption; Planned_Time__Hours_CaptionLbl)
            {
            }
            column(Card_Wise_Person_CapabiltyCaption_Control1102154003; Card_Wise_Person_CapabiltyCaption_Control1102154003Lbl)
            {
            }
            column(ProjectCaption; ProjectCaptionLbl)
            {
            }
            column(Planned_TimeCaption; Planned_TimeCaptionLbl)
            {
            }
            column(Spent_TimeCaption; Spent_TimeCaptionLbl)
            {
            }
            column(ProductivityCaption_Control1102154030; ProductivityCaption_Control1102154030Lbl)
            {
            }
            column(QuantityCaption_Control1102154010; QuantityCaption_Control1102154010Lbl)
            {
            }
            column(Rework_TimeCaption_Control1102154009; Rework_TimeCaption_Control1102154009Lbl)
            {
            }
            column(Total_Time_Caption; Total_Time_CaptionLbl)
            {
            }
            column(EmptyStringCaption; EmptyStringCaptionLbl)
            {
            }
            column(Total_Time___Hrs_Caption; Total_Time___Hrs_CaptionLbl)
            {
            }
            column(EmptyStringCaption_Control1102154047; EmptyStringCaption_Control1102154047Lbl)
            {
            }
            column(EmptyStringCaption_Control1102154053; EmptyStringCaption_Control1102154053Lbl)
            {
            }
            column(Total_Time___Hrs_Caption_Control1102154060; Total_Time___Hrs_Caption_Control1102154060Lbl)
            {
            }
            column(Capacity_Ledger_Entry1__Entry_No_; "Entry No.")
            {
            }

            trigger OnPreDataItem();
            begin
                IF Choice <> Choice::"Person Capability" THEN
                    CurrReport.BREAK;

                Card_Filters := "<Capacity Ledger Entry1>".GETFILTERS;
                IF "<Capacity Ledger Entry1>".GETFILTER("<Capacity Ledger Entry1>"."Posting Date") <> '' THEN BEGIN
                    Max_Date := "<Capacity Ledger Entry1>".GETRANGEMAX("<Capacity Ledger Entry1>"."Posting Date");
                    Min_Date := "<Capacity Ledger Entry1>".GETRANGEMIN("<Capacity Ledger Entry1>"."Posting Date");
                END;
            end;
        }
        dataitem("<Capacity Ledger Entry2>"; "Capacity Ledger Entry")
        {
            CalcFields = Work Center Unit Cost;
            DataItemTableView = SORTING(Document No., Posting Date);
            RequestFilterFields = "Posting Date";
            ReqFilterHeading = 'Department Productivity';
            column(ROUND_PlannedTime_1__1__60_0_01_; ROUND(PlannedTime[1] [1] / 60, 0.01))
            {
            }
            column(ROUND_PlannedValue_1__1__0_01_; ROUND(PlannedValue[1] [1], 0.01))
            {
            }
            column(ROUND_ActualTime1_1__1__60_0_01_; ROUND(ActualTime1[1] [1] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_1__1__0_01_; ROUND(ActualValue[1] [1], 0.01))
            {
            }
            column(PlannedTime_1__2__60; PlannedTime[1] [2] / 60)
            {
            }
            column(ROUND_PlannedValue_1__2__0_01_; ROUND(PlannedValue[1] [2], 0.01))
            {
            }
            column(ROUND_ActualTime1_1__2__60_0_01_; ROUND(ActualTime1[1] [2] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_1__2__0_01_; ROUND(ActualValue[1] [2], 0.01))
            {
            }
            column(PlannedTime_1__4__60; PlannedTime[1] [4] / 60)
            {
            }
            column(ROUND_PlannedValue_1__4__0_01_; ROUND(PlannedValue[1] [4], 0.01))
            {
            }
            column(ROUND_ActualTime1_1__4__60_0_01_; ROUND(ActualTime1[1] [4] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_1__4__0_01_; ROUND(ActualValue[1] [4], 0.01))
            {
            }
            column(PlannedTime_1__3__60; PlannedTime[1] [3] / 60)
            {
            }
            column(ROUND_PlannedValue_1__3__0_01_; ROUND(PlannedValue[1] [3], 0.01))
            {
            }
            column(ROUND_ActualTime1_1__3__60_0_01_; ROUND(ActualTime1[1] [3] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_1__3__0_01_; ROUND(ActualValue[1] [3], 0.01))
            {
            }
            column(PlannedTime_1__6__60; PlannedTime[1] [6] / 60)
            {
            }
            column(ROUND_PlannedValue_1__6__0_01_; ROUND(PlannedValue[1] [6], 0.01))
            {
            }
            column(ROUND_ActualTime1_1__6__60_0_01_; ROUND(ActualTime1[1] [6] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_1__6__0_01_; ROUND(ActualValue[1] [6], 0.01))
            {
            }
            column(PlannedTime_1__5__60; PlannedTime[1] [5] / 60)
            {
            }
            column(ROUND_PlannedValue_1__5__0_01_; ROUND(PlannedValue[1] [5], 0.01))
            {
            }
            column(ROUND_ActualTime1_1__5__60_0_01_; ROUND(ActualTime1[1] [5] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_1__5__0_01_; ROUND(ActualValue[1] [5], 0.01))
            {
            }
            column(PlannedTime_1__8__60; PlannedTime[1] [8] / 60)
            {
            }
            column(ROUND_PlannedValue_1__8__0_01_; ROUND(PlannedValue[1] [8], 0.01))
            {
            }
            column(ROUND_ActualTime1_1__8__60_0_01_; ROUND(ActualTime1[1] [8] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_1__8__0_01_; ROUND(ActualValue[1] [8], 0.01))
            {
            }
            column(PlannedTime_1__7__60; PlannedTime[1] [7] / 60)
            {
            }
            column(ROUND_PlannedValue_1__7__0_01_; ROUND(PlannedValue[1] [7], 0.01))
            {
            }
            column(ROUND_ActualTime1_1__7__60_0_01_; ROUND(ActualTime1[1] [7] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_1__7__0_01_; ROUND(ActualValue[1] [7], 0.01))
            {
            }
            column(PlannedTime_1__10__60; PlannedTime[1] [10] / 60)
            {
            }
            column(ROUND_PlannedValue_1__10__0_01_; ROUND(PlannedValue[1] [10], 0.01))
            {
            }
            column(ROUND_ActualTime1_1__10__60_0_01_; ROUND(ActualTime1[1] [10] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_1__10__0_01_; ROUND(ActualValue[1] [10], 0.01))
            {
            }
            column(PlannedTime_1__9__60; PlannedTime[1] [9] / 60)
            {
            }
            column(ROUND_PlannedValue_1__9__0_01_; ROUND(PlannedValue[1] [9], 0.01))
            {
            }
            column(ROUND_ActualTime1_1__9__60_0_01_; ROUND(ActualTime1[1] [9] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_1__9__0_01_; ROUND(ActualValue[1] [9], 0.01))
            {
            }
            column(PlannedTime_1__2__60_Control1102154860; PlannedTime[1] [2] / 60)
            {
            }
            column(ROUND_PlannedValue_1__12__0_01_; ROUND(PlannedValue[1] [12], 0.01))
            {
            }
            column(ROUND_ActualTime1_1__2__60_0_01__Control1102154862; ROUND(ActualTime1[1] [2] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_1__12__0_01_; ROUND(ActualValue[1] [12], 0.01))
            {
            }
            column(PlannedTime_1__11__60; PlannedTime[1] [11] / 60)
            {
            }
            column(ROUND_PlannedValue_1__11__0_01_; ROUND(PlannedValue[1] [11], 0.01))
            {
            }
            column(ROUND_ActualTime1_1__11__60_0_01_; ROUND(ActualTime1[1] [11] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_1__11__0_01_; ROUND(ActualValue[1] [11], 0.01))
            {
            }
            column(ROUND_PlannedTime_2__1__60_0_01_; ROUND(PlannedTime[2] [1] / 60, 0.01))
            {
            }
            column(ROUND_PlannedValue_2__1__0_01_; ROUND(PlannedValue[2] [1], 0.01))
            {
            }
            column(ROUND_ActualTime1_2__1__60_0_01_; ROUND(ActualTime1[2] [1] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_2__1__0_01_; ROUND(ActualValue[2] [1], 0.01))
            {
            }
            column(PlannedTime_2__2__60; PlannedTime[2] [2] / 60)
            {
            }
            column(ROUND_PlannedValue_2__2__0_01_; ROUND(PlannedValue[2] [2], 0.01))
            {
            }
            column(ROUND_ActualTime1_2__2__60_0_01_; ROUND(ActualTime1[2] [2] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_2__2__0_01_; ROUND(ActualValue[2] [2], 0.01))
            {
            }
            column(PlannedTime_2__3__60; PlannedTime[2] [3] / 60)
            {
            }
            column(ROUND_PlannedValue_2__3__0_01_; ROUND(PlannedValue[2] [3], 0.01))
            {
            }
            column(ROUND_ActualTime1_2__3__60_0_01_; ROUND(ActualTime1[2] [3] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_2__3__0_01_; ROUND(ActualValue[2] [3], 0.01))
            {
            }
            column(PlannedTime_2__4__60; PlannedTime[2] [4] / 60)
            {
            }
            column(ROUND_PlannedValue_2__4__0_01_; ROUND(PlannedValue[2] [4], 0.01))
            {
            }
            column(ROUND_ActualTime1_2__4__60_0_01_; ROUND(ActualTime1[2] [4] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_2__4__0_01_; ROUND(ActualValue[2] [4], 0.01))
            {
            }
            column(PlannedTime_2__5__60; PlannedTime[2] [5] / 60)
            {
            }
            column(ROUND_PlannedValue_2__5__0_01_; ROUND(PlannedValue[2] [5], 0.01))
            {
            }
            column(ROUND_ActualTime1_2__5__60_0_01_; ROUND(ActualTime1[2] [5] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_2__5__0_01_; ROUND(ActualValue[2] [5], 0.01))
            {
            }
            column(PlannedTime_2__6__60; PlannedTime[2] [6] / 60)
            {
            }
            column(ROUND_PlannedValue_2__6__0_01_; ROUND(PlannedValue[2] [6], 0.01))
            {
            }
            column(ROUND_ActualTime1_2__6__60_0_01_; ROUND(ActualTime1[2] [6] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_2__6__0_01_; ROUND(ActualValue[2] [6], 0.01))
            {
            }
            column(PlannedTime_2__7__60; PlannedTime[2] [7] / 60)
            {
            }
            column(ROUND_PlannedValue_2__7__0_01_; ROUND(PlannedValue[2] [7], 0.01))
            {
            }
            column(ROUND_ActualTime1_2__7__60_0_01_; ROUND(ActualTime1[2] [7] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_2__7__0_01_; ROUND(ActualValue[2] [7], 0.01))
            {
            }
            column(PlannedTime_2__8__60; PlannedTime[2] [8] / 60)
            {
            }
            column(ROUND_PlannedValue_2__8__0_01_; ROUND(PlannedValue[2] [8], 0.01))
            {
            }
            column(ROUND_ActualTime1_2__8__60_0_01_; ROUND(ActualTime1[2] [8] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_2__8__0_01_; ROUND(ActualValue[2] [8], 0.01))
            {
            }
            column(PlannedTime_2__9__60; PlannedTime[2] [9] / 60)
            {
            }
            column(ROUND_PlannedValue_2__9__0_01_; ROUND(PlannedValue[2] [9], 0.01))
            {
            }
            column(ROUND_ActualTime1_2__9__60_0_01_; ROUND(ActualTime1[2] [9] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_2__9__0_01_; ROUND(ActualValue[2] [9], 0.01))
            {
            }
            column(PlannedTime_2__10__60; PlannedTime[2] [10] / 60)
            {
            }
            column(ROUND_PlannedValue_2__10__0_01_; ROUND(PlannedValue[2] [10], 0.01))
            {
            }
            column(ROUND_ActualTime1_2__10__60_0_01_; ROUND(ActualTime1[2] [10] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_2__10__0_01_; ROUND(ActualValue[2] [10], 0.01))
            {
            }
            column(PlannedTime_2__11__60; PlannedTime[2] [11] / 60)
            {
            }
            column(ROUND_PlannedValue_2__11__0_01_; ROUND(PlannedValue[2] [11], 0.01))
            {
            }
            column(ROUND_ActualTime1_2__11__60_0_01_; ROUND(ActualTime1[2] [11] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_2__11__0_01_; ROUND(ActualValue[2] [11], 0.01))
            {
            }
            column(PlannedTime_2__2__60_Control1102155131; PlannedTime[2] [2] / 60)
            {
            }
            column(ROUND_PlannedValue_2__12__0_01_; ROUND(PlannedValue[2] [12], 0.01))
            {
            }
            column(ROUND_ActualTime1_2__12__60_0_01_; ROUND(ActualTime1[2] [12] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_2__12__0_01_; ROUND(ActualValue[2] [12], 0.01))
            {
            }
            column(PlannedTime_3__12__60; PlannedTime[3] [12] / 60)
            {
            }
            column(ROUND_PlannedValue_3__12__0_01_; ROUND(PlannedValue[3] [12], 0.01))
            {
            }
            column(ROUND_ActualTime1_3__12__60_0_01_; ROUND(ActualTime1[3] [12] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_3__12__0_01_; ROUND(ActualValue[3] [12], 0.01))
            {
            }
            column(PlannedTime_3__11__60; PlannedTime[3] [11] / 60)
            {
            }
            column(ROUND_PlannedValue_3__11__0_01_; ROUND(PlannedValue[3] [11], 0.01))
            {
            }
            column(ROUND_ActualTime1_3__11__60_0_01_; ROUND(ActualTime1[3] [11] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_3__11__0_01_; ROUND(ActualValue[3] [11], 0.01))
            {
            }
            column(PlannedTime_3__10__60; PlannedTime[3] [10] / 60)
            {
            }
            column(ROUND_PlannedValue_3__10__0_01_; ROUND(PlannedValue[3] [10], 0.01))
            {
            }
            column(ROUND_ActualTime1_3__10__60_0_01_; ROUND(ActualTime1[3] [10] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_3__10__0_01_; ROUND(ActualValue[3] [10], 0.01))
            {
            }
            column(PlannedTime_3__9__60; PlannedTime[3] [9] / 60)
            {
            }
            column(ROUND_PlannedValue_3__9__0_01_; ROUND(PlannedValue[3] [9], 0.01))
            {
            }
            column(ROUND_ActualTime1_3__9__60_0_01_; ROUND(ActualTime1[3] [9] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_3__9__0_01_; ROUND(ActualValue[3] [9], 0.01))
            {
            }
            column(PlannedTime_3__8__60; PlannedTime[3] [8] / 60)
            {
            }
            column(ROUND_PlannedValue_3__8__0_01_; ROUND(PlannedValue[3] [8], 0.01))
            {
            }
            column(ROUND_ActualTime1_3__8__60_0_01_; ROUND(ActualTime1[3] [8] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_3__8__0_01_; ROUND(ActualValue[3] [8], 0.01))
            {
            }
            column(PlannedTime_3__7__60; PlannedTime[3] [7] / 60)
            {
            }
            column(ROUND_PlannedValue_3__7__0_01_; ROUND(PlannedValue[3] [7], 0.01))
            {
            }
            column(ROUND_ActualTime1_3__7__60_0_01_; ROUND(ActualTime1[3] [7] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_3__7__0_01_; ROUND(ActualValue[3] [7], 0.01))
            {
            }
            column(PlannedTime_3__6__60; PlannedTime[3] [6] / 60)
            {
            }
            column(ROUND_PlannedValue_3__6__0_01_; ROUND(PlannedValue[3] [6], 0.01))
            {
            }
            column(ROUND_ActualTime1_3__6__60_0_01_; ROUND(ActualTime1[3] [6] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_3__6__0_01_; ROUND(ActualValue[3] [6], 0.01))
            {
            }
            column(PlannedTime_3__5__60; PlannedTime[3] [5] / 60)
            {
            }
            column(ROUND_PlannedValue_3__5__0_01_; ROUND(PlannedValue[3] [5], 0.01))
            {
            }
            column(ROUND_ActualTime1_3__5__60_0_01_; ROUND(ActualTime1[3] [5] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_3__5__0_01_; ROUND(ActualValue[3] [5], 0.01))
            {
            }
            column(PlannedTime_3__4__60; PlannedTime[3] [4] / 60)
            {
            }
            column(ROUND_PlannedValue_3__4__0_01_; ROUND(PlannedValue[3] [4], 0.01))
            {
            }
            column(ROUND_ActualTime1_3__4__60_0_01_; ROUND(ActualTime1[3] [4] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_3__4__0_01_; ROUND(ActualValue[3] [4], 0.01))
            {
            }
            column(PlannedTime_3__3__60; PlannedTime[3] [3] / 60)
            {
            }
            column(ROUND_PlannedValue_3__3__0_01_; ROUND(PlannedValue[3] [3], 0.01))
            {
            }
            column(ROUND_ActualTime1_3__3__60_0_01_; ROUND(ActualTime1[3] [3] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_3__3__0_01_; ROUND(ActualValue[3] [3], 0.01))
            {
            }
            column(PlannedTime_3__2__60; PlannedTime[3] [2] / 60)
            {
            }
            column(ROUND_PlannedValue_3__2__0_01_; ROUND(PlannedValue[3] [2], 0.01))
            {
            }
            column(ROUND_ActualTime1_3__2__60_0_01_; ROUND(ActualTime1[3] [2] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_3__2__0_01_; ROUND(ActualValue[3] [2], 0.01))
            {
            }
            column(ROUND_PlannedTime_3__1__60_0_01_; ROUND(PlannedTime[3] [1] / 60, 0.01))
            {
            }
            column(ROUND_PlannedValue_3__1__0_01_; ROUND(PlannedValue[3] [1], 0.01))
            {
            }
            column(ROUND_ActualTime1_3__1__60_0_01_; ROUND(ActualTime1[3] [1] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_3__1__0_01_; ROUND(ActualValue[3] [1], 0.01))
            {
            }
            column(ROUND_ActualValue_4__1__0_01_; ROUND(ActualValue[4] [1], 0.01))
            {
            }
            column(PlannedTime_4__12__60; PlannedTime[4] [12] / 60)
            {
            }
            column(ROUND_PlannedValue_4__12__0_01_; ROUND(PlannedValue[4] [12], 0.01))
            {
            }
            column(ROUND_ActualTime1_4__12__60_0_01_; ROUND(ActualTime1[4] [12] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_4__12__0_01_; ROUND(ActualValue[4] [12], 0.01))
            {
            }
            column(PlannedTime_4__11__60; PlannedTime[4] [11] / 60)
            {
            }
            column(ROUND_PlannedValue_4__11__0_01_; ROUND(PlannedValue[4] [11], 0.01))
            {
            }
            column(ROUND_ActualTime1_4__11__60_0_01_; ROUND(ActualTime1[4] [11] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_4__11__0_01_; ROUND(ActualValue[4] [11], 0.01))
            {
            }
            column(PlannedTime_4__10__60; PlannedTime[4] [10] / 60)
            {
            }
            column(ROUND_PlannedValue_4__10__0_01_; ROUND(PlannedValue[4] [10], 0.01))
            {
            }
            column(ROUND_ActualTime1_4__10__60_0_01_; ROUND(ActualTime1[4] [10] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_4__10__0_01_; ROUND(ActualValue[4] [10], 0.01))
            {
            }
            column(PlannedTime_4__9__60; PlannedTime[4] [9] / 60)
            {
            }
            column(ROUND_PlannedValue_4__9__0_01_; ROUND(PlannedValue[4] [9], 0.01))
            {
            }
            column(ROUND_ActualTime1_4__9__60_0_01_; ROUND(ActualTime1[4] [9] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_4__9__0_01_; ROUND(ActualValue[4] [9], 0.01))
            {
            }
            column(PlannedTime_4__8__60; PlannedTime[4] [8] / 60)
            {
            }
            column(ROUND_PlannedValue_4__8__0_01_; ROUND(PlannedValue[4] [8], 0.01))
            {
            }
            column(ROUND_ActualTime1_4__8__60_0_01_; ROUND(ActualTime1[4] [8] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_4__8__0_01_; ROUND(ActualValue[4] [8], 0.01))
            {
            }
            column(PlannedTime_4__7__60; PlannedTime[4] [7] / 60)
            {
            }
            column(ROUND_PlannedValue_4__7__0_01_; ROUND(PlannedValue[4] [7], 0.01))
            {
            }
            column(ROUND_ActualTime1_4__7__60_0_01_; ROUND(ActualTime1[4] [7] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_4__7__0_01_; ROUND(ActualValue[4] [7], 0.01))
            {
            }
            column(PlannedTime_4__6__60; PlannedTime[4] [6] / 60)
            {
            }
            column(ROUND_PlannedValue_4__6__0_01_; ROUND(PlannedValue[4] [6], 0.01))
            {
            }
            column(ROUND_ActualTime1_4__6__60_0_01_; ROUND(ActualTime1[4] [6] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_4__6__0_01_; ROUND(ActualValue[4] [6], 0.01))
            {
            }
            column(PlannedTime_4__5__60; PlannedTime[4] [5] / 60)
            {
            }
            column(ROUND_PlannedValue_4__5__0_01_; ROUND(PlannedValue[4] [5], 0.01))
            {
            }
            column(ROUND_ActualTime1_4__5__60_0_01_; ROUND(ActualTime1[4] [5] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_4__5__0_01_; ROUND(ActualValue[4] [5], 0.01))
            {
            }
            column(PlannedTime_4__4__60; PlannedTime[4] [4] / 60)
            {
            }
            column(ROUND_PlannedValue_4__4__0_01_; ROUND(PlannedValue[4] [4], 0.01))
            {
            }
            column(ROUND_ActualTime1_4__4__60_0_01_; ROUND(ActualTime1[4] [4] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_4__4__0_01_; ROUND(ActualValue[4] [4], 0.01))
            {
            }
            column(PlannedTime_4__3__60; PlannedTime[4] [3] / 60)
            {
            }
            column(ROUND_PlannedValue_4__3__0_01_; ROUND(PlannedValue[4] [3], 0.01))
            {
            }
            column(ROUND_ActualTime1_4__3__60_0_01_; ROUND(ActualTime1[4] [3] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_4__3__0_01_; ROUND(ActualValue[4] [3], 0.01))
            {
            }
            column(PlannedTime_4__2__60; PlannedTime[4] [2] / 60)
            {
            }
            column(ROUND_PlannedValue_4__2__0_01_; ROUND(PlannedValue[4] [2], 0.01))
            {
            }
            column(ROUND_ActualTime1_4__2__60_0_01_; ROUND(ActualTime1[4] [2] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_4__2__0_01_; ROUND(ActualValue[4] [2], 0.01))
            {
            }
            column(ROUND_PlannedTime_4__1__60_0_01_; ROUND(PlannedTime[4] [1] / 60, 0.01))
            {
            }
            column(ROUND_PlannedValue_4__1__0_01_; ROUND(PlannedValue[4] [1], 0.01))
            {
            }
            column(ROUND_ActualTime1_4__1__60_0_01_; ROUND(ActualTime1[4] [1] / 60, 0.01))
            {
            }
            column(PlannedTime_5__12__60; PlannedTime[5] [12] / 60)
            {
            }
            column(ROUND_PlannedValue_5__12__0_01_; ROUND(PlannedValue[5] [12], 0.01))
            {
            }
            column(ROUND_ActualTime1_5__12__60_0_01_; ROUND(ActualTime1[5] [12] / 60, 0.01))
            {
            }
            column(PlannedTime_5__11__60; PlannedTime[5] [11] / 60)
            {
            }
            column(ROUND_PlannedValue_5__11__0_01_; ROUND(PlannedValue[5] [11], 0.01))
            {
            }
            column(ROUND_ActualTime1_5__11__60_0_01_; ROUND(ActualTime1[5] [11] / 60, 0.01))
            {
            }
            column(PlannedTime_5__10__60; PlannedTime[5] [10] / 60)
            {
            }
            column(ROUND_PlannedValue_5__10__0_01_; ROUND(PlannedValue[5] [10], 0.01))
            {
            }
            column(ROUND_ActualTime1_5__10__60_0_01_; ROUND(ActualTime1[5] [10] / 60, 0.01))
            {
            }
            column(PlannedTime_5__9__60; PlannedTime[5] [9] / 60)
            {
            }
            column(ROUND_PlannedValue_5__9__0_01_; ROUND(PlannedValue[5] [9], 0.01))
            {
            }
            column(ROUND_ActualTime1_5__9__60_0_01_; ROUND(ActualTime1[5] [9] / 60, 0.01))
            {
            }
            column(PlannedTime_5__8__60; PlannedTime[5] [8] / 60)
            {
            }
            column(ROUND_PlannedValue_5__8__0_01_; ROUND(PlannedValue[5] [8], 0.01))
            {
            }
            column(ROUND_ActualTime1_5__8__60_0_01_; ROUND(ActualTime1[5] [8] / 60, 0.01))
            {
            }
            column(PlannedTime_5__7__60; PlannedTime[5] [7] / 60)
            {
            }
            column(ROUND_PlannedValue_5__7__0_01_; ROUND(PlannedValue[5] [7], 0.01))
            {
            }
            column(ROUND_ActualTime1_5__7__60_0_01_; ROUND(ActualTime1[5] [7] / 60, 0.01))
            {
            }
            column(PlannedTime_5__6__60; PlannedTime[5] [6] / 60)
            {
            }
            column(ROUND_PlannedValue_5__6__0_01_; ROUND(PlannedValue[5] [6], 0.01))
            {
            }
            column(ROUND_ActualTime1_5__6__60_0_01_; ROUND(ActualTime1[5] [6] / 60, 0.01))
            {
            }
            column(PlannedTime_5__5__60; PlannedTime[5] [5] / 60)
            {
            }
            column(ROUND_PlannedValue_5__5__0_01_; ROUND(PlannedValue[5] [5], 0.01))
            {
            }
            column(ROUND_ActualTime1_5__5__60_0_01_; ROUND(ActualTime1[5] [5] / 60, 0.01))
            {
            }
            column(PlannedTime_5__4__60; PlannedTime[5] [4] / 60)
            {
            }
            column(ROUND_PlannedValue_5__4__0_01_; ROUND(PlannedValue[5] [4], 0.01))
            {
            }
            column(ROUND_ActualTime1_5__4__60_0_01_; ROUND(ActualTime1[5] [4] / 60, 0.01))
            {
            }
            column(PlannedTime_5__3__60; PlannedTime[5] [3] / 60)
            {
            }
            column(ROUND_PlannedValue_5__3__0_01_; ROUND(PlannedValue[5] [3], 0.01))
            {
            }
            column(ROUND_ActualTime1_5__3__60_0_01_; ROUND(ActualTime1[5] [3] / 60, 0.01))
            {
            }
            column(PlannedTime_5__2__60; PlannedTime[5] [2] / 60)
            {
            }
            column(ROUND_PlannedValue_5__2__0_01_; ROUND(PlannedValue[5] [2], 0.01))
            {
            }
            column(ROUND_ActualTime1_5__2__60_0_01_; ROUND(ActualTime1[5] [2] / 60, 0.01))
            {
            }
            column(ROUND_PlannedTime_5__1__60_0_01_; ROUND(PlannedTime[5] [1] / 60, 0.01))
            {
            }
            column(ROUND_PlannedValue_5__1__0_01_; ROUND(PlannedValue[5] [1], 0.01))
            {
            }
            column(ROUND_ActualTime1_5__1__60_0_01_; ROUND(ActualTime1[5] [1] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_5__1__0_01_; ROUND(ActualValue[5] [1], 0.01))
            {
            }
            column(ROUND_ActualValue_5__12__0_01_; ROUND(ActualValue[5] [12], 0.01))
            {
            }
            column(ROUND_ActualValue_5__11__0_01_; ROUND(ActualValue[5] [11], 0.01))
            {
            }
            column(ROUND_ActualValue_5__10__0_01_; ROUND(ActualValue[5] [10], 0.01))
            {
            }
            column(ROUND_ActualValue_5__9__0_01_; ROUND(ActualValue[5] [9], 0.01))
            {
            }
            column(ROUND_ActualValue_5__8__0_01_; ROUND(ActualValue[5] [8], 0.01))
            {
            }
            column(ROUND_ActualValue_5__7__0_01_; ROUND(ActualValue[5] [7], 0.01))
            {
            }
            column(ROUND_ActualValue_5__6__0_01_; ROUND(ActualValue[5] [6], 0.01))
            {
            }
            column(ROUND_ActualValue_5__5__0_01_; ROUND(ActualValue[5] [5], 0.01))
            {
            }
            column(ROUND_ActualValue_5__4__0_01_; ROUND(ActualValue[5] [4], 0.01))
            {
            }
            column(ROUND_ActualValue_5__3__0_01_; ROUND(ActualValue[5] [3], 0.01))
            {
            }
            column(ROUND_ActualValue_5__2__0_01_; ROUND(ActualValue[5] [2], 0.01))
            {
            }
            column(ROUND_ActualValue_6__1__0_01_; ROUND(ActualValue[6] [1], 0.01))
            {
            }
            column(PlannedTime_6__12__60; PlannedTime[6] [12] / 60)
            {
            }
            column(ROUND_PlannedValue_6__12__0_01_; ROUND(PlannedValue[6] [12], 0.01))
            {
            }
            column(ROUND_ActualTime1_6__12__60_0_01_; ROUND(ActualTime1[6] [12] / 60, 0.01))
            {
            }
            column(PlannedTime_6__11__60; PlannedTime[6] [11] / 60)
            {
            }
            column(ROUND_PlannedValue_6__11__0_01_; ROUND(PlannedValue[6] [11], 0.01))
            {
            }
            column(ROUND_ActualTime1_6__11__60_0_01_; ROUND(ActualTime1[6] [11] / 60, 0.01))
            {
            }
            column(PlannedTime_6__10__60; PlannedTime[6] [10] / 60)
            {
            }
            column(ROUND_PlannedValue_6__10__0_01_; ROUND(PlannedValue[6] [10], 0.01))
            {
            }
            column(ROUND_ActualTime1_6__10__60_0_01_; ROUND(ActualTime1[6] [10] / 60, 0.01))
            {
            }
            column(PlannedTime_6__9__60; PlannedTime[6] [9] / 60)
            {
            }
            column(ROUND_PlannedValue_6__9__0_01_; ROUND(PlannedValue[6] [9], 0.01))
            {
            }
            column(ROUND_ActualTime1_6__9__60_0_01_; ROUND(ActualTime1[6] [9] / 60, 0.01))
            {
            }
            column(PlannedTime_6__8__60; PlannedTime[6] [8] / 60)
            {
            }
            column(ROUND_PlannedValue_6__8__0_01_; ROUND(PlannedValue[6] [8], 0.01))
            {
            }
            column(ROUND_ActualTime1_6__8__60_0_01_; ROUND(ActualTime1[6] [8] / 60, 0.01))
            {
            }
            column(PlannedTime_6__7__60; PlannedTime[6] [7] / 60)
            {
            }
            column(ROUND_PlannedValue_6__7__0_01_; ROUND(PlannedValue[6] [7], 0.01))
            {
            }
            column(ROUND_ActualTime1_6__7__60_0_01_; ROUND(ActualTime1[6] [7] / 60, 0.01))
            {
            }
            column(PlannedTime_6__6__60; PlannedTime[6] [6] / 60)
            {
            }
            column(ROUND_PlannedValue_6__6__0_01_; ROUND(PlannedValue[6] [6], 0.01))
            {
            }
            column(ROUND_ActualTime1_6__6__60_0_01_; ROUND(ActualTime1[6] [6] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_6__12__0_01_; ROUND(ActualValue[6] [12], 0.01))
            {
            }
            column(ROUND_ActualValue_6__11__0_01_; ROUND(ActualValue[6] [11], 0.01))
            {
            }
            column(ROUND_ActualValue_6__10__0_01_; ROUND(ActualValue[6] [10], 0.01))
            {
            }
            column(ROUND_ActualValue_6__9__0_01_; ROUND(ActualValue[6] [9], 0.01))
            {
            }
            column(ROUND_ActualValue_6__8__0_01_; ROUND(ActualValue[6] [8], 0.01))
            {
            }
            column(ROUND_ActualValue_6__7__0_01_; ROUND(ActualValue[6] [7], 0.01))
            {
            }
            column(ROUND_ActualValue_6__6__0_01_; ROUND(ActualValue[6] [6], 0.01))
            {
            }
            column(PlannedTime_6__5__60; PlannedTime[6] [5] / 60)
            {
            }
            column(ROUND_PlannedValue_6__5__0_01_; ROUND(PlannedValue[6] [5], 0.01))
            {
            }
            column(ROUND_ActualTime1_6__5__60_0_01_; ROUND(ActualTime1[6] [5] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_6__5__0_01_; ROUND(ActualValue[6] [5], 0.01))
            {
            }
            column(PlannedTime_6__4__60; PlannedTime[6] [4] / 60)
            {
            }
            column(ROUND_PlannedValue_6__4__0_01_; ROUND(PlannedValue[6] [4], 0.01))
            {
            }
            column(ROUND_ActualTime1_6__4__60_0_01_; ROUND(ActualTime1[6] [4] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_6__4__0_01_; ROUND(ActualValue[6] [4], 0.01))
            {
            }
            column(PlannedTime_6__3__60; PlannedTime[6] [3] / 60)
            {
            }
            column(ROUND_PlannedValue_6__3__0_01_; ROUND(PlannedValue[6] [3], 0.01))
            {
            }
            column(ROUND_ActualTime1_6__3__60_0_01_; ROUND(ActualTime1[6] [3] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_6__3__0_01_; ROUND(ActualValue[6] [3], 0.01))
            {
            }
            column(PlannedTime_6__2__60; PlannedTime[6] [2] / 60)
            {
            }
            column(ROUND_PlannedValue_6__2__0_01_; ROUND(PlannedValue[6] [2], 0.01))
            {
            }
            column(ROUND_ActualTime1_6__2__60_0_01_; ROUND(ActualTime1[6] [2] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_6__2__0_01_; ROUND(ActualValue[6] [2], 0.01))
            {
            }
            column(ROUND_PlannedTime_6__1__60_0_01_; ROUND(PlannedTime[6] [1] / 60, 0.01))
            {
            }
            column(ROUND_PlannedValue_6__1__0_01_; ROUND(PlannedValue[6] [1], 0.01))
            {
            }
            column(ROUND_ActualTime1_6__1__60_0_01_; ROUND(ActualTime1[6] [1] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_7__1__0_01_; ROUND(ActualValue[7] [1], 0.01))
            {
            }
            column(PlannedTime_7__12__60; PlannedTime[7] [12] / 60)
            {
            }
            column(ROUND_PlannedValue_7__12__0_01_; ROUND(PlannedValue[7] [12], 0.01))
            {
            }
            column(ROUND_ActualTime1_7__12__60_0_01_; ROUND(ActualTime1[7] [12] / 60, 0.01))
            {
            }
            column(PlannedTime_7__11__60; PlannedTime[7] [11] / 60)
            {
            }
            column(ROUND_PlannedValue_7__11__0_01_; ROUND(PlannedValue[7] [11], 0.01))
            {
            }
            column(ROUND_ActualTime1_7__11__60_0_01_; ROUND(ActualTime1[7] [11] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_7__12__0_01_; ROUND(ActualValue[7] [12], 0.01))
            {
            }
            column(ROUND_ActualValue_7__11__0_01_; ROUND(ActualValue[7] [11], 0.01))
            {
            }
            column(PlannedTime_7__10__60; PlannedTime[7] [10] / 60)
            {
            }
            column(ROUND_PlannedValue_7__10__0_01_; ROUND(PlannedValue[7] [10], 0.01))
            {
            }
            column(ROUND_ActualTime1_7__10__60_0_01_; ROUND(ActualTime1[7] [10] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_7__10__0_01_; ROUND(ActualValue[7] [10], 0.01))
            {
            }
            column(PlannedTime_7__9__60; PlannedTime[7] [9] / 60)
            {
            }
            column(ROUND_PlannedValue_7__9__0_01_; ROUND(PlannedValue[7] [9], 0.01))
            {
            }
            column(ROUND_ActualTime1_7__9__60_0_01_; ROUND(ActualTime1[7] [9] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_7__9__0_01_; ROUND(ActualValue[7] [9], 0.01))
            {
            }
            column(PlannedTime_7__8__60; PlannedTime[7] [8] / 60)
            {
            }
            column(ROUND_PlannedValue_7__8__0_01_; ROUND(PlannedValue[7] [8], 0.01))
            {
            }
            column(ROUND_ActualTime1_7__8__60_0_01_; ROUND(ActualTime1[7] [8] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_7__8__0_01_; ROUND(ActualValue[7] [8], 0.01))
            {
            }
            column(PlannedTime_7__7__60; PlannedTime[7] [7] / 60)
            {
            }
            column(ROUND_PlannedValue_7__7__0_01_; ROUND(PlannedValue[7] [7], 0.01))
            {
            }
            column(ROUND_ActualTime1_7__7__60_0_01_; ROUND(ActualTime1[7] [7] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_7__7__0_01_; ROUND(ActualValue[7] [7], 0.01))
            {
            }
            column(PlannedTime_7__6__60; PlannedTime[7] [6] / 60)
            {
            }
            column(ROUND_PlannedValue_7__6__0_01_; ROUND(PlannedValue[7] [6], 0.01))
            {
            }
            column(ROUND_ActualTime1_7__6__60_0_01_; ROUND(ActualTime1[7] [6] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_7__6__0_01_; ROUND(ActualValue[7] [6], 0.01))
            {
            }
            column(PlannedTime_7__5__60; PlannedTime[7] [5] / 60)
            {
            }
            column(ROUND_PlannedValue_7__5__0_01_; ROUND(PlannedValue[7] [5], 0.01))
            {
            }
            column(ROUND_ActualTime1_7__5__60_0_01_; ROUND(ActualTime1[7] [5] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_7__5__0_01_; ROUND(ActualValue[7] [5], 0.01))
            {
            }
            column(PlannedTime_7__4__60; PlannedTime[7] [4] / 60)
            {
            }
            column(ROUND_PlannedValue_7__4__0_01_; ROUND(PlannedValue[7] [4], 0.01))
            {
            }
            column(ROUND_ActualTime1_7__4__60_0_01_; ROUND(ActualTime1[7] [4] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_7__4__0_01_; ROUND(ActualValue[7] [4], 0.01))
            {
            }
            column(PlannedTime_7__3__60; PlannedTime[7] [3] / 60)
            {
            }
            column(ROUND_PlannedValue_7__3__0_01_; ROUND(PlannedValue[7] [3], 0.01))
            {
            }
            column(ROUND_ActualTime1_7__3__60_0_01_; ROUND(ActualTime1[7] [3] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_7__3__0_01_; ROUND(ActualValue[7] [3], 0.01))
            {
            }
            column(PlannedTime_7__2__60; PlannedTime[7] [2] / 60)
            {
            }
            column(ROUND_PlannedValue_7__2__0_01_; ROUND(PlannedValue[7] [2], 0.01))
            {
            }
            column(ROUND_ActualTime1_7__2__60_0_01_; ROUND(ActualTime1[7] [2] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_7__2__0_01_; ROUND(ActualValue[7] [2], 0.01))
            {
            }
            column(ROUND_PlannedTime_7__1__60_0_01_; ROUND(PlannedTime[7] [1] / 60, 0.01))
            {
            }
            column(ROUND_PlannedValue_7__1__0_01_; ROUND(PlannedValue[7] [1], 0.01))
            {
            }
            column(ROUND_ActualTime1_7__1__60_0_01_; ROUND(ActualTime1[7] [1] / 60, 0.01))
            {
            }
            column(PlannedTime_8__12__60; PlannedTime[8] [12] / 60)
            {
            }
            column(ROUND_PlannedValue_8__12__0_01_; ROUND(PlannedValue[8] [12], 0.01))
            {
            }
            column(ROUND_ActualTime1_8__12__60_0_01_; ROUND(ActualTime1[8] [12] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_8__12__0_01_; ROUND(ActualValue[8] [12], 0.01))
            {
            }
            column(PlannedTime_8__11__60; PlannedTime[8] [11] / 60)
            {
            }
            column(ROUND_PlannedValue_8__11__0_01_; ROUND(PlannedValue[8] [11], 0.01))
            {
            }
            column(ROUND_ActualTime1_8__11__60_0_01_; ROUND(ActualTime1[8] [11] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_8__11__0_01_; ROUND(ActualValue[8] [11], 0.01))
            {
            }
            column(PlannedTime_8__10__60; PlannedTime[8] [10] / 60)
            {
            }
            column(ROUND_PlannedValue_8__10__0_01_; ROUND(PlannedValue[8] [10], 0.01))
            {
            }
            column(ROUND_ActualTime1_8__10__60_0_01_; ROUND(ActualTime1[8] [10] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_8__10__0_01_; ROUND(ActualValue[8] [10], 0.01))
            {
            }
            column(PlannedTime_8__9__60; PlannedTime[8] [9] / 60)
            {
            }
            column(ROUND_PlannedValue_8__9__0_01_; ROUND(PlannedValue[8] [9], 0.01))
            {
            }
            column(ROUND_ActualTime1_8__9__60_0_01_; ROUND(ActualTime1[8] [9] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_8__9__0_01_; ROUND(ActualValue[8] [9], 0.01))
            {
            }
            column(PlannedTime_8__8__60; PlannedTime[8] [8] / 60)
            {
            }
            column(ROUND_PlannedValue_8__8__0_01_; ROUND(PlannedValue[8] [8], 0.01))
            {
            }
            column(ROUND_ActualTime1_8__8__60_0_01_; ROUND(ActualTime1[8] [8] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_8__8__0_01_; ROUND(ActualValue[8] [8], 0.01))
            {
            }
            column(PlannedTime_8__7__60; PlannedTime[8] [7] / 60)
            {
            }
            column(ROUND_PlannedValue_8__7__0_01_; ROUND(PlannedValue[8] [7], 0.01))
            {
            }
            column(ROUND_ActualTime1_8__7__60_0_01_; ROUND(ActualTime1[8] [7] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_8__7__0_01_; ROUND(ActualValue[8] [7], 0.01))
            {
            }
            column(PlannedTime_8__6__60; PlannedTime[8] [6] / 60)
            {
            }
            column(ROUND_PlannedValue_8__6__0_01_; ROUND(PlannedValue[8] [6], 0.01))
            {
            }
            column(ROUND_ActualTime1_8__6__60_0_01_; ROUND(ActualTime1[8] [6] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_8__6__0_01_; ROUND(ActualValue[8] [6], 0.01))
            {
            }
            column(PlannedTime_8__5__60; PlannedTime[8] [5] / 60)
            {
            }
            column(ROUND_PlannedValue_8__5__0_01_; ROUND(PlannedValue[8] [5], 0.01))
            {
            }
            column(ROUND_ActualTime1_8__5__60_0_01_; ROUND(ActualTime1[8] [5] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_8__5__0_01_; ROUND(ActualValue[8] [5], 0.01))
            {
            }
            column(PlannedTime_8__4__60; PlannedTime[8] [4] / 60)
            {
            }
            column(ROUND_PlannedValue_8__4__0_01_; ROUND(PlannedValue[8] [4], 0.01))
            {
            }
            column(ROUND_ActualTime1_8__4__60_0_01_; ROUND(ActualTime1[8] [4] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_8__4__0_01_; ROUND(ActualValue[8] [4], 0.01))
            {
            }
            column(PlannedTime_8__3__60; PlannedTime[8] [3] / 60)
            {
            }
            column(ROUND_PlannedValue_8__3__0_01_; ROUND(PlannedValue[8] [3], 0.01))
            {
            }
            column(ROUND_ActualTime1_8__3__60_0_01_; ROUND(ActualTime1[8] [3] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_8__3__0_01_; ROUND(ActualValue[8] [3], 0.01))
            {
            }
            column(PlannedTime_8__2__60; PlannedTime[8] [2] / 60)
            {
            }
            column(ROUND_PlannedValue_8__2__0_01_; ROUND(PlannedValue[8] [2], 0.01))
            {
            }
            column(ROUND_ActualTime1_8__2__60_0_01_; ROUND(ActualTime1[8] [2] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_8__2__0_01_; ROUND(ActualValue[8] [2], 0.01))
            {
            }
            column(ROUND_ActualValue_8__1__0_01_; ROUND(ActualValue[8] [1], 0.01))
            {
            }
            column(ROUND_PlannedTime_8__1__60_0_01_; ROUND(PlannedTime[8] [1] / 60, 0.01))
            {
            }
            column(ROUND_PlannedValue_8__1__0_01_; ROUND(PlannedValue[8] [1], 0.01))
            {
            }
            column(ROUND_ActualTime1_8__1__60_0_01_; ROUND(ActualTime1[8] [1] / 60, 0.01))
            {
            }
            column(PlannedTime_9__12__60; PlannedTime[9] [12] / 60)
            {
            }
            column(ROUND_PlannedValue_9__12__0_01_; ROUND(PlannedValue[9] [12], 0.01))
            {
            }
            column(ROUND_ActualTime1_9__12__60_0_01_; ROUND(ActualTime1[9] [12] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_9__12__0_01_; ROUND(ActualValue[9] [12], 0.01))
            {
            }
            column(PlannedTime_9__11__60; PlannedTime[9] [11] / 60)
            {
            }
            column(ROUND_PlannedValue_9__11__0_01_; ROUND(PlannedValue[9] [11], 0.01))
            {
            }
            column(ROUND_ActualTime1_9__11__60_0_01_; ROUND(ActualTime1[9] [11] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_9__11__0_01_; ROUND(ActualValue[9] [11], 0.01))
            {
            }
            column(PlannedTime_9__10__60; PlannedTime[9] [10] / 60)
            {
            }
            column(ROUND_PlannedValue_9__10__0_01_; ROUND(PlannedValue[9] [10], 0.01))
            {
            }
            column(ROUND_ActualTime1_9__10__60_0_01_; ROUND(ActualTime1[9] [10] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_9__10__0_01_; ROUND(ActualValue[9] [10], 0.01))
            {
            }
            column(PlannedTime_9__9__60; PlannedTime[9] [9] / 60)
            {
            }
            column(ROUND_PlannedValue_9__9__0_01_; ROUND(PlannedValue[9] [9], 0.01))
            {
            }
            column(ROUND_ActualTime1_9__9__60_0_01_; ROUND(ActualTime1[9] [9] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_9__9__0_01_; ROUND(ActualValue[9] [9], 0.01))
            {
            }
            column(PlannedTime_9__8__60; PlannedTime[9] [8] / 60)
            {
            }
            column(ROUND_PlannedValue_9__8__0_01_; ROUND(PlannedValue[9] [8], 0.01))
            {
            }
            column(ROUND_ActualTime1_9__8__60_0_01_; ROUND(ActualTime1[9] [8] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_9__8__0_01_; ROUND(ActualValue[9] [8], 0.01))
            {
            }
            column(PlannedTime_9__7__60; PlannedTime[9] [7] / 60)
            {
            }
            column(ROUND_PlannedValue_9__7__0_01_; ROUND(PlannedValue[9] [7], 0.01))
            {
            }
            column(ROUND_ActualTime1_9__7__60_0_01_; ROUND(ActualTime1[9] [7] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_9__7__0_01_; ROUND(ActualValue[9] [7], 0.01))
            {
            }
            column(PlannedTime_9__6__60; PlannedTime[9] [6] / 60)
            {
            }
            column(ROUND_PlannedValue_9__6__0_01_; ROUND(PlannedValue[9] [6], 0.01))
            {
            }
            column(ROUND_ActualTime1_9__6__60_0_01_; ROUND(ActualTime1[9] [6] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_9__6__0_01_; ROUND(ActualValue[9] [6], 0.01))
            {
            }
            column(PlannedTime_9__5__60; PlannedTime[9] [5] / 60)
            {
            }
            column(ROUND_PlannedValue_9__5__0_01_; ROUND(PlannedValue[9] [5], 0.01))
            {
            }
            column(ROUND_ActualTime1_9__5__60_0_01_; ROUND(ActualTime1[9] [5] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_9__5__0_01_; ROUND(ActualValue[9] [5], 0.01))
            {
            }
            column(PlannedTime_9__4__60; PlannedTime[9] [4] / 60)
            {
            }
            column(ROUND_PlannedValue_9__4__0_01_; ROUND(PlannedValue[9] [4], 0.01))
            {
            }
            column(ROUND_ActualTime1_9__4__60_0_01_; ROUND(ActualTime1[9] [4] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_9__4__0_01_; ROUND(ActualValue[9] [4], 0.01))
            {
            }
            column(PlannedTime_9__3__60; PlannedTime[9] [3] / 60)
            {
            }
            column(ROUND_PlannedValue_9__3__0_01_; ROUND(PlannedValue[9] [3], 0.01))
            {
            }
            column(ROUND_ActualTime1_9__3__60_0_01_; ROUND(ActualTime1[9] [3] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_9__3__0_01_; ROUND(ActualValue[9] [3], 0.01))
            {
            }
            column(PlannedTime_9__2__60; PlannedTime[9] [2] / 60)
            {
            }
            column(ROUND_PlannedValue_9__2__0_01_; ROUND(PlannedValue[9] [2], 0.01))
            {
            }
            column(ROUND_ActualTime1_9__2__60_0_01_; ROUND(ActualTime1[9] [2] / 60, 0.01))
            {
            }
            column(ROUND_ActualValue_9__2__0_01_; ROUND(ActualValue[9] [2], 0.01))
            {
            }
            column(ROUND_ActualValue_9__1__0_01_; ROUND(ActualValue[9] [1], 0.01))
            {
            }
            column(ROUND_PlannedTime_9__1__60_0_01_; ROUND(PlannedTime[9] [1] / 60, 0.01))
            {
            }
            column(ROUND_PlannedValue_9__1__0_01_; ROUND(PlannedValue[9] [1], 0.01))
            {
            }
            column(ROUND_ActualTime1_9__1__60_0_01_; ROUND(ActualTime1[9] [1] / 60, 0.01))
            {
            }
            column(ROUND_Monthly_Actual_Cost_1__0_01_; ROUND(Monthly_Actual_Cost[1], 0.01))
            {
            }
            column(Monthly_Actual_Time_10__60; Monthly_Actual_Time[10] / 60)
            {
            }
            column(ROUND_Montthly_Plan_Cost_1__0_01_; ROUND(Montthly_Plan_Cost[1], 0.01))
            {
            }
            column(Monthly_Plan_Time_1__60; Monthly_Plan_Time[1] / 60)
            {
            }
            column(Monthly_Actual_Time_11__60; Monthly_Actual_Time[11] / 60)
            {
            }
            column(ROUND_Montthly_Plan_Cost_2__0_01_; ROUND(Montthly_Plan_Cost[2], 0.01))
            {
            }
            column(Monthly_Plan_Time_2__60; Monthly_Plan_Time[2] / 60)
            {
            }
            column(ROUND_Monthly_Actual_Cost_2__0_01_; ROUND(Monthly_Actual_Cost[2], 0.01))
            {
            }
            column(Monthly_Actual_Time_12__60; Monthly_Actual_Time[12] / 60)
            {
            }
            column(ROUND_Montthly_Plan_Cost_3__0_01_; ROUND(Montthly_Plan_Cost[3], 0.01))
            {
            }
            column(Monthly_Plan_Time_3__60; Monthly_Plan_Time[3] / 60)
            {
            }
            column(ROUND_Monthly_Actual_Cost_3__0_01_; ROUND(Monthly_Actual_Cost[3], 0.01))
            {
            }
            column(ROUND_Montthly_Plan_Cost_6__0_01_; ROUND(Montthly_Plan_Cost[6], 0.01))
            {
            }
            column(Monthly_Plan_Time_6__60; Monthly_Plan_Time[6] / 60)
            {
            }
            column(Monthly_Actual_Time_3__60; Monthly_Actual_Time[3] / 60)
            {
            }
            column(Monthly_Actual_Time_2__60; Monthly_Actual_Time[2] / 60)
            {
            }
            column(ROUND_Montthly_Plan_Cost_5__0_01_; ROUND(Montthly_Plan_Cost[5], 0.01))
            {
            }
            column(Monthly_Plan_Time_5__60; Monthly_Plan_Time[5] / 60)
            {
            }
            column(ROUND_Monthly_Actual_Cost_5__0_01_; ROUND(Monthly_Actual_Cost[5], 0.01))
            {
            }
            column(ROUND_Monthly_Actual_Cost_6__0_01_; ROUND(Monthly_Actual_Cost[6], 0.01))
            {
            }
            column(ROUND_Monthly_Actual_Cost_4__0_01_; ROUND(Monthly_Actual_Cost[4], 0.01))
            {
            }
            column(Monthly_Actual_Time_1__60; Monthly_Actual_Time[1] / 60)
            {
            }
            column(ROUND_Montthly_Plan_Cost_4__0_01_; ROUND(Montthly_Plan_Cost[4], 0.01))
            {
            }
            column(Monthly_Plan_Time_4__60; Monthly_Plan_Time[4] / 60)
            {
            }
            column(Monthly_Plan_Time_11__60; Monthly_Plan_Time[11] / 60)
            {
            }
            column(ROUND_Montthly_Plan_Cost_11__0_01_; ROUND(Montthly_Plan_Cost[11], 0.01))
            {
            }
            column(Monthly_Actual_Time_8__60; Monthly_Actual_Time[8] / 60)
            {
            }
            column(Monthly_Actual_Time_7__60; Monthly_Actual_Time[7] / 60)
            {
            }
            column(ROUND_Montthly_Plan_Cost_10__0_01_; ROUND(Montthly_Plan_Cost[10], 0.01))
            {
            }
            column(Monthly_Plan_Time_10__60; Monthly_Plan_Time[10] / 60)
            {
            }
            column(Monthly_Actual_Time_6__60; Monthly_Actual_Time[6] / 60)
            {
            }
            column(ROUND_Montthly_Plan_Cost_9__0_01_; ROUND(Montthly_Plan_Cost[9], 0.01))
            {
            }
            column(Monthly_Plan_Time_9__60; Monthly_Plan_Time[9] / 60)
            {
            }
            column(ROUND_Monthly_Actual_Cost_10__0_01_; ROUND(Monthly_Actual_Cost[10], 0.01))
            {
            }
            column(ROUND_Monthly_Actual_Cost_11__0_01_; ROUND(Monthly_Actual_Cost[11], 0.01))
            {
            }
            column(ROUND_Monthly_Actual_Cost_9__0_01_; ROUND(Monthly_Actual_Cost[9], 0.01))
            {
            }
            column(Monthly_Actual_Time_5__60; Monthly_Actual_Time[5] / 60)
            {
            }
            column(ROUND_Montthly_Plan_Cost_8__0_01_; ROUND(Montthly_Plan_Cost[8], 0.01))
            {
            }
            column(Monthly_Plan_Time_8__60; Monthly_Plan_Time[8] / 60)
            {
            }
            column(ROUND_Monthly_Actual_Cost_8__0_01_; ROUND(Monthly_Actual_Cost[8], 0.01))
            {
            }
            column(Monthly_Actual_Time_9__60; Monthly_Actual_Time[9] / 60)
            {
            }
            column(ROUND_Montthly_Plan_Cost_12__0_01_; ROUND(Montthly_Plan_Cost[12], 0.01))
            {
            }
            column(Monthly_Plan_Time_12__60; Monthly_Plan_Time[12] / 60)
            {
            }
            column(ROUND_Monthly_Actual_Cost_12__0_01_; ROUND(Monthly_Actual_Cost[12], 0.01))
            {
            }
            column(ROUND_Monthly_Actual_Cost_7__0_01_; ROUND(Monthly_Actual_Cost[7], 0.01))
            {
            }
            column(Monthly_Actual_Time_4__60; Monthly_Actual_Time[4] / 60)
            {
            }
            column(ROUND_Montthly_Plan_Cost_7__0_01_; ROUND(Montthly_Plan_Cost[7], 0.01))
            {
            }
            column(Monthly_Plan_Time_7__60; Monthly_Plan_Time[7] / 60)
            {
            }
            column(Depat_Plan_TIme_1__60; Depat_Plan_TIme[1] / 60)
            {
            }
            column(ROUND_Dept_Plan_Cost_1__0_01_; ROUND(Dept_Plan_Cost[1], 0.01))
            {
            }
            column(Dept_Actual__Time__1__60; "Dept_Actual _Time"[1] / 60)
            {
            }
            column(ROUND_Dept_Actual_Cost_1__0_01_; ROUND(Dept_Actual_Cost[1], 0.01))
            {
            }
            column(ROUND_Dept_Actual_Cost_2__0_01_; ROUND(Dept_Actual_Cost[2], 0.01))
            {
            }
            column(Depat_Plan_TIme_2__60; Depat_Plan_TIme[2] / 60)
            {
            }
            column(ROUND_Dept_Plan_Cost_2__0_01_; ROUND(Dept_Plan_Cost[2], 0.01))
            {
            }
            column(Dept_Actual__Time__2__60; "Dept_Actual _Time"[2] / 60)
            {
            }
            column(ROUND_Dept_Actual_Cost_3__0_01_; ROUND(Dept_Actual_Cost[3], 0.01))
            {
            }
            column(Depat_Plan_TIme_3__60; Depat_Plan_TIme[3] / 60)
            {
            }
            column(ROUND_Dept_Plan_Cost_3__0_01_; ROUND(Dept_Plan_Cost[3], 0.01))
            {
            }
            column(Dept_Actual__Time__3__60; "Dept_Actual _Time"[3] / 60)
            {
            }
            column(ROUND_Dept_Actual_Cost_4__0_01_; ROUND(Dept_Actual_Cost[4], 0.01))
            {
            }
            column(Depat_Plan_TIme_4__60; Depat_Plan_TIme[4] / 60)
            {
            }
            column(ROUND_Dept_Plan_Cost_4__0_01_; ROUND(Dept_Plan_Cost[4], 0.01))
            {
            }
            column(Dept_Actual__Time__4__60; "Dept_Actual _Time"[4] / 60)
            {
            }
            column(ROUND_Dept_Actual_Cost_5__0_01_; ROUND(Dept_Actual_Cost[5], 0.01))
            {
            }
            column(Depat_Plan_TIme_5__60; Depat_Plan_TIme[5] / 60)
            {
            }
            column(ROUND_Dept_Plan_Cost_5__0_01_; ROUND(Dept_Plan_Cost[5], 0.01))
            {
            }
            column(Dept_Actual__Time__5__60; "Dept_Actual _Time"[5] / 60)
            {
            }
            column(ROUND_Dept_Actual_Cost_6__0_01_; ROUND(Dept_Actual_Cost[6], 0.01))
            {
            }
            column(Depat_Plan_TIme_6__60; Depat_Plan_TIme[6] / 60)
            {
            }
            column(ROUND_Dept_Plan_Cost_6__0_01_; ROUND(Dept_Plan_Cost[6], 0.01))
            {
            }
            column(Dept_Actual__Time__6__60; "Dept_Actual _Time"[6] / 60)
            {
            }
            column(ROUND_Dept_Actual_Cost_7__0_01_; ROUND(Dept_Actual_Cost[7], 0.01))
            {
            }
            column(Depat_Plan_TIme_7__60; Depat_Plan_TIme[7] / 60)
            {
            }
            column(ROUND_Dept_Plan_Cost_7__0_01_; ROUND(Dept_Plan_Cost[7], 0.01))
            {
            }
            column(Dept_Actual__Time__7__60; "Dept_Actual _Time"[7] / 60)
            {
            }
            column(ROUND_Dept_Actual_Cost_8__0_01_; ROUND(Dept_Actual_Cost[8], 0.01))
            {
            }
            column(Depat_Plan_TIme_8__60; Depat_Plan_TIme[8] / 60)
            {
            }
            column(ROUND_Dept_Plan_Cost_8__0_01_; ROUND(Dept_Plan_Cost[8], 0.01))
            {
            }
            column(Dept_Actual__Time__8__60; "Dept_Actual _Time"[8] / 60)
            {
            }
            column(ROUND_Dept_Actual_Cost_9__0_01_; ROUND(Dept_Actual_Cost[9], 0.01))
            {
            }
            column(Depat_Plan_TIme_9__60; Depat_Plan_TIme[9] / 60)
            {
            }
            column(ROUND_Dept_Plan_Cost_9__0_01_; ROUND(Dept_Plan_Cost[9], 0.01))
            {
            }
            column(Dept_Actual__Time__9__60; "Dept_Actual _Time"[9] / 60)
            {
            }
            column(ROUND__Overall_Plan_Cost__0_01_; ROUND("Overall_Plan Cost", 0.01))
            {
            }
            column(Overall_Plan_Time_60; Overall_Plan_Time2 / 60)
            {
            }
            column(Overall_Actual_Time_60; Overall_Actual_Time / 60)
            {
            }
            column(ROUND_Overall_Actual_Cost_0_01_; ROUND(Overall_Actual_Cost, 0.01))
            {
            }
            column(SHF_Hour_Cost; SHF_Hour_Cost)
            {
            }
            column(MPR_Hour_Cost_60; MPR_Hour_Cost * 60)
            {
            }
            column(QAS_Hour_Cost_60; QAS_Hour_Cost * 60)
            {
            }
            column(Prod_Hour_Cost_60; Prod_Hour_Cost * 60)
            {
            }
            column(Prod_Hour_Cost_60_Control1102154690; Prod_Hour_Cost * 60)
            {
            }
            column(Prod_Hour_Cost_60_Control1102154836; Prod_Hour_Cost * 60)
            {
            }
            column(Prod_Hour_Cost_60_Control1102154922; Prod_Hour_Cost * 60)
            {
            }
            column(Prod_Hour_Cost_60_Control1102154946; Prod_Hour_Cost * 60)
            {
            }
            column(Prod_Hour_Cost_60_Control1102154956; Prod_Hour_Cost * 60)
            {
            }
            column(PLANNED_Vs_ACTUALCaption; PLANNED_Vs_ACTUALCaptionLbl)
            {
            }
            column(P1Caption; P1CaptionLbl)
            {
            }
            column(P3Caption; P3CaptionLbl)
            {
            }
            column(P4Caption; P4CaptionLbl)
            {
            }
            column(PSDCaption; PSDCaptionLbl)
            {
            }
            column(MPRCaption; MPRCaptionLbl)
            {
            }
            column(QASCaption; QASCaptionLbl)
            {
            }
            column(SHFCaption; SHFCaptionLbl)
            {
            }
            column(OTHCaption; OTHCaptionLbl)
            {
            }
            column(Planned_TimeCaption_Control1102155069; Planned_TimeCaption_Control1102155069Lbl)
            {
            }
            column(Planned_CostCaption; Planned_CostCaptionLbl)
            {
            }
            column(Actual_TimeCaption_Control1102155072; Actual_TimeCaption_Control1102155072Lbl)
            {
            }
            column(Actual_CostCaption; Actual_CostCaptionLbl)
            {
            }
            column(MONTH_WISE_TOTALSCaption; MONTH_WISE_TOTALSCaptionLbl)
            {
            }
            column(APRCaption; APRCaptionLbl)
            {
            }
            column(MAYCaption; MAYCaptionLbl)
            {
            }
            column(JULCaption; JULCaptionLbl)
            {
            }
            column(OCTCaption; OCTCaptionLbl)
            {
            }
            column(NOVCaption; NOVCaptionLbl)
            {
            }
            column(AUGCaption; AUGCaptionLbl)
            {
            }
            column(SEPCaption; SEPCaptionLbl)
            {
            }
            column(FEBCaption; FEBCaptionLbl)
            {
            }
            column(MARCaption; MARCaptionLbl)
            {
            }
            column(DECCaption; DECCaptionLbl)
            {
            }
            column(JANCaption; JANCaptionLbl)
            {
            }
            column(JUNCaption; JUNCaptionLbl)
            {
            }
            column(DEPT_WISE_TOTALSCaption; DEPT_WISE_TOTALSCaptionLbl)
            {
            }
            column(EmptyStringCaption_Control1102154494; EmptyStringCaption_Control1102154494Lbl)
            {
            }
            column(DEPTCaption; DEPTCaptionLbl)
            {
            }
            column(MONTHCaption; MONTHCaptionLbl)
            {
            }
            column(Per_Hr_Caption; Per_Hr_CaptionLbl)
            {
            }
            column(RsCaption; RsCaptionLbl)
            {
            }
            column(RsCaption_Control1102154508; RsCaption_Control1102154508Lbl)
            {
            }
            column(Per_Hr_Caption_Control1102154510; Per_Hr_Caption_Control1102154510Lbl)
            {
            }
            column(Actual_CostCaption_Control1102154513; Actual_CostCaption_Control1102154513Lbl)
            {
            }
            column(Actual_TimeCaption_Control1102154515; Actual_TimeCaption_Control1102154515Lbl)
            {
            }
            column(Planned_CostCaption_Control1102154558; Planned_CostCaption_Control1102154558Lbl)
            {
            }
            column(Planned_TimeCaption_Control1102154560; Planned_TimeCaption_Control1102154560Lbl)
            {
            }
            column(Actual_CostCaption_Control1102154561; Actual_CostCaption_Control1102154561Lbl)
            {
            }
            column(Actual_TimeCaption_Control1102154563; Actual_TimeCaption_Control1102154563Lbl)
            {
            }
            column(Planned_CostCaption_Control1102154566; Planned_CostCaption_Control1102154566Lbl)
            {
            }
            column(Planned_TimeCaption_Control1102154568; Planned_TimeCaption_Control1102154568Lbl)
            {
            }
            column(Per_Hr_Caption_Control1102154570; Per_Hr_Caption_Control1102154570Lbl)
            {
            }
            column(RsCaption_Control1102154571; RsCaption_Control1102154571Lbl)
            {
            }
            column(Actual_CostCaption_Control1102154578; Actual_CostCaption_Control1102154578Lbl)
            {
            }
            column(Actual_TimeCaption_Control1102154584; Actual_TimeCaption_Control1102154584Lbl)
            {
            }
            column(Planned_CostCaption_Control1102154587; Planned_CostCaption_Control1102154587Lbl)
            {
            }
            column(Planned_TimeCaption_Control1102154589; Planned_TimeCaption_Control1102154589Lbl)
            {
            }
            column(Actual_CostCaption_Control1102154590; Actual_CostCaption_Control1102154590Lbl)
            {
            }
            column(Actual_TimeCaption_Control1102154592; Actual_TimeCaption_Control1102154592Lbl)
            {
            }
            column(Planned_CostCaption_Control1102154595; Planned_CostCaption_Control1102154595Lbl)
            {
            }
            column(Planned_TimeCaption_Control1102154597; Planned_TimeCaption_Control1102154597Lbl)
            {
            }
            column(Planned_TimeCaption_Control1102154599; Planned_TimeCaption_Control1102154599Lbl)
            {
            }
            column(Planned_CostCaption_Control1102154601; Planned_CostCaption_Control1102154601Lbl)
            {
            }
            column(Actual_TimeCaption_Control1102154602; Actual_TimeCaption_Control1102154602Lbl)
            {
            }
            column(Actual_CostCaption_Control1102154604; Actual_CostCaption_Control1102154604Lbl)
            {
            }
            column(Planned_TimeCaption_Control1102154607; Planned_TimeCaption_Control1102154607Lbl)
            {
            }
            column(Planned_CostCaption_Control1102154609; Planned_CostCaption_Control1102154609Lbl)
            {
            }
            column(Actual_TimeCaption_Control1102154610; Actual_TimeCaption_Control1102154610Lbl)
            {
            }
            column(Actual_CostCaption_Control1102154612; Actual_CostCaption_Control1102154612Lbl)
            {
            }
            column(Planned_TimeCaption_Control1102154615; Planned_TimeCaption_Control1102154615Lbl)
            {
            }
            column(Planned_CostCaption_Control1102154616; Planned_CostCaption_Control1102154616Lbl)
            {
            }
            column(Actual_TimeCaption_Control1102154617; Actual_TimeCaption_Control1102154617Lbl)
            {
            }
            column(Actual_CostCaption_Control1102154619; Actual_CostCaption_Control1102154619Lbl)
            {
            }
            column(Planned_TimeCaption_Control1102154622; Planned_TimeCaption_Control1102154622Lbl)
            {
            }
            column(Planned_CostCaption_Control1102154623; Planned_CostCaption_Control1102154623Lbl)
            {
            }
            column(Actual_TimeCaption_Control1102154624; Actual_TimeCaption_Control1102154624Lbl)
            {
            }
            column(Actual_CostCaption_Control1102154682; Actual_CostCaption_Control1102154682Lbl)
            {
            }
            column(P2Caption; P2CaptionLbl)
            {
            }
            column(Per_Hr_Caption_Control1102154688; Per_Hr_Caption_Control1102154688Lbl)
            {
            }
            column(Per_Hr_Caption_Control1102154691; Per_Hr_Caption_Control1102154691Lbl)
            {
            }
            column(Per_Hr_Caption_Control1102154844; Per_Hr_Caption_Control1102154844Lbl)
            {
            }
            column(Per_Hr_Caption_Control1102154886; Per_Hr_Caption_Control1102154886Lbl)
            {
            }
            column(Per_Hr_Caption_Control1102154948; Per_Hr_Caption_Control1102154948Lbl)
            {
            }
            column(RsCaption_Control1102154949; RsCaption_Control1102154949Lbl)
            {
            }
            column(RsCaption_Control1102154950; RsCaption_Control1102154950Lbl)
            {
            }
            column(RsCaption_Control1102154951; RsCaption_Control1102154951Lbl)
            {
            }
            column(RsCaption_Control1102154952; RsCaption_Control1102154952Lbl)
            {
            }
            column(RsCaption_Control1102154953; RsCaption_Control1102154953Lbl)
            {
            }
            column(Per_Hr_Caption_Control1102154957; Per_Hr_Caption_Control1102154957Lbl)
            {
            }
            column(RsCaption_Control1102154961; RsCaption_Control1102154961Lbl)
            {
            }
            column(Capacity_Ledger_Entry2__Entry_No_; "Entry No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF "<Capacity Ledger Entry2>"."Work Center No." = 'P1' THEN BEGIN
                    PlannedTime[1] [DATE2DMY("<Capacity Ledger Entry2>"."Posting Date", 2)] += "<Capacity Ledger Entry2>"."Planed Run Time";
                    ActualTime1[1] [DATE2DMY("<Capacity Ledger Entry2>"."Posting Date", 2)] += "<Capacity Ledger Entry2>"."Actual Run Time";
                    PlannedValue[1] [DATE2DMY("<Capacity Ledger Entry2>"."Posting Date", 2)] += "<Capacity Ledger Entry2>"."Planed Run Time"
                                                                                            * "<Capacity Ledger Entry2>"."Work Center Unit Cost"
                                                                                            * "<Capacity Ledger Entry2>"."Output Quantity";

                    ActualValue[1] [DATE2DMY("<Capacity Ledger Entry2>"."Posting Date", 2)] += "<Capacity Ledger Entry2>"."Actual Run Time"
                                                                                            * "<Capacity Ledger Entry2>"."Work Center Unit Cost";
                END ELSE
                    IF "<Capacity Ledger Entry2>"."Work Center No." = 'P2' THEN BEGIN
                        PlannedTime[2] [DATE2DMY("<Capacity Ledger Entry2>"."Posting Date", 2)] += "<Capacity Ledger Entry2>"."Planed Run Time";
                        ActualTime1[2] [DATE2DMY("<Capacity Ledger Entry2>"."Posting Date", 2)] += "<Capacity Ledger Entry2>"."Actual Run Time";
                        PlannedValue[2] [DATE2DMY("<Capacity Ledger Entry2>"."Posting Date", 2)] += "<Capacity Ledger Entry2>"."Planed Run Time"
                                                                                                * "<Capacity Ledger Entry2>"."Work Center Unit Cost"
                                                                                                * "<Capacity Ledger Entry2>"."Output Quantity";
                        ActualValue[2] [DATE2DMY("<Capacity Ledger Entry2>"."Posting Date", 2)] += "<Capacity Ledger Entry2>"."Actual Run Time"
                                                                                                * "<Capacity Ledger Entry2>"."Work Center Unit Cost";

                    END ELSE
                        IF "<Capacity Ledger Entry2>"."Work Center No." = 'P3' THEN BEGIN
                            PlannedTime[3] [DATE2DMY("<Capacity Ledger Entry2>"."Posting Date", 2)] += "<Capacity Ledger Entry2>"."Planed Run Time";
                            ActualTime1[3] [DATE2DMY("<Capacity Ledger Entry2>"."Posting Date", 2)] += "<Capacity Ledger Entry2>"."Actual Run Time";
                            PlannedValue[3] [DATE2DMY("<Capacity Ledger Entry2>"."Posting Date", 2)] += "<Capacity Ledger Entry2>"."Planed Run Time"
                                                                                                    * "<Capacity Ledger Entry2>"."Work Center Unit Cost"
                                                                                                    * "<Capacity Ledger Entry2>"."Output Quantity";
                            ;
                            ActualValue[3] [DATE2DMY("<Capacity Ledger Entry2>"."Posting Date", 2)] += "<Capacity Ledger Entry2>"."Actual Run Time"
                                                                                                    * "<Capacity Ledger Entry2>"."Work Center Unit Cost";

                        END ELSE
                            IF "<Capacity Ledger Entry2>"."Work Center No." = 'P4' THEN BEGIN
                                PlannedTime[4] [DATE2DMY("<Capacity Ledger Entry2>"."Posting Date", 2)] += "<Capacity Ledger Entry2>"."Planed Run Time";
                                ActualTime1[4] [DATE2DMY("<Capacity Ledger Entry2>"."Posting Date", 2)] += "<Capacity Ledger Entry2>"."Actual Run Time";
                                PlannedValue[4] [DATE2DMY("<Capacity Ledger Entry2>"."Posting Date", 2)] += "<Capacity Ledger Entry2>"."Planed Run Time"
                                                                                                        * "<Capacity Ledger Entry2>"."Work Center Unit Cost"
                                                                                                        * "<Capacity Ledger Entry2>"."Output Quantity";
                                ;
                                ActualValue[4] [DATE2DMY("<Capacity Ledger Entry2>"."Posting Date", 2)] += "<Capacity Ledger Entry2>"."Actual Run Time"
                                                                                                        * "<Capacity Ledger Entry2>"."Work Center Unit Cost";

                            END ELSE
                                IF "<Capacity Ledger Entry2>"."Work Center No." = 'PSD' THEN BEGIN
                                    PlannedTime[5] [DATE2DMY("<Capacity Ledger Entry2>"."Posting Date", 2)] += "<Capacity Ledger Entry2>"."Planed Run Time";
                                    ActualTime1[5] [DATE2DMY("<Capacity Ledger Entry2>"."Posting Date", 2)] += "<Capacity Ledger Entry2>"."Actual Run Time";
                                    PlannedValue[5] [DATE2DMY("<Capacity Ledger Entry2>"."Posting Date", 2)] += "<Capacity Ledger Entry2>"."Planed Run Time"
                                                                                                            * "<Capacity Ledger Entry2>"."Work Center Unit Cost"
                                                                                                            * "<Capacity Ledger Entry2>"."Output Quantity";
                                    ;
                                    ActualValue[5] [DATE2DMY("<Capacity Ledger Entry2>"."Posting Date", 2)] += "<Capacity Ledger Entry2>"."Actual Run Time"
                                                                                                            * "<Capacity Ledger Entry2>"."Work Center Unit Cost";

                                END ELSE
                                    IF "<Capacity Ledger Entry2>"."Work Center No." = 'MPR' THEN BEGIN
                                        PlannedTime[6] [DATE2DMY("<Capacity Ledger Entry2>"."Posting Date", 2)] += "<Capacity Ledger Entry2>"."Planed Run Time";
                                        ActualTime1[6] [DATE2DMY("<Capacity Ledger Entry2>"."Posting Date", 2)] += "<Capacity Ledger Entry2>"."Actual Run Time";
                                        PlannedValue[6] [DATE2DMY("<Capacity Ledger Entry2>"."Posting Date", 2)] += "<Capacity Ledger Entry2>"."Planed Run Time"
                                                                                                                * "<Capacity Ledger Entry2>"."Work Center Unit Cost"
                                                                                                                * "<Capacity Ledger Entry2>"."Output Quantity";
                                        ;
                                        ActualValue[6] [DATE2DMY("<Capacity Ledger Entry2>"."Posting Date", 2)] += "<Capacity Ledger Entry2>"."Actual Run Time"
                                                                                                                * "<Capacity Ledger Entry2>"."Work Center Unit Cost";

                                    END ELSE
                                        IF "<Capacity Ledger Entry2>"."Work Center No." = 'QAS' THEN BEGIN
                                            PlannedTime[7] [DATE2DMY("<Capacity Ledger Entry2>"."Posting Date", 2)] += "<Capacity Ledger Entry2>"."Planed Run Time";
                                            ActualTime1[7] [DATE2DMY("<Capacity Ledger Entry2>"."Posting Date", 2)] += "<Capacity Ledger Entry2>"."Actual Run Time";
                                            PlannedValue[7] [DATE2DMY("<Capacity Ledger Entry2>"."Posting Date", 2)] += "<Capacity Ledger Entry2>"."Planed Run Time"
                                                                                                                    * "<Capacity Ledger Entry2>"."Work Center Unit Cost"
                                                                                                                    * "<Capacity Ledger Entry2>"."Output Quantity";
                                            ;
                                            ActualValue[7] [DATE2DMY("<Capacity Ledger Entry2>"."Posting Date", 2)] += "<Capacity Ledger Entry2>"."Actual Run Time"
                                                                                                                    * "<Capacity Ledger Entry2>"."Work Center Unit Cost";


                                        END ELSE
                                            IF "<Capacity Ledger Entry2>"."Work Center No." = 'SHF' THEN BEGIN
                                                PlannedTime[8] [DATE2DMY("<Capacity Ledger Entry2>"."Posting Date", 2)] += "<Capacity Ledger Entry2>"."Planed Run Time";
                                                ActualTime1[8] [DATE2DMY("<Capacity Ledger Entry2>"."Posting Date", 2)] += "<Capacity Ledger Entry2>"."Actual Run Time";
                                                PlannedValue[8] [DATE2DMY("<Capacity Ledger Entry2>"."Posting Date", 2)] += "<Capacity Ledger Entry2>"."Planed Run Time"
                                                                                                                        * "<Capacity Ledger Entry2>"."Work Center Unit Cost"
                                                                                                                        * "<Capacity Ledger Entry2>"."Output Quantity";
                                                ActualValue[8] [DATE2DMY("<Capacity Ledger Entry2>"."Posting Date", 2)] += "<Capacity Ledger Entry2>"."Actual Run Time"
                                                                                                                        * "<Capacity Ledger Entry2>"."Work Center Unit Cost";

                                            END ELSE BEGIN
                                                PlannedTime[9] [DATE2DMY("<Capacity Ledger Entry2>"."Posting Date", 2)] += "<Capacity Ledger Entry2>"."Planed Run Time";
                                                ActualTime1[9] [DATE2DMY("<Capacity Ledger Entry2>"."Posting Date", 2)] += "<Capacity Ledger Entry2>"."Actual Run Time";
                                                PlannedValue[9] [DATE2DMY("<Capacity Ledger Entry2>"."Posting Date", 2)] += "<Capacity Ledger Entry2>"."Planed Run Time"
                                                                                                                        * "<Capacity Ledger Entry2>"."Work Center Unit Cost"
                                                                                                                        * "<Capacity Ledger Entry2>"."Output Quantity";
                                                ActualValue[9] [DATE2DMY("<Capacity Ledger Entry2>"."Posting Date", 2)] += "<Capacity Ledger Entry2>"."Actual Run Time"
                                                                                                                        * "<Capacity Ledger Entry2>"."Work Center Unit Cost";

                                            END;
                Overall_Plan_Time2 += "<Capacity Ledger Entry2>"."Planed Run Time";
                "Overall_Plan Cost" += "<Capacity Ledger Entry2>"."Actual Run Time";
                Overall_Actual_Time += "<Capacity Ledger Entry2>"."Planed Run Time"
                                     * "<Capacity Ledger Entry2>"."Work Center Unit Cost";
                Overall_Actual_Cost += "<Capacity Ledger Entry2>"."Actual Run Time"
                                                                                        * "<Capacity Ledger Entry2>"."Work Center Unit Cost";
            end;

            trigger OnPreDataItem();
            begin
                //WHERE(Posting Date=FILTER(>03/30/08))
                SETFILTER("Posting Date", '>%1', 033008D);
                IF Choice <> Choice::DeptProductivity THEN
                    CurrReport.BREAK;
            end;
        }
        dataitem("<Capacity Ledger Entry3>"; "Capacity Ledger Entry")
        {
            DataItemTableView = SORTING(Order No., Order Line No., Routing No., Routing Reference No., Operation No., Last Output Line) ORDER(Ascending) WHERE(Document No.=FILTER(<>*RE*),Reworked User Id=FILTER(''));
            RequestFilterFields = "Posting Date","Work Center No.","Operation No.","Order No.";
            ReqFilterHeading = 'Project Productivity';
            column(Rework_Time__Control1102155016;"Rework Time")
            {
            }
            column(prod_Control1102155017;prod)
            {
            }
            column(totalactualtime_Control1102155018;totalactualtime)
            {
            }
            column(totalplantime_Control1102155019;totalplantime)
            {
            }
            column(sno_Control1102155020;sno)
            {
            }
            column(Capacity_Ledger_Entry3___Order_No__;"Order No.")
            {
            }
            column(actualtime_Control1102155022;actualtime)
            {
            }
            column(plantime_Control1102155024;plantime)
            {
            }
            column(totprod_Control1102155025;totprod)
            {
            }
            column(Total_Rework__Control1102155026;"Total Rework")
            {
            }
            column(Spent_TimeCaption_Control1102154995;Spent_TimeCaption_Control1102154995Lbl)
            {
            }
            column(ProjectCaption_Control1102155003;ProjectCaption_Control1102155003Lbl)
            {
            }
            column(Planned_TimeCaption_Control1102155012;Planned_TimeCaption_Control1102155012Lbl)
            {
            }
            column(ProductivityCaption_Control1102155013;ProductivityCaption_Control1102155013Lbl)
            {
            }
            column(Rework_TimeCaption_Control1102155014;Rework_TimeCaption_Control1102155014Lbl)
            {
            }
            column(SNoCaption_Control1102155015;SNoCaption_Control1102155015Lbl)
            {
            }
            column(Capacity_Ledger_Entry3__Entry_No_;"Entry No.")
            {
            }

            trigger OnPreDataItem();
            begin
                IF Choice<>Choice::ProProductivity THEN
                  CurrReport.BREAK;
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

    trigger OnPostReport();
    begin
        IF excel THEN
        BEGIN
          Tempexcelbuffer.CreateBook('','');//B2B //EFFUPG
          //Tempexcelbuffer.CreateSheet('Actual VS Consumed','',COMPANYNAME,'');//B2B
          Tempexcelbuffer.GiveUserControl;
        END
    end;

    trigger OnPreReport();
    begin
                     IF Choice=Choice::"Project Productivity" THEN
                     BEGIN
                       prodordernofilt := "Capacity Ledger Entry".GETFILTERS;
                       prodordernofilt := "Capacity Ledger Entry".GETFILTER("Order No.");//B2B
                       datefilt:= "Capacity Ledger Entry".GETFILTER("Posting Date");
                     END;
         IF excel THEN
         BEGIN
           CLEAR(Tempexcelbuffer);
           Tempexcelbuffer.DELETEALL;
         END;
          Row:=1;
    end;

    var
        totalplantime : Decimal;
        totalactualtime : Decimal;
        prod : Decimal;
        sno : Integer;
        prodordernofilt : Text[500];
        plantime : Decimal;
        actualtime : Decimal;
        totprod : Decimal;
        datefilt : Text[500];
        Cle1 : Record "Capacity Ledger Entry";
        "Rework Time" : Decimal;
        "Total Rework" : Decimal;
        Choice : Option "Project Productivity","Person Capability",DeptProductivity,ProProductivity;
        "Compound Desc" : Text[50];
        Card_Filters : Text[500];
        item : Record Item;
        Choice2 : Option Brief,Detail;
        Cle2 : Record "Capacity Ledger Entry";
        "No. Of Cards" : Decimal;
        "Total Rework Time" : Decimal;
        "Total Spent(with reowrk)" : Decimal;
        "Overall Plan Time" : Decimal;
        "Overall Spent Time" : Decimal;
        "Overall Rework TIme" : Decimal;
        Max_Date : Date;
        Min_Date : Date;
        Previous_Order : Code[20];
        "Total Planned Time" : Decimal;
        "Total Actual Time" : Decimal;
        Deatail_Productivity : Decimal;
        Brief_Productivity : Decimal;
        "Previous Date" : Date;
        "Start Date" : array [24] of Date;
        "End Date" : array [24] of Date;
        NO_OF_MONTH : Integer;
        Change_Month : Boolean;
        Month : Code[20];
        PlannedTime : array [12,12] of Decimal;
        ActualTime1 : array [12,12] of Decimal;
        PlannedValue : array [12,12] of Decimal;
        ActualValue : array [12,12] of Decimal;
        Monthly_Plan_Time : array [15] of Decimal;
        Montthly_Plan_Cost : array [15] of Decimal;
        Monthly_Actual_Time : array [15] of Decimal;
        Monthly_Actual_Cost : array [15] of Decimal;
        Depat_Plan_TIme : array [15] of Decimal;
        Dept_Plan_Cost : array [15] of Decimal;
        "Dept_Actual _Time" : array [15] of Decimal;
        Dept_Actual_Cost : array [15] of Decimal;
        Overall_Plan_Time2 : Decimal;
        "Overall_Plan Cost" : Decimal;
        Overall_Actual_Time : Decimal;
        Overall_Actual_Cost : Decimal;
        J : Integer;
        I : Integer;
        Prod_Hour_Cost : Decimal;
        MPR_Hour_Cost : Decimal;
        QAS_Hour_Cost : Decimal;
        SHF_Hour_Cost : Decimal;
        Work_Center : Record "Work Center";
        excel : Boolean;
        Tempexcelbuffer : Record "Excel Buffer";
        Row : Integer;
        Overall_Productivity : Decimal;
        ProductivityCaptionLbl : Label 'Productivity';
        Actual_TimeCaptionLbl : Label 'Actual Time';
        Plan_TimeCaptionLbl : Label 'Plan Time';
        DepartmentCaptionLbl : Label 'Department';
        Emp_NameCaptionLbl : Label 'Emp Name';
        ProductivityCaption_Control1000000038Lbl : Label 'Productivity';
        Prod_Order_NoCaptionLbl : Label 'Prod Order No';
        DateCaptionLbl : Label 'Date';
        Emp_IdCaptionLbl : Label 'Emp Id';
        SnoCaptionLbl : Label 'Sno';
        Rework_TimeCaptionLbl : Label 'Rework Time';
        Card_Wise_Person_CapabiltyCaptionLbl : Label 'Card Wise Person Capabilty';
        PersonCaptionLbl : Label 'Person';
        NameCaptionLbl : Label 'Name';
        QuantityCaptionLbl : Label 'Quantity';
        ItemCaptionLbl : Label 'Item';
        Rework_Time__Hours_CaptionLbl : Label 'Rework Time (Hours)';
        ProductivityCaption_Control1102154062Lbl : Label 'Productivity';
        Total_Time__Hours_CaptionLbl : Label 'Total Time (Hours)';
        Spent_Time__Hours_CaptionLbl : Label 'Spent Time (Hours)';
        Planned_Time__Hours_CaptionLbl : Label 'Planned Time (Hours)';
        Card_Wise_Person_CapabiltyCaption_Control1102154003Lbl : Label 'Card Wise Person Capabilty';
        ProjectCaptionLbl : Label 'Project';
        Planned_TimeCaptionLbl : Label 'Planned Time';
        Spent_TimeCaptionLbl : Label 'Spent Time';
        ProductivityCaption_Control1102154030Lbl : Label 'Productivity';
        QuantityCaption_Control1102154010Lbl : Label 'Quantity';
        Rework_TimeCaption_Control1102154009Lbl : Label 'Rework Time';
        Total_Time_CaptionLbl : Label '"Total Time "';
        EmptyStringCaptionLbl : Label '%';
        Total_Time___Hrs_CaptionLbl : Label 'Total Time ( Hrs)';
        EmptyStringCaption_Control1102154047Lbl : Label '%';
        EmptyStringCaption_Control1102154053Lbl : Label '%';
        Total_Time___Hrs_Caption_Control1102154060Lbl : Label 'Total Time ( Hrs)';
        PLANNED_Vs_ACTUALCaptionLbl : Label 'PLANNED Vs ACTUAL';
        P1CaptionLbl : Label 'P1';
        P3CaptionLbl : Label 'P3';
        P4CaptionLbl : Label 'P4';
        PSDCaptionLbl : Label 'PSD';
        MPRCaptionLbl : Label 'MPR';
        QASCaptionLbl : Label 'QAS';
        SHFCaptionLbl : Label 'SHF';
        OTHCaptionLbl : Label 'OTH';
        Planned_TimeCaption_Control1102155069Lbl : Label 'Planned Time';
        Planned_CostCaptionLbl : Label 'Planned Cost';
        Actual_TimeCaption_Control1102155072Lbl : Label 'Actual Time';
        Actual_CostCaptionLbl : Label 'Actual Cost';
        MONTH_WISE_TOTALSCaptionLbl : Label 'MONTH WISE TOTALS';
        APRCaptionLbl : Label 'APR';
        MAYCaptionLbl : Label 'MAY';
        JULCaptionLbl : Label 'JUL';
        OCTCaptionLbl : Label 'OCT';
        NOVCaptionLbl : Label 'NOV';
        AUGCaptionLbl : Label 'AUG';
        SEPCaptionLbl : Label 'SEP';
        FEBCaptionLbl : Label 'FEB';
        MARCaptionLbl : Label 'MAR';
        DECCaptionLbl : Label 'DEC';
        JANCaptionLbl : Label 'JAN';
        JUNCaptionLbl : Label 'JUN';
        DEPT_WISE_TOTALSCaptionLbl : Label 'DEPT WISE TOTALS';
        EmptyStringCaption_Control1102154494Lbl : Label '\';
        DEPTCaptionLbl : Label 'DEPT';
        MONTHCaptionLbl : Label 'MONTH';
        Per_Hr_CaptionLbl : Label 'Per Hr.';
        RsCaptionLbl : Label 'Rs';
        RsCaption_Control1102154508Lbl : Label 'Rs';
        Per_Hr_Caption_Control1102154510Lbl : Label 'Per Hr.';
        Actual_CostCaption_Control1102154513Lbl : Label 'Actual Cost';
        Actual_TimeCaption_Control1102154515Lbl : Label 'Actual Time';
        Planned_CostCaption_Control1102154558Lbl : Label 'Planned Cost';
        Planned_TimeCaption_Control1102154560Lbl : Label 'Planned Time';
        Actual_CostCaption_Control1102154561Lbl : Label 'Actual Cost';
        Actual_TimeCaption_Control1102154563Lbl : Label 'Actual Time';
        Planned_CostCaption_Control1102154566Lbl : Label 'Planned Cost';
        Planned_TimeCaption_Control1102154568Lbl : Label 'Planned Time';
        Per_Hr_Caption_Control1102154570Lbl : Label 'Per Hr.';
        RsCaption_Control1102154571Lbl : Label 'Rs';
        Actual_CostCaption_Control1102154578Lbl : Label 'Actual Cost';
        Actual_TimeCaption_Control1102154584Lbl : Label 'Actual Time';
        Planned_CostCaption_Control1102154587Lbl : Label 'Planned Cost';
        Planned_TimeCaption_Control1102154589Lbl : Label 'Planned Time';
        Actual_CostCaption_Control1102154590Lbl : Label 'Actual Cost';
        Actual_TimeCaption_Control1102154592Lbl : Label 'Actual Time';
        Planned_CostCaption_Control1102154595Lbl : Label 'Planned Cost';
        Planned_TimeCaption_Control1102154597Lbl : Label 'Planned Time';
        Planned_TimeCaption_Control1102154599Lbl : Label 'Planned Time';
        Planned_CostCaption_Control1102154601Lbl : Label 'Planned Cost';
        Actual_TimeCaption_Control1102154602Lbl : Label 'Actual Time';
        Actual_CostCaption_Control1102154604Lbl : Label 'Actual Cost';
        Planned_TimeCaption_Control1102154607Lbl : Label 'Planned Time';
        Planned_CostCaption_Control1102154609Lbl : Label 'Planned Cost';
        Actual_TimeCaption_Control1102154610Lbl : Label 'Actual Time';
        Actual_CostCaption_Control1102154612Lbl : Label 'Actual Cost';
        Planned_TimeCaption_Control1102154615Lbl : Label 'Planned Time';
        Planned_CostCaption_Control1102154616Lbl : Label 'Planned Cost';
        Actual_TimeCaption_Control1102154617Lbl : Label 'Actual Time';
        Actual_CostCaption_Control1102154619Lbl : Label 'Actual Cost';
        Planned_TimeCaption_Control1102154622Lbl : Label 'Planned Time';
        Planned_CostCaption_Control1102154623Lbl : Label 'Planned Cost';
        Actual_TimeCaption_Control1102154624Lbl : Label 'Actual Time';
        Actual_CostCaption_Control1102154682Lbl : Label 'Actual Cost';
        P2CaptionLbl : Label 'P2';
        Per_Hr_Caption_Control1102154688Lbl : Label 'Per Hr.';
        Per_Hr_Caption_Control1102154691Lbl : Label 'Per Hr.';
        Per_Hr_Caption_Control1102154844Lbl : Label 'Per Hr.';
        Per_Hr_Caption_Control1102154886Lbl : Label 'Per Hr.';
        Per_Hr_Caption_Control1102154948Lbl : Label 'Per Hr.';
        RsCaption_Control1102154949Lbl : Label 'Rs';
        RsCaption_Control1102154950Lbl : Label 'Rs';
        RsCaption_Control1102154951Lbl : Label 'Rs';
        RsCaption_Control1102154952Lbl : Label 'Rs';
        RsCaption_Control1102154953Lbl : Label 'Rs';
        Per_Hr_Caption_Control1102154957Lbl : Label 'Per Hr.';
        RsCaption_Control1102154961Lbl : Label 'Rs';
        Spent_TimeCaption_Control1102154995Lbl : Label 'Spent Time';
        ProjectCaption_Control1102155003Lbl : Label 'Project';
        Planned_TimeCaption_Control1102155012Lbl : Label 'Planned Time';
        ProductivityCaption_Control1102155013Lbl : Label 'Productivity';
        Rework_TimeCaption_Control1102155014Lbl : Label 'Rework Time';
        SNoCaption_Control1102155015Lbl : Label 'SNo';
        i1 : Integer;

    (1689)]
    procedure Entercell(RowNo : Integer;ColumnNo : Integer;CellValue : Text[1000];bold : Boolean);
    begin

        Tempexcelbuffer.INIT;
        Tempexcelbuffer.VALIDATE("Row No.",RowNo);
        Tempexcelbuffer.VALIDATE("Column No.",ColumnNo);
        Tempexcelbuffer."Cell Value as Text" := CellValue;
        Tempexcelbuffer.Bold:=bold ;

        Tempexcelbuffer.INSERT;
    end;

    (1699)]
    procedure EnterHeadings(RowNo : Integer;ColumnNo : Integer;CellValue : Text[100];Bold : Boolean);
    begin
        Tempexcelbuffer.INIT;
        Tempexcelbuffer.VALIDATE("Row No.",RowNo);
        Tempexcelbuffer.VALIDATE("Column No.",ColumnNo);
        Tempexcelbuffer."Cell Value as Text" := FORMAT(CellValue);
        Tempexcelbuffer.Bold:=Bold ;

        Tempexcelbuffer.Formula := '';
        Tempexcelbuffer.INSERT;
    end;

    (1709)]
    procedure "Entercell New"();
    begin
    end;
}

