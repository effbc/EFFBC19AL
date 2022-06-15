pageextension 70006 AppliedCustomerEntriesExt extends "Applied Customer Entries"
{
    layout
    {
        /* modify(Control1)
        {
            ShowCaption = false;
        } */
        addafter("Document No.")
        {
            field("External Document No."; "External Document No.")
            {
            }
        }
    }
    actions
    {
        modify("&Navigate")
        {
            Promoted = true;

        }
    }
}

