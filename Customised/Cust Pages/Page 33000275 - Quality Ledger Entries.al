page 33000275 "Quality Ledger Entries"
{
    // version QC1.0

    Editable = true;
    PageType = List;
    SourceTable = "Quality Ledger Entry";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Entry No.";"Entry No.")
                {
                }
                field("Item No.";"Item No.")
                {
                }
                field("Sub Assembly Code";"Sub Assembly Code")
                {
                }
                field("Serial No.";"Serial No.")
                {
                    Editable = true;
                }
                field("Lot No.";"Lot No.")
                {
                }
                field("Posting Date";"Posting Date")
                {
                }
                field("Entry Type";"Entry Type")
                {
                }
                field("Source No.";"Source No.")
                {
                }
                field("Order Line No.";"Order Line No.")
                {
                }
                field("Document No.";"Document No.")
                {
                }
                field(Description;Description)
                {
                }
                field("Location Code";"Location Code")
                {
                }
                field(Quantity;Quantity)
                {
                }
                field("Remaining Quantity";"Remaining Quantity")
                {
                }
                field("Applies-to Entry";"Applies-to Entry")
                {
                }
                field(Open;Open)
                {
                }
                field(Positive;Positive)
                {
                }
                field("Source Type";"Source Type")
                {
                }
                field("Applies-To- QLE- Entry";"Applies-To- QLE- Entry")
                {
                }
                field("Reason Description";"Reason Description")
                {
                }
                field("In bound Item Ledger Entry No.";"In bound Item Ledger Entry No.")
                {
                }
                field("Item Ledger Entry No.";"Item Ledger Entry No.")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage();
    begin

        IF USERID IN['EFFTRONICS\RAKESHT','EFFTRONICS\B2BOTS'] THEN
          CurrPage.EDITABLE:=TRUE
        ELSE
          CurrPage.EDITABLE:=FALSE;
    end;
}

