report 50033 pur_post_WORD
{
    DefaultLayout = RDLC;
    RDLCLayout = './pur_post_WORD.rdlc';

    dataset
    {
        dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
        {
            MaxIteration = 1;
            RequestFilterFields = "No.";
            column(VendorInvoiceNo; "Purch. Inv. Header"."Vendor Invoice No.")
            {
            }
            column(VendorInvoicDate; "Purch. Inv. Header"."Vendor Invoice Date")
            {
            }
            column(BuyfromVendorName; "Purch. Inv. Header"."Buy-from Vendor Name")
            {
            }
            column(unitname; Vendor.Name)
            {
            }
            column(Accountnumber; Vendor."Our Account No.")
            {
            }
            column(bankname; Vendor."Name of Bank")
            {
            }
            column(branchname; Vendor."Branch Name")
            {
            }
            column(ifsc_code; Vendor."RTGS Code")
            {
            }
            column(Amt; Amt)
            {
            }

            trigger OnAfterGetRecord();
            begin
                Vendor.GET("Purch. Inv. Header"."Buy-from Vendor No.");
                PurchInvLine.RESET;
                PurchInvLine.SETRANGE("Document No.", "Purch. Inv. Header"."No.");
                IF PurchInvLine.FINDSET THEN BEGIN
                    PurchInvLine.CALCSUMS("Amount To Vendor");
                    Amt := PurchInvLine."Amount To Vendor";
                END;
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

    var
        Vendor: Record Vendor;
        Amt: Decimal;
        PurchInvLine: Record "Purch. Inv. Line";
}

