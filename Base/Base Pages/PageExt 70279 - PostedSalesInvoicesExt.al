pageextension 70279 PostedSalesInvoicesExt extends 143
{
    layout
    {
        addfirst(Control1)
        {
            field("xRec.COUNT"; xRec.COUNT)
            {

            }
        }
        addafter("Sell-to Customer Name")
        {
            field("Sell-to City"; "Sell-to City")
            {

            }
            field(Product; Product)
            {

            }
            field(Territory; Territory)
            {

            }
            field("Salesperson Code"; "Salesperson Code")
            {

            }
            field("Customer Posting Group"; "Customer Posting Group")
            {

            }
            field("Total Excise Amount"; "Total Excise Amount")
            {

            }
            field("Extended Date"; "Extended Date")
            {

            }
            field("C-form Status"; "C-form Status")
            {

            }
            field("Form Code"; "Form Code")
            {

            }
            field("External Document No."; "External Document No.")
            {

            }
            field("User ID"; "User ID")
            {

            }
            field(WayBillNo; WayBillNo)
            {

            }
            field("Sale Order Total Amount"; "Sale Order Total Amount")
            {

            }
            field("Total Invoiced Amount"; "Total Invoiced Amount")
            {

            }
            field("Ship-to Address"; "Ship-to Address")
            {

            }
            field("Order No."; "Order No.")
            {

            }
            field("Customer OrderNo."; "Customer OrderNo.")
            {

            }
            field("Customer Order Date"; "Customer Order Date")
            {

            }
            field("Order Date"; "Order Date")
            {

            }
        }
        addafter("Shipment Date")
        {
            field("Date Sent"; "Date Sent")
            {

            }
            field("Consignee Name"; "Consignee Name")
            {

            }
            field("Send for Assurance"; "BizTalk Document Sent")
            {
                Caption = 'Send for Assurance';
            }
            field("Security Deposit Amount"; "Security Deposit Amount")
            {

            }
            field("SD Status"; "SD Status")
            {

            }
            field(SecDepStatus; SecDepStatus)
            {

            }
            field("Final Railway Bill Date"; "Final Railway Bill Date")
            {

            }
            field("Warranty Period"; "Warranty Period")
            {

            }
            field("EMD Amount"; "EMD Amount")
            {

            }
            field("Tender No."; "Tender No.")
            {

            }
            field(Order_After_CF_Integration; Order_After_CF_Integration)
            {

            }
        }
        addafter("Document Exchange Status")
        {
            field("Customer GST Reg. No."; "Customer GST Reg. No.")
            {

            }
            field("Blanket Order No"; "Blanket Order No")
            {

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