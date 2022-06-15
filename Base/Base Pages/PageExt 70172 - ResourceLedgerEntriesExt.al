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
                ApplicationArea = All;
            }
            field(Place; Place)
            {
                ApplicationArea = All;
            }
            field(Division; Division)
            {
                ApplicationArea = All;
            }
            field(Station; Station)
            {
                ApplicationArea = All;
            }
            field("Product type"; "Product type")
            {
                ApplicationArea = All;
            }
            field("Sale order no"; "Sale order no")
            {
                ApplicationArea = All;
            }
            field(Status; Status)
            {
                ApplicationArea = All;
            }
            field("Serial no"; "Serial no")
            {
                ApplicationArea = All;
            }
            field("Work Description"; "Work Description")
            {
                ApplicationArea = All;
            }
            field(State; State)
            {
                ApplicationArea = All;
            }
            field(District; District)
            {
                ApplicationArea = All;
            }
            field("Planned Hr's"; "Planned Hr's")
            {
                ApplicationArea = All;
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

