report 50006 "Minimum Stock Qty Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Minimum Stock Qty Report.rdlc';

    dataset
    {
        dataitem(Item;Item)
        {
            CalcFields = Stock At MCH Location;
            DataItemTableView = SORTING(No.);
            column(FORMAT_TODAY_0_4_;FORMAT(TODAY,0,4))
            {
            }
            column(COMPANYNAME;COMPANYNAME)
            {
            }
            column(CurrReport_PAGENO;CurrReport.PAGENO)
            {
            }
            column(USERID;USERID)
            {
            }
            column(Item__No__;"No.")
            {
            }
            column(Item_Description;Description)
            {
            }
            column(Item__Base_Unit_of_Measure_;"Base Unit of Measure")
            {
            }
            column(Item__Safety_Lead_Time_;"Safety Lead Time")
            {
            }
            column(SHORTAGE_AT_STR;SHORTAGE_AT_STR)
            {
            }
            column(SHORTAGE_AT_MCH;SHORTAGE_AT_MCH)
            {
            }
            column(Items_Less_than_MOQCaption;Items_Less_than_MOQCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Item__No__Caption;FIELDCAPTION("No."))
            {
            }
            column(Item_DescriptionCaption;FIELDCAPTION(Description))
            {
            }
            column(Item__Base_Unit_of_Measure_Caption;FIELDCAPTION("Base Unit of Measure"))
            {
            }
            column(Item__Safety_Lead_Time_Caption;FIELDCAPTION("Safety Lead Time"))
            {
            }
            column(Shortage_at_STRCaption;Shortage_at_STRCaptionLbl)
            {
            }
            column(Shortage_at_MCHCaption;Shortage_at_MCHCaptionLbl)
            {
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
        ITEM_STOCK : Decimal;
        ITEM_STOCK_CU : Codeunit "item stock at stores1";
        Stock_At_Stores : Decimal;
        SHORTAGE_AT_STR : Decimal;
        SHORTAGE_AT_MCH : Decimal;
        Items_Less_than_MOQCaptionLbl : Label 'Items Less than MOQ';
        CurrReport_PAGENOCaptionLbl : Label 'Page';
        Shortage_at_STRCaptionLbl : Label 'Shortage at STR';
        Shortage_at_MCHCaptionLbl : Label 'Shortage at MCH';
}

