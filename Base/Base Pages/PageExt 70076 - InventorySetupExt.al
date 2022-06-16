pageextension 70076 InventorySetupExt extends "Inventory Setup"
{


    layout
    {


        addafter("Prevent Negative Inventory")
        {
            field("Packing Charge Group"; Rec."Packing Charge Group")
            {
            }
        }
        addafter("Item Group Dimension Code")
        {
            field("RGP Out No."; Rec."RGP Out No.")
            {
            }
            field("RGP In No."; Rec."RGP In No.")
            {
            }
            field("DC Nos."; Rec."DC Nos.")
            {
            }
            field("Material Issues No."; Rec."Material Issues No.")
            {
            }
            field("Posted Issue No."; Rec."Posted Issue No.")
            {
            }
            field("Material Issue Nos."; Rec."Material Issue Nos.")
            {
            }
            field("Posted Material Issue Nos."; Rec."Posted Material Issue Nos.")
            {
            }
        }
    }



}

