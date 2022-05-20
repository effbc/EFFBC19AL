report 50021 saleinvoiceheader
{
    DefaultLayout = RDLC;
    RDLCLayout = './saleinvoiceheader.rdlc';

    dataset
    {
        dataitem("Sales Invoice Header";"Sales Invoice Header")
        {
            RequestFilterFields = "No.";
            column(Dispatched_Material_StatusCaption;Dispatched_Material_StatusCaptionLbl)
            {
            }
            column(Sales_Invoice_Line__No__Caption;"Sales Invoice Line".FIELDCAPTION("No."))
            {
            }
            column(Sales_Invoice_Line_DescriptionCaption;"Sales Invoice Line".FIELDCAPTION(Description))
            {
            }
            column(Sales_Invoice_Line_QuantityCaption;"Sales Invoice Line".FIELDCAPTION(Quantity))
            {
            }
            column(Sales_Invoice_Line__Packet_No_Caption;"Sales Invoice Line".FIELDCAPTION("Packet No"))
            {
            }
            column(Sales_Invoice_Header_No_;"No.")
            {
            }
            dataitem("Sales Invoice Line";"Sales Invoice Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = WHERE(Quantity=FILTER(>0));
                column(Sales_Invoice_Line__No__;"No.")
                {
                }
                column(Sales_Invoice_Line_Description;Description)
                {
                }
                column(Sales_Invoice_Line_Quantity;Quantity)
                {
                }
                column(Sales_Invoice_Line__Packet_No_;"Packet No")
                {
                }
                column(Sales_Invoice_Line_Document_No_;"Document No.")
                {
                }
                column(Sales_Invoice_Line_Line_No_;"Line No.")
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
        Dispatched_Material_StatusCaptionLbl : Label 'Dispatched Material Status';
}

