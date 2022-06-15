pageextension 70279 PostedSalesInvoicesExt extends 143
{
    layout
    {
        addfirst(Control1)
        {
            field("xRec.COUNT"; xRec.COUNT)
            {
                ApplicationArea = All;

            }
        }
        addafter("Sell-to Customer Name")
        {
            field("Sell-to City"; "Sell-to City")
            {
                ApplicationArea = All;

            }
            field(Product; Product)
            {
                ApplicationArea = All;

            }
            field(Territory; Territory)
            {
                ApplicationArea = All;

            }
            field("Salesperson Code"; "Salesperson Code")
            {
                ApplicationArea = All;

            }
            field("Customer Posting Group"; "Customer Posting Group")
            {
                ApplicationArea = All;

            }
            field("Total Excise Amount"; "Total Excise Amount")
            {
                ApplicationArea = All;

            }
            field("Extended Date"; "Extended Date")
            {
                ApplicationArea = All;

            }
            field("C-form Status"; "C-form Status")
            {
                ApplicationArea = All;

            }
            field("Form Code"; "Form Code")
            {
                ApplicationArea = All;

            }
            field("External Document No."; "External Document No.")
            {
                ApplicationArea = All;

            }
            field("User ID"; "User ID")
            {
                ApplicationArea = All;

            }
            field(WayBillNo; WayBillNo)
            {
                ApplicationArea = All;

            }
            field("Sale Order Total Amount"; "Sale Order Total Amount")
            {
                ApplicationArea = All;

            }
            field("Total Invoiced Amount"; "Total Invoiced Amount")
            {
                ApplicationArea = All;

            }
            field("Ship-to Address"; "Ship-to Address")
            {
                ApplicationArea = All;

            }
            field("Order No."; "Order No.")
            {
                ApplicationArea = All;

            }
            field("Customer OrderNo."; "Customer OrderNo.")
            {
                ApplicationArea = All;

            }
            field("Customer Order Date"; "Customer Order Date")
            {
                ApplicationArea = All;

            }
            field("Order Date"; "Order Date")
            {
                ApplicationArea = All;

            }
        }
        addafter("Shipment Date")
        {
            field("Date Sent"; "Date Sent")
            {
                ApplicationArea = All;

            }
            field("Consignee Name"; "Consignee Name")
            {
                ApplicationArea = All;

            }
            field("Send for Assurance"; "BizTalk Document Sent")
            {
                Caption = 'Send for Assurance';
                ApplicationArea = All;
            }
            field("Security Deposit Amount"; "Security Deposit Amount")
            {
                ApplicationArea = All;

            }
            field("SD Status"; "SD Status")
            {
                ApplicationArea = All;

            }
            field(SecDepStatus; SecDepStatus)
            {
                ApplicationArea = All;

            }
            field("Final Railway Bill Date"; "Final Railway Bill Date")
            {
                ApplicationArea = All;

            }
            field("Warranty Period"; "Warranty Period")
            {
                ApplicationArea = All;

            }
            field("EMD Amount"; "EMD Amount")
            {
                ApplicationArea = All;

            }
            field("Tender No."; "Tender No.")
            {
                ApplicationArea = All;

            }
            field(Order_After_CF_Integration; Order_After_CF_Integration)
            {
                ApplicationArea = All;

            }
        }
        addafter("Document Exchange Status")
        {
            field("Customer GST Reg. No."; "Customer GST Reg. No.")
            {
                ApplicationArea = All;

            }
            field("Blanket Order No"; "Blanket Order No")
            {
                ApplicationArea = All;

            }
        }
    }

    actions
    {
        modify(Print)
        {
            trigger OnAfterAction()
            begin
                /* REPORT.RUNMODAL(REPORT::"Sales - Invoice_GST_Test", TRUE, TRUE, SalesInvHeader);


                IF USERID = 'EFFTRONICS\PRANAVI' THEN
                    REPORT.RUNMODAL(REPORT::"Sales - Invoice_GST_Test", TRUE, TRUE, SalesInvHeader)
                ELSE */
            end;
        }
    }

    var
        myInt: Integer;
}