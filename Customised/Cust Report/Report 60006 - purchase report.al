report 60006 "purchase report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './purchase report.rdlc';

    dataset
    {
        dataitem("Sales Line";"Sales Line")
        {
            DataItemTableView = WHERE(Type=CONST(Item),Document Type=CONST(Order),Qty. to Invoice=FILTER(>0),Posting Group=CONST(BOI));
            column(Sales_Line__Document_No__;"Document No.")
            {
            }
            column(Sales_Line__No__;"No.")
            {
            }
            column(Sales_Line_Description;Description)
            {
            }
            column(Sales_Line__Unitcost_LOA__;"Unitcost(LOA)")
            {
            }
            column(Sales_Line__Qty__to_Invoice_;"Qty. to Invoice")
            {
            }
            column(x;x)
            {
            }
            column(Sale_Order_No_Caption;Sale_Order_No_CaptionLbl)
            {
            }
            column(Sales_Line__No__Caption;FIELDCAPTION("No."))
            {
            }
            column(Sales_Line_DescriptionCaption;FIELDCAPTION(Description))
            {
            }
            column(Sales_Line__Unitcost_LOA__Caption;FIELDCAPTION("Unitcost(LOA)"))
            {
            }
            column(Sales_Line__Qty__to_Invoice_Caption;FIELDCAPTION("Qty. to Invoice"))
            {
            }
            column(TotalCaption;TotalCaptionLbl)
            {
            }
            column(Sales_Line_Document_Type;"Document Type")
            {
            }
            column(Sales_Line_Line_No_;"Line No.")
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
        x : Decimal;
        Sale_Order_No_CaptionLbl : Label 'Sale Order No.';
        TotalCaptionLbl : Label 'Total';
}

