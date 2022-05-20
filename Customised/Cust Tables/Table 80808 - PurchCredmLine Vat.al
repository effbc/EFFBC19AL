table 80808 "PurchCredmLine Vat"
{
    // version B2Bupg


    fields
    {
        field(3;"Document No.";Code[20])
        {
            Caption = 'Document No.';
            TableRelation = "Sales Invoice Header";
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
        key(Key1;"Document No.","Line No.")
        {
        }
    }

    fieldgroups
    {
    }
}

