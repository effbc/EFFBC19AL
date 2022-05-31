page 60025 "Product Card"
{
    // version B2B1.0,Rev01

    PageType = Card;
    SourceTable = Products;

    layout
    {
        area(content)
        {
            group(Products)
            {
                Caption = 'Products';
                field("Code"; Code)
                {
                }
                field("Product Type"; "Product Type")
                {
                }
                field(Description; Description)
                {
                }
                field(Technology; Technology)
                {
                }
                field("Key Features"; "Key Features")
                {
                }
                field("Launched Year"; "Launched Year")
                {
                }
                field("Tools Used"; "Tools Used")
                {
                }
                field(Benefits; Benefits)
                {
                }
                field(Segment; Segment)
                {
                }
                field(Price; Price)
                {
                }
                field("Software Code"; "Software Code")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Products")
            {
                Caption = '&Products';
                separator(Action1102152026)
                {
                }
                action("&Comments")
                {
                    Caption = '&Comments';
                    RunObject = Page "Rlshp. Mgt. Comment Sheet";
                    RunPageLink = Table Name=CONST(Products),No.=FIELD(Code);
                }
                separator(Action1102152030)
                {
                }
                action("&Attachments")
                {
                    Caption = '&Attachments';

                    trigger OnAction();
                    begin
                        OpenAttachments;
                    end;
                }
            }
            group("&Details")
            {
                Caption = '&Details';
                action("Product C&ompetitors")
                {
                    Caption = 'Product C&ompetitors';
                    RunObject = Page "Product Competitors Details";
                                    RunPageLink = Product Code=FIELD(Code);
                }
                separator(Action1102152023)
                {
                }
                action("Product C&ustomers List")
                {
                    Caption = 'Product C&ustomers List';
                    RunObject = Page "Product Customer's list";
                                    RunPageLink = SMTP Server name=FIELD(Code);

                    trigger OnAction();
                    var
                        SalesShipmentLine : Record "Sales Shipment Line";
                        Customer : Record Customer;
                        CustomerList : Record "SMTP SETUP";
                        CustomerList1 : Record "SMTP SETUP";
                    begin
                        SalesShipmentLine.SETRANGE(SalesShipmentLine."No.",Code);
                        IF SalesShipmentLine.FINDSET THEN
                          REPEAT
                            Customer.SETRANGE("No.",SalesShipmentLine."Sell-to Customer No.");
                            IF Customer.FINDFIRST THEN;
                          UNTIL SalesShipmentLine.NEXT = 0;
                    end;
                }
            }
        }
        area(processing)
        {
            action(Comment)
            {
                Caption = 'Comment';
                Image = Comment;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Rlshp. Mgt. Comment Sheet";
                                RunPageLink = Table Name=CONST(Products),No.=FIELD(Code);
                ToolTip = 'Comment';
            }
        }
    }
}

