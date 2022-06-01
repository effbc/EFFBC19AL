pageextension 70200 SalespeoplePurchasersExt extends "Salespersons/Purchasers"
{
    Editable = false;
    layout
    {
        addafter("Privacy Blocked")
        {
            field("Salesperson/Purchaser"; "Salesperson/Purchaser")
            {
            }
            field("Global Dimension 1 Code"; "Global Dimension 1 Code")
            {
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

