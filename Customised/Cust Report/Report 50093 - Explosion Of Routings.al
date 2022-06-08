report 50093 "Explosion Of Routings"
{
    // version ESPL 1.0,Eff01,EFFUPG

    DefaultLayout = RDLC;
    RDLCLayout = './Explosion Of Routings.rdlc';

    dataset
    {
        dataitem("Production BOM Header"; "Production BOM Header")
        {
            DataItemTableView = SORTING(No.) ORDER(Ascending);
            RequestFilterFields = "No.";
            column(POM_Choice; Choice)
            {
            }
            column(Totals_1; Totals[1])
            {
            }
            column(Totals_2; Totals[2])
            {
            }
            column(Totals_3; Totals[3])
            {
            }
            column(Totals_4; Totals[4])
            {
            }
            column(Totals_5; Totals[5])
            {
            }
            column(Totals_6; Totals[6])
            {
            }
            column(Totals_7; Totals[7])
            {
            }
            column(Totals_8; Totals[8])
            {
            }
            column(Totals_9; Totals[9])
            {
            }
            column(Totals_10; Totals[10])
            {
            }
            column(Totals_11; Totals[11])
            {
            }
            column(Totals_12; Totals[12])
            {
            }
            column(Totals_13; Totals[13])
            {
            }
            column(Totals_14; Totals[14])
            {
            }
            column(Totals_15; Totals[15])
            {
            }
            column(Totals_16; Totals[16])
            {
            }
            column(Totals_17; Totals[17])
            {
            }
            column(Totals_18; Totals[18])
            {
            }
            column(Totals_19; Totals[19])
            {
            }
            column(Totals_20; Totals[20])
            {
            }
            column(Totals_21; Totals[21])
            {
            }
            column(Totals_22; Totals[22])
            {
            }
            column(Totals_23; Totals[23])
            {
            }
            column(Totals_24; Totals[24])
            {
            }
            column(Totals_25; Totals[25])
            {
            }
            column(Totals_26; Totals[26])
            {
            }
            column(Totals_27; Totals[27])
            {
            }
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(USERID; USERID)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PAGENO)
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(Production_BOM_Header_Description; Description)
            {
            }
            column(Production_BOM_Header_Description_Control1102154038; Description)
            {
            }
            column(TOT_BENCH_MARK; TOT_BENCH_MARK)
            {
            }
            column(Hour_Cost_1_; Hour_Cost[1])
            {
            }
            column(Total_Cost_1_; Total_Cost[1])
            {
            }
            column(TOT_BENCH_MARK_Control1102154001; TOT_BENCH_MARK)
            {
            }
            column(Hour_Cost_2_; Hour_Cost[2])
            {
            }
            column(Total_Cost_2_; Total_Cost[2])
            {
            }
            column(TOT_BENCH_MARK_Control1102154000; TOT_BENCH_MARK)
            {
            }
            column(Hour_Cost_3_; Hour_Cost[3])
            {
            }
            column(Total_Cost_3_; Total_Cost[3])
            {
            }
            column(TOT_BENCH_MARK_Control1102154003; TOT_BENCH_MARK)
            {
            }
            column(Hour_Cost_4_; Hour_Cost[4])
            {
            }
            column(Total_Cost_4_; Total_Cost[4])
            {
            }
            column(TOT_BENCH_MARK_Control1102156000; TOT_BENCH_MARK)
            {
            }
            column(Hour_Cost_5_; Hour_Cost[5])
            {
            }
            column(Total_Cost_5_; Total_Cost[5])
            {
            }
            column(Hour_Cost_6_; Hour_Cost[6])
            {
            }
            column(TOT_BENCH_MARK_Control1102156010; TOT_BENCH_MARK)
            {
            }
            column(Total_Cost_6_; Total_Cost[6])
            {
            }
            column(Hour_Cost_7_; Hour_Cost[7])
            {
            }
            column(TOT_BENCH_MARK_Control1102156011; TOT_BENCH_MARK)
            {
            }
            column(Total_Cost_7_; Total_Cost[7])
            {
            }
            column(Hour_Cost_8_; Hour_Cost[8])
            {
            }
            column(TOT_BENCH_MARK_Control1102156012; TOT_BENCH_MARK)
            {
            }
            column(Total_Cost_8_; Total_Cost[8])
            {
            }
            column(Hour_Cost_9_; Hour_Cost[9])
            {
            }
            column(TOT_BENCH_MARK_Control1102156013; TOT_BENCH_MARK)
            {
            }
            column(Total_Cost_9_; Total_Cost[9])
            {
            }
            column(Hour_Cost_10_; Hour_Cost[10])
            {
            }
            column(TOT_BENCH_MARK_Control1102156014; TOT_BENCH_MARK)
            {
            }
            column(Total_Cost_10_; Total_Cost[10])
            {
            }
            column(Hour_Cost_11_; Hour_Cost[11])
            {
            }
            column(TOT_BENCH_MARK_Control1102156015; TOT_BENCH_MARK)
            {
            }
            column(Total_Cost_11_; Total_Cost[11])
            {
            }
            column(Hour_Cost_12_; Hour_Cost[12])
            {
            }
            column(TOT_BENCH_MARK_Control1102156016; TOT_BENCH_MARK)
            {
            }
            column(Total_Cost_12_; Total_Cost[12])
            {
            }
            column(Hour_Cost_13_; Hour_Cost[13])
            {
            }
            column(TOT_BENCH_MARK_Control1102156017; TOT_BENCH_MARK)
            {
            }
            column(Total_Cost_13_; Total_Cost[13])
            {
            }
            column(TOT_BENCH_MARK_Control1102156027; TOT_BENCH_MARK)
            {
            }
            column(Hour_Cost_14_; Hour_Cost[14])
            {
            }
            column(Total_Cost_14_; Total_Cost[14])
            {
            }
            column(TOT_BENCH_MARK_Control1102156030; TOT_BENCH_MARK)
            {
            }
            column(Hour_Cost_15_; Hour_Cost[15])
            {
            }
            column(Total_Cost_15_; Total_Cost[15])
            {
            }
            column(TOT_BENCH_MARK_Control1102156031; TOT_BENCH_MARK)
            {
            }
            column(Hour_Cost_16_; Hour_Cost[16])
            {
            }
            column(Total_Cost_16_; Total_Cost[16])
            {
            }
            column(TOT_BENCH_MARK_Control1102156032; TOT_BENCH_MARK)
            {
            }
            column(Hour_Cost_17_; Hour_Cost[17])
            {
            }
            column(Total_Cost_17_; Total_Cost[17])
            {
            }
            column(TOT_BENCH_MARK_Control1102156033; TOT_BENCH_MARK)
            {
            }
            column(Hour_Cost_18_; Hour_Cost[18])
            {
            }
            column(Total_Cost_18_; Total_Cost[18])
            {
            }
            column(Total_Cost_19_; Total_Cost[19])
            {
            }
            column(FORMAT_Totals_19__60_DIV_60_______FORMAT_ROUND_Totals_19__60_MOD_60_1__; FORMAT(Totals[19] * 60 DIV 60) + '::' + FORMAT(ROUND(Totals[19] * 60 MOD 60, 1)))
            {
            }
            column(FORMAT_Totals1_5__60_DIV_60_______FORMAT_ROUND_Totals1_5__60_MOD_60_1__; FORMAT(Totals1[5] * 60 DIV 60) + ':' + FORMAT(ROUND(Totals1[5] * 60 MOD 60, 1)))
            {
            }
            column(Total_Cost1_5_; Total_Cost1[5])
            {
            }
            column(FORMAT_Totals1_3__60_DIV_60_______FORMAT_ROUND_Totals1_3__60_MOD_60_1__; FORMAT(Totals1[3] * 60 DIV 60) + ':' + FORMAT(ROUND(Totals1[3] * 60 MOD 60, 1)))
            {
            }
            column(FORMAT_Totals1_2__60_DIV_60_______FORMAT_ROUND_Totals1_2__60_MOD_60_1__; FORMAT(Totals1[2] * 60 DIV 60) + ':' + FORMAT(ROUND(Totals1[2] * 60 MOD 60, 1)))
            {
            }
            column(FORMAT_Totals1_1__60_DIV_60_______FORMAT_ROUND_Totals1_1__60_MOD_60_1__; FORMAT(Totals1[1] * 60 DIV 60) + ':' + FORMAT(ROUND(Totals1[1] * 60 MOD 60, 1)))
            {
            }
            column(FORMAT_Totals1_4__60_DIV_60_______FORMAT_ROUND_Totals1_4__60_MOD_60_1__; FORMAT(Totals1[4] * 60 DIV 60) + ':' + FORMAT(ROUND(Totals1[4] * 60 MOD 60, 1)))
            {
            }
            column(Total_Cost1_1_; Total_Cost1[1])
            {
            }
            column(Total_Cost1_2_; Total_Cost1[2])
            {
            }
            column(Total_Cost1_3_; Total_Cost1[3])
            {
            }
            column(Total_Cost1_4_; Total_Cost1[4])
            {
            }
            column(Production_BOM_Header_Description_Control1102154114; Description)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Explosion_of_RoutingsCaption; Explosion_of_RoutingsCaptionLbl)
            {
            }
            column(Production_BOMCaption; Production_BOMCaptionLbl)
            {
            }
            column(DepartmentsCaption; DepartmentsCaptionLbl)
            {
            }
            column(Hour_CostCaption; Hour_CostCaptionLbl)
            {
            }
            column(Total_CostCaption; Total_CostCaptionLbl)
            {
            }
            column(Bench_Mark__HH_MM_Caption; Bench_Mark__HH_MM_CaptionLbl)
            {
            }
            column(CDACaption; CDACaptionLbl)
            {
            }
            column(CHWCaption; CHWCaptionLbl)
            {
            }
            column(CSACaption; CSACaptionLbl)
            {
            }
            column(CSMCaption; CSMCaptionLbl)
            {
            }
            column(CSTCaption; CSTCaptionLbl)
            {
            }
            column(DESIGNCaption; DESIGNCaptionLbl)
            {
            }
            column(MCHCaption; MCHCaptionLbl)
            {
            }
            column(MPRCaption; MPRCaptionLbl)
            {
            }
            column(PRODUCTION_1Caption; PRODUCTION_1CaptionLbl)
            {
            }
            column(PRODUCTION_2Caption; PRODUCTION_2CaptionLbl)
            {
            }
            column(PRODUCTION_3Caption; PRODUCTION_3CaptionLbl)
            {
            }
            column(PRODUCTION_4Caption; PRODUCTION_4CaptionLbl)
            {
            }
            column(PSDCaption; PSDCaptionLbl)
            {
            }
            column(QCCaption; QCCaptionLbl)
            {
            }
            column(RHWCaption; RHWCaptionLbl)
            {
            }
            column(SHFCaption; SHFCaptionLbl)
            {
            }
            column(STRCaption; STRCaptionLbl)
            {
            }
            column(WAIT_TIMECaption; WAIT_TIMECaptionLbl)
            {
            }
            column(Production_BOM_Header_No_; "No.")
            {
            }
            dataitem("<Routing Line1>"; "Routing Line")
            {
                DataItemLink = Routing No.=FIELD(No.);
                DataItemTableView = SORTING(Routing No., Version Code, Operation No.) ORDER(Ascending);
                column(Routing_Line1___Run_Time_; "Run Time")
                {
                }
                column(Routing_Line1___Run_Time__Control1102154036; "Run Time")
                {
                }
                column(Routing_Line1____Routing_Line1____Work_Center_No__; "<Routing Line1>"."Work Center No.")
                {
                }
                column(Routing_Line1___Operation_Description_; "Operation Description")
                {
                }
                column(Routing_Line1___Operation_No__; "Operation No.")
                {
                }
                column(TOT_BENCH_MARK_Control1102156061; TOT_BENCH_MARK)
                {
                }
                column(TOT_BENCH_MARK_Control1102154042; TOT_BENCH_MARK)
                {
                }
                column(Total_Bench_Mark_in_Min_Caption; Total_Bench_Mark_in_Min_CaptionLbl)
                {
                }
                column(Run_Time_in_Min_Caption; Run_Time_in_Min_CaptionLbl)
                {
                }
                column(DepartmentCaption; DepartmentCaptionLbl)
                {
                }
                column(Operation_DescriptionCaption; Operation_DescriptionCaptionLbl)
                {
                }
                column(Operation_No_Caption; Operation_No_CaptionLbl)
                {
                }
                column(Total_Bench_Mark_hh_mm_Caption; Total_Bench_Mark_hh_mm_CaptionLbl)
                {
                }
                column(Routing_Line1__Routing_No_; "Routing No.")
                {
                }
                column(Routing_Line1__Version_Code; "Version Code")
                {
                }
                column(Compound_BenchMark1; Compound_BenchMark1)
                {
                }
                column(TextVar; TextVar)
                {
                }

                trigger OnAfterGetRecord();
                begin
                    // <Routing Line1>, Body (2) - OnPreSection() >>
                    Compound_BenchMark += "Run Time";
                    IF STRLEN(FORMAT(ROUND("Run Time" MOD 60, 1))) = 1 THEN
                        MIN := '0' + FORMAT(ROUND("Run Time" MOD 60, 1))
                    ELSE
                        MIN := FORMAT(ROUND("Run Time" MOD 60, 1));
                    TOT_BENCH_MARK := FORMAT("Run Time" DIV 60) + ':' + MIN;



                    IF "<Routing Line1>".Description = 'MICRO PROCESSORS' THEN
                        Totals1[2] += "<Routing Line1>"."Run Time"
                    ELSE
                        IF "<Routing Line1>".Description = 'SHOP FLOOR' THEN
                            Totals1[4] += "<Routing Line1>"."Run Time"
                        ELSE
                            IF "<Routing Line1>".Description = 'QUALITY CONTROL' THEN
                                Totals1[3] += "<Routing Line1>"."Run Time"
                            ELSE
                                Totals1[1] += "<Routing Line1>"."Run Time";

                    IF "<Routing Line1>"."Work Center Group Code" = 'CDA' THEN
                        Totals[1] += "<Routing Line1>"."Run Time"
                    ELSE
                        IF "<Routing Line1>"."Work Center Group Code" = 'CHW' THEN
                            Totals[2] += "<Routing Line1>"."Run Time"
                        ELSE
                            IF "<Routing Line1>"."Work Center Group Code" = 'CSA' THEN
                                Totals[3] += "<Routing Line1>"."Run Time"
                            ELSE
                                IF "<Routing Line1>"."Work Center Group Code" = 'CSM' THEN
                                    Totals[4] += "<Routing Line1>"."Run Time"
                                ELSE
                                    IF "<Routing Line1>"."Work Center Group Code" = 'CST' THEN
                                        Totals[5] += "<Routing Line1>"."Run Time"
                                    ELSE
                                        IF "<Routing Line1>"."Work Center Group Code" = 'DES' THEN
                                            Totals[6] += "<Routing Line1>"."Run Time"
                                        ELSE
                                            IF "<Routing Line1>"."Work Center Group Code" = 'MCH' THEN
                                                Totals[7] += "<Routing Line1>"."Run Time"
                                            ELSE
                                                IF "<Routing Line1>"."Work Center Group Code" = 'MPR' THEN
                                                    Totals[8] += "<Routing Line1>"."Run Time"
                                                ELSE
                                                    IF "<Routing Line1>"."Work Center Group Code" = 'P1' THEN
                                                        Totals[9] += "<Routing Line1>"."Run Time"
                                                    ELSE
                                                        IF "<Routing Line1>"."Work Center Group Code" = 'P2' THEN
                                                            Totals[10] += "<Routing Line1>"."Run Time"
                                                        ELSE
                                                            IF "<Routing Line1>"."Work Center Group Code" = 'P3' THEN
                                                                Totals[11] += "<Routing Line1>"."Run Time"
                                                            ELSE
                                                                IF "<Routing Line1>"."Work Center Group Code" = 'P4' THEN
                                                                    Totals[12] += "<Routing Line1>"."Run Time"
                                                                ELSE
                                                                    IF "<Routing Line1>"."Work Center Group Code" = 'PSD' THEN
                                                                        Totals[13] += "<Routing Line1>"."Run Time"
                                                                    ELSE
                                                                        IF "<Routing Line1>"."Work Center Group Code" = 'QAS' THEN
                                                                            Totals[14] += "<Routing Line1>"."Run Time"
                                                                        ELSE
                                                                            IF "<Routing Line1>"."Work Center Group Code" = 'RHW' THEN
                                                                                Totals[15] += "<Routing Line1>"."Run Time"
                                                                            ELSE
                                                                                IF "<Routing Line1>"."Work Center Group Code" = 'SHF' THEN
                                                                                    Totals[16] += "<Routing Line1>"."Run Time"
                                                                                ELSE
                                                                                    IF "<Routing Line1>"."Work Center Group Code" = 'STR' THEN
                                                                                        Totals[17] += "<Routing Line1>"."Run Time"
                                                                                    ELSE
                                                                                        IF "<Routing Line1>"."Work Center Group Code" = 'WAIT TIME' THEN
                                                                                            Totals[18] += "<Routing Line1>"."Run Time"
                                                                                        ELSE
                                                                                            IF "<Routing Line1>"."Work Center Group Code" = 'OTHER DEPT' THEN BEGIN
                                                                                                Totals[19] += "<Routing Line1>"."Run Time";
                                                                                                Totals[21] += "<Routing Line1>"."Run Time";
                                                                                                Totals[22] += "<Routing Line1>"."Run Time";
                                                                                                Totals[23] += "<Routing Line1>"."Run Time";
                                                                                            END
                                                                                            ELSE
                                                                                                IF "<Routing Line1>"."Work Center Group Code" = 'OUT SOURCE' THEN // added by vishnu Priya on 15-05-2020 for the testing
                                                                                                    Totals[19] += "<Routing Line1>"."Run Time"
                                                                                                ELSE
                                                                                                    IF "<Routing Line1>"."Work Center Group Code" = 'DIS' THEN
                                                                                                        Totals[20] += "<Routing Line1>"."Run Time"
                                                                                                    ELSE
                                                                                                        IF "<Routing Line1>"."Work Center Group Code" = 'TCE' THEN
                                                                                                            Totals[24] += "<Routing Line1>"."Run Time"
                                                                                                        ELSE
                                                                                                            IF "<Routing Line1>"."Work Center Group Code" = 'TST' THEN
                                                                                                                Totals[25] += "<Routing Line1>"."Run Time"
                                                                                                            ELSE
                                                                                                                IF "<Routing Line1>"."Work Center Group Code" = 'WIR' THEN
                                                                                                                    Totals[26] += "<Routing Line1>"."Run Time"
                                                                                                                ELSE
                                                                                                                    Totals[9] += "<Routing Line1>"."Run Time";

                    CurrReport.SHOWOUTPUT(Choice = Choice::Detail);

                    IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                        Row += 1;
                        Entercell(Row, 1, "<Routing Line1>"."Operation No.", FALSE, TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row, 2, "<Routing Line1>"."Operation Description", FALSE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 3, "<Routing Line1>"."Work Center No.", FALSE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 4, FORMAT("<Routing Line1>"."Run Time"), FALSE, TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row, 5, FORMAT("<Routing Line1>"."Run Time"), FALSE, TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row, 6, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                        // EnterHeadings(Row,7,FORMAT("<Routing Line1>"."Run Time" DIV 60),TRUE,TempExcelbuffer."Cell Type" :: Number);


                    END;
                    // <Routing Line1>, Body (2) - OnPreSection() <<
                end;

                trigger OnPostDataItem();
                begin

                    // <Routing Line1>, Footer (3) - OnPreSection() >>
                    //Rev01

                    IF STRLEN(FORMAT(ROUND(Compound_BenchMark MOD 60, 1))) = 1 THEN
                        MIN := '0' + FORMAT(ROUND(Compound_BenchMark MOD 60, 1))
                    ELSE
                        MIN := FORMAT(ROUND(Compound_BenchMark MOD 60));
                    TOT_BENCH_MARK := FORMAT(Compound_BenchMark DIV 60) + ':' + MIN;

                    CurrReport.SHOWOUTPUT(Choice = Choice::Detail);
                    IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                        Row += 1;
                        Entercell(Row, 6, TOT_BENCH_MARK, TRUE, TempExcelbuffer."Cell Type"::Text);
                        // EnterHeadings(Row,7,FORMAT(Compound_BenchMark DIV 60),TRUE,TempExcelbuffer."Cell Type" :: Number);


                    END;
                    // <Routing Line1>, Footer (3) - OnPreSection() <<
                end;

                trigger OnPreDataItem();
                begin
                    // <Routing Line1>, Header (1) - OnPreSection() >>
                    CurrReport.SHOWOUTPUT(Choice = Choice::Detail);
                    IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                        Row += 1;
                        EnterHeadings(Row, 1, 'OPERATION No.', TRUE, TempExcelbuffer."Cell Type"::Text);
                        EnterHeadings(Row, 2, 'OPERATION DESCRIPTION', TRUE, TempExcelbuffer."Cell Type"::Text);
                        EnterHeadings(Row, 3, 'DEPARTMENT', TRUE, TempExcelbuffer."Cell Type"::Text);
                        EnterHeadings(Row, 4, 'BENCH MARK(IN MIN)', TRUE, TempExcelbuffer."Cell Type"::Text);
                        EnterHeadings(Row, 5, 'TOTAL BENCH MARK(IN MIN)', TRUE, TempExcelbuffer."Cell Type"::Text);
                        EnterHeadings(Row, 6, 'TOTAL BENCH MARK(IN HH::MM)', TRUE, TempExcelbuffer."Cell Type"::Text);
                        // EnterHeadings(Row,7,'TOTAL BENCH MARK(IN HH)',TRUE,TempExcelbuffer."Cell Type" :: Text);

                    END;
                    // <Routing Line1>, Header (1) - OnPreSection() <<
                end;
            }
            dataitem("Production BOM Line"; "Production BOM Line")
            {
                DataItemLink = Production BOM No.=FIELD(No.);
                DataItemTableView = SORTING(Production BOM No., Version Code, Line No.) ORDER(Ascending);
                PrintOnlyIfDetail = true;
                RequestFilterHeadingML =;
                column(Production_BOM_Line_Production_BOM_No_; "Production BOM No.")
                {
                }
                column(Production_BOM_Line_Version_Code; "Version Code")
                {
                }
                column(Production_BOM_Line_Line_No_; "Line No.")
                {
                }
                column(Production_BOM_Line_No_; "No.")
                {
                }
                dataitem("Routing Line"; "Routing Line")
                {
                    DataItemLink = Routing No.=FIELD(No.);
                    DataItemTableView = SORTING(Routing No., Version Code, Operation No.);
                    column(TOT_BENCH_MARK1; TOT_BENCH_MARK1)
                    {
                    }
                    column(Production_BOM_Line__Quantity; "Production BOM Line".Quantity)
                    {
                    }
                    column(Production_BOM_Line__Description; "Production BOM Line".Description)
                    {
                    }
                    column(Routing_Line__Operation_No__; "Operation No.")
                    {
                    }
                    column(Routing_Line__Operation_Description_; "Operation Description")
                    {
                    }
                    column(Routing_Line__Routing_Line___Work_Center_No__; "Routing Line"."Work Center No.")
                    {
                    }
                    column(Routing_Line__Run_Time_; "Run Time")
                    {
                    }
                    column(Production_BOM_Line__Quantity__Run_Time_; "Production BOM Line".Quantity * "Run Time")
                    {
                    }
                    column(TOT_BENCH_MARK_Control1102156062; TOT_BENCH_MARK)
                    {
                    }
                    column(TOT_BENCH_MARK_Control1000000027; TOT_BENCH_MARK)
                    {
                    }
                    column(QuantityCaption; QuantityCaptionLbl)
                    {
                    }
                    column(Production_BomCaption_Control1000000016; Production_BomCaption_Control1000000016Lbl)
                    {
                    }
                    column(Routing_Line__Operation_No__Caption; FIELDCAPTION("Operation No."))
                    {
                    }
                    column(Routing_Line__Operation_Description_Caption; FIELDCAPTION("Operation Description"))
                    {
                    }
                    column(DepartmentCaption_Control1000000020; DepartmentCaption_Control1000000020Lbl)
                    {
                    }
                    column(Run_Time_in_Min_Caption_Control1000000022; Run_Time_in_Min_Caption_Control1000000022Lbl)
                    {
                    }
                    column(Total_Bench_Mark_in_Min_Caption_Control1000000025; Total_Bench_Mark_in_Min_Caption_Control1000000025Lbl)
                    {
                    }
                    column(Total_Bench_Mark_hh_mm_Caption_Control1102156059; Total_Bench_Mark_hh_mm_Caption_Control1102156059Lbl)
                    {
                    }
                    column(Routing_Line_Routing_No_; "Routing No.")
                    {
                    }
                    column(Routing_Line_Version_Code; "Version Code")
                    {
                    }

                    trigger OnAfterGetRecord();
                    begin
                        IF Level2Print THEN BEGIN
                            // Routing Line, Header (1) - OnPreSection() >>
                            CurrReport.SHOWOUTPUT(Choice = Choice::Detail);
                            IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                                Row += 1;
                                EnterHeadings(Row, 1, 'Level 2', TRUE, TempExcelbuffer."Cell Type"::Text);

                                Row += 1;
                                EnterHeadings(Row, 1, 'PRODUCTION BOM', TRUE, TempExcelbuffer."Cell Type"::Text);
                                Entercell(Row, 2, "Production BOM Line".Description, FALSE, TempExcelbuffer."Cell Type"::Text);
                                EnterHeadings(Row, 3, 'QUANTITY', TRUE, TempExcelbuffer."Cell Type"::Text);
                                Entercell(Row, 4, FORMAT("Production BOM Line".Quantity), FALSE, TempExcelbuffer."Cell Type"::Number);

                            END;
                            // Routing Line, Header (1) - OnPreSection() <<

                            // Routing Line, Header (2) - OnPreSection() >>

                            CurrReport.SHOWOUTPUT(Choice = Choice::Detail);
                            IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                                Row += 1;
                                EnterHeadings(Row, 1, 'OPERATION No.', TRUE, TempExcelbuffer."Cell Type"::Text);
                                EnterHeadings(Row, 2, 'OPERATION DESCRIPTION', TRUE, TempExcelbuffer."Cell Type"::Text);
                                EnterHeadings(Row, 3, 'DEPARTMENT', TRUE, TempExcelbuffer."Cell Type"::Text);
                                EnterHeadings(Row, 4, 'BENCH MARK(IN MIN)', TRUE, TempExcelbuffer."Cell Type"::Text);
                                EnterHeadings(Row, 5, 'TOTAL BENCH MARK(IN MIN)', TRUE, TempExcelbuffer."Cell Type"::Text);
                                EnterHeadings(Row, 6, 'TOTAL BENCH MARK(IN HH::MM)', TRUE, TempExcelbuffer."Cell Type"::Text);
                                //EnterHeadings(Row,7,'TOTAL BENCH MARK(IN HH)',TRUE,TempExcelbuffer."Cell Type" :: Text);

                            END;
                            // Routing Line, Header (2) - OnPreSection() <<
                            Level2Print := FALSE;
                        END;





                        // Routing Line, Body (3) - OnPreSection() >>
                        Compound_BenchMark += "Production BOM Line".Quantity * "Routing Line"."Run Time";
                        IF STRLEN(FORMAT(ROUND("Production BOM Line".Quantity * "Routing Line"."Run Time" MOD 60, 1))) = 1 THEN
                            MIN := '0' + FORMAT(ROUND("Production BOM Line".Quantity * "Routing Line"."Run Time" MOD 60, 1))
                        ELSE
                            MIN := FORMAT(ROUND("Production BOM Line".Quantity * "Routing Line"."Run Time" MOD 60, 1));
                        TOT_BENCH_MARK := FORMAT("Production BOM Line".Quantity * "Routing Line"."Run Time" DIV 60) + ':' + MIN;

                        //EVALUATE(TOT_BENCH_MARK1,TOT_BENCH_MARK); commented by swathi on 20-sep-13



                        //ADSK
                        //{
                        //IF "Production BOM Line".Description = 'ISO-232 VER1.0 CONVERTER-8WIRE' THEN
                        // MESSAGE('%1--%2--%3',SS,ss1,TOT_BENCH_MARK1);  //ADSK
                        //}

                        IF "Routing Line".Description = 'MICRO PROCESSORS' THEN
                            Totals1[2] += "Production BOM Line".Quantity * "Routing Line"."Run Time"
                        ELSE
                            IF "Routing Line".Description = 'SHOP FLOOR' THEN
                                Totals1[4] += "Production BOM Line".Quantity * "Routing Line"."Run Time"
                            ELSE
                                IF "Routing Line".Description = 'QUALITY CONTROL' THEN
                                    Totals1[3] += "Production BOM Line".Quantity * "Routing Line"."Run Time"
                                ELSE
                                    Totals1[1] += "Production BOM Line".Quantity * "Routing Line"."Run Time";

                        IF "Routing Line"."Work Center Group Code" = 'CDA' THEN
                            Totals[1] += "Production BOM Line".Quantity * "Routing Line"."Run Time"
                        ELSE
                            IF "Routing Line"."Work Center Group Code" = 'CHW' THEN
                                Totals[2] += "Production BOM Line".Quantity * "Routing Line"."Run Time"
                            ELSE
                                IF "Routing Line"."Work Center Group Code" = 'CSA' THEN
                                    Totals[3] += "Production BOM Line".Quantity * "Routing Line"."Run Time"
                                ELSE
                                    IF "Routing Line"."Work Center Group Code" = 'CSM' THEN
                                        Totals[4] += "Production BOM Line".Quantity * "Routing Line"."Run Time"
                                    ELSE
                                        IF "Routing Line"."Work Center Group Code" = 'CST' THEN
                                            Totals[5] += "Production BOM Line".Quantity * "Routing Line"."Run Time"
                                        ELSE
                                            IF "Routing Line"."Work Center Group Code" = 'DES' THEN
                                                Totals[6] += "Production BOM Line".Quantity * "Routing Line"."Run Time"
                                            ELSE
                                                IF "Routing Line"."Work Center Group Code" = 'MCH' THEN
                                                    Totals[7] += "Production BOM Line".Quantity * "Routing Line"."Run Time"
                                                ELSE
                                                    IF "Routing Line"."Work Center Group Code" = 'MPR' THEN
                                                        Totals[8] += "Production BOM Line".Quantity * "Routing Line"."Run Time"
                                                    ELSE
                                                        IF "Routing Line"."Work Center Group Code" = 'P1' THEN
                                                            Totals[9] += "Production BOM Line".Quantity * "Routing Line"."Run Time"
                                                        ELSE
                                                            IF "Routing Line"."Work Center Group Code" = 'P2' THEN
                                                                Totals[10] += "Production BOM Line".Quantity * "Routing Line"."Run Time"
                                                            ELSE
                                                                IF "Routing Line"."Work Center Group Code" = 'P3' THEN
                                                                    Totals[11] += "Production BOM Line".Quantity * "Routing Line"."Run Time"
                                                                ELSE
                                                                    IF "Routing Line"."Work Center Group Code" = 'P4' THEN
                                                                        Totals[12] += "Production BOM Line".Quantity * "Routing Line"."Run Time"
                                                                    ELSE
                                                                        IF "Routing Line"."Work Center Group Code" = 'PSD' THEN
                                                                            Totals[13] += "Production BOM Line".Quantity * "Routing Line"."Run Time"
                                                                        ELSE
                                                                            IF "Routing Line"."Work Center Group Code" = 'QAS' THEN
                                                                                Totals[14] += "Production BOM Line".Quantity * "Routing Line"."Run Time"
                                                                            ELSE
                                                                                IF "Routing Line"."Work Center Group Code" = 'RHW' THEN
                                                                                    Totals[15] += "Production BOM Line".Quantity * "Routing Line"."Run Time"
                                                                                ELSE
                                                                                    IF "Routing Line"."Work Center Group Code" = 'SHF' THEN
                                                                                        Totals[16] += "Production BOM Line".Quantity * "Routing Line"."Run Time"
                                                                                    ELSE
                                                                                        IF "Routing Line"."Work Center Group Code" = 'STR' THEN
                                                                                            Totals[17] += "Production BOM Line".Quantity * "Routing Line"."Run Time"
                                                                                        ELSE
                                                                                            IF "Routing Line"."Work Center Group Code" = 'WAIT TIME' THEN
                                                                                                Totals[18] += "Production BOM Line".Quantity * "Routing Line"."Run Time"
                                                                                            ELSE
                                                                                                IF "Routing Line"."Work Center Group Code" = 'OTHER DEPT' THEN BEGIN
                                                                                                    Totals[19] += "Production BOM Line".Quantity * "Routing Line"."Run Time";
                                                                                                    Totals[21] += "Production BOM Line".Quantity * "Routing Line"."Run Time";
                                                                                                    Totals[22] += "Production BOM Line".Quantity * "Routing Line"."Run Time";
                                                                                                    Totals[23] += "Production BOM Line".Quantity * "Routing Line"."Run Time";
                                                                                                END
                                                                                                ELSE
                                                                                                    IF "Routing Line"."Work Center Group Code" = 'OUT SOURCE' THEN // added by vishnu on 15-05-2020
                                                                                                        Totals[19] += "Production BOM Line".Quantity * "Routing Line"."Run Time"
                                                                                                    ELSE
                                                                                                        IF "Routing Line"."Work Center Group Code" = 'DIS' THEN
                                                                                                            Totals[20] += "Production BOM Line".Quantity * "Routing Line"."Run Time"
                                                                                                        ELSE
                                                                                                            IF "Routing Line"."Work Center Group Code" = 'TCE' THEN
                                                                                                                Totals[24] += "Production BOM Line".Quantity * "Routing Line"."Run Time"
                                                                                                            ELSE
                                                                                                                IF "Routing Line"."Work Center Group Code" = 'TST' THEN
                                                                                                                    Totals[25] += "Production BOM Line".Quantity * "Routing Line"."Run Time"
                                                                                                                ELSE
                                                                                                                    IF "Routing Line"."Work Center Group Code" = 'WIR' THEN
                                                                                                                        Totals[26] += "Production BOM Line".Quantity * "Routing Line"."Run Time"
                                                                                                                    ELSE
                                                                                                                        Totals[9] += "Production BOM Line".Quantity * "Routing Line"."Run Time";


                        CurrReport.SHOWOUTPUT(Choice = Choice::Detail);

                        IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                            Level2 := TRUE;
                            Row += 1;
                            Entercell(Row, 1, "Routing Line"."Operation No.", FALSE, TempExcelbuffer."Cell Type"::Number);
                            Entercell(Row, 2, "Routing Line"."Operation Description", FALSE, TempExcelbuffer."Cell Type"::Text);
                            Entercell(Row, 3, "Routing Line"."Work Center No.", FALSE, TempExcelbuffer."Cell Type"::Text);
                            Entercell(Row, 4, FORMAT("Routing Line"."Run Time"), FALSE, TempExcelbuffer."Cell Type"::Number);
                            Entercell(Row, 5, FORMAT("Production BOM Line".Quantity * "Routing Line"."Run Time"), FALSE, TempExcelbuffer."Cell Type"::Number);
                            Entercell(Row, 6, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                            // EnterHeadings(Row,7,FORMAT("Run Time" DIV 60),TRUE,TempExcelbuffer."Cell Type" :: Number);


                        END;
                        // Routing Line, Body (3) - OnPreSection() <<
                    end;

                    trigger OnPostDataItem();
                    begin
                        // Routing Line, Footer (4) - OnPreSection()
                        IF Level2 THEN BEGIN

                            IF STRLEN(FORMAT(ROUND(Compound_BenchMark MOD 60, 1))) = 1 THEN
                                MIN := '0' + FORMAT(ROUND(Compound_BenchMark MOD 60, 1))
                            ELSE
                                MIN := FORMAT(ROUND(Compound_BenchMark MOD 60, 1));
                            TOT_BENCH_MARK := FORMAT(Compound_BenchMark DIV 60) + ':' + MIN;


                            CurrReport.SHOWOUTPUT(Choice = Choice::Detail);
                            IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                                Row += 1;
                                Entercell(Row, 6, TOT_BENCH_MARK, TRUE, TempExcelbuffer."Cell Type"::Text);
                                //EnterHeadings(Row,7,FORMAT(Compound_BenchMark DIV 60),TRUE,TempExcelbuffer."Cell Type" :: Number);

                            END
                        END;//added if swathi 23-sep-13
                        Level2 := FALSE;
                        // Routing Line, Footer (4) - OnPreSection() <<
                    end;

                    trigger OnPreDataItem();
                    begin
                        /*// Routing Line, Header (1) - OnPreSection() >>
                           CurrReport.SHOWOUTPUT(Choice=Choice::Detail);
                          IF EXCEL AND (Choice=Choice::Detail) THEN
                          BEGIN
                            Row+=1;
                            EnterHeadings(Row,1,'Level 2',TRUE,TempExcelbuffer."Cell Type" :: Text);
                        
                            Row+=1;
                            EnterHeadings(Row,1,'PRODUCTION BOM',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            Entercell(Row,2,"Production BOM Line".Description,FALSE,TempExcelbuffer."Cell Type" :: Text);
                            EnterHeadings(Row,3,'QUANTITY',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            Entercell(Row,4,FORMAT("Production BOM Line".Quantity),FALSE,TempExcelbuffer."Cell Type" :: Number);
                        
                          END;
                        // Routing Line, Header (1) - OnPreSection() <<
                        
                        // Routing Line, Header (2) - OnPreSection() >>
                        
                          CurrReport.SHOWOUTPUT(Choice=Choice::Detail);
                          IF EXCEL AND (Choice=Choice::Detail) THEN
                          BEGIN
                            Row+=1;
                            EnterHeadings(Row,1,'OPERATION No.',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            EnterHeadings(Row,2,'OPERATION DESCRIPTION',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            EnterHeadings(Row,3,'DEPARTMENT',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            EnterHeadings(Row,4,'BENCH MARK(IN MIN)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            EnterHeadings(Row,5,'TOTAL BENCH MARK(IN MIN)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            EnterHeadings(Row,6,'TOTAL BENCH MARK(IN HH::MM)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                         // EnterHeadings(Row,7,'TOTAL BENCH MARK(IN HH)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                        
                          END;  */
                        // Routing Line, Header (2) - OnPreSection() <<
                        Level2Print := TRUE;

                    end;
                }
                dataitem("<Production BOM Line2>"; "Production BOM Line")
                {
                    DataItemLink = Production BOM No.=FIELD(No.);
                    DataItemTableView = SORTING(Production BOM No., Version Code, Line No.);
                    PrintOnlyIfDetail = true;
                    column(Production_BOM_Line2__Production_BOM_No_; "Production BOM No.")
                    {
                    }
                    column(Production_BOM_Line2__Version_Code; "Version Code")
                    {
                    }
                    column(Production_BOM_Line2__Line_No_; "Line No.")
                    {
                    }
                    column(Production_BOM_Line2__No_; "No.")
                    {
                    }
                    dataitem("<Routing Line2>"; "Routing Line")
                    {
                        DataItemLink = Routing No.=FIELD(No.);
                        DataItemTableView = SORTING(Routing No., Version Code, Operation No.);
                        column(Production_BOM_Line2___Quantity; "<Production BOM Line2>".Quantity)
                        {
                        }
                        column(Production_BOM_Line2___Description; "<Production BOM Line2>".Description)
                        {
                        }
                        column(Production_BOM_Line2___Quantity__Run_Time_; "<Production BOM Line2>".Quantity * "Run Time")
                        {
                        }
                        column(Routing_Line2___Run_Time_; "Run Time")
                        {
                        }
                        column(Routing_Line2____Routing_Line2____Work_Center_No__; "<Routing Line2>"."Work Center No.")
                        {
                        }
                        column(Routing_Line2___Operation_Description_; "Operation Description")
                        {
                        }
                        column(Routing_Line2___Operation_No__; "Operation No.")
                        {
                        }
                        column(TOT_BENCH_MARK_Control1102156063; TOT_BENCH_MARK)
                        {
                        }
                        column(TOT_BENCH_MARK_Control1102154043; TOT_BENCH_MARK)
                        {
                        }
                        column(QuantityCaption_Control1102154054; QuantityCaption_Control1102154054Lbl)
                        {
                        }
                        column(Production_BomCaption_Control1102154056; Production_BomCaption_Control1102154056Lbl)
                        {
                        }
                        column(Total_Bench_Mark_in_Min_Caption_Control1102154047; Total_Bench_Mark_in_Min_Caption_Control1102154047Lbl)
                        {
                        }
                        column(Run_Time_in_Min_Caption_Control1102154049; Run_Time_in_Min_Caption_Control1102154049Lbl)
                        {
                        }
                        column(DepartmentCaption_Control1102154050; DepartmentCaption_Control1102154050Lbl)
                        {
                        }
                        column(Operation_DescriptionCaption_Control1102154051; Operation_DescriptionCaption_Control1102154051Lbl)
                        {
                        }
                        column(Operation_No_Caption_Control1102154052; Operation_No_Caption_Control1102154052Lbl)
                        {
                        }
                        column(Total_Bench_Mark_hh_mm_Caption_Control1102156060; Total_Bench_Mark_hh_mm_Caption_Control1102156060Lbl)
                        {
                        }
                        column(Routing_Line2__Routing_No_; "Routing No.")
                        {
                        }
                        column(Routing_Line2__Version_Code; "Version Code")
                        {
                        }

                        trigger OnAfterGetRecord();
                        begin
                            IF Level3Print THEN BEGIN
                                // <Routing Line2>, Header (1) - OnPreSection() >>
                                CurrReport.SHOWOUTPUT(Choice = Choice::Detail);
                                IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                                    Row += 1;
                                    EnterHeadings(Row, 1, 'Level 3', TRUE, TempExcelbuffer."Cell Type"::Text);

                                    Row += 1;
                                    EnterHeadings(Row, 1, 'PRODUCTION BOM', TRUE, TempExcelbuffer."Cell Type"::Text);
                                    Entercell(Row, 2, "<Production BOM Line2>".Description, FALSE, TempExcelbuffer."Cell Type"::Text);
                                    EnterHeadings(Row, 3, 'QUANTITY', TRUE, TempExcelbuffer."Cell Type"::Text);
                                    Entercell(Row, 4, FORMAT("Production BOM Line".Quantity * "<Production BOM Line2>".Quantity), FALSE, TempExcelbuffer."Cell Type"::Number);

                                END;
                                // <Routing Line2>, Header (1) - OnPreSection() <<

                                // <Routing Line2>, Header (2) - OnPreSection() >>
                                Compound_BenchMark := 0;
                                CurrReport.SHOWOUTPUT(Choice = Choice::Detail);
                                IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                                    Row += 1;
                                    EnterHeadings(Row, 1, 'OPERATION No.', TRUE, TempExcelbuffer."Cell Type"::Text);
                                    EnterHeadings(Row, 2, 'OPERATION DESCRIPTION', TRUE, TempExcelbuffer."Cell Type"::Text);
                                    EnterHeadings(Row, 3, 'DEPARTMENT', TRUE, TempExcelbuffer."Cell Type"::Text);
                                    EnterHeadings(Row, 4, 'BENCH MARK(IN MIN)', TRUE, TempExcelbuffer."Cell Type"::Text);
                                    EnterHeadings(Row, 5, 'TOTAL BENCH MARK(IN MIN)', TRUE, TempExcelbuffer."Cell Type"::Text);
                                    EnterHeadings(Row, 6, 'TOTAL BENCH MARK(IN HH::MM)', TRUE, TempExcelbuffer."Cell Type"::Text);
                                    //EnterHeadings(Row,7,'TOTAL BENCH MARK(IN HH)',TRUE,TempExcelbuffer."Cell Type" :: Text);

                                END;
                                Level3Print := FALSE;
                                // <Routing Line2>, Header (2) - OnPreSection() <<
                            END;


                            Compound_BenchMark += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "Run Time";
                            IF STRLEN(FORMAT(ROUND("Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "Run Time" MOD 60, 1))) = 1 THEN
                                MIN := '0' + FORMAT(ROUND("Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "Run Time" MOD 60, 1))
                            ELSE
                                MIN := FORMAT(ROUND("Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "Run Time" MOD 60, 1));
                            TOT_BENCH_MARK := FORMAT("Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "Run Time" DIV 60, 1) + ':' + MIN;


                            IF "<Routing Line2>".Description = 'MICRO PROCESSORS' THEN
                                Totals1[2] += "<Production BOM Line2>".Quantity * "<Routing Line2>"."Run Time"
                            ELSE
                                IF "<Routing Line2>".Description = 'SHOP FLOOR' THEN
                                    Totals1[4] += "<Production BOM Line2>".Quantity * "<Routing Line2>"."Run Time"
                                ELSE
                                    IF "<Routing Line2>".Description = 'QUALITY CONTROL' THEN
                                        Totals1[3] += "<Production BOM Line2>".Quantity * "<Routing Line2>"."Run Time"
                                    ELSE
                                        Totals1[1] += "<Production BOM Line2>".Quantity * "<Routing Line2>"."Run Time";

                            IF "<Routing Line2>"."Work Center Group Code" = 'CDA' THEN
                                Totals[1] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Routing Line2>"."Run Time"
                            ELSE
                                IF "<Routing Line2>"."Work Center Group Code" = 'CHW' THEN
                                    Totals[2] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Routing Line2>"."Run Time"
                                ELSE
                                    IF "<Routing Line2>"."Work Center Group Code" = 'CSA' THEN
                                        Totals[3] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Routing Line2>"."Run Time"
                                    ELSE
                                        IF "<Routing Line2>"."Work Center Group Code" = 'CSM' THEN
                                            Totals[4] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Routing Line2>"."Run Time"
                                        ELSE
                                            IF "<Routing Line2>"."Work Center Group Code" = 'CST' THEN
                                                Totals[5] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Routing Line2>"."Run Time"
                                            ELSE
                                                IF "<Routing Line2>"."Work Center Group Code" = 'DES' THEN
                                                    Totals[6] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Routing Line2>"."Run Time"
                                                ELSE
                                                    IF "<Routing Line2>"."Work Center Group Code" = 'MCH' THEN
                                                        Totals[7] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Routing Line2>"."Run Time"
                                                    ELSE
                                                        IF "<Routing Line2>"."Work Center Group Code" = 'MPR' THEN
                                                            Totals[8] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Routing Line2>"."Run Time"
                                                        ELSE
                                                            IF "<Routing Line2>"."Work Center Group Code" = 'P1' THEN
                                                                Totals[9] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Routing Line2>"."Run Time"
                                                            ELSE
                                                                IF "<Routing Line2>"."Work Center Group Code" = 'P2' THEN
                                                                    Totals[10] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Routing Line2>"."Run Time"
                                                                ELSE
                                                                    IF "<Routing Line2>"."Work Center Group Code" = 'P3' THEN
                                                                        Totals[11] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Routing Line2>"."Run Time"
                                                                    ELSE
                                                                        IF "<Routing Line2>"."Work Center Group Code" = 'P4' THEN
                                                                            Totals[12] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Routing Line2>"."Run Time"
                                                                        ELSE
                                                                            IF "<Routing Line2>"."Work Center Group Code" = 'PSD' THEN
                                                                                Totals[13] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Routing Line2>"."Run Time"
                                                                            ELSE
                                                                                IF "<Routing Line2>"."Work Center Group Code" = 'QAS' THEN
                                                                                    Totals[14] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Routing Line2>"."Run Time"
                                                                                ELSE
                                                                                    IF "<Routing Line2>"."Work Center Group Code" = 'RHW' THEN
                                                                                        Totals[15] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Routing Line2>"."Run Time"
                                                                                    ELSE
                                                                                        IF "<Routing Line2>"."Work Center Group Code" = 'SHF' THEN
                                                                                            Totals[16] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Routing Line2>"."Run Time"
                                                                                        ELSE
                                                                                            IF "<Routing Line2>"."Work Center Group Code" = 'STR' THEN
                                                                                                Totals[17] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Routing Line2>"."Run Time"
                                                                                            ELSE
                                                                                                IF "<Routing Line2>"."Work Center Group Code" = 'WAIT TIME' THEN
                                                                                                    Totals[18] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Routing Line2>"."Run Time"
                                                                                                ELSE
                                                                                                    IF "<Routing Line2>"."Work Center Group Code" = 'OTHER DEPT' THEN BEGIN
                                                                                                        Totals[19] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Routing Line2>"."Run Time";
                                                                                                        Totals[21] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Routing Line2>"."Run Time";
                                                                                                        Totals[22] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Routing Line2>"."Run Time";
                                                                                                        Totals[23] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Routing Line2>"."Run Time";
                                                                                                    END
                                                                                                    ELSE
                                                                                                        IF "<Routing Line2>"."Work Center Group Code" = 'OUT SOURCE' THEN //ADDED BY VISHNU PRIYA ON 15-05-2020
                                                                                                            Totals[19] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Routing Line2>"."Run Time"
                                                                                                        ELSE
                                                                                                            IF "<Routing Line2>"."Work Center Group Code" = 'DIS' THEN
                                                                                                                Totals[20] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Routing Line2>"."Run Time"
                                                                                                            ELSE
                                                                                                                IF "<Routing Line2>"."Work Center Group Code" = 'TCE' THEN
                                                                                                                    Totals[24] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Routing Line2>"."Run Time"
                                                                                                                ELSE
                                                                                                                    IF "<Routing Line2>"."Work Center Group Code" = 'TST' THEN
                                                                                                                        Totals[25] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Routing Line2>"."Run Time"
                                                                                                                    ELSE
                                                                                                                        IF "<Routing Line2>"."Work Center Group Code" = 'WIR' THEN
                                                                                                                            Totals[26] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Routing Line2>"."Run Time"
                                                                                                                        ELSE
                                                                                                                            Totals[9] += "<Production BOM Line2>".Quantity * "<Routing Line2>"."Run Time";

                            CurrReport.SHOWOUTPUT(Choice = Choice::Detail);

                            // <Routing Line2>, Body (3) - OnPreSection() >>
                            IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                                Level3 := TRUE;
                                Row += 1;
                                Entercell(Row, 1, "<Routing Line2>"."Operation No.", FALSE, TempExcelbuffer."Cell Type"::Number);
                                Entercell(Row, 2, "<Routing Line2>"."Operation Description", FALSE, TempExcelbuffer."Cell Type"::Text);
                                Entercell(Row, 3, "<Routing Line2>"."Work Center No.", FALSE, TempExcelbuffer."Cell Type"::Text);
                                Entercell(Row, 4, FORMAT("<Routing Line2>"."Run Time"), FALSE, TempExcelbuffer."Cell Type"::Number);
                                Entercell(Row, 5, FORMAT("Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Routing Line2>"."Run Time"), FALSE, TempExcelbuffer."Cell Type"::Number);
                                Entercell(Row, 6, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                                // EnterHeadings(Row,7,FORMAT("Run Time" DIV 60),TRUE,TempExcelbuffer."Cell Type" :: Number);


                            END;
                            // <Routing Line2>, Body (3) - OnPreSection() <<
                        end;

                        trigger OnPostDataItem();
                        begin
                            // <Routing Line2>, Footer (4) - OnPreSection() >>
                            IF Level3 THEN BEGIN
                                IF STRLEN(FORMAT(ROUND(Compound_BenchMark MOD 60, 1))) = 1 THEN
                                    MIN := '0' + FORMAT(ROUND(Compound_BenchMark MOD 60, 1))
                                ELSE
                                    MIN := FORMAT(ROUND(Compound_BenchMark MOD 60, 1));
                                TOT_BENCH_MARK := FORMAT(Compound_BenchMark DIV 60) + ':' + MIN;

                                CurrReport.SHOWOUTPUT(Choice = Choice::Detail);
                                IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                                    Row += 1;
                                    Entercell(Row, 6, TOT_BENCH_MARK, TRUE, TempExcelbuffer."Cell Type"::Text);
                                    // EnterHeadings(Row,7,FORMAT(Compound_BenchMark DIV 60),TRUE,TempExcelbuffer."Cell Type" :: Number);

                                END
                            END;
                            Level3 := FALSE;
                            //addded IF swathi
                            // <Routing Line2>, Footer (4) - OnPreSection() <<
                        end;

                        trigger OnPreDataItem();
                        begin
                            /*
                            // <Routing Line2>, Header (1) - OnPreSection() >>
                              CurrReport.SHOWOUTPUT(Choice=Choice::Detail);
                              IF EXCEL AND (Choice=Choice::Detail) THEN
                              BEGIN
                                Row+=1;
                                EnterHeadings(Row,1,'Level 3',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            
                                Row+=1;
                                EnterHeadings(Row,1,'PRODUCTION BOM',TRUE,TempExcelbuffer."Cell Type" :: Text);
                                Entercell(Row,2,"<Production BOM Line2>".Description,FALSE,TempExcelbuffer."Cell Type" :: Text);
                                EnterHeadings(Row,3,'QUANTITY',TRUE,TempExcelbuffer."Cell Type" :: Text);
                                Entercell(Row,4,FORMAT("<Production BOM Line2>".Quantity),FALSE,TempExcelbuffer."Cell Type" :: Number);
                            
                              END;
                            // <Routing Line2>, Header (1) - OnPreSection() <<
                            
                            // <Routing Line2>, Header (2) - OnPreSection() >>
                              Compound_BenchMark:=0;
                              CurrReport.SHOWOUTPUT(Choice=Choice::Detail);
                              IF EXCEL AND (Choice=Choice::Detail) THEN
                              BEGIN
                                Row+=1;
                                EnterHeadings(Row,1,'OPERATION No.',TRUE,TempExcelbuffer."Cell Type" :: Text);
                                EnterHeadings(Row,2,'OPERATION DESCRIPTION',TRUE,TempExcelbuffer."Cell Type" :: Text);
                                EnterHeadings(Row,3,'DEPARTMENT',TRUE,TempExcelbuffer."Cell Type" :: Text);
                                EnterHeadings(Row,4,'BENCH MARK(IN MIN)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                                EnterHeadings(Row,5,'TOTAL BENCH MARK(IN MIN)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                                EnterHeadings(Row,6,'TOTAL BENCH MARK(IN HH::MM)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                              //EnterHeadings(Row,7,'TOTAL BENCH MARK(IN HH)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            
                              END;
                            // <Routing Line2>, Header (2) - OnPreSection() <<
                                         //swathi
                            */
                            Level3Print := TRUE;

                        end;
                    }
                    dataitem("<Production BOM Line3>"; "Production BOM Line")
                    {
                        DataItemLink = Production BOM No.=FIELD(No.);
                        DataItemLinkReference = "<Production BOM Line2>";
                        DataItemTableView = SORTING(Production BOM No., Version Code, Line No.);
                        column(Production_BOM_Line3_Production_BOM_No_; "Production BOM Line"."Production BOM No.")
                        {
                        }
                        column(Production_BOM_Line3__Version_Code; "Production BOM Line"."Version Code")
                        {
                        }
                        column(Production_BOM_Line3__Line_No_; "Production BOM Line"."Line No.")
                        {
                        }
                        column(Production_BOM_Line3__No_; "Production BOM Line"."No.")
                        {
                        }
                        dataitem("<Routing Line3>"; "Routing Line")
                        {
                            DataItemLink = Routing No.=FIELD(No.);
                            DataItemTableView = SORTING(Routing No., Version Code, Operation No.);
                            column(Production_BOM_Line3___Quantity; "<Production BOM Line2>".Quantity)
                            {
                            }
                            column(Production_BOM_Line3___Description; "<Production BOM Line2>".Description)
                            {
                            }
                            column(Routing_Line3___Run_Time_; "Run Time")
                            {
                            }
                            column(Routing_Line3____Routing_Line3____Work_Center_No__; "<Routing Line2>"."Work Center No.")
                            {
                            }
                            column(Routing_Line3___Operation_Description_; "Operation Description")
                            {
                            }
                            column(Routing_Line3___Operation_No__; "Operation No.")
                            {
                            }
                            column(TOT_BENCH_MARK_Control1102156064; TOT_BENCH_MARK)
                            {
                            }
                            column(TOT_BENCH_MARK_Control1102154044; TOT_BENCH_MARK)
                            {
                            }
                            column(QuantityCaption_Control1102154055; QuantityCaption_Control1102154054Lbl)
                            {
                            }
                            column(Production_BomCaption_Control1102154057; Production_BomCaption_Control1102154056Lbl)
                            {
                            }
                            column(Total_Bench_Mark_in_Min_Caption_Control1102154048; Total_Bench_Mark_in_Min_Caption_Control1102154047Lbl)
                            {
                            }
                            column(Run_Time_in_Min_Caption_Control1102154050; Run_Time_in_Min_Caption_Control1102154049Lbl)
                            {
                            }
                            column(DepartmentCaption_Control1102154051; DepartmentCaption_Control1102154050Lbl)
                            {
                            }
                            column(Operation_DescriptionCaption_Control1102154052; Operation_DescriptionCaption_Control1102154051Lbl)
                            {
                            }
                            column(Operation_No_Caption_Control1102154053; Operation_No_Caption_Control1102154052Lbl)
                            {
                            }
                            column(Total_Bench_Mark_hh_mm_Caption_Control1102156061; Total_Bench_Mark_hh_mm_Caption_Control1102156060Lbl)
                            {
                            }
                            column(Routing_Line3__Routing_No_; "Routing No.")
                            {
                            }
                            column(Routing_Line3__Version_Code; "Version Code")
                            {
                            }

                            trigger OnAfterGetRecord();
                            begin
                                IF Level4Print THEN BEGIN
                                    // <Routing Line3>, Header (1) - OnPreSection() >>
                                    CurrReport.SHOWOUTPUT(Choice = Choice::Detail);
                                    IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                                        Row += 1;
                                        EnterHeadings(Row, 1, 'Level 4', TRUE, TempExcelbuffer."Cell Type"::Text);

                                        Row += 1;
                                        EnterHeadings(Row, 1, 'PRODUCTION BOM', TRUE, TempExcelbuffer."Cell Type"::Text);
                                        Entercell(Row, 2, "<Production BOM Line3>".Description, FALSE, TempExcelbuffer."Cell Type"::Text);
                                        EnterHeadings(Row, 3, 'QUANTITY', TRUE, TempExcelbuffer."Cell Type"::Text);
                                        Entercell(Row, 4, FORMAT("Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Production BOM Line3>".Quantity), FALSE, TempExcelbuffer."Cell Type"::Number);

                                    END;
                                    // <Routing Line3>, Header (1) - OnPreSection() <<

                                    // <Routing Line3>, Header (2) - OnPreSection() >>
                                    Compound_BenchMark := 0;
                                    CurrReport.SHOWOUTPUT(Choice = Choice::Detail);
                                    IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                                        Row += 1;
                                        EnterHeadings(Row, 1, 'OPERATION No.', TRUE, TempExcelbuffer."Cell Type"::Text);
                                        EnterHeadings(Row, 2, 'OPERATION DESCRIPTION', TRUE, TempExcelbuffer."Cell Type"::Text);
                                        EnterHeadings(Row, 3, 'DEPARTMENT', TRUE, TempExcelbuffer."Cell Type"::Text);
                                        EnterHeadings(Row, 4, 'BENCH MARK(IN MIN)', TRUE, TempExcelbuffer."Cell Type"::Text);
                                        EnterHeadings(Row, 5, 'TOTAL BENCH MARK(IN MIN)', TRUE, TempExcelbuffer."Cell Type"::Text);
                                        EnterHeadings(Row, 6, 'TOTAL BENCH MARK(IN HH::MM)', TRUE, TempExcelbuffer."Cell Type"::Text);
                                        //EnterHeadings(Row,7,'TOTAL BENCH MARK(IN HH)',TRUE,TempExcelbuffer."Cell Type" :: Text);

                                    END;
                                    Level4Print := FALSE;
                                    // <Routing Line3>, Header (2) - OnPreSection() <<
                                END;


                                Compound_BenchMark += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Production BOM Line3>".Quantity * "Run Time";
                                IF STRLEN(FORMAT(ROUND("Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Production BOM Line3>".Quantity * "Run Time" MOD 60, 1))) = 1 THEN
                                    MIN := '0' + FORMAT(ROUND("Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Production BOM Line3>".Quantity * "Run Time" MOD 60, 1))
                                ELSE
                                    MIN := FORMAT(ROUND("Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Production BOM Line3>".Quantity * "Run Time" MOD 60, 1));
                                TOT_BENCH_MARK := FORMAT("Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Production BOM Line3>".Quantity * "Run Time" DIV 60, 1) + ':' + MIN;


                                IF "<Routing Line3>".Description = 'MICRO PROCESSORS' THEN
                                    Totals1[2] += "<Production BOM Line3>".Quantity * "<Routing Line3>"."Run Time"
                                ELSE
                                    IF "<Routing Line3>".Description = 'SHOP FLOOR' THEN
                                        Totals1[4] += "<Production BOM Line3>".Quantity * "<Routing Line3>"."Run Time"
                                    ELSE
                                        IF "<Routing Line3>".Description = 'QUALITY CONTROL' THEN
                                            Totals1[3] += "<Production BOM Line3>".Quantity * "<Routing Line3>"."Run Time"
                                        ELSE
                                            Totals1[1] += "<Production BOM Line3>".Quantity * "<Routing Line3>"."Run Time";

                                IF "<Routing Line3>"."Work Center Group Code" = 'CDA' THEN
                                    Totals[1] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Production BOM Line3>".Quantity * "<Routing Line3>"."Run Time"
                                ELSE
                                    IF "<Routing Line3>"."Work Center Group Code" = 'CHW' THEN
                                        Totals[2] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Production BOM Line3>".Quantity * "<Routing Line3>"."Run Time"
                                    ELSE
                                        IF "<Routing Line3>"."Work Center Group Code" = 'CSA' THEN
                                            Totals[3] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Production BOM Line3>".Quantity * "<Routing Line3>"."Run Time"
                                        ELSE
                                            IF "<Routing Line3>"."Work Center Group Code" = 'CSM' THEN
                                                Totals[4] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Production BOM Line3>".Quantity * "<Routing Line3>"."Run Time"
                                            ELSE
                                                IF "<Routing Line3>"."Work Center Group Code" = 'CST' THEN
                                                    Totals[5] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Production BOM Line3>".Quantity * "<Routing Line3>"."Run Time"
                                                ELSE
                                                    IF "<Routing Line3>"."Work Center Group Code" = 'DES' THEN
                                                        Totals[6] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Production BOM Line3>".Quantity * "<Routing Line3>"."Run Time"
                                                    ELSE
                                                        IF "<Routing Line3>"."Work Center Group Code" = 'MCH' THEN
                                                            Totals[7] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Production BOM Line3>".Quantity * "<Routing Line3>"."Run Time"
                                                        ELSE
                                                            IF "<Routing Line3>"."Work Center Group Code" = 'MPR' THEN
                                                                Totals[8] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Production BOM Line3>".Quantity * "<Routing Line3>"."Run Time"
                                                            ELSE
                                                                IF "<Routing Line3>"."Work Center Group Code" = 'P1' THEN
                                                                    Totals[9] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Production BOM Line3>".Quantity * "<Routing Line3>"."Run Time"
                                                                ELSE
                                                                    IF "<Routing Line3>"."Work Center Group Code" = 'P2' THEN
                                                                        Totals[10] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Production BOM Line3>".Quantity * "<Routing Line3>"."Run Time"
                                                                    ELSE
                                                                        IF "<Routing Line3>"."Work Center Group Code" = 'P3' THEN
                                                                            Totals[11] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Production BOM Line3>".Quantity * "<Routing Line3>"."Run Time"
                                                                        ELSE
                                                                            IF "<Routing Line3>"."Work Center Group Code" = 'P4' THEN
                                                                                Totals[12] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Production BOM Line3>".Quantity * "<Routing Line3>"."Run Time"
                                                                            ELSE
                                                                                IF "<Routing Line3>"."Work Center Group Code" = 'PSD' THEN
                                                                                    Totals[13] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Production BOM Line3>".Quantity * "<Routing Line3>"."Run Time"
                                                                                ELSE
                                                                                    IF "<Routing Line3>"."Work Center Group Code" = 'QAS' THEN
                                                                                        Totals[14] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Production BOM Line3>".Quantity * "<Routing Line3>"."Run Time"
                                                                                    ELSE
                                                                                        IF "<Routing Line3>"."Work Center Group Code" = 'RHW' THEN
                                                                                            Totals[15] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Production BOM Line3>".Quantity * "<Routing Line3>"."Run Time"
                                                                                        ELSE
                                                                                            IF "<Routing Line3>"."Work Center Group Code" = 'SHF' THEN
                                                                                                Totals[16] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Production BOM Line3>".Quantity * "<Routing Line3>"."Run Time"
                                                                                            ELSE
                                                                                                IF "<Routing Line3>"."Work Center Group Code" = 'STR' THEN
                                                                                                    Totals[17] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Production BOM Line3>".Quantity * "<Routing Line3>"."Run Time"
                                                                                                ELSE
                                                                                                    IF "<Routing Line3>"."Work Center Group Code" = 'WAIT TIME' THEN
                                                                                                        Totals[18] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Production BOM Line3>".Quantity * "<Routing Line3>"."Run Time"
                                                                                                    ELSE
                                                                                                        IF "<Routing Line3>"."Work Center Group Code" = 'OTHER DEPT' THEN BEGIN
                                                                                                            Totals[19] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Production BOM Line3>".Quantity * "<Routing Line3>"."Run Time";
                                                                                                            Totals[21] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Production BOM Line3>".Quantity * "<Routing Line3>"."Run Time";
                                                                                                            Totals[22] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Production BOM Line3>".Quantity * "<Routing Line3>"."Run Time";
                                                                                                            Totals[23] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Production BOM Line3>".Quantity * "<Routing Line3>"."Run Time";
                                                                                                        END
                                                                                                        ELSE
                                                                                                            IF "<Routing Line3>"."Work Center Group Code" = 'OUT SOURCE' THEN //ADDED BY VISHNU PRIYA ON 15-05-2020
                                                                                                                Totals[19] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Production BOM Line3>".Quantity * "<Routing Line3>"."Run Time"
                                                                                                            ELSE
                                                                                                                IF "<Routing Line3>"."Work Center Group Code" = 'DIS' THEN
                                                                                                                    Totals[20] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Production BOM Line3>".Quantity * "<Routing Line3>"."Run Time"
                                                                                                                ELSE
                                                                                                                    IF "<Routing Line3>"."Work Center Group Code" = 'TCE' THEN
                                                                                                                        Totals[24] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Production BOM Line3>".Quantity * "<Routing Line3>"."Run Time"
                                                                                                                    ELSE
                                                                                                                        IF "<Routing Line3>"."Work Center Group Code" = 'TST' THEN
                                                                                                                            Totals[25] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Production BOM Line3>".Quantity * "<Routing Line3>"."Run Time"
                                                                                                                        ELSE
                                                                                                                            IF "<Routing Line3>"."Work Center Group Code" = 'WIR' THEN
                                                                                                                                Totals[26] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Production BOM Line3>".Quantity * "<Routing Line3>"."Run Time"
                                                                                                                            ELSE
                                                                                                                                Totals[9] += "Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Production BOM Line3>".Quantity * "<Routing Line3>"."Run Time";

                                CurrReport.SHOWOUTPUT(Choice = Choice::Detail);

                                // <Routing Line3>, Body (3) - OnPreSection() >>
                                IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                                    Level4 := TRUE;
                                    Row += 1;
                                    Entercell(Row, 1, "<Routing Line3>"."Operation No.", FALSE, TempExcelbuffer."Cell Type"::Number);
                                    Entercell(Row, 2, "<Routing Line3>"."Operation Description", FALSE, TempExcelbuffer."Cell Type"::Text);
                                    Entercell(Row, 3, "<Routing Line3>"."Work Center No.", FALSE, TempExcelbuffer."Cell Type"::Text);
                                    Entercell(Row, 4, FORMAT("<Routing Line3>"."Run Time"), FALSE, TempExcelbuffer."Cell Type"::Number);
                                    Entercell(Row, 5, FORMAT("Production BOM Line".Quantity * "<Production BOM Line2>".Quantity * "<Production BOM Line3>".Quantity * "<Routing Line3>"."Run Time"), FALSE, TempExcelbuffer."Cell Type"::Number);
                                    Entercell(Row, 6, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                                    //EnterHeadings(Row,7,FORMAT("Run Time" DIV 60),TRUE,TempExcelbuffer."Cell Type" :: Number);


                                END;
                                // <Routing Line3>, Body (3) - OnPreSection() <<
                            end;

                            trigger OnPostDataItem();
                            begin
                                // <Routing Line3>, Footer (4) - OnPreSection() >>
                                IF Level4 THEN BEGIN
                                    IF STRLEN(FORMAT(ROUND(Compound_BenchMark MOD 60, 1))) = 1 THEN
                                        MIN := '0' + FORMAT(ROUND(Compound_BenchMark MOD 60, 1))
                                    ELSE
                                        MIN := FORMAT(ROUND(Compound_BenchMark MOD 60, 1));
                                    TOT_BENCH_MARK := FORMAT(Compound_BenchMark DIV 60) + ':' + MIN;

                                    CurrReport.SHOWOUTPUT(Choice = Choice::Detail);
                                    IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                                        Row += 1;
                                        Entercell(Row, 6, TOT_BENCH_MARK, TRUE, TempExcelbuffer."Cell Type"::Text);
                                        // EnterHeadings(Row,7,FORMAT(Compound_BenchMark DIV 60),TRUE,TempExcelbuffer."Cell Type" :: Number);

                                    END
                                END;
                                Level4 := FALSE;
                                //addded IF swathi
                                // <Routing Line3>, Footer (4) - OnPreSection() <<
                            end;

                            trigger OnPreDataItem();
                            begin
                                Level4Print := TRUE;   // level 4( Routing line3) added by swathi 0n 23-sep-13
                            end;
                        }
                    }
                }

                trigger OnAfterGetRecord();
                begin
                    Compound_BenchMark := 0;
                end;
            }

            trigger OnAfterGetRecord();
            begin
                IF InactiveBOMs = FALSE THEN BEGIN
                    Itm.RESET;
                    Itm.SETRANGE(Itm."No.", "Production BOM Header"."No.");
                    IF Itm.FINDFIRST THEN BEGIN
                        IF Itm."Item Status" IN [2, 3, 4] THEN
                            CurrReport.SKIP;
                    END;
                END;


                IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                    Itm.RESET;
                    Itm.SETRANGE(Itm."No.", "Production BOM Header"."No.");
                    IF Itm.FINDFIRST THEN BEGIN
                        IF ISG <> '' THEN BEGIN
                            IF ISG = Itm."Item Sub Group Code" THEN BEGIN
                                IF ISSG <> '' THEN BEGIN
                                    IF ISSG <> Itm."Item Sub Sub Group Code" THEN
                                        CurrReport.SKIP
                                    ELSE
                                        BOMsCount += 1;
                                END ELSE
                                    BOMsCount += 1;
                            END ELSE
                                CurrReport.SKIP;
                        END ELSE
                            BOMsCount += 1;
                    END
                    ELSE
                        CurrReport.SKIP;
                    IF PrevBOM <> '' THEN BEGIN
                        BRF_Data;
                        Row += 1;
                    END;
                    Row += 1;
                    EnterHeadings(Row, 1, 'PRODUCTION BOM', TRUE, TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row, 2, "Production BOM Header".Description, FALSE, TempExcelbuffer."Cell Type"::Text);
                END
                ELSE
                    IF EXCEL AND (Choice = Choice::Brief) THEN   //Added by pranavi on16-mar-2016
               BEGIN
                        Itm.RESET;
                        Itm.SETRANGE(Itm."No.", "Production BOM Header"."No.");
                        IF Itm.FINDFIRST THEN BEGIN
                            IF ISG <> '' THEN BEGIN
                                IF ISG = Itm."Item Sub Group Code" THEN BEGIN
                                    IF ISSG <> '' THEN BEGIN
                                        IF ISSG <> Itm."Item Sub Sub Group Code" THEN
                                            CurrReport.SKIP
                                        ELSE
                                            BOMsCount += 1;
                                    END ELSE
                                        BOMsCount += 1;
                                END ELSE
                                    CurrReport.SKIP;
                            END ELSE
                                BOMsCount += 1;
                        END
                        ELSE
                            CurrReport.SKIP;
                        IF PrevBOM <> '' THEN BEGIN
                            /*
                            Row+=1;
                            EnterHeadings(Row,1,'PRODUCTION BOM',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            Entercell(Row,2,PrevBOM,FALSE,TempExcelbuffer."Cell Type" :: Text);
                            */
                            BRF_Data;
                        END;
                    END;
                Compound_BenchMark := 0;
                FOR i := 1 TO 27 DO BEGIN
                    Totals[i] := 0;
                    Total_Cost[i] := 0;
                    Hour_Cost[i] := 0;
                END;

                PrevBOM := "Production BOM Header".Description;
                PrevNo := "Production BOM Header"."No.";

            end;

            trigger OnPostDataItem();
            begin
                /*
                IF EXCEL AND (Choice=Choice::Brief) THEN   //Added by pranavi on16-mar-2016
                BEGIN
                  IF PrevBOM <> '' THEN
                  BEGIN
                    Row+=1;
                    EnterHeadings(Row,1,'PRODUCTION BOM',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    Entercell(Row,2,PrevBOM,FALSE,TempExcelbuffer."Cell Type" :: Text);
                  END;
                END;
                */
                // Production BOM Header, GroupFooter (5) - OnPreSection() >>
                Work_Center.SETRANGE(Work_Center."No.", 'CDA');
                IF Work_Center.FIND('-') THEN
                    Hour_Cost[1] := Work_Center."Unit Cost" * 60;
                Work_Center.RESET;

                Work_Center.SETFILTER(Work_Center."No.", 'CHW');
                IF Work_Center.FIND('-') THEN
                    Hour_Cost[2] := Work_Center."Unit Cost" * 60;
                Work_Center.RESET;

                Work_Center.SETFILTER(Work_Center."No.", 'CSA');
                IF Work_Center.FIND('-') THEN
                    Hour_Cost[3] := Work_Center."Unit Cost" * 60;
                Work_Center.RESET;

                Work_Center.SETRANGE(Work_Center."No.", 'CSM');
                IF Work_Center.FIND('-') THEN
                    Hour_Cost[4] := Work_Center."Unit Cost" * 60;
                Work_Center.RESET;

                Work_Center.SETRANGE(Work_Center."No.", 'CST');
                IF Work_Center.FIND('-') THEN
                    Hour_Cost[5] := Work_Center."Unit Cost" * 60;
                Work_Center.RESET;

                Work_Center.SETRANGE(Work_Center."No.", 'DES');
                IF Work_Center.FIND('-') THEN
                    Hour_Cost[6] := Work_Center."Unit Cost" * 60;
                Work_Center.RESET;

                Work_Center.SETRANGE(Work_Center."No.", 'MCH');
                IF Work_Center.FIND('-') THEN
                    Hour_Cost[7] := Work_Center."Unit Cost" * 60;
                Work_Center.RESET;

                Work_Center.SETRANGE(Work_Center."No.", 'MPR');
                IF Work_Center.FIND('-') THEN
                    Hour_Cost[8] := Work_Center."Unit Cost" * 60;
                Work_Center.RESET;

                Work_Center.SETRANGE(Work_Center."No.", 'P1');
                IF Work_Center.FIND('-') THEN
                    Hour_Cost[9] := Work_Center."Unit Cost" * 60;
                Work_Center.RESET;

                Work_Center.SETRANGE(Work_Center."No.", 'P2');
                IF Work_Center.FIND('-') THEN
                    Hour_Cost[10] := Work_Center."Unit Cost" * 60;
                Work_Center.RESET;

                Work_Center.SETRANGE(Work_Center."No.", 'P3');
                IF Work_Center.FIND('-') THEN
                    Hour_Cost[11] := Work_Center."Unit Cost" * 60;
                Work_Center.RESET;

                Work_Center.SETRANGE(Work_Center."No.", 'P4');
                IF Work_Center.FIND('-') THEN
                    Hour_Cost[12] := Work_Center."Unit Cost" * 60;
                Work_Center.RESET;

                Work_Center.SETRANGE(Work_Center."No.", 'PSD');
                IF Work_Center.FIND('-') THEN
                    Hour_Cost[13] := Work_Center."Unit Cost" * 60;
                Work_Center.RESET;

                Work_Center.SETRANGE(Work_Center."No.", 'QAS');
                IF Work_Center.FIND('-') THEN
                    Hour_Cost[14] := Work_Center."Unit Cost" * 60;
                Work_Center.RESET;

                Work_Center.SETRANGE(Work_Center."No.", 'RHW');
                IF Work_Center.FIND('-') THEN
                    Hour_Cost[15] := Work_Center."Unit Cost" * 60;
                Work_Center.RESET;

                Work_Center.SETRANGE(Work_Center."No.", 'SHF');
                IF Work_Center.FIND('-') THEN
                    Hour_Cost[16] := Work_Center."Unit Cost" * 60;
                Work_Center.RESET;

                Work_Center.SETRANGE(Work_Center."No.", 'STR');
                IF Work_Center.FIND('-') THEN
                    Hour_Cost[17] := Work_Center."Unit Cost" * 60;
                Work_Center.RESET;


                Work_Center.SETRANGE(Work_Center."No.", 'WAIT TIME');
                IF Work_Center.FIND('-') THEN
                    Hour_Cost[18] := Work_Center."Unit Cost" * 60;
                Work_Center.RESET;

                Work_Center.SETRANGE(Work_Center."No.", 'OUT SOURCING');
                IF Work_Center.FIND('-') THEN
                    Hour_Cost[19] := Work_Center."Unit Cost" * 60;
                Work_Center.RESET;

                Work_Center.SETRANGE(Work_Center."No.", 'DIS');
                IF Work_Center.FIND('-') THEN
                    Hour_Cost[20] := Work_Center."Unit Cost" * 60;
                Work_Center.RESET;

                Work_Center.SETRANGE(Work_Center."No.", 'OTHER DEPT');
                IF Work_Center.FIND('-') THEN
                    Hour_Cost[21] := Work_Center."Unit Cost" * 60;
                Work_Center.RESET;

                Work_Center.SETRANGE(Work_Center."No.", 'OTHER DEPT(MPR)');
                IF Work_Center.FIND('-') THEN
                    Hour_Cost[22] := Work_Center."Unit Cost" * 60;
                Work_Center.RESET;

                Work_Center.SETRANGE(Work_Center."No.", 'OTHER DEPT(SHF)');
                IF Work_Center.FIND('-') THEN
                    Hour_Cost[23] := Work_Center."Unit Cost" * 60;
                Work_Center.RESET;

                Work_Center.SETRANGE(Work_Center."No.", 'TCE');
                IF Work_Center.FIND('-') THEN
                    Hour_Cost[24] := Work_Center."Unit Cost" * 60;
                Work_Center.RESET;

                Work_Center.SETRANGE(Work_Center."No.", 'TST');
                IF Work_Center.FIND('-') THEN
                    Hour_Cost[25] := Work_Center."Unit Cost" * 60;
                Work_Center.RESET;

                Work_Center.SETRANGE(Work_Center."No.", 'WIR');
                IF Work_Center.FIND('-') THEN
                    Hour_Cost[26] := Work_Center."Unit Cost" * 60;
                Work_Center.RESET;

                FOR i := 1 TO 26 DO BEGIN
                    Valuechecking := 0;
                    Totals[i] := Totals[i] / 60;
                    Valuechecking := Totals[i];// added by vishnu
                    Totals[27] += Totals[i];
                    Total_Cost[i] := Totals[i] * Hour_Cost[i];
                    //Hour_Cost[27]+= Hour_Cost[i];
                    Total_Cost[27] += Total_Cost[i];
                    //MESSAGE('i Value is:'+FORMAT(i)+' ,Toatls:'+FORMAT(Totals[i])+' ,Total Cost:'+FORMAT(Total_Cost[i]));// Added by Vishnu For Testing

                END;

                Work_Center.SETFILTER(Work_Center."No.", 'P1');
                IF Work_Center.FIND('-') THEN
                    Hour_Cost1[1] := Work_Center."Unit Cost" * 60;
                Work_Center.RESET;

                Work_Center.SETFILTER(Work_Center."No.", 'MPR');
                IF Work_Center.FIND('-') THEN
                    Hour_Cost1[2] := Work_Center."Unit Cost" * 60;
                Work_Center.RESET;

                Work_Center.SETRANGE(Work_Center."No.", 'QAS');
                IF Work_Center.FIND('-') THEN
                    Hour_Cost1[3] := Work_Center."Unit Cost" * 60;
                Work_Center.RESET;

                Work_Center.SETRANGE(Work_Center."No.", 'SHF');
                IF Work_Center.FIND('-') THEN
                    Hour_Cost1[4] := Work_Center."Unit Cost" * 60;
                Work_Center.RESET;


                FOR i := 1 TO 4 DO BEGIN

                    Totals1[i] := Totals1[i] / 60;
                    Totals1[5] += Totals1[i];
                    Total_Cost1[i] := Totals1[i] * Hour_Cost1[i];
                    Total_Cost1[5] += Total_Cost1[i];

                END;
                ColNo := 0;
                //CurrReport.SHOWOUTPUT(Choice=Choice::Detail);
                IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                    Row += 1;
                    EnterHeadings(Row, 1, 'DEPARTMENTS', TRUE, TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 2, 'BENCH MARK(IN HH::MM)', TRUE, TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 3, 'HOUR COST', TRUE, TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 4, 'TOTAL COST', TRUE, TempExcelbuffer."Cell Type"::Text);
                END
                ELSE
                    IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                        Row += 1;
                        ColNo += 1;
                        EnterHeadings(Row, ColNo, PrevNo, FALSE, TempExcelbuffer."Cell Type"::Text);
                        ColNo += 1;
                        EnterHeadings(Row, ColNo, PrevBOM, FALSE, TempExcelbuffer."Cell Type"::Text);
                    END;

                // Production BOM Header, GroupFooter (5) - OnPreSection() <<

                // Production BOM Header, GroupFooter (6) - OnPreSection() >>
                IF STRLEN(FORMAT(ROUND(Totals[1] * 60 MOD 60, 1))) = 1 THEN
                    MIN := '0' + FORMAT(ROUND(Totals[1] * 60 MOD 60, 1))
                ELSE
                    MIN := FORMAT(ROUND(Totals[1] * 60 MOD 60, 1));
                TOT_BENCH_MARK := FORMAT(Totals[1] * 60 DIV 60) + ':' + MIN;
                TOT_BENCH_MARK := FORMAT(ROUND(Totals[1], 0.01));

                IF (Totals[1] > 0) THEN BEGIN
                    CurrReport.SHOWOUTPUT := TRUE;
                    IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                        Row += 1;
                        Entercell(Row, 1, 'CDA', TRUE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 3, FORMAT(Hour_Cost[1]), FALSE, TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row, 4, FORMAT(Total_Cost[1]), FALSE, TempExcelbuffer."Cell Type"::Number);
                    END
                    ELSE
                        IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                            ColNo += 1;
                            //    Entercell(Row,ColNo,'CDA',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            //    ModifyCell(headerrow,ColNo,'Dept',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            //TempExcelbuffer.MergeRange(headerrow-1,ColNo,headerrow-1,ColNo+1);
                            ColNo += 1;
                            Entercell(Row, 33, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                            //    ModifyCell(headerrow,ColNo,'Bench Mark(Hrs)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            ColNo += 1;
                            Entercell(Row, 34, FORMAT(ROUND(Total_Cost[1], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                            //    ModifyCell(headerrow,ColNo,'Total Cost',TRUE,TempExcelbuffer."Cell Type" :: Text);
                        END;
                END
                ELSE
                    CurrReport.SHOWOUTPUT := FALSE;
                // Production BOM Header, GroupFooter (6) - OnPreSection() <<

                // Production BOM Header, GroupFooter (7) - OnPreSection() >>
                IF STRLEN(FORMAT(ROUND(Totals[2] * 60 MOD 60, 1))) = 1 THEN
                    MIN := '0' + FORMAT(ROUND(Totals[2] * 60 MOD 60, 1))
                ELSE
                    MIN := FORMAT(ROUND(Totals[2] * 60 MOD 60, 1));
                TOT_BENCH_MARK := FORMAT(Totals[2] * 60 DIV 60) + ':' + MIN;
                TOT_BENCH_MARK := FORMAT(ROUND(Totals[2], 0.01));

                IF (Totals[2] > 0) THEN BEGIN
                    CurrReport.SHOWOUTPUT := TRUE;
                    IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                        Row += 1;
                        Entercell(Row, 1, 'CHW', TRUE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 3, FORMAT(Hour_Cost[2]), FALSE, TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row, 4, FORMAT(Total_Cost[2]), FALSE, TempExcelbuffer."Cell Type"::Number);
                    END
                    ELSE
                        IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                            ColNo += 1;
                            // Entercell(Row,ColNo,'CHW',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            // ModifyCell(headerrow,ColNo,'Dept',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            // TempExcelbuffer.MergeRange(headerrow-1,ColNo,headerrow-1,ColNo+1);
                            ColNo += 1;
                            Entercell(Row, 35, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                            //  ModifyCell(headerrow,ColNo,'Bench Mark(Hrs)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            ColNo += 1;
                            Entercell(Row, 36, FORMAT(ROUND(Total_Cost[2], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                            //  ModifyCell(headerrow,ColNo,'Total Cost',TRUE,TempExcelbuffer."Cell Type" :: Text);
                        END;
                END
                ELSE
                    CurrReport.SHOWOUTPUT := FALSE;
                // Production BOM Header, GroupFooter (7) - OnPreSection() <<

                // Production BOM Header, GroupFooter (8) - OnPreSection() >>

                IF STRLEN(FORMAT(ROUND(Totals[3] * 60 MOD 60, 1))) = 1 THEN
                    MIN := '0' + FORMAT(ROUND(Totals[3] * 60 MOD 60, 1))
                ELSE
                    MIN := FORMAT(ROUND(Totals[3] * 60 MOD 60, 1));
                TOT_BENCH_MARK := FORMAT(Totals[3] * 60 DIV 60) + ':' + MIN;
                TOT_BENCH_MARK := FORMAT(ROUND(Totals[3], 0.01));

                IF (Totals[3] > 0) THEN BEGIN
                    CurrReport.SHOWOUTPUT := TRUE;
                    IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                        Row += 1;
                        Entercell(Row, 1, 'CSA', TRUE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 3, FORMAT(Hour_Cost[3]), FALSE, TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row, 4, FORMAT(Total_Cost[3]), FALSE, TempExcelbuffer."Cell Type"::Number);
                    END
                    ELSE
                        IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                            ColNo += 1;
                            //  Entercell(Row,ColNo,'CSA',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            //  ModifyCell(headerrow,ColNo,'Dept',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            // TempExcelbuffer.MergeRange(headerrow-1,ColNo,headerrow-1,ColNo+1);
                            ColNo += 1;
                            Entercell(Row, 27, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                            // ModifyCell(headerrow,ColNo,'Bench Mark(Hrs)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            ColNo += 1;
                            Entercell(Row, 28, FORMAT(ROUND(Total_Cost[3], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                            // ModifyCell(headerrow,ColNo,'Total Cost',TRUE,TempExcelbuffer."Cell Type" :: Text);
                        END;
                END
                ELSE
                    CurrReport.SHOWOUTPUT := FALSE;

                // Production BOM Header, GroupFooter (8) - OnPreSection() <<

                // Production BOM Header, GroupFooter (9) - OnPreSection() >>

                IF STRLEN(FORMAT(ROUND(Totals[4] * 60 MOD 60, 1))) = 1 THEN
                    MIN := '0' + FORMAT(ROUND(Totals[4] * 60 MOD 60, 1))
                ELSE
                    MIN := FORMAT(ROUND(Totals[4] * 60 MOD 60, 1));
                TOT_BENCH_MARK := FORMAT(Totals[4] * 60 DIV 60) + ':' + MIN;
                TOT_BENCH_MARK := FORMAT(ROUND(Totals[4], 0.01));

                IF (Totals[4] > 0) THEN BEGIN
                    CurrReport.SHOWOUTPUT := TRUE;
                    IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                        Row += 1;
                        Entercell(Row, 1, 'CSM', TRUE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 3, FORMAT(Hour_Cost[4]), FALSE, TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row, 4, FORMAT(Total_Cost[4]), FALSE, TempExcelbuffer."Cell Type"::Number);
                    END
                    ELSE
                        IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                            ColNo += 1;
                            //  Entercell(Row,ColNo,'CSM',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            //  ModifyCell(headerrow,ColNo,'Dept',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            //TempExcelbuffer.MergeRange(headerrow-1,ColNo,headerrow-1,ColNo+1);
                            ColNo += 1;
                            Entercell(Row, 29, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                            // ModifyCell(headerrow,ColNo,'Bench Mark(Hrs)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            ColNo += 1;
                            Entercell(Row, 30, FORMAT(ROUND(Total_Cost[4], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                            // ModifyCell(headerrow,ColNo,'Total Cost',TRUE,TempExcelbuffer."Cell Type" :: Text);
                        END;
                END
                ELSE
                    CurrReport.SHOWOUTPUT := FALSE;
                // Production BOM Header, GroupFooter (9) - OnPreSection() <<

                // Production BOM Header, GroupFooter (10) - OnPreSection() >>

                IF STRLEN(FORMAT(ROUND(Totals[5] * 60 MOD 60, 1))) = 1 THEN
                    MIN := '0' + FORMAT(ROUND(Totals[5] * 60 MOD 60, 1))
                ELSE
                    MIN := FORMAT(ROUND(Totals[5] * 60 MOD 60, 1));
                TOT_BENCH_MARK := FORMAT(Totals[5] * 60 DIV 60) + ':' + MIN;
                TOT_BENCH_MARK := FORMAT(ROUND(Totals[5], 0.01));

                IF (Totals[5] > 0) THEN BEGIN
                    CurrReport.SHOWOUTPUT := TRUE;
                    IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                        Row += 1;
                        Entercell(Row, 1, 'CST', TRUE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 3, FORMAT(Hour_Cost[5]), FALSE, TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row, 4, FORMAT(Total_Cost[5]), FALSE, TempExcelbuffer."Cell Type"::Number);
                    END
                    ELSE
                        IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                            ColNo += 1;
                            // Entercell(Row,ColNo,'CST',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            //  ModifyCell(headerrow,ColNo,'Dept',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            // TempExcelbuffer.MergeRange(headerrow-1,ColNo,headerrow-1,ColNo+1);
                            ColNo += 1;
                            Entercell(Row, 31, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                            //  ModifyCell(headerrow,ColNo,'Bench Mark(Hrs)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            ColNo += 1;
                            Entercell(Row, 32, FORMAT(ROUND(Total_Cost[5], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                            //  ModifyCell(headerrow,ColNo,'Total Cost',TRUE,TempExcelbuffer."Cell Type" :: Text);
                        END;
                END
                ELSE
                    CurrReport.SHOWOUTPUT := FALSE;
                // Production BOM Header, GroupFooter (10) - OnPreSection() <<

                // Production BOM Header, GroupFooter (11) - OnPreSection() >>

                IF STRLEN(FORMAT(ROUND(Totals[6] * 60 MOD 60, 1))) = 1 THEN
                    MIN := '0' + FORMAT(ROUND(Totals[6] * 60 MOD 60, 1))
                ELSE
                    MIN := FORMAT(ROUND(Totals[6] * 60 MOD 60, 1));
                TOT_BENCH_MARK := FORMAT(Totals[6] * 60 DIV 60) + ':' + MIN;
                TOT_BENCH_MARK := FORMAT(ROUND(Totals[6], 0.01));

                IF (Totals[6] > 0) THEN BEGIN
                    CurrReport.SHOWOUTPUT := TRUE;
                    IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                        Row += 1;
                        Entercell(Row, 1, 'DESIGN', TRUE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 3, FORMAT(Hour_Cost[6]), FALSE, TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row, 4, FORMAT(Total_Cost[6]), FALSE, TempExcelbuffer."Cell Type"::Number);
                    END
                    ELSE
                        IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                            ColNo += 1;
                            //  Entercell(Row,ColNo,'DESIGN',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            //  ModifyCell(headerrow,ColNo,'Dept',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            // TempExcelbuffer.MergeRange(headerrow-1,ColNo,headerrow-1,ColNo+1);
                            ColNo += 1;
                            Entercell(Row, 25, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                            //  ModifyCell(headerrow,ColNo,'Bench Mark(Hrs)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            ColNo += 1;
                            Entercell(Row, 26, FORMAT(ROUND(Total_Cost[6], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                            // ModifyCell(headerrow,ColNo,'Total Cost',TRUE,TempExcelbuffer."Cell Type" :: Text);
                        END;
                END
                ELSE
                    CurrReport.SHOWOUTPUT := FALSE;

                // Production BOM Header, GroupFooter (11) - OnPreSection() <<

                // Production BOM Header, GroupFooter (12) - OnPreSection() >>

                IF STRLEN(FORMAT(ROUND(Totals[7] * 60 MOD 60, 1))) = 1 THEN
                    MIN := '0' + FORMAT(ROUND(Totals[7] * 60 MOD 60, 1))
                ELSE
                    MIN := FORMAT(ROUND(Totals[7] * 60 MOD 60, 1));
                TOT_BENCH_MARK := FORMAT(Totals[7] * 60 DIV 60) + ':' + MIN;
                TOT_BENCH_MARK := FORMAT(ROUND(Totals[7], 0.01));

                IF (Totals[7] > 0) THEN BEGIN
                    CurrReport.SHOWOUTPUT := TRUE;
                    IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                        Row += 1;
                        Entercell(Row, 1, 'MCH', TRUE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 3, FORMAT(Hour_Cost[7]), FALSE, TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row, 4, FORMAT(Total_Cost[7]), FALSE, TempExcelbuffer."Cell Type"::Number);
                    END
                    ELSE
                        IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                            ColNo += 1;
                            //  Entercell(Row,ColNo,'MCH',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            //  ModifyCell(headerrow,ColNo,'Dept',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            // TempExcelbuffer.MergeRange(headerrow-1,ColNo,headerrow-1,ColNo+1);
                            ColNo += 1;
                            Entercell(Row, 3, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                            //  ModifyCell(headerrow,ColNo,'Bench Mark(Hrs)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            ColNo += 1;
                            Entercell(Row, 4, FORMAT(ROUND(Total_Cost[7], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                            //  ModifyCell(headerrow,ColNo,'Total Cost',TRUE,TempExcelbuffer."Cell Type" :: Text);
                        END;
                END
                ELSE
                    CurrReport.SHOWOUTPUT := FALSE;

                // Production BOM Header, GroupFooter (12) - OnPreSection() <<

                // Production BOM Header, GroupFooter (13) - OnPreSection() >>

                IF STRLEN(FORMAT(ROUND(Totals[8] * 60 MOD 60, 1))) = 1 THEN
                    MIN := '0' + FORMAT(ROUND(Totals[8] * 60 MOD 60, 1))
                ELSE
                    MIN := FORMAT(ROUND(Totals[8] * 60 MOD 60, 1));
                TOT_BENCH_MARK := FORMAT(Totals[8] * 60 DIV 60) + ':' + MIN;
                TOT_BENCH_MARK := FORMAT(ROUND(Totals[8], 0.01));

                IF (Totals[8] > 0) THEN BEGIN
                    CurrReport.SHOWOUTPUT := TRUE;
                    IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                        Row += 1;
                        Entercell(Row, 1, 'MPR', TRUE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 3, FORMAT(Hour_Cost[8]), FALSE, TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row, 4, FORMAT(Total_Cost[8]), FALSE, TempExcelbuffer."Cell Type"::Number);
                    END
                    ELSE
                        IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                            ColNo += 1;
                            //    Entercell(Row,ColNo,'MPR',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            //    ModifyCell(headerrow,ColNo,'Dept',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            //TempExcelbuffer.MergeRange(headerrow-1,ColNo,headerrow-1,ColNo+1);
                            ColNo += 1;
                            Entercell(Row, 5, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                            //    ModifyCell(headerrow,ColNo,'Bench Mark(Hrs)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            ColNo += 1;
                            Entercell(Row, 6, FORMAT(ROUND(Total_Cost[8], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                            //    ModifyCell(headerrow,ColNo,'Total Cost',TRUE,TempExcelbuffer."Cell Type" :: Text);
                        END;
                END
                ELSE
                    CurrReport.SHOWOUTPUT := FALSE;

                // Production BOM Header, GroupFooter (13) - OnPreSection() <<

                // Production BOM Header, GroupFooter (14) - OnPreSection() >>

                IF STRLEN(FORMAT(ROUND(Totals[9] * 60 MOD 60, 1))) = 1 THEN
                    MIN := '0' + FORMAT(ROUND(Totals[9] * 60 MOD 60, 1))
                ELSE
                    MIN := FORMAT(ROUND(Totals[9] * 60 MOD 60, 1));
                TOT_BENCH_MARK := FORMAT(Totals[9] * 60 DIV 60) + ':' + MIN;
                TOT_BENCH_MARK := FORMAT(ROUND(Totals[9], 0.01));

                IF (Totals[9] > 0) THEN BEGIN
                    CurrReport.SHOWOUTPUT := TRUE;
                    IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                        Row += 1;
                        Entercell(Row, 1, 'PRODUCTION 1', TRUE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 3, FORMAT(Hour_Cost[9]), FALSE, TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row, 4, FORMAT(Total_Cost[9]), FALSE, TempExcelbuffer."Cell Type"::Number);
                    END
                    ELSE
                        IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                            ColNo += 1;
                            //  Entercell(Row,ColNo,'PRODUCTION 1',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            //   ModifyCell(headerrow,ColNo,'Dept',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            // TempExcelbuffer.MergeRange(headerrow-1,ColNo,headerrow-1,ColNo+1);
                            ColNo += 1;
                            Entercell(Row, 7, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                            //   ModifyCell(headerrow,ColNo,'Bench Mark(Hrs)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            ColNo += 1;
                            Entercell(Row, 8, FORMAT(ROUND(Total_Cost[9], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                            //   ModifyCell(headerrow,ColNo,'Total Cost',TRUE,TempExcelbuffer."Cell Type" :: Text);
                        END;
                END
                ELSE
                    CurrReport.SHOWOUTPUT := FALSE;

                // Production BOM Header, GroupFooter (14) - OnPreSection() <<

                // Production BOM Header, GroupFooter (15) - OnPreSection() >>

                IF STRLEN(FORMAT(ROUND(Totals[10] * 60 MOD 60, 1))) = 1 THEN
                    MIN := '0' + FORMAT(ROUND(Totals[10] * 60 MOD 60, 1))
                ELSE
                    MIN := FORMAT(ROUND(Totals[10] * 60 MOD 60, 1));
                TOT_BENCH_MARK := FORMAT(Totals[10] * 60 DIV 60) + ':' + MIN;
                TOT_BENCH_MARK := FORMAT(ROUND(Totals[10], 0.01));

                IF (Totals[10] > 0) THEN BEGIN
                    CurrReport.SHOWOUTPUT := TRUE;
                    IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                        Row += 1;
                        Entercell(Row, 1, 'PRODUCTION 2', TRUE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 3, FORMAT(Hour_Cost[10]), FALSE, TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row, 4, FORMAT(Total_Cost[10]), FALSE, TempExcelbuffer."Cell Type"::Number);
                    END
                    ELSE
                        IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                            ColNo += 1;
                            //  Entercell(Row,ColNo,'PRODUCTION 2',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            //  ModifyCell(headerrow,ColNo,'Dept',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            // TempExcelbuffer.MergeRange(headerrow-1,ColNo,headerrow-1,ColNo+1);
                            ColNo += 1;
                            Entercell(Row, 9, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                            //  ModifyCell(headerrow,ColNo,'Bench Mark(Hrs)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            ColNo += 1;
                            Entercell(Row, 10, FORMAT(ROUND(Total_Cost[10], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                            //  ModifyCell(headerrow,ColNo,'Total Cost',TRUE,TempExcelbuffer."Cell Type" :: Text);
                        END;
                END
                ELSE
                    CurrReport.SHOWOUTPUT := FALSE;

                // Production BOM Header, GroupFooter (15) - OnPreSection() <<

                // Production BOM Header, GroupFooter (16) - OnPreSection() >>

                IF STRLEN(FORMAT(ROUND(Totals[11] * 60 MOD 60, 1))) = 1 THEN
                    MIN := '0' + FORMAT(ROUND(Totals[11] * 60 MOD 60, 1))
                ELSE
                    MIN := FORMAT(ROUND(Totals[11] * 60 MOD 60, 1));
                TOT_BENCH_MARK := FORMAT(Totals[11] * 60 DIV 60) + ':' + MIN;
                TOT_BENCH_MARK := FORMAT(ROUND(Totals[11], 0.01));

                IF (Totals[11] > 0) THEN BEGIN
                    CurrReport.SHOWOUTPUT := TRUE;
                    IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                        Row += 1;
                        Entercell(Row, 1, 'PRODUCTION 3', TRUE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 3, FORMAT(Hour_Cost[11]), FALSE, TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row, 4, FORMAT(Total_Cost[11]), FALSE, TempExcelbuffer."Cell Type"::Number);
                    END
                    ELSE
                        IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                            ColNo += 1;
                            //    Entercell(Row,ColNo,'PRODUCTION 3',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            //    ModifyCell(headerrow,ColNo,'Dept',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            // TempExcelbuffer.MergeRange(headerrow-1,ColNo,headerrow-1,ColNo+1);
                            ColNo += 1;
                            Entercell(Row, 11, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                            //    ModifyCell(headerrow,ColNo,'Bench Mark(Hrs)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            ColNo += 1;
                            Entercell(Row, 12, FORMAT(ROUND(Total_Cost[11], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                            //    ModifyCell(headerrow,ColNo,'Total Cost',TRUE,TempExcelbuffer."Cell Type" :: Text);
                        END;
                END
                ELSE
                    CurrReport.SHOWOUTPUT := FALSE;

                // Production BOM Header, GroupFooter (16) - OnPreSection() <<

                // Production BOM Header, GroupFooter (17) - OnPreSection() >>

                IF STRLEN(FORMAT(ROUND(Totals[12] * 60 MOD 60, 1))) = 1 THEN
                    MIN := '0' + FORMAT(ROUND(Totals[12] * 60 MOD 60, 1))
                ELSE
                    MIN := FORMAT(ROUND(Totals[12] * 60 MOD 60, 1));
                TOT_BENCH_MARK := FORMAT(Totals[12] * 60 DIV 60) + ':' + MIN;
                TOT_BENCH_MARK := FORMAT(ROUND(Totals[12], 0.01));

                IF (Totals[12] > 0) THEN BEGIN
                    CurrReport.SHOWOUTPUT := TRUE;
                    IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                        Row += 1;
                        Entercell(Row, 1, 'PRODUCTION 4', TRUE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 3, FORMAT(Hour_Cost[12]), FALSE, TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row, 4, FORMAT(Total_Cost[12]), FALSE, TempExcelbuffer."Cell Type"::Number);
                    END
                    ELSE
                        IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                            ColNo += 1;
                            //    Entercell(Row,ColNo,'PRODUCTION 4',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            //    ModifyCell(headerrow,ColNo,'Dept',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            // TempExcelbuffer.MergeRange(headerrow-1,ColNo,headerrow-1,ColNo+1);
                            ColNo += 1;
                            Entercell(Row, 13, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                            //    ModifyCell(headerrow,ColNo,'Bench Mark(Hrs)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            ColNo += 1;
                            Entercell(Row, 14, FORMAT(ROUND(Total_Cost[12], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                            //    ModifyCell(headerrow,ColNo,'Total Cost',TRUE,TempExcelbuffer."Cell Type" :: Text);
                        END;
                END
                ELSE
                    CurrReport.SHOWOUTPUT := FALSE;

                // Production BOM Header, GroupFooter (17) - OnPreSection() <<

                // Production BOM Header, GroupFooter (18) - OnPreSection() >>

                IF STRLEN(FORMAT(ROUND(Totals[13] * 60 MOD 60, 1))) = 1 THEN
                    MIN := '0' + FORMAT(ROUND(Totals[13] * 60 MOD 60, 1))
                ELSE
                    MIN := FORMAT(ROUND(Totals[13] * 60 MOD 60, 1));
                TOT_BENCH_MARK := FORMAT(Totals[13] * 60 DIV 60) + ':' + MIN;
                TOT_BENCH_MARK := FORMAT(ROUND(Totals[13], 0.01));

                IF (Totals[13] > 0) THEN BEGIN
                    CurrReport.SHOWOUTPUT := TRUE;
                    IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                        Row += 1;
                        Entercell(Row, 1, 'PSD', TRUE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 3, FORMAT(Hour_Cost[13]), FALSE, TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row, 4, FORMAT(Total_Cost[13]), FALSE, TempExcelbuffer."Cell Type"::Number);
                    END
                    ELSE
                        IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                            ColNo += 1;
                            //    Entercell(Row,ColNo,'PSD',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            //    ModifyCell(headerrow,ColNo,'Dept',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            //TempExcelbuffer.MergeRange(headerrow-1,ColNo,headerrow-1,ColNo+1);
                            ColNo += 1;
                            Entercell(Row, 15, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                            //    ModifyCell(headerrow,ColNo,'Bench Mark(Hrs)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            ColNo += 1;
                            Entercell(Row, 16, FORMAT(ROUND(Total_Cost[13], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                            //    ModifyCell(headerrow,ColNo,'Total Cost',TRUE,TempExcelbuffer."Cell Type" :: Text);
                        END;
                END
                ELSE
                    CurrReport.SHOWOUTPUT := FALSE;
                // Production BOM Header, GroupFooter (18) - OnPreSection() <<

                // Production BOM Header, GroupFooter (19) - OnPreSection() >>

                IF STRLEN(FORMAT(ROUND(Totals[14] * 60 MOD 60, 1))) = 1 THEN
                    MIN := '0' + FORMAT(ROUND(Totals[14] * 60 MOD 60, 1))
                ELSE
                    MIN := FORMAT(ROUND(Totals[14] * 60 MOD 60, 1));
                TOT_BENCH_MARK := FORMAT(Totals[14] * 60 DIV 60) + ':' + MIN;
                TOT_BENCH_MARK := FORMAT(ROUND(Totals[14], 0.01));

                IF (Totals[14] > 0) THEN BEGIN
                    CurrReport.SHOWOUTPUT := TRUE;
                    IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                        Row += 1;
                        Entercell(Row, 1, 'QC', TRUE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 3, FORMAT(Hour_Cost[14]), FALSE, TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row, 4, FORMAT(Total_Cost[14]), FALSE, TempExcelbuffer."Cell Type"::Number);
                    END
                    ELSE
                        IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                            ColNo += 1;
                            //    Entercell(Row,ColNo,'QC',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            //    ModifyCell(headerrow,ColNo,'Dept',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            //TempExcelbuffer.MergeRange(headerrow-1,ColNo,headerrow-1,ColNo+1);
                            ColNo += 1;
                            Entercell(Row, 19, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                            //    ModifyCell(headerrow,ColNo,'Bench Mark(Hrs)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            ColNo += 1;
                            Entercell(Row, 20, FORMAT(ROUND(Total_Cost[14], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                            //    ModifyCell(headerrow,ColNo,'Total Cost',TRUE,TempExcelbuffer."Cell Type" :: Text);
                        END;
                END
                ELSE
                    CurrReport.SHOWOUTPUT := FALSE;
                // Production BOM Header, GroupFooter (19) - OnPreSection() <<

                // Production BOM Header, GroupFooter (20) - OnPreSection() >>

                IF STRLEN(FORMAT(ROUND(Totals[15] * 60 MOD 60, 1))) = 1 THEN
                    MIN := '0' + FORMAT(ROUND(Totals[15] * 60 MOD 60, 1))
                ELSE
                    MIN := FORMAT(ROUND(Totals[15] * 60 MOD 60, 1));
                TOT_BENCH_MARK := FORMAT(Totals[15] * 60 DIV 60) + ':' + MIN;
                TOT_BENCH_MARK := FORMAT(ROUND(Totals[15], 0.01));

                IF (Totals[15] > 0) THEN BEGIN
                    CurrReport.SHOWOUTPUT := TRUE;
                    IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                        Row += 1;
                        Entercell(Row, 1, 'RHW', TRUE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 3, FORMAT(Hour_Cost[15]), FALSE, TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row, 4, FORMAT(Total_Cost[15]), FALSE, TempExcelbuffer."Cell Type"::Number);
                    END
                    ELSE
                        IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                            ColNo += 1;
                            //    Entercell(Row,ColNo,'RHW',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            //    ModifyCell(headerrow,ColNo,'Dept',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            // TempExcelbuffer.MergeRange(headerrow-1,ColNo,headerrow-1,ColNo+1);
                            ColNo += 1;
                            Entercell(Row, 21, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                            //    ModifyCell(headerrow,ColNo,'Bench Mark(Hrs)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            ColNo += 1;
                            Entercell(Row, 22, FORMAT(ROUND(Total_Cost[15], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                            //    ModifyCell(headerrow,ColNo,'Total Cost',TRUE,TempExcelbuffer."Cell Type" :: Text);
                        END;
                END
                ELSE
                    CurrReport.SHOWOUTPUT := FALSE;

                // Production BOM Header, GroupFooter (20) - OnPreSection() <<

                // Production BOM Header, GroupFooter (21) - OnPreSection() >>

                IF STRLEN(FORMAT(ROUND(Totals[16] * 60 MOD 60, 1))) = 1 THEN
                    MIN := '0' + FORMAT(ROUND(Totals[16] * 60 MOD 60, 1))
                ELSE
                    MIN := FORMAT(ROUND(Totals[16] * 60 MOD 60, 1));
                TOT_BENCH_MARK := FORMAT(Totals[16] * 60 DIV 60) + ':' + MIN;
                TOT_BENCH_MARK := FORMAT(ROUND(Totals[16], 0.01));

                IF (Totals[16] > 0) THEN BEGIN
                    CurrReport.SHOWOUTPUT := TRUE;
                    IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                        Row += 1;
                        Entercell(Row, 1, 'SHOP FLOOR', TRUE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 3, FORMAT(Hour_Cost[16]), FALSE, TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row, 4, FORMAT(Total_Cost[16]), FALSE, TempExcelbuffer."Cell Type"::Number);
                    END
                    ELSE
                        IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                            ColNo += 1;
                            //    Entercell(Row,ColNo,'SHOP FLOOR',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            //    ModifyCell(headerrow,ColNo,'Dept',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            //TempExcelbuffer.MergeRange(headerrow-1,ColNo,headerrow-1,ColNo+1);
                            ColNo += 1;
                            Entercell(Row, 17, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                            //    ModifyCell(headerrow,ColNo,'Bench Mark(Hrs)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            ColNo += 1;
                            Entercell(Row, 18, FORMAT(ROUND(Total_Cost[16], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                            //    ModifyCell(headerrow,ColNo,'Total Cost',TRUE,TempExcelbuffer."Cell Type" :: Text);
                        END;
                END
                ELSE
                    CurrReport.SHOWOUTPUT := FALSE;

                // Production BOM Header, GroupFooter (21) - OnPreSection() <<

                // Production BOM Header, GroupFooter (22) - OnPreSection() >>

                IF STRLEN(FORMAT(ROUND(Totals[17] * 60 MOD 60, 1))) = 1 THEN
                    MIN := '0' + FORMAT(ROUND(Totals[17] * 60 MOD 60, 1))
                ELSE
                    MIN := FORMAT(ROUND(Totals[17] * 60 MOD 60, 1));
                TOT_BENCH_MARK := FORMAT(Totals[17] * 60 DIV 60) + ':' + MIN;
                TOT_BENCH_MARK := FORMAT(ROUND(Totals[17], 0.01));

                IF (Totals[17] > 0) THEN BEGIN
                    CurrReport.SHOWOUTPUT := TRUE;
                    IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                        Row += 1;
                        Entercell(Row, 1, 'STR', TRUE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 3, FORMAT(Hour_Cost[17]), FALSE, TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row, 4, FORMAT(Total_Cost[17]), FALSE, TempExcelbuffer."Cell Type"::Number);
                    END
                    ELSE
                        IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                            ColNo += 1;
                            //    Entercell(Row,ColNo,'STR',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            //    ModifyCell(headerrow,ColNo,'Dept',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            // TempExcelbuffer.MergeRange(headerrow-1,ColNo,headerrow-1,ColNo+1);
                            ColNo += 1;
                            Entercell(Row, 23, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                            //    ModifyCell(headerrow,ColNo,'Bench Mark(Hrs)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            ColNo += 1;
                            Entercell(Row, 24, FORMAT(ROUND(Total_Cost[17], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                            //    ModifyCell(headerrow,ColNo,'Total Cost',TRUE,TempExcelbuffer."Cell Type" :: Text);
                        END;
                END
                ELSE
                    CurrReport.SHOWOUTPUT := FALSE;
                // Production BOM Header, GroupFooter (22) - OnPreSection() <<

                // Production BOM Header, GroupFooter (23) - OnPreSection() >>

                IF STRLEN(FORMAT(ROUND(Totals[18] * 60 MOD 60, 1))) = 1 THEN
                    MIN := '0' + FORMAT(ROUND(Totals[18] * 60 MOD 60, 1))
                ELSE
                    MIN := FORMAT(ROUND(Totals[18] * 60 MOD 60, 1));
                TOT_BENCH_MARK := FORMAT(Totals[18] * 60 DIV 60) + ':' + MIN;
                TOT_BENCH_MARK := FORMAT(ROUND(Totals[18], 0.01));

                IF (Totals[18] > 0) THEN BEGIN
                    CurrReport.SHOWOUTPUT := TRUE;
                    IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                        Row += 1;
                        Entercell(Row, 1, 'WAIT TIME', TRUE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 3, FORMAT(Hour_Cost[18]), FALSE, TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row, 4, FORMAT(Total_Cost[18]), FALSE, TempExcelbuffer."Cell Type"::Number);
                    END
                    ELSE
                        IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                            ColNo += 1;
                            //    Entercell(Row,ColNo,'WAIT TIME',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            //    ModifyCell(headerrow,ColNo,'Dept',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            // TempExcelbuffer.MergeRange(headerrow-1,ColNo,headerrow-1,ColNo+1);
                            ColNo += 1;
                            Entercell(Row, 37, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                            //    ModifyCell(headerrow,ColNo,'Bench Mark(Hrs)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                            ColNo += 1;
                            Entercell(Row, 38, FORMAT(ROUND(Total_Cost[18], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                            //    ModifyCell(headerrow,ColNo,'Total Cost',TRUE,TempExcelbuffer."Cell Type" :: Text);
                        END;
                END
                ELSE
                    CurrReport.SHOWOUTPUT := FALSE;

                // Production BOM Header, GroupFooter (23) - OnPreSection() <<


                // Production BOM Header, GroupFooter (24) - OnPreSection() >>
                IF STRLEN(FORMAT(ROUND(Totals[19] * 60 MOD 60, 1))) = 1 THEN
                    MIN := '0' + FORMAT(ROUND(Totals[19] * 60 MOD 60, 1))
                ELSE
                    MIN := FORMAT(ROUND(Totals[19] * 60 MOD 60, 1));
                TOT_BENCH_MARK := FORMAT(Totals[19] * 60 DIV 60) + ':' + MIN;
                TOT_BENCH_MARK := FORMAT(ROUND(Totals[19], 0.01));

                IF (Totals[19] > 0) THEN BEGIN
                    CurrReport.SHOWOUTPUT := TRUE;
                    IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                        Row += 1;
                        Entercell(Row, 1, 'OUT SOURCING', TRUE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 3, FORMAT(Hour_Cost[19]), FALSE, TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row, 4, FORMAT(Total_Cost[19]), FALSE, TempExcelbuffer."Cell Type"::Number);
                    END
                    ELSE
                        IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                            ColNo += 1;
                            ColNo += 1;
                            Entercell(Row, 39, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                            ColNo += 1;
                            Entercell(Row, 40, FORMAT(ROUND(Total_Cost[19], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                        END;
                END
                ELSE
                    CurrReport.SHOWOUTPUT := FALSE;

                IF STRLEN(FORMAT(ROUND(Totals[20] * 60 MOD 60, 1))) = 1 THEN
                    MIN := '0' + FORMAT(ROUND(Totals[20] * 60 MOD 60, 1))
                ELSE
                    MIN := FORMAT(ROUND(Totals[20] * 60 MOD 60, 1));
                TOT_BENCH_MARK := FORMAT(Totals[20] * 60 DIV 60) + ':' + MIN;
                TOT_BENCH_MARK := FORMAT(ROUND(Totals[20], 0.01));

                IF (Totals[20] > 0) THEN BEGIN
                    CurrReport.SHOWOUTPUT := TRUE;
                    IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                        Row += 1;
                        Entercell(Row, 1, 'DIS', TRUE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 3, FORMAT(Hour_Cost[20]), FALSE, TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row, 4, FORMAT(Total_Cost[20]), FALSE, TempExcelbuffer."Cell Type"::Number);
                    END
                    ELSE
                        IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                            ColNo += 1;
                            ColNo += 1;
                            Entercell(Row, 42, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                            ColNo += 1;
                            Entercell(Row, 43, FORMAT(ROUND(Total_Cost[20], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                        END;
                END
                ELSE
                    CurrReport.SHOWOUTPUT := FALSE;

                IF STRLEN(FORMAT(ROUND(Totals[21] * 60 MOD 60, 1))) = 1 THEN
                    MIN := '0' + FORMAT(ROUND(Totals[21] * 60 MOD 60, 1))
                ELSE
                    MIN := FORMAT(ROUND(Totals[21] * 60 MOD 60, 1));
                TOT_BENCH_MARK := FORMAT(Totals[21] * 60 DIV 60) + ':' + MIN;
                TOT_BENCH_MARK := FORMAT(ROUND(Totals[21], 0.01));

                IF (Totals[21] > 0) THEN BEGIN
                    CurrReport.SHOWOUTPUT := TRUE;
                    IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                        Row += 1;
                        Entercell(Row, 1, 'OTHER DEPT', TRUE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 3, FORMAT(Hour_Cost[21]), FALSE, TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row, 4, FORMAT(Total_Cost[21]), FALSE, TempExcelbuffer."Cell Type"::Number);
                    END
                    ELSE
                        IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                            ColNo += 1;
                            ColNo += 1;
                            Entercell(Row, 44, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                            ColNo += 1;
                            Entercell(Row, 45, FORMAT(ROUND(Total_Cost[21], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                        END;
                END
                ELSE
                    CurrReport.SHOWOUTPUT := FALSE;

                IF STRLEN(FORMAT(ROUND(Totals[22] * 60 MOD 60, 1))) = 1 THEN
                    MIN := '0' + FORMAT(ROUND(Totals[22] * 60 MOD 60, 1))
                ELSE
                    MIN := FORMAT(ROUND(Totals[22] * 60 MOD 60, 1));
                TOT_BENCH_MARK := FORMAT(Totals[22] * 60 DIV 60) + ':' + MIN;
                TOT_BENCH_MARK := FORMAT(ROUND(Totals[22], 0.01));


                IF (Totals[22] > 0) THEN BEGIN
                    CurrReport.SHOWOUTPUT := TRUE;
                    IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                        Row += 1;
                        Entercell(Row, 1, 'OTHER DEPT(MPR)', TRUE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 3, FORMAT(Hour_Cost[22]), FALSE, TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row, 4, FORMAT(Total_Cost[22]), FALSE, TempExcelbuffer."Cell Type"::Number);
                    END
                    ELSE
                        IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                            ColNo += 1;
                            ColNo += 1;
                            Entercell(Row, 46, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                            ColNo += 1;
                            Entercell(Row, 47, FORMAT(ROUND(Total_Cost[22], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                        END;
                END
                ELSE
                    CurrReport.SHOWOUTPUT := FALSE;

                IF STRLEN(FORMAT(ROUND(Totals[23] * 60 MOD 60, 1))) = 1 THEN
                    MIN := '0' + FORMAT(ROUND(Totals[23] * 60 MOD 60, 1))
                ELSE
                    MIN := FORMAT(ROUND(Totals[23] * 60 MOD 60, 1));
                TOT_BENCH_MARK := FORMAT(Totals[23] * 60 DIV 60) + ':' + MIN;
                TOT_BENCH_MARK := FORMAT(ROUND(Totals[23], 0.01));

                IF (Totals[23] > 0) THEN BEGIN
                    CurrReport.SHOWOUTPUT := TRUE;
                    IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                        Row += 1;
                        Entercell(Row, 1, 'OTHER DEPT(SHF)', TRUE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 3, FORMAT(Hour_Cost[23]), FALSE, TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row, 4, FORMAT(Total_Cost[23]), FALSE, TempExcelbuffer."Cell Type"::Number);
                    END
                    ELSE
                        IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                            ColNo += 1;
                            ColNo += 1;
                            Entercell(Row, 48, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                            ColNo += 1;
                            Entercell(Row, 49, FORMAT(ROUND(Total_Cost[23], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                        END;
                END
                ELSE
                    CurrReport.SHOWOUTPUT := FALSE;

                IF STRLEN(FORMAT(ROUND(Totals[24] * 60 MOD 60, 1))) = 1 THEN
                    MIN := '0' + FORMAT(ROUND(Totals[24] * 60 MOD 60, 1))
                ELSE
                    MIN := FORMAT(ROUND(Totals[24] * 60 MOD 60, 1));
                TOT_BENCH_MARK := FORMAT(Totals[24] * 60 DIV 60) + ':' + MIN;
                TOT_BENCH_MARK := FORMAT(ROUND(Totals[24], 0.01));

                IF (Totals[24] > 0) THEN BEGIN
                    CurrReport.SHOWOUTPUT := TRUE;
                    IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                        Row += 1;
                        Entercell(Row, 1, 'TCE', TRUE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 3, FORMAT(Hour_Cost[24]), FALSE, TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row, 4, FORMAT(Total_Cost[24]), FALSE, TempExcelbuffer."Cell Type"::Number);
                    END
                    ELSE
                        IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                            ColNo += 1;
                            ColNo += 1;
                            Entercell(Row, 50, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                            ColNo += 1;
                            Entercell(Row, 51, FORMAT(ROUND(Total_Cost[24], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                        END;
                END
                ELSE
                    CurrReport.SHOWOUTPUT := FALSE;

                IF STRLEN(FORMAT(ROUND(Totals[25] * 60 MOD 60, 1))) = 1 THEN
                    MIN := '0' + FORMAT(ROUND(Totals[25] * 60 MOD 60, 1))
                ELSE
                    MIN := FORMAT(ROUND(Totals[25] * 60 MOD 60, 1));
                TOT_BENCH_MARK := FORMAT(Totals[25] * 60 DIV 60) + ':' + MIN;
                TOT_BENCH_MARK := FORMAT(ROUND(Totals[25], 0.01));

                IF (Totals[25] > 0) THEN BEGIN
                    CurrReport.SHOWOUTPUT := TRUE;
                    IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                        Row += 1;
                        Entercell(Row, 1, 'TST', TRUE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 3, FORMAT(Hour_Cost[25]), FALSE, TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row, 4, FORMAT(Total_Cost[25]), FALSE, TempExcelbuffer."Cell Type"::Number);
                    END
                    ELSE
                        IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                            ColNo += 1;
                            ColNo += 1;
                            Entercell(Row, 52, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                            ColNo += 1;
                            Entercell(Row, 53, FORMAT(ROUND(Total_Cost[25], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                        END;
                END
                ELSE
                    CurrReport.SHOWOUTPUT := FALSE;

                IF STRLEN(FORMAT(ROUND(Totals[26] * 60 MOD 60, 1))) = 1 THEN
                    MIN := '0' + FORMAT(ROUND(Totals[26] * 60 MOD 60, 1))
                ELSE
                    MIN := FORMAT(ROUND(Totals[26] * 60 MOD 60, 1));
                TOT_BENCH_MARK := FORMAT(Totals[26] * 60 DIV 60) + ':' + MIN;
                TOT_BENCH_MARK := FORMAT(ROUND(Totals[26], 0.01));


                IF (Totals[26] > 0) THEN BEGIN
                    CurrReport.SHOWOUTPUT := TRUE;
                    IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                        Row += 1;
                        Entercell(Row, 1, 'WIR', TRUE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 3, FORMAT(Hour_Cost[26]), FALSE, TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row, 4, FORMAT(Total_Cost[26]), FALSE, TempExcelbuffer."Cell Type"::Number);
                    END
                    ELSE
                        IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                            ColNo += 1;
                            ColNo += 1;
                            Entercell(Row, 54, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                            ColNo += 1;
                            Entercell(Row, 55, FORMAT(ROUND(Total_Cost[26], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                        END;
                END
                ELSE
                    CurrReport.SHOWOUTPUT := FALSE;

                IF STRLEN(FORMAT(ROUND(Totals[27] * 60 MOD 60, 1))) = 1 THEN
                    MIN := '0' + FORMAT(ROUND(Totals[27] * 60 MOD 60, 1))
                ELSE
                    MIN := FORMAT(ROUND(Totals[27] * 60 MOD 60, 1));
                TOT_BENCH_MARK := FORMAT(Totals[27] * 60 DIV 60) + ':' + MIN;
                TOT_BENCH_MARK := FORMAT(ROUND(Totals[27], 0.01));


                //last
                //CurrReport.SHOWOUTPUT(Choice=Choice::Detail);
                IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                    Row += 1;
                    Entercell(Row, 4, FORMAT(Total_Cost[27]), FALSE, TempExcelbuffer."Cell Type"::Number);
                    //  Entercell(Row,3,FORMAT(Hour_Cost[27]),FALSE,TempExcelbuffer."Cell Type" :: Number);
                    Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row, 1, 'Total', TRUE, TempExcelbuffer."Cell Type"::Number);
                END
                ELSE
                    IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                        ColNo += 1;
                        EnterHeadings(Row, 56, TOT_BENCH_MARK, TRUE, TempExcelbuffer."Cell Type"::Text);
                        //    ModifyCell(headerrow,ColNo,'Total Bench Mark(Hrs)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                        ColNo += 1;
                        EnterHeadings(Row, 57, FORMAT(ROUND(Total_Cost[27], 0.01)), TRUE, TempExcelbuffer."Cell Type"::Text);
                        //    ModifyCell(headerrow,ColNo,'Total Prod Cost',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    END;
                // Production BOM Header, GroupFooter (24) - OnPreSection() <<
                // Pranavi
                IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                    Row += 2;
                    Entercell(Row, 1, 'Total BOMS: ', TRUE, TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row, 2, FORMAT(BOMsCount), FALSE, TempExcelbuffer."Cell Type"::Text);
                END;
                // Pranavi End

            end;

            trigger OnPreDataItem();
            begin
                IF Choice = Choice::NewBOM THEN
                    CurrReport.BREAK;

                // Production BOM Header, Header (2) - OnPreSection() >>
                //CurrReport.SHOWOUTPUT(Choice=Choice::Brief);
                /*
                IF (Choice=Choice::Brief) THEN BEGIN
                  IF EXCEL THEN  BEGIN
                    Row+=1;
                    Entercell(Row,1,"Production BOM Header".Description,TRUE,TempExcelbuffer."Cell Type" :: Text);
                  END;
                END;
                *///Pranavi
                IF EXCEL AND (Choice = Choice::Brief) THEN
                    Dept_Hourt_Cost;
                //Pranavi
                // Production BOM Header, Header (2) - OnPreSection() <<
                // Production BOM Header, Body (4) - OnPreSection() >>
                //CurrReport.SHOWOUTPUT(Choice=Choice::Detail);
                // Production BOM Header, Body (4) - OnPreSection() <<
                IF ClosedBOMs = FALSE THEN        // Added by Pranavi on 26-mar-2016
                    "Production BOM Header".SETFILTER("Production BOM Header".Status, '<>%1', "Production BOM Header".Status::Closed);

            end;
        }
        dataitem("<Production BOM Header1>"; "Production BOM Header")
        {
            DataItemTableView = SORTING(No.) ORDER(Ascending);
            RequestFilterFields = "Creation Date";
            column(POM1_Choice; Choice)
            {
            }
            column(FORMAT_TODAY_0_4__Control1102154066; FORMAT(TODAY, 0, 4))
            {
            }
            column(USERID_Control1102154067; USERID)
            {
            }
            column(CurrReport_PAGENO_Control1102154068; CurrReport.PAGENO)
            {
            }
            column(COMPANYNAME_Control1102154072; COMPANYNAME)
            {
            }
            column(Production_BOM_Header1___No__; "No.")
            {
            }
            column(Production_BOM_Header1__Description; Description)
            {
            }
            column(Production_BOM_Header1___Creation_Date_; "Creation Date")
            {
            }
            column(CurrReport_PAGENO_Control1102154068Caption; CurrReport_PAGENO_Control1102154068CaptionLbl)
            {
            }
            column(New_Bom__ReportCaption; New_Bom__ReportCaptionLbl)
            {
            }
            column(Production_BOM_Header1___No__Caption; FIELDCAPTION("No."))
            {
            }
            column(Production_BOM_Header1__DescriptionCaption; FIELDCAPTION(Description))
            {
            }
            column(Production_BOM_Header1___Creation_Date_Caption; FIELDCAPTION("Creation Date"))
            {
            }

            trigger OnPreDataItem();
            begin
                IF Choice <> Choice::NewBOM THEN
                    CurrReport.BREAK;
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
                    field(Choice; Choice)
                    {
                        Caption = 'Select Option';
                    }
                    field(EXCEL; EXCEL)
                    {
                        Caption = 'Excel';
                    }
                    field(ISG; ISG)
                    {
                        Caption = 'Item Sub Group';

                        trigger OnLookup(Text: Text): Boolean;
                        begin
                            IsgRec.RESET;
                            IsgRec.SETFILTER(IsgRec."Product Group Code", '%1', 'FPRODUCT');
                            IF PAGE.RUNMODAL(60054, IsgRec) = ACTION::LookupOK THEN
                                ISG := IsgRec.Code;
                        end;
                    }
                    field(ISSG; ISSG)
                    {
                        Caption = 'Item Sub Sub Group';

                        trigger OnLookup(Text: Text): Boolean;
                        begin
                            IF ISG <> '' THEN BEGIN
                                IssgRec.RESET;
                                IssgRec.SETFILTER(IssgRec."Item Sub Group Code", ISG);
                                IF PAGE.RUNMODAL(60055, IssgRec) = ACTION::LookupOK THEN
                                    ISSG := IssgRec.Code;
                            END
                            ELSE
                                ERROR('Please select Item Sub Group Code first!');
                        end;
                    }
                    field(ClosedBOMs; ClosedBOMs)
                    {
                        Caption = 'Closed BOMs';
                    }
                    field(InactiveBOMs; InactiveBOMs)
                    {
                        Caption = 'In-Active BOMs';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnInit();
        begin
            ClosedBOMs := TRUE;
            InactiveBOMs := TRUE;
        end;
    }

    labels
    {
    }

    trigger OnInitReport();
    begin
        EXCEL := TRUE;
    end;

    trigger OnPostReport();
    begin
        IF EXCEL THEN BEGIN
            /*
            TempExcelbuffer.CreateBook('Explosion of Routings');//B2B
            TempExcelbuffer.WriteSheet('Explosion of Routings',COMPANYNAME,USERID);//B2B
            TempExcelbuffer.GiveUserControl;
            TempExcelbuffer.SaveRout("Production BOM Header"."No.");
            */
            TempExcelbuffer.CreateBookAndOpenExcel('', '"Routing Line"."Routing No."', '"Routing Line"."Routing No."', COMPANYNAME, USERID); //EFFUPG
                                                                                                                                             // TempExcelbuffer.MergeRange(4,3,4,4);
            TempExcelbuffer.SaveRout("Production BOM Header"."No.");
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
        companyid: Record "Company Information";
        Compound_BenchMark: Decimal;
        Totals: array[27] of Decimal;
        i: Integer;
        Hour_Cost: array[27] of Decimal;
        Total_Cost: array[27] of Decimal;
        Work_Center: Record "Work Center";
        Choice: Option Detail,Brief,NewBOM;
        TempExcelbuffer: Record "Excel Buffer" temporary;
        EXCEL: Boolean;
        Row: Integer;
        Total_Cost1: array[5] of Decimal;
        Hour_Cost1: array[5] of Decimal;
        Totals1: array[5] of Decimal;
        TOT_BENCH_MARK: Text[30];
        "MIN": Text[30];
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Explosion_of_RoutingsCaptionLbl: Label 'Explosion of Routings';
        Production_BOMCaptionLbl: Label 'Production BOM';
        DepartmentsCaptionLbl: Label 'Departments';
        Hour_CostCaptionLbl: Label 'Hour Cost';
        Total_CostCaptionLbl: Label 'Total Cost';
        Bench_Mark__HH_MM_CaptionLbl: Label 'Bench Mark (HH:MM)';
        CDACaptionLbl: Label 'CDA';
        CHWCaptionLbl: Label 'CHW';
        CSACaptionLbl: Label 'CSA';
        CSMCaptionLbl: Label 'CSM';
        CSTCaptionLbl: Label 'CST';
        DESIGNCaptionLbl: Label 'DESIGN';
        MCHCaptionLbl: Label 'MCH';
        MPRCaptionLbl: Label 'MPR';
        PRODUCTION_1CaptionLbl: Label 'PRODUCTION 1';
        PRODUCTION_2CaptionLbl: Label 'PRODUCTION 2';
        PRODUCTION_3CaptionLbl: Label 'PRODUCTION 3';
        PRODUCTION_4CaptionLbl: Label 'PRODUCTION 4';
        PSDCaptionLbl: Label 'PSD';
        QCCaptionLbl: Label 'QC';
        RHWCaptionLbl: Label 'RHW';
        SHFCaptionLbl: Label 'SHF';
        STRCaptionLbl: Label 'STR';
        WAIT_TIMECaptionLbl: Label 'WAIT TIME';
        Total_Bench_Mark_in_Min_CaptionLbl: Label 'Total Bench_Mark(in Min)';
        Run_Time_in_Min_CaptionLbl: Label 'Run Time(in Min)';
        DepartmentCaptionLbl: Label 'Department';
        Operation_DescriptionCaptionLbl: Label 'Operation Description';
        Operation_No_CaptionLbl: Label 'Operation No.';
        Total_Bench_Mark_hh_mm_CaptionLbl: Label 'Total Bench_Mark(hh:mm)';
        QuantityCaptionLbl: Label 'Quantity';
        Production_BomCaption_Control1000000016Lbl: Label 'Production Bom';
        DepartmentCaption_Control1000000020Lbl: Label 'Department';
        Run_Time_in_Min_Caption_Control1000000022Lbl: Label 'Run Time(in Min)';
        Total_Bench_Mark_in_Min_Caption_Control1000000025Lbl: Label 'Total Bench_Mark(in Min)';
        Total_Bench_Mark_hh_mm_Caption_Control1102156059Lbl: Label 'Total Bench_Mark(hh:mm)';
        QuantityCaption_Control1102154054Lbl: Label 'Quantity';
        Production_BomCaption_Control1102154056Lbl: Label 'Production Bom';
        Total_Bench_Mark_in_Min_Caption_Control1102154047Lbl: Label 'Total Bench_Mark(in Min)';
        Run_Time_in_Min_Caption_Control1102154049Lbl: Label 'Run Time(in Min)';
        DepartmentCaption_Control1102154050Lbl: Label 'Department';
        Operation_DescriptionCaption_Control1102154051Lbl: Label 'Operation Description';
        Operation_No_Caption_Control1102154052Lbl: Label 'Operation No.';
        Total_Bench_Mark_hh_mm_Caption_Control1102156060Lbl: Label 'Total Bench_Mark(hh:mm)';
        CurrReport_PAGENO_Control1102154068CaptionLbl: Label 'Page';
        New_Bom__ReportCaptionLbl: Label 'New Bom'' Report';
        TOT_BENCH_MARK1: Decimal;
        Text001: Label ':';
        Text002: Label '.';
        TOT_BENCH_MARK2: Decimal;
        TOT_BENCH_MARK3: Decimal;
        Flag: Decimal;
        Compound_BenchMark1: Decimal;
        TextVar: Text;
        SS: Decimal;
        ss1: Decimal;
        Level2Print: Boolean;
        Level3Print: Boolean;
        Level2: Boolean;
        Level3: Boolean;
        Level4Print: Boolean;
        Level4: Boolean;
        PrevBOM: Code[50];
        ISG: Code[20];
        ISSG: Code[20];
        IsgRec: Record "Item Sub Group";
        IssgRec: Record "Item Sub Sub Group";
        Itm: Record Item;
        BOMsCount: Integer;
        ColNo: Integer;
        PrevNo: Code[50];
        TESTDEC: Decimal;
        headerrow: Integer;
        ClosedBOMs: Boolean;
        TempExcelbuffer1: Record "Excel Buffer" temporary;
        InactiveBOMs: Boolean;
        Valuechecking: Decimal;

    (5261)]
    procedure Entercell(RowNo: Integer; ColumnNo: Integer; CellValue: Text[1000]; bold: Boolean; CellType: Option);
    begin
        TempExcelbuffer.INIT;
        TempExcelbuffer.VALIDATE("Row No.", RowNo);
        TempExcelbuffer.VALIDATE("Column No.", ColumnNo);
        TempExcelbuffer."Cell Value as Text" := CellValue;
        TempExcelbuffer.Bold := bold;
        TempExcelbuffer."Cell Type" := CellType;   //added by swathi on 20-sep-13

        TempExcelbuffer.INSERT;
    end;

    (5271)]
    procedure EnterHeadings(RowNo: Integer; ColumnNo: Integer; CellValue: Text[100]; Bold: Boolean; CellType: Option);
    begin
        TempExcelbuffer.INIT;
        TempExcelbuffer.VALIDATE("Row No.", RowNo);
        TempExcelbuffer.VALIDATE("Column No.", ColumnNo);
        TempExcelbuffer."Cell Value as Text" := FORMAT(CellValue);
        TempExcelbuffer.Bold := Bold;
        TempExcelbuffer."Cell Type" := CellType;   //added by swathi on 20-sep-13

        TempExcelbuffer.Formula := '';
        TempExcelbuffer.INSERT;
    end;

    (5282)]
    procedure BRF_Data();
    begin

        // Production BOM Header, GroupFooter (5) - OnPreSection() >>
        Work_Center.SETRANGE(Work_Center."No.", 'CDA');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[1] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETFILTER(Work_Center."No.", 'CHW');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[2] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETFILTER(Work_Center."No.", 'CSA');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[3] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETRANGE(Work_Center."No.", 'CSM');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[4] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETRANGE(Work_Center."No.", 'CST');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[5] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETRANGE(Work_Center."No.", 'DES');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[6] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETRANGE(Work_Center."No.", 'MCH');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[7] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETRANGE(Work_Center."No.", 'MPR');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[8] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETRANGE(Work_Center."No.", 'P1');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[9] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETRANGE(Work_Center."No.", 'P2');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[10] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETRANGE(Work_Center."No.", 'P3');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[11] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETRANGE(Work_Center."No.", 'P4');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[12] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETRANGE(Work_Center."No.", 'PSD');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[13] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETRANGE(Work_Center."No.", 'QAS');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[14] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETRANGE(Work_Center."No.", 'RHW');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[15] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETRANGE(Work_Center."No.", 'SHF');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[16] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETRANGE(Work_Center."No.", 'STR');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[17] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;


        Work_Center.SETRANGE(Work_Center."No.", 'WAIT TIME');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[18] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETRANGE(Work_Center."No.", 'OUT SOURCING');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[19] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        //Added by vishnu  Priya for checking the subtotals
        Work_Center.SETRANGE(Work_Center."No.", 'DIS');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[20] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETRANGE(Work_Center."No.", 'OTHER DEPT');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[21] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETRANGE(Work_Center."No.", 'OTHER DEPT(MPR)');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[22] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETRANGE(Work_Center."No.", 'OTHER DEPT(SHF)');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[23] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETRANGE(Work_Center."No.", 'TCE');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[24] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETRANGE(Work_Center."No.", 'TST');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[25] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETRANGE(Work_Center."No.", 'WIR');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[26] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;
        //Added by vishnu  Priya for checking the subtotals

        /*
           FOR i:=1 TO 19 DO
           BEGIN
        
             Totals[i]:=Totals[i]/60;
             Totals[20]+=Totals[i];
             Total_Cost[i] := Totals[i]*Hour_Cost[i];
             Total_Cost[20]+= Total_Cost[i] ;
           END;
           */

        FOR i := 1 TO 26 DO BEGIN
            Valuechecking := 0;
            Totals[i] := Totals[i] / 60;
            Totals[27] += Totals[i];
            Total_Cost[i] := Totals[i] * Hour_Cost[i];
            Total_Cost[27] += Total_Cost[i];
            Valuechecking := Total_Cost[i];// added by vishnu
            MESSAGE(FORMAT(Totals[i]) + ' ' + FORMAT(Total_Cost[i]));// Added by Vishnu For Testing
        END;

        Work_Center.SETFILTER(Work_Center."No.", 'P1');
        IF Work_Center.FIND('-') THEN
            Hour_Cost1[1] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETFILTER(Work_Center."No.", 'MPR');
        IF Work_Center.FIND('-') THEN
            Hour_Cost1[2] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETRANGE(Work_Center."No.", 'QAS');
        IF Work_Center.FIND('-') THEN
            Hour_Cost1[3] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETRANGE(Work_Center."No.", 'SHF');
        IF Work_Center.FIND('-') THEN
            Hour_Cost1[4] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        // commented by vishnu on 14-05-2020 1 to 4 is replaced for the testing
        /* FOR i:=1 TO 4 DO
         BEGIN

           Totals1[i]:=Totals1[i]/60;
           Totals1[5]+=Totals1[i];
           Total_Cost1[i] := Totals1[i]*Hour_Cost1[i];
           Total_Cost1[5]+= Total_Cost1[i] ;
         END;*/
        // commented by vishnu on 14-05-2020

        FOR i := 1 TO 26 DO BEGIN

            Totals1[i] := Totals1[i] / 60;
            Totals1[27] += Totals1[i];
            Total_Cost1[i] := Totals1[i] * Hour_Cost1[i];
            Total_Cost1[27] += Total_Cost1[i];
        END;

        ColNo := 0;
        //CurrReport.SHOWOUTPUT(Choice=Choice::Detail);
        IF EXCEL AND (Choice = Choice::Detail) THEN // commented by pranavi on 16-mar-2016
        BEGIN
            Row += 1;
            EnterHeadings(Row, 1, 'DEPARTMENTS', TRUE, TempExcelbuffer."Cell Type"::Text);
            EnterHeadings(Row, 2, 'BENCH MARK(IN HH::MM)', TRUE, TempExcelbuffer."Cell Type"::Text);
            EnterHeadings(Row, 3, 'HOUR COST', TRUE, TempExcelbuffer."Cell Type"::Text);
            EnterHeadings(Row, 4, 'TOTAL COST', TRUE, TempExcelbuffer."Cell Type"::Text);
        END
        ELSE
            IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                Row += 1;
                ColNo += 1;
                EnterHeadings(Row, ColNo, PrevNo, FALSE, TempExcelbuffer."Cell Type"::Text);
                ColNo += 1;
                EnterHeadings(Row, ColNo, PrevBOM, FALSE, TempExcelbuffer."Cell Type"::Text);
                // message('item row: '+format(Row));
            END;
        // Production BOM Header, GroupFooter (5) - OnPreSection() <<

        // Production BOM Header, GroupFooter (6) - OnPreSection() >>
        IF STRLEN(FORMAT(ROUND(Totals[1] * 60 MOD 60, 1))) = 1 THEN
            MIN := '0' + FORMAT(ROUND(Totals[1] * 60 MOD 60, 1))
        ELSE
            MIN := FORMAT(ROUND(Totals[1] * 60 MOD 60, 1));
        TOT_BENCH_MARK := FORMAT(Totals[1] * 60 DIV 60) + ':' + MIN;
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[1] * 60 DIV 60, 3)); //pranavi
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[1], 0.01));
        IF (Totals[1] > 0) THEN BEGIN
            CurrReport.SHOWOUTPUT := TRUE;
            IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                Row += 1;
                Entercell(Row, 1, 'CDA', TRUE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 3, FORMAT(Hour_Cost[1]), FALSE, TempExcelbuffer."Cell Type"::Number);
                Entercell(Row, 4, FORMAT(Total_Cost[1]), FALSE, TempExcelbuffer."Cell Type"::Number);
            END
            ELSE
                IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                    ColNo += 1;
                    //Entercell(Row,ColNo,'CDA',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    ColNo += 1;
                    Entercell(Row, 33, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                    // ModifyCell(headerrow,ColNo,'Bench Mark(Hrs)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    ColNo += 1;
                    Entercell(Row, 34, FORMAT(ROUND(Total_Cost[1], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                    // ModifyCell(headerrow,ColNo,'Total Cost',TRUE,TempExcelbuffer."Cell Type" :: Text);
                END;
        END
        ELSE
            CurrReport.SHOWOUTPUT := FALSE;
        // Production BOM Header, GroupFooter (6) - OnPreSection() <<

        // Production BOM Header, GroupFooter (7) - OnPreSection() >>
        IF STRLEN(FORMAT(ROUND(Totals[2] * 60 MOD 60, 1))) = 1 THEN
            MIN := '0' + FORMAT(ROUND(Totals[2] * 60 MOD 60, 1))
        ELSE
            MIN := FORMAT(ROUND(Totals[2] * 60 MOD 60, 1));
        TOT_BENCH_MARK := FORMAT(Totals[2] * 60 DIV 60) + ':' + MIN;
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[2] * 60 DIV 60, 3)); //pranavi
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[2], 0.01));

        IF (Totals[2] > 0) THEN BEGIN
            CurrReport.SHOWOUTPUT := TRUE;
            IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                Row += 1;
                Entercell(Row, 1, 'CHW', TRUE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 3, FORMAT(Hour_Cost[2]), FALSE, TempExcelbuffer."Cell Type"::Number);
                Entercell(Row, 4, FORMAT(Total_Cost[2]), FALSE, TempExcelbuffer."Cell Type"::Number);
            END
            ELSE
                IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                    ColNo += 1;
                    //  Entercell(Row,ColNo,'CHW',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    ColNo += 1;
                    Entercell(Row, 35, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                    //  ModifyCell(headerrow,ColNo,'Bench Mark(Hrs)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    ColNo += 1;
                    Entercell(Row, 36, FORMAT(ROUND(Total_Cost[2], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                    //ModifyCell(headerrow,ColNo,'Total Cost',TRUE,TempExcelbuffer."Cell Type" :: Text);
                END;
        END
        ELSE
            CurrReport.SHOWOUTPUT := FALSE;
        // Production BOM Header, GroupFooter (7) - OnPreSection() <<

        // Production BOM Header, GroupFooter (8) - OnPreSection() >>

        IF STRLEN(FORMAT(ROUND(Totals[3] * 60 MOD 60, 1))) = 1 THEN
            MIN := '0' + FORMAT(ROUND(Totals[3] * 60 MOD 60, 1))
        ELSE
            MIN := FORMAT(ROUND(Totals[3] * 60 MOD 60, 1));
        TOT_BENCH_MARK := FORMAT(Totals[3] * 60 DIV 60) + ':' + MIN;
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[3] * 60 DIV 60, 3)); //pranavi
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[3], 0.01));

        IF (Totals[3] > 0) THEN BEGIN
            CurrReport.SHOWOUTPUT := TRUE;
            IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                Row += 1;
                Entercell(Row, 1, 'CSA', TRUE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 3, FORMAT(Hour_Cost[3]), FALSE, TempExcelbuffer."Cell Type"::Number);
                Entercell(Row, 4, FORMAT(Total_Cost[3]), FALSE, TempExcelbuffer."Cell Type"::Number);
            END
            ELSE
                IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                    ColNo += 1;
                    //Entercell(Row,ColNo,'CSA',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    ColNo += 1;
                    Entercell(Row, 27, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                    //    ModifyCell(headerrow,ColNo,'Bench Mark(Hrs)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    ColNo += 1;
                    Entercell(Row, 28, FORMAT(ROUND(Total_Cost[3], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                    //    ModifyCell(headerrow,ColNo,'Total Cost',TRUE,TempExcelbuffer."Cell Type" :: Text);
                END;
        END
        ELSE
            CurrReport.SHOWOUTPUT := FALSE;

        // Production BOM Header, GroupFooter (8) - OnPreSection() <<

        // Production BOM Header, GroupFooter (9) - OnPreSection() >>

        IF STRLEN(FORMAT(ROUND(Totals[4] * 60 MOD 60, 1))) = 1 THEN
            MIN := '0' + FORMAT(ROUND(Totals[4] * 60 MOD 60, 1))
        ELSE
            MIN := FORMAT(ROUND(Totals[4] * 60 MOD 60, 1));
        TOT_BENCH_MARK := FORMAT(Totals[4] * 60 DIV 60) + ':' + MIN;
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[4] * 60 DIV 60, 3)); //pranavi
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[4], 0.01));
        IF (Totals[4] > 0) THEN BEGIN
            CurrReport.SHOWOUTPUT := TRUE;
            IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                Row += 1;
                Entercell(Row, 1, 'CSM', TRUE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 3, FORMAT(Hour_Cost[4]), FALSE, TempExcelbuffer."Cell Type"::Number);
                Entercell(Row, 4, FORMAT(Total_Cost[4]), FALSE, TempExcelbuffer."Cell Type"::Number);
            END
            ELSE
                IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                    ColNo += 1;
                    //    Entercell(Row,ColNo,'CSM',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    ColNo += 1;
                    Entercell(Row, 29, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                    //  ModifyCell(headerrow,ColNo,'Bench Mark(Hrs)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    ColNo += 1;
                    Entercell(Row, 30, FORMAT(ROUND(Total_Cost[4], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                    //  ModifyCell(headerrow,ColNo,'Total Cost',TRUE,TempExcelbuffer."Cell Type" :: Text);
                END;
        END
        ELSE
            CurrReport.SHOWOUTPUT := FALSE;
        // Production BOM Header, GroupFooter (9) - OnPreSection() <<

        // Production BOM Header, GroupFooter (10) - OnPreSection() >>

        IF STRLEN(FORMAT(ROUND(Totals[5] * 60 MOD 60, 1))) = 1 THEN
            MIN := '0' + FORMAT(ROUND(Totals[5] * 60 MOD 60, 1))
        ELSE
            MIN := FORMAT(ROUND(Totals[5] * 60 MOD 60, 1));
        TOT_BENCH_MARK := FORMAT(Totals[5] * 60 DIV 60) + ':' + MIN;
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[5] * 60 DIV 60, 3)); //pranavi
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[5], 0.01));
        IF (Totals[5] > 0) THEN BEGIN
            CurrReport.SHOWOUTPUT := TRUE;
            IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                Row += 1;
                Entercell(Row, 1, 'CST', TRUE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 3, FORMAT(Hour_Cost[5]), FALSE, TempExcelbuffer."Cell Type"::Number);
                Entercell(Row, 4, FORMAT(Total_Cost[5]), FALSE, TempExcelbuffer."Cell Type"::Number);
            END
            ELSE
                IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                    ColNo += 1;
                    //    Entercell(Row,ColNo,'CST',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    ColNo += 1;
                    Entercell(Row, 31, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                    //ModifyCell(headerrow,ColNo,'Bench Mark(Hrs)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    ColNo += 1;
                    Entercell(Row, 32, FORMAT(ROUND(Total_Cost[5], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                    //ModifyCell(headerrow,ColNo,'Total Cost',TRUE,TempExcelbuffer."Cell Type" :: Text);
                END;
        END
        ELSE
            CurrReport.SHOWOUTPUT := FALSE;
        // Production BOM Header, GroupFooter (10) - OnPreSection() <<

        // Production BOM Header, GroupFooter (11) - OnPreSection() >>

        IF STRLEN(FORMAT(ROUND(Totals[6] * 60 MOD 60, 1))) = 1 THEN
            MIN := '0' + FORMAT(ROUND(Totals[6] * 60 MOD 60, 1))
        ELSE
            MIN := FORMAT(ROUND(Totals[6] * 60 MOD 60, 1));
        TOT_BENCH_MARK := FORMAT(Totals[6] * 60 DIV 60) + ':' + MIN;
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[6] * 60 DIV 60, 3)); //pranavi
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[6], 0.01));
        IF (Totals[6] > 0) THEN BEGIN
            CurrReport.SHOWOUTPUT := TRUE;
            IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                Row += 1;
                Entercell(Row, 1, 'DESIGN', TRUE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 3, FORMAT(Hour_Cost[6]), FALSE, TempExcelbuffer."Cell Type"::Number);
                Entercell(Row, 4, FORMAT(Total_Cost[6]), FALSE, TempExcelbuffer."Cell Type"::Number);
            END
            ELSE
                IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                    ColNo += 1;
                    //  Entercell(Row,ColNo,'DESGIN',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    ColNo += 1;
                    Entercell(Row, 25, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                    //ModifyCell(headerrow,ColNo,'Bench Mark(Hrs)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    ColNo += 1;
                    Entercell(Row, 26, FORMAT(ROUND(Total_Cost[6], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                    // ModifyCell(headerrow,ColNo,'Total Cost',TRUE,TempExcelbuffer."Cell Type" :: Text);
                END;
        END
        ELSE
            CurrReport.SHOWOUTPUT := FALSE;

        // Production BOM Header, GroupFooter (11) - OnPreSection() <<

        // Production BOM Header, GroupFooter (12) - OnPreSection() >>

        IF STRLEN(FORMAT(ROUND(Totals[7] * 60 MOD 60, 1))) = 1 THEN
            MIN := '0' + FORMAT(ROUND(Totals[7] * 60 MOD 60, 1))
        ELSE
            MIN := FORMAT(ROUND(Totals[7] * 60 MOD 60, 1));
        TOT_BENCH_MARK := FORMAT(Totals[7] * 60 DIV 60) + ':' + MIN;
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[7] * 60 DIV 60, 3)); //pranavi
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[7], 0.01));
        IF (Totals[7] > 0) THEN BEGIN
            CurrReport.SHOWOUTPUT := TRUE;
            IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                Row += 1;
                Entercell(Row, 1, 'MCH', TRUE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 3, FORMAT(Hour_Cost[7]), FALSE, TempExcelbuffer."Cell Type"::Number);
                Entercell(Row, 4, FORMAT(Total_Cost[7]), FALSE, TempExcelbuffer."Cell Type"::Number);
            END
            ELSE
                IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                    ColNo += 1;
                    //    Entercell(Row,ColNo,'MCH',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    ColNo += 1;
                    Entercell(Row, 3, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                    //ModifyCell(headerrow,ColNo,'Bench Mark(Hrs)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    ColNo += 1;
                    Entercell(Row, 4, FORMAT(ROUND(Total_Cost[7], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                    // ModifyCell(headerrow,ColNo,'Total Cost',TRUE,TempExcelbuffer."Cell Type" :: Text);
                END;
        END
        ELSE
            CurrReport.SHOWOUTPUT := FALSE;

        // Production BOM Header, GroupFooter (12) - OnPreSection() <<

        // Production BOM Header, GroupFooter (13) - OnPreSection() >>

        IF STRLEN(FORMAT(ROUND(Totals[8] * 60 MOD 60, 1))) = 1 THEN
            MIN := '0' + FORMAT(ROUND(Totals[8] * 60 MOD 60, 1))
        ELSE
            MIN := FORMAT(ROUND(Totals[8] * 60 MOD 60, 1));
        TOT_BENCH_MARK := FORMAT(Totals[8] * 60 DIV 60) + ':' + MIN;
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[8] * 60 DIV 60, 3)); //pranavi
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[8], 0.01));
        IF (Totals[8] > 0) THEN BEGIN
            CurrReport.SHOWOUTPUT := TRUE;
            IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                Row += 1;
                Entercell(Row, 1, 'MPR', TRUE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 3, FORMAT(Hour_Cost[8]), FALSE, TempExcelbuffer."Cell Type"::Number);
                Entercell(Row, 4, FORMAT(Total_Cost[8]), FALSE, TempExcelbuffer."Cell Type"::Number);
            END
            ELSE
                IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                    ColNo += 1;
                    //    Entercell(Row,ColNo,'MPR',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    ColNo += 1;
                    Entercell(Row, 5, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                    // ModifyCell(headerrow,ColNo,'Bench Mark(Hrs)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    ColNo += 1;
                    Entercell(Row, 6, FORMAT(ROUND(Total_Cost[8], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                    //ModifyCell(headerrow,ColNo,'Total Cost',TRUE,TempExcelbuffer."Cell Type" :: Text);
                END;
        END
        ELSE
            CurrReport.SHOWOUTPUT := FALSE;

        // Production BOM Header, GroupFooter (13) - OnPreSection() <<

        // Production BOM Header, GroupFooter (14) - OnPreSection() >>

        IF STRLEN(FORMAT(ROUND(Totals[9] * 60 MOD 60, 1))) = 1 THEN
            MIN := '0' + FORMAT(ROUND(Totals[9] * 60 MOD 60, 1))
        ELSE
            MIN := FORMAT(ROUND(Totals[9] * 60 MOD 60, 1));
        TOT_BENCH_MARK := FORMAT(Totals[9] * 60 DIV 60) + ':' + MIN;
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[9] * 60 DIV 60, 3)); //pranavi
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[9], 0.01));
        IF (Totals[9] > 0) THEN BEGIN
            CurrReport.SHOWOUTPUT := TRUE;
            IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                Row += 1;
                Entercell(Row, 1, 'PRODUCTION 1', TRUE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 3, FORMAT(Hour_Cost[9]), FALSE, TempExcelbuffer."Cell Type"::Number);
                Entercell(Row, 4, FORMAT(Total_Cost[9]), FALSE, TempExcelbuffer."Cell Type"::Number);
            END
            ELSE
                IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                    ColNo += 1;
                    // Entercell(Row,ColNo,'PRODUCTION 1',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    ColNo += 1;
                    Entercell(Row, 7, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                    // ModifyCell(headerrow,ColNo,'Bench Mark(Hrs)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    ColNo += 1;
                    Entercell(Row, 8, FORMAT(ROUND(Total_Cost[9], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                    // ModifyCell(headerrow,ColNo,'Total Cost',TRUE,TempExcelbuffer."Cell Type" :: Text);
                END;
        END
        ELSE
            CurrReport.SHOWOUTPUT := FALSE;

        // Production BOM Header, GroupFooter (14) - OnPreSection() <<

        // Production BOM Header, GroupFooter (15) - OnPreSection() >>

        IF STRLEN(FORMAT(ROUND(Totals[10] * 60 MOD 60, 1))) = 1 THEN
            MIN := '0' + FORMAT(ROUND(Totals[10] * 60 MOD 60, 1))
        ELSE
            MIN := FORMAT(ROUND(Totals[10] * 60 MOD 60, 1));
        TOT_BENCH_MARK := FORMAT(Totals[10] * 60 DIV 60) + ':' + MIN;
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[10] * 60 DIV 60, 3)); //pranavi
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[10], 0.01));
        IF (Totals[10] > 0) THEN BEGIN
            CurrReport.SHOWOUTPUT := TRUE;
            IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                Row += 1;
                Entercell(Row, 1, 'PRODUCTION 2', TRUE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 3, FORMAT(Hour_Cost[10]), FALSE, TempExcelbuffer."Cell Type"::Number);
                Entercell(Row, 4, FORMAT(Total_Cost[10]), FALSE, TempExcelbuffer."Cell Type"::Number);
            END
            ELSE
                IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                    ColNo += 1;
                    // Entercell(Row,ColNo,'PRODUCTION 2',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    ColNo += 1;
                    Entercell(Row, 9, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                    // ModifyCell(headerrow,ColNo,'Bench Mark(Hrs)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    ColNo += 1;
                    Entercell(Row, 10, FORMAT(ROUND(Total_Cost[10], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                    // ModifyCell(headerrow,ColNo,'Total Cost',TRUE,TempExcelbuffer."Cell Type" :: Text);
                END;
        END
        ELSE
            CurrReport.SHOWOUTPUT := FALSE;

        // Production BOM Header, GroupFooter (15) - OnPreSection() <<

        // Production BOM Header, GroupFooter (16) - OnPreSection() >>

        IF STRLEN(FORMAT(ROUND(Totals[11] * 60 MOD 60, 1))) = 1 THEN
            MIN := '0' + FORMAT(ROUND(Totals[11] * 60 MOD 60, 1))
        ELSE
            MIN := FORMAT(ROUND(Totals[11] * 60 MOD 60, 1));
        TOT_BENCH_MARK := FORMAT(Totals[11] * 60 DIV 60) + ':' + MIN;
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[11] * 60 DIV 60, 3)); //pranavi
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[11], 0.01));
        IF (Totals[11] > 0) THEN BEGIN
            CurrReport.SHOWOUTPUT := TRUE;
            IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                Row += 1;
                Entercell(Row, 1, 'PRODUCTION 3', TRUE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 3, FORMAT(Hour_Cost[11]), FALSE, TempExcelbuffer."Cell Type"::Number);
                Entercell(Row, 4, FORMAT(Total_Cost[11]), FALSE, TempExcelbuffer."Cell Type"::Number);
            END
            ELSE
                IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                    ColNo += 1;
                    //  Entercell(Row,ColNo,'PRODUCTION 3',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    ColNo += 1;
                    Entercell(Row, 11, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                    // ModifyCell(headerrow,ColNo,'Bench Mark(Hrs)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    ColNo += 1;
                    Entercell(Row, 12, FORMAT(ROUND(Total_Cost[11], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                    // ModifyCell(headerrow,ColNo,'Total Cost',TRUE,TempExcelbuffer."Cell Type" :: Text);
                END;
        END
        ELSE
            CurrReport.SHOWOUTPUT := FALSE;

        // Production BOM Header, GroupFooter (16) - OnPreSection() <<

        // Production BOM Header, GroupFooter (17) - OnPreSection() >>

        IF STRLEN(FORMAT(ROUND(Totals[12] * 60 MOD 60, 1))) = 1 THEN
            MIN := '0' + FORMAT(ROUND(Totals[12] * 60 MOD 60, 1))
        ELSE
            MIN := FORMAT(ROUND(Totals[12] * 60 MOD 60, 1));
        TOT_BENCH_MARK := FORMAT(Totals[12] * 60 DIV 60) + ':' + MIN;
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[12] * 60 DIV 60, 3)); //pranavi
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[12], 0.01));

        IF (Totals[12] > 0) THEN BEGIN
            CurrReport.SHOWOUTPUT := TRUE;
            IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                Row += 1;
                Entercell(Row, 1, 'PRODUCTION 4', TRUE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 3, FORMAT(Hour_Cost[12]), FALSE, TempExcelbuffer."Cell Type"::Number);
                Entercell(Row, 4, FORMAT(Total_Cost[12]), FALSE, TempExcelbuffer."Cell Type"::Number);
            END
            ELSE
                IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                    ColNo += 1;
                    //    Entercell(Row,ColNo,'PRODUCTION 4',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    ColNo += 1;
                    Entercell(Row, 13, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                    // ModifyCell(headerrow,ColNo,'Bench Mark(Hrs)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    ColNo += 1;
                    Entercell(Row, 14, FORMAT(ROUND(Total_Cost[12], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                    // ModifyCell(headerrow,ColNo,'Total Cost',TRUE,TempExcelbuffer."Cell Type" :: Text);
                END;
        END
        ELSE
            CurrReport.SHOWOUTPUT := FALSE;

        // Production BOM Header, GroupFooter (17) - OnPreSection() <<

        // Production BOM Header, GroupFooter (18) - OnPreSection() >>

        IF STRLEN(FORMAT(ROUND(Totals[13] * 60 MOD 60, 1))) = 1 THEN
            MIN := '0' + FORMAT(ROUND(Totals[13] * 60 MOD 60, 1))
        ELSE
            MIN := FORMAT(ROUND(Totals[13] * 60 MOD 60, 1));
        TOT_BENCH_MARK := FORMAT(Totals[13] * 60 DIV 60) + ':' + MIN;
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[13] * 60 DIV 60, 3)); //pranavi
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[13], 0.01));
        IF (Totals[13] > 0) THEN BEGIN
            CurrReport.SHOWOUTPUT := TRUE;
            IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                Row += 1;
                Entercell(Row, 1, 'PSD', TRUE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 3, FORMAT(Hour_Cost[13]), FALSE, TempExcelbuffer."Cell Type"::Number);
                Entercell(Row, 4, FORMAT(Total_Cost[13]), FALSE, TempExcelbuffer."Cell Type"::Number);
            END
            ELSE
                IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                    ColNo += 1;
                    //    Entercell(Row,ColNo,'PSD',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    ColNo += 1;
                    /*
                    TempExcelbuffer.RESET;
                    TempExcelbuffer.SETFILTER(TempExcelbuffer."Row No.",'%1',Row);
                    TempExcelbuffer.SETFILTER(TempExcelbuffer."Column No.",'%1',15);
                    IF TempExcelbuffer.FINDFIRST THEN
                      message('cell value: '+TempExcelbuffer."Cell Value as Text");
                    */
                    Entercell(Row, 15, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                    // ModifyCell(headerrow,ColNo,'Bench Mark(Hrs)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    ColNo += 1;
                    Entercell(Row, 16, FORMAT(ROUND(Total_Cost[13], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                    //  ModifyCell(headerrow,ColNo,'Total Cost',TRUE,TempExcelbuffer."Cell Type" :: Text);
                END;
        END
        ELSE
            CurrReport.SHOWOUTPUT := FALSE;
        // Production BOM Header, GroupFooter (18) - OnPreSection() <<

        // Production BOM Header, GroupFooter (19) - OnPreSection() >>

        IF STRLEN(FORMAT(ROUND(Totals[14] * 60 MOD 60, 1))) = 1 THEN
            MIN := '0' + FORMAT(ROUND(Totals[14] * 60 MOD 60, 1))
        ELSE
            MIN := FORMAT(ROUND(Totals[14] * 60 MOD 60, 1));
        TOT_BENCH_MARK := FORMAT(Totals[14] * 60 DIV 60) + ':' + MIN;
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[14] * 60 DIV 60, 3)); //pranavi
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[14], 0.01));
        IF (Totals[14] > 0) THEN BEGIN
            CurrReport.SHOWOUTPUT := TRUE;
            IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                Row += 1;
                Entercell(Row, 1, 'QC', TRUE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 3, FORMAT(Hour_Cost[14]), FALSE, TempExcelbuffer."Cell Type"::Number);
                Entercell(Row, 4, FORMAT(Total_Cost[14]), FALSE, TempExcelbuffer."Cell Type"::Number);
            END
            ELSE
                IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                    ColNo += 1;
                    //  Entercell(Row,ColNo,'QC',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    ColNo += 1;
                    Entercell(Row, 19, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                    // ModifyCell(headerrow,ColNo,'Bench Mark(Hrs)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    ColNo += 1;
                    Entercell(Row, 20, FORMAT(ROUND(Total_Cost[14], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                    //  ModifyCell(headerrow,ColNo,'Total Cost',TRUE,TempExcelbuffer."Cell Type" :: Text);
                END;
        END
        ELSE
            CurrReport.SHOWOUTPUT := FALSE;
        // Production BOM Header, GroupFooter (19) - OnPreSection() <<

        // Production BOM Header, GroupFooter (20) - OnPreSection() >>

        IF STRLEN(FORMAT(ROUND(Totals[15] * 60 MOD 60, 1))) = 1 THEN
            MIN := '0' + FORMAT(ROUND(Totals[15] * 60 MOD 60, 1))
        ELSE
            MIN := FORMAT(ROUND(Totals[15] * 60 MOD 60, 1));
        TOT_BENCH_MARK := FORMAT(Totals[15] * 60 DIV 60) + ':' + MIN;
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[15] * 60 DIV 60, 3)); //pranavi
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[15], 0.01));
        IF (Totals[15] > 0) THEN BEGIN
            CurrReport.SHOWOUTPUT := TRUE;
            IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                Row += 1;
                Entercell(Row, 1, 'RHW', TRUE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 3, FORMAT(Hour_Cost[15]), FALSE, TempExcelbuffer."Cell Type"::Number);
                Entercell(Row, 4, FORMAT(Total_Cost[15]), FALSE, TempExcelbuffer."Cell Type"::Number);
            END
            ELSE
                IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                    ColNo += 1;
                    //    Entercell(Row,ColNo,'RHW',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    ColNo += 1;
                    Entercell(Row, 21, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                    //ModifyCell(headerrow,ColNo,'Bench Mark(Hrs)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    ColNo += 1;
                    Entercell(Row, 22, FORMAT(ROUND(Total_Cost[15], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                    // ModifyCell(headerrow,ColNo,'Total Cost',TRUE,TempExcelbuffer."Cell Type" :: Text);
                END;
        END
        ELSE
            CurrReport.SHOWOUTPUT := FALSE;

        // Production BOM Header, GroupFooter (20) - OnPreSection() <<

        // Production BOM Header, GroupFooter (21) - OnPreSection() >>

        IF STRLEN(FORMAT(ROUND(Totals[16] * 60 MOD 60, 1))) = 1 THEN
            MIN := '0' + FORMAT(ROUND(Totals[16] * 60 MOD 60, 1))
        ELSE
            MIN := FORMAT(ROUND(Totals[16] * 60 MOD 60, 1));
        TOT_BENCH_MARK := FORMAT(Totals[16] * 60 DIV 60) + ':' + MIN;
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[16] * 60 DIV 60, 3)); //pranavi
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[16], 0.01));
        IF (Totals[16] > 0) THEN BEGIN
            CurrReport.SHOWOUTPUT := TRUE;
            IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                Row += 1;
                Entercell(Row, 1, 'SHOP FLOOR', TRUE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 3, FORMAT(Hour_Cost[16]), FALSE, TempExcelbuffer."Cell Type"::Number);
                Entercell(Row, 4, FORMAT(Total_Cost[16]), FALSE, TempExcelbuffer."Cell Type"::Number);
            END
            ELSE
                IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                    ColNo += 1;
                    //    Entercell(Row,ColNo,'SHOP FLOOR',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    ColNo += 1;
                    Entercell(Row, 17, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                    //  ModifyCell(headerrow,ColNo,'Bench Mark(Hrs)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    ColNo += 1;
                    Entercell(Row, 18, FORMAT(ROUND(Total_Cost[16], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                    // ModifyCell(headerrow,ColNo,'Total Cost',TRUE,TempExcelbuffer."Cell Type" :: Text);
                END;
        END
        ELSE
            CurrReport.SHOWOUTPUT := FALSE;

        // Production BOM Header, GroupFooter (21) - OnPreSection() <<

        // Production BOM Header, GroupFooter (22) - OnPreSection() >>

        IF STRLEN(FORMAT(ROUND(Totals[17] * 60 MOD 60, 1))) = 1 THEN
            MIN := '0' + FORMAT(ROUND(Totals[17] * 60 MOD 60, 1))
        ELSE
            MIN := FORMAT(ROUND(Totals[17] * 60 MOD 60, 1));
        TOT_BENCH_MARK := FORMAT(Totals[17] * 60 DIV 60) + ':' + MIN;
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[17] * 60 DIV 60, 3)); //pranavi
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[17], 0.01));
        IF (Totals[17] > 0) THEN BEGIN
            CurrReport.SHOWOUTPUT := TRUE;
            IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                Row += 1;
                Entercell(Row, 1, 'STR', TRUE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 3, FORMAT(Hour_Cost[17]), FALSE, TempExcelbuffer."Cell Type"::Number);
                Entercell(Row, 4, FORMAT(Total_Cost[17]), FALSE, TempExcelbuffer."Cell Type"::Number);
            END
            ELSE
                IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                    ColNo += 1;
                    //    Entercell(Row,ColNo,'STR',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    ColNo += 1;
                    Entercell(Row, 23, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                    //  ModifyCell(headerrow,ColNo,'Bench Mark(Hrs)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    ColNo += 1;
                    Entercell(Row, 24, FORMAT(ROUND(Total_Cost[17], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                    //  ModifyCell(headerrow,ColNo,'Total Cost',TRUE,TempExcelbuffer."Cell Type" :: Text);
                END;
        END
        ELSE
            CurrReport.SHOWOUTPUT := FALSE;
        // Production BOM Header, GroupFooter (22) - OnPreSection() <<

        // Production BOM Header, GroupFooter (23) - OnPreSection() >>

        IF STRLEN(FORMAT(ROUND(Totals[18] * 60 MOD 60, 1))) = 1 THEN
            MIN := '0' + FORMAT(ROUND(Totals[18] * 60 MOD 60, 1))
        ELSE
            MIN := FORMAT(ROUND(Totals[18] * 60 MOD 60, 1));
        TOT_BENCH_MARK := FORMAT(Totals[18] * 60 DIV 60) + ':' + MIN;
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[18] * 60 DIV 60, 3)); //pranavi
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[18], 0.01));

        IF (Totals[18] > 0) THEN BEGIN
            CurrReport.SHOWOUTPUT := TRUE;
            IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                Row += 1;
                Entercell(Row, 1, 'WAIT TIME', TRUE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 3, FORMAT(Hour_Cost[18]), FALSE, TempExcelbuffer."Cell Type"::Number);
                Entercell(Row, 4, FORMAT(Total_Cost[18]), FALSE, TempExcelbuffer."Cell Type"::Number);
            END
            ELSE
                IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                    ColNo += 1;
                    // Entercell(Row,ColNo,'WAIT TIME',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    ColNo += 1;
                    Entercell(Row, 37, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                    //ModifyCell(headerrow,ColNo,'Bench Mark(Hrs)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    ColNo += 1;
                    Entercell(Row, 38, FORMAT(ROUND(Total_Cost[18], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                    // ModifyCell(headerrow,ColNo,'Total Cost',TRUE,TempExcelbuffer."Cell Type" :: Text);
                END;
        END
        ELSE
            CurrReport.SHOWOUTPUT := FALSE;

        // Production BOM Header, GroupFooter (23) - OnPreSection() <<


        // Production BOM Header, GroupFooter (24) - OnPreSection() >>
        IF STRLEN(FORMAT(ROUND(Totals[19] * 60 MOD 60, 1))) = 1 THEN
            MIN := '0' + FORMAT(ROUND(Totals[19] * 60 MOD 60, 1))
        ELSE
            MIN := FORMAT(ROUND(Totals[19] * 60 MOD 60, 1));
        TOT_BENCH_MARK := FORMAT(Totals[19] * 60 DIV 60) + ':' + MIN;
        //TOT_BENCH_MARK:= FORMAT(ROUND(Totals[19]*60 DIV 60,3)); //pranavi
        TOT_BENCH_MARK := TOT_BENCH_MARK + ', ' + FORMAT(ROUND(Totals[19], 0.01));
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[19], 0.01));
        //CurrReport.SHOWOUTPUT(Choice=Choice::Detail);

        IF (Totals[19] > 0) THEN BEGIN
            CurrReport.SHOWOUTPUT := TRUE;
            IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                Row += 1;
                Entercell(Row, 1, 'OUT SOURCING', TRUE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 3, FORMAT(Hour_Cost[19]), FALSE, TempExcelbuffer."Cell Type"::Number);
                Entercell(Row, 4, FORMAT(Total_Cost[19]), FALSE, TempExcelbuffer."Cell Type"::Number);
            END
            ELSE
                IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                    ColNo += 1;
                    // Entercell(Row,ColNo,'WAIT TIME',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    ColNo += 1;
                    Entercell(Row, 39, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                    //ModifyCell(headerrow,ColNo,'Bench Mark(Hrs)',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    ColNo += 1;
                    Entercell(Row, 40, FORMAT(ROUND(Total_Cost[19], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                    // ModifyCell(headerrow,ColNo,'Total Cost',TRUE,TempExcelbuffer."Cell Type" :: Text);
                END;
        END
        ELSE
            CurrReport.SHOWOUTPUT := FALSE;

        // Production BOM Header, GroupFooter (23) - OnPreSection() <<


        // Production BOM Header, GroupFooter (24) - OnPreSection() >>
        IF STRLEN(FORMAT(ROUND(Totals[20] * 60 MOD 60, 1))) = 1 THEN
            MIN := '0' + FORMAT(ROUND(Totals[20] * 60 MOD 60, 1))
        ELSE
            MIN := FORMAT(ROUND(Totals[20] * 60 MOD 60, 1));
        TOT_BENCH_MARK := FORMAT(Totals[20] * 60 DIV 60) + ':' + MIN;
        //TOT_BENCH_MARK:= FORMAT(ROUND(Totals[19]*60 DIV 60,3)); //pranavi
        TOT_BENCH_MARK := TOT_BENCH_MARK + ', ' + FORMAT(ROUND(Totals[19], 0.01));
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[20], 0.01));
        //CurrReport.SHOWOUTPUT(Choice=Choice::Detail);


        IF (Totals[20] > 0) THEN BEGIN
            CurrReport.SHOWOUTPUT := TRUE;
            IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                Row += 1;
                Entercell(Row, 1, 'DIS', TRUE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 3, FORMAT(Hour_Cost[20]), FALSE, TempExcelbuffer."Cell Type"::Number);
                Entercell(Row, 4, FORMAT(Total_Cost[20]), FALSE, TempExcelbuffer."Cell Type"::Number);
            END
            ELSE
                IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                    ColNo += 1;
                    ColNo += 1;
                    Entercell(Row, 42, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                    ColNo += 1;
                    Entercell(Row, 43, FORMAT(ROUND(Total_Cost[20], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                END;
        END
        ELSE
            CurrReport.SHOWOUTPUT := FALSE;

        IF STRLEN(FORMAT(ROUND(Totals[21] * 60 MOD 60, 1))) = 1 THEN
            MIN := '0' + FORMAT(ROUND(Totals[21] * 60 MOD 60, 1))
        ELSE
            MIN := FORMAT(ROUND(Totals[21] * 60 MOD 60, 1));
        TOT_BENCH_MARK := FORMAT(Totals[21] * 60 DIV 60) + ':' + MIN;
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[21], 0.01));

        IF (Totals[21] > 0) THEN BEGIN
            CurrReport.SHOWOUTPUT := TRUE;
            IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                Row += 1;
                Entercell(Row, 1, 'OTHER DEPT', TRUE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 3, FORMAT(Hour_Cost[21]), FALSE, TempExcelbuffer."Cell Type"::Number);
                Entercell(Row, 4, FORMAT(Total_Cost[21]), FALSE, TempExcelbuffer."Cell Type"::Number);
            END
            ELSE
                IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                    ColNo += 1;
                    ColNo += 1;
                    Entercell(Row, 44, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                    ColNo += 1;
                    Entercell(Row, 45, FORMAT(ROUND(Total_Cost[21], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                END;
        END
        ELSE
            CurrReport.SHOWOUTPUT := FALSE;

        IF STRLEN(FORMAT(ROUND(Totals[22] * 60 MOD 60, 1))) = 1 THEN
            MIN := '0' + FORMAT(ROUND(Totals[22] * 60 MOD 60, 1))
        ELSE
            MIN := FORMAT(ROUND(Totals[22] * 60 MOD 60, 1));
        TOT_BENCH_MARK := FORMAT(Totals[22] * 60 DIV 60) + ':' + MIN;
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[22], 0.01));


        IF (Totals[22] > 0) THEN BEGIN
            CurrReport.SHOWOUTPUT := TRUE;
            IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                Row += 1;
                Entercell(Row, 1, 'OTHER DEPT(MPR)', TRUE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 3, FORMAT(Hour_Cost[22]), FALSE, TempExcelbuffer."Cell Type"::Number);
                Entercell(Row, 4, FORMAT(Total_Cost[22]), FALSE, TempExcelbuffer."Cell Type"::Number);
            END
            ELSE
                IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                    ColNo += 1;
                    ColNo += 1;
                    Entercell(Row, 46, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                    ColNo += 1;
                    Entercell(Row, 47, FORMAT(ROUND(Total_Cost[22], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                END;
        END
        ELSE
            CurrReport.SHOWOUTPUT := FALSE;

        IF STRLEN(FORMAT(ROUND(Totals[23] * 60 MOD 60, 1))) = 1 THEN
            MIN := '0' + FORMAT(ROUND(Totals[23] * 60 MOD 60, 1))
        ELSE
            MIN := FORMAT(ROUND(Totals[23] * 60 MOD 60, 1));
        TOT_BENCH_MARK := FORMAT(Totals[23] * 60 DIV 60) + ':' + MIN;
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[23], 0.01));

        IF (Totals[23] > 0) THEN BEGIN
            CurrReport.SHOWOUTPUT := TRUE;
            IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                Row += 1;
                Entercell(Row, 1, 'OTHER DEPT(SHF)', TRUE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 3, FORMAT(Hour_Cost[23]), FALSE, TempExcelbuffer."Cell Type"::Number);
                Entercell(Row, 4, FORMAT(Total_Cost[23]), FALSE, TempExcelbuffer."Cell Type"::Number);
            END
            ELSE
                IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                    ColNo += 1;
                    ColNo += 1;
                    Entercell(Row, 48, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                    ColNo += 1;
                    Entercell(Row, 49, FORMAT(ROUND(Total_Cost[23], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                END;
        END
        ELSE
            CurrReport.SHOWOUTPUT := FALSE;

        IF STRLEN(FORMAT(ROUND(Totals[24] * 60 MOD 60, 1))) = 1 THEN
            MIN := '0' + FORMAT(ROUND(Totals[24] * 60 MOD 60, 1))
        ELSE
            MIN := FORMAT(ROUND(Totals[24] * 60 MOD 60, 1));
        TOT_BENCH_MARK := FORMAT(Totals[24] * 60 DIV 60) + ':' + MIN;
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[24], 0.01));

        IF (Totals[24] > 0) THEN BEGIN
            CurrReport.SHOWOUTPUT := TRUE;
            IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                Row += 1;
                Entercell(Row, 1, 'TCE', TRUE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 3, FORMAT(Hour_Cost[24]), FALSE, TempExcelbuffer."Cell Type"::Number);
                Entercell(Row, 4, FORMAT(Total_Cost[24]), FALSE, TempExcelbuffer."Cell Type"::Number);
            END
            ELSE
                IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                    ColNo += 1;
                    ColNo += 1;
                    Entercell(Row, 50, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                    ColNo += 1;
                    Entercell(Row, 51, FORMAT(ROUND(Total_Cost[24], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                END;
        END
        ELSE
            CurrReport.SHOWOUTPUT := FALSE;

        IF STRLEN(FORMAT(ROUND(Totals[25] * 60 MOD 60, 1))) = 1 THEN
            MIN := '0' + FORMAT(ROUND(Totals[25] * 60 MOD 60, 1))
        ELSE
            MIN := FORMAT(ROUND(Totals[25] * 60 MOD 60, 1));
        TOT_BENCH_MARK := FORMAT(Totals[25] * 60 DIV 60) + ':' + MIN;
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[25], 0.01));

        IF (Totals[25] > 0) THEN BEGIN
            CurrReport.SHOWOUTPUT := TRUE;
            IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                Row += 1;
                Entercell(Row, 1, 'TST', TRUE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 3, FORMAT(Hour_Cost[25]), FALSE, TempExcelbuffer."Cell Type"::Number);
                Entercell(Row, 4, FORMAT(Total_Cost[25]), FALSE, TempExcelbuffer."Cell Type"::Number);
            END
            ELSE
                IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                    ColNo += 1;
                    ColNo += 1;
                    Entercell(Row, 52, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                    ColNo += 1;
                    Entercell(Row, 53, FORMAT(ROUND(Total_Cost[25], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                END;
        END
        ELSE
            CurrReport.SHOWOUTPUT := FALSE;

        IF STRLEN(FORMAT(ROUND(Totals[26] * 60 MOD 60, 1))) = 1 THEN
            MIN := '0' + FORMAT(ROUND(Totals[26] * 60 MOD 60, 1))
        ELSE
            MIN := FORMAT(ROUND(Totals[26] * 60 MOD 60, 1));
        TOT_BENCH_MARK := FORMAT(Totals[26] * 60 DIV 60) + ':' + MIN;
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[26], 0.01));


        IF (Totals[26] > 0) THEN BEGIN
            CurrReport.SHOWOUTPUT := TRUE;
            IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
                Row += 1;
                Entercell(Row, 1, 'WIR', TRUE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                Entercell(Row, 3, FORMAT(Hour_Cost[26]), FALSE, TempExcelbuffer."Cell Type"::Number);
                Entercell(Row, 4, FORMAT(Total_Cost[26]), FALSE, TempExcelbuffer."Cell Type"::Number);
            END
            ELSE
                IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                    ColNo += 1;
                    ColNo += 1;
                    Entercell(Row, 54, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
                    ColNo += 1;
                    Entercell(Row, 55, FORMAT(ROUND(Total_Cost[26], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                END;
        END
        ELSE
            CurrReport.SHOWOUTPUT := FALSE;

        IF STRLEN(FORMAT(ROUND(Totals[27] * 60 MOD 60, 1))) = 1 THEN
            MIN := '0' + FORMAT(ROUND(Totals[27] * 60 MOD 60, 1))
        ELSE
            MIN := FORMAT(ROUND(Totals[27] * 60 MOD 60, 1));
        TOT_BENCH_MARK := FORMAT(Totals[27] * 60 DIV 60) + ':' + MIN;
        TOT_BENCH_MARK := FORMAT(ROUND(Totals[27], 0.01));




        IF EXCEL AND (Choice = Choice::Detail) THEN BEGIN
            Row += 1;
            Entercell(Row, 4, FORMAT(ROUND(Total_Cost[27], 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
            Entercell(Row, 2, TOT_BENCH_MARK, FALSE, TempExcelbuffer."Cell Type"::Text);
        END
        ELSE
            IF EXCEL AND (Choice = Choice::Brief) THEN BEGIN
                ColNo += 1;
                EnterHeadings(Row, 41, TOT_BENCH_MARK, TRUE, TempExcelbuffer."Cell Type"::Text);
                ColNo += 1;
                EnterHeadings(Row, 42, FORMAT(ROUND(Total_Cost[19], 0.01)), TRUE, TempExcelbuffer."Cell Type"::Text);
            END;
        // Production BOM Header, GroupFooter (24) - OnPreSection() <<

    end;

    (6462)]
    procedure Dept_Hourt_Cost();
    begin

        // Production BOM Header, GroupFooter (5) - OnPreSection() >>
        Work_Center.SETRANGE(Work_Center."No.", 'CDA');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[1] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETFILTER(Work_Center."No.", 'CHW');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[2] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETFILTER(Work_Center."No.", 'CSA');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[3] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETRANGE(Work_Center."No.", 'CSM');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[4] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETRANGE(Work_Center."No.", 'CST');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[5] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETRANGE(Work_Center."No.", 'DES');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[6] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETRANGE(Work_Center."No.", 'MCH');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[7] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETRANGE(Work_Center."No.", 'MPR');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[8] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETRANGE(Work_Center."No.", 'P1');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[9] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETRANGE(Work_Center."No.", 'P2');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[10] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETRANGE(Work_Center."No.", 'P3');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[11] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETRANGE(Work_Center."No.", 'P4');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[12] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETRANGE(Work_Center."No.", 'PSD');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[13] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETRANGE(Work_Center."No.", 'QAS');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[14] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETRANGE(Work_Center."No.", 'RHW');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[15] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETRANGE(Work_Center."No.", 'SHF');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[16] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        Work_Center.SETRANGE(Work_Center."No.", 'STR');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[17] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;


        Work_Center.SETRANGE(Work_Center."No.", 'WAIT TIME');
        IF Work_Center.FIND('-') THEN
            Hour_Cost[18] := Work_Center."Unit Cost" * 60;
        Work_Center.RESET;

        //CurrReport.SHOWOUTPUT(Choice=Choice::Detail);
        IF EXCEL AND (Choice = Choice::Brief) THEN // commented by pranavi on 16-mar-2016
        BEGIN
            Row += 1;
            EnterHeadings(Row, 1, 'DEPARTMENTS', TRUE, TempExcelbuffer."Cell Type"::Text);
            Entercell(Row, 2, 'CDA', TRUE, TempExcelbuffer."Cell Type"::Text);
            Entercell(Row, 3, 'CHW', TRUE, TempExcelbuffer."Cell Type"::Text);
            Entercell(Row, 4, 'CSA', TRUE, TempExcelbuffer."Cell Type"::Text);
            Entercell(Row, 5, 'CSM', TRUE, TempExcelbuffer."Cell Type"::Text);
            Entercell(Row, 6, 'CST', TRUE, TempExcelbuffer."Cell Type"::Text);
            Entercell(Row, 7, 'DESIGN', TRUE, TempExcelbuffer."Cell Type"::Text);
            Entercell(Row, 8, 'MCH', TRUE, TempExcelbuffer."Cell Type"::Text);
            Entercell(Row, 9, 'MPR', TRUE, TempExcelbuffer."Cell Type"::Text);
            Entercell(Row, 10, 'PRODUCTION 1', TRUE, TempExcelbuffer."Cell Type"::Text);
            Entercell(Row, 11, 'PRODUCTION 2', TRUE, TempExcelbuffer."Cell Type"::Text);
            Entercell(Row, 12, 'PRODUCTION 3', TRUE, TempExcelbuffer."Cell Type"::Text);
            Entercell(Row, 13, 'PRODUCTION 4', TRUE, TempExcelbuffer."Cell Type"::Text);
            Entercell(Row, 14, 'PSD', TRUE, TempExcelbuffer."Cell Type"::Text);
            Entercell(Row, 15, 'QC', TRUE, TempExcelbuffer."Cell Type"::Text);
            Entercell(Row, 16, 'RHW', TRUE, TempExcelbuffer."Cell Type"::Text);
            Entercell(Row, 17, 'SHOP FLOOR', TRUE, TempExcelbuffer."Cell Type"::Text);
            Entercell(Row, 18, 'STR', TRUE, TempExcelbuffer."Cell Type"::Text);
            Entercell(Row, 19, 'WAIT TIME', TRUE, TempExcelbuffer."Cell Type"::Text);
            Row += 1;
            EnterHeadings(Row, 1, 'HOUR COST', TRUE, TempExcelbuffer."Cell Type"::Text);
            Entercell(Row, 2, FORMAT(Hour_Cost[1]), TRUE, TempExcelbuffer."Cell Type"::Text);
            Entercell(Row, 3, FORMAT(Hour_Cost[2]), TRUE, TempExcelbuffer."Cell Type"::Text);
            Entercell(Row, 4, FORMAT(Hour_Cost[3]), TRUE, TempExcelbuffer."Cell Type"::Text);
            Entercell(Row, 5, FORMAT(Hour_Cost[4]), TRUE, TempExcelbuffer."Cell Type"::Text);
            Entercell(Row, 6, FORMAT(Hour_Cost[5]), TRUE, TempExcelbuffer."Cell Type"::Text);
            Entercell(Row, 7, FORMAT(Hour_Cost[6]), TRUE, TempExcelbuffer."Cell Type"::Text);
            Entercell(Row, 8, FORMAT(Hour_Cost[7]), TRUE, TempExcelbuffer."Cell Type"::Text);
            Entercell(Row, 9, FORMAT(Hour_Cost[8]), TRUE, TempExcelbuffer."Cell Type"::Text);
            Entercell(Row, 10, FORMAT(Hour_Cost[9]), TRUE, TempExcelbuffer."Cell Type"::Text);
            Entercell(Row, 11, FORMAT(Hour_Cost[10]), TRUE, TempExcelbuffer."Cell Type"::Text);
            Entercell(Row, 12, FORMAT(Hour_Cost[11]), TRUE, TempExcelbuffer."Cell Type"::Text);
            Entercell(Row, 13, FORMAT(Hour_Cost[12]), TRUE, TempExcelbuffer."Cell Type"::Text);
            Entercell(Row, 14, FORMAT(Hour_Cost[13]), TRUE, TempExcelbuffer."Cell Type"::Text);
            Entercell(Row, 15, FORMAT(Hour_Cost[14]), TRUE, TempExcelbuffer."Cell Type"::Text);
            Entercell(Row, 16, FORMAT(Hour_Cost[15]), TRUE, TempExcelbuffer."Cell Type"::Text);
            Entercell(Row, 17, FORMAT(Hour_Cost[16]), TRUE, TempExcelbuffer."Cell Type"::Text);
            Entercell(Row, 18, FORMAT(Hour_Cost[17]), TRUE, TempExcelbuffer."Cell Type"::Text);
            Entercell(Row, 19, FORMAT(Hour_Cost[18]), TRUE, TempExcelbuffer."Cell Type"::Text);
        END;
        Row += 1;
        Row += 1;
        EnterHeadings(Row, 3, 'MCH', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 5, 'MPR', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 7, 'PRODUCTION 1', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 9, 'PRODUCTION 2', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 11, 'PRODUCTION 3', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 13, 'PRODUCTION 4', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 15, 'PSD', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 17, 'SHOP FLOOR', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 19, 'QC', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 21, 'RWH', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 23, 'STR', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 25, 'DESIGN', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 27, 'CSA', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 29, 'CSM', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 31, 'CST', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 33, 'CDA', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 35, 'CHW', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 37, 'WAIT TIME', TRUE, TempExcelbuffer."Cell Type"::Text);
        Row += 1;
        EnterHeadings(Row, 1, 'BOM No.', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 2, 'BOM Description', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 3, 'Bench Mark(Hrs)', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 4, 'Total Cost', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 5, 'Bench Mark(Hrs)', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 6, 'Total Cost', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 7, 'Bench Mark(Hrs)', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 8, 'Total Cost', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 9, 'Bench Mark(Hrs)', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 10, 'Total Cost', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 11, 'Bench Mark(Hrs)', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 12, 'Total Cost', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 13, 'Bench Mark(Hrs)', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 14, 'Total Cost', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 15, 'Bench Mark(Hrs)', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 16, 'Total Cost', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 17, 'Bench Mark(Hrs)', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 18, 'Total Cost', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 19, 'Bench Mark(Hrs)', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 20, 'Total Cost', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 21, 'Bench Mark(Hrs)', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 22, 'Total Cost', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 23, 'Bench Mark(Hrs)', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 24, 'Total Cost', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 25, 'Bench Mark(Hrs)', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 26, 'Total Cost', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 27, 'Bench Mark(Hrs)', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 28, 'Total Cost', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 29, 'Bench Mark(Hrs)', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 30, 'Total Cost', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 31, 'Bench Mark(Hrs)', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 32, 'Total Cost', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 33, 'Bench Mark(Hrs)', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 34, 'Total Cost', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 35, 'Bench Mark(Hrs)', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 36, 'Total Cost', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 37, 'Bench Mark(Hrs)', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 38, 'Total Cost', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 39, 'Total Bench Mark(Hrs)', TRUE, TempExcelbuffer."Cell Type"::Text);
        EnterHeadings(Row, 40, 'Total Prod Cost', TRUE, TempExcelbuffer."Cell Type"::Text);
        headerrow := Row;
        MESSAGE('header row: ' + FORMAT(Row));
        //  MESSAGE('headerrow: '+FORMAT(headerrow));
        // Production BOM Header, GroupFooter (5) - OnPreSection() <<
    end;

    (6666)]
    procedure ModifyCell(RowNo: Integer; ColumnNo: Integer; CellValue: Text[1000]; bold: Boolean; CellType: Option);
    begin
        // Pranavi
        /*
        TempExcelbuffer.RESET;
        TempExcelbuffer.SETRANGE("Row No.",RowNo);
        TempExcelbuffer.SETRANGE("Column No.",ColumnNo);
        IF TempExcelbuffer.FINDFIRST THEN
        BEGIN
          TempExcelbuffer."Cell Value as Text" := CellValue;
          TempExcelbuffer.MODIFY;
        END
        ELSE
        BEGIN
        */
        TempExcelbuffer.INIT;
        TempExcelbuffer.VALIDATE("Row No.", RowNo);
        TempExcelbuffer.VALIDATE("Column No.", ColumnNo);
        TempExcelbuffer."Cell Value as Text" := CellValue;
        TempExcelbuffer.Bold := bold;
        TempExcelbuffer."Cell Type" := CellType;
        TempExcelbuffer.INSERT;
        /*
        END;
        // Pranavi End
        */

    end;
}

