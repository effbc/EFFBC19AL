codeunit 50000 "Tables Codeunit"
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Table, Database::"Cust. Ledger Entry", 'OnAfterCopyCustLedgerEntryFromGenJnlLine', '', false, false)]
    local procedure OnAfterCopyCustLedgerEntryFromGenJnlLine(var CustLedgerEntry: Record "Cust. Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        // Rev01>>
        CustLedgerEntry."DD/FDR No." := GenJnlLine."DD/FDR No.";
        CustLedgerEntry."Payment Through" := GenJnlLine."Payment Through";
        // Rev01<<
        CustLedgerEntry."Customer ord No" := GenJnlLine."Customer Ord no"; //srinivas
        CustLedgerEntry."Sale Order no" := GenJnlLine."Sale Order No";               //srinivas
        CustLedgerEntry."Payment Type" := GenJnlLine."Payment Type";//EFFUPG
        CustLedgerEntry."invoice no" := GenJnlLine."Invoice no";//EFFUPG
    end;

    [EventSubscriber(ObjectType::Table, Database::"Vendor Ledger Entry", 'OnAfterCopyVendLedgerEntryFromGenJnlLine', '', false, false)]
    local procedure OnAfterCopyVendLedgerEntryFromGenJnlLine(var VendorLedgerEntry: Record "Vendor Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        VendorLedgerEntry."Vendor Invoice Date" := GenJnlLine."Vendor Invoice Date";//EFFUPG
                                                                                    // Rev01>>
        VendorLedgerEntry."DD/FDR No." := GenJnlLine."DD/FDR No.";
        VendorLedgerEntry."Payment Through" := GenJnlLine."Payment Through";

        // Rev01<<

    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterAssignItemValues', '', false, false)]
    local procedure OnAfterAssignItemValues(var SalesLine: Record "Sales Line"; Item: Record Item)
    begin
        //B2B
        "Production BOM No." := Item."Production BOM No.";
        ProductionBOMHeader.SetRange("No.", "Production BOM No.");
        if ProductionBOMHeader.Find('-') then
            "Production Bom Version No." := VersionMgt.GetBOMVersion(ProductionBOMHeader."No.", WorkDate, true);
        "Spec ID" := Item."Spec ID";
        "QC Enabled" := Item."QC Enabled";
        //B2B
        //Added by Pranavi on 05-Dec-2015 for updating schedule item no if item is changed in sales line
        Schedule.Reset;
        Schedule.SetRange("Document Type", Schedule."Document Type"::Order);
        Schedule.SetRange("Document No.", "Document No.");
        Schedule.SetRange("Document Line No.", "Line No.");
        Schedule.SetRange(Schedule."Line No.", "Line No.");
        Schedule.SetRange(Schedule."No.", xRec."No.");
        if Schedule.FindFirst then begin
            Schedule."No." := "No.";
            Schedule.Validate("No.");
        end;
        //End by Pranavi on 05-Dec-2015
    end;





}