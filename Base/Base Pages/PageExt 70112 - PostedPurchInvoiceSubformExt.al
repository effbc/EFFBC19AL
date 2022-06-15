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
                ApplicationArea = All;
            }
        }
        addafter("Variant Code")
        {
            field("Purchase_Order No."; "Purchase_Order No.")
            {
                Editable = FieldseditRights;
                ApplicationArea = All;
            }
            field("Excise Amount"; "Excise Amount")
            {
                ApplicationArea = All;
            }
            field("Assessable Value"; "Assessable Value")
            {
                ApplicationArea = All;
            }
            field("Prod. Order No."; "Prod. Order No.")
            {
                ApplicationArea = All;
            }
            field("Form Code"; "Form Code")
            {
                ApplicationArea = All;
            }
            field("Amount To Vendor"; "Amount To Vendor")
            {
                ApplicationArea = All;
            }
            field("Tax %"; "Tax %")
            {
                ApplicationArea = All;
            }
            field("Form No."; "Form No.")
            {
                ApplicationArea = All;
            }
            field("eCess Amount"; "eCess Amount")
            {
                ApplicationArea = All;
            }
        }
        addafter(Description)
        {
            field("Location Code"; "Location Code")
            {
                Editable = FieldseditRights;
                ApplicationArea = All;
            }
            field("BED Amount"; "BED Amount")
            {
                Editable = true;
                ApplicationArea = All;
            }
            field("Excise Bus. Posting Group"; "Excise Bus. Posting Group")
            {
                ApplicationArea = All;
            }
            field("VAT Prod. Posting Group"; "VAT Prod. Posting Group")
            {
                ApplicationArea = All;
            }
            field("Excise Prod. Posting Group"; "Excise Prod. Posting Group")
            {
                ApplicationArea = All;
            }
            field("Indent No."; "Indent No.")
            {
                ApplicationArea = All;
            }
            field("Indent Line No."; "Indent Line No.")
            {
                ApplicationArea = All;
            }
        }
        addafter("Unit of Measure Code")
        {
            field("Posting Date"; "Posting Date")
            {
                ApplicationArea = All;
            }
        }
        addafter("Allow Invoice Disc.")
        {
            field("GST %"; "GST %")
            {
                ApplicationArea = All;
            }
        }
        addafter("Shortcut Dimension 2 Code")
        {
            field("Quantity (Base)"; "Quantity (Base)")
            {
                ApplicationArea = All;
            }
            field(Amount; Amount)
            {
                Editable = FieldseditRights;
                ApplicationArea = All;
            }
            field("Amount Including VAT"; "Amount Including VAT")
            {
                ApplicationArea = All;
            }
            field("Amount Including Tax"; "Amount Including Tax")
            {
                Editable = true;
                ApplicationArea = All;
            }
            field("Tax Amount"; "Tax Amount")
            {
                ApplicationArea = All;
            }
            field("VAT Base Amount"; "VAT Base Amount")
            {
                Editable = true;
                ApplicationArea = All;
            }
            field("Unit Cost"; "Unit Cost")
            {
                Editable = FieldseditRights;
                ApplicationArea = All;
            }
            field("Tax Base Amount"; "Tax Base Amount")
            {
                Editable = true;
                ApplicationArea = All;
            }
            field("Input Tax Credit Amount"; "Input Tax Credit Amount")
            {
                Editable = true;
                ApplicationArea = All;
            }

            field("Excise Base Amount"; "Excise Base Amount")
            {
                ApplicationArea = All;
            }
            field("Receipt Document No."; "Receipt Document No.")
            {
                ApplicationArea = All;
            }
            field("Receipt Document Line No."; "Receipt Document Line No.")
            {
                ApplicationArea = All;
            }
            field("Receipt No."; "Receipt No.")
            {
                Editable = FieldseditRights;
                ApplicationArea = All;
            }
            field("Country Code"; "Country Code")
            {
                ApplicationArea = All;
            }
            field("GST Assessable Value"; "GST Assessable Value")
            {
                ApplicationArea = All;
            }
            field("Custom Duty Amount"; "Custom Duty Amount")
            {
                ApplicationArea = All;
            }
            field("Charges To Vendor"; "Charges To Vendor")
            {
                Editable = true;
                ApplicationArea = All;
            }
            field("GST Jurisdiction Type"; "GST Jurisdiction Type")
            {
                ApplicationArea = All;
            }
            field("TDS Amount"; "TDS Amount")
            {
                Editable = FieldseditRights;
                ApplicationArea = All;
            }
            field("TDS Group"; "TDS Group")
            {
                ApplicationArea = All;
            }
            field("TDS Category"; "TDS Category")
            {
                ApplicationArea = All;
            }
            field("TDS Nature of Deduction"; "TDS Nature of Deduction")
            {
                ApplicationArea = All;
            }
            field("TDS %"; "TDS %")
            {
                ApplicationArea = All;
            }
            field("Gen. Bus. Posting Group"; "Gen. Bus. Posting Group")
            {
                ApplicationArea = All;
            }
            field("Gen. Prod. Posting Group"; "Gen. Prod. Posting Group")
            {
                ApplicationArea = All;
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

