page 60059 "RGP Out List"
{
    // version B2B1.0,Cal1.0

    CardPageID = "Posted RGP Out";
    Editable = false;
    PageType = List;
    SourceTable = "RGP Out Header";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("RGP Out No.";"RGP Out No.")
                {
                }
                field("RGP Date";"RGP Date")
                {
                }
                field("RGP Posting Date";"RGP Posting Date")
                {
                }
                field(Consignee;Consignee)
                {
                }
                field("Consignee No.";"Consignee No.")
                {
                }
                field("Consignee Name";"Consignee Name")
                {
                }
                field(Address;Address)
                {
                }
                field("Consignee City";"Consignee City")
                {
                }
                field("Consignee Contact";"Consignee Contact")
                {
                }
                field(Status;Status)
                {
                }
                field("No. Series";"No. Series")
                {
                }
                field("Equipment No";"Equipment No")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Line")
            {
                Caption = '&Line';
                action(Card)
                {
                    Caption = 'Card';
                    ShortCutKey = 'Shift+F5';

                    trigger OnAction();
                    begin
                        PAGE.RUN(PAGE::"Posted RGP Out",Rec);
                    end;
                }
            }
        }
    }
}

