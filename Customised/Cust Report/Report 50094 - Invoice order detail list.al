report 50094 "Invoice order detail list"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Invoice order detail list.rdlc';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            RequestFilterFields = "No.";
            column(Sales_Header_Document_Type; "Document Type")
            {
            }
            column(Sales_Header_No_; "No.")
            {
            }
            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = WHERE(Quantity = FILTER(<> 0));
                column(Sales_Header___No__; "Sales Header"."No.")
                {
                }
                column(Sales_Header___Sell_to_Customer_Name_; "Sales Header"."Sell-to Customer Name")
                {
                }
                column(Sales_Line_Quantity; Quantity)
                {
                }
                column(Sales_Line__Qty__to_Invoice_; "Qty. to Invoice")
                {
                }
                column(Sales_Line__Quantity_Invoiced_; "Quantity Invoiced")
                {
                }
                column(Sales_Line_Description; Description)
                {
                }
                column(amt; amt)
                {
                }
                column(rem_qty_; "rem qty")
                {
                }
                column(no; no)
                {
                }
                column(Sales_Line__Sales_Line___Unit_of_Measure_; "Sales Line"."Unit of Measure")
                {
                }
                column(tot; tot)
                {
                }
                column(PriceCaption; PriceCaptionLbl)
                {
                }
                column(Item_DescriptionCaption; Item_DescriptionCaptionLbl)
                {
                }
                column(Total_QuantityCaption; Total_QuantityCaptionLbl)
                {
                }
                column(Shipped_QuantityCaption; Shipped_QuantityCaptionLbl)
                {
                }
                column(Shipping_QuantityCaption; Shipping_QuantityCaptionLbl)
                {
                }
                column(Remaining_QuantityCaption; Remaining_QuantityCaptionLbl)
                {
                }
                column(Sale_Order_No________Caption; Sale_Order_No________CaptionLbl)
                {
                }
                column(Order_DetailsCaption; Order_DetailsCaptionLbl)
                {
                }
                column(Customer_Name___Caption; Customer_Name___CaptionLbl)
                {
                }
                column(SNo_Caption; SNo_CaptionLbl)
                {
                }
                column(Unit_of_MeasureCaption; Unit_of_MeasureCaptionLbl)
                {
                }
                column(Sales_Line_Document_Type; "Document Type")
                {
                }
                column(Sales_Line_Document_No_; "Document No.")
                {
                }
                column(Sales_Line_Line_No_; "Line No.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    no += 1;
                    IF "Sales Line"."Qty. to Ship" > 0 THEN BEGIN
                        vatamt := ("Sales Line"."Tax Amount" / "Sales Line".Quantity) * "Sales Line"."Qty. to Invoice";
                        taxamt := ("Sales Line"."Tax Amount" / "Sales Line".Quantity) * "Sales Line"."Qty. to Invoice";
                        exciseamt := ("Sales Line"."BED Amount" / "Sales Line".Quantity) * "Sales Line"."Qty. to Invoice";
                        servicetax := ("Sales Line"."Service Tax Amount" / "Sales Line".Quantity) * "Sales Line"."Qty. to Invoice";
                        IF (exciseamt > 0) THEN BEGIN
                            ecessamt := exciseamt * 2 / 100;
                            shecessamt := exciseamt * 1 / 100;
                        END;
                        IF (servicetax > 0) THEN BEGIN
                            ecessamt := servicetax * 2 / 100;
                            shecessamt := servicetax * 1 / 100;
                        END;
                        "rem qty" := "Sales Line".Quantity - "Sales Line"."Qty. to Ship" - "Sales Line"."Quantity Shipped";
                        amt := ROUND((("Sales Line"."Qty. to Invoice" * "Sales Line"."Unit Price") + exciseamt + vatamt + taxamt + servicetax + ecessamt + shecessamt), 1);
                    END
                    ELSE BEGIN
                        amt := 0;
                        "rem qty" := "Sales Line".Quantity - "Sales Line"."Qty. to Ship" - "Sales Line"."Quantity Shipped";
                    END;
                    tot += amt;
                end;

                trigger OnPreDataItem();
                begin
                    // no:=1;
                end;
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
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        amt: Decimal;
        vatamt: Decimal;
        taxamt: Decimal;
        exciseamt: Decimal;
        pendingamt: Decimal;
        ecessamt: Decimal;
        shecessamt: Decimal;
        "rem qty": Decimal;
        no: Integer;
        tot: Decimal;
        servicetax: Decimal;
        servicecess: Decimal;
        PriceCaptionLbl: Label 'Price';
        Item_DescriptionCaptionLbl: Label 'Item Description';
        Total_QuantityCaptionLbl: Label 'Total Quantity';
        Shipped_QuantityCaptionLbl: Label 'Shipped Quantity';
        Shipping_QuantityCaptionLbl: Label 'Shipping Quantity';
        Remaining_QuantityCaptionLbl: Label 'Remaining Quantity';
        Sale_Order_No________CaptionLbl: Label 'Sale Order No.      :';
        Order_DetailsCaptionLbl: Label 'Order Details';
        Customer_Name___CaptionLbl: Label 'Customer Name  :';
        SNo_CaptionLbl: Label 'SNo.';
        Unit_of_MeasureCaptionLbl: Label 'Unit of Measure';
}

