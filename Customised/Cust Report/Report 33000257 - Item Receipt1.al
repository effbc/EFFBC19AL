report 33000257 "Item Receipt1"
{
    // version QC1.0

    DefaultLayout = RDLC;
    RDLCLayout = './Item Receipt1.rdlc';

    dataset
    {
        dataitem("Inspection Receipt Header"; "Inspection Receipt Header")
        {
            DataItemTableView = SORTING(Receipt No., Item No.);
            RequestFilterFields = "Receipt No.";
            column(Inspection_Receipt_Header__Receipt_No__; "Receipt No.")
            {
            }
            column(Inspection_Receipt_Header__Vendor_No__; "Vendor No.")
            {
            }
            column(Inspection_Receipt_Header__Vendor_Name_; "Vendor Name")
            {
            }
            column(Inspection_Receipt_Header_Address; Address)
            {
            }
            column(Inspection_Receipt_Header__Item_No__; "Item No.")
            {
            }
            column(Inspection_Receipt_Header__Item_Description_; "Item Description")
            {
            }
            column(TotalQty; TotalQty)
            {
            }
            column(AccptQty; AccptQty)
            {
            }
            column(RejQty; RejQty)
            {
            }
            column(Accpt; Accpt)
            {
            }
            column(Rej; Rej)
            {
            }
            column(Receipt_Wise_QC_AnalysisCaption; Receipt_Wise_QC_AnalysisCaptionLbl)
            {
            }
            column(Inspection_Receipt_Header__Receipt_No__Caption; FIELDCAPTION("Receipt No."))
            {
            }
            column(Inspection_Receipt_Header__Vendor_No__Caption; FIELDCAPTION("Vendor No."))
            {
            }
            column(Inspection_Receipt_Header__Vendor_Name_Caption; FIELDCAPTION("Vendor Name"))
            {
            }
            column(Inspection_Receipt_Header_AddressCaption; FIELDCAPTION(Address))
            {
            }
            column(Inspection_Receipt_Header__Item_No__Caption; FIELDCAPTION("Item No."))
            {
            }
            column(Inspection_Receipt_Header__Item_Description_Caption; FIELDCAPTION("Item Description"))
            {
            }
            column(Total_QtyCaption; Total_QtyCaptionLbl)
            {
            }
            column(Qty_AcceptedCaption; Qty_AcceptedCaptionLbl)
            {
            }
            column(Qty_Rej_Caption; Qty_Rej_CaptionLbl)
            {
            }
            column(Accept__Caption; Accept__CaptionLbl)
            {
            }
            column(Rej__Caption; Rej__CaptionLbl)
            {
            }
            column(Inspection_Receipt_Header_No_; "No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF Status = Status::"0" THEN
                    AccptQty := Quantity
                ELSE
                    IF Status = Status::"1" THEN BEGIN
                        RejQty := Quantity;
                    END;
                TotalQty := AccptQty + RejQty;
                Accpt := (AccptQty / TotalQty) * 100;
                Rej := (RejQty / TotalQty) * 100;
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
        AccptQty: Integer;
        RejQty: Integer;
        TotalQty: Integer;
        Accpt: Decimal;
        Rej: Decimal;
        Receipt_Wise_QC_AnalysisCaptionLbl: Label 'Receipt Wise QC Analysis';
        Total_QtyCaptionLbl: Label 'Total Qty';
        Qty_AcceptedCaptionLbl: Label 'Qty Accepted';
        Qty_Rej_CaptionLbl: Label 'Qty Rej.';
        Accept__CaptionLbl: Label 'Accept %';
        Rej__CaptionLbl: Label 'Rej %';
}

