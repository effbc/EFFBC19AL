pageextension 70256 VendorItemCatlogExt extends "Vendor Item Catalog"
{
    layout
    {
        /* modify(Control1)
        {
            ShowCaption = false;
        } */
        addafter("Item No.")
        {
            field(Description; Description)
            {
                ApplicationArea = All;
            }
            field(Approved; Approved)
            {
                ApplicationArea = All;
            }
        }
        addafter("Vendor Item No.")
        {
            field("Sampling Plan Code"; "Sampling Plan Code")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {

    }

}

