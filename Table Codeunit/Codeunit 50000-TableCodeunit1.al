codeunit 50001 "Tables Codeunit"
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Table, Database::"Cust. Ledger Entry", 'OnAfterCopyCustLedgerEntryFromGenJnlLine', '', false, false)]
    local procedure OnAfterCopyCustLedgerEntryFromGenJnlLine(var CustLedgerEntry: Record "Cust. Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        // Rev01>>
        CustLedgerEntry."DD/FDR No." := GenJournalLine."DD/FDR No.";
        CustLedgerEntry."Payment Through" := GenJournalLine."Payment Through";
        // Rev01<<
        CustLedgerEntry."Customer ord No" := GenJournalLine."Customer Ord no"; //srinivas
        CustLedgerEntry."Sale Order no" := GenJournalLine."Sale Order No";               //srinivas
        CustLedgerEntry."Payment Type" := GenJournalLine."Payment Type";//EFFUPG
        CustLedgerEntry."invoice no" := GenJournalLine."Invoice no";//EFFUPG
    end;

    [EventSubscriber(ObjectType::Table, Database::"Vendor Ledger Entry", 'OnAfterCopyVendLedgerEntryFromGenJnlLine', '', false, false)]
    local procedure OnAfterCopyVendLedgerEntryFromGenJnlLine(var VendorLedgerEntry: Record "Vendor Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        VendorLedgerEntry."Vendor Invoice Date" := GenJournalLine."Vendor Invoice Date";//EFFUPG
                                                                                        // Rev01>>
        VendorLedgerEntry."DD/FDR No." := GenJournalLine."DD/FDR No.";
        VendorLedgerEntry."Payment Through" := GenJournalLine."Payment Through";

        // Rev01<<

    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterAssignItemValues', '', false, false)]
    local procedure OnAfterAssignItemValues(var SalesLine: Record "Sales Line"; Item: Record Item)
    var

        PrepaymentMgt: Codeunit "Prepayment Mgt.";
        ProductionBOMHeader: Record "Production BOM Header";
        VersionMgt: Codeunit VersionManagement;
        SalesHeaderRDSO: Record "Sales Header";
        PrdOrder: Record "Production Order";
        rpoQty: Integer;
    begin
        //B2B
        SalesLine."Production BOM No." := Item."Production BOM No.";
        ProductionBOMHeader.SetRange("No.", SalesLine."Production BOM No.");
        if ProductionBOMHeader.Find('-') then
            SalesLine."Production Bom Version No." := VersionMgt.GetBOMVersion(ProductionBOMHeader."No.", WorkDate, true);
        SalesLine."Spec ID" := Item."Spec ID";
        SalesLine."QC Enabled" := Item."QC Enabled";
        //B2B
        //Added by Pranavi on 05-Dec-2015 for updating schedule item no if item is changed in sales line
        Schedule.Reset;
        Schedule.SetRange("Document Type", Schedule."Document Type"::Order);
        Schedule.SetRange("Document No.", SalesLine."Document No.");
        Schedule.SetRange("Document Line No.", SalesLine."Line No.");
        Schedule.SetRange(Schedule."Line No.", SalesLine."Line No.");
        Schedule.SetRange(Schedule."No.", xRec."No.");
        if Schedule.FindFirst then begin
            Schedule."No." := Item."No.";
            Schedule.Validate("No.");
        end;
        //End by Pranavi on 05-Dec-2015
    end;


    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", 'OnAfterTestStatusOpen', '', false, false)]
    local procedure OnAfterTestStatusOpen()
    begin
        // Added by Pranavi on 22-Jul-2016 for TIN No of vendor checking
        IF "Document Type" = "Document Type"::Order THEN BEGIN
            Vndr.RESET;
            Vndr.SETRANGE(Vndr."No.", PurchHeader."Buy-from Vendor No.");
            IF Vndr.FINDFIRST THEN
                IF Vndr."Gen. Bus. Posting Group" <> 'FOREIGN' THEN
                    IF (Vndr."T.I.N. No." = '') AND (Vndr."T.I.N Status" IN [Vndr."T.I.N Status"::" ", Vndr."T.I.N Status"::TINAPPLIED]) THEN
                        ERROR('Please enter T.I.N Number in Vendor Card in Tax Information Tab!\IF TIN Not Applicable update TIN Status to TIN Invalid!');
        END;
        // end by pranavi
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", 'OnAfterCheckBuyFromVendor', '', false, false)]
    local procedure OnAfterCheckBuyFromVendor(var PurchaseHeader: Record "Purchase Header"; xPurchaseHeader: Record "Purchase Header"; Vendor: Record Vendor)
    begin
        Vendor.TESTFIELD(Vendor."Updated in Cashflow", TRUE);
        PurchaseHeader."Buy-from Address 3" := Vendor."Address 3";
        //Structure:=Vend."Tax Area Code";
        Structure := 'PURCH_GST';    //pranavi
        VALIDATE(Structure, 'PURCH_GST');

        IF Vendor."Gen. Bus. Posting Group" = 'FOREIGN' THEN BEGIN
            PurchaseHeader."Shipment Method Code" := 'EX2';
        END
        ELSE BEGIN
            PurchaseHeader."Shipment Method Code" := 'DOD';
        END;
        "Tax Area Code" := Vend."Tax Area Code";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", 'OnValidateOrderAddressCodeOnAfterCopyBuyFromVendorAddressFieldsFromVendor', '', false, false)]
    local procedure OnValidateOrderAddressCodeOnAfterCopyBuyFromVendorAddressFieldsFromVendor(var PurchaseHeader: Record "Purchase Header"; Vend: Record Vendor);
    begin
        // << Pranavi
        PurchaseHeader.State := OrderAddr.State;
        IF OrderAddr."GST Registration No." <> '' THEN
            IF "GST Vendor Type" <> "GST Vendor Type"::Registered THEN
                "GST Vendor Type" := "GST Vendor Type"::Registered;
        // << Pranavi

    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", 'OnUpdatePurchLinesByFieldNoOnBeforeLineModify', '', false, false)]
    local procedure OnUpdatePurchLinesByFieldNoOnBeforeLineModify(var PurchaseHeader: Record "Purchase Header"; var xPurchaseHeader: Record "Purchase Header"; PurchaseLine: Record "Purchase Line")
    begin
        PurchaseLine."Form Code" := "Form Code";//B2B
        ELSE
        PurchaseLine."Form Code" := '';
    end;

    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", 'OnValidateItemNoOnAfterGetItem', '', false, false)]
    local procedure OnValidateItemNoOnAfterGetItem(var ItemJournalLine: Record "Item Journal Line"; Item: Record Item)
    var
        PostedMatIssHdr: Record "Posted Material Issues Header";
    begin
        // Conditon Added by Pranavi on 11-Jan-2016 for allowing blocked item for site stock updation purpose
        if not ((ItemJournalLine."Journal Batch Name" = 'POS-CS-SIG') and (ItemJournalLine."Entry Type" = ItemJournalLine."Entry Type"::"Positive Adjmt.")) then
            if PostedMatIssHdr.Get(ItemJournalLine."Document No.") then begin
                if not (((PostedMatIssHdr."Transfer-from Code" = 'SITE') and (PostedMatIssHdr."Transfer-to Code" = 'CS')) or
                        ((PostedMatIssHdr."Transfer-from Code" = 'CS') and (PostedMatIssHdr."Transfer-to Code" = 'SITE'))) then
                    Item.TestField(Blocked, false);
            end
            else
                Item.TestField(Blocked, false);

        Item.TestField(Type, Item.Type::Inventory);
        if ItemJournalLine."Value Entry Type" = ItemJournalLine."Value Entry Type"::Revaluation then
            Item.TestField("Inventory Value Zero", false);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", 'OnSetUpNewLineOnAfterFindItemJnlLine', '', false, false)]
    local procedure OnSetUpNewLineOnAfterFindItemJnlLine(var ItemJournalLine: Record "Item Journal Line"; var FirstItemJournalLine: Record "Item Journal Line"; var LastItemJnlLine: Record "Item Journal Line")
    begin


        //B2B - Con
        //"Document No." := NoSeriesMgt.TryGetNextNo(ItemJnlBatch."No. Series","Posting Date");
        "Document No." := NoSeriesMgt.GetNextNo(ItemJnlBatch."No. Series", "Posting Date", false);
        //B2B - Con


        if (ItemJnlTemplate.Type in
            [ItemJnlTemplate.Type::Consumption, ItemJnlTemplate.Type::Output]) and
           not MfgSetup."Doc. No. Is Prod. Order No."
        then
            if ItemJnlBatch."No. Series" <> '' then begin
                Clear(NoSeriesMgt);
                "Document No." := NoSeriesMgt.GetNextNo(ItemJnlBatch."No. Series", "Posting Date", false);


            end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Invoice Line", 'OnAfterInitFromSalesLine', '', false, false)]
    local procedure OnAfterInitFromSalesLine(var SalesInvLine: Record "Sales Invoice Line"; SalesInvHeader: Record "Sales Invoice Header"; SalesLine: Record "Sales Line")
    begin
        "Schedule Type" := SalesLine."Schedule Type";//EFFUPG
        "Order No." := SalesLine."Document No.";//EFFUPG
        "Order Line No." := SalesLine."Line No.";   // pranavi added on 23-mar-2016
        "External Document No." := SalesInvHeader."External Document No.";//EFFUPG
        "Supply Portion" := SalesLine."Supply Portion";//EFFUPG
        "Retention Portion" := SalesLine."Retention Portion";//EFFUPG
        "Schedule No" := SalesLine."Schedule No";//EFFUPG
    end;







    var
        Schedule: Record Schedule2;
        "--Qc--": Integer;
        QualityCtrlSetup: Record "Quality Control Setup";
        QCSetupRead: Boolean;
        text112: label 'ENU=You can''t create more porduction order''s than Qty';
        //Schedule@1000000001 : Record Schedule2;
        SO: Record "Sales Invoice-Dummy";
        SkipOrderVerification: Boolean;
        Vndr: Record Vendor;
        PurchHeader: Record "Purchase Header";

}