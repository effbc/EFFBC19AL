pageextension 70183 SalesInvoiceExt extends 43
{
    layout
    {
        modify("Sell-to Post Code")
        {
            Caption = 'Sell-to Post Code/City';
        }
        addafter(Status)
        {
            field("Insurance Applicable"; "Insurance Applicable")
            {

            }
        }
        modify("Bill-to Post Code")
        {
            Caption = 'Bill-to Post Code/City';
        }
        addafter("VAT Bus. Posting Group")
        {
            field("Sale Order Total Amount"; "Sale Order Total Amount")
            {

            }
            field("Customer OrderNo."; "Customer OrderNo.")
            {

            }
        }
        modify("Ship-to Post Code")
        {
            Caption = 'Ship-to Post Code/City';
        }
        addafter("Ship-to Contact")
        {
            field("LC No."; "LC No.")
            {

            }
            field("Transit Document"; "Transit Document")
            {

            }
        }
        addafter("Shipment Date")
        {
            field("Applies-to Doc. No."; "Applies-to Doc. No.")
            {

            }
            field("Applies-to ID"; "Applies-to ID")
            {

            }
            field(WayBillNo; WayBillNo)
            {

            }
            field("Sale Order No."; "Sale Order No.")
            {

            }
        }
        addafter("Area")
        {
            field("MSPT Date"; "MSPT Date")
            {

            }
            field("MSPT Code"; "MSPT Code")
            {

            }
            field("Posting No."; "Posting No.")
            {

            }
            field("Shipping No."; "Shipping No.")
            {

            }
            field("Posting No. Series"; "Posting No. Series")
            {

            }
            field("Shipping No. Series"; "Shipping No. Series")
            {

            }
        }
    }
    actions
    {
        addafter("Co&mments")
        {
            action("&MSPT Order Detials")
            {
                Caption = '&MSPT Order Detials';
                RunObject = Page "MSPT Order Details";
                RunPageLink = Type = CONST(Sale), "Document Type" = FIELD("Document Type"), "Document No." = FIELD("No."), "MSPT Header Code" = FIELD("MSPT Code"), "Party No." = FIELD("Sell-to Customer No.");
            }

        }
    }
}

