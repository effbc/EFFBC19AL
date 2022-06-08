pageextension 70249 UserSetupExt extends "User Setup"
{
    Editable = false;
    layout
    {
        /* modify(Control1)
        {
            ShowCaption = false;
        } */

        addafter("User ID")
        {
            field("Transfer- From Code"; "Transfer- From Code")
            {
            }
            field("Transfer- To Code"; "Transfer- To Code")
            {
            }
            field("Production Order"; "Production Order")
            {
            }
        }
    }
}

