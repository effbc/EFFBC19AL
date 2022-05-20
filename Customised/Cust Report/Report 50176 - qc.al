report 50176 qc
{
    DefaultLayout = RDLC;
    RDLCLayout = './qc.rdlc';

    dataset
    {
        dataitem("Inspection Datasheet Header";"Inspection Datasheet Header")
        {
            RequestFilterFields = "Created Date";
            column(Total_QuanityCaption;Total_QuanityCaptionLbl)
            {
            }
            column(Created_DateCaption;Created_DateCaptionLbl)
            {
            }
            column(Item_DescriptionCaption;Item_DescriptionCaptionLbl)
            {
            }
            column(Sno_Caption;Sno_CaptionLbl)
            {
            }
            column(Rem_QuantityCaption;Rem_QuantityCaptionLbl)
            {
            }
            column(Inspection_Datasheet_Header_No_;"No.")
            {
            }
            column(Inspection_Datasheet_Header_Receipt_No_;"Receipt No.")
            {
            }
            column(Inspection_Datasheet_Header_Item_No_;"Item No.")
            {
            }
            dataitem("Purch. Rcpt. Line";"Purch. Rcpt. Line")
            {
                DataItemLink = Document No.=FIELD(Receipt No.),No.=FIELD(Item No.);
                DataItemTableView = WHERE(Quantity=FILTER(>0));
                column(Purch__Rcpt__Line_Quantity;Quantity)
                {
                }
                column(Purch__Rcpt__Line_Description;Description)
                {
                }
                column(Inspection_Datasheet_Header___Created_Date_;"Inspection Datasheet Header"."Created Date")
                {
                }
                column(sno;sno)
                {
                }
                column(Purch__Rcpt__Line__Quantity____Purch__Rcpt__Line___Quantity_Accepted___Purch__Rcpt__Line___Quantity_Rejected__;("Purch. Rcpt. Line".Quantity)-("Purch. Rcpt. Line"."Quantity Accepted"+"Purch. Rcpt. Line"."Quantity Rejected"))
                {
                }
                column(Purch__Rcpt__Line_Document_No_;"Document No.")
                {
                }
                column(Purch__Rcpt__Line_Line_No_;"Line No.")
                {
                }
                column(Purch__Rcpt__Line_No_;"No.")
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
        sno : Integer;
        Total_QuanityCaptionLbl : Label 'Total Quanity';
        Created_DateCaptionLbl : Label 'Created Date';
        Item_DescriptionCaptionLbl : Label 'Item Description';
        Sno_CaptionLbl : Label 'Sno.';
        Rem_QuantityCaptionLbl : Label 'Rem Quantity';
}

