pageextension 70270 ItemLedgerEntriesExt extends 38
{

    layout
    {
        modify("Sales Amount (Actual)")
        {
            Visible = false;
        }
        modify("Cost Amount (Actual)")
        {
            Visible = false;
        }
        modify("Cost Amount (Non-Invtbl.)")
        {
            Visible = false;
        }
        addfirst(content)
        {
            field(COUNT; COUNT)
            {

            }
        }
        addafter("Document No.")
        {
            field("ITL Doc No."; "ITL Doc No.")
            {
                Importance = Standard;
            }
            field("ITL Doc Line No."; "ITL Doc Line No.")
            {

            }
            field(Positive; Positive)
            {

            }
        }
        addafter("Job Task No.")
        {
            field("User ID"; "User ID")
            {
                Editable = TRUE;
            }
            field("DC Check"; "DC Check")
            {

            }
            field("Source Type"; "Source Type")
            {

            }
            field("MBB Packed Date"; "MBB Packed Date")
            {

            }
            field("MFD Date"; "MFD Date")
            {

            }
            field("Recharge Cycles"; "Recharge Cycles")
            {

            }
            field("Last Invoice Date"; "Last Invoice Date")
            {

            }
            field("Floor Life"; "Floor Life")
            {

            }
            field("MBB Packet Open DateTime"; "MBB Packet Open DateTime")
            {

            }
            field("MBB Packet Close DateTime"; "MBB Packet Close DateTime")
            {

            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    trigger OnOpenPage()
    begin
        IF USERID IN ['EFFTRONICS\ANILKUMAR', 'EFFTRONICS\GRAVI', 'EFFTRONICS\VISHNUPRIYA', 'EFFTRONICS\B2BOTS'] THEN
            CurrPage.EDITABLE := TRUE
        ELSE
            CurrPage.EDITABLE := FALSE;
    end;

    var
        myInt: Integer;
}