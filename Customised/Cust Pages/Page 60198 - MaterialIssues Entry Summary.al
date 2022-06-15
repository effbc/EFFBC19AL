page 60198 "MaterialIssues Entry Summary"
{
    // version MI1.0

    Editable = false;
    PageType = List;
    SourceTable = "Mat.Issue Entry Summary";

    layout
    {
        area(content)
        {
            field("COUNT"; COUNT)
            {
            }
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Serial No."; "Serial No.")
                {
                }
                field("Lot No."; "Lot No.")
                {
                }
                field("Total Quantity"; "Total Quantity")
                {
                }
                field("Total Reserved Quantity"; "Total Reserved Quantity")
                {
                }
                field("Total Available Quantity"; "Total Available Quantity")
                {
                }
                field("Posting Date"; "Posting Date")
                {
                }
                field(USERID; USERID)
                {
                }
                field(SalorderNo; SalorderNo)
                {
                    Caption = 'Sales order No';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        CLEAR(SalorderNo);
        ItemLedgerEntry.RESET;
        ItemLedgerEntry.SETRANGE("Item No.", "Item No.");
        ItemLedgerEntry.SETRANGE("Document Type", ItemLedgerEntry."Document Type"::"Purchase Receipt");
        ItemLedgerEntry.SETRANGE("Lot No.", "Lot No.");
        ItemLedgerEntry.SETRANGE("Serial No.", "Serial No.");
        IF ItemLedgerEntry.FINDFIRST THEN BEGIN
            IF PurchRcptHeader.GET(ItemLedgerEntry."Document No.") THEN
                IF PurchaseHeader.GET(PurchaseHeader."Document Type"::Order, PurchRcptHeader."Order No.") THEN
                    SalorderNo := PurchaseHeader."Sale Order No";
        END;
    end;

    trigger OnClosePage();
    begin
        MIEntrySummary.RESET;
        IF MIEntrySummary.FINDFIRST THEN
            MIEntrySummary.DELETEALL;
    end;

    trigger OnOpenPage();
    begin
        //  SETFILTER("Total Available Quantity",'>%1',0);
        SETCURRENTKEY("Lot No.", "Serial No.");
    end;

    var
        MIEntrySummary: Record "Mat.Issue Entry Summary";
        ItemLedgerEntry: Record "Item Ledger Entry";
        SalorderNo: Code[30];
        SalesShipmentHeader: Record "Sales Shipment Header";
        PurchRcptHeader: Record "Purch. Rcpt. Header";
        PurchaseHeader: Record "Purchase Header";
}

