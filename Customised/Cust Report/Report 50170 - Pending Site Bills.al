report 50170 "Pending Site Bills"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Pending Site Bills.rdlc';

    dataset
    {
        dataitem("Purchase Line"; "Purchase Line")
        {
            DataItemTableView = SORTING(Document Type, Document No., Line No.) ORDER(Ascending) WHERE(Location Code=FILTER(SITE),Material Received at Site=FILTER(Yes),Document Type=FILTER(Order),Qty. to Invoice=FILTER(>0));
            RequestFilterFields = "Document Type";
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
            column(Purchase_Line__Document_No__;"Document No.")
            {
            }
            column(Purchase_Line__No__;"No.")
            {
            }
            column(Purchase_Line_Description;Description)
            {
            }
            column(SITE;SITE)
            {
            }
            column(Sales_Order_No;Sales_Order_No)
            {
            }
            column(Customer_Name;Customer_Name)
            {
            }
            column(Purchase_Line__Unit_Cost__LCY__;"Unit Cost (LCY)")
            {
            }
            column(Purchase_Line___Unit_Cost__LCY____Purchase_Line___Qty__to_Invoice_;"Purchase Line"."Unit Cost (LCY)"*"Purchase Line"."Qty. to Invoice")
            {
            }
            column(Purchase_Line_Remarks;Remarks)
            {
            }
            column(Purchase_Line__Qty__to_Invoice_;"Qty. to Invoice")
            {
            }
            column(Total_Value;Total_Value)
            {
            }
            column(No__Of_Bills_;"No. Of Bills")
            {
            }
            column(Purchase_LineCaption;Purchase_LineCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Pending_Site_BillsCaption;Pending_Site_BillsCaptionLbl)
            {
            }
            column(Purchase_Order_Caption;Purchase_Order_CaptionLbl)
            {
            }
            column(Purchase_Line__No__Caption;FIELDCAPTION("No."))
            {
            }
            column(Purchase_Line_DescriptionCaption;FIELDCAPTION(Description))
            {
            }
            column(SITECaption;SITECaptionLbl)
            {
            }
            column(Sales_OrderCaption;Sales_OrderCaptionLbl)
            {
            }
            column(CustomerCaption;CustomerCaptionLbl)
            {
            }
            column(Unit_CostCaption;Unit_CostCaptionLbl)
            {
            }
            column(TOTALCaption;TOTALCaptionLbl)
            {
            }
            column(Purchase_Line_RemarksCaption;FIELDCAPTION(Remarks))
            {
            }
            column(Purchase_Line__Qty__to_Invoice_Caption;FIELDCAPTION("Qty. to Invoice"))
            {
            }
            column(No__of_Bills__Caption;No__of_Bills__CaptionLbl)
            {
            }
            column(Purchase_Line_Document_Type;"Document Type")
            {
            }
            column(Purchase_Line_Line_No_;"Line No.")
            {
            }

            trigger OnPreDataItem();
            begin
                LastFieldNo := FIELDNO("Document Type");
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
        LastFieldNo : Integer;
        FooterPrinted : Boolean;
        SITE : Code[30];
        Dimension_Value : Record "Dimension Value";
        Sales_Order_No : Code[30];
        Purchase_Header : Record "Purchase Header";
        Sales_Header : Record "Sales Header";
        Sales_Invoice_header : Record "Sales Invoice Header";
        Customer_Name : Text[50];
        Total_Value : Decimal;
        "No. Of Bills" : Integer;
        Purchase_LineCaptionLbl : Label 'Purchase Line';
        CurrReport_PAGENOCaptionLbl : Label 'Page';
        Pending_Site_BillsCaptionLbl : Label 'Pending Site Bills';
        Purchase_Order_CaptionLbl : Label '"Purchase Order "';
        SITECaptionLbl : Label 'SITE';
        Sales_OrderCaptionLbl : Label 'Sales Order';
        CustomerCaptionLbl : Label 'Customer';
        Unit_CostCaptionLbl : Label 'Unit Cost';
        TOTALCaptionLbl : Label 'TOTAL';
        No__of_Bills__CaptionLbl : Label 'No. of Bills :';
}

