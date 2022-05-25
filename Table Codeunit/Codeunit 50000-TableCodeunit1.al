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




}