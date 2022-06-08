codeunit 80811 "Transfer Service Data to Main"
{
    // version B2Bupg


    trigger OnRun();
    begin
        Window.OPEN('Table Name #1#############');
        UpdateServHeader;
        UpdateServItemLine;
        UpdateServLine;
        Window.CLOSE;
    end;

    var
        TempServiceHead: Record "Temp Service Header";
        TempServiceItemLine: Record "Temp Service Item Line";
        TempServiceLine: Record "Temp Service Line";
        ServiceHead: Record "Service Header";
        ServiceItemLine: Record "Service Item Line";
        ServiceLine: Record "Service Line";
        Window: Dialog;

    (41399)]
    procedure UpdateServHeader();
    begin
        Window.UPDATE(1, 'Service Header');
        TempServiceHead.RESET;
        IF TempServiceHead.FINDSET THEN
            REPEAT
                WITH ServiceHead DO BEGIN
                    "No." := TempServiceHead."No.";
                    Description := TempServiceHead.Description;
                    "Document Type" := TempServiceHead."Document Type";
                    "Service Order Type" := TempServiceHead."Service Order Type";
                    "Link Service to Service Item" := TempServiceHead."Link Service to Service Item";
                    Status := TempServiceHead.Status;
                    Priority := TempServiceHead.Priority;
                    "Customer No." := TempServiceHead."Customer No.";
                    Name := TempServiceHead.Name;
                    "Name 2" := TempServiceHead."Name 2";
                    Address := TempServiceHead.Address;
                    "Address 2" := TempServiceHead."Address 2";
                    City := TempServiceHead.City;
                    "Post Code" := TempServiceHead."Post Code";
                    "Phone No." := TempServiceHead."Phone No.";
                    "E-Mail" := TempServiceHead."E-Mail";
                    "Phone No. 2" := TempServiceHead."Phone No. 2";
                    "Fax No." := TempServiceHead."Fax No.";
                    "Your Reference" := TempServiceHead."Your Reference";
                    "Posting Date" := TempServiceHead."Posting Date";
                    "Document Date" := TempServiceHead."Document Date";
                    "Order Date" := TempServiceHead."Order Date";
                    "Order Time" := TempServiceHead."Order Time";
                    "Default Response Time (Hours)" := TempServiceHead."Default Response Time (Hours)";
                    "Actual Response Time (Hours)" := TempServiceHead."Actual Response Time (Hours)";
                    "Service Time (Hours)" := TempServiceHead."Service Time (Hours)";
                    "Response Date" := TempServiceHead."Response Date";
                    "Response Time" := TempServiceHead."Response Time";
                    "Starting Date" := TempServiceHead."Starting Date";
                    "Starting Time" := TempServiceHead."Starting Time";
                    "Finishing Date" := TempServiceHead."Finishing Date";
                    "Finishing Time" := TempServiceHead."Finishing Time";
                    "Shortcut Dimension 1 Code" := TempServiceHead."Shortcut Dimension 1 Code";
                    "Shortcut Dimension 2 Code" := TempServiceHead."Shortcut Dimension 2 Code";
                    "Notify Customer" := TempServiceHead."Notify Customer";
                    "Max. Labor Unit Price" := TempServiceHead."Max. Labor Unit Price";
                    "Warning Status" := TempServiceHead."Warning Status";
                    "Salesperson Code" := TempServiceHead."Salesperson Code";
                    "Contract No." := TempServiceHead."Contract No.";
                    "Contact Name" := TempServiceHead."Contact Name";
                    "Bill-to Customer No." := TempServiceHead."Bill-to Customer No.";
                    "Bill-to Name" := TempServiceHead."Bill-to Name";
                    "Bill-to Address" := TempServiceHead."Bill-to Address";
                    "Bill-to Address 2" := TempServiceHead."Bill-to Address 2";
                    "Bill-to Post Code" := TempServiceHead."Bill-to Post Code";
                    "Bill-to City" := TempServiceHead."Bill-to City";
                    "Bill-to Contact" := TempServiceHead."Bill-to Contact";
                    "Ship-to Code" := TempServiceHead."Ship-to Code";
                    "Ship-to Name" := TempServiceHead."Ship-to Name";
                    "Ship-to Address" := TempServiceHead."Ship-to Address";
                    "Ship-to Address 2" := TempServiceHead."Ship-to Address 2";
                    "Ship-to Post Code" := TempServiceHead."Ship-to Post Code";
                    "Ship-to City" := TempServiceHead."Ship-to City";
                    "Ship-to Fax No." := TempServiceHead."Ship-to Fax No.";
                    "Ship-to E-Mail" := TempServiceHead."Ship-to E-Mail";
                    "Ship-to Contact" := TempServiceHead."Ship-to Contact";
                    "Ship-to Phone" := TempServiceHead."Ship-to Phone";
                    "Ship-to Phone 2" := TempServiceHead."Ship-to Phone 2";
                    "Language Code" := TempServiceHead."Language Code";
                    "No. Series" := TempServiceHead."No. Series";
                    "Gen. Bus. Posting Group" := TempServiceHead."Gen. Bus. Posting Group";
                    "Currency Code" := TempServiceHead."Currency Code";
                    "Currency Factor" := TempServiceHead."Currency Factor";
                    "Service Zone Code" := TempServiceHead."Service Zone Code";
                    "Responsibility Center" := TempServiceHead."Responsibility Center";
                    "Location Code" := TempServiceHead."Location Code";
                    "Customer Price Group" := TempServiceHead."Customer Price Group";
                    "VAT Bus. Posting Group" := TempServiceHead."VAT Bus. Posting Group";
                    "VAT Registration No." := TempServiceHead."VAT Registration No.";
                    "VAT Base Discount %" := TempServiceHead."VAT Base Discount %";
                    "Tax Area Code" := TempServiceHead."Tax Area Code";
                    "Tax Liable" := TempServiceHead."Tax Liable";
                    "Customer Disc. Group" := TempServiceHead."Customer Disc. Group";
                    "Expected Finishing Date" := TempServiceHead."Expected Finishing Date";
                    Reserve := TempServiceHead.Reserve;
                    "Bill-to County" := TempServiceHead."Bill-to County";
                    County := TempServiceHead.County;
                    "Ship-to County" := TempServiceHead."Ship-to County";
                    "Country/Region Code" := TempServiceHead."Country Code";
                    "Bill-to Name 2" := TempServiceHead."Bill-to Name 2";
                    "Bill-to Country/Region Code" := TempServiceHead."Bill-to Country Code";
                    "Ship-to Name 2" := TempServiceHead."Ship-to Name 2";
                    "Ship-to Country/Region Code" := TempServiceHead."Ship-to Country Code";
                    "Contact No." := TempServiceHead."Contact No.";
                    "Bill-to Contact No." := TempServiceHead."Bill-to Contact No.";
                    "Allow Line Disc." := TempServiceHead."Allow Line Disc.";
                    "Doc. No. Occurrence" := TempServiceHead."Doc. No. Occurrence";
                    "Version No." := TempServiceHead."Version No.";
                    Purpose := TempServiceHead.Purpose;
                    "Material Issue no." := TempServiceHead."Material Issue no.";
                    INSERT;
                END;
            UNTIL TempServiceHead.NEXT = 0;
    end;

    (41499)]
    procedure UpdateServItemLine();
    begin
        Window.UPDATE(1, 'Service Item Line');
        TempServiceItemLine.RESET;
        IF TempServiceItemLine.FINDSET THEN
            REPEAT
                WITH ServiceItemLine DO BEGIN
                    INIT;
                    TRANSFERFIELDS(TempServiceItemLine);
                    INSERT;
                END;
            UNTIL TempServiceItemLine.NEXT = 0;
    end;

    (41511)]
    procedure UpdateServLine();
    begin
        Window.UPDATE(1, 'Service Line');
        TempServiceLine.RESET;
        IF TempServiceLine.FINDSET THEN
            REPEAT
                WITH ServiceLine DO BEGIN
                    INIT;
                    "Document No." := TempServiceLine."Document No.";
                    "Line No." := TempServiceLine."Line No.";
                    "Service Item Line No." := TempServiceLine."Service Item Line No.";
                    "Service Item No." := TempServiceLine."Service Item No.";
                    "Service Item Serial No." := TempServiceLine."Service Item Serial No.";
                    //"Service Item Line Description" := TempServiceLine."Service Item Description";
                    "Posting Date" := TempServiceLine."Posting Date";
                    "Order Date" := TempServiceLine."Order Date";
                    Type := TempServiceLine.Type;
                    "No." := TempServiceLine."No.";
                    "Unit of Measure" := TempServiceLine."Unit of Measure";
                    "Qty. per Unit of Measure" := TempServiceLine."Qty. per Unit of Measure";
                    "Variant Code" := TempServiceLine."Variant Code";
                    "Bin Code" := TempServiceLine."Bin Code";
                    "Customer No." := TempServiceLine."Customer No.";
                    "Ship-to Code" := TempServiceLine."Ship-to Code";
                    "Bill-to Customer No." := TempServiceLine."Bill-to Customer No.";
                    Description := TempServiceLine.Description;
                    "Description 2" := TempServiceLine."Description 2";
                    "Unit of Measure Code" := TempServiceLine."Unit of Measure Code";
                    "Shortcut Dimension 1 Code" := TempServiceLine."Shortcut Dimension 1 Code";
                    "Shortcut Dimension 2 Code" := TempServiceLine."Shortcut Dimension 2 Code";
                    "Posting Group" := TempServiceLine."Posting Group";
                    "Currency Code" := TempServiceLine."Currency Code";
                    "Service Price Group Code" := TempServiceLine."Service Price Group Code";
                    "Fault Area Code" := TempServiceLine."Fault Area Code";
                    "Symptom Code" := TempServiceLine."Symptom Code";
                    "Fault Code" := TempServiceLine."Fault Code";
                    "Resolution Code" := TempServiceLine."Resolution Code";
                    "Exclude Warranty" := TempServiceLine."Exclude Warranty";
                    Warranty := TempServiceLine.Warranty;
                    "Job No." := TempServiceLine."Job No.";
                    "Contract No." := TempServiceLine."Contract No.";
                    "Contract Disc. %" := TempServiceLine."Contract Disc. %";
                    "Warranty Disc. %" := TempServiceLine."Warranty Disc. %";
                    "Line Discount %" := TempServiceLine."Line Discount %";
                    "Line Discount Amount" := TempServiceLine."Line Discount Amount";
                    "VAT Calculation Type" := TempServiceLine."VAT Calculation Type";
                    "VAT Bus. Posting Group" := TempServiceLine."VAT Bus. Posting Group";
                    "VAT Prod. Posting Group" := TempServiceLine."VAT Prod. Posting Group";
                    "VAT Base Amount" := TempServiceLine."VAT Base Amount";
                    "VAT %" := TempServiceLine."VAT %";
                    "Amount Including VAT" := TempServiceLine."Amount Including VAT";
                    "Tax Area Code" := TempServiceLine."Tax Area Code";
                    "Tax Liable" := TempServiceLine."Tax Liable";
                    "Tax Group Code" := TempServiceLine."Tax Group Code";
                    "Serv. Price Adjmt. Gr. Code" := TempServiceLine."Serv. Price Adjmt. Gr. Code";
                    "Customer Price Group" := TempServiceLine."Customer Price Group";
                    Quantity := TempServiceLine.Quantity;
                    "Qty. to Invoice" := TempServiceLine."Qty. to Invoice";
                    "Unit Price" := TempServiceLine."Unit Price";
                    "Unit Cost" := TempServiceLine."Unit Cost";
                    "Unit Cost (LCY)" := TempServiceLine."Unit Cost (LCY)";
                    Amount := TempServiceLine.Amount;
                    "Component Line No." := TempServiceLine."Component Line No.";
                    "Spare Part Action" := TempServiceLine."Spare Part Action";
                    "Fault Reason Code" := TempServiceLine."Fault Reason Code";
                    "Replaced Item No." := TempServiceLine."Replaced Item No.";
                    "Exclude Contract Discount" := TempServiceLine."Exclude Contract Discount";
                    "Document Type" := TempServiceLine."Document Type";
                    "Work Type Code" := TempServiceLine."Work Type Code";
                    "Gen. Bus. Posting Group" := TempServiceLine."Gen. Bus. Posting Group";
                    "Gen. Prod. Posting Group" := TempServiceLine."Gen. Prod. Posting Group";
                    "Responsibility Center" := TempServiceLine."Responsibility Center";
                    "Location Code" := TempServiceLine."Location Code";
                    "Attached to Line No." := TempServiceLine."Attached to Line No.";
                    "Item Category Code" := TempServiceLine."Item Category Code";
                    Nonstock := TempServiceLine.Nonstock;
                    "Product Group Code" := TempServiceLine."Product Group Code";
                    "Quantity (Base)" := TempServiceLine."Quantity (Base)";
                    "Qty. to Invoice (Base)" := TempServiceLine."Qty. to Invoice (Base)";
                    "Outstanding Qty. (Base)" := TempServiceLine."Outstanding Qty. (Base)";
                    //"Reserved Qty. (Base)" := TempServiceLine."Reserved Qty. (Base)";
                    //"Reserved Quantity" :=  TempServiceLine."Reserved Quantity";
                    Reserve := TempServiceLine.Reserve;
                    "Appl.-to Item Entry" := TempServiceLine."Apply to Service Entry";
                    "Substitution Available" := TempServiceLine."Substitution Available";
                    "Price Adjmt. Status" := TempServiceLine."Price Adjmt. Status";
                    "Line Discount Type" := TempServiceLine."Line Discount Type";
                    "Allow Line Disc." := TempServiceLine."Allow Line Disc.";
                    "Customer Disc. Group" := TempServiceLine."Customer Disc. Group";
                    "Resolution Description" := TempServiceLine."Resolution Description";
                    "Fault Code Description" := TempServiceLine."Fault Code Description";
                    "Fault Area Description" := TempServiceLine."Fault Area Description";
                    "Symptom Description" := TempServiceLine."Symptom Description";
                    "To Location" := TempServiceLine."To Location";
                    "From Location" := TempServiceLine."From Location";
                    Account := TempServiceLine.Account;
                    "WK.ST.Date" := TempServiceLine."WK.ST.Date";
                    "WK.FH.Date" := TempServiceLine."WK.FH.Date";
                    Levels := TempServiceLine.Levels;
                    Status := TempServiceLine.Status;
                    "Sub Service Item No." := TempServiceLine."Sub Service Item No.";
                    "Service item Lot No" := TempServiceLine."Service item Lot No";
                    Zone := TempServiceLine.Zone;
                    Division := TempServiceLine.Division;
                    Station := TempServiceLine.Station;
                    "Sent date time" := TempServiceLine."Sent date time";
                    Unitcost := TempServiceLine.Unitcost;
                    "Sub Service item serial No." := TempServiceLine."Sub Service item serial No.";
                    INSERT;
                END;
            UNTIL TempServiceLine.NEXT = 0;
    end;
}

