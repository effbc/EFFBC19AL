pageextension 70112 PostedPurchInvoiceSubformExt extends "Posted Purch. Invoice Subform"
{
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
        addafter("Variant Code")
        {
            field("Purchase_Order No."; "Purchase_Order No.")
            {
                Editable = FieldseditRights;
            }
            field("Excise Amount"; "Excise Amount")
            {
            }
            field("Assessable Value"; "Assessable Value")
            {
            }
            field("Prod. Order No."; "Prod. Order No.")
            {
            }
            field("Form Code"; "Form Code")
            {
            }
            field("Amount To Vendor"; "Amount To Vendor")
            {
            }
            field("Tax %"; "Tax %")
            {
            }
            field("Form No."; "Form No.")
            {
            }
            field("eCess Amount"; "eCess Amount")
            {
            }
        }
        addafter(Description)
        {
            field("Location Code"; "Location Code")
            {
                Editable = FieldseditRights;
            }
            field("BED Amount"; "BED Amount")
            {
                Editable = true;
            }
            field("Excise Bus. Posting Group"; "Excise Bus. Posting Group")
            {
            }
            field("VAT Prod. Posting Group"; "VAT Prod. Posting Group")
            {
            }
            field("Excise Prod. Posting Group"; "Excise Prod. Posting Group")
            {
            }
            field("Indent No."; "Indent No.")
            {
            }
            field("Indent Line No."; "Indent Line No.")
            {
            }
        }
        addafter("Unit of Measure Code")
        {
            field("Posting Date"; "Posting Date")
            {
            }
        }
        addafter("Allow Invoice Disc.")
        {
            field("GST %"; "GST %")
            {
            }
        }
        addafter("Shortcut Dimension 2 Code")
        {
            field("Quantity (Base)"; "Quantity (Base)")
            {
            }
            field(Amount; Amount)
            {
                Editable = FieldseditRights;
            }
            field("Amount Including VAT"; "Amount Including VAT")
            {
            }
            field("Amount Including Tax"; "Amount Including Tax")
            {
                Editable = true;
            }
            field("Tax Amount"; "Tax Amount")
            {
            }
            field("VAT Base Amount"; "VAT Base Amount")
            {
                Editable = true;
            }
            field("Unit Cost"; "Unit Cost")
            {
                Editable = FieldseditRights;
            }
            field("Tax Base Amount"; "Tax Base Amount")
            {
                Editable = true;
            }
            field("Input Tax Credit Amount"; "Input Tax Credit Amount")
            {
                Editable = true;
            }
            
            field("Excise Base Amount"; "Excise Base Amount")
            {
            }
            field("Receipt Document No."; "Receipt Document No.")
            {
            }
            field("Receipt Document Line No."; "Receipt Document Line No.")
            {
            }
            field("Receipt No."; "Receipt No.")
            {
                Editable = FieldseditRights;
            }
            field("Country Code"; "Country Code")
            {
            }
            field("GST Assessable Value"; "GST Assessable Value")
            {
            }
            field("Custom Duty Amount"; "Custom Duty Amount")
            {
            }
            field("Charges To Vendor"; "Charges To Vendor")
            {
                Editable = true;
            }
            field("GST Jurisdiction Type"; "GST Jurisdiction Type")
            {
            }
            field("TDS Amount"; "TDS Amount")
            {
                Editable = FieldseditRights;
            }
            field("TDS Group"; "TDS Group")
            {
            }
            field("TDS Category"; "TDS Category")
            {
            }
            field("TDS Nature of Deduction"; "TDS Nature of Deduction")
            {
            }
            field("TDS %"; "TDS %")
            {
            }
            field("Gen. Bus. Posting Group"; "Gen. Bus. Posting Group")
            {
            }
            field("Gen. Prod. Posting Group"; "Gen. Prod. Posting Group")
            {
            }
        }
    }
    actions
    {

    }

    trigger OnOpenPage()
    begin
        IF USERID IN ['EFFTRONICS\SUJANI', 'EFFTRONICS\ANILKUMAR', 'EFFTRONICS\VISHNUPRIYA', 'EFFTRONICS\B2BOTS'] THEN
            FieldseditRights := TRUE
        ELSE
            FieldseditRights := FALSE;
    end;

    var
        FieldseditRights: Boolean;



    procedure StrOrderLineDetailsPage();
    begin
    end;
}

