report 50064 Materialreceipt_wordprint
{
    DefaultLayout = RDLC;
    RDLCLayout = './Materialreceipt_wordprint.rdlc';

    dataset
    {
        dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
        {
            RequestFilterFields = "No.";
            column(PaytoName; "Purch. Inv. Header"."Pay-to Name")
            {
            }
            column(VendorInvoiceNo; "Purch. Inv. Header"."Vendor Invoice No.")
            {
            }
            column(VendorInvoiceDate; "Purch. Inv. Header"."Vendor Invoice Date")
            {
            }
            column(amt; Amt)
            {
            }
            column(item; Item)
            {
            }
            column(rec_postingdate; PurchRcptHeader."Posting Date")
            {
            }
            column(AmtInWord_1; AmtInWord[1])
            {
            }

            trigger OnAfterGetRecord();
            begin
                PurchInvLine.RESET;
                PurchInvLine.SETRANGE("Document No.", "Purch. Inv. Header"."No.");
                PurchInvLine.SETFILTER(Quantity, '>%1', 0);
                IF PurchInvLine.FINDSET THEN
                    PurchInvLine.CALCSUMS("Amount To Vendor");
                Amt := PurchInvLine."Amount To Vendor";
                IF PurchInvLine.FINDFIRST THEN BEGIN
                    Item := PurchInvLine.Description;
                    PurchRcptHeader.GET(PurchInvLine."Receipt Document No.");

                END;

                Check.InitTextVariable;
                Check.FormatNoText(AmtInWord, Amt, "Purch. Inv. Header"."Currency Code");
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
        PurchInvLine: Record "Purch. Inv. Line";
        Item: Text;
        Amt: Decimal;
        PurchRcptHeader: Record "Purch. Rcpt. Header";
        Check: Report Check;
        AmtInWord: array[2] of Text[1024];
}

