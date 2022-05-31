table 50000 "Purch. Line Vat"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Enquiry';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",Enquiry;
            DataClassification = CustomerContent;
        }
        field(3; "Document No."; Code[20])
        {
            Caption = 'Purchase Order No.';
            TableRelation = "Purchase Header"."No." WHERE("Document Type" = FIELD("Document Type"));
            DataClassification = CustomerContent;
        }
        field(4; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(16350; "VAT Business Posting Group"; Code[10])
        {
            Editable = true;
            DataClassification = CustomerContent;
        }
        field(16351; "VAT Product Posting Group"; Code[10])
        {
            Editable = true;
            DataClassification = CustomerContent;
        }
        field(16352; "VAT %age"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(16353; "VAT Base"; Decimal)
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(16354; "VAT Amount"; Decimal)
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Line No.")
        {
        }
    }

    fieldgroups
    {
    }
}

