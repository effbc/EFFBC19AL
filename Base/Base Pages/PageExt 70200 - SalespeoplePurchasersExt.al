pageextension 70200 SalespeoplePurchasersExt extends "Salespersons/Purchasers"
{
    Editable = false;
    layout
    {
        addafter("Privacy Blocked")
        {
            field("Salesperson/Purchaser"; "Salesperson/Purchaser")
            {
                ApplicationArea = All;
            }
            field("Global Dimension 1 Code"; "Global Dimension 1 Code")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        modify(Statistics)
        {
            Promoted = true;
        }
        modify(CreateInteraction)
        {
            Promoted = true;
        }
    }
}

