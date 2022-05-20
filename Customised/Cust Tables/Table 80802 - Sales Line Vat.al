table 80802 "Sales Line Vat"
{
    // version B2Bupg


    fields
    {
        field(1;"Document Type";Option)
        {
            Caption = 'Document Type';
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Enquiry';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",Enquiry;
        }
        field(3;"Document No.";Code[20])
        {
            Caption = 'Purchase Order No.';
            TableRelation = "Purchase Header"."No." WHERE ("Document Type"=FIELD("Document Type"));
        }
        field(4;"Line No.";Integer)
        {
            Caption = 'Line No.';
        }
        field(5;"Vat %age";Decimal)
        {
        }
        field(6;"Vat Base";Decimal)
        {
        }
        field(7;"Vat Amount";Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No.","Line No.")
        {
        }
    }

    fieldgroups
    {
    }
}

