report 99000780 "Capacity Task List"
{
    // version NAVW19.00.00.45778

    DefaultLayout = RDLC;
    RDLCLayout = './Capacity Task List.rdlc';
    CaptionML = ENU='Capacity Task List',
                ENN='Capacity Task List';

    dataset
    {
        dataitem("Prod. Order Routing Line";"Prod. Order Routing Line")
        {
            DataItemTableView = SORTING(Type,No.);
            RequestFilterFields = Type,"No.",Status,"Prod. Order No.";
            column(TodayFormatted;FORMAT(TODAY,0,4))
            {
            }
            column(CompanyName;COMPANYNAME)
            {
            }
            column(PORtngLineTableCaptFilter;TABLECAPTION + ':' + ProdOrderRtngLineFilter)
            {
            }
            column(ProdOrderRtngLineFilter;ProdOrderRtngLineFilter)
            {
            }
            column(Type_ProdOrderRtngLine;Type)
            {
            }
            column(No_ProdOrderRtngLine;"No.")
            {
            }
            column(PONo_ProdOrderRtngLine;"Prod. Order No.")
            {
                IncludeCaption = true;
            }
            column(RtngNo_ProdOrderRtngLine;"Routing No.")
            {
                IncludeCaption = true;
            }
            column(OPNo_ProdOrderRtngLine;"Operation No.")
            {
                IncludeCaption = true;
            }
            column(Desc_ProdOrderRtngLine;Description)
            {
                IncludeCaption = true;
            }
            column(InptQty_ProdOrderRtngLine;"Input Quantity")
            {
                IncludeCaption = true;
            }
            column(StrtTm_ProdOrderRtngLine;"Starting Time")
            {
                IncludeCaption = true;
            }
            column(StrtDt_ProdOrderRtngLine;FORMAT("Starting Date"))
            {
            }
            column(EndTime_ProdOrderRtngLine;"Ending Time")
            {
                IncludeCaption = true;
            }
            column(EndDate_ProdOrderRtngLine;FORMAT("Ending Date"))
            {
            }
            column(CapacityTaskListCapt;CapacityTaskListCaptLbl)
            {
            }
            column(CurrReportPageNoCapt;CurrReportPageNoCaptLbl)
            {
            }
            column(ProdOrderRtngLnStrtDtCapt;ProdOrderRtngLnStrtDtCaptLbl)
            {
            }
            column(ProdOrderRtngLnEndDtCapt;ProdOrderRtngLnEndDtCaptLbl)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF (Status = Status::Finished) OR ("Routing Status" = "Routing Status"::Finished) THEN
                  CurrReport.SKIP;
            end;

            trigger OnPreDataItem();
            begin
                ProdOrderRtngLineFilter := GETFILTERS;
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
        ProdOrderRtngLineFilter : Text;
        CapacityTaskListCaptLbl : TextConst ENU='Capacity Task List',ENN='Capacity Task List';
        CurrReportPageNoCaptLbl : TextConst ENU='Page',ENN='Page';
        ProdOrderRtngLnStrtDtCaptLbl : TextConst ENU='Starting Date',ENN='Starting Date';
        ProdOrderRtngLnEndDtCaptLbl : TextConst ENU='Ending Date',ENN='Ending Date';
}

