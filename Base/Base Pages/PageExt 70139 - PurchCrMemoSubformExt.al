pageextension 70139 PurchCrMemoSubformExt extends "Purch. Cr. Memo Subform"
{
    layout
    {
        /* modify(Control1)
        {
            ShowCaption = false;
        }
        modify(Control47)
        {
            ShowCaption = false;
        }
        modify(Control41)
        {
            ShowCaption = false;
        }
        modify(Control23)
        {
            ShowCaption = false;
        }
        modify(RefreshTotals)
        {
            ShowCaption = false;
        } */
        addafter("Variant Code")
        {
            field("Excise Bus. Posting Group"; "Excise Bus. Posting Group")
            {
            }
            field("VAT Calculation Type"; "VAT Calculation Type")
            {
            }
        }
        addafter("VAT Prod. Posting Group")
        {

            field("Excise Prod. Posting Group"; "Excise Prod. Posting Group")
            {
            }
        }
        addafter("Qty. Assigned")
        {
            field("GST Jurisdiction Type"; "GST Jurisdiction Type")
            {
            }
            field("GST %"; "GST %")
            {
            }
        }
        addafter(ShortcutDimCode8)
        {
            field("Tax %"; "Tax %")
            {
                Editable = true;
            }
            field("Service Tax Group"; "Service Tax Group")
            {
            }
            field("Service Tax Registration No."; "Service Tax Registration No.")
            {
            }
            field("Service Tax Amount"; "Service Tax Amount")
            {
            }
            field("Service Tax SBC Amount"; "Service Tax SBC Amount")
            {
            }
            field("KK Cess Amount"; "KK Cess Amount")
            {
            }
            field("QC Enabled"; "QC Enabled")
            {
            }
            field("Spec ID"; "Spec ID")
            {
            }
            field("Qty. to Invoice"; "Qty. to Invoice")
            {
            }
            field("Qty. to Receive"; "Qty. to Receive")
            {
            }
            field("Qty. Rcd. Not Invoiced"; "Qty. Rcd. Not Invoiced")
            {
            }
            field("Return Qty. to Ship"; "Return Qty. to Ship")
            {
            }
        }
    }
    actions
    {


    }
}

