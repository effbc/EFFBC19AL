report 90101 "UPdate Masters"
{
    DefaultLayout = RDLC;
    RDLCLayout = './UPdate Masters.rdlc';

    dataset
    {
        dataitem(Item; Item)
        {

            trigger OnAfterGetRecord();
            begin
                Item.VALIDATE("VAT Prod. Posting Group", VatProdPostGroup.Code);
                MODIFY(TRUE);
            end;

            trigger OnPreDataItem();
            begin
                IF VatProdPostGroup.FINDFIRST THEN;
            end;
        }
        dataitem(Customer; Customer)
        {

            trigger OnAfterGetRecord();
            begin
                Customer.VALIDATE("VAT Bus. Posting Group", VatBusPostGroup.Code);
                MODIFY(TRUE);
            end;

            trigger OnPreDataItem();
            begin
                IF VatBusPostGroup.FINDFIRST THEN;
            end;
        }
        dataitem(Vendor; Vendor)
        {

            trigger OnAfterGetRecord();
            begin
                Customer.VALIDATE("VAT Bus. Posting Group", VatBusPostGroup.Code);
                MODIFY(TRUE);
            end;

            trigger OnPreDataItem();
            begin
                IF VatBusPostGroup.FINDFIRST THEN;
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
        VatProdPostGroup: Record "VAT Product Posting Group";
        VatBusPostGroup: Record "VAT Business Posting Group";
}

