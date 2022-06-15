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
                ApplicationArea = All;

            }
        }
        addafter("Document No.")
        {
            field("ITL Doc No."; "ITL Doc No.")
            {
                Importance = Standard;
                ApplicationArea = All;
            }
            field("ITL Doc Line No."; "ITL Doc Line No.")
            {
                ApplicationArea = All;

            }
            field(Positive; Positive)
            {
                ApplicationArea = All;

            }
        }
        addafter("Job Task No.")
        {
            field("User ID"; "User ID")
            {
                Editable = TRUE;
                ApplicationArea = All;
            }
            field("DC Check"; "DC Check")
            {
                ApplicationArea = All;

            }
            field("Source Type"; "Source Type")
            {
                ApplicationArea = All;

            }
            field("MBB Packed Date"; "MBB Packed Date")
            {
                ApplicationArea = All;

            }
            field("MFD Date"; "MFD Date")
            {
                ApplicationArea = All;

            }
            field("Recharge Cycles"; "Recharge Cycles")
            {
                ApplicationArea = All;

            }
            field("Last Invoice Date"; "Last Invoice Date")
            {
                ApplicationArea = All;

            }
            field("Floor Life"; "Floor Life")
            {
                ApplicationArea = All;

            }
            field("MBB Packet Open DateTime"; "MBB Packet Open DateTime")
            {
                ApplicationArea = All;

            }
            field("MBB Packet Close DateTime"; "MBB Packet Close DateTime")
            {
                ApplicationArea = All;

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