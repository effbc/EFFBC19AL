report 50169 "Inspection Results wip"
{
    // version B2B 1.0

    DefaultLayout = RDLC;
    RDLCLayout = './Inspection Results wip.rdlc';

    dataset
    {
        dataitem("Purchase Line"; "Purchase Line")
        {
            DataItemTableView = SORTING(Deviated Receipt Date) ORDER(Ascending) WHERE(Document Type=CONST(Order),No.=FILTER(<>''),Qty. to Receive=FILTER(>0));
            RequestFilterFields = "Location Code";
            column(Purchase_Line_Description;Description)
            {
            }
            column(Purchase_Line_Quantity;Quantity)
            {
            }
            column(Purchase_Line__Qty__to_Receive_;"Qty. to Receive")
            {
            }
            column(Vendor_Name;Vendor_Name)
            {
            }
            column(Purchase_Line__Expected_Receipt_Date_;"Expected Receipt Date")
            {
            }
            column(Purchase_Line__Deviated_Receipt_Date_;"Deviated Receipt Date")
            {
            }
            column(Purchase_Line__Document_No__;"Document No.")
            {
            }
            column(Purchase_Line__Purchase_Line__Remarks;"Purchase Line".Remarks)
            {
            }
            column(Purchase_Line__Unit_Cost__LCY__;"Unit Cost (LCY)")
            {
            }
            column(Unit_Cost__LCY____Qty__to_Receive_;"Unit Cost (LCY)"*"Qty. to Receive")
            {
            }
            column(Purchase_Line__No__;"No.")
            {
            }
            column(Purchase_Line__Unit_of_Measure_Code_;"Unit of Measure Code")
            {
            }
            column(Sno;Sno)
            {
            }
            column(total;total)
            {
            }
            column(Pending_Purchase_InwardsCaption;Pending_Purchase_InwardsCaptionLbl)
            {
            }
            column(Expected_Receipt_DateCaption;Expected_Receipt_DateCaptionLbl)
            {
            }
            column(Deviated_Receipt_DateCaption;Deviated_Receipt_DateCaptionLbl)
            {
            }
            column(Purchase_Order_No_Caption;Purchase_Order_No_CaptionLbl)
            {
            }
            column(DescriptionCaption;DescriptionCaptionLbl)
            {
            }
            column(Ordered_QuantityCaption;Ordered_QuantityCaptionLbl)
            {
            }
            column(Pending_QuantityCaption;Pending_QuantityCaptionLbl)
            {
            }
            column(VendorCaption;VendorCaptionLbl)
            {
            }
            column(RemarksCaption;RemarksCaptionLbl)
            {
            }
            column(Purchase_Line__Unit_Cost__LCY__Caption;FIELDCAPTION("Unit Cost (LCY)"))
            {
            }
            column(Total_CostCaption;Total_CostCaptionLbl)
            {
            }
            column(Purchase_Line__No__Caption;FIELDCAPTION("No."))
            {
            }
            column(UOMCaption;UOMCaptionLbl)
            {
            }
            column(SNo_Caption;SNo_CaptionLbl)
            {
            }
            column(Total_CostCaption_Control1102154030;Total_CostCaption_Control1102154030Lbl)
            {
            }
            column(Purchase_Line_Document_Type;"Document Type")
            {
            }
            column(Purchase_Line_Line_No_;"Line No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                /*IF (("Purchase Line"."Expected Receipt Date"<TODAY) AND ("Purchase Line"."Deviated Receipt Date"=0D) )
                   OR (("Purchase Line"."Deviated Receipt Date">0D) AND ("Purchase Line"."Deviated Receipt Date"<TODAY)) THEN
                  BEGIN
                */
                IF Vendor.GET("Purchase Line"."Buy-from Vendor No.") THEN
                Vendor_Name:=Vendor.Name;
                total+="Unit Cost (LCY)"*"Qty. to Receive";
                
                Sno+=1;
                
                /*
                END ELSE
                  CurrReport.SKIP;;
                */

            end;

            trigger OnPreDataItem();
            begin
                "Purch View":='SORTING(Indent No.) WHERE(Document Type=FILTER(Order),Type=CONST(Item),';
                "Purch View"+='Qty. to Receive=FILTER(>0),Location Code=CONST(R&D STR))';



                  IF "Purchase Line".GETFILTER("Purchase Line"."Location Code")='' THEN
                    "Purchase Line".SETVIEW("Purch View");
                "Purchase Line".SETFILTER("Purchase Line"."Deviated Receipt Date",'<%1',TODAY);
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
        TotalFor : Label '"Total for "';
        Text001 : Label 'Sorting items    #1##########';
        Text000 : Label 'Period: %1';
        Vendor_Name : Text[50];
        Vendor : Record Vendor;
        "Purch View" : Text[250];
        Sno : Integer;
        total : Decimal;
        Pending_Purchase_InwardsCaptionLbl : Label 'Pending Purchase Inwards';
        Expected_Receipt_DateCaptionLbl : Label 'Expected Receipt Date';
        Deviated_Receipt_DateCaptionLbl : Label 'Deviated Receipt Date';
        Purchase_Order_No_CaptionLbl : Label 'Purchase Order No.';
        DescriptionCaptionLbl : Label 'Description';
        Ordered_QuantityCaptionLbl : Label 'Ordered Quantity';
        Pending_QuantityCaptionLbl : Label 'Pending Quantity';
        VendorCaptionLbl : Label 'Vendor';
        RemarksCaptionLbl : Label 'Remarks';
        Total_CostCaptionLbl : Label 'Total Cost';
        UOMCaptionLbl : Label 'UOM';
        SNo_CaptionLbl : Label 'SNo.';
        Total_CostCaption_Control1102154030Lbl : Label 'Total Cost';
}

