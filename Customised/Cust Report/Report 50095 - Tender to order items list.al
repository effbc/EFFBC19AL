report 50095 "Tender to order items list"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Tender to order items list.rdlc';

    dataset
    {
        dataitem("Tender Header";"Tender Header")
        {
            RequestFilterFields = "Tender No.";
            column(Tender_Header__Tender_Header___Customer_Name_;"Tender Header"."Customer Name")
            {
            }
            column(Item_DescriptionCaption;Item_DescriptionCaptionLbl)
            {
            }
            column(QuantityCaption;QuantityCaptionLbl)
            {
            }
            column(Unit_of_MeasureCaption;Unit_of_MeasureCaptionLbl)
            {
            }
            column(Item_DetailsCaption;Item_DetailsCaptionLbl)
            {
            }
            column(Customer_Name___Caption;Customer_Name___CaptionLbl)
            {
            }
            column(Tender_Header_Tender_No_;"Tender No.")
            {
            }
            dataitem("Tender Line";"Tender Line")
            {
                DataItemLink = Document No.=FIELD(Tender No.);
                DataItemTableView = WHERE(Quantity=FILTER(<>0));
                column(Tender_Line_Description;Description)
                {
                }
                column(Tender_Line_Quantity;Quantity)
                {
                }
                column(Tender_Line_UOM;UOM)
                {
                }
                column(Tender_Line_Document_No_;"Document No.")
                {
                }
                column(Tender_Line_Line_No_;"Line No.")
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
        total : Decimal;
        totcost : Decimal;
        Item_DescriptionCaptionLbl : Label 'Item Description';
        QuantityCaptionLbl : Label 'Quantity';
        Unit_of_MeasureCaptionLbl : Label 'Unit of Measure';
        Item_DetailsCaptionLbl : Label 'Item Details';
        Customer_Name___CaptionLbl : Label '"Customer Name : "';
}

