page 60195 "Posted Material Issue List"
{
    // version MI1.0,Rev01

    CardPageID = "Posted Material Issue";
    Editable = false;
    PageType = List;
    Permissions = TableData "Posted Material Issues Header" = rim;
    SourceTable = "Posted Material Issues Header";

    layout
    {
        area(content)
        {
            field("xRec.COUNT"; xRec.COUNT)
            {
                Style = Standard;
                StyleExpr = TRUE;
            }
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("No."; "No.")
                {
                }
                field("Transfer-from Code"; "Transfer-from Code")
                {
                }
                field("Transfer-to Code"; "Transfer-to Code")
                {
                }
                field(Status; Status)
                {
                }
                field("Posted By"; "Posted By")
                {
                }
                field("Prod. BOM No."; "Prod. BOM No.")
                {
                }
                field("Sales Order No."; "Sales Order No.")
                {
                }
                field("Issued DateTime"; "Issued DateTime")
                {
                }
                field("Receipt Date"; "Receipt Date")
                {
                }
                field("Reason Code"; "Reason Code")
                {
                }
                field("Posting Date"; "Posting Date")
                {
                }
                field("Prod. Order No."; "Prod. Order No.")
                {
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                }
                field("Material Picked Date"; "Material Picked Date")
                {
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                }
                field("Prod. Order Line No."; "Prod. Order Line No.")
                {
                }
                field("Material Issue No."; "Material Issue No.")
                {
                }
                field("User ID"; "User ID")
                {
                }
                field("Resource Name"; "Resource Name")
                {
                }
                field("Required Date"; "Required Date")
                {
                }
                field("Released Date"; "Released Date")
                {
                }
                field("Released By"; "Released By")
                {
                }
                field("Transaction ID"; "Transaction ID")
                {
                }
                field("Customer No"; "Customer No")
                {
                }
                field("Service Order No."; "Service Order No.")
                {
                }
                field("Service Item"; "Service Item")
                {
                }
                field("Material Picked"; "Material Picked")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Issues")
            {
                Caption = '&Issues';
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Image = Comment;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Inventory Comment Sheet";
                    RunPageLink = Document Type=CONST(Posted Material Issues),No.=FIELD(No.);
                }
            }
        }
        area(processing)
        {
            action("&Navigate")
            {
                Caption = '&Navigate';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    Navigate;
                end;
            }
            action("Modify Issued User")
            {
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    // Added by rakesh to call the form for changing the USer ID in Posted Material Issues on 6-Dec-14
                    PAGE.RUN(50010);
                    // end by Rakesh
                end;
            }
        }
    }
}

