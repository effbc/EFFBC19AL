page 60253 "Sales Tracking Card"
{
    PageType = Card;
    SourceTable = "Sales Header Archive";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; "No.")
                {
                    Editable = false;
                }
                field("Sell-to Customer Name"; "Sell-to Customer Name")
                {
                }
                field("Customer OrderNo."; "Customer OrderNo.")
                {
                }
                field("BG No."; "BG No.")
                {
                }
                field("Salesperson Code"; "Salesperson Code")
                {
                }
                field("Warranty Period"; "Warranty Period")
                {
                }
                field("Order Status"; "Order Status")
                {
                }
                field("Warranty Completed"; "Warranty Completed")
                {
                }
                field("Converted to AMC"; "Converted to AMC")
                {

                    trigger OnValidate();
                    begin
                        IF "Converted to AMC" = TRUE THEN
                            TESTFIELD("Converted AMC Order");
                    end;
                }
                field("Bill Attached"; "Bill Attached")
                {
                    Editable = false;
                }
                field("Scope To AMC"; "Scope To AMC")
                {
                }
                field("Converted AMC Order"; "Converted AMC Order")
                {
                }
                field("Sale Order Total Amount"; "Sale Order Total Amount")
                {
                }
                field("SD status"; "SD status")
                {

                    trigger OnValidate();
                    begin
                        IF "SD status" = "SD status"::Received THEN BEGIN
                            TESTFIELD("Order Status", "Order Status"::"Expired & amounts tobe recovered");
                            TESTFIELD("Security Deposit Amount");
                            IF ("BG Status" = "BG Status"::Received) AND ("BG Status" = "BG Status"::Received) THEN
                                "Order Status" := "Order Status"::"Amounts recovered";
                        END;
                    end;
                }
                field("BG Amount"; "BG Amount")
                {
                }
                field("BG Status"; "BG Status")
                {

                    trigger OnValidate();
                    begin
                        IF "BG Status" = "BG Status"::Received THEN BEGIN
                            TESTFIELD("Order Status", "Order Status"::"Expired & amounts tobe recovered");
                            TESTFIELD("BG Amount");
                            IF ("EMD Status" = "EMD Status"::Received) AND ("SD status" = "SD status"::Received) THEN
                                "Order Status" := "Order Status"::"Amounts recovered";
                        END;
                    end;
                }
                field("Security Deposit Amount"; "Security Deposit Amount")
                {
                }
                field("EMD Amount"; "EMD Amount")
                {
                }
                field("EMD Status"; "EMD Status")
                {

                    trigger OnValidate();
                    begin
                        IF "EMD Status" = "EMD Status"::Received THEN BEGIN
                            TESTFIELD("Order Status", "Order Status"::"Expired & amounts tobe recovered");
                            TESTFIELD("EMD Amount");
                            IF ("BG Status" = "BG Status"::Received) AND ("SD status" = "SD status"::Received) THEN
                                "Order Status" := "Order Status"::"Amounts recovered";
                        END;
                    end;
                }
                field("BG Date of Issue"; "BG Date of Issue")
                {
                }
                field("BG Expiry Date"; "BG Expiry Date")
                {
                }
                field("Reference Sale Order"; "Reference Sale Order")
                {
                }
                field("Date Archived"; "Date Archived")
                {
                    CaptionML = ENU = 'Last Posted',
                                ENN = 'Date Archived';
                }
                field("Warranty Exp Date"; "Warranty Exp Date")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Attachment)
            {

                trigger OnAction();
                begin
                    CustAttachments;
                end;
            }
        }
    }

    var
        SIH: Record "Sales Invoice Header";
        BG: Record "Bank Guarantee";
        Attachment: Record Attachments;

    [LineStart(20597)]
    procedure CustAttachments();
    var
        CustAttach: Record Attachments;
    begin
        CustAttach.RESET;
        CustAttach.SETRANGE("Table ID", DATABASE::"Sales Header Archive");
        CustAttach.SETRANGE("Document No.", "No.");
        CustAttach.SETRANGE("Document Type", "Document Type");
        PAGE.RUN(PAGE::"ESPL Attachments", CustAttach);
        Attachment.RESET;
        Attachment.SETRANGE("Table ID", DATABASE::"Sales Header Archive");
        Attachment.SETRANGE("Document No.", "No.");
        Attachment.SETRANGE(Attachment."Attachment Status", TRUE);
        IF Attachment.FINDFIRST THEN BEGIN
            "Bill Attached" := TRUE;
            MODIFY;
        END
        ELSE BEGIN
            "Bill Attached" := FALSE;
            MODIFY;
        END;
    end;
}

