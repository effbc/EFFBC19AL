pageextension 70117 PostedSalesCrMemoSubformExt extends "Posted Sales Cr. Memo Subform"
{
    Editable = true;
    layout
    {
        /* modify(Control1)
        {
            ShowCaption = false;
        } */
        addafter(Type)
        {
            field("Line No."; "Line No.")
            {
            }
        }
        addafter("Invoice Discount Amount")
        {
            field(Amount; Amount)
            {
            }
            field("Amount Including VAT"; "Amount Including VAT")
            {
            }
            field("Excise Amount"; "Excise Amount")
            {
            }
            field("Excise Base Amount"; "Excise Base Amount")
            {
                Editable = false;
            }
            field("Amount To Customer"; "Amount To Customer")
            {
            }
            field("BED Amount"; "BED Amount")
            {
            }
            field("Tax Amount"; "Tax Amount")
            {
            }
            field("Tax Base Amount"; "Tax Base Amount")
            {
            }
            field("Service Tax SBC %"; "Service Tax SBC %")
            {
            }
            field("Service Tax SBC Amount"; "Service Tax SBC Amount")
            {
            }
            field("KK Cess%"; "KK Cess%")
            {
            }
            field("KK Cess Amount"; "KK Cess Amount")
            {
            }
            field("Service Tax eCess Amount"; "Service Tax eCess Amount")
            {
            }
            field("Service Tax SHE Cess Amount"; "Service Tax SHE Cess Amount")
            {
            }
        }
    }
    actions
    {


    }

    trigger OnOpenPage()
    begin
        IF USERID IN ['EFFTRONICS\SUJANI', 'EFFTRONICS\VISHNUPRIYA', 'EFFTRONICS\VIJAYA'] THEN
            CurrPage.EDITABLE;
    end;

}

