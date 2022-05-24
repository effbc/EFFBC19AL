tableextension 70067 InteractionLogEntryExt extends "Interaction Log Entry"
{

    fields
    {

        field(50000; "OutWard No."; Code[30])
        {
            Editable = false;
        }
        field(50001; "InWard No."; Code[30])
        {
            Editable = false;
        }
        field(50002; "OutWard Ref No."; Code[30])
        {
            Editable = false;
        }
        field(50003; "InWard Ref No."; Code[30])
        {
            Editable = false;
        }
    }
    keys
    {

        key(Key19; Date, "Contact No.", "Interaction Group Code", "Salesperson Code")
        {
        }
    }



}

