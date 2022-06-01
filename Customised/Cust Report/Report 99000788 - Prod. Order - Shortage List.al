report 99000788 "Prod. Order - Shortage List"
{
    // version NAVW19.00.00.49326

    DefaultLayout = RDLC;
    RDLCLayout = './Prod. Order - Shortage List.rdlc';
    CaptionML = ENU = 'Prod. Order - Shortage List',
                ENN = 'Prod. Order - Shortage List';

    dataset
    {
        dataitem("Production Order"; "Production Order")
        {
            DataItemTableView = SORTING(Status, No.);
            PrintOnlyIfDetail = true;
            RequestFilterFields = Status, "No.", "Date Filter";
            column(TodayFormatted; FORMAT(TODAY, 0, 4))
            {
            }
            column(CompanyName; COMPANYNAME)
            {
            }
            column(Status_ProdOrder; Status)
            {
                IncludeCaption = false;
            }
            column(No_ProdOrder; "No.")
            {
                IncludeCaption = true;
            }
            column(Desc_ProdOrder; Description)
            {
                IncludeCaption = true;
            }
            column(DueDate_ProdOrder; FORMAT("Due Date"))
            {
            }
            column(ShortageListCaption; ShortageListCaptionLbl)
            {
            }
            column(PageNoCaption; PageNoCaptionLbl)
            {
            }
            column(DueDateCaption; DueDateCaptionLbl)
            {
            }
            column(NeededQtyCaption; NeededQtyCaptionLbl)
            {
            }
            column(CompItemScheduledNeedQtyCaption; CompItemScheduledNeedQtyCaptionLbl)
            {
            }
            column(CompItemInventoryCaption; CompItemInventoryCaptionLbl)
            {
            }
            column(RemainingQtyBaseCaption; RemainingQtyBaseCaptionLbl)
            {
            }
            column(RemQtyBaseCaption; RemQtyBaseCaptionLbl)
            {
            }
            column(ReceiptQtyCaption; ReceiptQtyCaptionLbl)
            {
            }
            column(QtyonPurchOrderCaption; QtyonPurchOrderCaptionLbl)
            {
            }
            column(QtyonSalesOrderCaption; QtyonSalesOrderCaptionLbl)
            {
            }
            dataitem("Prod. Order Line"; "Prod. Order Line")
            {
                DataItemLink = Status = FIELD(Status), Prod. Order No.=FIELD(No.);
                DataItemTableView = SORTING(Status, Prod. Order No., Line No.);
                PrintOnlyIfDetail = true;
                column(LineNo_ProdOrderLine; "Line No.")
                {
                }
                dataitem("Prod. Order Component"; "Prod. Order Component")
                {
                    DataItemLink = Status = FIELD(Status), Prod. Order No.=FIELD(Prod. Order No.),Prod. Order Line No.=FIELD(Line No.);
                    DataItemTableView = SORTING(Status,Item No.,Variant Code,Location Code,Due Date);
                    column(CompItemInventory;CompItem.Inventory)
                    {
                        DecimalPlaces = 0:5;
                    }
                    column(CompItemSchdldNeedQty;CompItem."Scheduled Need (Qty.)")
                    {
                        DecimalPlaces = 0:5;
                    }
                    column(NeededQuantity;NeededQty)
                    {
                        DecimalPlaces = 0:5;
                    }
                    column(ItemNo_ProdOrderComp;"Item No.")
                    {
                        IncludeCaption = true;
                    }
                    column(CompItemInvRemQtyBase;QtyOnHandAfterProd)
                    {
                        DecimalPlaces = 0:5;
                    }
                    column(Desc_ProdOrderComp;Description)
                    {
                        IncludeCaption = true;
                    }
                    column(CompItemSchdldRcptQty;CompItem."Scheduled Receipt (Qty.)")
                    {
                        DecimalPlaces = 0:5;
                    }
                    column(CompItemQtyonPurchOrder;CompItem."Qty. on Purch. Order")
                    {
                        DecimalPlaces = 0:5;
                    }
                    column(CompItemQtyonSalesOrder;CompItem."Qty. on Sales Order")
                    {
                        DecimalPlaces = 0:5;
                    }
                    column(RemQtyBase_ProdOrderComp;RemainingQty)
                    {
                        DecimalPlaces = 0:5;
                    }

                    trigger OnAfterGetRecord();
                    var
                        TempProdOrderLine : Record "Prod. Order Line" temporary;
                        TempProdOrderComp : Record "Prod. Order Component" temporary;
                    begin
                        SETRANGE("Item No.","Item No.");
                        SETRANGE("Variant Code","Variant Code");
                        SETRANGE("Location Code","Location Code");
                        FINDLAST;
                        SETRANGE("Item No.");
                        SETRANGE("Variant Code");
                        SETRANGE("Location Code");

                        CompItem.GET("Item No.");
                        CompItem.SETRANGE("Variant Filter","Variant Code");
                        CompItem.SETRANGE("Location Filter","Location Code");
                        CompItem.SETRANGE(
                          "Date Filter",0D,"Due Date" - 1);

                        CompItem.CALCFIELDS(
                          Inventory,"Reserved Qty. on Inventory",
                          "Scheduled Receipt (Qty.)","Reserved Qty. on Prod. Order",
                          "Scheduled Need (Qty.)","Res. Qty. on Prod. Order Comp.");
                        CompItem.Inventory :=
                          CompItem.Inventory -
                          CompItem."Reserved Qty. on Inventory";
                        CompItem."Scheduled Receipt (Qty.)" :=
                          CompItem."Scheduled Receipt (Qty.)" -
                          CompItem."Reserved Qty. on Prod. Order";
                        CompItem."Scheduled Need (Qty.)" :=
                          CompItem."Scheduled Need (Qty.)" -
                          CompItem."Res. Qty. on Prod. Order Comp.";

                        CompItem.SETRANGE(
                          "Date Filter",0D,"Due Date");
                        CompItem.CALCFIELDS(
                          "Qty. on Sales Order","Reserved Qty. on Sales Orders",
                          "Qty. on Purch. Order","Reserved Qty. on Purch. Orders");
                        CompItem."Qty. on Sales Order" :=
                          CompItem."Qty. on Sales Order" -
                          CompItem."Reserved Qty. on Sales Orders";
                        CompItem."Qty. on Purch. Order" :=
                          CompItem."Qty. on Purch. Order" -
                          CompItem."Reserved Qty. on Purch. Orders";

                        TempProdOrderLine.SETCURRENTKEY(
                          "Item No.","Variant Code","Location Code",Status,"Ending Date");

                        TempProdOrderLine.SETRANGE(Status,TempProdOrderLine.Status::Planned,Status - 1);
                        TempProdOrderLine.SETRANGE("Item No.","Item No.");
                        TempProdOrderLine.SETRANGE("Variant Code","Variant Code");
                        TempProdOrderLine.SETRANGE("Location Code","Location Code");
                        TempProdOrderLine.SETFILTER("Due Date",'..%1',"Due Date");
                        CalcProdOrderLineFields(TempProdOrderLine);
                        CompItem."Scheduled Receipt (Qty.)" :=
                          CompItem."Scheduled Receipt (Qty.)" +
                          TempProdOrderLine."Remaining Qty. (Base)" -
                          TempProdOrderLine."Reserved Qty. (Base)";

                        TempProdOrderLine.SETRANGE(Status,Status);
                        TempProdOrderLine.SETRANGE("Prod. Order No.","Prod. Order No.");
                        CalcProdOrderLineFields(TempProdOrderLine);
                        CompItem."Scheduled Receipt (Qty.)" :=
                          CompItem."Scheduled Receipt (Qty.)" +
                          TempProdOrderLine."Remaining Qty. (Base)" -
                          TempProdOrderLine."Reserved Qty. (Base)";

                        TempProdOrderComp.SETCURRENTKEY(
                          "Item No.","Variant Code","Location Code",Status,"Due Date");

                        TempProdOrderComp.SETRANGE(Status,TempProdOrderComp.Status::Planned,Status - 1);
                        TempProdOrderComp.SETRANGE("Item No.","Item No.");
                        TempProdOrderComp.SETRANGE("Variant Code","Variant Code");
                        TempProdOrderComp.SETRANGE("Location Code","Location Code");
                        TempProdOrderComp.SETFILTER("Due Date",'..%1',"Due Date");
                        CalcProdOrderCompFields(TempProdOrderComp);
                        CompItem."Scheduled Need (Qty.)" :=
                          CompItem."Scheduled Need (Qty.)" +
                          TempProdOrderComp."Remaining Qty. (Base)" -
                          TempProdOrderComp."Reserved Qty. (Base)";

                        TempProdOrderComp.SETRANGE(Status,Status);
                        TempProdOrderComp.SETFILTER("Prod. Order No.",'<%1',"Prod. Order No.");
                        CalcProdOrderCompFields(TempProdOrderComp);
                        CompItem."Scheduled Need (Qty.)" :=
                          CompItem."Scheduled Need (Qty.)" +
                          TempProdOrderComp."Remaining Qty. (Base)" -
                          TempProdOrderComp."Reserved Qty. (Base)";

                        TempProdOrderComp.SETRANGE("Prod. Order No.","Prod. Order No.");
                        TempProdOrderComp.SETRANGE("Prod. Order Line No.",0,"Prod. Order Line No." - 1);
                        CalcProdOrderCompFields(TempProdOrderComp);
                        CompItem."Scheduled Need (Qty.)" :=
                          CompItem."Scheduled Need (Qty.)" +
                          TempProdOrderComp."Remaining Qty. (Base)" -
                          TempProdOrderComp."Reserved Qty. (Base)";

                        TempProdOrderComp.SETRANGE("Prod. Order Line No.","Prod. Order Line No.");
                        TempProdOrderComp.SETRANGE("Item No.","Item No.");
                        TempProdOrderComp.SETRANGE("Variant Code","Variant Code");
                        TempProdOrderComp.SETRANGE("Location Code","Location Code");
                        CalcProdOrderCompFields(TempProdOrderComp);
                        CompItem."Scheduled Need (Qty.)" :=
                          CompItem."Scheduled Need (Qty.)" +
                          TempProdOrderComp."Remaining Qty. (Base)" -
                          TempProdOrderComp."Reserved Qty. (Base)";

                        RemainingQty :=
                          TempProdOrderComp."Remaining Qty. (Base)" -
                          TempProdOrderComp."Reserved Qty. (Base)";

                        QtyOnHandAfterProd :=
                          CompItem.Inventory -
                          TempProdOrderComp."Remaining Qty. (Base)" +
                          TempProdOrderComp."Reserved Qty. (Base)";

                        NeededQty :=
                          CompItem."Scheduled Need (Qty.)" +
                          CompItem."Qty. on Sales Order" -
                          CompItem."Qty. on Purch. Order" -
                          CompItem."Scheduled Receipt (Qty.)" -
                          CompItem.Inventory;

                        IF NeededQty < 0 THEN
                          NeededQty := 0;

                        IF (NeededQty = 0) AND (QtyOnHandAfterProd >= 0) OR
                           (RemainingQty = 0)
                        THEN
                          CurrReport.SKIP;
                    end;

                    trigger OnPreDataItem();
                    begin
                        SETFILTER("Due Date","Production Order".GETFILTER("Date Filter"));
                        SETFILTER("Remaining Qty. (Base)",'>0');
                    end;
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
        label(Status_ProdOrderCaption;ENU='Status',
                                      ENN='Status')
    }

    var
        CompItem : Record Item;
        RemainingQty : Decimal;
        NeededQty : Decimal;
        QtyOnHandAfterProd : Decimal;
        ShortageListCaptionLbl : TextConst ENU='Shortage List',ENN='Shortage List';
        PageNoCaptionLbl : TextConst ENU='Page',ENN='Page';
        DueDateCaptionLbl : TextConst ENU='Due Date',ENN='Due Date';
        NeededQtyCaptionLbl : TextConst ENU='Needed Quantity',ENN='Needed Quantity';
        CompItemScheduledNeedQtyCaptionLbl : TextConst ENU='Scheduled Need',ENN='Scheduled Need';
        CompItemInventoryCaptionLbl : TextConst ENU='Quantity on Hand',ENN='Quantity on Hand';
        RemainingQtyBaseCaptionLbl : TextConst ENU='Qty. on Hand after Production',ENN='Qty. on Hand after Production';
        RemQtyBaseCaptionLbl : TextConst ENU='Remaining Qty. (Base)',ENN='Remaining Qty. (Base)';
        ReceiptQtyCaptionLbl : TextConst ENU='Scheduled Receipt',ENN='Scheduled Receipt';
        QtyonPurchOrderCaptionLbl : TextConst ENU='Qty. on Purch. Order',ENN='Qty. on Purch. Order';
        QtyonSalesOrderCaptionLbl : TextConst ENU='Qty. on Sales Order',ENN='Qty. on Sales Order';

    [LineStart(22935)]
    local procedure CalcProdOrderLineFields(var ProdOrderLineFields : Record "Prod. Order Line");
    var
        ProdOrderLine : Record "Prod. Order Line";
        RemainingQtyBase : Decimal;
        ReservedQtyBase : Decimal;
    begin
        ProdOrderLine.COPY(ProdOrderLineFields);

        IF ProdOrderLine.FINDSET THEN
          REPEAT
            ProdOrderLine.CALCFIELDS("Reserved Qty. (Base)");
            RemainingQtyBase += ProdOrderLine."Remaining Qty. (Base)";
            ReservedQtyBase += ProdOrderLine."Reserved Qty. (Base)";
          UNTIL ProdOrderLine.NEXT = 0;

        ProdOrderLineFields."Remaining Qty. (Base)" := RemainingQtyBase;
        ProdOrderLineFields."Reserved Qty. (Base)" := ReservedQtyBase;
    end;

    [LineStart(22948)]
    local procedure CalcProdOrderCompFields(var ProdOrderCompFields : Record "Prod. Order Component");
    var
        ProdOrderComp : Record "Prod. Order Component";
        RemainingQtyBase : Decimal;
        ReservedQtyBase : Decimal;
    begin
        //ProdOrderComp.COPY(ProdOrderCompFields);//B2B

        IF ProdOrderComp.FINDSET THEN
          REPEAT
            ProdOrderComp.CALCFIELDS("Reserved Qty. (Base)");
            RemainingQtyBase += ProdOrderComp."Remaining Qty. (Base)";
            ReservedQtyBase += ProdOrderComp."Reserved Qty. (Base)";
          UNTIL ProdOrderComp.NEXT = 0;

        ProdOrderCompFields."Remaining Qty. (Base)" := RemainingQtyBase;
        ProdOrderCompFields."Reserved Qty. (Base)" := ReservedQtyBase;
    end;
}

