report 99000768 "Prod. Order - Detailed Calc."
{
    // version NAVW19.00.00.45778

    DefaultLayout = RDLC;
    RDLCLayout = './Prod. Order - Detailed Calc..rdlc';
    CaptionML = ENU='Prod. Order - Detailed Calc.',
                ENN='Prod. Order - Detailed Calc.';

    dataset
    {
        dataitem("Production Order";"Production Order")
        {
            DataItemTableView = SORTING(Status,No.);
            RequestFilterFields = Status,"No.","Source Type","Source No.";
            column(TodayFormatted;FORMAT(TODAY,0,4))
            {
            }
            column(CompanyName;COMPANYNAME)
            {
            }
            column(ProdOrderTableCaptionFilter;TABLECAPTION + ':' + ProdOrderFilter)
            {
            }
            column(ProdOrderFilter;ProdOrderFilter)
            {
            }
            column(No_ProdOrder;"No.")
            {
            }
            column(Desc_ProdOrder;Description)
            {
            }
            column(SourceNo_ProdOrder;"Source No.")
            {
                IncludeCaption = true;
            }
            column(Qty_ProdOrder;Quantity)
            {
                IncludeCaption = true;
            }
            column(ProdOrderDetailedCalcCaption;ProdOrderDetailedCalcCaptionLbl)
            {
            }
            column(CurrReportPageNoCaption;CurrReportPageNoCaptionLbl)
            {
            }
            dataitem("Prod. Order Line";"Prod. Order Line")
            {
                DataItemLink = Status=FIELD(Status),Prod. Order No.=FIELD(No.);
                DataItemTableView = SORTING(Status,Prod. Order No.,Line No.) WHERE(Planning Level Code=CONST(0));
                column(LineNo_ProdOrderLine;"Line No.")
                {
                }
                dataitem("Prod. Order Routing Line";"Prod. Order Routing Line")
                {
                    DataItemLink = Status=FIELD(Status),Prod. Order No.=FIELD(Prod. Order No.),Routing Reference No.=FIELD(Line No.);
                    DataItemTableView = SORTING(Status,Prod. Order No.,Routing Reference No.,Routing No.,Operation No.);
                    column(OPNo_ProdOrderRtngLine;"Operation No.")
                    {
                        IncludeCaption = false;
                    }
                    column(OPNo_ProdOrderRtngLineCaption;FIELDCAPTION("Operation No."))
                    {
                    }
                    column(Type_ProdOrderRtngLine;Type)
                    {
                        IncludeCaption = true;
                    }
                    column(No_ProdOrderRtngLine;"No.")
                    {
                        IncludeCaption = true;
                    }
                    column(Desc_ProdOrderRtngLine;Description)
                    {
                        IncludeCaption = true;
                    }
                    column(InputQty_ProdOrderRtngLine;"Input Quantity")
                    {
                        IncludeCaption = true;
                    }
                    column(ExpecOPCostAmt_ProdOrderRtngLine;"Expected Operation Cost Amt.")
                    {
                        IncludeCaption = true;
                    }
                    column(TotalProductionCostCaption;TotalProductionCostCaptionLbl)
                    {
                    }

                    trigger OnPreDataItem();
                    begin
                        CurrReport.CREATETOTALS("Expected Operation Cost Amt.");
                    end;
                }
                dataitem("Prod. Order Component";"Prod. Order Component")
                {
                    DataItemLink = Status=FIELD(Status),Prod. Order No.=FIELD(Prod. Order No.),Prod. Order Line No.=FIELD(Line No.);
                    DataItemTableView = SORTING(Status,Prod. Order No.,Prod. Order Line No.,Line No.);
                    column(ItemNo_ProdOrderComp;"Item No.")
                    {
                        IncludeCaption = false;
                    }
                    column(ItemNo_ProdOrderCompCaption;FIELDCAPTION("Item No."))
                    {
                    }
                    column(Desc_ProdOrderComp;Description)
                    {
                        IncludeCaption = true;
                    }
                    column(RtngLinkCode_ProdOrderComp;"Routing Link Code")
                    {
                        IncludeCaption = true;
                    }
                    column(ExpectedQty_ProdOrderComp;"Expected Quantity")
                    {
                        IncludeCaption = true;
                    }
                    column(CostAmt_ProdOrderComp;"Cost Amount")
                    {
                        IncludeCaption = true;
                    }
                    column(UnitCost_ProdOrderComp;"Unit Cost")
                    {
                        IncludeCaption = true;
                    }
                    column(TotalMaterialCostCaption;TotalMaterialCostCaptionLbl)
                    {
                    }

                    trigger OnPreDataItem();
                    begin
                        CurrReport.CREATETOTALS("Cost Amount");
                    end;
                }
                dataitem("Integer";"Integer")
                {
                    DataItemTableView = SORTING(Number);
                    MaxIteration = 1;
                    column(ProdOrderCompOPCostAmt;"Prod. Order Component"."Cost Amount" + "Prod. Order Routing Line"."Expected Operation Cost Amt.")
                    {
                        AutoFormatType = 1;
                    }
                    column(TotalProdCostCaption;TotalProdCostCaptionLbl)
                    {
                    }
                    column(TotalMterlCostCaption;TotalMterlCostCaptionLbl)
                    {
                    }
                    column(TotalCostCaption;TotalCostCaptionLbl)
                    {
                    }
                }
            }

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
        ProdOrderFilter : Text;
        ProdOrderDetailedCalcCaptionLbl : TextConst ENU='Prod. Order - Detailed Calc.',ENN='Prod. Order - Detailed Calc.';
        CurrReportPageNoCaptionLbl : TextConst ENU='Page',ENN='Page';
        TotalProductionCostCaptionLbl : TextConst ENU='Total Production Cost',ENN='Total Production Cost';
        TotalMaterialCostCaptionLbl : TextConst ENU='Total Material Cost',ENN='Total Material Cost';
        TotalProdCostCaptionLbl : TextConst ENU='Total Production Cost',ENN='Total Production Cost';
        TotalMterlCostCaptionLbl : TextConst ENU='Total Material Cost',ENN='Total Material Cost';
        TotalCostCaptionLbl : TextConst ENU='Total Cost',ENN='Total Cost';
        InRouting : Boolean;
        InBOM : Boolean;
}

