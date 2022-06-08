pageextension 70182 SalesInvoiceSubformExt extends "Sales Invoice Subform"
{
    layout
    {
       /*  modify(Control1)
        {
            ShowCaption = false;
        } */
        addafter("Deferral Code")
        {
            field("Assessee Code"; "Assessee Code")
            {
            }
            field("TCS Type"; "TCS Type")
            {
            }
            field("Total TDS/TCS Incl. SHE CESS"; "Total TDS/TCS Incl. SHE CESS")
            {
            }
            field("TDS/TCS Amount"; "TDS/TCS Amount")
            {
            }
            field("TDS/TCS %"; "TDS/TCS %")
            {
            }
        }
        addafter(ShortcutDimCode8)
        {
            field("Excise Bus. Posting Group"; "Excise Bus. Posting Group")
            {
            }
            field("Excise Prod. Posting Group"; "Excise Prod. Posting Group")
            {
            }
            field("Tax Base Amount"; "Tax Base Amount")
            {
            }
        }
    }
    actions
    {

    }
}

