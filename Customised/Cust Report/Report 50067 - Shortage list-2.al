report 50067 "Shortage list-2"
{
    // version ESPL1.0

    DefaultLayout = RDLC;
    RDLCLayout = './Shortage list-2.rdlc';

    dataset
    {
        dataitem("Prod. Order Component";"Prod. Order Component")
        {
            DataItemTableView = SORTING(Item No.) ORDER(Ascending);
            RequestFilterFields = Status,"Prod. Order No.","Due Date";
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
            column(Prod__Order_Component__GETFILTER__Prod__Order_No___;"Prod. Order Component".GETFILTER("Prod. Order No."))
            {
            }
            column(FORMAT_TODAY_0_4__Control1000000001;FORMAT(TODAY,0,4))
            {
            }
            column(COMPANYNAME_Control1000000002;COMPANYNAME)
            {
            }
            column(CurrReport_PAGENO_Control1000000003;CurrReport.PAGENO)
            {
            }
            column(USERID_Control1000000005;USERID)
            {
            }
            column(Prod__Order_Component__GETFILTER__Prod__Order_No____Control1000000018;"Prod. Order Component".GETFILTER("Prod. Order No."))
            {
            }
            column(Prod__Order_Component__Item_No__;"Item No.")
            {
            }
            column(Prod__Order_Component_Description;Description)
            {
            }
            column(Prod__Order_Component__Expected_Quantity_;"Expected Quantity")
            {
            }
            column(Item__Inventory_at_Stores_;Item."Inventory at Stores")
            {
            }
            column(PMIQty;PMIQty)
            {
            }
            column(QtyatStores;QtyatStores)
            {
            }
            column(Item__Qty__on_Purch__Order_;Item."Qty. on Purch. Order")
            {
            }
            column(Item__Quantity_Under_Inspection_;Item."Quantity Under Inspection")
            {
            }
            column(Item__Quantity_Rejected_;Item."Quantity Rejected")
            {
            }
            column(Prod__Order_Component__Item_No___Control1000000006;"Item No.")
            {
            }
            column(Prod__Order_Component_Description_Control1000000008;Description)
            {
            }
            column(Item__Inventory_at_Stores__Control1000000012;Item."Inventory at Stores")
            {
            }
            column(QtyatStores_Control1000000014;QtyatStores)
            {
            }
            column(PMIQty_Control1000000010;PMIQty)
            {
            }
            column(Prod__Order_Component__Expected_Quantity__Control1000000015;"Expected Quantity")
            {
            }
            column(Purchase_Line___Expected_Receipt_Date_;"Purchase Line"."Expected Receipt Date")
            {
            }
            column(Shortage_ListCaption;Shortage_ListCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Qty_in_StoresCaption;Qty_in_StoresCaptionLbl)
            {
            }
            column(ShortageCaption;ShortageCaptionLbl)
            {
            }
            column(Prod_Orders_Caption;Prod_Orders_CaptionLbl)
            {
            }
            column(Material_IssuedCaption;Material_IssuedCaptionLbl)
            {
            }
            column(Required_QtyCaption;Required_QtyCaptionLbl)
            {
            }
            column(Prod__Order_Component__Item_No__Caption;FIELDCAPTION("Item No."))
            {
            }
            column(Prod__Order_Component_DescriptionCaption;FIELDCAPTION(Description))
            {
            }
            column(Purch_Order_QtyCaption;Purch_Order_QtyCaptionLbl)
            {
            }
            column(Qty_Under_InspectionCaption;Qty_Under_InspectionCaptionLbl)
            {
            }
            column(Qty_RejectedCaption;Qty_RejectedCaptionLbl)
            {
            }
            column(Shortage_ListCaption_Control1000000000;Shortage_ListCaption_Control1000000000Lbl)
            {
            }
            column(CurrReport_PAGENO_Control1000000003Caption;CurrReport_PAGENO_Control1000000003CaptionLbl)
            {
            }
            column(Prod__Order_Component_Description_Control1000000008Caption;FIELDCAPTION(Description))
            {
            }
            column(Prod__Order_Component__Item_No___Control1000000006Caption;FIELDCAPTION("Item No."))
            {
            }
            column(Qty_in_StoresCaption_Control1000000013;Qty_in_StoresCaption_Control1000000013Lbl)
            {
            }
            column(ShortageCaption_Control1000000017;ShortageCaption_Control1000000017Lbl)
            {
            }
            column(Prod_Orders_Caption_Control1000000019;Prod_Orders_Caption_Control1000000019Lbl)
            {
            }
            column(Material_IssuedCaption_Control1000000011;Material_IssuedCaption_Control1000000011Lbl)
            {
            }
            column(Required_QtyCaption_Control1000000016;Required_QtyCaption_Control1000000016Lbl)
            {
            }
            column(Expected_DateCaption;Expected_DateCaptionLbl)
            {
            }
            column(Prod__Order_Component_Status;Status)
            {
            }
            column(Prod__Order_Component_Prod__Order_No_;"Prod. Order No.")
            {
            }
            column(Prod__Order_Component_Prod__Order_Line_No_;"Prod. Order Line No.")
            {
            }
            column(Prod__Order_Component_Line_No_;"Line No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                QtyRequired := 0;
                QtyatStores := 0;
                Accepted := 0;
                TotalCurrentProdOrderQty := 0;
                //TotalNeededQty := 0;
            end;

            trigger OnPreDataItem();
            begin
                QtyatStores := 0;
                QtyRequired := 0;
                //"Prod. Order Component".GETFILTER("Prod. Order No.");
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
        QtyatStores : Decimal;
        QtyRequired : Decimal;
        Item : Record Item;
        ItemLedgerEntry : Record "Item Ledger Entry";
        ItemLedgerEntryProd : Record "Item Ledger Entry";
        Accepted : Decimal;
        UnderInspection : Decimal;
        TotalNeededQty : Decimal;
        ProdOrderComponent : Record "Prod. Order Component";
        TotalCurrentProdOrderQty : Decimal;
        TotalAvailableQty : Decimal;
        ILE : Record "Item Ledger Entry";
        PMIQty : Decimal;
        PostedMlLine : Record "Posted Material Issues Line";
        qas : Decimal;
        opt : Option Brief,Detail,Saleorder;
        req : Decimal;
        PostedMHeader : Record "Posted Material Issues Header";
        eq : Date;
        "Purchase Line" : Record "Purchase Line";
        Shortage_ListCaptionLbl : Label 'Shortage List';
        CurrReport_PAGENOCaptionLbl : Label 'Page';
        Qty_in_StoresCaptionLbl : Label 'Qty in Stores';
        ShortageCaptionLbl : Label 'Shortage';
        Prod_Orders_CaptionLbl : Label 'Prod.Orders:';
        Material_IssuedCaptionLbl : Label 'Material Issued';
        Required_QtyCaptionLbl : Label 'Required Qty';
        Purch_Order_QtyCaptionLbl : Label 'Purch Order Qty';
        Qty_Under_InspectionCaptionLbl : Label 'Qty Under Inspection';
        Qty_RejectedCaptionLbl : Label 'Qty Rejected';
        Shortage_ListCaption_Control1000000000Lbl : Label 'Shortage List';
        CurrReport_PAGENO_Control1000000003CaptionLbl : Label 'Page';
        Qty_in_StoresCaption_Control1000000013Lbl : Label 'Qty in Stores';
        ShortageCaption_Control1000000017Lbl : Label 'Shortage';
        Prod_Orders_Caption_Control1000000019Lbl : Label 'Prod.Orders:';
        Material_IssuedCaption_Control1000000011Lbl : Label 'Material Issued';
        Required_QtyCaption_Control1000000016Lbl : Label 'Required Qty';
        Expected_DateCaptionLbl : Label 'Expected Date';
}

