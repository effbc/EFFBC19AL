report 50085 "Eff Vs Compettors"
{
    // version ESPL 1.0

    DefaultLayout = RDLC;
    RDLCLayout = './Eff Vs Compettors.rdlc';

    dataset
    {
        dataitem("Tender Header"; "Tender Header")
        {
            column(companyinfo_Name; companyinfo.Name)
            {
            }
            column(USERID; USERID)
            {
            }
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(CurrReport_PAGENO; CurrReport.PAGENO)
            {
            }
            column(Tender_Header__Tender_No__; "Tender No.")
            {
            }
            column(Efftronics_Vs_Competitor_sCaption; Efftronics_Vs_Competitor_sCaptionLbl)
            {
            }
            column(PageCaption; PageCaptionLbl)
            {
            }
            column(Tender_Header__Tender_No__Caption; FIELDCAPTION("Tender No."))
            {
            }
            column(Due_DateCaption; Due_DateCaptionLbl)
            {
            }
            column(product_TypeCaption; product_TypeCaptionLbl)
            {
            }
            column(Efftronics_PriceCaption; Efftronics_PriceCaptionLbl)
            {
            }
            column(Compettors_PriceCaption; Compettors_PriceCaptionLbl)
            {
            }
            column(Compettors_PositonCaption; Compettors_PositonCaptionLbl)
            {
            }
            column(Amount_diffCaption; Amount_diffCaptionLbl)
            {
            }
            column(Tender_Competitor_s_Details__Competitor_s_Name_Caption; "Tender Competitor's Details".FIELDCAPTION("Competitor's Name"))
            {
            }
            dataitem("Tender Competitor's Details"; "Tender Competitor's Details")
            {
                DataItemLink = Tender No.=FIELD(Tender No.);
                column(Tender_Header___Submission_Due_Date_; "Tender Header"."Submission Due Date")
                {
                }
                column(Tender_Header___Product_Type_; "Tender Header"."Product Type")
                {
                }
                column(Tender_Header___Minimum_Bid_Amount_; "Tender Header"."Minimum Bid Amount")
                {
                }
                column(Tender_Competitor_s_Details__Tender_Competitor_s_Details__Price; "Tender Competitor's Details".Price)
                {
                }
                column(Tender_Competitor_s_Details__Tender_Competitor_s_Details___BID_Status_; "Tender Competitor's Details"."BID Status")
                {
                }
                column(text1; text1)
                {
                }
                column(Tender_Competitor_s_Details__Competitor_s_Name_; "Competitor's Name")
                {
                }
                column(Tender_Competitor_s_Details_Tender_No_; "Tender No.")
                {
                }
                column(Tender_Competitor_s_Details_Competitor_s_Code; "Competitor's Code")
                {
                }
                column(Tender_Competitor_s_Details_Line_No_; "Line No.")
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
        companyinfo: Record "Company Information";
        text1: Decimal;
        Efftronics_Vs_Competitor_sCaptionLbl: Label 'Efftronics Vs Competitor''s';
        PageCaptionLbl: Label 'Page';
        Due_DateCaptionLbl: Label 'Due Date';
        product_TypeCaptionLbl: Label 'product Type';
        Efftronics_PriceCaptionLbl: Label 'Efftronics Price';
        Compettors_PriceCaptionLbl: Label 'Compettors Price';
        Compettors_PositonCaptionLbl: Label 'Compettors Positon';
        Amount_diffCaptionLbl: Label 'Amount diff';
}

