report 50119 "Delivery challan(sal)"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Delivery challan(sal).rdlc';

    dataset
    {
        dataitem("Sales Invoice Header";"Sales Invoice Header")
        {
            RequestFilterFields = "No.";
            column(Sales_Invoice_Header__External_Document_No__;"External Document No.")
            {
            }
            column(Sales_Invoice_Header__Customer_OrderNo__;"Customer OrderNo.")
            {
            }
            column(Sales_Invoice_Header__Posting_Date_;"Posting Date")
            {
            }
            column(Sales_Invoice_Header__Posting_Date__Control1102154014;"Posting Date")
            {
            }
            column(Sales_Invoice_Header__Ship_to_Name_;"Ship-to Name")
            {
            }
            column(Sales_Invoice_Header__Ship_to_Address_;"Ship-to Address")
            {
            }
            column(Sales_Invoice_Header__Ship_to_City_;"Ship-to City")
            {
            }
            column(DELIVERY_CHALLANCaption;DELIVERY_CHALLANCaptionLbl)
            {
            }
            column(Ref__LOA_No_Caption;Ref__LOA_No_CaptionLbl)
            {
            }
            column(Invoice_No_Caption;Invoice_No_CaptionLbl)
            {
            }
            column(DT_Caption;DT_CaptionLbl)
            {
            }
            column(ToCaption;ToCaptionLbl)
            {
            }
            column(With_reference_to_the_above__the_following_material_has_been_supplied__Kindly_Acknowledge_and_accept_the_same_Caption;With_reference_to_the_above__the_following_material_has_been_supplied__Kindly_Acknowledge_and_accept_the_same_CaptionLbl)
            {
            }
            column(Date_Caption;Date_CaptionLbl)
            {
            }
            column(Description_and_Specifications_of_goodsCaption;Description_and_Specifications_of_goodsCaptionLbl)
            {
            }
            column(Schld__No_Caption;Schld__No_CaptionLbl)
            {
            }
            column(Total_QuantityCaption;Total_QuantityCaptionLbl)
            {
            }
            column(Sales_Invoice_Header_No_;"No.")
            {
            }
            dataitem("Sales Invoice Line";"Sales Invoice Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = SORTING(Document No.,Line No.) ORDER(Ascending);
                column(desc;desc)
                {
                }
                column(qty;qty)
                {
                }
                column(j;j)
                {
                }
                column(Prepared_ByCaption;Prepared_ByCaptionLbl)
                {
                }
                column(Checked_ByCaption;Checked_ByCaptionLbl)
                {
                }
                column(For_EFFTRONICS_SYSTEMS_PVT__LTD__Caption;For_EFFTRONICS_SYSTEMS_PVT__LTD__CaptionLbl)
                {
                }
                column(Authorised_ByCaption;Authorised_ByCaptionLbl)
                {
                }
                column(Sales_Invoice_Line_Document_No_;"Document No.")
                {
                }
                column(Sales_Invoice_Line_Line_No_;"Line No.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                      j:=FORMAT(i);
                     IF ("Sales Invoice Line".Quantity=0)AND("Sales Invoice Line".Type<>"Sales Invoice Line".Type::" ") THEN
                      BEGIN
                       CurrReport.SKIP;
                       i:=i-1;
                       j:=FORMAT(i);
                      END;
                     IF "Sales Invoice Line".Quantity=0 THEN
                     BEGIN
                     i:=i-1;
                     j:='';
                     END;
                     //j:=FORMAT(i);
                      i:=i+1;
                end;
            }

            trigger OnPreDataItem();
            begin
                i:=1;
                desc:='';
                j:='';
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
        desc : Text[255];
        i : Integer;
        j : Text[3];
        qty : Text[5];
        DELIVERY_CHALLANCaptionLbl : Label 'DELIVERY CHALLAN';
        Ref__LOA_No_CaptionLbl : Label 'Ref: LOA No:';
        Invoice_No_CaptionLbl : Label 'Invoice No:';
        DT_CaptionLbl : Label 'DT:';
        ToCaptionLbl : Label 'To';
        With_reference_to_the_above__the_following_material_has_been_supplied__Kindly_Acknowledge_and_accept_the_same_CaptionLbl : Label 'With reference to the above, the following material has been supplied. Kindly Acknowledge and accept the same.';
        Date_CaptionLbl : Label 'Date:';
        Description_and_Specifications_of_goodsCaptionLbl : Label 'Description and Specifications of goods';
        Schld__No_CaptionLbl : Label 'Schld. No.';
        Total_QuantityCaptionLbl : Label 'Total Quantity';
        Prepared_ByCaptionLbl : Label 'Prepared By';
        Checked_ByCaptionLbl : Label 'Checked By';
        For_EFFTRONICS_SYSTEMS_PVT__LTD__CaptionLbl : Label 'For EFFTRONICS SYSTEMS PVT. LTD.,';
        Authorised_ByCaptionLbl : Label 'Authorised By';
}

