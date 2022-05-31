report 99000764 "Prod. Order - Precalc. Time"
{
    // version NAVW19.00.00.45778,santhu

    DefaultLayout = RDLC;
    RDLCLayout = './Prod. Order - Precalc. Time.rdlc';
    CaptionML = ENU = 'Prod. Order - Precalc. Time',
                ENN = 'Prod. Order - Precalc. Time';

    dataset
    {
        dataitem("Production Order"; "Production Order")
        {
            DataItemTableView = SORTING(Status, No.);
            RequestFilterFields = Status, "No.", "Source No.";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PAGENO)
            {
            }
            column(Line; Line)
            {
            }
            column(Production_Order__TABLECAPTION_________ProdOrderFilter; TABLECAPTION + ':' + ProdOrderFilter)
            {
            }
            column(ProdOrderFilter; ProdOrderFilter)
            {
            }
            column(Production_Order__No__; "No.")
            {
            }
            column(Production_Order_Description; Description)
            {
            }
            column(Production_Order__Source_No__; "Source No.")
            {
            }
            column(Production_Order__Starting_Date_; FORMAT("Starting Date"))
            {
            }
            column(Production_Order__Ending_Date_; FORMAT("Ending Date"))
            {
            }
            column(Production_Order__Due_Date_; FORMAT("Due Date"))
            {
            }
            column(Production_Order_Quantity; Quantity)
            {
            }
            column(Production_Order_Status; Status)
            {
            }
            column(Prod__Order___Precalc__TimeCaption; Prod__Order___Precalc__TimeCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Production_Order__No__Caption; FIELDCAPTION("No."))
            {
            }
            column(Production_Order_DescriptionCaption; FIELDCAPTION(Description))
            {
            }
            column(Production_Order__Source_No__Caption; FIELDCAPTION("Source No."))
            {
            }
            column(Production_Order__Starting_Date_Caption; Production_Order__Starting_Date_CaptionLbl)
            {
            }
            column(Production_Order__Ending_Date_Caption; Production_Order__Ending_Date_CaptionLbl)
            {
            }
            column(Production_Order__Due_Date_Caption; Production_Order__Due_Date_CaptionLbl)
            {
            }
            column(Production_Order_QuantityCaption; FIELDCAPTION(Quantity))
            {
            }
            dataitem("Prod. Order Routing Line"; "Prod. Order Routing Line")
            {
                DataItemLink = Status = FIELD(Status), Prod. Order No.=FIELD(No.);
                DataItemTableView = SORTING(Status, Prod. Order No., Routing Reference No., Routing No., Operation No.);
                column(Prod__Order_Routing_Line__Operation_No__; "Operation No.")
                {
                }
                column(Prod__Order_Routing_Line_Type; Type)
                {
                }
                column(Prod__Order_Routing_Line__No__; "No.")
                {
                }
                column(Prod__Order_Routing_Line_Description; Description)
                {
                }
                column(Prod__Order_Routing_Line__Starting_Time_; "Starting Time")
                {
                }
                column(Prod__Order_Routing_Line__Starting_Date_; FORMAT("Starting Date"))
                {
                }
                column(Prod__Order_Routing_Line__Ending_Time_; "Ending Time")
                {
                }
                column(Prod__Order_Routing_Line__Ending_Date_; FORMAT("Ending Date"))
                {
                }
                column(Prod__Order_Routing_Line__Input_Quantity_; "Input Quantity")
                {
                }
                column(Prod__Order_Routing_Line__Expected_Capacity_Need_; "Expected Capacity Need")
                {
                }
                column(Prod__Order_Routing_Line__Operation_No__Caption; FIELDCAPTION("Operation No."))
                {
                }
                column(Prod__Order_Routing_Line_TypeCaption; FIELDCAPTION(Type))
                {
                }
                column(Prod__Order_Routing_Line__No__Caption; FIELDCAPTION("No."))
                {
                }
                column(Prod__Order_Routing_Line__Starting_Time_Caption; FIELDCAPTION("Starting Time"))
                {
                }
                column(Prod__Order_Routing_Line__Starting_Date_Caption; Prod__Order_Routing_Line__Starting_Date_CaptionLbl)
                {
                }
                column(Prod__Order_Routing_Line__Ending_Time_Caption; FIELDCAPTION("Ending Time"))
                {
                }
                column(Prod__Order_Routing_Line__Ending_Date_Caption; Prod__Order_Routing_Line__Ending_Date_CaptionLbl)
                {
                }
                column(Prod__Order_Routing_Line__Input_Quantity_Caption; FIELDCAPTION("Input Quantity"))
                {
                }
                column(Prod__Order_Routing_Line__Expected_Capacity_Need_Caption; FIELDCAPTION("Expected Capacity Need"))
                {
                }

                trigger OnAfterGetRecord();
                var
                    WorkCenter: Record "Work Center";
                    CalendarMgt: Codeunit CalendarManagement;
                begin
                    Line := 1;
                    WorkCenter.GET("Work Center No.");
                    "Expected Capacity Need" := "Expected Capacity Need" / CalendarMgt.TimeFactor(WorkCenter."Unit of Measure Code");
                end;
            }
            dataitem("Prod. Order Component"; "Prod. Order Component")
            {
                DataItemLink = Status = FIELD(Status), Prod. Order No.=FIELD(No.);
                DataItemTableView = SORTING(Status, Prod. Order No., Prod. Order Line No., Line No.);
                column(Prod__Order_Component__Item_No__; "Item No.")
                {
                }
                column(Prod__Order_Component_Description; Description)
                {
                }
                column(Prod__Order_Component__Quantity_per_; "Quantity per")
                {
                }
                column(Prod__Order_Component__Scrap___; "Scrap %")
                {
                }
                column(Prod__Order_Component__Routing_Link_Code_; "Routing Link Code")
                {
                }
                column(Prod__Order_Component__Due_Date_; FORMAT("Due Date"))
                {
                }
                column(Prod__Order_Component__Expected_Quantity_; "Expected Quantity")
                {
                }
                column(Prod__Order_Component__Item_No__Caption; FIELDCAPTION("Item No."))
                {
                }
                column(Prod__Order_Component_DescriptionCaption; FIELDCAPTION(Description))
                {
                }
                column(Prod__Order_Component__Quantity_per_Caption; FIELDCAPTION("Quantity per"))
                {
                }
                column(Prod__Order_Component__Scrap___Caption; FIELDCAPTION("Scrap %"))
                {
                }
                column(Prod__Order_Component__Routing_Link_Code_Caption; FIELDCAPTION("Routing Link Code"))
                {
                }
                column(Prod__Order_Component__Due_Date_Caption; Prod__Order_Component__Due_Date_CaptionLbl)
                {
                }
                column(Prod__Order_Component__Expected_Quantity_Caption; FIELDCAPTION("Expected Quantity"))
                {
                }

                trigger OnAfterGetRecord();
                begin
                    Line := 2;
                end;
            }

            trigger OnAfterGetRecord();
            begin
                Line := 0;
            end;

            trigger OnPreDataItem();
            begin
                ProdOrderFilter := GETFILTERS;
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
        ProdOrderFilter: Text;
        Line: Integer;
        Prod__Order___Precalc__TimeCaptionLbl: TextConst ENU = 'Prod. Order - Precalc. Time', ENN = 'Prod. Order - Precalc. Time';
        CurrReport_PAGENOCaptionLbl: TextConst ENU = 'Page', ENN = 'Page';
        Production_Order__Starting_Date_CaptionLbl: TextConst ENU = 'Starting Date', ENN = 'Starting Date';
        Production_Order__Ending_Date_CaptionLbl: TextConst ENU = 'Ending Date', ENN = 'Ending Date';
        Production_Order__Due_Date_CaptionLbl: TextConst ENU = 'Due Date', ENN = 'Due Date';
        Prod__Order_Routing_Line__Starting_Date_CaptionLbl: TextConst ENU = 'Starting Date', ENN = 'Starting Date';
        Prod__Order_Routing_Line__Ending_Date_CaptionLbl: TextConst ENU = 'Ending Date', ENN = 'Ending Date';
        Prod__Order_Component__Due_Date_CaptionLbl: TextConst ENU = 'Due Date', ENN = 'Due Date';
        choice: Option Routing,Consumed,Remaining,Brief;
        total: Decimal;
        item: Record Item;
        "EXPECTED COST": Decimal;
        "CONSUMED QTY": Decimal;
        "CONSUMED COST": Decimal;
        COST: Decimal;
        Deviation: Decimal;
        "Given Time": Decimal;
        "Spent Time": Decimal;
        "Deviated Time": Decimal;
        GTH: Decimal;
        STH: Decimal;
        DTH: Decimal;
        "Rem COST": Decimal;
        CPCB: Boolean;
        TCQ: Decimal;
        ILE: Record "Item Ledger Entry";
        PCC: Decimal;
        PEC: Decimal;
        PRC: Decimal;
        TPC: Decimal;
        TCC: Decimal;
        TRC: Decimal;
        PIL: Record "Purch. Inv. Line";
        UC: Decimal;
        PML: Record "Posted Material Issues Line";
        PMH: Record "Posted Material Issues Header";
        RQTY: Decimal;
        DQTY: Decimal;
        RDC: Decimal;
        TRDC: Decimal;
        TUC: Decimal;
        TCA: Decimal;
        EQ: Decimal;
        ILE2: Record "Item Ledger Entry";
        i: Integer;
        TOT_CARD_CONSUME: Decimal;
        POST_MATE_Head: Record "Posted Material Issues Header";
        TOT_QTY: Decimal;
        EXCESS_Drawn: Decimal;
        EXCESS: Boolean;
        nul: Integer;
        Return___Damaged__ValueCaptionLbl: Label 'Return & Damaged  Value';
        Remaining_ValueCaptionLbl: Label 'Remaining Value';
        Consumed_ValueCaptionLbl: Label 'Consumed Value';
        Expected_ValueCaptionLbl: Label 'Expected Value';
        Compound_DescriptionCaptionLbl: Label 'Compound Description';
        No_CaptionLbl: Label 'No.';
        Bench_Mark_TimeCaptionLbl: Label 'Bench Mark Time';
        ROUTINGCaptionLbl: Label 'ROUTING';
        Compound_DescriptionCaption_Control1000000018Lbl: Label 'Compound Description';
        Resource_NameCaptionLbl: Label 'Resource Name';
        Actual_TimeCaptionLbl: Label 'Actual Time';
        DeviationCaptionLbl: Label 'Deviation';
        DescriptionCaptionLbl: Label 'Description';
        QuantityCaptionLbl: Label 'Quantity';
        Compound_DescriptionCaption_Control1000000002Lbl: Label 'Compound Description';
        COMPONENTSCaptionLbl: Label 'COMPONENTS';
        Consumed_QTYCaptionLbl: Label 'Consumed QTY';
        Consumed_CostCaptionLbl: Label 'Consumed Cost';
        Expected_ValueCaption_Control1000000004Lbl: Label 'Expected Value';
        Remaining_QTYCaptionLbl: Label 'Remaining QTY';
        ExpectedCaptionLbl: Label 'Expected';
        ConsumedCaptionLbl: Label 'Consumed';
        Returned_QuantityCaptionLbl: Label 'Returned Quantity';
        Damaged_QuantityCaptionLbl: Label 'Damaged Quantity';
        Return___Damaged___excessCaptionLbl: Label 'Return & Damaged & excess';
        Excess_QuantityCaptionLbl: Label 'Excess Quantity';
        Excess_DrawnCaptionLbl: Label 'Excess Drawn';
        Total_AmountCaptionLbl: Label 'Total Amount';
}

