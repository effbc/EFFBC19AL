pageextension 70172 ResourceLedgerEntriesExt extends 202
{
    layout
    {
        /* modify(Control1)
        {
            ShowCaption = false;
        } */

        addafter("Document No.")
        {
            field(Zones; Zones)
            {
            }
            field(Place; Place)
            {
            }
            field(Division; Division)
            {
            }
            field(Station; Station)
            {
            }
            field("Product type"; "Product type")
            {
            }
            field("Sale order no"; "Sale order no")
            {
            }
            field(Status; Status)
            {
            }
            field("Serial no"; "Serial no")
            {
            }
            field("Work Description"; "Work Description")
            {
            }
            field(State; State)
            {
            }
            field(District; District)
            {
            }
            field("Planned Hr's"; "Planned Hr's")
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

