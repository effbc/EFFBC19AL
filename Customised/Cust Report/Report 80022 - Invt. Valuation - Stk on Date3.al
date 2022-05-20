report 80022 "Invt. Valuation - Stk on Date3"
{
    // version NAVW17.00,ESPL 1.0

    DefaultLayout = RDLC;
    RDLCLayout = './Invt. Valuation - Stk on Date3.rdlc';
    Caption = 'Invt. Valuation - Cost Spec.';

    dataset
    {
        dataitem(Item;Item)
        {
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.","Inventory Posting Group","Statistics Group","Location Filter";
            column(COMPANYNAME;COMPANYNAME)
            {
            }
            column(STRSUBSTNO_Text000_FORMAT_ValuationDate__;STRSUBSTNO(Text000,FORMAT(ValuationDate)))
            {
            }
            column(FORMAT_TODAY_0_4_;FORMAT(TODAY,0,4))
            {
            }
            column(CurrReport_PAGENO;CurrReport.PAGENO)
            {
            }
            column(USERID;USERID)
            {
            }
            column(Item_TABLECAPTION__________ItemFilter;Item.TABLECAPTION + ': ' + ItemFilter)
            {
            }
            column(EntryTypeDescription_2_;EntryTypeDescription[2])
            {
            }
            column(EntryTypeDescription_3_;EntryTypeDescription[3])
            {
            }
            column(EntryTypeDescription_4_;EntryTypeDescription[4])
            {
            }
            column(EntryTypeDescription_5_;EntryTypeDescription[5])
            {
            }
            column(TotalCost;TotalCost)
            {
                AutoFormatType = 1;
            }
            column(Inventory_Valuation___Item_WiseCaption;Inventory_Valuation___Item_WiseCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
            {
            }
            column(UserCaption;UserCaptionLbl)
            {
            }
            column(RemainingQtyCaption;RemainingQtyCaptionLbl)
            {
            }
            column(Unit_CostCaption;Unit_CostCaptionLbl)
            {
            }
            column(Total_CostCaption;Total_CostCaptionLbl)
            {
            }
            column(Item_DescriptionCaption;Item_DescriptionCaptionLbl)
            {
            }
            column(UOMCaption;UOMCaptionLbl)
            {
            }
            column(Item_NoCaption;Item_NoCaptionLbl)
            {
            }
            column(TotalCostCaption;TotalCostCaptionLbl)
            {
            }
            column(Item_No_;"No.")
            {
            }
            column(Item_Variant_Filter;"Variant Filter")
            {
            }
            column(Item_Location_Filter;"Location Filter")
            {
            }
            column(Item_Global_Dimension_1_Filter;"Global Dimension 1 Filter")
            {
            }
            column(Item_Global_Dimension_2_Filter;"Global Dimension 2 Filter")
            {
            }
            dataitem("Item Ledger Entry";"Item Ledger Entry")
            {
                DataItemLink = Item No.=FIELD(No.),Variant Code=FIELD(Variant Filter),Location Code=FIELD(Location Filter),Global Dimension 1 Code=FIELD(Global Dimension 1 Filter),Global Dimension 2 Code=FIELD(Global Dimension 2 Filter);
                DataItemTableView = SORTING(Item No.,Variant Code,Open,Positive,Location Code,Posting Date);
                column(EntryTypeDescription_2__Control10;EntryTypeDescription[2])
                {
                }
                column(EntryTypeDescription_3__Control13;EntryTypeDescription[3])
                {
                }
                column(EntryTypeDescription_4__Control18;EntryTypeDescription[4])
                {
                }
                column(EntryTypeDescription_5__Control20;EntryTypeDescription[5])
                {
                }
                column(TotalCost_Control43;TotalCost)
                {
                    AutoFormatType = 1;
                }
                column(Item_Description;Item.Description)
                {
                }
                column(AvgCost;AvgCost)
                {
                    AutoFormatType = 2;
                }
                column(RemainingQty;RemainingQty)
                {
                    DecimalPlaces = 0:5;
                }
                column(Item__No__;Item."No.")
                {
                }
                column(Item__Base_Unit_of_Measure_;Item."Base Unit of Measure")
                {
                }
                column(Item_Ledger_Entry_Entry_No_;"Entry No.")
                {
                }
                column(Item_Ledger_Entry_Item_No_;"Item No.")
                {
                }
                column(Item_Ledger_Entry_Variant_Code;"Variant Code")
                {
                }
                column(Item_Ledger_Entry_Location_Code;"Location Code")
                {
                }
                column(Item_Ledger_Entry_Global_Dimension_1_Code;"Global Dimension 1 Code")
                {
                }
                column(Item_Ledger_Entry_Global_Dimension_2_Code;"Global Dimension 2 Code")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    IsPositive := GetSign;
                    CalcRemainingQty;
                    IF RemainingQty = 0 THEN
                      CurrReport.SKIP;

                    CalcUnitCost;
                    FOR i := 1 TO ARRAYLEN(TotalCostTotal) DO
                      TotalCostTotal[i] := TotalCostTotal[i] * ABS(RemainingQty);
                    TotalCost := TotalCost * ABS(RemainingQty);
                end;

                trigger OnPreDataItem();
                begin
                    SETRANGE("Posting Date",0D,ValuationDate);
                    SETRANGE("Drop Shipment",FALSE);

                    CurrReport.CREATETOTALS(NoOfEntries,TotalCost,TotalCostTotal,PosQty,RemainingQty,Quantity);
                end;
            }

            trigger OnPreDataItem();
            begin
                CurrReport.CREATETOTALS(NoOfEntries,TotalCost,TotalCostTotal);
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

    trigger OnPreReport();
    begin
        ItemFilter := Item.GETFILTERS;

        FOR i := 1 TO ARRAYLEN(EntryTypeDescription) DO BEGIN
          ValueEntry."Entry Type" := i - 1;
          EntryTypeDescription[i] := FORMAT(ValueEntry."Entry Type");
        END;

        WITH ValueEntry DO BEGIN
          SETCURRENTKEY("Item Ledger Entry No.");
          SETRANGE("Posting Date",0D,ValuationDate);
          SETFILTER("Variant Code",Item.GETFILTER("Variant Filter"));
          SETFILTER("Location Code",Item.GETFILTER("Location Filter"));
          SETFILTER("Global Dimension 1 Code",Item.GETFILTER("Global Dimension 1 Filter"));
          SETFILTER("Global Dimension 2 Code",Item.GETFILTER("Global Dimension 2 Filter"));
        END;
    end;

    var
        Text000 : Label 'Dated: %1';
        Text001 : Label 'Enter the valuation date';
        ValueEntry : Record "Value Entry";
        ItemFilter : Text[250];
        EntryTypeDescription : array [5] of Text[30];
        i : Integer;
        NoOfEntries : array [5] of Decimal;
        PosQty : Decimal;
        RemainingQty : Decimal;
        TotalInvoicedQty : Decimal;
        TotalCostTotal : array [5] of Decimal;
        ExpCostTotal : array [5] of Decimal;
        TotalCost : Decimal;
        ValuationDate : Date;
        UnitCost : array [5] of Decimal;
        ExpectedUnitCost : array [5] of Decimal;
        AvgCost : Decimal;
        IsPositive : Boolean;
        Inventory_Valuation___Item_WiseCaptionLbl : Label 'Inventory Valuation - Item Wise';
        CurrReport_PAGENOCaptionLbl : Label 'Page';
        UserCaptionLbl : Label 'User';
        RemainingQtyCaptionLbl : Label 'Quantity';
        Unit_CostCaptionLbl : Label 'Unit Cost';
        Total_CostCaptionLbl : Label 'Total Cost';
        Item_DescriptionCaptionLbl : Label 'Item Description';
        UOMCaptionLbl : Label 'UOM';
        Item_NoCaptionLbl : Label 'Item No';
        TotalCostCaptionLbl : Label 'Total';

    [LineStart(17745)]
    procedure CalcRemainingQty();
    var
        ItemApplnEntry : Record "Item Application Entry";
    begin
        RemainingQty := "Item Ledger Entry".Quantity;
        IF IsPositive THEN
          PosQty := "Item Ledger Entry".Quantity;

        WITH ItemApplnEntry DO BEGIN
          IF "Item Ledger Entry".Positive THEN BEGIN
            RESET;
            SETCURRENTKEY(
              "Inbound Item Entry No.","Cost Application","Outbound Item Entry No.");
            SETRANGE("Inbound Item Entry No.","Item Ledger Entry"."Entry No.");
            SETRANGE("Cost Application",TRUE);
            SETRANGE("Posting Date",0D,ValuationDate);
            SETFILTER("Outbound Item Entry No.",'<>%1',0);
            IF FIND('-') THEN
              REPEAT
                SumQty(RemainingQty,PosQty,"Outbound Item Entry No.",Quantity);
              UNTIL NEXT = 0;
          END ELSE BEGIN
            RESET;
            SETCURRENTKEY(
              "Item Ledger Entry No.","Outbound Item Entry No.","Cost Application");
            SETRANGE("Item Ledger Entry No.","Item Ledger Entry"."Entry No.");
            SETRANGE("Outbound Item Entry No.","Item Ledger Entry"."Entry No.");
            SETRANGE("Posting Date",0D,ValuationDate);
            SETRANGE("Cost Application",TRUE);
            IF FIND('-') THEN
              REPEAT
                SumQty(RemainingQty,PosQty,"Inbound Item Entry No.",-Quantity);
              UNTIL NEXT = 0;
          END;
        END;

        IF IsPositive THEN
          PosQty := RemainingQty;
    end;

    [LineStart(17781)]
    procedure SumQty(var RemainingQty : Decimal;var PosQty : Decimal;EntryNo : Integer;AppliedQty : Decimal) : Decimal;
    var
        ItemLedgEntry : Record "Item Ledger Entry";
    begin
        ItemLedgEntry.GET(EntryNo);
        IF (ItemLedgEntry.Quantity * AppliedQty < 0) OR
           (ItemLedgEntry."Posting Date" > ValuationDate)
        THEN
          EXIT;

        RemainingQty := RemainingQty + AppliedQty;
        IF IsPositive THEN
          PosQty := PosQty + AppliedQty;
    end;

    [LineStart(17792)]
    procedure CalcUnitCost();
    begin
        ValueEntry.SETRANGE("Item Ledger Entry No.","Item Ledger Entry"."Entry No.");
        WITH ValueEntry DO BEGIN
          TotalInvoicedQty := 0;
          TotalCost := 0;
          FOR i := 1 TO ARRAYLEN(NoOfEntries) DO BEGIN
            TotalCostTotal[i] := 0;
            ExpCostTotal[i] := 0;
            NoOfEntries[i] := 0;
          END;

          IF FIND('-') THEN BEGIN
            REPEAT
              TotalInvoicedQty := TotalInvoicedQty + "Invoiced Quantity";
              IF Item."Costing Method" = Item."Costing Method"::Average THEN BEGIN
                SumUnitCost(
                  TotalCostTotal["Entry Type" + 1],"Cost Amount (Actual)","Item Ledger Entry".Quantity);
                SumUnitCost(
                  ExpCostTotal["Entry Type" + 1],"Cost Amount (Expected)","Item Ledger Entry".Quantity);
              END ELSE BEGIN
                SumUnitCost(TotalCostTotal["Entry Type" + 1],"Cost Amount (Actual)","Valued Quantity");
                SumUnitCost(ExpCostTotal["Entry Type" + 1],"Cost Amount (Expected)","Valued Quantity");
              END;
              NoOfEntries["Entry Type" + 1] := 1;
            UNTIL NEXT = 0;

            FOR i := 1 TO ARRAYLEN(NoOfEntries) DO BEGIN
              IF TotalInvoicedQty <> "Item Ledger Entry".Quantity THEN
                TotalCostTotal[i] := ExpCostTotal[i];
              TotalCost := TotalCost + TotalCostTotal[i];
            END;
          END;
        END;
    end;

    [LineStart(17826)]
    procedure SumUnitCost(var UnitCost : Decimal;CostAmount : Decimal;Quantity : Decimal);
    begin
        UnitCost := UnitCost + CostAmount / ABS(Quantity);
    end;

    [LineStart(17829)]
    procedure ReDistribCost();
    var
        CostShare : Decimal;
    begin
        IF PosQty <> 0 THEN
          CostShare := RemainingQty / PosQty
        ELSE
          CostShare := 0;

        IF CostShare <> 1 THEN
          FOR i := 2 TO ARRAYLEN(NoOfEntries) DO BEGIN
            TotalCostTotal[1] := TotalCostTotal[1] + TotalCostTotal[i] * (1 - CostShare);
            TotalCostTotal[i] := TotalCostTotal[i] * CostShare;
          END;
    end;

    [LineStart(17841)]
    procedure CalcAvgCost();
    begin
        AvgCost := 0;
        FOR i := 1 TO ARRAYLEN(NoOfEntries) DO BEGIN
          IF RemainingQty <> 0 THEN
            UnitCost[i] := TotalCostTotal[i] / ABS(RemainingQty)
          ELSE
            UnitCost[i] := 0;
          AvgCost := AvgCost + UnitCost[i];
        END;
    end;

    [LineStart(17851)]
    procedure GetSign() : Boolean;
    var
        ItemLedgEntry : Record "Item Ledger Entry";
    begin
        WITH "Item Ledger Entry" DO
          CASE "Entry Type" OF
            "Entry Type"::Purchase,
            "Entry Type"::"Positive Adjmt.",
            "Entry Type"::Output:
              EXIT(TRUE);
            "Entry Type"::Transfer:
              BEGIN
                IF NOT Positive THEN
                  EXIT(FALSE);
                ItemLedgEntry.COPYFILTERS("Item Ledger Entry");
                ItemLedgEntry."Entry No." := "Item Ledger Entry"."Entry No." - 1;
                EXIT(NOT ItemLedgEntry.FIND);
              END;
            ELSE
              EXIT(FALSE)
          END;
    end;
}

